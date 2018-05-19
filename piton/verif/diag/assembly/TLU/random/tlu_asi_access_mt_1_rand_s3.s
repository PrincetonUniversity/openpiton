// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asi_access_mt_1_rand_s3.s
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
   random seed:	967285156
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

	setx 0xbdbcef4ee5242749, %g1, %g0
	setx 0x55de8445aa1ea89c, %g1, %g1
	setx 0xbecfbeaf3c4bd005, %g1, %g2
	setx 0x10f37b8a03391905, %g1, %g3
	setx 0x396ac0d9b15f7704, %g1, %g4
	setx 0xa0850d147718eaf1, %g1, %g5
	setx 0x547d8a855e9bc575, %g1, %g6
	setx 0xc5b47c0e915147fd, %g1, %g7
	setx 0x3d667b10458572cb, %g1, %r16
	setx 0xfb4fba4b126bcbca, %g1, %r17
	setx 0xdb6c64e4dacb21bf, %g1, %r18
	setx 0xfaf2cbceb0c2ac72, %g1, %r19
	setx 0x6cf64bc252bb52c0, %g1, %r20
	setx 0x405160f6a57ca5fe, %g1, %r21
	setx 0xd501b8899128efd0, %g1, %r22
	setx 0x7f0c15c9f439108a, %g1, %r23
	setx 0x05b11efe93f4e833, %g1, %r24
	setx 0x46900b224a515d3a, %g1, %r25
	setx 0x2538e04cabe553c6, %g1, %r26
	setx 0xcf0beedd4eca3318, %g1, %r27
	setx 0x7851482003da5b58, %g1, %r28
	setx 0x2bf63897497a5854, %g1, %r29
	setx 0x1bbe541294bcf587, %g1, %r30
	setx 0xf94b456cafdd9a80, %g1, %r31
	save
	setx 0x54be0b73b2be139c, %g1, %r16
	setx 0xa4301e19aa6eaff1, %g1, %r17
	setx 0xd7111078cbb9040e, %g1, %r18
	setx 0x963a24b12b2984fd, %g1, %r19
	setx 0x4bda60b01bc36e1e, %g1, %r20
	setx 0x12f6159bf53e12fd, %g1, %r21
	setx 0x5a4a6dc92312cb03, %g1, %r22
	setx 0xb575e2e33d3fb515, %g1, %r23
	setx 0x95fd79f6c88f6295, %g1, %r24
	setx 0x8711db1c4d523eab, %g1, %r25
	setx 0xd4b3205a89c439c5, %g1, %r26
	setx 0x61fbcc50121469f2, %g1, %r27
	setx 0xa4176daca260e745, %g1, %r28
	setx 0x551e2e1e5c036dea, %g1, %r29
	setx 0x719863aec1d3a430, %g1, %r30
	setx 0x111a2548d1f59674, %g1, %r31
	save
	setx 0x814fe77464d838fc, %g1, %r16
	setx 0xb36cb87685e7c395, %g1, %r17
	setx 0x18223d92bad72c9a, %g1, %r18
	setx 0xf7e6f0713bfcb1aa, %g1, %r19
	setx 0xb33ec6ef87e42135, %g1, %r20
	setx 0xabc09a9787274c89, %g1, %r21
	setx 0x8ce23fa2c26fec61, %g1, %r22
	setx 0xe11d5d73de72e847, %g1, %r23
	setx 0x6cb2693a21c55b83, %g1, %r24
	setx 0x4dfa22b8b9d63c59, %g1, %r25
	setx 0x9d47ec1d3dba1118, %g1, %r26
	setx 0x5181367d871ad33f, %g1, %r27
	setx 0xfed7cbcb852907b7, %g1, %r28
	setx 0x45fc81e9f2be203b, %g1, %r29
	setx 0x5947f13678cb67c4, %g1, %r30
	setx 0x95e52076fabe35da, %g1, %r31
	restore
	mov	0x20, %r16
	mov	0x78, %r17
	mov	0x50, %r18
	mov	0x60, %r19
	mov	0x7c0, %r20
	mov	0x7c8, %r21
	mov	0x3c0, %r22
	mov	0x7d0, %r23
	mov	0x50, %r24
	mov	0x60, %r25
	mov	0x58, %r26
	mov	0x48, %r27
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
	mov	0x3f0, %r20
	.word 0xeca4c400  ! 2: STWA_R	stwa	%r22, [%r19 + %r0] 0x20
	.word 0xecf42000  ! 3: STXA_I	stxa	%r22, [%r16 + 0x0000] %asi
	.word 0xeca42000  ! 4: STWA_I	stwa	%r22, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 5: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeec78e80  ! 6: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r23
	.word 0xee8ea000  ! 7: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r23
	mov	0x7e0, %r23
	.word 0x87802073  ! 9: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x40, %r19
	.word 0xe8a7ce60  ! 11: STWA_R	stwa	%r20, [%r31 + %r0] 0x73
	mov	0x30, %r18
	.word 0xe8b72000  ! 13: STHA_I	stha	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f76000  ! 14: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0xeea78e60  ! 15: STWA_R	stwa	%r23, [%r30 + %r0] 0x73
	.word 0xe0978e40  ! 16: LDUHA_R	lduha	[%r30, %r0] 0x72, %r16
	.word 0xe4df0e80  ! 17: LDXA_R	ldxa	[%r28, %r0] 0x74, %r18
	.word 0xe8b689e0  ! 18: STHA_R	stha	%r20, [%r26 + %r0] 0x4f
	.word 0xe2adc4a0  ! 19: STBA_R	stba	%r17, [%r23 + %r0] 0x25
	.word 0xe2afa000  ! 20: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe2a76000  ! 21: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xeaf6c9e0  ! 22: STXA_R	stxa	%r21, [%r27 + %r0] 0x4f
	.word 0xe6bc4400  ! 23: STDA_R	stda	%r19, [%r17 + %r0] 0x20
	.word 0xea97ce60  ! 24: LDUHA_R	lduha	[%r31, %r0] 0x73, %r21
	.word 0x87802020  ! 25: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 26: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x48, %r27
	.word 0xe8b689e0  ! 28: STHA_R	stha	%r20, [%r26 + %r0] 0x4f
	.word 0xe8b5e000  ! 29: STHA_I	stha	%r20, [%r23 + 0x0000] %asi
	mov	0x7d0, %r21
	.word 0xe8956000  ! 31: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r20
	.word 0xe8bd2000  ! 32: STDA_I	stda	%r20, [%r20 + 0x0000] %asi
	.word 0xe8c52000  ! 33: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r20
	.word 0x87802020  ! 34: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 35: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xee8584a0  ! 36: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r23
	.word 0xee97a000  ! 37: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r23
	mov	0x18, %r24
	.word 0xeed72000  ! 39: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xe0a70e60  ! 40: STWA_R	stwa	%r16, [%r28 + %r0] 0x73
	mov	0x68, %r19
	mov	0x40, %r16
	.word 0xe0976000  ! 43: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r16
	mov	0x48, %r27
	mov	0x48, %r19
	.word 0xe0f7e000  ! 46: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0876000  ! 47: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r16
	.word 0xe09f6000  ! 48: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r16
	.word 0xe0af2000  ! 49: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	mov	0x28, %r25
	mov	0x28, %r27
	.word 0xeaaf4e40  ! 52: STBA_R	stba	%r21, [%r29 + %r0] 0x72
	.word 0xead7a000  ! 53: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	.word 0xea97a000  ! 54: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0xeabfe000  ! 55: STDA_I	stda	%r21, [%r31 + 0x0000] %asi
	.word 0xe8970e60  ! 56: LDUHA_R	lduha	[%r28, %r0] 0x73, %r20
	.word 0xe8a7a000  ! 57: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe8f72000  ! 58: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f76000  ! 59: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8cfe000  ! 60: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	mov	0x0, %r16
	.word 0xe2afce40  ! 62: STBA_R	stba	%r17, [%r31 + %r0] 0x72
	.word 0xeeaf0e80  ! 63: STBA_R	stba	%r23, [%r28 + %r0] 0x74
	.word 0xee8f2000  ! 64: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r23
	.word 0xee96c9e0  ! 65: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r23
	mov	0x3e8, %r20
	.word 0xeedfe000  ! 67: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x78, %r17
	.word 0xeef76000  ! 69: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	mov	0x10, %r27
	.word 0xeef72000  ! 71: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x7e0, %r22
	.word 0xeeaf6000  ! 73: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeef7e000  ! 74: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xeed7a000  ! 75: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802025  ! 76: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 77: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea4a000  ! 78: STWA_I	stwa	%r23, [%r18 + 0x0000] %asi
	mov	0x50, %r25
	.word 0xe4af4e80  ! 80: STBA_R	stba	%r18, [%r29 + %r0] 0x74
	.word 0x87802025  ! 81: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4f5e000  ! 82: STXA_I	stxa	%r18, [%r23 + 0x0000] %asi
	.word 0xeabfce80  ! 83: STDA_R	stda	%r21, [%r31 + %r0] 0x74
	.word 0xeaada000  ! 84: STBA_I	stba	%r21, [%r22 + 0x0000] %asi
	.word 0xeaa56000  ! 85: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0xe4b70e80  ! 86: STHA_R	stha	%r18, [%r28 + %r0] 0x74
	mov	0x7c8, %r20
	.word 0xe4c78e80  ! 88: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r18
	.word 0x8780204f  ! 89: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4be2000  ! 90: STDA_I	stda	%r18, [%r24 + 0x0000] %asi
	.word 0x87802074  ! 91: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 92: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x38, %r18
	.word 0xeca78e80  ! 94: STWA_R	stwa	%r22, [%r30 + %r0] 0x74
	mov	0x3e8, %r20
	.word 0x87802074  ! 96: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecbf6000  ! 97: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	mov	0x58, %r18
	.word 0x87802025  ! 99: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecdd6000  ! 100: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r22
	.word 0xeccd2000  ! 101: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r22
	.word 0xeef78e40  ! 102: STXA_R	stxa	%r23, [%r30 + %r0] 0x72
	.word 0x87802073  ! 103: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeafa000  ! 104: STBA_I	stba	%r23, [%r30 + 0x0000] %asi
	.word 0xeab74e60  ! 105: STHA_R	stha	%r21, [%r29 + %r0] 0x73
	.word 0xe4f44400  ! 106: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xe4c76000  ! 107: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4b7e000  ! 108: STHA_I	stha	%r18, [%r31 + 0x0000] %asi
	.word 0xe4c7e000  ! 109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	mov	0x18, %r16
	.word 0xe4872000  ! 111: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0x87802025  ! 112: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4dde000  ! 113: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r18
	mov	0x7f0, %r21
	mov	0x40, %r17
	.word 0xe4d56000  ! 116: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r18
	mov	0x50, %r25
	.word 0x87802072  ! 118: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeaa48400  ! 119: STWA_R	stwa	%r21, [%r18 + %r0] 0x20
	.word 0xe4c5c4a0  ! 120: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r18
	.word 0xeaaf0e80  ! 121: STBA_R	stba	%r21, [%r28 + %r0] 0x74
	.word 0xeaa7e000  ! 122: STWA_I	stwa	%r21, [%r31 + 0x0000] %asi
	.word 0xeaa72000  ! 123: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	mov	0x0, %r18
	.word 0xeef544a0  ! 125: STXA_R	stxa	%r23, [%r21 + %r0] 0x25
	mov	0x18, %r27
	.word 0xe2a78e60  ! 127: STWA_R	stwa	%r17, [%r30 + %r0] 0x73
	.word 0xe297e000  ! 128: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0xe2f7e000  ! 129: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2a76000  ! 131: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe2d76000  ! 132: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2bf6000  ! 133: STDA_I	stda	%r17, [%r29 + 0x0000] %asi
	.word 0xe0d6c9e0  ! 134: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r16
	mov	0x68, %r16
	.word 0xe4870e40  ! 136: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r18
	mov	0x48, %r26
	.word 0xe48fe000  ! 138: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0x8780204f  ! 139: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2b584a0  ! 140: STHA_R	stha	%r17, [%r22 + %r0] 0x25
	.word 0xe6dcc400  ! 141: LDXA_R	ldxa	[%r19, %r0] 0x20, %r19
	.word 0xe68e6000  ! 142: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 143: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r24
	.word 0xe6ce2000  ! 145: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe6d62000  ! 146: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	.word 0xe6d48400  ! 147: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r19
	.word 0xe6ce2000  ! 148: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe6d62000  ! 149: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a6a000  ! 150: STWA_I	stwa	%r19, [%r26 + 0x0000] %asi
	.word 0xe6ce6000  ! 151: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r19
	.word 0xe6a6e000  ! 152: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0x8780204f  ! 153: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b66000  ! 154: STHA_I	stha	%r19, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 155: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cc6000  ! 156: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r19
	.word 0x87802072  ! 157: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab5c4a0  ! 158: STHA_R	stha	%r21, [%r23 + %r0] 0x25
	.word 0xeac5c4a0  ! 159: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r21
	.word 0x87802072  ! 160: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x18, %r17
	mov	0x30, %r16
	.word 0xe68f8e40  ! 163: LDUBA_R	lduba	[%r30, %r0] 0x72, %r19
	.word 0xe8d70e60  ! 164: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r20
	.word 0xe8bf6000  ! 165: STDA_I	stda	%r20, [%r29 + 0x0000] %asi
	mov	0x38, %r17
	.word 0xe8c72000  ! 167: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0x87802025  ! 168: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2940400  ! 169: LDUHA_R	lduha	[%r16, %r0] 0x20, %r17
	mov	0x0, %r16
	.word 0xec97ce40  ! 171: LDUHA_R	lduha	[%r31, %r0] 0x72, %r22
	mov	0x8, %r16
	mov	0x20, %r26
	.word 0xecce49e0  ! 174: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r22
	.word 0xe0970e60  ! 175: LDUHA_R	lduha	[%r28, %r0] 0x73, %r16
	.word 0xe0b56000  ! 176: STHA_I	stha	%r16, [%r21 + 0x0000] %asi
	.word 0xe8b4c400  ! 177: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe8a56000  ! 178: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0xe6bdc4a0  ! 179: STDA_R	stda	%r19, [%r23 + %r0] 0x25
	mov	0x10, %r18
	mov	0x58, %r18
	mov	0x38, %r19
	.word 0xe8d48400  ! 183: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r20
	.word 0xe6974e40  ! 184: LDUHA_R	lduha	[%r29, %r0] 0x72, %r19
	.word 0xe2d78e60  ! 185: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r17
	.word 0xe28de000  ! 186: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r17
	.word 0xe2bde000  ! 187: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 188: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 189: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe28ea000  ! 190: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r17
	mov	0x3e8, %r23
	.word 0x87802020  ! 192: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc78e80  ! 193: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r22
	.word 0xecdc2000  ! 194: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r22
	.word 0x87802072  ! 195: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecc7a000  ! 196: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe8ac8400  ! 197: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	mov	0x18, %r16
	.word 0xe2acc400  ! 199: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0xe8f7ce80  ! 200: STXA_R	stxa	%r20, [%r31 + %r0] 0x74
	.word 0xe4c40400  ! 201: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r18
	.word 0x87802073  ! 202: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 203: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4ad84a0  ! 204: STBA_R	stba	%r18, [%r22 + %r0] 0x25
	mov	0x38, %r24
	mov	0x48, %r25
	mov	0x78, %r27
	.word 0xe4c76000  ! 208: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	mov	0x50, %r25
	mov	0x58, %r26
	.word 0x87802025  ! 211: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0a649e0  ! 212: STWA_R	stwa	%r16, [%r25 + %r0] 0x4f
	.word 0x87802025  ! 213: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe095e000  ! 214: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r16
	.word 0xe0ada000  ! 215: STBA_I	stba	%r16, [%r22 + 0x0000] %asi
	.word 0x87802025  ! 216: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 217: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0dc2000  ! 218: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r16
	.word 0xe2b70e40  ! 219: STHA_R	stha	%r17, [%r28 + %r0] 0x72
	.word 0xea848400  ! 220: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r21
	.word 0xe2c5c4a0  ! 221: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r17
	.word 0xeea4c400  ! 222: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	.word 0xecb74e60  ! 223: STHA_R	stha	%r22, [%r29 + %r0] 0x73
	.word 0xeef70e40  ! 224: STXA_R	stxa	%r23, [%r28 + %r0] 0x72
	mov	0x40, %r25
	.word 0xee86c9e0  ! 226: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r23
	.word 0xeed4a000  ! 227: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r23
	.word 0xe8840400  ! 228: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeccfce80  ! 230: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r22
	.word 0xe4b4c400  ! 231: STHA_R	stha	%r18, [%r19 + %r0] 0x20
	.word 0xe0a6c9e0  ! 232: STWA_R	stwa	%r16, [%r27 + %r0] 0x4f
	.word 0xe6a78e40  ! 233: STWA_R	stwa	%r19, [%r30 + %r0] 0x72
	mov	0x8, %r26
	.word 0xe2f74e80  ! 235: STXA_R	stxa	%r17, [%r29 + %r0] 0x74
	.word 0xe29c6000  ! 236: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r17
	mov	0x58, %r26
	.word 0x87802020  ! 238: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2946000  ! 239: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r17
	.word 0xeaaf0e80  ! 240: STBA_R	stba	%r21, [%r28 + %r0] 0x74
	.word 0xeabc6000  ! 241: STDA_I	stda	%r21, [%r17 + 0x0000] %asi
	.word 0xeadc6000  ! 242: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r21
	mov	0x3f0, %r23
	mov	0x0, %r25
	.word 0xeaf4e000  ! 245: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	mov	0x7e0, %r20
	.word 0xea846000  ! 247: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r21
	.word 0xeab4e000  ! 248: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xeadca000  ! 249: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r21
	.word 0xe4ac4400  ! 250: STBA_R	stba	%r18, [%r17 + %r0] 0x20
	.word 0x87802020  ! 251: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4f4e000  ! 252: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	.word 0xe4c4e000  ! 253: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r18
	.word 0xee9c4400  ! 254: LDDA_R	ldda	[%r17, %r0] 0x20, %r23
	.word 0xe4bcc400  ! 255: STDA_R	stda	%r18, [%r19 + %r0] 0x20
	.word 0xe494a000  ! 256: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r18
	.word 0xe6d78e40  ! 257: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r19
	.word 0x8780204f  ! 258: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6d6a000  ! 259: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	.word 0xe6d6a000  ! 260: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	mov	0x3d0, %r21
	mov	0x8, %r24
	.word 0xee9fce80  ! 263: LDDA_R	ldda	[%r31, %r0] 0x74, %r23
	.word 0xe8a544a0  ! 264: STWA_R	stwa	%r20, [%r21 + %r0] 0x25
	.word 0xe8ce2000  ! 265: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r20
	.word 0xecce49e0  ! 266: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r22
	mov	0x58, %r16
	.word 0xecb40400  ! 268: STHA_R	stha	%r22, [%r16 + %r0] 0x20
	.word 0xecae2000  ! 269: STBA_I	stba	%r22, [%r24 + 0x0000] %asi
	mov	0x7f8, %r22
	.word 0xec9e2000  ! 271: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r22
	.word 0xee9f0e60  ! 272: LDDA_R	ldda	[%r28, %r0] 0x73, %r23
	.word 0x87802074  ! 273: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeeccc400  ! 274: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee872000  ! 276: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r23
	.word 0x87802074  ! 277: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 278: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b6c9e0  ! 279: STHA_R	stha	%r19, [%r27 + %r0] 0x4f
	.word 0x87802073  ! 280: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6a7e000  ! 281: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	mov	0x48, %r26
	.word 0xe8a7ce60  ! 283: STWA_R	stwa	%r20, [%r31 + %r0] 0x73
	.word 0xe8af2000  ! 284: STBA_I	stba	%r20, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 285: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x60, %r16
	.word 0xe8f7ce80  ! 287: STXA_R	stxa	%r20, [%r31 + %r0] 0x74
	.word 0xeac609e0  ! 288: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r21
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeab4a000  ! 290: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	mov	0x3f0, %r20
	.word 0xeade49e0  ! 292: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r21
	.word 0xe2ac4400  ! 293: STBA_R	stba	%r17, [%r17 + %r0] 0x20
	.word 0xe0a4c400  ! 294: STWA_R	stwa	%r16, [%r19 + %r0] 0x20
	.word 0xe4ae09e0  ! 295: STBA_R	stba	%r18, [%r24 + %r0] 0x4f
	mov	0x40, %r26
	mov	0x18, %r19
	mov	0x70, %r24
	.word 0x87802074  ! 299: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r19
	.word 0xe4f72000  ! 301: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe8f4c400  ! 302: STXA_R	stxa	%r20, [%r19 + %r0] 0x20
	.word 0xe8afa000  ! 303: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe8cfe000  ! 304: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe6b78e80  ! 305: STHA_R	stha	%r19, [%r30 + %r0] 0x74
	.word 0xe6b70e40  ! 306: STHA_R	stha	%r19, [%r28 + %r0] 0x72
	.word 0xe6cfa000  ! 307: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 308: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe88504a0  ! 309: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r20
	.word 0xe8bf6000  ! 310: STDA_I	stda	%r20, [%r29 + 0x0000] %asi
	.word 0xe88f2000  ! 311: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r20
	.word 0x87802073  ! 312: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeed44400  ! 313: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r23
	.word 0xeeb72000  ! 314: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xead584a0  ! 315: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r21
	mov	0x40, %r27
	mov	0x3e8, %r22
	.word 0xecf7ce40  ! 318: STXA_R	stxa	%r22, [%r31 + %r0] 0x72
	.word 0x87802020  ! 319: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecac6000  ! 320: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xecb4e000  ! 321: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	.word 0x87802073  ! 322: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6cf8e40  ! 323: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r19
	.word 0x8780204f  ! 324: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x50, %r26
	.word 0xe6be2000  ! 326: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	mov	0x48, %r26
	mov	0x3c8, %r20
	.word 0xeab689e0  ! 329: STHA_R	stha	%r21, [%r26 + %r0] 0x4f
	.word 0xeaaf0e80  ! 330: STBA_R	stba	%r21, [%r28 + %r0] 0x74
	.word 0xeabe2000  ! 331: STDA_I	stda	%r21, [%r24 + 0x0000] %asi
	.word 0xeac62000  ! 332: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r21
	.word 0xeebfce60  ! 333: STDA_R	stda	%r23, [%r31 + %r0] 0x73
	.word 0xee866000  ! 334: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r23
	.word 0xe68f4e40  ! 335: LDUBA_R	lduba	[%r29, %r0] 0x72, %r19
	.word 0xe6f6a000  ! 336: STXA_I	stxa	%r19, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 337: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x0, %r26
	.word 0x8780204f  ! 339: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe69ee000  ! 340: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r19
	.word 0x87802020  ! 341: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 342: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6bfa000  ! 343: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 344: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 345: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe89e49e0  ! 346: LDDA_R	ldda	[%r25, %r0] 0x4f, %r20
	.word 0x87802020  ! 347: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8dc2000  ! 348: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r20
	.word 0xe8b42000  ! 349: STHA_I	stha	%r20, [%r16 + 0x0000] %asi
	.word 0xe68cc400  ! 350: LDUBA_R	lduba	[%r19, %r0] 0x20, %r19
	.word 0x87802020  ! 351: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b46000  ! 352: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 353: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe29649e0  ! 354: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x68, %r16
	.word 0x87802074  ! 357: WRASI_I	wr	%r0, 0x0074, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeade09e0  ! 359: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r21
	mov	0x18, %r18
	.word 0xeaaf2000  ! 361: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	.word 0xee9dc4a0  ! 362: LDDA_R	ldda	[%r23, %r0] 0x25, %r23
	mov	0x70, %r25
	.word 0xeecfa000  ! 364: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	.word 0x87802072  ! 365: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 366: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7c0, %r22
	.word 0x87802074  ! 368: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeec72000  ! 369: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r23
	.word 0xe0cd04a0  ! 370: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r16
	.word 0xe0f7e000  ! 371: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0f40400  ! 372: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	.word 0xe0cfe000  ! 373: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xe2bd44a0  ! 374: STDA_R	stda	%r17, [%r21 + %r0] 0x25
	mov	0x3d0, %r22
	.word 0xecbc0400  ! 376: STDA_R	stda	%r22, [%r16 + %r0] 0x20
	mov	0x3e8, %r21
	.word 0x8780204f  ! 378: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecb6a000  ! 379: STHA_I	stha	%r22, [%r26 + 0x0000] %asi
	.word 0xeca6e000  ! 380: STWA_I	stwa	%r22, [%r27 + 0x0000] %asi
	.word 0x87802020  ! 381: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 382: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x28, %r25
	.word 0xecc7a000  ! 384: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe6b4c400  ! 385: STHA_R	stha	%r19, [%r19 + %r0] 0x20
	.word 0xe0f689e0  ! 386: STXA_R	stxa	%r16, [%r26 + %r0] 0x4f
	.word 0xe8ac4400  ! 387: STBA_R	stba	%r20, [%r17 + %r0] 0x20
	.word 0xe8a7e000  ! 388: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xe8dc0400  ! 389: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee9c0400  ! 391: LDDA_R	ldda	[%r16, %r0] 0x20, %r23
	.word 0xeef72000  ! 392: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xeef72000  ! 393: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xe0acc400  ! 394: STBA_R	stba	%r16, [%r19 + %r0] 0x20
	.word 0xe0f72000  ! 395: STXA_I	stxa	%r16, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 396: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeec689e0  ! 397: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r23
	mov	0x3c0, %r21
	.word 0xe48c0400  ! 399: LDUBA_R	lduba	[%r16, %r0] 0x20, %r18
	.word 0xe8de89e0  ! 400: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r20
	.word 0x8780204f  ! 401: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8f66000  ! 402: STXA_I	stxa	%r20, [%r25 + 0x0000] %asi
	.word 0xe8aea000  ! 403: STBA_I	stba	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 404: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6bc0400  ! 405: STDA_R	stda	%r19, [%r16 + %r0] 0x20
	.word 0xe2f584a0  ! 406: STXA_R	stxa	%r17, [%r22 + %r0] 0x25
	.word 0xeca5c4a0  ! 407: STWA_R	stwa	%r22, [%r23 + %r0] 0x25
	.word 0xe6ce49e0  ! 408: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r19
	mov	0x48, %r18
	mov	0x7d8, %r23
	.word 0xe6a4e000  ! 411: STWA_I	stwa	%r19, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 412: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6c4e000  ! 413: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r19
	.word 0x87802025  ! 414: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 415: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeebf4e80  ! 416: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xeea7e000  ! 417: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xeed7a000  ! 418: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0xeedf6000  ! 419: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	.word 0xe09504a0  ! 420: LDUHA_R	lduha	[%r20, %r0] 0x25, %r16
	.word 0xe8b4c400  ! 421: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe897a000  ! 422: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	.word 0xec874e40  ! 423: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r22
	.word 0xec972000  ! 424: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r22
	.word 0x87802025  ! 425: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecdda000  ! 426: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r22
	mov	0x68, %r26
	.word 0xe4a44400  ! 428: STWA_R	stwa	%r18, [%r17 + %r0] 0x20
	.word 0x87802025  ! 429: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 430: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49f4e80  ! 431: LDDA_R	ldda	[%r29, %r0] 0x74, %r18
	.word 0xeeaf0e40  ! 432: STBA_R	stba	%r23, [%r28 + %r0] 0x72
	.word 0x87802073  ! 433: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeebfe000  ! 434: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	mov	0x7d8, %r22
	.word 0xeef7a000  ! 436: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 437: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x28, %r19
	.word 0xeebfe000  ! 439: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	mov	0x30, %r26
	.word 0xeebf6000  ! 441: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	mov	0x10, %r18
	.word 0xeeaf6000  ! 443: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeef7a000  ! 444: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xe6dfce40  ! 445: LDXA_R	ldxa	[%r31, %r0] 0x72, %r19
	.word 0xe6d7a000  ! 446: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r19
	.word 0x87802025  ! 447: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 448: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 449: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6b72000  ! 450: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xe8b7ce40  ! 451: STHA_R	stha	%r20, [%r31 + %r0] 0x72
	.word 0x87802020  ! 452: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeaf0e60  ! 453: STBA_R	stba	%r23, [%r28 + %r0] 0x73
	.word 0x87802072  ! 454: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea72000  ! 455: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xe09cc400  ! 456: LDDA_R	ldda	[%r19, %r0] 0x20, %r16
	.word 0x87802073  ! 457: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r24
	mov	0x7f0, %r23
	.word 0xe0d7a000  ! 460: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	.word 0xe69f8e40  ! 461: LDDA_R	ldda	[%r30, %r0] 0x72, %r19
	.word 0xe6c7e000  ! 462: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	mov	0x30, %r16
	.word 0xe8bf4e40  ! 464: STDA_R	stda	%r20, [%r29 + %r0] 0x72
	.word 0xeec44400  ! 465: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r23
	.word 0xe4cec9e0  ! 466: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4f7e000  ! 468: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe4c72000  ! 469: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r18
	.word 0xe8b70e60  ! 470: STHA_R	stha	%r20, [%r28 + %r0] 0x73
	.word 0xe8a76000  ! 471: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xeeaf0e60  ! 472: STBA_R	stba	%r23, [%r28 + %r0] 0x73
	.word 0xeeafe000  ! 473: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	mov	0x7d0, %r23
	.word 0x87802025  ! 475: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3e0, %r22
	mov	0x38, %r17
	.word 0xeed52000  ! 478: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r23
	.word 0xeea5e000  ! 479: STWA_I	stwa	%r23, [%r23 + 0x0000] %asi
	.word 0xe4de09e0  ! 480: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r18
	mov	0x70, %r19
	.word 0xeabf4e40  ! 482: STDA_R	stda	%r21, [%r29 + %r0] 0x72
	mov	0x78, %r19
	.word 0xea956000  ! 484: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r21
	.word 0xeabde000  ! 485: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	.word 0xeacde000  ! 486: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0xeaad6000  ! 487: STBA_I	stba	%r21, [%r21 + 0x0000] %asi
	mov	0x3d8, %r20
	.word 0xeacd2000  ! 489: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r21
	.word 0x87802074  ! 490: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab72000  ! 491: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	.word 0xead72000  ! 492: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r21
	.word 0xe0a689e0  ! 493: STWA_R	stwa	%r16, [%r26 + %r0] 0x4f
	.word 0xeef689e0  ! 494: STXA_R	stxa	%r23, [%r26 + %r0] 0x4f
	.word 0xeecfe000  ! 495: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r23
	.word 0xecc44400  ! 496: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r22
	.word 0xec8f2000  ! 497: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r22
	.word 0xe0cc0400  ! 498: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r16
	.word 0xeec544a0  ! 499: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r23
	mov	0x60, %r18
	.word 0xeaad44a0  ! 501: STBA_R	stba	%r21, [%r21 + %r0] 0x25
	mov	0x20, %r26
	.word 0xe69d04a0  ! 503: LDDA_R	ldda	[%r20, %r0] 0x25, %r19
	.word 0x87802074  ! 504: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8b6c9e0  ! 505: STHA_R	stha	%r20, [%r27 + %r0] 0x4f
	.word 0xeabf0e60  ! 506: STDA_R	stda	%r21, [%r28 + %r0] 0x73
	.word 0x87802073  ! 507: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6a609e0  ! 508: STWA_R	stwa	%r19, [%r24 + %r0] 0x4f
	.word 0xe697a000  ! 509: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
	.word 0xe6a72000  ! 510: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6bfe000  ! 511: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0xe2f6c9e0  ! 512: STXA_R	stxa	%r17, [%r27 + %r0] 0x4f
	.word 0xe89fce80  ! 513: LDDA_R	ldda	[%r31, %r0] 0x74, %r20
	.word 0xe8a76000  ! 514: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0x87802072  ! 515: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8f7a000  ! 516: STXA_I	stxa	%r20, [%r30 + 0x0000] %asi
	.word 0xecbc8400  ! 517: STDA_R	stda	%r22, [%r18 + %r0] 0x20
	.word 0xe0d4c400  ! 518: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r16
	.word 0xe0c7e000  ! 519: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0xecdc4400  ! 520: LDXA_R	ldxa	[%r17, %r0] 0x20, %r22
	.word 0xeca76000  ! 521: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xe8d70e40  ! 522: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r20
	mov	0x7c8, %r23
	.word 0xe6b7ce60  ! 524: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	.word 0x87802072  ! 525: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe697a000  ! 526: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 527: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6f7a000  ! 528: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xe6cfe000  ! 529: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xe88f0e80  ! 530: LDUBA_R	lduba	[%r28, %r0] 0x74, %r20
	.word 0xeaaf0e60  ! 531: STBA_R	stba	%r21, [%r28 + %r0] 0x73
	.word 0xeacf4e80  ! 532: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r21
	.word 0xead72000  ! 533: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r21
	.word 0xeeb609e0  ! 534: STHA_R	stha	%r23, [%r24 + %r0] 0x4f
	.word 0xec9f8e40  ! 535: LDDA_R	ldda	[%r30, %r0] 0x72, %r22
	.word 0xecafe000  ! 536: STBA_I	stba	%r22, [%r31 + 0x0000] %asi
	.word 0xecc7a000  ! 537: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xec974e40  ! 538: LDUHA_R	lduha	[%r29, %r0] 0x72, %r22
	.word 0xe0948400  ! 539: LDUHA_R	lduha	[%r18, %r0] 0x20, %r16
	mov	0x7e0, %r22
	.word 0xe0df0e40  ! 541: LDXA_R	ldxa	[%r28, %r0] 0x72, %r16
	.word 0xe29e89e0  ! 542: LDDA_R	ldda	[%r26, %r0] 0x4f, %r17
	.word 0xe2bc8400  ! 543: STDA_R	stda	%r17, [%r18 + %r0] 0x20
	.word 0xe2f7a000  ! 544: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 545: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaa7ce40  ! 546: STWA_R	stwa	%r21, [%r31 + %r0] 0x72
	.word 0xeecc0400  ! 547: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r23
	.word 0xe8874e80  ! 548: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r20
	mov	0x3f8, %r20
	.word 0xe8c5a000  ! 550: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r20
	.word 0xe8f5a000  ! 551: STXA_I	stxa	%r20, [%r22 + 0x0000] %asi
	.word 0xeac7ce60  ! 552: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r21
	.word 0xe8dc8400  ! 553: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	.word 0xe8dd6000  ! 554: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r20
	.word 0xeadf4e60  ! 555: LDXA_R	ldxa	[%r29, %r0] 0x73, %r21
	.word 0xea95a000  ! 556: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r21
	.word 0xeaa56000  ! 557: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0x87802025  ! 558: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0b6c9e0  ! 559: STHA_R	stha	%r16, [%r27 + %r0] 0x4f
	mov	0x70, %r26
	.word 0xe6948400  ! 561: LDUHA_R	lduha	[%r18, %r0] 0x20, %r19
	.word 0xe68d2000  ! 562: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r19
	.word 0x87802020  ! 563: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 564: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6872000  ! 565: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r19
	.word 0xe68f2000  ! 566: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r19
	.word 0xe8dc0400  ! 567: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	.word 0xe8f7e000  ! 568: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0xe8f7e000  ! 569: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	mov	0x10, %r17
	.word 0xe2a40400  ! 571: STWA_R	stwa	%r17, [%r16 + %r0] 0x20
	.word 0xe0ac4400  ! 572: STBA_R	stba	%r16, [%r17 + %r0] 0x20
	mov	0x40, %r19
	.word 0x87802072  ! 574: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe68689e0  ! 575: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r19
	.word 0xe49f4e60  ! 576: LDDA_R	ldda	[%r29, %r0] 0x73, %r18
	.word 0xe4972000  ! 577: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	mov	0x30, %r25
	.word 0xe6b44400  ! 579: STHA_R	stha	%r19, [%r17 + %r0] 0x20
	.word 0xe6b76000  ! 580: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	mov	0x10, %r17
	.word 0xe4944400  ! 582: LDUHA_R	lduha	[%r17, %r0] 0x20, %r18
	.word 0x87802025  ! 583: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6bd04a0  ! 584: STDA_R	stda	%r19, [%r20 + %r0] 0x25
	.word 0xea9f4e80  ! 585: LDDA_R	ldda	[%r29, %r0] 0x74, %r21
	.word 0xeaaf0e60  ! 586: STBA_R	stba	%r21, [%r28 + %r0] 0x73
	.word 0xeaa5a000  ! 587: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	mov	0x58, %r25
	mov	0x28, %r17
	.word 0xea9de000  ! 590: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r21
	mov	0x50, %r25
	mov	0x20, %r25
	.word 0xea9da000  ! 593: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	.word 0xe2bd04a0  ! 594: STDA_R	stda	%r17, [%r20 + %r0] 0x25
	.word 0xe4bf0e40  ! 595: STDA_R	stda	%r18, [%r28 + %r0] 0x72
	.word 0x87802020  ! 596: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 597: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8b48400  ! 598: STHA_R	stha	%r20, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 599: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab6c9e0  ! 600: STHA_R	stha	%r21, [%r27 + %r0] 0x4f
	mov	0x28, %r18
	.word 0xea9ea000  ! 602: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r21
	.word 0xea86a000  ! 603: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r21
	.word 0xeaae6000  ! 604: STBA_I	stba	%r21, [%r25 + 0x0000] %asi
	.word 0x8780204f  ! 605: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab6e000  ! 606: STHA_I	stha	%r21, [%r27 + 0x0000] %asi
	.word 0xea86a000  ! 607: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r21
	.word 0xe2f4c400  ! 608: STXA_R	stxa	%r17, [%r19 + %r0] 0x20
	.word 0x87802020  ! 609: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8ac8400  ! 610: STBA_R	stba	%r20, [%r18 + %r0] 0x20
	mov	0x50, %r24
	.word 0xe8ac6000  ! 612: STBA_I	stba	%r20, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 613: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4a5c4a0  ! 614: STWA_R	stwa	%r18, [%r23 + %r0] 0x25
	.word 0x87802020  ! 615: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 616: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaa544a0  ! 617: STWA_R	stwa	%r21, [%r21 + %r0] 0x25
	mov	0x40, %r16
	.word 0xe2df8e80  ! 619: LDXA_R	ldxa	[%r30, %r0] 0x74, %r17
	mov	0x3d8, %r21
	mov	0x3c0, %r20
	.word 0xe2c66000  ! 622: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r17
	.word 0xe2b62000  ! 623: STHA_I	stha	%r17, [%r24 + 0x0000] %asi
	.word 0xe2b62000  ! 624: STHA_I	stha	%r17, [%r24 + 0x0000] %asi
	.word 0x87802074  ! 625: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2976000  ! 626: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2a76000  ! 627: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe4f544a0  ! 628: STXA_R	stxa	%r18, [%r21 + %r0] 0x25
	.word 0xe4876000  ! 629: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	mov	0x7c0, %r23
	.word 0xe6a44400  ! 631: STWA_R	stwa	%r19, [%r17 + %r0] 0x20
	.word 0xe6b7a000  ! 632: STHA_I	stha	%r19, [%r30 + 0x0000] %asi
	.word 0xe2ccc400  ! 633: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r17
	.word 0xe2f76000  ! 634: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	mov	0x70, %r17
	mov	0x28, %r26
	.word 0xeebe49e0  ! 637: STDA_R	stda	%r23, [%r25 + %r0] 0x4f
	mov	0x0, %r27
	.word 0x87802073  ! 639: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x38, %r19
	.word 0xeeaf6000  ! 641: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0x87802025  ! 642: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6f78e80  ! 643: STXA_R	stxa	%r19, [%r30 + %r0] 0x74
	mov	0x8, %r25
	.word 0xe0de49e0  ! 645: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r16
	mov	0x40, %r24
	.word 0xe0956000  ! 647: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r16
	.word 0xe0cda000  ! 648: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r16
	.word 0xe0bd6000  ! 649: STDA_I	stda	%r16, [%r21 + 0x0000] %asi
	.word 0xe085a000  ! 650: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r16
	.word 0xe0ade000  ! 651: STBA_I	stba	%r16, [%r23 + 0x0000] %asi
	.word 0x87802025  ! 652: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x58, %r24
	.word 0xe0f5a000  ! 654: STXA_I	stxa	%r16, [%r22 + 0x0000] %asi
	.word 0xe0f52000  ! 655: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0f52000  ! 656: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0b56000  ! 657: STHA_I	stha	%r16, [%r21 + 0x0000] %asi
	.word 0xeaa70e80  ! 658: STWA_R	stwa	%r21, [%r28 + %r0] 0x74
	.word 0xeacd2000  ! 659: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r21
	.word 0xeaadc4a0  ! 660: STBA_R	stba	%r21, [%r23 + %r0] 0x25
	.word 0xeaa56000  ! 661: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0xeaada000  ! 662: STBA_I	stba	%r21, [%r22 + 0x0000] %asi
	.word 0xeab5e000  ! 663: STHA_I	stha	%r21, [%r23 + 0x0000] %asi
	mov	0x78, %r25
	.word 0xe2af4e60  ! 665: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	mov	0x48, %r27
	.word 0xe6c40400  ! 667: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r19
	.word 0xea9c8400  ! 668: LDDA_R	ldda	[%r18, %r0] 0x20, %r21
	.word 0xeab52000  ! 669: STHA_I	stha	%r21, [%r20 + 0x0000] %asi
	.word 0x87802020  ! 670: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab42000  ! 671: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	.word 0xe4b74e60  ! 672: STHA_R	stha	%r18, [%r29 + %r0] 0x73
	.word 0xe4f46000  ! 673: STXA_I	stxa	%r18, [%r17 + 0x0000] %asi
	.word 0xe48ce000  ! 674: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r18
	.word 0x8780204f  ! 675: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3f8, %r23
	.word 0xe4de6000  ! 677: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r18
	mov	0x7e0, %r20
	.word 0x87802025  ! 679: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 680: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeef40400  ! 681: STXA_R	stxa	%r23, [%r16 + %r0] 0x20
	mov	0x68, %r18
	mov	0x3e8, %r20
	mov	0x3d8, %r22
	mov	0x40, %r18
	.word 0xea9e09e0  ! 686: LDDA_R	ldda	[%r24, %r0] 0x4f, %r21
	.word 0x87802074  ! 687: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f44400  ! 688: STXA_R	stxa	%r19, [%r17 + %r0] 0x20
	.word 0xe6f72000  ! 689: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xe4b7ce40  ! 690: STHA_R	stha	%r18, [%r31 + %r0] 0x72
	.word 0xe8ccc400  ! 691: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r20
	.word 0xeac5c4a0  ! 692: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r21
	.word 0xeeaf0e80  ! 693: STBA_R	stba	%r23, [%r28 + %r0] 0x74
	.word 0xee97a000  ! 694: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r23
	.word 0xeed7a000  ! 695: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802025  ! 696: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 697: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f504a0  ! 698: STXA_R	stxa	%r19, [%r20 + %r0] 0x25
	.word 0xec8ec9e0  ! 699: LDUBA_R	lduba	[%r27, %r0] 0x4f, %r22
	.word 0x87802020  ! 700: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3c0, %r22
	.word 0xecf74e80  ! 702: STXA_R	stxa	%r22, [%r29 + %r0] 0x74
	mov	0x78, %r27
	.word 0xe6b689e0  ! 704: STHA_R	stha	%r19, [%r26 + %r0] 0x4f
	.word 0x87802072  ! 705: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6b72000  ! 706: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	mov	0x58, %r18
	.word 0x87802020  ! 708: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8970e80  ! 709: LDUHA_R	lduha	[%r28, %r0] 0x74, %r20
	.word 0x87802020  ! 710: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe88c6000  ! 711: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r20
	.word 0xe8afce60  ! 712: STBA_R	stba	%r20, [%r31 + %r0] 0x73
	.word 0xe8bce000  ! 713: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	mov	0x48, %r26
	.word 0xec8f4e80  ! 715: LDUBA_R	lduba	[%r29, %r0] 0x74, %r22
	.word 0xe0b70e60  ! 716: STHA_R	stha	%r16, [%r28 + %r0] 0x73
	.word 0xe0b74e80  ! 717: STHA_R	stha	%r16, [%r29 + %r0] 0x74
	mov	0x60, %r25
	.word 0xe0cce000  ! 719: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r16
	.word 0xe0a4a000  ! 720: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	mov	0x60, %r17
	mov	0x3c0, %r22
	mov	0x58, %r16
	.word 0xeaae09e0  ! 724: STBA_R	stba	%r21, [%r24 + %r0] 0x4f
	mov	0x7f8, %r20
	.word 0xeaf42000  ! 726: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	.word 0xe88fce40  ! 727: LDUBA_R	lduba	[%r31, %r0] 0x72, %r20
	mov	0x60, %r26
	.word 0xe88504a0  ! 729: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r20
	.word 0xe8842000  ! 730: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r20
	.word 0xe8bc6000  ! 731: STDA_I	stda	%r20, [%r17 + 0x0000] %asi
	.word 0xe48e89e0  ! 732: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r18
	.word 0xec9c0400  ! 733: LDDA_R	ldda	[%r16, %r0] 0x20, %r22
	.word 0xe8df0e60  ! 734: LDXA_R	ldxa	[%r28, %r0] 0x73, %r20
	.word 0xe8dc6000  ! 735: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r20
	mov	0x58, %r19
	mov	0x28, %r17
	.word 0xe8946000  ! 738: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r20
	.word 0xe8f4e000  ! 739: STXA_I	stxa	%r20, [%r19 + 0x0000] %asi
	mov	0x50, %r18
	.word 0xeecf8e80  ! 741: LDSBA_R	ldsba	[%r30, %r0] 0x74, %r23
	.word 0xeea42000  ! 742: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0xe0a78e40  ! 743: STWA_R	stwa	%r16, [%r30 + %r0] 0x72
	mov	0x60, %r27
	.word 0x87802020  ! 745: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bc6000  ! 746: STDA_I	stda	%r16, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 747: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bca000  ! 748: STDA_I	stda	%r16, [%r18 + 0x0000] %asi
	.word 0xeab48400  ! 749: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	mov	0x50, %r24
	.word 0xe68f8e40  ! 751: LDUBA_R	lduba	[%r30, %r0] 0x72, %r19
	mov	0x60, %r17
	.word 0xe69ca000  ! 753: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r19
	.word 0xecb78e40  ! 754: STHA_R	stha	%r22, [%r30 + %r0] 0x72
	.word 0xecb4a000  ! 755: STHA_I	stha	%r22, [%r18 + 0x0000] %asi
	mov	0x10, %r24
	.word 0xec870e60  ! 757: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r22
	mov	0x3c8, %r23
	.word 0xeca4a000  ! 759: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0xeef5c4a0  ! 760: STXA_R	stxa	%r23, [%r23 + %r0] 0x25
	.word 0x87802020  ! 761: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4bfce80  ! 762: STDA_R	stda	%r18, [%r31 + %r0] 0x74
	.word 0xe4a689e0  ! 763: STWA_R	stwa	%r18, [%r26 + %r0] 0x4f
	mov	0x48, %r24
	.word 0x87802073  ! 765: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4af6000  ! 766: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	mov	0x38, %r25
	.word 0xe4af2000  ! 768: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	.word 0xe4b7ce60  ! 769: STHA_R	stha	%r18, [%r31 + %r0] 0x73
	.word 0xec8dc4a0  ! 770: LDUBA_R	lduba	[%r23, %r0] 0x25, %r22
	.word 0x87802072  ! 771: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeccfa000  ! 772: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r22
	.word 0xecbf2000  ! 773: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xe6bc0400  ! 774: STDA_R	stda	%r19, [%r16 + %r0] 0x20
	.word 0xeef48400  ! 775: STXA_R	stxa	%r23, [%r18 + %r0] 0x20
	.word 0x87802025  ! 776: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaddc4a0  ! 777: LDXA_R	ldxa	[%r23, %r0] 0x25, %r21
	mov	0x3c0, %r21
	mov	0x78, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8780204f  ! 781: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d8, %r21
	.word 0xe6a74e80  ! 783: STWA_R	stwa	%r19, [%r29 + %r0] 0x74
	mov	0x7c0, %r22
	mov	0x58, %r24
	mov	0x68, %r25
	mov	0x7e8, %r23
	.word 0x87802074  ! 788: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6876000  ! 789: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	mov	0x30, %r18
	.word 0xe6dfe000  ! 791: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6cfa000  ! 792: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	mov	0x10, %r24
	mov	0x0, %r17
	.word 0xeebd04a0  ! 795: STDA_R	stda	%r23, [%r20 + %r0] 0x25
	.word 0xeef74e60  ! 796: STXA_R	stxa	%r23, [%r29 + %r0] 0x73
	.word 0xeef7e000  ! 797: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xee9fa000  ! 798: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	mov	0x7d8, %r21
	.word 0xeedf6000  ! 800: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	mov	0x3d0, %r23
	mov	0x58, %r27
	mov	0x7c8, %r22
	.word 0xecacc400  ! 804: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	mov	0x50, %r26
	.word 0xecf76000  ! 806: STXA_I	stxa	%r22, [%r29 + 0x0000] %asi
	.word 0xeac74e80  ! 807: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r21
	mov	0x8, %r24
	.word 0xe0dc8400  ! 809: LDXA_R	ldxa	[%r18, %r0] 0x20, %r16
	.word 0xe0bfa000  ! 810: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0b76000  ! 811: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xe8cfce60  ! 812: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r20
	mov	0x20, %r27
	mov	0x10, %r18
	.word 0xe4df4e60  ! 815: LDXA_R	ldxa	[%r29, %r0] 0x73, %r18
	.word 0xe2afce80  ! 816: STBA_R	stba	%r17, [%r31 + %r0] 0x74
	.word 0xe2c76000  ! 817: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r17
	.word 0x87802020  ! 818: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 819: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeb78e80  ! 820: STHA_R	stha	%r23, [%r30 + %r0] 0x74
	.word 0xeeade000  ! 821: STBA_I	stba	%r23, [%r23 + 0x0000] %asi
	.word 0xee9da000  ! 822: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r23
	.word 0xee9ec9e0  ! 823: LDDA_R	ldda	[%r27, %r0] 0x4f, %r23
	mov	0x38, %r16
	.word 0x87802020  ! 825: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 826: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 827: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 828: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b78e60  ! 829: STHA_R	stha	%r20, [%r30 + %r0] 0x73
	mov	0x40, %r16
	.word 0xe8afce60  ! 831: STBA_R	stba	%r20, [%r31 + %r0] 0x73
	.word 0xe8c4a000  ! 832: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r20
	.word 0xea8d84a0  ! 833: LDUBA_R	lduba	[%r22, %r0] 0x25, %r21
	.word 0xead46000  ! 834: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xea9e89e0  ! 835: LDDA_R	ldda	[%r26, %r0] 0x4f, %r21
	.word 0xeabc2000  ! 836: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xe0ccc400  ! 837: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	.word 0xe0cc2000  ! 838: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r16
	.word 0x8780204f  ! 839: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0a6e000  ! 840: STWA_I	stwa	%r16, [%r27 + 0x0000] %asi
	.word 0x87802020  ! 841: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe09c2000  ! 842: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r16
	mov	0x40, %r18
	mov	0x40, %r25
	mov	0x28, %r26
	mov	0x30, %r27
	mov	0x3d8, %r20
	mov	0x8, %r18
	.word 0xe0c4a000  ! 849: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r16
	.word 0x87802073  ! 850: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x0, %r25
	mov	0x60, %r25
	.word 0xe0cfe000  ! 853: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0x87802020  ! 854: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r24
	.word 0xecc544a0  ! 856: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r22
	mov	0x18, %r27
	.word 0x87802020  ! 858: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 859: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 860: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecbfe000  ! 861: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	.word 0xeef649e0  ! 862: STXA_R	stxa	%r23, [%r25 + %r0] 0x4f
	mov	0x58, %r16
	.word 0xeeb7e000  ! 864: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	.word 0xee9f2000  ! 865: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r23
	mov	0x7d8, %r22
	.word 0xe6b7ce40  ! 867: STHA_R	stha	%r19, [%r31 + %r0] 0x72
	mov	0x68, %r27
	.word 0xe6f76000  ! 869: STXA_I	stxa	%r19, [%r29 + 0x0000] %asi
	.word 0xe6c7a000  ! 870: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r19
	.word 0x87802073  ! 871: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6976000  ! 872: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r19
	.word 0xecad84a0  ! 873: STBA_R	stba	%r22, [%r22 + %r0] 0x25
	mov	0x40, %r19
	.word 0x87802073  ! 875: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0d70e40  ! 876: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r16
	.word 0x87802020  ! 877: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4f584a0  ! 878: STXA_R	stxa	%r18, [%r22 + %r0] 0x25
	.word 0xee940400  ! 879: LDUHA_R	lduha	[%r16, %r0] 0x20, %r23
	.word 0xee8f0e80  ! 880: LDUBA_R	lduba	[%r28, %r0] 0x74, %r23
	.word 0xe6a4c400  ! 881: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0xe2978e80  ! 882: LDUHA_R	lduha	[%r30, %r0] 0x74, %r17
	.word 0x87802073  ! 883: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2d76000  ! 884: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xe49649e0  ! 885: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r18
	.word 0xe4f72000  ! 886: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4bc0400  ! 887: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	.word 0xe0bd84a0  ! 888: STDA_R	stda	%r16, [%r22 + %r0] 0x25
	.word 0xeec504a0  ! 889: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r23
	.word 0xe28f4e60  ! 890: LDUBA_R	lduba	[%r29, %r0] 0x73, %r17
	.word 0xe29fe000  ! 891: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r17
	.word 0xeedf4e60  ! 892: LDXA_R	ldxa	[%r29, %r0] 0x73, %r23
	.word 0xee972000  ! 893: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	.word 0xec8dc4a0  ! 894: LDUBA_R	lduba	[%r23, %r0] 0x25, %r22
	.word 0xec9f0e60  ! 895: LDDA_R	ldda	[%r28, %r0] 0x73, %r22
	.word 0xee9fce60  ! 896: LDDA_R	ldda	[%r31, %r0] 0x73, %r23
	.word 0xeecfe000  ! 897: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r23
	.word 0xeea7ce60  ! 898: STWA_R	stwa	%r23, [%r31 + %r0] 0x73
	.word 0xeef7e000  ! 899: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xe8a5c4a0  ! 900: STWA_R	stwa	%r20, [%r23 + %r0] 0x25
	.word 0x87802073  ! 901: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7f8, %r20
	.word 0x87802020  ! 903: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 904: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r19
	mov	0x3f0, %r20
	mov	0x18, %r17
	mov	0x8, %r17
	.word 0xeccd04a0  ! 909: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r22
	.word 0x87802020  ! 910: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb4a000  ! 911: STHA_I	stha	%r22, [%r18 + 0x0000] %asi
	.word 0xecc74e40  ! 912: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r22
	.word 0xe08c0400  ! 913: LDUBA_R	lduba	[%r16, %r0] 0x20, %r16
	.word 0xe2f6c9e0  ! 914: STXA_R	stxa	%r17, [%r27 + %r0] 0x4f
	.word 0xe2f4a000  ! 915: STXA_I	stxa	%r17, [%r18 + 0x0000] %asi
	.word 0xe2bc2000  ! 916: STDA_I	stda	%r17, [%r16 + 0x0000] %asi
	mov	0x0, %r16
	.word 0xe4ad04a0  ! 918: STBA_R	stba	%r18, [%r20 + %r0] 0x25
	mov	0x7f0, %r22
	.word 0xe4a70e60  ! 920: STWA_R	stwa	%r18, [%r28 + %r0] 0x73
	.word 0xe0b544a0  ! 921: STHA_R	stha	%r16, [%r21 + %r0] 0x25
	.word 0xeeb584a0  ! 922: STHA_R	stha	%r23, [%r22 + %r0] 0x25
	.word 0xecbf8e40  ! 923: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	.word 0xeef6c9e0  ! 924: STXA_R	stxa	%r23, [%r27 + %r0] 0x4f
	.word 0xec9e09e0  ! 925: LDDA_R	ldda	[%r24, %r0] 0x4f, %r22
	mov	0x18, %r26
	.word 0xeca42000  ! 927: STWA_I	stwa	%r22, [%r16 + 0x0000] %asi
	.word 0xeccc6000  ! 928: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r22
	.word 0xe2f70e80  ! 929: STXA_R	stxa	%r17, [%r28 + %r0] 0x74
	mov	0x3c8, %r22
	.word 0xe2b46000  ! 931: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	mov	0x18, %r18
	.word 0xe0a78e40  ! 933: STWA_R	stwa	%r16, [%r30 + %r0] 0x72
	.word 0xe2cdc4a0  ! 934: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r17
	.word 0xe2d42000  ! 935: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r17
	.word 0xe2842000  ! 936: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r17
	.word 0xe687ce40  ! 937: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r19
	.word 0xe6bca000  ! 938: STDA_I	stda	%r19, [%r18 + 0x0000] %asi
	.word 0xe6b4e000  ! 939: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	mov	0x48, %r19
	mov	0x3d0, %r22
	.word 0xe6dc6000  ! 942: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r19
	mov	0x30, %r26
	mov	0x38, %r19
	mov	0x0, %r17
	.word 0xe6b46000  ! 946: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0xe694e000  ! 947: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r19
	.word 0x87802074  ! 948: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe69fce80  ! 949: LDDA_R	ldda	[%r31, %r0] 0x74, %r19
	mov	0x7f0, %r20
	.word 0xe2d40400  ! 951: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r17
	.word 0xe2d72000  ! 952: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe4c6c9e0  ! 953: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r18
	.word 0xe4afa000  ! 954: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xe4972000  ! 955: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	mov	0x7f8, %r22
	mov	0x7c8, %r23
	.word 0xeac4c400  ! 958: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r21
	.word 0xea9f2000  ! 959: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r21
	.word 0xeadf6000  ! 960: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r21
	.word 0xead76000  ! 961: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xeaaf2000  ! 962: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	.word 0xe887ce40  ! 963: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r20
	mov	0x70, %r16
	.word 0xe2bfce80  ! 965: STDA_R	stda	%r17, [%r31 + %r0] 0x74
	mov	0x78, %r16
	.word 0xe4cf8e40  ! 967: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r18
	.word 0x87802025  ! 968: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4d649e0  ! 969: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r18
	mov	0x7e0, %r22
	.word 0x87802072  ! 971: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r26
	mov	0x60, %r16
	.word 0xea8e89e0  ! 974: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r21
	mov	0x40, %r19
	.word 0xea97e000  ! 976: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xeaa7a000  ! 977: STWA_I	stwa	%r21, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 978: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 979: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab42000  ! 980: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x8, %r17
	mov	0x68, %r17
	.word 0xeaac6000  ! 983: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	mov	0x0, %r26
	.word 0xead46000  ! 986: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xeab46000  ! 987: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	mov	0x38, %r27
	.word 0xeac4e000  ! 989: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r21
	.word 0xea8c2000  ! 990: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 991: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x30, %r27
	.word 0xeaae6000  ! 993: STBA_I	stba	%r21, [%r25 + 0x0000] %asi
	.word 0x87802025  ! 994: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac52000  ! 995: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r21
	mov	0x3d0, %r23
	.word 0xe0a649e0  ! 997: STWA_R	stwa	%r16, [%r25 + %r0] 0x4f
	.word 0xe0a7ce60  ! 998: STWA_R	stwa	%r16, [%r31 + %r0] 0x73
	mov	0x3c0, %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	mov	0x7d0, %r23
	.word 0xe4a689e0  ! 2: STWA_R	stwa	%r18, [%r26 + %r0] 0x4f
	.word 0xecf4e000  ! 3: STXA_I	stxa	%r22, [%r19 + 0x0000] %asi
	.word 0xeca4a000  ! 4: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 5: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0c78e40  ! 6: LDSWA_R	ldswa	[%r30, %r0] 0x72, %r16
	.word 0xee8ee000  ! 7: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r23
	mov	0x3f8, %r23
	.word 0x87802020  ! 9: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r16
	.word 0xe8a504a0  ! 11: STWA_R	stwa	%r20, [%r20 + %r0] 0x25
	mov	0x30, %r17
	.word 0xe8b7a000  ! 13: STHA_I	stha	%r20, [%r30 + 0x0000] %asi
	.word 0xe8f7e000  ! 14: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0xe6a4c400  ! 15: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	.word 0xe6970e80  ! 16: LDUHA_R	lduha	[%r28, %r0] 0x74, %r19
	.word 0xeadfce40  ! 17: LDXA_R	ldxa	[%r31, %r0] 0x72, %r21
	.word 0xe4b70e60  ! 18: STHA_R	stha	%r18, [%r28 + %r0] 0x73
	.word 0xeeaf8e40  ! 19: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0xe2af2000  ! 20: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0xe2a7e000  ! 21: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0xe6f689e0  ! 22: STXA_R	stxa	%r19, [%r26 + %r0] 0x4f
	.word 0xeebf4e80  ! 23: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xe895c4a0  ! 24: LDUHA_R	lduha	[%r23, %r0] 0x25, %r20
	.word 0x8780204f  ! 25: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 26: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x0, %r24
	.word 0xe4b5c4a0  ! 28: STHA_R	stha	%r18, [%r23 + %r0] 0x25
	.word 0xe8b5a000  ! 29: STHA_I	stha	%r20, [%r22 + 0x0000] %asi
	mov	0x3e8, %r21
	.word 0xe8956000  ! 31: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r20
	.word 0xe8bd2000  ! 32: STDA_I	stda	%r20, [%r20 + 0x0000] %asi
	.word 0xe8c52000  ! 33: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r20
	.word 0x87802020  ! 34: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 35: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec870e80  ! 36: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r22
	.word 0xee972000  ! 37: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	mov	0x30, %r24
	.word 0xeed7e000  ! 39: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0xeca584a0  ! 40: STWA_R	stwa	%r22, [%r22 + %r0] 0x25
	mov	0x20, %r17
	mov	0x68, %r19
	.word 0xe0972000  ! 43: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r16
	mov	0x48, %r24
	mov	0x70, %r19
	.word 0xe0f7a000  ! 46: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	.word 0xe087a000  ! 47: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r16
	.word 0xe09f2000  ! 48: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r16
	.word 0xe0afe000  ! 49: STBA_I	stba	%r16, [%r31 + 0x0000] %asi
	mov	0x10, %r26
	mov	0x50, %r26
	.word 0xe8aec9e0  ! 52: STBA_R	stba	%r20, [%r27 + %r0] 0x4f
	.word 0xead7e000  ! 53: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0xea972000  ! 54: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0xeabf2000  ! 55: STDA_I	stda	%r21, [%r28 + 0x0000] %asi
	.word 0xe89649e0  ! 56: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r20
	.word 0xe8a72000  ! 57: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f7e000  ! 58: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0xe8f72000  ! 59: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8cf6000  ! 60: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	mov	0x70, %r18
	.word 0xe8ac4400  ! 62: STBA_R	stba	%r20, [%r17 + %r0] 0x20
	.word 0xe6ac0400  ! 63: STBA_R	stba	%r19, [%r16 + %r0] 0x20
	.word 0xee8f2000  ! 64: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r23
	.word 0xe2944400  ! 65: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	mov	0x3f0, %r22
	.word 0xeedf6000  ! 67: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	mov	0x30, %r18
	.word 0xeef7e000  ! 69: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	mov	0x8, %r27
	.word 0xeef72000  ! 71: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x7e8, %r23
	.word 0xeeaf6000  ! 73: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeef7a000  ! 74: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xeed7e000  ! 75: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0x87802074  ! 76: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 77: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea42000  ! 78: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	mov	0x50, %r26
	.word 0xe2af0e80  ! 80: STBA_R	stba	%r17, [%r28 + %r0] 0x74
	.word 0x87802025  ! 81: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4f56000  ! 82: STXA_I	stxa	%r18, [%r21 + 0x0000] %asi
	.word 0xe8bf0e40  ! 83: STDA_R	stda	%r20, [%r28 + %r0] 0x72
	.word 0xeaad2000  ! 84: STBA_I	stba	%r21, [%r20 + 0x0000] %asi
	.word 0xeaa52000  ! 85: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0xe2b78e60  ! 86: STHA_R	stha	%r17, [%r30 + %r0] 0x73
	mov	0x3f8, %r22
	.word 0xe2c7ce60  ! 88: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r17
	.word 0x87802020  ! 89: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4be6000  ! 90: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	.word 0x87802072  ! 91: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 92: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x40, %r18
	.word 0xeca6c9e0  ! 94: STWA_R	stwa	%r22, [%r27 + %r0] 0x4f
	mov	0x3c0, %r20
	.word 0x87802072  ! 96: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecbf6000  ! 97: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	mov	0x28, %r18
	.word 0x8780204f  ! 99: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecdda000  ! 100: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r22
	.word 0xeccde000  ! 101: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r22
	.word 0xeaf70e60  ! 102: STXA_R	stxa	%r21, [%r28 + %r0] 0x73
	.word 0x87802072  ! 103: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeeaf6000  ! 104: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xe6b78e80  ! 105: STHA_R	stha	%r19, [%r30 + %r0] 0x74
	.word 0xeef40400  ! 106: STXA_R	stxa	%r23, [%r16 + %r0] 0x20
	.word 0xe4c76000  ! 107: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4b7e000  ! 108: STHA_I	stha	%r18, [%r31 + 0x0000] %asi
	.word 0xe4c7e000  ! 109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	mov	0x68, %r16
	.word 0xe4876000  ! 111: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0x87802074  ! 112: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4dde000  ! 113: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r18
	mov	0x7f0, %r22
	mov	0x48, %r18
	.word 0xe4d5e000  ! 116: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r18
	mov	0x68, %r24
	.word 0x87802073  ! 118: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2a609e0  ! 119: STWA_R	stwa	%r17, [%r24 + %r0] 0x4f
	.word 0xe4c7ce80  ! 120: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r18
	.word 0xecac4400  ! 121: STBA_R	stba	%r22, [%r17 + %r0] 0x20
	.word 0xeaa76000  ! 122: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0xeaa76000  ! 123: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	mov	0x70, %r19
	.word 0xeaf544a0  ! 125: STXA_R	stxa	%r21, [%r21 + %r0] 0x25
	mov	0x28, %r25
	.word 0xe2a689e0  ! 127: STWA_R	stwa	%r17, [%r26 + %r0] 0x4f
	.word 0xe2976000  ! 128: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2f72000  ! 129: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2a72000  ! 131: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2d7a000  ! 132: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe2bf2000  ! 133: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe4d74e80  ! 134: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r18
	mov	0x50, %r17
	.word 0xe4870e40  ! 136: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r18
	mov	0x10, %r26
	.word 0xe48fa000  ! 138: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0x8780204f  ! 139: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4b78e40  ! 140: STHA_R	stha	%r18, [%r30 + %r0] 0x72
	.word 0xeedf8e40  ! 141: LDXA_R	ldxa	[%r30, %r0] 0x72, %r23
	.word 0xe68e2000  ! 142: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r19
	.word 0x87802072  ! 143: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x78, %r27
	.word 0xe6cea000  ! 145: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r19
	.word 0xe6d6a000  ! 146: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	.word 0xeed584a0  ! 147: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r23
	.word 0xe6cea000  ! 148: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r19
	.word 0xe6d62000  ! 149: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a66000  ! 150: STWA_I	stwa	%r19, [%r25 + 0x0000] %asi
	.word 0xe6ce2000  ! 151: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a66000  ! 152: STWA_I	stwa	%r19, [%r25 + 0x0000] %asi
	.word 0x87802025  ! 153: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b6e000  ! 154: STHA_I	stha	%r19, [%r27 + 0x0000] %asi
	.word 0x87802020  ! 155: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6cc2000  ! 156: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r19
	.word 0x87802073  ! 157: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0b70e60  ! 158: STHA_R	stha	%r16, [%r28 + %r0] 0x73
	.word 0xeec70e80  ! 159: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r23
	.word 0x87802072  ! 160: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x68, %r19
	mov	0x60, %r19
	.word 0xee8cc400  ! 163: LDUBA_R	lduba	[%r19, %r0] 0x20, %r23
	.word 0xead78e40  ! 164: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r21
	.word 0xe8bf2000  ! 165: STDA_I	stda	%r20, [%r28 + 0x0000] %asi
	mov	0x18, %r19
	.word 0xe8c72000  ! 167: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r20
	.word 0x87802074  ! 168: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xea974e40  ! 169: LDUHA_R	lduha	[%r29, %r0] 0x72, %r21
	mov	0x8, %r17
	.word 0xe4974e60  ! 171: LDUHA_R	lduha	[%r29, %r0] 0x73, %r18
	mov	0x40, %r16
	mov	0x68, %r25
	.word 0xe4ce89e0  ! 174: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r18
	.word 0xe4970e60  ! 175: LDUHA_R	lduha	[%r28, %r0] 0x73, %r18
	.word 0xe0b56000  ! 176: STHA_I	stha	%r16, [%r21 + 0x0000] %asi
	.word 0xe2b584a0  ! 177: STHA_R	stha	%r17, [%r22 + %r0] 0x25
	.word 0xe8a52000  ! 178: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xeabf4e80  ! 179: STDA_R	stda	%r21, [%r29 + %r0] 0x74
	mov	0x48, %r19
	mov	0x70, %r19
	mov	0x40, %r19
	.word 0xe2d4c400  ! 183: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r17
	.word 0xee95c4a0  ! 184: LDUHA_R	lduha	[%r23, %r0] 0x25, %r23
	.word 0xe0d5c4a0  ! 185: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r16
	.word 0xe28d2000  ! 186: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r17
	.word 0xe2bde000  ! 187: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	.word 0x87802025  ! 188: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 189: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe28ee000  ! 190: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r17
	mov	0x3e8, %r21
	.word 0x87802073  ! 192: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6c78e60  ! 193: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r19
	.word 0xecdc2000  ! 194: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r22
	.word 0x87802074  ! 195: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecc7a000  ! 196: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe6af8e60  ! 197: STBA_R	stba	%r19, [%r30 + %r0] 0x73
	mov	0x38, %r18
	.word 0xecaf8e40  ! 199: STBA_R	stba	%r22, [%r30 + %r0] 0x72
	.word 0xe6f7ce80  ! 200: STXA_R	stxa	%r19, [%r31 + %r0] 0x74
	.word 0xe0c7ce60  ! 201: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r16
	.word 0x87802020  ! 202: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 203: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2aec9e0  ! 204: STBA_R	stba	%r17, [%r27 + %r0] 0x4f
	mov	0x68, %r24
	mov	0x60, %r24
	mov	0x30, %r25
	.word 0xe4c72000  ! 208: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r18
	mov	0x50, %r25
	mov	0x58, %r26
	.word 0x87802074  ! 211: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeca48400  ! 212: STWA_R	stwa	%r22, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 213: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0952000  ! 214: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r16
	.word 0xe0ad6000  ! 215: STBA_I	stba	%r16, [%r21 + 0x0000] %asi
	.word 0x87802073  ! 216: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 217: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0dc2000  ! 218: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r16
	.word 0xe8b74e60  ! 219: STHA_R	stha	%r20, [%r29 + %r0] 0x73
	.word 0xee878e60  ! 220: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r23
	.word 0xe4c78e60  ! 221: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r18
	.word 0xeaa649e0  ! 222: STWA_R	stwa	%r21, [%r25 + %r0] 0x4f
	.word 0xeeb70e40  ! 223: STHA_R	stha	%r23, [%r28 + %r0] 0x72
	.word 0xe6f6c9e0  ! 224: STXA_R	stxa	%r19, [%r27 + %r0] 0x4f
	mov	0x38, %r26
	.word 0xe487ce40  ! 226: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r18
	.word 0xeed4a000  ! 227: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r23
	.word 0xe2844400  ! 228: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe6cd04a0  ! 230: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r19
	.word 0xecb78e40  ! 231: STHA_R	stha	%r22, [%r30 + %r0] 0x72
	.word 0xe0a44400  ! 232: STWA_R	stwa	%r16, [%r17 + %r0] 0x20
	.word 0xe6a40400  ! 233: STWA_R	stwa	%r19, [%r16 + %r0] 0x20
	mov	0x40, %r25
	.word 0xe4f74e40  ! 235: STXA_R	stxa	%r18, [%r29 + %r0] 0x72
	.word 0xe29ce000  ! 236: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r17
	mov	0x70, %r24
	.word 0x87802073  ! 238: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe294a000  ! 239: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r17
	.word 0xe2afce60  ! 240: STBA_R	stba	%r17, [%r31 + %r0] 0x73
	.word 0xeabca000  ! 241: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0xeadc2000  ! 242: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r21
	mov	0x3c8, %r21
	mov	0x40, %r27
	.word 0xeaf42000  ! 245: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	mov	0x7c0, %r22
	.word 0xea84a000  ! 247: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r21
	.word 0xeab46000  ! 248: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xeadce000  ! 249: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r21
	.word 0xecad84a0  ! 250: STBA_R	stba	%r22, [%r22 + %r0] 0x25
	.word 0x8780204f  ! 251: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4f4e000  ! 252: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	.word 0xe4c42000  ! 253: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r18
	.word 0xee9c8400  ! 254: LDDA_R	ldda	[%r18, %r0] 0x20, %r23
	.word 0xeebf4e80  ! 255: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xe494e000  ! 256: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r18
	.word 0xe6d7ce60  ! 257: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r19
	.word 0x8780204f  ! 258: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6d6a000  ! 259: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	.word 0xe6d6a000  ! 260: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	mov	0x3e8, %r20
	mov	0x10, %r24
	.word 0xec9d84a0  ! 263: LDDA_R	ldda	[%r22, %r0] 0x25, %r22
	.word 0xe4a74e60  ! 264: STWA_R	stwa	%r18, [%r29 + %r0] 0x73
	.word 0xe8ce6000  ! 265: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r20
	.word 0xe8cf0e80  ! 266: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r20
	mov	0x30, %r18
	.word 0xe8b544a0  ! 268: STHA_R	stha	%r20, [%r21 + %r0] 0x25
	.word 0xecaee000  ! 269: STBA_I	stba	%r22, [%r27 + 0x0000] %asi
	mov	0x3c8, %r21
	.word 0xec9ee000  ! 271: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r22
	.word 0xec9d44a0  ! 272: LDDA_R	ldda	[%r21, %r0] 0x25, %r22
	.word 0x87802020  ! 273: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4cf4e80  ! 274: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee87a000  ! 276: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r23
	.word 0x87802020  ! 277: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 278: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b5c4a0  ! 279: STHA_R	stha	%r19, [%r23 + %r0] 0x25
	.word 0x87802072  ! 280: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6a7a000  ! 281: STWA_I	stwa	%r19, [%r30 + 0x0000] %asi
	mov	0x68, %r27
	.word 0xe2a4c400  ! 283: STWA_R	stwa	%r17, [%r19 + %r0] 0x20
	.word 0xe8afe000  ! 284: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 285: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x48, %r17
	.word 0xe2f74e40  ! 287: STXA_R	stxa	%r17, [%r29 + %r0] 0x72
	.word 0xeac78e80  ! 288: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r21
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeab42000  ! 290: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x3f0, %r22
	.word 0xe8dc8400  ! 292: LDXA_R	ldxa	[%r18, %r0] 0x20, %r20
	.word 0xe8af8e40  ! 293: STBA_R	stba	%r20, [%r30 + %r0] 0x72
	.word 0xe2a78e40  ! 294: STWA_R	stwa	%r17, [%r30 + %r0] 0x72
	.word 0xe6ad44a0  ! 295: STBA_R	stba	%r19, [%r21 + %r0] 0x25
	mov	0x40, %r27
	mov	0x20, %r17
	mov	0x38, %r27
	.word 0x87802072  ! 299: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x20, %r16
	.word 0xe4f72000  ! 301: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xecf48400  ! 302: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	.word 0xe8afa000  ! 303: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe8cfe000  ! 304: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe2b70e60  ! 305: STHA_R	stha	%r17, [%r28 + %r0] 0x73
	.word 0xe4b649e0  ! 306: STHA_R	stha	%r18, [%r25 + %r0] 0x4f
	.word 0xe6cf2000  ! 307: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0x87802025  ! 308: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe884c400  ! 309: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r20
	.word 0xe8bfa000  ! 310: STDA_I	stda	%r20, [%r30 + 0x0000] %asi
	.word 0xe88fe000  ! 311: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0x87802025  ! 312: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4d7ce40  ! 313: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r18
	.word 0xeeb7a000  ! 314: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	.word 0xead544a0  ! 315: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r21
	mov	0x38, %r25
	mov	0x7f8, %r23
	.word 0xe8f609e0  ! 318: STXA_R	stxa	%r20, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 319: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecace000  ! 320: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xecb42000  ! 321: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 322: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2ce89e0  ! 323: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r17
	.word 0x87802020  ! 324: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r27
	.word 0xe6bea000  ! 326: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	mov	0x58, %r24
	mov	0x7d8, %r22
	.word 0xe4b44400  ! 329: STHA_R	stha	%r18, [%r17 + %r0] 0x20
	.word 0xecafce60  ! 330: STBA_R	stba	%r22, [%r31 + %r0] 0x73
	.word 0xeabee000  ! 331: STDA_I	stda	%r21, [%r27 + 0x0000] %asi
	.word 0xeac62000  ! 332: LDSWA_I	ldswa	[%r24, + 0x0000] %asi, %r21
	.word 0xeebf8e60  ! 333: STDA_R	stda	%r23, [%r30 + %r0] 0x73
	.word 0xee866000  ! 334: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r23
	.word 0xee8c0400  ! 335: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0xe6f62000  ! 336: STXA_I	stxa	%r19, [%r24 + 0x0000] %asi
	.word 0x87802073  ! 337: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x70, %r25
	.word 0x8780204f  ! 339: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe69ea000  ! 340: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r19
	.word 0x87802072  ! 341: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 342: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6bfe000  ! 343: STDA_I	stda	%r19, [%r31 + 0x0000] %asi
	.word 0x87802072  ! 344: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 345: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe29e89e0  ! 346: LDDA_R	ldda	[%r26, %r0] 0x4f, %r17
	.word 0x87802025  ! 347: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8dca000  ! 348: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r20
	.word 0xe8b4a000  ! 349: STHA_I	stha	%r20, [%r18 + 0x0000] %asi
	.word 0xe48f8e40  ! 350: LDUBA_R	lduba	[%r30, %r0] 0x72, %r18
	.word 0x87802020  ! 351: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b46000  ! 352: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0x87802025  ! 353: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xec970e80  ! 354: LDUHA_R	lduha	[%r28, %r0] 0x74, %r22
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x48, %r18
	.word 0x87802025  ! 357: WRASI_I	wr	%r0, 0x0025, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4dcc400  ! 359: LDXA_R	ldxa	[%r19, %r0] 0x20, %r18
	mov	0x50, %r18
	.word 0xeaafa000  ! 361: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xe29f4e40  ! 362: LDDA_R	ldda	[%r29, %r0] 0x72, %r17
	mov	0x28, %r27
	.word 0xeecf6000  ! 364: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 365: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 366: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7c0, %r21
	.word 0x87802073  ! 368: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeec7a000  ! 369: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r23
	.word 0xeacfce40  ! 370: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r21
	.word 0xe0f7e000  ! 371: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe4f504a0  ! 372: STXA_R	stxa	%r18, [%r20 + %r0] 0x25
	.word 0xe0cf6000  ! 373: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0xeabdc4a0  ! 374: STDA_R	stda	%r21, [%r23 + %r0] 0x25
	mov	0x7c0, %r21
	.word 0xecbdc4a0  ! 376: STDA_R	stda	%r22, [%r23 + %r0] 0x25
	mov	0x3e0, %r23
	.word 0x87802025  ! 378: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb6e000  ! 379: STHA_I	stha	%r22, [%r27 + 0x0000] %asi
	.word 0xeca62000  ! 380: STWA_I	stwa	%r22, [%r24 + 0x0000] %asi
	.word 0x87802025  ! 381: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 382: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r27
	.word 0xecc7a000  ! 384: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe2b7ce80  ! 385: STHA_R	stha	%r17, [%r31 + %r0] 0x74
	.word 0xecf6c9e0  ! 386: STXA_R	stxa	%r22, [%r27 + %r0] 0x4f
	.word 0xe0ae89e0  ! 387: STBA_R	stba	%r16, [%r26 + %r0] 0x4f
	.word 0xe8a72000  ! 388: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0xe2dcc400  ! 389: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee9fce80  ! 391: LDDA_R	ldda	[%r31, %r0] 0x74, %r23
	.word 0xeef72000  ! 392: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xeef76000  ! 393: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xecafce60  ! 394: STBA_R	stba	%r22, [%r31 + %r0] 0x73
	.word 0xe0f7e000  ! 395: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 396: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6c44400  ! 397: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r19
	mov	0x7e8, %r23
	.word 0xe48c0400  ! 399: LDUBA_R	lduba	[%r16, %r0] 0x20, %r18
	.word 0xecdf4e60  ! 400: LDXA_R	ldxa	[%r29, %r0] 0x73, %r22
	.word 0x87802020  ! 401: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f6a000  ! 402: STXA_I	stxa	%r20, [%r26 + 0x0000] %asi
	.word 0xe8ae2000  ! 403: STBA_I	stba	%r20, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 404: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bd04a0  ! 405: STDA_R	stda	%r20, [%r20 + %r0] 0x25
	.word 0xe8f48400  ! 406: STXA_R	stxa	%r20, [%r18 + %r0] 0x20
	.word 0xeea74e80  ! 407: STWA_R	stwa	%r23, [%r29 + %r0] 0x74
	.word 0xe0ccc400  ! 408: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	mov	0x30, %r17
	mov	0x3d8, %r20
	.word 0xe6a42000  ! 411: STWA_I	stwa	%r19, [%r16 + 0x0000] %asi
	.word 0x87802025  ! 412: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6c46000  ! 413: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r19
	.word 0x87802072  ! 414: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 415: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecbf4e80  ! 416: STDA_R	stda	%r22, [%r29 + %r0] 0x74
	.word 0xeea7a000  ! 417: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	.word 0xeed72000  ! 418: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xeedfa000  ! 419: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r23
	.word 0xe2978e80  ! 420: LDUHA_R	lduha	[%r30, %r0] 0x74, %r17
	.word 0xe6b7ce60  ! 421: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	.word 0xe8976000  ! 422: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r20
	.word 0xe486c9e0  ! 423: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r18
	.word 0xec972000  ! 424: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r22
	.word 0x87802025  ! 425: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecdda000  ! 426: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r22
	mov	0x48, %r26
	.word 0xe2a74e40  ! 428: STWA_R	stwa	%r17, [%r29 + %r0] 0x72
	.word 0x87802073  ! 429: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 430: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xec9f8e80  ! 431: LDDA_R	ldda	[%r30, %r0] 0x74, %r22
	.word 0xe8afce80  ! 432: STBA_R	stba	%r20, [%r31 + %r0] 0x74
	.word 0x87802020  ! 433: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebfe000  ! 434: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	mov	0x3c0, %r22
	.word 0xeef7e000  ! 436: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0x8780204f  ! 437: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x18, %r18
	.word 0xeebf2000  ! 439: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	mov	0x48, %r24
	.word 0xeebf6000  ! 441: STDA_I	stda	%r23, [%r29 + 0x0000] %asi
	mov	0x30, %r19
	.word 0xeeaf2000  ! 443: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeef76000  ! 444: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeedc4400  ! 445: LDXA_R	ldxa	[%r17, %r0] 0x20, %r23
	.word 0xe6d7a000  ! 446: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 447: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 448: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 449: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6b76000  ! 450: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe6b7ce80  ! 451: STHA_R	stha	%r19, [%r31 + %r0] 0x74
	.word 0x87802020  ! 452: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4ac4400  ! 453: STBA_R	stba	%r18, [%r17 + %r0] 0x20
	.word 0x87802074  ! 454: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea7e000  ! 455: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xee9ec9e0  ! 456: LDDA_R	ldda	[%r27, %r0] 0x4f, %r23
	.word 0x87802025  ! 457: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x10, %r27
	mov	0x7f8, %r21
	.word 0xe0d72000  ! 460: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0xe49f4e60  ! 461: LDDA_R	ldda	[%r29, %r0] 0x73, %r18
	.word 0xe6c7e000  ! 462: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	mov	0x30, %r16
	.word 0xecbec9e0  ! 464: STDA_R	stda	%r22, [%r27 + %r0] 0x4f
	.word 0xeec4c400  ! 465: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r23
	.word 0xe4cf0e40  ! 466: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4f72000  ! 468: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe4c76000  ! 469: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	.word 0xe6b70e40  ! 470: STHA_R	stha	%r19, [%r28 + %r0] 0x72
	.word 0xe8a7e000  ! 471: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xe0ae09e0  ! 472: STBA_R	stba	%r16, [%r24 + %r0] 0x4f
	.word 0xeeafa000  ! 473: STBA_I	stba	%r23, [%r30 + 0x0000] %asi
	mov	0x3d0, %r20
	.word 0x87802074  ! 475: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3e8, %r21
	mov	0x10, %r16
	.word 0xeed5a000  ! 478: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	.word 0xeea52000  ! 479: STWA_I	stwa	%r23, [%r20 + 0x0000] %asi
	.word 0xeadcc400  ! 480: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	mov	0x8, %r17
	.word 0xe0bcc400  ! 482: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	mov	0x40, %r19
	.word 0xea95e000  ! 484: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r21
	.word 0xeabde000  ! 485: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	.word 0xeacde000  ! 486: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0xeaade000  ! 487: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	mov	0x3c8, %r21
	.word 0xeacd2000  ! 489: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r21
	.word 0x87802074  ! 490: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab7e000  ! 491: STHA_I	stha	%r21, [%r31 + 0x0000] %asi
	.word 0xead7a000  ! 492: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	.word 0xe8a48400  ! 493: STWA_R	stwa	%r20, [%r18 + %r0] 0x20
	.word 0xe4f7ce60  ! 494: STXA_R	stxa	%r18, [%r31 + %r0] 0x73
	.word 0xeecfa000  ! 495: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	.word 0xeac74e60  ! 496: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r21
	.word 0xec8f6000  ! 497: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r22
	.word 0xeccfce40  ! 498: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r22
	.word 0xe8c78e60  ! 499: LDSWA_R	ldswa	[%r30, %r0] 0x73, %r20
	mov	0x8, %r17
	.word 0xeaac0400  ! 501: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	mov	0x28, %r27
	.word 0xe69c0400  ! 503: LDDA_R	ldda	[%r16, %r0] 0x20, %r19
	.word 0x87802073  ! 504: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2b44400  ! 505: STHA_R	stha	%r17, [%r17 + %r0] 0x20
	.word 0xe4be89e0  ! 506: STDA_R	stda	%r18, [%r26 + %r0] 0x4f
	.word 0x87802074  ! 507: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeaa4c400  ! 508: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	.word 0xe6976000  ! 509: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r19
	.word 0xe6a76000  ! 510: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	.word 0xe6bfa000  ! 511: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe0f78e60  ! 512: STXA_R	stxa	%r16, [%r30 + %r0] 0x73
	.word 0xe09ec9e0  ! 513: LDDA_R	ldda	[%r27, %r0] 0x4f, %r16
	.word 0xe8a72000  ! 514: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 515: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8f76000  ! 516: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8bc8400  ! 517: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xecd4c400  ! 518: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	.word 0xe0c7e000  ! 519: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0xeedcc400  ! 520: LDXA_R	ldxa	[%r19, %r0] 0x20, %r23
	.word 0xeca72000  ! 521: STWA_I	stwa	%r22, [%r28 + 0x0000] %asi
	.word 0xecd7ce40  ! 522: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r22
	mov	0x3e8, %r21
	.word 0xeab40400  ! 524: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0x87802072  ! 525: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6972000  ! 526: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r19
	.word 0x87802025  ! 527: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6f7a000  ! 528: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xe6cfa000  ! 529: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0xe48c4400  ! 530: LDUBA_R	lduba	[%r17, %r0] 0x20, %r18
	.word 0xecaf4e40  ! 531: STBA_R	stba	%r22, [%r29 + %r0] 0x72
	.word 0xe0cd84a0  ! 532: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r16
	.word 0xead7e000  ! 533: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0xeeb4c400  ! 534: STHA_R	stha	%r23, [%r19 + %r0] 0x20
	.word 0xe49dc4a0  ! 535: LDDA_R	ldda	[%r23, %r0] 0x25, %r18
	.word 0xecafa000  ! 536: STBA_I	stba	%r22, [%r30 + 0x0000] %asi
	.word 0xecc7e000  ! 537: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0xe2940400  ! 538: LDUHA_R	lduha	[%r16, %r0] 0x20, %r17
	.word 0xea978e80  ! 539: LDUHA_R	lduha	[%r30, %r0] 0x74, %r21
	mov	0x7c8, %r21
	.word 0xeade49e0  ! 541: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r21
	.word 0xe29c8400  ! 542: LDDA_R	ldda	[%r18, %r0] 0x20, %r17
	.word 0xe6bfce40  ! 543: STDA_R	stda	%r19, [%r31 + %r0] 0x72
	.word 0xe2f76000  ! 544: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 545: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeea609e0  ! 546: STWA_R	stwa	%r23, [%r24 + %r0] 0x4f
	.word 0xe6cfce60  ! 547: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r19
	.word 0xec878e40  ! 548: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r22
	mov	0x3f8, %r22
	.word 0xe8c5e000  ! 550: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r20
	.word 0xe8f52000  ! 551: STXA_I	stxa	%r20, [%r20 + 0x0000] %asi
	.word 0xe8c544a0  ! 552: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r20
	.word 0xe4de49e0  ! 553: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r18
	.word 0xe8dde000  ! 554: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r20
	.word 0xeadcc400  ! 555: LDXA_R	ldxa	[%r19, %r0] 0x20, %r21
	.word 0xea952000  ! 556: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r21
	.word 0xeaa56000  ! 557: STWA_I	stwa	%r21, [%r21 + 0x0000] %asi
	.word 0x87802025  ! 558: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb6c9e0  ! 559: STHA_R	stha	%r22, [%r27 + %r0] 0x4f
	mov	0x68, %r24
	.word 0xea97ce60  ! 561: LDUHA_R	lduha	[%r31, %r0] 0x73, %r21
	.word 0xe68da000  ! 562: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 563: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 564: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe687e000  ! 565: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	.word 0xe68f6000  ! 566: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r19
	.word 0xe6df0e40  ! 567: LDXA_R	ldxa	[%r28, %r0] 0x72, %r19
	.word 0xe8f7e000  ! 568: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0xe8f7a000  ! 569: STXA_I	stxa	%r20, [%r30 + 0x0000] %asi
	mov	0x58, %r17
	.word 0xe0a74e80  ! 571: STWA_R	stwa	%r16, [%r29 + %r0] 0x74
	.word 0xe2ad44a0  ! 572: STBA_R	stba	%r17, [%r21 + %r0] 0x25
	mov	0x18, %r17
	.word 0x87802074  ! 574: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe887ce40  ! 575: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r20
	.word 0xec9f0e80  ! 576: LDDA_R	ldda	[%r28, %r0] 0x74, %r22
	.word 0xe497e000  ! 577: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	mov	0x10, %r24
	.word 0xecb7ce80  ! 579: STHA_R	stha	%r22, [%r31 + %r0] 0x74
	.word 0xe6b76000  ! 580: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	mov	0x28, %r18
	.word 0xec978e40  ! 582: LDUHA_R	lduha	[%r30, %r0] 0x72, %r22
	.word 0x87802074  ! 583: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeabf8e40  ! 584: STDA_R	stda	%r21, [%r30 + %r0] 0x72
	.word 0xee9fce60  ! 585: LDDA_R	ldda	[%r31, %r0] 0x73, %r23
	.word 0xeeaf0e60  ! 586: STBA_R	stba	%r23, [%r28 + %r0] 0x73
	.word 0xeaa5a000  ! 587: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	mov	0x48, %r25
	mov	0x40, %r17
	.word 0xea9da000  ! 590: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	mov	0x58, %r25
	mov	0x10, %r26
	.word 0xea9da000  ! 593: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	.word 0xe6be89e0  ! 594: STDA_R	stda	%r19, [%r26 + %r0] 0x4f
	.word 0xe2bcc400  ! 595: STDA_R	stda	%r17, [%r19 + %r0] 0x20
	.word 0x87802074  ! 596: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 597: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeb7ce80  ! 598: STHA_R	stha	%r23, [%r31 + %r0] 0x74
	.word 0x87802073  ! 599: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8b7ce80  ! 600: STHA_R	stha	%r20, [%r31 + %r0] 0x74
	mov	0x70, %r16
	.word 0xea9e2000  ! 602: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r21
	.word 0xea86a000  ! 603: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r21
	.word 0xeaae2000  ! 604: STBA_I	stba	%r21, [%r24 + 0x0000] %asi
	.word 0x87802072  ! 605: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab6e000  ! 606: STHA_I	stha	%r21, [%r27 + 0x0000] %asi
	.word 0xea86e000  ! 607: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r21
	.word 0xeaf584a0  ! 608: STXA_R	stxa	%r21, [%r22 + %r0] 0x25
	.word 0x8780204f  ! 609: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8ae89e0  ! 610: STBA_R	stba	%r20, [%r26 + %r0] 0x4f
	mov	0x30, %r27
	.word 0xe8aca000  ! 612: STBA_I	stba	%r20, [%r18 + 0x0000] %asi
	.word 0x87802072  ! 613: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeca7ce40  ! 614: STWA_R	stwa	%r22, [%r31 + %r0] 0x72
	.word 0x87802020  ! 615: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 616: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaa6c9e0  ! 617: STWA_R	stwa	%r21, [%r27 + %r0] 0x4f
	mov	0x28, %r19
	.word 0xeedec9e0  ! 619: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r23
	mov	0x3e0, %r22
	mov	0x7f0, %r20
	.word 0xe2c6a000  ! 622: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r17
	.word 0xe2b6a000  ! 623: STHA_I	stha	%r17, [%r26 + 0x0000] %asi
	.word 0xe2b6e000  ! 624: STHA_I	stha	%r17, [%r27 + 0x0000] %asi
	.word 0x8780204f  ! 625: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2972000  ! 626: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a7a000  ! 627: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0xeef78e40  ! 628: STXA_R	stxa	%r23, [%r30 + %r0] 0x72
	.word 0xe487a000  ! 629: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	mov	0x7d8, %r23
	.word 0xe4a78e40  ! 631: STWA_R	stwa	%r18, [%r30 + %r0] 0x72
	.word 0xe6b72000  ! 632: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xe2cf4e80  ! 633: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r17
	.word 0xe2f76000  ! 634: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	mov	0x20, %r17
	mov	0x40, %r27
	.word 0xe4bfce60  ! 637: STDA_R	stda	%r18, [%r31 + %r0] 0x73
	mov	0x20, %r26
	.word 0x87802073  ! 639: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x70, %r17
	.word 0xeeafe000  ! 641: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 642: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecf48400  ! 643: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	mov	0x28, %r26
	.word 0xe0de89e0  ! 645: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r16
	mov	0x30, %r26
	.word 0xe0952000  ! 647: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r16
	.word 0xe0cda000  ! 648: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r16
	.word 0xe0bde000  ! 649: STDA_I	stda	%r16, [%r23 + 0x0000] %asi
	.word 0xe085a000  ! 650: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r16
	.word 0xe0ad6000  ! 651: STBA_I	stba	%r16, [%r21 + 0x0000] %asi
	.word 0x87802025  ! 652: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x18, %r24
	.word 0xe0f5e000  ! 654: STXA_I	stxa	%r16, [%r23 + 0x0000] %asi
	.word 0xe0f52000  ! 655: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0f52000  ! 656: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0b52000  ! 657: STHA_I	stha	%r16, [%r20 + 0x0000] %asi
	.word 0xeaa78e40  ! 658: STWA_R	stwa	%r21, [%r30 + %r0] 0x72
	.word 0xeacde000  ! 659: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0xe6acc400  ! 660: STBA_R	stba	%r19, [%r19 + %r0] 0x20
	.word 0xeaa5e000  ! 661: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeaade000  ! 662: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	.word 0xeab56000  ! 663: STHA_I	stha	%r21, [%r21 + 0x0000] %asi
	mov	0x40, %r26
	.word 0xe0ac8400  ! 665: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	mov	0x68, %r27
	.word 0xe8c584a0  ! 667: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r20
	.word 0xe49fce60  ! 668: LDDA_R	ldda	[%r31, %r0] 0x73, %r18
	.word 0xeab56000  ! 669: STHA_I	stha	%r21, [%r21 + 0x0000] %asi
	.word 0x8780204f  ! 670: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab4a000  ! 671: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	.word 0xeeb7ce40  ! 672: STHA_R	stha	%r23, [%r31 + %r0] 0x72
	.word 0xe4f4e000  ! 673: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	.word 0xe48c2000  ! 674: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r18
	.word 0x87802074  ! 675: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3d8, %r20
	.word 0xe4de2000  ! 677: LDXA_I	ldxa	[%r24, + 0x0000] %asi, %r18
	mov	0x3d0, %r22
	.word 0x87802074  ! 679: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 680: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f7ce60  ! 681: STXA_R	stxa	%r20, [%r31 + %r0] 0x73
	mov	0x40, %r16
	mov	0x7e8, %r22
	mov	0x3e8, %r21
	mov	0x40, %r17
	.word 0xe89f4e40  ! 686: LDDA_R	ldda	[%r29, %r0] 0x72, %r20
	.word 0x87802020  ! 687: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f74e80  ! 688: STXA_R	stxa	%r20, [%r29 + %r0] 0x74
	.word 0xe6f72000  ! 689: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xeab40400  ! 690: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0xe6cc0400  ! 691: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r19
	.word 0xe0c609e0  ! 692: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r16
	.word 0xeaacc400  ! 693: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	.word 0xee976000  ! 694: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	.word 0xeed7a000  ! 695: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802073  ! 696: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 697: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6f4c400  ! 698: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	.word 0xe28e49e0  ! 699: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r17
	.word 0x87802074  ! 700: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3c8, %r20
	.word 0xeaf74e40  ! 702: STXA_R	stxa	%r21, [%r29 + %r0] 0x72
	mov	0x78, %r26
	.word 0xe4b7ce80  ! 704: STHA_R	stha	%r18, [%r31 + %r0] 0x74
	.word 0x87802020  ! 705: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b7e000  ! 706: STHA_I	stha	%r19, [%r31 + 0x0000] %asi
	mov	0x28, %r17
	.word 0x87802020  ! 708: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8970e60  ! 709: LDUHA_R	lduha	[%r28, %r0] 0x73, %r20
	.word 0x87802072  ! 710: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe88ce000  ! 711: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xe2af8e80  ! 712: STBA_R	stba	%r17, [%r30 + %r0] 0x74
	.word 0xe8bca000  ! 713: STDA_I	stda	%r20, [%r18 + 0x0000] %asi
	mov	0x0, %r24
	.word 0xe28d04a0  ! 715: LDUBA_R	lduba	[%r20, %r0] 0x25, %r17
	.word 0xeeb40400  ! 716: STHA_R	stha	%r23, [%r16 + %r0] 0x20
	.word 0xe6b44400  ! 717: STHA_R	stha	%r19, [%r17 + %r0] 0x20
	mov	0x20, %r26
	.word 0xe0cca000  ! 719: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r16
	.word 0xe0a42000  ! 720: STWA_I	stwa	%r16, [%r16 + 0x0000] %asi
	mov	0x38, %r17
	mov	0x7f8, %r22
	mov	0x78, %r17
	.word 0xeeac0400  ! 724: STBA_R	stba	%r23, [%r16 + %r0] 0x20
	mov	0x3c8, %r21
	.word 0xeaf4a000  ! 726: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0xe08e89e0  ! 727: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r16
	mov	0x60, %r27
	.word 0xee84c400  ! 729: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r23
	.word 0xe884e000  ! 730: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r20
	.word 0xe8bce000  ! 731: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xe68dc4a0  ! 732: LDUBA_R	lduba	[%r23, %r0] 0x25, %r19
	.word 0xe09d84a0  ! 733: LDDA_R	ldda	[%r22, %r0] 0x25, %r16
	.word 0xeadf8e80  ! 734: LDXA_R	ldxa	[%r30, %r0] 0x74, %r21
	.word 0xe8dce000  ! 735: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r20
	mov	0x68, %r16
	mov	0x48, %r17
	.word 0xe894a000  ! 738: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8f4e000  ! 739: STXA_I	stxa	%r20, [%r19 + 0x0000] %asi
	mov	0x68, %r18
	.word 0xe8cd04a0  ! 741: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r20
	.word 0xeea42000  ! 742: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0xeca4c400  ! 743: STWA_R	stwa	%r22, [%r19 + %r0] 0x20
	mov	0x60, %r25
	.word 0x87802025  ! 745: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0bce000  ! 746: STDA_I	stda	%r16, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 747: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bca000  ! 748: STDA_I	stda	%r16, [%r18 + 0x0000] %asi
	.word 0xe0b40400  ! 749: STHA_R	stha	%r16, [%r16 + %r0] 0x20
	mov	0x10, %r27
	.word 0xe68e09e0  ! 751: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r19
	mov	0x38, %r17
	.word 0xe69c6000  ! 753: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r19
	.word 0xe4b6c9e0  ! 754: STHA_R	stha	%r18, [%r27 + %r0] 0x4f
	.word 0xecb4e000  ! 755: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	mov	0x68, %r25
	.word 0xe4844400  ! 757: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r18
	mov	0x7e8, %r21
	.word 0xeca4e000  ! 759: STWA_I	stwa	%r22, [%r19 + 0x0000] %asi
	.word 0xecf74e60  ! 760: STXA_R	stxa	%r22, [%r29 + %r0] 0x73
	.word 0x87802073  ! 761: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6bf8e60  ! 762: STDA_R	stda	%r19, [%r30 + %r0] 0x73
	.word 0xe4a7ce60  ! 763: STWA_R	stwa	%r18, [%r31 + %r0] 0x73
	mov	0x70, %r27
	.word 0x87802074  ! 765: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4afa000  ! 766: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	mov	0x10, %r25
	.word 0xe4af6000  ! 768: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0xeab48400  ! 769: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xe68fce60  ! 770: LDUBA_R	lduba	[%r31, %r0] 0x73, %r19
	.word 0x87802072  ! 771: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeccfe000  ! 772: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r22
	.word 0xecbfa000  ! 773: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xeabf0e40  ! 774: STDA_R	stda	%r21, [%r28 + %r0] 0x72
	.word 0xeef6c9e0  ! 775: STXA_R	stxa	%r23, [%r27 + %r0] 0x4f
	.word 0x87802072  ! 776: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4df8e80  ! 777: LDXA_R	ldxa	[%r30, %r0] 0x74, %r18
	mov	0x3d8, %r20
	mov	0x30, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802025  ! 781: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3e8, %r22
	.word 0xeca6c9e0  ! 783: STWA_R	stwa	%r22, [%r27 + %r0] 0x4f
	mov	0x7f0, %r20
	mov	0x38, %r25
	mov	0x28, %r27
	mov	0x3f8, %r20
	.word 0x8780204f  ! 788: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe687e000  ! 789: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	mov	0x30, %r18
	.word 0xe6df6000  ! 791: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r19
	.word 0xe6cfa000  ! 792: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	mov	0x70, %r26
	mov	0x0, %r16
	.word 0xecbd44a0  ! 795: STDA_R	stda	%r22, [%r21 + %r0] 0x25
	.word 0xeef74e80  ! 796: STXA_R	stxa	%r23, [%r29 + %r0] 0x74
	.word 0xeef72000  ! 797: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xee9fa000  ! 798: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	mov	0x3d0, %r22
	.word 0xeedfe000  ! 800: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x7e0, %r20
	mov	0x70, %r24
	mov	0x7d0, %r23
	.word 0xe2ae49e0  ! 804: STBA_R	stba	%r17, [%r25 + %r0] 0x4f
	mov	0x78, %r25
	.word 0xecf7e000  ! 806: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xecc584a0  ! 807: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r22
	mov	0x40, %r26
	.word 0xe8df8e60  ! 809: LDXA_R	ldxa	[%r30, %r0] 0x73, %r20
	.word 0xe0bf2000  ! 810: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	.word 0xe0b7e000  ! 811: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xeecc0400  ! 812: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r23
	mov	0x10, %r24
	mov	0x30, %r18
	.word 0xe8ddc4a0  ! 815: LDXA_R	ldxa	[%r23, %r0] 0x25, %r20
	.word 0xe8af0e40  ! 816: STBA_R	stba	%r20, [%r28 + %r0] 0x72
	.word 0xe2c7a000  ! 817: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0x87802025  ! 818: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 819: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4b74e80  ! 820: STHA_R	stha	%r18, [%r29 + %r0] 0x74
	.word 0xeead6000  ! 821: STBA_I	stba	%r23, [%r21 + 0x0000] %asi
	.word 0xee9da000  ! 822: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r23
	.word 0xe29f4e60  ! 823: LDDA_R	ldda	[%r29, %r0] 0x73, %r17
	mov	0x8, %r19
	.word 0x87802020  ! 825: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 826: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 827: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 828: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecb78e40  ! 829: STHA_R	stha	%r22, [%r30 + %r0] 0x72
	mov	0x38, %r17
	.word 0xe6ac0400  ! 831: STBA_R	stba	%r19, [%r16 + %r0] 0x20
	.word 0xe8c4e000  ! 832: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r20
	.word 0xec8f8e60  ! 833: LDUBA_R	lduba	[%r30, %r0] 0x73, %r22
	.word 0xead4a000  ! 834: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xe69c8400  ! 835: LDDA_R	ldda	[%r18, %r0] 0x20, %r19
	.word 0xeabc2000  ! 836: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xe6ccc400  ! 837: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r19
	.word 0xe0cca000  ! 838: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r16
	.word 0x87802025  ! 839: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0a62000  ! 840: STWA_I	stwa	%r16, [%r24 + 0x0000] %asi
	.word 0x87802074  ! 841: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe09ce000  ! 842: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r16
	mov	0x70, %r16
	mov	0x78, %r24
	mov	0x18, %r24
	mov	0x28, %r25
	mov	0x7c8, %r22
	mov	0x60, %r19
	.word 0xe0c42000  ! 849: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r16
	.word 0x87802020  ! 850: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x20, %r26
	mov	0x68, %r25
	.word 0xe0cf6000  ! 853: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0x87802073  ! 854: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x0, %r27
	.word 0xecc5c4a0  ! 856: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r22
	mov	0x8, %r24
	.word 0x87802074  ! 858: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x8780204f  ! 859: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 860: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecbf6000  ! 861: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	.word 0xe4f70e60  ! 862: STXA_R	stxa	%r18, [%r28 + %r0] 0x73
	mov	0x40, %r17
	.word 0xeeb72000  ! 864: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xee9fe000  ! 865: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	mov	0x3c0, %r21
	.word 0xe0b48400  ! 867: STHA_R	stha	%r16, [%r18 + %r0] 0x20
	mov	0x10, %r25
	.word 0xe6f7e000  ! 869: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6c76000  ! 870: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 871: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe697e000  ! 872: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	.word 0xe2ac4400  ! 873: STBA_R	stba	%r17, [%r17 + %r0] 0x20
	mov	0x18, %r16
	.word 0x87802072  ! 875: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeed78e80  ! 876: LDSHA_R	ldsha	[%r30, %r0] 0x74, %r23
	.word 0x87802025  ! 877: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecf74e60  ! 878: STXA_R	stxa	%r22, [%r29 + %r0] 0x73
	.word 0xea96c9e0  ! 879: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r21
	.word 0xee8d44a0  ! 880: LDUBA_R	lduba	[%r21, %r0] 0x25, %r23
	.word 0xe4a48400  ! 881: STWA_R	stwa	%r18, [%r18 + %r0] 0x20
	.word 0xea944400  ! 882: LDUHA_R	lduha	[%r17, %r0] 0x20, %r21
	.word 0x87802020  ! 883: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d7a000  ! 884: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r17
	.word 0xe09689e0  ! 885: LDUHA_R	lduha	[%r26, %r0] 0x4f, %r16
	.word 0xe4f72000  ! 886: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe6be09e0  ! 887: STDA_R	stda	%r19, [%r24 + %r0] 0x4f
	.word 0xe2be49e0  ! 888: STDA_R	stda	%r17, [%r25 + %r0] 0x4f
	.word 0xe2c649e0  ! 889: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r17
	.word 0xe08cc400  ! 890: LDUBA_R	lduba	[%r19, %r0] 0x20, %r16
	.word 0xe29fa000  ! 891: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r17
	.word 0xeadc4400  ! 892: LDXA_R	ldxa	[%r17, %r0] 0x20, %r21
	.word 0xee97a000  ! 893: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r23
	.word 0xe08e49e0  ! 894: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r16
	.word 0xee9d04a0  ! 895: LDDA_R	ldda	[%r20, %r0] 0x25, %r23
	.word 0xe29f8e40  ! 896: LDDA_R	ldda	[%r30, %r0] 0x72, %r17
	.word 0xeecf2000  ! 897: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0xeea6c9e0  ! 898: STWA_R	stwa	%r23, [%r27 + %r0] 0x4f
	.word 0xeef72000  ! 899: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xe6a70e60  ! 900: STWA_R	stwa	%r19, [%r28 + %r0] 0x73
	.word 0x87802020  ! 901: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3c0, %r20
	.word 0x87802020  ! 903: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 904: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x40, %r19
	mov	0x3c8, %r22
	mov	0x30, %r16
	mov	0x8, %r16
	.word 0xe2cf4e60  ! 909: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r17
	.word 0x87802072  ! 910: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecb42000  ! 911: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	.word 0xeac4c400  ! 912: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r21
	.word 0xee8f8e80  ! 913: LDUBA_R	lduba	[%r30, %r0] 0x74, %r23
	.word 0xecf609e0  ! 914: STXA_R	stxa	%r22, [%r24 + %r0] 0x4f
	.word 0xe2f46000  ! 915: STXA_I	stxa	%r17, [%r17 + 0x0000] %asi
	.word 0xe2bce000  ! 916: STDA_I	stda	%r17, [%r19 + 0x0000] %asi
	mov	0x30, %r19
	.word 0xeaac0400  ! 918: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	mov	0x7f0, %r23
	.word 0xe2a689e0  ! 920: STWA_R	stwa	%r17, [%r26 + %r0] 0x4f
	.word 0xeeb7ce40  ! 921: STHA_R	stha	%r23, [%r31 + %r0] 0x72
	.word 0xe6b6c9e0  ! 922: STHA_R	stha	%r19, [%r27 + %r0] 0x4f
	.word 0xeabf4e60  ! 923: STDA_R	stda	%r21, [%r29 + %r0] 0x73
	.word 0xe2f48400  ! 924: STXA_R	stxa	%r17, [%r18 + %r0] 0x20
	.word 0xe49fce60  ! 925: LDDA_R	ldda	[%r31, %r0] 0x73, %r18
	mov	0x68, %r26
	.word 0xeca46000  ! 927: STWA_I	stwa	%r22, [%r17 + 0x0000] %asi
	.word 0xeccc2000  ! 928: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r22
	.word 0xe6f609e0  ! 929: STXA_R	stxa	%r19, [%r24 + %r0] 0x4f
	mov	0x7c8, %r20
	.word 0xe2b4a000  ! 931: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	mov	0x30, %r17
	.word 0xeaa40400  ! 933: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0xe2cf0e60  ! 934: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r17
	.word 0xe2d42000  ! 935: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r17
	.word 0xe284e000  ! 936: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r17
	.word 0xec874e80  ! 937: LDUWA_R	lduwa	[%r29, %r0] 0x74, %r22
	.word 0xe6bc6000  ! 938: STDA_I	stda	%r19, [%r17 + 0x0000] %asi
	.word 0xe6b4a000  ! 939: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	mov	0x70, %r19
	mov	0x7d8, %r23
	.word 0xe6dca000  ! 942: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r19
	mov	0x70, %r24
	mov	0x70, %r19
	mov	0x50, %r17
	.word 0xe6b46000  ! 946: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0xe694a000  ! 947: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r19
	.word 0x87802072  ! 948: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09c4400  ! 949: LDDA_R	ldda	[%r17, %r0] 0x20, %r16
	mov	0x3e0, %r22
	.word 0xeed649e0  ! 951: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r23
	.word 0xe2d7e000  ! 952: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
	.word 0xe4c78e80  ! 953: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r18
	.word 0xe4afe000  ! 954: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xe497a000  ! 955: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r18
	mov	0x7e8, %r21
	mov	0x3f0, %r22
	.word 0xe6c609e0  ! 958: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r19
	.word 0xea9fa000  ! 959: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r21
	.word 0xeadfe000  ! 960: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0xead76000  ! 961: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xeaaf2000  ! 962: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	.word 0xe2870e60  ! 963: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r17
	mov	0x38, %r18
	.word 0xe4bf8e40  ! 965: STDA_R	stda	%r18, [%r30 + %r0] 0x72
	mov	0x48, %r17
	.word 0xe2cf0e80  ! 967: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r17
	.word 0x87802025  ! 968: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeed7ce60  ! 969: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r23
	mov	0x7d8, %r22
	.word 0x87802020  ! 971: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x60, %r26
	mov	0x60, %r19
	.word 0xe28fce40  ! 974: LDUBA_R	lduba	[%r31, %r0] 0x72, %r17
	mov	0x8, %r16
	.word 0xea976000  ! 976: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xeaa7a000  ! 977: STWA_I	stwa	%r21, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 978: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 979: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeab4a000  ! 980: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	mov	0x70, %r16
	mov	0x8, %r19
	.word 0xeaaca000  ! 983: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	mov	0x18, %r25
	.word 0xead46000  ! 986: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xeab42000  ! 987: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x58, %r24
	.word 0xeac46000  ! 989: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r21
	.word 0xea8c6000  ! 990: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0x87802072  ! 991: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x10, %r27
	.word 0xeaaee000  ! 993: STBA_I	stba	%r21, [%r27 + 0x0000] %asi
	.word 0x87802072  ! 994: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeac52000  ! 995: LDSWA_I	ldswa	[%r20, + 0x0000] %asi, %r21
	mov	0x7e0, %r23
	.word 0xeca689e0  ! 997: STWA_R	stwa	%r22, [%r26 + %r0] 0x4f
	.word 0xe2a609e0  ! 998: STWA_R	stwa	%r17, [%r24 + %r0] 0x4f
	mov	0x3d8, %r21
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	mov	0x7d0, %r23
	.word 0xe6a70e40  ! 2: STWA_R	stwa	%r19, [%r28 + %r0] 0x72
	.word 0xecf4a000  ! 3: STXA_I	stxa	%r22, [%r18 + 0x0000] %asi
	.word 0xeca4e000  ! 4: STWA_I	stwa	%r22, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 5: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c7ce40  ! 6: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r18
	.word 0xee8ea000  ! 7: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r23
	mov	0x7e0, %r23
	.word 0x8780204f  ! 9: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x60, %r18
	.word 0xe2a7ce80  ! 11: STWA_R	stwa	%r17, [%r31 + %r0] 0x74
	mov	0x40, %r19
	.word 0xe8b7e000  ! 13: STHA_I	stha	%r20, [%r31 + 0x0000] %asi
	.word 0xe8f72000  ! 14: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe2a70e40  ! 15: STWA_R	stwa	%r17, [%r28 + %r0] 0x72
	.word 0xec96c9e0  ! 16: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r22
	.word 0xe6dc4400  ! 17: LDXA_R	ldxa	[%r17, %r0] 0x20, %r19
	.word 0xe6b74e40  ! 18: STHA_R	stha	%r19, [%r29 + %r0] 0x72
	.word 0xe2af0e80  ! 19: STBA_R	stba	%r17, [%r28 + %r0] 0x74
	.word 0xe2afa000  ! 20: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe2a76000  ! 21: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe0f44400  ! 22: STXA_R	stxa	%r16, [%r17 + %r0] 0x20
	.word 0xe8bf0e80  ! 23: STDA_R	stda	%r20, [%r28 + %r0] 0x74
	.word 0xe294c400  ! 24: LDUHA_R	lduha	[%r19, %r0] 0x20, %r17
	.word 0x87802020  ! 25: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 26: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x8, %r27
	.word 0xe4b70e60  ! 28: STHA_R	stha	%r18, [%r28 + %r0] 0x73
	.word 0xe8b56000  ! 29: STHA_I	stha	%r20, [%r21 + 0x0000] %asi
	mov	0x7e0, %r20
	.word 0xe895e000  ! 31: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r20
	.word 0xe8bda000  ! 32: STDA_I	stda	%r20, [%r22 + 0x0000] %asi
	.word 0xe8c56000  ! 33: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r20
	.word 0x87802020  ! 34: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 35: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe887ce60  ! 36: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r20
	.word 0xee976000  ! 37: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	mov	0x18, %r26
	.word 0xeed76000  ! 39: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xe6a4c400  ! 40: STWA_R	stwa	%r19, [%r19 + %r0] 0x20
	mov	0x10, %r16
	mov	0x60, %r18
	.word 0xe0972000  ! 43: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r16
	mov	0x78, %r26
	mov	0x10, %r16
	.word 0xe0f76000  ! 46: STXA_I	stxa	%r16, [%r29 + 0x0000] %asi
	.word 0xe0876000  ! 47: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r16
	.word 0xe09f6000  ! 48: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r16
	.word 0xe0afa000  ! 49: STBA_I	stba	%r16, [%r30 + 0x0000] %asi
	mov	0x0, %r26
	mov	0x68, %r24
	.word 0xe4afce60  ! 52: STBA_R	stba	%r18, [%r31 + %r0] 0x73
	.word 0xead76000  ! 53: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xea976000  ! 54: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r21
	.word 0xeabf2000  ! 55: STDA_I	stda	%r21, [%r28 + 0x0000] %asi
	.word 0xea978e40  ! 56: LDUHA_R	lduha	[%r30, %r0] 0x72, %r21
	.word 0xe8a76000  ! 57: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8f72000  ! 58: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f72000  ! 59: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8cfa000  ! 60: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	mov	0x8, %r18
	.word 0xe2ac8400  ! 62: STBA_R	stba	%r17, [%r18 + %r0] 0x20
	.word 0xe6ad04a0  ! 63: STBA_R	stba	%r19, [%r20 + %r0] 0x25
	.word 0xee8f2000  ! 64: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r23
	.word 0xe2970e80  ! 65: LDUHA_R	lduha	[%r28, %r0] 0x74, %r17
	mov	0x3f8, %r20
	.word 0xeedf6000  ! 67: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	mov	0x0, %r19
	.word 0xeef7a000  ! 69: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	mov	0x48, %r27
	.word 0xeef72000  ! 71: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x7d0, %r22
	.word 0xeeaf6000  ! 73: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0xeef76000  ! 74: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeed7e000  ! 75: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0x87802020  ! 76: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 77: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeea46000  ! 78: STWA_I	stwa	%r23, [%r17 + 0x0000] %asi
	mov	0x68, %r27
	.word 0xeeafce60  ! 80: STBA_R	stba	%r23, [%r31 + %r0] 0x73
	.word 0x87802072  ! 81: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4f5e000  ! 82: STXA_I	stxa	%r18, [%r23 + 0x0000] %asi
	.word 0xe2be89e0  ! 83: STDA_R	stda	%r17, [%r26 + %r0] 0x4f
	.word 0xeaad2000  ! 84: STBA_I	stba	%r21, [%r20 + 0x0000] %asi
	.word 0xeaa5e000  ! 85: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeeb74e60  ! 86: STHA_R	stha	%r23, [%r29 + %r0] 0x73
	mov	0x7c0, %r21
	.word 0xe6c7ce60  ! 88: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r19
	.word 0x8780204f  ! 89: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4be6000  ! 90: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	.word 0x87802020  ! 91: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 92: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x10, %r17
	.word 0xe0a44400  ! 94: STWA_R	stwa	%r16, [%r17 + %r0] 0x20
	mov	0x3e8, %r22
	.word 0x87802025  ! 96: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecbf6000  ! 97: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	mov	0x18, %r17
	.word 0x87802074  ! 99: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecdd2000  ! 100: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r22
	.word 0xeccde000  ! 101: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r22
	.word 0xecf70e60  ! 102: STXA_R	stxa	%r22, [%r28 + %r0] 0x73
	.word 0x87802025  ! 103: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeeafe000  ! 104: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0xe2b7ce60  ! 105: STHA_R	stha	%r17, [%r31 + %r0] 0x73
	.word 0xe6f649e0  ! 106: STXA_R	stxa	%r19, [%r25 + %r0] 0x4f
	.word 0xe4c7a000  ! 107: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 108: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4c7e000  ! 109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	mov	0x30, %r17
	.word 0xe4872000  ! 111: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	.word 0x87802025  ! 112: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4dde000  ! 113: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r18
	mov	0x3e0, %r20
	mov	0x20, %r17
	.word 0xe4d56000  ! 116: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r18
	mov	0x58, %r25
	.word 0x87802074  ! 118: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4a78e40  ! 119: STWA_R	stwa	%r18, [%r30 + %r0] 0x72
	.word 0xe4c70e60  ! 120: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r18
	.word 0xe4acc400  ! 121: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xeaa72000  ! 122: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	.word 0xeaa7e000  ! 123: STWA_I	stwa	%r21, [%r31 + 0x0000] %asi
	mov	0x58, %r17
	.word 0xe0f649e0  ! 125: STXA_R	stxa	%r16, [%r25 + %r0] 0x4f
	mov	0x58, %r27
	.word 0xe6a6c9e0  ! 127: STWA_R	stwa	%r19, [%r27 + %r0] 0x4f
	.word 0xe297e000  ! 128: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0xe2f72000  ! 129: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2a76000  ! 131: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe2d72000  ! 132: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2bfe000  ! 133: STDA_I	stda	%r17, [%r31 + 0x0000] %asi
	.word 0xecd78e60  ! 134: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r22
	mov	0x18, %r17
	.word 0xee8609e0  ! 136: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r23
	mov	0x50, %r26
	.word 0xe48f2000  ! 138: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r18
	.word 0x87802020  ! 139: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab48400  ! 140: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xecdec9e0  ! 141: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r22
	.word 0xe68ea000  ! 142: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 143: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x78, %r25
	.word 0xe6ce2000  ! 145: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe6d66000  ! 146: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r19
	.word 0xe0d504a0  ! 147: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r16
	.word 0xe6cea000  ! 148: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r19
	.word 0xe6d62000  ! 149: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a6a000  ! 150: STWA_I	stwa	%r19, [%r26 + 0x0000] %asi
	.word 0xe6ce6000  ! 151: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r19
	.word 0xe6a66000  ! 152: STWA_I	stwa	%r19, [%r25 + 0x0000] %asi
	.word 0x8780204f  ! 153: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b62000  ! 154: STHA_I	stha	%r19, [%r24 + 0x0000] %asi
	.word 0x87802025  ! 155: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6cca000  ! 156: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r19
	.word 0x87802020  ! 157: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b78e60  ! 158: STHA_R	stha	%r17, [%r30 + %r0] 0x73
	.word 0xe6c5c4a0  ! 159: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r19
	.word 0x87802020  ! 160: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x18, %r16
	mov	0x8, %r18
	.word 0xe68f0e40  ! 163: LDUBA_R	lduba	[%r28, %r0] 0x72, %r19
	.word 0xe0d7ce80  ! 164: LDSHA_R	ldsha	[%r31, %r0] 0x74, %r16
	.word 0xe8bf2000  ! 165: STDA_I	stda	%r20, [%r28 + 0x0000] %asi
	mov	0x8, %r18
	.word 0xe8c7a000  ! 167: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r20
	.word 0x87802025  ! 168: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0978e80  ! 169: LDUHA_R	lduha	[%r30, %r0] 0x74, %r16
	mov	0x58, %r17
	.word 0xee940400  ! 171: LDUHA_R	lduha	[%r16, %r0] 0x20, %r23
	mov	0x28, %r19
	mov	0x70, %r27
	.word 0xeacdc4a0  ! 174: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r21
	.word 0xe4974e80  ! 175: LDUHA_R	lduha	[%r29, %r0] 0x74, %r18
	.word 0xe0b5a000  ! 176: STHA_I	stha	%r16, [%r22 + 0x0000] %asi
	.word 0xe0b504a0  ! 177: STHA_R	stha	%r16, [%r20 + %r0] 0x25
	.word 0xe8a5a000  ! 178: STWA_I	stwa	%r20, [%r22 + 0x0000] %asi
	.word 0xe0be89e0  ! 179: STDA_R	stda	%r16, [%r26 + %r0] 0x4f
	mov	0x20, %r18
	mov	0x68, %r17
	mov	0x28, %r18
	.word 0xe8d48400  ! 183: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r20
	.word 0xea970e80  ! 184: LDUHA_R	lduha	[%r28, %r0] 0x74, %r21
	.word 0xe6d689e0  ! 185: LDSHA_R	ldsha	[%r26, %r0] 0x4f, %r19
	.word 0xe28da000  ! 186: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r17
	.word 0xe2bd6000  ! 187: STDA_I	stda	%r17, [%r21 + 0x0000] %asi
	.word 0x87802074  ! 188: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802072  ! 189: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe28e6000  ! 190: LDUBA_I	lduba	[%r25, + 0x0000] %asi, %r17
	mov	0x7f8, %r20
	.word 0x8780204f  ! 192: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeac48400  ! 193: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r21
	.word 0xecdc6000  ! 194: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r22
	.word 0x87802025  ! 195: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecc7e000  ! 196: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0xeeaf8e40  ! 197: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	mov	0x70, %r18
	.word 0xecac8400  ! 199: STBA_R	stba	%r22, [%r18 + %r0] 0x20
	.word 0xe4f6c9e0  ! 200: STXA_R	stxa	%r18, [%r27 + %r0] 0x4f
	.word 0xe2c44400  ! 201: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r17
	.word 0x87802020  ! 202: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 203: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeead44a0  ! 204: STBA_R	stba	%r23, [%r21 + %r0] 0x25
	mov	0x18, %r27
	mov	0x38, %r25
	mov	0x8, %r27
	.word 0xe4c76000  ! 208: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	mov	0x78, %r27
	mov	0x0, %r26
	.word 0x87802025  ! 211: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2a48400  ! 212: STWA_R	stwa	%r17, [%r18 + %r0] 0x20
	.word 0x87802020  ! 213: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0956000  ! 214: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r16
	.word 0xe0ad6000  ! 215: STBA_I	stba	%r16, [%r21 + 0x0000] %asi
	.word 0x87802020  ! 216: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 217: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0dc6000  ! 218: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r16
	.word 0xe4b609e0  ! 219: STHA_R	stha	%r18, [%r24 + %r0] 0x4f
	.word 0xe4878e60  ! 220: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r18
	.word 0xe2c584a0  ! 221: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r17
	.word 0xe0a689e0  ! 222: STWA_R	stwa	%r16, [%r26 + %r0] 0x4f
	.word 0xecb7ce40  ! 223: STHA_R	stha	%r22, [%r31 + %r0] 0x72
	.word 0xe2f70e60  ! 224: STXA_R	stxa	%r17, [%r28 + %r0] 0x73
	mov	0x20, %r25
	.word 0xe48584a0  ! 226: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r18
	.word 0xeed4e000  ! 227: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r23
	.word 0xe2840400  ! 228: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe0cd44a0  ! 230: LDSBA_R	ldsba	[%r21, %r0] 0x25, %r16
	.word 0xe8b689e0  ! 231: STHA_R	stha	%r20, [%r26 + %r0] 0x4f
	.word 0xe6a689e0  ! 232: STWA_R	stwa	%r19, [%r26 + %r0] 0x4f
	.word 0xeea4c400  ! 233: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	mov	0x30, %r27
	.word 0xeef78e40  ! 235: STXA_R	stxa	%r23, [%r30 + %r0] 0x72
	.word 0xe29c6000  ! 236: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r17
	mov	0x20, %r27
	.word 0x8780204f  ! 238: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2946000  ! 239: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r17
	.word 0xeaac8400  ! 240: STBA_R	stba	%r21, [%r18 + %r0] 0x20
	.word 0xeabc2000  ! 241: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xeadc2000  ! 242: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r21
	mov	0x7f0, %r23
	mov	0x58, %r27
	.word 0xeaf4e000  ! 245: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	mov	0x7c8, %r23
	.word 0xea846000  ! 247: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r21
	.word 0xeab4a000  ! 248: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	.word 0xeadc2000  ! 249: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r21
	.word 0xe6afce80  ! 250: STBA_R	stba	%r19, [%r31 + %r0] 0x74
	.word 0x87802072  ! 251: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4f42000  ! 252: STXA_I	stxa	%r18, [%r16 + 0x0000] %asi
	.word 0xe4c46000  ! 253: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r18
	.word 0xe89c0400  ! 254: LDDA_R	ldda	[%r16, %r0] 0x20, %r20
	.word 0xe0bfce40  ! 255: STDA_R	stda	%r16, [%r31 + %r0] 0x72
	.word 0xe4946000  ! 256: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r18
	.word 0xe8d74e60  ! 257: LDSHA_R	ldsha	[%r29, %r0] 0x73, %r20
	.word 0x8780204f  ! 258: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6d66000  ! 259: LDSHA_I	ldsha	[%r25, + 0x0000] %asi, %r19
	.word 0xe6d62000  ! 260: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	mov	0x7d8, %r23
	mov	0x70, %r27
	.word 0xe89f8e60  ! 263: LDDA_R	ldda	[%r30, %r0] 0x73, %r20
	.word 0xeaa74e40  ! 264: STWA_R	stwa	%r21, [%r29 + %r0] 0x72
	.word 0xe8cea000  ! 265: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r20
	.word 0xeace49e0  ! 266: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r21
	mov	0x40, %r19
	.word 0xe4b44400  ! 268: STHA_R	stha	%r18, [%r17 + %r0] 0x20
	.word 0xecae6000  ! 269: STBA_I	stba	%r22, [%r25 + 0x0000] %asi
	mov	0x7c8, %r21
	.word 0xec9e2000  ! 271: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r22
	.word 0xe69e89e0  ! 272: LDDA_R	ldda	[%r26, %r0] 0x4f, %r19
	.word 0x87802020  ! 273: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeecfce40  ! 274: LDSBA_R	ldsba	[%r31, %r0] 0x72, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee876000  ! 276: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 277: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 278: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeb74e80  ! 279: STHA_R	stha	%r23, [%r29 + %r0] 0x74
	.word 0x8780204f  ! 280: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a76000  ! 281: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	mov	0x18, %r27
	.word 0xe8a689e0  ! 283: STWA_R	stwa	%r20, [%r26 + %r0] 0x4f
	.word 0xe8af2000  ! 284: STBA_I	stba	%r20, [%r28 + 0x0000] %asi
	.word 0x87802073  ! 285: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x38, %r17
	.word 0xecf48400  ! 287: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	.word 0xecc44400  ! 288: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeab4a000  ! 290: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	mov	0x7e0, %r20
	.word 0xe0df4e40  ! 292: LDXA_R	ldxa	[%r29, %r0] 0x72, %r16
	.word 0xecacc400  ! 293: STBA_R	stba	%r22, [%r19 + %r0] 0x20
	.word 0xeca48400  ! 294: STWA_R	stwa	%r22, [%r18 + %r0] 0x20
	.word 0xe8adc4a0  ! 295: STBA_R	stba	%r20, [%r23 + %r0] 0x25
	mov	0x30, %r25
	mov	0x28, %r17
	mov	0x8, %r24
	.word 0x87802073  ! 299: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x28, %r16
	.word 0xe4f76000  ! 301: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe2f504a0  ! 302: STXA_R	stxa	%r17, [%r20 + %r0] 0x25
	.word 0xe8afa000  ! 303: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0xe8cf6000  ! 304: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r20
	.word 0xe8b584a0  ! 305: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0xe8b584a0  ! 306: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0xe6cf2000  ! 307: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 308: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec840400  ! 309: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r22
	.word 0xe8bfe000  ! 310: STDA_I	stda	%r20, [%r31 + 0x0000] %asi
	.word 0xe88fa000  ! 311: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r20
	.word 0x87802020  ! 312: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeed584a0  ! 313: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r23
	.word 0xeeb72000  ! 314: STHA_I	stha	%r23, [%r28 + 0x0000] %asi
	.word 0xead78e80  ! 315: LDSHA_R	ldsha	[%r30, %r0] 0x74, %r21
	mov	0x70, %r25
	mov	0x3d8, %r23
	.word 0xe2f6c9e0  ! 318: STXA_R	stxa	%r17, [%r27 + %r0] 0x4f
	.word 0x87802073  ! 319: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecac2000  ! 320: STBA_I	stba	%r22, [%r16 + 0x0000] %asi
	.word 0xecb4e000  ! 321: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	.word 0x87802020  ! 322: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0cf8e60  ! 323: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r16
	.word 0x87802073  ! 324: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r26
	.word 0xe6bea000  ! 326: STDA_I	stda	%r19, [%r26 + 0x0000] %asi
	mov	0x48, %r27
	mov	0x7e8, %r20
	.word 0xe0b70e40  ! 329: STHA_R	stha	%r16, [%r28 + %r0] 0x72
	.word 0xeaae49e0  ! 330: STBA_R	stba	%r21, [%r25 + %r0] 0x4f
	.word 0xeabe2000  ! 331: STDA_I	stda	%r21, [%r24 + 0x0000] %asi
	.word 0xeac6a000  ! 332: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r21
	.word 0xe0bf0e40  ! 333: STDA_R	stda	%r16, [%r28 + %r0] 0x72
	.word 0xee86e000  ! 334: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r23
	.word 0xe68c4400  ! 335: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0xe6f6a000  ! 336: STXA_I	stxa	%r19, [%r26 + 0x0000] %asi
	.word 0x87802074  ! 337: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x0, %r27
	.word 0x87802074  ! 339: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe69ee000  ! 340: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r19
	.word 0x87802025  ! 341: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 342: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6bf2000  ! 343: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0x87802020  ! 344: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 345: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49c0400  ! 346: LDDA_R	ldda	[%r16, %r0] 0x20, %r18
	.word 0x87802072  ! 347: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8dce000  ! 348: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r20
	.word 0xe8b4a000  ! 349: STHA_I	stha	%r20, [%r18 + 0x0000] %asi
	.word 0xe08cc400  ! 350: LDUBA_R	lduba	[%r19, %r0] 0x20, %r16
	.word 0x87802020  ! 351: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b42000  ! 352: STHA_I	stha	%r19, [%r16 + 0x0000] %asi
	.word 0x87802020  ! 353: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8978e40  ! 354: LDUHA_R	lduha	[%r30, %r0] 0x72, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x8, %r16
	.word 0x87802072  ! 357: WRASI_I	wr	%r0, 0x0072, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeadf4e40  ! 359: LDXA_R	ldxa	[%r29, %r0] 0x72, %r21
	mov	0x48, %r17
	.word 0xeaafa000  ! 361: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xe69c0400  ! 362: LDDA_R	ldda	[%r16, %r0] 0x20, %r19
	mov	0x40, %r24
	.word 0xeecfa000  ! 364: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	.word 0x87802020  ! 365: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 366: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3e0, %r21
	.word 0x8780204f  ! 368: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeec7a000  ! 369: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r23
	.word 0xe4cc4400  ! 370: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r18
	.word 0xe0f7e000  ! 371: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe2f48400  ! 372: STXA_R	stxa	%r17, [%r18 + %r0] 0x20
	.word 0xe0cf2000  ! 373: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0xe0bf8e60  ! 374: STDA_R	stda	%r16, [%r30 + %r0] 0x73
	mov	0x3f0, %r20
	.word 0xe4bf4e80  ! 376: STDA_R	stda	%r18, [%r29 + %r0] 0x74
	mov	0x3c0, %r22
	.word 0x87802020  ! 378: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb6a000  ! 379: STHA_I	stha	%r22, [%r26 + 0x0000] %asi
	.word 0xeca62000  ! 380: STWA_I	stwa	%r22, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 381: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 382: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x8, %r24
	.word 0xecc76000  ! 384: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r22
	.word 0xe4b544a0  ! 385: STHA_R	stha	%r18, [%r21 + %r0] 0x25
	.word 0xe2f78e80  ! 386: STXA_R	stxa	%r17, [%r30 + %r0] 0x74
	.word 0xeaaf8e80  ! 387: STBA_R	stba	%r21, [%r30 + %r0] 0x74
	.word 0xe8a7a000  ! 388: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xecdf0e80  ! 389: LDXA_R	ldxa	[%r28, %r0] 0x74, %r22
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe69d44a0  ! 391: LDDA_R	ldda	[%r21, %r0] 0x25, %r19
	.word 0xeef72000  ! 392: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xeef72000  ! 393: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xe0afce40  ! 394: STBA_R	stba	%r16, [%r31 + %r0] 0x72
	.word 0xe0f76000  ! 395: STXA_I	stxa	%r16, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 396: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc609e0  ! 397: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r22
	mov	0x3c0, %r21
	.word 0xea8f4e80  ! 399: LDUBA_R	lduba	[%r29, %r0] 0x74, %r21
	.word 0xe0dd44a0  ! 400: LDXA_R	ldxa	[%r21, %r0] 0x25, %r16
	.word 0x87802020  ! 401: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f62000  ! 402: STXA_I	stxa	%r20, [%r24 + 0x0000] %asi
	.word 0xe8ae2000  ! 403: STBA_I	stba	%r20, [%r24 + 0x0000] %asi
	.word 0x87802073  ! 404: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeabd04a0  ! 405: STDA_R	stda	%r21, [%r20 + %r0] 0x25
	.word 0xe4f7ce40  ! 406: STXA_R	stxa	%r18, [%r31 + %r0] 0x72
	.word 0xe6a5c4a0  ! 407: STWA_R	stwa	%r19, [%r23 + %r0] 0x25
	.word 0xeacf4e60  ! 408: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r21
	mov	0x30, %r17
	mov	0x3f8, %r21
	.word 0xe6a4a000  ! 411: STWA_I	stwa	%r19, [%r18 + 0x0000] %asi
	.word 0x87802072  ! 412: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6c4a000  ! 413: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r19
	.word 0x87802073  ! 414: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802072  ! 415: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8bf8e40  ! 416: STDA_R	stda	%r20, [%r30 + %r0] 0x72
	.word 0xeea76000  ! 417: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xeed7e000  ! 418: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0xeedf6000  ! 419: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	.word 0xe2940400  ! 420: LDUHA_R	lduha	[%r16, %r0] 0x20, %r17
	.word 0xe8b48400  ! 421: STHA_R	stha	%r20, [%r18 + %r0] 0x20
	.word 0xe897a000  ! 422: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r20
	.word 0xe284c400  ! 423: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r17
	.word 0xec97a000  ! 424: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r22
	.word 0x87802073  ! 425: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecdda000  ! 426: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r22
	mov	0x20, %r24
	.word 0xeca44400  ! 428: STWA_R	stwa	%r22, [%r17 + %r0] 0x20
	.word 0x87802025  ! 429: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 430: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe29c4400  ! 431: LDDA_R	ldda	[%r17, %r0] 0x20, %r17
	.word 0xe8af0e60  ! 432: STBA_R	stba	%r20, [%r28 + %r0] 0x73
	.word 0x87802020  ! 433: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebfe000  ! 434: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	mov	0x3e0, %r23
	.word 0xeef7a000  ! 436: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 437: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r16
	.word 0xeebfa000  ! 439: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	mov	0x70, %r25
	.word 0xeebf2000  ! 441: STDA_I	stda	%r23, [%r28 + 0x0000] %asi
	mov	0x0, %r16
	.word 0xeeaf2000  ! 443: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeef72000  ! 444: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xe0de09e0  ! 445: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r16
	.word 0xe6d72000  ! 446: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r19
	.word 0x87802025  ! 447: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 448: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 449: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b76000  ! 450: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe4b78e40  ! 451: STHA_R	stha	%r18, [%r30 + %r0] 0x72
	.word 0x87802074  ! 452: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2ac0400  ! 453: STBA_R	stba	%r17, [%r16 + %r0] 0x20
	.word 0x87802072  ! 454: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea76000  ! 455: STWA_I	stwa	%r23, [%r29 + 0x0000] %asi
	.word 0xe09d04a0  ! 456: LDDA_R	ldda	[%r20, %r0] 0x25, %r16
	.word 0x87802074  ! 457: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x8, %r27
	mov	0x7c0, %r22
	.word 0xe0d76000  ! 460: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r16
	.word 0xe89fce80  ! 461: LDDA_R	ldda	[%r31, %r0] 0x74, %r20
	.word 0xe6c72000  ! 462: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r19
	mov	0x68, %r19
	.word 0xeebf4e80  ! 464: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xe0c40400  ! 465: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r16
	.word 0xeacc4400  ! 466: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r21
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4f76000  ! 468: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe4c76000  ! 469: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	.word 0xe8b4c400  ! 470: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	.word 0xe8a7a000  ! 471: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe6acc400  ! 472: STBA_R	stba	%r19, [%r19 + %r0] 0x20
	.word 0xeeaf6000  ! 473: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	mov	0x7e8, %r22
	.word 0x87802074  ! 475: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7d8, %r23
	mov	0x38, %r16
	.word 0xeed5a000  ! 478: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r23
	.word 0xeea5a000  ! 479: STWA_I	stwa	%r23, [%r22 + 0x0000] %asi
	.word 0xe8de49e0  ! 480: LDXA_R	ldxa	[%r25, %r0] 0x4f, %r20
	mov	0x48, %r17
	.word 0xe2bd44a0  ! 482: STDA_R	stda	%r17, [%r21 + %r0] 0x25
	mov	0x48, %r18
	.word 0xea952000  ! 484: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r21
	.word 0xeabde000  ! 485: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	.word 0xeacda000  ! 486: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r21
	.word 0xeaad2000  ! 487: STBA_I	stba	%r21, [%r20 + 0x0000] %asi
	mov	0x7f0, %r20
	.word 0xeacde000  ! 489: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r21
	.word 0x8780204f  ! 490: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab7a000  ! 491: STHA_I	stha	%r21, [%r30 + 0x0000] %asi
	.word 0xead7e000  ! 492: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0xe6a74e80  ! 493: STWA_R	stwa	%r19, [%r29 + %r0] 0x74
	.word 0xe0f78e80  ! 494: STXA_R	stxa	%r16, [%r30 + %r0] 0x74
	.word 0xeecfa000  ! 495: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r23
	.word 0xe4c48400  ! 496: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r18
	.word 0xec8f6000  ! 497: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r22
	.word 0xe6cf0e60  ! 498: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r19
	.word 0xecc48400  ! 499: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r22
	mov	0x50, %r19
	.word 0xe2aec9e0  ! 501: STBA_R	stba	%r17, [%r27 + %r0] 0x4f
	mov	0x70, %r25
	.word 0xe69e49e0  ! 503: LDDA_R	ldda	[%r25, %r0] 0x4f, %r19
	.word 0x87802074  ! 504: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeeb40400  ! 505: STHA_R	stha	%r23, [%r16 + %r0] 0x20
	.word 0xe6bd44a0  ! 506: STDA_R	stda	%r19, [%r21 + %r0] 0x25
	.word 0x87802074  ! 507: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2a40400  ! 508: STWA_R	stwa	%r17, [%r16 + %r0] 0x20
	.word 0xe6972000  ! 509: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r19
	.word 0xe6a7e000  ! 510: STWA_I	stwa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6bf6000  ! 511: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0xeef70e80  ! 512: STXA_R	stxa	%r23, [%r28 + %r0] 0x74
	.word 0xea9f8e60  ! 513: LDDA_R	ldda	[%r30, %r0] 0x73, %r21
	.word 0xe8a72000  ! 514: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0x87802072  ! 515: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8f76000  ! 516: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0xeebd84a0  ! 517: STDA_R	stda	%r23, [%r22 + %r0] 0x25
	.word 0xead78e60  ! 518: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r21
	.word 0xe0c76000  ! 519: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r16
	.word 0xe8ddc4a0  ! 520: LDXA_R	ldxa	[%r23, %r0] 0x25, %r20
	.word 0xeca7e000  ! 521: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xeed70e40  ! 522: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r23
	mov	0x7f0, %r20
	.word 0xe4b78e60  ! 524: STHA_R	stha	%r18, [%r30 + %r0] 0x73
	.word 0x87802020  ! 525: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6972000  ! 526: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r19
	.word 0x87802072  ! 527: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6f76000  ! 528: STXA_I	stxa	%r19, [%r29 + 0x0000] %asi
	.word 0xe6cfe000  ! 529: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	.word 0xe68c4400  ! 530: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0xecaf0e40  ! 531: STBA_R	stba	%r22, [%r28 + %r0] 0x72
	.word 0xeccc0400  ! 532: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r22
	.word 0xead76000  ! 533: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xe8b48400  ! 534: STHA_R	stha	%r20, [%r18 + %r0] 0x20
	.word 0xe89e49e0  ! 535: LDDA_R	ldda	[%r25, %r0] 0x4f, %r20
	.word 0xecaf2000  ! 536: STBA_I	stba	%r22, [%r28 + 0x0000] %asi
	.word 0xecc7a000  ! 537: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r22
	.word 0xe695c4a0  ! 538: LDUHA_R	lduha	[%r23, %r0] 0x25, %r19
	.word 0xee974e80  ! 539: LDUHA_R	lduha	[%r29, %r0] 0x74, %r23
	mov	0x3f8, %r22
	.word 0xeedfce60  ! 541: LDXA_R	ldxa	[%r31, %r0] 0x73, %r23
	.word 0xe89f0e80  ! 542: LDDA_R	ldda	[%r28, %r0] 0x74, %r20
	.word 0xeabec9e0  ! 543: STDA_R	stda	%r21, [%r27 + %r0] 0x4f
	.word 0xe2f76000  ! 544: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 545: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a74e60  ! 546: STWA_R	stwa	%r20, [%r29 + %r0] 0x73
	.word 0xe6cf0e80  ! 547: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r19
	.word 0xe8878e60  ! 548: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r20
	mov	0x3c0, %r22
	.word 0xe8c5e000  ! 550: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r20
	.word 0xe8f5e000  ! 551: STXA_I	stxa	%r20, [%r23 + 0x0000] %asi
	.word 0xe6c4c400  ! 552: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r19
	.word 0xeade89e0  ! 553: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r21
	.word 0xe8dd6000  ! 554: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r20
	.word 0xecdf4e40  ! 555: LDXA_R	ldxa	[%r29, %r0] 0x72, %r22
	.word 0xea95e000  ! 556: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r21
	.word 0xeaa52000  ! 557: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0x87802025  ! 558: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b78e40  ! 559: STHA_R	stha	%r17, [%r30 + %r0] 0x72
	mov	0x0, %r27
	.word 0xe2970e60  ! 561: LDUHA_R	lduha	[%r28, %r0] 0x73, %r17
	.word 0xe68d6000  ! 562: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r19
	.word 0x87802020  ! 563: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 564: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe687a000  ! 565: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe68fa000  ! 566: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r19
	.word 0xe8dcc400  ! 567: LDXA_R	ldxa	[%r19, %r0] 0x20, %r20
	.word 0xe8f72000  ! 568: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f72000  ! 569: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	mov	0x70, %r18
	.word 0xeea78e80  ! 571: STWA_R	stwa	%r23, [%r30 + %r0] 0x74
	.word 0xeead84a0  ! 572: STBA_R	stba	%r23, [%r22 + %r0] 0x25
	mov	0x60, %r19
	.word 0x87802073  ! 574: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4878e40  ! 575: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r18
	.word 0xec9f0e40  ! 576: LDDA_R	ldda	[%r28, %r0] 0x72, %r22
	.word 0xe4972000  ! 577: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	mov	0x38, %r25
	.word 0xeab6c9e0  ! 579: STHA_R	stha	%r21, [%r27 + %r0] 0x4f
	.word 0xe6b76000  ! 580: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	mov	0x8, %r16
	.word 0xee940400  ! 582: LDUHA_R	lduha	[%r16, %r0] 0x20, %r23
	.word 0x87802020  ! 583: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2bc8400  ! 584: STDA_R	stda	%r17, [%r18 + %r0] 0x20
	.word 0xee9d44a0  ! 585: LDDA_R	ldda	[%r21, %r0] 0x25, %r23
	.word 0xe0acc400  ! 586: STBA_R	stba	%r16, [%r19 + %r0] 0x20
	.word 0xeaa52000  ! 587: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	mov	0x18, %r25
	mov	0x78, %r17
	.word 0xea9da000  ! 590: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	mov	0x58, %r25
	mov	0x8, %r27
	.word 0xea9d2000  ! 593: LDDA_I	ldda	[%r20, + 0x0000] %asi, %r21
	.word 0xe0bc4400  ! 594: STDA_R	stda	%r16, [%r17 + %r0] 0x20
	.word 0xe6bf4e40  ! 595: STDA_R	stda	%r19, [%r29 + %r0] 0x72
	.word 0x87802072  ! 596: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 597: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeb70e40  ! 598: STHA_R	stha	%r23, [%r28 + %r0] 0x72
	.word 0x87802073  ! 599: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeb504a0  ! 600: STHA_R	stha	%r23, [%r20 + %r0] 0x25
	mov	0x78, %r17
	.word 0xea9ea000  ! 602: LDDA_I	ldda	[%r26, + 0x0000] %asi, %r21
	.word 0xea866000  ! 603: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r21
	.word 0xeaae6000  ! 604: STBA_I	stba	%r21, [%r25 + 0x0000] %asi
	.word 0x8780204f  ! 605: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab62000  ! 606: STHA_I	stha	%r21, [%r24 + 0x0000] %asi
	.word 0xea862000  ! 607: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r21
	.word 0xe4f48400  ! 608: STXA_R	stxa	%r18, [%r18 + %r0] 0x20
	.word 0x87802020  ! 609: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaacc400  ! 610: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	mov	0x8, %r26
	.word 0xe8aca000  ! 612: STBA_I	stba	%r20, [%r18 + 0x0000] %asi
	.word 0x8780204f  ! 613: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaa78e80  ! 614: STWA_R	stwa	%r21, [%r30 + %r0] 0x74
	.word 0x87802020  ! 615: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 616: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2a40400  ! 617: STWA_R	stwa	%r17, [%r16 + %r0] 0x20
	mov	0x8, %r17
	.word 0xeadc0400  ! 619: LDXA_R	ldxa	[%r16, %r0] 0x20, %r21
	mov	0x7d8, %r20
	mov	0x3d8, %r22
	.word 0xe2c6a000  ! 622: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r17
	.word 0xe2b66000  ! 623: STHA_I	stha	%r17, [%r25 + 0x0000] %asi
	.word 0xe2b62000  ! 624: STHA_I	stha	%r17, [%r24 + 0x0000] %asi
	.word 0x87802072  ! 625: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2972000  ! 626: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a76000  ! 627: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xecf74e80  ! 628: STXA_R	stxa	%r22, [%r29 + %r0] 0x74
	.word 0xe4872000  ! 629: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	mov	0x3c8, %r23
	.word 0xe6a70e40  ! 631: STWA_R	stwa	%r19, [%r28 + %r0] 0x72
	.word 0xe6b72000  ! 632: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xeacd04a0  ! 633: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r21
	.word 0xe2f72000  ! 634: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	mov	0x50, %r19
	mov	0x68, %r26
	.word 0xe2bec9e0  ! 637: STDA_R	stda	%r17, [%r27 + %r0] 0x4f
	mov	0x50, %r25
	.word 0x8780204f  ! 639: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x78, %r18
	.word 0xeeaf2000  ! 641: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0x87802074  ! 642: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeaf78e80  ! 643: STXA_R	stxa	%r21, [%r30 + %r0] 0x74
	mov	0x20, %r27
	.word 0xeadd44a0  ! 645: LDXA_R	ldxa	[%r21, %r0] 0x25, %r21
	mov	0x50, %r25
	.word 0xe095a000  ! 647: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r16
	.word 0xe0cde000  ! 648: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r16
	.word 0xe0bd2000  ! 649: STDA_I	stda	%r16, [%r20 + 0x0000] %asi
	.word 0xe085e000  ! 650: LDUWA_I	lduwa	[%r23, + 0x0000] %asi, %r16
	.word 0xe0ade000  ! 651: STBA_I	stba	%r16, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 652: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x0, %r25
	.word 0xe0f52000  ! 654: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0f5a000  ! 655: STXA_I	stxa	%r16, [%r22 + 0x0000] %asi
	.word 0xe0f56000  ! 656: STXA_I	stxa	%r16, [%r21 + 0x0000] %asi
	.word 0xe0b56000  ! 657: STHA_I	stha	%r16, [%r21 + 0x0000] %asi
	.word 0xeca70e40  ! 658: STWA_R	stwa	%r22, [%r28 + %r0] 0x72
	.word 0xeacd6000  ! 659: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r21
	.word 0xeaac0400  ! 660: STBA_R	stba	%r21, [%r16 + %r0] 0x20
	.word 0xeaa5a000  ! 661: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xeaade000  ! 662: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	.word 0xeab5e000  ! 663: STHA_I	stha	%r21, [%r23 + 0x0000] %asi
	mov	0x40, %r25
	.word 0xeeafce80  ! 665: STBA_R	stba	%r23, [%r31 + %r0] 0x74
	mov	0x68, %r25
	.word 0xecc44400  ! 667: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r22
	.word 0xe89c4400  ! 668: LDDA_R	ldda	[%r17, %r0] 0x20, %r20
	.word 0xeab5a000  ! 669: STHA_I	stha	%r21, [%r22 + 0x0000] %asi
	.word 0x87802020  ! 670: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab4a000  ! 671: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	.word 0xe0b48400  ! 672: STHA_R	stha	%r16, [%r18 + %r0] 0x20
	.word 0xe4f4e000  ! 673: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	.word 0xe48c6000  ! 674: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r18
	.word 0x87802025  ! 675: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3c8, %r23
	.word 0xe4de6000  ! 677: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r18
	mov	0x3d8, %r21
	.word 0x87802073  ! 679: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 680: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4f70e80  ! 681: STXA_R	stxa	%r18, [%r28 + %r0] 0x74
	mov	0x48, %r17
	mov	0x3f8, %r20
	mov	0x3e8, %r21
	mov	0x40, %r16
	.word 0xe29d84a0  ! 686: LDDA_R	ldda	[%r22, %r0] 0x25, %r17
	.word 0x87802073  ! 687: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0f70e80  ! 688: STXA_R	stxa	%r16, [%r28 + %r0] 0x74
	.word 0xe6f7a000  ! 689: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xecb649e0  ! 690: STHA_R	stha	%r22, [%r25 + %r0] 0x4f
	.word 0xeecf0e60  ! 691: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r23
	.word 0xeec70e80  ! 692: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r23
	.word 0xe0af4e80  ! 693: STBA_R	stba	%r16, [%r29 + %r0] 0x74
	.word 0xee976000  ! 694: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	.word 0xeed7a000  ! 695: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r23
	.word 0x87802025  ! 696: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 697: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8f7ce60  ! 698: STXA_R	stxa	%r20, [%r31 + %r0] 0x73
	.word 0xea8fce80  ! 699: LDUBA_R	lduba	[%r31, %r0] 0x74, %r21
	.word 0x87802020  ! 700: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3d0, %r20
	.word 0xeaf74e60  ! 702: STXA_R	stxa	%r21, [%r29 + %r0] 0x73
	mov	0x0, %r26
	.word 0xeab44400  ! 704: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	.word 0x8780204f  ! 705: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6b72000  ! 706: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	mov	0x60, %r17
	.word 0x87802020  ! 708: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec97ce60  ! 709: LDUHA_R	lduha	[%r31, %r0] 0x73, %r22
	.word 0x8780204f  ! 710: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe88ce000  ! 711: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xe2ad44a0  ! 712: STBA_R	stba	%r17, [%r21 + %r0] 0x25
	.word 0xe8bc6000  ! 713: STDA_I	stda	%r20, [%r17 + 0x0000] %asi
	mov	0x0, %r27
	.word 0xe48f0e40  ! 715: LDUBA_R	lduba	[%r28, %r0] 0x72, %r18
	.word 0xeab4c400  ! 716: STHA_R	stha	%r21, [%r19 + %r0] 0x20
	.word 0xe4b78e80  ! 717: STHA_R	stha	%r18, [%r30 + %r0] 0x74
	mov	0x38, %r27
	.word 0xe0cce000  ! 719: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r16
	.word 0xe0a4e000  ! 720: STWA_I	stwa	%r16, [%r19 + 0x0000] %asi
	mov	0x60, %r19
	mov	0x3e0, %r23
	mov	0x60, %r16
	.word 0xe8adc4a0  ! 724: STBA_R	stba	%r20, [%r23 + %r0] 0x25
	mov	0x7f8, %r20
	.word 0xeaf4a000  ! 726: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0xe88f4e40  ! 727: LDUBA_R	lduba	[%r29, %r0] 0x72, %r20
	mov	0x58, %r24
	.word 0xe4840400  ! 729: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r18
	.word 0xe884e000  ! 730: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r20
	.word 0xe8bce000  ! 731: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	.word 0xec8c8400  ! 732: LDUBA_R	lduba	[%r18, %r0] 0x20, %r22
	.word 0xe09e49e0  ! 733: LDDA_R	ldda	[%r25, %r0] 0x4f, %r16
	.word 0xe4dc8400  ! 734: LDXA_R	ldxa	[%r18, %r0] 0x20, %r18
	.word 0xe8dce000  ! 735: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r20
	mov	0x38, %r16
	mov	0x78, %r19
	.word 0xe894a000  ! 738: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8f42000  ! 739: STXA_I	stxa	%r20, [%r16 + 0x0000] %asi
	mov	0x20, %r16
	.word 0xe2cd84a0  ! 741: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r17
	.word 0xeea42000  ! 742: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0xe6a78e60  ! 743: STWA_R	stwa	%r19, [%r30 + %r0] 0x73
	mov	0x0, %r25
	.word 0x87802074  ! 745: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0bc2000  ! 746: STDA_I	stda	%r16, [%r16 + 0x0000] %asi
	.word 0x87802072  ! 747: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0bc6000  ! 748: STDA_I	stda	%r16, [%r17 + 0x0000] %asi
	.word 0xe6b48400  ! 749: STHA_R	stha	%r19, [%r18 + %r0] 0x20
	mov	0x28, %r26
	.word 0xe48c4400  ! 751: LDUBA_R	lduba	[%r17, %r0] 0x20, %r18
	mov	0x50, %r19
	.word 0xe69ca000  ! 753: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r19
	.word 0xeeb609e0  ! 754: STHA_R	stha	%r23, [%r24 + %r0] 0x4f
	.word 0xecb4e000  ! 755: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	mov	0x10, %r25
	.word 0xe886c9e0  ! 757: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r20
	mov	0x3e8, %r23
	.word 0xeca46000  ! 759: STWA_I	stwa	%r22, [%r17 + 0x0000] %asi
	.word 0xeef70e60  ! 760: STXA_R	stxa	%r23, [%r28 + %r0] 0x73
	.word 0x87802073  ! 761: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeebf4e80  ! 762: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xe2a584a0  ! 763: STWA_R	stwa	%r17, [%r22 + %r0] 0x25
	mov	0x40, %r27
	.word 0x87802025  ! 765: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4afa000  ! 766: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	mov	0x8, %r24
	.word 0xe4af6000  ! 768: STBA_I	stba	%r18, [%r29 + 0x0000] %asi
	.word 0xeab7ce40  ! 769: STHA_R	stha	%r21, [%r31 + %r0] 0x72
	.word 0xe68c4400  ! 770: LDUBA_R	lduba	[%r17, %r0] 0x20, %r19
	.word 0x8780204f  ! 771: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeccf6000  ! 772: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r22
	.word 0xecbf2000  ! 773: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xe6bf4e40  ! 774: STDA_R	stda	%r19, [%r29 + %r0] 0x72
	.word 0xecf70e80  ! 775: STXA_R	stxa	%r22, [%r28 + %r0] 0x74
	.word 0x87802025  ! 776: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2df4e60  ! 777: LDXA_R	ldxa	[%r29, %r0] 0x73, %r17
	mov	0x3d8, %r22
	mov	0x60, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802020  ! 781: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3d8, %r22
	.word 0xe8a78e60  ! 783: STWA_R	stwa	%r20, [%r30 + %r0] 0x73
	mov	0x3e0, %r22
	mov	0x78, %r25
	mov	0x20, %r27
	mov	0x3c0, %r21
	.word 0x87802025  ! 788: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe687a000  ! 789: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	mov	0x28, %r18
	.word 0xe6dfe000  ! 791: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xe6cfe000  ! 792: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	mov	0x18, %r27
	mov	0x60, %r18
	.word 0xe2bf4e40  ! 795: STDA_R	stda	%r17, [%r29 + %r0] 0x72
	.word 0xe4f44400  ! 796: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xeef76000  ! 797: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xee9fa000  ! 798: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	mov	0x7e0, %r23
	.word 0xeedfe000  ! 800: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x7f0, %r23
	mov	0x40, %r24
	mov	0x7c8, %r23
	.word 0xe8af0e40  ! 804: STBA_R	stba	%r20, [%r28 + %r0] 0x72
	mov	0x0, %r26
	.word 0xecf7e000  ! 806: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	.word 0xe8c544a0  ! 807: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r20
	mov	0x30, %r27
	.word 0xeedfce40  ! 809: LDXA_R	ldxa	[%r31, %r0] 0x72, %r23
	.word 0xe0bfe000  ! 810: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xe0b7e000  ! 811: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xe4cf0e60  ! 812: LDSBA_R	ldsba	[%r28, %r0] 0x73, %r18
	mov	0x70, %r25
	mov	0x8, %r17
	.word 0xeedd84a0  ! 815: LDXA_R	ldxa	[%r22, %r0] 0x25, %r23
	.word 0xeeafce40  ! 816: STBA_R	stba	%r23, [%r31 + %r0] 0x72
	.word 0xe2c7a000  ! 817: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r17
	.word 0x87802025  ! 818: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 819: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4b48400  ! 820: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0xeead2000  ! 821: STBA_I	stba	%r23, [%r20 + 0x0000] %asi
	.word 0xee9de000  ! 822: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r23
	.word 0xea9f8e40  ! 823: LDDA_R	ldda	[%r30, %r0] 0x72, %r21
	mov	0x48, %r17
	.word 0x87802025  ! 825: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 826: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 827: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 828: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab6c9e0  ! 829: STHA_R	stha	%r21, [%r27 + %r0] 0x4f
	mov	0x48, %r18
	.word 0xe0af8e40  ! 831: STBA_R	stba	%r16, [%r30 + %r0] 0x72
	.word 0xe8c42000  ! 832: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r20
	.word 0xee8f8e80  ! 833: LDUBA_R	lduba	[%r30, %r0] 0x74, %r23
	.word 0xead42000  ! 834: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r21
	.word 0xea9d04a0  ! 835: LDDA_R	ldda	[%r20, %r0] 0x25, %r21
	.word 0xeabce000  ! 836: STDA_I	stda	%r21, [%r19 + 0x0000] %asi
	.word 0xe0cc8400  ! 837: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r16
	.word 0xe0cc6000  ! 838: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r16
	.word 0x87802073  ! 839: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0a6e000  ! 840: STWA_I	stwa	%r16, [%r27 + 0x0000] %asi
	.word 0x87802073  ! 841: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe09ce000  ! 842: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r16
	mov	0x8, %r18
	mov	0x60, %r26
	mov	0x68, %r24
	mov	0x40, %r26
	mov	0x3f0, %r21
	mov	0x28, %r19
	.word 0xe0c4e000  ! 849: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r16
	.word 0x8780204f  ! 850: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x40, %r26
	mov	0x48, %r24
	.word 0xe0cf2000  ! 853: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0x87802020  ! 854: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x40, %r27
	.word 0xeac4c400  ! 856: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r21
	mov	0x18, %r25
	.word 0x87802073  ! 858: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 859: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 860: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecbfa000  ! 861: STDA_I	stda	%r22, [%r30 + 0x0000] %asi
	.word 0xe2f44400  ! 862: STXA_R	stxa	%r17, [%r17 + %r0] 0x20
	mov	0x68, %r19
	.word 0xeeb76000  ! 864: STHA_I	stha	%r23, [%r29 + 0x0000] %asi
	.word 0xee9fe000  ! 865: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	mov	0x7d0, %r21
	.word 0xe0b78e60  ! 867: STHA_R	stha	%r16, [%r30 + %r0] 0x73
	mov	0x18, %r27
	.word 0xe6f76000  ! 869: STXA_I	stxa	%r19, [%r29 + 0x0000] %asi
	.word 0xe6c76000  ! 870: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 871: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe697e000  ! 872: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	.word 0xe6acc400  ! 873: STBA_R	stba	%r19, [%r19 + %r0] 0x20
	mov	0x50, %r19
	.word 0x87802074  ! 875: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0d74e40  ! 876: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r16
	.word 0x87802072  ! 877: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeaf74e40  ! 878: STXA_R	stxa	%r21, [%r29 + %r0] 0x72
	.word 0xe29504a0  ! 879: LDUHA_R	lduha	[%r20, %r0] 0x25, %r17
	.word 0xe88fce80  ! 880: LDUBA_R	lduba	[%r31, %r0] 0x74, %r20
	.word 0xe4a544a0  ! 881: STWA_R	stwa	%r18, [%r21 + %r0] 0x25
	.word 0xe49584a0  ! 882: LDUHA_R	lduha	[%r22, %r0] 0x25, %r18
	.word 0x87802020  ! 883: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d76000  ! 884: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xec9504a0  ! 885: LDUHA_R	lduha	[%r20, %r0] 0x25, %r22
	.word 0xe4f7e000  ! 886: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe8be09e0  ! 887: STDA_R	stda	%r20, [%r24 + %r0] 0x4f
	.word 0xe8bc4400  ! 888: STDA_R	stda	%r20, [%r17 + %r0] 0x20
	.word 0xe4c4c400  ! 889: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r18
	.word 0xe48e89e0  ! 890: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r18
	.word 0xe29fe000  ! 891: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r17
	.word 0xe8dc4400  ! 892: LDXA_R	ldxa	[%r17, %r0] 0x20, %r20
	.word 0xee972000  ! 893: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	.word 0xea8f4e40  ! 894: LDUBA_R	lduba	[%r29, %r0] 0x72, %r21
	.word 0xe29f8e40  ! 895: LDDA_R	ldda	[%r30, %r0] 0x72, %r17
	.word 0xe09f0e40  ! 896: LDDA_R	ldda	[%r28, %r0] 0x72, %r16
	.word 0xeecf2000  ! 897: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0xe4a609e0  ! 898: STWA_R	stwa	%r18, [%r24 + %r0] 0x4f
	.word 0xeef72000  ! 899: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xe8a7ce40  ! 900: STWA_R	stwa	%r20, [%r31 + %r0] 0x72
	.word 0x87802020  ! 901: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7f0, %r23
	.word 0x87802020  ! 903: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 904: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x40, %r16
	mov	0x3d0, %r23
	mov	0x78, %r19
	mov	0x68, %r16
	.word 0xecccc400  ! 909: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	.word 0x87802025  ! 910: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb42000  ! 911: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	.word 0xe6c504a0  ! 912: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r19
	.word 0xe28c4400  ! 913: LDUBA_R	lduba	[%r17, %r0] 0x20, %r17
	.word 0xeaf4c400  ! 914: STXA_R	stxa	%r21, [%r19 + %r0] 0x20
	.word 0xe2f46000  ! 915: STXA_I	stxa	%r17, [%r17 + 0x0000] %asi
	.word 0xe2bc2000  ! 916: STDA_I	stda	%r17, [%r16 + 0x0000] %asi
	mov	0x60, %r17
	.word 0xeeaf4e40  ! 918: STBA_R	stba	%r23, [%r29 + %r0] 0x72
	mov	0x7f8, %r22
	.word 0xe0a70e60  ! 920: STWA_R	stwa	%r16, [%r28 + %r0] 0x73
	.word 0xeeb4c400  ! 921: STHA_R	stha	%r23, [%r19 + %r0] 0x20
	.word 0xe4b70e60  ! 922: STHA_R	stha	%r18, [%r28 + %r0] 0x73
	.word 0xeebf4e40  ! 923: STDA_R	stda	%r23, [%r29 + %r0] 0x72
	.word 0xe4f78e60  ! 924: STXA_R	stxa	%r18, [%r30 + %r0] 0x73
	.word 0xe49c8400  ! 925: LDDA_R	ldda	[%r18, %r0] 0x20, %r18
	mov	0x78, %r24
	.word 0xeca42000  ! 927: STWA_I	stwa	%r22, [%r16 + 0x0000] %asi
	.word 0xeccc2000  ! 928: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r22
	.word 0xe6f4c400  ! 929: STXA_R	stxa	%r19, [%r19 + %r0] 0x20
	mov	0x7f8, %r20
	.word 0xe2b46000  ! 931: STHA_I	stha	%r17, [%r17 + 0x0000] %asi
	mov	0x18, %r16
	.word 0xe2a7ce60  ! 933: STWA_R	stwa	%r17, [%r31 + %r0] 0x73
	.word 0xecce09e0  ! 934: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r22
	.word 0xe2d42000  ! 935: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r17
	.word 0xe2842000  ! 936: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r17
	.word 0xe6870e60  ! 937: LDUWA_R	lduwa	[%r28, %r0] 0x73, %r19
	.word 0xe6bce000  ! 938: STDA_I	stda	%r19, [%r19 + 0x0000] %asi
	.word 0xe6b4a000  ! 939: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	mov	0x38, %r19
	mov	0x7e8, %r20
	.word 0xe6dc2000  ! 942: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r19
	mov	0x78, %r26
	mov	0x0, %r18
	mov	0x68, %r16
	.word 0xe6b4e000  ! 946: STHA_I	stha	%r19, [%r19 + 0x0000] %asi
	.word 0xe694e000  ! 947: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r19
	.word 0x87802072  ! 948: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe29f0e80  ! 949: LDDA_R	ldda	[%r28, %r0] 0x74, %r17
	mov	0x7c8, %r21
	.word 0xe4d48400  ! 951: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r18
	.word 0xe2d72000  ! 952: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe6c74e80  ! 953: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r19
	.word 0xe4afe000  ! 954: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xe497a000  ! 955: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r18
	mov	0x7e8, %r21
	mov	0x3d8, %r23
	.word 0xeac4c400  ! 958: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r21
	.word 0xea9f6000  ! 959: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r21
	.word 0xeadf2000  ! 960: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r21
	.word 0xead7a000  ! 961: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	.word 0xeaaf2000  ! 962: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	.word 0xe8874e40  ! 963: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r20
	mov	0x38, %r19
	.word 0xe8bc0400  ! 965: STDA_R	stda	%r20, [%r16 + %r0] 0x20
	mov	0x40, %r19
	.word 0xe2cdc4a0  ! 967: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r17
	.word 0x87802074  ! 968: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xead649e0  ! 969: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r21
	mov	0x7c8, %r20
	.word 0x87802073  ! 971: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x50, %r27
	mov	0x70, %r18
	.word 0xe48f8e60  ! 974: LDUBA_R	lduba	[%r30, %r0] 0x73, %r18
	mov	0x0, %r16
	.word 0xea97a000  ! 976: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r21
	.word 0xeaa76000  ! 977: STWA_I	stwa	%r21, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 978: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 979: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeab46000  ! 980: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	mov	0x40, %r16
	mov	0x10, %r18
	.word 0xeaaca000  ! 983: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	mov	0x0, %r24
	.word 0xead4e000  ! 986: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r21
	.word 0xeab42000  ! 987: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x48, %r27
	.word 0xeac4e000  ! 989: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r21
	.word 0xea8c6000  ! 990: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r21
	.word 0x87802073  ! 991: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r25
	.word 0xeaae2000  ! 993: STBA_I	stba	%r21, [%r24 + 0x0000] %asi
	.word 0x87802020  ! 994: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeac5a000  ! 995: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r21
	mov	0x3f0, %r21
	.word 0xe2a4c400  ! 997: STWA_R	stwa	%r17, [%r19 + %r0] 0x20
	.word 0xe8a584a0  ! 998: STWA_R	stwa	%r20, [%r22 + %r0] 0x25
	mov	0x7f0, %r23
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	mov	0x3c0, %r23
	.word 0xe0a70e60  ! 2: STWA_R	stwa	%r16, [%r28 + %r0] 0x73
	.word 0xecf4e000  ! 3: STXA_I	stxa	%r22, [%r19 + 0x0000] %asi
	.word 0xeca4a000  ! 4: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0x87802073  ! 5: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeec5c4a0  ! 6: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r23
	.word 0xee8ea000  ! 7: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r23
	mov	0x3e8, %r22
	.word 0x87802020  ! 9: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r17
	.word 0xe0a78e60  ! 11: STWA_R	stwa	%r16, [%r30 + %r0] 0x73
	mov	0x58, %r18
	.word 0xe8b76000  ! 13: STHA_I	stha	%r20, [%r29 + 0x0000] %asi
	.word 0xe8f7e000  ! 14: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0xe8a504a0  ! 15: STWA_R	stwa	%r20, [%r20 + %r0] 0x25
	.word 0xe696c9e0  ! 16: LDUHA_R	lduha	[%r27, %r0] 0x4f, %r19
	.word 0xeedf0e80  ! 17: LDXA_R	ldxa	[%r28, %r0] 0x74, %r23
	.word 0xeeb78e80  ! 18: STHA_R	stha	%r23, [%r30 + %r0] 0x74
	.word 0xe6af0e40  ! 19: STBA_R	stba	%r19, [%r28 + %r0] 0x72
	.word 0xe2afe000  ! 20: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0xe2a7a000  ! 21: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0xeaf544a0  ! 22: STXA_R	stxa	%r21, [%r21 + %r0] 0x25
	.word 0xe0bf4e60  ! 23: STDA_R	stda	%r16, [%r29 + %r0] 0x73
	.word 0xe6978e80  ! 24: LDUHA_R	lduha	[%r30, %r0] 0x74, %r19
	.word 0x87802020  ! 25: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 26: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r24
	.word 0xe4b504a0  ! 28: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	.word 0xe8b5a000  ! 29: STHA_I	stha	%r20, [%r22 + 0x0000] %asi
	mov	0x3e8, %r20
	.word 0xe8952000  ! 31: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r20
	.word 0xe8bd6000  ! 32: STDA_I	stda	%r20, [%r21 + 0x0000] %asi
	.word 0xe8c56000  ! 33: LDSWA_I	ldswa	[%r21, + 0x0000] %asi, %r20
	.word 0x87802073  ! 34: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 35: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe88544a0  ! 36: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r20
	.word 0xee976000  ! 37: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r23
	mov	0x50, %r27
	.word 0xeed72000  ! 39: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xeea40400  ! 40: STWA_R	stwa	%r23, [%r16 + %r0] 0x20
	mov	0x48, %r18
	mov	0x18, %r16
	.word 0xe0972000  ! 43: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r16
	mov	0x8, %r27
	mov	0x28, %r16
	.word 0xe0f7a000  ! 46: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	.word 0xe087a000  ! 47: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r16
	.word 0xe09fe000  ! 48: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
	.word 0xe0af2000  ! 49: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	mov	0x18, %r25
	mov	0x0, %r26
	.word 0xe2af4e80  ! 52: STBA_R	stba	%r17, [%r29 + %r0] 0x74
	.word 0xead76000  ! 53: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xea972000  ! 54: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	.word 0xeabfa000  ! 55: STDA_I	stda	%r21, [%r30 + 0x0000] %asi
	.word 0xee974e60  ! 56: LDUHA_R	lduha	[%r29, %r0] 0x73, %r23
	.word 0xe8a7a000  ! 57: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe8f72000  ! 58: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8f76000  ! 59: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8cfa000  ! 60: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	mov	0x20, %r19
	.word 0xeaac8400  ! 62: STBA_R	stba	%r21, [%r18 + %r0] 0x20
	.word 0xe6ad04a0  ! 63: STBA_R	stba	%r19, [%r20 + %r0] 0x25
	.word 0xee8fa000  ! 64: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r23
	.word 0xe697ce80  ! 65: LDUHA_R	lduha	[%r31, %r0] 0x74, %r19
	mov	0x3c8, %r21
	.word 0xeedfe000  ! 67: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	mov	0x20, %r19
	.word 0xeef72000  ! 69: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x60, %r27
	.word 0xeef72000  ! 71: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x7d8, %r22
	.word 0xeeaf2000  ! 73: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeef76000  ! 74: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeed76000  ! 75: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0x87802020  ! 76: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802072  ! 77: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea4a000  ! 78: STWA_I	stwa	%r23, [%r18 + 0x0000] %asi
	mov	0x28, %r25
	.word 0xeaac8400  ! 80: STBA_R	stba	%r21, [%r18 + %r0] 0x20
	.word 0x87802074  ! 81: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4f5a000  ! 82: STXA_I	stxa	%r18, [%r22 + 0x0000] %asi
	.word 0xe2bfce60  ! 83: STDA_R	stda	%r17, [%r31 + %r0] 0x73
	.word 0xeaad6000  ! 84: STBA_I	stba	%r21, [%r21 + 0x0000] %asi
	.word 0xeaa5e000  ! 85: STWA_I	stwa	%r21, [%r23 + 0x0000] %asi
	.word 0xeeb649e0  ! 86: STHA_R	stha	%r23, [%r25 + %r0] 0x4f
	mov	0x7c8, %r20
	.word 0xeec4c400  ! 88: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r23
	.word 0x87802074  ! 89: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe4be6000  ! 90: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	.word 0x87802073  ! 91: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x8780204f  ! 92: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x70, %r16
	.word 0xe4a544a0  ! 94: STWA_R	stwa	%r18, [%r21 + %r0] 0x25
	mov	0x7d8, %r20
	.word 0x8780204f  ! 96: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbf6000  ! 97: STDA_I	stda	%r22, [%r29 + 0x0000] %asi
	mov	0x50, %r19
	.word 0x87802072  ! 99: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecdda000  ! 100: LDXA_I	ldxa	[%r22, + 0x0000] %asi, %r22
	.word 0xeccd2000  ! 101: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r22
	.word 0xe0f48400  ! 102: STXA_R	stxa	%r16, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 103: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeaf2000  ! 104: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xe2b544a0  ! 105: STHA_R	stha	%r17, [%r21 + %r0] 0x25
	.word 0xe2f74e80  ! 106: STXA_R	stxa	%r17, [%r29 + %r0] 0x74
	.word 0xe4c7a000  ! 107: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 108: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xe4c7e000  ! 109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	mov	0x58, %r18
	.word 0xe487a000  ! 111: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	.word 0x87802020  ! 112: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4dd6000  ! 113: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r18
	mov	0x3c8, %r21
	mov	0x18, %r16
	.word 0xe4d56000  ! 116: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r18
	mov	0x40, %r24
	.word 0x87802020  ! 118: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2a689e0  ! 119: STWA_R	stwa	%r17, [%r26 + %r0] 0x4f
	.word 0xeec44400  ! 120: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r23
	.word 0xe0afce80  ! 121: STBA_R	stba	%r16, [%r31 + %r0] 0x74
	.word 0xeaa72000  ! 122: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	.word 0xeaa72000  ! 123: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	mov	0x40, %r16
	.word 0xeef689e0  ! 125: STXA_R	stxa	%r23, [%r26 + %r0] 0x4f
	mov	0x38, %r27
	.word 0xeca78e40  ! 127: STWA_R	stwa	%r22, [%r30 + %r0] 0x72
	.word 0xe297e000  ! 128: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0xe2f7a000  ! 129: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2a76000  ! 131: STWA_I	stwa	%r17, [%r29 + 0x0000] %asi
	.word 0xe2d72000  ! 132: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2bf2000  ! 133: STDA_I	stda	%r17, [%r28 + 0x0000] %asi
	.word 0xe6d544a0  ! 134: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r19
	mov	0x58, %r17
	.word 0xe8848400  ! 136: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r20
	mov	0x30, %r27
	.word 0xe48f6000  ! 138: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r18
	.word 0x87802074  ! 139: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeab48400  ! 140: STHA_R	stha	%r21, [%r18 + %r0] 0x20
	.word 0xe0dd84a0  ! 141: LDXA_R	ldxa	[%r22, %r0] 0x25, %r16
	.word 0xe68ee000  ! 142: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r19
	.word 0x87802020  ! 143: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x28, %r27
	.word 0xe6ce6000  ! 145: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r19
	.word 0xe6d6a000  ! 146: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	.word 0xe4d544a0  ! 147: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r18
	.word 0xe6ce6000  ! 148: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r19
	.word 0xe6d6a000  ! 149: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r19
	.word 0xe6a62000  ! 150: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0xe6ce2000  ! 151: LDSBA_I	ldsba	[%r24, + 0x0000] %asi, %r19
	.word 0xe6a6a000  ! 152: STWA_I	stwa	%r19, [%r26 + 0x0000] %asi
	.word 0x87802073  ! 153: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6b6e000  ! 154: STHA_I	stha	%r19, [%r27 + 0x0000] %asi
	.word 0x8780204f  ! 155: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6cce000  ! 156: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r19
	.word 0x87802073  ! 157: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6b78e40  ! 158: STHA_R	stha	%r19, [%r30 + %r0] 0x72
	.word 0xe2c4c400  ! 159: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r17
	.word 0x8780204f  ! 160: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x20, %r16
	mov	0x8, %r18
	.word 0xe88dc4a0  ! 163: LDUBA_R	lduba	[%r23, %r0] 0x25, %r20
	.word 0xe0d544a0  ! 164: LDSHA_R	ldsha	[%r21, %r0] 0x25, %r16
	.word 0xe8bfe000  ! 165: STDA_I	stda	%r20, [%r31 + 0x0000] %asi
	mov	0x28, %r17
	.word 0xe8c7a000  ! 167: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r20
	.word 0x87802020  ! 168: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea9649e0  ! 169: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r21
	mov	0x50, %r19
	.word 0xe49584a0  ! 171: LDUHA_R	lduha	[%r22, %r0] 0x25, %r18
	mov	0x58, %r18
	mov	0x38, %r26
	.word 0xe0ccc400  ! 174: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	.word 0xe4970e60  ! 175: LDUHA_R	lduha	[%r28, %r0] 0x73, %r18
	.word 0xe0b5a000  ! 176: STHA_I	stha	%r16, [%r22 + 0x0000] %asi
	.word 0xe0b74e80  ! 177: STHA_R	stha	%r16, [%r29 + %r0] 0x74
	.word 0xe8a52000  ! 178: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xeebd44a0  ! 179: STDA_R	stda	%r23, [%r21 + %r0] 0x25
	mov	0x0, %r16
	mov	0x70, %r17
	mov	0x78, %r18
	.word 0xecd70e60  ! 183: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r22
	.word 0xea940400  ! 184: LDUHA_R	lduha	[%r16, %r0] 0x20, %r21
	.word 0xe8d504a0  ! 185: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r20
	.word 0xe28da000  ! 186: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r17
	.word 0xe2bde000  ! 187: STDA_I	stda	%r17, [%r23 + 0x0000] %asi
	.word 0x8780204f  ! 188: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 189: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe28e2000  ! 190: LDUBA_I	lduba	[%r24, + 0x0000] %asi, %r17
	mov	0x3c0, %r22
	.word 0x87802025  ! 192: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8c48400  ! 193: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r20
	.word 0xecdc2000  ! 194: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r22
	.word 0x87802073  ! 195: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecc7e000  ! 196: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r22
	.word 0xe6ac4400  ! 197: STBA_R	stba	%r19, [%r17 + %r0] 0x20
	mov	0x58, %r19
	.word 0xeeafce40  ! 199: STBA_R	stba	%r23, [%r31 + %r0] 0x72
	.word 0xeef689e0  ! 200: STXA_R	stxa	%r23, [%r26 + %r0] 0x4f
	.word 0xeec4c400  ! 201: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r23
	.word 0x87802074  ! 202: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802072  ! 203: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6aec9e0  ! 204: STBA_R	stba	%r19, [%r27 + %r0] 0x4f
	mov	0x48, %r26
	mov	0x68, %r26
	mov	0x0, %r27
	.word 0xe4c76000  ! 208: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r18
	mov	0x58, %r27
	mov	0x18, %r25
	.word 0x87802025  ! 211: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8a44400  ! 212: STWA_R	stwa	%r20, [%r17 + %r0] 0x20
	.word 0x87802025  ! 213: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0956000  ! 214: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r16
	.word 0xe0ade000  ! 215: STBA_I	stba	%r16, [%r23 + 0x0000] %asi
	.word 0x8780204f  ! 216: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 217: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0dc6000  ! 218: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r16
	.word 0xeab78e40  ! 219: STHA_R	stha	%r21, [%r30 + %r0] 0x72
	.word 0xee87ce60  ! 220: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r23
	.word 0xe8c5c4a0  ! 221: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r20
	.word 0xeaa44400  ! 222: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	.word 0xecb78e80  ! 223: STHA_R	stha	%r22, [%r30 + %r0] 0x74
	.word 0xe8f70e40  ! 224: STXA_R	stxa	%r20, [%r28 + %r0] 0x72
	mov	0x30, %r25
	.word 0xee85c4a0  ! 226: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r23
	.word 0xeed4a000  ! 227: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r23
	.word 0xe2874e40  ! 228: LDUWA_R	lduwa	[%r29, %r0] 0x72, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeace89e0  ! 230: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r21
	.word 0xe6b40400  ! 231: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0xeaa4c400  ! 232: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	.word 0xe2a70e80  ! 233: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	mov	0x68, %r25
	.word 0xe8f74e60  ! 235: STXA_R	stxa	%r20, [%r29 + %r0] 0x73
	.word 0xe29ce000  ! 236: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r17
	mov	0x0, %r25
	.word 0x87802074  ! 238: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2946000  ! 239: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r17
	.word 0xe6acc400  ! 240: STBA_R	stba	%r19, [%r19 + %r0] 0x20
	.word 0xeabc2000  ! 241: STDA_I	stda	%r21, [%r16 + 0x0000] %asi
	.word 0xeadc2000  ! 242: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r21
	mov	0x7e0, %r23
	mov	0x18, %r26
	.word 0xeaf4e000  ! 245: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	mov	0x3d8, %r23
	.word 0xea842000  ! 247: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r21
	.word 0xeab46000  ! 248: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	.word 0xeadce000  ! 249: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r21
	.word 0xecad44a0  ! 250: STBA_R	stba	%r22, [%r21 + %r0] 0x25
	.word 0x87802025  ! 251: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4f46000  ! 252: STXA_I	stxa	%r18, [%r17 + 0x0000] %asi
	.word 0xe4c42000  ! 253: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r18
	.word 0xe89c4400  ! 254: LDDA_R	ldda	[%r17, %r0] 0x20, %r20
	.word 0xe4bf4e40  ! 255: STDA_R	stda	%r18, [%r29 + %r0] 0x72
	.word 0xe4946000  ! 256: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r18
	.word 0xe2d78e40  ! 257: LDSHA_R	ldsha	[%r30, %r0] 0x72, %r17
	.word 0x87802073  ! 258: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6d62000  ! 259: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	.word 0xe6d62000  ! 260: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r19
	mov	0x3c0, %r20
	mov	0x50, %r26
	.word 0xe89c0400  ! 263: LDDA_R	ldda	[%r16, %r0] 0x20, %r20
	.word 0xe4a78e40  ! 264: STWA_R	stwa	%r18, [%r30 + %r0] 0x72
	.word 0xe8ce6000  ! 265: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r20
	.word 0xecccc400  ! 266: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	mov	0x70, %r17
	.word 0xe4b544a0  ! 268: STHA_R	stha	%r18, [%r21 + %r0] 0x25
	.word 0xecae2000  ! 269: STBA_I	stba	%r22, [%r24 + 0x0000] %asi
	mov	0x3d8, %r21
	.word 0xec9ee000  ! 271: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r22
	.word 0xe49f8e80  ! 272: LDDA_R	ldda	[%r30, %r0] 0x74, %r18
	.word 0x87802073  ! 273: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeacc8400  ! 274: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r21
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee872000  ! 276: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 277: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 278: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb44400  ! 279: STHA_R	stha	%r22, [%r17 + %r0] 0x20
	.word 0x87802074  ! 280: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6a76000  ! 281: STWA_I	stwa	%r19, [%r29 + 0x0000] %asi
	mov	0x70, %r27
	.word 0xe2a7ce60  ! 283: STWA_R	stwa	%r17, [%r31 + %r0] 0x73
	.word 0xe8afa000  ! 284: STBA_I	stba	%r20, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 285: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x10, %r16
	.word 0xe8f48400  ! 287: STXA_R	stxa	%r20, [%r18 + %r0] 0x20
	.word 0xe6c44400  ! 288: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeab42000  ! 290: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x7c0, %r22
	.word 0xeedf8e80  ! 292: LDXA_R	ldxa	[%r30, %r0] 0x74, %r23
	.word 0xe0acc400  ! 293: STBA_R	stba	%r16, [%r19 + %r0] 0x20
	.word 0xeaa4c400  ! 294: STWA_R	stwa	%r21, [%r19 + %r0] 0x20
	.word 0xe0ac8400  ! 295: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	mov	0x68, %r25
	mov	0x28, %r19
	mov	0x60, %r24
	.word 0x87802072  ! 299: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x50, %r19
	.word 0xe4f76000  ! 301: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe2f48400  ! 302: STXA_R	stxa	%r17, [%r18 + %r0] 0x20
	.word 0xe8afe000  ! 303: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe8cfa000  ! 304: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r20
	.word 0xecb689e0  ! 305: STHA_R	stha	%r22, [%r26 + %r0] 0x4f
	.word 0xe8b504a0  ! 306: STHA_R	stha	%r20, [%r20 + %r0] 0x25
	.word 0xe6cf2000  ! 307: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 308: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe68609e0  ! 309: LDUWA_R	lduwa	[%r24, %r0] 0x4f, %r19
	.word 0xe8bfe000  ! 310: STDA_I	stda	%r20, [%r31 + 0x0000] %asi
	.word 0xe88f2000  ! 311: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r20
	.word 0x87802020  ! 312: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeed4c400  ! 313: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r23
	.word 0xeeb7e000  ! 314: STHA_I	stha	%r23, [%r31 + 0x0000] %asi
	.word 0xecd74e40  ! 315: LDSHA_R	ldsha	[%r29, %r0] 0x72, %r22
	mov	0x58, %r25
	mov	0x7d8, %r22
	.word 0xe6f40400  ! 318: STXA_R	stxa	%r19, [%r16 + %r0] 0x20
	.word 0x87802025  ! 319: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecaca000  ! 320: STBA_I	stba	%r22, [%r18 + 0x0000] %asi
	.word 0xecb46000  ! 321: STHA_I	stha	%r22, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 322: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaccc400  ! 323: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r21
	.word 0x87802025  ! 324: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x58, %r25
	.word 0xe6be2000  ! 326: STDA_I	stda	%r19, [%r24 + 0x0000] %asi
	mov	0x70, %r24
	mov	0x7c8, %r22
	.word 0xeeb504a0  ! 329: STHA_R	stha	%r23, [%r20 + %r0] 0x25
	.word 0xe4af0e40  ! 330: STBA_R	stba	%r18, [%r28 + %r0] 0x72
	.word 0xeabe6000  ! 331: STDA_I	stda	%r21, [%r25 + 0x0000] %asi
	.word 0xeac6a000  ! 332: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r21
	.word 0xeebf4e80  ! 333: STDA_R	stda	%r23, [%r29 + %r0] 0x74
	.word 0xee86e000  ! 334: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r23
	.word 0xea8c8400  ! 335: LDUBA_R	lduba	[%r18, %r0] 0x20, %r21
	.word 0xe6f6a000  ! 336: STXA_I	stxa	%r19, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 337: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x30, %r24
	.word 0x87802025  ! 339: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe69e2000  ! 340: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r19
	.word 0x87802074  ! 341: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802025  ! 342: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6bf6000  ! 343: STDA_I	stda	%r19, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 344: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 345: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe29c8400  ! 346: LDDA_R	ldda	[%r18, %r0] 0x20, %r17
	.word 0x87802074  ! 347: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8dca000  ! 348: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r20
	.word 0xe8b4a000  ! 349: STHA_I	stha	%r20, [%r18 + 0x0000] %asi
	.word 0xea8d84a0  ! 350: LDUBA_R	lduba	[%r22, %r0] 0x25, %r21
	.word 0x87802073  ! 351: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6b46000  ! 352: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 353: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6970e80  ! 354: LDUHA_R	lduha	[%r28, %r0] 0x74, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x10, %r18
	.word 0x87802073  ! 357: WRASI_I	wr	%r0, 0x0073, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2dcc400  ! 359: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	mov	0x28, %r18
	.word 0xeaaf6000  ! 361: STBA_I	stba	%r21, [%r29 + 0x0000] %asi
	.word 0xe29c8400  ! 362: LDDA_R	ldda	[%r18, %r0] 0x20, %r17
	mov	0x28, %r25
	.word 0xeecf2000  ! 364: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 365: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 366: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7c0, %r22
	.word 0x8780204f  ! 368: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeec72000  ! 369: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r23
	.word 0xeecf0e40  ! 370: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r23
	.word 0xe0f76000  ! 371: STXA_I	stxa	%r16, [%r29 + 0x0000] %asi
	.word 0xecf4c400  ! 372: STXA_R	stxa	%r22, [%r19 + %r0] 0x20
	.word 0xe0cfe000  ! 373: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xeebc8400  ! 374: STDA_R	stda	%r23, [%r18 + %r0] 0x20
	mov	0x3c8, %r23
	.word 0xeebd04a0  ! 376: STDA_R	stda	%r23, [%r20 + %r0] 0x25
	mov	0x7d0, %r22
	.word 0x87802020  ! 378: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb6e000  ! 379: STHA_I	stha	%r22, [%r27 + 0x0000] %asi
	.word 0xeca6a000  ! 380: STWA_I	stwa	%r22, [%r26 + 0x0000] %asi
	.word 0x87802072  ! 381: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 382: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x20, %r25
	.word 0xecc72000  ! 384: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	.word 0xecb4c400  ! 385: STHA_R	stha	%r22, [%r19 + %r0] 0x20
	.word 0xeef74e60  ! 386: STXA_R	stxa	%r23, [%r29 + %r0] 0x73
	.word 0xe4afce80  ! 387: STBA_R	stba	%r18, [%r31 + %r0] 0x74
	.word 0xe8a7e000  ! 388: STWA_I	stwa	%r20, [%r31 + 0x0000] %asi
	.word 0xe4dec9e0  ! 389: LDXA_R	ldxa	[%r27, %r0] 0x4f, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xea9c0400  ! 391: LDDA_R	ldda	[%r16, %r0] 0x20, %r21
	.word 0xeef7e000  ! 392: STXA_I	stxa	%r23, [%r31 + 0x0000] %asi
	.word 0xeef72000  ! 393: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xe6afce80  ! 394: STBA_R	stba	%r19, [%r31 + %r0] 0x74
	.word 0xe0f7e000  ! 395: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 396: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac74e80  ! 397: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r21
	mov	0x3f8, %r22
	.word 0xea8f4e40  ! 399: LDUBA_R	lduba	[%r29, %r0] 0x72, %r21
	.word 0xe2df4e80  ! 400: LDXA_R	ldxa	[%r29, %r0] 0x74, %r17
	.word 0x87802072  ! 401: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8f66000  ! 402: STXA_I	stxa	%r20, [%r25 + 0x0000] %asi
	.word 0xe8ae2000  ! 403: STBA_I	stba	%r20, [%r24 + 0x0000] %asi
	.word 0x87802074  ! 404: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeabf4e60  ! 405: STDA_R	stda	%r21, [%r29 + %r0] 0x73
	.word 0xe6f7ce60  ! 406: STXA_R	stxa	%r19, [%r31 + %r0] 0x73
	.word 0xe4a70e40  ! 407: STWA_R	stwa	%r18, [%r28 + %r0] 0x72
	.word 0xe6cd84a0  ! 408: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r19
	mov	0x30, %r18
	mov	0x7c0, %r22
	.word 0xe6a42000  ! 411: STWA_I	stwa	%r19, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 412: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6c4a000  ! 413: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r19
	.word 0x87802020  ! 414: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 415: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2bcc400  ! 416: STDA_R	stda	%r17, [%r19 + %r0] 0x20
	.word 0xeea7e000  ! 417: STWA_I	stwa	%r23, [%r31 + 0x0000] %asi
	.word 0xeed76000  ! 418: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r23
	.word 0xeedfa000  ! 419: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r23
	.word 0xe8974e40  ! 420: LDUHA_R	lduha	[%r29, %r0] 0x72, %r20
	.word 0xeab44400  ! 421: STHA_R	stha	%r21, [%r17 + %r0] 0x20
	.word 0xe897e000  ! 422: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe0840400  ! 423: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r16
	.word 0xec972000  ! 424: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 425: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecdde000  ! 426: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r22
	mov	0x20, %r24
	.word 0xeca544a0  ! 428: STWA_R	stwa	%r22, [%r21 + %r0] 0x25
	.word 0x87802020  ! 429: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 430: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xea9c4400  ! 431: LDDA_R	ldda	[%r17, %r0] 0x20, %r21
	.word 0xeaacc400  ! 432: STBA_R	stba	%r21, [%r19 + %r0] 0x20
	.word 0x87802020  ! 433: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeebfa000  ! 434: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	mov	0x7f0, %r22
	.word 0xeef76000  ! 436: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0x87802073  ! 437: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x10, %r19
	.word 0xeebfa000  ! 439: STDA_I	stda	%r23, [%r30 + 0x0000] %asi
	mov	0x10, %r24
	.word 0xeebfe000  ! 441: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	mov	0x0, %r18
	.word 0xeeaf2000  ! 443: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	.word 0xeef72000  ! 444: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xecdd04a0  ! 445: LDXA_R	ldxa	[%r20, %r0] 0x25, %r22
	.word 0xe6d72000  ! 446: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r19
	.word 0x87802020  ! 447: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 448: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802073  ! 449: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6b76000  ! 450: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xeeb70e80  ! 451: STHA_R	stha	%r23, [%r28 + %r0] 0x74
	.word 0x87802020  ! 452: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeaaf0e80  ! 453: STBA_R	stba	%r21, [%r28 + %r0] 0x74
	.word 0x87802025  ! 454: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeea72000  ! 455: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xec9c4400  ! 456: LDDA_R	ldda	[%r17, %r0] 0x20, %r22
	.word 0x87802020  ! 457: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r26
	mov	0x3d0, %r22
	.word 0xe0d72000  ! 460: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0xe89fce60  ! 461: LDDA_R	ldda	[%r31, %r0] 0x73, %r20
	.word 0xe6c76000  ! 462: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r19
	mov	0x40, %r19
	.word 0xe8bc8400  ! 464: STDA_R	stda	%r20, [%r18 + %r0] 0x20
	.word 0xe0c70e80  ! 465: LDSWA_R	ldswa	[%r28, %r0] 0x74, %r16
	.word 0xe0cc8400  ! 466: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4f76000  ! 468: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xe4c7a000  ! 469: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r18
	.word 0xe4b4c400  ! 470: STHA_R	stha	%r18, [%r19 + %r0] 0x20
	.word 0xe8a76000  ! 471: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0xecad04a0  ! 472: STBA_R	stba	%r22, [%r20 + %r0] 0x25
	.word 0xeeaf6000  ! 473: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	mov	0x3c8, %r21
	.word 0x87802020  ! 475: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3f8, %r21
	mov	0x40, %r16
	.word 0xeed52000  ! 478: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r23
	.word 0xeea56000  ! 479: STWA_I	stwa	%r23, [%r21 + 0x0000] %asi
	.word 0xecddc4a0  ! 480: LDXA_R	ldxa	[%r23, %r0] 0x25, %r22
	mov	0x68, %r16
	.word 0xe4bc0400  ! 482: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	mov	0x20, %r17
	.word 0xea95e000  ! 484: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r21
	.word 0xeabd6000  ! 485: STDA_I	stda	%r21, [%r21 + 0x0000] %asi
	.word 0xeacd2000  ! 486: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r21
	.word 0xeaade000  ! 487: STBA_I	stba	%r21, [%r23 + 0x0000] %asi
	mov	0x3f8, %r21
	.word 0xeacda000  ! 489: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r21
	.word 0x87802025  ! 490: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeab72000  ! 491: STHA_I	stha	%r21, [%r28 + 0x0000] %asi
	.word 0xead7a000  ! 492: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r21
	.word 0xe2a7ce40  ! 493: STWA_R	stwa	%r17, [%r31 + %r0] 0x72
	.word 0xe4f40400  ! 494: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	.word 0xeecf6000  ! 495: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r23
	.word 0xe2c4c400  ! 496: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r17
	.word 0xec8f6000  ! 497: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r22
	.word 0xe0ce49e0  ! 498: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r16
	.word 0xe8c7ce60  ! 499: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r20
	mov	0x40, %r16
	.word 0xe0af0e80  ! 501: STBA_R	stba	%r16, [%r28 + %r0] 0x74
	mov	0x60, %r25
	.word 0xea9ec9e0  ! 503: LDDA_R	ldda	[%r27, %r0] 0x4f, %r21
	.word 0x87802020  ! 504: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b48400  ! 505: STHA_R	stha	%r17, [%r18 + %r0] 0x20
	.word 0xeabc4400  ! 506: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0x8780204f  ! 507: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4a4c400  ! 508: STWA_R	stwa	%r18, [%r19 + %r0] 0x20
	.word 0xe697a000  ! 509: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
	.word 0xe6a7a000  ! 510: STWA_I	stwa	%r19, [%r30 + 0x0000] %asi
	.word 0xe6bfa000  ! 511: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	.word 0xe2f78e40  ! 512: STXA_R	stxa	%r17, [%r30 + %r0] 0x72
	.word 0xee9c0400  ! 513: LDDA_R	ldda	[%r16, %r0] 0x20, %r23
	.word 0xe8a76000  ! 514: STWA_I	stwa	%r20, [%r29 + 0x0000] %asi
	.word 0x87802020  ! 515: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f72000  ! 516: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe0bcc400  ! 517: STDA_R	stda	%r16, [%r19 + %r0] 0x20
	.word 0xe4d78e60  ! 518: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r18
	.word 0xe0c76000  ! 519: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r16
	.word 0xe8dd44a0  ! 520: LDXA_R	ldxa	[%r21, %r0] 0x25, %r20
	.word 0xeca76000  ! 521: STWA_I	stwa	%r22, [%r29 + 0x0000] %asi
	.word 0xecd4c400  ! 522: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	mov	0x7c0, %r23
	.word 0xe8b74e60  ! 524: STHA_R	stha	%r20, [%r29 + %r0] 0x73
	.word 0x87802072  ! 525: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6976000  ! 526: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r19
	.word 0x87802020  ! 527: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f7a000  ! 528: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xe6cf2000  ! 529: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r19
	.word 0xe08e49e0  ! 530: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r16
	.word 0xeeaec9e0  ! 531: STBA_R	stba	%r23, [%r27 + %r0] 0x4f
	.word 0xeacf4e40  ! 532: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r21
	.word 0xead76000  ! 533: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xe4b504a0  ! 534: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	.word 0xe69e09e0  ! 535: LDDA_R	ldda	[%r24, %r0] 0x4f, %r19
	.word 0xecaf6000  ! 536: STBA_I	stba	%r22, [%r29 + 0x0000] %asi
	.word 0xecc72000  ! 537: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r22
	.word 0xe697ce60  ! 538: LDUHA_R	lduha	[%r31, %r0] 0x73, %r19
	.word 0xe095c4a0  ! 539: LDUHA_R	lduha	[%r23, %r0] 0x25, %r16
	mov	0x7c0, %r23
	.word 0xe6df0e80  ! 541: LDXA_R	ldxa	[%r28, %r0] 0x74, %r19
	.word 0xe49c0400  ! 542: LDDA_R	ldda	[%r16, %r0] 0x20, %r18
	.word 0xe6bc0400  ! 543: STDA_R	stda	%r19, [%r16 + %r0] 0x20
	.word 0xe2f72000  ! 544: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 545: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeca78e60  ! 546: STWA_R	stwa	%r22, [%r30 + %r0] 0x73
	.word 0xe0cf4e60  ! 547: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r16
	.word 0xe08584a0  ! 548: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r16
	mov	0x3c8, %r23
	.word 0xe8c5a000  ! 550: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r20
	.word 0xe8f52000  ! 551: STXA_I	stxa	%r20, [%r20 + 0x0000] %asi
	.word 0xecc5c4a0  ! 552: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r22
	.word 0xe4dd44a0  ! 553: LDXA_R	ldxa	[%r21, %r0] 0x25, %r18
	.word 0xe8dde000  ! 554: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r20
	.word 0xe2df0e40  ! 555: LDXA_R	ldxa	[%r28, %r0] 0x72, %r17
	.word 0xea95a000  ! 556: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r21
	.word 0xeaa5a000  ! 557: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0x87802020  ! 558: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b70e80  ! 559: STHA_R	stha	%r19, [%r28 + %r0] 0x74
	mov	0x50, %r24
	.word 0xe8970e60  ! 561: LDUHA_R	lduha	[%r28, %r0] 0x73, %r20
	.word 0xe68d2000  ! 562: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r19
	.word 0x87802020  ! 563: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 564: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe687a000  ! 565: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r19
	.word 0xe68f6000  ! 566: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r19
	.word 0xe4dd44a0  ! 567: LDXA_R	ldxa	[%r21, %r0] 0x25, %r18
	.word 0xe8f76000  ! 568: STXA_I	stxa	%r20, [%r29 + 0x0000] %asi
	.word 0xe8f7e000  ! 569: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	mov	0x10, %r16
	.word 0xe0a70e80  ! 571: STWA_R	stwa	%r16, [%r28 + %r0] 0x74
	.word 0xe0ac0400  ! 572: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	mov	0x68, %r18
	.word 0x87802074  ! 574: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe48544a0  ! 575: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r18
	.word 0xe89c0400  ! 576: LDDA_R	ldda	[%r16, %r0] 0x20, %r20
	.word 0xe4976000  ! 577: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r18
	mov	0x40, %r27
	.word 0xe6b689e0  ! 579: STHA_R	stha	%r19, [%r26 + %r0] 0x4f
	.word 0xe6b76000  ! 580: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	mov	0x40, %r19
	.word 0xe2970e80  ! 582: LDUHA_R	lduha	[%r28, %r0] 0x74, %r17
	.word 0x87802074  ! 583: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2bdc4a0  ! 584: STDA_R	stda	%r17, [%r23 + %r0] 0x25
	.word 0xe29cc400  ! 585: LDDA_R	ldda	[%r19, %r0] 0x20, %r17
	.word 0xeead44a0  ! 586: STBA_R	stba	%r23, [%r21 + %r0] 0x25
	.word 0xeaa5a000  ! 587: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	mov	0x40, %r26
	mov	0x78, %r16
	.word 0xea9de000  ! 590: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r21
	mov	0x68, %r25
	mov	0x10, %r25
	.word 0xea9de000  ! 593: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r21
	.word 0xeebc0400  ! 594: STDA_R	stda	%r23, [%r16 + %r0] 0x20
	.word 0xe4bf0e40  ! 595: STDA_R	stda	%r18, [%r28 + %r0] 0x72
	.word 0x8780204f  ! 596: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 597: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeeb584a0  ! 598: STHA_R	stha	%r23, [%r22 + %r0] 0x25
	.word 0x87802020  ! 599: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab544a0  ! 600: STHA_R	stha	%r21, [%r21 + %r0] 0x25
	mov	0x10, %r17
	.word 0xea9ee000  ! 602: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r21
	.word 0xea86a000  ! 603: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r21
	.word 0xeaaea000  ! 604: STBA_I	stba	%r21, [%r26 + 0x0000] %asi
	.word 0x8780204f  ! 605: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab66000  ! 606: STHA_I	stha	%r21, [%r25 + 0x0000] %asi
	.word 0xea86e000  ! 607: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r21
	.word 0xe4f544a0  ! 608: STXA_R	stxa	%r18, [%r21 + %r0] 0x25
	.word 0x87802025  ! 609: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6af0e80  ! 610: STBA_R	stba	%r19, [%r28 + %r0] 0x74
	mov	0x38, %r27
	.word 0xe8ac6000  ! 612: STBA_I	stba	%r20, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 613: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0a584a0  ! 614: STWA_R	stwa	%r16, [%r22 + %r0] 0x25
	.word 0x87802072  ! 615: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 616: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0a584a0  ! 617: STWA_R	stwa	%r16, [%r22 + %r0] 0x25
	mov	0x20, %r16
	.word 0xeadfce40  ! 619: LDXA_R	ldxa	[%r31, %r0] 0x72, %r21
	mov	0x7c0, %r20
	mov	0x3c8, %r20
	.word 0xe2c6a000  ! 622: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r17
	.word 0xe2b62000  ! 623: STHA_I	stha	%r17, [%r24 + 0x0000] %asi
	.word 0xe2b62000  ! 624: STHA_I	stha	%r17, [%r24 + 0x0000] %asi
	.word 0x87802073  ! 625: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe2976000  ! 626: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0xe2a7e000  ! 627: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0xe4f48400  ! 628: STXA_R	stxa	%r18, [%r18 + %r0] 0x20
	.word 0xe4876000  ! 629: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	mov	0x7e0, %r20
	.word 0xeea44400  ! 631: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	.word 0xe6b72000  ! 632: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xe0ce49e0  ! 633: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r16
	.word 0xe2f7e000  ! 634: STXA_I	stxa	%r17, [%r31 + 0x0000] %asi
	mov	0x38, %r18
	mov	0x78, %r26
	.word 0xe4bf4e80  ! 637: STDA_R	stda	%r18, [%r29 + %r0] 0x74
	mov	0x78, %r26
	.word 0x87802072  ! 639: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x8, %r18
	.word 0xeeafe000  ! 641: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 642: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeef7ce60  ! 643: STXA_R	stxa	%r23, [%r31 + %r0] 0x73
	mov	0x50, %r25
	.word 0xe2dc0400  ! 645: LDXA_R	ldxa	[%r16, %r0] 0x20, %r17
	mov	0x40, %r25
	.word 0xe095a000  ! 647: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r16
	.word 0xe0cd2000  ! 648: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r16
	.word 0xe0bde000  ! 649: STDA_I	stda	%r16, [%r23 + 0x0000] %asi
	.word 0xe085a000  ! 650: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r16
	.word 0xe0ade000  ! 651: STBA_I	stba	%r16, [%r23 + 0x0000] %asi
	.word 0x87802025  ! 652: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x38, %r25
	.word 0xe0f52000  ! 654: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0f5a000  ! 655: STXA_I	stxa	%r16, [%r22 + 0x0000] %asi
	.word 0xe0f52000  ! 656: STXA_I	stxa	%r16, [%r20 + 0x0000] %asi
	.word 0xe0b5a000  ! 657: STHA_I	stha	%r16, [%r22 + 0x0000] %asi
	.word 0xe2a609e0  ! 658: STWA_R	stwa	%r17, [%r24 + %r0] 0x4f
	.word 0xeacd6000  ! 659: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r21
	.word 0xe0af0e40  ! 660: STBA_R	stba	%r16, [%r28 + %r0] 0x72
	.word 0xeaa5a000  ! 661: STWA_I	stwa	%r21, [%r22 + 0x0000] %asi
	.word 0xeaad2000  ! 662: STBA_I	stba	%r21, [%r20 + 0x0000] %asi
	.word 0xeab5e000  ! 663: STHA_I	stha	%r21, [%r23 + 0x0000] %asi
	mov	0x40, %r24
	.word 0xe6ad44a0  ! 665: STBA_R	stba	%r19, [%r21 + %r0] 0x25
	mov	0x50, %r24
	.word 0xe4c5c4a0  ! 667: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r18
	.word 0xec9f8e60  ! 668: LDDA_R	ldda	[%r30, %r0] 0x73, %r22
	.word 0xeab5a000  ! 669: STHA_I	stha	%r21, [%r22 + 0x0000] %asi
	.word 0x87802072  ! 670: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeab42000  ! 671: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	.word 0xecb7ce60  ! 672: STHA_R	stha	%r22, [%r31 + %r0] 0x73
	.word 0xe4f4e000  ! 673: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	.word 0xe48ca000  ! 674: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r18
	.word 0x87802073  ! 675: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x3f0, %r20
	.word 0xe4dee000  ! 677: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r18
	mov	0x7d0, %r23
	.word 0x87802020  ! 679: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 680: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8f44400  ! 681: STXA_R	stxa	%r20, [%r17 + %r0] 0x20
	mov	0x58, %r17
	mov	0x7f0, %r21
	mov	0x3f0, %r20
	mov	0x78, %r19
	.word 0xee9f4e40  ! 686: LDDA_R	ldda	[%r29, %r0] 0x72, %r23
	.word 0x87802073  ! 687: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecf44400  ! 688: STXA_R	stxa	%r22, [%r17 + %r0] 0x20
	.word 0xe6f76000  ! 689: STXA_I	stxa	%r19, [%r29 + 0x0000] %asi
	.word 0xeab689e0  ! 690: STHA_R	stha	%r21, [%r26 + %r0] 0x4f
	.word 0xeacf0e80  ! 691: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r21
	.word 0xe8c40400  ! 692: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r20
	.word 0xe6af0e80  ! 693: STBA_R	stba	%r19, [%r28 + %r0] 0x74
	.word 0xee97e000  ! 694: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r23
	.word 0xeed7e000  ! 695: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0x87802074  ! 696: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 697: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4f40400  ! 698: STXA_R	stxa	%r18, [%r16 + %r0] 0x20
	.word 0xee8d84a0  ! 699: LDUBA_R	lduba	[%r22, %r0] 0x25, %r23
	.word 0x8780204f  ! 700: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d0, %r22
	.word 0xe2f7ce80  ! 702: STXA_R	stxa	%r17, [%r31 + %r0] 0x74
	mov	0x8, %r24
	.word 0xecb40400  ! 704: STHA_R	stha	%r22, [%r16 + %r0] 0x20
	.word 0x87802020  ! 705: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b7e000  ! 706: STHA_I	stha	%r19, [%r31 + 0x0000] %asi
	mov	0x50, %r16
	.word 0x8780204f  ! 708: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0944400  ! 709: LDUHA_R	lduha	[%r17, %r0] 0x20, %r16
	.word 0x87802072  ! 710: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe88ce000  ! 711: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r20
	.word 0xe2acc400  ! 712: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0xe8bce000  ! 713: STDA_I	stda	%r20, [%r19 + 0x0000] %asi
	mov	0x30, %r25
	.word 0xe88d04a0  ! 715: LDUBA_R	lduba	[%r20, %r0] 0x25, %r20
	.word 0xecb504a0  ! 716: STHA_R	stha	%r22, [%r20 + %r0] 0x25
	.word 0xecb74e40  ! 717: STHA_R	stha	%r22, [%r29 + %r0] 0x72
	mov	0x48, %r25
	.word 0xe0cca000  ! 719: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r16
	.word 0xe0a46000  ! 720: STWA_I	stwa	%r16, [%r17 + 0x0000] %asi
	mov	0x60, %r17
	mov	0x3f8, %r20
	mov	0x0, %r16
	.word 0xecaf0e80  ! 724: STBA_R	stba	%r22, [%r28 + %r0] 0x74
	mov	0x7e0, %r22
	.word 0xeaf4a000  ! 726: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0xec8fce80  ! 727: LDUBA_R	lduba	[%r31, %r0] 0x74, %r22
	mov	0x50, %r24
	.word 0xe685c4a0  ! 729: LDUWA_R	lduwa	[%r23, %r0] 0x25, %r19
	.word 0xe884a000  ! 730: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r20
	.word 0xe8bc6000  ! 731: STDA_I	stda	%r20, [%r17 + 0x0000] %asi
	.word 0xe28f4e40  ! 732: LDUBA_R	lduba	[%r29, %r0] 0x72, %r17
	.word 0xe29c4400  ! 733: LDDA_R	ldda	[%r17, %r0] 0x20, %r17
	.word 0xe8df8e40  ! 734: LDXA_R	ldxa	[%r30, %r0] 0x72, %r20
	.word 0xe8dce000  ! 735: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r20
	mov	0x10, %r17
	mov	0x18, %r18
	.word 0xe894a000  ! 738: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xe8f46000  ! 739: STXA_I	stxa	%r20, [%r17 + 0x0000] %asi
	mov	0x20, %r16
	.word 0xeccfce60  ! 741: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r22
	.word 0xeea4a000  ! 742: STWA_I	stwa	%r23, [%r18 + 0x0000] %asi
	.word 0xeea40400  ! 743: STWA_R	stwa	%r23, [%r16 + %r0] 0x20
	mov	0x18, %r25
	.word 0x87802025  ! 745: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0bce000  ! 746: STDA_I	stda	%r16, [%r19 + 0x0000] %asi
	.word 0x87802025  ! 747: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe0bca000  ! 748: STDA_I	stda	%r16, [%r18 + 0x0000] %asi
	.word 0xe6b504a0  ! 749: STHA_R	stha	%r19, [%r20 + %r0] 0x25
	mov	0x38, %r27
	.word 0xe88fce80  ! 751: LDUBA_R	lduba	[%r31, %r0] 0x74, %r20
	mov	0x48, %r18
	.word 0xe69ca000  ! 753: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r19
	.word 0xecb7ce40  ! 754: STHA_R	stha	%r22, [%r31 + %r0] 0x72
	.word 0xecb42000  ! 755: STHA_I	stha	%r22, [%r16 + 0x0000] %asi
	mov	0x28, %r25
	.word 0xe6878e40  ! 757: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r19
	mov	0x7c8, %r23
	.word 0xeca46000  ! 759: STWA_I	stwa	%r22, [%r17 + 0x0000] %asi
	.word 0xecf78e80  ! 760: STXA_R	stxa	%r22, [%r30 + %r0] 0x74
	.word 0x87802020  ! 761: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8be09e0  ! 762: STDA_R	stda	%r20, [%r24 + %r0] 0x4f
	.word 0xe8a504a0  ! 763: STWA_R	stwa	%r20, [%r20 + %r0] 0x25
	mov	0x78, %r24
	.word 0x8780204f  ! 765: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4afe000  ! 766: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	mov	0x58, %r25
	.word 0xe4afa000  ! 768: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xe4b504a0  ! 769: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	.word 0xe88fce40  ! 770: LDUBA_R	lduba	[%r31, %r0] 0x72, %r20
	.word 0x87802073  ! 771: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeccfa000  ! 772: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r22
	.word 0xecbfe000  ! 773: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	.word 0xeabf8e60  ! 774: STDA_R	stda	%r21, [%r30 + %r0] 0x73
	.word 0xeef74e80  ! 775: STXA_R	stxa	%r23, [%r29 + %r0] 0x74
	.word 0x87802072  ! 776: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeedf4e60  ! 777: LDXA_R	ldxa	[%r29, %r0] 0x73, %r23
	mov	0x7c0, %r23
	mov	0x58, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802020  ! 781: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7f8, %r23
	.word 0xe2a6c9e0  ! 783: STWA_R	stwa	%r17, [%r27 + %r0] 0x4f
	mov	0x7e8, %r20
	mov	0x38, %r25
	mov	0x40, %r24
	mov	0x3d8, %r20
	.word 0x87802074  ! 788: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6876000  ! 789: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r19
	mov	0x68, %r19
	.word 0xe6df2000  ! 791: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r19
	.word 0xe6cfe000  ! 792: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	mov	0x0, %r24
	mov	0x68, %r19
	.word 0xecbf8e40  ! 795: STDA_R	stda	%r22, [%r30 + %r0] 0x72
	.word 0xe4f44400  ! 796: STXA_R	stxa	%r18, [%r17 + %r0] 0x20
	.word 0xeef72000  ! 797: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	.word 0xee9fa000  ! 798: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r23
	mov	0x7d8, %r20
	.word 0xeedf2000  ! 800: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r23
	mov	0x3d0, %r22
	mov	0x10, %r24
	mov	0x7d0, %r23
	.word 0xecaf0e80  ! 804: STBA_R	stba	%r22, [%r28 + %r0] 0x74
	mov	0x68, %r25
	.word 0xecf7a000  ! 806: STXA_I	stxa	%r22, [%r30 + 0x0000] %asi
	.word 0xe6c544a0  ! 807: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r19
	mov	0x30, %r25
	.word 0xe4dd04a0  ! 809: LDXA_R	ldxa	[%r20, %r0] 0x25, %r18
	.word 0xe0bfa000  ! 810: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0b76000  ! 811: STHA_I	stha	%r16, [%r29 + 0x0000] %asi
	.word 0xeccdc4a0  ! 812: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r22
	mov	0x48, %r27
	mov	0x8, %r18
	.word 0xeadf0e80  ! 815: LDXA_R	ldxa	[%r28, %r0] 0x74, %r21
	.word 0xeaaf0e40  ! 816: STBA_R	stba	%r21, [%r28 + %r0] 0x72
	.word 0xe2c7e000  ! 817: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0x87802074  ! 818: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 819: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8b7ce80  ! 820: STHA_R	stha	%r20, [%r31 + %r0] 0x74
	.word 0xeead2000  ! 821: STBA_I	stba	%r23, [%r20 + 0x0000] %asi
	.word 0xee9de000  ! 822: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r23
	.word 0xe49d04a0  ! 823: LDDA_R	ldda	[%r20, %r0] 0x25, %r18
	mov	0x20, %r18
	.word 0x87802020  ! 825: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 826: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 827: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 828: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeab7ce60  ! 829: STHA_R	stha	%r21, [%r31 + %r0] 0x73
	mov	0x50, %r19
	.word 0xe4af4e60  ! 831: STBA_R	stba	%r18, [%r29 + %r0] 0x73
	.word 0xe8c4e000  ! 832: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r20
	.word 0xea8ec9e0  ! 833: LDUBA_R	lduba	[%r27, %r0] 0x4f, %r21
	.word 0xead4a000  ! 834: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xe09f4e40  ! 835: LDDA_R	ldda	[%r29, %r0] 0x72, %r16
	.word 0xeabca000  ! 836: STDA_I	stda	%r21, [%r18 + 0x0000] %asi
	.word 0xeece49e0  ! 837: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r23
	.word 0xe0cca000  ! 838: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r16
	.word 0x8780204f  ! 839: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0a66000  ! 840: STWA_I	stwa	%r16, [%r25 + 0x0000] %asi
	.word 0x87802074  ! 841: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe09ce000  ! 842: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r16
	mov	0x78, %r17
	mov	0x28, %r24
	mov	0x40, %r26
	mov	0x48, %r25
	mov	0x7e8, %r22
	mov	0x30, %r19
	.word 0xe0c42000  ! 849: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r16
	.word 0x87802025  ! 850: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x10, %r26
	mov	0x40, %r25
	.word 0xe0cfa000  ! 853: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r16
	.word 0x87802072  ! 854: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x78, %r25
	.word 0xe4c7ce40  ! 856: LDSWA_R	ldswa	[%r31, %r0] 0x72, %r18
	mov	0x38, %r27
	.word 0x87802020  ! 858: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 859: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 860: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecbf2000  ! 861: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xe2f44400  ! 862: STXA_R	stxa	%r17, [%r17 + %r0] 0x20
	mov	0x50, %r17
	.word 0xeeb7a000  ! 864: STHA_I	stha	%r23, [%r30 + 0x0000] %asi
	.word 0xee9f6000  ! 865: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r23
	mov	0x7d0, %r20
	.word 0xe2b78e80  ! 867: STHA_R	stha	%r17, [%r30 + %r0] 0x74
	mov	0x30, %r27
	.word 0xe6f72000  ! 869: STXA_I	stxa	%r19, [%r28 + 0x0000] %asi
	.word 0xe6c72000  ! 870: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r19
	.word 0x87802025  ! 871: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe697a000  ! 872: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
	.word 0xecac0400  ! 873: STBA_R	stba	%r22, [%r16 + %r0] 0x20
	mov	0x50, %r18
	.word 0x87802020  ! 875: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8d44400  ! 876: LDSHA_R	ldsha	[%r17, %r0] 0x20, %r20
	.word 0x87802025  ! 877: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2f70e60  ! 878: STXA_R	stxa	%r17, [%r28 + %r0] 0x73
	.word 0xe494c400  ! 879: LDUHA_R	lduha	[%r19, %r0] 0x20, %r18
	.word 0xe88d44a0  ! 880: LDUBA_R	lduba	[%r21, %r0] 0x25, %r20
	.word 0xe6a544a0  ! 881: STWA_R	stwa	%r19, [%r21 + %r0] 0x25
	.word 0xe49609e0  ! 882: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r18
	.word 0x87802020  ! 883: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d76000  ! 884: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xee948400  ! 885: LDUHA_R	lduha	[%r18, %r0] 0x20, %r23
	.word 0xe4f76000  ! 886: STXA_I	stxa	%r18, [%r29 + 0x0000] %asi
	.word 0xeabf4e80  ! 887: STDA_R	stda	%r21, [%r29 + %r0] 0x74
	.word 0xe0bf8e40  ! 888: STDA_R	stda	%r16, [%r30 + %r0] 0x72
	.word 0xeac40400  ! 889: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r21
	.word 0xe68cc400  ! 890: LDUBA_R	lduba	[%r19, %r0] 0x20, %r19
	.word 0xe29fa000  ! 891: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r17
	.word 0xeadd04a0  ! 892: LDXA_R	ldxa	[%r20, %r0] 0x25, %r21
	.word 0xee97a000  ! 893: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r23
	.word 0xe48c4400  ! 894: LDUBA_R	lduba	[%r17, %r0] 0x20, %r18
	.word 0xee9f8e80  ! 895: LDDA_R	ldda	[%r30, %r0] 0x74, %r23
	.word 0xe49dc4a0  ! 896: LDDA_R	ldda	[%r23, %r0] 0x25, %r18
	.word 0xeecf2000  ! 897: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0xe8a74e80  ! 898: STWA_R	stwa	%r20, [%r29 + %r0] 0x74
	.word 0xeef7a000  ! 899: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xe8a40400  ! 900: STWA_R	stwa	%r20, [%r16 + %r0] 0x20
	.word 0x87802020  ! 901: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e0, %r20
	.word 0x8780204f  ! 903: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 904: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x30, %r16
	mov	0x3e0, %r23
	mov	0x78, %r19
	mov	0x18, %r17
	.word 0xe4cec9e0  ! 909: LDSBA_R	ldsba	[%r27, %r0] 0x4f, %r18
	.word 0x87802072  ! 910: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecb4a000  ! 911: STHA_I	stha	%r22, [%r18 + 0x0000] %asi
	.word 0xeac689e0  ! 912: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r21
	.word 0xe48f0e60  ! 913: LDUBA_R	lduba	[%r28, %r0] 0x73, %r18
	.word 0xe4f7ce40  ! 914: STXA_R	stxa	%r18, [%r31 + %r0] 0x72
	.word 0xe2f4a000  ! 915: STXA_I	stxa	%r17, [%r18 + 0x0000] %asi
	.word 0xe2bc2000  ! 916: STDA_I	stda	%r17, [%r16 + 0x0000] %asi
	mov	0x78, %r16
	.word 0xe6af8e80  ! 918: STBA_R	stba	%r19, [%r30 + %r0] 0x74
	mov	0x3e8, %r22
	.word 0xe0a7ce80  ! 920: STWA_R	stwa	%r16, [%r31 + %r0] 0x74
	.word 0xe8b44400  ! 921: STHA_R	stha	%r20, [%r17 + %r0] 0x20
	.word 0xe4b48400  ! 922: STHA_R	stha	%r18, [%r18 + %r0] 0x20
	.word 0xecbcc400  ! 923: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0xe6f48400  ! 924: STXA_R	stxa	%r19, [%r18 + %r0] 0x20
	.word 0xea9c0400  ! 925: LDDA_R	ldda	[%r16, %r0] 0x20, %r21
	mov	0x38, %r27
	.word 0xeca4a000  ! 927: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0xeccca000  ! 928: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	.word 0xeaf584a0  ! 929: STXA_R	stxa	%r21, [%r22 + %r0] 0x25
	mov	0x7c8, %r20
	.word 0xe2b42000  ! 931: STHA_I	stha	%r17, [%r16 + 0x0000] %asi
	mov	0x40, %r16
	.word 0xeea7ce40  ! 933: STWA_R	stwa	%r23, [%r31 + %r0] 0x72
	.word 0xeecc0400  ! 934: LDSBA_R	ldsba	[%r16, %r0] 0x20, %r23
	.word 0xe2d42000  ! 935: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r17
	.word 0xe2846000  ! 936: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r17
	.word 0xe484c400  ! 937: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r18
	.word 0xe6bca000  ! 938: STDA_I	stda	%r19, [%r18 + 0x0000] %asi
	.word 0xe6b4a000  ! 939: STHA_I	stha	%r19, [%r18 + 0x0000] %asi
	mov	0x28, %r18
	mov	0x7e0, %r20
	.word 0xe6dc2000  ! 942: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r19
	mov	0x10, %r24
	mov	0x30, %r19
	mov	0x68, %r17
	.word 0xe6b46000  ! 946: STHA_I	stha	%r19, [%r17 + 0x0000] %asi
	.word 0xe694a000  ! 947: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r19
	.word 0x87802020  ! 948: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe49f8e80  ! 949: LDDA_R	ldda	[%r30, %r0] 0x74, %r18
	mov	0x7e8, %r22
	.word 0xeed504a0  ! 951: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r23
	.word 0xe2d76000  ! 952: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r17
	.word 0xeac649e0  ! 953: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r21
	.word 0xe4afa000  ! 954: STBA_I	stba	%r18, [%r30 + 0x0000] %asi
	.word 0xe497e000  ! 955: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	mov	0x3f0, %r23
	mov	0x7f8, %r20
	.word 0xeec544a0  ! 958: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r23
	.word 0xea9f6000  ! 959: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r21
	.word 0xeadfa000  ! 960: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r21
	.word 0xead76000  ! 961: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0xeaafa000  ! 962: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xe6840400  ! 963: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r19
	mov	0x8, %r19
	.word 0xecbc4400  ! 965: STDA_R	stda	%r22, [%r17 + %r0] 0x20
	mov	0x8, %r16
	.word 0xe4ce49e0  ! 967: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r18
	.word 0x87802020  ! 968: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2d649e0  ! 969: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r17
	mov	0x3f8, %r23
	.word 0x8780204f  ! 971: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x28, %r27
	mov	0x70, %r19
	.word 0xee8dc4a0  ! 974: LDUBA_R	lduba	[%r23, %r0] 0x25, %r23
	mov	0x68, %r18
	.word 0xea97e000  ! 976: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xeaa7a000  ! 977: STWA_I	stwa	%r21, [%r30 + 0x0000] %asi
	.word 0x87802072  ! 978: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 979: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeab42000  ! 980: STHA_I	stha	%r21, [%r16 + 0x0000] %asi
	mov	0x0, %r17
	mov	0x40, %r19
	.word 0xeaaca000  ! 983: STBA_I	stba	%r21, [%r18 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	mov	0x78, %r26
	.word 0xead4a000  ! 986: LDSHA_I	ldsha	[%r18, + 0x0000] %asi, %r21
	.word 0xeab46000  ! 987: STHA_I	stha	%r21, [%r17 + 0x0000] %asi
	mov	0x20, %r27
	.word 0xeac4e000  ! 989: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r21
	.word 0xea8c2000  ! 990: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	.word 0x87802025  ! 991: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x70, %r26
	.word 0xeaaee000  ! 993: STBA_I	stba	%r21, [%r27 + 0x0000] %asi
	.word 0x87802025  ! 994: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac5a000  ! 995: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r21
	mov	0x3c8, %r23
	.word 0xeaa78e80  ! 997: STWA_R	stwa	%r21, [%r30 + %r0] 0x74
	.word 0xe6a40400  ! 998: STWA_R	stwa	%r19, [%r16 + %r0] 0x20
	mov	0x3d0, %r23

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
