// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asi_access_mt_1_rand_s2.s
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
   random seed:	373565673
   Jal tlu_asi_access_mt_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

	ta 	%icc, T_CHANGE_HPRIV
	mov	0x123, %g1
	wr	%g0, 0x20, %asi
	stxa	%g1, [0x00] %asi
	stxa	%g1, [0x08] %asi
	stxa	%g1, [0x10] %asi
	stxa	%g1, [0x18] %asi
	stxa	%g1, [0x20] %asi
	stxa	%g1, [0x28] %asi
	stxa	%g1, [0x30] %asi
	stxa	%g1, [0x38] %asi
	ta 	%icc, T_CHANGE_NONHPRIV

! Register init code

	setx 0x0c19d67c6d4b22ff, %g1, %g0
	setx 0xd26412580ea7398e, %g1, %g1
	setx 0xe09f8a03d5a02266, %g1, %g2
	setx 0x2f386f98a595ef85, %g1, %g3
	setx 0x1e9d60c02efe6b98, %g1, %g4
	setx 0x693ec688ac498b82, %g1, %g5
	setx 0x32055c40a694ed59, %g1, %g6
	setx 0x546c364b8b152c4c, %g1, %g7
	setx 0x4fdc6c03c3093e1f, %g1, %r16
	setx 0x6b270b2d72a0321c, %g1, %r17
	setx 0x8c2f8585cc352edd, %g1, %r18
	setx 0xa9dd29f78d533e68, %g1, %r19
	setx 0xc36e8c67b0d1b11f, %g1, %r20
	setx 0x8c5193e306429d15, %g1, %r21
	setx 0xb25e3c20ee3cd25a, %g1, %r22
	setx 0xc9e2668f14e49bca, %g1, %r23
	setx 0x88aaecc9d16ccd87, %g1, %r24
	setx 0x94313e5b0295d4ee, %g1, %r25
	setx 0xf34ab401dc573e66, %g1, %r26
	setx 0x48c435d6979cfbcf, %g1, %r27
	setx 0xdffdfc9e9e543987, %g1, %r28
	setx 0x31db6909e0cfb00b, %g1, %r29
	setx 0x82e1781d0ba8d42f, %g1, %r30
	setx 0x5d1fbbacfd504ff6, %g1, %r31
	save
	setx 0xff1d58d62e315fd6, %g1, %r16
	setx 0x28731e860772a381, %g1, %r17
	setx 0xac23a0f314ca7f5d, %g1, %r18
	setx 0x600817c05de94482, %g1, %r19
	setx 0xaffd9dd08ea7e7c9, %g1, %r20
	setx 0x780bd4f4210a1c37, %g1, %r21
	setx 0xdee7aa37bd19518a, %g1, %r22
	setx 0x5cbfe59aa4127466, %g1, %r23
	setx 0x966838024d0a772a, %g1, %r24
	setx 0x82ab1119cd97e9de, %g1, %r25
	setx 0x90f7a6b70ccc0658, %g1, %r26
	setx 0x44b7363857cbda29, %g1, %r27
	setx 0x37b801b608df7711, %g1, %r28
	setx 0x92050756e3256689, %g1, %r29
	setx 0x61c67256ff238e30, %g1, %r30
	setx 0xadc2e48cf7b21c1a, %g1, %r31
	save
	setx 0x6bacecf2c6377f15, %g1, %r16
	setx 0x7aeb604f9d8287a1, %g1, %r17
	setx 0x0237bf0d6a76ba4a, %g1, %r18
	setx 0x30fa232a8c591126, %g1, %r19
	setx 0xef89c42e199d1778, %g1, %r20
	setx 0x8e4daf94f90d5e26, %g1, %r21
	setx 0xdbead7aff5da56d7, %g1, %r22
	setx 0xe40ff9459f4bf020, %g1, %r23
	setx 0xc53222c4f85faf66, %g1, %r24
	setx 0xb4802b86ff14e829, %g1, %r25
	setx 0x19e07bc1538f0ad3, %g1, %r26
	setx 0x8068a9e285e7fe15, %g1, %r27
	setx 0x5cbd244a1f428783, %g1, %r28
	setx 0x1f0b79da013ab1e4, %g1, %r29
	setx 0xc152bc022d8d0884, %g1, %r30
	setx 0x1db7cd002a524466, %g1, %r31
	restore
	mov	0x70, %r16
	mov	0x20, %r17
	mov	0x0, %r18
	mov	0x0, %r19
	mov	0x3f8, %r20
	mov	0x7f0, %r21
	mov	0x3e8, %r22
	mov	0x3f8, %r23
	mov	0x50, %r24
	mov	0x68, %r25
	mov	0x8, %r26
	mov	0x78, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x20, %asi
	stxa	%g0, [%g0] 0x42
	mov	0x38, %g1
	stxa	%g0, [%g1] 0x58
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
	mov	0x3d0, %r21
	.word 0xeab70e80  ! 1: STHA_R	stha	%r21, [%r28 + %r0] 0x74
	.word 0x87802072  ! 2: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r16
	.word 0xe6bfce40  ! 4: STDA_R	stda	%r19, [%r31 + %r0] 0x72
	.word 0xe29dc4a0  ! 5: LDDA_R	ldda	[%r23, %r0] 0x25, %r17
	.word 0x87802072  ! 6: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2b7a000  ! 7: STHA_I	stha	%r17, [%r30 + 0x0000] %asi
	.word 0xeef689e0  ! 8: STXA_R	stxa	%r23, [%r26 + %r0] 0x4f
	.word 0xe6a48400  ! 9: STWA_R	stwa	%r19, [%r18 + %r0] 0x20
	.word 0xe6c7e000  ! 10: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0xeadec9e0  ! 11: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r21
	.word 0xeab76000  ! 12: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x20, %r27
	.word 0xeebc4400  ! 14: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	mov	0x40, %r19
	.word 0x87802074  ! 16: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea970e60  ! 17: LDUHA_R	lduha	[%r28, %r0] 0x73, %r21
	.word 0xe4c44400  ! 18: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r18
	mov	0x3c8, %r21
	.word 0xe487e000  ! 20: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r18
	.word 0xe4dfa000  ! 21: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4cfe000  ! 22: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r18
	.word 0xe4a76000  ! 23: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	mov	0x60, %r25
	mov	0x78, %r18
	.word 0xe8dd44a0  ! 26: LDXA_R	ldxa	[%r21, %r0] 0x25, %r20
	.word 0xe8afa000  ! 27: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe8afa000  ! 28: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 29: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8870e80  ! 30: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r20
	.word 0xe8c70e60  ! 31: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r20
	.word 0xe8b76000  ! 32: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0xe8a7e000  ! 33: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	mov	0x28, %r18
	mov	0x30, %r24
	.word 0x8780204f  ! 36: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8ce2000  ! 37: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r20
	.word 0xeeb649e0  ! 38: STHA_R	stha	%r23, [%r25 + %r0] 0x4f
	.word 0x87802074  ! 39: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0dec9e0  ! 40: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r16
	mov	0x3d0, %r20
	.word 0xee9f8e80  ! 42: LDDA_R	ldda	[%r30, %r0] 0x74, %r23
	.word 0x8780204f  ! 43: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeef66000  ! 44: STXA_I	stxa	%r23, [%r25 + 0x0000] %asi
	.word 0xeebfce60  ! 45: STDA_R	stda	%r23, [%r31 + %r0] 0x73
	.word 0xeecee000  ! 46: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r23
	.word 0x87802074  ! 47: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8878e60  ! 49: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r20
	mov	0x7f8, %r20
	.word 0xecb44400  ! 51: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	mov	0x68, %r17
	.word 0xe6b40400  ! 53: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0x87802020  ! 54: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8d584a0  ! 55: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r20
	.word 0x87802072  ! 56: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09e09e0  ! 57: LDDA_R	ldda	[%r24, %r0] 0x4f, %r16
	.word 0x87802020  ! 58: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 59: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0bee000  ! 60: STDA_I	stda	%r16, [%r27 + 0x0000] %asi
	.word 0xe6f74e80  ! 61: STXA_R	stxa	%r19, [%r29 + %r0] 0x74
	.word 0xe8cf8e80  ! 62: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r20
	.word 0xe886c9e0  ! 63: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r20
	mov	0x8, %r26
	mov	0x18, %r18
	mov	0x3f0, %r23
	.word 0xe8cea000  ! 67: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r20
	.word 0xe88e2000  ! 68: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r20
	.word 0x87802074  ! 69: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 70: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 71: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe88ca000  ! 72: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r20
	.word 0x87802025  ! 73: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 74: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8962000  ! 75: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r20
	mov	0x28, %r16
	mov	0x7e0, %r20
	.word 0x8780204f  ! 78: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x30, %r26
	.word 0xe8f6e000  ! 80: STXA_I	stxa	%r20, [%r27 + 0x0000] %asi
	.word 0xecacc400  ! 81: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xecd504a0  ! 82: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r22
	.word 0x87802020  ! 83: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 84: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbe6000  ! 85: STDA_I	stda	%r22, [%r25 + 0x0000] %asi
	.word 0x87802072  ! 86: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecc72000  ! 87: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	mov	0x30, %r24
	.word 0xecbf6000  ! 89: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0xe4a40400  ! 90: STWA_R	stwa	%r18, [%r16 + %r0] 0x20
	mov	0x3e8, %r22
	.word 0xe4b7a000  ! 92: STHA_I	stha	%r18, [%r30 + 0x0000] %asi
	.word 0xeace49e0  ! 93: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r21
	.word 0xeaf72000  ! 94: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xeab7e000  ! 95: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x8, %r17
	.word 0xeaf76000  ! 97: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xeaafa000  ! 98: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xeab7a000  ! 99: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	mov	0x40, %r18
	.word 0xead76000  ! 101: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	mov	0x3f0, %r21
	mov	0x10, %r16
	mov	0x3d0, %r21
	.word 0xe4df4e60  ! 105: LDXA_R	ldxa	[%r29, %r0] 0x73, %r18
	mov	0x50, %r26
	mov	0x3c8, %r21
	mov	0x78, %r19
	.word 0xe484c400  ! 109: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r18
	mov	0x0, %r26
	.word 0xe4b7a000  ! 111: STHA_I	stha	%r18, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 112: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r16
	.word 0xe4f4c400  ! 114: STXA_R	stxa	%r18, [%r19 + %r0] 0x20
	.word 0xe6bc4400  ! 115: STDA_R	stda	%r19, [%r17 + %r0] 0x20
	.word 0xe69fe000  ! 116: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r19
	mov	0x7f0, %r21
	.word 0xe2f5c4a0  ! 118: STXA_R	stxa	%r17, [%r23 + %r0] 0x25
	.word 0xe6afce40  ! 119: STBA_R	stba	%r19, [%r31 + %r0] 0x72
	mov	0x0, %r18
	.word 0xe687e000  ! 121: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6af6000  ! 122: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 123: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x58, %r26
	mov	0x3e8, %r20
	.word 0xe6a72000  ! 126: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6870e40  ! 127: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r19
	.word 0xe6b76000  ! 128: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe2bf8e60  ! 129: STDA_R	stda	%r17, [%r30 + %r0] 0x73
	.word 0x87802074  ! 130: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x60, %r25
	mov	0x7f8, %r22
	.word 0xe2ad04a0  ! 133: STBA_R	stba	%r17, [%r20 + %r0] 0x25
	.word 0xe2c76000  ! 134: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0x87802073  ! 135: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 136: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2bf2000  ! 137: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	mov	0x7d0, %r20
	.word 0x87802025  ! 139: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea9f4e40  ! 140: LDDA_R	ldda	[%r29, %r0] 0x72, %r21
	.word 0xea9d2000  ! 141: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r21
	.word 0xeacdc4a0  ! 142: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r21
	.word 0xea9d2000  ! 143: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r21
	.word 0xeadda000  ! 144: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r21
	mov	0x10, %r17
	mov	0x3d8, %r20
	.word 0xea8d2000  ! 147: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r21
	.word 0xeaa5a000  ! 148: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xeaf5a000  ! 149: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xeacda000  ! 150: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r21
	.word 0xeaada000  ! 151: STBA_I	stba	%r21, [%r22 + 0x0000] %asi
	.word 0xeabd6000  ! 152: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	mov	0x0, %r19
	.word 0xee8689e0  ! 154: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r23
	.word 0xe6f78e80  ! 155: STXA_R	stxa	%r19, [%r30 + %r0] 0x74
	.word 0xe6cde000  ! 156: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	mov	0x28, %r27
	.word 0xe685a000  ! 158: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r19
	.word 0xe69d2000  ! 159: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r19
	mov	0x70, %r26
	.word 0xe6c56000  ! 161: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r19
	mov	0x3d8, %r21
	mov	0x3d0, %r22
	.word 0xe6ad2000  ! 164: STBA_I	stba	%r19, [%r20 + 0x0000] %asi
	.word 0xeacd44a0  ! 165: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r21
	.word 0xe69ec9e0  ! 166: LDDA_R	ldda	[%r27, %r0] 0x4f, %r19
	mov	0x3f0, %r22
	.word 0xe6b5a000  ! 168: STHA_I	stha	%r19, [%r22 + 0x0000] %asi
	.word 0xeaa689e0  ! 169: STWA_R	stwa	%r21, [%r26 + %r0] 0x4f
	.word 0xeabdc4a0  ! 170: STDA_R	stda	%r21, [%r23 + %r0] 0x25
	.word 0xea9d2000  ! 171: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r21
	.word 0x87802025  ! 172: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x58, %r18
	.word 0xeabda000  ! 174: STDA_I	stda	%r21, [%r22 + 0x0000] %asi
	.word 0xe697ce80  ! 175: LDUHA_R	lduha	[%r31, %r0] 0x74, %r19
	mov	0x0, %r24
	mov	0x40, %r26
	.word 0xe68d6000  ! 178: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe68da000  ! 179: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r19
	.word 0xe6952000  ! 180: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r19
	.word 0xe8bf8e40  ! 181: STDA_R	stda	%r20, [%r30 + %r0] 0x72
	.word 0xe0ac8400  ! 182: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	.word 0xe2bf0e80  ! 183: STDA_R	stda	%r17, [%r28 + %r0] 0x74
	.word 0xe2b52000  ! 184: STHA_I	stha	%r17, [%r20 + 0x0000] %asi
	.word 0xe2b56000  ! 185: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	mov	0x30, %r27
	.word 0xe4df4e40  ! 187: LDXA_R	ldxa	[%r29, %r0] 0x72, %r18
	.word 0xe4cd2000  ! 188: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r18
	mov	0x58, %r17
	mov	0x70, %r17
	.word 0x87802020  ! 191: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeca40400  ! 192: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	.word 0xecde49e0  ! 193: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r22
	.word 0xe0a74e80  ! 194: STWA_R	stwa	%r16, [%r29 + %r0] 0x74
	.word 0xec870e80  ! 195: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r22
	.word 0xeea4c400  ! 196: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	.word 0xeeb649e0  ! 197: STHA_R	stha	%r23, [%r25 + %r0] 0x4f
	.word 0xeeb46000  ! 198: STHA_I	stha	%r23, [%r17 + 0x0000] %asi
	.word 0xeec46000  ! 199: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r23
	.word 0xeedc6000  ! 200: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r23
	.word 0x87802073  ! 201: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x0, %r19
	mov	0x7e8, %r23
	mov	0x60, %r25
	.word 0xeeb72000  ! 205: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xeeb76000  ! 206: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xeeaf2000  ! 208: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeea72000  ! 209: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	mov	0x18, %r27
	.word 0xeebf6000  ! 211: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0x87802072  ! 212: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeedf6000  ! 213: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	mov	0x68, %r24
	.word 0xe08c4400  ! 215: LDUBA_R	lduba	[%r17, %r0] 0x20, %r16
	mov	0x60, %r18
	.word 0xe29c8400  ! 217: LDDA_R	ldda	[%r18, %r0] 0x20, %r17
	.word 0xe2a70e80  ! 218: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	.word 0xe2876000  ! 219: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	mov	0x18, %r16
	mov	0x3f8, %r20
	.word 0xe2a7a000  ! 222: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	mov	0x0, %r27
	.word 0xecbf8e40  ! 224: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	mov	0x3f0, %r22
	.word 0xe29f4e80  ! 226: LDDA_R	ldda	[%r29, %r0] 0x74, %r17
	.word 0x8780204f  ! 227: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe28e6000  ! 228: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r17
	.word 0x87802074  ! 229: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2afe000  ! 230: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe29f6000  ! 231: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r17
	mov	0x68, %r19
	mov	0x7e0, %r21
	.word 0xe2bfa000  ! 234: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	.word 0x87802073  ! 235: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 236: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2b7ce80  ! 237: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	mov	0x3d8, %r21
	mov	0x50, %r26
	.word 0xe2f72000  ! 240: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 241: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b4a000  ! 242: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0xe2b42000  ! 243: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	.word 0xe2b42000  ! 244: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	.word 0xe2dc6000  ! 245: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r17
	.word 0xe2dc2000  ! 246: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r17
	.word 0xecf74e60  ! 247: STXA_R	stxa	%r22, [%r29 + %r0] 0x73
	.word 0xeca4a000  ! 248: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0xeca4e000  ! 249: STWA_I	stwa	%r22, [%r19 + 0x0000] %asi
	.word 0xecace000  ! 250: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xead70e60  ! 251: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r21
	.word 0xea942000  ! 252: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r21
	mov	0x7e0, %r21
	.word 0xea9ce000  ! 254: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r21
	.word 0xeab46000  ! 255: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xe2f689e0  ! 256: STXA_R	stxa	%r17, [%r26 + %r0] 0x4f
	.word 0xecad04a0  ! 257: STBA_R	stba	%r22, [%r20 + %r0] 0x25
	.word 0xecac6000  ! 258: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xeabc4400  ! 259: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0x87802020  ! 260: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4bf4e80  ! 261: STDA_R	stda	%r18, [%r29 + %r0] 0x74
	mov	0x3c0, %r20
	.word 0xe4b4a000  ! 263: STHA_I	stha	%r18, [%r18 + 0x0000] %asi
	.word 0xe4946000  ! 264: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r18
	.word 0x87802020  ! 265: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8c48400  ! 266: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r20
	.word 0xe89c2000  ! 267: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r20
	.word 0x87802072  ! 268: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 269: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8d72000  ! 270: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r20
	.word 0xe28c4400  ! 271: LDUBA_R	lduba	[%r17, %r0] 0x20, %r17
	.word 0xe2a72000  ! 272: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xe4f584a0  ! 273: STXA_R	stxa	%r18, [%r22 + %r0] 0x25
	.word 0xeaf7ce40  ! 274: STXA_R	stxa	%r21, [%r31 + %r0] 0x72
	.word 0x87802073  ! 275: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6c7ce40  ! 276: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r19
	.word 0xeeb5c4a0  ! 277: STHA_R	stha	%r23, [%r23 + %r0] 0x25
	.word 0xeea7e000  ! 278: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xe0cc0400  ! 279: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r16
	.word 0xe8ae89e0  ! 280: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
	.word 0xe6bd04a0  ! 281: STDA_R	stda	%r19, [%r20 + %r0] 0x25
	mov	0x68, %r25
	.word 0xeccc4400  ! 283: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r22
	.word 0xecaf6000  ! 284: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 285: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 286: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4f40400  ! 287: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	.word 0x87802020  ! 288: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b649e0  ! 289: STHA_R	stha	%r19, [%r25 + %r0] 0x4f
	.word 0xe68c6000  ! 290: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r19
	.word 0xe6f42000  ! 291: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 292: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6de2000  ! 293: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r19
	.word 0xe8a48400  ! 294: STWA_R	stwa	%r20, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 295: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8be6000  ! 296: STDA_I	stda	%r20, [%r25 + 0x0000] %asi
	.word 0xe8dee000  ! 297: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r20
	mov	0x40, %r17
	mov	0x3e0, %r23
	.word 0x87802020  ! 300: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x20, %r17
	mov	0x3d0, %r23
	.word 0x87802020  ! 303: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 304: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdf0e40  ! 305: LDXA_R	ldxa	[%r28, %r0] 0x72, %r22
	mov	0x50, %r26
	.word 0xecdce000  ! 307: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r22
	.word 0xecdc2000  ! 308: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 309: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6cf0e80  ! 310: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r19
	.word 0xe6be2000  ! 311: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	.word 0xe6a62000  ! 312: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0xe69e2000  ! 313: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a66000  ! 314: STWA_I	stwa	%r19, [%r25 + 0x0000] %asi
	.word 0xe8acc400  ! 315: STBA_R	stba	%r20, [%r19 + %r0] 0x20
	.word 0xe8f66000  ! 316: STXA_I	stxa	%r20, [%r25 + 0x0000] %asi
	.word 0xe8f6a000  ! 317: STXA_I	stxa	%r20, [%r26 + 0x0000] %asi
	mov	0x18, %r18
	.word 0xeeb74e40  ! 319: STHA_R	stha	%r23, [%r29 + %r0] 0x72
	mov	0x7d8, %r20
	.word 0x87802073  ! 321: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0bf8e80  ! 322: STDA_R	stda	%r16, [%r30 + %r0] 0x74
	mov	0x58, %r26
	.word 0xe0afa000  ! 324: STBA_I	stba	%r16, [%r30 + 0x0000] %asi
	.word 0xe2c78e40  ! 325: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r17
	.word 0x87802074  ! 326: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x50, %r26
	mov	0x38, %r18
	.word 0xe0ccc400  ! 329: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	.word 0xe0a7a000  ! 330: STWA_I	stwa	%r16, [%r30 + 0x0000] %asi
	mov	0x8, %r24
	.word 0xe2af4e60  ! 332: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xe2d76000  ! 333: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0x87802025  ! 334: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x30, %r17
	.word 0xe4f74e40  ! 336: STXA_R	stxa	%r18, [%r29 + %r0] 0x72
	.word 0xea978e80  ! 337: LDUHA_R	lduha	[%r30, %r0] 0x74, %r21
	.word 0xe69f8e80  ! 338: LDDA_R	ldda	[%r30, %r0] 0x74, %r19
	.word 0xe68da000  ! 339: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r19
	.word 0xe685e000  ! 340: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r19
	.word 0xe6d5e000  ! 341: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r19
	.word 0x87802020  ! 342: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6942000  ! 343: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r19
	mov	0x7f8, %r22
	mov	0x30, %r17
	.word 0xe6a46000  ! 346: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	.word 0x87802074  ! 347: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3c0, %r20
	.word 0xe6bf2000  ! 349: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0xe6cfe000  ! 350: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0x87802072  ! 351: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 352: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r24
	.word 0x87802072  ! 354: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6872000  ! 355: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6bf6000  ! 356: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xe8dfce60  ! 357: LDXA_R	ldxa	[%r31, %r0] 0x73, %r20
	.word 0xecf584a0  ! 358: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	.word 0xecb76000  ! 359: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xecbf0e60  ! 360: STDA_R	stda	%r22, [%r28 + %r0] 0x73
	.word 0xe4f78e60  ! 361: STXA_R	stxa	%r18, [%r30 + %r0] 0x73
	.word 0xeadfce40  ! 362: LDXA_R	ldxa	[%r31, %r0] 0x72, %r21
	mov	0x70, %r27
	.word 0xeaf72000  ! 364: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xe4cf8e80  ! 365: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r18
	.word 0xe4afe000  ! 366: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 367: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 368: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r24
	.word 0xeeb48400  ! 370: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0xeeafa000  ! 371: STBA_I	stba	%r23, [%r30 + 0x0000] %asi
	.word 0xe0b4c400  ! 372: STHA_R	stha	%r16, [%r19 + %r0] 0x20
	.word 0xe0b72000  ! 373: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe0df6000  ! 374: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r16
	.word 0xecf7ce60  ! 375: STXA_R	stxa	%r22, [%r31 + %r0] 0x73
	.word 0xe0f78e60  ! 376: STXA_R	stxa	%r16, [%r30 + %r0] 0x73
	.word 0xe6df0e80  ! 377: LDXA_R	ldxa	[%r28, %r0] 0x74, %r19
	.word 0xe4bd44a0  ! 378: STDA_R	stda	%r18, [%r21 + %r0] 0x25
	.word 0xe6c44400  ! 379: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r19
	.word 0x87802073  ! 380: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6a689e0  ! 381: STWA_R	stwa	%r19, [%r26 + %r0] 0x4f
	.word 0xe8cf4e80  ! 382: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r20
	.word 0x87802020  ! 383: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f4a000  ! 384: STXA_I	stxa	%r20, [%r18 + 0x0000] %asi
	mov	0x40, %r18
	.word 0xe0870e80  ! 386: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r16
	mov	0x0, %r24
	mov	0x30, %r19
	.word 0xe08c6000  ! 389: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r16
	.word 0xe0bc2000  ! 390: STDA_I	stda	%r16, [%r16 + 0x0000] %asi
	mov	0x28, %r17
	.word 0xe8cfce80  ! 392: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r20
	.word 0xe09f0e80  ! 393: LDDA_R	ldda	[%r28, %r0] 0x74, %r16
	.word 0x87802020  ! 394: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe48d04a0  ! 395: LDUBA_R	lduba	[%r20, %r0] 0x25, %r18
	.word 0xeaf70e40  ! 396: STXA_R	stxa	%r21, [%r28 + %r0] 0x72
	.word 0xe4b7ce80  ! 397: STHA_R	stha	%r18, [%r31 + %r0] 0x74
	.word 0xec9689e0  ! 398: LDUHA_R	lduha	[%r26, %r0] 0x4f, %r22
	.word 0xecbca000  ! 399: STDA_I	stda	%r22, [%r18 + 0x0000] %asi
	.word 0xecc4a000  ! 400: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r22
	.word 0x87802074  ! 401: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3e0, %r20
	.word 0xec872000  ! 403: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r22
	.word 0xecdfe000  ! 404: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	.word 0xecdfe000  ! 405: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	.word 0xee9cc400  ! 406: LDDA_R	ldda	[%r19, %r0] 0x20, %r23
	.word 0xeea76000  ! 407: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 408: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4b504a0  ! 409: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	mov	0x7d0, %r23
	.word 0x87802020  ! 411: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x0, %r24
	.word 0xe49c2000  ! 413: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r18
	mov	0x68, %r26
	.word 0x87802072  ! 415: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3c8, %r21
	.word 0xeaa4c400  ! 417: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	mov	0x60, %r27
	.word 0xe0b4c400  ! 419: STHA_R	stha	%r16, [%r19 + %r0] 0x20
	.word 0xe0d7a000  ! 420: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	mov	0x60, %r17
	.word 0xe8f544a0  ! 422: STXA_R	stxa	%r20, [%r21 + %r0] 0x25
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802074  ! 424: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2b649e0  ! 425: STHA_R	stha	%r17, [%r25 + %r0] 0x4f
	mov	0x7e0, %r22
	.word 0xe2afe000  ! 427: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe29f2000  ! 428: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a72000  ! 429: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2b7e000  ! 430: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 431: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x50, %r24
	.word 0xe2b6e000  ! 433: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	.word 0xe8a7ce80  ! 434: STWA_R	stwa	%r20, [%r31 + %r0] 0x74
	.word 0xe6f48400  ! 435: STXA_R	stxa	%r19, [%r18 + %r0] 0x20
	.word 0xeebcc400  ! 436: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	.word 0x87802020  ! 437: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 438: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 439: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x78, %r27
	.word 0xe4bfce60  ! 441: STDA_R	stda	%r18, [%r31 + %r0] 0x73
	.word 0xe6bfce60  ! 442: STDA_R	stda	%r19, [%r31 + %r0] 0x73
	.word 0xe6876000  ! 443: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6af6000  ! 444: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6d76000  ! 446: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r19
	.word 0xe6a7e000  ! 447: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	mov	0x0, %r18
	mov	0x3d8, %r21
	.word 0xe8ce49e0  ! 450: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r20
	.word 0xe8f76000  ! 451: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 452: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8bd6000  ! 453: STDA_I	stda	%r20, [%r21 + 0x0000] %asi
	.word 0xeab40400  ! 454: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0xea95a000  ! 455: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r21
	.word 0xead52000  ! 456: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r21
	.word 0xeaa5a000  ! 457: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xecd649e0  ! 458: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r22
	.word 0xecb5a000  ! 459: STHA_I	stha	%r22, [%r22 + 0x0000] %asi
	.word 0xe2dcc400  ! 460: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	.word 0xe29da000  ! 461: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r17
	.word 0xe2852000  ! 462: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r17
	mov	0x7c8, %r21
	.word 0x87802074  ! 464: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe297a000  ! 465: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r17
	.word 0x87802073  ! 466: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2ae09e0  ! 467: STBA_R	stba	%r17, [%r24 + %r0] 0x4f
	mov	0x3d0, %r23
	.word 0x87802020  ! 469: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b7ce40  ! 470: STHA_R	stha	%r19, [%r31 + %r0] 0x72
	.word 0xe6942000  ! 471: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r19
	.word 0xe68ce000  ! 472: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	mov	0x58, %r16
	.word 0xe68ce000  ! 474: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	.word 0xe6f42000  ! 475: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0xe8f40400  ! 476: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	.word 0xe8942000  ! 477: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 478: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x48, %r24
	.word 0x8780204f  ! 480: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3c0, %r23
	mov	0x8, %r17
	.word 0xe8b62000  ! 483: STHA_I	stha	%r20, [%r24 + 0x0000] %asi
	.word 0xe8b6a000  ! 484: STHA_I	stha	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 485: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a46000  ! 486: STWA_I	stwa	%r20, [%r17 + 0x0000] %asi
	mov	0x3c0, %r21
	.word 0x87802025  ! 488: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0cd84a0  ! 489: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r16
	mov	0x7f8, %r22
	.word 0xe0bd2000  ! 491: STDA_I	stda	%r16, [%r20 + 0x0000] %asi
	.word 0xe0f5e000  ! 492: STXA_I	stxa	%r16, [%r23 + 0x0000] %asi
	mov	0x3f8, %r21
	mov	0x7f8, %r23
	mov	0x7d0, %r20
	.word 0xecaf8e40  ! 496: STBA_R	stba	%r22, [%r30 + %r0] 0x72
	.word 0xecd52000  ! 497: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r22
	.word 0xeaaf4e40  ! 498: STBA_R	stba	%r21, [%r29 + %r0] 0x72
	mov	0x7d8, %r22
	.word 0xeacde000  ! 500: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0xe6cf4e80  ! 501: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r19
	.word 0xe6a5e000  ! 502: STWA_I	stwa	%r19, [%r23 + 0x0000] %asi
	.word 0xe0cd44a0  ! 503: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r16
	.word 0xe89c4400  ! 504: LDDA_R	ldda	[%r17, %r0] 0x20, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802025  ! 506: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8c56000  ! 507: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r20
	mov	0x7e0, %r22
	.word 0xe8cd6000  ! 509: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r20
	mov	0x3c0, %r23
	.word 0xeea44400  ! 511: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	.word 0xee95a000  ! 512: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r23
	mov	0x48, %r19
	.word 0xe0f48400  ! 514: STXA_R	stxa	%r16, [%r18 + %r0] 0x20
	ta	T_CHANGE_PRIV	! macro
	mov	0x7e0, %r23
	.word 0xe09da000  ! 517: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r16
	mov	0x58, %r24
	mov	0x60, %r19
	.word 0xe8a5c4a0  ! 520: STWA_R	stwa	%r20, [%r23 + %r0] 0x25
	ta	T_CHANGE_PRIV	! macro
	.word 0xe8c52000  ! 522: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r20
	.word 0xe8b52000  ! 523: STHA_I	stha	%r20, [%r20 + 0x0000] %asi
	.word 0xe8a56000  ! 524: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0x8780204f  ! 525: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x30, %r27
	mov	0x7f0, %r22
	.word 0xe2c78e60  ! 528: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r17
	mov	0x28, %r16
	mov	0x38, %r27
	.word 0x87802020  ! 531: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ac6000  ! 532: STBA_I	stba	%r17, [%r17 + 0x0000] %asi
	.word 0xe2c4a000  ! 533: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r17
	.word 0x87802020  ! 534: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r16
	.word 0xe284a000  ! 536: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r17
	.word 0xe0a544a0  ! 537: STWA_R	stwa	%r16, [%r21 + %r0] 0x25
	.word 0xe2bcc400  ! 538: STDA_R	stda	%r17, [%r19 + %r0] 0x20
	.word 0xe2bce000  ! 539: STDA_I	stda	%r17, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 540: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeacf8e60  ! 541: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r21
	.word 0xeab7a000  ! 542: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 543: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea8fe000  ! 544: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r21
	mov	0x30, %r27
	.word 0x87802025  ! 546: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x38, %r19
	.word 0xe6b78e80  ! 548: STHA_R	stha	%r19, [%r30 + %r0] 0x74
	.word 0xee8c4400  ! 549: LDUBA_R	lduba	[%r17, %r0] 0x20, %r23
	mov	0x8, %r24
	mov	0x50, %r19
	.word 0xeade89e0  ! 552: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r21
	mov	0x78, %r27
	.word 0xee9d84a0  ! 554: LDDA_R	ldda	[%r22, %r0] 0x25, %r23
	.word 0xeedde000  ! 555: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r23
	.word 0xead74e60  ! 556: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r21
	.word 0xeaf5e000  ! 557: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0xe496c9e0  ! 558: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r18
	.word 0xe4ade000  ! 559: STBA_I	stba	%r18, [%r23 + 0x0000] %asi
	.word 0xee844400  ! 560: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r23
	.word 0xeeade000  ! 561: STBA_I	stba	%r23, [%r23 + 0x0000] %asi
	.word 0x87802073  ! 562: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeef7a000  ! 563: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xeecdc4a0  ! 564: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r23
	.word 0xeef72000  ! 565: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x0, %r26
	.word 0xe8df0e80  ! 567: LDXA_R	ldxa	[%r28, %r0] 0x74, %r20
	.word 0x87802020  ! 568: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe894a000  ! 569: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8a42000  ! 570: STWA_I	stwa	%r20, [%r16 + 0x0000] %asi
	.word 0xe4f70e40  ! 571: STXA_R	stxa	%r18, [%r28 + %r0] 0x72
	.word 0xeebf4e80  ! 572: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xee946000  ! 573: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r23
	.word 0xeec42000  ! 574: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r23
	mov	0x30, %r19
	.word 0x87802073  ! 576: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x38, %r27
	mov	0x50, %r25
	.word 0x87802072  ! 579: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r26
	.word 0x87802072  ! 581: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeafe000  ! 582: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	mov	0x7d0, %r21
	.word 0xeed7a000  ! 584: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802074  ! 585: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r24
	.word 0xe296c9e0  ! 587: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r17
	.word 0xec8544a0  ! 588: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r22
	.word 0xecdfa000  ! 589: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r22
	.word 0x87802074  ! 590: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc7a000  ! 591: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0x87802020  ! 592: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdce000  ! 593: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r22
	mov	0x78, %r24
	.word 0x87802020  ! 595: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2bfce40  ! 596: STDA_R	stda	%r17, [%r31 + %r0] 0x72
	mov	0x0, %r17
	.word 0xe8df8e40  ! 598: LDXA_R	ldxa	[%r30, %r0] 0x72, %r20
	mov	0x3e0, %r21
	mov	0x18, %r18
	.word 0xe8bca000  ! 601: STDA_I	stda	%r20, [%r18 + 0x0000] %asi
	.word 0xe8cce000  ! 602: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 603: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0af8e60  ! 604: STBA_R	stba	%r16, [%r30 + %r0] 0x73
	.word 0xe0bf4e40  ! 605: STDA_R	stda	%r16, [%r29 + %r0] 0x72
	.word 0xe0aee000  ! 606: STBA_I	stba	%r16, [%r27 + 0x0000] %asi
	mov	0x38, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe8dc0400  ! 609: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	mov	0x7c8, %r20
	.word 0xe8862000  ! 611: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r20
	.word 0xec8f0e60  ! 612: LDUBA_R	lduba	[%r28, %r0] 0x73, %r22
	.word 0xe6a78e80  ! 613: STWA_R	stwa	%r19, [%r30 + %r0] 0x74
	.word 0xeaf70e80  ! 614: STXA_R	stxa	%r21, [%r28 + %r0] 0x74
	.word 0xeaac0400  ! 615: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	mov	0x3f0, %r23
	.word 0xeac66000  ! 617: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r21
	.word 0xeaf6e000  ! 618: STXA_I	stxa	%r21, [%r27 + 0x0000] %asi
	.word 0xe4878e60  ! 619: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r18
	.word 0xeaf78e40  ! 620: STXA_R	stxa	%r21, [%r30 + %r0] 0x72
	.word 0x87802020  ! 621: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 622: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeaf76000  ! 623: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 624: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeab76000  ! 625: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	.word 0xea97e000  ! 626: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0x87802073  ! 627: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xea9f6000  ! 628: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r21
	mov	0x38, %r18
	mov	0x50, %r25
	.word 0xeaf7e000  ! 631: STXA_I	stxa	%r21, [%r31 + 0x0000] %asi
	.word 0xe4cd04a0  ! 632: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r18
	.word 0xe4cf6000  ! 633: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r18
	.word 0x87802074  ! 634: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x20, %r27
	.word 0xe8af8e40  ! 636: STBA_R	stba	%r20, [%r30 + %r0] 0x72
	mov	0x18, %r27
	.word 0xe0a74e80  ! 638: STWA_R	stwa	%r16, [%r29 + %r0] 0x74
	.word 0xe08f0e80  ! 639: LDUBA_R	lduba	[%r28, %r0] 0x74, %r16
	.word 0xe0df0e80  ! 640: LDXA_R	ldxa	[%r28, %r0] 0x74, %r16
	mov	0x30, %r24
	.word 0xe0af2000  ! 642: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 643: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 644: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 645: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 646: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0f72000  ! 647: STXA_I	stxa	%r16, [%r28 + 0x0000] %asi
	.word 0xe2af4e40  ! 648: STBA_R	stba	%r17, [%r29 + %r0] 0x72
	.word 0xe297a000  ! 649: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r17
	.word 0xeac7ce40  ! 650: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r21
	mov	0x60, %r18
	.word 0xea976000  ! 652: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xe09c0400  ! 653: LDDA_R	ldda	[%r16, %r0] 0x20, %r16
	.word 0xe8940400  ! 654: LDUHA_R	lduha	[%r16, %r0] 0x20, %r20
	mov	0x3e8, %r21
	.word 0xe8972000  ! 656: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0xe8ac4400  ! 657: STBA_R	stba	%r20, [%r17 + %r0] 0x20
	.word 0xeaa78e40  ! 658: STWA_R	stwa	%r21, [%r30 + %r0] 0x72
	mov	0x7e8, %r21
	.word 0xe8dd84a0  ! 660: LDXA_R	ldxa	[%r22, %r0] 0x25, %r20
	mov	0x48, %r26
	mov	0x7d0, %r21
	.word 0xe4bc0400  ! 663: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	.word 0xe48fa000  ! 664: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xeadc4400  ! 665: LDXA_R	ldxa	[%r17, %r0] 0x20, %r21
	.word 0xeac7a000  ! 666: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	mov	0x20, %r27
	mov	0x7e0, %r20
	.word 0xea940400  ! 669: LDUHA_R	lduha	[%r16, %r0] 0x20, %r21
	.word 0xeacf6000  ! 670: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r21
	.word 0xeab76000  ! 671: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x7c0, %r22
	.word 0xe2940400  ! 673: LDUHA_R	lduha	[%r16, %r0] 0x20, %r17
	mov	0x3c0, %r23
	.word 0xe2df6000  ! 675: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r17
	.word 0xecf4c400  ! 676: STXA_R	stxa	%r22, [%r19 + %r0] 0x20
	.word 0xecdf2000  ! 677: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	mov	0x50, %r26
	.word 0xecbf2000  ! 679: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	mov	0x3c0, %r23
	mov	0x8, %r26
	.word 0xeacec9e0  ! 682: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r21
	.word 0xea9f6000  ! 683: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r21
	mov	0x40, %r26
	.word 0xeacfa000  ! 685: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r21
	.word 0xe2af0e60  ! 686: STBA_R	stba	%r17, [%r28 + %r0] 0x73
	.word 0x87802020  ! 687: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d4a000  ! 688: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r17
	.word 0xe28ce000  ! 689: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r17
	.word 0xe2b46000  ! 690: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	mov	0x0, %r18
	.word 0xe2842000  ! 692: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r17
	.word 0xe2f42000  ! 693: STXA_I	stxa	%r17, [%r16 + 0x0000] %asi
	.word 0xe2a4a000  ! 694: STWA_I	stwa	%r17, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 695: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2a52000  ! 696: STWA_I	stwa	%r17, [%r20 + 0x0000] %asi
	mov	0x7e8, %r22
	.word 0xe29d2000  ! 698: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r17
	.word 0xe2dde000  ! 699: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r17
	.word 0xe8cc4400  ! 700: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	.word 0xe8d5a000  ! 701: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r20
	.word 0xe69dc4a0  ! 702: LDDA_R	ldda	[%r23, %r0] 0x25, %r19
	ta	T_CHANGE_HPRIV	! macro
	mov	0x58, %r17
	mov	0x3f0, %r23
	.word 0xe0acc400  ! 706: STBA_R	stba	%r16, [%r19 + %r0] 0x20
	mov	0x3c8, %r21
	.word 0xe0dd6000  ! 708: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r16
	.word 0xe0ada000  ! 709: STBA_I	stba	%r16, [%r22 + 0x0000] %asi
	.word 0xee878e80  ! 710: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r23
	.word 0xe8df0e80  ! 711: LDXA_R	ldxa	[%r28, %r0] 0x74, %r20
	.word 0xe8c5a000  ! 712: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r20
	mov	0x28, %r19
	.word 0xeabf4e60  ! 714: STDA_R	stda	%r21, [%r29 + %r0] 0x73
	.word 0x8780204f  ! 715: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab6a000  ! 716: STHA_I	stha	%r21, [%r26 + 0x0000] %asi
	.word 0xe29d84a0  ! 717: LDDA_R	ldda	[%r22, %r0] 0x25, %r17
	.word 0x87802020  ! 718: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 719: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2a62000  ! 720: STWA_I	stwa	%r17, [%r24 + 0x0000] %asi
	.word 0xe2c66000  ! 721: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r17
	.word 0xe28fce80  ! 722: LDUBA_R	lduba	[%r31, %r0] 0x74, %r17
	.word 0xe2c6e000  ! 723: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r17
	.word 0xeed48400  ! 724: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r23
	.word 0x87802020  ! 725: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 726: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeea7a000  ! 727: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	mov	0x48, %r24
	mov	0x48, %r18
	mov	0x48, %r26
	mov	0x7f8, %r23
	.word 0xe0944400  ! 732: LDUHA_R	lduha	[%r17, %r0] 0x20, %r16
	.word 0xee878e60  ! 733: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r23
	.word 0x87802020  ! 734: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 735: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea62000  ! 736: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	mov	0x3e8, %r23
	mov	0x7d0, %r22
	.word 0x87802073  ! 739: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 740: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x40, %r17
	.word 0xeeb42000  ! 742: STHA_I	stha	%r23, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 743: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea7a000  ! 744: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	.word 0xeedf6000  ! 745: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	mov	0x3e0, %r23
	mov	0x68, %r27
	.word 0xe2c40400  ! 748: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r17
	mov	0x3f0, %r21
	mov	0x3e8, %r22
	.word 0xe6f74e40  ! 751: STXA_R	stxa	%r19, [%r29 + %r0] 0x72
	mov	0x18, %r26
	.word 0x87802020  ! 753: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f4a000  ! 754: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	mov	0x60, %r18
	.word 0x8780204f  ! 756: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6d66000  ! 757: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r19
	.word 0x87802020  ! 758: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ac6000  ! 759: STBA_I	stba	%r19, [%r17 + 0x0000] %asi
	.word 0xe68ca000  ! 760: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r19
	.word 0xe6a46000  ! 761: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	mov	0x28, %r24
	.word 0xeef6c9e0  ! 763: STXA_R	stxa	%r23, [%r27 + %r0] 0x4f
	mov	0x7e8, %r21
	.word 0xeeac6000  ! 765: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0xee97ce80  ! 766: LDUHA_R	lduha	[%r31, %r0] 0x74, %r23
	.word 0x87802020  ! 767: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee870e40  ! 768: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r23
	mov	0x3f8, %r22
	mov	0x8, %r24
	mov	0x30, %r17
	.word 0xe8b44400  ! 772: STHA_R	stha	%r20, [%r17 + %r0] 0x20
	.word 0x87802074  ! 773: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x30, %r18
	.word 0xe8b7a000  ! 775: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	.word 0xe8978e40  ! 776: LDUHA_R	lduha	[%r30, %r0] 0x72, %r20
	.word 0xeaf7ce40  ! 777: STXA_R	stxa	%r21, [%r31 + %r0] 0x72
	.word 0x87802073  ! 778: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecac8400  ! 779: STBA_R	stba	%r22, [%r18 + %r0] 0x20
	.word 0xeca76000  ! 780: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xec9f6000  ! 781: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r22
	mov	0x3f8, %r23
	.word 0xecbfa000  ! 783: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeccfa000  ! 784: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r22
	.word 0xecf7a000  ! 785: STXA_I	stxa	%r22, [%r30 + 0x0000] %asi
	.word 0xe8c40400  ! 786: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r20
	.word 0xe8a76000  ! 787: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xe2c7ce60  ! 788: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r17
	mov	0x3e0, %r23
	.word 0xee948400  ! 790: LDUHA_R	lduha	[%r18, %r0] 0x20, %r23
	.word 0xe89c0400  ! 791: LDDA_R	ldda	[%r16, %r0] 0x20, %r20
	.word 0x87802025  ! 792: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6944400  ! 793: LDUHA_R	lduha	[%r17, %r0] 0x20, %r19
	.word 0xe6cde000  ! 794: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	mov	0x0, %r19
	.word 0xe8af8e40  ! 796: STBA_R	stba	%r20, [%r30 + %r0] 0x72
	mov	0x7c8, %r22
	.word 0xe8bf4e80  ! 798: STDA_R	stda	%r20, [%r29 + %r0] 0x74
	.word 0x8780204f  ! 799: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x28, %r24
	.word 0xe8b6e000  ! 801: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xe2bcc400  ! 802: STDA_R	stda	%r17, [%r19 + %r0] 0x20
	.word 0xe2d6e000  ! 803: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	.word 0xe2de2000  ! 804: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r17
	.word 0xe2d62000  ! 805: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r17
	mov	0x50, %r24
	.word 0xe6dc0400  ! 807: LDXA_R	ldxa	[%r16, %r0] 0x20, %r19
	.word 0xe6a6c9e0  ! 808: STWA_R	stwa	%r19, [%r27 + %r0] 0x4f
	.word 0xeaa7ce60  ! 809: STWA_R	stwa	%r21, [%r31 + %r0] 0x73
	.word 0xeabc8400  ! 810: STDA_R	stda	%r21, [%r18 + %r0] 0x20
	.word 0xeab6e000  ! 811: STHA_I	stha	%r21, [%r27 + 0x0000] %asi
	mov	0x7f8, %r22
	.word 0xeaa66000  ! 813: STWA_I	stwa	%r21, [%r25 + 0x0000] %asi
	.word 0xead66000  ! 814: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r21
	.word 0xea9e89e0  ! 815: LDDA_R	ldda	[%r26, %r0] 0x4f, %r21
	.word 0xeed4c400  ! 816: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r23
	.word 0xe6f70e80  ! 817: STXA_R	stxa	%r19, [%r28 + %r0] 0x74
	.word 0xeab44400  ! 818: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	mov	0x68, %r19
	.word 0x87802072  ! 820: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea9f2000  ! 821: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	mov	0x38, %r24
	mov	0x48, %r25
	.word 0x87802020  ! 824: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xead4e000  ! 825: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r21
	.word 0xeaf42000  ! 826: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 827: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8bfce40  ! 828: STDA_R	stda	%r20, [%r31 + %r0] 0x72
	mov	0x3f0, %r22
	.word 0xe897a000  ! 830: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	mov	0x20, %r25
	.word 0xe8c72000  ! 832: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xe897e000  ! 833: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe8c72000  ! 834: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xeabc8400  ! 835: STDA_R	stda	%r21, [%r18 + %r0] 0x20
	mov	0x68, %r25
	.word 0xe0970e60  ! 837: LDUHA_R	lduha	[%r28, %r0] 0x73, %r16
	.word 0xea844400  ! 838: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r21
	.word 0xea8fa000  ! 839: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	mov	0x30, %r24
	.word 0xeab7e000  ! 841: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x78, %r27
	mov	0x3d0, %r23
	.word 0x87802073  ! 844: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2cf4e80  ! 845: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r17
	.word 0xe2afa000  ! 846: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe2cec9e0  ! 847: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r17
	.word 0xe2a7e000  ! 848: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 849: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x50, %r18
	mov	0x28, %r19
	.word 0xe2bf2000  ! 852: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe2d7a000  ! 853: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe2d7a000  ! 854: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe0c40400  ! 855: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r16
	mov	0x8, %r18
	.word 0x87802020  ! 857: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe09ce000  ! 858: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r16
	.word 0xeef40400  ! 859: STXA_R	stxa	%r23, [%r16 + %r0] 0x20
	.word 0xeef46000  ! 860: STXA_I	stxa	%r23, [%r17 + 0x0000] %asi
	.word 0xeea4a000  ! 861: STWA_I	stwa	%r23, [%r18 + 0x0000] %asi
	.word 0x8780204f  ! 862: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r27
	.word 0x87802025  ! 864: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea9ec9e0  ! 865: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	mov	0x38, %r17
	.word 0x87802025  ! 867: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 868: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4cdc4a0  ! 869: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r18
	.word 0xe4a4e000  ! 870: STWA_I	stwa	%r18, [%r19 + 0x0000] %asi
	mov	0x30, %r26
	mov	0x78, %r25
	mov	0x70, %r18
	.word 0xeea44400  ! 874: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	mov	0x18, %r25
	.word 0xeecf0e40  ! 876: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r23
	.word 0x87802072  ! 877: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeb72000  ! 878: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xeec7a000  ! 879: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r23
	.word 0xee972000  ! 880: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	.word 0xe4f4c400  ! 881: STXA_R	stxa	%r18, [%r19 + %r0] 0x20
	.word 0xeab74e40  ! 882: STHA_R	stha	%r21, [%r29 + %r0] 0x72
	.word 0xecb689e0  ! 883: STHA_R	stha	%r22, [%r26 + %r0] 0x4f
	.word 0xe0bf4e80  ! 884: STDA_R	stda	%r16, [%r29 + %r0] 0x74
	.word 0xe0a7a000  ! 885: STWA_I	stwa	%r16, [%r30 + 0x0000] %asi
	.word 0xeebc0400  ! 886: STDA_R	stda	%r23, [%r16 + %r0] 0x20
	.word 0xeeaf2000  ! 887: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 888: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 889: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0b70e80  ! 890: STHA_R	stha	%r16, [%r28 + %r0] 0x74
	.word 0xe4a44400  ! 891: STWA_R	stwa	%r18, [%r17 + %r0] 0x20
	.word 0xe2840400  ! 892: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r17
	mov	0x7e0, %r21
	.word 0x87802025  ! 894: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2c56000  ! 895: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r17
	.word 0xeeaf0e80  ! 896: STBA_R	stba	%r23, [%r28 + %r0] 0x74
	.word 0xeed5a000  ! 897: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	mov	0x7f8, %r20
	.word 0xe0df4e80  ! 899: LDXA_R	ldxa	[%r29, %r0] 0x74, %r16
	mov	0x0, %r17
	.word 0xe8bd44a0  ! 901: STDA_R	stda	%r20, [%r21 + %r0] 0x25
	.word 0xe8be09e0  ! 902: STDA_R	stda	%r20, [%r24 + %r0] 0x4f
	mov	0x3c0, %r22
	mov	0x30, %r27
	.word 0xeabc0400  ! 905: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0x87802020  ! 906: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab42000  ! 907: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x18, %r27
	mov	0x50, %r24
	.word 0x87802074  ! 910: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7f8, %r22
	.word 0x87802072  ! 912: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09e89e0  ! 913: LDDA_R	ldda	[%r26, %r0] 0x4f, %r16
	mov	0x0, %r25
	.word 0xe0cfa000  ! 915: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r16
	.word 0xe0b7a000  ! 916: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	mov	0x30, %r27
	.word 0xe0b7a000  ! 918: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xea878e60  ! 919: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r21
	.word 0xea8f2000  ! 920: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r21
	.word 0xe8bcc400  ! 921: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	mov	0x3e0, %r20
	.word 0xe8dfa000  ! 923: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0xe8a76000  ! 924: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 925: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeccf0e80  ! 926: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r22
	.word 0xecaea000  ! 927: STBA_I	stba	%r22, [%r26 + 0x0000] %asi
	.word 0xec8e6000  ! 928: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r22
	.word 0xeca62000  ! 929: STWA_I	stwa	%r22, [%r24 + 0x0000] %asi
	.word 0xecde6000  ! 930: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r22
	.word 0xeca6a000  ! 931: STWA_I	stwa	%r22, [%r26 + 0x0000] %asi
	.word 0xecdd84a0  ! 932: LDXA_R	ldxa	[%r22, %r0] 0x25, %r22
	.word 0xecd4c400  ! 933: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	.word 0xe2b44400  ! 934: STHA_R	stha	%r17, [%r17 + %r0] 0x20
	mov	0x3c0, %r22
	.word 0xe8adc4a0  ! 936: STBA_R	stba	%r20, [%r23 + %r0] 0x25
	.word 0xec9cc400  ! 937: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	mov	0x40, %r19
	.word 0xe8b4c400  ! 939: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe8b6a000  ! 940: STHA_I	stha	%r20, [%r26 + 0x0000] %asi
	.word 0xe886e000  ! 941: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r20
	mov	0x7f8, %r21
	mov	0x3f8, %r20
	.word 0xe8aea000  ! 944: STBA_I	stba	%r20, [%r26 + 0x0000] %asi
	.word 0xe0de09e0  ! 945: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r16
	.word 0xe08e6000  ! 946: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r16
	mov	0x58, %r24
	.word 0xe6cc8400  ! 948: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r19
	mov	0x68, %r17
	.word 0xe6f62000  ! 950: STXA_I	stxa	%r19, [%r24 + 0x0000] %asi
	.word 0xe6be6000  ! 951: STDA_I	stda	%r19, [%r25 + 0x0000] %asi
	.word 0xec8dc4a0  ! 952: LDUBA_R	lduba	[%r23, %r0] 0x25, %r22
	mov	0x20, %r26
	mov	0x3e8, %r20
	.word 0xec8e2000  ! 955: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r22
	mov	0x60, %r16
	.word 0x87802020  ! 957: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x60, %r25
	.word 0x87802020  ! 959: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r16
	.word 0xe6acc400  ! 961: STBA_R	stba	%r19, [%r19 + %r0] 0x20
	.word 0xe6c4a000  ! 962: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r19
	.word 0xeeaf4e40  ! 963: STBA_R	stba	%r23, [%r29 + %r0] 0x72
	.word 0xe48d84a0  ! 964: LDUBA_R	lduba	[%r22, %r0] 0x25, %r18
	.word 0xe4a46000  ! 965: STWA_I	stwa	%r18, [%r17 + 0x0000] %asi
	.word 0xee840400  ! 966: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r23
	mov	0x50, %r27
	.word 0xe287ce80  ! 968: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r17
	mov	0x7e0, %r20
	.word 0xe8bcc400  ! 970: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	mov	0x78, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xecde49e0  ! 973: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r22
	mov	0x48, %r27
	mov	0x3f8, %r23
	.word 0xecf4a000  ! 976: STXA_I	stxa	%r22, [%r18 + 0x0000] %asi
	.word 0xe6d7ce40  ! 977: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r19
	.word 0x87802025  ! 978: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8a4c400  ! 979: STWA_R	stwa	%r20, [%r19 + %r0] 0x20
	.word 0xeab74e80  ! 980: STHA_R	stha	%r21, [%r29 + %r0] 0x74
	.word 0xea9da000  ! 981: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	.word 0xea85e000  ! 982: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r21
	.word 0xe48ec9e0  ! 983: LDUBA_R	lduba	[%r27, %r0] 0x4f, %r18
	.word 0x87802020  ! 984: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r26
	.word 0xec9cc400  ! 986: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	mov	0x40, %r27
	.word 0xecaca000  ! 988: STBA_I	stba	%r22, [%r18 + 0x0000] %asi
	mov	0x48, %r27
	.word 0x8780204f  ! 990: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea9c0400  ! 991: LDDA_R	ldda	[%r16, %r0] 0x20, %r21
	.word 0xeace6000  ! 992: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r21
	.word 0xeaf62000  ! 993: STXA_I	stxa	%r21, [%r24 + 0x0000] %asi
	mov	0x78, %r27
	.word 0xeace2000  ! 995: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r21
	.word 0x87802072  ! 996: WRASI_I	wr	%r0, 0x0072, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeadf8e80  ! 998: LDXA_R	ldxa	[%r30, %r0] 0x74, %r21
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	mov	0x3f8, %r21
	.word 0xeab504a0  ! 1: STHA_R	stha	%r21, [%r20 + %r0] 0x25
	.word 0x87802020  ! 2: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x70, %r16
	.word 0xe8be49e0  ! 4: STDA_R	stda	%r20, [%r25 + %r0] 0x4f
	.word 0xe69d04a0  ! 5: LDDA_R	ldda	[%r20, %r0] 0x25, %r19
	.word 0x87802074  ! 6: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2b72000  ! 7: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe6f78e60  ! 8: STXA_R	stxa	%r19, [%r30 + %r0] 0x73
	.word 0xe6a44400  ! 9: STWA_R	stwa	%r19, [%r17 + %r0] 0x20
	.word 0xe6c7e000  ! 10: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0xeedf4e60  ! 11: LDXA_R	ldxa	[%r29, %r0] 0x73, %r23
	.word 0xeab72000  ! 12: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	mov	0x50, %r24
	.word 0xe8bc0400  ! 14: STDA_R	stda	%r20, [%r16 + %r0] 0x20
	mov	0x58, %r18
	.word 0x87802073  ! 16: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe89504a0  ! 17: LDUHA_R	lduha	[%r20, %r0] 0x25, %r20
	.word 0xe8c544a0  ! 18: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r20
	mov	0x7c8, %r22
	.word 0xe4872000  ! 20: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0xe4dfa000  ! 21: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4cfe000  ! 22: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r18
	.word 0xe4a76000  ! 23: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	mov	0x78, %r26
	mov	0x28, %r17
	.word 0xe4dd44a0  ! 26: LDXA_R	ldxa	[%r21, %r0] 0x25, %r18
	.word 0xe8afa000  ! 27: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe8af6000  ! 28: STBA_I	stba	%r20, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 29: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe085c4a0  ! 30: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r16
	.word 0xe4c584a0  ! 31: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r18
	.word 0xe8b72000  ! 32: STHA_I	stha	%r20, [%r28 + 0x0000] %asi
	.word 0xe8a7e000  ! 33: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	mov	0x60, %r19
	mov	0x70, %r27
	.word 0x8780204f  ! 36: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8cee000  ! 37: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r20
	.word 0xe2b7ce60  ! 38: STHA_R	stha	%r17, [%r31 + %r0] 0x73
	.word 0x87802025  ! 39: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeedf8e80  ! 40: LDXA_R	ldxa	[%r30, %r0] 0x74, %r23
	mov	0x3f8, %r20
	.word 0xec9fce60  ! 42: LDDA_R	ldda	[%r31, %r0] 0x73, %r22
	.word 0x87802025  ! 43: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeef6a000  ! 44: STXA_I	stxa	%r23, [%r26 + 0x0000] %asi
	.word 0xe8bf4e80  ! 45: STDA_R	stda	%r20, [%r29 + %r0] 0x74
	.word 0xeece2000  ! 46: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r23
	.word 0x87802074  ! 47: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 48: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xea86c9e0  ! 49: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r21
	mov	0x7f8, %r20
	.word 0xe4b584a0  ! 51: STHA_R	stha	%r18, [%r22 + %r0] 0x25
	mov	0x8, %r16
	.word 0xeeb649e0  ! 53: STHA_R	stha	%r23, [%r25 + %r0] 0x4f
	.word 0x87802074  ! 54: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0d44400  ! 55: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r16
	.word 0x87802020  ! 56: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec9c8400  ! 57: LDDA_R	ldda	[%r18, %r0] 0x20, %r22
	.word 0x87802020  ! 58: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bea000  ! 60: STDA_I	stda	%r16, [%r26 + 0x0000] %asi
	.word 0xe2f40400  ! 61: STXA_R	stxa	%r17, [%r16 + %r0] 0x20
	.word 0xeccdc4a0  ! 62: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r22
	.word 0xe0878e40  ! 63: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r16
	mov	0x38, %r24
	mov	0x48, %r19
	mov	0x3d8, %r22
	.word 0xe8cee000  ! 67: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r20
	.word 0xe88e6000  ! 68: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r20
	.word 0x87802020  ! 69: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 70: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 71: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe88ce000  ! 72: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0x87802073  ! 73: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 74: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8962000  ! 75: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r20
	mov	0x18, %r17
	mov	0x7e0, %r21
	.word 0x87802025  ! 78: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x30, %r25
	.word 0xe8f6a000  ! 80: STXA_I	stxa	%r20, [%r26 + 0x0000] %asi
	.word 0xe6ad44a0  ! 81: STBA_R	stba	%r19, [%r21 + %r0] 0x25
	.word 0xe8d7ce60  ! 82: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r20
	.word 0x87802020  ! 83: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 84: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecbe6000  ! 85: STDA_I	stda	%r22, [%r25 + 0x0000] %asi
	.word 0x87802074  ! 86: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc7e000  ! 87: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	mov	0x8, %r27
	.word 0xecbfa000  ! 89: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeca649e0  ! 90: STWA_R	stwa	%r22, [%r25 + %r0] 0x4f
	mov	0x3c0, %r21
	.word 0xe4b7e000  ! 92: STHA_I	stha	%r18, [%r31 + 0x0000] %asi
	.word 0xeccfce60  ! 93: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r22
	.word 0xeaf7e000  ! 94: STXA_I	stxa	%r21, [%r31 + 0x0000] %asi
	.word 0xeab7a000  ! 95: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	mov	0x30, %r18
	.word 0xeaf72000  ! 97: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xeaafa000  ! 98: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xeab76000  ! 99: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x70, %r18
	.word 0xead7a000  ! 101: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	mov	0x7d0, %r22
	mov	0x60, %r16
	mov	0x7f8, %r23
	.word 0xeadcc400  ! 105: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	mov	0x18, %r25
	mov	0x3f0, %r22
	mov	0x48, %r17
	.word 0xe2840400  ! 109: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r17
	mov	0x0, %r25
	.word 0xe4b7a000  ! 111: STHA_I	stha	%r18, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 112: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r17
	.word 0xeef48400  ! 114: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0xeebdc4a0  ! 115: STDA_R	stda	%r23, [%r23 + %r0] 0x25
	.word 0xe69fa000  ! 116: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r19
	mov	0x7e8, %r21
	.word 0xe0f6c9e0  ! 118: STXA_R	stxa	%r16, [%r27 + %r0] 0x4f
	.word 0xe0ae09e0  ! 119: STBA_R	stba	%r16, [%r24 + %r0] 0x4f
	mov	0x8, %r17
	.word 0xe6876000  ! 121: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6afa000  ! 122: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 123: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x28, %r25
	mov	0x3c0, %r23
	.word 0xe6a72000  ! 126: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	.word 0xe4848400  ! 127: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r18
	.word 0xe6b7e000  ! 128: STHA_I	stha	%r19, [%r31 + 0x0000] %asi
	.word 0xe8be89e0  ! 129: STDA_R	stda	%r20, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 130: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x70, %r26
	mov	0x7d8, %r22
	.word 0xeeaf0e80  ! 133: STBA_R	stba	%r23, [%r28 + %r0] 0x74
	.word 0xe2c76000  ! 134: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0x87802025  ! 135: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 136: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2bf2000  ! 137: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	mov	0x3d0, %r21
	.word 0x87802020  ! 139: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee9e89e0  ! 140: LDDA_R	ldda	[%r26, %r0] 0x4f, %r23
	.word 0xea9de000  ! 141: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r21
	.word 0xe8ce89e0  ! 142: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r20
	.word 0xea9d6000  ! 143: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	.word 0xeadd6000  ! 144: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r21
	mov	0x18, %r17
	mov	0x7e0, %r23
	.word 0xea8da000  ! 147: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r21
	.word 0xeaa52000  ! 148: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xeaf5e000  ! 149: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0xeacde000  ! 150: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0xeaade000  ! 151: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	.word 0xeabd2000  ! 152: STDA_I	stda	%r21, [%r20 + 0x0000] %asi
	mov	0x0, %r17
	.word 0xe2870e80  ! 154: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r17
	.word 0xe0f78e40  ! 155: STXA_R	stxa	%r16, [%r30 + %r0] 0x72
	.word 0xe6cde000  ! 156: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	mov	0x8, %r27
	.word 0xe685e000  ! 158: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r19
	.word 0xe69d2000  ! 159: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r19
	mov	0x70, %r24
	.word 0xe6c56000  ! 161: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r19
	mov	0x3d0, %r23
	mov	0x3f8, %r21
	.word 0xe6ada000  ! 164: STBA_I	stba	%r19, [%r22 + 0x0000] %asi
	.word 0xe8cc8400  ! 165: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r20
	.word 0xea9f0e60  ! 166: LDDA_R	ldda	[%r28, %r0] 0x73, %r21
	mov	0x3e0, %r22
	.word 0xe6b5e000  ! 168: STHA_I	stha	%r19, [%r23 + 0x0000] %asi
	.word 0xe8a7ce60  ! 169: STWA_R	stwa	%r20, [%r31 + %r0] 0x73
	.word 0xe4bcc400  ! 170: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	.word 0xea9d2000  ! 171: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r21
	.word 0x87802020  ! 172: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x58, %r16
	.word 0xeabda000  ! 174: STDA_I	stda	%r21, [%r22 + 0x0000] %asi
	.word 0xec97ce80  ! 175: LDUHA_R	lduha	[%r31, %r0] 0x74, %r22
	mov	0x18, %r25
	mov	0x70, %r26
	.word 0xe68d2000  ! 178: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r19
	.word 0xe68d6000  ! 179: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe695a000  ! 180: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r19
	.word 0xeabfce80  ! 181: STDA_R	stda	%r21, [%r31 + %r0] 0x74
	.word 0xeeae09e0  ! 182: STBA_R	stba	%r23, [%r24 + %r0] 0x4f
	.word 0xeebdc4a0  ! 183: STDA_R	stda	%r23, [%r23 + %r0] 0x25
	.word 0xe2b52000  ! 184: STHA_I	stha	%r17, [%r20 + 0x0000] %asi
	.word 0xe2b56000  ! 185: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	mov	0x60, %r27
	.word 0xeedc0400  ! 187: LDXA_R	ldxa	[%r16, %r0] 0x20, %r23
	.word 0xe4cd6000  ! 188: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r18
	mov	0x18, %r16
	mov	0x10, %r19
	.word 0x87802074  ! 191: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8a44400  ! 192: STWA_R	stwa	%r20, [%r17 + %r0] 0x20
	.word 0xe6df4e60  ! 193: LDXA_R	ldxa	[%r29, %r0] 0x73, %r19
	.word 0xe4a7ce80  ! 194: STWA_R	stwa	%r18, [%r31 + %r0] 0x74
	.word 0xe0870e60  ! 195: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r16
	.word 0xe8a7ce40  ! 196: STWA_R	stwa	%r20, [%r31 + %r0] 0x72
	.word 0xe2b504a0  ! 197: STHA_R	stha	%r17, [%r20 + %r0] 0x25
	.word 0xeeb42000  ! 198: STHA_I	stha	%r23, [%r16 + 0x0000] %asi
	.word 0xeec4e000  ! 199: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r23
	.word 0xeedc6000  ! 200: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r23
	.word 0x87802073  ! 201: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x28, %r19
	mov	0x7e8, %r22
	mov	0x60, %r27
	.word 0xeeb7e000  ! 205: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	.word 0xeeb76000  ! 206: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xeeafe000  ! 208: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0xeea7a000  ! 209: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	mov	0x0, %r24
	.word 0xeebf2000  ! 211: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 212: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeedf6000  ! 213: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	mov	0x30, %r26
	.word 0xe48f8e60  ! 215: LDUBA_R	lduba	[%r30, %r0] 0x73, %r18
	mov	0x18, %r17
	.word 0xe29c4400  ! 217: LDDA_R	ldda	[%r17, %r0] 0x20, %r17
	.word 0xeca74e60  ! 218: STWA_R	stwa	%r22, [%r29 + %r0] 0x73
	.word 0xe2876000  ! 219: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	mov	0x48, %r19
	mov	0x7e8, %r23
	.word 0xe2a7a000  ! 222: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	mov	0x8, %r24
	.word 0xe8bf0e80  ! 224: STDA_R	stda	%r20, [%r28 + %r0] 0x74
	mov	0x3c0, %r23
	.word 0xe49c8400  ! 226: LDDA_R	ldda	[%r18, %r0] 0x20, %r18
	.word 0x87802073  ! 227: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe28e2000  ! 228: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r17
	.word 0x87802025  ! 229: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2afa000  ! 230: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe29f6000  ! 231: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r17
	mov	0x60, %r19
	mov	0x3e8, %r22
	.word 0xe2bf2000  ! 234: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 235: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 236: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4b544a0  ! 237: STHA_R	stha	%r18, [%r21 + %r0] 0x25
	mov	0x3d8, %r22
	mov	0x28, %r24
	.word 0xe2f76000  ! 240: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 241: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b42000  ! 242: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	.word 0xe2b4a000  ! 243: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0xe2b42000  ! 244: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	.word 0xe2dce000  ! 245: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r17
	.word 0xe2dce000  ! 246: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r17
	.word 0xe6f4c400  ! 247: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	.word 0xeca4a000  ! 248: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0xeca4a000  ! 249: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0xecac6000  ! 250: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xeed7ce80  ! 251: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r23
	.word 0xea94a000  ! 252: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r21
	mov	0x7f8, %r22
	.word 0xea9ce000  ! 254: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r21
	.word 0xeab4e000  ! 255: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xeaf78e40  ! 256: STXA_R	stxa	%r21, [%r30 + %r0] 0x72
	.word 0xe6af8e60  ! 257: STBA_R	stba	%r19, [%r30 + %r0] 0x73
	.word 0xecace000  ! 258: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xeabf0e60  ! 259: STDA_R	stda	%r21, [%r28 + %r0] 0x73
	.word 0x87802020  ! 260: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebe49e0  ! 261: STDA_R	stda	%r23, [%r25 + %r0] 0x4f
	mov	0x3d0, %r23
	.word 0xe4b4e000  ! 263: STHA_I	stha	%r18, [%r19 + 0x0000] %asi
	.word 0xe4942000  ! 264: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r18
	.word 0x87802074  ! 265: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8c74e40  ! 266: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r20
	.word 0xe89ca000  ! 267: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r20
	.word 0x87802020  ! 268: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 269: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8d76000  ! 270: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r20
	.word 0xe88f0e60  ! 271: LDUBA_R	lduba	[%r28, %r0] 0x73, %r20
	.word 0xe2a7e000  ! 272: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0xe6f689e0  ! 273: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0xe0f48400  ! 274: STXA_R	stxa	%r16, [%r18 + %r0] 0x20
	.word 0x87802073  ! 275: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecc78e60  ! 276: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r22
	.word 0xeeb70e40  ! 277: STHA_R	stha	%r23, [%r28 + %r0] 0x72
	.word 0xeea76000  ! 278: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xe8cfce40  ! 279: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r20
	.word 0xe8ad04a0  ! 280: STBA_R	stba	%r20, [%r20 + %r0] 0x25
	.word 0xe2bd04a0  ! 281: STDA_R	stda	%r17, [%r20 + %r0] 0x25
	mov	0x70, %r25
	.word 0xe0cf8e60  ! 283: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r16
	.word 0xecaf2000  ! 284: STBA_I	stba	%r22, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 285: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 286: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8f44400  ! 287: STXA_R	stxa	%r20, [%r17 + %r0] 0x20
	.word 0x8780204f  ! 288: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b40400  ! 289: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0xe68ca000  ! 290: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r19
	.word 0xe6f46000  ! 291: STXA_I	stxa	%r19, [%r17 + 0x0000] %asi
	.word 0x8780204f  ! 292: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6dee000  ! 293: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r19
	.word 0xe2a74e40  ! 294: STWA_R	stwa	%r17, [%r29 + %r0] 0x72
	.word 0x87802074  ! 295: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8be6000  ! 296: STDA_I	stda	%r20, [%r25 + 0x0000] %asi
	.word 0xe8de6000  ! 297: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r20
	mov	0x60, %r19
	mov	0x7e0, %r21
	.word 0x87802074  ! 300: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x20, %r18
	mov	0x7e8, %r22
	.word 0x8780204f  ! 303: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 304: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6df4e40  ! 305: LDXA_R	ldxa	[%r29, %r0] 0x72, %r19
	mov	0x20, %r25
	.word 0xecdc2000  ! 307: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r22
	.word 0xecdc6000  ! 308: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r22
	.word 0x87802072  ! 309: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeecc4400  ! 310: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r23
	.word 0xe6bea000  ! 311: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	.word 0xe6a6e000  ! 312: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0xe69e6000  ! 313: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r19
	.word 0xe6a6e000  ! 314: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0xe0af0e80  ! 315: STBA_R	stba	%r16, [%r28 + %r0] 0x74
	.word 0xe8f66000  ! 316: STXA_I	stxa	%r20, [%r25 + 0x0000] %asi
	.word 0xe8f62000  ! 317: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	mov	0x70, %r16
	.word 0xe0b649e0  ! 319: STHA_R	stha	%r16, [%r25 + %r0] 0x4f
	mov	0x7f8, %r20
	.word 0x87802072  ! 321: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8bc8400  ! 322: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	mov	0x58, %r27
	.word 0xe0af6000  ! 324: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xecc78e80  ! 325: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r22
	.word 0x87802020  ! 326: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r27
	mov	0x60, %r16
	.word 0xe0cd44a0  ! 329: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r16
	.word 0xe0a76000  ! 330: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	mov	0x40, %r24
	.word 0xe6adc4a0  ! 332: STBA_R	stba	%r19, [%r23 + %r0] 0x25
	.word 0xe2d7a000  ! 333: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 334: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x0, %r19
	.word 0xecf689e0  ! 336: STXA_R	stxa	%r22, [%r26 + %r0] 0x4f
	.word 0xec9609e0  ! 337: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r22
	.word 0xe09f8e40  ! 338: LDDA_R	ldda	[%r30, %r0] 0x72, %r16
	.word 0xe68de000  ! 339: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r19
	.word 0xe6856000  ! 340: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r19
	.word 0xe6d5a000  ! 341: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r19
	.word 0x87802020  ! 342: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe694e000  ! 343: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r19
	mov	0x3e0, %r21
	mov	0x78, %r16
	.word 0xe6a46000  ! 346: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	.word 0x87802025  ! 347: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3d0, %r20
	.word 0xe6bf6000  ! 349: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xe6cfe000  ! 350: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 351: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 352: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x48, %r26
	.word 0x87802025  ! 354: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6872000  ! 355: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6bfe000  ! 356: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0xe4df0e60  ! 357: LDXA_R	ldxa	[%r28, %r0] 0x73, %r18
	.word 0xeef78e40  ! 358: STXA_R	stxa	%r23, [%r30 + %r0] 0x72
	.word 0xecb7a000  ! 359: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xe0bcc400  ! 360: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	.word 0xecf48400  ! 361: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	.word 0xe8df0e80  ! 362: LDXA_R	ldxa	[%r28, %r0] 0x74, %r20
	mov	0x30, %r24
	.word 0xeaf76000  ! 364: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xeecd04a0  ! 365: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r23
	.word 0xe4afe000  ! 366: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 367: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 368: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r24
	.word 0xe2b7ce60  ! 370: STHA_R	stha	%r17, [%r31 + %r0] 0x73
	.word 0xeeaf2000  ! 371: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeab7ce40  ! 372: STHA_R	stha	%r21, [%r31 + %r0] 0x72
	.word 0xe0b7a000  ! 373: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xe0df2000  ! 374: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0xe0f689e0  ! 375: STXA_R	stxa	%r16, [%r26 + %r0] 0x4f
	.word 0xe4f78e80  ! 376: STXA_R	stxa	%r18, [%r30 + %r0] 0x74
	.word 0xe2df4e60  ! 377: LDXA_R	ldxa	[%r29, %r0] 0x73, %r17
	.word 0xecbd84a0  ! 378: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0xe4c544a0  ! 379: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r18
	.word 0x8780204f  ! 380: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea74e60  ! 381: STWA_R	stwa	%r23, [%r29 + %r0] 0x73
	.word 0xeacdc4a0  ! 382: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r21
	.word 0x87802074  ! 383: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8f42000  ! 384: STXA_I	stxa	%r20, [%r16 + 0x0000] %asi
	mov	0x68, %r16
	.word 0xec8649e0  ! 386: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r22
	mov	0x28, %r25
	mov	0x8, %r18
	.word 0xe08c6000  ! 389: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r16
	.word 0xe0bce000  ! 390: STDA_I	stda	%r16, [%r19 + 0x0000] %asi
	mov	0x20, %r18
	.word 0xeccf0e80  ! 392: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r22
	.word 0xe69d44a0  ! 393: LDDA_R	ldda	[%r21, %r0] 0x25, %r19
	.word 0x8780204f  ! 394: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe68d84a0  ! 395: LDUBA_R	lduba	[%r22, %r0] 0x25, %r19
	.word 0xe4f609e0  ! 396: STXA_R	stxa	%r18, [%r24 + %r0] 0x4f
	.word 0xecb7ce60  ! 397: STHA_R	stha	%r22, [%r31 + %r0] 0x73
	.word 0xec9544a0  ! 398: LDUHA_R	lduha	[%r21, %r0] 0x25, %r22
	.word 0xecbc2000  ! 399: STDA_I	stda	%r22, [%r16 + 0x0000] %asi
	.word 0xecc46000  ! 400: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r22
	.word 0x87802025  ! 401: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3c0, %r22
	.word 0xec876000  ! 403: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r22
	.word 0xecdfa000  ! 404: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r22
	.word 0xecdfe000  ! 405: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	.word 0xea9f8e60  ! 406: LDDA_R	ldda	[%r30, %r0] 0x73, %r21
	.word 0xeea72000  ! 407: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 408: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb5c4a0  ! 409: STHA_R	stha	%r22, [%r23 + %r0] 0x25
	mov	0x7f0, %r20
	.word 0x87802073  ! 411: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x30, %r25
	.word 0xe49ce000  ! 413: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r18
	mov	0x70, %r26
	.word 0x87802073  ! 415: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3c0, %r22
	.word 0xeea74e40  ! 417: STWA_R	stwa	%r23, [%r29 + %r0] 0x72
	mov	0x50, %r27
	.word 0xe6b4c400  ! 419: STHA_R	stha	%r19, [%r19 + %r0] 0x20
	.word 0xe0d7e000  ! 420: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	mov	0x40, %r16
	.word 0xe6f78e80  ! 422: STXA_R	stxa	%r19, [%r30 + %r0] 0x74
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802074  ! 424: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab5c4a0  ! 425: STHA_R	stha	%r21, [%r23 + %r0] 0x25
	mov	0x3f8, %r21
	.word 0xe2af6000  ! 427: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0xe29fa000  ! 428: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r17
	.word 0xe2a7a000  ! 429: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0xe2b72000  ! 430: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 431: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x68, %r25
	.word 0xe2b62000  ! 433: STHA_I	stha	%r17, [%r24 + 0x0000] %asi
	.word 0xeaa74e40  ! 434: STWA_R	stwa	%r21, [%r29 + %r0] 0x72
	.word 0xe4f44400  ! 435: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xe8bcc400  ! 436: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	.word 0x87802073  ! 437: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 438: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 439: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r27
	.word 0xe2bf8e60  ! 441: STDA_R	stda	%r17, [%r30 + %r0] 0x73
	.word 0xe2bc4400  ! 442: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	.word 0xe6872000  ! 443: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6af2000  ! 444: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6d72000  ! 446: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r19
	.word 0xe6a7a000  ! 447: STWA_I	stwa	%r19, [%r30 + 0x0000] %asi
	mov	0x38, %r16
	mov	0x3c0, %r21
	.word 0xeecfce60  ! 450: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r23
	.word 0xe8f7e000  ! 451: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 452: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8bde000  ! 453: STDA_I	stda	%r20, [%r23 + 0x0000] %asi
	.word 0xe2b584a0  ! 454: STHA_R	stha	%r17, [%r22 + %r0] 0x25
	.word 0xea956000  ! 455: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r21
	.word 0xead5a000  ! 456: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r21
	.word 0xeaa5a000  ! 457: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xead7ce60  ! 458: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r21
	.word 0xecb56000  ! 459: STHA_I	stha	%r22, [%r21 + 0x0000] %asi
	.word 0xe2df4e40  ! 460: LDXA_R	ldxa	[%r29, %r0] 0x72, %r17
	.word 0xe29de000  ! 461: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r17
	.word 0xe285a000  ! 462: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r17
	mov	0x3f8, %r21
	.word 0x8780204f  ! 464: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe297e000  ! 465: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0x87802074  ! 466: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0adc4a0  ! 467: STBA_R	stba	%r16, [%r23 + %r0] 0x25
	mov	0x3f8, %r22
	.word 0x8780204f  ! 469: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab44400  ! 470: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	.word 0xe694e000  ! 471: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r19
	.word 0xe68ca000  ! 472: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r19
	mov	0x18, %r19
	.word 0xe68c2000  ! 474: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xe6f42000  ! 475: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0xe8f4c400  ! 476: STXA_R	stxa	%r20, [%r19 + %r0] 0x20
	.word 0xe8946000  ! 477: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r20
	.word 0x87802025  ! 478: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x40, %r27
	.word 0x87802072  ! 480: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3f8, %r21
	mov	0x70, %r16
	.word 0xe8b6e000  ! 483: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xe8b6a000  ! 484: STHA_I	stha	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 485: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a46000  ! 486: STWA_I	stwa	%r20, [%r17 + 0x0000] %asi
	mov	0x7c8, %r21
	.word 0x8780204f  ! 488: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0cf8e40  ! 489: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r16
	mov	0x3f0, %r20
	.word 0xe0bde000  ! 491: STDA_I	stda	%r16, [%r23 + 0x0000] %asi
	.word 0xe0f52000  ! 492: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	mov	0x3e8, %r20
	mov	0x3d8, %r23
	mov	0x3c8, %r21
	.word 0xe0ac4400  ! 496: STBA_R	stba	%r16, [%r17 + %r0] 0x20
	.word 0xecd52000  ! 497: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r22
	.word 0xe6ad84a0  ! 498: STBA_R	stba	%r19, [%r22 + %r0] 0x25
	mov	0x3d8, %r20
	.word 0xeacd6000  ! 500: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r21
	.word 0xeccdc4a0  ! 501: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r22
	.word 0xe6a52000  ! 502: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xe4cf4e80  ! 503: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r18
	.word 0xe49f8e40  ! 504: LDDA_R	ldda	[%r30, %r0] 0x72, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802074  ! 506: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8c5a000  ! 507: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r20
	mov	0x7c8, %r20
	.word 0xe8cda000  ! 509: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r20
	mov	0x3e0, %r20
	.word 0xe6a7ce80  ! 511: STWA_R	stwa	%r19, [%r31 + %r0] 0x74
	.word 0xee95a000  ! 512: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r23
	mov	0x70, %r17
	.word 0xe4f74e80  ! 514: STXA_R	stxa	%r18, [%r29 + %r0] 0x74
	ta	T_CHANGE_PRIV	! macro
	mov	0x3e8, %r20
	.word 0xe09da000  ! 517: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r16
	mov	0x20, %r24
	mov	0x18, %r18
	.word 0xe2a689e0  ! 520: STWA_R	stwa	%r17, [%r26 + %r0] 0x4f
	ta	T_CHANGE_PRIV	! macro
	.word 0xe8c52000  ! 522: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r20
	.word 0xe8b56000  ! 523: STHA_I	stha	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a5e000  ! 524: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 525: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x10, %r25
	mov	0x3e0, %r22
	.word 0xe8c6c9e0  ! 528: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r20
	mov	0x20, %r19
	mov	0x38, %r24
	.word 0x87802020  ! 531: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ac2000  ! 532: STBA_I	stba	%r17, [%r16 + 0x0000] %asi
	.word 0xe2c46000  ! 533: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r17
	.word 0x87802072  ! 534: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x78, %r19
	.word 0xe284e000  ! 536: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r17
	.word 0xe2a689e0  ! 537: STWA_R	stwa	%r17, [%r26 + %r0] 0x4f
	.word 0xe8bc8400  ! 538: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xe2bca000  ! 539: STDA_I	stda	%r17, [%r18 + 0x0000] %asi
	.word 0x87802072  ! 540: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeecfce40  ! 541: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r23
	.word 0xeab7e000  ! 542: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 543: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8f6000  ! 544: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r21
	mov	0x78, %r24
	.word 0x87802074  ! 546: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r16
	.word 0xe0b70e40  ! 548: STHA_R	stha	%r16, [%r28 + %r0] 0x72
	.word 0xe08c8400  ! 549: LDUBA_R	lduba	[%r18, %r0] 0x20, %r16
	mov	0x50, %r27
	mov	0x78, %r19
	.word 0xecdfce60  ! 552: LDXA_R	ldxa	[%r31, %r0] 0x73, %r22
	mov	0x8, %r25
	.word 0xee9ec9e0  ! 554: LDDA_R	ldda	[%r27, %r0] 0x4f, %r23
	.word 0xeedd2000  ! 555: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r23
	.word 0xecd544a0  ! 556: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r22
	.word 0xeaf5a000  ! 557: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xe296c9e0  ! 558: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r17
	.word 0xe4ada000  ! 559: STBA_I	stba	%r18, [%r22 + 0x0000] %asi
	.word 0xe88544a0  ! 560: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r20
	.word 0xeead2000  ! 561: STBA_I	stba	%r23, [%r20 + 0x0000] %asi
	.word 0x87802074  ! 562: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeef76000  ! 563: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xe8cec9e0  ! 564: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r20
	.word 0xeef7a000  ! 565: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	mov	0x50, %r24
	.word 0xe4dc8400  ! 567: LDXA_R	ldxa	[%r18, %r0] 0x20, %r18
	.word 0x87802073  ! 568: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8942000  ! 569: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r20
	.word 0xe8a4e000  ! 570: STWA_I	stwa	%r20, [%r19 + 0x0000] %asi
	.word 0xe0f609e0  ! 571: STXA_R	stxa	%r16, [%r24 + %r0] 0x4f
	.word 0xe6bf4e40  ! 572: STDA_R	stda	%r19, [%r29 + %r0] 0x72
	.word 0xee94e000  ! 573: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r23
	.word 0xeec46000  ! 574: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r23
	mov	0x68, %r19
	.word 0x87802025  ! 576: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x40, %r25
	mov	0x28, %r25
	.word 0x8780204f  ! 579: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x0, %r26
	.word 0x87802072  ! 581: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeaf2000  ! 582: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	mov	0x3c8, %r21
	.word 0xeed7a000  ! 584: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802020  ! 585: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r25
	.word 0xe2940400  ! 587: LDUHA_R	lduha	[%r16, %r0] 0x20, %r17
	.word 0xe0848400  ! 588: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r16
	.word 0xecdfe000  ! 589: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	.word 0x87802025  ! 590: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecc7a000  ! 591: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0x87802020  ! 592: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdc6000  ! 593: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r22
	mov	0x30, %r25
	.word 0x87802072  ! 595: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2bc4400  ! 596: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	mov	0x8, %r17
	.word 0xecdc0400  ! 598: LDXA_R	ldxa	[%r16, %r0] 0x20, %r22
	mov	0x7f0, %r23
	mov	0x60, %r16
	.word 0xe8bc2000  ! 601: STDA_I	stda	%r20, [%r16 + 0x0000] %asi
	.word 0xe8cca000  ! 602: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r20
	.word 0x87802073  ! 603: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4adc4a0  ! 604: STBA_R	stba	%r18, [%r23 + %r0] 0x25
	.word 0xecbf8e40  ! 605: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	.word 0xe0aee000  ! 606: STBA_I	stba	%r16, [%r27 + 0x0000] %asi
	mov	0x70, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6de89e0  ! 609: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r19
	mov	0x3e8, %r21
	.word 0xe8862000  ! 611: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r20
	.word 0xe88f8e80  ! 612: LDUBA_R	lduba	[%r30, %r0] 0x74, %r20
	.word 0xeea6c9e0  ! 613: STWA_R	stwa	%r23, [%r27 + %r0] 0x4f
	.word 0xe4f78e60  ! 614: STXA_R	stxa	%r18, [%r30 + %r0] 0x73
	.word 0xe0af4e40  ! 615: STBA_R	stba	%r16, [%r29 + %r0] 0x72
	mov	0x3d0, %r21
	.word 0xeac6e000  ! 617: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r21
	.word 0xeaf6a000  ! 618: STXA_I	stxa	%r21, [%r26 + 0x0000] %asi
	.word 0xec840400  ! 619: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r22
	.word 0xe0f48400  ! 620: STXA_R	stxa	%r16, [%r18 + %r0] 0x20
	.word 0x87802074  ! 621: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 622: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf76000  ! 623: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 624: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab72000  ! 625: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	.word 0xea97a000  ! 626: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0x87802025  ! 627: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea9fe000  ! 628: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r21
	mov	0x50, %r16
	mov	0x0, %r27
	.word 0xeaf7a000  ! 631: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xe8cc0400  ! 632: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r20
	.word 0xe4cfa000  ! 633: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r18
	.word 0x87802025  ! 634: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x78, %r26
	.word 0xe6af4e80  ! 636: STBA_R	stba	%r19, [%r29 + %r0] 0x74
	mov	0x68, %r27
	.word 0xe6a70e80  ! 638: STWA_R	stwa	%r19, [%r28 + %r0] 0x74
	.word 0xec8cc400  ! 639: LDUBA_R	lduba	[%r19, %r0] 0x20, %r22
	.word 0xe6dcc400  ! 640: LDXA_R	ldxa	[%r19, %r0] 0x20, %r19
	mov	0x48, %r24
	.word 0xe0af6000  ! 642: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 643: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 644: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 645: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 646: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0f72000  ! 647: STXA_I	stxa	%r16, [%r28 + 0x0000] %asi
	.word 0xe4acc400  ! 648: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xe2976000  ! 649: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0xe8c70e80  ! 650: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r20
	mov	0x40, %r16
	.word 0xea97a000  ! 652: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0xe09cc400  ! 653: LDDA_R	ldda	[%r19, %r0] 0x20, %r16
	.word 0xe8940400  ! 654: LDUHA_R	lduha	[%r16, %r0] 0x20, %r20
	mov	0x3f8, %r21
	.word 0xe8976000  ! 656: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0xe6af8e40  ! 657: STBA_R	stba	%r19, [%r30 + %r0] 0x72
	.word 0xeea609e0  ! 658: STWA_R	stwa	%r23, [%r24 + %r0] 0x4f
	mov	0x7f0, %r22
	.word 0xeedf0e60  ! 660: LDXA_R	ldxa	[%r28, %r0] 0x73, %r23
	mov	0x70, %r25
	mov	0x7f8, %r22
	.word 0xeebf0e60  ! 663: STDA_R	stda	%r23, [%r28 + %r0] 0x73
	.word 0xe48f2000  ! 664: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe6dd84a0  ! 665: LDXA_R	ldxa	[%r22, %r0] 0x25, %r19
	.word 0xeac7e000  ! 666: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	mov	0x60, %r25
	mov	0x3d0, %r20
	.word 0xe6944400  ! 669: LDUHA_R	lduha	[%r17, %r0] 0x20, %r19
	.word 0xeacf2000  ! 670: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r21
	.word 0xeab7e000  ! 671: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x3e8, %r22
	.word 0xec970e40  ! 673: LDUHA_R	lduha	[%r28, %r0] 0x72, %r22
	mov	0x3f0, %r22
	.word 0xe2dfe000  ! 675: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2f74e40  ! 676: STXA_R	stxa	%r17, [%r29 + %r0] 0x72
	.word 0xecdfe000  ! 677: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	mov	0x8, %r27
	.word 0xecbf6000  ! 679: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	mov	0x3c8, %r21
	mov	0x70, %r26
	.word 0xe2ce49e0  ! 682: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r17
	.word 0xea9fa000  ! 683: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	mov	0x60, %r27
	.word 0xeacf6000  ! 685: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r21
	.word 0xeeadc4a0  ! 686: STBA_R	stba	%r23, [%r23 + %r0] 0x25
	.word 0x8780204f  ! 687: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2d4a000  ! 688: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r17
	.word 0xe28c6000  ! 689: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r17
	.word 0xe2b46000  ! 690: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	mov	0x20, %r18
	.word 0xe284e000  ! 692: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r17
	.word 0xe2f42000  ! 693: STXA_I	stxa	%r17, [%r16 + 0x0000] %asi
	.word 0xe2a46000  ! 694: STWA_I	stwa	%r17, [%r17 + 0x0000] %asi
	.word 0x8780204f  ! 695: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2a52000  ! 696: STWA_I	stwa	%r17, [%r20 + 0x0000] %asi
	mov	0x3e8, %r21
	.word 0xe29d6000  ! 698: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r17
	.word 0xe2dd2000  ! 699: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r17
	.word 0xeacfce40  ! 700: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r21
	.word 0xe8d5a000  ! 701: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r20
	.word 0xe89fce60  ! 702: LDDA_R	ldda	[%r31, %r0] 0x73, %r20
	ta	T_CHANGE_HPRIV	! macro
	mov	0x8, %r16
	mov	0x7d0, %r21
	.word 0xecaf8e60  ! 706: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	mov	0x7e0, %r20
	.word 0xe0dde000  ! 708: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r16
	.word 0xe0ad6000  ! 709: STBA_I	stba	%r16, [%r21 + 0x0000] %asi
	.word 0xee8504a0  ! 710: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r23
	.word 0xecdf8e40  ! 711: LDXA_R	ldxa	[%r30, %r0] 0x72, %r22
	.word 0xe8c52000  ! 712: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r20
	mov	0x78, %r16
	.word 0xe8bf8e40  ! 714: STDA_R	stda	%r20, [%r30 + %r0] 0x72
	.word 0x87802072  ! 715: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab62000  ! 716: STHA_I	stha	%r21, [%r24 + 0x0000] %asi
	.word 0xe89f8e60  ! 717: LDDA_R	ldda	[%r30, %r0] 0x73, %r20
	.word 0x87802025  ! 718: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802073  ! 719: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2a6a000  ! 720: STWA_I	stwa	%r17, [%r26 + 0x0000] %asi
	.word 0xe2c66000  ! 721: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r17
	.word 0xe28f0e40  ! 722: LDUBA_R	lduba	[%r28, %r0] 0x72, %r17
	.word 0xe2c66000  ! 723: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r17
	.word 0xe8d74e60  ! 724: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r20
	.word 0x87802072  ! 725: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 726: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeea72000  ! 727: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	mov	0x0, %r26
	mov	0x68, %r17
	mov	0x68, %r27
	mov	0x7d0, %r23
	.word 0xea944400  ! 732: LDUHA_R	lduha	[%r17, %r0] 0x20, %r21
	.word 0xee874e80  ! 733: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r23
	.word 0x87802020  ! 734: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 735: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea62000  ! 736: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	mov	0x3e0, %r20
	mov	0x7f8, %r22
	.word 0x87802074  ! 739: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 740: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r18
	.word 0xeeb46000  ! 742: STHA_I	stha	%r23, [%r17 + 0x0000] %asi
	.word 0x8780204f  ! 743: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeea7e000  ! 744: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xeedfe000  ! 745: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x3c8, %r20
	mov	0x68, %r25
	.word 0xe2c44400  ! 748: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r17
	mov	0x3c0, %r20
	mov	0x3e8, %r21
	.word 0xe0f40400  ! 751: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	mov	0x38, %r27
	.word 0x8780204f  ! 753: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6f42000  ! 754: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	mov	0x60, %r18
	.word 0x8780204f  ! 756: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6d6e000  ! 757: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r19
	.word 0x87802072  ! 758: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6aca000  ! 759: STBA_I	stba	%r19, [%r18 + 0x0000] %asi
	.word 0xe68ce000  ! 760: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	.word 0xe6a4a000  ! 761: STWA_I	stwa	%r19, [%r18 + 0x0000] %asi
	mov	0x70, %r26
	.word 0xe8f7ce60  ! 763: STXA_R	stxa	%r20, [%r31 + %r0] 0x73
	mov	0x7c8, %r23
	.word 0xeeac6000  ! 765: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0xe09609e0  ! 766: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r16
	.word 0x8780204f  ! 767: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec86c9e0  ! 768: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r22
	mov	0x7f0, %r23
	mov	0x28, %r27
	mov	0x70, %r16
	.word 0xecb44400  ! 772: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	.word 0x87802020  ! 773: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r17
	.word 0xe8b76000  ! 775: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0xec9504a0  ! 776: LDUHA_R	lduha	[%r20, %r0] 0x25, %r22
	.word 0xe2f689e0  ! 777: STXA_R	stxa	%r17, [%r26 + %r0] 0x4f
	.word 0x8780204f  ! 778: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6ac8400  ! 779: STBA_R	stba	%r19, [%r18 + %r0] 0x20
	.word 0xeca7a000  ! 780: STWA_I	stwa	%r22, [%r30 + 0x0000] %asi
	.word 0xec9fa000  ! 781: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r22
	mov	0x7c0, %r23
	.word 0xecbfe000  ! 783: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	.word 0xeccfe000  ! 784: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r22
	.word 0xecf7e000  ! 785: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xe6c4c400  ! 786: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r19
	.word 0xe8a7a000  ! 787: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe6c7ce60  ! 788: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r19
	mov	0x7f0, %r23
	.word 0xe4940400  ! 790: LDUHA_R	lduha	[%r16, %r0] 0x20, %r18
	.word 0xe09d04a0  ! 791: LDDA_R	ldda	[%r20, %r0] 0x25, %r16
	.word 0x87802073  ! 792: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe49609e0  ! 793: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r18
	.word 0xe6cde000  ! 794: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	mov	0x58, %r18
	.word 0xe6ac4400  ! 796: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	mov	0x7f0, %r21
	.word 0xe0bf4e40  ! 798: STDA_R	stda	%r16, [%r29 + %r0] 0x72
	.word 0x87802073  ! 799: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x48, %r24
	.word 0xe8b62000  ! 801: STHA_I	stha	%r20, [%r24 + 0x0000] %asi
	.word 0xeebf4e60  ! 802: STDA_R	stda	%r23, [%r29 + %r0] 0x73
	.word 0xe2d6a000  ! 803: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	.word 0xe2de2000  ! 804: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r17
	.word 0xe2d66000  ! 805: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r17
	mov	0x30, %r24
	.word 0xecdc8400  ! 807: LDXA_R	ldxa	[%r18, %r0] 0x20, %r22
	.word 0xeca689e0  ! 808: STWA_R	stwa	%r22, [%r26 + %r0] 0x4f
	.word 0xe2a70e80  ! 809: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	.word 0xecbf0e40  ! 810: STDA_R	stda	%r22, [%r28 + %r0] 0x72
	.word 0xeab6e000  ! 811: STHA_I	stha	%r21, [%r27 + 0x0000] %asi
	mov	0x7c0, %r20
	.word 0xeaa6e000  ! 813: STWA_I	stwa	%r21, [%r27 + 0x0000] %asi
	.word 0xead66000  ! 814: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r21
	.word 0xec9f0e80  ! 815: LDDA_R	ldda	[%r28, %r0] 0x74, %r22
	.word 0xe2d70e60  ! 816: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r17
	.word 0xe0f44400  ! 817: STXA_R	stxa	%r16, [%r17 + %r0] 0x20
	.word 0xe8b4c400  ! 818: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	mov	0x10, %r16
	.word 0x87802020  ! 820: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea9f2000  ! 821: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	mov	0x28, %r27
	mov	0x18, %r24
	.word 0x8780204f  ! 824: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xead46000  ! 825: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xeaf42000  ! 826: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 827: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6be89e0  ! 828: STDA_R	stda	%r19, [%r26 + %r0] 0x4f
	mov	0x3c0, %r21
	.word 0xe8972000  ! 830: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	mov	0x8, %r24
	.word 0xe8c72000  ! 832: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xe897e000  ! 833: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe8c72000  ! 834: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8bf0e60  ! 835: STDA_R	stda	%r20, [%r28 + %r0] 0x73
	mov	0x10, %r26
	.word 0xec97ce60  ! 837: LDUHA_R	lduha	[%r31, %r0] 0x73, %r22
	.word 0xe08504a0  ! 838: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r16
	.word 0xea8fa000  ! 839: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	mov	0x18, %r25
	.word 0xeab7a000  ! 841: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	mov	0x60, %r24
	mov	0x3c8, %r21
	.word 0x87802020  ! 844: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8cc4400  ! 845: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	.word 0xe2afe000  ! 846: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xeccfce40  ! 847: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r22
	.word 0xe2a72000  ! 848: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 849: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x50, %r18
	mov	0x20, %r16
	.word 0xe2bf2000  ! 852: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe2d7a000  ! 853: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe2d7a000  ! 854: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe4c40400  ! 855: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r18
	mov	0x78, %r17
	.word 0x87802072  ! 857: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09c2000  ! 858: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r16
	.word 0xe8f40400  ! 859: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	.word 0xeef46000  ! 860: STXA_I	stxa	%r23, [%r17 + 0x0000] %asi
	.word 0xeea4a000  ! 861: STWA_I	stwa	%r23, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 862: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x78, %r25
	.word 0x8780204f  ! 864: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe29e09e0  ! 865: LDDA_R	ldda	[%r24, %r0] 0x4f, %r17
	mov	0x48, %r17
	.word 0x87802025  ! 867: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 868: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4cd44a0  ! 869: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r18
	.word 0xe4a46000  ! 870: STWA_I	stwa	%r18, [%r17 + 0x0000] %asi
	mov	0x8, %r27
	mov	0x68, %r26
	mov	0x18, %r16
	.word 0xeca649e0  ! 874: STWA_R	stwa	%r22, [%r25 + %r0] 0x4f
	mov	0x28, %r26
	.word 0xeacfce40  ! 876: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r21
	.word 0x87802072  ! 877: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeb72000  ! 878: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xeec76000  ! 879: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r23
	.word 0xee972000  ! 880: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	.word 0xecf44400  ! 881: STXA_R	stxa	%r22, [%r17 + %r0] 0x20
	.word 0xe4b4c400  ! 882: STHA_R	stha	%r18, [%r19 + %r0] 0x20
	.word 0xeeb504a0  ! 883: STHA_R	stha	%r23, [%r20 + %r0] 0x25
	.word 0xecbfce80  ! 884: STDA_R	stda	%r22, [%r31 + %r0] 0x74
	.word 0xe0a76000  ! 885: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	.word 0xe4bcc400  ! 886: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	.word 0xeeaf2000  ! 887: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 888: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 889: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0b74e40  ! 890: STHA_R	stha	%r16, [%r29 + %r0] 0x72
	.word 0xe2a7ce40  ! 891: STWA_R	stwa	%r17, [%r31 + %r0] 0x72
	.word 0xe8848400  ! 892: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r20
	mov	0x7c8, %r22
	.word 0x87802074  ! 894: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2c5e000  ! 895: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r17
	.word 0xe4acc400  ! 896: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xeed5e000  ! 897: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r23
	mov	0x7d0, %r21
	.word 0xe8df4e80  ! 899: LDXA_R	ldxa	[%r29, %r0] 0x74, %r20
	mov	0x28, %r19
	.word 0xe0bdc4a0  ! 901: STDA_R	stda	%r16, [%r23 + %r0] 0x25
	.word 0xeabfce40  ! 902: STDA_R	stda	%r21, [%r31 + %r0] 0x72
	mov	0x7d8, %r22
	mov	0x60, %r25
	.word 0xeabc4400  ! 905: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0x87802020  ! 906: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab42000  ! 907: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x0, %r27
	mov	0x0, %r27
	.word 0x8780204f  ! 910: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3c8, %r23
	.word 0x87802072  ! 912: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe29d44a0  ! 913: LDDA_R	ldda	[%r21, %r0] 0x25, %r17
	mov	0x60, %r24
	.word 0xe0cf2000  ! 915: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0xe0b76000  ! 916: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	mov	0x40, %r24
	.word 0xe0b76000  ! 918: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xee848400  ! 919: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r23
	.word 0xea8fa000  ! 920: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	.word 0xe6bc0400  ! 921: STDA_R	stda	%r19, [%r16 + %r0] 0x20
	mov	0x3e0, %r22
	.word 0xe8dfa000  ! 923: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0xe8a7a000  ! 924: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 925: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4cc8400  ! 926: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	.word 0xecaea000  ! 927: STBA_I	stba	%r22, [%r26 + 0x0000] %asi
	.word 0xec8e6000  ! 928: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r22
	.word 0xeca66000  ! 929: STWA_I	stwa	%r22, [%r25 + 0x0000] %asi
	.word 0xecde6000  ! 930: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r22
	.word 0xeca62000  ! 931: STWA_I	stwa	%r22, [%r24 + 0x0000] %asi
	.word 0xe2dcc400  ! 932: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	.word 0xe6d6c9e0  ! 933: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r19
	.word 0xe4b48400  ! 934: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	mov	0x3e8, %r23
	.word 0xeaac4400  ! 936: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	.word 0xe09cc400  ! 937: LDDA_R	ldda	[%r19, %r0] 0x20, %r16
	mov	0x40, %r17
	.word 0xeeb504a0  ! 939: STHA_R	stha	%r23, [%r20 + %r0] 0x25
	.word 0xe8b66000  ! 940: STHA_I	stha	%r20, [%r25 + 0x0000] %asi
	.word 0xe8866000  ! 941: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r20
	mov	0x3e0, %r22
	mov	0x7c0, %r21
	.word 0xe8ae6000  ! 944: STBA_I	stba	%r20, [%r25 + 0x0000] %asi
	.word 0xe2dfce80  ! 945: LDXA_R	ldxa	[%r31, %r0] 0x74, %r17
	.word 0xe08ea000  ! 946: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r16
	mov	0x78, %r24
	.word 0xe8cc0400  ! 948: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r20
	mov	0x38, %r16
	.word 0xe6f66000  ! 950: STXA_I	stxa	%r19, [%r25 + 0x0000] %asi
	.word 0xe6bea000  ! 951: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	.word 0xec8f4e40  ! 952: LDUBA_R	lduba	[%r29, %r0] 0x72, %r22
	mov	0x10, %r27
	mov	0x7c0, %r20
	.word 0xec8e2000  ! 955: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r22
	mov	0x0, %r19
	.word 0x87802073  ! 957: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r26
	.word 0x87802020  ! 959: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x30, %r18
	.word 0xe6afce60  ! 961: STBA_R	stba	%r19, [%r31 + %r0] 0x73
	.word 0xe6c42000  ! 962: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r19
	.word 0xe8af4e80  ! 963: STBA_R	stba	%r20, [%r29 + %r0] 0x74
	.word 0xec8dc4a0  ! 964: LDUBA_R	lduba	[%r23, %r0] 0x25, %r22
	.word 0xe4a4e000  ! 965: STWA_I	stwa	%r18, [%r19 + 0x0000] %asi
	.word 0xe6840400  ! 966: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r19
	mov	0x40, %r27
	.word 0xe287ce60  ! 968: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r17
	mov	0x7f8, %r20
	.word 0xe2bc4400  ! 970: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	mov	0x30, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xecdf0e80  ! 973: LDXA_R	ldxa	[%r28, %r0] 0x74, %r22
	mov	0x38, %r25
	mov	0x7f8, %r23
	.word 0xecf4e000  ! 976: STXA_I	stxa	%r22, [%r19 + 0x0000] %asi
	.word 0xe4d70e80  ! 977: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r18
	.word 0x87802025  ! 978: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4a649e0  ! 979: STWA_R	stwa	%r18, [%r25 + %r0] 0x4f
	.word 0xeeb70e60  ! 980: STHA_R	stha	%r23, [%r28 + %r0] 0x73
	.word 0xea9d6000  ! 981: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	.word 0xea85a000  ! 982: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r21
	.word 0xe88f0e80  ! 983: LDUBA_R	lduba	[%r28, %r0] 0x74, %r20
	.word 0x87802074  ! 984: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r26
	.word 0xee9f0e80  ! 986: LDDA_R	ldda	[%r28, %r0] 0x74, %r23
	mov	0x70, %r26
	.word 0xecace000  ! 988: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	mov	0x70, %r26
	.word 0x87802020  ! 990: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49c0400  ! 991: LDDA_R	ldda	[%r16, %r0] 0x20, %r18
	.word 0xeace6000  ! 992: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r21
	.word 0xeaf62000  ! 993: STXA_I	stxa	%r21, [%r24 + 0x0000] %asi
	mov	0x10, %r27
	.word 0xeacee000  ! 995: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 996: WRASI_I	wr	%r0, 0x004f, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeedf8e40  ! 998: LDXA_R	ldxa	[%r30, %r0] 0x72, %r23
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	mov	0x3f8, %r22
	.word 0xe4b40400  ! 1: STHA_R	stha	%r18, [%r16 + %r0] 0x20
	.word 0x87802073  ! 2: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x70, %r18
	.word 0xe4bc0400  ! 4: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	.word 0xee9fce40  ! 5: LDDA_R	ldda	[%r31, %r0] 0x72, %r23
	.word 0x87802072  ! 6: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2b76000  ! 7: STHA_I	stha	%r17, [%r29 + 0x0000] %asi
	.word 0xe4f70e60  ! 8: STXA_R	stxa	%r18, [%r28 + %r0] 0x73
	.word 0xe6a4c400  ! 9: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0xe6c7a000  ! 10: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r19
	.word 0xe0dc4400  ! 11: LDXA_R	ldxa	[%r17, %r0] 0x20, %r16
	.word 0xeab7e000  ! 12: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x60, %r26
	.word 0xe2be49e0  ! 14: STDA_R	stda	%r17, [%r25 + %r0] 0x4f
	mov	0x70, %r19
	.word 0x87802020  ! 16: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee970e60  ! 17: LDUHA_R	lduha	[%r28, %r0] 0x73, %r23
	.word 0xe2c40400  ! 18: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r17
	mov	0x3c8, %r20
	.word 0xe487e000  ! 20: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r18
	.word 0xe4dfa000  ! 21: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4cf6000  ! 22: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r18
	.word 0xe4a72000  ! 23: STWA_I	stwa	%r18, [%r28 + 0x0000] %asi
	mov	0x18, %r27
	mov	0x20, %r16
	.word 0xeedf4e60  ! 26: LDXA_R	ldxa	[%r29, %r0] 0x73, %r23
	.word 0xe8af6000  ! 27: STBA_I	stba	%r20, [%r29 + 0x0000] %asi
	.word 0xe8afe000  ! 28: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 29: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6870e40  ! 30: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r19
	.word 0xeec70e60  ! 31: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r23
	.word 0xe8b76000  ! 32: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0xe8a7e000  ! 33: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	mov	0x40, %r17
	mov	0x30, %r25
	.word 0x8780204f  ! 36: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8ce6000  ! 37: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r20
	.word 0xe0b74e60  ! 38: STHA_R	stha	%r16, [%r29 + %r0] 0x73
	.word 0x8780204f  ! 39: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4df8e40  ! 40: LDXA_R	ldxa	[%r30, %r0] 0x72, %r18
	mov	0x7c8, %r22
	.word 0xe69f4e80  ! 42: LDDA_R	ldda	[%r29, %r0] 0x74, %r19
	.word 0x8780204f  ! 43: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeef62000  ! 44: STXA_I	stxa	%r23, [%r24 + 0x0000] %asi
	.word 0xe8be49e0  ! 45: STDA_R	stda	%r20, [%r25 + %r0] 0x4f
	.word 0xeecee000  ! 46: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r23
	.word 0x87802074  ! 47: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe08609e0  ! 49: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r16
	mov	0x3f0, %r21
	.word 0xeab689e0  ! 51: STHA_R	stha	%r21, [%r26 + %r0] 0x4f
	mov	0x18, %r16
	.word 0xe2b649e0  ! 53: STHA_R	stha	%r17, [%r25 + %r0] 0x4f
	.word 0x87802072  ! 54: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8d44400  ! 55: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r20
	.word 0x87802020  ! 56: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea9f8e60  ! 57: LDDA_R	ldda	[%r30, %r0] 0x73, %r21
	.word 0x87802074  ! 58: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bea000  ! 60: STDA_I	stda	%r16, [%r26 + 0x0000] %asi
	.word 0xe4f44400  ! 61: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xe2cd44a0  ! 62: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r17
	.word 0xe0874e60  ! 63: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r16
	mov	0x38, %r24
	mov	0x78, %r17
	mov	0x3c8, %r21
	.word 0xe8ce2000  ! 67: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r20
	.word 0xe88ea000  ! 68: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r20
	.word 0x87802020  ! 69: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 70: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 71: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe88c6000  ! 72: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r20
	.word 0x87802025  ! 73: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 74: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe896a000  ! 75: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r20
	mov	0x68, %r16
	mov	0x7f8, %r22
	.word 0x87802025  ! 78: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x18, %r25
	.word 0xe8f62000  ! 80: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	.word 0xe2afce60  ! 81: STBA_R	stba	%r17, [%r31 + %r0] 0x73
	.word 0xeed44400  ! 82: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r23
	.word 0x87802073  ! 83: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 84: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbee000  ! 85: STDA_I	stda	%r22, [%r27 + 0x0000] %asi
	.word 0x87802072  ! 86: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecc72000  ! 87: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	mov	0x50, %r27
	.word 0xecbfa000  ! 89: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeaa4c400  ! 90: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	mov	0x3f0, %r20
	.word 0xe4b76000  ! 92: STHA_I	stha	%r18, [%r29 + 0x0000] %asi
	.word 0xe6cd04a0  ! 93: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r19
	.word 0xeaf72000  ! 94: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xeab72000  ! 95: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	mov	0x8, %r19
	.word 0xeaf7a000  ! 97: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xeaafa000  ! 98: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xeab76000  ! 99: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x10, %r19
	.word 0xead76000  ! 101: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	mov	0x3d8, %r23
	mov	0x50, %r18
	mov	0x3d0, %r20
	.word 0xe6dec9e0  ! 105: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r19
	mov	0x38, %r24
	mov	0x7c8, %r23
	mov	0x70, %r16
	.word 0xea840400  ! 109: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r21
	mov	0x68, %r27
	.word 0xe4b76000  ! 111: STHA_I	stha	%r18, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 112: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r17
	.word 0xe0f7ce60  ! 114: STXA_R	stxa	%r16, [%r31 + %r0] 0x73
	.word 0xeabf8e60  ! 115: STDA_R	stda	%r21, [%r30 + %r0] 0x73
	.word 0xe69fe000  ! 116: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r19
	mov	0x3e0, %r23
	.word 0xeaf7ce40  ! 118: STXA_R	stxa	%r21, [%r31 + %r0] 0x72
	.word 0xeead84a0  ! 119: STBA_R	stba	%r23, [%r22 + %r0] 0x25
	mov	0x60, %r18
	.word 0xe687a000  ! 121: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6af6000  ! 122: STBA_I	stba	%r19, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 123: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x48, %r25
	mov	0x3d8, %r20
	.word 0xe6a7e000  ! 126: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6874e60  ! 127: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r19
	.word 0xe6b76000  ! 128: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe2bfce80  ! 129: STDA_R	stda	%r17, [%r31 + %r0] 0x74
	.word 0x87802020  ! 130: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x70, %r25
	mov	0x7c0, %r23
	.word 0xe8ac8400  ! 133: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	.word 0xe2c7a000  ! 134: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0x87802073  ! 135: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 136: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2bf6000  ! 137: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	mov	0x7d8, %r23
	.word 0x8780204f  ! 139: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea9c4400  ! 140: LDDA_R	ldda	[%r17, %r0] 0x20, %r21
	.word 0xea9d6000  ! 141: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	.word 0xeacf0e80  ! 142: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r21
	.word 0xea9d6000  ! 143: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	.word 0xeadda000  ! 144: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r21
	mov	0x58, %r19
	mov	0x7d8, %r20
	.word 0xea8de000  ! 147: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r21
	.word 0xeaa5e000  ! 148: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaf52000  ! 149: STXA_I	stxa	%r21, [%r20 + 0x0000] %asi
	.word 0xeacd2000  ! 150: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r21
	.word 0xeaad6000  ! 151: STBA_I	stba	%r21, [%r21 + 0x0000] %asi
	.word 0xeabd6000  ! 152: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	mov	0x78, %r19
	.word 0xec85c4a0  ! 154: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r22
	.word 0xe2f44400  ! 155: STXA_R	stxa	%r17, [%r17 + %r0] 0x20
	.word 0xe6cde000  ! 156: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	mov	0x50, %r27
	.word 0xe685e000  ! 158: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r19
	.word 0xe69de000  ! 159: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r19
	mov	0x8, %r25
	.word 0xe6c52000  ! 161: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r19
	mov	0x3f0, %r22
	mov	0x3d0, %r21
	.word 0xe6ade000  ! 164: STBA_I	stba	%r19, [%r23 + 0x0000] %asi
	.word 0xe0cfce40  ! 165: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r16
	.word 0xe69d04a0  ! 166: LDDA_R	ldda	[%r20, %r0] 0x25, %r19
	mov	0x3d0, %r21
	.word 0xe6b56000  ! 168: STHA_I	stha	%r19, [%r21 + 0x0000] %asi
	.word 0xeaa70e40  ! 169: STWA_R	stwa	%r21, [%r28 + %r0] 0x72
	.word 0xeabc0400  ! 170: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xea9d6000  ! 171: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	.word 0x87802074  ! 172: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x48, %r18
	.word 0xeabd6000  ! 174: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	.word 0xe0978e40  ! 175: LDUHA_R	lduha	[%r30, %r0] 0x72, %r16
	mov	0x68, %r25
	mov	0x68, %r26
	.word 0xe68d2000  ! 178: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r19
	.word 0xe68d6000  ! 179: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe6952000  ! 180: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r19
	.word 0xeebf4e80  ! 181: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xe2ac0400  ! 182: STBA_R	stba	%r17, [%r16 + %r0] 0x20
	.word 0xeabd84a0  ! 183: STDA_R	stda	%r21, [%r22 + %r0] 0x25
	.word 0xe2b56000  ! 184: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	.word 0xe2b5e000  ! 185: STHA_I	stha	%r17, [%r23 + 0x0000] %asi
	mov	0x58, %r27
	.word 0xeede89e0  ! 187: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r23
	.word 0xe4cd2000  ! 188: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r18
	mov	0x40, %r17
	mov	0x60, %r17
	.word 0x87802020  ! 191: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaa70e60  ! 192: STWA_R	stwa	%r21, [%r28 + %r0] 0x73
	.word 0xe0dc8400  ! 193: LDXA_R	ldxa	[%r18, %r0] 0x20, %r16
	.word 0xe0a70e80  ! 194: STWA_R	stwa	%r16, [%r28 + %r0] 0x74
	.word 0xec870e40  ! 195: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r22
	.word 0xeaa44400  ! 196: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xe4b504a0  ! 197: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	.word 0xeeb46000  ! 198: STHA_I	stha	%r23, [%r17 + 0x0000] %asi
	.word 0xeec46000  ! 199: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r23
	.word 0xeedc2000  ! 200: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r23
	.word 0x87802020  ! 201: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r19
	mov	0x3f8, %r20
	mov	0x0, %r26
	.word 0xeeb72000  ! 205: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xeeb7a000  ! 206: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xeeaf6000  ! 208: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeea76000  ! 209: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	mov	0x50, %r24
	.word 0xeebf6000  ! 211: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 212: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeedfe000  ! 213: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x48, %r25
	.word 0xea8d84a0  ! 215: LDUBA_R	lduba	[%r22, %r0] 0x25, %r21
	mov	0x70, %r17
	.word 0xee9f0e60  ! 217: LDDA_R	ldda	[%r28, %r0] 0x73, %r23
	.word 0xe0a44400  ! 218: STWA_R	stwa	%r16, [%r17 + %r0] 0x20
	.word 0xe2876000  ! 219: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r17
	mov	0x20, %r19
	mov	0x3f0, %r22
	.word 0xe2a72000  ! 222: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	mov	0x20, %r25
	.word 0xe6bc0400  ! 224: STDA_R	stda	%r19, [%r16 + %r0] 0x20
	mov	0x7e8, %r20
	.word 0xee9dc4a0  ! 226: LDDA_R	ldda	[%r23, %r0] 0x25, %r23
	.word 0x87802025  ! 227: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe28e2000  ! 228: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 229: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2af2000  ! 230: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0xe29f6000  ! 231: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r17
	mov	0x30, %r19
	mov	0x3c8, %r22
	.word 0xe2bfa000  ! 234: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 235: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 236: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2b689e0  ! 237: STHA_R	stha	%r17, [%r26 + %r0] 0x4f
	mov	0x7e8, %r22
	mov	0x60, %r26
	.word 0xe2f7e000  ! 240: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 241: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b46000  ! 242: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	.word 0xe2b46000  ! 243: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	.word 0xe2b4a000  ! 244: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0xe2dca000  ! 245: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r17
	.word 0xe2dca000  ! 246: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r17
	.word 0xe0f6c9e0  ! 247: STXA_R	stxa	%r16, [%r27 + %r0] 0x4f
	.word 0xeca4e000  ! 248: STWA_I	stwa	%r22, [%r19 + 0x0000] %asi
	.word 0xeca4a000  ! 249: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0xecac6000  ! 250: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xecd74e40  ! 251: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	.word 0xea94e000  ! 252: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r21
	mov	0x7e0, %r21
	.word 0xea9ca000  ! 254: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r21
	.word 0xeab46000  ! 255: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xe4f584a0  ! 256: STXA_R	stxa	%r18, [%r22 + %r0] 0x25
	.word 0xe4adc4a0  ! 257: STBA_R	stba	%r18, [%r23 + %r0] 0x25
	.word 0xecac6000  ! 258: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xe2bf0e60  ! 259: STDA_R	stda	%r17, [%r28 + %r0] 0x73
	.word 0x87802073  ! 260: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8bd84a0  ! 261: STDA_R	stda	%r20, [%r22 + %r0] 0x25
	mov	0x7e8, %r21
	.word 0xe4b46000  ! 263: STHA_I	stha	%r18, [%r17 + 0x0000] %asi
	.word 0xe4942000  ! 264: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r18
	.word 0x87802073  ! 265: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2c7ce40  ! 266: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r17
	.word 0xe89ca000  ! 267: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r20
	.word 0x87802025  ! 268: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 269: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8d7e000  ! 270: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	.word 0xe08fce40  ! 271: LDUBA_R	lduba	[%r31, %r0] 0x72, %r16
	.word 0xe2a76000  ! 272: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xeaf609e0  ! 273: STXA_R	stxa	%r21, [%r24 + %r0] 0x4f
	.word 0xe4f584a0  ! 274: STXA_R	stxa	%r18, [%r22 + %r0] 0x25
	.word 0x87802025  ! 275: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac48400  ! 276: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r21
	.word 0xe2b7ce40  ! 277: STHA_R	stha	%r17, [%r31 + %r0] 0x72
	.word 0xeea72000  ! 278: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xe2cc0400  ! 279: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r17
	.word 0xe4ac8400  ! 280: STBA_R	stba	%r18, [%r18 + %r0] 0x20
	.word 0xe6bd04a0  ! 281: STDA_R	stda	%r19, [%r20 + %r0] 0x25
	mov	0x28, %r27
	.word 0xeacfce40  ! 283: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r21
	.word 0xecaf2000  ! 284: STBA_I	stba	%r22, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 285: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 286: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeef7ce60  ! 287: STXA_R	stxa	%r23, [%r31 + %r0] 0x73
	.word 0x87802073  ! 288: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeab74e40  ! 289: STHA_R	stha	%r21, [%r29 + %r0] 0x72
	.word 0xe68ce000  ! 290: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	.word 0xe6f4a000  ! 291: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 292: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6dea000  ! 293: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r19
	.word 0xe8a4c400  ! 294: STWA_R	stwa	%r20, [%r19 + %r0] 0x20
	.word 0x87802025  ! 295: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8be2000  ! 296: STDA_I	stda	%r20, [%r24 + 0x0000] %asi
	.word 0xe8dee000  ! 297: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r20
	mov	0x68, %r16
	mov	0x7d8, %r22
	.word 0x8780204f  ! 300: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x50, %r19
	mov	0x7f8, %r21
	.word 0x87802073  ! 303: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 304: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeedf4e60  ! 305: LDXA_R	ldxa	[%r29, %r0] 0x73, %r23
	mov	0x40, %r27
	.word 0xecdca000  ! 307: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r22
	.word 0xecdce000  ! 308: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r22
	.word 0x87802025  ! 309: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6cf8e40  ! 310: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r19
	.word 0xe6be2000  ! 311: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	.word 0xe6a62000  ! 312: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0xe69ee000  ! 313: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r19
	.word 0xe6a6e000  ! 314: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0xe4aec9e0  ! 315: STBA_R	stba	%r18, [%r27 + %r0] 0x4f
	.word 0xe8f62000  ! 316: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	.word 0xe8f6e000  ! 317: STXA_I	stxa	%r20, [%r27 + 0x0000] %asi
	mov	0x30, %r17
	.word 0xecb44400  ! 319: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	mov	0x3f0, %r21
	.word 0x87802074  ! 321: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeabd04a0  ! 322: STDA_R	stda	%r21, [%r20 + %r0] 0x25
	mov	0x70, %r26
	.word 0xe0afa000  ! 324: STBA_I	stba	%r16, [%r30 + 0x0000] %asi
	.word 0xe0c584a0  ! 325: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r16
	.word 0x8780204f  ! 326: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x58, %r25
	mov	0x60, %r16
	.word 0xeacf8e60  ! 329: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r21
	.word 0xe0a7e000  ! 330: STWA_I	stwa	%r16, [%r31 + 0x0000] %asi
	mov	0x18, %r26
	.word 0xe8ac0400  ! 332: STBA_R	stba	%r20, [%r16 + %r0] 0x20
	.word 0xe2d72000  ! 333: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0x87802020  ! 334: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r19
	.word 0xeef70e60  ! 336: STXA_R	stxa	%r23, [%r28 + %r0] 0x73
	.word 0xe09609e0  ! 337: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r16
	.word 0xec9f0e80  ! 338: LDDA_R	ldda	[%r28, %r0] 0x74, %r22
	.word 0xe68d6000  ! 339: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe685a000  ! 340: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r19
	.word 0xe6d56000  ! 341: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r19
	.word 0x87802020  ! 342: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6942000  ! 343: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r19
	mov	0x7f8, %r23
	mov	0x28, %r17
	.word 0xe6a4a000  ! 346: STWA_I	stwa	%r19, [%r18 + 0x0000] %asi
	.word 0x87802073  ! 347: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7f8, %r23
	.word 0xe6bf2000  ! 349: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0xe6cfe000  ! 350: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0x87802073  ! 351: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 352: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x38, %r24
	.word 0x87802072  ! 354: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe687a000  ! 355: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe6bf2000  ! 356: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0xe6dec9e0  ! 357: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r19
	.word 0xe0f70e60  ! 358: STXA_R	stxa	%r16, [%r28 + %r0] 0x73
	.word 0xecb72000  ! 359: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xe6bf4e80  ! 360: STDA_R	stda	%r19, [%r29 + %r0] 0x74
	.word 0xe0f70e80  ! 361: STXA_R	stxa	%r16, [%r28 + %r0] 0x74
	.word 0xe4df0e60  ! 362: LDXA_R	ldxa	[%r28, %r0] 0x73, %r18
	mov	0x40, %r24
	.word 0xeaf7e000  ! 364: STXA_I	stxa	%r21, [%r31 + 0x0000] %asi
	.word 0xe2cc0400  ! 365: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r17
	.word 0xe4af2000  ! 366: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 367: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 368: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x10, %r27
	.word 0xe4b44400  ! 370: STHA_R	stha	%r18, [%r17 + %r0] 0x20
	.word 0xeeaf2000  ! 371: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeeb48400  ! 372: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0xe0b76000  ! 373: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xe0dfa000  ! 374: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r16
	.word 0xeef40400  ! 375: STXA_R	stxa	%r23, [%r16 + %r0] 0x20
	.word 0xeef44400  ! 376: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	.word 0xe8dfce60  ! 377: LDXA_R	ldxa	[%r31, %r0] 0x73, %r20
	.word 0xecbcc400  ! 378: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0xe6c70e40  ! 379: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r19
	.word 0x87802020  ! 380: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4a7ce40  ! 381: STWA_R	stwa	%r18, [%r31 + %r0] 0x72
	.word 0xeecd84a0  ! 382: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r23
	.word 0x87802020  ! 383: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f42000  ! 384: STXA_I	stxa	%r20, [%r16 + 0x0000] %asi
	mov	0x70, %r18
	.word 0xea874e80  ! 386: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r21
	mov	0x70, %r24
	mov	0x48, %r19
	.word 0xe08ca000  ! 389: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r16
	.word 0xe0bca000  ! 390: STDA_I	stda	%r16, [%r18 + 0x0000] %asi
	mov	0x20, %r16
	.word 0xe0cd84a0  ! 392: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r16
	.word 0xee9ec9e0  ! 393: LDDA_R	ldda	[%r27, %r0] 0x4f, %r23
	.word 0x87802073  ! 394: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe08f4e80  ! 395: LDUBA_R	lduba	[%r29, %r0] 0x74, %r16
	.word 0xe4f609e0  ! 396: STXA_R	stxa	%r18, [%r24 + %r0] 0x4f
	.word 0xe0b48400  ! 397: STHA_R	stha	%r16, [%r18 + %r0] 0x20
	.word 0xee95c4a0  ! 398: LDUHA_R	lduha	[%r23, %r0] 0x25, %r23
	.word 0xecbce000  ! 399: STDA_I	stda	%r22, [%r19 + 0x0000] %asi
	.word 0xecc4a000  ! 400: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r22
	.word 0x87802025  ! 401: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3c8, %r22
	.word 0xec876000  ! 403: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r22
	.word 0xecdf2000  ! 404: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xecdf2000  ! 405: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xe09c4400  ! 406: LDDA_R	ldda	[%r17, %r0] 0x20, %r16
	.word 0xeea72000  ! 407: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 408: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b70e40  ! 409: STHA_R	stha	%r17, [%r28 + %r0] 0x72
	mov	0x3d8, %r22
	.word 0x87802020  ! 411: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x10, %r25
	.word 0xe49ce000  ! 413: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r18
	mov	0x0, %r24
	.word 0x87802074  ! 415: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7e0, %r21
	.word 0xeaa70e40  ! 417: STWA_R	stwa	%r21, [%r28 + %r0] 0x72
	mov	0x78, %r24
	.word 0xe0b6c9e0  ! 419: STHA_R	stha	%r16, [%r27 + %r0] 0x4f
	.word 0xe0d76000  ! 420: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r16
	mov	0x70, %r19
	.word 0xecf48400  ! 422: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802074  ! 424: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0b7ce60  ! 425: STHA_R	stha	%r16, [%r31 + %r0] 0x73
	mov	0x7e0, %r21
	.word 0xe2afa000  ! 427: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe29fe000  ! 428: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r17
	.word 0xe2a7a000  ! 429: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0xe2b72000  ! 430: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 431: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x0, %r24
	.word 0xe2b6a000  ! 433: STHA_I	stha	%r17, [%r26 + 0x0000] %asi
	.word 0xeca7ce60  ! 434: STWA_R	stwa	%r22, [%r31 + %r0] 0x73
	.word 0xeaf48400  ! 435: STXA_R	stxa	%r21, [%r18 + %r0] 0x20
	.word 0xeebec9e0  ! 436: STDA_R	stda	%r23, [%r27 + %r0] 0x4f
	.word 0x87802025  ! 437: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 438: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 439: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r24
	.word 0xe0bf4e60  ! 441: STDA_R	stda	%r16, [%r29 + %r0] 0x73
	.word 0xe2bd84a0  ! 442: STDA_R	stda	%r17, [%r22 + %r0] 0x25
	.word 0xe6872000  ! 443: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6afa000  ! 444: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6d7e000  ! 446: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
	.word 0xe6a76000  ! 447: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	mov	0x58, %r17
	mov	0x3e8, %r23
	.word 0xe2cf8e80  ! 450: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r17
	.word 0xe8f7e000  ! 451: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0x87802072  ! 452: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8bda000  ! 453: STDA_I	stda	%r20, [%r22 + 0x0000] %asi
	.word 0xeeb4c400  ! 454: STHA_R	stha	%r23, [%r19 + %r0] 0x20
	.word 0xea956000  ! 455: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r21
	.word 0xead5e000  ! 456: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r21
	.word 0xeaa56000  ! 457: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0xe4d504a0  ! 458: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r18
	.word 0xecb52000  ! 459: STHA_I	stha	%r22, [%r20 + 0x0000] %asi
	.word 0xecdf0e60  ! 460: LDXA_R	ldxa	[%r28, %r0] 0x73, %r22
	.word 0xe29d2000  ! 461: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r17
	.word 0xe285a000  ! 462: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r17
	mov	0x3d0, %r20
	.word 0x87802025  ! 464: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe297e000  ! 465: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 466: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaac4400  ! 467: STBA_R	stba	%r21, [%r17 + %r0] 0x20
	mov	0x7d0, %r23
	.word 0x87802025  ! 469: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb78e80  ! 470: STHA_R	stha	%r22, [%r30 + %r0] 0x74
	.word 0xe6942000  ! 471: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r19
	.word 0xe68c2000  ! 472: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	mov	0x50, %r19
	.word 0xe68c6000  ! 474: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r19
	.word 0xe6f42000  ! 475: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0xeef544a0  ! 476: STXA_R	stxa	%r23, [%r21 + %r0] 0x25
	.word 0xe894e000  ! 477: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 478: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x48, %r27
	.word 0x87802020  ! 480: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e8, %r21
	mov	0x0, %r19
	.word 0xe8b6a000  ! 483: STHA_I	stha	%r20, [%r26 + 0x0000] %asi
	.word 0xe8b6e000  ! 484: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0x87802020  ! 485: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a4e000  ! 486: STWA_I	stwa	%r20, [%r19 + 0x0000] %asi
	mov	0x3c0, %r21
	.word 0x87802074  ! 488: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeacd44a0  ! 489: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r21
	mov	0x7f0, %r22
	.word 0xe0bd2000  ! 491: STDA_I	stda	%r16, [%r20 + 0x0000] %asi
	.word 0xe0f5e000  ! 492: STXA_I	stxa	%r16, [%r23 + 0x0000] %asi
	mov	0x3e8, %r21
	mov	0x7d8, %r21
	mov	0x3f8, %r23
	.word 0xe2af8e80  ! 496: STBA_R	stba	%r17, [%r30 + %r0] 0x74
	.word 0xecd52000  ! 497: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r22
	.word 0xeead44a0  ! 498: STBA_R	stba	%r23, [%r21 + %r0] 0x25
	mov	0x7e8, %r21
	.word 0xeacd6000  ! 500: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r21
	.word 0xeccf4e80  ! 501: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r22
	.word 0xe6a5a000  ! 502: STWA_I	stwa	%r19, [%r22 + 0x0000] %asi
	.word 0xeecf0e40  ! 503: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r23
	.word 0xe69fce40  ! 504: LDDA_R	ldda	[%r31, %r0] 0x72, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802073  ! 506: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8c56000  ! 507: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r20
	mov	0x3e8, %r21
	.word 0xe8cda000  ! 509: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r20
	mov	0x3f0, %r23
	.word 0xeca74e80  ! 511: STWA_R	stwa	%r22, [%r29 + %r0] 0x74
	.word 0xee95e000  ! 512: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r23
	mov	0x48, %r18
	.word 0xe4f4c400  ! 514: STXA_R	stxa	%r18, [%r19 + %r0] 0x20
	ta	T_CHANGE_PRIV	! macro
	mov	0x3c8, %r23
	.word 0xe09d2000  ! 517: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r16
	mov	0x20, %r26
	mov	0x50, %r16
	.word 0xe8a7ce40  ! 520: STWA_R	stwa	%r20, [%r31 + %r0] 0x72
	ta	T_CHANGE_PRIV	! macro
	.word 0xe8c52000  ! 522: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r20
	.word 0xe8b56000  ! 523: STHA_I	stha	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a52000  ! 524: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0x87802074  ! 525: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x0, %r25
	mov	0x7e0, %r22
	.word 0xe8c44400  ! 528: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r20
	mov	0x78, %r17
	mov	0x48, %r25
	.word 0x87802072  ! 531: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2ac6000  ! 532: STBA_I	stba	%r17, [%r17 + 0x0000] %asi
	.word 0xe2c42000  ! 533: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r17
	.word 0x87802020  ! 534: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x58, %r19
	.word 0xe2846000  ! 536: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r17
	.word 0xeca689e0  ! 537: STWA_R	stwa	%r22, [%r26 + %r0] 0x4f
	.word 0xeebf4e80  ! 538: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xe2bca000  ! 539: STDA_I	stda	%r17, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 540: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2cf8e60  ! 541: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r17
	.word 0xeab76000  ! 542: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 543: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea8fe000  ! 544: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r21
	mov	0x30, %r27
	.word 0x87802020  ! 546: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x58, %r16
	.word 0xeab48400  ! 548: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xe68e89e0  ! 549: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r19
	mov	0x8, %r24
	mov	0x40, %r18
	.word 0xe8dc8400  ! 552: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	mov	0x50, %r25
	.word 0xe89fce60  ! 554: LDDA_R	ldda	[%r31, %r0] 0x73, %r20
	.word 0xeedde000  ! 555: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r23
	.word 0xe8d7ce80  ! 556: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r20
	.word 0xeaf5e000  ! 557: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0xe2978e40  ! 558: LDUHA_R	lduha	[%r30, %r0] 0x72, %r17
	.word 0xe4ad2000  ! 559: STBA_I	stba	%r18, [%r20 + 0x0000] %asi
	.word 0xe6840400  ! 560: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r19
	.word 0xeeade000  ! 561: STBA_I	stba	%r23, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 562: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeef7a000  ! 563: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xe2cf8e60  ! 564: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r17
	.word 0xeef7a000  ! 565: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	mov	0x0, %r25
	.word 0xeadf4e80  ! 567: LDXA_R	ldxa	[%r29, %r0] 0x74, %r21
	.word 0x87802072  ! 568: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe894a000  ! 569: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8a4e000  ! 570: STWA_I	stwa	%r20, [%r19 + 0x0000] %asi
	.word 0xe6f74e80  ! 571: STXA_R	stxa	%r19, [%r29 + %r0] 0x74
	.word 0xe2bf0e60  ! 572: STDA_R	stda	%r17, [%r28 + %r0] 0x73
	.word 0xee94a000  ! 573: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r23
	.word 0xeec46000  ! 574: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r23
	mov	0x68, %r16
	.word 0x87802074  ! 576: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r26
	mov	0x38, %r25
	.word 0x87802020  ! 579: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r27
	.word 0x87802020  ! 581: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeaf6000  ! 582: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	mov	0x7f0, %r21
	.word 0xeed72000  ! 584: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0x87802025  ! 585: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x78, %r27
	.word 0xea970e40  ! 587: LDUHA_R	lduha	[%r28, %r0] 0x72, %r21
	.word 0xe6870e60  ! 588: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r19
	.word 0xecdf6000  ! 589: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0x87802020  ! 590: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc76000  ! 591: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r22
	.word 0x87802072  ! 592: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecdc6000  ! 593: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r22
	mov	0x38, %r25
	.word 0x87802020  ! 595: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebc0400  ! 596: STDA_R	stda	%r23, [%r16 + %r0] 0x20
	mov	0x68, %r19
	.word 0xeadf8e80  ! 598: LDXA_R	ldxa	[%r30, %r0] 0x74, %r21
	mov	0x3c0, %r23
	mov	0x50, %r18
	.word 0xe8bc2000  ! 601: STDA_I	stda	%r20, [%r16 + 0x0000] %asi
	.word 0xe8cc2000  ! 602: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r20
	.word 0x87802072  ! 603: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8af0e60  ! 604: STBA_R	stba	%r20, [%r28 + %r0] 0x73
	.word 0xe6bfce80  ! 605: STDA_R	stda	%r19, [%r31 + %r0] 0x74
	.word 0xe0aee000  ! 606: STBA_I	stba	%r16, [%r27 + 0x0000] %asi
	mov	0x38, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe4dec9e0  ! 609: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r18
	mov	0x7d0, %r23
	.word 0xe8862000  ! 611: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r20
	.word 0xec8f8e60  ! 612: LDUBA_R	lduba	[%r30, %r0] 0x73, %r22
	.word 0xeea44400  ! 613: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	.word 0xe6f4c400  ! 614: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	.word 0xe6af4e40  ! 615: STBA_R	stba	%r19, [%r29 + %r0] 0x72
	mov	0x7d8, %r21
	.word 0xeac62000  ! 617: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r21
	.word 0xeaf66000  ! 618: STXA_I	stxa	%r21, [%r25 + 0x0000] %asi
	.word 0xe6878e40  ! 619: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r19
	.word 0xe6f74e40  ! 620: STXA_R	stxa	%r19, [%r29 + %r0] 0x72
	.word 0x87802074  ! 621: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 622: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf76000  ! 623: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 624: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab7e000  ! 625: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xea97a000  ! 626: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0x87802074  ! 627: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea9f6000  ! 628: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r21
	mov	0x18, %r17
	mov	0x70, %r26
	.word 0xeaf72000  ! 631: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xe0cec9e0  ! 632: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r16
	.word 0xe4cfa000  ! 633: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r18
	.word 0x87802074  ! 634: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r27
	.word 0xecaf0e60  ! 636: STBA_R	stba	%r22, [%r28 + %r0] 0x73
	mov	0x0, %r26
	.word 0xe2a6c9e0  ! 638: STWA_R	stwa	%r17, [%r27 + %r0] 0x4f
	.word 0xe48f0e40  ! 639: LDUBA_R	lduba	[%r28, %r0] 0x72, %r18
	.word 0xe4dec9e0  ! 640: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r18
	mov	0x58, %r25
	.word 0xe0afe000  ! 642: STBA_I	stba	%r16, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 643: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 644: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 645: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 646: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0f72000  ! 647: STXA_I	stxa	%r16, [%r28 + 0x0000] %asi
	.word 0xe2af0e80  ! 648: STBA_R	stba	%r17, [%r28 + %r0] 0x74
	.word 0xe2972000  ! 649: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	.word 0xe4c74e60  ! 650: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r18
	mov	0x38, %r16
	.word 0xea97e000  ! 652: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xee9dc4a0  ! 653: LDDA_R	ldda	[%r23, %r0] 0x25, %r23
	.word 0xea9584a0  ! 654: LDUHA_R	lduha	[%r22, %r0] 0x25, %r21
	mov	0x3e8, %r21
	.word 0xe897e000  ! 656: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe2af4e60  ! 657: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xe6a78e80  ! 658: STWA_R	stwa	%r19, [%r30 + %r0] 0x74
	mov	0x7e0, %r20
	.word 0xe8dfce80  ! 660: LDXA_R	ldxa	[%r31, %r0] 0x74, %r20
	mov	0x58, %r24
	mov	0x7e8, %r21
	.word 0xe8bd84a0  ! 663: STDA_R	stda	%r20, [%r22 + %r0] 0x25
	.word 0xe48fe000  ! 664: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0xe2df4e60  ! 665: LDXA_R	ldxa	[%r29, %r0] 0x73, %r17
	.word 0xeac7a000  ! 666: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	mov	0x68, %r24
	mov	0x3c0, %r21
	.word 0xe2970e40  ! 669: LDUHA_R	lduha	[%r28, %r0] 0x72, %r17
	.word 0xeacfe000  ! 670: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r21
	.word 0xeab7e000  ! 671: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x3c0, %r21
	.word 0xe096c9e0  ! 673: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r16
	mov	0x3f8, %r21
	.word 0xe2df2000  ! 675: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r17
	.word 0xe8f4c400  ! 676: STXA_R	stxa	%r20, [%r19 + %r0] 0x20
	.word 0xecdf6000  ! 677: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	mov	0x18, %r26
	.word 0xecbfe000  ! 679: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	mov	0x3f8, %r22
	mov	0x28, %r24
	.word 0xe8cf8e80  ! 682: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r20
	.word 0xea9fa000  ! 683: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	mov	0x30, %r27
	.word 0xeacf6000  ! 685: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r21
	.word 0xecac0400  ! 686: STBA_R	stba	%r22, [%r16 + %r0] 0x20
	.word 0x87802073  ! 687: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2d46000  ! 688: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r17
	.word 0xe28ce000  ! 689: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r17
	.word 0xe2b42000  ! 690: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	mov	0x60, %r17
	.word 0xe284e000  ! 692: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r17
	.word 0xe2f42000  ! 693: STXA_I	stxa	%r17, [%r16 + 0x0000] %asi
	.word 0xe2a4a000  ! 694: STWA_I	stwa	%r17, [%r18 + 0x0000] %asi
	.word 0x87802073  ! 695: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2a52000  ! 696: STWA_I	stwa	%r17, [%r20 + 0x0000] %asi
	mov	0x7f8, %r21
	.word 0xe29d6000  ! 698: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r17
	.word 0xe2dda000  ! 699: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r17
	.word 0xeecf8e80  ! 700: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r23
	.word 0xe8d5a000  ! 701: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r20
	.word 0xe09f4e60  ! 702: LDDA_R	ldda	[%r29, %r0] 0x73, %r16
	ta	T_CHANGE_HPRIV	! macro
	mov	0x60, %r18
	mov	0x7c0, %r22
	.word 0xe6ac4400  ! 706: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	mov	0x3f0, %r23
	.word 0xe0dda000  ! 708: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r16
	.word 0xe0ada000  ! 709: STBA_I	stba	%r16, [%r22 + 0x0000] %asi
	.word 0xe88544a0  ! 710: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r20
	.word 0xe6dfce60  ! 711: LDXA_R	ldxa	[%r31, %r0] 0x73, %r19
	.word 0xe8c56000  ! 712: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r20
	mov	0x60, %r17
	.word 0xeebc4400  ! 714: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	.word 0x87802020  ! 715: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab6e000  ! 716: STHA_I	stha	%r21, [%r27 + 0x0000] %asi
	.word 0xec9c0400  ! 717: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0x87802025  ! 718: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 719: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2a6a000  ! 720: STWA_I	stwa	%r17, [%r26 + 0x0000] %asi
	.word 0xe2c62000  ! 721: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r17
	.word 0xee8fce40  ! 722: LDUBA_R	lduba	[%r31, %r0] 0x72, %r23
	.word 0xe2c6a000  ! 723: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r17
	.word 0xeed40400  ! 724: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r23
	.word 0x8780204f  ! 725: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 726: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea7a000  ! 727: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	mov	0x48, %r26
	mov	0x18, %r17
	mov	0x70, %r24
	mov	0x3d0, %r21
	.word 0xec978e80  ! 732: LDUHA_R	lduha	[%r30, %r0] 0x74, %r22
	.word 0xe88649e0  ! 733: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r20
	.word 0x87802020  ! 734: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 735: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea6a000  ! 736: STWA_I	stwa	%r23, [%r26 + 0x0000] %asi
	mov	0x3f0, %r20
	mov	0x3e8, %r23
	.word 0x87802025  ! 739: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 740: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x10, %r19
	.word 0xeeb42000  ! 742: STHA_I	stha	%r23, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 743: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea76000  ! 744: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xeedfe000  ! 745: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x3c0, %r23
	mov	0x18, %r26
	.word 0xecc4c400  ! 748: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r22
	mov	0x3d8, %r23
	mov	0x3e8, %r20
	.word 0xe8f40400  ! 751: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
	mov	0x48, %r27
	.word 0x87802073  ! 753: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6f46000  ! 754: STXA_I	stxa	%r19, [%r17 + 0x0000] %asi
	mov	0x30, %r16
	.word 0x87802020  ! 756: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6d6a000  ! 757: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	.word 0x87802025  ! 758: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6aca000  ! 759: STBA_I	stba	%r19, [%r18 + 0x0000] %asi
	.word 0xe68c2000  ! 760: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xe6a42000  ! 761: STWA_I	stwa	%r19, [%r16 + 0x0000] %asi
	mov	0x48, %r27
	.word 0xe6f544a0  ! 763: STXA_R	stxa	%r19, [%r21 + %r0] 0x25
	mov	0x7e8, %r20
	.word 0xeeac2000  ! 765: STBA_I	stba	%r23, [%r16 + 0x0000] %asi
	.word 0xe8978e80  ! 766: LDUHA_R	lduha	[%r30, %r0] 0x74, %r20
	.word 0x87802074  ! 767: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2878e80  ! 768: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r17
	mov	0x7d0, %r22
	mov	0x50, %r24
	mov	0x38, %r16
	.word 0xe8b40400  ! 772: STHA_R	stha	%r20, [%r16 + %r0] 0x20
	.word 0x87802020  ! 773: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r19
	.word 0xe8b72000  ! 775: STHA_I	stha	%r20, [%r28 + 0x0000] %asi
	.word 0xec9689e0  ! 776: LDUHA_R	lduha	[%r26, %r0] 0x4f, %r22
	.word 0xeaf544a0  ! 777: STXA_R	stxa	%r21, [%r21 + %r0] 0x25
	.word 0x87802072  ! 778: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6ac4400  ! 779: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	.word 0xeca76000  ! 780: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xec9fa000  ! 781: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r22
	mov	0x3c8, %r20
	.word 0xecbfa000  ! 783: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeccfe000  ! 784: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r22
	.word 0xecf7e000  ! 785: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xe0c78e40  ! 786: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r16
	.word 0xe8a76000  ! 787: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xeec609e0  ! 788: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r23
	mov	0x7c0, %r23
	.word 0xec97ce80  ! 790: LDUHA_R	lduha	[%r31, %r0] 0x74, %r22
	.word 0xe49c0400  ! 791: LDDA_R	ldda	[%r16, %r0] 0x20, %r18
	.word 0x87802020  ! 792: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec948400  ! 793: LDUHA_R	lduha	[%r18, %r0] 0x20, %r22
	.word 0xe6cde000  ! 794: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r19
	mov	0x30, %r16
	.word 0xe0af0e80  ! 796: STBA_R	stba	%r16, [%r28 + %r0] 0x74
	mov	0x3c8, %r20
	.word 0xe2bc4400  ! 798: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	.word 0x87802020  ! 799: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r27
	.word 0xe8b66000  ! 801: STHA_I	stha	%r20, [%r25 + 0x0000] %asi
	.word 0xe8bf8e80  ! 802: STDA_R	stda	%r20, [%r30 + %r0] 0x74
	.word 0xe2d6a000  ! 803: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r17
	.word 0xe2dee000  ! 804: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r17
	.word 0xe2d6e000  ! 805: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	mov	0x18, %r27
	.word 0xe0df4e40  ! 807: LDXA_R	ldxa	[%r29, %r0] 0x72, %r16
	.word 0xeaa78e60  ! 808: STWA_R	stwa	%r21, [%r30 + %r0] 0x73
	.word 0xe2a544a0  ! 809: STWA_R	stwa	%r17, [%r21 + %r0] 0x25
	.word 0xe6bf8e80  ! 810: STDA_R	stda	%r19, [%r30 + %r0] 0x74
	.word 0xeab6a000  ! 811: STHA_I	stha	%r21, [%r26 + 0x0000] %asi
	mov	0x3e8, %r22
	.word 0xeaa62000  ! 813: STWA_I	stwa	%r21, [%r24 + 0x0000] %asi
	.word 0xead66000  ! 814: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r21
	.word 0xee9e49e0  ! 815: LDDA_R	ldda	[%r25, %r0] 0x4f, %r23
	.word 0xe2d78e40  ! 816: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r17
	.word 0xe4f44400  ! 817: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xe2b74e80  ! 818: STHA_R	stha	%r17, [%r29 + %r0] 0x74
	mov	0x38, %r17
	.word 0x87802072  ! 820: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xea9fe000  ! 821: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r21
	mov	0x28, %r27
	mov	0x28, %r25
	.word 0x87802073  ! 824: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xead4e000  ! 825: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r21
	.word 0xeaf4a000  ! 826: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x8780204f  ! 827: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4bd44a0  ! 828: STDA_R	stda	%r18, [%r21 + %r0] 0x25
	mov	0x7c8, %r23
	.word 0xe8976000  ! 830: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	mov	0x28, %r27
	.word 0xe8c76000  ! 832: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r20
	.word 0xe897a000  ! 833: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	.word 0xe8c7e000  ! 834: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0xe6bdc4a0  ! 835: STDA_R	stda	%r19, [%r23 + %r0] 0x25
	mov	0x18, %r26
	.word 0xe4978e60  ! 837: LDUHA_R	lduha	[%r30, %r0] 0x73, %r18
	.word 0xec8504a0  ! 838: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r22
	.word 0xea8f2000  ! 839: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r21
	mov	0x68, %r26
	.word 0xeab7e000  ! 841: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x50, %r24
	mov	0x7f8, %r23
	.word 0x87802072  ! 844: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeecf0e40  ! 845: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r23
	.word 0xe2af2000  ! 846: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0xe8cf8e40  ! 847: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r20
	.word 0xe2a7a000  ! 848: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 849: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x60, %r19
	mov	0x0, %r17
	.word 0xe2bfe000  ! 852: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xe2d72000  ! 853: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2d72000  ! 854: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe6c7ce40  ! 855: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r19
	mov	0x48, %r16
	.word 0x87802072  ! 857: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09c6000  ! 858: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r16
	.word 0xe0f44400  ! 859: STXA_R	stxa	%r16, [%r17 + %r0] 0x20
	.word 0xeef46000  ! 860: STXA_I	stxa	%r23, [%r17 + 0x0000] %asi
	.word 0xeea42000  ! 861: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 862: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r25
	.word 0x8780204f  ! 864: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe29c0400  ! 865: LDDA_R	ldda	[%r16, %r0] 0x20, %r17
	mov	0x40, %r19
	.word 0x87802072  ! 867: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 868: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4cf4e60  ! 869: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r18
	.word 0xe4a46000  ! 870: STWA_I	stwa	%r18, [%r17 + 0x0000] %asi
	mov	0x78, %r24
	mov	0x60, %r24
	mov	0x48, %r18
	.word 0xeea78e40  ! 874: STWA_R	stwa	%r23, [%r30 + %r0] 0x72
	mov	0x40, %r25
	.word 0xeace09e0  ! 876: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r21
	.word 0x87802074  ! 877: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeeb7a000  ! 878: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	.word 0xeec72000  ! 879: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r23
	.word 0xee976000  ! 880: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	.word 0xeef7ce60  ! 881: STXA_R	stxa	%r23, [%r31 + %r0] 0x73
	.word 0xe0b649e0  ! 882: STHA_R	stha	%r16, [%r25 + %r0] 0x4f
	.word 0xeeb78e40  ! 883: STHA_R	stha	%r23, [%r30 + %r0] 0x72
	.word 0xe4bf0e40  ! 884: STDA_R	stda	%r18, [%r28 + %r0] 0x72
	.word 0xe0a7e000  ! 885: STWA_I	stwa	%r16, [%r31 + 0x0000] %asi
	.word 0xeabc8400  ! 886: STDA_R	stda	%r21, [%r18 + %r0] 0x20
	.word 0xeeafa000  ! 887: STBA_I	stba	%r23, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 888: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 889: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b48400  ! 890: STHA_R	stha	%r20, [%r18 + %r0] 0x20
	.word 0xe4a6c9e0  ! 891: STWA_R	stwa	%r18, [%r27 + %r0] 0x4f
	.word 0xee87ce80  ! 892: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r23
	mov	0x7d0, %r22
	.word 0x87802072  ! 894: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2c5e000  ! 895: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r17
	.word 0xe4ae89e0  ! 896: STBA_R	stba	%r18, [%r26 + %r0] 0x4f
	.word 0xeed5e000  ! 897: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r23
	mov	0x7f8, %r22
	.word 0xeadf8e80  ! 899: LDXA_R	ldxa	[%r30, %r0] 0x74, %r21
	mov	0x30, %r18
	.word 0xeebc4400  ! 901: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	.word 0xecbdc4a0  ! 902: STDA_R	stda	%r22, [%r23 + %r0] 0x25
	mov	0x3c0, %r20
	mov	0x50, %r27
	.word 0xecbe89e0  ! 905: STDA_R	stda	%r22, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 906: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab4a000  ! 907: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	mov	0x30, %r26
	mov	0x70, %r24
	.word 0x87802020  ! 910: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7d0, %r22
	.word 0x87802025  ! 912: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe89f4e40  ! 913: LDDA_R	ldda	[%r29, %r0] 0x72, %r20
	mov	0x50, %r25
	.word 0xe0cfa000  ! 915: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r16
	.word 0xe0b72000  ! 916: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	mov	0x30, %r25
	.word 0xe0b7a000  ! 918: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xec844400  ! 919: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	.word 0xea8fa000  ! 920: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	.word 0xeebcc400  ! 921: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	mov	0x7f8, %r20
	.word 0xe8dfe000  ! 923: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0xe8a7a000  ! 924: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0x87802073  ! 925: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeecf8e40  ! 926: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r23
	.word 0xecae2000  ! 927: STBA_I	stba	%r22, [%r24 + 0x0000] %asi
	.word 0xec8e6000  ! 928: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r22
	.word 0xeca62000  ! 929: STWA_I	stwa	%r22, [%r24 + 0x0000] %asi
	.word 0xecde2000  ! 930: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r22
	.word 0xeca66000  ! 931: STWA_I	stwa	%r22, [%r25 + 0x0000] %asi
	.word 0xe2dfce80  ! 932: LDXA_R	ldxa	[%r31, %r0] 0x74, %r17
	.word 0xe0d70e80  ! 933: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r16
	.word 0xeeb7ce40  ! 934: STHA_R	stha	%r23, [%r31 + %r0] 0x72
	mov	0x3f8, %r22
	.word 0xe4af8e40  ! 936: STBA_R	stba	%r18, [%r30 + %r0] 0x72
	.word 0xe29d04a0  ! 937: LDDA_R	ldda	[%r20, %r0] 0x25, %r17
	mov	0x20, %r17
	.word 0xe0b4c400  ! 939: STHA_R	stha	%r16, [%r19 + %r0] 0x20
	.word 0xe8b6e000  ! 940: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xe8862000  ! 941: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r20
	mov	0x7c0, %r21
	mov	0x7c0, %r21
	.word 0xe8aee000  ! 944: STBA_I	stba	%r20, [%r27 + 0x0000] %asi
	.word 0xe2dc4400  ! 945: LDXA_R	ldxa	[%r17, %r0] 0x20, %r17
	.word 0xe08ee000  ! 946: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r16
	mov	0x40, %r26
	.word 0xeccf4e80  ! 948: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r22
	mov	0x38, %r19
	.word 0xe6f6e000  ! 950: STXA_I	stxa	%r19, [%r27 + 0x0000] %asi
	.word 0xe6be2000  ! 951: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	.word 0xea8fce60  ! 952: LDUBA_R	lduba	[%r31, %r0] 0x73, %r21
	mov	0x30, %r25
	mov	0x3f8, %r21
	.word 0xec8ee000  ! 955: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r22
	mov	0x18, %r19
	.word 0x87802074  ! 957: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r26
	.word 0x87802072  ! 959: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x78, %r16
	.word 0xe0af8e80  ! 961: STBA_R	stba	%r16, [%r30 + %r0] 0x74
	.word 0xe6c42000  ! 962: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r19
	.word 0xecacc400  ! 963: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xe48d44a0  ! 964: LDUBA_R	lduba	[%r21, %r0] 0x25, %r18
	.word 0xe4a46000  ! 965: STWA_I	stwa	%r18, [%r17 + 0x0000] %asi
	.word 0xee8544a0  ! 966: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r23
	mov	0x60, %r25
	.word 0xe2870e60  ! 968: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r17
	mov	0x7f0, %r21
	.word 0xeabf8e40  ! 970: STDA_R	stda	%r21, [%r30 + %r0] 0x72
	mov	0x18, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeaddc4a0  ! 973: LDXA_R	ldxa	[%r23, %r0] 0x25, %r21
	mov	0x8, %r24
	mov	0x3f8, %r23
	.word 0xecf4a000  ! 976: STXA_I	stxa	%r22, [%r18 + 0x0000] %asi
	.word 0xe6d48400  ! 977: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r19
	.word 0x87802074  ! 978: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeaa44400  ! 979: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xe6b74e40  ! 980: STHA_R	stha	%r19, [%r29 + %r0] 0x72
	.word 0xea9de000  ! 981: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r21
	.word 0xea85e000  ! 982: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r21
	.word 0xec8dc4a0  ! 983: LDUBA_R	lduba	[%r23, %r0] 0x25, %r22
	.word 0x87802072  ! 984: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x8, %r24
	.word 0xea9f8e80  ! 986: LDDA_R	ldda	[%r30, %r0] 0x74, %r21
	mov	0x40, %r26
	.word 0xecac2000  ! 988: STBA_I	stba	%r22, [%r16 + 0x0000] %asi
	mov	0x50, %r27
	.word 0x87802072  ! 990: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09f0e80  ! 991: LDDA_R	ldda	[%r28, %r0] 0x74, %r16
	.word 0xeacea000  ! 992: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r21
	.word 0xeaf6a000  ! 993: STXA_I	stxa	%r21, [%r26 + 0x0000] %asi
	mov	0x38, %r24
	.word 0xeace6000  ! 995: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r21
	.word 0x87802020  ! 996: WRASI_I	wr	%r0, 0x0020, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6dcc400  ! 998: LDXA_R	ldxa	[%r19, %r0] 0x20, %r19
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x7e8, %r23
	.word 0xe0b649e0  ! 1: STHA_R	stha	%r16, [%r25 + %r0] 0x4f
	.word 0x87802025  ! 2: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x58, %r19
	.word 0xe8bc4400  ! 4: STDA_R	stda	%r20, [%r17 + %r0] 0x20
	.word 0xe69c0400  ! 5: LDDA_R	ldda	[%r16, %r0] 0x20, %r19
	.word 0x87802074  ! 6: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2b72000  ! 7: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe4f649e0  ! 8: STXA_R	stxa	%r18, [%r25 + %r0] 0x4f
	.word 0xe6a70e60  ! 9: STWA_R	stwa	%r19, [%r28 + %r0] 0x73
	.word 0xe6c7e000  ! 10: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0xe4dec9e0  ! 11: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r18
	.word 0xeab7e000  ! 12: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	mov	0x20, %r27
	.word 0xeabe09e0  ! 14: STDA_R	stda	%r21, [%r24 + %r0] 0x4f
	mov	0x58, %r17
	.word 0x87802020  ! 16: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0948400  ! 17: LDUHA_R	lduha	[%r18, %r0] 0x20, %r16
	.word 0xe4c5c4a0  ! 18: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r18
	mov	0x7e0, %r22
	.word 0xe4872000  ! 20: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0xe4df2000  ! 21: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	.word 0xe4cf2000  ! 22: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4a7a000  ! 23: STWA_I	stwa	%r18, [%r30 + 0x0000] %asi
	mov	0x10, %r27
	mov	0x28, %r19
	.word 0xeadfce60  ! 26: LDXA_R	ldxa	[%r31, %r0] 0x73, %r21
	.word 0xe8af6000  ! 27: STBA_I	stba	%r20, [%r29 + 0x0000] %asi
	.word 0xe8af2000  ! 28: STBA_I	stba	%r20, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 29: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea870e40  ! 30: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r21
	.word 0xe6c4c400  ! 31: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r19
	.word 0xe8b72000  ! 32: STHA_I	stha	%r20, [%r28 + 0x0000] %asi
	.word 0xe8a7e000  ! 33: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	mov	0x8, %r16
	mov	0x8, %r24
	.word 0x8780204f  ! 36: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8ce6000  ! 37: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r20
	.word 0xecb70e40  ! 38: STHA_R	stha	%r22, [%r28 + %r0] 0x72
	.word 0x87802025  ! 39: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecdc4400  ! 40: LDXA_R	ldxa	[%r17, %r0] 0x20, %r22
	mov	0x7d8, %r21
	.word 0xe49e49e0  ! 42: LDDA_R	ldda	[%r25, %r0] 0x4f, %r18
	.word 0x87802020  ! 43: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeef6e000  ! 44: STXA_I	stxa	%r23, [%r27 + 0x0000] %asi
	.word 0xe0bdc4a0  ! 45: STDA_R	stda	%r16, [%r23 + %r0] 0x25
	.word 0xeecea000  ! 46: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 47: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 48: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea870e40  ! 49: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r21
	mov	0x3e0, %r20
	.word 0xe6b689e0  ! 51: STHA_R	stha	%r19, [%r26 + %r0] 0x4f
	mov	0x0, %r18
	.word 0xeab48400  ! 53: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0x87802020  ! 54: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6d78e60  ! 55: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r19
	.word 0x87802072  ! 56: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09c8400  ! 57: LDDA_R	ldda	[%r18, %r0] 0x20, %r16
	.word 0x87802074  ! 58: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 59: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0be2000  ! 60: STDA_I	stda	%r16, [%r24 + 0x0000] %asi
	.word 0xeef504a0  ! 61: STXA_R	stxa	%r23, [%r20 + %r0] 0x25
	.word 0xe0cfce40  ! 62: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r16
	.word 0xee870e80  ! 63: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r23
	mov	0x48, %r27
	mov	0x60, %r17
	mov	0x7e8, %r21
	.word 0xe8ce6000  ! 67: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r20
	.word 0xe88e6000  ! 68: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r20
	.word 0x87802020  ! 69: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 70: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 71: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe88ce000  ! 72: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 73: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 74: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe896a000  ! 75: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r20
	mov	0x10, %r18
	mov	0x3e0, %r23
	.word 0x87802020  ! 78: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r25
	.word 0xe8f62000  ! 80: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	.word 0xecaec9e0  ! 81: STBA_R	stba	%r22, [%r27 + %r0] 0x4f
	.word 0xe2d504a0  ! 82: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r17
	.word 0x87802020  ! 83: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 84: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbe6000  ! 85: STDA_I	stda	%r22, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 86: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc76000  ! 87: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r22
	mov	0x30, %r24
	.word 0xecbfa000  ! 89: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeaa4c400  ! 90: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	mov	0x7e0, %r21
	.word 0xe4b7e000  ! 92: STHA_I	stha	%r18, [%r31 + 0x0000] %asi
	.word 0xeacf4e40  ! 93: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r21
	.word 0xeaf72000  ! 94: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xeab7a000  ! 95: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	mov	0x60, %r19
	.word 0xeaf76000  ! 97: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xeaafa000  ! 98: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xeab76000  ! 99: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x8, %r19
	.word 0xead76000  ! 101: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	mov	0x7e0, %r22
	mov	0x10, %r18
	mov	0x7f8, %r23
	.word 0xeedd04a0  ! 105: LDXA_R	ldxa	[%r20, %r0] 0x25, %r23
	mov	0x30, %r27
	mov	0x7c8, %r23
	mov	0x8, %r17
	.word 0xe88689e0  ! 109: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r20
	mov	0x50, %r27
	.word 0xe4b76000  ! 111: STHA_I	stha	%r18, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 112: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x50, %r16
	.word 0xecf40400  ! 114: STXA_R	stxa	%r22, [%r16 + %r0] 0x20
	.word 0xecbc4400  ! 115: STDA_R	stda	%r22, [%r17 + %r0] 0x20
	.word 0xe69f2000  ! 116: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r19
	mov	0x7f0, %r22
	.word 0xeef44400  ! 118: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	.word 0xe4afce60  ! 119: STBA_R	stba	%r18, [%r31 + %r0] 0x73
	mov	0x28, %r18
	.word 0xe687e000  ! 121: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6afa000  ! 122: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 123: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x38, %r25
	mov	0x3d0, %r20
	.word 0xe6a72000  ! 126: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	.word 0xe2870e60  ! 127: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r17
	.word 0xe6b76000  ! 128: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xecbd04a0  ! 129: STDA_R	stda	%r22, [%r20 + %r0] 0x25
	.word 0x87802074  ! 130: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r26
	mov	0x3d8, %r22
	.word 0xe0ac0400  ! 133: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	.word 0xe2c7a000  ! 134: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0x87802073  ! 135: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 136: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2bfa000  ! 137: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	mov	0x3f0, %r22
	.word 0x87802025  ! 139: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea9d44a0  ! 140: LDDA_R	ldda	[%r21, %r0] 0x25, %r21
	.word 0xea9de000  ! 141: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r21
	.word 0xeecdc4a0  ! 142: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r23
	.word 0xea9da000  ! 143: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	.word 0xeadd6000  ! 144: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r21
	mov	0x50, %r19
	mov	0x7d8, %r21
	.word 0xea8d6000  ! 147: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r21
	.word 0xeaa56000  ! 148: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0xeaf5e000  ! 149: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0xeacd2000  ! 150: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r21
	.word 0xeaade000  ! 151: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	.word 0xeabde000  ! 152: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	mov	0x60, %r17
	.word 0xe68649e0  ! 154: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r19
	.word 0xe0f70e60  ! 155: STXA_R	stxa	%r16, [%r28 + %r0] 0x73
	.word 0xe6cd6000  ! 156: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r19
	mov	0x10, %r25
	.word 0xe6856000  ! 158: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r19
	.word 0xe69d6000  ! 159: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r19
	mov	0x0, %r24
	.word 0xe6c5a000  ! 161: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r19
	mov	0x7f0, %r20
	mov	0x3e8, %r22
	.word 0xe6ad2000  ! 164: STBA_I	stba	%r19, [%r20 + 0x0000] %asi
	.word 0xe8cf4e80  ! 165: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r20
	.word 0xe49e49e0  ! 166: LDDA_R	ldda	[%r25, %r0] 0x4f, %r18
	mov	0x3d8, %r21
	.word 0xe6b52000  ! 168: STHA_I	stha	%r19, [%r20 + 0x0000] %asi
	.word 0xe0a44400  ! 169: STWA_R	stwa	%r16, [%r17 + %r0] 0x20
	.word 0xecbf0e60  ! 170: STDA_R	stda	%r22, [%r28 + %r0] 0x73
	.word 0xea9d6000  ! 171: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	.word 0x87802020  ! 172: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x58, %r16
	.word 0xeabd6000  ! 174: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	.word 0xe4970e40  ! 175: LDUHA_R	lduha	[%r28, %r0] 0x72, %r18
	mov	0x18, %r27
	mov	0x18, %r26
	.word 0xe68da000  ! 178: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r19
	.word 0xe68d2000  ! 179: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r19
	.word 0xe6952000  ! 180: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r19
	.word 0xeabe09e0  ! 181: STDA_R	stda	%r21, [%r24 + %r0] 0x4f
	.word 0xe8ac0400  ! 182: STBA_R	stba	%r20, [%r16 + %r0] 0x20
	.word 0xe2bf8e80  ! 183: STDA_R	stda	%r17, [%r30 + %r0] 0x74
	.word 0xe2b5a000  ! 184: STHA_I	stha	%r17, [%r22 + 0x0000] %asi
	.word 0xe2b5a000  ! 185: STHA_I	stha	%r17, [%r22 + 0x0000] %asi
	mov	0x38, %r26
	.word 0xeedc4400  ! 187: LDXA_R	ldxa	[%r17, %r0] 0x20, %r23
	.word 0xe4cda000  ! 188: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r18
	mov	0x78, %r17
	mov	0x48, %r18
	.word 0x87802073  ! 191: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeea70e60  ! 192: STWA_R	stwa	%r23, [%r28 + %r0] 0x73
	.word 0xe0df4e80  ! 193: LDXA_R	ldxa	[%r29, %r0] 0x74, %r16
	.word 0xe2a74e80  ! 194: STWA_R	stwa	%r17, [%r29 + %r0] 0x74
	.word 0xec87ce60  ! 195: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r22
	.word 0xeaa5c4a0  ! 196: STWA_R	stwa	%r21, [%r23 + %r0] 0x25
	.word 0xeab4c400  ! 197: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	.word 0xeeb46000  ! 198: STHA_I	stha	%r23, [%r17 + 0x0000] %asi
	.word 0xeec4a000  ! 199: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r23
	.word 0xeedca000  ! 200: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r23
	.word 0x87802025  ! 201: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x50, %r17
	mov	0x3f8, %r21
	mov	0x18, %r26
	.word 0xeeb76000  ! 205: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xeeb7e000  ! 206: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xeeaf6000  ! 208: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeea7a000  ! 209: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	mov	0x48, %r25
	.word 0xeebf6000  ! 211: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 212: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeedfe000  ! 213: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x68, %r26
	.word 0xec8f0e60  ! 215: LDUBA_R	lduba	[%r28, %r0] 0x73, %r22
	mov	0x60, %r17
	.word 0xe09c4400  ! 217: LDDA_R	ldda	[%r17, %r0] 0x20, %r16
	.word 0xeaa70e60  ! 218: STWA_R	stwa	%r21, [%r28 + %r0] 0x73
	.word 0xe2872000  ! 219: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r17
	mov	0x40, %r19
	mov	0x7e8, %r22
	.word 0xe2a7a000  ! 222: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	mov	0x48, %r27
	.word 0xe6be89e0  ! 224: STDA_R	stda	%r19, [%r26 + %r0] 0x4f
	mov	0x7e8, %r22
	.word 0xe09c4400  ! 226: LDDA_R	ldda	[%r17, %r0] 0x20, %r16
	.word 0x87802074  ! 227: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe28ea000  ! 228: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 229: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2afe000  ! 230: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe29f2000  ! 231: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r17
	mov	0x18, %r17
	mov	0x3f0, %r20
	.word 0xe2bf2000  ! 234: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 235: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 236: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeb544a0  ! 237: STHA_R	stha	%r23, [%r21 + %r0] 0x25
	mov	0x3c8, %r22
	mov	0x70, %r26
	.word 0xe2f76000  ! 240: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 241: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b46000  ! 242: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	.word 0xe2b4a000  ! 243: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0xe2b46000  ! 244: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	.word 0xe2dca000  ! 245: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r17
	.word 0xe2dca000  ! 246: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r17
	.word 0xeaf78e40  ! 247: STXA_R	stxa	%r21, [%r30 + %r0] 0x72
	.word 0xeca42000  ! 248: STWA_I	stwa	%r22, [%r16 + 0x0000] %asi
	.word 0xeca46000  ! 249: STWA_I	stwa	%r22, [%r17 + 0x0000] %asi
	.word 0xecaca000  ! 250: STBA_I	stba	%r22, [%r18 + 0x0000] %asi
	.word 0xecd70e80  ! 251: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r22
	.word 0xea942000  ! 252: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r21
	mov	0x3c0, %r22
	.word 0xea9c6000  ! 254: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0xeab42000  ! 255: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	.word 0xe6f78e40  ! 256: STXA_R	stxa	%r19, [%r30 + %r0] 0x72
	.word 0xe8ae09e0  ! 257: STBA_R	stba	%r20, [%r24 + %r0] 0x4f
	.word 0xecace000  ! 258: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xe4bfce80  ! 259: STDA_R	stda	%r18, [%r31 + %r0] 0x74
	.word 0x87802020  ! 260: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeabcc400  ! 261: STDA_R	stda	%r21, [%r19 + %r0] 0x20
	mov	0x3d8, %r23
	.word 0xe4b4e000  ! 263: STHA_I	stha	%r18, [%r19 + 0x0000] %asi
	.word 0xe4946000  ! 264: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r18
	.word 0x87802020  ! 265: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c649e0  ! 266: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r18
	.word 0xe89ce000  ! 267: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r20
	.word 0x87802074  ! 268: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 269: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8d7e000  ! 270: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	.word 0xe08e89e0  ! 271: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r16
	.word 0xe2a7e000  ! 272: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0xe8f48400  ! 273: STXA_R	stxa	%r20, [%r18 + %r0] 0x20
	.word 0xe2f74e80  ! 274: STXA_R	stxa	%r17, [%r29 + %r0] 0x74
	.word 0x87802020  ! 275: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6c7ce80  ! 276: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r19
	.word 0xe6b7ce80  ! 277: STHA_R	stha	%r19, [%r31 + %r0] 0x74
	.word 0xeea72000  ! 278: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xe6cf0e40  ! 279: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r19
	.word 0xe6af4e80  ! 280: STBA_R	stba	%r19, [%r29 + %r0] 0x74
	.word 0xeabd84a0  ! 281: STDA_R	stda	%r21, [%r22 + %r0] 0x25
	mov	0x60, %r25
	.word 0xe8cfce40  ! 283: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r20
	.word 0xecaf6000  ! 284: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0x87802072  ! 285: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 286: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2f40400  ! 287: STXA_R	stxa	%r17, [%r16 + %r0] 0x20
	.word 0x87802073  ! 288: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeab40400  ! 289: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0xe68c2000  ! 290: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r19
	.word 0xe6f46000  ! 291: STXA_I	stxa	%r19, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 292: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6dea000  ! 293: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r19
	.word 0xe6a70e80  ! 294: STWA_R	stwa	%r19, [%r28 + %r0] 0x74
	.word 0x87802020  ! 295: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8be6000  ! 296: STDA_I	stda	%r20, [%r25 + 0x0000] %asi
	.word 0xe8de2000  ! 297: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r20
	mov	0x48, %r16
	mov	0x7e8, %r23
	.word 0x87802074  ! 300: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x70, %r18
	mov	0x7c8, %r21
	.word 0x87802074  ! 303: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 304: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2de09e0  ! 305: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r17
	mov	0x18, %r26
	.word 0xecdca000  ! 307: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r22
	.word 0xecdca000  ! 308: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r22
	.word 0x87802073  ! 309: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4cf8e80  ! 310: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r18
	.word 0xe6bea000  ! 311: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	.word 0xe6a6a000  ! 312: STWA_I	stwa	%r19, [%r26 + 0x0000] %asi
	.word 0xe69ee000  ! 313: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r19
	.word 0xe6a6e000  ! 314: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0xeaac0400  ! 315: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	.word 0xe8f66000  ! 316: STXA_I	stxa	%r20, [%r25 + 0x0000] %asi
	.word 0xe8f6a000  ! 317: STXA_I	stxa	%r20, [%r26 + 0x0000] %asi
	mov	0x18, %r16
	.word 0xe6b504a0  ! 319: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	mov	0x7e0, %r21
	.word 0x87802072  ! 321: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeebd44a0  ! 322: STDA_R	stda	%r23, [%r21 + %r0] 0x25
	mov	0x60, %r25
	.word 0xe0afe000  ! 324: STBA_I	stba	%r16, [%r31 + 0x0000] %asi
	.word 0xe8c70e60  ! 325: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r20
	.word 0x87802025  ! 326: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x48, %r25
	mov	0x40, %r17
	.word 0xe8cf8e60  ! 329: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r20
	.word 0xe0a7e000  ! 330: STWA_I	stwa	%r16, [%r31 + 0x0000] %asi
	mov	0x30, %r25
	.word 0xe8afce40  ! 332: STBA_R	stba	%r20, [%r31 + %r0] 0x72
	.word 0xe2d72000  ! 333: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0x87802074  ! 334: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x78, %r19
	.word 0xe2f70e60  ! 336: STXA_R	stxa	%r17, [%r28 + %r0] 0x73
	.word 0xe89649e0  ! 337: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r20
	.word 0xe69f0e40  ! 338: LDDA_R	ldda	[%r28, %r0] 0x72, %r19
	.word 0xe68d6000  ! 339: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0xe685e000  ! 340: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r19
	.word 0xe6d5a000  ! 341: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r19
	.word 0x87802020  ! 342: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6946000  ! 343: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r19
	mov	0x7f0, %r22
	mov	0x60, %r19
	.word 0xe6a46000  ! 346: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	.word 0x87802073  ! 347: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7e0, %r22
	.word 0xe6bf6000  ! 349: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xe6cf6000  ! 350: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 351: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 352: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r27
	.word 0x87802020  ! 354: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6876000  ! 355: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6bfa000  ! 356: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xeadf4e40  ! 357: LDXA_R	ldxa	[%r29, %r0] 0x72, %r21
	.word 0xe2f504a0  ! 358: STXA_R	stxa	%r17, [%r20 + %r0] 0x25
	.word 0xecb7a000  ! 359: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	.word 0xe2bec9e0  ! 360: STDA_R	stda	%r17, [%r27 + %r0] 0x4f
	.word 0xe4f70e60  ! 361: STXA_R	stxa	%r18, [%r28 + %r0] 0x73
	.word 0xeedec9e0  ! 362: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r23
	mov	0x10, %r24
	.word 0xeaf76000  ! 364: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0xe8cf0e60  ! 365: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r20
	.word 0xe4afa000  ! 366: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 367: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 368: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r24
	.word 0xe8b6c9e0  ! 370: STHA_R	stha	%r20, [%r27 + %r0] 0x4f
	.word 0xeeaf6000  ! 371: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xe6b7ce60  ! 372: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	.word 0xe0b72000  ! 373: STHA_I	stha	%r16, [%r28 + 0x0000] %asi
	.word 0xe0df6000  ! 374: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r16
	.word 0xeef48400  ! 375: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0xeaf7ce60  ! 376: STXA_R	stxa	%r21, [%r31 + %r0] 0x73
	.word 0xeedd84a0  ! 377: LDXA_R	ldxa	[%r22, %r0] 0x25, %r23
	.word 0xe2bc0400  ! 378: STDA_R	stda	%r17, [%r16 + %r0] 0x20
	.word 0xecc70e40  ! 379: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r22
	.word 0x8780204f  ! 380: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaa40400  ! 381: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0xe6cc0400  ! 382: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r19
	.word 0x87802025  ! 383: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8f42000  ! 384: STXA_I	stxa	%r20, [%r16 + 0x0000] %asi
	mov	0x58, %r16
	.word 0xee8649e0  ! 386: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r23
	mov	0x58, %r24
	mov	0x50, %r18
	.word 0xe08ce000  ! 389: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r16
	.word 0xe0bc2000  ! 390: STDA_I	stda	%r16, [%r16 + 0x0000] %asi
	mov	0x0, %r18
	.word 0xe8ce89e0  ! 392: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r20
	.word 0xe89f0e60  ! 393: LDDA_R	ldda	[%r28, %r0] 0x73, %r20
	.word 0x87802073  ! 394: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe08e09e0  ! 395: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r16
	.word 0xeef4c400  ! 396: STXA_R	stxa	%r23, [%r19 + %r0] 0x20
	.word 0xe6b40400  ! 397: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0xe6974e40  ! 398: LDUHA_R	lduha	[%r29, %r0] 0x72, %r19
	.word 0xecbca000  ! 399: STDA_I	stda	%r22, [%r18 + 0x0000] %asi
	.word 0xecc4a000  ! 400: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r22
	.word 0x87802074  ! 401: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7c0, %r21
	.word 0xec87e000  ! 403: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r22
	.word 0xecdf6000  ! 404: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0xecdf6000  ! 405: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0xee9c0400  ! 406: LDDA_R	ldda	[%r16, %r0] 0x20, %r23
	.word 0xeea76000  ! 407: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 408: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4b74e40  ! 409: STHA_R	stha	%r18, [%r29 + %r0] 0x72
	mov	0x7f0, %r22
	.word 0x87802020  ! 411: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r26
	.word 0xe49ca000  ! 413: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r18
	mov	0x18, %r25
	.word 0x87802020  ! 415: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7c0, %r20
	.word 0xeaa48400  ! 417: STWA_R	stwa	%r21, [%r18 + %r0] 0x20
	mov	0x30, %r26
	.word 0xe8b70e80  ! 419: STHA_R	stha	%r20, [%r28 + %r0] 0x74
	.word 0xe0d76000  ! 420: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r16
	mov	0x28, %r17
	.word 0xe0f609e0  ! 422: STXA_R	stxa	%r16, [%r24 + %r0] 0x4f
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802073  ! 424: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0b74e60  ! 425: STHA_R	stha	%r16, [%r29 + %r0] 0x73
	mov	0x3e0, %r21
	.word 0xe2af6000  ! 427: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0xe29f2000  ! 428: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a72000  ! 429: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2b72000  ! 430: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 431: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x58, %r26
	.word 0xe2b6e000  ! 433: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	.word 0xeea649e0  ! 434: STWA_R	stwa	%r23, [%r25 + %r0] 0x4f
	.word 0xe6f78e40  ! 435: STXA_R	stxa	%r19, [%r30 + %r0] 0x72
	.word 0xeabf4e80  ! 436: STDA_R	stda	%r21, [%r29 + %r0] 0x74
	.word 0x8780204f  ! 437: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 438: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 439: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x58, %r25
	.word 0xeabc0400  ! 441: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xecbf0e80  ! 442: STDA_R	stda	%r22, [%r28 + %r0] 0x74
	.word 0xe6876000  ! 443: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6afa000  ! 444: STBA_I	stba	%r19, [%r30 + 0x0000] %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6d7a000  ! 446: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r19
	.word 0xe6a7e000  ! 447: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	mov	0x28, %r18
	mov	0x3c8, %r23
	.word 0xeccf4e60  ! 450: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r22
	.word 0xe8f7a000  ! 451: STXA_I	stxa	%r20, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 452: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bda000  ! 453: STDA_I	stda	%r20, [%r22 + 0x0000] %asi
	.word 0xecb609e0  ! 454: STHA_R	stha	%r22, [%r24 + %r0] 0x4f
	.word 0xea95a000  ! 455: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r21
	.word 0xead5e000  ! 456: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r21
	.word 0xeaa52000  ! 457: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xead74e60  ! 458: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r21
	.word 0xecb56000  ! 459: STHA_I	stha	%r22, [%r21 + 0x0000] %asi
	.word 0xe4df8e40  ! 460: LDXA_R	ldxa	[%r30, %r0] 0x72, %r18
	.word 0xe29da000  ! 461: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r17
	.word 0xe285e000  ! 462: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r17
	mov	0x7d8, %r21
	.word 0x87802073  ! 464: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe297a000  ! 465: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r17
	.word 0x87802020  ! 466: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ac0400  ! 467: STBA_R	stba	%r19, [%r16 + %r0] 0x20
	mov	0x3e8, %r21
	.word 0x87802025  ! 469: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b70e80  ! 470: STHA_R	stha	%r17, [%r28 + %r0] 0x74
	.word 0xe6942000  ! 471: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r19
	.word 0xe68c6000  ! 472: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r19
	mov	0x20, %r18
	.word 0xe68ca000  ! 474: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r19
	.word 0xe6f46000  ! 475: STXA_I	stxa	%r19, [%r17 + 0x0000] %asi
	.word 0xe6f689e0  ! 476: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0xe894e000  ! 477: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r20
	.word 0x87802073  ! 478: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x50, %r24
	.word 0x87802025  ! 480: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3e8, %r23
	mov	0x58, %r16
	.word 0xe8b6a000  ! 483: STHA_I	stha	%r20, [%r26 + 0x0000] %asi
	.word 0xe8b6a000  ! 484: STHA_I	stha	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 485: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a4a000  ! 486: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	mov	0x7f0, %r22
	.word 0x87802025  ! 488: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeacd44a0  ! 489: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r21
	mov	0x7d8, %r21
	.word 0xe0bd6000  ! 491: STDA_I	stda	%r16, [%r21 + 0x0000] %asi
	.word 0xe0f5e000  ! 492: STXA_I	stxa	%r16, [%r23 + 0x0000] %asi
	mov	0x3f0, %r23
	mov	0x3e8, %r23
	mov	0x7e0, %r22
	.word 0xe2ae49e0  ! 496: STBA_R	stba	%r17, [%r25 + %r0] 0x4f
	.word 0xecd56000  ! 497: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r22
	.word 0xecacc400  ! 498: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	mov	0x3e8, %r21
	.word 0xeacde000  ! 500: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0xe2cf4e60  ! 501: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r17
	.word 0xe6a52000  ! 502: STWA_I	stwa	%r19, [%r20 + 0x0000] %asi
	.word 0xeacc8400  ! 503: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r21
	.word 0xec9ec9e0  ! 504: LDDA_R	ldda	[%r27, %r0] 0x4f, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802025  ! 506: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8c5a000  ! 507: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r20
	mov	0x7d8, %r23
	.word 0xe8cd2000  ! 509: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r20
	mov	0x7f8, %r21
	.word 0xe6a78e80  ! 511: STWA_R	stwa	%r19, [%r30 + %r0] 0x74
	.word 0xee95a000  ! 512: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r23
	mov	0x70, %r19
	.word 0xe4f40400  ! 514: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	ta	T_CHANGE_PRIV	! macro
	mov	0x7f0, %r23
	.word 0xe09de000  ! 517: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r16
	mov	0x20, %r27
	mov	0x40, %r17
	.word 0xeca78e80  ! 520: STWA_R	stwa	%r22, [%r30 + %r0] 0x74
	ta	T_CHANGE_PRIV	! macro
	.word 0xe8c5e000  ! 522: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r20
	.word 0xe8b5e000  ! 523: STHA_I	stha	%r20, [%r23 + 0x0000] %asi
	.word 0xe8a5e000  ! 524: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 525: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x78, %r27
	mov	0x7d0, %r20
	.word 0xe0c70e40  ! 528: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r16
	mov	0x58, %r17
	mov	0x60, %r26
	.word 0x87802072  ! 531: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2ac6000  ! 532: STBA_I	stba	%r17, [%r17 + 0x0000] %asi
	.word 0xe2c46000  ! 533: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 534: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x58, %r18
	.word 0xe2846000  ! 536: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r17
	.word 0xeea649e0  ! 537: STWA_R	stwa	%r23, [%r25 + %r0] 0x4f
	.word 0xeebf0e60  ! 538: STDA_R	stda	%r23, [%r28 + %r0] 0x73
	.word 0xe2bca000  ! 539: STDA_I	stda	%r17, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 540: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeccc0400  ! 541: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r22
	.word 0xeab7e000  ! 542: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 543: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xea8fe000  ! 544: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r21
	mov	0x30, %r26
	.word 0x87802025  ! 546: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x18, %r18
	.word 0xe6b48400  ! 548: STHA_R	stha	%r19, [%r18 + %r0] 0x20
	.word 0xe88fce60  ! 549: LDUBA_R	lduba	[%r31, %r0] 0x73, %r20
	mov	0x30, %r27
	mov	0x78, %r17
	.word 0xe2ddc4a0  ! 552: LDXA_R	ldxa	[%r23, %r0] 0x25, %r17
	mov	0x18, %r25
	.word 0xee9f8e40  ! 554: LDDA_R	ldda	[%r30, %r0] 0x72, %r23
	.word 0xeedda000  ! 555: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r23
	.word 0xe0d6c9e0  ! 556: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r16
	.word 0xeaf5e000  ! 557: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0xe6944400  ! 558: LDUHA_R	lduha	[%r17, %r0] 0x20, %r19
	.word 0xe4ada000  ! 559: STBA_I	stba	%r18, [%r22 + 0x0000] %asi
	.word 0xea84c400  ! 560: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r21
	.word 0xeeade000  ! 561: STBA_I	stba	%r23, [%r23 + 0x0000] %asi
	.word 0x87802073  ! 562: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeef76000  ! 563: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeccec9e0  ! 564: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r22
	.word 0xeef72000  ! 565: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x58, %r25
	.word 0xecdf8e80  ! 567: LDXA_R	ldxa	[%r30, %r0] 0x74, %r22
	.word 0x87802073  ! 568: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe894a000  ! 569: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8a4a000  ! 570: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	.word 0xe0f70e40  ! 571: STXA_R	stxa	%r16, [%r28 + %r0] 0x72
	.word 0xecbfce60  ! 572: STDA_R	stda	%r22, [%r31 + %r0] 0x73
	.word 0xee94e000  ! 573: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r23
	.word 0xeec42000  ! 574: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r23
	mov	0x38, %r18
	.word 0x87802020  ! 576: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x8, %r25
	mov	0x70, %r25
	.word 0x87802073  ! 579: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r26
	.word 0x87802025  ! 581: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeaf6000  ! 582: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	mov	0x3e8, %r20
	.word 0xeed7a000  ! 584: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802074  ! 585: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x60, %r26
	.word 0xe0970e80  ! 587: LDUHA_R	lduha	[%r28, %r0] 0x74, %r16
	.word 0xe48584a0  ! 588: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r18
	.word 0xecdfe000  ! 589: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	.word 0x87802020  ! 590: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc7e000  ! 591: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0x87802020  ! 592: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdca000  ! 593: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r22
	mov	0x8, %r24
	.word 0x87802020  ! 595: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bf0e40  ! 596: STDA_R	stda	%r20, [%r28 + %r0] 0x72
	mov	0x18, %r19
	.word 0xeadf4e40  ! 598: LDXA_R	ldxa	[%r29, %r0] 0x72, %r21
	mov	0x3c0, %r22
	mov	0x8, %r19
	.word 0xe8bce000  ! 601: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xe8cce000  ! 602: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r20
	.word 0x87802020  ! 603: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6afce80  ! 604: STBA_R	stba	%r19, [%r31 + %r0] 0x74
	.word 0xeebcc400  ! 605: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	.word 0xe0aee000  ! 606: STBA_I	stba	%r16, [%r27 + 0x0000] %asi
	mov	0x60, %r16
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe0dc4400  ! 609: LDXA_R	ldxa	[%r17, %r0] 0x20, %r16
	mov	0x7e0, %r22
	.word 0xe8862000  ! 611: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r20
	.word 0xea8c8400  ! 612: LDUBA_R	lduba	[%r18, %r0] 0x20, %r21
	.word 0xe4a7ce60  ! 613: STWA_R	stwa	%r18, [%r31 + %r0] 0x73
	.word 0xeef48400  ! 614: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0xe2af4e60  ! 615: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	mov	0x7f8, %r20
	.word 0xeac66000  ! 617: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r21
	.word 0xeaf6a000  ! 618: STXA_I	stxa	%r21, [%r26 + 0x0000] %asi
	.word 0xe08544a0  ! 619: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r16
	.word 0xe8f74e60  ! 620: STXA_R	stxa	%r20, [%r29 + %r0] 0x73
	.word 0x87802020  ! 621: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 622: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf76000  ! 623: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 624: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab7e000  ! 625: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xea972000  ! 626: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0x87802020  ! 627: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea9fa000  ! 628: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	mov	0x58, %r17
	mov	0x8, %r26
	.word 0xeaf7e000  ! 631: STXA_I	stxa	%r21, [%r31 + 0x0000] %asi
	.word 0xe2cfce60  ! 632: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r17
	.word 0xe4cfa000  ! 633: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r18
	.word 0x87802073  ! 634: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r27
	.word 0xeeac0400  ! 636: STBA_R	stba	%r23, [%r16 + %r0] 0x20
	mov	0x70, %r25
	.word 0xeaa74e40  ! 638: STWA_R	stwa	%r21, [%r29 + %r0] 0x72
	.word 0xe48d04a0  ! 639: LDUBA_R	lduba	[%r20, %r0] 0x25, %r18
	.word 0xe2df0e40  ! 640: LDXA_R	ldxa	[%r28, %r0] 0x72, %r17
	mov	0x58, %r25
	.word 0xe0af6000  ! 642: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 643: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 644: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 645: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 646: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0f7e000  ! 647: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe8ac4400  ! 648: STBA_R	stba	%r20, [%r17 + %r0] 0x20
	.word 0xe297e000  ! 649: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0xe6c74e40  ! 650: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r19
	mov	0x48, %r16
	.word 0xea976000  ! 652: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xee9c8400  ! 653: LDDA_R	ldda	[%r18, %r0] 0x20, %r23
	.word 0xe09504a0  ! 654: LDUHA_R	lduha	[%r20, %r0] 0x25, %r16
	mov	0x3d0, %r21
	.word 0xe8972000  ! 656: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0xe8afce80  ! 657: STBA_R	stba	%r20, [%r31 + %r0] 0x74
	.word 0xeaa74e60  ! 658: STWA_R	stwa	%r21, [%r29 + %r0] 0x73
	mov	0x3d0, %r20
	.word 0xe8df0e80  ! 660: LDXA_R	ldxa	[%r28, %r0] 0x74, %r20
	mov	0x78, %r25
	mov	0x3c8, %r23
	.word 0xe8bec9e0  ! 663: STDA_R	stda	%r20, [%r27 + %r0] 0x4f
	.word 0xe48f6000  ! 664: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xe8ddc4a0  ! 665: LDXA_R	ldxa	[%r23, %r0] 0x25, %r20
	.word 0xeac7a000  ! 666: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	mov	0x18, %r27
	mov	0x7f8, %r23
	.word 0xea978e80  ! 669: LDUHA_R	lduha	[%r30, %r0] 0x74, %r21
	.word 0xeacf2000  ! 670: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r21
	.word 0xeab72000  ! 671: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	mov	0x7f8, %r20
	.word 0xe0948400  ! 673: LDUHA_R	lduha	[%r18, %r0] 0x20, %r16
	mov	0x3f0, %r22
	.word 0xe2df2000  ! 675: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r17
	.word 0xe6f649e0  ! 676: STXA_R	stxa	%r19, [%r25 + %r0] 0x4f
	.word 0xecdfe000  ! 677: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
	mov	0x20, %r24
	.word 0xecbf6000  ! 679: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	mov	0x7d0, %r22
	mov	0x18, %r27
	.word 0xe6cf8e60  ! 682: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r19
	.word 0xea9f2000  ! 683: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	mov	0x40, %r27
	.word 0xeacf2000  ! 685: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r21
	.word 0xe4af4e40  ! 686: STBA_R	stba	%r18, [%r29 + %r0] 0x72
	.word 0x87802020  ! 687: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d4a000  ! 688: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r17
	.word 0xe28ce000  ! 689: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r17
	.word 0xe2b46000  ! 690: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	mov	0x78, %r18
	.word 0xe284e000  ! 692: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r17
	.word 0xe2f46000  ! 693: STXA_I	stxa	%r17, [%r17 + 0x0000] %asi
	.word 0xe2a42000  ! 694: STWA_I	stwa	%r17, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 695: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2a56000  ! 696: STWA_I	stwa	%r17, [%r21 + 0x0000] %asi
	mov	0x7d8, %r23
	.word 0xe29d6000  ! 698: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r17
	.word 0xe2dda000  ! 699: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r17
	.word 0xe2ce09e0  ! 700: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r17
	.word 0xe8d5e000  ! 701: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r20
	.word 0xe49d84a0  ! 702: LDDA_R	ldda	[%r22, %r0] 0x25, %r18
	ta	T_CHANGE_HPRIV	! macro
	mov	0x50, %r19
	mov	0x7f8, %r23
	.word 0xe8ac8400  ! 706: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	mov	0x7c0, %r20
	.word 0xe0dde000  ! 708: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r16
	.word 0xe0ade000  ! 709: STBA_I	stba	%r16, [%r23 + 0x0000] %asi
	.word 0xe0874e80  ! 710: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r16
	.word 0xe4de89e0  ! 711: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r18
	.word 0xe8c5a000  ! 712: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r20
	mov	0x78, %r17
	.word 0xecbf8e80  ! 714: STDA_R	stda	%r22, [%r30 + %r0] 0x74
	.word 0x87802025  ! 715: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeab62000  ! 716: STHA_I	stha	%r21, [%r24 + 0x0000] %asi
	.word 0xe09c8400  ! 717: LDDA_R	ldda	[%r18, %r0] 0x20, %r16
	.word 0x87802025  ! 718: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 719: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2a6e000  ! 720: STWA_I	stwa	%r17, [%r27 + 0x0000] %asi
	.word 0xe2c62000  ! 721: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r17
	.word 0xe68c8400  ! 722: LDUBA_R	lduba	[%r18, %r0] 0x20, %r19
	.word 0xe2c62000  ! 723: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r17
	.word 0xecd74e40  ! 724: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	.word 0x87802073  ! 725: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 726: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea7a000  ! 727: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	mov	0x18, %r27
	mov	0x68, %r18
	mov	0x68, %r27
	mov	0x7c8, %r23
	.word 0xee970e40  ! 732: LDUHA_R	lduha	[%r28, %r0] 0x72, %r23
	.word 0xe087ce80  ! 733: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r16
	.word 0x87802073  ! 734: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 735: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea62000  ! 736: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	mov	0x3f8, %r20
	mov	0x3d0, %r20
	.word 0x87802072  ! 739: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 740: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x20, %r18
	.word 0xeeb46000  ! 742: STHA_I	stha	%r23, [%r17 + 0x0000] %asi
	.word 0x87802072  ! 743: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea7e000  ! 744: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xeedf2000  ! 745: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r23
	mov	0x3d0, %r22
	mov	0x38, %r24
	.word 0xe2c584a0  ! 748: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r17
	mov	0x3f8, %r21
	mov	0x7c8, %r20
	.word 0xe0f7ce80  ! 751: STXA_R	stxa	%r16, [%r31 + %r0] 0x74
	mov	0x58, %r27
	.word 0x87802020  ! 753: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f42000  ! 754: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	mov	0x20, %r18
	.word 0x87802073  ! 756: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6d6e000  ! 757: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r19
	.word 0x87802020  ! 758: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ace000  ! 759: STBA_I	stba	%r19, [%r19 + 0x0000] %asi
	.word 0xe68ce000  ! 760: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r19
	.word 0xe6a46000  ! 761: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	mov	0x8, %r24
	.word 0xe0f584a0  ! 763: STXA_R	stxa	%r16, [%r22 + %r0] 0x25
	mov	0x3e8, %r23
	.word 0xeeac6000  ! 765: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0xe8940400  ! 766: LDUHA_R	lduha	[%r16, %r0] 0x20, %r20
	.word 0x87802025  ! 767: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xec840400  ! 768: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r22
	mov	0x3f0, %r20
	mov	0x70, %r24
	mov	0x50, %r18
	.word 0xeab4c400  ! 772: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	.word 0x87802020  ! 773: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r17
	.word 0xe8b7e000  ! 775: STHA_I	stha	%r20, [%r31 + 0x0000] %asi
	.word 0xe0940400  ! 776: LDUHA_R	lduha	[%r16, %r0] 0x20, %r16
	.word 0xe4f544a0  ! 777: STXA_R	stxa	%r18, [%r21 + %r0] 0x25
	.word 0x87802020  ! 778: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6af4e80  ! 779: STBA_R	stba	%r19, [%r29 + %r0] 0x74
	.word 0xeca72000  ! 780: STWA_I	stwa	%r22, [%r28 + 0x0000] %asi
	.word 0xec9fa000  ! 781: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r22
	mov	0x7e0, %r21
	.word 0xecbfa000  ! 783: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeccf2000  ! 784: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r22
	.word 0xecf7a000  ! 785: STXA_I	stxa	%r22, [%r30 + 0x0000] %asi
	.word 0xe2c70e40  ! 786: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r17
	.word 0xe8a7e000  ! 787: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xecc78e80  ! 788: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r22
	mov	0x3c8, %r20
	.word 0xe4978e80  ! 790: LDUHA_R	lduha	[%r30, %r0] 0x74, %r18
	.word 0xe49ec9e0  ! 791: LDDA_R	ldda	[%r27, %r0] 0x4f, %r18
	.word 0x87802025  ! 792: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe497ce80  ! 793: LDUHA_R	lduha	[%r31, %r0] 0x74, %r18
	.word 0xe6cd6000  ! 794: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r19
	mov	0x0, %r16
	.word 0xe8af0e80  ! 796: STBA_R	stba	%r20, [%r28 + %r0] 0x74
	mov	0x3e0, %r22
	.word 0xe4bc0400  ! 798: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	.word 0x87802074  ! 799: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x58, %r25
	.word 0xe8b6e000  ! 801: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xecbc8400  ! 802: STDA_R	stda	%r22, [%r18 + %r0] 0x20
	.word 0xe2d6e000  ! 803: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	.word 0xe2de2000  ! 804: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r17
	.word 0xe2d6e000  ! 805: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	mov	0x50, %r25
	.word 0xe6dc0400  ! 807: LDXA_R	ldxa	[%r16, %r0] 0x20, %r19
	.word 0xe2a40400  ! 808: STWA_R	stwa	%r17, [%r16 + %r0] 0x20
	.word 0xe0a649e0  ! 809: STWA_R	stwa	%r16, [%r25 + %r0] 0x4f
	.word 0xeabc0400  ! 810: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xeab6a000  ! 811: STHA_I	stha	%r21, [%r26 + 0x0000] %asi
	mov	0x3c0, %r23
	.word 0xeaa66000  ! 813: STWA_I	stwa	%r21, [%r25 + 0x0000] %asi
	.word 0xead62000  ! 814: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r21
	.word 0xe69f0e80  ! 815: LDDA_R	ldda	[%r28, %r0] 0x74, %r19
	.word 0xe0d40400  ! 816: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r16
	.word 0xe2f584a0  ! 817: STXA_R	stxa	%r17, [%r22 + %r0] 0x25
	.word 0xeab7ce40  ! 818: STHA_R	stha	%r21, [%r31 + %r0] 0x72
	mov	0x50, %r16
	.word 0x87802020  ! 820: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea9fa000  ! 821: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	mov	0x58, %r27
	mov	0x28, %r27
	.word 0x87802073  ! 824: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xead4a000  ! 825: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xeaf4e000  ! 826: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 827: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6bd84a0  ! 828: STDA_R	stda	%r19, [%r22 + %r0] 0x25
	mov	0x3e8, %r22
	.word 0xe897e000  ! 830: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	mov	0x18, %r26
	.word 0xe8c72000  ! 832: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xe8976000  ! 833: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0xe8c72000  ! 834: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0xe0bc4400  ! 835: STDA_R	stda	%r16, [%r17 + %r0] 0x20
	mov	0x30, %r26
	.word 0xea948400  ! 837: LDUHA_R	lduha	[%r18, %r0] 0x20, %r21
	.word 0xe08649e0  ! 838: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r16
	.word 0xea8f2000  ! 839: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r21
	mov	0x70, %r26
	.word 0xeab76000  ! 841: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	mov	0x0, %r25
	mov	0x3e0, %r22
	.word 0x87802020  ! 844: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cf4e60  ! 845: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r19
	.word 0xe2afe000  ! 846: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe2cc0400  ! 847: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r17
	.word 0xe2a7a000  ! 848: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 849: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x68, %r17
	mov	0x70, %r19
	.word 0xe2bf6000  ! 852: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe2d76000  ! 853: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2d76000  ! 854: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xe6c689e0  ! 855: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r19
	mov	0x70, %r16
	.word 0x87802072  ! 857: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09ce000  ! 858: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r16
	.word 0xeaf40400  ! 859: STXA_R	stxa	%r21, [%r16 + %r0] 0x20
	.word 0xeef42000  ! 860: STXA_I	stxa	%r23, [%r16 + 0x0000] %asi
	.word 0xeea4e000  ! 861: STWA_I	stwa	%r23, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 862: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r24
	.word 0x87802020  ! 864: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe29f4e60  ! 865: LDDA_R	ldda	[%r29, %r0] 0x73, %r17
	mov	0x40, %r16
	.word 0x87802025  ! 867: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 868: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeacf8e80  ! 869: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r21
	.word 0xe4a4a000  ! 870: STWA_I	stwa	%r18, [%r18 + 0x0000] %asi
	mov	0x78, %r24
	mov	0x10, %r25
	mov	0x40, %r18
	.word 0xe0a5c4a0  ! 874: STWA_R	stwa	%r16, [%r23 + %r0] 0x25
	mov	0x38, %r24
	.word 0xe8cf4e40  ! 876: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r20
	.word 0x87802072  ! 877: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeb7e000  ! 878: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	.word 0xeec7a000  ! 879: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r23
	.word 0xee97e000  ! 880: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r23
	.word 0xeaf70e40  ! 881: STXA_R	stxa	%r21, [%r28 + %r0] 0x72
	.word 0xe6b74e40  ! 882: STHA_R	stha	%r19, [%r29 + %r0] 0x72
	.word 0xe8b7ce60  ! 883: STHA_R	stha	%r20, [%r31 + %r0] 0x73
	.word 0xe6bcc400  ! 884: STDA_R	stda	%r19, [%r19 + %r0] 0x20
	.word 0xe0a76000  ! 885: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	.word 0xe6bc8400  ! 886: STDA_R	stda	%r19, [%r18 + %r0] 0x20
	.word 0xeeaf2000  ! 887: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 888: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 889: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeb44400  ! 890: STHA_R	stha	%r23, [%r17 + %r0] 0x20
	.word 0xeca4c400  ! 891: STWA_R	stwa	%r22, [%r19 + %r0] 0x20
	.word 0xe28544a0  ! 892: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r17
	mov	0x3e0, %r22
	.word 0x87802020  ! 894: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2c52000  ! 895: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r17
	.word 0xe6ae89e0  ! 896: STBA_R	stba	%r19, [%r26 + %r0] 0x4f
	.word 0xeed56000  ! 897: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r23
	mov	0x3e8, %r21
	.word 0xecdfce80  ! 899: LDXA_R	ldxa	[%r31, %r0] 0x74, %r22
	mov	0x68, %r17
	.word 0xecbf4e40  ! 901: STDA_R	stda	%r22, [%r29 + %r0] 0x72
	.word 0xe0bc4400  ! 902: STDA_R	stda	%r16, [%r17 + %r0] 0x20
	mov	0x3e8, %r23
	mov	0x40, %r24
	.word 0xe2be89e0  ! 905: STDA_R	stda	%r17, [%r26 + %r0] 0x4f
	.word 0x87802025  ! 906: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeab42000  ! 907: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x58, %r26
	mov	0x58, %r25
	.word 0x87802020  ! 910: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3d8, %r21
	.word 0x8780204f  ! 912: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe09c8400  ! 913: LDDA_R	ldda	[%r18, %r0] 0x20, %r16
	mov	0x30, %r24
	.word 0xe0cf6000  ! 915: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0xe0b7e000  ! 916: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	mov	0x48, %r26
	.word 0xe0b76000  ! 918: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xec874e40  ! 919: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r22
	.word 0xea8f2000  ! 920: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r21
	.word 0xe4bc0400  ! 921: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	mov	0x7f8, %r21
	.word 0xe8dfa000  ! 923: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0xe8a76000  ! 924: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0x87802074  ! 925: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0cf8e40  ! 926: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r16
	.word 0xecaee000  ! 927: STBA_I	stba	%r22, [%r27 + 0x0000] %asi
	.word 0xec8ee000  ! 928: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r22
	.word 0xeca66000  ! 929: STWA_I	stwa	%r22, [%r25 + 0x0000] %asi
	.word 0xecdee000  ! 930: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r22
	.word 0xeca66000  ! 931: STWA_I	stwa	%r22, [%r25 + 0x0000] %asi
	.word 0xecdcc400  ! 932: LDXA_R	ldxa	[%r19, %r0] 0x20, %r22
	.word 0xe6d48400  ! 933: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r19
	.word 0xeeb48400  ! 934: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	mov	0x7f0, %r21
	.word 0xe2acc400  ! 936: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0xe69d84a0  ! 937: LDDA_R	ldda	[%r22, %r0] 0x25, %r19
	mov	0x40, %r18
	.word 0xe8b4c400  ! 939: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe8b66000  ! 940: STHA_I	stha	%r20, [%r25 + 0x0000] %asi
	.word 0xe886e000  ! 941: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r20
	mov	0x7c0, %r22
	mov	0x7f8, %r20
	.word 0xe8aea000  ! 944: STBA_I	stba	%r20, [%r26 + 0x0000] %asi
	.word 0xe4dd44a0  ! 945: LDXA_R	ldxa	[%r21, %r0] 0x25, %r18
	.word 0xe08ea000  ! 946: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r16
	mov	0x58, %r27
	.word 0xeece09e0  ! 948: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r23
	mov	0x0, %r19
	.word 0xe6f6a000  ! 950: STXA_I	stxa	%r19, [%r26 + 0x0000] %asi
	.word 0xe6bea000  ! 951: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	.word 0xe68f8e80  ! 952: LDUBA_R	lduba	[%r30, %r0] 0x74, %r19
	mov	0x58, %r24
	mov	0x7f0, %r23
	.word 0xec8e6000  ! 955: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r22
	mov	0x70, %r17
	.word 0x87802072  ! 957: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r27
	.word 0x87802072  ! 959: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x50, %r18
	.word 0xeaac0400  ! 961: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	.word 0xe6c4a000  ! 962: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r19
	.word 0xe4ae89e0  ! 963: STBA_R	stba	%r18, [%r26 + %r0] 0x4f
	.word 0xe08f8e80  ! 964: LDUBA_R	lduba	[%r30, %r0] 0x74, %r16
	.word 0xe4a4a000  ! 965: STWA_I	stwa	%r18, [%r18 + 0x0000] %asi
	.word 0xec844400  ! 966: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r22
	mov	0x48, %r27
	.word 0xee878e60  ! 968: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r23
	mov	0x3d8, %r21
	.word 0xe0bc0400  ! 970: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	mov	0x68, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4dcc400  ! 973: LDXA_R	ldxa	[%r19, %r0] 0x20, %r18
	mov	0x40, %r27
	mov	0x7f8, %r20
	.word 0xecf42000  ! 976: STXA_I	stxa	%r22, [%r16 + 0x0000] %asi
	.word 0xecd544a0  ! 977: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r22
	.word 0x8780204f  ! 978: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2a689e0  ! 979: STWA_R	stwa	%r17, [%r26 + %r0] 0x4f
	.word 0xe2b609e0  ! 980: STHA_R	stha	%r17, [%r24 + %r0] 0x4f
	.word 0xea9da000  ! 981: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	.word 0xea85a000  ! 982: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r21
	.word 0xe68c4400  ! 983: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0x87802072  ! 984: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x50, %r27
	.word 0xec9fce40  ! 986: LDDA_R	ldda	[%r31, %r0] 0x72, %r22
	mov	0x20, %r24
	.word 0xecac6000  ! 988: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	mov	0x70, %r24
	.word 0x8780204f  ! 990: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe09f4e40  ! 991: LDDA_R	ldda	[%r29, %r0] 0x72, %r16
	.word 0xeacea000  ! 992: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r21
	.word 0xeaf62000  ! 993: STXA_I	stxa	%r21, [%r24 + 0x0000] %asi
	mov	0x18, %r25
	.word 0xeacea000  ! 995: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r21
	.word 0x87802072  ! 996: WRASI_I	wr	%r0, 0x0072, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4de49e0  ! 998: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r18

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)



	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
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
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group("diag.j", 19, th_all,    0xf);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 21,"{16}" );
!!#   IJ_set_rvar ("diag.j", 22, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 23, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 26, Rv_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 29, Rv_q_va, "13'b0 0r11 11rr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 32, Rv_hyp_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 34, Rv_asi, "{0x20, 0x25, 0x4f, 0x72, 0x73, 0x74}");
!!#   IJ_copy_rvar ("diag.j", 35, Rv_asi_reg, Rv_asi);
!!# 
!!#   IJ_set_rvar ("diag.j", 37, Rv_20, "5'b1 00rr");
!!#   IJ_set_rvar ("diag.j", 38, Rv_25, "5'b1 01rr");
!!#   IJ_set_rvar ("diag.j", 39, Rv_4f, "5'b1 10rr");
!!#   IJ_set_rvar ("diag.j", 40, Rv_72_73_74, "5'b1 11rr");
!!# 
!!#   IJ_assign_ropr_fld ("diag.j", 42, ijdefault, Ft_Imm_Asi, Rv_asi);
!!# 
!!#   IJ_set_rvar ("diag.j", 44, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Simm13, "13'b0 0000 0000 rr00");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_install_ropr_cb ("diag.j", 50,ijdefault, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_set_ropr_fld   ( "diag.j", 52, Ro_asi, Ft_Rs1, "{0}");
!!#   IJ_assign_ropr_fld ("diag.j", 53, Ro_asi, Ft_Simm13, Rv_asi_reg);
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 55, Ro_reg_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld    ("diag.j", 56, Ro_reg_asi, Ft_Simm13, "{0}");
!!#   IJ_install_ropr_cb ("diag.j", 57,Ro_reg_asi, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi_reg, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 59, th_all, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 61, th_all, "\tmov\t0x%rx, %%r16\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 62, th_all, "\tmov\t0x%rx, %%r17\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 63, th_all, "\tmov\t0x%rx, %%r18\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 64, th_all, "\tmov\t0x%rx, %%r19\n", Rv_scratch_pad_va);
!!# 
!!#   IJ_printf ("diag.j", 66, th_all, "\tmov\t0x%rx, %%r20\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 67, th_all, "\tmov\t0x%rx, %%r21\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 68, th_all, "\tmov\t0x%rx, %%r22\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 69, th_all, "\tmov\t0x%rx, %%r23\n", Rv_q_va);
!!# 
!!#   IJ_printf ("diag.j", 71, th_all, "\tmov\t0x%rx, %%r24\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 72, th_all, "\tmov\t0x%rx, %%r25\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 73, th_all, "\tmov\t0x%rx, %%r26\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 74, th_all, "\tmov\t0x%rx, %%r27\n", Rv_hyp_scratch_pad_va);
!!# 
!!#   IJ_printf ("diag.j", 76, th_all, "\tmov\t0, %%r28\n");
!!#   IJ_printf ("diag.j", 77, th_all, "\tmov\t0, %%r29\n");
!!#   IJ_printf ("diag.j", 78, th_all, "\tmov\t0, %%r30\n");
!!#   IJ_printf ("diag.j", 79, th_all, "\tmov\t0, %%r31\n");
!!# 
!!#   IJ_printf ("diag.j", 81, th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 82, th_all, "\twr\t%%g0, 0x%rx, %%asi\n", Rv_asi_reg);
!!#   IJ_printf ("diag.j", 83, th_all, "\tstxa\t%%g0, [%%g0] 0x42\n");
!!#   IJ_printf ("diag.j", 84, th_all, "\tmov\t0x38, %%g1\n");
!!#   IJ_printf ("diag.j", 85, th_all, "\tstxa\t%%g0, [%%g1] 0x58\n");
!!# 
!!#   IJ_th_fork("diag.j", 87,0x2, 0x4, 0x8, -1);;
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
!!#   IJ_th_join("diag.j", 93,0xff);
!!#   IJ_th_start ("diag.j", 94,Seq_Start, NULL, 1);
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
!!# 		IJ_generate ("diag.j", 141, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: load_imm_asi
!!# 	| load_reg_asi  %ropr  Ro_reg_asi
!!# 	| store_imm_asi
!!# 	| store_reg_asi %ropr  Ro_reg_asi
!!# 	| change_priv_tl %rvar  Rv_low_wt
!!# 	| set_20_va     %rvar  Rv_mid_wt
!!# 	| set_25_va	%rvar  Rv_mid_wt
!!# 	| set_4f_va	%rvar  Rv_mid_wt
!!# 	| wrasi		// rvar Rv_mid_wt
!!# ;
!!# 
!!# wrasi: tWRASI_I %ropr  Ro_asi
!!# ;
!!# 
!!# change_priv_tl: tCHANGE_NONPRIV | tCHANGE_PRIV | tCHANGE_NONHPRIV 
!!# 	| tCHANGE_HPRIV // | tCHANGE_TO_TL0 | tCHANGE_TO_TL1
!!# ;
!!# 
!!# set_20_va: mSET_20_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 166, th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			Rv_scratch_pad_va,Rv_20);
!!#         }
!!# ;
!!# 
!!# set_25_va: mSET_25_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 173, th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_q_va,Rv_25);
!!#         }
!!# ;
!!# 
!!# set_4f_va: mSET_4f_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 180, th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_hyp_scratch_pad_va,Rv_4f);
!!#         }
!!# ;
!!# 
!!# load_imm_asi:  tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R
!!# 	| tLDUHA_R | tLDUWA_R | tLDXA_R | tLDDA_R
!!# ;
!!# 
!!# load_reg_asi:  tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I 
!!# 	| tLDUHA_I | tLDUWA_I | tLDXA_I | tLDDA_I
!!# ;
!!# 
!!# store_imm_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R
!!# ;
!!# 
!!# store_reg_asi: tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I | tSTDA_I 
!!# ;
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data)
!!# {
!!#   int asi;
!!#   int r;
!!#   int *d = (int *) data;
!!# 
!!#   if (fld == Ft_Null)
!!#       asi = IJ_get_rvar_val32("diag.j", 208, rv_ro);
!!#   else
!!#     asi = IJ_get_ropr_fld_val ("diag.j", 210, rv_ro, fld);
!!# 
!!#   switch (asi) {
!!#     case 0x20:
!!#       IJ_update_rvar ("diag.j", 214, d[0]);
!!#       return (IJ_get_rvar_val32("diag.j", 215, d[0]));
!!#     case 0x25:
!!#       IJ_update_rvar ("diag.j", 217, d[1]);
!!#       return (IJ_get_rvar_val32("diag.j", 218, d[1]));
!!#     case 0x4f:
!!#       IJ_update_rvar ("diag.j", 220, d[2]);
!!#       return (IJ_get_rvar_val32("diag.j", 221, d[2]));
!!#     case 0x72:
!!#       IJ_update_rvar ("diag.j", 223, d[3]);
!!#       return (IJ_get_rvar_val32("diag.j", 224, d[3]));
!!#     case 0x73:
!!#       IJ_update_rvar ("diag.j", 226, d[4]);
!!#       return (IJ_get_rvar_val32("diag.j", 227, d[4]));
!!#     case 0x74:
!!#       IJ_update_rvar ("diag.j", 229, d[5]);
!!#       return (IJ_get_rvar_val32("diag.j", 230, d[5]));
!!#   }
!!# }
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
