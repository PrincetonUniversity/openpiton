// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_tsasr_31_rand_s2.s
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
   random seed:	422119140
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

	setx 0xf036fe2200002e4a, %g1, %g0
	setx 0x5b80e65a00009aa6, %g1, %g1
	setx 0x4dd6c05000003e5b, %g1, %g2
	setx 0x10186a1d0000cbff, %g1, %g3
	setx 0x7150d4540000bd7b, %g1, %g4
	setx 0x95db14b800007ed5, %g1, %g5
	setx 0xaf2568a60000face, %g1, %g6
	setx 0xa336587a00002abd, %g1, %g7
	setx 0x01ffb3d90000f895, %g1, %r16
	setx 0xb7136d0600007fd5, %g1, %r17
	setx 0x16a4b85500003b00, %g1, %r18
	setx 0x22cae8a500009c5d, %g1, %r19
	setx 0x59454de300001aaa, %g1, %r20
	setx 0x1ba07f380000591d, %g1, %r21
	setx 0x76dc02c800008a19, %g1, %r22
	setx 0x0f2c94c400000fdf, %g1, %r23
	setx 0x6f395e1300003ceb, %g1, %r24
	setx 0x53b419f500009845, %g1, %r25
	setx 0x28064f5b00003d21, %g1, %r26
	setx 0xa58ae99500007879, %g1, %r27
	setx 0xf375deea00000978, %g1, %r28
	setx 0xc6fd04eb0000ac26, %g1, %r29
	setx 0x7272925a00009ab4, %g1, %r30
	setx 0xe32da4bf0000ca11, %g1, %r31
	save
	setx 0xc63ae50d0000cfc4, %g1, %r16
	setx 0xdc4c412d0000bdac, %g1, %r17
	setx 0x90d5c3340000ef8c, %g1, %r18
	setx 0x2c7869400000ed12, %g1, %r19
	setx 0x5f81594600000809, %g1, %r20
	setx 0x71b32fc200006d24, %g1, %r21
	setx 0x182b1b170000f8b3, %g1, %r22
	setx 0xccc043a60000c83f, %g1, %r23
	setx 0x99c6784400006943, %g1, %r24
	setx 0x7d986b540000a9b5, %g1, %r25
	setx 0x119d122200004f82, %g1, %r26
	setx 0x9e7cf6b10000dff0, %g1, %r27
	setx 0xfbdd662600005bb6, %g1, %r28
	setx 0x020a28c200008d3e, %g1, %r29
	setx 0xb699c4f70000fea5, %g1, %r30
	setx 0x906f9e3d0000188c, %g1, %r31
	save
	setx 0xc09b0d240000df02, %g1, %r16
	setx 0x8f1fbe070000fcba, %g1, %r17
	setx 0x931a07e100005961, %g1, %r18
	setx 0x86879c7b0000dc53, %g1, %r19
	setx 0xe4a8062c00002a9a, %g1, %r20
	setx 0x6b2f9fa400002c89, %g1, %r21
	setx 0x957ab7fa00003801, %g1, %r22
	setx 0x655192f400006d53, %g1, %r23
	setx 0x1d9601150000d8c2, %g1, %r24
	setx 0x31facb4e0000ffb4, %g1, %r25
	setx 0x426dcf590000d8ba, %g1, %r26
	setx 0x848a569600001860, %g1, %r27
	setx 0xc88d07c500004ee3, %g1, %r28
	setx 0x5dfb844c00004cf4, %g1, %r29
	setx 0xc4d9202e00005b3c, %g1, %r30
	setx 0xfecabe6700005bc0, %g1, %r31
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
	.word 0xada60820  ! 1: FADDs	fadds	%f24, %f0, %f22
	.word 0x819ee000  ! 2: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x819de000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa7504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 5: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb1a648c0  ! 6: FSUBd	fsubd	%f56, %f0, %f24
	.word 0xaf50c000  ! 7: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 8: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 9: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ce000  ! 10: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5508000  ! 11: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 12: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8397e000  ! 13: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x83942000  ! 14: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xad508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 16: RDPR_TNPC	<illegal instruction>
	.word 0xb5a00560  ! 17: FSQRTq	fsqrt	
	.word 0x819fe000  ! 18: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d972000  ! 19: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8595a000  ! 20: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d972000  ! 21: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbb508000  ! 22: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0x819f2000  ! 24: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb3a00520  ! 25: FSQRTs	fsqrt	
	.word 0xab50c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xb5a4c9a0  ! 27: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xa750c000  ! 28: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 29: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 30: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xaf508000  ! 31: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 32: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xada7c860  ! 33: FADDq	dis not found

	.word 0xa3508000  ! 34: RDPR_TSTATE	<illegal instruction>
	.word 0x819f6000  ! 35: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x83966000  ! 36: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbb508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 38: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa9508000  ! 39: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94a000  ! 40: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa5a588a0  ! 41: FSUBs	fsubs	%f22, %f0, %f18
	.word 0x8195a000  ! 42: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x839ee000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x83966000  ! 44: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb9508000  ! 45: RDPR_TSTATE	<illegal instruction>
	.word 0x87952000  ! 46: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb1a4c9e0  ! 47: FDIVq	dis not found

	.word 0x8d97e000  ! 48: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa5500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xa9a48820  ! 50: FADDs	fadds	%f18, %f0, %f20
	.word 0x8d962000  ! 51: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa1504000  ! 52: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x81952000  ! 54: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x85972000  ! 55: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x839fe000  ! 56: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819fe000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d952000  ! 58: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb3a4c9e0  ! 59: FDIVq	dis not found

	.word 0xa5508000  ! 60: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 63: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbf504000  ! 64: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 65: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb7508000  ! 66: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a68860  ! 67: FADDq	dis not found

	.word 0xaba688e0  ! 68: FSUBq	dis not found

	.word 0x8595e000  ! 69: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb5508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 71: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8d96a000  ! 72: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x87962000  ! 73: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8194e000  ! 74: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5a70960  ! 75: FMULq	dis not found

	.word 0x819fe000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xafa488a0  ! 77: FSUBs	fsubs	%f18, %f0, %f23
	.word 0xb1508000  ! 78: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0x8d96e000  ! 80: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xbf50c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 82: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8595e000  ! 83: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa9a44960  ! 84: FMULq	dis not found

	.word 0xb9500000  ! 85: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 86: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x819ce000  ! 87: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 89: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xaf500000  ! 90: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 91: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbb50c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 93: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xad504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0xa3a449e0  ! 95: FDIVq	dis not found

	.word 0xa3a40840  ! 96: FADDd	faddd	%f16, %f0, %f48
	.word 0xb3a00520  ! 97: FSQRTs	fsqrt	
	.word 0x85952000  ! 98: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8797e000  ! 99: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5508000  ! 100: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95a000  ! 101: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819d2000  ! 102: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8597a000  ! 103: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbba44940  ! 104: FMULd	fmuld	%f48, %f0, %f60
	.word 0x8d972000  ! 105: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbf508000  ! 106: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 107: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 108: RDPR_TT	<illegal instruction>
	.word 0x85956000  ! 109: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d94e000  ! 110: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbda54860  ! 111: FADDq	dis not found

	.word 0xbfa00540  ! 112: FSQRTd	fsqrt	
	.word 0x819f6000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa9a609c0  ! 114: FDIVd	fdivd	%f24, %f0, %f20
	.word 0x8796a000  ! 115: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa7a5c840  ! 116: FADDd	faddd	%f54, %f0, %f50
	.word 0xb3a648c0  ! 117: FSUBd	fsubd	%f56, %f0, %f56
	.word 0x8795a000  ! 118: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x81966000  ! 119: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa950c000  ! 120: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 121: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x839ea000  ! 122: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xab504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a000  ! 124: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa7504000  ! 125: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 126: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb7a68920  ! 127: FMULs	fmuls	%f26, %f0, %f27
	.word 0x87956000  ! 128: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbf504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0x839e2000  ! 130: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xab500000  ! 131: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 132: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81946000  ! 133: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819f6000  ! 134: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8194e000  ! 135: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xaf508000  ! 136: RDPR_TSTATE	<illegal instruction>
	.word 0x8597e000  ! 137: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa7a408a0  ! 138: FSUBs	fsubs	%f16, %f0, %f19
	.word 0xab500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0xa150c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xaf508000  ! 141: RDPR_TSTATE	<illegal instruction>
	.word 0x819f2000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xaf50c000  ! 143: RDPR_TT	<illegal instruction>
	.word 0xbda58920  ! 144: FMULs	fmuls	%f22, %f0, %f30
	.word 0x81956000  ! 145: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8794e000  ! 146: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8795e000  ! 147: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x85942000  ! 148: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8796e000  ! 149: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa5504000  ! 150: RDPR_TNPC	<illegal instruction>
	.word 0xa9a00540  ! 151: FSQRTd	fsqrt	
	.word 0xa1a48820  ! 152: FADDs	fadds	%f18, %f0, %f16
	.word 0xbb504000  ! 153: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 154: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x83956000  ! 155: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839f2000  ! 156: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8395e000  ! 157: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x87942000  ! 158: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x85942000  ! 159: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8794a000  ! 160: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb9504000  ! 161: RDPR_TNPC	<illegal instruction>
	.word 0x819ea000  ! 162: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x839e2000  ! 163: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8796e000  ! 164: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbb504000  ! 165: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 166: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 167: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x85952000  ! 168: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb950c000  ! 169: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbda00560  ! 172: FSQRTq	fsqrt	
	.word 0xa1504000  ! 173: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 174: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 175: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x85946000  ! 176: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb7500000  ! 177: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 178: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 179: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xad500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 181: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8d952000  ! 182: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839fa000  ! 183: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa7500000  ! 184: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 185: RDPR_TSTATE	<illegal instruction>
	.word 0x819ca000  ! 186: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8797e000  ! 187: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8196e000  ! 188: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa3500000  ! 189: RDPR_TPC	<illegal instruction>
	.word 0x8795e000  ! 190: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x839d6000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839c2000  ! 192: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xada789c0  ! 193: FDIVd	fdivd	%f30, %f0, %f22
	.word 0xa3a74940  ! 194: FMULd	fmuld	%f60, %f0, %f48
	.word 0xad500000  ! 195: RDPR_TPC	<illegal instruction>
	.word 0x819fa000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8197e000  ! 197: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb1500000  ! 198: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 199: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 200: RDPR_TPC	<illegal instruction>
	.word 0x8d952000  ! 201: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8796a000  ! 202: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8796a000  ! 203: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8597a000  ! 204: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb5a60820  ! 205: FADDs	fadds	%f24, %f0, %f26
	.word 0xbd504000  ! 206: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 207: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8396e000  ! 208: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x819da000  ! 209: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb3500000  ! 210: RDPR_TPC	<illegal instruction>
	.word 0xafa00520  ! 211: FSQRTs	fsqrt	
	.word 0xb5500000  ! 212: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 213: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a00540  ! 214: FSQRTd	fsqrt	
	.word 0xbba6c8a0  ! 215: FSUBs	fsubs	%f27, %f0, %f29
	.word 0x8597e000  ! 216: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xaba4c960  ! 217: FMULq	dis not found

	.word 0xb7a44960  ! 218: FMULq	dis not found

	.word 0xb1508000  ! 219: RDPR_TSTATE	<illegal instruction>
	.word 0xb7508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 221: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 222: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa1504000  ! 223: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 224: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbda00560  ! 225: FSQRTq	fsqrt	
	.word 0x819da000  ! 226: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb1a50920  ! 227: FMULs	fmuls	%f20, %f0, %f24
	.word 0x83952000  ! 228: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb9500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 230: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839de000  ! 231: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa9508000  ! 232: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a00540  ! 233: FSQRTd	fsqrt	
	.word 0xab508000  ! 234: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 235: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa5a00540  ! 236: FSQRTd	fsqrt	
	.word 0x81962000  ! 237: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x83966000  ! 238: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa1504000  ! 239: RDPR_TNPC	<illegal instruction>
	.word 0xb3a00540  ! 240: FSQRTd	fsqrt	
	.word 0xb3508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 242: RDPR_TNPC	<illegal instruction>
	.word 0x8d97a000  ! 243: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xab50c000  ! 244: RDPR_TT	<illegal instruction>
	.word 0xa9a00520  ! 245: FSQRTs	fsqrt	
	.word 0x819c2000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d966000  ! 247: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xada6c8e0  ! 248: FSUBq	dis not found

	.word 0xafa449c0  ! 249: FDIVd	fdivd	%f48, %f0, %f54
	.word 0x819fe000  ! 250: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb5a509a0  ! 251: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xbb500000  ! 252: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 254: RDPR_TNPC	<illegal instruction>
	.word 0x8195a000  ! 255: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x85952000  ! 256: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x87956000  ! 257: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbf508000  ! 258: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 259: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x839c6000  ! 260: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xaf50c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0xaba548a0  ! 262: FSUBs	fsubs	%f21, %f0, %f21
	.word 0xb5504000  ! 263: RDPR_TNPC	<illegal instruction>
	.word 0xbda00560  ! 264: FSQRTq	fsqrt	
	.word 0xbb508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x8d952000  ! 266: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbb508000  ! 267: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 268: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb9500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 270: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 271: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x85976000  ! 272: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839ca000  ! 273: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x81952000  ! 274: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbd508000  ! 275: RDPR_TSTATE	<illegal instruction>
	.word 0xbd508000  ! 276: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 277: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x87966000  ! 278: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8795e000  ! 279: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8796e000  ! 280: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x819e2000  ! 281: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa350c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0x87946000  ! 283: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbd50c000  ! 284: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 285: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb5504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xb5a70820  ! 287: FADDs	fadds	%f28, %f0, %f26
	.word 0xab508000  ! 288: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 290: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8394a000  ! 291: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87972000  ! 292: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa3500000  ! 293: RDPR_TPC	<illegal instruction>
	.word 0x8d94a000  ! 294: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xafa408c0  ! 295: FSUBd	fsubd	%f16, %f0, %f54
	.word 0x8d956000  ! 296: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb5a709c0  ! 297: FDIVd	fdivd	%f28, %f0, %f26
	.word 0xb9a00560  ! 298: FSQRTq	fsqrt	
	.word 0x8d95a000  ! 299: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa5508000  ! 300: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 301: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 302: RDPR_TT	<illegal instruction>
	.word 0xb9a689c0  ! 303: FDIVd	fdivd	%f26, %f0, %f28
	.word 0x81976000  ! 304: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa3a5c940  ! 305: FMULd	fmuld	%f54, %f0, %f48
	.word 0x85952000  ! 306: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa5508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 308: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d94e000  ! 309: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81962000  ! 310: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb3500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 312: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x839ce000  ! 313: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa150c000  ! 314: RDPR_TT	<illegal instruction>
	.word 0x87942000  ! 315: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x83972000  ! 316: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa150c000  ! 317: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 318: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 319: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x87972000  ! 320: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8395e000  ! 321: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839ca000  ! 322: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x83946000  ! 323: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbd508000  ! 324: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 325: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x83966000  ! 326: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbb508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 328: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8196e000  ! 329: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8395e000  ! 330: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb5508000  ! 331: RDPR_TSTATE	<illegal instruction>
	.word 0xbba5c820  ! 332: FADDs	fadds	%f23, %f0, %f29
	.word 0x839e6000  ! 333: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8396a000  ! 334: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x81976000  ! 335: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa1a68940  ! 336: FMULd	fmuld	%f26, %f0, %f16
	.word 0x8395e000  ! 337: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb9a508c0  ! 338: FSUBd	fsubd	%f20, %f0, %f28
	.word 0x8394e000  ! 339: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbba488a0  ! 340: FSUBs	fsubs	%f18, %f0, %f29
	.word 0x819d6000  ! 341: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d97a000  ! 342: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb9a48840  ! 343: FADDd	faddd	%f18, %f0, %f28
	.word 0x8795a000  ! 344: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa5a589c0  ! 345: FDIVd	fdivd	%f22, %f0, %f18
	.word 0xa5a44960  ! 346: FMULq	dis not found

	.word 0xa350c000  ! 347: RDPR_TT	<illegal instruction>
	.word 0x839de000  ! 348: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbb50c000  ! 349: RDPR_TT	<illegal instruction>
	.word 0x8595a000  ! 350: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8594a000  ! 351: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x81946000  ! 352: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x839de000  ! 353: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xafa5c840  ! 354: FADDd	faddd	%f54, %f0, %f54
	.word 0x8796a000  ! 355: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb950c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0x8597e000  ! 357: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa350c000  ! 358: RDPR_TT	<illegal instruction>
	.word 0x8d942000  ! 359: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x85956000  ! 360: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xaba7c8e0  ! 361: FSUBq	dis not found

	.word 0xa3a00520  ! 362: FSQRTs	fsqrt	
	.word 0xb550c000  ! 363: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 364: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x85956000  ! 365: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d962000  ! 366: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xbd500000  ! 367: RDPR_TPC	<illegal instruction>
	.word 0x8d97a000  ! 368: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8d972000  ! 369: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x87952000  ! 370: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbda609a0  ! 371: FDIVs	fdivs	%f24, %f0, %f30
	.word 0x8595e000  ! 372: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb9508000  ! 373: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 374: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d94e000  ! 375: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbba00520  ! 376: FSQRTs	fsqrt	
	.word 0xa9a5c8e0  ! 377: FSUBq	dis not found

	.word 0x8d952000  ! 378: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb350c000  ! 379: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 380: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 381: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xbba549a0  ! 382: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xa150c000  ! 383: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 384: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x87942000  ! 385: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x81966000  ! 386: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839da000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819fe000  ! 388: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1508000  ! 389: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 390: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x819ee000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d952000  ! 392: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xaf50c000  ! 393: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 394: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819ca000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb9500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0x839c6000  ! 398: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb150c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0x8d956000  ! 400: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x839c2000  ! 401: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa5500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 403: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa9504000  ! 404: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x819ce000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8196a000  ! 407: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x81976000  ! 408: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839ce000  ! 409: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d972000  ! 410: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb950c000  ! 411: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 412: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 413: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d962000  ! 414: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x819d2000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa5a509c0  ! 416: FDIVd	fdivd	%f20, %f0, %f18
	.word 0xb5a6c8a0  ! 417: FSUBs	fsubs	%f27, %f0, %f26
	.word 0xb1a48820  ! 418: FADDs	fadds	%f18, %f0, %f24
	.word 0x8197e000  ! 419: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xad500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xbda70960  ! 421: FMULq	dis not found

	.word 0xb3500000  ! 422: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 423: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x819ca000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xab50c000  ! 425: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 426: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xada7c9e0  ! 427: FDIVq	dis not found

	.word 0xa1a60840  ! 428: FADDd	faddd	%f24, %f0, %f16
	.word 0xa9a74960  ! 429: FMULq	dis not found

	.word 0x819ee000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xad504000  ! 431: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 432: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x87956000  ! 433: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xaf50c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0x81956000  ! 435: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x83966000  ! 436: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x87946000  ! 437: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839d2000  ! 438: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb7a70960  ! 439: FMULq	dis not found

	.word 0x819f6000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839e2000  ! 441: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x87942000  ! 442: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb3508000  ! 443: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 444: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x81966000  ! 445: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8797e000  ! 446: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb3a609e0  ! 447: FDIVq	dis not found

	.word 0x8595a000  ! 448: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x81962000  ! 449: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa3508000  ! 450: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 451: RDPR_TT	<illegal instruction>
	.word 0xad504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 453: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d95e000  ! 454: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d956000  ! 455: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x85956000  ! 456: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x81946000  ! 457: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819f2000  ! 458: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x85956000  ! 459: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x83942000  ! 460: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x819f6000  ! 461: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x81952000  ! 462: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbb504000  ! 463: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 464: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xada608a0  ! 465: FSUBs	fsubs	%f24, %f0, %f22
	.word 0xa9a5c960  ! 466: FMULq	dis not found

	.word 0xbb500000  ! 467: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 468: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb5508000  ! 469: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 470: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x839de000  ! 471: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa7500000  ! 472: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 473: RDPR_TSTATE	<illegal instruction>
	.word 0xaba609a0  ! 474: FDIVs	fdivs	%f24, %f0, %f21
	.word 0x8397a000  ! 475: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819ea000  ! 476: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x839e2000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb9a44940  ! 478: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb7508000  ! 479: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 480: RDPR_TT	<illegal instruction>
	.word 0xb3a58920  ! 481: FMULs	fmuls	%f22, %f0, %f25
	.word 0x839c6000  ! 482: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8d96a000  ! 483: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa1a00520  ! 484: FSQRTs	fsqrt	
	.word 0x81976000  ! 485: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8d972000  ! 486: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819de000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa150c000  ! 488: RDPR_TT	<illegal instruction>
	.word 0x839ee000  ! 489: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa150c000  ! 490: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 491: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 492: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xada7c9a0  ! 493: FDIVs	fdivs	%f31, %f0, %f22
	.word 0x8595a000  ! 494: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d95e000  ! 495: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8195e000  ! 496: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa5500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0xaba00540  ! 498: FSQRTd	fsqrt	
	.word 0xbba70920  ! 499: FMULs	fmuls	%f28, %f0, %f29
	.word 0xb9a5c960  ! 500: FMULq	dis not found

	.word 0xa950c000  ! 501: RDPR_TT	<illegal instruction>
	.word 0x819f2000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8795e000  ! 503: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa1a00560  ! 504: FSQRTq	fsqrt	
	.word 0x8197e000  ! 505: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87972000  ! 506: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8196e000  ! 507: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x839f2000  ! 508: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb3a00520  ! 509: FSQRTs	fsqrt	
	.word 0x839da000  ! 510: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x85956000  ! 511: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8196a000  ! 512: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3508000  ! 513: RDPR_TSTATE	<illegal instruction>
	.word 0x839c6000  ! 514: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb1a44840  ! 515: FADDd	faddd	%f48, %f0, %f24
	.word 0xb3508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a4c8a0  ! 517: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbf504000  ! 518: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 520: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 521: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xad500000  ! 522: RDPR_TPC	<illegal instruction>
	.word 0x8d976000  ! 523: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d94e000  ! 524: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8797a000  ! 525: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x83946000  ! 526: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839c6000  ! 527: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x87946000  ! 528: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8795e000  ! 529: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x83976000  ! 530: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xafa7c860  ! 531: FADDq	dis not found

	.word 0x85946000  ! 532: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb9500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 534: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x839da000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x83952000  ! 536: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x83966000  ! 537: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819f2000  ! 538: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d96a000  ! 539: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x85956000  ! 540: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb750c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 542: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 543: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8596e000  ! 544: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa950c000  ! 545: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 546: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa3500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xb3a00540  ! 548: FSQRTd	fsqrt	
	.word 0x81976000  ! 549: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839fe000  ! 550: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x85942000  ! 551: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x81976000  ! 552: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb3504000  ! 553: RDPR_TNPC	<illegal instruction>
	.word 0x85952000  ! 554: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x85976000  ! 555: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8797a000  ! 556: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbb508000  ! 557: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xa150c000  ! 559: RDPR_TT	<illegal instruction>
	.word 0xbda00560  ! 560: FSQRTq	fsqrt	
	.word 0xafa40860  ! 561: FADDq	dis not found

	.word 0x87966000  ! 562: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbda68940  ! 563: FMULd	fmuld	%f26, %f0, %f30
	.word 0xb3a709c0  ! 564: FDIVd	fdivd	%f28, %f0, %f56
	.word 0xbf50c000  ! 565: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 568: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xafa60840  ! 569: FADDd	faddd	%f24, %f0, %f54
	.word 0xa5504000  ! 570: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 571: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 572: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x819ee000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb950c000  ! 574: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 575: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xad500000  ! 576: RDPR_TPC	<illegal instruction>
	.word 0x8397e000  ! 577: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbda5c9a0  ! 578: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xab508000  ! 579: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 580: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x83976000  ! 581: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819d2000  ! 582: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8396a000  ! 583: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819c2000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d95e000  ! 585: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8596e000  ! 586: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa5504000  ! 587: RDPR_TNPC	<illegal instruction>
	.word 0x8594a000  ! 588: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x83942000  ! 589: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb950c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0x8194e000  ! 591: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xaf508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 594: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83952000  ! 595: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb950c000  ! 596: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 597: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x83972000  ! 598: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8d946000  ! 599: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d962000  ! 600: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa7a4c940  ! 601: FMULd	fmuld	%f50, %f0, %f50
	.word 0xb950c000  ! 602: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 603: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 604: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa5500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 606: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa5a749a0  ! 607: FDIVs	fdivs	%f29, %f0, %f18
	.word 0xbba40940  ! 608: FMULd	fmuld	%f16, %f0, %f60
	.word 0x87946000  ! 609: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d96e000  ! 610: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8196a000  ! 611: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbba48920  ! 612: FMULs	fmuls	%f18, %f0, %f29
	.word 0x8197e000  ! 613: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8d966000  ! 614: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8395a000  ! 615: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8d96a000  ! 616: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb9508000  ! 617: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a7c8e0  ! 618: FSUBq	dis not found

	.word 0x87976000  ! 619: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xaf504000  ! 620: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 621: RDPR_TT	<illegal instruction>
	.word 0xbfa6c820  ! 622: FADDs	fadds	%f27, %f0, %f31
	.word 0xbd50c000  ! 623: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 624: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87952000  ! 625: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d94e000  ! 626: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8595e000  ! 627: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x85946000  ! 628: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbfa00520  ! 629: FSQRTs	fsqrt	
	.word 0xbf508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a64960  ! 631: FMULq	dis not found

	.word 0xb9504000  ! 632: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 633: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb550c000  ! 634: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 636: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8794a000  ! 637: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x83972000  ! 638: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x81946000  ! 639: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8395e000  ! 640: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbd504000  ! 641: RDPR_TNPC	<illegal instruction>
	.word 0x839e2000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d96a000  ! 643: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa5a4c860  ! 644: FADDq	dis not found

	.word 0xa5a54960  ! 645: FMULq	dis not found

	.word 0xa750c000  ! 646: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0xa7a6c9e0  ! 648: FDIVq	dis not found

	.word 0xa3a4c860  ! 649: FADDq	dis not found

	.word 0x839ea000  ! 650: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa7500000  ! 651: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 652: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819fe000  ! 653: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbb500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0xa350c000  ! 655: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 656: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819c2000  ! 657: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa5a5c820  ! 658: FADDs	fadds	%f23, %f0, %f18
	.word 0xb9500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xa7a7c8c0  ! 660: FSUBd	fsubd	%f62, %f0, %f50
	.word 0xa5500000  ! 661: RDPR_TPC	<illegal instruction>
	.word 0x839de000  ! 662: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819e6000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa3a748e0  ! 664: FSUBq	dis not found

	.word 0xb5a00560  ! 665: FSQRTq	fsqrt	
	.word 0x8d972000  ! 666: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbba6c9e0  ! 667: FDIVq	dis not found

	.word 0xb1a588a0  ! 668: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xbda649c0  ! 669: FDIVd	fdivd	%f56, %f0, %f30
	.word 0x85976000  ! 670: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbda748e0  ! 671: FSUBq	dis not found

	.word 0x87956000  ! 672: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa7a7c820  ! 673: FADDs	fadds	%f31, %f0, %f19
	.word 0xbfa4c840  ! 674: FADDd	faddd	%f50, %f0, %f62
	.word 0xb7508000  ! 675: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 676: RDPR_TT	<illegal instruction>
	.word 0x87966000  ! 677: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8395a000  ! 678: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8594e000  ! 679: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87952000  ! 680: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa5a00560  ! 681: FSQRTq	fsqrt	
	.word 0x8396e000  ! 682: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb150c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 684: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb9a489c0  ! 685: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xb3a40820  ! 686: FADDs	fadds	%f16, %f0, %f25
	.word 0x8594a000  ! 687: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8d972000  ! 688: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x83956000  ! 689: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbb508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819e6000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d976000  ! 692: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x87972000  ! 693: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x87942000  ! 694: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb5a40860  ! 695: FADDq	dis not found

	.word 0x8597a000  ! 696: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8797a000  ! 697: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d95e000  ! 698: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbb500000  ! 699: RDPR_TPC	<illegal instruction>
	.word 0xb3a689e0  ! 700: FDIVq	dis not found

	.word 0xa5a00520  ! 701: FSQRTs	fsqrt	
	.word 0xb3a4c820  ! 702: FADDs	fadds	%f19, %f0, %f25
	.word 0x8d952000  ! 703: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8197e000  ! 704: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x85946000  ! 705: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xaf508000  ! 706: RDPR_TSTATE	<illegal instruction>
	.word 0xaba50840  ! 707: FADDd	faddd	%f20, %f0, %f52
	.word 0xbda48940  ! 708: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb9508000  ! 709: RDPR_TSTATE	<illegal instruction>
	.word 0xaba44860  ! 710: FADDq	dis not found

	.word 0xab50c000  ! 711: RDPR_TT	<illegal instruction>
	.word 0xb9a4c920  ! 712: FMULs	fmuls	%f19, %f0, %f28
	.word 0x839d2000  ! 713: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xab500000  ! 714: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 715: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 716: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xab504000  ! 717: RDPR_TNPC	<illegal instruction>
	.word 0x839c2000  ! 718: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xaf508000  ! 719: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 720: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa550c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0xa7a00540  ! 722: FSQRTd	fsqrt	
	.word 0x819c2000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x839d6000  ! 724: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x819ea000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8597a000  ! 726: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbb504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xa9500000  ! 728: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 729: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81946000  ! 730: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbf508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 732: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8d95e000  ! 733: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbd500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 735: RDPR_TPC	<illegal instruction>
	.word 0x8397e000  ! 736: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbd504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x819fe000  ! 738: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8395e000  ! 739: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb350c000  ! 740: RDPR_TT	<illegal instruction>
	.word 0x81962000  ! 741: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb9500000  ! 742: RDPR_TPC	<illegal instruction>
	.word 0xbda78940  ! 743: FMULd	fmuld	%f30, %f0, %f30
	.word 0x87972000  ! 744: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8194e000  ! 745: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x85962000  ! 746: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa9500000  ! 747: RDPR_TPC	<illegal instruction>
	.word 0x8397e000  ! 748: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x83946000  ! 749: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa350c000  ! 750: RDPR_TT	<illegal instruction>
	.word 0xaba709a0  ! 751: FDIVs	fdivs	%f28, %f0, %f21
	.word 0x839de000  ! 752: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa5504000  ! 753: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 754: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819fa000  ! 755: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xafa749e0  ! 756: FDIVq	dis not found

	.word 0xa150c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 758: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xbf500000  ! 759: RDPR_TPC	<illegal instruction>
	.word 0xbd50c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 762: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa150c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 764: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xab500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 766: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 767: RDPR_TSTATE	<illegal instruction>
	.word 0xab504000  ! 768: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 769: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839ee000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb5500000  ! 771: RDPR_TPC	<illegal instruction>
	.word 0x83962000  ! 772: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb150c000  ! 773: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 774: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819fa000  ! 775: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa7504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 777: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 778: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819fe000  ! 779: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb9504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xaba48960  ! 781: FMULq	dis not found

	.word 0xb3a40960  ! 782: FMULq	dis not found

	.word 0x819da000  ! 783: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb350c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xbba448e0  ! 785: FSUBq	dis not found

	.word 0x8d95e000  ! 786: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8196e000  ! 787: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8596e000  ! 788: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa7a448a0  ! 789: FSUBs	fsubs	%f17, %f0, %f19
	.word 0x819ce000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x839d6000  ! 791: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xaba5c9c0  ! 792: FDIVd	fdivd	%f54, %f0, %f52
	.word 0x8395e000  ! 793: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d952000  ! 794: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb7504000  ! 795: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 796: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 798: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa9a78920  ! 799: FMULs	fmuls	%f30, %f0, %f20
	.word 0xb5504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0x819f2000  ! 801: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x819ce000  ! 802: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbfa00560  ! 803: FSQRTq	fsqrt	
	.word 0x819e6000  ! 804: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x87956000  ! 805: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d952000  ! 806: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa5a509a0  ! 807: FDIVs	fdivs	%f20, %f0, %f18
	.word 0xb7a00540  ! 808: FSQRTd	fsqrt	
	.word 0xab504000  ! 809: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 811: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbd504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 813: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 814: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xaf500000  ! 815: RDPR_TPC	<illegal instruction>
	.word 0xb3a00540  ! 816: FSQRTd	fsqrt	
	.word 0xa1500000  ! 817: RDPR_TPC	<illegal instruction>
	.word 0x819fa000  ! 818: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa9a44820  ! 819: FADDs	fadds	%f17, %f0, %f20
	.word 0x8595e000  ! 820: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d956000  ! 821: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x85952000  ! 822: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa7508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 824: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xada00560  ! 825: FSQRTq	fsqrt	
	.word 0x8195e000  ! 826: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8595a000  ! 827: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbda588e0  ! 828: FSUBq	dis not found

	.word 0x83966000  ! 829: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819f6000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa1508000  ! 831: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 832: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa7500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x839ca000  ! 834: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8595a000  ! 835: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x87972000  ! 836: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8d976000  ! 837: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8197a000  ! 838: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb7a6c9c0  ! 839: FDIVd	fdivd	%f58, %f0, %f58
	.word 0xb5a7c9e0  ! 840: FDIVq	dis not found

	.word 0xa5508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a789e0  ! 842: FDIVq	dis not found

	.word 0x85972000  ! 843: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb9504000  ! 844: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 845: RDPR_TPC	<illegal instruction>
	.word 0xb9a408a0  ! 846: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xad508000  ! 847: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a748e0  ! 848: FSUBq	dis not found

	.word 0xbfa00520  ! 849: FSQRTs	fsqrt	
	.word 0xa7a7c860  ! 850: FADDq	dis not found

	.word 0x85962000  ! 851: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbd500000  ! 852: RDPR_TPC	<illegal instruction>
	.word 0x87976000  ! 853: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa5508000  ! 854: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 855: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 856: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8395e000  ! 857: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x819c6000  ! 858: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb1504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 860: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x87952000  ! 861: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8396a000  ! 862: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb550c000  ! 863: RDPR_TT	<illegal instruction>
	.word 0xbf50c000  ! 864: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 865: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8596a000  ! 866: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8194a000  ! 867: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819c2000  ! 868: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa3504000  ! 869: RDPR_TNPC	<illegal instruction>
	.word 0x8396e000  ! 870: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8195e000  ! 871: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbf508000  ! 872: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 873: RDPR_TT	<illegal instruction>
	.word 0x839ea000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x8d97a000  ! 875: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x83942000  ! 876: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d94e000  ! 877: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x87966000  ! 878: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb750c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 880: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x81962000  ! 881: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x87976000  ! 882: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb9500000  ! 883: RDPR_TPC	<illegal instruction>
	.word 0x839f6000  ! 884: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819c2000  ! 885: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8394a000  ! 886: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbd504000  ! 887: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 888: RDPR_TNPC	<illegal instruction>
	.word 0x839c2000  ! 889: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb9a00560  ! 890: FSQRTq	fsqrt	
	.word 0x81976000  ! 891: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819da000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819c6000  ! 893: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x85962000  ! 894: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa5508000  ! 895: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e000  ! 896: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa3a70860  ! 897: FADDq	dis not found

	.word 0x8d952000  ! 898: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839ce000  ! 899: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa3a7c860  ! 900: FADDq	dis not found

	.word 0xa1a78960  ! 901: FMULq	dis not found

	.word 0x8d95a000  ! 902: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819fa000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb5508000  ! 904: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 905: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7504000  ! 906: RDPR_TNPC	<illegal instruction>
	.word 0x8d962000  ! 907: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xad500000  ! 908: RDPR_TPC	<illegal instruction>
	.word 0xada448a0  ! 909: FSUBs	fsubs	%f17, %f0, %f22
	.word 0x83962000  ! 910: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xafa44960  ! 911: FMULq	dis not found

	.word 0x8597e000  ! 912: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8194e000  ! 913: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x81946000  ! 914: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x83952000  ! 915: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa7504000  ! 916: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 917: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8595a000  ! 918: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8397e000  ! 919: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb5500000  ! 920: RDPR_TPC	<illegal instruction>
	.word 0x8196e000  ! 921: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbfa00540  ! 922: FSQRTd	fsqrt	
	.word 0xb3504000  ! 923: RDPR_TNPC	<illegal instruction>
	.word 0xaba60840  ! 924: FADDd	faddd	%f24, %f0, %f52
	.word 0x8597a000  ! 925: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8595a000  ! 926: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xaba6c820  ! 927: FADDs	fadds	%f27, %f0, %f21
	.word 0x819f6000  ! 928: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x83962000  ! 929: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839ea000  ! 930: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x81972000  ! 931: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb3a00520  ! 932: FSQRTs	fsqrt	
	.word 0x81962000  ! 933: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x81972000  ! 934: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x83966000  ! 935: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8594e000  ! 936: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb5a00560  ! 937: FSQRTq	fsqrt	
	.word 0xb350c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xbfa6c860  ! 939: FADDq	dis not found

	.word 0xa5504000  ! 940: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00520  ! 941: FSQRTs	fsqrt	
	.word 0x839e2000  ! 942: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa1508000  ! 943: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 944: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x85946000  ! 945: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x83942000  ! 946: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8395a000  ! 947: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x81942000  ! 948: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x81976000  ! 949: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbf500000  ! 950: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 951: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d952000  ! 952: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb9a548c0  ! 953: FSUBd	fsubd	%f52, %f0, %f28
	.word 0x87962000  ! 954: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xafa00520  ! 955: FSQRTs	fsqrt	
	.word 0x819d2000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xad50c000  ! 957: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 958: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 960: RDPR_TPC	<illegal instruction>
	.word 0x8d95a000  ! 961: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xad508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 963: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 964: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x839fe000  ! 965: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbba709e0  ! 966: FDIVq	dis not found

	.word 0xbfa00540  ! 967: FSQRTd	fsqrt	
	.word 0x87952000  ! 968: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbba4c8a0  ! 969: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xbb504000  ! 970: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 971: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xab508000  ! 972: RDPR_TSTATE	<illegal instruction>
	.word 0x8396a000  ! 973: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb3a7c960  ! 974: FMULq	dis not found

	.word 0x8194a000  ! 975: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa9508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xbba449e0  ! 977: FDIVq	dis not found

	.word 0xb9504000  ! 978: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 980: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 981: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819ca000  ! 982: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa5504000  ! 983: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 984: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbb500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0xb9a50860  ! 986: FADDq	dis not found

	.word 0xa9508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 988: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbd504000  ! 989: RDPR_TNPC	<illegal instruction>
	.word 0xbda64940  ! 990: FMULd	fmuld	%f56, %f0, %f30
	.word 0xb3508000  ! 991: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96e000  ! 992: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x87942000  ! 993: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbf500000  ! 994: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 995: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa1508000  ! 996: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 997: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 998: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
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
	.word 0xb9a50820  ! 1: FADDs	fadds	%f20, %f0, %f28
	.word 0x819e6000  ! 2: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x819fa000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xbd504000  ! 4: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x839e6000  ! 5: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb1a708c0  ! 6: FSUBd	fsubd	%f28, %f0, %f24
	.word 0xb550c000  ! 7: RDPR_TT	rdpr	%tt, %r26
	.word 0xa3500000  ! 8: RDPR_TPC	<illegal instruction>
	.word 0x8d966000  ! 9: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ea000  ! 10: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb3508000  ! 11: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x8794a000  ! 12: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x83952000  ! 13: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8396a000  ! 14: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb1508000  ! 15: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xbd504000  ! 16: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00560  ! 17: FSQRTq	fsqrt	
	.word 0x819c2000  ! 18: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d966000  ! 19: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x85962000  ! 20: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8d94e000  ! 21: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb5508000  ! 22: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbf504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0x819ee000  ! 24: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa3a00520  ! 25: FSQRTs	fsqrt	
	.word 0xa350c000  ! 26: RDPR_TT	rdpr	%tt, %r17
	.word 0xbda6c9a0  ! 27: FDIVs	fdivs	%f27, %f0, %f30
	.word 0xb350c000  ! 28: RDPR_TT	<illegal instruction>
	.word 0xbf50c000  ! 29: RDPR_TT	<illegal instruction>
	.word 0x8195e000  ! 30: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbf508000  ! 31: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x8794e000  ! 32: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa5a40860  ! 33: FADDq	dis not found

	.word 0xa1508000  ! 34: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x819e2000  ! 35: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8397e000  ! 36: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb7508000  ! 37: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8795e000  ! 38: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa1508000  ! 39: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8d95a000  ! 40: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa7a608a0  ! 41: FSUBs	fsubs	%f24, %f0, %f19
	.word 0x8195a000  ! 42: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x839fa000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x83942000  ! 44: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbb508000  ! 45: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x87942000  ! 46: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa5a6c9e0  ! 47: FDIVq	dis not found

	.word 0x8d95e000  ! 48: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb5500000  ! 49: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xb9a64820  ! 50: FADDs	fadds	%f25, %f0, %f28
	.word 0x8d94e000  ! 51: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa7504000  ! 52: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xaf50c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x8195e000  ! 54: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x85972000  ! 55: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x839e2000  ! 56: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819d2000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d966000  ! 58: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa7a709e0  ! 59: FDIVq	dis not found

	.word 0xa5508000  ! 60: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa5504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8596e000  ! 63: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa1504000  ! 64: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x81946000  ! 65: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xad508000  ! 66: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xa3a68860  ! 67: FADDq	dis not found

	.word 0xbba7c8e0  ! 68: FSUBq	dis not found

	.word 0x85966000  ! 69: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa9508000  ! 70: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x83942000  ! 71: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d976000  ! 72: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x87976000  ! 73: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8197a000  ! 74: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa1a7c960  ! 75: FMULq	dis not found

	.word 0x819ee000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb3a4c8a0  ! 77: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xbf508000  ! 78: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xa350c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0x8d966000  ! 80: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb150c000  ! 81: RDPR_TT	rdpr	%tt, %r24
	.word 0x8595e000  ! 82: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8595a000  ! 83: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb5a6c960  ! 84: FMULq	dis not found

	.word 0xa1500000  ! 85: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8d962000  ! 86: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x819da000  ! 87: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb1500000  ! 88: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x85942000  ! 89: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xad500000  ! 90: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8597a000  ! 91: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbd50c000  ! 92: RDPR_TT	rdpr	%tt, %r30
	.word 0x8197e000  ! 93: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb3504000  ! 94: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xaba649e0  ! 95: FDIVq	dis not found

	.word 0xa1a6c840  ! 96: FADDd	faddd	%f58, %f0, %f16
	.word 0xbfa00520  ! 97: FSQRTs	fsqrt	
	.word 0x85946000  ! 98: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87946000  ! 99: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb1508000  ! 100: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8d97e000  ! 101: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819c6000  ! 102: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x85976000  ! 103: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb5a40940  ! 104: FMULd	fmuld	%f16, %f0, %f26
	.word 0x8d952000  ! 105: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbf508000  ! 106: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xa9508000  ! 107: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 108: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 109: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d96a000  ! 110: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb1a70860  ! 111: FADDq	dis not found

	.word 0xaba00540  ! 112: FSQRTd	fsqrt	
	.word 0x819c6000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb5a589c0  ! 114: FDIVd	fdivd	%f22, %f0, %f26
	.word 0x87942000  ! 115: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa1a60840  ! 116: FADDd	faddd	%f24, %f0, %f16
	.word 0xb3a4c8c0  ! 117: FSUBd	fsubd	%f50, %f0, %f56
	.word 0x8796e000  ! 118: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8196a000  ! 119: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa950c000  ! 120: RDPR_TT	rdpr	%tt, %r20
	.word 0x8394e000  ! 121: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839d6000  ! 122: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa3504000  ! 123: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8d956000  ! 124: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa5504000  ! 125: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x83956000  ! 126: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa7a54920  ! 127: FMULs	fmuls	%f21, %f0, %f19
	.word 0x8795e000  ! 128: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xad504000  ! 129: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x839fa000  ! 130: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xbf500000  ! 131: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x8d97e000  ! 132: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8195e000  ! 133: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x819d2000  ! 134: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8197e000  ! 135: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb7508000  ! 136: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x85942000  ! 137: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb9a788a0  ! 138: FSUBs	fsubs	%f30, %f0, %f28
	.word 0xb1500000  ! 139: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xbf50c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 141: RDPR_TSTATE	<illegal instruction>
	.word 0x819da000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xaf50c000  ! 143: RDPR_TT	rdpr	%tt, %r23
	.word 0xa7a50920  ! 144: FMULs	fmuls	%f20, %f0, %f19
	.word 0x81942000  ! 145: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8794e000  ! 146: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8797e000  ! 147: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85976000  ! 148: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87946000  ! 149: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xad504000  ! 150: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xa5a00540  ! 151: FSQRTd	fsqrt	
	.word 0xa9a44820  ! 152: FADDs	fadds	%f17, %f0, %f20
	.word 0xa7504000  ! 153: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 154: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8397a000  ! 155: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839de000  ! 156: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x83956000  ! 157: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8795a000  ! 158: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8596e000  ! 159: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x87976000  ! 160: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa1504000  ! 161: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x819d2000  ! 162: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x839de000  ! 163: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8797e000  ! 164: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbb504000  ! 165: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb7508000  ! 166: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 167: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8595e000  ! 168: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbd50c000  ! 169: RDPR_TT	rdpr	%tt, %r30
	.word 0xab500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xb9508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbda00560  ! 172: FSQRTq	fsqrt	
	.word 0xa9504000  ! 173: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 174: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 175: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8596a000  ! 176: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbf500000  ! 177: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xa7500000  ! 178: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 179: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb9500000  ! 180: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x8194a000  ! 181: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d97e000  ! 182: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x839f6000  ! 183: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb5500000  ! 184: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xab508000  ! 185: RDPR_TSTATE	<illegal instruction>
	.word 0x819d2000  ! 186: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x87966000  ! 187: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8194e000  ! 188: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbf500000  ! 189: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x87952000  ! 190: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839da000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x839de000  ! 192: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbba449c0  ! 193: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xa5a4c940  ! 194: FMULd	fmuld	%f50, %f0, %f18
	.word 0xaf500000  ! 195: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x819ce000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81956000  ! 197: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa7500000  ! 198: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xa750c000  ! 199: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 200: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 201: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x87952000  ! 202: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8796e000  ! 203: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8597e000  ! 204: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbda54820  ! 205: FADDs	fadds	%f21, %f0, %f30
	.word 0xbb504000  ! 206: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x85972000  ! 207: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x83952000  ! 208: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819ce000  ! 209: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5500000  ! 210: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xb1a00520  ! 211: FSQRTs	fsqrt	
	.word 0xb9500000  ! 212: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 213: RDPR_TSTATE	<illegal instruction>
	.word 0xbba00540  ! 214: FSQRTd	fsqrt	
	.word 0xb5a508a0  ! 215: FSUBs	fsubs	%f20, %f0, %f26
	.word 0x8594a000  ! 216: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa1a74960  ! 217: FMULq	dis not found

	.word 0xaba70960  ! 218: FMULq	dis not found

	.word 0xab508000  ! 219: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xa9508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 221: RDPR_TNPC	<illegal instruction>
	.word 0x8597e000  ! 222: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb5504000  ! 223: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x839f2000  ! 224: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa7a00560  ! 225: FSQRTq	fsqrt	
	.word 0x819fe000  ! 226: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3a68920  ! 227: FMULs	fmuls	%f26, %f0, %f17
	.word 0x8397a000  ! 228: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb5500000  ! 229: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8395e000  ! 230: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839e6000  ! 231: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbf508000  ! 232: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xa5a00540  ! 233: FSQRTd	fsqrt	
	.word 0xa7508000  ! 234: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 235: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb5a00540  ! 236: FSQRTd	fsqrt	
	.word 0x8195e000  ! 237: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x83942000  ! 238: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa5504000  ! 239: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xaba00540  ! 240: FSQRTd	fsqrt	
	.word 0xa3508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xab504000  ! 242: RDPR_TNPC	<illegal instruction>
	.word 0x8d966000  ! 243: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa950c000  ! 244: RDPR_TT	rdpr	%tt, %r20
	.word 0xada00520  ! 245: FSQRTs	fsqrt	
	.word 0x819da000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d976000  ! 247: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa9a488e0  ! 248: FSUBq	dis not found

	.word 0xada4c9c0  ! 249: FDIVd	fdivd	%f50, %f0, %f22
	.word 0x819ca000  ! 250: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbba649a0  ! 251: FDIVs	fdivs	%f25, %f0, %f29
	.word 0xb3500000  ! 252: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb1504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 254: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 255: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x85972000  ! 256: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x87946000  ! 257: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa3508000  ! 258: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8197a000  ! 259: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839f6000  ! 260: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbf50c000  ! 261: RDPR_TT	rdpr	%tt, %r31
	.word 0xbfa448a0  ! 262: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xa5504000  ! 263: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00560  ! 264: FSQRTq	fsqrt	
	.word 0xaf508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 266: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xad508000  ! 267: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x8d976000  ! 268: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa3500000  ! 269: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xb9508000  ! 270: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 271: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8597a000  ! 272: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839fe000  ! 273: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x81942000  ! 274: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbb508000  ! 275: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb7508000  ! 276: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 277: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8795a000  ! 278: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x87952000  ! 279: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8796a000  ! 280: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819c6000  ! 281: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbd50c000  ! 282: RDPR_TT	rdpr	%tt, %r30
	.word 0x8795a000  ! 283: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb150c000  ! 284: RDPR_TT	rdpr	%tt, %r24
	.word 0x8597a000  ! 285: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xad504000  ! 286: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xaba78820  ! 287: FADDs	fadds	%f30, %f0, %f21
	.word 0xb1508000  ! 288: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0x819da000  ! 290: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8396e000  ! 291: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8794e000  ! 292: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa7500000  ! 293: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x8d966000  ! 294: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa9a6c8c0  ! 295: FSUBd	fsubd	%f58, %f0, %f20
	.word 0x8d96e000  ! 296: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xbfa6c9c0  ! 297: FDIVd	fdivd	%f58, %f0, %f62
	.word 0xb3a00560  ! 298: FSQRTq	fsqrt	
	.word 0x8d94e000  ! 299: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb5508000  ! 300: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xa750c000  ! 301: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 302: RDPR_TT	<illegal instruction>
	.word 0xa1a489c0  ! 303: FDIVd	fdivd	%f18, %f0, %f16
	.word 0x8197e000  ! 304: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xaba70940  ! 305: FMULd	fmuld	%f28, %f0, %f52
	.word 0x85972000  ! 306: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa5508000  ! 307: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x83946000  ! 308: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8d94e000  ! 309: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81966000  ! 310: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa9500000  ! 311: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x819d6000  ! 312: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839d6000  ! 313: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb750c000  ! 314: RDPR_TT	rdpr	%tt, %r27
	.word 0x8795a000  ! 315: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8396e000  ! 316: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb550c000  ! 317: RDPR_TT	rdpr	%tt, %r26
	.word 0xb950c000  ! 318: RDPR_TT	<illegal instruction>
	.word 0x8396e000  ! 319: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x87976000  ! 320: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x83956000  ! 321: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839ea000  ! 322: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x83956000  ! 323: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9508000  ! 324: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x8596a000  ! 325: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8397e000  ! 326: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb9508000  ! 327: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8194e000  ! 328: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x81942000  ! 329: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8395a000  ! 330: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa7508000  ! 331: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xa1a68820  ! 332: FADDs	fadds	%f26, %f0, %f16
	.word 0x839ce000  ! 333: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x83956000  ! 334: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8196e000  ! 335: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb1a78940  ! 336: FMULd	fmuld	%f30, %f0, %f24
	.word 0x83942000  ! 337: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa5a788c0  ! 338: FSUBd	fsubd	%f30, %f0, %f18
	.word 0x8397a000  ! 339: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa1a608a0  ! 340: FSUBs	fsubs	%f24, %f0, %f16
	.word 0x819ea000  ! 341: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8d96e000  ! 342: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb5a44840  ! 343: FADDd	faddd	%f48, %f0, %f26
	.word 0x87972000  ! 344: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa3a589c0  ! 345: FDIVd	fdivd	%f22, %f0, %f48
	.word 0xbda5c960  ! 346: FMULq	dis not found

	.word 0xa150c000  ! 347: RDPR_TT	rdpr	%tt, %r16
	.word 0x839ce000  ! 348: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb150c000  ! 349: RDPR_TT	rdpr	%tt, %r24
	.word 0x8597a000  ! 350: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x85972000  ! 351: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8197e000  ! 352: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x839ee000  ! 353: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa7a40840  ! 354: FADDd	faddd	%f16, %f0, %f50
	.word 0x8795a000  ! 355: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbd50c000  ! 356: RDPR_TT	rdpr	%tt, %r30
	.word 0x8595e000  ! 357: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb550c000  ! 358: RDPR_TT	rdpr	%tt, %r26
	.word 0x8d96e000  ! 359: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x85942000  ! 360: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa1a748e0  ! 361: FSUBq	dis not found

	.word 0xa5a00520  ! 362: FSQRTs	fsqrt	
	.word 0xa550c000  ! 363: RDPR_TT	rdpr	%tt, %r18
	.word 0x81956000  ! 364: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x85942000  ! 365: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8d94a000  ! 366: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xad500000  ! 367: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8d976000  ! 368: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d956000  ! 369: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8794a000  ! 370: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa1a4c9a0  ! 371: FDIVs	fdivs	%f19, %f0, %f16
	.word 0x8595a000  ! 372: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbd508000  ! 373: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8d95e000  ! 374: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d962000  ! 375: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa5a00520  ! 376: FSQRTs	fsqrt	
	.word 0xafa548e0  ! 377: FSUBq	dis not found

	.word 0x8d97e000  ! 378: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb750c000  ! 379: RDPR_TT	rdpr	%tt, %r27
	.word 0xa750c000  ! 380: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 381: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb9a7c9a0  ! 382: FDIVs	fdivs	%f31, %f0, %f28
	.word 0xb550c000  ! 383: RDPR_TT	rdpr	%tt, %r26
	.word 0x819e6000  ! 384: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x87966000  ! 385: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x81976000  ! 386: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839c2000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819c2000  ! 388: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xaf508000  ! 389: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x83976000  ! 390: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819d2000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d956000  ! 392: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa950c000  ! 393: RDPR_TT	rdpr	%tt, %r20
	.word 0x83972000  ! 394: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x819ea000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa7500000  ! 396: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xab500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0x839ca000  ! 398: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb950c000  ! 399: RDPR_TT	rdpr	%tt, %r28
	.word 0x8d94a000  ! 400: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839f6000  ! 401: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xab500000  ! 402: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x83942000  ! 403: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xaf504000  ! 404: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xb750c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x819ee000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x81962000  ! 407: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8197e000  ! 408: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x839ce000  ! 409: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d972000  ! 410: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbd50c000  ! 411: RDPR_TT	rdpr	%tt, %r30
	.word 0xab508000  ! 412: RDPR_TSTATE	<illegal instruction>
	.word 0x819e2000  ! 413: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d94a000  ! 414: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819c2000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb1a489c0  ! 416: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xbfa548a0  ! 417: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xbfa7c820  ! 418: FADDs	fadds	%f31, %f0, %f31
	.word 0x81952000  ! 419: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xad500000  ! 420: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xaba5c960  ! 421: FMULq	dis not found

	.word 0xbf500000  ! 422: RDPR_TPC	<illegal instruction>
	.word 0x81976000  ! 423: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819e2000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb550c000  ! 425: RDPR_TT	rdpr	%tt, %r26
	.word 0x8594a000  ! 426: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb5a609e0  ! 427: FDIVq	dis not found

	.word 0xbba4c840  ! 428: FADDd	faddd	%f50, %f0, %f60
	.word 0xb7a48960  ! 429: FMULq	dis not found

	.word 0x819f6000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xad504000  ! 431: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x839d6000  ! 432: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8795a000  ! 433: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa950c000  ! 434: RDPR_TT	rdpr	%tt, %r20
	.word 0x81942000  ! 435: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x83956000  ! 436: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x87966000  ! 437: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x839ea000  ! 438: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xada58960  ! 439: FMULq	dis not found

	.word 0x819d2000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x839e6000  ! 441: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8797e000  ! 442: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5508000  ! 443: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x85952000  ! 444: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8197e000  ! 445: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87946000  ! 446: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbfa5c9e0  ! 447: FDIVq	dis not found

	.word 0x85942000  ! 448: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x81952000  ! 449: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbd508000  ! 450: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xaf50c000  ! 451: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 453: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8d95e000  ! 454: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d94e000  ! 455: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x85962000  ! 456: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x81952000  ! 457: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x819e6000  ! 458: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8595e000  ! 459: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x83966000  ! 460: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819d6000  ! 461: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81952000  ! 462: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb3504000  ! 463: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x85972000  ! 464: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xada448a0  ! 465: FSUBs	fsubs	%f17, %f0, %f22
	.word 0xb7a7c960  ! 466: FMULq	dis not found

	.word 0xa1500000  ! 467: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8595e000  ! 468: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa3508000  ! 469: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8596e000  ! 470: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839ee000  ! 471: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xaf500000  ! 472: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xab508000  ! 473: RDPR_TSTATE	<illegal instruction>
	.word 0xbda5c9a0  ! 474: FDIVs	fdivs	%f23, %f0, %f30
	.word 0x83962000  ! 475: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819d6000  ! 476: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839f6000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbba60940  ! 478: FMULd	fmuld	%f24, %f0, %f60
	.word 0xab508000  ! 479: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xb550c000  ! 480: RDPR_TT	<illegal instruction>
	.word 0xbba44920  ! 481: FMULs	fmuls	%f17, %f0, %f29
	.word 0x839e2000  ! 482: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d972000  ! 483: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb3a00520  ! 484: FSQRTs	fsqrt	
	.word 0x8194a000  ! 485: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d966000  ! 486: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ce000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb550c000  ! 488: RDPR_TT	rdpr	%tt, %r26
	.word 0x839fe000  ! 489: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbd50c000  ! 490: RDPR_TT	rdpr	%tt, %r30
	.word 0xbd508000  ! 491: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 492: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa5a549a0  ! 493: FDIVs	fdivs	%f21, %f0, %f18
	.word 0x8594e000  ! 494: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8d962000  ! 495: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8195e000  ! 496: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbb500000  ! 497: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbda00540  ! 498: FSQRTd	fsqrt	
	.word 0xb5a50920  ! 499: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbfa68960  ! 500: FMULq	dis not found

	.word 0xbf50c000  ! 501: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8796e000  ! 503: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb9a00560  ! 504: FSQRTq	fsqrt	
	.word 0x8197e000  ! 505: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87952000  ! 506: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x81966000  ! 507: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839e6000  ! 508: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb7a00520  ! 509: FSQRTs	fsqrt	
	.word 0x839d6000  ! 510: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x85976000  ! 511: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x81962000  ! 512: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb5508000  ! 513: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x839c6000  ! 514: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbda68840  ! 515: FADDd	faddd	%f26, %f0, %f30
	.word 0xa1508000  ! 516: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xada748a0  ! 517: FSUBs	fsubs	%f29, %f0, %f22
	.word 0xa7504000  ! 518: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 520: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 521: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb5500000  ! 522: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8d966000  ! 523: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8d95a000  ! 524: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x87952000  ! 525: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83966000  ! 526: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839fa000  ! 527: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8794a000  ! 528: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8795a000  ! 529: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8396e000  ! 530: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa7a64860  ! 531: FADDq	dis not found

	.word 0x85942000  ! 532: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaf500000  ! 533: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x819e6000  ! 534: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x839f6000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x83946000  ! 536: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83952000  ! 537: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819f2000  ! 538: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d97a000  ! 539: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x85952000  ! 540: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbb50c000  ! 541: RDPR_TT	rdpr	%tt, %r29
	.word 0xb9508000  ! 542: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94a000  ! 543: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8594e000  ! 544: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xaf50c000  ! 545: RDPR_TT	rdpr	%tt, %r23
	.word 0x819e6000  ! 546: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbd500000  ! 547: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xb5a00540  ! 548: FSQRTd	fsqrt	
	.word 0x81966000  ! 549: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839ee000  ! 550: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x85972000  ! 551: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81946000  ! 552: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa1504000  ! 553: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x8595a000  ! 554: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8595e000  ! 555: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x87942000  ! 556: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xab508000  ! 557: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xa150c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 559: RDPR_TT	<illegal instruction>
	.word 0xbda00560  ! 560: FSQRTq	fsqrt	
	.word 0xa3a58860  ! 561: FADDq	dis not found

	.word 0x8795e000  ! 562: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb3a64940  ! 563: FMULd	fmuld	%f56, %f0, %f56
	.word 0xa5a549c0  ! 564: FDIVd	fdivd	%f52, %f0, %f18
	.word 0xab50c000  ! 565: RDPR_TT	rdpr	%tt, %r21
	.word 0xab508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 568: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa7a70840  ! 569: FADDd	faddd	%f28, %f0, %f50
	.word 0xa9504000  ! 570: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xbf500000  ! 571: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 572: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819ce000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xad50c000  ! 574: RDPR_TT	rdpr	%tt, %r22
	.word 0x8d95e000  ! 575: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb5500000  ! 576: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8394e000  ! 577: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa3a4c9a0  ! 578: FDIVs	fdivs	%f19, %f0, %f17
	.word 0xab508000  ! 579: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8d952000  ! 580: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8394a000  ! 581: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819f6000  ! 582: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x83962000  ! 583: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819e2000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d94a000  ! 585: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x85976000  ! 586: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xad504000  ! 587: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x8597a000  ! 588: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x83956000  ! 589: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd50c000  ! 590: RDPR_TT	rdpr	%tt, %r30
	.word 0x81946000  ! 591: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xad508000  ! 592: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xb9508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 594: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83962000  ! 595: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbb50c000  ! 596: RDPR_TT	rdpr	%tt, %r29
	.word 0x8d966000  ! 597: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8394e000  ! 598: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8d94a000  ! 599: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8d976000  ! 600: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xbfa58940  ! 601: FMULd	fmuld	%f22, %f0, %f62
	.word 0xaf50c000  ! 602: RDPR_TT	rdpr	%tt, %r23
	.word 0xbb50c000  ! 603: RDPR_TT	<illegal instruction>
	.word 0x839d2000  ! 604: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa7500000  ! 605: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x819ee000  ! 606: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xafa489a0  ! 607: FDIVs	fdivs	%f18, %f0, %f23
	.word 0xa7a74940  ! 608: FMULd	fmuld	%f60, %f0, %f50
	.word 0x8795e000  ! 609: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8d966000  ! 610: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8196e000  ! 611: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa7a48920  ! 612: FMULs	fmuls	%f18, %f0, %f19
	.word 0x8195e000  ! 613: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8d962000  ! 614: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83942000  ! 615: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d97a000  ! 616: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb3508000  ! 617: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xa7a648e0  ! 618: FSUBq	dis not found

	.word 0x87962000  ! 619: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb9504000  ! 620: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbb50c000  ! 621: RDPR_TT	<illegal instruction>
	.word 0xafa78820  ! 622: FADDs	fadds	%f30, %f0, %f23
	.word 0xa750c000  ! 623: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 624: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x87942000  ! 625: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8d96e000  ! 626: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x85956000  ! 627: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8596a000  ! 628: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa3a00520  ! 629: FSQRTs	fsqrt	
	.word 0xa9508000  ! 630: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xa9a54960  ! 631: FMULq	dis not found

	.word 0xad504000  ! 632: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 633: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xaf50c000  ! 634: RDPR_TT	rdpr	%tt, %r23
	.word 0xbb50c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0x839e6000  ! 636: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8794a000  ! 637: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8396e000  ! 638: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8195e000  ! 639: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8396a000  ! 640: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbf504000  ! 641: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x839e6000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8d942000  ! 643: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa3a50860  ! 644: FADDq	dis not found

	.word 0xa5a74960  ! 645: FMULq	dis not found

	.word 0xa150c000  ! 646: RDPR_TT	rdpr	%tt, %r16
	.word 0xab504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0xb9a789e0  ! 648: FDIVq	dis not found

	.word 0xb3a50860  ! 649: FADDq	dis not found

	.word 0x839c2000  ! 650: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xaf500000  ! 651: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8595e000  ! 652: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x819f6000  ! 653: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa3500000  ! 654: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xb150c000  ! 655: RDPR_TT	<illegal instruction>
	.word 0x839e6000  ! 656: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819c2000  ! 657: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb9a5c820  ! 658: FADDs	fadds	%f23, %f0, %f28
	.word 0xbd500000  ! 659: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xada448c0  ! 660: FSUBd	fsubd	%f48, %f0, %f22
	.word 0xa9500000  ! 661: RDPR_TPC	<illegal instruction>
	.word 0x839ca000  ! 662: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819f6000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa9a788e0  ! 664: FSUBq	dis not found

	.word 0xbba00560  ! 665: FSQRTq	fsqrt	
	.word 0x8d94a000  ! 666: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xada549e0  ! 667: FDIVq	dis not found

	.word 0xada588a0  ! 668: FSUBs	fsubs	%f22, %f0, %f22
	.word 0xbba649c0  ! 669: FDIVd	fdivd	%f56, %f0, %f60
	.word 0x8594a000  ! 670: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb7a5c8e0  ! 671: FSUBq	dis not found

	.word 0x8796a000  ! 672: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbda50820  ! 673: FADDs	fadds	%f20, %f0, %f30
	.word 0xb3a64840  ! 674: FADDd	faddd	%f56, %f0, %f56
	.word 0xb1508000  ! 675: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xbb50c000  ! 676: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 677: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8394e000  ! 678: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x85956000  ! 679: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8797a000  ! 680: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbba00560  ! 681: FSQRTq	fsqrt	
	.word 0x83976000  ! 682: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb950c000  ! 683: RDPR_TT	rdpr	%tt, %r28
	.word 0x8d956000  ! 684: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa1a5c9c0  ! 685: FDIVd	fdivd	%f54, %f0, %f16
	.word 0xb1a68820  ! 686: FADDs	fadds	%f26, %f0, %f24
	.word 0x8596e000  ! 687: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8d976000  ! 688: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8395a000  ! 689: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa9508000  ! 690: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x819c2000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d97a000  ! 692: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x87972000  ! 693: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8795e000  ! 694: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa1a64860  ! 695: FADDq	dis not found

	.word 0x8595e000  ! 696: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x87962000  ! 697: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d952000  ! 698: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa3500000  ! 699: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa5a489e0  ! 700: FDIVq	dis not found

	.word 0xbfa00520  ! 701: FSQRTs	fsqrt	
	.word 0xb7a78820  ! 702: FADDs	fadds	%f30, %f0, %f27
	.word 0x8d96e000  ! 703: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x81952000  ! 704: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x85952000  ! 705: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xad508000  ! 706: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xbba48840  ! 707: FADDd	faddd	%f18, %f0, %f60
	.word 0xaba78940  ! 708: FMULd	fmuld	%f30, %f0, %f52
	.word 0xb5508000  ! 709: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a44860  ! 710: FADDq	dis not found

	.word 0xb750c000  ! 711: RDPR_TT	<illegal instruction>
	.word 0xa7a6c920  ! 712: FMULs	fmuls	%f27, %f0, %f19
	.word 0x839ce000  ! 713: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa5500000  ! 714: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xa750c000  ! 715: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 716: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa1504000  ! 717: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x839fe000  ! 718: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa9508000  ! 719: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x83946000  ! 720: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xad50c000  ! 721: RDPR_TT	rdpr	%tt, %r22
	.word 0xa5a00540  ! 722: FSQRTd	fsqrt	
	.word 0x819e2000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x839f6000  ! 724: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819fe000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x85972000  ! 726: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xad504000  ! 727: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xa7500000  ! 728: RDPR_TPC	<illegal instruction>
	.word 0x819e6000  ! 729: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8197e000  ! 730: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa7508000  ! 731: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x83972000  ! 732: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8d97e000  ! 733: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb7500000  ! 734: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb1500000  ! 735: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 736: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xab504000  ! 737: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x819da000  ! 738: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8396a000  ! 739: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xab50c000  ! 740: RDPR_TT	rdpr	%tt, %r21
	.word 0x8194e000  ! 741: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa1500000  ! 742: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xb3a64940  ! 743: FMULd	fmuld	%f56, %f0, %f56
	.word 0x8795e000  ! 744: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8196a000  ! 745: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x85966000  ! 746: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb5500000  ! 747: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8395e000  ! 748: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8396a000  ! 749: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb350c000  ! 750: RDPR_TT	rdpr	%tt, %r25
	.word 0xa9a4c9a0  ! 751: FDIVs	fdivs	%f19, %f0, %f20
	.word 0x839fa000  ! 752: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa1504000  ! 753: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x83952000  ! 754: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819ce000  ! 755: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb5a589e0  ! 756: FDIVq	dis not found

	.word 0xad50c000  ! 757: RDPR_TT	rdpr	%tt, %r22
	.word 0x8d962000  ! 758: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xaf500000  ! 759: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa350c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x8596e000  ! 762: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb750c000  ! 763: RDPR_TT	rdpr	%tt, %r27
	.word 0x8d966000  ! 764: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbb500000  ! 765: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xa5500000  ! 766: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 767: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 768: RDPR_TNPC	<illegal instruction>
	.word 0x8396e000  ! 769: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x839f6000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xad500000  ! 771: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8395a000  ! 772: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa950c000  ! 773: RDPR_TT	rdpr	%tt, %r20
	.word 0x8594a000  ! 774: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x819c6000  ! 775: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa9504000  ! 776: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xaf500000  ! 777: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 778: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x819ee000  ! 779: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa3504000  ! 780: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa5a5c960  ! 781: FMULq	dis not found

	.word 0xb3a6c960  ! 782: FMULq	dis not found

	.word 0x819ce000  ! 783: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb150c000  ! 784: RDPR_TT	rdpr	%tt, %r24
	.word 0xafa4c8e0  ! 785: FSUBq	dis not found

	.word 0x8d95e000  ! 786: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8194e000  ! 787: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x85952000  ! 788: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa7a788a0  ! 789: FSUBs	fsubs	%f30, %f0, %f19
	.word 0x819ca000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x839ce000  ! 791: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa1a6c9c0  ! 792: FDIVd	fdivd	%f58, %f0, %f16
	.word 0x83962000  ! 793: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8d96e000  ! 794: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xaf504000  ! 795: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xbb508000  ! 796: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 798: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa5a74920  ! 799: FMULs	fmuls	%f29, %f0, %f18
	.word 0xad504000  ! 800: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x819c2000  ! 801: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x819ea000  ! 802: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xada00560  ! 803: FSQRTq	fsqrt	
	.word 0x819ea000  ! 804: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8795a000  ! 805: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8d94e000  ! 806: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbda5c9a0  ! 807: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xa9a00540  ! 808: FSQRTd	fsqrt	
	.word 0xbd504000  ! 809: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb350c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 811: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbb504000  ! 812: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xa9508000  ! 813: RDPR_TSTATE	<illegal instruction>
	.word 0x819da000  ! 814: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xaf500000  ! 815: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa5a00540  ! 816: FSQRTd	fsqrt	
	.word 0xb9500000  ! 817: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 818: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbba68820  ! 819: FADDs	fadds	%f26, %f0, %f29
	.word 0x85966000  ! 820: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d97a000  ! 821: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x85976000  ! 822: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xab508000  ! 823: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8397e000  ! 824: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb7a00560  ! 825: FSQRTq	fsqrt	
	.word 0x81952000  ! 826: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8596a000  ! 827: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb1a508e0  ! 828: FSUBq	dis not found

	.word 0x8394a000  ! 829: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819c2000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xad508000  ! 831: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x8595e000  ! 832: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xaf500000  ! 833: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x839fe000  ! 834: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8597a000  ! 835: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8795e000  ! 836: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8d94e000  ! 837: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81976000  ! 838: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb1a589c0  ! 839: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb5a6c9e0  ! 840: FDIVq	dis not found

	.word 0xa9508000  ! 841: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xbfa589e0  ! 842: FDIVq	dis not found

	.word 0x8597e000  ! 843: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa1504000  ! 844: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa3500000  ! 845: RDPR_TPC	<illegal instruction>
	.word 0xa1a648a0  ! 846: FSUBs	fsubs	%f25, %f0, %f16
	.word 0xa7508000  ! 847: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa508e0  ! 848: FSUBq	dis not found

	.word 0xb7a00520  ! 849: FSQRTs	fsqrt	
	.word 0xa7a6c860  ! 850: FADDq	dis not found

	.word 0x8597e000  ! 851: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xad500000  ! 852: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8794e000  ! 853: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbd508000  ! 854: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb7500000  ! 855: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 856: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8394e000  ! 857: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819ca000  ! 858: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb7504000  ! 859: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8597e000  ! 860: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x87952000  ! 861: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83972000  ! 862: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbb50c000  ! 863: RDPR_TT	rdpr	%tt, %r29
	.word 0xb950c000  ! 864: RDPR_TT	<illegal instruction>
	.word 0x8d942000  ! 865: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8595e000  ! 866: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8194e000  ! 867: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x819da000  ! 868: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbd504000  ! 869: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x8396e000  ! 870: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8197e000  ! 871: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb9508000  ! 872: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xb550c000  ! 873: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8d96e000  ! 875: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8394a000  ! 876: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8d952000  ! 877: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x87952000  ! 878: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbb50c000  ! 879: RDPR_TT	rdpr	%tt, %r29
	.word 0x819de000  ! 880: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8195a000  ! 881: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8797a000  ! 882: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb5500000  ! 883: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x839f6000  ! 884: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819de000  ! 885: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x83946000  ! 886: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb3504000  ! 887: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xa7504000  ! 888: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 889: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb9a00560  ! 890: FSQRTq	fsqrt	
	.word 0x81946000  ! 891: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819ea000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x819fe000  ! 893: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8596e000  ! 894: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa3508000  ! 895: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8d972000  ! 896: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xada6c860  ! 897: FADDq	dis not found

	.word 0x8d97a000  ! 898: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x839c6000  ! 899: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb5a4c860  ! 900: FADDq	dis not found

	.word 0xa5a74960  ! 901: FMULq	dis not found

	.word 0x8d95a000  ! 902: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819de000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbb508000  ! 904: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x8595a000  ! 905: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbb504000  ! 906: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x8d95a000  ! 907: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb7500000  ! 908: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb9a608a0  ! 909: FSUBs	fsubs	%f24, %f0, %f28
	.word 0x8395a000  ! 910: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xafa6c960  ! 911: FMULq	dis not found

	.word 0x8594e000  ! 912: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x81966000  ! 913: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8194a000  ! 914: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8397a000  ! 915: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbb504000  ! 916: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x83946000  ! 917: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x85976000  ! 918: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8397a000  ! 919: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa9500000  ! 920: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x8194e000  ! 921: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb1a00540  ! 922: FSQRTd	fsqrt	
	.word 0xbf504000  ! 923: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xa9a5c840  ! 924: FADDd	faddd	%f54, %f0, %f20
	.word 0x85962000  ! 925: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8596a000  ! 926: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb1a54820  ! 927: FADDs	fadds	%f21, %f0, %f24
	.word 0x819c2000  ! 928: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8394a000  ! 929: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839c2000  ! 930: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8195a000  ! 931: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9a00520  ! 932: FSQRTs	fsqrt	
	.word 0x8194e000  ! 933: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x81976000  ! 934: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8395a000  ! 935: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x85976000  ! 936: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa7a00560  ! 937: FSQRTq	fsqrt	
	.word 0xa950c000  ! 938: RDPR_TT	rdpr	%tt, %r20
	.word 0xb3a74860  ! 939: FADDq	dis not found

	.word 0xa3504000  ! 940: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00520  ! 941: FSQRTs	fsqrt	
	.word 0x839c6000  ! 942: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb9508000  ! 943: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8d946000  ! 944: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8594e000  ! 945: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x83976000  ! 946: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x83952000  ! 947: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8197e000  ! 948: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8195e000  ! 949: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9500000  ! 950: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x8797e000  ! 951: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d96a000  ! 952: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb7a588c0  ! 953: FSUBd	fsubd	%f22, %f0, %f58
	.word 0x87952000  ! 954: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb5a00520  ! 955: FSQRTs	fsqrt	
	.word 0x819ce000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb150c000  ! 957: RDPR_TT	rdpr	%tt, %r24
	.word 0xaf500000  ! 958: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0xa7500000  ! 960: RDPR_TPC	<illegal instruction>
	.word 0x8d942000  ! 961: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb3508000  ! 962: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb9500000  ! 963: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 964: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839ee000  ! 965: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb7a509e0  ! 966: FDIVq	dis not found

	.word 0xb9a00540  ! 967: FSQRTd	fsqrt	
	.word 0x8797e000  ! 968: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb9a508a0  ! 969: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xad504000  ! 970: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x87976000  ! 971: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbd508000  ! 972: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8395a000  ! 973: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb7a7c960  ! 974: FMULq	dis not found

	.word 0x8196e000  ! 975: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb5508000  ! 976: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb5a709e0  ! 977: FDIVq	dis not found

	.word 0xad504000  ! 978: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 980: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 981: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x819ca000  ! 982: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xaf504000  ! 983: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x8197e000  ! 984: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xad500000  ! 985: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xb5a7c860  ! 986: FADDq	dis not found

	.word 0xa9508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 988: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa3504000  ! 989: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa5a44940  ! 990: FMULd	fmuld	%f48, %f0, %f18
	.word 0xb1508000  ! 991: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 992: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x87952000  ! 993: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb7500000  ! 994: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x81942000  ! 995: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb9508000  ! 996: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xab50c000  ! 997: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 998: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
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
	.word 0xbda54820  ! 1: FADDs	fadds	%f21, %f0, %f30
	.word 0x819de000  ! 2: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x819ea000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb5504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 5: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xaba688c0  ! 6: FSUBd	fsubd	%f26, %f0, %f52
	.word 0xa350c000  ! 7: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 8: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 9: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819f6000  ! 10: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xad508000  ! 11: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 12: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8397e000  ! 13: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8395e000  ! 14: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa1508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xbb504000  ! 16: RDPR_TNPC	<illegal instruction>
	.word 0xb9a00560  ! 17: FSQRTq	fsqrt	
	.word 0x819fa000  ! 18: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d972000  ! 19: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x85966000  ! 20: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d946000  ! 21: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb9508000  ! 22: RDPR_TSTATE	<illegal instruction>
	.word 0xa1504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0x819e2000  ! 24: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa1a00520  ! 25: FSQRTs	fsqrt	
	.word 0xbf50c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xb5a709a0  ! 27: FDIVs	fdivs	%f28, %f0, %f26
	.word 0xa750c000  ! 28: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 29: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 30: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbb508000  ! 31: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x8795a000  ! 32: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xb1a50860  ! 33: FADDq	dis not found

	.word 0xad508000  ! 34: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x819ca000  ! 35: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x83946000  ! 36: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa5508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 38: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbb508000  ! 39: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0x8d97a000  ! 40: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb7a648a0  ! 41: FSUBs	fsubs	%f25, %f0, %f27
	.word 0x8197a000  ! 42: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839e2000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8394e000  ! 44: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbb508000  ! 45: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 46: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb3a589e0  ! 47: FDIVq	dis not found

	.word 0x8d976000  ! 48: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xaf500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xafa44820  ! 50: FADDs	fadds	%f17, %f0, %f23
	.word 0x8d95a000  ! 51: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb5504000  ! 52: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 54: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8595a000  ! 55: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839ca000  ! 56: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819d6000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d94a000  ! 58: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa7a489e0  ! 59: FDIVq	dis not found

	.word 0xbb508000  ! 60: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 63: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa5504000  ! 64: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x81956000  ! 65: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb3508000  ! 66: RDPR_TSTATE	<illegal instruction>
	.word 0xafa58860  ! 67: FADDq	dis not found

	.word 0xb7a7c8e0  ! 68: FSUBq	dis not found

	.word 0x8594e000  ! 69: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb9508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 71: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d97a000  ! 72: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8794a000  ! 73: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8195e000  ! 74: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xafa48960  ! 75: FMULq	dis not found

	.word 0x819fe000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xaba608a0  ! 77: FSUBs	fsubs	%f24, %f0, %f21
	.word 0xa1508000  ! 78: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xbb50c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 80: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xad50c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 82: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8596a000  ! 83: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa5a6c960  ! 84: FMULq	dis not found

	.word 0xad500000  ! 85: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8d966000  ! 86: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819da000  ! 87: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xab500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 89: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7500000  ! 90: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 91: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb550c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0x8195a000  ! 93: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb1504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0xbda689e0  ! 95: FDIVq	dis not found

	.word 0xada44840  ! 96: FADDd	faddd	%f48, %f0, %f22
	.word 0xbba00520  ! 97: FSQRTs	fsqrt	
	.word 0x85956000  ! 98: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8795e000  ! 99: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa1508000  ! 100: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94a000  ! 101: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819d2000  ! 102: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x85956000  ! 103: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbfa6c940  ! 104: FMULd	fmuld	%f58, %f0, %f62
	.word 0x8d94e000  ! 105: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb1508000  ! 106: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb5508000  ! 107: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 108: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 109: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8d952000  ! 110: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbda5c860  ! 111: FADDq	dis not found

	.word 0xa7a00540  ! 112: FSQRTd	fsqrt	
	.word 0x819ca000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xada549c0  ! 114: FDIVd	fdivd	%f52, %f0, %f22
	.word 0x87976000  ! 115: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xafa48840  ! 116: FADDd	faddd	%f18, %f0, %f54
	.word 0xafa448c0  ! 117: FSUBd	fsubd	%f48, %f0, %f54
	.word 0x8795e000  ! 118: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8194a000  ! 119: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb350c000  ! 120: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 121: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839c6000  ! 122: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa5504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 124: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa5504000  ! 125: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 126: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa1a54920  ! 127: FMULs	fmuls	%f21, %f0, %f16
	.word 0x8794e000  ! 128: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xaf504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0x839c2000  ! 130: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb5500000  ! 131: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8d97e000  ! 132: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x81972000  ! 133: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819d2000  ! 134: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8196e000  ! 135: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa3508000  ! 136: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 137: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb1a688a0  ! 138: FSUBs	fsubs	%f26, %f0, %f24
	.word 0xbf500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 141: RDPR_TSTATE	<illegal instruction>
	.word 0x819fa000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xbd50c000  ! 143: RDPR_TT	<illegal instruction>
	.word 0xb9a40920  ! 144: FMULs	fmuls	%f16, %f0, %f28
	.word 0x8194e000  ! 145: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x87942000  ! 146: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x87962000  ! 147: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x85972000  ! 148: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8796a000  ! 149: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa9504000  ! 150: RDPR_TNPC	<illegal instruction>
	.word 0xb9a00540  ! 151: FSQRTd	fsqrt	
	.word 0xbba4c820  ! 152: FADDs	fadds	%f19, %f0, %f29
	.word 0xab504000  ! 153: RDPR_TNPC	<illegal instruction>
	.word 0x8597e000  ! 154: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8394e000  ! 155: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839ee000  ! 156: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8394e000  ! 157: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x87976000  ! 158: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8596e000  ! 159: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8794a000  ! 160: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xad504000  ! 161: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x819c6000  ! 162: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x839de000  ! 163: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x87946000  ! 164: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb7504000  ! 165: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 166: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a000  ! 167: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85942000  ! 168: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa150c000  ! 169: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xbf508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa00560  ! 172: FSQRTq	fsqrt	
	.word 0xa7504000  ! 173: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 174: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 175: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x85966000  ! 176: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbb500000  ! 177: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xa1500000  ! 178: RDPR_TPC	<illegal instruction>
	.word 0x8d972000  ! 179: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb7500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 181: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8d95a000  ! 182: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x839d6000  ! 183: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa1500000  ! 184: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 185: RDPR_TSTATE	<illegal instruction>
	.word 0x819c6000  ! 186: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8794e000  ! 187: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8195a000  ! 188: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa1500000  ! 189: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x87972000  ! 190: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839ce000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839f6000  ! 192: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa9a4c9c0  ! 193: FDIVd	fdivd	%f50, %f0, %f20
	.word 0xada70940  ! 194: FMULd	fmuld	%f28, %f0, %f22
	.word 0xa5500000  ! 195: RDPR_TPC	<illegal instruction>
	.word 0x819f6000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x81962000  ! 197: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa7500000  ! 198: RDPR_TPC	<illegal instruction>
	.word 0xad50c000  ! 199: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 200: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 201: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x87946000  ! 202: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8796a000  ! 203: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8597a000  ! 204: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa1a7c820  ! 205: FADDs	fadds	%f31, %f0, %f16
	.word 0xa1504000  ! 206: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 207: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x83942000  ! 208: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x819ca000  ! 209: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb7500000  ! 210: RDPR_TPC	<illegal instruction>
	.word 0xada00520  ! 211: FSQRTs	fsqrt	
	.word 0xb3500000  ! 212: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 213: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a00540  ! 214: FSQRTd	fsqrt	
	.word 0xbda788a0  ! 215: FSUBs	fsubs	%f30, %f0, %f30
	.word 0x85962000  ! 216: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xaba70960  ! 217: FMULq	dis not found

	.word 0xa5a7c960  ! 218: FMULq	dis not found

	.word 0xaf508000  ! 219: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 221: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 222: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xab504000  ! 223: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 224: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa3a00560  ! 225: FSQRTq	fsqrt	
	.word 0x819ce000  ! 226: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5a44920  ! 227: FMULs	fmuls	%f17, %f0, %f18
	.word 0x8395a000  ! 228: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa7500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 230: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839fe000  ! 231: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xaf508000  ! 232: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xbda00540  ! 233: FSQRTd	fsqrt	
	.word 0xb7508000  ! 234: RDPR_TSTATE	<illegal instruction>
	.word 0x85956000  ! 235: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbba00540  ! 236: FSQRTd	fsqrt	
	.word 0x8196e000  ! 237: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83956000  ! 238: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa5504000  ! 239: RDPR_TNPC	<illegal instruction>
	.word 0xbda00540  ! 240: FSQRTd	fsqrt	
	.word 0xa5508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 242: RDPR_TNPC	<illegal instruction>
	.word 0x8d976000  ! 243: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb350c000  ! 244: RDPR_TT	<illegal instruction>
	.word 0xaba00520  ! 245: FSQRTs	fsqrt	
	.word 0x819e6000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d94e000  ! 247: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbfa548e0  ! 248: FSUBq	dis not found

	.word 0xa9a549c0  ! 249: FDIVd	fdivd	%f52, %f0, %f20
	.word 0x819e6000  ! 250: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbfa589a0  ! 251: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb7500000  ! 252: RDPR_TPC	<illegal instruction>
	.word 0xad504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 254: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 255: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8594e000  ! 256: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8795a000  ! 257: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa7508000  ! 258: RDPR_TSTATE	<illegal instruction>
	.word 0x81942000  ! 259: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x839c6000  ! 260: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb550c000  ! 261: RDPR_TT	rdpr	%tt, %r26
	.word 0xb1a588a0  ! 262: FSUBs	fsubs	%f22, %f0, %f24
	.word 0xa1504000  ! 263: RDPR_TNPC	<illegal instruction>
	.word 0xaba00560  ! 264: FSQRTq	fsqrt	
	.word 0xab508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 266: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa9508000  ! 267: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e000  ! 268: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xad500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xab508000  ! 270: RDPR_TSTATE	<illegal instruction>
	.word 0x819ca000  ! 271: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x85942000  ! 272: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x839ce000  ! 273: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8197e000  ! 274: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb5508000  ! 275: RDPR_TSTATE	<illegal instruction>
	.word 0xad508000  ! 276: RDPR_TSTATE	<illegal instruction>
	.word 0x83962000  ! 277: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x87942000  ! 278: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8794a000  ! 279: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8794e000  ! 280: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x819c2000  ! 281: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xbb50c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 283: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa750c000  ! 284: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 285: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb9504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xada68820  ! 287: FADDs	fadds	%f26, %f0, %f22
	.word 0xb9508000  ! 288: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0x819c6000  ! 290: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x83966000  ! 291: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8794a000  ! 292: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa1500000  ! 293: RDPR_TPC	<illegal instruction>
	.word 0x8d94a000  ! 294: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb1a5c8c0  ! 295: FSUBd	fsubd	%f54, %f0, %f24
	.word 0x8d97e000  ! 296: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbfa549c0  ! 297: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xada00560  ! 298: FSQRTq	fsqrt	
	.word 0x8d95a000  ! 299: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xad508000  ! 300: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 301: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 302: RDPR_TT	<illegal instruction>
	.word 0xa1a709c0  ! 303: FDIVd	fdivd	%f28, %f0, %f16
	.word 0x8197a000  ! 304: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xafa40940  ! 305: FMULd	fmuld	%f16, %f0, %f54
	.word 0x85972000  ! 306: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbb508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 308: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8d956000  ! 309: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x81972000  ! 310: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa7500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 312: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x839c2000  ! 313: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa950c000  ! 314: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 315: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8397e000  ! 316: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb550c000  ! 317: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 318: RDPR_TT	<illegal instruction>
	.word 0x8396e000  ! 319: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8795a000  ! 320: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8397a000  ! 321: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839ee000  ! 322: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x83956000  ! 323: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9508000  ! 324: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 325: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8394a000  ! 326: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa9508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 328: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8196a000  ! 329: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8395e000  ! 330: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa7508000  ! 331: RDPR_TSTATE	<illegal instruction>
	.word 0xbba58820  ! 332: FADDs	fadds	%f22, %f0, %f29
	.word 0x839f2000  ! 333: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8394e000  ! 334: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8194e000  ! 335: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbba64940  ! 336: FMULd	fmuld	%f56, %f0, %f60
	.word 0x83966000  ! 337: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb7a688c0  ! 338: FSUBd	fsubd	%f26, %f0, %f58
	.word 0x8394e000  ! 339: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb9a488a0  ! 340: FSUBs	fsubs	%f18, %f0, %f28
	.word 0x819ee000  ! 341: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d97a000  ! 342: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa3a48840  ! 343: FADDd	faddd	%f18, %f0, %f48
	.word 0x87946000  ! 344: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa9a689c0  ! 345: FDIVd	fdivd	%f26, %f0, %f20
	.word 0xaba40960  ! 346: FMULq	dis not found

	.word 0xb950c000  ! 347: RDPR_TT	rdpr	%tt, %r28
	.word 0x839d2000  ! 348: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa950c000  ! 349: RDPR_TT	<illegal instruction>
	.word 0x8596e000  ! 350: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8594e000  ! 351: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8197e000  ! 352: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x839da000  ! 353: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xbda4c840  ! 354: FADDd	faddd	%f50, %f0, %f30
	.word 0x87972000  ! 355: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xab50c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 357: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb150c000  ! 358: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 359: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x85946000  ! 360: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa7a548e0  ! 361: FSUBq	dis not found

	.word 0xada00520  ! 362: FSQRTs	fsqrt	
	.word 0xa750c000  ! 363: RDPR_TT	<illegal instruction>
	.word 0x81952000  ! 364: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x85966000  ! 365: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d94a000  ! 366: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xaf500000  ! 367: RDPR_TPC	<illegal instruction>
	.word 0x8d97e000  ! 368: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d966000  ! 369: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x87962000  ! 370: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbba7c9a0  ! 371: FDIVs	fdivs	%f31, %f0, %f29
	.word 0x8597a000  ! 372: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbd508000  ! 373: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 374: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8d952000  ! 375: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb3a00520  ! 376: FSQRTs	fsqrt	
	.word 0xa7a608e0  ! 377: FSUBq	dis not found

	.word 0x8d966000  ! 378: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb150c000  ! 379: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 380: RDPR_TT	<illegal instruction>
	.word 0x8d97a000  ! 381: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xada609a0  ! 382: FDIVs	fdivs	%f24, %f0, %f22
	.word 0xa550c000  ! 383: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 384: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x87966000  ! 385: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8196e000  ! 386: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x839ea000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x819f2000  ! 388: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xaf508000  ! 389: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 390: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819fe000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d942000  ! 392: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa950c000  ! 393: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 394: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x819ce000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa9500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0x839c2000  ! 398: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xab50c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0x8d946000  ! 400: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x839f6000  ! 401: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa5500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 403: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbd504000  ! 404: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x81966000  ! 407: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x81956000  ! 408: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839ca000  ! 409: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8d94a000  ! 410: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xbb50c000  ! 411: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 412: RDPR_TSTATE	<illegal instruction>
	.word 0x819d2000  ! 413: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d946000  ! 414: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819da000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa1a6c9c0  ! 416: FDIVd	fdivd	%f58, %f0, %f16
	.word 0xafa648a0  ! 417: FSUBs	fsubs	%f25, %f0, %f23
	.word 0xa3a74820  ! 418: FADDs	fadds	%f29, %f0, %f17
	.word 0x81962000  ! 419: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xad500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xafa60960  ! 421: FMULq	dis not found

	.word 0xa1500000  ! 422: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 423: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x819f2000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb150c000  ! 425: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 426: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb7a5c9e0  ! 427: FDIVq	dis not found

	.word 0xbfa4c840  ! 428: FADDd	faddd	%f50, %f0, %f62
	.word 0xbfa48960  ! 429: FMULq	dis not found

	.word 0x819ea000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xaf504000  ! 431: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 432: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8794e000  ! 433: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb150c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0x81952000  ! 435: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8394a000  ! 436: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8796a000  ! 437: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x839f6000  ! 438: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa5a5c960  ! 439: FMULq	dis not found

	.word 0x819f2000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839e6000  ! 441: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x87952000  ! 442: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb3508000  ! 443: RDPR_TSTATE	<illegal instruction>
	.word 0x8595a000  ! 444: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8195e000  ! 445: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8794e000  ! 446: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb9a489e0  ! 447: FDIVq	dis not found

	.word 0x8594e000  ! 448: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8194e000  ! 449: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5508000  ! 450: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 451: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 453: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d95e000  ! 454: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d962000  ! 455: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8596e000  ! 456: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x81942000  ! 457: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x819d6000  ! 458: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8594a000  ! 459: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8396a000  ! 460: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819de000  ! 461: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x81976000  ! 462: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb3504000  ! 463: RDPR_TNPC	<illegal instruction>
	.word 0x8597e000  ! 464: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa5a708a0  ! 465: FSUBs	fsubs	%f28, %f0, %f18
	.word 0xb3a4c960  ! 466: FMULq	dis not found

	.word 0xb5500000  ! 467: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8594a000  ! 468: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb9508000  ! 469: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 470: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839ce000  ! 471: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb7500000  ! 472: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 473: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a549a0  ! 474: FDIVs	fdivs	%f21, %f0, %f25
	.word 0x83976000  ! 475: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819ca000  ! 476: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x839ce000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa3a5c940  ! 478: FMULd	fmuld	%f54, %f0, %f48
	.word 0xa7508000  ! 479: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 480: RDPR_TT	<illegal instruction>
	.word 0xbda64920  ! 481: FMULs	fmuls	%f25, %f0, %f30
	.word 0x839d2000  ! 482: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8d952000  ! 483: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xaba00520  ! 484: FSQRTs	fsqrt	
	.word 0x8194a000  ! 485: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d956000  ! 486: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819ca000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xab50c000  ! 488: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 489: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb750c000  ! 490: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 491: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 492: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbfa689a0  ! 493: FDIVs	fdivs	%f26, %f0, %f31
	.word 0x85952000  ! 494: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8d972000  ! 495: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8195e000  ! 496: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0xafa00540  ! 498: FSQRTd	fsqrt	
	.word 0xafa60920  ! 499: FMULs	fmuls	%f24, %f0, %f23
	.word 0xbfa70960  ! 500: FMULq	dis not found

	.word 0xb350c000  ! 501: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x87976000  ! 503: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb5a00560  ! 504: FSQRTq	fsqrt	
	.word 0x8195e000  ! 505: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x87972000  ! 506: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8195a000  ! 507: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x839ce000  ! 508: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa9a00520  ! 509: FSQRTs	fsqrt	
	.word 0x839fa000  ! 510: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8597e000  ! 511: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8195e000  ! 512: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb7508000  ! 513: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 514: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xbba74840  ! 515: FADDd	faddd	%f60, %f0, %f60
	.word 0xab508000  ! 516: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xbfa448a0  ! 517: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xb1504000  ! 518: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 520: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 521: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbb500000  ! 522: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 523: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8d962000  ! 524: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x87976000  ! 525: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x83966000  ! 526: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839c6000  ! 527: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8797a000  ! 528: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x87962000  ! 529: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x83966000  ! 530: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa1a6c860  ! 531: FADDq	dis not found

	.word 0x8594a000  ! 532: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa5500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0x819f6000  ! 534: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839ca000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x83946000  ! 536: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83966000  ! 537: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819ca000  ! 538: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d942000  ! 539: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8596a000  ! 540: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xad50c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 542: RDPR_TSTATE	<illegal instruction>
	.word 0x8d966000  ! 543: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x85962000  ! 544: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb550c000  ! 545: RDPR_TT	<illegal instruction>
	.word 0x819da000  ! 546: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb5500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xa9a00540  ! 548: FSQRTd	fsqrt	
	.word 0x8196e000  ! 549: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x839fe000  ! 550: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x85972000  ! 551: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81956000  ! 552: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbd504000  ! 553: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x8596e000  ! 554: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8597e000  ! 555: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8797e000  ! 556: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbb508000  ! 557: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 559: RDPR_TT	<illegal instruction>
	.word 0xa1a00560  ! 560: FSQRTq	fsqrt	
	.word 0xa3a58860  ! 561: FADDq	dis not found

	.word 0x8796e000  ! 562: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb3a58940  ! 563: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb5a449c0  ! 564: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xa550c000  ! 565: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xaf504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x8195a000  ! 568: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa3a78840  ! 569: FADDd	faddd	%f30, %f0, %f48
	.word 0xbb504000  ! 570: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 571: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 572: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819d6000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa150c000  ! 574: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 575: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xab500000  ! 576: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 577: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa9a749a0  ! 578: FDIVs	fdivs	%f29, %f0, %f20
	.word 0xa1508000  ! 579: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95a000  ! 580: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x83966000  ! 581: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819fe000  ! 582: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x83972000  ! 583: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x819ee000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d95e000  ! 585: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x85972000  ! 586: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbb504000  ! 587: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 588: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x83966000  ! 589: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xad50c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0x8195a000  ! 591: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 594: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x83956000  ! 595: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd50c000  ! 596: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 597: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x83966000  ! 598: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d972000  ! 599: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8d96a000  ! 600: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa7a68940  ! 601: FMULd	fmuld	%f26, %f0, %f50
	.word 0xbd50c000  ! 602: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 603: RDPR_TT	<illegal instruction>
	.word 0x839de000  ! 604: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa5500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0x819e6000  ! 606: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa7a4c9a0  ! 607: FDIVs	fdivs	%f19, %f0, %f19
	.word 0xbba4c940  ! 608: FMULd	fmuld	%f50, %f0, %f60
	.word 0x87962000  ! 609: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d946000  ! 610: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8195a000  ! 611: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9a48920  ! 612: FMULs	fmuls	%f18, %f0, %f28
	.word 0x81966000  ! 613: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8d956000  ! 614: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x83976000  ! 615: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8d97a000  ! 616: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbb508000  ! 617: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a648e0  ! 618: FSUBq	dis not found

	.word 0x87976000  ! 619: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa9504000  ! 620: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 621: RDPR_TT	<illegal instruction>
	.word 0xb1a4c820  ! 622: FADDs	fadds	%f19, %f0, %f24
	.word 0xb950c000  ! 623: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 624: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8794a000  ! 625: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8d956000  ! 626: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8596a000  ! 627: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8595e000  ! 628: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xaba00520  ! 629: FSQRTs	fsqrt	
	.word 0xb1508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a64960  ! 631: FMULq	dis not found

	.word 0xa3504000  ! 632: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 633: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbb50c000  ! 634: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 636: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8796a000  ! 637: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x83966000  ! 638: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8195e000  ! 639: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8394a000  ! 640: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa5504000  ! 641: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x839c6000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8d952000  ! 643: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb5a78860  ! 644: FADDq	dis not found

	.word 0xaba44960  ! 645: FMULq	dis not found

	.word 0xbb50c000  ! 646: RDPR_TT	rdpr	%tt, %r29
	.word 0xbd504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0xb9a589e0  ! 648: FDIVq	dis not found

	.word 0xa1a50860  ! 649: FADDq	dis not found

	.word 0x839fe000  ! 650: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xad500000  ! 651: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 652: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x819e2000  ! 653: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbf500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0xa350c000  ! 655: RDPR_TT	<illegal instruction>
	.word 0x839ea000  ! 656: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x819c2000  ! 657: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb1a4c820  ! 658: FADDs	fadds	%f19, %f0, %f24
	.word 0xb5500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xa1a508c0  ! 660: FSUBd	fsubd	%f20, %f0, %f16
	.word 0xaf500000  ! 661: RDPR_TPC	<illegal instruction>
	.word 0x839ca000  ! 662: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819c6000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbfa508e0  ! 664: FSUBq	dis not found

	.word 0xa5a00560  ! 665: FSQRTq	fsqrt	
	.word 0x8d96a000  ! 666: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa1a549e0  ! 667: FDIVq	dis not found

	.word 0xada548a0  ! 668: FSUBs	fsubs	%f21, %f0, %f22
	.word 0xa9a589c0  ! 669: FDIVd	fdivd	%f22, %f0, %f20
	.word 0x8595a000  ! 670: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb5a648e0  ! 671: FSUBq	dis not found

	.word 0x87956000  ! 672: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xafa50820  ! 673: FADDs	fadds	%f20, %f0, %f23
	.word 0xb7a60840  ! 674: FADDd	faddd	%f24, %f0, %f58
	.word 0xab508000  ! 675: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 676: RDPR_TT	<illegal instruction>
	.word 0x87956000  ! 677: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x83956000  ! 678: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x85952000  ! 679: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x87942000  ! 680: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa5a00560  ! 681: FSQRTq	fsqrt	
	.word 0x83962000  ! 682: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb950c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 684: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbfa489c0  ! 685: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xbda78820  ! 686: FADDs	fadds	%f30, %f0, %f30
	.word 0x8594a000  ! 687: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8d94e000  ! 688: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x83976000  ! 689: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb9508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819da000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d966000  ! 692: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8797e000  ! 693: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8795e000  ! 694: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb1a68860  ! 695: FADDq	dis not found

	.word 0x8596a000  ! 696: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87946000  ! 697: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d956000  ! 698: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa7500000  ! 699: RDPR_TPC	<illegal instruction>
	.word 0xb7a549e0  ! 700: FDIVq	dis not found

	.word 0xbfa00520  ! 701: FSQRTs	fsqrt	
	.word 0xb1a58820  ! 702: FADDs	fadds	%f22, %f0, %f24
	.word 0x8d95e000  ! 703: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8197a000  ! 704: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x85942000  ! 705: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbb508000  ! 706: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a48840  ! 707: FADDd	faddd	%f18, %f0, %f28
	.word 0xb9a78940  ! 708: FMULd	fmuld	%f30, %f0, %f28
	.word 0xbd508000  ! 709: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a6c860  ! 710: FADDq	dis not found

	.word 0xa950c000  ! 711: RDPR_TT	<illegal instruction>
	.word 0xa3a64920  ! 712: FMULs	fmuls	%f25, %f0, %f17
	.word 0x839f6000  ! 713: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa7500000  ! 714: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 715: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 716: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xaf504000  ! 717: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x839ce000  ! 718: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa9508000  ! 719: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 720: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa550c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0xa5a00540  ! 722: FSQRTd	fsqrt	
	.word 0x819da000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x839f6000  ! 724: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819c6000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8596e000  ! 726: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xbd504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 728: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 729: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8197a000  ! 730: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb9508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 732: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d952000  ! 733: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb1500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 735: RDPR_TPC	<illegal instruction>
	.word 0x8396a000  ! 736: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xab504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 738: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8396a000  ! 739: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb150c000  ! 740: RDPR_TT	<illegal instruction>
	.word 0x81946000  ! 741: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb9500000  ! 742: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xafa70940  ! 743: FMULd	fmuld	%f28, %f0, %f54
	.word 0x87972000  ! 744: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8196a000  ! 745: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8596e000  ! 746: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa3500000  ! 747: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 748: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8397e000  ! 749: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xab50c000  ! 750: RDPR_TT	<illegal instruction>
	.word 0xbba589a0  ! 751: FDIVs	fdivs	%f22, %f0, %f29
	.word 0x839fa000  ! 752: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb3504000  ! 753: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8397a000  ! 754: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819d2000  ! 755: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbda649e0  ! 756: FDIVq	dis not found

	.word 0xa550c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 758: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa5500000  ! 759: RDPR_TPC	<illegal instruction>
	.word 0xa350c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 762: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb550c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 764: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb3500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 766: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 767: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 768: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 769: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839da000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa1500000  ! 771: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 772: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xaf50c000  ! 773: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 774: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x819d2000  ! 775: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xaf504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 777: RDPR_TPC	<illegal instruction>
	.word 0x87972000  ! 778: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819f6000  ! 779: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb3504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xa7a48960  ! 781: FMULq	dis not found

	.word 0xbda50960  ! 782: FMULq	dis not found

	.word 0x819f6000  ! 783: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbf50c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xada548e0  ! 785: FSUBq	dis not found

	.word 0x8d942000  ! 786: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x81942000  ! 787: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8597e000  ! 788: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb3a4c8a0  ! 789: FSUBs	fsubs	%f19, %f0, %f25
	.word 0x819fe000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839fa000  ! 791: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xaba5c9c0  ! 792: FDIVd	fdivd	%f54, %f0, %f52
	.word 0x8395e000  ! 793: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d96e000  ! 794: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa7504000  ! 795: RDPR_TNPC	<illegal instruction>
	.word 0xa1508000  ! 796: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 798: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5a70920  ! 799: FMULs	fmuls	%f28, %f0, %f18
	.word 0xaf504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 801: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x819ce000  ! 802: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb1a00560  ! 803: FSQRTq	fsqrt	
	.word 0x819ca000  ! 804: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8794a000  ! 805: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8d962000  ! 806: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xafa409a0  ! 807: FDIVs	fdivs	%f16, %f0, %f23
	.word 0xa5a00540  ! 808: FSQRTd	fsqrt	
	.word 0xb9504000  ! 809: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 811: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa5504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 813: RDPR_TSTATE	<illegal instruction>
	.word 0x819d2000  ! 814: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbf500000  ! 815: RDPR_TPC	<illegal instruction>
	.word 0xafa00540  ! 816: FSQRTd	fsqrt	
	.word 0xa9500000  ! 817: RDPR_TPC	<illegal instruction>
	.word 0x819ca000  ! 818: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb3a6c820  ! 819: FADDs	fadds	%f27, %f0, %f25
	.word 0x8595a000  ! 820: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d976000  ! 821: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8596e000  ! 822: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa1508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 824: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbfa00560  ! 825: FSQRTq	fsqrt	
	.word 0x8197e000  ! 826: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8594e000  ! 827: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa7a408e0  ! 828: FSUBq	dis not found

	.word 0x8396a000  ! 829: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819da000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa9508000  ! 831: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 832: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbd500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x839fe000  ! 834: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8596a000  ! 835: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87952000  ! 836: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d952000  ! 837: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8196a000  ! 838: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbfa749c0  ! 839: FDIVd	fdivd	%f60, %f0, %f62
	.word 0xa7a409e0  ! 840: FDIVq	dis not found

	.word 0xb9508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xada5c9e0  ! 842: FDIVq	dis not found

	.word 0x8594a000  ! 843: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa1504000  ! 844: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xb1500000  ! 845: RDPR_TPC	<illegal instruction>
	.word 0xbba708a0  ! 846: FSUBs	fsubs	%f28, %f0, %f29
	.word 0xa3508000  ! 847: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa448e0  ! 848: FSUBq	dis not found

	.word 0xa1a00520  ! 849: FSQRTs	fsqrt	
	.word 0xa1a68860  ! 850: FADDq	dis not found

	.word 0x8596e000  ! 851: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa1500000  ! 852: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 853: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xaf508000  ! 854: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 855: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 856: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x83946000  ! 857: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x819d2000  ! 858: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa7504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 860: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87952000  ! 861: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83956000  ! 862: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb750c000  ! 863: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 864: RDPR_TT	<illegal instruction>
	.word 0x8d942000  ! 865: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x85966000  ! 866: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x81976000  ! 867: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819c2000  ! 868: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb7504000  ! 869: RDPR_TNPC	<illegal instruction>
	.word 0x8394e000  ! 870: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8196e000  ! 871: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xaf508000  ! 872: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 873: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8d962000  ! 875: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83952000  ! 876: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d972000  ! 877: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8797e000  ! 878: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbf50c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x819e6000  ! 880: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x81952000  ! 881: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x87972000  ! 882: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb7500000  ! 883: RDPR_TPC	<illegal instruction>
	.word 0x839d6000  ! 884: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x819d6000  ! 885: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x83972000  ! 886: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb5504000  ! 887: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 888: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 889: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xafa00560  ! 890: FSQRTq	fsqrt	
	.word 0x8197a000  ! 891: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x819d6000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x819f2000  ! 893: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x85972000  ! 894: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb3508000  ! 895: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 896: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa9a78860  ! 897: FADDq	dis not found

	.word 0x8d97e000  ! 898: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x839e6000  ! 899: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbda50860  ! 900: FADDq	dis not found

	.word 0xb1a68960  ! 901: FMULq	dis not found

	.word 0x8d97a000  ! 902: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x819fa000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa5508000  ! 904: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 905: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb1504000  ! 906: RDPR_TNPC	<illegal instruction>
	.word 0x8d94a000  ! 907: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xad500000  ! 908: RDPR_TPC	<illegal instruction>
	.word 0xada748a0  ! 909: FSUBs	fsubs	%f29, %f0, %f22
	.word 0x83956000  ! 910: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb5a60960  ! 911: FMULq	dis not found

	.word 0x8595e000  ! 912: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8196a000  ! 913: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x81952000  ! 914: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x83952000  ! 915: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3504000  ! 916: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 917: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8595e000  ! 918: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x83952000  ! 919: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbb500000  ! 920: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 921: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xaba00540  ! 922: FSQRTd	fsqrt	
	.word 0xb7504000  ! 923: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xaba48840  ! 924: FADDd	faddd	%f18, %f0, %f52
	.word 0x85956000  ! 925: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85942000  ! 926: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa9a44820  ! 927: FADDs	fadds	%f17, %f0, %f20
	.word 0x819ce000  ! 928: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x83976000  ! 929: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839de000  ! 930: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8197e000  ! 931: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xada00520  ! 932: FSQRTs	fsqrt	
	.word 0x81966000  ! 933: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8196e000  ! 934: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8396a000  ! 935: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8594a000  ! 936: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb5a00560  ! 937: FSQRTq	fsqrt	
	.word 0xab50c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xb9a40860  ! 939: FADDq	dis not found

	.word 0xad504000  ! 940: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00520  ! 941: FSQRTs	fsqrt	
	.word 0x839e2000  ! 942: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa3508000  ! 943: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 944: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8597e000  ! 945: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x83946000  ! 946: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83976000  ! 947: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81966000  ! 948: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x8197a000  ! 949: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb7500000  ! 950: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 951: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8d946000  ! 952: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb9a4c8c0  ! 953: FSUBd	fsubd	%f50, %f0, %f28
	.word 0x8797e000  ! 954: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb7a00520  ! 955: FSQRTs	fsqrt	
	.word 0x819e2000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa750c000  ! 957: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 958: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 960: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 961: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa7508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 963: RDPR_TPC	<illegal instruction>
	.word 0x8395e000  ! 964: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839ce000  ! 965: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xaba409e0  ! 966: FDIVq	dis not found

	.word 0xb7a00540  ! 967: FSQRTd	fsqrt	
	.word 0x87942000  ! 968: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xafa748a0  ! 969: FSUBs	fsubs	%f29, %f0, %f23
	.word 0xab504000  ! 970: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 971: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb7508000  ! 972: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 973: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbba48960  ! 974: FMULq	dis not found

	.word 0x8196e000  ! 975: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa1508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xbda4c9e0  ! 977: FDIVq	dis not found

	.word 0xb1504000  ! 978: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 980: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 981: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x819fe000  ! 982: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7504000  ! 983: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 984: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xaf500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0xb1a48860  ! 986: FADDq	dis not found

	.word 0xab508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0x8d966000  ! 988: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb7504000  ! 989: RDPR_TNPC	<illegal instruction>
	.word 0xbda60940  ! 990: FMULd	fmuld	%f24, %f0, %f30
	.word 0xad508000  ! 991: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 992: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x87962000  ! 993: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa9500000  ! 994: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 995: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xab508000  ! 996: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 997: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 998: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
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
	.word 0xa5a48820  ! 1: FADDs	fadds	%f18, %f0, %f18
	.word 0x819f2000  ! 2: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x819ee000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb5504000  ! 4: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 5: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa1a448c0  ! 6: FSUBd	fsubd	%f48, %f0, %f16
	.word 0xa150c000  ! 7: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 8: RDPR_TPC	<illegal instruction>
	.word 0x8d972000  ! 9: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819d6000  ! 10: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xad508000  ! 11: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 12: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x83976000  ! 13: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8396a000  ! 14: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa9508000  ! 15: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 16: RDPR_TNPC	<illegal instruction>
	.word 0xa7a00560  ! 17: FSQRTq	fsqrt	
	.word 0x819ce000  ! 18: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d94a000  ! 19: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x85976000  ! 20: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d962000  ! 21: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xad508000  ! 22: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 23: RDPR_TNPC	<illegal instruction>
	.word 0x819f2000  ! 24: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xada00520  ! 25: FSQRTs	fsqrt	
	.word 0xa750c000  ! 26: RDPR_TT	<illegal instruction>
	.word 0xa3a589a0  ! 27: FDIVs	fdivs	%f22, %f0, %f17
	.word 0xa350c000  ! 28: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 29: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 30: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbf508000  ! 31: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e000  ! 32: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa7a60860  ! 33: FADDq	dis not found

	.word 0xa1508000  ! 34: RDPR_TSTATE	<illegal instruction>
	.word 0x819da000  ! 35: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8395e000  ! 36: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xbd508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 38: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb7508000  ! 39: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96e000  ! 40: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xafa448a0  ! 41: FSUBs	fsubs	%f17, %f0, %f23
	.word 0x81942000  ! 42: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x839c2000  ! 43: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x83972000  ! 44: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xaf508000  ! 45: RDPR_TSTATE	<illegal instruction>
	.word 0x87942000  ! 46: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xada449e0  ! 47: FDIVq	dis not found

	.word 0x8d97a000  ! 48: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbf500000  ! 49: RDPR_TPC	<illegal instruction>
	.word 0xbba60820  ! 50: FADDs	fadds	%f24, %f0, %f29
	.word 0x8d962000  ! 51: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb3504000  ! 52: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 53: RDPR_TT	<illegal instruction>
	.word 0x81976000  ! 54: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8596a000  ! 55: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x839f2000  ! 56: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819da000  ! 57: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d96a000  ! 58: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xa3a789e0  ! 59: FDIVq	dis not found

	.word 0xa5508000  ! 60: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 61: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 62: RDPR_TNPC	<illegal instruction>
	.word 0x8597a000  ! 63: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa3504000  ! 64: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 65: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb5508000  ! 66: RDPR_TSTATE	<illegal instruction>
	.word 0xaba64860  ! 67: FADDq	dis not found

	.word 0xbfa748e0  ! 68: FSUBq	dis not found

	.word 0x8596e000  ! 69: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xaf508000  ! 70: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 71: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8d962000  ! 72: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8797a000  ! 73: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x81972000  ! 74: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa1a58960  ! 75: FMULq	dis not found

	.word 0x819f6000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xada788a0  ! 77: FSUBs	fsubs	%f30, %f0, %f22
	.word 0xa3508000  ! 78: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa950c000  ! 79: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 80: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb750c000  ! 81: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 82: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8597a000  ! 83: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xbba48960  ! 84: FMULq	dis not found

	.word 0xb3500000  ! 85: RDPR_TPC	<illegal instruction>
	.word 0x8d942000  ! 86: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819de000  ! 87: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaf500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0x8594a000  ! 89: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb9500000  ! 90: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 91: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbf50c000  ! 92: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 93: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb1504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0xb9a5c9e0  ! 95: FDIVq	dis not found

	.word 0xa5a78840  ! 96: FADDd	faddd	%f30, %f0, %f18
	.word 0xa7a00520  ! 97: FSQRTs	fsqrt	
	.word 0x8595e000  ! 98: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x87946000  ! 99: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xaf508000  ! 100: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96e000  ! 101: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x819e6000  ! 102: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8595e000  ! 103: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb3a58940  ! 104: FMULd	fmuld	%f22, %f0, %f56
	.word 0x8d94e000  ! 105: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbf508000  ! 106: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 107: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 108: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 109: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8d95a000  ! 110: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa7a4c860  ! 111: FADDq	dis not found

	.word 0xb5a00540  ! 112: FSQRTd	fsqrt	
	.word 0x819f2000  ! 113: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb9a7c9c0  ! 114: FDIVd	fdivd	%f62, %f0, %f28
	.word 0x8794e000  ! 115: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xada44840  ! 116: FADDd	faddd	%f48, %f0, %f22
	.word 0xafa688c0  ! 117: FSUBd	fsubd	%f26, %f0, %f54
	.word 0x87976000  ! 118: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8194e000  ! 119: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xaf50c000  ! 120: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 121: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839ee000  ! 122: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xbd504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x8d97a000  ! 124: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb9504000  ! 125: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 126: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbba68920  ! 127: FMULs	fmuls	%f26, %f0, %f29
	.word 0x8794e000  ! 128: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb5504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 130: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa1500000  ! 131: RDPR_TPC	<illegal instruction>
	.word 0x8d97a000  ! 132: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8196a000  ! 133: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x819ce000  ! 134: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81972000  ! 135: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb3508000  ! 136: RDPR_TSTATE	<illegal instruction>
	.word 0x8597e000  ! 137: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbba648a0  ! 138: FSUBs	fsubs	%f25, %f0, %f29
	.word 0xb7500000  ! 139: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 140: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 141: RDPR_TSTATE	<illegal instruction>
	.word 0x819e6000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa550c000  ! 143: RDPR_TT	<illegal instruction>
	.word 0xa5a48920  ! 144: FMULs	fmuls	%f18, %f0, %f18
	.word 0x8195a000  ! 145: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x87962000  ! 146: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87972000  ! 147: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8594e000  ! 148: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87946000  ! 149: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbd504000  ! 150: RDPR_TNPC	<illegal instruction>
	.word 0xb9a00540  ! 151: FSQRTd	fsqrt	
	.word 0xada48820  ! 152: FADDs	fadds	%f18, %f0, %f22
	.word 0xa5504000  ! 153: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 154: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x83942000  ! 155: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839c2000  ! 156: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x83966000  ! 157: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8796a000  ! 158: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85966000  ! 159: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8797e000  ! 160: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb7504000  ! 161: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 162: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839d2000  ! 163: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x87962000  ! 164: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xab504000  ! 165: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 166: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 167: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x85976000  ! 168: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb350c000  ! 169: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 170: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a00560  ! 172: FSQRTq	fsqrt	
	.word 0xb5504000  ! 173: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 174: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 175: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8597e000  ! 176: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbd500000  ! 177: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 178: RDPR_TPC	<illegal instruction>
	.word 0x8d966000  ! 179: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa7500000  ! 180: RDPR_TPC	<illegal instruction>
	.word 0x8195e000  ! 181: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8d942000  ! 182: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x839fa000  ! 183: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb1500000  ! 184: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 185: RDPR_TSTATE	<illegal instruction>
	.word 0x819f6000  ! 186: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8794e000  ! 187: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x81976000  ! 188: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb5500000  ! 189: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8795a000  ! 190: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x839e2000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839fa000  ! 192: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xaba689c0  ! 193: FDIVd	fdivd	%f26, %f0, %f52
	.word 0xafa5c940  ! 194: FMULd	fmuld	%f54, %f0, %f54
	.word 0xbd500000  ! 195: RDPR_TPC	<illegal instruction>
	.word 0x819e6000  ! 196: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x81962000  ! 197: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb9500000  ! 198: RDPR_TPC	<illegal instruction>
	.word 0xbb50c000  ! 199: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 200: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 201: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8795a000  ! 202: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x87956000  ! 203: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x85952000  ! 204: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb3a5c820  ! 205: FADDs	fadds	%f23, %f0, %f25
	.word 0xa1504000  ! 206: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 207: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8394a000  ! 208: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819c6000  ! 209: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbb500000  ! 210: RDPR_TPC	<illegal instruction>
	.word 0xb9a00520  ! 211: FSQRTs	fsqrt	
	.word 0xad500000  ! 212: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 213: RDPR_TSTATE	<illegal instruction>
	.word 0xaba00540  ! 214: FSQRTd	fsqrt	
	.word 0xb7a448a0  ! 215: FSUBs	fsubs	%f17, %f0, %f27
	.word 0x85952000  ! 216: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbfa64960  ! 217: FMULq	dis not found

	.word 0xb9a48960  ! 218: FMULq	dis not found

	.word 0xbd508000  ! 219: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 220: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 221: RDPR_TNPC	<illegal instruction>
	.word 0x85966000  ! 222: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa5504000  ! 223: RDPR_TNPC	<illegal instruction>
	.word 0x839f6000  ! 224: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa7a00560  ! 225: FSQRTq	fsqrt	
	.word 0x819ca000  ! 226: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa3a70920  ! 227: FMULs	fmuls	%f28, %f0, %f17
	.word 0x83956000  ! 228: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb3500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 230: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839ce000  ! 231: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb9508000  ! 232: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00540  ! 233: FSQRTd	fsqrt	
	.word 0xbb508000  ! 234: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 235: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb5a00540  ! 236: FSQRTd	fsqrt	
	.word 0x81952000  ! 237: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x83956000  ! 238: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb7504000  ! 239: RDPR_TNPC	<illegal instruction>
	.word 0xa3a00540  ! 240: FSQRTd	fsqrt	
	.word 0xa7508000  ! 241: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 242: RDPR_TNPC	<illegal instruction>
	.word 0x8d962000  ! 243: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xad50c000  ! 244: RDPR_TT	<illegal instruction>
	.word 0xb1a00520  ! 245: FSQRTs	fsqrt	
	.word 0x819f6000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8d94e000  ! 247: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa5a588e0  ! 248: FSUBq	dis not found

	.word 0xa7a449c0  ! 249: FDIVd	fdivd	%f48, %f0, %f50
	.word 0x819da000  ! 250: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbba5c9a0  ! 251: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xa3500000  ! 252: RDPR_TPC	<illegal instruction>
	.word 0xbf504000  ! 253: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 254: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 255: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8597e000  ! 256: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x87966000  ! 257: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbb508000  ! 258: RDPR_TSTATE	<illegal instruction>
	.word 0x8197e000  ! 259: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x839f6000  ! 260: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa550c000  ! 261: RDPR_TT	<illegal instruction>
	.word 0xaba608a0  ! 262: FSUBs	fsubs	%f24, %f0, %f21
	.word 0xb7504000  ! 263: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00560  ! 264: FSQRTq	fsqrt	
	.word 0xad508000  ! 265: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 266: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa5508000  ! 267: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e000  ! 268: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xab500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 270: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 271: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x85966000  ! 272: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839de000  ! 273: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x81956000  ! 274: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbd508000  ! 275: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 276: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 277: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8795e000  ! 278: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87956000  ! 279: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x87972000  ! 280: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819f2000  ! 281: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbd50c000  ! 282: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 283: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa550c000  ! 284: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 285: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3504000  ! 286: RDPR_TNPC	<illegal instruction>
	.word 0xa3a78820  ! 287: FADDs	fadds	%f30, %f0, %f17
	.word 0xa9508000  ! 288: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 290: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x83972000  ! 291: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x87952000  ! 292: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb9500000  ! 293: RDPR_TPC	<illegal instruction>
	.word 0x8d956000  ! 294: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xbfa4c8c0  ! 295: FSUBd	fsubd	%f50, %f0, %f62
	.word 0x8d966000  ! 296: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa3a689c0  ! 297: FDIVd	fdivd	%f26, %f0, %f48
	.word 0xada00560  ! 298: FSQRTq	fsqrt	
	.word 0x8d962000  ! 299: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xaf508000  ! 300: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 301: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 302: RDPR_TT	<illegal instruction>
	.word 0xb3a649c0  ! 303: FDIVd	fdivd	%f56, %f0, %f56
	.word 0x81952000  ! 304: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xaba50940  ! 305: FMULd	fmuld	%f20, %f0, %f52
	.word 0x8594e000  ! 306: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xbf508000  ! 307: RDPR_TSTATE	<illegal instruction>
	.word 0x83962000  ! 308: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8d976000  ! 309: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x81952000  ! 310: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbd500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 312: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839f2000  ! 313: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa550c000  ! 314: RDPR_TT	<illegal instruction>
	.word 0x87956000  ! 315: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8396a000  ! 316: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa350c000  ! 317: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 318: RDPR_TT	<illegal instruction>
	.word 0x83956000  ! 319: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x87962000  ! 320: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8396a000  ! 321: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839f2000  ! 322: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8397e000  ! 323: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb5508000  ! 324: RDPR_TSTATE	<illegal instruction>
	.word 0x8596a000  ! 325: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x83966000  ! 326: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb7508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0x81942000  ! 328: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8194e000  ! 329: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x83946000  ! 330: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa5508000  ! 331: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a70820  ! 332: FADDs	fadds	%f28, %f0, %f28
	.word 0x839da000  ! 333: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8397e000  ! 334: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x81976000  ! 335: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa1a48940  ! 336: FMULd	fmuld	%f18, %f0, %f16
	.word 0x83962000  ! 337: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbba608c0  ! 338: FSUBd	fsubd	%f24, %f0, %f60
	.word 0x83956000  ! 339: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9a648a0  ! 340: FSUBs	fsubs	%f25, %f0, %f20
	.word 0x819ca000  ! 341: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d942000  ! 342: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xbba54840  ! 343: FADDd	faddd	%f52, %f0, %f60
	.word 0x8797e000  ! 344: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa7a6c9c0  ! 345: FDIVd	fdivd	%f58, %f0, %f50
	.word 0xa7a58960  ! 346: FMULq	dis not found

	.word 0xb750c000  ! 347: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 348: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xab50c000  ! 349: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 350: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8597a000  ! 351: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x81946000  ! 352: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x839da000  ! 353: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa7a6c840  ! 354: FADDd	faddd	%f58, %f0, %f50
	.word 0x8794a000  ! 355: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa150c000  ! 356: RDPR_TT	<illegal instruction>
	.word 0x8595e000  ! 357: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa950c000  ! 358: RDPR_TT	<illegal instruction>
	.word 0x8d966000  ! 359: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8596e000  ! 360: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xbfa708e0  ! 361: FSUBq	dis not found

	.word 0xb3a00520  ! 362: FSQRTs	fsqrt	
	.word 0xaf50c000  ! 363: RDPR_TT	<illegal instruction>
	.word 0x8196e000  ! 364: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x8594e000  ! 365: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8d94a000  ! 366: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xab500000  ! 367: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 368: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d962000  ! 369: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x87952000  ! 370: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb9a6c9a0  ! 371: FDIVs	fdivs	%f27, %f0, %f28
	.word 0x85952000  ! 372: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb3508000  ! 373: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95a000  ! 374: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d97e000  ! 375: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xafa00520  ! 376: FSQRTs	fsqrt	
	.word 0xafa788e0  ! 377: FSUBq	dis not found

	.word 0x8d952000  ! 378: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa550c000  ! 379: RDPR_TT	<illegal instruction>
	.word 0xbd50c000  ! 380: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 381: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb1a689a0  ! 382: FDIVs	fdivs	%f26, %f0, %f24
	.word 0xb350c000  ! 383: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 384: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8796a000  ! 385: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x81966000  ! 386: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839ea000  ! 387: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x819f2000  ! 388: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa7508000  ! 389: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 390: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819ee000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d95a000  ! 392: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa950c000  ! 393: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 394: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819fe000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb7500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0xa9500000  ! 397: RDPR_TPC	<illegal instruction>
	.word 0x839d6000  ! 398: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb950c000  ! 399: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 400: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839c2000  ! 401: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xbd500000  ! 402: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 403: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa1504000  ! 404: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 406: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x81976000  ! 407: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8196a000  ! 408: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x839f6000  ! 409: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8d95e000  ! 410: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb950c000  ! 411: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 412: RDPR_TSTATE	<illegal instruction>
	.word 0x819fe000  ! 413: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8d95a000  ! 414: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819f2000  ! 415: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa3a489c0  ! 416: FDIVd	fdivd	%f18, %f0, %f48
	.word 0xb5a748a0  ! 417: FSUBs	fsubs	%f29, %f0, %f26
	.word 0xb3a40820  ! 418: FADDs	fadds	%f16, %f0, %f25
	.word 0x81962000  ! 419: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa1500000  ! 420: RDPR_TPC	<illegal instruction>
	.word 0xaba60960  ! 421: FMULq	dis not found

	.word 0xb9500000  ! 422: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 423: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x819d2000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa350c000  ! 425: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 426: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa5a789e0  ! 427: FDIVq	dis not found

	.word 0xada40840  ! 428: FADDd	faddd	%f16, %f0, %f22
	.word 0xa7a70960  ! 429: FMULq	dis not found

	.word 0x819de000  ! 430: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa3504000  ! 431: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 432: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x87952000  ! 433: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa150c000  ! 434: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 435: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x83972000  ! 436: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x87946000  ! 437: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839e6000  ! 438: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xaba68960  ! 439: FMULq	dis not found

	.word 0x819fe000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839ca000  ! 441: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x87976000  ! 442: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb9508000  ! 443: RDPR_TSTATE	<illegal instruction>
	.word 0x8597e000  ! 444: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x81976000  ! 445: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x87972000  ! 446: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb5a749e0  ! 447: FDIVq	dis not found

	.word 0x8596e000  ! 448: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8194e000  ! 449: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5508000  ! 450: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 451: RDPR_TT	<illegal instruction>
	.word 0xaf504000  ! 452: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 453: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d94e000  ! 454: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d966000  ! 455: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8594a000  ! 456: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x81946000  ! 457: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819da000  ! 458: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8597a000  ! 459: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x83956000  ! 460: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x819da000  ! 461: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x81952000  ! 462: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa3504000  ! 463: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 464: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa1a608a0  ! 465: FSUBs	fsubs	%f24, %f0, %f16
	.word 0xada54960  ! 466: FMULq	dis not found

	.word 0xa1500000  ! 467: RDPR_TPC	<illegal instruction>
	.word 0x85952000  ! 468: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa9508000  ! 469: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 470: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x839c6000  ! 471: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xad500000  ! 472: RDPR_TPC	<illegal instruction>
	.word 0xb3508000  ! 473: RDPR_TSTATE	<illegal instruction>
	.word 0xbda509a0  ! 474: FDIVs	fdivs	%f20, %f0, %f30
	.word 0x83962000  ! 475: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819f2000  ! 476: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839c6000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa1a40940  ! 478: FMULd	fmuld	%f16, %f0, %f16
	.word 0xb5508000  ! 479: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 480: RDPR_TT	<illegal instruction>
	.word 0xb9a7c920  ! 481: FMULs	fmuls	%f31, %f0, %f28
	.word 0x839d6000  ! 482: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8d952000  ! 483: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb7a00520  ! 484: FSQRTs	fsqrt	
	.word 0x8195a000  ! 485: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8d966000  ! 486: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819fe000  ! 487: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad50c000  ! 488: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 489: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa150c000  ! 490: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 491: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 492: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xaba7c9a0  ! 493: FDIVs	fdivs	%f31, %f0, %f21
	.word 0x8595e000  ! 494: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d97e000  ! 495: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x81962000  ! 496: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa3500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0xbda00540  ! 498: FSQRTd	fsqrt	
	.word 0xbba54920  ! 499: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb1a6c960  ! 500: FMULq	dis not found

	.word 0xb350c000  ! 501: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 502: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8795a000  ! 503: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa1a00560  ! 504: FSQRTq	fsqrt	
	.word 0x8196a000  ! 505: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87946000  ! 506: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8195e000  ! 507: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x839f6000  ! 508: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb3a00520  ! 509: FSQRTs	fsqrt	
	.word 0x839d6000  ! 510: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x85952000  ! 511: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x81946000  ! 512: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xab508000  ! 513: RDPR_TSTATE	<illegal instruction>
	.word 0x839ca000  ! 514: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xbda64840  ! 515: FADDd	faddd	%f56, %f0, %f30
	.word 0xa3508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0xbba408a0  ! 517: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb7504000  ! 518: RDPR_TNPC	<illegal instruction>
	.word 0xa9504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 520: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 521: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa9500000  ! 522: RDPR_TPC	<illegal instruction>
	.word 0x8d94a000  ! 523: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8d962000  ! 524: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8797a000  ! 525: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x83946000  ! 526: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x839e2000  ! 527: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8796e000  ! 528: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8797a000  ! 529: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x83962000  ! 530: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbda6c860  ! 531: FADDq	dis not found

	.word 0x85946000  ! 532: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa9500000  ! 533: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 534: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839ee000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x83966000  ! 536: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8397e000  ! 537: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819f6000  ! 538: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8d96e000  ! 539: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x85942000  ! 540: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbb50c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 542: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 543: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8594a000  ! 544: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa950c000  ! 545: RDPR_TT	<illegal instruction>
	.word 0x819c2000  ! 546: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb5500000  ! 547: RDPR_TPC	<illegal instruction>
	.word 0xa7a00540  ! 548: FSQRTd	fsqrt	
	.word 0x81972000  ! 549: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x839e6000  ! 550: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8597e000  ! 551: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x81962000  ! 552: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb3504000  ! 553: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 554: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x85976000  ! 555: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x87956000  ! 556: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb3508000  ! 557: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 558: RDPR_TT	<illegal instruction>
	.word 0xa750c000  ! 559: RDPR_TT	<illegal instruction>
	.word 0xb7a00560  ! 560: FSQRTq	fsqrt	
	.word 0xa9a68860  ! 561: FADDq	dis not found

	.word 0x8794a000  ! 562: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xbfa50940  ! 563: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb3a409c0  ! 564: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xab50c000  ! 565: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 566: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 567: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 568: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbba58840  ! 569: FADDd	faddd	%f22, %f0, %f60
	.word 0xaf504000  ! 570: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 571: RDPR_TPC	<illegal instruction>
	.word 0x85956000  ! 572: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x819f6000  ! 573: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa150c000  ! 574: RDPR_TT	<illegal instruction>
	.word 0x8d956000  ! 575: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa7500000  ! 576: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 577: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb3a549a0  ! 578: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xbf508000  ! 579: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e000  ! 580: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8397e000  ! 581: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819f6000  ! 582: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x83976000  ! 583: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819da000  ! 584: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d94a000  ! 585: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8597a000  ! 586: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa7504000  ! 587: RDPR_TNPC	<illegal instruction>
	.word 0x8596e000  ! 588: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x83972000  ! 589: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb950c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 591: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb7508000  ! 592: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 593: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 594: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8397a000  ! 595: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xad50c000  ! 596: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 597: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x83952000  ! 598: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d95a000  ! 599: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d94a000  ! 600: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xbfa64940  ! 601: FMULd	fmuld	%f56, %f0, %f62
	.word 0xa750c000  ! 602: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 603: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 604: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb5500000  ! 605: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 606: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb9a749a0  ! 607: FDIVs	fdivs	%f29, %f0, %f28
	.word 0xa5a70940  ! 608: FMULd	fmuld	%f28, %f0, %f18
	.word 0x8797e000  ! 609: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d952000  ! 610: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x81972000  ! 611: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xada74920  ! 612: FMULs	fmuls	%f29, %f0, %f22
	.word 0x81946000  ! 613: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8d94e000  ! 614: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8397e000  ! 615: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8d95e000  ! 616: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xaf508000  ! 617: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a408e0  ! 618: FSUBq	dis not found

	.word 0x87976000  ! 619: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb1504000  ! 620: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 621: RDPR_TT	<illegal instruction>
	.word 0xb1a58820  ! 622: FADDs	fadds	%f22, %f0, %f24
	.word 0xad50c000  ! 623: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 624: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8794e000  ! 625: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d942000  ! 626: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8597a000  ! 627: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8594a000  ! 628: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa3a00520  ! 629: FSQRTs	fsqrt	
	.word 0xbf508000  ! 630: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a78960  ! 631: FMULq	dis not found

	.word 0xbb504000  ! 632: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 633: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb750c000  ! 634: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 635: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 636: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x87942000  ! 637: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x83972000  ! 638: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8197a000  ! 639: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8397e000  ! 640: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbb504000  ! 641: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 642: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8d95a000  ! 643: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa1a70860  ! 644: FADDq	dis not found

	.word 0xb5a58960  ! 645: FMULq	dis not found

	.word 0xb750c000  ! 646: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 647: RDPR_TNPC	<illegal instruction>
	.word 0xa5a489e0  ! 648: FDIVq	dis not found

	.word 0xa1a5c860  ! 649: FADDq	dis not found

	.word 0x839f6000  ! 650: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa3500000  ! 651: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 652: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819c2000  ! 653: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb9500000  ! 654: RDPR_TPC	<illegal instruction>
	.word 0xb350c000  ! 655: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 656: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819fe000  ! 657: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xada64820  ! 658: FADDs	fadds	%f25, %f0, %f22
	.word 0xa5500000  ! 659: RDPR_TPC	<illegal instruction>
	.word 0xafa708c0  ! 660: FSUBd	fsubd	%f28, %f0, %f54
	.word 0xb3500000  ! 661: RDPR_TPC	<illegal instruction>
	.word 0x839c2000  ! 662: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819da000  ! 663: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa3a6c8e0  ! 664: FSUBq	dis not found

	.word 0xa3a00560  ! 665: FSQRTq	fsqrt	
	.word 0x8d966000  ! 666: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb7a509e0  ! 667: FDIVq	dis not found

	.word 0xaba708a0  ! 668: FSUBs	fsubs	%f28, %f0, %f21
	.word 0xbfa709c0  ! 669: FDIVd	fdivd	%f28, %f0, %f62
	.word 0x8597e000  ! 670: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbda508e0  ! 671: FSUBq	dis not found

	.word 0x8794e000  ! 672: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xafa60820  ! 673: FADDs	fadds	%f24, %f0, %f23
	.word 0xada70840  ! 674: FADDd	faddd	%f28, %f0, %f22
	.word 0xb3508000  ! 675: RDPR_TSTATE	<illegal instruction>
	.word 0xa350c000  ! 676: RDPR_TT	<illegal instruction>
	.word 0x8796e000  ! 677: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x83966000  ! 678: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8594a000  ! 679: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8794a000  ! 680: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb7a00560  ! 681: FSQRTq	fsqrt	
	.word 0x83962000  ! 682: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbf50c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 684: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbfa709c0  ! 685: FDIVd	fdivd	%f28, %f0, %f62
	.word 0xa1a6c820  ! 686: FADDs	fadds	%f27, %f0, %f16
	.word 0x85966000  ! 687: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d962000  ! 688: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8397a000  ! 689: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xab508000  ! 690: RDPR_TSTATE	<illegal instruction>
	.word 0x819d6000  ! 691: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8d97e000  ! 692: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x87966000  ! 693: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8796a000  ! 694: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb1a48860  ! 695: FADDq	dis not found

	.word 0x85952000  ! 696: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x87962000  ! 697: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d95e000  ! 698: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb3500000  ! 699: RDPR_TPC	<illegal instruction>
	.word 0xa3a589e0  ! 700: FDIVq	dis not found

	.word 0xada00520  ! 701: FSQRTs	fsqrt	
	.word 0xbba48820  ! 702: FADDs	fadds	%f18, %f0, %f29
	.word 0x8d942000  ! 703: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8196a000  ! 704: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8596a000  ! 705: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa9508000  ! 706: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xa9a74840  ! 707: FADDd	faddd	%f60, %f0, %f20
	.word 0xb3a74940  ! 708: FMULd	fmuld	%f60, %f0, %f56
	.word 0xb5508000  ! 709: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a7c860  ! 710: FADDq	dis not found

	.word 0xa150c000  ! 711: RDPR_TT	<illegal instruction>
	.word 0xb5a74920  ! 712: FMULs	fmuls	%f29, %f0, %f26
	.word 0x839da000  ! 713: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb3500000  ! 714: RDPR_TPC	<illegal instruction>
	.word 0xbd50c000  ! 715: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 716: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbb504000  ! 717: RDPR_TNPC	<illegal instruction>
	.word 0x839fe000  ! 718: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbd508000  ! 719: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 720: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbf50c000  ! 721: RDPR_TT	<illegal instruction>
	.word 0xb1a00540  ! 722: FSQRTd	fsqrt	
	.word 0x819de000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839e6000  ! 724: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819c6000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x85952000  ! 726: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xa3504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 728: RDPR_TPC	<illegal instruction>
	.word 0x819ea000  ! 729: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x81972000  ! 730: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb7508000  ! 731: RDPR_TSTATE	<illegal instruction>
	.word 0x8397a000  ! 732: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8d97a000  ! 733: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa5500000  ! 734: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 735: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 736: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa1504000  ! 737: RDPR_TNPC	<illegal instruction>
	.word 0x819c2000  ! 738: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8396a000  ! 739: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xad50c000  ! 740: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 741: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb9500000  ! 742: RDPR_TPC	<illegal instruction>
	.word 0xa3a54940  ! 743: FMULd	fmuld	%f52, %f0, %f48
	.word 0x8795e000  ! 744: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x81976000  ! 745: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x85972000  ! 746: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb3500000  ! 747: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 748: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x83962000  ! 749: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa950c000  ! 750: RDPR_TT	<illegal instruction>
	.word 0xa1a749a0  ! 751: FDIVs	fdivs	%f29, %f0, %f16
	.word 0x839fe000  ! 752: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbb504000  ! 753: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 754: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819fe000  ! 755: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb7a789e0  ! 756: FDIVq	dis not found

	.word 0xb150c000  ! 757: RDPR_TT	<illegal instruction>
	.word 0x8d956000  ! 758: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb9500000  ! 759: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 761: RDPR_TPC	<illegal instruction>
	.word 0x8596a000  ! 762: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb750c000  ! 763: RDPR_TT	<illegal instruction>
	.word 0x8d96e000  ! 764: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa3500000  ! 765: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 766: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 767: RDPR_TSTATE	<illegal instruction>
	.word 0xa1504000  ! 768: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 769: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839ce000  ! 770: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb1500000  ! 771: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 772: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb950c000  ! 773: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 774: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819e2000  ! 775: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xaf504000  ! 776: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 777: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 778: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x819c6000  ! 779: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa1504000  ! 780: RDPR_TNPC	<illegal instruction>
	.word 0xbda40960  ! 781: FMULq	dis not found

	.word 0xada48960  ! 782: FMULq	dis not found

	.word 0x819ca000  ! 783: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xad50c000  ! 784: RDPR_TT	<illegal instruction>
	.word 0xb5a588e0  ! 785: FSUBq	dis not found

	.word 0x8d96a000  ! 786: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x81942000  ! 787: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x85946000  ! 788: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb7a608a0  ! 789: FSUBs	fsubs	%f24, %f0, %f27
	.word 0x819ce000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x839d6000  ! 791: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb3a449c0  ! 792: FDIVd	fdivd	%f48, %f0, %f56
	.word 0x83952000  ! 793: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d946000  ! 794: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa9504000  ! 795: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 796: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 798: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa3a48920  ! 799: FMULs	fmuls	%f18, %f0, %f17
	.word 0xaf504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 801: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x819de000  ! 802: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa1a00560  ! 803: FSQRTq	fsqrt	
	.word 0x819ee000  ! 804: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x87956000  ! 805: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d976000  ! 806: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xafa709a0  ! 807: FDIVs	fdivs	%f28, %f0, %f23
	.word 0xafa00540  ! 808: FSQRTd	fsqrt	
	.word 0xa1504000  ! 809: RDPR_TNPC	<illegal instruction>
	.word 0xa750c000  ! 810: RDPR_TT	<illegal instruction>
	.word 0x83946000  ! 811: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb5504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 813: RDPR_TSTATE	<illegal instruction>
	.word 0x819ea000  ! 814: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbb500000  ! 815: RDPR_TPC	<illegal instruction>
	.word 0xada00540  ! 816: FSQRTd	fsqrt	
	.word 0xa5500000  ! 817: RDPR_TPC	<illegal instruction>
	.word 0x819ee000  ! 818: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa9a60820  ! 819: FADDs	fadds	%f24, %f0, %f20
	.word 0x8595a000  ! 820: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d94e000  ! 821: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8595a000  ! 822: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbb508000  ! 823: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 824: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbda00560  ! 825: FSQRTq	fsqrt	
	.word 0x8196e000  ! 826: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x85956000  ! 827: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xa1a448e0  ! 828: FSUBq	dis not found

	.word 0x83952000  ! 829: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819ce000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xab508000  ! 831: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 832: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xab500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x839ee000  ! 834: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8597e000  ! 835: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x87946000  ! 836: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d946000  ! 837: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x81946000  ! 838: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb9a709c0  ! 839: FDIVd	fdivd	%f28, %f0, %f28
	.word 0xb7a5c9e0  ! 840: FDIVq	dis not found

	.word 0xbf508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xbda4c9e0  ! 842: FDIVq	dis not found

	.word 0x8596a000  ! 843: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb5504000  ! 844: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa3500000  ! 845: RDPR_TPC	<illegal instruction>
	.word 0xa5a608a0  ! 846: FSUBs	fsubs	%f24, %f0, %f18
	.word 0xb1508000  ! 847: RDPR_TSTATE	<illegal instruction>
	.word 0xada708e0  ! 848: FSUBq	dis not found

	.word 0xbfa00520  ! 849: FSQRTs	fsqrt	
	.word 0xb3a54860  ! 850: FADDq	dis not found

	.word 0x8594e000  ! 851: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xab500000  ! 852: RDPR_TPC	<illegal instruction>
	.word 0x8794a000  ! 853: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xab508000  ! 854: RDPR_TSTATE	<illegal instruction>
	.word 0xa3500000  ! 855: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 856: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83956000  ! 857: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x819d6000  ! 858: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa1504000  ! 859: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 860: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8795e000  ! 861: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8397e000  ! 862: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbd50c000  ! 863: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 864: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 865: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8594a000  ! 866: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x81946000  ! 867: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x819fa000  ! 868: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xaf504000  ! 869: RDPR_TNPC	<illegal instruction>
	.word 0x8395a000  ! 870: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8196e000  ! 871: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa5508000  ! 872: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 873: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 874: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8d95a000  ! 875: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x83952000  ! 876: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d946000  ! 877: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x87976000  ! 878: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xab50c000  ! 879: RDPR_TT	<illegal instruction>
	.word 0x819c2000  ! 880: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8195e000  ! 881: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8797e000  ! 882: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa5500000  ! 883: RDPR_TPC	<illegal instruction>
	.word 0x839d2000  ! 884: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x819fa000  ! 885: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8394a000  ! 886: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xab504000  ! 887: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 888: RDPR_TNPC	<illegal instruction>
	.word 0x839ca000  ! 889: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb1a00560  ! 890: FSQRTq	fsqrt	
	.word 0x8195e000  ! 891: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x819d6000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x819de000  ! 893: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8595a000  ! 894: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbf508000  ! 895: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 896: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbba7c860  ! 897: FADDq	dis not found

	.word 0x8d966000  ! 898: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x839f6000  ! 899: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa3a64860  ! 900: FADDq	dis not found

	.word 0xb1a50960  ! 901: FMULq	dis not found

	.word 0x8d956000  ! 902: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819fe000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbd508000  ! 904: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 905: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa1504000  ! 906: RDPR_TNPC	<illegal instruction>
	.word 0x8d942000  ! 907: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa9500000  ! 908: RDPR_TPC	<illegal instruction>
	.word 0xa5a5c8a0  ! 909: FSUBs	fsubs	%f23, %f0, %f18
	.word 0x8396e000  ! 910: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xaba4c960  ! 911: FMULq	dis not found

	.word 0x8595a000  ! 912: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8195a000  ! 913: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8194a000  ! 914: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x83962000  ! 915: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xaf504000  ! 916: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 917: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x85972000  ! 918: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8397a000  ! 919: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa3500000  ! 920: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 921: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa7a00540  ! 922: FSQRTd	fsqrt	
	.word 0xab504000  ! 923: RDPR_TNPC	<illegal instruction>
	.word 0xaba64840  ! 924: FADDd	faddd	%f56, %f0, %f52
	.word 0x85942000  ! 925: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x85952000  ! 926: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbba78820  ! 927: FADDs	fadds	%f30, %f0, %f29
	.word 0x819fa000  ! 928: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8397a000  ! 929: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839ca000  ! 930: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8194e000  ! 931: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5a00520  ! 932: FSQRTs	fsqrt	
	.word 0x81956000  ! 933: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8196e000  ! 934: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83976000  ! 935: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x85976000  ! 936: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa5a00560  ! 937: FSQRTq	fsqrt	
	.word 0xa750c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xbda58860  ! 939: FADDq	dis not found

	.word 0xb3504000  ! 940: RDPR_TNPC	<illegal instruction>
	.word 0xa3a00520  ! 941: FSQRTs	fsqrt	
	.word 0x839e2000  ! 942: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa1508000  ! 943: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95e000  ! 944: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x85956000  ! 945: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x83972000  ! 946: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8396a000  ! 947: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x81942000  ! 948: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x81966000  ! 949: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbf500000  ! 950: RDPR_TPC	<illegal instruction>
	.word 0x8794e000  ! 951: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d95a000  ! 952: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb3a5c8c0  ! 953: FSUBd	fsubd	%f54, %f0, %f56
	.word 0x8797e000  ! 954: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb5a00520  ! 955: FSQRTs	fsqrt	
	.word 0x819d2000  ! 956: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa950c000  ! 957: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 958: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 959: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 960: RDPR_TPC	<illegal instruction>
	.word 0x8d976000  ! 961: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa5508000  ! 962: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 963: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 964: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x839d6000  ! 965: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa9a789e0  ! 966: FDIVq	dis not found

	.word 0xaba00540  ! 967: FSQRTd	fsqrt	
	.word 0x87942000  ! 968: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xafa688a0  ! 969: FSUBs	fsubs	%f26, %f0, %f23
	.word 0xab504000  ! 970: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 971: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa9508000  ! 972: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 973: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb9a78960  ! 974: FMULq	dis not found

	.word 0x8196a000  ! 975: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa5508000  ! 976: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a649e0  ! 977: FDIVq	dis not found

	.word 0xb7504000  ! 978: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 980: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 981: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819e6000  ! 982: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa3504000  ! 983: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 984: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xaf500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0xa7a40860  ! 986: FADDq	dis not found

	.word 0xa9508000  ! 987: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 988: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa1504000  ! 989: RDPR_TNPC	<illegal instruction>
	.word 0xbfa40940  ! 990: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb9508000  ! 991: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 992: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8796a000  ! 993: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa9500000  ! 994: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 995: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbd508000  ! 996: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 997: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 998: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x9bfd227600005be8
	.xword	0xbe6c08b000000bc1
	.xword	0xef918f230000cef7
	.xword	0x2840e4120000198f
	.xword	0xddc7d05500001b97
	.xword	0xe4aacf1300000fb6
	.xword	0x4d83ee5f00002d0c
	.xword	0x8be147ab00005dda
	.xword	0x1f260f7b0000abfd
	.xword	0x3c734b4f00009f33
	.xword	0x9e8a9f570000ca3d
	.xword	0xec44a3a400008db4
	.xword	0x60b3d60d00002df4
	.xword	0xe329d47e0000dac0
	.xword	0xc251de8800005b9b
	.xword	0x274a2d060000cd41
	.xword	0x4753da3f0000c843
	.xword	0x3bdb10bb00009b5d
	.xword	0xb95819c7000058c5
	.xword	0x2b2ee3c10000fcc7
	.xword	0x37b63e9a0000cb41
	.xword	0x6cc0f85800006ab3
	.xword	0x44b4b5470000cc08
	.xword	0x984f55780000cee5
	.xword	0xaef5b9890000796d
	.xword	0xa82230c20000a8c6
	.xword	0x1ed0a6ee00001dd7
	.xword	0xf2ee160900003d3c
	.xword	0x5d4cf179000089c0
	.xword	0x904ed09c00006e07
	.xword	0xc26f293a0000de04
	.xword	0x5c4e97d800009cb8
	.xword	0xd6192ad200009dc5
	.xword	0x1aae2dd600001940
	.xword	0xea555af900006a8c
	.xword	0xc7feb7300000fa0d
	.xword	0x74591fdd00005d4c
	.xword	0xdb1b84f90000bda6
	.xword	0xc47725870000ac8c
	.xword	0x2fb6136d00009e9e
	.xword	0x711b5ff20000bc13
	.xword	0xf331133200003fd1
	.xword	0xc3c81e6300001f88
	.xword	0x0e42322a0000e83b
	.xword	0x7a49d81500003ff5
	.xword	0x238db227000099e4
	.xword	0x32b378b000000911
	.xword	0x91f884cf00007dfd
	.xword	0x29a7d23300002c6c
	.xword	0xf3537d16000059cc
	.xword	0x30c3c5d400009c7f
	.xword	0x5f9ebe8500008ff9
	.xword	0xdabf911900008bd4
	.xword	0xf7aa772e0000e979
	.xword	0x4b5cc15100009f03
	.xword	0xa9d578a50000cd39
	.xword	0x39fddecb00009b92
	.xword	0x42fdaf6b0000b80c
	.xword	0x3cda4e9500009a7c
	.xword	0x86a538f40000d985
	.xword	0xd4d10b4000009931
	.xword	0x3714095f00001fb7
	.xword	0xa2db334c00009a34
	.xword	0x3377589900005f5e
	.xword	0x8d850ae70000aab4
	.xword	0x9accec3d0000bcd5
	.xword	0x272bb0c90000bb30
	.xword	0x003da35300000a5e
	.xword	0x1c6ab8130000df17
	.xword	0xa75ed51f00006ee2
	.xword	0x46e7f6b900003978
	.xword	0x5a2888510000b929
	.xword	0x49442b390000ff72
	.xword	0xc8e460ee0000ba33
	.xword	0x217b9e2b00009c14
	.xword	0x561e54140000fcee
	.xword	0xd552dbd70000da34
	.xword	0x3d07dfbe00007a6e
	.xword	0xaa3d75a80000a89b
	.xword	0x32d8bc090000c921
	.xword	0x39fd7ac600003e6e
	.xword	0x3d9a4bb90000f904
	.xword	0x593126810000bcda
	.xword	0x54f9f95c000049fb
	.xword	0xaa0396b000001c55
	.xword	0x735c5518000098ff
	.xword	0x463314650000ec55
	.xword	0x31f1831800000ca6
	.xword	0x0d1694a10000ea1c
	.xword	0xcd62c5b900007dfd
	.xword	0xcc81396600004a5e
	.xword	0x9f9953940000db75
	.xword	0x2134b6b300002cf8
	.xword	0x4f735e1500004fd9
	.xword	0xa259c5ef00008f00
	.xword	0xb890c1ce0000a9fa
	.xword	0xaa59bd7e00007b0b
	.xword	0x75858e5e00004f0d
	.xword	0x7e007c4800009d9c
	.xword	0x9325ea21000028c8
	.xword	0xbddfdcb700000f8b
	.xword	0x5c81def500006dac
	.xword	0xb75131aa0000af8b
	.xword	0xfa0e69870000ba89
	.xword	0xc6283da600007cb5
	.xword	0x67a37e5100004d76
	.xword	0xd50c57850000fa0a
	.xword	0xab534aea0000ff68
	.xword	0x709b011300006dd7
	.xword	0xdc8d3a770000fec9
	.xword	0x49280b3b00007f11
	.xword	0x8072a79f0000ac84
	.xword	0x399d018800001987
	.xword	0x15a48f8c0000db30
	.xword	0xcd23f12600004cff
	.xword	0xf2de45c600005b6e
	.xword	0x9b1cb6a600005bbf
	.xword	0x49d4377a0000ed61
	.xword	0xdbcaa2320000a9d9
	.xword	0xdd6be1d700001ff9
	.xword	0xfe1fbd8500009a9b
	.xword	0x960d5aaf00005a32
	.xword	0x9bc9479200005bed
	.xword	0xe3bac0820000eceb
	.xword	0x29dab05700007d95
	.xword	0x7accccc20000ef1e
	.xword	0x1b4a3b4a0000189b
	.xword	0x022731b900004a5b



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
