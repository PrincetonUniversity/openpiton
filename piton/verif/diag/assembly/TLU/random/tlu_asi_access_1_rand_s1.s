// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asi_access_1_rand_s1.s
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
   random seed:	850402832
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

	setx 0x184fc524de773292, %g1, %g0
	setx 0x28a0734db59f8290, %g1, %g1
	setx 0x8d054577f2d8cbe5, %g1, %g2
	setx 0x119c239a7df03481, %g1, %g3
	setx 0x5f5791042c2d8119, %g1, %g4
	setx 0x9c1495010780a4c0, %g1, %g5
	setx 0x92d7a2e0e27efec7, %g1, %g6
	setx 0xd72185a8d7ae38da, %g1, %g7
	setx 0xf30bb8ccd66c6ce2, %g1, %r16
	setx 0xb86034a2dcc10b02, %g1, %r17
	setx 0x4769baab9b3064e8, %g1, %r18
	setx 0xe489e451c3d5a3ec, %g1, %r19
	setx 0x7c4317520d8b53a3, %g1, %r20
	setx 0xec8504bcbeddec0a, %g1, %r21
	setx 0xdc29ff56b53ad4c6, %g1, %r22
	setx 0x9183a797d2c52bba, %g1, %r23
	setx 0x1d7f68660522fc5a, %g1, %r24
	setx 0xb3b042cf699b49b8, %g1, %r25
	setx 0xfae90ca4199a3a85, %g1, %r26
	setx 0x0b0a58ccb49faa2a, %g1, %r27
	setx 0x59bf32a9b1859f74, %g1, %r28
	setx 0xd8fcb62589746131, %g1, %r29
	setx 0x7499ae0c821a4fd2, %g1, %r30
	setx 0xe98a6075f7455b6b, %g1, %r31
	save
	setx 0x9f8509b0915327f2, %g1, %r16
	setx 0x8fa87a5524334d77, %g1, %r17
	setx 0x5a113753fd020547, %g1, %r18
	setx 0x53e00ec52a1c0551, %g1, %r19
	setx 0x735f9588ee60fca3, %g1, %r20
	setx 0x09aba78866563641, %g1, %r21
	setx 0xbded848429315cf9, %g1, %r22
	setx 0xc2d065d0034240b6, %g1, %r23
	setx 0x6c058c449c7ab035, %g1, %r24
	setx 0x46cb2cfe0975094e, %g1, %r25
	setx 0xc2ae23ee373e8810, %g1, %r26
	setx 0xa1cd225882f86ade, %g1, %r27
	setx 0x72ebb2def33c8ad8, %g1, %r28
	setx 0xe72a0c94f1497663, %g1, %r29
	setx 0x2ec81f486bf8a75a, %g1, %r30
	setx 0x5e4249adcf7c523a, %g1, %r31
	save
	setx 0xfc9e267374cc538b, %g1, %r16
	setx 0x1f633ae3cf2dc157, %g1, %r17
	setx 0xc74b7b4e4d3e8aa7, %g1, %r18
	setx 0xebad7deb295f3845, %g1, %r19
	setx 0x2ec8ed1461f545d5, %g1, %r20
	setx 0xcf4f49e0c5677fdb, %g1, %r21
	setx 0x0a1016ed915adf0c, %g1, %r22
	setx 0x7e575869be78c2a9, %g1, %r23
	setx 0xb42f68ef0824bb47, %g1, %r24
	setx 0x6242f563a6b30bb7, %g1, %r25
	setx 0x4094704430c0fbc4, %g1, %r26
	setx 0x46939d6c3a7560ca, %g1, %r27
	setx 0x0a2deec80e32c927, %g1, %r28
	setx 0x1e304bfec050caa0, %g1, %r29
	setx 0xae0653cd01527314, %g1, %r30
	setx 0x84e14c090d02b41b, %g1, %r31
	restore
	setx	data_start, %r1, %r25
	mov	0x58, %r16
	mov	0x30, %r17
	mov	0x28, %r18
	mov	0x78, %r19
	mov	0x3c0, %r20
	mov	0x3c8, %r21
	mov	0x3f0, %r22
	mov	0x7c0, %r23
	mov	0x30, %r24
	mov	0x30, %r25
	mov	0x8, %r26
	mov	0x20, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	ta	%icc, T_CHANGE_HPRIV
	wr	%g0, 0x20, %asi
	stxa	%g0, [%g0] 0x42
	mov	0x38, %g1
	stxa	%g0, [%g1] 0x58
	.word 0xec94e000  ! 1: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r22
	.word 0xecc42000  ! 2: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0xe6a78e40  ! 4: STWA_R	stwa	%r19, [%r30 + %r0] 0x72
	.word 0xe6bca000  ! 5: STDA_I	stda	%r19, [%r18 + 0x0000] %asi
	mov	0x30, %r18
	.word 0x87802073  ! 7: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6df6000  ! 8: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r19
	.word 0xe697e000  ! 9: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	mov	0x10, %r24
	.word 0xe6b72000  ! 11: STHA_I	stha	%r19, [%r28 + 0x0000] %asi
	.word 0xe6b76000  ! 12: STHA_I	stha	%r19, [%r29 + 0x0000] %asi
	.word 0xe8bc4400  ! 13: STDA_R	stda	%r20, [%r17 + %r0] 0x20
	.word 0x87802074  ! 14: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x68, %r27
	.word 0xe6c4c400  ! 16: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r19
	.word 0xecbe49e0  ! 17: STDA_R	stda	%r22, [%r25 + %r0] 0x4f
	.word 0xecbf2000  ! 18: STDA_I	stda	%r22, [%r28 + 0x0000] %asi
	.word 0xeaa40400  ! 19: STWA_R	stwa	%r21, [%r16 + %r0] 0x20
	.word 0xe0cf0e80  ! 20: LDSBA_R	ldsba	[%r28, %r0] 0x74, %r16
	.word 0xe0a70e80  ! 21: STWA_R	stwa	%r16, [%r28 + %r0] 0x74
	.word 0xe0f7a000  ! 22: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	.word 0xe2f70e80  ! 23: STXA_R	stxa	%r17, [%r28 + %r0] 0x74
	.word 0xe2f72000  ! 24: STXA_I	stxa	%r17, [%r28 + 0x0000] %asi
	.word 0xe2d72000  ! 25: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r17
	wr_tick_cmpr_0:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xba, %g2
	or	%g4, 0x80, %g4
	or	%g6, 0x91, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x7d8, %r22
	.word 0x87802074  ! 28: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 29: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe28c2000  ! 30: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r17
	.word 0x87802020  ! 31: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8cc4400  ! 32: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r20
	.word 0xe8f4e000  ! 33: STXA_I	stxa	%r20, [%r19 + 0x0000] %asi
	mov	0x3e0, %r23
	.word 0xe8dc2000  ! 35: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r20
	.word 0x8780204f  ! 36: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802025  ! 37: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8b5e000  ! 38: STHA_I	stha	%r20, [%r23 + 0x0000] %asi
	mov	0x3e0, %r21
	.word 0xeaafce80  ! 40: STBA_R	stba	%r21, [%r31 + %r0] 0x74
	.word 0xeabde000  ! 41: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe2b44400  ! 43: STHA_R	stha	%r17, [%r17 + %r0] 0x20
	.word 0xe2b56000  ! 44: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	.word 0xe6c74e60  ! 45: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r19
	.word 0xe6bde000  ! 46: STDA_I	stda	%r19, [%r23 + 0x0000] %asi
	.word 0xe6b5e000  ! 47: STHA_I	stha	%r19, [%r23 + 0x0000] %asi
	mov	0x7e0, %r23
	.word 0xe6a5e000  ! 49: STWA_I	stwa	%r19, [%r23 + 0x0000] %asi
	mov	0x48, %r25
	.word 0xeed649e0  ! 51: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r23
	.word 0x87802020  ! 52: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r25
	.word 0xe8f544a0  ! 54: STXA_R	stxa	%r20, [%r21 + %r0] 0x25
	.word 0x8780204f  ! 55: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7e8, %r20
	mov	0x7f0, %r21
	.word 0xe8ae6000  ! 58: STBA_I	stba	%r20, [%r25 + 0x0000] %asi
	.word 0xe2cf0e40  ! 59: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r17
	.word 0xeab7ce80  ! 60: STHA_R	stha	%r21, [%r31 + %r0] 0x74
	mov	0x3e0, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802020  ! 63: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe2ad44a0  ! 64: STBA_R	stba	%r17, [%r21 + %r0] 0x25
	.word 0xe2ac2000  ! 65: STBA_I	stba	%r17, [%r16 + 0x0000] %asi
	mov	0x38, %r24
	.word 0xeebf4e60  ! 67: STDA_R	stda	%r23, [%r29 + %r0] 0x73
	.word 0xe4a78e60  ! 68: STWA_R	stwa	%r18, [%r30 + %r0] 0x73
	.word 0x87802025  ! 69: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 70: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4f42000  ! 71: STXA_I	stxa	%r18, [%r16 + 0x0000] %asi
	mov	0x68, %r25
	.word 0xeaaec9e0  ! 73: STBA_R	stba	%r21, [%r27 + %r0] 0x4f
	.word 0xea9e89e0  ! 74: LDDA_R	ldda	[%r26, %r0] 0x4f, %r21
	.word 0xeac4a000  ! 75: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r21
	.word 0x87802072  ! 76: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x30, %r19
	.word 0x87802074  ! 78: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802073  ! 79: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x50, %r25
	.word 0x8780204f  ! 81: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeabe2000  ! 82: STDA_I	stda	%r21, [%r24 + 0x0000] %asi
	mov	0x60, %r16
	mov	0x60, %r24
	.word 0x87802073  ! 85: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xeaafa000  ! 86: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xeaf72000  ! 87: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0x8780204f  ! 88: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4b70e40  ! 89: STHA_R	stha	%r18, [%r28 + %r0] 0x72
	.word 0xe0bc0400  ! 90: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	mov	0x3d0, %r22
	wr_tick_cmpr_1:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0x83, %g2
	or	%g4, 0xf1, %g4
	or	%g6, 0x80, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe0cea000  ! 93: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r16
	.word 0xe2a544a0  ! 94: STWA_R	stwa	%r17, [%r21 + %r0] 0x25
	.word 0xe2b649e0  ! 95: STHA_R	stha	%r17, [%r25 + %r0] 0x4f
	mov	0x48, %r19
	.word 0xe4acc400  ! 97: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	.word 0xe486a000  ! 98: LDUWA_I	lduwa	[%r26, + 0x0000] %asi, %r18
	mov	0x60, %r19
	.word 0xe6978e40  ! 100: LDUHA_R	lduha	[%r30, %r0] 0x72, %r19
	.word 0x87802073  ! 101: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6c7a000  ! 102: LDSWA_I	ldswa	[%r30, + 0x0000] %asi, %r19
	.word 0x87802073  ! 103: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0f78e60  ! 104: STXA_R	stxa	%r16, [%r30 + %r0] 0x73
	.word 0x87802020  ! 105: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeea689e0  ! 106: STWA_R	stwa	%r23, [%r26 + %r0] 0x4f
	wr_tick_cmpr_2:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xd2, %g2
	or	%g4, 0xdc, %g4
	or	%g6, 0xdf, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	wr_tick_cmpr_3:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xe4, %g2
	or	%g4, 0x85, %g4
	or	%g6, 0xcf, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x7e8, %r20
	.word 0xeec4e000  ! 110: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r23
	.word 0xe8a78e80  ! 111: STWA_R	stwa	%r20, [%r30 + %r0] 0x74
	mov	0x70, %r17
	.word 0xe6a584a0  ! 113: STWA_R	stwa	%r19, [%r22 + %r0] 0x25
	mov	0x48, %r19
	.word 0x87802074  ! 115: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe6f7e000  ! 116: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0xe0dc0400  ! 117: LDXA_R	ldxa	[%r16, %r0] 0x20, %r16
	.word 0xe0b7a000  ! 118: STHA_I	stha	%r16, [%r30 + 0x0000] %asi
	.word 0xe09fe000  ! 119: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
	.word 0xeca48400  ! 120: STWA_R	stwa	%r22, [%r18 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x68, %r25
	.word 0xeea40400  ! 123: STWA_R	stwa	%r23, [%r16 + %r0] 0x20
	.word 0xeec74e60  ! 124: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r23
	.word 0xeca70e40  ! 125: STWA_R	stwa	%r22, [%r28 + %r0] 0x72
	.word 0xeedcc400  ! 126: LDXA_R	ldxa	[%r19, %r0] 0x20, %r23
	.word 0xeac40400  ! 127: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r21
	.word 0xee8c0400  ! 128: LDUBA_R	lduba	[%r16, %r0] 0x20, %r23
	.word 0xe8b649e0  ! 129: STHA_R	stha	%r20, [%r25 + %r0] 0x4f
	.word 0xe6f5c4a0  ! 130: STXA_R	stxa	%r19, [%r23 + %r0] 0x25
	.word 0x87802072  ! 131: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802025  ! 132: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeaf6c9e0  ! 133: STXA_R	stxa	%r21, [%r27 + %r0] 0x4f
	mov	0x7c8, %r22
	mov	0x3e8, %r21
	mov	0x18, %r16
	.word 0xe6974e40  ! 137: LDUHA_R	lduha	[%r29, %r0] 0x72, %r19
	.word 0x87802020  ! 138: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6f4e000  ! 139: STXA_I	stxa	%r19, [%r19 + 0x0000] %asi
	.word 0xe6d4e000  ! 140: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r19
	.word 0xe6f4a000  ! 141: STXA_I	stxa	%r19, [%r18 + 0x0000] %asi
	.word 0xe6f42000  ! 142: STXA_I	stxa	%r19, [%r16 + 0x0000] %asi
	.word 0xe8bf8e60  ! 143: STDA_R	stda	%r20, [%r30 + %r0] 0x73
	.word 0xecdc4400  ! 144: LDXA_R	ldxa	[%r17, %r0] 0x20, %r22
	.word 0x87802025  ! 145: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6f5c4a0  ! 146: STXA_R	stxa	%r19, [%r23 + %r0] 0x25
	.word 0xe695a000  ! 147: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r19
	.word 0xe0a5c4a0  ! 148: STWA_R	stwa	%r16, [%r23 + %r0] 0x25
	.word 0xe0f5a000  ! 149: STXA_I	stxa	%r16, [%r22 + 0x0000] %asi
	mov	0x30, %r19
	.word 0xe0dd6000  ! 151: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r16
	.word 0xe4878e60  ! 152: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r18
	.word 0xead6c9e0  ! 153: LDSHA_R	ldsha	[%r27, %r0] 0x4f, %r21
	mov	0x7d8, %r20
	.word 0xeabde000  ! 155: STDA_I	stda	%r21, [%r23 + 0x0000] %asi
	.word 0xeaa52000  ! 156: STWA_I	stwa	%r21, [%r20 + 0x0000] %asi
	.word 0x87802025  ! 157: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x60, %r24
	.word 0xe29f0e40  ! 159: LDDA_R	ldda	[%r28, %r0] 0x72, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe2f5a000  ! 161: STXA_I	stxa	%r17, [%r22 + 0x0000] %asi
	.word 0xe6d584a0  ! 162: LDSHA_R	ldsha	[%r22, %r0] 0x25, %r19
	.word 0xe6a44400  ! 163: STWA_R	stwa	%r19, [%r17 + %r0] 0x20
	mov	0x7c8, %r22
	.word 0xe68de000  ! 165: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r19
	.word 0x87802072  ! 166: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802073  ! 167: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x68, %r16
	.word 0xe69fa000  ! 169: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r19
	.word 0x87802072  ! 170: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3e8, %r20
	.word 0xe68584a0  ! 172: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r19
	.word 0xe6a72000  ! 173: STWA_I	stwa	%r19, [%r28 + 0x0000] %asi
	mov	0x3d0, %r21
	.word 0xe6b7e000  ! 175: STHA_I	stha	%r19, [%r31 + 0x0000] %asi
	.word 0xe4974e40  ! 176: LDUHA_R	lduha	[%r29, %r0] 0x72, %r18
	.word 0xe4a76000  ! 177: STWA_I	stwa	%r18, [%r29 + 0x0000] %asi
	.word 0xee974e40  ! 178: LDUHA_R	lduha	[%r29, %r0] 0x72, %r23
	mov	0x40, %r25
	.word 0xeed7e000  ! 180: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	mov	0x50, %r27
	.word 0xe88689e0  ! 182: LDUWA_R	lduwa	[%r26, %r0] 0x4f, %r20
	mov	0x8, %r17
	.word 0xe89fe000  ! 184: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r20
	mov	0x7e0, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8780204f  ! 187: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x20, %r26
	.word 0xe0af4e60  ! 189: STBA_R	stba	%r16, [%r29 + %r0] 0x73
	.word 0xe28544a0  ! 190: LDUWA_R	lduwa	[%r21, %r0] 0x25, %r17
	.word 0xe4cc4400  ! 191: LDSBA_R	ldsba	[%r17, %r0] 0x20, %r18
	.word 0x87802025  ! 192: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802020  ! 193: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8df4e80  ! 194: LDXA_R	ldxa	[%r29, %r0] 0x74, %r20
	mov	0x7f0, %r20
	.word 0x8780204f  ! 196: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x68, %r16
	mov	0x28, %r18
	.word 0x87802020  ! 199: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe894a000  ! 200: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r20
	.word 0xecf4c400  ! 201: STXA_R	stxa	%r22, [%r19 + %r0] 0x20
	.word 0x87802072  ! 202: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xec87e000  ! 203: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r22
	mov	0x58, %r25
	.word 0xecaf2000  ! 205: STBA_I	stba	%r22, [%r28 + 0x0000] %asi
	.word 0xecf7e000  ! 206: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	mov	0x18, %r16
	mov	0x3c0, %r21
	.word 0x87802025  ! 209: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xecb56000  ! 210: STHA_I	stha	%r22, [%r21 + 0x0000] %asi
	mov	0x20, %r26
	mov	0x50, %r18
	mov	0x7f0, %r22
	.word 0xe0afce40  ! 214: STBA_R	stba	%r16, [%r31 + %r0] 0x72
	.word 0xe0bde000  ! 215: STDA_I	stda	%r16, [%r23 + 0x0000] %asi
	.word 0x87802074  ! 216: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe8af4e80  ! 217: STBA_R	stba	%r20, [%r29 + %r0] 0x74
	.word 0xeebc0400  ! 218: STDA_R	stda	%r23, [%r16 + %r0] 0x20
	.word 0x87802020  ! 219: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 220: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeeac6000  ! 221: STBA_I	stba	%r23, [%r17 + 0x0000] %asi
	.word 0xee9ce000  ! 222: LDDA_I	ldda	[%r19, + 0x0000] %asi, %r23
	mov	0x28, %r19
	mov	0x20, %r26
	.word 0x87802074  ! 225: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xecd74e80  ! 226: LDSHA_R	ldsha	[%r29, %r0] 0x74, %r22
	.word 0xe0cf8e40  ! 227: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r16
	mov	0x78, %r19
	.word 0xecb5c4a0  ! 229: STHA_R	stha	%r22, [%r23 + %r0] 0x25
	.word 0x87802020  ! 230: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x70, %r26
	mov	0x60, %r26
	.word 0xe6b40400  ! 233: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0xe4f609e0  ! 234: STXA_R	stxa	%r18, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 235: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x8780204f  ! 236: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe4be6000  ! 237: STDA_I	stda	%r18, [%r25 + 0x0000] %asi
	mov	0x40, %r16
	.word 0xe4b66000  ! 239: STHA_I	stha	%r18, [%r25 + 0x0000] %asi
	.word 0xe4b66000  ! 240: STHA_I	stha	%r18, [%r25 + 0x0000] %asi
	.word 0xe8be09e0  ! 241: STDA_R	stda	%r20, [%r24 + %r0] 0x4f
	.word 0xe8cf0e40  ! 242: LDSBA_R	ldsba	[%r28, %r0] 0x72, %r20
	mov	0x20, %r17
	.word 0xe8b6e000  ! 244: STHA_I	stha	%r20, [%r27 + 0x0000] %asi
	.word 0xe8aea000  ! 245: STBA_I	stba	%r20, [%r26 + 0x0000] %asi
	mov	0x7f0, %r22
	.word 0xeef7ce80  ! 247: STXA_R	stxa	%r23, [%r31 + %r0] 0x74
	.word 0xe2dcc400  ! 248: LDXA_R	ldxa	[%r19, %r0] 0x20, %r17
	.word 0xe494c400  ! 249: LDUHA_R	lduha	[%r19, %r0] 0x20, %r18
	mov	0x38, %r17
	.word 0xe8ac0400  ! 251: STBA_R	stba	%r20, [%r16 + %r0] 0x20
	.word 0xe886e000  ! 252: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r20
	mov	0x70, %r18
	.word 0xec9504a0  ! 254: LDUHA_R	lduha	[%r20, %r0] 0x25, %r22
	.word 0xecd62000  ! 255: LDSHA_I	ldsha	[%r24, + 0x0000] %asi, %r22
	mov	0x8, %r17
	.word 0xecd6e000  ! 257: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r22
	.word 0xecbe6000  ! 258: STDA_I	stda	%r22, [%r25 + 0x0000] %asi
	.word 0xe6a78e40  ! 259: STWA_R	stwa	%r19, [%r30 + %r0] 0x72
	.word 0xe68ee000  ! 260: LDUBA_I	lduba	[%r27, + 0x0000] %asi, %r19
	mov	0x3e8, %r21
	.word 0xe29cc400  ! 262: LDDA_R	ldda	[%r19, %r0] 0x20, %r17
	mov	0x60, %r19
	.word 0x87802072  ! 264: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802074  ! 265: WRASI_I	wr	%r0, 0x0074, %asi
	mov	0x7c8, %r21
	.word 0x8780204f  ! 267: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x10, %r24
	.word 0xe2cee000  ! 269: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r17
	.word 0xe8b689e0  ! 270: STHA_R	stha	%r20, [%r26 + %r0] 0x4f
	mov	0x3d8, %r23
	mov	0x7e0, %r20
	mov	0x7f0, %r23
	mov	0x3e8, %r22
	mov	0x30, %r18
	.word 0xecac8400  ! 276: STBA_R	stba	%r22, [%r18 + %r0] 0x20
	.word 0xe09f0e40  ! 277: LDDA_R	ldda	[%r28, %r0] 0x72, %r16
	.word 0xeef4c400  ! 278: STXA_R	stxa	%r23, [%r19 + %r0] 0x20
	.word 0xe29f8e60  ! 279: LDDA_R	ldda	[%r30, %r0] 0x73, %r17
	mov	0x3f0, %r22
	wr_tick_cmpr_4:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xb0, %g2
	or	%g4, 0xfa, %g4
	or	%g6, 0xb0, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x8, %r25
	.word 0xe28ea000  ! 283: LDUBA_I	lduba	[%r26, + 0x0000] %asi, %r17
	.word 0xe2ae2000  ! 284: STBA_I	stba	%r17, [%r24 + 0x0000] %asi
	.word 0xe2f6e000  ! 285: STXA_I	stxa	%r17, [%r27 + 0x0000] %asi
	mov	0x28, %r27
	mov	0x3f0, %r23
	.word 0xecbec9e0  ! 288: STDA_R	stda	%r22, [%r27 + %r0] 0x4f
	.word 0xecb62000  ! 289: STHA_I	stha	%r22, [%r24 + 0x0000] %asi
	.word 0xea840400  ! 290: LDUWA_R	lduwa	[%r16, %r0] 0x20, %r21
	mov	0x38, %r17
	.word 0xead6e000  ! 292: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r21
	mov	0x3f0, %r22
	.word 0xeacea000  ! 294: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r21
	mov	0x78, %r26
	mov	0x20, %r16
	mov	0x3f0, %r23
	.word 0xeacea000  ! 298: LDSBA_I	ldsba	[%r26, + 0x0000] %asi, %r21
	.word 0xe8bdc4a0  ! 299: STDA_R	stda	%r20, [%r23 + %r0] 0x25
	.word 0x8780204f  ! 300: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x58, %r25
	.word 0xeac74e40  ! 302: LDSWA_R	ldswa	[%r29, %r0] 0x72, %r21
	.word 0xea86e000  ! 303: LDUWA_I	lduwa	[%r27, + 0x0000] %asi, %r21
	.word 0xeab6a000  ! 304: STHA_I	stha	%r21, [%r26 + 0x0000] %asi
	.word 0x87802072  ! 305: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x70, %r16
	.word 0xeccfce60  ! 307: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r22
	mov	0x3d0, %r21
	.word 0xe2adc4a0  ! 309: STBA_R	stba	%r17, [%r23 + %r0] 0x25
	.word 0xe2972000  ! 310: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	.word 0xe287e000  ! 311: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r17
	.word 0xe2972000  ! 312: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r17
	.word 0xe2a7a000  ! 313: STWA_I	stwa	%r17, [%r30 + 0x0000] %asi
	.word 0xe0f40400  ! 314: STXA_R	stxa	%r16, [%r16 + %r0] 0x20
	.word 0xe097a000  ! 315: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r16
	.word 0xecf689e0  ! 316: STXA_R	stxa	%r22, [%r26 + %r0] 0x4f
	.word 0xeea48400  ! 317: STWA_R	stwa	%r23, [%r18 + %r0] 0x20
	.word 0xe48c0400  ! 318: LDUBA_R	lduba	[%r16, %r0] 0x20, %r18
	.word 0xe49d44a0  ! 319: LDDA_R	ldda	[%r21, %r0] 0x25, %r18
	mov	0x70, %r26
	.word 0xe4872000  ! 321: LDUWA_I	lduwa	[%r28, + 0x0000] %asi, %r18
	mov	0x3f8, %r22
	.word 0xe2974e40  ! 323: LDUHA_R	lduha	[%r29, %r0] 0x72, %r17
	.word 0xe2f7a000  ! 324: STXA_I	stxa	%r17, [%r30 + 0x0000] %asi
	.word 0x87802020  ! 325: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeef78e80  ! 326: STXA_R	stxa	%r23, [%r30 + %r0] 0x74
	.word 0xeef42000  ! 327: STXA_I	stxa	%r23, [%r16 + 0x0000] %asi
	.word 0xeabc4400  ! 328: STDA_R	stda	%r21, [%r17 + %r0] 0x20
	.word 0x8780204f  ! 329: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeabe2000  ! 330: STDA_I	stda	%r21, [%r24 + 0x0000] %asi
	.word 0xeacee000  ! 331: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r21
	mov	0x58, %r26
	.word 0xeaf66000  ! 333: STXA_I	stxa	%r21, [%r25 + 0x0000] %asi
	.word 0xe0dcc400  ! 334: LDXA_R	ldxa	[%r19, %r0] 0x20, %r16
	.word 0xeaa689e0  ! 335: STWA_R	stwa	%r21, [%r26 + %r0] 0x4f
	.word 0xe2c74e60  ! 336: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r17
	.word 0xecbc8400  ! 337: STDA_R	stda	%r22, [%r18 + %r0] 0x20
	mov	0x7e8, %r23
	mov	0x7e8, %r22
	.word 0xe89504a0  ! 340: LDUHA_R	lduha	[%r20, %r0] 0x25, %r20
	.word 0xe8ce6000  ! 341: LDSBA_I	ldsba	[%r25, + 0x0000] %asi, %r20
	.word 0xee8f0e80  ! 342: LDUBA_R	lduba	[%r28, %r0] 0x74, %r23
	.word 0x87802073  ! 343: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4cc8400  ! 344: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	mov	0x48, %r24
	mov	0x7d0, %r22
	.word 0x87802072  ! 347: WRASI_I	wr	%r0, 0x0072, %asi
	wr_tick_cmpr_5:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xa6, %g2
	or	%g4, 0xf4, %g4
	or	%g6, 0xcb, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe4f7e000  ! 349: STXA_I	stxa	%r18, [%r31 + 0x0000] %asi
	.word 0x87802073  ! 350: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x30, %r16
	.word 0xe8c609e0  ! 352: LDSWA_R	ldswa	[%r24, %r0] 0x4f, %r20
	mov	0x3c0, %r20
	.word 0x87802020  ! 354: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a46000  ! 355: STWA_I	stwa	%r20, [%r17 + 0x0000] %asi
	.word 0xe88ca000  ! 356: LDUBA_I	lduba	[%r18, + 0x0000] %asi, %r20
	mov	0x7d0, %r21
	.word 0x87802020  ! 358: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8d4e000  ! 359: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r20
	mov	0x7c8, %r21
	.word 0xe4cfce60  ! 361: LDSBA_R	ldsba	[%r31, %r0] 0x73, %r18
	mov	0x40, %r19
	.word 0xe4970e60  ! 363: LDUHA_R	lduha	[%r28, %r0] 0x73, %r18
	.word 0xe0b5c4a0  ! 364: STHA_R	stha	%r16, [%r23 + %r0] 0x25
	mov	0x7e0, %r23
	.word 0xe0d46000  ! 366: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r16
	.word 0xe8b74e60  ! 367: STHA_R	stha	%r20, [%r29 + %r0] 0x73
	.word 0xe8c4e000  ! 368: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r20
	.word 0xee87ce60  ! 369: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r23
	.word 0x87802025  ! 370: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeed52000  ! 371: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r23
	.word 0x87802025  ! 372: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xee9de000  ! 373: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r23
	.word 0xeedd6000  ! 374: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r23
	mov	0x7e0, %r20
	mov	0x78, %r19
	.word 0x87802020  ! 377: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec9cc400  ! 378: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	.word 0xeaf6c9e0  ! 379: STXA_R	stxa	%r21, [%r27 + %r0] 0x4f
	mov	0x3f0, %r23
	.word 0xec9fce40  ! 381: LDDA_R	ldda	[%r31, %r0] 0x72, %r22
	.word 0xe0940400  ! 382: LDUHA_R	lduha	[%r16, %r0] 0x20, %r16
	.word 0xe0c4e000  ! 383: LDSWA_I	ldswa	[%r19, + 0x0000] %asi, %r16
	.word 0xeecf4e40  ! 384: LDSBA_R	ldsba	[%r29, %r0] 0x72, %r23
	.word 0xe8dc0400  ! 385: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	.word 0xe6c6c9e0  ! 386: LDSWA_R	ldswa	[%r27, %r0] 0x4f, %r19
	.word 0x87802074  ! 387: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0x87802020  ! 388: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe69c2000  ! 389: LDDA_I	ldda	[%r16, + 0x0000] %asi, %r19
	mov	0x0, %r26
	mov	0x30, %r16
	mov	0x3c0, %r22
	.word 0x87802025  ! 393: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6d56000  ! 394: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r19
	mov	0x30, %r16
	.word 0xe4a70e60  ! 396: STWA_R	stwa	%r18, [%r28 + %r0] 0x73
	.word 0xe4d56000  ! 397: LDSHA_I	ldsha	[%r21, + 0x0000] %asi, %r18
	.word 0xe4cd2000  ! 398: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r18
	mov	0x3e8, %r23
	.word 0xe4c5a000  ! 400: LDSWA_I	ldswa	[%r22, + 0x0000] %asi, %r18
	.word 0xeac7ce80  ! 401: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r21
	mov	0x8, %r16
	.word 0xeaf5a000  ! 403: STXA_I	stxa	%r21, [%r22 + 0x0000] %asi
	.word 0xea9d6000  ! 404: LDDA_I	ldda	[%r21, + 0x0000] %asi, %r21
	mov	0x10, %r17
	.word 0xe28f4e40  ! 406: LDUBA_R	lduba	[%r29, %r0] 0x72, %r17
	mov	0x30, %r25
	.word 0xe2f52000  ! 408: STXA_I	stxa	%r17, [%r20 + 0x0000] %asi
	.word 0xe2844400  ! 409: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r17
	.word 0xe2cd2000  ! 410: LDSBA_I	ldsba	[%r20, + 0x0000] %asi, %r17
	.word 0xe2b5a000  ! 411: STHA_I	stha	%r17, [%r22 + 0x0000] %asi
	.word 0xe2ad2000  ! 412: STBA_I	stba	%r17, [%r20 + 0x0000] %asi
	.word 0xe295a000  ! 413: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r17
	.word 0xea84c400  ! 414: LDUWA_R	lduwa	[%r19, %r0] 0x20, %r21
	.word 0xeadde000  ! 415: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r21
	.word 0xeab5a000  ! 416: STHA_I	stha	%r21, [%r22 + 0x0000] %asi
	mov	0x8, %r25
	.word 0x87802072  ! 418: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8d609e0  ! 419: LDSHA_R	ldsha	[%r24, %r0] 0x4f, %r20
	.word 0xe8afe000  ! 420: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe89fa000  ! 421: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r20
	mov	0x7f0, %r22
	.word 0xe4acc400  ! 423: STBA_R	stba	%r18, [%r19 + %r0] 0x20
	mov	0x50, %r18
	.word 0x87802073  ! 425: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe49fa000  ! 426: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r18
	.word 0xe4bfa000  ! 427: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	.word 0xe6a689e0  ! 428: STWA_R	stwa	%r19, [%r26 + %r0] 0x4f
	.word 0xe68f6000  ! 429: LDUBA_I	lduba	[%r29, + 0x0000] %asi, %r19
	mov	0x7d8, %r20
	.word 0xe6cfa000  ! 431: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	mov	0x3c0, %r22
	.word 0xee9f8e80  ! 433: LDDA_R	ldda	[%r30, %r0] 0x74, %r23
	.word 0xee9fe000  ! 434: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r23
	.word 0xe2944400  ! 435: LDUHA_R	lduha	[%r17, %r0] 0x20, %r17
	.word 0xeeb48400  ! 436: STHA_R	stha	%r23, [%r18 + %r0] 0x20
	.word 0xe4ad84a0  ! 437: STBA_R	stba	%r18, [%r22 + %r0] 0x25
	.word 0xe4a7e000  ! 438: STWA_I	stwa	%r18, [%r31 + 0x0000] %asi
	.word 0xe4b72000  ! 439: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xeacd84a0  ! 440: LDSBA_R	ldsba	[%r22, %r0] 0x25, %r21
	.word 0xeac7e000  ! 441: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	mov	0x3c0, %r21
	mov	0x20, %r24
	.word 0xeadc0400  ! 444: LDXA_R	ldxa	[%r16, %r0] 0x20, %r21
	.word 0xea876000  ! 445: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r21
	.word 0xeaf76000  ! 446: STXA_I	stxa	%r21, [%r29 + 0x0000] %asi
	mov	0x48, %r27
	.word 0xeacfa000  ! 448: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r21
	.word 0xe08dc4a0  ! 449: LDUBA_R	lduba	[%r23, %r0] 0x25, %r16
	.word 0xe0af6000  ! 450: STBA_I	stba	%r16, [%r29 + 0x0000] %asi
	.word 0xe0bf2000  ! 451: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	.word 0xe0cfe000  ! 452: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xeca74e40  ! 453: STWA_R	stwa	%r22, [%r29 + %r0] 0x72
	.word 0xe28fce40  ! 454: LDUBA_R	lduba	[%r31, %r0] 0x72, %r17
	.word 0xecd4c400  ! 455: LDSHA_R	ldsha	[%r19, %r0] 0x20, %r22
	.word 0xea9d44a0  ! 456: LDDA_R	ldda	[%r21, %r0] 0x25, %r21
	mov	0x48, %r26
	.word 0xeab78e40  ! 458: STHA_R	stha	%r21, [%r30 + %r0] 0x72
	.word 0xe0b5c4a0  ! 459: STHA_R	stha	%r16, [%r23 + %r0] 0x25
	.word 0xe08fe000  ! 460: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
	mov	0x58, %r25
	mov	0x18, %r18
	.word 0xe0dfa000  ! 463: LDXA_I	ldxa	[%r30, + 0x0000] %asi, %r16
	.word 0xe4bec9e0  ! 464: STDA_R	stda	%r18, [%r27 + %r0] 0x4f
	.word 0xe4bfa000  ! 465: STDA_I	stda	%r18, [%r30 + 0x0000] %asi
	mov	0x8, %r27
	mov	0x78, %r16
	.word 0xe4876000  ! 468: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4df2000  ! 469: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r18
	.word 0xe29ec9e0  ! 470: LDDA_R	ldda	[%r27, %r0] 0x4f, %r17
	.word 0xe2afa000  ! 471: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe2afa000  ! 472: STBA_I	stba	%r17, [%r30 + 0x0000] %asi
	.word 0xe2f76000  ! 473: STXA_I	stxa	%r17, [%r29 + 0x0000] %asi
	.word 0xecf7ce40  ! 474: STXA_R	stxa	%r22, [%r31 + %r0] 0x72
	.word 0x87802072  ! 475: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xecf7e000  ! 476: STXA_I	stxa	%r22, [%r31 + 0x0000] %asi
	mov	0x48, %r25
	mov	0x7d8, %r23
	mov	0x3e8, %r22
	.word 0xeed70e40  ! 480: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r23
	.word 0xee972000  ! 481: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r23
	.word 0xe2f4c400  ! 482: STXA_R	stxa	%r17, [%r19 + %r0] 0x20
	.word 0xe2b7e000  ! 483: STHA_I	stha	%r17, [%r31 + 0x0000] %asi
	.word 0xec9cc400  ! 484: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	.word 0xe0af4e60  ! 485: STBA_R	stba	%r16, [%r29 + %r0] 0x73
	.word 0xee874e60  ! 486: LDUWA_R	lduwa	[%r29, %r0] 0x73, %r23
	.word 0x87802072  ! 487: WRASI_I	wr	%r0, 0x0072, %asi
	wr_tick_cmpr_6:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xc5, %g2
	or	%g4, 0xe5, %g4
	or	%g6, 0x9b, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0x87802073  ! 489: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x7e0, %r21
	.word 0xe2ccc400  ! 491: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r17
	.word 0x87802073  ! 492: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe29e49e0  ! 493: LDDA_R	ldda	[%r25, %r0] 0x4f, %r17
	wr_tick_cmpr_7:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x8f, %g2
	or	%g4, 0x84, %g4
	or	%g6, 0x87, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe8b4c400  ! 495: STHA_R	stha	%r20, [%r19 + %r0] 0x20
	mov	0x38, %r16
	mov	0x70, %r18
	mov	0x3f8, %r21
	.word 0xe0b74e40  ! 499: STHA_R	stha	%r16, [%r29 + %r0] 0x72
	mov	0x10, %r26
	.word 0xe0df2000  ! 501: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0x87802020  ! 502: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec9cc400  ! 503: LDDA_R	ldda	[%r19, %r0] 0x20, %r22
	.word 0xec846000  ! 504: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r22
	.word 0xe6d649e0  ! 505: LDSHA_R	ldsha	[%r25, %r0] 0x4f, %r19
	.word 0xec8f8e40  ! 506: LDUBA_R	lduba	[%r30, %r0] 0x72, %r22
	.word 0xecac6000  ! 507: STBA_I	stba	%r22, [%r17 + 0x0000] %asi
	.word 0xe4c4c400  ! 508: LDSWA_R	ldswa	[%r19, %r0] 0x20, %r18
	.word 0xeaf78e60  ! 509: STXA_R	stxa	%r21, [%r30 + %r0] 0x73
	.word 0xeaf46000  ! 510: STXA_I	stxa	%r21, [%r17 + 0x0000] %asi
	.word 0xecd48400  ! 511: LDSHA_R	ldsha	[%r18, %r0] 0x20, %r22
	.word 0xec8c6000  ! 512: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r22
	.word 0xe0f78e80  ! 513: STXA_R	stxa	%r16, [%r30 + %r0] 0x74
	.word 0xe0ac2000  ! 514: STBA_I	stba	%r16, [%r16 + 0x0000] %asi
	wr_tick_cmpr_8:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x8f, %g2
	or	%g4, 0xfd, %g4
	or	%g6, 0xb9, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe8c7ce80  ! 516: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r20
	.word 0x87802020  ! 517: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x60, %r16
	.word 0xe4af8e80  ! 519: STBA_R	stba	%r18, [%r30 + %r0] 0x74
	.word 0xe4c42000  ! 520: LDSWA_I	ldswa	[%r16, + 0x0000] %asi, %r18
	mov	0x7f8, %r22
	.word 0xe4a46000  ! 522: STWA_I	stwa	%r18, [%r17 + 0x0000] %asi
	.word 0xecd70e40  ! 523: LDSHA_R	ldsha	[%r28, %r0] 0x72, %r22
	.word 0xecf46000  ! 524: STXA_I	stxa	%r22, [%r17 + 0x0000] %asi
	.word 0xeeb584a0  ! 525: STHA_R	stha	%r23, [%r22 + %r0] 0x25
	mov	0x10, %r24
	.word 0xe0f74e60  ! 527: STXA_R	stxa	%r16, [%r29 + %r0] 0x73
	mov	0x58, %r16
	.word 0xe0ace000  ! 529: STBA_I	stba	%r16, [%r19 + 0x0000] %asi
	.word 0xe8870e80  ! 530: LDUWA_R	lduwa	[%r28, %r0] 0x74, %r20
	.word 0xe6b40400  ! 531: STHA_R	stha	%r19, [%r16 + %r0] 0x20
	.word 0xe68c6000  ! 532: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r19
	.word 0xe6bc2000  ! 533: STDA_I	stda	%r19, [%r16 + 0x0000] %asi
	.word 0x8780204f  ! 534: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeaccc400  ! 535: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r21
	.word 0xe28c8400  ! 536: LDUBA_R	lduba	[%r18, %r0] 0x20, %r17
	.word 0x87802072  ! 537: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x68, %r18
	.word 0xe0dc4400  ! 539: LDXA_R	ldxa	[%r17, %r0] 0x20, %r16
	.word 0xe0f7e000  ! 540: STXA_I	stxa	%r16, [%r31 + 0x0000] %asi
	.word 0xe0dfe000  ! 541: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0xe8cf4e80  ! 542: LDSBA_R	ldsba	[%r29, %r0] 0x74, %r20
	.word 0xe08d44a0  ! 543: LDUBA_R	lduba	[%r21, %r0] 0x25, %r16
	.word 0xe0df2000  ! 544: LDXA_I	ldxa	[%r28, + 0x0000] %asi, %r16
	.word 0xe087e000  ! 545: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	.word 0x87802073  ! 546: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x68, %r25
	.word 0xe087e000  ! 548: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	.word 0xe0d72000  ! 549: LDSHA_I	ldsha	[%r28, + 0x0000] %asi, %r16
	.word 0x87802020  ! 550: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x40, %r25
	mov	0x68, %r27
	mov	0x78, %r18
	.word 0xe0dc2000  ! 554: LDXA_I	ldxa	[%r16, + 0x0000] %asi, %r16
	mov	0x70, %r27
	.word 0x87802020  ! 556: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0bce000  ! 557: STDA_I	stda	%r16, [%r19 + 0x0000] %asi
	mov	0x40, %r25
	.word 0xe094e000  ! 559: LDUHA_I	lduha	[%r19, + 0x0000] %asi, %r16
	.word 0xe08c2000  ! 560: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r16
	.word 0xe6bf0e40  ! 561: STDA_R	stda	%r19, [%r28 + %r0] 0x72
	.word 0xe4a74e40  ! 562: STWA_R	stwa	%r18, [%r29 + %r0] 0x72
	.word 0xe8dc0400  ! 563: LDXA_R	ldxa	[%r16, %r0] 0x20, %r20
	.word 0xeaa6c9e0  ! 564: STWA_R	stwa	%r21, [%r27 + %r0] 0x4f
	.word 0xe0c649e0  ! 565: LDSWA_R	ldswa	[%r25, %r0] 0x4f, %r16
	wr_tick_cmpr_9:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xd5, %g2
	or	%g4, 0xe8, %g4
	or	%g6, 0xf2, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x58, %r19
	.word 0xe0a4a000  ! 568: STWA_I	stwa	%r16, [%r18 + 0x0000] %asi
	.word 0xecf7ce80  ! 569: STXA_R	stxa	%r22, [%r31 + %r0] 0x74
	.word 0xecbc2000  ! 570: STDA_I	stda	%r22, [%r16 + 0x0000] %asi
	mov	0x3f8, %r20
	.word 0xea9c4400  ! 572: LDDA_R	ldda	[%r17, %r0] 0x20, %r21
	.word 0x87802020  ! 573: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab4e000  ! 574: STHA_I	stha	%r21, [%r19 + 0x0000] %asi
	mov	0x28, %r26
	.word 0x87802025  ! 576: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac5e000  ! 577: LDSWA_I	ldswa	[%r23, + 0x0000] %asi, %r21
	.word 0x87802020  ! 578: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeacf8e40  ! 579: LDSBA_R	ldsba	[%r30, %r0] 0x72, %r21
	mov	0x3d8, %r23
	.word 0xeaac6000  ! 581: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0xeab4a000  ! 582: STHA_I	stha	%r21, [%r18 + 0x0000] %asi
	.word 0xee844400  ! 583: LDUWA_R	lduwa	[%r17, %r0] 0x20, %r23
	.word 0x87802072  ! 584: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3f8, %r23
	.word 0xeeafe000  ! 586: STBA_I	stba	%r23, [%r31 + 0x0000] %asi
	mov	0x70, %r19
	.word 0xe0878e60  ! 588: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r16
	mov	0x0, %r18
	.word 0xe0afa000  ! 590: STBA_I	stba	%r16, [%r30 + 0x0000] %asi
	.word 0xe0af2000  ! 591: STBA_I	stba	%r16, [%r28 + 0x0000] %asi
	mov	0x50, %r17
	mov	0x28, %r27
	.word 0xe4f7ce60  ! 594: STXA_R	stxa	%r18, [%r31 + %r0] 0x73
	.word 0xe4876000  ! 595: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r18
	.word 0xe4b72000  ! 596: STHA_I	stha	%r18, [%r28 + 0x0000] %asi
	.word 0xee878e40  ! 597: LDUWA_R	lduwa	[%r30, %r0] 0x72, %r23
	.word 0xeedf6000  ! 598: LDXA_I	ldxa	[%r29, + 0x0000] %asi, %r23
	.word 0xee876000  ! 599: LDUWA_I	lduwa	[%r29, + 0x0000] %asi, %r23
	.word 0xe8b544a0  ! 600: STHA_R	stha	%r20, [%r21 + %r0] 0x25
	.word 0xe8a7a000  ! 601: STWA_I	stwa	%r20, [%r30 + 0x0000] %asi
	mov	0x68, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802072  ! 604: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xeac40400  ! 605: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r21
	.word 0x87802073  ! 606: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe4ce49e0  ! 607: LDSBA_R	ldsba	[%r25, %r0] 0x4f, %r18
	.word 0xe48fe000  ! 608: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
	.word 0xeaf6c9e0  ! 609: STXA_R	stxa	%r21, [%r27 + %r0] 0x4f
	.word 0xea8fa000  ! 610: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r21
	.word 0xeebc4400  ! 611: STDA_R	stda	%r23, [%r17 + %r0] 0x20
	.word 0xeec76000  ! 612: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r23
	.word 0xe8b544a0  ! 613: STHA_R	stha	%r20, [%r21 + %r0] 0x25
	.word 0xe8afe000  ! 614: STBA_I	stba	%r20, [%r31 + 0x0000] %asi
	.word 0xe887a000  ! 615: LDUWA_I	lduwa	[%r30, + 0x0000] %asi, %r20
	.word 0xe8f7e000  ! 616: STXA_I	stxa	%r20, [%r31 + 0x0000] %asi
	.word 0x87802020  ! 617: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8ace000  ! 618: STBA_I	stba	%r20, [%r19 + 0x0000] %asi
	.word 0xe0c74e60  ! 619: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r16
	.word 0x87802072  ! 620: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x68, %r27
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe0f76000  ! 623: STXA_I	stxa	%r16, [%r29 + 0x0000] %asi
	wr_tick_cmpr_10:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xab, %g2
	or	%g4, 0xd0, %g4
	or	%g6, 0xca, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe0bfa000  ! 625: STDA_I	stda	%r16, [%r30 + 0x0000] %asi
	.word 0xe0cf6000  ! 626: LDSBA_I	ldsba	[%r29, + 0x0000] %asi, %r16
	mov	0x3e8, %r21
	.word 0x8780204f  ! 628: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x7d0, %r22
	.word 0xe8bf4e60  ! 630: STDA_R	stda	%r20, [%r29 + %r0] 0x73
	.word 0xe8be2000  ! 631: STDA_I	stda	%r20, [%r24 + 0x0000] %asi
	.word 0xe8cee000  ! 632: LDSBA_I	ldsba	[%r27, + 0x0000] %asi, %r20
	.word 0x87802073  ! 633: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0x87802025  ! 634: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7e8, %r20
	.word 0xe8f5a000  ! 636: STXA_I	stxa	%r20, [%r22 + 0x0000] %asi
	.word 0xe8d5e000  ! 637: LDSHA_I	ldsha	[%r23, + 0x0000] %asi, %r20
	.word 0xeca609e0  ! 638: STWA_R	stwa	%r22, [%r24 + %r0] 0x4f
	mov	0x28, %r24
	.word 0xe2f649e0  ! 640: STXA_R	stxa	%r17, [%r25 + %r0] 0x4f
	.word 0xecc48400  ! 641: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r22
	.word 0xe4b504a0  ! 642: STHA_R	stha	%r18, [%r20 + %r0] 0x25
	.word 0xe4bd6000  ! 643: STDA_I	stda	%r18, [%r21 + 0x0000] %asi
	.word 0x87802025  ! 644: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe6f74e40  ! 645: STXA_R	stxa	%r19, [%r29 + %r0] 0x72
	.word 0xeaf609e0  ! 646: STXA_R	stxa	%r21, [%r24 + %r0] 0x4f
	.word 0xeaad6000  ! 647: STBA_I	stba	%r21, [%r21 + 0x0000] %asi
	.word 0xe4a7ce80  ! 648: STWA_R	stwa	%r18, [%r31 + %r0] 0x74
	.word 0xe4dd6000  ! 649: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r18
	.word 0xe485a000  ! 650: LDUWA_I	lduwa	[%r22, + 0x0000] %asi, %r18
	.word 0xe0970e60  ! 651: LDUHA_R	lduha	[%r28, %r0] 0x73, %r16
	.word 0xe0852000  ! 652: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r16
	.word 0xe0856000  ! 653: LDUWA_I	lduwa	[%r21, + 0x0000] %asi, %r16
	.word 0xe0dd6000  ! 654: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r16
	mov	0x8, %r18
	mov	0x18, %r18
	.word 0x87802020  ! 657: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0aca000  ! 658: STBA_I	stba	%r16, [%r18 + 0x0000] %asi
	mov	0x70, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	mov	0x58, %r16
	.word 0xe0f70e80  ! 662: STXA_R	stxa	%r16, [%r28 + %r0] 0x74
	mov	0x58, %r17
	.word 0xe0d42000  ! 664: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r16
	.word 0xe287ce60  ! 665: LDUWA_R	lduwa	[%r31, %r0] 0x73, %r17
	mov	0x3f0, %r22
	.word 0xecb7ce60  ! 667: STHA_R	stha	%r22, [%r31 + %r0] 0x73
	.word 0xec84e000  ! 668: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r22
	.word 0xecc4a000  ! 669: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r22
	.word 0xecb4e000  ! 670: STHA_I	stha	%r22, [%r19 + 0x0000] %asi
	mov	0x7e0, %r20
	.word 0xec842000  ! 672: LDUWA_I	lduwa	[%r16, + 0x0000] %asi, %r22
	.word 0xe6f74e60  ! 673: STXA_R	stxa	%r19, [%r29 + %r0] 0x73
	.word 0xeab609e0  ! 674: STHA_R	stha	%r21, [%r24 + %r0] 0x4f
	.word 0xea94a000  ! 675: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r21
	.word 0xec8e49e0  ! 676: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r22
	mov	0x20, %r17
	.word 0xecd42000  ! 678: LDSHA_I	ldsha	[%r16, + 0x0000] %asi, %r22
	.word 0x8780204f  ! 679: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xec96e000  ! 680: LDUHA_I	lduha	[%r27, + 0x0000] %asi, %r22
	mov	0x68, %r26
	.word 0xee9cc400  ! 682: LDDA_R	ldda	[%r19, %r0] 0x20, %r23
	.word 0xee9e2000  ! 683: LDDA_I	ldda	[%r24, + 0x0000] %asi, %r23
	.word 0xe0878e60  ! 684: LDUWA_R	lduwa	[%r30, %r0] 0x73, %r16
	.word 0xe0d7ce40  ! 685: LDSHA_R	ldsha	[%r31, %r0] 0x72, %r16
	.word 0xe0aea000  ! 686: STBA_I	stba	%r16, [%r26 + 0x0000] %asi
	.word 0xe0a6e000  ! 687: STWA_I	stwa	%r16, [%r27 + 0x0000] %asi
	.word 0xecd5c4a0  ! 688: LDSHA_R	ldsha	[%r23, %r0] 0x25, %r22
	.word 0xeebe89e0  ! 689: STDA_R	stda	%r23, [%r26 + %r0] 0x4f
	mov	0x68, %r26
	wr_tick_cmpr_11:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xda, %g2
	or	%g4, 0xc2, %g4
	or	%g6, 0xe5, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0x87802020  ! 692: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeecce000  ! 693: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r23
	.word 0x87802020  ! 694: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x78, %r18
	.word 0xe2c74e60  ! 696: LDSWA_R	ldswa	[%r29, %r0] 0x73, %r17
	.word 0xe2946000  ! 697: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r17
	.word 0xe2dce000  ! 698: LDXA_I	ldxa	[%r19, + 0x0000] %asi, %r17
	.word 0xe284e000  ! 699: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r17
	.word 0xe2ac2000  ! 700: STBA_I	stba	%r17, [%r16 + 0x0000] %asi
	mov	0x3c0, %r21
	.word 0xe0f4c400  ! 702: STXA_R	stxa	%r16, [%r19 + %r0] 0x20
	.word 0xe0d4e000  ! 703: LDSHA_I	ldsha	[%r19, + 0x0000] %asi, %r16
	.word 0xeed40400  ! 704: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r23
	mov	0x0, %r25
	.word 0xee8ce000  ! 706: LDUBA_I	lduba	[%r19, + 0x0000] %asi, %r23
	mov	0x58, %r26
	.word 0x87802025  ! 708: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4a7ce80  ! 709: STWA_R	stwa	%r18, [%r31 + %r0] 0x74
	mov	0x40, %r17
	.word 0xe4c74e80  ! 711: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r18
	mov	0x70, %r24
	.word 0xe4ad6000  ! 713: STBA_I	stba	%r18, [%r21 + 0x0000] %asi
	.word 0xe4d52000  ! 714: LDSHA_I	ldsha	[%r20, + 0x0000] %asi, %r18
	.word 0xe48de000  ! 715: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r18
	.word 0xe4a4c400  ! 716: STWA_R	stwa	%r18, [%r19 + %r0] 0x20
	.word 0xe4978e60  ! 717: LDUHA_R	lduha	[%r30, %r0] 0x73, %r18
	.word 0x87802025  ! 718: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4a52000  ! 719: STWA_I	stwa	%r18, [%r20 + 0x0000] %asi
	mov	0x68, %r17
	.word 0xe48da000  ! 721: LDUBA_I	lduba	[%r22, + 0x0000] %asi, %r18
	.word 0x87802073  ! 722: WRASI_I	wr	%r0, 0x0073, %asi
	mov	0x8, %r16
	.word 0xe4c7e000  ! 724: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0xe497e000  ! 725: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0x87802072  ! 726: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe49fa000  ! 727: LDDA_I	ldda	[%r30, + 0x0000] %asi, %r18
	.word 0xe4bf8e40  ! 728: STDA_R	stda	%r18, [%r30 + %r0] 0x72
	mov	0x68, %r16
	.word 0xe4af2000  ! 730: STBA_I	stba	%r18, [%r28 + 0x0000] %asi
	wr_tick_cmpr_12:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xef, %g2
	or	%g4, 0xae, %g4
	or	%g6, 0xbd, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0x87802020  ! 732: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 733: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 734: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8bc0400  ! 735: STDA_R	stda	%r20, [%r16 + %r0] 0x20
	.word 0xe8c4a000  ! 736: LDSWA_I	ldswa	[%r18, + 0x0000] %asi, %r20
	.word 0xe4b7ce60  ! 737: STHA_R	stha	%r18, [%r31 + %r0] 0x73
	.word 0xe2c40400  ! 738: LDSWA_R	ldswa	[%r16, %r0] 0x20, %r17
	.word 0x87802020  ! 739: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802025  ! 740: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2bda000  ! 741: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	.word 0xecb70e60  ! 742: STHA_R	stha	%r22, [%r28 + %r0] 0x73
	mov	0x38, %r16
	.word 0x8780204f  ! 744: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xecbd84a0  ! 745: STDA_R	stda	%r22, [%r22 + %r0] 0x25
	.word 0xec966000  ! 746: LDUHA_I	lduha	[%r25, + 0x0000] %asi, %r22
	.word 0xecccc400  ! 747: LDSBA_R	ldsba	[%r19, %r0] 0x20, %r22
	mov	0x30, %r16
	.word 0xecb6e000  ! 749: STHA_I	stha	%r22, [%r27 + 0x0000] %asi
	.word 0xecb62000  ! 750: STHA_I	stha	%r22, [%r24 + 0x0000] %asi
	.word 0xe8bf4e60  ! 751: STDA_R	stda	%r20, [%r29 + %r0] 0x73
	.word 0xe6c48400  ! 752: LDSWA_R	ldswa	[%r18, %r0] 0x20, %r19
	.word 0xecbfce40  ! 753: STDA_R	stda	%r22, [%r31 + %r0] 0x72
	.word 0xe09609e0  ! 754: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r16
	.word 0xe0dee000  ! 755: LDXA_I	ldxa	[%r27, + 0x0000] %asi, %r16
	.word 0xe4a48400  ! 756: STWA_R	stwa	%r18, [%r18 + %r0] 0x20
	.word 0xe4a74e60  ! 757: STWA_R	stwa	%r18, [%r29 + %r0] 0x73
	.word 0x87802025  ! 758: WRASI_I	wr	%r0, 0x0025, %asi
	mov	0x7c8, %r20
	.word 0xe4bd6000  ! 760: STDA_I	stda	%r18, [%r21 + 0x0000] %asi
	.word 0xe48d6000  ! 761: LDUBA_I	lduba	[%r21, + 0x0000] %asi, %r18
	mov	0x3d8, %r23
	mov	0x68, %r16
	.word 0x8780204f  ! 764: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6ad04a0  ! 765: STBA_R	stba	%r19, [%r20 + %r0] 0x25
	mov	0x7e0, %r21
	.word 0xe6de6000  ! 767: LDXA_I	ldxa	[%r25, + 0x0000] %asi, %r19
	wr_tick_cmpr_13:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0x96, %g2
	or	%g4, 0xd8, %g4
	or	%g6, 0xe4, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0x87802072  ! 769: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe8f70e40  ! 770: STXA_R	stxa	%r20, [%r28 + %r0] 0x72
	mov	0x30, %r16
	mov	0x38, %r16
	.word 0xe8c7e000  ! 773: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0xe4c584a0  ! 774: LDSWA_R	ldswa	[%r22, %r0] 0x25, %r18
	.word 0xe4f72000  ! 775: STXA_I	stxa	%r18, [%r28 + 0x0000] %asi
	.word 0xe48fa000  ! 776: LDUBA_I	lduba	[%r30, + 0x0000] %asi, %r18
	.word 0xe8f5c4a0  ! 777: STXA_R	stxa	%r20, [%r23 + %r0] 0x25
	.word 0x87802020  ! 778: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8a4a000  ! 779: STWA_I	stwa	%r20, [%r18 + 0x0000] %asi
	wr_tick_cmpr_14:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x8a, %g2
	or	%g4, 0xf8, %g4
	or	%g6, 0xba, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 2, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0x87802025  ! 781: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0x87802072  ! 782: WRASI_I	wr	%r0, 0x0072, %asi
	mov	0x3d0, %r23
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xeabfce60  ! 785: STDA_R	stda	%r21, [%r31 + %r0] 0x73
	.word 0xeaaf2000  ! 786: STBA_I	stba	%r21, [%r28 + 0x0000] %asi
	mov	0x78, %r24
	mov	0x3c8, %r21
	.word 0x87802074  ! 789: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeac70e60  ! 790: LDSWA_R	ldswa	[%r28, %r0] 0x73, %r21
	.word 0xea9fe000  ! 791: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r21
	.word 0xeacf2000  ! 792: LDSBA_I	ldsba	[%r28, + 0x0000] %asi, %r21
	.word 0xea972000  ! 793: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r21
	mov	0x20, %r25
	.word 0xeaf72000  ! 795: STXA_I	stxa	%r21, [%r28 + 0x0000] %asi
	.word 0xeaafa000  ! 796: STBA_I	stba	%r21, [%r30 + 0x0000] %asi
	.word 0xe6bf0e40  ! 797: STDA_R	stda	%r19, [%r28 + %r0] 0x72
	.word 0x87802072  ! 798: WRASI_I	wr	%r0, 0x0072, %asi
	wr_tick_cmpr_15:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x81, %g2
	or	%g4, 0x9e, %g4
	or	%g6, 0xb7, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0x87802020  ! 800: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x7d8, %r21
	.word 0xe4cc8400  ! 802: LDSBA_R	ldsba	[%r18, %r0] 0x20, %r18
	wr_tick_cmpr_16:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xf9, %g2
	or	%g4, 0xbb, %g4
	or	%g6, 0xfe, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xeadc8400  ! 804: LDXA_R	ldxa	[%r18, %r0] 0x20, %r21
	mov	0x7f0, %r23
	.word 0xe0a74e40  ! 806: STWA_R	stwa	%r16, [%r29 + %r0] 0x72
	.word 0x87802072  ! 807: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0d7a000  ! 808: LDSHA_I	ldsha	[%r30, + 0x0000] %asi, %r16
	.word 0x87802072  ! 809: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0x87802072  ! 810: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0f7a000  ! 811: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	.word 0xe4dc8400  ! 812: LDXA_R	ldxa	[%r18, %r0] 0x20, %r18
	mov	0x20, %r16
	.word 0xe6d40400  ! 814: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r19
	.word 0xe6cfe000  ! 815: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	mov	0x78, %r24
	.word 0xe6cfa000  ! 817: LDSBA_I	ldsba	[%r30, + 0x0000] %asi, %r19
	.word 0x87802020  ! 818: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xee87ce40  ! 819: LDUWA_R	lduwa	[%r31, %r0] 0x72, %r23
	.word 0xeecc6000  ! 820: LDSBA_I	ldsba	[%r17, + 0x0000] %asi, %r23
	.word 0xee942000  ! 821: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r23
	.word 0xee84e000  ! 822: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r23
	mov	0x48, %r25
	.word 0xeecc2000  ! 824: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r23
	.word 0xee9ca000  ! 825: LDDA_I	ldda	[%r18, + 0x0000] %asi, %r23
	.word 0xe4c7ce80  ! 826: LDSWA_R	ldswa	[%r31, %r0] 0x74, %r18
	.word 0xe4ac2000  ! 827: STBA_I	stba	%r18, [%r16 + 0x0000] %asi
	mov	0x3e0, %r20
	mov	0x8, %r25
	.word 0xeec5c4a0  ! 830: LDSWA_R	ldswa	[%r23, %r0] 0x25, %r23
	.word 0xe28e49e0  ! 831: LDUBA_R	lduba	[%r25, %r0] 0x4f, %r17
	.word 0xe2946000  ! 832: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r17
	.word 0x87802025  ! 833: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe2b56000  ! 834: STHA_I	stha	%r17, [%r21 + 0x0000] %asi
	.word 0xe2b5e000  ! 835: STHA_I	stha	%r17, [%r23 + 0x0000] %asi
	.word 0xecb7ce40  ! 836: STHA_R	stha	%r22, [%r31 + %r0] 0x72
	.word 0xe8870e40  ! 837: LDUWA_R	lduwa	[%r28, %r0] 0x72, %r20
	mov	0x7e0, %r23
	.word 0xe0ac0400  ! 839: STBA_R	stba	%r16, [%r16 + %r0] 0x20
	.word 0x87802073  ! 840: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe0dfe000  ! 841: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	mov	0x3f0, %r23
	.word 0xe0dfe000  ! 843: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0xe0a7a000  ! 844: STWA_I	stwa	%r16, [%r30 + 0x0000] %asi
	.word 0xe0972000  ! 845: LDUHA_I	lduha	[%r28, + 0x0000] %asi, %r16
	.word 0xecf40400  ! 846: STXA_R	stxa	%r22, [%r16 + %r0] 0x20
	mov	0x48, %r25
	.word 0x87802020  ! 848: WRASI_I	wr	%r0, 0x0020, %asi
	mov	0x38, %r24
	.word 0xe4a44400  ! 850: STWA_R	stwa	%r18, [%r17 + %r0] 0x20
	.word 0x8780204f  ! 851: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8780204f  ! 852: WRASI_I	wr	%r0, 0x004f, %asi
	mov	0x8, %r26
	wr_tick_cmpr_17:
	ta	T_CHANGE_HPRIV
	setx	0x8000000000000000, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x8000000000000000, %g1, %g6
	or	%g2, 0xf2, %g2
	or	%g4, 0x91, %g4
	or	%g6, 0xa3, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xe4aee000  ! 855: STBA_I	stba	%r18, [%r27 + 0x0000] %asi
	.word 0xe4bee000  ! 856: STDA_I	stda	%r18, [%r27 + 0x0000] %asi
	.word 0xe4a609e0  ! 857: STWA_R	stwa	%r18, [%r24 + %r0] 0x4f
	.word 0x87802025  ! 858: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe4b5a000  ! 859: STHA_I	stha	%r18, [%r22 + 0x0000] %asi
	.word 0xe4b56000  ! 860: STHA_I	stha	%r18, [%r21 + 0x0000] %asi
	.word 0xe4a5e000  ! 861: STWA_I	stwa	%r18, [%r23 + 0x0000] %asi
	.word 0xe29649e0  ! 862: LDUHA_R	lduha	[%r25, %r0] 0x4f, %r17
	.word 0xe2ad6000  ! 863: STBA_I	stba	%r17, [%r21 + 0x0000] %asi
	.word 0xe2d5a000  ! 864: LDSHA_I	ldsha	[%r22, + 0x0000] %asi, %r17
	.word 0xe2bda000  ! 865: STDA_I	stda	%r17, [%r22 + 0x0000] %asi
	mov	0x7c8, %r23
	.word 0xe2b52000  ! 867: STHA_I	stha	%r17, [%r20 + 0x0000] %asi
	mov	0x58, %r25
	.word 0x87802020  ! 869: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe08f0e60  ! 870: LDUBA_R	lduba	[%r28, %r0] 0x73, %r16
	.word 0xe0946000  ! 871: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r16
	mov	0x7d0, %r23
	mov	0x10, %r19
	.word 0xeeaf8e40  ! 874: STBA_R	stba	%r23, [%r30 + %r0] 0x72
	.word 0xecaf4e60  ! 875: STBA_R	stba	%r22, [%r29 + %r0] 0x73
	.word 0x87802025  ! 876: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xe8d40400  ! 877: LDSHA_R	ldsha	[%r16, %r0] 0x20, %r20
	.word 0xe8ad6000  ! 878: STBA_I	stba	%r20, [%r21 + 0x0000] %asi
	.word 0xe09d04a0  ! 879: LDDA_R	ldda	[%r20, %r0] 0x25, %r16
	mov	0x3f0, %r21
	.word 0xe0cd6000  ! 881: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r16
	.word 0xe0dde000  ! 882: LDXA_I	ldxa	[%r23, + 0x0000] %asi, %r16
	.word 0xe6ad04a0  ! 883: STBA_R	stba	%r19, [%r20 + %r0] 0x25
	mov	0x48, %r24
	.word 0x87802074  ! 885: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xe0b40400  ! 886: STHA_R	stha	%r16, [%r16 + %r0] 0x20
	.word 0x87802020  ! 887: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xeab6c9e0  ! 888: STHA_R	stha	%r21, [%r27 + %r0] 0x4f
	.word 0xead46000  ! 889: LDSHA_I	ldsha	[%r17, + 0x0000] %asi, %r21
	.word 0xeaac2000  ! 890: STBA_I	stba	%r21, [%r16 + 0x0000] %asi
	mov	0x3c0, %r22
	.word 0x87802020  ! 892: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xea946000  ! 893: LDUHA_I	lduha	[%r17, + 0x0000] %asi, %r21
	.word 0xeaac6000  ! 894: STBA_I	stba	%r21, [%r17 + 0x0000] %asi
	.word 0xea942000  ! 895: LDUHA_I	lduha	[%r16, + 0x0000] %asi, %r21
	.word 0xea8c2000  ! 896: LDUBA_I	lduba	[%r16, + 0x0000] %asi, %r21
	.word 0xeacce000  ! 897: LDSBA_I	ldsba	[%r19, + 0x0000] %asi, %r21
	.word 0xe89fce60  ! 898: LDDA_R	ldda	[%r31, %r0] 0x73, %r20
	mov	0x18, %r18
	mov	0x8, %r26
	.word 0xe0f74e80  ! 901: STXA_R	stxa	%r16, [%r29 + %r0] 0x74
	.word 0xe0846000  ! 902: LDUWA_I	lduwa	[%r17, + 0x0000] %asi, %r16
	.word 0x87802072  ! 903: WRASI_I	wr	%r0, 0x0072, %asi
	.word 0xe0bf2000  ! 904: STDA_I	stda	%r16, [%r28 + 0x0000] %asi
	mov	0x58, %r19
	wr_tick_cmpr_18:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x0, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0x89, %g2
	or	%g4, 0x8b, %g4
	or	%g6, 0xd4, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	mov	0x18, %r19
	.word 0xe087e000  ! 908: LDUWA_I	lduwa	[%r31, + 0x0000] %asi, %r16
	.word 0xe0f7a000  ! 909: STXA_I	stxa	%r16, [%r30 + 0x0000] %asi
	.word 0x87802025  ! 910: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeac74e80  ! 911: LDSWA_R	ldswa	[%r29, %r0] 0x74, %r21
	.word 0xe88f8e80  ! 912: LDUBA_R	lduba	[%r30, %r0] 0x74, %r20
	.word 0xe8852000  ! 913: LDUWA_I	lduwa	[%r20, + 0x0000] %asi, %r20
	.word 0xe8ad2000  ! 914: STBA_I	stba	%r20, [%r20 + 0x0000] %asi
	mov	0x60, %r17
	.word 0xe8cd6000  ! 916: LDSBA_I	ldsba	[%r21, + 0x0000] %asi, %r20
	.word 0xe8a56000  ! 917: STWA_I	stwa	%r20, [%r21 + 0x0000] %asi
	.word 0xe8a52000  ! 918: STWA_I	stwa	%r20, [%r20 + 0x0000] %asi
	.word 0xe8cde000  ! 919: LDSBA_I	ldsba	[%r23, + 0x0000] %asi, %r20
	.word 0xe8952000  ! 920: LDUHA_I	lduha	[%r20, + 0x0000] %asi, %r20
	.word 0xe89de000  ! 921: LDDA_I	ldda	[%r23, + 0x0000] %asi, %r20
	.word 0xe6f44400  ! 922: STXA_R	stxa	%r19, [%r17 + %r0] 0x20
	.word 0xe6f52000  ! 923: STXA_I	stxa	%r19, [%r20 + 0x0000] %asi
	mov	0x30, %r24
	.word 0xe2bf4e60  ! 925: STDA_R	stda	%r17, [%r29 + %r0] 0x73
	.word 0xe2b5a000  ! 926: STHA_I	stha	%r17, [%r22 + 0x0000] %asi
	.word 0xe28584a0  ! 927: LDUWA_R	lduwa	[%r22, %r0] 0x25, %r17
	.word 0xe2a5e000  ! 928: STWA_I	stwa	%r17, [%r23 + 0x0000] %asi
	.word 0xeede89e0  ! 929: LDXA_R	ldxa	[%r26, %r0] 0x4f, %r23
	.word 0xe2bf8e80  ! 930: STDA_R	stda	%r17, [%r30 + %r0] 0x74
	mov	0x3f8, %r21
	.word 0xe8f74e40  ! 932: STXA_R	stxa	%r20, [%r29 + %r0] 0x72
	.word 0xea9e89e0  ! 933: LDDA_R	ldda	[%r26, %r0] 0x4f, %r21
	.word 0xeaf5e000  ! 934: STXA_I	stxa	%r21, [%r23 + 0x0000] %asi
	mov	0x3c0, %r23
	.word 0xe0af4e80  ! 936: STBA_R	stba	%r16, [%r29 + %r0] 0x74
	.word 0xe0ce09e0  ! 937: LDSBA_R	ldsba	[%r24, %r0] 0x4f, %r16
	.word 0xe0a5a000  ! 938: STWA_I	stwa	%r16, [%r22 + 0x0000] %asi
	mov	0x7f0, %r22
	.word 0xe095e000  ! 940: LDUHA_I	lduha	[%r23, + 0x0000] %asi, %r16
	mov	0x3d0, %r23
	.word 0xe095a000  ! 942: LDUHA_I	lduha	[%r22, + 0x0000] %asi, %r16
	.word 0xec9e09e0  ! 943: LDDA_R	ldda	[%r24, %r0] 0x4f, %r22
	.word 0xe4c504a0  ! 944: LDSWA_R	ldswa	[%r20, %r0] 0x25, %r18
	mov	0x18, %r24
	.word 0xe4f56000  ! 946: STXA_I	stxa	%r18, [%r21 + 0x0000] %asi
	.word 0xe49da000  ! 947: LDDA_I	ldda	[%r22, + 0x0000] %asi, %r18
	.word 0x87802074  ! 948: WRASI_I	wr	%r0, 0x0074, %asi
	.word 0xeea70e40  ! 949: STWA_R	stwa	%r23, [%r28 + %r0] 0x72
	.word 0xeea7a000  ! 950: STWA_I	stwa	%r23, [%r30 + 0x0000] %asi
	.word 0x8780204f  ! 951: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6f6c9e0  ! 952: STXA_R	stxa	%r19, [%r27 + %r0] 0x4f
	.word 0x8780204f  ! 953: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6a6e000  ! 954: STWA_I	stwa	%r19, [%r27 + 0x0000] %asi
	.word 0x87802073  ! 955: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xe6f7e000  ! 956: STXA_I	stxa	%r19, [%r31 + 0x0000] %asi
	.word 0xe6dfe000  ! 957: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0xe697a000  ! 958: LDUHA_I	lduha	[%r30, + 0x0000] %asi, %r19
	mov	0x68, %r19
	.word 0xe6c76000  ! 960: LDSWA_I	ldswa	[%r29, + 0x0000] %asi, %r19
	mov	0x30, %r19
	mov	0x70, %r27
	.word 0xe6dfe000  ! 963: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	mov	0x48, %r26
	mov	0x10, %r19
	mov	0x38, %r16
	.word 0xe6c78e80  ! 967: LDSWA_R	ldswa	[%r30, %r0] 0x74, %r19
	.word 0xeece89e0  ! 968: LDSBA_R	ldsba	[%r26, %r0] 0x4f, %r23
	.word 0x87802073  ! 969: WRASI_I	wr	%r0, 0x0073, %asi
	.word 0xecde09e0  ! 970: LDXA_R	ldxa	[%r24, %r0] 0x4f, %r22
	.word 0xeca7e000  ! 971: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xeca7e000  ! 972: STWA_I	stwa	%r22, [%r31 + 0x0000] %asi
	.word 0xe0a70e80  ! 973: STWA_R	stwa	%r16, [%r28 + %r0] 0x74
	.word 0x87802025  ! 974: WRASI_I	wr	%r0, 0x0025, %asi
	.word 0xeea48400  ! 975: STWA_R	stwa	%r23, [%r18 + %r0] 0x20
	.word 0xe8a7ce60  ! 976: STWA_R	stwa	%r20, [%r31 + %r0] 0x73
	.word 0xe8a5e000  ! 977: STWA_I	stwa	%r20, [%r23 + 0x0000] %asi
	.word 0xe0bc0400  ! 978: STDA_R	stda	%r16, [%r16 + %r0] 0x20
	.word 0x87802020  ! 979: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe0f42000  ! 980: STXA_I	stxa	%r16, [%r16 + 0x0000] %asi
	.word 0xeea504a0  ! 981: STWA_R	stwa	%r23, [%r20 + %r0] 0x25
	.word 0xeeaec9e0  ! 982: STBA_R	stba	%r23, [%r27 + %r0] 0x4f
	mov	0x48, %r16
	.word 0xee8c6000  ! 984: LDUBA_I	lduba	[%r17, + 0x0000] %asi, %r23
	mov	0x3d8, %r21
	.word 0xe4b40400  ! 986: STHA_R	stha	%r18, [%r16 + %r0] 0x20
	wr_tick_cmpr_19:
	ta	T_CHANGE_HPRIV
	setx	0x0, %g1, %g2
	setx	0x8000000000000000, %g1, %g4
	setx	0x0, %g1, %g6
	or	%g2, 0xa9, %g2
	or	%g4, 0x9a, %g4
	or	%g6, 0x94, %g6
	wrpr	%g0, 0, %tick
	wr	%g2, 0, %tick_cmpr
	wr	%g4, 0, %sys_tick_cmpr
	wrhpr	%g6, 0, %hsys_tick_cmpr
	rdpr	%pstate, %g1
	wrpr	%g1, 0, %pstate
	ta	T_CHANGE_NONHPRIV
	.word 0xeca40400  ! 988: STWA_R	stwa	%r22, [%r16 + %r0] 0x20
	.word 0xec94a000  ! 989: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r22
	.word 0x87802020  ! 990: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe69609e0  ! 991: LDUHA_R	lduha	[%r24, %r0] 0x4f, %r19
	mov	0x3e0, %r21
	.word 0x8780204f  ! 993: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2a70e60  ! 994: STWA_R	stwa	%r17, [%r28 + %r0] 0x73
	.word 0xe2c6e000  ! 995: LDSWA_I	ldswa	[%r27, + 0x0000] %asi, %r17
	.word 0xe8c689e0  ! 996: LDSWA_R	ldswa	[%r26, %r0] 0x4f, %r20
	.word 0xe4a584a0  ! 997: STWA_R	stwa	%r18, [%r22 + %r0] 0x25
	.word 0xe4d6e000  ! 998: LDSHA_I	ldsha	[%r27, + 0x0000] %asi, %r18
	.data
data_start:

	.xword	0x6a395f381bdc7771
	.xword	0xa38c2a69de721629
	.xword	0x11898bf2543d699b
	.xword	0xca7ea633b9b31413
	.xword	0xc71a872e4f1bfecd
	.xword	0x70cda1422b6906f7
	.xword	0xbd76275fe6edc7cb
	.xword	0x9c057a654331e8bd
	.xword	0xcf9d1005ef1f0ac5
	.xword	0xfdc99c5010b7e589
	.xword	0x034ee75947b016df
	.xword	0xae2b246291a5c761
	.xword	0xda73f4fd82c4adcd
	.xword	0xa07a38e05321eb4b
	.xword	0x1c4171f92ab8c13a
	.xword	0x393e961458dbae63



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
