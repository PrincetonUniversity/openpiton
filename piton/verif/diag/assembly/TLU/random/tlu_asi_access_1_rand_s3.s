// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asi_access_1_rand_s3.s
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
   random seed:	216979980
   Jal tlu_asi_access_1.j:	
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

	setx 0x52fdebdaa5f970b4, %g1, %g0
	setx 0x2c6df375c2d56318, %g1, %g1
	setx 0x5c71e3c132763415, %g1, %g2
	setx 0xa14f43f6b0f195b5, %g1, %g3
	setx 0x22cf1288cf277ccf, %g1, %g4
	setx 0x8457881fe195181e, %g1, %g5
	setx 0xddfe68ac62dfa90f, %g1, %g6
	setx 0x15e90eba2bd88042, %g1, %g7
	setx 0x7512720e08436adc, %g1, %r16
	setx 0x3612cb1ed21615b6, %g1, %r17
	setx 0x9c5c89e5624dd6e0, %g1, %r18
	setx 0x437b0c9942051566, %g1, %r19
	setx 0xf0716a9695e15a93, %g1, %r20
	setx 0x0861f5cea09d805a, %g1, %r21
	setx 0x66620298ba8fe1c6, %g1, %r22
	setx 0x1fcda3a9342fea74, %g1, %r23
	setx 0x0d7e1b344feeeb74, %g1, %r24
	setx 0x0886d9475cd8c7cc, %g1, %r25
	setx 0x7825e24e8a1d54ab, %g1, %r26
	setx 0x85773eacc3c9790c, %g1, %r27
	setx 0x670a02a74829412c, %g1, %r28
	setx 0x6aec2bc194cc9671, %g1, %r29
	setx 0xdf6d0c10ced3dec6, %g1, %r30
	setx 0x9fbecb49b9b2c4e1, %g1, %r31
	save
	setx 0xd9045bb0a625b236, %g1, %r16
	setx 0x5fdc32a73361e869, %g1, %r17
	setx 0xc01eb81511de67db, %g1, %r18
	setx 0x308ded1fef41505d, %g1, %r19
	setx 0xedfda532e2f202d9, %g1, %r20
	setx 0x11256d8419b2edbf, %g1, %r21
	setx 0x5f41ea26c27e2f3d, %g1, %r22
	setx 0x323107d06bc672aa, %g1, %r23
	setx 0x4739c1dcd07f3725, %g1, %r24
	setx 0x3a75ae5e2b046ee2, %g1, %r25
	setx 0x5b29deae1bce61f0, %g1, %r26
	setx 0x8bfc3e68603f9440, %g1, %r27
	setx 0xe9c4ade07a7608c4, %g1, %r28
	setx 0xe69c581a24663999, %g1, %r29
	setx 0xc0cc99c6de1bb91a, %g1, %r30
	setx 0x6d71ed3949822d4a, %g1, %r31
	save
	setx 0x84cc9de7a4632809, %g1, %r16
	setx 0x22fb803fa69b0fcd, %g1, %r17
	setx 0x1e0146caefdbe955, %g1, %r18
	setx 0x58e435a3026cbaeb, %g1, %r19
	setx 0x79593de660ded21f, %g1, %r20
	setx 0xff6e3fe8edd619b5, %g1, %r21
	setx 0x73509bbd8383c030, %g1, %r22
	setx 0x33630fe5d965956b, %g1, %r23
	setx 0x448977c3e2828557, %g1, %r24
	setx 0xb564f555dc7d20c3, %g1, %r25
	setx 0x949d153a1c868fc4, %g1, %r26
	setx 0x3442232ab63405ba, %g1, %r27
	setx 0xb557d15a2a2cc50f, %g1, %r28
	setx 0x895ef6dcf59e35d8, %g1, %r29
	setx 0x08aa80639e3c1256, %g1, %r30
	setx 0xeef37ec7c82be605, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x38, %r16
	mov	0x40, %r17
	mov	0x38, %r18
	mov	0x68, %r19
	mov	0x3f0, %r20
	mov	0x3f8, %r21
	mov	0x3e0, %r22
	mov	0x7e0, %r23
	mov	0x0, %r24
	mov	0x50, %r25
	mov	0x38, %r26
	mov	0x50, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x20, %asi
	stxa	%g0, [%g0] 0x42
	mov	0x38, %g1
	stxa	%g0, [%g1] 0x58
	mov	0x20, %r17
	.word 0xe0ace000  ! 1: STBA_I	stba	%r16, [%r19 + 0x0000] %asi
	mov	0x0, %r19
	mov	0x20, %r24
	mov	0x20, %r25
	mov	0x70, %r26
	.word 0xe0cce000  ! 6: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r16
	.word 0xe8ce09e0  ! 7: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r20
	mov	0x30, %r24
	.word 0x87802020  ! 9: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a70e80  ! 10: STWA_R	stwa	%r19, [%r28 + %r0] 0x74
	.word 0xea8c4400  ! 11: LDUBA_R	lduba	[%r17, %r0] 0x20, %r21
	.word 0xe4a4c400  ! 12: STWA_R	stwa	%r18, [%r19 + %r0] 0x20
	.word 0xe48d04a0  ! 13: LDUBA_R	lduba	[%r20, %r0] 0x25, %r18
	.word 0x87802074  ! 14: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeef78e40  ! 15: STXA_R	stxa	%r23, [%r30 + %r0] 0x72
	mov	0x30, %r26
	.word 0xe6dfce60  ! 17: LDXA_R	ldxa	[%r31, %r0] 0x73, %r19
	.word 0xe6af2000  ! 18: STBA_I	stba	%r19, [%r28 + 0x0000] %asi
	.word 0xea9d84a0  ! 19: LDDA_R	ldda	[%r22, %r0] 0x25, %r21
	.word 0xeab7e000  ! 20: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xeadf6000  ! 21: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r21
	.word 0xea972000  ! 22: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0xe4cfce60  ! 23: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r18
	.word 0xe48f6000  ! 24: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0xe487a000  ! 25: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	.word 0xecdf8e60  ! 26: LDXA_R	ldxa	[%r30, %r0] 0x73, %r22
	.word 0xe4a4c400  ! 27: STWA_R	stwa	%r18, [%r19 + %r0] 0x20
	mov	0x38, %r19
	mov	0x70, %r19
	.word 0x87802025  ! 30: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4d5e000  ! 31: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r18
	.word 0xe485e000  ! 32: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r18
	mov	0x40, %r27
	.word 0xe4a52000  ! 34: STWA_I	stwa	%r18, [%r20 + 0x0000] %asi
	mov	0x7e8, %r23
	.word 0xe696c9e0  ! 36: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r19
	.word 0xe6a5e000  ! 37: STWA_I	stwa	%r19, [%r23 + 0x0000] %asi
	.word 0xe6ad6000  ! 38: STBA_I	stba	%r19, [%r21 + 0x0000] %asi
	.word 0xe8c4c400  ! 39: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r20
	.word 0x87802073  ! 40: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0b40400  ! 41: STHA_R	stha	%r16, [%r16 + %r0] 0x20
	.word 0xe2848400  ! 42: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r17
	.word 0xe89544a0  ! 43: LDUHA_R	lduha	[%r21, %r0] 0x25, %r20
	mov	0x7f0, %r21
	mov	0x7e0, %r23
	.word 0xe2cf4e40  ! 46: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r17
	.word 0xe2bfa000  ! 47: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	mov	0x70, %r24
	.word 0xe2f7ce80  ! 49: STXA_R	stxa	%r17, [%r31 + %r0] 0x74
	.word 0xe2d7a000  ! 50: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0x87802020  ! 51: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2a46000  ! 52: STWA_I	stwa	%r17, [%r17 + 0x0000] %asi
	.word 0xe8bc8400  ! 53: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	mov	0x8, %r18
	.word 0xeaf5c4a0  ! 55: STXA_R	stxa	%r21, [%r23 + %r0] 0x25
	.word 0xeac4e000  ! 56: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r21
	.word 0xeabf0e60  ! 57: STDA_R	stda	%r21, [%r28 + %r0] 0x73
	.word 0x87802025  ! 58: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x18, %r26
	.word 0xec8c8400  ! 60: LDUBA_R	lduba	[%r18, %r0] 0x20, %r22
	.word 0x87802073  ! 61: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe69f8e80  ! 62: LDDA_R	ldda	[%r30, %r0] 0x74, %r19
	.word 0xe8dc4400  ! 63: LDXA_R	ldxa	[%r17, %r0] 0x20, %r20
	.word 0x8780204f  ! 64: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3d8, %r23
	wr_tick_cmpr_0:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xe2, %g2
	or	%g4, 0xe2, %g4
	or	%g6, 0xbf, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe8bea000  ! 67: STDA_I	stda	%r20, [%r26 + 0x0000] %asi
	.word 0xe697ce60  ! 68: LDUHA_R	lduha	[%r31, %r0] 0x73, %r19
	.word 0xecbf4e60  ! 69: STDA_R	stda	%r22, [%r29 + %r0] 0x73
	mov	0x40, %r17
	mov	0x40, %r19
	.word 0xecce6000  ! 72: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r22
	.word 0xe4ac0400  ! 73: STBA_R	stba	%r18, [%r16 + %r0] 0x20
	.word 0xe4de6000  ! 74: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r18
	.word 0xe4de2000  ! 75: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r18
	mov	0x30, %r17
	.word 0xeccfce80  ! 77: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r22
	.word 0xecb6a000  ! 78: STHA_I	stha	%r22, [%r26 + 0x0000] %asi
	.word 0xe8c78e40  ! 79: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r20
	mov	0x3d0, %r21
	.word 0xe4d4c400  ! 81: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r18
	.word 0xe0840400  ! 82: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xe69fce40  ! 83: LDDA_R	ldda	[%r31, %r0] 0x72, %r19
	.word 0xe2bf0e80  ! 84: STDA_R	stda	%r17, [%r28 + %r0] 0x74
	.word 0xecf584a0  ! 85: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	.word 0xe6c5c4a0  ! 86: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r19
	.word 0xecadc4a0  ! 87: STBA_R	stba	%r22, [%r23 + %r0] 0x25
	.word 0x87802072  ! 88: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x8, %r25
	mov	0x10, %r26
	mov	0x8, %r25
	.word 0x87802025  ! 92: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3f0, %r21
	.word 0xe68c4400  ! 94: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0xe4b504a0  ! 95: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	.word 0x87802020  ! 96: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecbd04a0  ! 97: STDA_R	stda	%r22, [%r20 + %r0] 0x25
	.word 0xeabf8e80  ! 98: STDA_R	stda	%r21, [%r30 + %r0] 0x74
	.word 0xe0a5c4a0  ! 99: STWA_R	stwa	%r16, [%r23 + %r0] 0x25
	.word 0xe0a4a000  ! 100: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	.word 0xe0d504a0  ! 101: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r16
	.word 0xe0ac6000  ! 102: STBA_I	stba	%r16, [%r17 + 0x0000] %asi
	mov	0x70, %r16
	.word 0xe0c4a000  ! 104: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r16
	.word 0xe08c2000  ! 105: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r16
	mov	0x28, %r27
	.word 0xe084a000  ! 107: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	mov	0x40, %r26
	.word 0xe0dc2000  ! 109: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r16
	.word 0x87802074  ! 110: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee9f4e80  ! 111: LDDA_R	ldda	[%r29, %r0] 0x74, %r23
	.word 0xeed689e0  ! 112: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r23
	.word 0xeecf2000  ! 113: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0xe6bec9e0  ! 114: STDA_R	stda	%r19, [%r27 + %r0] 0x4f
	.word 0xe6bfa000  ! 115: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	mov	0x3f0, %r21
	mov	0x50, %r19
	.word 0xe8a74e80  ! 118: STWA_R	stwa	%r20, [%r29 + %r0] 0x74
	.word 0xe4af0e60  ! 119: STBA_R	stba	%r18, [%r28 + %r0] 0x73
	mov	0x58, %r18
	.word 0xe8b74e80  ! 121: STHA_R	stha	%r20, [%r29 + %r0] 0x74
	.word 0xe8876000  ! 122: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r20
	mov	0x7d0, %r21
	.word 0xe89cc400  ! 124: LDDA_R	ldda	[%r19, %r0] 0x20, %r20
	.word 0x87802020  ! 125: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3e0, %r21
	.word 0xe8f46000  ! 127: STXA_I	stxa	%r20, [%r17 + 0x0000] %asi
	.word 0xe8d46000  ! 128: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 129: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x38, %r27
	.word 0xe8f66000  ! 131: STXA_I	stxa	%r20, [%r25 + 0x0000] %asi
	.word 0xe2970e60  ! 132: LDUHA_R	lduha	[%r28, %r0] 0x73, %r17
	.word 0xeaa44400  ! 133: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xea9c4400  ! 134: LDDA_R	ldda	[%r17, %r0] 0x20, %r21
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeaf6e000  ! 136: STXA_I	stxa	%r21, [%r27 + 0x0000] %asi
	.word 0xea9e6000  ! 137: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r21
	.word 0xe09609e0  ! 138: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r16
	.word 0xe0de2000  ! 139: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r16
	.word 0xe0b6a000  ! 140: STHA_I	stha	%r16, [%r26 + 0x0000] %asi
	.word 0xe0a6a000  ! 141: STWA_I	stwa	%r16, [%r26 + 0x0000] %asi
	.word 0xe6a70e80  ! 142: STWA_R	stwa	%r19, [%r28 + %r0] 0x74
	.word 0xe6d48400  ! 143: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r19
	.word 0xe6962000  ! 144: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r19
	mov	0x20, %r17
	.word 0x87802025  ! 146: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4cc4400  ! 147: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r18
	.word 0x87802072  ! 148: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4b70e40  ! 149: STHA_R	stha	%r18, [%r28 + %r0] 0x72
	.word 0xe4b7a000  ! 150: STHA_I	stha	%r18, [%r30 + 0x0000] %asi
	.word 0xe4af2000  ! 151: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xecb7ce60  ! 152: STHA_R	stha	%r22, [%r31 + %r0] 0x73
	mov	0x30, %r19
	.word 0xecbfa000  ! 154: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xecd74e40  ! 155: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	.word 0xecb76000  ! 156: STHA_I	stha	%r22, [%r29 + 0x0000] %asi
	.word 0xecb72000  ! 157: STHA_I	stha	%r22, [%r28 + 0x0000] %asi
	.word 0xeca72000  ! 158: STWA_I	stwa	%r22, [%r28 + 0x0000] %asi
	.word 0xecbcc400  ! 159: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0xecdf6000  ! 160: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r22
	.word 0xe8af8e80  ! 161: STBA_R	stba	%r20, [%r30 + %r0] 0x74
	.word 0x87802072  ! 162: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8b7a000  ! 163: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	.word 0xeaf609e0  ! 164: STXA_R	stxa	%r21, [%r24 + %r0] 0x4f
	.word 0xead7a000  ! 165: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	.word 0x87802025  ! 166: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x50, %r16
	.word 0xeabd2000  ! 168: STDA_I	stda	%r21, [%r20 + 0x0000] %asi
	.word 0xeab52000  ! 169: STHA_I	stha	%r21, [%r20 + 0x0000] %asi
	.word 0x87802020  ! 170: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea8cc400  ! 171: LDUBA_R	lduba	[%r19, %r0] 0x20, %r21
	.word 0xeaa46000  ! 172: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	.word 0xeaa42000  ! 173: STWA_I	stwa	%r21, [%r16 + 0x0000] %asi
	.word 0xea8c2000  ! 174: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	.word 0xe2dfce40  ! 175: LDXA_R	ldxa	[%r31, %r0] 0x72, %r17
	.word 0xe2cc6000  ! 176: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r17
	.word 0x87802074  ! 177: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7d8, %r20
	.word 0xe2ce09e0  ! 179: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r17
	mov	0x40, %r27
	.word 0xe28f6000  ! 181: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r17
	mov	0x3f0, %r23
	mov	0x7f8, %r22
	.word 0x87802073  ! 184: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8b74e40  ! 185: STHA_R	stha	%r20, [%r29 + %r0] 0x72
	.word 0x87802073  ! 186: WRASI_I	wr	%r0, 0x0073, %asi
	wr_tick_cmpr_1:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xd3, %g2
	or	%g4, 0xe5, %g4
	or	%g6, 0xc2, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x7c0, %r21
	.word 0xe6970e40  ! 189: LDUHA_R	lduha	[%r28, %r0] 0x72, %r19
	.word 0xe28d04a0  ! 190: LDUBA_R	lduba	[%r20, %r0] 0x25, %r17
	.word 0xeabf4e80  ! 191: STDA_R	stda	%r21, [%r29 + %r0] 0x74
	mov	0x20, %r26
	.word 0xec9f8e60  ! 193: LDDA_R	ldda	[%r30, %r0] 0x73, %r22
	.word 0x8780204f  ! 194: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x0, %r24
	mov	0x38, %r25
	.word 0xe4afce60  ! 197: STBA_R	stba	%r18, [%r31 + %r0] 0x73
	.word 0xe4be2000  ! 198: STDA_I	stda	%r18, [%r24 + 0x0000] %asi
	.word 0xe4ae6000  ! 199: STBA_I	stba	%r18, [%r25 + 0x0000] %asi
	.word 0xecc544a0  ! 200: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r22
	.word 0xe2a7ce60  ! 201: STWA_R	stwa	%r17, [%r31 + %r0] 0x73
	.word 0xe2a62000  ! 202: STWA_I	stwa	%r17, [%r24 + 0x0000] %asi
	.word 0xe2a5c4a0  ! 203: STWA_R	stwa	%r17, [%r23 + %r0] 0x25
	.word 0xe2d6e000  ! 204: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	.word 0xea9c4400  ! 205: LDDA_R	ldda	[%r17, %r0] 0x20, %r21
	.word 0xeab62000  ! 206: STHA_I	stha	%r21, [%r24 + 0x0000] %asi
	mov	0x3c0, %r21
	mov	0x38, %r19
	.word 0xe28504a0  ! 209: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r17
	.word 0xe2f62000  ! 210: STXA_I	stxa	%r17, [%r24 + 0x0000] %asi
	mov	0x58, %r17
	.word 0xe6a70e60  ! 212: STWA_R	stwa	%r19, [%r28 + %r0] 0x73
	.word 0xe8b48400  ! 213: STHA_R	stha	%r20, [%r18 + %r0] 0x20
	.word 0xe0b649e0  ! 214: STHA_R	stha	%r16, [%r25 + %r0] 0x4f
	.word 0xe8c78e40  ! 215: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r20
	.word 0x8780204f  ! 216: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8bf4e40  ! 217: STDA_R	stda	%r20, [%r29 + %r0] 0x72
	.word 0xeacfce40  ! 218: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r21
	.word 0xea9e2000  ! 219: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r21
	.word 0xeaf48400  ! 220: STXA_R	stxa	%r21, [%r18 + %r0] 0x20
	.word 0x87802074  ! 221: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r18
	.word 0xeac7e000  ! 223: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	.word 0xeaafce40  ! 224: STBA_R	stba	%r21, [%r31 + %r0] 0x72
	.word 0xeadfe000  ! 225: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0xe8a44400  ! 226: STWA_R	stwa	%r20, [%r17 + %r0] 0x20
	.word 0x87802074  ! 227: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7d8, %r20
	.word 0xeec584a0  ! 229: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r23
	.word 0xee9fe000  ! 230: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	mov	0x10, %r26
	.word 0x87802072  ! 232: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeef7a000  ! 233: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xeeb72000  ! 234: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 235: WRASI_I	wr	%r0, 0x0072, %asi
	wr_tick_cmpr_2:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x94, %g2
	or	%g4, 0xd7, %g4
	or	%g6, 0xd7, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe6844400  ! 237: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	.word 0xe687e000  ! 238: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6ae49e0  ! 239: STBA_R	stba	%r19, [%r25 + %r0] 0x4f
	.word 0x87802020  ! 240: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec840400  ! 241: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r22
	.word 0xeed44400  ! 242: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r23
	.word 0xec8ec9e0  ! 243: LDUBA_R	lduba	[%r27, %r0] 0x4f, %r22
	.word 0xe08c0400  ! 244: LDUBA_R	lduba	[%r16, %r0] 0x20, %r16
	.word 0xeea44400  ! 245: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	mov	0x38, %r27
	.word 0xeedc2000  ! 247: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r23
	.word 0x87802072  ! 248: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeef76000  ! 249: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xe4b609e0  ! 250: STHA_R	stha	%r18, [%r24 + %r0] 0x4f
	.word 0x87802020  ! 251: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 252: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4af6000  ! 253: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0xe48f2000  ! 254: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 255: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 256: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4cde000  ! 257: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r18
	mov	0x20, %r26
	.word 0xe8b4c400  ! 259: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xecc7ce80  ! 260: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r22
	.word 0xecb5a000  ! 261: STHA_I	stha	%r22, [%r22 + 0x0000] %asi
	.word 0xecb48400  ! 262: STHA_R	stha	%r22, [%r18 + %r0] 0x20
	.word 0xec8689e0  ! 263: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r22
	.word 0xec85e000  ! 264: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r22
	.word 0xec956000  ! 265: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r22
	.word 0xe2a7ce40  ! 266: STWA_R	stwa	%r17, [%r31 + %r0] 0x72
	.word 0xe28c8400  ! 267: LDUBA_R	lduba	[%r18, %r0] 0x20, %r17
	.word 0xe0afce40  ! 268: STBA_R	stba	%r16, [%r31 + %r0] 0x72
	.word 0xe08de000  ! 269: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r16
	mov	0x58, %r26
	.word 0xee84c400  ! 271: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r23
	.word 0xecdc4400  ! 272: LDXA_R	ldxa	[%r17, %r0] 0x20, %r22
	.word 0xecade000  ! 273: STBA_I	stba	%r22, [%r23 + 0x0000] %asi
	mov	0x48, %r18
	.word 0xeab544a0  ! 275: STHA_R	stha	%r21, [%r21 + %r0] 0x25
	.word 0xe8a74e80  ! 276: STWA_R	stwa	%r20, [%r29 + %r0] 0x74
	.word 0x87802020  ! 277: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeccc0400  ! 278: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r22
	.word 0xeece09e0  ! 279: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r23
	.word 0xee8ce000  ! 280: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r23
	.word 0xee84a000  ! 281: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r23
	.word 0xecadc4a0  ! 282: STBA_R	stba	%r22, [%r23 + %r0] 0x25
	.word 0xecbce000  ! 283: STDA_I	stda	%r22, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 284: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 285: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecd5a000  ! 286: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r22
	.word 0xea9e09e0  ! 287: LDDA_R	ldda	[%r24, %r0] 0x4f, %r21
	mov	0x70, %r27
	.word 0xe0cf4e40  ! 289: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r16
	mov	0x8, %r17
	.word 0xe6844400  ! 291: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r19
	.word 0xe4cf0e60  ! 292: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r18
	.word 0xeaae49e0  ! 293: STBA_R	stba	%r21, [%r25 + %r0] 0x4f
	.word 0xee9649e0  ! 294: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r23
	.word 0xe08e49e0  ! 295: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r16
	.word 0x87802074  ! 296: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe08fa000  ! 297: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r16
	.word 0xe0bf2000  ! 298: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	.word 0xe08fe000  ! 299: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
	mov	0x7d8, %r21
	.word 0xe4b48400  ! 301: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0xee8649e0  ! 302: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r23
	.word 0xe0cf4e80  ! 303: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r16
	.word 0xe0d76000  ! 304: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r16
	.word 0xe2944400  ! 305: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	.word 0xe2b76000  ! 306: STHA_I	stha	%r17, [%r29 + 0x0000] %asi
	mov	0x50, %r24
	.word 0x87802073  ! 308: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2f72000  ! 309: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 310: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x40, %r24
	.word 0xe6a74e60  ! 312: STWA_R	stwa	%r19, [%r29 + %r0] 0x73
	mov	0x3f8, %r20
	.word 0x87802020  ! 314: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e8, %r20
	.word 0x8780204f  ! 316: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a6e000  ! 317: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0xe6bee000  ! 318: STDA_I	stda	%r19, [%r27 + 0x0000] %asi
	.word 0xe087ce40  ! 319: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r16
	.word 0x87802072  ! 320: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r24
	mov	0x3c0, %r23
	.word 0xe6a609e0  ! 323: STWA_R	stwa	%r19, [%r24 + %r0] 0x4f
	.word 0xe6df6000  ! 324: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6df2000  ! 325: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r19
	mov	0x0, %r16
	.word 0xe6b7e000  ! 327: STHA_I	stha	%r19, [%r31 + 0x0000] %asi
	.word 0xe6a4c400  ! 328: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0x87802020  ! 329: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6a46000  ! 330: STWA_I	stwa	%r19, [%r17 + 0x0000] %asi
	.word 0xeabd04a0  ! 331: STDA_R	stda	%r21, [%r20 + %r0] 0x25
	.word 0xe2bf8e60  ! 332: STDA_R	stda	%r17, [%r30 + %r0] 0x73
	.word 0xe4ce09e0  ! 333: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r18
	.word 0xe4a4a000  ! 334: STWA_I	stwa	%r18, [%r18 + 0x0000] %asi
	.word 0xe49ce000  ! 335: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r18
	.word 0xe494e000  ! 336: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r18
	.word 0x87802074  ! 337: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 338: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x40, %r24
	.word 0xec9d44a0  ! 340: LDDA_R	ldda	[%r21, %r0] 0x25, %r22
	.word 0xec9e2000  ! 341: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r22
	.word 0xeeddc4a0  ! 342: LDXA_R	ldxa	[%r23, %r0] 0x25, %r23
	.word 0xee9f8e60  ! 343: LDDA_R	ldda	[%r30, %r0] 0x73, %r23
	mov	0x70, %r24
	.word 0xeebe6000  ! 345: STDA_I	stda	%r23, [%r25 + 0x0000] %asi
	.word 0xee862000  ! 346: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r23
	.word 0xeec62000  ! 347: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r23
	mov	0x7c8, %r21
	.word 0xeea6e000  ! 349: STWA_I	stwa	%r23, [%r27 + 0x0000] %asi
	.word 0x87802025  ! 350: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 351: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdfce60  ! 352: LDXA_R	ldxa	[%r31, %r0] 0x73, %r22
	.word 0xe2f689e0  ! 353: STXA_R	stxa	%r17, [%r26 + %r0] 0x4f
	.word 0xe28ca000  ! 354: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r17
	.word 0xe88f0e40  ! 355: LDUBA_R	lduba	[%r28, %r0] 0x72, %r20
	.word 0xe8f46000  ! 356: STXA_I	stxa	%r20, [%r17 + 0x0000] %asi
	mov	0x8, %r19
	mov	0x70, %r26
	.word 0xe8bca000  ! 359: STDA_I	stda	%r20, [%r18 + 0x0000] %asi
	.word 0xe8aca000  ! 360: STBA_I	stba	%r20, [%r18 + 0x0000] %asi
	.word 0x87802072  ! 361: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r25
	mov	0x70, %r25
	.word 0xe69f8e40  ! 364: LDDA_R	ldda	[%r30, %r0] 0x72, %r19
	.word 0xe6d7e000  ! 365: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
	.word 0xe48c0400  ! 366: LDUBA_R	lduba	[%r16, %r0] 0x20, %r18
	.word 0xe49fe000  ! 367: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r18
	.word 0xe6ac4400  ! 368: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	.word 0xe2a5c4a0  ! 369: STWA_R	stwa	%r17, [%r23 + %r0] 0x25
	mov	0x10, %r17
	.word 0xe2af6000  ! 371: STBA_I	stba	%r17, [%r29 + 0x0000] %asi
	.word 0xe8944400  ! 372: LDUHA_R	lduha	[%r17, %r0] 0x20, %r20
	mov	0x18, %r26
	.word 0x8780204f  ! 374: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8aee000  ! 375: STBA_I	stba	%r20, [%r27 + 0x0000] %asi
	.word 0x87802025  ! 376: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x38, %r17
	.word 0x87802020  ! 378: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8be89e0  ! 379: STDA_R	stda	%r20, [%r26 + %r0] 0x4f
	mov	0x3f8, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe6870e40  ! 382: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r19
	.word 0xe0bd44a0  ! 383: STDA_R	stda	%r16, [%r21 + %r0] 0x25
	.word 0xeabc0400  ! 384: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xeabca000  ! 385: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0x87802072  ! 386: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeacfa000  ! 387: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r21
	mov	0x78, %r26
	.word 0x87802020  ! 389: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3c8, %r20
	.word 0x87802072  ! 391: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 392: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab46000  ! 393: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xeaa4a000  ! 394: STWA_I	stwa	%r21, [%r18 + 0x0000] %asi
	mov	0x7f0, %r23
	.word 0xea8ce000  ! 396: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r21
	.word 0xeaf4a000  ! 397: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0xeac7ce80  ! 398: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r21
	.word 0xe69cc400  ! 399: LDDA_R	ldda	[%r19, %r0] 0x20, %r19
	.word 0xe6d4e000  ! 400: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r19
	.word 0xe6b42000  ! 401: STHA_I	stha	%r19, [%r16 + 0x0000] %asi
	mov	0x18, %r26
	.word 0x87802074  ! 403: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x18, %r17
	.word 0x87802020  ! 405: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r16
	.word 0xe6f42000  ! 407: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 408: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 409: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x10, %r25
	mov	0x70, %r26
	.word 0xe69f8e60  ! 412: LDDA_R	ldda	[%r30, %r0] 0x73, %r19
	mov	0x0, %r18
	mov	0x7c0, %r22
	.word 0xead44400  ! 415: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r21
	mov	0x7d0, %r21
	mov	0x70, %r24
	.word 0xe0be09e0  ! 418: STDA_R	stda	%r16, [%r24 + %r0] 0x4f
	.word 0xe08fa000  ! 419: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r16
	.word 0xe0b76000  ! 420: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	mov	0x7e8, %r22
	mov	0x7e0, %r21
	.word 0xe0d72000  ! 423: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0xe0a7a000  ! 424: STWA_I	stwa	%r16, [%r30 + 0x0000] %asi
	mov	0x20, %r16
	.word 0xe0df2000  ! 426: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0xe4a544a0  ! 427: STWA_R	stwa	%r18, [%r21 + %r0] 0x25
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe4b40400  ! 429: STHA_R	stha	%r18, [%r16 + %r0] 0x20
	.word 0xeabf8e60  ! 430: STDA_R	stda	%r21, [%r30 + %r0] 0x73
	.word 0xe8844400  ! 431: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r20
	.word 0xe8f72000  ! 432: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	mov	0x7f8, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xee9e09e0  ! 435: LDDA_R	ldda	[%r24, %r0] 0x4f, %r23
	.word 0xee872000  ! 436: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r23
	mov	0x28, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802072  ! 439: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x0, %r17
	mov	0x50, %r26
	.word 0xeeb76000  ! 442: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xeed76000  ! 443: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xee8fce40  ! 444: LDUBA_R	lduba	[%r31, %r0] 0x72, %r23
	.word 0xeebfa000  ! 445: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	.word 0x87802074  ! 446: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee8fa000  ! 447: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r23
	.word 0xecd7ce60  ! 448: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r22
	.word 0xe284c400  ! 449: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r17
	.word 0xee870e80  ! 450: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r23
	mov	0x10, %r16
	.word 0xeeafe000  ! 452: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 453: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeece2000  ! 454: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r23
	.word 0xeaac8400  ! 455: STBA_R	stba	%r21, [%r18 + %r0] 0x20
	.word 0xeaf66000  ! 456: STXA_I	stxa	%r21, [%r25 + 0x0000] %asi
	.word 0xeaa66000  ! 457: STWA_I	stwa	%r21, [%r25 + 0x0000] %asi
	.word 0x8780204f  ! 458: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d8, %r22
	.word 0x87802020  ! 460: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaf4e000  ! 461: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	mov	0x68, %r17
	.word 0xeacce000  ! 463: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r21
	.word 0x87802025  ! 464: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r27
	.word 0x87802072  ! 466: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2bcc400  ! 467: STDA_R	stda	%r17, [%r19 + %r0] 0x20
	mov	0x3c0, %r23
	.word 0x87802073  ! 469: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2a72000  ! 470: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xeccec9e0  ! 471: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r22
	.word 0xecaf6000  ! 472: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0xee9f8e40  ! 473: LDDA_R	ldda	[%r30, %r0] 0x72, %r23
	mov	0x20, %r18
	mov	0x7c8, %r23
	.word 0xee9f6000  ! 476: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	mov	0x3e8, %r21
	.word 0x87802072  ! 478: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4ce49e0  ! 479: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r18
	mov	0x8, %r19
	.word 0xea8649e0  ! 481: LDUWA_R	lduwa	[%r25, %r0] 0x4f, %r21
	.word 0xea9f6000  ! 482: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r21
	.word 0xea87e000  ! 483: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r21
	.word 0xead7e000  ! 484: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	mov	0x50, %r27
	.word 0x87802074  ! 486: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x60, %r18
	.word 0xeab76000  ! 488: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	.word 0xea97e000  ! 489: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0x87802025  ! 490: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 491: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeebf4e40  ! 492: STDA_R	stda	%r23, [%r29 + %r0] 0x72
	mov	0x58, %r19
	.word 0xeea6a000  ! 494: STWA_I	stwa	%r23, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 495: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e8, %r22
	.word 0xe2cc4400  ! 497: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r17
	.word 0xe2a42000  ! 498: STWA_I	stwa	%r17, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 499: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0d78e40  ! 500: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r16
	.word 0xe097e000  ! 501: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	mov	0x3d0, %r22
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe6f70e40  ! 504: STXA_R	stxa	%r19, [%r28 + %r0] 0x72
	.word 0x87802074  ! 505: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x78, %r19
	.word 0xe0dfce80  ! 507: LDXA_R	ldxa	[%r31, %r0] 0x74, %r16
	.word 0x8780204f  ! 508: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3e0, %r21
	.word 0xe0bee000  ! 510: STDA_I	stda	%r16, [%r27 + 0x0000] %asi
	.word 0xe0f6e000  ! 511: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	.word 0xe0966000  ! 512: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r16
	mov	0x58, %r25
	.word 0xe0978e40  ! 514: LDUHA_R	lduha	[%r30, %r0] 0x72, %r16
	mov	0x60, %r27
	.word 0xe0f62000  ! 516: STXA_I	stxa	%r16, [%r24 + 0x0000] %asi
	.word 0xeef44400  ! 517: STXA_R	stxa	%r23, [%r17 + %r0] 0x20
	.word 0xeece6000  ! 518: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r23
	.word 0xee96e000  ! 519: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r23
	.word 0xeed66000  ! 520: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r23
	.word 0xeede2000  ! 521: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r23
	mov	0x48, %r25
	mov	0x58, %r18
	.word 0x87802074  ! 524: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r24
	mov	0x7f0, %r22
	.word 0xeedfe000  ! 527: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	.word 0xe095c4a0  ! 528: LDUHA_R	lduha	[%r23, %r0] 0x25, %r16
	mov	0x3f0, %r21
	.word 0xe0df2000  ! 530: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0xe0c76000  ! 531: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r16
	.word 0xee9cc400  ! 532: LDDA_R	ldda	[%r19, %r0] 0x20, %r23
	.word 0xe0bf8e40  ! 533: STDA_R	stda	%r16, [%r30 + %r0] 0x72
	.word 0xe0af2000  ! 534: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	.word 0xea8e49e0  ! 535: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r21
	.word 0xea9fa000  ! 536: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	mov	0x3e0, %r23
	wr_tick_cmpr_3:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xc2, %g2
	or	%g4, 0xe8, %g4
	or	%g6, 0xf0, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xeebc4400  ! 539: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	mov	0x60, %r26
	.word 0xeeaf6000  ! 541: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xe6a78e60  ! 542: STWA_R	stwa	%r19, [%r30 + %r0] 0x73
	mov	0x7d8, %r20
	.word 0xe6a72000  ! 544: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6bfa000  ! 545: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0x87802073  ! 546: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3e8, %r21
	.word 0xe6f78e80  ! 548: STXA_R	stxa	%r19, [%r30 + %r0] 0x74
	.word 0xeef584a0  ! 549: STXA_R	stxa	%r23, [%r22 + %r0] 0x25
	.word 0xee876000  ! 550: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	wr_tick_cmpr_4:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xc7, %g2
	or	%g4, 0xb7, %g4
	or	%g6, 0xc3, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xee972000  ! 552: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	.word 0xee97e000  ! 553: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r23
	.word 0xeef7a000  ! 554: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xeabe89e0  ! 555: STDA_R	stda	%r21, [%r26 + %r0] 0x4f
	.word 0xeaaf2000  ! 556: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	.word 0xea976000  ! 557: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xe8f609e0  ! 558: STXA_R	stxa	%r20, [%r24 + %r0] 0x4f
	.word 0x87802073  ! 559: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 560: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2f7ce40  ! 561: STXA_R	stxa	%r17, [%r31 + %r0] 0x72
	.word 0xe2dea000  ! 562: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r17
	.word 0x87802073  ! 563: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r25
	.word 0xe2a70e80  ! 565: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	.word 0xe2afe000  ! 566: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	mov	0x58, %r17
	.word 0xe2c78e80  ! 568: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r17
	.word 0xe2cf6000  ! 569: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r17
	.word 0xe2f7a000  ! 570: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 571: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r27
	.word 0xeacc4400  ! 573: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r21
	.word 0x8780204f  ! 574: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab70e60  ! 575: STHA_R	stha	%r21, [%r28 + %r0] 0x73
	.word 0xe4ae09e0  ! 576: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	.word 0xe496e000  ! 577: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r18
	.word 0xe6f44400  ! 578: STXA_R	stxa	%r19, [%r17 + %r0] 0x20
	.word 0xe6b66000  ! 579: STHA_I	stha	%r19, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 580: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 581: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f7a000  ! 582: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	mov	0x18, %r16
	mov	0x7e8, %r23
	.word 0x87802025  ! 585: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac48400  ! 586: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r21
	mov	0x28, %r19
	mov	0x3f0, %r22
	mov	0x3c0, %r22
	.word 0x87802072  ! 590: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeacc400  ! 591: STBA_R	stba	%r23, [%r19 + %r0] 0x20
	.word 0xe2cf4e80  ! 592: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r17
	.word 0xe287a000  ! 593: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r17
	.word 0xe2d70e40  ! 594: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r17
	.word 0x87802072  ! 595: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2af2000  ! 596: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 597: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cc0400  ! 598: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r19
	mov	0x60, %r18
	.word 0xeeaf0e80  ! 600: STBA_R	stba	%r23, [%r28 + %r0] 0x74
	.word 0xeebc6000  ! 601: STDA_I	stda	%r23, [%r17 + 0x0000] %asi
	.word 0xe2a544a0  ! 602: STWA_R	stwa	%r17, [%r21 + %r0] 0x25
	mov	0x3d8, %r23
	.word 0xe29f0e60  ! 604: LDDA_R	ldda	[%r28, %r0] 0x73, %r17
	.word 0xe0c7ce80  ! 605: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r16
	.word 0xe0ac2000  ! 606: STBA_I	stba	%r16, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 607: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 608: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0b7e000  ! 609: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xe0bf2000  ! 610: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	mov	0x3e8, %r22
	.word 0xe0a76000  ! 612: STWA_I	stwa	%r16, [%r29 + 0x0000] %asi
	.word 0xe0afe000  ! 613: STBA_I	stba	%r16, [%r31 + 0x0000] %asi
	.word 0xe087e000  ! 614: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xec9689e0  ! 616: LDUHA_R	lduha	[%r26, %r0] 0x4f, %r22
	mov	0x3e0, %r22
	.word 0xec8fa000  ! 618: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r22
	.word 0xec97a000  ! 619: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r22
	.word 0x87802074  ! 620: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeeae49e0  ! 621: STBA_R	stba	%r23, [%r25 + %r0] 0x4f
	.word 0x87802025  ! 622: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeebd2000  ! 623: STDA_I	stda	%r23, [%r20 + 0x0000] %asi
	.word 0xee95a000  ! 624: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r23
	.word 0x87802025  ! 625: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x28, %r19
	.word 0xeecda000  ! 627: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r23
	.word 0xeecda000  ! 628: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r23
	mov	0x30, %r18
	.word 0xeef5e000  ! 630: STXA_I	stxa	%r23, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 631: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeebf2000  ! 632: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	mov	0x3c0, %r22
	mov	0x3d0, %r21
	.word 0xe0840400  ! 635: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xe0bd04a0  ! 636: STDA_R	stda	%r16, [%r20 + %r0] 0x25
	.word 0x87802074  ! 637: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r25
	mov	0x78, %r16
	.word 0xe0bf2000  ! 640: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	mov	0x7e0, %r23
	.word 0xeadc8400  ! 642: LDXA_R	ldxa	[%r18, %r0] 0x20, %r21
	mov	0x70, %r24
	.word 0x87802020  ! 644: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x0, %r17
	mov	0x8, %r18
	.word 0xe4cc8400  ! 647: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	.word 0xe494e000  ! 648: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r18
	.word 0x87802073  ! 649: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r27
	wr_tick_cmpr_5:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xc5, %g2
	or	%g4, 0xa6, %g4
	or	%g6, 0xbc, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe4944400  ! 652: LDUHA_R	lduha	[%r17, %r0] 0x20, %r18
	mov	0x70, %r16
	.word 0xeec70e60  ! 654: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r23
	.word 0xeab689e0  ! 655: STHA_R	stha	%r21, [%r26 + %r0] 0x4f
	mov	0x8, %r24
	.word 0x87802020  ! 657: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b544a0  ! 658: STHA_R	stha	%r17, [%r21 + %r0] 0x25
	.word 0xecf70e40  ! 659: STXA_R	stxa	%r22, [%r28 + %r0] 0x72
	.word 0xecf46000  ! 660: STXA_I	stxa	%r22, [%r17 + 0x0000] %asi
	.word 0xe89fce40  ! 661: LDDA_R	ldda	[%r31, %r0] 0x72, %r20
	.word 0xe6cd44a0  ! 662: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r19
	.word 0xec974e80  ! 663: LDUHA_R	lduha	[%r29, %r0] 0x74, %r22
	wr_tick_cmpr_6:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0x99, %g2
	or	%g4, 0xc8, %g4
	or	%g6, 0xb4, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xeccca000  ! 665: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	.word 0xe28689e0  ! 666: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r17
	.word 0xe8cec9e0  ! 667: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r20
	.word 0x8780204f  ! 668: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x50, %r27
	.word 0xecdf4e80  ! 670: LDXA_R	ldxa	[%r29, %r0] 0x74, %r22
	mov	0x0, %r27
	mov	0x58, %r19
	.word 0xe6c7ce80  ! 673: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r19
	.word 0xe6ce2000  ! 674: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xecbf8e40  ! 675: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	mov	0x0, %r26
	.word 0xe2ad04a0  ! 677: STBA_R	stba	%r17, [%r20 + %r0] 0x25
	.word 0xe2c78e80  ! 678: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r17
	mov	0x7d0, %r21
	.word 0xe2ce6000  ! 680: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r17
	.word 0xe2b6e000  ! 681: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	mov	0x10, %r27
	mov	0x18, %r26
	.word 0xe2b6e000  ! 684: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	.word 0x87802072  ! 685: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2b7ce80  ! 686: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	.word 0xe2bfe000  ! 687: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	mov	0x7f8, %r23
	mov	0x7c8, %r22
	mov	0x50, %r16
	.word 0xe2cfa000  ! 691: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 692: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2bea000  ! 693: STDA_I	stda	%r17, [%r26 + 0x0000] %asi
	.word 0xe296e000  ! 694: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 695: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0cfce60  ! 696: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r16
	mov	0x60, %r16
	.word 0xecb5c4a0  ! 698: STHA_R	stha	%r22, [%r23 + %r0] 0x25
	mov	0x48, %r26
	.word 0xe2974e80  ! 700: LDUHA_R	lduha	[%r29, %r0] 0x74, %r17
	.word 0xe2a6a000  ! 701: STWA_I	stwa	%r17, [%r26 + 0x0000] %asi
	mov	0x10, %r17
	.word 0xe29ea000  ! 703: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 704: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2866000  ! 705: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r17
	mov	0x68, %r27
	.word 0x87802073  ! 707: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe49f8e60  ! 708: LDDA_R	ldda	[%r30, %r0] 0x73, %r18
	.word 0xe4af2000  ! 709: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 710: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4ce2000  ! 711: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r18
	.word 0xe4862000  ! 712: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r18
	.word 0xead7ce40  ! 713: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r21
	.word 0xe68e89e0  ! 714: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r19
	.word 0xe29c8400  ! 715: LDDA_R	ldda	[%r18, %r0] 0x20, %r17
	.word 0xe48f4e80  ! 716: LDUBA_R	lduba	[%r29, %r0] 0x74, %r18
	mov	0x18, %r26
	.word 0xe48ee000  ! 718: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r18
	.word 0xe09c8400  ! 719: LDDA_R	ldda	[%r18, %r0] 0x20, %r16
	mov	0x7f0, %r20
	.word 0xe6a649e0  ! 721: STWA_R	stwa	%r19, [%r25 + %r0] 0x4f
	mov	0x50, %r25
	.word 0xe6aee000  ! 723: STBA_I	stba	%r19, [%r27 + 0x0000] %asi
	.word 0xe2a649e0  ! 724: STWA_R	stwa	%r17, [%r25 + %r0] 0x4f
	.word 0xecc70e80  ! 725: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r22
	.word 0xecae6000  ! 726: STBA_I	stba	%r22, [%r25 + 0x0000] %asi
	.word 0xe2b48400  ! 727: STHA_R	stha	%r17, [%r18 + %r0] 0x20
	mov	0x40, %r24
	.word 0x87802074  ! 729: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7e0, %r21
	mov	0x40, %r19
	.word 0x8780204f  ! 732: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x20, %r27
	.word 0xe2d6e000  ! 734: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r17
	mov	0x18, %r19
	mov	0x7e0, %r21
	.word 0xe2a66000  ! 737: STWA_I	stwa	%r17, [%r25 + 0x0000] %asi
	mov	0x18, %r25
	.word 0xecf7ce60  ! 739: STXA_R	stxa	%r22, [%r31 + %r0] 0x73
	.word 0x87802025  ! 740: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x10, %r18
	.word 0xe4cc4400  ! 742: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r18
	.word 0xead74e40  ! 743: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r21
	.word 0xeeb7ce40  ! 744: STHA_R	stha	%r23, [%r31 + %r0] 0x72
	.word 0xeeb5a000  ! 745: STHA_I	stha	%r23, [%r22 + 0x0000] %asi
	.word 0xeedde000  ! 746: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r23
	.word 0xeead6000  ! 747: STBA_I	stba	%r23, [%r21 + 0x0000] %asi
	.word 0x8780204f  ! 748: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b4c400  ! 749: STHA_R	stha	%r17, [%r19 + %r0] 0x20
	mov	0x78, %r18
	mov	0x60, %r25
	.word 0xe2dee000  ! 752: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r17
	.word 0x87802025  ! 753: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe28e09e0  ! 754: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r17
	.word 0xe2dde000  ! 755: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r17
	.word 0xe2ade000  ! 756: STBA_I	stba	%r17, [%r23 + 0x0000] %asi
	.word 0xe2a5e000  ! 757: STWA_I	stwa	%r17, [%r23 + 0x0000] %asi
	.word 0xe2ad2000  ! 758: STBA_I	stba	%r17, [%r20 + 0x0000] %asi
	mov	0x28, %r27
	mov	0x48, %r16
	.word 0xe2a56000  ! 761: STWA_I	stwa	%r17, [%r21 + 0x0000] %asi
	.word 0xe2b5a000  ! 762: STHA_I	stha	%r17, [%r22 + 0x0000] %asi
	.word 0xe2bf8e80  ! 763: STDA_R	stda	%r17, [%r30 + %r0] 0x74
	.word 0xe2dd2000  ! 764: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r17
	.word 0xe686c9e0  ! 765: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r19
	.word 0xe6cda000  ! 766: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r19
	.word 0xe69de000  ! 767: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r19
	.word 0x87802073  ! 768: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe69f2000  ! 769: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r19
	.word 0xe4bc8400  ! 770: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xe09c0400  ! 771: LDDA_R	ldda	[%r16, %r0] 0x20, %r16
	.word 0xe0df2000  ! 772: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0x87802073  ! 773: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 774: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 775: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0840400  ! 776: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xe2bf8e80  ! 777: STDA_R	stda	%r17, [%r30 + %r0] 0x74
	.word 0x87802020  ! 778: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ac2000  ! 779: STBA_I	stba	%r17, [%r16 + 0x0000] %asi
	.word 0xe2bc2000  ! 780: STDA_I	stda	%r17, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 781: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6de09e0  ! 782: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r19
	.word 0xe694a000  ! 783: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r19
	.word 0xec8c4400  ! 784: LDUBA_R	lduba	[%r17, %r0] 0x20, %r22
	.word 0xecd4e000  ! 785: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r22
	.word 0xeab44400  ! 786: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	.word 0xe2b689e0  ! 787: STHA_R	stha	%r17, [%r26 + %r0] 0x4f
	mov	0x7f8, %r23
	.word 0xe2b4a000  ! 789: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0xecacc400  ! 790: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xecc4e000  ! 791: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r22
	.word 0xec9c2000  ! 792: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r22
	.word 0x87802025  ! 793: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x38, %r25
	.word 0xe2c78e40  ! 795: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r17
	mov	0x0, %r27
	.word 0xe2cda000  ! 797: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r17
	.word 0x87802020  ! 798: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6874e60  ! 799: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r19
	mov	0x38, %r16
	mov	0x3c0, %r23
	.word 0xe6cc2000  ! 802: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r19
	mov	0x7e0, %r20
	.word 0xeadc8400  ! 804: LDXA_R	ldxa	[%r18, %r0] 0x20, %r21
	mov	0x68, %r16
	.word 0xe8cf0e60  ! 806: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r20
	.word 0xe4c48400  ! 807: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r18
	mov	0x70, %r17
	mov	0x28, %r26
	.word 0xe4946000  ! 810: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r18
	.word 0xe4bca000  ! 811: STDA_I	stda	%r18, [%r18 + 0x0000] %asi
	.word 0xee8cc400  ! 812: LDUBA_R	lduba	[%r19, %r0] 0x20, %r23
	mov	0x3c8, %r22
	.word 0xe89cc400  ! 814: LDDA_R	ldda	[%r19, %r0] 0x20, %r20
	mov	0x3c8, %r20
	wr_tick_cmpr_7:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xe9, %g2
	or	%g4, 0xd6, %g4
	or	%g6, 0xfb, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe8dc2000  ! 817: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r20
	.word 0x87802074  ! 818: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8d76000  ! 819: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r20
	.word 0xe897e000  ! 820: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	mov	0x28, %r16
	mov	0x0, %r27
	.word 0x87802073  ! 823: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3d8, %r23
	.word 0xecf584a0  ! 825: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	mov	0x28, %r16
	mov	0x3c8, %r22
	.word 0xec872000  ! 828: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r22
	.word 0x87802072  ! 829: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeac4400  ! 830: STBA_R	stba	%r23, [%r17 + %r0] 0x20
	.word 0xee87a000  ! 831: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r23
	.word 0x87802020  ! 832: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r24
	.word 0xe2af4e60  ! 834: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xe2d4a000  ! 835: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r17
	mov	0x7c0, %r22
	mov	0x7f0, %r22
	mov	0x10, %r24
	.word 0xe4c5c4a0  ! 839: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r18
	.word 0xe4ac6000  ! 840: STBA_I	stba	%r18, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 841: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4b42000  ! 842: STHA_I	stha	%r18, [%r16 + 0x0000] %asi
	.word 0xe6af4e80  ! 843: STBA_R	stba	%r19, [%r29 + %r0] 0x74
	.word 0x87802073  ! 844: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3d8, %r21
	.word 0xe6972000  ! 846: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r19
	.word 0x87802020  ! 847: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bf8e60  ! 848: STDA_R	stda	%r20, [%r30 + %r0] 0x73
	.word 0x87802020  ! 849: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f4e000  ! 850: STXA_I	stxa	%r20, [%r19 + 0x0000] %asi
	mov	0x20, %r18
	.word 0xe09f4e80  ! 852: LDDA_R	ldda	[%r29, %r0] 0x74, %r16
	.word 0xe084a000  ! 853: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	mov	0x58, %r16
	mov	0x30, %r19
	.word 0xe0dce000  ! 856: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r16
	.word 0xe0a46000  ! 857: STWA_I	stwa	%r16, [%r17 + 0x0000] %asi
	mov	0x60, %r25
	.word 0x87802025  ! 859: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0b5e000  ! 860: STHA_I	stha	%r16, [%r23 + 0x0000] %asi
	mov	0x20, %r16
	mov	0x70, %r27
	.word 0x87802072  ! 863: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe286c9e0  ! 864: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r17
	.word 0xea978e80  ! 865: LDUHA_R	lduha	[%r30, %r0] 0x74, %r21
	.word 0xe4c78e40  ! 866: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r18
	.word 0x87802073  ! 867: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4a76000  ! 868: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	mov	0x7f0, %r22
	.word 0xe4a7e000  ! 870: STWA_I	stwa	%r18, [%r31 + 0x0000] %asi
	.word 0xea978e60  ! 871: LDUHA_R	lduha	[%r30, %r0] 0x73, %r21
	mov	0x28, %r25
	.word 0xe4bfce40  ! 873: STDA_R	stda	%r18, [%r31 + %r0] 0x72
	.word 0xe0f7ce80  ! 874: STXA_R	stxa	%r16, [%r31 + %r0] 0x74
	.word 0xe2a7ce60  ! 875: STWA_R	stwa	%r17, [%r31 + %r0] 0x73
	mov	0x3c8, %r23
	mov	0x3f0, %r21
	.word 0xe2b72000  ! 878: STHA_I	stha	%r17, [%r28 + 0x0000] %asi
	.word 0xe88c4400  ! 879: LDUBA_R	lduba	[%r17, %r0] 0x20, %r20
	mov	0x7e0, %r20
	.word 0xe8cf2000  ! 881: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 882: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8d62000  ! 883: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r20
	mov	0x3d0, %r22
	.word 0xe896a000  ! 885: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r20
	.word 0xe8f62000  ! 886: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	mov	0x7c0, %r22
	mov	0x3e8, %r23
	.word 0xe6870e80  ! 889: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r19
	.word 0x8780204f  ! 890: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6cea000  ! 891: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r19
	.word 0xe6f6e000  ! 892: STXA_I	stxa	%r19, [%r27 + 0x0000] %asi
	mov	0x48, %r17
	.word 0xee8c0400  ! 894: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0xee96e000  ! 895: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 896: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7c8, %r20
	.word 0xeeb66000  ! 898: STHA_I	stha	%r23, [%r25 + 0x0000] %asi
	mov	0x7f8, %r23
	.word 0xeea62000  ! 900: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	.word 0x8780204f  ! 901: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee962000  ! 902: LDUHA_I	lduha	[%r24, + 0x0000] %asi, %r23
	.word 0xeec6a000  ! 903: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r23
	.word 0xeece6000  ! 904: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r23
	.word 0x87802073  ! 905: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 906: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7d8, %r22
	.word 0xeea7a000  ! 908: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	.word 0xe8d4c400  ! 909: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r20
	.word 0x87802073  ! 910: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8972000  ! 911: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	.word 0xeaa40400  ! 912: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0xe2944400  ! 913: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2bf6000  ! 915: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 916: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3d0, %r23
	.word 0x87802020  ! 918: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 919: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ace000  ! 920: STBA_I	stba	%r17, [%r19 + 0x0000] %asi
	.word 0xe2cd44a0  ! 921: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r17
	mov	0x40, %r17
	.word 0xe2d4a000  ! 923: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r17
	.word 0xe2bca000  ! 924: STDA_I	stda	%r17, [%r18 + 0x0000] %asi
	.word 0xe2b40400  ! 925: STHA_R	stha	%r17, [%r16 + %r0] 0x20
	.word 0xe6f78e40  ! 926: STXA_R	stxa	%r19, [%r30 + %r0] 0x72
	.word 0xe6946000  ! 927: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r19
	.word 0xe0bdc4a0  ! 928: STDA_R	stda	%r16, [%r23 + %r0] 0x25
	.word 0xe0cc6000  ! 929: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r16
	.word 0xe88c4400  ! 930: LDUBA_R	lduba	[%r17, %r0] 0x20, %r20
	mov	0x28, %r26
	.word 0xe086c9e0  ! 932: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r16
	mov	0x0, %r17
	.word 0xe0c46000  ! 934: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r16
	mov	0x68, %r16
	.word 0xe0b46000  ! 936: STHA_I	stha	%r16, [%r17 + 0x0000] %asi
	ta	T_CHANGE_HPRIV	! macro
	mov	0x8, %r16
	.word 0xe8d70e60  ! 939: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r20
	.word 0xe8a46000  ! 940: STWA_I	stwa	%r20, [%r17 + 0x0000] %asi
	mov	0x8, %r16
	.word 0xe2f7ce40  ! 942: STXA_R	stxa	%r17, [%r31 + %r0] 0x72
	.word 0xeebfce80  ! 943: STDA_R	stda	%r23, [%r31 + %r0] 0x74
	.word 0xe2944400  ! 944: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	.word 0xe2b4e000  ! 945: STHA_I	stha	%r17, [%r19 + 0x0000] %asi
	.word 0xe2b42000  ! 946: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	.word 0xe2d46000  ! 947: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r17
	mov	0x48, %r25
	mov	0x7f0, %r22
	mov	0x60, %r18
	.word 0xe8f78e60  ! 951: STXA_R	stxa	%r20, [%r30 + %r0] 0x73
	.word 0xeaa544a0  ! 952: STWA_R	stwa	%r21, [%r21 + %r0] 0x25
	mov	0x70, %r25
	.word 0xea94a000  ! 954: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r21
	mov	0x3f8, %r20
	.word 0xecafce80  ! 956: STBA_R	stba	%r22, [%r31 + %r0] 0x74
	.word 0xec8ca000  ! 957: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r22
	.word 0x87802020  ! 958: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe294c400  ! 959: LDUHA_R	lduha	[%r19, %r0] 0x20, %r17
	.word 0xe2a4e000  ! 960: STWA_I	stwa	%r17, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 961: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2842000  ! 962: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r17
	.word 0xe2dca000  ! 963: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r17
	.word 0x87802073  ! 964: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x28, %r25
	.word 0x87802020  ! 966: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 967: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7c0, %r22
	.word 0xe2bee000  ! 969: STDA_I	stda	%r17, [%r27 + 0x0000] %asi
	.word 0xee848400  ! 970: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r23
	.word 0xeec62000  ! 971: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 972: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0970e80  ! 973: LDUHA_R	lduha	[%r28, %r0] 0x74, %r16
	.word 0xe0bea000  ! 974: STDA_I	stda	%r16, [%r26 + 0x0000] %asi
	mov	0x7e0, %r20
	.word 0x8780204f  ! 976: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe086a000  ! 977: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r16
	mov	0x20, %r26
	.word 0x87802020  ! 979: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 980: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7f0, %r23
	mov	0x3d0, %r20
	.word 0xe0f4e000  ! 983: STXA_I	stxa	%r16, [%r19 + 0x0000] %asi
	.word 0xe28f4e80  ! 984: LDUBA_R	lduba	[%r29, %r0] 0x74, %r17
	.word 0xe2bc2000  ! 985: STDA_I	stda	%r17, [%r16 + 0x0000] %asi
	.word 0xe2a46000  ! 986: STWA_I	stwa	%r17, [%r17 + 0x0000] %asi
	mov	0x78, %r25
	.word 0xe2bca000  ! 988: STDA_I	stda	%r17, [%r18 + 0x0000] %asi
	.word 0x8780204f  ! 989: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2dea000  ! 990: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r17
	wr_tick_cmpr_8:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x94, %g2
	or	%g4, 0xf8, %g4
	or	%g6, 0xbb, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x0, %r26
	mov	0x7f0, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xe6cf8e40  ! 995: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r19
	.word 0xe8b7ce60  ! 996: STHA_R	stha	%r20, [%r31 + %r0] 0x73
	.word 0xe4bf8e60  ! 997: STDA_R	stda	%r18, [%r30 + %r0] 0x73
	.word 0xeca70e60  ! 998: STWA_R	stwa	%r22, [%r28 + %r0] 0x73
	mov	0x7f0, %r20
	.data
data_start:

	.xword	0x4eab3a8e30d10e0b
	.xword	0xb92a2e001db9ded6
	.xword	0xe135273d4cb98288
	.xword	0x09d284fb2c81b568
	.xword	0x442cb53c5f854afb
	.xword	0x565ee47446dd5d60
	.xword	0xa2bbf63ef34c244b
	.xword	0xff11341e6f6c78e8
	.xword	0x2600c4f34a7c3852
	.xword	0x24a2c139782d209e
	.xword	0x2290684766d86dc2
	.xword	0x1a272904ac273286
	.xword	0x7e3e8b6103318cbf
	.xword	0x3ba75db2727cd3f5
	.xword	0x7acaf6f2a245f896
	.xword	0x02c8f44663b5a03a



.text
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
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# int label_cntr = 0;
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
!!#   IJ_bind_thread_group("diag.j", 18, th_M, 0x01);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 20,"{16}" );
!!#   IJ_set_rvar ("diag.j", 21, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 22, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 25, Rv_tick_intdis, "4'br000, 60'h000 0000 0000 0000");
!!#   IJ_set_rvar ("diag.j", 26, Rv_tick_count, "8'b1rrr rrrr");
!!#   IJ_set_rvar ("diag.j", 27, Rv_pstate_ie, "13'b0 0000 0000 00r0");
!!# 
!!#   IJ_set_rvar ("diag.j", 30, Rv_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 33, Rv_q_va, "13'b0 0r11 11rr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 36, Rv_hyp_scratch_pad_va, "13'b0 0000 0rrr r000");
!!# 
!!#   IJ_set_rvar ("diag.j", 38, Rv_asi, "{0x20, 0x25, 0x4f, 0x72, 0x73, 0x74}");
!!#   IJ_copy_rvar ("diag.j", 39, Rv_asi_reg, Rv_asi);
!!# 
!!#   IJ_set_rvar ("diag.j", 41, Rv_20, "5'b1 00rr");
!!#   IJ_set_rvar ("diag.j", 42, Rv_25, "5'b1 01rr");
!!#   IJ_set_rvar ("diag.j", 43, Rv_4f, "5'b1 10rr");
!!#   IJ_set_rvar ("diag.j", 44, Rv_72_73_74, "5'b1 11rr");
!!# 
!!#   IJ_assign_ropr_fld ("diag.j", 46, ijdefault, Ft_Imm_Asi, Rv_asi);
!!# 
!!#   IJ_set_rvar ("diag.j", 48, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Simm13, "13'b0 0000 0000 rr00");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_install_ropr_cb ("diag.j", 54,ijdefault, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_set_ropr_fld   ( "diag.j", 56, Ro_asi, Ft_Rs1, "{0}");
!!#   IJ_assign_ropr_fld ("diag.j", 57, Ro_asi, Ft_Simm13, Rv_asi_reg);
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 59, Ro_reg_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld    ("diag.j", 60, Ro_reg_asi, Ft_Simm13, "{0}");
!!#   IJ_install_ropr_cb ("diag.j", 61,Ro_reg_asi, Ft_Rs1, my_imm_asi_to_rvar, Rv_asi_reg, Ft_Null, (void *) asi_rvar_array);
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 63, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 64, th_M, "\tsetx\tdata_start, %%r1, %%r25\n");
!!# 
!!#   IJ_printf ("diag.j", 66, th_M, "\tmov\t0x%rx, %%r16\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 67, th_M, "\tmov\t0x%rx, %%r17\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 68, th_M, "\tmov\t0x%rx, %%r18\n", Rv_scratch_pad_va);
!!#   IJ_printf ("diag.j", 69, th_M, "\tmov\t0x%rx, %%r19\n", Rv_scratch_pad_va);
!!# 
!!#   IJ_printf ("diag.j", 71, th_M, "\tmov\t0x%rx, %%r20\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 72, th_M, "\tmov\t0x%rx, %%r21\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 73, th_M, "\tmov\t0x%rx, %%r22\n", Rv_q_va);
!!#   IJ_printf ("diag.j", 74, th_M, "\tmov\t0x%rx, %%r23\n", Rv_q_va);
!!# 
!!#   IJ_printf ("diag.j", 76, th_M, "\tmov\t0x%rx, %%r24\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 77, th_M, "\tmov\t0x%rx, %%r25\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 78, th_M, "\tmov\t0x%rx, %%r26\n", Rv_hyp_scratch_pad_va);
!!#   IJ_printf ("diag.j", 79, th_M, "\tmov\t0x%rx, %%r27\n", Rv_hyp_scratch_pad_va);
!!# 
!!#   IJ_printf ("diag.j", 81, th_M, "\tmov\t0, %%r28\n");
!!#   IJ_printf ("diag.j", 82, th_M, "\tmov\t0, %%r29\n");
!!#   IJ_printf ("diag.j", 83, th_M, "\tmov\t0, %%r30\n");
!!#   IJ_printf ("diag.j", 84, th_M, "\tmov\t0, %%r31\n");
!!# 
!!#   IJ_printf ("diag.j", 86, th_M, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 87, th_M, "\twr\t%%g0, 0x%rx, %%asi\n", Rv_asi_reg);
!!#   IJ_printf ("diag.j", 88, th_M, "\tstxa\t%%g0, [%%g0] 0x42\n");
!!#   IJ_printf ("diag.j", 89, th_M, "\tmov\t0x38, %%g1\n");
!!#   IJ_printf ("diag.j", 90, th_M, "\tstxa\t%%g0, [%%g1] 0x58\n");
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
!!#   int i, j;
!!# 
!!#   IJ_printf ("diag.j", 98, th_M, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
!!# 		IJ_printf  ("diag.j", 100, th_M,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 		IJ_generate ("diag.j", 149, th_M, $2);
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
!!# 	| wrasi		// %rvar Rv_mid_wt
!!# 	| wr_tick_cmpr	%rvar  Rv_low_wt
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
!!# 		IJ_printf ("diag.j", 175, th_M, "\tmov\t0x%rx, %%r%rd\n",
!!# 			Rv_scratch_pad_va,Rv_20);
!!#         }
!!# ;
!!# 
!!# set_25_va: mSET_25_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 182, th_M, "\tmov\t0x%rx, %%r%rd\n",
!!# 			 Rv_q_va,Rv_25);
!!#         }
!!# ;
!!# 
!!# set_4f_va: mSET_4f_VA
!!# 	{
!!# 		IJ_printf ("diag.j", 189, th_M, "\tmov\t0x%rx, %%r%rd\n",
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
!!# wr_tick_cmpr: mWRTICK
!!# 	{
!!# 	  IJ_printf ("diag.j", 210, th_M, "\twr_tick_cmpr_%d:\n", label_cntr);
!!# 	  IJ_printf ("diag.j", 211, th_M, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 212, th_M, "\tsetx\t0x%llrx, %%g1, %%g2\n", Rv_tick_intdis);
!!# 	  IJ_printf ("diag.j", 213, th_M, "\tsetx\t0x%llrx, %%g1, %%g4\n", Rv_tick_intdis);
!!# 	  IJ_printf ("diag.j", 214, th_M, "\tsetx\t0x%llrx, %%g1, %%g6\n", Rv_tick_intdis);
!!# 	  IJ_printf ("diag.j", 215, th_M, "\tor\t%%g2, 0x%rx, %%g2\n", Rv_tick_count);
!!# 	  IJ_printf ("diag.j", 216, th_M, "\tor\t%%g4, 0x%rx, %%g4\n", Rv_tick_count);
!!# 	  IJ_printf ("diag.j", 217, th_M, "\tor\t%%g6, 0x%rx, %%g6\n", Rv_tick_count);
!!# 	  IJ_printf ("diag.j", 218, th_M, "\twrpr\t%%g0, 0, %%tick\n");
!!# 	  IJ_printf ("diag.j", 219, th_M, "\twr\t%%g2, 0, %%tick_cmpr\n");
!!# 	  IJ_printf ("diag.j", 220, th_M, "\twr\t%%g4, 0, %%sys_tick_cmpr\n");
!!# 	  IJ_printf ("diag.j", 221, th_M, "\twrhpr\t%%g6, 0, %%hsys_tick_cmpr\n");
!!# 	  IJ_printf ("diag.j", 222, th_M, "\trdpr\t%%pstate, %%g1\n");
!!# 	  IJ_printf ("diag.j", 223, th_M, "\twrpr\t%%g1, %rd, %%pstate\n", Rv_pstate_ie);
!!# 	  IJ_printf ("diag.j", 224, th_M, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           label_cntr++;
!!# 	}
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
!!#       asi = IJ_get_rvar_val32("diag.j", 238, rv_ro);
!!#   else
!!#     asi = IJ_get_ropr_fld_val ("diag.j", 240, rv_ro, fld);
!!# 
!!#   switch (asi) {
!!#     case 0x20:
!!#       IJ_update_rvar ("diag.j", 244, d[0]);
!!#       return (IJ_get_rvar_val32("diag.j", 245, d[0]));
!!#     case 0x25:
!!#       IJ_update_rvar ("diag.j", 247, d[1]);
!!#       return (IJ_get_rvar_val32("diag.j", 248, d[1]));
!!#     case 0x4f:
!!#       IJ_update_rvar ("diag.j", 250, d[2]);
!!#       return (IJ_get_rvar_val32("diag.j", 251, d[2]));
!!#     case 0x72:
!!#       IJ_update_rvar ("diag.j", 253, d[3]);
!!#       return (IJ_get_rvar_val32("diag.j", 254, d[3]));
!!#     case 0x73:
!!#       IJ_update_rvar ("diag.j", 256, d[4]);
!!#       return (IJ_get_rvar_val32("diag.j", 257, d[4]));
!!#     case 0x74:
!!#       IJ_update_rvar ("diag.j", 259, d[5]);
!!#       return (IJ_get_rvar_val32("diag.j", 260, d[5]));
!!#   }
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
