// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas2_mul_core_rand_0.s
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
   random seed:	156723525
   Jal pio_rnd_basic4_usr_mode_sas2_mul_core.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

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

	setx 0xf56755c42f5c7ee6, %g1, %g0
	setx 0xa3b3de312be2ad3c, %g1, %g1
	setx 0x17797afe341fcf93, %g1, %g2
	setx 0xefe1adcf13668917, %g1, %g3
	setx 0x075a2fae1019b1f1, %g1, %g4
	setx 0x892309d0c7055cdb, %g1, %g5
	setx 0x0047770bd1312339, %g1, %g6
	setx 0xd4359765351602c4, %g1, %g7
	setx 0x784181b84ace0dbf, %g1, %r16
	setx 0xef08c6c6adf4a52d, %g1, %r17
	setx 0xa824b9327f5bcdb6, %g1, %r18
	setx 0x31104b85d24b2fe0, %g1, %r19
	setx 0x0bb7b848195e7218, %g1, %r20
	setx 0xc9e25944974258cc, %g1, %r21
	setx 0xb89bc129a87f2040, %g1, %r22
	setx 0xc766aae0bbf83f43, %g1, %r23
	setx 0xf1cc24a57bfccfd2, %g1, %r24
	setx 0xb36f928a99367cd0, %g1, %r25
	setx 0xcc12eda5d7695aac, %g1, %r26
	setx 0x34a08c902cef77b7, %g1, %r27
	setx 0x796f9c09200b00e8, %g1, %r28
	setx 0xe84329897e17d0ac, %g1, %r29
	setx 0x27092f920a7e5d3b, %g1, %r30
	setx 0xc54ee29424f632b2, %g1, %r31
	save
	setx 0x0e893e779bc5120e, %g1, %r16
	setx 0x541f8d7ee4a369b1, %g1, %r17
	setx 0xbe9f0766c4fcbb66, %g1, %r18
	setx 0x19f74919c5661bf5, %g1, %r19
	setx 0xc60022118afc0749, %g1, %r20
	setx 0x8a60611fb99dd604, %g1, %r21
	setx 0x8eae07c594857a89, %g1, %r22
	setx 0x67bf8ae8cdf7b419, %g1, %r23
	setx 0xacb5dace8fba42dc, %g1, %r24
	setx 0x7852b5c1ff9fdeb9, %g1, %r25
	setx 0xd83a8bb1ae0450c3, %g1, %r26
	setx 0x309279e863e1da20, %g1, %r27
	setx 0x14af6f2d146f429e, %g1, %r28
	setx 0xedb71e79eee4d1af, %g1, %r29
	setx 0xeb9cee9e23354366, %g1, %r30
	setx 0x9bd634726c927944, %g1, %r31
	save
	setx 0xfc088d700f9bf731, %g1, %r16
	setx 0x561403ec6676fd3a, %g1, %r17
	setx 0xec02d27ce8fab5b6, %g1, %r18
	setx 0x4cdb679dc7fd26b9, %g1, %r19
	setx 0xaf63392148cc24a3, %g1, %r20
	setx 0x097ec11d7a1bc573, %g1, %r21
	setx 0xd30e21908c8882cb, %g1, %r22
	setx 0xc40ea5cc4aa475d7, %g1, %r23
	setx 0xcdd5aec139c3cab5, %g1, %r24
	setx 0x37f2560764ccf1a5, %g1, %r25
	setx 0xbf0c6e0a5aa6a882, %g1, %r26
	setx 0xfff916d64c34544b, %g1, %r27
	setx 0xf0c2a4c68c0b5d60, %g1, %r28
	setx 0x0e3960ec86d15a65, %g1, %r29
	setx 0x01c0e815a23fb710, %g1, %r30
	setx 0xb5626b56611e7773, %g1, %r31
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
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
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
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec5a8008  ! 4: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe822a028  ! 5: STW_I	stw	%r20, [%r10 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b8008  ! 8: STD_R	std	%r18, [%r14 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51a010  ! 10: LDSH_I	ldsh	[%r6 + 0x0010], %r22
	.word 0xe0434008  ! 11: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xa8038008  ! 12: ADD_R	add 	%r14, %r8, %r20
	.word 0xec2ac008  ! 13: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe859a018  ! 14: LDX_I	ldx	[%r6 + 0x0018], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e038  ! 20: STW_I	stw	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e008  ! 23: STD_I	std	%r20, [%r7 + 0x0008]
	.word 0xe82aa038  ! 24: STB_I	stb	%r20, [%r10 + 0x0038]
	.word 0xe472c008  ! 25: STX_R	stx	%r18, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe823a008  ! 29: STW_I	stw	%r20, [%r14 + 0x0008]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe471e008  ! 34: STX_I	stx	%r18, [%r7 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4338008  ! 36: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe0034008  ! 37: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809c008  ! 41: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xe849a038  ! 42: LDSB_I	ldsb	[%r6 + 0x0038], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4728008  ! 47: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec030008  ! 48: LDUW_R	lduw	[%r12 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe023a020  ! 52: STW_I	stw	%r16, [%r14 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022e028  ! 55: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xec736010  ! 56: STX_I	stx	%r22, [%r13 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4ab6030  ! 59: ANDNcc_I	andncc 	%r13, 0x0030, %r18
	.word 0xe42b6010  ! 60: STB_I	stb	%r18, [%r13 + 0x0010]
	.word 0xe452c008  ! 61: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xec398008  ! 62: STD_R	std	%r22, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8130008  ! 64: LDUH_R	lduh	[%r12 + %r8], %r20
	.word 0xe021a030  ! 65: STW_I	stw	%r16, [%r6 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe421a008  ! 67: STW_I	stw	%r18, [%r6 + 0x0008]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 71: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe03b2018  ! 72: STD_I	std	%r16, [%r12 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0330008  ! 74: STH_R	sth	%r16, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe839a028  ! 79: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xe403a010  ! 80: LDUW_I	lduw	[%r14 + 0x0010], %r18
	.word 0xe829c008  ! 81: STB_R	stb	%r20, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe849c008  ! 84: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec728008  ! 85: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe03b0008  ! 86: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe8718008  ! 87: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72e000  ! 95: STX_I	stx	%r22, [%r11 + 0x0000]
	.word 0xec72c008  ! 96: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec036028  ! 97: LDUW_I	lduw	[%r13 + 0x0028], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01e010  ! 99: LDUW_I	lduw	[%r7 + 0x0010], %r22
	.word 0xe059c008  ! 100: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe80ac008  ! 101: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe803a000  ! 102: LDUW_I	lduw	[%r14 + 0x0000], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec73a020  ! 104: STX_I	stx	%r22, [%r14 + 0x0020]
	.word 0xec298008  ! 105: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe8432008  ! 106: LDSW_I	ldsw	[%r12 + 0x0008], %r20
	.word 0xe05ae020  ! 107: LDX_I	ldx	[%r11 + 0x0020], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1aa000  ! 114: LDD_I	ldd	[%r10 + 0x0000], %r22
	.word 0xec328008  ! 115: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe029c008  ! 116: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80b2000  ! 119: LDUB_I	ldub	[%r12 + 0x0000], %r20
	.word 0xe852e038  ! 120: LDSH_I	ldsh	[%r11 + 0x0038], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec738008  ! 122: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe0536018  ! 123: LDSH_I	ldsh	[%r13 + 0x0018], %r16
	.word 0xe8328008  ! 124: STH_R	sth	%r20, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4018008  ! 126: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe05aa030  ! 127: LDX_I	ldx	[%r10 + 0x0030], %r16
	.word 0xe85b6028  ! 128: LDX_I	ldx	[%r13 + 0x0028], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45aa038  ! 132: LDX_I	ldx	[%r10 + 0x0038], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec59c008  ! 134: LDX_R	ldx	[%r7 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec718008  ! 138: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe071a018  ! 139: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xe032c008  ! 140: STH_R	sth	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe059a028  ! 142: LDX_I	ldx	[%r6 + 0x0028], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec4ae018  ! 145: LDSB_I	ldsb	[%r11 + 0x0018], %r22
	.word 0xec72e008  ! 146: STX_I	stx	%r22, [%r11 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05b4008  ! 148: LDX_R	ldx	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec428008  ! 152: LDSW_R	ldsw	[%r10 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812a020  ! 154: LDUH_I	lduh	[%r10 + 0x0020], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec71e018  ! 156: STX_I	stx	%r22, [%r7 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec034008  ! 159: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe40b6038  ! 160: LDUB_I	ldub	[%r13 + 0x0038], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0528008  ! 163: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49c008  ! 166: LDSB_R	ldsb	[%r7 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe82a8008  ! 175: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xec598008  ! 176: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe453a020  ! 177: LDSH_I	ldsh	[%r14 + 0x0020], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 179: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xec49a038  ! 180: LDSB_I	ldsb	[%r6 + 0x0038], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012a010  ! 182: LDUH_I	lduh	[%r10 + 0x0010], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31e028  ! 186: STH_I	sth	%r22, [%r7 + 0x0028]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe873a028  ! 189: STX_I	stx	%r20, [%r14 + 0x0028]
	.word 0xe0718008  ! 190: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe033a008  ! 191: STH_I	sth	%r16, [%r14 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe052c008  ! 194: LDSH_R	ldsh	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe411a030  ! 196: LDUH_I	lduh	[%r6 + 0x0030], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe071e038  ! 198: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe8538008  ! 199: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe822e038  ! 201: STW_I	stw	%r20, [%r11 + 0x0038]
	.word 0xa80ba028  ! 202: AND_I	and 	%r14, 0x0028, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec732020  ! 206: STX_I	stx	%r22, [%r12 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 215: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe03b6008  ! 216: STD_I	std	%r16, [%r13 + 0x0008]
	.word 0xe0198008  ! 217: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xec51e030  ! 218: LDSH_I	ldsh	[%r7 + 0x0030], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 221: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe00ac008  ! 222: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe00b6020  ! 223: LDUB_I	ldub	[%r13 + 0x0020], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe041a028  ! 225: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	.word 0xec338008  ! 226: STH_R	sth	%r22, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe04aa010  ! 229: LDSB_I	ldsb	[%r10 + 0x0010], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 232: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe05ba018  ! 234: LDX_I	ldx	[%r14 + 0x0018], %r16
	.word 0xe0136030  ! 235: LDUH_I	lduh	[%r13 + 0x0030], %r16
	.word 0xec3aa000  ! 236: STD_I	std	%r22, [%r10 + 0x0000]
	.word 0xe41ba000  ! 237: LDD_I	ldd	[%r14 + 0x0000], %r18
	.word 0xa48ac008  ! 238: ANDcc_R	andcc 	%r11, %r8, %r18
	.word 0xec336018  ! 239: STH_I	sth	%r22, [%r13 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ac008  ! 241: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe4598008  ! 242: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe8734008  ! 243: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe8134008  ! 244: LDUH_R	lduh	[%r13 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac036018  ! 246: ADD_I	add 	%r13, 0x0018, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec03a020  ! 252: LDUW_I	lduw	[%r14 + 0x0020], %r22
	.word 0xe829a028  ! 253: STB_I	stb	%r20, [%r6 + 0x0028]
	.word 0xe411a018  ! 254: LDUH_I	lduh	[%r6 + 0x0018], %r18
	.word 0xe042a028  ! 255: LDSW_I	ldsw	[%r10 + 0x0028], %r16
	.word 0xe032e010  ! 256: STH_I	sth	%r16, [%r11 + 0x0010]
	.word 0xe40ba030  ! 257: LDUB_I	ldub	[%r14 + 0x0030], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe0230008  ! 261: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe452c008  ! 262: LDSH_R	ldsh	[%r11 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe429a008  ! 264: STB_I	stb	%r18, [%r6 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec29a020  ! 269: STB_I	stb	%r22, [%r6 + 0x0020]
	.word 0xe059c008  ! 270: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe01ae038  ! 271: LDD_I	ldd	[%r11 + 0x0038], %r16
	.word 0xe00b8008  ! 272: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe429c008  ! 276: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xec01e020  ! 277: LDUW_I	lduw	[%r7 + 0x0020], %r22
	.word 0xe84aa038  ! 278: LDSB_I	ldsb	[%r10 + 0x0038], %r20
	.word 0xe059e028  ! 279: LDX_I	ldx	[%r7 + 0x0028], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451a010  ! 281: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472e020  ! 283: STX_I	stx	%r18, [%r11 + 0x0020]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0734008  ! 285: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec436028  ! 286: LDSW_I	ldsw	[%r13 + 0x0028], %r22
	.word 0xe0098008  ! 287: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe0498008  ! 288: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471e028  ! 291: STX_I	stx	%r18, [%r7 + 0x0028]
	.word 0xe03ba008  ! 292: STD_I	std	%r16, [%r14 + 0x0008]
	.word 0xe843a018  ! 293: LDSW_I	ldsw	[%r14 + 0x0018], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe83b4008  ! 296: STD_R	std	%r20, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe842e038  ! 4: LDSW_I	ldsw	[%r11 + 0x0038], %r20
	.word 0xe4298008  ! 5: STB_R	stb	%r18, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032e000  ! 8: STH_I	sth	%r16, [%r11 + 0x0000]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4498008  ! 10: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe851e038  ! 11: LDSH_I	ldsh	[%r7 + 0x0038], %r20
	.word 0xa08b4008  ! 12: ANDcc_R	andcc 	%r13, %r8, %r16
	.word 0xec3aa028  ! 13: STD_I	std	%r22, [%r10 + 0x0028]
	.word 0xe41b0008  ! 14: LDD_R	ldd	[%r12 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8734008  ! 20: STX_R	stx	%r20, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e018  ! 23: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xec23a000  ! 24: STW_I	stw	%r22, [%r14 + 0x0000]
	.word 0xe029a018  ! 25: STB_I	stb	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 29: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe43b6020  ! 34: STD_I	std	%r18, [%r13 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec31c008  ! 36: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xec534008  ! 37: LDSH_R	ldsh	[%r13 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b6000  ! 41: LDD_I	ldd	[%r13 + 0x0000], %r18
	.word 0xe051c008  ! 42: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec298008  ! 47: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe0532028  ! 48: LDSH_I	ldsh	[%r12 + 0x0028], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe831a030  ! 52: STH_I	sth	%r20, [%r6 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071c008  ! 55: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe0298008  ! 56: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa002c008  ! 59: ADD_R	add 	%r11, %r8, %r16
	.word 0xe0338008  ! 60: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe842a038  ! 61: LDSW_I	ldsw	[%r10 + 0x0038], %r20
	.word 0xe42b2020  ! 62: STB_I	stb	%r18, [%r12 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe412a010  ! 64: LDUH_I	lduh	[%r10 + 0x0010], %r18
	.word 0xec39c008  ! 65: STD_R	std	%r22, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03b6038  ! 67: STD_I	std	%r16, [%r13 + 0x0038]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 71: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe02ac008  ! 72: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8736008  ! 74: STX_I	stx	%r20, [%r13 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 79: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe85ae020  ! 80: LDX_I	ldx	[%r11 + 0x0020], %r20
	.word 0xe039a028  ! 81: STD_I	std	%r16, [%r6 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec09a020  ! 84: LDUB_I	ldub	[%r6 + 0x0020], %r22
	.word 0xe4736028  ! 85: STX_I	stx	%r18, [%r13 + 0x0028]
	.word 0xe0732000  ! 86: STX_I	stx	%r16, [%r12 + 0x0000]
	.word 0xe0730008  ! 87: STX_R	stx	%r16, [%r12 + %r8]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72a000  ! 95: STX_I	stx	%r22, [%r10 + 0x0000]
	.word 0xec72c008  ! 96: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec1b2030  ! 97: LDD_I	ldd	[%r12 + 0x0030], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ac008  ! 99: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe0598008  ! 100: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4098008  ! 101: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe019a038  ! 102: LDD_I	ldd	[%r6 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021a020  ! 104: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe8228008  ! 105: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe002a008  ! 106: LDUW_I	lduw	[%r10 + 0x0008], %r16
	.word 0xe4098008  ! 107: LDUB_R	ldub	[%r6 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4b2000  ! 114: LDSB_I	ldsb	[%r12 + 0x0000], %r22
	.word 0xec398008  ! 115: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe03aa010  ! 116: STD_I	std	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec52e028  ! 119: LDSH_I	ldsh	[%r11 + 0x0028], %r22
	.word 0xe459a038  ! 120: LDX_I	ldx	[%r6 + 0x0038], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b8008  ! 122: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe4598008  ! 123: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe432c008  ! 124: STH_R	sth	%r18, [%r11 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 126: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xec11a010  ! 127: LDUH_I	lduh	[%r6 + 0x0010], %r22
	.word 0xe0434008  ! 128: LDSW_R	ldsw	[%r13 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 132: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec436010  ! 134: LDSW_I	ldsw	[%r13 + 0x0010], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b0008  ! 138: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe421a020  ! 139: STW_I	stw	%r18, [%r6 + 0x0020]
	.word 0xe0228008  ! 140: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe85b4008  ! 142: LDX_R	ldx	[%r13 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe052c008  ! 145: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xec332038  ! 146: STH_I	sth	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0534008  ! 148: LDSH_R	ldsh	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0118008  ! 152: LDUH_R	lduh	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b2000  ! 154: LDSB_I	ldsb	[%r12 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029a008  ! 156: STB_I	stb	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe002e000  ! 159: LDUW_I	lduw	[%r11 + 0x0000], %r16
	.word 0xe00b0008  ! 160: LDUB_R	ldub	[%r12 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0032030  ! 163: LDUW_I	lduw	[%r12 + 0x0030], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819c008  ! 166: LDD_R	ldd	[%r7 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 175: STD_R	std	%r18, [%r6 + %r8]
	.word 0xec0a8008  ! 176: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xec1b8008  ! 177: LDD_R	ldd	[%r14 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe032a008  ! 179: STH_I	sth	%r16, [%r10 + 0x0008]
	.word 0xe811c008  ! 180: LDUH_R	lduh	[%r7 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041c008  ! 182: LDSW_R	ldsw	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a008  ! 186: STX_I	stx	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 189: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe439a030  ! 190: STD_I	std	%r18, [%r6 + 0x0030]
	.word 0xe0328008  ! 191: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe4438008  ! 194: LDSW_R	ldsw	[%r14 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe409a028  ! 196: LDUB_I	ldub	[%r6 + 0x0028], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe039a038  ! 198: STD_I	std	%r16, [%r6 + 0x0038]
	.word 0xe80b8008  ! 199: LDUB_R	ldub	[%r14 + %r8], %r20
	.word 0xec73a008  ! 201: STX_I	stx	%r22, [%r14 + 0x0008]
	.word 0xa0b1c008  ! 202: ORNcc_R	orncc 	%r7, %r8, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba038  ! 206: STD_I	std	%r16, [%r14 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71e028  ! 215: STX_I	stx	%r22, [%r7 + 0x0028]
	.word 0xe821a028  ! 216: STW_I	stw	%r20, [%r6 + 0x0028]
	.word 0xe05b6018  ! 217: LDX_I	ldx	[%r13 + 0x0018], %r16
	.word 0xe04b6030  ! 218: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 221: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe84b2028  ! 222: LDSB_I	ldsb	[%r12 + 0x0028], %r20
	.word 0xe811a030  ! 223: LDUH_I	lduh	[%r6 + 0x0030], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe049a000  ! 225: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe02ba030  ! 226: STB_I	stb	%r16, [%r14 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec598008  ! 229: LDX_R	ldx	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec232018  ! 232: STW_I	stw	%r22, [%r12 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe05b2020  ! 234: LDX_I	ldx	[%r12 + 0x0020], %r16
	.word 0xe8528008  ! 235: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe439a008  ! 236: STD_I	std	%r18, [%r6 + 0x0008]
	.word 0xe059c008  ! 237: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xa0838008  ! 238: ADDcc_R	addcc 	%r14, %r8, %r16
	.word 0xe0736000  ! 239: STX_I	stx	%r16, [%r13 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0198008  ! 241: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe05ae010  ! 242: LDX_I	ldx	[%r11 + 0x0010], %r16
	.word 0xe472e028  ! 243: STX_I	stx	%r18, [%r11 + 0x0028]
	.word 0xe01b0008  ! 244: LDD_R	ldd	[%r12 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac1b6010  ! 246: XOR_I	xor 	%r13, 0x0010, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45ae038  ! 252: LDX_I	ldx	[%r11 + 0x0038], %r18
	.word 0xe029e018  ! 253: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe0138008  ! 254: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe011a018  ! 255: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xe029a038  ! 256: STB_I	stb	%r16, [%r6 + 0x0038]
	.word 0xe00b0008  ! 257: LDUB_R	ldub	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe8232008  ! 261: STW_I	stw	%r20, [%r12 + 0x0008]
	.word 0xe451e008  ! 262: LDSH_I	ldsh	[%r7 + 0x0008], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 264: STH_R	sth	%r16, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec31a038  ! 269: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xe4038008  ! 270: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe41b8008  ! 271: LDD_R	ldd	[%r14 + %r8], %r18
	.word 0xe05b8008  ! 272: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe033a038  ! 276: STH_I	sth	%r16, [%r14 + 0x0038]
	.word 0xec1ae038  ! 277: LDD_I	ldd	[%r11 + 0x0038], %r22
	.word 0xe00b2018  ! 278: LDUB_I	ldub	[%r12 + 0x0018], %r16
	.word 0xe01aa010  ! 279: LDD_I	ldd	[%r10 + 0x0010], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b0008  ! 281: LDUB_R	ldub	[%r12 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b8008  ! 283: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 285: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe00ac008  ! 286: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe4432020  ! 287: LDSW_I	ldsw	[%r12 + 0x0020], %r18
	.word 0xec428008  ! 288: LDSW_R	ldsw	[%r10 + %r8], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec398008  ! 291: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe4236030  ! 292: STW_I	stw	%r18, [%r13 + 0x0030]
	.word 0xe05b6030  ! 293: LDX_I	ldx	[%r13 + 0x0030], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b2008  ! 296: STB_I	stb	%r16, [%r12 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec132000  ! 4: LDUH_I	lduh	[%r12 + 0x0000], %r22
	.word 0xec32e020  ! 5: STH_I	sth	%r22, [%r11 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 8: STW_R	stw	%r18, [%r12 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4418008  ! 10: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe059c008  ! 11: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xaca9c008  ! 12: ANDNcc_R	andncc 	%r7, %r8, %r22
	.word 0xe42b4008  ! 13: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xec138008  ! 14: LDUH_R	lduh	[%r14 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe431a010  ! 20: STH_I	sth	%r18, [%r6 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39e028  ! 23: STD_I	std	%r22, [%r7 + 0x0028]
	.word 0xec236000  ! 24: STW_I	stw	%r22, [%r13 + 0x0000]
	.word 0xe029c008  ! 25: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a020  ! 29: STH_I	sth	%r16, [%r14 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4736030  ! 34: STX_I	stx	%r18, [%r13 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 36: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe05b2008  ! 37: LDX_I	ldx	[%r12 + 0x0008], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ae038  ! 41: LDX_I	ldx	[%r11 + 0x0038], %r22
	.word 0xec4b6028  ! 42: LDSB_I	ldsb	[%r13 + 0x0028], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec32a008  ! 47: STH_I	sth	%r22, [%r10 + 0x0008]
	.word 0xe0030008  ! 48: LDUW_R	lduw	[%r12 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8232028  ! 52: STW_I	stw	%r20, [%r12 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe823a000  ! 55: STW_I	stw	%r20, [%r14 + 0x0000]
	.word 0xe82b8008  ! 56: STB_R	stb	%r20, [%r14 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0128008  ! 59: OR_R	or 	%r10, %r8, %r16
	.word 0xe071a020  ! 60: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe0198008  ! 61: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe03ba038  ! 62: STD_I	std	%r16, [%r14 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b8008  ! 64: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xec21a030  ! 65: STW_I	stw	%r22, [%r6 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 67: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe039a008  ! 71: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xec332028  ! 72: STH_I	sth	%r22, [%r12 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe071a038  ! 74: STX_I	stx	%r16, [%r6 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0332010  ! 79: STH_I	sth	%r16, [%r12 + 0x0010]
	.word 0xe412c008  ! 80: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xec298008  ! 81: STB_R	stb	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4532038  ! 84: LDSH_I	ldsh	[%r12 + 0x0038], %r18
	.word 0xe02aa028  ! 85: STB_I	stb	%r16, [%r10 + 0x0028]
	.word 0xe03b8008  ! 86: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe03b4008  ! 87: STD_R	std	%r16, [%r13 + %r8]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae000  ! 95: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xec236038  ! 96: STW_I	stw	%r22, [%r13 + 0x0038]
	.word 0xe0436018  ! 97: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4498008  ! 99: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe0118008  ! 100: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe409a010  ! 101: LDUB_I	ldub	[%r6 + 0x0010], %r18
	.word 0xec530008  ! 102: LDSH_R	ldsh	[%r12 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec71e010  ! 104: STX_I	stx	%r22, [%r7 + 0x0010]
	.word 0xe432c008  ! 105: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe843a020  ! 106: LDSW_I	ldsw	[%r14 + 0x0020], %r20
	.word 0xe0538008  ! 107: LDSH_R	ldsh	[%r14 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81ac008  ! 114: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xec218008  ! 115: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xec334008  ! 116: STH_R	sth	%r22, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8018008  ! 119: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe4132018  ! 120: LDUH_I	lduh	[%r12 + 0x0018], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8730008  ! 122: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe85b0008  ! 123: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe071a010  ! 124: STX_I	stx	%r16, [%r6 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052e028  ! 126: LDSH_I	ldsh	[%r11 + 0x0028], %r16
	.word 0xe8436018  ! 127: LDSW_I	ldsw	[%r13 + 0x0018], %r20
	.word 0xe44ac008  ! 128: LDSB_R	ldsb	[%r11 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012a038  ! 132: LDUH_I	lduh	[%r10 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe851a010  ! 134: LDSH_I	ldsh	[%r6 + 0x0010], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829a020  ! 138: STB_I	stb	%r20, [%r6 + 0x0020]
	.word 0xe43b4008  ! 139: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe032e030  ! 140: STH_I	sth	%r16, [%r11 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec1b8008  ! 142: LDD_R	ldd	[%r14 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41b4008  ! 145: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xec72c008  ! 146: STX_R	stx	%r22, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe44b4008  ! 148: LDSB_R	ldsb	[%r13 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 152: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4418008  ! 154: LDSW_R	ldsw	[%r6 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431a038  ! 156: STH_I	sth	%r18, [%r6 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 159: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe01ae028  ! 160: LDD_I	ldd	[%r11 + 0x0028], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0532008  ! 163: LDSH_I	ldsh	[%r12 + 0x0008], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051c008  ! 166: LDSH_R	ldsh	[%r7 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe432c008  ! 175: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe04ac008  ! 176: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe84ae028  ! 177: LDSB_I	ldsb	[%r11 + 0x0028], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 179: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe4138008  ! 180: LDUH_R	lduh	[%r14 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b4008  ! 182: LDUB_R	ldub	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 186: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4238008  ! 189: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe429c008  ! 190: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe071a030  ! 191: STX_I	stx	%r16, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe051a010  ! 194: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0598008  ! 196: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 198: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe0532010  ! 199: LDSH_I	ldsh	[%r12 + 0x0010], %r16
	.word 0xec3b4008  ! 201: STD_R	std	%r22, [%r13 + %r8]
	.word 0xa82a8008  ! 202: ANDN_R	andn 	%r10, %r8, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 206: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8232020  ! 215: STW_I	stw	%r20, [%r12 + 0x0020]
	.word 0xe8328008  ! 216: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe0436038  ! 217: LDSW_I	ldsw	[%r13 + 0x0038], %r16
	.word 0xe0418008  ! 218: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a010  ! 221: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xe003a038  ! 222: LDUW_I	lduw	[%r14 + 0x0038], %r16
	.word 0xe05a8008  ! 223: LDX_R	ldx	[%r10 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04b4008  ! 225: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe8298008  ! 226: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe051c008  ! 229: LDSH_R	ldsh	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a020  ! 232: STD_I	std	%r22, [%r6 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe851c008  ! 234: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe04a8008  ! 235: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe831a018  ! 236: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xe81ae028  ! 237: LDD_I	ldd	[%r11 + 0x0028], %r20
	.word 0xa8218008  ! 238: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe03b8008  ! 239: STD_R	std	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe849c008  ! 241: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec0b8008  ! 242: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xe029c008  ! 243: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe449c008  ! 244: LDSB_R	ldsb	[%r7 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa891e008  ! 246: ORcc_I	orcc 	%r7, 0x0008, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4430008  ! 252: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe02ba030  ! 253: STB_I	stb	%r16, [%r14 + 0x0030]
	.word 0xe051e038  ! 254: LDSH_I	ldsh	[%r7 + 0x0038], %r16
	.word 0xe0530008  ! 255: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe03b0008  ! 256: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe419a000  ! 257: LDD_I	ldd	[%r6 + 0x0000], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe0728008  ! 261: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe44ae018  ! 262: LDSB_I	ldsb	[%r11 + 0x0018], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe439a008  ! 264: STD_I	std	%r18, [%r6 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe022a000  ! 269: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe01ac008  ! 270: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xec130008  ! 271: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe049c008  ! 272: LDSB_R	ldsb	[%r7 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe422c008  ! 276: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe0530008  ! 277: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe05a8008  ! 278: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xec434008  ! 279: LDSW_R	ldsw	[%r13 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052c008  ! 281: LDSH_R	ldsh	[%r11 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39e030  ! 283: STD_I	std	%r22, [%r7 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec334008  ! 285: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xe85b2030  ! 286: LDX_I	ldx	[%r12 + 0x0030], %r20
	.word 0xec5b6010  ! 287: LDX_I	ldx	[%r13 + 0x0010], %r22
	.word 0xe841c008  ! 288: LDSW_R	ldsw	[%r7 + %r8], %r20
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 291: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe0728008  ! 292: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec52a010  ! 293: LDSH_I	ldsh	[%r10 + 0x0010], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec29a008  ! 296: STB_I	stb	%r22, [%r6 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4498008  ! 4: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe821a020  ! 5: STW_I	stw	%r20, [%r6 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829c008  ! 8: STB_R	stb	%r20, [%r7 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a020  ! 10: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xe40ba010  ! 11: LDUB_I	ldub	[%r14 + 0x0010], %r18
	.word 0xa81ba000  ! 12: XOR_I	xor 	%r14, 0x0000, %r20
	.word 0xe0730008  ! 13: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe442e000  ! 14: LDSW_I	ldsw	[%r11 + 0x0000], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 20: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b8008  ! 23: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe0398008  ! 24: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0228008  ! 25: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ba030  ! 29: STD_I	std	%r18, [%r14 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0330008  ! 34: STH_R	sth	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4734008  ! 36: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe049a038  ! 37: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0130008  ! 41: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe401a038  ! 42: LDUW_I	lduw	[%r6 + 0x0038], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 47: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0538008  ! 48: LDSH_R	ldsh	[%r14 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8330008  ! 52: STH_R	sth	%r20, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 55: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe4398008  ! 56: STD_R	std	%r18, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac2b2008  ! 59: ANDN_I	andn 	%r12, 0x0008, %r22
	.word 0xe429c008  ! 60: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe041a008  ! 61: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xe8330008  ! 62: STH_R	sth	%r20, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b2010  ! 64: LDSB_I	ldsb	[%r12 + 0x0010], %r18
	.word 0xe439c008  ! 65: STD_R	std	%r18, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 67: STW_R	stw	%r18, [%r13 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe829a030  ! 71: STB_I	stb	%r20, [%r6 + 0x0030]
	.word 0xe032a020  ! 72: STH_I	sth	%r16, [%r10 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0338008  ! 74: STH_R	sth	%r16, [%r14 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 79: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe442c008  ! 80: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xec21c008  ! 81: STW_R	stw	%r22, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec11a008  ! 84: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xec22a030  ! 85: STW_I	stw	%r22, [%r10 + 0x0030]
	.word 0xe8730008  ! 86: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe42ac008  ! 87: STB_R	stb	%r18, [%r11 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe422a030  ! 95: STW_I	stw	%r18, [%r10 + 0x0030]
	.word 0xec728008  ! 96: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe459a038  ! 97: LDX_I	ldx	[%r6 + 0x0038], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a020  ! 99: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xec530008  ! 100: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xec42e018  ! 101: LDSW_I	ldsw	[%r11 + 0x0018], %r22
	.word 0xe0032038  ! 102: LDUW_I	lduw	[%r12 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe872a000  ! 104: STX_I	stx	%r20, [%r10 + 0x0000]
	.word 0xe021c008  ! 105: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe84a8008  ! 106: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe04ae008  ! 107: LDSB_I	ldsb	[%r11 + 0x0008], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4530008  ! 114: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe031c008  ! 115: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe0298008  ! 116: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe819c008  ! 119: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xec0ac008  ! 120: LDUB_R	ldub	[%r11 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a028  ! 122: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe05aa000  ! 123: LDX_I	ldx	[%r10 + 0x0000], %r16
	.word 0xe0218008  ! 124: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec536008  ! 126: LDSH_I	ldsh	[%r13 + 0x0008], %r22
	.word 0xe013a038  ! 127: LDUH_I	lduh	[%r14 + 0x0038], %r16
	.word 0xec01e018  ! 128: LDUW_I	lduw	[%r7 + 0x0018], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe441c008  ! 132: LDSW_R	ldsw	[%r7 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe80ae000  ! 134: LDUB_I	ldub	[%r11 + 0x0000], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829a028  ! 138: STB_I	stb	%r20, [%r6 + 0x0028]
	.word 0xe873a038  ! 139: STX_I	stx	%r20, [%r14 + 0x0038]
	.word 0xe03aa000  ! 140: STD_I	std	%r16, [%r10 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41a8008  ! 142: LDD_R	ldd	[%r10 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe40ac008  ! 145: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe8336008  ! 146: STH_I	sth	%r20, [%r13 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05ac008  ! 148: LDX_R	ldx	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe40b2038  ! 152: LDUB_I	ldub	[%r12 + 0x0038], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81a8008  ! 154: LDD_R	ldd	[%r10 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe83aa020  ! 156: STD_I	std	%r20, [%r10 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe059a000  ! 159: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe44ae008  ! 160: LDSB_I	ldsb	[%r11 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec038008  ! 163: LDUW_R	lduw	[%r14 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041c008  ! 166: LDSW_R	ldsw	[%r7 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 175: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec11a010  ! 176: LDUH_I	lduh	[%r6 + 0x0010], %r22
	.word 0xe8138008  ! 177: LDUH_R	lduh	[%r14 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe072e038  ! 179: STX_I	stx	%r16, [%r11 + 0x0038]
	.word 0xe05b8008  ! 180: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459a000  ! 182: LDX_I	ldx	[%r6 + 0x0000], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b2038  ! 186: STB_I	stb	%r18, [%r12 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4738008  ! 189: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe0718008  ! 190: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe8732028  ! 191: STX_I	stx	%r20, [%r12 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe449c008  ! 194: LDSB_R	ldsb	[%r7 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04ae020  ! 196: LDSB_I	ldsb	[%r11 + 0x0020], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec3ba038  ! 198: STD_I	std	%r22, [%r14 + 0x0038]
	.word 0xec530008  ! 199: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xe021a018  ! 201: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xa021c008  ! 202: SUB_R	sub 	%r7, %r8, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421a008  ! 206: STW_I	stw	%r18, [%r6 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 215: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe43b2030  ! 216: STD_I	std	%r18, [%r12 + 0x0030]
	.word 0xec5aa000  ! 217: LDX_I	ldx	[%r10 + 0x0000], %r22
	.word 0xe0136010  ! 218: LDUH_I	lduh	[%r13 + 0x0010], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b6030  ! 221: STD_I	std	%r18, [%r13 + 0x0030]
	.word 0xe419e030  ! 222: LDD_I	ldd	[%r7 + 0x0030], %r18
	.word 0xe0436010  ! 223: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4018008  ! 225: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe0234008  ! 226: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe059a018  ! 229: LDX_I	ldx	[%r6 + 0x0018], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b2038  ! 232: STB_I	stb	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0128008  ! 234: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe442a008  ! 235: LDSW_I	ldsw	[%r10 + 0x0008], %r18
	.word 0xec2b0008  ! 236: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xec19a000  ! 237: LDD_I	ldd	[%r6 + 0x0000], %r22
	.word 0xa811a038  ! 238: OR_I	or 	%r6, 0x0038, %r20
	.word 0xe4334008  ! 239: STH_R	sth	%r18, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04aa018  ! 241: LDSB_I	ldsb	[%r10 + 0x0018], %r16
	.word 0xec59e038  ! 242: LDX_I	ldx	[%r7 + 0x0038], %r22
	.word 0xe831c008  ! 243: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe4418008  ! 244: LDSW_R	ldsw	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa83b8008  ! 246: XNOR_R	xnor 	%r14, %r8, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1ac008  ! 252: LDD_R	ldd	[%r11 + %r8], %r22
	.word 0xe871c008  ! 253: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe4598008  ! 254: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe842c008  ! 255: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xe0738008  ! 256: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe8098008  ! 257: LDUB_R	ldub	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe0330008  ! 261: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe04b8008  ! 262: LDSB_R	ldsb	[%r14 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec29a028  ! 264: STB_I	stb	%r22, [%r6 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe873a018  ! 269: STX_I	stx	%r20, [%r14 + 0x0018]
	.word 0xe8518008  ! 270: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xec0b8008  ! 271: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xe01aa008  ! 272: LDD_I	ldd	[%r10 + 0x0008], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0736028  ! 276: STX_I	stx	%r16, [%r13 + 0x0028]
	.word 0xe4598008  ! 277: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe8438008  ! 278: LDSW_R	ldsw	[%r14 + %r8], %r20
	.word 0xe413a020  ! 279: LDUH_I	lduh	[%r14 + 0x0020], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8418008  ! 281: LDSW_R	ldsw	[%r6 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b0008  ! 283: STB_R	stb	%r18, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6038  ! 285: STD_I	std	%r22, [%r13 + 0x0038]
	.word 0xec598008  ! 286: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe41b2028  ! 287: LDD_I	ldd	[%r12 + 0x0028], %r18
	.word 0xe841a038  ! 288: LDSW_I	ldsw	[%r6 + 0x0038], %r20
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832c008  ! 291: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xec31c008  ! 292: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe0432008  ! 293: LDSW_I	ldsw	[%r12 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b0008  ! 296: STB_R	stb	%r18, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0118008  ! 4: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe0718008  ! 5: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe073a010  ! 8: STX_I	stx	%r16, [%r14 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449a028  ! 10: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xe4518008  ! 11: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa842c008  ! 12: ADDC_R	addc 	%r11, %r8, %r20
	.word 0xe021c008  ! 13: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe009c008  ! 14: LDUB_R	ldub	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83aa030  ! 20: STD_I	std	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a028  ! 23: STD_I	std	%r18, [%r6 + 0x0028]
	.word 0xe039a020  ! 24: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe0730008  ! 25: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 29: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae010  ! 34: STD_I	std	%r16, [%r11 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6020  ! 36: STB_I	stb	%r16, [%r13 + 0x0020]
	.word 0xe00ba030  ! 37: LDUB_I	ldub	[%r14 + 0x0030], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec130008  ! 41: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe8118008  ! 42: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03b2000  ! 47: STD_I	std	%r16, [%r12 + 0x0000]
	.word 0xe44b0008  ! 48: LDSB_R	ldsb	[%r12 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 52: STX_R	stx	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4318008  ! 55: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe071e008  ! 56: STX_I	stx	%r16, [%r7 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa021e020  ! 59: SUB_I	sub 	%r7, 0x0020, %r16
	.word 0xe822a030  ! 60: STW_I	stw	%r20, [%r10 + 0x0030]
	.word 0xe009a020  ! 61: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xe03b2030  ! 62: STD_I	std	%r16, [%r12 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 64: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xec330008  ! 65: STH_R	sth	%r22, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 67: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 71: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe031a010  ! 72: STH_I	sth	%r16, [%r6 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe022e000  ! 74: STW_I	stw	%r16, [%r11 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe432a030  ! 79: STH_I	sth	%r18, [%r10 + 0x0030]
	.word 0xe44aa000  ! 80: LDSB_I	ldsb	[%r10 + 0x0000], %r18
	.word 0xec398008  ! 81: STD_R	std	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 84: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xec3b2020  ! 85: STD_I	std	%r22, [%r12 + 0x0020]
	.word 0xe473a020  ! 86: STX_I	stx	%r18, [%r14 + 0x0020]
	.word 0xe871a008  ! 87: STX_I	stx	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02a8008  ! 95: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe0398008  ! 96: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe441a028  ! 97: LDSW_I	ldsw	[%r6 + 0x0028], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b0008  ! 99: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe0132020  ! 100: LDUH_I	lduh	[%r12 + 0x0020], %r16
	.word 0xec41c008  ! 101: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xec538008  ! 102: LDSH_R	ldsh	[%r14 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe071a028  ! 104: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xe872a030  ! 105: STX_I	stx	%r20, [%r10 + 0x0030]
	.word 0xec198008  ! 106: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe0430008  ! 107: LDSW_R	ldsw	[%r12 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04a8008  ! 114: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe029e010  ! 115: STB_I	stb	%r16, [%r7 + 0x0010]
	.word 0xe022c008  ! 116: STW_R	stw	%r16, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe44b0008  ! 119: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xe011e000  ! 120: LDUH_I	lduh	[%r7 + 0x0000], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a8008  ! 122: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec5aa038  ! 123: LDX_I	ldx	[%r10 + 0x0038], %r22
	.word 0xec718008  ! 124: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449c008  ! 126: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xec19a010  ! 127: LDD_I	ldd	[%r6 + 0x0010], %r22
	.word 0xe81ba028  ! 128: LDD_I	ldd	[%r14 + 0x0028], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a018  ! 132: LDD_I	ldd	[%r6 + 0x0018], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0032018  ! 134: LDUW_I	lduw	[%r12 + 0x0018], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031c008  ! 138: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe03ba030  ! 139: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xe422e038  ! 140: STW_I	stw	%r18, [%r11 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe44b4008  ! 142: LDSB_R	ldsb	[%r13 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec598008  ! 145: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe839e018  ! 146: STD_I	std	%r20, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe049e000  ! 148: LDSB_I	ldsb	[%r7 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe041e008  ! 152: LDSW_I	ldsw	[%r7 + 0x0008], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001e020  ! 154: LDUW_I	lduw	[%r7 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b8008  ! 156: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe803a030  ! 159: LDUW_I	lduw	[%r14 + 0x0030], %r20
	.word 0xec49c008  ! 160: LDSB_R	ldsb	[%r7 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 163: LDD_R	ldd	[%r6 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8038008  ! 166: LDUW_R	lduw	[%r14 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe42ac008  ! 175: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe40ba008  ! 176: LDUB_I	ldub	[%r14 + 0x0008], %r18
	.word 0xec036028  ! 177: LDUW_I	lduw	[%r13 + 0x0028], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe421c008  ! 179: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe8518008  ! 180: LDSH_R	ldsh	[%r6 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec498008  ! 182: LDSB_R	ldsb	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032a010  ! 186: STH_I	sth	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4338008  ! 189: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe8398008  ! 190: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe872a020  ! 191: STX_I	stx	%r20, [%r10 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe8134008  ! 194: LDUH_R	lduh	[%r13 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe052a020  ! 196: LDSH_I	ldsh	[%r10 + 0x0020], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe83b0008  ! 198: STD_R	std	%r20, [%r12 + %r8]
	.word 0xe84b8008  ! 199: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe031a008  ! 201: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xa8c2c008  ! 202: ADDCcc_R	addccc 	%r11, %r8, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82aa030  ! 206: STB_I	stb	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822e038  ! 215: STW_I	stw	%r20, [%r11 + 0x0038]
	.word 0xe02a8008  ! 216: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe009a038  ! 217: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xe059a000  ! 218: LDX_I	ldx	[%r6 + 0x0000], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 221: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec018008  ! 222: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe4198008  ! 223: LDD_R	ldd	[%r6 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec03a000  ! 225: LDUW_I	lduw	[%r14 + 0x0000], %r22
	.word 0xe02b6000  ! 226: STB_I	stb	%r16, [%r13 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe01a8008  ! 229: LDD_R	ldd	[%r10 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ae020  ! 232: STB_I	stb	%r18, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe849a038  ! 234: LDSB_I	ldsb	[%r6 + 0x0038], %r20
	.word 0xe049a028  ! 235: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xec2ae010  ! 236: STB_I	stb	%r22, [%r11 + 0x0010]
	.word 0xe449e038  ! 237: LDSB_I	ldsb	[%r7 + 0x0038], %r18
	.word 0xa8c18008  ! 238: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xe0334008  ! 239: STH_R	sth	%r16, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe442e038  ! 241: LDSW_I	ldsw	[%r11 + 0x0038], %r18
	.word 0xe0036018  ! 242: LDUW_I	lduw	[%r13 + 0x0018], %r16
	.word 0xe0398008  ! 243: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe849a020  ! 244: LDSB_I	ldsb	[%r6 + 0x0020], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa843a030  ! 246: ADDC_I	addc 	%r14, 0x0030, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b2020  ! 252: LDSB_I	ldsb	[%r12 + 0x0020], %r20
	.word 0xe421c008  ! 253: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xec030008  ! 254: LDUW_R	lduw	[%r12 + %r8], %r22
	.word 0xe803a018  ! 255: LDUW_I	lduw	[%r14 + 0x0018], %r20
	.word 0xe022e020  ! 256: STW_I	stw	%r16, [%r11 + 0x0020]
	.word 0xec12a018  ! 257: LDUH_I	lduh	[%r10 + 0x0018], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe0732010  ! 261: STX_I	stx	%r16, [%r12 + 0x0010]
	.word 0xe859c008  ! 262: LDX_R	ldx	[%r7 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0232010  ! 264: STW_I	stw	%r16, [%r12 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe421c008  ! 269: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe059a010  ! 270: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xe41b6028  ! 271: LDD_I	ldd	[%r13 + 0x0028], %r18
	.word 0xe41aa008  ! 272: LDD_I	ldd	[%r10 + 0x0008], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 276: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe4538008  ! 277: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xec11a030  ! 278: LDUH_I	lduh	[%r6 + 0x0030], %r22
	.word 0xe041a038  ! 279: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b8008  ! 281: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe823a038  ! 283: STW_I	stw	%r20, [%r14 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe071a038  ! 285: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe40ac008  ! 286: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe8118008  ! 287: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe852c008  ! 288: LDSH_R	ldsh	[%r11 + %r8], %r20
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4398008  ! 291: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe421e000  ! 292: STW_I	stw	%r18, [%r7 + 0x0000]
	.word 0xe0018008  ! 293: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe43ba020  ! 296: STD_I	std	%r18, [%r14 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe851e000  ! 4: LDSH_I	ldsh	[%r7 + 0x0000], %r20
	.word 0xe021c008  ! 5: STW_R	stw	%r16, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 8: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40a8008  ! 10: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe059c008  ! 11: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xa831a028  ! 12: SUBC_I	orn 	%r6, 0x0028, %r20
	.word 0xe02b6000  ! 13: STB_I	stb	%r16, [%r13 + 0x0000]
	.word 0xec0b8008  ! 14: LDUB_R	ldub	[%r14 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039c008  ! 20: STD_R	std	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec332020  ! 23: STH_I	sth	%r22, [%r12 + 0x0020]
	.word 0xe822a018  ! 24: STW_I	stw	%r20, [%r10 + 0x0018]
	.word 0xe831c008  ! 25: STH_R	sth	%r20, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a018  ! 29: STD_I	std	%r18, [%r6 + 0x0018]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 34: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3b0008  ! 36: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe8198008  ! 37: LDD_R	ldd	[%r6 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84a8008  ! 41: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe04ae010  ! 42: LDSB_I	ldsb	[%r11 + 0x0010], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 47: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe0418008  ! 48: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071a028  ! 52: STX_I	stx	%r16, [%r6 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 55: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec32c008  ! 56: STH_R	sth	%r22, [%r11 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0398008  ! 59: XNOR_R	xnor 	%r6, %r8, %r16
	.word 0xe02b4008  ! 60: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe04aa030  ! 61: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	.word 0xe0318008  ! 62: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409c008  ! 64: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xec31c008  ! 65: STH_R	sth	%r22, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8732008  ! 67: STX_I	stx	%r20, [%r12 + 0x0008]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe83aa000  ! 71: STD_I	std	%r20, [%r10 + 0x0000]
	.word 0xe871a010  ! 72: STX_I	stx	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 74: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe83ba008  ! 79: STD_I	std	%r20, [%r14 + 0x0008]
	.word 0xe011a038  ! 80: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xe4338008  ! 81: STH_R	sth	%r18, [%r14 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec534008  ! 84: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xe471e020  ! 85: STX_I	stx	%r18, [%r7 + 0x0020]
	.word 0xe0218008  ! 86: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec730008  ! 87: STX_R	stx	%r22, [%r12 + %r8]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4718008  ! 95: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec730008  ! 96: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe859e038  ! 97: LDX_I	ldx	[%r7 + 0x0038], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52e018  ! 99: LDSH_I	ldsh	[%r11 + 0x0018], %r22
	.word 0xec1ae008  ! 100: LDD_I	ldd	[%r11 + 0x0008], %r22
	.word 0xe042a028  ! 101: LDSW_I	ldsw	[%r10 + 0x0028], %r16
	.word 0xe0536000  ! 102: LDSH_I	ldsh	[%r13 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe073a030  ! 104: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe0232028  ! 105: STW_I	stw	%r16, [%r12 + 0x0028]
	.word 0xec030008  ! 106: LDUW_R	lduw	[%r12 + %r8], %r22
	.word 0xec4b8008  ! 107: LDSB_R	ldsb	[%r14 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85a8008  ! 114: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe03b2000  ! 115: STD_I	std	%r16, [%r12 + 0x0000]
	.word 0xe0734008  ! 116: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe84a8008  ! 119: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe009e010  ! 120: LDUB_I	ldub	[%r7 + 0x0010], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831a008  ! 122: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xe01ba000  ! 123: LDD_I	ldd	[%r14 + 0x0000], %r16
	.word 0xe8234008  ! 124: STW_R	stw	%r20, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0536020  ! 126: LDSH_I	ldsh	[%r13 + 0x0020], %r16
	.word 0xe0032010  ! 127: LDUW_I	lduw	[%r12 + 0x0010], %r16
	.word 0xe802a020  ! 128: LDUW_I	lduw	[%r10 + 0x0020], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8430008  ! 132: LDSW_R	ldsw	[%r12 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe81b6000  ! 134: LDD_I	ldd	[%r13 + 0x0000], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0728008  ! 138: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe022c008  ! 139: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xec236030  ! 140: STW_I	stw	%r22, [%r13 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe00ba038  ! 142: LDUB_I	ldub	[%r14 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe411e008  ! 145: LDUH_I	lduh	[%r7 + 0x0008], %r18
	.word 0xe43a8008  ! 146: STD_R	std	%r18, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4198008  ! 148: LDD_R	ldd	[%r6 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4036020  ! 152: LDUW_I	lduw	[%r13 + 0x0020], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec034008  ! 154: LDUW_R	lduw	[%r13 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe871a010  ! 156: STX_I	stx	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8434008  ! 159: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe4136008  ! 160: LDUH_I	lduh	[%r13 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe051a000  ! 163: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8098008  ! 166: LDUB_R	ldub	[%r6 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe82a8008  ! 175: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xec59a018  ! 176: LDX_I	ldx	[%r6 + 0x0018], %r22
	.word 0xe4536038  ! 177: LDSH_I	ldsh	[%r13 + 0x0038], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec21a018  ! 179: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe851a028  ! 180: LDSH_I	ldsh	[%r6 + 0x0028], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ba000  ! 182: LDUB_I	ldub	[%r14 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8230008  ! 186: STW_R	stw	%r20, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b2018  ! 189: STD_I	std	%r20, [%r12 + 0x0018]
	.word 0xe03ae018  ! 190: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xe0238008  ! 191: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe819a000  ! 194: LDD_I	ldd	[%r6 + 0x0000], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec1aa038  ! 196: LDD_I	ldd	[%r10 + 0x0038], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 198: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe8538008  ! 199: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe0228008  ! 201: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xa433a028  ! 202: SUBC_I	orn 	%r14, 0x0028, %r18
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29c008  ! 206: STB_R	stb	%r22, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b8008  ! 215: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe03b2008  ! 216: STD_I	std	%r16, [%r12 + 0x0008]
	.word 0xec02c008  ! 217: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe81ae018  ! 218: LDD_I	ldd	[%r11 + 0x0018], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031e000  ! 221: STH_I	sth	%r16, [%r7 + 0x0000]
	.word 0xe451e010  ! 222: LDSH_I	ldsh	[%r7 + 0x0010], %r18
	.word 0xec01a010  ! 223: LDUW_I	lduw	[%r6 + 0x0010], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04b6028  ! 225: LDSB_I	ldsb	[%r13 + 0x0028], %r16
	.word 0xe0332000  ! 226: STH_I	sth	%r16, [%r12 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec49a028  ! 229: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0728008  ! 232: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe05b0008  ! 234: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xec49c008  ! 235: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe03ae000  ! 236: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xec11e010  ! 237: LDUH_I	lduh	[%r7 + 0x0010], %r22
	.word 0xa4bb2018  ! 238: XNORcc_I	xnorcc 	%r12, 0x0018, %r18
	.word 0xec29a008  ! 239: STB_I	stb	%r22, [%r6 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b6030  ! 241: LDUB_I	ldub	[%r13 + 0x0030], %r20
	.word 0xe852e018  ! 242: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	.word 0xe0218008  ! 243: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe851e008  ! 244: LDSH_I	ldsh	[%r7 + 0x0008], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa08ac008  ! 246: ANDcc_R	andcc 	%r11, %r8, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04a8008  ! 252: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe02b6028  ! 253: STB_I	stb	%r16, [%r13 + 0x0028]
	.word 0xe4534008  ! 254: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe04b4008  ! 255: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe0732038  ! 256: STX_I	stx	%r16, [%r12 + 0x0038]
	.word 0xe0536038  ! 257: LDSH_I	ldsh	[%r13 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe423a018  ! 261: STW_I	stw	%r18, [%r14 + 0x0018]
	.word 0xe40b8008  ! 262: LDUB_R	ldub	[%r14 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0332008  ! 264: STH_I	sth	%r16, [%r12 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe871e020  ! 269: STX_I	stx	%r20, [%r7 + 0x0020]
	.word 0xe452a000  ! 270: LDSH_I	ldsh	[%r10 + 0x0000], %r18
	.word 0xe05b8008  ! 271: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe0498008  ! 272: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec332000  ! 276: STH_I	sth	%r22, [%r12 + 0x0000]
	.word 0xe04b8008  ! 277: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xec198008  ! 278: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xec03a008  ! 279: LDUW_I	lduw	[%r14 + 0x0008], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041a028  ! 281: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3ac008  ! 283: STD_R	std	%r22, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0336018  ! 285: STH_I	sth	%r16, [%r13 + 0x0018]
	.word 0xe04a8008  ! 286: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xec09a028  ! 287: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xe802c008  ! 288: LDUW_R	lduw	[%r11 + %r8], %r20
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472c008  ! 291: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe4728008  ! 292: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec4b4008  ! 293: LDSB_R	ldsb	[%r13 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec332038  ! 296: STH_I	sth	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe00a8008  ! 4: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe0234008  ! 5: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02aa010  ! 8: STB_I	stb	%r16, [%r10 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0138008  ! 10: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe44aa020  ! 11: LDSB_I	ldsb	[%r10 + 0x0020], %r18
	.word 0xac0ac008  ! 12: AND_R	and 	%r11, %r8, %r22
	.word 0xe0732010  ! 13: STX_I	stx	%r16, [%r12 + 0x0010]
	.word 0xe4138008  ! 14: LDUH_R	lduh	[%r14 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe423a028  ! 20: STW_I	stw	%r18, [%r14 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a020  ! 23: STD_I	std	%r22, [%r6 + 0x0020]
	.word 0xec39e010  ! 24: STD_I	std	%r22, [%r7 + 0x0010]
	.word 0xe0732000  ! 25: STX_I	stx	%r16, [%r12 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a000  ! 29: STH_I	sth	%r16, [%r6 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2aa018  ! 34: STB_I	stb	%r22, [%r10 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe039a028  ! 36: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe45aa038  ! 37: LDX_I	ldx	[%r10 + 0x0038], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01a8008  ! 41: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe01b2008  ! 42: LDD_I	ldd	[%r12 + 0x0008], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431a010  ! 47: STH_I	sth	%r18, [%r6 + 0x0010]
	.word 0xe01b0008  ! 48: LDD_R	ldd	[%r12 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec732010  ! 52: STX_I	stx	%r22, [%r12 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032e030  ! 55: STH_I	sth	%r16, [%r11 + 0x0030]
	.word 0xe821c008  ! 56: STW_R	stw	%r20, [%r7 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xacbba038  ! 59: XNORcc_I	xnorcc 	%r14, 0x0038, %r22
	.word 0xe429c008  ! 60: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe4030008  ! 61: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe8236000  ! 62: STW_I	stw	%r20, [%r13 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ba038  ! 64: LDX_I	ldx	[%r14 + 0x0038], %r20
	.word 0xe0336020  ! 65: STH_I	sth	%r16, [%r13 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae018  ! 67: STB_I	stb	%r16, [%r11 + 0x0018]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 71: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe8728008  ! 72: STX_R	stx	%r20, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe431e008  ! 74: STH_I	sth	%r18, [%r7 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec334008  ! 79: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xe0434008  ! 80: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe072c008  ! 81: STX_R	stx	%r16, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec11e028  ! 84: LDUH_I	lduh	[%r7 + 0x0028], %r22
	.word 0xe4336008  ! 85: STH_I	sth	%r18, [%r13 + 0x0008]
	.word 0xe0336010  ! 86: STH_I	sth	%r16, [%r13 + 0x0010]
	.word 0xe8334008  ! 87: STH_R	sth	%r20, [%r13 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a030  ! 95: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe0334008  ! 96: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe04b8008  ! 97: LDSB_R	ldsb	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449e018  ! 99: LDSB_I	ldsb	[%r7 + 0x0018], %r18
	.word 0xec03a008  ! 100: LDUW_I	lduw	[%r14 + 0x0008], %r22
	.word 0xe0518008  ! 101: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xec0ac008  ! 102: LDUB_R	ldub	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe439a010  ! 104: STD_I	std	%r18, [%r6 + 0x0010]
	.word 0xe871a010  ! 105: STX_I	stx	%r20, [%r6 + 0x0010]
	.word 0xec4b0008  ! 106: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe041c008  ! 107: LDSW_R	ldsw	[%r7 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 114: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe039a008  ! 115: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xe0318008  ! 116: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41ae030  ! 119: LDD_I	ldd	[%r11 + 0x0030], %r18
	.word 0xe049a020  ! 120: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e018  ! 122: STX_I	stx	%r16, [%r11 + 0x0018]
	.word 0xec19c008  ! 123: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xec39e000  ! 124: STD_I	std	%r22, [%r7 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0128008  ! 126: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe4098008  ! 127: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe4032020  ! 128: LDUW_I	lduw	[%r12 + 0x0020], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0098008  ! 132: LDUB_R	ldub	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec52e008  ! 134: LDSH_I	ldsh	[%r11 + 0x0008], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b8008  ! 138: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe0218008  ! 139: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe82ac008  ! 140: STB_R	stb	%r20, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe409e000  ! 142: LDUB_I	ldub	[%r7 + 0x0000], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0498008  ! 145: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe421a020  ! 146: STW_I	stw	%r18, [%r6 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05b8008  ! 148: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe801e020  ! 152: LDUW_I	lduw	[%r7 + 0x0020], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b6030  ! 154: LDD_I	ldd	[%r13 + 0x0030], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 156: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b0008  ! 159: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe851a038  ! 160: LDSH_I	ldsh	[%r6 + 0x0038], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe45b2038  ! 163: LDX_I	ldx	[%r12 + 0x0038], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec12c008  ! 166: LDUH_R	lduh	[%r11 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 175: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec0b6030  ! 176: LDUB_I	ldub	[%r13 + 0x0030], %r22
	.word 0xe44ac008  ! 177: LDSB_R	ldsb	[%r11 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae008  ! 179: STB_I	stb	%r16, [%r11 + 0x0008]
	.word 0xe0432018  ! 180: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b4008  ! 182: LDX_R	ldx	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3ba020  ! 186: STD_I	std	%r22, [%r14 + 0x0020]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4332008  ! 189: STH_I	sth	%r18, [%r12 + 0x0008]
	.word 0xe839c008  ! 190: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe032a038  ! 191: STH_I	sth	%r16, [%r10 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe002a028  ! 194: LDUW_I	lduw	[%r10 + 0x0028], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0530008  ! 196: LDSH_R	ldsh	[%r12 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe83ba028  ! 198: STD_I	std	%r20, [%r14 + 0x0028]
	.word 0xec528008  ! 199: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe0218008  ! 201: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xac034008  ! 202: ADD_R	add 	%r13, %r8, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439e010  ! 206: STD_I	std	%r18, [%r7 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e010  ! 215: STB_I	stb	%r16, [%r7 + 0x0010]
	.word 0xe82a8008  ! 216: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe041a020  ! 217: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xe409e010  ! 218: LDUB_I	ldub	[%r7 + 0x0010], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a000  ! 221: STB_I	stb	%r22, [%r6 + 0x0000]
	.word 0xe00b4008  ! 222: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe01b0008  ! 223: LDD_R	ldd	[%r12 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe001a000  ! 225: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe4318008  ! 226: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe451a000  ! 229: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e020  ! 232: STW_I	stw	%r20, [%r7 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe002a038  ! 234: LDUW_I	lduw	[%r10 + 0x0038], %r16
	.word 0xe041e030  ! 235: LDSW_I	ldsw	[%r7 + 0x0030], %r16
	.word 0xe43aa038  ! 236: STD_I	std	%r18, [%r10 + 0x0038]
	.word 0xe05ac008  ! 237: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xa031c008  ! 238: SUBC_R	orn 	%r7, %r8, %r16
	.word 0xe071e008  ! 239: STX_I	stx	%r16, [%r7 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ba030  ! 241: LDD_I	ldd	[%r14 + 0x0030], %r16
	.word 0xe419c008  ! 242: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe072a030  ! 243: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xec528008  ! 244: LDSH_R	ldsh	[%r10 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa09b6020  ! 246: XORcc_I	xorcc 	%r13, 0x0020, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051e020  ! 252: LDSH_I	ldsh	[%r7 + 0x0020], %r16
	.word 0xe829c008  ! 253: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe84ac008  ! 254: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe8098008  ! 255: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe021e008  ! 256: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xe809e008  ! 257: LDUB_I	ldub	[%r7 + 0x0008], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec32a020  ! 261: STH_I	sth	%r22, [%r10 + 0x0020]
	.word 0xe413a030  ! 262: LDUH_I	lduh	[%r14 + 0x0030], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 264: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03ba018  ! 269: STD_I	std	%r16, [%r14 + 0x0018]
	.word 0xe802c008  ! 270: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe0128008  ! 271: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe4018008  ! 272: LDUW_R	lduw	[%r6 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae008  ! 276: STB_I	stb	%r18, [%r11 + 0x0008]
	.word 0xe8538008  ! 277: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe003a038  ! 278: LDUW_I	lduw	[%r14 + 0x0038], %r16
	.word 0xe45aa000  ! 279: LDX_I	ldx	[%r10 + 0x0000], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8132018  ! 281: LDUH_I	lduh	[%r12 + 0x0018], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3aa018  ! 283: STD_I	std	%r22, [%r10 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021a000  ! 285: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe451c008  ! 286: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xec1ac008  ! 287: LDD_R	ldd	[%r11 + %r8], %r22
	.word 0xec41a020  ! 288: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b2008  ! 291: STD_I	std	%r16, [%r12 + 0x0008]
	.word 0xe83ba028  ! 292: STD_I	std	%r20, [%r14 + 0x0028]
	.word 0xe841a030  ! 293: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe822a008  ! 296: STW_I	stw	%r20, [%r10 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe449e018  ! 4: LDSB_I	ldsb	[%r7 + 0x0018], %r18
	.word 0xe839a030  ! 5: STD_I	std	%r20, [%r6 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2aa018  ! 8: STB_I	stb	%r22, [%r10 + 0x0018]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51c008  ! 10: LDSH_R	ldsh	[%r7 + %r8], %r22
	.word 0xe44ac008  ! 11: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xa492c008  ! 12: ORcc_R	orcc 	%r11, %r8, %r18
	.word 0xe42b6008  ! 13: STB_I	stb	%r18, [%r13 + 0x0008]
	.word 0xe4598008  ! 14: LDX_R	ldx	[%r6 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8234008  ! 20: STW_R	stw	%r20, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 23: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec21c008  ! 24: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe02a8008  ! 25: STB_R	stb	%r16, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 29: STB_R	stb	%r16, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe072a000  ! 34: STX_I	stx	%r16, [%r10 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8736008  ! 36: STX_I	stx	%r20, [%r13 + 0x0008]
	.word 0xe0030008  ! 37: LDUW_R	lduw	[%r12 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819c008  ! 41: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xe402a018  ! 42: LDUW_I	lduw	[%r10 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 47: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe401c008  ! 48: LDUW_R	lduw	[%r7 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa018  ! 52: STB_I	stb	%r18, [%r10 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4328008  ! 55: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe02b2018  ! 56: STB_I	stb	%r16, [%r12 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa40b0008  ! 59: AND_R	and 	%r12, %r8, %r18
	.word 0xe02b0008  ! 60: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe052a020  ! 61: LDSH_I	ldsh	[%r10 + 0x0020], %r16
	.word 0xe8734008  ! 62: STX_R	stx	%r20, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec518008  ! 64: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe829a018  ! 65: STB_I	stb	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3ac008  ! 67: STD_R	std	%r22, [%r11 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe071a000  ! 71: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xe072a008  ! 72: STX_I	stx	%r16, [%r10 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83b2000  ! 74: STD_I	std	%r20, [%r12 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021e010  ! 79: STW_I	stw	%r16, [%r7 + 0x0010]
	.word 0xe049e010  ! 80: LDSB_I	ldsb	[%r7 + 0x0010], %r16
	.word 0xe431a018  ! 81: STH_I	sth	%r18, [%r6 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec136020  ! 84: LDUH_I	lduh	[%r13 + 0x0020], %r22
	.word 0xe03ba018  ! 85: STD_I	std	%r16, [%r14 + 0x0018]
	.word 0xe829c008  ! 86: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe031c008  ! 87: STH_R	sth	%r16, [%r7 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 95: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe821c008  ! 96: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xec134008  ! 97: LDUH_R	lduh	[%r13 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b2000  ! 99: LDX_I	ldx	[%r12 + 0x0000], %r20
	.word 0xe851e008  ! 100: LDSH_I	ldsh	[%r7 + 0x0008], %r20
	.word 0xec518008  ! 101: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe01b4008  ! 102: LDD_R	ldd	[%r13 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 104: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec328008  ! 105: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe0436028  ! 106: LDSW_I	ldsw	[%r13 + 0x0028], %r16
	.word 0xe0128008  ! 107: LDUH_R	lduh	[%r10 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41aa008  ! 114: LDD_I	ldd	[%r10 + 0x0008], %r18
	.word 0xe8234008  ! 115: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe82a8008  ! 116: STB_R	stb	%r20, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80b4008  ! 119: LDUB_R	ldub	[%r13 + %r8], %r20
	.word 0xe40a8008  ! 120: LDUB_R	ldub	[%r10 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4330008  ! 122: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe41aa008  ! 123: LDD_I	ldd	[%r10 + 0x0008], %r18
	.word 0xe0328008  ! 124: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a020  ! 126: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xe003a038  ! 127: LDUW_I	lduw	[%r14 + 0x0038], %r16
	.word 0xec52c008  ! 128: LDSH_R	ldsh	[%r11 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4a8008  ! 132: LDSB_R	ldsb	[%r10 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe40b4008  ! 134: LDUB_R	ldub	[%r13 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe432c008  ! 138: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe8236008  ! 139: STW_I	stw	%r20, [%r13 + 0x0008]
	.word 0xe421e028  ! 140: STW_I	stw	%r18, [%r7 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec5ac008  ! 142: LDX_R	ldx	[%r11 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe012e000  ! 145: LDUH_I	lduh	[%r11 + 0x0000], %r16
	.word 0xe8218008  ! 146: STW_R	stw	%r20, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe459a020  ! 148: LDX_I	ldx	[%r6 + 0x0020], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe011c008  ! 152: LDUH_R	lduh	[%r7 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51a028  ! 154: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0730008  ! 156: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe011a038  ! 159: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xe00b2018  ! 160: LDUB_I	ldub	[%r12 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe059e010  ! 163: LDX_I	ldx	[%r7 + 0x0010], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852e018  ! 166: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 175: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe411a028  ! 176: LDUH_I	lduh	[%r6 + 0x0028], %r18
	.word 0xec43a030  ! 177: LDSW_I	ldsw	[%r14 + 0x0030], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec71a028  ! 179: STX_I	stx	%r22, [%r6 + 0x0028]
	.word 0xe0434008  ! 180: LDSW_R	ldsw	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01a038  ! 182: LDUW_I	lduw	[%r6 + 0x0038], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b8008  ! 186: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b6010  ! 189: STB_I	stb	%r16, [%r13 + 0x0010]
	.word 0xe82b0008  ! 190: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe029e028  ! 191: STB_I	stb	%r16, [%r7 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe441a000  ! 194: LDSW_I	ldsw	[%r6 + 0x0000], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe052a010  ! 196: LDSH_I	ldsh	[%r10 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae020  ! 198: STD_I	std	%r16, [%r11 + 0x0020]
	.word 0xec09a038  ! 199: LDUB_I	ldub	[%r6 + 0x0038], %r22
	.word 0xec73a030  ! 201: STX_I	stx	%r22, [%r14 + 0x0030]
	.word 0xa0b32008  ! 202: SUBCcc_I	orncc 	%r12, 0x0008, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec332020  ! 206: STH_I	sth	%r22, [%r12 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4398008  ! 215: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe439a020  ! 216: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xe002e038  ! 217: LDUW_I	lduw	[%r11 + 0x0038], %r16
	.word 0xec11e010  ! 218: LDUH_I	lduh	[%r7 + 0x0010], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 221: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe049e038  ! 222: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	.word 0xe01b6010  ! 223: LDD_I	ldd	[%r13 + 0x0010], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8018008  ! 225: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe0332018  ! 226: STH_I	sth	%r16, [%r12 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec4b8008  ! 229: LDSB_R	ldsb	[%r14 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 232: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec536000  ! 234: LDSH_I	ldsh	[%r13 + 0x0000], %r22
	.word 0xe4028008  ! 235: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe421e038  ! 236: STW_I	stw	%r18, [%r7 + 0x0038]
	.word 0xe05ac008  ! 237: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xa4936000  ! 238: ORcc_I	orcc 	%r13, 0x0000, %r18
	.word 0xe42b0008  ! 239: STB_R	stb	%r18, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b0008  ! 241: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe04b2018  ! 242: LDSB_I	ldsb	[%r12 + 0x0018], %r16
	.word 0xe83b8008  ! 243: STD_R	std	%r20, [%r14 + %r8]
	.word 0xec1ae000  ! 244: LDD_I	ldd	[%r11 + 0x0000], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa829c008  ! 246: ANDN_R	andn 	%r7, %r8, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe859a030  ! 252: LDX_I	ldx	[%r6 + 0x0030], %r20
	.word 0xe029e000  ! 253: STB_I	stb	%r16, [%r7 + 0x0000]
	.word 0xec134008  ! 254: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xec09c008  ! 255: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xe02b2020  ! 256: STB_I	stb	%r16, [%r12 + 0x0020]
	.word 0xe80b6010  ! 257: LDUB_I	ldub	[%r13 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe429c008  ! 261: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe41ae010  ! 262: LDD_I	ldd	[%r11 + 0x0010], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe833a010  ! 264: STH_I	sth	%r20, [%r14 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec29a020  ! 269: STB_I	stb	%r22, [%r6 + 0x0020]
	.word 0xec59a018  ! 270: LDX_I	ldx	[%r6 + 0x0018], %r22
	.word 0xe01a8008  ! 271: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe811a028  ! 272: LDUH_I	lduh	[%r6 + 0x0028], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 276: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe0434008  ! 277: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xec49a000  ! 278: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xe81ac008  ! 279: LDD_R	ldd	[%r11 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ac008  ! 281: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8328008  ! 283: STH_R	sth	%r20, [%r10 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82ba000  ! 285: STB_I	stb	%r20, [%r14 + 0x0000]
	.word 0xe019a018  ! 286: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xe442c008  ! 287: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe0428008  ! 288: LDSW_R	ldsw	[%r10 + %r8], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31a010  ! 291: STH_I	sth	%r22, [%r6 + 0x0010]
	.word 0xec32c008  ! 292: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xec4aa020  ! 293: LDSB_I	ldsb	[%r10 + 0x0020], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031a030  ! 296: STH_I	sth	%r16, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4498008  ! 4: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec31a010  ! 5: STH_I	sth	%r22, [%r6 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 8: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe043a010  ! 10: LDSW_I	ldsw	[%r14 + 0x0010], %r16
	.word 0xe4530008  ! 11: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xa0b2c008  ! 12: SUBCcc_R	orncc 	%r11, %r8, %r16
	.word 0xe02b2008  ! 13: STB_I	stb	%r16, [%r12 + 0x0008]
	.word 0xe44b6030  ! 14: LDSB_I	ldsb	[%r13 + 0x0030], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832a008  ! 20: STH_I	sth	%r20, [%r10 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032e000  ! 23: STH_I	sth	%r16, [%r11 + 0x0000]
	.word 0xe422e020  ! 24: STW_I	stw	%r18, [%r11 + 0x0020]
	.word 0xe82b4008  ! 25: STB_R	stb	%r20, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a028  ! 29: STB_I	stb	%r16, [%r6 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03b0008  ! 34: STD_R	std	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe43b8008  ! 36: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe4136010  ! 37: LDUH_I	lduh	[%r13 + 0x0010], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84ba020  ! 41: LDSB_I	ldsb	[%r14 + 0x0020], %r20
	.word 0xe40ba008  ! 42: LDUB_I	ldub	[%r14 + 0x0008], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02a8008  ! 47: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe049a010  ! 48: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 52: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ae008  ! 55: STB_I	stb	%r22, [%r11 + 0x0008]
	.word 0xe421a030  ! 56: STW_I	stw	%r18, [%r6 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4aa8008  ! 59: ANDNcc_R	andncc 	%r10, %r8, %r18
	.word 0xe8298008  ! 60: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe00aa020  ! 61: LDUB_I	ldub	[%r10 + 0x0020], %r16
	.word 0xe832e018  ! 62: STH_I	sth	%r20, [%r11 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b8008  ! 64: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xe4718008  ! 65: STX_R	stx	%r18, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe823a010  ! 67: STW_I	stw	%r20, [%r14 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe02b8008  ! 71: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe039e008  ! 72: STD_I	std	%r16, [%r7 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe032a020  ! 74: STH_I	sth	%r16, [%r10 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe83b2020  ! 79: STD_I	std	%r20, [%r12 + 0x0020]
	.word 0xe0034008  ! 80: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe029c008  ! 81: STB_R	stb	%r16, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec59a000  ! 84: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xe03a8008  ! 85: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec2b6028  ! 86: STB_I	stb	%r22, [%r13 + 0x0028]
	.word 0xe02b8008  ! 87: STB_R	stb	%r16, [%r14 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439c008  ! 95: STD_R	std	%r18, [%r7 + %r8]
	.word 0xec238008  ! 96: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe842a028  ! 97: LDSW_I	ldsw	[%r10 + 0x0028], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19a018  ! 99: LDD_I	ldd	[%r6 + 0x0018], %r22
	.word 0xe4032020  ! 100: LDUW_I	lduw	[%r12 + 0x0020], %r18
	.word 0xe052e030  ! 101: LDSH_I	ldsh	[%r11 + 0x0030], %r16
	.word 0xe459a018  ! 102: LDX_I	ldx	[%r6 + 0x0018], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa000  ! 104: STB_I	stb	%r20, [%r10 + 0x0000]
	.word 0xe031e038  ! 105: STH_I	sth	%r16, [%r7 + 0x0038]
	.word 0xe4034008  ! 106: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe41b4008  ! 107: LDD_R	ldd	[%r13 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0534008  ! 114: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe02b0008  ! 115: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe43b4008  ! 116: STD_R	std	%r18, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe84b8008  ! 119: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe04aa010  ! 120: LDSB_I	ldsb	[%r10 + 0x0010], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e020  ! 122: STX_I	stx	%r16, [%r11 + 0x0020]
	.word 0xec5ba010  ! 123: LDX_I	ldx	[%r14 + 0x0010], %r22
	.word 0xe03b4008  ! 124: STD_R	std	%r16, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec036028  ! 126: LDUW_I	lduw	[%r13 + 0x0028], %r22
	.word 0xe00ae028  ! 127: LDUB_I	ldub	[%r11 + 0x0028], %r16
	.word 0xe842e018  ! 128: LDSW_I	ldsw	[%r11 + 0x0018], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe412a030  ! 132: LDUH_I	lduh	[%r10 + 0x0030], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0098008  ! 134: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2a8008  ! 138: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xec29c008  ! 139: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe023a010  ! 140: STW_I	stw	%r16, [%r14 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4138008  ! 142: LDUH_R	lduh	[%r14 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe842a028  ! 145: LDSW_I	ldsw	[%r10 + 0x0028], %r20
	.word 0xec29a008  ! 146: STB_I	stb	%r22, [%r6 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe013a018  ! 148: LDUH_I	lduh	[%r14 + 0x0018], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe009e030  ! 152: LDUB_I	ldub	[%r7 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041a030  ! 154: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe439a020  ! 156: STD_I	std	%r18, [%r6 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec51a028  ! 159: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	.word 0xe0034008  ! 160: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe81ac008  ! 163: LDD_R	ldd	[%r11 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a030  ! 166: LDUH_I	lduh	[%r6 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe03ba030  ! 175: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xe0098008  ! 176: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe0098008  ! 177: LDUB_R	ldub	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 179: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe4134008  ! 180: LDUH_R	lduh	[%r13 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b2028  ! 182: LDSB_I	ldsb	[%r12 + 0x0028], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 186: STH_R	sth	%r16, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e038  ! 189: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe422e010  ! 190: STW_I	stw	%r18, [%r11 + 0x0010]
	.word 0xe073a030  ! 191: STX_I	stx	%r16, [%r14 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0132000  ! 194: LDUH_I	lduh	[%r12 + 0x0000], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04a8008  ! 196: LDSB_R	ldsb	[%r10 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec31a018  ! 198: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xec5ac008  ! 199: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xec3b4008  ! 201: STD_R	std	%r22, [%r13 + %r8]
	.word 0xa802a008  ! 202: ADD_I	add 	%r10, 0x0008, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b2028  ! 206: STD_I	std	%r22, [%r12 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b6028  ! 215: STB_I	stb	%r22, [%r13 + 0x0028]
	.word 0xec2ba000  ! 216: STB_I	stb	%r22, [%r14 + 0x0000]
	.word 0xec1b0008  ! 217: LDD_R	ldd	[%r12 + %r8], %r22
	.word 0xec5aa018  ! 218: LDX_I	ldx	[%r10 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e038  ! 221: STW_I	stw	%r20, [%r7 + 0x0038]
	.word 0xe0028008  ! 222: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xec1ac008  ! 223: LDD_R	ldd	[%r11 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe01aa000  ! 225: LDD_I	ldd	[%r10 + 0x0000], %r16
	.word 0xe02ac008  ! 226: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe409a008  ! 229: LDUB_I	ldub	[%r6 + 0x0008], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0728008  ! 232: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe41b0008  ! 234: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe0518008  ! 235: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8398008  ! 236: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe45b4008  ! 237: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xa00ba030  ! 238: AND_I	and 	%r14, 0x0030, %r16
	.word 0xe02ae038  ! 239: STB_I	stb	%r16, [%r11 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8532000  ! 241: LDSH_I	ldsh	[%r12 + 0x0000], %r20
	.word 0xec0a8008  ! 242: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xec298008  ! 243: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe05b8008  ! 244: LDX_R	ldx	[%r14 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa03ba020  ! 246: XNOR_I	xnor 	%r14, 0x0020, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8032020  ! 252: LDUW_I	lduw	[%r12 + 0x0020], %r20
	.word 0xe02b4008  ! 253: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe01a8008  ! 254: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xec4b6010  ! 255: LDSB_I	ldsb	[%r13 + 0x0010], %r22
	.word 0xe839a008  ! 256: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xe45a8008  ! 257: LDX_R	ldx	[%r10 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe029c008  ! 261: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe00ba028  ! 262: LDUB_I	ldub	[%r14 + 0x0028], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 264: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 269: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xec13a018  ! 270: LDUH_I	lduh	[%r14 + 0x0018], %r22
	.word 0xe0534008  ! 271: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xec4aa030  ! 272: LDSB_I	ldsb	[%r10 + 0x0030], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe821c008  ! 276: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe81b0008  ! 277: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe401a018  ! 278: LDUW_I	lduw	[%r6 + 0x0018], %r18
	.word 0xe002c008  ! 279: LDUW_R	lduw	[%r11 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ae030  ! 281: LDSB_I	ldsb	[%r11 + 0x0030], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a008  ! 283: STB_I	stb	%r22, [%r6 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 285: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe05ac008  ! 286: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe0098008  ! 287: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe40ac008  ! 288: LDUB_R	ldub	[%r11 + %r8], %r18
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 291: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe873a020  ! 292: STX_I	stx	%r20, [%r14 + 0x0020]
	.word 0xec19a010  ! 293: LDD_I	ldd	[%r6 + 0x0010], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029e020  ! 296: STB_I	stb	%r16, [%r7 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80b2030  ! 4: LDUB_I	ldub	[%r12 + 0x0030], %r20
	.word 0xe8228008  ! 5: STW_R	stw	%r20, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 8: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec130008  ! 10: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe849a038  ! 11: LDSB_I	ldsb	[%r6 + 0x0038], %r20
	.word 0xa0832010  ! 12: ADDcc_I	addcc 	%r12, 0x0010, %r16
	.word 0xe82a8008  ! 13: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe80aa010  ! 14: LDUB_I	ldub	[%r10 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6038  ! 20: STD_I	std	%r16, [%r13 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02aa020  ! 23: STB_I	stb	%r16, [%r10 + 0x0020]
	.word 0xe022e000  ! 24: STW_I	stw	%r16, [%r11 + 0x0000]
	.word 0xe423a000  ! 25: STW_I	stw	%r18, [%r14 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a018  ! 29: STX_I	stx	%r16, [%r6 + 0x0018]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec338008  ! 34: STH_R	sth	%r22, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec21c008  ! 36: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe009a018  ! 37: LDUB_I	ldub	[%r6 + 0x0018], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b6028  ! 41: LDUB_I	ldub	[%r13 + 0x0028], %r22
	.word 0xe40a8008  ! 42: LDUB_R	ldub	[%r10 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6030  ! 47: STB_I	stb	%r16, [%r13 + 0x0030]
	.word 0xe0438008  ! 48: LDSW_R	ldsw	[%r14 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 52: STH_R	sth	%r16, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe473a018  ! 55: STX_I	stx	%r18, [%r14 + 0x0018]
	.word 0xe0330008  ! 56: STH_R	sth	%r16, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0934008  ! 59: ORcc_R	orcc 	%r13, %r8, %r16
	.word 0xe4298008  ! 60: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe011e008  ! 61: LDUH_I	lduh	[%r7 + 0x0008], %r16
	.word 0xe072c008  ! 62: STX_R	stx	%r16, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81ba028  ! 64: LDD_I	ldd	[%r14 + 0x0028], %r20
	.word 0xec232018  ! 65: STW_I	stw	%r22, [%r12 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2b8008  ! 67: STB_R	stb	%r22, [%r14 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec338008  ! 71: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe03b4008  ! 72: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe829a010  ! 74: STB_I	stb	%r20, [%r6 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa020  ! 79: STB_I	stb	%r20, [%r10 + 0x0020]
	.word 0xe0128008  ! 80: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe03b4008  ! 81: STD_R	std	%r16, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe819c008  ! 84: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xec738008  ! 85: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xec21c008  ! 86: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe03b6038  ! 87: STD_I	std	%r16, [%r13 + 0x0038]
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832e018  ! 95: STH_I	sth	%r20, [%r11 + 0x0018]
	.word 0xe4238008  ! 96: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe409e038  ! 97: LDUB_I	ldub	[%r7 + 0x0038], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 99: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe052a010  ! 100: LDSH_I	ldsh	[%r10 + 0x0010], %r16
	.word 0xe00b0008  ! 101: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe0032018  ! 102: LDUW_I	lduw	[%r12 + 0x0018], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe039e038  ! 104: STD_I	std	%r16, [%r7 + 0x0038]
	.word 0xec336018  ! 105: STH_I	sth	%r22, [%r13 + 0x0018]
	.word 0xe0598008  ! 106: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe802c008  ! 107: LDUW_R	lduw	[%r11 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a030  ! 114: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xec730008  ! 115: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe83ae018  ! 116: STD_I	std	%r20, [%r11 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe051a018  ! 119: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe803a028  ! 120: LDUW_I	lduw	[%r14 + 0x0028], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0728008  ! 122: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe001c008  ! 123: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe029a038  ! 124: STB_I	stb	%r16, [%r6 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4432008  ! 126: LDSW_I	ldsw	[%r12 + 0x0008], %r18
	.word 0xe049a008  ! 127: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xe41ba000  ! 128: LDD_I	ldd	[%r14 + 0x0000], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0130008  ! 132: LDUH_R	lduh	[%r12 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4598008  ! 134: LDX_R	ldx	[%r6 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831e000  ! 138: STH_I	sth	%r20, [%r7 + 0x0000]
	.word 0xe42ac008  ! 139: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe03ac008  ! 140: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe81b4008  ! 142: LDD_R	ldd	[%r13 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe411a030  ! 145: LDUH_I	lduh	[%r6 + 0x0030], %r18
	.word 0xe429c008  ! 146: STB_R	stb	%r18, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8136028  ! 148: LDUH_I	lduh	[%r13 + 0x0028], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec11c008  ! 152: LDUH_R	lduh	[%r7 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00a8008  ! 154: LDUB_R	ldub	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 156: STD_R	std	%r22, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4534008  ! 159: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe4038008  ! 160: LDUW_R	lduw	[%r14 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec49a018  ! 163: LDSB_I	ldsb	[%r6 + 0x0018], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4428008  ! 166: LDSW_R	ldsw	[%r10 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 175: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe01ae008  ! 176: LDD_I	ldd	[%r11 + 0x0008], %r16
	.word 0xe011a008  ! 177: LDUH_I	lduh	[%r6 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe039e020  ! 179: STD_I	std	%r16, [%r7 + 0x0020]
	.word 0xe811e020  ! 180: LDUH_I	lduh	[%r7 + 0x0020], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 182: LDUH_R	lduh	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b2010  ! 186: STB_I	stb	%r18, [%r12 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4236000  ! 189: STW_I	stw	%r18, [%r13 + 0x0000]
	.word 0xe039e018  ! 190: STD_I	std	%r16, [%r7 + 0x0018]
	.word 0xe821a028  ! 191: STW_I	stw	%r20, [%r6 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xec41a028  ! 194: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4034008  ! 196: LDUW_R	lduw	[%r13 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe823a018  ! 198: STW_I	stw	%r20, [%r14 + 0x0018]
	.word 0xe011a000  ! 199: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xe43ac008  ! 201: STD_R	std	%r18, [%r11 + %r8]
	.word 0xac41c008  ! 202: ADDC_R	addc 	%r7, %r8, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39c008  ! 206: STD_R	std	%r22, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 215: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe8338008  ! 216: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe802e020  ! 217: LDUW_I	lduw	[%r11 + 0x0020], %r20
	.word 0xe041a028  ! 218: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a030  ! 221: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xec4b6010  ! 222: LDSB_I	ldsb	[%r13 + 0x0010], %r22
	.word 0xec01a028  ! 223: LDUW_I	lduw	[%r6 + 0x0028], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe049e020  ! 225: LDSB_I	ldsb	[%r7 + 0x0020], %r16
	.word 0xe4318008  ! 226: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec128008  ! 229: LDUH_R	lduh	[%r10 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 232: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec01e010  ! 234: LDUW_I	lduw	[%r7 + 0x0010], %r22
	.word 0xe842c008  ! 235: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xe03aa010  ! 236: STD_I	std	%r16, [%r10 + 0x0010]
	.word 0xe849c008  ! 237: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xac91e038  ! 238: ORcc_I	orcc 	%r7, 0x0038, %r22
	.word 0xe0218008  ! 239: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019e020  ! 241: LDD_I	ldd	[%r7 + 0x0020], %r16
	.word 0xe04ba020  ! 242: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	.word 0xe02ae038  ! 243: STB_I	stb	%r16, [%r11 + 0x0038]
	.word 0xe01ac008  ! 244: LDD_R	ldd	[%r11 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac818008  ! 246: ADDcc_R	addcc 	%r6, %r8, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec42c008  ! 252: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xe871e030  ! 253: STX_I	stx	%r20, [%r7 + 0x0030]
	.word 0xe841e030  ! 254: LDSW_I	ldsw	[%r7 + 0x0030], %r20
	.word 0xe01b0008  ! 255: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe03b6028  ! 256: STD_I	std	%r16, [%r13 + 0x0028]
	.word 0xe441a028  ! 257: LDSW_I	ldsw	[%r6 + 0x0028], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe832e008  ! 261: STH_I	sth	%r20, [%r11 + 0x0008]
	.word 0xe411c008  ! 262: LDUH_R	lduh	[%r7 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec336010  ! 264: STH_I	sth	%r22, [%r13 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83ae030  ! 269: STD_I	std	%r20, [%r11 + 0x0030]
	.word 0xe01b8008  ! 270: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xec09a018  ! 271: LDUB_I	ldub	[%r6 + 0x0018], %r22
	.word 0xe451a008  ! 272: LDSH_I	ldsh	[%r6 + 0x0008], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83ba000  ! 276: STD_I	std	%r20, [%r14 + 0x0000]
	.word 0xe001a030  ! 277: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xec09e028  ! 278: LDUB_I	ldub	[%r7 + 0x0028], %r22
	.word 0xe411e038  ! 279: LDUH_I	lduh	[%r7 + 0x0038], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec098008  ! 281: LDUB_R	ldub	[%r6 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032a000  ! 283: STH_I	sth	%r16, [%r10 + 0x0000]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8298008  ! 285: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe40b4008  ! 286: LDUB_R	ldub	[%r13 + %r8], %r18
	.word 0xe051c008  ! 287: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe05b2020  ! 288: LDX_I	ldx	[%r12 + 0x0020], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe473a028  ! 291: STX_I	stx	%r18, [%r14 + 0x0028]
	.word 0xec29e010  ! 292: STB_I	stb	%r22, [%r7 + 0x0010]
	.word 0xe0032010  ! 293: LDUW_I	lduw	[%r12 + 0x0010], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec31c008  ! 296: STH_R	sth	%r22, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe01aa010  ! 4: LDD_I	ldd	[%r10 + 0x0010], %r16
	.word 0xe8318008  ! 5: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ae000  ! 8: STD_I	std	%r18, [%r11 + 0x0000]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b0008  ! 10: LDUB_R	ldub	[%r12 + %r8], %r22
	.word 0xe04b8008  ! 11: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xac29a010  ! 12: ANDN_I	andn 	%r6, 0x0010, %r22
	.word 0xe822c008  ! 13: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe04b4008  ! 14: LDSB_R	ldsb	[%r13 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472e008  ! 20: STX_I	stx	%r18, [%r11 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e010  ! 23: STX_I	stx	%r16, [%r7 + 0x0010]
	.word 0xec71c008  ! 24: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe0234008  ! 25: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a020  ! 29: STX_I	stx	%r16, [%r6 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe471e038  ! 34: STX_I	stx	%r18, [%r7 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 36: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe852e020  ! 37: LDSH_I	ldsh	[%r11 + 0x0020], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe842e010  ! 41: LDSW_I	ldsw	[%r11 + 0x0010], %r20
	.word 0xe41aa038  ! 42: LDD_I	ldd	[%r10 + 0x0038], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431e008  ! 47: STH_I	sth	%r18, [%r7 + 0x0008]
	.word 0xe013a028  ! 48: LDUH_I	lduh	[%r14 + 0x0028], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 52: STW_R	stw	%r16, [%r7 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a018  ! 55: STH_I	sth	%r16, [%r14 + 0x0018]
	.word 0xe832c008  ! 56: STH_R	sth	%r20, [%r11 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b2e018  ! 59: ORNcc_I	orncc 	%r11, 0x0018, %r16
	.word 0xec31a038  ! 60: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xe002a020  ! 61: LDUW_I	lduw	[%r10 + 0x0020], %r16
	.word 0xe839a008  ! 62: STD_I	std	%r20, [%r6 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec034008  ! 64: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe029a028  ! 65: STB_I	stb	%r16, [%r6 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 67: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe43b2000  ! 71: STD_I	std	%r18, [%r12 + 0x0000]
	.word 0xe8730008  ! 72: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8330008  ! 74: STH_R	sth	%r20, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec32c008  ! 79: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe8498008  ! 80: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe0736010  ! 81: STX_I	stx	%r16, [%r13 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe009a010  ! 84: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe42b4008  ! 85: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe02b4008  ! 86: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe0330008  ! 87: STH_R	sth	%r16, [%r12 + %r8]
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe073a000  ! 95: STX_I	stx	%r16, [%r14 + 0x0000]
	.word 0xe0238008  ! 96: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe85ae008  ! 97: LDX_I	ldx	[%r11 + 0x0008], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002a020  ! 99: LDUW_I	lduw	[%r10 + 0x0020], %r16
	.word 0xe051a030  ! 100: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xe8138008  ! 101: LDUH_R	lduh	[%r14 + %r8], %r20
	.word 0xec5ba018  ! 102: LDX_I	ldx	[%r14 + 0x0018], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 104: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe8218008  ! 105: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe409a038  ! 106: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe0432008  ! 107: LDSW_I	ldsw	[%r12 + 0x0008], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a010  ! 114: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xec230008  ! 115: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xec718008  ! 116: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe401a018  ! 119: LDUW_I	lduw	[%r6 + 0x0018], %r18
	.word 0xe8130008  ! 120: LDUH_R	lduh	[%r12 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 122: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe053a028  ! 123: LDSH_I	ldsh	[%r14 + 0x0028], %r16
	.word 0xec328008  ! 124: STH_R	sth	%r22, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a030  ! 126: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xe001a000  ! 127: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe003a000  ! 128: LDUW_I	lduw	[%r14 + 0x0000], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec032018  ! 132: LDUW_I	lduw	[%r12 + 0x0018], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec018008  ! 134: LDUW_R	lduw	[%r6 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429c008  ! 138: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe0298008  ! 139: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec32e030  ! 140: STH_I	sth	%r22, [%r11 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe802e030  ! 142: LDUW_I	lduw	[%r11 + 0x0030], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0134008  ! 145: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe429c008  ! 146: STB_R	stb	%r18, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05b2020  ! 148: LDX_I	ldx	[%r12 + 0x0020], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe453a010  ! 152: LDSH_I	ldsh	[%r14 + 0x0010], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012a038  ! 154: LDUH_I	lduh	[%r10 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029a038  ! 156: STB_I	stb	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe40b0008  ! 159: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xec018008  ! 160: LDUW_R	lduw	[%r6 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe802c008  ! 163: LDUW_R	lduw	[%r11 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459c008  ! 166: LDX_R	ldx	[%r7 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe429a010  ! 175: STB_I	stb	%r18, [%r6 + 0x0010]
	.word 0xe0418008  ! 176: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe449a038  ! 177: LDSB_I	ldsb	[%r6 + 0x0038], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b6018  ! 179: STD_I	std	%r16, [%r13 + 0x0018]
	.word 0xe0418008  ! 180: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe412e038  ! 182: LDUH_I	lduh	[%r11 + 0x0038], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21e030  ! 186: STW_I	stw	%r22, [%r7 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b6020  ! 189: STD_I	std	%r22, [%r13 + 0x0020]
	.word 0xe0728008  ! 190: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe422e028  ! 191: STW_I	stw	%r18, [%r11 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe009c008  ! 194: LDUB_R	ldub	[%r7 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec42e038  ! 196: LDSW_I	ldsw	[%r11 + 0x0038], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 198: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe009e008  ! 199: LDUB_I	ldub	[%r7 + 0x0008], %r16
	.word 0xe0338008  ! 201: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xa0398008  ! 202: XNOR_R	xnor 	%r6, %r8, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0338008  ! 206: STH_R	sth	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe823a000  ! 215: STW_I	stw	%r20, [%r14 + 0x0000]
	.word 0xec298008  ! 216: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe851e030  ! 217: LDSH_I	ldsh	[%r7 + 0x0030], %r20
	.word 0xe05b6038  ! 218: LDX_I	ldx	[%r13 + 0x0038], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a008  ! 221: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xe4418008  ! 222: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe0198008  ! 223: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0432018  ! 225: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	.word 0xe473a000  ! 226: STX_I	stx	%r18, [%r14 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec11a030  ! 229: LDUH_I	lduh	[%r6 + 0x0030], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0734008  ! 232: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe011a008  ! 234: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xec51a018  ! 235: LDSH_I	ldsh	[%r6 + 0x0018], %r22
	.word 0xe021a008  ! 236: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe001a018  ! 237: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xa8b3a018  ! 238: SUBCcc_I	orncc 	%r14, 0x0018, %r20
	.word 0xe831e038  ! 239: STH_I	sth	%r20, [%r7 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809a038  ! 241: LDUB_I	ldub	[%r6 + 0x0038], %r20
	.word 0xe0132020  ! 242: LDUH_I	lduh	[%r12 + 0x0020], %r16
	.word 0xe0298008  ! 243: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe849e028  ! 244: LDSB_I	ldsb	[%r7 + 0x0028], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac39c008  ! 246: XNOR_R	xnor 	%r7, %r8, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 252: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe472e020  ! 253: STX_I	stx	%r18, [%r11 + 0x0020]
	.word 0xe459c008  ! 254: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xe4530008  ! 255: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe832c008  ! 256: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe059c008  ! 257: LDX_R	ldx	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe0338008  ! 261: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe049c008  ! 262: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe822a018  ! 264: STW_I	stw	%r20, [%r10 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8230008  ! 269: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xec032000  ! 270: LDUW_I	lduw	[%r12 + 0x0000], %r22
	.word 0xec5b8008  ! 271: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xec1ac008  ! 272: LDD_R	ldd	[%r11 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 276: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe401e030  ! 277: LDUW_I	lduw	[%r7 + 0x0030], %r18
	.word 0xec036028  ! 278: LDUW_I	lduw	[%r13 + 0x0028], %r22
	.word 0xec13a038  ! 279: LDUH_I	lduh	[%r14 + 0x0038], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b6008  ! 281: LDUB_I	ldub	[%r13 + 0x0008], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 283: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0236018  ! 285: STW_I	stw	%r16, [%r13 + 0x0018]
	.word 0xe41b2008  ! 286: LDD_I	ldd	[%r12 + 0x0008], %r18
	.word 0xe0098008  ! 287: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec09a020  ! 288: LDUB_I	ldub	[%r6 + 0x0020], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 291: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe071a038  ! 292: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe0118008  ! 293: LDUH_R	lduh	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec328008  ! 296: STH_R	sth	%r22, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80aa018  ! 4: LDUB_I	ldub	[%r10 + 0x0018], %r20
	.word 0xe83ac008  ! 5: STD_R	std	%r20, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e008  ! 8: STW_I	stw	%r16, [%r7 + 0x0008]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec038008  ! 10: LDUW_R	lduw	[%r14 + %r8], %r22
	.word 0xe049a010  ! 11: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xa82a8008  ! 12: ANDN_R	andn 	%r10, %r8, %r20
	.word 0xe82ba038  ! 13: STB_I	stb	%r20, [%r14 + 0x0038]
	.word 0xe8436010  ! 14: LDSW_I	ldsw	[%r13 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a000  ! 20: STD_I	std	%r22, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e020  ! 23: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xec21a010  ! 24: STW_I	stw	%r22, [%r6 + 0x0010]
	.word 0xe839c008  ! 25: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03aa010  ! 29: STD_I	std	%r16, [%r10 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe43b0008  ! 34: STD_R	std	%r18, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 36: STD_R	std	%r16, [%r11 + %r8]
	.word 0xec4a8008  ! 37: LDSB_R	ldsb	[%r10 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b0008  ! 41: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xec42c008  ! 42: LDSW_R	ldsw	[%r11 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae010  ! 47: STB_I	stb	%r18, [%r11 + 0x0010]
	.word 0xe4034008  ! 48: LDUW_R	lduw	[%r13 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe832c008  ! 52: STH_R	sth	%r20, [%r11 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83aa030  ! 55: STD_I	std	%r20, [%r10 + 0x0030]
	.word 0xe82b6030  ! 56: STB_I	stb	%r20, [%r13 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b30008  ! 59: ORNcc_R	orncc 	%r12, %r8, %r16
	.word 0xe0730008  ! 60: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe01ae030  ! 61: LDD_I	ldd	[%r11 + 0x0030], %r16
	.word 0xe072a030  ! 62: STX_I	stx	%r16, [%r10 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b2020  ! 64: LDSB_I	ldsb	[%r12 + 0x0020], %r18
	.word 0xe821a020  ! 65: STW_I	stw	%r20, [%r6 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 67: STD_R	std	%r16, [%r11 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec2ac008  ! 71: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xec3b2008  ! 72: STD_I	std	%r22, [%r12 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec29e028  ! 74: STB_I	stb	%r22, [%r7 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe83b0008  ! 79: STD_R	std	%r20, [%r12 + %r8]
	.word 0xec1b6038  ! 80: LDD_I	ldd	[%r13 + 0x0038], %r22
	.word 0xe0328008  ! 81: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4138008  ! 84: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe82b4008  ! 85: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec3b2018  ! 86: STD_I	std	%r22, [%r12 + 0x0018]
	.word 0xe03b0008  ! 87: STD_R	std	%r16, [%r12 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a030  ! 95: STH_I	sth	%r16, [%r14 + 0x0030]
	.word 0xe021c008  ! 96: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xec0ae030  ! 97: LDUB_I	ldub	[%r11 + 0x0030], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a018  ! 99: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xe0128008  ! 100: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe012a018  ! 101: LDUH_I	lduh	[%r10 + 0x0018], %r16
	.word 0xe009a038  ! 102: LDUB_I	ldub	[%r6 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe039e008  ! 104: STD_I	std	%r16, [%r7 + 0x0008]
	.word 0xe43b6000  ! 105: STD_I	std	%r18, [%r13 + 0x0000]
	.word 0xe049a000  ! 106: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe009c008  ! 107: LDUB_R	ldub	[%r7 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b8008  ! 114: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe0338008  ! 115: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe829a018  ! 116: STB_I	stb	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe453a038  ! 119: LDSH_I	ldsh	[%r14 + 0x0038], %r18
	.word 0xe4018008  ! 120: LDUW_R	lduw	[%r6 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 122: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe059a030  ! 123: LDX_I	ldx	[%r6 + 0x0030], %r16
	.word 0xe872a018  ! 124: STX_I	stx	%r20, [%r10 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b4008  ! 126: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe41b4008  ! 127: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xe05b2020  ! 128: LDX_I	ldx	[%r12 + 0x0020], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05ae010  ! 132: LDX_I	ldx	[%r11 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe019c008  ! 134: LDD_R	ldd	[%r7 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72e020  ! 138: STX_I	stx	%r22, [%r11 + 0x0020]
	.word 0xe4238008  ! 139: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe03ac008  ! 140: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8528008  ! 142: LDSH_R	ldsh	[%r10 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4430008  ! 145: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe4230008  ! 146: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe041a000  ! 148: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe81b8008  ! 152: LDD_R	ldd	[%r14 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852e010  ! 154: LDSH_I	ldsh	[%r11 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe43a8008  ! 156: STD_R	std	%r18, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0aa028  ! 159: LDUB_I	ldub	[%r10 + 0x0028], %r22
	.word 0xe052c008  ! 160: LDSH_R	ldsh	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe05b8008  ! 163: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 166: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe472e008  ! 175: STX_I	stx	%r18, [%r11 + 0x0008]
	.word 0xe801c008  ! 176: LDUW_R	lduw	[%r7 + %r8], %r20
	.word 0xe81a8008  ! 177: LDD_R	ldd	[%r10 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6018  ! 179: STB_I	stb	%r16, [%r13 + 0x0018]
	.word 0xe019e010  ! 180: LDD_I	ldd	[%r7 + 0x0010], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00a8008  ! 182: LDUB_R	ldub	[%r10 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71a038  ! 186: STX_I	stx	%r22, [%r6 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a020  ! 189: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe82ac008  ! 190: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe0336000  ! 191: STH_I	sth	%r16, [%r13 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe441c008  ! 194: LDSW_R	ldsw	[%r7 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe44b8008  ! 196: LDSB_R	ldsb	[%r14 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0736028  ! 198: STX_I	stx	%r16, [%r13 + 0x0028]
	.word 0xe41a8008  ! 199: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe4334008  ! 201: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xac238008  ! 202: SUB_R	sub 	%r14, %r8, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b2038  ! 206: STD_I	std	%r20, [%r12 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31a038  ! 215: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xe02b8008  ! 216: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe042a038  ! 217: LDSW_I	ldsw	[%r10 + 0x0038], %r16
	.word 0xe84b2030  ! 218: LDSB_I	ldsb	[%r12 + 0x0030], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b2028  ! 221: STB_I	stb	%r16, [%r12 + 0x0028]
	.word 0xe8536038  ! 222: LDSH_I	ldsh	[%r13 + 0x0038], %r20
	.word 0xe0532020  ! 223: LDSH_I	ldsh	[%r12 + 0x0020], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0418008  ! 225: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe0730008  ! 226: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 229: LDD_R	ldd	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b8008  ! 232: STD_R	std	%r16, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe403a038  ! 234: LDUW_I	lduw	[%r14 + 0x0038], %r18
	.word 0xe45ac008  ! 235: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe821c008  ! 236: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xec1ba010  ! 237: LDD_I	ldd	[%r14 + 0x0010], %r22
	.word 0xa4418008  ! 238: ADDC_R	addc 	%r6, %r8, %r18
	.word 0xec29a020  ! 239: STB_I	stb	%r22, [%r6 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0532010  ! 241: LDSH_I	ldsh	[%r12 + 0x0010], %r16
	.word 0xe0118008  ! 242: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe82b0008  ! 243: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe849a030  ! 244: LDSB_I	ldsb	[%r6 + 0x0030], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa8098008  ! 246: AND_R	and 	%r6, %r8, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec032038  ! 252: LDUW_I	lduw	[%r12 + 0x0038], %r22
	.word 0xe821e008  ! 253: STW_I	stw	%r20, [%r7 + 0x0008]
	.word 0xe01ac008  ! 254: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe04b6020  ! 255: LDSB_I	ldsb	[%r13 + 0x0020], %r16
	.word 0xe02b8008  ! 256: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe052c008  ! 257: LDSH_R	ldsh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe0232008  ! 261: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xe4198008  ! 262: LDD_R	ldd	[%r6 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec39e008  ! 264: STD_I	std	%r22, [%r7 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3ae018  ! 269: STD_I	std	%r22, [%r11 + 0x0018]
	.word 0xe041c008  ! 270: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe8034008  ! 271: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe45b8008  ! 272: LDX_R	ldx	[%r14 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe471a000  ! 276: STX_I	stx	%r18, [%r6 + 0x0000]
	.word 0xe0138008  ! 277: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe40ac008  ! 278: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe051e038  ! 279: LDSH_I	ldsh	[%r7 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a020  ! 281: LDUB_I	ldub	[%r6 + 0x0020], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b4008  ! 283: STD_R	std	%r22, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4238008  ! 285: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe0018008  ! 286: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe851a008  ! 287: LDSH_I	ldsh	[%r6 + 0x0008], %r20
	.word 0xec01c008  ! 288: LDUW_R	lduw	[%r7 + %r8], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421c008  ! 291: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe82ae030  ! 292: STB_I	stb	%r20, [%r11 + 0x0030]
	.word 0xe84ac008  ! 293: LDSB_R	ldsb	[%r11 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 296: STX_R	stx	%r22, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe81b8008  ! 4: LDD_R	ldd	[%r14 + %r8], %r20
	.word 0xe02b4008  ! 5: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe833a008  ! 8: STH_I	sth	%r20, [%r14 + 0x0008]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44ba028  ! 10: LDSB_I	ldsb	[%r14 + 0x0028], %r18
	.word 0xe0436018  ! 11: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	.word 0xa0a9e008  ! 12: ANDNcc_I	andncc 	%r7, 0x0008, %r16
	.word 0xec32e020  ! 13: STH_I	sth	%r22, [%r11 + 0x0020]
	.word 0xe003a000  ! 14: LDUW_I	lduw	[%r14 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a030  ! 20: STB_I	stb	%r22, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8234008  ! 23: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe0736020  ! 24: STX_I	stx	%r16, [%r13 + 0x0020]
	.word 0xe872e030  ! 25: STX_I	stx	%r20, [%r11 + 0x0030]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 29: STW_R	stw	%r16, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82ac008  ! 34: STB_R	stb	%r20, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec39a028  ! 36: STD_I	std	%r22, [%r6 + 0x0028]
	.word 0xe44a8008  ! 37: LDSB_R	ldsb	[%r10 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec42c008  ! 41: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xe0134008  ! 42: LDUH_R	lduh	[%r13 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021e010  ! 47: STW_I	stw	%r16, [%r7 + 0x0010]
	.word 0xec0ba038  ! 48: LDUB_I	ldub	[%r14 + 0x0038], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe431a000  ! 52: STH_I	sth	%r18, [%r6 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4336000  ! 55: STH_I	sth	%r18, [%r13 + 0x0000]
	.word 0xec71c008  ! 56: STX_R	stx	%r22, [%r7 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac93a008  ! 59: ORcc_I	orcc 	%r14, 0x0008, %r22
	.word 0xe071a038  ! 60: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe01b0008  ! 61: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe8330008  ! 62: STH_R	sth	%r20, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4030008  ! 64: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe431e038  ! 65: STH_I	sth	%r18, [%r7 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe42ba038  ! 67: STB_I	stb	%r18, [%r14 + 0x0038]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec232038  ! 71: STW_I	stw	%r22, [%r12 + 0x0038]
	.word 0xe039a018  ! 72: STD_I	std	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec32e028  ! 74: STH_I	sth	%r22, [%r11 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec21a020  ! 79: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xe0498008  ! 80: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xec32e020  ! 81: STH_I	sth	%r22, [%r11 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe819a030  ! 84: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xe422e020  ! 85: STW_I	stw	%r18, [%r11 + 0x0020]
	.word 0xe0236010  ! 86: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe4318008  ! 87: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba038  ! 95: STD_I	std	%r16, [%r14 + 0x0038]
	.word 0xe021e038  ! 96: STW_I	stw	%r16, [%r7 + 0x0038]
	.word 0xe84b4008  ! 97: LDSB_R	ldsb	[%r13 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ba020  ! 99: LDSB_I	ldsb	[%r14 + 0x0020], %r22
	.word 0xe8536018  ! 100: LDSH_I	ldsh	[%r13 + 0x0018], %r20
	.word 0xec598008  ! 101: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe01b6000  ! 102: LDD_I	ldd	[%r13 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3aa038  ! 104: STD_I	std	%r22, [%r10 + 0x0038]
	.word 0xe0328008  ! 105: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe40b2018  ! 106: LDUB_I	ldub	[%r12 + 0x0018], %r18
	.word 0xe849c008  ! 107: LDSB_R	ldsb	[%r7 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41e038  ! 114: LDSW_I	ldsw	[%r7 + 0x0038], %r22
	.word 0xe0338008  ! 115: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe831a018  ! 116: STH_I	sth	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec12c008  ! 119: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xec434008  ! 120: LDSW_R	ldsw	[%r13 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831e010  ! 122: STH_I	sth	%r20, [%r7 + 0x0010]
	.word 0xec51a038  ! 123: LDSH_I	ldsh	[%r6 + 0x0038], %r22
	.word 0xe82ae008  ! 124: STB_I	stb	%r20, [%r11 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a000  ! 126: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xe85a8008  ! 127: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe01ae020  ! 128: LDD_I	ldd	[%r11 + 0x0020], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811e028  ! 132: LDUH_I	lduh	[%r7 + 0x0028], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec028008  ! 134: LDUW_R	lduw	[%r10 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ba000  ! 138: STB_I	stb	%r22, [%r14 + 0x0000]
	.word 0xec218008  ! 139: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe8338008  ! 140: STH_R	sth	%r20, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe01b4008  ! 142: LDD_R	ldd	[%r13 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0538008  ! 145: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe039a038  ! 146: STD_I	std	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4528008  ! 148: LDSH_R	ldsh	[%r10 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe81ac008  ! 152: LDD_R	ldd	[%r11 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51e000  ! 154: LDSH_I	ldsh	[%r7 + 0x0000], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 156: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe459c008  ! 159: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xe052c008  ! 160: LDSH_R	ldsh	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe041c008  ! 163: LDSW_R	ldsw	[%r7 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0138008  ! 166: LDUH_R	lduh	[%r14 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe429c008  ! 175: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xec4b8008  ! 176: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe859c008  ! 177: LDX_R	ldx	[%r7 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec736010  ! 179: STX_I	stx	%r22, [%r13 + 0x0010]
	.word 0xec018008  ! 180: LDUW_R	lduw	[%r6 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b8008  ! 182: LDX_R	ldx	[%r14 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72a020  ! 186: STX_I	stx	%r22, [%r10 + 0x0020]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae000  ! 189: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xec31e020  ! 190: STH_I	sth	%r22, [%r7 + 0x0020]
	.word 0xe829c008  ! 191: STB_R	stb	%r20, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe413a018  ! 194: LDUH_I	lduh	[%r14 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec498008  ! 196: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0332000  ! 198: STH_I	sth	%r16, [%r12 + 0x0000]
	.word 0xe859c008  ! 199: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe0718008  ! 201: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xa011c008  ! 202: OR_R	or 	%r7, %r8, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439e018  ! 206: STD_I	std	%r18, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0336010  ! 215: STH_I	sth	%r16, [%r13 + 0x0010]
	.word 0xe071c008  ! 216: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec598008  ! 217: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe0418008  ! 218: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471e028  ! 221: STX_I	stx	%r18, [%r7 + 0x0028]
	.word 0xe01a8008  ! 222: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe0518008  ! 223: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec1b2020  ! 225: LDD_I	ldd	[%r12 + 0x0020], %r22
	.word 0xe832a028  ! 226: STH_I	sth	%r20, [%r10 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec1a8008  ! 229: LDD_R	ldd	[%r10 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a000  ! 232: STH_I	sth	%r16, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4498008  ! 234: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe05b8008  ! 235: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe4228008  ! 236: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xec198008  ! 237: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa03b6008  ! 238: XNOR_I	xnor 	%r13, 0x0008, %r16
	.word 0xe0238008  ! 239: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe043a000  ! 241: LDSW_I	ldsw	[%r14 + 0x0000], %r16
	.word 0xe819a010  ! 242: LDD_I	ldd	[%r6 + 0x0010], %r20
	.word 0xec318008  ! 243: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe8598008  ! 244: LDX_R	ldx	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa409e000  ! 246: AND_I	and 	%r7, 0x0000, %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe802e030  ! 252: LDUW_I	lduw	[%r11 + 0x0030], %r20
	.word 0xec29a038  ! 253: STB_I	stb	%r22, [%r6 + 0x0038]
	.word 0xe44ba008  ! 254: LDSB_I	ldsb	[%r14 + 0x0008], %r18
	.word 0xe04a8008  ! 255: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe039e028  ! 256: STD_I	std	%r16, [%r7 + 0x0028]
	.word 0xe8138008  ! 257: LDUH_R	lduh	[%r14 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec22c008  ! 261: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe04b8008  ! 262: LDSB_R	ldsb	[%r14 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02aa020  ! 264: STB_I	stb	%r16, [%r10 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 269: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec430008  ! 270: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec1ba010  ! 271: LDD_I	ldd	[%r14 + 0x0010], %r22
	.word 0xec138008  ! 272: LDUH_R	lduh	[%r14 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83ba020  ! 276: STD_I	std	%r20, [%r14 + 0x0020]
	.word 0xe85b6008  ! 277: LDX_I	ldx	[%r13 + 0x0008], %r20
	.word 0xe051a008  ! 278: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xe0028008  ! 279: LDUW_R	lduw	[%r10 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841e008  ! 281: LDSW_I	ldsw	[%r7 + 0x0008], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 283: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec21e010  ! 285: STW_I	stw	%r22, [%r7 + 0x0010]
	.word 0xe452a008  ! 286: LDSH_I	ldsh	[%r10 + 0x0008], %r18
	.word 0xe05ae000  ! 287: LDX_I	ldx	[%r11 + 0x0000], %r16
	.word 0xe81b0008  ! 288: LDD_R	ldd	[%r12 + %r8], %r20
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e000  ! 291: STW_I	stw	%r16, [%r7 + 0x0000]
	.word 0xe82b6000  ! 292: STB_I	stb	%r20, [%r13 + 0x0000]
	.word 0xec534008  ! 293: LDSH_R	ldsh	[%r13 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 296: STD_R	std	%r16, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe843a008  ! 4: LDSW_I	ldsw	[%r14 + 0x0008], %r20
	.word 0xe071a000  ! 5: STX_I	stx	%r16, [%r6 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a010  ! 8: STW_I	stw	%r16, [%r6 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec128008  ! 10: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe8128008  ! 11: LDUH_R	lduh	[%r10 + %r8], %r20
	.word 0xa032e010  ! 12: SUBC_I	orn 	%r11, 0x0010, %r16
	.word 0xe0730008  ! 13: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe05b6018  ! 14: LDX_I	ldx	[%r13 + 0x0018], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0336018  ! 20: STH_I	sth	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a000  ! 23: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xec736028  ! 24: STX_I	stx	%r22, [%r13 + 0x0028]
	.word 0xe02b8008  ! 25: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4232000  ! 29: STW_I	stw	%r18, [%r12 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 34: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe43b8008  ! 36: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe443a028  ! 37: LDSW_I	ldsw	[%r14 + 0x0028], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 41: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe0498008  ! 42: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 47: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe841a010  ! 48: LDSW_I	ldsw	[%r6 + 0x0010], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe432e018  ! 52: STH_I	sth	%r18, [%r11 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a000  ! 55: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe0330008  ! 56: STH_R	sth	%r16, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa09a8008  ! 59: XORcc_R	xorcc 	%r10, %r8, %r16
	.word 0xe033a000  ! 60: STH_I	sth	%r16, [%r14 + 0x0000]
	.word 0xe001c008  ! 61: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe83aa018  ! 62: STD_I	std	%r20, [%r10 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851c008  ! 64: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe0398008  ! 65: STD_R	std	%r16, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe439a028  ! 67: STD_I	std	%r18, [%r6 + 0x0028]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe03ba000  ! 71: STD_I	std	%r16, [%r14 + 0x0000]
	.word 0xec22e038  ! 72: STW_I	stw	%r22, [%r11 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe032e010  ! 74: STH_I	sth	%r16, [%r11 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 79: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe05b6028  ! 80: LDX_I	ldx	[%r13 + 0x0028], %r16
	.word 0xe0734008  ! 81: STX_R	stx	%r16, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec59a018  ! 84: LDX_I	ldx	[%r6 + 0x0018], %r22
	.word 0xec22e030  ! 85: STW_I	stw	%r22, [%r11 + 0x0030]
	.word 0xe871c008  ! 86: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe02aa008  ! 87: STB_I	stb	%r16, [%r10 + 0x0008]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 95: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe03ba038  ! 96: STD_I	std	%r16, [%r14 + 0x0038]
	.word 0xec0b0008  ! 97: LDUB_R	ldub	[%r12 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec030008  ! 99: LDUW_R	lduw	[%r12 + %r8], %r22
	.word 0xec4ba018  ! 100: LDSB_I	ldsb	[%r14 + 0x0018], %r22
	.word 0xec434008  ! 101: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe4028008  ! 102: LDUW_R	lduw	[%r10 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 104: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe029a010  ! 105: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe8028008  ! 106: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xe843a038  ! 107: LDSW_I	ldsw	[%r14 + 0x0038], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0432038  ! 114: LDSW_I	ldsw	[%r12 + 0x0038], %r16
	.word 0xe872a018  ! 115: STX_I	stx	%r20, [%r10 + 0x0018]
	.word 0xe0730008  ! 116: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec0b4008  ! 119: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xec03a018  ! 120: LDUW_I	lduw	[%r14 + 0x0018], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a000  ! 122: STW_I	stw	%r22, [%r6 + 0x0000]
	.word 0xe80ac008  ! 123: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe021a008  ! 124: STW_I	stw	%r16, [%r6 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0432018  ! 126: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	.word 0xe84ac008  ! 127: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe812c008  ! 128: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852c008  ! 132: LDSH_R	ldsh	[%r11 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec19e010  ! 134: LDD_I	ldd	[%r7 + 0x0010], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a008  ! 138: STW_I	stw	%r22, [%r6 + 0x0008]
	.word 0xe82ac008  ! 139: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe02ac008  ! 140: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8132030  ! 142: LDUH_I	lduh	[%r12 + 0x0030], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05b8008  ! 145: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe8332030  ! 146: STH_I	sth	%r20, [%r12 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec03a018  ! 148: LDUW_I	lduw	[%r14 + 0x0018], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe84ac008  ! 152: LDSB_R	ldsb	[%r11 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40a8008  ! 154: LDUB_R	ldub	[%r10 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 156: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001a030  ! 159: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xec51c008  ! 160: LDSH_R	ldsh	[%r7 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4028008  ! 163: LDUW_R	lduw	[%r10 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b0008  ! 166: LDD_R	ldd	[%r12 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe82b8008  ! 175: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe059a008  ! 176: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xe80b2020  ! 177: LDUB_I	ldub	[%r12 + 0x0020], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe871a018  ! 179: STX_I	stx	%r20, [%r6 + 0x0018]
	.word 0xec41e038  ! 180: LDSW_I	ldsw	[%r7 + 0x0038], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81ae028  ! 182: LDD_I	ldd	[%r11 + 0x0028], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821a008  ! 186: STW_I	stw	%r20, [%r6 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3ac008  ! 189: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe4736018  ! 190: STX_I	stx	%r18, [%r13 + 0x0018]
	.word 0xe02ba038  ! 191: STB_I	stb	%r16, [%r14 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe442c008  ! 194: LDSW_R	ldsw	[%r11 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4598008  ! 196: LDX_R	ldx	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa020  ! 198: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xe44aa038  ! 199: LDSB_I	ldsb	[%r10 + 0x0038], %r18
	.word 0xe0732010  ! 201: STX_I	stx	%r16, [%r12 + 0x0010]
	.word 0xa0b3a018  ! 202: ORNcc_I	orncc 	%r14, 0x0018, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b6000  ! 206: STB_I	stb	%r18, [%r13 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a010  ! 215: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xe0738008  ! 216: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe8532028  ! 217: LDSH_I	ldsh	[%r12 + 0x0028], %r20
	.word 0xe85ac008  ! 218: LDX_R	ldx	[%r11 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 221: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe441a018  ! 222: LDSW_I	ldsw	[%r6 + 0x0018], %r18
	.word 0xe85b8008  ! 223: LDX_R	ldx	[%r14 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0436028  ! 225: LDSW_I	ldsw	[%r13 + 0x0028], %r16
	.word 0xec330008  ! 226: STH_R	sth	%r22, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec5b4008  ! 229: LDX_R	ldx	[%r13 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8730008  ! 232: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe813a000  ! 234: LDUH_I	lduh	[%r14 + 0x0000], %r20
	.word 0xe051a000  ! 235: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xec31a030  ! 236: STH_I	sth	%r22, [%r6 + 0x0030]
	.word 0xe4534008  ! 237: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xa419c008  ! 238: XOR_R	xor 	%r7, %r8, %r18
	.word 0xe0732008  ! 239: STX_I	stx	%r16, [%r12 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec138008  ! 241: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xe001c008  ! 242: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe82b4008  ! 243: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec532038  ! 244: LDSH_I	ldsh	[%r12 + 0x0038], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa81aa038  ! 246: XOR_I	xor 	%r10, 0x0038, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec11a008  ! 252: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xe82b2000  ! 253: STB_I	stb	%r20, [%r12 + 0x0000]
	.word 0xe05b4008  ! 254: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe0198008  ! 255: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe02b2010  ! 256: STB_I	stb	%r16, [%r12 + 0x0010]
	.word 0xec118008  ! 257: LDUH_R	lduh	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe83aa030  ! 261: STD_I	std	%r20, [%r10 + 0x0030]
	.word 0xec09a000  ! 262: LDUB_I	ldub	[%r6 + 0x0000], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe432c008  ! 264: STH_R	sth	%r18, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42ba008  ! 269: STB_I	stb	%r18, [%r14 + 0x0008]
	.word 0xe8418008  ! 270: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe0498008  ! 271: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe442a020  ! 272: LDSW_I	ldsw	[%r10 + 0x0020], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 276: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe04b2038  ! 277: LDSB_I	ldsb	[%r12 + 0x0038], %r16
	.word 0xe00b6038  ! 278: LDUB_I	ldub	[%r13 + 0x0038], %r16
	.word 0xe4118008  ! 279: LDUH_R	lduh	[%r6 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011c008  ! 281: LDUH_R	lduh	[%r7 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429c008  ! 283: STB_R	stb	%r18, [%r7 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe033a010  ! 285: STH_I	sth	%r16, [%r14 + 0x0010]
	.word 0xe409a008  ! 286: LDUB_I	ldub	[%r6 + 0x0008], %r18
	.word 0xe0530008  ! 287: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xec1b8008  ! 288: LDD_R	ldd	[%r14 + %r8], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a8008  ! 291: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe8218008  ! 292: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe442e010  ! 293: LDSW_I	ldsw	[%r11 + 0x0010], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec21c008  ! 296: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec01a028  ! 4: LDUW_I	lduw	[%r6 + 0x0028], %r22
	.word 0xec3b6010  ! 5: STD_I	std	%r22, [%r13 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe872e028  ! 8: STX_I	stx	%r20, [%r11 + 0x0028]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05aa030  ! 10: LDX_I	ldx	[%r10 + 0x0030], %r16
	.word 0xe001a020  ! 11: LDUW_I	lduw	[%r6 + 0x0020], %r16
	.word 0xa0c1a020  ! 12: ADDCcc_I	addccc 	%r6, 0x0020, %r16
	.word 0xe873a028  ! 13: STX_I	stx	%r20, [%r14 + 0x0028]
	.word 0xe8198008  ! 14: LDD_R	ldd	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae028  ! 20: STD_I	std	%r16, [%r11 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 23: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe43a8008  ! 24: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe0334008  ! 25: STH_R	sth	%r16, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 29: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe429e008  ! 34: STB_I	stb	%r18, [%r7 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8738008  ! 36: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xec01c008  ! 37: LDUW_R	lduw	[%r7 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052a008  ! 41: LDSH_I	ldsh	[%r10 + 0x0008], %r16
	.word 0xe04b2000  ! 42: LDSB_I	ldsb	[%r12 + 0x0000], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2ba008  ! 47: STB_I	stb	%r22, [%r14 + 0x0008]
	.word 0xe84b6030  ! 48: LDSB_I	ldsb	[%r13 + 0x0030], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 52: STW_R	stw	%r18, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec228008  ! 55: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe42b6008  ! 56: STB_I	stb	%r18, [%r13 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac39c008  ! 59: XNOR_R	xnor 	%r7, %r8, %r22
	.word 0xe8234008  ! 60: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe049a030  ! 61: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xec718008  ! 62: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6030  ! 64: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	.word 0xe871e028  ! 65: STX_I	stx	%r20, [%r7 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe833a018  ! 67: STH_I	sth	%r20, [%r14 + 0x0018]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031a000  ! 71: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe032e038  ! 72: STH_I	sth	%r16, [%r11 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe032a000  ! 74: STH_I	sth	%r16, [%r10 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe839a030  ! 79: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe8538008  ! 80: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe829a000  ! 81: STB_I	stb	%r20, [%r6 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec19a038  ! 84: LDD_I	ldd	[%r6 + 0x0038], %r22
	.word 0xe039c008  ! 85: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe4736010  ! 86: STX_I	stx	%r18, [%r13 + 0x0010]
	.word 0xe429a010  ! 87: STB_I	stb	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b6000  ! 95: STB_I	stb	%r18, [%r13 + 0x0000]
	.word 0xe4398008  ! 96: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe8118008  ! 97: LDUH_R	lduh	[%r6 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b4008  ! 99: LDX_R	ldx	[%r13 + %r8], %r20
	.word 0xe809a018  ! 100: LDUB_I	ldub	[%r6 + 0x0018], %r20
	.word 0xe00b0008  ! 101: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe042a018  ! 102: LDSW_I	ldsw	[%r10 + 0x0018], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec39a000  ! 104: STD_I	std	%r22, [%r6 + 0x0000]
	.word 0xec2b2008  ! 105: STB_I	stb	%r22, [%r12 + 0x0008]
	.word 0xe019e030  ! 106: LDD_I	ldd	[%r7 + 0x0030], %r16
	.word 0xec0aa000  ! 107: LDUB_I	ldub	[%r10 + 0x0000], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b2038  ! 114: LDUB_I	ldub	[%r12 + 0x0038], %r16
	.word 0xe031a008  ! 115: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe82b8008  ! 116: STB_R	stb	%r20, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8538008  ! 119: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe009a008  ! 120: LDUB_I	ldub	[%r6 + 0x0008], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b8008  ! 122: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe0138008  ! 123: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe43b0008  ! 124: STD_R	std	%r18, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049e038  ! 126: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	.word 0xec428008  ! 127: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xe0436018  ! 128: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b0008  ! 132: LDSB_R	ldsb	[%r12 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8028008  ! 134: LDUW_R	lduw	[%r10 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236018  ! 138: STW_I	stw	%r16, [%r13 + 0x0018]
	.word 0xe4298008  ! 139: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe83ae008  ! 140: STD_I	std	%r20, [%r11 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe811a030  ! 142: LDUH_I	lduh	[%r6 + 0x0030], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec11a008  ! 145: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xe4398008  ! 146: STD_R	std	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec5b2008  ! 148: LDX_I	ldx	[%r12 + 0x0008], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe452e008  ! 152: LDSH_I	ldsh	[%r11 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049c008  ! 154: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 156: STX_R	stx	%r22, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe441e020  ! 159: LDSW_I	ldsw	[%r7 + 0x0020], %r18
	.word 0xe019a030  ! 160: LDD_I	ldd	[%r6 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8518008  ! 163: LDSH_R	ldsh	[%r6 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ba000  ! 166: LDX_I	ldx	[%r14 + 0x0000], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa008  ! 175: STD_I	std	%r16, [%r10 + 0x0008]
	.word 0xec52a020  ! 176: LDSH_I	ldsh	[%r10 + 0x0020], %r22
	.word 0xe4098008  ! 177: LDUB_R	ldub	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8232000  ! 179: STW_I	stw	%r20, [%r12 + 0x0000]
	.word 0xec098008  ! 180: LDUB_R	ldub	[%r6 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 182: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec338008  ! 186: STH_R	sth	%r22, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe422a038  ! 189: STW_I	stw	%r18, [%r10 + 0x0038]
	.word 0xe0334008  ! 190: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec29a030  ! 191: STB_I	stb	%r22, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe4118008  ! 194: LDUH_R	lduh	[%r6 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec0b4008  ! 196: LDUB_R	ldub	[%r13 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 198: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe40b2008  ! 199: LDUB_I	ldub	[%r12 + 0x0008], %r18
	.word 0xe0736028  ! 201: STX_I	stx	%r16, [%r13 + 0x0028]
	.word 0xac19c008  ! 202: XOR_R	xor 	%r7, %r8, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e010  ! 206: STB_I	stb	%r16, [%r7 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a018  ! 215: STB_I	stb	%r22, [%r6 + 0x0018]
	.word 0xec3b4008  ! 216: STD_R	std	%r22, [%r13 + %r8]
	.word 0xec5ac008  ! 217: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe04a8008  ! 218: LDSB_R	ldsb	[%r10 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039e030  ! 221: STD_I	std	%r16, [%r7 + 0x0030]
	.word 0xe011a008  ! 222: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xe04ac008  ! 223: LDSB_R	ldsb	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0138008  ! 225: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe4728008  ! 226: STX_R	stx	%r18, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe049a030  ! 229: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 232: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0132030  ! 234: LDUH_I	lduh	[%r12 + 0x0030], %r16
	.word 0xe811a020  ! 235: LDUH_I	lduh	[%r6 + 0x0020], %r20
	.word 0xe421e010  ! 236: STW_I	stw	%r18, [%r7 + 0x0010]
	.word 0xe05b0008  ! 237: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xa4028008  ! 238: ADD_R	add 	%r10, %r8, %r18
	.word 0xe029a000  ! 239: STB_I	stb	%r16, [%r6 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811a028  ! 241: LDUH_I	lduh	[%r6 + 0x0028], %r20
	.word 0xe01b8008  ! 242: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe831a000  ! 243: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xe40b2018  ! 244: LDUB_I	ldub	[%r12 + 0x0018], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa0434008  ! 246: ADDC_R	addc 	%r13, %r8, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49a038  ! 252: LDSB_I	ldsb	[%r6 + 0x0038], %r22
	.word 0xe43b4008  ! 253: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe049a020  ! 254: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe059a018  ! 255: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xe022a000  ! 256: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe4098008  ! 257: LDUB_R	ldub	[%r6 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe4298008  ! 261: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe8130008  ! 262: LDUH_R	lduh	[%r12 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe432a010  ! 264: STH_I	sth	%r18, [%r10 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe471a030  ! 269: STX_I	stx	%r18, [%r6 + 0x0030]
	.word 0xe00aa028  ! 270: LDUB_I	ldub	[%r10 + 0x0028], %r16
	.word 0xe05ae028  ! 271: LDX_I	ldx	[%r11 + 0x0028], %r16
	.word 0xe0028008  ! 272: LDUW_R	lduw	[%r10 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe039a030  ! 276: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe419a038  ! 277: LDD_I	ldd	[%r6 + 0x0038], %r18
	.word 0xe04b6000  ! 278: LDSB_I	ldsb	[%r13 + 0x0000], %r16
	.word 0xe859c008  ! 279: LDX_R	ldx	[%r7 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8018008  ! 281: LDUW_R	lduw	[%r6 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4236008  ! 283: STW_I	stw	%r18, [%r13 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 285: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe0598008  ! 286: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe0438008  ! 287: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe013a018  ! 288: LDUH_I	lduh	[%r14 + 0x0018], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4318008  ! 291: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xec2ac008  ! 292: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe45b8008  ! 293: LDX_R	ldx	[%r14 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec21c008  ! 296: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe442e000  ! 4: LDSW_I	ldsw	[%r11 + 0x0000], %r18
	.word 0xe0298008  ! 5: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b6020  ! 8: STB_I	stb	%r20, [%r13 + 0x0020]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ba020  ! 10: LDUB_I	ldub	[%r14 + 0x0020], %r16
	.word 0xec11a018  ! 11: LDUH_I	lduh	[%r6 + 0x0018], %r22
	.word 0xa88b2030  ! 12: ANDcc_I	andcc 	%r12, 0x0030, %r20
	.word 0xec2b2000  ! 13: STB_I	stb	%r22, [%r12 + 0x0000]
	.word 0xe452e020  ! 14: LDSH_I	ldsh	[%r11 + 0x0020], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec728008  ! 20: STX_R	stx	%r22, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 23: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec234008  ! 24: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe03b6018  ! 25: STD_I	std	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 29: STW_R	stw	%r16, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe029e038  ! 34: STB_I	stb	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 36: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec436020  ! 37: LDSW_I	ldsw	[%r13 + 0x0020], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 41: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe4018008  ! 42: LDUW_R	lduw	[%r6 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 47: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe409c008  ! 48: LDUB_R	ldub	[%r7 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe823a018  ! 52: STW_I	stw	%r20, [%r14 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4736038  ! 55: STX_I	stx	%r18, [%r13 + 0x0038]
	.word 0xe433a000  ! 56: STH_I	sth	%r18, [%r14 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4836008  ! 59: ADDcc_I	addcc 	%r13, 0x0008, %r18
	.word 0xe431c008  ! 60: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe81a8008  ! 61: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xe4230008  ! 62: STW_R	stw	%r18, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4b8008  ! 64: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe0338008  ! 65: STH_R	sth	%r16, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0232010  ! 67: STW_I	stw	%r16, [%r12 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe83b4008  ! 71: STD_R	std	%r20, [%r13 + %r8]
	.word 0xe029c008  ! 72: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe82b0008  ! 74: STB_R	stb	%r20, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe433a030  ! 79: STH_I	sth	%r18, [%r14 + 0x0030]
	.word 0xe0528008  ! 80: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe829c008  ! 81: STB_R	stb	%r20, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec12e000  ! 84: LDUH_I	lduh	[%r11 + 0x0000], %r22
	.word 0xe0398008  ! 85: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4236030  ! 86: STW_I	stw	%r18, [%r13 + 0x0030]
	.word 0xe8228008  ! 87: STW_R	stw	%r20, [%r10 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31c008  ! 95: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe02ba038  ! 96: STB_I	stb	%r16, [%r14 + 0x0038]
	.word 0xe0038008  ! 97: LDUW_R	lduw	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09e030  ! 99: LDUB_I	ldub	[%r7 + 0x0030], %r22
	.word 0xe0030008  ! 100: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe0028008  ! 101: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe011c008  ! 102: LDUH_R	lduh	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec298008  ! 104: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe0218008  ! 105: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe401a010  ! 106: LDUW_I	lduw	[%r6 + 0x0010], %r18
	.word 0xe0498008  ! 107: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe843a030  ! 114: LDSW_I	ldsw	[%r14 + 0x0030], %r20
	.word 0xe43ba010  ! 115: STD_I	std	%r18, [%r14 + 0x0010]
	.word 0xe02a8008  ! 116: STB_R	stb	%r16, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe019a008  ! 119: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe0132010  ! 120: LDUH_I	lduh	[%r12 + 0x0010], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0738008  ! 122: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe819a010  ! 123: LDD_I	ldd	[%r6 + 0x0010], %r20
	.word 0xe0330008  ! 124: STH_R	sth	%r16, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ae028  ! 126: LDD_I	ldd	[%r11 + 0x0028], %r16
	.word 0xe8030008  ! 127: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe0198008  ! 128: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b8008  ! 132: LDX_R	ldx	[%r14 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe051a020  ! 134: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 138: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe032e018  ! 139: STH_I	sth	%r16, [%r11 + 0x0018]
	.word 0xe4298008  ! 140: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0438008  ! 142: LDSW_R	ldsw	[%r14 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe813a008  ! 145: LDUH_I	lduh	[%r14 + 0x0008], %r20
	.word 0xe4218008  ! 146: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe019e020  ! 148: LDD_I	ldd	[%r7 + 0x0020], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe04b0008  ! 152: LDSB_R	ldsb	[%r12 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85a8008  ! 154: LDX_R	ldx	[%r10 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec21e030  ! 156: STW_I	stw	%r22, [%r7 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe041a010  ! 159: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	.word 0xe809c008  ! 160: LDUB_R	ldub	[%r7 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0528008  ! 163: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 166: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec238008  ! 175: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe4528008  ! 176: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xe0036000  ! 177: LDUW_I	lduw	[%r13 + 0x0000], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe071a008  ! 179: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe453a030  ! 180: LDSH_I	ldsh	[%r14 + 0x0030], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe453a028  ! 182: LDSH_I	ldsh	[%r14 + 0x0028], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e018  ! 186: STW_I	stw	%r20, [%r7 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b0008  ! 189: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe021a000  ! 190: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xec3ae010  ! 191: STD_I	std	%r22, [%r11 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe459e018  ! 194: LDX_I	ldx	[%r7 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe819e038  ! 196: LDD_I	ldd	[%r7 + 0x0038], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe472e000  ! 198: STX_I	stx	%r18, [%r11 + 0x0000]
	.word 0xe059e008  ! 199: LDX_I	ldx	[%r7 + 0x0008], %r16
	.word 0xe8398008  ! 201: STD_R	std	%r20, [%r6 + %r8]
	.word 0xa0b18008  ! 202: SUBCcc_R	orncc 	%r6, %r8, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 206: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031e028  ! 215: STH_I	sth	%r16, [%r7 + 0x0028]
	.word 0xe02ba030  ! 216: STB_I	stb	%r16, [%r14 + 0x0030]
	.word 0xe453a008  ! 217: LDSH_I	ldsh	[%r14 + 0x0008], %r18
	.word 0xec11a028  ! 218: LDUH_I	lduh	[%r6 + 0x0028], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 221: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe8132010  ! 222: LDUH_I	lduh	[%r12 + 0x0010], %r20
	.word 0xe4430008  ! 223: LDSW_R	ldsw	[%r12 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe00b4008  ! 225: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe822e020  ! 226: STW_I	stw	%r20, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe00b6038  ! 229: LDUB_I	ldub	[%r13 + 0x0038], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a000  ! 232: STD_I	std	%r22, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe849e028  ! 234: LDSB_I	ldsb	[%r7 + 0x0028], %r20
	.word 0xe8418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe43b4008  ! 236: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe8018008  ! 237: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa8c36000  ! 238: ADDCcc_I	addccc 	%r13, 0x0000, %r20
	.word 0xe43ac008  ! 239: STD_R	std	%r18, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1ae008  ! 241: LDD_I	ldd	[%r11 + 0x0008], %r22
	.word 0xe002e000  ! 242: LDUW_I	lduw	[%r11 + 0x0000], %r16
	.word 0xe0336000  ! 243: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe049e008  ! 244: LDSB_I	ldsb	[%r7 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac41a000  ! 246: ADDC_I	addc 	%r6, 0x0000, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec128008  ! 252: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe8298008  ! 253: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe0436018  ! 254: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	.word 0xe0132020  ! 255: LDUH_I	lduh	[%r12 + 0x0020], %r16
	.word 0xe022e018  ! 256: STW_I	stw	%r16, [%r11 + 0x0018]
	.word 0xe402a010  ! 257: LDUW_I	lduw	[%r10 + 0x0010], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe03ba030  ! 261: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xec018008  ! 262: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe439c008  ! 264: STD_R	std	%r18, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071e008  ! 269: STX_I	stx	%r16, [%r7 + 0x0008]
	.word 0xec19e000  ! 270: LDD_I	ldd	[%r7 + 0x0000], %r22
	.word 0xe0436028  ! 271: LDSW_I	ldsw	[%r13 + 0x0028], %r16
	.word 0xec52e008  ! 272: LDSH_I	ldsh	[%r11 + 0x0008], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe872a020  ! 276: STX_I	stx	%r20, [%r10 + 0x0020]
	.word 0xe8498008  ! 277: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe4130008  ! 278: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xe8598008  ! 279: LDX_R	ldx	[%r6 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81b8008  ! 281: LDD_R	ldd	[%r14 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 283: STH_R	sth	%r16, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe039e020  ! 285: STD_I	std	%r16, [%r7 + 0x0020]
	.word 0xe00aa038  ! 286: LDUB_I	ldub	[%r10 + 0x0038], %r16
	.word 0xe05b4008  ! 287: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xec538008  ! 288: LDSH_R	ldsh	[%r14 + %r8], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2aa010  ! 291: STB_I	stb	%r22, [%r10 + 0x0010]
	.word 0xe0238008  ! 292: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe009a038  ! 293: LDUB_I	ldub	[%r6 + 0x0038], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 296: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41b0008  ! 4: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe8232038  ! 5: STW_I	stw	%r20, [%r12 + 0x0038]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe423a020  ! 8: STW_I	stw	%r18, [%r14 + 0x0020]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059c008  ! 10: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe8030008  ! 11: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xa0438008  ! 12: ADDC_R	addc 	%r14, %r8, %r16
	.word 0xe4318008  ! 13: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xec53a000  ! 14: LDSH_I	ldsh	[%r14 + 0x0000], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072a030  ! 20: STX_I	stx	%r16, [%r10 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a008  ! 23: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xe4718008  ! 24: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe03ae028  ! 25: STD_I	std	%r16, [%r11 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 29: STW_R	stw	%r16, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec22a020  ! 34: STW_I	stw	%r22, [%r10 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec33a030  ! 36: STH_I	sth	%r22, [%r14 + 0x0030]
	.word 0xe403a028  ! 37: LDUW_I	lduw	[%r14 + 0x0028], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459a018  ! 41: LDX_I	ldx	[%r6 + 0x0018], %r18
	.word 0xec0a8008  ! 42: LDUB_R	ldub	[%r10 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029e008  ! 47: STB_I	stb	%r16, [%r7 + 0x0008]
	.word 0xec118008  ! 48: LDUH_R	lduh	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4298008  ! 52: STB_R	stb	%r18, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 55: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe072e018  ! 56: STX_I	stx	%r16, [%r11 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0ab4008  ! 59: ANDNcc_R	andncc 	%r13, %r8, %r16
	.word 0xe422e038  ! 60: STW_I	stw	%r18, [%r11 + 0x0038]
	.word 0xe009c008  ! 61: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe43ba018  ! 62: STD_I	std	%r18, [%r14 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec528008  ! 64: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe0232028  ! 65: STW_I	stw	%r16, [%r12 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 67: STD_R	std	%r16, [%r14 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe432e000  ! 71: STH_I	sth	%r18, [%r11 + 0x0000]
	.word 0xe039c008  ! 72: STD_R	std	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe42a8008  ! 74: STB_R	stb	%r18, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe43b6000  ! 79: STD_I	std	%r18, [%r13 + 0x0000]
	.word 0xe049e038  ! 80: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	.word 0xec31c008  ! 81: STH_R	sth	%r22, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe051a000  ! 84: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xe872c008  ! 85: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xe03b6008  ! 86: STD_I	std	%r16, [%r13 + 0x0008]
	.word 0xe4718008  ! 87: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b2010  ! 95: STD_I	std	%r16, [%r12 + 0x0010]
	.word 0xe82b2030  ! 96: STB_I	stb	%r20, [%r12 + 0x0030]
	.word 0xec198008  ! 97: LDD_R	ldd	[%r6 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b0008  ! 99: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe0098008  ! 100: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec136028  ! 101: LDUH_I	lduh	[%r13 + 0x0028], %r22
	.word 0xe001e028  ! 102: LDUW_I	lduw	[%r7 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe821e020  ! 104: STW_I	stw	%r20, [%r7 + 0x0020]
	.word 0xe0318008  ! 105: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe41a8008  ! 106: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe00a8008  ! 107: LDUB_R	ldub	[%r10 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059a018  ! 114: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xec232028  ! 115: STW_I	stw	%r22, [%r12 + 0x0028]
	.word 0xec71a000  ! 116: STX_I	stx	%r22, [%r6 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe441c008  ! 119: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe019a028  ! 120: LDD_I	ldd	[%r6 + 0x0028], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba028  ! 122: STD_I	std	%r16, [%r14 + 0x0028]
	.word 0xe0118008  ! 123: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe83b6038  ! 124: STD_I	std	%r20, [%r13 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a010  ! 126: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xec41e038  ! 127: LDSW_I	ldsw	[%r7 + 0x0038], %r22
	.word 0xe012c008  ! 128: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04aa000  ! 132: LDSB_I	ldsb	[%r10 + 0x0000], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0432038  ! 134: LDSW_I	ldsw	[%r12 + 0x0038], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472e020  ! 138: STX_I	stx	%r18, [%r11 + 0x0020]
	.word 0xe0398008  ! 139: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe029c008  ! 140: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec42e000  ! 142: LDSW_I	ldsw	[%r11 + 0x0000], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe04b6018  ! 145: LDSB_I	ldsb	[%r13 + 0x0018], %r16
	.word 0xe831e018  ! 146: STH_I	sth	%r20, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe051a008  ! 148: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe842a008  ! 152: LDSW_I	ldsw	[%r10 + 0x0008], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe043a028  ! 154: LDSW_I	ldsw	[%r14 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0730008  ! 156: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0028008  ! 159: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xec5b0008  ! 160: LDX_R	ldx	[%r12 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe041e000  ! 163: LDSW_I	ldsw	[%r7 + 0x0000], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4b2010  ! 166: LDSB_I	ldsb	[%r12 + 0x0010], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 175: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0498008  ! 176: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xec09e008  ! 177: LDUB_I	ldub	[%r7 + 0x0008], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0732020  ! 179: STX_I	stx	%r16, [%r12 + 0x0020]
	.word 0xec434008  ! 180: LDSW_R	ldsw	[%r13 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec098008  ! 182: LDUB_R	ldub	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe023a010  ! 186: STW_I	stw	%r16, [%r14 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39e038  ! 189: STD_I	std	%r22, [%r7 + 0x0038]
	.word 0xec298008  ! 190: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe02aa000  ! 191: STB_I	stb	%r16, [%r10 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe401c008  ! 194: LDUW_R	lduw	[%r7 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe81a8008  ! 196: LDD_R	ldd	[%r10 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 198: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe051c008  ! 199: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe8334008  ! 201: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xac83a008  ! 202: ADDcc_I	addcc 	%r14, 0x0008, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e028  ! 206: STX_I	stx	%r16, [%r11 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 215: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe439a030  ! 216: STD_I	std	%r18, [%r6 + 0x0030]
	.word 0xe80ae018  ! 217: LDUB_I	ldub	[%r11 + 0x0018], %r20
	.word 0xe0598008  ! 218: LDX_R	ldx	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 221: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0532000  ! 222: LDSH_I	ldsh	[%r12 + 0x0000], %r16
	.word 0xe04ae020  ! 223: LDSB_I	ldsb	[%r11 + 0x0020], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec51a010  ! 225: LDSH_I	ldsh	[%r6 + 0x0010], %r22
	.word 0xe03ae038  ! 226: STD_I	std	%r16, [%r11 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe04b4008  ! 229: LDSB_R	ldsb	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0332010  ! 232: STH_I	sth	%r16, [%r12 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0036030  ! 234: LDUW_I	lduw	[%r13 + 0x0030], %r16
	.word 0xe44ba008  ! 235: LDSB_I	ldsb	[%r14 + 0x0008], %r18
	.word 0xe42a8008  ! 236: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe01a8008  ! 237: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xa0938008  ! 238: ORcc_R	orcc 	%r14, %r8, %r16
	.word 0xec736020  ! 239: STX_I	stx	%r22, [%r13 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a028  ! 241: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xe059a028  ! 242: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xe8398008  ! 243: STD_R	std	%r20, [%r6 + %r8]
	.word 0xec42c008  ! 244: LDSW_R	ldsw	[%r11 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xacbb8008  ! 246: XNORcc_R	xnorcc 	%r14, %r8, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811a008  ! 252: LDUH_I	lduh	[%r6 + 0x0008], %r20
	.word 0xe02b2030  ! 253: STB_I	stb	%r16, [%r12 + 0x0030]
	.word 0xe41aa038  ! 254: LDD_I	ldd	[%r10 + 0x0038], %r18
	.word 0xe80ba008  ! 255: LDUB_I	ldub	[%r14 + 0x0008], %r20
	.word 0xe023a038  ! 256: STW_I	stw	%r16, [%r14 + 0x0038]
	.word 0xe819c008  ! 257: LDD_R	ldd	[%r7 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe031e008  ! 261: STH_I	sth	%r16, [%r7 + 0x0008]
	.word 0xe8598008  ! 262: LDX_R	ldx	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 264: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe431a028  ! 269: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xec128008  ! 270: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xec01a030  ! 271: LDUW_I	lduw	[%r6 + 0x0030], %r22
	.word 0xe001e030  ! 272: LDUW_I	lduw	[%r7 + 0x0030], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe021e020  ! 276: STW_I	stw	%r16, [%r7 + 0x0020]
	.word 0xe04aa030  ! 277: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	.word 0xe4018008  ! 278: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe4030008  ! 279: LDUW_R	lduw	[%r12 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011e010  ! 281: LDUH_I	lduh	[%r7 + 0x0010], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b0008  ! 283: STD_R	std	%r22, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae018  ! 285: STB_I	stb	%r16, [%r11 + 0x0018]
	.word 0xec430008  ! 286: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xe049e018  ! 287: LDSB_I	ldsb	[%r7 + 0x0018], %r16
	.word 0xe401a010  ! 288: LDUW_I	lduw	[%r6 + 0x0010], %r18
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae018  ! 291: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xec398008  ! 292: STD_R	std	%r22, [%r6 + %r8]
	.word 0xec4b6030  ! 293: LDSB_I	ldsb	[%r13 + 0x0030], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec39a020  ! 296: STD_I	std	%r22, [%r6 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80b6000  ! 4: LDUB_I	ldub	[%r13 + 0x0000], %r20
	.word 0xec21a018  ! 5: STW_I	stw	%r22, [%r6 + 0x0018]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 8: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411a020  ! 10: LDUH_I	lduh	[%r6 + 0x0020], %r18
	.word 0xe019c008  ! 11: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xa49b6008  ! 12: XORcc_I	xorcc 	%r13, 0x0008, %r18
	.word 0xec71c008  ! 13: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe0498008  ! 14: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8234008  ! 20: STW_R	stw	%r20, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a038  ! 23: STX_I	stx	%r20, [%r6 + 0x0038]
	.word 0xe031a028  ! 24: STH_I	sth	%r16, [%r6 + 0x0028]
	.word 0xe821a008  ! 25: STW_I	stw	%r20, [%r6 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec736030  ! 29: STX_I	stx	%r22, [%r13 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa020  ! 34: STD_I	std	%r16, [%r10 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec22e028  ! 36: STW_I	stw	%r22, [%r11 + 0x0028]
	.word 0xe81ba038  ! 37: LDD_I	ldd	[%r14 + 0x0038], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec59e008  ! 41: LDX_I	ldx	[%r7 + 0x0008], %r22
	.word 0xe05ae030  ! 42: LDX_I	ldx	[%r11 + 0x0030], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b8008  ! 47: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe451a018  ! 48: LDSH_I	ldsh	[%r6 + 0x0018], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83ae030  ! 52: STD_I	std	%r20, [%r11 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a8008  ! 55: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe8318008  ! 56: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0098008  ! 59: AND_R	and 	%r6, %r8, %r16
	.word 0xe4718008  ! 60: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe4198008  ! 61: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe039a030  ! 62: STD_I	std	%r16, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05ac008  ! 64: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xec31c008  ! 65: STH_R	sth	%r22, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8234008  ! 67: STW_R	stw	%r20, [%r13 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe431a008  ! 71: STH_I	sth	%r18, [%r6 + 0x0008]
	.word 0xe0228008  ! 72: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 74: STD_R	std	%r22, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8728008  ! 79: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xe8198008  ! 80: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe029a000  ! 81: STB_I	stb	%r16, [%r6 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe041a010  ! 84: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	.word 0xe829a018  ! 85: STB_I	stb	%r20, [%r6 + 0x0018]
	.word 0xec31a020  ! 86: STH_I	sth	%r22, [%r6 + 0x0020]
	.word 0xe471c008  ! 87: STX_R	stx	%r18, [%r7 + %r8]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e030  ! 95: STD_I	std	%r20, [%r7 + 0x0030]
	.word 0xe02ac008  ! 96: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xec098008  ! 97: LDUB_R	ldub	[%r6 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0430008  ! 99: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe851a000  ! 100: LDSH_I	ldsh	[%r6 + 0x0000], %r20
	.word 0xe041a020  ! 101: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xe00b2038  ! 102: LDUB_I	ldub	[%r12 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe033a028  ! 104: STH_I	sth	%r16, [%r14 + 0x0028]
	.word 0xe82aa038  ! 105: STB_I	stb	%r20, [%r10 + 0x0038]
	.word 0xe011e030  ! 106: LDUH_I	lduh	[%r7 + 0x0030], %r16
	.word 0xe051a030  ! 107: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec418008  ! 114: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe0398008  ! 115: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe02ba000  ! 116: STB_I	stb	%r16, [%r14 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec0ba038  ! 119: LDUB_I	ldub	[%r14 + 0x0038], %r22
	.word 0xe043a010  ! 120: LDSW_I	ldsw	[%r14 + 0x0010], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829a000  ! 122: STB_I	stb	%r20, [%r6 + 0x0000]
	.word 0xec418008  ! 123: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xec3ae008  ! 124: STD_I	std	%r22, [%r11 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b4008  ! 126: LDUB_R	ldub	[%r13 + %r8], %r18
	.word 0xe04aa008  ! 127: LDSB_I	ldsb	[%r10 + 0x0008], %r16
	.word 0xe809a020  ! 128: LDUB_I	ldub	[%r6 + 0x0020], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8418008  ! 132: LDSW_R	ldsw	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe453a038  ! 134: LDSH_I	ldsh	[%r14 + 0x0038], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8398008  ! 138: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe43b2000  ! 139: STD_I	std	%r18, [%r12 + 0x0000]
	.word 0xe4228008  ! 140: STW_R	stw	%r18, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4038008  ! 142: LDUW_R	lduw	[%r14 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec4b6030  ! 145: LDSB_I	ldsb	[%r13 + 0x0030], %r22
	.word 0xe42b6010  ! 146: STB_I	stb	%r18, [%r13 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe859a028  ! 148: LDX_I	ldx	[%r6 + 0x0028], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 152: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe802c008  ! 154: LDUW_R	lduw	[%r11 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe83aa000  ! 156: STD_I	std	%r20, [%r10 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe052c008  ! 159: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xec4b2018  ! 160: LDSB_I	ldsb	[%r12 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec4ba038  ! 163: LDSB_I	ldsb	[%r14 + 0x0038], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4530008  ! 166: LDSH_R	ldsh	[%r12 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031a030  ! 175: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe45a8008  ! 176: LDX_R	ldx	[%r10 + %r8], %r18
	.word 0xe8418008  ! 177: LDSW_R	ldsw	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe42b6028  ! 179: STB_I	stb	%r18, [%r13 + 0x0028]
	.word 0xec1aa018  ! 180: LDD_I	ldd	[%r10 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002c008  ! 182: LDUW_R	lduw	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe023a030  ! 186: STW_I	stw	%r16, [%r14 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e008  ! 189: STW_I	stw	%r20, [%r7 + 0x0008]
	.word 0xe073a038  ! 190: STX_I	stx	%r16, [%r14 + 0x0038]
	.word 0xe0332018  ! 191: STH_I	sth	%r16, [%r12 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe00b4008  ! 194: LDUB_R	ldub	[%r13 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe81b6020  ! 196: LDD_I	ldd	[%r13 + 0x0020], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe42ba020  ! 198: STB_I	stb	%r18, [%r14 + 0x0020]
	.word 0xe00ac008  ! 199: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe43b4008  ! 201: STD_R	std	%r18, [%r13 + %r8]
	.word 0xa0b36030  ! 202: ORNcc_I	orncc 	%r13, 0x0030, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec32a010  ! 206: STH_I	sth	%r22, [%r10 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ba030  ! 215: STD_I	std	%r20, [%r14 + 0x0030]
	.word 0xe831a018  ! 216: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xec01c008  ! 217: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe8138008  ! 218: LDUH_R	lduh	[%r14 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 221: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe0532010  ! 222: LDSH_I	ldsh	[%r12 + 0x0010], %r16
	.word 0xe409a018  ! 223: LDUB_I	ldub	[%r6 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec1b4008  ! 225: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe0298008  ! 226: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0428008  ! 229: LDSW_R	ldsw	[%r10 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ba018  ! 232: STD_I	std	%r20, [%r14 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe051e018  ! 234: LDSH_I	ldsh	[%r7 + 0x0018], %r16
	.word 0xe0430008  ! 235: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe4234008  ! 236: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe443a030  ! 237: LDSW_I	ldsw	[%r14 + 0x0030], %r18
	.word 0xa841a028  ! 238: ADDC_I	addc 	%r6, 0x0028, %r20
	.word 0xe472c008  ! 239: STX_R	stx	%r18, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b8008  ! 241: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe851a038  ! 242: LDSH_I	ldsh	[%r6 + 0x0038], %r20
	.word 0xe0298008  ! 243: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe00b8008  ! 244: LDUB_R	ldub	[%r14 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa4b18008  ! 246: SUBCcc_R	orncc 	%r6, %r8, %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8538008  ! 252: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xec238008  ! 253: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xec518008  ! 254: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe0434008  ! 255: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe02ae000  ! 256: STB_I	stb	%r16, [%r11 + 0x0000]
	.word 0xe041a030  ! 257: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe031a010  ! 261: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xe812c008  ! 262: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec32a028  ! 264: STH_I	sth	%r22, [%r10 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe821c008  ! 269: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe0518008  ! 270: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe44b4008  ! 271: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe842a010  ! 272: LDSW_I	ldsw	[%r10 + 0x0010], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe43aa008  ! 276: STD_I	std	%r18, [%r10 + 0x0008]
	.word 0xe451e038  ! 277: LDSH_I	ldsh	[%r7 + 0x0038], %r18
	.word 0xe001e018  ! 278: LDUW_I	lduw	[%r7 + 0x0018], %r16
	.word 0xe00b0008  ! 279: LDUB_R	ldub	[%r12 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4418008  ! 281: LDSW_R	ldsw	[%r6 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822c008  ! 283: STW_R	stw	%r20, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec29a000  ! 285: STB_I	stb	%r22, [%r6 + 0x0000]
	.word 0xe04ac008  ! 286: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe0018008  ! 287: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe4598008  ! 288: LDX_R	ldx	[%r6 + %r8], %r18
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03aa018  ! 291: STD_I	std	%r16, [%r10 + 0x0018]
	.word 0xe471c008  ! 292: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe05b4008  ! 293: LDX_R	ldx	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe821a030  ! 296: STW_I	stw	%r20, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe419c008  ! 4: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe43b6030  ! 5: STD_I	std	%r18, [%r13 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba010  ! 8: STD_I	std	%r16, [%r14 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80ae018  ! 10: LDUB_I	ldub	[%r11 + 0x0018], %r20
	.word 0xe8030008  ! 11: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xa831a018  ! 12: ORN_I	orn 	%r6, 0x0018, %r20
	.word 0xec71a010  ! 13: STX_I	stx	%r22, [%r6 + 0x0010]
	.word 0xe852c008  ! 14: LDSH_R	ldsh	[%r11 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ba020  ! 20: STB_I	stb	%r18, [%r14 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022c008  ! 23: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe82ba030  ! 24: STB_I	stb	%r20, [%r14 + 0x0030]
	.word 0xe8398008  ! 25: STD_R	std	%r20, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 29: STD_R	std	%r16, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 34: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec31a010  ! 36: STH_I	sth	%r22, [%r6 + 0x0010]
	.word 0xe04b6030  ! 37: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8034008  ! 41: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xec098008  ! 42: LDUB_R	ldub	[%r6 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2b2018  ! 47: STB_I	stb	%r22, [%r12 + 0x0018]
	.word 0xe819e008  ! 48: LDD_I	ldd	[%r7 + 0x0008], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe432e000  ! 52: STH_I	sth	%r18, [%r11 + 0x0000]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039a008  ! 55: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xe829a038  ! 56: STB_I	stb	%r20, [%r6 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa01b4008  ! 59: XOR_R	xor 	%r13, %r8, %r16
	.word 0xe032a020  ! 60: STH_I	sth	%r16, [%r10 + 0x0020]
	.word 0xec11a008  ! 61: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xe42ac008  ! 62: STB_R	stb	%r18, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a030  ! 64: LDUH_I	lduh	[%r6 + 0x0030], %r16
	.word 0xec3aa000  ! 65: STD_I	std	%r22, [%r10 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2a8008  ! 67: STB_R	stb	%r22, [%r10 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe431e008  ! 71: STH_I	sth	%r18, [%r7 + 0x0008]
	.word 0xec2ac008  ! 72: STB_R	stb	%r22, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0736038  ! 74: STX_I	stx	%r16, [%r13 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021a028  ! 79: STW_I	stw	%r16, [%r6 + 0x0028]
	.word 0xe81ba038  ! 80: LDD_I	ldd	[%r14 + 0x0038], %r20
	.word 0xe0338008  ! 81: STH_R	sth	%r16, [%r14 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe443a038  ! 84: LDSW_I	ldsw	[%r14 + 0x0038], %r18
	.word 0xec232030  ! 85: STW_I	stw	%r22, [%r12 + 0x0030]
	.word 0xe071c008  ! 86: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe821c008  ! 87: STW_R	stw	%r20, [%r7 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 95: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe472a020  ! 96: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe8036000  ! 97: LDUW_I	lduw	[%r13 + 0x0000], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8118008  ! 99: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe0538008  ! 100: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe809e020  ! 101: LDUB_I	ldub	[%r7 + 0x0020], %r20
	.word 0xec0a8008  ! 102: LDUB_R	ldub	[%r10 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe822a010  ! 104: STW_I	stw	%r20, [%r10 + 0x0010]
	.word 0xe821e028  ! 105: STW_I	stw	%r20, [%r7 + 0x0028]
	.word 0xe449a000  ! 106: LDSB_I	ldsb	[%r6 + 0x0000], %r18
	.word 0xe0036000  ! 107: LDUW_I	lduw	[%r13 + 0x0000], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01a8008  ! 114: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe0232030  ! 115: STW_I	stw	%r16, [%r12 + 0x0030]
	.word 0xe071a018  ! 116: STX_I	stx	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe44ba008  ! 119: LDSB_I	ldsb	[%r14 + 0x0008], %r18
	.word 0xe0132020  ! 120: LDUH_I	lduh	[%r12 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 122: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe011e010  ! 123: LDUH_I	lduh	[%r7 + 0x0010], %r16
	.word 0xe8318008  ! 124: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b8008  ! 126: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe011e028  ! 127: LDUH_I	lduh	[%r7 + 0x0028], %r16
	.word 0xe052e000  ! 128: LDSH_I	ldsh	[%r11 + 0x0000], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b6008  ! 132: LDUB_I	ldub	[%r13 + 0x0008], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0198008  ! 134: LDD_R	ldd	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec73a000  ! 138: STX_I	stx	%r22, [%r14 + 0x0000]
	.word 0xe0228008  ! 139: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe0238008  ! 140: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4430008  ! 142: LDSW_R	ldsw	[%r12 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe851e038  ! 145: LDSH_I	ldsh	[%r7 + 0x0038], %r20
	.word 0xe431c008  ! 146: STH_R	sth	%r18, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec11a000  ! 148: LDUH_I	lduh	[%r6 + 0x0000], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec434008  ! 152: LDSW_R	ldsw	[%r13 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0ba038  ! 154: LDUB_I	ldub	[%r14 + 0x0038], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 156: STH_R	sth	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe05ae000  ! 159: LDX_I	ldx	[%r11 + 0x0000], %r16
	.word 0xe842e000  ! 160: LDSW_I	ldsw	[%r11 + 0x0000], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe05ac008  ! 163: LDX_R	ldx	[%r11 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8532010  ! 166: LDSH_I	ldsh	[%r12 + 0x0010], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec234008  ! 175: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xec5a8008  ! 176: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe402c008  ! 177: LDUW_R	lduw	[%r11 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec2ae000  ! 179: STB_I	stb	%r22, [%r11 + 0x0000]
	.word 0xe412a010  ! 180: LDUH_I	lduh	[%r10 + 0x0010], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b2000  ! 182: LDD_I	ldd	[%r12 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec736010  ! 186: STX_I	stx	%r22, [%r13 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736030  ! 189: STX_I	stx	%r16, [%r13 + 0x0030]
	.word 0xe03b0008  ! 190: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe8734008  ! 191: STX_R	stx	%r20, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe0430008  ! 194: LDSW_R	ldsw	[%r12 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0598008  ! 196: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe021e008  ! 198: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xe0518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe029a010  ! 201: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xa4198008  ! 202: XOR_R	xor 	%r6, %r8, %r18
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a018  ! 206: STW_I	stw	%r22, [%r6 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 215: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe021a000  ! 216: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe00b8008  ! 217: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe801e018  ! 218: LDUW_I	lduw	[%r7 + 0x0018], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec732028  ! 221: STX_I	stx	%r22, [%r12 + 0x0028]
	.word 0xe0418008  ! 222: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe002c008  ! 223: LDUW_R	lduw	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe01aa000  ! 225: LDD_I	ldd	[%r10 + 0x0000], %r16
	.word 0xe822e028  ! 226: STW_I	stw	%r20, [%r11 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe819c008  ! 229: LDD_R	ldd	[%r7 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe431c008  ! 232: STH_R	sth	%r18, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec4b2028  ! 234: LDSB_I	ldsb	[%r12 + 0x0028], %r22
	.word 0xe0438008  ! 235: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe4718008  ! 236: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe8534008  ! 237: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xac034008  ! 238: ADD_R	add 	%r13, %r8, %r22
	.word 0xe829e000  ! 239: STB_I	stb	%r20, [%r7 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ba038  ! 241: LDX_I	ldx	[%r14 + 0x0038], %r22
	.word 0xe04a8008  ! 242: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe02b0008  ! 243: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe851e000  ! 244: LDSH_I	ldsh	[%r7 + 0x0000], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa0b1a000  ! 246: ORNcc_I	orncc 	%r6, 0x0000, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b4008  ! 252: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xe03aa010  ! 253: STD_I	std	%r16, [%r10 + 0x0010]
	.word 0xe051a018  ! 254: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe4430008  ! 255: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe029a018  ! 256: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xe00ac008  ! 257: LDUB_R	ldub	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe431a010  ! 261: STH_I	sth	%r18, [%r6 + 0x0010]
	.word 0xe851a000  ! 262: LDSH_I	ldsh	[%r6 + 0x0000], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec334008  ! 264: STH_R	sth	%r22, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe831e008  ! 269: STH_I	sth	%r20, [%r7 + 0x0008]
	.word 0xe049a018  ! 270: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xe0528008  ! 271: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe04b8008  ! 272: LDSB_R	ldsb	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec330008  ! 276: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xec59c008  ! 277: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xe409a038  ! 278: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe00ba038  ! 279: LDUB_I	ldub	[%r14 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4118008  ! 281: LDUH_R	lduh	[%r6 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b2028  ! 283: STB_I	stb	%r22, [%r12 + 0x0028]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4298008  ! 285: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe0036018  ! 286: LDUW_I	lduw	[%r13 + 0x0018], %r16
	.word 0xe4138008  ! 287: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe009c008  ! 288: LDUB_R	ldub	[%r7 + %r8], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022c008  ! 291: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe031e028  ! 292: STH_I	sth	%r16, [%r7 + 0x0028]
	.word 0xe0198008  ! 293: LDD_R	ldd	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 296: STD_R	std	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe059a028  ! 4: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xe4398008  ! 5: STD_R	std	%r18, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0238008  ! 8: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0028008  ! 10: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe0528008  ! 11: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xa8228008  ! 12: SUB_R	sub 	%r10, %r8, %r20
	.word 0xec29c008  ! 13: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe051c008  ! 14: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4332020  ! 20: STH_I	sth	%r18, [%r12 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a038  ! 23: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe0398008  ! 24: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe83b8008  ! 25: STD_R	std	%r20, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4318008  ! 29: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec72a020  ! 34: STX_I	stx	%r22, [%r10 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 36: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe41b0008  ! 37: LDD_R	ldd	[%r12 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0134008  ! 41: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe4030008  ! 42: LDUW_R	lduw	[%r12 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec29a038  ! 47: STB_I	stb	%r22, [%r6 + 0x0038]
	.word 0xec5ae028  ! 48: LDX_I	ldx	[%r11 + 0x0028], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe039a030  ! 52: STD_I	std	%r16, [%r6 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 55: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec330008  ! 56: STH_R	sth	%r22, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa421a010  ! 59: SUB_I	sub 	%r6, 0x0010, %r18
	.word 0xec218008  ! 60: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe042a038  ! 61: LDSW_I	ldsw	[%r10 + 0x0038], %r16
	.word 0xe0218008  ! 62: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4098008  ! 64: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe0738008  ! 65: STX_R	stx	%r16, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 67: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec2ac008  ! 71: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe83b8008  ! 72: STD_R	std	%r20, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83b6020  ! 74: STD_I	std	%r20, [%r13 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe031e028  ! 79: STH_I	sth	%r16, [%r7 + 0x0028]
	.word 0xec19e020  ! 80: LDD_I	ldd	[%r7 + 0x0020], %r22
	.word 0xec336010  ! 81: STH_I	sth	%r22, [%r13 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0518008  ! 84: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe42b8008  ! 85: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe43ac008  ! 86: STD_R	std	%r18, [%r11 + %r8]
	.word 0xec2ac008  ! 87: STB_R	stb	%r22, [%r11 + %r8]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe431a038  ! 95: STH_I	sth	%r18, [%r6 + 0x0038]
	.word 0xe0732028  ! 96: STX_I	stx	%r16, [%r12 + 0x0028]
	.word 0xe053a030  ! 97: LDSH_I	ldsh	[%r14 + 0x0030], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec130008  ! 99: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe44ba030  ! 100: LDSB_I	ldsb	[%r14 + 0x0030], %r18
	.word 0xe0134008  ! 101: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe042a038  ! 102: LDSW_I	ldsw	[%r10 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe023a038  ! 104: STW_I	stw	%r16, [%r14 + 0x0038]
	.word 0xe4228008  ! 105: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe402a030  ! 106: LDUW_I	lduw	[%r10 + 0x0030], %r18
	.word 0xe011e010  ! 107: LDUH_I	lduh	[%r7 + 0x0010], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4498008  ! 114: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe422e030  ! 115: STW_I	stw	%r18, [%r11 + 0x0030]
	.word 0xec738008  ! 116: STX_R	stx	%r22, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41ac008  ! 119: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe002a028  ! 120: LDUW_I	lduw	[%r10 + 0x0028], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82ae038  ! 122: STB_I	stb	%r20, [%r11 + 0x0038]
	.word 0xe042c008  ! 123: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe02ae030  ! 124: STB_I	stb	%r16, [%r11 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411c008  ! 126: LDUH_R	lduh	[%r7 + %r8], %r18
	.word 0xe40b2000  ! 127: LDUB_I	ldub	[%r12 + 0x0000], %r18
	.word 0xe4130008  ! 128: LDUH_R	lduh	[%r12 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ba028  ! 132: LDSB_I	ldsb	[%r14 + 0x0028], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe041a020  ! 134: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 138: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe4298008  ! 139: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe03b6030  ! 140: STD_I	std	%r16, [%r13 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe84a8008  ! 142: LDSB_R	ldsb	[%r10 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4198008  ! 145: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe43aa008  ! 146: STD_I	std	%r18, [%r10 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec5b6008  ! 148: LDX_I	ldx	[%r13 + 0x0008], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe00b8008  ! 152: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002c008  ! 154: LDUW_R	lduw	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0336008  ! 156: STH_I	sth	%r16, [%r13 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b4008  ! 159: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xec09a018  ! 160: LDUB_I	ldub	[%r6 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4536028  ! 163: LDSH_I	ldsh	[%r13 + 0x0028], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809c008  ! 166: LDUB_R	ldub	[%r7 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe821c008  ! 175: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe04ac008  ! 176: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe411c008  ! 177: LDUH_R	lduh	[%r7 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe872e000  ! 179: STX_I	stx	%r20, [%r11 + 0x0000]
	.word 0xe451a038  ! 180: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19c008  ! 182: LDD_R	ldd	[%r7 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831a010  ! 186: STH_I	sth	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec398008  ! 189: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe0738008  ! 190: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe871a030  ! 191: STX_I	stx	%r20, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe0598008  ! 194: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe84b0008  ! 196: LDSB_R	ldsb	[%r12 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec230008  ! 198: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe842a000  ! 199: LDSW_I	ldsw	[%r10 + 0x0000], %r20
	.word 0xe872e030  ! 201: STX_I	stx	%r20, [%r11 + 0x0030]
	.word 0xa093a018  ! 202: ORcc_I	orcc 	%r14, 0x0018, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8236038  ! 206: STW_I	stw	%r20, [%r13 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 215: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe0398008  ! 216: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe45b4008  ! 217: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xe052e020  ! 218: LDSH_I	ldsh	[%r11 + 0x0020], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 221: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe4098008  ! 222: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec036010  ! 223: LDUW_I	lduw	[%r13 + 0x0010], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04b6010  ! 225: LDSB_I	ldsb	[%r13 + 0x0010], %r16
	.word 0xe02b4008  ! 226: STB_R	stb	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe442a028  ! 229: LDSW_I	ldsw	[%r10 + 0x0028], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 232: STX_R	stx	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec436000  ! 234: LDSW_I	ldsw	[%r13 + 0x0000], %r22
	.word 0xe0518008  ! 235: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8398008  ! 236: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe01a8008  ! 237: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xa8bb0008  ! 238: XNORcc_R	xnorcc 	%r12, %r8, %r20
	.word 0xe4318008  ! 239: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8018008  ! 241: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe84b4008  ! 242: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe82ae000  ! 243: STB_I	stb	%r20, [%r11 + 0x0000]
	.word 0xe0130008  ! 244: LDUH_R	lduh	[%r12 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa0428008  ! 246: ADDC_R	addc 	%r10, %r8, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b8008  ! 252: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xec3b6010  ! 253: STD_I	std	%r22, [%r13 + 0x0010]
	.word 0xe852c008  ! 254: LDSH_R	ldsh	[%r11 + %r8], %r20
	.word 0xe0436008  ! 255: LDSW_I	ldsw	[%r13 + 0x0008], %r16
	.word 0xe071e010  ! 256: STX_I	stx	%r16, [%r7 + 0x0010]
	.word 0xe81aa020  ! 257: LDD_I	ldd	[%r10 + 0x0020], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe02b0008  ! 261: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe4430008  ! 262: LDSW_R	ldsw	[%r12 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3b2030  ! 264: STD_I	std	%r22, [%r12 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b2008  ! 269: STB_I	stb	%r16, [%r12 + 0x0008]
	.word 0xe8034008  ! 270: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe00b8008  ! 271: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xec528008  ! 272: LDSH_R	ldsh	[%r10 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 276: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe0418008  ! 277: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe812e018  ! 278: LDUH_I	lduh	[%r11 + 0x0018], %r20
	.word 0xec4b0008  ! 279: LDSB_R	ldsb	[%r12 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b0008  ! 281: LDSB_R	ldsb	[%r12 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 283: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 285: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe849a010  ! 286: LDSB_I	ldsb	[%r6 + 0x0010], %r20
	.word 0xe4498008  ! 287: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe412e030  ! 288: LDUH_I	lduh	[%r11 + 0x0030], %r18
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b8008  ! 291: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe0332008  ! 292: STH_I	sth	%r16, [%r12 + 0x0008]
	.word 0xe0428008  ! 293: LDSW_R	ldsw	[%r10 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec31a008  ! 296: STH_I	sth	%r22, [%r6 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05aa010  ! 4: LDX_I	ldx	[%r10 + 0x0010], %r16
	.word 0xe429a028  ! 5: STB_I	stb	%r18, [%r6 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec738008  ! 8: STX_R	stx	%r22, [%r14 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a000  ! 10: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe412a008  ! 11: LDUH_I	lduh	[%r10 + 0x0008], %r18
	.word 0xa001e008  ! 12: ADD_I	add 	%r7, 0x0008, %r16
	.word 0xe8318008  ! 13: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe84ae010  ! 14: LDSB_I	ldsb	[%r11 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4318008  ! 20: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2aa020  ! 23: STB_I	stb	%r22, [%r10 + 0x0020]
	.word 0xe4230008  ! 24: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe831c008  ! 25: STH_R	sth	%r20, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b4008  ! 29: STD_R	std	%r20, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8730008  ! 34: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 36: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe01b4008  ! 37: LDD_R	ldd	[%r13 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a008  ! 41: LDD_I	ldd	[%r6 + 0x0008], %r20
	.word 0xe0098008  ! 42: LDUB_R	ldub	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3ba008  ! 47: STD_I	std	%r22, [%r14 + 0x0008]
	.word 0xec0a8008  ! 48: LDUB_R	ldub	[%r10 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 52: STX_R	stx	%r16, [%r14 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0232000  ! 55: STW_I	stw	%r16, [%r12 + 0x0000]
	.word 0xe82b4008  ! 56: STB_R	stb	%r20, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4b30008  ! 59: SUBCcc_R	orncc 	%r12, %r8, %r18
	.word 0xe8736038  ! 60: STX_I	stx	%r20, [%r13 + 0x0038]
	.word 0xec518008  ! 61: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe42b4008  ! 62: STB_R	stb	%r18, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec12e030  ! 64: LDUH_I	lduh	[%r11 + 0x0030], %r22
	.word 0xe03ae028  ! 65: STD_I	std	%r16, [%r11 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2b4008  ! 67: STB_R	stb	%r22, [%r13 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031e010  ! 71: STH_I	sth	%r16, [%r7 + 0x0010]
	.word 0xe4298008  ! 72: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe031e020  ! 74: STH_I	sth	%r16, [%r7 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 79: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec59a000  ! 80: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xe021c008  ! 81: STW_R	stw	%r16, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec032018  ! 84: LDUW_I	lduw	[%r12 + 0x0018], %r22
	.word 0xe071e010  ! 85: STX_I	stx	%r16, [%r7 + 0x0010]
	.word 0xe8718008  ! 86: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe8738008  ! 87: STX_R	stx	%r20, [%r14 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ba018  ! 95: STB_I	stb	%r18, [%r14 + 0x0018]
	.word 0xe822c008  ! 96: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe81ba038  ! 97: LDD_I	ldd	[%r14 + 0x0038], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b6020  ! 99: LDSB_I	ldsb	[%r13 + 0x0020], %r18
	.word 0xec018008  ! 100: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe042c008  ! 101: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe842a018  ! 102: LDSW_I	ldsw	[%r10 + 0x0018], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe022e028  ! 104: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xe429a028  ! 105: STB_I	stb	%r18, [%r6 + 0x0028]
	.word 0xe019a028  ! 106: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xe80b4008  ! 107: LDUB_R	ldub	[%r13 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41e000  ! 114: LDSW_I	ldsw	[%r7 + 0x0000], %r22
	.word 0xe0734008  ! 115: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec73a030  ! 116: STX_I	stx	%r22, [%r14 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe411e008  ! 119: LDUH_I	lduh	[%r7 + 0x0008], %r18
	.word 0xe002e028  ! 120: LDUW_I	lduw	[%r11 + 0x0028], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42aa000  ! 122: STB_I	stb	%r18, [%r10 + 0x0000]
	.word 0xe812c008  ! 123: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe4336008  ! 124: STH_I	sth	%r18, [%r13 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041a038  ! 126: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xe801a020  ! 127: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xec4b0008  ! 128: LDSB_R	ldsb	[%r12 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0018008  ! 132: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe011e000  ! 134: LDUH_I	lduh	[%r7 + 0x0000], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e028  ! 138: STD_I	std	%r20, [%r7 + 0x0028]
	.word 0xe021e028  ! 139: STW_I	stw	%r16, [%r7 + 0x0028]
	.word 0xe02b8008  ! 140: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe019a000  ! 142: LDD_I	ldd	[%r6 + 0x0000], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec5ba018  ! 145: LDX_I	ldx	[%r14 + 0x0018], %r22
	.word 0xe071a020  ! 146: STX_I	stx	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec118008  ! 148: LDUH_R	lduh	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe001e030  ! 152: LDUW_I	lduw	[%r7 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052c008  ! 154: LDSH_R	ldsh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe032a018  ! 156: STH_I	sth	%r16, [%r10 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001c008  ! 159: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe0430008  ! 160: LDSW_R	ldsw	[%r12 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0498008  ! 163: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a010  ! 166: LDUH_I	lduh	[%r6 + 0x0010], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0732020  ! 175: STX_I	stx	%r16, [%r12 + 0x0020]
	.word 0xe84b4008  ! 176: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe01ae000  ! 177: LDD_I	ldd	[%r11 + 0x0000], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe071c008  ! 179: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe40b0008  ! 180: LDUB_R	ldub	[%r12 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe842e038  ! 182: LDSW_I	ldsw	[%r11 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82ba038  ! 186: STB_I	stb	%r20, [%r14 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822a008  ! 189: STW_I	stw	%r20, [%r10 + 0x0008]
	.word 0xe423a010  ! 190: STW_I	stw	%r18, [%r14 + 0x0010]
	.word 0xe8738008  ! 191: STX_R	stx	%r20, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xec09c008  ! 194: LDUB_R	ldub	[%r7 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe01b8008  ! 196: LDD_R	ldd	[%r14 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 198: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe049c008  ! 199: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe83b0008  ! 201: STD_R	std	%r20, [%r12 + %r8]
	.word 0xa0336028  ! 202: ORN_I	orn 	%r13, 0x0028, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b8008  ! 206: STD_R	std	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6028  ! 215: STD_I	std	%r16, [%r13 + 0x0028]
	.word 0xe0218008  ! 216: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0538008  ! 217: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe45ac008  ! 218: LDX_R	ldx	[%r11 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe432a038  ! 221: STH_I	sth	%r18, [%r10 + 0x0038]
	.word 0xec4b4008  ! 222: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe8518008  ! 223: LDSH_R	ldsh	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec51c008  ! 225: LDSH_R	ldsh	[%r7 + %r8], %r22
	.word 0xe4336038  ! 226: STH_I	sth	%r18, [%r13 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe41aa008  ! 229: LDD_I	ldd	[%r10 + 0x0008], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 232: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe409e020  ! 234: LDUB_I	ldub	[%r7 + 0x0020], %r18
	.word 0xe012e038  ! 235: LDUH_I	lduh	[%r11 + 0x0038], %r16
	.word 0xe429c008  ! 236: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe81ac008  ! 237: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xac032018  ! 238: ADD_I	add 	%r12, 0x0018, %r22
	.word 0xec32e028  ! 239: STH_I	sth	%r22, [%r11 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6000  ! 241: LDSB_I	ldsb	[%r13 + 0x0000], %r16
	.word 0xe042e038  ! 242: LDSW_I	ldsw	[%r11 + 0x0038], %r16
	.word 0xe4238008  ! 243: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe0436038  ! 244: LDSW_I	ldsw	[%r13 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa01b4008  ! 246: XOR_R	xor 	%r13, %r8, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ae018  ! 252: LDSB_I	ldsb	[%r11 + 0x0018], %r22
	.word 0xe43ba000  ! 253: STD_I	std	%r18, [%r14 + 0x0000]
	.word 0xe40b2018  ! 254: LDUB_I	ldub	[%r12 + 0x0018], %r18
	.word 0xec598008  ! 255: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe0318008  ! 256: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe002e010  ! 257: LDUW_I	lduw	[%r11 + 0x0010], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe83aa010  ! 261: STD_I	std	%r20, [%r10 + 0x0010]
	.word 0xe0038008  ! 262: LDUW_R	lduw	[%r14 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae000  ! 264: STD_I	std	%r16, [%r11 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83b4008  ! 269: STD_R	std	%r20, [%r13 + %r8]
	.word 0xec198008  ! 270: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe849c008  ! 271: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec42a030  ! 272: LDSW_I	ldsw	[%r10 + 0x0030], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe429a000  ! 276: STB_I	stb	%r18, [%r6 + 0x0000]
	.word 0xec4a8008  ! 277: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xec418008  ! 278: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe85b0008  ! 279: LDX_R	ldx	[%r12 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6000  ! 281: LDX_I	ldx	[%r13 + 0x0000], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0338008  ! 283: STH_R	sth	%r16, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b6038  ! 285: STB_I	stb	%r18, [%r13 + 0x0038]
	.word 0xe0438008  ! 286: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe0438008  ! 287: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe0198008  ! 288: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42a8008  ! 291: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe839c008  ! 292: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe44b0008  ! 293: LDSB_R	ldsb	[%r12 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 296: STX_R	stx	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe81ac008  ! 4: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xe0736008  ! 5: STX_I	stx	%r16, [%r13 + 0x0008]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72c008  ! 8: STX_R	stx	%r22, [%r11 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41e010  ! 10: LDSW_I	ldsw	[%r7 + 0x0010], %r22
	.word 0xe44b0008  ! 11: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xa89b4008  ! 12: XORcc_R	xorcc 	%r13, %r8, %r20
	.word 0xe032a018  ! 13: STH_I	sth	%r16, [%r10 + 0x0018]
	.word 0xe413a020  ! 14: LDUH_I	lduh	[%r14 + 0x0020], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe432a008  ! 20: STH_I	sth	%r18, [%r10 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829a008  ! 23: STB_I	stb	%r20, [%r6 + 0x0008]
	.word 0xe021e000  ! 24: STW_I	stw	%r16, [%r7 + 0x0000]
	.word 0xe43ba018  ! 25: STD_I	std	%r18, [%r14 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4728008  ! 29: STX_R	stx	%r18, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3b4008  ! 34: STD_R	std	%r22, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe82b6020  ! 36: STB_I	stb	%r20, [%r13 + 0x0020]
	.word 0xe0032008  ! 37: LDUW_I	lduw	[%r12 + 0x0008], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4198008  ! 41: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe051a010  ! 42: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42ac008  ! 47: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe0418008  ! 48: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 52: STW_R	stw	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec718008  ! 55: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe83ba008  ! 56: STD_I	std	%r20, [%r14 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac01a000  ! 59: ADD_I	add 	%r6, 0x0000, %r22
	.word 0xe431a028  ! 60: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xec02e018  ! 61: LDUW_I	lduw	[%r11 + 0x0018], %r22
	.word 0xe033a038  ! 62: STH_I	sth	%r16, [%r14 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4198008  ! 64: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe4718008  ! 65: STX_R	stx	%r18, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2b6018  ! 67: STB_I	stb	%r22, [%r13 + 0x0018]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe071c008  ! 71: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe872a000  ! 72: STX_I	stx	%r20, [%r10 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8330008  ! 74: STH_R	sth	%r20, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec728008  ! 79: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xec4ac008  ! 80: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xec730008  ! 81: STX_R	stx	%r22, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe041e018  ! 84: LDSW_I	ldsw	[%r7 + 0x0018], %r16
	.word 0xe439a020  ! 85: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xe83a8008  ! 86: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe429c008  ! 87: STB_R	stb	%r18, [%r7 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8218008  ! 95: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec318008  ! 96: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe449a020  ! 97: LDSB_I	ldsb	[%r6 + 0x0020], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b4008  ! 99: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xe01b6000  ! 100: LDD_I	ldd	[%r13 + 0x0000], %r16
	.word 0xe0198008  ! 101: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xec198008  ! 102: LDD_R	ldd	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe471a010  ! 104: STX_I	stx	%r18, [%r6 + 0x0010]
	.word 0xe072a028  ! 105: STX_I	stx	%r16, [%r10 + 0x0028]
	.word 0xe842e038  ! 106: LDSW_I	ldsw	[%r11 + 0x0038], %r20
	.word 0xe04ae030  ! 107: LDSB_I	ldsb	[%r11 + 0x0030], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8434008  ! 114: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe4230008  ! 115: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe0218008  ! 116: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80aa008  ! 119: LDUB_I	ldub	[%r10 + 0x0008], %r20
	.word 0xe449e038  ! 120: LDSB_I	ldsb	[%r7 + 0x0038], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429e038  ! 122: STB_I	stb	%r18, [%r7 + 0x0038]
	.word 0xe01b0008  ! 123: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe4730008  ! 124: STX_R	stx	%r18, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81b8008  ! 126: LDD_R	ldd	[%r14 + %r8], %r20
	.word 0xe0528008  ! 127: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xec02e000  ! 128: LDUW_I	lduw	[%r11 + 0x0000], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 132: LDUB_R	ldub	[%r10 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec036000  ! 134: LDUW_I	lduw	[%r13 + 0x0000], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0738008  ! 138: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0730008  ! 139: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe4234008  ! 140: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe043a018  ! 142: LDSW_I	ldsw	[%r14 + 0x0018], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe802a028  ! 145: LDUW_I	lduw	[%r10 + 0x0028], %r20
	.word 0xec228008  ! 146: STW_R	stw	%r22, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0034008  ! 148: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe412a028  ! 152: LDUH_I	lduh	[%r10 + 0x0028], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44ac008  ! 154: LDSB_R	ldsb	[%r11 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe022a018  ! 156: STW_I	stw	%r16, [%r10 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8428008  ! 159: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xe40aa000  ! 160: LDUB_I	ldub	[%r10 + 0x0000], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe419c008  ! 163: LDD_R	ldd	[%r7 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec13a030  ! 166: LDUH_I	lduh	[%r14 + 0x0030], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe873a018  ! 175: STX_I	stx	%r20, [%r14 + 0x0018]
	.word 0xec598008  ! 176: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xec51c008  ! 177: LDSH_R	ldsh	[%r7 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 179: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe45ac008  ! 180: LDX_R	ldx	[%r11 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b0008  ! 182: LDUB_R	ldub	[%r12 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe473a018  ! 186: STX_I	stx	%r18, [%r14 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 189: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe03ac008  ! 190: STD_R	std	%r16, [%r11 + %r8]
	.word 0xec31a000  ! 191: STH_I	sth	%r22, [%r6 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe00ac008  ! 194: LDUB_R	ldub	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe04aa030  ! 196: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 198: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe04b4008  ! 199: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe4734008  ! 201: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xa0bae018  ! 202: XNORcc_I	xnorcc 	%r11, 0x0018, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a038  ! 206: STD_I	std	%r20, [%r6 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472e028  ! 215: STX_I	stx	%r18, [%r11 + 0x0028]
	.word 0xe032c008  ! 216: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe401a028  ! 217: LDUW_I	lduw	[%r6 + 0x0028], %r18
	.word 0xe0098008  ! 218: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a000  ! 221: STH_I	sth	%r16, [%r14 + 0x0000]
	.word 0xec52a028  ! 222: LDSH_I	ldsh	[%r10 + 0x0028], %r22
	.word 0xe0034008  ! 223: LDUW_R	lduw	[%r13 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 225: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe42b8008  ! 226: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec430008  ! 229: LDSW_R	ldsw	[%r12 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b8008  ! 232: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0134008  ! 234: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe8030008  ! 235: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe4738008  ! 236: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe00ac008  ! 237: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xacab8008  ! 238: ANDNcc_R	andncc 	%r14, %r8, %r22
	.word 0xe422a038  ! 239: STW_I	stw	%r18, [%r10 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b2010  ! 241: LDD_I	ldd	[%r12 + 0x0010], %r16
	.word 0xe0198008  ! 242: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xec23a028  ! 243: STW_I	stw	%r22, [%r14 + 0x0028]
	.word 0xe8136000  ! 244: LDUH_I	lduh	[%r13 + 0x0000], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa4438008  ! 246: ADDC_R	addc 	%r14, %r8, %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0136038  ! 252: LDUH_I	lduh	[%r13 + 0x0038], %r16
	.word 0xe02aa018  ! 253: STB_I	stb	%r16, [%r10 + 0x0018]
	.word 0xec098008  ! 254: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe403a010  ! 255: LDUW_I	lduw	[%r14 + 0x0010], %r18
	.word 0xe4332000  ! 256: STH_I	sth	%r18, [%r12 + 0x0000]
	.word 0xec0b2018  ! 257: LDUB_I	ldub	[%r12 + 0x0018], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe43b0008  ! 261: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe052e008  ! 262: LDSH_I	ldsh	[%r11 + 0x0008], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec21a008  ! 264: STW_I	stw	%r22, [%r6 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071e028  ! 269: STX_I	stx	%r16, [%r7 + 0x0028]
	.word 0xec49a020  ! 270: LDSB_I	ldsb	[%r6 + 0x0020], %r22
	.word 0xe0028008  ! 271: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe04ae000  ! 272: LDSB_I	ldsb	[%r11 + 0x0000], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe82ac008  ! 276: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xec032018  ! 277: LDUW_I	lduw	[%r12 + 0x0018], %r22
	.word 0xe059a008  ! 278: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xe812a000  ! 279: LDUH_I	lduh	[%r10 + 0x0000], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b8008  ! 281: LDX_R	ldx	[%r14 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec22c008  ! 283: STW_R	stw	%r22, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 285: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe001a008  ! 286: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xe01ac008  ! 287: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xec1b2008  ! 288: LDD_I	ldd	[%r12 + 0x0008], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022c008  ! 291: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe831a038  ! 292: STH_I	sth	%r20, [%r6 + 0x0038]
	.word 0xec128008  ! 293: LDUH_R	lduh	[%r10 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe822c008  ! 296: STW_R	stw	%r20, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8518008  ! 4: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe829a008  ! 5: STB_I	stb	%r20, [%r6 + 0x0008]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a038  ! 8: STD_I	std	%r18, [%r6 + 0x0038]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041a000  ! 10: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe401c008  ! 11: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xa0b30008  ! 12: SUBCcc_R	orncc 	%r12, %r8, %r16
	.word 0xe02b4008  ! 13: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe012e020  ! 14: LDUH_I	lduh	[%r11 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21c008  ! 20: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83a8008  ! 23: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe03b8008  ! 24: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe439a020  ! 25: STD_I	std	%r18, [%r6 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec332008  ! 29: STH_I	sth	%r22, [%r12 + 0x0008]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021a010  ! 34: STW_I	stw	%r16, [%r6 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec39c008  ! 36: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe441c008  ! 37: LDSW_R	ldsw	[%r7 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411c008  ! 41: LDUH_R	lduh	[%r7 + %r8], %r18
	.word 0xec0b6010  ! 42: LDUB_I	ldub	[%r13 + 0x0010], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec33a000  ! 47: STH_I	sth	%r22, [%r14 + 0x0000]
	.word 0xec128008  ! 48: LDUH_R	lduh	[%r10 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe871c008  ! 52: STX_R	stx	%r20, [%r7 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a8008  ! 55: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec730008  ! 56: STX_R	stx	%r22, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0018008  ! 59: ADD_R	add 	%r6, %r8, %r16
	.word 0xe0398008  ! 60: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0498008  ! 61: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe42aa018  ! 62: STB_I	stb	%r18, [%r10 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec02c008  ! 64: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe82b4008  ! 65: STB_R	stb	%r20, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0732010  ! 67: STX_I	stx	%r16, [%r12 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4218008  ! 71: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe0736038  ! 72: STX_I	stx	%r16, [%r13 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8734008  ! 74: STX_R	stx	%r20, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec232000  ! 79: STW_I	stw	%r22, [%r12 + 0x0000]
	.word 0xe41ac008  ! 80: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe02ae000  ! 81: STB_I	stb	%r16, [%r11 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe04aa018  ! 84: LDSB_I	ldsb	[%r10 + 0x0018], %r16
	.word 0xe8318008  ! 85: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe43b6010  ! 86: STD_I	std	%r18, [%r13 + 0x0010]
	.word 0xe8736030  ! 87: STX_I	stx	%r20, [%r13 + 0x0030]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ac008  ! 95: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe03b0008  ! 96: STD_R	std	%r16, [%r12 + %r8]
	.word 0xec11a008  ! 97: LDUH_I	lduh	[%r6 + 0x0008], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b8008  ! 99: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe40a8008  ! 100: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe01b2010  ! 101: LDD_I	ldd	[%r12 + 0x0010], %r16
	.word 0xe05ae028  ! 102: LDX_I	ldx	[%r11 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 104: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0332010  ! 105: STH_I	sth	%r16, [%r12 + 0x0010]
	.word 0xe852e020  ! 106: LDSH_I	ldsh	[%r11 + 0x0020], %r20
	.word 0xe05aa000  ! 107: LDX_I	ldx	[%r10 + 0x0000], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe859e000  ! 114: LDX_I	ldx	[%r7 + 0x0000], %r20
	.word 0xe4718008  ! 115: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec72e028  ! 116: STX_I	stx	%r22, [%r11 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec49c008  ! 119: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe0436018  ! 120: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe433a010  ! 122: STH_I	sth	%r18, [%r14 + 0x0010]
	.word 0xe801a020  ! 123: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xec228008  ! 124: STW_R	stw	%r22, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a008  ! 126: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe44b6000  ! 127: LDSB_I	ldsb	[%r13 + 0x0000], %r18
	.word 0xec5b0008  ! 128: LDX_R	ldx	[%r12 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 132: LDUB_R	ldub	[%r10 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe44b0008  ! 134: LDSB_R	ldsb	[%r12 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4228008  ! 138: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xec718008  ! 139: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe02b8008  ! 140: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe04b8008  ! 142: LDSB_R	ldsb	[%r14 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe809a030  ! 145: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xe83b6038  ! 146: STD_I	std	%r20, [%r13 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe85aa030  ! 148: LDX_I	ldx	[%r10 + 0x0030], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec51a028  ! 152: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4434008  ! 154: LDSW_R	ldsw	[%r13 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 156: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00ae038  ! 159: LDUB_I	ldub	[%r11 + 0x0038], %r16
	.word 0xe84b6018  ! 160: LDSB_I	ldsb	[%r13 + 0x0018], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0438008  ! 163: LDSW_R	ldsw	[%r14 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411a008  ! 166: LDUH_I	lduh	[%r6 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6020  ! 175: STD_I	std	%r22, [%r13 + 0x0020]
	.word 0xe019c008  ! 176: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe85ba010  ! 177: LDX_I	ldx	[%r14 + 0x0010], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec3ae038  ! 179: STD_I	std	%r22, [%r11 + 0x0038]
	.word 0xe053a018  ! 180: LDSH_I	ldsh	[%r14 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8538008  ! 182: LDSH_R	ldsh	[%r14 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8730008  ! 186: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ba038  ! 189: STB_I	stb	%r16, [%r14 + 0x0038]
	.word 0xe03b0008  ! 190: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe0336030  ! 191: STH_I	sth	%r16, [%r13 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe041c008  ! 194: LDSW_R	ldsw	[%r7 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe841a010  ! 196: LDSW_I	ldsw	[%r6 + 0x0010], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa000  ! 198: STD_I	std	%r16, [%r10 + 0x0000]
	.word 0xe452c008  ! 199: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xe4230008  ! 201: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xacab4008  ! 202: ANDNcc_R	andncc 	%r13, %r8, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8232010  ! 206: STW_I	stw	%r20, [%r12 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 215: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe029a010  ! 216: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe84b6028  ! 217: LDSB_I	ldsb	[%r13 + 0x0028], %r20
	.word 0xe012e008  ! 218: LDUH_I	lduh	[%r11 + 0x0008], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b2018  ! 221: STD_I	std	%r22, [%r12 + 0x0018]
	.word 0xe05b0008  ! 222: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe0198008  ! 223: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec1b8008  ! 225: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe8398008  ! 226: STD_R	std	%r20, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe05b4008  ! 229: LDX_R	ldx	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe473a008  ! 232: STX_I	stx	%r18, [%r14 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe452a030  ! 234: LDSH_I	ldsh	[%r10 + 0x0030], %r18
	.word 0xe4418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xec32c008  ! 236: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe451c008  ! 237: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xa4aaa030  ! 238: ANDNcc_I	andncc 	%r10, 0x0030, %r18
	.word 0xe839a020  ! 239: STD_I	std	%r20, [%r6 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059a000  ! 241: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe00b4008  ! 242: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe033a000  ! 243: STH_I	sth	%r16, [%r14 + 0x0000]
	.word 0xe842c008  ! 244: LDSW_R	ldsw	[%r11 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa48b8008  ! 246: ANDcc_R	andcc 	%r14, %r8, %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52c008  ! 252: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xe022c008  ! 253: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe05b4008  ! 254: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe05b8008  ! 255: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xec3ac008  ! 256: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe0432010  ! 257: LDSW_I	ldsw	[%r12 + 0x0010], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe83ae010  ! 261: STD_I	std	%r20, [%r11 + 0x0010]
	.word 0xe8018008  ! 262: LDUW_R	lduw	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4330008  ! 264: STH_R	sth	%r18, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b2010  ! 269: STD_I	std	%r16, [%r12 + 0x0010]
	.word 0xec0b0008  ! 270: LDUB_R	ldub	[%r12 + %r8], %r22
	.word 0xe812e038  ! 271: LDUH_I	lduh	[%r11 + 0x0038], %r20
	.word 0xe0018008  ! 272: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe071a020  ! 276: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe843a008  ! 277: LDSW_I	ldsw	[%r14 + 0x0008], %r20
	.word 0xe04b4008  ! 278: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe40b0008  ! 279: LDUB_R	ldub	[%r12 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b0008  ! 281: LDD_R	ldd	[%r12 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b8008  ! 283: STD_R	std	%r20, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe822c008  ! 285: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xec11a028  ! 286: LDUH_I	lduh	[%r6 + 0x0028], %r22
	.word 0xec1aa000  ! 287: LDD_I	ldd	[%r10 + 0x0000], %r22
	.word 0xe0098008  ! 288: LDUB_R	ldub	[%r6 + %r8], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b2000  ! 291: STB_I	stb	%r18, [%r12 + 0x0000]
	.word 0xe0230008  ! 292: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe4098008  ! 293: LDUB_R	ldub	[%r6 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe871e038  ! 296: STX_I	stx	%r20, [%r7 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0598008  ! 4: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe839c008  ! 5: STD_R	std	%r20, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ae030  ! 8: STB_I	stb	%r16, [%r11 + 0x0030]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4198008  ! 10: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xec09c008  ! 11: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xa0ab4008  ! 12: ANDNcc_R	andncc 	%r13, %r8, %r16
	.word 0xec2ae008  ! 13: STB_I	stb	%r22, [%r11 + 0x0008]
	.word 0xe002a030  ! 14: LDUW_I	lduw	[%r10 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b4008  ! 20: STB_R	stb	%r18, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29c008  ! 23: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xec738008  ! 24: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe8730008  ! 25: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472c008  ! 29: STX_R	stx	%r18, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe829a018  ! 34: STB_I	stb	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 36: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe04b2020  ! 37: LDSB_I	ldsb	[%r12 + 0x0020], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0136010  ! 41: LDUH_I	lduh	[%r13 + 0x0010], %r16
	.word 0xe452e018  ! 42: LDSH_I	ldsh	[%r11 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe032a020  ! 47: STH_I	sth	%r16, [%r10 + 0x0020]
	.word 0xe4098008  ! 48: LDUB_R	ldub	[%r6 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 52: STW_R	stw	%r22, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b8008  ! 55: STD_R	std	%r16, [%r14 + %r8]
	.word 0xec2b6030  ! 56: STB_I	stb	%r22, [%r13 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0c1c008  ! 59: ADDCcc_R	addccc 	%r7, %r8, %r16
	.word 0xe071a000  ! 60: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xe04b4008  ! 61: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe02a8008  ! 62: STB_R	stb	%r16, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0132000  ! 64: LDUH_I	lduh	[%r12 + 0x0000], %r16
	.word 0xe4332000  ! 65: STH_I	sth	%r18, [%r12 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe429a038  ! 67: STB_I	stb	%r18, [%r6 + 0x0038]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec21e038  ! 71: STW_I	stw	%r22, [%r7 + 0x0038]
	.word 0xe432e010  ! 72: STH_I	sth	%r18, [%r11 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe032a038  ! 74: STH_I	sth	%r16, [%r10 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe832a038  ! 79: STH_I	sth	%r20, [%r10 + 0x0038]
	.word 0xec0ba010  ! 80: LDUB_I	ldub	[%r14 + 0x0010], %r22
	.word 0xe829a038  ! 81: STB_I	stb	%r20, [%r6 + 0x0038]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe011c008  ! 84: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe829e010  ! 85: STB_I	stb	%r20, [%r7 + 0x0010]
	.word 0xe0718008  ! 86: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe832c008  ! 87: STH_R	sth	%r20, [%r11 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032c008  ! 95: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe8330008  ! 96: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe002a010  ! 97: LDUW_I	lduw	[%r10 + 0x0010], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81ac008  ! 99: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xe009c008  ! 100: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe412a018  ! 101: LDUH_I	lduh	[%r10 + 0x0018], %r18
	.word 0xe011e000  ! 102: LDUH_I	lduh	[%r7 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021a038  ! 104: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe0732028  ! 105: STX_I	stx	%r16, [%r12 + 0x0028]
	.word 0xe05b4008  ! 106: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe04ba028  ! 107: LDSB_I	ldsb	[%r14 + 0x0028], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a038  ! 114: LDD_I	ldd	[%r6 + 0x0038], %r16
	.word 0xe032a028  ! 115: STH_I	sth	%r16, [%r10 + 0x0028]
	.word 0xe03a8008  ! 116: STD_R	std	%r16, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe04ba020  ! 119: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	.word 0xe01b6010  ! 120: LDD_I	ldd	[%r13 + 0x0010], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31a030  ! 122: STH_I	sth	%r22, [%r6 + 0x0030]
	.word 0xec09a030  ! 123: LDUB_I	ldub	[%r6 + 0x0030], %r22
	.word 0xe072c008  ! 124: STX_R	stx	%r16, [%r11 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec498008  ! 126: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe4030008  ! 127: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe0030008  ! 128: LDUW_R	lduw	[%r12 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451e028  ! 132: LDSH_I	ldsh	[%r7 + 0x0028], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe852c008  ! 134: LDSH_R	ldsh	[%r11 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe431a020  ! 138: STH_I	sth	%r18, [%r6 + 0x0020]
	.word 0xe023a018  ! 139: STW_I	stw	%r16, [%r14 + 0x0018]
	.word 0xe0218008  ! 140: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe849a028  ! 142: LDSB_I	ldsb	[%r6 + 0x0028], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe44b4008  ! 145: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xec230008  ! 146: STW_R	stw	%r22, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec1b8008  ! 148: LDD_R	ldd	[%r14 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec5b0008  ! 152: LDX_R	ldx	[%r12 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8128008  ! 154: LDUH_R	lduh	[%r10 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2ba038  ! 156: STB_I	stb	%r22, [%r14 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 159: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xec4b6028  ! 160: LDSB_I	ldsb	[%r13 + 0x0028], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe842c008  ! 163: LDSW_R	ldsw	[%r11 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4030008  ! 166: LDUW_R	lduw	[%r12 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe43ae028  ! 175: STD_I	std	%r18, [%r11 + 0x0028]
	.word 0xe4198008  ! 176: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe8434008  ! 177: LDSW_R	ldsw	[%r13 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec2b8008  ! 179: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe00b8008  ! 180: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049e030  ! 182: LDSB_I	ldsb	[%r7 + 0x0030], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 186: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0232038  ! 189: STW_I	stw	%r16, [%r12 + 0x0038]
	.word 0xe0732038  ! 190: STX_I	stx	%r16, [%r12 + 0x0038]
	.word 0xec332010  ! 191: STH_I	sth	%r22, [%r12 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe009a018  ! 194: LDUB_I	ldub	[%r6 + 0x0018], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe841a000  ! 196: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe823a020  ! 198: STW_I	stw	%r20, [%r14 + 0x0020]
	.word 0xe04a8008  ! 199: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe0232010  ! 201: STW_I	stw	%r16, [%r12 + 0x0010]
	.word 0xacab2018  ! 202: ANDNcc_I	andncc 	%r12, 0x0018, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429e018  ! 206: STB_I	stb	%r18, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 215: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0234008  ! 216: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe04b2020  ! 217: LDSB_I	ldsb	[%r12 + 0x0020], %r16
	.word 0xe4518008  ! 218: LDSH_R	ldsh	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe422c008  ! 221: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe04ba020  ! 222: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	.word 0xe419a018  ! 223: LDD_I	ldd	[%r6 + 0x0018], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8018008  ! 225: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe4336000  ! 226: STH_I	sth	%r18, [%r13 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8036010  ! 229: LDUW_I	lduw	[%r13 + 0x0010], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec734008  ! 232: STX_R	stx	%r22, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0530008  ! 234: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xec5ac008  ! 235: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe821e030  ! 236: STW_I	stw	%r20, [%r7 + 0x0030]
	.word 0xe053a018  ! 237: LDSH_I	ldsh	[%r14 + 0x0018], %r16
	.word 0xa02b6000  ! 238: ANDN_I	andn 	%r13, 0x0000, %r16
	.word 0xe4330008  ! 239: STH_R	sth	%r18, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019c008  ! 241: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe442c008  ! 242: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xec39a018  ! 243: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xe8028008  ! 244: LDUW_R	lduw	[%r10 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa4928008  ! 246: ORcc_R	orcc 	%r10, %r8, %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a000  ! 252: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe4736018  ! 253: STX_I	stx	%r18, [%r13 + 0x0018]
	.word 0xe8118008  ! 254: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe4098008  ! 255: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe02b8008  ! 256: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xec0b8008  ! 257: LDUB_R	ldub	[%r14 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe422a028  ! 261: STW_I	stw	%r18, [%r10 + 0x0028]
	.word 0xe40ba000  ! 262: LDUB_I	ldub	[%r14 + 0x0000], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec318008  ! 264: STH_R	sth	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe033a020  ! 269: STH_I	sth	%r16, [%r14 + 0x0020]
	.word 0xec0ac008  ! 270: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xec41c008  ! 271: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe4418008  ! 272: LDSW_R	ldsw	[%r6 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 276: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xec430008  ! 277: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec12a020  ! 278: LDUH_I	lduh	[%r10 + 0x0020], %r22
	.word 0xe0538008  ! 279: LDSH_R	ldsh	[%r14 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41a8008  ! 281: LDD_R	ldd	[%r10 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ba030  ! 283: STD_I	std	%r20, [%r14 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba010  ! 285: STB_I	stb	%r16, [%r14 + 0x0010]
	.word 0xe8534008  ! 286: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xe84b8008  ! 287: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe04a8008  ! 288: LDSB_R	ldsb	[%r10 + %r8], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83aa008  ! 291: STD_I	std	%r20, [%r10 + 0x0008]
	.word 0xec32e018  ! 292: STH_I	sth	%r22, [%r11 + 0x0018]
	.word 0xe81ba010  ! 293: LDD_I	ldd	[%r14 + 0x0010], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 296: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe419e028  ! 4: LDD_I	ldd	[%r7 + 0x0028], %r18
	.word 0xe4234008  ! 5: STW_R	stw	%r18, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec730008  ! 8: STX_R	stx	%r22, [%r12 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 10: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe402a008  ! 11: LDUW_I	lduw	[%r10 + 0x0008], %r18
	.word 0xa029a018  ! 12: ANDN_I	andn 	%r6, 0x0018, %r16
	.word 0xe032c008  ! 13: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe012c008  ! 14: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8730008  ! 20: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e030  ! 23: STB_I	stb	%r16, [%r7 + 0x0030]
	.word 0xe4230008  ! 24: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe4228008  ! 25: STW_R	stw	%r18, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b2028  ! 29: STB_I	stb	%r22, [%r12 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 34: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa008  ! 36: STD_I	std	%r16, [%r10 + 0x0008]
	.word 0xe04ac008  ! 37: LDSB_R	ldsb	[%r11 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ba030  ! 41: LDUB_I	ldub	[%r14 + 0x0030], %r16
	.word 0xec198008  ! 42: LDD_R	ldd	[%r6 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 47: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe8418008  ! 48: LDSW_R	ldsw	[%r6 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0336028  ! 52: STH_I	sth	%r16, [%r13 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6000  ! 55: STD_I	std	%r16, [%r13 + 0x0000]
	.word 0xe0318008  ! 56: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0c1a010  ! 59: ADDCcc_I	addccc 	%r6, 0x0010, %r16
	.word 0xec228008  ! 60: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe8032018  ! 61: LDUW_I	lduw	[%r12 + 0x0018], %r20
	.word 0xe0218008  ! 62: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0136008  ! 64: LDUH_I	lduh	[%r13 + 0x0008], %r16
	.word 0xe023a038  ! 65: STW_I	stw	%r16, [%r14 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 67: STW_R	stw	%r18, [%r12 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec298008  ! 71: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe839a000  ! 72: STD_I	std	%r20, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec336010  ! 74: STH_I	sth	%r22, [%r13 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 79: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe84ba018  ! 80: LDSB_I	ldsb	[%r14 + 0x0018], %r20
	.word 0xe4738008  ! 81: STX_R	stx	%r18, [%r14 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe00a8008  ! 84: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe8336018  ! 85: STH_I	sth	%r20, [%r13 + 0x0018]
	.word 0xe029a018  ! 86: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xe039c008  ! 87: STD_R	std	%r16, [%r7 + %r8]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72e000  ! 95: STX_I	stx	%r22, [%r11 + 0x0000]
	.word 0xec31c008  ! 96: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe049a028  ! 97: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851a020  ! 99: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	.word 0xec5a8008  ! 100: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe013a028  ! 101: LDUH_I	lduh	[%r14 + 0x0028], %r16
	.word 0xe00aa030  ! 102: LDUB_I	ldub	[%r10 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03ba008  ! 104: STD_I	std	%r16, [%r14 + 0x0008]
	.word 0xe43b6018  ! 105: STD_I	std	%r18, [%r13 + 0x0018]
	.word 0xe412a008  ! 106: LDUH_I	lduh	[%r10 + 0x0008], %r18
	.word 0xe802c008  ! 107: LDUW_R	lduw	[%r11 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4130008  ! 114: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xec31a008  ! 115: STH_I	sth	%r22, [%r6 + 0x0008]
	.word 0xe821e020  ! 116: STW_I	stw	%r20, [%r7 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec1aa038  ! 119: LDD_I	ldd	[%r10 + 0x0038], %r22
	.word 0xe403a020  ! 120: LDUW_I	lduw	[%r14 + 0x0020], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471e020  ! 122: STX_I	stx	%r18, [%r7 + 0x0020]
	.word 0xe441a010  ! 123: LDSW_I	ldsw	[%r6 + 0x0010], %r18
	.word 0xe0332028  ! 124: STH_I	sth	%r16, [%r12 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 126: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe011c008  ! 127: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xec5b6038  ! 128: LDX_I	ldx	[%r13 + 0x0038], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec11a020  ! 132: LDUH_I	lduh	[%r6 + 0x0020], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8528008  ! 134: LDSH_R	ldsh	[%r10 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039e028  ! 138: STD_I	std	%r16, [%r7 + 0x0028]
	.word 0xe4232008  ! 139: STW_I	stw	%r18, [%r12 + 0x0008]
	.word 0xe021e000  ! 140: STW_I	stw	%r16, [%r7 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe44aa028  ! 142: LDSB_I	ldsb	[%r10 + 0x0028], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe01ac008  ! 145: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe833a028  ! 146: STH_I	sth	%r20, [%r14 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8428008  ! 148: LDSW_R	ldsw	[%r10 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0498008  ! 152: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ae028  ! 154: LDUB_I	ldub	[%r11 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe43b4008  ! 156: STD_R	std	%r18, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe84b8008  ! 159: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe8432008  ! 160: LDSW_I	ldsw	[%r12 + 0x0008], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe801e020  ! 163: LDUW_I	lduw	[%r7 + 0x0020], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49a020  ! 166: LDSB_I	ldsb	[%r6 + 0x0020], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 175: STD_R	std	%r16, [%r14 + %r8]
	.word 0xec0ac008  ! 176: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xe04a8008  ! 177: LDSB_R	ldsb	[%r10 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe82b8008  ! 179: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe04b4008  ! 180: LDSB_R	ldsb	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012e030  ! 182: LDUH_I	lduh	[%r11 + 0x0030], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec736008  ! 186: STX_I	stx	%r22, [%r13 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 189: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe82b6018  ! 190: STB_I	stb	%r20, [%r13 + 0x0018]
	.word 0xe02b0008  ! 191: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe809a030  ! 194: LDUB_I	ldub	[%r6 + 0x0030], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8032030  ! 196: LDUW_I	lduw	[%r12 + 0x0030], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec3b8008  ! 198: STD_R	std	%r22, [%r14 + %r8]
	.word 0xe059a030  ! 199: LDX_I	ldx	[%r6 + 0x0030], %r16
	.word 0xe82b6008  ! 201: STB_I	stb	%r20, [%r13 + 0x0008]
	.word 0xa8a3a018  ! 202: SUBcc_I	subcc 	%r14, 0x0018, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839c008  ! 206: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8732038  ! 215: STX_I	stx	%r20, [%r12 + 0x0038]
	.word 0xe02ac008  ! 216: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe4018008  ! 217: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe01ac008  ! 218: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 221: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xec53a038  ! 222: LDSH_I	ldsh	[%r14 + 0x0038], %r22
	.word 0xec0b0008  ! 223: LDUB_R	ldub	[%r12 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe041e008  ! 225: LDSW_I	ldsw	[%r7 + 0x0008], %r16
	.word 0xe071e000  ! 226: STX_I	stx	%r16, [%r7 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe019e008  ! 229: LDD_I	ldd	[%r7 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a008  ! 232: STH_I	sth	%r16, [%r14 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4598008  ! 234: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe8532008  ! 235: LDSH_I	ldsh	[%r12 + 0x0008], %r20
	.word 0xe029e008  ! 236: STB_I	stb	%r16, [%r7 + 0x0008]
	.word 0xec42a008  ! 237: LDSW_I	ldsw	[%r10 + 0x0008], %r22
	.word 0xac8b4008  ! 238: ANDcc_R	andcc 	%r13, %r8, %r22
	.word 0xe822c008  ! 239: STW_R	stw	%r20, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 241: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe041c008  ! 242: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe0230008  ! 243: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xec0b6010  ! 244: LDUB_I	ldub	[%r13 + 0x0010], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa8118008  ! 246: OR_R	or 	%r6, %r8, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19a028  ! 252: LDD_I	ldd	[%r6 + 0x0028], %r22
	.word 0xec318008  ! 253: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe0132028  ! 254: LDUH_I	lduh	[%r12 + 0x0028], %r16
	.word 0xe01ac008  ! 255: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe4234008  ! 256: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe041e028  ! 257: LDSW_I	ldsw	[%r7 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xec3b6000  ! 261: STD_I	std	%r22, [%r13 + 0x0000]
	.word 0xec1b6028  ! 262: LDD_I	ldd	[%r13 + 0x0028], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 264: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 269: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe01ac008  ! 270: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xec034008  ! 271: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe459c008  ! 272: LDX_R	ldx	[%r7 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4328008  ! 276: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe05a8008  ! 277: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe842c008  ! 278: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xe8130008  ! 279: LDUH_R	lduh	[%r12 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0528008  ! 281: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829c008  ! 283: STB_R	stb	%r20, [%r7 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8738008  ! 285: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xe41b0008  ! 286: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe0436008  ! 287: LDSW_I	ldsw	[%r13 + 0x0008], %r16
	.word 0xe81ba000  ! 288: LDD_I	ldd	[%r14 + 0x0000], %r20
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82aa000  ! 291: STB_I	stb	%r20, [%r10 + 0x0000]
	.word 0xe831c008  ! 292: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe01ac008  ! 293: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec29e008  ! 296: STB_I	stb	%r22, [%r7 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe443a020  ! 4: LDSW_I	ldsw	[%r14 + 0x0020], %r18
	.word 0xe82b0008  ! 5: STB_R	stb	%r20, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 8: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 10: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4530008  ! 11: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xa001a020  ! 12: ADD_I	add 	%r6, 0x0020, %r16
	.word 0xec236008  ! 13: STW_I	stw	%r22, [%r13 + 0x0008]
	.word 0xe809a018  ! 14: LDUB_I	ldub	[%r6 + 0x0018], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a000  ! 20: STH_I	sth	%r16, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 23: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec21a018  ! 24: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe029e010  ! 25: STB_I	stb	%r16, [%r7 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 29: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 34: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe472a020  ! 36: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe053a000  ! 37: LDSH_I	ldsh	[%r14 + 0x0000], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011e008  ! 41: LDUH_I	lduh	[%r7 + 0x0008], %r16
	.word 0xec41a020  ! 42: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe43b2010  ! 47: STD_I	std	%r18, [%r12 + 0x0010]
	.word 0xec1ae038  ! 48: LDD_I	ldd	[%r11 + 0x0038], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4338008  ! 52: STH_R	sth	%r18, [%r14 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 55: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe4734008  ! 56: STX_R	stx	%r18, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa412c008  ! 59: OR_R	or 	%r11, %r8, %r18
	.word 0xe0732018  ! 60: STX_I	stx	%r16, [%r12 + 0x0018]
	.word 0xe019a010  ! 61: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xe0238008  ! 62: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 64: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe021a018  ! 65: STW_I	stw	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe871a018  ! 67: STX_I	stx	%r20, [%r6 + 0x0018]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe071a028  ! 71: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xec238008  ! 72: STW_R	stw	%r22, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 74: STD_R	std	%r16, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0338008  ! 79: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xec51e008  ! 80: LDSH_I	ldsh	[%r7 + 0x0008], %r22
	.word 0xe0328008  ! 81: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe849e030  ! 84: LDSB_I	ldsb	[%r7 + 0x0030], %r20
	.word 0xe022e000  ! 85: STW_I	stw	%r16, [%r11 + 0x0000]
	.word 0xe0218008  ! 86: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe43b6028  ! 87: STD_I	std	%r18, [%r13 + 0x0028]
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec22c008  ! 95: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe0218008  ! 96: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe05b4008  ! 97: LDX_R	ldx	[%r13 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0036030  ! 99: LDUW_I	lduw	[%r13 + 0x0030], %r16
	.word 0xec5b4008  ! 100: LDX_R	ldx	[%r13 + %r8], %r22
	.word 0xe8030008  ! 101: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xec09a028  ! 102: LDUB_I	ldub	[%r6 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe821e000  ! 104: STW_I	stw	%r20, [%r7 + 0x0000]
	.word 0xe029a038  ! 105: STB_I	stb	%r16, [%r6 + 0x0038]
	.word 0xe019a008  ! 106: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe0132028  ! 107: LDUH_I	lduh	[%r12 + 0x0028], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059a018  ! 114: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xe429c008  ! 115: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe8318008  ! 116: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec4b0008  ! 119: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe4534008  ! 120: LDSH_R	ldsh	[%r13 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 122: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe04b4008  ! 123: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe82ba008  ! 124: STB_I	stb	%r20, [%r14 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ba030  ! 126: LDSB_I	ldsb	[%r14 + 0x0030], %r16
	.word 0xe851a000  ! 127: LDSH_I	ldsh	[%r6 + 0x0000], %r20
	.word 0xec118008  ! 128: LDUH_R	lduh	[%r6 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec438008  ! 132: LDSW_R	ldsw	[%r14 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe413a038  ! 134: LDUH_I	lduh	[%r14 + 0x0038], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe432a038  ! 138: STH_I	sth	%r18, [%r10 + 0x0038]
	.word 0xe439a028  ! 139: STD_I	std	%r18, [%r6 + 0x0028]
	.word 0xe8228008  ! 140: STW_R	stw	%r20, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe409a030  ! 142: LDUB_I	ldub	[%r6 + 0x0030], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41b4008  ! 145: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xec218008  ! 146: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4432018  ! 148: LDSW_I	ldsw	[%r12 + 0x0018], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec11e018  ! 152: LDUH_I	lduh	[%r7 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 154: LDUB_R	ldub	[%r10 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 156: STD_R	std	%r22, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe80a8008  ! 159: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xe81b4008  ! 160: LDD_R	ldd	[%r13 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe411e028  ! 163: LDUH_I	lduh	[%r7 + 0x0028], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ba018  ! 166: LDX_I	ldx	[%r14 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe83b2030  ! 175: STD_I	std	%r20, [%r12 + 0x0030]
	.word 0xec42c008  ! 176: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xe052a028  ! 177: LDSH_I	ldsh	[%r10 + 0x0028], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0330008  ! 179: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec51a008  ! 180: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec12c008  ! 182: LDUH_R	lduh	[%r11 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832a018  ! 186: STH_I	sth	%r20, [%r10 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031e000  ! 189: STH_I	sth	%r16, [%r7 + 0x0000]
	.word 0xe039a008  ! 190: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xe439a030  ! 191: STD_I	std	%r18, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe8118008  ! 194: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe81b2010  ! 196: LDD_I	ldd	[%r12 + 0x0010], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa000  ! 198: STB_I	stb	%r18, [%r10 + 0x0000]
	.word 0xe453a008  ! 199: LDSH_I	ldsh	[%r14 + 0x0008], %r18
	.word 0xe42ac008  ! 201: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xa0830008  ! 202: ADDcc_R	addcc 	%r12, %r8, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a008  ! 206: STH_I	sth	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ae008  ! 215: STB_I	stb	%r18, [%r11 + 0x0008]
	.word 0xec730008  ! 216: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe459a038  ! 217: LDX_I	ldx	[%r6 + 0x0038], %r18
	.word 0xe00aa000  ! 218: LDUB_I	ldub	[%r10 + 0x0000], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83aa008  ! 221: STD_I	std	%r20, [%r10 + 0x0008]
	.word 0xec138008  ! 222: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xe80b8008  ! 223: LDUB_R	ldub	[%r14 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe059a008  ! 225: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xe42ba018  ! 226: STB_I	stb	%r18, [%r14 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe411c008  ! 229: LDUH_R	lduh	[%r7 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e000  ! 232: STX_I	stx	%r16, [%r11 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec1ac008  ! 234: LDD_R	ldd	[%r11 + %r8], %r22
	.word 0xec4a8008  ! 235: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xec31a020  ! 236: STH_I	sth	%r22, [%r6 + 0x0020]
	.word 0xe01aa030  ! 237: LDD_I	ldd	[%r10 + 0x0030], %r16
	.word 0xac09a008  ! 238: AND_I	and 	%r6, 0x0008, %r22
	.word 0xe02ae028  ! 239: STB_I	stb	%r16, [%r11 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841e038  ! 241: LDSW_I	ldsw	[%r7 + 0x0038], %r20
	.word 0xe002e008  ! 242: LDUW_I	lduw	[%r11 + 0x0008], %r16
	.word 0xe0318008  ! 243: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe04aa018  ! 244: LDSB_I	ldsb	[%r10 + 0x0018], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa8432008  ! 246: ADDC_I	addc 	%r12, 0x0008, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ac008  ! 252: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe02a8008  ! 253: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe05ba020  ! 254: LDX_I	ldx	[%r14 + 0x0020], %r16
	.word 0xe0136010  ! 255: LDUH_I	lduh	[%r13 + 0x0010], %r16
	.word 0xe02b2000  ! 256: STB_I	stb	%r16, [%r12 + 0x0000]
	.word 0xe4018008  ! 257: LDUW_R	lduw	[%r6 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0718008  ! 261: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe40aa028  ! 262: LDUB_I	ldub	[%r10 + 0x0028], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4332010  ! 264: STH_I	sth	%r18, [%r12 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b8008  ! 269: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe452a010  ! 270: LDSH_I	ldsh	[%r10 + 0x0010], %r18
	.word 0xec42a008  ! 271: LDSW_I	ldsw	[%r10 + 0x0008], %r22
	.word 0xec4b6008  ! 272: LDSB_I	ldsb	[%r13 + 0x0008], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa028  ! 276: STB_I	stb	%r20, [%r10 + 0x0028]
	.word 0xe0132010  ! 277: LDUH_I	lduh	[%r12 + 0x0010], %r16
	.word 0xec4ba028  ! 278: LDSB_I	ldsb	[%r14 + 0x0028], %r22
	.word 0xe45b2000  ! 279: LDX_I	ldx	[%r12 + 0x0000], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8532000  ! 281: LDSH_I	ldsh	[%r12 + 0x0000], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736008  ! 283: STX_I	stx	%r16, [%r13 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 285: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe45b6028  ! 286: LDX_I	ldx	[%r13 + 0x0028], %r18
	.word 0xe0428008  ! 287: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe01b2028  ! 288: LDD_I	ldd	[%r12 + 0x0028], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 291: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe0238008  ! 292: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xec1b8008  ! 293: LDD_R	ldd	[%r14 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe421c008  ! 296: STW_R	stw	%r18, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec532028  ! 4: LDSH_I	ldsh	[%r12 + 0x0028], %r22
	.word 0xe422e028  ! 5: STW_I	stw	%r18, [%r11 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec330008  ! 8: STH_R	sth	%r22, [%r12 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b8008  ! 10: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe80b0008  ! 11: LDUB_R	ldub	[%r12 + %r8], %r20
	.word 0xa0398008  ! 12: XNOR_R	xnor 	%r6, %r8, %r16
	.word 0xec72a018  ! 13: STX_I	stx	%r22, [%r10 + 0x0018]
	.word 0xe011e028  ! 14: LDUH_I	lduh	[%r7 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e028  ! 20: STW_I	stw	%r16, [%r7 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0238008  ! 23: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe42b2018  ! 24: STB_I	stb	%r18, [%r12 + 0x0018]
	.word 0xe8218008  ! 25: STW_R	stw	%r20, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 29: STH_R	sth	%r20, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8298008  ! 34: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 36: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe852e028  ! 37: LDSH_I	ldsh	[%r11 + 0x0028], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851e018  ! 41: LDSH_I	ldsh	[%r7 + 0x0018], %r20
	.word 0xe41ac008  ! 42: LDD_R	ldd	[%r11 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe071a020  ! 47: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe45b6020  ! 48: LDX_I	ldx	[%r13 + 0x0020], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b2030  ! 52: STD_I	std	%r16, [%r12 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec238008  ! 55: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe032a028  ! 56: STH_I	sth	%r16, [%r10 + 0x0028]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xacb2e018  ! 59: SUBCcc_I	orncc 	%r11, 0x0018, %r22
	.word 0xe0330008  ! 60: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe042e020  ! 61: LDSW_I	ldsw	[%r11 + 0x0020], %r16
	.word 0xe0318008  ! 62: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4132010  ! 64: LDUH_I	lduh	[%r12 + 0x0010], %r18
	.word 0xe072c008  ! 65: STX_R	stx	%r16, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 67: STX_R	stx	%r16, [%r10 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 71: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe0334008  ! 72: STH_R	sth	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 74: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe43b4008  ! 79: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe449a028  ! 80: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xec29a030  ! 81: STB_I	stb	%r22, [%r6 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe052c008  ! 84: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe8718008  ! 85: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0338008  ! 86: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe021c008  ! 87: STW_R	stw	%r16, [%r7 + %r8]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 95: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec718008  ! 96: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe41b2020  ! 97: LDD_I	ldd	[%r12 + 0x0020], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec138008  ! 99: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xe01b6008  ! 100: LDD_I	ldd	[%r13 + 0x0008], %r16
	.word 0xe41aa030  ! 101: LDD_I	ldd	[%r10 + 0x0030], %r18
	.word 0xe04b8008  ! 102: LDSB_R	ldsb	[%r14 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4736038  ! 104: STX_I	stx	%r18, [%r13 + 0x0038]
	.word 0xe0238008  ! 105: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe0498008  ! 106: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe4018008  ! 107: LDUW_R	lduw	[%r6 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b4008  ! 114: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe0718008  ! 115: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe82ae030  ! 116: STB_I	stb	%r20, [%r11 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe051a000  ! 119: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xe0418008  ! 120: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0232000  ! 122: STW_I	stw	%r16, [%r12 + 0x0000]
	.word 0xe8538008  ! 123: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe471e010  ! 124: STX_I	stx	%r18, [%r7 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 126: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe851c008  ! 127: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe41ac008  ! 128: LDD_R	ldd	[%r11 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801a008  ! 132: LDUW_I	lduw	[%r6 + 0x0008], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe459a038  ! 134: LDX_I	ldx	[%r6 + 0x0038], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 138: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe039e010  ! 139: STD_I	std	%r16, [%r7 + 0x0010]
	.word 0xec738008  ! 140: STX_R	stx	%r22, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe802e038  ! 142: LDUW_I	lduw	[%r11 + 0x0038], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec12e030  ! 145: LDUH_I	lduh	[%r11 + 0x0030], %r22
	.word 0xe0332038  ! 146: STH_I	sth	%r16, [%r12 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe009a018  ! 148: LDUB_I	ldub	[%r6 + 0x0018], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0528008  ! 152: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411e038  ! 154: LDUH_I	lduh	[%r7 + 0x0038], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 156: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe80ac008  ! 159: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe009a020  ! 160: LDUB_I	ldub	[%r6 + 0x0020], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe013a020  ! 163: LDUH_I	lduh	[%r14 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409a008  ! 166: LDUB_I	ldub	[%r6 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe43b8008  ! 175: STD_R	std	%r18, [%r14 + %r8]
	.word 0xec4ba018  ! 176: LDSB_I	ldsb	[%r14 + 0x0018], %r22
	.word 0xe81ba038  ! 177: LDD_I	ldd	[%r14 + 0x0038], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe831a030  ! 179: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xec430008  ! 180: LDSW_R	ldsw	[%r12 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41a000  ! 182: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832a030  ! 186: STH_I	sth	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a008  ! 189: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xec718008  ! 190: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe4730008  ! 191: STX_R	stx	%r18, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe042e028  ! 194: LDSW_I	ldsw	[%r11 + 0x0028], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe412e038  ! 196: LDUH_I	lduh	[%r11 + 0x0038], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 198: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe00a8008  ! 199: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe0738008  ! 201: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xa0836020  ! 202: ADDcc_I	addcc 	%r13, 0x0020, %r16
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8232010  ! 206: STW_I	stw	%r20, [%r12 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba030  ! 215: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xec2b4008  ! 216: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe05ac008  ! 217: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xec43a010  ! 218: LDSW_I	ldsw	[%r14 + 0x0010], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42a8008  ! 221: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe401a038  ! 222: LDUW_I	lduw	[%r6 + 0x0038], %r18
	.word 0xe0532008  ! 223: LDSH_I	ldsh	[%r12 + 0x0008], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe411c008  ! 225: LDUH_R	lduh	[%r7 + %r8], %r18
	.word 0xe0234008  ! 226: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe842c008  ! 229: LDSW_R	ldsw	[%r11 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471a038  ! 232: STX_I	stx	%r18, [%r6 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4134008  ! 234: LDUH_R	lduh	[%r13 + %r8], %r18
	.word 0xe849c008  ! 235: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe02b6028  ! 236: STB_I	stb	%r16, [%r13 + 0x0028]
	.word 0xe411e010  ! 237: LDUH_I	lduh	[%r7 + 0x0010], %r18
	.word 0xa43a8008  ! 238: XNOR_R	xnor 	%r10, %r8, %r18
	.word 0xe03b8008  ! 239: STD_R	std	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec598008  ! 241: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe043a010  ! 242: LDSW_I	ldsw	[%r14 + 0x0010], %r16
	.word 0xec2b0008  ! 243: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe0038008  ! 244: LDUW_R	lduw	[%r14 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa8218008  ! 246: SUB_R	sub 	%r6, %r8, %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019c008  ! 252: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe4318008  ! 253: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xec5b4008  ! 254: LDX_R	ldx	[%r13 + %r8], %r22
	.word 0xe80ac008  ! 255: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe873a010  ! 256: STX_I	stx	%r20, [%r14 + 0x0010]
	.word 0xe041e038  ! 257: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe821a020  ! 261: STW_I	stw	%r20, [%r6 + 0x0020]
	.word 0xe001a018  ! 262: LDUW_I	lduw	[%r6 + 0x0018], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8228008  ! 264: STW_R	stw	%r20, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6008  ! 269: STB_I	stb	%r16, [%r13 + 0x0008]
	.word 0xec01e000  ! 270: LDUW_I	lduw	[%r7 + 0x0000], %r22
	.word 0xec19a010  ! 271: LDD_I	ldd	[%r6 + 0x0010], %r22
	.word 0xe4132020  ! 272: LDUH_I	lduh	[%r12 + 0x0020], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec2b2030  ! 276: STB_I	stb	%r22, [%r12 + 0x0030]
	.word 0xe8418008  ! 277: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe40b2030  ! 278: LDUB_I	ldub	[%r12 + 0x0030], %r18
	.word 0xe442a008  ! 279: LDSW_I	ldsw	[%r10 + 0x0008], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe053a030  ! 281: LDSH_I	ldsh	[%r14 + 0x0030], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec332030  ! 283: STH_I	sth	%r22, [%r12 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0338008  ! 285: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe85aa038  ! 286: LDX_I	ldx	[%r10 + 0x0038], %r20
	.word 0xe842a018  ! 287: LDSW_I	ldsw	[%r10 + 0x0018], %r20
	.word 0xec432028  ! 288: LDSW_I	ldsw	[%r12 + 0x0028], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8338008  ! 291: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe8330008  ! 292: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe812a020  ! 293: LDUH_I	lduh	[%r10 + 0x0020], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba000  ! 296: STB_I	stb	%r16, [%r14 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8018008  ! 4: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe0734008  ! 5: STX_R	stx	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b6008  ! 8: STD_I	std	%r18, [%r13 + 0x0008]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec418008  ! 10: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe8530008  ! 11: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xa002c008  ! 12: ADD_R	add 	%r11, %r8, %r16
	.word 0xe0232018  ! 13: STW_I	stw	%r16, [%r12 + 0x0018]
	.word 0xe05a8008  ! 14: LDX_R	ldx	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 20: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 23: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe832a028  ! 24: STH_I	sth	%r20, [%r10 + 0x0028]
	.word 0xec234008  ! 25: STW_R	stw	%r22, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ba000  ! 29: STD_I	std	%r20, [%r14 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0232018  ! 34: STW_I	stw	%r16, [%r12 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6000  ! 36: STB_I	stb	%r16, [%r13 + 0x0000]
	.word 0xe051c008  ! 37: LDSH_R	ldsh	[%r7 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09a028  ! 41: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xe051e028  ! 42: LDSH_I	ldsh	[%r7 + 0x0028], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe43ac008  ! 47: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe41ac008  ! 48: LDD_R	ldd	[%r11 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 52: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ac008  ! 55: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe8228008  ! 56: STW_R	stw	%r20, [%r10 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa041c008  ! 59: ADDC_R	addc 	%r7, %r8, %r16
	.word 0xec228008  ! 60: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe852e010  ! 61: LDSH_I	ldsh	[%r11 + 0x0010], %r20
	.word 0xec2a8008  ! 62: STB_R	stb	%r22, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe859c008  ! 64: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe43ae018  ! 65: STD_I	std	%r18, [%r11 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 67: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe433a028  ! 71: STH_I	sth	%r18, [%r14 + 0x0028]
	.word 0xe872c008  ! 72: STX_R	stx	%r20, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe439a018  ! 74: STD_I	std	%r18, [%r6 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec318008  ! 79: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe403a008  ! 80: LDUW_I	lduw	[%r14 + 0x0008], %r18
	.word 0xe8230008  ! 81: STW_R	stw	%r20, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8036000  ! 84: LDUW_I	lduw	[%r13 + 0x0000], %r20
	.word 0xe429e018  ! 85: STB_I	stb	%r18, [%r7 + 0x0018]
	.word 0xe82ba000  ! 86: STB_I	stb	%r20, [%r14 + 0x0000]
	.word 0xe4334008  ! 87: STH_R	sth	%r18, [%r13 + %r8]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b8008  ! 95: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe832a018  ! 96: STH_I	sth	%r20, [%r10 + 0x0018]
	.word 0xe04ac008  ! 97: LDSB_R	ldsb	[%r11 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 99: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe0136000  ! 100: LDUH_I	lduh	[%r13 + 0x0000], %r16
	.word 0xe812a030  ! 101: LDUH_I	lduh	[%r10 + 0x0030], %r20
	.word 0xe049c008  ! 102: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec328008  ! 104: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe02b0008  ! 105: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe01ae000  ! 106: LDD_I	ldd	[%r11 + 0x0000], %r16
	.word 0xec49a028  ! 107: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0128008  ! 114: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe472a020  ! 115: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe02ba010  ! 116: STB_I	stb	%r16, [%r14 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0530008  ! 119: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xec432018  ! 120: LDSW_I	ldsw	[%r12 + 0x0018], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0336000  ! 122: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe859c008  ! 123: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe03ba038  ! 124: STD_I	std	%r16, [%r14 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851c008  ! 126: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xec1aa000  ! 127: LDD_I	ldd	[%r10 + 0x0000], %r22
	.word 0xe84a8008  ! 128: LDSB_R	ldsb	[%r10 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4028008  ! 132: LDUW_R	lduw	[%r10 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe81b2018  ! 134: LDD_I	ldd	[%r12 + 0x0018], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0332008  ! 138: STH_I	sth	%r16, [%r12 + 0x0008]
	.word 0xe039a020  ! 139: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xec31a010  ! 140: STH_I	sth	%r22, [%r6 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0118008  ! 142: LDUH_R	lduh	[%r6 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4130008  ! 145: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xec3a8008  ! 146: STD_R	std	%r22, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe80b6028  ! 148: LDUB_I	ldub	[%r13 + 0x0028], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe85b4008  ! 152: LDX_R	ldx	[%r13 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851e018  ! 154: LDSH_I	ldsh	[%r7 + 0x0018], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae008  ! 156: STD_I	std	%r16, [%r11 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe40ac008  ! 159: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe0132010  ! 160: LDUH_I	lduh	[%r12 + 0x0010], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec01c008  ! 163: LDUW_R	lduw	[%r7 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52a038  ! 166: LDSH_I	ldsh	[%r10 + 0x0038], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8336008  ! 175: STH_I	sth	%r20, [%r13 + 0x0008]
	.word 0xe059e038  ! 176: LDX_I	ldx	[%r7 + 0x0038], %r16
	.word 0xe45ac008  ! 177: LDX_R	ldx	[%r11 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 179: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe859a038  ! 180: LDX_I	ldx	[%r6 + 0x0038], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe441a008  ! 182: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 186: STH_R	sth	%r16, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4398008  ! 189: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe4730008  ! 190: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe03aa030  ! 191: STD_I	std	%r16, [%r10 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe00b0008  ! 194: LDUB_R	ldub	[%r12 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4018008  ! 196: LDUW_R	lduw	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe829e020  ! 198: STB_I	stb	%r20, [%r7 + 0x0020]
	.word 0xe459e008  ! 199: LDX_I	ldx	[%r7 + 0x0008], %r18
	.word 0xec2ba010  ! 201: STB_I	stb	%r22, [%r14 + 0x0010]
	.word 0xac8ba020  ! 202: ANDcc_I	andcc 	%r14, 0x0020, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032a010  ! 206: STH_I	sth	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b4008  ! 215: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe02aa010  ! 216: STB_I	stb	%r16, [%r10 + 0x0010]
	.word 0xe852a018  ! 217: LDSH_I	ldsh	[%r10 + 0x0018], %r20
	.word 0xe4538008  ! 218: LDSH_R	ldsh	[%r14 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a020  ! 221: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xec11e020  ! 222: LDUH_I	lduh	[%r7 + 0x0020], %r22
	.word 0xe40b4008  ! 223: LDUB_R	ldub	[%r13 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe819a020  ! 225: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xec298008  ! 226: STB_R	stb	%r22, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe019c008  ! 229: LDD_R	ldd	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec330008  ! 232: STH_R	sth	%r22, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe049c008  ! 234: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe059a018  ! 235: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xe02ac008  ! 236: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe84b2010  ! 237: LDSB_I	ldsb	[%r12 + 0x0010], %r20
	.word 0xacb18008  ! 238: ORNcc_R	orncc 	%r6, %r8, %r22
	.word 0xe02a8008  ! 239: STB_R	stb	%r16, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4598008  ! 241: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe0430008  ! 242: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe039c008  ! 243: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe40b6018  ! 244: LDUB_I	ldub	[%r13 + 0x0018], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac0b8008  ! 246: AND_R	and 	%r14, %r8, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851c008  ! 252: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe4238008  ! 253: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe44a8008  ! 254: LDSB_R	ldsb	[%r10 + %r8], %r18
	.word 0xe001e020  ! 255: LDUW_I	lduw	[%r7 + 0x0020], %r16
	.word 0xe431e038  ! 256: STH_I	sth	%r18, [%r7 + 0x0038]
	.word 0xe041e018  ! 257: LDSW_I	ldsw	[%r7 + 0x0018], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe432e028  ! 261: STH_I	sth	%r18, [%r11 + 0x0028]
	.word 0xec030008  ! 262: LDUW_R	lduw	[%r12 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec32e000  ! 264: STH_I	sth	%r22, [%r11 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe032a008  ! 269: STH_I	sth	%r16, [%r10 + 0x0008]
	.word 0xe8434008  ! 270: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe001a020  ! 271: LDUW_I	lduw	[%r6 + 0x0020], %r16
	.word 0xe049a028  ! 272: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe871e028  ! 276: STX_I	stx	%r20, [%r7 + 0x0028]
	.word 0xe0036030  ! 277: LDUW_I	lduw	[%r13 + 0x0030], %r16
	.word 0xec5ae010  ! 278: LDX_I	ldx	[%r11 + 0x0010], %r22
	.word 0xe0036020  ! 279: LDUW_I	lduw	[%r13 + 0x0020], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401c008  ! 281: LDUW_R	lduw	[%r7 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0338008  ! 283: STH_R	sth	%r16, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0236018  ! 285: STW_I	stw	%r16, [%r13 + 0x0018]
	.word 0xe40aa000  ! 286: LDUB_I	ldub	[%r10 + 0x0000], %r18
	.word 0xec1a8008  ! 287: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe441e030  ! 288: LDSW_I	ldsw	[%r7 + 0x0030], %r18
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ae038  ! 291: STB_I	stb	%r16, [%r11 + 0x0038]
	.word 0xe029c008  ! 292: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec09c008  ! 293: LDUB_R	ldub	[%r7 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8328008  ! 296: STH_R	sth	%r20, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe809a020  ! 4: LDUB_I	ldub	[%r6 + 0x0020], %r20
	.word 0xec71a020  ! 5: STX_I	stx	%r22, [%r6 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 8: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4518008  ! 10: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe84b4008  ! 11: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xa0a1a020  ! 12: SUBcc_I	subcc 	%r6, 0x0020, %r16
	.word 0xe472a030  ! 13: STX_I	stx	%r18, [%r10 + 0x0030]
	.word 0xe012a038  ! 14: LDUH_I	lduh	[%r10 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4228008  ! 20: STW_R	stw	%r18, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4330008  ! 23: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe42ac008  ! 24: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xec734008  ! 25: STX_R	stx	%r22, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 29: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0332020  ! 34: STH_I	sth	%r16, [%r12 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0338008  ! 36: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe0438008  ! 37: LDSW_R	ldsw	[%r14 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b8008  ! 41: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe45ac008  ! 42: LDX_R	ldx	[%r11 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0332000  ! 47: STH_I	sth	%r16, [%r12 + 0x0000]
	.word 0xe453a000  ! 48: LDSH_I	ldsh	[%r14 + 0x0000], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec736020  ! 52: STX_I	stx	%r22, [%r13 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02aa008  ! 55: STB_I	stb	%r16, [%r10 + 0x0008]
	.word 0xe871c008  ! 56: STX_R	stx	%r20, [%r7 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8aac008  ! 59: ANDNcc_R	andncc 	%r11, %r8, %r20
	.word 0xe0298008  ! 60: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe84ac008  ! 61: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe0238008  ! 62: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0430008  ! 64: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xec2b2028  ! 65: STB_I	stb	%r22, [%r12 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec332010  ! 67: STH_I	sth	%r22, [%r12 + 0x0010]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec236000  ! 71: STW_I	stw	%r22, [%r13 + 0x0000]
	.word 0xe839a000  ! 72: STD_I	std	%r20, [%r6 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe871a018  ! 74: STX_I	stx	%r20, [%r6 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82ae030  ! 79: STB_I	stb	%r20, [%r11 + 0x0030]
	.word 0xe009c008  ! 80: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe022a018  ! 81: STW_I	stw	%r16, [%r10 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec134008  ! 84: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xe0218008  ! 85: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec298008  ! 86: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe421a038  ! 87: STW_I	stw	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4398008  ! 95: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe432a018  ! 96: STH_I	sth	%r18, [%r10 + 0x0018]
	.word 0xe0534008  ! 97: LDSH_R	ldsh	[%r13 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b6030  ! 99: LDUB_I	ldub	[%r13 + 0x0030], %r16
	.word 0xe00b2000  ! 100: LDUB_I	ldub	[%r12 + 0x0000], %r16
	.word 0xe81ac008  ! 101: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xec432000  ! 102: LDSW_I	ldsw	[%r12 + 0x0000], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 104: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe8228008  ! 105: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xec13a018  ! 106: LDUH_I	lduh	[%r14 + 0x0018], %r22
	.word 0xe811a018  ! 107: LDUH_I	lduh	[%r6 + 0x0018], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002c008  ! 114: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe02ac008  ! 115: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xec330008  ! 116: STH_R	sth	%r22, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec53a000  ! 119: LDSH_I	ldsh	[%r14 + 0x0000], %r22
	.word 0xec0b8008  ! 120: LDUB_R	ldub	[%r14 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b0008  ! 122: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe019e008  ! 123: LDD_I	ldd	[%r7 + 0x0008], %r16
	.word 0xe0318008  ! 124: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059e020  ! 126: LDX_I	ldx	[%r7 + 0x0020], %r16
	.word 0xe8130008  ! 127: LDUH_R	lduh	[%r12 + %r8], %r20
	.word 0xe40aa038  ! 128: LDUB_I	ldub	[%r10 + 0x0038], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0428008  ! 132: LDSW_R	ldsw	[%r10 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4434008  ! 134: LDSW_R	ldsw	[%r13 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae018  ! 138: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xec32c008  ! 139: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xec29c008  ! 140: STB_R	stb	%r22, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe449a038  ! 142: LDSB_I	ldsb	[%r6 + 0x0038], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec034008  ! 145: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe4738008  ! 146: STX_R	stx	%r18, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe809e000  ! 148: LDUB_I	ldub	[%r7 + 0x0000], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe001c008  ! 152: LDUW_R	lduw	[%r7 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0098008  ! 154: LDUB_R	ldub	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 156: STB_R	stb	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe45b6010  ! 159: LDX_I	ldx	[%r13 + 0x0010], %r18
	.word 0xe841e030  ! 160: LDSW_I	ldsw	[%r7 + 0x0030], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0530008  ! 163: LDSH_R	ldsh	[%r12 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8518008  ! 166: LDSH_R	ldsh	[%r6 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe433a010  ! 175: STH_I	sth	%r18, [%r14 + 0x0010]
	.word 0xec128008  ! 176: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe0430008  ! 177: LDSW_R	ldsw	[%r12 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 179: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec1b0008  ! 180: LDD_R	ldd	[%r12 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0038008  ! 182: LDUW_R	lduw	[%r14 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82ac008  ! 186: STB_R	stb	%r20, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6018  ! 189: STD_I	std	%r16, [%r13 + 0x0018]
	.word 0xe0318008  ! 190: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe832a030  ! 191: STH_I	sth	%r20, [%r10 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe449a020  ! 194: LDSB_I	ldsb	[%r6 + 0x0020], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe40ba018  ! 196: LDUB_I	ldub	[%r14 + 0x0018], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 198: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe81ae038  ! 199: LDD_I	ldd	[%r11 + 0x0038], %r20
	.word 0xe82b2038  ! 201: STB_I	stb	%r20, [%r12 + 0x0038]
	.word 0xa4128008  ! 202: OR_R	or 	%r10, %r8, %r18
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72a000  ! 206: STX_I	stx	%r22, [%r10 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032a000  ! 215: STH_I	sth	%r16, [%r10 + 0x0000]
	.word 0xe03b0008  ! 216: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe0418008  ! 217: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe04b4008  ! 218: LDSB_R	ldsb	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a020  ! 221: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe441c008  ! 222: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe011a038  ! 223: LDUH_I	lduh	[%r6 + 0x0038], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe01b4008  ! 225: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe831a030  ! 226: STH_I	sth	%r20, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0436010  ! 229: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec398008  ! 232: STD_R	std	%r22, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe44b2038  ! 234: LDSB_I	ldsb	[%r12 + 0x0038], %r18
	.word 0xe4032028  ! 235: LDUW_I	lduw	[%r12 + 0x0028], %r18
	.word 0xe42b2010  ! 236: STB_I	stb	%r18, [%r12 + 0x0010]
	.word 0xe019e018  ! 237: LDD_I	ldd	[%r7 + 0x0018], %r16
	.word 0xa0b98008  ! 238: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xec2a8008  ! 239: STB_R	stb	%r22, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b8008  ! 241: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe4598008  ! 242: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe0398008  ! 243: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe051c008  ! 244: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa0128008  ! 246: OR_R	or 	%r10, %r8, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0528008  ! 252: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xec73a008  ! 253: STX_I	stx	%r22, [%r14 + 0x0008]
	.word 0xe44b6038  ! 254: LDSB_I	ldsb	[%r13 + 0x0038], %r18
	.word 0xe8438008  ! 255: LDSW_R	ldsw	[%r14 + %r8], %r20
	.word 0xec3ba010  ! 256: STD_I	std	%r22, [%r14 + 0x0010]
	.word 0xe0518008  ! 257: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec718008  ! 261: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe449c008  ! 262: LDSB_R	ldsb	[%r7 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe839a018  ! 264: STD_I	std	%r20, [%r6 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8228008  ! 269: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe0532000  ! 270: LDSH_I	ldsh	[%r12 + 0x0000], %r16
	.word 0xec136030  ! 271: LDUH_I	lduh	[%r13 + 0x0030], %r22
	.word 0xe0098008  ! 272: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4228008  ! 276: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xec518008  ! 277: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe009a038  ! 278: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xe45ae018  ! 279: LDX_I	ldx	[%r11 + 0x0018], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec59a028  ! 281: LDX_I	ldx	[%r6 + 0x0028], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236018  ! 283: STW_I	stw	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec32e008  ! 285: STH_I	sth	%r22, [%r11 + 0x0008]
	.word 0xe8030008  ! 286: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe05b2038  ! 287: LDX_I	ldx	[%r12 + 0x0038], %r16
	.word 0xe003a030  ! 288: LDUW_I	lduw	[%r14 + 0x0030], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 291: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe871e028  ! 292: STX_I	stx	%r20, [%r7 + 0x0028]
	.word 0xe8118008  ! 293: LDUH_R	lduh	[%r6 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 296: STX_R	stx	%r16, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0598008  ! 4: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xec32e028  ! 5: STH_I	sth	%r22, [%r11 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 8: STB_R	stb	%r18, [%r6 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec11c008  ! 10: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xec0a8008  ! 11: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xac22c008  ! 12: SUB_R	sub 	%r11, %r8, %r22
	.word 0xec318008  ! 13: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe412e028  ! 14: LDUH_I	lduh	[%r11 + 0x0028], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032a010  ! 20: STH_I	sth	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429e010  ! 23: STB_I	stb	%r18, [%r7 + 0x0010]
	.word 0xe0336008  ! 24: STH_I	sth	%r16, [%r13 + 0x0008]
	.word 0xe02aa010  ! 25: STB_I	stb	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 29: STB_R	stb	%r20, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe823a000  ! 34: STW_I	stw	%r20, [%r14 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4338008  ! 36: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xec518008  ! 37: LDSH_R	ldsh	[%r6 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4430008  ! 41: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe45b8008  ! 42: LDX_R	ldx	[%r14 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 47: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec41a020  ! 48: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe831a018  ! 52: STH_I	sth	%r20, [%r6 + 0x0018]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0738008  ! 55: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe83aa038  ! 56: STD_I	std	%r20, [%r10 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b28008  ! 59: SUBCcc_R	orncc 	%r10, %r8, %r16
	.word 0xe0236030  ! 60: STW_I	stw	%r16, [%r13 + 0x0030]
	.word 0xe05a8008  ! 61: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe821c008  ! 62: STW_R	stw	%r20, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a038  ! 64: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xe02ac008  ! 65: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8334008  ! 67: STH_R	sth	%r20, [%r13 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe039a020  ! 71: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe8236020  ! 72: STW_I	stw	%r20, [%r13 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec39e030  ! 74: STD_I	std	%r22, [%r7 + 0x0030]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec298008  ! 79: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe01b8008  ! 80: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe02aa030  ! 81: STB_I	stb	%r16, [%r10 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe409a030  ! 84: LDUB_I	ldub	[%r6 + 0x0030], %r18
	.word 0xe0238008  ! 85: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xec336010  ! 86: STH_I	sth	%r22, [%r13 + 0x0010]
	.word 0xe031a030  ! 87: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 95: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xe8298008  ! 96: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe44b8008  ! 97: LDSB_R	ldsb	[%r14 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 99: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec59c008  ! 100: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xe0498008  ! 101: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe4430008  ! 102: LDSW_R	ldsw	[%r12 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42ac008  ! 104: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe8230008  ! 105: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe401a028  ! 106: LDUW_I	lduw	[%r6 + 0x0028], %r18
	.word 0xe00ae000  ! 107: LDUB_I	ldub	[%r11 + 0x0000], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4034008  ! 114: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe8328008  ! 115: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe822a000  ! 116: STW_I	stw	%r20, [%r10 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe811c008  ! 119: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xe0018008  ! 120: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 122: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe0018008  ! 123: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xec718008  ! 124: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec436010  ! 126: LDSW_I	ldsw	[%r13 + 0x0010], %r22
	.word 0xe013a000  ! 127: LDUH_I	lduh	[%r14 + 0x0000], %r16
	.word 0xe8034008  ! 128: LDUW_R	lduw	[%r13 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012a010  ! 132: LDUH_I	lduh	[%r10 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4130008  ! 134: LDUH_R	lduh	[%r12 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831e030  ! 138: STH_I	sth	%r20, [%r7 + 0x0030]
	.word 0xe02ae018  ! 139: STB_I	stb	%r16, [%r11 + 0x0018]
	.word 0xe839c008  ! 140: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4536020  ! 142: LDSH_I	ldsh	[%r13 + 0x0020], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe051a000  ! 145: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xec2a8008  ! 146: STB_R	stb	%r22, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe012c008  ! 148: LDUH_R	lduh	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0534008  ! 152: LDSH_R	ldsh	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b2010  ! 154: LDUB_I	ldub	[%r12 + 0x0010], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe022e020  ! 156: STW_I	stw	%r16, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8198008  ! 159: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe8438008  ! 160: LDSW_R	ldsw	[%r14 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe01ac008  ! 163: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec528008  ! 166: LDSH_R	ldsh	[%r10 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe839a020  ! 175: STD_I	std	%r20, [%r6 + 0x0020]
	.word 0xe0128008  ! 176: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe842a000  ! 177: LDSW_I	ldsw	[%r10 + 0x0000], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec21a038  ! 179: STW_I	stw	%r22, [%r6 + 0x0038]
	.word 0xe05b8008  ! 180: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0034008  ! 182: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3a8008  ! 186: STD_R	std	%r22, [%r10 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039c008  ! 189: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe4334008  ! 190: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe029c008  ! 191: STB_R	stb	%r16, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0598008  ! 194: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0534008  ! 196: LDSH_R	ldsh	[%r13 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4732038  ! 198: STX_I	stx	%r18, [%r12 + 0x0038]
	.word 0xec518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe4234008  ! 201: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xa819a010  ! 202: XOR_I	xor 	%r6, 0x0010, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b4008  ! 206: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8736038  ! 215: STX_I	stx	%r20, [%r13 + 0x0038]
	.word 0xe031a010  ! 216: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xec0ae028  ! 217: LDUB_I	ldub	[%r11 + 0x0028], %r22
	.word 0xe411c008  ! 218: LDUH_R	lduh	[%r7 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e010  ! 221: STX_I	stx	%r16, [%r7 + 0x0010]
	.word 0xe011c008  ! 222: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe05a8008  ! 223: LDX_R	ldx	[%r10 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe85aa020  ! 225: LDX_I	ldx	[%r10 + 0x0020], %r20
	.word 0xe4232000  ! 226: STW_I	stw	%r18, [%r12 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe80b6038  ! 229: LDUB_I	ldub	[%r13 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 232: STH_R	sth	%r20, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec0a8008  ! 234: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe01ae008  ! 235: LDD_I	ldd	[%r11 + 0x0008], %r16
	.word 0xe421a010  ! 236: STW_I	stw	%r18, [%r6 + 0x0010]
	.word 0xe81b0008  ! 237: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xac1b2028  ! 238: XOR_I	xor 	%r12, 0x0028, %r22
	.word 0xe029e008  ! 239: STB_I	stb	%r16, [%r7 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ac008  ! 241: LDX_R	ldx	[%r11 + %r8], %r20
	.word 0xec128008  ! 242: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe032c008  ! 243: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe0518008  ! 244: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xa0330008  ! 246: ORN_R	orn 	%r12, %r8, %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84a8008  ! 252: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe023a018  ! 253: STW_I	stw	%r16, [%r14 + 0x0018]
	.word 0xe049e008  ! 254: LDSB_I	ldsb	[%r7 + 0x0008], %r16
	.word 0xe413a030  ! 255: LDUH_I	lduh	[%r14 + 0x0030], %r18
	.word 0xe4738008  ! 256: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe0434008  ! 257: LDSW_R	ldsw	[%r13 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe8230008  ! 261: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe049e038  ! 262: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 264: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8330008  ! 269: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe05b4008  ! 270: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xec4ba018  ! 271: LDSB_I	ldsb	[%r14 + 0x0018], %r22
	.word 0xe40ae008  ! 272: LDUB_I	ldub	[%r11 + 0x0008], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0336028  ! 276: STH_I	sth	%r16, [%r13 + 0x0028]
	.word 0xe4428008  ! 277: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xe00ae000  ! 278: LDUB_I	ldub	[%r11 + 0x0000], %r16
	.word 0xe452e018  ! 279: LDSH_I	ldsh	[%r11 + 0x0018], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b0008  ! 281: LDX_R	ldx	[%r12 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 283: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 285: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe4528008  ! 286: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xec11c008  ! 287: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xec51a018  ! 288: LDSH_I	ldsh	[%r6 + 0x0018], %r22
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429a030  ! 291: STB_I	stb	%r18, [%r6 + 0x0030]
	.word 0xe8738008  ! 292: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xec098008  ! 293: LDUB_R	ldub	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 296: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0528008  ! 4: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe03b2030  ! 5: STD_I	std	%r16, [%r12 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e030  ! 8: STX_I	stx	%r16, [%r11 + 0x0030]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a000  ! 10: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe0498008  ! 11: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa02a8008  ! 12: ANDN_R	andn 	%r10, %r8, %r16
	.word 0xe439e000  ! 13: STD_I	std	%r18, [%r7 + 0x0000]
	.word 0xe011a020  ! 14: LDUH_I	lduh	[%r6 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071c008  ! 20: STX_R	stx	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b8008  ! 23: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe022c008  ! 24: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xec2b2038  ! 25: STB_I	stb	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 29: STW_R	stw	%r22, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8228008  ! 34: STW_R	stw	%r20, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 36: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0018008  ! 37: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ae010  ! 41: LDX_I	ldx	[%r11 + 0x0010], %r20
	.word 0xe05b6000  ! 42: LDX_I	ldx	[%r13 + 0x0000], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6008  ! 47: STD_I	std	%r22, [%r13 + 0x0008]
	.word 0xe81ae000  ! 48: LDD_I	ldd	[%r11 + 0x0000], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6020  ! 52: STB_I	stb	%r16, [%r13 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e020  ! 55: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xe039e010  ! 56: STD_I	std	%r16, [%r7 + 0x0010]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac32c008  ! 59: SUBC_R	orn 	%r11, %r8, %r22
	.word 0xe4734008  ! 60: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe049a008  ! 61: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xec32e010  ! 62: STH_I	sth	%r22, [%r11 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b4008  ! 64: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe431a028  ! 65: STH_I	sth	%r18, [%r6 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 67: STH_R	sth	%r16, [%r7 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0330008  ! 71: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe0218008  ! 72: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 74: STX_R	stx	%r22, [%r12 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82b4008  ! 79: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe0432008  ! 80: LDSW_I	ldsw	[%r12 + 0x0008], %r16
	.word 0xe0718008  ! 81: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe001a038  ! 84: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xe422c008  ! 85: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe0734008  ! 86: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec2ba038  ! 87: STB_I	stb	%r22, [%r14 + 0x0038]
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a020  ! 95: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe822e020  ! 96: STW_I	stw	%r20, [%r11 + 0x0020]
	.word 0xe003a000  ! 97: LDUW_I	lduw	[%r14 + 0x0000], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09c008  ! 99: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xe8498008  ! 100: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe419a020  ! 101: LDD_I	ldd	[%r6 + 0x0020], %r18
	.word 0xe8418008  ! 102: LDSW_R	ldsw	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe822e020  ! 104: STW_I	stw	%r20, [%r11 + 0x0020]
	.word 0xe83ac008  ! 105: STD_R	std	%r20, [%r11 + %r8]
	.word 0xec5b6010  ! 106: LDX_I	ldx	[%r13 + 0x0010], %r22
	.word 0xe41a8008  ! 107: LDD_R	ldd	[%r10 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801a020  ! 114: LDUW_I	lduw	[%r6 + 0x0020], %r20
	.word 0xe022a000  ! 115: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe4318008  ! 116: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe41b4008  ! 119: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xe4032008  ! 120: LDUW_I	lduw	[%r12 + 0x0008], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e030  ! 122: STD_I	std	%r20, [%r7 + 0x0030]
	.word 0xec09e030  ! 123: LDUB_I	ldub	[%r7 + 0x0030], %r22
	.word 0xe829a020  ! 124: STB_I	stb	%r20, [%r6 + 0x0020]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6028  ! 126: LDSB_I	ldsb	[%r13 + 0x0028], %r16
	.word 0xe049a018  ! 127: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xec1aa020  ! 128: LDD_I	ldd	[%r10 + 0x0020], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5b4008  ! 132: LDX_R	ldx	[%r13 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0418008  ! 134: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022e010  ! 138: STW_I	stw	%r16, [%r11 + 0x0010]
	.word 0xe03b4008  ! 139: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe471a028  ! 140: STX_I	stx	%r18, [%r6 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0136038  ! 142: LDUH_I	lduh	[%r13 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe05a8008  ! 145: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe022c008  ! 146: STW_R	stw	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec598008  ! 148: LDX_R	ldx	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe00b2018  ! 152: LDUB_I	ldub	[%r12 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8038008  ! 154: LDUW_R	lduw	[%r14 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 156: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe413a010  ! 159: LDUH_I	lduh	[%r14 + 0x0010], %r18
	.word 0xe851a030  ! 160: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec1aa008  ! 163: LDD_I	ldd	[%r10 + 0x0008], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0428008  ! 166: LDSW_R	ldsw	[%r10 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae020  ! 175: STB_I	stb	%r18, [%r11 + 0x0020]
	.word 0xe053a018  ! 176: LDSH_I	ldsh	[%r14 + 0x0018], %r16
	.word 0xe052c008  ! 177: LDSH_R	ldsh	[%r11 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 179: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe813a030  ! 180: LDUH_I	lduh	[%r14 + 0x0030], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ae008  ! 182: LDX_I	ldx	[%r11 + 0x0008], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 186: STB_R	stb	%r16, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec338008  ! 189: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe021c008  ! 190: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe4330008  ! 191: STH_R	sth	%r18, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe002c008  ! 194: LDUW_R	lduw	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0418008  ! 196: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe472a010  ! 198: STX_I	stx	%r18, [%r10 + 0x0010]
	.word 0xe0034008  ! 199: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe023a038  ! 201: STW_I	stw	%r16, [%r14 + 0x0038]
	.word 0xa8c28008  ! 202: ADDCcc_R	addccc 	%r10, %r8, %r20
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 206: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b6038  ! 215: STB_I	stb	%r18, [%r13 + 0x0038]
	.word 0xec218008  ! 216: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xec134008  ! 217: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xe801a020  ! 218: LDUW_I	lduw	[%r6 + 0x0020], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2aa038  ! 221: STB_I	stb	%r22, [%r10 + 0x0038]
	.word 0xe0430008  ! 222: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe811c008  ! 223: LDUH_R	lduh	[%r7 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4538008  ! 225: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xe03ba018  ! 226: STD_I	std	%r16, [%r14 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0136008  ! 229: LDUH_I	lduh	[%r13 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3ba010  ! 232: STD_I	std	%r22, [%r14 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe01b0008  ! 234: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe40b8008  ! 235: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xe43ae008  ! 236: STD_I	std	%r18, [%r11 + 0x0008]
	.word 0xe419a018  ! 237: LDD_I	ldd	[%r6 + 0x0018], %r18
	.word 0xac438008  ! 238: ADDC_R	addc 	%r14, %r8, %r22
	.word 0xe072a018  ! 239: STX_I	stx	%r16, [%r10 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b2030  ! 241: LDD_I	ldd	[%r12 + 0x0030], %r18
	.word 0xe8518008  ! 242: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xec21a010  ! 243: STW_I	stw	%r22, [%r6 + 0x0010]
	.word 0xe00ba008  ! 244: LDUB_I	ldub	[%r14 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xac2ae020  ! 246: ANDN_I	andn 	%r11, 0x0020, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52e018  ! 252: LDSH_I	ldsh	[%r11 + 0x0018], %r22
	.word 0xe03aa018  ! 253: STD_I	std	%r16, [%r10 + 0x0018]
	.word 0xe859c008  ! 254: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe0436010  ! 255: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	.word 0xe42ae020  ! 256: STB_I	stb	%r18, [%r11 + 0x0020]
	.word 0xe4438008  ! 257: LDSW_R	ldsw	[%r14 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe429e038  ! 261: STB_I	stb	%r18, [%r7 + 0x0038]
	.word 0xe059a038  ! 262: LDX_I	ldx	[%r6 + 0x0038], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe471e038  ! 264: STX_I	stx	%r18, [%r7 + 0x0038]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 269: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe04ba020  ! 270: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	.word 0xe4028008  ! 271: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe0530008  ! 272: LDSH_R	ldsh	[%r12 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe03b2000  ! 276: STD_I	std	%r16, [%r12 + 0x0000]
	.word 0xec5b0008  ! 277: LDX_R	ldx	[%r12 + %r8], %r22
	.word 0xe051e000  ! 278: LDSH_I	ldsh	[%r7 + 0x0000], %r16
	.word 0xe842c008  ! 279: LDSW_R	ldsw	[%r11 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0198008  ! 281: LDD_R	ldd	[%r6 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a030  ! 283: STW_I	stw	%r16, [%r6 + 0x0030]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae028  ! 285: STB_I	stb	%r16, [%r11 + 0x0028]
	.word 0xe451c008  ! 286: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe811a028  ! 287: LDUH_I	lduh	[%r6 + 0x0028], %r20
	.word 0xe049a038  ! 288: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 291: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe432a000  ! 292: STH_I	sth	%r18, [%r10 + 0x0000]
	.word 0xe01b8008  ! 293: LDD_R	ldd	[%r14 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec32a030  ! 296: STH_I	sth	%r22, [%r10 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe819c008  ! 4: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xe0230008  ! 5: STW_R	stw	%r16, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a000  ! 8: STD_I	std	%r18, [%r6 + 0x0000]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0428008  ! 10: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xec0b2000  ! 11: LDUB_I	ldub	[%r12 + 0x0000], %r22
	.word 0xa43b4008  ! 12: XNOR_R	xnor 	%r13, %r8, %r18
	.word 0xe03b6000  ! 13: STD_I	std	%r16, [%r13 + 0x0000]
	.word 0xec134008  ! 14: LDUH_R	lduh	[%r13 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29e000  ! 20: STB_I	stb	%r22, [%r7 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe422c008  ! 23: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe021e008  ! 24: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xe821e010  ! 25: STW_I	stw	%r20, [%r7 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839c008  ! 29: STD_R	std	%r20, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec736020  ! 34: STX_I	stx	%r22, [%r13 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0236020  ! 36: STW_I	stw	%r16, [%r13 + 0x0020]
	.word 0xe8534008  ! 37: LDSH_R	ldsh	[%r13 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8428008  ! 41: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xe012c008  ! 42: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe839a038  ! 47: STD_I	std	%r20, [%r6 + 0x0038]
	.word 0xec418008  ! 48: LDSW_R	ldsw	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83ac008  ! 52: STD_R	std	%r20, [%r11 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a030  ! 55: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xec3aa008  ! 56: STD_I	std	%r22, [%r10 + 0x0008]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8c2a028  ! 59: ADDCcc_I	addccc 	%r10, 0x0028, %r20
	.word 0xe032e008  ! 60: STH_I	sth	%r16, [%r11 + 0x0008]
	.word 0xe811e030  ! 61: LDUH_I	lduh	[%r7 + 0x0030], %r20
	.word 0xe421a000  ! 62: STW_I	stw	%r18, [%r6 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe412a008  ! 64: LDUH_I	lduh	[%r10 + 0x0008], %r18
	.word 0xe02b6010  ! 65: STB_I	stb	%r16, [%r13 + 0x0010]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec31c008  ! 67: STH_R	sth	%r22, [%r7 + %r8]
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe429c008  ! 71: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe03b2030  ! 72: STD_I	std	%r16, [%r12 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 74: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 79: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe4438008  ! 80: LDSW_R	ldsw	[%r14 + %r8], %r18
	.word 0xe0736008  ! 81: STX_I	stx	%r16, [%r13 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe04ba018  ! 84: LDSB_I	ldsb	[%r14 + 0x0018], %r16
	.word 0xe8234008  ! 85: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe031a000  ! 86: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe03b6000  ! 87: STD_I	std	%r16, [%r13 + 0x0000]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2a8008  ! 95: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xe039a028  ! 96: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe81b4008  ! 97: LDD_R	ldd	[%r13 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0032038  ! 99: LDUW_I	lduw	[%r12 + 0x0038], %r16
	.word 0xe451c008  ! 100: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe80b8008  ! 101: LDUB_R	ldub	[%r14 + %r8], %r20
	.word 0xec02c008  ! 102: LDUW_R	lduw	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec29a010  ! 104: STB_I	stb	%r22, [%r6 + 0x0010]
	.word 0xe0318008  ! 105: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe009e000  ! 106: LDUB_I	ldub	[%r7 + 0x0000], %r16
	.word 0xe45ba018  ! 107: LDX_I	ldx	[%r14 + 0x0018], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe412a020  ! 114: LDUH_I	lduh	[%r10 + 0x0020], %r18
	.word 0xe82b8008  ! 115: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xec2a8008  ! 116: STB_R	stb	%r22, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe841a000  ! 119: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	.word 0xe4038008  ! 120: LDUW_R	lduw	[%r14 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec730008  ! 122: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xec41a000  ! 123: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xe032e038  ! 124: STH_I	sth	%r16, [%r11 + 0x0038]
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811a008  ! 126: LDUH_I	lduh	[%r6 + 0x0008], %r20
	.word 0xe00b8008  ! 127: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe459e028  ! 128: LDX_I	ldx	[%r7 + 0x0028], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0198008  ! 132: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe00b8008  ! 134: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236010  ! 138: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xec22e010  ! 139: STW_I	stw	%r22, [%r11 + 0x0010]
	.word 0xe42b8008  ! 140: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe059a000  ! 142: LDX_I	ldx	[%r6 + 0x0000], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe002c008  ! 145: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe832a030  ! 146: STH_I	sth	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec52a000  ! 148: LDSH_I	ldsh	[%r10 + 0x0000], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe459e028  ! 152: LDX_I	ldx	[%r7 + 0x0028], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ac008  ! 154: LDX_R	ldx	[%r11 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8730008  ! 156: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0118008  ! 159: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe451a028  ! 160: LDSH_I	ldsh	[%r6 + 0x0028], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe019a020  ! 163: LDD_I	ldd	[%r6 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44a8008  ! 166: LDSB_R	ldsb	[%r10 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe83a8008  ! 175: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe019e010  ! 176: LDD_I	ldd	[%r7 + 0x0010], %r16
	.word 0xe052a000  ! 177: LDSH_I	ldsh	[%r10 + 0x0000], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b2010  ! 179: STD_I	std	%r16, [%r12 + 0x0010]
	.word 0xec01a030  ! 180: LDUW_I	lduw	[%r6 + 0x0030], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45ba028  ! 182: LDX_I	ldx	[%r14 + 0x0028], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471a038  ! 186: STX_I	stx	%r18, [%r6 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43aa018  ! 189: STD_I	std	%r18, [%r10 + 0x0018]
	.word 0xe029a038  ! 190: STB_I	stb	%r16, [%r6 + 0x0038]
	.word 0xe8318008  ! 191: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec532030  ! 194: LDSH_I	ldsh	[%r12 + 0x0030], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec498008  ! 196: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4332008  ! 198: STH_I	sth	%r18, [%r12 + 0x0008]
	.word 0xe411a020  ! 199: LDUH_I	lduh	[%r6 + 0x0020], %r18
	.word 0xec21c008  ! 201: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xaca9c008  ! 202: ANDNcc_R	andncc 	%r7, %r8, %r22
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 206: STH_R	sth	%r16, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4730008  ! 215: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe03b4008  ! 216: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe449c008  ! 217: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe4498008  ! 218: LDSB_R	ldsb	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a028  ! 221: STB_I	stb	%r22, [%r6 + 0x0028]
	.word 0xe051a020  ! 222: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	.word 0xe8418008  ! 223: LDSW_R	ldsw	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe402e038  ! 225: LDUW_I	lduw	[%r11 + 0x0038], %r18
	.word 0xe42ae028  ! 226: STB_I	stb	%r18, [%r11 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe01b4008  ! 229: LDD_R	ldd	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ae008  ! 232: STD_I	std	%r20, [%r11 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8518008  ! 234: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe003a020  ! 235: LDUW_I	lduw	[%r14 + 0x0020], %r16
	.word 0xe0728008  ! 236: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe012e038  ! 237: LDUH_I	lduh	[%r11 + 0x0038], %r16
	.word 0xa4a30008  ! 238: SUBcc_R	subcc 	%r12, %r8, %r18
	.word 0xe8736028  ! 239: STX_I	stx	%r20, [%r13 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0028008  ! 241: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe809c008  ! 242: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xe03b2010  ! 243: STD_I	std	%r16, [%r12 + 0x0010]
	.word 0xec4aa018  ! 244: LDSB_I	ldsb	[%r10 + 0x0018], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xacb9c008  ! 246: XNORcc_R	xnorcc 	%r7, %r8, %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec59c008  ! 252: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xe033a018  ! 253: STH_I	sth	%r16, [%r14 + 0x0018]
	.word 0xec19c008  ! 254: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xe01b8008  ! 255: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe822a038  ! 256: STW_I	stw	%r20, [%r10 + 0x0038]
	.word 0xe041a030  ! 257: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe03ba020  ! 261: STD_I	std	%r16, [%r14 + 0x0020]
	.word 0xe84b4008  ! 262: LDSB_R	ldsb	[%r13 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029e020  ! 264: STB_I	stb	%r16, [%r7 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 269: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe4528008  ! 270: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xe001a010  ! 271: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xe00aa010  ! 272: LDUB_I	ldub	[%r10 + 0x0010], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 276: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe443a010  ! 277: LDSW_I	ldsw	[%r14 + 0x0010], %r18
	.word 0xe85b8008  ! 278: LDX_R	ldx	[%r14 + %r8], %r20
	.word 0xe04b6018  ! 279: LDSB_I	ldsb	[%r13 + 0x0018], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a008  ! 281: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ba038  ! 283: STB_I	stb	%r22, [%r14 + 0x0038]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec72a030  ! 285: STX_I	stx	%r22, [%r10 + 0x0030]
	.word 0xe4030008  ! 286: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe05b4008  ! 287: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe4536010  ! 288: LDSH_I	ldsh	[%r13 + 0x0010], %r18
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe423a010  ! 291: STW_I	stw	%r18, [%r14 + 0x0010]
	.word 0xe429a018  ! 292: STB_I	stb	%r18, [%r6 + 0x0018]
	.word 0xe4198008  ! 293: LDD_R	ldd	[%r6 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec338008  ! 296: STH_R	sth	%r22, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40

join_lbl_0_0:



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

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
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

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
	.xword	0x71d823b39019c8a1
	.xword	0xc493e58454811b37
	.xword	0xf713fa0190c897f4
	.xword	0x6552d0d95d57d7e6
	.xword	0x72d2842513f50095
	.xword	0x6d786f813fd9adb8
	.xword	0xf3b5bf44bd17f669
	.xword	0x817bced9483fbceb
	.xword	0x69fd5d9dc52ca7f8
	.xword	0xe4445020313fa7dc
	.xword	0x61b785d82c93268e
	.xword	0x731b03a1a8fa27d0
	.xword	0x98fa28ac7fd5384a
	.xword	0xf568643b8c7e118d
	.xword	0xe21528d831536e50
	.xword	0x4a2560ba4ebc295e
	.xword	0x0b1d859d32b613d9
	.xword	0x0de94c1276fa3558
	.xword	0x709a4f2c14c886b9
	.xword	0x857d0ab505ee29fd
	.xword	0x0a1969548eae1e55
	.xword	0x0d87f3b4a3129067
	.xword	0x4e2b3b19a505066d
	.xword	0x0d91e4b41d9aa5ba
	.xword	0x06fb4d815842bfe1
	.xword	0x1a87f27c278e7355
	.xword	0xe12e9beed47faee0
	.xword	0x8f24f5222612c6c6
	.xword	0x42e391e64e912bc4
	.xword	0xcb7efdf17f0c15e5
	.xword	0x611c98f9642ad53a
	.xword	0x6924685bd473916f
	.xword	0xb489f2ae0770dd1c
	.xword	0x716065fbb969d95c
	.xword	0x72b3d929fe36f85d
	.xword	0xf069d073d53a988a
	.xword	0xfa67d5b08ff44c74
	.xword	0x4c0c9d180df51d8a
	.xword	0x322896e71692f6a9
	.xword	0xf4794cd756519320
	.xword	0x2f7f768a4befc4c7
	.xword	0x6aaed0e5cde09612
	.xword	0x9a4d9ab7131f423e
	.xword	0x5358de6808ecc2ab
	.xword	0x6ccc8d5e8ae00b3a
	.xword	0x39c45105ca3f0851
	.xword	0xd73989433a7d92f9
	.xword	0x4b71542ec4689d08
	.xword	0x5f41220352a60731
	.xword	0x2a20a36cacc1888e
	.xword	0xbae286ba674cc056
	.xword	0x4e57e3d92ec291e7
	.xword	0x32b210567c62a7a6
	.xword	0xca1ef9403058e967
	.xword	0xd3bb0236c92738b3
	.xword	0x2b898df2a7970b9e
	.xword	0x0e9c7e8c280cfadb
	.xword	0xf801aa7667039694
	.xword	0xd555ed86ea805889
	.xword	0x3d8991645072827a
	.xword	0x930caa66b024c5e0
	.xword	0xcbc402909ad73571
	.xword	0x064b7e8b894c3215
	.xword	0xf89496b5e70135df
	.xword	0x42bc21f965992f93
	.xword	0xfb6f4cd46e6eb64a
	.xword	0x55473f205545bfff
	.xword	0x2570a239e660b39c
	.xword	0x3332c5500b26148e
	.xword	0x2991d72d54ecb616
	.xword	0x34c9194f796aa74a
	.xword	0x1cd222981bf61bbe
	.xword	0x50227f4b4d5b0163
	.xword	0xf476fb294c83c999
	.xword	0xc881897ffdf6dd5a
	.xword	0x2d1fe503ebbafe80
	.xword	0xcf3d7d5930831cf2
	.xword	0xdb3ad6f2b0e929ef
	.xword	0x8afc1b413a24a642
	.xword	0xd5e03ce003a9f173
	.xword	0x18ed3a0db92db2b2
	.xword	0xa7fb654eaca723cb
	.xword	0xcc5463d41cbfa498
	.xword	0xbb7c562b8bb8cbf9
	.xword	0x54977c5ac8965301
	.xword	0x79a00588fdf25a18
	.xword	0x99283a3cfe3704c5
	.xword	0x7c084534ebf36f6b
	.xword	0x112eade937549630
	.xword	0x354e2c5fe81eb56c
	.xword	0x3a56d05c4519da09
	.xword	0x1840bbf7d8b755cb
	.xword	0x484e711c98e4165f
	.xword	0x03acd0757b833b58
	.xword	0x9ba758937fbb2e03
	.xword	0x2f6909630c8050da
	.xword	0x9900bf27d1fa457a
	.xword	0xa290921d831f560a
	.xword	0x720b1c720f807512
	.xword	0x10c8ddf39acd92a7
	.xword	0xa9f63a72984fe739
	.xword	0xb7f4250086b8a8ea
	.xword	0x47461f72e23521a8
	.xword	0x017f25a77398d128
	.xword	0xb4d87c369078cf4a
	.xword	0x0cd02eef30722b50
	.xword	0x5d4c4e1f992fc2a8
	.xword	0x7dad62a4e63910c8
	.xword	0x2117046ab171823f
	.xword	0x281c734b479d5681
	.xword	0x738476f138b2f616
	.xword	0xe2ee1963ff047b66
	.xword	0x8d5e2e2dc8b5bf5f
	.xword	0xc2894b811aee83bb
	.xword	0xce80f9efbabb3737
	.xword	0x45bf6dda5ac19a45
	.xword	0x778b8e3e2721a303
	.xword	0x19e9a07e3c98df66
	.xword	0x8812708fe2157760
	.xword	0x35120ff81e2823d6
	.xword	0x76a29b2eebff38d4
	.xword	0x00b61dc7d7648ada
	.xword	0xb1e56a35c1c52967
	.xword	0x79ccc7f9561de10f
	.xword	0x0abd03af22d1e398
	.xword	0x56777f820737dbab
	.xword	0x62b85af4ac2190d7
	.xword	0xbb95e2e0d05fff4b
	.xword	0x3d04918af2f2e707
	.xword	0x86bd237647be5a0e
	.xword	0x8c66f283aa0e54ca
	.xword	0xb3c3eb8043fb8061
	.xword	0x9941adfaa86226aa
	.xword	0x4c89768638aa6f27
	.xword	0x60a723f4a4fa7ab0
	.xword	0x41c41e17c22dfdc6
	.xword	0xcba8d153a9f9d600
	.xword	0x837a7380df6f71ba
	.xword	0x44e7cd7fea047b2e
	.xword	0xb63c97ca33cd13b6
	.xword	0x9117c8fcc5629217
	.xword	0x32bfe0548aa83db8
	.xword	0xfd014532d77f8ed4
	.xword	0x2284464c6e57418b
	.xword	0xf2d56e6182f3a2e7
	.xword	0x9e80deecc6bb6f32
	.xword	0xdfa64eebdf5de279
	.xword	0xa0849ba507cc16cc
	.xword	0xa4304d6678b43fc3
	.xword	0x79aa1c381eaf0e70
	.xword	0xe547ca68c863eeaa
	.xword	0xbc98626633d3437a
	.xword	0xbf6890d91f34ed8c
	.xword	0x2d25957df9e8f746
	.xword	0xb6ee2995071ff4d1
	.xword	0xe5ddc28c059d3e58
	.xword	0xcaec5086c5a3b01e
	.xword	0x3fe9ad3b1d2850ab
	.xword	0x2d36fd0275f33916
	.xword	0x87c44be320c75c01
	.xword	0xf27bf59296a9ee2a
	.xword	0xa41507e1844fc0d5
	.xword	0x4c71a52a3e527d2e
	.xword	0xff5b2e8bf8ea0048
	.xword	0x949f700aed695bb6
	.xword	0x05969225c7435821
	.xword	0x6d947865664aa41b
	.xword	0xda62ef1f5c906a89
	.xword	0x3128f70a84679802
	.xword	0x849b09476a7e85e0
	.xword	0xf1e3041b5285784c
	.xword	0x4736828759ac5091
	.xword	0xd885ce30fbe53a30
	.xword	0x21f76e86db01071f
	.xword	0xebd7a2993edbf3d8
	.xword	0x3ca234bec60c0aa8
	.xword	0xacc1c8088c4c7fd2
	.xword	0xdaa1aa8d35c37805
	.xword	0x1615fbdf7c62348d
	.xword	0x856d772d0aef0f1c
	.xword	0x2e5bed83f2adbbb9
	.xword	0xae7b32ce014b1373
	.xword	0xea73cabcd9c9be7a
	.xword	0xf45cc76e7141e3ea
	.xword	0xe949854cf012835c
	.xword	0x5659b60dbe1ea489
	.xword	0xfcc22c710187f091
	.xword	0xe351ada32e7ba502
	.xword	0x84e8605ce92f7189
	.xword	0xb10ae395e9472bda
	.xword	0xde757d05b3e691a7
	.xword	0xe84147f7d2d8ec1d
	.xword	0x5e1f706cc76d295d
	.xword	0x7035c45daaa938da
	.xword	0x0fed8d8afe22b159
	.xword	0xc8d5e45baea3efa2
	.xword	0xca6e9d16710a95b9
	.xword	0x460c300b6ef02f9d
	.xword	0x3d39342ddec9238a
	.xword	0xc20faae3a9936fe5
	.xword	0x4e7bb32b1e8ea020
	.xword	0x7c576efb5fbe7504
	.xword	0x074ce71d963e6ccf
	.xword	0x5e4cf708d75d9cf1
	.xword	0x4872af8f66bc2219
	.xword	0xa3ee14b4f5a3fd7e
	.xword	0xdf923673ea125bc9
	.xword	0xcb9615abd464876c
	.xword	0x5de52263665a3fd9
	.xword	0xfed75ee5a4871876
	.xword	0x9691e36581f5a9ec
	.xword	0xca5d5ffd0067db74
	.xword	0xeac3bd1460a30d8c
	.xword	0xf9c03c74d9cf41df
	.xword	0xb52fd9e3b103bdbd
	.xword	0xe427a92dcc799f78
	.xword	0x14a81e0c82ab5853
	.xword	0xc0a8bfd94a91bc4b
	.xword	0xd59a6a60211a6dc5
	.xword	0xa8d16b8602132f53
	.xword	0x2f159a0cbfc48049
	.xword	0x6c0e5c30e144af6a
	.xword	0xa461132573582c89
	.xword	0x994f685e6e8a3f82
	.xword	0x3338f5d55c29009d
	.xword	0x709a186c775f10ee
	.xword	0x20d4e039a0d16c9b
	.xword	0x40db1a7b29ffe63d
	.xword	0x233e6fb06b504b45
	.xword	0xc98fa70818bdae03
	.xword	0xccb2dad5d7a82d7b
	.xword	0xa623bb29f4d1296a
	.xword	0xc23ebcf471ff6f45
	.xword	0x305f44c33ae5d273
	.xword	0x6952d161220b664e
	.xword	0xe79ad7e50f0b160b
	.xword	0x7cc762db831dfc48
	.xword	0xb227351261be85c0
	.xword	0x73dc85648102609f
	.xword	0x59dfa666e89dbbeb
	.xword	0x7f0a717a0ee495a1
	.xword	0x65b1e66a456595ec
	.xword	0xa92913f1c7da5d4d
	.xword	0x7653bcd9622f5e68
	.xword	0xdb6a4711bd5da168
	.xword	0xe3b64260b4ecd2a9
	.xword	0xf4b8aef4a7233d6c
	.xword	0xd1f63ecac32c7f49
	.xword	0xe096d75896f017db
	.xword	0x1a658f286a7edf48
	.xword	0xe8839afe4f8ca96e
	.xword	0x5b2168bcb2b9d073
	.xword	0xdef29492966f7539
	.xword	0xe366995bc5db79dc
	.xword	0xad3655162e448189
	.xword	0xb46447d412915571



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
	.xword	0x9b6d567e3f40d651
	.xword	0x8adddd6f2ba6d2df
	.xword	0xd5eef1cfe0c33b50
	.xword	0xf98535b6271b33f2
	.xword	0x9be1f675d12fc78b
	.xword	0x74a5f91560c31ebf
	.xword	0x043da4e9269d19a3
	.xword	0x3c0ed63ce9170e7d
	.xword	0x0e47fb39739e1d86
	.xword	0xc39eafa2f8805106
	.xword	0xd8f61595332d5a7e
	.xword	0x422f560401ae2b67
	.xword	0x82a0fe8ab6f246b0
	.xword	0xe4ca96d5cfed7548
	.xword	0xc5db9027852ed99b
	.xword	0x659f04914e092db4
	.xword	0xfa2bcdbbf5bcd157
	.xword	0x020a61ee4c933b20
	.xword	0xf4b3449f6b27ccf6
	.xword	0x9101af3621a56bfd
	.xword	0x24b6df4e498dfee8
	.xword	0xf866c81344ff3814
	.xword	0x29b49ea070b9a33d
	.xword	0x0a71b0265126e704
	.xword	0xce5b0efd4e27d5de
	.xword	0x010502630fc3656e
	.xword	0xf10d8868b0b610ca
	.xword	0x3dbe39d0f81b2563
	.xword	0xbca01d8c1150bce6
	.xword	0xb85bc9d5c6690f4f
	.xword	0xeb40a819c6d3bbcf
	.xword	0xe966a76ec5e04a87
	.xword	0x57631c47fd97fff7
	.xword	0xa01f977fa0a6e4dd
	.xword	0x15ae5ae53f4bec00
	.xword	0x713e33b46d4579e8
	.xword	0xf7d6f2052362e252
	.xword	0xee547b935e8846ce
	.xword	0x5a57cb21fcfd9f02
	.xword	0xcd09b6bf4cfc5007
	.xword	0xd845f2fb0f8d3a14
	.xword	0x006c69f5d2e0f917
	.xword	0x95fb51171b301f9f
	.xword	0xb68577dfb4352964
	.xword	0x20ab57cb28e51e69
	.xword	0xe301664ca2464512
	.xword	0xd1685a3647dabdfc
	.xword	0x13c0bb5d52e34629
	.xword	0xf7b5d1b6bc28c51f
	.xword	0x4ac8f74e585a4615
	.xword	0x6e10aa4b2556b315
	.xword	0x6d6759427d9f7dcc
	.xword	0x581a37ef6e30489e
	.xword	0x25957244a9f00403
	.xword	0x8bddd2f662f8b595
	.xword	0x2e91f542077b9315
	.xword	0xd734a52d9549c878
	.xword	0x78cf9c1308d1e4d9
	.xword	0x640d9deacbd71246
	.xword	0x7f73c59c2b0bcc1e
	.xword	0x44ccae31eefaaa3f
	.xword	0x8e2a1792535f42f9
	.xword	0x337cea8c25cf77d2
	.xword	0x35926e1177cb65df
	.xword	0x4057d0332403760d
	.xword	0xf990060a8e3fa519
	.xword	0x3eaff62d04658b55
	.xword	0x3266d2541d042354
	.xword	0x5b6ac945d1f6c643
	.xword	0xc7e89007883b7484
	.xword	0x06732336c6a9c6b5
	.xword	0x97391148e2dfb4e6
	.xword	0xb4d555d8b9441149
	.xword	0x5c8bd38a6e235044
	.xword	0xa37edd7469659a33
	.xword	0x5cd8004d883d9621
	.xword	0x05b3a03f74f1a789
	.xword	0xf571c08091329def
	.xword	0xc77f70c7d362048c
	.xword	0x30578e7d9e05bb6d
	.xword	0x1361cbb522bd2923
	.xword	0x6328820d66299f56
	.xword	0xb32aca885f0f0913
	.xword	0x58668dabe5a9b15b
	.xword	0xebe038d1d2edaafd
	.xword	0x07f3f394a1ed16b1
	.xword	0x8483d3f8a4e3a2e6
	.xword	0x87efd5880c768dc7
	.xword	0x102a089501eb4573
	.xword	0xba08687a0de1612a
	.xword	0x5441b080ce851fa6
	.xword	0x39b2ecad82845bf1
	.xword	0x8276b52a14185ead
	.xword	0xd1e4eb73689113fb
	.xword	0x9c1ec696cf9ab434
	.xword	0x71c93266f806dd1f
	.xword	0xa82bb4e98f1be5a5
	.xword	0xd24ab3a54af4ae7a
	.xword	0x7c7dcc991030a214
	.xword	0x6011963b2bc1824e
	.xword	0xac9ed16e88c1a9f2
	.xword	0x6f466cd311d29c05
	.xword	0xb11fea5d086d0557
	.xword	0x48dec274414030aa
	.xword	0x378f1ce48c7eeac5
	.xword	0x20e22f8b89a66fee
	.xword	0xc761e5fb1c1eb0a1
	.xword	0x1eb83aa1eaaf4347
	.xword	0xa19d43d74dc31781
	.xword	0xf58c7b2ebddad0c7
	.xword	0x45487eb21e7ee935
	.xword	0x3f79e43baacd7a4f
	.xword	0x6d7ee33ea2a94eac
	.xword	0x4694e615e2cebf49
	.xword	0xa10a58eeaaa1c14e
	.xword	0xecb014fcaad6ea07
	.xword	0x8a4ee0b21bfc8bc1
	.xword	0x618995794f39ece9
	.xword	0xc6ce1dbec13e986a
	.xword	0x7cab6d7a38c3e6a6
	.xword	0x87905bd6ba9f5219
	.xword	0xf2960e9cf204a55a
	.xword	0x3ecff7a233389bfe
	.xword	0x362072018043f911
	.xword	0xf34621bd588ba185
	.xword	0xecc19cf1eba9d81e
	.xword	0x9f0e32cee0014a69
	.xword	0x15d509b6072898c2
	.xword	0x91f235fa3483809e
	.xword	0x32970eefd1bae192
	.xword	0x157a064fe3d354e7
	.xword	0x98263aa1e0d27759
	.xword	0x568dfd5c050453e7
	.xword	0xfb3fa1274a14efff
	.xword	0xd3664840962282ee
	.xword	0xf8d63fc4e8cb60d2
	.xword	0x05ee391521bfcbca
	.xword	0xa013c2c5bfc5a11a
	.xword	0x7a93fe9f3c25b914
	.xword	0x01c29537b37c7f0d
	.xword	0xff31d30da3f07b8c
	.xword	0x023c44869ca9ace8
	.xword	0x2c166ea79884d526
	.xword	0xf6aab063d8b344d5
	.xword	0x18fa52c8881cd0e6
	.xword	0x8a61a2b2b84b0a71
	.xword	0xaa3cce1929c8bbab
	.xword	0xe234f0631246cecd
	.xword	0x33d5b6f315c8e1ac
	.xword	0x202d285e01d1ec9e
	.xword	0x43e78e6e7d43259f
	.xword	0xdc54ad2454f47b81
	.xword	0xbd201bd1bcda9cc1
	.xword	0x57dadf63bde0e930
	.xword	0xe1089ae0c92b9629
	.xword	0xb2b77a4e82c9aeb9
	.xword	0xfd18040aa7e286c2
	.xword	0x5aa02921776a6eba
	.xword	0xe195c8f123e8afcb
	.xword	0x848dc9ea5c99e86f
	.xword	0xe061658308eb5729
	.xword	0xe42ecfed54068f35
	.xword	0xc9902f44e6443335
	.xword	0x7c97798746790c65
	.xword	0xa5257fc90bce2fa6
	.xword	0x845e7ee549516404
	.xword	0xc289a993dfe17cf5
	.xword	0x24050d5d6d92b5a9
	.xword	0x29009f6507fc6ac5
	.xword	0x8a115370e29b009f
	.xword	0x699d754c28b0bf9d
	.xword	0x23b8d770d234b726
	.xword	0x98bdce1cfb0b435f
	.xword	0xaccd13641104ae5f
	.xword	0xa4b51ee638ae59f4
	.xword	0x57d2dfea52bd2548
	.xword	0x3e73939a68a68503
	.xword	0xa6b94009ba60c8af
	.xword	0x034fde9bd476db11
	.xword	0x0abdd7b7a61bc8ce
	.xword	0x6737d58f493fbc85
	.xword	0x37f8bd53f4c31129
	.xword	0xdb0ce5393b6f2344
	.xword	0xb6ab4cb559acd6ed
	.xword	0x9ebdcdd7e4f3a033
	.xword	0xccb8508999102b35
	.xword	0xf65ec2354fb2cf4b
	.xword	0x7327976e97abe215
	.xword	0x442da6f16f020ab3
	.xword	0x1cae688338f3693a
	.xword	0x3f76817eb59db41e
	.xword	0xcc8e9c7ff2de8353
	.xword	0x5cb9a855e48272a2
	.xword	0x224ea481990330a0
	.xword	0x003bc7dfd8c460b8
	.xword	0x0ee003fe4ed220cb
	.xword	0x5c34034b97917538
	.xword	0x36cfd84ddffa6494
	.xword	0x385350ae2f942af7
	.xword	0xae805906cf379aab
	.xword	0xc49f107bf6c4f820
	.xword	0x5b775b0d9f30df3a
	.xword	0x0e42060c6651aecc
	.xword	0xdbb485b6460870fa
	.xword	0x3b2015a40e2ce7b2
	.xword	0x4786c9265d16fc8a
	.xword	0x52be5e64b933cc63
	.xword	0x6faf2c7e0925ea31
	.xword	0x5c430e0eba6d9f09
	.xword	0x72d15e6f2aa30e01
	.xword	0x283c0cd85e9f71e9
	.xword	0x6507db9b3f31c3e6
	.xword	0xfca6fc494e09e229
	.xword	0xfb6cc420f897b130
	.xword	0x58d7d863c9c46ceb
	.xword	0x9c10993ccf2171d2
	.xword	0x241af516d1b8e210
	.xword	0x02cea23e7030e86c
	.xword	0x614a1f79a1579b1b
	.xword	0x84a4b26417605bf8
	.xword	0x71a7b40b230393fe
	.xword	0x990fdc6c39588e5b
	.xword	0xc4310f4bd2197e89
	.xword	0xb53fdd9df465aad5
	.xword	0x4e672573eb0dd559
	.xword	0x824dd7c3c0dd0696
	.xword	0xa714cf2912b2c592
	.xword	0x83456322859fd71c
	.xword	0xd75d77fa31f418fd
	.xword	0xd97d29a5cc3bae1e
	.xword	0xba591f3fc098b39e
	.xword	0x907f5ca7d14bb902
	.xword	0x7c22a8a9973d2046
	.xword	0x38bbc3d6ba479fa3
	.xword	0x3fcaee77fa436d91
	.xword	0xb08bfadd5c1fdcac
	.xword	0xcc71463e80c31386
	.xword	0x2df541de4831d174
	.xword	0xefa6c13b816aaf44
	.xword	0xc6228a38bdf9d9e2
	.xword	0x7a94c80f150d8d81
	.xword	0xce3a1320200bc4d2
	.xword	0xaa0c9c933ece7e35
	.xword	0x6088882f7f8de372
	.xword	0x87e49e05b510dac3
	.xword	0xf11a7e3958d998b2
	.xword	0x58c15da010312465
	.xword	0xc940c6095dfd53a5
	.xword	0xc290446790148a98
	.xword	0x8f215ae899376fed
	.xword	0x2fd65e371d8b5e0c
	.xword	0x13f7520ea5af80d2
	.xword	0xda6ca96afb6c4879
	.xword	0x0f1d88687a039bf4
	.xword	0xe7a80ae7ab8444db
	.xword	0xd08bf83269f66eef



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
	.xword	0x5de4c75606207ec3
	.xword	0xf6b5eefc1e2f9355
	.xword	0x3520725c016082f5
	.xword	0x74f4c1d57e8e45c6
	.xword	0xce3054c96731d42c
	.xword	0xf8fd8dd952b22cfb
	.xword	0x436451b420b586ea
	.xword	0x32acea7b9a1b3bb9
	.xword	0x27fea8130ffabc58
	.xword	0x047b0f1f9c89711c
	.xword	0x48326058f9dd3226
	.xword	0xc2adf511f6447e22
	.xword	0x368226e0c5747e91
	.xword	0x5c8f8b065f9bc9c4
	.xword	0x09c6e638b0b35986
	.xword	0xaf3f5c724a8ccc4b
	.xword	0x932c054e0e254617
	.xword	0xd9d5ae033973f7c6
	.xword	0xb23c98252c043115
	.xword	0xcd63c5111a5e32d9
	.xword	0xd4777a137ba8b20e
	.xword	0x94bce746a0dfce93
	.xword	0xa75703efb5ef28ef
	.xword	0x368f34a1d45329d6
	.xword	0x149fc40d3ab5c419
	.xword	0x55ddc12ef759ef1e
	.xword	0x6076e324a81bd893
	.xword	0x407af6b0b9fbcd69
	.xword	0x502dc02f51e71472
	.xword	0x08d291e12a8b46e4
	.xword	0x69b76c34ea66d299
	.xword	0xe335c4bc5d461a27
	.xword	0xc74f1c4be6b26326
	.xword	0xbc0796e0da9b208f
	.xword	0xf5cd4fd5064ce1f2
	.xword	0xec6a8db67f7a4a80
	.xword	0xb2756f75dde8dfb9
	.xword	0x37c3fa03e2e17dd7
	.xword	0x3e495c334aaa6024
	.xword	0x8aacfeec8cbd907d
	.xword	0x9033b6b0af481f50
	.xword	0xe523918ba1ea69a8
	.xword	0x820fbc34cbedf6c5
	.xword	0xf87cb009976125b9
	.xword	0x0c5ac0eeef24c008
	.xword	0x510194209de12dc7
	.xword	0xfd06736e8a330d41
	.xword	0x9874f0b73a1d719b
	.xword	0xc9a5523cab16b8dd
	.xword	0xe27780db01ce3252
	.xword	0xbb25b83803257590
	.xword	0xf200748865e770eb
	.xword	0x1021696ec9eef12f
	.xword	0xf7714083d4c770d7
	.xword	0xe7a75d82d179a3d4
	.xword	0xab311b9566d2c727
	.xword	0x08c4b7367babb16b
	.xword	0xe566accc9bb7e961
	.xword	0xc6f3163a1a382a85
	.xword	0xb9cb9f7089d4196a
	.xword	0x4b47f5497a0bccb9
	.xword	0x83d2e47bfe154547
	.xword	0x6cb3b618b80fc1ce
	.xword	0x8643ef674323ba38
	.xword	0xadbed9ff2e342d59
	.xword	0x7ff4c040487b4b99
	.xword	0x7b243535a544becf
	.xword	0x6032e9c8444e179b
	.xword	0x837fc98fa6483d74
	.xword	0xa3fb84003c933b6a
	.xword	0xab478668d00cb431
	.xword	0xf8ac822b650b0e4f
	.xword	0x60e3b8f20998ef0d
	.xword	0x570d0a5787c1ed1e
	.xword	0x71943bda0dfdd6e1
	.xword	0xffe414fd687294e7
	.xword	0x138b87aade1ff865
	.xword	0xcb3624e31cdc791a
	.xword	0x87145f4acd04a703
	.xword	0xb018016928dd1eeb
	.xword	0x74ebd676c60e5b2e
	.xword	0x270ba77819d4de3a
	.xword	0xb2ae4fca479c8bc9
	.xword	0x8eddcd6349bb783b
	.xword	0x12019cf53a811ae7
	.xword	0x4765a121ebafb6b3
	.xword	0x3a76e46ea413f005
	.xword	0x95ed8228637aab98
	.xword	0x3f1cfb509d779869
	.xword	0x19e6c62fdde110a0
	.xword	0xe3c7e0659a54599a
	.xword	0xba68238060eadcad
	.xword	0x0ec361825055d7fe
	.xword	0x3fc1092e462f7065
	.xword	0xb2d41c80cd1c1c53
	.xword	0x6115d66339560ec8
	.xword	0x886e1e1d7bc1a99b
	.xword	0x06256a62171a6354
	.xword	0x6b666ce8aa5cb119
	.xword	0xb97315178322eea5
	.xword	0x715a7567665b1882
	.xword	0xe037f502ee3ab165
	.xword	0x45f2ab280e2d1995
	.xword	0x608a57eca877120b
	.xword	0x929f9345d65f1a4e
	.xword	0x93f806eb1f2f6605
	.xword	0xe1b46fb8f6cd8da7
	.xword	0x709f7dd1a032d29d
	.xword	0x7e08c108531136be
	.xword	0x4a11558122365a7c
	.xword	0x29fff310760dc30d
	.xword	0x4487763d6bfe6947
	.xword	0xc2c81026266e6a76
	.xword	0x61f6835c3ab36953
	.xword	0x8ce6ad5cc29c177c
	.xword	0x9fdbc819763ad759
	.xword	0x1f1a6df0e06b8dd3
	.xword	0x225dbc7aa0e714e3
	.xword	0xc16fff973350df4a
	.xword	0xedf3f29f426badb3
	.xword	0xf4b750d8438cbadc
	.xword	0xee7a48d3f5c91dde
	.xword	0x1dca9a8957d75f5d
	.xword	0x3cb9fd968e5d9304
	.xword	0xebb6390f525b683b
	.xword	0xadba15db59ddae78
	.xword	0x3c5a80fe4dfa19ee
	.xword	0x58d148a6408167ce
	.xword	0x23edcc568d820de1
	.xword	0xddb3d0fcb302a22e
	.xword	0x702deae47e9c6a08
	.xword	0x7005320704821b8f
	.xword	0x32ddbbee7efc8a7f
	.xword	0x1b8c74e1cb0d8ea7
	.xword	0xc23a2edb2ec21bc6
	.xword	0x89c0ba29ca335586
	.xword	0x7860fb344c0727fe
	.xword	0x576739f72ea22773
	.xword	0xbf58547e6d3ecd8b
	.xword	0xefd3a93c1880bb3a
	.xword	0x45b06b7c9ae30c87
	.xword	0xbae6335e82f76408
	.xword	0x9b474c3a06f6190b
	.xword	0x5e108af9d43aca87
	.xword	0xbc026af8f789ce27
	.xword	0x5ea86669b083196f
	.xword	0x1bb25634e28fa41a
	.xword	0x93b0c0bf9c26dca8
	.xword	0xd9d929eac7b050e8
	.xword	0x11db2d2381f2885f
	.xword	0xf95fa7114a31bed4
	.xword	0x8515ac7b77271618
	.xword	0x43e1bca29473d92d
	.xword	0x9cb168e3a456660f
	.xword	0x09d93889547a147a
	.xword	0x5be6e64c3baedaac
	.xword	0xf8a5cb975921a70b
	.xword	0xde975a24887c7a36
	.xword	0x1d68f893db9a5fcf
	.xword	0xe323be2276b0a079
	.xword	0xe1f3c164bf7e12ed
	.xword	0x496bcbd2883aba9e
	.xword	0x3be6c4bfcb2ba827
	.xword	0xffe4657bfddd3a2a
	.xword	0x147be2a5b75efe13
	.xword	0xac16c8b18ceb52d2
	.xword	0x7d4c86c793c7c104
	.xword	0xaf2e91af2109213f
	.xword	0xdf47b34571d9da05
	.xword	0xf38673326e77d445
	.xword	0x2cef0a613691b1a5
	.xword	0x0926757bdaf10fbc
	.xword	0x30b9ea8ec967a152
	.xword	0x6c0ac1cf4af4d3be
	.xword	0x4cc55a00dfa0f470
	.xword	0xa77c800032354c46
	.xword	0x7d8565e5ca1f9ad2
	.xword	0xf708abe904aec422
	.xword	0x8ebaaefd742d21c3
	.xword	0xfddf6f51e61a6cec
	.xword	0x016c14ac560071b3
	.xword	0xe001aa22fe04665d
	.xword	0xa3b559afe9e9c5de
	.xword	0x5e2c06a131fcca99
	.xword	0x9225cadc18bf450d
	.xword	0xaa0d440f3ebc3d0c
	.xword	0xcce41bb519e11e9c
	.xword	0xdb98c258351d454d
	.xword	0xc64adf0b6ca1013b
	.xword	0x6ec737b8d695a79f
	.xword	0x7717ccc1d4bf9673
	.xword	0x42472dd0d032e359
	.xword	0x2550972564ec55bc
	.xword	0x502f5b0036438302
	.xword	0x5d295c5f96b5cf70
	.xword	0xf93b1ae9935afe6b
	.xword	0xc42b84a986043e7f
	.xword	0x3c7fcf3e629ecbb4
	.xword	0x759e9bd8c6e8526c
	.xword	0x8ca276462969cd71
	.xword	0x8b8d90356bab78c9
	.xword	0xcdf217ea588cb24f
	.xword	0x632353df670e6473
	.xword	0x06d74b1e373b87b1
	.xword	0xfc7a51acf0283c55
	.xword	0x183b13f241a14d1e
	.xword	0x623f9d48e59b6b24
	.xword	0x15f672f66776f1f7
	.xword	0xed868a0478672f04
	.xword	0xcbc09cc9041c2d67
	.xword	0xebbf62b3b6430c93
	.xword	0x28900136a754498e
	.xword	0xc6bcb6a137c624c6
	.xword	0x0ce82479e5c6e362
	.xword	0x9f235cf0beac150d
	.xword	0xedeb7b1a2088a301
	.xword	0x561d94a0fe2f2926
	.xword	0x8aad81a2a0787f58
	.xword	0xa7dfa18641c436da
	.xword	0xb926820ab8051fc5
	.xword	0x566c86ad217ca52b
	.xword	0x4ea74335289291be
	.xword	0x895521d7eb6a045e
	.xword	0x2048f35f674ccfa9
	.xword	0xcfd2b48420c366c9
	.xword	0x9214ef68356f7373
	.xword	0x3cafaf8c6321e962
	.xword	0x10ce49095afee5b1
	.xword	0x475c9dce3d983329
	.xword	0xc9ac55706a14bd02
	.xword	0x8b6c98ab303587d0
	.xword	0x8fe30f612f175a9c
	.xword	0xeb596754c7f5c63d
	.xword	0x79dcdc6f43378164
	.xword	0xbc8db848a28de6e0
	.xword	0xd7d0c19543a2718b
	.xword	0x6d3eb068ee526ce0
	.xword	0x2a4def46e92df981
	.xword	0xe1645f1cf84dd199
	.xword	0x13081c285d971ace
	.xword	0xd42bc0a92508b334
	.xword	0x626d94bcedeb8e24
	.xword	0x9f1e5e61cd28e461
	.xword	0x0261f218336e8fcb
	.xword	0xe82057c5ebd2b61d
	.xword	0x2233e0a7dede46c1
	.xword	0x987c64ce8cfea88c
	.xword	0x6861a41c03fd9380
	.xword	0x6fd1523c974abf3c
	.xword	0x0213c718862ab56c
	.xword	0xc1f3cf29ca5b1cee
	.xword	0x0a01f8eda9a00bfe
	.xword	0x3fd72c256ae148b4
	.xword	0xec4228fece7a8698
	.xword	0x466dc7bb2cc16b4d
	.xword	0xce328c3811bb4695



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
	.xword	0xa7e507f6e4575cc9
	.xword	0x095faf6c80f5561d
	.xword	0xd0c306d2a674fd74
	.xword	0xfebf3f3bb70c4360
	.xword	0x2d06b1a78ac4f888
	.xword	0x47265bd46c42975b
	.xword	0xa1fdb57a0dc3f013
	.xword	0x395740725b2dc369
	.xword	0x90f2c42da61fe12d
	.xword	0x6e5960bd1a9a0ba3
	.xword	0xcbc132b0877660c3
	.xword	0xdc557baf529ba9ad
	.xword	0x8d3eb44973f34c78
	.xword	0x292d24188dd1ff56
	.xword	0x0aaf871182994359
	.xword	0x83d0c764a95dd961
	.xword	0xd1ed7bd19f705622
	.xword	0xa8ab7250acc656df
	.xword	0x313c42718c8952e8
	.xword	0xd32896c4732be9e6
	.xword	0x3730c101c538e23b
	.xword	0x77f70d5e9e0d6e46
	.xword	0xbd6505b1b22390ce
	.xword	0xf5f174a6adc1c57d
	.xword	0x70347c27ac41180f
	.xword	0x51987b67ec5fe3ce
	.xword	0x158ca52bc70d2970
	.xword	0xa4e41e17aef184b0
	.xword	0x90652f7fcc3cd462
	.xword	0x0c8c5d0308a7fa89
	.xword	0x8939fcaf79f2e322
	.xword	0x14d7306583d138ef
	.xword	0x0956c70ed07ab34d
	.xword	0x4d558f7f5193ce63
	.xword	0xc3f8a8dc412af9d3
	.xword	0x1040b0bbd069271e
	.xword	0x8c393d7fc084b7d1
	.xword	0x726d67acd0457589
	.xword	0xc8fe6c0696215cf2
	.xword	0x19e7e400be280bd8
	.xword	0x2bbcce71fec2d4c6
	.xword	0xd8d328928ea95b74
	.xword	0x0d0ca1c47cffc020
	.xword	0x67e2ecd3ece47626
	.xword	0x0d02dd2277bed479
	.xword	0x64114a12b7679261
	.xword	0x4b82322a7f3cfd5f
	.xword	0x6add92899cca54b6
	.xword	0x272e394d90232ab1
	.xword	0x77d4e69c82513415
	.xword	0x612d8e35b4e8ec22
	.xword	0xaec61077c8670f13
	.xword	0x1f479183c3a6b1c1
	.xword	0xb6e46e63a4e4bd61
	.xword	0xfce7b377441ad623
	.xword	0xe4173d972daede1e
	.xword	0x3e43c8b43ce96ba6
	.xword	0xe2daca87ded45a4e
	.xword	0x4390fc3810c3dbf0
	.xword	0x3cf9b5a379517a92
	.xword	0x879250ceca823071
	.xword	0xe9cd8d7a730e05ba
	.xword	0x2230bb0ddb2cd23b
	.xword	0x98895aa546e53036
	.xword	0x23d67400d017e924
	.xword	0x75df4e8116bd914b
	.xword	0x68f9f98dcefde081
	.xword	0x60cbc9f90632f3a1
	.xword	0xd56ef933e0922ab2
	.xword	0x2d5a772a39dbda21
	.xword	0x242dd6131d73ab2f
	.xword	0xc2446f1a8f0d8fbf
	.xword	0xec55704894ad9a46
	.xword	0x18ab9b6856036ef8
	.xword	0x2d0cd7dbae35191b
	.xword	0x97dd2f4560b6dc04
	.xword	0xac9a0ea6b8c72843
	.xword	0xb551b74164d66068
	.xword	0x53f9363505e67991
	.xword	0x22276b27c0c33199
	.xword	0xd9cbf651b73e7f5d
	.xword	0x872383e22625afea
	.xword	0x954a3d2669653c10
	.xword	0x2bead4e12f2eafaa
	.xword	0x0f637ccabd7a63bc
	.xword	0x101141cef51018e7
	.xword	0x8a41509aaf0dc638
	.xword	0x4a8f3d26acfc21db
	.xword	0x362b83afd7fdf6c5
	.xword	0x6738b48ec7e23ee6
	.xword	0x3c0a5b593f6de8f3
	.xword	0x9b6a16a50800be8f
	.xword	0x0c5b9bee79eed4ae
	.xword	0x66d049b8f9fecaf3
	.xword	0xe7dd56c841a8fbc8
	.xword	0x106b56d3b74fdace
	.xword	0x2a7c3b0ea11540b4
	.xword	0xf8512b09b968c8c4
	.xword	0xd5add5573a562305
	.xword	0x1b9759633c8de8e5
	.xword	0xca594ec8ebb1f573
	.xword	0x36e9b32233003631
	.xword	0x70e191b7c7c6a31f
	.xword	0x165871c87d40eb27
	.xword	0x95274e43487d507a
	.xword	0xf1b52c68d47827b5
	.xword	0x8cc15dd3d5d2d5fe
	.xword	0xdb94da4d2cdee63a
	.xword	0x4018ebab2b1057c6
	.xword	0xb5227d7ff9426be1
	.xword	0x5b14335f15fccb9e
	.xword	0xe88511fe3c5016d2
	.xword	0xee32650d5f3f020e
	.xword	0x2e3d3ca436496a60
	.xword	0xc82d4b84563e8b4a
	.xword	0x1f1e57f8c7ef2cd1
	.xword	0x634ace9573193ccb
	.xword	0xfcb8f964c9f99c4f
	.xword	0x5991b9ad255b3204
	.xword	0x98c86901e2b2d7a9
	.xword	0x923cb705a6857e9e
	.xword	0xbc93807bbe8e64e9
	.xword	0xe8bfc99da2845b59
	.xword	0xc42356105c1eeca9
	.xword	0x9032972cce2d3025
	.xword	0x32b646ca7a6f45c7
	.xword	0xa5a1772568953795
	.xword	0x42e3b961d157f9fc
	.xword	0x5e82bee1370d12eb
	.xword	0xa9e672cf6b37d204
	.xword	0xf0609e5e757315eb
	.xword	0x7b98d9b1d18290d0
	.xword	0xee69e29c6de5e11b
	.xword	0x3233e1ce998f9ade
	.xword	0xa0e612a8b4e9ed47
	.xword	0xa9f16a82b3e6ee34
	.xword	0xe9ea4065edd0bc02
	.xword	0xe84ccdc487cc1534
	.xword	0x92096e6451fa3fdc
	.xword	0xaed74fef4195ec88
	.xword	0x51e828cf1464e769
	.xword	0x83e88a1b383d4b74
	.xword	0xe1c86e69d58c2ff9
	.xword	0x50162f15d1988e6a
	.xword	0x8c08613d8ea9bd83
	.xword	0xa66f722fee65e30f
	.xword	0x9590719754d3729d
	.xword	0x4e3e005c03c63451
	.xword	0x3af61f0014ace55d
	.xword	0x9f5e5e8cd1410472
	.xword	0x731b648f752c5f22
	.xword	0x06a77cda54d5a053
	.xword	0x9b990b7c0a235334
	.xword	0x8f48896a2e19e12e
	.xword	0x787f392887a3d75f
	.xword	0xa180ce26e005c4a8
	.xword	0x821960551dfa3669
	.xword	0x41a019ffe414ec97
	.xword	0x32a12a7276b6046c
	.xword	0xf4ae24d183ada281
	.xword	0x115e1fa44877bac2
	.xword	0x7c1a11e104096d79
	.xword	0xc16690f5f49d5e35
	.xword	0xb396a5e57022fd74
	.xword	0x438d447aafcfc465
	.xword	0x8694fab53cb161ab
	.xword	0x5a559c50a495e89e
	.xword	0x14bb7f9a8729c506
	.xword	0x3609d7f7a65204e7
	.xword	0xf6652dd38b0fe6ec
	.xword	0x469415a66df7e7f8
	.xword	0x3abd8024499b00e2
	.xword	0x9d99a5d4466eaf29
	.xword	0xc541fee99ca40663
	.xword	0x07de3ec251ae719f
	.xword	0xe2c4747630707d11
	.xword	0xcdc385e3374bcce8
	.xword	0x22779ff1ed2a5bbb
	.xword	0xb587660e67552f7e
	.xword	0x3dfae3252189e442
	.xword	0x692f73c98e8884a1
	.xword	0xe904370032350eef
	.xword	0x36dec07dd5880dea
	.xword	0x246b74aac79b8be8
	.xword	0x2e7840cf296fab02
	.xword	0x7b907258036ad0c1
	.xword	0x2423a38886369747
	.xword	0xb3d6dd2a271317fc
	.xword	0x6260afe096ab6d95
	.xword	0xb27b37ac884a7e93
	.xword	0x23fc823d68d2a888
	.xword	0x856ed7b1de8ad90c
	.xword	0x7ba724fadafcd18e
	.xword	0xb0b7d1291f8a796b
	.xword	0x8e0139a8b2ebd6f3
	.xword	0x5921427dd0a8e346
	.xword	0x22fe04afed2b3d8c
	.xword	0x44fd8f210af2c7f3
	.xword	0xac19e5cfd748b19d
	.xword	0xf01c1c2a58c504b4
	.xword	0x182f8366b6b27c42
	.xword	0xc83acc0aa5bfb33c
	.xword	0x16bef86a60326633
	.xword	0x9b21f8358caa986c
	.xword	0x51c3d7ad48124f54
	.xword	0xe9599dce2a188db9
	.xword	0xe3148787f47efc54
	.xword	0x8b43031e6fa143c5
	.xword	0x1a9cdc15499e9878
	.xword	0x0315d8c5c09d7d19
	.xword	0x5c4459d9bd37ebc5
	.xword	0x8c3421799f1bc7bd
	.xword	0x596c65d93c5c6af7
	.xword	0x1b079c2ee86bdbbb
	.xword	0x185a9041a64b9b17
	.xword	0x519cd48e6f063a32
	.xword	0x30247c581f102a04
	.xword	0xed9f01224b7de063
	.xword	0x10e72d37a9021068
	.xword	0x478919ae2fe5246b
	.xword	0xe94a731babf2e18f
	.xword	0x8a40ac0c559319fc
	.xword	0x5fd1429ef1066976
	.xword	0xa6a3806db75e7b26
	.xword	0x2afa077c6e9975c2
	.xword	0xa2ba39e0244c4d12
	.xword	0x8fa2cbf8561f1d91
	.xword	0x1f41b011261de384
	.xword	0xeceffe5756375e73
	.xword	0x3d2175d192e669ad
	.xword	0x8b79aadebf72374b
	.xword	0x31e0e65ec97dbd7a
	.xword	0xe7b9486a05a455f6
	.xword	0xf0cc24c66f991350
	.xword	0x094e8e9aa758330f
	.xword	0x436af54628137c09
	.xword	0x6b358ae582ef18ea
	.xword	0x3a55fc31ebc06a2e
	.xword	0x91617b055e172719
	.xword	0x5d93f7bfa3574b87
	.xword	0xc7aff03a727e4dda
	.xword	0xf8f7c11815f6c2eb
	.xword	0x2f2d38774b5d8274
	.xword	0x75be2b46c61790da
	.xword	0xcb8eb7cf1861af65
	.xword	0x0935b1c900da92ef
	.xword	0x446c1c3753bf3556
	.xword	0x71bae914b7492785
	.xword	0x0b70cdbc679df94a
	.xword	0x1b7b1bf1c2f2c53e
	.xword	0x9c8ced0d43ed5a57
	.xword	0xee531174966b2828
	.xword	0x0453ca50f322e6af
	.xword	0x74e9f8321e769dce
	.xword	0xc32163c8a46fd062
	.xword	0xd8cf5584e041391c



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
	.xword	0x263df07e62c16abd
	.xword	0x016303578baee4fd
	.xword	0xeb1b771b10c2ef40
	.xword	0x2ebdbfd257645c5e
	.xword	0x28540646ffbe3569
	.xword	0x58c4872bd5f9f90e
	.xword	0x9714a31bf762ccfe
	.xword	0x86d5d8696713c88a
	.xword	0x091f89d0a7614ed9
	.xword	0x1e4be34bf6e28041
	.xword	0xec620046acf9a601
	.xword	0x4b667ecb4f8daae6
	.xword	0x6c78d93540ef235b
	.xword	0x352bb525f4530150
	.xword	0x6f16deb1e3e4bf75
	.xword	0x8584997c0b227352
	.xword	0xb030dc9d51fa8b96
	.xword	0x8a6511f6cbf074c2
	.xword	0xe4f0f54e4be4602a
	.xword	0x47677b856ce4b9ca
	.xword	0x7964d6a17f2cf725
	.xword	0xd3a851d9497ce86a
	.xword	0xead87dbf40b86f62
	.xword	0xa9ce32ffe6e168d3
	.xword	0xfe1a441e1899b7b6
	.xword	0x475b587dd645623a
	.xword	0x8a29e99dfd86b293
	.xword	0x6fe510ec1b415276
	.xword	0x357e2c4fb6b55401
	.xword	0xfd1d5ef710d5a11c
	.xword	0xf69785c807589f73
	.xword	0x62a9c99a1c09688a
	.xword	0x014430ffb2ad41cb
	.xword	0xada11472f3a8babd
	.xword	0xde3590b88aeae7b0
	.xword	0xadf50d630616a7c0
	.xword	0xaa5bb8c04cfa9a90
	.xword	0xfdb405f53f8d8cea
	.xword	0x3f29779de9a2ca8c
	.xword	0x4b223022eb5a98a9
	.xword	0x1f2b9284fbbe5860
	.xword	0x76866e56b884443f
	.xword	0xeba1ae3e4068d9e2
	.xword	0xfce5bd64c2403f01
	.xword	0xfd679e502f218b53
	.xword	0xe62a001b05518ec8
	.xword	0x21d2c99ef234402c
	.xword	0x9c437f36fc2e09cb
	.xword	0xd5f7bdb80d69db0d
	.xword	0xe25def70b18cf993
	.xword	0x8698a0d81aab9347
	.xword	0xf4a9bfc34173435e
	.xword	0x89cf531135c97076
	.xword	0xc4406a61b5d7b7a1
	.xword	0x9db2f87d12f84994
	.xword	0x8f90bb1c0c8d5996
	.xword	0xb097019aa79463f8
	.xword	0xc55f14a3500c3e78
	.xword	0x713d9343130b8e16
	.xword	0x2eb54baf1e9a36a2
	.xword	0x7566ec4a3d02a7ce
	.xword	0x618d2d20381bbd69
	.xword	0x7cd86c3502bdd6f8
	.xword	0x4883f518e50bd051
	.xword	0xd02ec70b18193bf7
	.xword	0x04077a592398eeb8
	.xword	0x16f07499a15b92e5
	.xword	0xed9570529595b762
	.xword	0xf5706206b3b32238
	.xword	0xbab44f0def7e9a39
	.xword	0xd4aaf3ced08b14b9
	.xword	0x7915beaf488f4676
	.xword	0xe6a56d2fe5d351b9
	.xword	0x7e99da34acbb7406
	.xword	0x36de249d51d52894
	.xword	0xf69272ba0cfa6160
	.xword	0x31cda553848c894d
	.xword	0x20fe086e7dfda6dc
	.xword	0x3029afe37973b898
	.xword	0x7c4576d9461d7709
	.xword	0x7a1c602235a4913e
	.xword	0xcdaea2742b495f7c
	.xword	0x1d26503df75afd03
	.xword	0x22aaa5e058f63200
	.xword	0xb5f911ebfc0ac1a7
	.xword	0xb8aca9b814885ab4
	.xword	0xef3bd13423d74066
	.xword	0x3980daa1d872f74e
	.xword	0xb4c5871c9e519117
	.xword	0xa6488ff1cf8f1fe0
	.xword	0x335ed09956c84f7f
	.xword	0xa232c3f8a533cc19
	.xword	0x4b46169a6742403a
	.xword	0x045026e116dd18fb
	.xword	0x8dbbbff83e8a5c5a
	.xword	0x53a3f807a2ce2135
	.xword	0xb21aec2879f335e9
	.xword	0xdf4d5ec42559da63
	.xword	0xbec457e9181c7e43
	.xword	0x1b8221aa58f848d8
	.xword	0xeb30fac80b40ce58
	.xword	0x382e0b1abe010963
	.xword	0x17738258fdd7e74f
	.xword	0xd75993b0d50367e6
	.xword	0x76e26450d5f50337
	.xword	0x14e33c54e8a84b88
	.xword	0x4eae484d290174e4
	.xword	0x7b620a650ef3b620
	.xword	0x4c77276741559ea6
	.xword	0xff3e71e1b4881188
	.xword	0xddbd045de24fd4a5
	.xword	0xa7dc43f8a06b535e
	.xword	0xb82501f4072e6bff
	.xword	0x700350fba3c7e791
	.xword	0xbd83cceba043a2da
	.xword	0x701d0e1d36b0b429
	.xword	0xdb36926f7ad53de2
	.xword	0xd1fa500f51a5677f
	.xword	0xbf292ca7209fbc54
	.xword	0x452049c53559a47d
	.xword	0x05cd4070f8be0845
	.xword	0x36f3d8c89901f00d
	.xword	0x51c794208ce89d1a
	.xword	0xd4a2a7fee0b8b950
	.xword	0xd9ae571ab2e9de0e
	.xword	0xdb68db415c32cafb
	.xword	0xf79f597bc0c78aa9
	.xword	0x54148c6a5d1df0ef
	.xword	0x5a0d601cacc9a71a
	.xword	0x808e7e77d8d600e2
	.xword	0x9843912bb08a0f6f
	.xword	0x0eb453a92402a387
	.xword	0x6409736ec5111d1e
	.xword	0x4854c4ef315688d3
	.xword	0x7aee306588024914
	.xword	0x6f5075f09aff022e
	.xword	0x6cc3e70e608f4063
	.xword	0x782378a0d9ff682e
	.xword	0x1f902bcf78f256b8
	.xword	0x2ad96fd91411fd20
	.xword	0x96e73475e57c3236
	.xword	0x81c124bf5851c34d
	.xword	0x0495c9b53f8ec4ef
	.xword	0xa8e1f4d0871eb0ac
	.xword	0xb9318e0a70d26b71
	.xword	0x320e86f0552092fb
	.xword	0x8282e9431d328f31
	.xword	0x8802fc2feba4a860
	.xword	0x433d50cc4ee5dc4b
	.xword	0xf1b6c47c8b436cb3
	.xword	0x7c7d90340a8ad223
	.xword	0xb3b15d0fbad13a70
	.xword	0x70d93f3acebda516
	.xword	0xee881110e65bf218
	.xword	0xe6289fcefe00fae7
	.xword	0xf14c3e213d2403d5
	.xword	0xbb9d601fd73adbb2
	.xword	0x79937f188e9fc5f1
	.xword	0x866fa8255dffbe99
	.xword	0x6a2fbb61310aecfa
	.xword	0x1992827fb305fe09
	.xword	0x0dc2d18f42b4072b
	.xword	0x34d0de0c85bd04e9
	.xword	0x7d4991c4a2080127
	.xword	0x904680e1ff46348a
	.xword	0x0cd8bfdbfb6cc08e
	.xword	0xcfee7276e1fbeb2e
	.xword	0xc0b6a9e7ac4773f5
	.xword	0x890d28d9ebd1d7d8
	.xword	0xab6e1f31c55bf44d
	.xword	0xcca57b9f9b8218e3
	.xword	0xfb40cccc71986f30
	.xword	0x87c2a997dc834bcb
	.xword	0x5b6ecce97a0cc931
	.xword	0x679bf0934b169a68
	.xword	0xc32a7d409968f3d2
	.xword	0x78c6676d79e380c6
	.xword	0xceb40025270e7d9b
	.xword	0xc9139bdc79f3f613
	.xword	0x3d954e2284e2c7d6
	.xword	0x96cd3f52fa254330
	.xword	0x23b9a826dae2e730
	.xword	0x9fda15d9529bece7
	.xword	0x626c874f5cab35c9
	.xword	0x9445a18f24ee8349
	.xword	0xe216c1401ad822cd
	.xword	0xfd910d721f5605d5
	.xword	0x053c04da1a94146b
	.xword	0x72830536675ee752
	.xword	0x936804bf25a5aca2
	.xword	0xa5bcb40cf39041fc
	.xword	0x1957336325151608
	.xword	0xf8a00017ce9fa14b
	.xword	0x1eea0c4bbb8ad9cf
	.xword	0x4f975c87271ff828
	.xword	0x131ff670fa40e54b
	.xword	0xa6a7793376d3a271
	.xword	0x04d007507e8df21a
	.xword	0xf564b1d042783ce7
	.xword	0x986a619c236f5a38
	.xword	0x31f5728e43f40a67
	.xword	0x4c616df6c52c2a98
	.xword	0x39a9cb202e5aa8f5
	.xword	0xce0aa7983a198609
	.xword	0xb675af8fb62cc7dd
	.xword	0x5cb13af1c0f684ec
	.xword	0xab67d037428b2e56
	.xword	0xf46a1cfaed7f7289
	.xword	0x33c56890517ee6d2
	.xword	0xf25cd3f95d37ad49
	.xword	0xedba1c5b77cb77a4
	.xword	0xfb59c366baceada8
	.xword	0x639a28f47eec2e52
	.xword	0x0141bf32db8dbe8a
	.xword	0xf7d1da4424898eb7
	.xword	0xaa9dc175d8e4dfd4
	.xword	0x589c0584e1275a8b
	.xword	0xd271abf9878936b1
	.xword	0x187ac5de1d9698bf
	.xword	0xae8d240a7b9e0f1c
	.xword	0x4ae3da079ce5ce7a
	.xword	0x250c8df7534edd97
	.xword	0x897b70cb17d796e8
	.xword	0xc2f0baf4f81ee7aa
	.xword	0x23abb2a45b64483c
	.xword	0xbf94183ef7425213
	.xword	0x556279259a8e4597
	.xword	0x29def39b8260fe31
	.xword	0x67ad31b3e2e81afc
	.xword	0x89d2c1c672f31971
	.xword	0x8f83d1d0ed595b7c
	.xword	0x7df44a17c96ff15b
	.xword	0x60bb21f505a1e5d0
	.xword	0x6a2d24ce7abd25ac
	.xword	0xa21a1a7464352408
	.xword	0x5d486c01739aba97
	.xword	0x354422f66288c659
	.xword	0x0654536250fb6b26
	.xword	0x4b75454f85b90a99
	.xword	0x73b1da2b28adcc60
	.xword	0xa1fdff3446e1aff5
	.xword	0xb5f81cd058eb05e9
	.xword	0xb60eb4145690d2d5
	.xword	0x0231a3119d2f7c64
	.xword	0xac3c27733a4d6c5a
	.xword	0xc492c91e134fb1d0
	.xword	0x317b0a178eb06938
	.xword	0x8eafb5ac3072176b
	.xword	0xcfa9a5a72abcc794
	.xword	0xb91266a80655729e
	.xword	0x1938fd3f1cf62b1f
	.xword	0x6e4d3ea094aafd7b
	.xword	0xed4268183aa8c88f
	.xword	0x1704086b4a1f314f
	.xword	0xc29d98fb29f9a548
	.xword	0x7385d07e3187db9a



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
	.xword	0xd2a510e331f32b59
	.xword	0x43774b09d259aa6c
	.xword	0xce2721078361de76
	.xword	0x39a3ae1182fb62e8
	.xword	0x2a6c1ca3d9c776e6
	.xword	0xc6e8847c196cd7b1
	.xword	0x27b6cfea9e9c2f04
	.xword	0xa871b8fbf9d14753
	.xword	0xbd865425f112eed7
	.xword	0xf3d1520c625c52a7
	.xword	0xd42eecdeb821e3b5
	.xword	0x777990bdd01e64db
	.xword	0x978763c0f37cc8e3
	.xword	0x783cdc1a624e4e81
	.xword	0x2d98607132ae6b65
	.xword	0xea857c9658afb403
	.xword	0x841010a78dff7552
	.xword	0x96adacb602deeaf2
	.xword	0xd2f6c5f3f05447e7
	.xword	0xad3c02356f6ab828
	.xword	0x2080991054a2e348
	.xword	0xca8331b925412471
	.xword	0xd1a263df46cfcb0c
	.xword	0xec2e04b4aa84c608
	.xword	0x787d9485ce4a3272
	.xword	0xda983a2629d46746
	.xword	0x7d528364a0f50c9f
	.xword	0x40f563350918871b
	.xword	0xa624898e4fad3764
	.xword	0xb49251fbc6f04aee
	.xword	0x85ff06d793fa1d42
	.xword	0x96e912ace1985fe7
	.xword	0xda6a218dfad37a0b
	.xword	0x259fa0571cdd6776
	.xword	0x008a04da3f8901a4
	.xword	0x614abef02efc97a8
	.xword	0x7db3876368262555
	.xword	0xb592e7f46bd83e87
	.xword	0xf49438ce0c599fdf
	.xword	0x91696a1f7957783e
	.xword	0x1ba6e4ae23bad47a
	.xword	0xdd294a6b8111cbd5
	.xword	0x5e2cea6b0fa21b30
	.xword	0x54760306c36cc063
	.xword	0x10c5e4b7d1ad0e2f
	.xword	0x2b44698fd7b1e5c8
	.xword	0x2a3cd283638cb49a
	.xword	0xa47ed2c450ea4efb
	.xword	0x463ca8e281b7c80d
	.xword	0x120c0209ea3ed935
	.xword	0x5173045cedfdebc0
	.xword	0xdf24971425a72401
	.xword	0xccd9e21fc6b5d228
	.xword	0xff42ea9f6db76017
	.xword	0xfadcf6c54507144f
	.xword	0x0c91317ea344f2fa
	.xword	0xa81348815bc75d6a
	.xword	0x2e63d1918f93aa81
	.xword	0xf10aae4ed028b208
	.xword	0x88249264099d3d85
	.xword	0x94a24ff99cb48b3b
	.xword	0x6be6e37d87b8418a
	.xword	0xdac4742b7520ae29
	.xword	0x353f13000261710a
	.xword	0xa09b57ca49187367
	.xword	0xd8f69b922bd4cdcd
	.xword	0x3595f9d5fc2bc36e
	.xword	0xc17a46b9ae14e495
	.xword	0xfec6e60426d68b2e
	.xword	0x748efbbcbb034b24
	.xword	0x34b5ec2f98675f4f
	.xword	0x3192336a2e1da279
	.xword	0xfd92f56a766b826b
	.xword	0x97b4e6f3772b6082
	.xword	0x447a4ab0a5d98ab6
	.xword	0x906e06917e091ce6
	.xword	0x905e4cb7cd15aa47
	.xword	0x81eeadd5aae3bd07
	.xword	0x50d5ff5eb36acad9
	.xword	0xc7833350ba41811a
	.xword	0x79e7c6f3cbeba16e
	.xword	0xdfd9e215cda88587
	.xword	0xa4fbf08f6c0e0776
	.xword	0x040f2004cbc09403
	.xword	0xf69cc4216afb1be7
	.xword	0xbfab4cef5c748835
	.xword	0x0a4c8183fbcfd82e
	.xword	0x483aa1dc9cd03684
	.xword	0xb4a519de03e84ffe
	.xword	0x949d4daed78e1be8
	.xword	0xd971834b7a51d9c1
	.xword	0x9099b777ac406904
	.xword	0x1c8a6f9cdab63364
	.xword	0x750b82f3d3b8dd33
	.xword	0x7702a22cf2bcadb2
	.xword	0x66f9bf6ff0177937
	.xword	0x230cb610886c973c
	.xword	0xfa3f6e28d25057a5
	.xword	0x72d9e436497b1ebd
	.xword	0xa939177387917864
	.xword	0x61ca731a94c9c330
	.xword	0x5b065069a6f566df
	.xword	0xceb9ee60bc67a14d
	.xword	0xe2f42dd7ee9e6d4c
	.xword	0xc371c17da1c1f34c
	.xword	0xe747b7177f80eecf
	.xword	0x7b4ac9d4c41642e1
	.xword	0xb50b890b7e7031f3
	.xword	0x09ca1a1bb4b8924d
	.xword	0x081155dd868386f2
	.xword	0xff7b539f696bb35e
	.xword	0x06ae4a56c48f38e1
	.xword	0xeea54a4557716518
	.xword	0x100bf8fe484d96f0
	.xword	0xf76383aa8820a464
	.xword	0xf3c8393858b5e2b1
	.xword	0xfa2fbe7a25b61558
	.xword	0xe2318a1f58214306
	.xword	0x9ca797e8dcb9116b
	.xword	0x57067c7ba074a769
	.xword	0xe771078715ad2d66
	.xword	0x9dd590bc3b3145e7
	.xword	0x056324164740cf72
	.xword	0x28e0b1cf5914e414
	.xword	0xce8f3c96c348f176
	.xword	0xff9cf0ffc3e3e306
	.xword	0xc50b6951b780f6e6
	.xword	0x097f84f2e0061a45
	.xword	0xb1fd64885d75c80b
	.xword	0x0348705cad606ba5
	.xword	0xeb1aeddd318c91c1
	.xword	0x4d9b754cf8b15ba3
	.xword	0xe452c9e0cf6e1d10
	.xword	0x8c060d6a17916aca
	.xword	0xf0e25200b310621e
	.xword	0x241073942a03d515
	.xword	0xa501eb521ca2d827
	.xword	0x8c90aca566c6232c
	.xword	0x609eb9c31957d4d5
	.xword	0x22ffa48feee7728b
	.xword	0xe7ba031835c677c1
	.xword	0x59f3c134d9923796
	.xword	0x4cc9701c7367685b
	.xword	0xae9adb8557a1a145
	.xword	0x2b8c8874415482e4
	.xword	0xd271e96052756272
	.xword	0xbd68c1f78cbf2112
	.xword	0xe95dbd5763590626
	.xword	0xad1a3326f9f967ce
	.xword	0x31bffc3800150684
	.xword	0x2b4026eeb1c294ef
	.xword	0xce5bf229e87a58b2
	.xword	0xe0706afd3964280c
	.xword	0x4a1d0e141306272b
	.xword	0x05c5f2ec8c71edd8
	.xword	0xbf652efef70b03aa
	.xword	0x657fc89bc7c91277
	.xword	0x8976f1eea18b8b7e
	.xword	0x481fea1cefc88027
	.xword	0x4ca0607671d76245
	.xword	0x4b23cec09c1444f4
	.xword	0x8d9c60507d443ada
	.xword	0x8a1b55be5d3ed3ce
	.xword	0x8f43bf53d687ae8b
	.xword	0x097138bc79abc33e
	.xword	0xd0eb66a8605a0b8c
	.xword	0x937721afc627310e
	.xword	0xf85d7157cd016b14
	.xword	0x884147c89a4d816b
	.xword	0x202e8cea91f52823
	.xword	0x99ed2e8fa9b7403f
	.xword	0xff05b6bb2985d0b2
	.xword	0x2bb33173017a4511
	.xword	0x4e70690218fd77fa
	.xword	0x9bc5810108936bf7
	.xword	0x793eb605af33402d
	.xword	0x0f15b17e260a1d44
	.xword	0xc210deb3d35167b5
	.xword	0x05614c211ada7dc1
	.xword	0x8961d1dd65257777
	.xword	0x4ddcf893679b81b8
	.xword	0x0f8116da3f50010d
	.xword	0x67532ec7b127c8b3
	.xword	0x0da6a464918b0c6f
	.xword	0xacc725640966d46a
	.xword	0xfe21a013a64b1304
	.xword	0x0bec68e1fab4dd5c
	.xword	0x0ce53b8ca939e247
	.xword	0xc9390800399a2500
	.xword	0x3c5dd15c9a40456d
	.xword	0x596580b20ab64df6
	.xword	0x9ec5c0282f62d47e
	.xword	0x7432ae3d79819eb3
	.xword	0x6af8b5ffbae9b41c
	.xword	0x49b16b5f5c302078
	.xword	0xd3e8adbc5029c3d4
	.xword	0x2268256f77023f0c
	.xword	0x3a469dea17d50b6d
	.xword	0x1d4504f381f8311c
	.xword	0x499a2417eec3f987
	.xword	0x13a2bc347de11e9c
	.xword	0x4664264782fe67db
	.xword	0x9f5d109ae6efe009
	.xword	0x553dd95ccfbcea8b
	.xword	0x4518488b40f98e69
	.xword	0x6f5c8f232391112b
	.xword	0x864a9b3f6398455f
	.xword	0xb6f22d153a728fa7
	.xword	0x85feaa791b140bf8
	.xword	0x51a3bd0e1988bc91
	.xword	0xc894785b7db92c94
	.xword	0xf8eab2dc4cf76093
	.xword	0xef4fa981d36f257a
	.xword	0x42d363af87c54146
	.xword	0xd1359c2134768709
	.xword	0x693f0f6cd584d380
	.xword	0x40107b28ff28f3a8
	.xword	0xe13bd19df1019909
	.xword	0x83aec34108dfdab5
	.xword	0x27bc8321285479a0
	.xword	0x90b1edb61c2f7b45
	.xword	0xdef51e7bc161babf
	.xword	0x35a39f0aa7cb2f5f
	.xword	0xc3277b7d61f9ad61
	.xword	0x9ace3b062256f165
	.xword	0xd585778bfe47cecc
	.xword	0x4ae4f6ecd8b43c68
	.xword	0x856a48cae1f3ad11
	.xword	0xcd288982d0841e36
	.xword	0x9786cfd6b3de258b
	.xword	0x6ca4a2754e67330c
	.xword	0x13ae465f435a534c
	.xword	0xd7427ef648e39b79
	.xword	0x38e344d32ea16053
	.xword	0xead80452bef20966
	.xword	0x71ac87f78d3ea438
	.xword	0x2221851a40963a32
	.xword	0xfaa16d3b37bef2dc
	.xword	0x1612141415d50315
	.xword	0x2ab992c1050839bd
	.xword	0x6a7d3621f7d0deb6
	.xword	0xf8815be071eeb598
	.xword	0xe0daebdde69b2fdf
	.xword	0x869de2800cc10201
	.xword	0x27aab67bfcc92afc
	.xword	0xd3adfeb7f9f3867d
	.xword	0xd8536fed1d694876
	.xword	0x8af661cebfd68aa1
	.xword	0x9757435ceec19a24
	.xword	0x5206afbad975703b
	.xword	0x87fe7a8096f027c6
	.xword	0xb9259563c9b8e325
	.xword	0x642de8e7b11def88
	.xword	0x5c0e999176852d8b
	.xword	0x1def44aca7b1a434
	.xword	0x22dbbacf3e348f12



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
	.xword	0x6fe793534de692c0
	.xword	0xc139867971096a65
	.xword	0xd65c404bfa3f664f
	.xword	0xb3dccc68d2aba93a
	.xword	0xb518d04c1ba5c5bd
	.xword	0x39333330edcba510
	.xword	0xd8eac1952eb4e411
	.xword	0x86855e8ffac2c90b
	.xword	0x57785206262a4e0c
	.xword	0x53055533ac34ea87
	.xword	0x8b310c3610f4e2b0
	.xword	0x6241760ce9197ac6
	.xword	0x9a7e1ac295e356b3
	.xword	0x71ef2aa399642a0f
	.xword	0xe525f149768a4f78
	.xword	0x501cef2b6fecc1ca
	.xword	0x16e15f2a718e1e53
	.xword	0xb2043210742ce455
	.xword	0xb1b11841ecb21489
	.xword	0xaa7d33af7d7211f6
	.xword	0x27be3b7848bfbc60
	.xword	0xd67b8006a6fa279a
	.xword	0x84927276aaf9dd7c
	.xword	0xd77289f703df334f
	.xword	0x6c27223615245a8c
	.xword	0x83229144f4754c4e
	.xword	0x56f38d73ac6b275d
	.xword	0x88befd8ffdf56ff8
	.xword	0x59bfff8063d2f7ce
	.xword	0x54c6f8c970d0ba76
	.xword	0x071146b66a6fecc4
	.xword	0x4c255cddfe5b5eb7
	.xword	0x88bb854cd1892c99
	.xword	0x52f818c73f6d3ace
	.xword	0xc2774400233cfd60
	.xword	0xd64866df63d97415
	.xword	0x6e808206d4b6d7dc
	.xword	0x95b44ce2e2a182c0
	.xword	0xe35bcf33b7d051dd
	.xword	0xff146585d0c5b4e3
	.xword	0x1f0e141d4b52f3b5
	.xword	0x4909af3a9fa0ceb3
	.xword	0x6673dee4f7f1751f
	.xword	0x3d38be331c709d68
	.xword	0x0f7183eceea50644
	.xword	0xd9b64ec1156f5fdb
	.xword	0x0618b2645a68b40e
	.xword	0x8c7280bb702d4da3
	.xword	0x85c7d73adbc78893
	.xword	0xa4aa8829ac8865dd
	.xword	0xb0bb2986c6f177c4
	.xword	0xb9312273db5ea978
	.xword	0xcf6f602a4f474826
	.xword	0xd25ba6674b3ec7d7
	.xword	0x5b2c09d92f4329b8
	.xword	0x8538d5d8c6369115
	.xword	0x44b89825a7c47994
	.xword	0xcf3921ba607afb73
	.xword	0xdcd3e4b69aea89cb
	.xword	0x2d9c7046f9da95db
	.xword	0x54bf678435497d25
	.xword	0xd5d5214427d3860c
	.xword	0x8c1710df4a3d5654
	.xword	0xc2089b2df7e05e38
	.xword	0x24b074777f9458f3
	.xword	0x5f5acae89d4412bd
	.xword	0x022850059565b78d
	.xword	0xc275a014781e6869
	.xword	0xce4dccea9904d9c7
	.xword	0xaf83376c2868fc2b
	.xword	0x5d3394b4d5df3148
	.xword	0xbe8911f32358e7c0
	.xword	0x029ae647e4f8382c
	.xword	0x2fd275fdcd5051b9
	.xword	0x717f07623839406b
	.xword	0x549f47c5a05e3304
	.xword	0x8d2fa31f4dcf15b6
	.xword	0x3f712da583314233
	.xword	0xc9390fb5334e385e
	.xword	0xd5acf445c5cd6047
	.xword	0x9d47cf44cda41a20
	.xword	0xe0f739aa13de77f2
	.xword	0x52b248cb1508f2d1
	.xword	0xfa86fa81f6460174
	.xword	0x6ccef09c2f96a23e
	.xword	0x4c765965b45a4c1a
	.xword	0xfc52cea4d911ad74
	.xword	0x279036bdb4a144d1
	.xword	0xbb6d31cb7872322b
	.xword	0xe8f26490827a354d
	.xword	0xcc74e889407d2179
	.xword	0x6efdd9dbc0906124
	.xword	0xed1cc010bbc2e335
	.xword	0x95dfa974e6448d7e
	.xword	0xed0facd240efd736
	.xword	0xed099d4996bae916
	.xword	0x0df3e9941cb5d659
	.xword	0x2baea29f3bf4747d
	.xword	0xeea257358f952577
	.xword	0x73ffd03f0ed476be
	.xword	0xc9f82919224890ac
	.xword	0x3e6906ccfc1bcad5
	.xword	0x0d2b0f02d667386a
	.xword	0x5a7d58ecddef2be6
	.xword	0x693d5356e2b8a978
	.xword	0xd866b18cfb078324
	.xword	0xbbee3f3b70d3c7d2
	.xword	0xcc1c8e29b4193d33
	.xword	0x8db9afb1d66ecdd0
	.xword	0x09b45185a33ad298
	.xword	0xc88416ffb0f7faa4
	.xword	0xc4b277bcf505ffb4
	.xword	0x86d1c8217f9d62ce
	.xword	0x75d732dbe3a61986
	.xword	0x4fad6247d7e57587
	.xword	0x6baed7da49704c93
	.xword	0x2c5957ec94617c07
	.xword	0x21b40c204e4f7be2
	.xword	0x46b3187b5d84263f
	.xword	0x482e5826d0f4a251
	.xword	0x92a62b2c21bbcaf3
	.xword	0x1c32d7ef37348286
	.xword	0xcfba6ec7aefe0392
	.xword	0xed7ede71fdd1fc32
	.xword	0x2a24d73ec7b7522b
	.xword	0x651911b2cf5e7e95
	.xword	0xcf3e6d6d2cfb7532
	.xword	0x2f280f674c9b088e
	.xword	0x386fa76ffbca3e63
	.xword	0xf8570d9ca7438ace
	.xword	0x7238e40296cca497
	.xword	0x2259c645b5011fea
	.xword	0x21776cbf6589e110
	.xword	0x840763d0ed0028b1
	.xword	0xa8e7475aa3a52973
	.xword	0x7d4d465d23255425
	.xword	0x13f767dd325b4102
	.xword	0xeef258489cf5357a
	.xword	0x5886d0c02fb826bd
	.xword	0xf8c652ed6c2f837f
	.xword	0x293d315c5fe8b78e
	.xword	0x8715a8169ad97714
	.xword	0xebcb135ab96f752e
	.xword	0x44abe9c1bb599082
	.xword	0x011d57ff87a208a9
	.xword	0x4390cda33e3d1048
	.xword	0x69430091d790a449
	.xword	0x75582ee7050a70be
	.xword	0xff0a55cd67630d7c
	.xword	0x8d6b01609b874c1d
	.xword	0xcc3a1e0471ae5c29
	.xword	0x4ba7d3f7f00e9809
	.xword	0x13851bd098470f69
	.xword	0x7c3e4193eb27ecb0
	.xword	0xfc69bee632a18905
	.xword	0xa1729de88a4faca8
	.xword	0xedd11affe1984774
	.xword	0x8d64404451e81453
	.xword	0x786f5329b8a27ea0
	.xword	0xfbd899ccd65eb20a
	.xword	0x534966f60612ccec
	.xword	0xddd541fd9f4fdba5
	.xword	0x3da7431247744967
	.xword	0xdefea5a1885a2f3b
	.xword	0x199b0f16e65b68a8
	.xword	0x17e4014977d6f409
	.xword	0x502479132a9299a3
	.xword	0x007d388617f0f6d0
	.xword	0xfd95dc6d77ce51d5
	.xword	0xc4ea102e8d2b4944
	.xword	0xd0b47b63a3f3dcb8
	.xword	0x0b37d4723513058e
	.xword	0x4a4ca65d09a85896
	.xword	0x368a59638827ea9c
	.xword	0x28f89fe7894b4bdd
	.xword	0x4a867f36aa30ca3e
	.xword	0xf307fd03e6d587a8
	.xword	0x9fd4690bfda8683b
	.xword	0xb21a939bac5a6dbc
	.xword	0x394130c939ca8239
	.xword	0xc27582bf2d764104
	.xword	0x45ed9857fbf118ac
	.xword	0x7f707c0fca8ecdaf
	.xword	0x934b90701bb98afc
	.xword	0xb82a1f180bab4b94
	.xword	0xb1bf3f7edfa206ef
	.xword	0x8c4bcf29e8f6b4b1
	.xword	0x6cbb0bdde18a8015
	.xword	0xe071a441dee1a784
	.xword	0xee4b3d0acb89de36
	.xword	0x095c23b6220a696c
	.xword	0x4aca351cf2f8a8f4
	.xword	0x30b8868a26dd58e2
	.xword	0x7ed8a17f38e83c54
	.xword	0xa23f9e35cdcb0227
	.xword	0x64b1be4d510d99c2
	.xword	0xa3959c4e40529fc8
	.xword	0x042302264999b51f
	.xword	0x7f877b839680c3fd
	.xword	0xcd3fe5b097d9ef71
	.xword	0xcb50498d9984e994
	.xword	0x5805b19f9907bf04
	.xword	0x4a55132c3f45afd5
	.xword	0xdcc833f11275aeaf
	.xword	0x07453b10c7458186
	.xword	0xfea68f91dd8f4277
	.xword	0x1c84e0344b64fd37
	.xword	0x6641ac60c00544a1
	.xword	0x748d0b4857e353d4
	.xword	0xc3ab6ae81c96a8c9
	.xword	0x01662f462a868f3a
	.xword	0x264e030d1ab99d25
	.xword	0x2c9a46a61a57adfc
	.xword	0x43ae22d13c57f467
	.xword	0x3778a77cd31e13df
	.xword	0x37e3de38df0b9feb
	.xword	0x365903c20736d1ca
	.xword	0x520f36caa356e87f
	.xword	0xf6a69d8769d848f8
	.xword	0xeba7c609116d5aa0
	.xword	0xaf5658dd813bdc04
	.xword	0x0aa8aaf185bd92f6
	.xword	0x3336805f9bf36107
	.xword	0xa1e53aaf0b467cbf
	.xword	0x0bfda310cce27af2
	.xword	0xabc545a771b1dce4
	.xword	0x576a1b3ac4b34967
	.xword	0xf11037b4c55dd626
	.xword	0x72acb12d770190e5
	.xword	0x98c8aa7f16653fb1
	.xword	0xffb711e8978f2845
	.xword	0x2f8f6931c3ddbd38
	.xword	0xcf7590ba2bd8a7a2
	.xword	0xbc2617f2dd3903b8
	.xword	0x428bc7aeca7be7ac
	.xword	0x10d0a8e48044cd38
	.xword	0xd55241d89538c96d
	.xword	0x8fdf234e832d33f1
	.xword	0xde5f7c6678d838fd
	.xword	0x76f6ebc07cf62d0f
	.xword	0x72694bb2cff881ad
	.xword	0xb4590071fad1d77e
	.xword	0x65624e6494c76e7c
	.xword	0xe770493e4fe33988
	.xword	0x0c9b10b9d6272ca3
	.xword	0xc00aa57b4242798f
	.xword	0x6bc68ced07b514ed
	.xword	0x7ce6ddac2899feb3
	.xword	0xf83f9fe13e8ce29f
	.xword	0x8ddf5aa88c80b26d
	.xword	0x53a5beb2e24cb2d6
	.xword	0x6495e543609652b8
	.xword	0x198778094c40367c
	.xword	0x483abb2b348220ad
	.xword	0x2154fcd90abcd1db
	.xword	0x041ed44f6c1070f0



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
	.xword	0xbf37e7f474fba28d
	.xword	0x798ed61c2414fbba
	.xword	0x72008ed58dbd65f6
	.xword	0x376b63ba0bf57ffe
	.xword	0xd70620be0ea11f26
	.xword	0xaf01e78f6a9350a6
	.xword	0x75407662edb24095
	.xword	0xfaadcce4e113ec32
	.xword	0x5fb1550890601c2b
	.xword	0x7a35742fa1ff336a
	.xword	0x4886cd5ae28eca48
	.xword	0x8a7ecbe92074c81e
	.xword	0xcbbc159c54fc7da6
	.xword	0x2c5745d1f8074af2
	.xword	0x8267a347b15d5ac1
	.xword	0x2314bae1ca8d46ea
	.xword	0x76e9d4c7ddc6f36d
	.xword	0x5f57bd1ddecf85f2
	.xword	0xf8650e2a4d91c008
	.xword	0x03039b0e3d87d224
	.xword	0x4b582b4d21bd7f84
	.xword	0xf8e27fba10493898
	.xword	0x589f90dd6219d840
	.xword	0xbb91dee8696020c3
	.xword	0xe00c010fb79abd26
	.xword	0x0364b332044cdb54
	.xword	0x1b630d1f6fc72e3d
	.xword	0x4b166a4eb4738b65
	.xword	0x9646a4e74536245a
	.xword	0x8552a9f349e8ecaf
	.xword	0xa6adf36d3ddb2950
	.xword	0x31a032fe5fa92837
	.xword	0xf2d8a39ee8f34414
	.xword	0x9606abad876e89b4
	.xword	0x1faee92dd7744c2c
	.xword	0x67e4b80530a2286b
	.xword	0x152227a4575648d7
	.xword	0x493e1d927baf65f1
	.xword	0xf5bdc0268518363c
	.xword	0x05408dd213e18cb5
	.xword	0x984a21f10083e871
	.xword	0xe3539ea5e67591fb
	.xword	0xe7eb293a3f3f2869
	.xword	0xe75958cf8a0ebb09
	.xword	0xae03655b53f0da42
	.xword	0x76c4111528ae19c6
	.xword	0xdec41aa53851357f
	.xword	0xc5582fc4ce460334
	.xword	0x23f33460d9b412bd
	.xword	0x1f05629033b461c3
	.xword	0x49436a9c002c7eb9
	.xword	0x05531fbbf4828b1d
	.xword	0x8358bfacce0a01ac
	.xword	0xd517d99e48baa4cc
	.xword	0xa9d91f43f9f1b330
	.xword	0x57acc52339150526
	.xword	0x2362fc6d5f4130a5
	.xword	0xcff22ea2ccefb69f
	.xword	0x9d16c19ac40a648b
	.xword	0x014e83ef6ccf1bea
	.xword	0x216b61e86603c68b
	.xword	0xc18c7039a70b7249
	.xword	0x3ed505fee458e154
	.xword	0x799f1f1bfa655bca
	.xword	0x2c85e3b8a5d071ca
	.xword	0xb84a72b8bbd376fd
	.xword	0x5053e3d8e8317439
	.xword	0x547589d9eac60879
	.xword	0x096ad23ddcd8a2c1
	.xword	0x625efee9f5225a32
	.xword	0x6e1065fda1a4b829
	.xword	0x5e2c74c7e786a5ce
	.xword	0x5991d8b0fe7e0fe9
	.xword	0xd3db03197ba4f2f9
	.xword	0x60c09414ea006e98
	.xword	0x23d00060afc6b33e
	.xword	0x6e4b9a4096eb63bb
	.xword	0x4ce9ae63804e201c
	.xword	0x8e30aa77780e824e
	.xword	0x2659f79d80cb6c87
	.xword	0xd0afbe8d3e3364fe
	.xword	0x730d9b140c01a3ae
	.xword	0x84a8afbff62f6665
	.xword	0xb7ccae7108d1bdf7
	.xword	0x0bc1723e3c94a6eb
	.xword	0x73150f0a4a00ccb1
	.xword	0x19db472aa3334cf9
	.xword	0xfb0e8c4295630f11
	.xword	0xb1dffe00797f95bc
	.xword	0xd45c44f61908202c
	.xword	0x3891f380a6ea4fa1
	.xword	0xe86bd6afc13f668e
	.xword	0x1415636dc0575f0f
	.xword	0xc728f0c9623d0f77
	.xword	0xa858158311b06ffe
	.xword	0x52a5c3cf3ebbadba
	.xword	0xabcea83d8325c28b
	.xword	0xd11956bbf086e239
	.xword	0x3be2b755ba3077e7
	.xword	0x6e7a26b0b714976c
	.xword	0x8bee4c4edf9d9eab
	.xword	0x5c99e3b6e7aa24df
	.xword	0x403db362f903efb1
	.xword	0x072d92e30e8efcc6
	.xword	0xed45a0a9533e1553
	.xword	0x9977cf009fe0d580
	.xword	0x5506cce910cc574a
	.xword	0x6580fa322233e904
	.xword	0xc3519a8a2df5de06
	.xword	0x2c1c880cffa44076
	.xword	0x845065aab1568fc1
	.xword	0xe1d473b162fae9d1
	.xword	0x723a47b4091f4cfb
	.xword	0x85a615f3357131c0
	.xword	0x045179976451f8f6
	.xword	0xd7c76d2a32b0cb8f
	.xword	0x1ad963e98285733b
	.xword	0x9b8e4b8f1d83d213
	.xword	0x696148269055f3bd
	.xword	0x8e103f941088bbce
	.xword	0xd9c5387d15ce5da4
	.xword	0x83386a75bf3ee24a
	.xword	0x97c0aee608593aeb
	.xword	0xce816d5c277ba5c7
	.xword	0x007e20107d62e9e0
	.xword	0xa0357c4204d1f276
	.xword	0xc6f3abe50c6be625
	.xword	0x72afb49f2ddce6b0
	.xword	0x9074768adca8bc04
	.xword	0x4027c9d9f37c742f
	.xword	0x36d7fa5027533300
	.xword	0x4f313058ea00febc
	.xword	0xe9d17951158325b3
	.xword	0x96ba08b911cdda0e
	.xword	0xdea48dd50e7a3b37
	.xword	0x5758bff5b1b45631
	.xword	0xa96e17b11db603cf
	.xword	0x28856239d108bb5f
	.xword	0xbcea390f7f499b40
	.xword	0xc8821a7fd219c777
	.xword	0x95baa9b293b4a82d
	.xword	0x4d7c40602a380399
	.xword	0xb1dce17ff795988c
	.xword	0x87aea269bfaf204d
	.xword	0xb3aadbb0dccc9b1a
	.xword	0x7df2e9993b9b964a
	.xword	0xf9460c950a0b0c4c
	.xword	0xa3c5e1015879e233
	.xword	0xe10e2a45be12a2cb
	.xword	0x312a5f33cefa2a9b
	.xword	0x9dd0335593aae45b
	.xword	0x3736ada2df99c0d4
	.xword	0xf45bca02918abf7b
	.xword	0x2bcc6f2494260107
	.xword	0x0c2c80736da965ce
	.xword	0xacaded09a7730ebd
	.xword	0x41cfcd64a2cc6fb9
	.xword	0x71ced8b086fd6119
	.xword	0x03fbdfe7321f7399
	.xword	0x51f5aef915ba7456
	.xword	0xb48714e020398127
	.xword	0x4bee5db63765a5ff
	.xword	0x2827a6a74a9b3f39
	.xword	0x5f9e13674fb50203
	.xword	0xb9173fdebd450804
	.xword	0x6fee3cc142ad6a9e
	.xword	0x129e5c2a3d320b1e
	.xword	0xff100cc4ac40a702
	.xword	0xbc312469fdd44a74
	.xword	0x0864ac877612adb3
	.xword	0xab0ab0c96db69179
	.xword	0xf0870fecbe5fb0c0
	.xword	0x86e15edb62f55102
	.xword	0x9095b81dbba7b994
	.xword	0x1e46ff386c56949b
	.xword	0xc57ad851d432720a
	.xword	0x6feda4e3c18560b6
	.xword	0xdc00b71958ca55d3
	.xword	0x816b292b71c8904a
	.xword	0xacbf3fe9f1d2abeb
	.xword	0x457de8e71d5a74b5
	.xword	0xbd83dcec2231db83
	.xword	0x1572a10dcd764a8d
	.xword	0x3e8f8d7a0b4be1ba
	.xword	0x9573c4dbdd5699ee
	.xword	0xe15a95531fd49611
	.xword	0x9a0b4d2f7f77e57d
	.xword	0x68483e8d0be82fdc
	.xword	0x6d1ab988211615c6
	.xword	0xded5e65bb24f4565
	.xword	0x079b6b6977d81d0d
	.xword	0x2fbd24e85c5c0f3c
	.xword	0x28edc0f5505a9fc9
	.xword	0x59647b45cf881a1e
	.xword	0x50a6d585551a3e63
	.xword	0x499e45b06591f354
	.xword	0x7403f5845466a6a8
	.xword	0x083823f48def910d
	.xword	0xdcf12dec5d60236f
	.xword	0x68fc5f4d6ba00fca
	.xword	0x84baccfaf4b30c5f
	.xword	0x74fd76255149c51b
	.xword	0x5ddf7d991a067501
	.xword	0x13170db0a8a60a84
	.xword	0xe17f076607039148
	.xword	0x7da6ed0920f17136
	.xword	0x1992c919589050c6
	.xword	0xae2a1110a4f5094f
	.xword	0x6df49169bdc24264
	.xword	0xc22c2d080adf23c8
	.xword	0x5713570f1e4069c4
	.xword	0xe0d449f29823abdd
	.xword	0x54aa1c48b2d501fe
	.xword	0xd1806e146fda9886
	.xword	0x0af36790b87cde53
	.xword	0xd13268c1df2d15f2
	.xword	0x27d5937424e87133
	.xword	0xba07575b2979c3e6
	.xword	0x32f5e4e3cc5f7154
	.xword	0xbe904bab1a5936ee
	.xword	0x77e4f6a5c2917cc0
	.xword	0x41fa3ffeec2d3450
	.xword	0x9e8512a628f468bb
	.xword	0x8048f556f27ccca2
	.xword	0x445b61e7eefb119e
	.xword	0x10cf2dc593cb87cb
	.xword	0x5483025dc3e88928
	.xword	0x1f9ef2cfc6daaad7
	.xword	0xa31782661dfca347
	.xword	0xa0197088da4afea9
	.xword	0x12e78cfac046a448
	.xword	0xeb02b03d0915bdc9
	.xword	0x373ea18f2fecc042
	.xword	0x39695d03a1dc65f1
	.xword	0x4245f456a6c189c2
	.xword	0xe8520d062cbb67ab
	.xword	0xf494c1000bc33971
	.xword	0x28e00e3c8dc8661e
	.xword	0x1368c38d213b4575
	.xword	0xca05b46c63415ccb
	.xword	0x7a70339b9d4b2cf2
	.xword	0xa2d789961b581b8b
	.xword	0xddd77c48a7e1bdca
	.xword	0xc1cc1d0db1113de7
	.xword	0x0febd5ce0315f0d4
	.xword	0xc0af316b827c2d8c
	.xword	0x92f936c5e70cbcc8
	.xword	0xe1483473c52baed4
	.xword	0x410fc0348c7e48f7
	.xword	0xe8036eafe544827f
	.xword	0x02b45ba9ada1404b
	.xword	0xc9e5117729f360f6
	.xword	0x278df2f7dd31298f
	.xword	0x12240a6bcbd9e36d
	.xword	0x83a832806c3a651b
	.xword	0x9b8a5ec02ad4fd28



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
	.xword	0xb52d02d9e77faec0
	.xword	0x3ce84cf596b63233
	.xword	0xb3e0eec4a546f748
	.xword	0x585b57ce85638549
	.xword	0xc0466e8eea30d389
	.xword	0xeeb5155f0824ef95
	.xword	0xa48d10e8908db84e
	.xword	0x26d3c966a8f1de93
	.xword	0x4b548320931f72a9
	.xword	0x8b54ffafe31a05b0
	.xword	0x2da3393c93e17687
	.xword	0x2da9458712bab2cb
	.xword	0xa800b7a8b992ec42
	.xword	0xbc834331dec3c7a0
	.xword	0x1e6c69a81de34f8e
	.xword	0x74aaecf8e92d3c95
	.xword	0xc597db7e15b41924
	.xword	0xfe9d1d051a113a28
	.xword	0x15a21712229a85f0
	.xword	0xa9569392a6528e4c
	.xword	0xf07f9e32a9a0da34
	.xword	0x1f2ec0504d747df1
	.xword	0x1e5e0b80a3659869
	.xword	0xdaf9b5fcce61ef91
	.xword	0x03217ac3479c5189
	.xword	0x1e0a82da67a29c12
	.xword	0x5271763e63548c20
	.xword	0x0201fe2990ee6ff4
	.xword	0xd598a90659c2872f
	.xword	0x786eb04119ad12e2
	.xword	0xb8bcc82d92ed37d9
	.xword	0x4c9984b267c46911
	.xword	0xb251e0fa8bc059c4
	.xword	0x4128bd56569c5733
	.xword	0xb6d39e8d24f7d02b
	.xword	0x408efd0bcad36420
	.xword	0x8271eb11f7411b2d
	.xword	0xfa41896ed2f7a631
	.xword	0xb15c0558d530d148
	.xword	0xda195269a508df98
	.xword	0xb65f169d8fd556ec
	.xword	0xc015fd15d40edebe
	.xword	0x7812c0841ccac871
	.xword	0x3e2a758783bc6b20
	.xword	0x08934bc7c32d718e
	.xword	0x0aeb93b204b3c893
	.xword	0x9a6ccfd2e2cc920d
	.xword	0xbfd9dfab003a614d
	.xword	0x59e8814179d8ea79
	.xword	0x2437d97324f28b6e
	.xword	0x7e99321c9c0a7453
	.xword	0x1751bc4f4f5814b5
	.xword	0x18c9f7abc82a5ea5
	.xword	0xe67d31a79a0c834b
	.xword	0x42121ecf676f4e1e
	.xword	0x149c8220b2d26558
	.xword	0x89ed9c56790704a5
	.xword	0xd13641b62814e980
	.xword	0xe1bbe57041b470bf
	.xword	0xdd98e68cdb4f0a77
	.xword	0x3ac6ba34a3be1ae2
	.xword	0x664f08f244d39127
	.xword	0x4561691c1a3cc1cf
	.xword	0x247f5733188343da
	.xword	0xdc488c5c8cee6aee
	.xword	0x1941bc5a09a024cd
	.xword	0x13f6f179baba164b
	.xword	0x7c0265bec4d27b8d
	.xword	0xca12b76696cba16c
	.xword	0x517e8b5d0da4ff0d
	.xword	0xc91a99c81f5e6af2
	.xword	0xdb9d689735d8adc6
	.xword	0x6b3a5a64e1ab6a86
	.xword	0xb5eab6655d006e6d
	.xword	0xa18ffc907ab8fef8
	.xword	0x0f2cd602dd9a37c3
	.xword	0xd97407ef41056caa
	.xword	0xb936bafd6ff5e32a
	.xword	0xa111d7b34aa02cb8
	.xword	0xd6a1674d9e23a62a
	.xword	0xd930676e65d6cbb8
	.xword	0x400ccc5b5d1900f1
	.xword	0xa01d6b71400336ec
	.xword	0x11f8ff922e1cb993
	.xword	0x0f9d247589744152
	.xword	0x4281d3950330ad4d
	.xword	0xabd617be96a1ec44
	.xword	0x2fa525e4c1ca38e2
	.xword	0xc161aea6c50d3169
	.xword	0xc27ac5fb57fdefa1
	.xword	0xd71d388c31a9b50f
	.xword	0xe845c58a9f5d8bc8
	.xword	0x0deaef7b21cff248
	.xword	0x96c536f9e06fa812
	.xword	0x4e393109c1877738
	.xword	0x538d0d6bc4e33d09
	.xword	0x3e006d486225af17
	.xword	0x82c613e70f9025c7
	.xword	0x2765a2139ad081e3
	.xword	0x165022905c83e502
	.xword	0x3058cccf9f193a24
	.xword	0xda6fc7829ea09510
	.xword	0x0bdae16e2231355e
	.xword	0xd45f38bfee750c4b
	.xword	0xaf727bb7387f3490
	.xword	0x6246d2e7629151cd
	.xword	0x967731a1ec823441
	.xword	0xa73b890ac05d49f5
	.xword	0x10a5463889d92782
	.xword	0x99031fad4c2bd97e
	.xword	0x1b9cf6cf1253fd7a
	.xword	0x10a4d7c02c2fdc58
	.xword	0x30e4be2157d249ca
	.xword	0xcec94270a367fd54
	.xword	0xd46088e31ba2a52b
	.xword	0x68f37ee78d91af04
	.xword	0xf7bd44aa172b6eae
	.xword	0x9ebc8ae429496936
	.xword	0xc45160a66d1cf911
	.xword	0x9bb3438ec49fad0b
	.xword	0x7fc285756c21117d
	.xword	0xdd3b8f8386b6561a
	.xword	0xb85c339602bc754c
	.xword	0xd1f38a9cb4c4fa7e
	.xword	0x197d2f95386418e9
	.xword	0x0950b6ece36a7203
	.xword	0x2a2da0b5d4261361
	.xword	0x4c1be46ab76f2383
	.xword	0x5bcc73eb96b2b8dc
	.xword	0x7556ce8339a988ce
	.xword	0x1d4f42a8671e9198
	.xword	0x0e3d4d5988e7a25e
	.xword	0x5ac308821b7ef8a0
	.xword	0x075656d2c5d9d6fe
	.xword	0xe9292e6456df9988
	.xword	0x2a60f7230d002164
	.xword	0x355127a4a4938045
	.xword	0x40c14746a55033a5
	.xword	0x49b294002eae2f78
	.xword	0x3162f5b06a61666c
	.xword	0x3855d6f8b76d5eb6
	.xword	0x9559bf9eaf359858
	.xword	0x63e34b9c4bcda8eb
	.xword	0x29aa1b0b9e5f674d
	.xword	0xaed787b3d7014ec1
	.xword	0x4273839585a02d31
	.xword	0x6e53a84fd7c78cde
	.xword	0xd260a5f0d8be169c
	.xword	0xaf53201ec3b5059e
	.xword	0xc81d78f0183687af
	.xword	0x256656204fe1230a
	.xword	0x698a4e9f893e1da4
	.xword	0xb7ab415f9bf207d2
	.xword	0x02f81a480c4a7f9b
	.xword	0x8d4a1b368d8ba0c8
	.xword	0x94e54c0e681af60f
	.xword	0x68c1c5d0c05c1512
	.xword	0x84bb8f498dc83083
	.xword	0xfdee3c6c162b79b8
	.xword	0x11a17aaff19a5741
	.xword	0x9e7e15a1924e85dc
	.xword	0x5fc5ad11f84685fa
	.xword	0x57a7678d431ebca2
	.xword	0x2422b8e7e43610c8
	.xword	0xfc7458d3222eab9b
	.xword	0x1d44d7d31e50ad6d
	.xword	0x48b7b2abccc9e64d
	.xword	0xf126922cfff4bd70
	.xword	0x018cb907311c02df
	.xword	0x0000550fb093459a
	.xword	0xfcf1c878fd806995
	.xword	0x0b4481eb586479b2
	.xword	0x70cf1f02afa43743
	.xword	0x6774df64c15f643a
	.xword	0x3f3f99684b396f5a
	.xword	0xb7b079995aeeada9
	.xword	0xfebbbba13ce22c85
	.xword	0x5b6be2c749874166
	.xword	0x9fb21a9e1e7c4cc7
	.xword	0xb2f9c849b3198b4f
	.xword	0xa32e09db409ab793
	.xword	0xde534ade6bae4625
	.xword	0x181b00bbf74959b6
	.xword	0xe396b26491aec442
	.xword	0xa9607e570f3734b1
	.xword	0x95f075e41073b888
	.xword	0x48cf0b87e06fc816
	.xword	0x2d306da1330cb305
	.xword	0x9a8bc451ba2665af
	.xword	0xdc0eb4c076bf8804
	.xword	0x9be7477a2bfae754
	.xword	0x20eb48d859d07d47
	.xword	0x3761b4d92d33937a
	.xword	0x50ff9959488c9d2e
	.xword	0x250f4eb57fe45335
	.xword	0x2e3411084471bd85
	.xword	0xd155a8fb86483161
	.xword	0x70c616367005096e
	.xword	0x930a8b23d0c6837b
	.xword	0xd3467928fd671f50
	.xword	0xe2350bd873f317c3
	.xword	0x6119560585e53a0c
	.xword	0x2ac5bd9e3e1f7345
	.xword	0x81ab6ee9a8fa401c
	.xword	0x80564ae2ac0ccc93
	.xword	0xbf1462271d6ecada
	.xword	0x7a46eb1dd204042d
	.xword	0x3df33c6e5fadff59
	.xword	0xe32954e828fdc8b0
	.xword	0xfa795b92e7fcec67
	.xword	0x00b7edd7ccc37298
	.xword	0xbd757c4f8dce1c62
	.xword	0x8661c59d1a4d6f8d
	.xword	0xcd55a949f042752b
	.xword	0x93958959661d134e
	.xword	0xdaf2f48d6d633120
	.xword	0xbffb9a3848f5a03b
	.xword	0x3be06b22bc5b5925
	.xword	0xcfbd06cf94b90eef
	.xword	0xfc99eb063d78d3ed
	.xword	0xf6951d9804d9358e
	.xword	0xfd030d403074763a
	.xword	0x8eb81c145fd879ec
	.xword	0xe682c73f8dba4da0
	.xword	0xfe9f15fba5f64d69
	.xword	0x9c1e086a0ec1fa9b
	.xword	0x38d0e525921b74ad
	.xword	0x5d1a9874cb58e46e
	.xword	0x2c91f9d9cf98d450
	.xword	0x9f6b09b974edda1d
	.xword	0xad63b3b7603fb292
	.xword	0x9f08551b9b19e731
	.xword	0x72365635817c57ba
	.xword	0x2704e63288478109
	.xword	0xc14a302fdbbc8751
	.xword	0x3b1b2c30ae2b7b1f
	.xword	0x37e85f2bc956d6c0
	.xword	0xd753efe0c4bcf5e9
	.xword	0x0e811cc482a7d77f
	.xword	0xe54bab65e3868abc
	.xword	0xf617d0f950b4900f
	.xword	0x3135fb0d02d5a3f9
	.xword	0x68597e18c193f104
	.xword	0x9c45efc8c417c55c
	.xword	0xc21a9cf93600024c
	.xword	0xcef70f3f3ce56824
	.xword	0x96738ec479fb806c
	.xword	0xd0dd5011992466e8
	.xword	0x4f892c0c0bc6449c
	.xword	0x69f0fdce8e904994
	.xword	0xfa87a21b1a66a176
	.xword	0x3a07b7ba1c0092df
	.xword	0x62f592a014d1a0c9
	.xword	0x0066c5e811163176
	.xword	0x2030098942d4b044
	.xword	0xaa30d916366b8ea4



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
	.xword	0x88e39f7827631213
	.xword	0x5bde5d18e8f8be94
	.xword	0x5ffa6295e19b55dd
	.xword	0x9469d22b0e893133
	.xword	0xc000011cdac0d187
	.xword	0xfadfa74949c1d10f
	.xword	0x90649f28cb4bf7ed
	.xword	0xc8f1dd2e17db29b3
	.xword	0x1d23e43dd4320cd3
	.xword	0x159f2b114474ca8d
	.xword	0x7b6fd4e772c66b6d
	.xword	0xeafd638d2c08622c
	.xword	0x3c273067c8ad7a6b
	.xword	0x5c8089b93a4f5230
	.xword	0xee0e7e31564060fc
	.xword	0x8bddd7cf54b7bdce
	.xword	0xea54c99c3ba641db
	.xword	0x821de72185f8fec6
	.xword	0x1cb61a249fba11c6
	.xword	0x36cd532d8a4530e6
	.xword	0xc4e37ffaa08f92cf
	.xword	0xf92103c1d4d32689
	.xword	0xd88538b53fcb928c
	.xword	0x7debdb6b7700f6a4
	.xword	0xe200b0ffef19712e
	.xword	0x1911a59ca01d6ac4
	.xword	0x680bf4e882f18d1d
	.xword	0x51a2ae00177fd286
	.xword	0xc650af50f5e5a31d
	.xword	0xbc64a8446fab96f1
	.xword	0xcaaac45c91803d60
	.xword	0x15f8335a0c72cc7c
	.xword	0xd4bd2ed1b599e237
	.xword	0x14d7d4863ab872fa
	.xword	0x8d32d7a476614b6b
	.xword	0x366c9e71e63310c1
	.xword	0xe457e7ffd391f372
	.xword	0x5906da93c35e8f0e
	.xword	0xf7985eddb896eb24
	.xword	0x03646e5b5f10fec7
	.xword	0x46211d0f76b535cf
	.xword	0xbea6b1f6db01e23d
	.xword	0x25e37ef88664a4d7
	.xword	0xb4c8d9e042536417
	.xword	0xd1f523b88b80ac19
	.xword	0x3f183b2c5d92ae4c
	.xword	0xf390e21c27c74603
	.xword	0x6f7b187b120b4ad4
	.xword	0xc9cef1379a6f8069
	.xword	0x14bea39c2afb60f5
	.xword	0xc290beb0571c3da8
	.xword	0x34feb13c83c0ac21
	.xword	0xc89d65e1d1df2ea8
	.xword	0xb5b1ec15f9e157c4
	.xword	0x45a4eed8050973c1
	.xword	0x3c733664827b6c80
	.xword	0x4ac44cb543c8c62d
	.xword	0xd04e3ec737cc4324
	.xword	0xdc06fe65b1f109b4
	.xword	0xe9cab45f708fbed3
	.xword	0x37261d0ba2393299
	.xword	0xcf65684bf33e8355
	.xword	0x7566970b71abdf0d
	.xword	0x95994bf9196e2fd8
	.xword	0x0287babb46d3109d
	.xword	0xd87253fdbd005f98
	.xword	0xa5f84fd8d5bb1b64
	.xword	0x7e9a01159b6c0c5a
	.xword	0xa826aafbfc925b8a
	.xword	0xf21d5bc979c364a1
	.xword	0x96c0fbc77c4444b3
	.xword	0xb5f26e3ab0d03d91
	.xword	0x1c46f2c3dca16508
	.xword	0x1751ad2d75b4f933
	.xword	0x6d1409467f5a45ad
	.xword	0x8b2d7e1b813f8bff
	.xword	0x25560e0be4f130d4
	.xword	0x19744dbbfa5238d0
	.xword	0x8737555471a78bf3
	.xword	0x8b212e8a34802a51
	.xword	0xecd5638fff5a855c
	.xword	0x790cd76b60814426
	.xword	0x04fb83b72c48618c
	.xword	0x8fd2c57409de047e
	.xword	0x42076815e517e803
	.xword	0x2094e681b972ec27
	.xword	0x25cdf0b9305b84ef
	.xword	0xe93123cf415352d7
	.xword	0x73b158a253d0b385
	.xword	0x30c4118ea9ad0b11
	.xword	0x9990e6a088526c35
	.xword	0x48a2e72662204050
	.xword	0xdfbdd1a3f9f7e69c
	.xword	0xa3e04ede09311c82
	.xword	0xc626a6c24699aae0
	.xword	0x0bb0eaaf9c7d9dc0
	.xword	0x20fbc522b54a6a84
	.xword	0x7a9b08e4db2155ff
	.xword	0xe127325d79685fb5
	.xword	0x94603c7e04f7ba3c
	.xword	0x48520ce5928bc543
	.xword	0x7648398b0e0f7991
	.xword	0x80be908125fd7c13
	.xword	0x95b8d8f90323e5fa
	.xword	0x27f49d8028cd8bd8
	.xword	0xa4e465a3466835af
	.xword	0xbc8296deef231b21
	.xword	0x449d5691c8407b5d
	.xword	0x3b80e004f87679ed
	.xword	0x6f016b3700c9b417
	.xword	0x678b9b7c61e9a4c0
	.xword	0x5e6df902f5d0c075
	.xword	0xddc03a10a5109e34
	.xword	0xdca4d4cc93d6061f
	.xword	0x63830dd45dc61dc0
	.xword	0x55a9511c3e75450c
	.xword	0x32edbb22a6bf2a89
	.xword	0x705525cce9cc4d55
	.xword	0xd6334fa5d688e08f
	.xword	0xd98f0abcc88194f4
	.xword	0xcc33e210d38c102c
	.xword	0xf11325c8d512e578
	.xword	0xe35309883ee087cc
	.xword	0x1564b8353c6cba17
	.xword	0xc27ad8eaa4b76084
	.xword	0xdf6fdfb064083257
	.xword	0x1ac0db1de05134f1
	.xword	0x8a0aabb791f91708
	.xword	0x1eb12da7dc16eea1
	.xword	0xdf16cc0195853795
	.xword	0xfd808a258a102e8e
	.xword	0xd3ded5472a1c6ab9
	.xword	0x12928da6ee0e2198
	.xword	0x9ef58fa0b1f0d2be
	.xword	0xafe797170c16c54d
	.xword	0x5497fa9e0b952c13
	.xword	0x5b50a2b48a4bc1c1
	.xword	0xc2acdb2abd0b626e
	.xword	0x5388b9f48cd714b1
	.xword	0x12fa9e7399d8f259
	.xword	0x35bda928eb4b3cc2
	.xword	0x85185357abb3616f
	.xword	0xfe59b4f4f5c9e769
	.xword	0xb0cd51e7031227f8
	.xword	0x6097359517383152
	.xword	0xc6fc7959a07e9acd
	.xword	0xcc7531c02d5f1493
	.xword	0x39803570a254dc92
	.xword	0x1f96799a794b21a6
	.xword	0xb9398af337d6f0f6
	.xword	0xa33be426701ba741
	.xword	0x77780039c32139c2
	.xword	0x2eeb348afec2d73e
	.xword	0x9b7d55177fbee02a
	.xword	0x8c4b2e0256a3d023
	.xword	0x207c449199389896
	.xword	0xaf1528d9b05a02a8
	.xword	0x059f1e126f65e5d8
	.xword	0x8c930129f8ee5655
	.xword	0xe23a35789b4e1a64
	.xword	0x118d4d3ca182a5a8
	.xword	0x21febd3ade2ce4d4
	.xword	0x0f58eefb53ee124c
	.xword	0x670e1f76289e7a7e
	.xword	0x5e4862c607bcf104
	.xword	0x11ac546de75495a0
	.xword	0x4aa74cd7bce0037b
	.xword	0x825d728e1be808c8
	.xword	0x9e182eec67e91412
	.xword	0xd4529712cd99fe35
	.xword	0x273398a060604fc6
	.xword	0xa334aacace8c1f13
	.xword	0xb6ca2f9fd41186bd
	.xword	0x01370430ec2c3180
	.xword	0x22a61c410ea97cc6
	.xword	0x5fa73d3e4f20fbc6
	.xword	0xf4d4207cb29630d6
	.xword	0xd7daa042eb7bb974
	.xword	0xcbfb861a08a4c7b1
	.xword	0x23e3334af751d5a0
	.xword	0x810f08a85a8dde9e
	.xword	0xa5c81d49de2458ca
	.xword	0xbdd1f54d2589135b
	.xword	0x77d5a4766517e26a
	.xword	0x4b0ccb3e475d122e
	.xword	0x62b8ca8d47f30a31
	.xword	0x2cb9466be00876d7
	.xword	0xf29371407ac5e5ca
	.xword	0xbff8a8cd0a83ac17
	.xword	0x0954349b87965ebf
	.xword	0x5df96e6af0911b9b
	.xword	0x362d46a18f9a9916
	.xword	0xd5246e1f5a6ac2e7
	.xword	0xbe8e29753bfa035e
	.xword	0x80ac376a883674d7
	.xword	0x2141cc5a8fe47daa
	.xword	0xf7b4f3da5bae563d
	.xword	0xbc6d22797d9c3e55
	.xword	0x979ab7c7849c76d0
	.xword	0x70a27b41779e7a83
	.xword	0xb6dbdf7a7412bbce
	.xword	0xfc1f5b32da3b90ba
	.xword	0x0f7dc2d082bce7c7
	.xword	0x097e4979c9e55e7b
	.xword	0x56a5b90e1ccd1fc7
	.xword	0xbfcfcb3e79dcd79c
	.xword	0x79f49bd8cb32b6d1
	.xword	0x54ecf164969182bc
	.xword	0xce862df158ca2548
	.xword	0x8fe188981af92677
	.xword	0x5cd0a75c83928512
	.xword	0x7f2baaea7b10cbb4
	.xword	0x351a771ee1bbce27
	.xword	0xd3ea165128498c40
	.xword	0xfa7ee8a870b15ef4
	.xword	0xd62b9bd642f4db49
	.xword	0x6b69a93b62021ace
	.xword	0xfc0f66d4f10faf05
	.xword	0xcac9a42b26a9bad7
	.xword	0xd856b7062248f60d
	.xword	0xf5c5a12a892c7b37
	.xword	0x12a6eaa374b2ba79
	.xword	0xdaaa0ec1dcb3f52a
	.xword	0x6d46d18bff70500f
	.xword	0x195f3fa92d57021f
	.xword	0xc72be6ea12646e9c
	.xword	0x2eaefe5515cf46ec
	.xword	0x865c57a984b314a9
	.xword	0xd2dd11981ed125fe
	.xword	0xc9293c1b9f3a7d1a
	.xword	0x792db4d5e1f4019c
	.xword	0x5bb19888100146d3
	.xword	0x357cd8a4c2583aa2
	.xword	0x8c649b3c7558b8ba
	.xword	0x59dabf349d273f1c
	.xword	0xc762130589f7c1ed
	.xword	0xfc720ea7ac5ec280
	.xword	0x40b1171dd2f58cce
	.xword	0xb480066890c76ef7
	.xword	0x37b4e3f0d40e0233
	.xword	0x743ddc1c052739b7
	.xword	0x15c042059ac2d67b
	.xword	0x2f7dfbb76636b273
	.xword	0x4fd52f2404c8ebf9
	.xword	0x29aeb1036838fba5
	.xword	0xac862a9110fab729
	.xword	0xd28c60edf78e346b
	.xword	0xbedea82d65783ab6
	.xword	0xf9f155009d774595
	.xword	0x24b2a0f635557c91
	.xword	0x52dd1ee9aba1cb22
	.xword	0x76792d39c28f2576
	.xword	0x898ba7efcde3cf10
	.xword	0xa8b4e39843de39a3
	.xword	0x1dbbd058c3022af4
	.xword	0xe84b3ebd0c88b836



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
	.xword	0x27763558b0aa05b6
	.xword	0x39a672e687f20ca0
	.xword	0xdc10217661f024c8
	.xword	0x1a08b21b7a1d062b
	.xword	0x258f390b039894c5
	.xword	0xd445a4c9847448c6
	.xword	0xe722d5fbaebd827b
	.xword	0x7432944fb75d3353
	.xword	0xf595f32e611e2b96
	.xword	0x4c65b1558ee26262
	.xword	0x4372a5cbbb9f8f42
	.xword	0xb47cda6209608e3d
	.xword	0xce0800a82f31b9f1
	.xword	0x21d79cc4f7b2a508
	.xword	0xc0d567a851e001a3
	.xword	0x747eaae1df88ac26
	.xword	0xdb5c6faf8e43d21c
	.xword	0xdf544780cda79f93
	.xword	0xfc8aaf4831aec789
	.xword	0xc73b94a8c205f4c5
	.xword	0x5352685cc54518c5
	.xword	0x072dd96e2b838215
	.xword	0xbd49c7720570681c
	.xword	0x5fd81edde40ab586
	.xword	0x58f2940a7c63ff71
	.xword	0x8d67b3ef466dec7c
	.xword	0x209c4cd030720cce
	.xword	0xc2ed92226275d7b8
	.xword	0xf8886a9525914e7f
	.xword	0x700e9c0a8caa1e67
	.xword	0xa6feeb6a9cca01ed
	.xword	0x3c450e2414fc2013
	.xword	0x62e7233d9f4488b0
	.xword	0x7ebcf76d451b6908
	.xword	0x720a9303a3c50ef3
	.xword	0x5028de4f126a25c7
	.xword	0x5fd4b1a5a5f3e092
	.xword	0x2fd443e12ece590a
	.xword	0x92be59be883862f5
	.xword	0xd674eacfb02bde96
	.xword	0x015743b0320649d3
	.xword	0x143a45dd6c86608e
	.xword	0x3fb035053d93a0ff
	.xword	0x40c48ebd3c262448
	.xword	0xbcb9f65bbab2249a
	.xword	0x1caff61059871395
	.xword	0x0c424c12e52e442c
	.xword	0x3007a5302becb61a
	.xword	0xf9111ca5253b09ba
	.xword	0x794a67a465a6eec4
	.xword	0x75f6ca07f8787a32
	.xword	0xb3e07b2bda6db14e
	.xword	0xda821ebbf66a0ccb
	.xword	0xa9fc5168c4f3ff19
	.xword	0x97abdeca9ca6b1a4
	.xword	0x22768ee16ad6c0cd
	.xword	0xa63a3dbd450770f0
	.xword	0x594088aea066e258
	.xword	0x3bdd554e400a4625
	.xword	0x2840a779eac1ba05
	.xword	0xce365406910032b0
	.xword	0x5ddf961871384d57
	.xword	0xceebebc5406f5e85
	.xword	0xd91e92c18c7f2482
	.xword	0x284cd3b9c2543e16
	.xword	0xbae4a075358099e1
	.xword	0xc5e90a6b49aed431
	.xword	0x0e870f443cd46036
	.xword	0x787e40c9d8709e0b
	.xword	0x2fb60a220b9a9eb6
	.xword	0x468d4c0b6bad956b
	.xword	0xb6278e4e135c82e4
	.xword	0x8a9da5bce370c4fd
	.xword	0xfd117bfc37a10946
	.xword	0xd0e77e5bf70d67c5
	.xword	0xb260ce7609204cb0
	.xword	0x3f252205a90ef576
	.xword	0xfe1f12b8404926e2
	.xword	0x976b64ef5661b3ce
	.xword	0xc06c8e3f12ee431b
	.xword	0x1fd317c45b87d905
	.xword	0x5bfe173acd5841e1
	.xword	0x9f86858be53e8c57
	.xword	0x3e316521bd5596db
	.xword	0xcc918a14385f3154
	.xword	0x226d90da711d7cc1
	.xword	0x7fb0b2fcb2b5e05c
	.xword	0x773cc3d3265cced7
	.xword	0xafead7f69ffc3b44
	.xword	0x374fb4b476c74e5a
	.xword	0xefa14c609f116c2c
	.xword	0xab603cad672e5856
	.xword	0xb23c030e5abfc166
	.xword	0x4f5e4a03db8c8f7e
	.xword	0x714cd067c98a0b5b
	.xword	0x667f956a086c03b5
	.xword	0xc09f364bf2bef0a6
	.xword	0x877da38a504235e0
	.xword	0x22eb1262a5bb6328
	.xword	0xb54469ab177173cd
	.xword	0x37c0b8e13ecf56b7
	.xword	0x1a4c5b9665778760
	.xword	0x6cf969470af58b57
	.xword	0x76e26419dd27ce8a
	.xword	0x97512eb2d45f1b77
	.xword	0xd8e5ef22f373c947
	.xword	0x8fe838571ccb3949
	.xword	0x0bb9714495603b74
	.xword	0x63a28b02adde590d
	.xword	0x609dbc62eae81b45
	.xword	0x352069641f2a3ac5
	.xword	0xdb438c075f8e641a
	.xword	0x579f148a0de5ffd6
	.xword	0x7a093e4df6d22271
	.xword	0xc0e7dc7717ab26ba
	.xword	0x7c5523b157369be9
	.xword	0xa9353463d891dc85
	.xword	0x0f8f61722f02be6e
	.xword	0xda233f77500f4ad4
	.xword	0xe832c8ac333b997a
	.xword	0xc940fae7b7c1036a
	.xword	0x66bef59c9fd2789e
	.xword	0x9de6a05903f61a24
	.xword	0xf65a36d7e076818e
	.xword	0xfc593051cdfd0062
	.xword	0x96608023a78d4cc7
	.xword	0x5dc8c267d190e2b0
	.xword	0xf45be22a66fb37f9
	.xword	0x008d45311097eaeb
	.xword	0x0a96b39364920740
	.xword	0xf2393c515c093eb8
	.xword	0x55900df3eb8ef2a4
	.xword	0x3dfd73f664831848
	.xword	0x99509936156bed1a
	.xword	0x79d0f4885009fe2b
	.xword	0xe6e7b94946cc6029
	.xword	0x217f9da10e59c6fd
	.xword	0x45a81cbfaea4456d
	.xword	0x462ae494ef1e6e75
	.xword	0x89ecdc40b7a7e3ff
	.xword	0x2bce037c4897f3ea
	.xword	0xb89bcd250bd8876b
	.xword	0xd9b259e2c615e4fb
	.xword	0x4818f9d72973a957
	.xword	0x0588eb9deec06754
	.xword	0x72d806600aadb9a4
	.xword	0xad3f23132dd66b83
	.xword	0x41b90bee1350a56d
	.xword	0xa7281bc03f44e738
	.xword	0x0539da31ff6eaf76
	.xword	0x11cbb9ed03dd8fd8
	.xword	0x07ad19b42b597ea7
	.xword	0xe62eb03069f3cfa1
	.xword	0x0babf86593b6c563
	.xword	0x04163da5cc9e7ba2
	.xword	0x06d7971c75f5bc57
	.xword	0xf1f687eaeee129d6
	.xword	0x36f3c2ade955bca3
	.xword	0x0e7fca45f79352d4
	.xword	0x3a5fcb447cac0926
	.xword	0xea7d772a138db1c2
	.xword	0x33d21297bebb1ea3
	.xword	0x64e001825dda2387
	.xword	0x4615db21655f4c6a
	.xword	0xde1c3d7aafc951d4
	.xword	0x25b1bece7d4c7455
	.xword	0x076450b9df6ed645
	.xword	0x972626814037a5ff
	.xword	0xde14af4e6a688458
	.xword	0xa80b7936c90f8f0a
	.xword	0x58e6b591254d1cc7
	.xword	0x6e13eb5fb8e3e8f9
	.xword	0x9d970a29fc47712e
	.xword	0x61193e224f009cb4
	.xword	0xf911218a0fdbce50
	.xword	0x2ff864f01d6ba9a5
	.xword	0x92970cab3ca59805
	.xword	0xba9b113fa36b0548
	.xword	0x24cd35d6b57a68bd
	.xword	0x17b7705fe94e1558
	.xword	0x33e4e8cae94bc79f
	.xword	0xe0b8a8a07d8225c6
	.xword	0xe3333b4b0c1523df
	.xword	0xa4a32647dc5d58e4
	.xword	0x6ca498046963316a
	.xword	0x939922e7c68a0373
	.xword	0x12dc1841dfb58f15
	.xword	0x2b91003db33cc24b
	.xword	0x08e5752d2a9d8e21
	.xword	0x345e82d33823ea40
	.xword	0x90f64a631bcd18e7
	.xword	0x5afd732d50a41608
	.xword	0x9d21031bdc1675e1
	.xword	0x9aa9d962a272c594
	.xword	0x14307b55d207506c
	.xword	0x8e33fe0423e8f0b7
	.xword	0xc2da736b68812178
	.xword	0x64d7446aad4d3ac6
	.xword	0xd0e5a92a01950938
	.xword	0xff65eb7d0a1de41c
	.xword	0xe3dacae0172b6841
	.xword	0x94f557a72afc8d03
	.xword	0xf2f020474b3570b2
	.xword	0x564ac07ff05aaa4e
	.xword	0xf67a1bb82cf1e369
	.xword	0x9ec6ba0aa09607fb
	.xword	0x5ca6ce9e7ea31253
	.xword	0x01c69d16176dfa57
	.xword	0x9c1630e04d17b2f8
	.xword	0xccb473f770ea0c8e
	.xword	0x09b5b5b05ec2b547
	.xword	0xc9cc6e3d7afb0e17
	.xword	0x21158c38574eb5e3
	.xword	0xb39b99f2f3cbf8c2
	.xword	0xa6477c466019a388
	.xword	0x6468b94fb476eaca
	.xword	0x525a2842678767fa
	.xword	0x2fbbbdbae554d2a3
	.xword	0x2ce1e0f1848bdc24
	.xword	0xebbab71d8d167ab8
	.xword	0x2b9d3db13569a524
	.xword	0x4f90466ecdfef695
	.xword	0x92c9c4fcdbb9f41b
	.xword	0x1a4a1f4ab64548da
	.xword	0x89362989f6156096
	.xword	0x6e525b47ee91a531
	.xword	0x5832c7fac238240b
	.xword	0x024d38ecf5083964
	.xword	0x21bbe651d10f96a4
	.xword	0x2dd5fa91acf0fb1b
	.xword	0xe17b84838b4e8fba
	.xword	0x2d3010d2fb21acce
	.xword	0x94ac7e005c08874d
	.xword	0x4cf5117724ffa2b1
	.xword	0x6f9941d5a56326d5
	.xword	0x1ce97ef3da7e96cb
	.xword	0x053303eb8f6d85f9
	.xword	0x830738928c374c1c
	.xword	0xefb3e5218d8ff36b
	.xword	0x47f0eab15d291ac5
	.xword	0x41503372345e6f51
	.xword	0xdaf4c4b2ee85166b
	.xword	0x37e562080f7c6e72
	.xword	0x3f1316771f28cce9
	.xword	0x5b9037629b4ea034
	.xword	0x02ca331aba66848b
	.xword	0xa15062a19f6b7c4c
	.xword	0xc46da46b30c688af
	.xword	0x1c931e683d83e2e5
	.xword	0x030957f5b7f90882
	.xword	0x6abb2d3fcb191f9e
	.xword	0xa2ba91381819f82b
	.xword	0x23dc9baa2b89b1e9
	.xword	0x19693d33aab3dc3e
	.xword	0xf0d7795b9e99c551
	.xword	0x6a41e344f37c6941



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
	.xword	0xb2a9c44680224fe3
	.xword	0x01c5716f8852205b
	.xword	0x39f8b2103c5dc2c2
	.xword	0x53ab7af47d46ca28
	.xword	0x9e384c9a7373cf75
	.xword	0xe97368d65f33a900
	.xword	0x74e3be5307e1a307
	.xword	0x0937a8584a71807e
	.xword	0x7573b725f0d925e3
	.xword	0xb721fc5ccea8cfb1
	.xword	0x86b05ff821f485ae
	.xword	0xd5aa4f36148565e2
	.xword	0x78be8c4666558ce5
	.xword	0xb7f6098f758a1a88
	.xword	0x6dcd1e1a7cef1a07
	.xword	0xf125a7e89c9b37de
	.xword	0x577466d62d10b7d1
	.xword	0xf1a1def4cf63b0eb
	.xword	0xd9f54b95d20bbb98
	.xword	0x3583e888997d06a0
	.xword	0x32c47e3f25a7ec5f
	.xword	0x9d4e57336dae3f5d
	.xword	0x0cba408eee582112
	.xword	0x0910caa1e3eff907
	.xword	0xe76eccf0ae40629a
	.xword	0x980ce90cd186f447
	.xword	0xca919557c2f6579f
	.xword	0x7d0a0a50ddfda152
	.xword	0x32123eb0c8421550
	.xword	0x0478f0baea7a5919
	.xword	0x948c79e2b44d1798
	.xword	0x2be3062190e00ad3
	.xword	0xbe078b1ffb551f97
	.xword	0x750838cf6e61923d
	.xword	0x7e0ebcc015430d97
	.xword	0xc1fab2ea1c195bfe
	.xword	0x267a06fe59d18051
	.xword	0xeec8617f5daf2874
	.xword	0x2541e0b04d9fdb5d
	.xword	0x5d9eec876996ae2e
	.xword	0x82a13eb24d3c8016
	.xword	0xfdb90cb5060c8af5
	.xword	0x60e9dd19104c9315
	.xword	0x586fd8c6b8c7def5
	.xword	0xc72d150b58eea106
	.xword	0x07272353e15c0774
	.xword	0x400b6d07d40b1c61
	.xword	0x9c2ad4e99f7d9e7e
	.xword	0xd673d3ccbcf240b8
	.xword	0x08c5182f7cd69623
	.xword	0x4f11e42d87ff1a34
	.xword	0x66712855582f399e
	.xword	0x2f961006b44e6be6
	.xword	0x99ac943816fe49e8
	.xword	0xd500fb9b890e7051
	.xword	0x2448c099e68fdd7e
	.xword	0xf31d53dbc3de0719
	.xword	0x172b28efda14259c
	.xword	0xd672ba5943a016c2
	.xword	0x9c8c15a080729c76
	.xword	0xb9498e40ab51eee0
	.xword	0x1fb4bc96a70c2d0f
	.xword	0xa63fad95bda5fc15
	.xword	0x4be87053fc127632
	.xword	0x6532d2fa488c4d83
	.xword	0x709cef1ec6adaad5
	.xword	0xb531f844c3a1eef6
	.xword	0x5a07d9539e95b455
	.xword	0x82ac5998bd7718a9
	.xword	0xb236e7904f3dbe89
	.xword	0x32b53fc46d0e2d9e
	.xword	0xf37bb9e1fe19af95
	.xword	0xc0670d155b9d7aa5
	.xword	0xb7d3518d86a3bb10
	.xword	0xfd5621b7f5a07284
	.xword	0xf2e337d5e39b8f92
	.xword	0x6e44535ac936606f
	.xword	0x86711f63ef1b96ea
	.xword	0x599177a29f34ef81
	.xword	0xadacf34fc540cd58
	.xword	0x38cf0bef79ef3cbb
	.xword	0x9c807ef8e6e6ef66
	.xword	0x9f5501625db7b848
	.xword	0x987cd2cd34f2d412
	.xword	0xa28fa59b0e61068f
	.xword	0xedbde6fbf36c4c5a
	.xword	0xf910e23e0a21f36b
	.xword	0x77320ec1884d1bda
	.xword	0xbbe75557ff52ae1f
	.xword	0x4f09a857de0566eb
	.xword	0x7842cbf8055be75c
	.xword	0x1e3cd3e7111be088
	.xword	0xb45f3ed431f52abc
	.xword	0x6627bd0b3a1757b8
	.xword	0x9fcc27a0756fa49a
	.xword	0x1d6e377fc6949b7a
	.xword	0x7c35e3f215d5a18f
	.xword	0xfe4d3b5ccbf11d5c
	.xword	0x958a7dcc92d72994
	.xword	0xce0fe24f8626e02e
	.xword	0xc4ea0827d4fbe083
	.xword	0x24ad7e2f9506c50b
	.xword	0x192a0dc4c74daa26
	.xword	0xfb35499d155330ce
	.xword	0xd72c3a37db9a2c76
	.xword	0x28aceb415b5bafa3
	.xword	0xa3da17809b2d4f48
	.xword	0x2a2d4c9a8fdfc280
	.xword	0x59532f9c504109c1
	.xword	0xe27a3394621276c5
	.xword	0x787f010741e97c74
	.xword	0x29e9f97f7502c23d
	.xword	0x5efed96dd88574a7
	.xword	0xdd1bba9f8870cc96
	.xword	0x0f47e2c4a270940c
	.xword	0xa26d651baa4ca8a4
	.xword	0xe72c7548816e0e37
	.xword	0x17822f851b06215b
	.xword	0x34c8360db9458236
	.xword	0xcc777e30230b7f56
	.xword	0xa9af84ec9a9c63d8
	.xword	0xf26325cedc6afeb5
	.xword	0xc644f1e284a62d8c
	.xword	0xf4807138a1b3d199
	.xword	0x2e1023aac5dd493b
	.xword	0x604b2a0cdfa71b0f
	.xword	0xb708da534bd424e6
	.xword	0xf0ca954a99371235
	.xword	0xaa142489df265f61
	.xword	0x32fa4e63a70781e1
	.xword	0xb5bdb2cf759a9a76
	.xword	0xc93a1e9dd8322e06
	.xword	0x2eb06f863db0cdb4
	.xword	0xbcd0d660c93192d8
	.xword	0x76ba9d033f09fb0d
	.xword	0x19cf60c11325bc9a
	.xword	0x660b1856d6601e71
	.xword	0xd1b034b10164bcb6
	.xword	0x29e13d175efb3e2d
	.xword	0xbad0e06d9d603126
	.xword	0x4738f6b72f255570
	.xword	0x0dc451ae7d0f6bb3
	.xword	0xb4a3c27d22b1f0cf
	.xword	0x27f868e999ff54e9
	.xword	0x41b140ee9d093e0a
	.xword	0x3737a5e8fb47ecf7
	.xword	0xa631fd447a5f9a4c
	.xword	0x79ecf376948bbf72
	.xword	0x8454a1a2febc77da
	.xword	0x749a38b33248b645
	.xword	0x65e833ed9649e958
	.xword	0x764dc79ba24bde25
	.xword	0x283261657f49dcac
	.xword	0xa12bce1219da6d71
	.xword	0x8449c355864b98f9
	.xword	0x176d549549140000
	.xword	0xf5c85d95889ad437
	.xword	0xca58c41db3624398
	.xword	0xbea92a2395fe717e
	.xword	0x6721efd262743a3f
	.xword	0x78d2c1530eee723a
	.xword	0xc2ef93b528f706f6
	.xword	0x76305881961491d1
	.xword	0x6d98bd6cdc901d12
	.xword	0xec8c8a60a8a1d2d2
	.xword	0x189eeac61d462020
	.xword	0x3910544349c28543
	.xword	0xb334711b81c4c06f
	.xword	0x2fcf18e4c138c4bd
	.xword	0xdc5cf8ee0523ca58
	.xword	0x431b99a6cd3040ff
	.xword	0x67689c3df33d05b6
	.xword	0xe29a724c79604dad
	.xword	0x2c8021889adeeab4
	.xword	0x2fd58ac8ca27d95c
	.xword	0x298f4d8ac1111109
	.xword	0xdb38da1184d6fc01
	.xword	0x517de139317ebefb
	.xword	0xa892e0ca5c38137c
	.xword	0x5d76c9cfc851ff0d
	.xword	0x384be043a7f87203
	.xword	0xd084f798d7250f69
	.xword	0x48aaac0a4602dbcb
	.xword	0x9db80506055f5939
	.xword	0x979eb021a40f7923
	.xword	0x53ee29cbb228b8f0
	.xword	0xfe086cbeecf29cdd
	.xword	0x01ea613c7b0084c4
	.xword	0xe306baa5ac284b3d
	.xword	0xe595a5f81aeb3b2c
	.xword	0x70e3c618e305caf5
	.xword	0x49631c2616574943
	.xword	0xcddc94c7b9588ff7
	.xword	0x553e0748ff045fe6
	.xword	0xdf24fe03b96a8e02
	.xword	0xed4e422697649e97
	.xword	0x8daec0bb66b63783
	.xword	0x3522fc8f53aa60b8
	.xword	0x8ce97d2aba1bb2ce
	.xword	0x3d2187fc89cc8a8e
	.xword	0xb48835a5776e5bf6
	.xword	0x6cee0243969aeace
	.xword	0xc82b41ae21628ffa
	.xword	0xc92e18b7a43622de
	.xword	0x56a28fffe0fb9658
	.xword	0x8ba3ee4ccb8433fb
	.xword	0xbd3474dab8bd6326
	.xword	0x2ed3ef60c1bfe87b
	.xword	0x990ba5b39d843637
	.xword	0x64121d9c21b42f5b
	.xword	0x572abc7ba2d8fb0c
	.xword	0xf15f94f192e7cfde
	.xword	0xce6bf14879fde1ff
	.xword	0x518c7d8fa0f31b03
	.xword	0xbb0c1e5a15c2834a
	.xword	0x03e7ee27914be078
	.xword	0x5b604818d41b30d3
	.xword	0x13fb1f76da66e9e9
	.xword	0x4ce76b4ae4574448
	.xword	0xa8a414c5afd1efab
	.xword	0xb04b07ba3ca1c0de
	.xword	0x3654c60be4b44e79
	.xword	0x0e5832a501f34fed
	.xword	0x48dec235b1bae6bf
	.xword	0xf6231b39719e423a
	.xword	0xb80fe37444f93d82
	.xword	0x9c1e2046b5ced322
	.xword	0x9fabb7c74589648d
	.xword	0xbafbebdab9476463
	.xword	0x200edbe9d40db3d4
	.xword	0xd4d9ef3e62bc4512
	.xword	0xf546803f8b9b816a
	.xword	0xb0de1b1ed88eba81
	.xword	0x3da4aa3f0b428d4e
	.xword	0xdd19029323540135
	.xword	0xcde20f3d9b68a3b3
	.xword	0xd24c57ef48204163
	.xword	0xf537b47d6d5cd050
	.xword	0x9ae387eced1cded6
	.xword	0x2005cc48e59908b5
	.xword	0x379fcacf6c2c1fc2
	.xword	0x43d61f2a5c75b7ed
	.xword	0xcd95795b6f3b3928
	.xword	0xbd242371dd8995c9
	.xword	0x99c44a2909e41120
	.xword	0xe7e9baaa3289b195
	.xword	0x67818dc4a9ee9f85
	.xword	0x068c5135fd6e5c95
	.xword	0x0ef48ce7079a1b4e
	.xword	0x01685efc26f65981
	.xword	0x253df519c6f60775
	.xword	0xb0333cfc0cf88507
	.xword	0x0fcddc17ce16e87b
	.xword	0xc71fb9209d521b22
	.xword	0xab4520e225a068a4
	.xword	0x2e9f508e5ed392c6



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
	.xword	0x6697f49492d0ce5f
	.xword	0x19c29267556adfb5
	.xword	0xa89da8f8fe082412
	.xword	0x8656e702bb745153
	.xword	0xf9ba09a61d6cc8c2
	.xword	0xd0be4db5987e15d3
	.xword	0x94cce78c6b0871da
	.xword	0xfce446c2cd6a6b12
	.xword	0x733efcea64f9205a
	.xword	0x7add971c5f0a7869
	.xword	0xc110cd635353b2a1
	.xword	0x8e74df8a6a9abbae
	.xword	0xe86864a2fcc978bf
	.xword	0x8978e52a3e908811
	.xword	0xb671b73760d3ba89
	.xword	0x4f306e83f5416055
	.xword	0xdc6f9600dd5fc43b
	.xword	0x1e32e7c139d44595
	.xword	0x890d89f855fd8705
	.xword	0x0eb0711becff2546
	.xword	0xad2b7d71cb60b5d3
	.xword	0x8d581bc83ef059ec
	.xword	0x9d2d95ba65227d29
	.xword	0xf7694397bd48ec4b
	.xword	0xdc1ded0c772f7e77
	.xword	0xec9c789d1ae82d4d
	.xword	0x67be29635e712190
	.xword	0x41c036da4436a4e1
	.xword	0x9ad4ef519b69842c
	.xword	0x5744580ac8e9875d
	.xword	0x94acc943048805b4
	.xword	0x302d66ff910d7dc0
	.xword	0x379245df47adcd06
	.xword	0x9ea1aed245f2fd1c
	.xword	0x6ab676ed2b76e75f
	.xword	0xfe8711ab0322427f
	.xword	0xc22499ced2a87711
	.xword	0x8aa38d65e065d9f0
	.xword	0xc93ab7e0a2e3a791
	.xword	0x20a03b8d25bc39a6
	.xword	0x53635f4d7df6207d
	.xword	0xca7d7a4b0ecf1707
	.xword	0xfffa22c00c8b529d
	.xword	0xe27b2350c5d8fbc5
	.xword	0xc673924fbc1e2fe9
	.xword	0x838d0c96d4c21bed
	.xword	0x229d48bf6577e7ca
	.xword	0x961fbf29dc360b19
	.xword	0x41d2ed5febdb6c94
	.xword	0xe5174bd47f7c14e6
	.xword	0xc83a141bcfec7dbb
	.xword	0x4dc2bb75148e56a4
	.xword	0xa03a2da7596d0de1
	.xword	0x718b33b792f8e3be
	.xword	0x4557dc196b99edec
	.xword	0x822ec8595f100a7d
	.xword	0xf450fb3fa867292b
	.xword	0xf29b4eed6cf240fe
	.xword	0xcb78c7c6d11c6138
	.xword	0x91786be9dae09b8e
	.xword	0x91edf62ff48b5fbf
	.xword	0x760524819983c082
	.xword	0x65b415e491dcbf30
	.xword	0x02dd9d4ec32a3d7d
	.xword	0x639a8f20bf5c5371
	.xword	0x781302dfe8a84646
	.xword	0xadef6da54ab0745e
	.xword	0x74af8705ed027a89
	.xword	0x0ace8e29fd99c314
	.xword	0xd741267919f5c5c6
	.xword	0x45df5689625f36fe
	.xword	0xe6bde8a39c47662f
	.xword	0xb3ffae0e07112a3d
	.xword	0x8b22524b9b579522
	.xword	0x69d12137178f7ab4
	.xword	0x9e083a08a322a7d1
	.xword	0x15ad6cf435c7b51f
	.xword	0x0929be5f8102e2f7
	.xword	0x65f1517df4ea7af9
	.xword	0xf51a7dfb5216346d
	.xword	0x3cc5279b99380f88
	.xword	0x4ebd60f20d1daad0
	.xword	0xa0a384d25e2e6ecd
	.xword	0xfecea1edcb3791d2
	.xword	0x57c012dd170fe187
	.xword	0x5ee87db8b0ac44c9
	.xword	0x54dffa43313a40b4
	.xword	0x1e341053fa99677b
	.xword	0x2945cb9266012677
	.xword	0xede560b56d65b99a
	.xword	0xa2903e095a05c612
	.xword	0x0aaa335e4c55b3e0
	.xword	0x803d8d637f20a1a8
	.xword	0x05a40630793b4d52
	.xword	0x73de142209d71393
	.xword	0xc287b605ea20f6ad
	.xword	0xc448f95fe0fa8053
	.xword	0x15d424aa983384a9
	.xword	0x49b49f915ffc75a5
	.xword	0x2e1374efa68c18a3
	.xword	0x0484cde69d2c1f29
	.xword	0xe8f9e4c994e58b5a
	.xword	0x8329f3711884cd23
	.xword	0xfa57fe984395a99c
	.xword	0xc5f39cdfd2229446
	.xword	0x7eacbd0483685291
	.xword	0xa168867fa5aab9de
	.xword	0xd2e356bf7ee83f44
	.xword	0x813f57425040c6ba
	.xword	0x96d9043e43f1cd76
	.xword	0x3574200ea2dcbe4b
	.xword	0x2cc1b950dcfdbdd5
	.xword	0x3acda1cbd686cba5
	.xword	0xadd694fd2a000683
	.xword	0x9a22c15055e310d6
	.xword	0x31b31aab2db1c581
	.xword	0xd87ae3ba87c42259
	.xword	0x4214de84ce0e5115
	.xword	0xf4033d191d9fc398
	.xword	0x59fefdf1e359f15a
	.xword	0x947c30d18c9f7cb2
	.xword	0x7d56dc177ab3c3ca
	.xword	0x16c72088b00dcb4b
	.xword	0xb5cc7c13635dda82
	.xword	0xc1dbe385c4241286
	.xword	0xe1bd616e0a0e61e2
	.xword	0x7423da27a3578b70
	.xword	0x334ffe3ecf71aa8b
	.xword	0xa46416417fcb5595
	.xword	0x8dc52bb8c5d86562
	.xword	0x7989895d17c56141
	.xword	0x7cb1ee2bf306807d
	.xword	0x489e963e9363f9da
	.xword	0xfcadd82508eb4e0e
	.xword	0xc4fd8825951455d2
	.xword	0x949d5fa9756e4878
	.xword	0x0e6f8ace0f94a966
	.xword	0x8620d3729f481fab
	.xword	0xc1e00df85048d0c1
	.xword	0x129e63a4c802c007
	.xword	0x0e6775ac515fce7f
	.xword	0xdb77b070ec9ccfcd
	.xword	0xb517ac698bf5629b
	.xword	0x6b187d1299d6e4af
	.xword	0x880ec65c4d784711
	.xword	0x98714319728b5720
	.xword	0xf062ab515293fdcb
	.xword	0x06858a1cee2f0e3c
	.xword	0x067fd249c726ef22
	.xword	0x6c7fdb4eb6cce4d1
	.xword	0x1a2f9463f6bf5dac
	.xword	0x6ca201e9b228e4dd
	.xword	0x0389a70fbb1ee8a5
	.xword	0xe9473ce7265d0671
	.xword	0x02fa1c0967092555
	.xword	0xf13abfc49c15f396
	.xword	0x608f6fc55eab7232
	.xword	0x6bc80d5ef030ec7a
	.xword	0x295a3a851ab37426
	.xword	0x4c627c9c6297e51a
	.xword	0x3aa4a03a23a4f7ed
	.xword	0x85e09e6ba0716792
	.xword	0x09ce4826847f6199
	.xword	0x53f6b0f494bafa9d
	.xword	0x37bdc50bb02c0395
	.xword	0xbfb0a287f0a6ea50
	.xword	0x773617bff857ff85
	.xword	0x47caad20441668d1
	.xword	0xe7df9dca9f49c559
	.xword	0x10ccdd5c4173dcb0
	.xword	0xc8cd35810887887f
	.xword	0xf2409d7146b0d533
	.xword	0xd1db30f23a608446
	.xword	0x16599b6ee10c17d5
	.xword	0x6c8cadc6385aba5a
	.xword	0xbde7f1c87ff39c1c
	.xword	0x4141858393c6e73f
	.xword	0xd2f0245011c537c5
	.xword	0x41fc0749ac38f1ca
	.xword	0x459be0512c7a3724
	.xword	0xbc880042e370d9be
	.xword	0x0dc7eb6558dde8ad
	.xword	0xec69730ecc8a6f1e
	.xword	0x76cdb62eacd14fb7
	.xword	0x67a4271a345e3e54
	.xword	0x8d339d47950b6d5c
	.xword	0x2c095efaa4d8baae
	.xword	0xbfd949c4cc29d500
	.xword	0x99c79806db82aec7
	.xword	0x2c1e493092077017
	.xword	0x36c416715f0a56c1
	.xword	0x1598ed506e43d310
	.xword	0x7aa1094dde280c8a
	.xword	0x1a989af4bdba36e7
	.xword	0x7c6290e3e6f606f0
	.xword	0x5727b54d8b167ba8
	.xword	0xa7b60fbcc46f93ee
	.xword	0xb517c1d2b36684b2
	.xword	0x75d71afedcea0086
	.xword	0x9aafe95c6bb6f13c
	.xword	0xa1c73d04c19ab44d
	.xword	0x04c1c64bb10496b9
	.xword	0x943afb1fe9791341
	.xword	0x620864130c08ca35
	.xword	0xb039617234e290c9
	.xword	0x5e760af26dbc52c3
	.xword	0x35961ec20dd86793
	.xword	0xeae7432a2e018d4c
	.xword	0xf085086cf152465e
	.xword	0xdbea59b8fb010335
	.xword	0x6f493079a2c35224
	.xword	0x61c010a9eb2e119d
	.xword	0xf20d1243421278d2
	.xword	0x67a2886d7f8c0d3c
	.xword	0x5d86b9cee25fd16f
	.xword	0x2219ec16839edef3
	.xword	0x45fe92be9116453c
	.xword	0x0c33c04cb9c0e649
	.xword	0x93236d648226f045
	.xword	0xa3c2155d35ecd389
	.xword	0xf517ae3cb1137fe1
	.xword	0xec61cc0610622843
	.xword	0xa9ee2930044ee49a
	.xword	0xdab2ba0a07335daf
	.xword	0x7e4bab8a7539f3c5
	.xword	0x7cc2c52c4a999957
	.xword	0x597976e223d5de72
	.xword	0xa964f5b213f8792e
	.xword	0x5aaba152f1f6dfb8
	.xword	0xe3ed26d4a7b9cea5
	.xword	0xbea74675e02048d6
	.xword	0x87a3c3fb84c794c9
	.xword	0xf58f7cc0e5b48a88
	.xword	0x428ffc379d7bfef5
	.xword	0x6f082737bfa823f5
	.xword	0x74b3c2ecd6f976b3
	.xword	0xdb938dbf3d0016ea
	.xword	0x44bad231cc1c3190
	.xword	0x2e31025b84dea155
	.xword	0x3ddbbfe8235e14a3
	.xword	0x41ac4ed4b9c34590
	.xword	0xfef6d3b5559f2ac7
	.xword	0xb4d1f7eb9b2231d4
	.xword	0x61932b1d2ee7aab5
	.xword	0x039d3c1c8cf28ce5
	.xword	0x35e21017e7448ce2
	.xword	0xee07d83da993f400
	.xword	0x6ab583a946b6c2e0
	.xword	0x9a12b04ebc4b9370
	.xword	0xc52e852d8e15c2d6
	.xword	0xd7bd1f0036b43064
	.xword	0x814a023cc380252d
	.xword	0x0c719cdc9c870285
	.xword	0x342df0f7d4cea2ff
	.xword	0x8f20892e614f2d47
	.xword	0x77495bb723cc5b23



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
	.xword	0x873ee95a267dfb71
	.xword	0x345e3ae2968c4cbe
	.xword	0x3cd30683d362f69d
	.xword	0x4e90f057e7039af1
	.xword	0xe21a3ca943d48257
	.xword	0xde1127a08e6c404e
	.xword	0x7a95e2e5f083cd19
	.xword	0x8bdfc419457964c0
	.xword	0xf1b6472fa9f330db
	.xword	0x2219e59cd8bf8216
	.xword	0xcb2ec9d8284eafca
	.xword	0x6211c81c2be13338
	.xword	0x72323d0ed025859d
	.xword	0xe65e2c8c73655fd1
	.xword	0xff1edea58cdad624
	.xword	0xa4d6df1653921c1a
	.xword	0xdc14033099d01889
	.xword	0xba43ea51c246553c
	.xword	0xb0b12d6201db1c07
	.xword	0xce8ec9928611553e
	.xword	0x8bf9b08d696754f1
	.xword	0x40d4ba36e7bdd805
	.xword	0x18c2dcd54f906b1d
	.xword	0x7c75896cb8fa601c
	.xword	0xdd51c6e7ce8c0d2c
	.xword	0xc0c18042ea50532d
	.xword	0x200cad018528d6d4
	.xword	0xdb1609e90da122ed
	.xword	0x1bb5d72da4dab9e7
	.xword	0xbac5ab322b9e89ac
	.xword	0x86bf05a84b19ca2e
	.xword	0xf54b3ae5a5fe26f2
	.xword	0xb0205379b4d0a7d2
	.xword	0x88bfc0305853b867
	.xword	0x554b4a71c4a35e55
	.xword	0xe48d5d8497799bd9
	.xword	0x87409bdfb9e6f287
	.xword	0x8d64bf29958fac8c
	.xword	0xcc3e1a699a57ea64
	.xword	0x2c6218536612bb2e
	.xword	0x606e6de7c305c44f
	.xword	0xfbd313e849caa407
	.xword	0x6441817dc54c9aa2
	.xword	0xdc35112ccc10e794
	.xword	0x8d5d98a0204b6998
	.xword	0x533b4cf9d66b19fc
	.xword	0x361655005e4a46f7
	.xword	0x846450a8462be1ad
	.xword	0x45c5a34514af2c4c
	.xword	0xfad4da4fca0bd778
	.xword	0x105503c00aa2a95f
	.xword	0x32663bbfde64fe36
	.xword	0xfbe39975b4f172b4
	.xword	0x2e657cdaefb1c3ef
	.xword	0xcfc0e0a7477b5587
	.xword	0x289c7d37c81478d6
	.xword	0x9b5bf22c73306e7f
	.xword	0x04e735c9fb436f60
	.xword	0xab0731e949adaa92
	.xword	0xa1404a6bbe5ba97b
	.xword	0x05dcfa8dd825a225
	.xword	0xd228528ee0faac48
	.xword	0x2981a0c852ab74be
	.xword	0xcabadbf7d251b009
	.xword	0xfd1ff118df55e8b2
	.xword	0x525de8e3bc637957
	.xword	0x135d267f463c9c5b
	.xword	0xc52a231957e41efc
	.xword	0xa9f35696cae9e54a
	.xword	0xe91196b98820ea8c
	.xword	0x669c2324be79bd5b
	.xword	0xbac97bd6f5ed834c
	.xword	0xad5c2b30b2fa067d
	.xword	0xf577b883dca66f7f
	.xword	0x5982d2b277882962
	.xword	0xa43ce6032dd65d48
	.xword	0x261409f37fe49101
	.xword	0xaa59fc3fe74b72b3
	.xword	0x971f3340ee0feb63
	.xword	0x8465ff140d1079e0
	.xword	0x9f2f0ddac50ab790
	.xword	0x1050a05710b43cd0
	.xword	0x6447e31ffea2b1fa
	.xword	0xacdb1b0b558bad00
	.xword	0xcbc1d8dc851178a5
	.xword	0xf4249bfb3a64058e
	.xword	0xc4470cc95403ab9a
	.xword	0xea8c240e4e4c7466
	.xword	0x3d435d242051b28c
	.xword	0x8b68c685efa7b3d6
	.xword	0x25aaf7e39ad276ac
	.xword	0x896b22b3a7a6edca
	.xword	0x4ce06f5e38ee57f0
	.xword	0xd1415a0e16b99f55
	.xword	0xf1170a396b0411be
	.xword	0x5429a133fe58a817
	.xword	0xe3f99e87b15d07db
	.xword	0xa94b9e17ca61bf09
	.xword	0x8ae4b3d408c852eb
	.xword	0xe588fce4d1e756af
	.xword	0x64276aff105f08b1
	.xword	0x8e3f861348c8b85b
	.xword	0x226290e18925baf2
	.xword	0x5efc22b37dd8dafe
	.xword	0x636413c1df164367
	.xword	0x1541b6169c23c54b
	.xword	0x8b2072142168703b
	.xword	0x6e1d51177ff11d6c
	.xword	0x7e2bcecbe601b626
	.xword	0x5978f18057898b7a
	.xword	0x03be88aed4acf958
	.xword	0x9109522912b160b5
	.xword	0x8e5bff3c68830232
	.xword	0x8533538f9ba50828
	.xword	0xed6c2023aa33e2ef
	.xword	0x6a2e9e27deb9be3d
	.xword	0xc6a4b6fca95a0855
	.xword	0x5412013c4acb1368
	.xword	0x414e7162d4059e11
	.xword	0x279dc985c77d1bfa
	.xword	0x4b1f876768aaf300
	.xword	0x2baf8d848ad662b1
	.xword	0xb039b234bfee7612
	.xword	0x21d171bb63f2284f
	.xword	0x2e5ffa1b054338db
	.xword	0xf6640a4302a5286d
	.xword	0x455ae5af792a6a23
	.xword	0xae00a5fc6354a264
	.xword	0xc1ae275fdd9ede41
	.xword	0x405e5942127bd649
	.xword	0xb4f3d97e48317975
	.xword	0xeaed6405b2d1cb55
	.xword	0x44a319b6eae8b931
	.xword	0x0fedae04feeb9285
	.xword	0x7eaffa49d906aaca
	.xword	0x77c68306cdfb9bd9
	.xword	0xffc1bed73cfb0b01
	.xword	0xe38059162f70ede8
	.xword	0xbb99e08c92df1477
	.xword	0x010ff4f4bc9205f7
	.xword	0x5380c297c44336c2
	.xword	0x71beb56deb732c97
	.xword	0x5cf5405572516bd9
	.xword	0xbea353a544d838fb
	.xword	0xf8d4d683292bc2c6
	.xword	0x1b7d25bf82132b85
	.xword	0x1846c46ba829f7eb
	.xword	0x4d538c5048a2c268
	.xword	0xed97bc8a23a2a825
	.xword	0xeb65235156639cb8
	.xword	0x6bb4c4e91b9454a4
	.xword	0xaf2bd0e3f7248514
	.xword	0x93b86aed93681d76
	.xword	0xba87871d9336d2ed
	.xword	0x14f32467220de007
	.xword	0xb3d71e2a86952e08
	.xword	0xb238af8b01954e66
	.xword	0x66c81f5a86e6a247
	.xword	0xa25b9fff54e65716
	.xword	0xe7f34ed600ca049a
	.xword	0xf7cd0a9d5703be46
	.xword	0x8b310f87c5e4813e
	.xword	0x55198e8c06d27bf3
	.xword	0x55ab22ac14f0606c
	.xword	0x703f5c9a3558d121
	.xword	0xc770d737167918f6
	.xword	0xb118fc968986980c
	.xword	0x2b8e93b60d1a6479
	.xword	0xff588e1226c124c0
	.xword	0x079c8062973f8397
	.xword	0x36daa481be47377d
	.xword	0xc5ad09f3202905c2
	.xword	0x6744376d2706f565
	.xword	0x3c95c19ba324e4a6
	.xword	0x949a1e745d1eef83
	.xword	0x0506466fc14a5c2a
	.xword	0xc44b6ad876c20c9a
	.xword	0x7ef60ca00dcee1f1
	.xword	0xb6d298bc5fb2a843
	.xword	0xfc841fab162f30f8
	.xword	0xff28aa8110d7cb07
	.xword	0x80a640da46bebc89
	.xword	0xa169962f8572e7ba
	.xword	0xce8253d1c4e816ff
	.xword	0x185bff2a45548a2a
	.xword	0xeca5eb6106c8d1c2
	.xword	0x32f7bf1f9010349a
	.xword	0x4c288ba3ce982b60
	.xword	0x5c8d592ca4413b0d
	.xword	0x0e8aa315e7bbafb7
	.xword	0x9fb8cf2663c74d5a
	.xword	0x863153f2a373f091
	.xword	0x0a2275922d84888b
	.xword	0x46da69330e0f4748
	.xword	0xbf91548d98c5d43a
	.xword	0x69eca9f458d6afec
	.xword	0x5d8f725f97f29e40
	.xword	0xef49d766af49d706
	.xword	0xc2ccd8b3cdf58505
	.xword	0xe40ad7df5d7507bc
	.xword	0x1d6a397b8e712bce
	.xword	0xbeb0fa678337581b
	.xword	0x780b2391280d4b46
	.xword	0x4e797ee8f9322f6e
	.xword	0x01f49103a48a2f37
	.xword	0x41207a210162bd49
	.xword	0x3fff77f3da15e30b
	.xword	0x58bbc7aef2e9c402
	.xword	0x7390e0855d65dc67
	.xword	0x26ab3a1f54309d44
	.xword	0x481dc5bc5bddd7ae
	.xword	0x35b09ddfb2af7baa
	.xword	0x8c0dbac61cce866d
	.xword	0x86f69f748ee6d8ca
	.xword	0x5214f69a085bce4e
	.xword	0xdb1912a208484735
	.xword	0xb42616a0f45afb92
	.xword	0x767e242503e1196d
	.xword	0xba67f3ebe0c75874
	.xword	0x0c3fec40e79634f5
	.xword	0x2d31c3df382d0b2d
	.xword	0xd2bd389ea58ef1ca
	.xword	0x7929c179185c32c2
	.xword	0xfe52395c52b1db75
	.xword	0x25538ed5b09450fd
	.xword	0x433ce215762ba70e
	.xword	0x4e4d442675a868f2
	.xword	0x2c0eb0dcc7a1f5e0
	.xword	0x739ee600a19e7845
	.xword	0x1ebb5a0ae770bcc0
	.xword	0x3b5cc03dfe636976
	.xword	0x162f8f431862dbd3
	.xword	0xa1d57b2c3c8e27b8
	.xword	0xdcbab1ea40b36fde
	.xword	0x6675de7233fee8b5
	.xword	0x1025a69f8900ec5a
	.xword	0xa6abe70b28eacdee
	.xword	0xc697ba7fed0405a5
	.xword	0x79a20eacbf146a45
	.xword	0xbb5967916ef24f0d
	.xword	0x068faca31ee6f37c
	.xword	0x0e2c2a7653828752
	.xword	0x0350c297c1bb4d33
	.xword	0x5d2cd7b1392119e3
	.xword	0x402c2393aeba352f
	.xword	0x42f617d6ec4999d2
	.xword	0x2ee340ffabc8366a
	.xword	0x0944dbbf2adb2f38
	.xword	0x237b29d9785a701f
	.xword	0xb0b189cc69309ac7
	.xword	0x9c657c7c5d5a27ef
	.xword	0xa6789fc7513a20ca
	.xword	0xee9ba12aab839f9a
	.xword	0x351f7e900b1d70ed
	.xword	0x1fd16b395a94d6a2
	.xword	0x96c48d8a0a550ee0



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
	.xword	0xfde4cb8a52261c37
	.xword	0x70049c5b4d637bd1
	.xword	0x8ffa76e0408b2988
	.xword	0x688321c3aa76e7de
	.xword	0x32cc7e5393c8c013
	.xword	0x8c8820f7eacd71e9
	.xword	0x53a9b43ccad1cc53
	.xword	0x48d915861b36687c
	.xword	0xc1ed3183e6e3cc2c
	.xword	0xa7d5ece47f433821
	.xword	0x8bd0dc3ad030b83d
	.xword	0xaf1230b56ce85c37
	.xword	0x24ea567f666ed8f7
	.xword	0xbd64b96bb720a7a7
	.xword	0xe0910d41d8b9c6d8
	.xword	0xd90ab155bf736edc
	.xword	0xf335e72e035d2681
	.xword	0x05e9b55c4bbbd2f3
	.xword	0x051ae38957a2286b
	.xword	0x612df24eea11ec2e
	.xword	0xdb6e572dff24432f
	.xword	0xc03de82a1741f517
	.xword	0xcfdff85a78fc0443
	.xword	0x791910d2703d3621
	.xword	0x3af52cf1d5c5d3ab
	.xword	0x86c7f961b0ec4011
	.xword	0x915c1890b6d8c87e
	.xword	0xf328c4bd9c710cb2
	.xword	0xc5972ebd2509bfc3
	.xword	0x70178b3c6963fa9e
	.xword	0xcc4d45230e0b1ef2
	.xword	0x35451becfc3d2351
	.xword	0xaf521445ccf23c8a
	.xword	0x5b171c552818688a
	.xword	0x6ca6370251f7bae9
	.xword	0x2d6266d9dea94d39
	.xword	0xa88423c1404a3c1a
	.xword	0x332f2d2b57efcaa8
	.xword	0xc790addf1b6b51f2
	.xword	0xcd7ca012b98f46c3
	.xword	0xbe4f32c3d49c7623
	.xword	0xaca1c4a62a84446b
	.xword	0x5b2aebc36ca9f46a
	.xword	0x83fb61da375a8241
	.xword	0xa622ffa15446ca40
	.xword	0xe70364de692d43ba
	.xword	0x6172ffd328481327
	.xword	0x705de53e1fe22c36
	.xword	0x995d600302b9172b
	.xword	0x0ebbb24346f9e1a3
	.xword	0x2fb0db643566f9f6
	.xword	0x18625aff6f63f9dc
	.xword	0xde7c7d778f38cccd
	.xword	0x9fede4ae9ed4e133
	.xword	0xb3ac4f573a5bccce
	.xword	0xa8b205eda96d2d52
	.xword	0x7276000a8f64f49b
	.xword	0x4b18a57a950ed011
	.xword	0x3ef6e91af0bab3f8
	.xword	0xc71f1b8ec1dd658d
	.xword	0x7aa52a1d907130f1
	.xword	0xf378f004418ea4f5
	.xword	0x315ceabeab7dc4cd
	.xword	0x6511247aba6317a5
	.xword	0xfcb0b3bb1c7457e7
	.xword	0x55d4b85e61baa3c2
	.xword	0xd9cc01ec0955961e
	.xword	0x437115274921e26c
	.xword	0x1b0241d62e75381c
	.xword	0x5311a63e046b8c6f
	.xword	0x7502cb2b6e5fd066
	.xword	0x451b6ad052f57b6f
	.xword	0x761b5e8edb869189
	.xword	0xc94d2b19fcd91dac
	.xword	0xbf551b5ca17cce89
	.xword	0x9d79968f1c78d773
	.xword	0xd92bbffe5310c5b7
	.xword	0x81ecd1421dbef3b1
	.xword	0x393b9fb919c01590
	.xword	0xcc1b107282c7cefa
	.xword	0x66fb108a5dfcb3c7
	.xword	0xbe0a71643657bcca
	.xword	0xbe74cd64642b1a6a
	.xword	0x42b474422b71a696
	.xword	0x46996160d134a433
	.xword	0x15e032352c2ef981
	.xword	0x0b54bd5d4e4fbfe7
	.xword	0xff1887da4e0950b7
	.xword	0xce1ec6305c4c38b9
	.xword	0xc00d0e0d2c6319e0
	.xword	0x22f8a8cca296c59b
	.xword	0x2c8c6f7b0b4b65ef
	.xword	0x489ba911862712b3
	.xword	0x7c5c40e4817f37c8
	.xword	0x5d094e8aa5574444
	.xword	0xe7d247db8c093a3c
	.xword	0xa08c2039a6c20a1f
	.xword	0x879bfab0f2ece498
	.xword	0x5adda6780d1450c5
	.xword	0xbe3d974e4133db8d
	.xword	0x8a0e6aa809e1a890
	.xword	0x42336433bdfe7715
	.xword	0x114148b851e03bfb
	.xword	0xd8d3a8c00d3b1e57
	.xword	0xdf6c0e985e3245be
	.xword	0x9dad34cd6305d38f
	.xword	0x17a4bb72ed3bd350
	.xword	0x798dc16f177f923b
	.xword	0x2cf646a10afa7a25
	.xword	0xf9bacbde6b57f705
	.xword	0x732fc48e9ba93040
	.xword	0x591b801110272f1e
	.xword	0x51e260d8d5ec1f4c
	.xword	0x9183c2c80bee7684
	.xword	0xfab09664766f448f
	.xword	0x57e8fb905351a729
	.xword	0x5ba4fb8f0b8247cf
	.xword	0xd61d5ffe61f23925
	.xword	0x4769e94229d659df
	.xword	0xe0a6faec9d093939
	.xword	0x67a862a8251751fb
	.xword	0xe6052fc514b2ffc8
	.xword	0x650adea622e3cf13
	.xword	0x7e68666dafa3f405
	.xword	0x76a4a31165e59dee
	.xword	0x3672c5f52a35a33f
	.xword	0x6f6d7af947c13991
	.xword	0xcbd1b15ccee55cfb
	.xword	0xff77e4b0f88c573c
	.xword	0x39f46aad9fad64a8
	.xword	0x2822738ac7806dae
	.xword	0x790300ca01533fc6
	.xword	0x51d680aad97a13a2
	.xword	0xde039628de3d5648
	.xword	0x4c5dbc8019ad3e14
	.xword	0x38be59078154dbab
	.xword	0x6cf734e54e308e53
	.xword	0xe9345f5d7a5e6014
	.xword	0xe484522d48f1cf50
	.xword	0xa5fd8a7336684824
	.xword	0xcc3ef1bcfce20e09
	.xword	0x2ca7bc4a6fe89005
	.xword	0xdfec24425692601b
	.xword	0xb096e088119fb3de
	.xword	0x832a8d5c765d57d1
	.xword	0x792474e27add7c4b
	.xword	0x768d7c55448d84dc
	.xword	0xd0c63465432fab08
	.xword	0xe1d78e70e4c412ed
	.xword	0x6d552a6e2391292d
	.xword	0x872ef089199b4cfa
	.xword	0x6d8b9585ff13e9cc
	.xword	0xf475425696ca1484
	.xword	0x43ea96fa67528ce5
	.xword	0x7062539b936567bb
	.xword	0x9b2ebb65e50a3cf0
	.xword	0xdf3f4fbd59b8e092
	.xword	0x7b5912c07ac78af2
	.xword	0xbeff8a0d82f688f7
	.xword	0xd9d8e7ccfdfbd918
	.xword	0x4485149409a1c88f
	.xword	0xcf853df29edbd4bd
	.xword	0xbf823e7435c2872b
	.xword	0x225e622ac880ea37
	.xword	0x87636f9b1aac27d7
	.xword	0x43675cea02df58d7
	.xword	0xc150295574cca01a
	.xword	0xb20fc774fe04104d
	.xword	0x89b560939bee16d9
	.xword	0xc50dc8dc9ec16d03
	.xword	0x8172b9972de50b2d
	.xword	0x64f2bda9d0fd2f16
	.xword	0xfec65ed6d8f4201e
	.xword	0xc1af56f0636782b0
	.xword	0x5d330d417e24001c
	.xword	0x6d2fc67bff361755
	.xword	0xc3ba3e114679f660
	.xword	0x988cbd9f158ae0e9
	.xword	0x13a05aa725dea348
	.xword	0x313c9711fc221a1c
	.xword	0x6605f451de41ab2a
	.xword	0xa57cb40686d3f6e6
	.xword	0x3fb3aeb8d4373957
	.xword	0x0fc8fab07965c218
	.xword	0x15acec75266a1dad
	.xword	0x0119d63105be0f8a
	.xword	0x596dbeafcb0f0fc5
	.xword	0x33a45870a4f18601
	.xword	0x5c5f4f3f1568170e
	.xword	0x3a9ee7e923a99ae4
	.xword	0x0831af45cb63e9c7
	.xword	0x1b7edeee28063ced
	.xword	0x8e927a473d39ce1e
	.xword	0x3bf591042388048a
	.xword	0xa642827be810808f
	.xword	0x6a9226dde2accb0e
	.xword	0x5957b3dc0bb0c765
	.xword	0x010e84c38e1a7456
	.xword	0xa48da7854a10b536
	.xword	0xcbacc7ba3fb0c8df
	.xword	0x11edd83f5d17ce44
	.xword	0x1f4c4150b02f40aa
	.xword	0x6637d01362ff95dc
	.xword	0x504fdf9fd1ecb389
	.xword	0xfa8b13942f7670aa
	.xword	0x39402d3a24414ba5
	.xword	0x266f48be24cbd833
	.xword	0xa57bd96f746b0386
	.xword	0xdd840a94dca88ea4
	.xword	0x2f03569949e587c2
	.xword	0xa9af665cafa9d18b
	.xword	0xb585a1c712209c7e
	.xword	0x85293c0661279ccf
	.xword	0xc96f437ecbe72d45
	.xword	0x853c6ea917cce92a
	.xword	0xce2e9173e6dae293
	.xword	0x4cc0785ca93110f0
	.xword	0x292dac70deeaedfa
	.xword	0x4255163243db732f
	.xword	0x551ed534143beadb
	.xword	0xe0c463287593c754
	.xword	0x62060875b41b75a3
	.xword	0x3a7d85a37834e186
	.xword	0xa893aac0b6efafd6
	.xword	0xb8deb9b96c071bd3
	.xword	0x64ce7686e3e13a26
	.xword	0x19184d62656a83e6
	.xword	0x6499c0ff06506107
	.xword	0xca108c45f4133999
	.xword	0xcdaf2acb066c306f
	.xword	0x2e554601d1c8c88f
	.xword	0xd9cbc9ff52e38e13
	.xword	0xa6495de467bfc2aa
	.xword	0xc2cd144a5d2b6c0f
	.xword	0x1b58f7adc8fdbf0e
	.xword	0xebf17500c47bb125
	.xword	0xedf0049622821178
	.xword	0xb4fe2baec6a25228
	.xword	0xabb318a4bd8571e8
	.xword	0x6f1c04f6de9faf2e
	.xword	0x59818024ef190aad
	.xword	0x025b03ef39dd1b4d
	.xword	0xbf1170f811e6a71b
	.xword	0x379504e68c4290ed
	.xword	0x9c0d1833b309ba2c
	.xword	0xdcc46f1692774cc1
	.xword	0xa12337514026453b
	.xword	0xf1589a706ea4c9bb
	.xword	0x7f13d0da80cb789d
	.xword	0x77dcc6352174ee83
	.xword	0x22e3e7988512cf9d
	.xword	0xf92ca3f4032f077d
	.xword	0xbf64e0d364dced16
	.xword	0xc13ab168ce390bce
	.xword	0x0010181a263ed85b
	.xword	0x185b13136ffacad6



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
	.xword	0xde7aeebe201301f0
	.xword	0xd8cc4a51f176fdca
	.xword	0xba78263eb8bd8705
	.xword	0xcaad6e5f19783bf0
	.xword	0x2596d3c0da4e370b
	.xword	0xa1f111c05c1868b4
	.xword	0x5022c866637675b2
	.xword	0xf39c9f9a65254717
	.xword	0x0f2ef1f8367a4da9
	.xword	0x4a43643136a1cea5
	.xword	0x622e76a2821643b3
	.xword	0xdfe2dc7702c47387
	.xword	0xf285a63a82568aa8
	.xword	0x07113ab4ec53d1ae
	.xword	0xf8471bdb177f7bc8
	.xword	0xa542947d1ddcd88e
	.xword	0x1cecfc947429ee7d
	.xword	0x6fb85e8ca370d60d
	.xword	0x281149efff2c826f
	.xword	0x1b12fd783fc2119a
	.xword	0xdf4aa68ba1677882
	.xword	0x88ab9ccd681dc1c0
	.xword	0x33a15552acdabd62
	.xword	0xcdbe62516e75aa34
	.xword	0x1b9eec34801e0530
	.xword	0x1e274bcc60c72144
	.xword	0x5998092cbb35e719
	.xword	0x2d8277580fb93e96
	.xword	0x8d368ef3b437a637
	.xword	0x607573840b9ee7fa
	.xword	0x6098c397cdd14cf3
	.xword	0x27e61c600379ae88
	.xword	0x9c3a09e3c43fba11
	.xword	0x099f2f71695008de
	.xword	0xe994e93c2e3091f1
	.xword	0x02d0401830c02fe4
	.xword	0x69c8c8cadee33e6d
	.xword	0x9a491b2d51128c55
	.xword	0xb91661a633eda0cd
	.xword	0xc6d729d9b6cb281c
	.xword	0xba293cf75d30e17f
	.xword	0xc4b2ae16485285b0
	.xword	0x9f79d2f0bb0ca897
	.xword	0x94f79b8d83ecde27
	.xword	0x410be0f577728765
	.xword	0x60d51ad4f85b3795
	.xword	0xb36bc8aa399ece5d
	.xword	0x9062fcfceaec3af0
	.xword	0x5ed6571bec671095
	.xword	0x55abdab2b7345862
	.xword	0x6433923880b1fec5
	.xword	0x78be652170d2559d
	.xword	0x2b12802668017883
	.xword	0x4905068faa62e481
	.xword	0x2603e7dba69c15a6
	.xword	0xd162a4054e1a75d9
	.xword	0x5b88b4e9a528ee31
	.xword	0x37c87197c20d4f64
	.xword	0xa160345573d4bae7
	.xword	0x9d2de9e72ac93b4d
	.xword	0xe565dcbc906f85ec
	.xword	0x711e1dcd3d247791
	.xword	0xa15591c36f04e17a
	.xword	0x43240ce0bb346037
	.xword	0x2fc214d0969733c8
	.xword	0x595b4b263bebb5e4
	.xword	0x263ca310a8798736
	.xword	0x09eb05e42be51676
	.xword	0x43d866a8536b50e6
	.xword	0xf59548296211a271
	.xword	0x9f61d7259e6a3efb
	.xword	0xcd552eea9e831019
	.xword	0xad4bc712239c5895
	.xword	0xdb63f2dc619e34f3
	.xword	0xf9e8d3220aae9cd1
	.xword	0xcbc4a54362583ad0
	.xword	0xf524d3baee59471a
	.xword	0xe4d187692b60031c
	.xword	0x2000330b7a15ba47
	.xword	0x6d8f0241bdd73e83
	.xword	0x070af64f30658410
	.xword	0x71b3e7246c2b0daf
	.xword	0x12a6d8503699c6fa
	.xword	0x50207093bde56955
	.xword	0xe9d9ba63bae40bd4
	.xword	0x44c6ef3567c2482f
	.xword	0x41b9c23fdbaa0fe5
	.xword	0x0e1d75c2c7e553b6
	.xword	0x0ce74eb699fc6319
	.xword	0x8821bd9f34e045a7
	.xword	0x6d793b3b23f7be4a
	.xword	0xfce3a8d069c85dff
	.xword	0x029a280ff2ee65c8
	.xword	0x0dec2a37ce4e775e
	.xword	0x987208403b97c60f
	.xword	0xb7a065b97c8dce34
	.xword	0x6e35820541d5d977
	.xword	0x2da2fb6069fe8dc9
	.xword	0x32a0b05afac84a6d
	.xword	0xe34d19ad88ef1dee
	.xword	0x649300cb6d9d45c2
	.xword	0x2a12487d48892c97
	.xword	0xe00b36a4ff3ecb08
	.xword	0xa10b978d891afe09
	.xword	0x5356f9d056547973
	.xword	0x7352d889f6573886
	.xword	0x3a3a6d3027a8559d
	.xword	0xe4e9c7a838372105
	.xword	0x0bc5fa56a383c568
	.xword	0xf697245df3cc66c2
	.xword	0x65ed2c807dd3839c
	.xword	0x76311d850e65109c
	.xword	0x809dc17489481236
	.xword	0x4374788a9fdd914c
	.xword	0xcdf414295a587626
	.xword	0xebc426249a150477
	.xword	0x77f6cf5e9520f099
	.xword	0xc420c9d90f5d6252
	.xword	0xe25bedc9002c46aa
	.xword	0xfbb0d3ff19fe0935
	.xword	0x6bb101c7864841de
	.xword	0xa92f95578252645b
	.xword	0x69dbdfa2e31bc357
	.xword	0xa575e578ee887243
	.xword	0x3e9165343b008428
	.xword	0x0f02864258da0511
	.xword	0xf58db4db319cec7d
	.xword	0x494e625525f5eb64
	.xword	0x06422d54133b12bb
	.xword	0xd7f038890fc7efc7
	.xword	0x1644197cdcaaf1d3
	.xword	0x6b8012c59981656a
	.xword	0xfccba0ceebfc3dfc
	.xword	0xd18abccd47077c72
	.xword	0xcf910e9a698d210b
	.xword	0x8c244b24bca9c15d
	.xword	0xa8cb43cbc4fa03ae
	.xword	0x455a70875569b19b
	.xword	0x176e46be4b5c90a9
	.xword	0xc0291b5e927a1693
	.xword	0x3feb293c711e1975
	.xword	0xae1fde01b85e4582
	.xword	0x7f69def94fbb26e6
	.xword	0x6af22f4c79b450c9
	.xword	0xaf561147a4e94b54
	.xword	0x42a0f4007e86c592
	.xword	0x8bfc2836bb18c1ce
	.xword	0x65eb40fd196c8aa8
	.xword	0x1b8c345c416ea40e
	.xword	0x07b58656b6e1a4c3
	.xword	0xbc4b3d2496500266
	.xword	0x4d0e739a0ecb5c39
	.xword	0xc4c0a778ad359687
	.xword	0x02b54244a5d4f5a3
	.xword	0x68540ebca65aa25e
	.xword	0x451ab0762bd50da4
	.xword	0x780b4c8b782c7c3a
	.xword	0xba752018721e9e23
	.xword	0x1b85aeee35f69d9b
	.xword	0xf69473ff358493c0
	.xword	0x4d779227c8204315
	.xword	0x159148d0712c6f57
	.xword	0xe05850038fff49ac
	.xword	0x3f9c45688e8063ed
	.xword	0xb18ef77ee33708b4
	.xword	0xcebcd0ef74b3821d
	.xword	0x8ce531b6876e15b2
	.xword	0x0b5a8443d828ba24
	.xword	0x805c3e535942cd0d
	.xword	0xcfae386b7b010cd7
	.xword	0xd92a6c2c1e637105
	.xword	0x441c5a949dda81d2
	.xword	0xc809c2f57262874a
	.xword	0xecbb6173febd694b
	.xword	0xb979c5028ed2f8fc
	.xword	0xab7eb4f46c2438b7
	.xword	0xbfec7a05ae2375a0
	.xword	0xf885157c722fd5fd
	.xword	0x5eeba84c91102f51
	.xword	0xf96fd9ac4bb68904
	.xword	0x0c815a5aa45b423d
	.xword	0xdf3453b2b72cbd8a
	.xword	0x5b46a95ffea0d05c
	.xword	0xe681624aeefad229
	.xword	0x529895d10ca5351b
	.xword	0x731adb48d3394239
	.xword	0xb334ac0744e27943
	.xword	0x049df6e92a63b18d
	.xword	0xe82fe67e3e532dbb
	.xword	0xad5dc400f0347bb3
	.xword	0x41eee6e4021b71b2
	.xword	0x06f1ff20f2824141
	.xword	0x1f70eacd6305dc05
	.xword	0x2e1b9770af95bbdc
	.xword	0x3041f305070dfd66
	.xword	0x9d990eddfc9ef2a7
	.xword	0xf652f1519a9842d2
	.xword	0xa71244e69a08576f
	.xword	0xd10e835ff42bce60
	.xword	0x580d617c9d04d58e
	.xword	0x5a3a6f15f93197b9
	.xword	0x1f73ca7d25eec283
	.xword	0xf20705f3617915f1
	.xword	0x9f214023e8318933
	.xword	0x9b5e583a72bb1662
	.xword	0x9216ac0a7d2498d3
	.xword	0xe1b802520e8c3c73
	.xword	0x2cb2d7f0c73ba330
	.xword	0x5982cf64eb65a9da
	.xword	0xd533c32785eed3e7
	.xword	0x7d041a35b8f6889a
	.xword	0xc5535543ec540607
	.xword	0x2a859d555bfb3592
	.xword	0x439cee636e4ade08
	.xword	0x0182c78008a43621
	.xword	0x510c6e763dcf1610
	.xword	0xd1273993216b4733
	.xword	0xf1883496c6fd8392
	.xword	0x5c963d85e116fb0a
	.xword	0x52615f85ff564c2b
	.xword	0x6e7168ba4c77d66a
	.xword	0xe15b282b8a3d8743
	.xword	0x0359754870665b92
	.xword	0x0502a6f7888a0f65
	.xword	0x6382602159a92367
	.xword	0xfb5994fdcf94456f
	.xword	0xaae25a3518919924
	.xword	0xbd862b18ab4bf578
	.xword	0x261f69d572b378ea
	.xword	0xb57da91886499152
	.xword	0x940def779a465077
	.xword	0x76a941bfa4b96517
	.xword	0x66beb13ecf3cdca7
	.xword	0x4cc59e6569f2b3ec
	.xword	0xe6829843689bcb3f
	.xword	0x5c0366ddd7ae938a
	.xword	0x2bed6866e942bb48
	.xword	0xf723517982255263
	.xword	0x50b134ce86ef3130
	.xword	0xd952b0d7119e1ab0
	.xword	0x74a5c1049e0c27be
	.xword	0xaee010dea9ebfa01
	.xword	0xef3dcee06a088f57
	.xword	0x26f1e3ebc3c3305e
	.xword	0xfa7b05a01637ea5d
	.xword	0x7a16620b7fbdab28
	.xword	0x26e61362fe2e7810
	.xword	0x2fd8b5e1e94b7b03
	.xword	0x2f13c9c18400052d
	.xword	0xfdfe60e3ce480851
	.xword	0x62c9c4cd1f064a6f
	.xword	0x97fefdde0699997d
	.xword	0x83002c43dfe83ca6
	.xword	0x72fe79d757a32a94
	.xword	0xb4554868be846b05
	.xword	0xc3518b4fa31ce691



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
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 102, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 104, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 105, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 111, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 112, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 116, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 125, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 134, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 138, Rv_memaddr_pattern,
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
!!#   IJ_set_rvar ("diag.j", 154, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1110 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 168, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 181, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 193, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 205, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 217, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 239, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 250, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 258, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  // BASE
!!#   IJ_set_ropr_fld    ("diag.j", 267, ijdefault, Ft_Rs1, "{6,7,10,11,12,13,14}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 268, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   !IJ_set_ropr_fld    (Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 271, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 274, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 275, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 278, th_M, 0x1);
!!#   IJ_bind_thread_group("diag.j", 279, th_all, 0xffffffff); ! 8 cores 4 threads
!!#   IJ_init_regs_by_setx ("diag.j", 280, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 281, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 285, th_M, "\tta\t0x30\n");
!!#   IJ_printf ("diag.j", 286, th_M, "\tmov\t0,\%%g4 \n");
!!#   IJ_printf ("diag.j", 287, th_M, "\tsetx\tncdata_base0, %%g1, %%g2 \n");
!!#   IJ_printf ("diag.j", 288, th_M, "\tsetx\t0x1000, %%g1, %%g3 \n");
!!#   IJ_printf ("diag.j", 289, th_M, "\tadd\t\%%g2, \%%g3, \%%g3 \n");
!!# 
!!#   IJ_printf ("diag.j", 292, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 293, th_M, "\tsetx    ncdata_base1, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 294, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 295, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 296, th_M, "\tsetx 0x7766554433221100, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 297, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 298, th_M, "\t!add 0x0, %%g0, %%g2\n");
!!#   IJ_printf ("diag.j", 299, th_M, "\tadd 0x020, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 300, th_M, "\t!setx 0x800e000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 301, th_M, "\tstloop0:\n");
!!#   IJ_printf ("diag.j", 302, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 303, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 304, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 305, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 306, th_M, "\tbne stloop0\n");
!!#   IJ_printf ("diag.j", 307, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 308, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx    user_data_start, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 311, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 312, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 313, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 314, th_M, "\tdstloop6:\n");
!!#   IJ_printf ("diag.j", 315, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 316, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 317, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 318, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 319, th_M, "\tbne dstloop6\n");
!!#   IJ_printf ("diag.j", 320, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 321, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 322, th_M, "\tsetx    ncdata_base0, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 323, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 324, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 325, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 326, th_M, "\t!add 0x1, %%g0, %%g2\n");
!!#   IJ_printf ("diag.j", 327, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 328, th_M, "\t! FAKE DMA space\n");
!!#   IJ_printf ("diag.j", 329, th_M, "\t!setx 0x8010000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 330, th_M, "\tstloop1:\n");
!!#   IJ_printf ("diag.j", 331, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 332, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 333, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 334, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 335, th_M, "\tbne stloop1\n");
!!#   IJ_printf ("diag.j", 336, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 337, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 338, th_M, "\tsetx    ncdata_base2, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 339, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 340, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 341, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 342, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 343, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 344, th_M, "\t!setx 0x800f000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 345, th_M, "\tstloop2:\n");
!!#   IJ_printf ("diag.j", 346, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 347, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 348, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 349, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 350, th_M, "\tbne stloop2\n");
!!#   IJ_printf ("diag.j", 351, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 352, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 353, th_M, "\tsetx    ncdata_base3, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 354, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 355, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 356, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 357, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 358, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 359, th_M, "\t!setx 0xc000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 360, th_M, "\tstloop3:\n");
!!#   IJ_printf ("diag.j", 361, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 362, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 363, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 364, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 365, th_M, "\tbne stloop3\n");
!!#   IJ_printf ("diag.j", 366, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 367, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 368, th_M, "\tsetx    ncdata_base4, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 369, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 370, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 371, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 372, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 373, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 374, th_M, "\t!setx 0xd000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 375, th_M, "\tstloop4:\n");
!!#   IJ_printf ("diag.j", 376, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 377, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 378, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 379, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 380, th_M, "\tbne stloop4\n");
!!#   IJ_printf ("diag.j", 381, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 382, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 383, th_M, "\tsetx    ncdata_base5, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 384, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 385, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 386, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 387, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 388, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 389, th_M, "\t!setx 0xe000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 390, th_M, "\tstloop5:\n");
!!#   IJ_printf ("diag.j", 391, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 392, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 393, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 394, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 395, th_M, "\tbne stloop5\n");
!!#   IJ_printf ("diag.j", 396, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 397, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 398, th_M, "\tsetx    ncdata_base6, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 399, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 400, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 401, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 402, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 403, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 404, th_M, "\t!setx 0xf000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 405, th_M, "\tstloop6:\n");
!!#   IJ_printf ("diag.j", 406, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 407, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 408, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 409, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 410, th_M, "\tbne stloop6\n");
!!#   IJ_printf ("diag.j", 411, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 412, th_M, "\tmembar 0x40\n");
!!#   IJ_printf ("diag.j", 413, th_M, "\twr    %%g0, 7, %%fprs\n");
!!#   IJ_printf ("diag.j", 414, th_M, "\tldda [%%g3]ASI_BLK_P, %%f0\n");
!!# 
!!#   IJ_printf ("diag.j", 418, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 419, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 420, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 421, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 422, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 423, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 424, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
!!# 
!!#   IJ_th_fork_group("diag.j", 426, th_all);
!!# 
!!#   IJ_bind_file_group("diag.j", 429, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 430, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_printf ("diag.j", 434, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 435, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 436, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 438, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 440, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 441, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 443, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 444, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 445, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 446, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 448, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 449, sjm_5, "\n\nLABEL_0:\n");
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
!!#   IJ_printf ("diag.j", 482, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 483, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 488,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 490,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 495,Seq_Start, NULL, 2);
!!#   IJ_th_join_group("diag.j", 496, th_all);
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
!!# 		IJ_generate ("diag.j", 780, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# ;
!!# 
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io 
!!# ;
!!# 
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 803, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 806, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 808, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 809, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 813, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 814, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 815, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 816, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 818, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 819, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 832, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 837, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 841, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 842, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 844, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 845, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 859, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 863, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 864, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 881, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 886, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 887, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 889, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 890, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 892, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 893, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 898, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 899, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 901, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 902, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 919, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 922, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 924, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 925, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 929, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 930, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 931, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 932, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 934, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 935, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 948, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 953, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 957, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 958, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 960, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 961, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 976, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 979, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 981, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 982, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 997, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1000, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1001, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1002, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1007, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1009, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1023, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1029, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1033, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1048, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1050, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1052, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1058, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1059, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1086, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1092, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1093, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1096, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1098, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1107, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1109, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1127, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1133, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1138, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1140, sjm_4, "\n");
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
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io 
!!# ;
!!# 
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1158, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1161, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1163, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1164, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1167, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1168, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1169, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1170, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1172, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1173, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1186, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1191, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1195, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1196, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1198, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1199, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1213, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1217, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1218, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1235, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1240, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1241, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1243, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1244, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1246, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1247, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1252, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1253, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1255, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1256, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1273, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1276, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1278, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1279, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1283, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1284, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1285, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1286, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1288, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1289, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1302, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1307, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1311, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1312, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1314, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1315, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1331, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1334, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1336, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1337, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1352, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1355, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1356, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1357, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1362, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1364, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1378, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1384, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1388, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1405, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1407, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1413, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1414, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1441, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1447, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1448, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1451, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1453, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1462, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1464, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1482, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1488, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1493, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1495, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1551, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1553, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1555, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1557, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1559, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1561, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1563, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1566, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1568, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1570, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1572, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1574, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1576, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1578, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1585, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1587, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1589, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1591, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1593, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1595, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1597, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1600, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1602, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1604, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1606, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1608, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1610, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1612, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
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
!!#                         case 0 : IJ_printf ("diag.j", 1625, th_all, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1626, th_all, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1627, th_all, "\tldda\t[%%r14]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1628, th_all, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1629, th_all, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1630, th_all, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1631, th_all, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1632, th_all, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1634, th_all, "\tmembar\t 0x40\n");
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
!!#                         case 0 : IJ_printf ("diag.j", 1645, th_all, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1646, th_all, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1647, th_all, "\tstda\t %%f0, [%%r14]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1648, th_all, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1649, th_all, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1650, th_all, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1651, th_all, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1652, th_all, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1654, th_all, "\tmembar\t 0x40\n");
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
