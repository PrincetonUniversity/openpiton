// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_tsasr_21_rand_s1.s
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
   random seed:	10314941
   Jal tlu_multi_tsasr_21.j:	
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

	setx 0xa662ac480000b9e1, %g1, %g0
	setx 0x0dcfcb040000cff8, %g1, %g1
	setx 0x3bb7507900004e8a, %g1, %g2
	setx 0x7ff4fa3200005952, %g1, %g3
	setx 0x5fc1319d0000698d, %g1, %g4
	setx 0xd516346a0000de58, %g1, %g5
	setx 0x0c327fe400006f37, %g1, %g6
	setx 0x54fb9dde0000e9d5, %g1, %g7
	setx 0x3bb770ab0000fb13, %g1, %r16
	setx 0x3145e1d30000bb57, %g1, %r17
	setx 0x4adfa44800001886, %g1, %r18
	setx 0x4435111300007cfc, %g1, %r19
	setx 0xb951bd5c00000b24, %g1, %r20
	setx 0xf4404ab50000cb8f, %g1, %r21
	setx 0x76c3c34a0000490b, %g1, %r22
	setx 0x92beb32e00006af9, %g1, %r23
	setx 0xab9f4a2e00006b32, %g1, %r24
	setx 0x12c5e10700001907, %g1, %r25
	setx 0xd4c6801000001a5d, %g1, %r26
	setx 0x2e688fff0000cce9, %g1, %r27
	setx 0x1a11044d0000a9ef, %g1, %r28
	setx 0x3066291100005f3d, %g1, %r29
	setx 0x71b55be4000058f6, %g1, %r30
	setx 0xdc836f6e0000ba75, %g1, %r31
	save
	setx 0xc85abcfb00009847, %g1, %r16
	setx 0x9a51ba5500007aaf, %g1, %r17
	setx 0xd2882f2c00001e16, %g1, %r18
	setx 0x1f8582c300004e46, %g1, %r19
	setx 0xa442e69d0000c990, %g1, %r20
	setx 0x2f79ffe700005fe9, %g1, %r21
	setx 0x133d9c15000028a6, %g1, %r22
	setx 0x0d49ce690000fedc, %g1, %r23
	setx 0x764aeb7d0000cf6b, %g1, %r24
	setx 0x62902c8e00001894, %g1, %r25
	setx 0x408244c600000fee, %g1, %r26
	setx 0x93b592d30000ea7e, %g1, %r27
	setx 0x58acea8500002c15, %g1, %r28
	setx 0x0588c76600001ede, %g1, %r29
	setx 0x48c7c8bf0000ee19, %g1, %r30
	setx 0xe62504d10000596a, %g1, %r31
	save
	setx 0xb68a77910000e933, %g1, %r16
	setx 0x2faa4c870000ddd0, %g1, %r17
	setx 0x5476ef850000ef64, %g1, %r18
	setx 0x7bec251600008ad5, %g1, %r19
	setx 0x63b742b900001edc, %g1, %r20
	setx 0x2100ca0500002c1f, %g1, %r21
	setx 0x870f402100000c0f, %g1, %r22
	setx 0x7fb1aca500009eb6, %g1, %r23
	setx 0x2072aa8900001ac3, %g1, %r24
	setx 0x0e7a419d00005c96, %g1, %r25
	setx 0x56560cd20000ea5a, %g1, %r26
	setx 0xb13b861400004abf, %g1, %r27
	setx 0xa01ff4c80000ef6f, %g1, %r28
	setx 0x5d24815f0000f9da, %g1, %r29
	setx 0x2a62e43200004974, %g1, %r30
	setx 0x4b5ff6fb0000bded, %g1, %r31
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
	.word 0xbfa709c0  ! 1: FDIVd	fdivd	%f28, %f0, %f62
	.word 0x83966000  ! 2: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xaf508000  ! 3: RDPR_TSTATE	<illegal instruction>
	.word 0xada00560  ! 4: FSQRTq	fsqrt	
	.word 0xbba00540  ! 5: FSQRTd	fsqrt	
	.word 0xbda50840  ! 6: FADDd	faddd	%f20, %f0, %f30
	.word 0x87952000  ! 7: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x85956000  ! 8: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xaba74840  ! 9: FADDd	faddd	%f60, %f0, %f52
	.word 0x81956000  ! 10: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x81976000  ! 11: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa1508000  ! 12: RDPR_TSTATE	<illegal instruction>
	.word 0xbda448e0  ! 13: FSUBq	dis not found

	.word 0xb3504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 16: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbba58960  ! 17: FMULq	dis not found

	.word 0x8595a000  ! 18: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x81966000  ! 19: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x85942000  ! 20: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xab508000  ! 21: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 22: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8197e000  ! 23: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87946000  ! 24: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x85962000  ! 25: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa550c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 27: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 28: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8797a000  ! 29: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x83952000  ! 30: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xaf500000  ! 31: RDPR_TPC	<illegal instruction>
	.word 0xaba00520  ! 32: FSQRTs	fsqrt	
	.word 0xab50c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 34: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 35: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 36: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8595e000  ! 37: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbb504000  ! 38: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 39: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa1500000  ! 40: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 41: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x87962000  ! 42: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8597e000  ! 43: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x83952000  ! 44: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb3a00560  ! 45: FSQRTq	fsqrt	
	.word 0xb5a70940  ! 46: FMULd	fmuld	%f28, %f0, %f26
	.word 0xafa789c0  ! 47: FDIVd	fdivd	%f30, %f0, %f54
	.word 0x85962000  ! 48: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x81962000  ! 49: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa3504000  ! 50: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 51: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8797e000  ! 52: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa3a00560  ! 53: FSQRTq	fsqrt	
	.word 0xbf50c000  ! 54: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 55: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa5a74920  ! 56: FMULs	fmuls	%f29, %f0, %f18
	.word 0xb3500000  ! 57: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 58: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x81976000  ! 59: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8795e000  ! 60: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x81956000  ! 61: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb508000  ! 62: RDPR_TSTATE	<illegal instruction>
	.word 0xab504000  ! 63: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 64: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa7a00520  ! 65: FSQRTs	fsqrt	
	.word 0xbda489c0  ! 66: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb7500000  ! 67: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 68: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xab500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a60820  ! 71: FADDs	fadds	%f24, %f0, %f16
	.word 0x81946000  ! 72: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb5508000  ! 73: RDPR_TSTATE	<illegal instruction>
	.word 0x8394a000  ! 74: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xaf50c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 76: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 77: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb1500000  ! 78: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 79: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 81: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb5a6c840  ! 82: FADDd	faddd	%f58, %f0, %f26
	.word 0x87952000  ! 83: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa9500000  ! 84: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 85: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7a6c9a0  ! 86: FDIVs	fdivs	%f27, %f0, %f27
	.word 0xa7500000  ! 87: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 88: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xab500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 90: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa3a00560  ! 91: FSQRTq	fsqrt	
	.word 0xb550c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0x87942000  ! 93: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x87966000  ! 94: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8595e000  ! 95: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa150c000  ! 96: RDPR_TT	<illegal instruction>
	.word 0xaba609e0  ! 97: FDIVq	dis not found

	.word 0xb5500000  ! 98: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0x81952000  ! 100: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb3504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a000  ! 104: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xaf50c000  ! 105: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 106: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 107: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xbda548c0  ! 108: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xa5a68960  ! 109: FMULq	dis not found

	.word 0xb3504000  ! 110: RDPR_TNPC	<illegal instruction>
	.word 0xa5a449c0  ! 111: FDIVd	fdivd	%f48, %f0, %f18
	.word 0x8395a000  ! 112: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb150c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xb9a5c840  ! 114: FADDd	faddd	%f54, %f0, %f28
	.word 0xb9508000  ! 115: RDPR_TSTATE	<illegal instruction>
	.word 0x85962000  ! 116: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8396e000  ! 117: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3a00540  ! 118: FSQRTd	fsqrt	
	.word 0x83952000  ! 119: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbba788e0  ! 120: FSUBq	dis not found

	.word 0xa9a6c9a0  ! 121: FDIVs	fdivs	%f27, %f0, %f20
	.word 0xb7508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0x8795e000  ! 123: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87952000  ! 124: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8394e000  ! 125: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa9504000  ! 126: RDPR_TNPC	<illegal instruction>
	.word 0x81952000  ! 127: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbf500000  ! 128: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x87942000  ! 129: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x87946000  ! 130: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa7a00560  ! 131: FSQRTq	fsqrt	
	.word 0xb7a4c9a0  ! 132: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb5a50940  ! 133: FMULd	fmuld	%f20, %f0, %f26
	.word 0x81976000  ! 134: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8194e000  ! 135: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8596e000  ! 136: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb3a548a0  ! 137: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xada708e0  ! 138: FSUBq	dis not found

	.word 0xbf508000  ! 139: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0xbda48860  ! 141: FADDq	dis not found

	.word 0x8597e000  ! 142: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85942000  ! 143: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa750c000  ! 144: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 145: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 146: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 148: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb150c000  ! 149: RDPR_TT	<illegal instruction>
	.word 0xb9a64840  ! 150: FADDd	faddd	%f56, %f0, %f28
	.word 0xbf50c000  ! 151: RDPR_TT	<illegal instruction>
	.word 0xb1a00520  ! 152: FSQRTs	fsqrt	
	.word 0xb5a749e0  ! 153: FDIVq	dis not found

	.word 0xab50c000  ! 154: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 155: RDPR_TSTATE	<illegal instruction>
	.word 0xaf508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 158: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x81972000  ! 159: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8797e000  ! 160: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8594a000  ! 161: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa7a40940  ! 162: FMULd	fmuld	%f16, %f0, %f50
	.word 0x8195a000  ! 163: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa550c000  ! 164: RDPR_TT	<illegal instruction>
	.word 0x8794a000  ! 165: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbf504000  ! 166: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 169: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb9500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 171: RDPR_TT	<illegal instruction>
	.word 0xb3a64940  ! 172: FMULd	fmuld	%f56, %f0, %f56
	.word 0x81976000  ! 173: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa5500000  ! 174: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xb7a74960  ! 176: FMULq	dis not found

	.word 0xb9500000  ! 177: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 178: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xaf504000  ! 179: RDPR_TNPC	<illegal instruction>
	.word 0xa3500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 181: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8795e000  ! 182: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8594e000  ! 183: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8197e000  ! 184: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8795a000  ! 185: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa1508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 187: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbda5c9c0  ! 188: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xaf508000  ! 189: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 190: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb5500000  ! 191: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 192: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87972000  ! 193: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8195e000  ! 194: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xada00520  ! 195: FSQRTs	fsqrt	
	.word 0x8594a000  ! 196: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87962000  ! 197: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa3508000  ! 198: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 199: RDPR_TNPC	<illegal instruction>
	.word 0xbda00540  ! 200: FSQRTd	fsqrt	
	.word 0xab500000  ! 201: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 202: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa1508000  ! 203: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 204: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 205: RDPR_TPC	<illegal instruction>
	.word 0x8195e000  ! 206: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9a648e0  ! 207: FSUBq	dis not found

	.word 0x83942000  ! 208: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb5500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 210: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xaf504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 212: RDPR_TNPC	<illegal instruction>
	.word 0x87946000  ! 213: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbb504000  ! 214: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 215: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 216: RDPR_TT	<illegal instruction>
	.word 0xa7a7c840  ! 217: FADDd	faddd	%f62, %f0, %f50
	.word 0xbba509c0  ! 218: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xbba00560  ! 219: FSQRTq	fsqrt	
	.word 0xa7a488a0  ! 220: FSUBs	fsubs	%f18, %f0, %f19
	.word 0xb1a488a0  ! 221: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xab504000  ! 222: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 223: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb9a44960  ! 224: FMULq	dis not found

	.word 0xa3a78960  ! 225: FMULq	dis not found

	.word 0xb3504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0x87956000  ! 227: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb1500000  ! 228: RDPR_TPC	<illegal instruction>
	.word 0xa1a70860  ! 229: FADDq	dis not found

	.word 0xa9504000  ! 230: RDPR_TNPC	<illegal instruction>
	.word 0xb5a00540  ! 231: FSQRTd	fsqrt	
	.word 0xb3504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 233: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb5500000  ! 234: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 235: RDPR_TSTATE	<illegal instruction>
	.word 0x81962000  ! 236: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa7a54860  ! 237: FADDq	dis not found

	.word 0xbf50c000  ! 238: RDPR_TT	<illegal instruction>
	.word 0xaba4c960  ! 239: FMULq	dis not found

	.word 0x8194a000  ! 240: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbfa00540  ! 241: FSQRTd	fsqrt	
	.word 0xa5508000  ! 242: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 243: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 244: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xaf508000  ! 245: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xa5a749a0  ! 247: FDIVs	fdivs	%f29, %f0, %f18
	.word 0xaba00540  ! 248: FSQRTd	fsqrt	
	.word 0xbba709e0  ! 249: FDIVq	dis not found

	.word 0x8197e000  ! 250: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa350c000  ! 251: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 252: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb5504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xa9508000  ! 254: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 255: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xab500000  ! 256: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0x81952000  ! 258: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa750c000  ! 259: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 261: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8596e000  ! 262: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb9a648c0  ! 263: FSUBd	fsubd	%f56, %f0, %f28
	.word 0xb3508000  ! 264: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 265: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xa5a00540  ! 267: FSQRTd	fsqrt	
	.word 0xafa508c0  ! 268: FSUBd	fsubd	%f20, %f0, %f54
	.word 0xbd500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 270: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 271: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb950c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 273: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 274: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa3504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 276: RDPR_TNPC	<illegal instruction>
	.word 0xb3a6c8c0  ! 277: FSUBd	fsubd	%f58, %f0, %f56
	.word 0xbf500000  ! 278: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 280: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa1500000  ! 281: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 283: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 284: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa9504000  ! 285: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 286: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb7500000  ! 287: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 288: RDPR_TNPC	<illegal instruction>
	.word 0xbda688c0  ! 289: FSUBd	fsubd	%f26, %f0, %f30
	.word 0xad504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 291: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8597a000  ! 292: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb7a00560  ! 293: FSQRTq	fsqrt	
	.word 0x8796e000  ! 294: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbda789a0  ! 295: FDIVs	fdivs	%f30, %f0, %f30
	.word 0x83966000  ! 296: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa3a00540  ! 297: FSQRTd	fsqrt	
	.word 0x8594e000  ! 298: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87946000  ! 299: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x87952000  ! 300: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x87962000  ! 301: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xaf500000  ! 302: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 303: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7508000  ! 304: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 305: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbfa78860  ! 306: FADDq	dis not found

	.word 0xbd504000  ! 307: RDPR_TNPC	<illegal instruction>
	.word 0x85966000  ! 308: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8597e000  ! 309: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa1a709a0  ! 310: FDIVs	fdivs	%f28, %f0, %f16
	.word 0xa3a609a0  ! 311: FDIVs	fdivs	%f24, %f0, %f17
	.word 0xbba44940  ! 312: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb5a00520  ! 313: FSQRTs	fsqrt	
	.word 0xa1508000  ! 314: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 315: RDPR_TSTATE	<illegal instruction>
	.word 0xad508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 317: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 318: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8795e000  ! 319: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xaf508000  ! 320: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 321: RDPR_TPC	<illegal instruction>
	.word 0xa5a54920  ! 322: FMULs	fmuls	%f21, %f0, %f18
	.word 0x83972000  ! 323: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x83956000  ! 324: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xab50c000  ! 325: RDPR_TT	<illegal instruction>
	.word 0xafa7c8e0  ! 326: FSUBq	dis not found

	.word 0xb9504000  ! 327: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 328: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 329: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0xbda708a0  ! 331: FSUBs	fsubs	%f28, %f0, %f30
	.word 0xb3a7c860  ! 332: FADDq	dis not found

	.word 0xb5a00540  ! 333: FSQRTd	fsqrt	
	.word 0x83952000  ! 334: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8596e000  ! 335: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa9500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 337: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 338: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa5a48960  ! 339: FMULq	dis not found

	.word 0x8197a000  ! 340: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x85956000  ! 341: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x81942000  ! 342: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8594a000  ! 343: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa9508000  ! 344: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 345: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 346: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa9500000  ! 347: RDPR_TPC	<illegal instruction>
	.word 0xad504000  ! 348: RDPR_TNPC	<illegal instruction>
	.word 0x8595e000  ! 349: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7504000  ! 350: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 351: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa750c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 353: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x81946000  ! 354: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa7a00560  ! 355: FSQRTq	fsqrt	
	.word 0x85946000  ! 356: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb5a00560  ! 357: FSQRTq	fsqrt	
	.word 0x81966000  ! 358: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb9a00540  ! 359: FSQRTd	fsqrt	
	.word 0x83976000  ! 360: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81956000  ! 361: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xab50c000  ! 362: RDPR_TT	<illegal instruction>
	.word 0x87976000  ! 363: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8794e000  ! 364: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x85952000  ! 365: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb7504000  ! 366: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 367: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb1508000  ! 368: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 371: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb5500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xbfa00560  ! 373: FSQRTq	fsqrt	
	.word 0x83946000  ! 374: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8796a000  ! 375: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1a749a0  ! 376: FDIVs	fdivs	%f29, %f0, %f24
	.word 0xa150c000  ! 377: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xa3a6c8c0  ! 379: FSUBd	fsubd	%f58, %f0, %f48
	.word 0x8397a000  ! 380: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8796a000  ! 381: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1500000  ! 382: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 383: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8197e000  ! 384: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa1504000  ! 385: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 386: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbfa649c0  ! 387: FDIVd	fdivd	%f56, %f0, %f62
	.word 0x81976000  ! 388: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x83946000  ! 389: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xab50c000  ! 390: RDPR_TT	<illegal instruction>
	.word 0xad504000  ! 391: RDPR_TNPC	<illegal instruction>
	.word 0xb9a78940  ! 392: FMULd	fmuld	%f30, %f0, %f28
	.word 0x8394a000  ! 393: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbb508000  ! 394: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 395: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87962000  ! 396: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa3a00560  ! 397: FSQRTq	fsqrt	
	.word 0x87946000  ! 398: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbda588e0  ! 399: FSUBq	dis not found

	.word 0xaba448e0  ! 400: FSUBq	dis not found

	.word 0xb1500000  ! 401: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 402: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xad504000  ! 403: RDPR_TNPC	<illegal instruction>
	.word 0xb5a68940  ! 404: FMULd	fmuld	%f26, %f0, %f26
	.word 0xb3508000  ! 405: RDPR_TSTATE	<illegal instruction>
	.word 0x8396a000  ! 406: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa550c000  ! 407: RDPR_TT	<illegal instruction>
	.word 0x8194e000  ! 408: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x83952000  ! 409: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8395a000  ! 410: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xad508000  ! 411: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 412: RDPR_TT	<illegal instruction>
	.word 0xaba648a0  ! 413: FSUBs	fsubs	%f25, %f0, %f21
	.word 0x85966000  ! 414: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x83952000  ! 415: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb50c000  ! 416: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 417: RDPR_TPC	<illegal instruction>
	.word 0xbda7c9c0  ! 418: FDIVd	fdivd	%f62, %f0, %f30
	.word 0xa5a00560  ! 419: FSQRTq	fsqrt	
	.word 0x83952000  ! 420: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8796e000  ! 421: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xada648e0  ! 422: FSUBq	dis not found

	.word 0x8595e000  ! 423: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa150c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xa7504000  ! 425: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 427: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 428: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbd50c000  ! 429: RDPR_TT	<illegal instruction>
	.word 0x87972000  ! 430: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8396e000  ! 431: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa7500000  ! 432: RDPR_TPC	<illegal instruction>
	.word 0xa950c000  ! 433: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0xada00560  ! 435: FSQRTq	fsqrt	
	.word 0xbda608e0  ! 436: FSUBq	dis not found

	.word 0x85972000  ! 437: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbd50c000  ! 438: RDPR_TT	<illegal instruction>
	.word 0x8194e000  ! 439: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xad508000  ! 440: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0xbd504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 443: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa7504000  ! 444: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 445: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 446: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 447: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa1a68860  ! 448: FADDq	dis not found

	.word 0xa1a68960  ! 449: FMULq	dis not found

	.word 0xa9508000  ! 450: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xada549a0  ! 452: FDIVs	fdivs	%f21, %f0, %f22
	.word 0xbd500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 454: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x81956000  ! 455: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x85942000  ! 456: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8194a000  ! 457: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8795a000  ! 458: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xaba7c860  ! 459: FADDq	dis not found

	.word 0x83966000  ! 460: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa9500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0xb3a00540  ! 462: FSQRTd	fsqrt	
	.word 0xa550c000  ! 463: RDPR_TT	<illegal instruction>
	.word 0xaba5c9e0  ! 464: FDIVq	dis not found

	.word 0x81952000  ! 465: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8797a000  ! 466: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x87946000  ! 467: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa150c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0x8396e000  ! 469: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xab50c000  ! 470: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 473: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaf508000  ! 474: RDPR_TSTATE	<illegal instruction>
	.word 0xbba4c8a0  ! 475: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xbb504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 477: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8396a000  ! 478: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x81946000  ! 479: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb1504000  ! 480: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 481: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8195a000  ! 482: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb5504000  ! 483: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 484: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa1508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xafa00560  ! 487: FSQRTq	fsqrt	
	.word 0xa5a689a0  ! 488: FDIVs	fdivs	%f26, %f0, %f18
	.word 0xa1504000  ! 489: RDPR_TNPC	<illegal instruction>
	.word 0xa9500000  ! 490: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 491: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 492: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbda408c0  ! 493: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xbda64940  ! 494: FMULd	fmuld	%f56, %f0, %f30
	.word 0xb5508000  ! 495: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a708a0  ! 496: FSUBs	fsubs	%f28, %f0, %f17
	.word 0x8595a000  ! 497: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85952000  ! 498: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x87952000  ! 499: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb5508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0x81946000  ! 501: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbf504000  ! 502: RDPR_TNPC	<illegal instruction>
	.word 0xb3a549c0  ! 503: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xa950c000  ! 504: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 505: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 506: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 507: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 509: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbda488e0  ! 510: FSUBq	dis not found

	.word 0xa9a748c0  ! 511: FSUBd	fsubd	%f60, %f0, %f20
	.word 0xa7a648a0  ! 512: FSUBs	fsubs	%f25, %f0, %f19
	.word 0xbf508000  ! 513: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 514: RDPR_TSTATE	<illegal instruction>
	.word 0x8397a000  ! 515: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb7a74820  ! 516: FADDs	fadds	%f29, %f0, %f27
	.word 0x81962000  ! 517: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8194e000  ! 518: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbb500000  ! 519: RDPR_TPC	<illegal instruction>
	.word 0xab50c000  ! 520: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 521: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x81942000  ! 522: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbf504000  ! 523: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 525: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbf500000  ! 526: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 527: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa1508000  ! 528: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 530: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb1504000  ! 531: RDPR_TNPC	<illegal instruction>
	.word 0xa9a748c0  ! 532: FSUBd	fsubd	%f60, %f0, %f20
	.word 0xb1500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0xa5504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x85952000  ! 535: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa350c000  ! 536: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 537: RDPR_TSTATE	<illegal instruction>
	.word 0xaba60920  ! 538: FMULs	fmuls	%f24, %f0, %f21
	.word 0xb5508000  ! 539: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 541: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 543: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x81972000  ! 544: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb9500000  ! 545: RDPR_TPC	<illegal instruction>
	.word 0xb7504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 547: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 548: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8594a000  ! 549: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa7504000  ! 550: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 551: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbba68960  ! 552: FMULq	dis not found

	.word 0x83976000  ! 553: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xaf504000  ! 554: RDPR_TNPC	<illegal instruction>
	.word 0xada4c840  ! 555: FADDd	faddd	%f50, %f0, %f22
	.word 0x87942000  ! 556: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbfa448c0  ! 557: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xada7c820  ! 558: FADDs	fadds	%f31, %f0, %f22
	.word 0xaf50c000  ! 559: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 560: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xaf500000  ! 561: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 562: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8796e000  ! 563: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8597e000  ! 564: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb1a00520  ! 565: FSQRTs	fsqrt	
	.word 0xbd508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 567: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 568: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 569: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8396e000  ! 570: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x83942000  ! 571: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb3a00560  ! 572: FSQRTq	fsqrt	
	.word 0xb750c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 574: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 575: RDPR_TNPC	<illegal instruction>
	.word 0xa9a68860  ! 576: FADDq	dis not found

	.word 0x87972000  ! 577: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x83946000  ! 578: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa5504000  ! 579: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 580: RDPR_TT	<illegal instruction>
	.word 0xa5504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 582: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 583: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x85946000  ! 584: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb750c000  ! 585: RDPR_TT	<illegal instruction>
	.word 0xa150c000  ! 586: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 587: RDPR_TT	<illegal instruction>
	.word 0xafa4c820  ! 588: FADDs	fadds	%f19, %f0, %f23
	.word 0x81962000  ! 589: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xafa609c0  ! 590: FDIVd	fdivd	%f24, %f0, %f54
	.word 0x8394a000  ! 591: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb1a68960  ! 592: FMULq	dis not found

	.word 0xad50c000  ! 593: RDPR_TT	<illegal instruction>
	.word 0x81976000  ! 594: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa1500000  ! 595: RDPR_TPC	<illegal instruction>
	.word 0x87942000  ! 596: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x81972000  ! 597: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa5a749a0  ! 598: FDIVs	fdivs	%f29, %f0, %f18
	.word 0x83942000  ! 599: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb3504000  ! 600: RDPR_TNPC	<illegal instruction>
	.word 0xb7a40940  ! 601: FMULd	fmuld	%f16, %f0, %f58
	.word 0xafa6c9c0  ! 602: FDIVd	fdivd	%f58, %f0, %f54
	.word 0x8397e000  ! 603: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xaf504000  ! 604: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xada00540  ! 608: FSQRTd	fsqrt	
	.word 0xb7508000  ! 609: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x83962000  ! 610: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb9500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xada609a0  ! 612: FDIVs	fdivs	%f24, %f0, %f22
	.word 0xb5508000  ! 613: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 614: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x81946000  ! 615: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8396a000  ! 616: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x87942000  ! 617: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb5508000  ! 618: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xa3a64840  ! 620: FADDd	faddd	%f56, %f0, %f48
	.word 0xad504000  ! 621: RDPR_TNPC	<illegal instruction>
	.word 0xb7a50920  ! 622: FMULs	fmuls	%f20, %f0, %f27
	.word 0x8397a000  ! 623: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa950c000  ! 624: RDPR_TT	<illegal instruction>
	.word 0xb1a549a0  ! 625: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xa7504000  ! 626: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 627: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa3508000  ! 628: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a748e0  ! 629: FSUBq	dis not found

	.word 0xaf508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xbd50c000  ! 632: RDPR_TT	<illegal instruction>
	.word 0xaf504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 634: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb150c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 636: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 637: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8594a000  ! 638: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xaf500000  ! 639: RDPR_TPC	<illegal instruction>
	.word 0xa7500000  ! 640: RDPR_TPC	<illegal instruction>
	.word 0xa1504000  ! 641: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 642: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83966000  ! 643: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8595a000  ! 644: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8197e000  ! 645: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x83976000  ! 646: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa1a74940  ! 647: FMULd	fmuld	%f60, %f0, %f16
	.word 0x8796e000  ! 648: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa750c000  ! 649: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 651: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 652: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 653: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 655: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x83942000  ! 656: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa3500000  ! 657: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 658: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 659: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb50c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0xafa00520  ! 661: FSQRTs	fsqrt	
	.word 0xb950c000  ! 662: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 663: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbfa00520  ! 664: FSQRTs	fsqrt	
	.word 0x85972000  ! 665: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8796a000  ! 666: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x81956000  ! 667: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa9a508a0  ! 668: FSUBs	fsubs	%f20, %f0, %f20
	.word 0xa7508000  ! 669: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 671: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xbd504000  ! 672: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 673: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 674: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8594a000  ! 675: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa9500000  ! 676: RDPR_TPC	<illegal instruction>
	.word 0xa7a00560  ! 677: FSQRTq	fsqrt	
	.word 0xb3a5c8a0  ! 678: FSUBs	fsubs	%f23, %f0, %f25
	.word 0xb3508000  ! 679: RDPR_TSTATE	<illegal instruction>
	.word 0xbda40840  ! 680: FADDd	faddd	%f16, %f0, %f30
	.word 0x8195e000  ! 681: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x81962000  ! 682: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x87952000  ! 683: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbd50c000  ! 684: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 685: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x87952000  ! 686: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbb50c000  ! 687: RDPR_TT	<illegal instruction>
	.word 0x85956000  ! 688: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85966000  ! 689: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x85956000  ! 690: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb3508000  ! 691: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 692: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 693: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x85972000  ! 694: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x87966000  ! 695: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb9a00540  ! 696: FSQRTd	fsqrt	
	.word 0xb550c000  ! 697: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 698: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb9504000  ! 699: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 700: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 701: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb9504000  ! 702: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 703: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 704: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 705: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa7500000  ! 706: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 707: RDPR_TT	<illegal instruction>
	.word 0xb9a78840  ! 708: FADDd	faddd	%f30, %f0, %f28
	.word 0xb1504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xb7a74960  ! 710: FMULq	dis not found

	.word 0x8595e000  ! 711: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8594e000  ! 712: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa5508000  ! 713: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xa7a00520  ! 715: FSQRTs	fsqrt	
	.word 0xab500000  ! 716: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 717: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb1504000  ! 718: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 719: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8395e000  ! 720: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8597e000  ! 721: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa7504000  ! 722: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 723: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x87942000  ! 725: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb150c000  ! 726: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 728: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbf508000  ! 729: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 730: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 731: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 732: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8597a000  ! 733: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbb504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 735: RDPR_TT	<illegal instruction>
	.word 0xb1a00560  ! 736: FSQRTq	fsqrt	
	.word 0xbb508000  ! 737: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 738: RDPR_TT	<illegal instruction>
	.word 0xa9a00520  ! 739: FSQRTs	fsqrt	
	.word 0xad508000  ! 740: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 741: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb3508000  ! 742: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 743: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a00520  ! 744: FSQRTs	fsqrt	
	.word 0xaba4c960  ! 745: FMULq	dis not found

	.word 0xb7500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x87942000  ! 747: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb550c000  ! 748: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 749: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xa1a64920  ! 751: FMULs	fmuls	%f25, %f0, %f16
	.word 0xbb50c000  ! 752: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 753: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8794e000  ! 754: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xaf500000  ! 755: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 758: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb5a00520  ! 759: FSQRTs	fsqrt	
	.word 0x83972000  ! 760: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa1508000  ! 761: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 762: RDPR_TT	<illegal instruction>
	.word 0xa9a00540  ! 763: FSQRTd	fsqrt	
	.word 0xaf50c000  ! 764: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 766: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbda409c0  ! 767: FDIVd	fdivd	%f16, %f0, %f30
	.word 0x87946000  ! 768: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb5508000  ! 769: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 770: RDPR_TPC	<illegal instruction>
	.word 0xab508000  ! 771: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 772: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 773: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb9508000  ! 774: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 775: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 777: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa1a00560  ! 778: FSQRTq	fsqrt	
	.word 0xa5a4c8e0  ! 779: FSUBq	dis not found

	.word 0x8594e000  ! 780: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb1500000  ! 781: RDPR_TPC	<illegal instruction>
	.word 0xbfa70960  ! 782: FMULq	dis not found

	.word 0xa5504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 785: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa3504000  ! 786: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 787: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 788: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x83976000  ! 789: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81966000  ! 790: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x85952000  ! 791: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x85952000  ! 792: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8196a000  ! 793: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa5504000  ! 794: RDPR_TNPC	<illegal instruction>
	.word 0xb3a70920  ! 795: FMULs	fmuls	%f28, %f0, %f25
	.word 0x8797e000  ! 796: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa9500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 798: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x81956000  ! 799: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 801: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 802: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 803: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87946000  ! 804: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb9a748e0  ! 805: FSUBq	dis not found

	.word 0x81976000  ! 806: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8394e000  ! 807: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8195e000  ! 808: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa7508000  ! 809: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0xb7a00540  ! 811: FSQRTd	fsqrt	
	.word 0xb9504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 813: RDPR_TT	<illegal instruction>
	.word 0xa1a00520  ! 814: FSQRTs	fsqrt	
	.word 0xbf50c000  ! 815: RDPR_TT	<illegal instruction>
	.word 0xa3a70860  ! 816: FADDq	dis not found

	.word 0x8395e000  ! 817: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb750c000  ! 818: RDPR_TT	<illegal instruction>
	.word 0xaf500000  ! 819: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 820: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb7a7c920  ! 821: FMULs	fmuls	%f31, %f0, %f27
	.word 0xa3508000  ! 822: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 823: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb350c000  ! 824: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 825: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbb500000  ! 826: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 827: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8795a000  ! 828: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbfa548c0  ! 829: FSUBd	fsubd	%f52, %f0, %f62
	.word 0x81966000  ! 830: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x81966000  ! 831: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb5504000  ! 832: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 834: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8597a000  ! 835: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbda00540  ! 836: FSQRTd	fsqrt	
	.word 0x8594a000  ! 837: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8596a000  ! 838: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbf508000  ! 839: RDPR_TSTATE	<illegal instruction>
	.word 0x87972000  ! 840: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8197a000  ! 841: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xad504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xada7c8c0  ! 843: FSUBd	fsubd	%f62, %f0, %f22
	.word 0xaba60960  ! 844: FMULq	dis not found

	.word 0x8795a000  ! 845: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x81942000  ! 846: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8394a000  ! 847: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa1508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 849: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb9508000  ! 850: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 851: RDPR_TPC	<illegal instruction>
	.word 0xafa609c0  ! 852: FDIVd	fdivd	%f24, %f0, %f54
	.word 0xada68820  ! 853: FADDs	fadds	%f26, %f0, %f22
	.word 0xa9a00540  ! 854: FSQRTd	fsqrt	
	.word 0xa1508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a5c8a0  ! 856: FSUBs	fsubs	%f23, %f0, %f18
	.word 0xa950c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 858: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa7504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 861: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8395e000  ! 862: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbd508000  ! 863: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 864: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 865: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 866: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbf50c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x8794e000  ! 868: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbd50c000  ! 869: RDPR_TT	<illegal instruction>
	.word 0xbfa7c9c0  ! 870: FDIVd	fdivd	%f62, %f0, %f62
	.word 0x8795e000  ! 871: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa9a448c0  ! 872: FSUBd	fsubd	%f48, %f0, %f20
	.word 0x87972000  ! 873: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa1a00520  ! 874: FSQRTs	fsqrt	
	.word 0x87972000  ! 875: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8195a000  ! 876: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xab500000  ! 877: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x8797a000  ! 879: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x85972000  ! 880: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xaf508000  ! 881: RDPR_TSTATE	<illegal instruction>
	.word 0x8796a000  ! 882: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb7a54940  ! 883: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb1a7c8c0  ! 884: FSUBd	fsubd	%f62, %f0, %f24
	.word 0xa1508000  ! 885: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 886: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xaba589a0  ! 887: FDIVs	fdivs	%f22, %f0, %f21
	.word 0xb7508000  ! 888: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 890: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 891: RDPR_TNPC	<illegal instruction>
	.word 0x8594a000  ! 892: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbba00520  ! 893: FSQRTs	fsqrt	
	.word 0xb5a50820  ! 894: FADDs	fadds	%f20, %f0, %f26
	.word 0xafa60860  ! 895: FADDq	dis not found

	.word 0x8397a000  ! 896: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa9508000  ! 897: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 898: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbd504000  ! 899: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 900: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 901: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x83956000  ! 902: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8596a000  ! 903: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87946000  ! 904: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa5504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xb3508000  ! 907: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a78820  ! 908: FADDs	fadds	%f30, %f0, %f18
	.word 0x8594a000  ! 909: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87946000  ! 910: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb1a748e0  ! 911: FSUBq	dis not found

	.word 0xab50c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 913: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x83976000  ! 914: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb9a548a0  ! 915: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xa1a4c8e0  ! 916: FSUBq	dis not found

	.word 0x83946000  ! 917: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x81956000  ! 918: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb9508000  ! 919: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 920: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8194e000  ! 921: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5a408a0  ! 922: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xa1508000  ! 923: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a60960  ! 924: FMULq	dis not found

	.word 0x8794e000  ! 925: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xaf50c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0xb7a00560  ! 927: FSQRTq	fsqrt	
	.word 0xa7a449a0  ! 928: FDIVs	fdivs	%f17, %f0, %f19
	.word 0x8394a000  ! 929: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa1504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 933: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8595a000  ! 934: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbf500000  ! 935: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 936: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb7a408e0  ! 937: FSUBq	dis not found

	.word 0x8196e000  ! 938: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa9a00560  ! 939: FSQRTq	fsqrt	
	.word 0x87966000  ! 940: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8595a000  ! 941: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbda449e0  ! 942: FDIVq	dis not found

	.word 0x83956000  ! 943: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x85976000  ! 944: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8794a000  ! 945: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8195a000  ! 946: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9500000  ! 947: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 948: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 949: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa00520  ! 950: FSQRTs	fsqrt	
	.word 0x83956000  ! 951: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa5a7c860  ! 952: FADDq	dis not found

	.word 0x8595e000  ! 953: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa3504000  ! 954: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 955: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbda48960  ! 956: FMULq	dis not found

	.word 0x85942000  ! 957: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8597a000  ! 958: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb5504000  ! 959: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 960: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8395e000  ! 961: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb1508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x8796e000  ! 963: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8395a000  ! 964: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbd500000  ! 965: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 966: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa5504000  ! 967: RDPR_TNPC	<illegal instruction>
	.word 0x8594a000  ! 968: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbf504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 971: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa9504000  ! 972: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 973: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 974: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 975: RDPR_TPC	<illegal instruction>
	.word 0xa7508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 977: RDPR_TT	<illegal instruction>
	.word 0xbda00540  ! 978: FSQRTd	fsqrt	
	.word 0xb150c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 980: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb950c000  ! 981: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 982: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbda5c960  ! 983: FMULq	dis not found

	.word 0x87972000  ! 984: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xad500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0xaba688c0  ! 986: FSUBd	fsubd	%f26, %f0, %f52
	.word 0xa3508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0xaba00540  ! 988: FSQRTd	fsqrt	
	.word 0xa9508000  ! 989: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 990: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa5a78840  ! 991: FADDd	faddd	%f30, %f0, %f18
	.word 0xbfa508c0  ! 992: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xa7504000  ! 993: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 995: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb7500000  ! 996: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x8594a000  ! 998: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
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
	.word 0xa9a589c0  ! 1: FDIVd	fdivd	%f22, %f0, %f20
	.word 0x8394a000  ! 2: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xab508000  ! 3: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xada00560  ! 4: FSQRTq	fsqrt	
	.word 0xbfa00540  ! 5: FSQRTd	fsqrt	
	.word 0xb3a60840  ! 6: FADDd	faddd	%f24, %f0, %f56
	.word 0x87942000  ! 7: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8595a000  ! 8: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb5a60840  ! 9: FADDd	faddd	%f24, %f0, %f26
	.word 0x8196e000  ! 10: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8196a000  ! 11: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xad508000  ! 12: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xbda548e0  ! 13: FSUBq	dis not found

	.word 0xbf504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 16: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa7a64960  ! 17: FMULq	dis not found

	.word 0x85976000  ! 18: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x81972000  ! 19: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x85972000  ! 20: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa3508000  ! 21: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8395a000  ! 22: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8196e000  ! 23: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x87976000  ! 24: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x85942000  ! 25: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb750c000  ! 26: RDPR_TT	rdpr	%tt, %r27
	.word 0xab508000  ! 27: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 28: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8795e000  ! 29: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8397a000  ! 30: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbb500000  ! 31: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbda00520  ! 32: FSQRTs	fsqrt	
	.word 0xbd50c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 34: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 35: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 36: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85972000  ! 37: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb1504000  ! 38: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8194a000  ! 39: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa3500000  ! 40: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x81946000  ! 41: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x87952000  ! 42: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x85946000  ! 43: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8395a000  ! 44: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xada00560  ! 45: FSQRTq	fsqrt	
	.word 0xa3a4c940  ! 46: FMULd	fmuld	%f50, %f0, %f48
	.word 0xbda509c0  ! 47: FDIVd	fdivd	%f20, %f0, %f30
	.word 0x8597e000  ! 48: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8194a000  ! 49: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb3504000  ! 50: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x87956000  ! 51: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8794a000  ! 52: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa9a00560  ! 53: FSQRTq	fsqrt	
	.word 0xbf50c000  ! 54: RDPR_TT	rdpr	%tt, %r31
	.word 0x8395e000  ! 55: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb1a70920  ! 56: FMULs	fmuls	%f28, %f0, %f24
	.word 0xa7500000  ! 57: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xa3508000  ! 58: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 59: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x87976000  ! 60: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8196a000  ! 61: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbb508000  ! 62: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb7504000  ! 63: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 64: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xada00520  ! 65: FSQRTs	fsqrt	
	.word 0xa1a789c0  ! 66: FDIVd	fdivd	%f30, %f0, %f16
	.word 0xbd500000  ! 67: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x8197e000  ! 68: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb7500000  ! 69: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb3508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0xada48820  ! 71: FADDs	fadds	%f18, %f0, %f22
	.word 0x8195a000  ! 72: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb5508000  ! 73: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x83962000  ! 74: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb750c000  ! 75: RDPR_TT	rdpr	%tt, %r27
	.word 0xb950c000  ! 76: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 77: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa3500000  ! 78: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x83942000  ! 79: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xab504000  ! 80: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x8394a000  ! 81: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa3a48840  ! 82: FADDd	faddd	%f18, %f0, %f48
	.word 0x87946000  ! 83: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbf500000  ! 84: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x81966000  ! 85: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbba509a0  ! 86: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xa1500000  ! 87: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8595a000  ! 88: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa3500000  ! 89: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x81976000  ! 90: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xafa00560  ! 91: FSQRTq	fsqrt	
	.word 0xa750c000  ! 92: RDPR_TT	rdpr	%tt, %r19
	.word 0x8795a000  ! 93: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x87966000  ! 94: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8597a000  ! 95: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xad50c000  ! 96: RDPR_TT	rdpr	%tt, %r22
	.word 0xb1a689e0  ! 97: FDIVq	dis not found

	.word 0xbf500000  ! 98: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 100: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb3504000  ! 101: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb750c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 104: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb750c000  ! 105: RDPR_TT	rdpr	%tt, %r27
	.word 0xbf504000  ! 106: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 107: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa5a748c0  ! 108: FSUBd	fsubd	%f60, %f0, %f18
	.word 0xaba4c960  ! 109: FMULq	dis not found

	.word 0xb1504000  ! 110: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb3a5c9c0  ! 111: FDIVd	fdivd	%f54, %f0, %f56
	.word 0x8396e000  ! 112: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa750c000  ! 113: RDPR_TT	rdpr	%tt, %r19
	.word 0xb3a48840  ! 114: FADDd	faddd	%f18, %f0, %f56
	.word 0xb3508000  ! 115: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 116: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x83962000  ! 117: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xada00540  ! 118: FSQRTd	fsqrt	
	.word 0x83942000  ! 119: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa1a748e0  ! 120: FSUBq	dis not found

	.word 0xa5a609a0  ! 121: FDIVs	fdivs	%f24, %f0, %f18
	.word 0xa5508000  ! 122: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8794a000  ! 123: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8794e000  ! 124: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8397a000  ! 125: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb7504000  ! 126: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x81976000  ! 127: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbf500000  ! 128: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x87956000  ! 129: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8796e000  ! 130: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb7a00560  ! 131: FSQRTq	fsqrt	
	.word 0xafa649a0  ! 132: FDIVs	fdivs	%f25, %f0, %f23
	.word 0xaba44940  ! 133: FMULd	fmuld	%f48, %f0, %f52
	.word 0x8194a000  ! 134: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8194a000  ! 135: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x85942000  ! 136: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb7a708a0  ! 137: FSUBs	fsubs	%f28, %f0, %f27
	.word 0xb1a448e0  ! 138: FSUBq	dis not found

	.word 0xaf508000  ! 139: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xa3504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0xada6c860  ! 141: FADDq	dis not found

	.word 0x85966000  ! 142: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x85962000  ! 143: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbb50c000  ! 144: RDPR_TT	rdpr	%tt, %r29
	.word 0xad508000  ! 145: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 146: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 148: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa950c000  ! 149: RDPR_TT	rdpr	%tt, %r20
	.word 0xa9a40840  ! 150: FADDd	faddd	%f16, %f0, %f20
	.word 0xa750c000  ! 151: RDPR_TT	<illegal instruction>
	.word 0xa5a00520  ! 152: FSQRTs	fsqrt	
	.word 0xa3a509e0  ! 153: FDIVq	dis not found

	.word 0xb950c000  ! 154: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 155: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 158: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x81972000  ! 159: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x87946000  ! 160: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8597a000  ! 161: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa1a60940  ! 162: FMULd	fmuld	%f24, %f0, %f16
	.word 0x81952000  ! 163: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb350c000  ! 164: RDPR_TT	rdpr	%tt, %r25
	.word 0x8797a000  ! 165: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb5504000  ! 166: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb950c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 169: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb1500000  ! 170: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xa350c000  ! 171: RDPR_TT	<illegal instruction>
	.word 0xa7a60940  ! 172: FMULd	fmuld	%f24, %f0, %f50
	.word 0x8196e000  ! 173: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9500000  ! 174: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xad504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xb3a68960  ! 176: FMULq	dis not found

	.word 0xa7500000  ! 177: RDPR_TPC	<illegal instruction>
	.word 0x8397e000  ! 178: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa9504000  ! 179: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xaf500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 181: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8797e000  ! 182: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85942000  ! 183: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8194a000  ! 184: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8797a000  ! 185: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xaf508000  ! 186: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x85942000  ! 187: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaba489c0  ! 188: FDIVd	fdivd	%f18, %f0, %f52
	.word 0xb9508000  ! 189: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8595e000  ! 190: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xad500000  ! 191: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x85972000  ! 192: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8796e000  ! 193: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x81942000  ! 194: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa9a00520  ! 195: FSQRTs	fsqrt	
	.word 0x8595e000  ! 196: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x87956000  ! 197: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb9508000  ! 198: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xa7504000  ! 199: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00540  ! 200: FSQRTd	fsqrt	
	.word 0xbb500000  ! 201: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 202: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb5508000  ! 203: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xa3508000  ! 204: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 205: RDPR_TPC	<illegal instruction>
	.word 0x81946000  ! 206: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb5a608e0  ! 207: FSUBq	dis not found

	.word 0x8397e000  ! 208: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbd500000  ! 209: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x8396e000  ! 210: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb1504000  ! 211: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xa5504000  ! 212: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 213: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa3504000  ! 214: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xbf50c000  ! 215: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 216: RDPR_TT	<illegal instruction>
	.word 0xb1a70840  ! 217: FADDd	faddd	%f28, %f0, %f24
	.word 0xa3a549c0  ! 218: FDIVd	fdivd	%f52, %f0, %f48
	.word 0xa5a00560  ! 219: FSQRTq	fsqrt	
	.word 0xb5a688a0  ! 220: FSUBs	fsubs	%f26, %f0, %f26
	.word 0xb7a788a0  ! 221: FSUBs	fsubs	%f30, %f0, %f27
	.word 0xab504000  ! 222: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 223: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbda5c960  ! 224: FMULq	dis not found

	.word 0xb1a64960  ! 225: FMULq	dis not found

	.word 0xa7504000  ! 226: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8797a000  ! 227: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbf500000  ! 228: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xbfa60860  ! 229: FADDq	dis not found

	.word 0xb9504000  ! 230: RDPR_TNPC	<illegal instruction>
	.word 0xbda00540  ! 231: FSQRTd	fsqrt	
	.word 0xb5504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 233: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xaf500000  ! 234: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa7508000  ! 235: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 236: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb5a48860  ! 237: FADDq	dis not found

	.word 0xb350c000  ! 238: RDPR_TT	rdpr	%tt, %r25
	.word 0xbfa48960  ! 239: FMULq	dis not found

	.word 0x8196a000  ! 240: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xafa00540  ! 241: FSQRTd	fsqrt	
	.word 0xa3508000  ! 242: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xb1500000  ! 243: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 244: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb3508000  ! 245: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xaf500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xa9a489a0  ! 247: FDIVs	fdivs	%f18, %f0, %f20
	.word 0xb3a00540  ! 248: FSQRTd	fsqrt	
	.word 0xb9a4c9e0  ! 249: FDIVq	dis not found

	.word 0x81972000  ! 250: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbd50c000  ! 251: RDPR_TT	rdpr	%tt, %r30
	.word 0x83976000  ! 252: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb1504000  ! 253: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb1508000  ! 254: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 255: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb3500000  ! 256: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa1508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0x8197e000  ! 258: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xaf50c000  ! 259: RDPR_TT	rdpr	%tt, %r23
	.word 0xa3508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0x81952000  ! 261: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x85962000  ! 262: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa3a6c8c0  ! 263: FSUBd	fsubd	%f58, %f0, %f48
	.word 0xa3508000  ! 264: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xb550c000  ! 265: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xbfa00540  ! 267: FSQRTd	fsqrt	
	.word 0xa7a448c0  ! 268: FSUBd	fsubd	%f48, %f0, %f50
	.word 0xbb500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 270: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 271: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa950c000  ! 272: RDPR_TT	rdpr	%tt, %r20
	.word 0xb1508000  ! 273: RDPR_TSTATE	<illegal instruction>
	.word 0x87966000  ! 274: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb3504000  ! 275: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xa5504000  ! 276: RDPR_TNPC	<illegal instruction>
	.word 0xada448c0  ! 277: FSUBd	fsubd	%f48, %f0, %f22
	.word 0xa5500000  ! 278: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 280: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb1500000  ! 281: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb550c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 283: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 284: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa5504000  ! 285: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x87962000  ! 286: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbb500000  ! 287: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbd504000  ! 288: RDPR_TNPC	<illegal instruction>
	.word 0xbda4c8c0  ! 289: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb9504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 291: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x85966000  ! 292: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb3a00560  ! 293: FSQRTq	fsqrt	
	.word 0x87972000  ! 294: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa1a489a0  ! 295: FDIVs	fdivs	%f18, %f0, %f16
	.word 0x8394e000  ! 296: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa3a00540  ! 297: FSQRTd	fsqrt	
	.word 0x85972000  ! 298: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8797e000  ! 299: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8795e000  ! 300: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87962000  ! 301: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xab500000  ! 302: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x8396e000  ! 303: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xaf508000  ! 304: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x85966000  ! 305: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb7a40860  ! 306: FADDq	dis not found

	.word 0xb9504000  ! 307: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x8597e000  ! 308: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8596a000  ! 309: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xaba649a0  ! 310: FDIVs	fdivs	%f25, %f0, %f21
	.word 0xa1a449a0  ! 311: FDIVs	fdivs	%f17, %f0, %f16
	.word 0xa7a40940  ! 312: FMULd	fmuld	%f16, %f0, %f50
	.word 0xb1a00520  ! 313: FSQRTs	fsqrt	
	.word 0xb5508000  ! 314: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xa5508000  ! 315: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 317: RDPR_TNPC	<illegal instruction>
	.word 0x83956000  ! 318: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8797a000  ! 319: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb1508000  ! 320: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xbb500000  ! 321: RDPR_TPC	<illegal instruction>
	.word 0xb5a70920  ! 322: FMULs	fmuls	%f28, %f0, %f26
	.word 0x8395e000  ! 323: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x83962000  ! 324: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb750c000  ! 325: RDPR_TT	rdpr	%tt, %r27
	.word 0xaba4c8e0  ! 326: FSUBq	dis not found

	.word 0xb1504000  ! 327: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 328: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 329: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0xb5a508a0  ! 331: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xada54860  ! 332: FADDq	dis not found

	.word 0xbda00540  ! 333: FSQRTd	fsqrt	
	.word 0x8397e000  ! 334: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x85942000  ! 335: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa5500000  ! 336: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xbb508000  ! 337: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 338: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa7a7c960  ! 339: FMULq	dis not found

	.word 0x8197e000  ! 340: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8594a000  ! 341: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8195e000  ! 342: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8595a000  ! 343: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb7508000  ! 344: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xa750c000  ! 345: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 346: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa9500000  ! 347: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xbf504000  ! 348: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 349: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb7504000  ! 350: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x85962000  ! 351: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb750c000  ! 352: RDPR_TT	rdpr	%tt, %r27
	.word 0x85972000  ! 353: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8195e000  ! 354: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9a00560  ! 355: FSQRTq	fsqrt	
	.word 0x8595a000  ! 356: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb1a00560  ! 357: FSQRTq	fsqrt	
	.word 0x81946000  ! 358: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa5a00540  ! 359: FSQRTd	fsqrt	
	.word 0x83946000  ! 360: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8194a000  ! 361: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb550c000  ! 362: RDPR_TT	rdpr	%tt, %r26
	.word 0x8795e000  ! 363: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87956000  ! 364: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x85952000  ! 365: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa3504000  ! 366: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x83952000  ! 367: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xab508000  ! 368: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xa5500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 371: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb1500000  ! 372: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xbba00560  ! 373: FSQRTq	fsqrt	
	.word 0x83946000  ! 374: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8794a000  ! 375: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa9a409a0  ! 376: FDIVs	fdivs	%f16, %f0, %f20
	.word 0xa750c000  ! 377: RDPR_TT	rdpr	%tt, %r19
	.word 0xa1500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xb1a788c0  ! 379: FSUBd	fsubd	%f30, %f0, %f24
	.word 0x8396e000  ! 380: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8795a000  ! 381: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbb500000  ! 382: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x87966000  ! 383: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8196a000  ! 384: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xab504000  ! 385: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x83946000  ! 386: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xaba749c0  ! 387: FDIVd	fdivd	%f60, %f0, %f52
	.word 0x8197a000  ! 388: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8396a000  ! 389: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa150c000  ! 390: RDPR_TT	rdpr	%tt, %r16
	.word 0xbf504000  ! 391: RDPR_TNPC	<illegal instruction>
	.word 0xa3a78940  ! 392: FMULd	fmuld	%f30, %f0, %f48
	.word 0x83952000  ! 393: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xad508000  ! 394: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x8594e000  ! 395: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8796e000  ! 396: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa7a00560  ! 397: FSQRTq	fsqrt	
	.word 0x8794a000  ! 398: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb9a508e0  ! 399: FSUBq	dis not found

	.word 0xbda4c8e0  ! 400: FSUBq	dis not found

	.word 0xbb500000  ! 401: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x8195a000  ! 402: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa9504000  ! 403: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xafa5c940  ! 404: FMULd	fmuld	%f54, %f0, %f54
	.word 0xa3508000  ! 405: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 406: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd50c000  ! 407: RDPR_TT	rdpr	%tt, %r30
	.word 0x8194a000  ! 408: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x83976000  ! 409: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8397a000  ! 410: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb5508000  ! 411: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb750c000  ! 412: RDPR_TT	<illegal instruction>
	.word 0xb1a708a0  ! 413: FSUBs	fsubs	%f28, %f0, %f24
	.word 0x8597a000  ! 414: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8395a000  ! 415: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb350c000  ! 416: RDPR_TT	rdpr	%tt, %r25
	.word 0xb7500000  ! 417: RDPR_TPC	<illegal instruction>
	.word 0xb1a589c0  ! 418: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb9a00560  ! 419: FSQRTq	fsqrt	
	.word 0x8397e000  ! 420: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8794a000  ! 421: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb9a788e0  ! 422: FSUBq	dis not found

	.word 0x8596e000  ! 423: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xab50c000  ! 424: RDPR_TT	rdpr	%tt, %r21
	.word 0xa1504000  ! 425: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 427: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 428: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa750c000  ! 429: RDPR_TT	rdpr	%tt, %r19
	.word 0x87942000  ! 430: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x83946000  ! 431: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbf500000  ! 432: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xaf50c000  ! 433: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0xa7a00560  ! 435: FSQRTq	fsqrt	
	.word 0xaba6c8e0  ! 436: FSUBq	dis not found

	.word 0x85956000  ! 437: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb750c000  ! 438: RDPR_TT	rdpr	%tt, %r27
	.word 0x8197e000  ! 439: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xab508000  ! 440: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xad50c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 443: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbf504000  ! 444: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb3504000  ! 445: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 446: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 447: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbda4c860  ! 448: FADDq	dis not found

	.word 0xada5c960  ! 449: FMULq	dis not found

	.word 0xbb508000  ! 450: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xa7500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xbda609a0  ! 452: FDIVs	fdivs	%f24, %f0, %f30
	.word 0xa7500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 454: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8196e000  ! 455: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8596e000  ! 456: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x81972000  ! 457: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x87966000  ! 458: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa9a64860  ! 459: FADDq	dis not found

	.word 0x8396a000  ! 460: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa1500000  ! 461: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xafa00540  ! 462: FSQRTd	fsqrt	
	.word 0xaf50c000  ! 463: RDPR_TT	<illegal instruction>
	.word 0xa3a7c9e0  ! 464: FDIVq	dis not found

	.word 0x81966000  ! 465: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x87946000  ! 466: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x87942000  ! 467: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbb50c000  ! 468: RDPR_TT	rdpr	%tt, %r29
	.word 0x83952000  ! 469: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa350c000  ! 470: RDPR_TT	rdpr	%tt, %r17
	.word 0xad508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 473: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xad508000  ! 474: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xafa448a0  ! 475: FSUBs	fsubs	%f17, %f0, %f23
	.word 0xa7504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 477: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8396e000  ! 478: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x81946000  ! 479: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa5504000  ! 480: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x8394a000  ! 481: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8196a000  ! 482: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa5504000  ! 483: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x85972000  ! 484: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa3508000  ! 485: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xb7500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xb3a00560  ! 487: FSQRTq	fsqrt	
	.word 0xa1a609a0  ! 488: FDIVs	fdivs	%f24, %f0, %f16
	.word 0xa3504000  ! 489: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 490: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 491: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 492: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb3a608c0  ! 493: FSUBd	fsubd	%f24, %f0, %f56
	.word 0xa1a50940  ! 494: FMULd	fmuld	%f20, %f0, %f16
	.word 0xa1508000  ! 495: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xa1a608a0  ! 496: FSUBs	fsubs	%f24, %f0, %f16
	.word 0x8595a000  ! 497: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85956000  ! 498: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8794a000  ! 499: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb9508000  ! 500: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x81946000  ! 501: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xad504000  ! 502: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb1a4c9c0  ! 503: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xa150c000  ! 504: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 505: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 506: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 507: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0x87972000  ! 509: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbda6c8e0  ! 510: FSUBq	dis not found

	.word 0xaba6c8c0  ! 511: FSUBd	fsubd	%f58, %f0, %f52
	.word 0xa3a7c8a0  ! 512: FSUBs	fsubs	%f31, %f0, %f17
	.word 0xbb508000  ! 513: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb9508000  ! 514: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 515: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb5a50820  ! 516: FADDs	fadds	%f20, %f0, %f26
	.word 0x8197e000  ! 517: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8195e000  ! 518: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbb500000  ! 519: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xaf50c000  ! 520: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 521: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8197e000  ! 522: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa5504000  ! 523: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xbf50c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 525: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xad500000  ! 526: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x81942000  ! 527: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa3508000  ! 528: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xaf500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 530: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa3504000  ! 531: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa3a4c8c0  ! 532: FSUBd	fsubd	%f50, %f0, %f48
	.word 0xab500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0xad504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x85952000  ! 535: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb750c000  ! 536: RDPR_TT	rdpr	%tt, %r27
	.word 0xa3508000  ! 537: RDPR_TSTATE	<illegal instruction>
	.word 0xada50920  ! 538: FMULs	fmuls	%f20, %f0, %f22
	.word 0xbb508000  ! 539: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 541: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa9504000  ! 542: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x87946000  ! 543: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8196a000  ! 544: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3500000  ! 545: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xaf504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 547: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 548: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8596a000  ! 549: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xaf504000  ! 550: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x85962000  ! 551: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb9a54960  ! 552: FMULq	dis not found

	.word 0x8397a000  ! 553: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xad504000  ! 554: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb1a58840  ! 555: FADDd	faddd	%f22, %f0, %f24
	.word 0x87972000  ! 556: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa9a688c0  ! 557: FSUBd	fsubd	%f26, %f0, %f20
	.word 0xa3a50820  ! 558: FADDs	fadds	%f20, %f0, %f17
	.word 0xbf50c000  ! 559: RDPR_TT	rdpr	%tt, %r31
	.word 0x8196a000  ! 560: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb9500000  ! 561: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x81946000  ! 562: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8794a000  ! 563: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8594e000  ! 564: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb7a00520  ! 565: FSQRTs	fsqrt	
	.word 0xa3508000  ! 566: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xaf500000  ! 567: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 568: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 569: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x83956000  ! 570: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8396a000  ! 571: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa9a00560  ! 572: FSQRTq	fsqrt	
	.word 0xad50c000  ! 573: RDPR_TT	rdpr	%tt, %r22
	.word 0xb1508000  ! 574: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 575: RDPR_TNPC	<illegal instruction>
	.word 0xafa4c860  ! 576: FADDq	dis not found

	.word 0x87956000  ! 577: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8395e000  ! 578: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbd504000  ! 579: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb150c000  ! 580: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 582: RDPR_TNPC	<illegal instruction>
	.word 0x87946000  ! 583: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8595e000  ! 584: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa550c000  ! 585: RDPR_TT	rdpr	%tt, %r18
	.word 0xab50c000  ! 586: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 587: RDPR_TT	<illegal instruction>
	.word 0xbba50820  ! 588: FADDs	fadds	%f20, %f0, %f29
	.word 0x81956000  ! 589: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xada789c0  ! 590: FDIVd	fdivd	%f30, %f0, %f22
	.word 0x83952000  ! 591: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xafa7c960  ! 592: FMULq	dis not found

	.word 0xb950c000  ! 593: RDPR_TT	rdpr	%tt, %r28
	.word 0x8196e000  ! 594: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbf500000  ! 595: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x87952000  ! 596: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x81962000  ! 597: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xaba709a0  ! 598: FDIVs	fdivs	%f28, %f0, %f21
	.word 0x8395e000  ! 599: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa3504000  ! 600: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xada48940  ! 601: FMULd	fmuld	%f18, %f0, %f22
	.word 0xa7a7c9c0  ! 602: FDIVd	fdivd	%f62, %f0, %f50
	.word 0x83956000  ! 603: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb7504000  ! 604: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xa9500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00540  ! 608: FSQRTd	fsqrt	
	.word 0xb3508000  ! 609: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 610: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa5500000  ! 611: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xa9a7c9a0  ! 612: FDIVs	fdivs	%f31, %f0, %f20
	.word 0xa7508000  ! 613: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 614: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8196e000  ! 615: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83942000  ! 616: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8797a000  ! 617: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb1508000  ! 618: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb550c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xa7a5c840  ! 620: FADDd	faddd	%f54, %f0, %f50
	.word 0xbf504000  ! 621: RDPR_TNPC	<illegal instruction>
	.word 0xb3a68920  ! 622: FMULs	fmuls	%f26, %f0, %f25
	.word 0x8394e000  ! 623: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbd50c000  ! 624: RDPR_TT	rdpr	%tt, %r30
	.word 0xaba489a0  ! 625: FDIVs	fdivs	%f18, %f0, %f21
	.word 0xa1504000  ! 626: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 627: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa5508000  ! 628: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xaba748e0  ! 629: FSUBq	dis not found

	.word 0xad508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 632: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 634: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa350c000  ! 635: RDPR_TT	rdpr	%tt, %r17
	.word 0xbb500000  ! 636: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 637: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x85976000  ! 638: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb9500000  ! 639: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb5500000  ! 640: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 641: RDPR_TNPC	<illegal instruction>
	.word 0x8395a000  ! 642: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x83972000  ! 643: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x85946000  ! 644: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x81956000  ! 645: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x83946000  ! 646: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb7a60940  ! 647: FMULd	fmuld	%f24, %f0, %f58
	.word 0x8794e000  ! 648: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa750c000  ! 649: RDPR_TT	rdpr	%tt, %r19
	.word 0xb9508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 651: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 652: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 653: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 655: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x83942000  ! 656: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbf500000  ! 657: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xa3500000  ! 658: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 659: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb150c000  ! 660: RDPR_TT	rdpr	%tt, %r24
	.word 0xa9a00520  ! 661: FSQRTs	fsqrt	
	.word 0xa350c000  ! 662: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 663: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa7a00520  ! 664: FSQRTs	fsqrt	
	.word 0x8594e000  ! 665: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8795a000  ! 666: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x81966000  ! 667: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xada6c8a0  ! 668: FSUBs	fsubs	%f27, %f0, %f22
	.word 0xa7508000  ! 669: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xb350c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 671: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa1504000  ! 672: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xb350c000  ! 673: RDPR_TT	<illegal instruction>
	.word 0x85942000  ! 674: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x85966000  ! 675: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb1500000  ! 676: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb1a00560  ! 677: FSQRTq	fsqrt	
	.word 0xbba448a0  ! 678: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xaf508000  ! 679: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a74840  ! 680: FADDd	faddd	%f60, %f0, %f48
	.word 0x8194e000  ! 681: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x81976000  ! 682: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x87952000  ! 683: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xaf50c000  ! 684: RDPR_TT	rdpr	%tt, %r23
	.word 0x83946000  ! 685: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8797a000  ! 686: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbd50c000  ! 687: RDPR_TT	rdpr	%tt, %r30
	.word 0x8596a000  ! 688: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8597e000  ! 689: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8595e000  ! 690: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa7508000  ! 691: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xa1500000  ! 692: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 693: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x85946000  ! 694: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8794e000  ! 695: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb3a00540  ! 696: FSQRTd	fsqrt	
	.word 0xb750c000  ! 697: RDPR_TT	rdpr	%tt, %r27
	.word 0x87972000  ! 698: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbf504000  ! 699: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xa9508000  ! 700: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 701: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa5504000  ! 702: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xb150c000  ! 703: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 704: RDPR_TPC	<illegal instruction>
	.word 0x83962000  ! 705: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xad500000  ! 706: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xaf50c000  ! 707: RDPR_TT	<illegal instruction>
	.word 0xb5a6c840  ! 708: FADDd	faddd	%f58, %f0, %f26
	.word 0xbf504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xbda4c960  ! 710: FMULq	dis not found

	.word 0x8594e000  ! 711: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x85942000  ! 712: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaf508000  ! 713: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xaf50c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xb7a00520  ! 715: FSQRTs	fsqrt	
	.word 0xab500000  ! 716: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 717: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa3504000  ! 718: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x85946000  ! 719: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x83972000  ! 720: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8597e000  ! 721: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa1504000  ! 722: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xb7504000  ! 723: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 725: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xaf50c000  ! 726: RDPR_TT	rdpr	%tt, %r23
	.word 0xb7500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 728: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb1508000  ! 729: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb3504000  ! 730: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 731: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 732: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8594a000  ! 733: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa7504000  ! 734: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xb750c000  ! 735: RDPR_TT	<illegal instruction>
	.word 0xa9a00560  ! 736: FSQRTq	fsqrt	
	.word 0xbb508000  ! 737: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 738: RDPR_TT	<illegal instruction>
	.word 0xb5a00520  ! 739: FSQRTs	fsqrt	
	.word 0xb1508000  ! 740: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 741: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbf508000  ! 742: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb7508000  ! 743: RDPR_TSTATE	<illegal instruction>
	.word 0xafa00520  ! 744: FSQRTs	fsqrt	
	.word 0xb3a7c960  ! 745: FMULq	dis not found

	.word 0xa3500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x8794e000  ! 747: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb950c000  ! 748: RDPR_TT	rdpr	%tt, %r28
	.word 0xbb508000  ! 749: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xb5a7c920  ! 751: FMULs	fmuls	%f31, %f0, %f26
	.word 0xb150c000  ! 752: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 753: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x87956000  ! 754: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb3500000  ! 755: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xbf508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 758: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa7a00520  ! 759: FSQRTs	fsqrt	
	.word 0x83972000  ! 760: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbb508000  ! 761: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb350c000  ! 762: RDPR_TT	<illegal instruction>
	.word 0xa1a00540  ! 763: FSQRTd	fsqrt	
	.word 0xa550c000  ! 764: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 766: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbba449c0  ! 767: FDIVd	fdivd	%f48, %f0, %f60
	.word 0x8796a000  ! 768: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbf508000  ! 769: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xa7500000  ! 770: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 771: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 772: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 773: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa3508000  ! 774: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xab508000  ! 775: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 777: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbba00560  ! 778: FSQRTq	fsqrt	
	.word 0xa9a508e0  ! 779: FSUBq	dis not found

	.word 0x85972000  ! 780: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa7500000  ! 781: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xa9a48960  ! 782: FMULq	dis not found

	.word 0xa5504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 785: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb9504000  ! 786: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb1504000  ! 787: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 788: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x83952000  ! 789: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x81972000  ! 790: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x85976000  ! 791: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x85972000  ! 792: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81976000  ! 793: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa3504000  ! 794: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xbba78920  ! 795: FMULs	fmuls	%f30, %f0, %f29
	.word 0x87952000  ! 796: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb9500000  ! 797: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x83956000  ! 798: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8196e000  ! 799: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9504000  ! 800: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa150c000  ! 801: RDPR_TT	<illegal instruction>
	.word 0xa750c000  ! 802: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 803: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8797e000  ! 804: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5a548e0  ! 805: FSUBq	dis not found

	.word 0x81946000  ! 806: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8397a000  ! 807: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8197e000  ! 808: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xab508000  ! 809: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xb550c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0xbfa00540  ! 811: FSQRTd	fsqrt	
	.word 0xbb504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 813: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 814: FSQRTs	fsqrt	
	.word 0xb550c000  ! 815: RDPR_TT	<illegal instruction>
	.word 0xa3a54860  ! 816: FADDq	dis not found

	.word 0x8396a000  ! 817: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa750c000  ! 818: RDPR_TT	rdpr	%tt, %r19
	.word 0xa1500000  ! 819: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 820: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3a44920  ! 821: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb3508000  ! 822: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x8395a000  ! 823: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xaf50c000  ! 824: RDPR_TT	rdpr	%tt, %r23
	.word 0x8597a000  ! 825: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbd500000  ! 826: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x8195a000  ! 827: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8795a000  ! 828: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb3a588c0  ! 829: FSUBd	fsubd	%f22, %f0, %f56
	.word 0x8195e000  ! 830: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8197a000  ! 831: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa9504000  ! 832: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xb9508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 834: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x85966000  ! 835: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb9a00540  ! 836: FSQRTd	fsqrt	
	.word 0x8595e000  ! 837: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x85966000  ! 838: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa5508000  ! 839: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x87972000  ! 840: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x81956000  ! 841: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xab504000  ! 842: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xa9a548c0  ! 843: FSUBd	fsubd	%f52, %f0, %f20
	.word 0xbda6c960  ! 844: FMULq	dis not found

	.word 0x8797e000  ! 845: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x81966000  ! 846: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83962000  ! 847: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb5508000  ! 848: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8596e000  ! 849: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xaf508000  ! 850: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xbb500000  ! 851: RDPR_TPC	<illegal instruction>
	.word 0xbba609c0  ! 852: FDIVd	fdivd	%f24, %f0, %f60
	.word 0xbfa70820  ! 853: FADDs	fadds	%f28, %f0, %f31
	.word 0xbba00540  ! 854: FSQRTd	fsqrt	
	.word 0xb7508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a7c8a0  ! 856: FSUBs	fsubs	%f31, %f0, %f25
	.word 0xb750c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 858: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbd504000  ! 859: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbb504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 861: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83942000  ! 862: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xaf508000  ! 863: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xbd508000  ! 864: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 865: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 866: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb750c000  ! 867: RDPR_TT	rdpr	%tt, %r27
	.word 0x8795a000  ! 868: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa550c000  ! 869: RDPR_TT	rdpr	%tt, %r18
	.word 0xa5a509c0  ! 870: FDIVd	fdivd	%f20, %f0, %f18
	.word 0x8794e000  ! 871: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa5a5c8c0  ! 872: FSUBd	fsubd	%f54, %f0, %f18
	.word 0x8797a000  ! 873: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xada00520  ! 874: FSQRTs	fsqrt	
	.word 0x87956000  ! 875: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8194a000  ! 876: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbf500000  ! 877: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xad50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 879: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8594a000  ! 880: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb5508000  ! 881: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8794a000  ! 882: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb1a50940  ! 883: FMULd	fmuld	%f20, %f0, %f24
	.word 0xa7a588c0  ! 884: FSUBd	fsubd	%f22, %f0, %f50
	.word 0xa7508000  ! 885: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8196a000  ! 886: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xaba689a0  ! 887: FDIVs	fdivs	%f26, %f0, %f21
	.word 0xbf508000  ! 888: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbd50c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 890: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 891: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 892: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa9a00520  ! 893: FSQRTs	fsqrt	
	.word 0xafa78820  ! 894: FADDs	fadds	%f30, %f0, %f23
	.word 0xb7a4c860  ! 895: FADDq	dis not found

	.word 0x8395e000  ! 896: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xaf508000  ! 897: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8597a000  ! 898: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb1504000  ! 899: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb550c000  ! 900: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 901: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8394a000  ! 902: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8596a000  ! 903: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8794a000  ! 904: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb1504000  ! 905: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xbb508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 907: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a54820  ! 908: FADDs	fadds	%f21, %f0, %f28
	.word 0x85942000  ! 909: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8794e000  ! 910: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbda5c8e0  ! 911: FSUBq	dis not found

	.word 0xbb50c000  ! 912: RDPR_TT	rdpr	%tt, %r29
	.word 0x8596e000  ! 913: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x83956000  ! 914: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xafa508a0  ! 915: FSUBs	fsubs	%f20, %f0, %f23
	.word 0xada5c8e0  ! 916: FSUBq	dis not found

	.word 0x8394a000  ! 917: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8195e000  ! 918: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9508000  ! 919: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x83972000  ! 920: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x81962000  ! 921: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa9a5c8a0  ! 922: FSUBs	fsubs	%f23, %f0, %f20
	.word 0xbb508000  ! 923: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xada6c960  ! 924: FMULq	dis not found

	.word 0x87946000  ! 925: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xad50c000  ! 926: RDPR_TT	rdpr	%tt, %r22
	.word 0xb1a00560  ! 927: FSQRTq	fsqrt	
	.word 0xa3a749a0  ! 928: FDIVs	fdivs	%f29, %f0, %f17
	.word 0x8394a000  ! 929: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xaf504000  ! 930: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xbf508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 933: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8594a000  ! 934: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xad500000  ! 935: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8594e000  ! 936: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xafa488e0  ! 937: FSUBq	dis not found

	.word 0x81972000  ! 938: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa7a00560  ! 939: FSQRTq	fsqrt	
	.word 0x8796e000  ! 940: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8594e000  ! 941: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa5a5c9e0  ! 942: FDIVq	dis not found

	.word 0x83966000  ! 943: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x85942000  ! 944: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8796e000  ! 945: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8196e000  ! 946: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9500000  ! 947: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xbf504000  ! 948: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 949: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00520  ! 950: FSQRTs	fsqrt	
	.word 0x8395a000  ! 951: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbba50860  ! 952: FADDq	dis not found

	.word 0x8595e000  ! 953: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa9504000  ! 954: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x8194a000  ! 955: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbfa4c960  ! 956: FMULq	dis not found

	.word 0x8597e000  ! 957: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85966000  ! 958: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb3504000  ! 959: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8795e000  ! 960: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8395a000  ! 961: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb9508000  ! 962: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8794a000  ! 963: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x83946000  ! 964: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xab500000  ! 965: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x8395a000  ! 966: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbd504000  ! 967: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x85952000  ! 968: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb9504000  ! 969: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb1500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 971: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbd504000  ! 972: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xa1504000  ! 973: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 974: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 975: RDPR_TPC	<illegal instruction>
	.word 0xab508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 977: RDPR_TT	<illegal instruction>
	.word 0xafa00540  ! 978: FSQRTd	fsqrt	
	.word 0xaf50c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 980: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbb50c000  ! 981: RDPR_TT	rdpr	%tt, %r29
	.word 0x8395a000  ! 982: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbfa60960  ! 983: FMULq	dis not found

	.word 0x8794e000  ! 984: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa1500000  ! 985: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xa7a6c8c0  ! 986: FSUBd	fsubd	%f58, %f0, %f50
	.word 0xbf508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a00540  ! 988: FSQRTd	fsqrt	
	.word 0xb7508000  ! 989: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 990: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbda64840  ! 991: FADDd	faddd	%f56, %f0, %f30
	.word 0xa5a748c0  ! 992: FSUBd	fsubd	%f60, %f0, %f18
	.word 0xb5504000  ! 993: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xaf508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 995: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3500000  ! 996: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa7504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 998: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
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
	.word 0xa3a509c0  ! 1: FDIVd	fdivd	%f20, %f0, %f48
	.word 0x8397e000  ! 2: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbd508000  ! 3: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a00560  ! 4: FSQRTq	fsqrt	
	.word 0xafa00540  ! 5: FSQRTd	fsqrt	
	.word 0xada7c840  ! 6: FADDd	faddd	%f62, %f0, %f22
	.word 0x87962000  ! 7: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x85952000  ! 8: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb3a4c840  ! 9: FADDd	faddd	%f50, %f0, %f56
	.word 0x8194a000  ! 10: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x81946000  ! 11: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa9508000  ! 12: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a688e0  ! 13: FSUBq	dis not found

	.word 0xa7504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 16: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb5a70960  ! 17: FMULq	dis not found

	.word 0x85962000  ! 18: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8195a000  ! 19: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8594a000  ! 20: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb7508000  ! 21: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 22: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8194e000  ! 23: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8795e000  ! 24: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x85952000  ! 25: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa150c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 27: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 28: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8795e000  ! 29: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x83952000  ! 30: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb1500000  ! 31: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 32: FSQRTs	fsqrt	
	.word 0xb950c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 34: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 35: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 36: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x85942000  ! 37: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa3504000  ! 38: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 39: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa7500000  ! 40: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 41: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8796a000  ! 42: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85942000  ! 43: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x83952000  ! 44: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xada00560  ! 45: FSQRTq	fsqrt	
	.word 0xa1a74940  ! 46: FMULd	fmuld	%f60, %f0, %f16
	.word 0xbfa709c0  ! 47: FDIVd	fdivd	%f28, %f0, %f62
	.word 0x8594a000  ! 48: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8197e000  ! 49: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa7504000  ! 50: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 51: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8795a000  ! 52: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbfa00560  ! 53: FSQRTq	fsqrt	
	.word 0xa750c000  ! 54: RDPR_TT	rdpr	%tt, %r19
	.word 0x8396a000  ! 55: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb3a4c920  ! 56: FMULs	fmuls	%f19, %f0, %f25
	.word 0xa7500000  ! 57: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 58: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x81946000  ! 59: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x87962000  ! 60: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8196a000  ! 61: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xaf508000  ! 62: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 63: RDPR_TNPC	<illegal instruction>
	.word 0x8794e000  ! 64: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa7a00520  ! 65: FSQRTs	fsqrt	
	.word 0xa1a7c9c0  ! 66: FDIVd	fdivd	%f62, %f0, %f16
	.word 0xaf500000  ! 67: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 68: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa1500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a70820  ! 71: FADDs	fadds	%f28, %f0, %f26
	.word 0x81956000  ! 72: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xad508000  ! 73: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 74: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa150c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 76: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 77: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa5500000  ! 78: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 79: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb7504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 81: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbda54840  ! 82: FADDd	faddd	%f52, %f0, %f30
	.word 0x8796a000  ! 83: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb5500000  ! 84: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8196a000  ! 85: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbda489a0  ! 86: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xbb500000  ! 87: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x85962000  ! 88: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbb500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 90: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5a00560  ! 91: FSQRTq	fsqrt	
	.word 0xb150c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 93: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87962000  ! 94: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x85966000  ! 95: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xaf50c000  ! 96: RDPR_TT	<illegal instruction>
	.word 0xa7a5c9e0  ! 97: FDIVq	dis not found

	.word 0xb3500000  ! 98: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 100: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa5504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 104: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbb50c000  ! 105: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 106: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 107: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb9a488c0  ! 108: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xa5a50960  ! 109: FMULq	dis not found

	.word 0xab504000  ! 110: RDPR_TNPC	<illegal instruction>
	.word 0xafa789c0  ! 111: FDIVd	fdivd	%f30, %f0, %f54
	.word 0x83956000  ! 112: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb950c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xbfa54840  ! 114: FADDd	faddd	%f52, %f0, %f62
	.word 0xab508000  ! 115: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 116: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8397e000  ! 117: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb7a00540  ! 118: FSQRTd	fsqrt	
	.word 0x8395e000  ! 119: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb7a7c8e0  ! 120: FSUBq	dis not found

	.word 0xada789a0  ! 121: FDIVs	fdivs	%f30, %f0, %f22
	.word 0xbd508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 123: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8795e000  ! 124: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x83946000  ! 125: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbb504000  ! 126: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 127: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbf500000  ! 128: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x8794a000  ! 129: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8796a000  ! 130: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb3a00560  ! 131: FSQRTq	fsqrt	
	.word 0xbba709a0  ! 132: FDIVs	fdivs	%f28, %f0, %f29
	.word 0xbda54940  ! 133: FMULd	fmuld	%f52, %f0, %f30
	.word 0x8196e000  ! 134: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8197a000  ! 135: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8594e000  ! 136: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xada548a0  ! 137: FSUBs	fsubs	%f21, %f0, %f22
	.word 0xb7a448e0  ! 138: FSUBq	dis not found

	.word 0xad508000  ! 139: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0xbba6c860  ! 141: FADDq	dis not found

	.word 0x8597a000  ! 142: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8594a000  ! 143: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xaf50c000  ! 144: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 145: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 146: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 148: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa350c000  ! 149: RDPR_TT	<illegal instruction>
	.word 0xbfa4c840  ! 150: FADDd	faddd	%f50, %f0, %f62
	.word 0xb750c000  ! 151: RDPR_TT	<illegal instruction>
	.word 0xada00520  ! 152: FSQRTs	fsqrt	
	.word 0xb5a509e0  ! 153: FDIVq	dis not found

	.word 0xbd50c000  ! 154: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 155: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 158: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x81972000  ! 159: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x87966000  ! 160: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x85956000  ! 161: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb1a70940  ! 162: FMULd	fmuld	%f28, %f0, %f24
	.word 0x81942000  ! 163: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa550c000  ! 164: RDPR_TT	<illegal instruction>
	.word 0x87976000  ! 165: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbd504000  ! 166: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 169: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb3500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 171: RDPR_TT	<illegal instruction>
	.word 0xa7a54940  ! 172: FMULd	fmuld	%f52, %f0, %f50
	.word 0x81966000  ! 173: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xad500000  ! 174: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xb1a5c960  ! 176: FMULq	dis not found

	.word 0xb9500000  ! 177: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 178: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb1504000  ! 179: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 181: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87956000  ! 182: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8595e000  ! 183: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8196e000  ! 184: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x87942000  ! 185: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbf508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 187: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa3a789c0  ! 188: FDIVd	fdivd	%f30, %f0, %f48
	.word 0xb9508000  ! 189: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 190: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb7500000  ! 191: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 192: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87976000  ! 193: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8196e000  ! 194: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xafa00520  ! 195: FSQRTs	fsqrt	
	.word 0x85946000  ! 196: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8796a000  ! 197: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbd508000  ! 198: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 199: RDPR_TNPC	<illegal instruction>
	.word 0xb1a00540  ! 200: FSQRTd	fsqrt	
	.word 0xa3500000  ! 201: RDPR_TPC	<illegal instruction>
	.word 0x8597e000  ! 202: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbb508000  ! 203: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 204: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 205: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 206: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb9a6c8e0  ! 207: FSUBq	dis not found

	.word 0x8396a000  ! 208: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xab500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 210: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa9504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 212: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 213: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb3504000  ! 214: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 215: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 216: RDPR_TT	<illegal instruction>
	.word 0xa7a58840  ! 217: FADDd	faddd	%f22, %f0, %f50
	.word 0xa5a609c0  ! 218: FDIVd	fdivd	%f24, %f0, %f18
	.word 0xb5a00560  ! 219: FSQRTq	fsqrt	
	.word 0xa3a748a0  ! 220: FSUBs	fsubs	%f29, %f0, %f17
	.word 0xb5a648a0  ! 221: FSUBs	fsubs	%f25, %f0, %f26
	.word 0xa5504000  ! 222: RDPR_TNPC	<illegal instruction>
	.word 0x8797e000  ! 223: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb7a60960  ! 224: FMULq	dis not found

	.word 0xb9a64960  ! 225: FMULq	dis not found

	.word 0xaf504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0x8794e000  ! 227: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbb500000  ! 228: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xada68860  ! 229: FADDq	dis not found

	.word 0xa7504000  ! 230: RDPR_TNPC	<illegal instruction>
	.word 0xaba00540  ! 231: FSQRTd	fsqrt	
	.word 0xa3504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 233: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa7500000  ! 234: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 235: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 236: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa9a50860  ! 237: FADDq	dis not found

	.word 0xad50c000  ! 238: RDPR_TT	<illegal instruction>
	.word 0xaba54960  ! 239: FMULq	dis not found

	.word 0x81942000  ! 240: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb1a00540  ! 241: FSQRTd	fsqrt	
	.word 0xaf508000  ! 242: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 243: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 244: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa9508000  ! 245: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xaba4c9a0  ! 247: FDIVs	fdivs	%f19, %f0, %f21
	.word 0xbda00540  ! 248: FSQRTd	fsqrt	
	.word 0xa1a789e0  ! 249: FDIVq	dis not found

	.word 0x8196a000  ! 250: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb550c000  ! 251: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 252: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa7504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xa3508000  ! 254: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 255: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb9500000  ! 256: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 258: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb550c000  ! 259: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 261: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x85942000  ! 262: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbda448c0  ! 263: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xa5508000  ! 264: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 265: RDPR_TT	<illegal instruction>
	.word 0xa750c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xaba00540  ! 267: FSQRTd	fsqrt	
	.word 0xa5a548c0  ! 268: FSUBd	fsubd	%f52, %f0, %f18
	.word 0xbd500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 270: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 271: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbf50c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xaf508000  ! 273: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 274: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb9504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 276: RDPR_TNPC	<illegal instruction>
	.word 0xa9a448c0  ! 277: FSUBd	fsubd	%f48, %f0, %f20
	.word 0xbd500000  ! 278: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0x87952000  ! 280: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbb500000  ! 281: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 283: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 284: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb5504000  ! 285: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 286: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa5500000  ! 287: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 288: RDPR_TNPC	<illegal instruction>
	.word 0xa5a5c8c0  ! 289: FSUBd	fsubd	%f54, %f0, %f18
	.word 0xb3504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 291: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x85972000  ! 292: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa7a00560  ! 293: FSQRTq	fsqrt	
	.word 0x87952000  ! 294: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa3a7c9a0  ! 295: FDIVs	fdivs	%f31, %f0, %f17
	.word 0x83966000  ! 296: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbba00540  ! 297: FSQRTd	fsqrt	
	.word 0x85942000  ! 298: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x87952000  ! 299: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x87946000  ! 300: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x87946000  ! 301: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xab500000  ! 302: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 303: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb1508000  ! 304: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 305: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa7a54860  ! 306: FADDq	dis not found

	.word 0xbd504000  ! 307: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 308: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85942000  ! 309: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa7a7c9a0  ! 310: FDIVs	fdivs	%f31, %f0, %f19
	.word 0xa7a489a0  ! 311: FDIVs	fdivs	%f18, %f0, %f19
	.word 0xb1a68940  ! 312: FMULd	fmuld	%f26, %f0, %f24
	.word 0xa3a00520  ! 313: FSQRTs	fsqrt	
	.word 0xb7508000  ! 314: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 315: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 317: RDPR_TNPC	<illegal instruction>
	.word 0x8397a000  ! 318: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x87946000  ! 319: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa5508000  ! 320: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 321: RDPR_TPC	<illegal instruction>
	.word 0xb5a40920  ! 322: FMULs	fmuls	%f16, %f0, %f26
	.word 0x8394a000  ! 323: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8395e000  ! 324: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbd50c000  ! 325: RDPR_TT	<illegal instruction>
	.word 0xb7a648e0  ! 326: FSUBq	dis not found

	.word 0xb9504000  ! 327: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 328: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 329: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0xa1a548a0  ! 331: FSUBs	fsubs	%f21, %f0, %f16
	.word 0xa7a64860  ! 332: FADDq	dis not found

	.word 0xb5a00540  ! 333: FSQRTd	fsqrt	
	.word 0x83956000  ! 334: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8595e000  ! 335: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xad500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 337: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 338: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbba5c960  ! 339: FMULq	dis not found

	.word 0x81952000  ! 340: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8596a000  ! 341: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8195a000  ! 342: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x85942000  ! 343: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb5508000  ! 344: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 345: RDPR_TT	<illegal instruction>
	.word 0x8595a000  ! 346: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb5500000  ! 347: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 348: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 349: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb1504000  ! 350: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 351: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa750c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 353: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x81942000  ! 354: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbda00560  ! 355: FSQRTq	fsqrt	
	.word 0x85962000  ! 356: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb5a00560  ! 357: FSQRTq	fsqrt	
	.word 0x81946000  ! 358: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa5a00540  ! 359: FSQRTd	fsqrt	
	.word 0x8397e000  ! 360: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x81962000  ! 361: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xab50c000  ! 362: RDPR_TT	<illegal instruction>
	.word 0x87942000  ! 363: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8797e000  ! 364: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8596a000  ! 365: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xad504000  ! 366: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 367: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa1508000  ! 368: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 371: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xaf500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xb9a00560  ! 373: FSQRTq	fsqrt	
	.word 0x83956000  ! 374: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8795a000  ! 375: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xafa4c9a0  ! 376: FDIVs	fdivs	%f19, %f0, %f23
	.word 0xa550c000  ! 377: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xb5a4c8c0  ! 379: FSUBd	fsubd	%f50, %f0, %f26
	.word 0x83966000  ! 380: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x87962000  ! 381: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa1500000  ! 382: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 383: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x81952000  ! 384: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xab504000  ! 385: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 386: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb3a409c0  ! 387: FDIVd	fdivd	%f16, %f0, %f56
	.word 0x81962000  ! 388: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8395a000  ! 389: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xab50c000  ! 390: RDPR_TT	rdpr	%tt, %r21
	.word 0xb9504000  ! 391: RDPR_TNPC	<illegal instruction>
	.word 0xb7a54940  ! 392: FMULd	fmuld	%f52, %f0, %f58
	.word 0x83942000  ! 393: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7508000  ! 394: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 395: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8795e000  ! 396: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa7a00560  ! 397: FSQRTq	fsqrt	
	.word 0x87956000  ! 398: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa5a5c8e0  ! 399: FSUBq	dis not found

	.word 0xbba588e0  ! 400: FSUBq	dis not found

	.word 0xb9500000  ! 401: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 402: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xab504000  ! 403: RDPR_TNPC	<illegal instruction>
	.word 0xaba7c940  ! 404: FMULd	fmuld	%f62, %f0, %f52
	.word 0xab508000  ! 405: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 406: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbb50c000  ! 407: RDPR_TT	<illegal instruction>
	.word 0x81962000  ! 408: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8395e000  ! 409: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8395a000  ! 410: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb9508000  ! 411: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 412: RDPR_TT	<illegal instruction>
	.word 0xa9a648a0  ! 413: FSUBs	fsubs	%f25, %f0, %f20
	.word 0x8595a000  ! 414: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8396e000  ! 415: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa550c000  ! 416: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 417: RDPR_TPC	<illegal instruction>
	.word 0xa7a789c0  ! 418: FDIVd	fdivd	%f30, %f0, %f50
	.word 0xbba00560  ! 419: FSQRTq	fsqrt	
	.word 0x8395e000  ! 420: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x87972000  ! 421: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbfa5c8e0  ! 422: FSUBq	dis not found

	.word 0x85956000  ! 423: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xab50c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xab504000  ! 425: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 427: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 428: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xab50c000  ! 429: RDPR_TT	<illegal instruction>
	.word 0x87976000  ! 430: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8396e000  ! 431: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb7500000  ! 432: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xa350c000  ! 433: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0xb3a00560  ! 435: FSQRTq	fsqrt	
	.word 0xaba4c8e0  ! 436: FSUBq	dis not found

	.word 0x8594a000  ! 437: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb750c000  ! 438: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 439: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb1508000  ! 440: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0x8397a000  ! 443: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xab504000  ! 444: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xa1504000  ! 445: RDPR_TNPC	<illegal instruction>
	.word 0xa9508000  ! 446: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e000  ! 447: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa1a64860  ! 448: FADDq	dis not found

	.word 0xb7a54960  ! 449: FMULq	dis not found

	.word 0xa1508000  ! 450: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xbda409a0  ! 452: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xad500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 454: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8194a000  ! 455: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8594e000  ! 456: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8197e000  ! 457: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87962000  ! 458: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xada78860  ! 459: FADDq	dis not found

	.word 0x8394e000  ! 460: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa5500000  ! 461: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xb7a00540  ! 462: FSQRTd	fsqrt	
	.word 0xbd50c000  ! 463: RDPR_TT	<illegal instruction>
	.word 0xb7a409e0  ! 464: FDIVq	dis not found

	.word 0x8194a000  ! 465: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8797e000  ! 466: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8797e000  ! 467: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb750c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 469: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa750c000  ! 470: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 473: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xab508000  ! 474: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a708a0  ! 475: FSUBs	fsubs	%f28, %f0, %f19
	.word 0xa5504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 477: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8397a000  ! 478: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x81962000  ! 479: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xbb504000  ! 480: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 481: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8196e000  ! 482: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb1504000  ! 483: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 484: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xaf508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xa7a00560  ! 487: FSQRTq	fsqrt	
	.word 0xb1a589a0  ! 488: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xa9504000  ! 489: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 490: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 491: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 492: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbba588c0  ! 493: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xafa7c940  ! 494: FMULd	fmuld	%f62, %f0, %f54
	.word 0xa9508000  ! 495: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xb9a408a0  ! 496: FSUBs	fsubs	%f16, %f0, %f28
	.word 0x8596e000  ! 497: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8595e000  ! 498: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8796a000  ! 499: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 501: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbd504000  ! 502: RDPR_TNPC	<illegal instruction>
	.word 0xb3a5c9c0  ! 503: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xa750c000  ! 504: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 505: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 506: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 507: RDPR_TPC	<illegal instruction>
	.word 0xa9500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0x87976000  ! 509: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xaba788e0  ! 510: FSUBq	dis not found

	.word 0xb3a748c0  ! 511: FSUBd	fsubd	%f60, %f0, %f56
	.word 0xbfa548a0  ! 512: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xaf508000  ! 513: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 514: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 515: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa3a7c820  ! 516: FADDs	fadds	%f31, %f0, %f17
	.word 0x8197e000  ! 517: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x81956000  ! 518: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa7500000  ! 519: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 520: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 521: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x81952000  ! 522: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb9504000  ! 523: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 525: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa3500000  ! 526: RDPR_TPC	<illegal instruction>
	.word 0x81946000  ! 527: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa1508000  ! 528: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 530: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa7504000  ! 531: RDPR_TNPC	<illegal instruction>
	.word 0xa1a748c0  ! 532: FSUBd	fsubd	%f60, %f0, %f16
	.word 0xa9500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 535: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa950c000  ! 536: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 537: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a7c920  ! 538: FMULs	fmuls	%f31, %f0, %f27
	.word 0xbf508000  ! 539: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 541: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xaf504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 543: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x81976000  ! 544: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa5500000  ! 545: RDPR_TPC	<illegal instruction>
	.word 0xad504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 547: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 548: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x85946000  ! 549: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb1504000  ! 550: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 551: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa5a78960  ! 552: FMULq	dis not found

	.word 0x8394e000  ! 553: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa1504000  ! 554: RDPR_TNPC	<illegal instruction>
	.word 0xada54840  ! 555: FADDd	faddd	%f52, %f0, %f22
	.word 0x87972000  ! 556: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbfa708c0  ! 557: FSUBd	fsubd	%f28, %f0, %f62
	.word 0xb1a40820  ! 558: FADDs	fadds	%f16, %f0, %f24
	.word 0xa150c000  ! 559: RDPR_TT	rdpr	%tt, %r16
	.word 0x81942000  ! 560: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb5500000  ! 561: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 562: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8794a000  ! 563: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x85962000  ! 564: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xada00520  ! 565: FSQRTs	fsqrt	
	.word 0xad508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 567: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 568: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 569: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x83946000  ! 570: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8395a000  ! 571: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb1a00560  ! 572: FSQRTq	fsqrt	
	.word 0xa350c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 574: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 575: RDPR_TNPC	<illegal instruction>
	.word 0xa9a60860  ! 576: FADDq	dis not found

	.word 0x87976000  ! 577: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x83952000  ! 578: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa7504000  ! 579: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 580: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 582: RDPR_TNPC	<illegal instruction>
	.word 0x8794e000  ! 583: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x85962000  ! 584: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb550c000  ! 585: RDPR_TT	<illegal instruction>
	.word 0xa150c000  ! 586: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 587: RDPR_TT	<illegal instruction>
	.word 0xa5a78820  ! 588: FADDs	fadds	%f30, %f0, %f18
	.word 0x8197e000  ! 589: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb5a749c0  ! 590: FDIVd	fdivd	%f60, %f0, %f26
	.word 0x8396e000  ! 591: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa5a6c960  ! 592: FMULq	dis not found

	.word 0xaf50c000  ! 593: RDPR_TT	<illegal instruction>
	.word 0x8195e000  ! 594: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb5500000  ! 595: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x87962000  ! 596: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x81946000  ! 597: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa7a709a0  ! 598: FDIVs	fdivs	%f28, %f0, %f19
	.word 0x83972000  ! 599: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb7504000  ! 600: RDPR_TNPC	<illegal instruction>
	.word 0xb1a48940  ! 601: FMULd	fmuld	%f18, %f0, %f24
	.word 0xaba6c9c0  ! 602: FDIVd	fdivd	%f58, %f0, %f52
	.word 0x83956000  ! 603: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9504000  ! 604: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xada00540  ! 608: FSQRTd	fsqrt	
	.word 0xaf508000  ! 609: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 610: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbf500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xada609a0  ! 612: FDIVs	fdivs	%f24, %f0, %f22
	.word 0xa1508000  ! 613: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 614: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x81976000  ! 615: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8397a000  ! 616: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x87966000  ! 617: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa5508000  ! 618: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xa9a40840  ! 620: FADDd	faddd	%f16, %f0, %f20
	.word 0xa3504000  ! 621: RDPR_TNPC	<illegal instruction>
	.word 0xa5a68920  ! 622: FMULs	fmuls	%f26, %f0, %f18
	.word 0x8397a000  ! 623: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa750c000  ! 624: RDPR_TT	<illegal instruction>
	.word 0xb7a449a0  ! 625: FDIVs	fdivs	%f17, %f0, %f27
	.word 0xbb504000  ! 626: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 627: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xaf508000  ! 628: RDPR_TSTATE	<illegal instruction>
	.word 0xada748e0  ! 629: FSUBq	dis not found

	.word 0xb1508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xa150c000  ! 632: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 634: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xaf50c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 636: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 637: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8597e000  ! 638: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb3500000  ! 639: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 640: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 641: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 642: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x83956000  ! 643: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x85972000  ! 644: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81942000  ! 645: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x83952000  ! 646: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb1a60940  ! 647: FMULd	fmuld	%f24, %f0, %f24
	.word 0x87956000  ! 648: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa550c000  ! 649: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 651: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 652: RDPR_TT	<illegal instruction>
	.word 0xaf508000  ! 653: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 655: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x83966000  ! 656: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xaf500000  ! 657: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa3500000  ! 658: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 659: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xad50c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 661: FSQRTs	fsqrt	
	.word 0xbf50c000  ! 662: RDPR_TT	<illegal instruction>
	.word 0x8197a000  ! 663: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb9a00520  ! 664: FSQRTs	fsqrt	
	.word 0x85976000  ! 665: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87942000  ! 666: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8196e000  ! 667: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9a608a0  ! 668: FSUBs	fsubs	%f24, %f0, %f28
	.word 0xad508000  ! 669: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 671: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb9504000  ! 672: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa950c000  ! 673: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 674: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85972000  ! 675: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa1500000  ! 676: RDPR_TPC	<illegal instruction>
	.word 0xbfa00560  ! 677: FSQRTq	fsqrt	
	.word 0xada708a0  ! 678: FSUBs	fsubs	%f28, %f0, %f22
	.word 0xb9508000  ! 679: RDPR_TSTATE	<illegal instruction>
	.word 0xbda7c840  ! 680: FADDd	faddd	%f62, %f0, %f30
	.word 0x81956000  ! 681: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8195a000  ! 682: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x87942000  ! 683: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xad50c000  ! 684: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 685: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8794e000  ! 686: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb550c000  ! 687: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 688: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x85966000  ! 689: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8597e000  ! 690: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa3508000  ! 691: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 692: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 693: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x85942000  ! 694: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x87972000  ! 695: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa9a00540  ! 696: FSQRTd	fsqrt	
	.word 0xb550c000  ! 697: RDPR_TT	<illegal instruction>
	.word 0x8794a000  ! 698: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb7504000  ! 699: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb3508000  ! 700: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 701: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbf504000  ! 702: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 703: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 704: RDPR_TPC	<illegal instruction>
	.word 0x8396a000  ! 705: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xaf500000  ! 706: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 707: RDPR_TT	<illegal instruction>
	.word 0xb9a48840  ! 708: FADDd	faddd	%f18, %f0, %f28
	.word 0xb3504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xafa64960  ! 710: FMULq	dis not found

	.word 0x8596e000  ! 711: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85976000  ! 712: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbb508000  ! 713: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xa1a00520  ! 715: FSQRTs	fsqrt	
	.word 0xa1500000  ! 716: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 717: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xaf504000  ! 718: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 719: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8395e000  ! 720: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x85966000  ! 721: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb9504000  ! 722: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb7504000  ! 723: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x87972000  ! 725: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb750c000  ! 726: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 728: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa3508000  ! 729: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 730: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 731: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 732: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x85966000  ! 733: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa1504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 735: RDPR_TT	<illegal instruction>
	.word 0xa3a00560  ! 736: FSQRTq	fsqrt	
	.word 0xbb508000  ! 737: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 738: RDPR_TT	<illegal instruction>
	.word 0xbda00520  ! 739: FSQRTs	fsqrt	
	.word 0xb9508000  ! 740: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 741: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5508000  ! 742: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbb508000  ! 743: RDPR_TSTATE	<illegal instruction>
	.word 0xada00520  ! 744: FSQRTs	fsqrt	
	.word 0xb1a68960  ! 745: FMULq	dis not found

	.word 0xb9500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 747: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa550c000  ! 748: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 749: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xb3a74920  ! 751: FMULs	fmuls	%f29, %f0, %f25
	.word 0xb950c000  ! 752: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 753: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8795e000  ! 754: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb3500000  ! 755: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 758: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb5a00520  ! 759: FSQRTs	fsqrt	
	.word 0x8394a000  ! 760: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xab508000  ! 761: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 762: RDPR_TT	<illegal instruction>
	.word 0xb5a00540  ! 763: FSQRTd	fsqrt	
	.word 0xa750c000  ! 764: RDPR_TT	<illegal instruction>
	.word 0xaf500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 766: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb9a409c0  ! 767: FDIVd	fdivd	%f16, %f0, %f28
	.word 0x87956000  ! 768: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb3508000  ! 769: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb1500000  ! 770: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 771: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 772: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 773: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xad508000  ! 774: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 775: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 777: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xafa00560  ! 778: FSQRTq	fsqrt	
	.word 0xb7a588e0  ! 779: FSUBq	dis not found

	.word 0x85972000  ! 780: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbb500000  ! 781: RDPR_TPC	<illegal instruction>
	.word 0xb3a44960  ! 782: FMULq	dis not found

	.word 0xa1504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 785: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb7504000  ! 786: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 787: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 788: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83962000  ! 789: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8194a000  ! 790: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x85976000  ! 791: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x85952000  ! 792: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x81956000  ! 793: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb504000  ! 794: RDPR_TNPC	<illegal instruction>
	.word 0xbba58920  ! 795: FMULs	fmuls	%f22, %f0, %f29
	.word 0x87942000  ! 796: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xaf500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 798: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x81962000  ! 799: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xab504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 801: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 802: RDPR_TT	<illegal instruction>
	.word 0x8197a000  ! 803: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8797e000  ! 804: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa5a608e0  ! 805: FSUBq	dis not found

	.word 0x81966000  ! 806: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8395e000  ! 807: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x81966000  ! 808: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb1508000  ! 809: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0xb9a00540  ! 811: FSQRTd	fsqrt	
	.word 0xaf504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 813: RDPR_TT	<illegal instruction>
	.word 0xada00520  ! 814: FSQRTs	fsqrt	
	.word 0xa750c000  ! 815: RDPR_TT	<illegal instruction>
	.word 0xb1a64860  ! 816: FADDq	dis not found

	.word 0x8394e000  ! 817: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xab50c000  ! 818: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 819: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 820: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa9a68920  ! 821: FMULs	fmuls	%f26, %f0, %f20
	.word 0xab508000  ! 822: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 823: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbf50c000  ! 824: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 825: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xad500000  ! 826: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 827: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x87976000  ! 828: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa3a748c0  ! 829: FSUBd	fsubd	%f60, %f0, %f48
	.word 0x81976000  ! 830: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x81952000  ! 831: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa5504000  ! 832: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0x8597e000  ! 834: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8596e000  ! 835: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xafa00540  ! 836: FSQRTd	fsqrt	
	.word 0x8594a000  ! 837: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x85956000  ! 838: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb1508000  ! 839: RDPR_TSTATE	<illegal instruction>
	.word 0x87942000  ! 840: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8196e000  ! 841: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa1504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xbfa548c0  ! 843: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb1a4c960  ! 844: FMULq	dis not found

	.word 0x8795a000  ! 845: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x81966000  ! 846: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83976000  ! 847: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb1508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 849: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb5508000  ! 850: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 851: RDPR_TPC	<illegal instruction>
	.word 0xbda749c0  ! 852: FDIVd	fdivd	%f60, %f0, %f30
	.word 0xada68820  ! 853: FADDs	fadds	%f26, %f0, %f22
	.word 0xa9a00540  ! 854: FSQRTd	fsqrt	
	.word 0xbf508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a648a0  ! 856: FSUBs	fsubs	%f25, %f0, %f28
	.word 0xad50c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 858: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xaf504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0x87976000  ! 861: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8395e000  ! 862: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa5508000  ! 863: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 864: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 865: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 866: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa950c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x8795a000  ! 868: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa350c000  ! 869: RDPR_TT	<illegal instruction>
	.word 0xb7a649c0  ! 870: FDIVd	fdivd	%f56, %f0, %f58
	.word 0x8796a000  ! 871: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1a588c0  ! 872: FSUBd	fsubd	%f22, %f0, %f24
	.word 0x87952000  ! 873: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb3a00520  ! 874: FSQRTs	fsqrt	
	.word 0x87952000  ! 875: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8197a000  ! 876: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xad500000  ! 877: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xb350c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x87956000  ! 879: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x85952000  ! 880: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa3508000  ! 881: RDPR_TSTATE	<illegal instruction>
	.word 0x8796a000  ! 882: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa5a4c940  ! 883: FMULd	fmuld	%f50, %f0, %f18
	.word 0xafa7c8c0  ! 884: FSUBd	fsubd	%f62, %f0, %f54
	.word 0xb1508000  ! 885: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 886: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbba609a0  ! 887: FDIVs	fdivs	%f24, %f0, %f29
	.word 0xaf508000  ! 888: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xaf50c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 890: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 891: RDPR_TNPC	<illegal instruction>
	.word 0x8595e000  ! 892: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa5a00520  ! 893: FSQRTs	fsqrt	
	.word 0xb7a70820  ! 894: FADDs	fadds	%f28, %f0, %f27
	.word 0xada44860  ! 895: FADDq	dis not found

	.word 0x83966000  ! 896: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa1508000  ! 897: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a000  ! 898: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa1504000  ! 899: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 900: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 901: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83952000  ! 902: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8594e000  ! 903: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87942000  ! 904: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbd504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 907: RDPR_TSTATE	<illegal instruction>
	.word 0xaba5c820  ! 908: FADDs	fadds	%f23, %f0, %f21
	.word 0x8594a000  ! 909: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8794e000  ! 910: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa1a508e0  ! 911: FSUBq	dis not found

	.word 0xbf50c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 913: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8395e000  ! 914: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb1a5c8a0  ! 915: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xbda7c8e0  ! 916: FSUBq	dis not found

	.word 0x8394e000  ! 917: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8195a000  ! 918: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb3508000  ! 919: RDPR_TSTATE	<illegal instruction>
	.word 0x8394a000  ! 920: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8194e000  ! 921: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa9a608a0  ! 922: FSUBs	fsubs	%f24, %f0, %f20
	.word 0xab508000  ! 923: RDPR_TSTATE	<illegal instruction>
	.word 0xafa5c960  ! 924: FMULq	dis not found

	.word 0x8794a000  ! 925: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa550c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0xa7a00560  ! 927: FSQRTq	fsqrt	
	.word 0xafa449a0  ! 928: FDIVs	fdivs	%f17, %f0, %f23
	.word 0x83952000  ! 929: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb3504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 933: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85976000  ! 934: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xaf500000  ! 935: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 936: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb7a648e0  ! 937: FSUBq	dis not found

	.word 0x81946000  ! 938: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbfa00560  ! 939: FSQRTq	fsqrt	
	.word 0x8794e000  ! 940: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8595e000  ! 941: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa9a789e0  ! 942: FDIVq	dis not found

	.word 0x8396a000  ! 943: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8596e000  ! 944: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8795a000  ! 945: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8195a000  ! 946: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa5500000  ! 947: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 948: RDPR_TNPC	<illegal instruction>
	.word 0xa1508000  ! 949: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a00520  ! 950: FSQRTs	fsqrt	
	.word 0x8395a000  ! 951: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb3a7c860  ! 952: FADDq	dis not found

	.word 0x85956000  ! 953: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa5504000  ! 954: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 955: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5a74960  ! 956: FMULq	dis not found

	.word 0x85962000  ! 957: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85966000  ! 958: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa1504000  ! 959: RDPR_TNPC	<illegal instruction>
	.word 0x87946000  ! 960: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x83946000  ! 961: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbf508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 963: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x83962000  ! 964: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xad500000  ! 965: RDPR_TPC	<illegal instruction>
	.word 0x8394a000  ! 966: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbb504000  ! 967: RDPR_TNPC	<illegal instruction>
	.word 0x85966000  ! 968: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb9504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x8794e000  ! 971: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xaf504000  ! 972: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 973: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 974: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 975: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 977: RDPR_TT	<illegal instruction>
	.word 0xbda00540  ! 978: FSQRTd	fsqrt	
	.word 0xad50c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 980: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xbd50c000  ! 981: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 982: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xaba44960  ! 983: FMULq	dis not found

	.word 0x8794e000  ! 984: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa3500000  ! 985: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa1a6c8c0  ! 986: FSUBd	fsubd	%f58, %f0, %f16
	.word 0xb7508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a00540  ! 988: FSQRTd	fsqrt	
	.word 0xa3508000  ! 989: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 990: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb7a74840  ! 991: FADDd	faddd	%f60, %f0, %f58
	.word 0xa5a608c0  ! 992: FSUBd	fsubd	%f24, %f0, %f18
	.word 0xa1504000  ! 993: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 995: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbb500000  ! 996: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x8596e000  ! 998: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
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
	.word 0xb1a749c0  ! 1: FDIVd	fdivd	%f60, %f0, %f24
	.word 0x83972000  ! 2: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbb508000  ! 3: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00560  ! 4: FSQRTq	fsqrt	
	.word 0xada00540  ! 5: FSQRTd	fsqrt	
	.word 0xafa70840  ! 6: FADDd	faddd	%f28, %f0, %f54
	.word 0x87962000  ! 7: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8595e000  ! 8: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xaba78840  ! 9: FADDd	faddd	%f30, %f0, %f52
	.word 0x8196e000  ! 10: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8195e000  ! 11: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb5508000  ! 12: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a4c8e0  ! 13: FSUBq	dis not found

	.word 0xad504000  ! 14: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 16: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa7a44960  ! 17: FMULq	dis not found

	.word 0x8596a000  ! 18: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8196a000  ! 19: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85956000  ! 20: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa5508000  ! 21: RDPR_TSTATE	<illegal instruction>
	.word 0x8397a000  ! 22: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x81976000  ! 23: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8797a000  ! 24: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x85972000  ! 25: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xad50c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 27: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 28: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8796e000  ! 29: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8396e000  ! 30: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa1500000  ! 31: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 32: FSQRTs	fsqrt	
	.word 0xb550c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 34: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 35: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 36: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x85956000  ! 37: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb7504000  ! 38: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 39: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xab500000  ! 40: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 41: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8797e000  ! 42: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85966000  ! 43: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x83946000  ! 44: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbda00560  ! 45: FSQRTq	fsqrt	
	.word 0xa5a64940  ! 46: FMULd	fmuld	%f56, %f0, %f18
	.word 0xa3a709c0  ! 47: FDIVd	fdivd	%f28, %f0, %f48
	.word 0x8595e000  ! 48: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8194e000  ! 49: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5504000  ! 50: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 51: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8794a000  ! 52: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xada00560  ! 53: FSQRTq	fsqrt	
	.word 0xa950c000  ! 54: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 55: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb9a64920  ! 56: FMULs	fmuls	%f25, %f0, %f28
	.word 0xab500000  ! 57: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 58: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 59: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x87956000  ! 60: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x81962000  ! 61: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa1508000  ! 62: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 63: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 64: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa5a00520  ! 65: FSQRTs	fsqrt	
	.word 0xbfa589c0  ! 66: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb7500000  ! 67: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 68: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a40820  ! 71: FADDs	fadds	%f16, %f0, %f18
	.word 0x81942000  ! 72: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb9508000  ! 73: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 74: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa150c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 76: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 77: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbb500000  ! 78: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 79: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbf504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 81: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb5a74840  ! 82: FADDd	faddd	%f60, %f0, %f26
	.word 0x8795e000  ! 83: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xaf500000  ! 84: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 85: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb5a6c9a0  ! 86: FDIVs	fdivs	%f27, %f0, %f26
	.word 0xab500000  ! 87: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 88: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xaf500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 90: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xaba00560  ! 91: FSQRTq	fsqrt	
	.word 0xa550c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0x87942000  ! 93: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x87976000  ! 94: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x85956000  ! 95: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb550c000  ! 96: RDPR_TT	<illegal instruction>
	.word 0xafa449e0  ! 97: FDIVq	dis not found

	.word 0xb5500000  ! 98: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 100: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xaf508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 104: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xaf50c000  ! 105: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 106: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 107: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa5a4c8c0  ! 108: FSUBd	fsubd	%f50, %f0, %f18
	.word 0xbfa70960  ! 109: FMULq	dis not found

	.word 0xa5504000  ! 110: RDPR_TNPC	<illegal instruction>
	.word 0xb9a449c0  ! 111: FDIVd	fdivd	%f48, %f0, %f28
	.word 0x83946000  ! 112: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbb50c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xafa64840  ! 114: FADDd	faddd	%f56, %f0, %f54
	.word 0xbb508000  ! 115: RDPR_TSTATE	<illegal instruction>
	.word 0x8597e000  ! 116: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8394e000  ! 117: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb5a00540  ! 118: FSQRTd	fsqrt	
	.word 0x8394e000  ! 119: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb7a5c8e0  ! 120: FSUBq	dis not found

	.word 0xada589a0  ! 121: FDIVs	fdivs	%f22, %f0, %f22
	.word 0xb3508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0x8796a000  ! 123: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x87942000  ! 124: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8395a000  ! 125: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa1504000  ! 126: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 127: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbf500000  ! 128: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x8795a000  ! 129: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8797e000  ! 130: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5a00560  ! 131: FSQRTq	fsqrt	
	.word 0xb9a509a0  ! 132: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb9a40940  ! 133: FMULd	fmuld	%f16, %f0, %f28
	.word 0x81976000  ! 134: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8194e000  ! 135: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x85942000  ! 136: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaba688a0  ! 137: FSUBs	fsubs	%f26, %f0, %f21
	.word 0xb9a588e0  ! 138: FSUBq	dis not found

	.word 0xab508000  ! 139: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0xa3a64860  ! 141: FADDq	dis not found

	.word 0x85972000  ! 142: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8596e000  ! 143: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb350c000  ! 144: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 145: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 146: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 148: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbd50c000  ! 149: RDPR_TT	<illegal instruction>
	.word 0xafa64840  ! 150: FADDd	faddd	%f56, %f0, %f54
	.word 0xb750c000  ! 151: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 152: FSQRTs	fsqrt	
	.word 0xa9a489e0  ! 153: FDIVq	dis not found

	.word 0xbd50c000  ! 154: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 155: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 156: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0x8397a000  ! 158: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x81956000  ! 159: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x87956000  ! 160: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x85962000  ! 161: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbba48940  ! 162: FMULd	fmuld	%f18, %f0, %f60
	.word 0x8194e000  ! 163: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbb50c000  ! 164: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 165: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb1504000  ! 166: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 169: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa9500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 171: RDPR_TT	<illegal instruction>
	.word 0xa5a5c940  ! 172: FMULd	fmuld	%f54, %f0, %f18
	.word 0x8196e000  ! 173: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xaf500000  ! 174: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xa5a6c960  ! 176: FMULq	dis not found

	.word 0xa9500000  ! 177: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 178: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xab504000  ! 179: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x8596a000  ! 181: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87946000  ! 182: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x85976000  ! 183: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x81946000  ! 184: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8795e000  ! 185: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa9508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0x85962000  ! 187: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa3a409c0  ! 188: FDIVd	fdivd	%f16, %f0, %f48
	.word 0xa9508000  ! 189: RDPR_TSTATE	<illegal instruction>
	.word 0x85962000  ! 190: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xaf500000  ! 191: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 192: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8796e000  ! 193: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x81976000  ! 194: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa1a00520  ! 195: FSQRTs	fsqrt	
	.word 0x8597e000  ! 196: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x87966000  ! 197: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xaf508000  ! 198: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 199: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00540  ! 200: FSQRTd	fsqrt	
	.word 0xb1500000  ! 201: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 202: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb7508000  ! 203: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 204: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 205: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 206: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbfa7c8e0  ! 207: FSUBq	dis not found

	.word 0x8395a000  ! 208: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb1500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x8396a000  ! 210: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa7504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 212: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 213: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb1504000  ! 214: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 215: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 216: RDPR_TT	<illegal instruction>
	.word 0xb5a50840  ! 217: FADDd	faddd	%f20, %f0, %f26
	.word 0xafa449c0  ! 218: FDIVd	fdivd	%f48, %f0, %f54
	.word 0xa3a00560  ! 219: FSQRTq	fsqrt	
	.word 0xbfa508a0  ! 220: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xbfa488a0  ! 221: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb5504000  ! 222: RDPR_TNPC	<illegal instruction>
	.word 0x87956000  ! 223: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb7a70960  ! 224: FMULq	dis not found

	.word 0xafa48960  ! 225: FMULq	dis not found

	.word 0xb3504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0x87976000  ! 227: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbd500000  ! 228: RDPR_TPC	<illegal instruction>
	.word 0xb1a64860  ! 229: FADDq	dis not found

	.word 0xa1504000  ! 230: RDPR_TNPC	<illegal instruction>
	.word 0xbda00540  ! 231: FSQRTd	fsqrt	
	.word 0xa5504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 233: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbd500000  ! 234: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 235: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 236: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb3a48860  ! 237: FADDq	dis not found

	.word 0xb150c000  ! 238: RDPR_TT	<illegal instruction>
	.word 0xafa60960  ! 239: FMULq	dis not found

	.word 0x81972000  ! 240: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xafa00540  ! 241: FSQRTd	fsqrt	
	.word 0xb3508000  ! 242: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 243: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 244: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbf508000  ! 245: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xbfa549a0  ! 247: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xada00540  ! 248: FSQRTd	fsqrt	
	.word 0xa1a589e0  ! 249: FDIVq	dis not found

	.word 0x8195a000  ! 250: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa150c000  ! 251: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 252: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb7504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 254: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 255: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb1500000  ! 256: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0x81942000  ! 258: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa350c000  ! 259: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 260: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 261: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8597a000  ! 262: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbba688c0  ! 263: FSUBd	fsubd	%f26, %f0, %f60
	.word 0xbd508000  ! 264: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 265: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 266: RDPR_TT	<illegal instruction>
	.word 0xa3a00540  ! 267: FSQRTd	fsqrt	
	.word 0xb7a4c8c0  ! 268: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xaf500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 270: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 271: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb750c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 273: RDPR_TSTATE	<illegal instruction>
	.word 0x87942000  ! 274: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbf504000  ! 275: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 276: RDPR_TNPC	<illegal instruction>
	.word 0xbda588c0  ! 277: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xa5500000  ! 278: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e000  ! 280: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbb500000  ! 281: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 283: RDPR_TPC	<illegal instruction>
	.word 0x87956000  ! 284: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa1504000  ! 285: RDPR_TNPC	<illegal instruction>
	.word 0x87946000  ! 286: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb1500000  ! 287: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 288: RDPR_TNPC	<illegal instruction>
	.word 0xb5a6c8c0  ! 289: FSUBd	fsubd	%f58, %f0, %f26
	.word 0xbb504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 291: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x85962000  ! 292: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb9a00560  ! 293: FSQRTq	fsqrt	
	.word 0x87946000  ! 294: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa7a4c9a0  ! 295: FDIVs	fdivs	%f19, %f0, %f19
	.word 0x8396e000  ! 296: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa9a00540  ! 297: FSQRTd	fsqrt	
	.word 0x8597a000  ! 298: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x87966000  ! 299: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8794a000  ! 300: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8795a000  ! 301: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xab500000  ! 302: RDPR_TPC	<illegal instruction>
	.word 0x8394a000  ! 303: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb3508000  ! 304: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 305: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa1a68860  ! 306: FADDq	dis not found

	.word 0xbb504000  ! 307: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 308: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85972000  ! 309: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb1a689a0  ! 310: FDIVs	fdivs	%f26, %f0, %f24
	.word 0xb3a709a0  ! 311: FDIVs	fdivs	%f28, %f0, %f25
	.word 0xada60940  ! 312: FMULd	fmuld	%f24, %f0, %f22
	.word 0xa9a00520  ! 313: FSQRTs	fsqrt	
	.word 0xad508000  ! 314: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 315: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 316: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 317: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 318: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87976000  ! 319: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb7508000  ! 320: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 321: RDPR_TPC	<illegal instruction>
	.word 0xb5a5c920  ! 322: FMULs	fmuls	%f23, %f0, %f26
	.word 0x83962000  ! 323: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8394a000  ! 324: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa150c000  ! 325: RDPR_TT	<illegal instruction>
	.word 0xa7a7c8e0  ! 326: FSUBq	dis not found

	.word 0xa7504000  ! 327: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 328: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 329: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0xaba7c8a0  ! 331: FSUBs	fsubs	%f31, %f0, %f21
	.word 0xa3a50860  ! 332: FADDq	dis not found

	.word 0xafa00540  ! 333: FSQRTd	fsqrt	
	.word 0x8396a000  ! 334: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x85952000  ! 335: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa3500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 337: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 338: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa9a70960  ! 339: FMULq	dis not found

	.word 0x81946000  ! 340: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x85962000  ! 341: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x81942000  ! 342: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8597e000  ! 343: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb3508000  ! 344: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 345: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 346: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb9500000  ! 347: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 348: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 349: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb5504000  ! 350: RDPR_TNPC	<illegal instruction>
	.word 0x8597e000  ! 351: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbb50c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 353: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8197e000  ! 354: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa3a00560  ! 355: FSQRTq	fsqrt	
	.word 0x85946000  ! 356: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbba00560  ! 357: FSQRTq	fsqrt	
	.word 0x8195e000  ! 358: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbba00540  ! 359: FSQRTd	fsqrt	
	.word 0x83976000  ! 360: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81962000  ! 361: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xbd50c000  ! 362: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 363: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8795e000  ! 364: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8597e000  ! 365: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa7504000  ! 366: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 367: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbd508000  ! 368: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x8597e000  ! 371: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa3500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xbba00560  ! 373: FSQRTq	fsqrt	
	.word 0x83952000  ! 374: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x87942000  ! 375: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbda4c9a0  ! 376: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xaf50c000  ! 377: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xbda588c0  ! 379: FSUBd	fsubd	%f22, %f0, %f30
	.word 0x83956000  ! 380: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x87966000  ! 381: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa9500000  ! 382: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 383: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8197a000  ! 384: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb5504000  ! 385: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 386: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa5a549c0  ! 387: FDIVd	fdivd	%f52, %f0, %f18
	.word 0x81966000  ! 388: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83946000  ! 389: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbb50c000  ! 390: RDPR_TT	<illegal instruction>
	.word 0xa5504000  ! 391: RDPR_TNPC	<illegal instruction>
	.word 0xafa78940  ! 392: FMULd	fmuld	%f30, %f0, %f54
	.word 0x83962000  ! 393: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb3508000  ! 394: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 395: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8796e000  ! 396: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb5a00560  ! 397: FSQRTq	fsqrt	
	.word 0x87942000  ! 398: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa7a488e0  ! 399: FSUBq	dis not found

	.word 0xbfa6c8e0  ! 400: FSUBq	dis not found

	.word 0xb3500000  ! 401: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 402: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb3504000  ! 403: RDPR_TNPC	<illegal instruction>
	.word 0xa5a70940  ! 404: FMULd	fmuld	%f28, %f0, %f18
	.word 0xb3508000  ! 405: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 406: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa950c000  ! 407: RDPR_TT	<illegal instruction>
	.word 0x81972000  ! 408: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x83962000  ! 409: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8396e000  ! 410: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb9508000  ! 411: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 412: RDPR_TT	<illegal instruction>
	.word 0xbfa508a0  ! 413: FSUBs	fsubs	%f20, %f0, %f31
	.word 0x85952000  ! 414: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x83946000  ! 415: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa550c000  ! 416: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 417: RDPR_TPC	<illegal instruction>
	.word 0xb5a449c0  ! 418: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xa3a00560  ! 419: FSQRTq	fsqrt	
	.word 0x83952000  ! 420: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8796e000  ! 421: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb5a448e0  ! 422: FSUBq	dis not found

	.word 0x8597e000  ! 423: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb150c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 425: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 427: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 428: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbf50c000  ! 429: RDPR_TT	<illegal instruction>
	.word 0x8796a000  ! 430: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8395e000  ! 431: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xab500000  ! 432: RDPR_TPC	<illegal instruction>
	.word 0xa350c000  ! 433: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0xbba00560  ! 435: FSQRTq	fsqrt	
	.word 0xa7a488e0  ! 436: FSUBq	dis not found

	.word 0x8596a000  ! 437: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb350c000  ! 438: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 439: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa3508000  ! 440: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 441: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 442: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 443: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbd504000  ! 444: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 445: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 446: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 447: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa5a68860  ! 448: FADDq	dis not found

	.word 0xa7a64960  ! 449: FMULq	dis not found

	.word 0xa3508000  ! 450: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xb3a489a0  ! 452: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb5500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 454: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x81942000  ! 455: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x85972000  ! 456: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81966000  ! 457: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8795a000  ! 458: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb9a64860  ! 459: FADDq	dis not found

	.word 0x8394a000  ! 460: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbf500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0xbfa00540  ! 462: FSQRTd	fsqrt	
	.word 0xa750c000  ! 463: RDPR_TT	<illegal instruction>
	.word 0xada589e0  ! 464: FDIVq	dis not found

	.word 0x8197e000  ! 465: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87972000  ! 466: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x87942000  ! 467: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb950c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0x8396e000  ! 469: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa950c000  ! 470: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 472: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 473: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb7508000  ! 474: RDPR_TSTATE	<illegal instruction>
	.word 0xbba648a0  ! 475: FSUBs	fsubs	%f25, %f0, %f29
	.word 0xa3504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 477: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x83942000  ! 478: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8194e000  ! 479: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbb504000  ! 480: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 481: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x81972000  ! 482: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa5504000  ! 483: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 484: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xaf508000  ! 485: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 486: RDPR_TPC	<illegal instruction>
	.word 0xb3a00560  ! 487: FSQRTq	fsqrt	
	.word 0xb7a5c9a0  ! 488: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb9504000  ! 489: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 490: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 491: RDPR_TPC	<illegal instruction>
	.word 0x81946000  ! 492: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb7a788c0  ! 493: FSUBd	fsubd	%f30, %f0, %f58
	.word 0xbda54940  ! 494: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb3508000  ! 495: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a7c8a0  ! 496: FSUBs	fsubs	%f31, %f0, %f16
	.word 0x8597e000  ! 497: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8595a000  ! 498: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8795e000  ! 499: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa7508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 501: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbb504000  ! 502: RDPR_TNPC	<illegal instruction>
	.word 0xb7a689c0  ! 503: FDIVd	fdivd	%f26, %f0, %f58
	.word 0xb150c000  ! 504: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 505: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 506: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 507: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 508: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 509: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbda448e0  ! 510: FSUBq	dis not found

	.word 0xbba488c0  ! 511: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xa3a588a0  ! 512: FSUBs	fsubs	%f22, %f0, %f17
	.word 0xb7508000  ! 513: RDPR_TSTATE	<illegal instruction>
	.word 0xb3508000  ! 514: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 515: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbfa70820  ! 516: FADDs	fadds	%f28, %f0, %f31
	.word 0x8195e000  ! 517: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8194e000  ! 518: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa7500000  ! 519: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 520: RDPR_TT	<illegal instruction>
	.word 0x85942000  ! 521: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x81952000  ! 522: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa3504000  ! 523: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 524: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 525: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbf500000  ! 526: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 527: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbb508000  ! 528: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 530: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa1504000  ! 531: RDPR_TNPC	<illegal instruction>
	.word 0xa3a6c8c0  ! 532: FSUBd	fsubd	%f58, %f0, %f48
	.word 0xa3500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0xb7504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 535: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa350c000  ! 536: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 537: RDPR_TSTATE	<illegal instruction>
	.word 0xbba54920  ! 538: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb9508000  ! 539: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 541: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xab504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0x8794a000  ! 543: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x81946000  ! 544: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xaf500000  ! 545: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 547: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 548: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x85952000  ! 549: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa7504000  ! 550: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 551: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb1a44960  ! 552: FMULq	dis not found

	.word 0x8395e000  ! 553: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbd504000  ! 554: RDPR_TNPC	<illegal instruction>
	.word 0xafa68840  ! 555: FADDd	faddd	%f26, %f0, %f54
	.word 0x87942000  ! 556: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbda648c0  ! 557: FSUBd	fsubd	%f56, %f0, %f30
	.word 0xbba40820  ! 558: FADDs	fadds	%f16, %f0, %f29
	.word 0xaf50c000  ! 559: RDPR_TT	rdpr	%tt, %r23
	.word 0x81976000  ! 560: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb3500000  ! 561: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 562: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8797e000  ! 563: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85976000  ! 564: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb5a00520  ! 565: FSQRTs	fsqrt	
	.word 0xbd508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 567: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 568: RDPR_TSTATE	<illegal instruction>
	.word 0x81966000  ! 569: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8397e000  ! 570: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8396e000  ! 571: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbda00560  ! 572: FSQRTq	fsqrt	
	.word 0xa550c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 574: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 575: RDPR_TNPC	<illegal instruction>
	.word 0xb3a70860  ! 576: FADDq	dis not found

	.word 0x87946000  ! 577: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x83976000  ! 578: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb5504000  ! 579: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 580: RDPR_TT	<illegal instruction>
	.word 0xa3504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 582: RDPR_TNPC	<illegal instruction>
	.word 0x8794a000  ! 583: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x85946000  ! 584: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb350c000  ! 585: RDPR_TT	<illegal instruction>
	.word 0xbf50c000  ! 586: RDPR_TT	<illegal instruction>
	.word 0xa750c000  ! 587: RDPR_TT	<illegal instruction>
	.word 0xb9a74820  ! 588: FADDs	fadds	%f29, %f0, %f28
	.word 0x81956000  ! 589: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa1a489c0  ! 590: FDIVd	fdivd	%f18, %f0, %f16
	.word 0x83966000  ! 591: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xafa50960  ! 592: FMULq	dis not found

	.word 0xb550c000  ! 593: RDPR_TT	<illegal instruction>
	.word 0x8195e000  ! 594: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa3500000  ! 595: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 596: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8196e000  ! 597: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xafa749a0  ! 598: FDIVs	fdivs	%f29, %f0, %f23
	.word 0x83962000  ! 599: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb7504000  ! 600: RDPR_TNPC	<illegal instruction>
	.word 0xa9a4c940  ! 601: FMULd	fmuld	%f50, %f0, %f20
	.word 0xb3a509c0  ! 602: FDIVd	fdivd	%f20, %f0, %f56
	.word 0x8395e000  ! 603: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb7504000  ! 604: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 606: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 607: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00540  ! 608: FSQRTd	fsqrt	
	.word 0xa9508000  ! 609: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 610: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa7500000  ! 611: RDPR_TPC	<illegal instruction>
	.word 0xa5a449a0  ! 612: FDIVs	fdivs	%f17, %f0, %f18
	.word 0xa7508000  ! 613: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8194a000  ! 614: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x81956000  ! 615: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x83976000  ! 616: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x87972000  ! 617: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xaf508000  ! 618: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 619: RDPR_TT	<illegal instruction>
	.word 0xbba7c840  ! 620: FADDd	faddd	%f62, %f0, %f60
	.word 0xb9504000  ! 621: RDPR_TNPC	<illegal instruction>
	.word 0xbba5c920  ! 622: FMULs	fmuls	%f23, %f0, %f29
	.word 0x83952000  ! 623: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb950c000  ! 624: RDPR_TT	<illegal instruction>
	.word 0xb3a4c9a0  ! 625: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xb9504000  ! 626: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 627: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xab508000  ! 628: RDPR_TSTATE	<illegal instruction>
	.word 0xbda7c8e0  ! 629: FSUBq	dis not found

	.word 0xad508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 632: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x8597e000  ! 634: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbf50c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 636: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 637: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85962000  ! 638: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xaf500000  ! 639: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 640: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 641: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 642: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8396e000  ! 643: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8594e000  ! 644: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x81966000  ! 645: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83942000  ! 646: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7a44940  ! 647: FMULd	fmuld	%f48, %f0, %f58
	.word 0x8797e000  ! 648: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xad50c000  ! 649: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 651: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 652: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 653: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 655: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8397a000  ! 656: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbd500000  ! 657: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 658: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 659: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbb50c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0xbfa00520  ! 661: FSQRTs	fsqrt	
	.word 0xbb50c000  ! 662: RDPR_TT	<illegal instruction>
	.word 0x8197a000  ! 663: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb5a00520  ! 664: FSQRTs	fsqrt	
	.word 0x8595a000  ! 665: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x87962000  ! 666: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8195e000  ! 667: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb3a508a0  ! 668: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xad508000  ! 669: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 671: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xaf504000  ! 672: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 673: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 674: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85946000  ! 675: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbb500000  ! 676: RDPR_TPC	<illegal instruction>
	.word 0xafa00560  ! 677: FSQRTq	fsqrt	
	.word 0xb9a6c8a0  ! 678: FSUBs	fsubs	%f27, %f0, %f28
	.word 0xb1508000  ! 679: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a74840  ! 680: FADDd	faddd	%f60, %f0, %f28
	.word 0x81946000  ! 681: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x81942000  ! 682: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x87966000  ! 683: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbb50c000  ! 684: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 685: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8794a000  ! 686: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xaf50c000  ! 687: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 688: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8596a000  ! 689: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85972000  ! 690: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa9508000  ! 691: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 692: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 693: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8594a000  ! 694: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87976000  ! 695: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa5a00540  ! 696: FSQRTd	fsqrt	
	.word 0xa150c000  ! 697: RDPR_TT	<illegal instruction>
	.word 0x87966000  ! 698: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xad504000  ! 699: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 700: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 701: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbd504000  ! 702: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 703: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 704: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 705: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa5500000  ! 706: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 707: RDPR_TT	<illegal instruction>
	.word 0xafa7c840  ! 708: FADDd	faddd	%f62, %f0, %f54
	.word 0xa9504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xbda78960  ! 710: FMULq	dis not found

	.word 0x85976000  ! 711: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x85972000  ! 712: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb7508000  ! 713: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xafa00520  ! 715: FSQRTs	fsqrt	
	.word 0xad500000  ! 716: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 717: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb7504000  ! 718: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 719: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x83946000  ! 720: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x85942000  ! 721: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa5504000  ! 722: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 723: RDPR_TNPC	<illegal instruction>
	.word 0xad500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 725: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xad50c000  ! 726: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 727: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 728: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xab508000  ! 729: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 730: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 731: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 732: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x85952000  ! 733: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa1504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 735: RDPR_TT	<illegal instruction>
	.word 0xaba00560  ! 736: FSQRTq	fsqrt	
	.word 0xb3508000  ! 737: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 738: RDPR_TT	<illegal instruction>
	.word 0xbda00520  ! 739: FSQRTs	fsqrt	
	.word 0xad508000  ! 740: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 741: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa7508000  ! 742: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 743: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a00520  ! 744: FSQRTs	fsqrt	
	.word 0xbda44960  ! 745: FMULq	dis not found

	.word 0xb1500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 747: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb750c000  ! 748: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 749: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xb3a60920  ! 751: FMULs	fmuls	%f24, %f0, %f25
	.word 0xab50c000  ! 752: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 753: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8794a000  ! 754: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xaf500000  ! 755: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 756: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 758: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbfa00520  ! 759: FSQRTs	fsqrt	
	.word 0x83976000  ! 760: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xad508000  ! 761: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 762: RDPR_TT	<illegal instruction>
	.word 0xafa00540  ! 763: FSQRTd	fsqrt	
	.word 0xaf50c000  ! 764: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 766: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb1a409c0  ! 767: FDIVd	fdivd	%f16, %f0, %f24
	.word 0x8796e000  ! 768: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb3508000  ! 769: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 770: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 771: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 772: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 773: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbf508000  ! 774: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 775: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 777: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa7a00560  ! 778: FSQRTq	fsqrt	
	.word 0xb5a608e0  ! 779: FSUBq	dis not found

	.word 0x8596a000  ! 780: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xad500000  ! 781: RDPR_TPC	<illegal instruction>
	.word 0xa3a68960  ! 782: FMULq	dis not found

	.word 0xb5504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 785: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xab504000  ! 786: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 787: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 788: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x83946000  ! 789: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x81952000  ! 790: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8594a000  ! 791: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8596a000  ! 792: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x81962000  ! 793: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb9504000  ! 794: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa3a4c920  ! 795: FMULs	fmuls	%f19, %f0, %f17
	.word 0x8795a000  ! 796: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa5500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 798: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8197e000  ! 799: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbb504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 801: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 802: RDPR_TT	<illegal instruction>
	.word 0x81956000  ! 803: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x87946000  ! 804: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa1a7c8e0  ! 805: FSUBq	dis not found

	.word 0x8196e000  ! 806: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83966000  ! 807: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x81966000  ! 808: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbb508000  ! 809: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0xa5a00540  ! 811: FSQRTd	fsqrt	
	.word 0xbf504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 813: RDPR_TT	<illegal instruction>
	.word 0xa5a00520  ! 814: FSQRTs	fsqrt	
	.word 0xb550c000  ! 815: RDPR_TT	<illegal instruction>
	.word 0xb1a5c860  ! 816: FADDq	dis not found

	.word 0x8397e000  ! 817: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb550c000  ! 818: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 819: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 820: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbfa40920  ! 821: FMULs	fmuls	%f16, %f0, %f31
	.word 0xad508000  ! 822: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 823: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xab50c000  ! 824: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 825: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb5500000  ! 826: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 827: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x87962000  ! 828: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb7a448c0  ! 829: FSUBd	fsubd	%f48, %f0, %f58
	.word 0x81952000  ! 830: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x81966000  ! 831: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa1504000  ! 832: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 834: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85956000  ! 835: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa1a00540  ! 836: FSQRTd	fsqrt	
	.word 0x8596e000  ! 837: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85946000  ! 838: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa1508000  ! 839: RDPR_TSTATE	<illegal instruction>
	.word 0x87972000  ! 840: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8197e000  ! 841: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb3504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xb5a788c0  ! 843: FSUBd	fsubd	%f30, %f0, %f26
	.word 0xa9a74960  ! 844: FMULq	dis not found

	.word 0x8795e000  ! 845: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x81942000  ! 846: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8396e000  ! 847: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbf508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 849: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa9508000  ! 850: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 851: RDPR_TPC	<illegal instruction>
	.word 0xafa649c0  ! 852: FDIVd	fdivd	%f56, %f0, %f54
	.word 0xa9a58820  ! 853: FADDs	fadds	%f22, %f0, %f20
	.word 0xa1a00540  ! 854: FSQRTd	fsqrt	
	.word 0xa1508000  ! 855: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a588a0  ! 856: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xa350c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 858: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbf504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 861: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x83966000  ! 862: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbf508000  ! 863: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 864: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 865: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 866: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa950c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 868: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa950c000  ! 869: RDPR_TT	<illegal instruction>
	.word 0xa7a509c0  ! 870: FDIVd	fdivd	%f20, %f0, %f50
	.word 0x87972000  ! 871: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa5a4c8c0  ! 872: FSUBd	fsubd	%f50, %f0, %f18
	.word 0x87946000  ! 873: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa3a00520  ! 874: FSQRTs	fsqrt	
	.word 0x8797a000  ! 875: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8197e000  ! 876: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbb500000  ! 877: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x87946000  ! 879: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8595a000  ! 880: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbd508000  ! 881: RDPR_TSTATE	<illegal instruction>
	.word 0x8795e000  ! 882: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa9a7c940  ! 883: FMULd	fmuld	%f62, %f0, %f20
	.word 0xafa648c0  ! 884: FSUBd	fsubd	%f56, %f0, %f54
	.word 0xbb508000  ! 885: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 886: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb9a689a0  ! 887: FDIVs	fdivs	%f26, %f0, %f28
	.word 0xb7508000  ! 888: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 890: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 891: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 892: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa3a00520  ! 893: FSQRTs	fsqrt	
	.word 0xa7a68820  ! 894: FADDs	fadds	%f26, %f0, %f19
	.word 0xb3a58860  ! 895: FADDq	dis not found

	.word 0x8397a000  ! 896: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa1508000  ! 897: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 898: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa5504000  ! 899: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 900: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 901: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x83966000  ! 902: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x85952000  ! 903: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x87976000  ! 904: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xab504000  ! 905: RDPR_TNPC	<illegal instruction>
	.word 0xab508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 907: RDPR_TSTATE	<illegal instruction>
	.word 0xada5c820  ! 908: FADDs	fadds	%f23, %f0, %f22
	.word 0x8597e000  ! 909: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8796a000  ! 910: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xada4c8e0  ! 911: FSUBq	dis not found

	.word 0xbb50c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 913: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x83966000  ! 914: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xada588a0  ! 915: FSUBs	fsubs	%f22, %f0, %f22
	.word 0xbba5c8e0  ! 916: FSUBq	dis not found

	.word 0x8394a000  ! 917: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x81976000  ! 918: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbb508000  ! 919: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 920: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8194a000  ! 921: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xafa408a0  ! 922: FSUBs	fsubs	%f16, %f0, %f23
	.word 0xb7508000  ! 923: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a74960  ! 924: FMULq	dis not found

	.word 0x8795a000  ! 925: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb150c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0xa9a00560  ! 927: FSQRTq	fsqrt	
	.word 0xa3a5c9a0  ! 928: FDIVs	fdivs	%f23, %f0, %f17
	.word 0x8396e000  ! 929: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa9504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 933: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x85966000  ! 934: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbd500000  ! 935: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 936: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa7a708e0  ! 937: FSUBq	dis not found

	.word 0x8197a000  ! 938: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa1a00560  ! 939: FSQRTq	fsqrt	
	.word 0x8797a000  ! 940: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8596a000  ! 941: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa3a409e0  ! 942: FDIVq	dis not found

	.word 0x83966000  ! 943: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8596e000  ! 944: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x87976000  ! 945: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8197a000  ! 946: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbd500000  ! 947: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 948: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 949: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a00520  ! 950: FSQRTs	fsqrt	
	.word 0x8394a000  ! 951: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb3a6c860  ! 952: FADDq	dis not found

	.word 0x8595a000  ! 953: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xad504000  ! 954: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 955: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbda50960  ! 956: FMULq	dis not found

	.word 0x85972000  ! 957: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8595a000  ! 958: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbd504000  ! 959: RDPR_TNPC	<illegal instruction>
	.word 0x87956000  ! 960: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x83956000  ! 961: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xab508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 963: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x83956000  ! 964: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb5500000  ! 965: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 966: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xab504000  ! 967: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 968: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb1504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x8795e000  ! 971: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa7504000  ! 972: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 973: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 974: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 975: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 977: RDPR_TT	<illegal instruction>
	.word 0xbfa00540  ! 978: FSQRTd	fsqrt	
	.word 0xb150c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 980: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa350c000  ! 981: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 982: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb3a48960  ! 983: FMULq	dis not found

	.word 0x8797a000  ! 984: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbd500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0xa3a708c0  ! 986: FSUBd	fsubd	%f28, %f0, %f48
	.word 0xa3508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0xada00540  ! 988: FSQRTd	fsqrt	
	.word 0xa1508000  ! 989: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 990: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa3a58840  ! 991: FADDd	faddd	%f22, %f0, %f48
	.word 0xa7a648c0  ! 992: FSUBd	fsubd	%f56, %f0, %f50
	.word 0xb1504000  ! 993: RDPR_TNPC	<illegal instruction>
	.word 0xa9508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 995: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbb500000  ! 996: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 998: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x0dac1f8400003df6
	.xword	0x3eb03ea200006a30
	.xword	0x17ed82100000f90c
	.xword	0x6141d26700002bf5
	.xword	0x4d68a59500000a61
	.xword	0x88ad2e0300008b53
	.xword	0xf255ca5e00000bda
	.xword	0xdea3a38d00004882
	.xword	0xd0bfd20500000ce9
	.xword	0x03d364a100001e63
	.xword	0xce1c1a3f00004b77
	.xword	0x8f8746160000b9e4
	.xword	0xbe12ee3500009978
	.xword	0x1fbf2f6d0000484e
	.xword	0x54b58dbd00004863
	.xword	0xc9058c7000008b1c
	.xword	0x39551c4700003cac
	.xword	0x9d0817a000009bf7
	.xword	0x7125eb0900003d87
	.xword	0xfc226eaf00005b66
	.xword	0xce19493f00005e93
	.xword	0xc949c02a0000f84a
	.xword	0xe9830f7c0000d963
	.xword	0xf2e3a35a0000dd2b
	.xword	0xa396e02400002b8f
	.xword	0xd3e071f40000cc0c
	.xword	0x3ed8865c00001a36
	.xword	0x5881dbac00005c26
	.xword	0xc39072fe000078fe
	.xword	0xa378e67c00009fe0
	.xword	0x89b9503e00002cba
	.xword	0x6f8d088f0000ab8d
	.xword	0x389a777400002877
	.xword	0x85c445c600002a34
	.xword	0xebaa811d0000895e
	.xword	0x1d25553f00005de1
	.xword	0xc18af20a00002f4a
	.xword	0x94bebe4400006f16
	.xword	0x577a58af000019b0
	.xword	0x90806f3700006c97
	.xword	0x0fcc49050000aa30
	.xword	0x3ced944600004cc0
	.xword	0xa912780100004842
	.xword	0xc394ae0800006e7f
	.xword	0x7d98e2ac00002eb5
	.xword	0x7b78660c000058c3
	.xword	0x9b47a0780000af47
	.xword	0x4a873f470000f8f8
	.xword	0x01ad4d0b00000836
	.xword	0x1e93f81200000ade
	.xword	0x6deb013e00002d7b
	.xword	0x6fee6f7b0000cb77
	.xword	0xef8dc6fb00002997
	.xword	0xc2c4f77600002f3e
	.xword	0x015198010000eecd
	.xword	0x23b4047200003c96
	.xword	0x9228584500007d7d
	.xword	0x9c5347f300004986
	.xword	0x01f1b76500006e6d
	.xword	0x0c3c623b0000d82c
	.xword	0x6c721fd900005bde
	.xword	0x04b6fad100006dea
	.xword	0xd662b0240000bd22
	.xword	0x9e3c0d6d00006c4d
	.xword	0x19496ac50000fad2
	.xword	0x6e1d585100003fc2
	.xword	0xdc1ffef30000dd74
	.xword	0x1d0a256e00008ae3
	.xword	0x01da5b3a000008a9
	.xword	0x01ac15090000dc04
	.xword	0xdcaafefc0000cbd5
	.xword	0xe326cd4c0000dfa2
	.xword	0x07c8c93300003ea5
	.xword	0x40d85e9700009f75
	.xword	0xf901efe40000980a
	.xword	0x9fc1fd2f00009bd3
	.xword	0x7b30fa470000cf77
	.xword	0x1b0f09040000dcc3
	.xword	0xf896cb1200007f20
	.xword	0xe360bbe500008d4c
	.xword	0x88bddfa800003ba7
	.xword	0x96487a300000b920
	.xword	0x9fe44fab0000f858
	.xword	0xd34cb4640000fd3b
	.xword	0xa12875ed00005a58
	.xword	0xe4a3631000006d59
	.xword	0x71ee2c360000bdba
	.xword	0x6ba2a6650000eb2b
	.xword	0x39c81f2a00008a15
	.xword	0x5751deb20000cf6a
	.xword	0xebe02be0000098ea
	.xword	0x9f89c9000000ba9a
	.xword	0x80b030250000be77
	.xword	0xf21d80d30000ac31
	.xword	0x1767074f0000a997
	.xword	0x45cd27260000aa28
	.xword	0x96ce9fcb00008e53
	.xword	0x56fa92b00000bc66
	.xword	0x054e70030000de69
	.xword	0x51712665000079be
	.xword	0x7ed2125b00000c8e
	.xword	0x4073208600003e0b
	.xword	0x625622ce00007d90
	.xword	0xf516a3e100004bcb
	.xword	0x5a80b0960000ff97
	.xword	0xee5bd2ba00005b04
	.xword	0x23f1f07f000078d3
	.xword	0xcae3d8d600008e19
	.xword	0x8980b07f0000e854
	.xword	0xa0205d300000c939
	.xword	0xf86dad6300009d13
	.xword	0xffd58b9300000f2a
	.xword	0x55e2350f0000c9e5
	.xword	0x3f65d48e00005916
	.xword	0xd60d14f40000df2d
	.xword	0xb9db6dab0000ab0c
	.xword	0xd805f5370000ea6f
	.xword	0xb806d1370000bd45
	.xword	0x93382ec70000fc95
	.xword	0x3f1ccd420000a966
	.xword	0xaf81587e000099e9
	.xword	0x5d811e0300000fbf
	.xword	0x2d7a9d1b00008d15
	.xword	0x9fb5a4030000fe5e
	.xword	0xa8e15eba00005cb5
	.xword	0x803a715500005a1c
	.xword	0xa3fe201400008ef7
	.xword	0x11aed46c0000cf79



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
!!#   IJ_bind_thread_group("diag.j", 22, th_all, 0xf);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 24,"{16}" );
!!#   IJ_set_rvar ("diag.j", 25, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 26, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 28, Rv_rand64, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 30, ijdefault, Ft_Rs1, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 31, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 32, ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 33, ijdefault, Ft_Rd, "{16..31}");
!!# 
!!#   IJ_printf ("diag.j", 35, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_init_regs_by_setx ("diag.j", 36, th_all, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 37, th_all, "\tsetx\tdata_start, %%r1, %%g7\n");
!!# 
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 40, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 44, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_th_fork("diag.j", 45,0x2, 0x4, 0x8, -1);;
!!# 
!!#   IJ_printf ("diag.j", 47, th_all, "\tta\tT_CHANGE_PRIV\n");
!!#   IJ_printf ("diag.j", 48, th_all, "\twrpr\t%%g0, 1, %%tl\n");
!!#   IJ_printf ("diag.j", 49, th_all, "\twrpr\t%%l0, %%g0, %%tpc\n");
!!#   IJ_printf ("diag.j", 50, th_all, "\twrpr\t%%l0, %%g0, %%tnpc\n");
!!#   IJ_printf ("diag.j", 51, th_all, "\twrpr\t%%l0, %%g0, %%tstate\n");
!!#   IJ_printf ("diag.j", 52, th_all, "\twrpr\t%%l0, %%g0, %%tt\n");
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
!!#   IJ_th_join("diag.j", 61,0xf);
!!#   IJ_th_start ("diag.j", 62,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 64, th_all, "\t.data\ndata_start:\n\n");
!!#   for (j = 0; j < 128; j++) {
!!# 	IJ_printf  ("diag.j", 66, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 		IJ_generate ("diag.j", 96, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type:
!!# 	write_tsa
!!# 	| read_tsa
!!# 	| fp_arith %rvar  Rv_mid_wt
!!# ;
!!# 
!!# write_tsa: 
!!# 	tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
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
