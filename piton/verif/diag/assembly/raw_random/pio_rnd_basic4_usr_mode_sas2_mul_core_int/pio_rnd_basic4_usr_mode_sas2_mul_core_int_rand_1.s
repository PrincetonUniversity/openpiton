// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas2_mul_core_int_rand_1.s
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
   random seed:	436673048
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

	setx 0x1351ecd87790a472, %g1, %g0
	setx 0x7ce35cafcb103841, %g1, %g1
	setx 0x7f62726a889dba1e, %g1, %g2
	setx 0x26ab71ce219281fd, %g1, %g3
	setx 0xca23be9988e1e771, %g1, %g4
	setx 0xade8e030ebf67a90, %g1, %g5
	setx 0xbbf63f02290046f5, %g1, %g6
	setx 0x7bf76f4214ab4692, %g1, %g7
	setx 0xff859ccbc0dbf503, %g1, %r16
	setx 0x3eb5f8f99b7180a2, %g1, %r17
	setx 0x6ccf0ebe2f883c1c, %g1, %r18
	setx 0x25a5038c495b9305, %g1, %r19
	setx 0xe5563e275b497988, %g1, %r20
	setx 0x4b9296244f8b6644, %g1, %r21
	setx 0xe2ece26a2efd13c8, %g1, %r22
	setx 0x0e0ee49811d323aa, %g1, %r23
	setx 0x5685a5a56afef337, %g1, %r24
	setx 0x3710c9c4d326dde1, %g1, %r25
	setx 0x14b478cb2c253aca, %g1, %r26
	setx 0xd391e658a6c2a5d8, %g1, %r27
	setx 0x36301821683dbd52, %g1, %r28
	setx 0xeceda96327bab573, %g1, %r29
	setx 0x5a76e815bcc34f8a, %g1, %r30
	setx 0xfbbe392f940bc97f, %g1, %r31
	save
	setx 0xb278ec9ef2c02850, %g1, %r16
	setx 0x3347e6dcccf80e8c, %g1, %r17
	setx 0x9602ce9b6c3b14ad, %g1, %r18
	setx 0xd6dbdca9b973e66d, %g1, %r19
	setx 0xa9f52f1557878e04, %g1, %r20
	setx 0xd3b34677dd5c576d, %g1, %r21
	setx 0xe667f92179575ab0, %g1, %r22
	setx 0xaa9fcdef46b4ea71, %g1, %r23
	setx 0xaca5a33055a567cf, %g1, %r24
	setx 0xcd329571bd297c71, %g1, %r25
	setx 0x47b52d5a7b4aab34, %g1, %r26
	setx 0x9bf3cd3d86e4c790, %g1, %r27
	setx 0x983caa4490e34b40, %g1, %r28
	setx 0xa5d0167b5a97f150, %g1, %r29
	setx 0x482c5f1ba21ac534, %g1, %r30
	setx 0xa7deca370f603a3e, %g1, %r31
	save
	setx 0x3ccb4310b8ffd26e, %g1, %r16
	setx 0xdcdd366aab784ff8, %g1, %r17
	setx 0x3c1d0b6e41f8c81a, %g1, %r18
	setx 0x584c5d3d7ab0d0a8, %g1, %r19
	setx 0x737e4af0e4a107cc, %g1, %r20
	setx 0x7614cbc4b77451d5, %g1, %r21
	setx 0x9d43b21725d390ab, %g1, %r22
	setx 0x7d310eb9fe197b6b, %g1, %r23
	setx 0x6c3d879c8b2ad7f6, %g1, %r24
	setx 0x6a8846225135095b, %g1, %r25
	setx 0x73df7fd147699130, %g1, %r26
	setx 0x6fbcfeddff6399d0, %g1, %r27
	setx 0x7b9c67ed76e86d4d, %g1, %r28
	setx 0x2661f973ebff9b71, %g1, %r29
	setx 0xb08b5bd6acecf4c7, %g1, %r30
	setx 0x795d8938b4d5597f, %g1, %r31
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
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
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
	.word 0xec23a030  ! 1: STW_I	stw	%r22, [%r14 + 0x0030]
	.word 0xe031c008  ! 5: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe0432000  ! 7: LDSW_I	ldsw	[%r12 + 0x0000], %r16
	.word 0xe41ba030  ! 8: LDD_I	ldd	[%r14 + 0x0030], %r18
	.word 0xe02b0008  ! 9: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec336030  ! 12: STH_I	sth	%r22, [%r13 + 0x0030]
	.word 0xe419e030  ! 14: LDD_I	ldd	[%r7 + 0x0030], %r18
	.word 0xe02ae010  ! 15: STB_I	stb	%r16, [%r11 + 0x0010]
	.word 0xe45ac008  ! 28: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe071a008  ! 29: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xec4b0008  ! 32: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe4718008  ! 34: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe01b0008  ! 38: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xec3aa008  ! 39: STD_I	std	%r22, [%r10 + 0x0008]
	.word 0xe809c008  ! 40: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xa4238008  ! 41: SUB_R	sub 	%r14, %r8, %r18
	.word 0xe05ac008  ! 50: LDX_R	ldx	[%r11 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe859e020  ! 64: LDX_I	ldx	[%r7 + 0x0020], %r20
	.word 0xe4728008  ! 68: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec4b6010  ! 70: LDSB_I	ldsb	[%r13 + 0x0010], %r22
	.word 0xe029a018  ! 72: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xec29c008  ! 73: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe85a8008  ! 74: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe071a008  ! 79: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe00a8008  ! 81: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe059c008  ! 91: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe00ac008  ! 92: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe0498008  ! 94: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe0738008  ! 97: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xac93a038  ! 101: ORcc_I	orcc 	%r14, 0x0038, %r22
	.word 0xec1b6038  ! 103: LDD_I	ldd	[%r13 + 0x0038], %r22
	.word 0xe83ae018  ! 104: STD_I	std	%r20, [%r11 + 0x0018]
	.word 0xe0018008  ! 105: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe4532010  ! 107: LDSH_I	ldsh	[%r12 + 0x0010], %r18
	.word 0xe43b4008  ! 108: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe8530008  ! 109: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xec29e018  ! 110: STB_I	stb	%r22, [%r7 + 0x0018]
	.word 0xe02b0008  ! 113: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec236000  ! 115: STW_I	stw	%r22, [%r13 + 0x0000]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xec11c008  ! 118: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xe821c008  ! 119: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe43b4008  ! 121: STD_R	std	%r18, [%r13 + %r8]
	.word 0xec71c008  ! 126: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe4138008  ! 130: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe0432010  ! 143: LDSW_I	ldsw	[%r12 + 0x0010], %r16
	.word 0xe85b2008  ! 145: LDX_I	ldx	[%r12 + 0x0008], %r20
	.word 0xe8218008  ! 148: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe8530008  ! 152: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xe81ba028  ! 155: LDD_I	ldd	[%r14 + 0x0028], %r20
	.word 0xe0138008  ! 159: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec31e008  ! 160: STH_I	sth	%r22, [%r7 + 0x0008]
	.word 0xe0518008  ! 164: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe051a038  ! 165: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xe04b6028  ! 166: LDSB_I	ldsb	[%r13 + 0x0028], %r16
	.word 0xe8018008  ! 167: LDUW_R	lduw	[%r6 + %r8], %r20
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe02ba020  ! 169: STB_I	stb	%r16, [%r14 + 0x0020]
	.word 0xe431c008  ! 172: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe0098008  ! 177: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe42a8008  ! 186: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe0338008  ! 187: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe0532030  ! 189: LDSH_I	ldsh	[%r12 + 0x0030], %r16
	.word 0xe041a000  ! 191: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe441c008  ! 193: LDSW_R	ldsw	[%r7 + %r8], %r18
	.word 0xe039e018  ! 196: STD_I	std	%r16, [%r7 + 0x0018]
	.word 0xec02e018  ! 198: LDUW_I	lduw	[%r11 + 0x0018], %r22
	.word 0xe02b0008  ! 199: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe801a028  ! 201: LDUW_I	lduw	[%r6 + 0x0028], %r20
	.word 0xe0332038  ! 202: STH_I	sth	%r16, [%r12 + 0x0038]
	.word 0xec3aa030  ! 205: STD_I	std	%r22, [%r10 + 0x0030]
	.word 0xe011a000  ! 206: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xe403a020  ! 207: LDUW_I	lduw	[%r14 + 0x0020], %r18
	.word 0xe42b0008  ! 210: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xec736038  ! 212: STX_I	stx	%r22, [%r13 + 0x0038]
	.word 0xe822c008  ! 215: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe053a018  ! 217: LDSH_I	ldsh	[%r14 + 0x0018], %r16
	.word 0xe0734008  ! 218: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe4118008  ! 219: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe05a8008  ! 221: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe8228008  ! 222: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe829a028  ! 223: STB_I	stb	%r20, [%r6 + 0x0028]
	.word 0xe03b4008  ! 226: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe019a018  ! 228: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xe84b6028  ! 229: LDSB_I	ldsb	[%r13 + 0x0028], %r20
	.word 0xe823a028  ! 230: STW_I	stw	%r20, [%r14 + 0x0028]
	.word 0xe439e018  ! 231: STD_I	std	%r18, [%r7 + 0x0018]
	.word 0xe4498008  ! 235: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe029c008  ! 237: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec232010  ! 238: STW_I	stw	%r22, [%r12 + 0x0010]
	.word 0xe4728008  ! 241: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe4598008  ! 244: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xec432020  ! 246: LDSW_I	ldsw	[%r12 + 0x0020], %r22
	.word 0xe031e018  ! 247: STH_I	sth	%r16, [%r7 + 0x0018]
	.word 0xec434008  ! 253: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe451a028  ! 255: LDSH_I	ldsh	[%r6 + 0x0028], %r18
	.word 0xe4430008  ! 258: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xec3a8008  ! 262: STD_R	std	%r22, [%r10 + %r8]
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe80b2038  ! 266: LDUB_I	ldub	[%r12 + 0x0038], %r20
	.word 0xe449e038  ! 267: LDSB_I	ldsb	[%r7 + 0x0038], %r18
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe019a010  ! 271: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xe001a038  ! 276: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xe45b2038  ! 278: LDX_I	ldx	[%r12 + 0x0038], %r18
	.word 0xe03aa020  ! 283: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xe032e010  ! 285: STH_I	sth	%r16, [%r11 + 0x0010]
	.word 0xe4298008  ! 287: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe439e018  ! 288: STD_I	std	%r18, [%r7 + 0x0018]
	.word 0xe05b2028  ! 294: LDX_I	ldx	[%r12 + 0x0028], %r16
	.word 0xe8198008  ! 295: LDD_R	ldd	[%r6 + %r8], %r20
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
	.word 0xe82b2028  ! 1: STB_I	stb	%r20, [%r12 + 0x0028]
	.word 0xe432e028  ! 5: STH_I	sth	%r18, [%r11 + 0x0028]
	.word 0xe00ac008  ! 7: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xec5b0008  ! 8: LDX_R	ldx	[%r12 + %r8], %r22
	.word 0xe831a000  ! 9: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xe4232030  ! 12: STW_I	stw	%r18, [%r12 + 0x0030]
	.word 0xe049c008  ! 14: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe8232010  ! 15: STW_I	stw	%r20, [%r12 + 0x0010]
	.word 0xe4028008  ! 28: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe03b4008  ! 29: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe40b0008  ! 32: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xec29a020  ! 34: STB_I	stb	%r22, [%r6 + 0x0020]
	.word 0xe0518008  ! 38: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe023a038  ! 39: STW_I	stw	%r16, [%r14 + 0x0038]
	.word 0xe81b4008  ! 40: LDD_R	ldd	[%r13 + %r8], %r20
	.word 0xa0228008  ! 41: SUB_R	sub 	%r10, %r8, %r16
	.word 0xe8118008  ! 50: LDUH_R	lduh	[%r6 + %r8], %r20
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec11c008  ! 64: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xec32a008  ! 68: STH_I	sth	%r22, [%r10 + 0x0008]
	.word 0xe043a020  ! 70: LDSW_I	ldsw	[%r14 + 0x0020], %r16
	.word 0xe829a010  ! 72: STB_I	stb	%r20, [%r6 + 0x0010]
	.word 0xe872e030  ! 73: STX_I	stx	%r20, [%r11 + 0x0030]
	.word 0xe01b4008  ! 74: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xec72c008  ! 79: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec51a020  ! 81: LDSH_I	ldsh	[%r6 + 0x0020], %r22
	.word 0xe40aa030  ! 91: LDUB_I	ldub	[%r10 + 0x0030], %r18
	.word 0xe049e038  ! 92: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	.word 0xec118008  ! 94: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe832a008  ! 97: STH_I	sth	%r20, [%r10 + 0x0008]
	.word 0xa4b1a018  ! 101: ORNcc_I	orncc 	%r6, 0x0018, %r18
	.word 0xec198008  ! 103: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe03ae028  ! 104: STD_I	std	%r16, [%r11 + 0x0028]
	.word 0xe8036000  ! 105: LDUW_I	lduw	[%r13 + 0x0000], %r20
	.word 0xe0038008  ! 107: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xec31e010  ! 108: STH_I	sth	%r22, [%r7 + 0x0010]
	.word 0xe002a030  ! 109: LDUW_I	lduw	[%r10 + 0x0030], %r16
	.word 0xe43ae038  ! 110: STD_I	std	%r18, [%r11 + 0x0038]
	.word 0xe871a010  ! 113: STX_I	stx	%r20, [%r6 + 0x0010]
	.word 0xec39a020  ! 115: STD_I	std	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe0098008  ! 118: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe4338008  ! 119: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xec72a038  ! 121: STX_I	stx	%r22, [%r10 + 0x0038]
	.word 0xe071e008  ! 126: STX_I	stx	%r16, [%r7 + 0x0008]
	.word 0xe05b0008  ! 130: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe402e020  ! 143: LDUW_I	lduw	[%r11 + 0x0020], %r18
	.word 0xe45b6000  ! 145: LDX_I	ldx	[%r13 + 0x0000], %r18
	.word 0xe0728008  ! 148: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe049a018  ! 152: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xe8518008  ! 155: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe009e038  ! 159: LDUB_I	ldub	[%r7 + 0x0038], %r16
	.word 0xe8228008  ! 160: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xec5ac008  ! 164: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe45b6020  ! 165: LDX_I	ldx	[%r13 + 0x0020], %r18
	.word 0xe84b6018  ! 166: LDSB_I	ldsb	[%r13 + 0x0018], %r20
	.word 0xec41e000  ! 167: LDSW_I	ldsw	[%r7 + 0x0000], %r22
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe031e030  ! 169: STH_I	sth	%r16, [%r7 + 0x0030]
	.word 0xe4718008  ! 172: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe4528008  ! 177: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xe4734008  ! 186: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe0218008  ! 187: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec43a000  ! 189: LDSW_I	ldsw	[%r14 + 0x0000], %r22
	.word 0xe449c008  ! 191: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe001c008  ! 193: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xec31c008  ! 196: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xec1b0008  ! 198: LDD_R	ldd	[%r12 + %r8], %r22
	.word 0xec730008  ! 199: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe04aa020  ! 201: LDSB_I	ldsb	[%r10 + 0x0020], %r16
	.word 0xe431c008  ! 202: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe03b4008  ! 205: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe001c008  ! 206: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xec1ba030  ! 207: LDD_I	ldd	[%r14 + 0x0030], %r22
	.word 0xe02b4008  ! 210: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe072a038  ! 212: STX_I	stx	%r16, [%r10 + 0x0038]
	.word 0xe4228008  ! 215: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe411e008  ! 217: LDUH_I	lduh	[%r7 + 0x0008], %r18
	.word 0xe4330008  ! 218: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe0434008  ! 219: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe019c008  ! 221: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe0234008  ! 222: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe8298008  ! 223: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xec72c008  ! 226: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe00b4008  ! 228: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe0028008  ! 229: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe029a018  ! 230: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xec3b6030  ! 231: STD_I	std	%r22, [%r13 + 0x0030]
	.word 0xe81a8008  ! 235: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xe8232018  ! 237: STW_I	stw	%r20, [%r12 + 0x0018]
	.word 0xec718008  ! 238: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe821e018  ! 241: STW_I	stw	%r20, [%r7 + 0x0018]
	.word 0xe85b2008  ! 244: LDX_I	ldx	[%r12 + 0x0008], %r20
	.word 0xe441a028  ! 246: LDSW_I	ldsw	[%r6 + 0x0028], %r18
	.word 0xe0728008  ! 247: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe009a000  ! 253: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe811a018  ! 255: LDUH_I	lduh	[%r6 + 0x0018], %r20
	.word 0xe00b4008  ! 258: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xec3ae018  ! 262: STD_I	std	%r22, [%r11 + 0x0018]
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe0518008  ! 266: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe4118008  ! 267: LDUH_R	lduh	[%r6 + %r8], %r18
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe8138008  ! 271: LDUH_R	lduh	[%r14 + %r8], %r20
	.word 0xec02e010  ! 276: LDUW_I	lduw	[%r11 + 0x0010], %r22
	.word 0xec130008  ! 278: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe02aa010  ! 283: STB_I	stb	%r16, [%r10 + 0x0010]
	.word 0xe0298008  ! 285: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe03ae000  ! 287: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xe429a000  ! 288: STB_I	stb	%r18, [%r6 + 0x0000]
	.word 0xe042e000  ! 294: LDSW_I	ldsw	[%r11 + 0x0000], %r16
	.word 0xe042c008  ! 295: LDSW_R	ldsw	[%r11 + %r8], %r16
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
	.word 0xe0318008  ! 1: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe0334008  ! 5: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec4ba030  ! 7: LDSB_I	ldsb	[%r14 + 0x0030], %r22
	.word 0xec498008  ! 8: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe422c008  ! 9: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xec3ae000  ! 12: STD_I	std	%r22, [%r11 + 0x0000]
	.word 0xe04b6038  ! 14: LDSB_I	ldsb	[%r13 + 0x0038], %r16
	.word 0xe472a018  ! 15: STX_I	stx	%r18, [%r10 + 0x0018]
	.word 0xec51c008  ! 28: LDSH_R	ldsh	[%r7 + %r8], %r22
	.word 0xe422a010  ! 29: STW_I	stw	%r18, [%r10 + 0x0010]
	.word 0xe052e018  ! 32: LDSH_I	ldsh	[%r11 + 0x0018], %r16
	.word 0xe0338008  ! 34: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe059c008  ! 38: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe4230008  ! 39: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe80a8008  ! 40: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xac198008  ! 41: XOR_R	xor 	%r6, %r8, %r22
	.word 0xe00ae038  ! 50: LDUB_I	ldub	[%r11 + 0x0038], %r16
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe0038008  ! 64: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe8232008  ! 68: STW_I	stw	%r20, [%r12 + 0x0008]
	.word 0xec1b6018  ! 70: LDD_I	ldd	[%r13 + 0x0018], %r22
	.word 0xe421a030  ! 72: STW_I	stw	%r18, [%r6 + 0x0030]
	.word 0xec2ae020  ! 73: STB_I	stb	%r22, [%r11 + 0x0020]
	.word 0xe841a038  ! 74: LDSW_I	ldsw	[%r6 + 0x0038], %r20
	.word 0xec3b0008  ! 79: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe052c008  ! 81: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xec19a018  ! 91: LDD_I	ldd	[%r6 + 0x0018], %r22
	.word 0xec1b8008  ! 92: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe81ba038  ! 94: LDD_I	ldd	[%r14 + 0x0038], %r20
	.word 0xe439a008  ! 97: STD_I	std	%r18, [%r6 + 0x0008]
	.word 0xac1b4008  ! 101: XOR_R	xor 	%r13, %r8, %r22
	.word 0xe01ba020  ! 103: LDD_I	ldd	[%r14 + 0x0020], %r16
	.word 0xe8318008  ! 104: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe0430008  ! 105: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe0138008  ! 107: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec734008  ! 108: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe81a8008  ! 109: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xec298008  ! 110: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xec31a010  ! 113: STH_I	sth	%r22, [%r6 + 0x0010]
	.word 0xe82b4008  ! 115: STB_R	stb	%r20, [%r13 + %r8]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe05ba030  ! 118: LDX_I	ldx	[%r14 + 0x0030], %r16
	.word 0xe0736010  ! 119: STX_I	stx	%r16, [%r13 + 0x0010]
	.word 0xe0330008  ! 121: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe8332030  ! 126: STH_I	sth	%r20, [%r12 + 0x0030]
	.word 0xe81b0008  ! 130: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe0030008  ! 143: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xec19a010  ! 145: LDD_I	ldd	[%r6 + 0x0010], %r22
	.word 0xe42b0008  ! 148: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe41ba020  ! 152: LDD_I	ldd	[%r14 + 0x0020], %r18
	.word 0xe011a010  ! 155: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xe40ba008  ! 159: LDUB_I	ldub	[%r14 + 0x0008], %r18
	.word 0xe42b8008  ! 160: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe01b4008  ! 164: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe043a008  ! 165: LDSW_I	ldsw	[%r14 + 0x0008], %r16
	.word 0xe85b8008  ! 166: LDX_R	ldx	[%r14 + %r8], %r20
	.word 0xe011c008  ! 167: LDUH_R	lduh	[%r7 + %r8], %r16
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe821a008  ! 169: STW_I	stw	%r20, [%r6 + 0x0008]
	.word 0xe029a038  ! 172: STB_I	stb	%r16, [%r6 + 0x0038]
	.word 0xe45ac008  ! 177: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe0218008  ! 186: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe42ac008  ! 187: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xec198008  ! 189: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe00ac008  ! 191: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xec034008  ! 193: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe829e028  ! 196: STB_I	stb	%r20, [%r7 + 0x0028]
	.word 0xe40ae000  ! 198: LDUB_I	ldub	[%r11 + 0x0000], %r18
	.word 0xe0330008  ! 199: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe05ba000  ! 201: LDX_I	ldx	[%r14 + 0x0000], %r16
	.word 0xec718008  ! 202: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe0236008  ! 205: STW_I	stw	%r16, [%r13 + 0x0008]
	.word 0xe802a038  ! 206: LDUW_I	lduw	[%r10 + 0x0038], %r20
	.word 0xec0b0008  ! 207: LDUB_R	ldub	[%r12 + %r8], %r22
	.word 0xec21a020  ! 210: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xec39e038  ! 212: STD_I	std	%r22, [%r7 + 0x0038]
	.word 0xe0730008  ! 215: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe44b8008  ! 217: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe0234008  ! 218: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe402c008  ! 219: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe05b2018  ! 221: LDX_I	ldx	[%r12 + 0x0018], %r16
	.word 0xe031c008  ! 222: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe429a018  ! 223: STB_I	stb	%r18, [%r6 + 0x0018]
	.word 0xe0232010  ! 226: STW_I	stw	%r16, [%r12 + 0x0010]
	.word 0xec41a038  ! 228: LDSW_I	ldsw	[%r6 + 0x0038], %r22
	.word 0xe0098008  ! 229: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec71a038  ! 230: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xec332038  ! 231: STH_I	sth	%r22, [%r12 + 0x0038]
	.word 0xe0032000  ! 235: LDUW_I	lduw	[%r12 + 0x0000], %r16
	.word 0xe0218008  ! 237: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0718008  ! 238: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe029a010  ! 241: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe002e018  ! 244: LDUW_I	lduw	[%r11 + 0x0018], %r16
	.word 0xe45ba020  ! 246: LDX_I	ldx	[%r14 + 0x0020], %r18
	.word 0xe03ae000  ! 247: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xe419a000  ! 253: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xec436010  ! 255: LDSW_I	ldsw	[%r13 + 0x0010], %r22
	.word 0xe4098008  ! 258: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe42b0008  ! 262: STB_R	stb	%r18, [%r12 + %r8]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe0598008  ! 266: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe441a008  ! 267: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe00b4008  ! 271: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe4498008  ! 276: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec1ac008  ! 278: LDD_R	ldd	[%r11 + %r8], %r22
	.word 0xe432a018  ! 283: STH_I	sth	%r18, [%r10 + 0x0018]
	.word 0xe431a008  ! 285: STH_I	sth	%r18, [%r6 + 0x0008]
	.word 0xec2ba000  ! 287: STB_I	stb	%r22, [%r14 + 0x0000]
	.word 0xe43a8008  ! 288: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe853a028  ! 294: LDSH_I	ldsh	[%r14 + 0x0028], %r20
	.word 0xe0518008  ! 295: LDSH_R	ldsh	[%r6 + %r8], %r16
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
	.word 0xec31e020  ! 1: STH_I	sth	%r22, [%r7 + 0x0020]
	.word 0xe0232038  ! 5: STW_I	stw	%r16, [%r12 + 0x0038]
	.word 0xec01c008  ! 7: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe04b8008  ! 8: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe039c008  ! 9: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe42a8008  ! 12: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe4128008  ! 14: LDUH_R	lduh	[%r10 + %r8], %r18
	.word 0xe031c008  ! 15: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe011e010  ! 28: LDUH_I	lduh	[%r7 + 0x0010], %r16
	.word 0xe0230008  ! 29: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe003a010  ! 32: LDUW_I	lduw	[%r14 + 0x0010], %r16
	.word 0xec29e010  ! 34: STB_I	stb	%r22, [%r7 + 0x0010]
	.word 0xe059a008  ! 38: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xe0236038  ! 39: STW_I	stw	%r16, [%r13 + 0x0038]
	.word 0xe8038008  ! 40: LDUW_R	lduw	[%r14 + %r8], %r20
	.word 0xa03ba020  ! 41: XNOR_I	xnor 	%r14, 0x0020, %r16
	.word 0xe04ac008  ! 50: LDSB_R	ldsb	[%r11 + %r8], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe0098008  ! 64: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe42b6038  ! 68: STB_I	stb	%r18, [%r13 + 0x0038]
	.word 0xe402c008  ! 70: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe03b0008  ! 72: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe831c008  ! 73: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe0532008  ! 74: LDSH_I	ldsh	[%r12 + 0x0008], %r16
	.word 0xe43b4008  ! 79: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe402c008  ! 81: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe0032038  ! 91: LDUW_I	lduw	[%r12 + 0x0038], %r16
	.word 0xe0128008  ! 92: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xec5b8008  ! 94: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xec2b8008  ! 97: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xac09e018  ! 101: AND_I	and 	%r7, 0x0018, %r22
	.word 0xe04ae018  ! 103: LDSB_I	ldsb	[%r11 + 0x0018], %r16
	.word 0xe0330008  ! 104: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe042a008  ! 105: LDSW_I	ldsw	[%r10 + 0x0008], %r16
	.word 0xe011c008  ! 107: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe0230008  ! 108: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe452e028  ! 109: LDSH_I	ldsh	[%r11 + 0x0028], %r18
	.word 0xe039a028  ! 110: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe43b0008  ! 113: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe8398008  ! 115: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec49a000  ! 118: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xe0238008  ! 119: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe03ae020  ! 121: STD_I	std	%r16, [%r11 + 0x0020]
	.word 0xec3ae020  ! 126: STD_I	std	%r22, [%r11 + 0x0020]
	.word 0xe05b2000  ! 130: LDX_I	ldx	[%r12 + 0x0000], %r16
	.word 0xec532008  ! 143: LDSH_I	ldsh	[%r12 + 0x0008], %r22
	.word 0xe41ba010  ! 145: LDD_I	ldd	[%r14 + 0x0010], %r18
	.word 0xe8398008  ! 148: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe01ba028  ! 152: LDD_I	ldd	[%r14 + 0x0028], %r16
	.word 0xe0518008  ! 155: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe0028008  ! 159: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe02b8008  ! 160: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe45b4008  ! 164: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xec432018  ! 165: LDSW_I	ldsw	[%r12 + 0x0018], %r22
	.word 0xec528008  ! 166: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe84ac008  ! 167: LDSB_R	ldsb	[%r11 + %r8], %r20
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe423a028  ! 169: STW_I	stw	%r18, [%r14 + 0x0028]
	.word 0xec22e030  ! 172: STW_I	stw	%r22, [%r11 + 0x0030]
	.word 0xe01b2030  ! 177: LDD_I	ldd	[%r12 + 0x0030], %r16
	.word 0xe0718008  ! 186: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0734008  ! 187: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe449a028  ! 189: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xe0432038  ! 191: LDSW_I	ldsw	[%r12 + 0x0038], %r16
	.word 0xec09c008  ! 193: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xe0328008  ! 196: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe409c008  ! 198: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe033a008  ! 199: STH_I	sth	%r16, [%r14 + 0x0008]
	.word 0xe85b2010  ! 201: LDX_I	ldx	[%r12 + 0x0010], %r20
	.word 0xe4730008  ! 202: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xec3ae020  ! 205: STD_I	std	%r22, [%r11 + 0x0020]
	.word 0xe812c008  ! 206: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe451a000  ! 207: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	.word 0xec318008  ! 210: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe023a020  ! 212: STW_I	stw	%r16, [%r14 + 0x0020]
	.word 0xe0328008  ! 215: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe01ac008  ! 217: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe82ac008  ! 218: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe00b2020  ! 219: LDUB_I	ldub	[%r12 + 0x0020], %r16
	.word 0xe8030008  ! 221: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe431e008  ! 222: STH_I	sth	%r18, [%r7 + 0x0008]
	.word 0xe42b8008  ! 223: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xec318008  ! 226: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe059e038  ! 228: LDX_I	ldx	[%r7 + 0x0038], %r16
	.word 0xe85b6010  ! 229: LDX_I	ldx	[%r13 + 0x0010], %r20
	.word 0xe4336028  ! 230: STH_I	sth	%r18, [%r13 + 0x0028]
	.word 0xe82ae008  ! 231: STB_I	stb	%r20, [%r11 + 0x0008]
	.word 0xe05ae018  ! 235: LDX_I	ldx	[%r11 + 0x0018], %r16
	.word 0xec218008  ! 237: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe82b0008  ! 238: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xec33a028  ! 241: STH_I	sth	%r22, [%r14 + 0x0028]
	.word 0xe049a008  ! 244: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xec018008  ! 246: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe072a038  ! 247: STX_I	stx	%r16, [%r10 + 0x0038]
	.word 0xe041e000  ! 253: LDSW_I	ldsw	[%r7 + 0x0000], %r16
	.word 0xe01aa000  ! 255: LDD_I	ldd	[%r10 + 0x0000], %r16
	.word 0xe802c008  ! 258: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xec718008  ! 262: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe0098008  ! 266: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe859a010  ! 267: LDX_I	ldx	[%r6 + 0x0010], %r20
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0418008  ! 271: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec430008  ! 276: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec532008  ! 278: LDSH_I	ldsh	[%r12 + 0x0008], %r22
	.word 0xe02ac008  ! 283: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe82ac008  ! 285: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe0318008  ! 287: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe839a028  ! 288: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xe0534008  ! 294: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe85b2028  ! 295: LDX_I	ldx	[%r12 + 0x0028], %r20
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
	.word 0xec3ba038  ! 1: STD_I	std	%r22, [%r14 + 0x0038]
	.word 0xe0738008  ! 5: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe459e008  ! 7: LDX_I	ldx	[%r7 + 0x0008], %r18
	.word 0xe81ac008  ! 8: LDD_R	ldd	[%r11 + %r8], %r20
	.word 0xe02b6008  ! 9: STB_I	stb	%r16, [%r13 + 0x0008]
	.word 0xe4298008  ! 12: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xec0b2030  ! 14: LDUB_I	ldub	[%r12 + 0x0030], %r22
	.word 0xe8328008  ! 15: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe449a008  ! 28: LDSB_I	ldsb	[%r6 + 0x0008], %r18
	.word 0xe472e000  ! 29: STX_I	stx	%r18, [%r11 + 0x0000]
	.word 0xe849a038  ! 32: LDSB_I	ldsb	[%r6 + 0x0038], %r20
	.word 0xe432e010  ! 34: STH_I	sth	%r18, [%r11 + 0x0010]
	.word 0xe0438008  ! 38: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe42b0008  ! 39: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe0134008  ! 40: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xa0218008  ! 41: SUB_R	sub 	%r6, %r8, %r16
	.word 0xe401e000  ! 50: LDUW_I	lduw	[%r7 + 0x0000], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe0198008  ! 64: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe032c008  ! 68: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe00a8008  ! 70: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xec238008  ! 72: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe02ba000  ! 73: STB_I	stb	%r16, [%r14 + 0x0000]
	.word 0xe0098008  ! 74: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe8738008  ! 79: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xe019c008  ! 81: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe84ac008  ! 91: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe013a000  ! 92: LDUH_I	lduh	[%r14 + 0x0000], %r16
	.word 0xe04a8008  ! 94: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xec738008  ! 97: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xa0238008  ! 101: SUB_R	sub 	%r14, %r8, %r16
	.word 0xe049e008  ! 103: LDSB_I	ldsb	[%r7 + 0x0008], %r16
	.word 0xe072e028  ! 104: STX_I	stx	%r16, [%r11 + 0x0028]
	.word 0xec034008  ! 105: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe012e010  ! 107: LDUH_I	lduh	[%r11 + 0x0010], %r16
	.word 0xe43ba018  ! 108: STD_I	std	%r18, [%r14 + 0x0018]
	.word 0xe05aa028  ! 109: LDX_I	ldx	[%r10 + 0x0028], %r16
	.word 0xe82ae020  ! 110: STB_I	stb	%r20, [%r11 + 0x0020]
	.word 0xe8330008  ! 113: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe472e000  ! 115: STX_I	stx	%r18, [%r11 + 0x0000]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe419a000  ! 118: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe02b4008  ! 119: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe0318008  ! 121: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec236018  ! 126: STW_I	stw	%r22, [%r13 + 0x0018]
	.word 0xe859a008  ! 130: LDX_I	ldx	[%r6 + 0x0008], %r20
	.word 0xe01b4008  ! 143: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe8098008  ! 145: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe821a020  ! 148: STW_I	stw	%r20, [%r6 + 0x0020]
	.word 0xe852e028  ! 152: LDSH_I	ldsh	[%r11 + 0x0028], %r20
	.word 0xe819a008  ! 155: LDD_I	ldd	[%r6 + 0x0008], %r20
	.word 0xe0530008  ! 159: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe039c008  ! 160: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe84aa000  ! 164: LDSB_I	ldsb	[%r10 + 0x0000], %r20
	.word 0xe842c008  ! 165: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xe0598008  ! 166: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe041a020  ! 167: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xec71e018  ! 169: STX_I	stx	%r22, [%r7 + 0x0018]
	.word 0xe82b8008  ! 172: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xec518008  ! 177: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe471e000  ! 186: STX_I	stx	%r18, [%r7 + 0x0000]
	.word 0xe82b8008  ! 187: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe001e028  ! 189: LDUW_I	lduw	[%r7 + 0x0028], %r16
	.word 0xe4518008  ! 191: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe40ae030  ! 193: LDUB_I	ldub	[%r11 + 0x0030], %r18
	.word 0xe0318008  ! 196: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe001a000  ! 198: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe822c008  ! 199: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe041e028  ! 201: LDSW_I	ldsw	[%r7 + 0x0028], %r16
	.word 0xe431a038  ! 202: STH_I	sth	%r18, [%r6 + 0x0038]
	.word 0xe871c008  ! 205: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe00aa018  ! 206: LDUB_I	ldub	[%r10 + 0x0018], %r16
	.word 0xec098008  ! 207: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe831a018  ! 210: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xec238008  ! 212: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe029e038  ! 215: STB_I	stb	%r16, [%r7 + 0x0038]
	.word 0xe441e020  ! 217: LDSW_I	ldsw	[%r7 + 0x0020], %r18
	.word 0xe423a010  ! 218: STW_I	stw	%r18, [%r14 + 0x0010]
	.word 0xe01b2020  ! 219: LDD_I	ldd	[%r12 + 0x0020], %r16
	.word 0xe05b0008  ! 221: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe4728008  ! 222: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe831e018  ! 223: STH_I	sth	%r20, [%r7 + 0x0018]
	.word 0xe0728008  ! 226: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe01b2038  ! 228: LDD_I	ldd	[%r12 + 0x0038], %r16
	.word 0xec028008  ! 229: LDUW_R	lduw	[%r10 + %r8], %r22
	.word 0xe421e018  ! 230: STW_I	stw	%r18, [%r7 + 0x0018]
	.word 0xe031a038  ! 231: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xec4b8008  ! 235: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe0318008  ! 237: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe4234008  ! 238: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xec32a038  ! 241: STH_I	sth	%r22, [%r10 + 0x0038]
	.word 0xe85aa008  ! 244: LDX_I	ldx	[%r10 + 0x0008], %r20
	.word 0xe4436020  ! 246: LDSW_I	ldsw	[%r13 + 0x0020], %r18
	.word 0xe8234008  ! 247: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe411a018  ! 253: LDUH_I	lduh	[%r6 + 0x0018], %r18
	.word 0xe0438008  ! 255: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xec53a000  ! 258: LDSH_I	ldsh	[%r14 + 0x0000], %r22
	.word 0xec32a028  ! 262: STH_I	sth	%r22, [%r10 + 0x0028]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe0532028  ! 266: LDSH_I	ldsh	[%r12 + 0x0028], %r16
	.word 0xe0530008  ! 267: LDSH_R	ldsh	[%r12 + %r8], %r16
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe841e000  ! 271: LDSW_I	ldsw	[%r7 + 0x0000], %r20
	.word 0xec4ba038  ! 276: LDSB_I	ldsb	[%r14 + 0x0038], %r22
	.word 0xe811c008  ! 278: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xe831a028  ! 283: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe0228008  ! 285: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe422c008  ! 287: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe421a038  ! 288: STW_I	stw	%r18, [%r6 + 0x0038]
	.word 0xe019a028  ! 294: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xe401a010  ! 295: LDUW_I	lduw	[%r6 + 0x0010], %r18
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
	.word 0xec3b6028  ! 1: STD_I	std	%r22, [%r13 + 0x0028]
	.word 0xe03b0008  ! 5: STD_R	std	%r16, [%r12 + %r8]
	.word 0xec0b6020  ! 7: LDUB_I	ldub	[%r13 + 0x0020], %r22
	.word 0xe85ae020  ! 8: LDX_I	ldx	[%r11 + 0x0020], %r20
	.word 0xe42ba038  ! 9: STB_I	stb	%r18, [%r14 + 0x0038]
	.word 0xe03b8008  ! 12: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe011c008  ! 14: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe02b4008  ! 15: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xec138008  ! 28: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xec31a000  ! 29: STH_I	sth	%r22, [%r6 + 0x0000]
	.word 0xe0098008  ! 32: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe022e010  ! 34: STW_I	stw	%r16, [%r11 + 0x0010]
	.word 0xec5b2038  ! 38: LDX_I	ldx	[%r12 + 0x0038], %r22
	.word 0xe4318008  ! 39: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe8138008  ! 40: LDUH_R	lduh	[%r14 + %r8], %r20
	.word 0xa81b6038  ! 41: XOR_I	xor 	%r13, 0x0038, %r20
	.word 0xe849a020  ! 50: LDSB_I	ldsb	[%r6 + 0x0020], %r20
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe44b2000  ! 64: LDSB_I	ldsb	[%r12 + 0x0000], %r18
	.word 0xe82ba038  ! 68: STB_I	stb	%r20, [%r14 + 0x0038]
	.word 0xec118008  ! 70: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe871e010  ! 72: STX_I	stx	%r20, [%r7 + 0x0010]
	.word 0xe02a8008  ! 73: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe01b8008  ! 74: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe0334008  ! 79: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe05b0008  ! 81: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xec1ac008  ! 91: LDD_R	ldd	[%r11 + %r8], %r22
	.word 0xe01b4008  ! 92: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe4018008  ! 94: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe071a020  ! 97: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xac81e038  ! 101: ADDcc_I	addcc 	%r7, 0x0038, %r22
	.word 0xe0018008  ! 103: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe43a8008  ! 104: STD_R	std	%r18, [%r10 + %r8]
	.word 0xec130008  ! 105: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe452a008  ! 107: LDSH_I	ldsh	[%r10 + 0x0008], %r18
	.word 0xe431e030  ! 108: STH_I	sth	%r18, [%r7 + 0x0030]
	.word 0xe44ba000  ! 109: LDSB_I	ldsb	[%r14 + 0x0000], %r18
	.word 0xec338008  ! 110: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xec2b8008  ! 113: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe472a000  ! 115: STX_I	stx	%r18, [%r10 + 0x0000]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe859a000  ! 118: LDX_I	ldx	[%r6 + 0x0000], %r20
	.word 0xe039e030  ! 119: STD_I	std	%r16, [%r7 + 0x0030]
	.word 0xe4234008  ! 121: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe0332008  ! 126: STH_I	sth	%r16, [%r12 + 0x0008]
	.word 0xe002e018  ! 130: LDUW_I	lduw	[%r11 + 0x0018], %r16
	.word 0xec138008  ! 143: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xe011e000  ! 145: LDUH_I	lduh	[%r7 + 0x0000], %r16
	.word 0xe82b4008  ! 148: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe851e018  ! 152: LDSH_I	ldsh	[%r7 + 0x0018], %r20
	.word 0xe409a030  ! 155: LDUB_I	ldub	[%r6 + 0x0030], %r18
	.word 0xe443a030  ! 159: LDSW_I	ldsw	[%r14 + 0x0030], %r18
	.word 0xe0336000  ! 160: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe8028008  ! 164: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xe4036010  ! 165: LDUW_I	lduw	[%r13 + 0x0010], %r18
	.word 0xe402a020  ! 166: LDUW_I	lduw	[%r10 + 0x0020], %r18
	.word 0xe019e018  ! 167: LDD_I	ldd	[%r7 + 0x0018], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe42b6000  ! 169: STB_I	stb	%r18, [%r13 + 0x0000]
	.word 0xe031a000  ! 172: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe0530008  ! 177: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe4336030  ! 186: STH_I	sth	%r18, [%r13 + 0x0030]
	.word 0xe022c008  ! 187: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe812c008  ! 189: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xec198008  ! 191: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xec51c008  ! 193: LDSH_R	ldsh	[%r7 + %r8], %r22
	.word 0xe432e028  ! 196: STH_I	sth	%r18, [%r11 + 0x0028]
	.word 0xe05ba000  ! 198: LDX_I	ldx	[%r14 + 0x0000], %r16
	.word 0xe0718008  ! 199: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe052c008  ! 201: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe02ba020  ! 202: STB_I	stb	%r16, [%r14 + 0x0020]
	.word 0xe8318008  ! 205: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe0498008  ! 206: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xec01a000  ! 207: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xec72e028  ! 210: STX_I	stx	%r22, [%r11 + 0x0028]
	.word 0xe8218008  ! 212: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec318008  ! 215: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe04b8008  ! 217: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe03b6018  ! 218: STD_I	std	%r16, [%r13 + 0x0018]
	.word 0xe819a030  ! 219: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xe8528008  ! 221: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe4236010  ! 222: STW_I	stw	%r18, [%r13 + 0x0010]
	.word 0xe4228008  ! 223: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe429c008  ! 226: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe8098008  ! 228: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe802a000  ! 229: LDUW_I	lduw	[%r10 + 0x0000], %r20
	.word 0xe03b0008  ! 230: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe8736018  ! 231: STX_I	stx	%r20, [%r13 + 0x0018]
	.word 0xec41c008  ! 235: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe039e018  ! 237: STD_I	std	%r16, [%r7 + 0x0018]
	.word 0xe032c008  ! 238: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe431a030  ! 241: STH_I	sth	%r18, [%r6 + 0x0030]
	.word 0xe8528008  ! 244: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe0430008  ! 246: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe02b4008  ! 247: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xec5b2000  ! 253: LDX_I	ldx	[%r12 + 0x0000], %r22
	.word 0xe00b0008  ! 255: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe40ba030  ! 258: LDUB_I	ldub	[%r14 + 0x0030], %r18
	.word 0xec3ae020  ! 262: STD_I	std	%r22, [%r11 + 0x0020]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe41a8008  ! 266: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe043a030  ! 267: LDSW_I	ldsw	[%r14 + 0x0030], %r16
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe003a000  ! 271: LDUW_I	lduw	[%r14 + 0x0000], %r16
	.word 0xe019a028  ! 276: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xec032010  ! 278: LDUW_I	lduw	[%r12 + 0x0010], %r22
	.word 0xe033a018  ! 283: STH_I	sth	%r16, [%r14 + 0x0018]
	.word 0xe439e028  ! 285: STD_I	std	%r18, [%r7 + 0x0028]
	.word 0xe0332008  ! 287: STH_I	sth	%r16, [%r12 + 0x0008]
	.word 0xe0734008  ! 288: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec49e030  ! 294: LDSB_I	ldsb	[%r7 + 0x0030], %r22
	.word 0xe44b4008  ! 295: LDSB_R	ldsb	[%r13 + %r8], %r18
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
	.word 0xe021a010  ! 1: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xe82b6038  ! 5: STB_I	stb	%r20, [%r13 + 0x0038]
	.word 0xe059a028  ! 7: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xe0130008  ! 8: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe03ba038  ! 9: STD_I	std	%r16, [%r14 + 0x0038]
	.word 0xec318008  ! 12: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe01b0008  ! 14: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe8236038  ! 15: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xec0ac008  ! 28: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xec71a038  ! 29: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xe453a020  ! 32: LDSH_I	ldsh	[%r14 + 0x0020], %r18
	.word 0xe0718008  ! 34: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4118008  ! 38: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe833a000  ! 39: STH_I	sth	%r20, [%r14 + 0x0000]
	.word 0xe4034008  ! 40: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xa8938008  ! 41: ORcc_R	orcc 	%r14, %r8, %r20
	.word 0xe001a030  ! 50: LDUW_I	lduw	[%r6 + 0x0030], %r16
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe00aa008  ! 64: LDUB_I	ldub	[%r10 + 0x0008], %r16
	.word 0xe472e028  ! 68: STX_I	stx	%r18, [%r11 + 0x0028]
	.word 0xe049e038  ! 70: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	.word 0xec3b2028  ! 72: STD_I	std	%r22, [%r12 + 0x0028]
	.word 0xe02b2028  ! 73: STB_I	stb	%r16, [%r12 + 0x0028]
	.word 0xe0432008  ! 74: LDSW_I	ldsw	[%r12 + 0x0008], %r16
	.word 0xe0398008  ! 79: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec5b8008  ! 81: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xec12c008  ! 91: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xe0098008  ! 92: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe019a008  ! 94: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe8734008  ! 97: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xa0a98008  ! 101: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xe04b2030  ! 103: LDSB_I	ldsb	[%r12 + 0x0030], %r16
	.word 0xe0232038  ! 104: STW_I	stw	%r16, [%r12 + 0x0038]
	.word 0xe4132020  ! 105: LDUH_I	lduh	[%r12 + 0x0020], %r18
	.word 0xec53a020  ! 107: LDSH_I	ldsh	[%r14 + 0x0020], %r22
	.word 0xe4234008  ! 108: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe8518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe439a020  ! 110: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xe0234008  ! 113: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec22c008  ! 115: STW_R	stw	%r22, [%r11 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe411a018  ! 118: LDUH_I	lduh	[%r6 + 0x0018], %r18
	.word 0xe03b0008  ! 119: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe421a020  ! 121: STW_I	stw	%r18, [%r6 + 0x0020]
	.word 0xec39a008  ! 126: STD_I	std	%r22, [%r6 + 0x0008]
	.word 0xe0036038  ! 130: LDUW_I	lduw	[%r13 + 0x0038], %r16
	.word 0xe4418008  ! 143: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xec41c008  ! 145: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xec73a018  ! 148: STX_I	stx	%r22, [%r14 + 0x0018]
	.word 0xec09a038  ! 152: LDUB_I	ldub	[%r6 + 0x0038], %r22
	.word 0xec0aa038  ! 155: LDUB_I	ldub	[%r10 + 0x0038], %r22
	.word 0xe4130008  ! 159: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xe03b8008  ! 160: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe4034008  ! 164: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xec136010  ! 165: LDUH_I	lduh	[%r13 + 0x0010], %r22
	.word 0xe452c008  ! 166: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xe8518008  ! 167: LDSH_R	ldsh	[%r6 + %r8], %r20
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe021a008  ! 169: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe431a008  ! 172: STH_I	sth	%r18, [%r6 + 0x0008]
	.word 0xec4b0008  ! 177: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe0332000  ! 186: STH_I	sth	%r16, [%r12 + 0x0000]
	.word 0xe029a000  ! 187: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xec49a020  ! 189: LDSB_I	ldsb	[%r6 + 0x0020], %r22
	.word 0xe8534008  ! 191: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xe05ba038  ! 193: LDX_I	ldx	[%r14 + 0x0038], %r16
	.word 0xe0218008  ! 196: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe8428008  ! 198: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xe031a030  ! 199: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe4118008  ! 201: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xec398008  ! 202: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe43ba028  ! 205: STD_I	std	%r18, [%r14 + 0x0028]
	.word 0xe853a010  ! 206: LDSH_I	ldsh	[%r14 + 0x0010], %r20
	.word 0xe412c008  ! 207: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe0398008  ! 210: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe43ac008  ! 212: STD_R	std	%r18, [%r11 + %r8]
	.word 0xec218008  ! 215: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0598008  ! 217: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe03b8008  ! 218: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe05b2008  ! 219: LDX_I	ldx	[%r12 + 0x0008], %r16
	.word 0xe00ae008  ! 221: LDUB_I	ldub	[%r11 + 0x0008], %r16
	.word 0xe03aa020  ! 222: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xe8398008  ! 223: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe0318008  ! 226: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe0098008  ! 228: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe4132008  ! 229: LDUH_I	lduh	[%r12 + 0x0008], %r18
	.word 0xe872e038  ! 230: STX_I	stx	%r20, [%r11 + 0x0038]
	.word 0xe02ae010  ! 231: STB_I	stb	%r16, [%r11 + 0x0010]
	.word 0xe45b8008  ! 235: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe029a000  ! 237: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xec732008  ! 238: STX_I	stx	%r22, [%r12 + 0x0008]
	.word 0xe8298008  ! 241: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe00b6018  ! 244: LDUB_I	ldub	[%r13 + 0x0018], %r16
	.word 0xe859e020  ! 246: LDX_I	ldx	[%r7 + 0x0020], %r20
	.word 0xe43ae010  ! 247: STD_I	std	%r18, [%r11 + 0x0010]
	.word 0xe812e010  ! 253: LDUH_I	lduh	[%r11 + 0x0010], %r20
	.word 0xe053a008  ! 255: LDSH_I	ldsh	[%r14 + 0x0008], %r16
	.word 0xe00b2020  ! 258: LDUB_I	ldub	[%r12 + 0x0020], %r16
	.word 0xe42a8008  ! 262: STB_R	stb	%r18, [%r10 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe0598008  ! 266: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe849e000  ! 267: LDSB_I	ldsb	[%r7 + 0x0000], %r20
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe4038008  ! 271: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe019a000  ! 276: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xe843a010  ! 278: LDSW_I	ldsw	[%r14 + 0x0010], %r20
	.word 0xe4230008  ! 283: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe432c008  ! 285: STH_R	sth	%r18, [%r11 + %r8]
	.word 0xe0336008  ! 287: STH_I	sth	%r16, [%r13 + 0x0008]
	.word 0xe03aa020  ! 288: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xe041a008  ! 294: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xe0198008  ! 295: LDD_R	ldd	[%r6 + %r8], %r16
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
	.word 0xe82ac008  ! 1: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe4234008  ! 5: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe0030008  ! 7: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xec1ae028  ! 8: LDD_I	ldd	[%r11 + 0x0028], %r22
	.word 0xe0728008  ! 9: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe83b2008  ! 12: STD_I	std	%r20, [%r12 + 0x0008]
	.word 0xe059a018  ! 14: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xec298008  ! 15: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe059a020  ! 28: LDX_I	ldx	[%r6 + 0x0020], %r16
	.word 0xe821e018  ! 29: STW_I	stw	%r20, [%r7 + 0x0018]
	.word 0xe051c008  ! 32: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe02a8008  ! 34: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe8098008  ! 38: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe0230008  ! 39: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe04a8008  ! 40: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xa0918008  ! 41: ORcc_R	orcc 	%r6, %r8, %r16
	.word 0xe811a038  ! 50: LDUH_I	lduh	[%r6 + 0x0038], %r20
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xec0aa000  ! 64: LDUB_I	ldub	[%r10 + 0x0000], %r22
	.word 0xe02b2018  ! 68: STB_I	stb	%r16, [%r12 + 0x0018]
	.word 0xec49c008  ! 70: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe831c008  ! 72: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe039e018  ! 73: STD_I	std	%r16, [%r7 + 0x0018]
	.word 0xe002c008  ! 74: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe4318008  ! 79: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe0030008  ! 81: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe019a028  ! 91: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xe0430008  ! 92: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe051e008  ! 94: LDSH_I	ldsh	[%r7 + 0x0008], %r16
	.word 0xe039a010  ! 97: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xa0c1e030  ! 101: ADDCcc_I	addccc 	%r7, 0x0030, %r16
	.word 0xe019c008  ! 103: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xec734008  ! 104: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe019a018  ! 105: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xe053a028  ! 107: LDSH_I	ldsh	[%r14 + 0x0028], %r16
	.word 0xe4218008  ! 108: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec598008  ! 109: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe4218008  ! 110: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe02ba018  ! 113: STB_I	stb	%r16, [%r14 + 0x0018]
	.word 0xec31c008  ! 115: STH_R	sth	%r22, [%r7 + %r8]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec530008  ! 118: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xe839e010  ! 119: STD_I	std	%r20, [%r7 + 0x0010]
	.word 0xe8318008  ! 121: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe83aa008  ! 126: STD_I	std	%r20, [%r10 + 0x0008]
	.word 0xe059c008  ! 130: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe052c008  ! 143: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe81b0008  ! 145: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe872e020  ! 148: STX_I	stx	%r20, [%r11 + 0x0020]
	.word 0xe4498008  ! 152: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec09a008  ! 155: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xe011e030  ! 159: LDUH_I	lduh	[%r7 + 0x0030], %r16
	.word 0xec728008  ! 160: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe4536018  ! 164: LDSH_I	ldsh	[%r13 + 0x0018], %r18
	.word 0xe859a008  ! 165: LDX_I	ldx	[%r6 + 0x0008], %r20
	.word 0xe009c008  ! 166: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xec5b2018  ! 167: LDX_I	ldx	[%r12 + 0x0018], %r22
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe421c008  ! 169: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe022e008  ! 172: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe05b0008  ! 177: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe8718008  ! 186: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe8228008  ! 187: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xec42a020  ! 189: LDSW_I	ldsw	[%r10 + 0x0020], %r22
	.word 0xe049a020  ! 191: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe051a010  ! 193: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xe0738008  ! 196: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe451c008  ! 198: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe83b0008  ! 199: STD_R	std	%r20, [%r12 + %r8]
	.word 0xe059c008  ! 201: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xec3b0008  ! 202: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe03ae028  ! 205: STD_I	std	%r16, [%r11 + 0x0028]
	.word 0xe0198008  ! 206: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe452c008  ! 207: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xe4228008  ! 210: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe422a008  ! 212: STW_I	stw	%r18, [%r10 + 0x0008]
	.word 0xec31a010  ! 215: STH_I	sth	%r22, [%r6 + 0x0010]
	.word 0xe002c008  ! 217: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xec31a008  ! 218: STH_I	sth	%r22, [%r6 + 0x0008]
	.word 0xe4038008  ! 219: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe0198008  ! 221: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xec39e028  ! 222: STD_I	std	%r22, [%r7 + 0x0028]
	.word 0xe43a8008  ! 223: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe429c008  ! 226: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe40ac008  ! 228: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xec09a030  ! 229: LDUB_I	ldub	[%r6 + 0x0030], %r22
	.word 0xe472c008  ! 230: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe0318008  ! 231: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe849c008  ! 235: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec2b8008  ! 237: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe4236030  ! 238: STW_I	stw	%r18, [%r13 + 0x0030]
	.word 0xe02b0008  ! 241: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec41c008  ! 244: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe00ac008  ! 246: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe4398008  ! 247: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe051c008  ! 253: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe40b4008  ! 255: LDUB_R	ldub	[%r13 + %r8], %r18
	.word 0xec53a018  ! 258: LDSH_I	ldsh	[%r14 + 0x0018], %r22
	.word 0xe0230008  ! 262: STW_R	stw	%r16, [%r12 + %r8]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe84ae010  ! 266: LDSB_I	ldsb	[%r11 + 0x0010], %r20
	.word 0xe05b8008  ! 267: LDX_R	ldx	[%r14 + %r8], %r16
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe4432028  ! 271: LDSW_I	ldsw	[%r12 + 0x0028], %r18
	.word 0xe009a038  ! 276: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xe811a000  ! 278: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xe8218008  ! 283: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec230008  ! 285: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe4230008  ! 287: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe029c008  ! 288: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec498008  ! 294: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe842a000  ! 295: LDSW_I	ldsw	[%r10 + 0x0000], %r20
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
	.word 0xe839e008  ! 1: STD_I	std	%r20, [%r7 + 0x0008]
	.word 0xec298008  ! 5: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe009a020  ! 7: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xe402c008  ! 8: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe83b4008  ! 9: STD_R	std	%r20, [%r13 + %r8]
	.word 0xe471a000  ! 12: STX_I	stx	%r18, [%r6 + 0x0000]
	.word 0xec498008  ! 14: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe431a018  ! 15: STH_I	sth	%r18, [%r6 + 0x0018]
	.word 0xec52a038  ! 28: LDSH_I	ldsh	[%r10 + 0x0038], %r22
	.word 0xe832a030  ! 29: STH_I	sth	%r20, [%r10 + 0x0030]
	.word 0xe4198008  ! 32: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe82ae008  ! 34: STB_I	stb	%r20, [%r11 + 0x0008]
	.word 0xe0030008  ! 38: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe43aa010  ! 39: STD_I	std	%r18, [%r10 + 0x0010]
	.word 0xe04b2010  ! 40: LDSB_I	ldsb	[%r12 + 0x0010], %r16
	.word 0xa842a038  ! 41: ADDC_I	addc 	%r10, 0x0038, %r20
	.word 0xe05a8008  ! 50: LDX_R	ldx	[%r10 + %r8], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe44b8008  ! 64: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe821c008  ! 68: STW_R	stw	%r20, [%r7 + %r8]
	.word 0xe80ba010  ! 70: LDUB_I	ldub	[%r14 + 0x0010], %r20
	.word 0xec3a8008  ! 72: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe472a038  ! 73: STX_I	stx	%r18, [%r10 + 0x0038]
	.word 0xe45a8008  ! 74: LDX_R	ldx	[%r10 + %r8], %r18
	.word 0xe422a018  ! 79: STW_I	stw	%r18, [%r10 + 0x0018]
	.word 0xe401a038  ! 81: LDUW_I	lduw	[%r6 + 0x0038], %r18
	.word 0xe419a028  ! 91: LDD_I	ldd	[%r6 + 0x0028], %r18
	.word 0xe41ae030  ! 92: LDD_I	ldd	[%r11 + 0x0030], %r18
	.word 0xe0438008  ! 94: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe021a008  ! 97: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xa029e008  ! 101: ANDN_I	andn 	%r7, 0x0008, %r16
	.word 0xec4b4008  ! 103: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe82b0008  ! 104: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe019a018  ! 105: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xec538008  ! 107: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe871c008  ! 108: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe849e038  ! 109: LDSB_I	ldsb	[%r7 + 0x0038], %r20
	.word 0xe0236028  ! 110: STW_I	stw	%r16, [%r13 + 0x0028]
	.word 0xe029e020  ! 113: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xe032a010  ! 115: STH_I	sth	%r16, [%r10 + 0x0010]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef100, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe802c008  ! 118: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe872c008  ! 119: STX_R	stx	%r20, [%r11 + %r8]
	.word 0xec33a038  ! 121: STH_I	sth	%r22, [%r14 + 0x0038]
	.word 0xe4338008  ! 126: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe85b2018  ! 130: LDX_I	ldx	[%r12 + 0x0018], %r20
	.word 0xec4ae010  ! 143: LDSB_I	ldsb	[%r11 + 0x0010], %r22
	.word 0xec41c008  ! 145: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe021a030  ! 148: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xe809a038  ! 152: LDUB_I	ldub	[%r6 + 0x0038], %r20
	.word 0xec09c008  ! 155: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xec498008  ! 159: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe031a018  ! 160: STH_I	sth	%r16, [%r6 + 0x0018]
	.word 0xe8128008  ! 164: LDUH_R	lduh	[%r10 + %r8], %r20
	.word 0xe8418008  ! 165: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe0118008  ! 166: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe851e030  ! 167: LDSH_I	ldsh	[%r7 + 0x0030], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe0728008  ! 169: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe829e038  ! 172: STB_I	stb	%r20, [%r7 + 0x0038]
	.word 0xe85ac008  ! 177: LDX_R	ldx	[%r11 + %r8], %r20
	.word 0xe073a030  ! 186: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe0234008  ! 187: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe4428008  ! 189: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xe012c008  ! 191: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe85b0008  ! 193: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe43ac008  ! 196: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe8538008  ! 198: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe02aa000  ! 199: STB_I	stb	%r16, [%r10 + 0x0000]
	.word 0xe849c008  ! 201: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec21a030  ! 202: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xec39e020  ! 205: STD_I	std	%r22, [%r7 + 0x0020]
	.word 0xec51a038  ! 206: LDSH_I	ldsh	[%r6 + 0x0038], %r22
	.word 0xe01b8008  ! 207: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe872a018  ! 210: STX_I	stx	%r20, [%r10 + 0x0018]
	.word 0xe8734008  ! 212: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe022e028  ! 215: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xe049a030  ! 217: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xe42b8008  ! 218: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe45b4008  ! 219: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xe011e010  ! 221: LDUH_I	lduh	[%r7 + 0x0010], %r16
	.word 0xe8332000  ! 222: STH_I	sth	%r20, [%r12 + 0x0000]
	.word 0xe021a008  ! 223: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe831a018  ! 226: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xe4536038  ! 228: LDSH_I	ldsh	[%r13 + 0x0038], %r18
	.word 0xe4532028  ! 229: LDSH_I	ldsh	[%r12 + 0x0028], %r18
	.word 0xec2b0008  ! 230: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xe433a028  ! 231: STH_I	sth	%r18, [%r14 + 0x0028]
	.word 0xe4030008  ! 235: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe82aa010  ! 237: STB_I	stb	%r20, [%r10 + 0x0010]
	.word 0xe871e008  ! 238: STX_I	stx	%r20, [%r7 + 0x0008]
	.word 0xe0332030  ! 241: STH_I	sth	%r16, [%r12 + 0x0030]
	.word 0xe05b0008  ! 244: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xec0ac008  ! 246: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xe829a038  ! 247: STB_I	stb	%r20, [%r6 + 0x0038]
	.word 0xe011c008  ! 253: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe009a018  ! 255: LDUB_I	ldub	[%r6 + 0x0018], %r16
	.word 0xec01e028  ! 258: LDUW_I	lduw	[%r7 + 0x0028], %r22
	.word 0xec71c008  ! 262: STX_R	stx	%r22, [%r7 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe811e038  ! 266: LDUH_I	lduh	[%r7 + 0x0038], %r20
	.word 0xe8118008  ! 267: LDUH_R	lduh	[%r6 + %r8], %r20
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe003a000  ! 271: LDUW_I	lduw	[%r14 + 0x0000], %r16
	.word 0xec028008  ! 276: LDUW_R	lduw	[%r10 + %r8], %r22
	.word 0xe402e028  ! 278: LDUW_I	lduw	[%r11 + 0x0028], %r18
	.word 0xe42b8008  ! 283: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xec738008  ! 285: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe0734008  ! 287: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe02ac008  ! 288: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe009a008  ! 294: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xe04a8008  ! 295: LDSB_R	ldsb	[%r10 + %r8], %r16
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
	.word 0xec3b4008  ! 1: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe0738008  ! 5: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe419a038  ! 7: LDD_I	ldd	[%r6 + 0x0038], %r18
	.word 0xe013a038  ! 8: LDUH_I	lduh	[%r14 + 0x0038], %r16
	.word 0xe0736008  ! 9: STX_I	stx	%r16, [%r13 + 0x0008]
	.word 0xe432a028  ! 12: STH_I	sth	%r18, [%r10 + 0x0028]
	.word 0xec11c008  ! 14: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xe03b6010  ! 15: STD_I	std	%r16, [%r13 + 0x0010]
	.word 0xe85b0008  ! 28: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe02ac008  ! 29: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xec52a008  ! 32: LDSH_I	ldsh	[%r10 + 0x0008], %r22
	.word 0xe029a028  ! 34: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe051a010  ! 38: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xe021a000  ! 39: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe4432008  ! 40: LDSW_I	ldsw	[%r12 + 0x0008], %r18
	.word 0xa0236000  ! 41: SUB_I	sub 	%r13, 0x0000, %r16
	.word 0xe0198008  ! 50: LDD_R	ldd	[%r6 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec198008  ! 64: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe0732020  ! 68: STX_I	stx	%r16, [%r12 + 0x0020]
	.word 0xe05ba020  ! 70: LDX_I	ldx	[%r14 + 0x0020], %r16
	.word 0xec318008  ! 72: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe4218008  ! 73: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec118008  ! 74: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe421c008  ! 79: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe8528008  ! 81: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe042e020  ! 91: LDSW_I	ldsw	[%r11 + 0x0020], %r16
	.word 0xe0432028  ! 92: LDSW_I	ldsw	[%r12 + 0x0028], %r16
	.word 0xe8198008  ! 94: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe829c008  ! 97: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xac1b6030  ! 101: XOR_I	xor 	%r13, 0x0030, %r22
	.word 0xe0538008  ! 103: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe4736020  ! 104: STX_I	stx	%r18, [%r13 + 0x0020]
	.word 0xe011a010  ! 105: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xec43a010  ! 107: LDSW_I	ldsw	[%r14 + 0x0010], %r22
	.word 0xe0298008  ! 108: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe851e008  ! 109: LDSH_I	ldsh	[%r7 + 0x0008], %r20
	.word 0xe8738008  ! 110: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xe039e010  ! 113: STD_I	std	%r16, [%r7 + 0x0010]
	.word 0xe039c008  ! 115: STD_R	std	%r16, [%r7 + %r8]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe84a8008  ! 118: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe0234008  ! 119: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe4336000  ! 121: STH_I	sth	%r18, [%r13 + 0x0000]
	.word 0xe0318008  ! 126: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec5ba018  ! 130: LDX_I	ldx	[%r14 + 0x0018], %r22
	.word 0xe00aa030  ! 143: LDUB_I	ldub	[%r10 + 0x0030], %r16
	.word 0xe00b4008  ! 145: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe821e028  ! 148: STW_I	stw	%r20, [%r7 + 0x0028]
	.word 0xe41b8008  ! 152: LDD_R	ldd	[%r14 + %r8], %r18
	.word 0xe01b4008  ! 155: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe01ac008  ! 159: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe82a8008  ! 160: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe003a030  ! 164: LDUW_I	lduw	[%r14 + 0x0030], %r16
	.word 0xe01a8008  ! 165: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe459a008  ! 166: LDX_I	ldx	[%r6 + 0x0008], %r18
	.word 0xec0b0008  ! 167: LDUB_R	ldub	[%r12 + %r8], %r22
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xec2ba028  ! 169: STB_I	stb	%r22, [%r14 + 0x0028]
	.word 0xec29e028  ! 172: STB_I	stb	%r22, [%r7 + 0x0028]
	.word 0xe409e018  ! 177: LDUB_I	ldub	[%r7 + 0x0018], %r18
	.word 0xe8232000  ! 186: STW_I	stw	%r20, [%r12 + 0x0000]
	.word 0xe4398008  ! 187: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe84b8008  ! 189: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe042c008  ! 191: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe8030008  ! 193: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xe83b8008  ! 196: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe0198008  ! 198: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe871a020  ! 199: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xe4538008  ! 201: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xec734008  ! 202: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xec71a028  ! 205: STX_I	stx	%r22, [%r6 + 0x0028]
	.word 0xe0598008  ! 206: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe441e008  ! 207: LDSW_I	ldsw	[%r7 + 0x0008], %r18
	.word 0xe8234008  ! 210: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe8230008  ! 212: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe422a010  ! 215: STW_I	stw	%r18, [%r10 + 0x0010]
	.word 0xe001c008  ! 217: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe4398008  ! 218: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe8434008  ! 219: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe043a038  ! 221: LDSW_I	ldsw	[%r14 + 0x0038], %r16
	.word 0xe039c008  ! 222: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe8218008  ! 223: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe03b4008  ! 226: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe0098008  ! 228: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec498008  ! 229: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xec3ac008  ! 230: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe423a020  ! 231: STW_I	stw	%r18, [%r14 + 0x0020]
	.word 0xe019c008  ! 235: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe42b0008  ! 237: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe82b6020  ! 238: STB_I	stb	%r20, [%r13 + 0x0020]
	.word 0xe429e018  ! 241: STB_I	stb	%r18, [%r7 + 0x0018]
	.word 0xe8518008  ! 244: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe4436030  ! 246: LDSW_I	ldsw	[%r13 + 0x0030], %r18
	.word 0xe829a000  ! 247: STB_I	stb	%r20, [%r6 + 0x0000]
	.word 0xec4b2020  ! 253: LDSB_I	ldsb	[%r12 + 0x0020], %r22
	.word 0xec118008  ! 255: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe0598008  ! 258: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe0318008  ! 262: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xec598008  ! 266: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe0098008  ! 267: LDUB_R	ldub	[%r6 + %r8], %r16
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe412c008  ! 271: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe44ba028  ! 276: LDSB_I	ldsb	[%r14 + 0x0028], %r18
	.word 0xe8134008  ! 278: LDUH_R	lduh	[%r13 + %r8], %r20
	.word 0xe0398008  ! 283: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec72a008  ! 285: STX_I	stx	%r22, [%r10 + 0x0008]
	.word 0xe4728008  ! 287: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe8234008  ! 288: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe0530008  ! 294: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe803a030  ! 295: LDUW_I	lduw	[%r14 + 0x0030], %r20
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
	.word 0xec3b8008  ! 1: STD_R	std	%r22, [%r14 + %r8]
	.word 0xec3b8008  ! 5: STD_R	std	%r22, [%r14 + %r8]
	.word 0xe84b0008  ! 7: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xe45b0008  ! 8: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe4338008  ! 9: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xec334008  ! 12: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xe8118008  ! 14: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe033a018  ! 15: STH_I	sth	%r16, [%r14 + 0x0018]
	.word 0xe0134008  ! 28: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe82ba030  ! 29: STB_I	stb	%r20, [%r14 + 0x0030]
	.word 0xe05a8008  ! 32: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe029c008  ! 34: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe0530008  ! 38: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe43b6000  ! 39: STD_I	std	%r18, [%r13 + 0x0000]
	.word 0xe4018008  ! 40: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa081e018  ! 41: ADDcc_I	addcc 	%r7, 0x0018, %r16
	.word 0xec41a038  ! 50: LDSW_I	ldsw	[%r6 + 0x0038], %r22
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xec12c008  ! 64: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xe82ba030  ! 68: STB_I	stb	%r20, [%r14 + 0x0030]
	.word 0xec0ae030  ! 70: LDUB_I	ldub	[%r11 + 0x0030], %r22
	.word 0xe429a020  ! 72: STB_I	stb	%r18, [%r6 + 0x0020]
	.word 0xe032c008  ! 73: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe01b0008  ! 74: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xec218008  ! 79: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe01b8008  ! 81: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe0598008  ! 91: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4498008  ! 92: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe04b0008  ! 94: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xec72a000  ! 97: STX_I	stx	%r22, [%r10 + 0x0000]
	.word 0xa041c008  ! 101: ADDC_R	addc 	%r7, %r8, %r16
	.word 0xec42c008  ! 103: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xe82ac008  ! 104: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe40ac008  ! 105: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe05b4008  ! 107: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe03b4008  ! 108: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe0498008  ! 109: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe83a8008  ! 110: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe42ac008  ! 113: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe032e010  ! 115: STH_I	sth	%r16, [%r11 + 0x0010]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe00a8008  ! 118: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xec736000  ! 119: STX_I	stx	%r22, [%r13 + 0x0000]
	.word 0xe029c008  ! 121: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec72c008  ! 126: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec118008  ! 130: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe80ba038  ! 143: LDUB_I	ldub	[%r14 + 0x0038], %r20
	.word 0xe00ae010  ! 145: LDUB_I	ldub	[%r11 + 0x0010], %r16
	.word 0xe42ae030  ! 148: STB_I	stb	%r18, [%r11 + 0x0030]
	.word 0xe4418008  ! 152: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe41b4008  ! 155: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xe019a020  ! 159: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xe03ba030  ! 160: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xec130008  ! 164: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe403a028  ! 165: LDUW_I	lduw	[%r14 + 0x0028], %r18
	.word 0xe41a8008  ! 166: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe419c008  ! 167: LDD_R	ldd	[%r7 + %r8], %r18
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0728008  ! 169: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec2b8008  ! 172: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe4534008  ! 177: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe8236008  ! 186: STW_I	stw	%r20, [%r13 + 0x0008]
	.word 0xec3b6000  ! 187: STD_I	std	%r22, [%r13 + 0x0000]
	.word 0xe8428008  ! 189: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xe4132008  ! 191: LDUH_I	lduh	[%r12 + 0x0008], %r18
	.word 0xe401c008  ! 193: LDUW_R	lduw	[%r7 + %r8], %r18
	.word 0xe022e018  ! 196: STW_I	stw	%r16, [%r11 + 0x0018]
	.word 0xec5b8008  ! 198: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xec71e010  ! 199: STX_I	stx	%r22, [%r7 + 0x0010]
	.word 0xe013a008  ! 201: LDUH_I	lduh	[%r14 + 0x0008], %r16
	.word 0xe8728008  ! 202: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xe832a018  ! 205: STH_I	sth	%r20, [%r10 + 0x0018]
	.word 0xe00ae000  ! 206: LDUB_I	ldub	[%r11 + 0x0000], %r16
	.word 0xe40ae038  ! 207: LDUB_I	ldub	[%r11 + 0x0038], %r18
	.word 0xe871a028  ! 210: STX_I	stx	%r20, [%r6 + 0x0028]
	.word 0xe03ae038  ! 212: STD_I	std	%r16, [%r11 + 0x0038]
	.word 0xe0736010  ! 215: STX_I	stx	%r16, [%r13 + 0x0010]
	.word 0xe851c008  ! 217: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe029a028  ! 218: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe00b6020  ! 219: LDUB_I	ldub	[%r13 + 0x0020], %r16
	.word 0xec136018  ! 221: LDUH_I	lduh	[%r13 + 0x0018], %r22
	.word 0xe02ba010  ! 222: STB_I	stb	%r16, [%r14 + 0x0010]
	.word 0xe03b4008  ! 223: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec298008  ! 226: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe449c008  ! 228: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe8418008  ! 229: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xec22a000  ! 230: STW_I	stw	%r22, [%r10 + 0x0000]
	.word 0xe832e030  ! 231: STH_I	sth	%r20, [%r11 + 0x0030]
	.word 0xe41ac008  ! 235: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe42ba010  ! 237: STB_I	stb	%r18, [%r14 + 0x0010]
	.word 0xe029a010  ! 238: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xec32e008  ! 241: STH_I	sth	%r22, [%r11 + 0x0008]
	.word 0xe052c008  ! 244: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe81b6018  ! 246: LDD_I	ldd	[%r13 + 0x0018], %r20
	.word 0xe022c008  ! 247: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe4498008  ! 253: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe00ae030  ! 255: LDUB_I	ldub	[%r11 + 0x0030], %r16
	.word 0xe002c008  ! 258: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe02aa020  ! 262: STB_I	stb	%r16, [%r10 + 0x0020]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xec02a000  ! 266: LDUW_I	lduw	[%r10 + 0x0000], %r22
	.word 0xec198008  ! 267: LDD_R	ldd	[%r6 + %r8], %r22
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe8432010  ! 271: LDSW_I	ldsw	[%r12 + 0x0010], %r20
	.word 0xe00b0008  ! 276: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe0432030  ! 278: LDSW_I	ldsw	[%r12 + 0x0030], %r16
	.word 0xe0298008  ! 283: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe82b4008  ! 285: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec2ac008  ! 287: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe829a030  ! 288: STB_I	stb	%r20, [%r6 + 0x0030]
	.word 0xe80ae018  ! 294: LDUB_I	ldub	[%r11 + 0x0018], %r20
	.word 0xe852a018  ! 295: LDSH_I	ldsh	[%r10 + 0x0018], %r20
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
	.word 0xe022c008  ! 1: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe021a000  ! 5: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe8098008  ! 7: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe003a028  ! 8: LDUW_I	lduw	[%r14 + 0x0028], %r16
	.word 0xe829a020  ! 9: STB_I	stb	%r20, [%r6 + 0x0020]
	.word 0xe4738008  ! 12: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe04b6020  ! 14: LDSB_I	ldsb	[%r13 + 0x0020], %r16
	.word 0xec22e038  ! 15: STW_I	stw	%r22, [%r11 + 0x0038]
	.word 0xe059c008  ! 28: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xec31e010  ! 29: STH_I	sth	%r22, [%r7 + 0x0010]
	.word 0xe40b2020  ! 32: LDUB_I	ldub	[%r12 + 0x0020], %r18
	.word 0xec334008  ! 34: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xe843a010  ! 38: LDSW_I	ldsw	[%r14 + 0x0010], %r20
	.word 0xe8398008  ! 39: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe059c008  ! 40: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xa031e018  ! 41: ORN_I	orn 	%r7, 0x0018, %r16
	.word 0xe4498008  ! 50: LDSB_R	ldsb	[%r6 + %r8], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec118008  ! 64: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe071c008  ! 68: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec4ac008  ! 70: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe03b4008  ! 72: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec2b4008  ! 73: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xec59a010  ! 74: LDX_I	ldx	[%r6 + 0x0010], %r22
	.word 0xe022e028  ! 79: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xe80b6010  ! 81: LDUB_I	ldub	[%r13 + 0x0010], %r20
	.word 0xe04b2018  ! 91: LDSB_I	ldsb	[%r12 + 0x0018], %r16
	.word 0xe8098008  ! 92: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe8034008  ! 94: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xe8736018  ! 97: STX_I	stx	%r20, [%r13 + 0x0018]
	.word 0xa8218008  ! 101: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe8098008  ! 103: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe4232030  ! 104: STW_I	stw	%r18, [%r12 + 0x0030]
	.word 0xe04b6000  ! 105: LDSB_I	ldsb	[%r13 + 0x0000], %r16
	.word 0xe051e028  ! 107: LDSH_I	ldsh	[%r7 + 0x0028], %r16
	.word 0xe03ae000  ! 108: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xec034008  ! 109: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe4732000  ! 110: STX_I	stx	%r18, [%r12 + 0x0000]
	.word 0xe032e020  ! 113: STH_I	sth	%r16, [%r11 + 0x0020]
	.word 0xe039a038  ! 115: STD_I	std	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe8036010  ! 118: LDUW_I	lduw	[%r13 + 0x0010], %r20
	.word 0xe471a028  ! 119: STX_I	stx	%r18, [%r6 + 0x0028]
	.word 0xec31a038  ! 121: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xe432e020  ! 126: STH_I	sth	%r18, [%r11 + 0x0020]
	.word 0xe84b4008  ! 130: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe009c008  ! 143: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe053a000  ! 145: LDSH_I	ldsh	[%r14 + 0x0000], %r16
	.word 0xe822a030  ! 148: STW_I	stw	%r20, [%r10 + 0x0030]
	.word 0xec59e000  ! 152: LDX_I	ldx	[%r7 + 0x0000], %r22
	.word 0xec498008  ! 155: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xec438008  ! 159: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xec218008  ! 160: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4036028  ! 164: LDUW_I	lduw	[%r13 + 0x0028], %r18
	.word 0xe451a038  ! 165: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	.word 0xe009a010  ! 166: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe819c008  ! 167: LDD_R	ldd	[%r7 + %r8], %r20
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe03aa038  ! 169: STD_I	std	%r16, [%r10 + 0x0038]
	.word 0xe02ba010  ! 172: STB_I	stb	%r16, [%r14 + 0x0010]
	.word 0xe0538008  ! 177: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe4232028  ! 186: STW_I	stw	%r18, [%r12 + 0x0028]
	.word 0xe033a018  ! 187: STH_I	sth	%r16, [%r14 + 0x0018]
	.word 0xe05b0008  ! 189: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xec5ac008  ! 191: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe041a000  ! 193: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe029c008  ! 196: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe85aa028  ! 198: LDX_I	ldx	[%r10 + 0x0028], %r20
	.word 0xe0738008  ! 199: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe4018008  ! 201: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe02aa018  ! 202: STB_I	stb	%r16, [%r10 + 0x0018]
	.word 0xe0732010  ! 205: STX_I	stx	%r16, [%r12 + 0x0010]
	.word 0xe053a028  ! 206: LDSH_I	ldsh	[%r14 + 0x0028], %r16
	.word 0xe0536020  ! 207: LDSH_I	ldsh	[%r13 + 0x0020], %r16
	.word 0xec31a018  ! 210: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xe831a038  ! 212: STH_I	sth	%r20, [%r6 + 0x0038]
	.word 0xe421e020  ! 215: STW_I	stw	%r18, [%r7 + 0x0020]
	.word 0xe409c008  ! 217: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe8228008  ! 218: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe819a008  ! 219: LDD_I	ldd	[%r6 + 0x0008], %r20
	.word 0xec032018  ! 221: LDUW_I	lduw	[%r12 + 0x0018], %r22
	.word 0xe0734008  ! 222: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe0328008  ! 223: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe4718008  ! 226: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec098008  ! 228: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe049a000  ! 229: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe43ac008  ! 230: STD_R	std	%r18, [%r11 + %r8]
	.word 0xe83b2020  ! 231: STD_I	std	%r20, [%r12 + 0x0020]
	.word 0xec430008  ! 235: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xe071e008  ! 237: STX_I	stx	%r16, [%r7 + 0x0008]
	.word 0xec330008  ! 238: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xec228008  ! 241: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe0028008  ! 244: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xec5ac008  ! 246: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe4718008  ! 247: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe819a028  ! 253: LDD_I	ldd	[%r6 + 0x0028], %r20
	.word 0xe019a008  ! 255: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe002c008  ! 258: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe8228008  ! 262: STW_R	stw	%r20, [%r10 + %r8]
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xec4ac008  ! 266: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe4130008  ! 267: LDUH_R	lduh	[%r12 + %r8], %r18
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe00b4008  ! 271: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe01b8008  ! 276: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xec4b2018  ! 278: LDSB_I	ldsb	[%r12 + 0x0018], %r22
	.word 0xe071a020  ! 283: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe42b0008  ! 285: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xec23a030  ! 287: STW_I	stw	%r22, [%r14 + 0x0030]
	.word 0xe0232030  ! 288: STW_I	stw	%r16, [%r12 + 0x0030]
	.word 0xe019e000  ! 294: LDD_I	ldd	[%r7 + 0x0000], %r16
	.word 0xec1aa018  ! 295: LDD_I	ldd	[%r10 + 0x0018], %r22
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
	.word 0xe4730008  ! 1: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe03b8008  ! 5: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe84ba008  ! 7: LDSB_I	ldsb	[%r14 + 0x0008], %r20
	.word 0xec19a000  ! 8: LDD_I	ldd	[%r6 + 0x0000], %r22
	.word 0xe039a010  ! 9: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe0338008  ! 12: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe41b2018  ! 14: LDD_I	ldd	[%r12 + 0x0018], %r18
	.word 0xe0398008  ! 15: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe04ac008  ! 28: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe029c008  ! 29: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xec11a028  ! 32: LDUH_I	lduh	[%r6 + 0x0028], %r22
	.word 0xe021c008  ! 34: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xec4aa010  ! 38: LDSB_I	ldsb	[%r10 + 0x0010], %r22
	.word 0xec318008  ! 39: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe05aa010  ! 40: LDX_I	ldx	[%r10 + 0x0010], %r16
	.word 0xa8bac008  ! 41: XNORcc_R	xnorcc 	%r11, %r8, %r20
	.word 0xec438008  ! 50: LDSW_R	ldsw	[%r14 + %r8], %r22
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe0030008  ! 64: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe8298008  ! 68: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe0128008  ! 70: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xec398008  ! 72: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe8736030  ! 73: STX_I	stx	%r20, [%r13 + 0x0030]
	.word 0xec5b6008  ! 74: LDX_I	ldx	[%r13 + 0x0008], %r22
	.word 0xe8318008  ! 79: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe441a030  ! 81: LDSW_I	ldsw	[%r6 + 0x0030], %r18
	.word 0xe85ba008  ! 91: LDX_I	ldx	[%r14 + 0x0008], %r20
	.word 0xe0428008  ! 92: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe01aa018  ! 94: LDD_I	ldd	[%r10 + 0x0018], %r16
	.word 0xec736008  ! 97: STX_I	stx	%r22, [%r13 + 0x0008]
	.word 0xa41ae008  ! 101: XOR_I	xor 	%r11, 0x0008, %r18
	.word 0xec5aa010  ! 103: LDX_I	ldx	[%r10 + 0x0010], %r22
	.word 0xe8398008  ! 104: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe051a018  ! 105: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe8034008  ! 107: LDUW_R	lduw	[%r13 + %r8], %r20
	.word 0xec31a020  ! 108: STH_I	sth	%r22, [%r6 + 0x0020]
	.word 0xe459a010  ! 109: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xec21c008  ! 110: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe071c008  ! 113: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe039a028  ! 115: STD_I	std	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xec5a8008  ! 118: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xec230008  ! 119: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe4336030  ! 121: STH_I	sth	%r18, [%r13 + 0x0030]
	.word 0xe029e030  ! 126: STB_I	stb	%r16, [%r7 + 0x0030]
	.word 0xe8518008  ! 130: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe852c008  ! 143: LDSH_R	ldsh	[%r11 + %r8], %r20
	.word 0xe4198008  ! 145: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xec22e018  ! 148: STW_I	stw	%r22, [%r11 + 0x0018]
	.word 0xe01b8008  ! 152: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe80b0008  ! 155: LDUB_R	ldub	[%r12 + %r8], %r20
	.word 0xe409a020  ! 159: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xec2b8008  ! 160: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xec19c008  ! 164: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xe002c008  ! 165: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe8030008  ! 166: LDUW_R	lduw	[%r12 + %r8], %r20
	.word 0xec434008  ! 167: LDSW_R	ldsw	[%r13 + %r8], %r22
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe023a008  ! 169: STW_I	stw	%r16, [%r14 + 0x0008]
	.word 0xe0332018  ! 172: STH_I	sth	%r16, [%r12 + 0x0018]
	.word 0xe041a020  ! 177: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xe031e000  ! 186: STH_I	sth	%r16, [%r7 + 0x0000]
	.word 0xe021a028  ! 187: STW_I	stw	%r16, [%r6 + 0x0028]
	.word 0xe0130008  ! 189: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe0130008  ! 191: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe0136008  ! 193: LDUH_I	lduh	[%r13 + 0x0008], %r16
	.word 0xe0718008  ! 196: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe41a8008  ! 198: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe43ae028  ! 199: STD_I	std	%r18, [%r11 + 0x0028]
	.word 0xe0598008  ! 201: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe831a030  ! 202: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xe03b4008  ! 205: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe011a010  ! 206: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xe019c008  ! 207: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe471e000  ! 210: STX_I	stx	%r18, [%r7 + 0x0000]
	.word 0xe8232028  ! 212: STW_I	stw	%r20, [%r12 + 0x0028]
	.word 0xe022a008  ! 215: STW_I	stw	%r16, [%r10 + 0x0008]
	.word 0xe85ac008  ! 217: LDX_R	ldx	[%r11 + %r8], %r20
	.word 0xe42ae010  ! 218: STB_I	stb	%r18, [%r11 + 0x0010]
	.word 0xe051c008  ! 219: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xec59e010  ! 221: LDX_I	ldx	[%r7 + 0x0010], %r22
	.word 0xe0330008  ! 222: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe021a020  ! 223: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe03ba000  ! 226: STD_I	std	%r16, [%r14 + 0x0000]
	.word 0xe851e008  ! 228: LDSH_I	ldsh	[%r7 + 0x0008], %r20
	.word 0xe042e010  ! 229: LDSW_I	ldsw	[%r11 + 0x0010], %r16
	.word 0xec31e018  ! 230: STH_I	sth	%r22, [%r7 + 0x0018]
	.word 0xe43b6038  ! 231: STD_I	std	%r18, [%r13 + 0x0038]
	.word 0xe0418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe8398008  ! 237: STD_R	std	%r20, [%r6 + %r8]
	.word 0xec32a000  ! 238: STH_I	sth	%r22, [%r10 + 0x0000]
	.word 0xe43a8008  ! 241: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe05b2020  ! 244: LDX_I	ldx	[%r12 + 0x0020], %r16
	.word 0xe40b2030  ! 246: LDUB_I	ldub	[%r12 + 0x0030], %r18
	.word 0xe8330008  ! 247: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe4498008  ! 253: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe01b0008  ! 255: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe041c008  ! 258: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe8732000  ! 262: STX_I	stx	%r20, [%r12 + 0x0000]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec128008  ! 266: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe051a038  ! 267: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xec4ae030  ! 271: LDSB_I	ldsb	[%r11 + 0x0030], %r22
	.word 0xe4138008  ! 276: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe00aa010  ! 278: LDUB_I	ldub	[%r10 + 0x0010], %r16
	.word 0xe032a018  ! 283: STH_I	sth	%r16, [%r10 + 0x0018]
	.word 0xe021a038  ! 285: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe8734008  ! 287: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe822e028  ! 288: STW_I	stw	%r20, [%r11 + 0x0028]
	.word 0xe051e008  ! 294: LDSH_I	ldsh	[%r7 + 0x0008], %r16
	.word 0xe842e030  ! 295: LDSW_I	ldsw	[%r11 + 0x0030], %r20
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
	.word 0xe4334008  ! 1: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe8336038  ! 5: STH_I	sth	%r20, [%r13 + 0x0038]
	.word 0xe8018008  ! 7: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xec43a008  ! 8: LDSW_I	ldsw	[%r14 + 0x0008], %r22
	.word 0xe0318008  ! 9: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec298008  ! 12: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe8098008  ! 14: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe872e008  ! 15: STX_I	stx	%r20, [%r11 + 0x0008]
	.word 0xe0018008  ! 28: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe471e028  ! 29: STX_I	stx	%r18, [%r7 + 0x0028]
	.word 0xec02c008  ! 32: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe0336000  ! 34: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe001a000  ! 38: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe4218008  ! 39: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe41b0008  ! 40: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xa003a000  ! 41: ADD_I	add 	%r14, 0x0000, %r16
	.word 0xe0098008  ! 50: LDUB_R	ldub	[%r6 + %r8], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe45aa038  ! 64: LDX_I	ldx	[%r10 + 0x0038], %r18
	.word 0xe0398008  ! 68: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0528008  ! 70: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe471e020  ! 72: STX_I	stx	%r18, [%r7 + 0x0020]
	.word 0xe4338008  ! 73: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe013a018  ! 74: LDUH_I	lduh	[%r14 + 0x0018], %r16
	.word 0xe021c008  ! 79: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe0518008  ! 81: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8436028  ! 91: LDSW_I	ldsw	[%r13 + 0x0028], %r20
	.word 0xe859e030  ! 92: LDX_I	ldx	[%r7 + 0x0030], %r20
	.word 0xe802a018  ! 94: LDUW_I	lduw	[%r10 + 0x0018], %r20
	.word 0xe0334008  ! 97: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xa0098008  ! 101: AND_R	and 	%r6, %r8, %r16
	.word 0xec11c008  ! 103: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xe033a000  ! 104: STH_I	sth	%r16, [%r14 + 0x0000]
	.word 0xe459c008  ! 105: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xe0528008  ! 107: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe03ba030  ! 108: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xe042a010  ! 109: LDSW_I	ldsw	[%r10 + 0x0010], %r16
	.word 0xe8236030  ! 110: STW_I	stw	%r20, [%r13 + 0x0030]
	.word 0xe422c008  ! 113: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe832c008  ! 115: STH_R	sth	%r20, [%r11 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe859c008  ! 118: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe8736018  ! 119: STX_I	stx	%r20, [%r13 + 0x0018]
	.word 0xe0336018  ! 121: STH_I	sth	%r16, [%r13 + 0x0018]
	.word 0xe03b2020  ! 126: STD_I	std	%r16, [%r12 + 0x0020]
	.word 0xec4aa008  ! 130: LDSB_I	ldsb	[%r10 + 0x0008], %r22
	.word 0xe41ae010  ! 143: LDD_I	ldd	[%r11 + 0x0010], %r18
	.word 0xe449a028  ! 145: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xe0332028  ! 148: STH_I	sth	%r16, [%r12 + 0x0028]
	.word 0xe0018008  ! 152: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe44ac008  ! 155: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xec59a028  ! 159: LDX_I	ldx	[%r6 + 0x0028], %r22
	.word 0xe4398008  ! 160: STD_R	std	%r18, [%r6 + %r8]
	.word 0xec5ba028  ! 164: LDX_I	ldx	[%r14 + 0x0028], %r22
	.word 0xe4538008  ! 165: LDSH_R	ldsh	[%r14 + %r8], %r18
	.word 0xe419c008  ! 166: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe80ae038  ! 167: LDUB_I	ldub	[%r11 + 0x0038], %r20
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe073a038  ! 169: STX_I	stx	%r16, [%r14 + 0x0038]
	.word 0xe029e000  ! 172: STB_I	stb	%r16, [%r7 + 0x0000]
	.word 0xe0018008  ! 177: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe072c008  ! 186: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe02b6020  ! 187: STB_I	stb	%r16, [%r13 + 0x0020]
	.word 0xe859c008  ! 189: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe409e000  ! 191: LDUB_I	ldub	[%r7 + 0x0000], %r18
	.word 0xe052a018  ! 193: LDSH_I	ldsh	[%r10 + 0x0018], %r16
	.word 0xe472c008  ! 196: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe049a008  ! 198: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xe0318008  ! 199: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe011a038  ! 201: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xec318008  ! 202: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe8398008  ! 205: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe419a000  ! 206: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe051c008  ! 207: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe031a008  ! 210: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe071a000  ! 212: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xe4234008  ! 215: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe442c008  ! 217: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe829a000  ! 218: STB_I	stb	%r20, [%r6 + 0x0000]
	.word 0xe40ba018  ! 219: LDUB_I	ldub	[%r14 + 0x0018], %r18
	.word 0xe851a030  ! 221: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xec31a018  ! 222: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xe839e008  ! 223: STD_I	std	%r20, [%r7 + 0x0008]
	.word 0xec29a030  ! 226: STB_I	stb	%r22, [%r6 + 0x0030]
	.word 0xe04b2018  ! 228: LDSB_I	ldsb	[%r12 + 0x0018], %r16
	.word 0xe001c008  ! 229: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe43ba018  ! 230: STD_I	std	%r18, [%r14 + 0x0018]
	.word 0xe82b6020  ! 231: STB_I	stb	%r20, [%r13 + 0x0020]
	.word 0xec41e018  ! 235: LDSW_I	ldsw	[%r7 + 0x0018], %r22
	.word 0xe0298008  ! 237: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe02b6010  ! 238: STB_I	stb	%r16, [%r13 + 0x0010]
	.word 0xe4232038  ! 241: STW_I	stw	%r18, [%r12 + 0x0038]
	.word 0xe853a010  ! 244: LDSH_I	ldsh	[%r14 + 0x0010], %r20
	.word 0xec03a018  ! 246: LDUW_I	lduw	[%r14 + 0x0018], %r22
	.word 0xe4330008  ! 247: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xec19a028  ! 253: LDD_I	ldd	[%r6 + 0x0028], %r22
	.word 0xe0438008  ! 255: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe051a028  ! 258: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xe029a028  ! 262: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xec01e028  ! 266: LDUW_I	lduw	[%r7 + 0x0028], %r22
	.word 0xe801e020  ! 267: LDUW_I	lduw	[%r7 + 0x0020], %r20
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0118008  ! 271: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe4428008  ! 276: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xe419c008  ! 278: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe031c008  ! 283: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe031c008  ! 285: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xec318008  ! 287: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec21a010  ! 288: STW_I	stw	%r22, [%r6 + 0x0010]
	.word 0xe0138008  ! 294: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe44ac008  ! 295: LDSB_R	ldsb	[%r11 + %r8], %r18
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
	.word 0xe4398008  ! 1: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe03ba020  ! 5: STD_I	std	%r16, [%r14 + 0x0020]
	.word 0xe8536008  ! 7: LDSH_I	ldsh	[%r13 + 0x0008], %r20
	.word 0xe8138008  ! 8: LDUH_R	lduh	[%r14 + %r8], %r20
	.word 0xe0734008  ! 9: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe422e028  ! 12: STW_I	stw	%r18, [%r11 + 0x0028]
	.word 0xe0130008  ! 14: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xec332008  ! 15: STH_I	sth	%r22, [%r12 + 0x0008]
	.word 0xe042e038  ! 28: LDSW_I	ldsw	[%r11 + 0x0038], %r16
	.word 0xe0318008  ! 29: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe412a000  ! 32: LDUH_I	lduh	[%r10 + 0x0000], %r18
	.word 0xe8332028  ! 34: STH_I	sth	%r20, [%r12 + 0x0028]
	.word 0xe01b2000  ! 38: LDD_I	ldd	[%r12 + 0x0000], %r16
	.word 0xe029a030  ! 39: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xe853a010  ! 40: LDSH_I	ldsh	[%r14 + 0x0010], %r20
	.word 0xa8432018  ! 41: ADDC_I	addc 	%r12, 0x0018, %r20
	.word 0xe04ae018  ! 50: LDSB_I	ldsb	[%r11 + 0x0018], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe849c008  ! 64: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe871a030  ! 68: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xe81b2008  ! 70: LDD_I	ldd	[%r12 + 0x0008], %r20
	.word 0xe831c008  ! 72: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe02b0008  ! 73: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec5b6000  ! 74: LDX_I	ldx	[%r13 + 0x0000], %r22
	.word 0xe4230008  ! 79: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe411e028  ! 81: LDUH_I	lduh	[%r7 + 0x0028], %r18
	.word 0xe0130008  ! 91: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe813a020  ! 92: LDUH_I	lduh	[%r14 + 0x0020], %r20
	.word 0xec01a000  ! 94: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xe4730008  ! 97: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xa02b0008  ! 101: ANDN_R	andn 	%r12, %r8, %r16
	.word 0xe40aa008  ! 103: LDUB_I	ldub	[%r10 + 0x0008], %r18
	.word 0xe4234008  ! 104: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe45b0008  ! 105: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe811a000  ! 107: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xe0298008  ! 108: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe4598008  ! 109: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe8718008  ! 110: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe072c008  ! 113: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xec734008  ! 115: STX_R	stx	%r22, [%r13 + %r8]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xec09c008  ! 118: LDUB_R	ldub	[%r7 + %r8], %r22
	.word 0xe0398008  ! 119: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0234008  ! 121: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe831a028  ! 126: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe852c008  ! 130: LDSH_R	ldsh	[%r11 + %r8], %r20
	.word 0xe8538008  ! 143: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe41b0008  ! 145: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe83b8008  ! 148: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe44ae028  ! 152: LDSB_I	ldsb	[%r11 + 0x0028], %r18
	.word 0xe451e000  ! 155: LDSH_I	ldsh	[%r7 + 0x0000], %r18
	.word 0xec118008  ! 159: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xec3ae028  ! 160: STD_I	std	%r22, [%r11 + 0x0028]
	.word 0xe0198008  ! 164: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe85b4008  ! 165: LDX_R	ldx	[%r13 + %r8], %r20
	.word 0xe0498008  ! 166: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe84a8008  ! 167: LDSB_R	ldsb	[%r10 + %r8], %r20
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe03ba018  ! 169: STD_I	std	%r16, [%r14 + 0x0018]
	.word 0xe039c008  ! 172: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe842a000  ! 177: LDSW_I	ldsw	[%r10 + 0x0000], %r20
	.word 0xe021c008  ! 186: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe071a028  ! 187: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xe011c008  ! 189: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe041c008  ! 191: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xec0aa010  ! 193: LDUB_I	ldub	[%r10 + 0x0010], %r22
	.word 0xe82aa018  ! 196: STB_I	stb	%r20, [%r10 + 0x0018]
	.word 0xe812e020  ! 198: LDUH_I	lduh	[%r11 + 0x0020], %r20
	.word 0xe4728008  ! 199: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe0032000  ! 201: LDUW_I	lduw	[%r12 + 0x0000], %r16
	.word 0xe039c008  ! 202: STD_R	std	%r16, [%r7 + %r8]
	.word 0xec2b0008  ! 205: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xec12a020  ! 206: LDUH_I	lduh	[%r10 + 0x0020], %r22
	.word 0xe859a010  ! 207: LDX_I	ldx	[%r6 + 0x0010], %r20
	.word 0xe0218008  ! 210: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe021a018  ! 212: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe0298008  ! 215: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe001a000  ! 217: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe8338008  ! 218: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe859c008  ! 219: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe44b4008  ! 221: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xec39a020  ! 222: STD_I	std	%r22, [%r6 + 0x0020]
	.word 0xe839a010  ! 223: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xec398008  ! 226: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe0436010  ! 228: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	.word 0xe4534008  ! 229: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe82b6010  ! 230: STB_I	stb	%r20, [%r13 + 0x0010]
	.word 0xe8318008  ! 231: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe411c008  ! 235: LDUH_R	lduh	[%r7 + %r8], %r18
	.word 0xe4218008  ! 237: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec32a038  ! 238: STH_I	sth	%r22, [%r10 + 0x0038]
	.word 0xe0734008  ! 241: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe0128008  ! 244: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe04ae018  ! 246: LDSB_I	ldsb	[%r11 + 0x0018], %r16
	.word 0xec2b8008  ! 247: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe85ba028  ! 253: LDX_I	ldx	[%r14 + 0x0028], %r20
	.word 0xe0528008  ! 255: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe85b4008  ! 258: LDX_R	ldx	[%r13 + %r8], %r20
	.word 0xe0730008  ! 262: STX_R	stx	%r16, [%r12 + %r8]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xec5ac008  ! 266: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe0430008  ! 267: LDSW_R	ldsw	[%r12 + %r8], %r16
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xec0ae018  ! 271: LDUB_I	ldub	[%r11 + 0x0018], %r22
	.word 0xec41a020  ! 276: LDSW_I	ldsw	[%r6 + 0x0020], %r22
	.word 0xe4018008  ! 278: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe8228008  ! 283: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe422c008  ! 285: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe421c008  ! 287: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe423a010  ! 288: STW_I	stw	%r18, [%r14 + 0x0010]
	.word 0xe013a018  ! 294: LDUH_I	lduh	[%r14 + 0x0018], %r16
	.word 0xec43a038  ! 295: LDSW_I	ldsw	[%r14 + 0x0038], %r22
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
	.word 0xe073a008  ! 1: STX_I	stx	%r16, [%r14 + 0x0008]
	.word 0xe021e008  ! 5: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xe04b4008  ! 7: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe013a000  ! 8: LDUH_I	lduh	[%r14 + 0x0000], %r16
	.word 0xe0234008  ! 9: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec234008  ! 12: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe04ae018  ! 14: LDSB_I	ldsb	[%r11 + 0x0018], %r16
	.word 0xec21a028  ! 15: STW_I	stw	%r22, [%r6 + 0x0028]
	.word 0xe0028008  ! 28: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe029a000  ! 29: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe01b2020  ! 32: LDD_I	ldd	[%r12 + 0x0020], %r16
	.word 0xe4298008  ! 34: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe44b4008  ! 38: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe03a8008  ! 39: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe01ae000  ! 40: LDD_I	ldd	[%r11 + 0x0000], %r16
	.word 0xa03a8008  ! 41: XNOR_R	xnor 	%r10, %r8, %r16
	.word 0xe45b4008  ! 50: LDX_R	ldx	[%r13 + %r8], %r18
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xec598008  ! 64: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe03b8008  ! 68: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe8418008  ! 70: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe422e038  ! 72: STW_I	stw	%r18, [%r11 + 0x0038]
	.word 0xe43aa010  ! 73: STD_I	std	%r18, [%r10 + 0x0010]
	.word 0xe81b6010  ! 74: LDD_I	ldd	[%r13 + 0x0010], %r20
	.word 0xe02a8008  ! 79: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe85b0008  ! 81: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe01b8008  ! 91: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe8036028  ! 92: LDUW_I	lduw	[%r13 + 0x0028], %r20
	.word 0xe4028008  ! 94: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe42b0008  ! 97: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xa403a000  ! 101: ADD_I	add 	%r14, 0x0000, %r18
	.word 0xe04b6030  ! 103: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	.word 0xec23a020  ! 104: STW_I	stw	%r22, [%r14 + 0x0020]
	.word 0xe4018008  ! 105: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xec53a038  ! 107: LDSH_I	ldsh	[%r14 + 0x0038], %r22
	.word 0xe03b0008  ! 108: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe019a028  ! 109: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xe02b6008  ! 110: STB_I	stb	%r16, [%r13 + 0x0008]
	.word 0xe0234008  ! 113: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec73a028  ! 115: STX_I	stx	%r22, [%r14 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xec53a008  ! 118: LDSH_I	ldsh	[%r14 + 0x0008], %r22
	.word 0xe4338008  ! 119: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe8338008  ! 121: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe072a030  ! 126: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xe043a018  ! 130: LDSW_I	ldsw	[%r14 + 0x0018], %r16
	.word 0xe04ae038  ! 143: LDSB_I	ldsb	[%r11 + 0x0038], %r16
	.word 0xe84ac008  ! 145: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xec338008  ! 148: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe05b4008  ! 152: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe049a020  ! 155: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe0030008  ! 159: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe073a018  ! 160: STX_I	stx	%r16, [%r14 + 0x0018]
	.word 0xe05a8008  ! 164: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe85b8008  ! 165: LDX_R	ldx	[%r14 + %r8], %r20
	.word 0xe44b6038  ! 166: LDSB_I	ldsb	[%r13 + 0x0038], %r18
	.word 0xe0418008  ! 167: LDSW_R	ldsw	[%r6 + %r8], %r16
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe0728008  ! 169: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe03ac008  ! 172: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe8598008  ! 177: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xec21a020  ! 186: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xec2ac008  ! 187: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xe01b0008  ! 189: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xec1aa020  ! 191: LDD_I	ldd	[%r10 + 0x0020], %r22
	.word 0xec1b2018  ! 193: LDD_I	ldd	[%r12 + 0x0018], %r22
	.word 0xe8730008  ! 196: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe04b0008  ! 198: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xec218008  ! 199: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xec518008  ! 201: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe0230008  ! 202: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe4398008  ! 205: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe011a028  ! 206: LDUH_I	lduh	[%r6 + 0x0028], %r16
	.word 0xe4598008  ! 207: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xec73a008  ! 210: STX_I	stx	%r22, [%r14 + 0x0008]
	.word 0xe821a038  ! 212: STW_I	stw	%r20, [%r6 + 0x0038]
	.word 0xe0328008  ! 215: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe451c008  ! 217: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe02aa030  ! 218: STB_I	stb	%r16, [%r10 + 0x0030]
	.word 0xec438008  ! 219: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xe4498008  ! 221: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec732010  ! 222: STX_I	stx	%r22, [%r12 + 0x0010]
	.word 0xec218008  ! 223: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe42ba000  ! 226: STB_I	stb	%r18, [%r14 + 0x0000]
	.word 0xec018008  ! 228: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xec5ba008  ! 229: LDX_I	ldx	[%r14 + 0x0008], %r22
	.word 0xe03a8008  ! 230: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec39c008  ! 231: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe451c008  ! 235: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe029e020  ! 237: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xe021a020  ! 238: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe8730008  ! 241: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe85ae020  ! 244: LDX_I	ldx	[%r11 + 0x0020], %r20
	.word 0xe849a000  ! 246: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xe071a028  ! 247: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xe852e038  ! 253: LDSH_I	ldsh	[%r11 + 0x0038], %r20
	.word 0xe049a018  ! 255: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xec49c008  ! 258: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe0330008  ! 262: STH_R	sth	%r16, [%r12 + %r8]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe412e038  ! 266: LDUH_I	lduh	[%r11 + 0x0038], %r18
	.word 0xe852e018  ! 267: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe84ac008  ! 271: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xec41c008  ! 276: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe8532018  ! 278: LDSH_I	ldsh	[%r12 + 0x0018], %r20
	.word 0xe02ae030  ! 283: STB_I	stb	%r16, [%r11 + 0x0030]
	.word 0xec32c008  ! 285: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xec2b2038  ! 287: STB_I	stb	%r22, [%r12 + 0x0038]
	.word 0xec39a018  ! 288: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xe019c008  ! 294: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe0138008  ! 295: LDUH_R	lduh	[%r14 + %r8], %r16
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
	.word 0xe82b0008  ! 1: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe022e010  ! 5: STW_I	stw	%r16, [%r11 + 0x0010]
	.word 0xe00b0008  ! 7: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe05b6008  ! 8: LDX_I	ldx	[%r13 + 0x0008], %r16
	.word 0xe831c008  ! 9: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe471a018  ! 12: STX_I	stx	%r18, [%r6 + 0x0018]
	.word 0xe00b2010  ! 14: LDUB_I	ldub	[%r12 + 0x0010], %r16
	.word 0xe472a020  ! 15: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe041a030  ! 28: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xe0334008  ! 29: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec12a038  ! 32: LDUH_I	lduh	[%r10 + 0x0038], %r22
	.word 0xe871e008  ! 34: STX_I	stx	%r20, [%r7 + 0x0008]
	.word 0xec42a018  ! 38: LDSW_I	ldsw	[%r10 + 0x0018], %r22
	.word 0xe0734008  ! 39: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe402c008  ! 40: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xa402a010  ! 41: ADD_I	add 	%r10, 0x0010, %r18
	.word 0xec036018  ! 50: LDUW_I	lduw	[%r13 + 0x0018], %r22
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe412a010  ! 64: LDUH_I	lduh	[%r10 + 0x0010], %r18
	.word 0xe0736030  ! 68: STX_I	stx	%r16, [%r13 + 0x0030]
	.word 0xe84b8008  ! 70: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe472e008  ! 72: STX_I	stx	%r18, [%r11 + 0x0008]
	.word 0xe031a030  ! 73: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe0518008  ! 74: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe02b2000  ! 79: STB_I	stb	%r16, [%r12 + 0x0000]
	.word 0xe44b2018  ! 81: LDSB_I	ldsb	[%r12 + 0x0018], %r18
	.word 0xec034008  ! 91: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe042e000  ! 92: LDSW_I	ldsw	[%r11 + 0x0000], %r16
	.word 0xe002c008  ! 94: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe4728008  ! 97: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xac19a038  ! 101: XOR_I	xor 	%r6, 0x0038, %r22
	.word 0xe0198008  ! 103: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe032c008  ! 104: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe811c008  ! 105: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xe0132038  ! 107: LDUH_I	lduh	[%r12 + 0x0038], %r16
	.word 0xe03b8008  ! 108: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe0198008  ! 109: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xec71e020  ! 110: STX_I	stx	%r22, [%r7 + 0x0020]
	.word 0xe4336008  ! 113: STH_I	sth	%r18, [%r13 + 0x0008]
	.word 0xe42a8008  ! 115: STB_R	stb	%r18, [%r10 + %r8]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe052a028  ! 118: LDSH_I	ldsh	[%r10 + 0x0028], %r16
	.word 0xec29c008  ! 119: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe42ae008  ! 121: STB_I	stb	%r18, [%r11 + 0x0008]
	.word 0xec32a018  ! 126: STH_I	sth	%r22, [%r10 + 0x0018]
	.word 0xe45ae010  ! 130: LDX_I	ldx	[%r11 + 0x0010], %r18
	.word 0xec01c008  ! 143: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xec118008  ! 145: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe0318008  ! 148: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec01c008  ! 152: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe011e010  ! 155: LDUH_I	lduh	[%r7 + 0x0010], %r16
	.word 0xe8430008  ! 159: LDSW_R	ldsw	[%r12 + %r8], %r20
	.word 0xe029a018  ! 160: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xe009a028  ! 164: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xe85aa008  ! 165: LDX_I	ldx	[%r10 + 0x0008], %r20
	.word 0xe40b0008  ! 166: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xe84a8008  ! 167: LDSB_R	ldsb	[%r10 + %r8], %r20
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe822e028  ! 169: STW_I	stw	%r20, [%r11 + 0x0028]
	.word 0xe0238008  ! 172: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe81aa020  ! 177: LDD_I	ldd	[%r10 + 0x0020], %r20
	.word 0xe421a028  ! 186: STW_I	stw	%r18, [%r6 + 0x0028]
	.word 0xe43b4008  ! 187: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe8130008  ! 189: LDUH_R	lduh	[%r12 + %r8], %r20
	.word 0xe002a030  ! 191: LDUW_I	lduw	[%r10 + 0x0030], %r16
	.word 0xe049c008  ! 193: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xec2b2020  ! 196: STB_I	stb	%r22, [%r12 + 0x0020]
	.word 0xe05b6028  ! 198: LDX_I	ldx	[%r13 + 0x0028], %r16
	.word 0xe03ae010  ! 199: STD_I	std	%r16, [%r11 + 0x0010]
	.word 0xe04b8008  ! 201: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xec29a018  ! 202: STB_I	stb	%r22, [%r6 + 0x0018]
	.word 0xe0236000  ! 205: STW_I	stw	%r16, [%r13 + 0x0000]
	.word 0xe80b2028  ! 206: LDUB_I	ldub	[%r12 + 0x0028], %r20
	.word 0xe0418008  ! 207: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec3b4008  ! 210: STD_R	std	%r22, [%r13 + %r8]
	.word 0xec2ba000  ! 212: STB_I	stb	%r22, [%r14 + 0x0000]
	.word 0xe42b0008  ! 215: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe811e018  ! 217: LDUH_I	lduh	[%r7 + 0x0018], %r20
	.word 0xe43ba038  ! 218: STD_I	std	%r18, [%r14 + 0x0038]
	.word 0xe001c008  ! 219: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe811a020  ! 221: LDUH_I	lduh	[%r6 + 0x0020], %r20
	.word 0xe0232028  ! 222: STW_I	stw	%r16, [%r12 + 0x0028]
	.word 0xe8732010  ! 223: STX_I	stx	%r20, [%r12 + 0x0010]
	.word 0xe82ae018  ! 226: STB_I	stb	%r20, [%r11 + 0x0018]
	.word 0xec132008  ! 228: LDUH_I	lduh	[%r12 + 0x0008], %r22
	.word 0xe4198008  ! 229: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe429c008  ! 230: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe032c008  ! 231: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe852c008  ! 235: LDSH_R	ldsh	[%r11 + %r8], %r20
	.word 0xe873a008  ! 237: STX_I	stx	%r20, [%r14 + 0x0008]
	.word 0xe021a028  ! 238: STW_I	stw	%r16, [%r6 + 0x0028]
	.word 0xe42aa008  ! 241: STB_I	stb	%r18, [%r10 + 0x0008]
	.word 0xe849c008  ! 244: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe04b0008  ! 246: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe032e020  ! 247: STH_I	sth	%r16, [%r11 + 0x0020]
	.word 0xec19e038  ! 253: LDD_I	ldd	[%r7 + 0x0038], %r22
	.word 0xec4ba030  ! 255: LDSB_I	ldsb	[%r14 + 0x0030], %r22
	.word 0xe059e030  ! 258: LDX_I	ldx	[%r7 + 0x0030], %r16
	.word 0xec730008  ! 262: STX_R	stx	%r22, [%r12 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe0598008  ! 266: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe841a030  ! 267: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe819a008  ! 271: LDD_I	ldd	[%r6 + 0x0008], %r20
	.word 0xe0536018  ! 276: LDSH_I	ldsh	[%r13 + 0x0018], %r16
	.word 0xe40b0008  ! 278: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xe8218008  ! 283: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe03b4008  ! 285: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe43ba028  ! 287: STD_I	std	%r18, [%r14 + 0x0028]
	.word 0xe4718008  ! 288: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec118008  ! 294: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe4038008  ! 295: LDUW_R	lduw	[%r14 + %r8], %r18
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
	.word 0xe822a030  ! 1: STW_I	stw	%r20, [%r10 + 0x0030]
	.word 0xe829e030  ! 5: STB_I	stb	%r20, [%r7 + 0x0030]
	.word 0xe451a028  ! 7: LDSH_I	ldsh	[%r6 + 0x0028], %r18
	.word 0xe81b6038  ! 8: LDD_I	ldd	[%r13 + 0x0038], %r20
	.word 0xec330008  ! 9: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xe82ae008  ! 12: STB_I	stb	%r20, [%r11 + 0x0008]
	.word 0xec598008  ! 14: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe421e008  ! 15: STW_I	stw	%r18, [%r7 + 0x0008]
	.word 0xe81a8008  ! 28: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xe839a028  ! 29: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xe811c008  ! 32: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xe0338008  ! 34: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe4118008  ! 38: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe022a000  ! 39: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe4598008  ! 40: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xac92c008  ! 41: ORcc_R	orcc 	%r11, %r8, %r22
	.word 0xec41e010  ! 50: LDSW_I	ldsw	[%r7 + 0x0010], %r22
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0098008  ! 64: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec72c008  ! 68: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe8438008  ! 70: LDSW_R	ldsw	[%r14 + %r8], %r20
	.word 0xec32a030  ! 72: STH_I	sth	%r22, [%r10 + 0x0030]
	.word 0xe02b2008  ! 73: STB_I	stb	%r16, [%r12 + 0x0008]
	.word 0xe012e038  ! 74: LDUH_I	lduh	[%r11 + 0x0038], %r16
	.word 0xe0298008  ! 79: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe0418008  ! 81: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe859a030  ! 91: LDX_I	ldx	[%r6 + 0x0030], %r20
	.word 0xe05ba010  ! 92: LDX_I	ldx	[%r14 + 0x0010], %r16
	.word 0xe00a8008  ! 94: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xec39c008  ! 97: STD_R	std	%r22, [%r7 + %r8]
	.word 0xac9ac008  ! 101: XORcc_R	xorcc 	%r11, %r8, %r22
	.word 0xe451c008  ! 103: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe433a018  ! 104: STH_I	sth	%r18, [%r14 + 0x0018]
	.word 0xe45ac008  ! 105: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe84aa000  ! 107: LDSB_I	ldsb	[%r10 + 0x0000], %r20
	.word 0xe0718008  ! 108: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe04aa038  ! 109: LDSB_I	ldsb	[%r10 + 0x0038], %r16
	.word 0xe42b6008  ! 110: STB_I	stb	%r18, [%r13 + 0x0008]
	.word 0xe0298008  ! 113: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec29a020  ! 115: STB_I	stb	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe0418008  ! 118: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe822a030  ! 119: STW_I	stw	%r20, [%r10 + 0x0030]
	.word 0xe8718008  ! 121: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe43b2030  ! 126: STD_I	std	%r18, [%r12 + 0x0030]
	.word 0xe40b2010  ! 130: LDUB_I	ldub	[%r12 + 0x0010], %r18
	.word 0xe059e018  ! 143: LDX_I	ldx	[%r7 + 0x0018], %r16
	.word 0xec01a020  ! 145: LDUW_I	lduw	[%r6 + 0x0020], %r22
	.word 0xe02aa018  ! 148: STB_I	stb	%r16, [%r10 + 0x0018]
	.word 0xe84b8008  ! 152: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xec518008  ! 155: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe441e000  ! 159: LDSW_I	ldsw	[%r7 + 0x0000], %r18
	.word 0xec736000  ! 160: STX_I	stx	%r22, [%r13 + 0x0000]
	.word 0xe00aa010  ! 164: LDUB_I	ldub	[%r10 + 0x0010], %r16
	.word 0xe8528008  ! 165: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xec436030  ! 166: LDSW_I	ldsw	[%r13 + 0x0030], %r22
	.word 0xe0438008  ! 167: LDSW_R	ldsw	[%r14 + %r8], %r16
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe821a018  ! 169: STW_I	stw	%r20, [%r6 + 0x0018]
	.word 0xe031c008  ! 172: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe452e038  ! 177: LDSH_I	ldsh	[%r11 + 0x0038], %r18
	.word 0xec318008  ! 186: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec738008  ! 187: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe80ba030  ! 189: LDUB_I	ldub	[%r14 + 0x0030], %r20
	.word 0xe842a018  ! 191: LDSW_I	ldsw	[%r10 + 0x0018], %r20
	.word 0xe05ae028  ! 193: LDX_I	ldx	[%r11 + 0x0028], %r16
	.word 0xe021c008  ! 196: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe013a038  ! 198: LDUH_I	lduh	[%r14 + 0x0038], %r16
	.word 0xe0728008  ! 199: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe011a000  ! 201: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xec72c008  ! 202: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec2aa018  ! 205: STB_I	stb	%r22, [%r10 + 0x0018]
	.word 0xe801e028  ! 206: LDUW_I	lduw	[%r7 + 0x0028], %r20
	.word 0xe451c008  ! 207: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe021a010  ! 210: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xe0218008  ! 212: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0336028  ! 215: STH_I	sth	%r16, [%r13 + 0x0028]
	.word 0xe01a8008  ! 217: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe8298008  ! 218: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe0528008  ! 219: LDSH_R	ldsh	[%r10 + %r8], %r16
	.word 0xe80b2038  ! 221: LDUB_I	ldub	[%r12 + 0x0038], %r20
	.word 0xec31a000  ! 222: STH_I	sth	%r22, [%r6 + 0x0000]
	.word 0xe82b4008  ! 223: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe4298008  ! 226: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xec428008  ! 228: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xe40b6028  ! 229: LDUB_I	ldub	[%r13 + 0x0028], %r18
	.word 0xe4230008  ! 230: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe82a8008  ! 231: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe411e028  ! 235: LDUH_I	lduh	[%r7 + 0x0028], %r18
	.word 0xe02b8008  ! 237: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe8232008  ! 238: STW_I	stw	%r20, [%r12 + 0x0008]
	.word 0xe0718008  ! 241: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe002e030  ! 244: LDUW_I	lduw	[%r11 + 0x0030], %r16
	.word 0xe4430008  ! 246: LDSW_R	ldsw	[%r12 + %r8], %r18
	.word 0xe8398008  ! 247: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe05b2028  ! 253: LDX_I	ldx	[%r12 + 0x0028], %r16
	.word 0xe449e020  ! 255: LDSB_I	ldsb	[%r7 + 0x0020], %r18
	.word 0xe011a008  ! 258: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xec3b0008  ! 262: STD_R	std	%r22, [%r12 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe809a020  ! 266: LDUB_I	ldub	[%r6 + 0x0020], %r20
	.word 0xe049c008  ! 267: LDSB_R	ldsb	[%r7 + %r8], %r16
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe043a028  ! 271: LDSW_I	ldsw	[%r14 + 0x0028], %r16
	.word 0xe4130008  ! 276: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xe4536000  ! 278: LDSH_I	ldsh	[%r13 + 0x0000], %r18
	.word 0xec2b6030  ! 283: STB_I	stb	%r22, [%r13 + 0x0030]
	.word 0xe022a010  ! 285: STW_I	stw	%r16, [%r10 + 0x0010]
	.word 0xe829a030  ! 287: STB_I	stb	%r20, [%r6 + 0x0030]
	.word 0xe031a038  ! 288: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xec51a018  ! 294: LDSH_I	ldsh	[%r6 + 0x0018], %r22
	.word 0xe001e018  ! 295: LDUW_I	lduw	[%r7 + 0x0018], %r16
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
	.word 0xe039a018  ! 1: STD_I	std	%r16, [%r6 + 0x0018]
	.word 0xe072e030  ! 5: STX_I	stx	%r16, [%r11 + 0x0030]
	.word 0xe01b0008  ! 7: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe4534008  ! 8: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xec33a030  ! 9: STH_I	sth	%r22, [%r14 + 0x0030]
	.word 0xe42ba018  ! 12: STB_I	stb	%r18, [%r14 + 0x0018]
	.word 0xe81a8008  ! 14: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xe029a010  ! 15: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe0034008  ! 28: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe8734008  ! 29: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xec4b6000  ! 32: LDSB_I	ldsb	[%r13 + 0x0000], %r22
	.word 0xe0236000  ! 34: STW_I	stw	%r16, [%r13 + 0x0000]
	.word 0xe85b2018  ! 38: LDX_I	ldx	[%r12 + 0x0018], %r20
	.word 0xe831a008  ! 39: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xe842e030  ! 40: LDSW_I	ldsw	[%r11 + 0x0030], %r20
	.word 0xa82a8008  ! 41: ANDN_R	andn 	%r10, %r8, %r20
	.word 0xe04a8008  ! 50: LDSB_R	ldsb	[%r10 + %r8], %r16
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe44a8008  ! 64: LDSB_R	ldsb	[%r10 + %r8], %r18
	.word 0xec318008  ! 68: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec52a038  ! 70: LDSH_I	ldsh	[%r10 + 0x0038], %r22
	.word 0xe02b0008  ! 72: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe039a000  ! 73: STD_I	std	%r16, [%r6 + 0x0000]
	.word 0xe442c008  ! 74: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe431a028  ! 79: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xe001a028  ! 81: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xe0428008  ! 91: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe059c008  ! 92: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe8528008  ! 94: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe02b4008  ! 97: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xa02b2030  ! 101: ANDN_I	andn 	%r12, 0x0030, %r16
	.word 0xec59a030  ! 103: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xe03a8008  ! 104: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe8032008  ! 105: LDUW_I	lduw	[%r12 + 0x0008], %r20
	.word 0xe4598008  ! 107: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe832a008  ! 108: STH_I	sth	%r20, [%r10 + 0x0008]
	.word 0xe849c008  ! 109: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe8398008  ! 110: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe42ac008  ! 113: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe431c008  ! 115: STH_R	sth	%r18, [%r7 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe042e038  ! 118: LDSW_I	ldsw	[%r11 + 0x0038], %r16
	.word 0xe02ae028  ! 119: STB_I	stb	%r16, [%r11 + 0x0028]
	.word 0xe8336020  ! 121: STH_I	sth	%r20, [%r13 + 0x0020]
	.word 0xe43b4008  ! 126: STD_R	std	%r18, [%r13 + %r8]
	.word 0xec59e000  ! 130: LDX_I	ldx	[%r7 + 0x0000], %r22
	.word 0xe00b4008  ! 143: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe019e018  ! 145: LDD_I	ldd	[%r7 + 0x0018], %r16
	.word 0xe022a008  ! 148: STW_I	stw	%r16, [%r10 + 0x0008]
	.word 0xe0418008  ! 152: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe401a020  ! 155: LDUW_I	lduw	[%r6 + 0x0020], %r18
	.word 0xe041a020  ! 159: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	.word 0xe823a018  ! 160: STW_I	stw	%r20, [%r14 + 0x0018]
	.word 0xec11a000  ! 164: LDUH_I	lduh	[%r6 + 0x0000], %r22
	.word 0xe819c008  ! 165: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xe0138008  ! 166: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec59e028  ! 167: LDX_I	ldx	[%r7 + 0x0028], %r22
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe02b8008  ! 169: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe0736038  ! 172: STX_I	stx	%r16, [%r13 + 0x0038]
	.word 0xe00b0008  ! 177: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe421a010  ! 186: STW_I	stw	%r18, [%r6 + 0x0010]
	.word 0xe4736020  ! 187: STX_I	stx	%r18, [%r13 + 0x0020]
	.word 0xe0530008  ! 189: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe45aa008  ! 191: LDX_I	ldx	[%r10 + 0x0008], %r18
	.word 0xe0028008  ! 193: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe831a008  ! 196: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xe44b4008  ! 198: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe8232030  ! 199: STW_I	stw	%r20, [%r12 + 0x0030]
	.word 0xe002e038  ! 201: LDUW_I	lduw	[%r11 + 0x0038], %r16
	.word 0xec29a038  ! 202: STB_I	stb	%r22, [%r6 + 0x0038]
	.word 0xe471e030  ! 205: STX_I	stx	%r18, [%r7 + 0x0030]
	.word 0xe45ba028  ! 206: LDX_I	ldx	[%r14 + 0x0028], %r18
	.word 0xe0498008  ! 207: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xec72e030  ! 210: STX_I	stx	%r22, [%r11 + 0x0030]
	.word 0xe0328008  ! 212: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe4330008  ! 215: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe0118008  ! 217: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe031a030  ! 218: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe4518008  ! 219: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe011c008  ! 221: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe82aa020  ! 222: STB_I	stb	%r20, [%r10 + 0x0020]
	.word 0xe029e020  ! 223: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xe423a010  ! 226: STW_I	stw	%r18, [%r14 + 0x0010]
	.word 0xe05ba020  ! 228: LDX_I	ldx	[%r14 + 0x0020], %r16
	.word 0xe442a008  ! 229: LDSW_I	ldsw	[%r10 + 0x0008], %r18
	.word 0xe022c008  ! 230: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe821e000  ! 231: STW_I	stw	%r20, [%r7 + 0x0000]
	.word 0xe01b8008  ! 235: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe072c008  ! 237: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe022e008  ! 238: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe03aa028  ! 241: STD_I	std	%r16, [%r10 + 0x0028]
	.word 0xe4030008  ! 244: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xe0434008  ! 246: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe472c008  ! 247: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xec098008  ! 253: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe81ae000  ! 255: LDD_I	ldd	[%r11 + 0x0000], %r20
	.word 0xe812a038  ! 258: LDUH_I	lduh	[%r10 + 0x0038], %r20
	.word 0xec330008  ! 262: STH_R	sth	%r22, [%r12 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe809c008  ! 266: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xe002a008  ! 267: LDUW_I	lduw	[%r10 + 0x0008], %r16
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe4434008  ! 271: LDSW_R	ldsw	[%r13 + %r8], %r18
	.word 0xe049a020  ! 276: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe8598008  ! 278: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xec3ba038  ! 283: STD_I	std	%r22, [%r14 + 0x0038]
	.word 0xe4218008  ! 285: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe83ba030  ! 287: STD_I	std	%r20, [%r14 + 0x0030]
	.word 0xec718008  ! 288: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe019a020  ! 294: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xe042a038  ! 295: LDSW_I	ldsw	[%r10 + 0x0038], %r16
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
	.word 0xe42a8008  ! 1: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xec71e008  ! 5: STX_I	stx	%r22, [%r7 + 0x0008]
	.word 0xe8138008  ! 7: LDUH_R	lduh	[%r14 + %r8], %r20
	.word 0xe0434008  ! 8: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe42b4008  ! 9: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xec230008  ! 12: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe409a038  ! 14: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xec738008  ! 15: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe812c008  ! 28: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe03ba018  ! 29: STD_I	std	%r16, [%r14 + 0x0018]
	.word 0xe04b4008  ! 32: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe42b4008  ! 34: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe85aa030  ! 38: LDX_I	ldx	[%r10 + 0x0030], %r20
	.word 0xec732030  ! 39: STX_I	stx	%r22, [%r12 + 0x0030]
	.word 0xe0028008  ! 40: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xac3b2018  ! 41: XNOR_I	xnor 	%r12, 0x0018, %r22
	.word 0xe841e018  ! 50: LDSW_I	ldsw	[%r7 + 0x0018], %r20
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xec49c008  ! 64: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xec734008  ! 68: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe051a008  ! 70: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xec234008  ! 72: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe071a038  ! 73: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe00b8008  ! 74: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe472c008  ! 79: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe00ba010  ! 81: LDUB_I	ldub	[%r14 + 0x0010], %r16
	.word 0xe81ba028  ! 91: LDD_I	ldd	[%r14 + 0x0028], %r20
	.word 0xec418008  ! 92: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe843a028  ! 94: LDSW_I	ldsw	[%r14 + 0x0028], %r20
	.word 0xe43b8008  ! 97: STD_R	std	%r18, [%r14 + %r8]
	.word 0xa4a28008  ! 101: SUBcc_R	subcc 	%r10, %r8, %r18
	.word 0xe401a018  ! 103: LDUW_I	lduw	[%r6 + 0x0018], %r18
	.word 0xe4232028  ! 104: STW_I	stw	%r18, [%r12 + 0x0028]
	.word 0xe85b2038  ! 105: LDX_I	ldx	[%r12 + 0x0038], %r20
	.word 0xec038008  ! 107: LDUW_R	lduw	[%r14 + %r8], %r22
	.word 0xe0330008  ! 108: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe41b0008  ! 109: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xec236008  ! 110: STW_I	stw	%r22, [%r13 + 0x0008]
	.word 0xe422e030  ! 113: STW_I	stw	%r18, [%r11 + 0x0030]
	.word 0xe031a008  ! 115: STH_I	sth	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xec428008  ! 118: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xe8236038  ! 119: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xe0718008  ! 121: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0228008  ! 126: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe859e028  ! 130: LDX_I	ldx	[%r7 + 0x0028], %r20
	.word 0xe01ae010  ! 143: LDD_I	ldd	[%r11 + 0x0010], %r16
	.word 0xec034008  ! 145: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe831c008  ! 148: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe84ae028  ! 152: LDSB_I	ldsb	[%r11 + 0x0028], %r20
	.word 0xe411e008  ! 155: LDUH_I	lduh	[%r7 + 0x0008], %r18
	.word 0xe44b8008  ! 159: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe43ba000  ! 160: STD_I	std	%r18, [%r14 + 0x0000]
	.word 0xe0428008  ! 164: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe4598008  ! 165: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe0018008  ! 166: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe01aa018  ! 167: LDD_I	ldd	[%r10 + 0x0018], %r16
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xec72a038  ! 169: STX_I	stx	%r22, [%r10 + 0x0038]
	.word 0xe03b2008  ! 172: STD_I	std	%r16, [%r12 + 0x0008]
	.word 0xec5b8008  ! 177: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe429a038  ! 186: STB_I	stb	%r18, [%r6 + 0x0038]
	.word 0xe4398008  ! 187: STD_R	std	%r18, [%r6 + %r8]
	.word 0xec0b4008  ! 189: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xe059c008  ! 191: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe0118008  ! 193: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe8238008  ! 196: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe413a020  ! 198: LDUH_I	lduh	[%r14 + 0x0020], %r18
	.word 0xe8218008  ! 199: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe0098008  ! 201: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe022c008  ! 202: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe039a018  ! 205: STD_I	std	%r16, [%r6 + 0x0018]
	.word 0xe0518008  ! 206: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xec11a000  ! 207: LDUH_I	lduh	[%r6 + 0x0000], %r22
	.word 0xe03b0008  ! 210: STD_R	std	%r16, [%r12 + %r8]
	.word 0xec3b4008  ! 212: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe83aa038  ! 215: STD_I	std	%r20, [%r10 + 0x0038]
	.word 0xec0b8008  ! 217: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xe0318008  ! 218: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe04ae020  ! 219: LDSB_I	ldsb	[%r11 + 0x0020], %r16
	.word 0xe001a000  ! 221: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe02b0008  ! 222: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe071e030  ! 223: STX_I	stx	%r16, [%r7 + 0x0030]
	.word 0xe0234008  ! 226: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe81b6018  ! 228: LDD_I	ldd	[%r13 + 0x0018], %r20
	.word 0xe00b2038  ! 229: LDUB_I	ldub	[%r12 + 0x0038], %r16
	.word 0xe82b0008  ! 230: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe029a038  ! 231: STB_I	stb	%r16, [%r6 + 0x0038]
	.word 0xec09a000  ! 235: LDUB_I	ldub	[%r6 + 0x0000], %r22
	.word 0xe0336000  ! 237: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xec2ae008  ! 238: STB_I	stb	%r22, [%r11 + 0x0008]
	.word 0xec32c008  ! 241: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe4098008  ! 244: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe011a008  ! 246: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xe071c008  ! 247: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec1b2008  ! 253: LDD_I	ldd	[%r12 + 0x0008], %r22
	.word 0xe4432018  ! 255: LDSW_I	ldsw	[%r12 + 0x0018], %r18
	.word 0xe8536030  ! 258: LDSH_I	ldsh	[%r13 + 0x0030], %r20
	.word 0xec71c008  ! 262: STX_R	stx	%r22, [%r7 + %r8]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe0438008  ! 266: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe8134008  ! 267: LDUH_R	lduh	[%r13 + %r8], %r20
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	.word 0xe45b4008  ! 271: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xe8198008  ! 276: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe811e020  ! 278: LDUH_I	lduh	[%r7 + 0x0020], %r20
	.word 0xe83ae000  ! 283: STD_I	std	%r20, [%r11 + 0x0000]
	.word 0xe871a030  ! 285: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xe4218008  ! 287: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe03ba030  ! 288: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xec42a028  ! 294: LDSW_I	ldsw	[%r10 + 0x0028], %r22
	.word 0xe44b4008  ! 295: LDSB_R	ldsb	[%r13 + %r8], %r18
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
	.word 0xec336000  ! 1: STH_I	sth	%r22, [%r13 + 0x0000]
	.word 0xe0398008  ! 5: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe8028008  ! 7: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xe4018008  ! 8: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe0328008  ! 9: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe0718008  ! 12: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe041a038  ! 14: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xe4728008  ! 15: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec19e000  ! 28: LDD_I	ldd	[%r7 + 0x0000], %r22
	.word 0xe421e008  ! 29: STW_I	stw	%r18, [%r7 + 0x0008]
	.word 0xe8418008  ! 32: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe071e030  ! 34: STX_I	stx	%r16, [%r7 + 0x0030]
	.word 0xe0534008  ! 38: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xec21a018  ! 39: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe0098008  ! 40: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa49b4008  ! 41: XORcc_R	xorcc 	%r13, %r8, %r18
	.word 0xe41b6038  ! 50: LDD_I	ldd	[%r13 + 0x0038], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xec528008  ! 64: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xec218008  ! 68: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe802a008  ! 70: LDUW_I	lduw	[%r10 + 0x0008], %r20
	.word 0xe0730008  ! 72: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xec3b8008  ! 73: STD_R	std	%r22, [%r14 + %r8]
	.word 0xec5b8008  ! 74: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe0738008  ! 79: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe44b4008  ! 81: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe4434008  ! 91: LDSW_R	ldsw	[%r13 + %r8], %r18
	.word 0xe05b4008  ! 92: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe4028008  ! 94: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe02aa018  ! 97: STB_I	stb	%r16, [%r10 + 0x0018]
	.word 0xa0c1c008  ! 101: ADDCcc_R	addccc 	%r7, %r8, %r16
	.word 0xe40ae028  ! 103: LDUB_I	ldub	[%r11 + 0x0028], %r18
	.word 0xe431a018  ! 104: STH_I	sth	%r18, [%r6 + 0x0018]
	.word 0xec4b6018  ! 105: LDSB_I	ldsb	[%r13 + 0x0018], %r22
	.word 0xe40b8008  ! 107: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xec71a028  ! 108: STX_I	stx	%r22, [%r6 + 0x0028]
	.word 0xe842e000  ! 109: LDSW_I	ldsw	[%r11 + 0x0000], %r20
	.word 0xe43ae020  ! 110: STD_I	std	%r18, [%r11 + 0x0020]
	.word 0xe871a010  ! 113: STX_I	stx	%r20, [%r6 + 0x0010]
	.word 0xec3a8008  ! 115: STD_R	std	%r22, [%r10 + %r8]
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe40ba010  ! 118: LDUB_I	ldub	[%r14 + 0x0010], %r18
	.word 0xe039a010  ! 119: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe021e028  ! 121: STW_I	stw	%r16, [%r7 + 0x0028]
	.word 0xe8330008  ! 126: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe012a028  ! 130: LDUH_I	lduh	[%r10 + 0x0028], %r16
	.word 0xe01ae000  ! 143: LDD_I	ldd	[%r11 + 0x0000], %r16
	.word 0xe44ae010  ! 145: LDSB_I	ldsb	[%r11 + 0x0010], %r18
	.word 0xe82b4008  ! 148: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec01e030  ! 152: LDUW_I	lduw	[%r7 + 0x0030], %r22
	.word 0xe042e028  ! 155: LDSW_I	ldsw	[%r11 + 0x0028], %r16
	.word 0xec53a000  ! 159: LDSH_I	ldsh	[%r14 + 0x0000], %r22
	.word 0xe022c008  ! 160: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe012e000  ! 164: LDUH_I	lduh	[%r11 + 0x0000], %r16
	.word 0xe0536020  ! 165: LDSH_I	ldsh	[%r13 + 0x0020], %r16
	.word 0xe8136038  ! 166: LDUH_I	lduh	[%r13 + 0x0038], %r20
	.word 0xe0534008  ! 167: LDSH_R	ldsh	[%r13 + %r8], %r16
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe429e008  ! 169: STB_I	stb	%r18, [%r7 + 0x0008]
	.word 0xe0734008  ! 172: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe44b0008  ! 177: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xe039c008  ! 186: STD_R	std	%r16, [%r7 + %r8]
	.word 0xec3b2028  ! 187: STD_I	std	%r22, [%r12 + 0x0028]
	.word 0xe04b0008  ! 189: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe409e008  ! 191: LDUB_I	ldub	[%r7 + 0x0008], %r18
	.word 0xec1b8008  ! 193: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xe021c008  ! 196: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe002a008  ! 198: LDUW_I	lduw	[%r10 + 0x0008], %r16
	.word 0xe82ae018  ! 199: STB_I	stb	%r20, [%r11 + 0x0018]
	.word 0xe853a020  ! 201: LDSH_I	ldsh	[%r14 + 0x0020], %r20
	.word 0xe03ae000  ! 202: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xe022e000  ! 205: STW_I	stw	%r16, [%r11 + 0x0000]
	.word 0xe0036008  ! 206: LDUW_I	lduw	[%r13 + 0x0008], %r16
	.word 0xe019a020  ! 207: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xec318008  ! 210: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe02b8008  ! 212: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xec2ba008  ! 215: STB_I	stb	%r22, [%r14 + 0x0008]
	.word 0xe449c008  ! 217: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe071e030  ! 218: STX_I	stx	%r16, [%r7 + 0x0030]
	.word 0xe0536018  ! 219: LDSH_I	ldsh	[%r13 + 0x0018], %r16
	.word 0xe40ac008  ! 221: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe0332028  ! 222: STH_I	sth	%r16, [%r12 + 0x0028]
	.word 0xec3b4008  ! 223: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe83b8008  ! 226: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe059a018  ! 228: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xec01c008  ! 229: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe433a018  ! 230: STH_I	sth	%r18, [%r14 + 0x0018]
	.word 0xe472c008  ! 231: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe00b6010  ! 235: LDUB_I	ldub	[%r13 + 0x0010], %r16
	.word 0xe023a028  ! 237: STW_I	stw	%r16, [%r14 + 0x0028]
	.word 0xe022c008  ! 238: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe429a038  ! 241: STB_I	stb	%r18, [%r6 + 0x0038]
	.word 0xe851e010  ! 244: LDSH_I	ldsh	[%r7 + 0x0010], %r20
	.word 0xe84b4008  ! 246: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe0238008  ! 247: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe0136008  ! 253: LDUH_I	lduh	[%r13 + 0x0008], %r16
	.word 0xec19e020  ! 255: LDD_I	ldd	[%r7 + 0x0020], %r22
	.word 0xe85ae020  ! 258: LDX_I	ldx	[%r11 + 0x0020], %r20
	.word 0xe072e018  ! 262: STX_I	stx	%r16, [%r11 + 0x0018]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe05ac008  ! 266: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe012c008  ! 267: LDUH_R	lduh	[%r11 + %r8], %r16
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe051e000  ! 271: LDSH_I	ldsh	[%r7 + 0x0000], %r16
	.word 0xe449e000  ! 276: LDSB_I	ldsb	[%r7 + 0x0000], %r18
	.word 0xec49c008  ! 278: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe033a008  ! 283: STH_I	sth	%r16, [%r14 + 0x0008]
	.word 0xe8218008  ! 285: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe871a030  ! 287: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xe02ac008  ! 288: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xec598008  ! 294: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe8518008  ! 295: LDSH_R	ldsh	[%r6 + %r8], %r20
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
	.word 0xec22c008  ! 1: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe0338008  ! 5: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe04b2030  ! 7: LDSB_I	ldsb	[%r12 + 0x0030], %r16
	.word 0xe44ba020  ! 8: LDSB_I	ldsb	[%r14 + 0x0020], %r18
	.word 0xe022a028  ! 9: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xe02a8008  ! 12: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xec1b4008  ! 14: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe03b0008  ! 15: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe05b2000  ! 28: LDX_I	ldx	[%r12 + 0x0000], %r16
	.word 0xe0336018  ! 29: STH_I	sth	%r16, [%r13 + 0x0018]
	.word 0xe402e008  ! 32: LDUW_I	lduw	[%r11 + 0x0008], %r18
	.word 0xe03ae010  ! 34: STD_I	std	%r16, [%r11 + 0x0010]
	.word 0xe051a030  ! 38: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xec72e028  ! 39: STX_I	stx	%r22, [%r11 + 0x0028]
	.word 0xec1b8008  ! 40: LDD_R	ldd	[%r14 + %r8], %r22
	.word 0xa0b2e000  ! 41: SUBCcc_I	orncc 	%r11, 0x0000, %r16
	.word 0xe411a018  ! 50: LDUH_I	lduh	[%r6 + 0x0018], %r18
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe051a030  ! 64: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xe03b0008  ! 68: STD_R	std	%r16, [%r12 + %r8]
	.word 0xec1aa028  ! 70: LDD_I	ldd	[%r10 + 0x0028], %r22
	.word 0xe033a008  ! 72: STH_I	sth	%r16, [%r14 + 0x0008]
	.word 0xe4230008  ! 73: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe01ae038  ! 74: LDD_I	ldd	[%r11 + 0x0038], %r16
	.word 0xe82b4008  ! 79: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe0534008  ! 81: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe812c008  ! 91: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe4132028  ! 92: LDUH_I	lduh	[%r12 + 0x0028], %r18
	.word 0xec598008  ! 94: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe02b4008  ! 97: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xa842c008  ! 101: ADDC_R	addc 	%r11, %r8, %r20
	.word 0xec4ba038  ! 103: LDSB_I	ldsb	[%r14 + 0x0038], %r22
	.word 0xe832e008  ! 104: STH_I	sth	%r20, [%r11 + 0x0008]
	.word 0xe00b6018  ! 105: LDUB_I	ldub	[%r13 + 0x0018], %r16
	.word 0xe81ba000  ! 107: LDD_I	ldd	[%r14 + 0x0000], %r20
	.word 0xe831a010  ! 108: STH_I	sth	%r20, [%r6 + 0x0010]
	.word 0xe00ba018  ! 109: LDUB_I	ldub	[%r14 + 0x0018], %r16
	.word 0xe0238008  ! 110: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe429e010  ! 113: STB_I	stb	%r18, [%r7 + 0x0010]
	.word 0xe831c008  ! 115: STH_R	sth	%r20, [%r7 + %r8]
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe4518008  ! 118: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe022c008  ! 119: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe8728008  ! 121: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xe0298008  ! 126: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe851c008  ! 130: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe049a000  ! 143: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe041e038  ! 145: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	.word 0xec21a018  ! 148: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe05aa008  ! 152: LDX_I	ldx	[%r10 + 0x0008], %r16
	.word 0xe011a010  ! 155: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xe809e010  ! 159: LDUB_I	ldub	[%r7 + 0x0010], %r20
	.word 0xe4730008  ! 160: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe802e010  ! 164: LDUW_I	lduw	[%r11 + 0x0010], %r20
	.word 0xe4118008  ! 165: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe443a010  ! 166: LDSW_I	ldsw	[%r14 + 0x0010], %r18
	.word 0xe4032008  ! 167: LDUW_I	lduw	[%r12 + 0x0008], %r18
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe42b4008  ! 169: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe43b6000  ! 172: STD_I	std	%r18, [%r13 + 0x0000]
	.word 0xe80b2038  ! 177: LDUB_I	ldub	[%r12 + 0x0038], %r20
	.word 0xe42b2010  ! 186: STB_I	stb	%r18, [%r12 + 0x0010]
	.word 0xe829a010  ! 187: STB_I	stb	%r20, [%r6 + 0x0010]
	.word 0xe4418008  ! 189: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe04b8008  ! 191: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xec4b8008  ! 193: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe4330008  ! 196: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xec5b2000  ! 198: LDX_I	ldx	[%r12 + 0x0000], %r22
	.word 0xe832e000  ! 199: STH_I	sth	%r20, [%r11 + 0x0000]
	.word 0xe4098008  ! 201: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec3a8008  ! 202: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe03b0008  ! 205: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe009e010  ! 206: LDUB_I	ldub	[%r7 + 0x0010], %r16
	.word 0xe0098008  ! 207: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe03b0008  ! 210: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe821e010  ! 212: STW_I	stw	%r20, [%r7 + 0x0010]
	.word 0xe431a028  ! 215: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xe4098008  ! 217: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe029c008  ! 218: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe001a038  ! 219: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xe00ae010  ! 221: LDUB_I	ldub	[%r11 + 0x0010], %r16
	.word 0xe833a020  ! 222: STH_I	sth	%r20, [%r14 + 0x0020]
	.word 0xe8736020  ! 223: STX_I	stx	%r20, [%r13 + 0x0020]
	.word 0xe029a000  ! 226: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe409a030  ! 228: LDUB_I	ldub	[%r6 + 0x0030], %r18
	.word 0xe019a000  ! 229: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xe0328008  ! 230: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xec338008  ! 231: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe052a020  ! 235: LDSH_I	ldsh	[%r10 + 0x0020], %r16
	.word 0xe82b0008  ! 237: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe83ae030  ! 238: STD_I	std	%r20, [%r11 + 0x0030]
	.word 0xe0238008  ! 241: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe4530008  ! 244: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe04b6028  ! 246: LDSB_I	ldsb	[%r13 + 0x0028], %r16
	.word 0xec72e020  ! 247: STX_I	stx	%r22, [%r11 + 0x0020]
	.word 0xec0b4008  ! 253: LDUB_R	ldub	[%r13 + %r8], %r22
	.word 0xe4028008  ! 255: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe0598008  ! 258: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xec2aa020  ! 262: STB_I	stb	%r22, [%r10 + 0x0020]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0498008  ! 266: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe44a8008  ! 267: LDSB_R	ldsb	[%r10 + %r8], %r18
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	.word 0xe859c008  ! 271: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xec13a008  ! 276: LDUH_I	lduh	[%r14 + 0x0008], %r22
	.word 0xec034008  ! 278: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe839a030  ! 283: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe872e018  ! 285: STX_I	stx	%r20, [%r11 + 0x0018]
	.word 0xe4332038  ! 287: STH_I	sth	%r18, [%r12 + 0x0038]
	.word 0xec22a000  ! 288: STW_I	stw	%r22, [%r10 + 0x0000]
	.word 0xe449c008  ! 294: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe419a028  ! 295: LDD_I	ldd	[%r6 + 0x0028], %r18
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
	.word 0xe821e000  ! 1: STW_I	stw	%r20, [%r7 + 0x0000]
	.word 0xe8230008  ! 5: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xec434008  ! 7: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe002e028  ! 8: LDUW_I	lduw	[%r11 + 0x0028], %r16
	.word 0xe4218008  ! 9: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec2b8008  ! 12: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe0118008  ! 14: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe0218008  ! 15: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec018008  ! 28: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe039e000  ! 29: STD_I	std	%r16, [%r7 + 0x0000]
	.word 0xe0036018  ! 32: LDUW_I	lduw	[%r13 + 0x0018], %r16
	.word 0xe4334008  ! 34: STH_R	sth	%r18, [%r13 + %r8]
	.word 0xe04a8008  ! 38: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe022c008  ! 39: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe05ae038  ! 40: LDX_I	ldx	[%r11 + 0x0038], %r16
	.word 0xac31e020  ! 41: SUBC_I	orn 	%r7, 0x0020, %r22
	.word 0xec434008  ! 50: LDSW_R	ldsw	[%r13 + %r8], %r22
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe00b6000  ! 64: LDUB_I	ldub	[%r13 + 0x0000], %r16
	.word 0xe872a000  ! 68: STX_I	stx	%r20, [%r10 + 0x0000]
	.word 0xe0518008  ! 70: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe0318008  ! 72: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe8234008  ! 73: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe84b4008  ! 74: LDSB_R	ldsb	[%r13 + %r8], %r20
	.word 0xe02b6000  ! 79: STB_I	stb	%r16, [%r13 + 0x0000]
	.word 0xe4128008  ! 81: LDUH_R	lduh	[%r10 + %r8], %r18
	.word 0xe802c008  ! 91: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe01a8008  ! 92: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe8598008  ! 94: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xec398008  ! 97: STD_R	std	%r22, [%r6 + %r8]
	.word 0xa09b8008  ! 101: XORcc_R	xorcc 	%r14, %r8, %r16
	.word 0xe851a020  ! 103: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	.word 0xe072c008  ! 104: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe0134008  ! 105: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe00b4008  ! 107: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe03ac008  ! 108: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe459c008  ! 109: LDX_R	ldx	[%r7 + %r8], %r18
	.word 0xe83b2000  ! 110: STD_I	std	%r20, [%r12 + 0x0000]
	.word 0xec330008  ! 113: STH_R	sth	%r22, [%r12 + %r8]
	.word 0xec228008  ! 115: STW_R	stw	%r22, [%r10 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xe402c008  ! 118: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe821a010  ! 119: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe0232008  ! 121: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xe833a038  ! 126: STH_I	sth	%r20, [%r14 + 0x0038]
	.word 0xe04b8008  ! 130: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe00b6020  ! 143: LDUB_I	ldub	[%r13 + 0x0020], %r16
	.word 0xe819a030  ! 145: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xec22c008  ! 148: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe402e008  ! 152: LDUW_I	lduw	[%r11 + 0x0008], %r18
	.word 0xec138008  ! 155: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xe0130008  ! 159: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe472e020  ! 160: STX_I	stx	%r18, [%r11 + 0x0020]
	.word 0xe002c008  ! 164: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe0428008  ! 165: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe451a010  ! 166: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xe053a038  ! 167: LDSH_I	ldsh	[%r14 + 0x0038], %r16
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe83b2038  ! 169: STD_I	std	%r20, [%r12 + 0x0038]
	.word 0xe0718008  ! 172: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe819a020  ! 177: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xe071a020  ! 186: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe071c008  ! 187: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec536018  ! 189: LDSH_I	ldsh	[%r13 + 0x0018], %r22
	.word 0xe4128008  ! 191: LDUH_R	lduh	[%r10 + %r8], %r18
	.word 0xe049a000  ! 193: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xec398008  ! 196: STD_R	std	%r22, [%r6 + %r8]
	.word 0xec532020  ! 198: LDSH_I	ldsh	[%r12 + 0x0020], %r22
	.word 0xe02b0008  ! 199: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe8198008  ! 201: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe021e010  ! 202: STW_I	stw	%r16, [%r7 + 0x0010]
	.word 0xe4398008  ! 205: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe4198008  ! 206: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe4198008  ! 207: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe071a028  ! 210: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xe872a030  ! 212: STX_I	stx	%r20, [%r10 + 0x0030]
	.word 0xe0230008  ! 215: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe05a8008  ! 217: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe072e000  ! 218: STX_I	stx	%r16, [%r11 + 0x0000]
	.word 0xe001e038  ! 219: LDUW_I	lduw	[%r7 + 0x0038], %r16
	.word 0xe841a030  ! 221: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xec29a008  ! 222: STB_I	stb	%r22, [%r6 + 0x0008]
	.word 0xe42aa030  ! 223: STB_I	stb	%r18, [%r10 + 0x0030]
	.word 0xe83b0008  ! 226: STD_R	std	%r20, [%r12 + %r8]
	.word 0xe00b6008  ! 228: LDUB_I	ldub	[%r13 + 0x0008], %r16
	.word 0xe04b6038  ! 229: LDSB_I	ldsb	[%r13 + 0x0038], %r16
	.word 0xe821a010  ! 230: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe02b2028  ! 231: STB_I	stb	%r16, [%r12 + 0x0028]
	.word 0xe05b0008  ! 235: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe031c008  ! 237: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe021a038  ! 238: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe83ac008  ! 241: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe84b2020  ! 244: LDSB_I	ldsb	[%r12 + 0x0020], %r20
	.word 0xe05b6020  ! 246: LDX_I	ldx	[%r13 + 0x0020], %r16
	.word 0xe033a010  ! 247: STH_I	sth	%r16, [%r14 + 0x0010]
	.word 0xe81aa000  ! 253: LDD_I	ldd	[%r10 + 0x0000], %r20
	.word 0xe0438008  ! 255: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe45ae008  ! 258: LDX_I	ldx	[%r11 + 0x0008], %r18
	.word 0xe43aa010  ! 262: STD_I	std	%r18, [%r10 + 0x0010]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe05b0008  ! 266: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xec428008  ! 267: LDSW_R	ldsw	[%r10 + %r8], %r22
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe04ac008  ! 271: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe009e018  ! 276: LDUB_I	ldub	[%r7 + 0x0018], %r16
	.word 0xe059c008  ! 278: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe421a028  ! 283: STW_I	stw	%r18, [%r6 + 0x0028]
	.word 0xe073a020  ! 285: STX_I	stx	%r16, [%r14 + 0x0020]
	.word 0xe02b8008  ! 287: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe072c008  ! 288: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe819a010  ! 294: LDD_I	ldd	[%r6 + 0x0010], %r20
	.word 0xe8028008  ! 295: LDUW_R	lduw	[%r10 + %r8], %r20
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
	.word 0xe0218008  ! 1: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec736008  ! 5: STX_I	stx	%r22, [%r13 + 0x0008]
	.word 0xe8438008  ! 7: LDSW_R	ldsw	[%r14 + %r8], %r20
	.word 0xe0018008  ! 8: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe0732028  ! 9: STX_I	stx	%r16, [%r12 + 0x0028]
	.word 0xec2b8008  ! 12: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe41ac008  ! 14: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe4718008  ! 15: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe0098008  ! 28: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe0338008  ! 29: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe003a020  ! 32: LDUW_I	lduw	[%r14 + 0x0020], %r16
	.word 0xe03aa018  ! 34: STD_I	std	%r16, [%r10 + 0x0018]
	.word 0xe00ba010  ! 38: LDUB_I	ldub	[%r14 + 0x0010], %r16
	.word 0xe021a000  ! 39: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe44b2020  ! 40: LDSB_I	ldsb	[%r12 + 0x0020], %r18
	.word 0xa8a3a010  ! 41: SUBcc_I	subcc 	%r14, 0x0010, %r20
	.word 0xe842c008  ! 50: LDSW_R	ldsw	[%r11 + %r8], %r20
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xec198008  ! 64: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xec230008  ! 68: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe01a8008  ! 70: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe82b8008  ! 72: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe83b8008  ! 73: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe44ac008  ! 74: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xe8334008  ! 79: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xe012a008  ! 81: LDUH_I	lduh	[%r10 + 0x0008], %r16
	.word 0xe042c008  ! 91: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xec42a008  ! 92: LDSW_I	ldsw	[%r10 + 0x0008], %r22
	.word 0xe419a028  ! 94: LDD_I	ldd	[%r6 + 0x0028], %r18
	.word 0xe02b0008  ! 97: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xa8832008  ! 101: ADDcc_I	addcc 	%r12, 0x0008, %r20
	.word 0xe401e020  ! 103: LDUW_I	lduw	[%r7 + 0x0020], %r18
	.word 0xe8230008  ! 104: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe00a8008  ! 105: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe009a010  ! 107: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe0728008  ! 108: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec132028  ! 109: LDUH_I	lduh	[%r12 + 0x0028], %r22
	.word 0xec29a018  ! 110: STB_I	stb	%r22, [%r6 + 0x0018]
	.word 0xe03aa008  ! 113: STD_I	std	%r16, [%r10 + 0x0008]
	.word 0xe42ba030  ! 115: STB_I	stb	%r18, [%r14 + 0x0030]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe449e018  ! 118: LDSB_I	ldsb	[%r7 + 0x0018], %r18
	.word 0xe031a020  ! 119: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xec338008  ! 121: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe0218008  ! 126: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe45ba010  ! 130: LDX_I	ldx	[%r14 + 0x0010], %r18
	.word 0xe051a030  ! 143: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xe411a008  ! 145: LDUH_I	lduh	[%r6 + 0x0008], %r18
	.word 0xe8718008  ! 148: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xec430008  ! 152: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec09e018  ! 155: LDUB_I	ldub	[%r7 + 0x0018], %r22
	.word 0xec09a008  ! 159: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xec3b0008  ! 160: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe4036000  ! 164: LDUW_I	lduw	[%r13 + 0x0000], %r18
	.word 0xe01b4008  ! 165: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe012e020  ! 166: LDUH_I	lduh	[%r11 + 0x0020], %r16
	.word 0xe049a020  ! 167: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	setx	0x00000000d01ef080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe02aa030  ! 169: STB_I	stb	%r16, [%r10 + 0x0030]
	.word 0xe0234008  ! 172: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe0418008  ! 177: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe022e000  ! 186: STW_I	stw	%r16, [%r11 + 0x0000]
	.word 0xe032c008  ! 187: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xec118008  ! 189: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe01b4008  ! 191: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe001a020  ! 193: LDUW_I	lduw	[%r6 + 0x0020], %r16
	.word 0xec2b2038  ! 196: STB_I	stb	%r22, [%r12 + 0x0038]
	.word 0xe00b2000  ! 198: LDUB_I	ldub	[%r12 + 0x0000], %r16
	.word 0xe071c008  ! 199: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe00aa010  ! 201: LDUB_I	ldub	[%r10 + 0x0010], %r16
	.word 0xe071a020  ! 202: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe42ba000  ! 205: STB_I	stb	%r18, [%r14 + 0x0000]
	.word 0xe8132028  ! 206: LDUH_I	lduh	[%r12 + 0x0028], %r20
	.word 0xe049c008  ! 207: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe033a030  ! 210: STH_I	sth	%r16, [%r14 + 0x0030]
	.word 0xe82ae028  ! 212: STB_I	stb	%r20, [%r11 + 0x0028]
	.word 0xec23a038  ! 215: STW_I	stw	%r22, [%r14 + 0x0038]
	.word 0xe059c008  ! 217: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe0718008  ! 218: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0038008  ! 219: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe8028008  ! 221: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xec718008  ! 222: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe82b4008  ! 223: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec318008  ! 226: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe402e020  ! 228: LDUW_I	lduw	[%r11 + 0x0020], %r18
	.word 0xec41c008  ! 229: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe472a000  ! 230: STX_I	stx	%r18, [%r10 + 0x0000]
	.word 0xe073a000  ! 231: STX_I	stx	%r16, [%r14 + 0x0000]
	.word 0xe049c008  ! 235: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe031e008  ! 237: STH_I	sth	%r16, [%r7 + 0x0008]
	.word 0xec21e010  ! 238: STW_I	stw	%r22, [%r7 + 0x0010]
	.word 0xe032e010  ! 241: STH_I	sth	%r16, [%r11 + 0x0010]
	.word 0xec1b4008  ! 244: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe4498008  ! 246: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe839e030  ! 247: STD_I	std	%r20, [%r7 + 0x0030]
	.word 0xec598008  ! 253: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe45b8008  ! 255: LDX_R	ldx	[%r14 + %r8], %r18
	.word 0xe841a028  ! 258: LDSW_I	ldsw	[%r6 + 0x0028], %r20
	.word 0xe071c008  ! 262: STX_R	stx	%r16, [%r7 + %r8]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	.word 0xe051e020  ! 266: LDSH_I	ldsh	[%r7 + 0x0020], %r16
	.word 0xe41b2020  ! 267: LDD_I	ldd	[%r12 + 0x0020], %r18
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe84ac008  ! 271: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe8128008  ! 276: LDUH_R	lduh	[%r10 + %r8], %r20
	.word 0xec438008  ! 278: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xe022e038  ! 283: STW_I	stw	%r16, [%r11 + 0x0038]
	.word 0xe021a010  ! 285: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xec2b2020  ! 287: STB_I	stb	%r22, [%r12 + 0x0020]
	.word 0xe02b2020  ! 288: STB_I	stb	%r16, [%r12 + 0x0020]
	.word 0xe45b6010  ! 294: LDX_I	ldx	[%r13 + 0x0010], %r18
	.word 0xe0418008  ! 295: LDSW_R	ldsw	[%r6 + %r8], %r16
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
	.word 0xe8236010  ! 1: STW_I	stw	%r20, [%r13 + 0x0010]
	.word 0xe03aa018  ! 5: STD_I	std	%r16, [%r10 + 0x0018]
	.word 0xe843a000  ! 7: LDSW_I	ldsw	[%r14 + 0x0000], %r20
	.word 0xe0534008  ! 8: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe432a000  ! 9: STH_I	sth	%r18, [%r10 + 0x0000]
	.word 0xec22c008  ! 12: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xec41c008  ! 14: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe02b8008  ! 15: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe009c008  ! 28: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xec328008  ! 29: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe003a010  ! 32: LDUW_I	lduw	[%r14 + 0x0010], %r16
	.word 0xe03b2010  ! 34: STD_I	std	%r16, [%r12 + 0x0010]
	.word 0xe01ac008  ! 38: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe0334008  ! 39: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe4130008  ! 40: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xa0b2e030  ! 41: SUBCcc_I	orncc 	%r11, 0x0030, %r16
	.word 0xec53a018  ! 50: LDSH_I	ldsh	[%r14 + 0x0018], %r22
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe0018008  ! 64: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe039a028  ! 68: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xec43a030  ! 70: LDSW_I	ldsw	[%r14 + 0x0030], %r22
	.word 0xe839e038  ! 72: STD_I	std	%r20, [%r7 + 0x0038]
	.word 0xe03b4008  ! 73: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec5ac008  ! 74: LDX_R	ldx	[%r11 + %r8], %r22
	.word 0xe071a020  ! 79: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xe0598008  ! 81: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe8436018  ! 91: LDSW_I	ldsw	[%r13 + 0x0018], %r20
	.word 0xe419a010  ! 92: LDD_I	ldd	[%r6 + 0x0010], %r18
	.word 0xe049c008  ! 94: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe872e018  ! 97: STX_I	stx	%r20, [%r11 + 0x0018]
	.word 0xa4334008  ! 101: SUBC_R	orn 	%r13, %r8, %r18
	.word 0xec4ac008  ! 103: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe431a028  ! 104: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xec530008  ! 105: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xe4034008  ! 107: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe071a020  ! 108: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xec538008  ! 109: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xec2ae000  ! 110: STB_I	stb	%r22, [%r11 + 0x0000]
	.word 0xe4398008  ! 113: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe0728008  ! 115: STX_R	stx	%r16, [%r10 + %r8]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe00aa030  ! 118: LDUB_I	ldub	[%r10 + 0x0030], %r16
	.word 0xe02b0008  ! 119: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe022c008  ! 121: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xec338008  ! 126: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xec132008  ! 130: LDUH_I	lduh	[%r12 + 0x0008], %r22
	.word 0xe059e020  ! 143: LDX_I	ldx	[%r7 + 0x0020], %r16
	.word 0xec1b4008  ! 145: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe039e028  ! 148: STD_I	std	%r16, [%r7 + 0x0028]
	.word 0xe841c008  ! 152: LDSW_R	ldsw	[%r7 + %r8], %r20
	.word 0xec518008  ! 155: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe0434008  ! 159: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xec2aa038  ! 160: STB_I	stb	%r22, [%r10 + 0x0038]
	.word 0xe009e038  ! 164: LDUB_I	ldub	[%r7 + 0x0038], %r16
	.word 0xec53a008  ! 165: LDSH_I	ldsh	[%r14 + 0x0008], %r22
	.word 0xe409a020  ! 166: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xe41b8008  ! 167: LDD_R	ldd	[%r14 + %r8], %r18
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe473a010  ! 169: STX_I	stx	%r18, [%r14 + 0x0010]
	.word 0xe0336000  ! 172: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe80b6038  ! 177: LDUB_I	ldub	[%r13 + 0x0038], %r20
	.word 0xec398008  ! 186: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe429a010  ! 187: STB_I	stb	%r18, [%r6 + 0x0010]
	.word 0xe01b8008  ! 189: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe052c008  ! 191: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe0536030  ! 193: LDSH_I	ldsh	[%r13 + 0x0030], %r16
	.word 0xe03b0008  ! 196: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe0418008  ! 198: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe029a008  ! 199: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe011e028  ! 201: LDUH_I	lduh	[%r7 + 0x0028], %r16
	.word 0xe8736030  ! 202: STX_I	stx	%r20, [%r13 + 0x0030]
	.word 0xe03ba018  ! 205: STD_I	std	%r16, [%r14 + 0x0018]
	.word 0xe019a010  ! 206: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xec11a010  ! 207: LDUH_I	lduh	[%r6 + 0x0010], %r22
	.word 0xe871a010  ! 210: STX_I	stx	%r20, [%r6 + 0x0010]
	.word 0xec39a000  ! 212: STD_I	std	%r22, [%r6 + 0x0000]
	.word 0xe0234008  ! 215: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe04b8008  ! 217: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe03b6010  ! 218: STD_I	std	%r16, [%r13 + 0x0010]
	.word 0xe44b4008  ! 219: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe01ae018  ! 221: LDD_I	ldd	[%r11 + 0x0018], %r16
	.word 0xec2b8008  ! 222: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe02ae008  ! 223: STB_I	stb	%r16, [%r11 + 0x0008]
	.word 0xe031c008  ! 226: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe84ac008  ! 228: LDSB_R	ldsb	[%r11 + %r8], %r20
	.word 0xe04a8008  ! 229: LDSB_R	ldsb	[%r10 + %r8], %r16
	.word 0xe42b4008  ! 230: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe032e008  ! 231: STH_I	sth	%r16, [%r11 + 0x0008]
	.word 0xe849a020  ! 235: LDSB_I	ldsb	[%r6 + 0x0020], %r20
	.word 0xe0398008  ! 237: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0398008  ! 238: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe83aa030  ! 241: STD_I	std	%r20, [%r10 + 0x0030]
	.word 0xe05ae028  ! 244: LDX_I	ldx	[%r11 + 0x0028], %r16
	.word 0xe0130008  ! 246: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xe032a008  ! 247: STH_I	sth	%r16, [%r10 + 0x0008]
	.word 0xec530008  ! 253: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xec41c008  ! 255: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe0018008  ! 258: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe422c008  ! 262: STW_R	stw	%r18, [%r11 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe0132038  ! 266: LDUH_I	lduh	[%r12 + 0x0038], %r16
	.word 0xe0418008  ! 267: LDSW_R	ldsw	[%r6 + %r8], %r16
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe4130008  ! 271: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xec5a8008  ! 276: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xe0534008  ! 278: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe831a018  ! 283: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xe0734008  ! 285: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe821a018  ! 287: STW_I	stw	%r20, [%r6 + 0x0018]
	.word 0xe0236010  ! 288: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe8098008  ! 294: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe04ba008  ! 295: LDSB_I	ldsb	[%r14 + 0x0008], %r16
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
	.word 0xe42ae038  ! 1: STB_I	stb	%r18, [%r11 + 0x0038]
	.word 0xe021e000  ! 5: STW_I	stw	%r16, [%r7 + 0x0000]
	.word 0xec4aa018  ! 7: LDSB_I	ldsb	[%r10 + 0x0018], %r22
	.word 0xe449c008  ! 8: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xec21e018  ! 9: STW_I	stw	%r22, [%r7 + 0x0018]
	.word 0xe03a8008  ! 12: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe401a028  ! 14: LDUW_I	lduw	[%r6 + 0x0028], %r18
	.word 0xec22a010  ! 15: STW_I	stw	%r22, [%r10 + 0x0010]
	.word 0xe04aa028  ! 28: LDSB_I	ldsb	[%r10 + 0x0028], %r16
	.word 0xe072a020  ! 29: STX_I	stx	%r16, [%r10 + 0x0020]
	.word 0xe441e018  ! 32: LDSW_I	ldsw	[%r7 + 0x0018], %r18
	.word 0xe02a8008  ! 34: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe849c008  ! 38: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xec39c008  ! 39: STD_R	std	%r22, [%r7 + %r8]
	.word 0xe40ac008  ! 40: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xa4aae010  ! 41: ANDNcc_I	andncc 	%r11, 0x0010, %r18
	.word 0xe04a8008  ! 50: LDSB_R	ldsb	[%r10 + %r8], %r16
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe4436020  ! 64: LDSW_I	ldsw	[%r13 + 0x0020], %r18
	.word 0xe8238008  ! 68: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe04b4008  ! 70: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe0738008  ! 72: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0332010  ! 73: STH_I	sth	%r16, [%r12 + 0x0010]
	.word 0xe451a020  ! 74: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xe429c008  ! 79: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe05ae020  ! 81: LDX_I	ldx	[%r11 + 0x0020], %r16
	.word 0xe8418008  ! 91: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe0032020  ! 92: LDUW_I	lduw	[%r12 + 0x0020], %r16
	.word 0xe00b2030  ! 94: LDUB_I	ldub	[%r12 + 0x0030], %r16
	.word 0xe0738008  ! 97: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xaca18008  ! 101: SUBcc_R	subcc 	%r6, %r8, %r22
	.word 0xe0534008  ! 103: LDSH_R	ldsh	[%r13 + %r8], %r16
	.word 0xe029c008  ! 104: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe00aa028  ! 105: LDUB_I	ldub	[%r10 + 0x0028], %r16
	.word 0xec0b8008  ! 107: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xe43b2000  ! 108: STD_I	std	%r18, [%r12 + 0x0000]
	.word 0xe01b8008  ! 109: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xe021a038  ! 110: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe0728008  ! 113: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe022c008  ! 115: STW_R	stw	%r16, [%r11 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	.word 0xe801c008  ! 118: LDUW_R	lduw	[%r7 + %r8], %r20
	.word 0xe029a010  ! 119: STB_I	stb	%r16, [%r6 + 0x0010]
	.word 0xe0328008  ! 121: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe8298008  ! 126: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xec438008  ! 130: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xec538008  ! 143: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe8018008  ! 145: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe0318008  ! 148: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe051e010  ! 152: LDSH_I	ldsh	[%r7 + 0x0010], %r16
	.word 0xe042a020  ! 155: LDSW_I	ldsw	[%r10 + 0x0020], %r16
	.word 0xe0098008  ! 159: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe4218008  ! 160: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe002c008  ! 164: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xec4b4008  ! 165: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe00aa018  ! 166: LDUB_I	ldub	[%r10 + 0x0018], %r16
	.word 0xe00ae020  ! 167: LDUB_I	ldub	[%r11 + 0x0020], %r16
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe03ac008  ! 169: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe422c008  ! 172: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe051a000  ! 177: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xe8718008  ! 186: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe4318008  ! 187: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe0434008  ! 189: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe0498008  ! 191: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe05b8008  ! 193: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe0318008  ! 196: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe412e028  ! 198: LDUH_I	lduh	[%r11 + 0x0028], %r18
	.word 0xe02a8008  ! 199: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe8518008  ! 201: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe831a028  ! 202: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe031a018  ! 205: STH_I	sth	%r16, [%r6 + 0x0018]
	.word 0xe0434008  ! 206: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe4518008  ! 207: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe02b4008  ! 210: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe03b2010  ! 212: STD_I	std	%r16, [%r12 + 0x0010]
	.word 0xe4734008  ! 215: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xec51a010  ! 217: LDSH_I	ldsh	[%r6 + 0x0010], %r22
	.word 0xe0318008  ! 218: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec5b8008  ! 219: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe842c008  ! 221: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xe8230008  ! 222: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe0732010  ! 223: STX_I	stx	%r16, [%r12 + 0x0010]
	.word 0xe829e010  ! 226: STB_I	stb	%r20, [%r7 + 0x0010]
	.word 0xec49c008  ! 228: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe45ba038  ! 229: LDX_I	ldx	[%r14 + 0x0038], %r18
	.word 0xe8738008  ! 230: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xe4236008  ! 231: STW_I	stw	%r18, [%r13 + 0x0008]
	.word 0xe849c008  ! 235: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe0232008  ! 237: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xec3aa000  ! 238: STD_I	std	%r22, [%r10 + 0x0000]
	.word 0xec318008  ! 241: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe001e020  ! 244: LDUW_I	lduw	[%r7 + 0x0020], %r16
	.word 0xec49e028  ! 246: LDSB_I	ldsb	[%r7 + 0x0028], %r22
	.word 0xec218008  ! 247: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4036020  ! 253: LDUW_I	lduw	[%r13 + 0x0020], %r18
	.word 0xe80ae018  ! 255: LDUB_I	ldub	[%r11 + 0x0018], %r20
	.word 0xe01ac008  ! 258: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe0238008  ! 262: STW_R	stw	%r16, [%r14 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xe0536028  ! 266: LDSH_I	ldsh	[%r13 + 0x0028], %r16
	.word 0xe001c008  ! 267: LDUW_R	lduw	[%r7 + %r8], %r16
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe01ae028  ! 271: LDD_I	ldd	[%r11 + 0x0028], %r16
	.word 0xe4436018  ! 276: LDSW_I	ldsw	[%r13 + 0x0018], %r18
	.word 0xe4018008  ! 278: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe8228008  ! 283: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe472a018  ! 285: STX_I	stx	%r18, [%r10 + 0x0018]
	.word 0xe031a018  ! 287: STH_I	sth	%r16, [%r6 + 0x0018]
	.word 0xe871e018  ! 288: STX_I	stx	%r20, [%r7 + 0x0018]
	.word 0xe45a8008  ! 294: LDX_R	ldx	[%r10 + %r8], %r18
	.word 0xe00b0008  ! 295: LDUB_R	ldub	[%r12 + %r8], %r16
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
	.word 0xe432a030  ! 1: STH_I	sth	%r18, [%r10 + 0x0030]
	.word 0xe0332000  ! 5: STH_I	sth	%r16, [%r12 + 0x0000]
	.word 0xe0134008  ! 7: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe012c008  ! 8: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe03ae028  ! 9: STD_I	std	%r16, [%r11 + 0x0028]
	.word 0xe4236038  ! 12: STW_I	stw	%r18, [%r13 + 0x0038]
	.word 0xe041a008  ! 14: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xec336028  ! 15: STH_I	sth	%r22, [%r13 + 0x0028]
	.word 0xe01ba000  ! 28: LDD_I	ldd	[%r14 + 0x0000], %r16
	.word 0xe072e020  ! 29: STX_I	stx	%r16, [%r11 + 0x0020]
	.word 0xe0098008  ! 32: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe071a038  ! 34: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe4038008  ! 38: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe42b6018  ! 39: STB_I	stb	%r18, [%r13 + 0x0018]
	.word 0xe8038008  ! 40: LDUW_R	lduw	[%r14 + %r8], %r20
	.word 0xa011a018  ! 41: OR_I	or 	%r6, 0x0018, %r16
	.word 0xe00a8008  ! 50: LDUB_R	ldub	[%r10 + %r8], %r16
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	.word 0xe00b0008  ! 64: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe022e020  ! 68: STW_I	stw	%r16, [%r11 + 0x0020]
	.word 0xe44b0008  ! 70: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xe432a020  ! 72: STH_I	sth	%r18, [%r10 + 0x0020]
	.word 0xe0332028  ! 73: STH_I	sth	%r16, [%r12 + 0x0028]
	.word 0xe419a008  ! 74: LDD_I	ldd	[%r6 + 0x0008], %r18
	.word 0xec22a000  ! 79: STW_I	stw	%r22, [%r10 + 0x0000]
	.word 0xe412a000  ! 81: LDUH_I	lduh	[%r10 + 0x0000], %r18
	.word 0xe44b4008  ! 91: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xec59a000  ! 92: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xe80ac008  ! 94: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xec228008  ! 97: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xa0b30008  ! 101: SUBCcc_R	orncc 	%r12, %r8, %r16
	.word 0xec436020  ! 103: LDSW_I	ldsw	[%r13 + 0x0020], %r22
	.word 0xec2b8008  ! 104: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe0138008  ! 105: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec42c008  ! 107: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xe072a030  ! 108: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xe8528008  ! 109: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xe0318008  ! 110: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe472a038  ! 113: STX_I	stx	%r18, [%r10 + 0x0038]
	.word 0xe03b4008  ! 115: STD_R	std	%r16, [%r13 + %r8]
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe0518008  ! 118: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe4236020  ! 119: STW_I	stw	%r18, [%r13 + 0x0020]
	.word 0xe822e000  ! 121: STW_I	stw	%r20, [%r11 + 0x0000]
	.word 0xe029c008  ! 126: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe041e008  ! 130: LDSW_I	ldsw	[%r7 + 0x0008], %r16
	.word 0xe449a008  ! 143: LDSB_I	ldsb	[%r6 + 0x0008], %r18
	.word 0xe809a000  ! 145: LDUB_I	ldub	[%r6 + 0x0000], %r20
	.word 0xe031a008  ! 148: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe001c008  ! 152: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xec1b0008  ! 155: LDD_R	ldd	[%r12 + %r8], %r22
	.word 0xe05b8008  ! 159: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe832c008  ! 160: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe419a020  ! 164: LDD_I	ldd	[%r6 + 0x0020], %r18
	.word 0xe402c008  ! 165: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xec4b0008  ! 166: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe8036010  ! 167: LDUW_I	lduw	[%r13 + 0x0010], %r20
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe0736010  ! 169: STX_I	stx	%r16, [%r13 + 0x0010]
	.word 0xe871a038  ! 172: STX_I	stx	%r20, [%r6 + 0x0038]
	.word 0xec49c008  ! 177: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xec21c008  ! 186: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe029a030  ! 187: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xec134008  ! 189: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xe8032018  ! 191: LDUW_I	lduw	[%r12 + 0x0018], %r20
	.word 0xe0434008  ! 193: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe4398008  ! 196: STD_R	std	%r18, [%r6 + %r8]
	.word 0xec42e020  ! 198: LDSW_I	ldsw	[%r11 + 0x0020], %r22
	.word 0xe03b6008  ! 199: STD_I	std	%r16, [%r13 + 0x0008]
	.word 0xe059e030  ! 201: LDX_I	ldx	[%r7 + 0x0030], %r16
	.word 0xe03b4008  ! 202: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec398008  ! 205: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe012a038  ! 206: LDUH_I	lduh	[%r10 + 0x0038], %r16
	.word 0xec5aa020  ! 207: LDX_I	ldx	[%r10 + 0x0020], %r22
	.word 0xe4728008  ! 210: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe829c008  ! 212: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe4718008  ! 215: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe449a008  ! 217: LDSB_I	ldsb	[%r6 + 0x0008], %r18
	.word 0xe8336038  ! 218: STH_I	sth	%r20, [%r13 + 0x0038]
	.word 0xe449a030  ! 219: LDSB_I	ldsb	[%r6 + 0x0030], %r18
	.word 0xe0034008  ! 221: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe829a020  ! 222: STB_I	stb	%r20, [%r6 + 0x0020]
	.word 0xe8332020  ! 223: STH_I	sth	%r20, [%r12 + 0x0020]
	.word 0xec398008  ! 226: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe8598008  ! 228: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe85ba028  ! 229: LDX_I	ldx	[%r14 + 0x0028], %r20
	.word 0xec39e000  ! 230: STD_I	std	%r22, [%r7 + 0x0000]
	.word 0xe0732008  ! 231: STX_I	stx	%r16, [%r12 + 0x0008]
	.word 0xe85aa000  ! 235: LDX_I	ldx	[%r10 + 0x0000], %r20
	.word 0xe422a000  ! 237: STW_I	stw	%r18, [%r10 + 0x0000]
	.word 0xe8234008  ! 238: STW_R	stw	%r20, [%r13 + %r8]
	.word 0xe472c008  ! 241: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xec02e038  ! 244: LDUW_I	lduw	[%r11 + 0x0038], %r22
	.word 0xe049e000  ! 246: LDSB_I	ldsb	[%r7 + 0x0000], %r16
	.word 0xe0330008  ! 247: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe05ae030  ! 253: LDX_I	ldx	[%r11 + 0x0030], %r16
	.word 0xe051a008  ! 255: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xe45b0008  ! 258: LDX_R	ldx	[%r12 + %r8], %r18
	.word 0xe8218008  ! 262: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe059c008  ! 266: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xec438008  ! 267: LDSW_R	ldsw	[%r14 + %r8], %r22
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe019e028  ! 271: LDD_I	ldd	[%r7 + 0x0028], %r16
	.word 0xe051a008  ! 276: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xe0530008  ! 278: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe42ba028  ! 283: STB_I	stb	%r18, [%r14 + 0x0028]
	.word 0xec23a000  ! 285: STW_I	stw	%r22, [%r14 + 0x0000]
	.word 0xe032a018  ! 287: STH_I	sth	%r16, [%r10 + 0x0018]
	.word 0xe8318008  ! 288: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe409a038  ! 294: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe0418008  ! 295: LDSW_R	ldsw	[%r6 + %r8], %r16
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
	.word 0xe8728008  ! 1: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xe839c008  ! 5: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe05b8008  ! 7: LDX_R	ldx	[%r14 + %r8], %r16
	.word 0xe049e030  ! 8: LDSB_I	ldsb	[%r7 + 0x0030], %r16
	.word 0xe0218008  ! 9: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xec21c008  ! 12: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe043a010  ! 14: LDSW_I	ldsw	[%r14 + 0x0010], %r16
	.word 0xe02ba030  ! 15: STB_I	stb	%r16, [%r14 + 0x0030]
	.word 0xe419a000  ! 28: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe0734008  ! 29: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe041c008  ! 32: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xec3ac008  ! 34: STD_R	std	%r22, [%r11 + %r8]
	.word 0xec118008  ! 38: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe82b2018  ! 39: STB_I	stb	%r20, [%r12 + 0x0018]
	.word 0xe01ba020  ! 40: LDD_I	ldd	[%r14 + 0x0020], %r16
	.word 0xa8c1e038  ! 41: ADDCcc_I	addccc 	%r7, 0x0038, %r20
	.word 0xe84ac008  ! 50: LDSB_R	ldsb	[%r11 + %r8], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe0436010  ! 64: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	.word 0xe02a8008  ! 68: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe8430008  ! 70: LDSW_R	ldsw	[%r12 + %r8], %r20
	.word 0xe8228008  ! 72: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe02b0008  ! 73: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe042a020  ! 74: LDSW_I	ldsw	[%r10 + 0x0020], %r16
	.word 0xe433a030  ! 79: STH_I	sth	%r18, [%r14 + 0x0030]
	.word 0xe00aa000  ! 81: LDUB_I	ldub	[%r10 + 0x0000], %r16
	.word 0xe45b2010  ! 91: LDX_I	ldx	[%r12 + 0x0010], %r18
	.word 0xe0028008  ! 92: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe002c008  ! 94: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe072c008  ! 97: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xa0b18008  ! 101: ORNcc_R	orncc 	%r6, %r8, %r16
	.word 0xec430008  ! 103: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xec72a038  ! 104: STX_I	stx	%r22, [%r10 + 0x0038]
	.word 0xec436038  ! 105: LDSW_I	ldsw	[%r13 + 0x0038], %r22
	.word 0xe04b6030  ! 107: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	.word 0xe4236030  ! 108: STW_I	stw	%r18, [%r13 + 0x0030]
	.word 0xec138008  ! 109: LDUH_R	lduh	[%r14 + %r8], %r22
	.word 0xec2ae018  ! 110: STB_I	stb	%r22, [%r11 + 0x0018]
	.word 0xe8318008  ! 113: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe029c008  ! 115: STB_R	stb	%r16, [%r7 + %r8]
	setx	0x00000000d01ef100, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	.word 0xe8434008  ! 118: LDSW_R	ldsw	[%r13 + %r8], %r20
	.word 0xe4236000  ! 119: STW_I	stw	%r18, [%r13 + 0x0000]
	.word 0xe839a008  ! 121: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xec318008  ! 126: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe81ba028  ! 130: LDD_I	ldd	[%r14 + 0x0028], %r20
	.word 0xe00b8008  ! 143: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xec51e038  ! 145: LDSH_I	ldsh	[%r7 + 0x0038], %r22
	.word 0xe42b2020  ! 148: STB_I	stb	%r18, [%r12 + 0x0020]
	.word 0xe84b6038  ! 152: LDSB_I	ldsb	[%r13 + 0x0038], %r20
	.word 0xe852a018  ! 155: LDSH_I	ldsh	[%r10 + 0x0018], %r20
	.word 0xe0198008  ! 159: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe0318008  ! 160: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe0198008  ! 164: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe00b4008  ! 165: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe4118008  ! 166: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe04b2020  ! 167: LDSB_I	ldsb	[%r12 + 0x0020], %r16
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	.word 0xec238008  ! 169: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xe8718008  ! 172: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xec0b6000  ! 177: LDUB_I	ldub	[%r13 + 0x0000], %r22
	.word 0xe82b0008  ! 186: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xec31c008  ! 187: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe0434008  ! 189: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe04aa000  ! 191: LDSB_I	ldsb	[%r10 + 0x0000], %r16
	.word 0xe003a030  ! 193: LDUW_I	lduw	[%r14 + 0x0030], %r16
	.word 0xe8734008  ! 196: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xec59c008  ! 198: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xe02b4008  ! 199: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe45ac008  ! 201: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe8718008  ! 202: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe02ae000  ! 205: STB_I	stb	%r16, [%r11 + 0x0000]
	.word 0xe419a000  ! 206: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xe01ac008  ! 207: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe029a028  ! 210: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe0228008  ! 212: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe4238008  ! 215: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe40ae030  ! 217: LDUB_I	ldub	[%r11 + 0x0030], %r18
	.word 0xe471e028  ! 218: STX_I	stx	%r18, [%r7 + 0x0028]
	.word 0xe4598008  ! 219: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe449e008  ! 221: LDSB_I	ldsb	[%r7 + 0x0008], %r18
	.word 0xe433a008  ! 222: STH_I	sth	%r18, [%r14 + 0x0008]
	.word 0xe021a018  ! 223: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe0318008  ! 226: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe45b6038  ! 228: LDX_I	ldx	[%r13 + 0x0038], %r18
	.word 0xec41a000  ! 229: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xec228008  ! 230: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe421e020  ! 231: STW_I	stw	%r18, [%r7 + 0x0020]
	.word 0xe0134008  ! 235: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe071a008  ! 237: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe02ba018  ! 238: STB_I	stb	%r16, [%r14 + 0x0018]
	.word 0xe039a028  ! 241: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe0118008  ! 244: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe041c008  ! 246: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe831e010  ! 247: STH_I	sth	%r20, [%r7 + 0x0010]
	.word 0xe85b6018  ! 253: LDX_I	ldx	[%r13 + 0x0018], %r20
	.word 0xe4536038  ! 255: LDSH_I	ldsh	[%r13 + 0x0038], %r18
	.word 0xe8130008  ! 258: LDUH_R	lduh	[%r12 + %r8], %r20
	.word 0xe4318008  ! 262: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe4018008  ! 266: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe819a008  ! 267: LDD_I	ldd	[%r6 + 0x0008], %r20
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	.word 0xec0b2010  ! 271: LDUB_I	ldub	[%r12 + 0x0010], %r22
	.word 0xe401a028  ! 276: LDUW_I	lduw	[%r6 + 0x0028], %r18
	.word 0xe0428008  ! 278: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe0328008  ! 283: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe0228008  ! 285: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec2b4008  ! 287: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe073a010  ! 288: STX_I	stx	%r16, [%r14 + 0x0010]
	.word 0xec51e020  ! 294: LDSH_I	ldsh	[%r7 + 0x0020], %r22
	.word 0xe003a030  ! 295: LDUW_I	lduw	[%r14 + 0x0030], %r16
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
	.word 0xe8738008  ! 1: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xec39c008  ! 5: STD_R	std	%r22, [%r7 + %r8]
	.word 0xec12c008  ! 7: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xe442e010  ! 8: LDSW_I	ldsw	[%r11 + 0x0010], %r18
	.word 0xe82aa000  ! 9: STB_I	stb	%r20, [%r10 + 0x0000]
	.word 0xec22a000  ! 12: STW_I	stw	%r22, [%r10 + 0x0000]
	.word 0xe01b2038  ! 14: LDD_I	ldd	[%r12 + 0x0038], %r16
	.word 0xe0334008  ! 15: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec12e018  ! 28: LDUH_I	lduh	[%r11 + 0x0018], %r22
	.word 0xe423a020  ! 29: STW_I	stw	%r18, [%r14 + 0x0020]
	.word 0xe04ac008  ! 32: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xec318008  ! 34: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe413a018  ! 38: LDUH_I	lduh	[%r14 + 0x0018], %r18
	.word 0xe0318008  ! 39: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec136038  ! 40: LDUH_I	lduh	[%r13 + 0x0038], %r22
	.word 0xa0c18008  ! 41: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xe00b6028  ! 50: LDUB_I	ldub	[%r13 + 0x0028], %r16
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe841e038  ! 64: LDSW_I	ldsw	[%r7 + 0x0038], %r20
	.word 0xe82a8008  ! 68: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe0518008  ! 70: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8298008  ! 72: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xec318008  ! 73: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe003a030  ! 74: LDUW_I	lduw	[%r14 + 0x0030], %r16
	.word 0xe0236000  ! 79: STW_I	stw	%r16, [%r13 + 0x0000]
	.word 0xec12c008  ! 81: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xe00b4008  ! 91: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe81aa038  ! 92: LDD_I	ldd	[%r10 + 0x0038], %r20
	.word 0xe441a010  ! 94: LDSW_I	ldsw	[%r6 + 0x0010], %r18
	.word 0xe429e008  ! 97: STB_I	stb	%r18, [%r7 + 0x0008]
	.word 0xa4b3a030  ! 101: SUBCcc_I	orncc 	%r14, 0x0030, %r18
	.word 0xe4428008  ! 103: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xec33a038  ! 104: STH_I	sth	%r22, [%r14 + 0x0038]
	.word 0xe45aa038  ! 105: LDX_I	ldx	[%r10 + 0x0038], %r18
	.word 0xec034008  ! 107: LDUW_R	lduw	[%r13 + %r8], %r22
	.word 0xe431a038  ! 108: STH_I	sth	%r18, [%r6 + 0x0038]
	.word 0xe00ae030  ! 109: LDUB_I	ldub	[%r11 + 0x0030], %r16
	.word 0xe0734008  ! 110: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe071c008  ! 113: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe839c008  ! 115: STD_R	std	%r20, [%r7 + %r8]
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe45a8008  ! 118: LDX_R	ldx	[%r10 + %r8], %r18
	.word 0xe42b4008  ! 119: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xec728008  ! 121: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xec232028  ! 126: STW_I	stw	%r22, [%r12 + 0x0028]
	.word 0xe8098008  ! 130: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe841a018  ! 143: LDSW_I	ldsw	[%r6 + 0x0018], %r20
	.word 0xe80a8008  ! 145: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xe0718008  ! 148: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe041c008  ! 152: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe8536028  ! 155: LDSH_I	ldsh	[%r13 + 0x0028], %r20
	.word 0xe00b2008  ! 159: LDUB_I	ldub	[%r12 + 0x0008], %r16
	.word 0xe0328008  ! 160: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe0434008  ! 164: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe41b8008  ! 165: LDD_R	ldd	[%r14 + %r8], %r18
	.word 0xe44ae038  ! 166: LDSB_I	ldsb	[%r11 + 0x0038], %r18
	.word 0xe84b2038  ! 167: LDSB_I	ldsb	[%r12 + 0x0038], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xe8732028  ! 169: STX_I	stx	%r20, [%r12 + 0x0028]
	.word 0xe02a8008  ! 172: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe049a000  ! 177: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xe0298008  ! 186: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe071e000  ! 187: STX_I	stx	%r16, [%r7 + 0x0000]
	.word 0xe8428008  ! 189: LDSW_R	ldsw	[%r10 + %r8], %r20
	.word 0xe8436028  ! 191: LDSW_I	ldsw	[%r13 + 0x0028], %r20
	.word 0xe801a018  ! 193: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xe031a038  ! 196: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xe0028008  ! 198: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe82b0008  ! 199: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe0098008  ! 201: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe071e018  ! 202: STX_I	stx	%r16, [%r7 + 0x0018]
	.word 0xec21a018  ! 205: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe0434008  ! 206: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xec59c008  ! 207: LDX_R	ldx	[%r7 + %r8], %r22
	.word 0xec39c008  ! 210: STD_R	std	%r22, [%r7 + %r8]
	.word 0xec22e008  ! 212: STW_I	stw	%r22, [%r11 + 0x0008]
	.word 0xe03b4008  ! 215: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec5ae038  ! 217: LDX_I	ldx	[%r11 + 0x0038], %r22
	.word 0xe42ac008  ! 218: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe0530008  ! 219: LDSH_R	ldsh	[%r12 + %r8], %r16
	.word 0xe45ac008  ! 221: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe8718008  ! 222: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xec21c008  ! 223: STW_R	stw	%r22, [%r7 + %r8]
	.word 0xe0718008  ! 226: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe411a008  ! 228: LDUH_I	lduh	[%r6 + 0x0008], %r18
	.word 0xe0432018  ! 229: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	.word 0xe4218008  ! 230: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe071e010  ! 231: STX_I	stx	%r16, [%r7 + 0x0010]
	.word 0xe41b4008  ! 235: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xe0218008  ! 237: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe8732000  ! 238: STX_I	stx	%r20, [%r12 + 0x0000]
	.word 0xe0736018  ! 241: STX_I	stx	%r16, [%r13 + 0x0018]
	.word 0xec038008  ! 244: LDUW_R	lduw	[%r14 + %r8], %r22
	.word 0xe0598008  ! 246: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xec3b6020  ! 247: STD_I	std	%r22, [%r13 + 0x0020]
	.word 0xec4ac008  ! 253: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe801e018  ! 255: LDUW_I	lduw	[%r7 + 0x0018], %r20
	.word 0xe04ba010  ! 258: LDSB_I	ldsb	[%r14 + 0x0010], %r16
	.word 0xe03ae020  ! 262: STD_I	std	%r16, [%r11 + 0x0020]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe0098008  ! 266: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec198008  ! 267: LDD_R	ldd	[%r6 + %r8], %r22
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xe442c008  ! 271: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xec03a010  ! 276: LDUW_I	lduw	[%r14 + 0x0010], %r22
	.word 0xe849a028  ! 278: LDSB_I	ldsb	[%r6 + 0x0028], %r20
	.word 0xec336020  ! 283: STH_I	sth	%r22, [%r13 + 0x0020]
	.word 0xe03b2018  ! 285: STD_I	std	%r16, [%r12 + 0x0018]
	.word 0xe4738008  ! 287: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe4236030  ! 288: STW_I	stw	%r18, [%r13 + 0x0030]
	.word 0xec53a000  ! 294: LDSH_I	ldsh	[%r14 + 0x0000], %r22
	.word 0xec01a000  ! 295: LDUW_I	lduw	[%r6 + 0x0000], %r22
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
	.word 0xe0718008  ! 1: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe431a020  ! 5: STH_I	sth	%r18, [%r6 + 0x0020]
	.word 0xe0428008  ! 7: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe04ac008  ! 8: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe839a038  ! 9: STD_I	std	%r20, [%r6 + 0x0038]
	.word 0xec3b0008  ! 12: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe0436010  ! 14: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	.word 0xe0218008  ! 15: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe05ba038  ! 28: LDX_I	ldx	[%r14 + 0x0038], %r16
	.word 0xe0738008  ! 29: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe013a008  ! 32: LDUH_I	lduh	[%r14 + 0x0008], %r16
	.word 0xec732008  ! 34: STX_I	stx	%r22, [%r12 + 0x0008]
	.word 0xe4032038  ! 38: LDUW_I	lduw	[%r12 + 0x0038], %r18
	.word 0xec39a038  ! 39: STD_I	std	%r22, [%r6 + 0x0038]
	.word 0xe009a000  ! 40: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xa83b0008  ! 41: XNOR_R	xnor 	%r12, %r8, %r20
	.word 0xe8198008  ! 50: LDD_R	ldd	[%r6 + %r8], %r20
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe45ba038  ! 64: LDX_I	ldx	[%r14 + 0x0038], %r18
	.word 0xec71c008  ! 68: STX_R	stx	%r22, [%r7 + %r8]
	.word 0xe05ba008  ! 70: LDX_I	ldx	[%r14 + 0x0008], %r16
	.word 0xe429a028  ! 72: STB_I	stb	%r18, [%r6 + 0x0028]
	.word 0xe0338008  ! 73: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe809a028  ! 74: LDUB_I	ldub	[%r6 + 0x0028], %r20
	.word 0xe039e038  ! 79: STD_I	std	%r16, [%r7 + 0x0038]
	.word 0xec02c008  ! 81: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe002c008  ! 91: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe80b8008  ! 92: LDUB_R	ldub	[%r14 + %r8], %r20
	.word 0xec0a8008  ! 94: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe021c008  ! 97: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xacb36028  ! 101: ORNcc_I	orncc 	%r13, 0x0028, %r22
	.word 0xe00ac008  ! 103: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xec218008  ! 104: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe81ba020  ! 105: LDD_I	ldd	[%r14 + 0x0020], %r20
	.word 0xe009a030  ! 107: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xec39e010  ! 108: STD_I	std	%r22, [%r7 + 0x0010]
	.word 0xe001a008  ! 109: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xe433a000  ! 110: STH_I	sth	%r18, [%r14 + 0x0000]
	.word 0xe031e020  ! 113: STH_I	sth	%r16, [%r7 + 0x0020]
	.word 0xec336018  ! 115: STH_I	sth	%r22, [%r13 + 0x0018]
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	.word 0xec19a020  ! 118: LDD_I	ldd	[%r6 + 0x0020], %r22
	.word 0xe029e020  ! 119: STB_I	stb	%r16, [%r7 + 0x0020]
	.word 0xe02b6020  ! 121: STB_I	stb	%r16, [%r13 + 0x0020]
	.word 0xe0228008  ! 126: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe059c008  ! 130: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe0038008  ! 143: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe80ba028  ! 145: LDUB_I	ldub	[%r14 + 0x0028], %r20
	.word 0xec218008  ! 148: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xec11c008  ! 152: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xe801c008  ! 155: LDUW_R	lduw	[%r7 + %r8], %r20
	.word 0xe4532038  ! 159: LDSH_I	ldsh	[%r12 + 0x0038], %r18
	.word 0xec72c008  ! 160: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe012e030  ! 164: LDUH_I	lduh	[%r11 + 0x0030], %r16
	.word 0xec434008  ! 165: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe419a038  ! 166: LDD_I	ldd	[%r6 + 0x0038], %r18
	.word 0xec118008  ! 167: LDUH_R	lduh	[%r6 + %r8], %r22
	setx	0x00000000d01ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe0334008  ! 169: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe82a8008  ! 172: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe84ba028  ! 177: LDSB_I	ldsb	[%r14 + 0x0028], %r20
	.word 0xe021a010  ! 186: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xec23a000  ! 187: STW_I	stw	%r22, [%r14 + 0x0000]
	.word 0xe41ba020  ! 189: LDD_I	ldd	[%r14 + 0x0020], %r18
	.word 0xe01b2010  ! 191: LDD_I	ldd	[%r12 + 0x0010], %r16
	.word 0xe01b6000  ! 193: LDD_I	ldd	[%r13 + 0x0000], %r16
	.word 0xe429c008  ! 196: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xe05ae008  ! 198: LDX_I	ldx	[%r11 + 0x0008], %r16
	.word 0xe4298008  ! 199: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe059c008  ! 201: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe43b8008  ! 202: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe0228008  ! 205: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe0134008  ! 206: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe8098008  ! 207: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe43a8008  ! 210: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe072c008  ! 212: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xec39a030  ! 215: STD_I	std	%r22, [%r6 + 0x0030]
	.word 0xec536008  ! 217: LDSH_I	ldsh	[%r13 + 0x0008], %r22
	.word 0xe0718008  ! 218: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe01b4008  ! 219: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe0136030  ! 221: LDUH_I	lduh	[%r13 + 0x0030], %r16
	.word 0xe0238008  ! 222: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe8336030  ! 223: STH_I	sth	%r20, [%r13 + 0x0030]
	.word 0xe0234008  ! 226: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe8198008  ! 228: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe04b6000  ! 229: LDSB_I	ldsb	[%r13 + 0x0000], %r16
	.word 0xec2ae038  ! 230: STB_I	stb	%r22, [%r11 + 0x0038]
	.word 0xe431e000  ! 231: STH_I	sth	%r18, [%r7 + 0x0000]
	.word 0xe4534008  ! 235: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe832a030  ! 237: STH_I	sth	%r20, [%r10 + 0x0030]
	.word 0xe021c008  ! 238: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe02b0008  ! 241: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe859a020  ! 244: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xe0430008  ! 246: LDSW_R	ldsw	[%r12 + %r8], %r16
	.word 0xe8338008  ! 247: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe009c008  ! 253: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xe4418008  ! 255: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xec198008  ! 258: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe472a030  ! 262: STX_I	stx	%r18, [%r10 + 0x0030]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec49c008  ! 266: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xec5aa020  ! 267: LDX_I	ldx	[%r10 + 0x0020], %r22
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	.word 0xe01b6028  ! 271: LDD_I	ldd	[%r13 + 0x0028], %r16
	.word 0xe85ae018  ! 276: LDX_I	ldx	[%r11 + 0x0018], %r20
	.word 0xe45aa000  ! 278: LDX_I	ldx	[%r10 + 0x0000], %r18
	.word 0xec3b4008  ! 283: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe021a038  ! 285: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe022c008  ! 287: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe43b0008  ! 288: STD_R	std	%r18, [%r12 + %r8]
	.word 0xec5b2028  ! 294: LDX_I	ldx	[%r12 + 0x0028], %r22
	.word 0xe019a028  ! 295: LDD_I	ldd	[%r6 + 0x0028], %r16
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
	.word 0xe873a028  ! 1: STX_I	stx	%r20, [%r14 + 0x0028]
	.word 0xe42b2008  ! 5: STB_I	stb	%r18, [%r12 + 0x0008]
	.word 0xec01a020  ! 7: LDUW_I	lduw	[%r6 + 0x0020], %r22
	.word 0xe8032030  ! 8: LDUW_I	lduw	[%r12 + 0x0030], %r20
	.word 0xe03ba000  ! 9: STD_I	std	%r16, [%r14 + 0x0000]
	.word 0xec318008  ! 12: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe409e030  ! 14: LDUB_I	ldub	[%r7 + 0x0030], %r18
	.word 0xe83b0008  ! 15: STD_R	std	%r20, [%r12 + %r8]
	.word 0xe041e038  ! 28: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	.word 0xe029c008  ! 29: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe051c008  ! 32: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe4398008  ! 34: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe85a8008  ! 38: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe829e010  ! 39: STB_I	stb	%r20, [%r7 + 0x0010]
	.word 0xe059c008  ! 40: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xa4218008  ! 41: SUB_R	sub 	%r6, %r8, %r18
	.word 0xe419a030  ! 50: LDD_I	ldd	[%r6 + 0x0030], %r18
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xec09a030  ! 64: LDUB_I	ldub	[%r6 + 0x0030], %r22
	.word 0xe029c008  ! 68: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe4018008  ! 70: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe0236010  ! 72: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe022c008  ! 73: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe81b2000  ! 74: LDD_I	ldd	[%r12 + 0x0000], %r20
	.word 0xe0732028  ! 79: STX_I	stx	%r16, [%r12 + 0x0028]
	.word 0xe052a018  ! 81: LDSH_I	ldsh	[%r10 + 0x0018], %r16
	.word 0xe441e030  ! 91: LDSW_I	ldsw	[%r7 + 0x0030], %r18
	.word 0xe441a000  ! 92: LDSW_I	ldsw	[%r6 + 0x0000], %r18
	.word 0xe84b0008  ! 94: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xe0328008  ! 97: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xa08a8008  ! 101: ANDcc_R	andcc 	%r10, %r8, %r16
	.word 0xe44b4008  ! 103: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe82a8008  ! 104: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe052c008  ! 105: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe8598008  ! 107: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe072e008  ! 108: STX_I	stx	%r16, [%r11 + 0x0008]
	.word 0xec018008  ! 109: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xec334008  ! 110: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xec232008  ! 113: STW_I	stw	%r22, [%r12 + 0x0008]
	.word 0xe431c008  ! 115: STH_R	sth	%r18, [%r7 + %r8]
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	.word 0xe019c008  ! 118: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe43ae000  ! 119: STD_I	std	%r18, [%r11 + 0x0000]
	.word 0xe072e030  ! 121: STX_I	stx	%r16, [%r11 + 0x0030]
	.word 0xec39a018  ! 126: STD_I	std	%r22, [%r6 + 0x0018]
	.word 0xe811a000  ! 130: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xe01a8008  ! 143: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe841e008  ! 145: LDSW_I	ldsw	[%r7 + 0x0008], %r20
	.word 0xe03a8008  ! 148: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe013a018  ! 152: LDUH_I	lduh	[%r14 + 0x0018], %r16
	.word 0xe01a8008  ! 155: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe052c008  ! 159: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe42ac008  ! 160: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xec5a8008  ! 164: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xec128008  ! 165: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe051c008  ! 166: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe802a010  ! 167: LDUW_I	lduw	[%r10 + 0x0010], %r20
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe8318008  ! 169: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe0738008  ! 172: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe4530008  ! 177: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe0730008  ! 186: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe8218008  ! 187: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe4436008  ! 189: LDSW_I	ldsw	[%r13 + 0x0008], %r18
	.word 0xe849c008  ! 191: LDSB_R	ldsb	[%r7 + %r8], %r20
	.word 0xe40a8008  ! 193: LDUB_R	ldub	[%r10 + %r8], %r18
	.word 0xe0718008  ! 196: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4428008  ! 198: LDSW_R	ldsw	[%r10 + %r8], %r18
	.word 0xe822c008  ! 199: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xec02c008  ! 201: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe0236010  ! 202: STW_I	stw	%r16, [%r13 + 0x0010]
	.word 0xe4298008  ! 205: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xec1b2038  ! 206: LDD_I	ldd	[%r12 + 0x0038], %r22
	.word 0xe819e038  ! 207: LDD_I	ldd	[%r7 + 0x0038], %r20
	.word 0xe8730008  ! 210: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe82ac008  ! 212: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe472a030  ! 215: STX_I	stx	%r18, [%r10 + 0x0030]
	.word 0xe4418008  ! 217: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe0738008  ! 218: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe00b4008  ! 219: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xec59a010  ! 221: LDX_I	ldx	[%r6 + 0x0010], %r22
	.word 0xe439a008  ! 222: STD_I	std	%r18, [%r6 + 0x0008]
	.word 0xe4738008  ! 223: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xe031e018  ! 226: STH_I	sth	%r16, [%r7 + 0x0018]
	.word 0xe0438008  ! 228: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe042a018  ! 229: LDSW_I	ldsw	[%r10 + 0x0018], %r16
	.word 0xec228008  ! 230: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xec738008  ! 231: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe05b0008  ! 235: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe031a000  ! 237: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe4736000  ! 238: STX_I	stx	%r18, [%r13 + 0x0000]
	.word 0xe0338008  ! 241: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe441a008  ! 244: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	.word 0xe05ac008  ! 246: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe439a020  ! 247: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xe44a8008  ! 253: LDSB_R	ldsb	[%r10 + %r8], %r18
	.word 0xe05b0008  ! 255: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe849a008  ! 258: LDSB_I	ldsb	[%r6 + 0x0008], %r20
	.word 0xe822c008  ! 262: STW_R	stw	%r20, [%r11 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xe0036030  ! 266: LDUW_I	lduw	[%r13 + 0x0030], %r16
	.word 0xe01ba000  ! 267: LDD_I	ldd	[%r14 + 0x0000], %r16
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	.word 0xec01c008  ! 271: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe4034008  ! 276: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe411a018  ! 278: LDUH_I	lduh	[%r6 + 0x0018], %r18
	.word 0xe83b8008  ! 283: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe471c008  ! 285: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe02b6020  ! 287: STB_I	stb	%r16, [%r13 + 0x0020]
	.word 0xe839a008  ! 288: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xe04b6038  ! 294: LDSB_I	ldsb	[%r13 + 0x0038], %r16
	.word 0xe01b8008  ! 295: LDD_R	ldd	[%r14 + %r8], %r16
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
	.word 0xe4318008  ! 1: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xec218008  ! 5: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0134008  ! 7: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe809a008  ! 8: LDUB_I	ldub	[%r6 + 0x0008], %r20
	.word 0xe829a020  ! 9: STB_I	stb	%r20, [%r6 + 0x0020]
	.word 0xe072e008  ! 12: STX_I	stx	%r16, [%r11 + 0x0008]
	.word 0xe04b2038  ! 14: LDSB_I	ldsb	[%r12 + 0x0038], %r16
	.word 0xe02aa020  ! 15: STB_I	stb	%r16, [%r10 + 0x0020]
	.word 0xe8598008  ! 28: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe0334008  ! 29: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec4b4008  ! 32: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe421c008  ! 34: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xe01aa010  ! 38: LDD_I	ldd	[%r10 + 0x0010], %r16
	.word 0xe821a018  ! 39: STW_I	stw	%r20, [%r6 + 0x0018]
	.word 0xe8038008  ! 40: LDUW_R	lduw	[%r14 + %r8], %r20
	.word 0xa081a028  ! 41: ADDcc_I	addcc 	%r6, 0x0028, %r16
	.word 0xec4b2020  ! 50: LDSB_I	ldsb	[%r12 + 0x0020], %r22
	setx	0x00000000d01ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	setx	0x00000000d01ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	.word 0xe419e028  ! 64: LDD_I	ldd	[%r7 + 0x0028], %r18
	.word 0xec21e020  ! 68: STW_I	stw	%r22, [%r7 + 0x0020]
	.word 0xec4b0008  ! 70: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe839a038  ! 72: STD_I	std	%r20, [%r6 + 0x0038]
	.word 0xe4236028  ! 73: STW_I	stw	%r18, [%r13 + 0x0028]
	.word 0xe012c008  ! 74: LDUH_R	lduh	[%r11 + %r8], %r16
	.word 0xe831a018  ! 79: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xe80b6000  ! 81: LDUB_I	ldub	[%r13 + 0x0000], %r20
	.word 0xec03a038  ! 91: LDUW_I	lduw	[%r14 + 0x0038], %r22
	.word 0xe00b2028  ! 92: LDUB_I	ldub	[%r12 + 0x0028], %r16
	.word 0xec12a020  ! 94: LDUH_I	lduh	[%r10 + 0x0020], %r22
	.word 0xec734008  ! 97: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xa00b2030  ! 101: AND_I	and 	%r12, 0x0030, %r16
	.word 0xe002c008  ! 103: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe0718008  ! 104: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe419e030  ! 105: LDD_I	ldd	[%r7 + 0x0030], %r18
	.word 0xe419c008  ! 107: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xe472a010  ! 108: STX_I	stx	%r18, [%r10 + 0x0010]
	.word 0xe80ac008  ! 109: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe0398008  ! 110: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4336028  ! 113: STH_I	sth	%r18, [%r13 + 0x0028]
	.word 0xe0730008  ! 115: STX_R	stx	%r16, [%r12 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe0518008  ! 118: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8230008  ! 119: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe03a8008  ! 121: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec32a028  ! 126: STH_I	sth	%r22, [%r10 + 0x0028]
	.word 0xe842e008  ! 130: LDSW_I	ldsw	[%r11 + 0x0008], %r20
	.word 0xe40b8008  ! 143: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xec12e028  ! 145: LDUH_I	lduh	[%r11 + 0x0028], %r22
	.word 0xe4338008  ! 148: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe843a038  ! 152: LDSW_I	ldsw	[%r14 + 0x0038], %r20
	.word 0xe8530008  ! 155: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xec02c008  ! 159: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe83aa028  ! 160: STD_I	std	%r20, [%r10 + 0x0028]
	.word 0xe0128008  ! 164: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe0538008  ! 165: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe0498008  ! 166: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe451c008  ! 167: LDSH_R	ldsh	[%r7 + %r8], %r18
	setx	0x00000000d01ef040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	.word 0xe8398008  ! 169: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe431e010  ! 172: STH_I	sth	%r18, [%r7 + 0x0010]
	.word 0xe8538008  ! 177: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe0230008  ! 186: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe02a8008  ! 187: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe011c008  ! 189: LDUH_R	lduh	[%r7 + %r8], %r16
	.word 0xe40b8008  ! 191: LDUB_R	ldub	[%r14 + %r8], %r18
	.word 0xe011a030  ! 193: LDUH_I	lduh	[%r6 + 0x0030], %r16
	.word 0xec39e030  ! 196: STD_I	std	%r22, [%r7 + 0x0030]
	.word 0xe011a020  ! 198: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xe83b8008  ! 199: STD_R	std	%r20, [%r14 + %r8]
	.word 0xec11c008  ! 201: LDUH_R	lduh	[%r7 + %r8], %r22
	.word 0xe021a010  ! 202: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xec22e028  ! 205: STW_I	stw	%r22, [%r11 + 0x0028]
	.word 0xe05ac008  ! 206: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe00b4008  ! 207: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe4338008  ! 210: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xe43b6018  ! 212: STD_I	std	%r18, [%r13 + 0x0018]
	.word 0xe43ae030  ! 215: STD_I	std	%r18, [%r11 + 0x0030]
	.word 0xe0136018  ! 217: LDUH_I	lduh	[%r13 + 0x0018], %r16
	.word 0xe4332028  ! 218: STH_I	sth	%r18, [%r12 + 0x0028]
	.word 0xe81ba008  ! 219: LDD_I	ldd	[%r14 + 0x0008], %r20
	.word 0xec49e028  ! 221: LDSB_I	ldsb	[%r7 + 0x0028], %r22
	.word 0xe82b4008  ! 222: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe82b8008  ! 223: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xec2ae028  ! 226: STB_I	stb	%r22, [%r11 + 0x0028]
	.word 0xec0ae028  ! 228: LDUB_I	ldub	[%r11 + 0x0028], %r22
	.word 0xe0138008  ! 229: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe022e038  ! 230: STW_I	stw	%r16, [%r11 + 0x0038]
	.word 0xe022c008  ! 231: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xec41c008  ! 235: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe072a018  ! 237: STX_I	stx	%r16, [%r10 + 0x0018]
	.word 0xe421a018  ! 238: STW_I	stw	%r18, [%r6 + 0x0018]
	.word 0xe072e000  ! 241: STX_I	stx	%r16, [%r11 + 0x0000]
	.word 0xe85b6018  ! 244: LDX_I	ldx	[%r13 + 0x0018], %r20
	.word 0xe0418008  ! 246: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec21e038  ! 247: STW_I	stw	%r22, [%r7 + 0x0038]
	.word 0xe801a018  ! 253: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xec0b6020  ! 255: LDUB_I	ldub	[%r13 + 0x0020], %r22
	.word 0xe002e010  ! 258: LDUW_I	lduw	[%r11 + 0x0010], %r16
	.word 0xe023a020  ! 262: STW_I	stw	%r16, [%r14 + 0x0020]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	.word 0xe0098008  ! 266: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xec11a010  ! 267: LDUH_I	lduh	[%r6 + 0x0010], %r22
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	.word 0xec598008  ! 271: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe002e008  ! 276: LDUW_I	lduw	[%r11 + 0x0008], %r16
	.word 0xec198008  ! 278: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe431a030  ! 283: STH_I	sth	%r18, [%r6 + 0x0030]
	.word 0xe02aa000  ! 285: STB_I	stb	%r16, [%r10 + 0x0000]
	.word 0xe03b8008  ! 287: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe4330008  ! 288: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe45b6020  ! 294: LDX_I	ldx	[%r13 + 0x0020], %r18
	.word 0xe452c008  ! 295: LDSH_R	ldsh	[%r11 + %r8], %r18
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
	setx	0x0000000000000001, %r1, %r6
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
	setx	0x0000000000000002, %r1, %r6
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
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 5,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 6,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000000, %r1, %r6
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
	setx	0x0000000000000000, %r1, %r6
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
	setx	0x0000000000000002, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 11,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
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
	setx	0x0000000000000001, %r1, %r6
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
	setx	0x0000000000000000, %r1, %r6
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
	setx	0x0000000000000000, %r1, %r6
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
	setx	0x0000000000000001, %r1, %r6
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
	setx	0x0000000000000000, %r1, %r6
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
	setx	0x0000000000000000, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 29,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000002, %r1, %r6
	setx	 page1a, %r1, %r26
	mov 30,%r27
	sll %r27,3,%r27
	ldx	[%r26 + %r27], flagr
	cmp	%r6, flagr
	tne	%icc, T_BAD_TRAP
	nop
	setx	0x0000000000000001, %r1, %r6
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
	.xword	0x8922cee35c6ccbf0
	.xword	0x8fb2584e0a5d8d59
	.xword	0xb954f475a16eedd1
	.xword	0x4c32902fb061d92d
	.xword	0x7b3f8da69ef2d8f6
	.xword	0x241d01102c21cbfe
	.xword	0x2296807a7549e5e7
	.xword	0xa5860df330a572eb
	.xword	0xe9805ebd193432be
	.xword	0xe889a18f91033952
	.xword	0x6ab3c87815a0e9bd
	.xword	0xf4182d374cbd75ab
	.xword	0x65443ca726854176
	.xword	0x0dc277f789ef0b57
	.xword	0x656415fd85c3ad34
	.xword	0x8d31b69c24c14846
	.xword	0x8cdd189f15b763b5
	.xword	0x41e23551791fef2a
	.xword	0x697aaf86985df357
	.xword	0x1c597dffcb9c9535
	.xword	0x21ade91824417ef6
	.xword	0xc2704e0fa0d51163
	.xword	0x4b1e1243dc62cdcb
	.xword	0x9b204968f34dcef5
	.xword	0x4e3b0d8e8fca6351
	.xword	0xb39b194452ad0406
	.xword	0xe2fb5e0b92c6a40c
	.xword	0xbbfb2722cb8535e8
	.xword	0xd9a75cc1c627e299
	.xword	0x87c964e32d7c6ad9
	.xword	0x0da09aba1ccff6f9
	.xword	0xb5dc4ba2f056d52d
	.xword	0xa6b6e42ff5f65c0c
	.xword	0xac371bdd9b3eac51
	.xword	0x0a37cb5fc910267b
	.xword	0x1ce70b96d2d75fbd
	.xword	0x4dd7008218d8b975
	.xword	0xc5890e3a85813bd7
	.xword	0x7aaf0f219970ffb6
	.xword	0xfa3b1519fc43ba29
	.xword	0x3fcf6d36cf55f362
	.xword	0x0ca7cf87bbd74e88
	.xword	0x957be5c167d8c03b
	.xword	0x8bf0f26e1a46446a
	.xword	0x248c8b6235637032
	.xword	0xc6cf16f4c0800501
	.xword	0x1a5159b2c974be26
	.xword	0x946a177c11b8a368
	.xword	0x70dc92448e2efb72
	.xword	0x1f23d44d7004400a
	.xword	0x5641f8fd5757c8d9
	.xword	0xdb531481beff725c
	.xword	0xb78f97c1f9794a9f
	.xword	0x409f6e46e5c14ee1
	.xword	0x6f4051112c49f1ac
	.xword	0xe3849b0a3f5b35a5
	.xword	0x54872fea75b170f0
	.xword	0x5cfeb573fcd133fd
	.xword	0xebb657db5d11da49
	.xword	0x31f966e9863270e3
	.xword	0xb61b94fdd2a9cc46
	.xword	0x0ae45d8c5af98f44
	.xword	0x934b332e81b1c873
	.xword	0x38b202ad50db367d
	.xword	0x28f4ade6c8c25acf
	.xword	0x539c5c704ceaca73
	.xword	0x7b27db5ac1bbdb81
	.xword	0xee2f7de986c14c48
	.xword	0xe9f608a225e41561
	.xword	0xd09a4b2d15e1f7c6
	.xword	0x39401ae8ed99fdee
	.xword	0x1e4e2d781e07e7a5
	.xword	0xbd414e84613a74e0
	.xword	0xafca8db37bcea7ed
	.xword	0x2e80967b59f1556a
	.xword	0x9f2b25fec86102e2
	.xword	0xb4d971f0b503f931
	.xword	0xbe96400879133c20
	.xword	0xa38a5330cda40356
	.xword	0xf37c5896ef2d731b
	.xword	0x36c860c7fd67e4a0
	.xword	0x900b2f3ed1b7845c
	.xword	0x1e14c81ba120b489
	.xword	0xd6d7b76dd97b9116
	.xword	0x19fc66dd7829a06c
	.xword	0x9d689fb2f0d0c28f
	.xword	0x7ce8f22421b78cc9
	.xword	0x9b6c00c1c2696685
	.xword	0x9673e5a82ee89b9c
	.xword	0x0d67b3a29fe4eaf4
	.xword	0xc5b7f0356559aeda
	.xword	0xc069e18854a4d028
	.xword	0x81096cd4bf71882d
	.xword	0x77e510cad19b09d1
	.xword	0x0aae728bb4224178
	.xword	0x585017b269418b00
	.xword	0x4a25e6b6ccb2f185
	.xword	0x2aa94dd3d4ecf8b1
	.xword	0xf1a486c1e603bbcd
	.xword	0xc0c34fe8c82979c1
	.xword	0x7f416bf3d0ab0b7a
	.xword	0x82bfffc48788f158
	.xword	0x6c272104f1cc8e74
	.xword	0xff053c18b82f62e1
	.xword	0xe2c0a68bff94ecaf
	.xword	0x5006f338a41a4239
	.xword	0xa8952eb0ce7738c4
	.xword	0x80a5810d40a1d5f7
	.xword	0xd940788089965fbf
	.xword	0x6aaf7cac60b7cbf5
	.xword	0xc9bd23cff6c22469
	.xword	0x6f42dcd36e7e094c
	.xword	0xfbc102f43151259b
	.xword	0x8b9d587d557fe2a2
	.xword	0x87b454fa6c63b487
	.xword	0xeb3a488d720007fb
	.xword	0xbfe7a48f03123e3d
	.xword	0x7754b4c57818caf0
	.xword	0xefe7d053a8036d64
	.xword	0x99438bacd836cb67
	.xword	0xbe73af79c822f38e
	.xword	0x3e931378edd9c628
	.xword	0xc928e215e88f55a9
	.xword	0x4db754a7ac4eeee1
	.xword	0x48492613762e7f3b
	.xword	0x4cc4294e1508368c
	.xword	0x63b8d8ced030d7e7
	.xword	0x928a66dc7a393a3e
	.xword	0xe3fb52acc94d836f
	.xword	0xb5740f668e9943bc
	.xword	0xab42a26ed7aad966
	.xword	0x5bd5f6fd95792f59
	.xword	0xed8c09dddfd53a84
	.xword	0x15731900096ece78
	.xword	0xe3fed91f5c87c70d
	.xword	0xccf3ac07fb153318
	.xword	0x5eebf40171e1fee8
	.xword	0xad6e8dce29248bce
	.xword	0x1ca0fd6d73d70e88
	.xword	0xb76561b6b042f570
	.xword	0x7d69314648e7554f
	.xword	0x0df697e70e6fac51
	.xword	0x4dee948ccb151ab7
	.xword	0x9b3e6fe0fc05ef60
	.xword	0x1187a1121ccc2ef7
	.xword	0x20cd803a7ff9d0ba
	.xword	0x0c85dc6b3f3d2401
	.xword	0xc06164b289ae3e0b
	.xword	0xa45badac8af78765
	.xword	0xceed7de8a4ef1f2c
	.xword	0x62e6d84c16622d86
	.xword	0xa2eac4ec83294bba
	.xword	0x76155e4505de30c2
	.xword	0xec2bb8b34bc92b4c
	.xword	0xdf196826f8ff2aeb
	.xword	0xbb2ea1c1c8a8b01b
	.xword	0x8020c0d389847804
	.xword	0xe7d36466e1221874
	.xword	0x4abad95fd30bfd15
	.xword	0xcd255246fb6c3333
	.xword	0xa5430170ce318e56
	.xword	0x4cd818ad2207208f
	.xword	0x6e643a6517fe0c67
	.xword	0x941503786835af99
	.xword	0xb6a553b5b53c3ca5
	.xword	0x3c408a777c94930f
	.xword	0x939cead1122afbfc
	.xword	0x6097c739e3612bae
	.xword	0x635c52276bee5d25
	.xword	0xa70b028438f97b98
	.xword	0x630bf6a328873ed6
	.xword	0x2153d51f049ac567
	.xword	0x15d663054b4327fd
	.xword	0xbd4b850daba79e23
	.xword	0xace2881d46aa7df0
	.xword	0x0b055a7d4af12c2a
	.xword	0xb2581c7421e97457
	.xword	0x9091e06cf877ae50
	.xword	0x2807dcee12b230eb
	.xword	0x313cb1b12c56d951
	.xword	0x20d4b47be8508c02
	.xword	0x300cec7eab81d4eb
	.xword	0x3f0c6acc354bff4e
	.xword	0xfb6d4a477b858049
	.xword	0xa35afadf1cc2d7a2
	.xword	0xa64bef50a231a183
	.xword	0x8ca53259bd15ea6d
	.xword	0xe666a86ea7108250
	.xword	0xcf922d01517f7680
	.xword	0x89d98a992c1dd5c2
	.xword	0xfe86a3082c948034
	.xword	0x8d218799bfa472cb
	.xword	0xd0c3850ffe2fd5d6
	.xword	0x049a3c71ec1212ed
	.xword	0xcd2a0083ec52572f
	.xword	0xd772665b32175191
	.xword	0x0ee36c4744377283
	.xword	0xce9a6da50d3767b5
	.xword	0x793654114ed583f1
	.xword	0xf495c6146ac1986c
	.xword	0xee32d34b4086cdb1
	.xword	0x605636aaf341ddad
	.xword	0x355616ca95b07abf
	.xword	0xfb9451ea868cede1
	.xword	0x23376a4d941b37ac
	.xword	0x9a7bdced4bbedec0
	.xword	0x77ee9849ca3309c5
	.xword	0xe72c3bdd8a50326b
	.xword	0x1602dd540f99ae3d
	.xword	0x0a43ca93f162e590
	.xword	0xc7ff7d4083fcc2fb
	.xword	0xe6c4bd2082443785
	.xword	0x7b6ec0c2e7df2650
	.xword	0x95953d814893f30f
	.xword	0x5f1436e204dfc58e
	.xword	0xc65153c315c2869b
	.xword	0xb021ffa10f6580cb
	.xword	0xa7ab1afc587edca1
	.xword	0xb17f4fc6349b3e01
	.xword	0x34896e467eb56d53
	.xword	0xdcda67fa328851e7
	.xword	0xf9ebaed3c197b97e
	.xword	0x60fbabae736a67d2
	.xword	0xc18e25aef2adac24
	.xword	0x7eed3cc8e5c5d425
	.xword	0x6135f19817bfbbf2
	.xword	0xb46a14d25f3e5f1f
	.xword	0x04e66e10d1d20a26
	.xword	0xebe36b4490a17508
	.xword	0xdf26829cd7fead22
	.xword	0x561ed74c51bf73d4
	.xword	0x7d29191771b1dead
	.xword	0x6a93106387877a77
	.xword	0x8262e7c603386bec
	.xword	0x8676c57850b7c7f7
	.xword	0x61d435582c3264a8
	.xword	0x206116ab7f6d6f13
	.xword	0xca747ad39e700042
	.xword	0x7fba2a8d417b1599
	.xword	0xcd392d3fc7dd39e2
	.xword	0x095f4b5b9e16e6d6
	.xword	0x14ad6ee0c2f5734a
	.xword	0x16e7d36d7a98a596
	.xword	0xb96c76fbb6d65acf
	.xword	0xda0e83a426d8b972
	.xword	0xe1d9cd7d89f8e789
	.xword	0xe8289189c492d0cb
	.xword	0xd76e13daf3b25e9c
	.xword	0x7dd8d35fe88be643
	.xword	0x23a11e7b6adcea2a
	.xword	0x75e8910eb3e83819
	.xword	0x2bcc0794d54ee83a
	.xword	0x6e0c441158bfbdfe
	.xword	0xe199d41f1fb96dea
	.xword	0x4f7711d1bc9239ff
	.xword	0xb8d428975d52c723



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
	.xword	0x4ae1965a36196ed6
	.xword	0x6ec346c1c1d30163
	.xword	0x92aac1afc97b676a
	.xword	0x389fbd24065be498
	.xword	0x49edc89d8828a649
	.xword	0x85daec41351d4fac
	.xword	0xc5d427284425d4d2
	.xword	0x7171d8d2a99261b3
	.xword	0xf86478c877b22a1a
	.xword	0xa13719b137cf04a0
	.xword	0x1aeb94d481d918c9
	.xword	0x910b41af84e4bb96
	.xword	0x45df8995e1276243
	.xword	0x437e5b7fd208fa66
	.xword	0x94bd7bb29d9d7b10
	.xword	0xaf5d2cbbc7bd64bc
	.xword	0xb1b0d3a3f3025951
	.xword	0xfea50436674bc677
	.xword	0x2e8cf83c30d045a1
	.xword	0xd0830e1ea0c41785
	.xword	0x98da4954b7ca9fa4
	.xword	0xe1dd134b9e6b59b7
	.xword	0x18ac6ebf86a782f4
	.xword	0xd78f110ff737b867
	.xword	0xb3877e9b7885355d
	.xword	0xa363569a2b11f817
	.xword	0x9c24238cf72ec499
	.xword	0x47cbe647ef555dd7
	.xword	0xdf541629271d7f5b
	.xword	0x69a2dc795ce742ae
	.xword	0x3f5c1ebbf658f711
	.xword	0x9903b2c1a31c0ab5
	.xword	0xc67a47e7db47b32b
	.xword	0x784106ba6d85349c
	.xword	0xbe580ce3481e7c18
	.xword	0x22bb5edf4e0b155a
	.xword	0x50c35326e0368eef
	.xword	0x89e91d2d99afa770
	.xword	0x9d79085502b71817
	.xword	0x970a1c3e599ea570
	.xword	0x70a39d2b5999f78b
	.xword	0x35498773956e82d8
	.xword	0xf01064d774753754
	.xword	0xd467544f61a19f1f
	.xword	0xe0075c4ea8ae06f5
	.xword	0x59428cff3636a3a0
	.xword	0x93d9cf83a6460da1
	.xword	0xc0bdcbee73eb997e
	.xword	0x63165aa676c1ec1e
	.xword	0x5180b6369dd43585
	.xword	0xc913b696ef9f41e3
	.xword	0x8d44c95c4a4f3109
	.xword	0x921407874e825281
	.xword	0xa771ef911da498cf
	.xword	0xb8ba1fe2be73749a
	.xword	0x41af2076949410b0
	.xword	0x22fcc815b6682f7c
	.xword	0x0143f32861c30240
	.xword	0xa36296eae482840c
	.xword	0xab4f52ffbf28c972
	.xword	0x6ccb9f96743628bb
	.xword	0x6b6f8d53e706d9c4
	.xword	0x4fa8779638b8453b
	.xword	0x906f1b618041dc96
	.xword	0xdecd54313afdff94
	.xword	0x0f19b5cf5fd0ac7a
	.xword	0xe3daa55c89fff05e
	.xword	0xa794b81586e79a3d
	.xword	0xc2968259423c4d22
	.xword	0xbff6e2037adf25d3
	.xword	0x267f05c47233056c
	.xword	0x14a61df05f4d2e1b
	.xword	0x68c6b3f7bdd1a931
	.xword	0x7f4e32f0c132dc3a
	.xword	0xb6dab2f6ea2f1b30
	.xword	0xa30902862fc1a47e
	.xword	0x92716a344ce85e3d
	.xword	0x90293df29895202f
	.xword	0x4930fea86d4c9ed2
	.xword	0xd7586cfef5cfba2f
	.xword	0x6197aa47f4d716f2
	.xword	0x59efe5d53db0a676
	.xword	0x1f5f96cdfe89b47e
	.xword	0x42c4d97183751b17
	.xword	0xb324cf73b9d73d6b
	.xword	0x98404dba5212e15e
	.xword	0x95eb757978efbf9f
	.xword	0xfd88f57eee4b9404
	.xword	0xc740193e72e567d9
	.xword	0xa275ca5360a46dc8
	.xword	0x23916f50f29c41cb
	.xword	0x0720affa317dcce5
	.xword	0x9701416a5eb9bcb6
	.xword	0x5b772bb8c24b683f
	.xword	0x6ff675fbaa4ae0e6
	.xword	0xdc62004ad7dff810
	.xword	0xaebe55ab7d077b86
	.xword	0x396b89d8d0da99d2
	.xword	0x6af9f3903f68ab92
	.xword	0xea652a30710fced0
	.xword	0xde45284405aea13e
	.xword	0x8b90429327bd2af2
	.xword	0x560a15b6dea956ce
	.xword	0xaca4087b70ad88e9
	.xword	0x1fa9bdc5b311efea
	.xword	0xe2dfadcc6e2a7797
	.xword	0x5d35db9d89863854
	.xword	0x059c128bd56cae57
	.xword	0xf237208981ab8cde
	.xword	0x76493b66a659ebd5
	.xword	0x29acb7d3123165fd
	.xword	0x0e32444a17801f06
	.xword	0xba833949898bf70a
	.xword	0x29ba85f38f74c51f
	.xword	0x3a1733fb9139e25f
	.xword	0x7486fc1793c490ea
	.xword	0x02455b9d5e73a632
	.xword	0x93be628147c946f1
	.xword	0x5e945cbb2cf989e7
	.xword	0x32df9b686268b820
	.xword	0xad23486eae4ac363
	.xword	0xbb18e9c1d90ce098
	.xword	0x95f084401cae9b0f
	.xword	0x23145d91943ff854
	.xword	0xf3beb30a4c76789b
	.xword	0xe3ad0acaae38a3e7
	.xword	0x7380b61eaddcbce1
	.xword	0x8d077f86a1e3ed93
	.xword	0xf02eaf256cf840f9
	.xword	0x6db8d633273e3889
	.xword	0xa3b097cc375cb5af
	.xword	0xc0306e697f6a7d66
	.xword	0x24806a5c5b6b6e75
	.xword	0xba8bcdcf093d33f8
	.xword	0x2fb5266655a07d09
	.xword	0xc7c5b3adef0232c4
	.xword	0xdca98bb697bfe402
	.xword	0x32cfb73175292241
	.xword	0xe896db8c1b2c18d6
	.xword	0x1783ed091657ea28
	.xword	0xc6bd9b0c9c22a7c7
	.xword	0xeccf876ce3853103
	.xword	0x4724b6ccc4b0b3d9
	.xword	0x693a62d65bf71a69
	.xword	0xfd4e53ea609ba550
	.xword	0x18a026c465b60b4b
	.xword	0x956323fcb46b82c1
	.xword	0x7393aa60ad1b56b7
	.xword	0x65370ecbb406d287
	.xword	0x7d4916ee11e37157
	.xword	0x42447ef6654d5801
	.xword	0x23a8deeda2eed843
	.xword	0x7f695fa247d70ffa
	.xword	0x9e6b5d6a3a93f65e
	.xword	0x877b5f84b7836e3e
	.xword	0xa420313a0d3a2f01
	.xword	0x7d048670e5ecea8b
	.xword	0x20ade4e49fb6c203
	.xword	0x4eb7ae3f8dd2872a
	.xword	0x2b8a0427f84e2e24
	.xword	0x1d10e63ae79a11ff
	.xword	0x3c8aa6f3578a5dd0
	.xword	0x6343bb0eb35844fd
	.xword	0xfea404120a845de8
	.xword	0xd3a940259a63eb75
	.xword	0xb48bb5c871374398
	.xword	0x4b396f79156c682f
	.xword	0x7377e78836b953f2
	.xword	0x465876fb500f2e57
	.xword	0x5b1ea120b0b2ed7e
	.xword	0x166add3fbce63640
	.xword	0x85d9877be5859c78
	.xword	0xe8bbd8b85cbc7daf
	.xword	0x05569700051879f8
	.xword	0x065273fe51e1b011
	.xword	0x978cb0e6744989ea
	.xword	0x53f25719cf67a0c6
	.xword	0xd805440d19a45a97
	.xword	0x2d34823fa4307036
	.xword	0x3d8edd91874a14da
	.xword	0x297f50e3e2ac45c8
	.xword	0xf3807d29e89de63f
	.xword	0xefbe870a478104fd
	.xword	0xb2884c7a5686b8aa
	.xword	0x8d625a4881143dc3
	.xword	0xd3bc29941453a4f8
	.xword	0xd67a52d23fe49ba9
	.xword	0x88e67293daad6223
	.xword	0x4ac09284c1806912
	.xword	0x8b264be79b918a8f
	.xword	0x8139c6154da802b4
	.xword	0xe0a7057a36911863
	.xword	0xd232266bae007024
	.xword	0xb53d0e49837650fb
	.xword	0xd7c1dacb429601e5
	.xword	0xbebe828ae00c2ae1
	.xword	0xb61913162cd8798b
	.xword	0x7d3dedd7dcde482c
	.xword	0x9792bd56a3d1e346
	.xword	0x6adc0f6db87090a9
	.xword	0xd6a51a04b75f91fd
	.xword	0xc5d22a339fda334e
	.xword	0x0a277bb907a79a8c
	.xword	0xcd80aa34cc56519d
	.xword	0x4901f646eb9cf059
	.xword	0x19762b20d1179b91
	.xword	0xc86eca86af3bef37
	.xword	0x546a166b35ea8b8c
	.xword	0xcc10a76895089f26
	.xword	0xf4f595ba1efa2e85
	.xword	0xcfcda29c1be84c6a
	.xword	0xebcb17062d0124c1
	.xword	0x16c25c1b44b672e1
	.xword	0xdeecbcbebb4a7d0a
	.xword	0xaa3d5f2c04e21362
	.xword	0xd9884c07a197f760
	.xword	0x99e37b469473387f
	.xword	0x267d2785c42125f8
	.xword	0xd0757d2280fc8194
	.xword	0xf61bc85f2499796c
	.xword	0x6f6b92a32b486903
	.xword	0x1662c3e06bd9c4b6
	.xword	0x3c1530f64ff1e9b4
	.xword	0x0455e820836e79ca
	.xword	0x7183c17fba278aa3
	.xword	0x74da64cd7dec4853
	.xword	0xb758d9a3adeb4064
	.xword	0x1c25cb8186a27521
	.xword	0x574f218e25f5fab2
	.xword	0xa214648a3818e53c
	.xword	0xf3476b95db025a5b
	.xword	0x300ef268f4db3fd5
	.xword	0xe670ab2dd962d3f5
	.xword	0x57b5211849445417
	.xword	0x246bb2f272292c80
	.xword	0x55c533014113278c
	.xword	0x8fe468e526296f0b
	.xword	0xa10155acb1f3c652
	.xword	0x4698a517d477ba84
	.xword	0xd039e07a0c18e9b1
	.xword	0xb43a83190c400108
	.xword	0x818a58e0fa4b122d
	.xword	0xc84f300232335341
	.xword	0x4966b6c82a60d3d9
	.xword	0x51f2ba0a65dab6b1
	.xword	0xc5412d3ea66f8faa
	.xword	0x788885fd9da98234
	.xword	0xdf62b81bc01593a3
	.xword	0x7773947ee8e33dd7
	.xword	0x95550273e3bac5e8
	.xword	0xe26ec8b92d336f41
	.xword	0xa75e8151dc71cc0f
	.xword	0xd0a6e17b1d600538
	.xword	0x6b8ff7d1ad686fc3
	.xword	0xbb46eb1330a202fa
	.xword	0x19184bdc24fe6891



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
	.xword	0xfd814e555d1de023
	.xword	0x1934df47bc76cf72
	.xword	0xd16830d2be6f55c3
	.xword	0xe0ca0bd7d9b64f04
	.xword	0xb8e2b1ff092e5fcc
	.xword	0x0c0a604cb6056ee6
	.xword	0x2c6641d4eecf33a7
	.xword	0x8a2376d25250b443
	.xword	0x07b84d871f3f2875
	.xword	0x7da52f0753a0ea4e
	.xword	0x708b43d3dec945a2
	.xword	0xaa28891abde33ffb
	.xword	0x5c1fef1fc825b24e
	.xword	0x62d238551aa47f05
	.xword	0xa4a14e6da4524f35
	.xword	0x599fb3f1a112fa92
	.xword	0xd84cc146906243e0
	.xword	0x380e27a5c9938db1
	.xword	0x49e349a2b0004185
	.xword	0x82e3c3e5fccbd07e
	.xword	0x46311f38ff5c2377
	.xword	0xae3a17a136008232
	.xword	0x6b1f5c5151b19bfa
	.xword	0xe1815d39579e0cab
	.xword	0x5b0a0d1ceefb07e2
	.xword	0x5756f72b1a3b972f
	.xword	0x1fd9e2aaa19a8fb9
	.xword	0xe22d162be9100fe2
	.xword	0x1039319d155427da
	.xword	0xb0f503502e18187b
	.xword	0x9fce01bb4f96992e
	.xword	0xd0d207d42f78de4f
	.xword	0xbe2352781c3b9686
	.xword	0xe91065b707836bbc
	.xword	0xcda8ac826efbf704
	.xword	0x200618fd4b2fcc8a
	.xword	0x90ebd4711c95d4bb
	.xword	0x819082dba0aa637b
	.xword	0x6d4671e672068bcd
	.xword	0xeb666ab4c16533cc
	.xword	0x6ebee94a4df96beb
	.xword	0x0049432a4619564e
	.xword	0xf5ce43e3bdbeaa49
	.xword	0x15d279dd1a384eb8
	.xword	0x00cd6a5f3d3b2765
	.xword	0x459391c29227c7dc
	.xword	0x7a046b09d5154038
	.xword	0x1ddc35c7b7832ef4
	.xword	0x17b6682d0afbaa85
	.xword	0x97994e0ba32eef87
	.xword	0x89e47803d6a55809
	.xword	0x51d7833050ce53c9
	.xword	0x4852353911d15302
	.xword	0x54959c5720140099
	.xword	0x7e78de80ef5c5e11
	.xword	0xa11a2f6ab5d24a94
	.xword	0x9e8bb8d88368c1de
	.xword	0x854c9f2673a52637
	.xword	0x31efde873a37a7a4
	.xword	0x96ca63dd4f5de314
	.xword	0x9df229a0dbc3bf55
	.xword	0xad0d709908b625c8
	.xword	0x9a8c5f2611647d46
	.xword	0xb6a092ec8579a370
	.xword	0xdbb9f44e505ac30b
	.xword	0x2110f67e0cc509cf
	.xword	0xcc8a8c729d573d3f
	.xword	0xc79e3cc514c41ac1
	.xword	0x4b39093b9847dce0
	.xword	0xccedc0998698c553
	.xword	0x90821e54b3a43df3
	.xword	0x4c90c0b73a233285
	.xword	0x18115663f2145184
	.xword	0x760ec581f041576f
	.xword	0x6cee8c24c3007814
	.xword	0x7972589a0723bdad
	.xword	0x84da9e45419902ee
	.xword	0xc654c833589c6d1c
	.xword	0x481927f3b7c24dc2
	.xword	0xdddfe914a5eafd94
	.xword	0x8fe4f7e2d692c44e
	.xword	0xf28aa5b4a59109db
	.xword	0x8940ee153f0d070e
	.xword	0x34e8fcc38609a76d
	.xword	0x841d03a47d609033
	.xword	0x4d2b94279f4b17d6
	.xword	0xdf0537460b7f11b4
	.xword	0x09b6442c7c062c0f
	.xword	0x395e48df6828d40f
	.xword	0x822fdd82b0d263fa
	.xword	0xbabe4dad717ffc5f
	.xword	0xac13a4f6f7671b59
	.xword	0x2149b65bf5d034e1
	.xword	0xdf20d18f474d0787
	.xword	0xb5237aa9a2e7f0ff
	.xword	0xcfc5cae70c0a6053
	.xword	0x9f2b08f07d5ddb01
	.xword	0xb40c949323282554
	.xword	0xe41b701f4e9728d9
	.xword	0x4dcae20f2f589938
	.xword	0xabaef01cf9f6f1a2
	.xword	0xa361fe3ec4777377
	.xword	0xe95450f4255a5393
	.xword	0xdf30a8d7c573009d
	.xword	0x6bbba580b4caa81d
	.xword	0x266ee9cf173c42b4
	.xword	0x67ad0d1322f7deae
	.xword	0xf679aec2c491164e
	.xword	0x8c0afced93fd6e5a
	.xword	0xb439540cf8ea8183
	.xword	0x6306f4c7d590b274
	.xword	0xba778bed718a567e
	.xword	0xfd6b83101ab1d55a
	.xword	0x0ec539ea6315acd3
	.xword	0x19c6331432eb44f4
	.xword	0x60beeffc13184f65
	.xword	0x873049d2b374a44e
	.xword	0xe58e331b979a2f71
	.xword	0x991768c961446fed
	.xword	0x3b23c20fd8033429
	.xword	0x19e852003fb6498b
	.xword	0xba99d1c64e011e68
	.xword	0xc406120a24b602b9
	.xword	0xc439856c34315631
	.xword	0x450b08df465f4791
	.xword	0xd465697f0d3b0bdf
	.xword	0x50622ee635160a4e
	.xword	0xe6a647c0cf3a495c
	.xword	0x7840922924af7bbb
	.xword	0xfbb04a9120c1153b
	.xword	0x39c0b7744f4ecba1
	.xword	0x2d1044c19f74abca
	.xword	0x08a578cf67c8cc0c
	.xword	0x82a97e8b4293122b
	.xword	0xddf91eda90ebf5a8
	.xword	0x005c1d8b97582774
	.xword	0x2b46007f8616435d
	.xword	0x2a7c3140cb2d07ea
	.xword	0xadc4e999894761e3
	.xword	0xfdf8f30600d6ac3d
	.xword	0xb9d12c454ba2dbb1
	.xword	0x734d50671fba1b74
	.xword	0x0b7db78f838a1416
	.xword	0x7743d23be79c0719
	.xword	0x8b5a4a2ee52b528e
	.xword	0x5c77d5b8aba2d252
	.xword	0x684f1a045d9e6329
	.xword	0xb776a0a552f26314
	.xword	0xbc521c0504ce3441
	.xword	0xebbeea5db541e796
	.xword	0xaf9b839dd9714374
	.xword	0xb3e32dcd9e7d05e1
	.xword	0x5c7bc48684e4ba0d
	.xword	0x4bbbf63043f7e1c6
	.xword	0xb13f5dd2a50a1698
	.xword	0xa7add533f6e45cc7
	.xword	0x4268861ff709ebf7
	.xword	0xd88336509dc67b31
	.xword	0xf7077911dddd9a3c
	.xword	0x617e52f0b650e6b7
	.xword	0x3ac266dbe9ac12d3
	.xword	0x3a820678a3884ee8
	.xword	0xd3c812316977db6f
	.xword	0xda77317e9b11f202
	.xword	0xc3cf1dd6105191aa
	.xword	0x929694dc5085f248
	.xword	0xfc3650b6a571a51a
	.xword	0xe57edcc07154b4cd
	.xword	0x822425e87fe6860e
	.xword	0xa81e71b7bd4b6f80
	.xword	0x689cbcf01868d41d
	.xword	0x8703c30285144245
	.xword	0x06beba989b431226
	.xword	0xc36f09e20711cd9d
	.xword	0xaad69a678f8d5e5e
	.xword	0x32b59048d33f0dcf
	.xword	0x992b6093842f4341
	.xword	0xade785153117cfe8
	.xword	0xaa0d64ce11265696
	.xword	0xb2cf0b3dc261da37
	.xword	0x40ddb4b4c46b6162
	.xword	0x7430977871860161
	.xword	0xb0a832e765e5ed74
	.xword	0xe0b690436fc26d0d
	.xword	0x1924035d89054c30
	.xword	0x91c39ce1cefb2163
	.xword	0x0ebdfdb30432739d
	.xword	0x0c7fa06485a7e1bf
	.xword	0xca5f7fa85f43028b
	.xword	0xa5609c10873c1348
	.xword	0x5bbf936ea7e05200
	.xword	0x9909285f9052662b
	.xword	0x82219a204c1b9a7a
	.xword	0x644efb45a866df82
	.xword	0x59722f0b524d222d
	.xword	0xf04243d56300239f
	.xword	0x5cfef7a77748decc
	.xword	0x9d6d7c82b949e19a
	.xword	0xaf7b85910e2f9045
	.xword	0x283fb99d025bc152
	.xword	0xcd14d9e168f19fee
	.xword	0xe97aa90c28daa8f9
	.xword	0x9eca07596b1452ad
	.xword	0xbb1e05cf3b35aad4
	.xword	0x66e591979be9755b
	.xword	0x2297799ae100162a
	.xword	0x85ef01a4eaa11b70
	.xword	0x376f08d1b576c304
	.xword	0xf0aad4b5feb65394
	.xword	0x92a9748cc66d663c
	.xword	0x86f2d1f0c01b81e8
	.xword	0x1c63244bf1ed6e22
	.xword	0xd197ae9cfbda6574
	.xword	0xe0772ca4794a1de5
	.xword	0xbe55895295e12854
	.xword	0x87079d378188d4d9
	.xword	0xc027bfc6c0d34b8d
	.xword	0x6f49f8cf971c0a44
	.xword	0xe17abb88023c332f
	.xword	0x0f7a9ea660283f81
	.xword	0x61d5164446eaaddf
	.xword	0x4190d50ea1c4e32c
	.xword	0x44c879647d94cbe9
	.xword	0xba039b27647172d7
	.xword	0x42d06b30251bba8c
	.xword	0x304620e1d08d2066
	.xword	0x57326388f107f31e
	.xword	0x5b8d4471c3213eed
	.xword	0xe20c3a7085fbc27c
	.xword	0x28d99d38a34f1b84
	.xword	0xc9573469ecb546ae
	.xword	0x07f173c74293fc25
	.xword	0x99c7e233227388d7
	.xword	0xde31b691044acff4
	.xword	0x0bb5cb12128cb026
	.xword	0x3c995f753c37f7ac
	.xword	0xf7eafc1e703a453e
	.xword	0xae7f5d20d236ccf3
	.xword	0xd11196f28452b620
	.xword	0x3750eaab979cb644
	.xword	0x43e336ca9253f2a1
	.xword	0xceb622b76ea7bc8f
	.xword	0xf461ce05d2fc1d11
	.xword	0xbe5c4cea08076a08
	.xword	0x8dbf5c5073ff231c
	.xword	0x90ac552a4817e955
	.xword	0xdee88b29f71f6738
	.xword	0xf01f499ffe79d1e0
	.xword	0x6d18299d5b1ec0d9
	.xword	0xf2108297d7b0496c
	.xword	0x6645b572ac1e8b98
	.xword	0xd4dcf96611903b03
	.xword	0xf348e49268001ec5
	.xword	0x12a55376ad3c1eca
	.xword	0x5ecf1ed413b1012e
	.xword	0xea0ece26f377bf77



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
	.xword	0x932bee803a25fedb
	.xword	0xade7b00da3088f78
	.xword	0x7183a4ddb82ed0b5
	.xword	0x916afeab98300322
	.xword	0x9da68847e4e10581
	.xword	0x9826cd2a0b365a17
	.xword	0xef913d57e173e7c2
	.xword	0x1a8320008ff44e8b
	.xword	0xbf552f655409f99c
	.xword	0xae9bd4b0f900bb18
	.xword	0x9df79b8347451458
	.xword	0xf3caccb537d59dcc
	.xword	0xa38e567470c2d4df
	.xword	0x7cbea209481c50c8
	.xword	0xe9ea3795014310c6
	.xword	0x68a19fae5c725161
	.xword	0xa0a23799f9f71c2a
	.xword	0x5cc4ca4cfe45d02a
	.xword	0xb0e593e94b8da8e9
	.xword	0xc054421db925784c
	.xword	0x64d15e016a4d1cb7
	.xword	0xf89aee4dcb12fe2f
	.xword	0x55b18831a9a97ff0
	.xword	0x2f47cb1ad2791fcd
	.xword	0x575f234d687acee6
	.xword	0xb42eae2a9b0cb15e
	.xword	0x75c815da39ca8209
	.xword	0xefa49307ca643f66
	.xword	0x05c48ab9c665eb8f
	.xword	0xc742a4a5846b7e52
	.xword	0x85c06d96e31b1c2a
	.xword	0x7beddc6b95b11d26
	.xword	0x33662ad6e455658e
	.xword	0xdb092fd2deae4f67
	.xword	0xa2fa227ca72317fd
	.xword	0xa81e3e8c6e14f300
	.xword	0xfd8262b0a58c6b8b
	.xword	0x8c743b3f68b28c8b
	.xword	0xe3853b0befd37559
	.xword	0x01475025b367c183
	.xword	0x6130c20445c993af
	.xword	0x0e98e025b6132347
	.xword	0x0d5eea50194e802a
	.xword	0xa600dfaa3bf53410
	.xword	0x3bd8943f246842c8
	.xword	0x7e784578778cf918
	.xword	0xbb0baa15ca49fe71
	.xword	0x7eec5db18189f235
	.xword	0x5a20073819a5166f
	.xword	0xe8d2e17ee35b9dee
	.xword	0x08302520017f03ac
	.xword	0x4424120598d2649d
	.xword	0x9396feb1da3072a5
	.xword	0x7f239f94d17f3fff
	.xword	0x4c2d1c8796748709
	.xword	0xa255ce30be06f4de
	.xword	0x659b820f66bdf91f
	.xword	0xe5ad65c6f19b27fe
	.xword	0xdbef08f8bd214d5f
	.xword	0xe579164bfb255296
	.xword	0x2056ae746d9ea759
	.xword	0xbc1b8af6c9122b72
	.xword	0x73052b0bd3265abd
	.xword	0x05218daca634261c
	.xword	0x16c93a3064543d5e
	.xword	0x05650516b2603682
	.xword	0x4464885a3a3ede81
	.xword	0x3f58e62ba5a7c7ef
	.xword	0x2cf9432bc7979901
	.xword	0xd7d494c1634b8894
	.xword	0x602fdb37206d6ee0
	.xword	0x0f21e0f43be35fca
	.xword	0x1633684a03352eff
	.xword	0x9523cffd2445be6f
	.xword	0x7b0c47c3c6c73e53
	.xword	0xad533590e9918bca
	.xword	0xb23c592b79aefa1f
	.xword	0xeb53962539d3c891
	.xword	0x9240f50d3c98744a
	.xword	0x72ac882d434ffb41
	.xword	0xcc4a56cc2835db1f
	.xword	0x310eac4dd310c0ed
	.xword	0xf4c9261f7d3e3613
	.xword	0x8ebea528491c6ab2
	.xword	0x64bf511703ba6d2d
	.xword	0x844b92258cf4a95a
	.xword	0x9c3336f16f2832a3
	.xword	0xfe113c92d9dff687
	.xword	0x325d3552906e2187
	.xword	0xeab2229b2c501aea
	.xword	0x4e7ecc8482258648
	.xword	0xbf7a5d9847063e9c
	.xword	0x4f6f7e2fa8e3d805
	.xword	0x392814d7f50008a5
	.xword	0xcc1d208811bf7159
	.xword	0x0d24b1be47ea287b
	.xword	0x225109820025155c
	.xword	0x887fad375d34f3cd
	.xword	0xa799cbfdd873bfbd
	.xword	0xc0e1610dfda4e1d3
	.xword	0x8b1807670e3425da
	.xword	0xf60f471eca9ac0eb
	.xword	0xe14aece6275cbf2c
	.xword	0x46f759d81e17c840
	.xword	0xb4d54ba14ae0143f
	.xword	0xa678b339a8971059
	.xword	0xbae45091388540f0
	.xword	0xc8c133e1a4c8953c
	.xword	0x301d3119621d8dd4
	.xword	0x54158ead051732cb
	.xword	0xdf33c47a5da2f734
	.xword	0xd58eff407846af27
	.xword	0x4377ba03856a0803
	.xword	0x6adece3284c20f87
	.xword	0x17477f6f58725600
	.xword	0xf2150eaea01bb1dc
	.xword	0xd00a7f191fafdd18
	.xword	0x7d1b3522a7a91eb2
	.xword	0x4659c51e95a8c012
	.xword	0x33d79be0bf68cb1b
	.xword	0x6df3a6aadad49907
	.xword	0x4a9e5cb79b9b4795
	.xword	0xf896c1cc51e9e5f7
	.xword	0xfed0d174fe555d9f
	.xword	0x25acd5de3a339d56
	.xword	0xea0c42c5940e476f
	.xword	0x25d1a5e22176ae15
	.xword	0x465937ac6c867ce6
	.xword	0x17ef4e3e65870c63
	.xword	0xc0830bc8d7c9b419
	.xword	0xeeb47abad2edc0cb
	.xword	0x313a06ff8cac55eb
	.xword	0x0139632a4c67fb1e
	.xword	0xd031684ee086079f
	.xword	0x0f9d988fec678c1e
	.xword	0x51535b3ea3f86764
	.xword	0xe5496551ac9e2b5a
	.xword	0xd038a95a4bc656fe
	.xword	0xd9e9196606cc6083
	.xword	0x43034bbd09eb14ba
	.xword	0x446a513a6603d1d0
	.xword	0xbdbea564803a6de2
	.xword	0xdbdd14e588968008
	.xword	0xc0cd750e3bac02d7
	.xword	0x20c9ff3c3c721c95
	.xword	0x31bb4fde4ea01b41
	.xword	0xc4126b1fe2d5763f
	.xword	0x8097843a34b78981
	.xword	0x864b971c19189dc5
	.xword	0x39c3eb9a67578f67
	.xword	0x62bc72dc35c6b48a
	.xword	0xad6239ae751fdc18
	.xword	0xe09081e88425053f
	.xword	0x21be8e196207b8a1
	.xword	0x9ed06a5e936096e0
	.xword	0x3b88fc31ffd7ed25
	.xword	0x025651e278f5b213
	.xword	0xf9458253561375d0
	.xword	0xde49c07b4cfe2569
	.xword	0xb5da13d73d3487df
	.xword	0x3581fee2fffa4e5d
	.xword	0xe7b1a804f90d1961
	.xword	0x1e3da1e49d83c7e6
	.xword	0x1951e3aaee2afda1
	.xword	0x60a5d822a3e8acd0
	.xword	0xd8e6c0a2b2d53e99
	.xword	0x87759e37aaac630b
	.xword	0x0c59bfcfa45c7557
	.xword	0x5d3afd55c08e9078
	.xword	0x739a8d17c2c7f194
	.xword	0x05b9b76b8ebc0227
	.xword	0xcc4976adf8ef7330
	.xword	0x5eca90407a1dd480
	.xword	0x6393bde1ad9c4417
	.xword	0x7453cdacb6b3be21
	.xword	0xc518f97cc5ee0224
	.xword	0x3349ac9e39c6bf3e
	.xword	0x56932a8d09ab781f
	.xword	0xf3094db42d26d6e0
	.xword	0x14fa4086256e1e79
	.xword	0x266a0b7128675925
	.xword	0x765382b41e07bea2
	.xword	0xe9b2ada9e34c5c6e
	.xword	0xec01c435576be7db
	.xword	0x917dc23e157eeda8
	.xword	0xba3c8669e76d560d
	.xword	0x2a7cac9b48679d85
	.xword	0xef85f27eda9fb3b5
	.xword	0xe0cc9b01146374e1
	.xword	0x0300f5e75854d1fd
	.xword	0x58e1a844da3af490
	.xword	0xd65e194cdc4e67c4
	.xword	0xc0773270ab726f9a
	.xword	0x1051881f3aff1f51
	.xword	0xc47cf655810d19c6
	.xword	0x19c302015b499d94
	.xword	0x3fb05029437aa0b3
	.xword	0xd197f65f1f99e709
	.xword	0x6d9870b5c7f94bf8
	.xword	0xb58a95a226763e37
	.xword	0x88b68a111c51b361
	.xword	0x11b5efc3ce82d3fe
	.xword	0x94abcafe322d2feb
	.xword	0xa6713c5f529fe143
	.xword	0x3b177abbab01fb33
	.xword	0xb808e60d263a95af
	.xword	0xf1e520c891947c57
	.xword	0x96f554db2878dfd1
	.xword	0x17cac05ef95b2c54
	.xword	0x8f697bf25a32a7bb
	.xword	0xb50a032d955923f7
	.xword	0x8a456703ab532b74
	.xword	0x88be39deac651340
	.xword	0xf143a1c8e921df97
	.xword	0xd4eabbb36b2ef5e6
	.xword	0xb14c60577a0da9c2
	.xword	0x1fc88b1a7a28c0d0
	.xword	0x0d7d29d17c04bff1
	.xword	0xe10f9a4579e1ce28
	.xword	0x1cdda6cdce75f622
	.xword	0x628620e124761505
	.xword	0x58d5b748cab8d142
	.xword	0x98986a4b26c54bf5
	.xword	0x0048e7b29bec3e8e
	.xword	0x5c2111c64653b61e
	.xword	0x4a5f54d51ea6fc35
	.xword	0xc83dd4052539330a
	.xword	0x89b27a9c50f809b9
	.xword	0x044a0a16b57331d1
	.xword	0xb7b896b9ede7b3b6
	.xword	0x6bd6f4cd3547b090
	.xword	0x0f0c26e571e9b869
	.xword	0x63e6e620df3f5136
	.xword	0x3da713ac69d698fa
	.xword	0xd60f2c1a9b0500da
	.xword	0x6b6949b3c7df3305
	.xword	0x236163134cabf3ff
	.xword	0x7002d616f1fbafa9
	.xword	0x8f24af6cd5abc0b8
	.xword	0x7b9adb56b02d0110
	.xword	0xd8db853eddb5e11f
	.xword	0x9188703c570da285
	.xword	0x572d42aa693b466f
	.xword	0x437efb894aced1c9
	.xword	0x2c2592f09cc2c475
	.xword	0x8891684a39dabbbf
	.xword	0xd5132cc0855522f5
	.xword	0x87886f4706ccb6ef
	.xword	0x3a456d1db5c5fa75
	.xword	0x6f53b2910adb8f6d
	.xword	0x14e248669ebb478b
	.xword	0xa2938d660985d5ec
	.xword	0x9d1a9562a33412ba
	.xword	0x05b00c05082c9082
	.xword	0xd8004e69b028dd96
	.xword	0x6fd78963bc35f566



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
	.xword	0x0ffbdf5c8faccad2
	.xword	0x94aa648f7592b142
	.xword	0xc467b40c8310e004
	.xword	0x625a2a42bbfb11d3
	.xword	0xe0cb4511a6570566
	.xword	0x280172c318014460
	.xword	0x8a818484a5426a89
	.xword	0xecc2c1339b696a3e
	.xword	0x775680ebb8685507
	.xword	0x2a11cad832387c68
	.xword	0x15c457b6d224ea65
	.xword	0x00a1da19748ae981
	.xword	0xedc07f247f962c6c
	.xword	0x1176b4a84f8eb792
	.xword	0x791d2b0d747efa0e
	.xword	0x95d265353e01edfd
	.xword	0x2e13205ec97721d1
	.xword	0x18b2fe18dabe8519
	.xword	0x20c013b23775298e
	.xword	0xf7cfdbe4e20be5a3
	.xword	0xbd190a2615f3a642
	.xword	0x56b050607aaae4cc
	.xword	0xa8c9e24dbf8c635a
	.xword	0xf3e47d147ebb3f48
	.xword	0x2226d6ced6bb5069
	.xword	0x81111e29e5fe5f37
	.xword	0x1dbc7aad56d9627e
	.xword	0x3ea07f534d34753b
	.xword	0x2a10991b71c69e7a
	.xword	0x308edf5648f35e68
	.xword	0x3f679a45598f7284
	.xword	0x389110102c62126e
	.xword	0xf461bc37ae4e0a98
	.xword	0x3977ce257bef7a5f
	.xword	0xb8ee72878fc4ebdc
	.xword	0x9610a9cbcbf24884
	.xword	0xcec1b4303e2cc0f9
	.xword	0x598e887bee6298a2
	.xword	0xdfcf0b8ce97b5be7
	.xword	0x301ec562df509765
	.xword	0xc1240892beb38eb0
	.xword	0xfb4d4267ec96e009
	.xword	0x4e44f19ca008e296
	.xword	0x88012d655dc6e3c6
	.xword	0x625140379ec24081
	.xword	0xf9d03ecd65af903d
	.xword	0xaf2bfbc9a9f23444
	.xword	0xfcede62621083a33
	.xword	0x7cd3e369918a189f
	.xword	0x226d2ff085f2db91
	.xword	0xb3643c139b310c05
	.xword	0x223abc29e30cfbc0
	.xword	0x07ea8d7bc70c9f8e
	.xword	0x9c102919f75e3aca
	.xword	0x4053afd8847aa01d
	.xword	0x659f185c6afa843e
	.xword	0x0efbfab03a42c03f
	.xword	0x7f96114164f40846
	.xword	0x36cc3258a23797f6
	.xword	0xa78e468b47d9af1e
	.xword	0xcfde80a7743d587c
	.xword	0xd1fda61f79aa035a
	.xword	0x7365edc679a39b17
	.xword	0xe22d8f8de37d16a7
	.xword	0xcfa9b33d213a613a
	.xword	0x65f1e7df8c437476
	.xword	0xd1c7f242380044c0
	.xword	0x078f56d748d3c8db
	.xword	0x949772b19b22f4ae
	.xword	0x164bc39cd3bcaeda
	.xword	0xb04ea131e83bb0f8
	.xword	0x4100b75b53f008d6
	.xword	0x21a39989dce63026
	.xword	0xc213aefd33632861
	.xword	0x856e03d2954717cf
	.xword	0x6ada1a416d930b60
	.xword	0xfd78ae49b79bb139
	.xword	0x8fa652fab04b6353
	.xword	0xa0a05a4d60ebace2
	.xword	0xb04757288e454d6e
	.xword	0xba5c81d75ec06117
	.xword	0xf8e042a2daac67dc
	.xword	0xb1e69a5e5b58a73f
	.xword	0x7fea4e93ff8d3f52
	.xword	0x57875d2fa1aa98dc
	.xword	0x819dfa27ebd11d82
	.xword	0xd235067a6d40b115
	.xword	0x3efb78d02018a889
	.xword	0x2dca7ed9df656f74
	.xword	0x2871f0f270eca151
	.xword	0x3b70bc0dcf8cf3eb
	.xword	0x255e01eeeb57b98c
	.xword	0x626b366d48e120b5
	.xword	0x3e23d90e880ba9d1
	.xword	0x90c52d001aa83ef9
	.xword	0x9efc154c469aada3
	.xword	0x5ac487893ce56e1b
	.xword	0xee5f2888b919942c
	.xword	0x81bf0527fc7214c4
	.xword	0x4764ae0773d93c6e
	.xword	0xbfe59a53998dba54
	.xword	0x77acfe7802cc81b3
	.xword	0x9a0f611fd56087a3
	.xword	0x4be76248c04f5c8a
	.xword	0xca0a1845b8404374
	.xword	0xed7de9d6f88a809d
	.xword	0xc98b88e09a4dd9b9
	.xword	0x1299abd883477fa3
	.xword	0xd3303d04a6ac7388
	.xword	0x8743856d0576cbad
	.xword	0xf807f43c2aaf94bd
	.xword	0xb38e576f78d9c514
	.xword	0x736ebecb4df06939
	.xword	0x3e9127812dc12e4e
	.xword	0xbb83eb2091db26b9
	.xword	0xade378c086a03727
	.xword	0x35a3550ae9c32341
	.xword	0xe257ec8dd4f7ceaa
	.xword	0x0d5062d699c1d3c8
	.xword	0x3731e98e3a0720f5
	.xword	0x0242ef054e8f2e5e
	.xword	0x4c494fe85f9a8624
	.xword	0xcf94c31260140b08
	.xword	0xac13184421b1ec06
	.xword	0xa692b1450aba2fb7
	.xword	0x4c3d6d2d8d594912
	.xword	0x2671338d67cab853
	.xword	0xa028047209d54427
	.xword	0xb24afad85131913c
	.xword	0x5351699569c9394f
	.xword	0x36edd9e06d02dea6
	.xword	0x69809a21a0b07282
	.xword	0x025db36b3ce5a89b
	.xword	0x730fa391fe6f5cc4
	.xword	0x1ec0541cc75377b1
	.xword	0xa94e3fe4e8eb6a45
	.xword	0x4fe77a3bd0581d3a
	.xword	0xcd91a9ab4ee304a1
	.xword	0x0ff4104bda2c7e16
	.xword	0xa0ef230017ed0d16
	.xword	0xd34ac16ee005feb4
	.xword	0x7849107c4088cae9
	.xword	0x6e4fd8f3bdcea283
	.xword	0xab6a51737bc8ae21
	.xword	0x064adba6394178d7
	.xword	0x4e93e849f1d203d4
	.xword	0x437ba4cb30e3e205
	.xword	0x64bb2ddd86c8d757
	.xword	0xf718881279fe98ab
	.xword	0x4fb45d0154048e5c
	.xword	0xb1798323ca133a0f
	.xword	0x4e10e95e1c7c5cf5
	.xword	0x240eccc45ee8f5b7
	.xword	0xd570680e13e7ff77
	.xword	0x6286fc3d4b9afb65
	.xword	0xf934167025ad28dc
	.xword	0xe24b4d3bc48bf1f2
	.xword	0x726f6615fe24990a
	.xword	0x19c80989ced2a332
	.xword	0xf4747e4cbea57c83
	.xword	0x29be526e7b9ad3a9
	.xword	0x242170b3a2390f7f
	.xword	0xc225bc567d5910ef
	.xword	0x0e59e8b699e58ee8
	.xword	0xaca96f2b392a9290
	.xword	0xe321954b5f5c30a9
	.xword	0x6e0a8b21a7f0cf4d
	.xword	0xa57da936abb9d4e2
	.xword	0x75b1748ac228888d
	.xword	0x922bfcf7f58f41c1
	.xword	0x5e21270d1f1c39e3
	.xword	0x53c5c0e45bef3c3a
	.xword	0xe3d1f82e615da457
	.xword	0x7d3a0643e4f33e71
	.xword	0xaa5923c96d3cb37d
	.xword	0x6e4d32654feb7ebc
	.xword	0x0bc4026d117fac4f
	.xword	0xfa4a206e82d7d3ba
	.xword	0x947ab18fdd100030
	.xword	0x4125e552b3496dbc
	.xword	0x2e5835a7e5b4db3c
	.xword	0x40446769f480da9a
	.xword	0x09df60b3ebbd229c
	.xword	0x76da73ee2b190bdf
	.xword	0xa1125911195f108f
	.xword	0x9ce5ec9a79dc6444
	.xword	0x98eb08d7e9ce718c
	.xword	0x45d8a1d5a21c2fa0
	.xword	0x9080eea5985171fc
	.xword	0xb193241f9b92db6b
	.xword	0x1a33d0dd4f6b4893
	.xword	0x60efdd935b4823b5
	.xword	0x3b0bd3af85d53ee5
	.xword	0x480ffe369a416a51
	.xword	0x217b991531d8ffd9
	.xword	0x64b84924d6d4d726
	.xword	0xdc5953dffb0b1be3
	.xword	0x538d668f00301b1f
	.xword	0x0042c750fe48cbba
	.xword	0xf278c366d0bf9402
	.xword	0x4e20dfd90b1767e3
	.xword	0xda6f21894d1ae748
	.xword	0x1c3d588aa5b7992e
	.xword	0xd5d959dc35ddaea9
	.xword	0x61d9c7dc2172cd45
	.xword	0x78b083ea269572bc
	.xword	0x8f07d86ab335ad25
	.xword	0x3b7d8177b708e935
	.xword	0x16502cfe772b853d
	.xword	0xac760a532c35f47f
	.xword	0xe4967ac87d791d8f
	.xword	0x13992b86db39fea1
	.xword	0xd327790973c6670e
	.xword	0xf80135af90ba58a6
	.xword	0x6e1d79586d43ce23
	.xword	0x2faf0e5a715e0573
	.xword	0x61da5e740ae33be5
	.xword	0xc082bfa83306556e
	.xword	0x493f9ecb0b73ccf7
	.xword	0x3c768d20fa227d8f
	.xword	0x5be699e963090c45
	.xword	0x2968375ba82439f2
	.xword	0xdc30dd9e6622d145
	.xword	0xf4325be0f26e599c
	.xword	0xbffef3e84af14023
	.xword	0xc33df63e70ade28b
	.xword	0x426901dd5275b3a4
	.xword	0x18c3a05721762b64
	.xword	0xe9c9382ea2e9d504
	.xword	0x778f997ef4d1db32
	.xword	0xe20ce54caaa2071f
	.xword	0xce9e900df7216d09
	.xword	0x7a28a199ecf0ac4f
	.xword	0xc30df3f47e9a24fc
	.xword	0x76d9eddb8a25c75f
	.xword	0x2f007921b9c873ba
	.xword	0x143e69e64e078628
	.xword	0x32cd04cd068b5099
	.xword	0x65148059f64c61b8
	.xword	0x896a37274ba601f8
	.xword	0xe0360fbc15e70768
	.xword	0xb5461888e92c9541
	.xword	0x59dec83d94e9a5e5
	.xword	0xfa800d58b117a401
	.xword	0x4413e90980e9affc
	.xword	0xe08a0bbb43a8859d
	.xword	0x028982f1a0ae4525
	.xword	0xd9380059be931991
	.xword	0x670b2b9f2d74cbac
	.xword	0x644f65a912fd7232
	.xword	0x9083362150a740d8
	.xword	0xbcd403dc0ae5ec8e
	.xword	0x1bfb639ff787eefc
	.xword	0xe89795727300d6fc
	.xword	0xd97f466a4597365d
	.xword	0x652a195b129c04e5



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
	.xword	0x31d0b11aab9f85c2
	.xword	0x870bf71f6fbee99f
	.xword	0x928e29f39d613483
	.xword	0x7037033f0cf0e4e0
	.xword	0xe45f9ae750111754
	.xword	0xe6ed01f0ae058462
	.xword	0x33fc3316500a6720
	.xword	0x195d13afbc58bae1
	.xword	0x66e8dbdf51081a5b
	.xword	0xcc05e279c931c6e2
	.xword	0xed9680da635ba9d4
	.xword	0x5f1b0e963975b1b0
	.xword	0xf3c6f54ea8b3e3a4
	.xword	0x9d5266984c66c898
	.xword	0xbf88e81c1e6d8b2a
	.xword	0x45dc9f7c3e3ff90e
	.xword	0xa76d3ba35a28e6ac
	.xword	0xccd3274b5de71e6a
	.xword	0x0f5da29eb079bc4a
	.xword	0xc360b4f36c700c41
	.xword	0x70294032484c7085
	.xword	0x107c35ab4fd60be3
	.xword	0x6435ec6cac740d73
	.xword	0x15f5c0293644614a
	.xword	0x10de9ed54a03b1dc
	.xword	0x9d439ca5be19a4b5
	.xword	0x7ee89e646653b09e
	.xword	0x3f8be82b13999c3b
	.xword	0x8655c2d1305f09f1
	.xword	0x637177800cafa245
	.xword	0xcdd0742f42b1e5ca
	.xword	0x85e6b2fc2d7d9270
	.xword	0x468bf6318064a3fd
	.xword	0xf6f84a6c19024fcc
	.xword	0x91265b874318b0a3
	.xword	0x2079481a2f26fa92
	.xword	0x9dab168cea979811
	.xword	0xcb94bbcd8b5eb44d
	.xword	0xf7eea4ea410babe2
	.xword	0x5949b573f6aa5f8e
	.xword	0x7cbd5106abf76562
	.xword	0xf24a23e99c000d99
	.xword	0x76fbf0544af9f971
	.xword	0xa166fc015066611f
	.xword	0x5a4971141d5c2d8b
	.xword	0xe861663cc49566d1
	.xword	0xf73749de065f7977
	.xword	0x90cbb9850bc7c960
	.xword	0x93dd63e9f0c77e84
	.xword	0xea8bf5a2968297c3
	.xword	0xf83aa0570596f318
	.xword	0x49d92546c0ae17df
	.xword	0xabe8cddbbab9fea9
	.xword	0xfb8fefb99c67ccdc
	.xword	0x17c9963f7b496d8e
	.xword	0x7635360d27732ac6
	.xword	0x7be1f1a5f560d495
	.xword	0x91f89abe44b24b98
	.xword	0xd421ab71bf33e546
	.xword	0x6f127e21a8b8ce91
	.xword	0x37453c1bdd670ee1
	.xword	0xd632c61faa16242e
	.xword	0xf1a74b49884fa9b7
	.xword	0x13f496658fa6c18b
	.xword	0x21c43d1ec7479ca2
	.xword	0xc3b5c7ccace4092b
	.xword	0xe47acf6a67f35821
	.xword	0xb565b275d066e754
	.xword	0x01e92698d69d9105
	.xword	0x928304da26920f45
	.xword	0x2b57f08dc7eb203f
	.xword	0x93f145e5598ca1f6
	.xword	0xa3ae7572478fc1bf
	.xword	0x978c0aaa51a7741b
	.xword	0xb4e27b64e4500241
	.xword	0xb615e79fabe27d10
	.xword	0xb8ed5d394484dfa0
	.xword	0xdc7af4d5025d62ef
	.xword	0xe0925c30e0cdfef3
	.xword	0x0cc377b34521ec42
	.xword	0x893206df1fcc56e2
	.xword	0x6d4bf382c030c317
	.xword	0x7fad84f77c5ae710
	.xword	0x22e1de0b62fe35a1
	.xword	0x988166040e807f60
	.xword	0x391191215bde1d66
	.xword	0xd6b1f196c98b3111
	.xword	0xf30c8c5196e3a9ab
	.xword	0xedf648e5c7b49234
	.xword	0x775e04c531fb46d7
	.xword	0xb8e156010bebc295
	.xword	0xa667fb3602630802
	.xword	0xd9b2d88b2c46a67c
	.xword	0xdb145bbd6ba7bad4
	.xword	0x020588ed5bb79588
	.xword	0xf4e552cb0ef6f42d
	.xword	0x5590f352203b2093
	.xword	0x25d812b82c4f752c
	.xword	0x4c000e4e223ba49e
	.xword	0x4d26928eed7e412a
	.xword	0x3741315064d32dc7
	.xword	0xbab7a9c3637675a9
	.xword	0x492f3a85003809db
	.xword	0x73c2187ba6d2bb41
	.xword	0x097987131b045e56
	.xword	0xc126177d1bfd4c2c
	.xword	0xf07d0179b6b3c68f
	.xword	0x66cd2727347e5366
	.xword	0x7960d8193234d9cc
	.xword	0x0e3d16688aba1ce3
	.xword	0xa245dd4144d8ae27
	.xword	0x02020572c02cf91a
	.xword	0x30c14f7019f3ac81
	.xword	0xf6c97649a6d7934a
	.xword	0x58e1517dd1347d07
	.xword	0x1175de46a108908f
	.xword	0xd7704b9423f1fcb8
	.xword	0xd84bfd9136e64bb6
	.xword	0xb9cfa4425f9a3fa8
	.xword	0xa4205c9b60c72e92
	.xword	0x82577c5f28aa7702
	.xword	0x3ed7b9e58b41e920
	.xword	0x87eefe49a6815d63
	.xword	0xa1b5602125b0682e
	.xword	0x7f2cb6f34093645a
	.xword	0x0a81cc5f3d3ffcfb
	.xword	0x9cf7779909911e80
	.xword	0xb52b9d630e7b9d26
	.xword	0x3fa3ddfb8a462aa3
	.xword	0xe1b58317d49fbe26
	.xword	0x8ef7521898235cd9
	.xword	0xb726c9ffed78f92e
	.xword	0xf7c508e104368d0c
	.xword	0xe5a7c6234e240fe2
	.xword	0x0349b6adace23532
	.xword	0x75f7c47c1c7a5060
	.xword	0x86c2792ed8bbc6ab
	.xword	0x44e1e13d4e3bd445
	.xword	0xf498fddf221fdd0a
	.xword	0x738f8d6a1dfb76c4
	.xword	0x9421973e2d64d4cf
	.xword	0xc4000fffaddaa869
	.xword	0xce2e05a947c13d02
	.xword	0x78011a90d56de06e
	.xword	0xec4d521505c020e6
	.xword	0xc4d574e79a8b524e
	.xword	0xbd7c1e0bfca1007b
	.xword	0x5729bb926227224d
	.xword	0x3ef162d29f5a5abe
	.xword	0x167256544c7c94ec
	.xword	0x2ec928a68f73de7c
	.xword	0xa6b438e91bcbdb27
	.xword	0xd543e8e35d138b7f
	.xword	0x68c8e5f6b1d0111c
	.xword	0x3e4b188c297ed672
	.xword	0x979a5c960bf1aa28
	.xword	0x79e4660d10ac796e
	.xword	0x0b50a8d2dfd7bdeb
	.xword	0xcebb7bdf1ded3da4
	.xword	0xcaf44d7fe8925205
	.xword	0xb036579cf5bb3b04
	.xword	0x1affb76221f31bfb
	.xword	0x3620677379dda738
	.xword	0x765970e5d81ca20f
	.xword	0x9264804cfbeb4993
	.xword	0x84b7dc0499d579bb
	.xword	0xe04ad573c103cd9d
	.xword	0x80d862dee4095487
	.xword	0x2b182f1725957025
	.xword	0xa8a5a399b5077217
	.xword	0xe7b6d1686b981959
	.xword	0xd44406e2278f88d2
	.xword	0xd89f8900300aaf01
	.xword	0xf4e8cfb6a1df9955
	.xword	0xc0bfd0b155fa89fd
	.xword	0x03b56043735b78fa
	.xword	0x6044793acd769e90
	.xword	0xce3cdf043b1b2ee4
	.xword	0xeece9dee9ae7211b
	.xword	0x081d077e9637d710
	.xword	0x7e97e6cdf195f3ef
	.xword	0xbeacba136bb006c1
	.xword	0xfb26a8d6bee8b5a5
	.xword	0x7f1b84e7caa5c6be
	.xword	0x766f6754e2c52194
	.xword	0x5fd1b54f90f40d82
	.xword	0xc684ac7608da2ef7
	.xword	0x549347d34662c053
	.xword	0xbb52fc2e43de812d
	.xword	0x5bb25add87253fa9
	.xword	0x5fa4f8e3f50cf188
	.xword	0x6719ce2413fa9487
	.xword	0x1079f8b6d2197d28
	.xword	0xe5f1d8fb0c0bf6bc
	.xword	0x4b9c5e458ccc9332
	.xword	0xe725ffe19c102e24
	.xword	0xf694736f0eabf8b9
	.xword	0x09fe82d39a626068
	.xword	0xb014568956f7de39
	.xword	0xbf086be343c0d95e
	.xword	0x316fde7162372536
	.xword	0x87cdb201eae584df
	.xword	0xa660395a90b453ab
	.xword	0xd761635c8596df7c
	.xword	0x45a95bfa52a69b11
	.xword	0x6509c77008f1641a
	.xword	0x770b199fb0306365
	.xword	0x88ca1b60eee8224f
	.xword	0xefffade9a92f707b
	.xword	0xafc43f3ab9dbc9f1
	.xword	0x7349468825ed3457
	.xword	0x9b42ffa27602b3bb
	.xword	0xfdcb3ca782e8372f
	.xword	0x1f33b09f6bd87e9e
	.xword	0xce6fa0df73e4e23d
	.xword	0x76c480035a2e1f37
	.xword	0xefba50dc015158ed
	.xword	0x2ddac7a85c615aef
	.xword	0x5ca2728861a47653
	.xword	0x13a496e8b0c69c16
	.xword	0x9ed475d7a949fa31
	.xword	0x972c85314654aeda
	.xword	0x1f9596d4884437da
	.xword	0xc0e51ab84d6eb6de
	.xword	0xb1e6b54271204425
	.xword	0x6c05ade8a81a563f
	.xword	0x9d51a98d9369006e
	.xword	0x8931617eef599280
	.xword	0x5ec5ec5da399af91
	.xword	0x8cf6b1ee8e2e0281
	.xword	0x0836e6ec0ad3585c
	.xword	0x73949dec283fb71c
	.xword	0x31e4314d37d8b2dd
	.xword	0x6eb03301ed4c5501
	.xword	0xca990d888c79ce85
	.xword	0xae98503db0ac5695
	.xword	0xbb4856dc0a610e6d
	.xword	0x094de95b2b1e0baf
	.xword	0xf72d0fc31db4160d
	.xword	0x0cabe0a61db6ef20
	.xword	0xfc93656d35d97555
	.xword	0xed564605d0cb19aa
	.xword	0x1ec62ac1ed8ac98c
	.xword	0x6f32df1769a3d7e7
	.xword	0x6b7239e4cd9b2e31
	.xword	0x791fe479a02af4f5
	.xword	0x5e1edd50f7d47b15
	.xword	0x306161980f8a976d
	.xword	0xd5f0a5ad6ea17be3
	.xword	0xc8f3fbec0b25f9ba
	.xword	0x539beb832e01e9fb
	.xword	0xf88411473388c1e3
	.xword	0x316100d040fdc8a5
	.xword	0xdb627d9b1e54a02f
	.xword	0x3910891a78f20660
	.xword	0x48d2f7681fae98c7



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
	.xword	0x08768857c5dae784
	.xword	0xd31356be4ff3ef60
	.xword	0x47f33f6925e391ab
	.xword	0x1f8c33963111b8b8
	.xword	0x1d7fab9d35f7b681
	.xword	0x06e6d34adbccae16
	.xword	0x4384d76d0cb70dfb
	.xword	0xf5a19e1449e8be65
	.xword	0x40aeb883df66e112
	.xword	0x18247c371d9d9cd9
	.xword	0x1cec0258b5c77a56
	.xword	0x323a80871851b1ed
	.xword	0x73d16b1c7f8113b1
	.xword	0x167d19a1c64b0858
	.xword	0xa0ea3ddd94e4448f
	.xword	0x435427431b55a417
	.xword	0x311fad83b6c63c23
	.xword	0xb436ac03ac85ac2c
	.xword	0x4e2b523ed4f3392b
	.xword	0x561af4a38545654b
	.xword	0x9f54f489ad9dc5db
	.xword	0x765a7e27186f0d78
	.xword	0x610c7148c8f14a5d
	.xword	0x2732076e52ad72d3
	.xword	0x6e9f81a156e973ee
	.xword	0x8a772943f5041f48
	.xword	0x20a2440dc2e8661b
	.xword	0xe691bd1a0c8d7b95
	.xword	0x2d3b815e24620eb9
	.xword	0xc2617ea346ef564a
	.xword	0x02880af4cc8aa89c
	.xword	0xfcb9f7846542fedf
	.xword	0xc102ddae44d39d39
	.xword	0xb36e2cc399719152
	.xword	0x278a6e8446b70e8e
	.xword	0x82fbdc3c344b1356
	.xword	0xb1bb5342840aff5b
	.xword	0x5773d69268e39512
	.xword	0x6380f3b18e6b7940
	.xword	0xfd4be64cf249fa52
	.xword	0x5a9345fba2330e10
	.xword	0x4977b08c0dcea200
	.xword	0x1e14348a195578f1
	.xword	0x14f838f6dced2fb9
	.xword	0xac83bbeea571c740
	.xword	0xf1d347e089c21c73
	.xword	0xa388c9eee00959d7
	.xword	0x181a3e206a91b163
	.xword	0x04cd62443f990918
	.xword	0x88e206181b37b6b3
	.xword	0x0de2f10b3bb3a19b
	.xword	0x8af3b94b430c14fe
	.xword	0xd038995683eda708
	.xword	0xd436ba46d8bdc60c
	.xword	0x8cbf70e6fb715f21
	.xword	0xadf20dd36215fe85
	.xword	0x1c384b4d766ef588
	.xword	0xe77163d28c1018f7
	.xword	0x0583ed117c2a656d
	.xword	0xf284bec5bfaa4eea
	.xword	0x924bcc01ea7128ea
	.xword	0xba8813b54bd4a75f
	.xword	0x7dc5bb8ef60b8ea9
	.xword	0x6cbbe735f1ffe781
	.xword	0x01a4687abb847213
	.xword	0x65d409286fa78a92
	.xword	0x62714602e90f034f
	.xword	0xff1e5be30e827f22
	.xword	0xdfcc76377d2c353e
	.xword	0x91aba5b057a1977b
	.xword	0xe2774dcc56fa30ea
	.xword	0x507a94695d690aeb
	.xword	0x5b278e78c84ff17c
	.xword	0x3019973a8e39932c
	.xword	0x308263d2d4d2bb60
	.xword	0x7b3ed32f62690efe
	.xword	0x76cd0051fa58a19e
	.xword	0xe5e00d2ad03c9527
	.xword	0x60ffb758e3762c66
	.xword	0xf1851a7d68cbc8be
	.xword	0x116f9a487f38fc38
	.xword	0xb6d5cf0b594ac5e4
	.xword	0x99611b22dfd83ab2
	.xword	0xac49719d40749eba
	.xword	0x5198dd45515784ef
	.xword	0xb0808c80cba77b02
	.xword	0xfd6b26a9fc12cd38
	.xword	0x8711c99cc89afbc4
	.xword	0xba2f1a704238488f
	.xword	0x49ca5985112faf97
	.xword	0x31dbd9867b2dd63e
	.xword	0x5ae6afb459271ad6
	.xword	0xd6e6f54ebada50ee
	.xword	0x128d68d180df518a
	.xword	0x66b3bf454e320aee
	.xword	0x07cbe564b3866c7d
	.xword	0x6d871e5fed0e2876
	.xword	0x9049ae3eb773c45f
	.xword	0xdbc3d54ad0215a13
	.xword	0xc877a6af25097001
	.xword	0x220c2b834ef3cab4
	.xword	0x697f27ce8c0413f1
	.xword	0xedffe68076cc1c4c
	.xword	0x0842a49152941c9c
	.xword	0x9ed9835483e2f693
	.xword	0xc884418d96b178fe
	.xword	0x4f58c119aed7aa21
	.xword	0xd494fbf230939beb
	.xword	0x59b6c35215aa40a7
	.xword	0x4b4aaae360915e36
	.xword	0x01077b85cf7796d2
	.xword	0x5d81177487383be2
	.xword	0xaaa8e5bdf357bc19
	.xword	0x0c00a945044cbde1
	.xword	0x5067040309c494ca
	.xword	0x16b7a8bbc66f5fcf
	.xword	0x57454d910751b1fc
	.xword	0xbfc32d797c83c0dc
	.xword	0xccf99e4ffff5211d
	.xword	0x92d3d41ce12f352f
	.xword	0xdd8005144b6ff186
	.xword	0xd402c9844ff4e5d0
	.xword	0xdaf0ffb3e5296047
	.xword	0xa5a5a1139ece5ff3
	.xword	0x679c09f493e1238f
	.xword	0xbb8e1e53cea5e1dc
	.xword	0xbabba22b3fabe631
	.xword	0x4d78aac044b78cca
	.xword	0x2a82d8aa28473430
	.xword	0x66288eaee37d7862
	.xword	0x1ef2ed2553b6a570
	.xword	0xe18cbedf39221b8c
	.xword	0xee6dc3cae887b440
	.xword	0xdf20d5813a0f24ca
	.xword	0x0836c364665acd4c
	.xword	0x82815eed81e0224c
	.xword	0x1b13d37943ffe53f
	.xword	0x094557226c29bd03
	.xword	0x6d33462617547ac1
	.xword	0x46e8d6421dacd263
	.xword	0x88cc0f38ecf144d3
	.xword	0x71274a4df2ffc20c
	.xword	0x862cbcce96baae80
	.xword	0x685186ffd9db9c57
	.xword	0x770f4a73a0d36ce8
	.xword	0xbcc91c2641fd39f7
	.xword	0x8ffa6d9227786139
	.xword	0x2f19e70f1d5a3d91
	.xword	0x2e193282c962a656
	.xword	0xc9f6cc874c2c1c86
	.xword	0xc8b678b8fe111a7d
	.xword	0xa3878893f90cdab3
	.xword	0x2bcc4990937791a0
	.xword	0x8274c8017c4b4c5e
	.xword	0x976dda556bb1b77e
	.xword	0xa9485179145f5fb3
	.xword	0xd2da5708e4580195
	.xword	0x6848319e432efdf4
	.xword	0x418f83ad3e3cb982
	.xword	0x0daf30482e5304dc
	.xword	0x82f0cb0b66959963
	.xword	0x4a62179a21f10a14
	.xword	0x64b54d8db2f49a30
	.xword	0x692f65bc77ea6d20
	.xword	0x38c915831f0fa156
	.xword	0x2541575343d01174
	.xword	0x21d35149806d55b0
	.xword	0x62b822304789aa99
	.xword	0xa91b8270ab4a3419
	.xword	0x78ff9239557eb166
	.xword	0x6b7b5fc0a0cec663
	.xword	0xf4df93321f56ada3
	.xword	0x4cba735f6ba170bc
	.xword	0x2b5e73dbc0a46ff2
	.xword	0x391bccb048e75c06
	.xword	0x0cd1c84e1a635060
	.xword	0x7464c0bfb58b9264
	.xword	0xb3aff55b845b939f
	.xword	0xe581a298e430917c
	.xword	0xda57934e10c49934
	.xword	0x701d67debc547674
	.xword	0x25debe5b4ca4510e
	.xword	0x760a5b895cd7bdae
	.xword	0x893b31eec1c04259
	.xword	0x3bedfd5efda203e8
	.xword	0x8e875d9771918214
	.xword	0xcbbe32440d02af4f
	.xword	0xad725c290bb4d77a
	.xword	0x5d2155d58d4d3987
	.xword	0x6dc51057b2e6ae01
	.xword	0xf62e3a6f82935f40
	.xword	0x08a1863e7c5ebc85
	.xword	0x6896cf243ac7969e
	.xword	0x2d64e933cbf2ebf0
	.xword	0x9887d9f08db70974
	.xword	0xa6420b835ae0fac3
	.xword	0x0baa9b111f6c9ef7
	.xword	0x94ac64c33ddb962e
	.xword	0x878c15fab7414574
	.xword	0x426bbdfd23170d53
	.xword	0xaf21e0c90ad00047
	.xword	0xc23549888552bd7f
	.xword	0x8984ebf58804df94
	.xword	0x108efb020dc6a9ce
	.xword	0xbc58bb4ed85cffe0
	.xword	0xac780cbe16315a69
	.xword	0x815e6c89974b34fe
	.xword	0xeb3c7410ce8f4253
	.xword	0x790e94e4f5d99568
	.xword	0xfd08b20a0c700749
	.xword	0x5fb28206a86a1195
	.xword	0x6e657dca500ec17c
	.xword	0x620a96df5648ccee
	.xword	0xd0af6452a8477dce
	.xword	0x05231a54d7ec595a
	.xword	0xdf4ce8881f01d794
	.xword	0x91d7ffeaa692a142
	.xword	0xe9ec68b0337ef23a
	.xword	0x049f86c3711de2bf
	.xword	0xc7ac449eed018f3a
	.xword	0x331ab7008e21e9cb
	.xword	0x08280fdb4ebeaa2a
	.xword	0x5c4568c3227fd622
	.xword	0x0fb388103424033f
	.xword	0xb973e5afb6040c19
	.xword	0xf158f9d8caa3eb0b
	.xword	0x443b48f9dfc2832b
	.xword	0xfbb8d1b9b35420d2
	.xword	0x0439c56b9dddc8a9
	.xword	0x6064d2b4108fadb6
	.xword	0xb14666d3a08e6c72
	.xword	0x7367de7da5e02cd5
	.xword	0x8863b077433cc7f1
	.xword	0x1f5b241d34c0d95c
	.xword	0xd4e7d937f8355275
	.xword	0xbf626391c18d7688
	.xword	0x407aed8a5e8c03e3
	.xword	0x1cb797c0f9040586
	.xword	0x96ca7ef131a09c25
	.xword	0x18ab6a47356d60a9
	.xword	0xc40f3bd75e02675f
	.xword	0x27ae91181feb7115
	.xword	0x3ab6ddcb9de3cfa1
	.xword	0x22344baa37ae7946
	.xword	0x037d2dfc8267795d
	.xword	0x482d5598bfd9a349
	.xword	0xbb0fb6832cfe4018
	.xword	0xab840d5f9c64b6ef
	.xword	0xe080e6b60cdfd3cc
	.xword	0x47196cca7d0c037c
	.xword	0x3ff07042933fbd13
	.xword	0x8cf650d6700a6847
	.xword	0x7b11c332029552b4
	.xword	0xa9a5e23fe3f8fb29
	.xword	0xc465ed1408225004
	.xword	0x568f1bdd2a11d92e



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
	.xword	0x0acccddaa19d0f62
	.xword	0xfd6b8942bf368928
	.xword	0x41a8c8e1ac6b4116
	.xword	0xfd13a8a3ee9f99cc
	.xword	0xda45ad6ca4fee30d
	.xword	0x5bfd46b857ab58ed
	.xword	0x83d98008f8afa3c2
	.xword	0x587905f5bb00b9eb
	.xword	0xcb4ec5806ab5631e
	.xword	0x27db99789a2a9c66
	.xword	0x6be40960e259b727
	.xword	0xdb27c5ab97f47a4a
	.xword	0x546ec5b46583ecae
	.xword	0xd9d7a34a120bfa9b
	.xword	0xabb70eac34f81715
	.xword	0x2d61490b43c4f437
	.xword	0xf269208a9d110a0f
	.xword	0x70aaed18cad74975
	.xword	0x8b3eef099b43a137
	.xword	0xc65a3c4ec299af5b
	.xword	0x5db1454de8e5bb03
	.xword	0x725e7c240d578900
	.xword	0xd4b1b8031d681259
	.xword	0x8beda7bf89188f6f
	.xword	0x571ea6fce75a540c
	.xword	0x8d58946efa8cab84
	.xword	0x6338699dc1596269
	.xword	0x0938ced058a6d4f9
	.xword	0x750dd528f2844cb6
	.xword	0x50484b1e47623282
	.xword	0x4fc4b5cd2269394f
	.xword	0x796fcecbc0a31b76
	.xword	0xdd99ca41c1c8dadb
	.xword	0xa7f526d5bcb84246
	.xword	0x2bd102b057783bca
	.xword	0x9741fbd4e426bea6
	.xword	0x56ddffe39f22cbbf
	.xword	0xc99c5318383ebfe0
	.xword	0xd1b2cea50472708b
	.xword	0xaf65837da342824a
	.xword	0xac26a6a0a00f73ea
	.xword	0x15f70bea6aa32545
	.xword	0x4bd1b190d715ee64
	.xword	0xb5a22972455a3dfd
	.xword	0x05972ae894076331
	.xword	0x84697127c2d5e44d
	.xword	0xd5aca5843b88ffa7
	.xword	0xc6f1a5267c07ce7f
	.xword	0x40d8bd81d804897d
	.xword	0x423e5b0ec9e23713
	.xword	0xb8ce1ee5d98f09a4
	.xword	0x37a546ab2792a99b
	.xword	0xe117160157392d6f
	.xword	0x5cf048b430dbb2f6
	.xword	0x90ca5804c62fcfa1
	.xword	0xfa0395e366036c12
	.xword	0xa90429fb1bdaf421
	.xword	0xef4c7823eb3cdc6d
	.xword	0x314fcd24bc292fa5
	.xword	0xfaa9461113d49e79
	.xword	0x6fee4c217cd3116f
	.xword	0x53884b9cc5d8d36a
	.xword	0xd0cb3552accf89e5
	.xword	0x426a94a0508053d7
	.xword	0xb02f225ef0185105
	.xword	0x702e0ad23f4119f9
	.xword	0xfb761b59c64fbe5c
	.xword	0x3f9fe9639ca1d0cb
	.xword	0x9365e8d4c3738cd6
	.xword	0xcb36fbff961b6f9a
	.xword	0x8592c3a22a5e6518
	.xword	0x23189779fe144f5b
	.xword	0x51422537ed7b8997
	.xword	0x9af11ad9a6a507c4
	.xword	0xd32e16ded6fe3ebd
	.xword	0x3b7d85710942f0a6
	.xword	0x6cf1fc45abb452ed
	.xword	0xd3975ac8966f9f77
	.xword	0xa2bee4e45a8ba039
	.xword	0xc3e7fa921a886767
	.xword	0x561f13b8fe47b46f
	.xword	0xda09def36fc24cc9
	.xword	0x9a280b28f8361d2e
	.xword	0xf9d1e50d9807cc79
	.xword	0x403b2847d2dd978a
	.xword	0xaaf8f60042a1e19c
	.xword	0x66bc5817f60e6b58
	.xword	0x2ed2cb50078e9601
	.xword	0x73bd0fcef3218a25
	.xword	0x5cd578ea563a13b1
	.xword	0xf3b7387e8cf41947
	.xword	0x5631f503aa599ba4
	.xword	0x0f4352241dcbef0d
	.xword	0x22d5468feb5139ca
	.xword	0xac6d56ceb37d493b
	.xword	0xa795f948f27c4250
	.xword	0x6fcacd142058a42c
	.xword	0x83a8e14dd6422bff
	.xword	0xf806ea9fe01eef9d
	.xword	0xc2e197d0cbb46002
	.xword	0xd776c9191ed27408
	.xword	0xe93391bcf704cb55
	.xword	0xcec9cfcf88903790
	.xword	0x5a6499e64ef3205b
	.xword	0x9f27340ed2f5e6bb
	.xword	0x3fb1a2cfa710e060
	.xword	0x84f35104536f03b0
	.xword	0x620e10619aaa20e2
	.xword	0xc84f68a0153cf724
	.xword	0xcc6d46f8974f7189
	.xword	0x1c43fbce08aab1de
	.xword	0x3a58e6957448fbbb
	.xword	0x2f06a858e639fb26
	.xword	0x0d2801174c86bfb3
	.xword	0x48180fb2850cadcc
	.xword	0xac0bbd42f2d52274
	.xword	0xe4ba047e9ee71a0d
	.xword	0x405a031bf9508cfd
	.xword	0xee86aa6c4be4aa04
	.xword	0xca34ccc0e025227b
	.xword	0x3cb712e4e31a0d01
	.xword	0xd2fc722f92855567
	.xword	0x52cc3bf8fe493036
	.xword	0x0d2eecc6acc78c7a
	.xword	0x1c14fa6e3aefcd6e
	.xword	0x3a10b831d14482cc
	.xword	0x2c54b63cb74a070a
	.xword	0x0b1f6f6e6dcd8dd7
	.xword	0xa4f18831c098139f
	.xword	0xffc5f84ecabb69b2
	.xword	0xad72e950764c7111
	.xword	0x780dd100594e7e35
	.xword	0x3663f6e5b956ca19
	.xword	0x203388c137dc9fc7
	.xword	0xb885b8f95217a2ef
	.xword	0x4217acd22b99c589
	.xword	0xbae655f87d324296
	.xword	0x6175384010841985
	.xword	0xb2cf682e7d07acfd
	.xword	0x01b9b7aa9d3f49ba
	.xword	0x86bd2a6e5d0aee2d
	.xword	0xbc53c4c9db60d148
	.xword	0x16f4ee9d7edb1ece
	.xword	0x5dcd0a1410fda8b3
	.xword	0x0fc81fe687521094
	.xword	0xe95d222d76fb8987
	.xword	0x542f186518d690dc
	.xword	0xc58b6c4e1db5f8a4
	.xword	0x791d8fb41a05c6ff
	.xword	0x46144e976f02e70e
	.xword	0xf67120c098abef1a
	.xword	0x27ed03552c50af9c
	.xword	0x95a435799963d533
	.xword	0xd82e73c83713f571
	.xword	0xc5da1030187fbe8c
	.xword	0x564b142cce8ef7ed
	.xword	0x8654a2d6798a30f6
	.xword	0x5c508f8b1c878cee
	.xword	0x157469ee93add773
	.xword	0xb1ac3043e955d3b3
	.xword	0x68e86e96fff6b914
	.xword	0x1909c2029fc33e99
	.xword	0xf9430313caf4d41e
	.xword	0x28327980e5b9addf
	.xword	0x2e58a103cb721576
	.xword	0x996cdf6aaaa5f579
	.xword	0xd41862daf326bf4c
	.xword	0x3ca4152aa21d6c25
	.xword	0x62ccac4ac98ac956
	.xword	0xf3b960cc0bbb3a97
	.xword	0x4a14577ccc8dbd00
	.xword	0x9bba2f74246fdd88
	.xword	0xce29af0babfbadb8
	.xword	0x45234e8fbe6cc89f
	.xword	0x7ca8a952304eebb1
	.xword	0x61c5415a9217aa8d
	.xword	0x6d3cd59dcd31d789
	.xword	0x8414cdcc495b3c2f
	.xword	0x2a0ac1afc4379a8a
	.xword	0x65de50e6f7a1c85e
	.xword	0xc3476bca2414a6ef
	.xword	0xa5d9f1fe67b6dd7a
	.xword	0x1c36dbe75d021b17
	.xword	0xddf6aa4ec2b128d0
	.xword	0xbf83685ea7fa0787
	.xword	0x8e1053f4409b3b4d
	.xword	0x4f59921e12eacd8e
	.xword	0x00e19d334031d233
	.xword	0xcbba2f2e6cf9d62b
	.xword	0xb55fd8d1fa1a1897
	.xword	0x1287950d2d3d56a2
	.xword	0x6be67e79ceb198c4
	.xword	0xdffa5a1a743e4e4a
	.xword	0x223936c4f39e3df2
	.xword	0x60d5104ea79acae6
	.xword	0xd179fdae58634e55
	.xword	0x094f0d5569a4279d
	.xword	0x35302d95853202f7
	.xword	0xf4af1f4f6c70a829
	.xword	0x8859747f50b9b4e8
	.xword	0x50e0343186d9f0a8
	.xword	0xd1d43608cdcd55b3
	.xword	0xd22d1ad63ac8f781
	.xword	0x98af2506a9dec748
	.xword	0x75eb79c7299ab991
	.xword	0xf715c95106d15353
	.xword	0x8e6a85727eb86eb9
	.xword	0xd4b080fbf2ca423d
	.xword	0xba646717b42c6485
	.xword	0x22d5a11563ec4781
	.xword	0x93062b3a3a1b92b9
	.xword	0xd740f3917d5fcbb9
	.xword	0x83880c737a839252
	.xword	0xf2e0cb023a222512
	.xword	0xfdf70043b6211380
	.xword	0x82666450720322f6
	.xword	0xe2a97f3717093db4
	.xword	0xe75a4dcaf3a9df3b
	.xword	0x174737133c487ed0
	.xword	0x2952fdf38516ff80
	.xword	0xde9f7c56afba100c
	.xword	0x2a4cc8e0c4176c0e
	.xword	0xbe917bee0426e30c
	.xword	0x13cc9674dbdb55d0
	.xword	0xf62e67e9591ee308
	.xword	0xcb84024aa9b0655b
	.xword	0x7d44c4eb9ff5032a
	.xword	0x415792ad7aede9db
	.xword	0x103847de8cd2f4d2
	.xword	0xc5021c607ed2a6ed
	.xword	0x5781c45a4d794298
	.xword	0x2a5bc0a59dd69712
	.xword	0x7d2b16e5fcf72bd5
	.xword	0x7b43d6ddb535d22e
	.xword	0x60cb713d094c5c8c
	.xword	0x028b328a5329f532
	.xword	0xbe61e83f537b942a
	.xword	0x8a05ddae97afbd5d
	.xword	0x08e3a9ba9475b24d
	.xword	0x03ec67d1bc6d3587
	.xword	0xab0184375a39426d
	.xword	0xbfaac05af71b506d
	.xword	0x80981fe1ecdb7c36
	.xword	0xbcb0c20439b85041
	.xword	0xf359a9a39a49eb66
	.xword	0x0e00cb30da9e0197
	.xword	0x87bd3228b61c04f5
	.xword	0xca4345a5af80a473
	.xword	0x094e5a99171ae93f
	.xword	0x178b6630e99f2a68
	.xword	0x3d7704676dd8f475
	.xword	0xd2efb09d386c94b6
	.xword	0xa5e8e44fc510ceaa
	.xword	0x3862862e0fffaaaf
	.xword	0x63de0f09d2fa27ed
	.xword	0xbda38194a85278b3



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
	.xword	0x5cd7e72a460a4fec
	.xword	0x7ec5dc8fb008a280
	.xword	0x07492f3c7c9e9bca
	.xword	0xb3facfc7c3ee4b24
	.xword	0xbe1958fc8ae4f042
	.xword	0x2b6e593b564b6671
	.xword	0x4d279b8bcafd9110
	.xword	0x99f0fc23cb682a10
	.xword	0x65ec5345edb823c2
	.xword	0xf4b16791e324a744
	.xword	0xc6c9d64e7c40fe08
	.xword	0xa5cb56c8f1d220b6
	.xword	0x93fcff21928086a2
	.xword	0xc78da2b63e45c157
	.xword	0x58da4309f48cff2a
	.xword	0xabc05daf67b7f373
	.xword	0x642995d7321c7ef1
	.xword	0x51c01ef3f3140d73
	.xword	0xff22b34ed3e6275b
	.xword	0xffb8b990b61ad49d
	.xword	0xdf6e4c3384c93987
	.xword	0xbca7f17ac285afd6
	.xword	0x7d926b644697d4b1
	.xword	0xc66133344ef86646
	.xword	0x4be72e32ce52996a
	.xword	0x775ec4cb3f2bbc41
	.xword	0x801851349763584d
	.xword	0x7d40166e46bf311d
	.xword	0x6b9b9d0fc9360988
	.xword	0xa0e1b1f912a901dc
	.xword	0x1f0c6e01795dbcf7
	.xword	0x76e2635dd1c3e1eb
	.xword	0x007b9616cc41c2d5
	.xword	0x8159ab66c48154d6
	.xword	0x6d80852039ff863c
	.xword	0x69509accd6e1d9cf
	.xword	0x53460687beae0195
	.xword	0x698d68719b117174
	.xword	0x824043eb59a31d2f
	.xword	0x3c567089f6efae1d
	.xword	0xf6cac5c539d1428b
	.xword	0xc5a2bc04cbfa02db
	.xword	0x83e70160da47f064
	.xword	0xa3eddf461d1356b0
	.xword	0x85792647f9997ecf
	.xword	0xba3a5d2fc70cdd15
	.xword	0x92ae314725ca7e15
	.xword	0x0aad16f7d04e0f25
	.xword	0xab1183430ddda5ef
	.xword	0x5aa0b2aa79de8da0
	.xword	0xb050f79e64b3138c
	.xword	0x3b4995dc8a60386a
	.xword	0xe7be68f6b35d4d11
	.xword	0xab217a48e9d16c58
	.xword	0xbaf5abea2f44bc57
	.xword	0xf9cbac5e54ab7c14
	.xword	0x987b08e309f374ed
	.xword	0x34fcad13340492fa
	.xword	0x3969796646fac339
	.xword	0x4ab65542ed839c6b
	.xword	0x17c4bb6707c6c3ea
	.xword	0x435dd2f1d730d65a
	.xword	0x2dce62178623e270
	.xword	0xe7197709d5504d7c
	.xword	0x4b5743fffd34b428
	.xword	0xaabddeee34dbb631
	.xword	0xe127c22dc98a16bf
	.xword	0x0ee0d099b7942d9f
	.xword	0xbc0d71d45b5cfdc2
	.xword	0xd6f25b76109d07cc
	.xword	0x2837fef4e3728fe2
	.xword	0xcf953d9df52d4a3a
	.xword	0xba2835f281d24418
	.xword	0x657c667e3ff2f398
	.xword	0xb0be03f71e27b374
	.xword	0xf2ad65ae8d93e432
	.xword	0x6cc421f613de322e
	.xword	0x621a7d3eac822f7e
	.xword	0xb24121e96977ee6e
	.xword	0xfb9d6bf0f177d269
	.xword	0xa026e3c83eb843dc
	.xword	0x52f59694a66e8fbc
	.xword	0x999da59d64df3064
	.xword	0xff1aa2e8465c0abe
	.xword	0xfdc915177cceb850
	.xword	0x6035afd12b86bfce
	.xword	0x6704eeeb0374b0e2
	.xword	0xcd34d41eb9272a7c
	.xword	0x5e82fe94c9d57ffa
	.xword	0x39ef37ced9ceb9f4
	.xword	0x613721e731d3530e
	.xword	0xbbd5755acd88db99
	.xword	0x00b1274d0fe558ac
	.xword	0x0f4d85983305617b
	.xword	0x69a52b1963223467
	.xword	0x6d78c3f217054a0d
	.xword	0x19d06c911d6ec3cb
	.xword	0xcfb1753f02e64700
	.xword	0x6d05f0cc4e00705b
	.xword	0xc674a175b90d4e4e
	.xword	0x74517e1d466ecf34
	.xword	0x3ca0f892265eab95
	.xword	0xf1db5744a6f7f2a6
	.xword	0xc8a6ea711b6e2f0f
	.xword	0x41b3fdaac95f198d
	.xword	0xdbcb4875d4d7b4d0
	.xword	0x52c14729924eb616
	.xword	0x7cfa14b58d89a514
	.xword	0x7f701659c7942b25
	.xword	0xfde5456a27d47d26
	.xword	0xdab453dc7f9ed5f1
	.xword	0x9b0d536742d2aac2
	.xword	0xe537c47b56797cc5
	.xword	0xd94215a5d220cd47
	.xword	0x95e9e595e1ff8a3d
	.xword	0xe42d86f8215fc782
	.xword	0xbb1ca39b4629d739
	.xword	0x10834a7f4bae3f3a
	.xword	0x42161951557289c0
	.xword	0xc9088c95116a861a
	.xword	0x364f5c27eaeaa4c8
	.xword	0x826ea4c3847140e3
	.xword	0x56762364ebb4c22b
	.xword	0x3fb02b772fe6c332
	.xword	0xcfcd3cd78ce3e148
	.xword	0xe9a3397c9531a484
	.xword	0x223dfcc73eb683d7
	.xword	0xc670eecd7712848f
	.xword	0x02f0665cc0ec40af
	.xword	0xffa6e0b93a252ad8
	.xword	0x39128ee3538053e2
	.xword	0xa16b02b7f78b366c
	.xword	0x0bb0698a6db6fdc7
	.xword	0x5499022f742e82ad
	.xword	0x61581ab023f8ae50
	.xword	0xfa4d379952dbb1cb
	.xword	0xdee66cd98b8238d3
	.xword	0x267ee3eda4ef0d56
	.xword	0xf6d9b06bc85deab4
	.xword	0x0be8d0d378b00024
	.xword	0x342f8b9b239b5723
	.xword	0x342465c9e7e6e73d
	.xword	0x526e5dab73b07595
	.xword	0x67b911b95dd12de8
	.xword	0x088ffa6c1ef35a09
	.xword	0x1bd70c9aecc49824
	.xword	0x852c3d92d3568409
	.xword	0x26c323234343ad50
	.xword	0xacc6ead7f2a37208
	.xword	0xe2af08a132aed0ae
	.xword	0x30c28064410f60b9
	.xword	0xcd4db7620e3eb975
	.xword	0xd46c75aabb8f1f7f
	.xword	0x6e9795a21b1656f2
	.xword	0xecd9d0cc242afad5
	.xword	0xba5b8449018ae9cf
	.xword	0x0f16fa5d821db1b3
	.xword	0x7362cc8ff2d2cefb
	.xword	0x7a077b9320c11e90
	.xword	0x58729643129bb2cd
	.xword	0x1d82083599db81c4
	.xword	0xc72568a4e4f16984
	.xword	0xd7b30d7d1bdfc368
	.xword	0xdf0753e26f7a40df
	.xword	0x40efb4e8848993ea
	.xword	0x78d150e46275af80
	.xword	0x404645db6f0bf574
	.xword	0xeadbf0d020d5de79
	.xword	0xdcf46984b0197ffd
	.xword	0xb41edfe2f7c44262
	.xword	0xb69d0c1c94336bbf
	.xword	0xf6f5b8d008ff042e
	.xword	0x32c1bcabb832180e
	.xword	0x68c1837e1c6eb90f
	.xword	0xb67f3be10a41862f
	.xword	0xd7a33e59b2e6af07
	.xword	0x6ae06ff4e2f001c0
	.xword	0xc74d389b0eac62f3
	.xword	0xa72c8147d18efb1d
	.xword	0x550200d925f7e774
	.xword	0x95c9372adca95602
	.xword	0x3e68edb79e845376
	.xword	0x60c085b19f25fd70
	.xword	0x5c68514b087181fc
	.xword	0x63e272e017d083dd
	.xword	0x7fde5b72930ca44e
	.xword	0x5de835b89b320e1c
	.xword	0xaa0776dc1eb42130
	.xword	0xcf55b9a3bcdfedc9
	.xword	0x6344ea2b0380792e
	.xword	0x9db14849a08ed017
	.xword	0x5e99cdea3f41a485
	.xword	0x652846af1396860a
	.xword	0x3e20a4d112f23d54
	.xword	0x485cd8b26093e65a
	.xword	0x08604b7fbf914a9d
	.xword	0x1a5a709948e16c72
	.xword	0xe116f8fd83f476c8
	.xword	0xc7152990cc333785
	.xword	0x7dd3506b6fdcc0fe
	.xword	0xbdde14899fc1e02b
	.xword	0xb75778320e415d09
	.xword	0xdf031bfc86978dbe
	.xword	0xc2ee129aa32faf43
	.xword	0x36c8c254b45bf503
	.xword	0xae0174738fbb24e6
	.xword	0x503f444c3b9ef2be
	.xword	0x77391942e81bde78
	.xword	0xe18b5c104501763d
	.xword	0xafad6fc5218a9b58
	.xword	0x09855b8d4c3cb1c3
	.xword	0xea714891d132cfc6
	.xword	0x46e340ab2612afc3
	.xword	0x8e7480bef079b8a0
	.xword	0xa3595a508c46257d
	.xword	0xc6ef8d29dfb9c767
	.xword	0x6f0c4568e7d686c0
	.xword	0xac7104a552681333
	.xword	0xf052663c6cffce38
	.xword	0xe90c74b926e1f369
	.xword	0x78f9bc671e64a5bf
	.xword	0xe372b8ac1a19403a
	.xword	0x742b2244ad44ecff
	.xword	0x0416b085bd33e995
	.xword	0x65b82e638a96e181
	.xword	0xe19a024233026f97
	.xword	0xae22e33daacedba8
	.xword	0x9622103ea95e7e03
	.xword	0x05acf5c965abe8f0
	.xword	0xa40796994aa2bb4c
	.xword	0x8c74832afb77f6e6
	.xword	0x50ab630dbe091b00
	.xword	0xa0a439b97ab2cc23
	.xword	0x951045784c3f005e
	.xword	0x0ce30f8afef61f2b
	.xword	0x0fb64de449d2a5f6
	.xword	0xeb958c9898f5a7e2
	.xword	0x2d933238531471d7
	.xword	0x8a18956992418a1e
	.xword	0xb9a30142cd6c8644
	.xword	0x718eb0b5794af673
	.xword	0x36e2c7d0d4c0660d
	.xword	0x84b6d5082692ef89
	.xword	0x96f74045145a52b2
	.xword	0x96588d47ebf95aae
	.xword	0x5f8839fbed7aa885
	.xword	0xc6f6ace84c19da90
	.xword	0xa2637e4bd712473d
	.xword	0x3178380ea83821b4
	.xword	0xceefeff3bd944575
	.xword	0x69bedb618e614119
	.xword	0x595924adcc9f3ba9
	.xword	0xbb9d509fb6531636
	.xword	0x71432bb1d7e1363e
	.xword	0x3e868d40eedff4c8
	.xword	0xda73bca3358d591d



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
	.xword	0xf3956e1d7fa6d082
	.xword	0x690e011afecb13a5
	.xword	0x4193f5d7dbefd65b
	.xword	0x61978ceda320ed75
	.xword	0x60c6d31b6f35c786
	.xword	0xc3900e2ccd7bffa2
	.xword	0x093fcff5f24060d4
	.xword	0x3c22f9a38024bc11
	.xword	0xd441b72db579cbaa
	.xword	0x6970ed5fa579e5a2
	.xword	0x23a0e76a9f730793
	.xword	0x45dedaa85e1112d9
	.xword	0x38111b5718d222b1
	.xword	0xb030d72645a8b858
	.xword	0xceca42ace8d53612
	.xword	0xa425943280507524
	.xword	0xc177a69f30ac9656
	.xword	0x744a7f8262fbc8a4
	.xword	0xd7c92421709596ef
	.xword	0xcd38d7211cdee32a
	.xword	0xf0bfa688f18e8589
	.xword	0x8c770a3f468d6ff3
	.xword	0xd1c9d27a3997fca5
	.xword	0x4ec7ba622da894d5
	.xword	0x0b6bcd2fa122bde7
	.xword	0x63326c7610efa8f6
	.xword	0xb907fe618c70bd92
	.xword	0x3f6a0564e55ccc13
	.xword	0xd32e8afb6e20954e
	.xword	0x108d21f8887883cf
	.xword	0x0424f8c53460730f
	.xword	0x0a3be3f83ad53e00
	.xword	0x6ca9df1c924771c6
	.xword	0x0021d67704ff20c5
	.xword	0x8499eb54bf2f4858
	.xword	0x9a45d3f7536b68d3
	.xword	0x78ef3f7e9abed323
	.xword	0xd95b403c3d5ea6d0
	.xword	0xb3e5868f34a21741
	.xword	0x498b99c3adcbc926
	.xword	0xaf561535ddbf0a3a
	.xword	0x058b8963d1ab9ea2
	.xword	0x3c79d655f8bab033
	.xword	0xd9888021078fa265
	.xword	0x65317a8992700d2d
	.xword	0xef937a65fc15fca7
	.xword	0x1a8d91f96463d4e3
	.xword	0xe0ab69d02ead9498
	.xword	0x69069283a41aadbd
	.xword	0xbbab3417fc19068c
	.xword	0x4ec4aab3c91e70f9
	.xword	0xc305bac039e1ef40
	.xword	0x0156e1d30377851c
	.xword	0xb88c75aeca7cf13a
	.xword	0x1c545076e1420a16
	.xword	0x7a4e727adbd1cb72
	.xword	0xfffed7c7a54b1bab
	.xword	0xe666bf3be68847b5
	.xword	0x2162a5316af466c9
	.xword	0xa9c58c974844a308
	.xword	0x3630c41f529451db
	.xword	0x2a5d4c73f60517f5
	.xword	0x108cb43f4a667359
	.xword	0x633c45528b36fb54
	.xword	0x7549ceb8a265e689
	.xword	0x4b91ffd9ee58f822
	.xword	0xd1a070ed17825023
	.xword	0x772ef8283bec0125
	.xword	0x6379f64a1e8b98b2
	.xword	0x0b55ca9aceae205e
	.xword	0x95be6e3dc2337eab
	.xword	0x9b4d113f3fb6bbdc
	.xword	0xc5d967b1e3bb032c
	.xword	0xe0d6c7aaf0a745a6
	.xword	0xb55f0358d89ede10
	.xword	0x0a66404311aeb7bc
	.xword	0x9416b748e2ca4027
	.xword	0x65081c7106237eac
	.xword	0x3ff9315dc70c4598
	.xword	0xca997cba25da1db6
	.xword	0xbca88a03d755b093
	.xword	0xda7e29329b71feab
	.xword	0x223a15f734651e38
	.xword	0x1bc20371ff9972bf
	.xword	0x8d11776b9ecd8c01
	.xword	0x86a7317f1b20bf3b
	.xword	0x9ec254fa8ba2d57f
	.xword	0x14e670b6aa6b2ce5
	.xword	0xbe088bc5aa61de23
	.xword	0x885c11495ee5838e
	.xword	0x46aa35fe1215394a
	.xword	0x71dcdf8bacbbd23c
	.xword	0xc246f4bbbdf9d6da
	.xword	0x90f05656c132b177
	.xword	0xbb41f25c61da24d3
	.xword	0xbf24256d88f9740e
	.xword	0x118415c9c7c15af7
	.xword	0xd6dc7d25ee7f48fa
	.xword	0x2a61158713d1ddb5
	.xword	0x1222a23dc62ee949
	.xword	0x836fb45aca170ed9
	.xword	0x59798ffdd7467956
	.xword	0xf58b1712bc2ca7ed
	.xword	0x654b92f1ccaefe87
	.xword	0x153851e1c08f7d96
	.xword	0xfe7154fd059bb7f3
	.xword	0x3991d8c0568e5475
	.xword	0x3e84b4c2a7cf9531
	.xword	0xa6fa52af16755db7
	.xword	0xb22e2ddf5ddf16ee
	.xword	0x87eb53538057fbae
	.xword	0x398a476595a11a95
	.xword	0xcecaaeec5c1baa75
	.xword	0x2e34ad3e942f0a40
	.xword	0x2fa7d072da219adb
	.xword	0x2b5add21d21d02ca
	.xword	0x412a54729f37d162
	.xword	0x57a15b84f56fe788
	.xword	0xa84cb174e8747b6e
	.xword	0xd66384219ef6d7ff
	.xword	0x3c901df0579befcc
	.xword	0x4a6fb190659fc9bd
	.xword	0x10985696a2cdafd6
	.xword	0x6a4de85aad952345
	.xword	0x0682bd5f2f8c0b30
	.xword	0xa4e0421aa1ddafce
	.xword	0xb29e84482dec085d
	.xword	0xd6bc5349568872f1
	.xword	0xcb99313644603da0
	.xword	0x2c3a00c5a61f9fcd
	.xword	0xa7f76d8ba26bb7c6
	.xword	0x4696ffeebfbafcf4
	.xword	0xd3a04ff8cfe5503f
	.xword	0x934e16d7c08b41e7
	.xword	0x2f217d3dbb9ff718
	.xword	0x7f00f81c51afa4be
	.xword	0x8468f297f658e752
	.xword	0xe823c8d2429ac9a2
	.xword	0x973f55c71f2d0613
	.xword	0x642fbd9ebc302f06
	.xword	0xafc7cc7468878e73
	.xword	0xe6d342565672e7ad
	.xword	0x34cb1f3e4fa83e53
	.xword	0xe98899b0b694346b
	.xword	0x369ef7853dc2bc86
	.xword	0xbba72efaf57cfeb2
	.xword	0xa7d16d2ff7dbc816
	.xword	0xd768cea1beab846d
	.xword	0x008d5d70f6d57570
	.xword	0xbfeed30d519198c7
	.xword	0xe7af3f799310e45d
	.xword	0x8d0a2a0c44690444
	.xword	0xe51fd01b37d0c7a0
	.xword	0xeb10422bc976ac3b
	.xword	0xb0d67268269614f1
	.xword	0xdb20d76789041ccc
	.xword	0xad74e7aad156e18b
	.xword	0x3d748a0997c37de3
	.xword	0xbb33de4ee02249f5
	.xword	0x3eed813d207e01ca
	.xword	0x389620270ba5493c
	.xword	0xea77ec3fd71849ab
	.xword	0xbb3845b1de743c26
	.xword	0x96ecdaf8fbac0957
	.xword	0xfe62e09e2cb74cf2
	.xword	0x37e8c9ce931b189a
	.xword	0x812f214981510b0c
	.xword	0x0f3817009e30371d
	.xword	0xee68e0f046bd3618
	.xword	0x1cad80b8bc8fce71
	.xword	0x929e76ae8ab2f1ca
	.xword	0x64169cbfcbc60912
	.xword	0x03259f7c3215a13f
	.xword	0x945bb60de3ea156d
	.xword	0xdce7d2cb277b848b
	.xword	0x68dcd4067c1198b5
	.xword	0xe370ad6f6f0beead
	.xword	0xede35c31ce12d4c7
	.xword	0xfbcf824200ab0e8e
	.xword	0x19dfd0844d4cae0d
	.xword	0x7f8b2a58d83c1f88
	.xword	0xc2b996aad5b29811
	.xword	0x2cdb281aa0c264dc
	.xword	0xbd739ed547c6ad03
	.xword	0x294c7ed59cb0cd6c
	.xword	0x0562c7b5c8cc40be
	.xword	0x20f145823db1c3b6
	.xword	0x8106ea7c5aa306d0
	.xword	0xa7f7f981badcaf4d
	.xword	0x03a72fa680c92e3e
	.xword	0x844fff24e0008b09
	.xword	0xd9c63c8c32c06531
	.xword	0x4def1b7520b9d40f
	.xword	0x81c1f832db3960d0
	.xword	0x4d87ab7b02557de2
	.xword	0xd95d9d287a988a62
	.xword	0x63676f8149f16bc6
	.xword	0xc527b0bee46281ef
	.xword	0x5da26e42f89da585
	.xword	0xb1e5de00e80fca2a
	.xword	0x5686b1fa7ddfbf9d
	.xword	0x31eddae7147daf64
	.xword	0xf16c8da262e81222
	.xword	0x0b3ce48202bc7ed2
	.xword	0xed67c594c3dfc50e
	.xword	0x17c7d177b5c3023f
	.xword	0x12120ed7240eb82e
	.xword	0xb8f46214402fa422
	.xword	0xdcd2dc88d392d4f0
	.xword	0xa2ec3e2c7935da84
	.xword	0x2093871dccbca4d8
	.xword	0x5d43dcfa9b00d747
	.xword	0xd56cea1927cb665a
	.xword	0xc0e9255b59b931a3
	.xword	0xe40e2d5d380abd02
	.xword	0xaacaa2eb77e2d609
	.xword	0x62dc1fd8ca0eef27
	.xword	0x653d910622f0a987
	.xword	0xb356d70eeb7d9f32
	.xword	0x5f8b65f2602af646
	.xword	0x57c23527b14b86b8
	.xword	0x970ea964072eafca
	.xword	0xc6ea69802eef5ca2
	.xword	0xadb82dd9de4c43e5
	.xword	0xb4d4beb9611c62e9
	.xword	0x97d0bc38b0470389
	.xword	0x14af2f542ec67175
	.xword	0x5db9ea18307880ce
	.xword	0x1bee3850946c0eec
	.xword	0x5e6d48c6d35abf9d
	.xword	0x11efdcb20c598f42
	.xword	0x2b74fcef0fbfa533
	.xword	0xa87bd54b8734718f
	.xword	0xecb01effd1fec6a5
	.xword	0xf8c5ebaf9aabf505
	.xword	0x65b8f679247d4775
	.xword	0x2f49ffa49739fe21
	.xword	0xdf5ab880304c38a6
	.xword	0x7cb16fadaf9f1ad7
	.xword	0x75915a1b2eb7eb99
	.xword	0x1112fa01f8cf9fa1
	.xword	0xc85c71ef302fb174
	.xword	0x21fcca68ab78d76b
	.xword	0x875e9a1c89daf0d1
	.xword	0x178af5e8d70e606c
	.xword	0xf0c0235d4af21e38
	.xword	0x7fc1ab22f2ef2538
	.xword	0x073422c0c1a33ada
	.xword	0xc6f7903232e7dce8
	.xword	0xf399d58a56725996
	.xword	0xab1096634dd098c1
	.xword	0x852303d92b26cfbb
	.xword	0xec768b7abf248f6d
	.xword	0x949d452f3e9c79df
	.xword	0x08081161080e701e
	.xword	0x50d45afa34703e25



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
	.xword	0xfb80a7823f7d1bda
	.xword	0xf0d63d1dc51353dd
	.xword	0x952f27d29bd26cd9
	.xword	0x3f150a6c62258c47
	.xword	0x7cab8c0dcdd27f7f
	.xword	0x4a285aa92cd13c8a
	.xword	0xad18ba78e64657cd
	.xword	0xbcb977a812df47e2
	.xword	0xaee82a35490a6ce6
	.xword	0x6f60126ea841a7a3
	.xword	0x2fbdf6a5b688b7e3
	.xword	0xdc0cb6fe991eed6c
	.xword	0x8f801b0b8558fa38
	.xword	0xf1bafb686f2b12f5
	.xword	0x1efa0a36ecb3b5ef
	.xword	0x0b59ce23662df7c4
	.xword	0x2b13d24fb25fd053
	.xword	0x198b1a342e77369d
	.xword	0x0356efc431acf1d7
	.xword	0xba8be9d544f6a98d
	.xword	0xe4cbec09e46b52e0
	.xword	0x5e2d97a514715955
	.xword	0x2414adcd84c40189
	.xword	0x23bc74735caf69bb
	.xword	0xe262103e9e445928
	.xword	0xfe53df4062101430
	.xword	0xc883879c79d2c2e6
	.xword	0x3f03c76cc372a4f5
	.xword	0xc1e22fbb5507a844
	.xword	0x9df9f6d518533ab0
	.xword	0xd7717497c0e487d2
	.xword	0x358b89f3901daa0e
	.xword	0xf7d34774fa25fafe
	.xword	0x994f43b4ce914815
	.xword	0x202e9940090c30f2
	.xword	0x1a33e8aecbfe4004
	.xword	0xc762c166d19e3314
	.xword	0xc98e1313d9aacd10
	.xword	0xf2d7619ac53c2bde
	.xword	0xd9c6e75d4aaabb2a
	.xword	0x1d28f1a34174516d
	.xword	0xed315ced7776b729
	.xword	0x2a6b1a55eb09af5e
	.xword	0x3a4ea5c7f4844c1f
	.xword	0xbafeca97f7f11d36
	.xword	0x16ff23c2326f81ad
	.xword	0xa3a38160f6cb82b9
	.xword	0x9af1e68331aee6a6
	.xword	0xa9878a2e56c5bcf6
	.xword	0x6e6c734867127eed
	.xword	0xb194afa12db33293
	.xword	0xef3bc2c6db6ff2f8
	.xword	0x499f43adaf6fa0c4
	.xword	0x339ff344a2d27127
	.xword	0x208de095488f3e23
	.xword	0x0ecced116bd59f7d
	.xword	0x38b85e83291f55b8
	.xword	0x29eec3dfd0446be9
	.xword	0x747e593df4e7a37e
	.xword	0xc95d355d5fbaf9e7
	.xword	0x3de02720c7d3af96
	.xword	0x020708c86c370d98
	.xword	0xed98800f156c0d0b
	.xword	0x8b625d9d28b0f4d6
	.xword	0x8e7d47a2c2b040d1
	.xword	0xa1ec2d0fb10339e7
	.xword	0xeb236f599e530e29
	.xword	0x35aaef1c59d565f4
	.xword	0xacaaf785fa721071
	.xword	0x9003bc4516468700
	.xword	0x987135b15be2b5a0
	.xword	0x7486e87f15298be4
	.xword	0x00b7a60ff4ba9102
	.xword	0x9eece327f421446d
	.xword	0x26d8332ac9e0ef7e
	.xword	0xd27940fab0bd6cf2
	.xword	0x08d107486ee98b38
	.xword	0x38acb3e80be379f5
	.xword	0x9d179c4bfa59c4a1
	.xword	0x1c3cbdfd4f5d4210
	.xword	0x81d33bfbb91583f2
	.xword	0x0ee09bc6c5948a35
	.xword	0x4a6050a6d0b54ca6
	.xword	0xe562e7443d095b63
	.xword	0xb99273dc9a30e431
	.xword	0x9df4f4ad96ba0638
	.xword	0x475858dbdcb45738
	.xword	0x01413b961f2932c2
	.xword	0xb5f16b65c77ac196
	.xword	0xe8afeb3d914fd513
	.xword	0xc493e1851f3a036e
	.xword	0x8e580bf2be861606
	.xword	0xad185943d957bf47
	.xword	0x56a0002c2e6f8829
	.xword	0x505cf530eebac956
	.xword	0x6684031655096405
	.xword	0x4de272dccc9dc0ba
	.xword	0x058f03162e0010a0
	.xword	0xd877f493fe67ce19
	.xword	0xecde4e3d743ec8a4
	.xword	0x0809efcaab4a2bcd
	.xword	0xbde01f415c7a415a
	.xword	0x88f3734d7e976de0
	.xword	0x82fb52b7dbeef760
	.xword	0x1e1787f0d3bd33a0
	.xword	0xd009ba8ad3cd21dc
	.xword	0xb1e7714baec73d73
	.xword	0xa406793194a5c9a1
	.xword	0xffcbe25c6b8041f2
	.xword	0x243730356b90644c
	.xword	0x898109f17e31cc54
	.xword	0xca1aa2f0af0f6398
	.xword	0x33c38e6b6abdf2d1
	.xword	0x1222e1a5c8797d2b
	.xword	0x28f886c05d05ba1d
	.xword	0x3964486f58b6fc44
	.xword	0xfbc4c2b9f6948a00
	.xword	0x062c5c775b0ff933
	.xword	0xcd85b1e33c0aff89
	.xword	0x3c8160ea5a87eeba
	.xword	0xef3264fbe6ed90ef
	.xword	0x7c66993bc76a4201
	.xword	0xae53e2c4241c3e35
	.xword	0x345c63089e312882
	.xword	0x135e1d6085cefb13
	.xword	0xa591bdd6537e3e4b
	.xword	0x12092a051b94ed72
	.xword	0x70bb6b4c9f1eb55b
	.xword	0x4a238fd2d27650bf
	.xword	0x3ab9613e1406254c
	.xword	0x472b22a91d6058fd
	.xword	0x276e503692a49ee2
	.xword	0x1e02889b1e8291ef
	.xword	0x4c06a8819a4a0938
	.xword	0x31be02218da3ae0b
	.xword	0xbb4217fcce5b6309
	.xword	0x6b50a243672ae72f
	.xword	0x4662867cfb5a90d3
	.xword	0x1f148fea8a29bff7
	.xword	0x7b6014e46bf0db53
	.xword	0x0d1b7c1e7162fcfa
	.xword	0x864559e163c40568
	.xword	0xacadf03b0259d587
	.xword	0x637c726ad200ccef
	.xword	0x9f24e9975e4ca9da
	.xword	0xbef8ef2db511d36c
	.xword	0xce80716e7bedf22f
	.xword	0x0ef5eae947f3449c
	.xword	0xae1f9183a12c42a5
	.xword	0x307c03de3fc9b5e2
	.xword	0xed06573d166f25af
	.xword	0x11047a35ac06b15a
	.xword	0x1fd1c04b7fdd2dd1
	.xword	0x3107daa3060959f9
	.xword	0x08b1cd1a80490564
	.xword	0x92281e0f8fa55788
	.xword	0xd21432f3c90c2ed6
	.xword	0xa1b8594e4f21f4a8
	.xword	0x736a0bb0f4d3f9c7
	.xword	0xf70fee9d1bbd0afb
	.xword	0xda6bbd615afff8aa
	.xword	0x63e033e257ae24ad
	.xword	0x0ff8ed847463dac9
	.xword	0x954f0a73d297cdb2
	.xword	0x0e421de5edae7359
	.xword	0xc0fff285ef203534
	.xword	0xee85509924b4e45e
	.xword	0xbf2569bca63ae6e4
	.xword	0x5c5b7a195a0dafa7
	.xword	0x598770632d02009a
	.xword	0x21046a84d59268bf
	.xword	0xfb94d1a901ca424b
	.xword	0x2c7bfac23fc82ba0
	.xword	0x5374d21444ad0065
	.xword	0x0f633156d75459f7
	.xword	0xb89bc62d6d9b7384
	.xword	0x44607c884a503efe
	.xword	0x9b7949879fb0a78a
	.xword	0x2a9d27f13077c095
	.xword	0xc97d8ed35d68af73
	.xword	0xf9b27b3e0ccc0622
	.xword	0x11fbbc97e0a79a31
	.xword	0x85f876d45e939faa
	.xword	0xe5fbb57a27f753d7
	.xword	0xfdf1520a9d8ed9e6
	.xword	0xf34662360885725b
	.xword	0x5c5162de61734b8d
	.xword	0x9c7d05643423ffe6
	.xword	0xb25c9385a8ac46b7
	.xword	0x6264d9f07ae5b34b
	.xword	0x14fa946134dc1585
	.xword	0xbc69eaa5dd950aaa
	.xword	0xcdfaa068ae439cc6
	.xword	0xf903212cff461890
	.xword	0x670cf19caccfbbbe
	.xword	0x07aedf7167820fb8
	.xword	0xdcb40daad27972c7
	.xword	0xf8887a0a7ed6ae98
	.xword	0x458ea007221a53b0
	.xword	0x120eefd1488f6647
	.xword	0x4e28e7b0fabaaa9c
	.xword	0xcde5744181076020
	.xword	0x927f4e8e605bf297
	.xword	0xe187f7a00340dcaf
	.xword	0xc0204ba497d8c2d8
	.xword	0x755f975d87c6accd
	.xword	0x4cf9d7ce8d16644b
	.xword	0xb7ae82ae6bfbdf86
	.xword	0x0ebd1ea28e5240d5
	.xword	0x478639772a5773ca
	.xword	0xabeaf7f2227ef7ff
	.xword	0x94f6258fb082a087
	.xword	0x30f432f5be992280
	.xword	0xd2f12bfefbb54085
	.xword	0x8f647ad3400a6ca0
	.xword	0x29d1332358860eb4
	.xword	0x4d439f7522afbaf8
	.xword	0xcc3ec0507692b715
	.xword	0xe0d2fb74e311399c
	.xword	0x2bc09f5273bc3670
	.xword	0x8f633ee56f2570cd
	.xword	0x25440a798f8b642c
	.xword	0xbc3d697226239324
	.xword	0xb2cd36378e057007
	.xword	0xc1e45b1eebda4ae5
	.xword	0x11f3c5148a8e2735
	.xword	0x17574be72d002cf2
	.xword	0x37ad7581d9e426bc
	.xword	0xce4bc3bb7f70bbbd
	.xword	0x7024840f4f353d87
	.xword	0x6044c120c0ad01ad
	.xword	0x7aaff71681a43955
	.xword	0x70ba8377c3e9531d
	.xword	0x9421debe1c022ebe
	.xword	0x747573f543a0d5ac
	.xword	0xcc2ceda441b2816a
	.xword	0x194c664ed7e7f456
	.xword	0x329b99c4faac5db1
	.xword	0x2876c433c8520e63
	.xword	0xef5ccaaf1c8ab585
	.xword	0x205cda651629ea70
	.xword	0xa1e626ed1211a67b
	.xword	0x4c0e1c076875edb3
	.xword	0xbb3c3abd754b58a8
	.xword	0x5b458644e7f1ea28
	.xword	0x0d244995fe085e3d
	.xword	0x558f4920d24a0497
	.xword	0x71e724d0c09e81da
	.xword	0x3dbaf94ab0d856a7
	.xword	0xcfc519d720c1e09b
	.xword	0xba4fbb88d0b7981b
	.xword	0xdf7f59784339035e
	.xword	0x40967b1e2ca4e82c
	.xword	0xbbf71f7f6ab5126f
	.xword	0x6ccdc4705c474214
	.xword	0xacbc1f5365d73556



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
	.xword	0xa6f7ab1d642a89d8
	.xword	0x45a3ad5e873d5ea3
	.xword	0x769e5b7a21cd7b5f
	.xword	0x36e17ce945e852e1
	.xword	0xf33dc58f890463e2
	.xword	0x3c33e104b2cbba80
	.xword	0xdfe6a34bec9ee503
	.xword	0x5d47126b0810a0e3
	.xword	0x8c7bab6f9d717acf
	.xword	0x89617f0d6e0c4a94
	.xword	0x62c645fd04b4d019
	.xword	0x185838eff06c8ee1
	.xword	0x5fa9a9be40ad3db6
	.xword	0xf8582842ef1597d1
	.xword	0x520f9c19f3fe7abe
	.xword	0x4093e9bd73ceb49b
	.xword	0x716c0b14118335a1
	.xword	0x43c46314c44f4b5a
	.xword	0x55ff1eb1aa916ca2
	.xword	0x8eb6c31a5b970726
	.xword	0xe3335ad31a746ec5
	.xword	0x8407fd2681aeae8b
	.xword	0x5e303daf4ae4cea3
	.xword	0xa93a8b00b57af48d
	.xword	0xaa3c789f882a0374
	.xword	0x42e6d245740769ec
	.xword	0xde4637934b2f29c4
	.xword	0x0850143eabd1235f
	.xword	0x359168c8060a4f43
	.xword	0xdf0a7eb96192aa56
	.xword	0x5502286f67486d17
	.xword	0xe85f49897a7af1fd
	.xword	0x1b2cd25d85ff0df9
	.xword	0x9220a774cefdb917
	.xword	0xacf7f4475e422038
	.xword	0x6fef0a5286a9607b
	.xword	0xb21b64e0ca02b85c
	.xword	0x6ffb11e953bf118d
	.xword	0x3c9d8bb263f7c8a7
	.xword	0xcd8a9f69cac16baf
	.xword	0x06e65c581be11faa
	.xword	0xff182fada750fc74
	.xword	0x6a382e47d7635600
	.xword	0xadc90482e6d221b6
	.xword	0x197ca8907d695b16
	.xword	0x88c517a41c5551d9
	.xword	0x6d93cfb95236c980
	.xword	0x63875ea9ecf77c5b
	.xword	0xd99df96b59464825
	.xword	0x888256c3cfd2a27c
	.xword	0xd79ebe00db1f1097
	.xword	0xa50ef8ad57673ec0
	.xword	0xc2b3b2a62328f891
	.xword	0x86e305601a9fc2c6
	.xword	0x15f12d99eea41a51
	.xword	0xdb8ccd1b8eaed551
	.xword	0xf6f4698fb10ee48b
	.xword	0x5d1130bc302c0142
	.xword	0x0f4e4f288e5cdba2
	.xword	0xbc92c3ea84423653
	.xword	0xd5da76d2ad4ae85a
	.xword	0x2960b5bd0dc9f500
	.xword	0xb7a3d7d248096e16
	.xword	0xe4e0f31901ea2795
	.xword	0xf8b70efd37a836ba
	.xword	0x51986c0e2f1eac9e
	.xword	0x3512173705beb961
	.xword	0x6f6344d7582f3bd0
	.xword	0x59699d9bdc65f62f
	.xword	0xdb5d51b326006f8e
	.xword	0x8d8cc5d49556f121
	.xword	0xd55b979a1206c4ca
	.xword	0x61d8a1864a2b2502
	.xword	0x172f2c59baaf2f2e
	.xword	0x7c4ec013fdb26a09
	.xword	0x13066330d0570be0
	.xword	0x1682e398f0aecd2d
	.xword	0x082cd9c7e8b09327
	.xword	0xcc04895c7021960f
	.xword	0xa53b737031c659f7
	.xword	0x51a38a57c4d39511
	.xword	0xfbf8d9a2b40140ad
	.xword	0x90182b960dcfb460
	.xword	0xcbff0fb381261aee
	.xword	0x80a04accd78ee22b
	.xword	0x52e9638550438afe
	.xword	0xbc370978d900829b
	.xword	0x44f35039431d25db
	.xword	0x5ee7b3bb9700a6b1
	.xword	0x9823ccdd55102d49
	.xword	0x1ecce48ea5dcfebe
	.xword	0xe36d850555f7149b
	.xword	0xc07d3c2118e486d0
	.xword	0x173e749c29998aea
	.xword	0x644dddba1bcf88b9
	.xword	0xa59e91840246bbc2
	.xword	0x3fd51755b2b1d685
	.xword	0xfe0b3d046c7a3135
	.xword	0xcf5f68d0f37252bc
	.xword	0x8ec3878561104d6f
	.xword	0xc065ee6af7fbf1b0
	.xword	0x0785b3db3b91768e
	.xword	0xd63698e234cf6784
	.xword	0x4232508aa6a86500
	.xword	0x21f741b50153326f
	.xword	0xfede2dbec7cd0c34
	.xword	0x94d4c96376a4a716
	.xword	0xd9e13349211a0634
	.xword	0xc9730349764fd4ff
	.xword	0xdec5278c1bc38274
	.xword	0xa6345b2b460e3d06
	.xword	0x295dd1392a151ab5
	.xword	0xcbe06f33cb96f484
	.xword	0xf5528c021bee93df
	.xword	0x9e961b200d2c07e6
	.xword	0x21bb402c57020f6b
	.xword	0x1a7887921f2b288e
	.xword	0xf57b24c4a6d6b990
	.xword	0xb85faf3d09dfdfbf
	.xword	0x67d7bbbced8c17a9
	.xword	0xbf5e8684a05209e1
	.xword	0x47104d73033566db
	.xword	0xa16369dc0b21eff3
	.xword	0xf2a874df9cf9d9f0
	.xword	0xa085ace59f8af2b2
	.xword	0x5e605f9568b409fb
	.xword	0x90499270abeedbf7
	.xword	0x959fa5297aba11ca
	.xword	0xe1e9676c1c57300f
	.xword	0x7f01ba9db2384615
	.xword	0x32423218ca3e0be1
	.xword	0x9e03fb03196ca424
	.xword	0x166583a2058b032c
	.xword	0x11d9d27382969868
	.xword	0xa86322b74c841cc7
	.xword	0xe6f112650d00f1ed
	.xword	0x2eec7c8f4f5bc9d5
	.xword	0xccfb16c66814bf7d
	.xword	0x4badc3c43f580532
	.xword	0x78ba55ca0062913b
	.xword	0x7e8c7e01e8ed40b9
	.xword	0xa47bc4afcca6bf9b
	.xword	0xdddfe8b98da82848
	.xword	0xd727a6a78c43c8f3
	.xword	0x5ca1053a9684e19d
	.xword	0x0be06d7bbea6ba4c
	.xword	0xebdcad55e6f6221e
	.xword	0x740d0900af8cdd6d
	.xword	0x49346254ba81646a
	.xword	0xb8c616f48fdaf301
	.xword	0x8ae570ab843b5f07
	.xword	0xb6df2edd10dfc90c
	.xword	0x471617456bb61542
	.xword	0x173259b4577c6064
	.xword	0xc76a10cfdc6089bc
	.xword	0x03261fd35f15ea83
	.xword	0xc35cbc858d697763
	.xword	0x38fa94d3c78f26f9
	.xword	0x62ae209d22397af4
	.xword	0x52c0763d7a88e2d7
	.xword	0xc1d8d9dcdd4beddb
	.xword	0x164fdbf89d99e286
	.xword	0x91294a4a4365e9ca
	.xword	0x61b6a33f8dac5e4c
	.xword	0x0dae21185da4c27e
	.xword	0x3d1baf6b324e5382
	.xword	0x54f8f609633bac65
	.xword	0x40393595936d2a53
	.xword	0xa74e49d0e999603c
	.xword	0xe78ca972c0ba99c2
	.xword	0x41b1b546d9a326a4
	.xword	0x16ed65624488b759
	.xword	0x529d704aeb3dd8b9
	.xword	0xd1ef08968c5a9e79
	.xword	0x45346d736cd4c2e8
	.xword	0xd8330b02a0bf8f99
	.xword	0x0e25cb70f56b4f7e
	.xword	0x6d333d3e2e08fe11
	.xword	0x68e20fb9bf2eb23a
	.xword	0xc988fbb7e25ab3ce
	.xword	0xd5f9e85a570e0d7a
	.xword	0x5f0f0cf2d1834a62
	.xword	0xf3400f4ddb57bef6
	.xword	0x8acee5446ce29ab7
	.xword	0x585fe129b8850366
	.xword	0x965d90389517d634
	.xword	0x7e1c83f05976cef0
	.xword	0xe0373b41671ba7f0
	.xword	0x0a40bf039fbc37e7
	.xword	0xd9bab8ef5af92a64
	.xword	0xeb967771ef3b1f70
	.xword	0xdf64d66761cad520
	.xword	0x602904608abcd590
	.xword	0xe79017bf8fa50c91
	.xword	0x0e4b94c919c07e5c
	.xword	0x6fd4a6b3e1c8e499
	.xword	0xe160c313d756f764
	.xword	0xac8d9a7423cf94f4
	.xword	0xe4db34f3fd4e0d77
	.xword	0x450d47761b73b8d0
	.xword	0xf8fefa91855fc2e3
	.xword	0x15de67519fc2f0e8
	.xword	0x122e8cc83a00cda3
	.xword	0x85e06928fbb912d0
	.xword	0x934204cbea2031b3
	.xword	0xf797e344edfbdb40
	.xword	0xe6c7835930ce079b
	.xword	0xd6bb7537810d8623
	.xword	0xf16a209c9296214e
	.xword	0xe52c7821f3e4da2b
	.xword	0x45254bf5a97440f7
	.xword	0xc5ed3c49d1fcab1a
	.xword	0x1107a9b90f58e1b0
	.xword	0x89ea61132c369421
	.xword	0xeafbd6abc3b003e4
	.xword	0xa032b5b719f5fbdf
	.xword	0x7c848d465b9ca006
	.xword	0x60eb1f9132e17f61
	.xword	0x723ecd1ec0d886d5
	.xword	0xb4b76d246a7525df
	.xword	0xbc8d87680631637a
	.xword	0xc24dee0d4f25311d
	.xword	0x82de8ffc3a1b02ca
	.xword	0x35b2e922a5685e2d
	.xword	0xb0c01b09766a2961
	.xword	0x936e324b9f434da4
	.xword	0x78cc69addac70e40
	.xword	0x51b3b982ce88cee3
	.xword	0x78e63bc6fed6c738
	.xword	0x2d68939577036ffd
	.xword	0x241809bd7fa512cf
	.xword	0x4609a6d0a904e334
	.xword	0xee9640c162db46f9
	.xword	0xb1e5557a3a6ac577
	.xword	0x1b5569cb47c98d20
	.xword	0x68df8fe2382cf24e
	.xword	0x67ac21fcda20875f
	.xword	0xf5d84c90c6560174
	.xword	0x51eaa8b8305cae0b
	.xword	0x8f385da7060814a4
	.xword	0xba43c45a3f16891b
	.xword	0x88609319fb3f1901
	.xword	0x98b33ab1159b5ad8
	.xword	0x02474682f47305e2
	.xword	0x062e13fa1b8ad017
	.xword	0xdabebe3f10b49d59
	.xword	0x23eb33308a11766b
	.xword	0x2a03c22d8d991f8a
	.xword	0x90485c4d3a749fc4
	.xword	0x439df4afc7bc78ff
	.xword	0xa8dcb62e894f346b
	.xword	0x7818270449e2601b
	.xword	0xac7ba9daf5f04e46
	.xword	0x942648a716249832
	.xword	0x800b1792c37dbec5
	.xword	0x7e30cff1d04fd320



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
	.xword	0x1fee831a0311222f
	.xword	0x35468d2575917fd0
	.xword	0xe1d4c50fe795ff16
	.xword	0x76092e4f4d7ea1ea
	.xword	0x9938a33075bfde69
	.xword	0x23985b9fd2db296c
	.xword	0x1c756a50bbfadd5d
	.xword	0xa5f87e841a512e0a
	.xword	0x95332763e39e11f8
	.xword	0x04f798c0bfee279b
	.xword	0x18863452adf40be1
	.xword	0xdfc2aa1d042f97d3
	.xword	0x1e7b339b64726701
	.xword	0x5af7d0e579ed659f
	.xword	0x1bf0f58e0efd0d67
	.xword	0x089d894aafbe3b2f
	.xword	0x3fa97003c6056424
	.xword	0x60a2b8f086f25ffd
	.xword	0xfc0d6f4a6a705175
	.xword	0x9a2a08950196602b
	.xword	0xf3b1b3807646a5e6
	.xword	0x97512b38efcb6d3c
	.xword	0x452a6b0b58722161
	.xword	0xc729c2b04dca9870
	.xword	0x8227cc15cd3f9ddc
	.xword	0x60d0680f854fb062
	.xword	0x44953ca03f77512c
	.xword	0x717932167bc49bb6
	.xword	0xeb1a18960d2b3a6d
	.xword	0xd877ff06aac39e56
	.xword	0xa55ebbf50e6ca04d
	.xword	0xe9cd11954ed94a3a
	.xword	0xd3e33ab333c04054
	.xword	0xc86020355336b60a
	.xword	0xb093f1e9b1e9fb5f
	.xword	0x1375b9615b452449
	.xword	0xc1aa760526b5a81d
	.xword	0x167a1caaaf74ba30
	.xword	0x16f40ee617bb0d9e
	.xword	0xa1cade33c749f385
	.xword	0x6e27cc0f19d032dc
	.xword	0x810e203324ccab0c
	.xword	0x90f9702b0cc8dee9
	.xword	0xb445aab7319f1641
	.xword	0xc822d50ce534a60c
	.xword	0x872bff472424aab1
	.xword	0x7b8226ec7ce23119
	.xword	0x2ac5732aff8915f0
	.xword	0xd97effee8afe2004
	.xword	0xbfdee7099f7e10c2
	.xword	0xff6748f443b50c07
	.xword	0x25761218140fbc9e
	.xword	0x5f3929d1115a2d63
	.xword	0xcf87aa204745bfb3
	.xword	0x41bb6f7d85422001
	.xword	0xc9e0f3bc2e82a5a4
	.xword	0xb6a43d2c09b48130
	.xword	0xa5c262ed528dc246
	.xword	0xc2424b40d4e8abfc
	.xword	0x00955d5f2e296b4a
	.xword	0x03a76f67fd498011
	.xword	0x5346e19fade4a192
	.xword	0xcbe316a6a3ec539f
	.xword	0xe9be1156a68a73df
	.xword	0xe2c6d1b1dbda3484
	.xword	0xf44df3861664e0e3
	.xword	0xf084aa15886e3431
	.xword	0xcb82c9bf3ec310bf
	.xword	0x6d38ff85d1c910dc
	.xword	0x90ad897fb3aeaa91
	.xword	0x106443f10bb329ad
	.xword	0xe53a1190ab793b18
	.xword	0x731b66233fb68e58
	.xword	0x275524d09c10722c
	.xword	0xf304042b0583bdac
	.xword	0x8c1d712023e10d59
	.xword	0xf65eef4034fa27d3
	.xword	0x6087a9f528bd0ec0
	.xword	0x6527f10c81945810
	.xword	0x3ce63a24a892615d
	.xword	0x08bdf7a70eabbd04
	.xword	0xe084b0c4f10e5a75
	.xword	0x2a4846217b77e3df
	.xword	0x0a0e33a7a48de2c1
	.xword	0x97223e26e39a70a7
	.xword	0x91d87594bc7730d2
	.xword	0x55c059c4d9f3e9c9
	.xword	0x83267d3a7ce5da66
	.xword	0xe7ef481923255531
	.xword	0xa1a2d4e94859c4ad
	.xword	0x4216f70d61ead5a4
	.xword	0xe8853a7509f455ba
	.xword	0x86712cc393463a94
	.xword	0x052a929f33043b0c
	.xword	0x6ea99f65ad6ed5d0
	.xword	0xb1a04897aaba5227
	.xword	0xb6181c21f4204d37
	.xword	0xc2630ef1312f72a9
	.xword	0x0b81deba2bd292c3
	.xword	0xcc7dc24108f90dd4
	.xword	0x8ac27a4c3267737c
	.xword	0x1c66cbe03885f498
	.xword	0x653a3702abc733c9
	.xword	0x34ea51fd46909b62
	.xword	0xc99b275f3d786f80
	.xword	0x159a810db8aca6b1
	.xword	0x996810f900a12202
	.xword	0xbccfef90caf2047b
	.xword	0xe57f9617db5a8d3d
	.xword	0x9b298020ef3b6517
	.xword	0x3e75312d9abca973
	.xword	0xc3d1383f58236e73
	.xword	0x3b48527f9ad8ddf4
	.xword	0xa67d5bfa7224b67e
	.xword	0x9c0b3b88102a9935
	.xword	0xd0148acfab3c51b0
	.xword	0x7c17d8be17e81aa4
	.xword	0x9f165183847d50e3
	.xword	0x756bfdbaf062b80d
	.xword	0x30b2b9921f5fef41
	.xword	0xf0ea0adcc70ae5f3
	.xword	0x2a8c838378533460
	.xword	0x3be2b52b7600f10e
	.xword	0x770b422bd33ef31c
	.xword	0x981ffa4f8bcf49fb
	.xword	0x63eb89bca2437541
	.xword	0x2b88a9b9eeafadbb
	.xword	0x70af3691b2d89a09
	.xword	0x89d0fdc0f055cfe4
	.xword	0xc648260c6241a43e
	.xword	0x2fab495df55ea896
	.xword	0xf0b93bee14ea6a68
	.xword	0x9eca02e23d223868
	.xword	0x8b42ea3d9330bc0c
	.xword	0x3e753f91599263ed
	.xword	0x5783a3c3ada9af1a
	.xword	0xf24f9840d2e2920b
	.xword	0xaa9b385bb4d424ca
	.xword	0x20cac1df523c6739
	.xword	0x8ca2a501c2a6c89d
	.xword	0x38eeb8b3371af479
	.xword	0x773e202b20a344ce
	.xword	0x0bb5f6191356b2d9
	.xword	0x224322860d6d82fa
	.xword	0xf324bc9d4963c3fc
	.xword	0xe810eebf40447e53
	.xword	0x607104d4214d9c31
	.xword	0x88d6b9ed06ccdf9b
	.xword	0x32205239ced45995
	.xword	0xb919ce26f8293a78
	.xword	0x967cd3789958ad3c
	.xword	0x50c5736583390c99
	.xword	0xf4853c57af7f665a
	.xword	0x05a7305a6c8adf82
	.xword	0x37500e7efe49af8c
	.xword	0x14b131c78a0dd107
	.xword	0xe18b9598a5dd2685
	.xword	0x064d7ba74962121c
	.xword	0xcb8e4cf499f31906
	.xword	0x72e121a68c1ebd27
	.xword	0xf35af054f51ef45c
	.xword	0x145181bf3b065615
	.xword	0x8d5d1c4fd0d81708
	.xword	0x5432a36f002e3e51
	.xword	0xc5f424d223d707a2
	.xword	0x3f43d0df013487c8
	.xword	0xf9d81309ad67d8f4
	.xword	0xb6ccc0c24e2fe014
	.xword	0x3f6ab54a5f68c4d1
	.xword	0x5976014d43e49cf5
	.xword	0x86b63d09c2da9318
	.xword	0xb9acdeab580feda7
	.xword	0xd9f679f1990c53be
	.xword	0xdaa2e1def3d00e19
	.xword	0x896e601042eafcc2
	.xword	0x1b4253a1ef16ceff
	.xword	0x0f28553a7e6d0ada
	.xword	0x40b34e240d8bf44d
	.xword	0x8fe12f4610fe0e31
	.xword	0x0a1076142d605bf3
	.xword	0x76616c200b2ce68b
	.xword	0xd9a839d046d8665c
	.xword	0x953faade8c330be9
	.xword	0xee07197e6db8fc90
	.xword	0xc18518db31ceb856
	.xword	0xa92a99d809768318
	.xword	0xc4630462911b9f99
	.xword	0x462cd058c7008fba
	.xword	0x812faffedec687e9
	.xword	0x45d1e592a1163761
	.xword	0x155e08a7e32c595d
	.xword	0x73c6105bef0f5939
	.xword	0x462b3ecb3d41d49a
	.xword	0xcdcd95241391000e
	.xword	0xc06046f0e5694eca
	.xword	0x74a9caf8511f4ce6
	.xword	0x77529078754c5804
	.xword	0x402e486d1eafc378
	.xword	0x2384eb6d69e16564
	.xword	0xaf4f0c82a19f8c20
	.xword	0x72174fd92b2169b7
	.xword	0xe0dd4a03e958c270
	.xword	0xd224a8599ee1f108
	.xword	0xc58866c0729eacca
	.xword	0x34b1064d24bbd1da
	.xword	0x5ec32c0d86605485
	.xword	0x1e7411f332d8986d
	.xword	0xa2cca17a15c36bfe
	.xword	0x8f0f5c014c4abaf8
	.xword	0xe920a02dd7eec428
	.xword	0xeb93791be5c3498e
	.xword	0x8106b86d84aca2ae
	.xword	0x43bd4a3923839468
	.xword	0xe27973fcb5019c2d
	.xword	0xfd8639fb9a26a189
	.xword	0x2565eb9a09bdb3ca
	.xword	0xed46cbfe833e2ee7
	.xword	0x897c5b0bdd43aaf9
	.xword	0xb4e5b6d718b338ad
	.xword	0x578757c149741776
	.xword	0x4a9e26adc7161a27
	.xword	0x22c0df9e4da3b512
	.xword	0xebb161f09080c5e8
	.xword	0x54c17794a3148c73
	.xword	0xe0faf4cc74db2add
	.xword	0x0a9bab6c01e20364
	.xword	0x552e437a09e5c505
	.xword	0xa2214c74e55e3b68
	.xword	0x250c0d4d1d1b1786
	.xword	0xef5beecbbffdaa35
	.xword	0x424dabec27581506
	.xword	0x3112d40e281922e2
	.xword	0x7b3ecbaccf74eff7
	.xword	0x0a247dc0ca87a186
	.xword	0x38d36f1c346a0e08
	.xword	0x04054ca187b7956a
	.xword	0x12bed44d166933ba
	.xword	0x3f7f67f3be544820
	.xword	0x1d62661f4b76e592
	.xword	0x3d6edc5ebd08181e
	.xword	0xae3bd18212ed6643
	.xword	0x0879b4799ec492c4
	.xword	0x3776a4767f778a15
	.xword	0x71ed5d318eac7eec
	.xword	0x384c3e6e0e93225d
	.xword	0xf390eb7766ece441
	.xword	0x9f421767a06362e3
	.xword	0x8866addb1a5e6443
	.xword	0x89ff5071e7937d5d
	.xword	0x8b1fff6bf90b5b3f
	.xword	0xadd179770fca1770
	.xword	0x95dece14ed8dbd54
	.xword	0x5e7eddd0e96eaedd
	.xword	0x1a74554cfd31de9b
	.xword	0x770d587070c2c8e0
	.xword	0x4b1a4bcf00f98dd4



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
	.xword	0x8b26536df8d083dc
	.xword	0x92dde3b0fbeb7bde
	.xword	0x00c3c401b680bf1d
	.xword	0x10e0b80249fdcca2
	.xword	0x20268e4ad186e10d
	.xword	0x2de7072b6250e104
	.xword	0xf30e057e17f0285d
	.xword	0xe8e510617853101c
	.xword	0x1d3e19a03bdc1caa
	.xword	0xff949e9f19f1e918
	.xword	0x82e50c624ceca6e2
	.xword	0xba94444fe20d7eed
	.xword	0x278d5ec3dbbee874
	.xword	0xfbc7144afb736716
	.xword	0x1add5eaee9908b9b
	.xword	0xddf5603df0dc77a2
	.xword	0xeef3dcdfb3fe2661
	.xword	0xe270df047f043488
	.xword	0x3c5414a450a04fcf
	.xword	0xaa7f92bed90a738b
	.xword	0x5f8e322bc2ac90f0
	.xword	0xfe2e2808d4940994
	.xword	0xdd2d8a8de441a6e3
	.xword	0x71ae30f12e4992fd
	.xword	0x1a2a863659d7c069
	.xword	0x477350bd4654075e
	.xword	0x07982e591e2209bf
	.xword	0x4aeeb9e844aee8bb
	.xword	0x1ff91c372328b1ff
	.xword	0x58fee3e82ddb403b
	.xword	0x1cdb3de687a17cb4
	.xword	0xbda3dd0cf033057e
	.xword	0x8d35aedf3c0607f0
	.xword	0x03371f56e1dd88de
	.xword	0xef70afe4d2659f14
	.xword	0x6f98e42114d384bf
	.xword	0x2444dc2a4904d7bd
	.xword	0xc81f8af907446427
	.xword	0xa4cb6d8084cbe2d7
	.xword	0x1bc97e84a3ada5e0
	.xword	0xe1f39b1b0a75bd9a
	.xword	0x537ee0141ef477c2
	.xword	0x4170fe909eb05c4d
	.xword	0x1ae80bb440046895
	.xword	0xdec27de3825d8f63
	.xword	0x5bd33ebd65f35a14
	.xword	0x03afe037fb22802b
	.xword	0x6bdfea498f356687
	.xword	0xba0b697dbd57dc8f
	.xword	0x6dfd23dca1b27517
	.xword	0xe99f675a44c22c0e
	.xword	0xfb0c0bc0574d227a
	.xword	0x9a5b90295467566e
	.xword	0x3d39a26c2ae68fc7
	.xword	0x4bc2849d993c6d4e
	.xword	0x4840f5aa317bbedb
	.xword	0x21d6f06a0a50376c
	.xword	0x3ec18f1838712b30
	.xword	0x39777fe84adc39e9
	.xword	0x55363e6945fa01af
	.xword	0x71bf4abe87650a59
	.xword	0x94e3e761a98f024a
	.xword	0x1d91b217fd9f793c
	.xword	0x29f7ce2624c28e54
	.xword	0xfd25a3c6e859475c
	.xword	0x40aadf7d79348e04
	.xword	0x02a14d80b98b9361
	.xword	0xe48c4ce049252b6b
	.xword	0x24965e5ec252f8d3
	.xword	0xe6b4f4f44ee0701b
	.xword	0xda559d1b11bdb349
	.xword	0xc7140d844d4c84b9
	.xword	0xe02eba88b7e44fbd
	.xword	0x53ce0d6e02be6d0d
	.xword	0x4694836bcc82f428
	.xword	0x18bef709e1076461
	.xword	0x1dd8e68b43f00054
	.xword	0x06b39cbc6dd8a22c
	.xword	0x1454b2f491def3bb
	.xword	0x8b0c58d2c7055e22
	.xword	0x91a6cc01497a8808
	.xword	0x21ccb8b50ef785bc
	.xword	0x676f6b1a5e0bc538
	.xword	0xe0d2480a6de82860
	.xword	0x359b75ab373c5f03
	.xword	0xc7a1d11ddad8eb89
	.xword	0x0a37df868b589838
	.xword	0x853557d0a3bbac67
	.xword	0xbc69449dee8a4ebc
	.xword	0xa9c93c095b7d86bb
	.xword	0x5f9b4b7e58dcb0d2
	.xword	0x2f04eaeaec2e5574
	.xword	0x512d121389a483ba
	.xword	0xb794d4d2f1ad8351
	.xword	0x9408ccf1bbb262e9
	.xword	0x1294c88a9b6ad8c4
	.xword	0x8750db342fa77f8f
	.xword	0x301a78e3aacf2a54
	.xword	0xd5d3e77e37c097e6
	.xword	0x5877c49792db3678
	.xword	0x143db9385fbcf49a
	.xword	0x8c463c23cc639c02
	.xword	0xf373398d2734417c
	.xword	0x2f69ba58b4b5eb61
	.xword	0xbc17da529cc32967
	.xword	0x46d0d0c5ce2ef690
	.xword	0x37665481b433b780
	.xword	0x52524239b4ca7589
	.xword	0x1c51bb12a065e201
	.xword	0x25034f98de4f961d
	.xword	0x3609c1365540e0c8
	.xword	0x0f24015d1e1aeb77
	.xword	0x6389c200e0399c8d
	.xword	0x1d1980f7e64bba0c
	.xword	0x51b30b7c0268de33
	.xword	0x42d1083f3686d876
	.xword	0x58989c7d93ff0aae
	.xword	0xb32fd841a2a72807
	.xword	0x1e6f1bdf6497c9a5
	.xword	0xe42e3db144046626
	.xword	0x02b66fee711e72d5
	.xword	0x133641267b0ee475
	.xword	0x802fd292b26b383c
	.xword	0x3bc936ce2f1237ed
	.xword	0x8d04179d084c2363
	.xword	0x7599ad56895579f7
	.xword	0x1828b21ae8d60466
	.xword	0x3cd5d4f7d7004e9e
	.xword	0x67fee2ec7eefbb13
	.xword	0x0d48b4e4ee690abf
	.xword	0x148e8b6d5c1310e3
	.xword	0x9ae22254c80752a5
	.xword	0x787c7d1d3e44da67
	.xword	0xcc916e45ec297fcb
	.xword	0x6c3732b114cd44a2
	.xword	0xaa0f494afd1fdd44
	.xword	0xc853e91f48eab2be
	.xword	0x2520d4e243454578
	.xword	0x4f56902463b794bc
	.xword	0xcdbf48efe47dbff6
	.xword	0xf1410749f10888a1
	.xword	0xe0b18f6af6a338b8
	.xword	0xb0efcb18df3eb7a6
	.xword	0xfe6ca6f49abe901d
	.xword	0x58b30910500e95eb
	.xword	0x1165907ba56b7614
	.xword	0x31f3dbdfd85ee671
	.xword	0x1284874f595c3128
	.xword	0xdafdfb64baed3e78
	.xword	0xbdaa11953a5aa5ea
	.xword	0x4ad388522391f279
	.xword	0x49c2c3594b428247
	.xword	0x9b3fa91ed3c46fcb
	.xword	0xf672bb7c762e985c
	.xword	0x3bae691d8f1d96b4
	.xword	0x6cc2cec508e59fa3
	.xword	0xb9c2b7b199cd7905
	.xword	0x9411048de65cc864
	.xword	0xd55e849ad33a7371
	.xword	0xfe72dc1f111e17cb
	.xword	0xec3e7eea8d055b9d
	.xword	0x6a9edcea0fe30367
	.xword	0xba7e9dd5eeb1f64e
	.xword	0x66f465610c78979b
	.xword	0x624d4d6f2eba6e1a
	.xword	0xe77c5ec50992011b
	.xword	0xc1f8d4f88e72eb4e
	.xword	0x6fecabe3db6f45a0
	.xword	0xfa605b9190c7f25b
	.xword	0xe094e4d85ba67aac
	.xword	0xb71f20d2a3c6ea5d
	.xword	0x27f1ef6111f5b65e
	.xword	0xc425121094943b3e
	.xword	0x246eeb0987d946f6
	.xword	0x3029a0c987ca5795
	.xword	0xd60b35ae91aa3e5e
	.xword	0x794d8c1cc1ef1ba9
	.xword	0x304c8a75139cd99e
	.xword	0x60c2badd37a67b7c
	.xword	0x295a082a03c638ad
	.xword	0xafb83a2e5e85110d
	.xword	0x503cd99c9b7f261d
	.xword	0x9dde28679099addd
	.xword	0x00f184c29b2a1db7
	.xword	0x1311cdc726e1d09f
	.xword	0x38b406785a57d2ca
	.xword	0xbd50c7fa563bffc6
	.xword	0x936ed4ccebb7b847
	.xword	0x560142ff6ec2a412
	.xword	0xde0cc72563ba3e5b
	.xword	0x38c9ab099fc472cc
	.xword	0x93befb4dc44689c0
	.xword	0x2b79375f244c4321
	.xword	0x6c973bddc3751cb6
	.xword	0x295b213288d471a4
	.xword	0x0aa1f4f21941f39a
	.xword	0x9709998efa53a480
	.xword	0x5c6b36b3dc3d205b
	.xword	0x83f70d56b6848eb5
	.xword	0x57b0bdf600f0eeb0
	.xword	0x7dcc53bd1ddd4672
	.xword	0x6d7609c0d4b41841
	.xword	0x2e3af7affe9fcf25
	.xword	0x8a17647cb022e863
	.xword	0xab9fd61296ae0321
	.xword	0xcbf3605775372bae
	.xword	0x8d9233fca2951cc7
	.xword	0x943ff5019a39b98d
	.xword	0xcbfb3d937a2baad5
	.xword	0x023b711082449753
	.xword	0xba367b29ca7b1d6b
	.xword	0x676ad67be04325b0
	.xword	0xe240fb1c82d994b4
	.xword	0xbe226faf9d88bf5a
	.xword	0xebe2cba50c874d41
	.xword	0x8ab72159b6025036
	.xword	0x777728a2015b55a0
	.xword	0x9767dc246504f3f2
	.xword	0xecb9276ab8640455
	.xword	0xf35c1c6a7f88b389
	.xword	0x3b7e946c91dc9dfb
	.xword	0xda53a65870bf7441
	.xword	0x682b36c1e93f0a64
	.xword	0xcfe3ce2681409a35
	.xword	0xb18ce7aa61e37e05
	.xword	0xf80a48c992dd1e45
	.xword	0x02de6b9d0ebcbeba
	.xword	0xe7e8ad5b4b8520ba
	.xword	0x3e935744202216ea
	.xword	0xad300b04248f85d9
	.xword	0xe6aa01418559f365
	.xword	0xc6d5ffced0b43c1a
	.xword	0xfdbbf648e4cc0c7a
	.xword	0x6745488fa70fb139
	.xword	0x61791ac7f0e1f8be
	.xword	0x4838b6a2cf8315bd
	.xword	0x05e5d4436db3718e
	.xword	0x8cb69fbf96351504
	.xword	0xaf5f81a0daef33f7
	.xword	0x4268a0af04c84795
	.xword	0xb38b19265f30024a
	.xword	0xecf01deb1dbc0d8d
	.xword	0x70ca818cdfb23ca8
	.xword	0x85647fe4e3deceff
	.xword	0xe83c761fa47de981
	.xword	0x75e5da63cb32707d
	.xword	0xe1d3826ab804c89e
	.xword	0xc040dc4ed94ba82d
	.xword	0xd1989392a4cd748f
	.xword	0x9c24341f1337da83
	.xword	0x3c15494717782267
	.xword	0x0a196990e96b0475
	.xword	0xa4076efc99078acd
	.xword	0x8dfd4860767f0616
	.xword	0xbf7d00b190c763e8
	.xword	0xc80b1b66e2ef2774



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
	.xword	0x0dea4aff57fd3c88
	.xword	0x9c9bb117195974e6
	.xword	0x5ceaaddc0b591ab1
	.xword	0xc71ea84109a67862
	.xword	0x7ea7d10ecb474f2a
	.xword	0xb91dc7f3b4e608e3
	.xword	0x0fcd00934bfb5395
	.xword	0x4b6a3cd41785ef89
	.xword	0xbcf28b90b1251fce
	.xword	0xf9381dadee4086d5
	.xword	0xa0baf576afadc85d
	.xword	0x2dc14b3f2fe1c634
	.xword	0xfc815ec496df7608
	.xword	0x3300a95075a0cace
	.xword	0x1132cebd29c58b66
	.xword	0x103ec0eb1d324df3
	.xword	0xe091639da2edf9cd
	.xword	0x404d252ab65414d2
	.xword	0x0004cf3dd4057b46
	.xword	0x4a670796f1d066fd
	.xword	0xe0c7c10f78e199c7
	.xword	0xeddc3831fd92e9eb
	.xword	0x663d950404123e9c
	.xword	0x7ee08e3b3718bdab
	.xword	0xdec4dc8d8e6eac34
	.xword	0x792be6d1f807b4e9
	.xword	0x4022db5ab77aff09
	.xword	0xf38a156e1f8e8884
	.xword	0xd6a46b765aab083e
	.xword	0xd633773a70c4a322
	.xword	0xc90d1f4f03730d06
	.xword	0x5b28fdd3c3c8682f
	.xword	0x7febec752e9ad58a
	.xword	0xb06ed57cbbdbfd94
	.xword	0xf2e10f9f0ff52e2a
	.xword	0xa42d8cde01f5dd12
	.xword	0x6ec64466abb8a126
	.xword	0xa45bb0d0bdac206c
	.xword	0xc3facaec567a95dc
	.xword	0xbe0c4648c471c2ae
	.xword	0xd328e448f082f925
	.xword	0xa18445910d446c8f
	.xword	0x501ec741706ed2da
	.xword	0x05c86ef79749c9ba
	.xword	0x5c5792443713dc4c
	.xword	0x36b4a82d9d4f911f
	.xword	0x73a07e1b8c246001
	.xword	0xee7de09d6e509e64
	.xword	0x2f2ee853fd8da0e8
	.xword	0x9128dcc190ef14b0
	.xword	0x4e5559f34f62cc3e
	.xword	0xd3bd8c4091a68139
	.xword	0xbdd766eb672d8c24
	.xword	0x3a5d8477c3cb7b02
	.xword	0xb832e7071073f562
	.xword	0xcd5ee673e81fc9b8
	.xword	0x6160a16d9c41321c
	.xword	0x51b4cbb5255d4ede
	.xword	0xc390e1026ffae2de
	.xword	0x7fc9d80563a95e4d
	.xword	0xc0ecd83ee42132da
	.xword	0x5b4604837bd23e91
	.xword	0x5b0b6c168e342b06
	.xword	0x439059e0206185dc
	.xword	0xa52253db656da071
	.xword	0x8fe2ed02812ea5e0
	.xword	0xadad942b76802285
	.xword	0xee3eedc2ac81d2fa
	.xword	0xcc428f5ed33073db
	.xword	0x57dc199d8676a59c
	.xword	0xd471135549874390
	.xword	0xfe7727d2d81ad383
	.xword	0xdceb8b4ce9c7ad1f
	.xword	0xbf763e301d6fbaca
	.xword	0x39d688edd3ed9add
	.xword	0x7117f829f84baa40
	.xword	0x93da9111d64a653a
	.xword	0x22067bb303af06ba
	.xword	0xc2d7c2c7cd32b09c
	.xword	0x3fa4719fdc8b873f
	.xword	0x2bb523d20a3b8051
	.xword	0x5d7cfcb9486711f7
	.xword	0xa831557c21bff949
	.xword	0x1062673be3c7dcf5
	.xword	0xb9ac8997dffe5c66
	.xword	0x807b0183b30b5102
	.xword	0x8bad4e40aa61888a
	.xword	0xcc2f5292e0f418cf
	.xword	0xc15edaebcea44633
	.xword	0xa1275fb726bf706f
	.xword	0x4c8a39dd1e405655
	.xword	0x450bcf0e3b538b7b
	.xword	0x6af22664923bb64d
	.xword	0xb5abea692cb2da46
	.xword	0x03cfc0cf5444b181
	.xword	0x86e2428836cb91b2
	.xword	0x1110751104c28002
	.xword	0x7a1cd5d29db901f4
	.xword	0xaa85fe2bd18b4aac
	.xword	0x371cb8c926b2f5d6
	.xword	0xed05776ab3b20960
	.xword	0x4d02d797000c58a5
	.xword	0xc18c63cb568df26d
	.xword	0x90ae20c297f5eb39
	.xword	0x3852cd45e53ef178
	.xword	0x04f37b6084bcbdab
	.xword	0x6a2d367b23064522
	.xword	0x53f38b375104b5b4
	.xword	0x36ed114b533dd413
	.xword	0x39db084e8ce80139
	.xword	0x6e14c18cc336c4b9
	.xword	0xf29b72f6f89c49f4
	.xword	0x3bb648eb86ee7483
	.xword	0xa4f82d76d8a05efe
	.xword	0xbb48514a0423576f
	.xword	0xdda4df50e8d2d14c
	.xword	0x0377da7c23bda015
	.xword	0x8de5614ed64ebaa1
	.xword	0xfe2060d848606dc9
	.xword	0x73d9de9b728cea73
	.xword	0x7b9ecd312b7f5c65
	.xword	0x2682bec02060c149
	.xword	0xd75eb3dd877ea362
	.xword	0x7e11e1eef7c6dfac
	.xword	0x3dbc019f76c04398
	.xword	0x9a8182196b2b9347
	.xword	0x3abe569af9cdf564
	.xword	0xad71c2d3fbe89a1b
	.xword	0xd4b0b6a9bf254dcb
	.xword	0x13916ad2329e1bcc
	.xword	0x5bdfbba363211c10
	.xword	0xb76459eaaea9fb41
	.xword	0x9676a588401e0e0a
	.xword	0x722c0e82832759bb
	.xword	0xf7c420fb4f58598b
	.xword	0xa2eb149e88277fe9
	.xword	0x10a34b5745b00766
	.xword	0x572e7fd7d19b4fe7
	.xword	0xe89e693475e15f21
	.xword	0xaac0042bf94b5781
	.xword	0xdd6191b411dac45d
	.xword	0xedb5524f79bb827c
	.xword	0x7bd0e37219af4b0b
	.xword	0x14885f517a04fdab
	.xword	0xeccb6d92a72072d5
	.xword	0xcdabc0429c07bf08
	.xword	0x43314d67609c992d
	.xword	0xae723c82ae5f8c10
	.xword	0xbf6c940708c8f030
	.xword	0x53ebbd1d17e8f221
	.xword	0xbc419ecab61f6e0e
	.xword	0xc95888d910d98958
	.xword	0xa417b1b12a197cb0
	.xword	0x39717f2709f9d6ef
	.xword	0x17c8506276eb7cd8
	.xword	0x3d385f311bfe317d
	.xword	0x26f47bda0ff0f47a
	.xword	0x19750e5eac8b8c86
	.xword	0xd505a85dd9a329d8
	.xword	0xebe0996fc1823044
	.xword	0xb2b516c835103eed
	.xword	0x802304ede942437d
	.xword	0x2da99ed6afb4e4c3
	.xword	0xf6cd84e8e4f58be3
	.xword	0xa51723587f25927c
	.xword	0xef2143202ddc04ef
	.xword	0x40979cd7527f1bdb
	.xword	0xf592d42c7fd87ec6
	.xword	0x566155e09c647448
	.xword	0xd87aee921cd5f7ef
	.xword	0x2896208be8f8f3fc
	.xword	0x95d146aa4333f419
	.xword	0x9dde303f43fa353a
	.xword	0x84c5ec6749d0c463
	.xword	0x80627f2cc4f50aae
	.xword	0x67fb52050440dc0b
	.xword	0x20a891b5e5be54db
	.xword	0xad409c259be6fd07
	.xword	0x68a8d42989d43c10
	.xword	0x1772894a483a52c2
	.xword	0xac0e2325b687157d
	.xword	0x1c7063e79ec72e01
	.xword	0x7803fc8575c69a8a
	.xword	0x45246f19132cc685
	.xword	0x0fb7c8e20b65a262
	.xword	0x5158e55f1e346677
	.xword	0x32ce05f79e358268
	.xword	0x7fb4aa2686225210
	.xword	0x29bdbebc1eb82c14
	.xword	0xc13d349fadd8fef6
	.xword	0x41eb38337934ba68
	.xword	0x01ca0b972b5b24d7
	.xword	0x85e59a60e77e90d7
	.xword	0x6f77dd6e29105150
	.xword	0xab6550eb9ac1eb07
	.xword	0xf997b49ead065fc8
	.xword	0xd7823ddbe9b1ac58
	.xword	0x14218b6e5a61f5d7
	.xword	0x5df07d25eaadae39
	.xword	0x257275c1a67ca3ca
	.xword	0x1cdfbc41108f2dcf
	.xword	0x2b40ea7e87e65bc2
	.xword	0x61d2af0b5de440fb
	.xword	0x0e1dd71cece41e93
	.xword	0xb1b8e6001b15e609
	.xword	0xfc6528961e1ad82b
	.xword	0xe23785532b46df65
	.xword	0x0a39e46cb3f1fb7d
	.xword	0x8e846087daacfb44
	.xword	0x8a2560031c77ae3e
	.xword	0xec7b2d37fe2c14fb
	.xword	0xa24c0845ec2e711b
	.xword	0x80477315680a3ac2
	.xword	0xbfe94de85a538267
	.xword	0x15e93db534547c04
	.xword	0x4fbf2f4092e55f4f
	.xword	0xd96c46706de29ebf
	.xword	0x660d277445238c6c
	.xword	0x885e12e524d184db
	.xword	0x03b9fb21a51d397a
	.xword	0xd81017340d7d4d5b
	.xword	0x034773c94eeca95e
	.xword	0x8da74348ca1cfe91
	.xword	0x8cbfe0f442960365
	.xword	0xc727ab217a558b4f
	.xword	0xb507042b988dd688
	.xword	0x6c486cf0041b7669
	.xword	0x9556532bc0865ad4
	.xword	0xd36a32c3a56bf105
	.xword	0xb77024d824d28f44
	.xword	0x31acb26b56557c76
	.xword	0x7e3a6a6b8f70397c
	.xword	0x208014f910b19684
	.xword	0xdaac34c796772e90
	.xword	0xc281d5a80b05ae70
	.xword	0x8329fb9f46183fe3
	.xword	0x4f8ea102a1327a3e
	.xword	0x96c25b12a8c30ff3
	.xword	0x24680a1ebb93fe0f
	.xword	0xe9ded19562b41d18
	.xword	0x9f7ad419ca64dae3
	.xword	0x72376fa51fb178cb
	.xword	0x8d41c956cf77ce50
	.xword	0x9477b4f9a703646f
	.xword	0x05571ba0e4ac8dc5
	.xword	0xfdc4b11963debe3b
	.xword	0x36f00a76c261efbe
	.xword	0x61fb7482a0e64c31
	.xword	0x5e8615de2266b550
	.xword	0x689dd38bc26565cf
	.xword	0xacdf87b9134b1097
	.xword	0x1f36347885d8c5a7
	.xword	0x9fe834aef4c980ba
	.xword	0x46fecb41e62aedcf
	.xword	0xe95ba2af774bdc0e
	.xword	0x826e84a42d550a9a



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
	.xword	0xa45625a100b6434f
	.xword	0x3ada6336f58812f1
	.xword	0xd0a61b4097a8a1c8
	.xword	0xf038b445e6603f15
	.xword	0x0b61ce3361d57eb7
	.xword	0x5edd4d7fcf6453e3
	.xword	0x93d3ee0d439a56d4
	.xword	0x0eeeb4f49af7b604
	.xword	0xfad55225e17acad8
	.xword	0xfe5514aca013012b
	.xword	0xa91c4984e80fc73c
	.xword	0x63440314f1d9f405
	.xword	0x9d7ef554b119dd04
	.xword	0xc682d767a391b607
	.xword	0xc72dfe2efae9241a
	.xword	0xfb7c9a7deefd29db
	.xword	0x875f1988f88bcab6
	.xword	0x3d6b46baa16bf2bf
	.xword	0x8e0b780a72f849da
	.xword	0xda5dbc080720b97c
	.xword	0x62950ebeb309c244
	.xword	0xf4e56ef3505d8224
	.xword	0x19ce47caf13f3ace
	.xword	0x66d4a58310ccb415
	.xword	0x7f40f663dd7a74b0
	.xword	0x86f7c27606f5c51a
	.xword	0x77f720c4a474aa5e
	.xword	0xde4ae85ff9cb4fd0
	.xword	0xb68868dc63314e44
	.xword	0x623e770d3f533b1c
	.xword	0x513a9a1c4a69ab8f
	.xword	0x23262f4768aa6c36
	.xword	0xc90aa97f38ca8aee
	.xword	0x93eb9cc426f015f5
	.xword	0x0c1cf7dc5af3e62d
	.xword	0xa59ddf5f0979667d
	.xword	0x76655a4fba6ddecd
	.xword	0x13a3a51bd4cbee21
	.xword	0x0c68661ada9730ee
	.xword	0xce3a29a76f290068
	.xword	0x3cf00e37d59e7807
	.xword	0x068b33c8fa1be1c6
	.xword	0x397beb34fde91697
	.xword	0xb7f51c67c6fc8bba
	.xword	0xb4683892e5976f30
	.xword	0x93530f0ceac4f4b2
	.xword	0x63a75907bc3556ae
	.xword	0xdb98cadd0281137f
	.xword	0xeb052292ae29dae8
	.xword	0x41001c8cc2a05211
	.xword	0x5c7bada5dfdea6a4
	.xword	0xc48cccd0149cea00
	.xword	0xc05dc0873c0d7ed2
	.xword	0xb388ada46e559b0d
	.xword	0xd002efddf8f2bd6c
	.xword	0x02a30196ec98392e
	.xword	0x9102f3e056a5a10d
	.xword	0x351594df915816bc
	.xword	0xb974558dc490cc92
	.xword	0xb7bac94e19501921
	.xword	0x6e0bb5790ea86c0a
	.xword	0x44b8ae89e3d1db77
	.xword	0x390c33bc8a096cb7
	.xword	0xb9d781de2c62645e
	.xword	0x84928b9dccff2781
	.xword	0x7de56b81712abce5
	.xword	0x1d550bb4e5943303
	.xword	0x53efda0e77f3c4e0
	.xword	0x77c757b6fc5ea70c
	.xword	0x24fe54cdd63c0b59
	.xword	0x98ffec56e856e3d1
	.xword	0x296b0c577e3a07cb
	.xword	0xa8382de45da49cd7
	.xword	0x91bb496c6da7d6d0
	.xword	0x07acb4a4ebe896f6
	.xword	0xd75ca2ef7f603f77
	.xword	0xc7e8a35ae470a505
	.xword	0x128f51c81ac9dc8c
	.xword	0xc57593b4d8b1fe82
	.xword	0xbcc84f70e8f3b124
	.xword	0x9c5a8784df3a8af8
	.xword	0x0006d3f8cf54db10
	.xword	0x30cc98d71a4c509a
	.xword	0x9176902759a989ed
	.xword	0x6e9b3e5eb1485da1
	.xword	0x9eba63b586b826c5
	.xword	0xecb856a679a9d6a3
	.xword	0x01d3cf69aa89537d
	.xword	0x861c5859b2ffb492
	.xword	0xadfc139373f05fd4
	.xword	0xe0a26c183cd06157
	.xword	0xfb2749456056a500
	.xword	0x60ad9d6d24b1f0c4
	.xword	0x9d59d4e1364c26ef
	.xword	0xc9ba1ac68a95d5a2
	.xword	0x1179ba763707bfbd
	.xword	0xd56f253d4b2f0caf
	.xword	0x0829701b7c5bef8e
	.xword	0x9231706ef510c716
	.xword	0x5730b8b6bc044ea6
	.xword	0xc009e5f5892a03da
	.xword	0x42a3c4ee4e3ef159
	.xword	0x60bcffa80ee04d7c
	.xword	0xac62908b6901fed4
	.xword	0x3c52299edfb3c79b
	.xword	0x7eebd74884b44cc3
	.xword	0x5e820b21be94f419
	.xword	0xa2143f16a92dd4f1
	.xword	0xa482e56b794f5eb3
	.xword	0xc55b454441d7d574
	.xword	0x9b1761dbd0203671
	.xword	0x4a9bbc05402538e9
	.xword	0x9d20485634c7cad3
	.xword	0xb02dd9d307ac5d4c
	.xword	0x37bc773f8a61a8c2
	.xword	0xba17612b6ca57cb6
	.xword	0x3d632aaa34a0d649
	.xword	0xd33ccd951538c908
	.xword	0x0bed38a2b6cdce3f
	.xword	0xf2110c9fa861ed94
	.xword	0x40ff894ad9b21af6
	.xword	0x6e1ecf6869b6f2a5
	.xword	0x510167a6c46a20ac
	.xword	0x3a561d9d107f1aab
	.xword	0x8babfc3dba974d69
	.xword	0x2f4853196e5e7d67
	.xword	0x30ab0b630ff72d33
	.xword	0x0f7f3d9d7b821397
	.xword	0xab3396539cd70dd3
	.xword	0xa6f485e18fc5df50
	.xword	0x3825e39cbeb3474a
	.xword	0xc09b2ebbb0d539c9
	.xword	0x777cf9f1e25b47e9
	.xword	0xc9b8b6ccf52c4e0a
	.xword	0xd087fb32425b18c0
	.xword	0xfa7100b2a3e42370
	.xword	0xbb9827021b469c7c
	.xword	0x3fbc394ae42596c8
	.xword	0xf071daf65c103f49
	.xword	0x0c6a788fae80ceeb
	.xword	0xae35ea53cbe8035e
	.xword	0x83506e10777c0d21
	.xword	0x1433a54f437248fe
	.xword	0x6598476f4161f76b
	.xword	0x3eb983716704cc46
	.xword	0xdf0a1de3c7c97e29
	.xword	0x5fc3ae6b471b0f99
	.xword	0x39ba9b035d1df1ae
	.xword	0x267cd390ae204a19
	.xword	0x1e962343d17692eb
	.xword	0x6287d78fc0ead11f
	.xword	0xdb2fd100ce3c83ae
	.xword	0xdfc2064150afe295
	.xword	0x2285f5686f020d1a
	.xword	0x1f38c01c6bc6958f
	.xword	0x3eb00453a64c3332
	.xword	0x19b29719e547b337
	.xword	0x6d43d7aafc1496f3
	.xword	0x61f7c59f33662ff8
	.xword	0x44e0c895f63f18a7
	.xword	0x0523e2e422e3137a
	.xword	0x183d90bd00f318ef
	.xword	0xd6870648ea3f9549
	.xword	0x00758461fcabfb2b
	.xword	0x01e23b4fcc484c97
	.xword	0x817528a70e366b81
	.xword	0xf5be38fed7f405ec
	.xword	0xac3091985ba2f70b
	.xword	0x2cff8eb75f8448a1
	.xword	0xaf5b3fe69ba17b5d
	.xword	0x63b64def56001e7b
	.xword	0x87f37662342425d8
	.xword	0xb301473eeb25adc3
	.xword	0x249794902ea77eae
	.xword	0xc9a2c347bb3fa2ab
	.xword	0xec03976fb5c7204a
	.xword	0x9928442ddb9bb761
	.xword	0x89985ae7f8b89d38
	.xword	0x5afab38a3c2995d3
	.xword	0x21ffe17db5037fe1
	.xword	0x1f56b06f7c40f07e
	.xword	0x7b71e8e7eeb1c21f
	.xword	0x769de769beef1c9e
	.xword	0x646cbc43fa5af34e
	.xword	0xfb85de2d256f345a
	.xword	0x283865165df290a5
	.xword	0x7749af4a49ac4d12
	.xword	0x26a0b781113771de
	.xword	0x8493504db3bfd80f
	.xword	0x519d933c2d5f2177
	.xword	0xaa155eafd3d8f31b
	.xword	0x297f2ad2e38e8027
	.xword	0x016c35702e7f3e35
	.xword	0x54dfd80854cc6d03
	.xword	0x89afbd73e8d416de
	.xword	0x8a70d5e4facbb97b
	.xword	0xbab20754a78e2e12
	.xword	0xb141f01e72e47008
	.xword	0x9581fc4e2e4669aa
	.xword	0x3d0eb1f3c50d832d
	.xword	0x41b0761b606fe909
	.xword	0x95c252a7c0e74791
	.xword	0xfb9b39578121c424
	.xword	0xc4ba65826dfe2d2c
	.xword	0xce60efbaaa4535bd
	.xword	0x5b1789abeadb02ab
	.xword	0x557bcde9805d9ef0
	.xword	0xdfc4cf4d987d0a8f
	.xword	0x7872a2a5d26c11f1
	.xword	0xe8bb50ecb2ff2546
	.xword	0x1afb4f547fd60c2c
	.xword	0x505eb46bbc6f1590
	.xword	0xac9bf3bb06051e37
	.xword	0xbb98484b5c2e1dd7
	.xword	0xa0ad651e7a8850ed
	.xword	0x2999ab6021545748
	.xword	0x7eb83bae1d237ad0
	.xword	0x3a838b177d40c463
	.xword	0xfadf37352942b7da
	.xword	0xca027d6144d9ed04
	.xword	0xe1d92bcc961c2191
	.xword	0xed45f35c8c7676fc
	.xword	0x4d63a050eb17e6b4
	.xword	0xb6bccb18ad852497
	.xword	0x1ba108745c9bbe9e
	.xword	0x327935aae5d10fdc
	.xword	0xcbb2c6ed82b44700
	.xword	0x003de8ecd31bf649
	.xword	0xc7d57b60b7f8720c
	.xword	0xdf72b90380ea57cd
	.xword	0xc2dc3bb62653dcc8
	.xword	0x44d062617c70ab64
	.xword	0x7dfd9782812fa4d8
	.xword	0xed42acdb416bb25c
	.xword	0x890d99dbde9c9504
	.xword	0x298fe54d622e400c
	.xword	0xb38f4215529a1062
	.xword	0x8696600ff733d3b4
	.xword	0x47251dd5a0284812
	.xword	0x1aca7fd08503bc22
	.xword	0x746e0af7786afa3d
	.xword	0xc6a05a13b3958793
	.xword	0xc116eec21eb3079f
	.xword	0xe78be8915a809ec1
	.xword	0x50db23e48c0fad78
	.xword	0xdfe989aa320661e9
	.xword	0x6dbd8adfe3854f06
	.xword	0x71a51f121a33eb8b
	.xword	0x84b3f8dc626e51a3
	.xword	0x3c97b9bcb6a3aa95
	.xword	0xde42634f99b7ba96
	.xword	0x51d671e6724efec8
	.xword	0x9dc4f015ea535b5a
	.xword	0x57dfa055a930c51e
	.xword	0xf086731d007c0e4e
	.xword	0x5afac30dcc999598



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
