// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_intrp_trap_2_rand_s1.s
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
   random seed:	778442382
   Jal tlu_intrp_trap_2.j:	
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

! Register init code

	setx 0xe25cd25e00007d4a, %g1, %g0
	setx 0xa325ae6a00008dac, %g1, %g1
	setx 0xfd72f5df00006bf0, %g1, %g2
	setx 0xad91fc8100006aa2, %g1, %g3
	setx 0xb9c82f3f00003d53, %g1, %g4
	setx 0x6e49339200005dc8, %g1, %g5
	setx 0xd1a4f1c50000ad9a, %g1, %g6
	setx 0xd14fcc5d0000f841, %g1, %g7
	setx 0x2cf98d8800002c79, %g1, %r16
	setx 0xb5ac73d30000ff8c, %g1, %r17
	setx 0xa9764d3e00002873, %g1, %r18
	setx 0xc1ecd37d00004cab, %g1, %r19
	setx 0xe875425a0000eee1, %g1, %r20
	setx 0x5c2af30c00000920, %g1, %r21
	setx 0xe03f86b50000c926, %g1, %r22
	setx 0xef414dd40000e854, %g1, %r23
	setx 0xacff7d3c0000cbfc, %g1, %r24
	setx 0xb61b85ea0000c9b9, %g1, %r25
	setx 0xe9421436000098ec, %g1, %r26
	setx 0x1e8d3dc800004dce, %g1, %r27
	setx 0x8363a25700008d5c, %g1, %r28
	setx 0x2b196bae00004bab, %g1, %r29
	setx 0x6ea5826500002cdc, %g1, %r30
	setx 0xc2dac69c0000ebe2, %g1, %r31
	save
	setx 0x07ea582000006faa, %g1, %r16
	setx 0x341987f40000c8a3, %g1, %r17
	setx 0x1c18ffee0000a94a, %g1, %r18
	setx 0x8f08396f00008d82, %g1, %r19
	setx 0xc9c1a6170000fbe3, %g1, %r20
	setx 0xa8f195b30000da31, %g1, %r21
	setx 0x2cee9e310000de91, %g1, %r22
	setx 0xb605d3f100002ff3, %g1, %r23
	setx 0x7b3c15c800000d3b, %g1, %r24
	setx 0xa771302d00009f57, %g1, %r25
	setx 0x0863a5e50000aaef, %g1, %r26
	setx 0xe70cb90f00007bec, %g1, %r27
	setx 0x3395038d0000f871, %g1, %r28
	setx 0x8fbad6ea00008fed, %g1, %r29
	setx 0xf9e8055200009f68, %g1, %r30
	setx 0xe2fb5c0900007eff, %g1, %r31
	save
	setx 0x551e157a00008966, %g1, %r16
	setx 0x85ddfdc90000cf4f, %g1, %r17
	setx 0x05ce90760000ec27, %g1, %r18
	setx 0x01eb834100008b4e, %g1, %r19
	setx 0xa4e1ad8e00005ff8, %g1, %r20
	setx 0xa231690000002d8a, %g1, %r21
	setx 0x925eb3ce00007fd4, %g1, %r22
	setx 0x0327e22000005f2c, %g1, %r23
	setx 0xea0d4d710000bf25, %g1, %r24
	setx 0x2a9792c000004efa, %g1, %r25
	setx 0xce7e59d50000f836, %g1, %r26
	setx 0x0675780000008e98, %g1, %r27
	setx 0xbd667dad00002d33, %g1, %r28
	setx 0xe517d2090000ba3f, %g1, %r29
	setx 0x2268aabf00001f7f, %g1, %r30
	setx 0xe163827c0000dffd, %g1, %r31
	save
	setx 0x9343e6bf00001dd4, %g1, %r16
	setx 0x7a1283c100007d7d, %g1, %r17
	setx 0x34d09df50000fdf7, %g1, %r18
	setx 0x72d08b9c0000bee4, %g1, %r19
	setx 0xa595c4d90000d944, %g1, %r20
	setx 0xf8f5992800004fc6, %g1, %r21
	setx 0xdfe20cd400000bff, %g1, %r22
	setx 0xa4e3c3550000b9ab, %g1, %r23
	setx 0x89fbaab100007bad, %g1, %r24
	setx 0x817ef33f0000085c, %g1, %r25
	setx 0x000bbbb000004b8d, %g1, %r26
	setx 0xda9dc9b50000dfb4, %g1, %r27
	setx 0x81cf2aab00005812, %g1, %r28
	setx 0x5cdd040100006b96, %g1, %r29
	setx 0xe80154d000005b4d, %g1, %r30
	setx 0xe1efff270000ba62, %g1, %r31
	save
	setx 0xec0308f20000893b, %g1, %r16
	setx 0xd8467d1c00006ce8, %g1, %r17
	setx 0x6d30385000003e91, %g1, %r18
	setx 0xe3eacc1d0000ce1f, %g1, %r19
	setx 0x08a64c0f00003af0, %g1, %r20
	setx 0xf52ba8d40000edb0, %g1, %r21
	setx 0x22cff3f900001847, %g1, %r22
	setx 0x3c530f2200006c9d, %g1, %r23
	setx 0x5bf8554e00006890, %g1, %r24
	setx 0xeb4354780000bd35, %g1, %r25
	setx 0x827b84f00000f900, %g1, %r26
	setx 0x173a328d0000ef18, %g1, %r27
	setx 0xae7b38b100000e41, %g1, %r28
	setx 0x610fe6f00000cfaf, %g1, %r29
	setx 0xc1624e0e00007b9e, %g1, %r30
	setx 0xfa9f97660000a971, %g1, %r31
	save
	setx 0xe21b5ab30000ff3d, %g1, %r16
	setx 0x44257a8a00001c42, %g1, %r17
	setx 0xfc1860da0000eff6, %g1, %r18
	setx 0x1c4d80e70000dcdd, %g1, %r19
	setx 0x75d3a6fa00004c88, %g1, %r20
	setx 0x2e90552e0000eb6e, %g1, %r21
	setx 0xe60b0fa700004ef9, %g1, %r22
	setx 0x6115620f0000cadd, %g1, %r23
	setx 0x9387ee2b00004d1e, %g1, %r24
	setx 0x6421fd6b0000aa71, %g1, %r25
	setx 0x086e8d3b0000db3c, %g1, %r26
	setx 0x2f6a508300005885, %g1, %r27
	setx 0x462b7a280000b890, %g1, %r28
	setx 0xc73f347100003e7e, %g1, %r29
	setx 0x93f08dcd00006816, %g1, %r30
	setx 0xf3d557a50000491b, %g1, %r31
	save
	setx 0x35d079010000ab63, %g1, %r16
	setx 0x6442acdc00004cff, %g1, %r17
	setx 0x775094bb00009a6b, %g1, %r18
	setx 0xba7d4daf00001cd1, %g1, %r19
	setx 0x9e949f7000005e36, %g1, %r20
	setx 0x83333e0600004c5b, %g1, %r21
	setx 0x892c029e00007d35, %g1, %r22
	setx 0x838bec9100002fd6, %g1, %r23
	setx 0x20d6c12700009dfd, %g1, %r24
	setx 0x98af19e10000fcb6, %g1, %r25
	setx 0x510fb0ac00005c7b, %g1, %r26
	setx 0xc7e907e90000299d, %g1, %r27
	setx 0x0a6bdf860000cd7f, %g1, %r28
	setx 0x337188f100000d2f, %g1, %r29
	setx 0xa49889320000fbce, %g1, %r30
	setx 0x242d2a510000897c, %g1, %r31
	save
	setx 0x6bafe80a000049d4, %g1, %r16
	setx 0xdbe7562700002a34, %g1, %r17
	setx 0x7a74125a00000ad2, %g1, %r18
	setx 0xdd3711f30000685a, %g1, %r19
	setx 0x360ce4d3000059fc, %g1, %r20
	setx 0x1e85dba300008daa, %g1, %r21
	setx 0x153f392d00001dde, %g1, %r22
	setx 0xadb7631300005cb9, %g1, %r23
	setx 0x06cace510000bde4, %g1, %r24
	setx 0x210da55e00001f59, %g1, %r25
	setx 0x8ab6d655000038ca, %g1, %r26
	setx 0xbf6be0dd00003a2a, %g1, %r27
	setx 0xb28d2cba00004a53, %g1, %r28
	setx 0x7f7373e800007e57, %g1, %r29
	setx 0x36706e890000ce13, %g1, %r30
	setx 0x89859b470000e860, %g1, %r31
	restore
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
	.word 0xa1504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0xa1e46000  ! 2: SAVE_I	save	%r17, 0x0001, %r16
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 0)
	.word 0x01000000  ! 3: NOP	nop
	.word 0xb9e4e000  ! 4: SAVE_I	save	%r19, 0x0001, %r28
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 3)
	.word 0x01000000  ! 5: NOP	nop
	.word 0x839ee000  ! 6: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 17)
	.word 0x01000000  ! 7: NOP	nop
	.word 0x83942000  ! 8: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x87942000  ! 9: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa5e76000  ! 10: SAVE_I	save	%r29, 0x0001, %r18
	.word 0xa7484000  ! 11: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0x87942000  ! 12: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbd500000  ! 13: RDPR_TPC	<illegal instruction>
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 5)
	.word 0x01000000  ! 14: NOP	nop
	.word 0x8796a000  ! 15: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x87972000  ! 16: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839d6000  ! 17: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa3508000  ! 18: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e66000  ! 19: SAVE_I	save	%r25, 0x0001, %r25
	.word 0xbd50c000  ! 20: RDPR_TT	<illegal instruction>
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 7)
	.word 0x01000000  ! 21: NOP	nop
	.word 0xa3e7e000  ! 22: SAVE_I	save	%r31, 0x0001, %r17
	.word 0x8195a000  ! 23: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa7500000  ! 24: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xa5e76000  ! 26: SAVE_I	save	%r29, 0x0001, %r18
	.word 0x81966000  ! 27: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 3f)
	.word 0x01000000  ! 28: NOP	nop
	.word 0xbb484000  ! 29: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xa9e42000  ! 30: SAVE_I	save	%r16, 0x0001, %r20
	.word 0x839fa000  ! 31: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 31)
	.word 0x01000000  ! 32: NOP	nop
	.word 0xa350c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 34: RDPR_TPC	<illegal instruction>
	.word 0xbbe66000  ! 35: SAVE_I	save	%r25, 0x0001, %r29
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 39)
	.word 0x01000000  ! 36: NOP	nop
	.word 0xa1508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 38: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 1d)
	.word 0x01000000  ! 39: NOP	nop
	.word 0xa5e66000  ! 40: SAVE_I	save	%r25, 0x0001, %r18
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 2a)
	.word 0x01000000  ! 41: NOP	nop
	.word 0x8796a000  ! 42: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x83966000  ! 43: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839c6000  ! 44: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x83966000  ! 45: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 23)
	.word 0x01000000  ! 46: NOP	nop
	.word 0xbd500000  ! 47: RDPR_TPC	<illegal instruction>
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, f)
	.word 0x01000000  ! 48: NOP	nop
	.word 0x839ea000  ! 49: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb9484000  ! 50: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xabe5e000  ! 51: SAVE_I	save	%r23, 0x0001, %r21
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 30)
	.word 0x01000000  ! 52: NOP	nop
	.word 0xbde42000  ! 53: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5e000  ! 54: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 32)
	.word 0x01000000  ! 55: NOP	nop
	.word 0xa1484000  ! 56: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xbb504000  ! 57: RDPR_TNPC	<illegal instruction>
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 5)
	.word 0x01000000  ! 58: NOP	nop
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 30)
	.word 0x01000000  ! 59: NOP	nop
	.word 0x8596a000  ! 60: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbf50c000  ! 61: RDPR_TT	<illegal instruction>
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 26)
	.word 0x01000000  ! 62: NOP	nop
	.word 0x85942000  ! 63: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x87952000  ! 64: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa950c000  ! 65: RDPR_TT	<illegal instruction>
	.word 0xa1e6a000  ! 66: SAVE_I	save	%r26, 0x0001, %r16
	.word 0xb1504000  ! 67: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 68: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb7e76000  ! 69: SAVE_I	save	%r29, 0x0001, %r27
	.word 0x87942000  ! 70: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8597a000  ! 71: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 3d)
	.word 0x01000000  ! 72: NOP	nop
	.word 0x8597a000  ! 73: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa9e72000  ! 74: SAVE_I	save	%r28, 0x0001, %r20
	.word 0xb1e42000  ! 75: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x81976000  ! 76: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbfe6e000  ! 77: SAVE_I	save	%r27, 0x0001, %r31
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 26)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x83942000  ! 79: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83946000  ! 80: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb5e6a000  ! 81: SAVE_I	save	%r26, 0x0001, %r26
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 2f)
	.word 0x01000000  ! 82: NOP	nop
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 5)
	.word 0x01000000  ! 83: NOP	nop
	.word 0xbbe72000  ! 84: SAVE_I	save	%r28, 0x0001, %r29
	.word 0x8197a000  ! 85: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbfe52000  ! 86: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xad508000  ! 87: RDPR_TSTATE	<illegal instruction>
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 20)
	.word 0x01000000  ! 88: NOP	nop
	.word 0xa5508000  ! 89: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 90: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 91: RDPR_TPC	<illegal instruction>
	.word 0xabe4a000  ! 92: SAVE_I	save	%r18, 0x0001, %r21
	.word 0xb9508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0x81946000  ! 94: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, b)
	.word 0x01000000  ! 95: NOP	nop
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 38)
	.word 0x01000000  ! 96: NOP	nop
	.word 0x8194a000  ! 97: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb1500000  ! 98: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 99: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb1504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xb9e4a000  ! 102: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8195a000  ! 103: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb5484000  ! 104: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0x83972000  ! 105: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xad508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 107: NOP	nop
	.word 0xabe76000  ! 108: SAVE_I	save	%r29, 0x0001, %r21
	.word 0xa5e56000  ! 109: SAVE_I	save	%r21, 0x0001, %r18
	.word 0xb350c000  ! 110: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 111: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 27)
	.word 0x01000000  ! 112: NOP	nop
	.word 0xbfe62000  ! 113: SAVE_I	save	%r24, 0x0001, %r31
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 21)
	.word 0x01000000  ! 114: NOP	nop
	.word 0xa7e42000  ! 115: SAVE_I	save	%r16, 0x0001, %r19
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 2d)
	.word 0x01000000  ! 116: NOP	nop
	.word 0x8794e000  ! 117: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8597a000  ! 118: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8795a000  ! 119: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8194e000  ! 120: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 4)
	.word 0x01000000  ! 121: NOP	nop
	.word 0xa3e56000  ! 122: SAVE_I	save	%r21, 0x0001, %r17
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 24)
	.word 0x01000000  ! 123: NOP	nop
	.word 0xb7504000  ! 124: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 125: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xafe56000  ! 126: SAVE_I	save	%r21, 0x0001, %r23
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 2a)
	.word 0x01000000  ! 127: NOP	nop
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 8)
	.word 0x01000000  ! 128: NOP	nop
	.word 0xad500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0xbbe72000  ! 130: SAVE_I	save	%r28, 0x0001, %r29
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, f)
	.word 0x01000000  ! 131: NOP	nop
	.word 0x839fa000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8795e000  ! 133: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x87972000  ! 134: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbfe7a000  ! 135: SAVE_I	save	%r30, 0x0001, %r31
	.word 0xb5484000  ! 136: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0x81952000  ! 137: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 30)
	.word 0x01000000  ! 138: NOP	nop
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 18)
	.word 0x01000000  ! 139: NOP	nop
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 26)
	.word 0x01000000  ! 140: NOP	nop
	.word 0xa3500000  ! 141: RDPR_TPC	<illegal instruction>
	.word 0xa5484000  ! 142: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xb7504000  ! 143: RDPR_TNPC	<illegal instruction>
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 38)
	.word 0x01000000  ! 144: NOP	nop
	.word 0xb5500000  ! 145: RDPR_TPC	<illegal instruction>
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 9)
	.word 0x01000000  ! 146: NOP	nop
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 15)
	.word 0x01000000  ! 147: NOP	nop
	.word 0xbbe62000  ! 148: SAVE_I	save	%r24, 0x0001, %r29
	.word 0xb3504000  ! 149: RDPR_TNPC	<illegal instruction>
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 1c)
	.word 0x01000000  ! 150: NOP	nop
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 1)
	.word 0x01000000  ! 151: NOP	nop
	.word 0xaf484000  ! 152: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, e)
	.word 0x01000000  ! 153: NOP	nop
	.word 0xbfe56000  ! 154: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e5a000  ! 155: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xa9e4e000  ! 156: SAVE_I	save	%r19, 0x0001, %r20
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 32)
	.word 0x01000000  ! 157: NOP	nop
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 2f)
	.word 0x01000000  ! 158: NOP	nop
	.word 0xb350c000  ! 159: RDPR_TT	<illegal instruction>
	.word 0xb5e76000  ! 160: SAVE_I	save	%r29, 0x0001, %r26
	.word 0xa9484000  ! 161: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xb7e6e000  ! 162: SAVE_I	save	%r27, 0x0001, %r27
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 4)
	.word 0x01000000  ! 163: NOP	nop
	.word 0x839f2000  ! 164: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 12)
	.word 0x01000000  ! 165: NOP	nop
	.word 0xa5e7e000  ! 166: SAVE_I	save	%r31, 0x0001, %r18
	.word 0xbde76000  ! 167: SAVE_I	save	%r29, 0x0001, %r30
	.word 0xa9500000  ! 168: RDPR_TPC	<illegal instruction>
	.word 0x8794a000  ! 169: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x81956000  ! 170: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbd508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe66000  ! 172: SAVE_I	save	%r25, 0x0001, %r29
	.word 0x8195e000  ! 173: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xaf500000  ! 174: RDPR_TPC	<illegal instruction>
	.word 0x839de000  ! 175: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 23)
	.word 0x01000000  ! 176: NOP	nop
	.word 0xa1484000  ! 177: RDHPR_HTSTATE	rdhpr	%htstate, %r16
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 15)
	.word 0x01000000  ! 178: NOP	nop
	.word 0xa3508000  ! 179: RDPR_TSTATE	<illegal instruction>
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 39)
	.word 0x01000000  ! 180: NOP	nop
	.word 0x87956000  ! 181: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb1e4a000  ! 182: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 1a)
	.word 0x01000000  ! 183: NOP	nop
	.word 0xb9e52000  ! 184: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 8)
	.word 0x01000000  ! 185: NOP	nop
	.word 0xb1508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xbde52000  ! 187: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x87976000  ! 188: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x83976000  ! 189: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 20)
	.word 0x01000000  ! 190: NOP	nop
hwintr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_52), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 191: NOP	nop
	.word 0xb5e42000  ! 192: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_53), 16, 16)) -> intp(0, 0, 11)
	.word 0x01000000  ! 193: NOP	nop
hwintr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_54), 16, 16)) -> intp(0, 0, 0)
	.word 0x01000000  ! 194: NOP	nop
hwintr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_55), 16, 16)) -> intp(0, 0, 1a)
	.word 0x01000000  ! 195: NOP	nop
hwintr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_56), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 196: NOP	nop
hwintr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_57), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 197: NOP	nop
hwintr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_58), 16, 16)) -> intp(0, 0, 32)
	.word 0x01000000  ! 198: NOP	nop
hwintr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_59), 16, 16)) -> intp(0, 0, 2e)
	.word 0x01000000  ! 199: NOP	nop
	.word 0xb7e46000  ! 200: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_60), 16, 16)) -> intp(0, 0, 1e)
	.word 0x01000000  ! 201: NOP	nop
hwintr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_61), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 202: NOP	nop
hwintr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_62), 16, 16)) -> intp(0, 0, 13)
	.word 0x01000000  ! 203: NOP	nop
	.word 0xbf484000  ! 204: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xa9504000  ! 205: RDPR_TNPC	<illegal instruction>
	.word 0xb7500000  ! 206: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 207: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 208: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 210: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xaf484000  ! 211: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xb7e76000  ! 212: SAVE_I	save	%r29, 0x0001, %r27
hwintr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_63), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 213: NOP	nop
	.word 0xabe4a000  ! 214: SAVE_I	save	%r18, 0x0001, %r21
hwintr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_64), 16, 16)) -> intp(0, 0, 1e)
	.word 0x01000000  ! 215: NOP	nop
	.word 0x8797e000  ! 216: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x87972000  ! 217: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_65), 16, 16)) -> intp(0, 0, 34)
	.word 0x01000000  ! 218: NOP	nop
	.word 0xb5504000  ! 219: RDPR_TNPC	<illegal instruction>
hwintr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_66), 16, 16)) -> intp(0, 0, 15)
	.word 0x01000000  ! 220: NOP	nop
	.word 0xa350c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x87966000  ! 222: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb3e5a000  ! 223: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8395e000  ! 224: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb7e7e000  ! 225: SAVE_I	save	%r31, 0x0001, %r27
hwintr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_67), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 226: NOP	nop
	.word 0xa950c000  ! 227: RDPR_TT	<illegal instruction>
	.word 0xa9e6e000  ! 228: SAVE_I	save	%r27, 0x0001, %r20
	.word 0x87952000  ! 229: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbb484000  ! 230: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xbfe76000  ! 231: SAVE_I	save	%r29, 0x0001, %r31
	.word 0xbd484000  ! 232: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xa9508000  ! 233: RDPR_TSTATE	<illegal instruction>
hwintr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_68), 16, 16)) -> intp(0, 0, 27)
	.word 0x01000000  ! 234: NOP	nop
	.word 0xb3504000  ! 235: RDPR_TNPC	<illegal instruction>
	.word 0xbd484000  ! 236: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xb950c000  ! 237: RDPR_TT	<illegal instruction>
hwintr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_69), 16, 16)) -> intp(0, 0, 3e)
	.word 0x01000000  ! 238: NOP	nop
hwintr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_70), 16, 16)) -> intp(0, 0, 18)
	.word 0x01000000  ! 239: NOP	nop
	.word 0xbde6e000  ! 240: SAVE_I	save	%r27, 0x0001, %r30
	.word 0x87976000  ! 241: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xabe5e000  ! 242: SAVE_I	save	%r23, 0x0001, %r21
hwintr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_71), 16, 16)) -> intp(0, 0, 34)
	.word 0x01000000  ! 243: NOP	nop
	.word 0x839e6000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8597e000  ! 245: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb9e76000  ! 246: SAVE_I	save	%r29, 0x0001, %r28
	.word 0xbd500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 248: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8397e000  ! 249: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87962000  ! 250: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb9e62000  ! 251: SAVE_I	save	%r24, 0x0001, %r28
	.word 0xb7e42000  ! 252: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xa7e76000  ! 253: SAVE_I	save	%r29, 0x0001, %r19
hwintr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_72), 16, 16)) -> intp(0, 0, 2e)
	.word 0x01000000  ! 254: NOP	nop
hwintr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_73), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 255: NOP	nop
hwintr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_74), 16, 16)) -> intp(0, 0, 8)
	.word 0x01000000  ! 256: NOP	nop
	.word 0x83972000  ! 257: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb9508000  ! 258: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 259: RDPR_TSTATE	<illegal instruction>
	.word 0xbf484000  ! 260: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xa5508000  ! 261: RDPR_TSTATE	<illegal instruction>
	.word 0xa1e4a000  ! 262: SAVE_I	save	%r18, 0x0001, %r16
	.word 0x8596a000  ! 263: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x83962000  ! 264: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8397a000  ! 265: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x83956000  ! 266: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
hwintr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_75), 16, 16)) -> intp(0, 0, 27)
	.word 0x01000000  ! 267: NOP	nop
hwintr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_76), 16, 16)) -> intp(0, 0, 6)
	.word 0x01000000  ! 268: NOP	nop
	.word 0xade42000  ! 269: SAVE_I	save	%r16, 0x0001, %r22
hwintr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_77), 16, 16)) -> intp(0, 0, 28)
	.word 0x01000000  ! 270: NOP	nop
hwintr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_78), 16, 16)) -> intp(0, 0, 15)
	.word 0x01000000  ! 271: NOP	nop
	.word 0x85962000  ! 272: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa1484000  ! 273: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xade42000  ! 274: SAVE_I	save	%r16, 0x0001, %r22
hwintr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_79), 16, 16)) -> intp(0, 0, 37)
	.word 0x01000000  ! 275: NOP	nop
	.word 0x83952000  ! 276: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8597a000  ! 277: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb1e46000  ! 278: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf500000  ! 279: RDPR_TPC	<illegal instruction>
hwintr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_80), 16, 16)) -> intp(0, 0, 3d)
	.word 0x01000000  ! 280: NOP	nop
	.word 0x8396e000  ! 281: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xade46000  ! 282: SAVE_I	save	%r17, 0x0001, %r22
	.word 0x83952000  ! 283: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa7504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 285: RDPR_TSTATE	<illegal instruction>
	.word 0x83962000  ! 286: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xaf484000  ! 287: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_81), 16, 16)) -> intp(0, 0, 39)
	.word 0x01000000  ! 288: NOP	nop
	.word 0xbfe72000  ! 289: SAVE_I	save	%r28, 0x0001, %r31
	.word 0xb9e52000  ! 290: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_82), 16, 16)) -> intp(0, 0, 24)
	.word 0x01000000  ! 291: NOP	nop
hwintr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_83), 16, 16)) -> intp(0, 0, 1f)
	.word 0x01000000  ! 292: NOP	nop
hwintr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_84), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 293: NOP	nop
	.word 0xbb484000  ! 294: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xbbe4e000  ! 295: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_85), 16, 16)) -> intp(0, 0, 36)
	.word 0x01000000  ! 296: NOP	nop
	.word 0x839d2000  ! 297: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa5e5e000  ! 298: SAVE_I	save	%r23, 0x0001, %r18
hwintr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_86), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 299: NOP	nop
hwintr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_87), 16, 16)) -> intp(0, 0, 17)
	.word 0x01000000  ! 300: NOP	nop
hwintr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_88), 16, 16)) -> intp(0, 0, 2a)
	.word 0x01000000  ! 301: NOP	nop
	.word 0xafe72000  ! 302: SAVE_I	save	%r28, 0x0001, %r23
	.word 0xbde66000  ! 303: SAVE_I	save	%r25, 0x0001, %r30
hwintr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_89), 16, 16)) -> intp(0, 0, 34)
	.word 0x01000000  ! 304: NOP	nop
	.word 0xaf484000  ! 305: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_90), 16, 16)) -> intp(0, 0, 19)
	.word 0x01000000  ! 306: NOP	nop
	.word 0x839f6000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb9508000  ! 308: RDPR_TSTATE	<illegal instruction>
hwintr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_91), 16, 16)) -> intp(0, 0, 1e)
	.word 0x01000000  ! 309: NOP	nop
	.word 0xb3508000  ! 310: RDPR_TSTATE	<illegal instruction>
	.word 0x839d6000  ! 311: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa3504000  ! 312: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 313: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
hwintr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_92), 16, 16)) -> intp(0, 0, b)
	.word 0x01000000  ! 314: NOP	nop
hwintr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_93), 16, 16)) -> intp(0, 0, 3a)
	.word 0x01000000  ! 315: NOP	nop
hwintr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_94), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 316: NOP	nop
	.word 0xaf484000  ! 317: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa1e7a000  ! 318: SAVE_I	save	%r30, 0x0001, %r16
	.word 0xa3484000  ! 319: RDHPR_HTSTATE	rdhpr	%htstate, %r17
hwintr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_95), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 320: NOP	nop
	.word 0xaf504000  ! 321: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 322: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
hwintr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_96), 16, 16)) -> intp(0, 0, 8)
	.word 0x01000000  ! 323: NOP	nop
	.word 0xb9e72000  ! 324: SAVE_I	save	%r28, 0x0001, %r28
hwintr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_97), 16, 16)) -> intp(0, 0, 36)
	.word 0x01000000  ! 325: NOP	nop
hwintr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_98), 16, 16)) -> intp(0, 0, 9)
	.word 0x01000000  ! 326: NOP	nop
	.word 0xa5508000  ! 327: RDPR_TSTATE	<illegal instruction>
hwintr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_99), 16, 16)) -> intp(0, 0, f)
	.word 0x01000000  ! 328: NOP	nop
	.word 0xa3484000  ! 329: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa5e76000  ! 330: SAVE_I	save	%r29, 0x0001, %r18
	.word 0xa750c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xa1e72000  ! 332: SAVE_I	save	%r28, 0x0001, %r16
	.word 0xb7e7a000  ! 333: SAVE_I	save	%r30, 0x0001, %r27
	.word 0xb9484000  ! 334: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x8797e000  ! 335: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8794e000  ! 336: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
hwintr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_100), 16, 16)) -> intp(0, 0, 1b)
	.word 0x01000000  ! 337: NOP	nop
	.word 0x8796a000  ! 338: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8195e000  ! 339: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa5e46000  ! 340: SAVE_I	save	%r17, 0x0001, %r18
	.word 0x8794e000  ! 341: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
hwintr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_101), 16, 16)) -> intp(0, 0, b)
	.word 0x01000000  ! 342: NOP	nop
	.word 0xb5e56000  ! 343: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5504000  ! 344: RDPR_TNPC	<illegal instruction>
	.word 0x85946000  ! 345: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa9e72000  ! 346: SAVE_I	save	%r28, 0x0001, %r20
	.word 0xa9504000  ! 347: RDPR_TNPC	<illegal instruction>
hwintr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_102), 16, 16)) -> intp(0, 0, 10)
	.word 0x01000000  ! 348: NOP	nop
	.word 0x839c2000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb3484000  ! 350: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xbf504000  ! 351: RDPR_TNPC	<illegal instruction>
	.word 0xafe6a000  ! 352: SAVE_I	save	%r26, 0x0001, %r23
hwintr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_103), 16, 16)) -> intp(0, 0, 6)
	.word 0x01000000  ! 353: NOP	nop
hwintr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_104), 16, 16)) -> intp(0, 0, 3b)
	.word 0x01000000  ! 354: NOP	nop
hwintr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_105), 16, 16)) -> intp(0, 0, e)
	.word 0x01000000  ! 355: NOP	nop
	.word 0x83956000  ! 356: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839fe000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x83946000  ! 358: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbde42000  ! 359: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4e000  ! 360: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8794a000  ! 361: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa3504000  ! 362: RDPR_TNPC	<illegal instruction>
hwintr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_106), 16, 16)) -> intp(0, 0, 11)
	.word 0x01000000  ! 363: NOP	nop
	.word 0xb7e66000  ! 364: SAVE_I	save	%r25, 0x0001, %r27
hwintr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_107), 16, 16)) -> intp(0, 0, 1c)
	.word 0x01000000  ! 365: NOP	nop
	.word 0xbd484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xb7e56000  ! 367: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf500000  ! 368: RDPR_TPC	<illegal instruction>
	.word 0xa7e6a000  ! 369: SAVE_I	save	%r26, 0x0001, %r19
	.word 0xbfe72000  ! 370: SAVE_I	save	%r28, 0x0001, %r31
hwintr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_108), 16, 16)) -> intp(0, 0, 21)
	.word 0x01000000  ! 371: NOP	nop
	.word 0xbf484000  ! 372: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xafe7e000  ! 373: SAVE_I	save	%r31, 0x0001, %r23
	.word 0xa3e42000  ! 374: SAVE_I	save	%r16, 0x0001, %r17
	.word 0x8794a000  ! 375: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8394a000  ! 376: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xafe76000  ! 377: SAVE_I	save	%r29, 0x0001, %r23
	.word 0xa9e4a000  ! 378: SAVE_I	save	%r18, 0x0001, %r20
	.word 0x85962000  ! 379: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8795e000  ! 380: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xade7a000  ! 381: SAVE_I	save	%r30, 0x0001, %r22
	.word 0xbb504000  ! 382: RDPR_TNPC	<illegal instruction>
	.word 0xa7e72000  ! 383: SAVE_I	save	%r28, 0x0001, %r19
	.word 0xb9508000  ! 384: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 385: RDPR_TT	<illegal instruction>
	.word 0xb9e42000  ! 386: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_109), 16, 16)) -> intp(0, 0, 1a)
	.word 0x01000000  ! 387: NOP	nop
	.word 0xb9500000  ! 388: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 389: RDPR_TNPC	<illegal instruction>
	.word 0xbbe7e000  ! 390: SAVE_I	save	%r31, 0x0001, %r29
	.word 0xb9484000  ! 391: RDHPR_HTSTATE	rdhpr	%htstate, %r28
hwintr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_110), 16, 16)) -> intp(0, 0, 9)
	.word 0x01000000  ! 392: NOP	nop
	.word 0xb1500000  ! 393: RDPR_TPC	<illegal instruction>
hwintr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_111), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 394: NOP	nop
	.word 0x87966000  ! 395: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x839da000  ! 396: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xaf50c000  ! 397: RDPR_TT	<illegal instruction>
	.word 0xb1484000  ! 398: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xbde52000  ! 399: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xa7484000  ! 400: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_112), 16, 16)) -> intp(0, 0, 3c)
	.word 0x01000000  ! 401: NOP	nop
hwintr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_113), 16, 16)) -> intp(0, 0, 27)
	.word 0x01000000  ! 402: NOP	nop
	.word 0xabe4e000  ! 403: SAVE_I	save	%r19, 0x0001, %r21
hwintr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_114), 16, 16)) -> intp(0, 0, 31)
	.word 0x01000000  ! 404: NOP	nop
	.word 0xbd500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0xbbe5e000  ! 406: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_115), 16, 16)) -> intp(0, 0, 2e)
	.word 0x01000000  ! 407: NOP	nop
	.word 0xbf50c000  ! 408: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 409: RDPR_TSTATE	<illegal instruction>
	.word 0xafe52000  ! 410: SAVE_I	save	%r20, 0x0001, %r23
	.word 0xa9e6e000  ! 411: SAVE_I	save	%r27, 0x0001, %r20
	.word 0xabe52000  ! 412: SAVE_I	save	%r20, 0x0001, %r21
	.word 0xb3504000  ! 413: RDPR_TNPC	<illegal instruction>
hwintr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_116), 16, 16)) -> intp(0, 0, 26)
	.word 0x01000000  ! 414: NOP	nop
	.word 0x8397e000  ! 415: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb7e66000  ! 416: SAVE_I	save	%r25, 0x0001, %r27
	.word 0xbb484000  ! 417: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0x81946000  ! 418: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
hwintr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_117), 16, 16)) -> intp(0, 0, 25)
	.word 0x01000000  ! 419: NOP	nop
hwintr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_118), 16, 16)) -> intp(0, 0, 13)
	.word 0x01000000  ! 420: NOP	nop
	.word 0x8194a000  ! 421: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8197a000  ! 422: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x87976000  ! 423: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_119), 16, 16)) -> intp(0, 0, 13)
	.word 0x01000000  ! 424: NOP	nop
	.word 0x87962000  ! 425: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8197e000  ! 426: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
hwintr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_120), 16, 16)) -> intp(0, 0, 23)
	.word 0x01000000  ! 427: NOP	nop
	.word 0x85976000  ! 428: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xade4a000  ! 429: SAVE_I	save	%r18, 0x0001, %r22
	.word 0x8397a000  ! 430: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb9500000  ! 431: RDPR_TPC	<illegal instruction>
	.word 0xa5504000  ! 432: RDPR_TNPC	<illegal instruction>
	.word 0xbbe4a000  ! 433: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x87956000  ! 434: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
hwintr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_121), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 435: NOP	nop
hwintr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_122), 16, 16)) -> intp(0, 0, e)
	.word 0x01000000  ! 436: NOP	nop
	.word 0x87942000  ! 437: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x87976000  ! 438: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_123), 16, 16)) -> intp(0, 0, 1f)
	.word 0x01000000  ! 439: NOP	nop
	.word 0x87962000  ! 440: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x81956000  ! 441: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb1500000  ! 442: RDPR_TPC	<illegal instruction>
	.word 0x839d2000  ! 443: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
hwintr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_124), 16, 16)) -> intp(0, 0, 9)
	.word 0x01000000  ! 444: NOP	nop
	.word 0xabe42000  ! 445: SAVE_I	save	%r16, 0x0001, %r21
	.word 0xa3e6e000  ! 446: SAVE_I	save	%r27, 0x0001, %r17
	.word 0xbfe5a000  ! 447: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x839c2000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x81976000  ! 449: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb3500000  ! 450: RDPR_TPC	<illegal instruction>
hwintr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_125), 16, 16)) -> intp(0, 0, 13)
	.word 0x01000000  ! 451: NOP	nop
	.word 0xa7e76000  ! 452: SAVE_I	save	%r29, 0x0001, %r19
	.word 0xa350c000  ! 453: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0x8794a000  ! 455: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb1508000  ! 456: RDPR_TSTATE	<illegal instruction>
	.word 0x81956000  ! 457: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa7484000  ! 458: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_126), 16, 16)) -> intp(0, 0, 0)
	.word 0x01000000  ! 459: NOP	nop
	.word 0x81952000  ! 460: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa9484000  ! 461: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x87952000  ! 462: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
hwintr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_127), 16, 16)) -> intp(0, 0, 19)
	.word 0x01000000  ! 463: NOP	nop
	.word 0x839ce000  ! 464: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8197a000  ! 465: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x87966000  ! 466: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
hwintr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_128), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 467: NOP	nop
	.word 0xa3484000  ! 468: RDHPR_HTSTATE	rdhpr	%htstate, %r17
hwintr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_129), 16, 16)) -> intp(0, 0, f)
	.word 0x01000000  ! 469: NOP	nop
hwintr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_130), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 470: NOP	nop
hwintr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_131), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 471: NOP	nop
	.word 0xbbe7e000  ! 472: SAVE_I	save	%r31, 0x0001, %r29
	.word 0xab500000  ! 473: RDPR_TPC	<illegal instruction>
	.word 0x8795a000  ! 474: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
hwintr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_132), 16, 16)) -> intp(0, 0, 1d)
	.word 0x01000000  ! 475: NOP	nop
	.word 0x839de000  ! 476: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xad50c000  ! 477: RDPR_TT	<illegal instruction>
	.word 0x8194a000  ! 478: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa950c000  ! 479: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 480: RDPR_TPC	<illegal instruction>
	.word 0xa9e52000  ! 481: SAVE_I	save	%r20, 0x0001, %r20
	.word 0xabe46000  ! 482: SAVE_I	save	%r17, 0x0001, %r21
	.word 0x839ee000  ! 483: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb9484000  ! 484: RDHPR_HTSTATE	rdhpr	%htstate, %r28
hwintr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_133), 16, 16)) -> intp(0, 0, 6)
	.word 0x01000000  ! 485: NOP	nop
	.word 0xbd504000  ! 486: RDPR_TNPC	<illegal instruction>
	.word 0x8396a000  ! 487: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xabe56000  ! 488: SAVE_I	save	%r21, 0x0001, %r21
	.word 0xa350c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xb1e62000  ! 490: SAVE_I	save	%r24, 0x0001, %r24
	.word 0x8796e000  ! 491: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa3508000  ! 492: RDPR_TSTATE	<illegal instruction>
hwintr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_134), 16, 16)) -> intp(0, 0, 1a)
	.word 0x01000000  ! 493: NOP	nop
	.word 0xb7500000  ! 494: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 495: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x83972000  ! 496: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb7e66000  ! 497: SAVE_I	save	%r25, 0x0001, %r27
	.word 0xb5e66000  ! 498: SAVE_I	save	%r25, 0x0001, %r26
	.word 0xab484000  ! 499: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x8196e000  ! 500: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa7e42000  ! 501: SAVE_I	save	%r16, 0x0001, %r19
	.word 0xbde6a000  ! 502: SAVE_I	save	%r26, 0x0001, %r30
	.word 0xa750c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 504: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 505: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 506: RDPR_TNPC	<illegal instruction>
hwintr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_135), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 507: NOP	nop
	.word 0x8396a000  ! 508: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839f6000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbfe5e000  ! 510: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xa750c000  ! 511: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 512: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 513: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xafe52000  ! 514: SAVE_I	save	%r20, 0x0001, %r23
	.word 0xbb508000  ! 515: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 516: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb5e52000  ! 517: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xa3e52000  ! 518: SAVE_I	save	%r20, 0x0001, %r17
	.word 0xad500000  ! 519: RDPR_TPC	<illegal instruction>
hwintr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_136), 16, 16)) -> intp(0, 0, 24)
	.word 0x01000000  ! 520: NOP	nop
hwintr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_137), 16, 16)) -> intp(0, 0, 1f)
	.word 0x01000000  ! 521: NOP	nop
	.word 0x8595a000  ! 522: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8395e000  ! 523: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
hwintr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_138), 16, 16)) -> intp(0, 0, 10)
	.word 0x01000000  ! 524: NOP	nop
	.word 0xbd500000  ! 525: RDPR_TPC	<illegal instruction>
hwintr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_139), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 526: NOP	nop
	.word 0x8397e000  ! 527: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8395a000  ! 528: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
hwintr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_140), 16, 16)) -> intp(0, 0, 11)
	.word 0x01000000  ! 529: NOP	nop
	.word 0x839fe000  ! 530: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa1504000  ! 531: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 532: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbfe4a000  ! 533: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3484000  ! 534: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xb1e6a000  ! 535: SAVE_I	save	%r26, 0x0001, %r24
	.word 0xb7e56000  ! 536: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xa9484000  ! 537: RDHPR_HTSTATE	rdhpr	%htstate, %r20
hwintr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_141), 16, 16)) -> intp(0, 0, 19)
	.word 0x01000000  ! 538: NOP	nop
	.word 0x8396e000  ! 539: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa5e5a000  ! 540: SAVE_I	save	%r22, 0x0001, %r18
	.word 0x839ce000  ! 541: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa9504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0x839d2000  ! 543: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa5e5e000  ! 544: SAVE_I	save	%r23, 0x0001, %r18
hwintr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_142), 16, 16)) -> intp(0, 0, 36)
	.word 0x01000000  ! 545: NOP	nop
	.word 0xbfe4a000  ! 546: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_143), 16, 16)) -> intp(0, 0, 13)
	.word 0x01000000  ! 547: NOP	nop
	.word 0xb3508000  ! 548: RDPR_TSTATE	<illegal instruction>
	.word 0x839f2000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb1500000  ! 550: RDPR_TPC	<illegal instruction>
hwintr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_144), 16, 16)) -> intp(0, 0, 36)
	.word 0x01000000  ! 551: NOP	nop
hwintr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_145), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 552: NOP	nop
	.word 0x83942000  ! 553: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
hwintr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_146), 16, 16)) -> intp(0, 0, 1e)
	.word 0x01000000  ! 554: NOP	nop
hwintr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_147), 16, 16)) -> intp(0, 0, 4)
	.word 0x01000000  ! 555: NOP	nop
	.word 0xa550c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 557: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 558: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
hwintr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_148), 16, 16)) -> intp(0, 0, 1d)
	.word 0x01000000  ! 559: NOP	nop
hwintr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_149), 16, 16)) -> intp(0, 0, 18)
	.word 0x01000000  ! 560: NOP	nop
	.word 0xbbe56000  ! 561: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde7e000  ! 562: SAVE_I	save	%r31, 0x0001, %r30
	.word 0xa3500000  ! 563: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 564: RDPR_TPC	<illegal instruction>
	.word 0xb1e7a000  ! 565: SAVE_I	save	%r30, 0x0001, %r24
	.word 0xa7484000  ! 566: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa9508000  ! 567: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 568: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xafe66000  ! 569: SAVE_I	save	%r25, 0x0001, %r23
	.word 0xb7504000  ! 570: RDPR_TNPC	<illegal instruction>
	.word 0x839da000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa9508000  ! 572: RDPR_TSTATE	<illegal instruction>
hwintr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_150), 16, 16)) -> intp(0, 0, c)
	.word 0x01000000  ! 573: NOP	nop
	.word 0xb5504000  ! 574: RDPR_TNPC	<illegal instruction>
	.word 0xade4e000  ! 575: SAVE_I	save	%r19, 0x0001, %r22
	.word 0xb1484000  ! 576: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xab484000  ! 577: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xbb50c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xb7e7e000  ! 580: SAVE_I	save	%r31, 0x0001, %r27
	.word 0xb9508000  ! 581: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 582: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa5e6e000  ! 583: SAVE_I	save	%r27, 0x0001, %r18
	.word 0xbf504000  ! 584: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 585: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8595a000  ! 586: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839d2000  ! 587: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x81966000  ! 588: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
hwintr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_151), 16, 16)) -> intp(0, 0, 1b)
	.word 0x01000000  ! 589: NOP	nop
	.word 0xa5500000  ! 590: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 591: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x81976000  ! 592: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb7e5a000  ! 593: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xa7e4e000  ! 594: SAVE_I	save	%r19, 0x0001, %r19
	.word 0x81956000  ! 595: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
hwintr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_152), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 596: NOP	nop
	.word 0xaf508000  ! 597: RDPR_TSTATE	<illegal instruction>
	.word 0xabe62000  ! 598: SAVE_I	save	%r24, 0x0001, %r21
	.word 0xb7500000  ! 599: RDPR_TPC	<illegal instruction>
hwintr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_153), 16, 16)) -> intp(0, 0, 1d)
	.word 0x01000000  ! 600: NOP	nop
	.word 0xa9e46000  ! 601: SAVE_I	save	%r17, 0x0001, %r20
	.word 0xb9484000  ! 602: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x8396a000  ! 603: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8394a000  ! 604: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x83972000  ! 605: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8794a000  ! 606: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa1e6a000  ! 607: SAVE_I	save	%r26, 0x0001, %r16
	.word 0xa5e46000  ! 608: SAVE_I	save	%r17, 0x0001, %r18
	.word 0xb7e76000  ! 609: SAVE_I	save	%r29, 0x0001, %r27
	.word 0x8196a000  ! 610: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_154), 16, 16)) -> intp(0, 0, 2d)
	.word 0x01000000  ! 611: NOP	nop
	.word 0x83972000  ! 612: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xab504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 614: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839ce000  ! 615: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
hwintr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_155), 16, 16)) -> intp(0, 0, 3a)
	.word 0x01000000  ! 616: NOP	nop
	.word 0x8595e000  ! 617: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x87942000  ! 618: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
hwintr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_156), 16, 16)) -> intp(0, 0, 0)
	.word 0x01000000  ! 619: NOP	nop
hwintr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_157), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 620: NOP	nop
	.word 0xb7e5a000  ! 621: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_158), 16, 16)) -> intp(0, 0, 3b)
	.word 0x01000000  ! 622: NOP	nop
	.word 0x81966000  ! 623: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7508000  ! 624: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 625: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x81946000  ! 626: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbb504000  ! 627: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 628: RDPR_TT	<illegal instruction>
	.word 0x8195e000  ! 629: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb7e72000  ! 630: SAVE_I	save	%r28, 0x0001, %r27
	.word 0xb1504000  ! 631: RDPR_TNPC	<illegal instruction>
	.word 0xa5e7e000  ! 632: SAVE_I	save	%r31, 0x0001, %r18
	.word 0xad504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 634: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb3508000  ! 635: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 636: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xade42000  ! 637: SAVE_I	save	%r16, 0x0001, %r22
hwintr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_159), 16, 16)) -> intp(0, 0, 28)
	.word 0x01000000  ! 638: NOP	nop
	.word 0x8795a000  ! 639: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
hwintr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_160), 16, 16)) -> intp(0, 0, 2e)
	.word 0x01000000  ! 640: NOP	nop
	.word 0xb1500000  ! 641: RDPR_TPC	<illegal instruction>
	.word 0xb5e46000  ! 642: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbb504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 644: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa9e72000  ! 645: SAVE_I	save	%r28, 0x0001, %r20
	.word 0xaf484000  ! 646: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xab484000  ! 647: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xb3508000  ! 648: RDPR_TSTATE	<illegal instruction>
	.word 0x87952000  ! 649: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa9e6a000  ! 650: SAVE_I	save	%r26, 0x0001, %r20
hwintr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_161), 16, 16)) -> intp(0, 0, 23)
	.word 0x01000000  ! 651: NOP	nop
	.word 0xb5e4e000  ! 652: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5a000  ! 653: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x839ea000  ! 654: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa1e72000  ! 655: SAVE_I	save	%r28, 0x0001, %r16
	.word 0xbfe56000  ! 656: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xa9504000  ! 657: RDPR_TNPC	<illegal instruction>
	.word 0xb3484000  ! 658: RDHPR_HTSTATE	rdhpr	%htstate, %r25
hwintr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_162), 16, 16)) -> intp(0, 0, 1a)
	.word 0x01000000  ! 659: NOP	nop
hwintr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_163), 16, 16)) -> intp(0, 0, 3e)
	.word 0x01000000  ! 660: NOP	nop
	.word 0xa9e46000  ! 661: SAVE_I	save	%r17, 0x0001, %r20
	.word 0x87942000  ! 662: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xab504000  ! 663: RDPR_TNPC	<illegal instruction>
hwintr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_164), 16, 16)) -> intp(0, 0, 36)
	.word 0x01000000  ! 664: NOP	nop
hwintr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_165), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 665: NOP	nop
	.word 0xa5508000  ! 666: RDPR_TSTATE	<illegal instruction>
	.word 0xb1504000  ! 667: RDPR_TNPC	<illegal instruction>
hwintr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_166), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 668: NOP	nop
	.word 0x8394a000  ! 669: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
hwintr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_167), 16, 16)) -> intp(0, 0, 18)
	.word 0x01000000  ! 670: NOP	nop
	.word 0xb7508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 672: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbfe56000  ! 673: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x87962000  ! 674: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa9e7e000  ! 675: SAVE_I	save	%r31, 0x0001, %r20
	.word 0xad484000  ! 676: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xb9e46000  ! 677: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xafe46000  ! 678: SAVE_I	save	%r17, 0x0001, %r23
hwintr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_168), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 679: NOP	nop
	.word 0xad500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xa5e42000  ! 681: SAVE_I	save	%r16, 0x0001, %r18
	.word 0x839da000  ! 682: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x85946000  ! 683: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa7504000  ! 684: RDPR_TNPC	<illegal instruction>
	.word 0xbbe76000  ! 685: SAVE_I	save	%r29, 0x0001, %r29
hwintr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_169), 16, 16)) -> intp(0, 0, c)
	.word 0x01000000  ! 686: NOP	nop
	.word 0xb5e52000  ! 687: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x839c6000  ! 688: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa550c000  ! 689: RDPR_TT	<illegal instruction>
	.word 0xb3484000  ! 690: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0x8394e000  ! 691: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839fe000  ! 692: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbfe7a000  ! 693: SAVE_I	save	%r30, 0x0001, %r31
	.word 0xafe72000  ! 694: SAVE_I	save	%r28, 0x0001, %r23
	.word 0xbbe5e000  ! 695: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_170), 16, 16)) -> intp(0, 0, 1e)
	.word 0x01000000  ! 696: NOP	nop
	.word 0xade4a000  ! 697: SAVE_I	save	%r18, 0x0001, %r22
hwintr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_171), 16, 16)) -> intp(0, 0, 3b)
	.word 0x01000000  ! 698: NOP	nop
	.word 0xafe6e000  ! 699: SAVE_I	save	%r27, 0x0001, %r23
	.word 0xbb50c000  ! 700: RDPR_TT	<illegal instruction>
	.word 0x839e6000  ! 701: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa1e4e000  ! 702: SAVE_I	save	%r19, 0x0001, %r16
	.word 0xad500000  ! 703: RDPR_TPC	<illegal instruction>
hwintr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_172), 16, 16)) -> intp(0, 0, 39)
	.word 0x01000000  ! 704: NOP	nop
	.word 0xa1500000  ! 705: RDPR_TPC	<illegal instruction>
hwintr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_173), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 706: NOP	nop
	.word 0xb7e72000  ! 707: SAVE_I	save	%r28, 0x0001, %r27
	.word 0x87972000  ! 708: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xaf50c000  ! 709: RDPR_TT	<illegal instruction>
	.word 0xb9e7e000  ! 710: SAVE_I	save	%r31, 0x0001, %r28
hwintr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_174), 16, 16)) -> intp(0, 0, 22)
	.word 0x01000000  ! 711: NOP	nop
	.word 0x83952000  ! 712: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
hwintr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_175), 16, 16)) -> intp(0, 0, 1)
	.word 0x01000000  ! 713: NOP	nop
	.word 0xb7e72000  ! 714: SAVE_I	save	%r28, 0x0001, %r27
hwintr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_176), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 715: NOP	nop
	.word 0x8795e000  ! 716: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
hwintr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_177), 16, 16)) -> intp(0, 0, a)
	.word 0x01000000  ! 717: NOP	nop
	.word 0x8794a000  ! 718: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x839e2000  ! 719: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xafe42000  ! 720: SAVE_I	save	%r16, 0x0001, %r23
	.word 0xb3504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xb1e72000  ! 722: SAVE_I	save	%r28, 0x0001, %r24
	.word 0xbf500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xa7484000  ! 724: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_178), 16, 16)) -> intp(0, 0, 30)
	.word 0x01000000  ! 725: NOP	nop
hwintr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_179), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 726: NOP	nop
	.word 0xad504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 728: RDPR_TT	<illegal instruction>
	.word 0x85946000  ! 729: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x81952000  ! 730: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x85966000  ! 731: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xabe72000  ! 732: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xbde72000  ! 733: SAVE_I	save	%r28, 0x0001, %r30
	.word 0x8196a000  ! 734: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x83962000  ! 735: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8396a000  ! 736: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
hwintr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_180), 16, 16)) -> intp(0, 0, 11)
	.word 0x01000000  ! 737: NOP	nop
	.word 0xb9e72000  ! 738: SAVE_I	save	%r28, 0x0001, %r28
hwintr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_181), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 739: NOP	nop
hwintr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_182), 16, 16)) -> intp(0, 0, 26)
	.word 0x01000000  ! 740: NOP	nop
	.word 0x81976000  ! 741: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839d2000  ! 742: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x87956000  ! 743: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
hwintr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_183), 16, 16)) -> intp(0, 0, 3c)
	.word 0x01000000  ! 744: NOP	nop
	.word 0xa3500000  ! 745: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 746: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8394a000  ! 747: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x83946000  ! 748: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa350c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x839d2000  ! 750: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb1e5a000  ! 751: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xa9e5e000  ! 752: SAVE_I	save	%r23, 0x0001, %r20
	.word 0x85972000  ! 753: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb9500000  ! 754: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 755: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
hwintr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_184), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 756: NOP	nop
	.word 0xbf508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e000  ! 758: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
hwintr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_185), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 759: NOP	nop
	.word 0x8597e000  ! 760: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb5e4e000  ! 761: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x83972000  ! 762: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa7e6a000  ! 763: SAVE_I	save	%r26, 0x0001, %r19
	.word 0xbfe52000  ! 764: SAVE_I	save	%r20, 0x0001, %r31
hwintr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_186), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 765: NOP	nop
hwintr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_187), 16, 16)) -> intp(0, 0, 37)
	.word 0x01000000  ! 766: NOP	nop
	.word 0xbbe6a000  ! 767: SAVE_I	save	%r26, 0x0001, %r29
	.word 0xade4a000  ! 768: SAVE_I	save	%r18, 0x0001, %r22
	.word 0xbf508000  ! 769: RDPR_TSTATE	<illegal instruction>
	.word 0xafe46000  ! 770: SAVE_I	save	%r17, 0x0001, %r23
hwintr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_188), 16, 16)) -> intp(0, 0, 25)
	.word 0x01000000  ! 771: NOP	nop
	.word 0x8794e000  ! 772: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa750c000  ! 773: RDPR_TT	<illegal instruction>
hwintr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_189), 16, 16)) -> intp(0, 0, 2f)
	.word 0x01000000  ! 774: NOP	nop
	.word 0xa1e7a000  ! 775: SAVE_I	save	%r30, 0x0001, %r16
	.word 0xa9e4a000  ! 776: SAVE_I	save	%r18, 0x0001, %r20
	.word 0xb7e52000  ! 777: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xa1e66000  ! 778: SAVE_I	save	%r25, 0x0001, %r16
	.word 0x85976000  ! 779: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x81952000  ! 780: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
hwintr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_190), 16, 16)) -> intp(0, 0, 0)
	.word 0x01000000  ! 781: NOP	nop
	.word 0x839fe000  ! 782: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xafe56000  ! 783: SAVE_I	save	%r21, 0x0001, %r23
hwintr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_191), 16, 16)) -> intp(0, 0, 1e)
	.word 0x01000000  ! 784: NOP	nop
	.word 0x839d6000  ! 785: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb1e62000  ! 786: SAVE_I	save	%r24, 0x0001, %r24
hwintr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_192), 16, 16)) -> intp(0, 0, 23)
	.word 0x01000000  ! 787: NOP	nop
	.word 0xa550c000  ! 788: RDPR_TT	<illegal instruction>
	.word 0xbd484000  ! 789: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xb150c000  ! 790: RDPR_TT	<illegal instruction>
	.word 0xb5e66000  ! 791: SAVE_I	save	%r25, 0x0001, %r26
	.word 0xb3e6a000  ! 792: SAVE_I	save	%r26, 0x0001, %r25
	.word 0x83946000  ! 793: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbd508000  ! 794: RDPR_TSTATE	<illegal instruction>
hwintr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_193), 16, 16)) -> intp(0, 0, 9)
	.word 0x01000000  ! 795: NOP	nop
	.word 0xa9500000  ! 796: RDPR_TPC	<illegal instruction>
hwintr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_194), 16, 16)) -> intp(0, 0, f)
	.word 0x01000000  ! 797: NOP	nop
	.word 0x83952000  ! 798: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3e62000  ! 799: SAVE_I	save	%r24, 0x0001, %r17
	.word 0xa5504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0xa1e5a000  ! 802: SAVE_I	save	%r22, 0x0001, %r16
hwintr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_195), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 803: NOP	nop
	.word 0x839ea000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
hwintr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_196), 16, 16)) -> intp(0, 0, 23)
	.word 0x01000000  ! 805: NOP	nop
	.word 0xa5e5a000  ! 806: SAVE_I	save	%r22, 0x0001, %r18
	.word 0xade7a000  ! 807: SAVE_I	save	%r30, 0x0001, %r22
hwintr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_197), 16, 16)) -> intp(0, 0, 3c)
	.word 0x01000000  ! 808: NOP	nop
hwintr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_198), 16, 16)) -> intp(0, 0, 24)
	.word 0x01000000  ! 809: NOP	nop
	.word 0xa1e4e000  ! 810: SAVE_I	save	%r19, 0x0001, %r16
hwintr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_199), 16, 16)) -> intp(0, 0, 3)
	.word 0x01000000  ! 811: NOP	nop
	.word 0xb9e76000  ! 812: SAVE_I	save	%r29, 0x0001, %r28
hwintr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_200), 16, 16)) -> intp(0, 0, 1c)
	.word 0x01000000  ! 813: NOP	nop
hwintr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_201), 16, 16)) -> intp(0, 0, c)
	.word 0x01000000  ! 814: NOP	nop
	.word 0xbfe46000  ! 815: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3500000  ! 816: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 817: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa5e5e000  ! 818: SAVE_I	save	%r23, 0x0001, %r18
	.word 0xaf500000  ! 819: RDPR_TPC	<illegal instruction>
	.word 0xa1e62000  ! 820: SAVE_I	save	%r24, 0x0001, %r16
	.word 0xa1e46000  ! 821: SAVE_I	save	%r17, 0x0001, %r16
	.word 0xade42000  ! 822: SAVE_I	save	%r16, 0x0001, %r22
	.word 0x87942000  ! 823: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
hwintr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_202), 16, 16)) -> intp(0, 0, 36)
	.word 0x01000000  ! 824: NOP	nop
	.word 0x8595e000  ! 825: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb3e4a000  ! 826: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_203), 16, 16)) -> intp(0, 0, 11)
	.word 0x01000000  ! 827: NOP	nop
	.word 0x8197a000  ! 828: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839de000  ! 829: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x83956000  ! 830: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xab50c000  ! 831: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbbe56000  ! 833: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_204), 16, 16)) -> intp(0, 0, 35)
	.word 0x01000000  ! 834: NOP	nop
	.word 0xafe62000  ! 835: SAVE_I	save	%r24, 0x0001, %r23
	.word 0xa550c000  ! 836: RDPR_TT	<illegal instruction>
	.word 0x839fe000  ! 837: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
hwintr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_205), 16, 16)) -> intp(0, 0, 1b)
	.word 0x01000000  ! 838: NOP	nop
	.word 0xbfe4a000  ! 839: SAVE_I	save	%r18, 0x0001, %r31
hwintr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_206), 16, 16)) -> intp(0, 0, 34)
	.word 0x01000000  ! 840: NOP	nop
	.word 0xa7508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xa3e52000  ! 843: SAVE_I	save	%r20, 0x0001, %r17
	.word 0xb7500000  ! 844: RDPR_TPC	<illegal instruction>
hwintr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_207), 16, 16)) -> intp(0, 0, 16)
	.word 0x01000000  ! 845: NOP	nop
	.word 0xb9e6a000  ! 846: SAVE_I	save	%r26, 0x0001, %r28
	.word 0xbd504000  ! 847: RDPR_TNPC	<illegal instruction>
	.word 0xa1508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x81946000  ! 849: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
hwintr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_208), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 850: NOP	nop
	.word 0xaf50c000  ! 851: RDPR_TT	<illegal instruction>
	.word 0xbd504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xade6a000  ! 853: SAVE_I	save	%r26, 0x0001, %r22
	.word 0xbf50c000  ! 854: RDPR_TT	<illegal instruction>
	.word 0x8597e000  ! 855: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839e6000  ! 856: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa5e5a000  ! 857: SAVE_I	save	%r22, 0x0001, %r18
	.word 0x81962000  ! 858: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xaf500000  ! 859: RDPR_TPC	<illegal instruction>
hwintr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_209), 16, 16)) -> intp(0, 0, 1)
	.word 0x01000000  ! 860: NOP	nop
	.word 0xb7e4a000  ! 861: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8396a000  ! 862: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
hwintr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_210), 16, 16)) -> intp(0, 0, 18)
	.word 0x01000000  ! 863: NOP	nop
hwintr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_211), 16, 16)) -> intp(0, 0, 6)
	.word 0x01000000  ! 864: NOP	nop
	.word 0xab504000  ! 865: RDPR_TNPC	<illegal instruction>
	.word 0xa1e6a000  ! 866: SAVE_I	save	%r26, 0x0001, %r16
	.word 0x839f6000  ! 867: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb5e7a000  ! 868: SAVE_I	save	%r30, 0x0001, %r26
	.word 0x839ca000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
hwintr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_212), 16, 16)) -> intp(0, 0, 39)
	.word 0x01000000  ! 870: NOP	nop
	.word 0xafe56000  ! 871: SAVE_I	save	%r21, 0x0001, %r23
	.word 0xb7508000  ! 872: RDPR_TSTATE	<illegal instruction>
hwintr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_213), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 873: NOP	nop
	.word 0xbb504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 875: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 876: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb508000  ! 877: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 878: RDPR_TNPC	<illegal instruction>
hwintr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_214), 16, 16)) -> intp(0, 0, 3e)
	.word 0x01000000  ! 879: NOP	nop
	.word 0xa7508000  ! 880: RDPR_TSTATE	<illegal instruction>
hwintr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_215), 16, 16)) -> intp(0, 0, 11)
	.word 0x01000000  ! 881: NOP	nop
hwintr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_216), 16, 16)) -> intp(0, 0, 5)
	.word 0x01000000  ! 882: NOP	nop
	.word 0xb3e7e000  ! 883: SAVE_I	save	%r31, 0x0001, %r25
	.word 0xb5500000  ! 884: RDPR_TPC	<illegal instruction>
	.word 0xbb484000  ! 885: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0x81972000  ! 886: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb7e62000  ! 887: SAVE_I	save	%r24, 0x0001, %r27
hwintr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_217), 16, 16)) -> intp(0, 0, 8)
	.word 0x01000000  ! 888: NOP	nop
	.word 0xbd500000  ! 889: RDPR_TPC	<illegal instruction>
	.word 0xabe72000  ! 890: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xb7e7a000  ! 891: SAVE_I	save	%r30, 0x0001, %r27
	.word 0xaf508000  ! 892: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe66000  ! 893: SAVE_I	save	%r25, 0x0001, %r31
hwintr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_218), 16, 16)) -> intp(0, 0, 22)
	.word 0x01000000  ! 894: NOP	nop
	.word 0xa9e5e000  ! 895: SAVE_I	save	%r23, 0x0001, %r20
	.word 0x81962000  ! 896: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa5500000  ! 897: RDPR_TPC	<illegal instruction>
	.word 0xa3e4e000  ! 898: SAVE_I	save	%r19, 0x0001, %r17
	.word 0xad484000  ! 899: RDHPR_HTSTATE	rdhpr	%htstate, %r22
hwintr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_219), 16, 16)) -> intp(0, 0, 2e)
	.word 0x01000000  ! 900: NOP	nop
	.word 0xaf484000  ! 901: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_220), 16, 16)) -> intp(0, 0, 34)
	.word 0x01000000  ! 902: NOP	nop
	.word 0xa5e4e000  ! 903: SAVE_I	save	%r19, 0x0001, %r18
hwintr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_221), 16, 16)) -> intp(0, 0, d)
	.word 0x01000000  ! 904: NOP	nop
	.word 0x83956000  ! 905: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8394a000  ! 906: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x87972000  ! 907: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_222), 16, 16)) -> intp(0, 0, f)
	.word 0x01000000  ! 908: NOP	nop
	.word 0xa7e62000  ! 909: SAVE_I	save	%r24, 0x0001, %r19
	.word 0x87956000  ! 910: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x839d2000  ! 911: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x839da000  ! 912: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa5508000  ! 913: RDPR_TSTATE	<illegal instruction>
	.word 0x87946000  ! 914: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa550c000  ! 915: RDPR_TT	<illegal instruction>
	.word 0xb1e42000  ! 916: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xaf500000  ! 917: RDPR_TPC	<illegal instruction>
hwintr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_223), 16, 16)) -> intp(0, 0, 1)
	.word 0x01000000  ! 918: NOP	nop
	.word 0xabe52000  ! 919: SAVE_I	save	%r20, 0x0001, %r21
	.word 0xad504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 921: RDPR_TPC	<illegal instruction>
hwintr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_224), 16, 16)) -> intp(0, 0, 2d)
	.word 0x01000000  ! 922: NOP	nop
	.word 0x85976000  ! 923: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa5e6a000  ! 924: SAVE_I	save	%r26, 0x0001, %r18
	.word 0x83976000  ! 925: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb5484000  ! 926: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xbfe62000  ! 927: SAVE_I	save	%r24, 0x0001, %r31
hwintr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_225), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 928: NOP	nop
hwintr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_226), 16, 16)) -> intp(0, 0, 12)
	.word 0x01000000  ! 929: NOP	nop
	.word 0x8796e000  ! 930: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8795e000  ! 931: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xab50c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xab484000  ! 933: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa7e66000  ! 934: SAVE_I	save	%r25, 0x0001, %r19
hwintr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_227), 16, 16)) -> intp(0, 0, 3d)
	.word 0x01000000  ! 935: NOP	nop
	.word 0x839c2000  ! 936: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
hwintr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_228), 16, 16)) -> intp(0, 0, 33)
	.word 0x01000000  ! 937: NOP	nop
	.word 0x81972000  ! 938: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa3484000  ! 939: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xb9484000  ! 940: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xaf504000  ! 941: RDPR_TNPC	<illegal instruction>
hwintr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_229), 16, 16)) -> intp(0, 0, 20)
	.word 0x01000000  ! 942: NOP	nop
	.word 0x839f2000  ! 943: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x81976000  ! 944: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
hwintr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_230), 16, 16)) -> intp(0, 0, 1d)
	.word 0x01000000  ! 945: NOP	nop
hwintr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_231), 16, 16)) -> intp(0, 0, c)
	.word 0x01000000  ! 946: NOP	nop
	.word 0xa7e4a000  ! 947: SAVE_I	save	%r18, 0x0001, %r19
	.word 0xb9e4a000  ! 948: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x83972000  ! 949: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbde52000  ! 950: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8794e000  ! 951: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb3e6e000  ! 952: SAVE_I	save	%r27, 0x0001, %r25
	.word 0xa7e62000  ! 953: SAVE_I	save	%r24, 0x0001, %r19
hwintr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_232), 16, 16)) -> intp(0, 0, 20)
	.word 0x01000000  ! 954: NOP	nop
	.word 0x8596e000  ! 955: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
hwintr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_233), 16, 16)) -> intp(0, 0, 3e)
	.word 0x01000000  ! 956: NOP	nop
	.word 0xaf500000  ! 957: RDPR_TPC	<illegal instruction>
	.word 0xb5e62000  ! 958: SAVE_I	save	%r24, 0x0001, %r26
	.word 0x8397e000  ! 959: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb9484000  ! 960: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x839fa000  ! 961: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa9e76000  ! 962: SAVE_I	save	%r29, 0x0001, %r20
	.word 0x8396a000  ! 963: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xab504000  ! 964: RDPR_TNPC	<illegal instruction>
hwintr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_234), 16, 16)) -> intp(0, 0, 2b)
	.word 0x01000000  ! 965: NOP	nop
	.word 0xb1e52000  ! 966: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x81942000  ! 967: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa5504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xbbe72000  ! 970: SAVE_I	save	%r28, 0x0001, %r29
hwintr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_235), 16, 16)) -> intp(0, 0, 14)
	.word 0x01000000  ! 971: NOP	nop
hwintr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_236), 16, 16)) -> intp(0, 0, 3c)
	.word 0x01000000  ! 972: NOP	nop
hwintr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_237), 16, 16)) -> intp(0, 0, 31)
	.word 0x01000000  ! 973: NOP	nop
	.word 0x81972000  ! 974: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8194a000  ! 975: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb1e7e000  ! 976: SAVE_I	save	%r31, 0x0001, %r24
	.word 0x839f6000  ! 977: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
hwintr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_238), 16, 16)) -> intp(0, 0, 3a)
	.word 0x01000000  ! 978: NOP	nop
	.word 0x8194e000  ! 979: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb1484000  ! 980: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xb7e52000  ! 981: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe6a000  ! 982: SAVE_I	save	%r26, 0x0001, %r29
	.word 0x8395e000  ! 983: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa3e52000  ! 984: SAVE_I	save	%r20, 0x0001, %r17
	.word 0xb5500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 986: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_239), 16, 16)) -> intp(0, 0, 1b)
	.word 0x01000000  ! 987: NOP	nop
	.word 0xa1e7e000  ! 988: SAVE_I	save	%r31, 0x0001, %r16
hwintr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_240), 16, 16)) -> intp(0, 0, 3)
	.word 0x01000000  ! 989: NOP	nop
	.word 0xaf484000  ! 990: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xabe72000  ! 991: SAVE_I	save	%r28, 0x0001, %r21
	.word 0x81942000  ! 992: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8796e000  ! 993: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb9508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 995: RDPR_TSTATE	<illegal instruction>
hwintr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_241), 16, 16)) -> intp(0, 0, 39)
	.word 0x01000000  ! 996: NOP	nop
	.word 0xa5504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x8596e000  ! 998: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
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
	.word 0xbb504000  ! 1: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb1e6e000  ! 2: SAVE_I	save	%r27, 0x0001, %r24
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 9)
	.word 0x01000000  ! 3: NOP	nop
	.word 0xade52000  ! 4: SAVE_I	save	%r20, 0x0001, %r22
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 1f)
	.word 0x01000000  ! 5: NOP	nop
	.word 0x839da000  ! 6: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 7: NOP	nop
	.word 0x8397e000  ! 8: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87962000  ! 9: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb1e66000  ! 10: SAVE_I	save	%r25, 0x0001, %r24
	.word 0xad484000  ! 11: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x8797a000  ! 12: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb5500000  ! 13: RDPR_TPC	rdpr	%tpc, %r26
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 20)
	.word 0x01000000  ! 14: NOP	nop
	.word 0x8797e000  ! 15: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8797a000  ! 16: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x839fe000  ! 17: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa5508000  ! 18: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xabe76000  ! 19: SAVE_I	save	%r29, 0x0001, %r21
	.word 0xb950c000  ! 20: RDPR_TT	<illegal instruction>
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 3b)
	.word 0x01000000  ! 21: NOP	nop
	.word 0xafe72000  ! 22: SAVE_I	save	%r28, 0x0001, %r23
	.word 0x8196a000  ! 23: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb9500000  ! 24: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xbb500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xafe6e000  ! 26: SAVE_I	save	%r27, 0x0001, %r23
	.word 0x81942000  ! 27: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 37)
	.word 0x01000000  ! 28: NOP	nop
	.word 0xbd484000  ! 29: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xa7e5a000  ! 30: SAVE_I	save	%r22, 0x0001, %r19
	.word 0x839ce000  ! 31: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 22)
	.word 0x01000000  ! 32: NOP	nop
	.word 0xb750c000  ! 33: RDPR_TT	rdpr	%tt, %r27
	.word 0xa3500000  ! 34: RDPR_TPC	<illegal instruction>
	.word 0xbbe4a000  ! 35: SAVE_I	save	%r18, 0x0001, %r29
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 36: NOP	nop
	.word 0xa5508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x8795e000  ! 38: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 39: NOP	nop
	.word 0xbfe56000  ! 40: SAVE_I	save	%r21, 0x0001, %r31
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 41: NOP	nop
	.word 0x87952000  ! 42: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x83956000  ! 43: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839fa000  ! 44: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x83946000  ! 45: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, a)
	.word 0x01000000  ! 46: NOP	nop
	.word 0xa5500000  ! 47: RDPR_TPC	rdpr	%tpc, %r18
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 2f)
	.word 0x01000000  ! 48: NOP	nop
	.word 0x839d2000  ! 49: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xbf484000  ! 50: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xa5e4a000  ! 51: SAVE_I	save	%r18, 0x0001, %r18
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 17)
	.word 0x01000000  ! 52: NOP	nop
	.word 0xbbe56000  ! 53: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4e000  ! 54: SAVE_I	save	%r19, 0x0001, %r24
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 8)
	.word 0x01000000  ! 55: NOP	nop
	.word 0xb3484000  ! 56: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xa9504000  ! 57: RDPR_TNPC	rdpr	%tnpc, %r20
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 9)
	.word 0x01000000  ! 58: NOP	nop
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 59: NOP	nop
	.word 0x8597e000  ! 60: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa150c000  ! 61: RDPR_TT	rdpr	%tt, %r16
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 1d)
	.word 0x01000000  ! 62: NOP	nop
	.word 0x8594e000  ! 63: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87966000  ! 64: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa550c000  ! 65: RDPR_TT	rdpr	%tt, %r18
	.word 0xbfe4a000  ! 66: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3504000  ! 67: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 68: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbde4e000  ! 69: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8794a000  ! 70: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8596e000  ! 71: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 72: NOP	nop
	.word 0x85976000  ! 73: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa5e4a000  ! 74: SAVE_I	save	%r18, 0x0001, %r18
	.word 0xa9e56000  ! 75: SAVE_I	save	%r21, 0x0001, %r20
	.word 0x8194e000  ! 76: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xabe4e000  ! 77: SAVE_I	save	%r19, 0x0001, %r21
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, a)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x83976000  ! 79: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8394e000  ! 80: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa9e56000  ! 81: SAVE_I	save	%r21, 0x0001, %r20
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 1d)
	.word 0x01000000  ! 82: NOP	nop
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 37)
	.word 0x01000000  ! 83: NOP	nop
	.word 0xafe76000  ! 84: SAVE_I	save	%r29, 0x0001, %r23
	.word 0x81946000  ! 85: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbde4a000  ! 86: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xa5508000  ! 87: RDPR_TSTATE	rdpr	%tstate, %r18
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 1e)
	.word 0x01000000  ! 88: NOP	nop
	.word 0xb9508000  ! 89: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 90: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 91: RDPR_TPC	<illegal instruction>
	.word 0xade7a000  ! 92: SAVE_I	save	%r30, 0x0001, %r22
	.word 0xa9508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 94: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 38)
	.word 0x01000000  ! 95: NOP	nop
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 23)
	.word 0x01000000  ! 96: NOP	nop
	.word 0x81966000  ! 97: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa1500000  ! 98: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8794a000  ! 99: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa3504000  ! 100: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xbf504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xbbe66000  ! 102: SAVE_I	save	%r25, 0x0001, %r29
	.word 0x81956000  ! 103: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb1484000  ! 104: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0x83962000  ! 105: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa5508000  ! 106: RDPR_TSTATE	rdpr	%tstate, %r18
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 2f)
	.word 0x01000000  ! 107: NOP	nop
	.word 0xabe42000  ! 108: SAVE_I	save	%r16, 0x0001, %r21
	.word 0xa5e72000  ! 109: SAVE_I	save	%r28, 0x0001, %r18
	.word 0xab50c000  ! 110: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 111: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 112: NOP	nop
	.word 0xbbe46000  ! 113: SAVE_I	save	%r17, 0x0001, %r29
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 114: NOP	nop
	.word 0xade7e000  ! 115: SAVE_I	save	%r31, 0x0001, %r22
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 116: NOP	nop
	.word 0x87976000  ! 117: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x85946000  ! 118: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x87976000  ! 119: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8197a000  ! 120: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 29)
	.word 0x01000000  ! 121: NOP	nop
	.word 0xabe7a000  ! 122: SAVE_I	save	%r30, 0x0001, %r21
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 9)
	.word 0x01000000  ! 123: NOP	nop
	.word 0xab504000  ! 124: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x839c6000  ! 125: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbfe6e000  ! 126: SAVE_I	save	%r27, 0x0001, %r31
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 15)
	.word 0x01000000  ! 127: NOP	nop
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 3d)
	.word 0x01000000  ! 128: NOP	nop
	.word 0xaf500000  ! 129: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xafe46000  ! 130: SAVE_I	save	%r17, 0x0001, %r23
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 35)
	.word 0x01000000  ! 131: NOP	nop
	.word 0x839f6000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8797a000  ! 133: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x87946000  ! 134: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb9e6a000  ! 135: SAVE_I	save	%r26, 0x0001, %r28
	.word 0xb1484000  ! 136: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0x8196e000  ! 137: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 26)
	.word 0x01000000  ! 138: NOP	nop
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 21)
	.word 0x01000000  ! 139: NOP	nop
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, c)
	.word 0x01000000  ! 140: NOP	nop
	.word 0xbf500000  ! 141: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xa9484000  ! 142: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa3504000  ! 143: RDPR_TNPC	<illegal instruction>
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 17)
	.word 0x01000000  ! 144: NOP	nop
	.word 0xbf500000  ! 145: RDPR_TPC	<illegal instruction>
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 26)
	.word 0x01000000  ! 146: NOP	nop
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 27)
	.word 0x01000000  ! 147: NOP	nop
	.word 0xade5e000  ! 148: SAVE_I	save	%r23, 0x0001, %r22
	.word 0xb1504000  ! 149: RDPR_TNPC	<illegal instruction>
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 18)
	.word 0x01000000  ! 150: NOP	nop
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, b)
	.word 0x01000000  ! 151: NOP	nop
	.word 0xb9484000  ! 152: RDHPR_HTSTATE	rdhpr	%htstate, %r28
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 3)
	.word 0x01000000  ! 153: NOP	nop
	.word 0xb3e6e000  ! 154: SAVE_I	save	%r27, 0x0001, %r25
	.word 0xb3e76000  ! 155: SAVE_I	save	%r29, 0x0001, %r25
	.word 0xb9e4e000  ! 156: SAVE_I	save	%r19, 0x0001, %r28
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 27)
	.word 0x01000000  ! 157: NOP	nop
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 29)
	.word 0x01000000  ! 158: NOP	nop
	.word 0xbf50c000  ! 159: RDPR_TT	<illegal instruction>
	.word 0xbbe76000  ! 160: SAVE_I	save	%r29, 0x0001, %r29
	.word 0xa7484000  ! 161: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xb1e7a000  ! 162: SAVE_I	save	%r30, 0x0001, %r24
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 163: NOP	nop
	.word 0x839e6000  ! 164: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 1b)
	.word 0x01000000  ! 165: NOP	nop
	.word 0xabe72000  ! 166: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xb5e52000  ! 167: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5500000  ! 168: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x87946000  ! 169: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8195a000  ! 170: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb3508000  ! 171: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb1e7a000  ! 172: SAVE_I	save	%r30, 0x0001, %r24
	.word 0x81966000  ! 173: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa1500000  ! 174: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x839de000  ! 175: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 39)
	.word 0x01000000  ! 176: NOP	nop
	.word 0xb7484000  ! 177: RDHPR_HTSTATE	rdhpr	%htstate, %r27
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 31)
	.word 0x01000000  ! 178: NOP	nop
	.word 0xbf508000  ! 179: RDPR_TSTATE	rdpr	%tstate, %r31
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 6)
	.word 0x01000000  ! 180: NOP	nop
	.word 0x87942000  ! 181: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbbe56000  ! 182: SAVE_I	save	%r21, 0x0001, %r29
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 183: NOP	nop
	.word 0xa9e56000  ! 184: SAVE_I	save	%r21, 0x0001, %r20
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 1a)
	.word 0x01000000  ! 185: NOP	nop
	.word 0xad508000  ! 186: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xa3e62000  ! 187: SAVE_I	save	%r24, 0x0001, %r17
	.word 0x87962000  ! 188: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x83942000  ! 189: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 24)
	.word 0x01000000  ! 190: NOP	nop
hwintr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_52), 16, 16)) -> intp(3, 0, 36)
	.word 0x01000000  ! 191: NOP	nop
	.word 0xbbe42000  ! 192: SAVE_I	save	%r16, 0x0001, %r29
hwintr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_53), 16, 16)) -> intp(3, 0, 2b)
	.word 0x01000000  ! 193: NOP	nop
hwintr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_54), 16, 16)) -> intp(3, 0, 1c)
	.word 0x01000000  ! 194: NOP	nop
hwintr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_55), 16, 16)) -> intp(3, 0, 2f)
	.word 0x01000000  ! 195: NOP	nop
hwintr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_56), 16, 16)) -> intp(3, 0, 33)
	.word 0x01000000  ! 196: NOP	nop
hwintr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_57), 16, 16)) -> intp(3, 0, 3d)
	.word 0x01000000  ! 197: NOP	nop
hwintr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_58), 16, 16)) -> intp(3, 0, 30)
	.word 0x01000000  ! 198: NOP	nop
hwintr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_59), 16, 16)) -> intp(3, 0, a)
	.word 0x01000000  ! 199: NOP	nop
	.word 0xb1e4e000  ! 200: SAVE_I	save	%r19, 0x0001, %r24
hwintr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_60), 16, 16)) -> intp(3, 0, 2f)
	.word 0x01000000  ! 201: NOP	nop
hwintr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_61), 16, 16)) -> intp(3, 0, 39)
	.word 0x01000000  ! 202: NOP	nop
hwintr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_62), 16, 16)) -> intp(3, 0, 1e)
	.word 0x01000000  ! 203: NOP	nop
	.word 0xb7484000  ! 204: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xb7504000  ! 205: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xad500000  ! 206: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 207: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 208: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x87956000  ! 210: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xad484000  ! 211: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa3e42000  ! 212: SAVE_I	save	%r16, 0x0001, %r17
hwintr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_63), 16, 16)) -> intp(3, 0, 7)
	.word 0x01000000  ! 213: NOP	nop
	.word 0xafe6a000  ! 214: SAVE_I	save	%r26, 0x0001, %r23
hwintr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_64), 16, 16)) -> intp(3, 0, d)
	.word 0x01000000  ! 215: NOP	nop
	.word 0x87962000  ! 216: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87972000  ! 217: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_65), 16, 16)) -> intp(3, 0, 31)
	.word 0x01000000  ! 218: NOP	nop
	.word 0xaf504000  ! 219: RDPR_TNPC	rdpr	%tnpc, %r23
hwintr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_66), 16, 16)) -> intp(3, 0, 10)
	.word 0x01000000  ! 220: NOP	nop
	.word 0xaf50c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 222: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb3e62000  ! 223: SAVE_I	save	%r24, 0x0001, %r25
	.word 0x83972000  ! 224: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbde7a000  ! 225: SAVE_I	save	%r30, 0x0001, %r30
hwintr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_67), 16, 16)) -> intp(3, 0, 10)
	.word 0x01000000  ! 226: NOP	nop
	.word 0xb950c000  ! 227: RDPR_TT	rdpr	%tt, %r28
	.word 0xafe46000  ! 228: SAVE_I	save	%r17, 0x0001, %r23
	.word 0x87976000  ! 229: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbd484000  ! 230: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xafe62000  ! 231: SAVE_I	save	%r24, 0x0001, %r23
	.word 0xa9484000  ! 232: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa7508000  ! 233: RDPR_TSTATE	<illegal instruction>
hwintr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_68), 16, 16)) -> intp(3, 0, 1e)
	.word 0x01000000  ! 234: NOP	nop
	.word 0xb5504000  ! 235: RDPR_TNPC	<illegal instruction>
	.word 0xbd484000  ! 236: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xb550c000  ! 237: RDPR_TT	<illegal instruction>
hwintr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_69), 16, 16)) -> intp(3, 0, 20)
	.word 0x01000000  ! 238: NOP	nop
hwintr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_70), 16, 16)) -> intp(3, 0, 39)
	.word 0x01000000  ! 239: NOP	nop
	.word 0xabe6e000  ! 240: SAVE_I	save	%r27, 0x0001, %r21
	.word 0x8795e000  ! 241: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb9e72000  ! 242: SAVE_I	save	%r28, 0x0001, %r28
hwintr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_71), 16, 16)) -> intp(3, 0, 2c)
	.word 0x01000000  ! 243: NOP	nop
	.word 0x839c2000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x85972000  ! 245: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa5e42000  ! 246: SAVE_I	save	%r16, 0x0001, %r18
	.word 0xaf500000  ! 247: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x83962000  ! 248: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x83946000  ! 249: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x87966000  ! 250: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbde6e000  ! 251: SAVE_I	save	%r27, 0x0001, %r30
	.word 0xade56000  ! 252: SAVE_I	save	%r21, 0x0001, %r22
	.word 0xa3e6a000  ! 253: SAVE_I	save	%r26, 0x0001, %r17
hwintr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_72), 16, 16)) -> intp(3, 0, 21)
	.word 0x01000000  ! 254: NOP	nop
hwintr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_73), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 255: NOP	nop
hwintr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_74), 16, 16)) -> intp(3, 0, 21)
	.word 0x01000000  ! 256: NOP	nop
	.word 0x83966000  ! 257: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb3508000  ! 258: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb7508000  ! 259: RDPR_TSTATE	<illegal instruction>
	.word 0xbf484000  ! 260: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xa9508000  ! 261: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xabe66000  ! 262: SAVE_I	save	%r25, 0x0001, %r21
	.word 0x85956000  ! 263: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x83946000  ! 264: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83952000  ! 265: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x83942000  ! 266: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
hwintr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_75), 16, 16)) -> intp(3, 0, 18)
	.word 0x01000000  ! 267: NOP	nop
hwintr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_76), 16, 16)) -> intp(3, 0, 20)
	.word 0x01000000  ! 268: NOP	nop
	.word 0xa3e6e000  ! 269: SAVE_I	save	%r27, 0x0001, %r17
hwintr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_77), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 270: NOP	nop
hwintr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_78), 16, 16)) -> intp(3, 0, 3d)
	.word 0x01000000  ! 271: NOP	nop
	.word 0x85962000  ! 272: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb9484000  ! 273: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb1e56000  ! 274: SAVE_I	save	%r21, 0x0001, %r24
hwintr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_79), 16, 16)) -> intp(3, 0, 3a)
	.word 0x01000000  ! 275: NOP	nop
	.word 0x83946000  ! 276: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8596a000  ! 277: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb9e7a000  ! 278: SAVE_I	save	%r30, 0x0001, %r28
	.word 0xbb500000  ! 279: RDPR_TPC	rdpr	%tpc, %r29
hwintr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_80), 16, 16)) -> intp(3, 0, 3c)
	.word 0x01000000  ! 280: NOP	nop
	.word 0x8394e000  ! 281: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa9e5e000  ! 282: SAVE_I	save	%r23, 0x0001, %r20
	.word 0x83946000  ! 283: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbb504000  ! 284: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xbd508000  ! 285: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 286: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa7484000  ! 287: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_81), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 288: NOP	nop
	.word 0xa1e5a000  ! 289: SAVE_I	save	%r22, 0x0001, %r16
	.word 0xbfe76000  ! 290: SAVE_I	save	%r29, 0x0001, %r31
hwintr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_82), 16, 16)) -> intp(3, 0, e)
	.word 0x01000000  ! 291: NOP	nop
hwintr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_83), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 292: NOP	nop
hwintr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_84), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 293: NOP	nop
	.word 0xb7484000  ! 294: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xb9e5e000  ! 295: SAVE_I	save	%r23, 0x0001, %r28
hwintr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_85), 16, 16)) -> intp(3, 0, 3e)
	.word 0x01000000  ! 296: NOP	nop
	.word 0x839e2000  ! 297: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xade5a000  ! 298: SAVE_I	save	%r22, 0x0001, %r22
hwintr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_86), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 299: NOP	nop
hwintr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_87), 16, 16)) -> intp(3, 0, 6)
	.word 0x01000000  ! 300: NOP	nop
hwintr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_88), 16, 16)) -> intp(3, 0, 5)
	.word 0x01000000  ! 301: NOP	nop
	.word 0xa1e52000  ! 302: SAVE_I	save	%r20, 0x0001, %r16
	.word 0xb5e72000  ! 303: SAVE_I	save	%r28, 0x0001, %r26
hwintr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_89), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 304: NOP	nop
	.word 0xa9484000  ! 305: RDHPR_HTSTATE	rdhpr	%htstate, %r20
hwintr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_90), 16, 16)) -> intp(3, 0, 12)
	.word 0x01000000  ! 306: NOP	nop
	.word 0x839ee000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xad508000  ! 308: RDPR_TSTATE	rdpr	%tstate, %r22
hwintr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_91), 16, 16)) -> intp(3, 0, 1e)
	.word 0x01000000  ! 309: NOP	nop
	.word 0xaf508000  ! 310: RDPR_TSTATE	<illegal instruction>
	.word 0x839ce000  ! 311: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xad504000  ! 312: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x81972000  ! 313: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_92), 16, 16)) -> intp(3, 0, 0)
	.word 0x01000000  ! 314: NOP	nop
hwintr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_93), 16, 16)) -> intp(3, 0, 15)
	.word 0x01000000  ! 315: NOP	nop
hwintr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_94), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 316: NOP	nop
	.word 0xbb484000  ! 317: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xafe7e000  ! 318: SAVE_I	save	%r31, 0x0001, %r23
	.word 0xa7484000  ! 319: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_95), 16, 16)) -> intp(3, 0, 29)
	.word 0x01000000  ! 320: NOP	nop
	.word 0xa3504000  ! 321: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 322: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_96), 16, 16)) -> intp(3, 0, 13)
	.word 0x01000000  ! 323: NOP	nop
	.word 0xb3e76000  ! 324: SAVE_I	save	%r29, 0x0001, %r25
hwintr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_97), 16, 16)) -> intp(3, 0, 3c)
	.word 0x01000000  ! 325: NOP	nop
hwintr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_98), 16, 16)) -> intp(3, 0, 2c)
	.word 0x01000000  ! 326: NOP	nop
	.word 0xbf508000  ! 327: RDPR_TSTATE	rdpr	%tstate, %r31
hwintr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_99), 16, 16)) -> intp(3, 0, f)
	.word 0x01000000  ! 328: NOP	nop
	.word 0xb5484000  ! 329: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xa1e42000  ! 330: SAVE_I	save	%r16, 0x0001, %r16
	.word 0xb150c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xb5e42000  ! 332: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e5e000  ! 333: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xaf484000  ! 334: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0x87962000  ! 335: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8797a000  ! 336: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_100), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 337: NOP	nop
	.word 0x8795e000  ! 338: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x81976000  ! 339: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa7e52000  ! 340: SAVE_I	save	%r20, 0x0001, %r19
	.word 0x8795e000  ! 341: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
hwintr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_101), 16, 16)) -> intp(3, 0, 1d)
	.word 0x01000000  ! 342: NOP	nop
	.word 0xb9e72000  ! 343: SAVE_I	save	%r28, 0x0001, %r28
	.word 0xa3504000  ! 344: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x85952000  ! 345: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xabe7a000  ! 346: SAVE_I	save	%r30, 0x0001, %r21
	.word 0xad504000  ! 347: RDPR_TNPC	rdpr	%tnpc, %r22
hwintr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_102), 16, 16)) -> intp(3, 0, 18)
	.word 0x01000000  ! 348: NOP	nop
	.word 0x839ce000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa7484000  ! 350: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xab504000  ! 351: RDPR_TNPC	<illegal instruction>
	.word 0xb3e4a000  ! 352: SAVE_I	save	%r18, 0x0001, %r25
hwintr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_103), 16, 16)) -> intp(3, 0, 3b)
	.word 0x01000000  ! 353: NOP	nop
hwintr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_104), 16, 16)) -> intp(3, 0, 2d)
	.word 0x01000000  ! 354: NOP	nop
hwintr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_105), 16, 16)) -> intp(3, 0, 37)
	.word 0x01000000  ! 355: NOP	nop
	.word 0x83972000  ! 356: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x839c2000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x83952000  ! 358: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb5e5a000  ! 359: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e42000  ! 360: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x87966000  ! 361: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb7504000  ! 362: RDPR_TNPC	rdpr	%tnpc, %r27
hwintr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_106), 16, 16)) -> intp(3, 0, 3e)
	.word 0x01000000  ! 363: NOP	nop
	.word 0xb5e66000  ! 364: SAVE_I	save	%r25, 0x0001, %r26
hwintr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_107), 16, 16)) -> intp(3, 0, 2a)
	.word 0x01000000  ! 365: NOP	nop
	.word 0xa7484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa1e4a000  ! 367: SAVE_I	save	%r18, 0x0001, %r16
	.word 0xaf500000  ! 368: RDPR_TPC	<illegal instruction>
	.word 0xa7e76000  ! 369: SAVE_I	save	%r29, 0x0001, %r19
	.word 0xbfe6e000  ! 370: SAVE_I	save	%r27, 0x0001, %r31
hwintr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_108), 16, 16)) -> intp(3, 0, 2d)
	.word 0x01000000  ! 371: NOP	nop
	.word 0xbd484000  ! 372: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xb3e7a000  ! 373: SAVE_I	save	%r30, 0x0001, %r25
	.word 0xafe62000  ! 374: SAVE_I	save	%r24, 0x0001, %r23
	.word 0x87976000  ! 375: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8395a000  ! 376: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb9e5e000  ! 377: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e46000  ! 378: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8596a000  ! 379: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87962000  ! 380: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb3e42000  ! 381: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9504000  ! 382: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xabe7e000  ! 383: SAVE_I	save	%r31, 0x0001, %r21
	.word 0xa1508000  ! 384: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 385: RDPR_TT	<illegal instruction>
	.word 0xabe76000  ! 386: SAVE_I	save	%r29, 0x0001, %r21
hwintr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_109), 16, 16)) -> intp(3, 0, 34)
	.word 0x01000000  ! 387: NOP	nop
	.word 0xa7500000  ! 388: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 389: RDPR_TNPC	<illegal instruction>
	.word 0xbde72000  ! 390: SAVE_I	save	%r28, 0x0001, %r30
	.word 0xa9484000  ! 391: RDHPR_HTSTATE	rdhpr	%htstate, %r20
hwintr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_110), 16, 16)) -> intp(3, 0, a)
	.word 0x01000000  ! 392: NOP	nop
	.word 0xa5500000  ! 393: RDPR_TPC	<illegal instruction>
hwintr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_111), 16, 16)) -> intp(3, 0, 1)
	.word 0x01000000  ! 394: NOP	nop
	.word 0x8794a000  ! 395: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x839da000  ! 396: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb150c000  ! 397: RDPR_TT	rdpr	%tt, %r24
	.word 0xbd484000  ! 398: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xbfe42000  ! 399: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xab484000  ! 400: RDHPR_HTSTATE	rdhpr	%htstate, %r21
hwintr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_112), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 401: NOP	nop
hwintr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_113), 16, 16)) -> intp(3, 0, 1c)
	.word 0x01000000  ! 402: NOP	nop
	.word 0xb5e66000  ! 403: SAVE_I	save	%r25, 0x0001, %r26
hwintr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_114), 16, 16)) -> intp(3, 0, 8)
	.word 0x01000000  ! 404: NOP	nop
	.word 0xb3500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0xb3e62000  ! 406: SAVE_I	save	%r24, 0x0001, %r25
hwintr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_115), 16, 16)) -> intp(3, 0, 3b)
	.word 0x01000000  ! 407: NOP	nop
	.word 0xb950c000  ! 408: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 409: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e6a000  ! 410: SAVE_I	save	%r26, 0x0001, %r25
	.word 0xa3e76000  ! 411: SAVE_I	save	%r29, 0x0001, %r17
	.word 0xbfe5e000  ! 412: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7504000  ! 413: RDPR_TNPC	<illegal instruction>
hwintr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_116), 16, 16)) -> intp(3, 0, 6)
	.word 0x01000000  ! 414: NOP	nop
	.word 0x8395e000  ! 415: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb9e7e000  ! 416: SAVE_I	save	%r31, 0x0001, %r28
	.word 0xb9484000  ! 417: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x81952000  ! 418: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
hwintr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_117), 16, 16)) -> intp(3, 0, 7)
	.word 0x01000000  ! 419: NOP	nop
hwintr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_118), 16, 16)) -> intp(3, 0, 38)
	.word 0x01000000  ! 420: NOP	nop
	.word 0x8196a000  ! 421: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8195e000  ! 422: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8797a000  ! 423: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_119), 16, 16)) -> intp(3, 0, d)
	.word 0x01000000  ! 424: NOP	nop
	.word 0x87976000  ! 425: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8194a000  ! 426: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
hwintr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_120), 16, 16)) -> intp(3, 0, 3a)
	.word 0x01000000  ! 427: NOP	nop
	.word 0x8595e000  ! 428: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa7e5e000  ! 429: SAVE_I	save	%r23, 0x0001, %r19
	.word 0x8397a000  ! 430: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xb1500000  ! 431: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xa9504000  ! 432: RDPR_TNPC	<illegal instruction>
	.word 0xb9e62000  ! 433: SAVE_I	save	%r24, 0x0001, %r28
	.word 0x87972000  ! 434: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_121), 16, 16)) -> intp(3, 0, 24)
	.word 0x01000000  ! 435: NOP	nop
hwintr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_122), 16, 16)) -> intp(3, 0, 14)
	.word 0x01000000  ! 436: NOP	nop
	.word 0x87976000  ! 437: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x87962000  ! 438: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
hwintr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_123), 16, 16)) -> intp(3, 0, 36)
	.word 0x01000000  ! 439: NOP	nop
	.word 0x87942000  ! 440: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8195e000  ! 441: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa7500000  ! 442: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x839ea000  ! 443: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
hwintr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_124), 16, 16)) -> intp(3, 0, 37)
	.word 0x01000000  ! 444: NOP	nop
	.word 0xa5e5a000  ! 445: SAVE_I	save	%r22, 0x0001, %r18
	.word 0xade42000  ! 446: SAVE_I	save	%r16, 0x0001, %r22
	.word 0xa7e5e000  ! 447: SAVE_I	save	%r23, 0x0001, %r19
	.word 0x839ee000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8194e000  ! 449: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5500000  ! 450: RDPR_TPC	rdpr	%tpc, %r26
hwintr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_125), 16, 16)) -> intp(3, 0, 31)
	.word 0x01000000  ! 451: NOP	nop
	.word 0xa9e5e000  ! 452: SAVE_I	save	%r23, 0x0001, %r20
	.word 0xbd50c000  ! 453: RDPR_TT	<illegal instruction>
	.word 0xa3504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0x8795e000  ! 455: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa1508000  ! 456: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8195e000  ! 457: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbf484000  ! 458: RDHPR_HTSTATE	rdhpr	%htstate, %r31
hwintr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_126), 16, 16)) -> intp(3, 0, 22)
	.word 0x01000000  ! 459: NOP	nop
	.word 0x8197a000  ! 460: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xa3484000  ! 461: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x8794a000  ! 462: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_127), 16, 16)) -> intp(3, 0, 30)
	.word 0x01000000  ! 463: NOP	nop
	.word 0x839ee000  ! 464: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8195a000  ! 465: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8794a000  ! 466: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_128), 16, 16)) -> intp(3, 0, 3e)
	.word 0x01000000  ! 467: NOP	nop
	.word 0xa5484000  ! 468: RDHPR_HTSTATE	rdhpr	%htstate, %r18
hwintr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_129), 16, 16)) -> intp(3, 0, 5)
	.word 0x01000000  ! 469: NOP	nop
hwintr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_130), 16, 16)) -> intp(3, 0, 24)
	.word 0x01000000  ! 470: NOP	nop
hwintr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_131), 16, 16)) -> intp(3, 0, c)
	.word 0x01000000  ! 471: NOP	nop
	.word 0xade76000  ! 472: SAVE_I	save	%r29, 0x0001, %r22
	.word 0xbb500000  ! 473: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 474: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
hwintr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_132), 16, 16)) -> intp(3, 0, f)
	.word 0x01000000  ! 475: NOP	nop
	.word 0x839ee000  ! 476: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb150c000  ! 477: RDPR_TT	rdpr	%tt, %r24
	.word 0x8197e000  ! 478: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb350c000  ! 479: RDPR_TT	rdpr	%tt, %r25
	.word 0xa1500000  ! 480: RDPR_TPC	<illegal instruction>
	.word 0xb9e56000  ! 481: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xade46000  ! 482: SAVE_I	save	%r17, 0x0001, %r22
	.word 0x839d6000  ! 483: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xab484000  ! 484: RDHPR_HTSTATE	rdhpr	%htstate, %r21
hwintr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_133), 16, 16)) -> intp(3, 0, 18)
	.word 0x01000000  ! 485: NOP	nop
	.word 0xb9504000  ! 486: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 487: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xafe42000  ! 488: SAVE_I	save	%r16, 0x0001, %r23
	.word 0xb350c000  ! 489: RDPR_TT	rdpr	%tt, %r25
	.word 0xafe62000  ! 490: SAVE_I	save	%r24, 0x0001, %r23
	.word 0x8795a000  ! 491: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbb508000  ! 492: RDPR_TSTATE	rdpr	%tstate, %r29
hwintr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_134), 16, 16)) -> intp(3, 0, 37)
	.word 0x01000000  ! 493: NOP	nop
	.word 0xa1500000  ! 494: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8397e000  ! 495: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8396a000  ! 496: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa9e4e000  ! 497: SAVE_I	save	%r19, 0x0001, %r20
	.word 0xb1e5a000  ! 498: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3484000  ! 499: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0x81972000  ! 500: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa1e42000  ! 501: SAVE_I	save	%r16, 0x0001, %r16
	.word 0xb1e7a000  ! 502: SAVE_I	save	%r30, 0x0001, %r24
	.word 0xad50c000  ! 503: RDPR_TT	rdpr	%tt, %r22
	.word 0xad504000  ! 504: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 505: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 506: RDPR_TNPC	<illegal instruction>
hwintr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_135), 16, 16)) -> intp(3, 0, 2a)
	.word 0x01000000  ! 507: NOP	nop
	.word 0x8397e000  ! 508: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x839f6000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa7e52000  ! 510: SAVE_I	save	%r20, 0x0001, %r19
	.word 0xa150c000  ! 511: RDPR_TT	rdpr	%tt, %r16
	.word 0xb3508000  ! 512: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 513: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbbe52000  ! 514: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7508000  ! 515: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x839e6000  ! 516: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb9e46000  ! 517: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e66000  ! 518: SAVE_I	save	%r25, 0x0001, %r24
	.word 0xab500000  ! 519: RDPR_TPC	rdpr	%tpc, %r21
hwintr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_136), 16, 16)) -> intp(3, 0, 25)
	.word 0x01000000  ! 520: NOP	nop
hwintr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_137), 16, 16)) -> intp(3, 0, 1f)
	.word 0x01000000  ! 521: NOP	nop
	.word 0x85946000  ! 522: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8397e000  ! 523: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
hwintr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_138), 16, 16)) -> intp(3, 0, 6)
	.word 0x01000000  ! 524: NOP	nop
	.word 0xa7500000  ! 525: RDPR_TPC	rdpr	%tpc, %r19
hwintr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_139), 16, 16)) -> intp(3, 0, 2f)
	.word 0x01000000  ! 526: NOP	nop
	.word 0x8396e000  ! 527: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8394a000  ! 528: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
hwintr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_140), 16, 16)) -> intp(3, 0, d)
	.word 0x01000000  ! 529: NOP	nop
	.word 0x839c2000  ! 530: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb3504000  ! 531: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8196e000  ! 532: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb7e46000  ! 533: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xa5484000  ! 534: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xb3e4a000  ! 535: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e66000  ! 536: SAVE_I	save	%r25, 0x0001, %r26
	.word 0xa1484000  ! 537: RDHPR_HTSTATE	rdhpr	%htstate, %r16
hwintr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_141), 16, 16)) -> intp(3, 0, 35)
	.word 0x01000000  ! 538: NOP	nop
	.word 0x8396a000  ! 539: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbde6a000  ! 540: SAVE_I	save	%r26, 0x0001, %r30
	.word 0x839d2000  ! 541: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb5504000  ! 542: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x839e2000  ! 543: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xbfe7e000  ! 544: SAVE_I	save	%r31, 0x0001, %r31
hwintr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_142), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 545: NOP	nop
	.word 0xa7e42000  ! 546: SAVE_I	save	%r16, 0x0001, %r19
hwintr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_143), 16, 16)) -> intp(3, 0, 2c)
	.word 0x01000000  ! 547: NOP	nop
	.word 0xa1508000  ! 548: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x839de000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbf500000  ! 550: RDPR_TPC	rdpr	%tpc, %r31
hwintr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_144), 16, 16)) -> intp(3, 0, 31)
	.word 0x01000000  ! 551: NOP	nop
hwintr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_145), 16, 16)) -> intp(3, 0, 17)
	.word 0x01000000  ! 552: NOP	nop
	.word 0x8395e000  ! 553: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
hwintr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_146), 16, 16)) -> intp(3, 0, f)
	.word 0x01000000  ! 554: NOP	nop
hwintr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_147), 16, 16)) -> intp(3, 0, 36)
	.word 0x01000000  ! 555: NOP	nop
	.word 0xb750c000  ! 556: RDPR_TT	rdpr	%tt, %r27
	.word 0xa150c000  ! 557: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 558: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
hwintr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_148), 16, 16)) -> intp(3, 0, 34)
	.word 0x01000000  ! 559: NOP	nop
hwintr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_149), 16, 16)) -> intp(3, 0, 27)
	.word 0x01000000  ! 560: NOP	nop
	.word 0xafe5e000  ! 561: SAVE_I	save	%r23, 0x0001, %r23
	.word 0xa5e42000  ! 562: SAVE_I	save	%r16, 0x0001, %r18
	.word 0xb3500000  ! 563: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb1500000  ! 564: RDPR_TPC	<illegal instruction>
	.word 0xb3e56000  ! 565: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbd484000  ! 566: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xbb508000  ! 567: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 568: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xabe72000  ! 569: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xb9504000  ! 570: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x839ea000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xbf508000  ! 572: RDPR_TSTATE	rdpr	%tstate, %r31
hwintr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_150), 16, 16)) -> intp(3, 0, 11)
	.word 0x01000000  ! 573: NOP	nop
	.word 0xa7504000  ! 574: RDPR_TNPC	<illegal instruction>
	.word 0xb1e7e000  ! 575: SAVE_I	save	%r31, 0x0001, %r24
	.word 0xa5484000  ! 576: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa5484000  ! 577: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xb950c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xbfe52000  ! 580: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xa1508000  ! 581: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 582: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb5e66000  ! 583: SAVE_I	save	%r25, 0x0001, %r26
	.word 0xb7504000  ! 584: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8197e000  ! 585: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8596e000  ! 586: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839ca000  ! 587: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x81972000  ! 588: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_151), 16, 16)) -> intp(3, 0, 5)
	.word 0x01000000  ! 589: NOP	nop
	.word 0xad500000  ! 590: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8597a000  ! 591: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x81946000  ! 592: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa1e72000  ! 593: SAVE_I	save	%r28, 0x0001, %r16
	.word 0xa1e6a000  ! 594: SAVE_I	save	%r26, 0x0001, %r16
	.word 0x81952000  ! 595: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
hwintr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_152), 16, 16)) -> intp(3, 0, f)
	.word 0x01000000  ! 596: NOP	nop
	.word 0xa5508000  ! 597: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb3e62000  ! 598: SAVE_I	save	%r24, 0x0001, %r25
	.word 0xa5500000  ! 599: RDPR_TPC	<illegal instruction>
hwintr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_153), 16, 16)) -> intp(3, 0, 29)
	.word 0x01000000  ! 600: NOP	nop
	.word 0xb5e66000  ! 601: SAVE_I	save	%r25, 0x0001, %r26
	.word 0xb9484000  ! 602: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x83966000  ! 603: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x83942000  ! 604: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8397e000  ! 605: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8795e000  ! 606: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa7e4a000  ! 607: SAVE_I	save	%r18, 0x0001, %r19
	.word 0xa7e7a000  ! 608: SAVE_I	save	%r30, 0x0001, %r19
	.word 0xade46000  ! 609: SAVE_I	save	%r17, 0x0001, %r22
	.word 0x8196a000  ! 610: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_154), 16, 16)) -> intp(3, 0, 0)
	.word 0x01000000  ! 611: NOP	nop
	.word 0x8396e000  ! 612: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbd504000  ! 613: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x839fe000  ! 614: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x839e6000  ! 615: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
hwintr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_155), 16, 16)) -> intp(3, 0, 26)
	.word 0x01000000  ! 616: NOP	nop
	.word 0x8594a000  ! 617: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87952000  ! 618: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
hwintr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_156), 16, 16)) -> intp(3, 0, 11)
	.word 0x01000000  ! 619: NOP	nop
hwintr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_157), 16, 16)) -> intp(3, 0, 34)
	.word 0x01000000  ! 620: NOP	nop
	.word 0xa1e6a000  ! 621: SAVE_I	save	%r26, 0x0001, %r16
hwintr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_158), 16, 16)) -> intp(3, 0, 10)
	.word 0x01000000  ! 622: NOP	nop
	.word 0x81946000  ! 623: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb9508000  ! 624: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x85956000  ! 625: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8195e000  ! 626: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbb504000  ! 627: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xa950c000  ! 628: RDPR_TT	<illegal instruction>
	.word 0x8194e000  ! 629: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa9e66000  ! 630: SAVE_I	save	%r25, 0x0001, %r20
	.word 0xa7504000  ! 631: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xb5e76000  ! 632: SAVE_I	save	%r29, 0x0001, %r26
	.word 0xa3504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 634: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbf508000  ! 635: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x83962000  ! 636: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb5e5a000  ! 637: SAVE_I	save	%r22, 0x0001, %r26
hwintr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_159), 16, 16)) -> intp(3, 0, 36)
	.word 0x01000000  ! 638: NOP	nop
	.word 0x8796a000  ! 639: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
hwintr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_160), 16, 16)) -> intp(3, 0, 18)
	.word 0x01000000  ! 640: NOP	nop
	.word 0xab500000  ! 641: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xa5e5a000  ! 642: SAVE_I	save	%r22, 0x0001, %r18
	.word 0xb9504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x8794e000  ! 644: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbfe42000  ! 645: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xa1484000  ! 646: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa1484000  ! 647: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xad508000  ! 648: RDPR_TSTATE	<illegal instruction>
	.word 0x8796a000  ! 649: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb9e52000  ! 650: SAVE_I	save	%r20, 0x0001, %r28
hwintr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_161), 16, 16)) -> intp(3, 0, 1e)
	.word 0x01000000  ! 651: NOP	nop
	.word 0xbde52000  ! 652: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xafe4a000  ! 653: SAVE_I	save	%r18, 0x0001, %r23
	.word 0x839ee000  ! 654: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa9e7e000  ! 655: SAVE_I	save	%r31, 0x0001, %r20
	.word 0xb9e66000  ! 656: SAVE_I	save	%r25, 0x0001, %r28
	.word 0xad504000  ! 657: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb5484000  ! 658: RDHPR_HTSTATE	rdhpr	%htstate, %r26
hwintr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_162), 16, 16)) -> intp(3, 0, 17)
	.word 0x01000000  ! 659: NOP	nop
hwintr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_163), 16, 16)) -> intp(3, 0, 1a)
	.word 0x01000000  ! 660: NOP	nop
	.word 0xb1e4a000  ! 661: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8796e000  ! 662: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa5504000  ! 663: RDPR_TNPC	rdpr	%tnpc, %r18
hwintr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_164), 16, 16)) -> intp(3, 0, b)
	.word 0x01000000  ! 664: NOP	nop
hwintr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_165), 16, 16)) -> intp(3, 0, 3f)
	.word 0x01000000  ! 665: NOP	nop
	.word 0xb7508000  ! 666: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 667: RDPR_TNPC	<illegal instruction>
hwintr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_166), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 668: NOP	nop
	.word 0x8397e000  ! 669: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
hwintr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_167), 16, 16)) -> intp(3, 0, 5)
	.word 0x01000000  ! 670: NOP	nop
	.word 0xa5508000  ! 671: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x87966000  ! 672: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb9e6a000  ! 673: SAVE_I	save	%r26, 0x0001, %r28
	.word 0x8795e000  ! 674: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb1e7a000  ! 675: SAVE_I	save	%r30, 0x0001, %r24
	.word 0xa5484000  ! 676: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xbbe56000  ! 677: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe56000  ! 678: SAVE_I	save	%r21, 0x0001, %r31
hwintr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_168), 16, 16)) -> intp(3, 0, 29)
	.word 0x01000000  ! 679: NOP	nop
	.word 0xab500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xafe46000  ! 681: SAVE_I	save	%r17, 0x0001, %r23
	.word 0x839d2000  ! 682: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8595e000  ! 683: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xab504000  ! 684: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xb7e6a000  ! 685: SAVE_I	save	%r26, 0x0001, %r27
hwintr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_169), 16, 16)) -> intp(3, 0, 31)
	.word 0x01000000  ! 686: NOP	nop
	.word 0xabe62000  ! 687: SAVE_I	save	%r24, 0x0001, %r21
	.word 0x839de000  ! 688: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa350c000  ! 689: RDPR_TT	rdpr	%tt, %r17
	.word 0xbb484000  ! 690: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0x8396e000  ! 691: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x839c6000  ! 692: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb3e6e000  ! 693: SAVE_I	save	%r27, 0x0001, %r25
	.word 0xa1e4a000  ! 694: SAVE_I	save	%r18, 0x0001, %r16
	.word 0xa5e76000  ! 695: SAVE_I	save	%r29, 0x0001, %r18
hwintr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_170), 16, 16)) -> intp(3, 0, 23)
	.word 0x01000000  ! 696: NOP	nop
	.word 0xa7e76000  ! 697: SAVE_I	save	%r29, 0x0001, %r19
hwintr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_171), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 698: NOP	nop
	.word 0xbbe42000  ! 699: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xab50c000  ! 700: RDPR_TT	rdpr	%tt, %r21
	.word 0x839ea000  ! 701: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb5e7e000  ! 702: SAVE_I	save	%r31, 0x0001, %r26
	.word 0xb7500000  ! 703: RDPR_TPC	rdpr	%tpc, %r27
hwintr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_172), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 704: NOP	nop
	.word 0xaf500000  ! 705: RDPR_TPC	<illegal instruction>
hwintr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_173), 16, 16)) -> intp(3, 0, 2d)
	.word 0x01000000  ! 706: NOP	nop
	.word 0xa3e56000  ! 707: SAVE_I	save	%r21, 0x0001, %r17
	.word 0x87956000  ! 708: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa150c000  ! 709: RDPR_TT	rdpr	%tt, %r16
	.word 0xa5e56000  ! 710: SAVE_I	save	%r21, 0x0001, %r18
hwintr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_174), 16, 16)) -> intp(3, 0, 1b)
	.word 0x01000000  ! 711: NOP	nop
	.word 0x83972000  ! 712: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
hwintr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_175), 16, 16)) -> intp(3, 0, 36)
	.word 0x01000000  ! 713: NOP	nop
	.word 0xb9e6e000  ! 714: SAVE_I	save	%r27, 0x0001, %r28
hwintr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_176), 16, 16)) -> intp(3, 0, b)
	.word 0x01000000  ! 715: NOP	nop
	.word 0x87976000  ! 716: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_177), 16, 16)) -> intp(3, 0, 29)
	.word 0x01000000  ! 717: NOP	nop
	.word 0x8796e000  ! 718: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x839da000  ! 719: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb1e5a000  ! 720: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1504000  ! 721: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xabe7a000  ! 722: SAVE_I	save	%r30, 0x0001, %r21
	.word 0xb7500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xb9484000  ! 724: RDHPR_HTSTATE	rdhpr	%htstate, %r28
hwintr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_178), 16, 16)) -> intp(3, 0, b)
	.word 0x01000000  ! 725: NOP	nop
hwintr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_179), 16, 16)) -> intp(3, 0, 24)
	.word 0x01000000  ! 726: NOP	nop
	.word 0xb3504000  ! 727: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb150c000  ! 728: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 729: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8195e000  ! 730: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x85972000  ! 731: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb1e5a000  ! 732: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xafe52000  ! 733: SAVE_I	save	%r20, 0x0001, %r23
	.word 0x81966000  ! 734: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x83976000  ! 735: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8395a000  ! 736: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
hwintr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_180), 16, 16)) -> intp(3, 0, 14)
	.word 0x01000000  ! 737: NOP	nop
	.word 0xa7e52000  ! 738: SAVE_I	save	%r20, 0x0001, %r19
hwintr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_181), 16, 16)) -> intp(3, 0, 6)
	.word 0x01000000  ! 739: NOP	nop
hwintr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_182), 16, 16)) -> intp(3, 0, a)
	.word 0x01000000  ! 740: NOP	nop
	.word 0x81946000  ! 741: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x839c6000  ! 742: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x87946000  ! 743: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_183), 16, 16)) -> intp(3, 0, 32)
	.word 0x01000000  ! 744: NOP	nop
	.word 0xa7500000  ! 745: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x8196e000  ! 746: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83952000  ! 747: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8395a000  ! 748: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xad50c000  ! 749: RDPR_TT	rdpr	%tt, %r22
	.word 0x839fa000  ! 750: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa7e56000  ! 751: SAVE_I	save	%r21, 0x0001, %r19
	.word 0xa1e56000  ! 752: SAVE_I	save	%r21, 0x0001, %r16
	.word 0x85966000  ! 753: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbd500000  ! 754: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x85952000  ! 755: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
hwintr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_184), 16, 16)) -> intp(3, 0, 23)
	.word 0x01000000  ! 756: NOP	nop
	.word 0xa5508000  ! 757: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x87972000  ! 758: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_185), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 759: NOP	nop
	.word 0x85972000  ! 760: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xabe5e000  ! 761: SAVE_I	save	%r23, 0x0001, %r21
	.word 0x8396a000  ! 762: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa7e7e000  ! 763: SAVE_I	save	%r31, 0x0001, %r19
	.word 0xa3e4e000  ! 764: SAVE_I	save	%r19, 0x0001, %r17
hwintr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_186), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 765: NOP	nop
hwintr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_187), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 766: NOP	nop
	.word 0xa1e56000  ! 767: SAVE_I	save	%r21, 0x0001, %r16
	.word 0xa7e76000  ! 768: SAVE_I	save	%r29, 0x0001, %r19
	.word 0xb5508000  ! 769: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb1e7e000  ! 770: SAVE_I	save	%r31, 0x0001, %r24
hwintr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_188), 16, 16)) -> intp(3, 0, 23)
	.word 0x01000000  ! 771: NOP	nop
	.word 0x87942000  ! 772: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa950c000  ! 773: RDPR_TT	rdpr	%tt, %r20
hwintr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_189), 16, 16)) -> intp(3, 0, 39)
	.word 0x01000000  ! 774: NOP	nop
	.word 0xbbe46000  ! 775: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e46000  ! 776: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe5e000  ! 777: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xafe76000  ! 778: SAVE_I	save	%r29, 0x0001, %r23
	.word 0x8596e000  ! 779: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x81956000  ! 780: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
hwintr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_190), 16, 16)) -> intp(3, 0, 11)
	.word 0x01000000  ! 781: NOP	nop
	.word 0x839c2000  ! 782: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xafe46000  ! 783: SAVE_I	save	%r17, 0x0001, %r23
hwintr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_191), 16, 16)) -> intp(3, 0, c)
	.word 0x01000000  ! 784: NOP	nop
	.word 0x839d2000  ! 785: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xbbe52000  ! 786: SAVE_I	save	%r20, 0x0001, %r29
hwintr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_192), 16, 16)) -> intp(3, 0, 3c)
	.word 0x01000000  ! 787: NOP	nop
	.word 0xbb50c000  ! 788: RDPR_TT	rdpr	%tt, %r29
	.word 0xb9484000  ! 789: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb750c000  ! 790: RDPR_TT	<illegal instruction>
	.word 0xbbe56000  ! 791: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xa9e42000  ! 792: SAVE_I	save	%r16, 0x0001, %r20
	.word 0x83952000  ! 793: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xab508000  ! 794: RDPR_TSTATE	rdpr	%tstate, %r21
hwintr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_193), 16, 16)) -> intp(3, 0, 5)
	.word 0x01000000  ! 795: NOP	nop
	.word 0xab500000  ! 796: RDPR_TPC	<illegal instruction>
hwintr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_194), 16, 16)) -> intp(3, 0, 3c)
	.word 0x01000000  ! 797: NOP	nop
	.word 0x83946000  ! 798: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbde76000  ! 799: SAVE_I	save	%r29, 0x0001, %r30
	.word 0xb7504000  ! 800: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xab500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0xa5e46000  ! 802: SAVE_I	save	%r17, 0x0001, %r18
hwintr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_195), 16, 16)) -> intp(3, 0, 0)
	.word 0x01000000  ! 803: NOP	nop
	.word 0x839e2000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
hwintr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_196), 16, 16)) -> intp(3, 0, 25)
	.word 0x01000000  ! 805: NOP	nop
	.word 0xb5e5a000  ! 806: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xa9e5a000  ! 807: SAVE_I	save	%r22, 0x0001, %r20
hwintr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_197), 16, 16)) -> intp(3, 0, 12)
	.word 0x01000000  ! 808: NOP	nop
hwintr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_198), 16, 16)) -> intp(3, 0, 27)
	.word 0x01000000  ! 809: NOP	nop
	.word 0xade7e000  ! 810: SAVE_I	save	%r31, 0x0001, %r22
hwintr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_199), 16, 16)) -> intp(3, 0, 1b)
	.word 0x01000000  ! 811: NOP	nop
	.word 0xb1e6e000  ! 812: SAVE_I	save	%r27, 0x0001, %r24
hwintr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_200), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 813: NOP	nop
hwintr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_201), 16, 16)) -> intp(3, 0, 3)
	.word 0x01000000  ! 814: NOP	nop
	.word 0xb9e6a000  ! 815: SAVE_I	save	%r26, 0x0001, %r28
	.word 0xbd500000  ! 816: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x83966000  ! 817: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbde6a000  ! 818: SAVE_I	save	%r26, 0x0001, %r30
	.word 0xa1500000  ! 819: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xbbe5a000  ! 820: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xa3e6a000  ! 821: SAVE_I	save	%r26, 0x0001, %r17
	.word 0xa3e7a000  ! 822: SAVE_I	save	%r30, 0x0001, %r17
	.word 0x87972000  ! 823: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_202), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 824: NOP	nop
	.word 0x85966000  ! 825: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa1e46000  ! 826: SAVE_I	save	%r17, 0x0001, %r16
hwintr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_203), 16, 16)) -> intp(3, 0, 1c)
	.word 0x01000000  ! 827: NOP	nop
	.word 0x81962000  ! 828: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839de000  ! 829: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8395a000  ! 830: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbd50c000  ! 831: RDPR_TT	rdpr	%tt, %r30
	.word 0x839f2000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa7e7e000  ! 833: SAVE_I	save	%r31, 0x0001, %r19
hwintr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_204), 16, 16)) -> intp(3, 0, 2b)
	.word 0x01000000  ! 834: NOP	nop
	.word 0xb9e4e000  ! 835: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xaf50c000  ! 836: RDPR_TT	rdpr	%tt, %r23
	.word 0x839ee000  ! 837: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
hwintr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_205), 16, 16)) -> intp(3, 0, 2a)
	.word 0x01000000  ! 838: NOP	nop
	.word 0xa1e6a000  ! 839: SAVE_I	save	%r26, 0x0001, %r16
hwintr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_206), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 840: NOP	nop
	.word 0xb7508000  ! 841: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb3504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xade6e000  ! 843: SAVE_I	save	%r27, 0x0001, %r22
	.word 0xb9500000  ! 844: RDPR_TPC	<illegal instruction>
hwintr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_207), 16, 16)) -> intp(3, 0, 30)
	.word 0x01000000  ! 845: NOP	nop
	.word 0xabe7a000  ! 846: SAVE_I	save	%r30, 0x0001, %r21
	.word 0xb7504000  ! 847: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x81952000  ! 849: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
hwintr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_208), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 850: NOP	nop
	.word 0xb150c000  ! 851: RDPR_TT	rdpr	%tt, %r24
	.word 0xb7504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xafe46000  ! 853: SAVE_I	save	%r17, 0x0001, %r23
	.word 0xa750c000  ! 854: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 855: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839f2000  ! 856: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb7e76000  ! 857: SAVE_I	save	%r29, 0x0001, %r27
	.word 0x8195e000  ! 858: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb9500000  ! 859: RDPR_TPC	rdpr	%tpc, %r28
hwintr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_209), 16, 16)) -> intp(3, 0, 1e)
	.word 0x01000000  ! 860: NOP	nop
	.word 0xabe7a000  ! 861: SAVE_I	save	%r30, 0x0001, %r21
	.word 0x83956000  ! 862: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
hwintr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_210), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 863: NOP	nop
hwintr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_211), 16, 16)) -> intp(3, 0, 38)
	.word 0x01000000  ! 864: NOP	nop
	.word 0xa3504000  ! 865: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa7e4e000  ! 866: SAVE_I	save	%r19, 0x0001, %r19
	.word 0x839de000  ! 867: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbfe72000  ! 868: SAVE_I	save	%r28, 0x0001, %r31
	.word 0x839d2000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
hwintr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_212), 16, 16)) -> intp(3, 0, 3)
	.word 0x01000000  ! 870: NOP	nop
	.word 0xade5a000  ! 871: SAVE_I	save	%r22, 0x0001, %r22
	.word 0xa1508000  ! 872: RDPR_TSTATE	rdpr	%tstate, %r16
hwintr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_213), 16, 16)) -> intp(3, 0, 2a)
	.word 0x01000000  ! 873: NOP	nop
	.word 0xb9504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 875: RDPR_TPC	<illegal instruction>
	.word 0x8197a000  ! 876: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb1508000  ! 877: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb7504000  ! 878: RDPR_TNPC	<illegal instruction>
hwintr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_214), 16, 16)) -> intp(3, 0, 33)
	.word 0x01000000  ! 879: NOP	nop
	.word 0xa1508000  ! 880: RDPR_TSTATE	<illegal instruction>
hwintr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_215), 16, 16)) -> intp(3, 0, 13)
	.word 0x01000000  ! 881: NOP	nop
hwintr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_216), 16, 16)) -> intp(3, 0, 1d)
	.word 0x01000000  ! 882: NOP	nop
	.word 0xa1e62000  ! 883: SAVE_I	save	%r24, 0x0001, %r16
	.word 0xb3500000  ! 884: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb9484000  ! 885: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x81956000  ! 886: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa1e4e000  ! 887: SAVE_I	save	%r19, 0x0001, %r16
hwintr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_217), 16, 16)) -> intp(3, 0, 23)
	.word 0x01000000  ! 888: NOP	nop
	.word 0xb7500000  ! 889: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xb7e62000  ! 890: SAVE_I	save	%r24, 0x0001, %r27
	.word 0xabe6e000  ! 891: SAVE_I	save	%r27, 0x0001, %r21
	.word 0xb5508000  ! 892: RDPR_TSTATE	<illegal instruction>
	.word 0xa7e4e000  ! 893: SAVE_I	save	%r19, 0x0001, %r19
hwintr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_218), 16, 16)) -> intp(3, 0, 3f)
	.word 0x01000000  ! 894: NOP	nop
	.word 0xa1e4e000  ! 895: SAVE_I	save	%r19, 0x0001, %r16
	.word 0x8195e000  ! 896: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbb500000  ! 897: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xa9e5e000  ! 898: SAVE_I	save	%r23, 0x0001, %r20
	.word 0xbd484000  ! 899: RDHPR_HTSTATE	rdhpr	%htstate, %r30
hwintr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_219), 16, 16)) -> intp(3, 0, 24)
	.word 0x01000000  ! 900: NOP	nop
	.word 0xb7484000  ! 901: RDHPR_HTSTATE	rdhpr	%htstate, %r27
hwintr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_220), 16, 16)) -> intp(3, 0, 16)
	.word 0x01000000  ! 902: NOP	nop
	.word 0xb9e5a000  ! 903: SAVE_I	save	%r22, 0x0001, %r28
hwintr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_221), 16, 16)) -> intp(3, 0, 10)
	.word 0x01000000  ! 904: NOP	nop
	.word 0x83946000  ! 905: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x83956000  ! 906: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x87976000  ! 907: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_222), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 908: NOP	nop
	.word 0xabe66000  ! 909: SAVE_I	save	%r25, 0x0001, %r21
	.word 0x87956000  ! 910: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x839da000  ! 911: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x839ee000  ! 912: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa3508000  ! 913: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8795e000  ! 914: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xad50c000  ! 915: RDPR_TT	rdpr	%tt, %r22
	.word 0xbfe66000  ! 916: SAVE_I	save	%r25, 0x0001, %r31
	.word 0xad500000  ! 917: RDPR_TPC	<illegal instruction>
hwintr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_223), 16, 16)) -> intp(3, 0, 35)
	.word 0x01000000  ! 918: NOP	nop
	.word 0xafe56000  ! 919: SAVE_I	save	%r21, 0x0001, %r23
	.word 0xb5504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 921: RDPR_TPC	<illegal instruction>
hwintr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_224), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 922: NOP	nop
	.word 0x8597a000  ! 923: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa7e46000  ! 924: SAVE_I	save	%r17, 0x0001, %r19
	.word 0x8397e000  ! 925: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xbb484000  ! 926: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xb3e72000  ! 927: SAVE_I	save	%r28, 0x0001, %r25
hwintr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_225), 16, 16)) -> intp(3, 0, 1b)
	.word 0x01000000  ! 928: NOP	nop
hwintr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_226), 16, 16)) -> intp(3, 0, 3c)
	.word 0x01000000  ! 929: NOP	nop
	.word 0x87976000  ! 930: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x87952000  ! 931: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb550c000  ! 932: RDPR_TT	rdpr	%tt, %r26
	.word 0xa1484000  ! 933: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xbde66000  ! 934: SAVE_I	save	%r25, 0x0001, %r30
hwintr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_227), 16, 16)) -> intp(3, 0, 3b)
	.word 0x01000000  ! 935: NOP	nop
	.word 0x839e6000  ! 936: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
hwintr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_228), 16, 16)) -> intp(3, 0, 33)
	.word 0x01000000  ! 937: NOP	nop
	.word 0x8194a000  ! 938: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa5484000  ! 939: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xb3484000  ! 940: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xbf504000  ! 941: RDPR_TNPC	<illegal instruction>
hwintr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_229), 16, 16)) -> intp(3, 0, 11)
	.word 0x01000000  ! 942: NOP	nop
	.word 0x839e2000  ! 943: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x81972000  ! 944: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_230), 16, 16)) -> intp(3, 0, 28)
	.word 0x01000000  ! 945: NOP	nop
hwintr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_231), 16, 16)) -> intp(3, 0, 19)
	.word 0x01000000  ! 946: NOP	nop
	.word 0xabe6a000  ! 947: SAVE_I	save	%r26, 0x0001, %r21
	.word 0xade6a000  ! 948: SAVE_I	save	%r26, 0x0001, %r22
	.word 0x83976000  ! 949: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xabe5a000  ! 950: SAVE_I	save	%r22, 0x0001, %r21
	.word 0x8796a000  ! 951: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa9e7a000  ! 952: SAVE_I	save	%r30, 0x0001, %r20
	.word 0xb5e72000  ! 953: SAVE_I	save	%r28, 0x0001, %r26
hwintr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_232), 16, 16)) -> intp(3, 0, b)
	.word 0x01000000  ! 954: NOP	nop
	.word 0x85966000  ! 955: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
hwintr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_233), 16, 16)) -> intp(3, 0, 31)
	.word 0x01000000  ! 956: NOP	nop
	.word 0xbf500000  ! 957: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xa1e46000  ! 958: SAVE_I	save	%r17, 0x0001, %r16
	.word 0x8394a000  ! 959: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa9484000  ! 960: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x839c6000  ! 961: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbde5a000  ! 962: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8395a000  ! 963: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb1504000  ! 964: RDPR_TNPC	rdpr	%tnpc, %r24
hwintr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_234), 16, 16)) -> intp(3, 0, 2e)
	.word 0x01000000  ! 965: NOP	nop
	.word 0xa5e42000  ! 966: SAVE_I	save	%r16, 0x0001, %r18
	.word 0x8197a000  ! 967: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xaf504000  ! 968: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xb1504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xbfe56000  ! 970: SAVE_I	save	%r21, 0x0001, %r31
hwintr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_235), 16, 16)) -> intp(3, 0, 33)
	.word 0x01000000  ! 971: NOP	nop
hwintr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_236), 16, 16)) -> intp(3, 0, 0)
	.word 0x01000000  ! 972: NOP	nop
hwintr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_237), 16, 16)) -> intp(3, 0, 3)
	.word 0x01000000  ! 973: NOP	nop
	.word 0x81962000  ! 974: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x81972000  ! 975: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa7e7e000  ! 976: SAVE_I	save	%r31, 0x0001, %r19
	.word 0x839c2000  ! 977: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
hwintr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_238), 16, 16)) -> intp(3, 0, 4)
	.word 0x01000000  ! 978: NOP	nop
	.word 0x81952000  ! 979: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xaf484000  ! 980: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa1e6e000  ! 981: SAVE_I	save	%r27, 0x0001, %r16
	.word 0xb1e5a000  ! 982: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x83972000  ! 983: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xafe46000  ! 984: SAVE_I	save	%r17, 0x0001, %r23
	.word 0xa1500000  ! 985: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8797a000  ! 986: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_239), 16, 16)) -> intp(3, 0, 3d)
	.word 0x01000000  ! 987: NOP	nop
	.word 0xbfe56000  ! 988: SAVE_I	save	%r21, 0x0001, %r31
hwintr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_240), 16, 16)) -> intp(3, 0, 1)
	.word 0x01000000  ! 989: NOP	nop
	.word 0xb5484000  ! 990: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xa5e7e000  ! 991: SAVE_I	save	%r31, 0x0001, %r18
	.word 0x8196a000  ! 992: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87956000  ! 993: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa5508000  ! 994: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xab508000  ! 995: RDPR_TSTATE	<illegal instruction>
hwintr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_241), 16, 16)) -> intp(3, 0, 3f)
	.word 0x01000000  ! 996: NOP	nop
	.word 0xb5504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x85942000  ! 998: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
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
	.word 0xa3e72000  ! 2: SAVE_I	save	%r28, 0x0001, %r17
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 3: NOP	nop
	.word 0xa7e76000  ! 4: SAVE_I	save	%r29, 0x0001, %r19
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 3e)
	.word 0x01000000  ! 5: NOP	nop
	.word 0x839ee000  ! 6: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1f)
	.word 0x01000000  ! 7: NOP	nop
	.word 0x83962000  ! 8: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x87946000  ! 9: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb3e72000  ! 10: SAVE_I	save	%r28, 0x0001, %r25
	.word 0xb1484000  ! 11: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0x87952000  ! 12: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb9500000  ! 13: RDPR_TPC	<illegal instruction>
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 18)
	.word 0x01000000  ! 14: NOP	nop
	.word 0x87962000  ! 15: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87976000  ! 16: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x839fe000  ! 17: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa9508000  ! 18: RDPR_TSTATE	<illegal instruction>
	.word 0xafe4a000  ! 19: SAVE_I	save	%r18, 0x0001, %r23
	.word 0xb750c000  ! 20: RDPR_TT	<illegal instruction>
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 13)
	.word 0x01000000  ! 21: NOP	nop
	.word 0xb9e66000  ! 22: SAVE_I	save	%r25, 0x0001, %r28
	.word 0x81966000  ! 23: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa5500000  ! 24: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xa3e56000  ! 26: SAVE_I	save	%r21, 0x0001, %r17
	.word 0x81962000  ! 27: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2a)
	.word 0x01000000  ! 28: NOP	nop
	.word 0xa7484000  ! 29: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xabe5a000  ! 30: SAVE_I	save	%r22, 0x0001, %r21
	.word 0x839d6000  ! 31: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 32: NOP	nop
	.word 0xb750c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 34: RDPR_TPC	<illegal instruction>
	.word 0xabe6a000  ! 35: SAVE_I	save	%r26, 0x0001, %r21
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 36: NOP	nop
	.word 0xb3508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 38: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 1a)
	.word 0x01000000  ! 39: NOP	nop
	.word 0xabe52000  ! 40: SAVE_I	save	%r20, 0x0001, %r21
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, d)
	.word 0x01000000  ! 41: NOP	nop
	.word 0x87946000  ! 42: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8395a000  ! 43: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x839e6000  ! 44: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8396a000  ! 45: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 46: NOP	nop
	.word 0xbb500000  ! 47: RDPR_TPC	<illegal instruction>
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 30)
	.word 0x01000000  ! 48: NOP	nop
	.word 0x839d6000  ! 49: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb9484000  ! 50: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xa3e6e000  ! 51: SAVE_I	save	%r27, 0x0001, %r17
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 33)
	.word 0x01000000  ! 52: NOP	nop
	.word 0xb5e5e000  ! 53: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xade56000  ! 54: SAVE_I	save	%r21, 0x0001, %r22
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 27)
	.word 0x01000000  ! 55: NOP	nop
	.word 0xa5484000  ! 56: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa5504000  ! 57: RDPR_TNPC	<illegal instruction>
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 14)
	.word 0x01000000  ! 58: NOP	nop
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 59: NOP	nop
	.word 0x8594e000  ! 60: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa150c000  ! 61: RDPR_TT	rdpr	%tt, %r16
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 2a)
	.word 0x01000000  ! 62: NOP	nop
	.word 0x8595a000  ! 63: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8796e000  ! 64: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb750c000  ! 65: RDPR_TT	<illegal instruction>
	.word 0xb7e4a000  ! 66: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xa1504000  ! 67: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 68: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa5e46000  ! 69: SAVE_I	save	%r17, 0x0001, %r18
	.word 0x87972000  ! 70: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8594e000  ! 71: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 72: NOP	nop
	.word 0x85972000  ! 73: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa5e42000  ! 74: SAVE_I	save	%r16, 0x0001, %r18
	.word 0xabe66000  ! 75: SAVE_I	save	%r25, 0x0001, %r21
	.word 0x8197a000  ! 76: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xafe5e000  ! 77: SAVE_I	save	%r23, 0x0001, %r23
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 39)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x8396e000  ! 79: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x83976000  ! 80: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xade52000  ! 81: SAVE_I	save	%r20, 0x0001, %r22
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 14)
	.word 0x01000000  ! 82: NOP	nop
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 16)
	.word 0x01000000  ! 83: NOP	nop
	.word 0xa1e66000  ! 84: SAVE_I	save	%r25, 0x0001, %r16
	.word 0x8195a000  ! 85: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa9e5a000  ! 86: SAVE_I	save	%r22, 0x0001, %r20
	.word 0xa5508000  ! 87: RDPR_TSTATE	<illegal instruction>
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 15)
	.word 0x01000000  ! 88: NOP	nop
	.word 0xad508000  ! 89: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 90: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 91: RDPR_TPC	<illegal instruction>
	.word 0xb5e7a000  ! 92: SAVE_I	save	%r30, 0x0001, %r26
	.word 0xb1508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0x8197a000  ! 94: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 25)
	.word 0x01000000  ! 95: NOP	nop
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 19)
	.word 0x01000000  ! 96: NOP	nop
	.word 0x8194e000  ! 97: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa9500000  ! 98: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x87956000  ! 99: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb1504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xbde7a000  ! 102: SAVE_I	save	%r30, 0x0001, %r30
	.word 0x81976000  ! 103: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa1484000  ! 104: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x83966000  ! 105: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa9508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 19)
	.word 0x01000000  ! 107: NOP	nop
	.word 0xb7e66000  ! 108: SAVE_I	save	%r25, 0x0001, %r27
	.word 0xa9e52000  ! 109: SAVE_I	save	%r20, 0x0001, %r20
	.word 0xb950c000  ! 110: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 111: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 34)
	.word 0x01000000  ! 112: NOP	nop
	.word 0xb5e42000  ! 113: SAVE_I	save	%r16, 0x0001, %r26
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 37)
	.word 0x01000000  ! 114: NOP	nop
	.word 0xb5e46000  ! 115: SAVE_I	save	%r17, 0x0001, %r26
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 36)
	.word 0x01000000  ! 116: NOP	nop
	.word 0x87976000  ! 117: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x85952000  ! 118: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8797e000  ! 119: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x81972000  ! 120: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 26)
	.word 0x01000000  ! 121: NOP	nop
	.word 0xa1e42000  ! 122: SAVE_I	save	%r16, 0x0001, %r16
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 31)
	.word 0x01000000  ! 123: NOP	nop
	.word 0xa1504000  ! 124: RDPR_TNPC	<illegal instruction>
	.word 0x839f2000  ! 125: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb7e5e000  ! 126: SAVE_I	save	%r23, 0x0001, %r27
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 28)
	.word 0x01000000  ! 127: NOP	nop
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 33)
	.word 0x01000000  ! 128: NOP	nop
	.word 0xbb500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0xb9e52000  ! 130: SAVE_I	save	%r20, 0x0001, %r28
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, f)
	.word 0x01000000  ! 131: NOP	nop
	.word 0x839ce000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8794a000  ! 133: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x87946000  ! 134: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xafe6e000  ! 135: SAVE_I	save	%r27, 0x0001, %r23
	.word 0xa3484000  ! 136: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x81976000  ! 137: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, a)
	.word 0x01000000  ! 138: NOP	nop
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 139: NOP	nop
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, a)
	.word 0x01000000  ! 140: NOP	nop
	.word 0xa1500000  ! 141: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xbb484000  ! 142: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xaf504000  ! 143: RDPR_TNPC	<illegal instruction>
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 19)
	.word 0x01000000  ! 144: NOP	nop
	.word 0xb5500000  ! 145: RDPR_TPC	<illegal instruction>
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 3a)
	.word 0x01000000  ! 146: NOP	nop
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 32)
	.word 0x01000000  ! 147: NOP	nop
	.word 0xa1e7a000  ! 148: SAVE_I	save	%r30, 0x0001, %r16
	.word 0xbf504000  ! 149: RDPR_TNPC	<illegal instruction>
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 3f)
	.word 0x01000000  ! 150: NOP	nop
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 151: NOP	nop
	.word 0xa7484000  ! 152: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, c)
	.word 0x01000000  ! 153: NOP	nop
	.word 0xabe6e000  ! 154: SAVE_I	save	%r27, 0x0001, %r21
	.word 0xa5e4e000  ! 155: SAVE_I	save	%r19, 0x0001, %r18
	.word 0xb1e6a000  ! 156: SAVE_I	save	%r26, 0x0001, %r24
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 1e)
	.word 0x01000000  ! 157: NOP	nop
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 158: NOP	nop
	.word 0xb150c000  ! 159: RDPR_TT	<illegal instruction>
	.word 0xbbe6e000  ! 160: SAVE_I	save	%r27, 0x0001, %r29
	.word 0xa1484000  ! 161: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xbfe4a000  ! 162: SAVE_I	save	%r18, 0x0001, %r31
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 163: NOP	nop
	.word 0x839fa000  ! 164: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 165: NOP	nop
	.word 0xa1e76000  ! 166: SAVE_I	save	%r29, 0x0001, %r16
	.word 0xbbe72000  ! 167: SAVE_I	save	%r28, 0x0001, %r29
	.word 0xab500000  ! 168: RDPR_TPC	<illegal instruction>
	.word 0x8794a000  ! 169: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8195a000  ! 170: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb5508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xafe4a000  ! 172: SAVE_I	save	%r18, 0x0001, %r23
	.word 0x8195a000  ! 173: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb7500000  ! 174: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x839d6000  ! 175: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 12)
	.word 0x01000000  ! 176: NOP	nop
	.word 0xb7484000  ! 177: RDHPR_HTSTATE	rdhpr	%htstate, %r27
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 12)
	.word 0x01000000  ! 178: NOP	nop
	.word 0xb9508000  ! 179: RDPR_TSTATE	rdpr	%tstate, %r28
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 1f)
	.word 0x01000000  ! 180: NOP	nop
	.word 0x87942000  ! 181: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xabe5a000  ! 182: SAVE_I	save	%r22, 0x0001, %r21
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 183: NOP	nop
	.word 0xb5e42000  ! 184: SAVE_I	save	%r16, 0x0001, %r26
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 185: NOP	nop
	.word 0xbb508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5e000  ! 187: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8797a000  ! 188: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8395a000  ! 189: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 3b)
	.word 0x01000000  ! 190: NOP	nop
hwintr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_52), 16, 16)) -> intp(2, 0, 2b)
	.word 0x01000000  ! 191: NOP	nop
	.word 0xa7e6a000  ! 192: SAVE_I	save	%r26, 0x0001, %r19
hwintr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_53), 16, 16)) -> intp(2, 0, 8)
	.word 0x01000000  ! 193: NOP	nop
hwintr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_54), 16, 16)) -> intp(2, 0, 2e)
	.word 0x01000000  ! 194: NOP	nop
hwintr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_55), 16, 16)) -> intp(2, 0, 19)
	.word 0x01000000  ! 195: NOP	nop
hwintr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_56), 16, 16)) -> intp(2, 0, 1)
	.word 0x01000000  ! 196: NOP	nop
hwintr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_57), 16, 16)) -> intp(2, 0, 3)
	.word 0x01000000  ! 197: NOP	nop
hwintr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_58), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 198: NOP	nop
hwintr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_59), 16, 16)) -> intp(2, 0, 16)
	.word 0x01000000  ! 199: NOP	nop
	.word 0xb1e42000  ! 200: SAVE_I	save	%r16, 0x0001, %r24
hwintr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_60), 16, 16)) -> intp(2, 0, 12)
	.word 0x01000000  ! 201: NOP	nop
hwintr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_61), 16, 16)) -> intp(2, 0, 2b)
	.word 0x01000000  ! 202: NOP	nop
hwintr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_62), 16, 16)) -> intp(2, 0, f)
	.word 0x01000000  ! 203: NOP	nop
	.word 0xa3484000  ! 204: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa9504000  ! 205: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 206: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 207: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 208: RDPR_TNPC	<illegal instruction>
	.word 0xa9500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 210: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa5484000  ! 211: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xbde76000  ! 212: SAVE_I	save	%r29, 0x0001, %r30
hwintr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_63), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 213: NOP	nop
	.word 0xb5e4e000  ! 214: SAVE_I	save	%r19, 0x0001, %r26
hwintr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_64), 16, 16)) -> intp(2, 0, 2b)
	.word 0x01000000  ! 215: NOP	nop
	.word 0x8796a000  ! 216: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8794a000  ! 217: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_65), 16, 16)) -> intp(2, 0, 1f)
	.word 0x01000000  ! 218: NOP	nop
	.word 0xa5504000  ! 219: RDPR_TNPC	<illegal instruction>
hwintr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_66), 16, 16)) -> intp(2, 0, 3f)
	.word 0x01000000  ! 220: NOP	nop
	.word 0xa750c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x87946000  ! 222: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb3e7e000  ! 223: SAVE_I	save	%r31, 0x0001, %r25
	.word 0x8396a000  ! 224: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbde76000  ! 225: SAVE_I	save	%r29, 0x0001, %r30
hwintr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_67), 16, 16)) -> intp(2, 0, 3a)
	.word 0x01000000  ! 226: NOP	nop
	.word 0xb550c000  ! 227: RDPR_TT	<illegal instruction>
	.word 0xade6a000  ! 228: SAVE_I	save	%r26, 0x0001, %r22
	.word 0x87972000  ! 229: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xab484000  ! 230: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa5e7e000  ! 231: SAVE_I	save	%r31, 0x0001, %r18
	.word 0xbd484000  ! 232: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xb1508000  ! 233: RDPR_TSTATE	<illegal instruction>
hwintr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_68), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 234: NOP	nop
	.word 0xbd504000  ! 235: RDPR_TNPC	<illegal instruction>
	.word 0xaf484000  ! 236: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xab50c000  ! 237: RDPR_TT	<illegal instruction>
hwintr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_69), 16, 16)) -> intp(2, 0, e)
	.word 0x01000000  ! 238: NOP	nop
hwintr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_70), 16, 16)) -> intp(2, 0, 29)
	.word 0x01000000  ! 239: NOP	nop
	.word 0xbde4a000  ! 240: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x8797a000  ! 241: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb7e66000  ! 242: SAVE_I	save	%r25, 0x0001, %r27
hwintr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_71), 16, 16)) -> intp(2, 0, d)
	.word 0x01000000  ! 243: NOP	nop
	.word 0x839f2000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8597a000  ! 245: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xade62000  ! 246: SAVE_I	save	%r24, 0x0001, %r22
	.word 0xa7500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 248: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8394a000  ! 249: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8794e000  ! 250: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa7e46000  ! 251: SAVE_I	save	%r17, 0x0001, %r19
	.word 0xa5e5a000  ! 252: SAVE_I	save	%r22, 0x0001, %r18
	.word 0xb1e4e000  ! 253: SAVE_I	save	%r19, 0x0001, %r24
hwintr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_72), 16, 16)) -> intp(2, 0, 31)
	.word 0x01000000  ! 254: NOP	nop
hwintr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_73), 16, 16)) -> intp(2, 0, b)
	.word 0x01000000  ! 255: NOP	nop
hwintr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_74), 16, 16)) -> intp(2, 0, 10)
	.word 0x01000000  ! 256: NOP	nop
	.word 0x8394e000  ! 257: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa9508000  ! 258: RDPR_TSTATE	<illegal instruction>
	.word 0xaf508000  ! 259: RDPR_TSTATE	<illegal instruction>
	.word 0xbf484000  ! 260: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xaf508000  ! 261: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e46000  ! 262: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8594a000  ! 263: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x83956000  ! 264: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x83942000  ! 265: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83952000  ! 266: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
hwintr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_75), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 267: NOP	nop
hwintr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_76), 16, 16)) -> intp(2, 0, 36)
	.word 0x01000000  ! 268: NOP	nop
	.word 0xb5e56000  ! 269: SAVE_I	save	%r21, 0x0001, %r26
hwintr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_77), 16, 16)) -> intp(2, 0, 3a)
	.word 0x01000000  ! 270: NOP	nop
hwintr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_78), 16, 16)) -> intp(2, 0, 9)
	.word 0x01000000  ! 271: NOP	nop
	.word 0x85942000  ! 272: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb5484000  ! 273: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xb9e5a000  ! 274: SAVE_I	save	%r22, 0x0001, %r28
hwintr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_79), 16, 16)) -> intp(2, 0, 10)
	.word 0x01000000  ! 275: NOP	nop
	.word 0x8396e000  ! 276: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x85966000  ! 277: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa7e4a000  ! 278: SAVE_I	save	%r18, 0x0001, %r19
	.word 0xad500000  ! 279: RDPR_TPC	<illegal instruction>
hwintr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_80), 16, 16)) -> intp(2, 0, 13)
	.word 0x01000000  ! 280: NOP	nop
	.word 0x8394e000  ! 281: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xade66000  ! 282: SAVE_I	save	%r25, 0x0001, %r22
	.word 0x83972000  ! 283: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb1504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0xa1508000  ! 285: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 286: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd484000  ! 287: RDHPR_HTSTATE	rdhpr	%htstate, %r30
hwintr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_81), 16, 16)) -> intp(2, 0, 38)
	.word 0x01000000  ! 288: NOP	nop
	.word 0xb1e6e000  ! 289: SAVE_I	save	%r27, 0x0001, %r24
	.word 0xa7e7e000  ! 290: SAVE_I	save	%r31, 0x0001, %r19
hwintr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_82), 16, 16)) -> intp(2, 0, 3f)
	.word 0x01000000  ! 291: NOP	nop
hwintr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_83), 16, 16)) -> intp(2, 0, 36)
	.word 0x01000000  ! 292: NOP	nop
hwintr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_84), 16, 16)) -> intp(2, 0, 1b)
	.word 0x01000000  ! 293: NOP	nop
	.word 0xad484000  ! 294: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xade66000  ! 295: SAVE_I	save	%r25, 0x0001, %r22
hwintr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_85), 16, 16)) -> intp(2, 0, 31)
	.word 0x01000000  ! 296: NOP	nop
	.word 0x839d2000  ! 297: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xade5a000  ! 298: SAVE_I	save	%r22, 0x0001, %r22
hwintr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_86), 16, 16)) -> intp(2, 0, 28)
	.word 0x01000000  ! 299: NOP	nop
hwintr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_87), 16, 16)) -> intp(2, 0, 6)
	.word 0x01000000  ! 300: NOP	nop
hwintr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_88), 16, 16)) -> intp(2, 0, 6)
	.word 0x01000000  ! 301: NOP	nop
	.word 0xa1e5a000  ! 302: SAVE_I	save	%r22, 0x0001, %r16
	.word 0xbbe7a000  ! 303: SAVE_I	save	%r30, 0x0001, %r29
hwintr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_89), 16, 16)) -> intp(2, 0, 2c)
	.word 0x01000000  ! 304: NOP	nop
	.word 0xb1484000  ! 305: RDHPR_HTSTATE	rdhpr	%htstate, %r24
hwintr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_90), 16, 16)) -> intp(2, 0, f)
	.word 0x01000000  ! 306: NOP	nop
	.word 0x839e6000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xab508000  ! 308: RDPR_TSTATE	<illegal instruction>
hwintr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_91), 16, 16)) -> intp(2, 0, 36)
	.word 0x01000000  ! 309: NOP	nop
	.word 0xbb508000  ! 310: RDPR_TSTATE	<illegal instruction>
	.word 0x839f6000  ! 311: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa9504000  ! 312: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 313: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_92), 16, 16)) -> intp(2, 0, 32)
	.word 0x01000000  ! 314: NOP	nop
hwintr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_93), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 315: NOP	nop
hwintr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_94), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 316: NOP	nop
	.word 0xb7484000  ! 317: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xb3e72000  ! 318: SAVE_I	save	%r28, 0x0001, %r25
	.word 0xaf484000  ! 319: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_95), 16, 16)) -> intp(2, 0, 0)
	.word 0x01000000  ! 320: NOP	nop
	.word 0xad504000  ! 321: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 322: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
hwintr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_96), 16, 16)) -> intp(2, 0, 31)
	.word 0x01000000  ! 323: NOP	nop
	.word 0xa1e5e000  ! 324: SAVE_I	save	%r23, 0x0001, %r16
hwintr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_97), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 325: NOP	nop
hwintr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_98), 16, 16)) -> intp(2, 0, 32)
	.word 0x01000000  ! 326: NOP	nop
	.word 0xab508000  ! 327: RDPR_TSTATE	rdpr	%tstate, %r21
hwintr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_99), 16, 16)) -> intp(2, 0, 30)
	.word 0x01000000  ! 328: NOP	nop
	.word 0xab484000  ! 329: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xabe62000  ! 330: SAVE_I	save	%r24, 0x0001, %r21
	.word 0xa150c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xbfe4a000  ! 332: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xafe62000  ! 333: SAVE_I	save	%r24, 0x0001, %r23
	.word 0xb5484000  ! 334: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0x87962000  ! 335: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87946000  ! 336: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_100), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 337: NOP	nop
	.word 0x8794e000  ! 338: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x81972000  ! 339: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xabe42000  ! 340: SAVE_I	save	%r16, 0x0001, %r21
	.word 0x8794a000  ! 341: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_101), 16, 16)) -> intp(2, 0, 0)
	.word 0x01000000  ! 342: NOP	nop
	.word 0xa5e7e000  ! 343: SAVE_I	save	%r31, 0x0001, %r18
	.word 0xa3504000  ! 344: RDPR_TNPC	<illegal instruction>
	.word 0x8595a000  ! 345: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xabe56000  ! 346: SAVE_I	save	%r21, 0x0001, %r21
	.word 0xb1504000  ! 347: RDPR_TNPC	<illegal instruction>
hwintr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_102), 16, 16)) -> intp(2, 0, 1f)
	.word 0x01000000  ! 348: NOP	nop
	.word 0x839de000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb7484000  ! 350: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xa9504000  ! 351: RDPR_TNPC	<illegal instruction>
	.word 0xbde62000  ! 352: SAVE_I	save	%r24, 0x0001, %r30
hwintr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_103), 16, 16)) -> intp(2, 0, 10)
	.word 0x01000000  ! 353: NOP	nop
hwintr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_104), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 354: NOP	nop
hwintr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_105), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 355: NOP	nop
	.word 0x8395e000  ! 356: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839de000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8394a000  ! 358: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb7e7e000  ! 359: SAVE_I	save	%r31, 0x0001, %r27
	.word 0xbfe7a000  ! 360: SAVE_I	save	%r30, 0x0001, %r31
	.word 0x8795e000  ! 361: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa9504000  ! 362: RDPR_TNPC	<illegal instruction>
hwintr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_106), 16, 16)) -> intp(2, 0, 13)
	.word 0x01000000  ! 363: NOP	nop
	.word 0xa9e6e000  ! 364: SAVE_I	save	%r27, 0x0001, %r20
hwintr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_107), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 365: NOP	nop
	.word 0xa7484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa5e62000  ! 367: SAVE_I	save	%r24, 0x0001, %r18
	.word 0xa1500000  ! 368: RDPR_TPC	<illegal instruction>
	.word 0xa9e5e000  ! 369: SAVE_I	save	%r23, 0x0001, %r20
	.word 0xa5e42000  ! 370: SAVE_I	save	%r16, 0x0001, %r18
hwintr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_108), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 371: NOP	nop
	.word 0xa7484000  ! 372: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xb7e6e000  ! 373: SAVE_I	save	%r27, 0x0001, %r27
	.word 0xb9e42000  ! 374: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8794e000  ! 375: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x83942000  ! 376: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb9e52000  ! 377: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xa3e66000  ! 378: SAVE_I	save	%r25, 0x0001, %r17
	.word 0x8597e000  ! 379: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x87956000  ! 380: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb9e56000  ! 381: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xa7504000  ! 382: RDPR_TNPC	<illegal instruction>
	.word 0xa5e56000  ! 383: SAVE_I	save	%r21, 0x0001, %r18
	.word 0xb3508000  ! 384: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 385: RDPR_TT	<illegal instruction>
	.word 0xabe46000  ! 386: SAVE_I	save	%r17, 0x0001, %r21
hwintr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_109), 16, 16)) -> intp(2, 0, 27)
	.word 0x01000000  ! 387: NOP	nop
	.word 0xbd500000  ! 388: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 389: RDPR_TNPC	<illegal instruction>
	.word 0xa7e7e000  ! 390: SAVE_I	save	%r31, 0x0001, %r19
	.word 0xab484000  ! 391: RDHPR_HTSTATE	rdhpr	%htstate, %r21
hwintr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_110), 16, 16)) -> intp(2, 0, 26)
	.word 0x01000000  ! 392: NOP	nop
	.word 0xaf500000  ! 393: RDPR_TPC	<illegal instruction>
hwintr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_111), 16, 16)) -> intp(2, 0, 3b)
	.word 0x01000000  ! 394: NOP	nop
	.word 0x87976000  ! 395: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x839c6000  ! 396: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xab50c000  ! 397: RDPR_TT	<illegal instruction>
	.word 0xab484000  ! 398: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa7e5a000  ! 399: SAVE_I	save	%r22, 0x0001, %r19
	.word 0xaf484000  ! 400: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_112), 16, 16)) -> intp(2, 0, 15)
	.word 0x01000000  ! 401: NOP	nop
hwintr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_113), 16, 16)) -> intp(2, 0, 1f)
	.word 0x01000000  ! 402: NOP	nop
	.word 0xa9e6a000  ! 403: SAVE_I	save	%r26, 0x0001, %r20
hwintr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_114), 16, 16)) -> intp(2, 0, 37)
	.word 0x01000000  ! 404: NOP	nop
	.word 0xa3500000  ! 405: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xb5e5e000  ! 406: SAVE_I	save	%r23, 0x0001, %r26
hwintr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_115), 16, 16)) -> intp(2, 0, 1)
	.word 0x01000000  ! 407: NOP	nop
	.word 0xb150c000  ! 408: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 409: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e46000  ! 410: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xa7e4a000  ! 411: SAVE_I	save	%r18, 0x0001, %r19
	.word 0xb7e4a000  ! 412: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbd504000  ! 413: RDPR_TNPC	<illegal instruction>
hwintr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_116), 16, 16)) -> intp(2, 0, 3f)
	.word 0x01000000  ! 414: NOP	nop
	.word 0x8396e000  ! 415: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb1e46000  ! 416: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xab484000  ! 417: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x81976000  ! 418: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
hwintr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_117), 16, 16)) -> intp(2, 0, 3b)
	.word 0x01000000  ! 419: NOP	nop
hwintr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_118), 16, 16)) -> intp(2, 0, c)
	.word 0x01000000  ! 420: NOP	nop
	.word 0x8194a000  ! 421: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x81972000  ! 422: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x87972000  ! 423: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_119), 16, 16)) -> intp(2, 0, 6)
	.word 0x01000000  ! 424: NOP	nop
	.word 0x87962000  ! 425: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x81962000  ! 426: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
hwintr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_120), 16, 16)) -> intp(2, 0, 3e)
	.word 0x01000000  ! 427: NOP	nop
	.word 0x8594e000  ! 428: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa7e52000  ! 429: SAVE_I	save	%r20, 0x0001, %r19
	.word 0x83966000  ! 430: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb3500000  ! 431: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 432: RDPR_TNPC	<illegal instruction>
	.word 0xb1e66000  ! 433: SAVE_I	save	%r25, 0x0001, %r24
	.word 0x87962000  ! 434: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
hwintr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_121), 16, 16)) -> intp(2, 0, 3)
	.word 0x01000000  ! 435: NOP	nop
hwintr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_122), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 436: NOP	nop
	.word 0x87956000  ! 437: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x87942000  ! 438: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
hwintr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_123), 16, 16)) -> intp(2, 0, 1e)
	.word 0x01000000  ! 439: NOP	nop
	.word 0x87962000  ! 440: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x81966000  ! 441: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb5500000  ! 442: RDPR_TPC	<illegal instruction>
	.word 0x839f6000  ! 443: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
hwintr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_124), 16, 16)) -> intp(2, 0, 35)
	.word 0x01000000  ! 444: NOP	nop
	.word 0xb9e4e000  ! 445: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xa5e72000  ! 446: SAVE_I	save	%r28, 0x0001, %r18
	.word 0xb7e56000  ! 447: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x839d6000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8195a000  ! 449: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb3500000  ! 450: RDPR_TPC	<illegal instruction>
hwintr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_125), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 451: NOP	nop
	.word 0xa9e62000  ! 452: SAVE_I	save	%r24, 0x0001, %r20
	.word 0xab50c000  ! 453: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 455: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbd508000  ! 456: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x81956000  ! 457: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb1484000  ! 458: RDHPR_HTSTATE	rdhpr	%htstate, %r24
hwintr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_126), 16, 16)) -> intp(2, 0, 0)
	.word 0x01000000  ! 459: NOP	nop
	.word 0x81962000  ! 460: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb3484000  ! 461: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0x8794e000  ! 462: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
hwintr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_127), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 463: NOP	nop
	.word 0x839da000  ! 464: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x81962000  ! 465: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8797a000  ! 466: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_128), 16, 16)) -> intp(2, 0, 2f)
	.word 0x01000000  ! 467: NOP	nop
	.word 0xab484000  ! 468: RDHPR_HTSTATE	rdhpr	%htstate, %r21
hwintr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_129), 16, 16)) -> intp(2, 0, 19)
	.word 0x01000000  ! 469: NOP	nop
hwintr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_130), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 470: NOP	nop
hwintr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_131), 16, 16)) -> intp(2, 0, 14)
	.word 0x01000000  ! 471: NOP	nop
	.word 0xa9e72000  ! 472: SAVE_I	save	%r28, 0x0001, %r20
	.word 0xab500000  ! 473: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 474: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
hwintr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_132), 16, 16)) -> intp(2, 0, 21)
	.word 0x01000000  ! 475: NOP	nop
	.word 0x839c2000  ! 476: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb550c000  ! 477: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 478: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb150c000  ! 479: RDPR_TT	<illegal instruction>
	.word 0xab500000  ! 480: RDPR_TPC	<illegal instruction>
	.word 0xbbe42000  ! 481: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xade66000  ! 482: SAVE_I	save	%r25, 0x0001, %r22
	.word 0x839ea000  ! 483: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb3484000  ! 484: RDHPR_HTSTATE	rdhpr	%htstate, %r25
hwintr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_133), 16, 16)) -> intp(2, 0, b)
	.word 0x01000000  ! 485: NOP	nop
	.word 0xb9504000  ! 486: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 487: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbbe7a000  ! 488: SAVE_I	save	%r30, 0x0001, %r29
	.word 0xbb50c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xa7e72000  ! 490: SAVE_I	save	%r28, 0x0001, %r19
	.word 0x87976000  ! 491: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbd508000  ! 492: RDPR_TSTATE	<illegal instruction>
hwintr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_134), 16, 16)) -> intp(2, 0, 11)
	.word 0x01000000  ! 493: NOP	nop
	.word 0xb7500000  ! 494: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x8395a000  ! 495: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8397a000  ! 496: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa9e52000  ! 497: SAVE_I	save	%r20, 0x0001, %r20
	.word 0xa7e52000  ! 498: SAVE_I	save	%r20, 0x0001, %r19
	.word 0xb9484000  ! 499: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0x81972000  ! 500: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb7e56000  ! 501: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xa1e72000  ! 502: SAVE_I	save	%r28, 0x0001, %r16
	.word 0xbf50c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 504: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 505: RDPR_TNPC	<illegal instruction>
	.word 0xad504000  ! 506: RDPR_TNPC	<illegal instruction>
hwintr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_135), 16, 16)) -> intp(2, 0, a)
	.word 0x01000000  ! 507: NOP	nop
	.word 0x8394e000  ! 508: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839f2000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa3e66000  ! 510: SAVE_I	save	%r25, 0x0001, %r17
	.word 0xab50c000  ! 511: RDPR_TT	rdpr	%tt, %r21
	.word 0xbd508000  ! 512: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 513: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xade4e000  ! 514: SAVE_I	save	%r19, 0x0001, %r22
	.word 0xbf508000  ! 515: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 516: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xafe7e000  ! 517: SAVE_I	save	%r31, 0x0001, %r23
	.word 0xafe56000  ! 518: SAVE_I	save	%r21, 0x0001, %r23
	.word 0xb7500000  ! 519: RDPR_TPC	<illegal instruction>
hwintr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_136), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 520: NOP	nop
hwintr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_137), 16, 16)) -> intp(2, 0, 27)
	.word 0x01000000  ! 521: NOP	nop
	.word 0x8594a000  ! 522: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x83962000  ! 523: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
hwintr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_138), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 524: NOP	nop
	.word 0xb5500000  ! 525: RDPR_TPC	<illegal instruction>
hwintr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_139), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 526: NOP	nop
	.word 0x8396e000  ! 527: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8397a000  ! 528: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
hwintr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_140), 16, 16)) -> intp(2, 0, 0)
	.word 0x01000000  ! 529: NOP	nop
	.word 0x839de000  ! 530: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa7504000  ! 531: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 532: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3e76000  ! 533: SAVE_I	save	%r29, 0x0001, %r25
	.word 0xbb484000  ! 534: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xbde42000  ! 535: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xa5e66000  ! 536: SAVE_I	save	%r25, 0x0001, %r18
	.word 0xbd484000  ! 537: RDHPR_HTSTATE	rdhpr	%htstate, %r30
hwintr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_141), 16, 16)) -> intp(2, 0, 24)
	.word 0x01000000  ! 538: NOP	nop
	.word 0x8395e000  ! 539: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb5e72000  ! 540: SAVE_I	save	%r28, 0x0001, %r26
	.word 0x839d6000  ! 541: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xbb504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 543: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xade5a000  ! 544: SAVE_I	save	%r22, 0x0001, %r22
hwintr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_142), 16, 16)) -> intp(2, 0, 1)
	.word 0x01000000  ! 545: NOP	nop
	.word 0xb3e72000  ! 546: SAVE_I	save	%r28, 0x0001, %r25
hwintr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_143), 16, 16)) -> intp(2, 0, 12)
	.word 0x01000000  ! 547: NOP	nop
	.word 0xaf508000  ! 548: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x839ce000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb5500000  ! 550: RDPR_TPC	rdpr	%tpc, %r26
hwintr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_144), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 551: NOP	nop
hwintr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_145), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 552: NOP	nop
	.word 0x83962000  ! 553: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
hwintr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_146), 16, 16)) -> intp(2, 0, 38)
	.word 0x01000000  ! 554: NOP	nop
hwintr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_147), 16, 16)) -> intp(2, 0, 37)
	.word 0x01000000  ! 555: NOP	nop
	.word 0xbf50c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 557: RDPR_TT	<illegal instruction>
	.word 0x83966000  ! 558: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
hwintr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_148), 16, 16)) -> intp(2, 0, 2b)
	.word 0x01000000  ! 559: NOP	nop
hwintr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_149), 16, 16)) -> intp(2, 0, 15)
	.word 0x01000000  ! 560: NOP	nop
	.word 0xade72000  ! 561: SAVE_I	save	%r28, 0x0001, %r22
	.word 0xb7e6a000  ! 562: SAVE_I	save	%r26, 0x0001, %r27
	.word 0xa5500000  ! 563: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 564: RDPR_TPC	<illegal instruction>
	.word 0xa7e66000  ! 565: SAVE_I	save	%r25, 0x0001, %r19
	.word 0xaf484000  ! 566: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xb9508000  ! 567: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 568: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa9e62000  ! 569: SAVE_I	save	%r24, 0x0001, %r20
	.word 0xb3504000  ! 570: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb7508000  ! 572: RDPR_TSTATE	rdpr	%tstate, %r27
hwintr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_150), 16, 16)) -> intp(2, 0, 30)
	.word 0x01000000  ! 573: NOP	nop
	.word 0xa1504000  ! 574: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a000  ! 575: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xa9484000  ! 576: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xb5484000  ! 577: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xab50c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xa1e76000  ! 580: SAVE_I	save	%r29, 0x0001, %r16
	.word 0xad508000  ! 581: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 582: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb5e72000  ! 583: SAVE_I	save	%r28, 0x0001, %r26
	.word 0xb7504000  ! 584: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 585: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8596a000  ! 586: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x839ee000  ! 587: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x81956000  ! 588: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
hwintr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_151), 16, 16)) -> intp(2, 0, 36)
	.word 0x01000000  ! 589: NOP	nop
	.word 0xa1500000  ! 590: RDPR_TPC	<illegal instruction>
	.word 0x85952000  ! 591: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8195a000  ! 592: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb1e42000  ! 593: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e7a000  ! 594: SAVE_I	save	%r30, 0x0001, %r24
	.word 0x8195e000  ! 595: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
hwintr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_152), 16, 16)) -> intp(2, 0, d)
	.word 0x01000000  ! 596: NOP	nop
	.word 0xa7508000  ! 597: RDPR_TSTATE	<illegal instruction>
	.word 0xb9e4e000  ! 598: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1500000  ! 599: RDPR_TPC	<illegal instruction>
hwintr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_153), 16, 16)) -> intp(2, 0, 10)
	.word 0x01000000  ! 600: NOP	nop
	.word 0xb9e6e000  ! 601: SAVE_I	save	%r27, 0x0001, %r28
	.word 0xbd484000  ! 602: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0x8394e000  ! 603: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x83942000  ! 604: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83976000  ! 605: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8796e000  ! 606: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb3e72000  ! 607: SAVE_I	save	%r28, 0x0001, %r25
	.word 0xbfe72000  ! 608: SAVE_I	save	%r28, 0x0001, %r31
	.word 0xa1e52000  ! 609: SAVE_I	save	%r20, 0x0001, %r16
	.word 0x8194a000  ! 610: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
hwintr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_154), 16, 16)) -> intp(2, 0, 33)
	.word 0x01000000  ! 611: NOP	nop
	.word 0x83972000  ! 612: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xad504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0x839de000  ! 614: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839de000  ! 615: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
hwintr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_155), 16, 16)) -> intp(2, 0, 9)
	.word 0x01000000  ! 616: NOP	nop
	.word 0x8594e000  ! 617: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8794a000  ! 618: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_156), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 619: NOP	nop
hwintr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_157), 16, 16)) -> intp(2, 0, 8)
	.word 0x01000000  ! 620: NOP	nop
	.word 0xafe52000  ! 621: SAVE_I	save	%r20, 0x0001, %r23
hwintr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_158), 16, 16)) -> intp(2, 0, 1e)
	.word 0x01000000  ! 622: NOP	nop
	.word 0x81946000  ! 623: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa5508000  ! 624: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 625: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x81946000  ! 626: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbd504000  ! 627: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 628: RDPR_TT	<illegal instruction>
	.word 0x81946000  ! 629: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbbe66000  ! 630: SAVE_I	save	%r25, 0x0001, %r29
	.word 0xa5504000  ! 631: RDPR_TNPC	<illegal instruction>
	.word 0xafe5e000  ! 632: SAVE_I	save	%r23, 0x0001, %r23
	.word 0xa1504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x8194a000  ! 634: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa5508000  ! 635: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x83942000  ! 636: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xbbe7e000  ! 637: SAVE_I	save	%r31, 0x0001, %r29
hwintr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_159), 16, 16)) -> intp(2, 0, 28)
	.word 0x01000000  ! 638: NOP	nop
	.word 0x8794a000  ! 639: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_160), 16, 16)) -> intp(2, 0, 27)
	.word 0x01000000  ! 640: NOP	nop
	.word 0xa5500000  ! 641: RDPR_TPC	<illegal instruction>
	.word 0xb3e46000  ! 642: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 644: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb3e5a000  ! 645: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xaf484000  ! 646: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa1484000  ! 647: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa3508000  ! 648: RDPR_TSTATE	<illegal instruction>
	.word 0x87972000  ! 649: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbfe52000  ! 650: SAVE_I	save	%r20, 0x0001, %r31
hwintr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_161), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 651: NOP	nop
	.word 0xabe6e000  ! 652: SAVE_I	save	%r27, 0x0001, %r21
	.word 0xa5e6e000  ! 653: SAVE_I	save	%r27, 0x0001, %r18
	.word 0x839c6000  ! 654: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa7e4a000  ! 655: SAVE_I	save	%r18, 0x0001, %r19
	.word 0xa7e42000  ! 656: SAVE_I	save	%r16, 0x0001, %r19
	.word 0xb7504000  ! 657: RDPR_TNPC	<illegal instruction>
	.word 0xab484000  ! 658: RDHPR_HTSTATE	rdhpr	%htstate, %r21
hwintr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_162), 16, 16)) -> intp(2, 0, 33)
	.word 0x01000000  ! 659: NOP	nop
hwintr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_163), 16, 16)) -> intp(2, 0, 15)
	.word 0x01000000  ! 660: NOP	nop
	.word 0xa5e7e000  ! 661: SAVE_I	save	%r31, 0x0001, %r18
	.word 0x87952000  ! 662: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbb504000  ! 663: RDPR_TNPC	<illegal instruction>
hwintr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_164), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 664: NOP	nop
hwintr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_165), 16, 16)) -> intp(2, 0, 3e)
	.word 0x01000000  ! 665: NOP	nop
	.word 0xab508000  ! 666: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 667: RDPR_TNPC	<illegal instruction>
hwintr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_166), 16, 16)) -> intp(2, 0, 3e)
	.word 0x01000000  ! 668: NOP	nop
	.word 0x8397a000  ! 669: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
hwintr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_167), 16, 16)) -> intp(2, 0, c)
	.word 0x01000000  ! 670: NOP	nop
	.word 0xbd508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 672: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb1e6e000  ! 673: SAVE_I	save	%r27, 0x0001, %r24
	.word 0x87966000  ! 674: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb7e46000  ! 675: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1484000  ! 676: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xade4e000  ! 677: SAVE_I	save	%r19, 0x0001, %r22
	.word 0xb1e62000  ! 678: SAVE_I	save	%r24, 0x0001, %r24
hwintr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_168), 16, 16)) -> intp(2, 0, e)
	.word 0x01000000  ! 679: NOP	nop
	.word 0xb5500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a000  ! 681: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x839f6000  ! 682: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8594e000  ! 683: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb3504000  ! 684: RDPR_TNPC	<illegal instruction>
	.word 0xb7e7e000  ! 685: SAVE_I	save	%r31, 0x0001, %r27
hwintr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_169), 16, 16)) -> intp(2, 0, 6)
	.word 0x01000000  ! 686: NOP	nop
	.word 0xb3e7a000  ! 687: SAVE_I	save	%r30, 0x0001, %r25
	.word 0x839d2000  ! 688: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa750c000  ! 689: RDPR_TT	<illegal instruction>
	.word 0xa1484000  ! 690: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x8396e000  ! 691: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x839fa000  ! 692: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa9e6a000  ! 693: SAVE_I	save	%r26, 0x0001, %r20
	.word 0xa3e5a000  ! 694: SAVE_I	save	%r22, 0x0001, %r17
	.word 0xa5e4e000  ! 695: SAVE_I	save	%r19, 0x0001, %r18
hwintr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_170), 16, 16)) -> intp(2, 0, 34)
	.word 0x01000000  ! 696: NOP	nop
	.word 0xbbe72000  ! 697: SAVE_I	save	%r28, 0x0001, %r29
hwintr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_171), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 698: NOP	nop
	.word 0xa3e52000  ! 699: SAVE_I	save	%r20, 0x0001, %r17
	.word 0xa750c000  ! 700: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 701: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb1e46000  ! 702: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xa9500000  ! 703: RDPR_TPC	<illegal instruction>
hwintr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_172), 16, 16)) -> intp(2, 0, 14)
	.word 0x01000000  ! 704: NOP	nop
	.word 0xbb500000  ! 705: RDPR_TPC	<illegal instruction>
hwintr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_173), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 706: NOP	nop
	.word 0xb5e4e000  ! 707: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8797e000  ! 708: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb750c000  ! 709: RDPR_TT	rdpr	%tt, %r27
	.word 0xa3e42000  ! 710: SAVE_I	save	%r16, 0x0001, %r17
hwintr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_174), 16, 16)) -> intp(2, 0, 33)
	.word 0x01000000  ! 711: NOP	nop
	.word 0x8396e000  ! 712: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
hwintr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_175), 16, 16)) -> intp(2, 0, 18)
	.word 0x01000000  ! 713: NOP	nop
	.word 0xb3e72000  ! 714: SAVE_I	save	%r28, 0x0001, %r25
hwintr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_176), 16, 16)) -> intp(2, 0, 24)
	.word 0x01000000  ! 715: NOP	nop
	.word 0x8795a000  ! 716: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
hwintr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_177), 16, 16)) -> intp(2, 0, 23)
	.word 0x01000000  ! 717: NOP	nop
	.word 0x87942000  ! 718: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x839da000  ! 719: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa9e6a000  ! 720: SAVE_I	save	%r26, 0x0001, %r20
	.word 0xb7504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xade46000  ! 722: SAVE_I	save	%r17, 0x0001, %r22
	.word 0xbb500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xbf484000  ! 724: RDHPR_HTSTATE	rdhpr	%htstate, %r31
hwintr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_178), 16, 16)) -> intp(2, 0, 37)
	.word 0x01000000  ! 725: NOP	nop
hwintr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_179), 16, 16)) -> intp(2, 0, 27)
	.word 0x01000000  ! 726: NOP	nop
	.word 0xab504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 728: RDPR_TT	<illegal instruction>
	.word 0x8596a000  ! 729: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x81946000  ! 730: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8596a000  ! 731: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xa3e56000  ! 732: SAVE_I	save	%r21, 0x0001, %r17
	.word 0xade46000  ! 733: SAVE_I	save	%r17, 0x0001, %r22
	.word 0x8197a000  ! 734: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x83962000  ! 735: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x83966000  ! 736: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
hwintr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_180), 16, 16)) -> intp(2, 0, 3)
	.word 0x01000000  ! 737: NOP	nop
	.word 0xb1e5e000  ! 738: SAVE_I	save	%r23, 0x0001, %r24
hwintr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_181), 16, 16)) -> intp(2, 0, 35)
	.word 0x01000000  ! 739: NOP	nop
hwintr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_182), 16, 16)) -> intp(2, 0, 19)
	.word 0x01000000  ! 740: NOP	nop
	.word 0x81966000  ! 741: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x839e6000  ! 742: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8796e000  ! 743: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
hwintr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_183), 16, 16)) -> intp(2, 0, 3e)
	.word 0x01000000  ! 744: NOP	nop
	.word 0xaf500000  ! 745: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 746: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x83972000  ! 747: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x83946000  ! 748: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa550c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x839ca000  ! 750: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa7e5e000  ! 751: SAVE_I	save	%r23, 0x0001, %r19
	.word 0xa1e7e000  ! 752: SAVE_I	save	%r31, 0x0001, %r16
	.word 0x8597e000  ! 753: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbb500000  ! 754: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 755: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
hwintr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_184), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 756: NOP	nop
	.word 0xa3508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 758: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
hwintr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_185), 16, 16)) -> intp(2, 0, 13)
	.word 0x01000000  ! 759: NOP	nop
	.word 0x8594e000  ! 760: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa5e5a000  ! 761: SAVE_I	save	%r22, 0x0001, %r18
	.word 0x83966000  ! 762: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbfe5a000  ! 763: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e7e000  ! 764: SAVE_I	save	%r31, 0x0001, %r24
hwintr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_186), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 765: NOP	nop
hwintr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_187), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 766: NOP	nop
	.word 0xa9e66000  ! 767: SAVE_I	save	%r25, 0x0001, %r20
	.word 0xafe62000  ! 768: SAVE_I	save	%r24, 0x0001, %r23
	.word 0xab508000  ! 769: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe56000  ! 770: SAVE_I	save	%r21, 0x0001, %r31
hwintr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_188), 16, 16)) -> intp(2, 0, 29)
	.word 0x01000000  ! 771: NOP	nop
	.word 0x87956000  ! 772: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa550c000  ! 773: RDPR_TT	<illegal instruction>
hwintr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_189), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 774: NOP	nop
	.word 0xa1e42000  ! 775: SAVE_I	save	%r16, 0x0001, %r16
	.word 0xb7e56000  ! 776: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xade6e000  ! 777: SAVE_I	save	%r27, 0x0001, %r22
	.word 0xa3e4e000  ! 778: SAVE_I	save	%r19, 0x0001, %r17
	.word 0x8595a000  ! 779: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x81942000  ! 780: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
hwintr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_190), 16, 16)) -> intp(2, 0, 3e)
	.word 0x01000000  ! 781: NOP	nop
	.word 0x839d6000  ! 782: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa1e56000  ! 783: SAVE_I	save	%r21, 0x0001, %r16
hwintr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_191), 16, 16)) -> intp(2, 0, 18)
	.word 0x01000000  ! 784: NOP	nop
	.word 0x839ca000  ! 785: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb7e7e000  ! 786: SAVE_I	save	%r31, 0x0001, %r27
hwintr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_192), 16, 16)) -> intp(2, 0, 32)
	.word 0x01000000  ! 787: NOP	nop
	.word 0xaf50c000  ! 788: RDPR_TT	<illegal instruction>
	.word 0xa3484000  ! 789: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xad50c000  ! 790: RDPR_TT	<illegal instruction>
	.word 0xa9e76000  ! 791: SAVE_I	save	%r29, 0x0001, %r20
	.word 0xb7e5e000  ! 792: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x8396a000  ! 793: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xaf508000  ! 794: RDPR_TSTATE	<illegal instruction>
hwintr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_193), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 795: NOP	nop
	.word 0xad500000  ! 796: RDPR_TPC	<illegal instruction>
hwintr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_194), 16, 16)) -> intp(2, 0, 18)
	.word 0x01000000  ! 797: NOP	nop
	.word 0x83972000  ! 798: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbde56000  ! 799: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xa7504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0xafe7a000  ! 802: SAVE_I	save	%r30, 0x0001, %r23
hwintr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_195), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 803: NOP	nop
	.word 0x839de000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
hwintr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_196), 16, 16)) -> intp(2, 0, 4)
	.word 0x01000000  ! 805: NOP	nop
	.word 0xb5e76000  ! 806: SAVE_I	save	%r29, 0x0001, %r26
	.word 0xa7e66000  ! 807: SAVE_I	save	%r25, 0x0001, %r19
hwintr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_197), 16, 16)) -> intp(2, 0, 21)
	.word 0x01000000  ! 808: NOP	nop
hwintr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_198), 16, 16)) -> intp(2, 0, e)
	.word 0x01000000  ! 809: NOP	nop
	.word 0xa5e4e000  ! 810: SAVE_I	save	%r19, 0x0001, %r18
hwintr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_199), 16, 16)) -> intp(2, 0, 30)
	.word 0x01000000  ! 811: NOP	nop
	.word 0xbde62000  ! 812: SAVE_I	save	%r24, 0x0001, %r30
hwintr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_200), 16, 16)) -> intp(2, 0, 2d)
	.word 0x01000000  ! 813: NOP	nop
hwintr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_201), 16, 16)) -> intp(2, 0, 22)
	.word 0x01000000  ! 814: NOP	nop
	.word 0xb7e6a000  ! 815: SAVE_I	save	%r26, 0x0001, %r27
	.word 0xb5500000  ! 816: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 817: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbde46000  ! 818: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5500000  ! 819: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xafe52000  ! 820: SAVE_I	save	%r20, 0x0001, %r23
	.word 0xb1e52000  ! 821: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe76000  ! 822: SAVE_I	save	%r29, 0x0001, %r29
	.word 0x87946000  ! 823: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_202), 16, 16)) -> intp(2, 0, 2e)
	.word 0x01000000  ! 824: NOP	nop
	.word 0x8596a000  ! 825: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbbe66000  ! 826: SAVE_I	save	%r25, 0x0001, %r29
hwintr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_203), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 827: NOP	nop
	.word 0x81972000  ! 828: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x839e6000  ! 829: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8395a000  ! 830: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb550c000  ! 831: RDPR_TT	<illegal instruction>
	.word 0x839de000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa9e7e000  ! 833: SAVE_I	save	%r31, 0x0001, %r20
hwintr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_204), 16, 16)) -> intp(2, 0, 11)
	.word 0x01000000  ! 834: NOP	nop
	.word 0xb9e5e000  ! 835: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbb50c000  ! 836: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 837: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
hwintr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_205), 16, 16)) -> intp(2, 0, 2b)
	.word 0x01000000  ! 838: NOP	nop
	.word 0xade4a000  ! 839: SAVE_I	save	%r18, 0x0001, %r22
hwintr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_206), 16, 16)) -> intp(2, 0, c)
	.word 0x01000000  ! 840: NOP	nop
	.word 0xa5508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xbfe5e000  ! 843: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xaf500000  ! 844: RDPR_TPC	<illegal instruction>
hwintr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_207), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 845: NOP	nop
	.word 0xb9e72000  ! 846: SAVE_I	save	%r28, 0x0001, %r28
	.word 0xa9504000  ! 847: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x81952000  ! 849: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
hwintr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_208), 16, 16)) -> intp(2, 0, 1)
	.word 0x01000000  ! 850: NOP	nop
	.word 0xa350c000  ! 851: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xb9e5a000  ! 853: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xad50c000  ! 854: RDPR_TT	<illegal instruction>
	.word 0x8597a000  ! 855: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839d6000  ! 856: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa7e72000  ! 857: SAVE_I	save	%r28, 0x0001, %r19
	.word 0x8194e000  ! 858: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb7500000  ! 859: RDPR_TPC	<illegal instruction>
hwintr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_209), 16, 16)) -> intp(2, 0, 2a)
	.word 0x01000000  ! 860: NOP	nop
	.word 0xa1e56000  ! 861: SAVE_I	save	%r21, 0x0001, %r16
	.word 0x83962000  ! 862: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
hwintr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_210), 16, 16)) -> intp(2, 0, 10)
	.word 0x01000000  ! 863: NOP	nop
hwintr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_211), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 864: NOP	nop
	.word 0xa7504000  ! 865: RDPR_TNPC	<illegal instruction>
	.word 0xa9e62000  ! 866: SAVE_I	save	%r24, 0x0001, %r20
	.word 0x839e2000  ! 867: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa9e7e000  ! 868: SAVE_I	save	%r31, 0x0001, %r20
	.word 0x839d6000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
hwintr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_212), 16, 16)) -> intp(2, 0, 1a)
	.word 0x01000000  ! 870: NOP	nop
	.word 0xa3e4e000  ! 871: SAVE_I	save	%r19, 0x0001, %r17
	.word 0xa5508000  ! 872: RDPR_TSTATE	rdpr	%tstate, %r18
hwintr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_213), 16, 16)) -> intp(2, 0, 2f)
	.word 0x01000000  ! 873: NOP	nop
	.word 0xb3504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xa3500000  ! 875: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 876: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb5508000  ! 877: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 878: RDPR_TNPC	<illegal instruction>
hwintr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_214), 16, 16)) -> intp(2, 0, 12)
	.word 0x01000000  ! 879: NOP	nop
	.word 0xaf508000  ! 880: RDPR_TSTATE	<illegal instruction>
hwintr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_215), 16, 16)) -> intp(2, 0, e)
	.word 0x01000000  ! 881: NOP	nop
hwintr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_216), 16, 16)) -> intp(2, 0, 32)
	.word 0x01000000  ! 882: NOP	nop
	.word 0xbfe7a000  ! 883: SAVE_I	save	%r30, 0x0001, %r31
	.word 0xb1500000  ! 884: RDPR_TPC	<illegal instruction>
	.word 0xad484000  ! 885: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x8195e000  ! 886: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbfe7e000  ! 887: SAVE_I	save	%r31, 0x0001, %r31
hwintr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_217), 16, 16)) -> intp(2, 0, 1a)
	.word 0x01000000  ! 888: NOP	nop
	.word 0xb1500000  ! 889: RDPR_TPC	<illegal instruction>
	.word 0xa5e42000  ! 890: SAVE_I	save	%r16, 0x0001, %r18
	.word 0xa5e7a000  ! 891: SAVE_I	save	%r30, 0x0001, %r18
	.word 0xa9508000  ! 892: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e76000  ! 893: SAVE_I	save	%r29, 0x0001, %r24
hwintr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_218), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 894: NOP	nop
	.word 0xade76000  ! 895: SAVE_I	save	%r29, 0x0001, %r22
	.word 0x8194a000  ! 896: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb9500000  ! 897: RDPR_TPC	<illegal instruction>
	.word 0xafe76000  ! 898: SAVE_I	save	%r29, 0x0001, %r23
	.word 0xb1484000  ! 899: RDHPR_HTSTATE	rdhpr	%htstate, %r24
hwintr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_219), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 900: NOP	nop
	.word 0xa5484000  ! 901: RDHPR_HTSTATE	rdhpr	%htstate, %r18
hwintr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_220), 16, 16)) -> intp(2, 0, 36)
	.word 0x01000000  ! 902: NOP	nop
	.word 0xbde6a000  ! 903: SAVE_I	save	%r26, 0x0001, %r30
hwintr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_221), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 904: NOP	nop
	.word 0x8396a000  ! 905: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8397e000  ! 906: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87972000  ! 907: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
hwintr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_222), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 908: NOP	nop
	.word 0xb1e7a000  ! 909: SAVE_I	save	%r30, 0x0001, %r24
	.word 0x87972000  ! 910: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839e2000  ! 911: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839d6000  ! 912: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb5508000  ! 913: RDPR_TSTATE	<illegal instruction>
	.word 0x87952000  ! 914: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbf50c000  ! 915: RDPR_TT	<illegal instruction>
	.word 0xa9e7a000  ! 916: SAVE_I	save	%r30, 0x0001, %r20
	.word 0xb3500000  ! 917: RDPR_TPC	<illegal instruction>
hwintr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_223), 16, 16)) -> intp(2, 0, 1f)
	.word 0x01000000  ! 918: NOP	nop
	.word 0xa3e46000  ! 919: SAVE_I	save	%r17, 0x0001, %r17
	.word 0xab504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 921: RDPR_TPC	<illegal instruction>
hwintr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_224), 16, 16)) -> intp(2, 0, 33)
	.word 0x01000000  ! 922: NOP	nop
	.word 0x8596a000  ! 923: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbfe42000  ! 924: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x83966000  ! 925: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xaf484000  ! 926: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa7e7a000  ! 927: SAVE_I	save	%r30, 0x0001, %r19
hwintr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_225), 16, 16)) -> intp(2, 0, 1b)
	.word 0x01000000  ! 928: NOP	nop
hwintr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_226), 16, 16)) -> intp(2, 0, 12)
	.word 0x01000000  ! 929: NOP	nop
	.word 0x8796a000  ! 930: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8797a000  ! 931: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xab50c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xb7484000  ! 933: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xbbe72000  ! 934: SAVE_I	save	%r28, 0x0001, %r29
hwintr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_227), 16, 16)) -> intp(2, 0, 28)
	.word 0x01000000  ! 935: NOP	nop
	.word 0x839d6000  ! 936: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
hwintr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_228), 16, 16)) -> intp(2, 0, 17)
	.word 0x01000000  ! 937: NOP	nop
	.word 0x8196e000  ! 938: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xad484000  ! 939: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xad484000  ! 940: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xb1504000  ! 941: RDPR_TNPC	<illegal instruction>
hwintr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_229), 16, 16)) -> intp(2, 0, e)
	.word 0x01000000  ! 942: NOP	nop
	.word 0x839ee000  ! 943: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x81942000  ! 944: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
hwintr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_230), 16, 16)) -> intp(2, 0, 25)
	.word 0x01000000  ! 945: NOP	nop
hwintr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_231), 16, 16)) -> intp(2, 0, 3a)
	.word 0x01000000  ! 946: NOP	nop
	.word 0xa3e56000  ! 947: SAVE_I	save	%r21, 0x0001, %r17
	.word 0xafe76000  ! 948: SAVE_I	save	%r29, 0x0001, %r23
	.word 0x83972000  ! 949: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa3e5a000  ! 950: SAVE_I	save	%r22, 0x0001, %r17
	.word 0x87962000  ! 951: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbfe7a000  ! 952: SAVE_I	save	%r30, 0x0001, %r31
	.word 0xa5e42000  ! 953: SAVE_I	save	%r16, 0x0001, %r18
hwintr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_232), 16, 16)) -> intp(2, 0, b)
	.word 0x01000000  ! 954: NOP	nop
	.word 0x85952000  ! 955: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
hwintr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_233), 16, 16)) -> intp(2, 0, 7)
	.word 0x01000000  ! 956: NOP	nop
	.word 0xad500000  ! 957: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xa9e46000  ! 958: SAVE_I	save	%r17, 0x0001, %r20
	.word 0x8395e000  ! 959: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xad484000  ! 960: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x839ce000  ! 961: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbbe4a000  ! 962: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x83946000  ! 963: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xbf504000  ! 964: RDPR_TNPC	<illegal instruction>
hwintr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_234), 16, 16)) -> intp(2, 0, 14)
	.word 0x01000000  ! 965: NOP	nop
	.word 0xade76000  ! 966: SAVE_I	save	%r29, 0x0001, %r22
	.word 0x8195e000  ! 967: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xaf504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xa3e56000  ! 970: SAVE_I	save	%r21, 0x0001, %r17
hwintr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_235), 16, 16)) -> intp(2, 0, 1c)
	.word 0x01000000  ! 971: NOP	nop
hwintr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_236), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 972: NOP	nop
hwintr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_237), 16, 16)) -> intp(2, 0, 5)
	.word 0x01000000  ! 973: NOP	nop
	.word 0x8195a000  ! 974: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x81972000  ! 975: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa7e7a000  ! 976: SAVE_I	save	%r30, 0x0001, %r19
	.word 0x839ce000  ! 977: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
hwintr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_238), 16, 16)) -> intp(2, 0, 3c)
	.word 0x01000000  ! 978: NOP	nop
	.word 0x8195e000  ! 979: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb3484000  ! 980: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xb7e5a000  ! 981: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde7a000  ! 982: SAVE_I	save	%r30, 0x0001, %r30
	.word 0x83976000  ! 983: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa1e6a000  ! 984: SAVE_I	save	%r26, 0x0001, %r16
	.word 0xb7500000  ! 985: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x8795e000  ! 986: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
hwintr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_239), 16, 16)) -> intp(2, 0, c)
	.word 0x01000000  ! 987: NOP	nop
	.word 0xbde7a000  ! 988: SAVE_I	save	%r30, 0x0001, %r30
hwintr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_240), 16, 16)) -> intp(2, 0, 3d)
	.word 0x01000000  ! 989: NOP	nop
	.word 0xb5484000  ! 990: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xb1e72000  ! 991: SAVE_I	save	%r28, 0x0001, %r24
	.word 0x8195e000  ! 992: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8796a000  ! 993: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb7508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 995: RDPR_TSTATE	<illegal instruction>
hwintr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_241), 16, 16)) -> intp(2, 0, 34)
	.word 0x01000000  ! 996: NOP	nop
	.word 0xbd504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x8597a000  ! 998: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
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
	.word 0xaf504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0xbde5e000  ! 2: SAVE_I	save	%r23, 0x0001, %r30
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 3: NOP	nop
	.word 0xabe56000  ! 4: SAVE_I	save	%r21, 0x0001, %r21
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 5: NOP	nop
	.word 0x839c6000  ! 6: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 6)
	.word 0x01000000  ! 7: NOP	nop
	.word 0x8396e000  ! 8: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8795e000  ! 9: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb5e42000  ! 10: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xa7484000  ! 11: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0x87942000  ! 12: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbf500000  ! 13: RDPR_TPC	<illegal instruction>
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 0)
	.word 0x01000000  ! 14: NOP	nop
	.word 0x8797a000  ! 15: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x87952000  ! 16: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839fe000  ! 17: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb9508000  ! 18: RDPR_TSTATE	<illegal instruction>
	.word 0xabe56000  ! 19: SAVE_I	save	%r21, 0x0001, %r21
	.word 0xad50c000  ! 20: RDPR_TT	<illegal instruction>
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 32)
	.word 0x01000000  ! 21: NOP	nop
	.word 0xb5e5e000  ! 22: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8195e000  ! 23: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa7500000  ! 24: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xa1e7a000  ! 26: SAVE_I	save	%r30, 0x0001, %r16
	.word 0x8196a000  ! 27: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 11)
	.word 0x01000000  ! 28: NOP	nop
	.word 0xab484000  ! 29: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa1e66000  ! 30: SAVE_I	save	%r25, 0x0001, %r16
	.word 0x839de000  ! 31: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 1d)
	.word 0x01000000  ! 32: NOP	nop
	.word 0xab50c000  ! 33: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 34: RDPR_TPC	<illegal instruction>
	.word 0xa7e42000  ! 35: SAVE_I	save	%r16, 0x0001, %r19
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 39)
	.word 0x01000000  ! 36: NOP	nop
	.word 0xbb508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0x87966000  ! 38: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 22)
	.word 0x01000000  ! 39: NOP	nop
	.word 0xade56000  ! 40: SAVE_I	save	%r21, 0x0001, %r22
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 1b)
	.word 0x01000000  ! 41: NOP	nop
	.word 0x87942000  ! 42: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x83966000  ! 43: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839c6000  ! 44: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8396a000  ! 45: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 29)
	.word 0x01000000  ! 46: NOP	nop
	.word 0xbf500000  ! 47: RDPR_TPC	<illegal instruction>
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 3d)
	.word 0x01000000  ! 48: NOP	nop
	.word 0x839ce000  ! 49: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbf484000  ! 50: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xb9e66000  ! 51: SAVE_I	save	%r25, 0x0001, %r28
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 25)
	.word 0x01000000  ! 52: NOP	nop
	.word 0xbde5e000  ! 53: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xa9e5e000  ! 54: SAVE_I	save	%r23, 0x0001, %r20
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 36)
	.word 0x01000000  ! 55: NOP	nop
	.word 0xb1484000  ! 56: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xbf504000  ! 57: RDPR_TNPC	<illegal instruction>
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, a)
	.word 0x01000000  ! 58: NOP	nop
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 33)
	.word 0x01000000  ! 59: NOP	nop
	.word 0x8596e000  ! 60: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa350c000  ! 61: RDPR_TT	rdpr	%tt, %r17
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 0)
	.word 0x01000000  ! 62: NOP	nop
	.word 0x8595a000  ! 63: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x87966000  ! 64: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb550c000  ! 65: RDPR_TT	<illegal instruction>
	.word 0xabe6a000  ! 66: SAVE_I	save	%r26, 0x0001, %r21
	.word 0xbb504000  ! 67: RDPR_TNPC	<illegal instruction>
	.word 0x87966000  ! 68: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbde56000  ! 69: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x87972000  ! 70: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8595e000  ! 71: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 72: NOP	nop
	.word 0x8595e000  ! 73: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7e42000  ! 74: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e7a000  ! 75: SAVE_I	save	%r30, 0x0001, %r24
	.word 0x8194e000  ! 76: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb9e4e000  ! 77: SAVE_I	save	%r19, 0x0001, %r28
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x8397e000  ! 79: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8396e000  ! 80: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb5e72000  ! 81: SAVE_I	save	%r28, 0x0001, %r26
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 38)
	.word 0x01000000  ! 82: NOP	nop
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 30)
	.word 0x01000000  ! 83: NOP	nop
	.word 0xa5e56000  ! 84: SAVE_I	save	%r21, 0x0001, %r18
	.word 0x81976000  ! 85: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb9e4e000  ! 86: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7508000  ! 87: RDPR_TSTATE	<illegal instruction>
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 24)
	.word 0x01000000  ! 88: NOP	nop
	.word 0xad508000  ! 89: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 90: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 91: RDPR_TPC	<illegal instruction>
	.word 0xa1e5a000  ! 92: SAVE_I	save	%r22, 0x0001, %r16
	.word 0xad508000  ! 93: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 94: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 39)
	.word 0x01000000  ! 95: NOP	nop
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 30)
	.word 0x01000000  ! 96: NOP	nop
	.word 0x8197e000  ! 97: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xad500000  ! 98: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 99: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa7504000  ! 100: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 101: RDPR_TNPC	<illegal instruction>
	.word 0xa1e56000  ! 102: SAVE_I	save	%r21, 0x0001, %r16
	.word 0x81972000  ! 103: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xad484000  ! 104: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x8397e000  ! 105: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb3508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 107: NOP	nop
	.word 0xbde76000  ! 108: SAVE_I	save	%r29, 0x0001, %r30
	.word 0xb1e5e000  ! 109: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xaf50c000  ! 110: RDPR_TT	<illegal instruction>
	.word 0x8195e000  ! 111: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 33)
	.word 0x01000000  ! 112: NOP	nop
	.word 0xa5e4a000  ! 113: SAVE_I	save	%r18, 0x0001, %r18
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, a)
	.word 0x01000000  ! 114: NOP	nop
	.word 0xa9e66000  ! 115: SAVE_I	save	%r25, 0x0001, %r20
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 2e)
	.word 0x01000000  ! 116: NOP	nop
	.word 0x8797e000  ! 117: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8594a000  ! 118: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x87972000  ! 119: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8196a000  ! 120: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 31)
	.word 0x01000000  ! 121: NOP	nop
	.word 0xb7e66000  ! 122: SAVE_I	save	%r25, 0x0001, %r27
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 6)
	.word 0x01000000  ! 123: NOP	nop
	.word 0xb9504000  ! 124: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 125: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xabe72000  ! 126: SAVE_I	save	%r28, 0x0001, %r21
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, b)
	.word 0x01000000  ! 127: NOP	nop
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 3e)
	.word 0x01000000  ! 128: NOP	nop
	.word 0xa7500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0xa1e66000  ! 130: SAVE_I	save	%r25, 0x0001, %r16
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 131: NOP	nop
	.word 0x839e2000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x87956000  ! 133: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x87976000  ! 134: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa1e52000  ! 135: SAVE_I	save	%r20, 0x0001, %r16
	.word 0xab484000  ! 136: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x81972000  ! 137: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 2e)
	.word 0x01000000  ! 138: NOP	nop
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 139: NOP	nop
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 140: NOP	nop
	.word 0xa7500000  ! 141: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xa7484000  ! 142: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xb7504000  ! 143: RDPR_TNPC	<illegal instruction>
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 38)
	.word 0x01000000  ! 144: NOP	nop
	.word 0xab500000  ! 145: RDPR_TPC	<illegal instruction>
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 2b)
	.word 0x01000000  ! 146: NOP	nop
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 147: NOP	nop
	.word 0xbfe66000  ! 148: SAVE_I	save	%r25, 0x0001, %r31
	.word 0xad504000  ! 149: RDPR_TNPC	<illegal instruction>
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 150: NOP	nop
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 3e)
	.word 0x01000000  ! 151: NOP	nop
	.word 0xb1484000  ! 152: RDHPR_HTSTATE	rdhpr	%htstate, %r24
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 25)
	.word 0x01000000  ! 153: NOP	nop
	.word 0xafe7e000  ! 154: SAVE_I	save	%r31, 0x0001, %r23
	.word 0xafe46000  ! 155: SAVE_I	save	%r17, 0x0001, %r23
	.word 0xade6e000  ! 156: SAVE_I	save	%r27, 0x0001, %r22
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 2c)
	.word 0x01000000  ! 157: NOP	nop
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 158: NOP	nop
	.word 0xa550c000  ! 159: RDPR_TT	<illegal instruction>
	.word 0xabe72000  ! 160: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xb1484000  ! 161: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xafe56000  ! 162: SAVE_I	save	%r21, 0x0001, %r23
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 163: NOP	nop
	.word 0x839e2000  ! 164: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, f)
	.word 0x01000000  ! 165: NOP	nop
	.word 0xa7e66000  ! 166: SAVE_I	save	%r25, 0x0001, %r19
	.word 0xafe7a000  ! 167: SAVE_I	save	%r30, 0x0001, %r23
	.word 0xbb500000  ! 168: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 169: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x81962000  ! 170: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb3508000  ! 171: RDPR_TSTATE	<illegal instruction>
	.word 0xafe6e000  ! 172: SAVE_I	save	%r27, 0x0001, %r23
	.word 0x81962000  ! 173: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa1500000  ! 174: RDPR_TPC	<illegal instruction>
	.word 0x839f6000  ! 175: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 176: NOP	nop
	.word 0xa5484000  ! 177: RDHPR_HTSTATE	rdhpr	%htstate, %r18
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 2a)
	.word 0x01000000  ! 178: NOP	nop
	.word 0xb3508000  ! 179: RDPR_TSTATE	<illegal instruction>
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 21)
	.word 0x01000000  ! 180: NOP	nop
	.word 0x8797a000  ! 181: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb7e5a000  ! 182: SAVE_I	save	%r22, 0x0001, %r27
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 25)
	.word 0x01000000  ! 183: NOP	nop
	.word 0xade6a000  ! 184: SAVE_I	save	%r26, 0x0001, %r22
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 38)
	.word 0x01000000  ! 185: NOP	nop
	.word 0xa1508000  ! 186: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e52000  ! 187: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x8795e000  ! 188: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x83946000  ! 189: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 1b)
	.word 0x01000000  ! 190: NOP	nop
hwintr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_52), 16, 16)) -> intp(1, 0, 3c)
	.word 0x01000000  ! 191: NOP	nop
	.word 0xb5e66000  ! 192: SAVE_I	save	%r25, 0x0001, %r26
hwintr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_53), 16, 16)) -> intp(1, 0, 32)
	.word 0x01000000  ! 193: NOP	nop
hwintr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_54), 16, 16)) -> intp(1, 0, 13)
	.word 0x01000000  ! 194: NOP	nop
hwintr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_55), 16, 16)) -> intp(1, 0, 17)
	.word 0x01000000  ! 195: NOP	nop
hwintr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_56), 16, 16)) -> intp(1, 0, b)
	.word 0x01000000  ! 196: NOP	nop
hwintr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_57), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 197: NOP	nop
hwintr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_58), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 198: NOP	nop
hwintr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_59), 16, 16)) -> intp(1, 0, 3)
	.word 0x01000000  ! 199: NOP	nop
	.word 0xbfe72000  ! 200: SAVE_I	save	%r28, 0x0001, %r31
hwintr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_60), 16, 16)) -> intp(1, 0, 1b)
	.word 0x01000000  ! 201: NOP	nop
hwintr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_61), 16, 16)) -> intp(1, 0, 8)
	.word 0x01000000  ! 202: NOP	nop
hwintr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_62), 16, 16)) -> intp(1, 0, 20)
	.word 0x01000000  ! 203: NOP	nop
	.word 0xaf484000  ! 204: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa1504000  ! 205: RDPR_TNPC	<illegal instruction>
	.word 0xa3500000  ! 206: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 207: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 208: RDPR_TNPC	<illegal instruction>
	.word 0xaf500000  ! 209: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 210: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb3484000  ! 211: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xb9e4e000  ! 212: SAVE_I	save	%r19, 0x0001, %r28
hwintr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_63), 16, 16)) -> intp(1, 0, 32)
	.word 0x01000000  ! 213: NOP	nop
	.word 0xb5e4a000  ! 214: SAVE_I	save	%r18, 0x0001, %r26
hwintr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_64), 16, 16)) -> intp(1, 0, 22)
	.word 0x01000000  ! 215: NOP	nop
	.word 0x87976000  ! 216: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x87946000  ! 217: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_65), 16, 16)) -> intp(1, 0, 7)
	.word 0x01000000  ! 218: NOP	nop
	.word 0xa7504000  ! 219: RDPR_TNPC	<illegal instruction>
hwintr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_66), 16, 16)) -> intp(1, 0, 24)
	.word 0x01000000  ! 220: NOP	nop
	.word 0xbd50c000  ! 221: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 222: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xb3e6e000  ! 223: SAVE_I	save	%r27, 0x0001, %r25
	.word 0x8397a000  ! 224: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa7e56000  ! 225: SAVE_I	save	%r21, 0x0001, %r19
hwintr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_67), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 226: NOP	nop
	.word 0xb950c000  ! 227: RDPR_TT	<illegal instruction>
	.word 0xb1e72000  ! 228: SAVE_I	save	%r28, 0x0001, %r24
	.word 0x8797e000  ! 229: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb7484000  ! 230: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xbde4e000  ! 231: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xa7484000  ! 232: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xb9508000  ! 233: RDPR_TSTATE	<illegal instruction>
hwintr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_68), 16, 16)) -> intp(1, 0, 26)
	.word 0x01000000  ! 234: NOP	nop
	.word 0xbb504000  ! 235: RDPR_TNPC	<illegal instruction>
	.word 0xa7484000  ! 236: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xbd50c000  ! 237: RDPR_TT	<illegal instruction>
hwintr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_69), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 238: NOP	nop
hwintr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_70), 16, 16)) -> intp(1, 0, 2f)
	.word 0x01000000  ! 239: NOP	nop
	.word 0xa7e6e000  ! 240: SAVE_I	save	%r27, 0x0001, %r19
	.word 0x87972000  ! 241: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa3e42000  ! 242: SAVE_I	save	%r16, 0x0001, %r17
hwintr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_71), 16, 16)) -> intp(1, 0, 7)
	.word 0x01000000  ! 243: NOP	nop
	.word 0x839c2000  ! 244: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8597e000  ! 245: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb5e76000  ! 246: SAVE_I	save	%r29, 0x0001, %r26
	.word 0xa7500000  ! 247: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 248: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x83966000  ! 249: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x87976000  ! 250: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa5e4e000  ! 251: SAVE_I	save	%r19, 0x0001, %r18
	.word 0xabe5e000  ! 252: SAVE_I	save	%r23, 0x0001, %r21
	.word 0xa5e5a000  ! 253: SAVE_I	save	%r22, 0x0001, %r18
hwintr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_72), 16, 16)) -> intp(1, 0, 10)
	.word 0x01000000  ! 254: NOP	nop
hwintr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_73), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 255: NOP	nop
hwintr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_74), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 256: NOP	nop
	.word 0x8395e000  ! 257: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa1508000  ! 258: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 259: RDPR_TSTATE	<illegal instruction>
	.word 0xbb484000  ! 260: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xa9508000  ! 261: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5a000  ! 262: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x85962000  ! 263: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8394a000  ! 264: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8397a000  ! 265: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x83972000  ! 266: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
hwintr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_75), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 267: NOP	nop
hwintr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_76), 16, 16)) -> intp(1, 0, 24)
	.word 0x01000000  ! 268: NOP	nop
	.word 0xa3e7a000  ! 269: SAVE_I	save	%r30, 0x0001, %r17
hwintr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_77), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 270: NOP	nop
hwintr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_78), 16, 16)) -> intp(1, 0, 2e)
	.word 0x01000000  ! 271: NOP	nop
	.word 0x8597e000  ! 272: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xab484000  ! 273: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa9e7a000  ! 274: SAVE_I	save	%r30, 0x0001, %r20
hwintr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_79), 16, 16)) -> intp(1, 0, 1a)
	.word 0x01000000  ! 275: NOP	nop
	.word 0x8395e000  ! 276: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x85976000  ! 277: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xade42000  ! 278: SAVE_I	save	%r16, 0x0001, %r22
	.word 0xa5500000  ! 279: RDPR_TPC	<illegal instruction>
hwintr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_80), 16, 16)) -> intp(1, 0, 2f)
	.word 0x01000000  ! 280: NOP	nop
	.word 0x8395a000  ! 281: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xabe5a000  ! 282: SAVE_I	save	%r22, 0x0001, %r21
	.word 0x83942000  ! 283: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb9504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 285: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 286: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xa5484000  ! 287: RDHPR_HTSTATE	rdhpr	%htstate, %r18
hwintr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_81), 16, 16)) -> intp(1, 0, 20)
	.word 0x01000000  ! 288: NOP	nop
	.word 0xb5e7a000  ! 289: SAVE_I	save	%r30, 0x0001, %r26
	.word 0xb5e7e000  ! 290: SAVE_I	save	%r31, 0x0001, %r26
hwintr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_82), 16, 16)) -> intp(1, 0, 3a)
	.word 0x01000000  ! 291: NOP	nop
hwintr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_83), 16, 16)) -> intp(1, 0, 1)
	.word 0x01000000  ! 292: NOP	nop
hwintr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_84), 16, 16)) -> intp(1, 0, 26)
	.word 0x01000000  ! 293: NOP	nop
	.word 0xb5484000  ! 294: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xade7a000  ! 295: SAVE_I	save	%r30, 0x0001, %r22
hwintr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_85), 16, 16)) -> intp(1, 0, 29)
	.word 0x01000000  ! 296: NOP	nop
	.word 0x839de000  ! 297: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbfe7e000  ! 298: SAVE_I	save	%r31, 0x0001, %r31
hwintr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_86), 16, 16)) -> intp(1, 0, 32)
	.word 0x01000000  ! 299: NOP	nop
hwintr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_87), 16, 16)) -> intp(1, 0, f)
	.word 0x01000000  ! 300: NOP	nop
hwintr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_88), 16, 16)) -> intp(1, 0, 2d)
	.word 0x01000000  ! 301: NOP	nop
	.word 0xa3e52000  ! 302: SAVE_I	save	%r20, 0x0001, %r17
	.word 0xb1e66000  ! 303: SAVE_I	save	%r25, 0x0001, %r24
hwintr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_89), 16, 16)) -> intp(1, 0, 12)
	.word 0x01000000  ! 304: NOP	nop
	.word 0xa7484000  ! 305: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_90), 16, 16)) -> intp(1, 0, 1f)
	.word 0x01000000  ! 306: NOP	nop
	.word 0x839e6000  ! 307: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbf508000  ! 308: RDPR_TSTATE	<illegal instruction>
hwintr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_91), 16, 16)) -> intp(1, 0, 21)
	.word 0x01000000  ! 309: NOP	nop
	.word 0xa5508000  ! 310: RDPR_TSTATE	<illegal instruction>
	.word 0x839ce000  ! 311: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa3504000  ! 312: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 313: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_92), 16, 16)) -> intp(1, 0, 1e)
	.word 0x01000000  ! 314: NOP	nop
hwintr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_93), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 315: NOP	nop
hwintr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_94), 16, 16)) -> intp(1, 0, 1)
	.word 0x01000000  ! 316: NOP	nop
	.word 0xb9484000  ! 317: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xa1e6e000  ! 318: SAVE_I	save	%r27, 0x0001, %r16
	.word 0xaf484000  ! 319: RDHPR_HTSTATE	rdhpr	%htstate, %r23
hwintr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_95), 16, 16)) -> intp(1, 0, 32)
	.word 0x01000000  ! 320: NOP	nop
	.word 0xad504000  ! 321: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 322: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
hwintr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_96), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 323: NOP	nop
	.word 0xbde46000  ! 324: SAVE_I	save	%r17, 0x0001, %r30
hwintr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_97), 16, 16)) -> intp(1, 0, 7)
	.word 0x01000000  ! 325: NOP	nop
hwintr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_98), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 326: NOP	nop
	.word 0xad508000  ! 327: RDPR_TSTATE	<illegal instruction>
hwintr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_99), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 328: NOP	nop
	.word 0xa9484000  ! 329: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xbbe6e000  ! 330: SAVE_I	save	%r27, 0x0001, %r29
	.word 0xbb50c000  ! 331: RDPR_TT	<illegal instruction>
	.word 0xabe72000  ! 332: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xbfe6e000  ! 333: SAVE_I	save	%r27, 0x0001, %r31
	.word 0xa9484000  ! 334: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x8797e000  ! 335: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8796e000  ! 336: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
hwintr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_100), 16, 16)) -> intp(1, 0, 3)
	.word 0x01000000  ! 337: NOP	nop
	.word 0x8796e000  ! 338: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8197e000  ! 339: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb5e4e000  ! 340: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8795e000  ! 341: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
hwintr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_101), 16, 16)) -> intp(1, 0, 3)
	.word 0x01000000  ! 342: NOP	nop
	.word 0xafe4a000  ! 343: SAVE_I	save	%r18, 0x0001, %r23
	.word 0xb1504000  ! 344: RDPR_TNPC	<illegal instruction>
	.word 0x85976000  ! 345: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa5e72000  ! 346: SAVE_I	save	%r28, 0x0001, %r18
	.word 0xa3504000  ! 347: RDPR_TNPC	<illegal instruction>
hwintr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_102), 16, 16)) -> intp(1, 0, 13)
	.word 0x01000000  ! 348: NOP	nop
	.word 0x839e2000  ! 349: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xb1484000  ! 350: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xb5504000  ! 351: RDPR_TNPC	<illegal instruction>
	.word 0xa9e6a000  ! 352: SAVE_I	save	%r26, 0x0001, %r20
hwintr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_103), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 353: NOP	nop
hwintr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_104), 16, 16)) -> intp(1, 0, 3d)
	.word 0x01000000  ! 354: NOP	nop
hwintr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_105), 16, 16)) -> intp(1, 0, 8)
	.word 0x01000000  ! 355: NOP	nop
	.word 0x8396e000  ! 356: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x839d2000  ! 357: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x83962000  ! 358: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa3e6e000  ! 359: SAVE_I	save	%r27, 0x0001, %r17
	.word 0xbde72000  ! 360: SAVE_I	save	%r28, 0x0001, %r30
	.word 0x8796e000  ! 361: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbb504000  ! 362: RDPR_TNPC	<illegal instruction>
hwintr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_106), 16, 16)) -> intp(1, 0, 1a)
	.word 0x01000000  ! 363: NOP	nop
	.word 0xa7e4e000  ! 364: SAVE_I	save	%r19, 0x0001, %r19
hwintr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_107), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 365: NOP	nop
	.word 0xa7484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xb9e5e000  ! 367: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xab500000  ! 368: RDPR_TPC	<illegal instruction>
	.word 0xade7e000  ! 369: SAVE_I	save	%r31, 0x0001, %r22
	.word 0xbde4e000  ! 370: SAVE_I	save	%r19, 0x0001, %r30
hwintr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_108), 16, 16)) -> intp(1, 0, f)
	.word 0x01000000  ! 371: NOP	nop
	.word 0xa1484000  ! 372: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xbfe7e000  ! 373: SAVE_I	save	%r31, 0x0001, %r31
	.word 0xa9e62000  ! 374: SAVE_I	save	%r24, 0x0001, %r20
	.word 0x87962000  ! 375: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x83962000  ! 376: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb1e5e000  ! 377: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xa9e4a000  ! 378: SAVE_I	save	%r18, 0x0001, %r20
	.word 0x85956000  ! 379: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x87946000  ! 380: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbbe6a000  ! 381: SAVE_I	save	%r26, 0x0001, %r29
	.word 0xa1504000  ! 382: RDPR_TNPC	<illegal instruction>
	.word 0xb5e7a000  ! 383: SAVE_I	save	%r30, 0x0001, %r26
	.word 0xad508000  ! 384: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 385: RDPR_TT	<illegal instruction>
	.word 0xbde56000  ! 386: SAVE_I	save	%r21, 0x0001, %r30
hwintr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_109), 16, 16)) -> intp(1, 0, 34)
	.word 0x01000000  ! 387: NOP	nop
	.word 0xa1500000  ! 388: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 389: RDPR_TNPC	<illegal instruction>
	.word 0xa7e7a000  ! 390: SAVE_I	save	%r30, 0x0001, %r19
	.word 0xb5484000  ! 391: RDHPR_HTSTATE	rdhpr	%htstate, %r26
hwintr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_110), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 392: NOP	nop
	.word 0xb7500000  ! 393: RDPR_TPC	<illegal instruction>
hwintr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_111), 16, 16)) -> intp(1, 0, 3a)
	.word 0x01000000  ! 394: NOP	nop
	.word 0x8794e000  ! 395: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x839d6000  ! 396: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa950c000  ! 397: RDPR_TT	<illegal instruction>
	.word 0xa9484000  ! 398: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xbde42000  ! 399: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3484000  ! 400: RDHPR_HTSTATE	rdhpr	%htstate, %r25
hwintr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_112), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 401: NOP	nop
hwintr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_113), 16, 16)) -> intp(1, 0, 33)
	.word 0x01000000  ! 402: NOP	nop
	.word 0xade7e000  ! 403: SAVE_I	save	%r31, 0x0001, %r22
hwintr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_114), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 404: NOP	nop
	.word 0xad500000  ! 405: RDPR_TPC	<illegal instruction>
	.word 0xa7e76000  ! 406: SAVE_I	save	%r29, 0x0001, %r19
hwintr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_115), 16, 16)) -> intp(1, 0, 3a)
	.word 0x01000000  ! 407: NOP	nop
	.word 0xb950c000  ! 408: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 409: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe7e000  ! 410: SAVE_I	save	%r31, 0x0001, %r31
	.word 0xbfe72000  ! 411: SAVE_I	save	%r28, 0x0001, %r31
	.word 0xa7e5e000  ! 412: SAVE_I	save	%r23, 0x0001, %r19
	.word 0xbb504000  ! 413: RDPR_TNPC	<illegal instruction>
hwintr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_116), 16, 16)) -> intp(1, 0, 2b)
	.word 0x01000000  ! 414: NOP	nop
	.word 0x83972000  ! 415: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xabe72000  ! 416: SAVE_I	save	%r28, 0x0001, %r21
	.word 0xa3484000  ! 417: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x81976000  ! 418: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
hwintr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_117), 16, 16)) -> intp(1, 0, 18)
	.word 0x01000000  ! 419: NOP	nop
hwintr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_118), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 420: NOP	nop
	.word 0x8195a000  ! 421: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8194a000  ! 422: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x87962000  ! 423: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
hwintr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_119), 16, 16)) -> intp(1, 0, 39)
	.word 0x01000000  ! 424: NOP	nop
	.word 0x8795a000  ! 425: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8196a000  ! 426: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_120), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 427: NOP	nop
	.word 0x85976000  ! 428: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb7e5a000  ! 429: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x8396e000  ! 430: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbd500000  ! 431: RDPR_TPC	<illegal instruction>
	.word 0xa3504000  ! 432: RDPR_TNPC	<illegal instruction>
	.word 0xb9e56000  ! 433: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x87966000  ! 434: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
hwintr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_121), 16, 16)) -> intp(1, 0, 3b)
	.word 0x01000000  ! 435: NOP	nop
hwintr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_122), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 436: NOP	nop
	.word 0x87962000  ! 437: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87946000  ! 438: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_123), 16, 16)) -> intp(1, 0, 28)
	.word 0x01000000  ! 439: NOP	nop
	.word 0x8794a000  ! 440: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x81956000  ! 441: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbf500000  ! 442: RDPR_TPC	<illegal instruction>
	.word 0x839de000  ! 443: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
hwintr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_124), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 444: NOP	nop
	.word 0xabe7e000  ! 445: SAVE_I	save	%r31, 0x0001, %r21
	.word 0xbfe6e000  ! 446: SAVE_I	save	%r27, 0x0001, %r31
	.word 0xbfe76000  ! 447: SAVE_I	save	%r29, 0x0001, %r31
	.word 0x839da000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8196a000  ! 449: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xab500000  ! 450: RDPR_TPC	<illegal instruction>
hwintr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_125), 16, 16)) -> intp(1, 0, 37)
	.word 0x01000000  ! 451: NOP	nop
	.word 0xa9e5e000  ! 452: SAVE_I	save	%r23, 0x0001, %r20
	.word 0xa350c000  ! 453: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 454: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 455: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xaf508000  ! 456: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 457: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb3484000  ! 458: RDHPR_HTSTATE	rdhpr	%htstate, %r25
hwintr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_126), 16, 16)) -> intp(1, 0, 31)
	.word 0x01000000  ! 459: NOP	nop
	.word 0x81972000  ! 460: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa1484000  ! 461: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x8797a000  ! 462: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_127), 16, 16)) -> intp(1, 0, 22)
	.word 0x01000000  ! 463: NOP	nop
	.word 0x839e6000  ! 464: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x8197a000  ! 465: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x87966000  ! 466: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
hwintr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_128), 16, 16)) -> intp(1, 0, 1)
	.word 0x01000000  ! 467: NOP	nop
	.word 0xbd484000  ! 468: RDHPR_HTSTATE	rdhpr	%htstate, %r30
hwintr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_129), 16, 16)) -> intp(1, 0, 30)
	.word 0x01000000  ! 469: NOP	nop
hwintr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_130), 16, 16)) -> intp(1, 0, 38)
	.word 0x01000000  ! 470: NOP	nop
hwintr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_131), 16, 16)) -> intp(1, 0, 3f)
	.word 0x01000000  ! 471: NOP	nop
	.word 0xb3e6e000  ! 472: SAVE_I	save	%r27, 0x0001, %r25
	.word 0xab500000  ! 473: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 474: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
hwintr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_132), 16, 16)) -> intp(1, 0, d)
	.word 0x01000000  ! 475: NOP	nop
	.word 0x839c6000  ! 476: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa550c000  ! 477: RDPR_TT	<illegal instruction>
	.word 0x81952000  ! 478: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb950c000  ! 479: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 480: RDPR_TPC	<illegal instruction>
	.word 0xa1e42000  ! 481: SAVE_I	save	%r16, 0x0001, %r16
	.word 0xa1e6a000  ! 482: SAVE_I	save	%r26, 0x0001, %r16
	.word 0x839d2000  ! 483: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb9484000  ! 484: RDHPR_HTSTATE	rdhpr	%htstate, %r28
hwintr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_133), 16, 16)) -> intp(1, 0, 39)
	.word 0x01000000  ! 485: NOP	nop
	.word 0xa1504000  ! 486: RDPR_TNPC	<illegal instruction>
	.word 0x83946000  ! 487: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa7e4a000  ! 488: SAVE_I	save	%r18, 0x0001, %r19
	.word 0xb550c000  ! 489: RDPR_TT	<illegal instruction>
	.word 0xabe5a000  ! 490: SAVE_I	save	%r22, 0x0001, %r21
	.word 0x87976000  ! 491: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa9508000  ! 492: RDPR_TSTATE	<illegal instruction>
hwintr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_134), 16, 16)) -> intp(1, 0, 30)
	.word 0x01000000  ! 493: NOP	nop
	.word 0xa7500000  ! 494: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 495: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8396a000  ! 496: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbbe76000  ! 497: SAVE_I	save	%r29, 0x0001, %r29
	.word 0xabe76000  ! 498: SAVE_I	save	%r29, 0x0001, %r21
	.word 0xbf484000  ! 499: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0x81952000  ! 500: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa3e7a000  ! 501: SAVE_I	save	%r30, 0x0001, %r17
	.word 0xa3e66000  ! 502: SAVE_I	save	%r25, 0x0001, %r17
	.word 0xab50c000  ! 503: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 504: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 505: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 506: RDPR_TNPC	<illegal instruction>
hwintr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_135), 16, 16)) -> intp(1, 0, 20)
	.word 0x01000000  ! 507: NOP	nop
	.word 0x83972000  ! 508: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x839e6000  ! 509: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb1e7e000  ! 510: SAVE_I	save	%r31, 0x0001, %r24
	.word 0xaf50c000  ! 511: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 512: RDPR_TSTATE	<illegal instruction>
	.word 0x8196a000  ! 513: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3e46000  ! 514: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xa1508000  ! 515: RDPR_TSTATE	<illegal instruction>
	.word 0x839e6000  ! 516: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xbde7a000  ! 517: SAVE_I	save	%r30, 0x0001, %r30
	.word 0xabe7e000  ! 518: SAVE_I	save	%r31, 0x0001, %r21
	.word 0xa1500000  ! 519: RDPR_TPC	<illegal instruction>
hwintr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_136), 16, 16)) -> intp(1, 0, 34)
	.word 0x01000000  ! 520: NOP	nop
hwintr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_137), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 521: NOP	nop
	.word 0x8597a000  ! 522: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8396a000  ! 523: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
hwintr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_138), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 524: NOP	nop
	.word 0xa5500000  ! 525: RDPR_TPC	<illegal instruction>
hwintr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_139), 16, 16)) -> intp(1, 0, 15)
	.word 0x01000000  ! 526: NOP	nop
	.word 0x8396a000  ! 527: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x83956000  ! 528: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
hwintr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_140), 16, 16)) -> intp(1, 0, 15)
	.word 0x01000000  ! 529: NOP	nop
	.word 0x839ee000  ! 530: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb3504000  ! 531: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 532: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb3e76000  ! 533: SAVE_I	save	%r29, 0x0001, %r25
	.word 0xb7484000  ! 534: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xbde5a000  ! 535: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e66000  ! 536: SAVE_I	save	%r25, 0x0001, %r25
	.word 0xbb484000  ! 537: RDHPR_HTSTATE	rdhpr	%htstate, %r29
hwintr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_141), 16, 16)) -> intp(1, 0, 20)
	.word 0x01000000  ! 538: NOP	nop
	.word 0x83976000  ! 539: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa7e52000  ! 540: SAVE_I	save	%r20, 0x0001, %r19
	.word 0x839c6000  ! 541: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb7504000  ! 542: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 543: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb7e62000  ! 544: SAVE_I	save	%r24, 0x0001, %r27
hwintr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_142), 16, 16)) -> intp(1, 0, 10)
	.word 0x01000000  ! 545: NOP	nop
	.word 0xade62000  ! 546: SAVE_I	save	%r24, 0x0001, %r22
hwintr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_143), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 547: NOP	nop
	.word 0xbd508000  ! 548: RDPR_TSTATE	<illegal instruction>
	.word 0x839d2000  ! 549: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xbf500000  ! 550: RDPR_TPC	<illegal instruction>
hwintr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_144), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 551: NOP	nop
hwintr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_145), 16, 16)) -> intp(1, 0, 1b)
	.word 0x01000000  ! 552: NOP	nop
	.word 0x83956000  ! 553: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
hwintr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_146), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 554: NOP	nop
hwintr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_147), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 555: NOP	nop
	.word 0xaf50c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 557: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 558: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
hwintr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_148), 16, 16)) -> intp(1, 0, 1)
	.word 0x01000000  ! 559: NOP	nop
hwintr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_149), 16, 16)) -> intp(1, 0, 27)
	.word 0x01000000  ! 560: NOP	nop
	.word 0xa1e66000  ! 561: SAVE_I	save	%r25, 0x0001, %r16
	.word 0xb9e72000  ! 562: SAVE_I	save	%r28, 0x0001, %r28
	.word 0xa3500000  ! 563: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 564: RDPR_TPC	<illegal instruction>
	.word 0xb9e62000  ! 565: SAVE_I	save	%r24, 0x0001, %r28
	.word 0xaf484000  ! 566: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa9508000  ! 567: RDPR_TSTATE	<illegal instruction>
	.word 0x85946000  ! 568: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb5e4e000  ! 569: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xa1504000  ! 570: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 571: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb7508000  ! 572: RDPR_TSTATE	<illegal instruction>
hwintr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_150), 16, 16)) -> intp(1, 0, 1f)
	.word 0x01000000  ! 573: NOP	nop
	.word 0xad504000  ! 574: RDPR_TNPC	<illegal instruction>
	.word 0xa5e4a000  ! 575: SAVE_I	save	%r18, 0x0001, %r18
	.word 0xa9484000  ! 576: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xb3484000  ! 577: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xb350c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 579: RDPR_TT	<illegal instruction>
	.word 0xade7e000  ! 580: SAVE_I	save	%r31, 0x0001, %r22
	.word 0xbb508000  ! 581: RDPR_TSTATE	<illegal instruction>
	.word 0x83946000  ! 582: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa1e76000  ! 583: SAVE_I	save	%r29, 0x0001, %r16
	.word 0xa7504000  ! 584: RDPR_TNPC	<illegal instruction>
	.word 0x8197e000  ! 585: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x85972000  ! 586: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x839fa000  ! 587: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8196a000  ! 588: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
hwintr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_151), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 589: NOP	nop
	.word 0xbf500000  ! 590: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 591: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x81972000  ! 592: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xafe6a000  ! 593: SAVE_I	save	%r26, 0x0001, %r23
	.word 0xbfe7e000  ! 594: SAVE_I	save	%r31, 0x0001, %r31
	.word 0x8195a000  ! 595: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
hwintr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_152), 16, 16)) -> intp(1, 0, 17)
	.word 0x01000000  ! 596: NOP	nop
	.word 0xad508000  ! 597: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe6a000  ! 598: SAVE_I	save	%r26, 0x0001, %r31
	.word 0xa3500000  ! 599: RDPR_TPC	<illegal instruction>
hwintr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_153), 16, 16)) -> intp(1, 0, 3c)
	.word 0x01000000  ! 600: NOP	nop
	.word 0xafe56000  ! 601: SAVE_I	save	%r21, 0x0001, %r23
	.word 0xa1484000  ! 602: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x83952000  ! 603: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8396a000  ! 604: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8394a000  ! 605: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8796e000  ! 606: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa1e6e000  ! 607: SAVE_I	save	%r27, 0x0001, %r16
	.word 0xa7e42000  ! 608: SAVE_I	save	%r16, 0x0001, %r19
	.word 0xb5e6a000  ! 609: SAVE_I	save	%r26, 0x0001, %r26
	.word 0x81976000  ! 610: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
hwintr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_154), 16, 16)) -> intp(1, 0, 3c)
	.word 0x01000000  ! 611: NOP	nop
	.word 0x83976000  ! 612: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbd504000  ! 613: RDPR_TNPC	<illegal instruction>
	.word 0x839c6000  ! 614: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839f6000  ! 615: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
hwintr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_155), 16, 16)) -> intp(1, 0, 24)
	.word 0x01000000  ! 616: NOP	nop
	.word 0x8594e000  ! 617: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x87952000  ! 618: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
hwintr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_156), 16, 16)) -> intp(1, 0, 28)
	.word 0x01000000  ! 619: NOP	nop
hwintr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_157), 16, 16)) -> intp(1, 0, 23)
	.word 0x01000000  ! 620: NOP	nop
	.word 0xb1e52000  ! 621: SAVE_I	save	%r20, 0x0001, %r24
hwintr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_158), 16, 16)) -> intp(1, 0, 12)
	.word 0x01000000  ! 622: NOP	nop
	.word 0x8196a000  ! 623: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3508000  ! 624: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 625: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8195a000  ! 626: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xaf504000  ! 627: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 628: RDPR_TT	<illegal instruction>
	.word 0x8197e000  ! 629: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xade46000  ! 630: SAVE_I	save	%r17, 0x0001, %r22
	.word 0xa3504000  ! 631: RDPR_TNPC	<illegal instruction>
	.word 0xa7e6a000  ! 632: SAVE_I	save	%r26, 0x0001, %r19
	.word 0xad504000  ! 633: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 634: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xad508000  ! 635: RDPR_TSTATE	<illegal instruction>
	.word 0x8394a000  ! 636: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb5e52000  ! 637: SAVE_I	save	%r20, 0x0001, %r26
hwintr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_159), 16, 16)) -> intp(1, 0, 2f)
	.word 0x01000000  ! 638: NOP	nop
	.word 0x87976000  ! 639: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_160), 16, 16)) -> intp(1, 0, 3e)
	.word 0x01000000  ! 640: NOP	nop
	.word 0xa9500000  ! 641: RDPR_TPC	<illegal instruction>
	.word 0xb7e6a000  ! 642: SAVE_I	save	%r26, 0x0001, %r27
	.word 0xb1504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 644: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa9e76000  ! 645: SAVE_I	save	%r29, 0x0001, %r20
	.word 0xb5484000  ! 646: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xab484000  ! 647: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa1508000  ! 648: RDPR_TSTATE	<illegal instruction>
	.word 0x8796e000  ! 649: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa3e4e000  ! 650: SAVE_I	save	%r19, 0x0001, %r17
hwintr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_161), 16, 16)) -> intp(1, 0, 2d)
	.word 0x01000000  ! 651: NOP	nop
	.word 0xa5e5e000  ! 652: SAVE_I	save	%r23, 0x0001, %r18
	.word 0xb5e7a000  ! 653: SAVE_I	save	%r30, 0x0001, %r26
	.word 0x839fa000  ! 654: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb9e6a000  ! 655: SAVE_I	save	%r26, 0x0001, %r28
	.word 0xa7e52000  ! 656: SAVE_I	save	%r20, 0x0001, %r19
	.word 0xbf504000  ! 657: RDPR_TNPC	<illegal instruction>
	.word 0xbd484000  ! 658: RDHPR_HTSTATE	rdhpr	%htstate, %r30
hwintr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_162), 16, 16)) -> intp(1, 0, 0)
	.word 0x01000000  ! 659: NOP	nop
hwintr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_163), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 660: NOP	nop
	.word 0xb3e5a000  ! 661: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8796a000  ! 662: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa3504000  ! 663: RDPR_TNPC	<illegal instruction>
hwintr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_164), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 664: NOP	nop
hwintr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_165), 16, 16)) -> intp(1, 0, 39)
	.word 0x01000000  ! 665: NOP	nop
	.word 0xa9508000  ! 666: RDPR_TSTATE	<illegal instruction>
	.word 0xa1504000  ! 667: RDPR_TNPC	<illegal instruction>
hwintr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_166), 16, 16)) -> intp(1, 0, 3)
	.word 0x01000000  ! 668: NOP	nop
	.word 0x8396a000  ! 669: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
hwintr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_167), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 670: NOP	nop
	.word 0xa3508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0x87956000  ! 672: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa5e72000  ! 673: SAVE_I	save	%r28, 0x0001, %r18
	.word 0x87956000  ! 674: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xa1e46000  ! 675: SAVE_I	save	%r17, 0x0001, %r16
	.word 0xb3484000  ! 676: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xa3e46000  ! 677: SAVE_I	save	%r17, 0x0001, %r17
	.word 0xb5e5e000  ! 678: SAVE_I	save	%r23, 0x0001, %r26
hwintr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_168), 16, 16)) -> intp(1, 0, 2f)
	.word 0x01000000  ! 679: NOP	nop
	.word 0xb7500000  ! 680: RDPR_TPC	<illegal instruction>
	.word 0xb7e7e000  ! 681: SAVE_I	save	%r31, 0x0001, %r27
	.word 0x839ca000  ! 682: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8595e000  ! 683: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xaf504000  ! 684: RDPR_TNPC	<illegal instruction>
	.word 0xb9e7e000  ! 685: SAVE_I	save	%r31, 0x0001, %r28
hwintr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_169), 16, 16)) -> intp(1, 0, 21)
	.word 0x01000000  ! 686: NOP	nop
	.word 0xa1e46000  ! 687: SAVE_I	save	%r17, 0x0001, %r16
	.word 0x839e6000  ! 688: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb550c000  ! 689: RDPR_TT	<illegal instruction>
	.word 0xad484000  ! 690: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x8395a000  ! 691: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x839d6000  ! 692: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xb5e72000  ! 693: SAVE_I	save	%r28, 0x0001, %r26
	.word 0xbde6a000  ! 694: SAVE_I	save	%r26, 0x0001, %r30
	.word 0xb7e72000  ! 695: SAVE_I	save	%r28, 0x0001, %r27
hwintr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_170), 16, 16)) -> intp(1, 0, 3)
	.word 0x01000000  ! 696: NOP	nop
	.word 0xb7e7a000  ! 697: SAVE_I	save	%r30, 0x0001, %r27
hwintr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_171), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 698: NOP	nop
	.word 0xbbe62000  ! 699: SAVE_I	save	%r24, 0x0001, %r29
	.word 0xb550c000  ! 700: RDPR_TT	<illegal instruction>
	.word 0x839f2000  ! 701: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xb5e72000  ! 702: SAVE_I	save	%r28, 0x0001, %r26
	.word 0xbf500000  ! 703: RDPR_TPC	<illegal instruction>
hwintr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_172), 16, 16)) -> intp(1, 0, 2a)
	.word 0x01000000  ! 704: NOP	nop
	.word 0xbb500000  ! 705: RDPR_TPC	<illegal instruction>
hwintr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_173), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 706: NOP	nop
	.word 0xbfe6a000  ! 707: SAVE_I	save	%r26, 0x0001, %r31
	.word 0x8794e000  ! 708: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb550c000  ! 709: RDPR_TT	<illegal instruction>
	.word 0xbfe42000  ! 710: SAVE_I	save	%r16, 0x0001, %r31
hwintr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_174), 16, 16)) -> intp(1, 0, 1)
	.word 0x01000000  ! 711: NOP	nop
	.word 0x8397a000  ! 712: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
hwintr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_175), 16, 16)) -> intp(1, 0, 39)
	.word 0x01000000  ! 713: NOP	nop
	.word 0xa3e6a000  ! 714: SAVE_I	save	%r26, 0x0001, %r17
hwintr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_176), 16, 16)) -> intp(1, 0, 30)
	.word 0x01000000  ! 715: NOP	nop
	.word 0x8795a000  ! 716: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
hwintr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_177), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 717: NOP	nop
	.word 0x87946000  ! 718: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839da000  ! 719: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xafe42000  ! 720: SAVE_I	save	%r16, 0x0001, %r23
	.word 0xa7504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0xa7e66000  ! 722: SAVE_I	save	%r25, 0x0001, %r19
	.word 0xb3500000  ! 723: RDPR_TPC	<illegal instruction>
	.word 0xad484000  ! 724: RDHPR_HTSTATE	rdhpr	%htstate, %r22
hwintr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_178), 16, 16)) -> intp(1, 0, 24)
	.word 0x01000000  ! 725: NOP	nop
hwintr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_179), 16, 16)) -> intp(1, 0, 13)
	.word 0x01000000  ! 726: NOP	nop
	.word 0xb5504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 728: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 729: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x81946000  ! 730: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x85952000  ! 731: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xade46000  ! 732: SAVE_I	save	%r17, 0x0001, %r22
	.word 0xbbe72000  ! 733: SAVE_I	save	%r28, 0x0001, %r29
	.word 0x81972000  ! 734: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x83966000  ! 735: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8394e000  ! 736: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
hwintr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_180), 16, 16)) -> intp(1, 0, 0)
	.word 0x01000000  ! 737: NOP	nop
	.word 0xbde4e000  ! 738: SAVE_I	save	%r19, 0x0001, %r30
hwintr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_181), 16, 16)) -> intp(1, 0, 3e)
	.word 0x01000000  ! 739: NOP	nop
hwintr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_182), 16, 16)) -> intp(1, 0, 1d)
	.word 0x01000000  ! 740: NOP	nop
	.word 0x81956000  ! 741: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839d2000  ! 742: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x87946000  ! 743: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_183), 16, 16)) -> intp(1, 0, 5)
	.word 0x01000000  ! 744: NOP	nop
	.word 0xaf500000  ! 745: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 746: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x83942000  ! 747: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x83956000  ! 748: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb950c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 750: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb3e6a000  ! 751: SAVE_I	save	%r26, 0x0001, %r25
	.word 0xbfe62000  ! 752: SAVE_I	save	%r24, 0x0001, %r31
	.word 0x85942000  ! 753: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb3500000  ! 754: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 755: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
hwintr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_184), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 756: NOP	nop
	.word 0xb7508000  ! 757: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 758: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
hwintr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_185), 16, 16)) -> intp(1, 0, 3e)
	.word 0x01000000  ! 759: NOP	nop
	.word 0x85972000  ! 760: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbfe46000  ! 761: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8397e000  ! 762: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa3e42000  ! 763: SAVE_I	save	%r16, 0x0001, %r17
	.word 0xa5e4a000  ! 764: SAVE_I	save	%r18, 0x0001, %r18
hwintr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_186), 16, 16)) -> intp(1, 0, f)
	.word 0x01000000  ! 765: NOP	nop
hwintr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_187), 16, 16)) -> intp(1, 0, 3e)
	.word 0x01000000  ! 766: NOP	nop
	.word 0xafe72000  ! 767: SAVE_I	save	%r28, 0x0001, %r23
	.word 0xb3e42000  ! 768: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbf508000  ! 769: RDPR_TSTATE	<illegal instruction>
	.word 0xa5e4e000  ! 770: SAVE_I	save	%r19, 0x0001, %r18
hwintr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_188), 16, 16)) -> intp(1, 0, 34)
	.word 0x01000000  ! 771: NOP	nop
	.word 0x8794a000  ! 772: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xaf50c000  ! 773: RDPR_TT	<illegal instruction>
hwintr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_189), 16, 16)) -> intp(1, 0, 22)
	.word 0x01000000  ! 774: NOP	nop
	.word 0xa9e7a000  ! 775: SAVE_I	save	%r30, 0x0001, %r20
	.word 0xb3e6e000  ! 776: SAVE_I	save	%r27, 0x0001, %r25
	.word 0xb5e56000  ! 777: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xa9e4e000  ! 778: SAVE_I	save	%r19, 0x0001, %r20
	.word 0x8597a000  ! 779: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8197e000  ! 780: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
hwintr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_190), 16, 16)) -> intp(1, 0, 36)
	.word 0x01000000  ! 781: NOP	nop
	.word 0x839d2000  ! 782: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xa3e72000  ! 783: SAVE_I	save	%r28, 0x0001, %r17
hwintr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_191), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 784: NOP	nop
	.word 0x839e2000  ! 785: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa9e52000  ! 786: SAVE_I	save	%r20, 0x0001, %r20
hwintr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_192), 16, 16)) -> intp(1, 0, 22)
	.word 0x01000000  ! 787: NOP	nop
	.word 0xbf50c000  ! 788: RDPR_TT	<illegal instruction>
	.word 0xb1484000  ! 789: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xab50c000  ! 790: RDPR_TT	<illegal instruction>
	.word 0xade42000  ! 791: SAVE_I	save	%r16, 0x0001, %r22
	.word 0xa9e46000  ! 792: SAVE_I	save	%r17, 0x0001, %r20
	.word 0x83946000  ! 793: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb1508000  ! 794: RDPR_TSTATE	<illegal instruction>
hwintr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_193), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 795: NOP	nop
	.word 0xab500000  ! 796: RDPR_TPC	<illegal instruction>
hwintr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_194), 16, 16)) -> intp(1, 0, 18)
	.word 0x01000000  ! 797: NOP	nop
	.word 0x8397a000  ! 798: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa3e6e000  ! 799: SAVE_I	save	%r27, 0x0001, %r17
	.word 0xa5504000  ! 800: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 801: RDPR_TPC	<illegal instruction>
	.word 0xa9e56000  ! 802: SAVE_I	save	%r21, 0x0001, %r20
hwintr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_195), 16, 16)) -> intp(1, 0, 11)
	.word 0x01000000  ! 803: NOP	nop
	.word 0x839da000  ! 804: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
hwintr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_196), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 805: NOP	nop
	.word 0xb5e6a000  ! 806: SAVE_I	save	%r26, 0x0001, %r26
	.word 0xa5e7e000  ! 807: SAVE_I	save	%r31, 0x0001, %r18
hwintr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_197), 16, 16)) -> intp(1, 0, 27)
	.word 0x01000000  ! 808: NOP	nop
hwintr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_198), 16, 16)) -> intp(1, 0, 7)
	.word 0x01000000  ! 809: NOP	nop
	.word 0xafe56000  ! 810: SAVE_I	save	%r21, 0x0001, %r23
hwintr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_199), 16, 16)) -> intp(1, 0, a)
	.word 0x01000000  ! 811: NOP	nop
	.word 0xa7e7a000  ! 812: SAVE_I	save	%r30, 0x0001, %r19
hwintr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_200), 16, 16)) -> intp(1, 0, 3b)
	.word 0x01000000  ! 813: NOP	nop
hwintr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_201), 16, 16)) -> intp(1, 0, 2b)
	.word 0x01000000  ! 814: NOP	nop
	.word 0xade5a000  ! 815: SAVE_I	save	%r22, 0x0001, %r22
	.word 0xb5500000  ! 816: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 817: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbfe6e000  ! 818: SAVE_I	save	%r27, 0x0001, %r31
	.word 0xa3500000  ! 819: RDPR_TPC	<illegal instruction>
	.word 0xb7e5e000  ! 820: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4a000  ! 821: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e5e000  ! 822: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x87946000  ! 823: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_202), 16, 16)) -> intp(1, 0, 2f)
	.word 0x01000000  ! 824: NOP	nop
	.word 0x85976000  ! 825: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb5e76000  ! 826: SAVE_I	save	%r29, 0x0001, %r26
hwintr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_203), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 827: NOP	nop
	.word 0x81976000  ! 828: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x839fe000  ! 829: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x83976000  ! 830: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa350c000  ! 831: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 832: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa5e72000  ! 833: SAVE_I	save	%r28, 0x0001, %r18
hwintr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_204), 16, 16)) -> intp(1, 0, 21)
	.word 0x01000000  ! 834: NOP	nop
	.word 0xbbe46000  ! 835: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb550c000  ! 836: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 837: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
hwintr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_205), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 838: NOP	nop
	.word 0xb1e52000  ! 839: SAVE_I	save	%r20, 0x0001, %r24
hwintr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_206), 16, 16)) -> intp(1, 0, 4)
	.word 0x01000000  ! 840: NOP	nop
	.word 0xbd508000  ! 841: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 842: RDPR_TNPC	<illegal instruction>
	.word 0xb7e46000  ! 843: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xab500000  ! 844: RDPR_TPC	<illegal instruction>
hwintr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_207), 16, 16)) -> intp(1, 0, c)
	.word 0x01000000  ! 845: NOP	nop
	.word 0xa7e72000  ! 846: SAVE_I	save	%r28, 0x0001, %r19
	.word 0xb3504000  ! 847: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 848: RDPR_TSTATE	<illegal instruction>
	.word 0x8196e000  ! 849: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
hwintr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_208), 16, 16)) -> intp(1, 0, 2a)
	.word 0x01000000  ! 850: NOP	nop
	.word 0xb150c000  ! 851: RDPR_TT	<illegal instruction>
	.word 0xb7504000  ! 852: RDPR_TNPC	<illegal instruction>
	.word 0xb3e5a000  ! 853: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbb50c000  ! 854: RDPR_TT	<illegal instruction>
	.word 0x8597e000  ! 855: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839ce000  ! 856: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa7e52000  ! 857: SAVE_I	save	%r20, 0x0001, %r19
	.word 0x8194e000  ! 858: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb7500000  ! 859: RDPR_TPC	<illegal instruction>
hwintr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_209), 16, 16)) -> intp(1, 0, 1)
	.word 0x01000000  ! 860: NOP	nop
	.word 0xb3e7a000  ! 861: SAVE_I	save	%r30, 0x0001, %r25
	.word 0x83952000  ! 862: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
hwintr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_210), 16, 16)) -> intp(1, 0, 7)
	.word 0x01000000  ! 863: NOP	nop
hwintr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_211), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 864: NOP	nop
	.word 0xa7504000  ! 865: RDPR_TNPC	<illegal instruction>
	.word 0xabe5a000  ! 866: SAVE_I	save	%r22, 0x0001, %r21
	.word 0x839d2000  ! 867: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb1e7a000  ! 868: SAVE_I	save	%r30, 0x0001, %r24
	.word 0x839fe000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
hwintr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_212), 16, 16)) -> intp(1, 0, 3)
	.word 0x01000000  ! 870: NOP	nop
	.word 0xa5e6a000  ! 871: SAVE_I	save	%r26, 0x0001, %r18
	.word 0xaf508000  ! 872: RDPR_TSTATE	<illegal instruction>
hwintr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_213), 16, 16)) -> intp(1, 0, 27)
	.word 0x01000000  ! 873: NOP	nop
	.word 0xa5504000  ! 874: RDPR_TNPC	<illegal instruction>
	.word 0xad500000  ! 875: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 876: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb5508000  ! 877: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 878: RDPR_TNPC	<illegal instruction>
hwintr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_214), 16, 16)) -> intp(1, 0, 5)
	.word 0x01000000  ! 879: NOP	nop
	.word 0xb3508000  ! 880: RDPR_TSTATE	<illegal instruction>
hwintr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_215), 16, 16)) -> intp(1, 0, 1b)
	.word 0x01000000  ! 881: NOP	nop
hwintr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_216), 16, 16)) -> intp(1, 0, e)
	.word 0x01000000  ! 882: NOP	nop
	.word 0xade52000  ! 883: SAVE_I	save	%r20, 0x0001, %r22
	.word 0xb1500000  ! 884: RDPR_TPC	<illegal instruction>
	.word 0xa3484000  ! 885: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x8194e000  ! 886: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb1e5a000  ! 887: SAVE_I	save	%r22, 0x0001, %r24
hwintr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_217), 16, 16)) -> intp(1, 0, 1d)
	.word 0x01000000  ! 888: NOP	nop
	.word 0xa1500000  ! 889: RDPR_TPC	<illegal instruction>
	.word 0xa3e56000  ! 890: SAVE_I	save	%r21, 0x0001, %r17
	.word 0xb7e72000  ! 891: SAVE_I	save	%r28, 0x0001, %r27
	.word 0xbb508000  ! 892: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe4e000  ! 893: SAVE_I	save	%r19, 0x0001, %r29
hwintr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_218), 16, 16)) -> intp(1, 0, 3f)
	.word 0x01000000  ! 894: NOP	nop
	.word 0xbbe4e000  ! 895: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8195e000  ! 896: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xab500000  ! 897: RDPR_TPC	<illegal instruction>
	.word 0xabe66000  ! 898: SAVE_I	save	%r25, 0x0001, %r21
	.word 0xa7484000  ! 899: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_219), 16, 16)) -> intp(1, 0, 2e)
	.word 0x01000000  ! 900: NOP	nop
	.word 0xa3484000  ! 901: RDHPR_HTSTATE	rdhpr	%htstate, %r17
hwintr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_220), 16, 16)) -> intp(1, 0, 3a)
	.word 0x01000000  ! 902: NOP	nop
	.word 0xbfe6e000  ! 903: SAVE_I	save	%r27, 0x0001, %r31
hwintr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_221), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 904: NOP	nop
	.word 0x8396a000  ! 905: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x83962000  ! 906: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x87946000  ! 907: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
hwintr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_222), 16, 16)) -> intp(1, 0, 33)
	.word 0x01000000  ! 908: NOP	nop
	.word 0xafe42000  ! 909: SAVE_I	save	%r16, 0x0001, %r23
	.word 0x8795a000  ! 910: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x839f6000  ! 911: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x839de000  ! 912: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xa1508000  ! 913: RDPR_TSTATE	<illegal instruction>
	.word 0x87966000  ! 914: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa150c000  ! 915: RDPR_TT	<illegal instruction>
	.word 0xb9e72000  ! 916: SAVE_I	save	%r28, 0x0001, %r28
	.word 0xa9500000  ! 917: RDPR_TPC	<illegal instruction>
hwintr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_223), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 918: NOP	nop
	.word 0xa5e6a000  ! 919: SAVE_I	save	%r26, 0x0001, %r18
	.word 0xb5504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xa1500000  ! 921: RDPR_TPC	<illegal instruction>
hwintr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_224), 16, 16)) -> intp(1, 0, 19)
	.word 0x01000000  ! 922: NOP	nop
	.word 0x85966000  ! 923: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbfe52000  ! 924: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8396e000  ! 925: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xaf484000  ! 926: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xafe6a000  ! 927: SAVE_I	save	%r26, 0x0001, %r23
hwintr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_225), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 928: NOP	nop
hwintr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_226), 16, 16)) -> intp(1, 0, 21)
	.word 0x01000000  ! 929: NOP	nop
	.word 0x8796a000  ! 930: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8797a000  ! 931: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xad50c000  ! 932: RDPR_TT	<illegal instruction>
	.word 0xaf484000  ! 933: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xabe4a000  ! 934: SAVE_I	save	%r18, 0x0001, %r21
hwintr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_227), 16, 16)) -> intp(1, 0, 2a)
	.word 0x01000000  ! 935: NOP	nop
	.word 0x839fa000  ! 936: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
hwintr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_228), 16, 16)) -> intp(1, 0, 8)
	.word 0x01000000  ! 937: NOP	nop
	.word 0x8195e000  ! 938: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa5484000  ! 939: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xab484000  ! 940: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xb7504000  ! 941: RDPR_TNPC	<illegal instruction>
hwintr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_229), 16, 16)) -> intp(1, 0, 16)
	.word 0x01000000  ! 942: NOP	nop
	.word 0x839f6000  ! 943: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x81962000  ! 944: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
hwintr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_230), 16, 16)) -> intp(1, 0, 1c)
	.word 0x01000000  ! 945: NOP	nop
hwintr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_231), 16, 16)) -> intp(1, 0, 14)
	.word 0x01000000  ! 946: NOP	nop
	.word 0xb3e42000  ! 947: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xa5e62000  ! 948: SAVE_I	save	%r24, 0x0001, %r18
	.word 0x8397e000  ! 949: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa9e4a000  ! 950: SAVE_I	save	%r18, 0x0001, %r20
	.word 0x87956000  ! 951: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb9e52000  ! 952: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e66000  ! 953: SAVE_I	save	%r25, 0x0001, %r26
hwintr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_232), 16, 16)) -> intp(1, 0, 34)
	.word 0x01000000  ! 954: NOP	nop
	.word 0x85946000  ! 955: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
hwintr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_233), 16, 16)) -> intp(1, 0, 34)
	.word 0x01000000  ! 956: NOP	nop
	.word 0xa5500000  ! 957: RDPR_TPC	<illegal instruction>
	.word 0xb5e4e000  ! 958: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x83972000  ! 959: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa3484000  ! 960: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x839d2000  ! 961: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xbde66000  ! 962: SAVE_I	save	%r25, 0x0001, %r30
	.word 0x83972000  ! 963: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xab504000  ! 964: RDPR_TNPC	<illegal instruction>
hwintr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_234), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 965: NOP	nop
	.word 0xb9e56000  ! 966: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x81942000  ! 967: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbb504000  ! 968: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 969: RDPR_TNPC	<illegal instruction>
	.word 0xa3e76000  ! 970: SAVE_I	save	%r29, 0x0001, %r17
hwintr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_235), 16, 16)) -> intp(1, 0, 3c)
	.word 0x01000000  ! 971: NOP	nop
hwintr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_236), 16, 16)) -> intp(1, 0, 9)
	.word 0x01000000  ! 972: NOP	nop
hwintr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_237), 16, 16)) -> intp(1, 0, a)
	.word 0x01000000  ! 973: NOP	nop
	.word 0x8197a000  ! 974: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x8195e000  ! 975: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbfe7a000  ! 976: SAVE_I	save	%r30, 0x0001, %r31
	.word 0x839f2000  ! 977: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
hwintr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_238), 16, 16)) -> intp(1, 0, 37)
	.word 0x01000000  ! 978: NOP	nop
	.word 0x81962000  ! 979: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb1484000  ! 980: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xbfe66000  ! 981: SAVE_I	save	%r25, 0x0001, %r31
	.word 0xb5e56000  ! 982: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x83966000  ! 983: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb5e42000  ! 984: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xaf500000  ! 985: RDPR_TPC	<illegal instruction>
	.word 0x87976000  ! 986: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
hwintr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_239), 16, 16)) -> intp(1, 0, 35)
	.word 0x01000000  ! 987: NOP	nop
	.word 0xa1e62000  ! 988: SAVE_I	save	%r24, 0x0001, %r16
hwintr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_240), 16, 16)) -> intp(1, 0, 24)
	.word 0x01000000  ! 989: NOP	nop
	.word 0xbd484000  ! 990: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xabe4a000  ! 991: SAVE_I	save	%r18, 0x0001, %r21
	.word 0x81952000  ! 992: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8797a000  ! 993: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa3508000  ! 994: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 995: RDPR_TSTATE	<illegal instruction>
hwintr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_241), 16, 16)) -> intp(1, 0, 2b)
	.word 0x01000000  ! 996: NOP	nop
	.word 0xa5504000  ! 997: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 998: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)



	ta	T_GOOD_TRAP

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int loop_cnt = 0;
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
!!#   IJ_bind_thread_group("diag.j", 19, th_all,    0xf);
!!# 
!!#   IJ_set_rvar ("diag.j", 21, Rv_intr_vect, "6'brrrrrr");
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 23,"{16}" );
!!#   IJ_set_rvar ("diag.j", 24, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 25, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 27, Rv_rand64, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 29, ijdefault, Ft_Rs1, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 30, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 31, ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 32, ijdefault, Ft_Rd, "{16..31}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 34, th_all, 8, 1, Rv_rand64);
!!# 
!!#   IJ_th_fork("diag.j", 36,0x2, 0x4, 0x8, -1);;
!!# 
!!#   IJ_printf ("diag.j", 38, th_all, "\tta\tT_CHANGE_PRIV\n");
!!#   IJ_printf ("diag.j", 39, th_all, "\twrpr\t%%g0, 1, %%tl\n");
!!#   IJ_printf ("diag.j", 40, th_all, "\twrpr\t%%l0, %%g0, %%tpc\n");
!!#   IJ_printf ("diag.j", 41, th_all, "\twrpr\t%%l0, %%g0, %%tnpc\n");
!!#   IJ_printf ("diag.j", 42, th_all, "\twrpr\t%%l0, %%g0, %%tstate\n");
!!#   IJ_printf ("diag.j", 43, th_all, "\twrpr\t%%l0, %%g0, %%tt\n");
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
!!#   IJ_th_join("diag.j", 49,0xf);
!!#   IJ_th_start ("diag.j", 50,Seq_Start, NULL, 1);
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
!!# 		IJ_generate ("diag.j", 81, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type:
!!# 	write_tsa
!!# 	| read_tsa
!!# 	| spill_trap
!!# 	| hw_intr
!!# ;
!!# 
!!# read_tsa: 
!!# 	tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT 
!!# 	| tRDHPR_HTSTATE
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
!!# spill_trap:
!!# 	tSAVE_I
!!# ;
!!# 
!!# hw_intr: tNOP
!!# 	{
!!#           IJ_printf ("diag.j", 114, th_all, "hwintr_%y_%d:\n", loop_cnt);
!!# 	  IJ_printf ("diag.j", 115, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
!!# 	} ;
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
