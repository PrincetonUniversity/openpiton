// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asi_access_1_rand_s2.s
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
   random seed:	953002929
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

	setx 0xd35a1fe694a83b49, %g1, %g0
	setx 0xdfb7d00b4b2574ee, %g1, %g1
	setx 0x497cde8c63515239, %g1, %g2
	setx 0xef2969d3c8965e24, %g1, %g3
	setx 0x2405883b3517eb93, %g1, %g4
	setx 0x092d81b153b76f00, %g1, %g5
	setx 0x55e62cedcc60064d, %g1, %g6
	setx 0xe788407317d8e3f8, %g1, %g7
	setx 0x3d4632c35f95562b, %g1, %r16
	setx 0x2bd5192b383b6e4d, %g1, %r17
	setx 0xc2274b8c52ee5eca, %g1, %r18
	setx 0xac23a4bf39b45e36, %g1, %r19
	setx 0xde25508157c2ee67, %g1, %r20
	setx 0xd099cf1735aa958e, %g1, %r21
	setx 0x3a09091d6ee66366, %g1, %r22
	setx 0x0764bb921564f17b, %g1, %r23
	setx 0x1d32134291e10613, %g1, %r24
	setx 0x204263b98d2cb8e3, %g1, %r25
	setx 0xd5605fc9561f6043, %g1, %r26
	setx 0x5f2fc16ccd672a52, %g1, %r27
	setx 0xcd39ad7af9f0a926, %g1, %r28
	setx 0x9945198e05b80f01, %g1, %r29
	setx 0x071a3e2bdf4679f5, %g1, %r30
	setx 0xc617b818b5d4b576, %g1, %r31
	save
	setx 0x7a5e7ed0272f7881, %g1, %r16
	setx 0xbffb59b025118ff3, %g1, %r17
	setx 0x94928e5352677ee2, %g1, %r18
	setx 0x7468b1c696c8928e, %g1, %r19
	setx 0x6bee2fce47158dde, %g1, %r20
	setx 0xca33fe21587e3382, %g1, %r21
	setx 0x9b1a0193f5d50510, %g1, %r22
	setx 0x9701f73892d2e801, %g1, %r23
	setx 0xe5554a2694f54571, %g1, %r24
	setx 0x444f0c966bc0b821, %g1, %r25
	setx 0x083436d604acf370, %g1, %r26
	setx 0x7edfed6c4962d076, %g1, %r27
	setx 0xb53f1b4e2b1b0a3d, %g1, %r28
	setx 0x4df61963a59eab95, %g1, %r29
	setx 0x1b546c9180a613ca, %g1, %r30
	setx 0x30db9b52fd38c906, %g1, %r31
	save
	setx 0xb3898f86d9d6151c, %g1, %r16
	setx 0x7bc70ddc165b179a, %g1, %r17
	setx 0xdc3308d76e64ff1b, %g1, %r18
	setx 0x27ac8e550bd333d4, %g1, %r19
	setx 0xed594e40e64003f2, %g1, %r20
	setx 0x0b315d96b5292ab5, %g1, %r21
	setx 0x01594a21b22460eb, %g1, %r22
	setx 0x7cb1f42a181fbf71, %g1, %r23
	setx 0xa1822e62422d9c63, %g1, %r24
	setx 0x65c0da1665c7860c, %g1, %r25
	setx 0x274d7c16ede12e84, %g1, %r26
	setx 0x3a05afa40f78b886, %g1, %r27
	setx 0x0f4c831c2d9d671d, %g1, %r28
	setx 0xdc73f566b3c233ca, %g1, %r29
	setx 0xac54c9b86cc21afc, %g1, %r30
	setx 0x0d2c261286684c71, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x60, %r16
	mov	0x48, %r17
	mov	0x68, %r18
	mov	0x18, %r19
	mov	0x7e8, %r20
	mov	0x7c0, %r21
	mov	0x3e8, %r22
	mov	0x3f8, %r23
	mov	0x40, %r24
	mov	0x68, %r25
	mov	0x78, %r26
	mov	0x70, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x20, %asi
	stxa	%g0, [%g0] 0x42
	mov	0x38, %g1
	stxa	%g0, [%g1] 0x58
	.word 0xeaf4c400  ! 1: STXA_R	stxa	%r21, [%r19 + %r0] 0x20
	.word 0xeaf42000  ! 2: STXA_I	stxa	%r21, [%r16 + 0x0000] %asi
	.word 0xe0a5c4a0  ! 3: STWA_R	stwa	%r16, [%r23 + %r0] 0x25
	.word 0xe8c44400  ! 4: LDSWA_R	ldswa	[%r17, %r0] 0x20, %r20
	.word 0xe4ccc400  ! 5: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r18
	.word 0x87802020  ! 6: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb70e60  ! 7: STHA_R	stha	%r22, [%r28 + %r0] 0x73
	.word 0x8780204f  ! 8: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802072  ! 9: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe48f4e80  ! 10: LDUBA_R	lduba	[%r29, %r0] 0x74, %r18
	.word 0xe4b76000  ! 11: STHA_I	stha	%r18, [%r29 + 0x0000] %asi
	.word 0xe48fa000  ! 12: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0x87802020  ! 13: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x70, %r25
	.word 0xe4b46000  ! 15: STHA_I	stha	%r18, [%r17 + 0x0000] %asi
	.word 0xecc48400  ! 16: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r22
	.word 0xecace000  ! 17: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	mov	0x38, %r27
	.word 0xea9f4e40  ! 19: LDDA_R	ldda	[%r29, %r0] 0x72, %r21
	.word 0xeab4e000  ! 20: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	mov	0x70, %r18
	.word 0xe8a40400  ! 22: STWA_R	stwa	%r20, [%r16 + %r0] 0x20
	.word 0x87802073  ! 23: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaaf4e40  ! 24: STBA_R	stba	%r21, [%r29 + %r0] 0x72
	.word 0xeaf7a000  ! 25: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xeebf8e80  ! 26: STDA_R	stda	%r23, [%r30 + %r0] 0x74
	.word 0xeec72000  ! 27: LDSWA_I	ldswa	[%r28, + 0x0000] %asi, %r23
	.word 0x87802072  ! 28: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x60, %r19
	mov	0x48, %r19
	.word 0xeab78e40  ! 31: STHA_R	stha	%r21, [%r30 + %r0] 0x72
	.word 0xeaf7a000  ! 32: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xe4f70e60  ! 33: STXA_R	stxa	%r18, [%r28 + %r0] 0x73
	mov	0x50, %r25
	.word 0xe4df6000  ! 35: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4f7e000  ! 36: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0xe4f7e000  ! 37: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x3d8, %r21
	mov	0x20, %r26
	mov	0x3d8, %r22
	.word 0xe4a76000  ! 42: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0xe4cfa000  ! 43: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r18
	.word 0xe4afe000  ! 44: STBA_I	stba	%r18, [%r31 + 0x0000] %asi
	.word 0xee9f4e80  ! 45: LDDA_R	ldda	[%r29, %r0] 0x74, %r23
	.word 0xeca78e80  ! 46: STWA_R	stwa	%r22, [%r30 + %r0] 0x74
	.word 0xe29f0e80  ! 47: LDDA_R	ldda	[%r28, %r0] 0x74, %r17
	.word 0xe2f7a000  ! 48: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	mov	0x20, %r18
	mov	0x0, %r25
	mov	0x18, %r25
	.word 0x87802025  ! 52: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b56000  ! 53: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	.word 0xe08c4400  ! 54: LDUBA_R	lduba	[%r17, %r0] 0x20, %r16
	.word 0xe8c7ce60  ! 55: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r20
	mov	0x7c8, %r23
	.word 0x87802025  ! 57: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe88de000  ! 58: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r20
	mov	0x58, %r17
	.word 0x87802020  ! 60: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 61: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe88f6000  ! 62: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r20
	mov	0x18, %r16
	.word 0xecb70e40  ! 64: STHA_R	stha	%r22, [%r28 + %r0] 0x72
	.word 0xec8fa000  ! 65: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r22
	.word 0xecd76000  ! 66: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r22
	.word 0xeccfe000  ! 67: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r22
	.word 0xe8ccc400  ! 68: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r20
	mov	0x7e0, %r20
	.word 0xe8972000  ! 70: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r20
	mov	0x20, %r16
	.word 0xe8a7a000  ! 72: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xecc544a0  ! 73: LDSWA_R	ldswa	[%r21, %r0] 0x25, %r22
	.word 0x8780204f  ! 74: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecf62000  ! 75: STXA_I	stxa	%r22, [%r24 + 0x0000] %asi
	.word 0xecd6a000  ! 76: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r22
	mov	0x30, %r27
	.word 0xe4f48400  ! 78: STXA_R	stxa	%r18, [%r18 + %r0] 0x20
	.word 0xeef74e40  ! 79: STXA_R	stxa	%r23, [%r29 + %r0] 0x72
	.word 0xe4cdc4a0  ! 80: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r18
	.word 0x87802020  ! 81: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r24
	.word 0x8780204f  ! 83: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe88504a0  ! 84: LDUWA_R	lduwa	[%r20, %r0] 0x25, %r20
	.word 0x87802074  ! 85: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 86: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8d7a000  ! 87: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r20
	.word 0x87802074  ! 88: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8afe000  ! 89: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe4af4e60  ! 90: STBA_R	stba	%r18, [%r29 + %r0] 0x73
	mov	0x10, %r19
	.word 0x87802020  ! 92: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4b46000  ! 93: STHA_I	stha	%r18, [%r17 + 0x0000] %asi
	.word 0xe4bc6000  ! 94: STDA_I	stda	%r18, [%r17 + 0x0000] %asi
	.word 0x8780204f  ! 95: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x58, %r18
	.word 0xeabc0400  ! 97: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0xeadee000  ! 98: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r21
	.word 0xeac66000  ! 99: LDSWA_I	ldswa	[%r25, + 0x0000] %asi, %r21
	.word 0xea9ee000  ! 100: LDDA_I	ldda	[%r27, + 0x0000] %asi, %r21
	mov	0x48, %r24
	mov	0x3e0, %r21
	mov	0x3c8, %r22
	.word 0xe2b74e40  ! 104: STHA_R	stha	%r17, [%r29 + %r0] 0x72
	.word 0xec9fce80  ! 105: LDDA_R	ldda	[%r31, %r0] 0x74, %r22
	.word 0x87802072  ! 106: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802020  ! 107: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x68, %r17
	.word 0xecf46000  ! 109: STXA_I	stxa	%r22, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 110: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecdca000  ! 111: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r22
	.word 0xe0a7ce40  ! 112: STWA_R	stwa	%r16, [%r31 + %r0] 0x72
	.word 0xe0ac6000  ! 113: STBA_I	stba	%r16, [%r17 + 0x0000] %asi
	mov	0x48, %r26
	.word 0x87802020  ! 115: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe09c6000  ! 116: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r16
	mov	0x48, %r25
	.word 0xe0b4a000  ! 118: STHA_I	stha	%r16, [%r18 + 0x0000] %asi
	.word 0xe28c4400  ! 119: LDUBA_R	lduba	[%r17, %r0] 0x20, %r17
	.word 0xe09689e0  ! 120: LDUHA_R	lduha	[%r26, %r0] 0x4f, %r16
	.word 0xea9d04a0  ! 121: LDDA_R	ldda	[%r20, %r0] 0x25, %r21
	.word 0xeccc8400  ! 122: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r22
	.word 0x87802073  ! 123: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0a74e40  ! 124: STWA_R	stwa	%r16, [%r29 + %r0] 0x72
	mov	0x8, %r24
	.word 0xe4b689e0  ! 126: STHA_R	stha	%r18, [%r26 + %r0] 0x4f
	.word 0x8780204f  ! 127: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4dc8400  ! 128: LDXA_R	ldxa	[%r18, %r0] 0x20, %r18
	mov	0x38, %r19
	.word 0xe4b6a000  ! 130: STHA_I	stha	%r18, [%r26 + 0x0000] %asi
	.word 0xe09cc400  ! 131: LDDA_R	ldda	[%r19, %r0] 0x20, %r16
	.word 0xe0c6a000  ! 132: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r16
	.word 0xe0862000  ! 133: LDUWA_I	lduwa	[%r24, + 0x0000] %asi, %r16
	.word 0xeaf74e80  ! 134: STXA_R	stxa	%r21, [%r29 + %r0] 0x74
	.word 0xeab7ce60  ! 135: STHA_R	stha	%r21, [%r31 + %r0] 0x73
	.word 0xeab66000  ! 136: STHA_I	stha	%r21, [%r25 + 0x0000] %asi
	.word 0x87802073  ! 137: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf72000  ! 138: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	mov	0x8, %r27
	.word 0xe49504a0  ! 140: LDUHA_R	lduha	[%r20, %r0] 0x25, %r18
	.word 0xe4bf6000  ! 141: STDA_I	stda	%r18, [%r29 + 0x0000] %asi
	mov	0x3c8, %r23
	.word 0xecf48400  ! 143: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	.word 0xe2978e60  ! 144: LDUHA_R	lduha	[%r30, %r0] 0x73, %r17
	.word 0x87802072  ! 145: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 146: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x58, %r26
	.word 0xe2d609e0  ! 148: LDSHA_R	ldsha	[%r24, %r0] 0x4f, %r17
	mov	0x20, %r26
	.word 0xe28f2000  ! 150: LDUBA_I	lduba	[%r28, + 0x0000] %asi, %r17
	.word 0xe28fe000  ! 151: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0xead70e80  ! 152: LDSHA_R	ldsha	[%r28, %r0] 0x74, %r21
	.word 0xe6af0e60  ! 153: STBA_R	stba	%r19, [%r28 + %r0] 0x73
	.word 0xe687e000  ! 154: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r19
	mov	0x60, %r19
	.word 0xe6ccc400  ! 156: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r19
	.word 0xecf78e80  ! 157: STXA_R	stxa	%r22, [%r30 + %r0] 0x74
	mov	0x3e8, %r21
	wr_tick_cmpr_0:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0x88, %g2
	or	%g4, 0xfb, %g4
	or	%g6, 0xfb, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xecd7a000  ! 160: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r22
	mov	0x3d8, %r20
	.word 0xe8ad84a0  ! 162: STBA_R	stba	%r20, [%r22 + %r0] 0x25
	.word 0xe8f72000  ! 163: STXA_I	stxa	%r20, [%r28 + 0x0000] %asi
	.word 0xe8bfe000  ! 164: STDA_I	stda	%r20, [%r31 + 0x0000] %asi
	mov	0x3c8, %r23
	mov	0x30, %r18
	.word 0xe8dfa000  ! 167: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r20
	.word 0xe89fa000  ! 168: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r20
	.word 0xe8cfe000  ! 169: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe0b7ce40  ! 170: STHA_R	stha	%r16, [%r31 + %r0] 0x72
	ta	T_CHANGE_HPRIV	! macro
	mov	0x10, %r27
	mov	0x7e0, %r21
	.word 0xe4bf8e60  ! 174: STDA_R	stda	%r18, [%r30 + %r0] 0x73
	.word 0x87802025  ! 175: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4a5a000  ! 176: STWA_I	stwa	%r18, [%r22 + 0x0000] %asi
	.word 0xe4ade000  ! 177: STBA_I	stba	%r18, [%r23 + 0x0000] %asi
	.word 0x87802020  ! 178: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4b4e000  ! 179: STHA_I	stha	%r18, [%r19 + 0x0000] %asi
	.word 0xeabc4400  ! 180: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0xeabf8e80  ! 181: STDA_R	stda	%r21, [%r30 + %r0] 0x74
	.word 0xecf584a0  ! 182: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	.word 0xeaa689e0  ! 183: STWA_R	stwa	%r21, [%r26 + %r0] 0x4f
	.word 0xe4df8e80  ! 184: LDXA_R	ldxa	[%r30, %r0] 0x74, %r18
	.word 0xe4c74e60  ! 185: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r18
	.word 0xe48c2000  ! 186: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r18
	mov	0x3f0, %r22
	mov	0x10, %r27
	.word 0xe4bce000  ! 189: STDA_I	stda	%r18, [%r19 + 0x0000] %asi
	mov	0x58, %r26
	mov	0x3f0, %r22
	wr_tick_cmpr_1:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xa4, %g2
	or	%g4, 0xed, %g4
	or	%g6, 0xb8, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe4af4e40  ! 193: STBA_R	stba	%r18, [%r29 + %r0] 0x72
	.word 0xeecc8400  ! 194: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r23
	mov	0x40, %r25
	.word 0xeeac2000  ! 196: STBA_I	stba	%r23, [%r16 + 0x0000] %asi
	.word 0xee9ce000  ! 197: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r23
	.word 0xeea46000  ! 198: STWA_I	stwa	%r23, [%r17 + 0x0000] %asi
	.word 0x87802020  ! 199: WRASI_I	wr	%r0, 0x0020, %asi
	ta	T_CHANGE_HPRIV	! macro
	mov	0x7f0, %r22
	mov	0x78, %r27
	.word 0xeea4c400  ! 203: STWA_R	stwa	%r23, [%r19 + %r0] 0x20
	.word 0xeea42000  ! 204: STWA_I	stwa	%r23, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 205: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7c8, %r20
	.word 0xeea62000  ! 207: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	.word 0x87802072  ! 208: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x28, %r24
	.word 0xe49d04a0  ! 210: LDDA_R	ldda	[%r20, %r0] 0x25, %r18
	mov	0x3f0, %r21
	.word 0xecae09e0  ! 212: STBA_R	stba	%r22, [%r24 + %r0] 0x4f
	.word 0xe0f70e80  ! 213: STXA_R	stxa	%r16, [%r28 + %r0] 0x74
	.word 0xe0cf6000  ! 214: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	.word 0xeabc0400  ! 215: STDA_R	stda	%r21, [%r16 + %r0] 0x20
	.word 0x87802020  ! 216: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeacf8e60  ! 217: LDSBA_R	ldsba	[%r30, %r0] 0x73, %r21
	mov	0x3e0, %r22
	mov	0x3d0, %r23
	.word 0xe88f4e60  ! 220: LDUBA_R	lduba	[%r29, %r0] 0x73, %r20
	.word 0x87802025  ! 221: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7c0, %r20
	.word 0xe89649e0  ! 223: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r20
	.word 0xe4bc8400  ! 224: STDA_R	stda	%r18, [%r18 + %r0] 0x20
	.word 0xe4b52000  ! 225: STHA_I	stha	%r18, [%r20 + 0x0000] %asi
	mov	0x7d0, %r21
	.word 0xe2b609e0  ! 227: STHA_R	stha	%r17, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 228: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2ad2000  ! 229: STBA_I	stba	%r17, [%r20 + 0x0000] %asi
	.word 0xe2b52000  ! 230: STHA_I	stha	%r17, [%r20 + 0x0000] %asi
	mov	0x3e8, %r22
	.word 0xee95c4a0  ! 232: LDUHA_R	lduha	[%r23, %r0] 0x25, %r23
	mov	0x7f8, %r23
	mov	0x68, %r16
	.word 0xeef5a000  ! 235: STXA_I	stxa	%r23, [%r22 + 0x0000] %asi
	.word 0xe2ccc400  ! 236: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r17
	.word 0xe295a000  ! 237: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r17
	.word 0xecf70e40  ! 238: STXA_R	stxa	%r22, [%r28 + %r0] 0x72
	.word 0xecb56000  ! 239: STHA_I	stha	%r22, [%r21 + 0x0000] %asi
	mov	0x18, %r26
	.word 0x87802025  ! 241: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x3c0, %r21
	mov	0x60, %r24
	.word 0xecb5a000  ! 244: STHA_I	stha	%r22, [%r22 + 0x0000] %asi
	.word 0xe8cf4e60  ! 245: LDSBA_R	ldsba	[%r29, %r0] 0x73, %r20
	.word 0xeeaf0e80  ! 246: STBA_R	stba	%r23, [%r28 + %r0] 0x74
	mov	0x70, %r19
	.word 0xeebda000  ! 248: STDA_I	stda	%r23, [%r22 + 0x0000] %asi
	.word 0xee856000  ! 249: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r23
	.word 0x87802020  ! 250: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x50, %r25
	.word 0xeebf0e40  ! 252: STDA_R	stda	%r23, [%r28 + %r0] 0x72
	.word 0xeeac2000  ! 253: STBA_I	stba	%r23, [%r16 + 0x0000] %asi
	.word 0xeecca000  ! 254: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r23
	mov	0x28, %r19
	.word 0xee9ce000  ! 256: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r23
	.word 0xeeb4a000  ! 257: STHA_I	stha	%r23, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 258: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8780204f  ! 259: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeeae6000  ! 260: STBA_I	stba	%r23, [%r25 + 0x0000] %asi
	.word 0x87802072  ! 261: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3f8, %r20
	.word 0x87802020  ! 263: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x3f8, %r22
	.word 0x87802074  ! 265: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 266: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeea72000  ! 267: STWA_I	stwa	%r23, [%r28 + 0x0000] %asi
	.word 0xeebfe000  ! 268: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	.word 0xeef72000  ! 269: STXA_I	stxa	%r23, [%r28 + 0x0000] %asi
	mov	0x3f8, %r23
	.word 0xe2af4e60  ! 271: STBA_R	stba	%r17, [%r29 + %r0] 0x73
	.word 0xe2976000  ! 272: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r17
	.word 0x8780204f  ! 273: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x3c8, %r23
	.word 0xe6dd84a0  ! 275: LDXA_R	ldxa	[%r22, %r0] 0x25, %r19
	.word 0xee974e80  ! 276: LDUHA_R	lduha	[%r29, %r0] 0x74, %r23
	.word 0x87802074  ! 277: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 278: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeebfe000  ! 279: STDA_I	stda	%r23, [%r31 + 0x0000] %asi
	.word 0xeef7a000  ! 280: STXA_I	stxa	%r23, [%r30 + 0x0000] %asi
	.word 0xea8e09e0  ! 281: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r21
	.word 0x87802020  ! 282: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeacc2000  ! 283: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r21
	.word 0xeab4e000  ! 284: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	.word 0xe687ce80  ! 285: LDUWA_R	lduwa	[%r31, %r0] 0x74, %r19
	.word 0x87802072  ! 286: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe6b72000  ! 287: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0x87802025  ! 288: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6c5e000  ! 289: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r19
	.word 0xe6d56000  ! 290: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r19
	.word 0xe6dde000  ! 291: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r19
	wr_tick_cmpr_2:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xaa, %g2
	or	%g4, 0x9b, %g4
	or	%g6, 0x8d, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe6cda000  ! 293: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r19
	.word 0x87802020  ! 294: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a7ce80  ! 295: STWA_R	stwa	%r20, [%r31 + %r0] 0x74
	.word 0x87802025  ! 296: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8ad6000  ! 297: STBA_I	stba	%r20, [%r21 + 0x0000] %asi
	.word 0xe88da000  ! 298: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r20
	.word 0xe0bc8400  ! 299: STDA_R	stda	%r16, [%r18 + %r0] 0x20
	.word 0x87802025  ! 300: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb5c4a0  ! 301: STHA_R	stha	%r22, [%r23 + %r0] 0x25
	.word 0xecbde000  ! 302: STDA_I	stda	%r22, [%r23 + 0x0000] %asi
	.word 0x87802025  ! 303: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802025  ! 304: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xec852000  ! 305: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xecbd2000  ! 307: STDA_I	stda	%r22, [%r20 + 0x0000] %asi
	mov	0x7d8, %r23
	.word 0xec8d2000  ! 309: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r22
	mov	0x10, %r18
	.word 0xecdd2000  ! 311: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r22
	mov	0x30, %r19
	.word 0xeccda000  ! 313: LDSBA_I	ldsba	[%r22, + 0x0000] %asi, %r22
	.word 0xe8b609e0  ! 314: STHA_R	stha	%r20, [%r24 + %r0] 0x4f
	.word 0xe8ada000  ! 315: STBA_I	stba	%r20, [%r22 + 0x0000] %asi
	mov	0x50, %r24
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802020  ! 318: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x28, %r27
	.word 0xe8ace000  ! 320: STBA_I	stba	%r20, [%r19 + 0x0000] %asi
	.word 0x87802074  ! 321: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802074  ! 322: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8f7a000  ! 323: STXA_I	stxa	%r20, [%r30 + 0x0000] %asi
	.word 0xeca7ce80  ! 324: STWA_R	stwa	%r22, [%r31 + %r0] 0x74
	mov	0x38, %r16
	mov	0x30, %r18
	mov	0x7f8, %r20
	.word 0xecf76000  ! 328: STXA_I	stxa	%r22, [%r29 + 0x0000] %asi
	mov	0x40, %r18
	mov	0x3f8, %r20
	.word 0xe0ac8400  ! 331: STBA_R	stba	%r16, [%r18 + %r0] 0x20
	.word 0xe0f76000  ! 332: STXA_I	stxa	%r16, [%r29 + 0x0000] %asi
	.word 0xeab40400  ! 333: STHA_R	stha	%r21, [%r16 + %r0] 0x20
	.word 0xeab76000  ! 334: STHA_I	stha	%r21, [%r29 + 0x0000] %asi
	.word 0xead76000  ! 335: LDSHA_I	ldsha	[%r29, + 0x0000] %asi, %r21
	.word 0x87802072  ! 336: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe2d7ce60  ! 337: LDSHA_R	ldsha	[%r31, %r0] 0x73, %r17
	.word 0xe297a000  ! 338: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r17
	mov	0x3f0, %r23
	.word 0xe0a70e40  ! 340: STWA_R	stwa	%r16, [%r28 + %r0] 0x72
	.word 0xe0976000  ! 341: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r16
	.word 0xe8f78e80  ! 342: STXA_R	stxa	%r20, [%r30 + %r0] 0x74
	.word 0xe8b7e000  ! 343: STHA_I	stha	%r20, [%r31 + 0x0000] %asi
	.word 0xe8a7a000  ! 344: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	.word 0xe8a72000  ! 345: STWA_I	stwa	%r20, [%r28 + 0x0000] %asi
	.word 0xe897e000  ! 346: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	mov	0x7e0, %r22
	mov	0x28, %r16
	mov	0x68, %r19
	mov	0x30, %r25
	.word 0x8780204f  ! 351: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8f6e000  ! 352: STXA_I	stxa	%r20, [%r27 + 0x0000] %asi
	mov	0x3c8, %r22
	.word 0x87802073  ! 354: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe88fe000  ! 355: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 356: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8bcc400  ! 357: STDA_R	stda	%r20, [%r19 + %r0] 0x20
	.word 0xe8aea000  ! 358: STBA_I	stba	%r20, [%r26 + 0x0000] %asi
	.word 0xe8aee000  ! 359: STBA_I	stba	%r20, [%r27 + 0x0000] %asi
	.word 0xe69c4400  ! 360: LDDA_R	ldda	[%r17, %r0] 0x20, %r19
	wr_tick_cmpr_3:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xe5, %g2
	or	%g4, 0xfa, %g4
	or	%g6, 0xad, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe6a62000  ! 362: STWA_I	stwa	%r19, [%r24 + 0x0000] %asi
	.word 0xe6be6000  ! 363: STDA_I	stda	%r19, [%r25 + 0x0000] %asi
	mov	0x48, %r19
	.word 0xe6f66000  ! 365: STXA_I	stxa	%r19, [%r25 + 0x0000] %asi
	.word 0xe2bc4400  ! 366: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	.word 0xe2b6a000  ! 367: STHA_I	stha	%r17, [%r26 + 0x0000] %asi
	.word 0xecad44a0  ! 368: STBA_R	stba	%r22, [%r21 + %r0] 0x25
	mov	0x40, %r16
	mov	0x68, %r17
	.word 0xee9f0e60  ! 371: LDDA_R	ldda	[%r28, %r0] 0x73, %r23
	.word 0xee966000  ! 372: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r23
	.word 0xeecee000  ! 373: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r23
	.word 0x87802020  ! 374: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeaca000  ! 375: STBA_I	stba	%r23, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 376: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee8ce000  ! 377: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r23
	mov	0x7c0, %r21
	.word 0xeef4e000  ! 379: STXA_I	stxa	%r23, [%r19 + 0x0000] %asi
	.word 0xee8c6000  ! 380: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r23
	.word 0xe4b544a0  ! 381: STHA_R	stha	%r18, [%r21 + %r0] 0x25
	mov	0x0, %r27
	.word 0xeac7ce60  ! 383: LDSWA_R	ldswa	[%r31, %r0] 0x73, %r21
	.word 0x8780204f  ! 384: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802073  ! 385: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaf72000  ! 386: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xe28e89e0  ! 387: LDUBA_R	lduba	[%r26, %r0] 0x4f, %r17
	.word 0xe2cfe000  ! 388: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xe2a7e000  ! 389: STWA_I	stwa	%r17, [%r31 + 0x0000] %asi
	.word 0xe4afce60  ! 390: STBA_R	stba	%r18, [%r31 + %r0] 0x73
	.word 0x8780204f  ! 391: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802074  ! 392: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 393: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4b4e000  ! 394: STHA_I	stha	%r18, [%r19 + 0x0000] %asi
	.word 0xe4f4e000  ! 395: STXA_I	stxa	%r18, [%r19 + 0x0000] %asi
	mov	0x0, %r24
	.word 0xe0978e40  ! 397: LDUHA_R	lduha	[%r30, %r0] 0x72, %r16
	.word 0xeaa74e80  ! 398: STWA_R	stwa	%r21, [%r29 + %r0] 0x74
	.word 0xeadc6000  ! 399: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r21
	.word 0xeaa46000  ! 400: STWA_I	stwa	%r21, [%r17 + 0x0000] %asi
	mov	0x40, %r25
	.word 0x87802072  ! 402: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeaa72000  ! 403: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	.word 0xeea78e60  ! 404: STWA_R	stwa	%r23, [%r30 + %r0] 0x73
	.word 0xe6f78e60  ! 405: STXA_R	stxa	%r19, [%r30 + %r0] 0x73
	.word 0x87802072  ! 406: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeea44400  ! 407: STWA_R	stwa	%r23, [%r17 + %r0] 0x20
	.word 0xee876000  ! 408: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	mov	0x7c8, %r23
	.word 0x87802020  ! 410: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeec4e000  ! 411: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r23
	.word 0xecbf0e80  ! 412: STDA_R	stda	%r22, [%r28 + %r0] 0x74
	mov	0x7d8, %r22
	.word 0x87802074  ! 414: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x48, %r24
	.word 0xe0af4e80  ! 416: STBA_R	stba	%r16, [%r29 + %r0] 0x74
	.word 0xe09fe000  ! 417: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
	.word 0x87802025  ! 418: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b74e60  ! 419: STHA_R	stha	%r17, [%r29 + %r0] 0x73
	.word 0x87802020  ! 420: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b4a000  ! 421: STHA_I	stha	%r17, [%r18 + 0x0000] %asi
	.word 0xee848400  ! 422: LDUWA_R	lduwa	[%r18, %r0] 0x20, %r23
	.word 0xecf584a0  ! 423: STXA_R	stxa	%r22, [%r22 + %r0] 0x25
	.word 0xec8c2000  ! 424: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r22
	.word 0x87802020  ! 425: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecc42000  ! 426: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r22
	mov	0x3d0, %r21
	.word 0x87802072  ! 428: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec9f2000  ! 429: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r22
	.word 0xecb40400  ! 430: STHA_R	stha	%r22, [%r16 + %r0] 0x20
	mov	0x3e0, %r20
	mov	0x28, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe4de09e0  ! 434: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r18
	.word 0xe487a000  ! 435: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r18
	.word 0xeacd04a0  ! 436: LDSBA_R	ldsba	[%r20, %r0] 0x25, %r21
	.word 0xea9fe000  ! 437: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r21
	mov	0x78, %r24
	.word 0xeaa7e000  ! 439: STWA_I	stwa	%r21, [%r31 + 0x0000] %asi
	.word 0xe2bc4400  ! 440: STDA_R	stda	%r17, [%r17 + %r0] 0x20
	.word 0xe0978e40  ! 441: LDUHA_R	lduha	[%r30, %r0] 0x72, %r16
	.word 0x87802025  ! 442: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6dfce40  ! 443: LDXA_R	ldxa	[%r31, %r0] 0x72, %r19
	mov	0x58, %r27
	.word 0x87802072  ! 445: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x8780204f  ! 446: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 447: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e8, %r23
	.word 0xe2a70e80  ! 449: STWA_R	stwa	%r17, [%r28 + %r0] 0x74
	.word 0xe2f42000  ! 450: STXA_I	stxa	%r17, [%r16 + 0x0000] %asi
	.word 0x87802074  ! 451: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe2afe000  ! 452: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	mov	0x3d0, %r22
	mov	0x78, %r17
	mov	0x70, %r25
	.word 0xe2f7a000  ! 456: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0xe2bfa000  ! 457: STDA_I	stda	%r17, [%r30 + 0x0000] %asi
	.word 0xe2a70e60  ! 458: STWA_R	stwa	%r17, [%r28 + %r0] 0x73
	.word 0xe2a72000  ! 459: STWA_I	stwa	%r17, [%r28 + 0x0000] %asi
	.word 0xee8f8e80  ! 460: LDUBA_R	lduba	[%r30, %r0] 0x74, %r23
	.word 0xeed72000  ! 461: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r23
	.word 0xeeaf2000  ! 462: STBA_I	stba	%r23, [%r28 + 0x0000] %asi
	mov	0x78, %r26
	.word 0x87802025  ! 464: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6948400  ! 465: LDUHA_R	lduha	[%r18, %r0] 0x20, %r19
	.word 0xe6cd2000  ! 466: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r19
	.word 0x87802074  ! 467: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6bfa000  ! 468: STDA_I	stda	%r19, [%r30 + 0x0000] %asi
	mov	0x68, %r17
	.word 0xe0bc4400  ! 470: STDA_R	stda	%r16, [%r17 + %r0] 0x20
	.word 0xe0b48400  ! 471: STHA_R	stha	%r16, [%r18 + %r0] 0x20
	.word 0x8780204f  ! 472: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r17
	.word 0xe0f6e000  ! 474: STXA_I	stxa	%r16, [%r27 + 0x0000] %asi
	.word 0xeca4c400  ! 475: STWA_R	stwa	%r22, [%r19 + %r0] 0x20
	.word 0xec966000  ! 476: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r22
	.word 0xec96a000  ! 477: LDUHA_I	lduha	[%r26, + 0x0000] %asi, %r22
	.word 0xe4844400  ! 478: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r18
	.word 0x87802020  ! 479: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bfce40  ! 480: STDA_R	stda	%r20, [%r31 + %r0] 0x72
	.word 0xe8dca000  ! 481: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r20
	mov	0x50, %r27
	.word 0x87802073  ! 483: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe8afe000  ! 484: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0x87802025  ! 485: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4f7ce80  ! 486: STXA_R	stxa	%r18, [%r31 + %r0] 0x74
	.word 0xe6d74e80  ! 487: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r19
	.word 0x87802074  ! 488: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x40, %r19
	.word 0xe0aec9e0  ! 490: STBA_R	stba	%r16, [%r27 + %r0] 0x4f
	.word 0xe8d78e60  ! 491: LDSHA_R	ldsha	[%r30, %r0] 0x73, %r20
	.word 0xe89f2000  ! 492: LDDA_I	ldda	[%r28, + 0x0000] %asi, %r20
	mov	0x60, %r17
	.word 0xe0b7ce80  ! 494: STHA_R	stha	%r16, [%r31 + %r0] 0x74
	.word 0xe0b7e000  ! 495: STHA_I	stha	%r16, [%r31 + 0x0000] %asi
	.word 0xe0af2000  ! 496: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	mov	0x60, %r19
	.word 0xeeacc400  ! 498: STBA_R	stba	%r23, [%r19 + %r0] 0x20
	wr_tick_cmpr_4:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xbe, %g2
	or	%g4, 0xb0, %g4
	or	%g6, 0x8e, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x7d0, %r20
	mov	0x58, %r19
	.word 0x8780204f  ! 502: WRASI_I	wr	%r0, 0x004f, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeeaea000  ! 504: STBA_I	stba	%r23, [%r26 + 0x0000] %asi
	.word 0x87802073  ! 505: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802074  ! 506: WRASI_I	wr	%r0, 0x0074, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xeed7e000  ! 508: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	mov	0x58, %r25
	.word 0xee87a000  ! 510: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r23
	.word 0xeeaf8e60  ! 511: STBA_R	stba	%r23, [%r30 + %r0] 0x73
	.word 0xe0f4c400  ! 512: STXA_R	stxa	%r16, [%r19 + %r0] 0x20
	.word 0x87802025  ! 513: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 514: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0c76000  ! 515: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r16
	mov	0x7f8, %r20
	.word 0xe0bf6000  ! 517: STDA_I	stda	%r16, [%r29 + 0x0000] %asi
	mov	0x7c8, %r22
	.word 0x87802025  ! 519: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b40400  ! 520: STHA_R	stha	%r17, [%r16 + %r0] 0x20
	.word 0xe48fce60  ! 521: LDUBA_R	lduba	[%r31, %r0] 0x73, %r18
	.word 0xe4f5e000  ! 522: STXA_I	stxa	%r18, [%r23 + 0x0000] %asi
	.word 0x87802074  ! 523: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3e8, %r22
	.word 0xecc504a0  ! 525: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r22
	mov	0x40, %r27
	.word 0x87802072  ! 527: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecafa000  ! 528: STBA_I	stba	%r22, [%r30 + 0x0000] %asi
	.word 0xecb7a000  ! 529: STHA_I	stha	%r22, [%r30 + 0x0000] %asi
	mov	0x8, %r27
	mov	0x8, %r16
	.word 0x87802020  ! 532: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecace000  ! 533: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xecd4e000  ! 534: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r22
	.word 0xeac74e80  ! 535: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r21
	mov	0x7f0, %r23
	.word 0xe88f8e40  ! 537: LDUBA_R	lduba	[%r30, %r0] 0x72, %r20
	.word 0xe8ad84a0  ! 538: STBA_R	stba	%r20, [%r22 + %r0] 0x25
	.word 0xe89c2000  ! 539: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r20
	mov	0x3e8, %r23
	.word 0xeebf8e60  ! 541: STDA_R	stda	%r23, [%r30 + %r0] 0x73
	.word 0xeca70e60  ! 542: STWA_R	stwa	%r22, [%r28 + %r0] 0x73
	.word 0xecf48400  ! 543: STXA_R	stxa	%r22, [%r18 + %r0] 0x20
	.word 0x87802025  ! 544: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 545: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 546: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe89fce80  ! 547: LDDA_R	ldda	[%r31, %r0] 0x74, %r20
	.word 0xe4bf8e60  ! 548: STDA_R	stda	%r18, [%r30 + %r0] 0x73
	.word 0xe48ce000  ! 549: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r18
	mov	0x8, %r18
	mov	0x68, %r17
	.word 0x87802020  ! 552: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe89f4e40  ! 553: LDDA_R	ldda	[%r29, %r0] 0x72, %r20
	.word 0xe29d84a0  ! 554: LDDA_R	ldda	[%r22, %r0] 0x25, %r17
	.word 0x8780204f  ! 555: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7c8, %r21
	.word 0xe2a62000  ! 557: STWA_I	stwa	%r17, [%r24 + 0x0000] %asi
	.word 0xe2be6000  ! 558: STDA_I	stda	%r17, [%r25 + 0x0000] %asi
	.word 0xe2cf4e40  ! 559: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r17
	mov	0x48, %r18
	mov	0x7d0, %r22
	.word 0xe2a62000  ! 562: STWA_I	stwa	%r17, [%r24 + 0x0000] %asi
	.word 0xe6a78e60  ! 563: STWA_R	stwa	%r19, [%r30 + %r0] 0x73
	.word 0xe69e6000  ! 564: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r19
	.word 0xe6c6a000  ! 565: LDSWA_I	ldswa	[%r26, + 0x0000] %asi, %r19
	mov	0x40, %r16
	mov	0x0, %r17
	.word 0x87802025  ! 568: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802074  ! 569: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeaf70e80  ! 570: STXA_R	stxa	%r21, [%r28 + %r0] 0x74
	mov	0x7e8, %r21
	.word 0x87802074  ! 572: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x30, %r25
	.word 0xeadfa000  ! 574: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r21
	.word 0xeaafa000  ! 575: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xeaa72000  ! 576: STWA_I	stwa	%r21, [%r28 + 0x0000] %asi
	.word 0xeaf7a000  ! 577: STXA_I	stxa	%r21, [%r30 + 0x0000] %asi
	.word 0xeacfa000  ! 578: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r21
	mov	0x48, %r17
	.word 0x87802020  ! 580: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea846000  ! 581: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r21
	.word 0xe0b7ce40  ! 582: STHA_R	stha	%r16, [%r31 + %r0] 0x72
	.word 0xe084a000  ! 583: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r16
	.word 0x87802072  ! 584: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe09f6000  ! 585: LDDA_I	ldda	[%r29, + 0x0000] %asi, %r16
	.word 0xec8f4e80  ! 586: LDUBA_R	lduba	[%r29, %r0] 0x74, %r22
	.word 0xecbcc400  ! 587: STDA_R	stda	%r22, [%r19 + %r0] 0x20
	.word 0x8780204f  ! 588: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r17
	.word 0x87802074  ! 590: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8cdc4a0  ! 591: LDSBA_R	ldsba	[%r23, %r0] 0x25, %r20
	.word 0xe88fe000  ! 592: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	mov	0x50, %r25
	mov	0x7f0, %r22
	mov	0x3f8, %r20
	.word 0xe8c76000  ! 596: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r20
	mov	0x60, %r24
	.word 0xe8cf2000  ! 598: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r20
	.word 0x87802072  ! 599: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8f7a000  ! 600: STXA_I	stxa	%r20, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 601: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xee8e09e0  ! 602: LDUBA_R	lduba	[%r24, %r0] 0x4f, %r23
	.word 0x87802073  ! 603: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeef76000  ! 604: STXA_I	stxa	%r23, [%r29 + 0x0000] %asi
	.word 0xeecf2000  ! 605: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r23
	.word 0x8780204f  ! 606: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2840400  ! 607: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r17
	.word 0x8780204f  ! 608: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2f62000  ! 609: STXA_I	stxa	%r17, [%r24 + 0x0000] %asi
	.word 0xe8bfce60  ! 610: STDA_R	stda	%r20, [%r31 + %r0] 0x73
	.word 0xe8dea000  ! 611: LDXA_I	ldxa	[%r26, + 0x0000] %asi, %r20
	.word 0xe8bea000  ! 612: STDA_I	stda	%r20, [%r26 + 0x0000] %asi
	.word 0xe8b62000  ! 613: STHA_I	stha	%r20, [%r24 + 0x0000] %asi
	mov	0x3c0, %r21
	.word 0xe8f649e0  ! 615: STXA_R	stxa	%r20, [%r25 + %r0] 0x4f
	mov	0x28, %r18
	.word 0xe8ae6000  ! 617: STBA_I	stba	%r20, [%r25 + 0x0000] %asi
	mov	0x28, %r17
	.word 0xe8aea000  ! 619: STBA_I	stba	%r20, [%r26 + 0x0000] %asi
	.word 0x87802020  ! 620: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6b7ce80  ! 621: STHA_R	stha	%r19, [%r31 + %r0] 0x74
	.word 0x87802073  ! 622: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeca584a0  ! 623: STWA_R	stwa	%r22, [%r22 + %r0] 0x25
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe2bfce80  ! 625: STDA_R	stda	%r17, [%r31 + %r0] 0x74
	.word 0xe2af2000  ! 626: STBA_I	stba	%r17, [%r28 + 0x0000] %asi
	.word 0xe0f48400  ! 627: STXA_R	stxa	%r16, [%r18 + %r0] 0x20
	mov	0x7f8, %r20
	.word 0xe88c4400  ! 629: LDUBA_R	lduba	[%r17, %r0] 0x20, %r20
	.word 0xecb70e60  ! 630: STHA_R	stha	%r22, [%r28 + %r0] 0x73
	.word 0xecb649e0  ! 631: STHA_R	stha	%r22, [%r25 + %r0] 0x4f
	.word 0xecbfe000  ! 632: STDA_I	stda	%r22, [%r31 + 0x0000] %asi
	.word 0xeeb689e0  ! 633: STHA_R	stha	%r23, [%r26 + %r0] 0x4f
	.word 0xee97a000  ! 634: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r23
	.word 0xec86c9e0  ! 635: LDUWA_R	lduwa	[%r27, %r0] 0x4f, %r22
	mov	0x58, %r27
	.word 0x87802074  ! 637: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x0, %r24
	mov	0x40, %r27
	.word 0xe29c0400  ! 640: LDDA_R	ldda	[%r16, %r0] 0x20, %r17
	.word 0xe2afe000  ! 641: STBA_I	stba	%r17, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 642: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0948400  ! 643: LDUHA_R	lduha	[%r18, %r0] 0x20, %r16
	.word 0x8780204f  ! 644: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x30, %r24
	.word 0xe4b44400  ! 646: STHA_R	stha	%r18, [%r17 + %r0] 0x20
	.word 0xec978e60  ! 647: LDUHA_R	lduha	[%r30, %r0] 0x73, %r22
	mov	0x3e8, %r20
	mov	0x70, %r18
	mov	0x0, %r27
	.word 0xec9e6000  ! 651: LDDA_I	ldda	[%r25, + 0x0000] %asi, %r22
	.word 0xeccea000  ! 652: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r22
	.word 0xec866000  ! 653: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r22
	mov	0x50, %r24
	mov	0x18, %r18
	mov	0x0, %r17
	mov	0x20, %r16
	.word 0xecd6a000  ! 658: LDSHA_I	ldsha	[%r26, + 0x0000] %asi, %r22
	.word 0xe2ad84a0  ! 659: STBA_R	stba	%r17, [%r22 + %r0] 0x25
	mov	0x7d0, %r20
	mov	0x68, %r26
	.word 0x87802025  ! 662: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2956000  ! 663: LDUHA_I	lduha	[%r21, + 0x0000] %asi, %r17
	.word 0xe295a000  ! 664: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r17
	.word 0x87802025  ! 665: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2f5e000  ! 666: STXA_I	stxa	%r17, [%r23 + 0x0000] %asi
	.word 0x87802025  ! 667: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2856000  ! 668: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r17
	.word 0xe2d5a000  ! 669: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r17
	.word 0xe2f56000  ! 670: STXA_I	stxa	%r17, [%r21 + 0x0000] %asi
	.word 0xe4f70e60  ! 671: STXA_R	stxa	%r18, [%r28 + %r0] 0x73
	.word 0xe8be89e0  ! 672: STDA_R	stda	%r20, [%r26 + %r0] 0x4f
	.word 0xe8ade000  ! 673: STBA_I	stba	%r20, [%r23 + 0x0000] %asi
	.word 0x87802072  ! 674: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe4f7ce60  ! 675: STXA_R	stxa	%r18, [%r31 + %r0] 0x73
	mov	0x68, %r25
	mov	0x3e8, %r21
	.word 0xe4972000  ! 678: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r18
	.word 0x87802072  ! 679: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x7c8, %r23
	mov	0x3f8, %r23
	.word 0xe6a609e0  ! 682: STWA_R	stwa	%r19, [%r24 + %r0] 0x4f
	.word 0xe8bf4e40  ! 683: STDA_R	stda	%r20, [%r29 + %r0] 0x72
	.word 0xe8b584a0  ! 684: STHA_R	stha	%r20, [%r22 + %r0] 0x25
	.word 0xe8af2000  ! 685: STBA_I	stba	%r20, [%r28 + 0x0000] %asi
	.word 0xe0ccc400  ! 686: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r16
	.word 0xe0d7a000  ! 687: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	.word 0xe0cf2000  ! 688: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r16
	.word 0x87802074  ! 689: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3f0, %r20
	.word 0xe09fa000  ! 691: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r16
	mov	0x50, %r24
	.word 0xe0976000  ! 693: LDUHA_I	lduha	[%r29, + 0x0000] %asi, %r16
	.word 0xe0876000  ! 694: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r16
	.word 0xe0bfe000  ! 695: STDA_I	stda	%r16, [%r31 + 0x0000] %asi
	.word 0xe0c7e000  ! 696: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0xe0bf6000  ! 697: STDA_I	stda	%r16, [%r29 + 0x0000] %asi
	.word 0x87802072  ! 698: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0872000  ! 699: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r16
	.word 0xead70e60  ! 700: LDSHA_R	ldsha	[%r28, %r0] 0x73, %r21
	.word 0xeac76000  ! 701: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r21
	wr_tick_cmpr_5:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0x81, %g2
	or	%g4, 0xa1, %g4
	or	%g6, 0xf7, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xeebcc400  ! 703: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	.word 0x87802072  ! 704: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3d8, %r21
	mov	0x8, %r19
	.word 0xecc74e80  ! 707: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r22
	.word 0xe2bd44a0  ! 708: STDA_R	stda	%r17, [%r21 + %r0] 0x25
	.word 0xe2b76000  ! 709: STHA_I	stha	%r17, [%r29 + 0x0000] %asi
	.word 0xe287ce60  ! 710: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r17
	.word 0xe2df6000  ! 711: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r17
	mov	0x78, %r17
	.word 0xe4bd04a0  ! 713: STDA_R	stda	%r18, [%r20 + %r0] 0x25
	.word 0x87802020  ! 714: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4a689e0  ! 715: STWA_R	stwa	%r18, [%r26 + %r0] 0x4f
	mov	0x28, %r24
	.word 0xe4d42000  ! 717: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r18
	.word 0xe8d74e80  ! 718: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r20
	.word 0xeaa44400  ! 719: STWA_R	stwa	%r21, [%r17 + %r0] 0x20
	mov	0x3f8, %r20
	.word 0xea94e000  ! 721: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r21
	.word 0xecc70e40  ! 722: LDSWA_R	ldswa	[%r28, %r0] 0x72, %r22
	.word 0x87802020  ! 723: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecb4e000  ! 724: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	.word 0xe0b44400  ! 725: STHA_R	stha	%r16, [%r17 + %r0] 0x20
	mov	0x3e8, %r20
	.word 0x87802073  ! 727: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x0, %r18
	.word 0x87802020  ! 729: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f4a000  ! 730: STXA_I	stxa	%r16, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 731: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0b4a000  ! 732: STHA_I	stha	%r16, [%r18 + 0x0000] %asi
	.word 0xe0c46000  ! 733: LDSWA_I	ldswa	[%r17, + 0x0000] %asi, %r16
	mov	0x8, %r17
	mov	0x3f0, %r22
	.word 0xe08c2000  ! 736: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r16
	.word 0xe0f42000  ! 737: STXA_I	stxa	%r16, [%r16 + 0x0000] %asi
	mov	0x68, %r18
	.word 0xe2a40400  ! 739: STWA_R	stwa	%r17, [%r16 + %r0] 0x20
	.word 0xe2f4a000  ! 740: STXA_I	stxa	%r17, [%r18 + 0x0000] %asi
	.word 0xe2a4a000  ! 741: STWA_I	stwa	%r17, [%r18 + 0x0000] %asi
	.word 0x87802025  ! 742: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe29f0e40  ! 743: LDDA_R	ldda	[%r28, %r0] 0x72, %r17
	.word 0xe2d56000  ! 744: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r17
	.word 0xe2bda000  ! 745: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	.word 0x87802072  ! 746: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 747: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecb689e0  ! 748: STHA_R	stha	%r22, [%r26 + %r0] 0x4f
	.word 0x87802020  ! 749: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 750: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802074  ! 751: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecdf2000  ! 752: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r22
	.word 0xeadf8e40  ! 753: LDXA_R	ldxa	[%r30, %r0] 0x72, %r21
	.word 0xeabf2000  ! 754: STDA_I	stda	%r21, [%r28 + 0x0000] %asi
	.word 0xea878e80  ! 755: LDUWA_R	lduwa	[%r30, %r0] 0x74, %r21
	.word 0x8780204f  ! 756: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeadee000  ! 757: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r21
	mov	0x3d0, %r20
	mov	0x38, %r24
	.word 0xe2ae49e0  ! 760: STBA_R	stba	%r17, [%r25 + %r0] 0x4f
	.word 0xe8974e60  ! 761: LDUHA_R	lduha	[%r29, %r0] 0x73, %r20
	.word 0x8780204f  ! 762: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d8, %r20
	.word 0x87802020  ! 764: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f42000  ! 765: STXA_I	stxa	%r20, [%r16 + 0x0000] %asi
	.word 0xe6d504a0  ! 766: LDSHA_R	ldsha	[%r20, %r0] 0x25, %r19
	.word 0xe6b7ce60  ! 767: STHA_R	stha	%r19, [%r31 + %r0] 0x73
	.word 0x87802072  ! 768: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x60, %r24
	.word 0x87802074  ! 770: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6972000  ! 771: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r19
	.word 0xe6bf2000  ! 772: STDA_I	stda	%r19, [%r28 + 0x0000] %asi
	.word 0xe0c40400  ! 773: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r16
	.word 0x87802073  ! 774: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeece49e0  ! 775: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r23
	.word 0xea9d84a0  ! 776: LDDA_R	ldda	[%r22, %r0] 0x25, %r21
	.word 0x8780204f  ! 777: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xea866000  ! 778: LDUWA_I	lduwa	[%r25, + 0x0000] %asi, %r21
	.word 0x87802020  ! 779: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeacce000  ! 780: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r21
	.word 0xeaf4a000  ! 781: STXA_I	stxa	%r21, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 782: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0dfce60  ! 783: LDXA_R	ldxa	[%r31, %r0] 0x73, %r16
	.word 0xe2f609e0  ! 784: STXA_R	stxa	%r17, [%r24 + %r0] 0x4f
	.word 0x87802072  ! 785: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x28, %r16
	.word 0xe2f7a000  ! 787: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0xe4bc0400  ! 788: STDA_R	stda	%r18, [%r16 + %r0] 0x20
	.word 0xe4d7a000  ! 789: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r18
	.word 0xe4cfa000  ! 790: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r18
	.word 0xee94c400  ! 791: LDUHA_R	lduha	[%r19, %r0] 0x20, %r23
	.word 0xe8be09e0  ! 792: STDA_R	stda	%r20, [%r24 + %r0] 0x4f
	.word 0xe68c0400  ! 793: LDUBA_R	lduba	[%r16, %r0] 0x20, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe8ac0400  ! 795: STBA_R	stba	%r20, [%r16 + %r0] 0x20
	.word 0xecbd84a0  ! 796: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	mov	0x78, %r17
	.word 0x87802020  ! 798: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f48400  ! 799: STXA_R	stxa	%r19, [%r18 + %r0] 0x20
	mov	0x7c8, %r22
	.word 0xe694e000  ! 801: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r19
	.word 0x8780204f  ! 802: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a6a000  ! 803: STWA_I	stwa	%r19, [%r26 + 0x0000] %asi
	.word 0x87802074  ! 804: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f7a000  ! 805: STXA_I	stxa	%r19, [%r30 + 0x0000] %asi
	.word 0xe8ac4400  ! 806: STBA_R	stba	%r20, [%r17 + %r0] 0x20
	.word 0xe88fe000  ! 807: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0xe8c76000  ! 808: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r20
	mov	0x8, %r25
	.word 0x87802025  ! 810: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7f0, %r22
	.word 0xe885a000  ! 812: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r20
	.word 0xeebcc400  ! 813: STDA_R	stda	%r23, [%r19 + %r0] 0x20
	mov	0x28, %r24
	.word 0xee852000  ! 815: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r23
	mov	0x20, %r16
	mov	0x40, %r19
	.word 0xeecd2000  ! 818: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r23
	mov	0x30, %r24
	.word 0xeccfce80  ! 820: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r22
	.word 0xecbde000  ! 821: STDA_I	stda	%r22, [%r23 + 0x0000] %asi
	.word 0xecb56000  ! 822: STHA_I	stha	%r22, [%r21 + 0x0000] %asi
	mov	0x7d8, %r20
	mov	0x70, %r17
	wr_tick_cmpr_6:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xb7, %g2
	or	%g4, 0xf4, %g4
	or	%g6, 0xb4, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xec8d2000  ! 826: LDUBA_I	lduba	[%r20, + 0x0000] %asi, %r22
	.word 0xe6f44400  ! 827: STXA_R	stxa	%r19, [%r17 + %r0] 0x20
	.word 0xe2bf4e80  ! 828: STDA_R	stda	%r17, [%r29 + %r0] 0x74
	.word 0x87802025  ! 829: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2d5e000  ! 830: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r17
	.word 0x87802073  ! 831: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe29fe000  ! 832: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r17
	mov	0x7d0, %r22
	.word 0xeaac8400  ! 834: STBA_R	stba	%r21, [%r18 + %r0] 0x20
	mov	0x50, %r19
	.word 0xe0bd04a0  ! 836: STDA_R	stda	%r16, [%r20 + %r0] 0x25
	mov	0x78, %r19
	.word 0xe4be09e0  ! 838: STDA_R	stda	%r18, [%r24 + %r0] 0x4f
	.word 0xe0c74e40  ! 839: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r16
	.word 0x87802074  ! 840: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x3c8, %r21
	.word 0xe0cfe000  ! 842: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xe4940400  ! 843: LDUHA_R	lduha	[%r16, %r0] 0x20, %r18
	.word 0x87802073  ! 844: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802020  ! 845: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xecbf0e60  ! 846: STDA_R	stda	%r22, [%r28 + %r0] 0x73
	mov	0x18, %r17
	.word 0xeca4e000  ! 848: STWA_I	stwa	%r22, [%r19 + 0x0000] %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xecd4e000  ! 850: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r22
	.word 0xeccce000  ! 851: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r22
	.word 0xeccca000  ! 852: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	mov	0x10, %r18
	mov	0x20, %r19
	.word 0xec94a000  ! 855: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r22
	.word 0xe2acc400  ! 856: STBA_R	stba	%r17, [%r19 + %r0] 0x20
	.word 0xe4b649e0  ! 857: STHA_R	stha	%r18, [%r25 + %r0] 0x4f
	.word 0xe4d46000  ! 858: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r18
	mov	0x7f8, %r21
	.word 0xe4b4e000  ! 860: STHA_I	stha	%r18, [%r19 + 0x0000] %asi
	.word 0xeab78e60  ! 861: STHA_R	stha	%r21, [%r30 + %r0] 0x73
	.word 0xe4ce49e0  ! 862: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r18
	.word 0xe2b6c9e0  ! 863: STHA_R	stha	%r17, [%r27 + %r0] 0x4f
	.word 0xe2a4e000  ! 864: STWA_I	stwa	%r17, [%r19 + 0x0000] %asi
	.word 0xe2842000  ! 865: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r17
	wr_tick_cmpr_7:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0x85, %g2
	or	%g4, 0x8e, %g4
	or	%g6, 0xd0, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xeac40400  ! 867: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r21
	mov	0x58, %r25
	.word 0xeadca000  ! 869: LDXA_I	ldxa	[%r18, + 0x0000] %asi, %r21
	mov	0x3e0, %r23
	.word 0x87802020  ! 871: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7e0, %r21
	mov	0x38, %r25
	.word 0xeaf4e000  ! 874: STXA_I	stxa	%r21, [%r19 + 0x0000] %asi
	.word 0x8780204f  ! 875: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 876: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeadd2000  ! 877: LDXA_I	ldxa	[%r20, + 0x0000] %asi, %r21
	.word 0xea9da000  ! 878: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r21
	.word 0xe6a74e40  ! 879: STWA_R	stwa	%r19, [%r29 + %r0] 0x72
	.word 0x87802020  ! 880: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2b609e0  ! 881: STHA_R	stha	%r17, [%r24 + %r0] 0x4f
	.word 0xe2dc6000  ! 882: LDXA_I	ldxa	[%r17, + 0x0000] %asi, %r17
	.word 0x87802020  ! 883: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8f78e60  ! 884: STXA_R	stxa	%r20, [%r30 + %r0] 0x73
	.word 0xe8c4e000  ! 885: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r20
	mov	0x7d0, %r23
	.word 0xe2b504a0  ! 887: STHA_R	stha	%r17, [%r20 + %r0] 0x25
	.word 0xe2a649e0  ! 888: STWA_R	stwa	%r17, [%r25 + %r0] 0x4f
	.word 0xecad44a0  ! 889: STBA_R	stba	%r22, [%r21 + %r0] 0x25
	.word 0xee878e40  ! 890: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r23
	mov	0x3f8, %r21
	mov	0x50, %r24
	mov	0x10, %r16
	mov	0x7e8, %r20
	.word 0xeabc4400  ! 895: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0xea9c6000  ! 896: LDDA_I	ldda	[%r17, + 0x0000] %asi, %r21
	.word 0xe0ad44a0  ! 897: STBA_R	stba	%r16, [%r21 + %r0] 0x25
	.word 0xe0bc6000  ! 898: STDA_I	stda	%r16, [%r17 + 0x0000] %asi
	.word 0xeea649e0  ! 899: STWA_R	stwa	%r23, [%r25 + %r0] 0x4f
	.word 0xeecc4400  ! 900: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r23
	.word 0xeecc2000  ! 901: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r23
	mov	0x48, %r18
	mov	0x10, %r16
	.word 0xeec4a000  ! 904: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r23
	.word 0xeec42000  ! 905: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r23
	.word 0xecd6c9e0  ! 906: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r22
	.word 0x87802020  ! 907: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeccc6000  ! 908: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r22
	.word 0xeccca000  ! 909: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r22
	mov	0x7e0, %r23
	mov	0x3d8, %r22
	.word 0xecc4e000  ! 912: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r22
	.word 0x87802074  ! 913: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x0, %r18
	.word 0x87802074  ! 915: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 916: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecf7a000  ! 917: STXA_I	stxa	%r22, [%r30 + 0x0000] %asi
	mov	0x18, %r27
	.word 0x87802020  ! 919: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x48, %r26
	.word 0xec8c6000  ! 921: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r22
	.word 0xecac2000  ! 922: STBA_I	stba	%r22, [%r16 + 0x0000] %asi
	.word 0xe8a5c4a0  ! 923: STWA_R	stwa	%r20, [%r23 + %r0] 0x25
	.word 0xe8cca000  ! 924: LDSBA_I	ldsba	[%r18, + 0x0000] %asi, %r20
	mov	0x68, %r19
	.word 0x87802020  ! 926: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec9f4e40  ! 927: LDDA_R	ldda	[%r29, %r0] 0x72, %r22
	.word 0xeca4a000  ! 928: STWA_I	stwa	%r22, [%r18 + 0x0000] %asi
	.word 0x87802020  ! 929: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2c74e60  ! 930: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r17
	.word 0xe284a000  ! 931: LDUWA_I	lduwa	[%r18, + 0x0000] %asi, %r17
	mov	0x78, %r27
	.word 0x87802025  ! 933: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x58, %r27
	mov	0x3f8, %r20
	.word 0x87802020  ! 936: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ac6000  ! 937: STBA_I	stba	%r17, [%r17 + 0x0000] %asi
	.word 0xe4dcc400  ! 938: LDXA_R	ldxa	[%r19, %r0] 0x20, %r18
	.word 0xe2f7ce40  ! 939: STXA_R	stxa	%r17, [%r31 + %r0] 0x72
	.word 0xecdd04a0  ! 940: LDXA_R	ldxa	[%r20, %r0] 0x25, %r22
	.word 0xecace000  ! 941: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xecf42000  ! 942: STXA_I	stxa	%r22, [%r16 + 0x0000] %asi
	.word 0xec974e80  ! 943: LDUHA_R	lduha	[%r29, %r0] 0x74, %r22
	mov	0x48, %r18
	mov	0x38, %r26
	.word 0xecace000  ! 946: STBA_I	stba	%r22, [%r19 + 0x0000] %asi
	.word 0xe0970e40  ! 947: LDUHA_R	lduha	[%r28, %r0] 0x72, %r16
	mov	0x8, %r24
	.word 0x87802020  ! 949: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bc6000  ! 950: STDA_I	stda	%r16, [%r17 + 0x0000] %asi
	.word 0xe49649e0  ! 951: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r18
	wr_tick_cmpr_8:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xea, %g2
	or	%g4, 0xc1, %g4
	or	%g6, 0xe4, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x3d0, %r23
	mov	0x60, %r17
	.word 0xe4f42000  ! 955: STXA_I	stxa	%r18, [%r16 + 0x0000] %asi
	.word 0xe4f42000  ! 956: STXA_I	stxa	%r18, [%r16 + 0x0000] %asi
	.word 0xe4cc2000  ! 957: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r18
	.word 0xe4cc2000  ! 958: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r18
	.word 0x87802072  ! 959: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8afce60  ! 960: STBA_R	stba	%r20, [%r31 + %r0] 0x73
	.word 0x8780204f  ! 961: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7c8, %r21
	.word 0xe0cfce80  ! 963: LDSBA_R	ldsba	[%r31, %r0] 0x74, %r16
	.word 0xe0f6a000  ! 964: STXA_I	stxa	%r16, [%r26 + 0x0000] %asi
	.word 0xe28f4e80  ! 965: LDUBA_R	lduba	[%r29, %r0] 0x74, %r17
	.word 0x87802020  ! 966: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec970e60  ! 967: LDUHA_R	lduha	[%r28, %r0] 0x73, %r22
	.word 0xeca42000  ! 968: STWA_I	stwa	%r22, [%r16 + 0x0000] %asi
	.word 0xeea48400  ! 969: STWA_R	stwa	%r23, [%r18 + %r0] 0x20
	.word 0xe4b4c400  ! 970: STHA_R	stha	%r18, [%r19 + %r0] 0x20
	.word 0x87802020  ! 971: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802073  ! 972: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4bfe000  ! 973: STDA_I	stda	%r18, [%r31 + 0x0000] %asi
	.word 0xe4df0e80  ! 974: LDXA_R	ldxa	[%r28, %r0] 0x74, %r18
	.word 0xe8cfce60  ! 975: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r20
	mov	0x0, %r27
	.word 0xe8d7a000  ! 977: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r20
	mov	0x0, %r18
	.word 0xe8bf6000  ! 979: STDA_I	stda	%r20, [%r29 + 0x0000] %asi
	.word 0xe0ce49e0  ! 980: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r16
	mov	0x50, %r19
	.word 0xe0c7a000  ! 982: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r16
	.word 0x87802074  ! 983: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0df2000  ! 984: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0xeef5c4a0  ! 985: STXA_R	stxa	%r23, [%r23 + %r0] 0x25
	.word 0xeeaf6000  ! 986: STBA_I	stba	%r23, [%r29 + 0x0000] %asi
	.word 0x8780204f  ! 987: WRASI_I	wr	%r0, 0x004f, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xeedee000  ! 989: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r23
	.word 0xeebe2000  ! 990: STDA_I	stda	%r23, [%r24 + 0x0000] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xee86a000  ! 992: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r23
	mov	0x7f0, %r21
	.word 0xeea62000  ! 994: STWA_I	stwa	%r23, [%r24 + 0x0000] %asi
	.word 0xeebf8e60  ! 995: STDA_R	stda	%r23, [%r30 + %r0] 0x73
	.word 0xecb70e80  ! 996: STHA_R	stha	%r22, [%r28 + %r0] 0x74
	.word 0xe2ae49e0  ! 997: STBA_R	stba	%r17, [%r25 + %r0] 0x4f
	.word 0x87802074  ! 998: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x50, %r19
	.data
data_start:

	.xword	0x1e8a6703346c47b2
	.xword	0x515689c800dd708b
	.xword	0x2e422b0f5c9ec5b5
	.xword	0x1454d650ad433c03
	.xword	0xa03b1584665b8869
	.xword	0x4da19d8b38d4dde9
	.xword	0xa26d3dffe961fdeb
	.xword	0x7d4655225e22d981
	.xword	0x677ffe64cbf8419e
	.xword	0x09dcc58d57206e80
	.xword	0xdb7fe5bca8f137e2
	.xword	0x246ae9b7daa8148b
	.xword	0x197c3e5fd76e73db
	.xword	0xe5f1744bc8faa9c6
	.xword	0x841f7a5ae2c89135
	.xword	0x3ac2a3c80da63020



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
