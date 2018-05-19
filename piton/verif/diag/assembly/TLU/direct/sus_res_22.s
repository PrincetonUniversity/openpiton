// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sus_res_22.s
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
   random seed:	430633544
   Jal tlu_sus_res_22.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

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

	setx 0x0c61c0f2a18781d0, %g1, %g0
	setx 0xda028282a28db1d6, %g1, %g1
	setx 0xe857006a5c0ce69a, %g1, %g2
	setx 0xd87f67fbcddd240b, %g1, %g3
	setx 0xc771f4510f4b9c12, %g1, %g4
	setx 0xbc28c60ebd33b3cc, %g1, %g5
	setx 0xc7a9832cccde9efd, %g1, %g6
	setx 0x4a43be37b897ea38, %g1, %g7
	setx 0xd8d149bc59e8e9ac, %g1, %r16
	setx 0xc0cbc7b2e9618dd0, %g1, %r17
	setx 0x402b1690d4e5055a, %g1, %r18
	setx 0x3bfb341dbd13c6ff, %g1, %r19
	setx 0xa9dd70cc969e1141, %g1, %r20
	setx 0xd8d61a5b6df0e01a, %g1, %r21
	setx 0x441578f89e806a60, %g1, %r22
	setx 0xbb9721217c7ece7a, %g1, %r23
	setx 0x6ba789bbf0311cdb, %g1, %r24
	setx 0xe53d6495ac01a322, %g1, %r25
	setx 0xc0b3794f5fc02adf, %g1, %r26
	setx 0x18de507e2211da58, %g1, %r27
	setx 0x8e2eff14996a670c, %g1, %r28
	setx 0x7f55907304df2885, %g1, %r29
	setx 0xd09ee1d1b37d58dd, %g1, %r30
	setx 0x1644c25504f773d4, %g1, %r31
	save
	setx 0x51db2b3750574e1d, %g1, %r16
	setx 0xff36ffb1392776b0, %g1, %r17
	setx 0x3147165fa9837099, %g1, %r18
	setx 0xbff55d38babe0937, %g1, %r19
	setx 0x64463da14661f739, %g1, %r20
	setx 0x6c14ae7a467f053c, %g1, %r21
	setx 0x0edee5f5c6934ac0, %g1, %r22
	setx 0x7605c524e1ef5428, %g1, %r23
	setx 0x5d049dab1904a550, %g1, %r24
	setx 0x1190d2fbd4f806d4, %g1, %r25
	setx 0xaf43c0f78f0419be, %g1, %r26
	setx 0xbd290458a7f76c6e, %g1, %r27
	setx 0xd3796862f3340938, %g1, %r28
	setx 0x76694cfe27ab50e2, %g1, %r29
	setx 0x46f4843dfca2cb60, %g1, %r30
	setx 0xe7037280919670a4, %g1, %r31
	save
	setx 0x45794c2c3285c145, %g1, %r16
	setx 0xf75dc557f540275b, %g1, %r17
	setx 0xbc4817a98909013b, %g1, %r18
	setx 0xfe9beb2c81f7eb06, %g1, %r19
	setx 0xa871a242005869fb, %g1, %r20
	setx 0x2c3aa7f10ce27c18, %g1, %r21
	setx 0x05745b1d2db6c970, %g1, %r22
	setx 0x60d6af1570bfab8d, %g1, %r23
	setx 0x9a8c658b584ec5a1, %g1, %r24
	setx 0xfdc8efc667e773d7, %g1, %r25
	setx 0x922334c8bb908c27, %g1, %r26
	setx 0x759b3db3a4b15ed0, %g1, %r27
	setx 0x02d165dbb583f0c8, %g1, %r28
	setx 0xed5080b8db0df64c, %g1, %r29
	setx 0xa7c8cdcebf8f5d9a, %g1, %r30
	setx 0x193d91af95a81599, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x50, %r16
	mov	0x48, %r17
	mov	0x20, %r18
	mov	0x28, %r19
	mov	0x7d8, %r20
	mov	0x3c8, %r21
	mov	0x7d0, %r22
	mov	0x3e8, %r23
	mov	0x28, %r24
	mov	0x68, %r25
	mov	0x0, %r26
	mov	0x68, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x20, %asi
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
	.word 0xe8ad84a0  ! 2: STBA_R	stba	%r20, [%r22 + %r0] 0x25
	.word 0x87802073  ! 3: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe88fa000  ! 4: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	.word 0x01000000  ! 5: NOP	nop
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe897a000  ! 7: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	.word 0xe8c72000  ! 8: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 9: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 10: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8a52000  ! 11: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xe4978e40  ! 12: LDUHA_R	lduha	[%r30, %r0] 0x72, %r18
	.word 0x01000000  ! 13: NOP	nop
	.word 0xe4b52000  ! 14: STHA_I	stha	%r18, [%r20 + 0x0000] %asi
	.word 0xe2a544a0  ! 15: STWA_R	stwa	%r17, [%r21 + %r0] 0x25
	.word 0x01000000  ! 16: NOP	nop
	.word 0x87802020  ! 17: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe6be49e0  ! 19: STDA_R	stda	%r19, [%r25 + %r0] 0x4f
	.word 0xe6f42000  ! 20: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0xe6d4a000  ! 21: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 22: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x40, %r25
	.word 0xe686a000  ! 24: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r19
	.word 0xe69e6000  ! 25: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r19
	.word 0xe6a62000  ! 26: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0x87802025  ! 27: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6ada000  ! 28: STBA_I	stba	%r19, [%r22 + 0x0000] %asi
	.word 0x01000000  ! 29: NOP	nop
	.word 0xe6f5e000  ! 30: STXA_I	stxa	%r19, [%r23 + 0x0000] %asi
	.word 0x01000000  ! 31: NOP	nop
	.word 0xe0870e40  ! 32: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r16
	.word 0x87802073  ! 33: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe48f0e80  ! 34: LDUBA_R	lduba	[%r28, %r0] 0x74, %r18
	.word 0xeedc4400  ! 35: LDXA_R	ldxa	[%r17, %r0] 0x20, %r23
	.word 0xeeb76000  ! 36: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xeed72000  ! 37: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xeca649e0  ! 38: STWA_R	stwa	%r22, [%r25 + %r0] 0x4f
	.word 0xee9f8e80  ! 39: LDDA_R	ldda	[%r30, %r0] 0x74, %r23
	.word 0xeeb76000  ! 40: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xe6dd84a0  ! 41: LDXA_R	ldxa	[%r22, %r0] 0x25, %r19
	.word 0x87802073  ! 42: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 43: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6ad6000  ! 44: STBA_I	stba	%r19, [%r21 + 0x0000] %asi
	.word 0xe6852000  ! 45: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r19
	.word 0xeabec9e0  ! 46: STDA_R	stda	%r21, [%r27 + %r0] 0x4f
	.word 0x87802074  ! 47: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6cf4e40  ! 48: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r19
	.word 0xee9f0e60  ! 49: LDDA_R	ldda	[%r28, %r0] 0x73, %r23
	.word 0xee9fe000  ! 50: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	.word 0x87802025  ! 51: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeed52000  ! 52: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r23
	.word 0xecdec9e0  ! 53: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r22
	.word 0x87802074  ! 54: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc7e000  ! 55: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0xeade89e0  ! 56: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r21
	.word 0xeeb78e80  ! 57: STHA_R	stha	%r23, [%r30 + %r0] 0x74
	.word 0xeef72000  ! 58: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 59: NOP	nop
	.word 0xeab544a0  ! 60: STHA_R	stha	%r21, [%r21 + %r0] 0x25
	.word 0xe2c5c4a0  ! 61: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r17
	.word 0xe4f48400  ! 62: STXA_R	stxa	%r18, [%r18 + %r0] 0x20
	.word 0xe4a72000  ! 63: STWA_I	stwa	%r18, [%r28 + 0x0000] %asi
	.word 0xecccc400  ! 64: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0x87802020  ! 65: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 66: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 67: NOP	nop
	mov	0x70, %r25
	.word 0xecbce000  ! 69: STDA_I	stda	%r22, [%r19 + 0x0000] %asi
	.word 0xeab40400  ! 70: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0xeac78e60  ! 71: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r21
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe6af8e40  ! 73: STBA_R	stba	%r19, [%r30 + %r0] 0x72
	.word 0x01000000  ! 74: NOP	nop
	.word 0xe6c4a000  ! 75: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r19
	.word 0xe09d84a0  ! 76: LDDA_R	ldda	[%r22, %r0] 0x25, %r16
	.word 0xe8cd84a0  ! 77: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r20
	.word 0x01000000  ! 78: NOP	nop
	.word 0xe8b4a000  ! 79: STHA_I	stha	%r20, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 80: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8d46000  ! 81: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r20
	.word 0x87802072  ! 82: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8bfa000  ! 83: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	.word 0xecf689e0  ! 84: STXA_R	stxa	%r22, [%r26 + %r0] 0x4f
	.word 0x01000000  ! 85: NOP	nop
	.word 0xe8ad44a0  ! 86: STBA_R	stba	%r20, [%r21 + %r0] 0x25
	.word 0xeebf8e80  ! 87: STDA_R	stda	%r23, [%r30 + %r0] 0x74
	.word 0x87802074  ! 88: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 89: NOP	nop
	.word 0x01000000  ! 90: NOP	nop
	.word 0xeef76000  ! 91: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xe0d48400  ! 92: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r16
	.word 0xe087e000  ! 93: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	.word 0x01000000  ! 94: NOP	nop
	.word 0xeea74e40  ! 95: STWA_R	stwa	%r23, [%r29 + %r0] 0x72
	.word 0x87802073  ! 96: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 97: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeb44400  ! 98: STHA_R	stha	%r23, [%r17 + %r0] 0x20
	mov	0x38, %r17
	.word 0x01000000  ! 100: NOP	nop
	.word 0xeea56000  ! 101: STWA_I	stwa	%r23, [%r21 + 0x0000] %asi
	.word 0x01000000  ! 102: NOP	nop
	.word 0x87802025  ! 103: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeef48400  ! 104: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 105: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 106: NOP	nop
	.word 0xe2c6c9e0  ! 107: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r17
	.word 0xe2962000  ! 108: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r17
	mov	0x68, %r26
	.word 0xe2bea000  ! 110: STDA_I	stda	%r17, [%r26 + 0x0000] %asi
	.word 0xea970e40  ! 111: LDUHA_R	lduha	[%r28, %r0] 0x72, %r21
	.word 0xea874e60  ! 112: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r21
	.word 0x87802020  ! 113: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeabc2000  ! 114: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xee8f8e60  ! 115: LDUBA_R	lduba	[%r30, %r0] 0x73, %r23
	.word 0xeec4a000  ! 116: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r23
	.word 0x01000000  ! 117: NOP	nop
	.word 0xea9f4e80  ! 118: LDDA_R	ldda	[%r29, %r0] 0x74, %r21
	.word 0xeaa46000  ! 119: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	.word 0x01000000  ! 120: NOP	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0x87802073  ! 122: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 123: NOP	nop
	.word 0x8780204f  ! 124: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 125: NOP	nop
	.word 0x87802020  ! 126: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0a78e80  ! 127: STWA_R	stwa	%r16, [%r30 + %r0] 0x74
	mov	0x70, %r24
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b42000  ! 130: STHA_I	stha	%r16, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 131: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc70e60  ! 132: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r22
	.word 0xecace000  ! 133: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 134: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb7ce60  ! 135: STHA_R	stha	%r22, [%r31 + %r0] 0x73
	.word 0xec9f0e60  ! 136: LDDA_R	ldda	[%r28, %r0] 0x73, %r22
	.word 0xecf4e000  ! 137: STXA_I	stxa	%r22, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 138: NOP	nop
	.word 0xecac6000  ! 139: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xecd4a000  ! 140: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r22
	.word 0xea8dc4a0  ! 141: LDUBA_R	lduba	[%r23, %r0] 0x25, %r21
	.word 0xeaac6000  ! 142: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0x01000000  ! 143: NOP	nop
	.word 0x01000000  ! 144: NOP	nop
	.word 0xea9c6000  ! 145: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0x01000000  ! 146: NOP	nop
	.word 0xead42000  ! 147: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xead4a000  ! 148: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xeab42000  ! 149: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	.word 0xe8ccc400  ! 150: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r20
	.word 0x01000000  ! 151: NOP	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0x87802072  ! 153: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8dfa000  ! 154: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0x01000000  ! 155: NOP	nop
	.word 0xeabf8e80  ! 156: STDA_R	stda	%r21, [%r30 + %r0] 0x74
	.word 0xeadfe000  ! 157: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0x87802074  ! 158: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 159: NOP	nop
	.word 0x87802074  ! 160: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeac76000  ! 161: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r21
	.word 0x87802020  ! 162: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b649e0  ! 163: STHA_R	stha	%r19, [%r25 + %r0] 0x4f
	.word 0xe6bfce40  ! 164: STDA_R	stda	%r19, [%r31 + %r0] 0x72
	.word 0xeef40400  ! 165: STXA_R	stxa	%r23, [%r16 + %r0] 0x20
	.word 0x01000000  ! 166: NOP	nop
	mov	0x10, %r18
	.word 0xe89fce40  ! 168: LDDA_R	ldda	[%r31, %r0] 0x72, %r20
	mov	0x20, %r19
	.word 0xe88ce000  ! 170: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xe09cc400  ! 171: LDDA_R	ldda	[%r19, %r0] 0x20, %r16
	.word 0xeabfce60  ! 172: STDA_R	stda	%r21, [%r31 + %r0] 0x73
	.word 0xeaaca000  ! 173: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 174: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaa52000  ! 175: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xeaa52000  ! 176: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xeaf5a000  ! 177: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xe6b584a0  ! 178: STHA_R	stha	%r19, [%r22 + %r0] 0x25
	.word 0xe6bda000  ! 179: STDA_I	stda	%r19, [%r22 + 0x0000] %asi
	.word 0x01000000  ! 180: NOP	nop
	.word 0xe2bdc4a0  ! 181: STDA_R	stda	%r17, [%r23 + %r0] 0x25
	.word 0x8780204f  ! 182: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x01000000  ! 183: NOP	nop
	.word 0x01000000  ! 184: NOP	nop
	.word 0x87802074  ! 185: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2872000  ! 186: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r17
	.word 0xe2874e60  ! 187: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r17
	.word 0x87802020  ! 188: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeef689e0  ! 189: STXA_R	stxa	%r23, [%r26 + %r0] 0x4f
	.word 0x01000000  ! 190: NOP	nop
	.word 0xeeaca000  ! 191: STBA_I	stba	%r23, [%r18 + 0x0000] %asi
	.word 0xeaf689e0  ! 192: STXA_R	stxa	%r21, [%r26 + %r0] 0x4f
	.word 0xec9609e0  ! 193: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r22
	.word 0xecc42000  ! 194: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r22
	.word 0xec9ca000  ! 195: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r22
	.word 0xecace000  ! 196: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xecb4e000  ! 198: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	.word 0xecad44a0  ! 199: STBA_R	stba	%r22, [%r21 + %r0] 0x25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xe0ad84a0  ! 2: STBA_R	stba	%r16, [%r22 + %r0] 0x25
	.word 0x87802074  ! 3: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe88fe000  ! 4: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
idle_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_0), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 5: NOP	nop
resume_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_0), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe8972000  ! 7: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0xe8c7a000  ! 8: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 9: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 10: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8a5e000  ! 11: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xe294c400  ! 12: LDUHA_R	lduha	[%r19, %r0] 0x20, %r17
idle_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_1), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 13: NOP	nop
	.word 0xe4b52000  ! 14: STHA_I	stha	%r18, [%r20 + 0x0000] %asi
	.word 0xeea40400  ! 15: STWA_R	stwa	%r23, [%r16 + %r0] 0x20
resume_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_1), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 16: NOP	nop
	.word 0x8780204f  ! 17: WRASI_I	wr	%r0, 0x004f, %asi
idle_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_2), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe2bf8e40  ! 19: STDA_R	stda	%r17, [%r30 + %r0] 0x72
	.word 0xe6f42000  ! 20: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0xe6d42000  ! 21: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r19
	.word 0x87802074  ! 22: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x78, %r27
	.word 0xe686e000  ! 24: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r19
	.word 0xe69ea000  ! 25: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r19
	.word 0xe6a62000  ! 26: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0x87802025  ! 27: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6ada000  ! 28: STBA_I	stba	%r19, [%r22 + 0x0000] %asi
resume_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_2), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 29: NOP	nop
	.word 0xe6f56000  ! 30: STXA_I	stxa	%r19, [%r21 + 0x0000] %asi
idle_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_3), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 31: NOP	nop
	.word 0xec87ce60  ! 32: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r22
	.word 0x87802020  ! 33: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee8f8e80  ! 34: LDUBA_R	lduba	[%r30, %r0] 0x74, %r23
	.word 0xecdcc400  ! 35: LDXA_R	ldxa	[%r19, %r0] 0x20, %r22
	.word 0xeeb7a000  ! 36: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	.word 0xeed72000  ! 37: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xeca78e40  ! 38: STWA_R	stwa	%r22, [%r30 + %r0] 0x72
	.word 0xe69c0400  ! 39: LDDA_R	ldda	[%r16, %r0] 0x20, %r19
	.word 0xeeb76000  ! 40: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xe2dfce60  ! 41: LDXA_R	ldxa	[%r31, %r0] 0x73, %r17
	.word 0x87802074  ! 42: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 43: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6ada000  ! 44: STBA_I	stba	%r19, [%r22 + 0x0000] %asi
	.word 0xe6852000  ! 45: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r19
	.word 0xecbcc400  ! 46: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0x87802025  ! 47: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2cd84a0  ! 48: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r17
	.word 0xec9f4e80  ! 49: LDDA_R	ldda	[%r29, %r0] 0x74, %r22
	.word 0xee9fe000  ! 50: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	.word 0x87802074  ! 51: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeed5e000  ! 52: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r23
	.word 0xe2df4e40  ! 53: LDXA_R	ldxa	[%r29, %r0] 0x72, %r17
	.word 0x87802074  ! 54: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc7a000  ! 55: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe4df0e80  ! 56: LDXA_R	ldxa	[%r28, %r0] 0x74, %r18
	.word 0xe4b6c9e0  ! 57: STHA_R	stha	%r18, [%r27 + %r0] 0x4f
	.word 0xeef7a000  ! 58: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
resume_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_3), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 59: NOP	nop
	.word 0xeeb74e60  ! 60: STHA_R	stha	%r23, [%r29 + %r0] 0x73
	.word 0xe0c40400  ! 61: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r16
	.word 0xecf609e0  ! 62: STXA_R	stxa	%r22, [%r24 + %r0] 0x4f
	.word 0xe4a7a000  ! 63: STWA_I	stwa	%r18, [%r30 + 0x0000] %asi
	.word 0xecccc400  ! 64: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0x87802020  ! 65: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 66: WRASI_I	wr	%r0, 0x0074, %asi
idle_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_4), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 67: NOP	nop
	mov	0x30, %r25
	.word 0xecbc6000  ! 69: STDA_I	stda	%r22, [%r17 + 0x0000] %asi
	.word 0xe2b689e0  ! 70: STHA_R	stha	%r17, [%r26 + %r0] 0x4f
	.word 0xeac689e0  ! 71: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r21
resume_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_4), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe8afce40  ! 73: STBA_R	stba	%r20, [%r31 + %r0] 0x72
idle_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_5), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 74: NOP	nop
	.word 0xe6c4e000  ! 75: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r19
	.word 0xec9c0400  ! 76: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0xeacd84a0  ! 77: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r21
resume_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_5), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 78: NOP	nop
	.word 0xe8b46000  ! 79: STHA_I	stha	%r20, [%r17 + 0x0000] %asi
	.word 0x8780204f  ! 80: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8d4a000  ! 81: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 82: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8bf2000  ! 83: STDA_I	stda	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f40400  ! 84: STXA_R	stxa	%r20, [%r16 + %r0] 0x20
idle_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_6), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 85: NOP	nop
	.word 0xe8ad44a0  ! 86: STBA_R	stba	%r20, [%r21 + %r0] 0x25
	.word 0xeabf0e40  ! 87: STDA_R	stda	%r21, [%r28 + %r0] 0x72
	.word 0x87802072  ! 88: WRASI_I	wr	%r0, 0x0072, %asi
resume_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_6), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 89: NOP	nop
idle_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_7), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 90: NOP	nop
	.word 0xeef7e000  ! 91: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xead6c9e0  ! 92: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r21
	.word 0xe0872000  ! 93: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r16
resume_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_7), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 94: NOP	nop
	.word 0xe4a74e40  ! 95: STWA_R	stwa	%r18, [%r29 + %r0] 0x72
	.word 0x8780204f  ! 96: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 97: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0b649e0  ! 98: STHA_R	stha	%r16, [%r25 + %r0] 0x4f
	mov	0x0, %r18
idle_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_8), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 100: NOP	nop
	.word 0xeea52000  ! 101: STWA_I	stwa	%r23, [%r20 + 0x0000] %asi
resume_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_8), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 102: NOP	nop
	.word 0x87802020  ! 103: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f70e40  ! 104: STXA_R	stxa	%r16, [%r28 + %r0] 0x72
	.word 0x87802072  ! 105: WRASI_I	wr	%r0, 0x0072, %asi
idle_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_9), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 106: NOP	nop
	.word 0xeac74e80  ! 107: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r21
	.word 0xe2966000  ! 108: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r17
	mov	0x18, %r26
	.word 0xe2bee000  ! 110: STDA_I	stda	%r17, [%r27 + 0x0000] %asi
	.word 0xe2970e80  ! 111: LDUHA_R	lduha	[%r28, %r0] 0x74, %r17
	.word 0xe086c9e0  ! 112: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r16
	.word 0x87802020  ! 113: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeabce000  ! 114: STDA_I	stda	%r21, [%r19 + 0x0000] %asi
	.word 0xe28f4e80  ! 115: LDUBA_R	lduba	[%r29, %r0] 0x74, %r17
	.word 0xeec42000  ! 116: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r23
resume_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_9), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 117: NOP	nop
	.word 0xee9fce40  ! 118: LDDA_R	ldda	[%r31, %r0] 0x72, %r23
	.word 0xeaa46000  ! 119: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
idle_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_10), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 120: NOP	nop
resume_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_10), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 121: NOP	nop
	.word 0x87802074  ! 122: WRASI_I	wr	%r0, 0x0074, %asi
idle_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_11), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 123: NOP	nop
	.word 0x87802074  ! 124: WRASI_I	wr	%r0, 0x0074, %asi
resume_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_11), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 125: NOP	nop
	.word 0x8780204f  ! 126: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a504a0  ! 127: STWA_R	stwa	%r19, [%r20 + %r0] 0x25
	mov	0x0, %r27
idle_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_12), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b42000  ! 130: STHA_I	stha	%r16, [%r16 + 0x0000] %asi
	.word 0x87802072  ! 131: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0c4c400  ! 132: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r16
	.word 0xecace000  ! 133: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0x8780204f  ! 134: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b7ce80  ! 135: STHA_R	stha	%r19, [%r31 + %r0] 0x74
	.word 0xe89e89e0  ! 136: LDDA_R	ldda	[%r26, %r0] 0x4f, %r20
	.word 0xecf4a000  ! 137: STXA_I	stxa	%r22, [%r18 + 0x0000] %asi
resume_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_12), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 138: NOP	nop
	.word 0xecaca000  ! 139: STBA_I	stba	%r22, [%r18 + 0x0000] %asi
	.word 0xecd4e000  ! 140: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r22
	.word 0xe28c4400  ! 141: LDUBA_R	lduba	[%r17, %r0] 0x20, %r17
	.word 0xeaace000  ! 142: STBA_I	stba	%r21, [%r19 + 0x0000] %asi
idle_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_13), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 143: NOP	nop
resume_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_13), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 144: NOP	nop
	.word 0xea9c2000  ! 145: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r21
idle_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_14), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 146: NOP	nop
	.word 0xead42000  ! 147: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xead4a000  ! 148: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xeab4e000  ! 149: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xe2ce09e0  ! 150: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r17
resume_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_14), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 151: NOP	nop
idle_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_15), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 152: NOP	nop
	.word 0x87802025  ! 153: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8dfe000  ! 154: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
resume_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_15), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe4bf0e40  ! 156: STDA_R	stda	%r18, [%r28 + %r0] 0x72
	.word 0xeadfe000  ! 157: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0x87802020  ! 158: WRASI_I	wr	%r0, 0x0020, %asi
idle_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_16), 16, 16)) -> intp(1, 2, 4)
	.word 0x01000000  ! 159: NOP	nop
	.word 0x87802020  ! 160: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeac7a000  ! 161: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r21
	.word 0x87802072  ! 162: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2b544a0  ! 163: STHA_R	stha	%r17, [%r21 + %r0] 0x25
	.word 0xe4bdc4a0  ! 164: STDA_R	stda	%r18, [%r23 + %r0] 0x25
	.word 0xe8f48400  ! 165: STXA_R	stxa	%r20, [%r18 + %r0] 0x20
resume_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_16), 16, 16)) -> intp(1, 3, 4)
	.word 0x01000000  ! 166: NOP	nop
	mov	0x18, %r19
	.word 0xe29f8e40  ! 168: LDDA_R	ldda	[%r30, %r0] 0x72, %r17
	mov	0x8, %r16
	.word 0xe88ce000  ! 170: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xec9c0400  ! 171: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0xeabec9e0  ! 172: STDA_R	stda	%r21, [%r27 + %r0] 0x4f
	.word 0xeaac2000  ! 173: STBA_I	stba	%r21, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 174: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaa5e000  ! 175: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaa56000  ! 176: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0xeaf56000  ! 177: STXA_I	stxa	%r21, [%r21 + 0x0000] %asi
	.word 0xe8b584a0  ! 178: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0xe6bd6000  ! 179: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
idle_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_17), 16, 16)) -> intp(2, 2, 4)
	.word 0x01000000  ! 180: NOP	nop
	.word 0xe6bf8e80  ! 181: STDA_R	stda	%r19, [%r30 + %r0] 0x74
	.word 0x87802073  ! 182: WRASI_I	wr	%r0, 0x0073, %asi
resume_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_17), 16, 16)) -> intp(2, 3, 4)
	.word 0x01000000  ! 183: NOP	nop
idle_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.idle_18), 16, 16)) -> intp(0, 2, 4)
	.word 0x01000000  ! 184: NOP	nop
	.word 0x87802020  ! 185: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2872000  ! 186: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r17
	.word 0xe0878e60  ! 187: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r16
	.word 0x87802025  ! 188: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeef44400  ! 189: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
resume_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.resume_18), 16, 16)) -> intp(0, 3, 4)
	.word 0x01000000  ! 190: NOP	nop
	.word 0xeeaca000  ! 191: STBA_I	stba	%r23, [%r18 + 0x0000] %asi
	.word 0xe6f504a0  ! 192: STXA_R	stxa	%r19, [%r20 + %r0] 0x25
	.word 0xe094c400  ! 193: LDUHA_R	lduha	[%r19, %r0] 0x20, %r16
	.word 0xecc4a000  ! 194: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r22
	.word 0xec9c2000  ! 195: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r22
	.word 0xecace000  ! 196: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xecb42000  ! 198: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	.word 0xe0ae49e0  ! 199: STBA_R	stba	%r16, [%r25 + %r0] 0x4f
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xe0acc400  ! 2: STBA_R	stba	%r16, [%r19 + %r0] 0x20
	.word 0x87802074  ! 3: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe88f2000  ! 4: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r20
	.word 0x01000000  ! 5: NOP	nop
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe8972000  ! 7: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0xe8c76000  ! 8: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r20
	.word 0x87802025  ! 9: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 10: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a56000  ! 11: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0xe4948400  ! 12: LDUHA_R	lduha	[%r18, %r0] 0x20, %r18
	.word 0x01000000  ! 13: NOP	nop
	.word 0xe4b52000  ! 14: STHA_I	stha	%r18, [%r20 + 0x0000] %asi
	.word 0xeaa6c9e0  ! 15: STWA_R	stwa	%r21, [%r27 + %r0] 0x4f
	.word 0x01000000  ! 16: NOP	nop
	.word 0x87802073  ! 17: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe6bd44a0  ! 19: STDA_R	stda	%r19, [%r21 + %r0] 0x25
	.word 0xe6f46000  ! 20: STXA_I	stxa	%r19, [%r17 + 0x0000] %asi
	.word 0xe6d46000  ! 21: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r19
	.word 0x87802020  ! 22: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r24
	.word 0xe6866000  ! 24: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r19
	.word 0xe69e2000  ! 25: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a6e000  ! 26: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0x87802020  ! 27: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ada000  ! 28: STBA_I	stba	%r19, [%r22 + 0x0000] %asi
	.word 0x01000000  ! 29: NOP	nop
	.word 0xe6f5e000  ! 30: STXA_I	stxa	%r19, [%r23 + 0x0000] %asi
	.word 0x01000000  ! 31: NOP	nop
	.word 0xe88544a0  ! 32: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r20
	.word 0x87802020  ! 33: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec8d04a0  ! 34: LDUBA_R	lduba	[%r20, %r0] 0x25, %r22
	.word 0xe0de09e0  ! 35: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r16
	.word 0xeeb7e000  ! 36: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	.word 0xeed7e000  ! 37: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0xeaa4c400  ! 38: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	.word 0xe69c0400  ! 39: LDDA_R	ldda	[%r16, %r0] 0x20, %r19
	.word 0xeeb76000  ! 40: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xe2df0e80  ! 41: LDXA_R	ldxa	[%r28, %r0] 0x74, %r17
	.word 0x87802072  ! 42: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 43: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6ad2000  ! 44: STBA_I	stba	%r19, [%r20 + 0x0000] %asi
	.word 0xe6852000  ! 45: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r19
	.word 0xe6be49e0  ! 46: STDA_R	stda	%r19, [%r25 + %r0] 0x4f
	.word 0x8780204f  ! 47: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeacf0e40  ! 48: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r21
	.word 0xea9cc400  ! 49: LDDA_R	ldda	[%r19, %r0] 0x20, %r21
	.word 0xee9f6000  ! 50: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	.word 0x87802020  ! 51: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeed5a000  ! 52: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	.word 0xe2dc8400  ! 53: LDXA_R	ldxa	[%r18, %r0] 0x20, %r17
	.word 0x87802073  ! 54: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecc7a000  ! 55: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xeade49e0  ! 56: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r21
	.word 0xe6b70e60  ! 57: STHA_R	stha	%r19, [%r28 + %r0] 0x73
	.word 0xeef7a000  ! 58: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0x01000000  ! 59: NOP	nop
	.word 0xe8b78e40  ! 60: STHA_R	stha	%r20, [%r30 + %r0] 0x72
	.word 0xe6c78e60  ! 61: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r19
	.word 0xe6f544a0  ! 62: STXA_R	stxa	%r19, [%r21 + %r0] 0x25
	.word 0xe4a76000  ! 63: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0xeeccc400  ! 64: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r23
	.word 0x87802020  ! 65: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 66: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 67: NOP	nop
	mov	0x0, %r25
	.word 0xecbce000  ! 69: STDA_I	stda	%r22, [%r19 + 0x0000] %asi
	.word 0xeab48400  ! 70: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xe8c544a0  ! 71: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r20
	.word 0x01000000  ! 72: NOP	nop
	.word 0xeeaf8e40  ! 73: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0x01000000  ! 74: NOP	nop
	.word 0xe6c42000  ! 75: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r19
	.word 0xea9f8e80  ! 76: LDDA_R	ldda	[%r30, %r0] 0x74, %r21
	.word 0xe2cc8400  ! 77: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r17
	.word 0x01000000  ! 78: NOP	nop
	.word 0xe8b42000  ! 79: STHA_I	stha	%r20, [%r16 + 0x0000] %asi
	.word 0x87802025  ! 80: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8d46000  ! 81: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r20
	.word 0x87802073  ! 82: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8bf2000  ! 83: STDA_I	stda	%r20, [%r28 + 0x0000] %asi
	.word 0xeaf78e60  ! 84: STXA_R	stxa	%r21, [%r30 + %r0] 0x73
	.word 0x01000000  ! 85: NOP	nop
	.word 0xe8ad04a0  ! 86: STBA_R	stba	%r20, [%r20 + %r0] 0x25
	.word 0xe8bdc4a0  ! 87: STDA_R	stda	%r20, [%r23 + %r0] 0x25
	.word 0x87802020  ! 88: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 89: NOP	nop
	.word 0x01000000  ! 90: NOP	nop
	.word 0xeef76000  ! 91: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeed40400  ! 92: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r23
	.word 0xe0876000  ! 93: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r16
	.word 0x01000000  ! 94: NOP	nop
	.word 0xeea7ce80  ! 95: STWA_R	stwa	%r23, [%r31 + %r0] 0x74
	.word 0x87802020  ! 96: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 97: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b7ce80  ! 98: STHA_R	stha	%r20, [%r31 + %r0] 0x74
	mov	0x28, %r17
	.word 0x01000000  ! 100: NOP	nop
	.word 0xeea56000  ! 101: STWA_I	stwa	%r23, [%r21 + 0x0000] %asi
	.word 0x01000000  ! 102: NOP	nop
	.word 0x8780204f  ! 103: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6f74e80  ! 104: STXA_R	stxa	%r19, [%r29 + %r0] 0x74
	.word 0x87802074  ! 105: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 106: NOP	nop
	.word 0xeac7ce80  ! 107: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r21
	.word 0xe2966000  ! 108: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r17
	mov	0x50, %r27
	.word 0xe2be6000  ! 110: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0xe294c400  ! 111: LDUHA_R	lduha	[%r19, %r0] 0x20, %r17
	.word 0xe88689e0  ! 112: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r20
	.word 0x8780204f  ! 113: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeabce000  ! 114: STDA_I	stda	%r21, [%r19 + 0x0000] %asi
	.word 0xec8d44a0  ! 115: LDUBA_R	lduba	[%r21, %r0] 0x25, %r22
	.word 0xeec4a000  ! 116: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r23
	.word 0x01000000  ! 117: NOP	nop
	.word 0xec9c0400  ! 118: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0xeaa4e000  ! 119: STWA_I	stwa	%r21, [%r19 + 0x0000] %asi
	.word 0x01000000  ! 120: NOP	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0x87802020  ! 122: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 123: NOP	nop
	.word 0x87802020  ! 124: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 125: NOP	nop
	.word 0x87802072  ! 126: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0a48400  ! 127: STWA_R	stwa	%r16, [%r18 + %r0] 0x20
	mov	0x70, %r27
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b46000  ! 130: STHA_I	stha	%r16, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 131: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c4c400  ! 132: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r18
	.word 0xecaca000  ! 133: STBA_I	stba	%r22, [%r18 + 0x0000] %asi
	.word 0x87802074  ! 134: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8b74e80  ! 135: STHA_R	stha	%r20, [%r29 + %r0] 0x74
	.word 0xe69f4e60  ! 136: LDDA_R	ldda	[%r29, %r0] 0x73, %r19
	.word 0xecf42000  ! 137: STXA_I	stxa	%r22, [%r16 + 0x0000] %asi
	.word 0x01000000  ! 138: NOP	nop
	.word 0xecac6000  ! 139: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xecd4a000  ! 140: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r22
	.word 0xe48e09e0  ! 141: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r18
	.word 0xeaac6000  ! 142: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0x01000000  ! 143: NOP	nop
	.word 0x01000000  ! 144: NOP	nop
	.word 0xea9c6000  ! 145: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0x01000000  ! 146: NOP	nop
	.word 0xead46000  ! 147: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xead42000  ! 148: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xeab4e000  ! 149: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xe2ce09e0  ! 150: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r17
	.word 0x01000000  ! 151: NOP	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0x87802074  ! 153: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8df2000  ! 154: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r20
	.word 0x01000000  ! 155: NOP	nop
	.word 0xe0bc0400  ! 156: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	.word 0xeadfe000  ! 157: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0x87802020  ! 158: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 159: NOP	nop
	.word 0x87802074  ! 160: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeac76000  ! 161: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r21
	.word 0x87802020  ! 162: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b544a0  ! 163: STHA_R	stha	%r20, [%r21 + %r0] 0x25
	.word 0xeebfce40  ! 164: STDA_R	stda	%r23, [%r31 + %r0] 0x72
	.word 0xe6f44400  ! 165: STXA_R	stxa	%r19, [%r17 + %r0] 0x20
	.word 0x01000000  ! 166: NOP	nop
	mov	0x0, %r18
	.word 0xec9c8400  ! 168: LDDA_R	ldda	[%r18, %r0] 0x20, %r22
	mov	0x60, %r18
	.word 0xe88c6000  ! 170: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r20
	.word 0xea9c8400  ! 171: LDDA_R	ldda	[%r18, %r0] 0x20, %r21
	.word 0xe4bf4e60  ! 172: STDA_R	stda	%r18, [%r29 + %r0] 0x73
	.word 0xeaac2000  ! 173: STBA_I	stba	%r21, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 174: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaa5e000  ! 175: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaa52000  ! 176: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xeaf5e000  ! 177: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	.word 0xeeb70e40  ! 178: STHA_R	stha	%r23, [%r28 + %r0] 0x72
	.word 0xe6bd6000  ! 179: STDA_I	stda	%r19, [%r21 + 0x0000] %asi
	.word 0x01000000  ! 180: NOP	nop
	.word 0xe4bd84a0  ! 181: STDA_R	stda	%r18, [%r22 + %r0] 0x25
	.word 0x87802072  ! 182: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x01000000  ! 183: NOP	nop
	.word 0x01000000  ! 184: NOP	nop
	.word 0x87802025  ! 185: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe287a000  ! 186: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2848400  ! 187: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r17
	.word 0x87802025  ! 188: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeef689e0  ! 189: STXA_R	stxa	%r23, [%r26 + %r0] 0x4f
	.word 0x01000000  ! 190: NOP	nop
	.word 0xeeaca000  ! 191: STBA_I	stba	%r23, [%r18 + 0x0000] %asi
	.word 0xeaf74e40  ! 192: STXA_R	stxa	%r21, [%r29 + %r0] 0x72
	.word 0xe097ce80  ! 193: LDUHA_R	lduha	[%r31, %r0] 0x74, %r16
	.word 0xecc4e000  ! 194: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r22
	.word 0xec9c2000  ! 195: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r22
	.word 0xecaca000  ! 196: STBA_I	stba	%r22, [%r18 + 0x0000] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xecb42000  ! 198: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	.word 0xecac8400  ! 199: STBA_R	stba	%r22, [%r18 + %r0] 0x20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xe4af8e40  ! 2: STBA_R	stba	%r18, [%r30 + %r0] 0x72
	.word 0x8780204f  ! 3: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe88f6000  ! 4: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	.word 0x01000000  ! 5: NOP	nop
	.word 0x01000000  ! 6: NOP	nop
	.word 0xe897e000  ! 7: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe8c7e000  ! 8: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0x87802074  ! 9: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802072  ! 10: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8a56000  ! 11: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0xee9584a0  ! 12: LDUHA_R	lduha	[%r22, %r0] 0x25, %r23
	.word 0x01000000  ! 13: NOP	nop
	.word 0xe4b52000  ! 14: STHA_I	stha	%r18, [%r20 + 0x0000] %asi
	.word 0xeea5c4a0  ! 15: STWA_R	stwa	%r23, [%r23 + %r0] 0x25
	.word 0x01000000  ! 16: NOP	nop
	.word 0x87802025  ! 17: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 18: NOP	nop
	.word 0xe4bcc400  ! 19: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	.word 0xe6f4a000  ! 20: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	.word 0xe6d46000  ! 21: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r19
	.word 0x87802025  ! 22: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x50, %r26
	.word 0xe686e000  ! 24: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r19
	.word 0xe69ea000  ! 25: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r19
	.word 0xe6a62000  ! 26: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0x87802074  ! 27: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6ad2000  ! 28: STBA_I	stba	%r19, [%r20 + 0x0000] %asi
	.word 0x01000000  ! 29: NOP	nop
	.word 0xe6f52000  ! 30: STXA_I	stxa	%r19, [%r20 + 0x0000] %asi
	.word 0x01000000  ! 31: NOP	nop
	.word 0xec870e40  ! 32: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r22
	.word 0x87802020  ! 33: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8fce80  ! 34: LDUBA_R	lduba	[%r31, %r0] 0x74, %r21
	.word 0xeadf8e60  ! 35: LDXA_R	ldxa	[%r30, %r0] 0x73, %r21
	.word 0xeeb72000  ! 36: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xeed76000  ! 37: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xeaa44400  ! 38: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xe09c4400  ! 39: LDDA_R	ldda	[%r17, %r0] 0x20, %r16
	.word 0xeeb7a000  ! 40: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	.word 0xe8df0e40  ! 41: LDXA_R	ldxa	[%r28, %r0] 0x72, %r20
	.word 0x87802074  ! 42: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 43: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6ad6000  ! 44: STBA_I	stba	%r19, [%r21 + 0x0000] %asi
	.word 0xe6852000  ! 45: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r19
	.word 0xecbe49e0  ! 46: STDA_R	stda	%r22, [%r25 + %r0] 0x4f
	.word 0x8780204f  ! 47: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeecc0400  ! 48: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r23
	.word 0xea9c4400  ! 49: LDDA_R	ldda	[%r17, %r0] 0x20, %r21
	.word 0xee9f6000  ! 50: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 51: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeed56000  ! 52: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r23
	.word 0xe4dd84a0  ! 53: LDXA_R	ldxa	[%r22, %r0] 0x25, %r18
	.word 0x87802074  ! 54: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc72000  ! 55: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	.word 0xeadcc400  ! 56: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	.word 0xecb74e80  ! 57: STHA_R	stha	%r22, [%r29 + %r0] 0x74
	.word 0xeef72000  ! 58: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0x01000000  ! 59: NOP	nop
	.word 0xe6b504a0  ! 60: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	.word 0xeac504a0  ! 61: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r21
	.word 0xe2f609e0  ! 62: STXA_R	stxa	%r17, [%r24 + %r0] 0x4f
	.word 0xe4a7a000  ! 63: STWA_I	stwa	%r18, [%r30 + 0x0000] %asi
	.word 0xe4ccc400  ! 64: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r18
	.word 0x87802072  ! 65: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 66: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 67: NOP	nop
	mov	0x8, %r24
	.word 0xecbca000  ! 69: STDA_I	stda	%r22, [%r18 + 0x0000] %asi
	.word 0xe8b609e0  ! 70: STHA_R	stha	%r20, [%r24 + %r0] 0x4f
	.word 0xeec48400  ! 71: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r23
	.word 0x01000000  ! 72: NOP	nop
	.word 0xe4afce40  ! 73: STBA_R	stba	%r18, [%r31 + %r0] 0x72
	.word 0x01000000  ! 74: NOP	nop
	.word 0xe6c46000  ! 75: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r19
	.word 0xe29f8e40  ! 76: LDDA_R	ldda	[%r30, %r0] 0x72, %r17
	.word 0xecccc400  ! 77: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0x01000000  ! 78: NOP	nop
	.word 0xe8b4e000  ! 79: STHA_I	stha	%r20, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 80: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8d42000  ! 81: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r20
	.word 0x87802072  ! 82: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8bfa000  ! 83: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	.word 0xe0f48400  ! 84: STXA_R	stxa	%r16, [%r18 + %r0] 0x20
	.word 0x01000000  ! 85: NOP	nop
	.word 0xecaf8e60  ! 86: STBA_R	stba	%r22, [%r30 + %r0] 0x73
	.word 0xe6be09e0  ! 87: STDA_R	stda	%r19, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 88: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 89: NOP	nop
	.word 0x01000000  ! 90: NOP	nop
	.word 0xeef76000  ! 91: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xecd78e40  ! 92: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r22
	.word 0xe087e000  ! 93: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	.word 0x01000000  ! 94: NOP	nop
	.word 0xe4a5c4a0  ! 95: STWA_R	stwa	%r18, [%r23 + %r0] 0x25
	.word 0x87802020  ! 96: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 97: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab4c400  ! 98: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	mov	0x0, %r19
	.word 0x01000000  ! 100: NOP	nop
	.word 0xeea52000  ! 101: STWA_I	stwa	%r23, [%r20 + 0x0000] %asi
	.word 0x01000000  ! 102: NOP	nop
	.word 0x87802072  ! 103: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0f689e0  ! 104: STXA_R	stxa	%r16, [%r26 + %r0] 0x4f
	.word 0x87802073  ! 105: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x01000000  ! 106: NOP	nop
	.word 0xeec78e60  ! 107: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r23
	.word 0xe2962000  ! 108: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r17
	mov	0x28, %r26
	.word 0xe2bea000  ! 110: STDA_I	stda	%r17, [%r26 + 0x0000] %asi
	.word 0xe8978e60  ! 111: LDUHA_R	lduha	[%r30, %r0] 0x73, %r20
	.word 0xe8870e60  ! 112: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r20
	.word 0x87802025  ! 113: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeabca000  ! 114: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0xe28e09e0  ! 115: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r17
	.word 0xeec4a000  ! 116: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r23
	.word 0x01000000  ! 117: NOP	nop
	.word 0xe29e89e0  ! 118: LDDA_R	ldda	[%r26, %r0] 0x4f, %r17
	.word 0xeaa42000  ! 119: STWA_I	stwa	%r21, [%r16 + 0x0000] %asi
	.word 0x01000000  ! 120: NOP	nop
	.word 0x01000000  ! 121: NOP	nop
	.word 0x87802074  ! 122: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 123: NOP	nop
	.word 0x87802074  ! 124: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x01000000  ! 125: NOP	nop
	.word 0x87802025  ! 126: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeca40400  ! 127: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	mov	0x58, %r24
	.word 0x01000000  ! 129: NOP	nop
	.word 0xe0b4e000  ! 130: STHA_I	stha	%r16, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 131: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6c6c9e0  ! 132: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r19
	.word 0xecace000  ! 133: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 134: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb44400  ! 135: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	.word 0xec9f8e40  ! 136: LDDA_R	ldda	[%r30, %r0] 0x72, %r22
	.word 0xecf42000  ! 137: STXA_I	stxa	%r22, [%r16 + 0x0000] %asi
	.word 0x01000000  ! 138: NOP	nop
	.word 0xecace000  ! 139: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xecd46000  ! 140: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r22
	.word 0xea8fce80  ! 141: LDUBA_R	lduba	[%r31, %r0] 0x74, %r21
	.word 0xeaaca000  ! 142: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	.word 0x01000000  ! 143: NOP	nop
	.word 0x01000000  ! 144: NOP	nop
	.word 0xea9c6000  ! 145: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0x01000000  ! 146: NOP	nop
	.word 0xead4a000  ! 147: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xead42000  ! 148: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xeab4e000  ! 149: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xe4ccc400  ! 150: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r18
	.word 0x01000000  ! 151: NOP	nop
	.word 0x01000000  ! 152: NOP	nop
	.word 0x87802074  ! 153: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8dfa000  ! 154: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0x01000000  ! 155: NOP	nop
	.word 0xeebfce80  ! 156: STDA_R	stda	%r23, [%r31 + %r0] 0x74
	.word 0xeadfe000  ! 157: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0x87802020  ! 158: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x01000000  ! 159: NOP	nop
	.word 0x8780204f  ! 160: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeac7e000  ! 161: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 162: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab4c400  ! 163: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	.word 0xe8bf0e40  ! 164: STDA_R	stda	%r20, [%r28 + %r0] 0x72
	.word 0xe8f584a0  ! 165: STXA_R	stxa	%r20, [%r22 + %r0] 0x25
	.word 0x01000000  ! 166: NOP	nop
	mov	0x38, %r18
	.word 0xe49f0e40  ! 168: LDDA_R	ldda	[%r28, %r0] 0x72, %r18
	mov	0x10, %r19
	.word 0xe88c2000  ! 170: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r20
	.word 0xe09c0400  ! 171: LDDA_R	ldda	[%r16, %r0] 0x20, %r16
	.word 0xeabe09e0  ! 172: STDA_R	stda	%r21, [%r24 + %r0] 0x4f
	.word 0xeaac6000  ! 173: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 174: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaa5e000  ! 175: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaa5a000  ! 176: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xeaf5a000  ! 177: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xe8b4c400  ! 178: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe6bda000  ! 179: STDA_I	stda	%r19, [%r22 + 0x0000] %asi
	.word 0x01000000  ! 180: NOP	nop
	.word 0xeebc4400  ! 181: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	.word 0x87802025  ! 182: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x01000000  ! 183: NOP	nop
	.word 0x01000000  ! 184: NOP	nop
	.word 0x87802020  ! 185: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe287e000  ! 186: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r17
	.word 0xe4848400  ! 187: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r18
	.word 0x87802020  ! 188: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2f609e0  ! 189: STXA_R	stxa	%r17, [%r24 + %r0] 0x4f
	.word 0x01000000  ! 190: NOP	nop
	.word 0xeeac6000  ! 191: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0xe0f689e0  ! 192: STXA_R	stxa	%r16, [%r26 + %r0] 0x4f
	.word 0xe09609e0  ! 193: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r16
	.word 0xecc4e000  ! 194: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r22
	.word 0xec9c2000  ! 195: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r22
	.word 0xecac2000  ! 196: STBA_I	stba	%r22, [%r16 + 0x0000] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xecb4a000  ! 198: STHA_I	stha	%r22, [%r18 + 0x0000] %asi
	.word 0xe0ae49e0  ! 199: STBA_R	stba	%r16, [%r25 + %r0] 0x4f

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x06b8fc950e6fb014
	.xword	0x09063e16d6bfc7d6
	.xword	0x785d99ab9914fd26
	.xword	0x470fab3fc46dc238
	.xword	0xba7403f50b0209f1
	.xword	0x65503346f188ad27
	.xword	0xc410d35b12b8cb7a
	.xword	0xef6afe2bb11bd2d1
	.xword	0xdf7e1b9955ece5b1
	.xword	0xf4b33a4b2b5aafe1
	.xword	0x3a7451bed5f211af
	.xword	0x9d5bff384ffdbbc6
	.xword	0xa2019f3f8c1b8558
	.xword	0xb33ca0b6d403b99e
	.xword	0x73d0aef926b81b3b
	.xword	0xf920936e617fb846



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_sus_res_1.j
!!#  * Description:
!!#  * This temple is targets the suspend_resume coverage object, by interseting
!!#  * idle, and resume interrupt events in between the asi access,
!!#  * actually thread3 behaves as main thread controlling idle/resume of other (0...2)
!!#  * threads
!!#  */
!!# 
!!# template main ();
!!# 
!!# 
!!# %%section c_declarations
!!# 
!!#   int i, j;
!!#   int idle_intr = 1;
!!#   int idle_cnt = 0;
!!#   int resume_cnt = 0;
!!#   int intr_tid = 0;
!!# 
!!#   my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# %%section init
!!# 
!!#   static int asi_rvar_array[6] = {Rv_20, Rv_25, Rv_4f, Rv_72_73_74, Rv_72_73_74, Rv_72_73_74};
!!# 
!!#   IJ_bind_thread_group(th_M, 0x8);
!!#   IJ_bind_thread_group(th_all, 0xf);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "{16}" );
!!#   IJ_set_rvar (Rv_low_wt, "{1}");
!!#   IJ_set_rvar (Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar (Rv_intr_vect, "5'brrrrr");
!!# 
!!#   /* scratch pad asi = 0x20; va = 0 - 38 */
!!#   IJ_set_rvar (Rv_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   /* queue asi = 0x25; va = 3c0 - 3f8 */
!!#   IJ_set_rvar (Rv_q_va, "13'b0 0r11 11rr r000");
!!# 
!!#   /* hyp scratch pad asi = 0x4f; va = 0 - 38 */
!!#   IJ_set_rvar (Rv_hyp_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar (Rv_asi, "{0x20, 0x25, 0x4f, 0x72, 0x73, 0x74}");
!!#   IJ_copy_rvar (Rv_asi_reg, Rv_asi);
!!# 
!!#   IJ_set_rvar (Rv_20, "5'b1 00rr");
!!#   IJ_set_rvar (Rv_25, "5'b1 01rr");
!!#   IJ_set_rvar (Rv_4f, "5'b1 10rr");
!!#   IJ_set_rvar (Rv_72_73_74, "5'b1 11rr");
!!# 
!!#   IJ_assign_ropr_fld (ijdefault, Ft_Imm_Asi, Rv_asi);
!!# 
!!#   IJ_set_rvar (Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0 0000 0000 rr00");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_install_ropr_cb (ijdefault, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_set_ropr_fld   ( Ro_asi, Ft_Rs1, "{0}");
!!#   IJ_assign_ropr_fld (Ro_asi, Ft_Simm13, Rv_asi_reg);
!!# 
!!#   IJ_set_ropr_fld    (Ro_reg_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld    (Ro_reg_asi, Ft_Simm13, "{0}");
!!#   IJ_install_ropr_cb (Ro_reg_asi, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi_reg, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_init_regs_by_setx (th_all, 3, 1, Rv_rand64);
!!#   IJ_printf (th_all, "\tsetx\tdata_start, %%r1, %%r25\n");
!!# 
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r16\n", Rv_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r17\n", Rv_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r18\n", Rv_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r19\n", Rv_scratch_pad_va);
!!# 
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r20\n", Rv_q_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r21\n", Rv_q_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r22\n", Rv_q_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r23\n", Rv_q_va);
!!# 
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r24\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r25\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r26\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r27\n", Rv_hyp_scratch_pad_va);
!!# 
!!#   IJ_printf (th_all, "\tmov\t0, %%r28\n");
!!#   IJ_printf (th_all, "\tmov\t0, %%r29\n");
!!#   IJ_printf (th_all, "\tmov\t0, %%r30\n");
!!#   IJ_printf (th_all, "\tmov\t0, %%r31\n");
!!# 
!!#   IJ_printf (th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf (th_all, "\twr\t%%g0, 0x%rx, %%asi\n", Rv_asi_reg);
!!# /*
!!#   IJ_printf (th_all, "\tstxa\t%%g0, [%%g0] 0x42\n");
!!#   IJ_printf (th_all, "\tmov\t0x38, %%g1\n");
!!#   IJ_printf (th_all, "\tstxa\t%%g0, [%%g1] 0x58\n");
!!# */
!!# 
!!#   IJ_th_fork(0x2, 0x4, 0x8);
!!# 
!!#   return 0;
!!# 	
!!# %%section finish
!!# 
!!#   IJ_th_join(0xf);
!!#   IJ_th_start (Seq_Start, NULL, 1);
!!# 
!!#   if (idle_intr == 0) {
!!#     IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "\tnop\n", resume_cnt);
!!#     IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#     resume_cnt++;
!!#     idle_intr = 1;
!!#     //intr_tid = (intr_tid == 3) ? 0: intr_tid++;
!!#     if (intr_tid < 2) intr_tid++; else intr_tid = 0;
!!#   }
!!# 
!!#   IJ_printf (th_all, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
!!# 		IJ_printf  (th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#   }
!!# 
!!#   
!!# 
!!# %%section diag_ini
!!# 
!!# #define PCONTEXT	0x10
!!# #define SCONTEXT	0x10
!!# 
!!# #define MAIN_PAGE_NUCLEUS_ALSO
!!# #define MAIN_PAGE_HV_ALSO
!!# 
!!# #define ALL_MY_INTR_HANDLERS
!!# #include "my_intr_handlers.s"
!!# #include "my_trap_handlers.s"
!!# 
!!# #include "enable_traps.h"
!!# #include "boot.s"
!!# 
!!# .text
!!# .global main
!!# 
!!# main:
!!# 
!!# 	ta 	%icc, T_CHANGE_HPRIV
!!# 	mov	0x123, %g1
!!# 	wr	%g0, 0x20, %asi
!!# 	stxa	%g1, [0x00] %asi
!!# 	stxa	%g1, [0x08] %asi
!!# 	stxa	%g1, [0x10] %asi
!!# 	stxa	%g1, [0x18] %asi
!!# 	stxa	%g1, [0x20] %asi
!!# 	stxa	%g1, [0x28] %asi
!!# 	stxa	%g1, [0x30] %asi
!!# 	stxa	%g1, [0x38] %asi
!!# 	ta 	%icc, T_CHANGE_NONHPRIV
!!# 
!!# %%section diag_fini
!!# 
!!# .text
!!# 	ta	T_GOOD_TRAP
!!# 
!!# .data
!!# 	.xword 0x1234567887654321
!!# 
!!# %%section grammar
!!# 
!!# inst_block: inst_type
!!# 	    | inst_block inst_type
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# ;
!!# 
!!# 
!!# inst_type: load_imm_asi
!!# 	| load_reg_asi  %ropr Ro_reg_asi
!!# 	| store_imm_asi
!!# 	| store_reg_asi %ropr Ro_reg_asi
!!# 	| change_priv_tl %rvar low_wt
!!# 	| set_20_va     %rvar mid_wt
!!# 	| set_25_va	%rvar mid_wt
!!# 	| set_4f_va	%rvar mid_wt
!!# 	| wrasi		// rvar mid_wt
!!# 	| idle_resume
!!# ;
!!# 
!!# wrasi: tWRASI_I %ropr Ro_asi
!!# ;
!!# 
!!# change_priv_tl: tCHANGE_NONPRIV | tCHANGE_PRIV | tCHANGE_NONHPRIV 
!!# 	| tCHANGE_HPRIV // | tCHANGE_TO_TL0 | tCHANGE_TO_TL1
!!# ;
!!# 
!!# set_20_va: mSET_20_VA
!!# 	{
!!# 		IJ_printf (th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			Rv_scratch_pad_va,Rv_20);
!!#         }
!!# ;
!!# 
!!# set_25_va: mSET_25_VA
!!# 	{
!!# 		IJ_printf (th_all, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_q_va,Rv_25);
!!#         }
!!# ;
!!# 
!!# set_4f_va: mSET_4f_VA
!!# 	{
!!# 		IJ_printf (th_all, "\tmov\t0x%rx, %%r%rd\n",
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
!!# idle_resume: tNOP
!!# 	{
!!# 	  if (idle_intr) {
!!#             IJ_printf (th_M, "idle_%d:\n", idle_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.idle_%d), 16, 16)) -> intp(%d, 2, %d)\n", idle_cnt, intr_tid, Rv_intr_vect);
!!#             idle_cnt++;
!!# 	    idle_intr = 0;
!!#           } else {
!!#             IJ_printf (th_M, "resume_%d:\n", resume_cnt);
!!# 	    IJ_printf (th_M, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.resume_%d), 16, 16)) -> intp(%d, 3, %d)\n", resume_cnt, intr_tid, Rv_intr_vect);
!!#             resume_cnt++;
!!# 	    idle_intr = 1;
!!#             if (intr_tid < 2) intr_tid++; else intr_tid = 0;
!!#           }
!!# 	} ;
!!# 
!!# %%
!!# 
!!# %%section cbfunc
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data)
!!# {
!!#   int asi;
!!#   int r;
!!#   int *d = (int *) data;
!!# 
!!#   if (fld == Ft_Null)
!!#       asi = IJ_get_rvar_val32(rv_ro);
!!#   else
!!#     asi = IJ_get_ropr_fld_val (rv_ro, fld);
!!# 
!!#   switch (asi) {
!!#     case 0x20:
!!#       IJ_update_rvar (d[0]);
!!#       return (IJ_get_rvar_val32(d[0]));
!!#     case 0x25:
!!#       IJ_update_rvar (d[1]);
!!#       return (IJ_get_rvar_val32(d[1]));
!!#     case 0x4f:
!!#       IJ_update_rvar (d[2]);
!!#       return (IJ_get_rvar_val32(d[2]));
!!#     case 0x72:
!!#       IJ_update_rvar (d[3]);
!!#       return (IJ_get_rvar_val32(d[3]));
!!#     case 0x73:
!!#       IJ_update_rvar (d[4]);
!!#       return (IJ_get_rvar_val32(d[4]));
!!#     case 0x74:
!!#       IJ_update_rvar (d[5]);
!!#       return (IJ_get_rvar_val32(d[5]));
!!#   }
!!# }
!!# %%
!!# 
!!# endtemplate
#endif
