// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_tsasr_31_rand_s1.s
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
   random seed:	615264892
   Jal tlu_multi_tsasr_31.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	nop

	wr	%g0, 4, %fprs
! Register init code

	setx 0x6b9fe33e0000aa92, %g1, %g0
	setx 0x59b96fca00001dd6, %g1, %g1
	setx 0x974551a80000bfc3, %g1, %g2
	setx 0x8e3db0d50000489b, %g1, %g3
	setx 0x70bc89c00000fe3f, %g1, %g4
	setx 0xfd9fbcfc00007f9d, %g1, %g5
	setx 0xccefb85600007fa6, %g1, %g6
	setx 0x6f5706ae00002ae9, %g1, %g7
	setx 0xcafa20490000fc45, %g1, %r16
	setx 0x0bcc785e0000bbc5, %g1, %r17
	setx 0xc4a9dc1d00003a70, %g1, %r18
	setx 0xbc18ac61000058c5, %g1, %r19
	setx 0x9713cc3b00005dc6, %g1, %r20
	setx 0x1dd02c700000186d, %g1, %r21
	setx 0x8b0bdcf800008edd, %g1, %r22
	setx 0x7971af2000000c63, %g1, %r23
	setx 0x7d92d4af00007ee7, %g1, %r24
	setx 0xe5acfcb90000d849, %g1, %r25
	setx 0x02f6fc7f0000f981, %g1, %r26
	setx 0x2218ce710000f86d, %g1, %r27
	setx 0xca911a1200000c00, %g1, %r28
	setx 0x8d9714bb0000284e, %g1, %r29
	setx 0xf05b936a0000dcb8, %g1, %r30
	setx 0xe5328b6700004aa5, %g1, %r31
	save
	setx 0xe89dccf100004e0c, %g1, %r16
	setx 0x7cbdbe010000fa94, %g1, %r17
	setx 0xb447a8b400006a90, %g1, %r18
	setx 0xd8deb7480000edb2, %g1, %r19
	setx 0x9e794ac200000a45, %g1, %r20
	setx 0x5817a88e00002c48, %g1, %r21
	setx 0x9065c58700007dfb, %g1, %r22
	setx 0xc6dfd05a00008b37, %g1, %r23
	setx 0x25db685000006a83, %g1, %r24
	setx 0x9fc011e400002e1d, %g1, %r25
	setx 0xeb992ef600000c4e, %g1, %r26
	setx 0xc1a0f16100009854, %g1, %r27
	setx 0x459aff220000dfde, %g1, %r28
	setx 0xb9871d960000cd52, %g1, %r29
	setx 0x77297ccb0000b8c5, %g1, %r30
	setx 0x83a16a8900001d9c, %g1, %r31
	save
	setx 0x3f3b8f900000586e, %g1, %r16
	setx 0x9747379b0000bb6a, %g1, %r17
	setx 0xee5c578100009d69, %g1, %r18
	setx 0x30c9856f00009de3, %g1, %r19
	setx 0xc58df2f80000adca, %g1, %r20
	setx 0x261a843c00006ded, %g1, %r21
	setx 0xab81564200007c9d, %g1, %r22
	setx 0x35d4550c00002bcf, %g1, %r23
	setx 0xac0e0b690000d93a, %g1, %r24
	setx 0x45aa2a220000f910, %g1, %r25
	setx 0x16d20d9d00001dba, %g1, %r26
	setx 0xba0e3dfa00009888, %g1, %r27
	setx 0xb476bd5900004baf, %g1, %r28
	setx 0x517d39a80000c898, %g1, %r29
	setx 0xa0df36a20000dad0, %g1, %r30
	setx 0x32c76a0700005f24, %g1, %r31
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
	.word 0x8594e000  ! 1: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb5a6c920  ! 2: FMULs	fmuls	%f27, %f0, %f26
	.word 0xa750c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 6: RDPR_TNPC	<illegal instruction>
	.word 0x839fa000  ! 7: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8397e000  ! 8: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xad500000  ! 9: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 10: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839fa000  ! 11: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8397e000  ! 12: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb950c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x8194e000  ! 14: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8397e000  ! 15: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819e2000  ! 16: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x81942000  ! 17: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8d942000  ! 18: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xad508000  ! 19: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 20: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbda00540  ! 21: FSQRTd	fsqrt	
	.word 0x8195a000  ! 22: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbb504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 24: RDPR_TNPC	<illegal instruction>
	.word 0xb7a608e0  ! 25: FSUBq	dis not found

	.word 0x8396a000  ! 26: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8d972000  ! 27: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x839e2000  ! 28: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb3a78840  ! 29: FADDd	faddd	%f30, %f0, %f56
	.word 0x87952000  ! 30: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83966000  ! 31: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa550c000  ! 32: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 33: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839ea000  ! 34: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xad50c000  ! 35: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 36: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00540  ! 37: FSQRTd	fsqrt	
	.word 0x85952000  ! 38: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x819fa000  ! 39: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xaba68860  ! 40: FADDq	dis not found

	.word 0x839de000  ! 41: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8d94a000  ! 42: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8597e000  ! 43: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa9a548a0  ! 44: FSUBs	fsubs	%f21, %f0, %f20
	.word 0x87942000  ! 45: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8d962000  ! 46: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb3500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 48: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87976000  ! 49: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d95a000  ! 50: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa1504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0x819c6000  ! 52: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa750c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x819d6000  ! 54: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa150c000  ! 55: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb9500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xa9a5c8e0  ! 59: FSUBq	dis not found

	.word 0x8596a000  ! 60: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8796e000  ! 61: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb1504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 63: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839f6000  ! 64: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbf504000  ! 65: RDPR_TNPC	<illegal instruction>
	.word 0x87976000  ! 66: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x85966000  ! 67: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d94a000  ! 68: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa3500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xafa64920  ! 70: FMULs	fmuls	%f25, %f0, %f23
	.word 0x85962000  ! 71: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xada648a0  ! 72: FSUBs	fsubs	%f25, %f0, %f22
	.word 0xaf500000  ! 73: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xa150c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 76: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819da000  ! 77: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d96a000  ! 78: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb150c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 80: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e000  ! 81: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8394a000  ! 82: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8194a000  ! 83: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbba78960  ! 84: FMULq	dis not found

	.word 0xbda6c840  ! 85: FADDd	faddd	%f58, %f0, %f30
	.word 0x8196a000  ! 86: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87942000  ! 87: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xab500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xab50c000  ! 89: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 90: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819de000  ! 91: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x83946000  ! 92: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x85942000  ! 93: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb1a6c9e0  ! 94: FDIVq	dis not found

	.word 0x8194e000  ! 95: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xad508000  ! 96: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb9a4c9c0  ! 98: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xa7504000  ! 99: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 100: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 101: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa750c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xb9a00560  ! 103: FSQRTq	fsqrt	
	.word 0xa9500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 105: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa1508000  ! 106: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 107: RDPR_TT	<illegal instruction>
	.word 0x81972000  ! 108: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819de000  ! 109: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d976000  ! 110: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb5504000  ! 111: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 112: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 114: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 115: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3500000  ! 116: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 117: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x81966000  ! 118: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa3504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 120: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819d2000  ! 121: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb7504000  ! 122: RDPR_TNPC	<illegal instruction>
	.word 0xa1a40920  ! 123: FMULs	fmuls	%f16, %f0, %f16
	.word 0x8796e000  ! 124: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xad508000  ! 125: RDPR_TSTATE	<illegal instruction>
	.word 0x839f2000  ! 126: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb5a589c0  ! 127: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xbba508e0  ! 128: FSUBq	dis not found

	.word 0xbb504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0x819f2000  ! 132: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x85976000  ! 133: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87976000  ! 134: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbf504000  ! 135: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 136: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819d2000  ! 137: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa7a58820  ! 138: FADDs	fadds	%f22, %f0, %f19
	.word 0xb950c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 140: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0x8797e000  ! 143: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x87962000  ! 144: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xab500000  ! 145: RDPR_TPC	<illegal instruction>
	.word 0xafa6c8e0  ! 146: FSUBq	dis not found

	.word 0x8d946000  ! 147: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb5a4c940  ! 148: FMULd	fmuld	%f50, %f0, %f26
	.word 0x819ca000  ! 149: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d94a000  ! 150: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xbba00540  ! 151: FSQRTd	fsqrt	
	.word 0xa1500000  ! 152: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 153: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 154: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa5504000  ! 155: RDPR_TNPC	<illegal instruction>
	.word 0x8595e000  ! 156: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa5500000  ! 157: RDPR_TPC	<illegal instruction>
	.word 0xa7500000  ! 158: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 159: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb9504000  ! 160: RDPR_TNPC	<illegal instruction>
	.word 0xafa5c8e0  ! 161: FSUBq	dis not found

	.word 0xaf50c000  ! 162: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 163: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb5500000  ! 164: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 165: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xbb508000  ! 167: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 168: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83976000  ! 169: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb5504000  ! 170: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbd508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a449c0  ! 173: FDIVd	fdivd	%f48, %f0, %f16
	.word 0x839da000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xbfa6c840  ! 175: FADDd	faddd	%f58, %f0, %f62
	.word 0xb1a78820  ! 176: FADDs	fadds	%f30, %f0, %f24
	.word 0xa3a00560  ! 177: FSQRTq	fsqrt	
	.word 0xa5508000  ! 178: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 180: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8395a000  ! 181: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa5508000  ! 182: RDPR_TSTATE	<illegal instruction>
	.word 0x81942000  ! 183: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb1a6c9e0  ! 184: FDIVq	dis not found

	.word 0xab50c000  ! 185: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 186: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb3508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0x81942000  ! 188: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbf504000  ! 189: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0xa1a688e0  ! 191: FSUBq	dis not found

	.word 0xaba58960  ! 192: FMULq	dis not found

	.word 0xa750c000  ! 193: RDPR_TT	<illegal instruction>
	.word 0x839ce000  ! 194: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xab508000  ! 195: RDPR_TSTATE	<illegal instruction>
	.word 0x819f2000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa3a7c820  ! 197: FADDs	fadds	%f31, %f0, %f17
	.word 0xa9a788e0  ! 198: FSUBq	dis not found

	.word 0xad500000  ! 199: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 200: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5504000  ! 201: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 202: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 203: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa3504000  ! 204: RDPR_TNPC	<illegal instruction>
	.word 0x8594a000  ! 205: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8d95a000  ! 206: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8394a000  ! 207: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819e6000  ! 208: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xaf50c000  ! 209: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 210: RDPR_TSTATE	<illegal instruction>
	.word 0xafa488a0  ! 211: FSUBs	fsubs	%f18, %f0, %f23
	.word 0x8196a000  ! 212: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xafa48960  ! 213: FMULq	dis not found

	.word 0xa1508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 215: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbba649e0  ! 216: FDIVq	dis not found

	.word 0xb9a408e0  ! 217: FSUBq	dis not found

	.word 0x85966000  ! 218: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839ca000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa7a64960  ! 220: FMULq	dis not found

	.word 0x819c6000  ! 221: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa3a58920  ! 222: FMULs	fmuls	%f22, %f0, %f17
	.word 0xa3508000  ! 223: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 224: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 225: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x83952000  ! 226: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x87962000  ! 227: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x81962000  ! 228: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb3a60920  ! 229: FMULs	fmuls	%f24, %f0, %f25
	.word 0xa5a00560  ! 230: FSQRTq	fsqrt	
	.word 0x8d956000  ! 231: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbf504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 233: RDPR_TNPC	<illegal instruction>
	.word 0x8d956000  ! 234: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa9500000  ! 235: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 236: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85976000  ! 237: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839ca000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819f6000  ! 239: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8796a000  ! 240: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x839f6000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xada00520  ! 242: FSQRTs	fsqrt	
	.word 0xa5500000  ! 243: RDPR_TPC	<illegal instruction>
	.word 0x839c2000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8597e000  ! 245: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa9500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 247: RDPR_TT	<illegal instruction>
	.word 0xbda6c940  ! 248: FMULd	fmuld	%f58, %f0, %f30
	.word 0x839ee000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb3504000  ! 250: RDPR_TNPC	<illegal instruction>
	.word 0xa9a609c0  ! 251: FDIVd	fdivd	%f24, %f0, %f20
	.word 0xb5a54920  ! 252: FMULs	fmuls	%f21, %f0, %f26
	.word 0x819de000  ! 253: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839da000  ! 254: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8d95a000  ! 255: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa950c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 257: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbf50c000  ! 258: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 259: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x81976000  ! 260: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa7500000  ! 261: RDPR_TPC	<illegal instruction>
	.word 0xbd504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xb1a489c0  ! 263: FDIVd	fdivd	%f18, %f0, %f24
	.word 0x85976000  ! 264: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb1508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 266: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x839ee000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839f6000  ! 268: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb9508000  ! 269: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 271: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x83956000  ! 272: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8397e000  ! 273: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa9a649e0  ! 274: FDIVq	dis not found

	.word 0x8d94a000  ! 275: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xbd50c000  ! 276: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 277: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xada64820  ! 278: FADDs	fadds	%f25, %f0, %f22
	.word 0xb9a4c8e0  ! 279: FSUBq	dis not found

	.word 0xab500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 281: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 282: RDPR_TNPC	<illegal instruction>
	.word 0x8195a000  ! 283: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8597a000  ! 284: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8796a000  ! 285: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbf508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0x839fe000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8595a000  ! 288: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa9a68840  ! 289: FADDd	faddd	%f26, %f0, %f20
	.word 0xa3504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 291: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x819ea000  ! 292: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbda50820  ! 293: FADDs	fadds	%f20, %f0, %f30
	.word 0xa5500000  ! 294: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 295: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 296: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8794a000  ! 297: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbd50c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xb5a00540  ! 299: FSQRTd	fsqrt	
	.word 0xa9a48820  ! 300: FADDs	fadds	%f18, %f0, %f20
	.word 0x819d2000  ! 301: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x81966000  ! 302: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8d942000  ! 303: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa1504000  ! 304: RDPR_TNPC	<illegal instruction>
	.word 0x8d96e000  ! 305: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xbf504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 308: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbb508000  ! 309: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 310: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb9a78960  ! 311: FMULq	dis not found

	.word 0x81966000  ! 312: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x819ce000  ! 313: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8597a000  ! 314: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8594a000  ! 315: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87972000  ! 316: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x83946000  ! 317: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83942000  ! 318: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83956000  ! 319: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8d95e000  ! 320: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb3508000  ! 321: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 322: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb9504000  ! 323: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 324: RDPR_TNPC	<illegal instruction>
	.word 0xb1a78920  ! 325: FMULs	fmuls	%f30, %f0, %f24
	.word 0xbda449c0  ! 326: FDIVd	fdivd	%f48, %f0, %f30
	.word 0x819ea000  ! 327: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x839e6000  ! 328: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8197e000  ! 329: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xada60840  ! 330: FADDd	faddd	%f24, %f0, %f22
	.word 0xa550c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 332: RDPR_TPC	<illegal instruction>
	.word 0xa1504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xbba68920  ! 335: FMULs	fmuls	%f26, %f0, %f29
	.word 0xa3500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 337: RDPR_TT	<illegal instruction>
	.word 0x81952000  ! 338: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb5a40840  ! 339: FADDd	faddd	%f16, %f0, %f26
	.word 0x85966000  ! 340: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xaf504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0x8397a000  ! 342: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x87946000  ! 343: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8197a000  ! 344: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8194e000  ! 345: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x839ca000  ! 346: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819c2000  ! 347: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa1500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 349: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa3a4c9a0  ! 350: FDIVs	fdivs	%f19, %f0, %f17
	.word 0xb9a488c0  ! 351: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xbb50c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0xa5a688a0  ! 353: FSUBs	fsubs	%f26, %f0, %f18
	.word 0x819fa000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8196a000  ! 355: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa150c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0x839ca000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xaba60860  ! 358: FADDq	dis not found

	.word 0xb7504000  ! 359: RDPR_TNPC	<illegal instruction>
	.word 0x819c2000  ! 360: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8796a000  ! 361: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb9a5c940  ! 362: FMULd	fmuld	%f54, %f0, %f28
	.word 0x8397e000  ! 363: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb150c000  ! 364: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 365: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xaf508000  ! 366: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 367: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa5a588e0  ! 368: FSUBq	dis not found

	.word 0xab508000  ! 369: RDPR_TSTATE	<illegal instruction>
	.word 0x819f2000  ! 370: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x87962000  ! 371: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbf500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xad50c000  ! 373: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 374: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8595a000  ! 375: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819c2000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xafa509e0  ! 377: FDIVq	dis not found

	.word 0x8d95a000  ! 378: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x87966000  ! 379: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa7508000  ! 380: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 381: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x839ee000  ! 382: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839ca000  ! 383: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8d956000  ! 384: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d95e000  ! 385: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa9508000  ! 386: RDPR_TSTATE	<illegal instruction>
	.word 0x839fa000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839e6000  ! 388: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839ce000  ! 389: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb150c000  ! 390: RDPR_TT	<illegal instruction>
	.word 0x87942000  ! 391: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa5a5c8c0  ! 392: FSUBd	fsubd	%f54, %f0, %f18
	.word 0xb5a00520  ! 393: FSQRTs	fsqrt	
	.word 0xb550c000  ! 394: RDPR_TT	<illegal instruction>
	.word 0x8797a000  ! 395: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa7a00560  ! 396: FSQRTq	fsqrt	
	.word 0xbba7c840  ! 397: FADDd	faddd	%f62, %f0, %f60
	.word 0xa9508000  ! 398: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xb3504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0x8d96a000  ! 400: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8595a000  ! 401: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d976000  ! 402: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d942000  ! 403: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x81966000  ! 404: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa1a549a0  ! 405: FDIVs	fdivs	%f21, %f0, %f16
	.word 0x87956000  ! 406: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x81942000  ! 407: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8794e000  ! 408: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d942000  ! 409: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819d6000  ! 410: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x83942000  ! 411: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xada00520  ! 412: FSQRTs	fsqrt	
	.word 0xa950c000  ! 413: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 414: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819ea000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa5500000  ! 416: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 418: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 419: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 420: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbba7c9a0  ! 421: FDIVs	fdivs	%f31, %f0, %f29
	.word 0x8197a000  ! 422: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xab504000  ! 423: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 424: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 425: RDPR_TPC	<illegal instruction>
	.word 0xb5a648c0  ! 426: FSUBd	fsubd	%f56, %f0, %f26
	.word 0xa5a68860  ! 427: FADDq	dis not found

	.word 0xa750c000  ! 428: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 429: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbda549e0  ! 431: FDIVq	dis not found

	.word 0xa9a40860  ! 432: FADDq	dis not found

	.word 0x8d94a000  ! 433: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xad508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xa1a70840  ! 436: FADDd	faddd	%f28, %f0, %f16
	.word 0xad504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x8d946000  ! 438: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbb504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 441: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819ce000  ! 442: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb3504000  ! 443: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 444: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 445: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8597a000  ! 446: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x81962000  ! 447: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xab508000  ! 448: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 449: RDPR_TPC	<illegal instruction>
	.word 0xa9a00540  ! 450: FSQRTd	fsqrt	
	.word 0x8195a000  ! 451: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xaf504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 453: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8197e000  ! 454: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbfa78960  ! 455: FMULq	dis not found

	.word 0x839ee000  ! 456: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x81966000  ! 457: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xab500000  ! 458: RDPR_TPC	<illegal instruction>
	.word 0xb9a488a0  ! 459: FSUBs	fsubs	%f18, %f0, %f28
	.word 0x87952000  ! 460: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83952000  ! 461: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb7a4c8a0  ! 462: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xaba00560  ! 463: FSQRTq	fsqrt	
	.word 0xa9508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0x839f2000  ! 465: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x839d2000  ! 466: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa9508000  ! 467: RDPR_TSTATE	<illegal instruction>
	.word 0x81966000  ! 468: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x85976000  ! 469: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d942000  ! 470: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819f2000  ! 471: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa750c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0xb3a60820  ! 473: FADDs	fadds	%f24, %f0, %f25
	.word 0x81966000  ! 474: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83976000  ! 475: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbd504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 477: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 478: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 479: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x819fe000  ! 480: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8796a000  ! 481: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819ce000  ! 482: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xaba68920  ! 483: FMULs	fmuls	%f26, %f0, %f21
	.word 0x8594a000  ! 484: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87962000  ! 485: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xafa00540  ! 486: FSQRTd	fsqrt	
	.word 0x819c6000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa5508000  ! 488: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xafa00540  ! 490: FSQRTd	fsqrt	
	.word 0x8d966000  ! 491: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb3a709a0  ! 492: FDIVs	fdivs	%f28, %f0, %f25
	.word 0x85976000  ! 493: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb1500000  ! 494: RDPR_TPC	<illegal instruction>
	.word 0xb7a689c0  ! 495: FDIVd	fdivd	%f26, %f0, %f58
	.word 0x8597a000  ! 496: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8d97a000  ! 497: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8395e000  ! 498: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d966000  ! 499: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa1504000  ! 500: RDPR_TNPC	<illegal instruction>
	.word 0xbba00540  ! 501: FSQRTd	fsqrt	
	.word 0x85962000  ! 502: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x87942000  ! 503: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb9500000  ! 504: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 505: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8d962000  ! 506: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x819ee000  ! 507: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xad508000  ! 508: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 509: RDPR_TNPC	<illegal instruction>
	.word 0xa9500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 511: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83956000  ! 512: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa5500000  ! 513: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 514: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x87952000  ! 515: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83956000  ! 516: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8597a000  ! 517: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbb50c000  ! 518: RDPR_TT	<illegal instruction>
	.word 0xa150c000  ! 519: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 520: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xaf504000  ! 521: RDPR_TNPC	<illegal instruction>
	.word 0xb1a70920  ! 522: FMULs	fmuls	%f28, %f0, %f24
	.word 0x87972000  ! 523: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819d6000  ! 524: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb3504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 526: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa58840  ! 527: FADDd	faddd	%f22, %f0, %f62
	.word 0x85952000  ! 528: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xada5c920  ! 529: FMULs	fmuls	%f23, %f0, %f22
	.word 0xb5508000  ! 530: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 532: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x81962000  ! 533: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x83952000  ! 534: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x87952000  ! 535: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb7a508a0  ! 536: FSUBs	fsubs	%f20, %f0, %f27
	.word 0x85966000  ! 537: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbda00560  ! 538: FSQRTq	fsqrt	
	.word 0x85976000  ! 539: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8594e000  ! 540: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa7504000  ! 541: RDPR_TNPC	<illegal instruction>
	.word 0xafa00560  ! 542: FSQRTq	fsqrt	
	.word 0xa550c000  ! 543: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 544: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa1504000  ! 545: RDPR_TNPC	<illegal instruction>
	.word 0xada608c0  ! 546: FSUBd	fsubd	%f24, %f0, %f22
	.word 0xbd500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xa1a589c0  ! 548: FDIVd	fdivd	%f22, %f0, %f16
	.word 0x839da000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb5a48840  ! 550: FADDd	faddd	%f18, %f0, %f26
	.word 0xb150c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 552: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 553: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x819ea000  ! 554: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb1504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 556: RDPR_TSTATE	<illegal instruction>
	.word 0x839c6000  ! 557: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xad50c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xbba448a0  ! 559: FSUBs	fsubs	%f17, %f0, %f29
	.word 0x8396e000  ! 560: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xafa6c940  ! 561: FMULd	fmuld	%f58, %f0, %f54
	.word 0xaf504000  ! 562: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 563: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d94a000  ! 565: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819d6000  ! 566: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa5504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x8d962000  ! 568: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa9500000  ! 569: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 570: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xaf508000  ! 571: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 572: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0x8796e000  ! 574: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8597e000  ! 575: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8396e000  ! 576: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8597e000  ! 577: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839f6000  ! 578: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa1500000  ! 579: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0xad504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 582: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x85946000  ! 583: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbba408c0  ! 584: FSUBd	fsubd	%f16, %f0, %f60
	.word 0x87972000  ! 585: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839c2000  ! 586: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb5508000  ! 587: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 588: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8794a000  ! 589: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8797e000  ! 590: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85956000  ! 591: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xab50c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0x819e6000  ! 593: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x839ca000  ! 594: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa9a74940  ! 595: FMULd	fmuld	%f60, %f0, %f20
	.word 0x839ee000  ! 596: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa5508000  ! 597: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 598: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa550c000  ! 599: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 600: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa1500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x839fa000  ! 602: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8597a000  ! 603: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8197a000  ! 604: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa750c000  ! 605: RDPR_TT	<illegal instruction>
	.word 0xad504000  ! 606: RDPR_TNPC	<illegal instruction>
	.word 0xb1a5c960  ! 607: FMULq	dis not found

	.word 0xb1508000  ! 608: RDPR_TSTATE	<illegal instruction>
	.word 0xafa44820  ! 609: FADDs	fadds	%f17, %f0, %f23
	.word 0xab504000  ! 610: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 612: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xaba54940  ! 613: FMULd	fmuld	%f52, %f0, %f52
	.word 0x819d2000  ! 614: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x83976000  ! 615: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xaf504000  ! 616: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 617: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8596e000  ! 618: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8596e000  ! 619: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa7508000  ! 620: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 621: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa3a409a0  ! 622: FDIVs	fdivs	%f16, %f0, %f17
	.word 0x8794e000  ! 623: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbba60840  ! 624: FADDd	faddd	%f24, %f0, %f60
	.word 0xafa74940  ! 625: FMULd	fmuld	%f60, %f0, %f54
	.word 0x8d976000  ! 626: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1a509a0  ! 627: FDIVs	fdivs	%f20, %f0, %f24
	.word 0x8194a000  ! 628: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb5500000  ! 629: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 630: RDPR_TPC	<illegal instruction>
	.word 0xa950c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 632: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8795a000  ! 633: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x87962000  ! 634: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xafa00560  ! 635: FSQRTq	fsqrt	
	.word 0x8d96e000  ! 636: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb7508000  ! 637: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa44960  ! 638: FMULq	dis not found

	.word 0xa7508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a54820  ! 640: FADDs	fadds	%f21, %f0, %f25
	.word 0x8396a000  ! 641: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839e2000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x85956000  ! 643: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d976000  ! 644: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xbf504000  ! 645: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 647: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb1500000  ! 648: RDPR_TPC	<illegal instruction>
	.word 0x839e2000  ! 649: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xbba649a0  ! 650: FDIVs	fdivs	%f25, %f0, %f29
	.word 0x8196a000  ! 651: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8596e000  ! 652: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb1504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 654: RDPR_TSTATE	<illegal instruction>
	.word 0x87952000  ! 655: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x819f2000  ! 656: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xaf504000  ! 657: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 658: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xaf508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0x819da000  ! 661: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d94a000  ! 662: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819c2000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8197a000  ! 664: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8d962000  ! 665: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83962000  ! 666: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8194e000  ! 667: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x87942000  ! 668: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa950c000  ! 669: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x839ea000  ! 672: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x839f6000  ! 673: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb7504000  ! 674: RDPR_TNPC	<illegal instruction>
	.word 0x8d972000  ! 675: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb1a449a0  ! 676: FDIVs	fdivs	%f17, %f0, %f24
	.word 0x819e6000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbf504000  ! 678: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 679: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839ea000  ! 680: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xbd504000  ! 681: RDPR_TNPC	<illegal instruction>
	.word 0xb9a70940  ! 682: FMULd	fmuld	%f28, %f0, %f28
	.word 0x8394e000  ! 683: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x85966000  ! 684: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d952000  ! 685: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x85972000  ! 686: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8d96e000  ! 687: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x87962000  ! 688: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x839ca000  ! 689: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819ca000  ! 690: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d946000  ! 691: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819d6000  ! 692: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d976000  ! 693: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8194a000  ! 694: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb9a409e0  ! 695: FDIVq	dis not found

	.word 0x85942000  ! 696: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x83942000  ! 697: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x81956000  ! 698: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839d2000  ! 699: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8795a000  ! 700: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb7a00520  ! 701: FSQRTs	fsqrt	
	.word 0x8394a000  ! 702: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8395e000  ! 703: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xafa448c0  ! 704: FSUBd	fsubd	%f48, %f0, %f54
	.word 0xa5a4c840  ! 705: FADDd	faddd	%f50, %f0, %f18
	.word 0xbd508000  ! 706: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 708: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa9504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0x819e6000  ! 710: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x819c6000  ! 711: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa5a00520  ! 712: FSQRTs	fsqrt	
	.word 0xa1504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 714: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 716: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00540  ! 717: FSQRTd	fsqrt	
	.word 0x8794a000  ! 718: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb5504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xa3500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 722: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa350c000  ! 723: RDPR_TT	<illegal instruction>
	.word 0x8d95e000  ! 724: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819fe000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb1a64920  ! 726: FMULs	fmuls	%f25, %f0, %f24
	.word 0xb750c000  ! 727: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 728: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3a689e0  ! 729: FDIVq	dis not found

	.word 0xbda00540  ! 730: FSQRTd	fsqrt	
	.word 0x8795a000  ! 731: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xada68820  ! 732: FADDs	fadds	%f26, %f0, %f22
	.word 0xaba00540  ! 733: FSQRTd	fsqrt	
	.word 0xbd500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xbda6c840  ! 735: FADDd	faddd	%f58, %f0, %f30
	.word 0x8596e000  ! 736: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819d2000  ! 737: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb3508000  ! 738: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a4c820  ! 739: FADDs	fadds	%f19, %f0, %f19
	.word 0x839de000  ! 740: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839d6000  ! 741: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa550c000  ! 742: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 743: RDPR_TPC	<illegal instruction>
	.word 0xa1a00540  ! 744: FSQRTd	fsqrt	
	.word 0xa1508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 746: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xaf500000  ! 747: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 748: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8196a000  ! 749: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb1a00520  ! 750: FSQRTs	fsqrt	
	.word 0xb3504000  ! 751: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00520  ! 752: FSQRTs	fsqrt	
	.word 0xab504000  ! 753: RDPR_TNPC	<illegal instruction>
	.word 0xa9508000  ! 754: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 756: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x85952000  ! 757: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x85942000  ! 758: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xad508000  ! 759: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a58940  ! 760: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb9504000  ! 761: RDPR_TNPC	<illegal instruction>
	.word 0xbba00540  ! 762: FSQRTd	fsqrt	
	.word 0xa550c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x839d2000  ! 764: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x839c2000  ! 765: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8d952000  ! 766: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x819ea000  ! 767: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa1508000  ! 768: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00520  ! 769: FSQRTs	fsqrt	
	.word 0x81966000  ! 770: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x819fa000  ! 771: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa7a588c0  ! 772: FSUBd	fsubd	%f22, %f0, %f50
	.word 0x8395e000  ! 773: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa9500000  ! 774: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 775: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x839fa000  ! 776: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x85976000  ! 777: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8794e000  ! 778: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xab500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 780: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x819ea000  ! 781: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbb500000  ! 782: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 783: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 784: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbda48840  ! 785: FADDd	faddd	%f18, %f0, %f30
	.word 0x81976000  ! 786: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa9508000  ! 787: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8796e000  ! 789: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8594a000  ! 790: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa1500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 792: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d966000  ! 793: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8d95e000  ! 794: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8395e000  ! 795: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x87942000  ! 796: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8597e000  ! 797: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa1a449e0  ! 798: FDIVq	dis not found

	.word 0xb1a44920  ! 799: FMULs	fmuls	%f17, %f0, %f24
	.word 0xa7508000  ! 800: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 801: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbba4c8a0  ! 802: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xbd504000  ! 803: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa7a68840  ! 805: FADDd	faddd	%f26, %f0, %f50
	.word 0x839ea000  ! 806: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb9500000  ! 807: RDPR_TPC	<illegal instruction>
	.word 0xb1a50840  ! 808: FADDd	faddd	%f20, %f0, %f24
	.word 0xbba508c0  ! 809: FSUBd	fsubd	%f20, %f0, %f60
	.word 0x8d94e000  ! 810: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xaba00560  ! 811: FSQRTq	fsqrt	
	.word 0xada7c920  ! 812: FMULs	fmuls	%f31, %f0, %f22
	.word 0x85962000  ! 813: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x87966000  ! 814: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb350c000  ! 815: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 816: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a7c9e0  ! 817: FDIVq	dis not found

	.word 0xb9504000  ! 818: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 821: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa550c000  ! 822: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 825: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8197e000  ! 826: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xada74940  ! 827: FMULd	fmuld	%f60, %f0, %f22
	.word 0x8594e000  ! 828: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xad500000  ! 829: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 830: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb9a68860  ! 831: FADDq	dis not found

	.word 0x839f6000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbf504000  ! 833: RDPR_TNPC	<illegal instruction>
	.word 0xbfa60920  ! 834: FMULs	fmuls	%f24, %f0, %f31
	.word 0x8594e000  ! 835: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8797e000  ! 836: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb3504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 838: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa3a449c0  ! 839: FDIVd	fdivd	%f48, %f0, %f48
	.word 0xa1a708a0  ! 840: FSUBs	fsubs	%f28, %f0, %f16
	.word 0xab508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 842: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8d97a000  ! 843: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xaba54860  ! 844: FADDq	dis not found

	.word 0x8d952000  ! 845: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbb50c000  ! 846: RDPR_TT	<illegal instruction>
	.word 0x81946000  ! 847: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x839de000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb150c000  ! 849: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 850: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 851: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x85962000  ! 852: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x83972000  ! 853: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8d956000  ! 854: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb5504000  ! 855: RDPR_TNPC	<illegal instruction>
	.word 0xa9a00560  ! 856: FSQRTq	fsqrt	
	.word 0xb5a40860  ! 857: FADDq	dis not found

	.word 0xada709a0  ! 858: FDIVs	fdivs	%f28, %f0, %f22
	.word 0xab504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xa3a5c9c0  ! 861: FDIVd	fdivd	%f54, %f0, %f48
	.word 0x819de000  ! 862: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8595e000  ! 863: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb9504000  ! 864: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 865: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8d97e000  ! 866: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb950c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 868: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x819ca000  ! 869: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbd504000  ! 870: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 871: RDPR_TPC	<illegal instruction>
	.word 0x8195e000  ! 872: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8795a000  ! 873: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb3508000  ! 874: RDPR_TSTATE	<illegal instruction>
	.word 0x839fa000  ! 875: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819c6000  ! 876: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x85956000  ! 877: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xaf50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 879: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839c6000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xaf504000  ! 881: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xaf500000  ! 883: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 884: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xad500000  ! 885: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 886: RDPR_TNPC	<illegal instruction>
	.word 0x819ee000  ! 887: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb7500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xb9a40940  ! 889: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb9a00560  ! 890: FSQRTq	fsqrt	
	.word 0x8d946000  ! 891: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819ca000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x83966000  ! 893: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d942000  ! 894: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa1a788e0  ! 895: FSUBq	dis not found

	.word 0x81956000  ! 896: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x85972000  ! 897: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa1508000  ! 898: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 899: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8394a000  ! 900: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x85956000  ! 901: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb9500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xad50c000  ! 903: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 905: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb9508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 907: RDPR_TPC	<illegal instruction>
	.word 0xb9a74940  ! 908: FMULd	fmuld	%f60, %f0, %f28
	.word 0xaf50c000  ! 909: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 910: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb750c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 912: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbfa54960  ! 913: FMULq	dis not found

	.word 0x8395a000  ! 914: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb5508000  ! 915: RDPR_TSTATE	<illegal instruction>
	.word 0x819f6000  ! 916: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839fe000  ! 917: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8d96a000  ! 918: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbb50c000  ! 919: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0x819fe000  ! 921: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d94a000  ! 922: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8195a000  ! 923: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbb504000  ! 924: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 925: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8796e000  ! 926: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa1a409e0  ! 927: FDIVq	dis not found

	.word 0xbf500000  ! 928: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0xb3a68960  ! 930: FMULq	dis not found

	.word 0xbd508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xafa74820  ! 932: FADDs	fadds	%f29, %f0, %f23
	.word 0xa750c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 934: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 935: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 936: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa1a50940  ! 937: FMULd	fmuld	%f20, %f0, %f16
	.word 0xa750c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 939: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xaf508000  ! 940: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 941: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87962000  ! 942: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819ca000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbfa709a0  ! 944: FDIVs	fdivs	%f28, %f0, %f31
	.word 0xada70920  ! 945: FMULs	fmuls	%f28, %f0, %f22
	.word 0xa350c000  ! 946: RDPR_TT	<illegal instruction>
	.word 0xa3504000  ! 947: RDPR_TNPC	<illegal instruction>
	.word 0x839e6000  ! 948: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x85946000  ! 949: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb5a5c840  ! 950: FADDd	faddd	%f54, %f0, %f26
	.word 0xa9a44840  ! 951: FADDd	faddd	%f48, %f0, %f20
	.word 0x8d962000  ! 952: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x819e6000  ! 953: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d972000  ! 954: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa7508000  ! 955: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 956: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839c6000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xaba7c8e0  ! 958: FSUBq	dis not found

	.word 0xbb500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 960: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xbb508000  ! 961: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a7c8a0  ! 962: FSUBs	fsubs	%f31, %f0, %f20
	.word 0xa7508000  ! 963: RDPR_TSTATE	<illegal instruction>
	.word 0x819fa000  ! 964: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa9504000  ! 965: RDPR_TNPC	<illegal instruction>
	.word 0x8797a000  ! 966: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8594a000  ! 967: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839d2000  ! 968: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8794a000  ! 969: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbb500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 971: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8d956000  ! 972: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb9a58840  ! 973: FADDd	faddd	%f22, %f0, %f28
	.word 0xb3504000  ! 974: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 976: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8197e000  ! 977: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa7508000  ! 978: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8395e000  ! 979: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa9a4c9c0  ! 980: FDIVd	fdivd	%f50, %f0, %f20
	.word 0xada5c840  ! 981: FADDd	faddd	%f54, %f0, %f22
	.word 0xb9a5c860  ! 982: FADDq	dis not found

	.word 0xbd504000  ! 983: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 984: RDPR_TPC	<illegal instruction>
	.word 0x8596a000  ! 985: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x83972000  ! 986: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb3a548a0  ! 987: FSUBs	fsubs	%f21, %f0, %f25
	.word 0x819fe000  ! 988: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x85966000  ! 989: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839e6000  ! 990: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x83946000  ! 991: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839fe000  ! 992: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb1500000  ! 993: RDPR_TPC	<illegal instruction>
	.word 0xa3a7c8a0  ! 994: FSUBs	fsubs	%f31, %f0, %f17
	.word 0x819d6000  ! 995: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x819de000  ! 996: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8395a000  ! 997: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x839d6000  ! 998: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
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
	.word 0x85942000  ! 1: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xada68920  ! 2: FMULs	fmuls	%f26, %f0, %f22
	.word 0xad50c000  ! 3: RDPR_TT	rdpr	%tt, %r22
	.word 0xbd504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 6: RDPR_TNPC	<illegal instruction>
	.word 0x839f2000  ! 7: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x83962000  ! 8: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa3500000  ! 9: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x83962000  ! 10: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839f6000  ! 11: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8394a000  ! 12: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xaf50c000  ! 13: RDPR_TT	rdpr	%tt, %r23
	.word 0x81966000  ! 14: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8396a000  ! 15: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819f2000  ! 16: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x81942000  ! 17: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8d96e000  ! 18: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb5508000  ! 19: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x87952000  ! 20: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xada00540  ! 21: FSQRTd	fsqrt	
	.word 0x81942000  ! 22: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb5504000  ! 23: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa1504000  ! 24: RDPR_TNPC	<illegal instruction>
	.word 0xb1a648e0  ! 25: FSUBq	dis not found

	.word 0x8395a000  ! 26: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8d97e000  ! 27: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x839f6000  ! 28: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb1a7c840  ! 29: FADDd	faddd	%f62, %f0, %f24
	.word 0x8797e000  ! 30: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x83942000  ! 31: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa950c000  ! 32: RDPR_TT	rdpr	%tt, %r20
	.word 0x83962000  ! 33: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839fe000  ! 34: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb950c000  ! 35: RDPR_TT	rdpr	%tt, %r28
	.word 0xb3508000  ! 36: RDPR_TSTATE	<illegal instruction>
	.word 0xafa00540  ! 37: FSQRTd	fsqrt	
	.word 0x8595a000  ! 38: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819ca000  ! 39: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xafa40860  ! 40: FADDq	dis not found

	.word 0x839ee000  ! 41: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8d95a000  ! 42: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x85952000  ! 43: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb9a788a0  ! 44: FSUBs	fsubs	%f30, %f0, %f28
	.word 0x87966000  ! 45: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8d962000  ! 46: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa5500000  ! 47: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x85962000  ! 48: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8795a000  ! 49: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8d96e000  ! 50: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xab504000  ! 51: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x819ca000  ! 52: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa350c000  ! 53: RDPR_TT	rdpr	%tt, %r17
	.word 0x819ca000  ! 54: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xab50c000  ! 55: RDPR_TT	rdpr	%tt, %r21
	.word 0xb1508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb3500000  ! 58: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa9a588e0  ! 59: FSUBq	dis not found

	.word 0x85962000  ! 60: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x87942000  ! 61: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb9504000  ! 62: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x83952000  ! 63: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x839e2000  ! 64: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb7504000  ! 65: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8795a000  ! 66: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8597a000  ! 67: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8d976000  ! 68: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xad500000  ! 69: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xb5a70920  ! 70: FMULs	fmuls	%f28, %f0, %f26
	.word 0x8596a000  ! 71: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbfa488a0  ! 72: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xa9500000  ! 73: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xad500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 76: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819d6000  ! 77: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d97e000  ! 78: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb550c000  ! 79: RDPR_TT	rdpr	%tt, %r26
	.word 0xa3508000  ! 80: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95a000  ! 81: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8395e000  ! 82: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8194a000  ! 83: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbba78960  ! 84: FMULq	dis not found

	.word 0xaba44840  ! 85: FADDd	faddd	%f48, %f0, %f52
	.word 0x8196a000  ! 86: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8796e000  ! 87: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xad500000  ! 88: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xa750c000  ! 89: RDPR_TT	<illegal instruction>
	.word 0x839ea000  ! 90: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x819d2000  ! 91: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x83942000  ! 92: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8595e000  ! 93: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xafa709e0  ! 94: FDIVq	dis not found

	.word 0x8194e000  ! 95: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5508000  ! 96: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x819e6000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa9a609c0  ! 98: FDIVd	fdivd	%f24, %f0, %f20
	.word 0xa1504000  ! 99: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xad50c000  ! 100: RDPR_TT	<illegal instruction>
	.word 0x839ce000  ! 101: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbd50c000  ! 102: RDPR_TT	rdpr	%tt, %r30
	.word 0xbfa00560  ! 103: FSQRTq	fsqrt	
	.word 0xa5500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 105: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa5508000  ! 106: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa150c000  ! 107: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 108: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x819d6000  ! 109: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d94a000  ! 110: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb9504000  ! 111: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa3508000  ! 112: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 114: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 115: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbf500000  ! 116: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x8796a000  ! 117: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8195e000  ! 118: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xaf504000  ! 119: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x839e2000  ! 120: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819ea000  ! 121: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb5504000  ! 122: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa3a64920  ! 123: FMULs	fmuls	%f25, %f0, %f17
	.word 0x87956000  ! 124: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xad508000  ! 125: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x839f2000  ! 126: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb1a749c0  ! 127: FDIVd	fdivd	%f60, %f0, %f24
	.word 0xb5a448e0  ! 128: FSUBq	dis not found

	.word 0xa1504000  ! 129: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xb7504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0x819f2000  ! 132: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8596e000  ! 133: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x87976000  ! 134: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xab504000  ! 135: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x87976000  ! 136: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x819f6000  ! 137: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xafa40820  ! 138: FADDs	fadds	%f16, %f0, %f23
	.word 0xb750c000  ! 139: RDPR_TT	rdpr	%tt, %r27
	.word 0xbd508000  ! 140: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 143: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x87952000  ! 144: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xad500000  ! 145: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xb1a788e0  ! 146: FSUBq	dis not found

	.word 0x8d966000  ! 147: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb1a78940  ! 148: FMULd	fmuld	%f30, %f0, %f24
	.word 0x819e6000  ! 149: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d962000  ! 150: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb3a00540  ! 151: FSQRTd	fsqrt	
	.word 0xa7500000  ! 152: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xa5508000  ! 153: RDPR_TSTATE	<illegal instruction>
	.word 0x81946000  ! 154: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb3504000  ! 155: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x85942000  ! 156: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb7500000  ! 157: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb7500000  ! 158: RDPR_TPC	<illegal instruction>
	.word 0x819ca000  ! 159: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5504000  ! 160: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xada688e0  ! 161: FSUBq	dis not found

	.word 0xb150c000  ! 162: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 163: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa5500000  ! 164: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xaf50c000  ! 165: RDPR_TT	<illegal instruction>
	.word 0x819fe000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1508000  ! 167: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8d956000  ! 168: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8395a000  ! 169: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa1504000  ! 170: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa7508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a609c0  ! 173: FDIVd	fdivd	%f24, %f0, %f50
	.word 0x839c2000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xafa54840  ! 175: FADDd	faddd	%f52, %f0, %f54
	.word 0xb5a70820  ! 176: FADDs	fadds	%f28, %f0, %f26
	.word 0xb3a00560  ! 177: FSQRTq	fsqrt	
	.word 0xad508000  ! 178: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xa5508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0x8d966000  ! 180: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x83946000  ! 181: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb7508000  ! 182: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8194e000  ! 183: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb3a6c9e0  ! 184: FDIVq	dis not found

	.word 0xa750c000  ! 185: RDPR_TT	rdpr	%tt, %r19
	.word 0x839ce000  ! 186: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbd508000  ! 187: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x81946000  ! 188: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb9504000  ! 189: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbf50c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0xa7a588e0  ! 191: FSUBq	dis not found

	.word 0xa3a40960  ! 192: FMULq	dis not found

	.word 0xbf50c000  ! 193: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 194: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb7508000  ! 195: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x819ea000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa3a6c820  ! 197: FADDs	fadds	%f27, %f0, %f17
	.word 0xada608e0  ! 198: FSUBq	dis not found

	.word 0xa9500000  ! 199: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x81962000  ! 200: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa1504000  ! 201: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xb750c000  ! 202: RDPR_TT	<illegal instruction>
	.word 0x839fe000  ! 203: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb3504000  ! 204: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x85976000  ! 205: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d95e000  ! 206: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x83972000  ! 207: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x819c6000  ! 208: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa350c000  ! 209: RDPR_TT	rdpr	%tt, %r17
	.word 0xb1508000  ! 210: RDPR_TSTATE	<illegal instruction>
	.word 0xafa788a0  ! 211: FSUBs	fsubs	%f30, %f0, %f23
	.word 0x81952000  ! 212: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb5a40960  ! 213: FMULq	dis not found

	.word 0xb9508000  ! 214: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8397a000  ! 215: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb1a789e0  ! 216: FDIVq	dis not found

	.word 0xbba448e0  ! 217: FSUBq	dis not found

	.word 0x85952000  ! 218: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839fe000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xada68960  ! 220: FMULq	dis not found

	.word 0x819ce000  ! 221: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbda74920  ! 222: FMULs	fmuls	%f29, %f0, %f30
	.word 0xb9508000  ! 223: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xb750c000  ! 224: RDPR_TT	<illegal instruction>
	.word 0x8597e000  ! 225: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8394a000  ! 226: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8797a000  ! 227: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8196a000  ! 228: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa5a4c920  ! 229: FMULs	fmuls	%f19, %f0, %f18
	.word 0xb3a00560  ! 230: FSQRTq	fsqrt	
	.word 0x8d97e000  ! 231: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb3504000  ! 232: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb7504000  ! 233: RDPR_TNPC	<illegal instruction>
	.word 0x8d942000  ! 234: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb1500000  ! 235: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x87942000  ! 236: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x85952000  ! 237: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839e6000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819d6000  ! 239: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x87946000  ! 240: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839e6000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xaba00520  ! 242: FSQRTs	fsqrt	
	.word 0xbf500000  ! 243: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x839ea000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x85952000  ! 245: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb5500000  ! 246: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xb350c000  ! 247: RDPR_TT	<illegal instruction>
	.word 0xa1a78940  ! 248: FMULd	fmuld	%f30, %f0, %f16
	.word 0x839da000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb5504000  ! 250: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xbda509c0  ! 251: FDIVd	fdivd	%f20, %f0, %f30
	.word 0xbfa68920  ! 252: FMULs	fmuls	%f26, %f0, %f31
	.word 0x819f2000  ! 253: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839f6000  ! 254: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8d96e000  ! 255: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa950c000  ! 256: RDPR_TT	rdpr	%tt, %r20
	.word 0x83966000  ! 257: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa350c000  ! 258: RDPR_TT	rdpr	%tt, %r17
	.word 0x8396a000  ! 259: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x81956000  ! 260: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa7500000  ! 261: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xaf504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xb9a709c0  ! 263: FDIVd	fdivd	%f28, %f0, %f28
	.word 0x8595e000  ! 264: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb3508000  ! 265: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x87966000  ! 266: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x839f2000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x839ee000  ! 268: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa5508000  ! 269: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb1504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 271: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8394e000  ! 272: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8396e000  ! 273: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb1a5c9e0  ! 274: FDIVq	dis not found

	.word 0x8d97e000  ! 275: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb350c000  ! 276: RDPR_TT	rdpr	%tt, %r25
	.word 0x85962000  ! 277: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbfa70820  ! 278: FADDs	fadds	%f28, %f0, %f31
	.word 0xa5a6c8e0  ! 279: FSUBq	dis not found

	.word 0xb5500000  ! 280: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xa7508000  ! 281: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 282: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 283: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8594a000  ! 284: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87972000  ! 285: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xad508000  ! 286: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x839d6000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x85962000  ! 288: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xaba40840  ! 289: FADDd	faddd	%f16, %f0, %f52
	.word 0xb9504000  ! 290: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x8796e000  ! 291: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x819de000  ! 292: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa1a70820  ! 293: FADDs	fadds	%f28, %f0, %f16
	.word 0xa9500000  ! 294: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xad500000  ! 295: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 296: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8795a000  ! 297: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa950c000  ! 298: RDPR_TT	rdpr	%tt, %r20
	.word 0xbba00540  ! 299: FSQRTd	fsqrt	
	.word 0xa9a60820  ! 300: FADDs	fadds	%f24, %f0, %f20
	.word 0x819da000  ! 301: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x81956000  ! 302: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8d95a000  ! 303: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa5504000  ! 304: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x8d952000  ! 305: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb7504000  ! 306: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xa1508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 308: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa1508000  ! 309: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x81976000  ! 310: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbda44960  ! 311: FMULq	dis not found

	.word 0x8195a000  ! 312: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x819c6000  ! 313: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8597e000  ! 314: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85946000  ! 315: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87946000  ! 316: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8395e000  ! 317: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x83962000  ! 318: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8396e000  ! 319: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8d952000  ! 320: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbb508000  ! 321: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x85952000  ! 322: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbd504000  ! 323: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xab504000  ! 324: RDPR_TNPC	<illegal instruction>
	.word 0xb5a6c920  ! 325: FMULs	fmuls	%f27, %f0, %f26
	.word 0xafa649c0  ! 326: FDIVd	fdivd	%f56, %f0, %f54
	.word 0x819de000  ! 327: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839de000  ! 328: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8197a000  ! 329: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa1a5c840  ! 330: FADDd	faddd	%f54, %f0, %f16
	.word 0xbf50c000  ! 331: RDPR_TT	rdpr	%tt, %r31
	.word 0xbf500000  ! 332: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xbba4c920  ! 335: FMULs	fmuls	%f19, %f0, %f29
	.word 0xa3500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 337: RDPR_TT	<illegal instruction>
	.word 0x81962000  ! 338: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa7a58840  ! 339: FADDd	faddd	%f22, %f0, %f50
	.word 0x85972000  ! 340: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa9504000  ! 341: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x8395e000  ! 342: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x87972000  ! 343: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8194a000  ! 344: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x81952000  ! 345: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x839ce000  ! 346: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x819f6000  ! 347: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xab500000  ! 348: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x8595a000  ! 349: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xada509a0  ! 350: FDIVs	fdivs	%f20, %f0, %f22
	.word 0xa1a748c0  ! 351: FSUBd	fsubd	%f60, %f0, %f16
	.word 0xa950c000  ! 352: RDPR_TT	rdpr	%tt, %r20
	.word 0xb7a7c8a0  ! 353: FSUBs	fsubs	%f31, %f0, %f27
	.word 0x819fa000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x81946000  ! 355: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa750c000  ! 356: RDPR_TT	rdpr	%tt, %r19
	.word 0x839ca000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa9a70860  ! 358: FADDq	dis not found

	.word 0xb3504000  ! 359: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x819f6000  ! 360: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8794e000  ! 361: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa7a40940  ! 362: FMULd	fmuld	%f16, %f0, %f50
	.word 0x8394a000  ! 363: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb350c000  ! 364: RDPR_TT	rdpr	%tt, %r25
	.word 0x819ca000  ! 365: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa5508000  ! 366: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x81962000  ! 367: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa3a688e0  ! 368: FSUBq	dis not found

	.word 0xb9508000  ! 369: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x819ea000  ! 370: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8796a000  ! 371: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa9500000  ! 372: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xad50c000  ! 373: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 374: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x85976000  ! 375: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819f6000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xafa689e0  ! 377: FDIVq	dis not found

	.word 0x8d97e000  ! 378: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x87956000  ! 379: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb1508000  ! 380: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x87956000  ! 381: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x839d6000  ! 382: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839f6000  ! 383: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8d952000  ! 384: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8d962000  ! 385: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa9508000  ! 386: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x839c6000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839f6000  ! 388: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x839c2000  ! 389: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa950c000  ! 390: RDPR_TT	rdpr	%tt, %r20
	.word 0x8796e000  ! 391: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb1a5c8c0  ! 392: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb9a00520  ! 393: FSQRTs	fsqrt	
	.word 0xb350c000  ! 394: RDPR_TT	rdpr	%tt, %r25
	.word 0x87976000  ! 395: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbda00560  ! 396: FSQRTq	fsqrt	
	.word 0xada54840  ! 397: FADDd	faddd	%f52, %f0, %f22
	.word 0xb1508000  ! 398: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xad504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0x8d972000  ! 400: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x85946000  ! 401: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8d962000  ! 402: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8d966000  ! 403: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8194e000  ! 404: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbfa709a0  ! 405: FDIVs	fdivs	%f28, %f0, %f31
	.word 0x87956000  ! 406: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x81952000  ! 407: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8796a000  ! 408: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d946000  ! 409: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819e6000  ! 410: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x83972000  ! 411: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa7a00520  ! 412: FSQRTs	fsqrt	
	.word 0xa750c000  ! 413: RDPR_TT	rdpr	%tt, %r19
	.word 0x8396e000  ! 414: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x819fa000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa9500000  ! 416: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xb950c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 418: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 419: RDPR_TT	<illegal instruction>
	.word 0x8d96a000  ! 420: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbfa4c9a0  ! 421: FDIVs	fdivs	%f19, %f0, %f31
	.word 0x8196a000  ! 422: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3504000  ! 423: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xad508000  ! 424: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 425: RDPR_TPC	<illegal instruction>
	.word 0xbfa608c0  ! 426: FSUBd	fsubd	%f24, %f0, %f62
	.word 0xb3a68860  ! 427: FADDq	dis not found

	.word 0xa750c000  ! 428: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 429: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa5a609e0  ! 431: FDIVq	dis not found

	.word 0xbda78860  ! 432: FADDq	dis not found

	.word 0x8d95a000  ! 433: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xbd508000  ! 434: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xbd504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xa1a6c840  ! 436: FADDd	faddd	%f58, %f0, %f16
	.word 0xb3504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x8d962000  ! 438: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb7504000  ! 439: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb1504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0x83956000  ! 441: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x819fe000  ! 442: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7504000  ! 443: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xaf50c000  ! 444: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 445: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x85946000  ! 446: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x81942000  ! 447: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbb508000  ! 448: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb1500000  ! 449: RDPR_TPC	<illegal instruction>
	.word 0xbda00540  ! 450: FSQRTd	fsqrt	
	.word 0x81966000  ! 451: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa3504000  ! 452: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x81976000  ! 453: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8196e000  ! 454: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9a50960  ! 455: FMULq	dis not found

	.word 0x839d2000  ! 456: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x81956000  ! 457: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5500000  ! 458: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xaba4c8a0  ! 459: FSUBs	fsubs	%f19, %f0, %f21
	.word 0x8797e000  ! 460: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8397e000  ! 461: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbba688a0  ! 462: FSUBs	fsubs	%f26, %f0, %f29
	.word 0xbba00560  ! 463: FSQRTq	fsqrt	
	.word 0xbd508000  ! 464: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x839ee000  ! 465: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839f6000  ! 466: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa7508000  ! 467: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8196a000  ! 468: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8595e000  ! 469: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d96e000  ! 470: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x819c6000  ! 471: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb750c000  ! 472: RDPR_TT	rdpr	%tt, %r27
	.word 0xb1a48820  ! 473: FADDs	fadds	%f18, %f0, %f24
	.word 0x81976000  ! 474: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x83942000  ! 475: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7504000  ! 476: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xa7508000  ! 477: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 478: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 479: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819de000  ! 480: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x87956000  ! 481: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x819ce000  ! 482: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa1a6c920  ! 483: FMULs	fmuls	%f27, %f0, %f16
	.word 0x85956000  ! 484: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x87952000  ! 485: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbfa00540  ! 486: FSQRTd	fsqrt	
	.word 0x819ce000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa7508000  ! 488: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xaf50c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xb1a00540  ! 490: FSQRTd	fsqrt	
	.word 0x8d946000  ! 491: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xada5c9a0  ! 492: FDIVs	fdivs	%f23, %f0, %f22
	.word 0x8595e000  ! 493: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb1500000  ! 494: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb9a489c0  ! 495: FDIVd	fdivd	%f18, %f0, %f28
	.word 0x8596a000  ! 496: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8d946000  ! 497: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x83956000  ! 498: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8d95e000  ! 499: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbd504000  ! 500: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xa1a00540  ! 501: FSQRTd	fsqrt	
	.word 0x8595a000  ! 502: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x87962000  ! 503: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xaf500000  ! 504: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x81966000  ! 505: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8d94e000  ! 506: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ea000  ! 507: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa9508000  ! 508: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xb7504000  ! 509: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 511: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8396a000  ! 512: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb1500000  ! 513: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x819de000  ! 514: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8797e000  ! 515: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x83962000  ! 516: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x85942000  ! 517: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb350c000  ! 518: RDPR_TT	rdpr	%tt, %r25
	.word 0xaf50c000  ! 519: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 520: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xab504000  ! 521: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xaba5c920  ! 522: FMULs	fmuls	%f23, %f0, %f21
	.word 0x8795e000  ! 523: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x819ca000  ! 524: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa7504000  ! 525: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xb1508000  ! 526: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a7c840  ! 527: FADDd	faddd	%f62, %f0, %f48
	.word 0x8594e000  ! 528: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa1a68920  ! 529: FMULs	fmuls	%f26, %f0, %f16
	.word 0xbd508000  ! 530: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xaf500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 532: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x81942000  ! 533: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x83976000  ! 534: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x87946000  ! 535: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb3a748a0  ! 536: FSUBs	fsubs	%f29, %f0, %f25
	.word 0x85942000  ! 537: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa5a00560  ! 538: FSQRTq	fsqrt	
	.word 0x85946000  ! 539: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x85956000  ! 540: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa9504000  ! 541: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xb3a00560  ! 542: FSQRTq	fsqrt	
	.word 0xad50c000  ! 543: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 544: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb1504000  ! 545: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xa5a488c0  ! 546: FSUBd	fsubd	%f18, %f0, %f18
	.word 0xbf500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xa1a7c9c0  ! 548: FDIVd	fdivd	%f62, %f0, %f16
	.word 0x839de000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb3a7c840  ! 550: FADDd	faddd	%f62, %f0, %f56
	.word 0xa150c000  ! 551: RDPR_TT	rdpr	%tt, %r16
	.word 0xab500000  ! 552: RDPR_TPC	<illegal instruction>
	.word 0x8597e000  ! 553: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x819d6000  ! 554: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa7504000  ! 555: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xab508000  ! 556: RDPR_TSTATE	<illegal instruction>
	.word 0x839f6000  ! 557: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa350c000  ! 558: RDPR_TT	rdpr	%tt, %r17
	.word 0xa7a708a0  ! 559: FSUBs	fsubs	%f28, %f0, %f19
	.word 0x8397a000  ! 560: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbda54940  ! 561: FMULd	fmuld	%f52, %f0, %f30
	.word 0xab504000  ! 562: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xaf508000  ! 563: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d94e000  ! 565: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ea000  ! 566: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb7504000  ! 567: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8d94e000  ! 568: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb5500000  ! 569: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x85942000  ! 570: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb1508000  ! 571: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xa150c000  ! 572: RDPR_TT	<illegal instruction>
	.word 0xa150c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0x87972000  ! 574: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8594e000  ! 575: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8396e000  ! 576: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x85966000  ! 577: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839f6000  ! 578: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb9500000  ! 579: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb5500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 582: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85976000  ! 583: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xafa588c0  ! 584: FSUBd	fsubd	%f22, %f0, %f54
	.word 0x87962000  ! 585: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x839d6000  ! 586: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb9508000  ! 587: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x85972000  ! 588: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x87946000  ! 589: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8794e000  ! 590: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x85942000  ! 591: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa950c000  ! 592: RDPR_TT	rdpr	%tt, %r20
	.word 0x819fe000  ! 593: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839c2000  ! 594: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xada4c940  ! 595: FMULd	fmuld	%f50, %f0, %f22
	.word 0x839e2000  ! 596: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb5508000  ! 597: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8595e000  ! 598: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbb50c000  ! 599: RDPR_TT	rdpr	%tt, %r29
	.word 0x85946000  ! 600: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb5500000  ! 601: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x839ee000  ! 602: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x85966000  ! 603: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x81946000  ! 604: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa150c000  ! 605: RDPR_TT	rdpr	%tt, %r16
	.word 0xa5504000  ! 606: RDPR_TNPC	<illegal instruction>
	.word 0xb9a40960  ! 607: FMULq	dis not found

	.word 0xab508000  ! 608: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a78820  ! 609: FADDs	fadds	%f30, %f0, %f17
	.word 0xbd504000  ! 610: RDPR_TNPC	<illegal instruction>
	.word 0xab508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0x819ee000  ! 612: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xada58940  ! 613: FMULd	fmuld	%f22, %f0, %f22
	.word 0x819ea000  ! 614: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8397e000  ! 615: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb7504000  ! 616: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8194e000  ! 617: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8596e000  ! 618: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8596a000  ! 619: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa7508000  ! 620: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x87952000  ! 621: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb9a749a0  ! 622: FDIVs	fdivs	%f29, %f0, %f28
	.word 0x8796a000  ! 623: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1a50840  ! 624: FADDd	faddd	%f20, %f0, %f24
	.word 0xb3a40940  ! 625: FMULd	fmuld	%f16, %f0, %f56
	.word 0x8d966000  ! 626: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa3a6c9a0  ! 627: FDIVs	fdivs	%f27, %f0, %f17
	.word 0x8197e000  ! 628: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa9500000  ! 629: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xaf500000  ! 630: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 632: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8795e000  ! 633: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87946000  ! 634: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb3a00560  ! 635: FSQRTq	fsqrt	
	.word 0x8d962000  ! 636: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa1508000  ! 637: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xa1a40960  ! 638: FMULq	dis not found

	.word 0xab508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa7c820  ! 640: FADDs	fadds	%f31, %f0, %f31
	.word 0x8394e000  ! 641: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839c2000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x85976000  ! 643: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d962000  ! 644: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa3504000  ! 645: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xbb504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 647: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb500000  ! 648: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x839c2000  ! 649: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xbba589a0  ! 650: FDIVs	fdivs	%f22, %f0, %f29
	.word 0x8195a000  ! 651: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x85942000  ! 652: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa9504000  ! 653: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xb9508000  ! 654: RDPR_TSTATE	<illegal instruction>
	.word 0x87942000  ! 655: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x819c2000  ! 656: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb1504000  ! 657: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8597a000  ! 658: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa9508000  ! 659: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xb950c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0x819d6000  ! 661: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d952000  ! 662: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x819c6000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8195a000  ! 664: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8d946000  ! 665: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8394a000  ! 666: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8196a000  ! 667: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87966000  ! 668: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa950c000  ! 669: RDPR_TT	rdpr	%tt, %r20
	.word 0xb950c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x839e6000  ! 672: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839ce000  ! 673: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa3504000  ! 674: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8d966000  ! 675: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa9a549a0  ! 676: FDIVs	fdivs	%f21, %f0, %f20
	.word 0x819d6000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb7504000  ! 678: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8d95a000  ! 679: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x839d6000  ! 680: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb3504000  ! 681: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xada78940  ! 682: FMULd	fmuld	%f30, %f0, %f22
	.word 0x8395e000  ! 683: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8596e000  ! 684: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8d956000  ! 685: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8597e000  ! 686: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8d97a000  ! 687: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8795e000  ! 688: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x839e2000  ! 689: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819ee000  ! 690: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d942000  ! 691: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819d2000  ! 692: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d976000  ! 693: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8195a000  ! 694: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa7a709e0  ! 695: FDIVq	dis not found

	.word 0x8595a000  ! 696: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8396e000  ! 697: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x81962000  ! 698: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839de000  ! 699: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x87946000  ! 700: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb7a00520  ! 701: FSQRTs	fsqrt	
	.word 0x8394a000  ! 702: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x83976000  ! 703: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbda548c0  ! 704: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb1a68840  ! 705: FADDd	faddd	%f26, %f0, %f24
	.word 0xbf508000  ! 706: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xa5508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0x8394a000  ! 708: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xaf504000  ! 709: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x819ce000  ! 710: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x819ea000  ! 711: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa9a00520  ! 712: FSQRTs	fsqrt	
	.word 0xb5504000  ! 713: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa1508000  ! 714: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 716: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00540  ! 717: FSQRTd	fsqrt	
	.word 0x8796a000  ! 718: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbf504000  ! 719: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb7500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xad50c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 722: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa950c000  ! 723: RDPR_TT	rdpr	%tt, %r20
	.word 0x8d956000  ! 724: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819c6000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xada7c920  ! 726: FMULs	fmuls	%f31, %f0, %f22
	.word 0xa950c000  ! 727: RDPR_TT	rdpr	%tt, %r20
	.word 0x8595e000  ! 728: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xafa749e0  ! 729: FDIVq	dis not found

	.word 0xb1a00540  ! 730: FSQRTd	fsqrt	
	.word 0x87966000  ! 731: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xafa6c820  ! 732: FADDs	fadds	%f27, %f0, %f23
	.word 0xb7a00540  ! 733: FSQRTd	fsqrt	
	.word 0xad500000  ! 734: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xbfa78840  ! 735: FADDd	faddd	%f30, %f0, %f62
	.word 0x85976000  ! 736: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819d2000  ! 737: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xab508000  ! 738: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xb7a4c820  ! 739: FADDs	fadds	%f19, %f0, %f27
	.word 0x839d2000  ! 740: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x839d6000  ! 741: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xbb50c000  ! 742: RDPR_TT	rdpr	%tt, %r29
	.word 0xaf500000  ! 743: RDPR_TPC	<illegal instruction>
	.word 0xa7a00540  ! 744: FSQRTd	fsqrt	
	.word 0xb7508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0x819da000  ! 746: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb1500000  ! 747: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x819d6000  ! 748: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81966000  ! 749: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbfa00520  ! 750: FSQRTs	fsqrt	
	.word 0xb1504000  ! 751: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xaba00520  ! 752: FSQRTs	fsqrt	
	.word 0xbb504000  ! 753: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 754: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0x819fe000  ! 756: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8597a000  ! 757: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8597a000  ! 758: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb9508000  ! 759: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xada70940  ! 760: FMULd	fmuld	%f28, %f0, %f22
	.word 0xb9504000  ! 761: RDPR_TNPC	<illegal instruction>
	.word 0xada00540  ! 762: FSQRTd	fsqrt	
	.word 0xb350c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 764: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839ca000  ! 765: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8d97a000  ! 766: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x819fe000  ! 767: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbf508000  ! 768: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xa5a00520  ! 769: FSQRTs	fsqrt	
	.word 0x81976000  ! 770: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819c2000  ! 771: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa7a648c0  ! 772: FSUBd	fsubd	%f56, %f0, %f50
	.word 0x8395a000  ! 773: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xaf500000  ! 774: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8d956000  ! 775: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x839d2000  ! 776: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x85976000  ! 777: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87962000  ! 778: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbb500000  ! 779: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x819fa000  ! 780: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x819f2000  ! 781: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbb500000  ! 782: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xaf500000  ! 783: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 784: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbda68840  ! 785: FADDd	faddd	%f26, %f0, %f30
	.word 0x8197a000  ! 786: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb5508000  ! 787: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x819de000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8796a000  ! 789: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8597e000  ! 790: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xaf500000  ! 791: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8395a000  ! 792: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8d956000  ! 793: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d96e000  ! 794: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x83966000  ! 795: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8795e000  ! 796: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x85972000  ! 797: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa7a509e0  ! 798: FDIVq	dis not found

	.word 0xa5a7c920  ! 799: FMULs	fmuls	%f31, %f0, %f18
	.word 0xb3508000  ! 800: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x8196e000  ! 801: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbba588a0  ! 802: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xa3504000  ! 803: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x839fe000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa7a6c840  ! 805: FADDd	faddd	%f58, %f0, %f50
	.word 0x839fe000  ! 806: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa1500000  ! 807: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xb9a74840  ! 808: FADDd	faddd	%f60, %f0, %f28
	.word 0xbfa688c0  ! 809: FSUBd	fsubd	%f26, %f0, %f62
	.word 0x8d976000  ! 810: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xaba00560  ! 811: FSQRTq	fsqrt	
	.word 0xaba50920  ! 812: FMULs	fmuls	%f20, %f0, %f21
	.word 0x8595e000  ! 813: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8796e000  ! 814: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbf50c000  ! 815: RDPR_TT	rdpr	%tt, %r31
	.word 0xab508000  ! 816: RDPR_TSTATE	<illegal instruction>
	.word 0xbda509e0  ! 817: FDIVq	dis not found

	.word 0xbf504000  ! 818: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 821: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa950c000  ! 822: RDPR_TT	rdpr	%tt, %r20
	.word 0xbf508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x839fa000  ! 825: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8194a000  ! 826: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xaba60940  ! 827: FMULd	fmuld	%f24, %f0, %f52
	.word 0x8594e000  ! 828: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xbd500000  ! 829: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x8595e000  ! 830: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa3a7c860  ! 831: FADDq	dis not found

	.word 0x839da000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa9504000  ! 833: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xa3a7c920  ! 834: FMULs	fmuls	%f31, %f0, %f17
	.word 0x8597e000  ! 835: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8797e000  ! 836: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xab504000  ! 837: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x839c6000  ! 838: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb3a689c0  ! 839: FDIVd	fdivd	%f26, %f0, %f56
	.word 0xb5a708a0  ! 840: FSUBs	fsubs	%f28, %f0, %f26
	.word 0xbd508000  ! 841: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8597e000  ! 842: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8d976000  ! 843: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1a54860  ! 844: FADDq	dis not found

	.word 0x8d94a000  ! 845: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa350c000  ! 846: RDPR_TT	rdpr	%tt, %r17
	.word 0x81962000  ! 847: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839fa000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa150c000  ! 849: RDPR_TT	rdpr	%tt, %r16
	.word 0xa7504000  ! 850: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 851: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x85972000  ! 852: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8397a000  ! 853: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8d94a000  ! 854: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb9504000  ! 855: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb5a00560  ! 856: FSQRTq	fsqrt	
	.word 0xa9a48860  ! 857: FADDq	dis not found

	.word 0xb5a7c9a0  ! 858: FDIVs	fdivs	%f31, %f0, %f26
	.word 0xb7504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xb5a409c0  ! 861: FDIVd	fdivd	%f16, %f0, %f26
	.word 0x819fe000  ! 862: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8597e000  ! 863: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbd504000  ! 864: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x839da000  ! 865: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8d95e000  ! 866: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa550c000  ! 867: RDPR_TT	rdpr	%tt, %r18
	.word 0x839d6000  ! 868: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x819ea000  ! 869: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbf504000  ! 870: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xad500000  ! 871: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 872: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8795a000  ! 873: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xaf508000  ! 874: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x839d2000  ! 875: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x819ca000  ! 876: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x85952000  ! 877: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb350c000  ! 878: RDPR_TT	rdpr	%tt, %r25
	.word 0x81976000  ! 879: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839c6000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa1504000  ! 881: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x819de000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaf500000  ! 883: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x819ca000  ! 884: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb9500000  ! 885: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xa5504000  ! 886: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 887: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb3500000  ! 888: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xaba5c940  ! 889: FMULd	fmuld	%f54, %f0, %f52
	.word 0xb1a00560  ! 890: FSQRTq	fsqrt	
	.word 0x8d956000  ! 891: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819ca000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8396e000  ! 893: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8d97e000  ! 894: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbba748e0  ! 895: FSUBq	dis not found

	.word 0x8197a000  ! 896: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x85946000  ! 897: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa5508000  ! 898: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x819c6000  ! 899: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8397a000  ! 900: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x85952000  ! 901: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbd500000  ! 902: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xad50c000  ! 903: RDPR_TT	<illegal instruction>
	.word 0xa7504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0x87976000  ! 905: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbf508000  ! 906: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb3500000  ! 907: RDPR_TPC	<illegal instruction>
	.word 0xb5a70940  ! 908: FMULd	fmuld	%f28, %f0, %f26
	.word 0xb950c000  ! 909: RDPR_TT	<illegal instruction>
	.word 0x839de000  ! 910: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb950c000  ! 911: RDPR_TT	rdpr	%tt, %r28
	.word 0x83956000  ! 912: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa1a40960  ! 913: FMULq	dis not found

	.word 0x83962000  ! 914: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbd508000  ! 915: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x819fa000  ! 916: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x839fe000  ! 917: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8d952000  ! 918: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa350c000  ! 919: RDPR_TT	rdpr	%tt, %r17
	.word 0xaf504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0x819de000  ! 921: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d946000  ! 922: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x81976000  ! 923: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa5504000  ! 924: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x83942000  ! 925: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8795a000  ! 926: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xada4c9e0  ! 927: FDIVq	dis not found

	.word 0xa5500000  ! 928: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xb150c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0xaba5c960  ! 930: FMULq	dis not found

	.word 0xb3508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xaba6c820  ! 932: FADDs	fadds	%f27, %f0, %f21
	.word 0xa750c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 934: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 935: RDPR_TNPC	<illegal instruction>
	.word 0x8194e000  ! 936: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xada50940  ! 937: FMULd	fmuld	%f20, %f0, %f22
	.word 0xbb50c000  ! 938: RDPR_TT	rdpr	%tt, %r29
	.word 0x8396a000  ! 939: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbf508000  ! 940: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x85966000  ! 941: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x87952000  ! 942: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x819ea000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xaba789a0  ! 944: FDIVs	fdivs	%f30, %f0, %f21
	.word 0xa3a48920  ! 945: FMULs	fmuls	%f18, %f0, %f17
	.word 0xab50c000  ! 946: RDPR_TT	rdpr	%tt, %r21
	.word 0xb1504000  ! 947: RDPR_TNPC	<illegal instruction>
	.word 0x839ea000  ! 948: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x85952000  ! 949: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa3a58840  ! 950: FADDd	faddd	%f22, %f0, %f48
	.word 0xafa78840  ! 951: FADDd	faddd	%f30, %f0, %f54
	.word 0x8d976000  ! 952: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x819fa000  ! 953: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d972000  ! 954: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa5508000  ! 955: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x81942000  ! 956: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x839c6000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbfa608e0  ! 958: FSUBq	dis not found

	.word 0xaf500000  ! 959: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x85972000  ! 960: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa5508000  ! 961: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb9a448a0  ! 962: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb7508000  ! 963: RDPR_TSTATE	<illegal instruction>
	.word 0x819f6000  ! 964: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa7504000  ! 965: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8796e000  ! 966: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x85976000  ! 967: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839fe000  ! 968: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x87942000  ! 969: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb9500000  ! 970: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x81946000  ! 971: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8d95a000  ! 972: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa9a5c840  ! 973: FADDd	faddd	%f54, %f0, %f20
	.word 0xb7504000  ! 974: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xa9504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0x839fa000  ! 976: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8196a000  ! 977: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb1508000  ! 978: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8395e000  ! 979: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xaba789c0  ! 980: FDIVd	fdivd	%f30, %f0, %f52
	.word 0xbfa4c840  ! 981: FADDd	faddd	%f50, %f0, %f62
	.word 0xb5a48860  ! 982: FADDq	dis not found

	.word 0xad504000  ! 983: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb3500000  ! 984: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 985: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x83966000  ! 986: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa9a548a0  ! 987: FSUBs	fsubs	%f21, %f0, %f20
	.word 0x819d2000  ! 988: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8594e000  ! 989: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x839ca000  ! 990: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x83942000  ! 991: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839d6000  ! 992: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa1500000  ! 993: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xafa6c8a0  ! 994: FSUBs	fsubs	%f27, %f0, %f23
	.word 0x819c6000  ! 995: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x819ea000  ! 996: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8397a000  ! 997: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839d6000  ! 998: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
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
	.word 0x85946000  ! 1: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb7a40920  ! 2: FMULs	fmuls	%f16, %f0, %f27
	.word 0xbd50c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0xa5504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 6: RDPR_TNPC	<illegal instruction>
	.word 0x839f6000  ! 7: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8395e000  ! 8: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa5500000  ! 9: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x8394e000  ! 10: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839fe000  ! 11: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8396a000  ! 12: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbb50c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x8196e000  ! 14: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83962000  ! 15: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819ca000  ! 16: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8194a000  ! 17: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d97a000  ! 18: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xad508000  ! 19: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 20: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb9a00540  ! 21: FSQRTd	fsqrt	
	.word 0x81942000  ! 22: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa3504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 24: RDPR_TNPC	<illegal instruction>
	.word 0xaba508e0  ! 25: FSUBq	dis not found

	.word 0x83946000  ! 26: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8d96e000  ! 27: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x839ee000  ! 28: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb7a4c840  ! 29: FADDd	faddd	%f50, %f0, %f58
	.word 0x8797e000  ! 30: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8394a000  ! 31: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa750c000  ! 32: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 33: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839c6000  ! 34: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xad50c000  ! 35: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 36: RDPR_TSTATE	<illegal instruction>
	.word 0xaba00540  ! 37: FSQRTd	fsqrt	
	.word 0x85956000  ! 38: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x819da000  ! 39: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbda44860  ! 40: FADDq	dis not found

	.word 0x839de000  ! 41: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8d96a000  ! 42: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8597a000  ! 43: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbda448a0  ! 44: FSUBs	fsubs	%f17, %f0, %f30
	.word 0x87976000  ! 45: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d96e000  ! 46: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb5500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 48: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8797e000  ! 49: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d95a000  ! 50: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xab504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 52: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xbf50c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 54: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbd50c000  ! 55: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xab500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xa1a408e0  ! 59: FSUBq	dis not found

	.word 0x85976000  ! 60: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87956000  ! 61: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xaf504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8397a000  ! 63: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839f6000  ! 64: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa3504000  ! 65: RDPR_TNPC	<illegal instruction>
	.word 0x8797e000  ! 66: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8597e000  ! 67: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8d962000  ! 68: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb9500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xb7a54920  ! 70: FMULs	fmuls	%f21, %f0, %f27
	.word 0x8596a000  ! 71: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb7a788a0  ! 72: FSUBs	fsubs	%f30, %f0, %f27
	.word 0xbd500000  ! 73: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 76: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819d2000  ! 77: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d972000  ! 78: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa950c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 80: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 81: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x83966000  ! 82: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x81962000  ! 83: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb7a6c960  ! 84: FMULq	dis not found

	.word 0xb9a44840  ! 85: FADDd	faddd	%f48, %f0, %f28
	.word 0x81956000  ! 86: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x87976000  ! 87: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb7500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 89: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 90: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819ca000  ! 91: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x83966000  ! 92: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x85966000  ! 93: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xaba709e0  ! 94: FDIVq	dis not found

	.word 0x8195a000  ! 95: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa1508000  ! 96: RDPR_TSTATE	<illegal instruction>
	.word 0x819ca000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa5a4c9c0  ! 98: FDIVd	fdivd	%f50, %f0, %f18
	.word 0xb5504000  ! 99: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xbf50c000  ! 100: RDPR_TT	<illegal instruction>
	.word 0x839e6000  ! 101: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa350c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xa7a00560  ! 103: FSQRTq	fsqrt	
	.word 0xab500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 105: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa7508000  ! 106: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 107: RDPR_TT	<illegal instruction>
	.word 0x81972000  ! 108: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819da000  ! 109: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d97a000  ! 110: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbb504000  ! 111: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 112: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 114: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 115: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb1500000  ! 116: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8795e000  ! 117: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8195e000  ! 118: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa3504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 120: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819fa000  ! 121: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xbb504000  ! 122: RDPR_TNPC	<illegal instruction>
	.word 0xa5a58920  ! 123: FMULs	fmuls	%f22, %f0, %f18
	.word 0x87952000  ! 124: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbd508000  ! 125: RDPR_TSTATE	<illegal instruction>
	.word 0x839da000  ! 126: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb5a709c0  ! 127: FDIVd	fdivd	%f28, %f0, %f26
	.word 0xb1a608e0  ! 128: FSUBq	dis not found

	.word 0xad504000  ! 129: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xad504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0x819ee000  ! 132: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x85966000  ! 133: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8797a000  ! 134: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb5504000  ! 135: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 136: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819fe000  ! 137: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xada68820  ! 138: FADDs	fadds	%f26, %f0, %f22
	.word 0xb350c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 140: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 143: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87972000  ! 144: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xab500000  ! 145: RDPR_TPC	<illegal instruction>
	.word 0xa3a608e0  ! 146: FSUBq	dis not found

	.word 0x8d95a000  ! 147: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa9a50940  ! 148: FMULd	fmuld	%f20, %f0, %f20
	.word 0x819da000  ! 149: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d956000  ! 150: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbfa00540  ! 151: FSQRTd	fsqrt	
	.word 0xb1500000  ! 152: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 153: RDPR_TSTATE	<illegal instruction>
	.word 0x81946000  ! 154: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa5504000  ! 155: RDPR_TNPC	<illegal instruction>
	.word 0x8595e000  ! 156: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa5500000  ! 157: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 158: RDPR_TPC	<illegal instruction>
	.word 0x819de000  ! 159: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbb504000  ! 160: RDPR_TNPC	<illegal instruction>
	.word 0xada648e0  ! 161: FSUBq	dis not found

	.word 0xaf50c000  ! 162: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 163: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa9500000  ! 164: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 165: RDPR_TT	<illegal instruction>
	.word 0x819da000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb5508000  ! 167: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8d966000  ! 168: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8397a000  ! 169: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa5504000  ! 170: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xa1508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a509c0  ! 173: FDIVd	fdivd	%f20, %f0, %f28
	.word 0x839ca000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa5a78840  ! 175: FADDd	faddd	%f30, %f0, %f18
	.word 0xa7a64820  ! 176: FADDs	fadds	%f25, %f0, %f19
	.word 0xb7a00560  ! 177: FSQRTq	fsqrt	
	.word 0xad508000  ! 178: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0x8d966000  ! 180: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x83956000  ! 181: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa1508000  ! 182: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 183: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb5a689e0  ! 184: FDIVq	dis not found

	.word 0xbb50c000  ! 185: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 186: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xab508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 188: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xab504000  ! 189: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0xb7a7c8e0  ! 191: FSUBq	dis not found

	.word 0xa1a44960  ! 192: FMULq	dis not found

	.word 0xbf50c000  ! 193: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 194: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbd508000  ! 195: RDPR_TSTATE	<illegal instruction>
	.word 0x819f6000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xaba68820  ! 197: FADDs	fadds	%f26, %f0, %f21
	.word 0xb5a7c8e0  ! 198: FSUBq	dis not found

	.word 0xa7500000  ! 199: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 200: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xab504000  ! 201: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xaf50c000  ! 202: RDPR_TT	<illegal instruction>
	.word 0x839e2000  ! 203: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa9504000  ! 204: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 205: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8d95e000  ! 206: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8396a000  ! 207: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819ce000  ! 208: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb950c000  ! 209: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 210: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a448a0  ! 211: FSUBs	fsubs	%f17, %f0, %f26
	.word 0x81976000  ! 212: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbda70960  ! 213: FMULq	dis not found

	.word 0xa9508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0x8397a000  ! 215: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa5a509e0  ! 216: FDIVq	dis not found

	.word 0xbfa7c8e0  ! 217: FSUBq	dis not found

	.word 0x8597e000  ! 218: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839e6000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa1a58960  ! 220: FMULq	dis not found

	.word 0x819d2000  ! 221: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xafa7c920  ! 222: FMULs	fmuls	%f31, %f0, %f23
	.word 0xb9508000  ! 223: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 224: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 225: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8397e000  ! 226: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8796e000  ! 227: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8195a000  ! 228: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbda6c920  ! 229: FMULs	fmuls	%f27, %f0, %f30
	.word 0xafa00560  ! 230: FSQRTq	fsqrt	
	.word 0x8d952000  ! 231: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xab504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 233: RDPR_TNPC	<illegal instruction>
	.word 0x8d976000  ! 234: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xaf500000  ! 235: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 236: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x85952000  ! 237: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839c2000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819c2000  ! 239: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x87966000  ! 240: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x839fa000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb9a00520  ! 242: FSQRTs	fsqrt	
	.word 0xa3500000  ! 243: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x839de000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x85966000  ! 245: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbb500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 247: RDPR_TT	<illegal instruction>
	.word 0xa7a44940  ! 248: FMULd	fmuld	%f48, %f0, %f50
	.word 0x839fa000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa3504000  ! 250: RDPR_TNPC	<illegal instruction>
	.word 0xbfa7c9c0  ! 251: FDIVd	fdivd	%f62, %f0, %f62
	.word 0xbfa4c920  ! 252: FMULs	fmuls	%f19, %f0, %f31
	.word 0x819ea000  ! 253: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x839f6000  ! 254: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8d976000  ! 255: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xbf50c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 257: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa750c000  ! 258: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 259: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x81956000  ! 260: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5500000  ! 261: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xbda589c0  ! 263: FDIVd	fdivd	%f22, %f0, %f30
	.word 0x85962000  ! 264: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa9508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 266: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x839ea000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x839e2000  ! 268: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb9508000  ! 269: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 271: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x83962000  ! 272: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x83962000  ! 273: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xada4c9e0  ! 274: FDIVq	dis not found

	.word 0x8d966000  ! 275: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbf50c000  ! 276: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 277: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbfa44820  ! 278: FADDs	fadds	%f17, %f0, %f31
	.word 0xb5a608e0  ! 279: FSUBq	dis not found

	.word 0xa7500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 281: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 282: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 283: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x85972000  ! 284: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x87942000  ! 285: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb3508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0x839e6000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x85952000  ! 288: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa5a74840  ! 289: FADDd	faddd	%f60, %f0, %f18
	.word 0xa9504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x8797e000  ! 291: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x819e2000  ! 292: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbda78820  ! 293: FADDs	fadds	%f30, %f0, %f30
	.word 0xad500000  ! 294: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 295: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 296: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x87956000  ! 297: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb750c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xb9a00540  ! 299: FSQRTd	fsqrt	
	.word 0xada44820  ! 300: FADDs	fadds	%f17, %f0, %f22
	.word 0x819ce000  ! 301: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8195e000  ! 302: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8d97e000  ! 303: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xaf504000  ! 304: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e000  ! 305: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa5504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 308: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa7508000  ! 309: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8196e000  ! 310: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xada70960  ! 311: FMULq	dis not found

	.word 0x81962000  ! 312: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x819c6000  ! 313: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x85942000  ! 314: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8594e000  ! 315: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8794a000  ! 316: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x83962000  ! 317: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x83976000  ! 318: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x83942000  ! 319: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d95a000  ! 320: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa3508000  ! 321: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 322: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb7504000  ! 323: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 324: RDPR_TNPC	<illegal instruction>
	.word 0xb1a78920  ! 325: FMULs	fmuls	%f30, %f0, %f24
	.word 0xb3a6c9c0  ! 326: FDIVd	fdivd	%f58, %f0, %f56
	.word 0x819ee000  ! 327: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x839c6000  ! 328: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x81962000  ! 329: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa7a64840  ! 330: FADDd	faddd	%f56, %f0, %f50
	.word 0xbf50c000  ! 331: RDPR_TT	rdpr	%tt, %r31
	.word 0xab500000  ! 332: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a6c920  ! 335: FMULs	fmuls	%f27, %f0, %f19
	.word 0xa9500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xbd50c000  ! 337: RDPR_TT	<illegal instruction>
	.word 0x81946000  ! 338: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa3a50840  ! 339: FADDd	faddd	%f20, %f0, %f48
	.word 0x85942000  ! 340: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa3504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 342: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8796e000  ! 343: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x81962000  ! 344: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x81946000  ! 345: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x839f2000  ! 346: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819fe000  ! 347: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb1500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 349: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbfa6c9a0  ! 350: FDIVs	fdivs	%f27, %f0, %f31
	.word 0xb5a448c0  ! 351: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xaf50c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0xada648a0  ! 353: FSUBs	fsubs	%f25, %f0, %f22
	.word 0x819ee000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x81972000  ! 355: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbd50c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa9a70860  ! 358: FADDq	dis not found

	.word 0xb5504000  ! 359: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 360: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8796e000  ! 361: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xafa6c940  ! 362: FMULd	fmuld	%f58, %f0, %f54
	.word 0x8396a000  ! 363: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb550c000  ! 364: RDPR_TT	<illegal instruction>
	.word 0x819ce000  ! 365: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5508000  ! 366: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 367: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb1a6c8e0  ! 368: FSUBq	dis not found

	.word 0xbd508000  ! 369: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 370: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x87956000  ! 371: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb7500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xb550c000  ! 373: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 374: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8595a000  ! 375: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819ce000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa1a5c9e0  ! 377: FDIVq	dis not found

	.word 0x8d97e000  ! 378: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x87956000  ! 379: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xad508000  ! 380: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 381: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839c2000  ! 382: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x839d6000  ! 383: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8d96a000  ! 384: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8d946000  ! 385: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbb508000  ! 386: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839e6000  ! 388: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839de000  ! 389: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xaf50c000  ! 390: RDPR_TT	<illegal instruction>
	.word 0x87976000  ! 391: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb5a7c8c0  ! 392: FSUBd	fsubd	%f62, %f0, %f26
	.word 0xa5a00520  ! 393: FSQRTs	fsqrt	
	.word 0xb950c000  ! 394: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 395: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xaba00560  ! 396: FSQRTq	fsqrt	
	.word 0xb9a68840  ! 397: FADDd	faddd	%f26, %f0, %f28
	.word 0xbf508000  ! 398: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xaf504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0x8d942000  ! 400: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8595a000  ! 401: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d972000  ! 402: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8d94a000  ! 403: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x81972000  ! 404: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xada609a0  ! 405: FDIVs	fdivs	%f24, %f0, %f22
	.word 0x87972000  ! 406: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8194a000  ! 407: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x87946000  ! 408: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d966000  ! 409: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ce000  ! 410: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x83976000  ! 411: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb1a00520  ! 412: FSQRTs	fsqrt	
	.word 0xa750c000  ! 413: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 414: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819de000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xad500000  ! 416: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 418: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 419: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 420: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xbba649a0  ! 421: FDIVs	fdivs	%f25, %f0, %f29
	.word 0x81962000  ! 422: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa1504000  ! 423: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 424: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 425: RDPR_TPC	<illegal instruction>
	.word 0xb5a588c0  ! 426: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb9a54860  ! 427: FADDq	dis not found

	.word 0xb150c000  ! 428: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 429: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb1a7c9e0  ! 431: FDIVq	dis not found

	.word 0xbda60860  ! 432: FADDq	dis not found

	.word 0x8d956000  ! 433: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa1508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xbba60840  ! 436: FADDd	faddd	%f24, %f0, %f60
	.word 0xb7504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a000  ! 438: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb3504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 441: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819ea000  ! 442: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbb504000  ! 443: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 444: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 445: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85946000  ! 446: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x81972000  ! 447: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbf508000  ! 448: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 449: RDPR_TPC	<illegal instruction>
	.word 0xa1a00540  ! 450: FSQRTd	fsqrt	
	.word 0x81942000  ! 451: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa3504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 453: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x81972000  ! 454: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xaba4c960  ! 455: FMULq	dis not found

	.word 0x839da000  ! 456: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x81946000  ! 457: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbf500000  ! 458: RDPR_TPC	<illegal instruction>
	.word 0xaba508a0  ! 459: FSUBs	fsubs	%f20, %f0, %f21
	.word 0x8795e000  ! 460: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x83962000  ! 461: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa7a648a0  ! 462: FSUBs	fsubs	%f25, %f0, %f19
	.word 0xa9a00560  ! 463: FSQRTq	fsqrt	
	.word 0xb7508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0x839d6000  ! 465: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839f2000  ! 466: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb9508000  ! 467: RDPR_TSTATE	<illegal instruction>
	.word 0x81962000  ! 468: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x85976000  ! 469: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d946000  ! 470: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819ce000  ! 471: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xab50c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0xa1a6c820  ! 473: FADDs	fadds	%f27, %f0, %f16
	.word 0x8196a000  ! 474: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x83962000  ! 475: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa5504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 477: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 478: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 479: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x819d6000  ! 480: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8796a000  ! 481: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819ce000  ! 482: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb7a4c920  ! 483: FMULs	fmuls	%f19, %f0, %f27
	.word 0x8596e000  ! 484: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8796a000  ! 485: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbfa00540  ! 486: FSQRTd	fsqrt	
	.word 0x819ee000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa7508000  ! 488: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xa7a00540  ! 490: FSQRTd	fsqrt	
	.word 0x8d952000  ! 491: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb1a4c9a0  ! 492: FDIVs	fdivs	%f19, %f0, %f24
	.word 0x85952000  ! 493: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb5500000  ! 494: RDPR_TPC	<illegal instruction>
	.word 0xa5a509c0  ! 495: FDIVd	fdivd	%f20, %f0, %f18
	.word 0x8595e000  ! 496: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d976000  ! 497: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8395e000  ! 498: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d96e000  ! 499: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa5504000  ! 500: RDPR_TNPC	<illegal instruction>
	.word 0xbba00540  ! 501: FSQRTd	fsqrt	
	.word 0x8596e000  ! 502: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x87962000  ! 503: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb9500000  ! 504: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 505: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8d972000  ! 506: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819fa000  ! 507: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xaf508000  ! 508: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 509: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 511: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8394e000  ! 512: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xaf500000  ! 513: RDPR_TPC	<illegal instruction>
	.word 0x819f6000  ! 514: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8795e000  ! 515: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8395e000  ! 516: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x85966000  ! 517: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbd50c000  ! 518: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 519: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 520: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xaf504000  ! 521: RDPR_TNPC	<illegal instruction>
	.word 0xa5a54920  ! 522: FMULs	fmuls	%f21, %f0, %f18
	.word 0x87946000  ! 523: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x819d6000  ! 524: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xab504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0xa9508000  ! 526: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a60840  ! 527: FADDd	faddd	%f24, %f0, %f56
	.word 0x8594a000  ! 528: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa1a54920  ! 529: FMULs	fmuls	%f21, %f0, %f16
	.word 0xbd508000  ! 530: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 532: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8197a000  ! 533: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x83946000  ! 534: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8796a000  ! 535: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb5a708a0  ! 536: FSUBs	fsubs	%f28, %f0, %f26
	.word 0x85962000  ! 537: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb5a00560  ! 538: FSQRTq	fsqrt	
	.word 0x8597e000  ! 539: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8597a000  ! 540: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb1504000  ! 541: RDPR_TNPC	<illegal instruction>
	.word 0xaba00560  ! 542: FSQRTq	fsqrt	
	.word 0xa750c000  ! 543: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 544: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa5504000  ! 545: RDPR_TNPC	<illegal instruction>
	.word 0xa9a6c8c0  ! 546: FSUBd	fsubd	%f58, %f0, %f20
	.word 0xb7500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xa5a509c0  ! 548: FDIVd	fdivd	%f20, %f0, %f18
	.word 0x839c6000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa1a5c840  ! 550: FADDd	faddd	%f54, %f0, %f16
	.word 0xbb50c000  ! 551: RDPR_TT	rdpr	%tt, %r29
	.word 0xa7500000  ! 552: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 553: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819ee000  ! 554: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa3504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 556: RDPR_TSTATE	<illegal instruction>
	.word 0x839d6000  ! 557: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa350c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xa5a7c8a0  ! 559: FSUBs	fsubs	%f31, %f0, %f18
	.word 0x83942000  ! 560: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xafa60940  ! 561: FMULd	fmuld	%f24, %f0, %f54
	.word 0xad504000  ! 562: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 563: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d94e000  ! 565: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ca000  ! 566: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa9504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x8d956000  ! 568: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb5500000  ! 569: RDPR_TPC	<illegal instruction>
	.word 0x8596a000  ! 570: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb5508000  ! 571: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 572: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0x8796e000  ! 574: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x85966000  ! 575: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x83966000  ! 576: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x85976000  ! 577: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839d6000  ! 578: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa9500000  ! 579: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 582: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8596a000  ! 583: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xafa688c0  ! 584: FSUBd	fsubd	%f26, %f0, %f54
	.word 0x8797a000  ! 585: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x839c2000  ! 586: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb3508000  ! 587: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 588: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8794e000  ! 589: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x87942000  ! 590: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8595e000  ! 591: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa550c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0x819e6000  ! 593: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x839ce000  ! 594: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb9a48940  ! 595: FMULd	fmuld	%f18, %f0, %f28
	.word 0x839d2000  ! 596: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xbb508000  ! 597: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 598: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbd50c000  ! 599: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 600: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xab500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x839d2000  ! 602: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x85956000  ! 603: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x81956000  ! 604: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb950c000  ! 605: RDPR_TT	rdpr	%tt, %r28
	.word 0xbb504000  ! 606: RDPR_TNPC	<illegal instruction>
	.word 0xa3a6c960  ! 607: FMULq	dis not found

	.word 0xbd508000  ! 608: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a68820  ! 609: FADDs	fadds	%f26, %f0, %f17
	.word 0xa9504000  ! 610: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0x819ca000  ! 612: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xada58940  ! 613: FMULd	fmuld	%f22, %f0, %f22
	.word 0x819c6000  ! 614: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8395a000  ! 615: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb7504000  ! 616: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 617: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8596a000  ! 618: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85956000  ! 619: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa7508000  ! 620: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 621: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa9a789a0  ! 622: FDIVs	fdivs	%f30, %f0, %f20
	.word 0x87946000  ! 623: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xaba50840  ! 624: FADDd	faddd	%f20, %f0, %f52
	.word 0xaba44940  ! 625: FMULd	fmuld	%f48, %f0, %f52
	.word 0x8d96a000  ! 626: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb7a549a0  ! 627: FDIVs	fdivs	%f21, %f0, %f27
	.word 0x8196a000  ! 628: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa7500000  ! 629: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 630: RDPR_TPC	<illegal instruction>
	.word 0xb750c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 632: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x87946000  ! 633: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8794e000  ! 634: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb3a00560  ! 635: FSQRTq	fsqrt	
	.word 0x8d97e000  ! 636: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb5508000  ! 637: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xa7a48960  ! 638: FMULq	dis not found

	.word 0xbf508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xafa48820  ! 640: FADDs	fadds	%f18, %f0, %f23
	.word 0x83956000  ! 641: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839c2000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x85976000  ! 643: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d942000  ! 644: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa3504000  ! 645: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 647: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xad500000  ! 648: RDPR_TPC	<illegal instruction>
	.word 0x839c6000  ! 649: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb3a509a0  ! 650: FDIVs	fdivs	%f20, %f0, %f25
	.word 0x8196a000  ! 651: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8594a000  ! 652: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb1504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 654: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 655: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x819f6000  ! 656: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb7504000  ! 657: RDPR_TNPC	<illegal instruction>
	.word 0x85966000  ! 658: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xad508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 661: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d952000  ! 662: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x819fe000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x81952000  ! 664: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8d96e000  ! 665: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8394a000  ! 666: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x81962000  ! 667: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8796e000  ! 668: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xad50c000  ! 669: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x839fa000  ! 672: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839d2000  ! 673: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa3504000  ! 674: RDPR_TNPC	<illegal instruction>
	.word 0x8d96e000  ! 675: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb9a449a0  ! 676: FDIVs	fdivs	%f17, %f0, %f28
	.word 0x819fa000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa9504000  ! 678: RDPR_TNPC	<illegal instruction>
	.word 0x8d97e000  ! 679: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x839e6000  ! 680: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbb504000  ! 681: RDPR_TNPC	<illegal instruction>
	.word 0xbda40940  ! 682: FMULd	fmuld	%f16, %f0, %f30
	.word 0x83956000  ! 683: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8595a000  ! 684: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d972000  ! 685: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8595a000  ! 686: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d95e000  ! 687: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x87942000  ! 688: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839de000  ! 689: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819da000  ! 690: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d966000  ! 691: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819d6000  ! 692: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d956000  ! 693: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8194a000  ! 694: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbba609e0  ! 695: FDIVq	dis not found

	.word 0x8596e000  ! 696: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x83966000  ! 697: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x81976000  ! 698: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839ea000  ! 699: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x87946000  ! 700: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbfa00520  ! 701: FSQRTs	fsqrt	
	.word 0x8397a000  ! 702: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x83952000  ! 703: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbfa7c8c0  ! 704: FSUBd	fsubd	%f62, %f0, %f62
	.word 0xaba54840  ! 705: FADDd	faddd	%f52, %f0, %f52
	.word 0xab508000  ! 706: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xbd508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 708: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb3504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0x819c6000  ! 710: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x819d2000  ! 711: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xaba00520  ! 712: FSQRTs	fsqrt	
	.word 0xad504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 714: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 716: RDPR_TNPC	<illegal instruction>
	.word 0xaba00540  ! 717: FSQRTd	fsqrt	
	.word 0x87956000  ! 718: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa5504000  ! 719: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xa3500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 722: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa750c000  ! 723: RDPR_TT	<illegal instruction>
	.word 0x8d96a000  ! 724: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x819ee000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa1a78920  ! 726: FMULs	fmuls	%f30, %f0, %f16
	.word 0xb550c000  ! 727: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 728: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xada649e0  ! 729: FDIVq	dis not found

	.word 0xb7a00540  ! 730: FSQRTd	fsqrt	
	.word 0x87952000  ! 731: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa9a44820  ! 732: FADDs	fadds	%f17, %f0, %f20
	.word 0xa7a00540  ! 733: FSQRTd	fsqrt	
	.word 0xb5500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xb3a60840  ! 735: FADDd	faddd	%f24, %f0, %f56
	.word 0x85946000  ! 736: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x819ca000  ! 737: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbf508000  ! 738: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a48820  ! 739: FADDs	fadds	%f18, %f0, %f16
	.word 0x839fe000  ! 740: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x839e2000  ! 741: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb150c000  ! 742: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 743: RDPR_TPC	<illegal instruction>
	.word 0xa5a00540  ! 744: FSQRTd	fsqrt	
	.word 0xbf508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0x819d2000  ! 746: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa1500000  ! 747: RDPR_TPC	<illegal instruction>
	.word 0x819fe000  ! 748: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x81972000  ! 749: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa3a00520  ! 750: FSQRTs	fsqrt	
	.word 0xa7504000  ! 751: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00520  ! 752: FSQRTs	fsqrt	
	.word 0xa9504000  ! 753: RDPR_TNPC	<illegal instruction>
	.word 0xa9508000  ! 754: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 756: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8595e000  ! 757: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x85966000  ! 758: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb5508000  ! 759: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a48940  ! 760: FMULd	fmuld	%f18, %f0, %f16
	.word 0xb3504000  ! 761: RDPR_TNPC	<illegal instruction>
	.word 0xafa00540  ! 762: FSQRTd	fsqrt	
	.word 0xb550c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 764: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839da000  ! 765: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8d95e000  ! 766: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819fa000  ! 767: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb1508000  ! 768: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb7a00520  ! 769: FSQRTs	fsqrt	
	.word 0x8195a000  ! 770: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x819ee000  ! 771: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa9a508c0  ! 772: FSUBd	fsubd	%f20, %f0, %f20
	.word 0x83942000  ! 773: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa1500000  ! 774: RDPR_TPC	<illegal instruction>
	.word 0x8d94a000  ! 775: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839c2000  ! 776: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x85976000  ! 777: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8797e000  ! 778: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x819ea000  ! 780: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x819f6000  ! 781: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa7500000  ! 782: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 783: RDPR_TPC	<illegal instruction>
	.word 0x83962000  ! 784: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa3a64840  ! 785: FADDd	faddd	%f56, %f0, %f48
	.word 0x81942000  ! 786: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb3508000  ! 787: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x87976000  ! 789: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8595a000  ! 790: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xab500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 792: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d976000  ! 793: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d95e000  ! 794: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x83946000  ! 795: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8794e000  ! 796: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8597e000  ! 797: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa9a449e0  ! 798: FDIVq	dis not found

	.word 0xafa54920  ! 799: FMULs	fmuls	%f21, %f0, %f23
	.word 0xa1508000  ! 800: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 801: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa3a6c8a0  ! 802: FSUBs	fsubs	%f27, %f0, %f17
	.word 0xb3504000  ! 803: RDPR_TNPC	<illegal instruction>
	.word 0x839ea000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa9a54840  ! 805: FADDd	faddd	%f52, %f0, %f20
	.word 0x839e2000  ! 806: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa5500000  ! 807: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xbba64840  ! 808: FADDd	faddd	%f56, %f0, %f60
	.word 0xb3a408c0  ! 809: FSUBd	fsubd	%f16, %f0, %f56
	.word 0x8d97a000  ! 810: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xada00560  ! 811: FSQRTq	fsqrt	
	.word 0xa5a5c920  ! 812: FMULs	fmuls	%f23, %f0, %f18
	.word 0x8595a000  ! 813: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8796e000  ! 814: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb950c000  ! 815: RDPR_TT	rdpr	%tt, %r28
	.word 0xbf508000  ! 816: RDPR_TSTATE	<illegal instruction>
	.word 0xbda509e0  ! 817: FDIVq	dis not found

	.word 0xa9504000  ! 818: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 821: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xab50c000  ! 822: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0xa1504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 825: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8195a000  ! 826: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbba7c940  ! 827: FMULd	fmuld	%f62, %f0, %f60
	.word 0x85962000  ! 828: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb1500000  ! 829: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 830: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xaba78860  ! 831: FADDq	dis not found

	.word 0x839d2000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb5504000  ! 833: RDPR_TNPC	<illegal instruction>
	.word 0xb7a6c920  ! 834: FMULs	fmuls	%f27, %f0, %f27
	.word 0x8595a000  ! 835: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8797a000  ! 836: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb1504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 838: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb1a6c9c0  ! 839: FDIVd	fdivd	%f58, %f0, %f24
	.word 0xafa6c8a0  ! 840: FSUBs	fsubs	%f27, %f0, %f23
	.word 0xbf508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a000  ! 842: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d956000  ! 843: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa5a4c860  ! 844: FADDq	dis not found

	.word 0x8d962000  ! 845: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa150c000  ! 846: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 847: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x839fa000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xaf50c000  ! 849: RDPR_TT	rdpr	%tt, %r23
	.word 0xbd504000  ! 850: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 851: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x85966000  ! 852: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8397a000  ! 853: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8d956000  ! 854: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xab504000  ! 855: RDPR_TNPC	<illegal instruction>
	.word 0xa3a00560  ! 856: FSQRTq	fsqrt	
	.word 0xb5a48860  ! 857: FADDq	dis not found

	.word 0xb3a4c9a0  ! 858: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xa9504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xb5a449c0  ! 861: FDIVd	fdivd	%f48, %f0, %f26
	.word 0x819f2000  ! 862: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8596a000  ! 863: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbd504000  ! 864: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 865: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8d962000  ! 866: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xad50c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 868: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819c2000  ! 869: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xab504000  ! 870: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xaf500000  ! 871: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 872: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8794e000  ! 873: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb7508000  ! 874: RDPR_TSTATE	<illegal instruction>
	.word 0x839da000  ! 875: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819ea000  ! 876: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x85952000  ! 877: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbf50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x81956000  ! 879: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839ee000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xbd504000  ! 881: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x819f2000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb3500000  ! 883: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 884: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb3500000  ! 885: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 886: RDPR_TNPC	<illegal instruction>
	.word 0x819da000  ! 887: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa5500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xa5a58940  ! 889: FMULd	fmuld	%f22, %f0, %f18
	.word 0xbfa00560  ! 890: FSQRTq	fsqrt	
	.word 0x8d94a000  ! 891: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819e6000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x83952000  ! 893: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d972000  ! 894: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbfa788e0  ! 895: FSUBq	dis not found

	.word 0x81946000  ! 896: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8595e000  ! 897: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa7508000  ! 898: RDPR_TSTATE	<illegal instruction>
	.word 0x819c6000  ! 899: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x83946000  ! 900: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8594e000  ! 901: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb5500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xab50c000  ! 903: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 905: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa5508000  ! 906: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xbf500000  ! 907: RDPR_TPC	<illegal instruction>
	.word 0xafa48940  ! 908: FMULd	fmuld	%f18, %f0, %f54
	.word 0xbd50c000  ! 909: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 910: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb950c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 912: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7a60960  ! 913: FMULq	dis not found

	.word 0x8397a000  ! 914: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb3508000  ! 915: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 916: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839f6000  ! 917: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8d96e000  ! 918: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa150c000  ! 919: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0x819e6000  ! 921: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d97e000  ! 922: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x81972000  ! 923: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb3504000  ! 924: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 925: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8797a000  ! 926: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xada489e0  ! 927: FDIVq	dis not found

	.word 0xbd500000  ! 928: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0xb1a44960  ! 930: FMULq	dis not found

	.word 0xad508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xafa74820  ! 932: FADDs	fadds	%f29, %f0, %f23
	.word 0xa550c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 934: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 935: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 936: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xada64940  ! 937: FMULd	fmuld	%f56, %f0, %f22
	.word 0xb950c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 939: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb9508000  ! 940: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x85962000  ! 941: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x87966000  ! 942: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x819ca000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb3a689a0  ! 944: FDIVs	fdivs	%f26, %f0, %f25
	.word 0xa3a48920  ! 945: FMULs	fmuls	%f18, %f0, %f17
	.word 0xb350c000  ! 946: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 947: RDPR_TNPC	<illegal instruction>
	.word 0x839ea000  ! 948: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x85972000  ! 949: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa5a64840  ! 950: FADDd	faddd	%f56, %f0, %f18
	.word 0xbba5c840  ! 951: FADDd	faddd	%f54, %f0, %f60
	.word 0x8d946000  ! 952: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819ee000  ! 953: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d94e000  ! 954: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb3508000  ! 955: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 956: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x839f6000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa5a748e0  ! 958: FSUBq	dis not found

	.word 0xbd500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 960: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa1508000  ! 961: RDPR_TSTATE	<illegal instruction>
	.word 0xafa688a0  ! 962: FSUBs	fsubs	%f26, %f0, %f23
	.word 0xbb508000  ! 963: RDPR_TSTATE	<illegal instruction>
	.word 0x819de000  ! 964: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbf504000  ! 965: RDPR_TNPC	<illegal instruction>
	.word 0x87976000  ! 966: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x85976000  ! 967: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839e2000  ! 968: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8796e000  ! 969: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbf500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 971: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8d972000  ! 972: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xaba48840  ! 973: FADDd	faddd	%f18, %f0, %f52
	.word 0xab504000  ! 974: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 976: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x81962000  ! 977: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa9508000  ! 978: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 979: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xada649c0  ! 980: FDIVd	fdivd	%f56, %f0, %f22
	.word 0xa7a74840  ! 981: FADDd	faddd	%f60, %f0, %f50
	.word 0xb7a50860  ! 982: FADDq	dis not found

	.word 0xb7504000  ! 983: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 984: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 985: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x83972000  ! 986: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xaba4c8a0  ! 987: FSUBs	fsubs	%f19, %f0, %f21
	.word 0x819ca000  ! 988: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8597e000  ! 989: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839c6000  ! 990: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8397a000  ! 991: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839c2000  ! 992: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb1500000  ! 993: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xa3a648a0  ! 994: FSUBs	fsubs	%f25, %f0, %f17
	.word 0x819ca000  ! 995: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x819ca000  ! 996: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8394e000  ! 997: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839fa000  ! 998: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
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
	.word 0x85962000  ! 1: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb9a58920  ! 2: FMULs	fmuls	%f22, %f0, %f28
	.word 0xaf50c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 6: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 7: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8397a000  ! 8: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa5500000  ! 9: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 10: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839ee000  ! 11: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x83962000  ! 12: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa350c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x81956000  ! 14: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x83962000  ! 15: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819d2000  ! 16: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8196a000  ! 17: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8d97e000  ! 18: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa3508000  ! 19: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 20: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb9a00540  ! 21: FSQRTd	fsqrt	
	.word 0x8194e000  ! 22: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa9504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 24: RDPR_TNPC	<illegal instruction>
	.word 0xada5c8e0  ! 25: FSUBq	dis not found

	.word 0x83952000  ! 26: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d966000  ! 27: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x839f6000  ! 28: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb9a64840  ! 29: FADDd	faddd	%f56, %f0, %f28
	.word 0x87972000  ! 30: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x83962000  ! 31: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa950c000  ! 32: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 33: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839c6000  ! 34: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa950c000  ! 35: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 36: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00540  ! 37: FSQRTd	fsqrt	
	.word 0x8594e000  ! 38: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x819fa000  ! 39: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa3a70860  ! 40: FADDq	dis not found

	.word 0x839e6000  ! 41: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8d94e000  ! 42: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x85952000  ! 43: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xafa608a0  ! 44: FSUBs	fsubs	%f24, %f0, %f23
	.word 0x8797e000  ! 45: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d972000  ! 46: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb9500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 48: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8794e000  ! 49: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d942000  ! 50: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb5504000  ! 51: RDPR_TNPC	<illegal instruction>
	.word 0x819c2000  ! 52: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb150c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x819c6000  ! 54: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xab50c000  ! 55: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa3500000  ! 58: RDPR_TPC	<illegal instruction>
	.word 0xb5a708e0  ! 59: FSUBq	dis not found

	.word 0x85966000  ! 60: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8794a000  ! 61: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa5504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 63: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839ee000  ! 64: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb5504000  ! 65: RDPR_TNPC	<illegal instruction>
	.word 0x8794a000  ! 66: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x85962000  ! 67: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8d952000  ! 68: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb9500000  ! 69: RDPR_TPC	<illegal instruction>
	.word 0xbfa40920  ! 70: FMULs	fmuls	%f16, %f0, %f31
	.word 0x8595a000  ! 71: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbba588a0  ! 72: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xbd500000  ! 73: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 74: RDPR_TPC	<illegal instruction>
	.word 0xa750c000  ! 75: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 76: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819e6000  ! 77: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d97e000  ! 78: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xab50c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 80: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e000  ! 81: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8394a000  ! 82: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x81976000  ! 83: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa3a4c960  ! 84: FMULq	dis not found

	.word 0xa1a7c840  ! 85: FADDd	faddd	%f62, %f0, %f16
	.word 0x8194a000  ! 86: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8796e000  ! 87: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xaf500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 89: RDPR_TT	<illegal instruction>
	.word 0x839fe000  ! 90: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819d2000  ! 91: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x83962000  ! 92: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x85962000  ! 93: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb7a509e0  ! 94: FDIVq	dis not found

	.word 0x8197e000  ! 95: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb7508000  ! 96: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbfa689c0  ! 98: FDIVd	fdivd	%f26, %f0, %f62
	.word 0xbf504000  ! 99: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 100: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 101: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb750c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xafa00560  ! 103: FSQRTq	fsqrt	
	.word 0xbf500000  ! 104: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 105: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa5508000  ! 106: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 107: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 108: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x819c2000  ! 109: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d956000  ! 110: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb5504000  ! 111: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 112: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 113: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 114: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 115: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb500000  ! 116: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 117: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8197e000  ! 118: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xad504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x839e6000  ! 120: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819fe000  ! 121: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5504000  ! 122: RDPR_TNPC	<illegal instruction>
	.word 0xa7a44920  ! 123: FMULs	fmuls	%f17, %f0, %f19
	.word 0x8796e000  ! 124: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbb508000  ! 125: RDPR_TSTATE	<illegal instruction>
	.word 0x839ee000  ! 126: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xaba409c0  ! 127: FDIVd	fdivd	%f16, %f0, %f52
	.word 0xbba548e0  ! 128: FSUBq	dis not found

	.word 0xa1504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 130: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 131: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 132: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x85966000  ! 133: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8797e000  ! 134: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb1504000  ! 135: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 136: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819f6000  ! 137: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa5a78820  ! 138: FADDs	fadds	%f30, %f0, %f18
	.word 0xb350c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 140: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0x8794a000  ! 143: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x87942000  ! 144: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb3500000  ! 145: RDPR_TPC	<illegal instruction>
	.word 0xb1a488e0  ! 146: FSUBq	dis not found

	.word 0x8d97a000  ! 147: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa9a54940  ! 148: FMULd	fmuld	%f52, %f0, %f20
	.word 0x819e2000  ! 149: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d956000  ! 150: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb9a00540  ! 151: FSQRTd	fsqrt	
	.word 0xa1500000  ! 152: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 153: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 154: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb7504000  ! 155: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8595e000  ! 156: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa7500000  ! 157: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 158: RDPR_TPC	<illegal instruction>
	.word 0x819ea000  ! 159: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbd504000  ! 160: RDPR_TNPC	<illegal instruction>
	.word 0xada448e0  ! 161: FSUBq	dis not found

	.word 0xbd50c000  ! 162: RDPR_TT	<illegal instruction>
	.word 0x8d96a000  ! 163: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa5500000  ! 164: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 165: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xaf508000  ! 167: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 168: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8394a000  ! 169: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa7504000  ! 170: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 172: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a7c9c0  ! 173: FDIVd	fdivd	%f62, %f0, %f28
	.word 0x839fa000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xaba4c840  ! 175: FADDd	faddd	%f50, %f0, %f52
	.word 0xa1a5c820  ! 176: FADDs	fadds	%f23, %f0, %f16
	.word 0xa7a00560  ! 177: FSQRTq	fsqrt	
	.word 0xbb508000  ! 178: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 179: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 180: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8397a000  ! 181: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa1508000  ! 182: RDPR_TSTATE	<illegal instruction>
	.word 0x8195e000  ! 183: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9a489e0  ! 184: FDIVq	dis not found

	.word 0xb150c000  ! 185: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 186: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xaf508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 188: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5504000  ! 189: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0xbba7c8e0  ! 191: FSUBq	dis not found

	.word 0xbda78960  ! 192: FMULq	dis not found

	.word 0xab50c000  ! 193: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 194: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xaf508000  ! 195: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb9a60820  ! 197: FADDs	fadds	%f24, %f0, %f28
	.word 0xb9a448e0  ! 198: FSUBq	dis not found

	.word 0xbb500000  ! 199: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 200: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb1504000  ! 201: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 202: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 203: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa7504000  ! 204: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 205: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d95a000  ! 206: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x83962000  ! 207: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819f6000  ! 208: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb350c000  ! 209: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 210: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a508a0  ! 211: FSUBs	fsubs	%f20, %f0, %f26
	.word 0x8197a000  ! 212: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb7a54960  ! 213: FMULq	dis not found

	.word 0xb1508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 215: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb1a509e0  ! 216: FDIVq	dis not found

	.word 0xb3a688e0  ! 217: FSUBq	dis not found

	.word 0x85942000  ! 218: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x839da000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xbfa6c960  ! 220: FMULq	dis not found

	.word 0x819da000  ! 221: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xada70920  ! 222: FMULs	fmuls	%f28, %f0, %f22
	.word 0xa7508000  ! 223: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 224: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 225: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x83976000  ! 226: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x87952000  ! 227: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x81976000  ! 228: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbfa78920  ! 229: FMULs	fmuls	%f30, %f0, %f31
	.word 0xaba00560  ! 230: FSQRTq	fsqrt	
	.word 0x8d956000  ! 231: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbb504000  ! 232: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 233: RDPR_TNPC	<illegal instruction>
	.word 0x8d972000  ! 234: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xad500000  ! 235: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 236: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8596a000  ! 237: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x839de000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819ca000  ! 239: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x87946000  ! 240: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839fe000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xada00520  ! 242: FSQRTs	fsqrt	
	.word 0xbf500000  ! 243: RDPR_TPC	<illegal instruction>
	.word 0x839e2000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8596a000  ! 245: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa3500000  ! 246: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 247: RDPR_TT	<illegal instruction>
	.word 0xb5a78940  ! 248: FMULd	fmuld	%f30, %f0, %f26
	.word 0x839f2000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbd504000  ! 250: RDPR_TNPC	<illegal instruction>
	.word 0xa3a689c0  ! 251: FDIVd	fdivd	%f26, %f0, %f48
	.word 0xafa58920  ! 252: FMULs	fmuls	%f22, %f0, %f23
	.word 0x819ee000  ! 253: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x839ca000  ! 254: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8d962000  ! 255: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa750c000  ! 256: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 257: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbb50c000  ! 258: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 259: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x81946000  ! 260: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb5500000  ! 261: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xb3a449c0  ! 263: FDIVd	fdivd	%f48, %f0, %f56
	.word 0x8594e000  ! 264: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb7508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x87942000  ! 266: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839c2000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x839d2000  ! 268: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa7508000  ! 269: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 271: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x83956000  ! 272: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x83972000  ! 273: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbba609e0  ! 274: FDIVq	dis not found

	.word 0x8d97e000  ! 275: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbd50c000  ! 276: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 277: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb1a64820  ! 278: FADDs	fadds	%f25, %f0, %f24
	.word 0xb1a548e0  ! 279: FSUBq	dis not found

	.word 0xa9500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 281: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 282: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 283: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8596a000  ! 284: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87956000  ! 285: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa9508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0x839e6000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8595a000  ! 288: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb3a58840  ! 289: FADDd	faddd	%f22, %f0, %f56
	.word 0xad504000  ! 290: RDPR_TNPC	<illegal instruction>
	.word 0x87956000  ! 291: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x819de000  ! 292: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaba70820  ! 293: FADDs	fadds	%f28, %f0, %f21
	.word 0xbd500000  ! 294: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 295: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 296: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8796a000  ! 297: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xaf50c000  ! 298: RDPR_TT	<illegal instruction>
	.word 0xbda00540  ! 299: FSQRTd	fsqrt	
	.word 0xa7a70820  ! 300: FADDs	fadds	%f28, %f0, %f19
	.word 0x819d2000  ! 301: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8196a000  ! 302: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8d972000  ! 303: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb5504000  ! 304: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 305: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa5504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 308: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb5508000  ! 309: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x81976000  ! 310: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa3a70960  ! 311: FMULq	dis not found

	.word 0x8197e000  ! 312: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x819e6000  ! 313: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x85956000  ! 314: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85962000  ! 315: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x87942000  ! 316: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x83942000  ! 317: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83976000  ! 318: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x83962000  ! 319: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8d97a000  ! 320: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa9508000  ! 321: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 322: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa1504000  ! 323: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 324: RDPR_TNPC	<illegal instruction>
	.word 0xbba70920  ! 325: FMULs	fmuls	%f28, %f0, %f29
	.word 0xa7a4c9c0  ! 326: FDIVd	fdivd	%f50, %f0, %f50
	.word 0x819fe000  ! 327: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839ea000  ! 328: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x81946000  ! 329: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa3a7c840  ! 330: FADDd	faddd	%f62, %f0, %f48
	.word 0xab50c000  ! 331: RDPR_TT	rdpr	%tt, %r21
	.word 0xa3500000  ! 332: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0xa3508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a74920  ! 335: FMULs	fmuls	%f29, %f0, %f25
	.word 0xab500000  ! 336: RDPR_TPC	<illegal instruction>
	.word 0xa150c000  ! 337: RDPR_TT	<illegal instruction>
	.word 0x8196e000  ! 338: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb7a6c840  ! 339: FADDd	faddd	%f58, %f0, %f58
	.word 0x8595a000  ! 340: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb3504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 342: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x87966000  ! 343: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x81962000  ! 344: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x81962000  ! 345: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839fe000  ! 346: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819ea000  ! 347: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa5500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 349: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa1a589a0  ! 350: FDIVs	fdivs	%f22, %f0, %f16
	.word 0xafa688c0  ! 351: FSUBd	fsubd	%f26, %f0, %f54
	.word 0xab50c000  ! 352: RDPR_TT	<illegal instruction>
	.word 0xb5a488a0  ! 353: FSUBs	fsubs	%f18, %f0, %f26
	.word 0x819ea000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x81946000  ! 355: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa550c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0x839fe000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa3a58860  ! 358: FADDq	dis not found

	.word 0xb5504000  ! 359: RDPR_TNPC	<illegal instruction>
	.word 0x819ce000  ! 360: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x87942000  ! 361: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xafa70940  ! 362: FMULd	fmuld	%f28, %f0, %f54
	.word 0x8397e000  ! 363: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa150c000  ! 364: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 365: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbf508000  ! 366: RDPR_TSTATE	<illegal instruction>
	.word 0x81962000  ! 367: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xada708e0  ! 368: FSUBq	dis not found

	.word 0xbd508000  ! 369: RDPR_TSTATE	<illegal instruction>
	.word 0x819c6000  ! 370: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8794e000  ! 371: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa1500000  ! 372: RDPR_TPC	<illegal instruction>
	.word 0xa150c000  ! 373: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 374: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8594e000  ! 375: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x819de000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xb7a6c9e0  ! 377: FDIVq	dis not found

	.word 0x8d95a000  ! 378: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8794a000  ! 379: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb3508000  ! 380: RDPR_TSTATE	<illegal instruction>
	.word 0x87972000  ! 381: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839e2000  ! 382: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839fe000  ! 383: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8d976000  ! 384: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d966000  ! 385: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa3508000  ! 386: RDPR_TSTATE	<illegal instruction>
	.word 0x839ca000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x839de000  ! 388: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839fa000  ! 389: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xbf50c000  ! 390: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 391: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa9a4c8c0  ! 392: FSUBd	fsubd	%f50, %f0, %f20
	.word 0xbda00520  ! 393: FSQRTs	fsqrt	
	.word 0xbf50c000  ! 394: RDPR_TT	<illegal instruction>
	.word 0x8794e000  ! 395: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbfa00560  ! 396: FSQRTq	fsqrt	
	.word 0xaba54840  ! 397: FADDd	faddd	%f52, %f0, %f52
	.word 0xa1508000  ! 398: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xb1504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 400: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8596e000  ! 401: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8d95e000  ! 402: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d96a000  ! 403: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8195e000  ! 404: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb5a489a0  ! 405: FDIVs	fdivs	%f18, %f0, %f26
	.word 0x8796a000  ! 406: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8194e000  ! 407: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8794e000  ! 408: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d94a000  ! 409: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819e6000  ! 410: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x83972000  ! 411: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb5a00520  ! 412: FSQRTs	fsqrt	
	.word 0xab50c000  ! 413: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 414: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x819ee000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xaf500000  ! 416: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 418: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 419: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 420: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb7a5c9a0  ! 421: FDIVs	fdivs	%f23, %f0, %f27
	.word 0x81956000  ! 422: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5504000  ! 423: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 424: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 425: RDPR_TPC	<illegal instruction>
	.word 0xa9a5c8c0  ! 426: FSUBd	fsubd	%f54, %f0, %f20
	.word 0xa3a74860  ! 427: FADDq	dis not found

	.word 0xa750c000  ! 428: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 429: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbda409e0  ! 431: FDIVq	dis not found

	.word 0xa9a70860  ! 432: FADDq	dis not found

	.word 0x8d976000  ! 433: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1508000  ! 434: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 435: RDPR_TNPC	<illegal instruction>
	.word 0xada4c840  ! 436: FADDd	faddd	%f50, %f0, %f22
	.word 0xbf504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 438: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa3504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 440: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 441: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819ca000  ! 442: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5504000  ! 443: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 444: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 445: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x85952000  ! 446: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x81956000  ! 447: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xad508000  ! 448: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 449: RDPR_TPC	<illegal instruction>
	.word 0xb5a00540  ! 450: FSQRTd	fsqrt	
	.word 0x8195e000  ! 451: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb5504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 453: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x81956000  ! 454: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb3a6c960  ! 455: FMULq	dis not found

	.word 0x839c2000  ! 456: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8196e000  ! 457: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbf500000  ! 458: RDPR_TPC	<illegal instruction>
	.word 0xada7c8a0  ! 459: FSUBs	fsubs	%f31, %f0, %f22
	.word 0x8794e000  ! 460: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x83952000  ! 461: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa1a748a0  ! 462: FSUBs	fsubs	%f29, %f0, %f16
	.word 0xb9a00560  ! 463: FSQRTq	fsqrt	
	.word 0xb9508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0x839e6000  ! 465: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839f6000  ! 466: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa5508000  ! 467: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 468: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85942000  ! 469: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8d966000  ! 470: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ca000  ! 471: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xad50c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0xbba4c820  ! 473: FADDs	fadds	%f19, %f0, %f29
	.word 0x8196e000  ! 474: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8394a000  ! 475: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb1504000  ! 476: RDPR_TNPC	<illegal instruction>
	.word 0xab508000  ! 477: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 478: RDPR_TPC	<illegal instruction>
	.word 0x8396a000  ! 479: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819ce000  ! 480: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8797a000  ! 481: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x819ea000  ! 482: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbba58920  ! 483: FMULs	fmuls	%f22, %f0, %f29
	.word 0x8597a000  ! 484: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8794a000  ! 485: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb9a00540  ! 486: FSQRTd	fsqrt	
	.word 0x819fa000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb3508000  ! 488: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xbba00540  ! 490: FSQRTd	fsqrt	
	.word 0x8d97a000  ! 491: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa9a449a0  ! 492: FDIVs	fdivs	%f17, %f0, %f20
	.word 0x85946000  ! 493: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa5500000  ! 494: RDPR_TPC	<illegal instruction>
	.word 0xbfa4c9c0  ! 495: FDIVd	fdivd	%f50, %f0, %f62
	.word 0x8595a000  ! 496: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d972000  ! 497: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8394a000  ! 498: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8d96a000  ! 499: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa5504000  ! 500: RDPR_TNPC	<illegal instruction>
	.word 0xaba00540  ! 501: FSQRTd	fsqrt	
	.word 0x8595e000  ! 502: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8795e000  ! 503: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa5500000  ! 504: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 505: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8d956000  ! 506: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819ce000  ! 507: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb9508000  ! 508: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 509: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 510: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 511: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8395a000  ! 512: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbd500000  ! 513: RDPR_TPC	<illegal instruction>
	.word 0x819ca000  ! 514: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x87946000  ! 515: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8394e000  ! 516: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x85976000  ! 517: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb150c000  ! 518: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 519: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 520: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3504000  ! 521: RDPR_TNPC	<illegal instruction>
	.word 0xb9a54920  ! 522: FMULs	fmuls	%f21, %f0, %f28
	.word 0x87962000  ! 523: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819de000  ! 524: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa7504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 526: RDPR_TSTATE	<illegal instruction>
	.word 0xbda60840  ! 527: FADDd	faddd	%f24, %f0, %f30
	.word 0x85946000  ! 528: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa9a48920  ! 529: FMULs	fmuls	%f18, %f0, %f20
	.word 0xa1508000  ! 530: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 531: RDPR_TPC	<illegal instruction>
	.word 0x83962000  ! 532: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8196a000  ! 533: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8397e000  ! 534: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8797a000  ! 535: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbda5c8a0  ! 536: FSUBs	fsubs	%f23, %f0, %f30
	.word 0x85946000  ! 537: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa7a00560  ! 538: FSQRTq	fsqrt	
	.word 0x8597a000  ! 539: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8594a000  ! 540: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xaf504000  ! 541: RDPR_TNPC	<illegal instruction>
	.word 0xbba00560  ! 542: FSQRTq	fsqrt	
	.word 0xb350c000  ! 543: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 544: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa7504000  ! 545: RDPR_TNPC	<illegal instruction>
	.word 0xada688c0  ! 546: FSUBd	fsubd	%f26, %f0, %f22
	.word 0xa1500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xbba789c0  ! 548: FDIVd	fdivd	%f30, %f0, %f60
	.word 0x839ce000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa9a54840  ! 550: FADDd	faddd	%f52, %f0, %f20
	.word 0xbf50c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 552: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 553: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x819e2000  ! 554: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb9504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 556: RDPR_TSTATE	<illegal instruction>
	.word 0x839f2000  ! 557: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb350c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xafa508a0  ! 559: FSUBs	fsubs	%f20, %f0, %f23
	.word 0x83966000  ! 560: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbba60940  ! 561: FMULd	fmuld	%f24, %f0, %f60
	.word 0xbf504000  ! 562: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 563: RDPR_TSTATE	<illegal instruction>
	.word 0x819fa000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d962000  ! 565: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x819ce000  ! 566: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb3504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x8d966000  ! 568: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbb500000  ! 569: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 570: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xab508000  ! 571: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 572: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 573: RDPR_TT	<illegal instruction>
	.word 0x87972000  ! 574: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x85952000  ! 575: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8397a000  ! 576: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8596e000  ! 577: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839da000  ! 578: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa5500000  ! 579: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0xa5504000  ! 581: RDPR_TNPC	<illegal instruction>
	.word 0x8194e000  ! 582: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x85956000  ! 583: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbda5c8c0  ! 584: FSUBd	fsubd	%f54, %f0, %f30
	.word 0x87952000  ! 585: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839ce000  ! 586: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa5508000  ! 587: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 588: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x87952000  ! 589: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x87972000  ! 590: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8597e000  ! 591: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa150c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 593: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x839ee000  ! 594: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xada58940  ! 595: FMULd	fmuld	%f22, %f0, %f22
	.word 0x839e6000  ! 596: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa1508000  ! 597: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 598: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb150c000  ! 599: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 600: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa1500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x839ce000  ! 602: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8596a000  ! 603: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x81972000  ! 604: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa750c000  ! 605: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 606: RDPR_TNPC	<illegal instruction>
	.word 0xa1a54960  ! 607: FMULq	dis not found

	.word 0xb9508000  ! 608: RDPR_TSTATE	<illegal instruction>
	.word 0xafa44820  ! 609: FADDs	fadds	%f17, %f0, %f23
	.word 0xb1504000  ! 610: RDPR_TNPC	<illegal instruction>
	.word 0xa1508000  ! 611: RDPR_TSTATE	<illegal instruction>
	.word 0x819f2000  ! 612: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa3a5c940  ! 613: FMULd	fmuld	%f54, %f0, %f48
	.word 0x819ea000  ! 614: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8395a000  ! 615: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb7504000  ! 616: RDPR_TNPC	<illegal instruction>
	.word 0x8195a000  ! 617: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x85962000  ! 618: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8596e000  ! 619: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xbd508000  ! 620: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 621: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbda609a0  ! 622: FDIVs	fdivs	%f24, %f0, %f30
	.word 0x87952000  ! 623: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa9a48840  ! 624: FADDd	faddd	%f18, %f0, %f20
	.word 0xb3a78940  ! 625: FMULd	fmuld	%f30, %f0, %f56
	.word 0x8d97e000  ! 626: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xada5c9a0  ! 627: FDIVs	fdivs	%f23, %f0, %f22
	.word 0x8194a000  ! 628: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa7500000  ! 629: RDPR_TPC	<illegal instruction>
	.word 0xbf500000  ! 630: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 632: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x87972000  ! 633: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x87956000  ! 634: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa5a00560  ! 635: FSQRTq	fsqrt	
	.word 0x8d96a000  ! 636: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa9508000  ! 637: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a7c960  ! 638: FMULq	dis not found

	.word 0xb9508000  ! 639: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a40820  ! 640: FADDs	fadds	%f16, %f0, %f28
	.word 0x83956000  ! 641: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839d2000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8596e000  ! 643: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8d95a000  ! 644: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb5504000  ! 645: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 646: RDPR_TNPC	<illegal instruction>
	.word 0x83956000  ! 647: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbb500000  ! 648: RDPR_TPC	<illegal instruction>
	.word 0x839e6000  ! 649: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb5a449a0  ! 650: FDIVs	fdivs	%f17, %f0, %f26
	.word 0x8195a000  ! 651: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x85946000  ! 652: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbd504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 654: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 655: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x819c6000  ! 656: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbd504000  ! 657: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 658: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xad508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 660: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 661: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d946000  ! 662: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819f6000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x81976000  ! 664: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8d94a000  ! 665: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x83966000  ! 666: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8197e000  ! 667: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87976000  ! 668: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xab50c000  ! 669: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 670: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x839fe000  ! 672: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x839e2000  ! 673: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb5504000  ! 674: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 675: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa1a489a0  ! 676: FDIVs	fdivs	%f18, %f0, %f16
	.word 0x819ca000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb9504000  ! 678: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 679: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839ce000  ! 680: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbb504000  ! 681: RDPR_TNPC	<illegal instruction>
	.word 0xa3a50940  ! 682: FMULd	fmuld	%f20, %f0, %f48
	.word 0x83972000  ! 683: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x85976000  ! 684: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d962000  ! 685: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x85976000  ! 686: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d952000  ! 687: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x87942000  ! 688: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839fe000  ! 689: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819f2000  ! 690: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d972000  ! 691: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819e6000  ! 692: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d95e000  ! 693: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8197a000  ! 694: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbba549e0  ! 695: FDIVq	dis not found

	.word 0x85946000  ! 696: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8396e000  ! 697: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8194e000  ! 698: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x839f6000  ! 699: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8796e000  ! 700: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa1a00520  ! 701: FSQRTs	fsqrt	
	.word 0x83952000  ! 702: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8397a000  ! 703: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xafa4c8c0  ! 704: FSUBd	fsubd	%f50, %f0, %f54
	.word 0xb5a4c840  ! 705: FADDd	faddd	%f50, %f0, %f26
	.word 0xab508000  ! 706: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 707: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 708: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0x819da000  ! 710: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819c6000  ! 711: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb1a00520  ! 712: FSQRTs	fsqrt	
	.word 0xa1504000  ! 713: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 714: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 716: RDPR_TNPC	<illegal instruction>
	.word 0xa9a00540  ! 717: FSQRTd	fsqrt	
	.word 0x8797a000  ! 718: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbf504000  ! 719: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 722: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb550c000  ! 723: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 724: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x819ea000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa5a68920  ! 726: FMULs	fmuls	%f26, %f0, %f18
	.word 0xbf50c000  ! 727: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 728: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb7a7c9e0  ! 729: FDIVq	dis not found

	.word 0xbba00540  ! 730: FSQRTd	fsqrt	
	.word 0x8797a000  ! 731: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa7a68820  ! 732: FADDs	fadds	%f26, %f0, %f19
	.word 0xa7a00540  ! 733: FSQRTd	fsqrt	
	.word 0xa5500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xa1a40840  ! 735: FADDd	faddd	%f16, %f0, %f16
	.word 0x85942000  ! 736: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819ea000  ! 737: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbf508000  ! 738: RDPR_TSTATE	<illegal instruction>
	.word 0xafa68820  ! 739: FADDs	fadds	%f26, %f0, %f23
	.word 0x839ca000  ! 740: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x839da000  ! 741: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa950c000  ! 742: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 743: RDPR_TPC	<illegal instruction>
	.word 0xb7a00540  ! 744: FSQRTd	fsqrt	
	.word 0xab508000  ! 745: RDPR_TSTATE	<illegal instruction>
	.word 0x819f2000  ! 746: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xaf500000  ! 747: RDPR_TPC	<illegal instruction>
	.word 0x819f6000  ! 748: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x81942000  ! 749: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa7a00520  ! 750: FSQRTs	fsqrt	
	.word 0xb1504000  ! 751: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00520  ! 752: FSQRTs	fsqrt	
	.word 0xb9504000  ! 753: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 754: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 755: RDPR_TT	<illegal instruction>
	.word 0x819da000  ! 756: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x85942000  ! 757: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8595e000  ! 758: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa1508000  ! 759: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a68940  ! 760: FMULd	fmuld	%f26, %f0, %f58
	.word 0xa1504000  ! 761: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00540  ! 762: FSQRTd	fsqrt	
	.word 0xa750c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x839c2000  ! 764: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x839de000  ! 765: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8d966000  ! 766: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819d6000  ! 767: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb7508000  ! 768: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00520  ! 769: FSQRTs	fsqrt	
	.word 0x81946000  ! 770: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819de000  ! 771: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaba788c0  ! 772: FSUBd	fsubd	%f30, %f0, %f52
	.word 0x83952000  ! 773: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb3500000  ! 774: RDPR_TPC	<illegal instruction>
	.word 0x8d976000  ! 775: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x839ce000  ! 776: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x85946000  ! 777: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87956000  ! 778: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa7500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 780: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819ce000  ! 781: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xad500000  ! 782: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 783: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 784: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa3a58840  ! 785: FADDd	faddd	%f22, %f0, %f48
	.word 0x81946000  ! 786: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb3508000  ! 787: RDPR_TSTATE	<illegal instruction>
	.word 0x819d2000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x87972000  ! 789: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8596a000  ! 790: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xab500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 792: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8d94e000  ! 793: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d976000  ! 794: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8394a000  ! 795: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87962000  ! 796: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8595e000  ! 797: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbba709e0  ! 798: FDIVq	dis not found

	.word 0xa7a6c920  ! 799: FMULs	fmuls	%f27, %f0, %f19
	.word 0xa9508000  ! 800: RDPR_TSTATE	<illegal instruction>
	.word 0x8197e000  ! 801: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xaba548a0  ! 802: FSUBs	fsubs	%f21, %f0, %f21
	.word 0xbd504000  ! 803: RDPR_TNPC	<illegal instruction>
	.word 0x839f2000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbfa44840  ! 805: FADDd	faddd	%f48, %f0, %f62
	.word 0x839ee000  ! 806: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb9500000  ! 807: RDPR_TPC	<illegal instruction>
	.word 0xb1a44840  ! 808: FADDd	faddd	%f48, %f0, %f24
	.word 0xbfa788c0  ! 809: FSUBd	fsubd	%f30, %f0, %f62
	.word 0x8d95e000  ! 810: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb5a00560  ! 811: FSQRTq	fsqrt	
	.word 0xa7a54920  ! 812: FMULs	fmuls	%f21, %f0, %f19
	.word 0x8594e000  ! 813: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87942000  ! 814: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb150c000  ! 815: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 816: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a6c9e0  ! 817: FDIVq	dis not found

	.word 0xb7504000  ! 818: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 820: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 821: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xaf50c000  ! 822: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 825: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x81946000  ! 826: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xada7c940  ! 827: FMULd	fmuld	%f62, %f0, %f22
	.word 0x85946000  ! 828: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa3500000  ! 829: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 830: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa5a68860  ! 831: FADDq	dis not found

	.word 0x839c6000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbb504000  ! 833: RDPR_TNPC	<illegal instruction>
	.word 0xbda70920  ! 834: FMULs	fmuls	%f28, %f0, %f30
	.word 0x85962000  ! 835: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x87952000  ! 836: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa1504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 838: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb5a449c0  ! 839: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb3a708a0  ! 840: FSUBs	fsubs	%f28, %f0, %f25
	.word 0xb5508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 842: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8d96e000  ! 843: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb1a68860  ! 844: FADDq	dis not found

	.word 0x8d972000  ! 845: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb750c000  ! 846: RDPR_TT	<illegal instruction>
	.word 0x8197a000  ! 847: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839fa000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb350c000  ! 849: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 850: RDPR_TNPC	<illegal instruction>
	.word 0x8396e000  ! 851: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8595a000  ! 852: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8395a000  ! 853: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8d942000  ! 854: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb5504000  ! 855: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00560  ! 856: FSQRTq	fsqrt	
	.word 0xbda4c860  ! 857: FADDq	dis not found

	.word 0xa5a789a0  ! 858: FDIVs	fdivs	%f30, %f0, %f18
	.word 0xa3504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 860: RDPR_TNPC	<illegal instruction>
	.word 0xa9a489c0  ! 861: FDIVd	fdivd	%f18, %f0, %f20
	.word 0x819de000  ! 862: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8595a000  ! 863: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xaf504000  ! 864: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 865: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8d94e000  ! 866: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbb50c000  ! 867: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 868: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819ee000  ! 869: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xad504000  ! 870: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 871: RDPR_TPC	<illegal instruction>
	.word 0x8195e000  ! 872: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x87972000  ! 873: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xad508000  ! 874: RDPR_TSTATE	<illegal instruction>
	.word 0x839fa000  ! 875: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819d6000  ! 876: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x85956000  ! 877: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xad50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 879: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839c2000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb1504000  ! 881: RDPR_TNPC	<illegal instruction>
	.word 0x819ce000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbf500000  ! 883: RDPR_TPC	<illegal instruction>
	.word 0x819ee000  ! 884: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb3500000  ! 885: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 886: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 887: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xb9a74940  ! 889: FMULd	fmuld	%f60, %f0, %f28
	.word 0xa9a00560  ! 890: FSQRTq	fsqrt	
	.word 0x8d97e000  ! 891: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819d6000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8397e000  ! 893: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8d96a000  ! 894: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb7a508e0  ! 895: FSUBq	dis not found

	.word 0x8197a000  ! 896: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8594e000  ! 897: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa3508000  ! 898: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 899: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8394e000  ! 900: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x85962000  ! 901: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbf500000  ! 902: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 903: RDPR_TT	<illegal instruction>
	.word 0xa5504000  ! 904: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 905: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xaf508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 907: RDPR_TPC	<illegal instruction>
	.word 0xa1a40940  ! 908: FMULd	fmuld	%f16, %f0, %f16
	.word 0xa350c000  ! 909: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 910: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xab50c000  ! 911: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 912: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb3a70960  ! 913: FMULq	dis not found

	.word 0x83976000  ! 914: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa3508000  ! 915: RDPR_TSTATE	<illegal instruction>
	.word 0x819ca000  ! 916: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x839e6000  ! 917: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8d966000  ! 918: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xab50c000  ! 919: RDPR_TT	<illegal instruction>
	.word 0xa7504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 921: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d94e000  ! 922: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81966000  ! 923: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb9504000  ! 924: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 925: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x87956000  ! 926: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbda609e0  ! 927: FDIVq	dis not found

	.word 0xad500000  ! 928: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0xbfa70960  ! 930: FMULq	dis not found

	.word 0xa1508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a78820  ! 932: FADDs	fadds	%f30, %f0, %f17
	.word 0xa750c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 934: RDPR_TPC	<illegal instruction>
	.word 0xa5504000  ! 935: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 936: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa1a64940  ! 937: FMULd	fmuld	%f56, %f0, %f16
	.word 0xb350c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 939: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa1508000  ! 940: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 941: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x87972000  ! 942: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819e2000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb3a7c9a0  ! 944: FDIVs	fdivs	%f31, %f0, %f25
	.word 0xb3a58920  ! 945: FMULs	fmuls	%f22, %f0, %f25
	.word 0xb350c000  ! 946: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 947: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x839ea000  ! 948: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x8594a000  ! 949: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbda4c840  ! 950: FADDd	faddd	%f50, %f0, %f30
	.word 0xa7a60840  ! 951: FADDd	faddd	%f24, %f0, %f50
	.word 0x8d97e000  ! 952: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819ca000  ! 953: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d95e000  ! 954: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb5508000  ! 955: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 956: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839c6000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xafa6c8e0  ! 958: FSUBq	dis not found

	.word 0xbf500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0x85952000  ! 960: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb1508000  ! 961: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a7c8a0  ! 962: FSUBs	fsubs	%f31, %f0, %f24
	.word 0xa9508000  ! 963: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 964: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa3504000  ! 965: RDPR_TNPC	<illegal instruction>
	.word 0x8797a000  ! 966: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x85946000  ! 967: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x839f2000  ! 968: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x87942000  ! 969: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbb500000  ! 970: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 971: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8d95e000  ! 972: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xada40840  ! 973: FADDd	faddd	%f16, %f0, %f22
	.word 0xb3504000  ! 974: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 976: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x81976000  ! 977: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa7508000  ! 978: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 979: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa9a709c0  ! 980: FDIVd	fdivd	%f28, %f0, %f20
	.word 0xa9a60840  ! 981: FADDd	faddd	%f24, %f0, %f20
	.word 0xb7a64860  ! 982: FADDq	dis not found

	.word 0xaf504000  ! 983: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 984: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 985: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8397a000  ! 986: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb9a488a0  ! 987: FSUBs	fsubs	%f18, %f0, %f28
	.word 0x819d6000  ! 988: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8594a000  ! 989: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839fa000  ! 990: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x83962000  ! 991: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839ce000  ! 992: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb5500000  ! 993: RDPR_TPC	<illegal instruction>
	.word 0xa1a748a0  ! 994: FSUBs	fsubs	%f29, %f0, %f16
	.word 0x819c2000  ! 995: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x819e6000  ! 996: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x83942000  ! 997: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839ca000  ! 998: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0xa1d92bf200005c38
	.xword	0xd9a977e300008caa
	.xword	0x54dd1fd30000ef18
	.xword	0x5cea578f00005d12
	.xword	0xa6064d9f00002f6d
	.xword	0x709b0a6f0000d907
	.xword	0xe817712300000ce9
	.xword	0x4b54acac0000cf8c
	.xword	0xec7c2c2100002fa8
	.xword	0x0c638c2a00005e08
	.xword	0xce201a1000009ecf
	.xword	0xfe45661200008939
	.xword	0x2180daef00004dd3
	.xword	0x490ce5070000d8c5
	.xword	0x5543ec8b00001e39
	.xword	0x504ace5900003d8b
	.xword	0x8ed7a99a0000c97d
	.xword	0xa72f30b400002bbf
	.xword	0xef5ab3f30000cab8
	.xword	0x523c1e2c00004e91
	.xword	0xba2f19690000b8f9
	.xword	0x01fd656e0000eace
	.xword	0x727c554e0000d86f
	.xword	0xe572eaa9000078ec
	.xword	0x0b49458d00004e58
	.xword	0x92d6d8380000aa97
	.xword	0x94070fc20000d838
	.xword	0x98b311b800009f60
	.xword	0xda1e19aa00005e81
	.xword	0x8c631e3200005bc4
	.xword	0x33efc3390000ac8c
	.xword	0xd5a2b2c00000fb71
	.xword	0x748dac8900009d6c
	.xword	0x9ee19d5d0000bc9a
	.xword	0x5d1a4bd300002dc0
	.xword	0x0aff86c500005d0e
	.xword	0x81fd388e0000ffd3
	.xword	0xa280ac1a00007f39
	.xword	0x6b925efb000099c0
	.xword	0x825b018a0000a8bf
	.xword	0x33a0c8e900007e75
	.xword	0xd116578f0000d9a0
	.xword	0x48da62a4000008cd
	.xword	0x632c380300003945
	.xword	0x574bb8570000a980
	.xword	0xbd06f9ce00009ba4
	.xword	0xa32b33d800001a83
	.xword	0x80f3df6900008b49
	.xword	0x3197fefd00008b10
	.xword	0xd9092e960000eb7d
	.xword	0x7067cc3100001867
	.xword	0xf869e6b100000bc9
	.xword	0xd1931e9f0000589e
	.xword	0xa77db4f300007eb8
	.xword	0xd295b90100009ddc
	.xword	0x6dff398c000059c9
	.xword	0x4dd221a400001af5
	.xword	0xe5ef630b0000985b
	.xword	0x8508a1d400009ea8
	.xword	0x24f1fc8d00009e36
	.xword	0x331f54370000eb7c
	.xword	0x4adf7a4d0000f8e1
	.xword	0xadacad6d00007c4c
	.xword	0x61d7f6e700008a3e
	.xword	0x8a456b7f00001a37
	.xword	0x3769e9870000adda
	.xword	0x6980ef9500007900
	.xword	0x2f43b85900003831
	.xword	0x1e8e02c10000f952
	.xword	0x42eae5ea0000f97b
	.xword	0x2eeb9353000059d8
	.xword	0x103ebca800003cfe
	.xword	0xa1f2b90b00005af0
	.xword	0xf9486de200003f96
	.xword	0x528b6b480000afbb
	.xword	0x5b9cd8c10000cba9
	.xword	0xc385fa7a0000bfae
	.xword	0xb517c35d0000f9e8
	.xword	0x421d49ed00003d1a
	.xword	0xf3b7ba9c00004e2f
	.xword	0x2cfc82040000199d
	.xword	0xe518ffec00001853
	.xword	0x1373c0f10000ab49
	.xword	0x20da8ce800004e6a
	.xword	0xd516ea4d00002bcc
	.xword	0xa373326100003fe1
	.xword	0xa076137600008946
	.xword	0xb2752a1400001ff1
	.xword	0xbe673abf0000eec0
	.xword	0xe12fdea500008c0d
	.xword	0x79a0f27b00008d64
	.xword	0xb98b19da0000ac5a
	.xword	0x28da79be0000fc4b
	.xword	0xebf58e5600000fbd
	.xword	0x9287633000001c04
	.xword	0x6fc755850000eb38
	.xword	0x7f80cd6700000f3b
	.xword	0xb4216f8100002d1c
	.xword	0x0254fc1e0000ebbb
	.xword	0x67db2de700003c41
	.xword	0x887f0e0e0000fc75
	.xword	0x69bbbe550000ce5a
	.xword	0x4c97de390000386a
	.xword	0xf3f99fe600007cc4
	.xword	0x0b03534b00002e2b
	.xword	0xdade7cb30000bfa9
	.xword	0xbe6b997f00007f7d
	.xword	0x3f46fc430000e9c0
	.xword	0x0252c3300000df6b
	.xword	0x5441383c0000584c
	.xword	0x27fce7ba0000084f
	.xword	0x81f47d6200001d2a
	.xword	0x369ac1a20000dd6f
	.xword	0xcbec378a00006965
	.xword	0xd40383f600002cf9
	.xword	0x09b7fa1700005d59
	.xword	0x449003ed0000dfa3
	.xword	0x1677a34300001fea
	.xword	0x0b2a4a6a0000dc31
	.xword	0x35b5c75e00006e6b
	.xword	0x2391e6f300007a09
	.xword	0xaf0fa1f60000ed2e
	.xword	0x93d84c9a00001d3b
	.xword	0x88d1566d0000cc67
	.xword	0x9858e8cf00008881
	.xword	0xa1ca26bb00003aa1
	.xword	0x5338ea6e0000bf4f
	.xword	0x0b2faa5600000a72



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
