// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_tsasr_31_rand_s4.s
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
   random seed:	168792724
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

	setx 0x9f1a2dfa00002e7a, %g1, %g0
	setx 0xfbad04ba00009d46, %g1, %g1
	setx 0x316ce30000003beb, %g1, %g2
	setx 0xed02af6d0000cef7, %g1, %g3
	setx 0x25a0532c00003823, %g1, %g4
	setx 0x51f205e0000079e5, %g1, %g5
	setx 0xde6ada060000fc9e, %g1, %g6
	setx 0x7d4cd92200002ed5, %g1, %g7
	setx 0x35b591f90000f8f5, %g1, %r16
	setx 0xd700fa160000fab5, %g1, %r17
	setx 0x72997e45000039a0, %g1, %r18
	setx 0x876cd81d00001aed, %g1, %r19
	setx 0xa76835d300009822, %g1, %r20
	setx 0xc60644480000ddfd, %g1, %r21
	setx 0xab1a4de800008cc1, %g1, %r22
	setx 0x405f3cdc00000d67, %g1, %r23
	setx 0x0c25f68b0000bf23, %g1, %r24
	setx 0x32589d3d00001c8d, %g1, %r25
	setx 0xa5906f430000bae1, %g1, %r26
	setx 0x68607d2d00007b01, %g1, %r27
	setx 0xae3f0bda00000fa8, %g1, %r28
	setx 0x5cd5f24b0000aff6, %g1, %r29
	setx 0x4e086a3a00001e7c, %g1, %r30
	setx 0xfe027acf0000cb39, %g1, %r31
	save
	setx 0x04493a150000c934, %g1, %r16
	setx 0xc7158d35000039dc, %g1, %r17
	setx 0xa8d716340000ef54, %g1, %r18
	setx 0xbda9c7f00000efd2, %g1, %r19
	setx 0x34ae2c9e00000f41, %g1, %r20
	setx 0x2ce5831a0000ecac, %g1, %r21
	setx 0xee119b770000f9a3, %g1, %r22
	setx 0x61f046ce00004fcf, %g1, %r23
	setx 0x596448bc00006bc3, %g1, %r24
	setx 0x60271eb40000af65, %g1, %r25
	setx 0xc30e714a0000ce5a, %g1, %r26
	setx 0x73adced100005d78, %g1, %r27
	setx 0x5e511b1e00005fc6, %g1, %r28
	setx 0xb16eb7ea00000c06, %g1, %r29
	setx 0xe312869f00007ce5, %g1, %r30
	setx 0x87e44b1500001d6c, %g1, %r31
	save
	setx 0xc93343dc0000da9a, %g1, %r16
	setx 0x9168cdef00007b1a, %g1, %r17
	setx 0x93958a210000dad1, %g1, %r18
	setx 0x03c79c2300005bb3, %g1, %r19
	setx 0x474065c400002e3a, %g1, %r20
	setx 0x10a7b6140000a9f1, %g1, %r21
	setx 0x1f645caa0000bad9, %g1, %r22
	setx 0x7f96a6a40000ee2b, %g1, %r23
	setx 0xf988757d0000da12, %g1, %r24
	setx 0xea3650d60000fd8c, %g1, %r25
	setx 0x40ced38100005aba, %g1, %r26
	setx 0x551fa91e00001d30, %g1, %r27
	setx 0xe5858b2d00004adb, %g1, %r28
	setx 0xb4ef4cc400004e7c, %g1, %r29
	setx 0x7d2a0b7600005944, %g1, %r30
	setx 0x02c0002700005848, %g1, %r31
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
	.word 0xbf504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 2: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 4: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa5504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 6: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8795a000  ! 7: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x83946000  ! 8: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839e6000  ! 9: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb5508000  ! 10: RDPR_TSTATE	<illegal instruction>
	.word 0x8d976000  ! 11: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa350c000  ! 12: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 14: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x81952000  ! 15: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xada40960  ! 16: FMULq	dis not found

	.word 0xbda489e0  ! 17: FDIVq	dis not found

	.word 0x8394a000  ! 18: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87946000  ! 19: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbf504000  ! 20: RDPR_TNPC	<illegal instruction>
	.word 0xa7a549e0  ! 21: FDIVq	dis not found

	.word 0xad504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xa1a5c860  ! 23: FADDq	dis not found

	.word 0x839ee000  ! 24: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xaf500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xad504000  ! 26: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 27: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8394e000  ! 28: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819c2000  ! 29: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8396a000  ! 30: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xaf500000  ! 31: RDPR_TPC	<illegal instruction>
	.word 0xa3a608a0  ! 32: FSUBs	fsubs	%f24, %f0, %f17
	.word 0x8797e000  ! 33: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85946000  ! 34: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa9a448e0  ! 35: FSUBq	dis not found

	.word 0x8796a000  ! 36: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819ca000  ! 37: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x81976000  ! 38: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8195a000  ! 39: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8d97e000  ! 40: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa7a78920  ! 41: FMULs	fmuls	%f30, %f0, %f19
	.word 0x839e2000  ! 42: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839ce000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa9a748e0  ! 44: FSUBq	dis not found

	.word 0x8595e000  ! 45: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbb504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 47: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xaf50c000  ! 48: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 49: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8396a000  ! 50: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839c2000  ! 51: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x81942000  ! 52: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa550c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 54: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x87972000  ! 55: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbf508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 57: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa9504000  ! 58: RDPR_TNPC	<illegal instruction>
	.word 0xb3a6c9c0  ! 59: FDIVd	fdivd	%f58, %f0, %f56
	.word 0xb550c000  ! 60: RDPR_TT	<illegal instruction>
	.word 0x87956000  ! 61: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa5500000  ! 62: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 63: RDPR_TPC	<illegal instruction>
	.word 0x8597e000  ! 64: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8397e000  ! 65: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8196e000  ! 66: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa350c000  ! 67: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 69: RDPR_TT	<illegal instruction>
	.word 0x8195a000  ! 70: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x819fa000  ! 71: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb3500000  ! 72: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 73: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x839c6000  ! 74: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x87972000  ! 75: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbfa60960  ! 76: FMULq	dis not found

	.word 0xa9504000  ! 77: RDPR_TNPC	<illegal instruction>
	.word 0xaba74840  ! 78: FADDd	faddd	%f60, %f0, %f52
	.word 0xa9508000  ! 79: RDPR_TSTATE	<illegal instruction>
	.word 0xab504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0xaba58820  ! 82: FADDs	fadds	%f22, %f0, %f21
	.word 0x85942000  ! 83: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa5a64960  ! 84: FMULq	dis not found

	.word 0x839ca000  ! 85: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819ca000  ! 86: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0xb1a48920  ! 88: FMULs	fmuls	%f18, %f0, %f24
	.word 0x839e6000  ! 89: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8395e000  ! 90: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x83966000  ! 91: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x87956000  ! 92: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb5508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0xad508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 95: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb1504000  ! 96: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbd508000  ! 98: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0xab504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xab508000  ! 101: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 102: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa3508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 104: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x85966000  ! 105: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839da000  ! 106: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819f2000  ! 107: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d96a000  ! 108: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x81962000  ! 109: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x87962000  ! 110: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa9a7c920  ! 111: FMULs	fmuls	%f31, %f0, %f20
	.word 0xa3a488c0  ! 112: FSUBd	fsubd	%f18, %f0, %f48
	.word 0x819ee000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x839d2000  ! 114: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8395a000  ! 115: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbda749c0  ! 116: FDIVd	fdivd	%f60, %f0, %f30
	.word 0xb7a4c820  ! 117: FADDs	fadds	%f19, %f0, %f27
	.word 0xb3500000  ! 118: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 120: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8595a000  ! 121: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d962000  ! 122: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa3a70920  ! 123: FMULs	fmuls	%f28, %f0, %f17
	.word 0x819c2000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xbd50c000  ! 125: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 126: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x85952000  ! 127: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x85962000  ! 128: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb9500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0xb7a7c8e0  ! 130: FSUBq	dis not found

	.word 0x8394e000  ! 131: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839e2000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xaf50c000  ! 133: RDPR_TT	<illegal instruction>
	.word 0xaf500000  ! 134: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 135: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb5504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0x839ea000  ! 137: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb950c000  ! 138: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 140: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb3504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xbfa64840  ! 142: FADDd	faddd	%f56, %f0, %f62
	.word 0x87942000  ! 143: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839f6000  ! 144: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xab500000  ! 145: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 146: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839d6000  ! 147: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x87976000  ! 148: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbb500000  ! 149: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 150: FSQRTs	fsqrt	
	.word 0x819ea000  ! 151: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbd50c000  ! 152: RDPR_TT	<illegal instruction>
	.word 0x819d6000  ! 153: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81942000  ! 154: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8796e000  ! 155: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xada40840  ! 156: FADDd	faddd	%f16, %f0, %f22
	.word 0xa9504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0x8194e000  ! 159: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa7508000  ! 160: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 161: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d97a000  ! 162: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa5a44860  ! 163: FADDq	dis not found

	.word 0xbb508000  ! 164: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 165: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xada609e0  ! 166: FDIVq	dis not found

	.word 0xb350c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xa5a688c0  ! 168: FSUBd	fsubd	%f26, %f0, %f18
	.word 0x819d6000  ! 169: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8596e000  ! 170: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa1a00540  ! 171: FSQRTd	fsqrt	
	.word 0x8195a000  ! 172: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8794e000  ! 173: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d96a000  ! 174: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8394a000  ! 175: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8596e000  ! 176: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb150c000  ! 177: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 178: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb7504000  ! 179: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 180: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb9a00560  ! 181: FSQRTq	fsqrt	
	.word 0xad500000  ! 182: RDPR_TPC	<illegal instruction>
	.word 0xa1a50840  ! 183: FADDd	faddd	%f20, %f0, %f16
	.word 0xb3a5c860  ! 184: FADDq	dis not found

	.word 0x8194a000  ! 185: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb5504000  ! 186: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 187: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 188: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 189: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8395e000  ! 190: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x83962000  ! 191: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb7504000  ! 192: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 193: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8597a000  ! 194: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa7a489c0  ! 195: FDIVd	fdivd	%f18, %f0, %f50
	.word 0x87976000  ! 196: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8395a000  ! 197: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819ea000  ! 198: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8794a000  ! 199: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8d946000  ! 200: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8195a000  ! 201: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x819da000  ! 202: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8197a000  ! 203: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x819e6000  ! 204: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa3a4c8c0  ! 205: FSUBd	fsubd	%f50, %f0, %f48
	.word 0x8596a000  ! 206: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x819ee000  ! 207: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x81972000  ! 208: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x839ca000  ! 209: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x85972000  ! 210: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8397a000  ! 211: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbba6c9c0  ! 212: FDIVd	fdivd	%f58, %f0, %f60
	.word 0x8197a000  ! 213: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8d952000  ! 214: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x81946000  ! 215: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa1508000  ! 216: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 217: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8197a000  ! 218: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839fe000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x81942000  ! 220: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x87956000  ! 221: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x819e6000  ! 222: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa3504000  ! 223: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 224: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 225: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa3504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0x85966000  ! 228: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8397a000  ! 229: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819ca000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x83952000  ! 231: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x81966000  ! 232: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa7500000  ! 233: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 234: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819de000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa5508000  ! 236: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 237: RDPR_TSTATE	<illegal instruction>
	.word 0x839c2000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xbba6c820  ! 239: FADDs	fadds	%f27, %f0, %f29
	.word 0x85952000  ! 240: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa9504000  ! 241: RDPR_TNPC	<illegal instruction>
	.word 0xb3a708c0  ! 242: FSUBd	fsubd	%f28, %f0, %f56
	.word 0x8195e000  ! 243: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x83956000  ! 244: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9a74920  ! 245: FMULs	fmuls	%f29, %f0, %f20
	.word 0xbba00540  ! 246: FSQRTd	fsqrt	
	.word 0xa3500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0x839c6000  ! 248: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839fa000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8797e000  ! 250: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x81962000  ! 251: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb3508000  ! 252: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a7c920  ! 253: FMULs	fmuls	%f31, %f0, %f16
	.word 0x8397e000  ! 254: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819ca000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa5504000  ! 256: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a00560  ! 258: FSQRTq	fsqrt	
	.word 0xb7504000  ! 259: RDPR_TNPC	<illegal instruction>
	.word 0xa9a448c0  ! 260: FSUBd	fsubd	%f48, %f0, %f20
	.word 0xa550c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0x8d942000  ! 262: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x81946000  ! 263: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa1508000  ! 264: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 265: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x819fe000  ! 266: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839e2000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb950c000  ! 268: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 269: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xad504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 271: RDPR_TPC	<illegal instruction>
	.word 0xa1504000  ! 272: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 273: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xad50c000  ! 274: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 275: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 276: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x81966000  ! 277: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7a708e0  ! 278: FSUBq	dis not found

	.word 0xa7508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 281: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8396a000  ! 282: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8d956000  ! 283: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbf504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 285: RDPR_TPC	<illegal instruction>
	.word 0x839c2000  ! 286: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x839ea000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xaf508000  ! 288: RDPR_TSTATE	<illegal instruction>
	.word 0x8795e000  ! 289: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb3508000  ! 290: RDPR_TSTATE	<illegal instruction>
	.word 0x839d6000  ! 291: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa3a00520  ! 292: FSQRTs	fsqrt	
	.word 0xa5a00520  ! 293: FSQRTs	fsqrt	
	.word 0xb9504000  ! 294: RDPR_TNPC	<illegal instruction>
	.word 0xb9a6c860  ! 295: FADDq	dis not found

	.word 0x819fa000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8595a000  ! 297: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8794e000  ! 298: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb1a489a0  ! 299: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb350c000  ! 300: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 301: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d97a000  ! 302: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8596e000  ! 303: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb9500000  ! 304: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 305: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 306: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x839c6000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xab508000  ! 308: RDPR_TSTATE	<illegal instruction>
	.word 0x85956000  ! 309: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x839f2000  ! 310: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819c6000  ! 311: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa950c000  ! 312: RDPR_TT	<illegal instruction>
	.word 0x87972000  ! 313: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb7500000  ! 314: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x85946000  ! 316: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xaf508000  ! 317: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 318: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819ee000  ! 319: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb9a64940  ! 320: FMULd	fmuld	%f56, %f0, %f28
	.word 0x81956000  ! 321: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb5a00560  ! 322: FSQRTq	fsqrt	
	.word 0xad508000  ! 323: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 324: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 325: RDPR_TNPC	<illegal instruction>
	.word 0xa9a6c8e0  ! 326: FSUBq	dis not found

	.word 0x839c2000  ! 327: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8397a000  ! 328: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa1a78820  ! 329: FADDs	fadds	%f30, %f0, %f16
	.word 0xa9500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 331: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb150c000  ! 332: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0x839ea000  ! 334: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x8796a000  ! 335: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb7a64940  ! 336: FMULd	fmuld	%f56, %f0, %f58
	.word 0x81962000  ! 337: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa9a788c0  ! 338: FSUBd	fsubd	%f30, %f0, %f20
	.word 0xb1a4c8e0  ! 339: FSUBq	dis not found

	.word 0xb7504000  ! 340: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xb7a6c960  ! 342: FMULq	dis not found

	.word 0x8594a000  ! 343: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x819f2000  ! 344: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x87942000  ! 345: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb3504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xb9a749a0  ! 347: FDIVs	fdivs	%f29, %f0, %f28
	.word 0x85962000  ! 348: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x839e2000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xbf500000  ! 350: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 351: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xaba74820  ! 352: FADDs	fadds	%f29, %f0, %f21
	.word 0x87962000  ! 353: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb750c000  ! 354: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 355: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d96a000  ! 356: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8795a000  ! 357: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb1504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0xafa5c9c0  ! 359: FDIVd	fdivd	%f54, %f0, %f54
	.word 0x8395a000  ! 360: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbda489a0  ! 361: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xbba00540  ! 362: FSQRTd	fsqrt	
	.word 0x8795a000  ! 363: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb9a00540  ! 364: FSQRTd	fsqrt	
	.word 0x8d972000  ! 365: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb3a00520  ! 366: FSQRTs	fsqrt	
	.word 0xb150c000  ! 367: RDPR_TT	<illegal instruction>
	.word 0xada58940  ! 368: FMULd	fmuld	%f22, %f0, %f22
	.word 0xbb500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 371: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa3a6c8c0  ! 372: FSUBd	fsubd	%f58, %f0, %f48
	.word 0x819d2000  ! 373: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbd500000  ! 374: RDPR_TPC	<illegal instruction>
	.word 0xbfa40840  ! 375: FADDd	faddd	%f16, %f0, %f62
	.word 0xa7a58920  ! 376: FMULs	fmuls	%f22, %f0, %f19
	.word 0x819ce000  ! 377: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x83956000  ! 378: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0x85952000  ! 380: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa5a60940  ! 381: FMULd	fmuld	%f24, %f0, %f18
	.word 0x819ce000  ! 382: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8594a000  ! 383: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa150c000  ! 384: RDPR_TT	<illegal instruction>
	.word 0xbfa408a0  ! 385: FSUBs	fsubs	%f16, %f0, %f31
	.word 0x85966000  ! 386: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbfa50940  ! 387: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xa5a60960  ! 389: FMULq	dis not found

	.word 0xad504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 391: RDPR_TPC	<illegal instruction>
	.word 0xbda78940  ! 392: FMULd	fmuld	%f30, %f0, %f30
	.word 0x819f2000  ! 393: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb9500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 395: RDPR_TNPC	<illegal instruction>
	.word 0xa1a48920  ! 396: FMULs	fmuls	%f18, %f0, %f16
	.word 0xa3a408c0  ! 397: FSUBd	fsubd	%f16, %f0, %f48
	.word 0xbf50c000  ! 398: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 400: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 401: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x87972000  ! 403: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa9508000  ! 404: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839ca000  ! 407: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819ee000  ! 408: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb3504000  ! 409: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 410: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xaba4c960  ! 412: FMULq	dis not found

	.word 0xa5508000  ! 413: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 414: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 415: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa3504000  ! 416: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 418: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 422: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x81966000  ! 423: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbd50c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xa1a54820  ! 425: FADDs	fadds	%f21, %f0, %f16
	.word 0xa3500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 427: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8796e000  ! 428: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb7a689e0  ! 429: FDIVq	dis not found

	.word 0xbf50c000  ! 430: RDPR_TT	<illegal instruction>
	.word 0xbf50c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 432: RDPR_TT	<illegal instruction>
	.word 0x839e2000  ! 433: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819d2000  ! 434: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8794a000  ! 435: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x819ca000  ! 436: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbb504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 438: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x87972000  ! 439: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x87956000  ! 440: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d962000  ! 441: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa1500000  ! 442: RDPR_TPC	<illegal instruction>
	.word 0xbfa58820  ! 443: FADDs	fadds	%f22, %f0, %f31
	.word 0x8d95e000  ! 444: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xafa00540  ! 445: FSQRTd	fsqrt	
	.word 0x819ca000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa7500000  ! 447: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 448: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8d94e000  ! 449: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819c6000  ! 450: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb1a448a0  ! 451: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbfa5c9a0  ! 452: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xbf500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0xafa689c0  ! 455: FDIVd	fdivd	%f26, %f0, %f54
	.word 0xaf50c000  ! 456: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 457: RDPR_TNPC	<illegal instruction>
	.word 0xafa749e0  ! 458: FDIVq	dis not found

	.word 0x839fa000  ! 459: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x87972000  ! 460: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa1500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 462: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x819f6000  ! 463: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb3a40940  ! 464: FMULd	fmuld	%f16, %f0, %f56
	.word 0xb5504000  ! 465: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x8d976000  ! 466: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d956000  ! 467: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8794a000  ! 468: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbd508000  ! 469: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 470: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 471: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbf508000  ! 472: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a489e0  ! 473: FDIVq	dis not found

	.word 0xb550c000  ! 474: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 475: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa5508000  ! 476: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 479: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 480: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 481: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 482: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x81966000  ! 483: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8396a000  ! 484: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xab504000  ! 485: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 486: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 487: RDPR_TPC	<illegal instruction>
	.word 0x8d956000  ! 488: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa750c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 490: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81952000  ! 491: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb1a709a0  ! 492: FDIVs	fdivs	%f28, %f0, %f24
	.word 0x81952000  ! 493: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb9508000  ! 494: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 495: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d952000  ! 496: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8d95e000  ! 497: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xaf504000  ! 498: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xafa00540  ! 501: FSQRTd	fsqrt	
	.word 0x819ea000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x819e6000  ! 503: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa1a708e0  ! 504: FSUBq	dis not found

	.word 0x81956000  ! 505: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x87956000  ! 506: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8596a000  ! 507: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa3504000  ! 508: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x81946000  ! 510: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbf50c000  ! 511: RDPR_TT	<illegal instruction>
	.word 0x839e6000  ! 512: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xaf504000  ! 513: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 514: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 515: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb3508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 517: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x839ca000  ! 518: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8594a000  ! 519: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xafa00520  ! 520: FSQRTs	fsqrt	
	.word 0x85972000  ! 521: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xaba6c9e0  ! 522: FDIVq	dis not found

	.word 0xb7504000  ! 523: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 524: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 526: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb5a50840  ! 527: FADDd	faddd	%f20, %f0, %f26
	.word 0x8797e000  ! 528: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbf500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 530: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb5508000  ! 531: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 532: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xaba408e0  ! 533: FSUBq	dis not found

	.word 0xb9504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb1a54860  ! 536: FADDq	dis not found

	.word 0xa7a648c0  ! 537: FSUBd	fsubd	%f56, %f0, %f50
	.word 0xb3a00540  ! 538: FSQRTd	fsqrt	
	.word 0xbb500000  ! 539: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 540: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 541: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa3a508e0  ! 542: FSUBq	dis not found

	.word 0xa9a548e0  ! 543: FSUBq	dis not found

	.word 0x8594e000  ! 544: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb550c000  ! 545: RDPR_TT	<illegal instruction>
	.word 0xa3504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xafa488c0  ! 547: FSUBd	fsubd	%f18, %f0, %f54
	.word 0xa5a6c840  ! 548: FADDd	faddd	%f58, %f0, %f18
	.word 0xb9a6c8a0  ! 549: FSUBs	fsubs	%f27, %f0, %f28
	.word 0x87952000  ! 550: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa950c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0xada50940  ! 552: FMULd	fmuld	%f20, %f0, %f22
	.word 0x819c6000  ! 553: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa3a648e0  ! 554: FSUBq	dis not found

	.word 0xbf504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 557: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa750c000  ! 558: RDPR_TT	rdpr	%tt, %r19
	.word 0x839ca000  ! 559: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa1a448e0  ! 560: FSUBq	dis not found

	.word 0xb7508000  ! 561: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 562: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 563: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819e6000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x819f6000  ! 565: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8394a000  ! 566: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839ee000  ! 567: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb3504000  ! 568: RDPR_TNPC	<illegal instruction>
	.word 0xbfa589e0  ! 569: FDIVq	dis not found

	.word 0x8597a000  ! 570: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839e2000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x83976000  ! 572: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819ea000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa7508000  ! 574: RDPR_TSTATE	<illegal instruction>
	.word 0x839ee000  ! 575: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x819fa000  ! 576: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d94e000  ! 577: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb7500000  ! 578: RDPR_TPC	<illegal instruction>
	.word 0xb1a40960  ! 579: FMULq	dis not found

	.word 0xb7a6c8a0  ! 580: FSUBs	fsubs	%f27, %f0, %f27
	.word 0x819fa000  ! 581: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb7508000  ! 582: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 583: RDPR_TT	<illegal instruction>
	.word 0x819f2000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xaf500000  ! 585: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 586: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85952000  ! 587: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb1508000  ! 588: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0x8795a000  ! 590: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbfa00560  ! 591: FSQRTq	fsqrt	
	.word 0xb750c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 594: RDPR_TPC	<illegal instruction>
	.word 0xb5a608e0  ! 595: FSUBq	dis not found

	.word 0xb7500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 597: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x83976000  ! 598: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa150c000  ! 599: RDPR_TT	<illegal instruction>
	.word 0x87942000  ! 600: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xad504000  ! 601: RDPR_TNPC	<illegal instruction>
	.word 0x819da000  ! 602: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8596a000  ! 603: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x819e2000  ! 604: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xaba7c8e0  ! 605: FSUBq	dis not found

	.word 0x8d956000  ! 606: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x81976000  ! 607: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819f6000  ! 608: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbf504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 610: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8194a000  ! 611: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d946000  ! 612: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa5504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 614: RDPR_TPC	<illegal instruction>
	.word 0xab50c000  ! 615: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 616: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839c2000  ! 617: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa550c000  ! 618: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 620: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 622: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 623: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xafa649e0  ! 624: FDIVq	dis not found

	.word 0x819d6000  ! 625: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xab508000  ! 626: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0xada488e0  ! 629: FSUBq	dis not found

	.word 0x8395a000  ! 630: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa950c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xb1a549a0  ! 632: FDIVs	fdivs	%f21, %f0, %f24
	.word 0x8794e000  ! 633: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x83976000  ! 634: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8797a000  ! 635: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d97a000  ! 636: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8194e000  ! 637: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbb508000  ! 638: RDPR_TSTATE	<illegal instruction>
	.word 0xafa00520  ! 639: FSQRTs	fsqrt	
	.word 0x8d972000  ! 640: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819fa000  ! 641: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb9a508e0  ! 642: FSUBq	dis not found

	.word 0xab50c000  ! 643: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 644: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb7504000  ! 645: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 647: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb1504000  ! 648: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 649: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0x839ca000  ! 651: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8797e000  ! 652: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbba509c0  ! 653: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xa3a7c820  ! 654: FADDs	fadds	%f31, %f0, %f17
	.word 0x85956000  ! 655: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8794e000  ! 656: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb5a78820  ! 657: FADDs	fadds	%f30, %f0, %f26
	.word 0x87942000  ! 658: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbd50c000  ! 659: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xb3a00560  ! 661: FSQRTq	fsqrt	
	.word 0xa7500000  ! 662: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 663: RDPR_TPC	<illegal instruction>
	.word 0xa5504000  ! 664: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0x8d96e000  ! 666: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x83956000  ! 667: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd508000  ! 668: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 669: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x87952000  ! 670: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa7a548c0  ! 671: FSUBd	fsubd	%f52, %f0, %f50
	.word 0xad500000  ! 672: RDPR_TPC	<illegal instruction>
	.word 0x8596a000  ! 673: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8397e000  ! 674: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8594e000  ! 675: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa7504000  ! 676: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 677: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839ce000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d942000  ! 679: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb7500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 681: RDPR_TPC	<illegal instruction>
	.word 0x8396a000  ! 682: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbb508000  ! 683: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a649e0  ! 684: FDIVq	dis not found

	.word 0x83966000  ! 685: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839de000  ! 686: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x81966000  ! 687: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x85976000  ! 688: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3504000  ! 689: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819fa000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa3508000  ! 692: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 693: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 694: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 695: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 696: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 697: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa9a58920  ! 698: FMULs	fmuls	%f22, %f0, %f20
	.word 0xa7500000  ! 699: RDPR_TPC	<illegal instruction>
	.word 0xada589c0  ! 700: FDIVd	fdivd	%f22, %f0, %f22
	.word 0xa3a5c8a0  ! 701: FSUBs	fsubs	%f23, %f0, %f17
	.word 0x8397e000  ! 702: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa5a4c820  ! 703: FADDs	fadds	%f19, %f0, %f18
	.word 0x83962000  ! 704: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xab508000  ! 705: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 706: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb3a589a0  ! 707: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xb5a589e0  ! 708: FDIVq	dis not found

	.word 0xa1504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 710: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa7504000  ! 711: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 712: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x85966000  ! 713: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x819fa000  ! 714: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb1a548a0  ! 715: FSUBs	fsubs	%f21, %f0, %f24
	.word 0x8d942000  ! 716: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d94a000  ! 717: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xab504000  ! 718: RDPR_TNPC	<illegal instruction>
	.word 0xb1a40860  ! 719: FADDq	dis not found

	.word 0xa3508000  ! 720: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xb1a408e0  ! 722: FSUBq	dis not found

	.word 0xa5500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x839ea000  ! 725: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x819ca000  ! 726: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5508000  ! 727: RDPR_TSTATE	<illegal instruction>
	.word 0xada00520  ! 728: FSQRTs	fsqrt	
	.word 0x8d94e000  ! 729: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa7a708a0  ! 730: FSUBs	fsubs	%f28, %f0, %f19
	.word 0xa5a508e0  ! 731: FSUBq	dis not found

	.word 0xbf504000  ! 732: RDPR_TNPC	<illegal instruction>
	.word 0xa9a00540  ! 733: FSQRTd	fsqrt	
	.word 0xbd504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 736: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 738: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xbf500000  ! 739: RDPR_TPC	<illegal instruction>
	.word 0x8d946000  ! 740: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x83942000  ! 741: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa5a58860  ! 742: FADDq	dis not found

	.word 0x8d95a000  ! 743: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb950c000  ! 744: RDPR_TT	<illegal instruction>
	.word 0x839ce000  ! 745: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbda44820  ! 746: FADDs	fadds	%f17, %f0, %f30
	.word 0x85972000  ! 747: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8d95e000  ! 748: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d976000  ! 749: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 752: RDPR_TNPC	<illegal instruction>
	.word 0xa9a78920  ! 753: FMULs	fmuls	%f30, %f0, %f20
	.word 0x819f2000  ! 754: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb5a54940  ! 755: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb550c000  ! 756: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a5c920  ! 759: FMULs	fmuls	%f23, %f0, %f28
	.word 0x8794e000  ! 760: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa5a00540  ! 761: FSQRTd	fsqrt	
	.word 0x8397e000  ! 762: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819c2000  ! 763: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb3504000  ! 764: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 765: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8794e000  ! 766: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x87942000  ! 767: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839c6000  ! 768: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb1504000  ! 769: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x87942000  ! 771: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839c6000  ! 772: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819e6000  ! 773: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa7504000  ! 774: RDPR_TNPC	<illegal instruction>
	.word 0xad500000  ! 775: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 777: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8796a000  ! 778: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb3a60940  ! 779: FMULd	fmuld	%f24, %f0, %f56
	.word 0x8194a000  ! 780: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8396e000  ! 781: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8397a000  ! 782: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa9504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 785: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8d962000  ! 786: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8596e000  ! 787: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819ea000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb1508000  ! 789: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 790: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8d94e000  ! 791: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8595e000  ! 792: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x839ce000  ! 793: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa1a00540  ! 794: FSQRTd	fsqrt	
	.word 0xb7500000  ! 795: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 796: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa9a00520  ! 797: FSQRTs	fsqrt	
	.word 0xb5504000  ! 798: RDPR_TNPC	<illegal instruction>
	.word 0x819ce000  ! 799: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb1500000  ! 800: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0x8794a000  ! 802: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x839ee000  ! 803: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8797e000  ! 804: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x839ee000  ! 805: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xada5c940  ! 806: FMULd	fmuld	%f54, %f0, %f22
	.word 0xaba5c8c0  ! 807: FSUBd	fsubd	%f54, %f0, %f52
	.word 0xa7a00520  ! 808: FSQRTs	fsqrt	
	.word 0x8d966000  ! 809: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xab504000  ! 810: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 811: RDPR_TT	<illegal instruction>
	.word 0xb3a789c0  ! 812: FDIVd	fdivd	%f30, %f0, %f56
	.word 0xbba50940  ! 813: FMULd	fmuld	%f20, %f0, %f60
	.word 0x839fe000  ! 814: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8195a000  ! 815: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8d946000  ! 816: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb9a6c860  ! 817: FADDq	dis not found

	.word 0xb9a589a0  ! 818: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbd50c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0x819e6000  ! 820: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbf504000  ! 821: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 822: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x81942000  ! 823: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbb504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 825: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb7508000  ! 826: RDPR_TSTATE	<illegal instruction>
	.word 0x819f2000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8595a000  ! 828: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819e6000  ! 829: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbb504000  ! 830: RDPR_TNPC	<illegal instruction>
	.word 0x819c2000  ! 831: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xbf508000  ! 832: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 833: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5a48960  ! 834: FMULq	dis not found

	.word 0xa9500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 836: RDPR_TPC	<illegal instruction>
	.word 0xa5504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 838: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa7508000  ! 839: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 840: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 842: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 843: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x839da000  ! 844: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8d976000  ! 845: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa7a748e0  ! 846: FSUBq	dis not found

	.word 0x87966000  ! 847: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x839ee000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa150c000  ! 849: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 850: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 852: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x83962000  ! 853: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb3504000  ! 854: RDPR_TNPC	<illegal instruction>
	.word 0xbba448c0  ! 855: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbda488a0  ! 856: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb3a4c8a0  ! 857: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb5500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0xb5a549c0  ! 859: FDIVd	fdivd	%f52, %f0, %f26
	.word 0x819f6000  ! 860: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x819f2000  ! 861: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb1a48960  ! 862: FMULq	dis not found

	.word 0x839e2000  ! 863: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d962000  ! 864: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa550c000  ! 865: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 866: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 867: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 868: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a000  ! 869: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d956000  ! 870: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8595a000  ! 871: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb350c000  ! 872: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 873: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839e2000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb1a60920  ! 875: FMULs	fmuls	%f24, %f0, %f24
	.word 0xbba48860  ! 876: FADDq	dis not found

	.word 0x8394a000  ! 877: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb150c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8797a000  ! 881: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x819ce000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa3504000  ! 883: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xa5504000  ! 885: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e000  ! 886: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x83976000  ! 887: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x85956000  ! 888: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa150c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xa5a50860  ! 890: FADDq	dis not found

	.word 0x8395e000  ! 891: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x83952000  ! 892: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa9504000  ! 893: RDPR_TNPC	<illegal instruction>
	.word 0xada449e0  ! 894: FDIVq	dis not found

	.word 0xab500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 896: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a58960  ! 897: FMULq	dis not found

	.word 0x81942000  ! 898: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8d97e000  ! 899: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbf500000  ! 900: RDPR_TPC	<illegal instruction>
	.word 0xb7a689a0  ! 901: FDIVs	fdivs	%f26, %f0, %f27
	.word 0xa5a54860  ! 902: FADDq	dis not found

	.word 0x839ca000  ! 903: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xbda00520  ! 904: FSQRTs	fsqrt	
	.word 0x85952000  ! 905: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa1508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 907: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb3500000  ! 908: RDPR_TPC	<illegal instruction>
	.word 0xa1a48940  ! 909: FMULd	fmuld	%f18, %f0, %f16
	.word 0x8397e000  ! 910: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb1504000  ! 911: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 913: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x819e2000  ! 914: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x819e2000  ! 915: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbda00520  ! 916: FSQRTs	fsqrt	
	.word 0x8397e000  ! 917: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xaba58940  ! 918: FMULd	fmuld	%f22, %f0, %f52
	.word 0xada7c9a0  ! 919: FDIVs	fdivs	%f31, %f0, %f22
	.word 0xada60840  ! 920: FADDd	faddd	%f24, %f0, %f22
	.word 0xb7508000  ! 921: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 922: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819ca000  ! 923: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xaf504000  ! 924: RDPR_TNPC	<illegal instruction>
	.word 0xa3a6c8a0  ! 925: FSUBs	fsubs	%f27, %f0, %f17
	.word 0xa750c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0x8794e000  ! 927: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8395e000  ! 928: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x85942000  ! 929: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbb504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a6c840  ! 932: FADDd	faddd	%f58, %f0, %f58
	.word 0xb950c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xa5a58820  ! 934: FADDs	fadds	%f22, %f0, %f18
	.word 0xb3508000  ! 935: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 936: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x85966000  ! 937: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xaba788c0  ! 938: FSUBd	fsubd	%f30, %f0, %f52
	.word 0x87942000  ! 939: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8396a000  ! 940: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839fa000  ! 941: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xaf50c000  ! 942: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d956000  ! 944: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb750c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 946: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa3a48860  ! 947: FADDq	dis not found

	.word 0x819c2000  ! 948: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xaf50c000  ! 949: RDPR_TT	<illegal instruction>
	.word 0xbda688c0  ! 950: FSUBd	fsubd	%f26, %f0, %f30
	.word 0xb9500000  ! 951: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 953: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 954: RDPR_TT	<illegal instruction>
	.word 0x819c2000  ! 955: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x819ce000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xad504000  ! 957: RDPR_TNPC	<illegal instruction>
	.word 0xbda5c820  ! 958: FADDs	fadds	%f23, %f0, %f30
	.word 0x819f2000  ! 959: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8395e000  ! 960: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa1500000  ! 961: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 963: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb1508000  ! 964: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 965: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8594a000  ! 966: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb150c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 968: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839e6000  ! 969: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x85962000  ! 970: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85962000  ! 971: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819f2000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa3508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x87972000  ! 974: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa9a489c0  ! 975: FDIVd	fdivd	%f18, %f0, %f20
	.word 0x81956000  ! 976: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb9500000  ! 977: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 978: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xad504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xaba549a0  ! 980: FDIVs	fdivs	%f21, %f0, %f21
	.word 0x8795a000  ! 981: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8d962000  ! 982: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x839ca000  ! 983: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819ea000  ! 984: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x85976000  ! 985: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8397e000  ! 986: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819e6000  ! 987: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa1508000  ! 988: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a74940  ! 989: FMULd	fmuld	%f60, %f0, %f56
	.word 0xb9a4c820  ! 990: FADDs	fadds	%f19, %f0, %f28
	.word 0x8d972000  ! 991: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbd50c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 993: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb9508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x85956000  ! 995: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb7a00520  ! 996: FSQRTs	fsqrt	
	.word 0x819f2000  ! 997: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8197e000  ! 998: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
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
	.word 0xa9504000  ! 1: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xbd508000  ! 2: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 4: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb5504000  ! 5: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x8396e000  ! 6: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8796a000  ! 7: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8396a000  ! 8: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839da000  ! 9: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa5508000  ! 10: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8d966000  ! 11: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xaf50c000  ! 12: RDPR_TT	rdpr	%tt, %r23
	.word 0xb950c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 14: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x81956000  ! 15: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa9a50960  ! 16: FMULq	dis not found

	.word 0xa9a709e0  ! 17: FDIVq	dis not found

	.word 0x83956000  ! 18: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8795e000  ! 19: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xbd504000  ! 20: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xa1a409e0  ! 21: FDIVq	dis not found

	.word 0xbf504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xbba44860  ! 23: FADDq	dis not found

	.word 0x839f2000  ! 24: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa1500000  ! 25: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xa1504000  ! 26: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 27: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x83966000  ! 28: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819fe000  ! 29: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8395e000  ! 30: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbf500000  ! 31: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xb7a688a0  ! 32: FSUBs	fsubs	%f26, %f0, %f27
	.word 0x87972000  ! 33: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x85962000  ! 34: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa1a688e0  ! 35: FSUBq	dis not found

	.word 0x8797a000  ! 36: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x819fa000  ! 37: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8195e000  ! 38: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x81976000  ! 39: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8d976000  ! 40: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xbba40920  ! 41: FMULs	fmuls	%f16, %f0, %f29
	.word 0x839e6000  ! 42: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839fa000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa5a508e0  ! 44: FSUBq	dis not found

	.word 0x85966000  ! 45: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbd504000  ! 46: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x81966000  ! 47: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb750c000  ! 48: RDPR_TT	rdpr	%tt, %r27
	.word 0x8594e000  ! 49: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8397a000  ! 50: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839ee000  ! 51: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8196e000  ! 52: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xaf50c000  ! 53: RDPR_TT	rdpr	%tt, %r23
	.word 0x8395e000  ! 54: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x87952000  ! 55: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb1508000  ! 56: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x85972000  ! 57: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa3504000  ! 58: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xb7a509c0  ! 59: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xb550c000  ! 60: RDPR_TT	<illegal instruction>
	.word 0x8794a000  ! 61: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbb500000  ! 62: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb7500000  ! 63: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 64: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x83966000  ! 65: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8195a000  ! 66: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb350c000  ! 67: RDPR_TT	rdpr	%tt, %r25
	.word 0xb7508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 69: RDPR_TT	<illegal instruction>
	.word 0x81976000  ! 70: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819ee000  ! 71: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xbb500000  ! 72: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x81962000  ! 73: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839ca000  ! 74: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8796a000  ! 75: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1a78960  ! 76: FMULq	dis not found

	.word 0xa7504000  ! 77: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xa3a78840  ! 78: FADDd	faddd	%f30, %f0, %f48
	.word 0xbd508000  ! 79: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0xbba64820  ! 82: FADDs	fadds	%f25, %f0, %f29
	.word 0x85962000  ! 83: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xada70960  ! 84: FMULq	dis not found

	.word 0x839ee000  ! 85: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x819e6000  ! 86: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xb1504000  ! 87: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xafa68920  ! 88: FMULs	fmuls	%f26, %f0, %f23
	.word 0x839c2000  ! 89: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8395a000  ! 90: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8397a000  ! 91: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8797a000  ! 92: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xaf508000  ! 93: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xa3508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x8d956000  ! 95: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb5504000  ! 96: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x819ce000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xab508000  ! 98: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xa9508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 101: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a000  ! 102: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb7508000  ! 103: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8395a000  ! 104: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8595a000  ! 105: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839de000  ! 106: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819de000  ! 107: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d976000  ! 108: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x81976000  ! 109: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8794a000  ! 110: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa9a74920  ! 111: FMULs	fmuls	%f29, %f0, %f20
	.word 0xb5a648c0  ! 112: FSUBd	fsubd	%f56, %f0, %f26
	.word 0x819d2000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x839e2000  ! 114: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8395e000  ! 115: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb1a6c9c0  ! 116: FDIVd	fdivd	%f58, %f0, %f24
	.word 0xb1a78820  ! 117: FADDs	fadds	%f30, %f0, %f24
	.word 0xad500000  ! 118: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xa9504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 120: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85956000  ! 121: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d97e000  ! 122: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb7a64920  ! 123: FMULs	fmuls	%f25, %f0, %f27
	.word 0x819d6000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa350c000  ! 125: RDPR_TT	rdpr	%tt, %r17
	.word 0x8397e000  ! 126: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x85972000  ! 127: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x85976000  ! 128: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb7500000  ! 129: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xaba488e0  ! 130: FSUBq	dis not found

	.word 0x83962000  ! 131: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839e6000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbd50c000  ! 133: RDPR_TT	rdpr	%tt, %r30
	.word 0xbb500000  ! 134: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 135: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa5504000  ! 136: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x839c2000  ! 137: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb350c000  ! 138: RDPR_TT	rdpr	%tt, %r25
	.word 0xb1500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 140: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbd504000  ! 141: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbba58840  ! 142: FADDd	faddd	%f22, %f0, %f60
	.word 0x87952000  ! 143: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839ea000  ! 144: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb1500000  ! 145: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8595a000  ! 146: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839ca000  ! 147: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8796e000  ! 148: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xab500000  ! 149: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xa3a00520  ! 150: FSQRTs	fsqrt	
	.word 0x819fa000  ! 151: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xab50c000  ! 152: RDPR_TT	rdpr	%tt, %r21
	.word 0x819ce000  ! 153: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81942000  ! 154: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8794e000  ! 155: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa7a74840  ! 156: FADDd	faddd	%f60, %f0, %f50
	.word 0xaf504000  ! 157: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xb9504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 159: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbd508000  ! 160: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8796a000  ! 161: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d97e000  ! 162: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa7a68860  ! 163: FADDq	dis not found

	.word 0xbb508000  ! 164: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x8395e000  ! 165: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb1a689e0  ! 166: FDIVq	dis not found

	.word 0xa550c000  ! 167: RDPR_TT	rdpr	%tt, %r18
	.word 0xa1a548c0  ! 168: FSUBd	fsubd	%f52, %f0, %f16
	.word 0x819d6000  ! 169: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x85966000  ! 170: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbfa00540  ! 171: FSQRTd	fsqrt	
	.word 0x8196a000  ! 172: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87946000  ! 173: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d96a000  ! 174: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8395e000  ! 175: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8596a000  ! 176: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xaf50c000  ! 177: RDPR_TT	rdpr	%tt, %r23
	.word 0x839fa000  ! 178: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb1504000  ! 179: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x83966000  ! 180: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb7a00560  ! 181: FSQRTq	fsqrt	
	.word 0xad500000  ! 182: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xb5a68840  ! 183: FADDd	faddd	%f26, %f0, %f26
	.word 0xa5a7c860  ! 184: FADDq	dis not found

	.word 0x81966000  ! 185: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbf504000  ! 186: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xbb500000  ! 187: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 188: RDPR_TSTATE	<illegal instruction>
	.word 0x83962000  ! 189: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8396e000  ! 190: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8397e000  ! 191: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa9504000  ! 192: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x8196e000  ! 193: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x85956000  ! 194: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb3a649c0  ! 195: FDIVd	fdivd	%f56, %f0, %f56
	.word 0x8794e000  ! 196: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x83966000  ! 197: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819ea000  ! 198: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x87942000  ! 199: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8d962000  ! 200: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x81972000  ! 201: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819ee000  ! 202: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8194e000  ! 203: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x819f6000  ! 204: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbba6c8c0  ! 205: FSUBd	fsubd	%f58, %f0, %f60
	.word 0x85946000  ! 206: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x819da000  ! 207: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x81946000  ! 208: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x839c2000  ! 209: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8597e000  ! 210: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x83952000  ! 211: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb9a4c9c0  ! 212: FDIVd	fdivd	%f50, %f0, %f28
	.word 0x8197a000  ! 213: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8d972000  ! 214: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8196a000  ! 215: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa1508000  ! 216: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x819f6000  ! 217: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8195e000  ! 218: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x839d2000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8196a000  ! 220: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87966000  ! 221: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x819d2000  ! 222: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb1504000  ! 223: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb7504000  ! 224: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 225: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xab504000  ! 226: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xb7504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0x8596e000  ! 228: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x83966000  ! 229: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819c2000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x83972000  ! 231: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8197a000  ! 232: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa9500000  ! 233: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x81966000  ! 234: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x819f2000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xab508000  ! 236: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xb7508000  ! 237: RDPR_TSTATE	<illegal instruction>
	.word 0x839c2000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa5a4c820  ! 239: FADDs	fadds	%f19, %f0, %f18
	.word 0x8596a000  ! 240: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb1504000  ! 241: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xa7a5c8c0  ! 242: FSUBd	fsubd	%f54, %f0, %f50
	.word 0x8196a000  ! 243: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8395a000  ! 244: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb3a40920  ! 245: FMULs	fmuls	%f16, %f0, %f25
	.word 0xa5a00540  ! 246: FSQRTd	fsqrt	
	.word 0xab500000  ! 247: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x839e2000  ! 248: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839e6000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8796e000  ! 250: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8196a000  ! 251: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb7508000  ! 252: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb3a70920  ! 253: FMULs	fmuls	%f28, %f0, %f25
	.word 0x8395a000  ! 254: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819ea000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb9504000  ! 256: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb7508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00560  ! 258: FSQRTq	fsqrt	
	.word 0xbb504000  ! 259: RDPR_TNPC	<illegal instruction>
	.word 0xaba448c0  ! 260: FSUBd	fsubd	%f48, %f0, %f52
	.word 0xa350c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 262: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x81946000  ! 263: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa7508000  ! 264: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x81952000  ! 265: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x819da000  ! 266: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x839c2000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa750c000  ! 268: RDPR_TT	rdpr	%tt, %r19
	.word 0x8395a000  ! 269: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb3504000  ! 270: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xa5500000  ! 271: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 272: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 273: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xab50c000  ! 274: RDPR_TT	rdpr	%tt, %r21
	.word 0xa7500000  ! 275: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 276: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x81966000  ! 277: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa7a748e0  ! 278: FSUBq	dis not found

	.word 0xad508000  ! 279: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xb5500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 281: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8397e000  ! 282: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8d962000  ! 283: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xaf504000  ! 284: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xbb500000  ! 285: RDPR_TPC	<illegal instruction>
	.word 0x839d6000  ! 286: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839e6000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa1508000  ! 288: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8795e000  ! 289: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb1508000  ! 290: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x839ea000  ! 291: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xaba00520  ! 292: FSQRTs	fsqrt	
	.word 0xbda00520  ! 293: FSQRTs	fsqrt	
	.word 0xaf504000  ! 294: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xb3a78860  ! 295: FADDq	dis not found

	.word 0x819fa000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8595e000  ! 297: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8796e000  ! 298: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb7a5c9a0  ! 299: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xad50c000  ! 300: RDPR_TT	rdpr	%tt, %r22
	.word 0x83966000  ! 301: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d95a000  ! 302: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8595e000  ! 303: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbf500000  ! 304: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xa3504000  ! 305: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 306: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x839e6000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa9508000  ! 308: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x85946000  ! 309: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x839fa000  ! 310: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819fe000  ! 311: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa950c000  ! 312: RDPR_TT	rdpr	%tt, %r20
	.word 0x87962000  ! 313: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb7500000  ! 314: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x819ea000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x85972000  ! 316: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa7508000  ! 317: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x839c6000  ! 318: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819c6000  ! 319: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbda44940  ! 320: FMULd	fmuld	%f48, %f0, %f30
	.word 0x81942000  ! 321: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xaba00560  ! 322: FSQRTq	fsqrt	
	.word 0xa9508000  ! 323: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xa750c000  ! 324: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 325: RDPR_TNPC	<illegal instruction>
	.word 0xb5a688e0  ! 326: FSUBq	dis not found

	.word 0x839de000  ! 327: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x83942000  ! 328: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb1a68820  ! 329: FADDs	fadds	%f26, %f0, %f24
	.word 0xa9500000  ! 330: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x819f6000  ! 331: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb350c000  ! 332: RDPR_TT	rdpr	%tt, %r25
	.word 0xa3504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 334: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8795a000  ! 335: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb9a7c940  ! 336: FMULd	fmuld	%f62, %f0, %f28
	.word 0x8195e000  ! 337: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xaba708c0  ! 338: FSUBd	fsubd	%f28, %f0, %f52
	.word 0xb9a5c8e0  ! 339: FSUBq	dis not found

	.word 0xb5504000  ! 340: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa9504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xb9a44960  ! 342: FMULq	dis not found

	.word 0x8594a000  ! 343: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x819e6000  ! 344: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x87972000  ! 345: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb3504000  ! 346: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xa3a409a0  ! 347: FDIVs	fdivs	%f16, %f0, %f17
	.word 0x85976000  ! 348: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839ee000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb3500000  ! 350: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x819e2000  ! 351: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb9a70820  ! 352: FADDs	fadds	%f28, %f0, %f28
	.word 0x8794e000  ! 353: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb750c000  ! 354: RDPR_TT	rdpr	%tt, %r27
	.word 0x8d962000  ! 355: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8d97a000  ! 356: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x87976000  ! 357: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa3504000  ! 358: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa5a5c9c0  ! 359: FDIVd	fdivd	%f54, %f0, %f18
	.word 0x8397e000  ! 360: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xaba449a0  ! 361: FDIVs	fdivs	%f17, %f0, %f21
	.word 0xa1a00540  ! 362: FSQRTd	fsqrt	
	.word 0x87946000  ! 363: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa5a00540  ! 364: FSQRTd	fsqrt	
	.word 0x8d972000  ! 365: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb7a00520  ! 366: FSQRTs	fsqrt	
	.word 0xbb50c000  ! 367: RDPR_TT	rdpr	%tt, %r29
	.word 0xbfa68940  ! 368: FMULd	fmuld	%f26, %f0, %f62
	.word 0xb5500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 371: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xaba608c0  ! 372: FSUBd	fsubd	%f24, %f0, %f52
	.word 0x819c2000  ! 373: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa9500000  ! 374: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xa5a44840  ! 375: FADDd	faddd	%f48, %f0, %f18
	.word 0xafa70920  ! 376: FMULs	fmuls	%f28, %f0, %f23
	.word 0x819de000  ! 377: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8394a000  ! 378: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb9500000  ! 379: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x8596a000  ! 380: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbda68940  ! 381: FMULd	fmuld	%f26, %f0, %f30
	.word 0x819d2000  ! 382: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x85952000  ! 383: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb350c000  ! 384: RDPR_TT	rdpr	%tt, %r25
	.word 0xaba588a0  ! 385: FSUBs	fsubs	%f22, %f0, %f21
	.word 0x85976000  ! 386: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb1a44940  ! 387: FMULd	fmuld	%f48, %f0, %f24
	.word 0xa350c000  ! 388: RDPR_TT	rdpr	%tt, %r17
	.word 0xb3a7c960  ! 389: FMULq	dis not found

	.word 0xaf504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 391: RDPR_TPC	<illegal instruction>
	.word 0xbba74940  ! 392: FMULd	fmuld	%f60, %f0, %f60
	.word 0x819ea000  ! 393: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xad500000  ! 394: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xb1504000  ! 395: RDPR_TNPC	<illegal instruction>
	.word 0xada50920  ! 396: FMULs	fmuls	%f20, %f0, %f22
	.word 0xada788c0  ! 397: FSUBd	fsubd	%f30, %f0, %f22
	.word 0xb350c000  ! 398: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 400: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 401: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 403: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbb508000  ! 404: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb9500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0x819e6000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x839f2000  ! 407: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819ce000  ! 408: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5504000  ! 409: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xaf504000  ! 410: RDPR_TNPC	<illegal instruction>
	.word 0x819e6000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xb3a44960  ! 412: FMULq	dis not found

	.word 0xb1508000  ! 413: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb7500000  ! 414: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 415: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa5504000  ! 416: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xbf50c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 418: RDPR_TPC	<illegal instruction>
	.word 0xab508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 422: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x81976000  ! 423: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbd50c000  ! 424: RDPR_TT	rdpr	%tt, %r30
	.word 0xa1a40820  ! 425: FADDs	fadds	%f16, %f0, %f16
	.word 0xab500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 427: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x87962000  ! 428: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb7a489e0  ! 429: FDIVq	dis not found

	.word 0xad50c000  ! 430: RDPR_TT	rdpr	%tt, %r22
	.word 0xa550c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 432: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 433: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819fa000  ! 434: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8794e000  ! 435: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x819d6000  ! 436: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa3504000  ! 437: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x819e2000  ! 438: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8795e000  ! 439: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87952000  ! 440: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d966000  ! 441: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbf500000  ! 442: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xa5a48820  ! 443: FADDs	fadds	%f18, %f0, %f18
	.word 0x8d962000  ! 444: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa9a00540  ! 445: FSQRTd	fsqrt	
	.word 0x819e6000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xab500000  ! 447: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x87976000  ! 448: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d96a000  ! 449: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x819ca000  ! 450: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa1a408a0  ! 451: FSUBs	fsubs	%f16, %f0, %f16
	.word 0xbfa689a0  ! 452: FDIVs	fdivs	%f26, %f0, %f31
	.word 0xbb500000  ! 453: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbf504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0xb1a509c0  ! 455: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xa150c000  ! 456: RDPR_TT	<illegal instruction>
	.word 0xbb504000  ! 457: RDPR_TNPC	<illegal instruction>
	.word 0xa5a409e0  ! 458: FDIVq	dis not found

	.word 0x839e6000  ! 459: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8795e000  ! 460: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa7500000  ! 461: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x87956000  ! 462: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x819d2000  ! 463: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa9a60940  ! 464: FMULd	fmuld	%f24, %f0, %f20
	.word 0xbf504000  ! 465: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x8d956000  ! 466: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d94a000  ! 467: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x87952000  ! 468: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa5508000  ! 469: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xbd500000  ! 470: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 471: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbb508000  ! 472: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xa1a4c9e0  ! 473: FDIVq	dis not found

	.word 0xa350c000  ! 474: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 475: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa3508000  ! 476: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xaf500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 479: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 480: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 481: RDPR_TT	<illegal instruction>
	.word 0x8d956000  ! 482: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x81962000  ! 483: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x83956000  ! 484: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb9504000  ! 485: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb7508000  ! 486: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 487: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 488: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa350c000  ! 489: RDPR_TT	rdpr	%tt, %r17
	.word 0x85942000  ! 490: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8197a000  ! 491: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbba709a0  ! 492: FDIVs	fdivs	%f28, %f0, %f29
	.word 0x81956000  ! 493: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa1508000  ! 494: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8d942000  ! 495: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d946000  ! 496: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d956000  ! 497: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb1504000  ! 498: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xa3508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00540  ! 501: FSQRTd	fsqrt	
	.word 0x819c6000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x819c2000  ! 503: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xada7c8e0  ! 504: FSUBq	dis not found

	.word 0x81966000  ! 505: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x87942000  ! 506: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8597e000  ! 507: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbb504000  ! 508: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x839c2000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8196e000  ! 510: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbb50c000  ! 511: RDPR_TT	rdpr	%tt, %r29
	.word 0x839d2000  ! 512: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa3504000  ! 513: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xbb50c000  ! 514: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 515: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xab508000  ! 516: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8d966000  ! 517: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x839ee000  ! 518: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x85942000  ! 519: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbba00520  ! 520: FSQRTs	fsqrt	
	.word 0x85946000  ! 521: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb9a689e0  ! 522: FDIVq	dis not found

	.word 0xad504000  ! 523: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb1504000  ! 524: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 526: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb5a64840  ! 527: FADDd	faddd	%f56, %f0, %f26
	.word 0x87962000  ! 528: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa5500000  ! 529: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x819e2000  ! 530: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xad508000  ! 531: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x8d97a000  ! 532: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb5a748e0  ! 533: FSUBq	dis not found

	.word 0xa9504000  ! 534: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x839da000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa3a58860  ! 536: FADDq	dis not found

	.word 0xafa5c8c0  ! 537: FSUBd	fsubd	%f54, %f0, %f54
	.word 0xbba00540  ! 538: FSQRTd	fsqrt	
	.word 0xb3500000  ! 539: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb5500000  ! 540: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 541: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xafa708e0  ! 542: FSUBq	dis not found

	.word 0xaba508e0  ! 543: FSUBq	dis not found

	.word 0x8597e000  ! 544: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb350c000  ! 545: RDPR_TT	rdpr	%tt, %r25
	.word 0xa5504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xbda5c8c0  ! 547: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb3a70840  ! 548: FADDd	faddd	%f28, %f0, %f56
	.word 0xa3a448a0  ! 549: FSUBs	fsubs	%f17, %f0, %f17
	.word 0x87966000  ! 550: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa550c000  ! 551: RDPR_TT	rdpr	%tt, %r18
	.word 0xb7a54940  ! 552: FMULd	fmuld	%f52, %f0, %f58
	.word 0x819fe000  ! 553: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3a748e0  ! 554: FSUBq	dis not found

	.word 0xb3504000  ! 555: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb950c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 557: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbf50c000  ! 558: RDPR_TT	rdpr	%tt, %r31
	.word 0x839de000  ! 559: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa9a588e0  ! 560: FSUBq	dis not found

	.word 0xb1508000  ! 561: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xbb50c000  ! 562: RDPR_TT	<illegal instruction>
	.word 0x8d96e000  ! 563: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x819c6000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x819e2000  ! 565: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8397e000  ! 566: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x839e2000  ! 567: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xbf504000  ! 568: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xbba409e0  ! 569: FDIVq	dis not found

	.word 0x85976000  ! 570: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839ea000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x83962000  ! 572: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819ea000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbf508000  ! 574: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x839fa000  ! 575: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819ea000  ! 576: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8d97a000  ! 577: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa3500000  ! 578: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xb1a4c960  ! 579: FMULq	dis not found

	.word 0xafa748a0  ! 580: FSUBs	fsubs	%f29, %f0, %f23
	.word 0x819fe000  ! 581: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3508000  ! 582: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xb150c000  ! 583: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa3500000  ! 585: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x85962000  ! 586: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85942000  ! 587: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb3508000  ! 588: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xaf50c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 590: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xaba00560  ! 591: FSQRTq	fsqrt	
	.word 0xa950c000  ! 592: RDPR_TT	rdpr	%tt, %r20
	.word 0xb3508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 594: RDPR_TPC	<illegal instruction>
	.word 0xb7a588e0  ! 595: FSUBq	dis not found

	.word 0xb3500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 597: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x83966000  ! 598: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa150c000  ! 599: RDPR_TT	rdpr	%tt, %r16
	.word 0x8794a000  ! 600: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbb504000  ! 601: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x819ea000  ! 602: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8594a000  ! 603: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x819d6000  ! 604: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa1a488e0  ! 605: FSUBq	dis not found

	.word 0x8d95e000  ! 606: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x81942000  ! 607: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x819d2000  ! 608: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa1504000  ! 609: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x8595a000  ! 610: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8194e000  ! 611: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8d962000  ! 612: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb7504000  ! 613: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xbd500000  ! 614: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 615: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 616: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x839ce000  ! 617: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa550c000  ! 618: RDPR_TT	rdpr	%tt, %r18
	.word 0xbd504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xa3500000  ! 620: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 622: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 623: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb7a749e0  ! 624: FDIVq	dis not found

	.word 0x819d6000  ! 625: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa3508000  ! 626: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xbb50c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xa7504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0xb5a748e0  ! 629: FSUBq	dis not found

	.word 0x8395e000  ! 630: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb550c000  ! 631: RDPR_TT	rdpr	%tt, %r26
	.word 0xa9a689a0  ! 632: FDIVs	fdivs	%f26, %f0, %f20
	.word 0x87976000  ! 633: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8397e000  ! 634: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87972000  ! 635: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8d972000  ! 636: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x81976000  ! 637: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb9508000  ! 638: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xbfa00520  ! 639: FSQRTs	fsqrt	
	.word 0x8d95e000  ! 640: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819f2000  ! 641: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbba708e0  ! 642: FSUBq	dis not found

	.word 0xa350c000  ! 643: RDPR_TT	rdpr	%tt, %r17
	.word 0x83952000  ! 644: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3504000  ! 645: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xbb500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 647: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xab504000  ! 648: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xb1504000  ! 649: RDPR_TNPC	<illegal instruction>
	.word 0xa3508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0x839ee000  ! 651: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8797a000  ! 652: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa3a689c0  ! 653: FDIVd	fdivd	%f26, %f0, %f48
	.word 0xb1a60820  ! 654: FADDs	fadds	%f24, %f0, %f24
	.word 0x8594e000  ! 655: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8796e000  ! 656: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbfa48820  ! 657: FADDs	fadds	%f18, %f0, %f31
	.word 0x8796e000  ! 658: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa550c000  ! 659: RDPR_TT	rdpr	%tt, %r18
	.word 0xb5500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xbfa00560  ! 661: FSQRTq	fsqrt	
	.word 0xab500000  ! 662: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 663: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 664: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0x8d97a000  ! 666: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8397e000  ! 667: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa5508000  ! 668: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x85956000  ! 669: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x87962000  ! 670: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbfa408c0  ! 671: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xa7500000  ! 672: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x85956000  ! 673: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8397e000  ! 674: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8597a000  ! 675: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbd504000  ! 676: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x83966000  ! 677: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839f2000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8d97a000  ! 679: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb3500000  ! 680: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa7500000  ! 681: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 682: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa5508000  ! 683: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb5a709e0  ! 684: FDIVq	dis not found

	.word 0x83962000  ! 685: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839e2000  ! 686: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x81942000  ! 687: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8594a000  ! 688: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xbf504000  ! 689: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xa3508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819c6000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xaf508000  ! 692: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xbf50c000  ! 693: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 694: RDPR_TPC	<illegal instruction>
	.word 0xa1504000  ! 695: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 696: RDPR_TNPC	<illegal instruction>
	.word 0x819fe000  ! 697: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb5a40920  ! 698: FMULs	fmuls	%f16, %f0, %f26
	.word 0xa1500000  ! 699: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xb1a509c0  ! 700: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xa5a708a0  ! 701: FSUBs	fsubs	%f28, %f0, %f18
	.word 0x8395a000  ! 702: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa7a68820  ! 703: FADDs	fadds	%f26, %f0, %f19
	.word 0x8394e000  ! 704: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa9508000  ! 705: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x8195a000  ! 706: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbda5c9a0  ! 707: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xa7a449e0  ! 708: FDIVq	dis not found

	.word 0xb9504000  ! 709: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x8596a000  ! 710: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbb504000  ! 711: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x8196a000  ! 712: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85942000  ! 713: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819e2000  ! 714: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa7a648a0  ! 715: FSUBs	fsubs	%f25, %f0, %f19
	.word 0x8d956000  ! 716: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d946000  ! 717: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbd504000  ! 718: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb1a50860  ! 719: FADDq	dis not found

	.word 0xa1508000  ! 720: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xafa588e0  ! 722: FSUBq	dis not found

	.word 0xbd500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x839c6000  ! 725: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819fe000  ! 726: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9508000  ! 727: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xada00520  ! 728: FSQRTs	fsqrt	
	.word 0x8d94e000  ! 729: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa5a4c8a0  ! 730: FSUBs	fsubs	%f19, %f0, %f18
	.word 0xb7a708e0  ! 731: FSUBq	dis not found

	.word 0xad504000  ! 732: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb7a00540  ! 733: FSQRTd	fsqrt	
	.word 0xa7504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 736: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x8797a000  ! 738: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa5500000  ! 739: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x8d956000  ! 740: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8396e000  ! 741: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa1a44860  ! 742: FADDq	dis not found

	.word 0x8d95e000  ! 743: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xaf50c000  ! 744: RDPR_TT	rdpr	%tt, %r23
	.word 0x839ea000  ! 745: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa3a58820  ! 746: FADDs	fadds	%f22, %f0, %f17
	.word 0x85956000  ! 747: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d96e000  ! 748: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8d952000  ! 749: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb9500000  ! 750: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb1508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 752: RDPR_TNPC	<illegal instruction>
	.word 0xa1a7c920  ! 753: FMULs	fmuls	%f31, %f0, %f16
	.word 0x819f2000  ! 754: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb7a68940  ! 755: FMULd	fmuld	%f26, %f0, %f58
	.word 0xaf50c000  ! 756: RDPR_TT	rdpr	%tt, %r23
	.word 0xa7508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a58920  ! 759: FMULs	fmuls	%f22, %f0, %f16
	.word 0x87972000  ! 760: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbfa00540  ! 761: FSQRTd	fsqrt	
	.word 0x83972000  ! 762: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x819f6000  ! 763: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb9504000  ! 764: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x8394a000  ! 765: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87972000  ! 766: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8796e000  ! 767: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x839fe000  ! 768: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb1504000  ! 769: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x839f6000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8797e000  ! 771: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x839c6000  ! 772: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819e2000  ! 773: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbb504000  ! 774: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb3500000  ! 775: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 777: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8797a000  ! 778: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbba68940  ! 779: FMULd	fmuld	%f26, %f0, %f60
	.word 0x81962000  ! 780: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8395e000  ! 781: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8397e000  ! 782: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb9504000  ! 783: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb7504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 785: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8d946000  ! 786: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x85976000  ! 787: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819ca000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb1508000  ! 789: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8d95e000  ! 790: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d962000  ! 791: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x85972000  ! 792: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x839e6000  ! 793: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa9a00540  ! 794: FSQRTd	fsqrt	
	.word 0xa3500000  ! 795: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x81972000  ! 796: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa9a00520  ! 797: FSQRTs	fsqrt	
	.word 0xa3504000  ! 798: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x819fe000  ! 799: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb3500000  ! 800: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa5500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0x8795e000  ! 802: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x839ca000  ! 803: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8797a000  ! 804: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x839c6000  ! 805: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb7a7c940  ! 806: FMULd	fmuld	%f62, %f0, %f58
	.word 0xbba5c8c0  ! 807: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xafa00520  ! 808: FSQRTs	fsqrt	
	.word 0x8d942000  ! 809: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa1504000  ! 810: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa750c000  ! 811: RDPR_TT	<illegal instruction>
	.word 0xa3a409c0  ! 812: FDIVd	fdivd	%f16, %f0, %f48
	.word 0xa9a50940  ! 813: FMULd	fmuld	%f20, %f0, %f20
	.word 0x839ee000  ! 814: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x81956000  ! 815: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8d946000  ! 816: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa7a78860  ! 817: FADDq	dis not found

	.word 0xbfa589a0  ! 818: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb150c000  ! 819: RDPR_TT	rdpr	%tt, %r24
	.word 0x819ca000  ! 820: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa3504000  ! 821: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8197a000  ! 822: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8197a000  ! 823: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb1504000  ! 824: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8794e000  ! 825: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa1508000  ! 826: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x819de000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x85956000  ! 828: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x819ea000  ! 829: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb1504000  ! 830: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x819fa000  ! 831: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xaf508000  ! 832: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8197e000  ! 833: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xafa64960  ! 834: FMULq	dis not found

	.word 0xb1500000  ! 835: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xaf500000  ! 836: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x819de000  ! 838: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbb508000  ! 839: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb5500000  ! 840: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 842: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 843: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839d2000  ! 844: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8d96e000  ! 845: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb1a608e0  ! 846: FSUBq	dis not found

	.word 0x87952000  ! 847: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839ea000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa950c000  ! 849: RDPR_TT	rdpr	%tt, %r20
	.word 0xaf500000  ! 850: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x839d2000  ! 852: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8397a000  ! 853: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb5504000  ! 854: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa1a788c0  ! 855: FSUBd	fsubd	%f30, %f0, %f16
	.word 0xa7a4c8a0  ! 856: FSUBs	fsubs	%f19, %f0, %f19
	.word 0xbda648a0  ! 857: FSUBs	fsubs	%f25, %f0, %f30
	.word 0xbd500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0xbba609c0  ! 859: FDIVd	fdivd	%f24, %f0, %f60
	.word 0x819fe000  ! 860: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819e2000  ! 861: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb1a50960  ! 862: FMULq	dis not found

	.word 0x839f2000  ! 863: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8d956000  ! 864: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb550c000  ! 865: RDPR_TT	rdpr	%tt, %r26
	.word 0xbb508000  ! 866: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 867: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 868: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 869: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8d966000  ! 870: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x85962000  ! 871: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbf50c000  ! 872: RDPR_TT	rdpr	%tt, %r31
	.word 0x839fa000  ! 873: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839c6000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa3a64920  ! 875: FMULs	fmuls	%f25, %f0, %f17
	.word 0xafa6c860  ! 876: FADDq	dis not found

	.word 0x83962000  ! 877: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xad50c000  ! 878: RDPR_TT	rdpr	%tt, %r22
	.word 0xb150c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x839e2000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8794a000  ! 881: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x819ce000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb3504000  ! 883: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xa750c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 885: RDPR_TNPC	<illegal instruction>
	.word 0x8d956000  ! 886: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x83952000  ! 887: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8596e000  ! 888: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa350c000  ! 889: RDPR_TT	rdpr	%tt, %r17
	.word 0xb7a44860  ! 890: FADDq	dis not found

	.word 0x8396a000  ! 891: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8395a000  ! 892: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb9504000  ! 893: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbfa4c9e0  ! 894: FDIVq	dis not found

	.word 0xbb500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 896: RDPR_TSTATE	<illegal instruction>
	.word 0xafa44960  ! 897: FMULq	dis not found

	.word 0x8197e000  ! 898: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8d962000  ! 899: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xbb500000  ! 900: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbda7c9a0  ! 901: FDIVs	fdivs	%f31, %f0, %f30
	.word 0xafa7c860  ! 902: FADDq	dis not found

	.word 0x839f2000  ! 903: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa7a00520  ! 904: FSQRTs	fsqrt	
	.word 0x8597a000  ! 905: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb9508000  ! 906: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8396e000  ! 907: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xab500000  ! 908: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xafa78940  ! 909: FMULd	fmuld	%f30, %f0, %f54
	.word 0x83956000  ! 910: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb1504000  ! 911: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xbb50c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 913: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x819ca000  ! 914: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x819de000  ! 915: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xb1a00520  ! 916: FSQRTs	fsqrt	
	.word 0x83956000  ! 917: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa1a74940  ! 918: FMULd	fmuld	%f60, %f0, %f16
	.word 0xa1a549a0  ! 919: FDIVs	fdivs	%f21, %f0, %f16
	.word 0xafa64840  ! 920: FADDd	faddd	%f56, %f0, %f54
	.word 0xb1508000  ! 921: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8396a000  ! 922: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819f6000  ! 923: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb9504000  ! 924: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa1a7c8a0  ! 925: FSUBs	fsubs	%f31, %f0, %f16
	.word 0xb150c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0x8796e000  ! 927: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x83952000  ! 928: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x85946000  ! 929: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb9504000  ! 930: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa5508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xbba6c840  ! 932: FADDd	faddd	%f58, %f0, %f60
	.word 0xa150c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xb1a44820  ! 934: FADDs	fadds	%f17, %f0, %f24
	.word 0xaf508000  ! 935: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 936: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8597e000  ! 937: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbda608c0  ! 938: FSUBd	fsubd	%f24, %f0, %f30
	.word 0x87952000  ! 939: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83946000  ! 940: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839f2000  ! 941: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbd50c000  ! 942: RDPR_TT	rdpr	%tt, %r30
	.word 0x819e6000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d972000  ! 944: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb150c000  ! 945: RDPR_TT	rdpr	%tt, %r24
	.word 0x83976000  ! 946: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbfa5c860  ! 947: FADDq	dis not found

	.word 0x819f2000  ! 948: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa950c000  ! 949: RDPR_TT	rdpr	%tt, %r20
	.word 0xafa688c0  ! 950: FSUBd	fsubd	%f26, %f0, %f54
	.word 0xa7500000  ! 951: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 953: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 954: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 955: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x819e2000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbf504000  ! 957: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xbfa50820  ! 958: FADDs	fadds	%f20, %f0, %f31
	.word 0x819de000  ! 959: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x83952000  ! 960: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb500000  ! 961: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb9508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 963: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbb508000  ! 964: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x81972000  ! 965: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8594e000  ! 966: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xaf50c000  ! 967: RDPR_TT	rdpr	%tt, %r23
	.word 0x85966000  ! 968: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839d6000  ! 969: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8595a000  ! 970: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85972000  ! 971: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x819f6000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbd508000  ! 973: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x87952000  ! 974: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xaba409c0  ! 975: FDIVd	fdivd	%f16, %f0, %f52
	.word 0x8197e000  ! 976: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa7500000  ! 977: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x8596e000  ! 978: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb9504000  ! 979: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xa3a609a0  ! 980: FDIVs	fdivs	%f24, %f0, %f17
	.word 0x8796a000  ! 981: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d952000  ! 982: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839fa000  ! 983: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819f2000  ! 984: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x85976000  ! 985: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8396e000  ! 986: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x819c2000  ! 987: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa7508000  ! 988: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xbfa50940  ! 989: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb7a64820  ! 990: FADDs	fadds	%f25, %f0, %f27
	.word 0x8d976000  ! 991: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xbd50c000  ! 992: RDPR_TT	rdpr	%tt, %r30
	.word 0x8d962000  ! 993: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb7508000  ! 994: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8596e000  ! 995: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xbda00520  ! 996: FSQRTs	fsqrt	
	.word 0x819f6000  ! 997: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8197e000  ! 998: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
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
	.word 0xb3504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 2: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 4: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb7504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0x8396e000  ! 6: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8795a000  ! 7: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8396a000  ! 8: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839ee000  ! 9: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xad508000  ! 10: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 11: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb550c000  ! 12: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 14: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8194e000  ! 15: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa9a78960  ! 16: FMULq	dis not found

	.word 0xa7a489e0  ! 17: FDIVq	dis not found

	.word 0x8397e000  ! 18: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87966000  ! 19: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbd504000  ! 20: RDPR_TNPC	<illegal instruction>
	.word 0xb7a449e0  ! 21: FDIVq	dis not found

	.word 0xb5504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xafa4c860  ! 23: FADDq	dis not found

	.word 0x839ce000  ! 24: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xaf500000  ! 25: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa9504000  ! 26: RDPR_TNPC	<illegal instruction>
	.word 0x839fa000  ! 27: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8396e000  ! 28: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x819f2000  ! 29: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8394a000  ! 30: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbb500000  ! 31: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb1a4c8a0  ! 32: FSUBs	fsubs	%f19, %f0, %f24
	.word 0x8797e000  ! 33: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8597a000  ! 34: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbda748e0  ! 35: FSUBq	dis not found

	.word 0x8795e000  ! 36: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x819ee000  ! 37: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x81962000  ! 38: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x81962000  ! 39: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8d94e000  ! 40: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa3a58920  ! 41: FMULs	fmuls	%f22, %f0, %f17
	.word 0x839e2000  ! 42: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839ca000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa3a708e0  ! 44: FSUBq	dis not found

	.word 0x85942000  ! 45: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xad504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 47: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb150c000  ! 48: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 49: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8397e000  ! 50: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x839fa000  ! 51: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8196a000  ! 52: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb750c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 54: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8797a000  ! 55: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb5508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x85956000  ! 57: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb5504000  ! 58: RDPR_TNPC	<illegal instruction>
	.word 0xa7a489c0  ! 59: FDIVd	fdivd	%f18, %f0, %f50
	.word 0xab50c000  ! 60: RDPR_TT	<illegal instruction>
	.word 0x87952000  ! 61: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa5500000  ! 62: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 63: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 64: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x83956000  ! 65: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x81966000  ! 66: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb150c000  ! 67: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 69: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 70: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x819e2000  ! 71: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xaf500000  ! 72: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 73: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x839c6000  ! 74: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x87976000  ! 75: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa5a54960  ! 76: FMULq	dis not found

	.word 0xa7504000  ! 77: RDPR_TNPC	<illegal instruction>
	.word 0xb7a5c840  ! 78: FADDd	faddd	%f54, %f0, %f58
	.word 0xa3508000  ! 79: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0xa9a48820  ! 82: FADDs	fadds	%f18, %f0, %f20
	.word 0x85942000  ! 83: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa3a68960  ! 84: FMULq	dis not found

	.word 0x839e6000  ! 85: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819f2000  ! 86: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb5504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0xa9a64920  ! 88: FMULs	fmuls	%f25, %f0, %f20
	.word 0x839fe000  ! 89: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8394e000  ! 90: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x83966000  ! 91: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8794a000  ! 92: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbd508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e000  ! 95: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb3504000  ! 96: RDPR_TNPC	<illegal instruction>
	.word 0x819ea000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xaf508000  ! 98: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 101: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 102: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb9508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 104: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8594e000  ! 105: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x839da000  ! 106: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819de000  ! 107: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d956000  ! 108: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x81952000  ! 109: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x87976000  ! 110: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa1a70920  ! 111: FMULs	fmuls	%f28, %f0, %f16
	.word 0xbba548c0  ! 112: FSUBd	fsubd	%f52, %f0, %f60
	.word 0x819c6000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x839ca000  ! 114: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8397a000  ! 115: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb9a709c0  ! 116: FDIVd	fdivd	%f28, %f0, %f28
	.word 0xb7a54820  ! 117: FADDs	fadds	%f21, %f0, %f27
	.word 0xa3500000  ! 118: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 120: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85956000  ! 121: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d942000  ! 122: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xbda5c920  ! 123: FMULs	fmuls	%f23, %f0, %f30
	.word 0x819e6000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xab50c000  ! 125: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 126: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x85952000  ! 127: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x85952000  ! 128: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa3500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0xb9a6c8e0  ! 130: FSUBq	dis not found

	.word 0x8396e000  ! 131: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x839de000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa950c000  ! 133: RDPR_TT	<illegal instruction>
	.word 0xaf500000  ! 134: RDPR_TPC	<illegal instruction>
	.word 0x8d97a000  ! 135: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xad504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 137: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xab50c000  ! 138: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0x819fe000  ! 140: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xa3a6c840  ! 142: FADDd	faddd	%f58, %f0, %f48
	.word 0x8796e000  ! 143: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x839fa000  ! 144: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa1500000  ! 145: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 146: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839c2000  ! 147: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8795e000  ! 148: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb9500000  ! 149: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 150: FSQRTs	fsqrt	
	.word 0x819c2000  ! 151: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xaf50c000  ! 152: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 153: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x81972000  ! 154: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8796a000  ! 155: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa3a4c840  ! 156: FADDd	faddd	%f50, %f0, %f48
	.word 0xb5504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 159: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbd508000  ! 160: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 161: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d966000  ! 162: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbfa54860  ! 163: FADDq	dis not found

	.word 0xb7508000  ! 164: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 165: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xaba549e0  ! 166: FDIVq	dis not found

	.word 0xa750c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xafa408c0  ! 168: FSUBd	fsubd	%f16, %f0, %f54
	.word 0x819f2000  ! 169: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x85952000  ! 170: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xafa00540  ! 171: FSQRTd	fsqrt	
	.word 0x81952000  ! 172: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x87956000  ! 173: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d962000  ! 174: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83946000  ! 175: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8597a000  ! 176: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa350c000  ! 177: RDPR_TT	<illegal instruction>
	.word 0x839ce000  ! 178: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbf504000  ! 179: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 180: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa3a00560  ! 181: FSQRTq	fsqrt	
	.word 0xbf500000  ! 182: RDPR_TPC	<illegal instruction>
	.word 0xbba54840  ! 183: FADDd	faddd	%f52, %f0, %f60
	.word 0xbfa5c860  ! 184: FADDq	dis not found

	.word 0x8195a000  ! 185: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbd504000  ! 186: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xa7500000  ! 187: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 188: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 189: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83942000  ! 190: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8395e000  ! 191: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xaf504000  ! 192: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 193: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85972000  ! 194: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb3a489c0  ! 195: FDIVd	fdivd	%f18, %f0, %f56
	.word 0x8796e000  ! 196: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x83952000  ! 197: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819e2000  ! 198: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8797e000  ! 199: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d966000  ! 200: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x81956000  ! 201: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x819ce000  ! 202: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81952000  ! 203: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x819d2000  ! 204: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb3a508c0  ! 205: FSUBd	fsubd	%f20, %f0, %f56
	.word 0x8596e000  ! 206: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819ee000  ! 207: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x81976000  ! 208: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839c2000  ! 209: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x85972000  ! 210: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x83972000  ! 211: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa1a449c0  ! 212: FDIVd	fdivd	%f48, %f0, %f16
	.word 0x8196e000  ! 213: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8d952000  ! 214: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8197a000  ! 215: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xab508000  ! 216: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x819c6000  ! 217: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8196a000  ! 218: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x839f2000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8197a000  ! 220: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8794a000  ! 221: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x819ca000  ! 222: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbb504000  ! 223: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 224: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 225: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 228: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8395e000  ! 229: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x819fa000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8397e000  ! 231: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8195e000  ! 232: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa5500000  ! 233: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 234: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x819fa000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa1508000  ! 236: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 237: RDPR_TSTATE	<illegal instruction>
	.word 0x839d2000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa5a54820  ! 239: FADDs	fadds	%f21, %f0, %f18
	.word 0x85966000  ! 240: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb7504000  ! 241: RDPR_TNPC	<illegal instruction>
	.word 0xbda788c0  ! 242: FSUBd	fsubd	%f30, %f0, %f30
	.word 0x81942000  ! 243: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x83962000  ! 244: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb1a70920  ! 245: FMULs	fmuls	%f28, %f0, %f24
	.word 0xa9a00540  ! 246: FSQRTd	fsqrt	
	.word 0xa7500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0x839ce000  ! 248: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839ea000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x87942000  ! 250: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8196a000  ! 251: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbd508000  ! 252: RDPR_TSTATE	<illegal instruction>
	.word 0xada5c920  ! 253: FMULs	fmuls	%f23, %f0, %f22
	.word 0x8395a000  ! 254: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819fa000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb5504000  ! 256: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0xafa00560  ! 258: FSQRTq	fsqrt	
	.word 0xb1504000  ! 259: RDPR_TNPC	<illegal instruction>
	.word 0xb3a588c0  ! 260: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xa550c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0x8d97a000  ! 262: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x81946000  ! 263: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbf508000  ! 264: RDPR_TSTATE	<illegal instruction>
	.word 0x8197e000  ! 265: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x819f2000  ! 266: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839fa000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa350c000  ! 268: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 269: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa7504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 271: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 272: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 273: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb550c000  ! 274: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 275: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 276: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x81946000  ! 277: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xada588e0  ! 278: FSUBq	dis not found

	.word 0xb7508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0x83962000  ! 281: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x83976000  ! 282: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8d94a000  ! 283: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xaf504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 285: RDPR_TPC	<illegal instruction>
	.word 0x839e2000  ! 286: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839e2000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa5508000  ! 288: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8797a000  ! 289: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xab508000  ! 290: RDPR_TSTATE	<illegal instruction>
	.word 0x839d2000  ! 291: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xbba00520  ! 292: FSQRTs	fsqrt	
	.word 0xaba00520  ! 293: FSQRTs	fsqrt	
	.word 0xa9504000  ! 294: RDPR_TNPC	<illegal instruction>
	.word 0xaba4c860  ! 295: FADDq	dis not found

	.word 0x819e6000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x85956000  ! 297: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x87946000  ! 298: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb9a789a0  ! 299: FDIVs	fdivs	%f30, %f0, %f28
	.word 0xad50c000  ! 300: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 301: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d972000  ! 302: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8595e000  ! 303: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7500000  ! 304: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb7504000  ! 305: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 306: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839da000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xbf508000  ! 308: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 309: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x839fe000  ! 310: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819da000  ! 311: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb750c000  ! 312: RDPR_TT	<illegal instruction>
	.word 0x87972000  ! 313: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb5500000  ! 314: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x85976000  ! 316: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbd508000  ! 317: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 318: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819c2000  ! 319: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb5a74940  ! 320: FMULd	fmuld	%f60, %f0, %f26
	.word 0x81962000  ! 321: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb7a00560  ! 322: FSQRTq	fsqrt	
	.word 0xb9508000  ! 323: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 324: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 325: RDPR_TNPC	<illegal instruction>
	.word 0xa7a448e0  ! 326: FSUBq	dis not found

	.word 0x839ca000  ! 327: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x83952000  ! 328: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3a78820  ! 329: FADDs	fadds	%f30, %f0, %f17
	.word 0xbd500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0x819d2000  ! 331: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb150c000  ! 332: RDPR_TT	<illegal instruction>
	.word 0xa3504000  ! 333: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x839ee000  ! 334: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x87976000  ! 335: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa1a70940  ! 336: FMULd	fmuld	%f28, %f0, %f16
	.word 0x8197e000  ! 337: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbfa688c0  ! 338: FSUBd	fsubd	%f26, %f0, %f62
	.word 0xb5a708e0  ! 339: FSUBq	dis not found

	.word 0xb9504000  ! 340: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xaba74960  ! 342: FMULq	dis not found

	.word 0x85962000  ! 343: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819d6000  ! 344: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x87956000  ! 345: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbf504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xbda649a0  ! 347: FDIVs	fdivs	%f25, %f0, %f30
	.word 0x85952000  ! 348: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839ca000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xab500000  ! 350: RDPR_TPC	<illegal instruction>
	.word 0x819d2000  ! 351: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb5a6c820  ! 352: FADDs	fadds	%f27, %f0, %f26
	.word 0x8796e000  ! 353: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb750c000  ! 354: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 355: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d966000  ! 356: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x87956000  ! 357: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa1504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0xa1a789c0  ! 359: FDIVd	fdivd	%f30, %f0, %f16
	.word 0x8397e000  ! 360: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbfa409a0  ! 361: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xa3a00540  ! 362: FSQRTd	fsqrt	
	.word 0x87946000  ! 363: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb3a00540  ! 364: FSQRTd	fsqrt	
	.word 0x8d95a000  ! 365: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa3a00520  ! 366: FSQRTs	fsqrt	
	.word 0xb350c000  ! 367: RDPR_TT	<illegal instruction>
	.word 0xa3a64940  ! 368: FMULd	fmuld	%f56, %f0, %f48
	.word 0xa7500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 371: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xbda708c0  ! 372: FSUBd	fsubd	%f28, %f0, %f30
	.word 0x819c6000  ! 373: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb5500000  ! 374: RDPR_TPC	<illegal instruction>
	.word 0xa9a7c840  ! 375: FADDd	faddd	%f62, %f0, %f20
	.word 0xada5c920  ! 376: FMULs	fmuls	%f23, %f0, %f22
	.word 0x819f2000  ! 377: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8395e000  ! 378: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa9500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 380: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa9a74940  ! 381: FMULd	fmuld	%f60, %f0, %f20
	.word 0x819f2000  ! 382: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x85976000  ! 383: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb150c000  ! 384: RDPR_TT	<illegal instruction>
	.word 0xa1a648a0  ! 385: FSUBs	fsubs	%f25, %f0, %f16
	.word 0x8596e000  ! 386: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xaba50940  ! 387: FMULd	fmuld	%f20, %f0, %f52
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xb9a58960  ! 389: FMULq	dis not found

	.word 0xb3504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 391: RDPR_TPC	<illegal instruction>
	.word 0xaba60940  ! 392: FMULd	fmuld	%f24, %f0, %f52
	.word 0x819da000  ! 393: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa5500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 395: RDPR_TNPC	<illegal instruction>
	.word 0xa3a40920  ! 396: FMULs	fmuls	%f16, %f0, %f17
	.word 0xada548c0  ! 397: FSUBd	fsubd	%f52, %f0, %f22
	.word 0xb150c000  ! 398: RDPR_TT	<illegal instruction>
	.word 0xa3504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 400: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 401: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x8794a000  ! 403: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb3508000  ! 404: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839f6000  ! 407: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819ca000  ! 408: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5504000  ! 409: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 410: RDPR_TNPC	<illegal instruction>
	.word 0x819fe000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb1a4c960  ! 412: FMULq	dis not found

	.word 0xb7508000  ! 413: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 414: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 415: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xad504000  ! 416: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 418: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x85942000  ! 422: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x81962000  ! 423: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb950c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xb3a7c820  ! 425: FADDs	fadds	%f31, %f0, %f25
	.word 0xab500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 427: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8796a000  ! 428: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1a709e0  ! 429: FDIVq	dis not found

	.word 0xa150c000  ! 430: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 432: RDPR_TT	<illegal instruction>
	.word 0x839ee000  ! 433: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x819d6000  ! 434: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8796e000  ! 435: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x819d2000  ! 436: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb9504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x819e6000  ! 438: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8794e000  ! 439: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x87952000  ! 440: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d966000  ! 441: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa9500000  ! 442: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xada54820  ! 443: FADDs	fadds	%f21, %f0, %f22
	.word 0x8d956000  ! 444: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa1a00540  ! 445: FSQRTd	fsqrt	
	.word 0x819e6000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbb500000  ! 447: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 448: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d94e000  ! 449: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ee000  ! 450: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xada508a0  ! 451: FSUBs	fsubs	%f20, %f0, %f22
	.word 0xa9a7c9a0  ! 452: FDIVs	fdivs	%f31, %f0, %f20
	.word 0xa3500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0xa1504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0xaba5c9c0  ! 455: FDIVd	fdivd	%f54, %f0, %f52
	.word 0xb550c000  ! 456: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 457: RDPR_TNPC	<illegal instruction>
	.word 0xada409e0  ! 458: FDIVq	dis not found

	.word 0x839c2000  ! 459: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8797e000  ! 460: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa1500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 462: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819ce000  ! 463: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xaba6c940  ! 464: FMULd	fmuld	%f58, %f0, %f52
	.word 0xa1504000  ! 465: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x8d952000  ! 466: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8d95a000  ! 467: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x87942000  ! 468: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xaf508000  ! 469: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 470: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 471: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbf508000  ! 472: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a689e0  ! 473: FDIVq	dis not found

	.word 0xad50c000  ! 474: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 475: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa5508000  ! 476: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xb7504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 479: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 480: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 481: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 482: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x81942000  ! 483: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8394e000  ! 484: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb5504000  ! 485: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 486: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 487: RDPR_TPC	<illegal instruction>
	.word 0x8d946000  ! 488: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb750c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 490: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8195a000  ! 491: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb3a749a0  ! 492: FDIVs	fdivs	%f29, %f0, %f25
	.word 0x81942000  ! 493: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa3508000  ! 494: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8d966000  ! 495: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8d96e000  ! 496: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8d946000  ! 497: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb1504000  ! 498: RDPR_TNPC	<illegal instruction>
	.word 0xa1508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a00540  ! 501: FSQRTd	fsqrt	
	.word 0x819f2000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x819d2000  ! 503: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa5a548e0  ! 504: FSUBq	dis not found

	.word 0x8194a000  ! 505: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x87966000  ! 506: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x85942000  ! 507: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbb504000  ! 508: RDPR_TNPC	<illegal instruction>
	.word 0x839e2000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x81942000  ! 510: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xad50c000  ! 511: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 512: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa5504000  ! 513: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 514: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 515: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa1508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94a000  ! 517: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839d2000  ! 518: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x85976000  ! 519: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa9a00520  ! 520: FSQRTs	fsqrt	
	.word 0x85956000  ! 521: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb3a7c9e0  ! 522: FDIVq	dis not found

	.word 0xa9504000  ! 523: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 524: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 526: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa7a64840  ! 527: FADDd	faddd	%f56, %f0, %f50
	.word 0x8794a000  ! 528: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbf500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 530: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb3508000  ! 531: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96e000  ! 532: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb9a448e0  ! 533: FSUBq	dis not found

	.word 0xb3504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x839d6000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa1a64860  ! 536: FADDq	dis not found

	.word 0xa7a548c0  ! 537: FSUBd	fsubd	%f52, %f0, %f50
	.word 0xafa00540  ! 538: FSQRTd	fsqrt	
	.word 0xa5500000  ! 539: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 540: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 541: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb5a4c8e0  ! 542: FSUBq	dis not found

	.word 0xa3a4c8e0  ! 543: FSUBq	dis not found

	.word 0x85972000  ! 544: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb350c000  ! 545: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xa9a5c8c0  ! 547: FSUBd	fsubd	%f54, %f0, %f20
	.word 0xa9a58840  ! 548: FADDd	faddd	%f22, %f0, %f20
	.word 0xb5a648a0  ! 549: FSUBs	fsubs	%f25, %f0, %f26
	.word 0x87942000  ! 550: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbd50c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0xa5a54940  ! 552: FMULd	fmuld	%f52, %f0, %f18
	.word 0x819d6000  ! 553: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa9a508e0  ! 554: FSUBq	dis not found

	.word 0xad504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 557: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa550c000  ! 558: RDPR_TT	rdpr	%tt, %r18
	.word 0x839fe000  ! 559: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa5a748e0  ! 560: FSUBq	dis not found

	.word 0xb3508000  ! 561: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 562: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 563: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x819de000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x819ea000  ! 565: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8395a000  ! 566: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x839ce000  ! 567: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb5504000  ! 568: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xb5a449e0  ! 569: FDIVq	dis not found

	.word 0x85956000  ! 570: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x839ce000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8396a000  ! 572: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819c6000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xaf508000  ! 574: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x839de000  ! 575: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819f2000  ! 576: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d97a000  ! 577: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb1500000  ! 578: RDPR_TPC	<illegal instruction>
	.word 0xb9a58960  ! 579: FMULq	dis not found

	.word 0xa5a788a0  ! 580: FSUBs	fsubs	%f30, %f0, %f18
	.word 0x819fe000  ! 581: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3508000  ! 582: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 583: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xbd500000  ! 585: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 586: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85976000  ! 587: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbf508000  ! 588: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0x87966000  ! 590: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xaba00560  ! 591: FSQRTq	fsqrt	
	.word 0xa350c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 594: RDPR_TPC	<illegal instruction>
	.word 0xb5a7c8e0  ! 595: FSUBq	dis not found

	.word 0xb9500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0x8394a000  ! 597: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x83976000  ! 598: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbf50c000  ! 599: RDPR_TT	rdpr	%tt, %r31
	.word 0x87976000  ! 600: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb1504000  ! 601: RDPR_TNPC	<illegal instruction>
	.word 0x819e6000  ! 602: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8596e000  ! 603: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819c2000  ! 604: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa9a748e0  ! 605: FSUBq	dis not found

	.word 0x8d942000  ! 606: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8194a000  ! 607: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819e2000  ! 608: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa7504000  ! 609: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x85952000  ! 610: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8197a000  ! 611: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8d946000  ! 612: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xaf504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0xa9500000  ! 614: RDPR_TPC	<illegal instruction>
	.word 0xa950c000  ! 615: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 616: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839fe000  ! 617: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xad50c000  ! 618: RDPR_TT	<illegal instruction>
	.word 0xbf504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 620: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xb7504000  ! 622: RDPR_TNPC	<illegal instruction>
	.word 0x839f2000  ! 623: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb9a689e0  ! 624: FDIVq	dis not found

	.word 0x819fa000  ! 625: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa5508000  ! 626: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0xbba508e0  ! 629: FSUBq	dis not found

	.word 0x83946000  ! 630: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa750c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xb3a7c9a0  ! 632: FDIVs	fdivs	%f31, %f0, %f25
	.word 0x87972000  ! 633: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8394e000  ! 634: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x87952000  ! 635: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d95e000  ! 636: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8194a000  ! 637: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb5508000  ! 638: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00520  ! 639: FSQRTs	fsqrt	
	.word 0x8d95a000  ! 640: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819c6000  ! 641: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb7a548e0  ! 642: FSUBq	dis not found

	.word 0xb350c000  ! 643: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 644: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb504000  ! 645: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 647: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb5504000  ! 648: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 649: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0x839d6000  ! 651: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8795a000  ! 652: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb1a5c9c0  ! 653: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xaba68820  ! 654: FADDs	fadds	%f26, %f0, %f21
	.word 0x85942000  ! 655: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8794e000  ! 656: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb7a70820  ! 657: FADDs	fadds	%f28, %f0, %f27
	.word 0x87976000  ! 658: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xaf50c000  ! 659: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xa3a00560  ! 661: FSQRTq	fsqrt	
	.word 0xaf500000  ! 662: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 663: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 664: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0x8d95e000  ! 666: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8396e000  ! 667: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa3508000  ! 668: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 669: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x87942000  ! 670: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb5a488c0  ! 671: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xb3500000  ! 672: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 673: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x83976000  ! 674: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8595e000  ! 675: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa7504000  ! 676: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 677: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839da000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8d95a000  ! 679: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa5500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 681: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 682: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xad508000  ! 683: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a6c9e0  ! 684: FDIVq	dis not found

	.word 0x8396a000  ! 685: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839e2000  ! 686: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8196a000  ! 687: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85952000  ! 688: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbb504000  ! 689: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb9508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb1508000  ! 692: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 693: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 694: RDPR_TPC	<illegal instruction>
	.word 0xb7504000  ! 695: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 696: RDPR_TNPC	<illegal instruction>
	.word 0x819d2000  ! 697: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbba50920  ! 698: FMULs	fmuls	%f20, %f0, %f29
	.word 0xab500000  ! 699: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xa7a4c9c0  ! 700: FDIVd	fdivd	%f50, %f0, %f50
	.word 0xafa608a0  ! 701: FSUBs	fsubs	%f24, %f0, %f23
	.word 0x8397a000  ! 702: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb5a54820  ! 703: FADDs	fadds	%f21, %f0, %f26
	.word 0x83972000  ! 704: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbf508000  ! 705: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 706: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa5a4c9a0  ! 707: FDIVs	fdivs	%f19, %f0, %f18
	.word 0xa9a7c9e0  ! 708: FDIVq	dis not found

	.word 0xbd504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0x8595e000  ! 710: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7504000  ! 711: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 712: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8596e000  ! 713: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819e2000  ! 714: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa5a788a0  ! 715: FSUBs	fsubs	%f30, %f0, %f18
	.word 0x8d94a000  ! 716: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8d956000  ! 717: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbb504000  ! 718: RDPR_TNPC	<illegal instruction>
	.word 0xb7a74860  ! 719: FADDq	dis not found

	.word 0xa5508000  ! 720: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xbfa688e0  ! 722: FSUBq	dis not found

	.word 0xb9500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x839fa000  ! 725: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819ee000  ! 726: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb3508000  ! 727: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa00520  ! 728: FSQRTs	fsqrt	
	.word 0x8d952000  ! 729: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xada4c8a0  ! 730: FSUBs	fsubs	%f19, %f0, %f22
	.word 0xada448e0  ! 731: FSUBq	dis not found

	.word 0xbb504000  ! 732: RDPR_TNPC	<illegal instruction>
	.word 0xada00540  ! 733: FSQRTd	fsqrt	
	.word 0xa1504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 736: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 738: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa5500000  ! 739: RDPR_TPC	<illegal instruction>
	.word 0x8d962000  ! 740: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83946000  ! 741: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbba54860  ! 742: FADDq	dis not found

	.word 0x8d95a000  ! 743: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa950c000  ! 744: RDPR_TT	<illegal instruction>
	.word 0x839ca000  ! 745: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb3a64820  ! 746: FADDs	fadds	%f25, %f0, %f25
	.word 0x85962000  ! 747: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8d96e000  ! 748: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8d97a000  ! 749: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb9500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 752: RDPR_TNPC	<illegal instruction>
	.word 0xb5a44920  ! 753: FMULs	fmuls	%f17, %f0, %f26
	.word 0x819d6000  ! 754: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xbba74940  ! 755: FMULd	fmuld	%f60, %f0, %f60
	.word 0xb750c000  ! 756: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a50920  ! 759: FMULs	fmuls	%f20, %f0, %f25
	.word 0x8797a000  ! 760: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa3a00540  ! 761: FSQRTd	fsqrt	
	.word 0x83956000  ! 762: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x819d2000  ! 763: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa5504000  ! 764: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 765: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x87942000  ! 766: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x87956000  ! 767: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x839d6000  ! 768: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb5504000  ! 769: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x87972000  ! 771: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839ee000  ! 772: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x819d6000  ! 773: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa5504000  ! 774: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 775: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x81952000  ! 777: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8797a000  ! 778: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb3a6c940  ! 779: FMULd	fmuld	%f58, %f0, %f56
	.word 0x8196a000  ! 780: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x83946000  ! 781: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83946000  ! 782: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbb504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 785: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8d96a000  ! 786: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x85942000  ! 787: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819ee000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa7508000  ! 789: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 790: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d942000  ! 791: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8596a000  ! 792: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x839fe000  ! 793: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb1a00540  ! 794: FSQRTd	fsqrt	
	.word 0xb9500000  ! 795: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 796: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbfa00520  ! 797: FSQRTs	fsqrt	
	.word 0xbd504000  ! 798: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 799: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb1500000  ! 800: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 802: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839ce000  ! 803: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x87962000  ! 804: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x839fe000  ! 805: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xada54940  ! 806: FMULd	fmuld	%f52, %f0, %f22
	.word 0xafa508c0  ! 807: FSUBd	fsubd	%f20, %f0, %f54
	.word 0xa5a00520  ! 808: FSQRTs	fsqrt	
	.word 0x8d976000  ! 809: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xab504000  ! 810: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xaf50c000  ! 811: RDPR_TT	<illegal instruction>
	.word 0xada509c0  ! 812: FDIVd	fdivd	%f20, %f0, %f22
	.word 0xb9a7c940  ! 813: FMULd	fmuld	%f62, %f0, %f28
	.word 0x839d6000  ! 814: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8194a000  ! 815: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d95a000  ! 816: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb9a44860  ! 817: FADDq	dis not found

	.word 0xb7a749a0  ! 818: FDIVs	fdivs	%f29, %f0, %f27
	.word 0xbd50c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0x819da000  ! 820: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb1504000  ! 821: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 822: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x81942000  ! 823: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbf504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 825: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa7508000  ! 826: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x819e6000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x85972000  ! 828: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x819ca000  ! 829: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xad504000  ! 830: RDPR_TNPC	<illegal instruction>
	.word 0x819f2000  ! 831: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbb508000  ! 832: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 833: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb5a74960  ! 834: FMULq	dis not found

	.word 0xa9500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 836: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 838: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xbb508000  ! 839: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 840: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 842: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 843: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839f2000  ! 844: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8d946000  ! 845: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa7a748e0  ! 846: FSUBq	dis not found

	.word 0x8797a000  ! 847: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x839ca000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xaf50c000  ! 849: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 850: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x839f6000  ! 852: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8395a000  ! 853: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xab504000  ! 854: RDPR_TNPC	<illegal instruction>
	.word 0xb5a7c8c0  ! 855: FSUBd	fsubd	%f62, %f0, %f26
	.word 0xa3a748a0  ! 856: FSUBs	fsubs	%f29, %f0, %f17
	.word 0xb3a748a0  ! 857: FSUBs	fsubs	%f29, %f0, %f25
	.word 0xa1500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0xb7a649c0  ! 859: FDIVd	fdivd	%f56, %f0, %f58
	.word 0x819fa000  ! 860: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x819ea000  ! 861: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa7a74960  ! 862: FMULq	dis not found

	.word 0x839ce000  ! 863: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d95e000  ! 864: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbd50c000  ! 865: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 866: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 867: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 868: RDPR_TNPC	<illegal instruction>
	.word 0x8d972000  ! 869: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8d972000  ! 870: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8595e000  ! 871: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa350c000  ! 872: RDPR_TT	rdpr	%tt, %r17
	.word 0x839ce000  ! 873: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839de000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa5a7c920  ! 875: FMULs	fmuls	%f31, %f0, %f18
	.word 0xada70860  ! 876: FADDq	dis not found

	.word 0x83972000  ! 877: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb750c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8796e000  ! 881: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x819fe000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbb504000  ! 883: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 885: RDPR_TNPC	<illegal instruction>
	.word 0x8d96e000  ! 886: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8397a000  ! 887: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8597e000  ! 888: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa150c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xaba60860  ! 890: FADDq	dis not found

	.word 0x8396e000  ! 891: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x83976000  ! 892: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xaf504000  ! 893: RDPR_TNPC	<illegal instruction>
	.word 0xa1a4c9e0  ! 894: FDIVq	dis not found

	.word 0xb5500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xa7508000  ! 896: RDPR_TSTATE	<illegal instruction>
	.word 0xbda5c960  ! 897: FMULq	dis not found

	.word 0x81946000  ! 898: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8d942000  ! 899: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb3500000  ! 900: RDPR_TPC	<illegal instruction>
	.word 0xa3a589a0  ! 901: FDIVs	fdivs	%f22, %f0, %f17
	.word 0xb1a70860  ! 902: FADDq	dis not found

	.word 0x839e6000  ! 903: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xada00520  ! 904: FSQRTs	fsqrt	
	.word 0x8594a000  ! 905: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa5508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 907: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbf500000  ! 908: RDPR_TPC	<illegal instruction>
	.word 0xa3a64940  ! 909: FMULd	fmuld	%f56, %f0, %f48
	.word 0x8396e000  ! 910: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa5504000  ! 911: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x819ce000  ! 913: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x819c2000  ! 914: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x819fe000  ! 915: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbfa00520  ! 916: FSQRTs	fsqrt	
	.word 0x8394e000  ! 917: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbfa60940  ! 918: FMULd	fmuld	%f24, %f0, %f62
	.word 0xa1a489a0  ! 919: FDIVs	fdivs	%f18, %f0, %f16
	.word 0xbba5c840  ! 920: FADDd	faddd	%f54, %f0, %f60
	.word 0xa9508000  ! 921: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 922: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819fa000  ! 923: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa5504000  ! 924: RDPR_TNPC	<illegal instruction>
	.word 0xbba748a0  ! 925: FSUBs	fsubs	%f29, %f0, %f29
	.word 0xbd50c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 927: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8396e000  ! 928: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8595e000  ! 929: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xad504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xada50840  ! 932: FADDd	faddd	%f20, %f0, %f22
	.word 0xb350c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xa1a5c820  ! 934: FADDs	fadds	%f23, %f0, %f16
	.word 0xab508000  ! 935: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 936: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8595a000  ! 937: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa9a548c0  ! 938: FSUBd	fsubd	%f52, %f0, %f20
	.word 0x87972000  ! 939: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x83952000  ! 940: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x839e6000  ! 941: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbb50c000  ! 942: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d96a000  ! 944: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xaf50c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 946: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbfa78860  ! 947: FADDq	dis not found

	.word 0x819f2000  ! 948: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb950c000  ! 949: RDPR_TT	<illegal instruction>
	.word 0xbba6c8c0  ! 950: FSUBd	fsubd	%f58, %f0, %f60
	.word 0xa5500000  ! 951: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xa1504000  ! 953: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 954: RDPR_TT	<illegal instruction>
	.word 0x819d6000  ! 955: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x819f2000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb3504000  ! 957: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb3a50820  ! 958: FADDs	fadds	%f20, %f0, %f25
	.word 0x819e2000  ! 959: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x83946000  ! 960: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb7500000  ! 961: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 963: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xad508000  ! 964: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 965: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85972000  ! 966: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xad50c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 968: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839ce000  ! 969: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8596a000  ! 970: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8594a000  ! 971: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x819f6000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbd508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 974: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb7a649c0  ! 975: FDIVd	fdivd	%f56, %f0, %f58
	.word 0x8194e000  ! 976: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xaf500000  ! 977: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 978: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa9504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xb3a549a0  ! 980: FDIVs	fdivs	%f21, %f0, %f25
	.word 0x87946000  ! 981: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d97a000  ! 982: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x839c6000  ! 983: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819f6000  ! 984: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8596e000  ! 985: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8397a000  ! 986: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819d2000  ! 987: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xaf508000  ! 988: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a44940  ! 989: FMULd	fmuld	%f48, %f0, %f50
	.word 0xa1a68820  ! 990: FADDs	fadds	%f26, %f0, %f16
	.word 0x8d962000  ! 991: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa950c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0x8d97a000  ! 993: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb1508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 995: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa7a00520  ! 996: FSQRTs	fsqrt	
	.word 0x819e6000  ! 997: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8196e000  ! 998: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
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
	.word 0xa1504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0xa3508000  ! 2: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 3: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 4: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb5504000  ! 5: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 6: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8794a000  ! 7: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x83942000  ! 8: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839ca000  ! 9: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa7508000  ! 10: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e000  ! 11: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa750c000  ! 12: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 13: RDPR_TT	<illegal instruction>
	.word 0x8595e000  ! 14: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8196a000  ! 15: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xada58960  ! 16: FMULq	dis not found

	.word 0xb7a489e0  ! 17: FDIVq	dis not found

	.word 0x8396a000  ! 18: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x87962000  ! 19: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa5504000  ! 20: RDPR_TNPC	<illegal instruction>
	.word 0xb1a709e0  ! 21: FDIVq	dis not found

	.word 0xa9504000  ! 22: RDPR_TNPC	<illegal instruction>
	.word 0xa7a6c860  ! 23: FADDq	dis not found

	.word 0x839fe000  ! 24: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb3500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xbd504000  ! 26: RDPR_TNPC	<illegal instruction>
	.word 0x839f2000  ! 27: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x83966000  ! 28: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819ca000  ! 29: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8394a000  ! 30: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbf500000  ! 31: RDPR_TPC	<illegal instruction>
	.word 0xb9a708a0  ! 32: FSUBs	fsubs	%f28, %f0, %f28
	.word 0x8797a000  ! 33: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x85942000  ! 34: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xafa548e0  ! 35: FSUBq	dis not found

	.word 0x8796e000  ! 36: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x819fe000  ! 37: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x81962000  ! 38: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8195a000  ! 39: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8d94e000  ! 40: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xafa64920  ! 41: FMULs	fmuls	%f25, %f0, %f23
	.word 0x839fa000  ! 42: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839c2000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa1a708e0  ! 44: FSUBq	dis not found

	.word 0x8597e000  ! 45: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa9504000  ! 46: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 47: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa550c000  ! 48: RDPR_TT	<illegal instruction>
	.word 0x85972000  ! 49: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8397a000  ! 50: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839e2000  ! 51: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x81966000  ! 52: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xaf50c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 54: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8794a000  ! 55: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa9508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 57: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa5504000  ! 58: RDPR_TNPC	<illegal instruction>
	.word 0xa3a589c0  ! 59: FDIVd	fdivd	%f22, %f0, %f48
	.word 0xb550c000  ! 60: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 61: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb3500000  ! 62: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 63: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 64: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x83942000  ! 65: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8196a000  ! 66: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xab50c000  ! 67: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 68: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 69: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 70: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819fe000  ! 71: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbd500000  ! 72: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 73: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x839f6000  ! 74: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8797e000  ! 75: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xada40960  ! 76: FMULq	dis not found

	.word 0xaf504000  ! 77: RDPR_TNPC	<illegal instruction>
	.word 0xbfa58840  ! 78: FADDd	faddd	%f22, %f0, %f62
	.word 0xaf508000  ! 79: RDPR_TSTATE	<illegal instruction>
	.word 0xab504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0xb5a7c820  ! 82: FADDs	fadds	%f31, %f0, %f26
	.word 0x85962000  ! 83: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbda5c960  ! 84: FMULq	dis not found

	.word 0x839fa000  ! 85: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819da000  ! 86: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb9504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0xa7a44920  ! 88: FMULs	fmuls	%f17, %f0, %f19
	.word 0x839ea000  ! 89: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x83952000  ! 90: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x83976000  ! 91: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8797e000  ! 92: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 94: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 95: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb3504000  ! 96: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 97: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa1508000  ! 98: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 99: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 101: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 102: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb3508000  ! 103: RDPR_TSTATE	<illegal instruction>
	.word 0x8394a000  ! 104: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8597a000  ! 105: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839fe000  ! 106: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819d6000  ! 107: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d976000  ! 108: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8194a000  ! 109: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8796a000  ! 110: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa3a4c920  ! 111: FMULs	fmuls	%f19, %f0, %f17
	.word 0xa1a488c0  ! 112: FSUBd	fsubd	%f18, %f0, %f16
	.word 0x819e6000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x839c2000  ! 114: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x83946000  ! 115: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb7a489c0  ! 116: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xa3a50820  ! 117: FADDs	fadds	%f20, %f0, %f17
	.word 0xb7500000  ! 118: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 119: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 120: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x85952000  ! 121: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8d94a000  ! 122: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa7a50920  ! 123: FMULs	fmuls	%f20, %f0, %f19
	.word 0x819fe000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbf50c000  ! 125: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 126: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x85966000  ! 127: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8595e000  ! 128: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0xa1a708e0  ! 130: FSUBq	dis not found

	.word 0x83976000  ! 131: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839ce000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb950c000  ! 133: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 134: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 135: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb9504000  ! 136: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 137: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbf50c000  ! 138: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0x819de000  ! 140: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xb3504000  ! 141: RDPR_TNPC	<illegal instruction>
	.word 0xb9a54840  ! 142: FADDd	faddd	%f52, %f0, %f28
	.word 0x87956000  ! 143: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x839f6000  ! 144: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa5500000  ! 145: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 146: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839ca000  ! 147: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8796e000  ! 148: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xaf500000  ! 149: RDPR_TPC	<illegal instruction>
	.word 0xb1a00520  ! 150: FSQRTs	fsqrt	
	.word 0x819d6000  ! 151: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa350c000  ! 152: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 153: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x81972000  ! 154: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x87972000  ! 155: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xada50840  ! 156: FADDd	faddd	%f20, %f0, %f22
	.word 0xaf504000  ! 157: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 158: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 159: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbf508000  ! 160: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 161: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d94a000  ! 162: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xada60860  ! 163: FADDq	dis not found

	.word 0xbd508000  ! 164: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 165: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xaba709e0  ! 166: FDIVq	dis not found

	.word 0xbf50c000  ! 167: RDPR_TT	<illegal instruction>
	.word 0xada6c8c0  ! 168: FSUBd	fsubd	%f58, %f0, %f22
	.word 0x819ca000  ! 169: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8595a000  ! 170: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbba00540  ! 171: FSQRTd	fsqrt	
	.word 0x8195a000  ! 172: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x87966000  ! 173: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8d94e000  ! 174: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8397e000  ! 175: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8596a000  ! 176: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbd50c000  ! 177: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 178: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xaf504000  ! 179: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 180: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb7a00560  ! 181: FSQRTq	fsqrt	
	.word 0xa3500000  ! 182: RDPR_TPC	<illegal instruction>
	.word 0xbda7c840  ! 183: FADDd	faddd	%f62, %f0, %f30
	.word 0xaba60860  ! 184: FADDq	dis not found

	.word 0x81976000  ! 185: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa3504000  ! 186: RDPR_TNPC	<illegal instruction>
	.word 0xaf500000  ! 187: RDPR_TPC	<illegal instruction>
	.word 0xbd508000  ! 188: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 189: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x83966000  ! 190: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x83952000  ! 191: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb7504000  ! 192: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 193: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8597e000  ! 194: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbda689c0  ! 195: FDIVd	fdivd	%f26, %f0, %f30
	.word 0x87942000  ! 196: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8395a000  ! 197: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819ca000  ! 198: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x87976000  ! 199: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d956000  ! 200: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x81972000  ! 201: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819ce000  ! 202: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81946000  ! 203: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819fe000  ! 204: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb1a788c0  ! 205: FSUBd	fsubd	%f30, %f0, %f24
	.word 0x85962000  ! 206: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819f6000  ! 207: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x81956000  ! 208: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839d2000  ! 209: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8595e000  ! 210: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x83956000  ! 211: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb9a4c9c0  ! 212: FDIVd	fdivd	%f50, %f0, %f28
	.word 0x81956000  ! 213: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8d972000  ! 214: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8196e000  ! 215: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa3508000  ! 216: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 217: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81962000  ! 218: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839c6000  ! 219: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x81962000  ! 220: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8797a000  ! 221: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x819ea000  ! 222: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xaf504000  ! 223: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 224: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 225: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb9504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 227: RDPR_TNPC	<illegal instruction>
	.word 0x8595e000  ! 228: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8397a000  ! 229: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819f6000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x83972000  ! 231: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8196a000  ! 232: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbd500000  ! 233: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 234: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819ee000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xbb508000  ! 236: RDPR_TSTATE	<illegal instruction>
	.word 0xb3508000  ! 237: RDPR_TSTATE	<illegal instruction>
	.word 0x839f2000  ! 238: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa9a74820  ! 239: FADDs	fadds	%f29, %f0, %f20
	.word 0x85942000  ! 240: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbb504000  ! 241: RDPR_TNPC	<illegal instruction>
	.word 0xbfa748c0  ! 242: FSUBd	fsubd	%f60, %f0, %f62
	.word 0x81976000  ! 243: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8397a000  ! 244: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbfa64920  ! 245: FMULs	fmuls	%f25, %f0, %f31
	.word 0xada00540  ! 246: FSQRTd	fsqrt	
	.word 0xa7500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0x839ea000  ! 248: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x839c2000  ! 249: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x87956000  ! 250: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8196a000  ! 251: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa1508000  ! 252: RDPR_TSTATE	<illegal instruction>
	.word 0xafa6c920  ! 253: FMULs	fmuls	%f27, %f0, %f23
	.word 0x83942000  ! 254: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x819ee000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb3504000  ! 256: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 257: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a00560  ! 258: FSQRTq	fsqrt	
	.word 0xa1504000  ! 259: RDPR_TNPC	<illegal instruction>
	.word 0xa7a4c8c0  ! 260: FSUBd	fsubd	%f50, %f0, %f50
	.word 0xb150c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 262: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x81962000  ! 263: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb1508000  ! 264: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 265: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x819fe000  ! 266: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839da000  ! 267: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa150c000  ! 268: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 269: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xad504000  ! 270: RDPR_TNPC	<illegal instruction>
	.word 0xa3500000  ! 271: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 272: RDPR_TNPC	<illegal instruction>
	.word 0x8195a000  ! 273: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb150c000  ! 274: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 275: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 276: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8196e000  ! 277: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbfa6c8e0  ! 278: FSUBq	dis not found

	.word 0xaf508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 280: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 281: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8396a000  ! 282: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8d96e000  ! 283: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xaf504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 285: RDPR_TPC	<illegal instruction>
	.word 0x839f2000  ! 286: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x839c2000  ! 287: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb1508000  ! 288: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 289: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xaf508000  ! 290: RDPR_TSTATE	<illegal instruction>
	.word 0x839ca000  ! 291: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb7a00520  ! 292: FSQRTs	fsqrt	
	.word 0xa9a00520  ! 293: FSQRTs	fsqrt	
	.word 0xa3504000  ! 294: RDPR_TNPC	<illegal instruction>
	.word 0xbfa68860  ! 295: FADDq	dis not found

	.word 0x819fe000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8594e000  ! 297: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87976000  ! 298: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xaba749a0  ! 299: FDIVs	fdivs	%f29, %f0, %f21
	.word 0xb150c000  ! 300: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 301: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8d96a000  ! 302: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x85976000  ! 303: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb7500000  ! 304: RDPR_TPC	<illegal instruction>
	.word 0xa7504000  ! 305: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 306: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x839fe000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xaf508000  ! 308: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 309: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x839fe000  ! 310: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819fe000  ! 311: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb350c000  ! 312: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 313: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xaf500000  ! 314: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x85942000  ! 316: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbb508000  ! 317: RDPR_TSTATE	<illegal instruction>
	.word 0x839fe000  ! 318: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819ea000  ! 319: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbfa78940  ! 320: FMULd	fmuld	%f30, %f0, %f62
	.word 0x81962000  ! 321: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa7a00560  ! 322: FSQRTq	fsqrt	
	.word 0xb3508000  ! 323: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 324: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 325: RDPR_TNPC	<illegal instruction>
	.word 0xbda648e0  ! 326: FSUBq	dis not found

	.word 0x839de000  ! 327: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8396a000  ! 328: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbba48820  ! 329: FADDs	fadds	%f18, %f0, %f29
	.word 0xb5500000  ! 330: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 331: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa150c000  ! 332: RDPR_TT	<illegal instruction>
	.word 0xaf504000  ! 333: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 334: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x87952000  ! 335: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa3a50940  ! 336: FMULd	fmuld	%f20, %f0, %f48
	.word 0x81972000  ! 337: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb7a748c0  ! 338: FSUBd	fsubd	%f60, %f0, %f58
	.word 0xa1a4c8e0  ! 339: FSUBq	dis not found

	.word 0xab504000  ! 340: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xa1a40960  ! 342: FMULq	dis not found

	.word 0x85976000  ! 343: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819e2000  ! 344: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8796e000  ! 345: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbf504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0xb3a789a0  ! 347: FDIVs	fdivs	%f30, %f0, %f25
	.word 0x85976000  ! 348: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839da000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa1500000  ! 350: RDPR_TPC	<illegal instruction>
	.word 0x819ca000  ! 351: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbda50820  ! 352: FADDs	fadds	%f20, %f0, %f30
	.word 0x87956000  ! 353: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbf50c000  ! 354: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 355: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d97a000  ! 356: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x87942000  ! 357: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xad504000  ! 358: RDPR_TNPC	<illegal instruction>
	.word 0xa9a4c9c0  ! 359: FDIVd	fdivd	%f50, %f0, %f20
	.word 0x83952000  ! 360: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3a749a0  ! 361: FDIVs	fdivs	%f29, %f0, %f17
	.word 0xafa00540  ! 362: FSQRTd	fsqrt	
	.word 0x87956000  ! 363: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb7a00540  ! 364: FSQRTd	fsqrt	
	.word 0x8d97e000  ! 365: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb3a00520  ! 366: FSQRTs	fsqrt	
	.word 0xa350c000  ! 367: RDPR_TT	<illegal instruction>
	.word 0xa5a40940  ! 368: FMULd	fmuld	%f16, %f0, %f18
	.word 0xb7500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 370: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 371: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb3a4c8c0  ! 372: FSUBd	fsubd	%f50, %f0, %f56
	.word 0x819f6000  ! 373: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb7500000  ! 374: RDPR_TPC	<illegal instruction>
	.word 0xb9a50840  ! 375: FADDd	faddd	%f20, %f0, %f28
	.word 0xb1a5c920  ! 376: FMULs	fmuls	%f23, %f0, %f24
	.word 0x819e6000  ! 377: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x83942000  ! 378: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xaf500000  ! 379: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 380: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbda40940  ! 381: FMULd	fmuld	%f16, %f0, %f30
	.word 0x819d6000  ! 382: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x85976000  ! 383: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb750c000  ! 384: RDPR_TT	<illegal instruction>
	.word 0xb9a6c8a0  ! 385: FSUBs	fsubs	%f27, %f0, %f28
	.word 0x85966000  ! 386: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xada6c940  ! 387: FMULd	fmuld	%f58, %f0, %f22
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0xa9a4c960  ! 389: FMULq	dis not found

	.word 0xab504000  ! 390: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 391: RDPR_TPC	<illegal instruction>
	.word 0xa1a48940  ! 392: FMULd	fmuld	%f18, %f0, %f16
	.word 0x819e6000  ! 393: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa3500000  ! 394: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 395: RDPR_TNPC	<illegal instruction>
	.word 0xbda54920  ! 396: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb9a588c0  ! 397: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xa950c000  ! 398: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 399: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 400: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 401: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 403: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa7508000  ! 404: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0x819ca000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x839c2000  ! 407: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819fe000  ! 408: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1504000  ! 409: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 410: RDPR_TNPC	<illegal instruction>
	.word 0x819e2000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa1a70960  ! 412: FMULq	dis not found

	.word 0xaf508000  ! 413: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 414: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 415: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb9504000  ! 416: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 417: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 418: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 419: RDPR_TSTATE	<illegal instruction>
	.word 0xbf500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xab50c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 422: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8194a000  ! 423: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xaf50c000  ! 424: RDPR_TT	<illegal instruction>
	.word 0xb7a60820  ! 425: FADDs	fadds	%f24, %f0, %f27
	.word 0xad500000  ! 426: RDPR_TPC	<illegal instruction>
	.word 0x8195e000  ! 427: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8796e000  ! 428: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xaba749e0  ! 429: FDIVq	dis not found

	.word 0xbd50c000  ! 430: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xbd50c000  ! 432: RDPR_TT	<illegal instruction>
	.word 0x839d2000  ! 433: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x819c2000  ! 434: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x87976000  ! 435: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x819c6000  ! 436: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb5504000  ! 437: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 438: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x87942000  ! 439: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8797e000  ! 440: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d96a000  ! 441: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xab500000  ! 442: RDPR_TPC	<illegal instruction>
	.word 0xa9a60820  ! 443: FADDs	fadds	%f24, %f0, %f20
	.word 0x8d95e000  ! 444: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa7a00540  ! 445: FSQRTd	fsqrt	
	.word 0x819de000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbf500000  ! 447: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 448: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d95e000  ! 449: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819f6000  ! 450: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb7a548a0  ! 451: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb7a489a0  ! 452: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xab500000  ! 453: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0xbba4c9c0  ! 455: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xb950c000  ! 456: RDPR_TT	<illegal instruction>
	.word 0xaf504000  ! 457: RDPR_TNPC	<illegal instruction>
	.word 0xa3a609e0  ! 458: FDIVq	dis not found

	.word 0x839c2000  ! 459: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8795e000  ! 460: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa9500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 462: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x819ce000  ! 463: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb7a58940  ! 464: FMULd	fmuld	%f22, %f0, %f58
	.word 0xbf504000  ! 465: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x8d946000  ! 466: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d96e000  ! 467: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x87952000  ! 468: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbd508000  ! 469: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 470: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 471: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa7508000  ! 472: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a5c9e0  ! 473: FDIVq	dis not found

	.word 0xbb50c000  ! 474: RDPR_TT	<illegal instruction>
	.word 0x8d942000  ! 475: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xad508000  ! 476: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 477: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 479: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 480: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 481: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 482: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8196e000  ! 483: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8394a000  ! 484: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb3504000  ! 485: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 486: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 487: RDPR_TPC	<illegal instruction>
	.word 0x8d97e000  ! 488: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbd50c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0x8595a000  ! 490: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8194e000  ! 491: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbda7c9a0  ! 492: FDIVs	fdivs	%f31, %f0, %f30
	.word 0x8196e000  ! 493: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa1508000  ! 494: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 495: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d956000  ! 496: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d97a000  ! 497: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbb504000  ! 498: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 499: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 500: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00540  ! 501: FSQRTd	fsqrt	
	.word 0x819c2000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x819e6000  ! 503: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xada748e0  ! 504: FSUBq	dis not found

	.word 0x81946000  ! 505: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8797e000  ! 506: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85976000  ! 507: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3504000  ! 508: RDPR_TNPC	<illegal instruction>
	.word 0x839ea000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x81962000  ! 510: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb750c000  ! 511: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 512: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb7504000  ! 513: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 514: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 515: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb1508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 517: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x839c6000  ! 518: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8597e000  ! 519: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa5a00520  ! 520: FSQRTs	fsqrt	
	.word 0x8596e000  ! 521: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa9a5c9e0  ! 522: FDIVq	dis not found

	.word 0xbf504000  ! 523: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 524: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 525: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 526: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xaba74840  ! 527: FADDd	faddd	%f60, %f0, %f52
	.word 0x8796e000  ! 528: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xab500000  ! 529: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 530: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb7508000  ! 531: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 532: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbda508e0  ! 533: FSUBq	dis not found

	.word 0xb3504000  ! 534: RDPR_TNPC	<illegal instruction>
	.word 0x839fa000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa3a70860  ! 536: FADDq	dis not found

	.word 0xb9a6c8c0  ! 537: FSUBd	fsubd	%f58, %f0, %f28
	.word 0xa7a00540  ! 538: FSQRTd	fsqrt	
	.word 0xb5500000  ! 539: RDPR_TPC	<illegal instruction>
	.word 0xbf500000  ! 540: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 541: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa5a7c8e0  ! 542: FSUBq	dis not found

	.word 0xb3a688e0  ! 543: FSUBq	dis not found

	.word 0x8597a000  ! 544: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xaf50c000  ! 545: RDPR_TT	<illegal instruction>
	.word 0xbd504000  ! 546: RDPR_TNPC	<illegal instruction>
	.word 0xb9a708c0  ! 547: FSUBd	fsubd	%f28, %f0, %f28
	.word 0xb5a5c840  ! 548: FADDd	faddd	%f54, %f0, %f26
	.word 0xbba5c8a0  ! 549: FSUBs	fsubs	%f23, %f0, %f29
	.word 0x87972000  ! 550: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb950c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0xa7a74940  ! 552: FMULd	fmuld	%f60, %f0, %f50
	.word 0x819ce000  ! 553: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb7a7c8e0  ! 554: FSUBq	dis not found

	.word 0xbd504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 557: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa550c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0x839fe000  ! 559: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa3a788e0  ! 560: FSUBq	dis not found

	.word 0xb3508000  ! 561: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 562: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 563: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819da000  ! 564: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819d2000  ! 565: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8395e000  ! 566: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839d6000  ! 567: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb1504000  ! 568: RDPR_TNPC	<illegal instruction>
	.word 0xa1a6c9e0  ! 569: FDIVq	dis not found

	.word 0x85952000  ! 570: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839f6000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x83946000  ! 572: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x819fa000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb5508000  ! 574: RDPR_TSTATE	<illegal instruction>
	.word 0x839c6000  ! 575: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819fa000  ! 576: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d97a000  ! 577: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbf500000  ! 578: RDPR_TPC	<illegal instruction>
	.word 0xa9a74960  ! 579: FMULq	dis not found

	.word 0xada648a0  ! 580: FSUBs	fsubs	%f25, %f0, %f22
	.word 0x819d2000  ! 581: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbd508000  ! 582: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 583: RDPR_TT	<illegal instruction>
	.word 0x819f2000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa9500000  ! 585: RDPR_TPC	<illegal instruction>
	.word 0x8597e000  ! 586: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85976000  ! 587: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbd508000  ! 588: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 589: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 590: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbda00560  ! 591: FSQRTq	fsqrt	
	.word 0xa150c000  ! 592: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 594: RDPR_TPC	<illegal instruction>
	.word 0xa3a748e0  ! 595: FSUBq	dis not found

	.word 0xbd500000  ! 596: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 597: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8394e000  ! 598: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa950c000  ! 599: RDPR_TT	rdpr	%tt, %r20
	.word 0x8797e000  ! 600: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbd504000  ! 601: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 602: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x85952000  ! 603: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x819fa000  ! 604: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb9a4c8e0  ! 605: FSUBq	dis not found

	.word 0x8d94e000  ! 606: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81962000  ! 607: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x819fe000  ! 608: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xaf504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 610: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8197e000  ! 611: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8d94a000  ! 612: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa3504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 614: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 615: RDPR_TT	<illegal instruction>
	.word 0x819fe000  ! 616: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839ce000  ! 617: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa950c000  ! 618: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 619: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 620: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 621: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 622: RDPR_TNPC	<illegal instruction>
	.word 0x839c2000  ! 623: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xafa7c9e0  ! 624: FDIVq	dis not found

	.word 0x819ca000  ! 625: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xaf508000  ! 626: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 627: RDPR_TT	<illegal instruction>
	.word 0xad504000  ! 628: RDPR_TNPC	<illegal instruction>
	.word 0xa5a748e0  ! 629: FSUBq	dis not found

	.word 0x8396e000  ! 630: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb150c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0xafa7c9a0  ! 632: FDIVs	fdivs	%f31, %f0, %f23
	.word 0x87976000  ! 633: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x83976000  ! 634: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8794a000  ! 635: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8d95e000  ! 636: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x81972000  ! 637: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb1508000  ! 638: RDPR_TSTATE	<illegal instruction>
	.word 0xbda00520  ! 639: FSQRTs	fsqrt	
	.word 0x8d95a000  ! 640: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819d2000  ! 641: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa9a4c8e0  ! 642: FSUBq	dis not found

	.word 0xaf50c000  ! 643: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 644: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa5504000  ! 645: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 647: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbb504000  ! 648: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 649: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 650: RDPR_TSTATE	<illegal instruction>
	.word 0x839ee000  ! 651: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8795e000  ! 652: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xada689c0  ! 653: FDIVd	fdivd	%f26, %f0, %f22
	.word 0xa9a54820  ! 654: FADDs	fadds	%f21, %f0, %f20
	.word 0x85972000  ! 655: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x87952000  ! 656: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xaba5c820  ! 657: FADDs	fadds	%f23, %f0, %f21
	.word 0x8795e000  ! 658: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xad50c000  ! 659: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0xbfa00560  ! 661: FSQRTq	fsqrt	
	.word 0xa9500000  ! 662: RDPR_TPC	<illegal instruction>
	.word 0xa7500000  ! 663: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 664: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 665: RDPR_TT	<illegal instruction>
	.word 0x8d96e000  ! 666: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x83956000  ! 667: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb9508000  ! 668: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 669: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8796e000  ! 670: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb9a708c0  ! 671: FSUBd	fsubd	%f28, %f0, %f28
	.word 0xa9500000  ! 672: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 673: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8397a000  ! 674: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8597e000  ! 675: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb7504000  ! 676: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 677: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x839ca000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8d97a000  ! 679: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa7500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 681: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 682: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa9508000  ! 683: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a689e0  ! 684: FDIVq	dis not found

	.word 0x8397a000  ! 685: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839da000  ! 686: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x81972000  ! 687: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8594a000  ! 688: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb9504000  ! 689: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa1508000  ! 692: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 693: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 694: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 695: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 696: RDPR_TNPC	<illegal instruction>
	.word 0x819e2000  ! 697: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbfa60920  ! 698: FMULs	fmuls	%f24, %f0, %f31
	.word 0xb1500000  ! 699: RDPR_TPC	<illegal instruction>
	.word 0xbba609c0  ! 700: FDIVd	fdivd	%f24, %f0, %f60
	.word 0xa3a788a0  ! 701: FSUBs	fsubs	%f30, %f0, %f17
	.word 0x8397a000  ! 702: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xafa60820  ! 703: FADDs	fadds	%f24, %f0, %f23
	.word 0x8394a000  ! 704: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb3508000  ! 705: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 706: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xafa649a0  ! 707: FDIVs	fdivs	%f25, %f0, %f23
	.word 0xbda689e0  ! 708: FDIVq	dis not found

	.word 0xab504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0x85966000  ! 710: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb5504000  ! 711: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 712: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8597a000  ! 713: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x819c6000  ! 714: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb5a648a0  ! 715: FSUBs	fsubs	%f25, %f0, %f26
	.word 0x8d956000  ! 716: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d95e000  ! 717: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbb504000  ! 718: RDPR_TNPC	<illegal instruction>
	.word 0xb9a68860  ! 719: FADDq	dis not found

	.word 0xa7508000  ! 720: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xb9a708e0  ! 722: FSUBq	dis not found

	.word 0xa1500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x839f2000  ! 725: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819f2000  ! 726: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa3508000  ! 727: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a00520  ! 728: FSQRTs	fsqrt	
	.word 0x8d956000  ! 729: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb9a508a0  ! 730: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xafa488e0  ! 731: FSUBq	dis not found

	.word 0xb1504000  ! 732: RDPR_TNPC	<illegal instruction>
	.word 0xa7a00540  ! 733: FSQRTd	fsqrt	
	.word 0xa5504000  ! 734: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 735: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 736: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 738: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb5500000  ! 739: RDPR_TPC	<illegal instruction>
	.word 0x8d97a000  ! 740: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x83942000  ! 741: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbba68860  ! 742: FADDq	dis not found

	.word 0x8d956000  ! 743: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbf50c000  ! 744: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 745: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb3a64820  ! 746: FADDs	fadds	%f25, %f0, %f25
	.word 0x8595e000  ! 747: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d94a000  ! 748: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8d946000  ! 749: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa9500000  ! 750: RDPR_TPC	<illegal instruction>
	.word 0xab508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 752: RDPR_TNPC	<illegal instruction>
	.word 0xa9a40920  ! 753: FMULs	fmuls	%f16, %f0, %f20
	.word 0x819ce000  ! 754: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb9a5c940  ! 755: FMULd	fmuld	%f54, %f0, %f28
	.word 0xbd50c000  ! 756: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 758: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a60920  ! 759: FMULs	fmuls	%f24, %f0, %f28
	.word 0x8795a000  ! 760: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xaba00540  ! 761: FSQRTd	fsqrt	
	.word 0x8397a000  ! 762: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819da000  ! 763: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbd504000  ! 764: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 765: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8796e000  ! 766: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x87962000  ! 767: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x839e6000  ! 768: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa1504000  ! 769: RDPR_TNPC	<illegal instruction>
	.word 0x839f6000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8794a000  ! 771: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x839c6000  ! 772: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819ea000  ! 773: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xad504000  ! 774: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 775: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 777: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x87966000  ! 778: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa5a40940  ! 779: FMULd	fmuld	%f16, %f0, %f18
	.word 0x81956000  ! 780: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8395a000  ! 781: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8396a000  ! 782: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbd504000  ! 783: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0x83956000  ! 785: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8d94a000  ! 786: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8596e000  ! 787: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819d6000  ! 788: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb7508000  ! 789: RDPR_TSTATE	<illegal instruction>
	.word 0x8d956000  ! 790: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d946000  ! 791: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8594e000  ! 792: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x839f2000  ! 793: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbfa00540  ! 794: FSQRTd	fsqrt	
	.word 0xa9500000  ! 795: RDPR_TPC	<illegal instruction>
	.word 0x81946000  ! 796: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa7a00520  ! 797: FSQRTs	fsqrt	
	.word 0xa1504000  ! 798: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 799: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa1500000  ! 800: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 802: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x839ca000  ! 803: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8797a000  ! 804: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x839fe000  ! 805: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbda60940  ! 806: FMULd	fmuld	%f24, %f0, %f30
	.word 0xa5a708c0  ! 807: FSUBd	fsubd	%f28, %f0, %f18
	.word 0xbfa00520  ! 808: FSQRTs	fsqrt	
	.word 0x8d956000  ! 809: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xab504000  ! 810: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 811: RDPR_TT	<illegal instruction>
	.word 0xb7a4c9c0  ! 812: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xbba6c940  ! 813: FMULd	fmuld	%f58, %f0, %f60
	.word 0x839de000  ! 814: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8196a000  ! 815: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8d946000  ! 816: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb3a70860  ! 817: FADDq	dis not found

	.word 0xa1a749a0  ! 818: FDIVs	fdivs	%f29, %f0, %f16
	.word 0xab50c000  ! 819: RDPR_TT	<illegal instruction>
	.word 0x819ea000  ! 820: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa1504000  ! 821: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 822: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x81952000  ! 823: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbf504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 825: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb5508000  ! 826: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8597a000  ! 828: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x819f2000  ! 829: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb7504000  ! 830: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 831: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xaf508000  ! 832: RDPR_TSTATE	<illegal instruction>
	.word 0x81976000  ! 833: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa9a58960  ! 834: FMULq	dis not found

	.word 0xbf500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xa7500000  ! 836: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 837: RDPR_TNPC	<illegal instruction>
	.word 0x819e2000  ! 838: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa5508000  ! 839: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 840: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xb7508000  ! 842: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 843: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839d2000  ! 844: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8d95e000  ! 845: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xada608e0  ! 846: FSUBq	dis not found

	.word 0x8797a000  ! 847: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x839fa000  ! 848: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xab50c000  ! 849: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 850: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x839da000  ! 852: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8397a000  ! 853: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa9504000  ! 854: RDPR_TNPC	<illegal instruction>
	.word 0xa1a6c8c0  ! 855: FSUBd	fsubd	%f58, %f0, %f16
	.word 0xa1a588a0  ! 856: FSUBs	fsubs	%f22, %f0, %f16
	.word 0xb5a6c8a0  ! 857: FSUBs	fsubs	%f27, %f0, %f26
	.word 0xb5500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0xa5a749c0  ! 859: FDIVd	fdivd	%f60, %f0, %f18
	.word 0x819fe000  ! 860: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819d2000  ! 861: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbfa40960  ! 862: FMULq	dis not found

	.word 0x839c2000  ! 863: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8d942000  ! 864: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb150c000  ! 865: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 866: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 867: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 868: RDPR_TNPC	<illegal instruction>
	.word 0x8d952000  ! 869: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8d96a000  ! 870: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8594e000  ! 871: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa750c000  ! 872: RDPR_TT	<illegal instruction>
	.word 0x839ca000  ! 873: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x839ce000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb5a78920  ! 875: FMULs	fmuls	%f30, %f0, %f26
	.word 0xa3a48860  ! 876: FADDq	dis not found

	.word 0x83952000  ! 877: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xad50c000  ! 878: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x839d2000  ! 880: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x87962000  ! 881: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819c6000  ! 882: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbb504000  ! 883: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 885: RDPR_TNPC	<illegal instruction>
	.word 0x8d966000  ! 886: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x83956000  ! 887: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8596e000  ! 888: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb150c000  ! 889: RDPR_TT	<illegal instruction>
	.word 0xb7a58860  ! 890: FADDq	dis not found

	.word 0x8395e000  ! 891: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8397a000  ! 892: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa5504000  ! 893: RDPR_TNPC	<illegal instruction>
	.word 0xada609e0  ! 894: FDIVq	dis not found

	.word 0xaf500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xab508000  ! 896: RDPR_TSTATE	<illegal instruction>
	.word 0xaba7c960  ! 897: FMULq	dis not found

	.word 0x8196e000  ! 898: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8d97a000  ! 899: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbf500000  ! 900: RDPR_TPC	<illegal instruction>
	.word 0xb7a589a0  ! 901: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xbda60860  ! 902: FADDq	dis not found

	.word 0x839de000  ! 903: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb9a00520  ! 904: FSQRTs	fsqrt	
	.word 0x85942000  ! 905: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb1508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0x8396a000  ! 907: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa9500000  ! 908: RDPR_TPC	<illegal instruction>
	.word 0xa1a68940  ! 909: FMULd	fmuld	%f26, %f0, %f16
	.word 0x83952000  ! 910: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb7504000  ! 911: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 912: RDPR_TT	<illegal instruction>
	.word 0x819fe000  ! 913: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819f2000  ! 914: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x819d6000  ! 915: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb9a00520  ! 916: FSQRTs	fsqrt	
	.word 0x8395e000  ! 917: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa9a70940  ! 918: FMULd	fmuld	%f28, %f0, %f20
	.word 0xbda509a0  ! 919: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xa5a40840  ! 920: FADDd	faddd	%f16, %f0, %f18
	.word 0xa7508000  ! 921: RDPR_TSTATE	<illegal instruction>
	.word 0x8396a000  ! 922: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819e2000  ! 923: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb9504000  ! 924: RDPR_TNPC	<illegal instruction>
	.word 0xa7a508a0  ! 925: FSUBs	fsubs	%f20, %f0, %f19
	.word 0xb750c000  ! 926: RDPR_TT	<illegal instruction>
	.word 0x8796e000  ! 927: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8394a000  ! 928: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8595e000  ! 929: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xaf504000  ! 930: RDPR_TNPC	<illegal instruction>
	.word 0xbd508000  ! 931: RDPR_TSTATE	<illegal instruction>
	.word 0xada78840  ! 932: FADDd	faddd	%f30, %f0, %f22
	.word 0xbb50c000  ! 933: RDPR_TT	<illegal instruction>
	.word 0xbfa44820  ! 934: FADDs	fadds	%f17, %f0, %f31
	.word 0xb1508000  ! 935: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 936: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8595e000  ! 937: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa9a5c8c0  ! 938: FSUBd	fsubd	%f54, %f0, %f20
	.word 0x87956000  ! 939: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8396e000  ! 940: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x839da000  ! 941: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb550c000  ! 942: RDPR_TT	<illegal instruction>
	.word 0x819fe000  ! 943: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d942000  ! 944: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xad50c000  ! 945: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 946: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xada74860  ! 947: FADDq	dis not found

	.word 0x819ea000  ! 948: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb550c000  ! 949: RDPR_TT	<illegal instruction>
	.word 0xada588c0  ! 950: FSUBd	fsubd	%f22, %f0, %f22
	.word 0xa7500000  ! 951: RDPR_TPC	<illegal instruction>
	.word 0xa7500000  ! 952: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 953: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 954: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 955: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x819da000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xad504000  ! 957: RDPR_TNPC	<illegal instruction>
	.word 0xafa48820  ! 958: FADDs	fadds	%f18, %f0, %f23
	.word 0x819ca000  ! 959: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x83956000  ! 960: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbb500000  ! 961: RDPR_TPC	<illegal instruction>
	.word 0xa7508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0x87942000  ! 963: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbf508000  ! 964: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 965: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8595a000  ! 966: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb750c000  ! 967: RDPR_TT	<illegal instruction>
	.word 0x85942000  ! 968: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x839f6000  ! 969: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8594a000  ! 970: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8595a000  ! 971: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819fe000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 974: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa9a689c0  ! 975: FDIVd	fdivd	%f26, %f0, %f20
	.word 0x81966000  ! 976: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xab500000  ! 977: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 978: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa5504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xada5c9a0  ! 980: FDIVs	fdivs	%f23, %f0, %f22
	.word 0x87956000  ! 981: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d946000  ! 982: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x839de000  ! 983: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819da000  ! 984: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8594a000  ! 985: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x83952000  ! 986: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819ca000  ! 987: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa3508000  ! 988: RDPR_TSTATE	<illegal instruction>
	.word 0xaba48940  ! 989: FMULd	fmuld	%f18, %f0, %f52
	.word 0xb1a58820  ! 990: FADDs	fadds	%f22, %f0, %f24
	.word 0x8d952000  ! 991: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xad50c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 993: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa5508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 995: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbfa00520  ! 996: FSQRTs	fsqrt	
	.word 0x819d6000  ! 997: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81966000  ! 998: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0xeffddc2e00005f08
	.xword	0x344fb4c00000cc5d
	.xword	0xa6254a490000f905
	.xword	0xacf913ba00002f56
	.xword	0x182905ae00009f67
	.xword	0xcebd6b490000bc5c
	.xword	0x3985706100000c50
	.xword	0x89272e940000ece7
	.xword	0x72a13c4a0000d86c
	.xword	0x779f2d9800009d88
	.xword	0x767e81e200001d7d
	.xword	0xa95dbc2e00009b08
	.xword	0x421b41790000ed8c
	.xword	0x9ba6ef900000fd35
	.xword	0xd8dacbb50000dd8c
	.xword	0xd1aa16e10000bc4e
	.xword	0x38d8b7df0000a874
	.xword	0x5acf25dd00001fbe
	.xword	0xbc070dca00003a93
	.xword	0xd3877e820000bb81
	.xword	0xc1b72ed3000019f8
	.xword	0x19aebeea00006ac3
	.xword	0x447e2b7d0000bcf5
	.xword	0x001b237700001f3c
	.xword	0x4cefe59800000bc9
	.xword	0xc8b8f2170000ff4d
	.xword	0x4b670c3b00002894
	.xword	0x21ecbd260000de1c
	.xword	0xf23c5a1c00009f47
	.xword	0x39a4510d00008f19
	.xword	0x078eb40100008b0c
	.xword	0x608da07e0000e901
	.xword	0xeded199100009c0b
	.xword	0xa7deba7d00004c99
	.xword	0x7e4c469300001e6a
	.xword	0xa5cc2cfb000038a4
	.xword	0x6ad290ad000098bc
	.xword	0x36ff9ea40000d84d
	.xword	0x0092c6c800009ff9
	.xword	0x9171bdf700001dbf
	.xword	0x26869ddc00009b1c
	.xword	0xb33adee10000db0e
	.xword	0xd54f014700002bc4
	.xword	0x20da629d00003ccd
	.xword	0x2f25f8d100003928
	.xword	0xc1f805bb0000081e
	.xword	0x56de2f2b000058d7
	.xword	0xc039878f0000ee32
	.xword	0x56c78f310000bea8
	.xword	0xeb2bf7a10000bdb9
	.xword	0xd42958090000f9b2
	.xword	0x40880fa600003b23
	.xword	0x35f7995b00001c5c
	.xword	0x545c56bc00007dce
	.xword	0x970ef33f0000dcec
	.xword	0x32c482e60000ffbe
	.xword	0x264260680000addb
	.xword	0xacbe20390000ceb1
	.xword	0x8ead406e00003bee
	.xword	0x63c2dfa10000fc8c
	.xword	0x4067a3990000ba5a
	.xword	0xda214edc00004ba3
	.xword	0x3dcf925800001e45
	.xword	0x15ce790000009807
	.xword	0x2b180e5d00006ffd
	.xword	0x03d9e6780000896e
	.xword	0x46f46c3900006dbc
	.xword	0xaebda3c90000f925
	.xword	0x9eec74060000cbee
	.xword	0xa21cab9400005fad
	.xword	0x762f844b0000afa8
	.xword	0xbd6ae2350000cb61
	.xword	0xc4e63b0700008c88
	.xword	0x78b9efa60000a83a
	.xword	0xe08cd8fe00007a8b
	.xword	0xe57ee5ce0000cd2d
	.xword	0xd007d93800009c0c
	.xword	0xc04386290000ae68
	.xword	0xe9d63a1700000f6b
	.xword	0x4fa6580d0000e94c
	.xword	0x5e62a792000029ab
	.xword	0x7f0747c70000bfb9
	.xword	0xf196087600007835
	.xword	0x7e9f259900004b7e
	.xword	0x49d30fed0000784a
	.xword	0x6997cda20000fd60
	.xword	0x5c4829230000e87f
	.xword	0x8634542f00007989
	.xword	0x664ae7e300007d89
	.xword	0x9dd76fc700002bdc
	.xword	0x939fab3800009c8f
	.xword	0xe60d15ec0000d8a8
	.xword	0xbf21efce0000c8df
	.xword	0xd3e465de0000dea6
	.xword	0xb8e3377e00005f1f
	.xword	0xe8d2acda0000eea9
	.xword	0xbed67bfa0000a819
	.xword	0x8cf30057000098b9
	.xword	0xb94f3eb500001acb
	.xword	0x79bdf4970000dcc2
	.xword	0x9bc20aa200005db5
	.xword	0x779454fa0000efeb
	.xword	0xe0006ecf00007f7d
	.xword	0xc3ce792a0000ea7e
	.xword	0xb7502aea00001c5b
	.xword	0x3044fec100004d73
	.xword	0xc8e719a30000cee9
	.xword	0xb3c41fd300003b31
	.xword	0x13438e760000fd53
	.xword	0xf525cdd20000c9da
	.xword	0x1d38d22500001a87
	.xword	0xc8a9cda00000fc70
	.xword	0x9b89f474000039f4
	.xword	0x3ce08352000079fd
	.xword	0xc37cd4f50000a89b
	.xword	0x0b69a27a00007c0f
	.xword	0x4babdf290000ccc1
	.xword	0x96023f4700003a2b
	.xword	0x5a23754100000fa6
	.xword	0xb1bc595c00001aaf
	.xword	0x82202e300000196b
	.xword	0xee7512e600002bd1
	.xword	0x4d07ab7c0000cdc6
	.xword	0x56c2efda0000f816
	.xword	0xff39185800007811
	.xword	0x23da75f00000a8f5
	.xword	0x4c4af5a80000bb5c
	.xword	0xc3a1230300002b02



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
