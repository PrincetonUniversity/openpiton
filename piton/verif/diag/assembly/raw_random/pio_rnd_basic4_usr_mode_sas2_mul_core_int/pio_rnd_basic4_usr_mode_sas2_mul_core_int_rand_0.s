// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas2_mul_core_int_rand_0.s
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
   random seed:	861844542
   Jal pio_rnd_basic4_usr_mode_sas2_mul_core_int.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define  tmp0 %l0
#define  tmp1 %l1
#define  tmp2 %l2
#define  tmp3 %l3
#define  flagr %g5

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#define H_HT0_Data_Access_Exception_0x30 My_0x30_trap

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x8065a097202a8d6b, %g1, %g0
	setx 0xeb122a53cc2401ad, %g1, %g1
	setx 0xf780ffb594c1c3f5, %g1, %g2
	setx 0xa713fd6b11ab69e1, %g1, %g3
	setx 0xfa2b7f01f0873a90, %g1, %g4
	setx 0x7f68ec05295ea3dd, %g1, %g5
	setx 0x4009ea3725cc5787, %g1, %g6
	setx 0x0c84343789a95863, %g1, %g7
	setx 0xbe02a64900312fb4, %g1, %r16
	setx 0xd6a00a9cf49ef318, %g1, %r17
	setx 0xf9758ff4377e5316, %g1, %r18
	setx 0xefea190028e112f8, %g1, %r19
	setx 0x0c03c8c5638cda76, %g1, %r20
	setx 0x0237a5e3c599db19, %g1, %r21
	setx 0xa2942aff5cb52295, %g1, %r22
	setx 0x22eba6e71846aff0, %g1, %r23
	setx 0x6855bf082b869dd0, %g1, %r24
	setx 0x56c2a935754f7e55, %g1, %r25
	setx 0xb64ae77d7505b104, %g1, %r26
	setx 0xd12098acc67b92dd, %g1, %r27
	setx 0xd7428701d9e05fbf, %g1, %r28
	setx 0xdaa68b0ea77896f8, %g1, %r29
	setx 0x6906bd85fd0b8465, %g1, %r30
	setx 0x2cd7cdfbb625eeab, %g1, %r31
	save
	setx 0x90542f52d35966c1, %g1, %r16
	setx 0xf684203322f9989c, %g1, %r17
	setx 0xe60599de21b2fb80, %g1, %r18
	setx 0x4aa9a882b647df83, %g1, %r19
	setx 0xff27455d9addf35e, %g1, %r20
	setx 0x6d6a5d5f777d18ff, %g1, %r21
	setx 0x7f1e2213628b02f0, %g1, %r22
	setx 0x496e08610954c7b6, %g1, %r23
	setx 0xa3afb8812de3845c, %g1, %r24
	setx 0xbfed0f97354259aa, %g1, %r25
	setx 0xf49b91165c553925, %g1, %r26
	setx 0x74a27c94777c9556, %g1, %r27
	setx 0xe929d0d8e51e543d, %g1, %r28
	setx 0xddcfad6555ab6bf0, %g1, %r29
	setx 0xde63cf1f97fa2ca0, %g1, %r30
	setx 0x69d18f9f87e96b2e, %g1, %r31
	save
	setx 0x5a8b3eb935e7146e, %g1, %r16
	setx 0xb6ce83998f7196b0, %g1, %r17
	setx 0x49980f7c6eda3fd7, %g1, %r18
	setx 0x44fd8c3dc174d86f, %g1, %r19
	setx 0xd30732963c6f49bf, %g1, %r20
	setx 0x4ab99819d6fae343, %g1, %r21
	setx 0x2dae60af9f02264d, %g1, %r22
	setx 0x6734c87b10c95291, %g1, %r23
	setx 0xdea798eadbe0f37c, %g1, %r24
	setx 0x69095156e8030247, %g1, %r25
	setx 0xea55c40d8d1f0e45, %g1, %r26
	setx 0xda2ed4e562c41264, %g1, %r27
	setx 0x633d3a36d2d1ba55, %g1, %r28
	setx 0xd8934e86094b4057, %g1, %r29
	setx 0x6eeba0f4d0e31169, %g1, %r30
	setx 0xa2342ece68f9b704, %g1, %r31
	restore
	mov	0, %r8
	ta	0x30
	mov	0,%g4 
	setx	ncdata_base0, %g1, %g2 
	setx	0x1000, %g1, %g3 
	add	%g2, %g3, %g3 
	! initalize
	setx    ncdata_base1, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	setx 0x7766554433221100, %g1, %g2
	add 0x0, %g0, %g4
	!add 0x0, %g0, %g2
	add 0x020, %g0, %g5
	!setx 0x800e000000, %g1, %g3
	stloop0:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop0
	nop
	! initalize
	setx    user_data_start, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	add 0x040, %g0, %g5
	dstloop6:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne dstloop6
	nop
	! initalize
	setx    ncdata_base0, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g0, %g2
	add 0x040, %g0, %g5
	! FAKE DMA space
	!setx 0x8010000000, %g1, %g3
	stloop1:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop1
	nop
	! initalize
	setx    ncdata_base2, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0x800f000000, %g1, %g3
	stloop2:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop2
	nop
	! initalize
	setx    ncdata_base3, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xc000000000, %g1, %g3
	stloop3:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop3
	nop
	! initalize
	setx    ncdata_base4, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xd000000000, %g1, %g3
	stloop4:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop4
	nop
	! initalize
	setx    ncdata_base5, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xe000000000, %g1, %g3
	stloop5:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop5
	nop
	! initalize
	setx    ncdata_base6, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xf000000000, %g1, %g3
	stloop6:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop6
	nop
	membar 0x40
	wr    %g0, 7, %fprs
	ldda [%g3]ASI_BLK_P, %f0
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x100
	cmp	%o1, 8
	setx	fork_lbl_0_9, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x200
	cmp	%o1, 9
	setx	fork_lbl_0_10, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x400
	cmp	%o1, 10
	setx	fork_lbl_0_11, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x800
	cmp	%o1, 11
	setx	fork_lbl_0_12, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x1000
	cmp	%o1, 12
	setx	fork_lbl_0_13, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2000
	cmp	%o1, 13
	setx	fork_lbl_0_14, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4000
	cmp	%o1, 14
	setx	fork_lbl_0_15, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8000
	cmp	%o1, 15
	setx	fork_lbl_0_16, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10000
	cmp	%o1, 16
	setx	fork_lbl_0_17, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20000
	cmp	%o1, 17
	setx	fork_lbl_0_18, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40000
	cmp	%o1, 18
	setx	fork_lbl_0_19, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80000
	cmp	%o1, 19
	setx	fork_lbl_0_20, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x100000
	cmp	%o1, 20
	setx	fork_lbl_0_21, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x200000
	cmp	%o1, 21
	setx	fork_lbl_0_22, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x400000
	cmp	%o1, 22
	setx	fork_lbl_0_23, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x800000
	cmp	%o1, 23
	setx	fork_lbl_0_24, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x1000000
	cmp	%o1, 24
	setx	fork_lbl_0_25, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2000000
	cmp	%o1, 25
	setx	fork_lbl_0_26, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4000000
	cmp	%o1, 26
	setx	fork_lbl_0_27, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8000000
	cmp	%o1, 27
	setx	fork_lbl_0_28, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10000000
	cmp	%o1, 28
	setx	fork_lbl_0_29, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20000000
	cmp	%o1, 29
	setx	fork_lbl_0_30, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40000000
	cmp	%o1, 30
	setx	fork_lbl_0_31, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80000000
	cmp	%o1, 31
	setx	fork_lbl_0_32, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 32, 16, 16)) -> intp(4, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 40, 16, 16)) -> intp(5, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 48, 16, 16)) -> intp(6, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 56, 16, 16)) -> intp(7, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 64, 16, 16)) -> intp(8, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 72, 16, 16)) -> intp(9, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 80, 16, 16)) -> intp(a, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 88, 16, 16)) -> intp(b, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 96, 16, 16)) -> intp(c, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 104, 16, 16)) -> intp(d, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 112, 16, 16)) -> intp(e, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 120, 16, 16)) -> intp(f, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 128, 16, 16)) -> intp(10, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 136, 16, 16)) -> intp(11, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 144, 16, 16)) -> intp(12, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 152, 16, 16)) -> intp(13, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 160, 16, 16)) -> intp(14, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 168, 16, 16)) -> intp(15, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 176, 16, 16)) -> intp(16, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 184, 16, 16)) -> intp(17, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 192, 16, 16)) -> intp(18, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 200, 16, 16)) -> intp(19, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 208, 16, 16)) -> intp(1a, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 216, 16, 16)) -> intp(1b, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 224, 16, 16)) -> intp(1c, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 232, 16, 16)) -> intp(1d, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 240, 16, 16)) -> intp(1e, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 248, 16, 16)) -> intp(1f, 1, 1)
! Thread sync; stream = 0; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
	.word 0xe0498008  ! 2: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe019a038  ! 5: LDD_I	ldd	[%r6 + 0x0038], %r16
	.word 0xe82a8008  ! 12: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe8234008  ! 16: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xec3ac008  ! 20: STD_R	std	%r22, [%r11 + %r8]
	.word 0xec32a038  ! 21: STH_I	sth	%r22, [%r10 + 0x0038]
	.word 0xe409a038  ! 24: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe0298008  ! 26: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8318008  ! 28: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe451a010  ! 29: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xec4ac008  ! 31: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe4734008  ! 39: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe033a030  ! 42: STH_I	sth	%r16, [%r14 + 0x0030]
	.word 0xe049e010  ! 47: LDSB_I	ldsb	[%r7 + 0x0010], %r16
	.word 0xe8036038  ! 48: LDUW_I	lduw	[%r13 + 0x0038], %r20
	.word 0xe0228008  ! 49: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe0330008  ! 51: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe04ac008  ! 52: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe841e008  ! 53: LDSW_I	ldsw	[%r7 + 0x0008], %r20
	.word 0xe4730008  ! 54: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe021a000  ! 56: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xec228008  ! 57: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe459e028  ! 58: LDX_I	ldx	[%r7 + 0x0028], %r18
	.word 0xe8536018  ! 63: LDSH_I	ldsh	[%r13 + 0x0018], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe032e000  ! 67: STH_I	sth	%r16, [%r11 + 0x0000]
	.word 0xe8236008  ! 70: STW_I	stw	%r20, [%r13 + 0x0008]
	.word 0xec4a8008  ! 72: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xe04ae018  ! 73: LDSB_I	ldsb	[%r11 + 0x0018], %r16
	.word 0xec2b8008  ! 78: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe0134008  ! 84: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe059a028  ! 86: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xe0138008  ! 90: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe409e030  ! 92: LDUB_I	ldub	[%r7 + 0x0030], %r18
	.word 0xe822a020  ! 93: STW_I	stw	%r20, [%r10 + 0x0020]
	.word 0xe8398008  ! 94: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe409a020  ! 99: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xe03b2038  ! 101: STD_I	std	%r16, [%r12 + 0x0038]
	.word 0xe0234008  ! 107: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec3b4008  ! 109: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe8028008  ! 115: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xec72a008  ! 116: STX_I	stx	%r22, [%r10 + 0x0008]
	.word 0xec136010  ! 117: LDUH_I	lduh	[%r13 + 0x0010], %r22
	.word 0xec018008  ! 120: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe04ba028  ! 126: LDSB_I	ldsb	[%r14 + 0x0028], %r16
	.word 0xe471c008  ! 128: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe04ae000  ! 133: LDSB_I	ldsb	[%r11 + 0x0000], %r16
	.word 0xe03b8008  ! 139: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe029e018  ! 140: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe03b8008  ! 141: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe0398008  ! 142: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0230008  ! 145: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe8234008  ! 149: STW_R	stw	%r20, [%r13 + %r8]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe8128008  ! 154: LDUH_R	lduh	[%r10 + %r8], %r20
	.word 0xe0198008  ! 157: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe872a020  ! 159: STX_I	stx	%r20, [%r10 + 0x0020]
	.word 0xec428008  ! 162: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xe0430008  ! 165: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe4728008  ! 167: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe021a010  ! 168: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xe439a008  ! 169: STD_I	std	%r18, [%r6 + 0x0008]
	.word 0xe022a000  ! 172: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe05a8008  ! 178: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe4530008  ! 180: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe03aa020  ! 182: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xe8398008  ! 183: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe0298008  ! 185: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8338008  ! 186: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe0032028  ! 189: LDUW_I	lduw	[%r12 + 0x0028], %r16
	.word 0xe059e038  ! 191: LDX_I	ldx	[%r7 + 0x0038], %r16
	.word 0xe402e018  ! 196: LDUW_I	lduw	[%r11 + 0x0018], %r18
	.word 0xe802e018  ! 197: LDUW_I	lduw	[%r11 + 0x0018], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe8338008  ! 201: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xec0b8008  ! 205: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xe812a000  ! 207: LDUH_I	lduh	[%r10 + 0x0000], %r20
	.word 0xe81b0008  ! 209: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe8318008  ! 211: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe031e038  ! 215: STH_I	sth	%r16, [%r7 + 0x0038]
	.word 0xe471c008  ! 219: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe8332038  ! 221: STH_I	sth	%r20, [%r12 + 0x0038]
	.word 0xe849a018  ! 225: LDSB_I	ldsb	[%r6 + 0x0018], %r20
	.word 0xec71c008  ! 226: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe0032028  ! 228: LDUW_I	lduw	[%r12 + 0x0028], %r16
	.word 0xe0334008  ! 229: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe423a008  ! 232: STW_I	stw	%r18, [%r14 + 0x0008]
	.word 0xe829a028  ! 239: STB_I	stb	%r20, [%r6 + 0x0028]
	.word 0xe071c008  ! 242: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe0034008  ! 253: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe01ac008  ! 255: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe041c008  ! 260: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe071a020  ! 266: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe0230008  ! 267: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xec32a010  ! 269: STH_I	sth	%r22, [%r10 + 0x0010]
	.word 0xe809a020  ! 270: LDUB_I	ldub	[%r6 + 0x0020], %r20
	.word 0xe001c008  ! 275: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xec4b0008  ! 279: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe4230008  ! 281: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe052c008  ! 284: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe4228008  ! 285: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe81b6020  ! 293: LDD_I	ldd	[%r13 + 0x0020], %r20
	.word 0xe011a028  ! 294: LDUH_I	lduh	[%r6 + 0x0028], %r16
! Thread sync; stream = 32; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
	.word 0xe411a038  ! 2: LDUH_I	lduh	[%r6 + 0x0038], %r18
	.word 0xe80a8008  ! 5: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xe4730008  ! 12: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe0218008  ! 16: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe021a010  ! 20: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xec33a020  ! 21: STH_I	sth	%r22, [%r14 + 0x0020]
	.word 0xe0098008  ! 24: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe021a030  ! 26: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xe429a038  ! 28: STB_I	stb	%r18, [%r6 + 0x0038]
	.word 0xec43a020  ! 29: LDSW_I	ldsw	[%r14 + 0x0020], %r22
	.word 0xec5ba018  ! 31: LDX_I	ldx	[%r14 + 0x0018], %r22
	.word 0xec33a008  ! 39: STH_I	sth	%r22, [%r14 + 0x0008]
	.word 0xe42b4008  ! 42: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xec41a018  ! 47: LDSW_I	ldsw	[%r6 + 0x0018], %r22
	.word 0xec136008  ! 48: LDUH_I	lduh	[%r13 + 0x0008], %r22
	.word 0xe039a028  ! 49: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe0234008  ! 51: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe80aa010  ! 52: LDUB_I	ldub	[%r10 + 0x0010], %r20
	.word 0xe0530008  ! 53: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xec39e028  ! 54: STD_I	std	%r22, [%r7 + 0x0028]
	.word 0xe4718008  ! 56: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe071a018  ! 57: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xe05b8008  ! 58: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe00b4008  ! 63: LDUB_R	ldub	[%r13 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe4330008  ! 67: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe0732000  ! 70: STX_I	stx	%r16, [%r12 + 0x0000]
	.word 0xe81b2008  ! 72: LDD_I	ldd	[%r12 + 0x0008], %r20
	.word 0xe042a020  ! 73: LDSW_I	ldsw	[%r10 + 0x0020], %r16
	.word 0xec72c008  ! 78: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe812e030  ! 84: LDUH_I	lduh	[%r11 + 0x0030], %r20
	.word 0xe84ac008  ! 86: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xec03a030  ! 90: LDUW_I	lduw	[%r14 + 0x0030], %r22
	.word 0xe0598008  ! 92: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe831a008  ! 93: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xe42ba000  ! 94: STB_I	stb	%r18, [%r14 + 0x0000]
	.word 0xe41aa028  ! 99: LDD_I	ldd	[%r10 + 0x0028], %r18
	.word 0xe031a020  ! 101: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe82b8008  ! 107: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe8338008  ! 109: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe80ba030  ! 115: LDUB_I	ldub	[%r14 + 0x0030], %r20
	.word 0xe0234008  ! 116: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec01c008  ! 117: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe441c008  ! 120: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe012c008  ! 126: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe839a030  ! 128: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe00ac008  ! 133: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe822a038  ! 139: STW_I	stw	%r20, [%r10 + 0x0038]
	.word 0xe03ae000  ! 140: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xe822c008  ! 141: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe021e008  ! 142: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xe821a028  ! 145: STW_I	stw	%r20, [%r6 + 0x0028]
	.word 0xe02ba028  ! 149: STB_I	stb	%r16, [%r14 + 0x0028]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec0ac008  ! 154: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xe05b4008  ! 157: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe4218008  ! 159: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe04aa010  ! 162: LDSB_I	ldsb	[%r10 + 0x0010], %r16
	.word 0xe811a010  ! 165: LDUH_I	lduh	[%r6 + 0x0010], %r20
	.word 0xe0736010  ! 167: STX_I	stx	%r16, [%r13 + 0x0010]
	.word 0xe82b4008  ! 168: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec23a020  ! 169: STW_I	stw	%r22, [%r14 + 0x0020]
	.word 0xe83ba008  ! 172: STD_I	std	%r20, [%r14 + 0x0008]
	.word 0xe859a020  ! 178: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xe841c008  ! 180: LDSW_R	ldsw	[%r7 + %r8], %r20
	.word 0xec298008  ! 182: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xec39c008  ! 183: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe871a008  ! 185: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xec31e028  ! 186: STH_I	sth	%r22, [%r7 + 0x0028]
	.word 0xec11a000  ! 189: LDUH_I	lduh	[%r6 + 0x0000], %r22
	.word 0xe459c008  ! 191: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xe4118008  ! 196: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe011e010  ! 197: LDUH_I	lduh	[%r7 + 0x0010], %r16
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe02ba030  ! 201: STB_I	stb	%r16, [%r14 + 0x0030]
	.word 0xec19e028  ! 205: LDD_I	ldd	[%r7 + 0x0028], %r22
	.word 0xe041a018  ! 207: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xec538008  ! 209: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe0230008  ! 211: STW_R	stw	%r16, [%r12 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe03ac008  ! 215: STD_R	std	%r16, [%r11 + %r8]
	.word 0xec21c008  ! 219: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe0298008  ! 221: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe44ba010  ! 225: LDSB_I	ldsb	[%r14 + 0x0010], %r18
	.word 0xe071a008  ! 226: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xec02c008  ! 228: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xec730008  ! 229: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe02ba028  ! 232: STB_I	stb	%r16, [%r14 + 0x0028]
	.word 0xec730008  ! 239: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe0318008  ! 242: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe409c008  ! 253: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe051a028  ! 255: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xe009a000  ! 260: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe072a008  ! 266: STX_I	stx	%r16, [%r10 + 0x0008]
	.word 0xec332038  ! 267: STH_I	sth	%r22, [%r12 + 0x0038]
	.word 0xe43ac008  ! 269: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe409c008  ! 270: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe812a030  ! 275: LDUH_I	lduh	[%r10 + 0x0030], %r20
	.word 0xe819c008  ! 279: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xec22c008  ! 281: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe00b8008  ! 284: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe83ae038  ! 285: STD_I	std	%r20, [%r11 + 0x0038]
	.word 0xe0434008  ! 293: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe001c008  ! 294: LDUW_R	lduw	[%r7 + %r8], %r16
! Thread sync; stream = 31; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
	.word 0xe80b2030  ! 2: LDUB_I	ldub	[%r12 + 0x0030], %r20
	.word 0xe8034008  ! 5: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe82ac008  ! 12: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe422a020  ! 16: STW_I	stw	%r18, [%r10 + 0x0020]
	.word 0xe871e018  ! 20: STX_I	stx	%r20, [%r7 + 0x0018]
	.word 0xe029e028  ! 21: STB_I	stb	%r16, [%r7 + 0x0028]
	.word 0xe0030008  ! 24: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe029c008  ! 26: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe8318008  ! 28: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe052a018  ! 29: LDSH_I	ldsh	[%r10 + 0x0018], %r16
	.word 0xec13a018  ! 31: LDUH_I	lduh	[%r14 + 0x0018], %r22
	.word 0xe8718008  ! 39: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0734008  ! 42: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe042e028  ! 47: LDSW_I	ldsw	[%r11 + 0x0028], %r16
	.word 0xe059c008  ! 48: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe072a030  ! 49: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xe023a038  ! 51: STW_I	stw	%r16, [%r14 + 0x0038]
	.word 0xe8598008  ! 52: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe84ae020  ! 53: LDSB_I	ldsb	[%r11 + 0x0020], %r20
	.word 0xe431e010  ! 54: STH_I	sth	%r18, [%r7 + 0x0010]
	.word 0xe872c008  ! 56: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xe071c008  ! 57: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe042c008  ! 58: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xec538008  ! 63: LDSH_R	ldsh	[%r14 + %r8], %r22
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec718008  ! 67: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xec32a018  ! 70: STH_I	sth	%r22, [%r10 + 0x0018]
	.word 0xe8098008  ! 72: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe0132038  ! 73: LDUH_I	lduh	[%r12 + 0x0038], %r16
	.word 0xe4218008  ! 78: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe452e038  ! 84: LDSH_I	ldsh	[%r11 + 0x0038], %r18
	.word 0xe8538008  ! 86: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe8134008  ! 90: LDUH_R	lduh	[%r13 + %r8], %r20
	.word 0xe01ae028  ! 92: LDD_I	ldd	[%r11 + 0x0028], %r16
	.word 0xe021a028  ! 93: STW_I	stw	%r16, [%r6 + 0x0028]
	.word 0xe82aa008  ! 94: STB_I	stb	%r20, [%r10 + 0x0008]
	.word 0xec5b0008  ! 99: LDX_R	ldx	[%r12 + %r8], %r22
	.word 0xe82b4008  ! 101: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec328008  ! 107: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe43b4008  ! 109: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe051a000  ! 115: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xec22c008  ! 116: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe0128008  ! 117: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe0018008  ! 120: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe0036000  ! 126: LDUW_I	lduw	[%r13 + 0x0000], %r16
	.word 0xe4328008  ! 128: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe449a038  ! 133: LDSB_I	ldsb	[%r6 + 0x0038], %r18
	.word 0xe42a8008  ! 139: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe4238008  ! 140: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe072a018  ! 141: STX_I	stx	%r16, [%r10 + 0x0018]
	.word 0xe031e020  ! 142: STH_I	sth	%r16, [%r7 + 0x0020]
	.word 0xe021a020  ! 145: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xec22e008  ! 149: STW_I	stw	%r22, [%r11 + 0x0008]
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe0518008  ! 154: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe841e010  ! 157: LDSW_I	ldsw	[%r7 + 0x0010], %r20
	.word 0xe82b4008  ! 159: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe0428008  ! 162: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe001e010  ! 165: LDUW_I	lduw	[%r7 + 0x0010], %r16
	.word 0xe03ac008  ! 167: STD_R	std	%r16, [%r11 + %r8]
	.word 0xec318008  ! 168: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec398008  ! 169: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe02b4008  ! 172: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe8498008  ! 178: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xec098008  ! 180: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe431e010  ! 182: STH_I	sth	%r18, [%r7 + 0x0010]
	.word 0xe43b6028  ! 183: STD_I	std	%r18, [%r13 + 0x0028]
	.word 0xe072a008  ! 185: STX_I	stx	%r16, [%r10 + 0x0008]
	.word 0xec2aa018  ! 186: STB_I	stb	%r22, [%r10 + 0x0018]
	.word 0xe01ae038  ! 189: LDD_I	ldd	[%r11 + 0x0038], %r16
	.word 0xe0118008  ! 191: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xec52e000  ! 196: LDSH_I	ldsh	[%r11 + 0x0000], %r22
	.word 0xec52c008  ! 197: LDSH_R	ldsh	[%r11 + %r8], %r22
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe871a028  ! 201: STX_I	stx	%r20, [%r6 + 0x0028]
	.word 0xe4098008  ! 205: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe05a8008  ! 207: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe0028008  ! 209: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe031a010  ! 211: STH_I	sth	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe0398008  ! 215: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe471c008  ! 219: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xec3b0008  ! 221: STD_R	std	%r22, [%r12 + %r8]
	.word 0xec418008  ! 225: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xec2aa038  ! 226: STB_I	stb	%r22, [%r10 + 0x0038]
	.word 0xe041e028  ! 228: LDSW_I	ldsw	[%r7 + 0x0028], %r16
	.word 0xe03aa010  ! 229: STD_I	std	%r16, [%r10 + 0x0010]
	.word 0xe821c008  ! 232: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe4730008  ! 239: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe03ae018  ! 242: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xe85b8008  ! 253: LDX_R	ldx	[%r14 + %r8], %r20
	.word 0xe00ba008  ! 255: LDUB_I	ldub	[%r14 + 0x0008], %r16
	.word 0xec028008  ! 260: LDUW_R	lduw	[%r10 + %r8], %r22
	.word 0xec32c008  ! 266: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xec72c008  ! 267: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe8318008  ! 269: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec41c008  ! 270: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe05a8008  ! 275: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xec018008  ! 279: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xec21a038  ! 281: STW_I	stw	%r22, [%r6 + 0x0038]
	.word 0xe419a010  ! 284: LDD_I	ldd	[%r6 + 0x0010], %r18
	.word 0xe42b4008  ! 285: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe0138008  ! 293: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec4b2008  ! 294: LDSB_I	ldsb	[%r12 + 0x0008], %r22
! Thread sync; stream = 30; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
	.word 0xec128008  ! 2: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe00aa018  ! 5: LDUB_I	ldub	[%r10 + 0x0018], %r16
	.word 0xe0338008  ! 12: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xec73a018  ! 16: STX_I	stx	%r22, [%r14 + 0x0018]
	.word 0xec3b6020  ! 20: STD_I	std	%r22, [%r13 + 0x0020]
	.word 0xec32c008  ! 21: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xec09a008  ! 24: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xe073a000  ! 26: STX_I	stx	%r16, [%r14 + 0x0000]
	.word 0xe071c008  ! 28: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe8498008  ! 29: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xec19c008  ! 31: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xe839e000  ! 39: STD_I	std	%r20, [%r7 + 0x0000]
	.word 0xe039a038  ! 42: STD_I	std	%r16, [%r6 + 0x0038]
	.word 0xe40ba000  ! 47: LDUB_I	ldub	[%r14 + 0x0000], %r18
	.word 0xe051a038  ! 48: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xec39a038  ! 49: STD_I	std	%r22, [%r6 + 0x0038]
	.word 0xe82b8008  ! 51: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe01ac008  ! 52: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xec198008  ! 53: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe429a018  ! 54: STB_I	stb	%r18, [%r6 + 0x0018]
	.word 0xec330008  ! 56: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe033a010  ! 57: STH_I	sth	%r16, [%r14 + 0x0010]
	.word 0xe052e018  ! 58: LDSH_I	ldsh	[%r11 + 0x0018], %r16
	.word 0xec518008  ! 63: LDSH_R	ldsh	[%r6 + %r8], %r22
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec22e000  ! 67: STW_I	stw	%r22, [%r11 + 0x0000]
	.word 0xe023a030  ! 70: STW_I	stw	%r16, [%r14 + 0x0030]
	.word 0xe0030008  ! 72: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe049a030  ! 73: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xe0330008  ! 78: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe05b2008  ! 84: LDX_I	ldx	[%r12 + 0x0008], %r16
	.word 0xe4118008  ! 86: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe059c008  ! 90: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xec018008  ! 92: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe021a038  ! 93: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe02b0008  ! 94: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe811a000  ! 99: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xe0332018  ! 101: STH_I	sth	%r16, [%r12 + 0x0018]
	.word 0xe021c008  ! 107: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe4734008  ! 109: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe01b2018  ! 115: LDD_I	ldd	[%r12 + 0x0018], %r16
	.word 0xe83ae008  ! 116: STD_I	std	%r20, [%r11 + 0x0008]
	.word 0xe049c008  ! 117: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe009a008  ! 120: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xe0418008  ! 126: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe039a010  ! 128: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe05a8008  ! 133: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe422e018  ! 139: STW_I	stw	%r18, [%r11 + 0x0018]
	.word 0xe829a030  ! 140: STB_I	stb	%r20, [%r6 + 0x0030]
	.word 0xec72a008  ! 141: STX_I	stx	%r22, [%r10 + 0x0008]
	.word 0xec3ac008  ! 142: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe0218008  ! 145: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec2b2020  ! 149: STB_I	stb	%r22, [%r12 + 0x0020]
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe0538008  ! 154: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xec01c008  ! 157: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe4718008  ! 159: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe0436010  ! 162: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	.word 0xe01b4008  ! 165: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe4330008  ! 167: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe0734008  ! 168: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe4738008  ! 169: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xec2b4008  ! 172: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xec43a010  ! 178: LDSW_I	ldsw	[%r14 + 0x0010], %r22
	.word 0xe8418008  ! 180: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe4230008  ! 182: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe072e030  ! 183: STX_I	stx	%r16, [%r11 + 0x0030]
	.word 0xe0336038  ! 185: STH_I	sth	%r16, [%r13 + 0x0038]
	.word 0xec71a000  ! 186: STX_I	stx	%r22, [%r6 + 0x0000]
	.word 0xe452c008  ! 189: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xe853a020  ! 191: LDSH_I	ldsh	[%r14 + 0x0020], %r20
	.word 0xe41b6018  ! 196: LDD_I	ldd	[%r13 + 0x0018], %r18
	.word 0xe01b0008  ! 197: LDD_R	ldd	[%r12 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe0738008  ! 201: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0532008  ! 205: LDSH_I	ldsh	[%r12 + 0x0008], %r16
	.word 0xe4098008  ! 207: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe841a000  ! 209: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	.word 0xec718008  ! 211: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe023a010  ! 215: STW_I	stw	%r16, [%r14 + 0x0010]
	.word 0xe03b6010  ! 219: STD_I	std	%r16, [%r13 + 0x0010]
	.word 0xe83ac008  ! 221: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe801a008  ! 225: LDUW_I	lduw	[%r6 + 0x0008], %r20
	.word 0xe43b8008  ! 226: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe009a000  ! 228: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe03b2008  ! 229: STD_I	std	%r16, [%r12 + 0x0008]
	.word 0xec2ac008  ! 232: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe42ac008  ! 239: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe831a020  ! 242: STH_I	sth	%r20, [%r6 + 0x0020]
	.word 0xe81b0008  ! 253: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xec59a000  ! 255: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xe813a000  ! 260: LDUH_I	lduh	[%r14 + 0x0000], %r20
	.word 0xe4330008  ! 266: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe02b0008  ! 267: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe42b4008  ! 269: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe4132030  ! 270: LDUH_I	lduh	[%r12 + 0x0030], %r18
	.word 0xe049a018  ! 275: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xe842a018  ! 279: LDSW_I	ldsw	[%r10 + 0x0018], %r20
	.word 0xe0728008  ! 281: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe85b4008  ! 284: LDX_R	ldx	[%r13 + %r8], %r20
	.word 0xec730008  ! 285: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xec49a008  ! 293: LDSB_I	ldsb	[%r6 + 0x0008], %r22
	.word 0xe01ae028  ! 294: LDD_I	ldd	[%r11 + 0x0028], %r16
! Thread sync; stream = 29; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
	.word 0xe0518008  ! 2: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xec4b0008  ! 5: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe8228008  ! 12: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xec236020  ! 16: STW_I	stw	%r22, [%r13 + 0x0020]
	.word 0xec31c008  ! 20: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xec33a038  ! 21: STH_I	sth	%r22, [%r14 + 0x0038]
	.word 0xe011c008  ! 24: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xec330008  ! 26: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe82ac008  ! 28: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe043a018  ! 29: LDSW_I	ldsw	[%r14 + 0x0018], %r16
	.word 0xec11e030  ! 31: LDUH_I	lduh	[%r7 + 0x0030], %r22
	.word 0xe039c008  ! 39: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe03ae010  ! 42: STD_I	std	%r16, [%r11 + 0x0010]
	.word 0xec43a028  ! 47: LDSW_I	ldsw	[%r14 + 0x0028], %r22
	.word 0xec19a010  ! 48: LDD_I	ldd	[%r6 + 0x0010], %r22
	.word 0xe03a8008  ! 49: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe072e010  ! 51: STX_I	stx	%r16, [%r11 + 0x0010]
	.word 0xe049e000  ! 52: LDSB_I	ldsb	[%r7 + 0x0000], %r16
	.word 0xec118008  ! 53: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xec39c008  ! 54: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe43b6038  ! 56: STD_I	std	%r18, [%r13 + 0x0038]
	.word 0xe839c008  ! 57: STD_R	std	%r20, [%r7 + %r8]
	.word 0xec518008  ! 58: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe45aa018  ! 63: LDX_I	ldx	[%r10 + 0x0018], %r18
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe83ba028  ! 67: STD_I	std	%r20, [%r14 + 0x0028]
	.word 0xe021a038  ! 70: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe002a020  ! 72: LDUW_I	lduw	[%r10 + 0x0020], %r16
	.word 0xe049a010  ! 73: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xec236038  ! 78: STW_I	stw	%r22, [%r13 + 0x0038]
	.word 0xe441e000  ! 84: LDSW_I	ldsw	[%r7 + 0x0000], %r18
	.word 0xe0528008  ! 86: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe0038008  ! 90: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe44ba000  ! 92: LDSB_I	ldsb	[%r14 + 0x0000], %r18
	.word 0xe032e038  ! 93: STH_I	sth	%r16, [%r11 + 0x0038]
	.word 0xe4336000  ! 94: STH_I	sth	%r18, [%r13 + 0x0000]
	.word 0xe8434008  ! 99: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe42b8008  ! 101: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xec218008  ! 107: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0738008  ! 109: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xec4b4008  ! 115: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xec2ac008  ! 116: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xec13a020  ! 117: LDUH_I	lduh	[%r14 + 0x0020], %r22
	.word 0xec498008  ! 120: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xec01c008  ! 126: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe0734008  ! 128: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe01b8008  ! 133: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xec330008  ! 139: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe82b6030  ! 140: STB_I	stb	%r20, [%r13 + 0x0030]
	.word 0xe821a010  ! 141: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe432c008  ! 142: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xec31c008  ! 145: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe0234008  ! 149: STW_R	stw	%r16, [%r13 + %r8]
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe002c008  ! 154: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe4138008  ! 157: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe0336038  ! 159: STH_I	sth	%r16, [%r13 + 0x0038]
	.word 0xe45b8008  ! 162: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe4498008  ! 165: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec29e018  ! 167: STB_I	stb	%r22, [%r7 + 0x0018]
	.word 0xe42ba030  ! 168: STB_I	stb	%r18, [%r14 + 0x0030]
	.word 0xe0298008  ! 169: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec21a010  ! 172: STW_I	stw	%r22, [%r6 + 0x0010]
	.word 0xec49e008  ! 178: LDSB_I	ldsb	[%r7 + 0x0008], %r22
	.word 0xe859c008  ! 180: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe4232018  ! 182: STW_I	stw	%r18, [%r12 + 0x0018]
	.word 0xe4238008  ! 183: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe0736008  ! 185: STX_I	stx	%r16, [%r13 + 0x0008]
	.word 0xe82ac008  ! 186: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe4136030  ! 189: LDUH_I	lduh	[%r13 + 0x0030], %r18
	.word 0xe449e020  ! 191: LDSB_I	ldsb	[%r7 + 0x0020], %r18
	.word 0xe009e020  ! 196: LDUB_I	ldub	[%r7 + 0x0020], %r16
	.word 0xe802c008  ! 197: LDUW_R	lduw	[%r11 + %r8], %r20
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec73a020  ! 201: STX_I	stx	%r22, [%r14 + 0x0020]
	.word 0xe0430008  ! 205: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe453a008  ! 207: LDSH_I	ldsh	[%r14 + 0x0008], %r18
	.word 0xe05ac008  ! 209: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe4234008  ! 211: STW_R	stw	%r18, [%r13 + %r8]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe43b2030  ! 215: STD_I	std	%r18, [%r12 + 0x0030]
	.word 0xe029c008  ! 219: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe031a010  ! 221: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xec5ac008  ! 225: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe0718008  ! 226: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe049a018  ! 228: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xec730008  ! 229: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe83a8008  ! 232: STD_R	std	%r20, [%r10 + %r8]
	.word 0xec718008  ! 239: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe4398008  ! 242: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe4018008  ! 253: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe04a8008  ! 255: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xec13a000  ! 260: LDUH_I	lduh	[%r14 + 0x0000], %r22
	.word 0xe0338008  ! 266: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xec298008  ! 267: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe02aa018  ! 269: STB_I	stb	%r16, [%r10 + 0x0018]
	.word 0xe80aa010  ! 270: LDUB_I	ldub	[%r10 + 0x0010], %r20
	.word 0xe8528008  ! 275: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe05ac008  ! 279: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe429a000  ! 281: STB_I	stb	%r18, [%r6 + 0x0000]
	.word 0xe04b0008  ! 284: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe871a000  ! 285: STX_I	stx	%r20, [%r6 + 0x0000]
	.word 0xe81b2028  ! 293: LDD_I	ldd	[%r12 + 0x0028], %r20
	.word 0xe4428008  ! 294: LDSW_R	ldsw	[%r10 + %r8], %r18
! Thread sync; stream = 28; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
	.word 0xe40aa020  ! 2: LDUB_I	ldub	[%r10 + 0x0020], %r18
	.word 0xe419e008  ! 5: LDD_I	ldd	[%r7 + 0x0008], %r18
	.word 0xe039c008  ! 12: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe02ba008  ! 16: STB_I	stb	%r16, [%r14 + 0x0008]
	.word 0xec734008  ! 20: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe02ac008  ! 21: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe81b2030  ! 24: LDD_I	ldd	[%r12 + 0x0030], %r20
	.word 0xe0330008  ! 26: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe02a8008  ! 28: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe0098008  ! 29: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe8430008  ! 31: LDSW_R	ldsw	[%r12 + %r8], %r20
	.word 0xec71e038  ! 39: STX_I	stx	%r22, [%r7 + 0x0038]
	.word 0xe433a008  ! 42: STH_I	sth	%r18, [%r14 + 0x0008]
	.word 0xe04b4008  ! 47: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe041a018  ! 48: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xe022e008  ! 49: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe03aa008  ! 51: STD_I	std	%r16, [%r10 + 0x0008]
	.word 0xec03a000  ! 52: LDUW_I	lduw	[%r14 + 0x0000], %r22
	.word 0xe401c008  ! 53: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xe82aa030  ! 54: STB_I	stb	%r20, [%r10 + 0x0030]
	.word 0xe031e028  ! 56: STH_I	sth	%r16, [%r7 + 0x0028]
	.word 0xe029a010  ! 57: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe80b6018  ! 58: LDUB_I	ldub	[%r13 + 0x0018], %r20
	.word 0xe05aa030  ! 63: LDX_I	ldx	[%r10 + 0x0030], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe0238008  ! 67: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe4236028  ! 70: STW_I	stw	%r18, [%r13 + 0x0028]
	.word 0xe0518008  ! 72: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe05b2018  ! 73: LDX_I	ldx	[%r12 + 0x0018], %r16
	.word 0xe4718008  ! 78: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec1b2030  ! 84: LDD_I	ldd	[%r12 + 0x0030], %r22
	.word 0xe852a010  ! 86: LDSH_I	ldsh	[%r10 + 0x0010], %r20
	.word 0xe4434008  ! 90: LDSW_R	ldsw	[%r13 + %r8], %r18
	.word 0xe00b6020  ! 92: LDUB_I	ldub	[%r13 + 0x0020], %r16
	.word 0xe4328008  ! 93: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe821c008  ! 94: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe409e028  ! 99: LDUB_I	ldub	[%r7 + 0x0028], %r18
	.word 0xe8298008  ! 101: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe03aa020  ! 107: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xec398008  ! 109: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe4598008  ! 115: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xec22e008  ! 116: STW_I	stw	%r22, [%r11 + 0x0008]
	.word 0xe4118008  ! 117: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xec5b2028  ! 120: LDX_I	ldx	[%r12 + 0x0028], %r22
	.word 0xe802c008  ! 126: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe8232020  ! 128: STW_I	stw	%r20, [%r12 + 0x0020]
	.word 0xe042c008  ! 133: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe03b6030  ! 139: STD_I	std	%r16, [%r13 + 0x0030]
	.word 0xe0318008  ! 140: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec3b0008  ! 141: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe0332038  ! 142: STH_I	sth	%r16, [%r12 + 0x0038]
	.word 0xe8734008  ! 145: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe0328008  ! 149: STH_R	sth	%r16, [%r10 + %r8]
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe0130008  ! 154: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xec42a000  ! 157: LDSW_I	ldsw	[%r10 + 0x0000], %r22
	.word 0xe02b2020  ! 159: STB_I	stb	%r16, [%r12 + 0x0020]
	.word 0xe04a8008  ! 162: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xec018008  ! 165: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe0332038  ! 167: STH_I	sth	%r16, [%r12 + 0x0038]
	.word 0xe072e018  ! 168: STX_I	stx	%r16, [%r11 + 0x0018]
	.word 0xec732018  ! 169: STX_I	stx	%r22, [%r12 + 0x0018]
	.word 0xe4328008  ! 172: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe8598008  ! 178: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe0418008  ! 180: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec238008  ! 182: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe022e020  ! 183: STW_I	stw	%r16, [%r11 + 0x0020]
	.word 0xe029e010  ! 185: STB_I	stb	%r16, [%r7 + 0x0010]
	.word 0xec31c008  ! 186: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe401c008  ! 189: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xe052c008  ! 191: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe0132018  ! 196: LDUH_I	lduh	[%r12 + 0x0018], %r16
	.word 0xe0118008  ! 197: LDUH_R	lduh	[%r6 + %r8], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe03ae018  ! 201: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xe849c008  ! 205: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe05b4008  ! 207: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe0038008  ! 209: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xec72e010  ! 211: STX_I	stx	%r22, [%r11 + 0x0010]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe022a000  ! 215: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe0230008  ! 219: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe82ac008  ! 221: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe809e008  ! 225: LDUB_I	ldub	[%r7 + 0x0008], %r20
	.word 0xe021e028  ! 226: STW_I	stw	%r16, [%r7 + 0x0028]
	.word 0xe8030008  ! 228: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe42a8008  ! 229: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe0318008  ! 232: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe032c008  ! 239: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe072e028  ! 242: STX_I	stx	%r16, [%r11 + 0x0028]
	.word 0xe0538008  ! 253: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xec09e030  ! 255: LDUB_I	ldub	[%r7 + 0x0030], %r22
	.word 0xe051c008  ! 260: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe422a038  ! 266: STW_I	stw	%r18, [%r10 + 0x0038]
	.word 0xec29a020  ! 267: STB_I	stb	%r22, [%r6 + 0x0020]
	.word 0xe8330008  ! 269: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe85a8008  ! 270: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe85b0008  ! 275: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xec11c008  ! 279: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xec3b2000  ! 281: STD_I	std	%r22, [%r12 + 0x0000]
	.word 0xe019c008  ! 284: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe822e028  ! 285: STW_I	stw	%r20, [%r11 + 0x0028]
	.word 0xe4498008  ! 293: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe01b2028  ! 294: LDD_I	ldd	[%r12 + 0x0028], %r16
! Thread sync; stream = 27; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
	.word 0xec1a8008  ! 2: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe05b6008  ! 5: LDX_I	ldx	[%r13 + 0x0008], %r16
	.word 0xec39a028  ! 12: STD_I	std	%r22, [%r6 + 0x0028]
	.word 0xe02ac008  ! 16: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe429a020  ! 20: STB_I	stb	%r18, [%r6 + 0x0020]
	.word 0xe4318008  ! 21: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe05b0008  ! 24: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe42b8008  ! 26: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xec318008  ! 28: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec198008  ! 29: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xec52c008  ! 31: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xe823a020  ! 39: STW_I	stw	%r20, [%r14 + 0x0020]
	.word 0xe071c008  ! 42: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec5b4008  ! 47: LDX_R	ldx	[%r13 + %r8], %r22
	.word 0xe0098008  ! 48: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe031a018  ! 49: STH_I	sth	%r16, [%r6 + 0x0018]
	.word 0xe8728008  ! 51: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xec530008  ! 52: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xec52e008  ! 53: LDSH_I	ldsh	[%r11 + 0x0008], %r22
	.word 0xe4738008  ! 54: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe03a8008  ! 56: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe072e008  ! 57: STX_I	stx	%r16, [%r11 + 0x0008]
	.word 0xe8136030  ! 58: LDUH_I	lduh	[%r13 + 0x0030], %r20
	.word 0xe8438008  ! 63: LDSW_R	ldsw	[%r14 + %r8], %r20
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe0398008  ! 67: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec330008  ! 70: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xec0a8008  ! 72: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe4498008  ! 73: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe822a000  ! 78: STW_I	stw	%r20, [%r10 + 0x0000]
	.word 0xec11e000  ! 84: LDUH_I	lduh	[%r7 + 0x0000], %r22
	.word 0xe409e020  ! 86: LDUB_I	ldub	[%r7 + 0x0020], %r18
	.word 0xe843a038  ! 90: LDSW_I	ldsw	[%r14 + 0x0038], %r20
	.word 0xe84ba028  ! 92: LDSB_I	ldsb	[%r14 + 0x0028], %r20
	.word 0xe0398008  ! 93: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe03ac008  ! 94: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe81b2018  ! 99: LDD_I	ldd	[%r12 + 0x0018], %r20
	.word 0xe43aa028  ! 101: STD_I	std	%r18, [%r10 + 0x0028]
	.word 0xe02a8008  ! 107: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xec3a8008  ! 109: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe059a020  ! 115: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xe8318008  ! 116: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec09c008  ! 117: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xe4498008  ! 120: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe05ae010  ! 126: LDX_I	ldx	[%r11 + 0x0010], %r16
	.word 0xe029a000  ! 128: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe8418008  ! 133: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe029c008  ! 139: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe829a028  ! 140: STB_I	stb	%r20, [%r6 + 0x0028]
	.word 0xe031a008  ! 141: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe03ae018  ! 142: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xe4238008  ! 145: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe83ba010  ! 149: STD_I	std	%r20, [%r14 + 0x0010]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe849c008  ! 154: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe452e038  ! 157: LDSH_I	ldsh	[%r11 + 0x0038], %r18
	.word 0xe072a018  ! 159: STX_I	stx	%r16, [%r10 + 0x0018]
	.word 0xe0434008  ! 162: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe4536008  ! 165: LDSH_I	ldsh	[%r13 + 0x0008], %r18
	.word 0xe02ac008  ! 167: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xec71a028  ! 168: STX_I	stx	%r22, [%r6 + 0x0028]
	.word 0xec3ac008  ! 169: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe0238008  ! 172: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe41ac008  ! 178: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe85aa038  ! 180: LDX_I	ldx	[%r10 + 0x0038], %r20
	.word 0xe82b4008  ! 182: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe0298008  ! 183: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe82ae028  ! 185: STB_I	stb	%r20, [%r11 + 0x0028]
	.word 0xe0218008  ! 186: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0432018  ! 189: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	.word 0xe041a028  ! 191: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	.word 0xec42a008  ! 196: LDSW_I	ldsw	[%r10 + 0x0008], %r22
	.word 0xe402a008  ! 197: LDUW_I	lduw	[%r10 + 0x0008], %r18
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe032a030  ! 201: STH_I	sth	%r16, [%r10 + 0x0030]
	.word 0xe04b6038  ! 205: LDSB_I	ldsb	[%r13 + 0x0038], %r16
	.word 0xe4136018  ! 207: LDUH_I	lduh	[%r13 + 0x0018], %r18
	.word 0xe413a008  ! 209: LDUH_I	lduh	[%r14 + 0x0008], %r18
	.word 0xec238008  ! 211: STW_R	stw	%r22, [%r14 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe8298008  ! 215: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe03b6038  ! 219: STD_I	std	%r16, [%r13 + 0x0038]
	.word 0xe021a018  ! 221: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xec038008  ! 225: LDUW_R	lduw	[%r14 + %r8], %r22
	.word 0xe02ae018  ! 226: STB_I	stb	%r16, [%r11 + 0x0018]
	.word 0xec598008  ! 228: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe4230008  ! 229: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe871a008  ! 232: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xec29c008  ! 239: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xec336028  ! 242: STH_I	sth	%r22, [%r13 + 0x0028]
	.word 0xe441a038  ! 253: LDSW_I	ldsw	[%r6 + 0x0038], %r18
	.word 0xe84b4008  ! 255: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe809a028  ! 260: LDUB_I	ldub	[%r6 + 0x0028], %r20
	.word 0xe02a8008  ! 266: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xec218008  ! 267: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4732038  ! 269: STX_I	stx	%r18, [%r12 + 0x0038]
	.word 0xe4028008  ! 270: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe81ae008  ! 275: LDD_I	ldd	[%r11 + 0x0008], %r20
	.word 0xe049c008  ! 279: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe022a028  ! 281: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xe8034008  ! 284: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe0334008  ! 285: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe8030008  ! 293: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe811c008  ! 294: LDUH_R	lduh	[%r7 + %r8], %r20
! Thread sync; stream = 26; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
	.word 0xec0b0008  ! 2: LDUB_R	ldub	[%r12 + %r8], %r22
	.word 0xe04ba030  ! 5: LDSB_I	ldsb	[%r14 + 0x0030], %r16
	.word 0xe02a8008  ! 12: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xec29a008  ! 16: STB_I	stb	%r22, [%r6 + 0x0008]
	.word 0xe0334008  ! 20: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe4218008  ! 21: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec51e008  ! 24: LDSH_I	ldsh	[%r7 + 0x0008], %r22
	.word 0xec2aa000  ! 26: STB_I	stb	%r22, [%r10 + 0x0000]
	.word 0xe02b0008  ! 28: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec528008  ! 29: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe84b2010  ! 31: LDSB_I	ldsb	[%r12 + 0x0010], %r20
	.word 0xe0332018  ! 39: STH_I	sth	%r16, [%r12 + 0x0018]
	.word 0xe82b4008  ! 42: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe00ae018  ! 47: LDUB_I	ldub	[%r11 + 0x0018], %r16
	.word 0xe45b4008  ! 48: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xe839c008  ! 49: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe42b8008  ! 51: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe049a008  ! 52: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xe001e000  ! 53: LDUW_I	lduw	[%r7 + 0x0000], %r16
	.word 0xe0728008  ! 54: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe431c008  ! 56: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe02a8008  ! 57: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe4536008  ! 58: LDSH_I	ldsh	[%r13 + 0x0008], %r18
	.word 0xe859e038  ! 63: LDX_I	ldx	[%r7 + 0x0038], %r20
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec3ba008  ! 67: STD_I	std	%r22, [%r14 + 0x0008]
	.word 0xec338008  ! 70: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xec034008  ! 72: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe052c008  ! 73: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe4718008  ! 78: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe04a8008  ! 84: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe80ac008  ! 86: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe001c008  ! 90: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xec13a008  ! 92: LDUH_I	lduh	[%r14 + 0x0008], %r22
	.word 0xe0298008  ! 93: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8234008  ! 94: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe001a038  ! 99: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xe832a008  ! 101: STH_I	sth	%r20, [%r10 + 0x0008]
	.word 0xe0328008  ! 107: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe823a030  ! 109: STW_I	stw	%r20, [%r14 + 0x0030]
	.word 0xe403a018  ! 115: LDUW_I	lduw	[%r14 + 0x0018], %r18
	.word 0xe022e008  ! 116: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe403a020  ! 117: LDUW_I	lduw	[%r14 + 0x0020], %r18
	.word 0xe40ae008  ! 120: LDUB_I	ldub	[%r11 + 0x0008], %r18
	.word 0xec19e028  ! 126: LDD_I	ldd	[%r7 + 0x0028], %r22
	.word 0xec72a038  ! 128: STX_I	stx	%r22, [%r10 + 0x0038]
	.word 0xec09c008  ! 133: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xec73a030  ! 139: STX_I	stx	%r22, [%r14 + 0x0030]
	.word 0xe4738008  ! 140: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe43b6038  ! 141: STD_I	std	%r18, [%r13 + 0x0038]
	.word 0xe471a018  ! 142: STX_I	stx	%r18, [%r6 + 0x0018]
	.word 0xe422a018  ! 145: STW_I	stw	%r18, [%r10 + 0x0018]
	.word 0xe0218008  ! 149: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe44b0008  ! 154: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xe4430008  ! 157: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe029a008  ! 159: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe043a028  ! 162: LDSW_I	ldsw	[%r14 + 0x0028], %r16
	.word 0xe451a018  ! 165: LDSH_I	ldsh	[%r6 + 0x0018], %r18
	.word 0xe072c008  ! 167: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe02ba018  ! 168: STB_I	stb	%r16, [%r14 + 0x0018]
	.word 0xe829e020  ! 169: STB_I	stb	%r20, [%r7 + 0x0020]
	.word 0xe4338008  ! 172: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xec130008  ! 178: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe00aa038  ! 180: LDUB_I	ldub	[%r10 + 0x0038], %r16
	.word 0xe429e020  ! 182: STB_I	stb	%r18, [%r7 + 0x0020]
	.word 0xec21a030  ! 183: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xe0718008  ! 185: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec39a018  ! 186: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xe0198008  ! 189: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe449a030  ! 191: LDSB_I	ldsb	[%r6 + 0x0030], %r18
	.word 0xe041c008  ! 196: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe8598008  ! 197: LDX_R	ldx	[%r6 + %r8], %r20
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe03ac008  ! 201: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe449e000  ! 205: LDSB_I	ldsb	[%r7 + 0x0000], %r18
	.word 0xe842e038  ! 207: LDSW_I	ldsw	[%r11 + 0x0038], %r20
	.word 0xec1b0008  ! 209: LDD_R	ldd	[%r12 + %r8], %r22
	.word 0xe0718008  ! 211: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec29a030  ! 215: STB_I	stb	%r22, [%r6 + 0x0030]
	.word 0xe0218008  ! 219: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0330008  ! 221: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe45b0008  ! 225: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe821a038  ! 226: STW_I	stw	%r20, [%r6 + 0x0038]
	.word 0xec5aa028  ! 228: LDX_I	ldx	[%r10 + 0x0028], %r22
	.word 0xe431a030  ! 229: STH_I	sth	%r18, [%r6 + 0x0030]
	.word 0xec234008  ! 232: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe8398008  ! 239: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe4328008  ! 242: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xec5aa038  ! 253: LDX_I	ldx	[%r10 + 0x0038], %r22
	.word 0xec1b6020  ! 255: LDD_I	ldd	[%r13 + 0x0020], %r22
	.word 0xe0532000  ! 260: LDSH_I	ldsh	[%r12 + 0x0000], %r16
	.word 0xe0234008  ! 266: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe8718008  ! 267: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe839c008  ! 269: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe001c008  ! 270: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe04b6020  ! 275: LDSB_I	ldsb	[%r13 + 0x0020], %r16
	.word 0xe012e010  ! 279: LDUH_I	lduh	[%r11 + 0x0010], %r16
	.word 0xe0236010  ! 281: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe051c008  ! 284: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe071a030  ! 285: STX_I	stx	%r16, [%r6 + 0x0030]
	.word 0xe841e020  ! 293: LDSW_I	ldsw	[%r7 + 0x0020], %r20
	.word 0xe8518008  ! 294: LDSH_R	ldsh	[%r6 + %r8], %r20
! Thread sync; stream = 25; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
	.word 0xe01ac008  ! 2: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe01b0008  ! 5: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe071a000  ! 12: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xec230008  ! 16: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xec32c008  ! 20: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe42ba010  ! 21: STB_I	stb	%r18, [%r14 + 0x0010]
	.word 0xe001e010  ! 24: LDUW_I	lduw	[%r7 + 0x0010], %r16
	.word 0xe071a008  ! 26: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe829a010  ! 28: STB_I	stb	%r20, [%r6 + 0x0010]
	.word 0xe8536018  ! 29: LDSH_I	ldsh	[%r13 + 0x0018], %r20
	.word 0xec118008  ! 31: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe8332030  ! 39: STH_I	sth	%r20, [%r12 + 0x0030]
	.word 0xe029e018  ! 42: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe01ac008  ! 47: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe042e008  ! 48: LDSW_I	ldsw	[%r11 + 0x0008], %r16
	.word 0xec31a038  ! 49: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xec3ae038  ! 51: STD_I	std	%r22, [%r11 + 0x0038]
	.word 0xe0134008  ! 52: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe04b4008  ! 53: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe031a020  ! 54: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xec32c008  ! 56: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe073a028  ! 57: STX_I	stx	%r16, [%r14 + 0x0028]
	.word 0xe0098008  ! 58: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec434008  ! 63: LDSW_R	ldsw	[%r13 + %r8], %r22
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe431e008  ! 67: STH_I	sth	%r18, [%r7 + 0x0008]
	.word 0xe022a018  ! 70: STW_I	stw	%r16, [%r10 + 0x0018]
	.word 0xe00b8008  ! 72: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe04a8008  ! 73: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe831e008  ! 78: STH_I	sth	%r20, [%r7 + 0x0008]
	.word 0xec418008  ! 84: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe05ba028  ! 86: LDX_I	ldx	[%r14 + 0x0028], %r16
	.word 0xec52a028  ! 90: LDSH_I	ldsh	[%r10 + 0x0028], %r22
	.word 0xe012a028  ! 92: LDUH_I	lduh	[%r10 + 0x0028], %r16
	.word 0xe439c008  ! 93: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe8218008  ! 94: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe0028008  ! 99: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe0238008  ! 101: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe0728008  ! 107: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe02a8008  ! 109: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe8432018  ! 115: LDSW_I	ldsw	[%r12 + 0x0018], %r20
	.word 0xec2b6000  ! 116: STB_I	stb	%r22, [%r13 + 0x0000]
	.word 0xe00aa010  ! 117: LDUB_I	ldub	[%r10 + 0x0010], %r16
	.word 0xe8598008  ! 120: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe04aa000  ! 126: LDSB_I	ldsb	[%r10 + 0x0000], %r16
	.word 0xe02b6000  ! 128: STB_I	stb	%r16, [%r13 + 0x0000]
	.word 0xe001a010  ! 133: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xec22c008  ! 139: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe8730008  ! 140: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe0718008  ! 141: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe431e020  ! 142: STH_I	sth	%r18, [%r7 + 0x0020]
	.word 0xe422e028  ! 145: STW_I	stw	%r18, [%r11 + 0x0028]
	.word 0xe43b4008  ! 149: STD_R	std	%r18, [%r13 + %r8]
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0118008  ! 154: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe8034008  ! 157: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe83ae018  ! 159: STD_I	std	%r20, [%r11 + 0x0018]
	.word 0xec0b6010  ! 162: LDUB_I	ldub	[%r13 + 0x0010], %r22
	.word 0xe84b0008  ! 165: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xe0238008  ! 167: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe832a020  ! 168: STH_I	sth	%r20, [%r10 + 0x0020]
	.word 0xe03aa038  ! 169: STD_I	std	%r16, [%r10 + 0x0038]
	.word 0xe8734008  ! 172: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe0534008  ! 178: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe40ac008  ! 180: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe071c008  ! 182: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe43b4008  ! 183: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe821c008  ! 185: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xec29e000  ! 186: STB_I	stb	%r22, [%r7 + 0x0000]
	.word 0xe4198008  ! 189: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xec4ba000  ! 191: LDSB_I	ldsb	[%r14 + 0x0000], %r22
	.word 0xe0528008  ! 196: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe45a8008  ! 197: LDX_R	ldx	[%r10 + %r8], %r18
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec2aa030  ! 201: STB_I	stb	%r22, [%r10 + 0x0030]
	.word 0xe419a000  ! 205: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe05ba008  ! 207: LDX_I	ldx	[%r14 + 0x0008], %r16
	.word 0xec534008  ! 209: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xec3b0008  ! 211: STD_R	std	%r22, [%r12 + %r8]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec73a028  ! 215: STX_I	stx	%r22, [%r14 + 0x0028]
	.word 0xe031a010  ! 219: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xec3b4008  ! 221: STD_R	std	%r22, [%r13 + %r8]
	.word 0xec4b2038  ! 225: LDSB_I	ldsb	[%r12 + 0x0038], %r22
	.word 0xe072c008  ! 226: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe451e010  ! 228: LDSH_I	ldsh	[%r7 + 0x0010], %r18
	.word 0xec72e018  ! 229: STX_I	stx	%r22, [%r11 + 0x0018]
	.word 0xe42b2000  ! 232: STB_I	stb	%r18, [%r12 + 0x0000]
	.word 0xe071e038  ! 239: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe02b2028  ! 242: STB_I	stb	%r16, [%r12 + 0x0028]
	.word 0xe4132018  ! 253: LDUH_I	lduh	[%r12 + 0x0018], %r18
	.word 0xe45b0008  ! 255: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe4098008  ! 260: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe821a008  ! 266: STW_I	stw	%r20, [%r6 + 0x0008]
	.word 0xe42b4008  ! 267: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe83ac008  ! 269: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe8536008  ! 270: LDSH_I	ldsh	[%r13 + 0x0008], %r20
	.word 0xe04ba018  ! 275: LDSB_I	ldsb	[%r14 + 0x0018], %r16
	.word 0xe04ba010  ! 279: LDSB_I	ldsb	[%r14 + 0x0010], %r16
	.word 0xe83a8008  ! 281: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe443a010  ! 284: LDSW_I	ldsw	[%r14 + 0x0010], %r18
	.word 0xec332008  ! 285: STH_I	sth	%r22, [%r12 + 0x0008]
	.word 0xe4098008  ! 293: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec418008  ! 294: LDSW_R	ldsw	[%r6 + %r8], %r22
! Thread sync; stream = 24; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
	.word 0xe85ba010  ! 2: LDX_I	ldx	[%r14 + 0x0010], %r20
	.word 0xe01b6000  ! 5: LDD_I	ldd	[%r13 + 0x0000], %r16
	.word 0xe03b8008  ! 12: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe031c008  ! 16: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe873a028  ! 20: STX_I	stx	%r20, [%r14 + 0x0028]
	.word 0xe0718008  ! 21: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe041a000  ! 24: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe42b8008  ! 26: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe8318008  ! 28: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec4b2030  ! 29: LDSB_I	ldsb	[%r12 + 0x0030], %r22
	.word 0xe40b8008  ! 31: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xe8336018  ! 39: STH_I	sth	%r20, [%r13 + 0x0018]
	.word 0xe42ba020  ! 42: STB_I	stb	%r18, [%r14 + 0x0020]
	.word 0xec198008  ! 47: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe043a020  ! 48: LDSW_I	ldsw	[%r14 + 0x0020], %r16
	.word 0xe031e000  ! 49: STH_I	sth	%r16, [%r7 + 0x0000]
	.word 0xe829e000  ! 51: STB_I	stb	%r20, [%r7 + 0x0000]
	.word 0xec09a018  ! 52: LDUB_I	ldub	[%r6 + 0x0018], %r22
	.word 0xe011c008  ! 53: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe022a028  ! 54: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xec29a038  ! 56: STB_I	stb	%r22, [%r6 + 0x0038]
	.word 0xe031a020  ! 57: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe009c008  ! 58: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe4538008  ! 63: LDSH_R	ldsh	[%r14 + %r8], %r18
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec2b4008  ! 67: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe4732038  ! 70: STX_I	stx	%r18, [%r12 + 0x0038]
	.word 0xe0418008  ! 72: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe05b4008  ! 73: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe821a010  ! 78: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe81ba038  ! 84: LDD_I	ldd	[%r14 + 0x0038], %r20
	.word 0xe0138008  ! 86: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec0ac008  ! 90: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xec432028  ! 92: LDSW_I	ldsw	[%r12 + 0x0028], %r22
	.word 0xe031e020  ! 93: STH_I	sth	%r16, [%r7 + 0x0020]
	.word 0xe4234008  ! 94: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe00ac008  ! 99: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe033a010  ! 101: STH_I	sth	%r16, [%r14 + 0x0010]
	.word 0xe821e028  ! 107: STW_I	stw	%r20, [%r7 + 0x0028]
	.word 0xe821a030  ! 109: STW_I	stw	%r20, [%r6 + 0x0030]
	.word 0xe051e020  ! 115: LDSH_I	ldsh	[%r7 + 0x0020], %r16
	.word 0xe021c008  ! 116: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe049a020  ! 117: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe0034008  ! 120: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe04b2028  ! 126: LDSB_I	ldsb	[%r12 + 0x0028], %r16
	.word 0xe4232008  ! 128: STW_I	stw	%r18, [%r12 + 0x0008]
	.word 0xec1ae020  ! 133: LDD_I	ldd	[%r11 + 0x0020], %r22
	.word 0xe83b8008  ! 139: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe033a028  ! 140: STH_I	sth	%r16, [%r14 + 0x0028]
	.word 0xe071e008  ! 141: STX_I	stx	%r16, [%r7 + 0x0008]
	.word 0xe43b6030  ! 142: STD_I	std	%r18, [%r13 + 0x0030]
	.word 0xec73a028  ! 145: STX_I	stx	%r22, [%r14 + 0x0028]
	.word 0xec71a038  ! 149: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe05a8008  ! 154: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe44ac008  ! 157: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xe439a038  ! 159: STD_I	std	%r18, [%r6 + 0x0038]
	.word 0xe453a018  ! 162: LDSH_I	ldsh	[%r14 + 0x0018], %r18
	.word 0xe84b2008  ! 165: LDSB_I	ldsb	[%r12 + 0x0008], %r20
	.word 0xe8736018  ! 167: STX_I	stx	%r20, [%r13 + 0x0018]
	.word 0xe439a018  ! 168: STD_I	std	%r18, [%r6 + 0x0018]
	.word 0xe0236010  ! 169: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe472c008  ! 172: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe01ac008  ! 178: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe00b2038  ! 180: LDUB_I	ldub	[%r12 + 0x0038], %r16
	.word 0xec228008  ! 182: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe0718008  ! 183: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe032c008  ! 185: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe42b6008  ! 186: STB_I	stb	%r18, [%r13 + 0x0008]
	.word 0xe8498008  ! 189: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe0198008  ! 191: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe4138008  ! 196: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe4418008  ! 197: LDSW_R	ldsw	[%r6 + %r8], %r18
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe03b4008  ! 201: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe841a030  ! 205: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xe04b0008  ! 207: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe45b0008  ! 209: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe8318008  ! 211: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec32a000  ! 215: STH_I	sth	%r22, [%r10 + 0x0000]
	.word 0xe829a020  ! 219: STB_I	stb	%r20, [%r6 + 0x0020]
	.word 0xe82a8008  ! 221: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe412c008  ! 225: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe471e028  ! 226: STX_I	stx	%r18, [%r7 + 0x0028]
	.word 0xe0098008  ! 228: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe021a018  ! 229: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe02a8008  ! 232: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe072c008  ! 239: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe072a030  ! 242: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xe451a030  ! 253: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	.word 0xe4418008  ! 255: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe41b6008  ! 260: LDD_I	ldd	[%r13 + 0x0008], %r18
	.word 0xec2ba010  ! 266: STB_I	stb	%r22, [%r14 + 0x0010]
	.word 0xec232000  ! 267: STW_I	stw	%r22, [%r12 + 0x0000]
	.word 0xe43b4008  ! 269: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe4598008  ! 270: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe05b4008  ! 275: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe841a018  ! 279: LDSW_I	ldsw	[%r6 + 0x0018], %r20
	.word 0xe0738008  ! 281: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0518008  ! 284: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xec23a008  ! 285: STW_I	stw	%r22, [%r14 + 0x0008]
	.word 0xec1a8008  ! 293: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe4130008  ! 294: LDUH_R	lduh	[%r12 + %r8], %r18
! Thread sync; stream = 23; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
	.word 0xe04aa030  ! 2: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	.word 0xe8034008  ! 5: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe473a020  ! 12: STX_I	stx	%r18, [%r14 + 0x0020]
	.word 0xec2b4008  ! 16: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe0718008  ! 20: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe071a030  ! 21: STX_I	stx	%r16, [%r6 + 0x0030]
	.word 0xe41b8008  ! 24: LDD_R	ldd	[%r14 + %r8], %r18
	.word 0xec218008  ! 26: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe032c008  ! 28: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe8198008  ! 29: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe44ae000  ! 31: LDSB_I	ldsb	[%r11 + 0x0000], %r18
	.word 0xe021c008  ! 39: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe0718008  ! 42: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec098008  ! 47: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe0136018  ! 48: LDUH_I	lduh	[%r13 + 0x0018], %r16
	.word 0xe831c008  ! 49: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe82b2000  ! 51: STB_I	stb	%r20, [%r12 + 0x0000]
	.word 0xec41a008  ! 52: LDSW_I	ldsw	[%r6 + 0x0008], %r22
	.word 0xe052e028  ! 53: LDSH_I	ldsh	[%r11 + 0x0028], %r16
	.word 0xe43b8008  ! 54: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe822e030  ! 56: STW_I	stw	%r20, [%r11 + 0x0030]
	.word 0xe039a020  ! 57: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe01b8008  ! 58: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe4118008  ! 63: LDUH_R	lduh	[%r6 + %r8], %r18
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe472a030  ! 67: STX_I	stx	%r18, [%r10 + 0x0030]
	.word 0xe42b4008  ! 70: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe40b4008  ! 72: LDUB_R	ldub	[%r13 + %r8], %r18
	.word 0xe44aa008  ! 73: LDSB_I	ldsb	[%r10 + 0x0008], %r18
	.word 0xe0334008  ! 78: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe0128008  ! 84: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe001a008  ! 86: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xec51a030  ! 90: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xe40ba028  ! 92: LDUB_I	ldub	[%r14 + 0x0028], %r18
	.word 0xe4236038  ! 93: STW_I	stw	%r18, [%r13 + 0x0038]
	.word 0xe422e010  ! 94: STW_I	stw	%r18, [%r11 + 0x0010]
	.word 0xe0018008  ! 99: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe873a008  ! 101: STX_I	stx	%r20, [%r14 + 0x0008]
	.word 0xe029c008  ! 107: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe831e010  ! 109: STH_I	sth	%r20, [%r7 + 0x0010]
	.word 0xe041a010  ! 115: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	.word 0xec3b8008  ! 116: STD_R	std	%r22, [%r14 + %r8]
	.word 0xe44b0008  ! 117: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xe849a000  ! 120: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xe0534008  ! 126: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe031a038  ! 128: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xe0128008  ! 133: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe4334008  ! 139: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe829e020  ! 140: STB_I	stb	%r20, [%r7 + 0x0020]
	.word 0xe431a038  ! 141: STH_I	sth	%r18, [%r6 + 0x0038]
	.word 0xe071c008  ! 142: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe03aa030  ! 145: STD_I	std	%r16, [%r10 + 0x0030]
	.word 0xe8328008  ! 149: STH_R	sth	%r20, [%r10 + %r8]
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe451a008  ! 154: LDSH_I	ldsh	[%r6 + 0x0008], %r18
	.word 0xec136038  ! 157: LDUH_I	lduh	[%r13 + 0x0038], %r22
	.word 0xec2b0008  ! 159: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe04b0008  ! 162: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe812e028  ! 165: LDUH_I	lduh	[%r11 + 0x0028], %r20
	.word 0xec31a018  ! 167: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xe031c008  ! 168: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xec2b6028  ! 169: STB_I	stb	%r22, [%r13 + 0x0028]
	.word 0xe42ac008  ! 172: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xec41a038  ! 178: LDSW_I	ldsw	[%r6 + 0x0038], %r22
	.word 0xe8534008  ! 180: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xe03b6010  ! 182: STD_I	std	%r16, [%r13 + 0x0010]
	.word 0xec2b2008  ! 183: STB_I	stb	%r22, [%r12 + 0x0008]
	.word 0xe4732030  ! 185: STX_I	stx	%r18, [%r12 + 0x0030]
	.word 0xe8718008  ! 186: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0128008  ! 189: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe409c008  ! 191: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe45ae018  ! 196: LDX_I	ldx	[%r11 + 0x0018], %r18
	.word 0xe01ba038  ! 197: LDD_I	ldd	[%r14 + 0x0038], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe02ac008  ! 201: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe0098008  ! 205: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe801a020  ! 207: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xe011a020  ! 209: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xe0218008  ! 211: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xec29c008  ! 215: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe8336008  ! 219: STH_I	sth	%r20, [%r13 + 0x0008]
	.word 0xe021c008  ! 221: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe0534008  ! 225: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe432e038  ! 226: STH_I	sth	%r18, [%r11 + 0x0038]
	.word 0xe01ac008  ! 228: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe832c008  ! 229: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe439a008  ! 232: STD_I	std	%r18, [%r6 + 0x0008]
	.word 0xe422a038  ! 239: STW_I	stw	%r18, [%r10 + 0x0038]
	.word 0xe42b0008  ! 242: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe00b0008  ! 253: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe049e028  ! 255: LDSB_I	ldsb	[%r7 + 0x0028], %r16
	.word 0xe413a038  ! 260: LDUH_I	lduh	[%r14 + 0x0038], %r18
	.word 0xe02ae000  ! 266: STB_I	stb	%r16, [%r11 + 0x0000]
	.word 0xec3ba030  ! 267: STD_I	std	%r22, [%r14 + 0x0030]
	.word 0xe073a000  ! 269: STX_I	stx	%r16, [%r14 + 0x0000]
	.word 0xe0134008  ! 270: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe802c008  ! 275: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe8498008  ! 279: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe8330008  ! 281: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xec01a000  ! 284: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xec72e020  ! 285: STX_I	stx	%r22, [%r11 + 0x0020]
	.word 0xec0b0008  ! 293: LDUB_R	ldub	[%r12 + %r8], %r22
	.word 0xe85ba028  ! 294: LDX_I	ldx	[%r14 + 0x0028], %r20
! Thread sync; stream = 22; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
	.word 0xe0128008  ! 2: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe4032008  ! 5: LDUW_I	lduw	[%r12 + 0x0008], %r18
	.word 0xe429e030  ! 12: STB_I	stb	%r18, [%r7 + 0x0030]
	.word 0xe031a020  ! 16: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xec29a028  ! 20: STB_I	stb	%r22, [%r6 + 0x0028]
	.word 0xe421a020  ! 21: STW_I	stw	%r18, [%r6 + 0x0020]
	.word 0xe05ac008  ! 24: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe032c008  ! 26: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe823a028  ! 28: STW_I	stw	%r20, [%r14 + 0x0028]
	.word 0xec034008  ! 29: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe452a018  ! 31: LDSH_I	ldsh	[%r10 + 0x0018], %r18
	.word 0xe8234008  ! 39: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe02b2038  ! 42: STB_I	stb	%r16, [%r12 + 0x0038]
	.word 0xe4418008  ! 47: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xec138008  ! 48: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xec23a020  ! 49: STW_I	stw	%r22, [%r14 + 0x0020]
	.word 0xe8236018  ! 51: STW_I	stw	%r20, [%r13 + 0x0018]
	.word 0xe45b0008  ! 52: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xec528008  ! 53: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe829e020  ! 54: STB_I	stb	%r20, [%r7 + 0x0020]
	.word 0xe0728008  ! 56: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec734008  ! 57: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xec0aa018  ! 58: LDUB_I	ldub	[%r10 + 0x0018], %r22
	.word 0xe80ac008  ! 63: LDUB_R	ldub	[%r11 + %r8], %r20
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe8298008  ! 67: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe0236000  ! 70: STW_I	stw	%r16, [%r13 + 0x0000]
	.word 0xe05b0008  ! 72: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe459c008  ! 73: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xec31a038  ! 78: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xec5ac008  ! 84: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe409e008  ! 86: LDUB_I	ldub	[%r7 + 0x0008], %r18
	.word 0xe01b0008  ! 90: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe00a8008  ! 92: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe8732028  ! 93: STX_I	stx	%r20, [%r12 + 0x0028]
	.word 0xe071c008  ! 94: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe851c008  ! 99: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe4298008  ! 101: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe0328008  ! 107: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe02b6038  ! 109: STB_I	stb	%r16, [%r13 + 0x0038]
	.word 0xe81b6020  ! 115: LDD_I	ldd	[%r13 + 0x0020], %r20
	.word 0xe0732018  ! 116: STX_I	stx	%r16, [%r12 + 0x0018]
	.word 0xe802a028  ! 117: LDUW_I	lduw	[%r10 + 0x0028], %r20
	.word 0xe402e000  ! 120: LDUW_I	lduw	[%r11 + 0x0000], %r18
	.word 0xe812a018  ! 126: LDUH_I	lduh	[%r10 + 0x0018], %r20
	.word 0xe071a008  ! 128: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xec41c008  ! 133: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe021c008  ! 139: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xec31e020  ! 140: STH_I	sth	%r22, [%r7 + 0x0020]
	.word 0xe833a010  ! 141: STH_I	sth	%r20, [%r14 + 0x0010]
	.word 0xec328008  ! 142: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe03b4008  ! 145: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec22e018  ! 149: STW_I	stw	%r22, [%r11 + 0x0018]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xec09a000  ! 154: LDUB_I	ldub	[%r6 + 0x0000], %r22
	.word 0xe8030008  ! 157: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xec328008  ! 159: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xec0b6028  ! 162: LDUB_I	ldub	[%r13 + 0x0028], %r22
	.word 0xe05ac008  ! 165: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe8338008  ! 167: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe43ac008  ! 168: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe031e038  ! 169: STH_I	sth	%r16, [%r7 + 0x0038]
	.word 0xec23a028  ! 172: STW_I	stw	%r22, [%r14 + 0x0028]
	.word 0xe0032030  ! 178: LDUW_I	lduw	[%r12 + 0x0030], %r16
	.word 0xe811e010  ! 180: LDUH_I	lduh	[%r7 + 0x0010], %r20
	.word 0xe023a010  ! 182: STW_I	stw	%r16, [%r14 + 0x0010]
	.word 0xec31c008  ! 183: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe071e038  ! 185: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xec2b0008  ! 186: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe001a028  ! 189: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xe412a020  ! 191: LDUH_I	lduh	[%r10 + 0x0020], %r18
	.word 0xe012c008  ! 196: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe4534008  ! 197: LDSH_R	ldsh	[%r13 + %r8], %r18
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe4718008  ! 201: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec4b6038  ! 205: LDSB_I	ldsb	[%r13 + 0x0038], %r22
	.word 0xe8130008  ! 207: LDUH_R	lduh	[%r12 + %r8], %r20
	.word 0xe04b0008  ! 209: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe4228008  ! 211: STW_R	stw	%r18, [%r10 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe071a018  ! 215: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xe872e030  ! 219: STX_I	stx	%r20, [%r11 + 0x0030]
	.word 0xec71a030  ! 221: STX_I	stx	%r22, [%r6 + 0x0030]
	.word 0xe0098008  ! 225: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe032e018  ! 226: STH_I	sth	%r16, [%r11 + 0x0018]
	.word 0xec11e018  ! 228: LDUH_I	lduh	[%r7 + 0x0018], %r22
	.word 0xe8318008  ! 229: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe8236010  ! 232: STW_I	stw	%r20, [%r13 + 0x0010]
	.word 0xe032e018  ! 239: STH_I	sth	%r16, [%r11 + 0x0018]
	.word 0xe0228008  ! 242: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec136038  ! 253: LDUH_I	lduh	[%r13 + 0x0038], %r22
	.word 0xe442a028  ! 255: LDSW_I	ldsw	[%r10 + 0x0028], %r18
	.word 0xe05b4008  ! 260: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe02ac008  ! 266: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe039a010  ! 267: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe02ae038  ! 269: STB_I	stb	%r16, [%r11 + 0x0038]
	.word 0xe049c008  ! 270: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe00b4008  ! 275: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe012c008  ! 279: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xec330008  ! 281: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xec098008  ! 284: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe03b8008  ! 285: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe809e008  ! 293: LDUB_I	ldub	[%r7 + 0x0008], %r20
	.word 0xe8498008  ! 294: LDSB_R	ldsb	[%r6 + %r8], %r20
! Thread sync; stream = 21; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
	.word 0xe012c008  ! 2: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe01b6038  ! 5: LDD_I	ldd	[%r13 + 0x0038], %r16
	.word 0xe839e020  ! 12: STD_I	std	%r20, [%r7 + 0x0020]
	.word 0xe03ac008  ! 16: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe83b4008  ! 20: STD_R	std	%r20, [%r13 + %r8]
	.word 0xe0218008  ! 21: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec1b6038  ! 24: LDD_I	ldd	[%r13 + 0x0038], %r22
	.word 0xe43b0008  ! 26: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe471a020  ! 28: STX_I	stx	%r18, [%r6 + 0x0020]
	.word 0xe81b4008  ! 29: LDD_R	ldd	[%r13 + %r8], %r20
	.word 0xe849c008  ! 31: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe02b0008  ! 39: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec232008  ! 42: STW_I	stw	%r22, [%r12 + 0x0008]
	.word 0xe0436000  ! 47: LDSW_I	ldsw	[%r13 + 0x0000], %r16
	.word 0xe851c008  ! 48: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xec22e000  ! 49: STW_I	stw	%r22, [%r11 + 0x0000]
	.word 0xec328008  ! 51: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe051a008  ! 52: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xe452a020  ! 53: LDSH_I	ldsh	[%r10 + 0x0020], %r18
	.word 0xe432c008  ! 54: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe4334008  ! 56: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe432c008  ! 57: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe84ac008  ! 58: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe012c008  ! 63: LDUH_R	lduh	[%r11 + %r8], %r16
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec2ba030  ! 67: STB_I	stb	%r22, [%r14 + 0x0030]
	.word 0xe8730008  ! 70: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe013a018  ! 72: LDUH_I	lduh	[%r14 + 0x0018], %r16
	.word 0xe05b0008  ! 73: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe432e010  ! 78: STH_I	sth	%r18, [%r11 + 0x0010]
	.word 0xe4098008  ! 84: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe801a038  ! 86: LDUW_I	lduw	[%r6 + 0x0038], %r20
	.word 0xe04aa030  ! 90: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	.word 0xe4418008  ! 92: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xec32c008  ! 93: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xec736038  ! 94: STX_I	stx	%r22, [%r13 + 0x0038]
	.word 0xec430008  ! 99: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec2b8008  ! 101: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe03ac008  ! 107: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe4736030  ! 109: STX_I	stx	%r18, [%r13 + 0x0030]
	.word 0xec51a008  ! 115: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	.word 0xec73a010  ! 116: STX_I	stx	%r22, [%r14 + 0x0010]
	.word 0xe8432000  ! 117: LDSW_I	ldsw	[%r12 + 0x0000], %r20
	.word 0xe0538008  ! 120: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe85b2030  ! 126: LDX_I	ldx	[%r12 + 0x0030], %r20
	.word 0xec3a8008  ! 128: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe84ac008  ! 133: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe433a038  ! 139: STH_I	sth	%r18, [%r14 + 0x0038]
	.word 0xe8298008  ! 140: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe0230008  ! 141: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe039e030  ! 142: STD_I	std	%r16, [%r7 + 0x0030]
	.word 0xec238008  ! 145: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe071e030  ! 149: STX_I	stx	%r16, [%r7 + 0x0030]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe859e028  ! 154: LDX_I	ldx	[%r7 + 0x0028], %r20
	.word 0xe012a020  ! 157: LDUH_I	lduh	[%r10 + 0x0020], %r16
	.word 0xec71a030  ! 159: STX_I	stx	%r22, [%r6 + 0x0030]
	.word 0xe00b0008  ! 162: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe0418008  ! 165: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe0718008  ! 167: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe8718008  ! 168: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0328008  ! 169: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe021a010  ! 172: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xe84b0008  ! 178: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xe801e018  ! 180: LDUW_I	lduw	[%r7 + 0x0018], %r20
	.word 0xe02a8008  ! 182: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe0398008  ! 183: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0218008  ! 185: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe039e008  ! 186: STD_I	std	%r16, [%r7 + 0x0008]
	.word 0xe841e020  ! 189: LDSW_I	ldsw	[%r7 + 0x0020], %r20
	.word 0xe419c008  ! 191: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xec42a008  ! 196: LDSW_I	ldsw	[%r10 + 0x0008], %r22
	.word 0xe449a018  ! 197: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe8234008  ! 201: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe449a020  ! 205: LDSB_I	ldsb	[%r6 + 0x0020], %r18
	.word 0xe0018008  ! 207: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe84b2018  ! 209: LDSB_I	ldsb	[%r12 + 0x0018], %r20
	.word 0xe829c008  ! 211: STB_R	stb	%r20, [%r7 + %r8]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe82a8008  ! 215: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xec39c008  ! 219: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe83a8008  ! 221: STD_R	std	%r20, [%r10 + %r8]
	.word 0xec430008  ! 225: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec29e038  ! 226: STB_I	stb	%r22, [%r7 + 0x0038]
	.word 0xe01a8008  ! 228: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe022a000  ! 229: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe029e030  ! 232: STB_I	stb	%r16, [%r7 + 0x0030]
	.word 0xe0298008  ! 239: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec2ae038  ! 242: STB_I	stb	%r22, [%r11 + 0x0038]
	.word 0xec498008  ! 253: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe0528008  ! 255: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe45b6030  ! 260: LDX_I	ldx	[%r13 + 0x0030], %r18
	.word 0xe0218008  ! 266: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec734008  ! 267: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe0730008  ! 269: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe8098008  ! 270: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe811c008  ! 275: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xec136010  ! 279: LDUH_I	lduh	[%r13 + 0x0010], %r22
	.word 0xe0734008  ! 281: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe40a8008  ! 284: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe0332010  ! 285: STH_I	sth	%r16, [%r12 + 0x0010]
	.word 0xe04b6028  ! 293: LDSB_I	ldsb	[%r13 + 0x0028], %r16
	.word 0xe4428008  ! 294: LDSW_R	ldsw	[%r10 + %r8], %r18
! Thread sync; stream = 20; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
	.word 0xe019e018  ! 2: LDD_I	ldd	[%r7 + 0x0018], %r16
	.word 0xe059a018  ! 5: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xec718008  ! 12: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe071c008  ! 16: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe8328008  ! 20: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe0398008  ! 21: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe842e000  ! 24: LDSW_I	ldsw	[%r11 + 0x0000], %r20
	.word 0xe02aa000  ! 26: STB_I	stb	%r16, [%r10 + 0x0000]
	.word 0xec39c008  ! 28: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe4530008  ! 29: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe8436008  ! 31: LDSW_I	ldsw	[%r13 + 0x0008], %r20
	.word 0xec298008  ! 39: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe473a000  ! 42: STX_I	stx	%r18, [%r14 + 0x0000]
	.word 0xe0128008  ! 47: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe849a000  ! 48: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xe83aa038  ! 49: STD_I	std	%r20, [%r10 + 0x0038]
	.word 0xe43ac008  ! 51: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe4198008  ! 52: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe05aa028  ! 53: LDX_I	ldx	[%r10 + 0x0028], %r16
	.word 0xe0328008  ! 54: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe0738008  ! 56: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe422e008  ! 57: STW_I	stw	%r18, [%r11 + 0x0008]
	.word 0xe04b6000  ! 58: LDSB_I	ldsb	[%r13 + 0x0000], %r16
	.word 0xe049a018  ! 63: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec71e000  ! 67: STX_I	stx	%r22, [%r7 + 0x0000]
	.word 0xe071c008  ! 70: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe0528008  ! 72: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe44b8008  ! 73: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe022e028  ! 78: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xe0134008  ! 84: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe809c008  ! 86: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xe452e030  ! 90: LDSH_I	ldsh	[%r11 + 0x0030], %r18
	.word 0xe84ba030  ! 92: LDSB_I	ldsb	[%r14 + 0x0030], %r20
	.word 0xec22e020  ! 93: STW_I	stw	%r22, [%r11 + 0x0020]
	.word 0xe83ba030  ! 94: STD_I	std	%r20, [%r14 + 0x0030]
	.word 0xe4538008  ! 99: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xe421e010  ! 101: STW_I	stw	%r18, [%r7 + 0x0010]
	.word 0xec332010  ! 107: STH_I	sth	%r22, [%r12 + 0x0010]
	.word 0xe023a010  ! 109: STW_I	stw	%r16, [%r14 + 0x0010]
	.word 0xec4ae028  ! 115: LDSB_I	ldsb	[%r11 + 0x0028], %r22
	.word 0xe072e008  ! 116: STX_I	stx	%r16, [%r11 + 0x0008]
	.word 0xec130008  ! 117: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe04ac008  ! 120: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe40b8008  ! 126: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xe02ba020  ! 128: STB_I	stb	%r16, [%r14 + 0x0020]
	.word 0xe052a028  ! 133: LDSH_I	ldsh	[%r10 + 0x0028], %r16
	.word 0xe42aa028  ! 139: STB_I	stb	%r18, [%r10 + 0x0028]
	.word 0xe821a030  ! 140: STW_I	stw	%r20, [%r6 + 0x0030]
	.word 0xe0732030  ! 141: STX_I	stx	%r16, [%r12 + 0x0030]
	.word 0xe0234008  ! 142: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe022e038  ! 145: STW_I	stw	%r16, [%r11 + 0x0038]
	.word 0xec2b0008  ! 149: STB_R	stb	%r22, [%r12 + %r8]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xec098008  ! 154: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe81b2030  ! 157: LDD_I	ldd	[%r12 + 0x0030], %r20
	.word 0xe03ac008  ! 159: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe8036008  ! 162: LDUW_I	lduw	[%r13 + 0x0008], %r20
	.word 0xe04b2010  ! 165: LDSB_I	ldsb	[%r12 + 0x0010], %r16
	.word 0xe021a008  ! 167: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe0298008  ! 168: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec31c008  ! 169: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xec2b0008  ! 172: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe012e028  ! 178: LDUH_I	lduh	[%r11 + 0x0028], %r16
	.word 0xe409a038  ! 180: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe029a028  ! 182: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe821e038  ! 183: STW_I	stw	%r20, [%r7 + 0x0038]
	.word 0xe4736000  ! 185: STX_I	stx	%r18, [%r13 + 0x0000]
	.word 0xe03a8008  ! 186: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe0438008  ! 189: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe0018008  ! 191: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xec518008  ! 196: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xec51a008  ! 197: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe032e010  ! 201: STH_I	sth	%r16, [%r11 + 0x0010]
	.word 0xe8018008  ! 205: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe011e010  ! 207: LDUH_I	lduh	[%r7 + 0x0010], %r16
	.word 0xe009c008  ! 209: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xec3b8008  ! 211: STD_R	std	%r22, [%r14 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe472a020  ! 215: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe42b0008  ! 219: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe8238008  ! 221: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe052a000  ! 225: LDSH_I	ldsh	[%r10 + 0x0000], %r16
	.word 0xe83ae020  ! 226: STD_I	std	%r20, [%r11 + 0x0020]
	.word 0xec018008  ! 228: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe021a018  ! 229: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xec3a8008  ! 232: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe02aa028  ! 239: STB_I	stb	%r16, [%r10 + 0x0028]
	.word 0xe422c008  ! 242: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe412a030  ! 253: LDUH_I	lduh	[%r10 + 0x0030], %r18
	.word 0xe449e008  ! 255: LDSB_I	ldsb	[%r7 + 0x0008], %r18
	.word 0xe841a020  ! 260: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	.word 0xe032e028  ! 266: STH_I	sth	%r16, [%r11 + 0x0028]
	.word 0xec232030  ! 267: STW_I	stw	%r22, [%r12 + 0x0030]
	.word 0xe429a028  ! 269: STB_I	stb	%r18, [%r6 + 0x0028]
	.word 0xe011a020  ! 270: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xe441e028  ! 275: LDSW_I	ldsw	[%r7 + 0x0028], %r18
	.word 0xe4428008  ! 279: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xec72a000  ! 281: STX_I	stx	%r22, [%r10 + 0x0000]
	.word 0xec434008  ! 284: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe02ac008  ! 285: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe452e028  ! 293: LDSH_I	ldsh	[%r11 + 0x0028], %r18
	.word 0xe4538008  ! 294: LDSH_R	ldsh	[%r14 + %r8], %r18
! Thread sync; stream = 19; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
	.word 0xec59a038  ! 2: LDX_I	ldx	[%r6 + 0x0038], %r22
	.word 0xe0032028  ! 5: LDUW_I	lduw	[%r12 + 0x0028], %r16
	.word 0xe429c008  ! 12: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe0728008  ! 16: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe4328008  ! 20: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xec234008  ! 21: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe442c008  ! 24: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe0736000  ! 26: STX_I	stx	%r16, [%r13 + 0x0000]
	.word 0xe42b8008  ! 28: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe0430008  ! 29: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe0130008  ! 31: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe4718008  ! 39: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe03aa010  ! 42: STD_I	std	%r16, [%r10 + 0x0010]
	.word 0xe841c008  ! 47: LDSW_R	ldsw	[%r7 + %r8], %r20
	.word 0xe809e010  ! 48: LDUB_I	ldub	[%r7 + 0x0010], %r20
	.word 0xe8734008  ! 49: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe421e000  ! 51: STW_I	stw	%r18, [%r7 + 0x0000]
	.word 0xe801e018  ! 52: LDUW_I	lduw	[%r7 + 0x0018], %r20
	.word 0xe019a000  ! 53: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xe8332038  ! 54: STH_I	sth	%r20, [%r12 + 0x0038]
	.word 0xe029e020  ! 56: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xe4218008  ! 57: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe01aa000  ! 58: LDD_I	ldd	[%r10 + 0x0000], %r16
	.word 0xe41aa008  ! 63: LDD_I	ldd	[%r10 + 0x0008], %r18
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe4318008  ! 67: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe0234008  ! 70: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe841c008  ! 72: LDSW_R	ldsw	[%r7 + %r8], %r20
	.word 0xe812e000  ! 73: LDUH_I	lduh	[%r11 + 0x0000], %r20
	.word 0xe02ba000  ! 78: STB_I	stb	%r16, [%r14 + 0x0000]
	.word 0xe01a8008  ! 84: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe05b8008  ! 86: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe802c008  ! 90: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe809c008  ! 92: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xe829c008  ! 93: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe0338008  ! 94: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe84ac008  ! 99: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe029a030  ! 101: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xe431c008  ! 107: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe072e030  ! 109: STX_I	stx	%r16, [%r11 + 0x0030]
	.word 0xe812e008  ! 115: LDUH_I	lduh	[%r11 + 0x0008], %r20
	.word 0xec31e000  ! 116: STH_I	sth	%r22, [%r7 + 0x0000]
	.word 0xe859e008  ! 117: LDX_I	ldx	[%r7 + 0x0008], %r20
	.word 0xe042e018  ! 120: LDSW_I	ldsw	[%r11 + 0x0018], %r16
	.word 0xe0532038  ! 126: LDSH_I	ldsh	[%r12 + 0x0038], %r16
	.word 0xe839e000  ! 128: STD_I	std	%r20, [%r7 + 0x0000]
	.word 0xe0432000  ! 133: LDSW_I	ldsw	[%r12 + 0x0000], %r16
	.word 0xe8730008  ! 139: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe02b4008  ! 140: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe0398008  ! 141: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe83a8008  ! 142: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe021a030  ! 145: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xe832e008  ! 149: STH_I	sth	%r20, [%r11 + 0x0008]
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe41b0008  ! 154: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe452a008  ! 157: LDSH_I	ldsh	[%r10 + 0x0008], %r18
	.word 0xec2aa018  ! 159: STB_I	stb	%r22, [%r10 + 0x0018]
	.word 0xe44b2000  ! 162: LDSB_I	ldsb	[%r12 + 0x0000], %r18
	.word 0xec11a020  ! 165: LDUH_I	lduh	[%r6 + 0x0020], %r22
	.word 0xe03b0008  ! 167: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe433a020  ! 168: STH_I	sth	%r18, [%r14 + 0x0020]
	.word 0xe029c008  ! 169: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe873a018  ! 172: STX_I	stx	%r20, [%r14 + 0x0018]
	.word 0xe0128008  ! 178: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe842a030  ! 180: LDSW_I	ldsw	[%r10 + 0x0030], %r20
	.word 0xe0230008  ! 182: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe821c008  ! 183: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe071a038  ! 185: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe871a028  ! 186: STX_I	stx	%r20, [%r6 + 0x0028]
	.word 0xe019c008  ! 189: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xec5b8008  ! 191: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe441a008  ! 196: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	.word 0xe45b2030  ! 197: LDX_I	ldx	[%r12 + 0x0030], %r18
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe0730008  ! 201: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe05ba018  ! 205: LDX_I	ldx	[%r14 + 0x0018], %r16
	.word 0xe001e020  ! 207: LDUW_I	lduw	[%r7 + 0x0020], %r16
	.word 0xe841a000  ! 209: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	.word 0xe0234008  ! 211: STW_R	stw	%r16, [%r13 + %r8]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe02ae000  ! 215: STB_I	stb	%r16, [%r11 + 0x0000]
	.word 0xe831a030  ! 219: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xe02b2008  ! 221: STB_I	stb	%r16, [%r12 + 0x0008]
	.word 0xe8432028  ! 225: LDSW_I	ldsw	[%r12 + 0x0028], %r20
	.word 0xe039c008  ! 226: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe45ac008  ! 228: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe43ae030  ! 229: STD_I	std	%r18, [%r11 + 0x0030]
	.word 0xe422a008  ! 232: STW_I	stw	%r18, [%r10 + 0x0008]
	.word 0xe02b6038  ! 239: STB_I	stb	%r16, [%r13 + 0x0038]
	.word 0xe8228008  ! 242: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe0036028  ! 253: LDUW_I	lduw	[%r13 + 0x0028], %r16
	.word 0xec0ba008  ! 255: LDUB_I	ldub	[%r14 + 0x0008], %r22
	.word 0xe843a030  ! 260: LDSW_I	ldsw	[%r14 + 0x0030], %r20
	.word 0xe0736018  ! 266: STX_I	stx	%r16, [%r13 + 0x0018]
	.word 0xec31e028  ! 267: STH_I	sth	%r22, [%r7 + 0x0028]
	.word 0xe8736000  ! 269: STX_I	stx	%r20, [%r13 + 0x0000]
	.word 0xe00b0008  ! 270: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe00ac008  ! 275: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe052c008  ! 279: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe871e038  ! 281: STX_I	stx	%r20, [%r7 + 0x0038]
	.word 0xe4532038  ! 284: LDSH_I	ldsh	[%r12 + 0x0038], %r18
	.word 0xe42ba000  ! 285: STB_I	stb	%r18, [%r14 + 0x0000]
	.word 0xe449a010  ! 293: LDSB_I	ldsb	[%r6 + 0x0010], %r18
	.word 0xe04b8008  ! 294: LDSB_R	ldsb	[%r14 + %r8], %r16
! Thread sync; stream = 18; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
	.word 0xe841a018  ! 2: LDSW_I	ldsw	[%r6 + 0x0018], %r20
	.word 0xe052e028  ! 5: LDSH_I	ldsh	[%r11 + 0x0028], %r16
	.word 0xe4238008  ! 12: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe033a038  ! 16: STH_I	sth	%r16, [%r14 + 0x0038]
	.word 0xe03b0008  ! 20: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe43b2018  ! 21: STD_I	std	%r18, [%r12 + 0x0018]
	.word 0xe41ac008  ! 24: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe072c008  ! 26: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe42a8008  ! 28: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe00b0008  ! 29: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe0418008  ! 31: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe42aa018  ! 39: STB_I	stb	%r18, [%r10 + 0x0018]
	.word 0xe82b8008  ! 42: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe8418008  ! 47: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe05b8008  ! 48: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe0338008  ! 49: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe43ac008  ! 51: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe419c008  ! 52: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xec5b0008  ! 53: LDX_R	ldx	[%r12 + %r8], %r22
	.word 0xe0332018  ! 54: STH_I	sth	%r16, [%r12 + 0x0018]
	.word 0xec32a008  ! 56: STH_I	sth	%r22, [%r10 + 0x0008]
	.word 0xe4234008  ! 57: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xec5a8008  ! 58: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe451e010  ! 63: LDSH_I	ldsh	[%r7 + 0x0010], %r18
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe0230008  ! 67: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe032c008  ! 70: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe04a8008  ! 72: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe0418008  ! 73: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe4218008  ! 78: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe411a028  ! 84: LDUH_I	lduh	[%r6 + 0x0028], %r18
	.word 0xe41b0008  ! 86: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe01b4008  ! 90: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xec128008  ! 92: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe031e010  ! 93: STH_I	sth	%r16, [%r7 + 0x0010]
	.word 0xe821a038  ! 94: STW_I	stw	%r20, [%r6 + 0x0038]
	.word 0xe00b4008  ! 99: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe0230008  ! 101: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe472c008  ! 107: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xec332028  ! 109: STH_I	sth	%r22, [%r12 + 0x0028]
	.word 0xec4aa018  ! 115: LDSB_I	ldsb	[%r10 + 0x0018], %r22
	.word 0xe431a028  ! 116: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xe84b8008  ! 117: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xec09c008  ! 120: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xe4118008  ! 126: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe02b0008  ! 128: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe41aa008  ! 133: LDD_I	ldd	[%r10 + 0x0008], %r18
	.word 0xec21e028  ! 139: STW_I	stw	%r22, [%r7 + 0x0028]
	.word 0xe02ac008  ! 140: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe02ba038  ! 141: STB_I	stb	%r16, [%r14 + 0x0038]
	.word 0xe829c008  ! 142: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe439c008  ! 145: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe4734008  ! 149: STX_R	stx	%r18, [%r13 + %r8]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe419e020  ! 154: LDD_I	ldd	[%r7 + 0x0020], %r18
	.word 0xe041a000  ! 157: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe82b6030  ! 159: STB_I	stb	%r20, [%r13 + 0x0030]
	.word 0xe4530008  ! 162: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe019a020  ! 165: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xe4218008  ! 167: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec338008  ! 168: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe871a028  ! 169: STX_I	stx	%r20, [%r6 + 0x0028]
	.word 0xec736010  ! 172: STX_I	stx	%r22, [%r13 + 0x0010]
	.word 0xec11c008  ! 178: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xe449a000  ! 180: LDSB_I	ldsb	[%r6 + 0x0000], %r18
	.word 0xe0318008  ! 182: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec234008  ! 183: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe8232028  ! 185: STW_I	stw	%r20, [%r12 + 0x0028]
	.word 0xe43b4008  ! 186: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe049a010  ! 189: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xe841a020  ! 191: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	.word 0xe009a010  ! 196: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe84b2010  ! 197: LDSB_I	ldsb	[%r12 + 0x0010], %r20
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe8718008  ! 201: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe009a008  ! 205: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xe0532010  ! 207: LDSH_I	ldsh	[%r12 + 0x0010], %r16
	.word 0xe049c008  ! 209: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xec22a020  ! 211: STW_I	stw	%r22, [%r10 + 0x0020]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec3b8008  ! 215: STD_R	std	%r22, [%r14 + %r8]
	.word 0xec332000  ! 219: STH_I	sth	%r22, [%r12 + 0x0000]
	.word 0xec39c008  ! 221: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe441c008  ! 225: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe032e038  ! 226: STH_I	sth	%r16, [%r11 + 0x0038]
	.word 0xec19a018  ! 228: LDD_I	ldd	[%r6 + 0x0018], %r22
	.word 0xe022a028  ! 229: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xe4728008  ! 232: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec71a028  ! 239: STX_I	stx	%r22, [%r6 + 0x0028]
	.word 0xe421a008  ! 242: STW_I	stw	%r18, [%r6 + 0x0008]
	.word 0xec0ba020  ! 253: LDUB_I	ldub	[%r14 + 0x0020], %r22
	.word 0xec01a010  ! 255: LDUW_I	lduw	[%r6 + 0x0010], %r22
	.word 0xe8018008  ! 260: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe871a030  ! 266: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xec232018  ! 267: STW_I	stw	%r22, [%r12 + 0x0018]
	.word 0xe031a020  ! 269: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe0198008  ! 270: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe04b0008  ! 275: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe05ae028  ! 279: LDX_I	ldx	[%r11 + 0x0028], %r16
	.word 0xe039a038  ! 281: STD_I	std	%r16, [%r6 + 0x0038]
	.word 0xe011a008  ! 284: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xe42b4008  ! 285: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xec0ba028  ! 293: LDUB_I	ldub	[%r14 + 0x0028], %r22
	.word 0xe0432010  ! 294: LDSW_I	ldsw	[%r12 + 0x0010], %r16
! Thread sync; stream = 17; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
	.word 0xec1b6008  ! 2: LDD_I	ldd	[%r13 + 0x0008], %r22
	.word 0xe0518008  ! 5: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe429e000  ! 12: STB_I	stb	%r18, [%r7 + 0x0000]
	.word 0xe472a000  ! 16: STX_I	stx	%r18, [%r10 + 0x0000]
	.word 0xe8238008  ! 20: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe0218008  ! 21: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe009a028  ! 24: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xe023a030  ! 26: STW_I	stw	%r16, [%r14 + 0x0030]
	.word 0xec738008  ! 28: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe04ba030  ! 29: LDSB_I	ldsb	[%r14 + 0x0030], %r16
	.word 0xe85ac008  ! 31: LDX_R	ldx	[%r11 + %r8], %r20
	.word 0xec72c008  ! 39: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec39e018  ! 42: STD_I	std	%r22, [%r7 + 0x0018]
	.word 0xe84a8008  ! 47: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe011a008  ! 48: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xe031e018  ! 49: STH_I	sth	%r16, [%r7 + 0x0018]
	.word 0xe02ae008  ! 51: STB_I	stb	%r16, [%r11 + 0x0008]
	.word 0xe811c008  ! 52: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xec198008  ! 53: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe02b0008  ! 54: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe03b2018  ! 56: STD_I	std	%r16, [%r12 + 0x0018]
	.word 0xe871a030  ! 57: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xe012c008  ! 58: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe85b6020  ! 63: LDX_I	ldx	[%r13 + 0x0020], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe829a000  ! 67: STB_I	stb	%r20, [%r6 + 0x0000]
	.word 0xe43a8008  ! 70: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe40a8008  ! 72: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe81ba038  ! 73: LDD_I	ldd	[%r14 + 0x0038], %r20
	.word 0xe0734008  ! 78: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe412e028  ! 84: LDUH_I	lduh	[%r11 + 0x0028], %r18
	.word 0xe843a000  ! 86: LDSW_I	ldsw	[%r14 + 0x0000], %r20
	.word 0xe053a010  ! 90: LDSH_I	ldsh	[%r14 + 0x0010], %r16
	.word 0xe45b2008  ! 92: LDX_I	ldx	[%r12 + 0x0008], %r18
	.word 0xe42ac008  ! 93: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe832c008  ! 94: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe041e038  ! 99: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	.word 0xec728008  ! 101: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe4236018  ! 107: STW_I	stw	%r18, [%r13 + 0x0018]
	.word 0xe871c008  ! 109: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe8438008  ! 115: LDSW_R	ldsw	[%r14 + %r8], %r20
	.word 0xec72c008  ! 116: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe4018008  ! 117: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xec0b6028  ! 120: LDUB_I	ldub	[%r13 + 0x0028], %r22
	.word 0xe0198008  ! 126: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe02aa008  ! 128: STB_I	stb	%r16, [%r10 + 0x0008]
	.word 0xe04a8008  ! 133: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xec298008  ! 139: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe0236018  ! 140: STW_I	stw	%r16, [%r13 + 0x0018]
	.word 0xec732030  ! 141: STX_I	stx	%r22, [%r12 + 0x0030]
	.word 0xe029a010  ! 142: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe02a8008  ! 145: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe0328008  ! 149: STH_R	sth	%r16, [%r10 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xec130008  ! 154: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe452e030  ! 157: LDSH_I	ldsh	[%r11 + 0x0030], %r18
	.word 0xe431c008  ! 159: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xec12a028  ! 162: LDUH_I	lduh	[%r10 + 0x0028], %r22
	.word 0xe04b8008  ! 165: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xec71a038  ! 167: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xe073a008  ! 168: STX_I	stx	%r16, [%r14 + 0x0008]
	.word 0xe8234008  ! 169: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe42b0008  ! 172: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xec0b4008  ! 178: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xec4b6028  ! 180: LDSB_I	ldsb	[%r13 + 0x0028], %r22
	.word 0xe8336038  ! 182: STH_I	sth	%r20, [%r13 + 0x0038]
	.word 0xe8730008  ! 183: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe4718008  ! 185: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe022a020  ! 186: STW_I	stw	%r16, [%r10 + 0x0020]
	.word 0xe01b8008  ! 189: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe459a008  ! 191: LDX_I	ldx	[%r6 + 0x0008], %r18
	.word 0xec134008  ! 196: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xe052c008  ! 197: LDSH_R	ldsh	[%r11 + %r8], %r16
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0728008  ! 201: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe0538008  ! 205: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe8598008  ! 207: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe05aa010  ! 209: LDX_I	ldx	[%r10 + 0x0010], %r16
	.word 0xe071a018  ! 211: STX_I	stx	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec3b4008  ! 215: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe422a020  ! 219: STW_I	stw	%r18, [%r10 + 0x0020]
	.word 0xe831a008  ! 221: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xe809e018  ! 225: LDUB_I	ldub	[%r7 + 0x0018], %r20
	.word 0xec298008  ! 226: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe01ae008  ! 228: LDD_I	ldd	[%r11 + 0x0008], %r16
	.word 0xe03a8008  ! 229: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec738008  ! 232: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe0218008  ! 239: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe429e000  ! 242: STB_I	stb	%r18, [%r7 + 0x0000]
	.word 0xe85ba018  ! 253: LDX_I	ldx	[%r14 + 0x0018], %r20
	.word 0xe41b8008  ! 255: LDD_R	ldd	[%r14 + %r8], %r18
	.word 0xe0032000  ! 260: LDUW_I	lduw	[%r12 + 0x0000], %r16
	.word 0xe03a8008  ! 266: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe02aa030  ! 267: STB_I	stb	%r16, [%r10 + 0x0030]
	.word 0xe4232020  ! 269: STW_I	stw	%r18, [%r12 + 0x0020]
	.word 0xe4498008  ! 270: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe85b0008  ! 275: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe80ae028  ! 279: LDUB_I	ldub	[%r11 + 0x0028], %r20
	.word 0xec71e038  ! 281: STX_I	stx	%r22, [%r7 + 0x0038]
	.word 0xe441a018  ! 284: LDSW_I	ldsw	[%r6 + 0x0018], %r18
	.word 0xec21e038  ! 285: STW_I	stw	%r22, [%r7 + 0x0038]
	.word 0xe05a8008  ! 293: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe449a018  ! 294: LDSB_I	ldsb	[%r6 + 0x0018], %r18
! Thread sync; stream = 16; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
	.word 0xe0532038  ! 2: LDSH_I	ldsh	[%r12 + 0x0038], %r16
	.word 0xe84ac008  ! 5: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe833a000  ! 12: STH_I	sth	%r20, [%r14 + 0x0000]
	.word 0xe02b6018  ! 16: STB_I	stb	%r16, [%r13 + 0x0018]
	.word 0xe831c008  ! 20: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe0734008  ! 21: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe809a020  ! 24: LDUB_I	ldub	[%r6 + 0x0020], %r20
	.word 0xec398008  ! 26: STD_R	std	%r22, [%r6 + %r8]
	.word 0xec2ae028  ! 28: STB_I	stb	%r22, [%r11 + 0x0028]
	.word 0xe0138008  ! 29: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe851e030  ! 31: LDSH_I	ldsh	[%r7 + 0x0030], %r20
	.word 0xe031e018  ! 39: STH_I	sth	%r16, [%r7 + 0x0018]
	.word 0xe0230008  ! 42: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xec0b4008  ! 47: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xec51c008  ! 48: LDSH_R	ldsh	[%r7 + %r8], %r22
	.word 0xe032e020  ! 49: STH_I	sth	%r16, [%r11 + 0x0020]
	.word 0xe0218008  ! 51: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe842c008  ! 52: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xec01c008  ! 53: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe072a030  ! 54: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xe431a000  ! 56: STH_I	sth	%r18, [%r6 + 0x0000]
	.word 0xe03b8008  ! 57: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe04b0008  ! 58: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe052e010  ! 63: LDSH_I	ldsh	[%r11 + 0x0010], %r16
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe439a008  ! 67: STD_I	std	%r18, [%r6 + 0x0008]
	.word 0xe8218008  ! 70: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe05b0008  ! 72: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe409c008  ! 73: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe42b6008  ! 78: STB_I	stb	%r18, [%r13 + 0x0008]
	.word 0xec098008  ! 84: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xec538008  ! 86: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe45ba028  ! 90: LDX_I	ldx	[%r14 + 0x0028], %r18
	.word 0xe81aa030  ! 92: LDD_I	ldd	[%r10 + 0x0030], %r20
	.word 0xe0218008  ! 93: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe03aa018  ! 94: STD_I	std	%r16, [%r10 + 0x0018]
	.word 0xe01b4008  ! 99: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe422e038  ! 101: STW_I	stw	%r18, [%r11 + 0x0038]
	.word 0xe031e038  ! 107: STH_I	sth	%r16, [%r7 + 0x0038]
	.word 0xe033a038  ! 109: STH_I	sth	%r16, [%r14 + 0x0038]
	.word 0xe049c008  ! 115: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe421e000  ! 116: STW_I	stw	%r18, [%r7 + 0x0000]
	.word 0xec02a020  ! 117: LDUW_I	lduw	[%r10 + 0x0020], %r22
	.word 0xe0518008  ! 120: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8118008  ! 126: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xec22e008  ! 128: STW_I	stw	%r22, [%r11 + 0x0008]
	.word 0xe45ac008  ! 133: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe0228008  ! 139: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe4236018  ! 140: STW_I	stw	%r18, [%r13 + 0x0018]
	.word 0xec330008  ! 141: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe4736038  ! 142: STX_I	stx	%r18, [%r13 + 0x0038]
	.word 0xec3ae018  ! 145: STD_I	std	%r22, [%r11 + 0x0018]
	.word 0xe823a008  ! 149: STW_I	stw	%r20, [%r14 + 0x0008]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe403a030  ! 154: LDUW_I	lduw	[%r14 + 0x0030], %r18
	.word 0xe441c008  ! 157: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe8730008  ! 159: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe451a030  ! 162: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	.word 0xe419e010  ! 165: LDD_I	ldd	[%r7 + 0x0010], %r18
	.word 0xe829e028  ! 167: STB_I	stb	%r20, [%r7 + 0x0028]
	.word 0xec332020  ! 168: STH_I	sth	%r22, [%r12 + 0x0020]
	.word 0xe8318008  ! 169: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec22c008  ! 172: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xec130008  ! 178: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe05b8008  ! 180: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe032c008  ! 182: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe033a020  ! 183: STH_I	sth	%r16, [%r14 + 0x0020]
	.word 0xe83a8008  ! 185: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe8338008  ! 186: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe81b8008  ! 189: LDD_R	ldd	[%r14 + %r8], %r20
	.word 0xe01ae030  ! 191: LDD_I	ldd	[%r11 + 0x0030], %r16
	.word 0xe002c008  ! 196: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe81ae030  ! 197: LDD_I	ldd	[%r11 + 0x0030], %r20
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe031a028  ! 201: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xec0b4008  ! 205: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xe043a000  ! 207: LDSW_I	ldsw	[%r14 + 0x0000], %r16
	.word 0xec11a008  ! 209: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xe02b0008  ! 211: STB_R	stb	%r16, [%r12 + %r8]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe03b4008  ! 215: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe8232008  ! 219: STW_I	stw	%r20, [%r12 + 0x0008]
	.word 0xe873a000  ! 221: STX_I	stx	%r20, [%r14 + 0x0000]
	.word 0xec59e000  ! 225: LDX_I	ldx	[%r7 + 0x0000], %r22
	.word 0xe031e030  ! 226: STH_I	sth	%r16, [%r7 + 0x0030]
	.word 0xec59a000  ! 228: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xe8332028  ! 229: STH_I	sth	%r20, [%r12 + 0x0028]
	.word 0xe839a008  ! 232: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xec31a028  ! 239: STH_I	sth	%r22, [%r6 + 0x0028]
	.word 0xe0228008  ! 242: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe019a030  ! 253: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xe812a008  ! 255: LDUH_I	lduh	[%r10 + 0x0008], %r20
	.word 0xe0032008  ! 260: LDUW_I	lduw	[%r12 + 0x0008], %r16
	.word 0xec21a038  ! 266: STW_I	stw	%r22, [%r6 + 0x0038]
	.word 0xe0718008  ! 267: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe071e038  ! 269: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe05ba020  ! 270: LDX_I	ldx	[%r14 + 0x0020], %r16
	.word 0xe84ac008  ! 275: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe859e000  ! 279: LDX_I	ldx	[%r7 + 0x0000], %r20
	.word 0xe4218008  ! 281: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe85b2010  ! 284: LDX_I	ldx	[%r12 + 0x0010], %r20
	.word 0xe8238008  ! 285: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe449a010  ! 293: LDSB_I	ldsb	[%r6 + 0x0010], %r18
	.word 0xe041a000  ! 294: LDSW_I	ldsw	[%r6 + 0x0000], %r16
! Thread sync; stream = 15; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
	.word 0xe00ba010  ! 2: LDUB_I	ldub	[%r14 + 0x0010], %r16
	.word 0xe0532028  ! 5: LDSH_I	ldsh	[%r12 + 0x0028], %r16
	.word 0xe032e028  ! 12: STH_I	sth	%r16, [%r11 + 0x0028]
	.word 0xe03b4008  ! 16: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe839a008  ! 20: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xe022c008  ! 21: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe052c008  ! 24: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe8332038  ! 26: STH_I	sth	%r20, [%r12 + 0x0038]
	.word 0xe822c008  ! 28: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe01b0008  ! 29: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xec59c008  ! 31: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xe03ae000  ! 39: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xec72e000  ! 42: STX_I	stx	%r22, [%r11 + 0x0000]
	.word 0xec598008  ! 47: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe4128008  ! 48: LDUH_R	lduh	[%r10 + %r8], %r18
	.word 0xe8718008  ! 49: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0730008  ! 51: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe019a008  ! 52: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xec536010  ! 53: LDSH_I	ldsh	[%r13 + 0x0010], %r22
	.word 0xe0298008  ! 54: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec3b4008  ! 56: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe431a038  ! 57: STH_I	sth	%r18, [%r6 + 0x0038]
	.word 0xec02e000  ! 58: LDUW_I	lduw	[%r11 + 0x0000], %r22
	.word 0xec4ae028  ! 63: LDSB_I	ldsb	[%r11 + 0x0028], %r22
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe029c008  ! 67: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe431a008  ! 70: STH_I	sth	%r18, [%r6 + 0x0008]
	.word 0xe4198008  ! 72: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe81ac008  ! 73: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xe8730008  ! 78: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe011a038  ! 84: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xe8030008  ! 86: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe849c008  ! 90: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec534008  ! 92: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xe832a038  ! 93: STH_I	sth	%r20, [%r10 + 0x0038]
	.word 0xe029c008  ! 94: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe8418008  ! 99: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe021a020  ! 101: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe0734008  ! 107: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec39e020  ! 109: STD_I	std	%r22, [%r7 + 0x0020]
	.word 0xec018008  ! 115: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe431c008  ! 116: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe45b2038  ! 117: LDX_I	ldx	[%r12 + 0x0038], %r18
	.word 0xe052e028  ! 120: LDSH_I	ldsh	[%r11 + 0x0028], %r16
	.word 0xe41b4008  ! 126: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xec39a020  ! 128: STD_I	std	%r22, [%r6 + 0x0020]
	.word 0xe4538008  ! 133: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xec2ac008  ! 139: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe8732028  ! 140: STX_I	stx	%r20, [%r12 + 0x0028]
	.word 0xe43b4008  ! 141: STD_R	std	%r18, [%r13 + %r8]
	.word 0xec31a028  ! 142: STH_I	sth	%r22, [%r6 + 0x0028]
	.word 0xe022a020  ! 145: STW_I	stw	%r16, [%r10 + 0x0020]
	.word 0xe02ba038  ! 149: STB_I	stb	%r16, [%r14 + 0x0038]
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec598008  ! 154: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe042a018  ! 157: LDSW_I	ldsw	[%r10 + 0x0018], %r16
	.word 0xe432e000  ! 159: STH_I	sth	%r18, [%r11 + 0x0000]
	.word 0xec19a008  ! 162: LDD_I	ldd	[%r6 + 0x0008], %r22
	.word 0xe042e000  ! 165: LDSW_I	ldsw	[%r11 + 0x0000], %r16
	.word 0xe473a020  ! 167: STX_I	stx	%r18, [%r14 + 0x0020]
	.word 0xe822c008  ! 168: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe02ac008  ! 169: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe0732020  ! 172: STX_I	stx	%r16, [%r12 + 0x0020]
	.word 0xec0ba008  ! 178: LDUB_I	ldub	[%r14 + 0x0008], %r22
	.word 0xe801a010  ! 180: LDUW_I	lduw	[%r6 + 0x0010], %r20
	.word 0xe42ac008  ! 182: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe029c008  ! 183: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe82b8008  ! 185: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe4734008  ! 186: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe059a000  ! 189: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe0138008  ! 191: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec0aa008  ! 196: LDUB_I	ldub	[%r10 + 0x0008], %r22
	.word 0xe003a030  ! 197: LDUW_I	lduw	[%r14 + 0x0030], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe82ac008  ! 201: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe019a000  ! 205: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xe85b2038  ! 207: LDX_I	ldx	[%r12 + 0x0038], %r20
	.word 0xe0132018  ! 209: LDUH_I	lduh	[%r12 + 0x0018], %r16
	.word 0xe02a8008  ! 211: STB_R	stb	%r16, [%r10 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe83ac008  ! 215: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe422a038  ! 219: STW_I	stw	%r18, [%r10 + 0x0038]
	.word 0xe82ba038  ! 221: STB_I	stb	%r20, [%r14 + 0x0038]
	.word 0xe04b2000  ! 225: LDSB_I	ldsb	[%r12 + 0x0000], %r16
	.word 0xe023a028  ! 226: STW_I	stw	%r16, [%r14 + 0x0028]
	.word 0xe00b0008  ! 228: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe42b6018  ! 229: STB_I	stb	%r18, [%r13 + 0x0018]
	.word 0xe03ae008  ! 232: STD_I	std	%r16, [%r11 + 0x0008]
	.word 0xe02aa010  ! 239: STB_I	stb	%r16, [%r10 + 0x0010]
	.word 0xe4718008  ! 242: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe051e038  ! 253: LDSH_I	ldsh	[%r7 + 0x0038], %r16
	.word 0xec5ae030  ! 255: LDX_I	ldx	[%r11 + 0x0030], %r22
	.word 0xe45b2018  ! 260: LDX_I	ldx	[%r12 + 0x0018], %r18
	.word 0xe0718008  ! 266: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec330008  ! 267: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe0398008  ! 269: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe051a018  ! 270: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe041c008  ! 275: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe802e028  ! 279: LDUW_I	lduw	[%r11 + 0x0028], %r20
	.word 0xe42b4008  ! 281: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe011a000  ! 284: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xec39a020  ! 285: STD_I	std	%r22, [%r6 + 0x0020]
	.word 0xec518008  ! 293: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe841a018  ! 294: LDSW_I	ldsw	[%r6 + 0x0018], %r20
! Thread sync; stream = 14; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
	.word 0xec09a008  ! 2: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xe45b0008  ! 5: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe039c008  ! 12: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe82aa010  ! 16: STB_I	stb	%r20, [%r10 + 0x0010]
	.word 0xe0318008  ! 20: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe0338008  ! 21: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe85ba018  ! 24: LDX_I	ldx	[%r14 + 0x0018], %r20
	.word 0xe421a010  ! 26: STW_I	stw	%r18, [%r6 + 0x0010]
	.word 0xe071a010  ! 28: STX_I	stx	%r16, [%r6 + 0x0010]
	.word 0xec0ac008  ! 29: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xe0128008  ! 31: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xec39c008  ! 39: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe02a8008  ! 42: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe01b0008  ! 47: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe059e030  ! 48: LDX_I	ldx	[%r7 + 0x0030], %r16
	.word 0xe4232010  ! 49: STW_I	stw	%r18, [%r12 + 0x0010]
	.word 0xe4728008  ! 51: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe849a018  ! 52: LDSB_I	ldsb	[%r6 + 0x0018], %r20
	.word 0xe451c008  ! 53: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe872e010  ! 54: STX_I	stx	%r20, [%r11 + 0x0010]
	.word 0xe831a000  ! 56: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xe4230008  ! 57: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe45b0008  ! 58: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe0030008  ! 63: LDUW_R	lduw	[%r12 + %r8], %r16
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe872c008  ! 67: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xe031e008  ! 70: STH_I	sth	%r16, [%r7 + 0x0008]
	.word 0xe0530008  ! 72: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe019e038  ! 73: LDD_I	ldd	[%r7 + 0x0038], %r16
	.word 0xe039a010  ! 78: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe053a020  ! 84: LDSH_I	ldsh	[%r14 + 0x0020], %r16
	.word 0xec01a038  ! 86: LDUW_I	lduw	[%r6 + 0x0038], %r22
	.word 0xe801a018  ! 90: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xe0018008  ! 92: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe839a000  ! 93: STD_I	std	%r20, [%r6 + 0x0000]
	.word 0xec2b2030  ! 94: STB_I	stb	%r22, [%r12 + 0x0030]
	.word 0xe0418008  ! 99: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec734008  ! 101: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe039a010  ! 107: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe42ac008  ! 109: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xec49a028  ! 115: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xe4732018  ! 116: STX_I	stx	%r18, [%r12 + 0x0018]
	.word 0xe402c008  ! 117: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe8030008  ! 120: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe40aa010  ! 126: LDUB_I	ldub	[%r10 + 0x0010], %r18
	.word 0xe4736038  ! 128: STX_I	stx	%r18, [%r13 + 0x0038]
	.word 0xe05b0008  ! 133: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xec336008  ! 139: STH_I	sth	%r22, [%r13 + 0x0008]
	.word 0xe43b0008  ! 140: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe4228008  ! 141: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe42b0008  ! 142: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe42ba008  ! 145: STB_I	stb	%r18, [%r14 + 0x0008]
	.word 0xe4736000  ! 149: STX_I	stx	%r18, [%r13 + 0x0000]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xec532000  ! 154: LDSH_I	ldsh	[%r12 + 0x0000], %r22
	.word 0xe809e030  ! 157: LDUB_I	ldub	[%r7 + 0x0030], %r20
	.word 0xe8298008  ! 159: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xec5b2008  ! 162: LDX_I	ldx	[%r12 + 0x0008], %r22
	.word 0xe81b6028  ! 165: LDD_I	ldd	[%r13 + 0x0028], %r20
	.word 0xec2b2038  ! 167: STB_I	stb	%r22, [%r12 + 0x0038]
	.word 0xe022a030  ! 168: STW_I	stw	%r16, [%r10 + 0x0030]
	.word 0xe4398008  ! 169: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe0318008  ! 172: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe802e010  ! 178: LDUW_I	lduw	[%r11 + 0x0010], %r20
	.word 0xe05b2038  ! 180: LDX_I	ldx	[%r12 + 0x0038], %r16
	.word 0xe421a020  ! 182: STW_I	stw	%r18, [%r6 + 0x0020]
	.word 0xe8330008  ! 183: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe0218008  ! 185: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec21c008  ! 186: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe019a008  ! 189: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe042a030  ! 191: LDSW_I	ldsw	[%r10 + 0x0030], %r16
	.word 0xe012a030  ! 196: LDUH_I	lduh	[%r10 + 0x0030], %r16
	.word 0xe8138008  ! 197: LDUH_R	lduh	[%r14 + %r8], %r20
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0298008  ! 201: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe049a038  ! 205: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xe8538008  ! 207: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xec49a000  ! 209: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xec33a000  ! 211: STH_I	sth	%r22, [%r14 + 0x0000]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe021e038  ! 215: STW_I	stw	%r16, [%r7 + 0x0038]
	.word 0xec232030  ! 219: STW_I	stw	%r22, [%r12 + 0x0030]
	.word 0xec33a038  ! 221: STH_I	sth	%r22, [%r14 + 0x0038]
	.word 0xec19a038  ! 225: LDD_I	ldd	[%r6 + 0x0038], %r22
	.word 0xe0730008  ! 226: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe009a038  ! 228: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xe8298008  ! 229: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe0238008  ! 232: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe02ac008  ! 239: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe43ae008  ! 242: STD_I	std	%r18, [%r11 + 0x0008]
	.word 0xe05b8008  ! 253: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xec418008  ! 255: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe01b2018  ! 260: LDD_I	ldd	[%r12 + 0x0018], %r16
	.word 0xe02b4008  ! 266: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xec298008  ! 267: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe4730008  ! 269: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe84ba028  ! 270: LDSB_I	ldsb	[%r14 + 0x0028], %r20
	.word 0xe812a028  ! 275: LDUH_I	lduh	[%r10 + 0x0028], %r20
	.word 0xec41e018  ! 279: LDSW_I	ldsw	[%r7 + 0x0018], %r22
	.word 0xe839c008  ! 281: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe41aa038  ! 284: LDD_I	ldd	[%r10 + 0x0038], %r18
	.word 0xec32c008  ! 285: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe8534008  ! 293: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xe019c008  ! 294: LDD_R	ldd	[%r7 + %r8], %r16
! Thread sync; stream = 13; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
	.word 0xe851e028  ! 2: LDSH_I	ldsh	[%r7 + 0x0028], %r20
	.word 0xe013a000  ! 5: LDUH_I	lduh	[%r14 + 0x0000], %r16
	.word 0xe873a008  ! 12: STX_I	stx	%r20, [%r14 + 0x0008]
	.word 0xe033a020  ! 16: STH_I	sth	%r16, [%r14 + 0x0020]
	.word 0xec218008  ! 20: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe071a008  ! 21: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe00b0008  ! 24: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xec3ba028  ! 26: STD_I	std	%r22, [%r14 + 0x0028]
	.word 0xe4232010  ! 28: STW_I	stw	%r18, [%r12 + 0x0010]
	.word 0xe0134008  ! 29: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe00ba018  ! 31: LDUB_I	ldub	[%r14 + 0x0018], %r16
	.word 0xe839e030  ! 39: STD_I	std	%r20, [%r7 + 0x0030]
	.word 0xe8332018  ! 42: STH_I	sth	%r20, [%r12 + 0x0018]
	.word 0xe0038008  ! 47: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xec4b8008  ! 48: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe871e008  ! 49: STX_I	stx	%r20, [%r7 + 0x0008]
	.word 0xe0330008  ! 51: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe401a000  ! 52: LDUW_I	lduw	[%r6 + 0x0000], %r18
	.word 0xe04b4008  ! 53: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xec2aa020  ! 54: STB_I	stb	%r22, [%r10 + 0x0020]
	.word 0xe0234008  ! 56: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe02b4008  ! 57: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe443a018  ! 58: LDSW_I	ldsw	[%r14 + 0x0018], %r18
	.word 0xe00b0008  ! 63: LDUB_R	ldub	[%r12 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe02ba008  ! 67: STB_I	stb	%r16, [%r14 + 0x0008]
	.word 0xe021a030  ! 70: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xe05aa020  ! 72: LDX_I	ldx	[%r10 + 0x0020], %r16
	.word 0xec49a030  ! 73: LDSB_I	ldsb	[%r6 + 0x0030], %r22
	.word 0xe02ae020  ! 78: STB_I	stb	%r16, [%r11 + 0x0020]
	.word 0xe8128008  ! 84: LDUH_R	lduh	[%r10 + %r8], %r20
	.word 0xe8098008  ! 86: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe0436018  ! 90: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	.word 0xec02c008  ! 92: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xec39a000  ! 93: STD_I	std	%r22, [%r6 + 0x0000]
	.word 0xe831e028  ! 94: STH_I	sth	%r20, [%r7 + 0x0028]
	.word 0xe01aa008  ! 99: LDD_I	ldd	[%r10 + 0x0008], %r16
	.word 0xe0398008  ! 101: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe02b8008  ! 107: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe071e000  ! 109: STX_I	stx	%r16, [%r7 + 0x0000]
	.word 0xe85ae030  ! 115: LDX_I	ldx	[%r11 + 0x0030], %r20
	.word 0xe4218008  ! 116: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe00ba038  ! 117: LDUB_I	ldub	[%r14 + 0x0038], %r16
	.word 0xe44ae008  ! 120: LDSB_I	ldsb	[%r11 + 0x0008], %r18
	.word 0xe81b4008  ! 126: LDD_R	ldd	[%r13 + %r8], %r20
	.word 0xe43b8008  ! 128: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe05ac008  ! 133: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe821e010  ! 139: STW_I	stw	%r20, [%r7 + 0x0010]
	.word 0xec29c008  ! 140: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe071a038  ! 141: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe82ac008  ! 142: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xec736010  ! 145: STX_I	stx	%r22, [%r13 + 0x0010]
	.word 0xe4398008  ! 149: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xec09e008  ! 154: LDUB_I	ldub	[%r7 + 0x0008], %r22
	.word 0xe051c008  ! 157: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe43ae020  ! 159: STD_I	std	%r18, [%r11 + 0x0020]
	.word 0xe012a030  ! 162: LDUH_I	lduh	[%r10 + 0x0030], %r16
	.word 0xec4ac008  ! 165: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe022a020  ! 167: STW_I	stw	%r16, [%r10 + 0x0020]
	.word 0xec218008  ! 168: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4736030  ! 169: STX_I	stx	%r18, [%r13 + 0x0030]
	.word 0xec29e000  ! 172: STB_I	stb	%r22, [%r7 + 0x0000]
	.word 0xe042e010  ! 178: LDSW_I	ldsw	[%r11 + 0x0010], %r16
	.word 0xe8132028  ! 180: LDUH_I	lduh	[%r12 + 0x0028], %r20
	.word 0xe831a030  ! 182: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xe4334008  ! 183: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe071a000  ! 185: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xec29a000  ! 186: STB_I	stb	%r22, [%r6 + 0x0000]
	.word 0xec530008  ! 189: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xec1b6020  ! 191: LDD_I	ldd	[%r13 + 0x0020], %r22
	.word 0xe00b0008  ! 196: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe4538008  ! 197: LDSH_R	ldsh	[%r14 + %r8], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe472e008  ! 201: STX_I	stx	%r18, [%r11 + 0x0008]
	.word 0xe442c008  ! 205: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe05b0008  ! 207: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe04b4008  ! 209: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe439c008  ! 211: STD_R	std	%r18, [%r7 + %r8]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe8334008  ! 215: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xe8230008  ! 219: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe03ba018  ! 221: STD_I	std	%r16, [%r14 + 0x0018]
	.word 0xe0530008  ! 225: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe429a008  ! 226: STB_I	stb	%r18, [%r6 + 0x0008]
	.word 0xec032028  ! 228: LDUW_I	lduw	[%r12 + 0x0028], %r22
	.word 0xec218008  ! 229: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe43b8008  ! 232: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe023a000  ! 239: STW_I	stw	%r16, [%r14 + 0x0000]
	.word 0xe471e028  ! 242: STX_I	stx	%r18, [%r7 + 0x0028]
	.word 0xe00b2010  ! 253: LDUB_I	ldub	[%r12 + 0x0010], %r16
	.word 0xe0518008  ! 255: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xec436018  ! 260: LDSW_I	ldsw	[%r13 + 0x0018], %r22
	.word 0xe02b2008  ! 266: STB_I	stb	%r16, [%r12 + 0x0008]
	.word 0xe0730008  ! 267: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe4232010  ! 269: STW_I	stw	%r18, [%r12 + 0x0010]
	.word 0xe80b6008  ! 270: LDUB_I	ldub	[%r13 + 0x0008], %r20
	.word 0xe8134008  ! 275: LDUH_R	lduh	[%r13 + %r8], %r20
	.word 0xec534008  ! 279: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xe422c008  ! 281: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xec11a008  ! 284: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xe031a008  ! 285: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe009a010  ! 293: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe001a018  ! 294: LDUW_I	lduw	[%r6 + 0x0018], %r16
! Thread sync; stream = 12; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
	.word 0xe4038008  ! 2: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe4032030  ! 5: LDUW_I	lduw	[%r12 + 0x0030], %r18
	.word 0xe02ba018  ! 12: STB_I	stb	%r16, [%r14 + 0x0018]
	.word 0xec21a030  ! 16: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xe8332010  ! 20: STH_I	sth	%r20, [%r12 + 0x0010]
	.word 0xe0738008  ! 21: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0598008  ! 24: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe82ba000  ! 26: STB_I	stb	%r20, [%r14 + 0x0000]
	.word 0xe422c008  ! 28: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe84ac008  ! 29: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xec4ba010  ! 31: LDSB_I	ldsb	[%r14 + 0x0010], %r22
	.word 0xe821c008  ! 39: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe02b8008  ! 42: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe85aa020  ! 47: LDX_I	ldx	[%r10 + 0x0020], %r20
	.word 0xe059e010  ! 48: LDX_I	ldx	[%r7 + 0x0010], %r16
	.word 0xe83b2030  ! 49: STD_I	std	%r20, [%r12 + 0x0030]
	.word 0xe429e008  ! 51: STB_I	stb	%r18, [%r7 + 0x0008]
	.word 0xe842e008  ! 52: LDSW_I	ldsw	[%r11 + 0x0008], %r20
	.word 0xe4428008  ! 53: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xe0218008  ! 54: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe42ac008  ! 56: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe0228008  ! 57: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe85b0008  ! 58: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe80b8008  ! 63: LDUB_R	ldub	[%r14 + %r8], %r20
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe433a020  ! 67: STH_I	sth	%r18, [%r14 + 0x0020]
	.word 0xe4330008  ! 70: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xec5ac008  ! 72: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe011e028  ! 73: LDUH_I	lduh	[%r7 + 0x0028], %r16
	.word 0xec21e018  ! 78: STW_I	stw	%r22, [%r7 + 0x0018]
	.word 0xe051a030  ! 84: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xec038008  ! 86: LDUW_R	lduw	[%r14 + %r8], %r22
	.word 0xe801e018  ! 90: LDUW_I	lduw	[%r7 + 0x0018], %r20
	.word 0xe04b4008  ! 92: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xec21e018  ! 93: STW_I	stw	%r22, [%r7 + 0x0018]
	.word 0xe071e028  ! 94: STX_I	stx	%r16, [%r7 + 0x0028]
	.word 0xe4518008  ! 99: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe83b2000  ! 101: STD_I	std	%r20, [%r12 + 0x0000]
	.word 0xe831a030  ! 107: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xe8728008  ! 109: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xe4434008  ! 115: LDSW_R	ldsw	[%r13 + %r8], %r18
	.word 0xe432a008  ! 116: STH_I	sth	%r18, [%r10 + 0x0008]
	.word 0xe042e000  ! 117: LDSW_I	ldsw	[%r11 + 0x0000], %r16
	.word 0xe8498008  ! 120: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xec0b2038  ! 126: LDUB_I	ldub	[%r12 + 0x0038], %r22
	.word 0xe43ae020  ! 128: STD_I	std	%r18, [%r11 + 0x0020]
	.word 0xe0034008  ! 133: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe43ac008  ! 139: STD_R	std	%r18, [%r11 + %r8]
	.word 0xec31e018  ! 140: STH_I	sth	%r22, [%r7 + 0x0018]
	.word 0xe83a8008  ! 141: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe0328008  ! 142: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xec29e028  ! 145: STB_I	stb	%r22, [%r7 + 0x0028]
	.word 0xe821c008  ! 149: STW_R	stw	%r20, [%r7 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe8036020  ! 154: LDUW_I	lduw	[%r13 + 0x0020], %r20
	.word 0xec028008  ! 157: LDUW_R	lduw	[%r10 + %r8], %r22
	.word 0xe4738008  ! 159: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe0518008  ! 162: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe852e018  ! 165: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	.word 0xe4218008  ! 167: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe4718008  ! 168: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec22e020  ! 169: STW_I	stw	%r22, [%r11 + 0x0020]
	.word 0xec2b6028  ! 172: STB_I	stb	%r22, [%r13 + 0x0028]
	.word 0xe451c008  ! 178: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xec198008  ! 180: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe0398008  ! 182: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4738008  ! 183: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe02ac008  ! 185: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe032c008  ! 186: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe819e000  ! 189: LDD_I	ldd	[%r7 + 0x0000], %r20
	.word 0xe4534008  ! 191: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe0518008  ! 196: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe051a018  ! 197: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe822a038  ! 201: STW_I	stw	%r20, [%r10 + 0x0038]
	.word 0xe012c008  ! 205: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe0598008  ! 207: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe84ae008  ! 209: LDSB_I	ldsb	[%r11 + 0x0008], %r20
	.word 0xe022e020  ! 211: STW_I	stw	%r16, [%r11 + 0x0020]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec32c008  ! 215: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe0336038  ! 219: STH_I	sth	%r16, [%r13 + 0x0038]
	.word 0xec3b2000  ! 221: STD_I	std	%r22, [%r12 + 0x0000]
	.word 0xe419a020  ! 225: LDD_I	ldd	[%r6 + 0x0020], %r18
	.word 0xe42ae020  ! 226: STB_I	stb	%r18, [%r11 + 0x0020]
	.word 0xe0536000  ! 228: LDSH_I	ldsh	[%r13 + 0x0000], %r16
	.word 0xe471e008  ! 229: STX_I	stx	%r18, [%r7 + 0x0008]
	.word 0xec39a028  ! 232: STD_I	std	%r22, [%r6 + 0x0028]
	.word 0xe0336030  ! 239: STH_I	sth	%r16, [%r13 + 0x0030]
	.word 0xe871a020  ! 242: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xe4098008  ! 253: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec49a028  ! 255: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xe8432020  ! 260: LDSW_I	ldsw	[%r12 + 0x0020], %r20
	.word 0xec39e010  ! 266: STD_I	std	%r22, [%r7 + 0x0010]
	.word 0xe0236008  ! 267: STW_I	stw	%r16, [%r13 + 0x0008]
	.word 0xe472a010  ! 269: STX_I	stx	%r18, [%r10 + 0x0010]
	.word 0xec428008  ! 270: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xe4418008  ! 275: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe042e008  ! 279: LDSW_I	ldsw	[%r11 + 0x0008], %r16
	.word 0xec2b2008  ! 281: STB_I	stb	%r22, [%r12 + 0x0008]
	.word 0xe0532030  ! 284: LDSH_I	ldsh	[%r12 + 0x0030], %r16
	.word 0xe0298008  ! 285: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe01aa030  ! 293: LDD_I	ldd	[%r10 + 0x0030], %r16
	.word 0xe81aa018  ! 294: LDD_I	ldd	[%r10 + 0x0018], %r20
! Thread sync; stream = 11; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
	.word 0xe81aa000  ! 2: LDD_I	ldd	[%r10 + 0x0000], %r20
	.word 0xe80b6030  ! 5: LDUB_I	ldub	[%r13 + 0x0030], %r20
	.word 0xec398008  ! 12: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe421e008  ! 16: STW_I	stw	%r18, [%r7 + 0x0008]
	.word 0xec32c008  ! 20: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe43ba030  ! 21: STD_I	std	%r18, [%r14 + 0x0030]
	.word 0xe45b6000  ! 24: LDX_I	ldx	[%r13 + 0x0000], %r18
	.word 0xec23a018  ! 26: STW_I	stw	%r22, [%r14 + 0x0018]
	.word 0xe022e038  ! 28: STW_I	stw	%r16, [%r11 + 0x0038]
	.word 0xec41a030  ! 29: LDSW_I	ldsw	[%r6 + 0x0030], %r22
	.word 0xe849a000  ! 31: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xe429a010  ! 39: STB_I	stb	%r18, [%r6 + 0x0010]
	.word 0xec29a038  ! 42: STB_I	stb	%r22, [%r6 + 0x0038]
	.word 0xe412c008  ! 47: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe05b4008  ! 48: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe432c008  ! 49: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe82b0008  ! 51: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe859a020  ! 52: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xe801e000  ! 53: LDUW_I	lduw	[%r7 + 0x0000], %r20
	.word 0xe0738008  ! 54: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe032c008  ! 56: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe8730008  ! 57: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe4598008  ! 58: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe40ac008  ! 63: LDUB_R	ldub	[%r11 + %r8], %r18
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe872c008  ! 67: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xec330008  ! 70: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe05b2030  ! 72: LDX_I	ldx	[%r12 + 0x0030], %r16
	.word 0xe849a028  ! 73: LDSB_I	ldsb	[%r6 + 0x0028], %r20
	.word 0xe029c008  ! 78: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe402a000  ! 84: LDUW_I	lduw	[%r10 + 0x0000], %r18
	.word 0xe45ae010  ! 86: LDX_I	ldx	[%r11 + 0x0010], %r18
	.word 0xe01b0008  ! 90: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xec5a8008  ! 92: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe82ac008  ! 93: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe0328008  ! 94: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe801a018  ! 99: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xe039a020  ! 101: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe429c008  ! 107: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe82b4008  ! 109: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe40a8008  ! 115: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe8332038  ! 116: STH_I	sth	%r20, [%r12 + 0x0038]
	.word 0xe4098008  ! 117: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec59c008  ! 120: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xe05ac008  ! 126: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe821c008  ! 128: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xec118008  ! 133: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe0334008  ! 139: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe4730008  ! 140: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xec32e000  ! 141: STH_I	sth	%r22, [%r11 + 0x0000]
	.word 0xe8718008  ! 142: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe432a038  ! 145: STH_I	sth	%r18, [%r10 + 0x0038]
	.word 0xe821e028  ! 149: STW_I	stw	%r20, [%r7 + 0x0028]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe009e020  ! 154: LDUB_I	ldub	[%r7 + 0x0020], %r16
	.word 0xe8038008  ! 157: LDUW_R	lduw	[%r14 + %r8], %r20
	.word 0xec39a020  ! 159: STD_I	std	%r22, [%r6 + 0x0020]
	.word 0xe049e028  ! 162: LDSB_I	ldsb	[%r7 + 0x0028], %r16
	.word 0xe019a010  ! 165: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xec328008  ! 167: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe0734008  ! 168: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe022c008  ! 169: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe8328008  ! 172: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe8498008  ! 178: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe009a000  ! 180: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe42a8008  ! 182: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xec31a028  ! 183: STH_I	sth	%r22, [%r6 + 0x0028]
	.word 0xe02b6038  ! 185: STB_I	stb	%r16, [%r13 + 0x0038]
	.word 0xe039c008  ! 186: STD_R	std	%r16, [%r7 + %r8]
	.word 0xec0b6020  ! 189: LDUB_I	ldub	[%r13 + 0x0020], %r22
	.word 0xe05b2010  ! 191: LDX_I	ldx	[%r12 + 0x0010], %r16
	.word 0xe0138008  ! 196: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe801a028  ! 197: LDUW_I	lduw	[%r6 + 0x0028], %r20
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe039a000  ! 201: STD_I	std	%r16, [%r6 + 0x0000]
	.word 0xe40b6000  ! 205: LDUB_I	ldub	[%r13 + 0x0000], %r18
	.word 0xe0428008  ! 207: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xec538008  ! 209: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe82b0008  ! 211: STB_R	stb	%r20, [%r12 + %r8]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe8728008  ! 215: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xec21a018  ! 219: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe4338008  ! 221: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe0118008  ! 225: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe8218008  ! 226: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe4534008  ! 228: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe02b8008  ! 229: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe0232020  ! 232: STW_I	stw	%r16, [%r12 + 0x0020]
	.word 0xe039a038  ! 239: STD_I	std	%r16, [%r6 + 0x0038]
	.word 0xec2ac008  ! 242: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe809c008  ! 253: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xe00b6038  ! 255: LDUB_I	ldub	[%r13 + 0x0038], %r16
	.word 0xe84ba018  ! 260: LDSB_I	ldsb	[%r14 + 0x0018], %r20
	.word 0xe423a018  ! 266: STW_I	stw	%r18, [%r14 + 0x0018]
	.word 0xe072c008  ! 267: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xec228008  ! 269: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe051e010  ! 270: LDSH_I	ldsh	[%r7 + 0x0010], %r16
	.word 0xe04b2020  ! 275: LDSB_I	ldsb	[%r12 + 0x0020], %r16
	.word 0xe059c008  ! 279: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe4730008  ! 281: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe0132000  ! 284: LDUH_I	lduh	[%r12 + 0x0000], %r16
	.word 0xe021a028  ! 285: STW_I	stw	%r16, [%r6 + 0x0028]
	.word 0xe401e028  ! 293: LDUW_I	lduw	[%r7 + 0x0028], %r18
	.word 0xe8198008  ! 294: LDD_R	ldd	[%r6 + %r8], %r20
! Thread sync; stream = 10; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
	.word 0xe40ba010  ! 2: LDUB_I	ldub	[%r14 + 0x0010], %r18
	.word 0xec41c008  ! 5: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe42b6020  ! 12: STB_I	stb	%r18, [%r13 + 0x0020]
	.word 0xe02b0008  ! 16: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec32a018  ! 20: STH_I	sth	%r22, [%r10 + 0x0018]
	.word 0xe02b8008  ! 21: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe851c008  ! 24: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe0732010  ! 26: STX_I	stx	%r16, [%r12 + 0x0010]
	.word 0xe03b6008  ! 28: STD_I	std	%r16, [%r13 + 0x0008]
	.word 0xec5ba018  ! 29: LDX_I	ldx	[%r14 + 0x0018], %r22
	.word 0xe0538008  ! 31: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xec31e030  ! 39: STH_I	sth	%r22, [%r7 + 0x0030]
	.word 0xe42ae028  ! 42: STB_I	stb	%r18, [%r11 + 0x0028]
	.word 0xe4498008  ! 47: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe442a028  ! 48: LDSW_I	ldsw	[%r10 + 0x0028], %r18
	.word 0xe071a018  ! 49: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xec39a028  ! 51: STD_I	std	%r22, [%r6 + 0x0028]
	.word 0xe84a8008  ! 52: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe4528008  ! 53: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xe0398008  ! 54: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe032c008  ! 56: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe821c008  ! 57: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe04b8008  ! 58: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xec12e010  ! 63: LDUH_I	lduh	[%r11 + 0x0010], %r22
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe039e038  ! 67: STD_I	std	%r16, [%r7 + 0x0038]
	.word 0xe8236038  ! 70: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xec53a008  ! 72: LDSH_I	ldsh	[%r14 + 0x0008], %r22
	.word 0xe85b2030  ! 73: LDX_I	ldx	[%r12 + 0x0030], %r20
	.word 0xe82b8008  ! 78: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xec09a008  ! 84: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xe051c008  ! 86: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xec018008  ! 90: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe04b0008  ! 92: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xec318008  ! 93: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe8738008  ! 94: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xe0098008  ! 99: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec3b0008  ! 101: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe0236038  ! 107: STW_I	stw	%r16, [%r13 + 0x0038]
	.word 0xe832a018  ! 109: STH_I	sth	%r20, [%r10 + 0x0018]
	.word 0xe0134008  ! 115: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe8234008  ! 116: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe00a8008  ! 117: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe043a000  ! 120: LDSW_I	ldsw	[%r14 + 0x0000], %r16
	.word 0xe041e038  ! 126: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	.word 0xe031c008  ! 128: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe441a010  ! 133: LDSW_I	ldsw	[%r6 + 0x0010], %r18
	.word 0xec728008  ! 139: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe0728008  ! 140: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe0728008  ! 141: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec73a038  ! 142: STX_I	stx	%r22, [%r14 + 0x0038]
	.word 0xe8734008  ! 145: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe0338008  ! 149: STH_R	sth	%r16, [%r14 + %r8]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe051a028  ! 154: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xe019e030  ! 157: LDD_I	ldd	[%r7 + 0x0030], %r16
	.word 0xe8732008  ! 159: STX_I	stx	%r20, [%r12 + 0x0008]
	.word 0xe0198008  ! 162: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe059a000  ! 165: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe0318008  ! 167: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe0328008  ! 168: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe021c008  ! 169: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe83b6010  ! 172: STD_I	std	%r20, [%r13 + 0x0010]
	.word 0xe0032018  ! 178: LDUW_I	lduw	[%r12 + 0x0018], %r16
	.word 0xec1b8008  ! 180: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe43b0008  ! 182: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe039a028  ! 183: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe02b6028  ! 185: STB_I	stb	%r16, [%r13 + 0x0028]
	.word 0xe431a018  ! 186: STH_I	sth	%r18, [%r6 + 0x0018]
	.word 0xec0ae000  ! 189: LDUB_I	ldub	[%r11 + 0x0000], %r22
	.word 0xe011c008  ! 191: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe401c008  ! 196: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xe811a018  ! 197: LDUH_I	lduh	[%r6 + 0x0018], %r20
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xec21a010  ! 201: STW_I	stw	%r22, [%r6 + 0x0010]
	.word 0xe011a018  ! 205: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xe419e000  ! 207: LDD_I	ldd	[%r7 + 0x0000], %r18
	.word 0xec130008  ! 209: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe8718008  ! 211: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe02b8008  ! 215: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xec730008  ! 219: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe8398008  ! 221: STD_R	std	%r20, [%r6 + %r8]
	.word 0xec4ae018  ! 225: LDSB_I	ldsb	[%r11 + 0x0018], %r22
	.word 0xe4298008  ! 226: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe052c008  ! 228: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe82ba038  ! 229: STB_I	stb	%r20, [%r14 + 0x0038]
	.word 0xe0230008  ! 232: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe032e020  ! 239: STH_I	sth	%r16, [%r11 + 0x0020]
	.word 0xec29a020  ! 242: STB_I	stb	%r22, [%r6 + 0x0020]
	.word 0xe009a000  ! 253: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe8430008  ! 255: LDSW_R	ldsw	[%r12 + %r8], %r20
	.word 0xe00ae000  ! 260: LDUB_I	ldub	[%r11 + 0x0000], %r16
	.word 0xe82b8008  ! 266: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe4730008  ! 267: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe8332018  ! 269: STH_I	sth	%r20, [%r12 + 0x0018]
	.word 0xe04ba020  ! 270: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	.word 0xe04aa000  ! 275: LDSB_I	ldsb	[%r10 + 0x0000], %r16
	.word 0xec01c008  ! 279: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe02b8008  ! 281: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe051e010  ! 284: LDSH_I	ldsh	[%r7 + 0x0010], %r16
	.word 0xe0332000  ! 285: STH_I	sth	%r16, [%r12 + 0x0000]
	.word 0xec5b8008  ! 293: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xec12e000  ! 294: LDUH_I	lduh	[%r11 + 0x0000], %r22
! Thread sync; stream = 9; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	.word 0xe04b8008  ! 2: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe44ba020  ! 5: LDSB_I	ldsb	[%r14 + 0x0020], %r18
	.word 0xe039e000  ! 12: STD_I	std	%r16, [%r7 + 0x0000]
	.word 0xe032c008  ! 16: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe039a018  ! 20: STD_I	std	%r16, [%r6 + 0x0018]
	.word 0xe023a010  ! 21: STW_I	stw	%r16, [%r14 + 0x0010]
	.word 0xe4498008  ! 24: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec2ae020  ! 26: STB_I	stb	%r22, [%r11 + 0x0020]
	.word 0xe429e008  ! 28: STB_I	stb	%r18, [%r7 + 0x0008]
	.word 0xe00b6018  ! 29: LDUB_I	ldub	[%r13 + 0x0018], %r16
	.word 0xe00b8008  ! 31: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe432e030  ! 39: STH_I	sth	%r18, [%r11 + 0x0030]
	.word 0xe029a018  ! 42: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xe002a020  ! 47: LDUW_I	lduw	[%r10 + 0x0020], %r16
	.word 0xe0598008  ! 48: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe0318008  ! 49: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec328008  ! 51: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe459a038  ! 52: LDX_I	ldx	[%r6 + 0x0038], %r18
	.word 0xe81b0008  ! 53: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe02ac008  ! 54: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe0218008  ! 56: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe4398008  ! 57: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe4598008  ! 58: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe0530008  ! 63: LDSH_R	ldsh	[%r12 + %r8], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe029e018  ! 67: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe0736028  ! 70: STX_I	stx	%r16, [%r13 + 0x0028]
	.word 0xe4438008  ! 72: LDSW_R	ldsw	[%r14 + %r8], %r18
	.word 0xe01b8008  ! 73: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe0734008  ! 78: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe4498008  ! 84: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec518008  ! 86: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe8498008  ! 90: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe45b8008  ! 92: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe82aa028  ! 93: STB_I	stb	%r20, [%r10 + 0x0028]
	.word 0xec730008  ! 94: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe40b2038  ! 99: LDUB_I	ldub	[%r12 + 0x0038], %r18
	.word 0xe022e000  ! 101: STW_I	stw	%r16, [%r11 + 0x0000]
	.word 0xe83aa018  ! 107: STD_I	std	%r20, [%r10 + 0x0018]
	.word 0xe021a018  ! 109: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe4498008  ! 115: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe031a028  ! 116: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xe4138008  ! 117: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xec0a8008  ! 120: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xec02e018  ! 126: LDUW_I	lduw	[%r11 + 0x0018], %r22
	.word 0xe4328008  ! 128: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xec538008  ! 133: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe0232000  ! 139: STW_I	stw	%r16, [%r12 + 0x0000]
	.word 0xec228008  ! 140: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe0228008  ! 141: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec39a030  ! 142: STD_I	std	%r22, [%r6 + 0x0030]
	.word 0xe0298008  ! 145: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8318008  ! 149: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe051a010  ! 154: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xe45aa010  ! 157: LDX_I	ldx	[%r10 + 0x0010], %r18
	.word 0xe8330008  ! 159: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xec036000  ! 162: LDUW_I	lduw	[%r13 + 0x0000], %r22
	.word 0xe0118008  ! 165: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe4234008  ! 167: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xec71c008  ! 168: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xec2b8008  ! 169: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe4328008  ! 172: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe019a010  ! 178: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xe459a018  ! 180: LDX_I	ldx	[%r6 + 0x0018], %r18
	.word 0xe822c008  ! 182: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe021a008  ! 183: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe42b8008  ! 185: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe073a020  ! 186: STX_I	stx	%r16, [%r14 + 0x0020]
	.word 0xe413a028  ! 189: LDUH_I	lduh	[%r14 + 0x0028], %r18
	.word 0xe84aa020  ! 191: LDSB_I	ldsb	[%r10 + 0x0020], %r20
	.word 0xec11e028  ! 196: LDUH_I	lduh	[%r7 + 0x0028], %r22
	.word 0xe85ac008  ! 197: LDX_R	ldx	[%r11 + %r8], %r20
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec31e038  ! 201: STH_I	sth	%r22, [%r7 + 0x0038]
	.word 0xec02e010  ! 205: LDUW_I	lduw	[%r11 + 0x0010], %r22
	.word 0xe401c008  ! 207: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xec09a000  ! 209: LDUB_I	ldub	[%r6 + 0x0000], %r22
	.word 0xe8328008  ! 211: STH_R	sth	%r20, [%r10 + %r8]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe4328008  ! 215: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xec2b8008  ! 219: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe071a018  ! 221: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xe049a010  ! 225: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xe0732008  ! 226: STX_I	stx	%r16, [%r12 + 0x0008]
	.word 0xe0118008  ! 228: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe03ac008  ! 229: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe0336020  ! 232: STH_I	sth	%r16, [%r13 + 0x0020]
	.word 0xe832c008  ! 239: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe0218008  ! 242: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec034008  ! 253: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe4438008  ! 255: LDSW_R	ldsw	[%r14 + %r8], %r18
	.word 0xe851a008  ! 260: LDSH_I	ldsh	[%r6 + 0x0008], %r20
	.word 0xe471a018  ! 266: STX_I	stx	%r18, [%r6 + 0x0018]
	.word 0xe0234008  ! 267: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe4228008  ! 269: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe401e008  ! 270: LDUW_I	lduw	[%r7 + 0x0008], %r18
	.word 0xe04ba038  ! 275: LDSB_I	ldsb	[%r14 + 0x0038], %r16
	.word 0xe412a030  ! 279: LDUH_I	lduh	[%r10 + 0x0030], %r18
	.word 0xe82ae000  ! 281: STB_I	stb	%r20, [%r11 + 0x0000]
	.word 0xe8132020  ! 284: LDUH_I	lduh	[%r12 + 0x0020], %r20
	.word 0xec398008  ! 285: STD_R	std	%r22, [%r6 + %r8]
	.word 0xec49a028  ! 293: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xe419c008  ! 294: LDD_R	ldd	[%r7 + %r8], %r18
! Thread sync; stream = 8; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xec4aa000  ! 2: LDSB_I	ldsb	[%r10 + 0x0000], %r22
	.word 0xe8434008  ! 5: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe029c008  ! 12: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe0330008  ! 16: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe03ac008  ! 20: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe822c008  ! 21: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe851e038  ! 24: LDSH_I	ldsh	[%r7 + 0x0038], %r20
	.word 0xe032a010  ! 26: STH_I	sth	%r16, [%r10 + 0x0010]
	.word 0xec318008  ! 28: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe84a8008  ! 29: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe4430008  ! 31: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe03aa038  ! 39: STD_I	std	%r16, [%r10 + 0x0038]
	.word 0xe032e030  ! 42: STH_I	sth	%r16, [%r11 + 0x0030]
	.word 0xe812a010  ! 47: LDUH_I	lduh	[%r10 + 0x0010], %r20
	.word 0xe8128008  ! 48: LDUH_R	lduh	[%r10 + %r8], %r20
	.word 0xec334008  ! 49: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xec31e020  ! 51: STH_I	sth	%r22, [%r7 + 0x0020]
	.word 0xe4538008  ! 52: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xec42e010  ! 53: LDSW_I	ldsw	[%r11 + 0x0010], %r22
	.word 0xe8336010  ! 54: STH_I	sth	%r20, [%r13 + 0x0010]
	.word 0xec72c008  ! 56: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe02ae030  ! 57: STB_I	stb	%r16, [%r11 + 0x0030]
	.word 0xec49e028  ! 58: LDSB_I	ldsb	[%r7 + 0x0028], %r22
	.word 0xe44b6038  ! 63: LDSB_I	ldsb	[%r13 + 0x0038], %r18
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe03b2020  ! 67: STD_I	std	%r16, [%r12 + 0x0020]
	.word 0xe8398008  ! 70: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe0538008  ! 72: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xec1ae028  ! 73: LDD_I	ldd	[%r11 + 0x0028], %r22
	.word 0xe829e000  ! 78: STB_I	stb	%r20, [%r7 + 0x0000]
	.word 0xe0118008  ! 84: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xec19a018  ! 86: LDD_I	ldd	[%r6 + 0x0018], %r22
	.word 0xe451a028  ! 90: LDSH_I	ldsh	[%r6 + 0x0028], %r18
	.word 0xe80b2030  ! 92: LDUB_I	ldub	[%r12 + 0x0030], %r20
	.word 0xe4218008  ! 93: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe439e008  ! 94: STD_I	std	%r18, [%r7 + 0x0008]
	.word 0xe04ba020  ! 99: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	.word 0xe8318008  ! 101: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe02a8008  ! 107: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe83a8008  ! 109: STD_R	std	%r20, [%r10 + %r8]
	.word 0xec4a8008  ! 115: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xe039a010  ! 116: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe4418008  ! 117: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe0438008  ! 120: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xec0b0008  ! 126: LDUB_R	ldub	[%r12 + %r8], %r22
	.word 0xe02b2020  ! 128: STB_I	stb	%r16, [%r12 + 0x0020]
	.word 0xe4536028  ! 133: LDSH_I	ldsh	[%r13 + 0x0028], %r18
	.word 0xe4328008  ! 139: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe42b4008  ! 140: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe0334008  ! 141: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe8338008  ! 142: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe422e000  ! 145: STW_I	stw	%r18, [%r11 + 0x0000]
	.word 0xe032a028  ! 149: STH_I	sth	%r16, [%r10 + 0x0028]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe0534008  ! 154: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe00b4008  ! 157: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe839a000  ! 159: STD_I	std	%r20, [%r6 + 0x0000]
	.word 0xec03a028  ! 162: LDUW_I	lduw	[%r14 + 0x0028], %r22
	.word 0xe00b4008  ! 165: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe83b2000  ! 167: STD_I	std	%r20, [%r12 + 0x0000]
	.word 0xec338008  ! 168: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe032a028  ! 169: STH_I	sth	%r16, [%r10 + 0x0028]
	.word 0xec338008  ! 172: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe0136008  ! 178: LDUH_I	lduh	[%r13 + 0x0008], %r16
	.word 0xec136030  ! 180: LDUH_I	lduh	[%r13 + 0x0030], %r22
	.word 0xe0232038  ! 182: STW_I	stw	%r16, [%r12 + 0x0038]
	.word 0xe0234008  ! 183: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe42ae018  ! 185: STB_I	stb	%r18, [%r11 + 0x0018]
	.word 0xe439a030  ! 186: STD_I	std	%r18, [%r6 + 0x0030]
	.word 0xe042a028  ! 189: LDSW_I	ldsw	[%r10 + 0x0028], %r16
	.word 0xe402a038  ! 191: LDUW_I	lduw	[%r10 + 0x0038], %r18
	.word 0xe402e010  ! 196: LDUW_I	lduw	[%r11 + 0x0010], %r18
	.word 0xe04b8008  ! 197: LDSB_R	ldsb	[%r14 + %r8], %r16
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe032e000  ! 201: STH_I	sth	%r16, [%r11 + 0x0000]
	.word 0xe4418008  ! 205: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe00a8008  ! 207: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe0434008  ! 209: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xec73a010  ! 211: STX_I	stx	%r22, [%r14 + 0x0010]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe0232008  ! 215: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xe02b2018  ! 219: STB_I	stb	%r16, [%r12 + 0x0018]
	.word 0xe431a028  ! 221: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xe443a000  ! 225: LDSW_I	ldsw	[%r14 + 0x0000], %r18
	.word 0xe022c008  ! 226: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe04ac008  ! 228: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe03ac008  ! 229: STD_R	std	%r16, [%r11 + %r8]
	.word 0xec2b0008  ! 232: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xec398008  ! 239: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe871c008  ! 242: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xec598008  ! 253: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe042c008  ! 255: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe4432000  ! 260: LDSW_I	ldsw	[%r12 + 0x0000], %r18
	.word 0xe031e020  ! 266: STH_I	sth	%r16, [%r7 + 0x0020]
	.word 0xe8332008  ! 267: STH_I	sth	%r20, [%r12 + 0x0008]
	.word 0xe02b0008  ! 269: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec01a000  ! 270: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xe811a020  ! 275: LDUH_I	lduh	[%r6 + 0x0020], %r20
	.word 0xe04b2000  ! 279: LDSB_I	ldsb	[%r12 + 0x0000], %r16
	.word 0xe83aa038  ! 281: STD_I	std	%r20, [%r10 + 0x0038]
	.word 0xec4a8008  ! 284: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xe0298008  ! 285: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe452a020  ! 293: LDSH_I	ldsh	[%r10 + 0x0020], %r18
	.word 0xe009a038  ! 294: LDUB_I	ldub	[%r6 + 0x0038], %r16
! Thread sync; stream = 7; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xec19a030  ! 2: LDD_I	ldd	[%r6 + 0x0030], %r22
	.word 0xe852e018  ! 5: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	.word 0xe822e038  ! 12: STW_I	stw	%r20, [%r11 + 0x0038]
	.word 0xe4332030  ! 16: STH_I	sth	%r18, [%r12 + 0x0030]
	.word 0xe43b4008  ! 20: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe421a010  ! 21: STW_I	stw	%r18, [%r6 + 0x0010]
	.word 0xe841a028  ! 24: LDSW_I	ldsw	[%r6 + 0x0028], %r20
	.word 0xe0398008  ! 26: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4330008  ! 28: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe84b4008  ! 29: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe412c008  ! 31: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe432c008  ! 39: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe8236038  ! 42: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xe041a018  ! 47: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xec0b8008  ! 48: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xec39a018  ! 49: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xe433a018  ! 51: STH_I	sth	%r18, [%r14 + 0x0018]
	.word 0xe809a030  ! 52: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xe0598008  ! 53: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe039a010  ! 54: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe8236020  ! 56: STW_I	stw	%r20, [%r13 + 0x0020]
	.word 0xe429a030  ! 57: STB_I	stb	%r18, [%r6 + 0x0030]
	.word 0xe0136008  ! 58: LDUH_I	lduh	[%r13 + 0x0008], %r16
	.word 0xe049a010  ! 63: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe82b2020  ! 67: STB_I	stb	%r20, [%r12 + 0x0020]
	.word 0xe83b8008  ! 70: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe812e010  ! 72: LDUH_I	lduh	[%r11 + 0x0010], %r20
	.word 0xe0428008  ! 73: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe021a000  ! 78: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe0428008  ! 84: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xec01a018  ! 86: LDUW_I	lduw	[%r6 + 0x0018], %r22
	.word 0xec418008  ! 90: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe40a8008  ! 92: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe0218008  ! 93: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec2b0008  ! 94: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe0498008  ! 99: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe021c008  ! 101: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe871a008  ! 107: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xe072a010  ! 109: STX_I	stx	%r16, [%r10 + 0x0010]
	.word 0xe041a038  ! 115: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xe02ba000  ! 116: STB_I	stb	%r16, [%r14 + 0x0000]
	.word 0xe8028008  ! 117: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xec01a010  ! 120: LDUW_I	lduw	[%r6 + 0x0010], %r22
	.word 0xec530008  ! 126: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xe4336018  ! 128: STH_I	sth	%r18, [%r13 + 0x0018]
	.word 0xe85a8008  ! 133: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe83ac008  ! 139: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe071e038  ! 140: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe82b4008  ! 141: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec71a000  ! 142: STX_I	stx	%r22, [%r6 + 0x0000]
	.word 0xe822a000  ! 145: STW_I	stw	%r20, [%r10 + 0x0000]
	.word 0xe0732030  ! 149: STX_I	stx	%r16, [%r12 + 0x0030]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe4498008  ! 154: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe8430008  ! 157: LDSW_R	ldsw	[%r12 + %r8], %r20
	.word 0xe4728008  ! 159: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe851a000  ! 162: LDSH_I	ldsh	[%r6 + 0x0000], %r20
	.word 0xe4518008  ! 165: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe82b0008  ! 167: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe822c008  ! 168: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xec2b6010  ! 169: STB_I	stb	%r22, [%r13 + 0x0010]
	.word 0xe4728008  ! 172: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe019e030  ! 178: LDD_I	ldd	[%r7 + 0x0030], %r16
	.word 0xe001e010  ! 180: LDUW_I	lduw	[%r7 + 0x0010], %r16
	.word 0xe4234008  ! 182: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe8730008  ! 183: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe4330008  ! 185: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe42ba010  ! 186: STB_I	stb	%r18, [%r14 + 0x0010]
	.word 0xec498008  ! 189: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe84b2030  ! 191: LDSB_I	ldsb	[%r12 + 0x0030], %r20
	.word 0xe45b0008  ! 196: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe0498008  ! 197: LDSB_R	ldsb	[%r6 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe071a038  ! 201: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe051a000  ! 205: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xe059c008  ! 207: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe009c008  ! 209: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe439a030  ! 211: STD_I	std	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xec29c008  ! 215: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe033a000  ! 219: STH_I	sth	%r16, [%r14 + 0x0000]
	.word 0xe02ac008  ! 221: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe0438008  ! 225: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe02a8008  ! 226: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe00ba010  ! 228: LDUB_I	ldub	[%r14 + 0x0010], %r16
	.word 0xe072c008  ! 229: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe8328008  ! 232: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe03b6018  ! 239: STD_I	std	%r16, [%r13 + 0x0018]
	.word 0xe029e018  ! 242: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe0598008  ! 253: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xec598008  ! 255: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe0098008  ! 260: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe0330008  ! 266: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec2a8008  ! 267: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xec39e020  ! 269: STD_I	std	%r22, [%r7 + 0x0020]
	.word 0xe4532028  ! 270: LDSH_I	ldsh	[%r12 + 0x0028], %r18
	.word 0xec4ae000  ! 275: LDSB_I	ldsb	[%r11 + 0x0000], %r22
	.word 0xe451a020  ! 279: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xe022e008  ! 281: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe002c008  ! 284: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xec3b0008  ! 285: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe009e020  ! 293: LDUB_I	ldub	[%r7 + 0x0020], %r16
	.word 0xe011e020  ! 294: LDUH_I	lduh	[%r7 + 0x0020], %r16
! Thread sync; stream = 6; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xe4034008  ! 2: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe8518008  ! 5: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xec298008  ! 12: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe8228008  ! 16: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe022c008  ! 20: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe43aa018  ! 21: STD_I	std	%r18, [%r10 + 0x0018]
	.word 0xe8498008  ! 24: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe421e028  ! 26: STW_I	stw	%r18, [%r7 + 0x0028]
	.word 0xe033a020  ! 28: STH_I	sth	%r16, [%r14 + 0x0020]
	.word 0xe043a038  ! 29: LDSW_I	ldsw	[%r14 + 0x0038], %r16
	.word 0xe009a038  ! 31: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xec3b0008  ! 39: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe03ac008  ! 42: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe05ae000  ! 47: LDX_I	ldx	[%r11 + 0x0000], %r16
	.word 0xe04b4008  ! 48: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xec328008  ! 49: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe42aa030  ! 51: STB_I	stb	%r18, [%r10 + 0x0030]
	.word 0xe009c008  ! 52: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe01b6018  ! 53: LDD_I	ldd	[%r13 + 0x0018], %r16
	.word 0xe029a030  ! 54: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xec71a018  ! 56: STX_I	stx	%r22, [%r6 + 0x0018]
	.word 0xe4330008  ! 57: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe0598008  ! 58: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4018008  ! 63: LDUW_R	lduw	[%r6 + %r8], %r18
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe4218008  ! 67: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe42aa010  ! 70: STB_I	stb	%r18, [%r10 + 0x0010]
	.word 0xe45b8008  ! 72: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe0118008  ! 73: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe03a8008  ! 78: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe4018008  ! 84: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe843a010  ! 86: LDSW_I	ldsw	[%r14 + 0x0010], %r20
	.word 0xe041a038  ! 90: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xec41c008  ! 92: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe0728008  ! 93: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe032e000  ! 94: STH_I	sth	%r16, [%r11 + 0x0000]
	.word 0xec09a028  ! 99: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xe0330008  ! 101: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec39c008  ! 107: STD_R	std	%r22, [%r7 + %r8]
	.word 0xec32a030  ! 109: STH_I	sth	%r22, [%r10 + 0x0030]
	.word 0xe051a000  ! 115: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xe871c008  ! 116: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xec428008  ! 117: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xec53a030  ! 120: LDSH_I	ldsh	[%r14 + 0x0030], %r22
	.word 0xe44ac008  ! 126: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xe073a038  ! 128: STX_I	stx	%r16, [%r14 + 0x0038]
	.word 0xe451c008  ! 133: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe039a010  ! 139: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xec730008  ! 140: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe021c008  ! 141: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe033a030  ! 142: STH_I	sth	%r16, [%r14 + 0x0030]
	.word 0xe4298008  ! 145: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe8230008  ! 149: STW_R	stw	%r20, [%r12 + %r8]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe002a010  ! 154: LDUW_I	lduw	[%r10 + 0x0010], %r16
	.word 0xe4134008  ! 157: LDUH_R	lduh	[%r13 + %r8], %r18
	.word 0xe82b2018  ! 159: STB_I	stb	%r20, [%r12 + 0x0018]
	.word 0xe009a010  ! 162: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe44b8008  ! 165: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe42ac008  ! 167: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe829c008  ! 168: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe432a020  ! 169: STH_I	sth	%r18, [%r10 + 0x0020]
	.word 0xe4336030  ! 172: STH_I	sth	%r18, [%r13 + 0x0030]
	.word 0xe842a000  ! 178: LDSW_I	ldsw	[%r10 + 0x0000], %r20
	.word 0xe811a010  ! 180: LDUH_I	lduh	[%r6 + 0x0010], %r20
	.word 0xe039a028  ! 182: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xec31a000  ! 183: STH_I	sth	%r22, [%r6 + 0x0000]
	.word 0xe031a008  ! 185: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe032e028  ! 186: STH_I	sth	%r16, [%r11 + 0x0028]
	.word 0xec5b8008  ! 189: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe45b0008  ! 191: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe0128008  ! 196: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xec518008  ! 197: LDSH_R	ldsh	[%r6 + %r8], %r22
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe8218008  ! 201: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe8198008  ! 205: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xec4ac008  ! 207: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe0598008  ! 209: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe072e028  ! 211: STX_I	stx	%r16, [%r11 + 0x0028]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0398008  ! 215: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe832a010  ! 219: STH_I	sth	%r20, [%r10 + 0x0010]
	.word 0xe072c008  ! 221: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe0518008  ! 225: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe071a030  ! 226: STX_I	stx	%r16, [%r6 + 0x0030]
	.word 0xe0138008  ! 228: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe439c008  ! 229: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe4338008  ! 232: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe071a010  ! 239: STX_I	stx	%r16, [%r6 + 0x0010]
	.word 0xe02a8008  ! 242: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe0028008  ! 253: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe4498008  ! 255: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe04ac008  ! 260: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xec29a028  ! 266: STB_I	stb	%r22, [%r6 + 0x0028]
	.word 0xe03ae028  ! 267: STD_I	std	%r16, [%r11 + 0x0028]
	.word 0xe831c008  ! 269: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe05b2018  ! 270: LDX_I	ldx	[%r12 + 0x0018], %r16
	.word 0xe059a010  ! 275: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xe0018008  ! 279: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe4318008  ! 281: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe41b0008  ! 284: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe42b4008  ! 285: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe842e030  ! 293: LDSW_I	ldsw	[%r11 + 0x0030], %r20
	.word 0xe81b6008  ! 294: LDD_I	ldd	[%r13 + 0x0008], %r20
! Thread sync; stream = 5; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xe8518008  ! 2: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xec4b8008  ! 5: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe422e030  ! 12: STW_I	stw	%r18, [%r11 + 0x0030]
	.word 0xec32a010  ! 16: STH_I	sth	%r22, [%r10 + 0x0010]
	.word 0xec298008  ! 20: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe4238008  ! 21: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe05ba010  ! 24: LDX_I	ldx	[%r14 + 0x0010], %r16
	.word 0xe439c008  ! 26: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe4728008  ! 28: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe419c008  ! 29: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe051e020  ! 31: LDSH_I	ldsh	[%r7 + 0x0020], %r16
	.word 0xe072c008  ! 39: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe82a8008  ! 42: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xec09a000  ! 47: LDUB_I	ldub	[%r6 + 0x0000], %r22
	.word 0xe441a038  ! 48: LDSW_I	ldsw	[%r6 + 0x0038], %r18
	.word 0xe029c008  ! 49: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec218008  ! 51: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0518008  ! 52: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe0518008  ! 53: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe471c008  ! 54: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xec39e000  ! 56: STD_I	std	%r22, [%r7 + 0x0000]
	.word 0xe032c008  ! 57: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe409a018  ! 58: LDUB_I	ldub	[%r6 + 0x0018], %r18
	.word 0xe44a8008  ! 63: LDSB_R	ldsb	[%r10 + %r8], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe823a008  ! 67: STW_I	stw	%r20, [%r14 + 0x0008]
	.word 0xec2b0008  ! 70: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xec51e038  ! 72: LDSH_I	ldsh	[%r7 + 0x0038], %r22
	.word 0xe019a008  ! 73: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xec39a000  ! 78: STD_I	std	%r22, [%r6 + 0x0000]
	.word 0xe853a020  ! 84: LDSH_I	ldsh	[%r14 + 0x0020], %r20
	.word 0xec41c008  ! 86: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe0038008  ! 90: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe019c008  ! 92: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe071a008  ! 93: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe0398008  ! 94: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec1ba018  ! 99: LDD_I	ldd	[%r14 + 0x0018], %r22
	.word 0xec22c008  ! 101: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe472a008  ! 107: STX_I	stx	%r18, [%r10 + 0x0008]
	.word 0xe832c008  ! 109: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe05b4008  ! 115: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe8238008  ! 116: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe811a038  ! 117: LDUH_I	lduh	[%r6 + 0x0038], %r20
	.word 0xe419a000  ! 120: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe01b6018  ! 126: LDD_I	ldd	[%r13 + 0x0018], %r16
	.word 0xec398008  ! 128: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe852e008  ! 133: LDSH_I	ldsh	[%r11 + 0x0008], %r20
	.word 0xe42ae028  ! 139: STB_I	stb	%r18, [%r11 + 0x0028]
	.word 0xe031a020  ! 140: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe821a008  ! 141: STW_I	stw	%r20, [%r6 + 0x0008]
	.word 0xe0718008  ! 142: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe03ac008  ! 145: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe021e038  ! 149: STW_I	stw	%r16, [%r7 + 0x0038]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe04a8008  ! 154: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xec1b8008  ! 157: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe032e000  ! 159: STH_I	sth	%r16, [%r11 + 0x0000]
	.word 0xec02e000  ! 162: LDUW_I	lduw	[%r11 + 0x0000], %r22
	.word 0xec51a008  ! 165: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	.word 0xe03a8008  ! 167: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe03b6038  ! 168: STD_I	std	%r16, [%r13 + 0x0038]
	.word 0xe071a008  ! 169: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe03b4008  ! 172: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe80b4008  ! 178: LDUB_R	ldub	[%r13 + %r8], %r20
	.word 0xe0432008  ! 180: LDSW_I	ldsw	[%r12 + 0x0008], %r16
	.word 0xe43b0008  ! 182: STD_R	std	%r18, [%r12 + %r8]
	.word 0xec29c008  ! 183: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe4718008  ! 185: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe43aa028  ! 186: STD_I	std	%r18, [%r10 + 0x0028]
	.word 0xe00ae030  ! 189: LDUB_I	ldub	[%r11 + 0x0030], %r16
	.word 0xe80b0008  ! 191: LDUB_R	ldub	[%r12 + %r8], %r20
	.word 0xe801e020  ! 196: LDUW_I	lduw	[%r7 + 0x0020], %r20
	.word 0xec136010  ! 197: LDUH_I	lduh	[%r13 + 0x0010], %r22
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xec338008  ! 201: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe0418008  ! 205: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe04b2008  ! 207: LDSB_I	ldsb	[%r12 + 0x0008], %r16
	.word 0xe0018008  ! 209: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe421a008  ! 211: STW_I	stw	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe471e008  ! 215: STX_I	stx	%r18, [%r7 + 0x0008]
	.word 0xe032a018  ! 219: STH_I	sth	%r16, [%r10 + 0x0018]
	.word 0xe839e030  ! 221: STD_I	std	%r20, [%r7 + 0x0030]
	.word 0xe059c008  ! 225: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe0738008  ! 226: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe059c008  ! 228: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe42b6028  ! 229: STB_I	stb	%r18, [%r13 + 0x0028]
	.word 0xe43b4008  ! 232: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe02ba000  ! 239: STB_I	stb	%r16, [%r14 + 0x0000]
	.word 0xe0734008  ! 242: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe84b4008  ! 253: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe053a010  ! 255: LDSH_I	ldsh	[%r14 + 0x0010], %r16
	.word 0xe01b6008  ! 260: LDD_I	ldd	[%r13 + 0x0008], %r16
	.word 0xe031a028  ! 266: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xe42b4008  ! 267: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xec2b2000  ! 269: STB_I	stb	%r22, [%r12 + 0x0000]
	.word 0xe01b4008  ! 270: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xec0ae008  ! 275: LDUB_I	ldub	[%r11 + 0x0008], %r22
	.word 0xe441c008  ! 279: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe8398008  ! 281: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe449c008  ! 284: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe8236010  ! 285: STW_I	stw	%r20, [%r13 + 0x0010]
	.word 0xe452e038  ! 293: LDSH_I	ldsh	[%r11 + 0x0038], %r18
	.word 0xe05b8008  ! 294: LDX_R	ldx	[%r14 + %r8], %r16
! Thread sync; stream = 4; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xec198008  ! 2: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe0018008  ! 5: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe42aa000  ! 12: STB_I	stb	%r18, [%r10 + 0x0000]
	.word 0xe829c008  ! 16: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe8298008  ! 20: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe022a010  ! 21: STW_I	stw	%r16, [%r10 + 0x0010]
	.word 0xe05b8008  ! 24: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe472c008  ! 26: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe429a010  ! 28: STB_I	stb	%r18, [%r6 + 0x0010]
	.word 0xe80b2038  ! 29: LDUB_I	ldub	[%r12 + 0x0038], %r20
	.word 0xe442e030  ! 31: LDSW_I	ldsw	[%r11 + 0x0030], %r18
	.word 0xe833a030  ! 39: STH_I	sth	%r20, [%r14 + 0x0030]
	.word 0xe02ae000  ! 42: STB_I	stb	%r16, [%r11 + 0x0000]
	.word 0xe802c008  ! 47: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe013a038  ! 48: LDUH_I	lduh	[%r14 + 0x0038], %r16
	.word 0xe0728008  ! 49: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe8328008  ! 51: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe4198008  ! 52: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe0498008  ! 53: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe42b6020  ! 54: STB_I	stb	%r18, [%r13 + 0x0020]
	.word 0xe43ac008  ! 56: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe4238008  ! 57: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xec1a8008  ! 58: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe41ba020  ! 63: LDD_I	ldd	[%r14 + 0x0020], %r18
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec21c008  ! 67: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe422c008  ! 70: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe001e018  ! 72: LDUW_I	lduw	[%r7 + 0x0018], %r16
	.word 0xe41a8008  ! 73: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xec398008  ! 78: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe409e038  ! 84: LDUB_I	ldub	[%r7 + 0x0038], %r18
	.word 0xe002e010  ! 86: LDUW_I	lduw	[%r11 + 0x0010], %r16
	.word 0xe4518008  ! 90: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe04b4008  ! 92: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe4398008  ! 93: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe4736008  ! 94: STX_I	stx	%r18, [%r13 + 0x0008]
	.word 0xe84ae008  ! 99: LDSB_I	ldsb	[%r11 + 0x0008], %r20
	.word 0xe432c008  ! 101: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe0336020  ! 107: STH_I	sth	%r16, [%r13 + 0x0020]
	.word 0xe4232018  ! 109: STW_I	stw	%r18, [%r12 + 0x0018]
	.word 0xe8538008  ! 115: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe0228008  ! 116: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe0032010  ! 117: LDUW_I	lduw	[%r12 + 0x0010], %r16
	.word 0xe419a000  ! 120: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe002e020  ! 126: LDUW_I	lduw	[%r11 + 0x0020], %r16
	.word 0xe022a028  ! 128: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xe4018008  ! 133: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe032e030  ! 139: STH_I	sth	%r16, [%r11 + 0x0030]
	.word 0xe072a028  ! 140: STX_I	stx	%r16, [%r10 + 0x0028]
	.word 0xe871e028  ! 141: STX_I	stx	%r20, [%r7 + 0x0028]
	.word 0xe039e030  ! 142: STD_I	std	%r16, [%r7 + 0x0030]
	.word 0xe43b6010  ! 145: STD_I	std	%r18, [%r13 + 0x0010]
	.word 0xec298008  ! 149: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe049a000  ! 154: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xec19c008  ! 157: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xec72e010  ! 159: STX_I	stx	%r22, [%r11 + 0x0010]
	.word 0xec59e038  ! 162: LDX_I	ldx	[%r7 + 0x0038], %r22
	.word 0xec59a010  ! 165: LDX_I	ldx	[%r6 + 0x0010], %r22
	.word 0xe8236008  ! 167: STW_I	stw	%r20, [%r13 + 0x0008]
	.word 0xe0728008  ! 168: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec2aa008  ! 169: STB_I	stb	%r22, [%r10 + 0x0008]
	.word 0xe473a020  ! 172: STX_I	stx	%r18, [%r14 + 0x0020]
	.word 0xec51a008  ! 178: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	.word 0xe401c008  ! 180: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xec338008  ! 182: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe02ae020  ! 183: STB_I	stb	%r16, [%r11 + 0x0020]
	.word 0xec734008  ! 185: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe02b4008  ! 186: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe012e028  ! 189: LDUH_I	lduh	[%r11 + 0x0028], %r16
	.word 0xe01b8008  ! 191: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe0036020  ! 196: LDUW_I	lduw	[%r13 + 0x0020], %r16
	.word 0xe859a038  ! 197: LDX_I	ldx	[%r6 + 0x0038], %r20
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe0718008  ! 201: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0530008  ! 205: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe4030008  ! 207: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe0418008  ! 209: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe0332018  ! 211: STH_I	sth	%r16, [%r12 + 0x0018]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe829c008  ! 215: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe4318008  ! 219: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xec39c008  ! 221: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe451a018  ! 225: LDSH_I	ldsh	[%r6 + 0x0018], %r18
	.word 0xec234008  ! 226: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe419c008  ! 228: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe039a010  ! 229: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe429e028  ! 232: STB_I	stb	%r18, [%r7 + 0x0028]
	.word 0xe0738008  ! 239: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0332020  ! 242: STH_I	sth	%r16, [%r12 + 0x0020]
	.word 0xe0038008  ! 253: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe043a018  ! 255: LDSW_I	ldsw	[%r14 + 0x0018], %r16
	.word 0xe441e028  ! 260: LDSW_I	ldsw	[%r7 + 0x0028], %r18
	.word 0xe4238008  ! 266: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xec2b2008  ! 267: STB_I	stb	%r22, [%r12 + 0x0008]
	.word 0xe832a010  ! 269: STH_I	sth	%r20, [%r10 + 0x0010]
	.word 0xe8518008  ! 270: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe003a028  ! 275: LDUW_I	lduw	[%r14 + 0x0028], %r16
	.word 0xe0418008  ! 279: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe03ac008  ! 281: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe042e038  ! 284: LDSW_I	ldsw	[%r11 + 0x0038], %r16
	.word 0xe429a028  ! 285: STB_I	stb	%r18, [%r6 + 0x0028]
	.word 0xe05b2030  ! 293: LDX_I	ldx	[%r12 + 0x0030], %r16
	.word 0xe0598008  ! 294: LDX_R	ldx	[%r6 + %r8], %r16
! Thread sync; stream = 3; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xec0a8008  ! 2: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xec02c008  ! 5: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe0236020  ! 12: STW_I	stw	%r16, [%r13 + 0x0020]
	.word 0xe03b4008  ! 16: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe031a028  ! 20: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xe8734008  ! 21: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xec12e030  ! 24: LDUH_I	lduh	[%r11 + 0x0030], %r22
	.word 0xe03b6010  ! 26: STD_I	std	%r16, [%r13 + 0x0010]
	.word 0xe02aa030  ! 28: STB_I	stb	%r16, [%r10 + 0x0030]
	.word 0xe051c008  ! 29: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe81ac008  ! 31: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xec29a008  ! 39: STB_I	stb	%r22, [%r6 + 0x0008]
	.word 0xe03b2018  ! 42: STD_I	std	%r16, [%r12 + 0x0018]
	.word 0xe441a038  ! 47: LDSW_I	ldsw	[%r6 + 0x0038], %r18
	.word 0xe049c008  ! 48: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe071e018  ! 49: STX_I	stx	%r16, [%r7 + 0x0018]
	.word 0xe0238008  ! 51: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe84b4008  ! 52: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe059a008  ! 53: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xec21a000  ! 54: STW_I	stw	%r22, [%r6 + 0x0000]
	.word 0xe0298008  ! 56: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec734008  ! 57: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe051a018  ! 58: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xec51a020  ! 63: LDSH_I	ldsh	[%r6 + 0x0020], %r22
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe0318008  ! 67: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe071a038  ! 70: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe04ac008  ! 72: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe01b0008  ! 73: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe0334008  ! 78: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec02c008  ! 84: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe452c008  ! 86: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xe4528008  ! 90: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xec434008  ! 92: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe871a028  ! 93: STX_I	stx	%r20, [%r6 + 0x0028]
	.word 0xe03b8008  ! 94: STD_R	std	%r16, [%r14 + %r8]
	.word 0xec5b4008  ! 99: LDX_R	ldx	[%r13 + %r8], %r22
	.word 0xe439c008  ! 101: STD_R	std	%r18, [%r7 + %r8]
	.word 0xec218008  ! 107: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4318008  ! 109: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe401a028  ! 115: LDUW_I	lduw	[%r6 + 0x0028], %r18
	.word 0xe0318008  ! 116: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe04ac008  ! 117: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe451a010  ! 120: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xe05b4008  ! 126: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe829c008  ! 128: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe4118008  ! 133: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xec218008  ! 139: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xec230008  ! 140: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe8338008  ! 141: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xec3aa020  ! 142: STD_I	std	%r22, [%r10 + 0x0020]
	.word 0xec39a018  ! 145: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xec29c008  ! 149: STB_R	stb	%r22, [%r7 + %r8]
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec42c008  ! 154: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xe05ac008  ! 157: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe8738008  ! 159: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xe801a020  ! 162: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xe85ae018  ! 165: LDX_I	ldx	[%r11 + 0x0018], %r20
	.word 0xe02b6018  ! 167: STB_I	stb	%r16, [%r13 + 0x0018]
	.word 0xe833a008  ! 168: STH_I	sth	%r20, [%r14 + 0x0008]
	.word 0xe421a010  ! 169: STW_I	stw	%r18, [%r6 + 0x0010]
	.word 0xe821a008  ! 172: STW_I	stw	%r20, [%r6 + 0x0008]
	.word 0xe01ba038  ! 178: LDD_I	ldd	[%r14 + 0x0038], %r16
	.word 0xe0038008  ! 180: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe02b6008  ! 182: STB_I	stb	%r16, [%r13 + 0x0008]
	.word 0xe43ae020  ! 183: STD_I	std	%r18, [%r11 + 0x0020]
	.word 0xe0218008  ! 185: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec72e018  ! 186: STX_I	stx	%r22, [%r11 + 0x0018]
	.word 0xe011a028  ! 189: LDUH_I	lduh	[%r6 + 0x0028], %r16
	.word 0xe051c008  ! 191: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe44a8008  ! 196: LDSB_R	ldsb	[%r10 + %r8], %r18
	.word 0xe0098008  ! 197: LDUB_R	ldub	[%r6 + %r8], %r16
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe073a000  ! 201: STX_I	stx	%r16, [%r14 + 0x0000]
	.word 0xe40a8008  ! 205: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe052c008  ! 207: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe05a8008  ! 209: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xec738008  ! 211: STX_R	stx	%r22, [%r14 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe022e008  ! 215: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe82b2030  ! 219: STB_I	stb	%r20, [%r12 + 0x0030]
	.word 0xe071a038  ! 221: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe849a000  ! 225: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xe4334008  ! 226: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe0518008  ! 228: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe4336020  ! 229: STH_I	sth	%r18, [%r13 + 0x0020]
	.word 0xe0338008  ! 232: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe0334008  ! 239: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe0234008  ! 242: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec418008  ! 253: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xec0ba030  ! 255: LDUB_I	ldub	[%r14 + 0x0030], %r22
	.word 0xe049a020  ! 260: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe471e000  ! 266: STX_I	stx	%r18, [%r7 + 0x0000]
	.word 0xe0338008  ! 267: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe4732028  ! 269: STX_I	stx	%r18, [%r12 + 0x0028]
	.word 0xe04a8008  ! 270: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe80aa008  ! 275: LDUB_I	ldub	[%r10 + 0x0008], %r20
	.word 0xec42a028  ! 279: LDSW_I	ldsw	[%r10 + 0x0028], %r22
	.word 0xe0734008  ! 281: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe001a018  ! 284: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xe029a000  ! 285: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe801e038  ! 293: LDUW_I	lduw	[%r7 + 0x0038], %r20
	.word 0xe001a018  ! 294: LDUW_I	lduw	[%r6 + 0x0018], %r16
! Thread sync; stream = 2; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xec02c008  ! 2: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xec12c008  ! 5: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xe03aa038  ! 12: STD_I	std	%r16, [%r10 + 0x0038]
	.word 0xe8236038  ! 16: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xe0338008  ! 20: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe0336000  ! 21: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe01b0008  ! 24: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe071c008  ! 26: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe02b8008  ! 28: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xec5b8008  ! 29: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe003a008  ! 31: LDUW_I	lduw	[%r14 + 0x0008], %r16
	.word 0xec3b4008  ! 39: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe8234008  ! 42: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe44ac008  ! 47: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xe811a000  ! 48: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xec21a030  ! 49: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xe0334008  ! 51: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec1ae030  ! 52: LDD_I	ldd	[%r11 + 0x0030], %r22
	.word 0xe019a010  ! 53: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xe821e008  ! 54: STW_I	stw	%r20, [%r7 + 0x0008]
	.word 0xe871e038  ! 56: STX_I	stx	%r20, [%r7 + 0x0038]
	.word 0xec728008  ! 57: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe8528008  ! 58: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe4118008  ! 63: LDUH_R	lduh	[%r6 + %r8], %r18
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe831e030  ! 67: STH_I	sth	%r20, [%r7 + 0x0030]
	.word 0xec338008  ! 70: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe0138008  ! 72: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe4532020  ! 73: LDSH_I	ldsh	[%r12 + 0x0020], %r18
	.word 0xe4732008  ! 78: STX_I	stx	%r18, [%r12 + 0x0008]
	.word 0xec52c008  ! 84: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xe00b2020  ! 86: LDUB_I	ldub	[%r12 + 0x0020], %r16
	.word 0xe4098008  ! 90: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec430008  ! 92: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec72c008  ! 93: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe039e020  ! 94: STD_I	std	%r16, [%r7 + 0x0020]
	.word 0xe043a010  ! 99: LDSW_I	ldsw	[%r14 + 0x0010], %r16
	.word 0xe471a000  ! 101: STX_I	stx	%r18, [%r6 + 0x0000]
	.word 0xe832c008  ! 107: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe029a020  ! 109: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xe80b6010  ! 115: LDUB_I	ldub	[%r13 + 0x0010], %r20
	.word 0xe4328008  ! 116: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe009c008  ! 117: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe801a030  ! 120: LDUW_I	lduw	[%r6 + 0x0030], %r20
	.word 0xe0538008  ! 126: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe8238008  ! 128: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe0538008  ! 133: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe4398008  ! 139: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe0234008  ! 140: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe0718008  ! 141: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe03a8008  ! 142: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe829a018  ! 145: STB_I	stb	%r20, [%r6 + 0x0018]
	.word 0xe03ae030  ! 149: STD_I	std	%r16, [%r11 + 0x0030]
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe853a028  ! 154: LDSH_I	ldsh	[%r14 + 0x0028], %r20
	.word 0xec59e038  ! 157: LDX_I	ldx	[%r7 + 0x0038], %r22
	.word 0xe43ba000  ! 159: STD_I	std	%r18, [%r14 + 0x0000]
	.word 0xe042a010  ! 162: LDSW_I	ldsw	[%r10 + 0x0010], %r16
	.word 0xe0536018  ! 165: LDSH_I	ldsh	[%r13 + 0x0018], %r16
	.word 0xe4232020  ! 167: STW_I	stw	%r18, [%r12 + 0x0020]
	.word 0xe8218008  ! 168: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe072c008  ! 169: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe039a030  ! 172: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe0498008  ! 178: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xec0ba038  ! 180: LDUB_I	ldub	[%r14 + 0x0038], %r22
	.word 0xe039a030  ! 182: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe4732010  ! 183: STX_I	stx	%r18, [%r12 + 0x0010]
	.word 0xe03b6028  ! 185: STD_I	std	%r16, [%r13 + 0x0028]
	.word 0xe429a028  ! 186: STB_I	stb	%r18, [%r6 + 0x0028]
	.word 0xe4498008  ! 189: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec432018  ! 191: LDSW_I	ldsw	[%r12 + 0x0018], %r22
	.word 0xe801a020  ! 196: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xe44b4008  ! 197: LDSB_R	ldsb	[%r13 + %r8], %r18
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe4732000  ! 201: STX_I	stx	%r18, [%r12 + 0x0000]
	.word 0xe052a018  ! 205: LDSH_I	ldsh	[%r10 + 0x0018], %r16
	.word 0xec018008  ! 207: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe851a028  ! 209: LDSH_I	ldsh	[%r6 + 0x0028], %r20
	.word 0xe432e020  ! 211: STH_I	sth	%r18, [%r11 + 0x0020]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe8398008  ! 215: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe032c008  ! 219: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe0298008  ! 221: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe0438008  ! 225: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe423a028  ! 226: STW_I	stw	%r18, [%r14 + 0x0028]
	.word 0xe011a028  ! 228: LDUH_I	lduh	[%r6 + 0x0028], %r16
	.word 0xe471a020  ! 229: STX_I	stx	%r18, [%r6 + 0x0020]
	.word 0xe4298008  ! 232: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe0732018  ! 239: STX_I	stx	%r16, [%r12 + 0x0018]
	.word 0xec3ac008  ! 242: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe459c008  ! 253: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xe002a008  ! 255: LDUW_I	lduw	[%r10 + 0x0008], %r16
	.word 0xe413a038  ! 260: LDUH_I	lduh	[%r14 + 0x0038], %r18
	.word 0xec3ba010  ! 266: STD_I	std	%r22, [%r14 + 0x0010]
	.word 0xe822e028  ! 267: STW_I	stw	%r20, [%r11 + 0x0028]
	.word 0xe029a010  ! 269: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe452a018  ! 270: LDSH_I	ldsh	[%r10 + 0x0018], %r18
	.word 0xec09a020  ! 275: LDUB_I	ldub	[%r6 + 0x0020], %r22
	.word 0xe41ae020  ! 279: LDD_I	ldd	[%r11 + 0x0020], %r18
	.word 0xec72c008  ! 281: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe4518008  ! 284: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe031e008  ! 285: STH_I	sth	%r16, [%r7 + 0x0008]
	.word 0xe8418008  ! 293: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe4532020  ! 294: LDSH_I	ldsh	[%r12 + 0x0020], %r18
! Thread sync; stream = 1; instance = 0
	ta	%icc, T_RD_THID
	mov	1, %g2
	sll	%g2, %o1, %g2
	setx	ij_sync_mask_area + 0, %g1, %o1
	ld	[%o1], %g1
	andn	%g1, %g2, %o0 
	cas	[%o1], %g1, %o0
	cmp	%g1, %o0
	bne	.-16
	nop
	ld [%o1], %g1
	tst %g1
	bne .-8
	nop

join_lbl_0_0:
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 0,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 1,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 2,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 3,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 4,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 5,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 6,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000002, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 7,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 8,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 9,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 10,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 11,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 12,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 13,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 14,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 15,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000002, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 16,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 17,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000002, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 18,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 19,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 20,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 21,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 22,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 23,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 24,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 25,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 26,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 27,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 28,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 29,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 30,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 31,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	normal_end:
	ta      T_GOOD_TRAP
	
	
	bad_end:
	ta      T_BAD_TRAP

.data
.align 16
ij_sync_mask_area:

	.word 0xffffffff


!normal_end:
!        ta      T_GOOD_TRAP
!
!
!bad_end:
!        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************

SECTION .UDATA1  DATA_VA=0xd08e0000

attr_data {
        Name = .UDATA1,
        VA=0xd08e0000,
        RA=0x010e000000,
        PA=0x010e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global user_data_start
user_data_start:
        .skip 1000

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] ASI_SWVR_UDB_INTR_R,     tmp0

       ! Read data J_INT_ADATA0
        !setx    0x0000009f00000600,     %l7,    tmp1
        !ldx     [tmp1], tmp2

       ! Read data J_INT_ADATA1
        !setx    0x0000009f00000700,     %l7,    tmp1
        !ldx     [tmp1], tmp2

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l7,    tmp1
        !ldx     [tmp1], tmp2
        stx     %g0,    [tmp1]

       ! add this to preserve the value of o1
        mov   %o1, %l6

        ta      %icc, T_RD_THID
        sll     %o1,3, %o1

        setx   page1a,%l0,  %l7       ! set the data
        ldx   [%l7+%o1], tmp1
        inc     tmp1
        stx   tmp1, [%l7+%o1]

        ! restore
        mov   %l6, %o1

        !inc     flagr
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

       ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l7,    tmp1
        stx     %g0,    [tmp1]

! Initialize jbi interrupt vector.
        setx    0x0000009800000a00,     %l7,    tmp1
        set     0x4,        tmp2
        stx     tmp2,    [tmp1]

!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================

!#define MAIN_PAGE_HV_ALSO
!
!#include "enable_traps.h"
!#include "boot.s"
!
!.text
!.global main
!
!main:
!
!  ta    T_CHANGE_HPRIV
!  //ta    T_CHANGE_NONHPRIV

done;

h_bad_end:
        ta T_BAD_TRAP

.global  My_0x30_trap

My_0x30_trap:
  !inc %l4
  done

SECTION .NCDATA0  DATA_VA=0xd01ee000

attr_data {
        Name = .NCDATA0,
        VA=0xd01ee000,
        RA=0x8010000000,
        PA=0x8010000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base0
ncdata_base0:
        .skip 1000

SECTION .NCDATA1  DATA_VA=0xd02ee000

attr_data {
        Name = .NCDATA1,
        VA=0xd02ee000,
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base1
ncdata_base1:
        .skip 1000

SECTION .NCDATA2  DATA_VA=0xd03ee000

attr_data {
        Name = .NCDATA2,
        VA=0xd03ee000,
        RA=0x800f000000,
        PA=0x800f000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base2
ncdata_base2:
        .skip 1000

SECTION .NCDATA3  DATA_VA=0xd04ee000

attr_data {
        Name = .NCDATA3,
        VA=0xd04ee000,
        RA=0xc000000000,
        PA=0xc000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base3
ncdata_base3:
        .skip 1000

SECTION .NCDATA4  DATA_VA=0xd05ee000

attr_data {
        Name = .NCDATA4,
        VA=0xd05ee000,
        RA=0xd000000000,
        PA=0xd000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base4
ncdata_base4:
        .skip 1000

SECTION .NCDATA5  DATA_VA=0xd06ee000

attr_data {
        Name = .NCDATA5,
        VA=0xd06ee000,
        RA=0xe000000000,
        PA=0xe000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base5
ncdata_base5:
        .skip 1000

SECTION .NCDATA6  DATA_VA=0xd07ee000

attr_data {
        Name = .NCDATA6,
        VA=0xd07ee000,
        RA=0xf000000000,
        PA=0xf000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base6
ncdata_base6:
        .skip 1000

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
        }

.global my_hyp_data
.align 0x40
my_hyp_data:
        .skip 0x200

#define PAGE1A_ADDR 0x86660000
#define PAGE1A_ADDR_RA 0x86660000

SECTION .PAGE1A DATA_VA=PAGE1A_ADDR
attr_data {
        Name = .PAGE1A,
        VA=PAGE1A_ADDR, PA=PAGE1A_ADDR_RA, RA=PAGE1A_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page1a

page1a :   .skip    2048

.end



SECTION .ISEG_0 DATA_VA = 0x0000000000100000
attr_data {
	Name	 = .ISEG_0,
	RA	 = 0x0000000000100000,
	PA	 = ra2pa(0x0000000000100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x906b2136a0937603
	.xword	0x1726adae5407b0f0
	.xword	0x73e0d8676dcf2d9e
	.xword	0x910746ef12c7a81b
	.xword	0x81634cd3b695a944
	.xword	0xedb4e207a7e51b79
	.xword	0x22f87fa66bfbd6f0
	.xword	0xc1afd00665c278a3
	.xword	0xeefa08df991463e7
	.xword	0xce9e01c0cee8ff17
	.xword	0x43d7459de7d04a61
	.xword	0xe5e36c0352c1a8fb
	.xword	0xf546ac032dfbb4c4
	.xword	0xaa6d9977e08fee05
	.xword	0x08702ded3b9dc442
	.xword	0x0ff47283f3844a82
	.xword	0xc80a61bbda675b06
	.xword	0x8a54487bbff2fcb3
	.xword	0xdfcc3ce5abb00580
	.xword	0x033772d4c3675c92
	.xword	0x8803e3b52b7a59d9
	.xword	0xee4e9858d576330f
	.xword	0x55283c3fcfd4b842
	.xword	0x53d5ecad954047ad
	.xword	0xb6ee448ee64f1809
	.xword	0x239a8b07fb6a0be0
	.xword	0xec113063087b492d
	.xword	0x31e3c8d220bb1a4d
	.xword	0x234c5d40aecd39fc
	.xword	0x8a8853895488f31a
	.xword	0x0b791c8e8128044e
	.xword	0x5fda81580df7f96d
	.xword	0xc12b068e29234c8f
	.xword	0xe5e27c7e5b6f4264
	.xword	0x58b8171b43b6cb4e
	.xword	0x6970667f0b78489d
	.xword	0x47f020e6198113c8
	.xword	0x74bcd5c278badc2e
	.xword	0x213e07b52d3c10ae
	.xword	0x9dcdacec2d72c781
	.xword	0xb7377665b83ce673
	.xword	0x9102f083303b6409
	.xword	0xf3f5d42d2bc70372
	.xword	0xc67721094750f40e
	.xword	0xcc045282d0996c49
	.xword	0xfd356ccfac339b19
	.xword	0x3fd6a48ca8861e98
	.xword	0xc91fca8497f52a27
	.xword	0x591902a8a2092e10
	.xword	0x77a9200da1d1040d
	.xword	0x008acd2767baa940
	.xword	0xd4a30a7ee868ebe1
	.xword	0x918f569d6e361999
	.xword	0x5960a13ec2d79570
	.xword	0x0e4bb1709fe5e941
	.xword	0x78dcfc123229495c
	.xword	0x0e62fde1fb39c9f6
	.xword	0xba42c4b1aba0fd2c
	.xword	0xbb89097ac70b435c
	.xword	0xabb3af326d3feae0
	.xword	0xa264d5f37dbc4375
	.xword	0xd502fcbbc05e0e30
	.xword	0xe7f2cfc833703243
	.xword	0x9daa123c75206aad
	.xword	0x96f6fe31ec6a2903
	.xword	0x029338d036fc4766
	.xword	0x06c841f12ea4e331
	.xword	0xb84606cc48cf5b94
	.xword	0x4fbbcbc038914cb8
	.xword	0x1f1656a5ddfc388d
	.xword	0x642147b4f8c5463e
	.xword	0x1f214f5d8b7d5fac
	.xword	0xdd577d9174c64960
	.xword	0xdd87f5b61bef2b73
	.xword	0xd0e18998bbf4c8c5
	.xword	0xe67a97998136fdbb
	.xword	0x007833eeca584d0e
	.xword	0x40b6c29c0c65a760
	.xword	0xf151fe601656dd4e
	.xword	0xe1077acf7e49f59c
	.xword	0xe9ed18b48ef4de25
	.xword	0xcd3e0b7cf5848b23
	.xword	0x8627e5bc45b83bec
	.xword	0x5f438fabb9b7a878
	.xword	0x0aa826b4954dfcaf
	.xword	0x75c10ed72f068741
	.xword	0xb5a5ed1bae7fe518
	.xword	0x3dbe2fd621f2c920
	.xword	0xd42ab319180dfb8e
	.xword	0xa1e23d79bd07c9f3
	.xword	0x0c7d7af37c3a2143
	.xword	0x6be1e512c624d172
	.xword	0x731f95f897ccb72e
	.xword	0x7a7692b7e454ebfb
	.xword	0xbdf3a6b77d289cba
	.xword	0x8f9f7654964e6925
	.xword	0x4790547535661f5d
	.xword	0x6354115a24ef4383
	.xword	0xbce6943f174c539e
	.xword	0x410397b3a65a594e
	.xword	0x97a242d9c289a34a
	.xword	0x8f9a9c9aa26148f5
	.xword	0x522f25d56fc6ed40
	.xword	0x1665d4c5fe13a1bb
	.xword	0x738e3ad4046ba652
	.xword	0xc5f09ce571861f7a
	.xword	0x814a74f6e6c1988c
	.xword	0xebd6875a7fcdbd5c
	.xword	0x293b3fb444ec2127
	.xword	0x3faef6f3c78f79d9
	.xword	0x39b82d71eaad79d1
	.xword	0xc3a838dc96872289
	.xword	0xbad303e81302b632
	.xword	0x1e727877018cb397
	.xword	0xfa31ee344643e6eb
	.xword	0xd90722967041b8fe
	.xword	0x6887f80f94ab93dc
	.xword	0x6664b2cb940dd702
	.xword	0x965c736709737afd
	.xword	0x99e2d385b5fe793f
	.xword	0xe36db143ea1f37af
	.xword	0x006b926c8ad0ff63
	.xword	0x58c4a6b2ffab2a5f
	.xword	0x02a636bae53f9544
	.xword	0xb1d12f5bf5549e90
	.xword	0x46f56e595652c2b2
	.xword	0xc831d58317042187
	.xword	0x2993724b61c030c8
	.xword	0x744dfbe8951abf96
	.xword	0x8ab96d54f40699ef
	.xword	0xf00d74bb203cbab2
	.xword	0x604b978373560749
	.xword	0xfda71adda85d9fbe
	.xword	0xc1d252c06732fb28
	.xword	0x6ea63fb74cb8f816
	.xword	0x320ab0257703ef3d
	.xword	0xdf9e5d5ffb07c480
	.xword	0xcbe8d1dcd6fb6b2e
	.xword	0x5f19a7b95bc910a6
	.xword	0xcaf8358b22c57613
	.xword	0xc585f33e5eac54db
	.xword	0x97963d408129f28d
	.xword	0x28ab4fb1cb741aa6
	.xword	0xf0bdf776925c98a7
	.xword	0xf867013e3d3f303d
	.xword	0x2f9e1a5bee74e52b
	.xword	0x85ecba41b3166f4c
	.xword	0x894959bade9e70eb
	.xword	0xa41a65e7544bcf24
	.xword	0xac58c93c56427124
	.xword	0x4ed8bc9b5b3aaf3f
	.xword	0xd5c390d24a7591ce
	.xword	0xb98d9134ebd1ab7f
	.xword	0x0193e10b79ce89a7
	.xword	0xbc3a736fae06027b
	.xword	0x2423a35ec1944a8e
	.xword	0xec7c637dea81159a
	.xword	0xdf98aae991ae7c2e
	.xword	0xe0cd6898bf3cbc24
	.xword	0xc3e2ab39f9cb9c69
	.xword	0x67b2b3648b033fe9
	.xword	0x3eefe7058ff1db92
	.xword	0x194ae30e8b1a154f
	.xword	0xe956a60a23799b4b
	.xword	0xa243ea2609986522
	.xword	0x1388f1b41c34937e
	.xword	0x0f0542e2e9de23d1
	.xword	0xd2cf2db35d132871
	.xword	0xd6bbfb42e3982d95
	.xword	0x2c07eed517b58fa9
	.xword	0x57c5648837457c65
	.xword	0xd6ff0a4fa4be795f
	.xword	0xd296c455c65a734b
	.xword	0x6b49223d748e2c29
	.xword	0x96f5ce556ac74da4
	.xword	0xad87c7249d2e78a9
	.xword	0x20f4f7313c1f6b1f
	.xword	0xc5d60f16937523f6
	.xword	0x8e7f7ddfb7c696a7
	.xword	0x61ac02cc2a4d70ba
	.xword	0xc979f8f461191909
	.xword	0x8abfda6808f995ee
	.xword	0x108b6fd1707cafd8
	.xword	0x1bdfa66c032eb731
	.xword	0xa82b0789787c0f72
	.xword	0x9b161649448b04e9
	.xword	0xbb610fe628b83d38
	.xword	0x3dbd3c8d9407171e
	.xword	0xe14e7cb33a962bcc
	.xword	0x78c2484ce311ab56
	.xword	0x98eb396ac0ec2f61
	.xword	0x0ea40774323106a3
	.xword	0x4248bc7d8fd0955f
	.xword	0x6761bd4abfa140c7
	.xword	0xc19bbf3a3cfa3f3b
	.xword	0x8f69d66af40d2969
	.xword	0x6edc9dd1ec878e8c
	.xword	0x1d6fbbbdf7dfeabb
	.xword	0x3b58e8faf900a314
	.xword	0x24be8fa539aac435
	.xword	0x2572f97784f5db99
	.xword	0xd48a080092303a15
	.xword	0x09ce49497298f90c
	.xword	0x736374c23031cc33
	.xword	0x9115ad44865a279b
	.xword	0x201c46e372296398
	.xword	0x6bdf5feac090f036
	.xword	0xd7e41aa94a74a9fc
	.xword	0xae46bce0d831f233
	.xword	0xdc299f86d77b901b
	.xword	0x3a2a2167a36ed642
	.xword	0x2a9a8466b6308f91
	.xword	0xe302e24719f7bb01
	.xword	0x51d45ecede0086f4
	.xword	0xa76c469d2e4aaeca
	.xword	0x93a9e804257cf6fa
	.xword	0x59e8b42195f111e2
	.xword	0xccfec8678578da5b
	.xword	0x9a99484bd5c2c1a9
	.xword	0x5d02872cb030b3a5
	.xword	0x84c56a17ffdc1183
	.xword	0x90502563386eaece
	.xword	0x65c904b8d3a63d70
	.xword	0x4196294db9e7601f
	.xword	0xc42ec312eac0cd0c
	.xword	0xd8b98499623dee5c
	.xword	0xcfc7e6621a7349d0
	.xword	0x549119e3c198fa82
	.xword	0x2ea9b3a5ae2092e8
	.xword	0xca0a034383ddd584
	.xword	0x6d72e40158037561
	.xword	0xe77210bc9b652c6b
	.xword	0x9375e342350ceadb
	.xword	0xae8dba8b556e2148
	.xword	0x598a203b274ea7b1
	.xword	0x4cf89b97058085b6
	.xword	0x4d798626cf75dabf
	.xword	0xad4dba91b20436de
	.xword	0x8aa49d075d24460d
	.xword	0xae3379dbb006952d
	.xword	0xaac90bdca0f60ea2
	.xword	0x2d2fd85c43d51190
	.xword	0x35fa25e1363708f5
	.xword	0x478374ca8fd230bf
	.xword	0x0a7080eaa158c398
	.xword	0xddccba5ff00f2ab3
	.xword	0x440814fc05e854ee
	.xword	0xd762017d2e1ed4d3
	.xword	0xb92450df6cb0818a
	.xword	0xfc17e824f14b8922
	.xword	0x6344ccc68b41422a
	.xword	0x28d06100a4f644cf
	.xword	0x31e66957619c8eba
	.xword	0x5460eaf53476ee2e
	.xword	0xdbc30f18d22460a5
	.xword	0x22372f32999d22b5



SECTION .ISEG_1 DATA_VA = 0x0000000010100000
attr_data {
	Name	 = .ISEG_1,
	RA	 = 0x0000000010100000,
	PA	 = ra2pa(0x0000000010100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xd69f7feab0076eb2
	.xword	0xb143f8e662ca03c0
	.xword	0xfa04a7a8daa87c80
	.xword	0x5365b9e3b4e0ed61
	.xword	0xe2b8e2bea91da335
	.xword	0x16dea338a0120b54
	.xword	0x13ce4935a50f8037
	.xword	0xfb6d18ee533ac40c
	.xword	0xe54f5bd5c88ed7fd
	.xword	0x0e43acce83d35d8c
	.xword	0x245b97713842fd4f
	.xword	0x22ff51004040e1f8
	.xword	0xfc64dfb607ea8861
	.xword	0xaa54118b0d6f71f5
	.xword	0xd701b6a341b4ce0b
	.xword	0xce3df4a8c22fb3ed
	.xword	0xb71ff4d8db295b32
	.xword	0x39ea74b0ca4e4296
	.xword	0x4506dcfb26abff3b
	.xword	0x96d0ffb9773f8e52
	.xword	0x388da8e44137e1f0
	.xword	0x32cc7f2756ed563a
	.xword	0xf17b17af67fd08a9
	.xword	0xa78309cb195ff08f
	.xword	0xaf33a91e8814f974
	.xword	0x2949fe10e27df6c3
	.xword	0x3fe57865a990f8d1
	.xword	0x2f4ab8464ec67627
	.xword	0x6fa19dfec3e731ce
	.xword	0xa23ef3168285574a
	.xword	0xaa6145599a05266e
	.xword	0x3666f03a47fa1f31
	.xword	0xc7c478bf7c57832f
	.xword	0xe5b2b614243e1cc1
	.xword	0x914d1121c2597219
	.xword	0xf55178f61daa91a0
	.xword	0xee67fc98703295ed
	.xword	0x51122232fab5cce5
	.xword	0xd7a832cdc8825931
	.xword	0x0fa0d31da01ab03d
	.xword	0x2f62886b4d917c9c
	.xword	0x5522e4f771cd32e9
	.xword	0x2b310f7354e93296
	.xword	0x0e8406f4537fd055
	.xword	0xc7f714b92c5b889e
	.xword	0xff2a833604092ce6
	.xword	0x1f605dc846a31e04
	.xword	0xbf3e6bb99957da2f
	.xword	0xa636055cf910055e
	.xword	0xbe6fb0223fd3d2d4
	.xword	0x77e1c7b73adb783f
	.xword	0x4bd6236632fe0922
	.xword	0xd596b80383f09258
	.xword	0x310d0fdb16e55997
	.xword	0xb3c5c1dc7b8e0bde
	.xword	0x8afe5c6dc171a703
	.xword	0x98a7879aa872d6ec
	.xword	0xa92cc8b96a6729db
	.xword	0xefaca86fc1f2e6cf
	.xword	0x47db197ca89c3014
	.xword	0x1a16bc383ebe28a5
	.xword	0x689677f69a1c131e
	.xword	0xe6a5f37290b428c6
	.xword	0x9ddfe62400eef621
	.xword	0x0b51161be92d84b7
	.xword	0x43a524e1ea9f6618
	.xword	0x491b559ce322665c
	.xword	0xdf49571c93af414d
	.xword	0x18e6f881a63779c9
	.xword	0xfd4b8320e9dbe7ec
	.xword	0xf0a89768a4906f48
	.xword	0x7aa652ae9970a068
	.xword	0xd3e01f12f1d424f7
	.xword	0x6e90ed6205a016b6
	.xword	0x0f37f8c08f4abc8b
	.xword	0xd7876e5ad2852edc
	.xword	0x209246fff96862c6
	.xword	0x82c5491eb09836df
	.xword	0x776df5dbe89d83fa
	.xword	0xa3f1c6dcaa42081c
	.xword	0x63ee7b826f1d97d5
	.xword	0xa19c88413e831a47
	.xword	0x30c9920d6dbfd17d
	.xword	0xb22a84094cb72996
	.xword	0xb5461f2ebc0b4a38
	.xword	0x06a724af8a796c0c
	.xword	0x3d06ffccdff6023d
	.xword	0x658132a55fb0214a
	.xword	0xb0e1990b1227a26d
	.xword	0x86ba24a085af6eeb
	.xword	0x5e88d695716b90a6
	.xword	0xda50d21e442fcdf3
	.xword	0x2f4c17cf5e42d96e
	.xword	0x6ec7531082faa728
	.xword	0x0e9178b417a7d9b0
	.xword	0x48468366646267eb
	.xword	0x9f99b8e1b213cfea
	.xword	0x9b8ae1ee39ec0b11
	.xword	0x6436991a81bceefd
	.xword	0xfc501547381da7f6
	.xword	0xb2ed433e71049a84
	.xword	0xaddde79f8d751c97
	.xword	0x2253b71de506f1ce
	.xword	0x22082ef058f01558
	.xword	0xfdbbe8e80f1ad3b3
	.xword	0x76b47589b5875a87
	.xword	0x19c33f9ddd3c8f0c
	.xword	0x0a3ba5af00ddfc18
	.xword	0x5888df98bf682644
	.xword	0xb4cbefc5db92cae8
	.xword	0xa112d48a49295c91
	.xword	0x6f8457eaebb16f7c
	.xword	0x00392d396b2d0d26
	.xword	0x4b64325a33e88d3b
	.xword	0xbaf71581e5c66174
	.xword	0x3980477f4c12c42b
	.xword	0x54275cf814d1f725
	.xword	0x5125dacf3e9545f5
	.xword	0xc7fa0056d576fe27
	.xword	0xb599f0c5b1508879
	.xword	0xf090870cfe26caec
	.xword	0x7dcf730997b3ce66
	.xword	0xd871e79c0e7c0d02
	.xword	0xc0fbdc6ba0c62264
	.xword	0x92f9fda9c36ba361
	.xword	0x816be4a8481faa31
	.xword	0x8cdd6698da381769
	.xword	0x0cb07b2e8e827341
	.xword	0x109dc8d66001fb9c
	.xword	0x6ce6da4c0905c125
	.xword	0x5ed8fec71d59a9b1
	.xword	0x6d6acfb1d0c1a621
	.xword	0x045a3b07f3d5c566
	.xword	0xa97fc0641e44c605
	.xword	0xf118ce3e88439f4f
	.xword	0xb3660e88c1bf0b9f
	.xword	0x3fcf4bfe515b5d77
	.xword	0x351880bd762a1df2
	.xword	0xf78fad13f20027a1
	.xword	0xa060de26bad8dde8
	.xword	0x8b2f5049ed0c0b7d
	.xword	0xf52bb4c899d47b3a
	.xword	0xc4ef970e18721f73
	.xword	0x259c35c7930a0c4b
	.xword	0x4ddfc42fab6a6fd6
	.xword	0xdee86cce09d53e20
	.xword	0xd359c7665aa1bbb3
	.xword	0x7f066a3368b968b0
	.xword	0x6596710444fd7f13
	.xword	0x951210a870808630
	.xword	0x1a8612f6612beffa
	.xword	0x7e19bab849891b87
	.xword	0x8d36787eb1f8688b
	.xword	0xe681720e0c0700d6
	.xword	0x0163e790b360ebd9
	.xword	0x6e3c02495c840f9a
	.xword	0x7a1c3ad756a0e426
	.xword	0x377171393f86627e
	.xword	0x9e1803425831d43b
	.xword	0xb6ddf6d0a14beb12
	.xword	0x2b36e52ca0d28616
	.xword	0xe50c88c30d323975
	.xword	0x10ce3a8af0ed70f1
	.xword	0x0dd14f4af06417d8
	.xword	0x866bbb88e16d75e0
	.xword	0xe61c5f2cc071ea02
	.xword	0xaa429fb46a1e750a
	.xword	0xe7e2349d54f08212
	.xword	0xe7a91bacba83919f
	.xword	0x5e494f38dc040f6e
	.xword	0x24bee39409ee735c
	.xword	0xfd76f8a129c354b5
	.xword	0xaefa93d5bea2587e
	.xword	0xded78b2657208f8b
	.xword	0x1560a23cfae4df36
	.xword	0xb8c328596920aa0a
	.xword	0x03741dd455f84323
	.xword	0xd241a18d0e33abaf
	.xword	0x912c332b8dc27481
	.xword	0xc6fcc563f993f01f
	.xword	0x3c6ffa945fd1552a
	.xword	0x4879eecc7c54e737
	.xword	0xc22bea22f4d06e41
	.xword	0xeabbfaccccee81d4
	.xword	0x5ace7c7adbbaba35
	.xword	0x9cfc9c145436d35f
	.xword	0x48906a8eb9f63af0
	.xword	0x62515fef20749745
	.xword	0xeff5a19f6ee0c899
	.xword	0xbc358f53fe354db8
	.xword	0x6ef979ce9af64dd4
	.xword	0x4cc88f8c435500be
	.xword	0xb96fd608f0f87825
	.xword	0x62bd7577b2b75fa0
	.xword	0x6042bc8f5ca8853d
	.xword	0x4017354374a7b1ae
	.xword	0x2a91c9d2250994ae
	.xword	0xe27899c10228a727
	.xword	0x392615834f7b503f
	.xword	0x06fca67472bea691
	.xword	0x72466de5f8557b85
	.xword	0x2a656a4aea9991d0
	.xword	0xb66ea8c471b674e9
	.xword	0xceea85df9e11140c
	.xword	0x51b7affd097407d5
	.xword	0x688aecdad3858a8f
	.xword	0x83e57b6caae7a4ef
	.xword	0x4451958d677ebdd3
	.xword	0x33bdb305483e1298
	.xword	0x976c626a413cff5a
	.xword	0xcfa3155813209c2b
	.xword	0x4207b03510cd13e2
	.xword	0x8a9548c5d557e1fb
	.xword	0x3a1bdd442e0eb2cf
	.xword	0xaa9beb23c9d0597d
	.xword	0x15dff20d5b172cde
	.xword	0x2f8d49b23dad4ca5
	.xword	0x4b2cdc1944c318af
	.xword	0x0a567cb13d17501a
	.xword	0x6b10fc4164ee9bb7
	.xword	0xb22132e7ebb06dc6
	.xword	0x22213cd951e46e72
	.xword	0x8b0157728e39dfd1
	.xword	0x13ea2bc3a2c3db89
	.xword	0xbf516ca141ae0040
	.xword	0x0aaeac03c8610972
	.xword	0xd49d0c53ed8d0eb5
	.xword	0xca3974c494a0ba6c
	.xword	0x0b920760de69fdb6
	.xword	0xc6a1536cf6baaa24
	.xword	0xdb183cd7260a9d27
	.xword	0xe2feab6cc701dc48
	.xword	0xf9d8d28e1d895cc1
	.xword	0x43b060db3b503492
	.xword	0xd2de173e7b8cc1c3
	.xword	0x5b2b306c06bbca3a
	.xword	0x70af6dee9a10f1ab
	.xword	0x31a8176a7900f5d0
	.xword	0x36dd54db365c6df4
	.xword	0xfb734be086b360d9
	.xword	0x25288f9027ecde4a
	.xword	0xbc20ba0b5f15d301
	.xword	0xa2cd6092dce8d368
	.xword	0x75f0707c8c431c0e
	.xword	0x39411289450ec321
	.xword	0x251a24b8c70e0f42
	.xword	0x5f0695cafa215aa5
	.xword	0x1bb1fc29e3fe73ed
	.xword	0xf2e55bfe76cfccd0
	.xword	0xa1db300eb8f55119
	.xword	0x39915973cdaa82c9
	.xword	0x5b37506acda24ddb
	.xword	0x365104db07e2c988
	.xword	0xc96e35a1da5e0c6a
	.xword	0x967c61f69a3a1f03
	.xword	0xea2bfb008f86fc74



SECTION .ISEG_2 DATA_VA = 0x0000000020100000
attr_data {
	Name	 = .ISEG_2,
	RA	 = 0x0000000020100000,
	PA	 = ra2pa(0x0000000020100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x0e8428567654c07c
	.xword	0x088e5ee1b4a08a3e
	.xword	0xf7acfdad3956da09
	.xword	0x7f44b8c90f0039cb
	.xword	0x02b55314b04d99ee
	.xword	0x006f219bbcbe442a
	.xword	0xc623a387ce8826cc
	.xword	0x4e39a802d35a9f6b
	.xword	0x2adbffef5692c745
	.xword	0xf0c75a8dd4f21323
	.xword	0xa521a5cac5e4cafa
	.xword	0x2fccd39a6ade433b
	.xword	0xa9486bd1fc0e7cbe
	.xword	0xfb7be1dab36800b5
	.xword	0x340f365cdec8cb12
	.xword	0xf7377c146826d32e
	.xword	0x8fac8e007334e7ea
	.xword	0xb674772992ac394b
	.xword	0xd3a74a4c48615f34
	.xword	0x734476a379935cdf
	.xword	0x39f3dbff3df26bb8
	.xword	0xc30a5536e5b7d531
	.xword	0x7a771742c9392782
	.xword	0xcf4c399e1c55b7fa
	.xword	0x09758d16027bbb98
	.xword	0x9c7ba42b10ae3b47
	.xword	0xad6322f3c13917e8
	.xword	0xbde628ddba6ea2f9
	.xword	0x97bc65a9716b4340
	.xword	0xdacbcfce00c7c3f9
	.xword	0x74d066cc44d18bee
	.xword	0x4499944b88b84084
	.xword	0x41f4d117d645ac44
	.xword	0xaa18c1172a17bef0
	.xword	0x6ed29c1223651c37
	.xword	0x56a900d7dda3c2fa
	.xword	0x740df774f18875a3
	.xword	0x9cb3b01447c1b5c7
	.xword	0xe23e61736b691761
	.xword	0xd90fc8dc4d1b2988
	.xword	0x2132cf4fdf4008b6
	.xword	0xce2e9c9685476fc5
	.xword	0xe1522848b56ec68d
	.xword	0x9891ceae84af2de7
	.xword	0xfe548e453ba94d89
	.xword	0x0ca4356ec9189a7d
	.xword	0x7da106842ddeca08
	.xword	0x4d90eb976ff5149e
	.xword	0x9c8448c3841a7e0b
	.xword	0xbaad8fa13296080f
	.xword	0x93b94ca28a4026d6
	.xword	0x0bf0066799fb2ac4
	.xword	0xe06f63118f444cb3
	.xword	0x55f3916378bb5266
	.xword	0x848eb836549d277c
	.xword	0xa4c723e071d2e29f
	.xword	0x0db0eb700013677e
	.xword	0x1f36af7bca44ac3b
	.xword	0xf2eac88c3a4bb64b
	.xword	0x786ff071828110f3
	.xword	0x88362105f8f9f0b3
	.xword	0xe426c9b13230979a
	.xword	0x61f54688f10b062b
	.xword	0xdd5703341ffe5ed0
	.xword	0xdb96b08ed816172d
	.xword	0x296c27c38a7563da
	.xword	0xfdcb65f94c3135a3
	.xword	0xd0322395d42e3260
	.xword	0x040c4d94000da661
	.xword	0x5eade88188697384
	.xword	0x5d6c7ce2886caafa
	.xword	0x8c786274d61ada0f
	.xword	0xda57216b6a79336b
	.xword	0x1b7386863fa9514a
	.xword	0xcf9554914f8a2a1a
	.xword	0x28ac2e02f9d9c6ad
	.xword	0x4bd905c98fe89478
	.xword	0x2e07115a7fe65988
	.xword	0xcf5357fe3b3945c4
	.xword	0x436eebd3aa3bd9af
	.xword	0xd9eb1b97d451f54a
	.xword	0x97b0684ae2378ab6
	.xword	0xdfd0eb30c7063021
	.xword	0xa0e64c7cadc21544
	.xword	0x815b1b09d6ca8dcc
	.xword	0xf724f3ec2a0171b2
	.xword	0x3a66a985f7aa4fff
	.xword	0x28d4d041e1650cc1
	.xword	0x62e5102a39304dc9
	.xword	0x94ab804575c49c13
	.xword	0x1d93430771f87c34
	.xword	0xdaabc046281fcf0f
	.xword	0xf6708f1080e4192a
	.xword	0xa7bad3ef237e6173
	.xword	0xb837fcf5f9bdab82
	.xword	0x8b57876095eb29c8
	.xword	0xfadc0a598a0f709c
	.xword	0xca971e05c423b82e
	.xword	0xba3526402a6180a0
	.xword	0x35bbd3091cfe83cd
	.xword	0x66098f13a451683b
	.xword	0x242e7b5c76220baa
	.xword	0x751d5f6d26238bd9
	.xword	0xd4453715341d266a
	.xword	0x1337f349a8cbd5f1
	.xword	0x5d79619ff9ab070f
	.xword	0xaac14821a2996aaf
	.xword	0x4f46dfbde477557e
	.xword	0xc52d5f38f5716174
	.xword	0x42a030fe0119f41a
	.xword	0xb439c7dff98f0446
	.xword	0x848ea2919714d059
	.xword	0xfc928514584aec26
	.xword	0x6760448b724496bb
	.xword	0x9be2edc24632cd98
	.xword	0x74c490fb8f1fbeba
	.xword	0x86a4474af4387310
	.xword	0x85eb75e4487d596c
	.xword	0x62d609c0ef4c8d39
	.xword	0xf8ea8f10cb937131
	.xword	0xff8344aaca746db6
	.xword	0x2f3b3eb0f6d368c8
	.xword	0xe9afd261ad794edf
	.xword	0xff415e8c7860887a
	.xword	0x62e9c51c3581b322
	.xword	0x55cda53a3ffcda40
	.xword	0x2aa778aee929e7c6
	.xword	0xaf1bb0389c838a31
	.xword	0x736de8a6d16db147
	.xword	0x442345a60ce5ff14
	.xword	0x6606d1a46bcfcd8d
	.xword	0x463f045bd6ac62b9
	.xword	0x8c43594ad9d9bbb8
	.xword	0xe4b93c20d0cbc6ef
	.xword	0x71c52b0cbc1d631c
	.xword	0xe460e60d4a44480b
	.xword	0x6254554d9e7da592
	.xword	0x6aaead6651e7fc0d
	.xword	0x2924210c909ee834
	.xword	0xb70e73b317e28c78
	.xword	0x68414dedd4b36d28
	.xword	0xe2783eb0974785f1
	.xword	0xd981f52616baddc1
	.xword	0x743b9d22c4549354
	.xword	0xfa05d832b9791fd2
	.xword	0x00d773f8acbbbecb
	.xword	0x5525c887d7067973
	.xword	0xc2590334aa3ec40d
	.xword	0x97f48c39432468c6
	.xword	0x5bd9411a7118bdc5
	.xword	0x7d1660c412433d42
	.xword	0x4f0597286e7fe92e
	.xword	0x566c6440c4a86cf6
	.xword	0x8f5c3a9177c1485e
	.xword	0x018348fb3bec0e37
	.xword	0x9c2f9c551608aaef
	.xword	0xca2a6a00a69d2779
	.xword	0xb9d655452474911f
	.xword	0x29dfa354d0b30e5f
	.xword	0x58afce0c5c8985be
	.xword	0xe2399d828220c2b4
	.xword	0x9882a272813c9276
	.xword	0xfb39298597ea2b88
	.xword	0xe6e5043f399a1a66
	.xword	0x5b63a7502d35cb7e
	.xword	0x1415f4c54577a096
	.xword	0xd4c9fb2b92f30312
	.xword	0x72a96b6980161110
	.xword	0x2b1ed6c7ef8181b0
	.xword	0xebf01cdadf2f0085
	.xword	0xec8a24e7be6ef25e
	.xword	0xca611a01f3d1a14e
	.xword	0x1801844208ea477b
	.xword	0x33b09160fdb67d95
	.xword	0xf8ef30154da34bbe
	.xword	0x8f91f7b2729bbf99
	.xword	0x2ba4e5d54dd43cca
	.xword	0x95c2dab5eaea7883
	.xword	0x5e304159116a8efe
	.xword	0x9a1b717049533816
	.xword	0xa2a703a7f89caee0
	.xword	0x23244d44d55e27cd
	.xword	0x035d46a0f4f12225
	.xword	0x368240581da26685
	.xword	0xdaa1fd8c0364bbeb
	.xword	0x89ae87523ccf6b6c
	.xword	0x0ca486607e061367
	.xword	0x51a5df4e6e6706f3
	.xword	0xa4b34f31519e910f
	.xword	0x4cc32cd35405d841
	.xword	0x7e5912c109dc24b6
	.xword	0x8e5fa6a46e86fdb8
	.xword	0x70446f06cafb5f0b
	.xword	0xa5a6b0d6d791fb7f
	.xword	0x79c18b06676aa775
	.xword	0xc97cbfd809015ad1
	.xword	0xa97c2f7ccf40db84
	.xword	0x77a771a5fc25c973
	.xword	0x83ee797a6a83ef99
	.xword	0xf65897e5161957bf
	.xword	0x3538f53cfe766f47
	.xword	0x68cce9403a912400
	.xword	0x171dbf094ef8959a
	.xword	0xf22a5d810e70eb03
	.xword	0xb5989dfdbe668bd6
	.xword	0xa357c037d8f71e07
	.xword	0xd69e55b093b60d7b
	.xword	0x4376558a74185ae9
	.xword	0xde99dbb8522950d8
	.xword	0x17fde955b79df8b8
	.xword	0xde579b1524622aae
	.xword	0x7c4cfb5090e9833c
	.xword	0x7e8899739ba0cd3c
	.xword	0x65a58e08cb67375f
	.xword	0x5559e04d8436e165
	.xword	0xeae138029bfaeb78
	.xword	0x333e656ede7b48a2
	.xword	0x9a9e985b3c74b957
	.xword	0x083ebe3cca90ed18
	.xword	0xf4a19e8f86bcac3d
	.xword	0xcd36c9f77728e413
	.xword	0x8c5fd5bc67fc35e8
	.xword	0x2c9edc7691e812aa
	.xword	0xf3d690f9523efd90
	.xword	0x347c58f2aecde2cb
	.xword	0x01289615152dc112
	.xword	0xacf094a65a0f0fbb
	.xword	0x395a06be5d112af4
	.xword	0x549d2759c634cda4
	.xword	0x2bcb01987032b6c6
	.xword	0xcc939f9189e6c946
	.xword	0x77758aba66fd9c98
	.xword	0xed84cb802890622a
	.xword	0x7a17403b89ffda07
	.xword	0xc37bba2ca27ec9b3
	.xword	0x1ceb2dc5e32c80b8
	.xword	0xe9b7e6647b55bda9
	.xword	0xd1095c33e174904b
	.xword	0x12da19e97a076d34
	.xword	0x235b0c24e1b89270
	.xword	0x86dd6ffb5a7bed7c
	.xword	0x928320a87bdeb409
	.xword	0x2b9ad08cc9c60a1e
	.xword	0x7585161a8dce4bc8
	.xword	0x59aa411cf967ab17
	.xword	0x595e6422270f9d6d
	.xword	0x72b3f793b3a00802
	.xword	0x5f98031021056917
	.xword	0xc9858ffc41f68064
	.xword	0x80a4f10584b1a33f
	.xword	0x8c7ab1bdfc2f307a
	.xword	0x7a5136301e2fdd7f
	.xword	0x7a59385e5b873c2b
	.xword	0x70494fb79df2578e
	.xword	0xbe4eedb2dc0215c4
	.xword	0x7caf99916f11ace2



SECTION .ISEG_3 DATA_VA = 0x0000000030100000
attr_data {
	Name	 = .ISEG_3,
	RA	 = 0x0000000030100000,
	PA	 = ra2pa(0x0000000030100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x9c540da458f2eda2
	.xword	0xd46c425a4cac968f
	.xword	0xc5b8249d8aeb57c6
	.xword	0xd788c6aef2cc0717
	.xword	0x5ba3c81537fd1e94
	.xword	0x549dfcf8adc52f43
	.xword	0x78be7f5b1e5752c8
	.xword	0xab86a03740ed121e
	.xword	0x0b511242dfaa9a63
	.xword	0x99189f907ed6fa71
	.xword	0x1aca559f40f9f77c
	.xword	0x79bd1fc13b300dce
	.xword	0xa52bc981d4346573
	.xword	0x03c7c0de7d5c54cc
	.xword	0x404a697b34d9672e
	.xword	0x839d51d1936a604f
	.xword	0xfba429358ced4028
	.xword	0x53def2ede9284ea8
	.xword	0x235242e962d4f5de
	.xword	0xba12edd845c47d28
	.xword	0xec6ba5f9dfd4f92a
	.xword	0xc281076e718b7482
	.xword	0xb23e07ea2e228530
	.xword	0xe77c21dd34a980ec
	.xword	0x5ae8cf3752ed4805
	.xword	0x55d0aa7912b21554
	.xword	0x8fa35411e1388fb5
	.xword	0x27c486d4368e69cf
	.xword	0x814bdca4777372d3
	.xword	0x1f37d5db1bdb6133
	.xword	0xfacf8b1d09b261a1
	.xword	0x1c8b918bac46aea6
	.xword	0xee7b08b4628b9f5f
	.xword	0x05a503609de1e977
	.xword	0xf5376d523c12a7db
	.xword	0x5401d762655d7321
	.xword	0x9098954006c46398
	.xword	0xb8035f5bc9b4902b
	.xword	0xa03daed7a7e01851
	.xword	0x40d09d9cbb459806
	.xword	0xa64ea291fa925ba4
	.xword	0x6911863ed4ff658e
	.xword	0xfae0a6cd7183c958
	.xword	0x5695070d73b45ecd
	.xword	0x9a45695d46b4019a
	.xword	0x31150a932f2c1d15
	.xword	0x71059ba318f314ea
	.xword	0x3b40e0f2b5ca9537
	.xword	0xdb98780c65f69c9c
	.xword	0x71a03be41cc0e902
	.xword	0x684cf4bcc2106694
	.xword	0x93ee1bd23cdaa649
	.xword	0x57b79c7746f9a786
	.xword	0xc50de08cd759a81f
	.xword	0x321fa732a5461082
	.xword	0x638ba1b82b85599d
	.xword	0x7509452499178c8d
	.xword	0x4232f2ff8e2b6664
	.xword	0x2a6703594ed4d2ed
	.xword	0xc9d572225a03b0ca
	.xword	0xcb65da329535d6c4
	.xword	0xd8ce2ac3983b6c80
	.xword	0x6c5478a770019fce
	.xword	0xdc48cd2693ca27de
	.xword	0x7d7d12fdd3dffe6e
	.xword	0xe5a741115e4d71d3
	.xword	0x148ff2e688a9683e
	.xword	0x833840b13c877468
	.xword	0xcc4ac5e04570e3f4
	.xword	0xdd23def3c365c23c
	.xword	0xaefa38de0e718d33
	.xword	0x0fe94f48cbf8b65e
	.xword	0xc6a8effa315826d3
	.xword	0x910cee2385c369ed
	.xword	0x37ac8826f5ac0452
	.xword	0xe27f73c1022b6785
	.xword	0x9725a7ab15ac0db9
	.xword	0x822cfb3e64155b90
	.xword	0x53154b4ff1058699
	.xword	0x095e680e9452ff71
	.xword	0x1f08805bdfeebeae
	.xword	0x8602f1e4f3b7bfc5
	.xword	0xb1a98391986a344c
	.xword	0x42b2a8de03a27875
	.xword	0x0c21b59cab671a86
	.xword	0x04302daea2ae9c46
	.xword	0xa82b4079c0a87c5b
	.xword	0xd17934d34cc01b6e
	.xword	0x7a3d5ca6b1c3a1e2
	.xword	0x7dbc812686f6dbde
	.xword	0x23da57d29a5af713
	.xword	0x01174a53c7aa2b47
	.xword	0xc367fdf45dd095da
	.xword	0xe662ae1a3f29d550
	.xword	0xeb10d076f8e38d30
	.xword	0x0d30b1f88a025f25
	.xword	0xc7148d6f309bc739
	.xword	0xc0f6b62fbd64cf08
	.xword	0x82fc1c58ccb8ead0
	.xword	0x8ac94d92839ffd4b
	.xword	0xd4e098e565b8ec27
	.xword	0xab9cab6deb342b48
	.xword	0xda53db965a0249bd
	.xword	0x78ff377fad8d5a34
	.xword	0x69b3d6bacb11fff7
	.xword	0xc366e7bd3ef9d512
	.xword	0x070fcee27e14508e
	.xword	0xa814212a0ed28366
	.xword	0xf3fa5973e2a7113a
	.xword	0x720337421e1a18f8
	.xword	0x56868ba115719a12
	.xword	0xd815ececcd074a93
	.xword	0xfa8e25e531d71c84
	.xword	0x4bf1b03827373447
	.xword	0x10f0d923ed9dfa53
	.xword	0xb2c1c38e228f1b60
	.xword	0x83c6657c965b6124
	.xword	0xb834389f2a768509
	.xword	0xb43b40c9082b7e4a
	.xword	0x9b803ef9b8006abf
	.xword	0x60044330868bff79
	.xword	0x80599f4278cfaf5a
	.xword	0x77464df85ae69191
	.xword	0x29ab20d958bfa1dc
	.xword	0xe17d2f47aa40d8b7
	.xword	0xf1512b69c3dbe70a
	.xword	0xef8113468389ef97
	.xword	0xaa85654bd4e1e76d
	.xword	0x14bc45dfa5807614
	.xword	0xad7637f30353797f
	.xword	0xc85dfadbbc9f9baf
	.xword	0xa492c3587fbdb9c3
	.xword	0x56d3c0d962274071
	.xword	0x81a4efcb527da783
	.xword	0xcc1cd274ff68aa9d
	.xword	0xac390bfac94991f4
	.xword	0xdee7384110b91fe0
	.xword	0x132068bb71624980
	.xword	0xbf6ecfb9728114e3
	.xword	0x1c476b3a01b9eaae
	.xword	0x36c264fbb307eb8b
	.xword	0xb3535596aa36e8c7
	.xword	0xaa114d81c0bf9e43
	.xword	0x7246d733235ad9a1
	.xword	0x81aafdc53b6ccdcc
	.xword	0xe586e69a02b9701c
	.xword	0xd5f2c89bd6d8a3bc
	.xword	0x29fa7d0b271fdf12
	.xword	0x96ec02b3237f3704
	.xword	0xa8c3a14068cc7bc4
	.xword	0xd5703c1bc96be529
	.xword	0xef458b8ba52a987e
	.xword	0xf39e36714567f82a
	.xword	0x8db6e859ae037ced
	.xword	0xbe2a490deedd6dd7
	.xword	0xac7f0fa345e1d057
	.xword	0x2cdd776c1ba8067a
	.xword	0x2a7544ee52fc2129
	.xword	0x8e88622a1234f414
	.xword	0x9b01d66763c8460b
	.xword	0x957228001e61a1b6
	.xword	0x41b744dbbd9dd309
	.xword	0x41b6b3d91c181937
	.xword	0xdb001c601575cf65
	.xword	0x89a2b4e4e13d7bf7
	.xword	0xfa45bc827ae4393d
	.xword	0x82b0bfcaf200965a
	.xword	0x6678e44b5f88f069
	.xword	0x30916a2b2b9df2b1
	.xword	0xc2e723e0f47d5d8c
	.xword	0x3a01a6b8ce2a8f0b
	.xword	0x5fffd6da7942dac6
	.xword	0xdde8e40f0c6f2cbf
	.xword	0x6fee86d815c9be56
	.xword	0x1821c2651e84418a
	.xword	0xdd4e231c23ffbd02
	.xword	0x5cb6057b3cd09498
	.xword	0x736f2b306940865a
	.xword	0xe7bca1c3aeab77f6
	.xword	0x781fde582afbe331
	.xword	0xd9189ff8ee31c0d3
	.xword	0x6c571362432178e1
	.xword	0xaef0b356cde10e94
	.xword	0xc2028bfae431d8ff
	.xword	0x39ee4a640d77901c
	.xword	0x4499727bdad9dacd
	.xword	0xda5b4de39ad5e805
	.xword	0xc01fecf8c8c2b41e
	.xword	0xfd444259be51200a
	.xword	0xe1ea2ce4ddd6a234
	.xword	0xdd6ec98f13338533
	.xword	0xa73066108880b6e1
	.xword	0x799c148f232456cd
	.xword	0xf26699ef9538486a
	.xword	0x144c94e4bcfa9777
	.xword	0xc658771867beac80
	.xword	0x230cfb4c19d5df44
	.xword	0xfdc3d4aafe9c881e
	.xword	0x0e5b4e864220f782
	.xword	0xc00f6166ce7efbd5
	.xword	0xf51b157c5281859f
	.xword	0x6b5d4cbc6ae37291
	.xword	0xbb47e05ee6edaf8d
	.xword	0x22c6a3c8f4f388f1
	.xword	0x2fa1c3bc1aa9e93d
	.xword	0xcbcce76cd6133a66
	.xword	0x6d148c8ba75ad5e9
	.xword	0x37895863cb35f50d
	.xword	0x52586e60f91d8dc0
	.xword	0x7916259e363d179f
	.xword	0xfe6708513d2cc28d
	.xword	0xd496e5f88eb1415c
	.xword	0x94b51a3fc7b90897
	.xword	0x933a7850c1e987b4
	.xword	0x596cf84cf006cb2a
	.xword	0xdd2cc0bc2d072b1b
	.xword	0x9da0a210cfc15339
	.xword	0xbefbb0df303fc76d
	.xword	0xe7f47c5056c2e476
	.xword	0x9f5b3b1df69090c1
	.xword	0x04413bf32e2b3982
	.xword	0x4c8fa6e3ed15b32a
	.xword	0x37a8b4d5fc4bfb0e
	.xword	0x68e915355ef38eea
	.xword	0xe48209585c9b3172
	.xword	0x9f32488a581ee34c
	.xword	0xec1a5ac6171888e6
	.xword	0xb41a7b0db7df3f29
	.xword	0x51b90f375c524718
	.xword	0x6a00e7d959d691ac
	.xword	0x41a9c0c4d074f28f
	.xword	0x0d29c1e9bfbf7a85
	.xword	0x0b1c97b00692ec0b
	.xword	0x20ba4ad3c669db82
	.xword	0x86f536b70317215d
	.xword	0x063f4688ce017b3c
	.xword	0xf8f37d5f8bbf9883
	.xword	0x858b2da2f9d2e0ae
	.xword	0x95f5873a2a685173
	.xword	0x1be79e20e3a1969a
	.xword	0x3842fb7e8ace5b46
	.xword	0x5c83c03f067c3fd0
	.xword	0x0cf068b56fd136f5
	.xword	0x232d77c9ff0750e1
	.xword	0x8cda5faffd2cec7e
	.xword	0xefa9fe48de55f1d3
	.xword	0x3136e90cedf6638e
	.xword	0xc35142bf6cc9b4a3
	.xword	0x1ed2fbd6e0b155df
	.xword	0x5c5207f30490c77e
	.xword	0xb036de56efcfc098
	.xword	0x022c485357d68af5
	.xword	0x47ac2b082590f69c
	.xword	0x29cd115756d40feb
	.xword	0x7233c1154a63c3ac
	.xword	0x6964e75015e9b6a9



SECTION .ISEG_4 DATA_VA = 0x0000000040100000
attr_data {
	Name	 = .ISEG_4,
	RA	 = 0x0000000040100000,
	PA	 = ra2pa(0x0000000040100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x261ffd7738fae747
	.xword	0x01d1e4dac233a70a
	.xword	0x5f8a9bc6ed59ffdc
	.xword	0x2e6c54454ae08435
	.xword	0xa54380503f95d84b
	.xword	0x772dfe2c7209ebbe
	.xword	0x76e0f16c111c1bee
	.xword	0x773ca3e7bf30dc26
	.xword	0x755e3b4366bbcb57
	.xword	0x73c60e85da9bfde4
	.xword	0xe4ebec0357a45c59
	.xword	0xc465e96b3e270dfa
	.xword	0x3726f7181b193fa9
	.xword	0xde4c4402b99ee875
	.xword	0x559c43a7bd697659
	.xword	0xc480f8de4751702e
	.xword	0xb4671884367366e1
	.xword	0x65dbe9fceb165954
	.xword	0xe4ed5e5a5a310cd8
	.xword	0x98c03516589ff0b6
	.xword	0xa763b375b5e2158d
	.xword	0x0b03bd6ea5ea2197
	.xword	0xf0f47fff16265c18
	.xword	0x72e0f270a1ee5cf2
	.xword	0x0cdafa15451d10e8
	.xword	0xbe4054fbd6ecac49
	.xword	0x620e5d653d10a02b
	.xword	0x6b11c40800e7c5b9
	.xword	0xcc1142a47c0e1ac9
	.xword	0xe3c051c0d78dfd87
	.xword	0xc14648e95bd04e70
	.xword	0x19ea362af22a5054
	.xword	0x8011715105f54384
	.xword	0x6c5ea647cb76a19a
	.xword	0xd34994e651eed629
	.xword	0x76b8b1a7ba4114df
	.xword	0xd7afc8427b569189
	.xword	0xc7bf64d23fa9a799
	.xword	0xdd50824557a7a206
	.xword	0xe9d24caf0f67bad5
	.xword	0x0f95ead6d4e4d9ce
	.xword	0x248660ef3418c1bf
	.xword	0xe5c846ad52e6e578
	.xword	0x301b0ed49decd7cf
	.xword	0xd1ac81d06b64b8c7
	.xword	0xb12899d31ebf1d78
	.xword	0xae69b3e241b778f0
	.xword	0x5f1b10f5b347b9b8
	.xword	0x99f6f35586921676
	.xword	0xd02ca8ccb61dc9d8
	.xword	0x0d01b88767d3d83f
	.xword	0x6bd5f18275525ff9
	.xword	0x371122f5075aab00
	.xword	0x206cdb12020b05b6
	.xword	0x954fcaa09a1996b6
	.xword	0x6bdf3598f82cc585
	.xword	0x4999f18c0f76b8cb
	.xword	0x4658fabb336f2dcd
	.xword	0x40f98a4d6b460d73
	.xword	0x9d1d991a68d85fe4
	.xword	0x2a8e0f6cfe2de88f
	.xword	0x25cf2280229b6614
	.xword	0x5fb4d5f5c7a8a3c5
	.xword	0xeda12f11e17d267b
	.xword	0x1e5405129f636e04
	.xword	0x9b4a4f04b45612b5
	.xword	0x7d5c7914c649ea9c
	.xword	0x6c2fab5211ce8985
	.xword	0xa441c0565c098640
	.xword	0xaadf9ba14677faba
	.xword	0x65bd0c1527aa6d8a
	.xword	0x445c92dde672ef08
	.xword	0x8ffe79044a4f8ef2
	.xword	0x1130b2c677c8aa79
	.xword	0x5cd34b1e5aadf5ac
	.xword	0x7aad34547753d341
	.xword	0x050db3477b7af245
	.xword	0x41bc6cb1d3f8c5af
	.xword	0x6f5dbbf91b49d581
	.xword	0x95f141954e685eed
	.xword	0x991625ce29790439
	.xword	0x0407b0c96fc94b6f
	.xword	0x1805b9f88e0b2b29
	.xword	0xfb3d3fe546b83cf2
	.xword	0x8b6dfd5c604d5b8b
	.xword	0x39948a529795b756
	.xword	0x01ecdc01982e03f8
	.xword	0xcd0525f2d9933701
	.xword	0xd6241f26a8bf72dc
	.xword	0x7553189985549d5c
	.xword	0x4e236bb3ba776223
	.xword	0x32f264c63bb66cf1
	.xword	0x11f493b22ab8a5c0
	.xword	0x59ef94a5472a1e8c
	.xword	0x577918bc77dfaf35
	.xword	0xdc2bdad971e1d2d0
	.xword	0x8e8ce751a626bb05
	.xword	0x703defefa6661c9d
	.xword	0xd7829f7be3e8a3c5
	.xword	0xccd327692d14178e
	.xword	0x318dd0f1431e7adc
	.xword	0xbb6e1b7c078487f8
	.xword	0x4b42323278c017ba
	.xword	0xc119fdf5712f35da
	.xword	0xd88e62570962c2c0
	.xword	0xc9dbbd99cb9a9f6c
	.xword	0xaa0dc7d5b34e947b
	.xword	0x371cd20deffba9c0
	.xword	0x1c18daef7501eb4f
	.xword	0x1753baa982c296b1
	.xword	0x287dafc33862353b
	.xword	0x68c5d53bf385a485
	.xword	0x4cc25074584b6ec0
	.xword	0x71f00c27cc78c6d1
	.xword	0x61bce56a54b74455
	.xword	0x942c06c850078774
	.xword	0x54ec133d86b3cd3c
	.xword	0x77595c14ad3c1981
	.xword	0x53a365925a7e4db2
	.xword	0x7a37cf13797a94be
	.xword	0xb13ee98848ea6b8a
	.xword	0x433a2799682c6474
	.xword	0x222eac9deae18af9
	.xword	0xc7871551dfe354b2
	.xword	0xfdd8aa10d27b3269
	.xword	0xbc55d3492d33aa08
	.xword	0xf863d47cb3dd7ab5
	.xword	0xe8aaa565977f0f68
	.xword	0xc52eb670a158e869
	.xword	0x4de242fa34fd3946
	.xword	0x68ff9cb8c6752efe
	.xword	0xb28eb3c0f441a52f
	.xword	0x8b6f7dc2071b12c3
	.xword	0xc4e42141b5f62bb3
	.xword	0x0e6779b88692b33d
	.xword	0x64977f74564f629d
	.xword	0xc4c6276428e8da89
	.xword	0xc4aad046dc484887
	.xword	0x7708ecdc0dad8936
	.xword	0x64ac72a8d0102403
	.xword	0x921c9f76fbc4942a
	.xword	0x18edcf51980a388b
	.xword	0xd6535e7fab0baf19
	.xword	0xb1f728cdb68b589e
	.xword	0x2cdc13ea4002c563
	.xword	0x1dfcc3317bf62a21
	.xword	0xb90dc6ce4ffb9eae
	.xword	0xe9525f7220ecf00d
	.xword	0x7a4af6ce564f7da2
	.xword	0x72d88991608111da
	.xword	0x6c5a8504461558fc
	.xword	0xcdf0831b91a2de2d
	.xword	0x47d829435d4bfe22
	.xword	0x152c98bbd6c67991
	.xword	0x44aa3f18e0daaeae
	.xword	0x3e2a90921c8c3232
	.xword	0x4a20f66ac7eb448c
	.xword	0xdc76f56f2565f218
	.xword	0xb0a029657f99a25a
	.xword	0x0f8a3f691518dbb4
	.xword	0x73ad050f644d5f1b
	.xword	0x5c7765792495a6ec
	.xword	0x495d2f9e978f224d
	.xword	0x434f5db8c9b05b1f
	.xword	0xba5dfe9064f333af
	.xword	0x87cf7bb2282740cf
	.xword	0x9dcca8fbb0ef6318
	.xword	0x20399e7a482704ab
	.xword	0x6120a110826cf296
	.xword	0x0dd98483b7a9b1af
	.xword	0xf96eae01bf2a7e0f
	.xword	0x91b32aeec2149b49
	.xword	0x59e91f51772792c4
	.xword	0xea2036da8acfe6f1
	.xword	0xebce8156b9be056a
	.xword	0x7d91d135e687e4ff
	.xword	0x41647a83a1ac5a1b
	.xword	0xb5c950c414836dda
	.xword	0x06b59b0e35af02f3
	.xword	0x880a30edc99bbe2f
	.xword	0x936cc5d33d6477c6
	.xword	0xc506c5834526854d
	.xword	0x6ac894ac6d0bdbc1
	.xword	0x7f59e675822be8d8
	.xword	0x57bfc92087cceca0
	.xword	0xe8be20ea11ee500f
	.xword	0x026795a3ff424a6f
	.xword	0xdc0dcf0e2ab63cbf
	.xword	0x7368996f9120db61
	.xword	0xbd5bc2289d75a11e
	.xword	0xb5b73b9e4f00c29b
	.xword	0x79292feb7cbe3ae4
	.xword	0xb4de8567bddf17f9
	.xword	0x6cd2ba5f465fe45f
	.xword	0x72790e1a2932c78b
	.xword	0x53965403390854f0
	.xword	0x90e3d9bc2fe01cd3
	.xword	0xae0e27299ab40247
	.xword	0xf1f35314f87d44d8
	.xword	0x98b552b8a39ed73e
	.xword	0x05e11c1304f9eefb
	.xword	0xf4f80a23240ab0dc
	.xword	0x5d986c3c93e3dc13
	.xword	0x6b4c075ce84c41cc
	.xword	0xf54be644a390f8ef
	.xword	0xdcc885d97405db51
	.xword	0xd903e323833c5b0f
	.xword	0x55598384c9f0d8f4
	.xword	0x29d0a53014da860b
	.xword	0x83b1a2cd59b4dda4
	.xword	0xd7884a0329c27c3f
	.xword	0x206c75de4ef3c807
	.xword	0xdceb27c37147a88d
	.xword	0x63494d3ea73403a3
	.xword	0x9822c38d20c223e5
	.xword	0x2991400ae54a96aa
	.xword	0xbf380b12ccd00014
	.xword	0x247e8316c69496d4
	.xword	0x5a5663b5b1849337
	.xword	0x715bef22e5add640
	.xword	0x622a935a53696d45
	.xword	0x62fd764a79fc8b64
	.xword	0xce050fe0de1b6532
	.xword	0x73e7f2916cd79f51
	.xword	0x51f76ca5951eb7de
	.xword	0xd567f857b1ae7787
	.xword	0x9c90f1c953ee41ff
	.xword	0xb0df41873dc0f1c3
	.xword	0x26774f1c0866ede8
	.xword	0xbbbd6a5621e18e95
	.xword	0xee686bda60a75a7f
	.xword	0x11973234239639f6
	.xword	0x7efb2e99b3e73743
	.xword	0xd595e6ffd2b1c649
	.xword	0xb3c83cecfb493fa8
	.xword	0xc6329e3fcf882d5f
	.xword	0x0be31c836f428d3e
	.xword	0xe8ab03fe0a179f6b
	.xword	0xe862f4a673be7cee
	.xword	0x344d4a265eccab6d
	.xword	0x9cec489e329a8c55
	.xword	0x929b9817ede16510
	.xword	0xbae34f06475cb3fe
	.xword	0xf66db5502f74fe9c
	.xword	0x9d68a548cd78cd94
	.xword	0x043a7d096d90cefb
	.xword	0xda3fd3581aa1dec0
	.xword	0x8577cba39b99ceea
	.xword	0xa57c3ad059b6888b
	.xword	0x9d169c3ef294fdd8
	.xword	0x5a308f6acb17df55
	.xword	0xbf6955c1b8ae93d1
	.xword	0x645313102cc04ae5
	.xword	0x64e70ec2ed38b6c3
	.xword	0x4f52e83c0db341e6
	.xword	0x0be8a2b38498d345



SECTION .ISEG_5 DATA_VA = 0x0000000050100000
attr_data {
	Name	 = .ISEG_5,
	RA	 = 0x0000000050100000,
	PA	 = ra2pa(0x0000000050100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x39d32ca086409c84
	.xword	0xebef4e315118b8d0
	.xword	0xde0429f34c74b923
	.xword	0xfbbb3d6f2ed851dd
	.xword	0x39d59a1ecb8d9c06
	.xword	0x7688f94431c34b25
	.xword	0x40788ba90c6cd67b
	.xword	0xc5f80a2b5d47e2c9
	.xword	0x758583cfdad40c81
	.xword	0xb23803c9184144d1
	.xword	0x3cd54974ae7fbe15
	.xword	0x101fb7e1141cac3c
	.xword	0xe19cc4a5bd79f774
	.xword	0xd0f46a66d76adcfb
	.xword	0x595b11876c43e049
	.xword	0xbed8ea43dbe7e150
	.xword	0xf1e125a867845b48
	.xword	0xf852d87304b07c47
	.xword	0x67213b975fda7b5c
	.xword	0xa98cea0df75d8392
	.xword	0x5ca16df0d26f4433
	.xword	0x36b4bb20d53587dc
	.xword	0xb72f6d52b3f84e56
	.xword	0x2344f02b2880f459
	.xword	0xcc2af12a2a5b9e3b
	.xword	0xbc3994bc241af7b8
	.xword	0xbe30feeeedc4fb63
	.xword	0x290fa7e16e5a8272
	.xword	0xeb3d2cdce87d7459
	.xword	0xfd59c66cf6019268
	.xword	0xb2b38cdf9421fde0
	.xword	0xbbf9b989e6dd5bcc
	.xword	0xde2441956473d2eb
	.xword	0xbbc1b0e9d3abc83c
	.xword	0xc21ddac4c16ed4e1
	.xword	0xdee022b04fee8e54
	.xword	0x375ff62ee4ff5e72
	.xword	0xf445a60d8bc93155
	.xword	0x7edb0216c0888a65
	.xword	0xb4bc0d84407b4748
	.xword	0x80824d6159d19ec4
	.xword	0xa8ef47b2828a17c7
	.xword	0x689d8407498bd1c0
	.xword	0x5bba3fbc6fde87e5
	.xword	0x534382c2d094f96b
	.xword	0x9dbbbca202ef443d
	.xword	0xf6c4d9a015ce6aef
	.xword	0x8d7cdde9c9c02d71
	.xword	0x683c99d05e0c2507
	.xword	0x9daefa7c0da7c8ed
	.xword	0x0d99b0141c5c63b3
	.xword	0x18bdbef0c2629488
	.xword	0x2a3fe6d93179f2ce
	.xword	0xd8853ddb2ba49b00
	.xword	0x6f2e49e3fa0db583
	.xword	0xfa5daa9069796411
	.xword	0xfafa34efc8fe770e
	.xword	0xf453d25fa7912cb3
	.xword	0xe02c640e4da0e324
	.xword	0x09dff86e8feb1e5c
	.xword	0xd0f88493633568e3
	.xword	0xc3dbebcd52e69872
	.xword	0x15fddbd86ba2d3a9
	.xword	0x57f8ae1f284c95e8
	.xword	0xc07ffc6ea7dd14ca
	.xword	0x6928f881434c02d0
	.xword	0xde7d3c67d94d996b
	.xword	0xaf6c499a7474e4d4
	.xword	0x444383ce768c0ca4
	.xword	0x6b453c9dd26bda2d
	.xword	0x66c9c04484c74bcb
	.xword	0x8266f36aba6938c4
	.xword	0x693dce3ee580c849
	.xword	0x175262e07b00e5bd
	.xword	0x5ff5f90e625b6f36
	.xword	0x4653bbeed0cc6195
	.xword	0x6d1bd013f3c9e185
	.xword	0x06fe16725c2ba3f8
	.xword	0xb56a39bf3de166e9
	.xword	0xbc2b41f75e1a2242
	.xword	0xf594e5dbb006a8ab
	.xword	0xbcba3a92d952c4fd
	.xword	0x590481ca84527523
	.xword	0xbd3741446f7d0d6f
	.xword	0x3b3186a55e4958d3
	.xword	0xfd13bd5b1dcce19b
	.xword	0x00c024ce8cc9c907
	.xword	0xec174b945c84ceb8
	.xword	0x703347e8535eeb82
	.xword	0xbab73ca9e33c9acc
	.xword	0x7ae3ec2d110e55a3
	.xword	0x51d3813997b159c9
	.xword	0x3a9d19c7105172db
	.xword	0x5b627784cd4d48b0
	.xword	0x760389638403c80b
	.xword	0x28e24f5acd177895
	.xword	0x0459034a8d786546
	.xword	0x4124de70076d887f
	.xword	0x5431d897bcd14063
	.xword	0x94108a6ba49516f9
	.xword	0x362e30b16bd6bf8f
	.xword	0x542df42c5659c83e
	.xword	0xff95e8b3640bef0e
	.xword	0x34ea3db747c2ca78
	.xword	0x47bf3b647566bf47
	.xword	0xe3da50c22179dea2
	.xword	0xf877ceb4eb33051c
	.xword	0x2cd6a8ceb3acabd9
	.xword	0x64155c5d3a450954
	.xword	0x68cf755b80146990
	.xword	0xb9cc5d7a58613835
	.xword	0x2193532685562d13
	.xword	0x3d500685c0ec67d6
	.xword	0x90a5f3c9f36e2277
	.xword	0x451d8e914ab6a228
	.xword	0x160e72934eee080a
	.xword	0x16827216d0ede166
	.xword	0x308a2355eb61ff5b
	.xword	0x33d4fabf79a52225
	.xword	0x0284aeada04f8722
	.xword	0xcd6e538d2df874fa
	.xword	0x84d2ee950e379d6a
	.xword	0x664a1d6e0e3ea7fa
	.xword	0xeace2bbbe90c6424
	.xword	0xb2bcc9ee983547d3
	.xword	0xfc05c57a20744459
	.xword	0x6667dd9c05817adb
	.xword	0x423b52e6c91d14cc
	.xword	0x2a6b4ed454f75dfb
	.xword	0x1b5e53db200b4e54
	.xword	0xf0505df3261c3192
	.xword	0xcdf180830eca3c93
	.xword	0x5c719597a9a2098f
	.xword	0x3b847dd0966eb857
	.xword	0x7865550c66855018
	.xword	0x59e61e8c64857892
	.xword	0xdcafbcffa3d9941b
	.xword	0xe60ee9d486f09ad3
	.xword	0x669be658e9ec7ab8
	.xword	0x760c5b481e946f7e
	.xword	0x6b7bbfa812e3d28f
	.xword	0x8afd587a1c3026ef
	.xword	0x13bfbbf151c47e28
	.xword	0x3d614f61235e5d20
	.xword	0xcca166e734d3c40a
	.xword	0x8abc86e29f526d1c
	.xword	0xdd5f4e7e36643528
	.xword	0x6e11da5ea152bd0b
	.xword	0xa525160a4f803311
	.xword	0xacc6062138ccaf06
	.xword	0xe6aa7ca8d2fe4c1b
	.xword	0x0a30935f22c0f436
	.xword	0x85a658104f37f3b9
	.xword	0x1f26df1d37061b58
	.xword	0xce0171fe969db2d2
	.xword	0x2db1de00ac55779f
	.xword	0x7a28f62f9cd8a51e
	.xword	0x9a8f89a4271e2a06
	.xword	0xde5e72754ff88e32
	.xword	0x3da3871fa339df9d
	.xword	0xbafa26084e9efaa7
	.xword	0x077018afe17b1582
	.xword	0x6767d60147db701c
	.xword	0x6f16430798a3f4ba
	.xword	0xded02349d085d841
	.xword	0x7bdfbc8dc6953e8f
	.xword	0x2f6bf2717a1cdf83
	.xword	0xbd0e9d825929a345
	.xword	0x6980c3636b1ec64d
	.xword	0x46d4c51cba5014b4
	.xword	0xe9c51ba6bff40414
	.xword	0x91936cc6c287adeb
	.xword	0xb80e8df3f1a696cd
	.xword	0x7b7a347737e17546
	.xword	0xe8550e5daf0cf6e2
	.xword	0xf1fc02f1774719b1
	.xword	0x782faf863d8ff098
	.xword	0xa8a4ba764df06af9
	.xword	0xd70806a2b2d0af0d
	.xword	0xba42d610d225810c
	.xword	0xa4c76ef671aa92e9
	.xword	0xbaca4e1cff1c867c
	.xword	0x1ff82dc3a1f8b18d
	.xword	0xe197a30f2efe23aa
	.xword	0xff5832a34b5af1c6
	.xword	0x4a7f45de7abf82d3
	.xword	0xfb74862f1eabf735
	.xword	0xe34ab8d6aedd88f7
	.xword	0xc006aa8b0a9a42f8
	.xword	0x56a2b567c73a54dc
	.xword	0x7aa65669cfa03ece
	.xword	0xe410fcbe34020202
	.xword	0x2aeb7b0e6d634bcd
	.xword	0x44d5f57b1dc91265
	.xword	0xb0a6e395d5297d78
	.xword	0xa94918aca13b7dfb
	.xword	0x7c072774df38ba6a
	.xword	0xddb27ea4f725b215
	.xword	0x87a39a3b1ba9455a
	.xword	0x2762e3ae9c137c5d
	.xword	0x6bc8a079c586979d
	.xword	0xb783fedf1c8ddbbe
	.xword	0x220bdcfe03662c51
	.xword	0x6ee4e7ad156caca7
	.xword	0x83a8f3576dcb3bc6
	.xword	0x5e84219dfcb47c1a
	.xword	0xce05ca89f12d1382
	.xword	0x7a0222a7eb6f13ee
	.xword	0xeb2171fff02166dc
	.xword	0x6e2f468234e16df7
	.xword	0x43bd2fead3943547
	.xword	0xae2b7af02a089afa
	.xword	0xceeeaac0c95d2efd
	.xword	0x66e1646e47e4fa72
	.xword	0x91d442e51e12121c
	.xword	0x6ddb2296b4950ae4
	.xword	0x8e454547e98189e8
	.xword	0x744f62c5959b39eb
	.xword	0x16031d9b8e4459f5
	.xword	0x398a61015b63a55d
	.xword	0xbbad5ef732d76424
	.xword	0xb744dac51e60359e
	.xword	0x14c0549cd4e0d80f
	.xword	0x5408e5873331085b
	.xword	0x340b117cb0a6d1ef
	.xword	0x2f7cb6fd805c4ab6
	.xword	0x67647dba3c2badb7
	.xword	0x498c0e2f5b1b6c17
	.xword	0xc3b6b02407e51dac
	.xword	0x0b621f4a2f03949b
	.xword	0xccda12d88c98920d
	.xword	0x6aa0341a0f9861c2
	.xword	0x7bbd886669c51c75
	.xword	0x76aacc7907685aba
	.xword	0xcdc832e1d637c0bb
	.xword	0xbfef1d5420f83c8b
	.xword	0xfe0b6a4e61155f65
	.xword	0x22e39427daf2d00c
	.xword	0x472ad74892843ce3
	.xword	0x85e95787e7a2e7b8
	.xword	0x6a4e9d5f757d3722
	.xword	0xf5262eb51bf65d6c
	.xword	0x68ccfa33fe15c46c
	.xword	0x3bf8e06dbff82bf6
	.xword	0x39ed398966a81717
	.xword	0xcf02c793267399f6
	.xword	0xae19ade7f87ce54a
	.xword	0xc69049fc825fecc6
	.xword	0x319f0b151a1450fb
	.xword	0xe56142b28268d954
	.xword	0x960bacdeb2151648
	.xword	0x1c760c0da0232ae4
	.xword	0xc87f67143411ec6d
	.xword	0x5617dc47cf69af96
	.xword	0x6d4fac7e952636a7
	.xword	0x042289510b7a6428



SECTION .ISEG_6 DATA_VA = 0x0000000060100000
attr_data {
	Name	 = .ISEG_6,
	RA	 = 0x0000000060100000,
	PA	 = ra2pa(0x0000000060100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x318c8c74ca2f5c7d
	.xword	0x88aa101ffa858fec
	.xword	0x45d13a209f0a855e
	.xword	0x5298b8a106593d8e
	.xword	0x840c8e7eb78dbee1
	.xword	0xbe401dc574230cc7
	.xword	0xe587e3d06f5cfbfe
	.xword	0x5102a5904c7b50b6
	.xword	0x62ecbe841c2a09fa
	.xword	0xcef999e387551f72
	.xword	0x66b1f9cbc110f821
	.xword	0x937ffbd3e7e27a86
	.xword	0x203d4197b6939a74
	.xword	0x7212c13723526582
	.xword	0xa028842eb98754ff
	.xword	0x02e98da0ec7d5d1b
	.xword	0xbce4b47db53e19b1
	.xword	0x1a56f5f088602f81
	.xword	0xade6bc18726492a2
	.xword	0x66751b148703bb5f
	.xword	0x4b3fd84f2eaac955
	.xword	0xad37adc8f91094ce
	.xword	0x22936deaae4eb6d4
	.xword	0x1155d48bd53ff8d4
	.xword	0xe303ff04571553eb
	.xword	0x842233b0a0bd5ee2
	.xword	0x5ca10d364930192a
	.xword	0x697299e23b8b0b06
	.xword	0xe9f14d7fb002a965
	.xword	0xa6b4d0635c138d06
	.xword	0x2c910f9662585582
	.xword	0x92b0d5487d8b2eda
	.xword	0x5e18ae9a2873d3a9
	.xword	0x321956aaabb4faa4
	.xword	0xbb040debc7ed4bc8
	.xword	0x7687d9368ee24d57
	.xword	0x55752f625fe6474a
	.xword	0x24d15f8185d065af
	.xword	0x73cded031f89bd13
	.xword	0x23db3bd30ee366a0
	.xword	0xc02a09d2b5b07ca4
	.xword	0xebbc22477dbb52c7
	.xword	0xd988664dc5640930
	.xword	0x07eba26648c8cb3e
	.xword	0x5570009ac1f9bca3
	.xword	0x557179599863caec
	.xword	0x64bf6a7efc4a282d
	.xword	0x52f2fe34a88e9faa
	.xword	0x977d6036ba2b13df
	.xword	0x0970016f94e244a8
	.xword	0x9da720af7a1291ac
	.xword	0x0592cbce5c24372f
	.xword	0x546cb10ea4201bc9
	.xword	0xc2cad143568a531f
	.xword	0x05e8fd0c70cc777a
	.xword	0x58097eb5cb51ec4c
	.xword	0x176f02c474a25490
	.xword	0xe2f2e89008995821
	.xword	0xbf547bea0bb455c4
	.xword	0xc7d68c4209a9f595
	.xword	0x809d84b31700b9aa
	.xword	0x6eb863cf41214363
	.xword	0xb097b2055020c81f
	.xword	0x874c53a610ab73ff
	.xword	0x85c21ea751e120e3
	.xword	0x4c15b09d00c47703
	.xword	0x54e7a097c02c9650
	.xword	0x582d6c0c6745d1f7
	.xword	0xaf9446b1626e832d
	.xword	0xdf0a065b0ee093a3
	.xword	0x51a2c36f1d886737
	.xword	0xc6a6b2697062503e
	.xword	0x28c3af35cb82ef18
	.xword	0x91099c4902d3e05a
	.xword	0x566c23fdc05e946d
	.xword	0x458a961c438c627d
	.xword	0xed6709a73dc57e30
	.xword	0x9969d60ecb85cb1a
	.xword	0xce260394dd443e48
	.xword	0x50ebbb9ee123f262
	.xword	0x96b513e15a18f4a3
	.xword	0xabe560098191f110
	.xword	0xb47f99c8b843d6ff
	.xword	0x130ddfc30749c9f6
	.xword	0x55336b4a446f14e0
	.xword	0x1edc02cf6de66135
	.xword	0x98bbb3a79ebf5674
	.xword	0xddcc5a0d912a0973
	.xword	0x21c88a738b2a0f80
	.xword	0x2c75f305ee67d8db
	.xword	0x4a113f0b9320728c
	.xword	0xc61eb0ead2142fa4
	.xword	0x6eb41c6317f56fd2
	.xword	0x36696fdfebade410
	.xword	0xcf32d3a617a73141
	.xword	0x2833efddb518a516
	.xword	0x9f097f84584bdc96
	.xword	0x7becc2f0cf8f045c
	.xword	0x8398b981db81790c
	.xword	0xace52c9da411f5b6
	.xword	0x9ccd6352ac994bed
	.xword	0xefec4e63785416ea
	.xword	0x2aefa3a4b59d8962
	.xword	0x9d4d21ba8ba7feaa
	.xword	0xf1f7605dec624e36
	.xword	0x7f41b380ef4d7b3a
	.xword	0x1f7d171c3aa55eb2
	.xword	0x3886e8fbbada0580
	.xword	0x0c65bbe4074858c3
	.xword	0xde9aacbba92924c8
	.xword	0x525bf14300522dea
	.xword	0x81c987ca3a939532
	.xword	0x4178101db332d5f4
	.xword	0xf089307eee821fb4
	.xword	0x8c4f49997bb17a69
	.xword	0xe92c6109e31fc0b2
	.xword	0xa52d99c8efcf8ea3
	.xword	0x2460cf4362470c39
	.xword	0x3c9146f646ba69ca
	.xword	0x6f2d3fcb5416bad6
	.xword	0x6bc7d27ab7d60c94
	.xword	0x45387d590daab71b
	.xword	0x98af5b3d2a325971
	.xword	0xfe5d88667a9b581c
	.xword	0xe9303534dffe6da1
	.xword	0xb8b367161fc9c09b
	.xword	0x0f53172489846cfe
	.xword	0xb53e17e72d903ca0
	.xword	0x04d1d60f7b4603f9
	.xword	0x9a2f9f0d99c91e98
	.xword	0xe82db6405352cf16
	.xword	0x171a6a242e3810e1
	.xword	0xfe5c4531a7934cdc
	.xword	0x44aed38bd6d3d748
	.xword	0xd43bc5f87e27cf30
	.xword	0xab0ed323a4cc5d57
	.xword	0x7ea09ec025b43b8c
	.xword	0x40715b5a57447afc
	.xword	0xa253dc9df1b31fc3
	.xword	0xfeeb51afe28f6f7d
	.xword	0xfb1186a09d9963b2
	.xword	0x9504c14e0fdc4463
	.xword	0x6873809cda57cb1f
	.xword	0xfd1fed589c131aba
	.xword	0x19e8241dc1ac3d44
	.xword	0x4ba009f27323a85b
	.xword	0xfa3011edab501ae7
	.xword	0x7cff70d131679890
	.xword	0x0cdd103fef0a526d
	.xword	0x031b5f642ddae2d3
	.xword	0xae52d4766c29ed17
	.xword	0xfc1b32d25dabe027
	.xword	0x973e3e68b2c08a58
	.xword	0xcd8fb7809e2b6b6f
	.xword	0xb30f9d868cd80fc2
	.xword	0x67a95bf687caf619
	.xword	0x58982a555b15977b
	.xword	0xaf0d31ce5d37c31c
	.xword	0x4c5a6d9e2d73dddd
	.xword	0x9409f14f2045fa54
	.xword	0x0b76080ed47d7ed8
	.xword	0xa6ed84436457d767
	.xword	0x72a2e7e9648b5634
	.xword	0x4793cf7206bd43c9
	.xword	0x65054e351acda84f
	.xword	0x42079185c4e00673
	.xword	0x9f42144325f3578c
	.xword	0x7607469de08ff1d2
	.xword	0xba52dd10abee5832
	.xword	0x3734369bb822514c
	.xword	0x93dd6b21a3f6d156
	.xword	0xf011d7829b95c140
	.xword	0xc1f10df796d838b2
	.xword	0x1ddd8d8c4854a5d9
	.xword	0x3405880e74f61665
	.xword	0x8668afa4b44012d0
	.xword	0x70b617e3b4dd654e
	.xword	0xea85f8d8b2e5edb2
	.xword	0xdc51fdce1d7bbe46
	.xword	0x03aa9e544c8c632b
	.xword	0x84e243f26e60d4f2
	.xword	0xd183fe2813ca3858
	.xword	0xdb8ce5479775c395
	.xword	0x146a5edd24e9b987
	.xword	0xb1bb2ac7b81284b0
	.xword	0xf6749db00774178f
	.xword	0x59014b5e93cfcb99
	.xword	0x33862ff900ce91c6
	.xword	0x3ada044edf2345ae
	.xword	0x64e88f52f938e3d7
	.xword	0x4dba60bf4a39e199
	.xword	0x6ab5b6f9ef7783ea
	.xword	0xa45d4d3ee6721ef6
	.xword	0xda0d9a903238829b
	.xword	0x7fbf1c26307cf98c
	.xword	0x24354bdcd52f2798
	.xword	0xfde272cb4fac3377
	.xword	0x927d88693a0fcffc
	.xword	0xd3eefd12cfdcfd95
	.xword	0xd6b2f39546967f0a
	.xword	0x0e50ad33e513a6b5
	.xword	0xae5159bb0bb0ead5
	.xword	0x3260068811ad0f11
	.xword	0x7112d2a5d83c5076
	.xword	0x0bd7e7ba7d4b5b8e
	.xword	0x721e360c62dea5e3
	.xword	0x2398a812e4b62b4b
	.xword	0xec57cd83529b6252
	.xword	0x99679a30876c77a4
	.xword	0x5a525c96eac7bd07
	.xword	0xa7c06dce3ce3d944
	.xword	0xc6a6aee4f6823645
	.xword	0x0d6b58a935854940
	.xword	0x2ccc72a55bdc68e1
	.xword	0xb5a29ac42d6244e7
	.xword	0x5e833b3fca02e64c
	.xword	0x8adeff42f9ce8f03
	.xword	0xfa0c50176dd1dfcd
	.xword	0x6eef858d884ae254
	.xword	0x274c1d759645504f
	.xword	0x90426c6882fc2936
	.xword	0xec51a073bc69dd34
	.xword	0x173b7cd60c3a910f
	.xword	0xd9450014ff17ee1f
	.xword	0xf572b646165af2ad
	.xword	0x9f5535591c95edb5
	.xword	0xfe44136baa5549c7
	.xword	0xc3bbcb2c21d30832
	.xword	0x67a1d5e8e7f26550
	.xword	0xffa0d9e3d9eb830f
	.xword	0xbb13a8fa168df7c4
	.xword	0xf0be3ed4ccc8318d
	.xword	0xc4a8871c0ec8926e
	.xword	0xb4901d896bf4f910
	.xword	0x37ebbc9ecd58774d
	.xword	0x2760f8d3291c0654
	.xword	0x7127ac5edff3e69e
	.xword	0x16ff1fb6a67d297e
	.xword	0x79908cba6570e71a
	.xword	0x2e51814ec902f4a1
	.xword	0x13a282c76f910566
	.xword	0x1ed16b077dce66e8
	.xword	0x80cc08d54f0fd3c3
	.xword	0x1ed77a1c80e626e0
	.xword	0xb7b3ac7a1f049427
	.xword	0xb5dd1dea7b1f9d2b
	.xword	0xe3de8aad5f2892be
	.xword	0x6bb46b6516d653dd
	.xword	0x2a3678cd53b21806
	.xword	0x3f8a76915117284f
	.xword	0xb93446016522a6f4
	.xword	0xba96461277391dbf
	.xword	0x3c90d283918da460
	.xword	0xd79352dd8fa78b69
	.xword	0x0c5a4e3f83b975c6
	.xword	0x5b6abeacccb038ee



SECTION .ISEG_7 DATA_VA = 0x0000000070100000
attr_data {
	Name	 = .ISEG_7,
	RA	 = 0x0000000070100000,
	PA	 = ra2pa(0x0000000070100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xb9cb47679a0f9f9d
	.xword	0x600efa8430980a19
	.xword	0x64b2d99ba7153097
	.xword	0x6802b09732a9cd9d
	.xword	0x155b4582fd44ee98
	.xword	0x8c06ac472565fd40
	.xword	0xf1b1eaad7607686f
	.xword	0xee764097f7fe0140
	.xword	0xc1764ae8d7bac674
	.xword	0x20d85790fcaa25cf
	.xword	0x72e9eebb0156b7fe
	.xword	0xe7ca1869a531db65
	.xword	0x64c9b38a2aa1e535
	.xword	0x18228b5e5fe9c361
	.xword	0x8443bd3628c7c293
	.xword	0xfed65a6120af287f
	.xword	0x88cd95c89b379a89
	.xword	0x0e95eec5af8de974
	.xword	0x4da760017140c33b
	.xword	0x2db4845cfa035f75
	.xword	0xaead619cf8b4ba0b
	.xword	0xd7ed04b2bccf8c2e
	.xword	0x3ef2166e2a7a9be6
	.xword	0xf1da8e065453989d
	.xword	0xaf613e79409de03e
	.xword	0x2107c4e82453e5c2
	.xword	0x8b65821c39d8d9b0
	.xword	0xf5a6ad47b9d6fe56
	.xword	0x5788c2f81c2b13c7
	.xword	0x19b799080b59a65b
	.xword	0x7f9749566f8b5f05
	.xword	0x9226e80e9b5cf4d6
	.xword	0x9b11b077b636a25f
	.xword	0x5a452c1c49ead6f1
	.xword	0x42488966fb05bc84
	.xword	0x85ab2ca3298b75d4
	.xword	0x5fad6fed8fe20781
	.xword	0x204e40c79b917ad5
	.xword	0x20ca8d2335c0d554
	.xword	0x999e383a04b5bcdf
	.xword	0x9ad78a6ee1d16f36
	.xword	0x308d7550c0176b12
	.xword	0x199d5ae17680cf81
	.xword	0x62c1232fda138cef
	.xword	0x4ed3656995751385
	.xword	0xa1f00208cd0918e6
	.xword	0xc84087047a662098
	.xword	0x7b39f655d8990318
	.xword	0xa9113af848343bef
	.xword	0x6fad35c675a2ec2e
	.xword	0x11a88b37b8157ab2
	.xword	0xb7c18495b25932db
	.xword	0x7869b46a3c78ab49
	.xword	0x0b9500bcb6791935
	.xword	0x75d16685cd898841
	.xword	0x8aaa50549fd8fb30
	.xword	0x34d6f20e07e4eae9
	.xword	0x4c4af81b3461591a
	.xword	0x5216cf1bf99ac8a4
	.xword	0x5a797828007f0c8a
	.xword	0xe843ebbe014ac713
	.xword	0x288d9e782ee5aad3
	.xword	0x6e5ecb81ee254f8e
	.xword	0xe3b667c7e674c5b6
	.xword	0x6358b54026e23c57
	.xword	0x3a0806b6f041ef7a
	.xword	0xb9681a02997ba60d
	.xword	0xce7274416d256e6c
	.xword	0x3cda83437cf22ef9
	.xword	0x748fe53d713e4d3c
	.xword	0x8609c013ab047148
	.xword	0x47ed785a220f5697
	.xword	0x26b5841e364b3ec3
	.xword	0x0bda6bbf73920971
	.xword	0xe355e427fc80321e
	.xword	0x74c43ca736666e39
	.xword	0xa90a300b5f701220
	.xword	0x6e7a09b77ea55186
	.xword	0xde0bcf29c4a77e70
	.xword	0x93f025b98126f97d
	.xword	0xeb2d5cf0d52a8006
	.xword	0x46f48c1dead7ace7
	.xword	0x1c954600382cea6e
	.xword	0x4ea43a209c5d5cb6
	.xword	0x366df80026ac03b5
	.xword	0x6951ebae2ad97fbc
	.xword	0xc473182dbac3b6f5
	.xword	0xa0d306d0b07b7766
	.xword	0x5a6af8384d7fb15c
	.xword	0x67337b48e1bc0679
	.xword	0x882e8423e308a83f
	.xword	0x602024021b920376
	.xword	0x05a02e12de0d9746
	.xword	0xfdca6d158845c084
	.xword	0xf4f488e8822fcf65
	.xword	0x057335d5cab70a20
	.xword	0x8b77f96956e3e6de
	.xword	0xea96bb354b66b493
	.xword	0xe6e9ecc83e67344d
	.xword	0x7ac93e49b032e034
	.xword	0xf686f11ac6670c83
	.xword	0x131d4f42f3f21dd5
	.xword	0xaacefbbac4f65fda
	.xword	0x9d7ee0190bb7e478
	.xword	0x15e97c03a181e4c7
	.xword	0x0cd55422e8054a55
	.xword	0xfc9d12d1e7e8c80a
	.xword	0xb79f5eadc8cae73c
	.xword	0x63473cee8e138714
	.xword	0x2c72243228355287
	.xword	0xbb6683fcf2592d4b
	.xword	0x2b3166dc9ac3f850
	.xword	0x40f175cff61f6523
	.xword	0xccce13879cea3d34
	.xword	0x5b8cd0d4ccdbdc2f
	.xword	0x65d717f0627802de
	.xword	0xefe206d8e17ce55b
	.xword	0x35ffb6bda8d0cdb4
	.xword	0x1392eeafc40c8b08
	.xword	0x386c1b04a4d8bb0a
	.xword	0xa9d942396ed5db7d
	.xword	0xf616ec247af8e19b
	.xword	0x131884b1aa4e8112
	.xword	0x2119d5b4642b0027
	.xword	0x4ed217a53b293f2e
	.xword	0x574028158efee1a3
	.xword	0x9e6ab09819259e48
	.xword	0xdbe5180b55aa1f74
	.xword	0x579dc1463a8a552c
	.xword	0x9a8f106ed5aa585e
	.xword	0x1d5adfc5ba2afd45
	.xword	0x096d0191301cb469
	.xword	0x1173a0eac4661e63
	.xword	0x5ef97f17433bd45c
	.xword	0x4c7f75e7ef392e07
	.xword	0x9a91ac03894f7d7b
	.xword	0x5f4be03de8ce2f80
	.xword	0x3c30104461dadc8f
	.xword	0x9ba8d02606657f3b
	.xword	0x4ca23d9af5b11bf6
	.xword	0xb373db48e27766ed
	.xword	0xab506026fac30e8a
	.xword	0xb21540590f1cd827
	.xword	0x15191532af7ae4f3
	.xword	0x8cfe78c7bfb88535
	.xword	0x9d9bdc3c1312000e
	.xword	0x7f7a528cb001aee7
	.xword	0x67c6c2524c56542f
	.xword	0xd8fce95b77ff31a1
	.xword	0xa710df979251b558
	.xword	0x17197075bc3e7624
	.xword	0x4bdcc990983d72c7
	.xword	0x9902f3008fdf8626
	.xword	0xf7ef9c9c345960a2
	.xword	0x33793bb521724892
	.xword	0xf7c431273fe3f8cf
	.xword	0x0d8865fe1073e3f6
	.xword	0x13606d987d16d128
	.xword	0x2c9ab6d2f5b849fd
	.xword	0x7f04eb82e02b9431
	.xword	0xf6d20f674e95df4a
	.xword	0x62638e3aeec12e7f
	.xword	0x4342d88efac19183
	.xword	0x5c9d99a484e532e4
	.xword	0xbb9fdd3ceaaa28e1
	.xword	0x383f4d60766b6e34
	.xword	0x95319c6fec991843
	.xword	0xddd4de1f7bb2a0d6
	.xword	0x80c13c68bdf29861
	.xword	0x4fc40acc7d1ecfc8
	.xword	0x96fb483c14c21d52
	.xword	0xdcfd95a4afc4531a
	.xword	0x300369504493486b
	.xword	0xb950de2915db724d
	.xword	0x05ccce5dab592be2
	.xword	0x8bccef28256233ee
	.xword	0xe944e733bf055d0f
	.xword	0x45582829bb7dc2ca
	.xword	0x8cf839175e956d71
	.xword	0x81e02b2e39096944
	.xword	0xcf5b3a9828a062f9
	.xword	0x1a19e1a63f7ac49f
	.xword	0x8fa7e613f717ecf9
	.xword	0x84ae94775eabc8ea
	.xword	0x260dc80efa87dfc6
	.xword	0x8dc616039da1c6d3
	.xword	0xaca998ff75e04000
	.xword	0xabc66da2d02b75b5
	.xword	0xaa8555e18bd90fc3
	.xword	0xae4afda54e217a0f
	.xword	0xc0d8a1d327801211
	.xword	0x5d77462e9cd06dae
	.xword	0x2a29f0f5007194af
	.xword	0xe44dd074d8b021c6
	.xword	0x566853aaac8e6c64
	.xword	0xc84836d67023de78
	.xword	0x9274fe340e057299
	.xword	0xc688ae2826329cb7
	.xword	0x93a84e7f1c749dbf
	.xword	0x31fbd213e8d534d4
	.xword	0xe38aa0535be0a588
	.xword	0xb38ee7ed0456b97a
	.xword	0x42671a66c3d2017f
	.xword	0x5ee33299d6d88403
	.xword	0x5ec4f688b9e228d4
	.xword	0x9b8f9da120f08608
	.xword	0x2f39144bb4d08d85
	.xword	0xa2ff5327bcc25ef6
	.xword	0xe668a6cd2fcd3fce
	.xword	0x9d119c2772aae312
	.xword	0xb71306c661459f1a
	.xword	0x136ba60afa268ddc
	.xword	0x5d3413814421c82f
	.xword	0x3f9df01a01d0387e
	.xword	0xeef8877602c67f7f
	.xword	0x992f1355b3b696f2
	.xword	0x4a7cddf4dd890f53
	.xword	0xe64e995a248353c2
	.xword	0xd55ed35cacbf3852
	.xword	0xf0c4b6fe784e4ef8
	.xword	0xcf4013e673105c61
	.xword	0xaaf56a9e867cda47
	.xword	0x3abb2a483a1c89f8
	.xword	0x05acb13ee66b82e4
	.xword	0xe2ddeb221fab0b51
	.xword	0x61ce16451a18e99a
	.xword	0x1d0420dd2376385b
	.xword	0x14851c2b27f0a36a
	.xword	0x8671e815bd098a55
	.xword	0xb1f556d92d314ba0
	.xword	0xd72ccf05b16a42da
	.xword	0x88ddb0f89df22499
	.xword	0x6af469c08c8cefc1
	.xword	0x709ab0dcec3b59f5
	.xword	0x7768d1757e7c35fb
	.xword	0x8d85a2df288ee1fe
	.xword	0xfeb43dfbbeb40ad0
	.xword	0x1641de7512ebac55
	.xword	0x004d1173191d4492
	.xword	0x141629c8f3fa9ef3
	.xword	0xe9c89125f55ec8e7
	.xword	0x354d74a30aa36818
	.xword	0x00f69c2952a3d2f8
	.xword	0xd7785ba75293e56a
	.xword	0x20ec9f4fd08053e1
	.xword	0xea84de6dfacd5af6
	.xword	0xb0048b381bb0b4d8
	.xword	0x9a2416412b4d34f3
	.xword	0x94749c74233013a6
	.xword	0xbdebfb7a1b876936
	.xword	0xc5ba07b823a31869
	.xword	0xd3f0e9381891c9fa
	.xword	0x8adeed0bd5f0d030
	.xword	0x196b7b415467b552
	.xword	0x99b209195068b38e
	.xword	0x4f6aa2ec30083c1b



SECTION .ISEG_8 DATA_VA = 0x0000000080100000
attr_data {
	Name	 = .ISEG_8,
	RA	 = 0x0000000080100000,
	PA	 = ra2pa(0x0000000080100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x3fe38b1d6b5c2586
	.xword	0x95e206595d69569d
	.xword	0xfcfb3127003229ab
	.xword	0x8a7b8bca18178c04
	.xword	0x67de7426726bfde6
	.xword	0x24bae1ce92afebf5
	.xword	0xe5f108d6243debf7
	.xword	0x0091a6c6c47a55f3
	.xword	0x5fdb7cd4150960f8
	.xword	0x35f1a2da5a4a45c3
	.xword	0xfdf8309b89df0ce2
	.xword	0x3a0544614f817c58
	.xword	0x5a9a1a3545616c12
	.xword	0x5f323699b3d52b71
	.xword	0xc23c3de10f70a653
	.xword	0xdd1015d06c5cf15c
	.xword	0x61a17a046f2f9da2
	.xword	0xc76edeb6e6d3aebb
	.xword	0xaad198ac378e5501
	.xword	0x009136e5e2a687e9
	.xword	0x917be1687cc53cc8
	.xword	0x92cc5ba0e3b07494
	.xword	0x7d8e01de9c30a29a
	.xword	0x4f7730556808813f
	.xword	0xb130a28685390a34
	.xword	0xd7162062900628e3
	.xword	0x468443d8e5c3fcfd
	.xword	0xc5bfa1d1859abd7a
	.xword	0xe45f3113a41b90ea
	.xword	0x1e50be0b98f1f7f7
	.xword	0xe99dafb3f4d183c1
	.xword	0xedb43efdc815eede
	.xword	0x2b686d0bbeac7dce
	.xword	0xd23ea8d2cd27c5c3
	.xword	0xb00972a24a341eb0
	.xword	0x997e6a39f05ec5e6
	.xword	0xaa33e342a076fa7b
	.xword	0x6505c7f7e3e703e2
	.xword	0x801ec2e31678d613
	.xword	0x4aab32e435e82707
	.xword	0xee3b2327147e4279
	.xword	0x65250a916fdc7dd8
	.xword	0xa65b209a602fcfa5
	.xword	0x2f6da68de55c437b
	.xword	0xb1f714689c1e062d
	.xword	0xce7c8ad66d9ac17c
	.xword	0x5d4deef243c76cbb
	.xword	0x8da7f2f46ece68c3
	.xword	0x2ba8eec00285276f
	.xword	0x525bb2e6e67513de
	.xword	0x4ab22fab97292cf3
	.xword	0x046e4a4199fa230b
	.xword	0x85afb588f08e2827
	.xword	0x00f800ea3513b505
	.xword	0x8957d0fed34d1a39
	.xword	0xf7a5f23a4817cd0a
	.xword	0xa43224240b5171d5
	.xword	0xfabeae7be28ba6dc
	.xword	0x624aeb625d34c0e9
	.xword	0x44e6efb294c9e9d2
	.xword	0x5adae7418708d502
	.xword	0xfb72041a0392ee1c
	.xword	0x4972ead69066b009
	.xword	0x3e26764cf4b19bff
	.xword	0x2f5b249870c453b0
	.xword	0x100e10feaf988612
	.xword	0xe8da4b274ac7b91d
	.xword	0xefc10c3283c39465
	.xword	0x953ce97b8bf0b38f
	.xword	0x51c40692cb73c05b
	.xword	0x1f942686395098f0
	.xword	0x2d566a068fad291a
	.xword	0xa1b673ee0e2e31b3
	.xword	0x0b942254b97e6942
	.xword	0x51333907d1ded851
	.xword	0x300ed8ef0576f86b
	.xword	0x526debb01e1f17cb
	.xword	0x75bbb1dd296bbe2b
	.xword	0x6336d9e590464ed1
	.xword	0x71d4154d90c349f9
	.xword	0x31c38bf65609875e
	.xword	0x12dab90059d21b71
	.xword	0xa9cbb995a2df43df
	.xword	0xd6a7e6da84f7b096
	.xword	0x3955c5ef39383461
	.xword	0x9435809928117dd7
	.xword	0x6b10573c733aa28d
	.xword	0xf077a86fff0d7455
	.xword	0x07248dcecdbab550
	.xword	0x37f16be5d6495bbc
	.xword	0xf5c6874a7f10047a
	.xword	0x653c842cf5c5bda1
	.xword	0x6075e4e4949ce6c4
	.xword	0x61c517b98cc6e319
	.xword	0x1cd340511b85cfef
	.xword	0x06a6853ebf280fee
	.xword	0x231297cec9a802a1
	.xword	0x6de2a8e7f6b25d6c
	.xword	0x32a6027dcba212f1
	.xword	0x1f4950a3147d79f3
	.xword	0x32e1d0cc144ca340
	.xword	0x3f631be40bbcb3f9
	.xword	0xc5d0714db6be0806
	.xword	0x7678d7d9f307dc35
	.xword	0xcffdd531b1cfeb61
	.xword	0xf4933ca9388193d7
	.xword	0x82b29a1819547c0a
	.xword	0x4861a46e3a76b200
	.xword	0x8cc7218e43292281
	.xword	0xecdd29edc7b727f2
	.xword	0x6b9ce503d4f1cc37
	.xword	0xf1697d6cd0dc4612
	.xword	0x2330b2e7ed262469
	.xword	0x06b12db166f74b59
	.xword	0x11dc5c137e540cf8
	.xword	0xbed00b6ba041027a
	.xword	0xd417a4e6e16fb6f0
	.xword	0xda8f7040a949fd6e
	.xword	0xb9213e2e189f0f13
	.xword	0xa890c6a0053d3a6a
	.xword	0x2fbf4ca4193ddbae
	.xword	0x8370462f71e1e8b7
	.xword	0x69b7c32f45cd3ca0
	.xword	0x45c23970738f5a80
	.xword	0x631f9a5b1d24fd3b
	.xword	0xcb2314701fa5d15f
	.xword	0x8c9e526b1278000a
	.xword	0xc3a6a66b6231446c
	.xword	0xd557ea1ac193623f
	.xword	0x82b4d75fa693e7e1
	.xword	0x6f5a64324df3b3a8
	.xword	0x83233c8b200736af
	.xword	0x605d1d88a58dc1c5
	.xword	0xe14c146294328816
	.xword	0x4b887aaa8f803729
	.xword	0x1767617e213f21e3
	.xword	0xe80b783260e87436
	.xword	0x2a19e984a6d67845
	.xword	0x32a8e1afb91dc08f
	.xword	0x299463eff4c33c3a
	.xword	0x0cec1ff7ff31d27c
	.xword	0x7f179a61f034da8f
	.xword	0xd922292fcb0bb0ff
	.xword	0x8c35f1b1048851e2
	.xword	0xa5d7d25ea60de5c5
	.xword	0x7f5193da4e7dc74a
	.xword	0x2c3cab4fb38e2bbc
	.xword	0x693dc74aebc1654a
	.xword	0xe74ea3212143ad7e
	.xword	0x4d52cd519dff594a
	.xword	0x605a782f263aa2ed
	.xword	0x5e95944b6290bbcd
	.xword	0xf06a8011b423941e
	.xword	0xdcfd170f269dd4c8
	.xword	0x448675bad741fdc4
	.xword	0x9ad825c439a83558
	.xword	0xf02e1635ab7b5232
	.xword	0x22d18b11cb9da992
	.xword	0xfb5e5ce1e05c0200
	.xword	0xf62a5199931e4f47
	.xword	0xb717079f47d0cf8c
	.xword	0x376efbdeec1554d0
	.xword	0x5351d3ee61a63190
	.xword	0x04010391cb611506
	.xword	0x6abf42658a964891
	.xword	0x4025fc2ec507fdf2
	.xword	0xdca4ceab65930bef
	.xword	0xc911a362afb15418
	.xword	0xc2302746ccae0e21
	.xword	0x3f7df873840b336a
	.xword	0x0f85745524b250c7
	.xword	0x2a698eed5f6f3502
	.xword	0xaa9ef93725b1beea
	.xword	0x7bb11ca33cfaacf3
	.xword	0xe052a14e391eefb6
	.xword	0x2e35fd01d05bf214
	.xword	0xe213ec06db278c50
	.xword	0xe6e6ae2033dce0ef
	.xword	0x96b28da9d2ef687c
	.xword	0x53649e964fa4acac
	.xword	0x4eb7faca12186f4e
	.xword	0x5bef7eb270133951
	.xword	0x4d58e4690687b7f3
	.xword	0xd42516636a2d4b5e
	.xword	0x0c88ab8a88870c05
	.xword	0xa6df542992e23f6b
	.xword	0x7d3904e8746cfe6a
	.xword	0x3e8eb468ee4fcb21
	.xword	0x84868892773937a8
	.xword	0x1e2ff27bdf205396
	.xword	0xa8808939be3d283c
	.xword	0x8f872f8c67ca623b
	.xword	0x312e5b7bf5ab886a
	.xword	0x8cf8dd15ba1fd386
	.xword	0x3e3dc8123fbb2781
	.xword	0x51d925bd531a9a0c
	.xword	0xeb5a2adc15361676
	.xword	0x56d255add91df9c3
	.xword	0x033460ce59b996d0
	.xword	0x564f647b6c8c20fb
	.xword	0x718b279ee7bbecad
	.xword	0x885bae975bfd0f7d
	.xword	0x56576a55f308f391
	.xword	0x5217dfd1fb66563f
	.xword	0x3e0adc495c957d02
	.xword	0xb25ee734941494d6
	.xword	0x435da221a0f1bc19
	.xword	0xdf759c603f97a404
	.xword	0xc61c492f077a0bfa
	.xword	0xfb4679be02a55df2
	.xword	0xaa7f2dad2af30fab
	.xword	0x3f9bdf3d7a580aad
	.xword	0xb7440926a29eada6
	.xword	0x6f5fcc0beae93396
	.xword	0x09cdc60ffd980392
	.xword	0x3ed3e1e9b823d534
	.xword	0x8fd2cbbe0e8753a1
	.xword	0xd02f705a79ad3c9d
	.xword	0x1fa1fd968508832c
	.xword	0xeeaddeb366407195
	.xword	0xe14958b67be8ccba
	.xword	0x6c124635ef99c701
	.xword	0x16793ead064e482a
	.xword	0x5b03e780070cc3ba
	.xword	0xf41bb74e958f51d1
	.xword	0x43b60edd5c3b4624
	.xword	0xdd7b90065e36d238
	.xword	0x0b00d6126b9d101b
	.xword	0xf3da94d0a4adde80
	.xword	0x42670ae14de59787
	.xword	0x85dafdb150154952
	.xword	0x71ccb49492e19f3f
	.xword	0x267953284a43021a
	.xword	0xc7d15f0fe98dd457
	.xword	0xce6110512ea965ac
	.xword	0x48b554ea06a1b644
	.xword	0xd149cffbf5e288ed
	.xword	0x71e5cd6151de0ddd
	.xword	0x54899f343507f127
	.xword	0xca9de24e6b29742a
	.xword	0xc0849de4d6a396f5
	.xword	0x7bf202dd56f7041f
	.xword	0x504c9ab6dbb0bf6d
	.xword	0xfa36983da7076e4b
	.xword	0xf1d5cf35610956f9
	.xword	0x2ebe2a96f2719213
	.xword	0x350a7ac3814460eb
	.xword	0x9de6a95498a0b644
	.xword	0xb6156efee74f5ae9
	.xword	0xb42ac893c2dfce7a
	.xword	0x9a36fc3daabea7b2
	.xword	0x57e5a402be45469b
	.xword	0xd897506cdffbb0ee
	.xword	0x061fa97485cd1a2b
	.xword	0x119020280968c185
	.xword	0x0e30d086a81d6648



SECTION .ISEG_9 DATA_VA = 0x0000000090100000
attr_data {
	Name	 = .ISEG_9,
	RA	 = 0x0000000090100000,
	PA	 = ra2pa(0x0000000090100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xbd445b6025c50c9a
	.xword	0x246648150b8512d7
	.xword	0x0467a8f9871e513a
	.xword	0xb6b276cb697753d2
	.xword	0xac5d8a945048bfa5
	.xword	0xe75627751903d658
	.xword	0xeeded3ee955caa33
	.xword	0xec161817188d0b2e
	.xword	0x3d00f74ed8181f53
	.xword	0xe66572452dedd85b
	.xword	0xc8ed1180ef54eecc
	.xword	0x004f45bfbcb44c7a
	.xword	0x37b73ec1b5b0d92f
	.xword	0x6073948c04283a72
	.xword	0x4af70e4b8cf0f945
	.xword	0x10733a0a3f69e01c
	.xword	0x0f9ed6366d18aff6
	.xword	0x780153196ec342a1
	.xword	0x2d06c7e327b0d2c5
	.xword	0x1bc17a1e2921069e
	.xword	0xf202c24207dd3201
	.xword	0x2253fa09d5de63f3
	.xword	0x0717a607303cc91b
	.xword	0x4b246f1555f71e8f
	.xword	0x9553a109a1c6f598
	.xword	0xfacc3bafdf60a453
	.xword	0x341496d25706184b
	.xword	0xde428f8da54ac0b4
	.xword	0xa1d5bb0833cfe7b9
	.xword	0x7668f4b61b8c9429
	.xword	0x6913600732531673
	.xword	0x167445af47f54b26
	.xword	0x80b4976da8defb87
	.xword	0xe5a1773e696e2e55
	.xword	0xab9269410097c786
	.xword	0x781c13f73cad6bbf
	.xword	0x307691123ff2fb0a
	.xword	0xf18b143b343a19e0
	.xword	0xa7247f265430b97c
	.xword	0x8fea782c2e7683c5
	.xword	0xa747efb68d59a518
	.xword	0xd5b1c831cd3bbc18
	.xword	0xc41375599d8cdc08
	.xword	0x5d9ee4e3ac1db6d5
	.xword	0x618c3b85a89f2e4f
	.xword	0xac679ebd935e2d87
	.xword	0xc810326ec1dc9fed
	.xword	0x8b17ae396ece10b3
	.xword	0x730014a161c71a2f
	.xword	0xe3d0d7999430e183
	.xword	0xf3330a908008509e
	.xword	0xf71cdd482f3370fb
	.xword	0x21e769d88f1f63e8
	.xword	0x6afa85f1361f8a16
	.xword	0xd869c7f362d9be3b
	.xword	0x685e939b85b19d66
	.xword	0xd4847e859ccc64f7
	.xword	0x7830d9c58915929e
	.xword	0x205719a3d28aa643
	.xword	0xb071925f52b08610
	.xword	0x3ca1f3141cda9897
	.xword	0x2f034a42d98494d4
	.xword	0xf3663798b19c595c
	.xword	0x5f88fd56d72aa143
	.xword	0xc8c09f760f2b522e
	.xword	0x76561e7251000b33
	.xword	0xec4de6223bd58d0d
	.xword	0xe546013ab6d49362
	.xword	0xd5318425472b552d
	.xword	0xca60b58f7822a98d
	.xword	0x58daf1e84ca00417
	.xword	0x91b39271d96a9c4c
	.xword	0x70d54743d85d0bee
	.xword	0x8fc4d6443525574b
	.xword	0x3dda0086aa4e5ce9
	.xword	0xab496b945b6fe3dc
	.xword	0x304a77b33e1238c5
	.xword	0xcde0b6c8e6880489
	.xword	0x1eb41d201d5d3fa9
	.xword	0xfa25b6f2dfd43d00
	.xword	0x5f39c4add23429b9
	.xword	0x9e222358288f2ac5
	.xword	0x3074b1a0f4a20592
	.xword	0x98a6ff7f7bbb71e3
	.xword	0x9211d86e71078a71
	.xword	0xfe4582969411f1a1
	.xword	0xcbc19356f602540e
	.xword	0x6efc159dcdb74547
	.xword	0x2b0428d943209f35
	.xword	0x003dac5bf366a34c
	.xword	0x66e9fe03cfe5226a
	.xword	0x97595ccaf2e3d9b0
	.xword	0xcb509d7fc1a7267a
	.xword	0x56f9e724ce97b425
	.xword	0x63b59d711c7b7060
	.xword	0x6914dd9a2802f83c
	.xword	0xd8bc93f649bf2904
	.xword	0x9727753316ae3498
	.xword	0x0be301ddedb6ed22
	.xword	0x139f5356f0614b59
	.xword	0x05b9895235173dc9
	.xword	0xe77d313b08374fdf
	.xword	0xbec4164714b6ee92
	.xword	0x51741d673cecc8b5
	.xword	0x5777a9e1808aadf1
	.xword	0xce27278275cf7144
	.xword	0x8c0f6d3a19115a31
	.xword	0x5059bec3585957f3
	.xword	0xfc6f8fd6a63d33bf
	.xword	0x77606bbf06adcab3
	.xword	0x82ff860e2af16dde
	.xword	0x12f64d21fd4bf552
	.xword	0x92b2afcb8c9ab6f7
	.xword	0xe5df9c88bc8bd429
	.xword	0x269a740d29acc456
	.xword	0xc183f1c90274915e
	.xword	0xabd2775a80d87679
	.xword	0x765ceabec9d64446
	.xword	0xf9a705d240321637
	.xword	0x425ae39a4b1ea2e5
	.xword	0x053be1ea2b3fd8d1
	.xword	0xc96e4f563aaa0a00
	.xword	0x3cf77e0e9409eb41
	.xword	0x67f7bfe8d2f466c2
	.xword	0xc37da656442729d7
	.xword	0xe92cf82fd6f95675
	.xword	0xcd6d0680ae9f54f6
	.xword	0x6037b334b2863039
	.xword	0xa67523334e55c44a
	.xword	0x4b17d233407fbe1e
	.xword	0x1817ac4c6a673429
	.xword	0xa5c39f9271722fc5
	.xword	0x300c3a8137c95b45
	.xword	0x9c1cb14b58a6c777
	.xword	0x92e4e4444e263dd6
	.xword	0x3f9ba1c1380a8d40
	.xword	0xf47d716712038ff9
	.xword	0x033f5fdad9c6c807
	.xword	0x74266241ac1a8057
	.xword	0x24fe4824da5b1f97
	.xword	0xf50e6bc52dc13adb
	.xword	0x2f935d0a9e156bb3
	.xword	0xa171ce8170d803cf
	.xword	0xa816c1cd20e316fc
	.xword	0x8dd431629fcc0ea2
	.xword	0x7410da349b856292
	.xword	0xfa37988de145da21
	.xword	0xc74d2931a35b3b39
	.xword	0x6499b09829a77cbc
	.xword	0x2172fdc98fe6adb5
	.xword	0x54315c5c495aa87b
	.xword	0xe1e8dfed526b936c
	.xword	0x1eb960afd7f3c57e
	.xword	0xea15c61b39a0444f
	.xword	0x7870812530ab86f8
	.xword	0x5b7a3f308d069849
	.xword	0xe85cc30203f729aa
	.xword	0xdfe1fab41b51cf7b
	.xword	0x057f7bc2869cc635
	.xword	0x4206e2a4c2e70e68
	.xword	0x16057fb28ae97e37
	.xword	0xccc82ce6815408ad
	.xword	0x32d72eab964b866f
	.xword	0x156c576339157e9d
	.xword	0x1fd648bb09220329
	.xword	0xce5e08fd00b73d00
	.xword	0x4145bd38cd16c6d1
	.xword	0xf9ca7c6c12260316
	.xword	0xd420af6b92fb80c6
	.xword	0x162b3429d7062d70
	.xword	0xabf1f88f55e16e79
	.xword	0xb940ed0fd59dedb1
	.xword	0x335a27e2305d904e
	.xword	0xacf4a445fb5eb567
	.xword	0x18b7f41dff762df2
	.xword	0xbe0ff049784ee63d
	.xword	0xb4ef58f4863c1dc7
	.xword	0xc0f87b37a43de280
	.xword	0x727088a6f693a1f7
	.xword	0x03bdfb054ff8e7f3
	.xword	0x9c7e7ae847a5471c
	.xword	0x63725e945e9d7755
	.xword	0x9aaa8091955f7b50
	.xword	0x136252b82021c362
	.xword	0xa9a444efe1d1b3dd
	.xword	0xeba39faa31e631d9
	.xword	0xfbea4f282dcad616
	.xword	0x0fdc3896986638d9
	.xword	0x352faf25e936e596
	.xword	0xc1adec78b36e165a
	.xword	0x2e48358b109f26c9
	.xword	0x7ce802b2a80dcf4f
	.xword	0x3a53613c8354ade1
	.xword	0x2f033adaea3cb521
	.xword	0x4218adc51e03c377
	.xword	0xa335e5e5b1be587b
	.xword	0x1270c3b06954ac40
	.xword	0x66c980b6197c43ee
	.xword	0x9375b305d2ea7cc4
	.xword	0x81548aab6d3dfcc5
	.xword	0x0e1bd2ce72f81bf3
	.xword	0xf8cc08bcf0b30148
	.xword	0x40c127389e418e5b
	.xword	0x1d639c8dc600d27f
	.xword	0x4d006269c1bdecb3
	.xword	0x2aa5c9650be1a660
	.xword	0xe5eca08da467d86e
	.xword	0xbe2cb73a30a65810
	.xword	0xa735299e624227cf
	.xword	0x85aa6f9463867eac
	.xword	0x7ce370b6dadf4489
	.xword	0x0c996475a9718fd4
	.xword	0x2ac7eb4fa4abbd9c
	.xword	0x9e1ce20c819f4a27
	.xword	0x5bee5d63fef96e7b
	.xword	0x1e098013a72374da
	.xword	0x5ebee005501d7b1c
	.xword	0xba37de35f3cc2472
	.xword	0x8e485d05a6cd681b
	.xword	0x7c7dc6798738a131
	.xword	0x677049fc6dd5f1cf
	.xword	0x5651c03a5a637f64
	.xword	0x85ecbb81806346e3
	.xword	0x2b57cb9491040bed
	.xword	0xca3b0bc4c773426d
	.xword	0x04587b6b222203a5
	.xword	0x6d71ec6a322c6a2e
	.xword	0x82ce77ab1e9a4273
	.xword	0x053ca678bd82b445
	.xword	0xa3bff8316570ed3e
	.xword	0x5d989c9eae34e744
	.xword	0x7b9c6c0a397ce23c
	.xword	0x36b651e650d9850f
	.xword	0x629582f23337914f
	.xword	0x58b4e554e7501806
	.xword	0x856eaca5787018a7
	.xword	0x71c92424e7108512
	.xword	0xa8246e762bebb52f
	.xword	0x09b921320fecd64c
	.xword	0x28e3c2a1694298ae
	.xword	0x420f20089b594f1c
	.xword	0xaabd38473b07d6d8
	.xword	0xfe2847f4521f28e4
	.xword	0x7872ff147dd37cdb
	.xword	0x0c5aae1e06faa9f7
	.xword	0x9aceff4b3d2bb973
	.xword	0x1613bc0515592ceb
	.xword	0xfbcb5b99a97222d0
	.xword	0x7fdac6043c79c997
	.xword	0xd0cbe0e6b31716c4
	.xword	0x1f998208fd9abbd9
	.xword	0xba681ba0805259ed
	.xword	0x25b8888e4f248ede
	.xword	0x8d839682f88c930e
	.xword	0x01b93596d112b312
	.xword	0xffd34b0db4600668



SECTION .ISEG_10 DATA_VA = 0x00000000a0100000
attr_data {
	Name	 = .ISEG_10,
	RA	 = 0x00000000a0100000,
	PA	 = ra2pa(0x00000000a0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x1c39c216457d5a6d
	.xword	0x3b2ce1381a9a995b
	.xword	0x27c6a8e2f7b39551
	.xword	0xe5219781105d37bf
	.xword	0x5b296ed3a7de4f66
	.xword	0x77a045d32e59ba3b
	.xword	0x7d06c4afa13fa8c5
	.xword	0x135ca45e9cb0fbce
	.xword	0x309e557c33acf183
	.xword	0x85eb136a169d8550
	.xword	0x85717fd8a193f0bd
	.xword	0x83ede70c00957791
	.xword	0xa45c1b536c94278d
	.xword	0xc2ceb9d70297ccad
	.xword	0x32c5a4256b7c84c9
	.xword	0xef6987a050bd7601
	.xword	0x5b887f31fea5b81c
	.xword	0xd122e9790334bd29
	.xword	0x0683faba45359321
	.xword	0x768e7282c44d5466
	.xword	0xa4bada9f1f52309d
	.xword	0xd2257cd01fba0c91
	.xword	0xbfed284f10ddeda8
	.xword	0xcf54c0f8b6ca6cfc
	.xword	0x87709a57454bd1b0
	.xword	0x36007c1b2408c4c3
	.xword	0x4ad202f9978c63b5
	.xword	0x66e62a3d83b24ef7
	.xword	0x3c270304c5a97218
	.xword	0xf588e1c33f41f196
	.xword	0x692a75d5e161ad4d
	.xword	0x169f166c62d20255
	.xword	0x05bb5a1adccf1bd4
	.xword	0x2439686cdd55c0bd
	.xword	0x4300f3031dfb5f88
	.xword	0x363654e3f473f2a0
	.xword	0xbff103c1966a92ed
	.xword	0x353d32dbd572ccc7
	.xword	0x87f1466da36dc16d
	.xword	0x2e3e2a8169b0a0ea
	.xword	0xb24b7d6077d137f7
	.xword	0xe326d592480ead96
	.xword	0x3cedcbe3b2b8451e
	.xword	0xaaa224eacceb5aff
	.xword	0x5682c7513fb499e8
	.xword	0x76ab511a972c706a
	.xword	0xc7c1a65a8ce41e83
	.xword	0xf74e6b166488d525
	.xword	0x39303edc49932f70
	.xword	0xb42f088508c4c9bf
	.xword	0xdfd96d0dc4fb0a12
	.xword	0xa33fa01dddf40037
	.xword	0xa03b4bc7837b8f40
	.xword	0x7249e58123006e5a
	.xword	0x0e79bd48c34ca4fd
	.xword	0x789614788d7eb402
	.xword	0x5c59abddc11e69be
	.xword	0x575ac7bec0f1565d
	.xword	0x3704bcde03ae95a7
	.xword	0xc09e7a7358854c89
	.xword	0x3a5dd48b69c408c9
	.xword	0xfa80f748d17c05e3
	.xword	0xdb7dd639f9fe0b92
	.xword	0x973023e38d4706e2
	.xword	0xa2abd547ce8e51fe
	.xword	0x982385740b7d63fa
	.xword	0x6bf2af155114a980
	.xword	0xeb0217f78af254da
	.xword	0xab0f7eda8abf681f
	.xword	0x4c6bca0085080746
	.xword	0x81bc3e5f78f150cd
	.xword	0x3372af0870df61a1
	.xword	0xa416cb7e1f585cc4
	.xword	0xe20a782667181431
	.xword	0x79178e0e7940446c
	.xword	0x5d0017c9568d8245
	.xword	0x15b877aa7e5aa232
	.xword	0x2c81c9f25202d26b
	.xword	0x37baf3af6f268ba8
	.xword	0x8ba75a2313e69638
	.xword	0xc2b32fe6d222c857
	.xword	0x11598b0dae6e59a1
	.xword	0x569d6adb5ac43af4
	.xword	0xc355910b52df3a3d
	.xword	0x3e440e7b3f87acc7
	.xword	0x3932f5ac880922a2
	.xword	0x810d0273f0b132b0
	.xword	0x25792c606e25ae22
	.xword	0x28c189c9ed0a5171
	.xword	0xa364b9f26b09ac62
	.xword	0xecd7f9b1ba5a6d4b
	.xword	0x11846fd76a7da1c1
	.xword	0xcba123cfa983adbf
	.xword	0xf4257a939a842733
	.xword	0xfd033334189d5a54
	.xword	0x575746cad7a5d0e5
	.xword	0xff299b858a5a9aab
	.xword	0x4435ae583517052d
	.xword	0xb74485fb8f7f9b81
	.xword	0x9f1e5524e05a233e
	.xword	0x499b99009d5e4ca0
	.xword	0x05d4993c1dd91f01
	.xword	0x0ecb94fc0db2a219
	.xword	0x2184648465858d06
	.xword	0xb36dafb41f3f2775
	.xword	0x9638fc18dde50a3f
	.xword	0xa6d17bb5ce37e893
	.xword	0x34f9ed043144d810
	.xword	0x250b61433b12db42
	.xword	0x7549e9259fe46670
	.xword	0xb3602eef1c123535
	.xword	0x4ffc1f2de7033732
	.xword	0x77f9cd0d0d387fd7
	.xword	0x299a683996bcb672
	.xword	0x89bacb42dc1c4100
	.xword	0x04036066592018ce
	.xword	0x550e4859549da7ec
	.xword	0xa3c60a59f77e5451
	.xword	0x408f353b4b9d3e0a
	.xword	0x0d392c1c4de939df
	.xword	0x1eadf4dfa03be76f
	.xword	0x371cb5c0b12e3468
	.xword	0x37892a29a3c43f1b
	.xword	0xabce2cfe13ec3302
	.xword	0xddc73fb245cf272b
	.xword	0xaea0f421973e0c23
	.xword	0x5493dd9dd5b7a351
	.xword	0x110233d8629041a8
	.xword	0x03f5ec068d402b55
	.xword	0xf3e39c759173ab76
	.xword	0x38e389dd69475ceb
	.xword	0x27e1d7779c12669d
	.xword	0x5ab19c90f61b6611
	.xword	0x5a40a151388a0991
	.xword	0x7e2d76e6c3d59214
	.xword	0xdc5806a5dbcc5abe
	.xword	0x5328e10d15389fd9
	.xword	0x529db2948ab2e8e4
	.xword	0x0594671788f908d6
	.xword	0x0fd3ab620002d424
	.xword	0x2f98f1d704eb74f6
	.xword	0xd9ec2cf2af48d62f
	.xword	0x7668485650fa9991
	.xword	0x062a208d96fe5be5
	.xword	0x98a3f5a6e1022370
	.xword	0x3958d000b41785df
	.xword	0x8fede77e05b691d3
	.xword	0x54e756cebc93d01d
	.xword	0x9ae857895033fb4d
	.xword	0x92f4ca363430b11a
	.xword	0x7515b08b4b1bdf8d
	.xword	0x9179410665f4ca64
	.xword	0x7acb0b0f315fb83b
	.xword	0x62466a16d5ca93da
	.xword	0x15c79e2e67a86e43
	.xword	0x58782558389e4e97
	.xword	0x44bed1d4489ef327
	.xword	0xb698581e6e2f9a70
	.xword	0x6f564466f347d6bf
	.xword	0x48c9581cc512ce1b
	.xword	0x26c9aad546317cb7
	.xword	0x67e77bfcb6f7244a
	.xword	0xc9da46c0db6306b5
	.xword	0x37138474f82bcc0f
	.xword	0x1dfd43edad4d4494
	.xword	0xaa93839c01f1e25f
	.xword	0x16a23c188be7b601
	.xword	0x017a5adafb1a7d97
	.xword	0x325f832fc4c502b4
	.xword	0xb26ef06291f12034
	.xword	0x2efa78d461443526
	.xword	0x19afea1a16d730e1
	.xword	0xbd8f8050ce2f4fb0
	.xword	0x2e9edb3940270135
	.xword	0x2d06c8c325215cb1
	.xword	0x3282177b358912f7
	.xword	0xca4260171838fb47
	.xword	0xb01e64a9d90d50d0
	.xword	0x98f5029acc9dbc22
	.xword	0x3f418abb72fc3834
	.xword	0x2877919a5930cdba
	.xword	0xa682ee74b7e86fc6
	.xword	0x6d2bce0ace8a4f92
	.xword	0x6381131cdb198675
	.xword	0x71a4e1e1604fef31
	.xword	0xde0a3f729dfa553b
	.xword	0xd33ded2724a55d1a
	.xword	0xd1d355e92b94d9fd
	.xword	0xb090fe1a03547d56
	.xword	0x7f4c42898ba0edb2
	.xword	0x2b1a83bb128b811e
	.xword	0x19d8756def0cccbb
	.xword	0x5cdc3f7e33248710
	.xword	0x9e692e483beb0cc0
	.xword	0x094b2f9c04c354ea
	.xword	0xca16b4a22ec6b9d2
	.xword	0x299d045a730fe17e
	.xword	0x530f84aeac0724e5
	.xword	0x6d604ce045dddfb8
	.xword	0xfa13b6fdac133c2e
	.xword	0x6f4e21944159f53e
	.xword	0x69a24abb7c19e5f2
	.xword	0xd81322ee77b594b1
	.xword	0xb58ceb05a194df5d
	.xword	0x3eea3d8b4076f6f9
	.xword	0x6c5b0da38e245972
	.xword	0x1cfc802bdab18f58
	.xword	0x4ca3b670f3568642
	.xword	0x65adffac0e0e6459
	.xword	0x4a66fa36c55f1e6e
	.xword	0x0680438546e97602
	.xword	0xa4ec96e7ddff39c2
	.xword	0xfb243ef5ce4de6bd
	.xword	0xb9b9f11573a7d572
	.xword	0xc960f9639d1c7471
	.xword	0x25db259fe20bf383
	.xword	0xa540d5be387a1657
	.xword	0xadfc4320d86aabc2
	.xword	0xec1ba5ca430c117e
	.xword	0xf1e9bb108d422f9f
	.xword	0xab7d764bea78c19c
	.xword	0x2d1d9d3ef1573b25
	.xword	0xb120fb7132c8ebc9
	.xword	0xcc37d89e0f91aeb9
	.xword	0x18c078e778bee21e
	.xword	0x011b798ad963eb7a
	.xword	0xc3cb58342da7f956
	.xword	0x99a44695cdf65bf0
	.xword	0x99d2ddedcd652791
	.xword	0x57176d78b9967995
	.xword	0x4dd1224360390389
	.xword	0x8eb06ba687d4e7e3
	.xword	0x95b3cd6f0c1d0367
	.xword	0x9720b14b0ec51432
	.xword	0x8b32c92fdc1e8bca
	.xword	0x2028d1ef4ddd6a63
	.xword	0x9bea8630526d2508
	.xword	0x17b61f18217d3fa8
	.xword	0x6de22ccc214aa35a
	.xword	0xbbbe70418445f52e
	.xword	0x7381579571e64d3d
	.xword	0xa5b29cebb2c41bb0
	.xword	0xa0139a4972d7fda3
	.xword	0x6bc085dc6bbb35f0
	.xword	0xb3abd2a6c5b15cf2
	.xword	0x455c2838d4fb82ec
	.xword	0x00799659a4dcfe36
	.xword	0xabf12733cb086a2f
	.xword	0x0dfedff2115a4d9a
	.xword	0xca9fd2247159bc60
	.xword	0xd5b9585e1a87fd63
	.xword	0xe39ff6a39e42fd87
	.xword	0x9a537cef32f13af6
	.xword	0x61f5ba35592483ad
	.xword	0x3f4e8d4c3803d602
	.xword	0x9ff97fcc52318a9e



SECTION .ISEG_11 DATA_VA = 0x00000000b0100000
attr_data {
	Name	 = .ISEG_11,
	RA	 = 0x00000000b0100000,
	PA	 = ra2pa(0x00000000b0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xa489422f890f5d17
	.xword	0xa21c00e820b9fb70
	.xword	0xb02db20adefdbf5b
	.xword	0x81e971fb309a72d4
	.xword	0xbade862125e4940c
	.xword	0x006461ce1db7d989
	.xword	0xd7ed14f0447f356a
	.xword	0x5d8e53ac86020c8d
	.xword	0x8fcbb845a52540d1
	.xword	0x79b9f16a0ad73667
	.xword	0x3fe5a347c15eddaa
	.xword	0x67a0689ab394c391
	.xword	0x1f09ddeef0928338
	.xword	0x63795fad5729bd63
	.xword	0x5ad3b66ccbbdad75
	.xword	0x721ce9c4dc464bf8
	.xword	0xe58b9268dc472845
	.xword	0x085782a1ed38824e
	.xword	0x689f2c2a68976dca
	.xword	0x016d7290b4b996e8
	.xword	0x72a55a2d98d2f4d6
	.xword	0x49badc94196530e6
	.xword	0x226ba2e4ca91da0a
	.xword	0x716bcc7c4e2b8711
	.xword	0x271146aaf74601bd
	.xword	0xc23978d67150ddd0
	.xword	0xce9c56258cb6d04d
	.xword	0xf706c2652e3aff27
	.xword	0x88d4e8064a6ccc70
	.xword	0x91184c802f9e296d
	.xword	0x1ccc04513929d385
	.xword	0x659fd80d699840f9
	.xword	0x2913a9646378af27
	.xword	0x78ea89e98d67f4bd
	.xword	0xc3462638562e1626
	.xword	0x11e4dac8071a4a87
	.xword	0xb3b81daade975cac
	.xword	0x7366bba17cc871e4
	.xword	0x1c3dd78cb885bee5
	.xword	0xfe23b6a69614dafa
	.xword	0x6144329015357beb
	.xword	0x5ac44f7edad4cb7e
	.xword	0xaf4a87a8c597b897
	.xword	0x609b9427f7c3a363
	.xword	0xd2d451949a1377e4
	.xword	0xd8eca439bf740bc0
	.xword	0x487bf4e2869b6748
	.xword	0x002773984ab10f91
	.xword	0x6ab23360b4615349
	.xword	0x3afbee330e853516
	.xword	0x36b310b6ad631522
	.xword	0xf1cef3064d75e54a
	.xword	0xdb0f7d7345493ded
	.xword	0x3de72e4cc87d70da
	.xword	0x678169f9cfcda1cc
	.xword	0xb0d16e3315ca9ab9
	.xword	0x1ce9758c3ed060d9
	.xword	0x8d39941e45887c23
	.xword	0xddf633cc4f12f465
	.xword	0xc626b137fcf46672
	.xword	0xe7d098a9024f45d8
	.xword	0xd3f5b5726a3df2aa
	.xword	0x17ebd9fd168247b3
	.xword	0x6ba4f865149f68d6
	.xword	0xff6f3f35db400df9
	.xword	0x4ee685a92e61b427
	.xword	0x5ed01667db230261
	.xword	0x0dfdc3eed1d8c8b2
	.xword	0x2625643156f2fbf4
	.xword	0x5ff1ae2a09787426
	.xword	0x2419b4e28c13fd81
	.xword	0xa21ea00f8c924c2c
	.xword	0x4111954343e2429f
	.xword	0x165ffdc2475cd986
	.xword	0x899fc5f7cf45e88e
	.xword	0x9b9679cd64128cd2
	.xword	0x9a20ec63ebde83ba
	.xword	0x754a7f9f6a5f82da
	.xword	0x01f5059e7d88a16e
	.xword	0x8a0630bc1ad2925d
	.xword	0x0d7110d7ca96c04f
	.xword	0xa59606d40dd81d65
	.xword	0xadc339296983cd8f
	.xword	0xcbb5810f16939628
	.xword	0x8f1683f60f3d4137
	.xword	0xa61f4228f15bed56
	.xword	0x94e0116ad5c14281
	.xword	0x29fcd498c266e12f
	.xword	0x4ab200538d99bde6
	.xword	0xea38b0b7c160b291
	.xword	0x8a08171eb39a9175
	.xword	0xf53a2e2e50e7ffc7
	.xword	0x34456729cdb9e402
	.xword	0x4d9d489c6c2c412c
	.xword	0x8b45879041b2e7c9
	.xword	0x4fb008d18f66a7eb
	.xword	0x503c664a9db36dcf
	.xword	0xde127d198c1576e5
	.xword	0xf5383c0a0a73ee46
	.xword	0x0649743ea1445ef8
	.xword	0x8c5d5485c7e0f17e
	.xword	0x84d4182196fea519
	.xword	0x4848312fe6bbcd4c
	.xword	0xad4bfe38e5c21e76
	.xword	0x6edf5b91c1f537e2
	.xword	0xe33aa916da196653
	.xword	0xed21b288f1f67a3b
	.xword	0x84e1cc3024c1a3e8
	.xword	0x364a0f80d6f78e0f
	.xword	0xc74bf1823a3ef09c
	.xword	0xfe72821f5db0d98d
	.xword	0x22a451759a3dcfa6
	.xword	0xeb2e6536ea429f82
	.xword	0x9be3f5a5c73f3cdd
	.xword	0x10c1e0827e3f55be
	.xword	0x2062834107aec02a
	.xword	0xa5fde337e6d1fa0c
	.xword	0xe8dbe812b18df6bc
	.xword	0xca751e090e724d06
	.xword	0x4693636b1270f05e
	.xword	0x0865dd2a8fd2d280
	.xword	0xa092a13bbda7095b
	.xword	0xaea23eec820eced2
	.xword	0x1664eb79e36332b1
	.xword	0xe43311f00cb5df6f
	.xword	0x63bc73dd119a6e4f
	.xword	0x5cfd98e04db0ad63
	.xword	0x065693ff80d8eccc
	.xword	0x0d00c25054dbe2ba
	.xword	0x84ab8568153664a9
	.xword	0x89ee11ced1e40b52
	.xword	0x843f4a747fab0c89
	.xword	0x3be698f65b7ffd58
	.xword	0x43db63f04678884c
	.xword	0x25147ab687614047
	.xword	0xcf2c78f001a36d7c
	.xword	0x846f9cfaa7fa6759
	.xword	0xbdb8b8c7841f5d0d
	.xword	0xd17703e523975cd2
	.xword	0xc088ec24a46e7521
	.xword	0x3ec4f8d66ac88576
	.xword	0x6d48237db11d5929
	.xword	0x0264d10aebff67a5
	.xword	0x905dea90df69a8db
	.xword	0x0990b850e1f4f8fe
	.xword	0x8e0b7f5ea8571257
	.xword	0xb2c4043219249881
	.xword	0xfe92175793c03d14
	.xword	0x895adb8c7e8314c2
	.xword	0xf7d44a999fa52c8e
	.xword	0xd2c019b13c3c474c
	.xword	0xcce076604ad93582
	.xword	0x079f1ab069c0c81c
	.xword	0x6e9c63ace89a1f81
	.xword	0x3fc0bd5db8e2080c
	.xword	0xa99ea226ad55b269
	.xword	0x393d82e206f844c0
	.xword	0x2481471e0561adf6
	.xword	0x94b12352dc08c8d7
	.xword	0xf13e8d624c36357c
	.xword	0x2004971971e6afba
	.xword	0x10d7a23fa239450b
	.xword	0x71431e9f71f7face
	.xword	0x77379a9f6470d2e5
	.xword	0xc97dded47968ee95
	.xword	0x94648603bdb94060
	.xword	0x8ec2b927378813c7
	.xword	0x2a47bfbff53d48e9
	.xword	0xa32fda50a9953dc1
	.xword	0xc20914cc5d628c44
	.xword	0x8035f2c1c08711ae
	.xword	0xc32bfaa3b8805917
	.xword	0x05523c0c89b7089e
	.xword	0x4f7d8731acd1a50f
	.xword	0x11eb55ab5ba0c250
	.xword	0x9c7f796caec38329
	.xword	0xb9882a5e5fb8d066
	.xword	0x4fe27880dbdc6eff
	.xword	0x01c1c335a69773a2
	.xword	0xc5b03a829c7e1c8d
	.xword	0x2c9c3fe523f60509
	.xword	0xfd35e1ba04c398fc
	.xword	0x750c24247091d4b4
	.xword	0x7ac431ac5e459073
	.xword	0xf0a0895f5648f4a2
	.xword	0xd28b4f187b006048
	.xword	0x0cba3dbadf75026d
	.xword	0xb17a70205be18f4c
	.xword	0x97f8bf674dd69f6d
	.xword	0x9481063f59e6196f
	.xword	0xa8d33141b921dffc
	.xword	0xf08812162e78ddb4
	.xword	0x5fedfc785c360a8b
	.xword	0x5bfefb46345480d9
	.xword	0x18bbda814e32fb6f
	.xword	0xce22fcb4735120b6
	.xword	0x6d9510a4f2eacba2
	.xword	0x950f6b2e313c3d87
	.xword	0x55d84f5ef14bb16c
	.xword	0x7cd205546f14982e
	.xword	0xf85bfbb2b087b6c4
	.xword	0xc19f0e77323ef856
	.xword	0x3fd3fb5617f6c30d
	.xword	0x427ecbd3ec349e5a
	.xword	0x69b5f75d19179865
	.xword	0x8c605bdb66ad49a6
	.xword	0xa66dc062c35e9d10
	.xword	0xbefec7975b5f15fe
	.xword	0x2ec55e75633c216c
	.xword	0x13aeecc700718a6e
	.xword	0x582feaa1a4f3c01d
	.xword	0xc81cc7f1c5ffd3b5
	.xword	0x424097614347286d
	.xword	0x5fb2ad558355c0d8
	.xword	0xc6d8c53d934664d2
	.xword	0x91f6966f651c18aa
	.xword	0x8669d65ae6815671
	.xword	0xc7c620a57e0b44c3
	.xword	0x1a480783bebcd32a
	.xword	0xf77f8c49c1f815ff
	.xword	0xce5dedacafa1c6c6
	.xword	0xef0dbfdb6c3242ce
	.xword	0xa9160e62db11959b
	.xword	0xea082c395210ffdf
	.xword	0x774a2135308bffc9
	.xword	0x9005bf4ea493e415
	.xword	0xf0a302ad864f7eb4
	.xword	0x2853be0fa88fac10
	.xword	0x6b9d8dadef779be8
	.xword	0x13648d2ab1268573
	.xword	0x561d4622c97d95ea
	.xword	0xfdd8804055a056c5
	.xword	0xffd56d846b9534b5
	.xword	0x2acf9f9871e5fc3d
	.xword	0xc497ace91095d43b
	.xword	0xb483faf5f4ae5ba4
	.xword	0x28cf4e51c4f8ca70
	.xword	0x45964f1a9c64d561
	.xword	0xe5a1d8ac5070fd94
	.xword	0xaef1586ae8dcfc28
	.xword	0xa9d4a41e1aea8b5f
	.xword	0x5e36b9658149d808
	.xword	0xa602d77f06b4901e
	.xword	0xd2ce2754412c032b
	.xword	0x37e9f88a6b60b29b
	.xword	0xcbe9f015a9282502
	.xword	0x4a1279c7a56618ad
	.xword	0x384c10a0452522ff
	.xword	0xcc476f20211f1d36
	.xword	0xb7629ba2008e63e5
	.xword	0xb0ce13d925032b78
	.xword	0xf5cef9f272a3c9f3
	.xword	0x92b6924814b77c4e
	.xword	0x5aee380b466bbfec
	.xword	0x2e01f77248818259
	.xword	0x04b299d7573119ea



SECTION .ISEG_12 DATA_VA = 0x00000000c0100000
attr_data {
	Name	 = .ISEG_12,
	RA	 = 0x00000000c0100000,
	PA	 = ra2pa(0x00000000c0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xc5bcbf635a69535f
	.xword	0x9481647f9d78fbfc
	.xword	0xf007e72034eff2f7
	.xword	0xbd0c42890e3e3a2b
	.xword	0xacb216c962c298a4
	.xword	0x14621b745f45066e
	.xword	0x8435c5e1d2bd80d0
	.xword	0x27066627849c4cb3
	.xword	0x2bbc9dee7a5e2d77
	.xword	0xc416b80ca877e564
	.xword	0xa361cad0c3b2710b
	.xword	0xf91a74b9a6360300
	.xword	0xacb8e9b58e6d716e
	.xword	0xe6436b656906162d
	.xword	0x81c2606692c76385
	.xword	0x47ddbbd8afb914c1
	.xword	0xf1f082515b771ffc
	.xword	0xbf984ea005ea137a
	.xword	0x1fed1ec74750ade9
	.xword	0x87409ff918372014
	.xword	0x71f411375090d37b
	.xword	0x20ff62776d7e3b47
	.xword	0xd59eb0ea73fd4613
	.xword	0xca3a0f2fb607ccaa
	.xword	0x0e810968a6ef15b5
	.xword	0x2735caa4c2fac205
	.xword	0xc19e1b0b82492555
	.xword	0xf040a1bdc995516b
	.xword	0x70be9254e83f0f45
	.xword	0xd4376e0a74517ccb
	.xword	0xa0b1b0b92627a09e
	.xword	0x66852102253f96b2
	.xword	0x8f75859072775a4e
	.xword	0x324ed55769857a3c
	.xword	0x803cc2800f41db61
	.xword	0x5a95b35cb3acf8bc
	.xword	0x41314ad046545605
	.xword	0x3a11b3557e8d1b1b
	.xword	0x42e6a111528c18d2
	.xword	0xec12500fab3e9593
	.xword	0xe0ccb2fee0976fc8
	.xword	0x30fcc5e55635a425
	.xword	0xd96f22fc3079b154
	.xword	0x216d4f2b6bf95cf0
	.xword	0xe163b3bb74bfeb3f
	.xword	0xa0e8fa4834c04aa1
	.xword	0x0f5c001642f4eef6
	.xword	0x99ee9437009b5c26
	.xword	0xff1b6bf239eef1c3
	.xword	0x4ca37b5a0cad309a
	.xword	0xb17adb4b723d82f1
	.xword	0x0c88df581640b671
	.xword	0x8c36dbd2ca626287
	.xword	0x70416fa42156ddf2
	.xword	0x1a20a2ce90f6fb4f
	.xword	0x9eca749873954cfc
	.xword	0xb10425780bf724d8
	.xword	0xa36e7e97838dd898
	.xword	0x91c37745d8ec4ff8
	.xword	0xca5875436bb04349
	.xword	0x1a384c547279e861
	.xword	0x9a420908253cf9e5
	.xword	0xd64766a579273f03
	.xword	0xb80edb441b055c48
	.xword	0x71f6fb8872ec0510
	.xword	0x4ff39400bb78acc0
	.xword	0x3c0047a070ba4c43
	.xword	0x08eef1817662f897
	.xword	0x07a705a7c52fd0e3
	.xword	0xd9d8cfb5787c7566
	.xword	0x34b72d399a5c2545
	.xword	0xcb6926ce34671764
	.xword	0x98ca492b0ffe9be2
	.xword	0x4e1e5cd4568cc706
	.xword	0xd4a75d8246de5a4f
	.xword	0x69dcaf5c886d46c2
	.xword	0xc5aa2eea44b58d8a
	.xword	0xa3d30b9e412bc6ff
	.xword	0x92301c3352a44b64
	.xword	0x229839cff564c8a6
	.xword	0x6b6ae777740e10e0
	.xword	0x4146ae67c87c3284
	.xword	0xc292352def14caa4
	.xword	0xca1f5b52fddd9667
	.xword	0xd8f9b48a4ff3e661
	.xword	0x2cf6638fcefc582a
	.xword	0xe708d2cb92a7e0fc
	.xword	0x49f74fadec7002f2
	.xword	0x1d9ec59d5cddf5fc
	.xword	0x3cd6d81f7db5c2eb
	.xword	0x90599d00c5b66c4d
	.xword	0xe9de09c0dff63370
	.xword	0x377a2aece19cf0bc
	.xword	0x1d4b7fb411fc8a80
	.xword	0xa4778a5de39dfe0f
	.xword	0xbf6645f0cb2c2189
	.xword	0x458824c88741003d
	.xword	0x576e088018ce1347
	.xword	0xd74c72d9bfc28a4f
	.xword	0x69e2ac75aeb32e8d
	.xword	0x2622eab96d40162b
	.xword	0xb20491ef0b6c1b2d
	.xword	0xe3e975a8e8f314b3
	.xword	0x4e6351b49a8b1796
	.xword	0xd716eaa2e2e35b3d
	.xword	0xc2d6bb6b68830312
	.xword	0xf62db1eaeb3dd5fa
	.xword	0x8b16f90946a2c9fe
	.xword	0x7ce160bfb3bea3d4
	.xword	0x0efcecb16fc9e82d
	.xword	0x71e071863e09c6dd
	.xword	0xb96e1992270e475a
	.xword	0xde13c310cb326d87
	.xword	0xf17a0723e0d9d80f
	.xword	0x4bfb5656dfaff947
	.xword	0x98c3d2d4f3799f5b
	.xword	0xa0b5365eba177843
	.xword	0x5bf42bcc669cea9d
	.xword	0x23ac265ca2957169
	.xword	0xfed0e9a6d05b1fe0
	.xword	0x363c90602f750fcb
	.xword	0x5be62b66c9c05f6e
	.xword	0xc1a36a1c3267745d
	.xword	0x656f771e7335fb9c
	.xword	0x8255157cc0e49533
	.xword	0x69e036176e783efb
	.xword	0xb34598e7ed9fe4fa
	.xword	0x8bf9511b9f518c84
	.xword	0x2e8e048bc99e90cd
	.xword	0x48ab8423aff53be1
	.xword	0xecbafcc313d22f96
	.xword	0x028f745b0ffe8d99
	.xword	0xa5fa7ea67d3a8d90
	.xword	0xae4423256953c196
	.xword	0x0554822f2fd91c25
	.xword	0x2a616aa40c33ae31
	.xword	0x7d86afce105fd1f1
	.xword	0x1b35467eaa85fb4e
	.xword	0x1d2ce5d3db3e9e51
	.xword	0xe424f77987b63ac0
	.xword	0x9e6557b62d087e94
	.xword	0x4e65efd543d9b664
	.xword	0x924a7ba0f32d4380
	.xword	0xa86697a86de94b6d
	.xword	0x19a14f58c5f8e313
	.xword	0x953452f1e8580d4d
	.xword	0x637fb54304ec672e
	.xword	0xcbb75e56cc4eff1a
	.xword	0x461a8f4320a24854
	.xword	0x586f8d12019d9a6d
	.xword	0x0152ee6cd5a2ebd5
	.xword	0x32d57958b0fa6377
	.xword	0x96d205eb30d2e46a
	.xword	0x42bbfbc20f474c21
	.xword	0x8033372af9c7175a
	.xword	0x60bdae4ee46149fd
	.xword	0x25f145fe6117df6e
	.xword	0x4242d94ec2376b29
	.xword	0x229ace81089c534b
	.xword	0x31d4b1e4f9862c75
	.xword	0x7f2593f9742966d8
	.xword	0xdfb1bffa933d4142
	.xword	0x74c017b96209171b
	.xword	0xd43d867ac764a02c
	.xword	0xaadf81a5dee42eb6
	.xword	0x0652301cca8e3db9
	.xword	0x5e52685ea54c506f
	.xword	0x19f7bc723acf72fc
	.xword	0x25675fd89f8b76e8
	.xword	0xdc2906c811cabccf
	.xword	0xeaf674cfe09afc7f
	.xword	0x06c4348ea96f471e
	.xword	0x4a32fa2be4655131
	.xword	0xf05604f92f780a6c
	.xword	0xbd3319e3f1a8cb62
	.xword	0xf81ac4beaf38b2e0
	.xword	0x7977ef77ce30bff1
	.xword	0xf57688611d37ef63
	.xword	0xda32c89ccd767c9a
	.xword	0xa6dc226d1fe334f9
	.xword	0xd2d2564b18a3a5dd
	.xword	0x54c517e588f091a0
	.xword	0x6e8819601b87eed6
	.xword	0xf5c4914f2e53c370
	.xword	0xabb0e857dce4a6ca
	.xword	0x99c7105419df4bfb
	.xword	0x5d88d2810ec3ccdc
	.xword	0x89df1b7e7437d803
	.xword	0xf3c9377c95f3affd
	.xword	0xd28e39882e7c1ea2
	.xword	0x2a12654d5d877eae
	.xword	0xe4ae6bc0ccff3242
	.xword	0x6ef7223402afba29
	.xword	0xdba4dde93291e5a8
	.xword	0xcce77f8893622761
	.xword	0xe52311ed9a0233c7
	.xword	0xefc1f1c188f2d036
	.xword	0x75addbe98595daf7
	.xword	0x4b99f8a40a91701c
	.xword	0xe68b7e25a3127dde
	.xword	0x033db90069cac049
	.xword	0x4e34d7ee892bb7e4
	.xword	0xe0a0cc8c76df484d
	.xword	0x7ae334ffe0ffe431
	.xword	0x6fd70df444ef9b53
	.xword	0x6fe000d769320b5f
	.xword	0x986618b760eba7b3
	.xword	0xb968831957747868
	.xword	0x69d912c96a05d02f
	.xword	0x10509be0e9b1d438
	.xword	0xe3c78e3d5621af95
	.xword	0x18f0b0adf2ad4960
	.xword	0x417ddf09151341f1
	.xword	0xc05ca13b8a292974
	.xword	0xface342ba4440510
	.xword	0xd771d5fa6d673f0b
	.xword	0x91c4c10a5c920ac5
	.xword	0x46886b754ac1f3d5
	.xword	0x4f816c0150ad91e5
	.xword	0xfa6eeacd10b60bf2
	.xword	0x36fd76f7aa0a7df3
	.xword	0xf0612f0f1808d878
	.xword	0x5931e70c9cbf05a6
	.xword	0x8f422efbab58b7eb
	.xword	0x67fbb02c759aebca
	.xword	0x3782bf0b00e0ca55
	.xword	0x15c376d58c31e3b2
	.xword	0x270674b873f2b4c6
	.xword	0x6be564c1e22e921d
	.xword	0x339463a9619bb6df
	.xword	0xb8c4abcd3b5fb970
	.xword	0xa65aacc1a3170f0d
	.xword	0xe26aed35a04fe88e
	.xword	0x3ac56eec93a6611a
	.xword	0x10e63e59cc0c91ae
	.xword	0xeeadb534d0c49018
	.xword	0x4b177eacafb12e7e
	.xword	0xce06ed016d44d8dc
	.xword	0x05d631357025093f
	.xword	0x3ec0e3fd129b47a4
	.xword	0xa592593adcdba646
	.xword	0x99369d43aa6231ab
	.xword	0x3103b78b9fc7e3dd
	.xword	0xb1d816d50fb92926
	.xword	0xff19bd421d9b8f37
	.xword	0xcfa5d33598cebf55
	.xword	0xaf5416db9598e52c
	.xword	0xc73592f0e582fde3
	.xword	0x89941a9893ca0e3e
	.xword	0x5739c6284e93c07c
	.xword	0x9588e4bb5b668499
	.xword	0x6a124573e7db4fe8
	.xword	0x9632e65ea13c9ffb
	.xword	0xb2304fe77ac5e61e
	.xword	0x9aa9f0ccd6581e34
	.xword	0x89bd8c7547c8742f



SECTION .ISEG_13 DATA_VA = 0x00000000d0100000
attr_data {
	Name	 = .ISEG_13,
	RA	 = 0x00000000d0100000,
	PA	 = ra2pa(0x00000000d0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xe9b4a2a5b4b82f63
	.xword	0x04fcb4ea8a0cc7af
	.xword	0x66ff4fa751ecfa3d
	.xword	0xa1b388553f59959a
	.xword	0x6292ae08409907d9
	.xword	0x21389e733f3f31a8
	.xword	0x5fdbffd752a60d16
	.xword	0x72821250b0c2044b
	.xword	0xbf2b6d2d7fcbd4ce
	.xword	0x54387a2b2338afc3
	.xword	0x85fb4354b0c0a41f
	.xword	0x1815335d732f6497
	.xword	0x3f5b35e1c2f3368a
	.xword	0xd58c890cc09d25a5
	.xword	0xeee55ba02b1ec550
	.xword	0x97a35952aa2e5c38
	.xword	0x974a0180cab9ea67
	.xword	0x06ed41ddd61b12dc
	.xword	0x9eceac5c94b5ffea
	.xword	0x84307a005053ef11
	.xword	0xba0d761b93ca73f1
	.xword	0x813d64eff2650cee
	.xword	0x1afe73208553b561
	.xword	0xe3cc07189e05638c
	.xword	0xc7959103c16aa0f9
	.xword	0xdac0ac3bc79c9eaf
	.xword	0x36b44155fba7963a
	.xword	0x0eb716ca4479b821
	.xword	0x9897e7c596907190
	.xword	0xbc1b8eec7928a88f
	.xword	0x4ec7ac60ed97816a
	.xword	0x3109cc93ffac7805
	.xword	0xa159c544d93520bc
	.xword	0x5a0f9de8df1d05b4
	.xword	0xff65eb08da747f9d
	.xword	0x9ede233705dd7d5c
	.xword	0xdf5a0fca35b56194
	.xword	0x9faa2a692fcda934
	.xword	0x487bbb7133871d9b
	.xword	0xa0a61b44933b81b6
	.xword	0xe6d12570d49c8b87
	.xword	0x6cbf0b0299671f19
	.xword	0x46ae328d2f5aa27f
	.xword	0xc89c7d3e55acee2c
	.xword	0x164184640d1a11da
	.xword	0x56b02c909bd275f9
	.xword	0x2ece778ea3ffce0d
	.xword	0x31583fb125417905
	.xword	0xf09b3c0a76ae3d03
	.xword	0x9747c6ade08178e1
	.xword	0xd2adc39d3ca9edb8
	.xword	0x96f475d477aef51a
	.xword	0x1dd4339f280dbc58
	.xword	0xde188e385ec76776
	.xword	0x601272133019cda9
	.xword	0xff9e9641277e90b4
	.xword	0xc629e8293cc2ea8d
	.xword	0x7378b87d205ac925
	.xword	0x1751e32e9a4eda29
	.xword	0xf444bb71ec1217e0
	.xword	0x84fcb5d9a9044030
	.xword	0x1a25eeefca5ae600
	.xword	0xcecbd02d1a6b9ae7
	.xword	0x01fad0bc093e0dce
	.xword	0x9f732fa3b1975246
	.xword	0xd54e65bddd831fbb
	.xword	0x98aab18b3419a2ec
	.xword	0xdd1176efc0c30929
	.xword	0xb1394cc52b785fbe
	.xword	0x9d3d67dbb9fb433b
	.xword	0x7c755a69ae297537
	.xword	0x7b440a6b6f00cb36
	.xword	0xf1c355fb8d1af78d
	.xword	0x937186fa739e6202
	.xword	0x6dc86fe484f3bb43
	.xword	0x322ea2847d397cdb
	.xword	0x22ddd3d20bce92f6
	.xword	0xffe507bb36021184
	.xword	0xcee477223e57cc43
	.xword	0xdc4b9f75573ecef8
	.xword	0xd74af0d121bb9be6
	.xword	0xc38d32d724170131
	.xword	0x4ca7c5bbf97b37a3
	.xword	0x3e04b2f0548aa194
	.xword	0x9eae91ab86442574
	.xword	0x1a18c51eff5f5b4c
	.xword	0x80660e6a366d2f90
	.xword	0xb4d0fc80db0e1fa3
	.xword	0xbe14e5a927729e74
	.xword	0xc97056977549fbe5
	.xword	0x95ffaefaf507224e
	.xword	0x9f66649cc00781f7
	.xword	0xbf46fc71d1b7ccbd
	.xword	0x7e80366e4e2fbbcc
	.xword	0xf907d2d42df7527c
	.xword	0xda753ecb734ceeec
	.xword	0x8781a281abee2d7c
	.xword	0xfe00281ec6d80cdd
	.xword	0x2f479c20c2bbf6ee
	.xword	0x6c2aa0848581498a
	.xword	0x7e1ebf4603720671
	.xword	0xeb0ef6aa2597d5ac
	.xword	0x4fe3b37394fd454f
	.xword	0xab8f5e226874838a
	.xword	0xe95d4ea8a152a7dc
	.xword	0xaab7a2ebd6ba7643
	.xword	0x8284ba7d634634fa
	.xword	0x11e2c7ef3c4eb783
	.xword	0x70be12ec8ad813f2
	.xword	0xa1dcdeffe73682cf
	.xword	0x295bb73599740527
	.xword	0x3014c86e6ec08734
	.xword	0x7430918100de4e1b
	.xword	0x842fb91f8003e50a
	.xword	0x56d4d067e42cc2e4
	.xword	0xc9b3b22e83b1aaa7
	.xword	0xfef7a8de681a8b4c
	.xword	0xa528f0283629cde0
	.xword	0x7dbcae551038af3c
	.xword	0xd3569d83f45ea1af
	.xword	0x3f697b2f1b9529ee
	.xword	0x1c57799a9e705601
	.xword	0xbd7005253c514a66
	.xword	0x1c177536c67f16a4
	.xword	0x9e3a85817307dc5b
	.xword	0x43ca664d04d682b4
	.xword	0x5fb493f39f684265
	.xword	0x71cc1078bbaf43b0
	.xword	0xeb6812cd409568f0
	.xword	0x27a4ae1d61509ab8
	.xword	0xf09b4ab912e341d0
	.xword	0x85f9f8fb1e48d95e
	.xword	0xa2df7c80a1ca09a8
	.xword	0xcd0fa996f10f372b
	.xword	0xe24e0dc004675f7b
	.xword	0x40604125be9e2ddc
	.xword	0xd31109bf6fefb194
	.xword	0x194175d5315dbe31
	.xword	0xcef7802c37cbd052
	.xword	0x83eeeda22620cbc1
	.xword	0x9d4bbe1bf8fdf0f7
	.xword	0x51142dee8fad3a1c
	.xword	0xafc66e388c4b6f7f
	.xword	0x44170835ac6833a9
	.xword	0x9db8f163cc63ffd6
	.xword	0x1b2ff57328c395a9
	.xword	0x14a6f3764570f8ba
	.xword	0x25380cc146efd5f9
	.xword	0x9b09ba628e1b17e7
	.xword	0x26558893dfd04832
	.xword	0x21aee206f52e0c85
	.xword	0xd492234951f023f0
	.xword	0xf1e9737a41540bf5
	.xword	0x5c1b7a3dee6f3bcd
	.xword	0x1ce6d00046e7845d
	.xword	0x74a2bf5819429e4b
	.xword	0xa2cff758ae184bb9
	.xword	0x86be695ff57db144
	.xword	0xf8610e13a2f3eee3
	.xword	0x979c994343dcc6ae
	.xword	0xacb3575b428fd1d4
	.xword	0x52b9a02d4720c917
	.xword	0xab93d364ebebdbc3
	.xword	0xb469d8136872067d
	.xword	0xb620ba9d103ff21e
	.xword	0xbf18ba19b5d4b05b
	.xword	0xa01a0b76d5f7bb53
	.xword	0xaadc78052f8806d3
	.xword	0x817c9969216f2a2e
	.xword	0xc5cae82521f9068f
	.xword	0xa0f12a9492fd1670
	.xword	0xded013a3cbee1827
	.xword	0x423577317fa9291c
	.xword	0x4124dee35869852a
	.xword	0xe6094b5e2ee9c524
	.xword	0x7135d020a8e9f13a
	.xword	0xf9426006cac0cca9
	.xword	0xb991d0acaccc624d
	.xword	0x4f9bb4cb966ec300
	.xword	0x2175854eab62c48f
	.xword	0xd9c893ae26db6b5e
	.xword	0x6b511d6fa8730a35
	.xword	0x5fdaaad20af9f30d
	.xword	0x250167998884f082
	.xword	0x9f77aac60c2e9bad
	.xword	0xcec52baa22a30402
	.xword	0x6a9a29b1cbaf42d0
	.xword	0xb3f16e9fcd1342fb
	.xword	0xcb27489273964ddf
	.xword	0xe1a9abb56bc9bda7
	.xword	0x83ac3c59e34c3742
	.xword	0x95f34d9a15467f5c
	.xword	0xb9bb91ba07510599
	.xword	0xcbff64b54530f1c0
	.xword	0x716aa228a63a2d8b
	.xword	0x5a02f73d102961b1
	.xword	0xf66c58ef15253673
	.xword	0x399bfb0dd9cd9c02
	.xword	0x3244d636618c1b7a
	.xword	0x1fbc93217794f252
	.xword	0xe5de9f6da75f37ec
	.xword	0x414fc7576e420613
	.xword	0xfa5d10fd3acc2484
	.xword	0x7486783c4b0854a0
	.xword	0x9b7d369250b2fee1
	.xword	0xcce7382ee4c488e7
	.xword	0xb45bfdc5248739d9
	.xword	0xc70c2b9f78b680af
	.xword	0x48b06b4b3c72a7b4
	.xword	0xd5822179fef85ecd
	.xword	0x5a646910941f600c
	.xword	0xdc35cfafa208aa3c
	.xword	0x5fbb3a5f8582eef5
	.xword	0x8707f71df1ecf868
	.xword	0x0c7fc602770491e6
	.xword	0xb5c76f66ce3cb3ec
	.xword	0x62f37eb3fd5a385d
	.xword	0xd21ec68195f77ac3
	.xword	0xc8ea598f69442eaa
	.xword	0xd3094ef5d7c75a8e
	.xword	0x98f83e8dea089620
	.xword	0x4f997beca1bc03d0
	.xword	0x06dfb14958f48ec0
	.xword	0xd627aaa5d56ddfd9
	.xword	0x94b6a2085f914b47
	.xword	0xc35f57c66429bc3d
	.xword	0x3a242fcfe35a62a4
	.xword	0xd9eea60fbfa9aace
	.xword	0x3ca8320dd02978f8
	.xword	0x9626869e5153b3c5
	.xword	0xb19bed2cd8721efd
	.xword	0x3acd2d105e54ab52
	.xword	0x327af105ed20bb6e
	.xword	0xf581e71760a595c3
	.xword	0x8958f6c33619c475
	.xword	0x8f3b795ba89bbce2
	.xword	0x7f2a0939231f5101
	.xword	0x9f430637b2d0edec
	.xword	0x09310be3f7c9a184
	.xword	0x2949f85e54ed78e5
	.xword	0x59e029fcdc7f26fa
	.xword	0xd8146f70b42a8fbe
	.xword	0xbe773620fe4698a1
	.xword	0x85b5de96b244ef77
	.xword	0xf17e9acfdadd6945
	.xword	0x8ba079ae4cb89fe2
	.xword	0xfc1b68bc53e47af4
	.xword	0x6585592809e9ea6d
	.xword	0x3d85ecc20c823dab
	.xword	0x8f7d5a5fd40d3eb9
	.xword	0xa00ba9b3242c9f08
	.xword	0x735706449271489f
	.xword	0x71535c7dcfe339f8
	.xword	0x1b189554a28b9840
	.xword	0xd03697f3d10e1dd1
	.xword	0xc1487a3ed7a2dc29



SECTION .ISEG_14 DATA_VA = 0x00000000e0100000
attr_data {
	Name	 = .ISEG_14,
	RA	 = 0x00000000e0100000,
	PA	 = ra2pa(0x00000000e0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xa85bb9d282be84eb
	.xword	0x9bcbefe4c7796d16
	.xword	0xda78d4c50a5515af
	.xword	0x98b115d60c8df42d
	.xword	0x428ed97ec6d2de26
	.xword	0x1247af5cb992da81
	.xword	0x0e848ee5d131714d
	.xword	0x5c2f51b559f9eb4e
	.xword	0x9216c872ab857417
	.xword	0xe40f838fffc5d5ea
	.xword	0x67f92577a3cc208a
	.xword	0xf33e0e70104db8a2
	.xword	0x64df6329f5c2efde
	.xword	0x703811297d21b720
	.xword	0xfc0ebd3a0229beb8
	.xword	0x7dfa8b55617fb98a
	.xword	0x9e873c139b1b4cae
	.xword	0xceff2743c1edb3c3
	.xword	0x8f5f0e659db5eff8
	.xword	0x0909357a593cba7d
	.xword	0xa53f1d95ad49c5f4
	.xword	0xee83b18a76c18803
	.xword	0x58b7e3176b405e56
	.xword	0x2eeaf297f24a4bfa
	.xword	0x7d1a8822db7b4c52
	.xword	0x5ee0f1bd8852bfc1
	.xword	0x59fa50b5fb7f8666
	.xword	0x445bad38ee45f82c
	.xword	0x5bf1cd7116b4f70c
	.xword	0x45a0786ccae461c6
	.xword	0x7c345de50ef47876
	.xword	0x33fe572057acb9f5
	.xword	0xf464109ea6b19e16
	.xword	0x549700fba1963c4a
	.xword	0xccb0c99370c10b95
	.xword	0xefb947dd4453e93e
	.xword	0xe259aa0c00b540bc
	.xword	0x0c95f82b07d84e97
	.xword	0x07a2183d5a9b6a77
	.xword	0x423eae8ec00b7b0d
	.xword	0x05d24826222bcc61
	.xword	0x03dc42ee52e2c709
	.xword	0x24880510784df1dc
	.xword	0x200351bdd51c085c
	.xword	0x4deeab995222d83b
	.xword	0xe479ce8adf71f51e
	.xword	0x338ee711a5da2f52
	.xword	0xfa522a1d8fd9e91f
	.xword	0xdf9bfb78e5b80957
	.xword	0x5e2898c65abc7d89
	.xword	0x0782acbf84d78865
	.xword	0x3410a4d0f29809cd
	.xword	0xe561b6763f1c7269
	.xword	0x7b6aadb2b4ada741
	.xword	0x08bc536221b7a009
	.xword	0x2f8c67c7d51672c0
	.xword	0x165616ce2f90acfb
	.xword	0x42c05ddf8cb2ad09
	.xword	0xd214d3af921ca8cf
	.xword	0x649043111d0bf24c
	.xword	0xb7c0373190d3d153
	.xword	0x3f31a037bca88f65
	.xword	0xcef9c4beb58e1145
	.xword	0x292eccb7631cbe89
	.xword	0x8292dfe941ef5e16
	.xword	0x4c21858d7a8d5343
	.xword	0x8017238c1612ce50
	.xword	0x3ac0d2942a013832
	.xword	0x0a5c63e742516d66
	.xword	0xd4a8d6efeba3644b
	.xword	0x64efa39e3702cbf6
	.xword	0x064b7b5c5649622f
	.xword	0xc4c612dd265fc193
	.xword	0x2223e04c5f37b43d
	.xword	0x81a679f2c33c6684
	.xword	0xd6ed593dc31bab7c
	.xword	0xcedc9f737d70c1f0
	.xword	0xf4b46f445e849b68
	.xword	0xf11bdc24f01bd23d
	.xword	0x7d819675f205c2e9
	.xword	0xa536ff4219c3d66c
	.xword	0x8d292d7f4697941c
	.xword	0x3fa0ea61b36f58dd
	.xword	0xa4b862803be06c79
	.xword	0xdbbf3720ae4cd2e8
	.xword	0xb10485bd7be32dd3
	.xword	0xd7586e3f48678966
	.xword	0x1fb77249c7d5a2f4
	.xword	0xba0fc80359a52d79
	.xword	0x7026f10479361539
	.xword	0x105be59379a9db62
	.xword	0x332f67c90a41212b
	.xword	0x530a09facb91dcd2
	.xword	0x3fbc6fa33490793c
	.xword	0x0d9e071a1b263aa1
	.xword	0xa37b3cb028993876
	.xword	0xe78fe0da1b583379
	.xword	0x5c597ee41f13499a
	.xword	0x47e4b4667ac6f6e4
	.xword	0xdcdb39e9a8194daf
	.xword	0xe2ee3b8f07f8e4eb
	.xword	0x977b0355c1531cc0
	.xword	0x1c19656bc8ea2dc9
	.xword	0x8078f02255bf905c
	.xword	0x2f30142f689f9094
	.xword	0xe40ee1624ea7c95e
	.xword	0x949a3d76cb32ec97
	.xword	0x7835bc1e1375df79
	.xword	0x8c180490ba7f3c12
	.xword	0x09dd0e37d4fe01bf
	.xword	0x4ac0568d66b1c6f8
	.xword	0x609a7659b97ce2df
	.xword	0x6ed25a57834f8152
	.xword	0xe3be01f4ab02ceed
	.xword	0x938f79eb63d8b8e7
	.xword	0xf76df59fb1252e0f
	.xword	0x93767f999e9afd99
	.xword	0x8327baa48b69e354
	.xword	0x8ca2063507e8f24b
	.xword	0x08eae42456b32ae1
	.xword	0x0e77f7a51001b102
	.xword	0x5ee0d17542c89370
	.xword	0xd0471d569227aba2
	.xword	0xd6176f31196098f1
	.xword	0x66e11667f3b1824c
	.xword	0xfafae7bb6a14c736
	.xword	0xb3bb4d592c3cdee7
	.xword	0xb9786e4fa60fe0f6
	.xword	0x9013e941a1d3bd8b
	.xword	0xf9a0578bf3abce3d
	.xword	0xaa4141c0921e5851
	.xword	0xe94ed4507348d0e8
	.xword	0x0a737a248034d7d8
	.xword	0xef8011e084eb6fc4
	.xword	0x3910d56d93013491
	.xword	0xbd76e3cf3dfee660
	.xword	0xf664e3728a937b5d
	.xword	0x0fcbfa28ff450a18
	.xword	0x94d3ae3eed293636
	.xword	0xcb38c6296cc511c4
	.xword	0xd59d103dc767bdeb
	.xword	0xa60b6297abec8b71
	.xword	0x181373ff5980818a
	.xword	0x055b0baeade2786b
	.xword	0xeea977cb2b5bf30f
	.xword	0x413f68976d0e3404
	.xword	0x26aa19a832c02d1a
	.xword	0x72ff108dc30d896f
	.xword	0xe85bde915a73548b
	.xword	0x954feee3ec6d9292
	.xword	0x09f619d4bdb44573
	.xword	0x35d117de49d2aba2
	.xword	0xa04dfb20c8ec3260
	.xword	0x2006e8a54ded7ffb
	.xword	0xb359758279c07858
	.xword	0x97744a70a6f3b616
	.xword	0x07cbb74a93f9fad8
	.xword	0xe13f2a3e0272d343
	.xword	0xf6a04af5b386444b
	.xword	0x175a95a5f780b080
	.xword	0x20f9d5e844bc11b0
	.xword	0x59debb0142861722
	.xword	0x081a7061683a3b32
	.xword	0x9e2c199bbd454618
	.xword	0x98b631e25e9143f6
	.xword	0xf8e86498e362dab1
	.xword	0x7a0d4b8ab12c0a7d
	.xword	0x0245b446c7b2d70b
	.xword	0xac7da2037617bcda
	.xword	0xfa6fb861f13f6cb5
	.xword	0x92565913a3f53017
	.xword	0x70a2eceefde4b221
	.xword	0x843b0f090cc5f761
	.xword	0x730d06bda1d63789
	.xword	0x94d92dc4203a91fb
	.xword	0xfe6d0ad35a5f63fe
	.xword	0xa474963ef9c17084
	.xword	0x769bbee79417d335
	.xword	0x450159084ba99631
	.xword	0x47d2216a498d396a
	.xword	0xc2a08cd6b93fe667
	.xword	0x754a7b2871b8b8e0
	.xword	0x4487540e7deebaa8
	.xword	0xea6b89951ab79971
	.xword	0x2cfd6fd387c9b359
	.xword	0x4ceefd3c331dc0aa
	.xword	0x5badb1a83e96dc81
	.xword	0x390bc9e0bcc785ac
	.xword	0xf79f9407333cbe18
	.xword	0xae86ca543531a74b
	.xword	0x9a077f3eaf6fd22a
	.xword	0x88634c97b74fc2c2
	.xword	0xb328e0fca7c9fbaa
	.xword	0xb0e91a4675873c6d
	.xword	0xbbf8a453ddff3536
	.xword	0xcd6518058b635d59
	.xword	0x5cd3ba72ffadb16a
	.xword	0x4819039369d5ef04
	.xword	0xb2e9fb27dd22dbb6
	.xword	0x10920a6c9e0582f4
	.xword	0xc75a4ee4133e523f
	.xword	0xc82e2313a8d3af90
	.xword	0x307eda145a03ff47
	.xword	0x56b10051fc6cc350
	.xword	0x4369fcf24940717f
	.xword	0xe50a386116589b83
	.xword	0x74f8022c9cf16c2e
	.xword	0xf97a9a8acc752fe6
	.xword	0x1d64942bea1bb633
	.xword	0x45fad5b24f21f00c
	.xword	0x1549a63869401deb
	.xword	0x08912b4a26a928dc
	.xword	0xee05a54942a696be
	.xword	0xb8096c48ec281646
	.xword	0x4e4dedac6795e9b0
	.xword	0x8f2bb84388f0f68b
	.xword	0x43e6796949ef9a33
	.xword	0xbd7394b1f746e18b
	.xword	0x010065e9bbc644bc
	.xword	0x90fe53697861bd21
	.xword	0x218223474efcdef3
	.xword	0xc4d936fc2587c89d
	.xword	0xf697e189bc93547c
	.xword	0x3a662b9236cd9aba
	.xword	0x11d087a4d718cb43
	.xword	0x6b634f030b261f1d
	.xword	0xfd937fa9aced8210
	.xword	0x5d03c1577166f798
	.xword	0x3d1a8a4bc0300299
	.xword	0xab82acfe24ca646a
	.xword	0xf4273227cb142b6e
	.xword	0x9598bc26b95f785a
	.xword	0x70448f8a583fd82a
	.xword	0x8fc07cee8ace7750
	.xword	0xbcc6cefc4fea4a19
	.xword	0xc6b33e1e90a9e5f3
	.xword	0xce916462aae2a355
	.xword	0x708e467a160f8614
	.xword	0xb52315607a3d0dfc
	.xword	0x8b8eb283a6249ab8
	.xword	0x69bef660312ff45b
	.xword	0xc1a8a88b6c462ee6
	.xword	0x72914e7910af93fe
	.xword	0xce0b42cf594fca42
	.xword	0x598c5fc6c5be10be
	.xword	0xc33b8ef457c54060
	.xword	0x708433b5686e431d
	.xword	0xdea52eb89933965f
	.xword	0x0ae3df67dba93854
	.xword	0x9e8f16a31d91362e
	.xword	0x4e220b79b6db1b44
	.xword	0xdf48157f46bfaf7c
	.xword	0x0be120adc6a0c268
	.xword	0x224d7e9ecf7e74d6
	.xword	0x6c2d837ad3b50472
	.xword	0x2590675ad02c8e25



SECTION .ISEG_15 DATA_VA = 0x00000000f0100000
attr_data {
	Name	 = .ISEG_15,
	RA	 = 0x00000000f0100000,
	PA	 = ra2pa(0x00000000f0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xfeaaaec8e09423e3
	.xword	0x9dc155c2d561c9a5
	.xword	0x28c19f8913fd8935
	.xword	0x20fc945946547a02
	.xword	0x3c748b741291dc20
	.xword	0xec1ad8ab7f05b9ba
	.xword	0xd0f39b9e4bd91c9b
	.xword	0x998dbe15020d3f80
	.xword	0x82a74e4cfffabff2
	.xword	0xb4600d63431a8e4b
	.xword	0x979ba9894274cbd3
	.xword	0x501e377f1e40ca0e
	.xword	0xf1e0c70156e7d258
	.xword	0x9f7ba5dd89115e75
	.xword	0xb08cadc1cca3f996
	.xword	0xaa2d3670e12a568a
	.xword	0xc5b1b08a3ebee246
	.xword	0xad9aaf472b2ad9ed
	.xword	0xf08df0c21576e7ac
	.xword	0xccb2b2cb2ec01e68
	.xword	0xfb36869334f5a648
	.xword	0xdf91c0efa810f418
	.xword	0x9928d354ca10563d
	.xword	0xd0c87ec8f620b3d2
	.xword	0xd0b989d4de61d274
	.xword	0xc36f5c514ae96ca2
	.xword	0x7c3cd29a25cdad91
	.xword	0x1c8e05ccd67a77c2
	.xword	0x7ab3717a089e163b
	.xword	0x593e9b6ec6b64750
	.xword	0x3ad78a761f16a8a5
	.xword	0xaa2277adecfd8c99
	.xword	0x56ef95c4f96f2cda
	.xword	0x77f15124ea8d6ada
	.xword	0xab2c157f45bdd7bf
	.xword	0xbcf0a7d0a1bb9633
	.xword	0x64523dedf931a6d5
	.xword	0xe57447b7a342d1b1
	.xword	0x2daa88585b9fdf35
	.xword	0x7772f715f56707d9
	.xword	0xb1003f4c05de4d29
	.xword	0xc6180736623a241e
	.xword	0x57782cd0a6e7b393
	.xword	0x86721ac78aa9a58d
	.xword	0x0970a2ac7f659a58
	.xword	0xc8a003ace1f42bf0
	.xword	0x2453603a4a7efd40
	.xword	0x678ce62ffd8e81a3
	.xword	0xbac931285dad83f8
	.xword	0x4c64fa086673441f
	.xword	0xf966e71cbbe3bca0
	.xword	0x8b0999b5b466b842
	.xword	0x8197b1146e3287c3
	.xword	0x9ec03112ac8eac5e
	.xword	0x6b843a346f327fe7
	.xword	0x37b60d5d0503c434
	.xword	0x27701653493e9e51
	.xword	0x7182be40db27adb8
	.xword	0x13705a204468b14a
	.xword	0xc786705b304fd226
	.xword	0x2aa97d79adbb08f6
	.xword	0x68c9f233a9e9562f
	.xword	0xd8587799e45fd12f
	.xword	0x02302ebeb3ca7bd5
	.xword	0x5a6544c45700ef76
	.xword	0x0330e25a9f3db16f
	.xword	0x9a0774982e37ad12
	.xword	0x9d8799b4d20d5e73
	.xword	0x2ffda58cc3569bfa
	.xword	0x97df05dd48ccfed9
	.xword	0x3630a6f78e55f090
	.xword	0x8513fe7d1f3e7daf
	.xword	0x54928821e44c0172
	.xword	0x699fb94b212f5aee
	.xword	0x5906aac16ca8c15c
	.xword	0x2a42e7b284a9e04c
	.xword	0xbb5b8759d63fe50e
	.xword	0x7348c7e5aea4f49c
	.xword	0xab4398d193e34411
	.xword	0xf40b452b3670c823
	.xword	0x4b9402af2d7670af
	.xword	0xff0ac2fd86a3515b
	.xword	0xd16928ee8fb7ee94
	.xword	0x4e6792d3cc869672
	.xword	0x7c38a900c87267f6
	.xword	0x00155e0208a1e7f1
	.xword	0x658188a8b596ddec
	.xword	0xb40f4fe320afbef6
	.xword	0x98a06d74a68aebb5
	.xword	0x551db982a44ec63f
	.xword	0x919e5dc241771442
	.xword	0x591946ddb9f2a5b8
	.xword	0x11607120b7d45340
	.xword	0xc0111c2391fb20bf
	.xword	0xd41ab6248b0e8f5b
	.xword	0xeb67cdcc55f9aea1
	.xword	0xd9a667e5dbe65ba4
	.xword	0x7165d562d44ebd2b
	.xword	0x6146d389008f65d8
	.xword	0xf9852d5520b0f9a8
	.xword	0x608329dd01636d7c
	.xword	0x0f0425a5f9284d08
	.xword	0xcb40b370f0dc9524
	.xword	0x519712437587993f
	.xword	0xcd6d3b8ac40439d1
	.xword	0xab5f8ecb23af061c
	.xword	0x1be0b37b2204e345
	.xword	0x0bd2ac2912fe00bf
	.xword	0x042e1be590377d99
	.xword	0xf41e2ec296ffe3e2
	.xword	0x2dec80dc97a75f60
	.xword	0x56a04d561767d1ed
	.xword	0x3ce80ad47a75d0d2
	.xword	0x705d7cda64d43f61
	.xword	0xeeb5a7c64312be73
	.xword	0x16bf94ebe7c54fbe
	.xword	0xe7fb75e76e64a4fe
	.xword	0x43821a3cd9ea5908
	.xword	0x23e36f26149f13ba
	.xword	0x153ac26c5e25386b
	.xword	0xf07028c296d41521
	.xword	0x8c88fba0ea482b39
	.xword	0x9b6fef9db435a9b1
	.xword	0x53979be3cabf794d
	.xword	0x4a7096b75fe21252
	.xword	0xb0b0269254726b3a
	.xword	0x210210fdabcc10bd
	.xword	0x7418c559feca784c
	.xword	0xcf7a0bbc90d91819
	.xword	0xf7856786339aa2e6
	.xword	0x4dce7f680c91caef
	.xword	0x7695ded3a4b9841a
	.xword	0x158731ee3c86cc60
	.xword	0xdec96fd28c8b8d31
	.xword	0x38d491bc6564b497
	.xword	0x67d4c9bc072ee78a
	.xword	0x9d872fef259d4312
	.xword	0x2c41faf90c2fa1cc
	.xword	0x43968430482a178f
	.xword	0xb118f85acb7a34c7
	.xword	0x27026988b2336dbd
	.xword	0x042e3dc24e805fd5
	.xword	0x87147a3e30bd357f
	.xword	0x8b8df81247c2fb8e
	.xword	0x5aa554614d8bb2a1
	.xword	0x5222b60ea19b0ab2
	.xword	0xb3415973a6b52e85
	.xword	0x24a76b6c41dfc834
	.xword	0xcd27092010a8f03f
	.xword	0x0553b0a0d2228d48
	.xword	0x4ab8524568108c16
	.xword	0xf0e54314b35afdc3
	.xword	0x75c6ccd16d214da8
	.xword	0x45bc2ace24dd9e63
	.xword	0xeffafcd5e4930013
	.xword	0x5a004f587703ef62
	.xword	0x2d9f5532a749f6da
	.xword	0x119ae04ba9beb503
	.xword	0xe5d2f2b95acb2f3e
	.xword	0xfb7d881f02cc5407
	.xword	0x6dc0fbbf8f946489
	.xword	0x634698663c19e0b4
	.xword	0xe076a6780681b8b6
	.xword	0x492eacf422c3c5d1
	.xword	0x1a14f3758ec815dc
	.xword	0x1d13fb9a4038b520
	.xword	0x141611303a075edb
	.xword	0x87a20e58ec4a6dfd
	.xword	0x2e5cfedb1d49e20c
	.xword	0xfbd02ee185c75fad
	.xword	0x7180b2af374b3212
	.xword	0x67c7ed4ca356c41f
	.xword	0x04ae2115c083ac2a
	.xword	0xc2503453107803b9
	.xword	0xe65d45d5e86e5e27
	.xword	0x8cfd49fa7f223ace
	.xword	0x2a9f81b9de5bc087
	.xword	0xdeb862994d398e71
	.xword	0x85a87ce3824e277b
	.xword	0x8e5bf7e2d20e43da
	.xword	0xed94a55f73514f24
	.xword	0x229f9ff8dfff6039
	.xword	0x8af37d387cf84dfe
	.xword	0x7ccd60313ecdba71
	.xword	0x6e0feac6da155b2d
	.xword	0x835a0bb8a67595dc
	.xword	0x7414751d04e521f7
	.xword	0x3d7cea4028688ae5
	.xword	0xf01dc08471f2bec6
	.xword	0x07b8ad6213688048
	.xword	0x28a6deb0daf6837e
	.xword	0x0128bfd196ad7446
	.xword	0x828711bad6b3ffaf
	.xword	0x0ed320bb87647294
	.xword	0x75a1923f477704d9
	.xword	0x8a5644833d81c52e
	.xword	0xb50f77cfde40b802
	.xword	0xb5b18a749bee9e31
	.xword	0x72c991ed18bfcec0
	.xword	0x48680f1ca236f030
	.xword	0x953bd5fe76658413
	.xword	0x49130c1eba37f861
	.xword	0x90e282c90541549b
	.xword	0x9e05969124c919f8
	.xword	0x148b77d0021fe322
	.xword	0xf0dab972a976e72e
	.xword	0x9d2ea2f798a1e33e
	.xword	0x97b71df14e7787dd
	.xword	0xc68f4848bb22d1e5
	.xword	0xe4c94b76590d3fa8
	.xword	0x480c0f3fbc377842
	.xword	0xa8c9a2b5eb7305f1
	.xword	0x676a5b0f90848188
	.xword	0xae09c29e368d288e
	.xword	0x9718035caf40cb37
	.xword	0x9d7d3043ca0cf383
	.xword	0xd47525088626e656
	.xword	0x8ee87faaba23ace2
	.xword	0x2720406cb2eff922
	.xword	0xe586deadb1a3a7a1
	.xword	0xe9cc78c0ebde8496
	.xword	0x8f29f0c4f1d30dfc
	.xword	0x4f51c49e1f2f25dd
	.xword	0xec57f2be477ab7d4
	.xword	0xaa449dd7a73bcc4c
	.xword	0xa685f66c4278175c
	.xword	0xc24a65e99c451d12
	.xword	0xe164a81bcea3e8ff
	.xword	0x24937c4adbfb6297
	.xword	0xc2fe21884263cb3d
	.xword	0x409812a7bf27bf48
	.xword	0x6c73027edb6a24ce
	.xword	0xaa1308f428745e2c
	.xword	0xc628ec1135a9d078
	.xword	0xbb7a74338e69f50a
	.xword	0x2dcc20a3490f051f
	.xword	0x5a4914fc8aae6d2e
	.xword	0x3c2b9c616c1730bf
	.xword	0xc815fae064c224b7
	.xword	0x9d048d561504afc0
	.xword	0x5723a4ae109a0581
	.xword	0xbb1c6b9f80fdb72d
	.xword	0xbd90601f6d2d3afc
	.xword	0x6d3d65643f1c8279
	.xword	0xacf3ee43d3a87edb
	.xword	0x28736ba0e0ff5bd4
	.xword	0xab6aac8930855572
	.xword	0x48d866d87feef9f2
	.xword	0x79fcf3ff1bb71cce
	.xword	0x4c8b7729788bc732
	.xword	0xefec416a4e379d7b
	.xword	0xd4ab557bdaade5ec
	.xword	0x2423998f5b334c78
	.xword	0x37bc2f91676a99d3
	.xword	0x7575d6e55569bd9c
	.xword	0xfffd2fe7c1159fbe



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   uint64 b_DATA_ARRAY[12000], h_DATA_ARRAY[12000], w_DATA_ARRAY[12000], x_DATA_ARRAY[12000];
!!#   uint64 b_ADDR_ARRAY[12000], h_ADDR_ARRAY[12000], w_ADDR_ARRAY[12000], x_ADDR_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 addr_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
!!#   int b_wr_cntr = 0;
!!#   int b_rd_cntr = 0;
!!#   int h_wr_cntr = 0;
!!#   int h_rd_cntr = 0;
!!#   int w_wr_cntr = 0;
!!#   int w_rd_cntr = 0;
!!#   int x_wr_cntr = 0;
!!#   int x_rd_cntr = 0;
!!#   int a_addr_sel = 0;
!!#   int a_wr_cntr = 0;
!!#   int a_rd_cntr = 0;
!!#   int b_a_wr_cntr = 0;
!!#   int b_a_rd_cntr = 0;
!!#   int h_a_wr_cntr = 0;
!!#   int h_a_rd_cntr = 0;
!!#   int w_a_wr_cntr = 0;
!!#   int w_a_rd_cntr = 0;
!!#   int x_a_wr_cntr = 0;
!!#   int x_a_rd_cntr = 0;
!!#   int i =0;
!!#   int j =0;
!!#   uint64 jbi0, jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr,jbi_config,mem_ad;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
!!# 
!!#   int sjm0_w_mask = 0, sjm1_w_mask = 0;
!!#   int m_tmp = 0;
!!#   uint64 mask = 0;
!!#   int sjm_rd0 = 0, sjm_wr0 = 0, sjm_rd1 = 0, sjm_wr1 = 0;
!!#   int sjm4_dat = 0, sjm5_dat = 0, sjm4_cnt = 0, sjm5_cnt = 0;
!!#   int sjm0_data[8][16];
!!#   int sjm1_data[8][16];
!!#   uint64 sjm0_addr[8], sj4_ad = 0;
!!#   uint64 sjm1_addr[8], sj5_ad = 0;
!!# 
!!#   int sjm_rd0_io = 0, sjm_wr0_io = 0, sjm_rd1_io = 0, sjm_wr1_io = 0;
!!#   int sjm4_cnt_io = 0, sjm5_cnt_io = 0;
!!#   int sjm0_data_io[8][16];
!!#   int sjm1_data_io[8][16];
!!#   uint64 sjm0_addr_io[8];
!!#   uint64 sjm1_addr_io[8];
!!# 
!!#   int sjm_rd0_io1 = 0, sjm_wr0_io1 = 0, sjm_rd1_io1 = 0, sjm_wr1_io1 = 0;
!!#   int sjm4_cnt_io1 = 0, sjm5_cnt_io1 = 0;
!!#   int sjm0_data_io1[8][16];
!!#   int sjm1_data_io1[8][16];
!!#   uint64 sjm0_addr_io1[8];
!!#   uint64 sjm1_addr_io1[8];
!!# 
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
!!#   int     rnd_n,b_sz;
!!# 
!!#   int int_cnt = 0;
!!#   int fr_time = 0;
!!#   int total_int[32];
!!# 
!!# #define ISEG	0
!!# #define UDATA1	1
!!# #define MY_HYP_SEC	2
!!# #define NCDATA0	3
!!# #define NCDATA1	4
!!# #define NCDATA2	5
!!# #define NCDATA3	6
!!# #define NCDATA4	7
!!# #define NCDATA5	8
!!# #define NCDATA6	9
!!# #define PAGE1A	10
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 105, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 107, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 108, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 109, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 110, wt_sj, "{50}");
!!#   IJ_set_rvar ("diag.j", 111, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 114, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 115, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 116, Rv_addr_sel, "3'brrr");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 121, Rv_memaddr_pattern_int,
!!#         "23'{0},"
!!# 
!!#         "21'b rrrrr 1110 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 129, Rv_memaddr_pattern_int1,
!!#         "23'{0},"
!!# 
!!#         "21'b rrrrr 1111 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 138, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 147, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 156, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 157, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 160, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 1000,"
!!#         "20'b 1110 0001 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#         !"20'b 0001 0000 rrrr 0000 0001,"
!!#         !"20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 176, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 190, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 203, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 215, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 227, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 239, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 251, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 261, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 272, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 280, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  // BASE
!!#   IJ_set_ropr_fld    ("diag.j", 289, ijdefault, Ft_Rs1, "{6,7,10,11,12,13,14}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 290, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   !IJ_set_ropr_fld    (Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 293, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 296, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 297, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 300, th_M, 0x1);
!!#   IJ_init_regs_by_setx ("diag.j", 301, th_M, 3, 1, Rv_rand64);
!!#   IJ_bind_thread_group("diag.j", 302, th_all, 0xffffffff); ! 8 cores 4 threads
!!#   IJ_printf ("diag.j", 303, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 307, th_M, "\tta\t0x30\n");
!!#   IJ_printf ("diag.j", 308, th_M, "\tmov\t0,\%%g4 \n");
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx\tncdata_base0, %%g1, %%g2 \n");
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx\t0x1000, %%g1, %%g3 \n");
!!#   IJ_printf ("diag.j", 311, th_M, "\tadd\t\%%g2, \%%g3, \%%g3 \n");
!!# 
!!#   IJ_printf ("diag.j", 314, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 315, th_M, "\tsetx    ncdata_base1, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 316, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 317, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 318, th_M, "\tsetx 0x7766554433221100, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 319, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 320, th_M, "\t!add 0x0, %%g0, %%g2\n");
!!#   IJ_printf ("diag.j", 321, th_M, "\tadd 0x020, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 322, th_M, "\t!setx 0x800e000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 323, th_M, "\tstloop0:\n");
!!#   IJ_printf ("diag.j", 324, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 325, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 326, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 327, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 328, th_M, "\tbne stloop0\n");
!!#   IJ_printf ("diag.j", 329, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 330, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 331, th_M, "\tsetx    user_data_start, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 332, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 333, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 334, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 335, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 336, th_M, "\tdstloop6:\n");
!!#   IJ_printf ("diag.j", 337, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 338, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 339, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 340, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 341, th_M, "\tbne dstloop6\n");
!!#   IJ_printf ("diag.j", 342, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 343, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 344, th_M, "\tsetx    ncdata_base0, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 345, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 346, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 347, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 348, th_M, "\t!add 0x1, %%g0, %%g2\n");
!!#   IJ_printf ("diag.j", 349, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 350, th_M, "\t! FAKE DMA space\n");
!!#   IJ_printf ("diag.j", 351, th_M, "\t!setx 0x8010000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 352, th_M, "\tstloop1:\n");
!!#   IJ_printf ("diag.j", 353, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 354, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 355, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 356, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 357, th_M, "\tbne stloop1\n");
!!#   IJ_printf ("diag.j", 358, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 359, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 360, th_M, "\tsetx    ncdata_base2, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 361, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 362, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 363, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 364, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 365, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 366, th_M, "\t!setx 0x800f000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 367, th_M, "\tstloop2:\n");
!!#   IJ_printf ("diag.j", 368, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 369, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 370, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 371, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 372, th_M, "\tbne stloop2\n");
!!#   IJ_printf ("diag.j", 373, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 374, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 375, th_M, "\tsetx    ncdata_base3, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 376, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 377, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 378, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 379, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 380, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 381, th_M, "\t!setx 0xc000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 382, th_M, "\tstloop3:\n");
!!#   IJ_printf ("diag.j", 383, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 384, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 385, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 386, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 387, th_M, "\tbne stloop3\n");
!!#   IJ_printf ("diag.j", 388, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 389, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 390, th_M, "\tsetx    ncdata_base4, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 391, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 392, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 393, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 394, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 395, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 396, th_M, "\t!setx 0xd000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 397, th_M, "\tstloop4:\n");
!!#   IJ_printf ("diag.j", 398, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 399, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 400, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 401, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 402, th_M, "\tbne stloop4\n");
!!#   IJ_printf ("diag.j", 403, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 404, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 405, th_M, "\tsetx    ncdata_base5, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 406, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 407, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 408, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 409, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 410, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 411, th_M, "\t!setx 0xe000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 412, th_M, "\tstloop5:\n");
!!#   IJ_printf ("diag.j", 413, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 414, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 415, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 416, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 417, th_M, "\tbne stloop5\n");
!!#   IJ_printf ("diag.j", 418, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 419, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 420, th_M, "\tsetx    ncdata_base6, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 421, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 422, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 423, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 424, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 425, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 426, th_M, "\t!setx 0xf000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 427, th_M, "\tstloop6:\n");
!!#   IJ_printf ("diag.j", 428, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 429, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 430, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 431, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 432, th_M, "\tbne stloop6\n");
!!#   IJ_printf ("diag.j", 433, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 434, th_M, "\tmembar 0x40\n");
!!#   IJ_printf ("diag.j", 435, th_M, "\twr    %%g0, 7, %%fprs\n");
!!#   IJ_printf ("diag.j", 436, th_M, "\tldda [%%g3]ASI_BLK_P, %%f0\n");
!!# 
!!#   IJ_printf ("diag.j", 440, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 441, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 442, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 443, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 444, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 445, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 446, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
!!# 
!!#   IJ_th_fork_group("diag.j", 448, th_all);
!!# 
!!#   IJ_bind_file_group("diag.j", 451, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 452, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_printf ("diag.j", 456, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 457, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 458, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 460, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 462, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 463, sjm_4, "WAIT 5000\n");
!!#   IJ_printf ("diag.j", 464, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 466, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 467, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 468, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 469, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 471, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 472, sjm_4, "WAIT 5000\n");
!!#   IJ_printf ("diag.j", 473, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   !IJ_printf (th_M, "\tmov\t0, %%r8\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!# !  IJ_printf(th_M,"\tnop\n\tta T_GOOD_TRAP\n\tnop\n");
!!# !  IJ_printf(th_M,"\ttest_fail:\n\tta T_BAD_TRAP\n\tnop\n");
!!#   !IJ_printf (sjm_4, "\n\nBA LABEL_0\n");
!!#   !IJ_printf (sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 512,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 514,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 519,Seq_Start, NULL, 2);
!!#   IJ_th_sync( "diag.j", 520,0xffffffff,0);
!!#   IJ_th_join_group("diag.j", 521, th_all);
!!# 
!!#  for (i = 0; i < 32; i++) {
!!#   IJ_printf ("diag.j", 524, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",total_int[i]);
!!#   IJ_printf ("diag.j", 525, th_M, "\tsetx\t page1a, %%r1, %%r26\n");
!!#   IJ_printf ("diag.j", 526, th_M, "\tmov %d,%%r27\n",i);
!!#   IJ_printf ("diag.j", 527, th_M, "\tsll %%r27,3,%%r27\n");
!!#   IJ_printf ("diag.j", 528, th_M, "\tldx\t[%%r26 + %%r27], flagr\n");
!!#   IJ_printf ("diag.j", 529, th_M, "\tcmp\t%%r6, flagr\n");
!!#   IJ_printf ("diag.j", 530, th_M, "\ttne\t%%icc, T_BAD_TRAP\n");
!!#   !IJ_printf (th_M, "\tbne\tbad_end\n");
!!#   IJ_printf ("diag.j", 532, th_M, "\tnop\n");
!!#  }
!!# 
!!# IJ_printf("diag.j", 535, th_M,"\tnormal_end:\n");
!!# IJ_printf("diag.j", 536, th_M,"\tta      T_GOOD_TRAP\n");
!!# IJ_printf("diag.j", 537, th_M,"\t\n");
!!# IJ_printf("diag.j", 538, th_M,"\t\n");
!!# IJ_printf("diag.j", 539, th_M,"\tbad_end:\n");
!!# IJ_printf("diag.j", 540, th_M,"\tta      T_BAD_TRAP\n");
!!# 
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!#   SECTION .ISEG DATA_VA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}"
!!# 
!!#   attr_data {
!!#         Name = .ISEG,
!!#         RA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}",
!!#         part_0_d_ctx_nonzero_ps0_tsb,
!!#         TTE_G = 1, TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
!!#         TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
!!#         TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
!!#   }
!!#   enumerate {
!!#         DATA_VA
!!#  }
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!# 	{
!!# 		IJ_generate ("diag.j", 885, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            !block_ld  %rvar wt_bl |
!!#            !block_st  %rvar wt_bl |
!!#            store     %rvar  wt_ld |
!!#            sjm4      %rvar  wt_sj      |
!!#            sjm5      %rvar  wt_sj
!!# 
!!# ;
!!# 
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io | set_sjm4_int
!!# ;
!!# 
!!# set_sjm4_int : mSET_SJM4_INT   
!!#                 {
!!# 
!!#                  if (random()%1 == 0) {
!!#                    if(fr_time == 0 ) {
!!#                       for (i=0;i<32;i++) total_int[i] = 0;
!!#                       fr_time = 1;
!!#                     }
!!#                    sj4_ad =  IJ_get_rvar_val64("diag.j", 912, Rv_memaddr_pattern_int);
!!#                    m_tmp  = ( sj4_ad >> 36 ) & 0x1f;
!!# 
!!#                    total_int[m_tmp]++;
!!#                    IJ_printf ("diag.j", 916, sjm_4, "\n");
!!# 
!!#                      !sj4_ad =  IJ_get_rvar_val64(Rv_memaddr_pattern_int);
!!#                      IJ_printf ("diag.j", 919, sjm_4, "INT  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 920, Rv_memaddr_pattern_int);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                         if(i==2) int_cnt++;
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          data_st = int_cnt;
!!#                          !data_st = IJ_get_rvar_val32(Rv_rand32);
!!# 			 !IJ_update_rvar(Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 928, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 929, sjm_4, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 931, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 932, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                          int_cnt++;
!!#                   }
!!#                 }
!!# 
!!# ;  
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 944, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 947, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 949, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 950, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 954, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 955, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 956, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 957, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 959, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 960, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0 == 7) sjm_wr0 = 0; else sjm_wr0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b : mSET_SJM4_RD_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 973, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 978, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 982, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 983, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 985, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 986, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_m : mSET_SJM4_WR_M
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1000, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 1004, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1005, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 1022, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 1027, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1028, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1030, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1031, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1033, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1034, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1039, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1040, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1042, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1043, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_b_io : mSET_SJM4_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1060, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1063, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1065, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1066, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 1070, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1071, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1072, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 1073, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1075, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1076, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0_io == 7) sjm_wr0_io = 0; else sjm_wr0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b_io : mSET_SJM4_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1089, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 1094, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1098, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1099, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1101, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 1102, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_io == 7) sjm_rd0_io = 0; else sjm_rd0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_io : mSET_SJM4_WR_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1117, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1120, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 1122, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 1123, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1138, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1141, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1142, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1143, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1148, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1150, sjm_4, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr0_io1 == 7) sjm_wr0_io1 = 0; else sjm_wr0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_io : mSET_SJM4_RD_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1164, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1170, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1174, sjm_4, "0x%08x ",sjm4_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd0_io1 == 7) sjm_rd0_io1 = 0; else sjm_rd0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm4_wr_m_io : mSET_SJM4_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1189, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1191, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1193, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1199, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1200, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1227, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1233, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1234, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1237, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1239, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1248, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1250, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr0_m_io == 7) sjm_wr0_m_io = 0; else sjm_wr0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_m_io : mSET_SJM4_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1268, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1274, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1279, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1281, sjm_4, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_m_io == 7) sjm_rd0_m_io = 0; else sjm_rd0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io | set_sjm5_int
!!# ;
!!# 
!!# set_sjm5_int : mSET_SJM5_INT   
!!#                 {
!!# 
!!#                  if (random()%1 == 0) {
!!#                    if(fr_time == 0 ) {
!!#                       for (i=0;i<32;i++) total_int[i] = 0;
!!#                       fr_time = 1;
!!#                     }
!!#                    sj5_ad =  IJ_get_rvar_val64("diag.j", 1303, Rv_memaddr_pattern_int1);
!!#                    m_tmp  = ( sj5_ad >> 36 ) & 0x1f;
!!# 
!!#                    total_int[m_tmp]++;
!!#                    IJ_printf ("diag.j", 1307, sjm_5, "\n");
!!# 
!!#                      !sj5_ad =  IJ_get_rvar_val64(Rv_memaddr_pattern_int1);
!!#                      IJ_printf ("diag.j", 1310, sjm_5, "INT  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1311, Rv_memaddr_pattern_int1);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          data_st = IJ_get_rvar_val32("diag.j", 1315, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1316, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1317, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1318, sjm_5, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1320, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1321, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                   }
!!#                 }
!!# 
!!# ;  
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1332, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1335, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1337, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1338, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1341, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1342, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1343, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1344, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1346, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1347, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_wr1 == 7) sjm_wr1 = 0; else sjm_wr1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b : mSET_SJM5_RD_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1360, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1365, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1369, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1370, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1372, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1373, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_m : mSET_SJM5_WR_M
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1387, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1391, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1392, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1409, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1414, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1415, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1417, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1418, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1420, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1421, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1426, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1427, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1429, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1430, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_b_io : mSET_SJM5_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1447, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1450, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1452, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1453, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1457, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1458, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1459, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1460, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1462, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1463, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr1_io == 7) sjm_wr1_io = 0; else sjm_wr1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b_io : mSET_SJM5_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1476, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1481, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1485, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1486, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1488, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1489, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_io == 7) sjm_rd1_io = 0; else sjm_rd1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_io : mSET_SJM5_WR_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1505, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1508, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1510, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1511, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1526, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1529, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1530, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1531, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1536, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1538, sjm_5, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr1_io1 == 7) sjm_wr1_io1 = 0; else sjm_wr1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_io : mSET_SJM5_RD_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1552, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1558, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1562, sjm_5, "0x%08x ",sjm5_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd1_io1 == 7) sjm_rd1_io1 = 0; else sjm_rd1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm5_wr_m_io : mSET_SJM5_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1577, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1579, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1581, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1587, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1588, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1615, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1621, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1622, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1625, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1627, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1636, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1638, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr1_m_io == 7) sjm_wr1_m_io = 0; else sjm_wr1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_m_io : mSET_SJM5_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1656, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1662, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1667, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1669, sjm_5, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_m_io == 7) sjm_rd1_m_io = 0; else sjm_rd1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# !{
!!# 		!IJ_generate (th_all, $2);
!!# 		!IJ_generate (th_all, $3);
!!# 		!IJ_generate (th_all, $4);
!!# 
!!# 		!IJ_generate (th_all, $5);
!!# 		!IJ_generate (th_all, $6);
!!# 		!IJ_generate (th_all, $7);
!!# !}
!!# 
!!# set_addr:  set_memaddr %rvar  wt_alu
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR %rvar  wt_alu
!!#                 {
!!# 
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         !invalid_config = 1;
!!#                         !while (invalid_config) {
!!#                         !if (random()%2) {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr0_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr0_config);
!!#                         !} else {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr1_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr1_config);
!!#                         !}
!!#                         !if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         !invalid_config = 0;
!!#                         ! }
!!#                         !}
!!# 
!!#                         !IJ_printf (th_all, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !	IJ_printf (th_all, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_all, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                    if(random()%2 == 1) {
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1725, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1727, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1729, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1731, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1733, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1735, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1737, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1740, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1742, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1744, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1746, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1748, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1750, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1752, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1759, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1761, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1763, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1765, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1767, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1769, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1771, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1774, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1776, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1778, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1780, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1782, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1784, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1786, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!#                       }
!!#                      }
!!#         }
!!# ;
!!# 
!!# block_ld :  set_block_ld   %rvar  wt_bl
!!# ;
!!# set_block_ld :  mSET_BLOCK_LD %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1799, th_all, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1800, th_all, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1801, th_all, "\tldda\t[%%r14]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1802, th_all, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1803, th_all, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1804, th_all, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1805, th_all, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1806, th_all, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1808, th_all, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# block_st :  set_block_st   %rvar  wt_bl
!!# ;
!!# set_block_st :  mSET_BLOCK_ST   %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1819, th_all, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1820, th_all, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1821, th_all, "\tstda\t %%f0, [%%r14]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1822, th_all, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1823, th_all, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1824, th_all, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1825, th_all, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1826, th_all, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1828, th_all, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# load: gLOAD  %rvar  wt_ld 
!!# ;
!!# 
!!# store: gSTORE  %rvar  wt_st
!!# ;
!!# 
!!# alu: gALU  %rvar  wt_alu
!!# ; 
!!# 
!!# ! add only non-asi and then extend it ( add CASA later ) 
!!# atomics : tSWAP_R | tSWAP_I | tLDSTUB_R | tLDSTUB_I
!!# ;
!!# 
!!# atomics_asi : tSWAPA_R | tSWAPA_I | tLDSTUBA_R | tLDSTUBA_I | tCASA_I | tCASA_R | tCASXA_I | tCASXA_R
!!# ;
!!# 
!!# barier      : tMEMBAR | tSTBAR 
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
