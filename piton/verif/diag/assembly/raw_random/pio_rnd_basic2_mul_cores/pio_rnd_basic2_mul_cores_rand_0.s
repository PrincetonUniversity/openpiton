// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic2_mul_cores_rand_0.s
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
   random seed:	788703671
   Jal pio_rnd_basic2_mul_cores.j:	
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

!	ta	0x30
!
!
!	setx	user_data_start, %l0, %l1
!	setx	0xf0, %l0, %l2
!        mov     0,%l4
!        setx    ncdata_base0, %l0, %l2           ! nc data base
!        setx    0x1000, %l0, %l3                ! nc datawork area
!        add     %l2, %l3, %g3
!!loop0:	
!!	ldub	[%l1 + 0x7f], %l3
!!	subcc	%l3, %l2, %g0
!!	bnz	loop0
!!	nop
!!	prefetch [%l1 + 0x3f], #n_writes
!
!! initalize 
!add 0x0, %g0, %g4
!add 0x0, %g0, %g2
!add 0x00f, %g0, %g5
!!setx 0x800e000000, %g1, %g3
!stloop0:
!stx %g2, [%g3 + %g4]
!inc %g2
!add 0x8, %g4, %g4
!deccc %g5
!bne stloop0
!nop
!

! Register init code

	setx 0xc9911e4715eff7e0, %g1, %g0
	setx 0x7e3c96cf9930df37, %g1, %g1
	setx 0xe94191c4d858ac21, %g1, %g2
	setx 0xb3b8ef251f7fbb47, %g1, %g3
	setx 0xfe63e36abb69b625, %g1, %g4
	setx 0xb45742502be9a55b, %g1, %g5
	setx 0x8757f1454e601168, %g1, %g6
	setx 0xfd8e95b0e9fa9994, %g1, %g7
	setx 0xdf08296f3e3d361c, %g1, %r16
	setx 0x4326e14fa4ce85dd, %g1, %r17
	setx 0xd0d546a77228dfb5, %g1, %r18
	setx 0xcd2e06002cd100ea, %g1, %r19
	setx 0x7f2f0bd8767bf633, %g1, %r20
	setx 0x9fb6c552b0555589, %g1, %r21
	setx 0xb7e49d86eba740e3, %g1, %r22
	setx 0x77ffdbb67a0fcec0, %g1, %r23
	setx 0xcc7291241ccf4863, %g1, %r24
	setx 0x2a56d55b10eb305b, %g1, %r25
	setx 0xfab9595a4dab9ae4, %g1, %r26
	setx 0x3bebfab4172cec6a, %g1, %r27
	setx 0x070af220b086c93e, %g1, %r28
	setx 0x26c688c83a21725f, %g1, %r29
	setx 0x4ccd06c2ae195fd9, %g1, %r30
	setx 0x91c5aa7d6145a5c6, %g1, %r31
	save
	setx 0x985d0c21eb05e6bb, %g1, %r16
	setx 0x48ef3225e491e283, %g1, %r17
	setx 0x578762ca8f39d18e, %g1, %r18
	setx 0x23ff5f8947ad8e55, %g1, %r19
	setx 0x66bad1702d1f7a0e, %g1, %r20
	setx 0x874d8be47f94760b, %g1, %r21
	setx 0x49f2116bccf900fa, %g1, %r22
	setx 0x72e2d5c5d5c37c04, %g1, %r23
	setx 0x0989bba76cf7b3de, %g1, %r24
	setx 0xb7de80c1c641a021, %g1, %r25
	setx 0x92558599440dc836, %g1, %r26
	setx 0xed9bcdd75bd7c6f9, %g1, %r27
	setx 0x256f3b550d966952, %g1, %r28
	setx 0xda776acae11c1db0, %g1, %r29
	setx 0xdc5fc39203407f2b, %g1, %r30
	setx 0x5cda723e74f5e8aa, %g1, %r31
	save
	setx 0x37124491e89e0a37, %g1, %r16
	setx 0x4cbf1ff328a42f64, %g1, %r17
	setx 0x7ef0ac79e9e4b254, %g1, %r18
	setx 0x7f9f7a375b8e11f6, %g1, %r19
	setx 0x021729d35df90281, %g1, %r20
	setx 0xa7c3a530df0fe205, %g1, %r21
	setx 0x40df6cf2b9d59c98, %g1, %r22
	setx 0x92a7b777fee32b3d, %g1, %r23
	setx 0xfc7e1b706e5340ef, %g1, %r24
	setx 0x91d945ee2bb13c88, %g1, %r25
	setx 0xcfe83d8e455f053b, %g1, %r26
	setx 0x358cba6f55892997, %g1, %r27
	setx 0xd64794553ea59a69, %g1, %r28
	setx 0x1e266d0766253d1f, %g1, %r29
	setx 0xe01562f228bf58b4, %g1, %r30
	setx 0x3efb72348b3875d6, %g1, %r31
	restore
	mov	0, %r8
	ta	0x30
	mov	0,%g4 
	setx	ncdata_base0, %g1, %g2 
	setx	0x1000, %g1, %g3 
	add	%g2, %g3, %g3 
	!	nitalize 
	add 0x0, %g0, %g4 
	add 0x0, %g0, %g2 
	add 0x00f, %g0, %g5 
	stloop0: 
	stx %g2, [%g3 + %g4] 
	inc %g2 
	add 0x8, %g4, %g4 
	deccc %g5 
	bne stloop0 
	nop 
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
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 32, 16, 16)) -> intp(4, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 40, 16, 16)) -> intp(5, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 48, 16, 16)) -> intp(6, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 56, 16, 16)) -> intp(7, 1, 1)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0198008  ! 1: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6098008  ! 2: AND_R	and 	%r6, %r8, %r19
	.word 0xe029a010  ! 3: STB_I	stb	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec418008  ! 7: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa4198008  ! 8: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe0298008  ! 9: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a030  ! 13: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xa8418008  ! 14: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xec71a000  ! 15: STX_I	stx	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8498008  ! 19: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xacb18008  ! 20: SUBCcc_R	orncc 	%r6, %r8, %r22
	.word 0xe0218008  ! 21: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe449a010  ! 25: LDSB_I	ldsb	[%r6 + 0x0010], %r18
	.word 0xa2c18008  ! 26: ADDCcc_R	addccc 	%r6, %r8, %r17
	.word 0xec718008  ! 27: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0118008  ! 31: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa6b1a008  ! 32: ORNcc_I	orncc 	%r6, 0x0008, %r19
	.word 0xec298008  ! 33: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0098008  ! 37: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xac31a038  ! 38: SUBC_I	orn 	%r6, 0x0038, %r22
	.word 0xec21a030  ! 39: STW_I	stw	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe019a030  ! 43: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xaac1a038  ! 44: ADDCcc_I	addccc 	%r6, 0x0038, %r21
	.word 0xe8718008  ! 45: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe401a038  ! 49: LDUW_I	lduw	[%r6 + 0x0038], %r18
	.word 0xa0b18008  ! 50: SUBCcc_R	orncc 	%r6, %r8, %r16
	.word 0xe8298008  ! 51: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a000  ! 55: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xa6018008  ! 56: ADD_R	add 	%r6, %r8, %r19
	.word 0xe831a020  ! 57: STH_I	sth	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe859a020  ! 61: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xa8b9a030  ! 62: XNORcc_I	xnorcc 	%r6, 0x0030, %r20
	.word 0xe0398008  ! 63: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe841a038  ! 67: LDSW_I	ldsw	[%r6 + 0x0038], %r20
	.word 0xacb1a020  ! 68: ORNcc_I	orncc 	%r6, 0x0020, %r22
	.word 0xe439a028  ! 69: STD_I	std	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe449a028  ! 73: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xaea1a038  ! 74: SUBcc_I	subcc 	%r6, 0x0038, %r23
	.word 0xe0298008  ! 75: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe851a030  ! 79: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xa6a1a038  ! 80: SUBcc_I	subcc 	%r6, 0x0038, %r19
	.word 0xe031a000  ! 81: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec49a000  ! 85: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xae318008  ! 86: SUBC_R	orn 	%r6, %r8, %r23
	.word 0xe039a018  ! 87: STD_I	std	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0118008  ! 91: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xaa418008  ! 92: ADDC_R	addc 	%r6, %r8, %r21
	.word 0xe471a018  ! 93: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec498008  ! 97: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa231a020  ! 98: SUBC_I	orn 	%r6, 0x0020, %r17
	.word 0xe0398008  ! 99: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4498008  ! 103: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa211a000  ! 104: OR_I	or 	%r6, 0x0000, %r17
	.word 0xe429a030  ! 105: STB_I	stb	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0098008  ! 109: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa4398008  ! 110: XNOR_R	xnor 	%r6, %r8, %r18
	.word 0xe831a010  ! 111: STH_I	sth	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec098008  ! 115: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa4b1a018  ! 116: SUBCcc_I	orncc 	%r6, 0x0018, %r18
	.word 0xe029a028  ! 117: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe051a028  ! 121: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xaa098008  ! 122: AND_R	and 	%r6, %r8, %r21
	.word 0xe0318008  ! 123: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec518008  ! 127: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xae81a028  ! 128: ADDcc_I	addcc 	%r6, 0x0028, %r23
	.word 0xe8718008  ! 129: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8198008  ! 133: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xaaa9a010  ! 134: ANDNcc_I	andncc 	%r6, 0x0010, %r21
	.word 0xe021a008  ! 135: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0598008  ! 139: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa6c18008  ! 140: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xec21a008  ! 141: STW_I	stw	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe051a008  ! 145: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xae398008  ! 146: XNOR_R	xnor 	%r6, %r8, %r23
	.word 0xe4318008  ! 147: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe401a038  ! 151: LDUW_I	lduw	[%r6 + 0x0038], %r18
	.word 0xaa918008  ! 152: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe421a008  ! 153: STW_I	stw	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8098008  ! 157: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa889a010  ! 158: ANDcc_I	andcc 	%r6, 0x0010, %r20
	.word 0xe4398008  ! 159: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8518008  ! 163: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xac018008  ! 164: ADD_R	add 	%r6, %r8, %r22
	.word 0xe8318008  ! 165: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe849a000  ! 169: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xa2b18008  ! 170: SUBCcc_R	orncc 	%r6, %r8, %r17
	.word 0xe8718008  ! 171: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe409a020  ! 175: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xa2b1a020  ! 176: ORNcc_I	orncc 	%r6, 0x0020, %r17
	.word 0xe0718008  ! 177: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8098008  ! 181: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa6298008  ! 182: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe0718008  ! 183: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0598008  ! 187: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaa298008  ! 188: ANDN_R	andn 	%r6, %r8, %r21
	.word 0xe8718008  ! 189: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe059a010  ! 193: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xa239a000  ! 194: XNOR_I	xnor 	%r6, 0x0000, %r17
	.word 0xe0218008  ! 195: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe451a018  ! 199: LDSH_I	ldsh	[%r6 + 0x0018], %r18
	.word 0xa8418008  ! 200: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe021a038  ! 201: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe041a038  ! 205: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xa0c18008  ! 206: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xec31a010  ! 207: STH_I	sth	%r22, [%r6 + 0x0010]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe401a010  ! 211: LDUW_I	lduw	[%r6 + 0x0010], %r18
	.word 0xaea18008  ! 212: SUBcc_R	subcc 	%r6, %r8, %r23
	.word 0xec21a030  ! 213: STW_I	stw	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0518008  ! 217: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa229a018  ! 218: ANDN_I	andn 	%r6, 0x0018, %r17
	.word 0xe0318008  ! 219: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe451a038  ! 223: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	.word 0xaa118008  ! 224: OR_R	or 	%r6, %r8, %r21
	.word 0xe0318008  ! 225: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0518008  ! 229: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa241a020  ! 230: ADDC_I	addc 	%r6, 0x0020, %r17
	.word 0xec29a030  ! 231: STB_I	stb	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe011a030  ! 235: LDUH_I	lduh	[%r6 + 0x0030], %r16
	.word 0xa8a9a008  ! 236: ANDNcc_I	andncc 	%r6, 0x0008, %r20
	.word 0xe0718008  ! 237: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe409a010  ! 241: LDUB_I	ldub	[%r6 + 0x0010], %r18
	.word 0xa6c1a030  ! 242: ADDCcc_I	addccc 	%r6, 0x0030, %r19
	.word 0xe4298008  ! 243: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe411a000  ! 247: LDUH_I	lduh	[%r6 + 0x0000], %r18
	.word 0xa2a9a038  ! 248: ANDNcc_I	andncc 	%r6, 0x0038, %r17
	.word 0xe439a038  ! 249: STD_I	std	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe001a038  ! 253: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xa841a038  ! 254: ADDC_I	addc 	%r6, 0x0038, %r20
	.word 0xec31a038  ! 255: STH_I	sth	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe419a038  ! 259: LDD_I	ldd	[%r6 + 0x0038], %r18
	.word 0xac29a028  ! 260: ANDN_I	andn 	%r6, 0x0028, %r22
	.word 0xec21a008  ! 261: STW_I	stw	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe419a008  ! 265: LDD_I	ldd	[%r6 + 0x0008], %r18
	.word 0xaeb18008  ! 266: ORNcc_R	orncc 	%r6, %r8, %r23
	.word 0xe0218008  ! 267: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0418008  ! 271: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa2b18008  ! 272: SUBCcc_R	orncc 	%r6, %r8, %r17
	.word 0xe0718008  ! 273: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe811a030  ! 277: LDUH_I	lduh	[%r6 + 0x0030], %r20
	.word 0xa221a018  ! 278: SUB_I	sub 	%r6, 0x0018, %r17
	.word 0xe0218008  ! 279: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe049a028  ! 283: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xaac1a010  ! 284: ADDCcc_I	addccc 	%r6, 0x0010, %r21
	.word 0xe8398008  ! 285: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4118008  ! 289: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xae918008  ! 290: ORcc_R	orcc 	%r6, %r8, %r23
	.word 0xe8218008  ! 291: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe411a010  ! 1: LDUH_I	lduh	[%r6 + 0x0010], %r18
	.word 0xa0418008  ! 2: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe0318008  ! 3: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0018008  ! 7: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaaa98008  ! 8: ANDNcc_R	andncc 	%r6, %r8, %r21
	.word 0xe0298008  ! 9: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec598008  ! 13: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa2318008  ! 14: ORN_R	orn 	%r6, %r8, %r17
	.word 0xe0318008  ! 15: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4518008  ! 19: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa489a030  ! 20: ANDcc_I	andcc 	%r6, 0x0030, %r18
	.word 0xe071a010  ! 21: STX_I	stx	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe051a010  ! 25: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xac21a020  ! 26: SUB_I	sub 	%r6, 0x0020, %r22
	.word 0xe031a008  ! 27: STH_I	sth	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe011a008  ! 31: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xaaa1a000  ! 32: SUBcc_I	subcc 	%r6, 0x0000, %r21
	.word 0xec318008  ! 33: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8118008  ! 37: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xac298008  ! 38: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xe021a030  ! 39: STW_I	stw	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4598008  ! 43: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xac898008  ! 44: ANDcc_R	andcc 	%r6, %r8, %r22
	.word 0xe831a038  ! 45: STH_I	sth	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe451a038  ! 49: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	.word 0xa6c1a038  ! 50: ADDCcc_I	addccc 	%r6, 0x0038, %r19
	.word 0xe0218008  ! 51: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe841a000  ! 55: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	.word 0xa0298008  ! 56: ANDN_R	andn 	%r6, %r8, %r16
	.word 0xe4318008  ! 57: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec19a020  ! 61: LDD_I	ldd	[%r6 + 0x0020], %r22
	.word 0xa8298008  ! 62: ANDN_R	andn 	%r6, %r8, %r20
	.word 0xe8398008  ! 63: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec498008  ! 67: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xaa31a000  ! 68: ORN_I	orn 	%r6, 0x0000, %r21
	.word 0xe4298008  ! 69: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe851a028  ! 73: LDSH_I	ldsh	[%r6 + 0x0028], %r20
	.word 0xaa31a038  ! 74: ORN_I	orn 	%r6, 0x0038, %r21
	.word 0xe0298008  ! 75: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe009a030  ! 79: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xa821a020  ! 80: SUB_I	sub 	%r6, 0x0020, %r20
	.word 0xe029a000  ! 81: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4018008  ! 85: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa089a018  ! 86: ANDcc_I	andcc 	%r6, 0x0018, %r16
	.word 0xe029a018  ! 87: STB_I	stb	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0098008  ! 91: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa889a008  ! 92: ANDcc_I	andcc 	%r6, 0x0008, %r20
	.word 0xe429a018  ! 93: STB_I	stb	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8018008  ! 97: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xae018008  ! 98: ADD_R	add 	%r6, %r8, %r23
	.word 0xe421a008  ! 99: STW_I	stw	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe441a008  ! 103: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	.word 0xaa31a030  ! 104: SUBC_I	orn 	%r6, 0x0030, %r21
	.word 0xe0718008  ! 105: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe459a030  ! 109: LDX_I	ldx	[%r6 + 0x0030], %r18
	.word 0xa489a010  ! 110: ANDcc_I	andcc 	%r6, 0x0010, %r18
	.word 0xe0398008  ! 111: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe049a010  ! 115: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xa4818008  ! 116: ADDcc_R	addcc 	%r6, %r8, %r18
	.word 0xe0718008  ! 117: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe001a028  ! 121: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xa0c18008  ! 122: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xe829a020  ! 123: STB_I	stb	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4498008  ! 127: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xae31a028  ! 128: ORN_I	orn 	%r6, 0x0028, %r23
	.word 0xec318008  ! 129: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0018008  ! 133: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaa098008  ! 134: AND_R	and 	%r6, %r8, %r21
	.word 0xe0318008  ! 135: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0498008  ! 139: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa4018008  ! 140: ADD_R	add 	%r6, %r8, %r18
	.word 0xe029a008  ! 141: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 145: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa8a18008  ! 146: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xe429a038  ! 147: STB_I	stb	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4098008  ! 151: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa8318008  ! 152: ORN_R	orn 	%r6, %r8, %r20
	.word 0xe8218008  ! 153: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8598008  ! 157: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa6318008  ! 158: ORN_R	orn 	%r6, %r8, %r19
	.word 0xec218008  ! 159: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec19a038  ! 163: LDD_I	ldd	[%r6 + 0x0038], %r22
	.word 0xae418008  ! 164: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe0298008  ! 165: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 169: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa831a038  ! 170: SUBC_I	orn 	%r6, 0x0038, %r20
	.word 0xe4718008  ! 171: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe019a020  ! 175: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xaa09a000  ! 176: AND_I	and 	%r6, 0x0000, %r21
	.word 0xe4298008  ! 177: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe801a018  ! 181: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xaa31a010  ! 182: SUBC_I	orn 	%r6, 0x0010, %r21
	.word 0xe831a000  ! 183: STH_I	sth	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec418008  ! 187: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xac398008  ! 188: XNOR_R	xnor 	%r6, %r8, %r22
	.word 0xe4718008  ! 189: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec198008  ! 193: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa2918008  ! 194: ORcc_R	orcc 	%r6, %r8, %r17
	.word 0xec21a018  ! 195: STW_I	stw	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa4a98008  ! 200: ANDNcc_R	andncc 	%r6, %r8, %r18
	.word 0xe071a038  ! 201: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8598008  ! 205: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xae81a038  ! 206: ADDcc_I	addcc 	%r6, 0x0038, %r23
	.word 0xe039a010  ! 207: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe041a010  ! 211: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	.word 0xa0a9a000  ! 212: ANDNcc_I	andncc 	%r6, 0x0000, %r16
	.word 0xe4398008  ! 213: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe401a030  ! 217: LDUW_I	lduw	[%r6 + 0x0030], %r18
	.word 0xa4098008  ! 218: AND_R	and 	%r6, %r8, %r18
	.word 0xec71a038  ! 219: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8498008  ! 223: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa601a000  ! 224: ADD_I	add 	%r6, 0x0000, %r19
	.word 0xe4718008  ! 225: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0498008  ! 229: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xac41a030  ! 230: ADDC_I	addc 	%r6, 0x0030, %r22
	.word 0xec71a030  ! 231: STX_I	stx	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe419a030  ! 235: LDD_I	ldd	[%r6 + 0x0030], %r18
	.word 0xa2898008  ! 236: ANDcc_R	andcc 	%r6, %r8, %r17
	.word 0xe0298008  ! 237: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe049a010  ! 241: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xaaa18008  ! 242: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xe8218008  ! 243: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4098008  ! 247: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa0318008  ! 248: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xec718008  ! 249: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe451a038  ! 253: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	.word 0xa8318008  ! 254: ORN_R	orn 	%r6, %r8, %r20
	.word 0xe071a038  ! 255: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe019a038  ! 259: LDD_I	ldd	[%r6 + 0x0038], %r16
	.word 0xa8c18008  ! 260: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xe031a008  ! 261: STH_I	sth	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec01a008  ! 265: LDUW_I	lduw	[%r6 + 0x0008], %r22
	.word 0xa2018008  ! 266: ADD_R	add 	%r6, %r8, %r17
	.word 0xe021a000  ! 267: STW_I	stw	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8198008  ! 271: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa4b9a008  ! 272: XNORcc_I	xnorcc 	%r6, 0x0008, %r18
	.word 0xec71a030  ! 273: STX_I	stx	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4198008  ! 277: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa2398008  ! 278: XNOR_R	xnor 	%r6, %r8, %r17
	.word 0xe4218008  ! 279: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0598008  ! 283: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa6a98008  ! 284: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xec318008  ! 285: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe019a028  ! 289: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xa029a028  ! 290: ANDN_I	andn 	%r6, 0x0028, %r16
	.word 0xe429a018  ! 291: STB_I	stb	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4098008  ! 1: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xaeb18008  ! 2: SUBCcc_R	orncc 	%r6, %r8, %r23
	.word 0xe4218008  ! 3: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0018008  ! 7: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaa01a028  ! 8: ADD_I	add 	%r6, 0x0028, %r21
	.word 0xe429a030  ! 9: STB_I	stb	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0418008  ! 13: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaa918008  ! 14: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe821a000  ! 15: STW_I	stw	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec59a000  ! 19: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xa4418008  ! 20: ADDC_R	addc 	%r6, %r8, %r18
	.word 0xe829a010  ! 21: STB_I	stb	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe059a010  ! 25: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xaec18008  ! 26: ADDCcc_R	addccc 	%r6, %r8, %r23
	.word 0xec29a008  ! 27: STB_I	stb	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0118008  ! 31: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa0098008  ! 32: AND_R	and 	%r6, %r8, %r16
	.word 0xe4718008  ! 33: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec418008  ! 37: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa4998008  ! 38: XORcc_R	xorcc 	%r6, %r8, %r18
	.word 0xe8718008  ! 39: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4518008  ! 43: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa2398008  ! 44: XNOR_R	xnor 	%r6, %r8, %r17
	.word 0xe039a038  ! 45: STD_I	std	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe441a038  ! 49: LDSW_I	ldsw	[%r6 + 0x0038], %r18
	.word 0xac29a028  ! 50: ANDN_I	andn 	%r6, 0x0028, %r22
	.word 0xec218008  ! 51: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 55: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa4198008  ! 56: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe829a020  ! 57: STB_I	stb	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0598008  ! 61: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa2018008  ! 62: ADD_R	add 	%r6, %r8, %r17
	.word 0xec218008  ! 63: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe841a038  ! 67: LDSW_I	ldsw	[%r6 + 0x0038], %r20
	.word 0xac89a030  ! 68: ANDcc_I	andcc 	%r6, 0x0030, %r22
	.word 0xe831a028  ! 69: STH_I	sth	%r20, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4598008  ! 73: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xaea18008  ! 74: SUBcc_R	subcc 	%r6, %r8, %r23
	.word 0xe839a030  ! 75: STD_I	std	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec09a030  ! 79: LDUB_I	ldub	[%r6 + 0x0030], %r22
	.word 0xaa09a030  ! 80: AND_I	and 	%r6, 0x0030, %r21
	.word 0xe8298008  ! 81: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe819a000  ! 85: LDD_I	ldd	[%r6 + 0x0000], %r20
	.word 0xa6b9a008  ! 86: XNORcc_I	xnorcc 	%r6, 0x0008, %r19
	.word 0xe871a018  ! 87: STX_I	stx	%r20, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8598008  ! 91: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa2818008  ! 92: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe4718008  ! 93: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec198008  ! 97: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xae09a018  ! 98: AND_I	and 	%r6, 0x0018, %r23
	.word 0xec718008  ! 99: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe009a008  ! 103: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xa6818008  ! 104: ADDcc_R	addcc 	%r6, %r8, %r19
	.word 0xec21a030  ! 105: STW_I	stw	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe859a030  ! 109: LDX_I	ldx	[%r6 + 0x0030], %r20
	.word 0xa881a020  ! 110: ADDcc_I	addcc 	%r6, 0x0020, %r20
	.word 0xe0718008  ! 111: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe801a010  ! 115: LDUW_I	lduw	[%r6 + 0x0010], %r20
	.word 0xa6298008  ! 116: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe8718008  ! 117: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe049a028  ! 121: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xa6118008  ! 122: OR_R	or 	%r6, %r8, %r19
	.word 0xec29a020  ! 123: STB_I	stb	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe441a020  ! 127: LDSW_I	ldsw	[%r6 + 0x0020], %r18
	.word 0xaeb18008  ! 128: ORNcc_R	orncc 	%r6, %r8, %r23
	.word 0xe0298008  ! 129: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec418008  ! 133: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xaac1a038  ! 134: ADDCcc_I	addccc 	%r6, 0x0038, %r21
	.word 0xe0718008  ! 135: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0498008  ! 139: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa681a030  ! 140: ADDcc_I	addcc 	%r6, 0x0030, %r19
	.word 0xe4398008  ! 141: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0098008  ! 145: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa0418008  ! 146: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xec718008  ! 147: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec098008  ! 151: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa689a038  ! 152: ANDcc_I	andcc 	%r6, 0x0038, %r19
	.word 0xe4218008  ! 153: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe001a008  ! 157: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xa2b18008  ! 158: ORNcc_R	orncc 	%r6, %r8, %r17
	.word 0xe8398008  ! 159: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe411a038  ! 163: LDUH_I	lduh	[%r6 + 0x0038], %r18
	.word 0xa081a010  ! 164: ADDcc_I	addcc 	%r6, 0x0010, %r16
	.word 0xe8298008  ! 165: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4598008  ! 169: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa681a038  ! 170: ADDcc_I	addcc 	%r6, 0x0038, %r19
	.word 0xe0298008  ! 171: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe001a020  ! 175: LDUW_I	lduw	[%r6 + 0x0020], %r16
	.word 0xac89a020  ! 176: ANDcc_I	andcc 	%r6, 0x0020, %r22
	.word 0xe071a018  ! 177: STX_I	stx	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe809a018  ! 181: LDUB_I	ldub	[%r6 + 0x0018], %r20
	.word 0xa8398008  ! 182: XNOR_R	xnor 	%r6, %r8, %r20
	.word 0xe8718008  ! 183: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec01a000  ! 187: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xaaa1a030  ! 188: SUBcc_I	subcc 	%r6, 0x0030, %r21
	.word 0xe4398008  ! 189: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8198008  ! 193: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa611a008  ! 194: OR_I	or 	%r6, 0x0008, %r19
	.word 0xe0298008  ! 195: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa631a000  ! 200: ORN_I	orn 	%r6, 0x0000, %r19
	.word 0xe4398008  ! 201: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8118008  ! 205: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa4318008  ! 206: SUBC_R	orn 	%r6, %r8, %r18
	.word 0xe031a010  ! 207: STH_I	sth	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec11a010  ! 211: LDUH_I	lduh	[%r6 + 0x0010], %r22
	.word 0xa2218008  ! 212: SUB_R	sub 	%r6, %r8, %r17
	.word 0xe8218008  ! 213: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe449a030  ! 217: LDSB_I	ldsb	[%r6 + 0x0030], %r18
	.word 0xa039a010  ! 218: XNOR_I	xnor 	%r6, 0x0010, %r16
	.word 0xe0218008  ! 219: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0418008  ! 223: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaaa18008  ! 224: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xe0218008  ! 225: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8018008  ! 229: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xaa09a018  ! 230: AND_I	and 	%r6, 0x0018, %r21
	.word 0xe0718008  ! 231: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa081a008  ! 236: ADDcc_I	addcc 	%r6, 0x0008, %r16
	.word 0xe0298008  ! 237: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec118008  ! 241: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa8a18008  ! 242: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xe071a000  ! 243: STX_I	stx	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe009a000  ! 247: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xac19a038  ! 248: XOR_I	xor 	%r6, 0x0038, %r22
	.word 0xe4298008  ! 249: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8098008  ! 253: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa2b98008  ! 254: XNORcc_R	xnorcc 	%r6, %r8, %r17
	.word 0xe4398008  ! 255: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe009a038  ! 259: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xa6b9a030  ! 260: XNORcc_I	xnorcc 	%r6, 0x0030, %r19
	.word 0xe071a008  ! 261: STX_I	stx	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec518008  ! 265: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xaac1a000  ! 266: ADDCcc_I	addccc 	%r6, 0x0000, %r21
	.word 0xe0718008  ! 267: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe001a000  ! 271: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xac298008  ! 272: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xe0218008  ! 273: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec19a030  ! 277: LDD_I	ldd	[%r6 + 0x0030], %r22
	.word 0xaeb1a028  ! 278: ORNcc_I	orncc 	%r6, 0x0028, %r23
	.word 0xe031a028  ! 279: STH_I	sth	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0118008  ! 283: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xae41a010  ! 284: ADDC_I	addc 	%r6, 0x0010, %r23
	.word 0xe039a028  ! 285: STD_I	std	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec09a028  ! 289: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xa219a020  ! 290: XOR_I	xor 	%r6, 0x0020, %r17
	.word 0xe0398008  ! 291: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4418008  ! 1: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa0098008  ! 2: AND_R	and 	%r6, %r8, %r16
	.word 0xe0298008  ! 3: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe011a010  ! 7: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xaab18008  ! 8: ORNcc_R	orncc 	%r6, %r8, %r21
	.word 0xe8298008  ! 9: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe019a030  ! 13: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xa0b18008  ! 14: SUBCcc_R	orncc 	%r6, %r8, %r16
	.word 0xe0218008  ! 15: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe859a000  ! 19: LDX_I	ldx	[%r6 + 0x0000], %r20
	.word 0xa8a18008  ! 20: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xe039a010  ! 21: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4498008  ! 25: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa609a030  ! 26: AND_I	and 	%r6, 0x0030, %r19
	.word 0xe039a008  ! 27: STD_I	std	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0598008  ! 31: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xae41a030  ! 32: ADDC_I	addc 	%r6, 0x0030, %r23
	.word 0xe031a000  ! 33: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8518008  ! 37: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xac298008  ! 38: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xe471a030  ! 39: STX_I	stx	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe811a030  ! 43: LDUH_I	lduh	[%r6 + 0x0030], %r20
	.word 0xa601a000  ! 44: ADD_I	add 	%r6, 0x0000, %r19
	.word 0xe0398008  ! 45: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec418008  ! 49: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa621a008  ! 50: SUB_I	sub 	%r6, 0x0008, %r19
	.word 0xec218008  ! 51: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe041a000  ! 55: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xa689a000  ! 56: ANDcc_I	andcc 	%r6, 0x0000, %r19
	.word 0xe039a020  ! 57: STD_I	std	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec598008  ! 61: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xacb98008  ! 62: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe021a038  ! 63: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe019a038  ! 67: LDD_I	ldd	[%r6 + 0x0038], %r16
	.word 0xa0098008  ! 68: AND_R	and 	%r6, %r8, %r16
	.word 0xe4318008  ! 69: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0418008  ! 73: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xac818008  ! 74: ADDcc_R	addcc 	%r6, %r8, %r22
	.word 0xec71a030  ! 75: STX_I	stx	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe851a030  ! 79: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xa4818008  ! 80: ADDcc_R	addcc 	%r6, %r8, %r18
	.word 0xe0398008  ! 81: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe059a000  ! 85: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xa431a018  ! 86: ORN_I	orn 	%r6, 0x0018, %r18
	.word 0xe831a018  ! 87: STH_I	sth	%r20, [%r6 + 0x0018]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe811a018  ! 91: LDUH_I	lduh	[%r6 + 0x0018], %r20
	.word 0xa6b18008  ! 92: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xe0718008  ! 93: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe819a018  ! 97: LDD_I	ldd	[%r6 + 0x0018], %r20
	.word 0xae918008  ! 98: ORcc_R	orcc 	%r6, %r8, %r23
	.word 0xe021a008  ! 99: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec01a008  ! 103: LDUW_I	lduw	[%r6 + 0x0008], %r22
	.word 0xa2398008  ! 104: XNOR_R	xnor 	%r6, %r8, %r17
	.word 0xe4298008  ! 105: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4098008  ! 109: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa441a010  ! 110: ADDC_I	addc 	%r6, 0x0010, %r18
	.word 0xe4298008  ! 111: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0598008  ! 115: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaea98008  ! 116: ANDNcc_R	andncc 	%r6, %r8, %r23
	.word 0xe0218008  ! 117: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0418008  ! 121: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa8a18008  ! 122: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xe0398008  ! 123: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec49a020  ! 127: LDSB_I	ldsb	[%r6 + 0x0020], %r22
	.word 0xa2418008  ! 128: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xec398008  ! 129: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec49a028  ! 133: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xa691a030  ! 134: ORcc_I	orcc 	%r6, 0x0030, %r19
	.word 0xe821a008  ! 135: STW_I	stw	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4018008  ! 139: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xaab98008  ! 140: XNORcc_R	xnorcc 	%r6, %r8, %r21
	.word 0xe8318008  ! 141: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe001a008  ! 145: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xa6218008  ! 146: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe8718008  ! 147: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0098008  ! 151: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6a98008  ! 152: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xe871a008  ! 153: STX_I	stx	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe041a008  ! 157: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xa0c18008  ! 158: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xe0218008  ! 159: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe049a038  ! 163: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xa6118008  ! 164: OR_R	or 	%r6, %r8, %r19
	.word 0xe8398008  ! 165: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec118008  ! 169: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa0c1a018  ! 170: ADDCcc_I	addccc 	%r6, 0x0018, %r16
	.word 0xec39a020  ! 171: STD_I	std	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe841a020  ! 175: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	.word 0xa681a028  ! 176: ADDcc_I	addcc 	%r6, 0x0028, %r19
	.word 0xe8218008  ! 177: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a018  ! 181: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xaa81a028  ! 182: ADDcc_I	addcc 	%r6, 0x0028, %r21
	.word 0xe831a000  ! 183: STH_I	sth	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 187: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa0318008  ! 188: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe821a010  ! 189: STW_I	stw	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 193: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa0818008  ! 194: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe431a018  ! 195: STH_I	sth	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec41a018  ! 199: LDSW_I	ldsw	[%r6 + 0x0018], %r22
	.word 0xa0b18008  ! 200: SUBCcc_R	orncc 	%r6, %r8, %r16
	.word 0xec71a038  ! 201: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe401a038  ! 205: LDUW_I	lduw	[%r6 + 0x0038], %r18
	.word 0xa2198008  ! 206: XOR_R	xor 	%r6, %r8, %r17
	.word 0xe0218008  ! 207: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8018008  ! 211: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa0a1a038  ! 212: SUBcc_I	subcc 	%r6, 0x0038, %r16
	.word 0xe839a030  ! 213: STD_I	std	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe451a030  ! 217: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	.word 0xaa31a030  ! 218: SUBC_I	orn 	%r6, 0x0030, %r21
	.word 0xe0318008  ! 219: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe401a038  ! 223: LDUW_I	lduw	[%r6 + 0x0038], %r18
	.word 0xa0898008  ! 224: ANDcc_R	andcc 	%r6, %r8, %r16
	.word 0xe0398008  ! 225: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4118008  ! 229: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xa0818008  ! 230: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe031a030  ! 231: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xacb98008  ! 236: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe0298008  ! 237: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe009a010  ! 241: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xa0398008  ! 242: XNOR_R	xnor 	%r6, %r8, %r16
	.word 0xe831a000  ! 243: STH_I	sth	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec41a000  ! 247: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xa4898008  ! 248: ANDcc_R	andcc 	%r6, %r8, %r18
	.word 0xe821a038  ! 249: STW_I	stw	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4498008  ! 253: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xacb1a000  ! 254: ORNcc_I	orncc 	%r6, 0x0000, %r22
	.word 0xe871a038  ! 255: STX_I	stx	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8098008  ! 259: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa8c18008  ! 260: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xec39a008  ! 261: STD_I	std	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4598008  ! 265: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa4918008  ! 266: ORcc_R	orcc 	%r6, %r8, %r18
	.word 0xe4718008  ! 267: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe419a000  ! 271: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xacc1a008  ! 272: ADDCcc_I	addccc 	%r6, 0x0008, %r22
	.word 0xe8318008  ! 273: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec098008  ! 277: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa441a038  ! 278: ADDC_I	addc 	%r6, 0x0038, %r18
	.word 0xec398008  ! 279: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4118008  ! 283: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xac19a020  ! 284: XOR_I	xor 	%r6, 0x0020, %r22
	.word 0xe0318008  ! 285: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8518008  ! 289: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa4318008  ! 290: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe031a018  ! 291: STH_I	sth	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4018008  ! 1: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa8a18008  ! 2: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xe039a010  ! 3: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4018008  ! 7: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa0b1a018  ! 8: ORNcc_I	orncc 	%r6, 0x0018, %r16
	.word 0xe4398008  ! 9: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe441a030  ! 13: LDSW_I	ldsw	[%r6 + 0x0030], %r18
	.word 0xa689a010  ! 14: ANDcc_I	andcc 	%r6, 0x0010, %r19
	.word 0xec298008  ! 15: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe019a000  ! 19: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xacb98008  ! 20: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe8318008  ! 21: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe459a010  ! 25: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xa0318008  ! 26: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe471a008  ! 27: STX_I	stx	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe049a008  ! 31: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xacc1a018  ! 32: ADDCcc_I	addccc 	%r6, 0x0018, %r22
	.word 0xe0298008  ! 33: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8098008  ! 37: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xae91a008  ! 38: ORcc_I	orcc 	%r6, 0x0008, %r23
	.word 0xe031a030  ! 39: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0598008  ! 43: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaea1a010  ! 44: SUBcc_I	subcc 	%r6, 0x0010, %r23
	.word 0xe029a038  ! 45: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe041a038  ! 49: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xa8c18008  ! 50: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xe831a000  ! 51: STH_I	sth	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8418008  ! 55: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa489a020  ! 56: ANDcc_I	andcc 	%r6, 0x0020, %r18
	.word 0xe071a020  ! 57: STX_I	stx	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4418008  ! 61: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa8b9a020  ! 62: XNORcc_I	xnorcc 	%r6, 0x0020, %r20
	.word 0xec71a038  ! 63: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 67: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaca98008  ! 68: ANDNcc_R	andncc 	%r6, %r8, %r22
	.word 0xe8218008  ! 69: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4198008  ! 73: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa6398008  ! 74: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xec218008  ! 75: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe811a030  ! 79: LDUH_I	lduh	[%r6 + 0x0030], %r20
	.word 0xa0418008  ! 80: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe829a000  ! 81: STB_I	stb	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe049a000  ! 85: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xaa81a018  ! 86: ADDcc_I	addcc 	%r6, 0x0018, %r21
	.word 0xe021a018  ! 87: STW_I	stw	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0098008  ! 91: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6b1a000  ! 92: SUBCcc_I	orncc 	%r6, 0x0000, %r19
	.word 0xe4318008  ! 93: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4198008  ! 97: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa6b98008  ! 98: XNORcc_R	xnorcc 	%r6, %r8, %r19
	.word 0xe871a008  ! 99: STX_I	stx	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 103: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa8318008  ! 104: ORN_R	orn 	%r6, %r8, %r20
	.word 0xe8398008  ! 105: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0018008  ! 109: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa6a1a010  ! 110: SUBcc_I	subcc 	%r6, 0x0010, %r19
	.word 0xe0298008  ! 111: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0118008  ! 115: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa441a028  ! 116: ADDC_I	addc 	%r6, 0x0028, %r18
	.word 0xe8318008  ! 117: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4018008  ! 121: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa0918008  ! 122: ORcc_R	orcc 	%r6, %r8, %r16
	.word 0xe871a020  ! 123: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe419a020  ! 127: LDD_I	ldd	[%r6 + 0x0020], %r18
	.word 0xa4318008  ! 128: SUBC_R	orn 	%r6, %r8, %r18
	.word 0xe0298008  ! 129: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 133: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xae418008  ! 134: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe871a008  ! 135: STX_I	stx	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4098008  ! 139: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xaea98008  ! 140: ANDNcc_R	andncc 	%r6, %r8, %r23
	.word 0xe0298008  ! 141: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0498008  ! 145: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa6b1a010  ! 146: SUBCcc_I	orncc 	%r6, 0x0010, %r19
	.word 0xe039a038  ! 147: STD_I	std	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe011a038  ! 151: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xaeb18008  ! 152: SUBCcc_R	orncc 	%r6, %r8, %r23
	.word 0xe8398008  ! 153: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8518008  ! 157: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa8418008  ! 158: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xec718008  ! 159: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec198008  ! 163: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa429a038  ! 164: ANDN_I	andn 	%r6, 0x0038, %r18
	.word 0xe8318008  ! 165: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe059a000  ! 169: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xa299a000  ! 170: XORcc_I	xorcc 	%r6, 0x0000, %r17
	.word 0xe0398008  ! 171: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe009a020  ! 175: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xae818008  ! 176: ADDcc_R	addcc 	%r6, %r8, %r23
	.word 0xec21a018  ! 177: STW_I	stw	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8118008  ! 181: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xaa318008  ! 182: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xe839a000  ! 183: STD_I	std	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe019a000  ! 187: LDD_I	ldd	[%r6 + 0x0000], %r16
	.word 0xa0b98008  ! 188: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xe039a010  ! 189: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec11a010  ! 193: LDUH_I	lduh	[%r6 + 0x0010], %r22
	.word 0xa4b18008  ! 194: ORNcc_R	orncc 	%r6, %r8, %r18
	.word 0xe039a018  ! 195: STD_I	std	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8598008  ! 199: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xaa318008  ! 200: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xe4718008  ! 201: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe011a038  ! 205: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xa0418008  ! 206: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe0298008  ! 207: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4498008  ! 211: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa881a020  ! 212: ADDcc_I	addcc 	%r6, 0x0020, %r20
	.word 0xe4318008  ! 213: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe041a030  ! 217: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xa4298008  ! 218: ANDN_R	andn 	%r6, %r8, %r18
	.word 0xec398008  ! 219: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe809a038  ! 223: LDUB_I	ldub	[%r6 + 0x0038], %r20
	.word 0xa2298008  ! 224: ANDN_R	andn 	%r6, %r8, %r17
	.word 0xec718008  ! 225: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe059a000  ! 229: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xa0b98008  ! 230: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xe429a030  ! 231: STB_I	stb	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4098008  ! 235: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xac898008  ! 236: ANDcc_R	andcc 	%r6, %r8, %r22
	.word 0xe8398008  ! 237: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe451a010  ! 241: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xa831a030  ! 242: SUBC_I	orn 	%r6, 0x0030, %r20
	.word 0xe421a000  ! 243: STW_I	stw	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec49a000  ! 247: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xa0318008  ! 248: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe8718008  ! 249: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe801a038  ! 253: LDUW_I	lduw	[%r6 + 0x0038], %r20
	.word 0xa009a020  ! 254: AND_I	and 	%r6, 0x0020, %r16
	.word 0xe0298008  ! 255: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec518008  ! 259: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xaa318008  ! 260: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xe031a008  ! 261: STH_I	sth	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe859a008  ! 265: LDX_I	ldx	[%r6 + 0x0008], %r20
	.word 0xa8018008  ! 266: ADD_R	add 	%r6, %r8, %r20
	.word 0xe039a000  ! 267: STD_I	std	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec49a000  ! 271: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xa231a000  ! 272: ORN_I	orn 	%r6, 0x0000, %r17
	.word 0xe039a030  ! 273: STD_I	std	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe051a030  ! 277: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xa4c18008  ! 278: ADDCcc_R	addccc 	%r6, %r8, %r18
	.word 0xe031a028  ! 279: STH_I	sth	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0498008  ! 283: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa6b9a028  ! 284: XNORcc_I	xnorcc 	%r6, 0x0028, %r19
	.word 0xe431a028  ! 285: STH_I	sth	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec01a028  ! 289: LDUW_I	lduw	[%r6 + 0x0028], %r22
	.word 0xaa91a000  ! 290: ORcc_I	orcc 	%r6, 0x0000, %r21
	.word 0xe071a018  ! 291: STX_I	stx	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe849a010  ! 1: LDSB_I	ldsb	[%r6 + 0x0010], %r20
	.word 0xacc18008  ! 2: ADDCcc_R	addccc 	%r6, %r8, %r22
	.word 0xec718008  ! 3: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0498008  ! 7: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xaa198008  ! 8: XOR_R	xor 	%r6, %r8, %r21
	.word 0xe0398008  ! 9: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4198008  ! 13: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa0998008  ! 14: XORcc_R	xorcc 	%r6, %r8, %r16
	.word 0xe439a000  ! 15: STD_I	std	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0498008  ! 19: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa691a020  ! 20: ORcc_I	orcc 	%r6, 0x0020, %r19
	.word 0xec318008  ! 21: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe051a010  ! 25: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xaa998008  ! 26: XORcc_R	xorcc 	%r6, %r8, %r21
	.word 0xec718008  ! 27: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec49a008  ! 31: LDSB_I	ldsb	[%r6 + 0x0008], %r22
	.word 0xa631a030  ! 32: SUBC_I	orn 	%r6, 0x0030, %r19
	.word 0xe039a000  ! 33: STD_I	std	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8098008  ! 37: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa8b9a020  ! 38: XNORcc_I	xnorcc 	%r6, 0x0020, %r20
	.word 0xe0318008  ! 39: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe019a030  ! 43: LDD_I	ldd	[%r6 + 0x0030], %r16
	.word 0xaea9a000  ! 44: ANDNcc_I	andncc 	%r6, 0x0000, %r23
	.word 0xec71a038  ! 45: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0598008  ! 49: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaaa9a030  ! 50: ANDNcc_I	andncc 	%r6, 0x0030, %r21
	.word 0xe8398008  ! 51: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe409a000  ! 55: LDUB_I	ldub	[%r6 + 0x0000], %r18
	.word 0xaa198008  ! 56: XOR_R	xor 	%r6, %r8, %r21
	.word 0xe039a020  ! 57: STD_I	std	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec51a020  ! 61: LDSH_I	ldsh	[%r6 + 0x0020], %r22
	.word 0xa4298008  ! 62: ANDN_R	andn 	%r6, %r8, %r18
	.word 0xe029a038  ! 63: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec198008  ! 67: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa011a020  ! 68: OR_I	or 	%r6, 0x0020, %r16
	.word 0xe039a028  ! 69: STD_I	std	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8098008  ! 73: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa699a028  ! 74: XORcc_I	xorcc 	%r6, 0x0028, %r19
	.word 0xe4398008  ! 75: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0018008  ! 79: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa0b9a000  ! 80: XNORcc_I	xnorcc 	%r6, 0x0000, %r16
	.word 0xe0398008  ! 81: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0598008  ! 85: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa831a010  ! 86: ORN_I	orn 	%r6, 0x0010, %r20
	.word 0xec39a018  ! 87: STD_I	std	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe041a018  ! 91: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xae398008  ! 92: XNOR_R	xnor 	%r6, %r8, %r23
	.word 0xe0318008  ! 93: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8098008  ! 97: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa2b1a000  ! 98: ORNcc_I	orncc 	%r6, 0x0000, %r17
	.word 0xe8718008  ! 99: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe059a008  ! 103: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xac91a030  ! 104: ORcc_I	orcc 	%r6, 0x0030, %r22
	.word 0xec298008  ! 105: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe851a030  ! 109: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	.word 0xa4998008  ! 110: XORcc_R	xorcc 	%r6, %r8, %r18
	.word 0xe0298008  ! 111: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0418008  ! 115: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa0b18008  ! 116: SUBCcc_R	orncc 	%r6, %r8, %r16
	.word 0xe431a028  ! 117: STH_I	sth	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe459a028  ! 121: LDX_I	ldx	[%r6 + 0x0028], %r18
	.word 0xae81a008  ! 122: ADDcc_I	addcc 	%r6, 0x0008, %r23
	.word 0xe839a020  ! 123: STD_I	std	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec498008  ! 127: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa2218008  ! 128: SUB_R	sub 	%r6, %r8, %r17
	.word 0xe4318008  ! 129: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 133: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa8098008  ! 134: AND_R	and 	%r6, %r8, %r20
	.word 0xe4718008  ! 135: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8018008  ! 139: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa6998008  ! 140: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe4318008  ! 141: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe009a008  ! 145: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xa0b1a038  ! 146: ORNcc_I	orncc 	%r6, 0x0038, %r16
	.word 0xe071a038  ! 147: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe419a038  ! 151: LDD_I	ldd	[%r6 + 0x0038], %r18
	.word 0xa8218008  ! 152: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe829a008  ! 153: STB_I	stb	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe041a008  ! 157: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xa0b18008  ! 158: ORNcc_R	orncc 	%r6, %r8, %r16
	.word 0xec21a038  ! 159: STW_I	stw	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec498008  ! 163: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xaa218008  ! 164: SUB_R	sub 	%r6, %r8, %r21
	.word 0xe839a000  ! 165: STD_I	std	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec59a000  ! 169: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xa419a000  ! 170: XOR_I	xor 	%r6, 0x0000, %r18
	.word 0xe0298008  ! 171: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8518008  ! 175: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa2b1a018  ! 176: SUBCcc_I	orncc 	%r6, 0x0018, %r17
	.word 0xe4318008  ! 177: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4518008  ! 181: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xac098008  ! 182: AND_R	and 	%r6, %r8, %r22
	.word 0xec39a000  ! 183: STD_I	std	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a000  ! 187: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xaa91a010  ! 188: ORcc_I	orcc 	%r6, 0x0010, %r21
	.word 0xe0298008  ! 189: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe841a010  ! 193: LDSW_I	ldsw	[%r6 + 0x0010], %r20
	.word 0xa6318008  ! 194: SUBC_R	orn 	%r6, %r8, %r19
	.word 0xec39a018  ! 195: STD_I	std	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec59a018  ! 199: LDX_I	ldx	[%r6 + 0x0018], %r22
	.word 0xaec1a028  ! 200: ADDCcc_I	addccc 	%r6, 0x0028, %r23
	.word 0xec298008  ! 201: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec49a038  ! 205: LDSB_I	ldsb	[%r6 + 0x0038], %r22
	.word 0xa031a018  ! 206: SUBC_I	orn 	%r6, 0x0018, %r16
	.word 0xe039a010  ! 207: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8518008  ! 211: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xac118008  ! 212: OR_R	or 	%r6, %r8, %r22
	.word 0xe439a030  ! 213: STD_I	std	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4198008  ! 217: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa6b18008  ! 218: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xec71a038  ! 219: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4498008  ! 223: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xaca1a028  ! 224: SUBcc_I	subcc 	%r6, 0x0028, %r22
	.word 0xec298008  ! 225: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe849a000  ! 229: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xa481a038  ! 230: ADDcc_I	addcc 	%r6, 0x0038, %r18
	.word 0xe8398008  ! 231: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec198008  ! 235: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa6398008  ! 236: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xe0718008  ! 237: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe809a010  ! 241: LDUB_I	ldub	[%r6 + 0x0010], %r20
	.word 0xacc1a008  ! 242: ADDCcc_I	addccc 	%r6, 0x0008, %r22
	.word 0xe071a000  ! 243: STX_I	stx	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe009a000  ! 247: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xa2b18008  ! 248: SUBCcc_R	orncc 	%r6, %r8, %r17
	.word 0xec298008  ! 249: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe859a038  ! 253: LDX_I	ldx	[%r6 + 0x0038], %r20
	.word 0xa8118008  ! 254: OR_R	or 	%r6, %r8, %r20
	.word 0xec298008  ! 255: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe011a038  ! 259: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xa039a020  ! 260: XNOR_I	xnor 	%r6, 0x0020, %r16
	.word 0xe4718008  ! 261: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0118008  ! 265: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa0b9a000  ! 266: XNORcc_I	xnorcc 	%r6, 0x0000, %r16
	.word 0xe0218008  ! 267: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec11a000  ! 271: LDUH_I	lduh	[%r6 + 0x0000], %r22
	.word 0xaa89a000  ! 272: ANDcc_I	andcc 	%r6, 0x0000, %r21
	.word 0xe8398008  ! 273: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec598008  ! 277: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa809a010  ! 278: AND_I	and 	%r6, 0x0010, %r20
	.word 0xe4298008  ! 279: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe801a028  ! 283: LDUW_I	lduw	[%r6 + 0x0028], %r20
	.word 0xaeb18008  ! 284: ORNcc_R	orncc 	%r6, %r8, %r23
	.word 0xe0298008  ! 285: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4098008  ! 289: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa4b18008  ! 290: ORNcc_R	orncc 	%r6, %r8, %r18
	.word 0xe8218008  ! 291: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec098008  ! 1: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa8098008  ! 2: AND_R	and 	%r6, %r8, %r20
	.word 0xe839a010  ! 3: STD_I	std	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe451a010  ! 7: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xa821a030  ! 8: SUB_I	sub 	%r6, 0x0030, %r20
	.word 0xe021a030  ! 9: STW_I	stw	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe049a030  ! 13: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xa491a008  ! 14: ORcc_I	orcc 	%r6, 0x0008, %r18
	.word 0xe421a000  ! 15: STW_I	stw	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe811a000  ! 19: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xa2998008  ! 20: XORcc_R	xorcc 	%r6, %r8, %r17
	.word 0xe4318008  ! 21: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8198008  ! 25: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xaa118008  ! 26: OR_R	or 	%r6, %r8, %r21
	.word 0xe4398008  ! 27: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe019a008  ! 31: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xa4a9a030  ! 32: ANDNcc_I	andncc 	%r6, 0x0030, %r18
	.word 0xe871a000  ! 33: STX_I	stx	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4418008  ! 37: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa6818008  ! 38: ADDcc_R	addcc 	%r6, %r8, %r19
	.word 0xe0218008  ! 39: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 43: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa8a98008  ! 44: ANDNcc_R	andncc 	%r6, %r8, %r20
	.word 0xe471a038  ! 45: STX_I	stx	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe011a038  ! 49: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xa0218008  ! 50: SUB_R	sub 	%r6, %r8, %r16
	.word 0xe031a000  ! 51: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe809a000  ! 55: LDUB_I	ldub	[%r6 + 0x0000], %r20
	.word 0xac198008  ! 56: XOR_R	xor 	%r6, %r8, %r22
	.word 0xe031a020  ! 57: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe441a020  ! 61: LDSW_I	ldsw	[%r6 + 0x0020], %r18
	.word 0xa6b1a038  ! 62: ORNcc_I	orncc 	%r6, 0x0038, %r19
	.word 0xe8298008  ! 63: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4598008  ! 67: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa289a010  ! 68: ANDcc_I	andcc 	%r6, 0x0010, %r17
	.word 0xe0718008  ! 69: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0518008  ! 73: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa241a030  ! 74: ADDC_I	addc 	%r6, 0x0030, %r17
	.word 0xe0298008  ! 75: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe011a030  ! 79: LDUH_I	lduh	[%r6 + 0x0030], %r16
	.word 0xa2998008  ! 80: XORcc_R	xorcc 	%r6, %r8, %r17
	.word 0xe0398008  ! 81: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec09a000  ! 85: LDUB_I	ldub	[%r6 + 0x0000], %r22
	.word 0xac99a018  ! 86: XORcc_I	xorcc 	%r6, 0x0018, %r22
	.word 0xe0398008  ! 87: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a018  ! 91: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xaca98008  ! 92: ANDNcc_R	andncc 	%r6, %r8, %r22
	.word 0xe8298008  ! 93: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe819a018  ! 97: LDD_I	ldd	[%r6 + 0x0018], %r20
	.word 0xa8b1a008  ! 98: SUBCcc_I	orncc 	%r6, 0x0008, %r20
	.word 0xe4298008  ! 99: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0498008  ! 103: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xac018008  ! 104: ADD_R	add 	%r6, %r8, %r22
	.word 0xe4218008  ! 105: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0418008  ! 109: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa081a010  ! 110: ADDcc_I	addcc 	%r6, 0x0010, %r16
	.word 0xe8218008  ! 111: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe851a010  ! 115: LDSH_I	ldsh	[%r6 + 0x0010], %r20
	.word 0xa8b98008  ! 116: XNORcc_R	xnorcc 	%r6, %r8, %r20
	.word 0xe8298008  ! 117: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec51a028  ! 121: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	.word 0xa6118008  ! 122: OR_R	or 	%r6, %r8, %r19
	.word 0xec39a020  ! 123: STD_I	std	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec498008  ! 127: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa8998008  ! 128: XORcc_R	xorcc 	%r6, %r8, %r20
	.word 0xec29a028  ! 129: STB_I	stb	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe009a028  ! 133: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xa8898008  ! 134: ANDcc_R	andcc 	%r6, %r8, %r20
	.word 0xe829a008  ! 135: STB_I	stb	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec018008  ! 139: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa819a018  ! 140: XOR_I	xor 	%r6, 0x0018, %r20
	.word 0xec29a008  ! 141: STB_I	stb	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8198008  ! 145: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa0818008  ! 146: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe831a038  ! 147: STH_I	sth	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0598008  ! 151: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa411a000  ! 152: OR_I	or 	%r6, 0x0000, %r18
	.word 0xe0398008  ! 153: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec418008  ! 157: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xae39a008  ! 158: XNOR_I	xnor 	%r6, 0x0008, %r23
	.word 0xe471a038  ! 159: STX_I	stx	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe801a038  ! 163: LDUW_I	lduw	[%r6 + 0x0038], %r20
	.word 0xa8218008  ! 164: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe4398008  ! 165: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe811a000  ! 169: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xaca9a020  ! 170: ANDNcc_I	andncc 	%r6, 0x0020, %r22
	.word 0xe0718008  ! 171: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 175: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa8398008  ! 176: XNOR_R	xnor 	%r6, %r8, %r20
	.word 0xec298008  ! 177: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec598008  ! 181: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa4c18008  ! 182: ADDCcc_R	addccc 	%r6, %r8, %r18
	.word 0xec31a000  ! 183: STH_I	sth	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4118008  ! 187: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xaea9a030  ! 188: ANDNcc_I	andncc 	%r6, 0x0030, %r23
	.word 0xe0298008  ! 189: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec59a010  ! 193: LDX_I	ldx	[%r6 + 0x0010], %r22
	.word 0xa4118008  ! 194: OR_R	or 	%r6, %r8, %r18
	.word 0xe031a018  ! 195: STH_I	sth	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe001a018  ! 199: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xacc1a028  ! 200: ADDCcc_I	addccc 	%r6, 0x0028, %r22
	.word 0xec71a038  ! 201: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec01a038  ! 205: LDUW_I	lduw	[%r6 + 0x0038], %r22
	.word 0xa6a1a010  ! 206: SUBcc_I	subcc 	%r6, 0x0010, %r19
	.word 0xec718008  ! 207: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 211: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa0a9a018  ! 212: ANDNcc_I	andncc 	%r6, 0x0018, %r16
	.word 0xe071a030  ! 213: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 217: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaac1a000  ! 218: ADDCcc_I	addccc 	%r6, 0x0000, %r21
	.word 0xe021a038  ! 219: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec598008  ! 223: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xac198008  ! 224: XOR_R	xor 	%r6, %r8, %r22
	.word 0xec398008  ! 225: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec01a000  ! 229: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xa039a018  ! 230: XNOR_I	xnor 	%r6, 0x0018, %r16
	.word 0xe431a030  ! 231: STH_I	sth	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa239a010  ! 236: XNOR_I	xnor 	%r6, 0x0010, %r17
	.word 0xe4318008  ! 237: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec49a010  ! 241: LDSB_I	ldsb	[%r6 + 0x0010], %r22
	.word 0xa0a98008  ! 242: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xe8218008  ! 243: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe011a000  ! 247: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xac918008  ! 248: ORcc_R	orcc 	%r6, %r8, %r22
	.word 0xe431a038  ! 249: STH_I	sth	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4498008  ! 253: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa4a1a038  ! 254: SUBcc_I	subcc 	%r6, 0x0038, %r18
	.word 0xec398008  ! 255: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec098008  ! 259: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa0818008  ! 260: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xe029a008  ! 261: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0598008  ! 265: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaa198008  ! 266: XOR_R	xor 	%r6, %r8, %r21
	.word 0xe039a000  ! 267: STD_I	std	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec198008  ! 271: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa8a1a030  ! 272: SUBcc_I	subcc 	%r6, 0x0030, %r20
	.word 0xe031a030  ! 273: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0018008  ! 277: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xacb1a028  ! 278: SUBCcc_I	orncc 	%r6, 0x0028, %r22
	.word 0xe0398008  ! 279: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a028  ! 283: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xac898008  ! 284: ANDcc_R	andcc 	%r6, %r8, %r22
	.word 0xec39a028  ! 285: STD_I	std	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0518008  ! 289: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xae418008  ! 290: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe4298008  ! 291: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4018008  ! 1: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa2c18008  ! 2: ADDCcc_R	addccc 	%r6, %r8, %r17
	.word 0xe029a010  ! 3: STB_I	stb	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe041a010  ! 7: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	.word 0xaa298008  ! 8: ANDN_R	andn 	%r6, %r8, %r21
	.word 0xe8218008  ! 9: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe841a030  ! 13: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xa211a000  ! 14: OR_I	or 	%r6, 0x0000, %r17
	.word 0xe0318008  ! 15: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8518008  ! 19: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa231a010  ! 20: SUBC_I	orn 	%r6, 0x0010, %r17
	.word 0xe0298008  ! 21: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8418008  ! 25: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa491a008  ! 26: ORcc_I	orcc 	%r6, 0x0008, %r18
	.word 0xe0218008  ! 27: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4018008  ! 31: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa4a9a000  ! 32: ANDNcc_I	andncc 	%r6, 0x0000, %r18
	.word 0xec21a000  ! 33: STW_I	stw	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe459a000  ! 37: LDX_I	ldx	[%r6 + 0x0000], %r18
	.word 0xae31a030  ! 38: SUBC_I	orn 	%r6, 0x0030, %r23
	.word 0xe831a030  ! 39: STH_I	sth	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe411a030  ! 43: LDUH_I	lduh	[%r6 + 0x0030], %r18
	.word 0xa229a038  ! 44: ANDN_I	andn 	%r6, 0x0038, %r17
	.word 0xe021a038  ! 45: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec418008  ! 49: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa0b9a000  ! 50: XNORcc_I	xnorcc 	%r6, 0x0000, %r16
	.word 0xec31a000  ! 51: STH_I	sth	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec51a000  ! 55: LDSH_I	ldsh	[%r6 + 0x0000], %r22
	.word 0xaa898008  ! 56: ANDcc_R	andcc 	%r6, %r8, %r21
	.word 0xe0218008  ! 57: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8518008  ! 61: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xae39a038  ! 62: XNOR_I	xnor 	%r6, 0x0038, %r23
	.word 0xe471a038  ! 63: STX_I	stx	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe009a038  ! 67: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xa6b1a028  ! 68: SUBCcc_I	orncc 	%r6, 0x0028, %r19
	.word 0xe029a028  ! 69: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe419a028  ! 73: LDD_I	ldd	[%r6 + 0x0028], %r18
	.word 0xa6418008  ! 74: ADDC_R	addc 	%r6, %r8, %r19
	.word 0xe0218008  ! 75: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0198008  ! 79: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa2918008  ! 80: ORcc_R	orcc 	%r6, %r8, %r17
	.word 0xe029a000  ! 81: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8118008  ! 85: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa2318008  ! 86: ORN_R	orn 	%r6, %r8, %r17
	.word 0xe8318008  ! 87: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec018008  ! 91: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa829a018  ! 92: ANDN_I	andn 	%r6, 0x0018, %r20
	.word 0xe029a018  ! 93: STB_I	stb	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4018008  ! 97: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xa2418008  ! 98: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe4218008  ! 99: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0098008  ! 103: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa2298008  ! 104: ANDN_R	andn 	%r6, %r8, %r17
	.word 0xe4318008  ! 105: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa2098008  ! 110: AND_R	and 	%r6, %r8, %r17
	.word 0xe021a010  ! 111: STW_I	stw	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8118008  ! 115: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa0398008  ! 116: XNOR_R	xnor 	%r6, %r8, %r16
	.word 0xe8398008  ! 117: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec51a028  ! 121: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	.word 0xaa81a020  ! 122: ADDcc_I	addcc 	%r6, 0x0020, %r21
	.word 0xe029a020  ! 123: STB_I	stb	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec19a020  ! 127: LDD_I	ldd	[%r6 + 0x0020], %r22
	.word 0xac298008  ! 128: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xe4298008  ! 129: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a028  ! 133: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xa081a008  ! 134: ADDcc_I	addcc 	%r6, 0x0008, %r16
	.word 0xe021a008  ! 135: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4098008  ! 139: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xae41a008  ! 140: ADDC_I	addc 	%r6, 0x0008, %r23
	.word 0xe029a008  ! 141: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec41a008  ! 145: LDSW_I	ldsw	[%r6 + 0x0008], %r22
	.word 0xa8218008  ! 146: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe021a038  ! 147: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0198008  ! 151: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xac21a008  ! 152: SUB_I	sub 	%r6, 0x0008, %r22
	.word 0xe029a008  ! 153: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe849a008  ! 157: LDSB_I	ldsb	[%r6 + 0x0008], %r20
	.word 0xaaa1a038  ! 158: SUBcc_I	subcc 	%r6, 0x0038, %r21
	.word 0xe029a038  ! 159: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0418008  ! 163: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa031a000  ! 164: SUBC_I	orn 	%r6, 0x0000, %r16
	.word 0xe0718008  ! 165: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0118008  ! 169: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa2018008  ! 170: ADD_R	add 	%r6, %r8, %r17
	.word 0xe439a020  ! 171: STD_I	std	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe019a020  ! 175: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xa0c18008  ! 176: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xec718008  ! 177: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe051a018  ! 181: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xac81a000  ! 182: ADDcc_I	addcc 	%r6, 0x0000, %r22
	.word 0xe029a000  ! 183: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa629a010  ! 188: ANDN_I	andn 	%r6, 0x0010, %r19
	.word 0xe0318008  ! 189: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec198008  ! 193: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa6a1a018  ! 194: SUBcc_I	subcc 	%r6, 0x0018, %r19
	.word 0xec21a018  ! 195: STW_I	stw	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe059a018  ! 199: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xa2a1a038  ! 200: SUBcc_I	subcc 	%r6, 0x0038, %r17
	.word 0xe8218008  ! 201: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe441a038  ! 205: LDSW_I	ldsw	[%r6 + 0x0038], %r18
	.word 0xa4198008  ! 206: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe4718008  ! 207: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe859a010  ! 211: LDX_I	ldx	[%r6 + 0x0010], %r20
	.word 0xa291a030  ! 212: ORcc_I	orcc 	%r6, 0x0030, %r17
	.word 0xec318008  ! 213: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0118008  ! 217: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xae29a038  ! 218: ANDN_I	andn 	%r6, 0x0038, %r23
	.word 0xe031a038  ! 219: STH_I	sth	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0198008  ! 223: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa481a000  ! 224: ADDcc_I	addcc 	%r6, 0x0000, %r18
	.word 0xe871a000  ! 225: STX_I	stx	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe441a000  ! 229: LDSW_I	ldsw	[%r6 + 0x0000], %r18
	.word 0xa431a030  ! 230: ORN_I	orn 	%r6, 0x0030, %r18
	.word 0xec29a030  ! 231: STB_I	stb	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe041a030  ! 235: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xa0198008  ! 236: XOR_R	xor 	%r6, %r8, %r16
	.word 0xe0298008  ! 237: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec19a010  ! 241: LDD_I	ldd	[%r6 + 0x0010], %r22
	.word 0xa6c1a000  ! 242: ADDCcc_I	addccc 	%r6, 0x0000, %r19
	.word 0xe031a000  ! 243: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0418008  ! 247: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa6318008  ! 248: ORN_R	orn 	%r6, %r8, %r19
	.word 0xec29a038  ! 249: STB_I	stb	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0018008  ! 253: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa4218008  ! 254: SUB_R	sub 	%r6, %r8, %r18
	.word 0xe8298008  ! 255: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe041a038  ! 259: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xae01a008  ! 260: ADD_I	add 	%r6, 0x0008, %r23
	.word 0xec21a008  ! 261: STW_I	stw	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4598008  ! 265: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa4418008  ! 266: ADDC_R	addc 	%r6, %r8, %r18
	.word 0xe029a000  ! 267: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe059a000  ! 271: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xa4818008  ! 272: ADDcc_R	addcc 	%r6, %r8, %r18
	.word 0xe0318008  ! 273: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe801a030  ! 277: LDUW_I	lduw	[%r6 + 0x0030], %r20
	.word 0xac418008  ! 278: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xe8718008  ! 279: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8018008  ! 283: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xacb18008  ! 284: ORNcc_R	orncc 	%r6, %r8, %r22
	.word 0xe4298008  ! 285: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe449a028  ! 289: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xae31a018  ! 290: ORN_I	orn 	%r6, 0x0018, %r23
	.word 0xe831a018  ! 291: STH_I	sth	%r20, [%r6 + 0x0018]
	setx	0x00000000d01ef028, %r1, %r6

join_lbl_0_0:



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************
.data
user_data_start:
	.skip 1000
user_data_end:

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
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base0
ncdata_base0:
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
	.xword	0xc12b67b9d7df57d4
	.xword	0xab2326eacf8d9250
	.xword	0x4ebb4b53cc1a03b4
	.xword	0x3a62d5cd580b18d1
	.xword	0xcbe81596735ff1a8
	.xword	0x413fe285a6cefb7d
	.xword	0x9591f95b012a53a5
	.xword	0x6d33b9b4d0547cb3
	.xword	0x4b0f50bf26a7917e
	.xword	0x54cb8cdff2d8d878
	.xword	0x34c3f25da97e2a03
	.xword	0x32bb137a5308f8d2
	.xword	0xef3f6a2192a22ef3
	.xword	0x0f05a662d2243312
	.xword	0x20b11da1b7ac351c
	.xword	0x328218fc91831acd
	.xword	0xac2a4eec9197d7c3
	.xword	0x8569777887451352
	.xword	0x2b7569f717109cf5
	.xword	0xfb02f1f507b4d916
	.xword	0x755f6fc33e4d37d3
	.xword	0x9f1037a3258164dd
	.xword	0x3b9d5f377ff8d082
	.xword	0x4d66a7c56e867533
	.xword	0x8aea18b87a70992a
	.xword	0x09938dd51903f3e2
	.xword	0x74bf8dc3ba280490
	.xword	0x3a0d7a5fdeca59d1
	.xword	0x45dabe1b3da0e387
	.xword	0x0f63b07cae43f2fb
	.xword	0xfcd78f669012eb2b
	.xword	0x316eae0bdbbb19d2
	.xword	0x8c9424696f096e40
	.xword	0x94579e7b39483ddc
	.xword	0x5e99b49a3a49af89
	.xword	0xfc6e9d375ae453e0
	.xword	0xf0ddc497ffe69be0
	.xword	0xcebe339eb6487d75
	.xword	0xb8ceee32678d2a57
	.xword	0x54b2132c8458a87d
	.xword	0xe9fa56b7c47f23d4
	.xword	0xc8b8d1fefc96800d
	.xword	0x648e8de95433c633
	.xword	0x3e7cd63f6987b9d3
	.xword	0x0edd41124daa16ee
	.xword	0x5414e8e5a3d6da75
	.xword	0x97644734f649565e
	.xword	0xbf49901db9943e5e
	.xword	0xaccf351683249e2c
	.xword	0xe4a2fcdd6bd2faa5
	.xword	0x251ba139f7b4ea2c
	.xword	0xae90360cc8cd3e78
	.xword	0x1ada36c1c0328199
	.xword	0x0d68cc44a4b746af
	.xword	0xd3630dd3ca8d9be2
	.xword	0xd4ee7be55a2a92ab
	.xword	0x5c650715f22c5fdf
	.xword	0xa2ac03f997df3bc7
	.xword	0xb9078bb7f03c3016
	.xword	0x6d9301257e3bacdb
	.xword	0xc5ee2e9b3dd17bac
	.xword	0x118e10e1725a6a8e
	.xword	0x06471725672f2891
	.xword	0x2abd4e885102fbc8
	.xword	0x8ddae1d8fd950257
	.xword	0xae73f51acdec6c1e
	.xword	0x5fd4d4057ce307e2
	.xword	0x9fe6ad5aa933d59f
	.xword	0x4f70544566602c02
	.xword	0x94d43e43899e357e
	.xword	0x7f41d8bad7a65d29
	.xword	0x8b15ed465f710d7f
	.xword	0xb9d51f6c6c8f8bdc
	.xword	0xe8656349d3d2d24f
	.xword	0xa95332599722b4be
	.xword	0x94a186cdcf78efc5
	.xword	0x1453b81aebb2e8d7
	.xword	0xf530b334ff88591e
	.xword	0x9489b859293f8d5a
	.xword	0x7988cf5b8d68e84b
	.xword	0x88d386f555935a3e
	.xword	0x2fd0dd0e88c160c3
	.xword	0xc17298629157ccaa
	.xword	0x2c1bc5aa892aad7d
	.xword	0xda86672d66b67d09
	.xword	0x1e8fe070909aec69
	.xword	0x12c8878cd9cbd83d
	.xword	0x974c05510afd1811
	.xword	0x25135e9b0e47b593
	.xword	0x52d90d0f43606aaa
	.xword	0xaac6884c673ea383
	.xword	0xb3e7f2ec4636dcf5
	.xword	0x1fe3d1770fef0c92
	.xword	0x640a247e60457d9c
	.xword	0x09c6c75a46854fd6
	.xword	0x49ca4888fe216acf
	.xword	0xe73f08c960b67832
	.xword	0xaae713919920e182
	.xword	0x2efc934552553145
	.xword	0xbd9bb3ab5a0d36f3
	.xword	0x3e291c7d6e5c46af
	.xword	0x97b557cf186c43ce
	.xword	0x27c1dbf2094a21f3
	.xword	0x61b620f275fc412e
	.xword	0xb1144acc834e6273
	.xword	0x9212d06b0fab7a32
	.xword	0x15b96203c5462c09
	.xword	0xfab1c81f60986237
	.xword	0x7f185505e0a52e01
	.xword	0x3985c8efcf70a77e
	.xword	0xd12c1d42c7d532b7
	.xword	0xac0096e6808656e5
	.xword	0x60f23befed97b7c6
	.xword	0x94de05195d420076
	.xword	0x79a0376c49e5e803
	.xword	0x8ee95a5621294036
	.xword	0x6c20540c24f49aac
	.xword	0xc407147d520e471a
	.xword	0x7fc92c1959c21402
	.xword	0x3a0fab4dbf5cf595
	.xword	0x009677277f70afa0
	.xword	0xdfa588eda0f492fc
	.xword	0x4d3530a5173a12cd
	.xword	0xc15fcd4aee1b8e64
	.xword	0x0a039e78070695b5
	.xword	0x1b7ae9301f25d9cf
	.xword	0xc72806a4f6595c56
	.xword	0xd684a115b5ddf7d8
	.xword	0x6ca1133eba4b61f9
	.xword	0x9b093289b89d5b3f
	.xword	0x2864ed7de2f2390a
	.xword	0x701a38991b69fe55
	.xword	0x368a050fd47ab345
	.xword	0x593ae60cf74d9d43
	.xword	0xf17d0c13d21c1fcc
	.xword	0xdc9f2bd3137af26a
	.xword	0xbefd353f52eac4bd
	.xword	0x46a0f6b8468c3c0b
	.xword	0x4e20e96452b04ec1
	.xword	0xbd0b19d379d99ed4
	.xword	0xac3b66eb7b9eca2b
	.xword	0xfdd5f58f265a6a61
	.xword	0x9817bc8e5c9735dd
	.xword	0x95d2082080cf1636
	.xword	0xaa359320726b598a
	.xword	0x8115bbbe6405143b
	.xword	0x2287f9727a39493a
	.xword	0x6273af7be5d9e1fb
	.xword	0x4fff76b4bbe99494
	.xword	0x5133324034c8ef63
	.xword	0x46a0396c161a888f
	.xword	0x33e5e2fafdbafab0
	.xword	0xe8daaa7bfb84986a
	.xword	0x929e1a9478c2d135
	.xword	0x786cba7a597af866
	.xword	0x49787bd1f952d9ff
	.xword	0x34a284203813651a
	.xword	0xf6cd5d1ee4951d9a
	.xword	0xa3376a6844622a1a
	.xword	0x0bd285db767201a3
	.xword	0x694d5e64be0405ae
	.xword	0x379fb8875b2f281d
	.xword	0xdb6dcb9647bcc55a
	.xword	0x2bf625f908d56a46
	.xword	0xa217973a5fe05f81
	.xword	0x44cbfd486bf27583
	.xword	0x4cef80de2177b596
	.xword	0xf7d46b01c0711389
	.xword	0x28a12ea2ca471cb3
	.xword	0xad3bbd266745cc4b
	.xword	0xafe12fca0ef06ea4
	.xword	0x659d4ab209cc5610
	.xword	0x0841274151edf7ad
	.xword	0xdaa073ec04c36dab
	.xword	0x4471d151c6ff5436
	.xword	0x262f6651f22d046e
	.xword	0x3509370d79d90648
	.xword	0xe4060d29ddbbe8ca
	.xword	0x573e4dd546eba157
	.xword	0xfe03facca4cd91ac
	.xword	0x207f21d0a7a2bec2
	.xword	0xc7059f721babba70
	.xword	0x1db68b431091c623
	.xword	0x1ba51b5519debd7a
	.xword	0xe2bf775a348e40fd
	.xword	0x88a4f7b9e797c4fa
	.xword	0xee71781cef0fc842
	.xword	0xa4cb5ad56a01878b
	.xword	0xdae6aab114cb43ff
	.xword	0x618d41a6bb4079f6
	.xword	0x2e30141ef1d0b100
	.xword	0x4f80b0283d1175d9
	.xword	0x761081fd4103d43f
	.xword	0x2f441d135c4e8b08
	.xword	0xc28b6167b2a825a8
	.xword	0x83cb11d8e861c96b
	.xword	0xa9ae30ac6d47104b
	.xword	0xc7a73d00741d1f54
	.xword	0x92b71cd053533884
	.xword	0xce9a19a3e32fb021
	.xword	0xd9340fd8b21ec398
	.xword	0x350e8d187523c666
	.xword	0xcf56f7e06cd61101
	.xword	0x7a6ebb686aa9b85e
	.xword	0x18c7010bb2cf58bb
	.xword	0x23014262823c3983
	.xword	0xccd5390ddaf74fa0
	.xword	0xe44bd638244aa374
	.xword	0xcae09e3fe9ca56b6
	.xword	0x3a838e4706f9a63b
	.xword	0x66a6090eb5dff852
	.xword	0x31ae19c4e5ad2d52
	.xword	0x8fe2b096b8e86b61
	.xword	0xaea5671f31680b02
	.xword	0x7b51abf44f6c030f
	.xword	0x23f33482be12d032
	.xword	0xb442ac0a38fe96f8
	.xword	0x736ed89eb0501e3a
	.xword	0x7f4cfa159e11c988
	.xword	0x68ef24f3982e70b8
	.xword	0x33f92101aaa8d194
	.xword	0x470077b2030ec3f5
	.xword	0x9f0cf77f6ad81cf9
	.xword	0x2bc3e3734a662a89
	.xword	0x39d66f2fffddba67
	.xword	0x0d1ed40756a1aaeb
	.xword	0x772b9da6a658d305
	.xword	0x2953b19f13b60730
	.xword	0xfef20ed2e6fe562d
	.xword	0x582207d9ad3f8b23
	.xword	0xed3a9a41aa0f73a2
	.xword	0xee8a5ea8c351266b
	.xword	0x14e38a58a70b3849
	.xword	0xf87ec3acffd301cc
	.xword	0xe3c74a29507e2a67
	.xword	0xf3d338e623147d1a
	.xword	0xbe5e8a16515b6512
	.xword	0x8d4f87338d5b7638
	.xword	0xa9d17e9524378401
	.xword	0xa1bfa51b8a37e3fe
	.xword	0x6bb38cf0499f08e7
	.xword	0x1f15dcadaa3121b4
	.xword	0x7e7a835d61729d9c
	.xword	0x13c4cd1011dcd919
	.xword	0x53f91af508ad4ae0
	.xword	0x9387e53da9161500
	.xword	0x6259d376e68f6f0d
	.xword	0x4e58050f37700eb5
	.xword	0x44e8b7a72f144aa0
	.xword	0x6e3ccfb16ab6aece
	.xword	0x06b3be2fbda346ee
	.xword	0x50f6ddfa945babaf
	.xword	0xe4e114676233d129
	.xword	0x0ac68c741b6bb31b
	.xword	0x60da2e8e1f5002c6
	.xword	0x8db93b63798d0699



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
	.xword	0xa9da8c7226afa468
	.xword	0x5fa0a11ff49781f3
	.xword	0xd6c33a332c54de3b
	.xword	0x1e1c4a6cf452ef9d
	.xword	0x67a84e03ca5392f4
	.xword	0x3654e4e1d579ad83
	.xword	0x27a5f750dd584da2
	.xword	0x23706c7f98573105
	.xword	0x845eb0762061ac14
	.xword	0x3ffc78c5192a4d4d
	.xword	0xceadc5705ccbe74e
	.xword	0x1135afea8a3329d4
	.xword	0xb2eb02b51352026e
	.xword	0xf18e8511afe3bb23
	.xword	0x1742ec750c4a45fb
	.xword	0xf7a798bff8812abf
	.xword	0x321b4bbf631498ba
	.xword	0xf4c462330c9f889c
	.xword	0x66de7aeb49b85f79
	.xword	0x930b28bcf6bd6568
	.xword	0xfa4157ab07177d3f
	.xword	0x566899ef8267e3d6
	.xword	0x1271c4bd2c52dea5
	.xword	0x8f9d9749d27ab830
	.xword	0x8c58ec9932ba51cc
	.xword	0xd8bb1b76f30dde61
	.xword	0x418fb8031a695502
	.xword	0x3ee846f5e2d4ccfc
	.xword	0xa5a415442a433066
	.xword	0x6042532f00292665
	.xword	0xb54337aae6ea035a
	.xword	0xdc9476bef65dca2f
	.xword	0x1b0188e578f0fa54
	.xword	0x5f0091a57d837313
	.xword	0x3774477387ee4e8a
	.xword	0x5af4aab307f4dcb5
	.xword	0x03895cf211c7d495
	.xword	0xcc810545b8a46b81
	.xword	0xae19a5f80781c6fa
	.xword	0x3ec8e7b53ba6f69e
	.xword	0x0e49100d94a7d444
	.xword	0x25504ce6a8eaa2aa
	.xword	0x25a6aadb25652283
	.xword	0xfcea4c9831051b4a
	.xword	0x13cbe38ebad90741
	.xword	0x9bc80159c4e1a0e0
	.xword	0xe9c683657924413e
	.xword	0x129fa27bb4fb6a76
	.xword	0x29a4fffb85acef9e
	.xword	0xde5b376950d2de2c
	.xword	0xc1625141af28c35c
	.xword	0x33eac5875823c844
	.xword	0x3c45fd1ddedc37e3
	.xword	0x627a73e1704e530f
	.xword	0x2294e7aa7b65fa96
	.xword	0x81d731636f677e5e
	.xword	0xbbe87b0c272a6e5e
	.xword	0xaa1b49a61d13afdc
	.xword	0x928777e76e75223d
	.xword	0x38c062ba8925e5ad
	.xword	0x2be3d6a633497f5e
	.xword	0xce20cae75468fa2a
	.xword	0x52f8084d89703f06
	.xword	0x96610ac8aaf4b766
	.xword	0x1afef6451e3b6980
	.xword	0x1a85422871b07854
	.xword	0xc8722d7e6f229196
	.xword	0xaef3c5ab6972bdad
	.xword	0xf1e518ef0377eaa5
	.xword	0xa4dadc9474d498ae
	.xword	0x0e35557d07cd5398
	.xword	0xa0c83c30c9a922c7
	.xword	0x3d91bf6565bc85a6
	.xword	0xd6c1a2a853e1b5dc
	.xword	0x1525193ad6e2591a
	.xword	0x3d2e60e8f0ef4f1b
	.xword	0x368b61943a54a8ce
	.xword	0x0d5f104c1f87f1ad
	.xword	0x974f54484e9f178a
	.xword	0xe81791bd6caa1506
	.xword	0xb6e3d4851ece188f
	.xword	0x8c61833ee939d7a8
	.xword	0x2e29607559de1906
	.xword	0xcc1e24b606b80246
	.xword	0x27bc2f06a88516b3
	.xword	0x9cbdae09be581a92
	.xword	0xc27ba1eb4bfb00ad
	.xword	0xea33ee484a71eb8f
	.xword	0x0cd418a811c4428a
	.xword	0xf5fc070e36f093f3
	.xword	0xe9a4aaaf2022f05c
	.xword	0x2ef5d1d7a94e79da
	.xword	0xa87760b42b59c974
	.xword	0x2dfd3bc3da84c6ef
	.xword	0xe910bfc59cc6e497
	.xword	0x0d9853ed7ecb4b89
	.xword	0x2ac563ae057bff00
	.xword	0x2148d69655410df2
	.xword	0xaadbe5e95f6934f3
	.xword	0x7d3eaab82af8f2f7
	.xword	0x256fc6eb672b21da
	.xword	0x889a640443af7407
	.xword	0xd84de1d9061de3d7
	.xword	0xa246f4ea788dccf5
	.xword	0x70adba8336d25ca6
	.xword	0x591583a341c1be6c
	.xword	0xce82b7cb4339ccd1
	.xword	0x8cc52c68967c252d
	.xword	0xb7c24c8caf4e26fd
	.xword	0xe777c39c57444fde
	.xword	0x1fdb26ed8a142d22
	.xword	0xfb9913d0b3fb2f4f
	.xword	0xdcc8e8365d21daf1
	.xword	0xcdfb06c59b78d7fd
	.xword	0x83479af4e2dcaaa0
	.xword	0x3d43478dcffc079d
	.xword	0x77f4962e346129e3
	.xword	0xbc796f80b9ee5211
	.xword	0x87ca6fcb45614ce2
	.xword	0xc5ad7105ab5eb9ed
	.xword	0x9fa59d7277741d96
	.xword	0x59fd44da2dfce32e
	.xword	0xd1ea156b3930c4b2
	.xword	0xda6ee3ff28d87069
	.xword	0x889c9f432653601e
	.xword	0x3643abcb2dce607c
	.xword	0x25f5d65bb9102604
	.xword	0xea75138e73c08354
	.xword	0x8bb630e37c2e88d4
	.xword	0xa265cc7e148e5eb5
	.xword	0xe7e6923beec45c1a
	.xword	0x60459420eda260aa
	.xword	0xa4121cc095d003e9
	.xword	0x345d3b538493b26a
	.xword	0xf360a7d9fe6885d1
	.xword	0x38efb7fdd64b6c36
	.xword	0x23bc8f4c895b2103
	.xword	0x32eebd828049792d
	.xword	0xc81eec8dfbb16df9
	.xword	0xe1a4ab2c26e07310
	.xword	0x05eaee1c7c3ddb39
	.xword	0xe02714525568878b
	.xword	0x40ee48269094de85
	.xword	0xcff2170d3f14661b
	.xword	0xb65a217cb0a653db
	.xword	0x901e5454eab879fe
	.xword	0x9d479fe026c232c8
	.xword	0xe6af6bf4bc2b05ac
	.xword	0x23243fb10b35ebe5
	.xword	0x2c04c463572100f6
	.xword	0x5fb5a44d458181fa
	.xword	0x39c94e015490a8c1
	.xword	0x6554679bf66d0e3c
	.xword	0xd8300b1a7337a411
	.xword	0xb37272c001e23fcc
	.xword	0x459f0021185c15d3
	.xword	0x34f990182530eaba
	.xword	0x04627a85ff4b3a5f
	.xword	0x36b6f9c1c49189cd
	.xword	0xbd5c88ebdd9a7868
	.xword	0x294ab775ec645933
	.xword	0x67a4266eaa6c71b4
	.xword	0xca370d838709bf17
	.xword	0xf81513d02c0d7acf
	.xword	0x7ae15f167d740df2
	.xword	0x47be4b35c375d6b3
	.xword	0x1dbbf1d368e259c5
	.xword	0x741d5c0030144438
	.xword	0x74ae777580455656
	.xword	0x1818eae566e521e5
	.xword	0x20a4af22ab8936b3
	.xword	0x999774cec18e8bd4
	.xword	0x2775edcf977b6caa
	.xword	0xd3fa924e916c1cd8
	.xword	0xb4827bbc6f1dd2b6
	.xword	0x5ec96fea341d90ec
	.xword	0xbb9794e22edbe1dd
	.xword	0xb57b49343fd2eeb1
	.xword	0xc2100c379534f048
	.xword	0x6c115da365f4a5a2
	.xword	0xa7cc8ecf4770b495
	.xword	0xed0227079675d024
	.xword	0x8082407bfd12cf86
	.xword	0x115521de2757c264
	.xword	0x34bb6a48a2e89654
	.xword	0xf322af85a0a2043c
	.xword	0x2af6436087d97adc
	.xword	0xcdcabbe93f05b7df
	.xword	0xc054e32dacf92aa9
	.xword	0x22b8e31f2855128b
	.xword	0x0301304ea617ae22
	.xword	0x16ebbf96d07992e7
	.xword	0x815009575a3114d6
	.xword	0xae994b4f154f5116
	.xword	0x51bdd302bfb94b08
	.xword	0xe45babf47d2e347f
	.xword	0x20dba77f80cb3c00
	.xword	0x7f5022af16cf1352
	.xword	0x6d424bf4135d674b
	.xword	0xc25e570dd52fdee3
	.xword	0x60600d6fc3f55661
	.xword	0xa270547d20b3d1f9
	.xword	0x0e371012e198d1e5
	.xword	0x85f8eba424806105
	.xword	0x54472137c2393ca8
	.xword	0x91bd607de871876c
	.xword	0x62feba28b7578dc2
	.xword	0x64a9a35e22edf513
	.xword	0x0d6857a9b9c23414
	.xword	0x33822e4b2df0729b
	.xword	0xfe6c11c3d70a459b
	.xword	0x4c73dc4feba09fe4
	.xword	0x10cc39aca1591fe7
	.xword	0x4c3e82f13c0b5b39
	.xword	0x2be011e619b7b366
	.xword	0xb084ab1e56a0bb1d
	.xword	0x566564429a346ea6
	.xword	0xa8a671835c6766aa
	.xword	0x9a418d702d6095dc
	.xword	0x727aa9f67d574d5f
	.xword	0xa84a4847232c8527
	.xword	0x859edff29c683c93
	.xword	0x9d469bca32b89f5d
	.xword	0xa213802b53aafc76
	.xword	0x93e82f88ad09e8d1
	.xword	0xfc6dcd5869b9dc85
	.xword	0x3f1abf1d16a0346d
	.xword	0x28e9e96a7f1415d7
	.xword	0xe7c2df49abf94738
	.xword	0xe2f7b39f0d74f242
	.xword	0x62142e652963ec62
	.xword	0x552911fbefc7f575
	.xword	0xf31083388416c595
	.xword	0x1e1278478b27e504
	.xword	0x19121a7140460b16
	.xword	0x43f589c1aba53326
	.xword	0x74ee8b1f50de12bd
	.xword	0x8e935bed53ec381c
	.xword	0xa96be2c93497e4df
	.xword	0xc842eb16e7d71389
	.xword	0xfc88d176fb4e18d9
	.xword	0x85ac45300cf3e360
	.xword	0xf49ad20492e6c32b
	.xword	0x612868fa1e2d9884
	.xword	0xac31addec92ce5d3
	.xword	0x8a552ca608fccb1a
	.xword	0x3ebd06bfd4f08d9a
	.xword	0xf1698cc91d77a8af
	.xword	0x4d5f5d202563d0b0
	.xword	0x00b576df20d8715b
	.xword	0x8c7676b052034c2d
	.xword	0x79fa9ab512c23a6f
	.xword	0xb67414ced89c3aef
	.xword	0x301f5ec1dbe91571
	.xword	0x251ba9cb0467585f
	.xword	0x1abd5170f2897361



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
	.xword	0x9a8ab85ba8d9ad97
	.xword	0x76c045f7fa0cff24
	.xword	0x6355db29390dd122
	.xword	0xf900a5b346eb2957
	.xword	0x31f39220ed95050f
	.xword	0x479984c78fa40aa2
	.xword	0x4e8a2bb8ad234f58
	.xword	0x71fa86e010a5c68a
	.xword	0xd4df320883a17e2b
	.xword	0x551b050b8b417865
	.xword	0xd148f3588a594c84
	.xword	0x78470a102c101269
	.xword	0xa84c49a233151d8b
	.xword	0x04755f99e4e42770
	.xword	0x1f9887c46821de1e
	.xword	0x2576cf90ca167078
	.xword	0xbbdb6bdfbe949f8e
	.xword	0x436eb186ad0f4105
	.xword	0x1ae33d2531b706b9
	.xword	0x77ef1f0408b10e7f
	.xword	0x36d4a79393c4419e
	.xword	0x49a9762bf98cbe1a
	.xword	0x19b352831efa60ab
	.xword	0xbba70aaccab4f441
	.xword	0xef6384f5353916fd
	.xword	0x38412c9ffc79cfd2
	.xword	0xf5cdf4e96216b24f
	.xword	0x33a6161569e8e543
	.xword	0x1be8c0626e49aea6
	.xword	0xff420e48349d8b8d
	.xword	0x93c32c85d29c3e42
	.xword	0x34bbea0061680dfc
	.xword	0x7191568e57a39788
	.xword	0x1a7e918cec8bf2d5
	.xword	0x13c7d1c9e2e1c610
	.xword	0x8f85726d80789cd8
	.xword	0x98840bba1f022a72
	.xword	0xf0cdd0bf471ec2d2
	.xword	0x71f62597234912bb
	.xword	0x8986d84d436b09f7
	.xword	0xe3a97943aee1e45c
	.xword	0x5d65008408822387
	.xword	0xbcdaaed609fbe4f0
	.xword	0x91f5e83eb8b1d698
	.xword	0xc969f17ef5b1d60a
	.xword	0x89e98ca4860e8cc0
	.xword	0x32763b720b79184e
	.xword	0x7f1343b6d5da08a2
	.xword	0x0001244d0cb3ac9b
	.xword	0x104320523df2e2f2
	.xword	0x1b6c405a15819716
	.xword	0x461c12ad1ae0a519
	.xword	0x5b697e5d4f3f93e4
	.xword	0x881b626a0e997445
	.xword	0xbf58d23deb18d106
	.xword	0xfa6f7b7b6a603294
	.xword	0x2648895f901463ec
	.xword	0xc73485439cf5123f
	.xword	0xd54d32ae249dd652
	.xword	0x5f7b9c22077b956f
	.xword	0x743f823b0bac6520
	.xword	0xa6842e7644a64290
	.xword	0xd9939dedfbabf002
	.xword	0x06cd4276b728d91a
	.xword	0xa1b8b9e75e3ff446
	.xword	0x1cc94a91be1a42ea
	.xword	0x3616ef433eb61b7b
	.xword	0x969d741d68b9f95e
	.xword	0x2eb627983083fff3
	.xword	0x72d854f4fd5a618f
	.xword	0xa5d7482544b635d8
	.xword	0xbe815cfacf4f72e2
	.xword	0x26488db82f2b2474
	.xword	0x4c472318319092d1
	.xword	0xc4826684ef1e645b
	.xword	0x2cebac42ac17b7cb
	.xword	0xb993240d798086e2
	.xword	0xa1a8fdf35f7215a0
	.xword	0xf5e200c7c74f6fe2
	.xword	0x79b0bd92987e2f38
	.xword	0x61438291219d454c
	.xword	0xc7ab51a2c183ab3d
	.xword	0xcfa11177520eb81a
	.xword	0x1bff9fd4a0bdce54
	.xword	0x81e4720111f0abc4
	.xword	0x68ce9669ca977252
	.xword	0xb5ef38cca9703fb6
	.xword	0x13dde7c1f90261e9
	.xword	0xe1bb7a3e95192825
	.xword	0x0f17b984ca64697a
	.xword	0xa5e2d0623b5d630f
	.xword	0xcd7c98ab49c289b0
	.xword	0xabd334e7d638d273
	.xword	0x61935b546e12c95f
	.xword	0x955444a776cff49e
	.xword	0x1958ca96a09a5cba
	.xword	0x8c84b3adf7d14de5
	.xword	0x11d2c85ce22072c1
	.xword	0xe1bfe65febdf6ee2
	.xword	0x31226da4acff8b2b
	.xword	0xc0cfaaf26e94547b
	.xword	0xdc254b55b26bcf93
	.xword	0x7b0c91a6b6d4d671
	.xword	0xd6ac869a3dbaea5b
	.xword	0x39e056810a8a7fc2
	.xword	0xe4debc26a30b322c
	.xword	0xdfb1df243e0f4485
	.xword	0x553cd91eb0f3bf52
	.xword	0x7dac8d9be935bfe9
	.xword	0xb0a2a3a9a6197290
	.xword	0x7f04789f75b33663
	.xword	0x6d3cb8c5b4beef26
	.xword	0x59e04cc8fefce3fa
	.xword	0xd32ab4d0d8d801fd
	.xword	0x2f2b9293445c67b7
	.xword	0x5969c7fdfcbb7961
	.xword	0x53cc902a55f1c79a
	.xword	0xce07780df6d50e64
	.xword	0x8bef107637e19335
	.xword	0xfad9eb1d0f68fce6
	.xword	0xdffc0d15dc845aa7
	.xword	0xa6a7695aafe8e7f3
	.xword	0x44f239fd71bef2a2
	.xword	0xde077001873ad2bd
	.xword	0xd9ad7138f0f09a1e
	.xword	0xf6eb5ca6b6dafff7
	.xword	0x9c8d38bfe2b24a88
	.xword	0xc8e17812e4d69143
	.xword	0xd820f694da400080
	.xword	0x581fb6464443c467
	.xword	0x916a16f0c9f783c8
	.xword	0xd97cc4e90e796975
	.xword	0x9ab5af918b49baf5
	.xword	0x5e2eac2243489167
	.xword	0xd29b7a97c3d75652
	.xword	0xbd352c4ba33abeb9
	.xword	0x90eb910d138a38df
	.xword	0xd672fdb9ac47649d
	.xword	0x10edee73edc88b7b
	.xword	0xff72b94b8c7d3857
	.xword	0x50ad8f10358329d1
	.xword	0x65fd9775600f2252
	.xword	0xb2ae043a750f6e22
	.xword	0x5e31b6a2ce9f78ce
	.xword	0xbbe0168bf96aea88
	.xword	0x48f030867e98cc03
	.xword	0x432bdadcc0d3bddd
	.xword	0xf816326093026c52
	.xword	0xd8c4774aa222f0af
	.xword	0x174e442f453362c2
	.xword	0x413a07e0ffe7d7ab
	.xword	0xb5ea58f4c07b61cb
	.xword	0x4adb45ac1363bc56
	.xword	0x6968a415541e823d
	.xword	0xe3cfd7c876f50fdb
	.xword	0x2ac53f684bca9f7e
	.xword	0xd4c3d3342be6fa71
	.xword	0x7d9f053b1baa0ccd
	.xword	0xbffb5cc97733d9da
	.xword	0x748471e5c9fce1c1
	.xword	0xe4395f0971471817
	.xword	0x80d63891c52436e7
	.xword	0x5688ad89c9278a4c
	.xword	0x382fd72df93815cf
	.xword	0x520800cee86139fa
	.xword	0xf3a8cb230470bb4a
	.xword	0xc6110ce7d3b9febd
	.xword	0xa1621e82bab080de
	.xword	0x024015b1f0d74995
	.xword	0x503df9e1de412c38
	.xword	0xa6de62ca72c0742a
	.xword	0x2a76b5fd78229ec5
	.xword	0x6468864adc95dd8e
	.xword	0xbb90b785ff35cd4a
	.xword	0xe98d0b0fcbeeb6c2
	.xword	0x9fb085e43f1cc299
	.xword	0x3ccae38db906b4be
	.xword	0x4e74c02f5ad932a9
	.xword	0x5c908063c92177e3
	.xword	0xbe2e1405cb4b70c1
	.xword	0x9f4208a42f294232
	.xword	0x45f0048ea4ca1af2
	.xword	0x19cc17a7c54a2c50
	.xword	0x15e90337c50a2dae
	.xword	0x46564afcc6bdf788
	.xword	0xa3e335d9057f5675
	.xword	0x6aa8f507d37d1b02
	.xword	0x96ae7c1d24e5a4c0
	.xword	0xf68f721250e5d81c
	.xword	0x8fd70af4662e6d6b
	.xword	0x2ae19e7047ad0852
	.xword	0x8bfdaccb4d725746
	.xword	0xd04794ee1e5e1a69
	.xword	0x252e109c63faa11c
	.xword	0x79ff8972e0c8b4c7
	.xword	0x1e30c2e2465ebb01
	.xword	0x67e90ad22db64c63
	.xword	0xcbcf7fb5069e747d
	.xword	0x0e0cfe65b5110a41
	.xword	0xe5de89fcbc2851ac
	.xword	0x984007d375d94f23
	.xword	0x5d992223c6298e52
	.xword	0x4c3e4838fb85d3d5
	.xword	0x09be370be7367100
	.xword	0x504c18a99599beba
	.xword	0x8cb4527c308ae303
	.xword	0x6a9552a5c8d17cac
	.xword	0xad4d36041b8f46ae
	.xword	0x3073b446da17d506
	.xword	0x041a8f32616e6101
	.xword	0x37877b312c2b6433
	.xword	0x3348886b782b5575
	.xword	0x792188f21707ecf0
	.xword	0x33a5857f5955d13b
	.xword	0xb20dcd53497e41a3
	.xword	0xff74272df641c78a
	.xword	0x8ba446d301c06564
	.xword	0x16143fc7d6bffaf7
	.xword	0x112bbe4f5efaab28
	.xword	0x503c702561babebd
	.xword	0xe221dd48f1d1599e
	.xword	0xaa1da2979a19a215
	.xword	0x8c3907b7de5403d9
	.xword	0x9a2074eb8a67295f
	.xword	0x2faa7ebe6e70d622
	.xword	0xf4380a28bdf0e94e
	.xword	0xeac17cca2272a1ae
	.xword	0x00fad5ee88c917d9
	.xword	0x88c6821cb54a0719
	.xword	0x5aabf5ca219c15d3
	.xword	0x01421f66f2cff6bb
	.xword	0xbaa013e9dc1d4988
	.xword	0xed283b87c3b3fdeb
	.xword	0x44a86ba91a5dcb3e
	.xword	0x2d2b164752d3dce2
	.xword	0xda9dce4521359023
	.xword	0x19d9aafec1bffa55
	.xword	0xe1e8fd25d261087f
	.xword	0x4429ba58820212c5
	.xword	0x15817fef804a3588
	.xword	0xaf8a9f17a3d8c785
	.xword	0xece5600265b37d5a
	.xword	0x1fdb478a52338ead
	.xword	0xe04e963d9e812601
	.xword	0x7619b1b4585ef9cb
	.xword	0xe20a00588cbecc96
	.xword	0xbc8e5c21663d0827
	.xword	0x8f122504d260e789
	.xword	0x4dd772d47e72d39b
	.xword	0x31e16c18c34c6810
	.xword	0xdd6359d1d391d7de
	.xword	0x9f2dd827e8117f2b
	.xword	0xa4fe328332762f22
	.xword	0x673fd08bf8786823
	.xword	0xc8d7daf5368b96fb
	.xword	0x935f14f9de02b559



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
	.xword	0x5564a5cb3962c3dc
	.xword	0x09890e4f36b39c7e
	.xword	0x6502a2d570abf86c
	.xword	0x0343e8deed51ac22
	.xword	0x1b87db184b069a77
	.xword	0xd48e5dd33cdee533
	.xword	0x25cd78122012ead6
	.xword	0x7a24cd8bd92469b1
	.xword	0x8356fc4be8e23fbc
	.xword	0x0c9aa632256625d1
	.xword	0xeeec59dc5e9e241a
	.xword	0xb9c8d862f2966a5a
	.xword	0x2d1b0c4eef968601
	.xword	0x8ae6b6843e31a4df
	.xword	0x8e4e218a89d52a57
	.xword	0xba36d86c11d5d36c
	.xword	0xa3cba5a1ebf55d55
	.xword	0xaf5010c69b17a8fe
	.xword	0x278e8008952bb5bd
	.xword	0xfd2717de97243a97
	.xword	0x344afe0d757b6363
	.xword	0x87a38c29b768897c
	.xword	0xc4aacb8a905eccb8
	.xword	0xa75f3a80ef9245d6
	.xword	0x22c5166f0c44d922
	.xword	0x92684f0db517ff3b
	.xword	0x63670c3ef9d038ee
	.xword	0x43279f7e5a61a3fe
	.xword	0x0b2fba433ce930eb
	.xword	0xd1c28d98f52cd51f
	.xword	0xc8110d5ad5bd0e09
	.xword	0xe03e5711eccc6f2d
	.xword	0x76aea49abfc23fb2
	.xword	0x975040e1b8bc7b72
	.xword	0xa8f275b205d7d35e
	.xword	0xa9dba03ffc9f0cb2
	.xword	0x9f1f6387e7ec3702
	.xword	0x51811affb857a824
	.xword	0x671d90b39a80cd03
	.xword	0x1f505dc7e135abdf
	.xword	0xc1f13207fb0c0281
	.xword	0xefccfd0d15ec309b
	.xword	0x520861dbe48dddff
	.xword	0xf04d58f1408c14f0
	.xword	0xc091ac71db7c45de
	.xword	0xcf95a3ab898141f0
	.xword	0xfe65e1ea08e3fd69
	.xword	0x20b33d6de51ec774
	.xword	0x5209a84c69c54374
	.xword	0x649454aa9a80e71b
	.xword	0x266fea38c3f4f91c
	.xword	0xbffbca7149608135
	.xword	0x2f4d7679b6406184
	.xword	0x7dbee2089af77bbd
	.xword	0xa1ac4d712ca5d4f0
	.xword	0x77a7c8d4eb1de5ff
	.xword	0xca618d3a4fc5acac
	.xword	0xbbed0d3e30c74d0a
	.xword	0x756cae2a545864aa
	.xword	0x8827ce3df3eb1329
	.xword	0x74d6c6e736b6f5fc
	.xword	0x8ea19fa75173a108
	.xword	0x37adbc2f5e7274b4
	.xword	0x7433275dee64781c
	.xword	0xf2ad3b24cd8bca76
	.xword	0x0b9864cc4109e56e
	.xword	0xcba5b38bf01f0ea7
	.xword	0x0b46215d4e508917
	.xword	0x0ad83cfdf6ba83c6
	.xword	0x78ce28c10b0d293b
	.xword	0xe975cbe771e21ea1
	.xword	0xe69be253768446d2
	.xword	0x2507bb5a15a76bef
	.xword	0xc05660a3f4cca79d
	.xword	0x7fc530eb492eaecb
	.xword	0x1692f199be586784
	.xword	0xf772b07065615497
	.xword	0x8ec061738ed2f689
	.xword	0x04d1877a0b864c17
	.xword	0xfdcb6dc1e0fb70d6
	.xword	0x5955d1f6bc3a863c
	.xword	0xb174fca3161710fa
	.xword	0x9fbec6047c95051a
	.xword	0xb16d3158eae06b9d
	.xword	0xc5ccdb7d24aaf941
	.xword	0xbbbaa1e924ebc0f9
	.xword	0xaee1fd0fc008599f
	.xword	0xa17276ce09d9d2bf
	.xword	0x57789dcaaf58fac2
	.xword	0xde65e149a6d91301
	.xword	0x71792d738e955eb0
	.xword	0xbe9aa19004ed7dbd
	.xword	0x342e721d3ecb4046
	.xword	0x3d47c98f2c2082b8
	.xword	0x175ea04bb48de0df
	.xword	0xc3ad2b61b0e040a3
	.xword	0x9f3f7936164d2b6a
	.xword	0xb9549b83ebf3cdf0
	.xword	0x18417395d701fc3f
	.xword	0xb5d15c626273e541
	.xword	0xea9ac41e3f9ab0f4
	.xword	0x38bc64a007a4e432
	.xword	0x3d70e71898012ccc
	.xword	0xec79bb5211661f7b
	.xword	0x28ffa9deff9f6f88
	.xword	0x99f8de81a48ac989
	.xword	0x499fa90961344d46
	.xword	0x3fe2c09c7c2932c3
	.xword	0xde6c104da0521aab
	.xword	0x2fd853ec2e5f3bc5
	.xword	0x3db74d4c56248423
	.xword	0x7605bc92e65fbd91
	.xword	0xeda0ffdba1bcfe4b
	.xword	0xe17406ea181b13d0
	.xword	0x5a9d3f6cfcb08569
	.xword	0x4349d617cf437c20
	.xword	0x56a3a86d852666ec
	.xword	0x529010d9d37bb4b4
	.xword	0x91234339a2e0f6f8
	.xword	0xd31ae4273c00c7d5
	.xword	0xc92ba144d754a0f2
	.xword	0x84aac5a5368f7fa8
	.xword	0xd5a9a333a6031d2b
	.xword	0xd6a92458e16940a0
	.xword	0x3b6b7329dd862fb6
	.xword	0xf71f3215073be275
	.xword	0xcbedfd3c357dacce
	.xword	0x3e970d3910c4af3d
	.xword	0xe15eced5dc0d7558
	.xword	0xb4d05c1ab52b4c57
	.xword	0xdfba1d5af0ad88d1
	.xword	0x80303beaf379b45d
	.xword	0x65660bea0552ebb4
	.xword	0xd7252085699f9017
	.xword	0xe22802fab8e39c5d
	.xword	0xe6ac60b4116b0e4f
	.xword	0xa66c1fdaf2680761
	.xword	0xe11d2d3eb3dc45e1
	.xword	0x9598a51c3dfa21b8
	.xword	0xc51daf89d9148998
	.xword	0x5bd8b2caf929417d
	.xword	0x84967a7b10f94697
	.xword	0x81b05170cc7e9507
	.xword	0xf3d2bba30f07f1c4
	.xword	0x90d5fe0eb9374f5b
	.xword	0x1a4fe634cd8801a3
	.xword	0x9c88717eed001274
	.xword	0x17f20d4fcb1061fb
	.xword	0xe7bfea61916aa401
	.xword	0x8e5be750fc729ef6
	.xword	0x6a9003b89410f78b
	.xword	0xb4d2fe99f059e557
	.xword	0xbf5cd3ae82ac8a26
	.xword	0x19ccc251d128e8cd
	.xword	0x38cfb8a1a859d10c
	.xword	0xdef902db44938efb
	.xword	0xba9f5d51ef0556e0
	.xword	0xb6029627d9653dbd
	.xword	0xb4b7776d7e290179
	.xword	0x03c3b7b045fa7ca1
	.xword	0x9eaa4d263ceb1947
	.xword	0x6448ddc0b95eb314
	.xword	0x20a602d7c2eec204
	.xword	0xe09624bf0f98e385
	.xword	0x0ff1b6d55260728e
	.xword	0xcf05d4a6e1307a92
	.xword	0x8a480cc6c946d2de
	.xword	0x986800b8a70ca5a4
	.xword	0x504fab917448061a
	.xword	0x93310bc0dc91a722
	.xword	0xfddb02a806dc4f39
	.xword	0x3c470b8a309d7d9c
	.xword	0x28f5842ea15ee587
	.xword	0x2a724853cb1f8484
	.xword	0x2bdada4b2c193116
	.xword	0x8d868910fdaf7df2
	.xword	0x503d95fcc3f693b5
	.xword	0xf8ca637e0e54b7de
	.xword	0x249da3836d05f01a
	.xword	0x26ab6ffa87a5e7e6
	.xword	0x660873e1792c99e7
	.xword	0xe39822a4db94c67f
	.xword	0x43f574ffbaacf0f0
	.xword	0x0cbf05700bcad49a
	.xword	0xe031a9138f45012d
	.xword	0x5a23f04c4b419de7
	.xword	0x8b0222f9f76f8d60
	.xword	0x43449189076c1c13
	.xword	0x4b9f08ddabcee013
	.xword	0xa797dab50b1efc8f
	.xword	0x1fbf3f5ddd4dc257
	.xword	0xf3659ee2dde0bb5c
	.xword	0x9cbabcfe289767c7
	.xword	0x7b978313d146c8ec
	.xword	0x5390d5f2f1db4cda
	.xword	0xeb723f535cbeaefd
	.xword	0x0df2b16b99b6411c
	.xword	0xa38a90faa744729f
	.xword	0x0b35392b26de66eb
	.xword	0x7576dda0ef08c567
	.xword	0x16802f007c4a79aa
	.xword	0xb714ad3528c328e6
	.xword	0x1507e55bd91056b8
	.xword	0x73a0002ae8c8442e
	.xword	0x4c9dd254c205f9d5
	.xword	0xea2b11ce95ff6793
	.xword	0x07805910b2dea8e6
	.xword	0xef9cd5be0196647d
	.xword	0xcc586b4ff3172ddc
	.xword	0x660619d6dba27825
	.xword	0xa6ffff3dfdb76744
	.xword	0x2471537052c9b9a5
	.xword	0x1911173ceb07d0ba
	.xword	0x62e280d1f73c624b
	.xword	0xce53f1a606567ca6
	.xword	0x6c8b7377bf8a1bfb
	.xword	0xbb6f61065dee83d1
	.xword	0xaa0c219da6acd6f1
	.xword	0x62cf97b57948323b
	.xword	0x8683855fb9090135
	.xword	0xa158cd4f6af9c638
	.xword	0xdfb366f1c5d01dcc
	.xword	0x1e22aa456cf937ba
	.xword	0x33a3f0cdb84ec398
	.xword	0xcfb91285bd432a88
	.xword	0xcbadb7f20a62daab
	.xword	0x61f8d6f45773d0d4
	.xword	0x91c3ea25dfc8f526
	.xword	0x4b4215082c4efaea
	.xword	0x141d2b959f6dafc4
	.xword	0x5660b2a30563a198
	.xword	0x916dd1fbe04ac931
	.xword	0xda85a407c6e67da5
	.xword	0x1e6096fb2367cef8
	.xword	0x6694d81cb15266fd
	.xword	0xb9eb8b180932328d
	.xword	0x16365105d37954e9
	.xword	0xddbbe6a7718114ef
	.xword	0x28fe329dc85404c2
	.xword	0x2253c08e76b9a292
	.xword	0x483f1948141f89d4
	.xword	0x0044963f9bba6312
	.xword	0xa4216391c9f3fee2
	.xword	0x68154be6fd862fff
	.xword	0x05ea648836c47e0d
	.xword	0x7841261ddafd6b82
	.xword	0x05f895e7d347d015
	.xword	0x52228b4729d831b2
	.xword	0xeba9ec1ca0c0799d
	.xword	0x5fa7ea2b14644771
	.xword	0xa5804535c53da343
	.xword	0xcb2f0ed15de4f599
	.xword	0xe8950c4eaac4fc10
	.xword	0xc38c30f9994f3520
	.xword	0xcb85f1cf28fe13cf
	.xword	0x92dc5936a620b14a



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
	.xword	0xc91c50d092b1a39c
	.xword	0x19fc10de449f1c6f
	.xword	0x366b9deb151e58b8
	.xword	0x79e8d2b64e503e71
	.xword	0x1b5505a4fd85a93c
	.xword	0xa7ef8897e221b66c
	.xword	0x0f8e7efd8b7bfb98
	.xword	0xe19bda6a5dc31aee
	.xword	0x43c91a713d6f0aaa
	.xword	0xc871538e6071ab5b
	.xword	0x92ef769e625c3425
	.xword	0xd7ff0fc5fbda5962
	.xword	0x9a2636d43b771c74
	.xword	0xe8b0b83ef019f44e
	.xword	0x830ced305d8e24ee
	.xword	0x7ddba653a25c8c08
	.xword	0x8198efc57137f4ae
	.xword	0x299059ce29b20b94
	.xword	0x7cabb5c054aad63a
	.xword	0xf2fb3b72728c32e6
	.xword	0x5dcf17c9097869d3
	.xword	0x905ea7ced1661a67
	.xword	0xa680f0d8f2dd923f
	.xword	0x6597f3fa6c988fdd
	.xword	0x006e295e82d5333b
	.xword	0x9fbf7761399ddea2
	.xword	0x41cbc817f6fc46e3
	.xword	0xf6f48df7564aac97
	.xword	0x2f4c4c1d0f82d60e
	.xword	0x90c43637e2edeb26
	.xword	0x307dd6c80db52b7b
	.xword	0xc67c2a3285658a0a
	.xword	0x18d70d9b683bff17
	.xword	0x3ef469fd0403ed8e
	.xword	0x02a667dc366f5e18
	.xword	0x82ed249eba88225a
	.xword	0x76373bb507216ead
	.xword	0x87ee6d739fb4edaa
	.xword	0xb65e9050f4f73aa7
	.xword	0x653334cb9912c1ad
	.xword	0xef4d300cc12665d7
	.xword	0x589b5416387299a0
	.xword	0xcf5d734b550a73c3
	.xword	0xb29e281746862f43
	.xword	0x8ff879448888c3c3
	.xword	0x24c08557ecac3214
	.xword	0x9da71ce1d988ff0b
	.xword	0xdbff8d0507ae3368
	.xword	0x6d55b47d699baf1e
	.xword	0x3e9742ed93abf66c
	.xword	0x22a80e8d96f300a8
	.xword	0x81ea6e56e9ef3e02
	.xword	0xa80a1d8147085433
	.xword	0x89c6be258548e6d0
	.xword	0x6dd82a63aeaff755
	.xword	0x5261ad1c159d5858
	.xword	0x7c6fc3ef32f19071
	.xword	0x46f98e1ff71738d4
	.xword	0x2ff9fb4195c76d1a
	.xword	0x270188c232ba60aa
	.xword	0x4c0a03922ebd1375
	.xword	0x1c59c10f00e63035
	.xword	0xa192c341aec7c09e
	.xword	0xb43d1a85ecb56cf0
	.xword	0xf4bbe363b76516c1
	.xword	0x91061dbe78ab4793
	.xword	0x43b66abde5b3b58a
	.xword	0x99bee713df720d55
	.xword	0x6582eb450a4b1bf6
	.xword	0x92c2d82456b75b20
	.xword	0x9fa45aba69456add
	.xword	0xd896df840d1373b3
	.xword	0x5aad1f1e1d9f5abb
	.xword	0xce8634401dab2923
	.xword	0x086ad90952e93ff3
	.xword	0xb32ce49ed06c9cee
	.xword	0x23fabeaca76a82aa
	.xword	0x7ee92d36404567ea
	.xword	0x5c72c9c5ec6918e5
	.xword	0xf791408bfb0d28a4
	.xword	0x71c5ea90fdd606ee
	.xword	0xcf2d2bbde7b8e100
	.xword	0xca4b5be0e57d4312
	.xword	0xb3fa26f8f3d8a569
	.xword	0xd64f33cf879c5ec8
	.xword	0xea18fa70be682971
	.xword	0xf544dc0c6192b64c
	.xword	0xeaf43d6fd900fdd9
	.xword	0x1cd2eda6178e6154
	.xword	0x08cad9e4cf48e511
	.xword	0xb4d77272e7bb5956
	.xword	0x86a32edcc7437637
	.xword	0x79449198babda925
	.xword	0xb0bb63166b6647d1
	.xword	0x02008737fb34504e
	.xword	0xa55c84bb3a412464
	.xword	0x454c8c1aef7263d4
	.xword	0x8e4a2ea0344199fa
	.xword	0xed8c89ec963ce008
	.xword	0xe5d421e550878a00
	.xword	0x39b2bc3cd2c7a2da
	.xword	0x5a2926ce5c140079
	.xword	0x1e98e2ab54ef853d
	.xword	0xb9ae9d23520782d4
	.xword	0x6aef6ead37b260cc
	.xword	0x1563eafa24ad0417
	.xword	0xdb46656fb7d0ee5b
	.xword	0x1c927187546db22e
	.xword	0xb6d4dab3edfc7f27
	.xword	0x62070bcc30af76ab
	.xword	0x96b3be956e2724e8
	.xword	0x214724b0f2979e60
	.xword	0x9553d7e0054f2e58
	.xword	0xb0a02c5c67ee2eba
	.xword	0x4ff128e23c4e7cb3
	.xword	0x0207d42998b6c8c0
	.xword	0xd8fe3d06f59d061f
	.xword	0x976f2c6612b1e3d5
	.xword	0x0678c1964ec87040
	.xword	0xc37940c8856814aa
	.xword	0xf85226a8117d2a17
	.xword	0x2735ce114ca56e91
	.xword	0xac8f22ae6c65f5e2
	.xword	0xe29c9fd50d66f16e
	.xword	0x09d2093ded006600
	.xword	0xccc3045dc65f23a9
	.xword	0x700e22b83c40afb6
	.xword	0xb70e7dd2bf29985d
	.xword	0xe718baefe06e1c8d
	.xword	0xbf83dd840b9e8bab
	.xword	0xede7052ce9d0c1b0
	.xword	0xb32b7f926e0a4e81
	.xword	0x508bae3e1d8e25d2
	.xword	0x8beb2dbdff5c447e
	.xword	0x899b0b2279f70879
	.xword	0x47362e4782f5049c
	.xword	0x961e4e08954e422c
	.xword	0x4be8f40cd0855a59
	.xword	0xdfbb69e3fa4b7ef1
	.xword	0x221206df4e82a9f9
	.xword	0xe5958d158eadbc59
	.xword	0x09aefdb25142f672
	.xword	0x18058210c36322bc
	.xword	0x19e9d0ef66baa278
	.xword	0x4fde2bbcce2912da
	.xword	0x123e51d15dd0ccd0
	.xword	0xd5baa5b75d1419d4
	.xword	0x9ca0b2da9d083d2f
	.xword	0xa6e4fed9a58d7195
	.xword	0x2b2d60ba9c96cbb3
	.xword	0x06bedaad79733807
	.xword	0x9fddbd0b8cfcfae8
	.xword	0x81069123e4cbe859
	.xword	0xe7d6bfeae8183e0d
	.xword	0xc5c6c714f416bf1d
	.xword	0x431ca0a220f5c985
	.xword	0xb5bf8570bbcc58fb
	.xword	0x5ee169c09e205b26
	.xword	0x5009472eb6ff9290
	.xword	0x016e8f3354076e42
	.xword	0x3db06149d5a3a3c4
	.xword	0x4376f45b0d944fc9
	.xword	0xbb7dcb4a4445c33c
	.xword	0x41c7d7eeff0b2b81
	.xword	0x4785ad138e90ffe4
	.xword	0x168e239a785b2d1d
	.xword	0xffc87b1f06ec922b
	.xword	0x65099baa5d2c71ba
	.xword	0xb0959250ca83f58b
	.xword	0x0194edba794123a4
	.xword	0x16e57bb6414c2eca
	.xword	0x2d152ea0e3759ca4
	.xword	0x62732ddef28344d0
	.xword	0xb4571cf4b4edf344
	.xword	0xe17f7d35ca71ecd9
	.xword	0x7cfe574be7f31237
	.xword	0x97192bc75150f99d
	.xword	0x267239d8e81cf7ee
	.xword	0x4c16585b09a28b49
	.xword	0xdebb7ba52d153d01
	.xword	0xb92261f13bc5c8d6
	.xword	0x79757c237e90463b
	.xword	0xebf67108f6dd9ee6
	.xword	0x0fda01325120bd95
	.xword	0xd2dbd6534723d21b
	.xword	0x3189d13db10371f4
	.xword	0x380ef65cb0808aeb
	.xword	0x4c0d8e50326c607a
	.xword	0xd804abe38874aa5d
	.xword	0x82d94b46307e06a1
	.xword	0x3a29b884cc98c777
	.xword	0xb0a0a674433446c2
	.xword	0x2323f6d6137c58b9
	.xword	0xc79a23f6f67a9df8
	.xword	0x6d743d689168fda5
	.xword	0x8e45cfb69de5c91b
	.xword	0xae6b7d59b2ad9831
	.xword	0x3ae561f53f24c9a1
	.xword	0xfc6725bd203dfdd3
	.xword	0xec0c0113bb7e3a30
	.xword	0x53366a198bd980ab
	.xword	0x27b78e5c0715d9de
	.xword	0xe0809aeef4c1376a
	.xword	0xccdbc0a97b2f5062
	.xword	0x7b1026438f2b921f
	.xword	0x2f94ef6ee5989fdf
	.xword	0x0830c6dc1e1a9849
	.xword	0x213340732696e838
	.xword	0xefad1058bdd00fa6
	.xword	0x477444d6c6090700
	.xword	0xdd6c530251b2bb36
	.xword	0xea8b9b4289b87f4c
	.xword	0xe60e3bdac7aee757
	.xword	0x48ce62e3e8eed21a
	.xword	0xd1175bea0ce5e6b2
	.xword	0xb8117fb16c641eb2
	.xword	0x47bf8cd255249eef
	.xword	0xed5f53b97123eeaf
	.xword	0xaa9b13558bd891a4
	.xword	0xdf5dae9c2b6b7d5b
	.xword	0xf44aee4af817b8b8
	.xword	0x0537f93ef027a65d
	.xword	0x80b447131235b005
	.xword	0x1d5f42a7771056df
	.xword	0xfe93ac08a8ec49f8
	.xword	0xe7a93a743c9e3632
	.xword	0x6457c22de09ae98f
	.xword	0xed80cd0e153c1394
	.xword	0x12a30dfcd3821ac8
	.xword	0x9a846f5925c122cc
	.xword	0x5316921fdd0d9ae5
	.xword	0xcd31d1714de49bbf
	.xword	0x6913856d3a9ea5d5
	.xword	0xbc323c0c5eb60979
	.xword	0x84fce488f158dae4
	.xword	0xaf80e689ecb3f6b2
	.xword	0x8aa7cd7151ae96da
	.xword	0x2af25689a04076f2
	.xword	0x87fd98f1229f8a1c
	.xword	0x68ad5a868d9e2d42
	.xword	0x0724effcc08d3514
	.xword	0xf34f593eaba72e69
	.xword	0x450b2107df432cac
	.xword	0x2568a3a3d15990ca
	.xword	0x6223514a1d666847
	.xword	0xc814bb173352477f
	.xword	0x2599bcc944236bfe
	.xword	0xd93caf2613fddae9
	.xword	0x408aede7166c802b
	.xword	0xf9b45c26b1c5ce0a
	.xword	0x8062ec6c081705e0
	.xword	0x07e43269ab3c8a4d
	.xword	0x9c259717b09e956f
	.xword	0x6ffeadf2890ecdee
	.xword	0xaad1425cbd645109
	.xword	0xaebedfe54a5a299d



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
	.xword	0xf3eb0a955061534a
	.xword	0xd602ba2442eb9dbb
	.xword	0x00b85988f5919190
	.xword	0x9b5778edc5fa89b6
	.xword	0x55095ffd68c0997a
	.xword	0x6c94f56a5032e9f9
	.xword	0xda172efb5c60cc67
	.xword	0x3255085949adf6ef
	.xword	0xb0211fc9f0684fb0
	.xword	0x6895932afad4c91f
	.xword	0xbce8e93ae7ff0714
	.xword	0x3947cba8107d55f7
	.xword	0xcacd5b3aa7b8e95d
	.xword	0xdb66939b44d26b46
	.xword	0x394a78101fb11056
	.xword	0x36bf01cf79289f33
	.xword	0x050ba28fd726cfed
	.xword	0x742e374c6d7c257a
	.xword	0x88b42a95709147cb
	.xword	0xed6fba43762fba4e
	.xword	0xb3bacb39999b0f8e
	.xword	0x6b693316762ef1c8
	.xword	0x70890cdb8d81cda4
	.xword	0xa6b4a4dc04a4b2fb
	.xword	0x9fa79ba802071524
	.xword	0xbb868e98da8ccdce
	.xword	0x9615eb35f91e2a3e
	.xword	0x8d44c84e83b18408
	.xword	0x2c9e6e05cb09a597
	.xword	0x2ca7e20fe915e668
	.xword	0x3c0aa4ad1db87338
	.xword	0xe4261702a80bba8f
	.xword	0x46998ead34348441
	.xword	0xb9cd3762977290e6
	.xword	0x4def83e8c787b0f0
	.xword	0xf92cc09b33f84937
	.xword	0x799fbb24d2ca1099
	.xword	0x48c91126465f0e29
	.xword	0xb6649f9c36d9d973
	.xword	0x4f3839e2bdd18bc2
	.xword	0x884d2e3b707d5115
	.xword	0x1d339140ff06de4f
	.xword	0x55d5564b06143eca
	.xword	0xa1a44a883bed27ff
	.xword	0x9acb458f621bc4a3
	.xword	0x435f8f5646d3964b
	.xword	0xc7f8063d3713b9b9
	.xword	0xef50306a50e6b478
	.xword	0xa9260940468fbe17
	.xword	0xdca174bdeb4dc02c
	.xword	0x6c16131a78326e84
	.xword	0x52011d450714734c
	.xword	0xac8da22326232d71
	.xword	0xa0879a0d77ca0fc2
	.xword	0x5b38174551974c33
	.xword	0xee2b2d3becacd51b
	.xword	0xa4c0dfffef54f00d
	.xword	0x790b3dfc29ad8ac0
	.xword	0x2adcf213fa3c8746
	.xword	0xc9b3c841725f98d8
	.xword	0x1111e5e1489dc382
	.xword	0xc9c09d9251131e35
	.xword	0xf4308151a254ec8c
	.xword	0x106f0974506df3eb
	.xword	0x0bafba7365615b35
	.xword	0x36d469f390587572
	.xword	0x2fac02463ad95e08
	.xword	0x2a6a53d2daa78592
	.xword	0x2507f7dc7c85de26
	.xword	0x37e3e765c2864339
	.xword	0xd74bb0490bd59de7
	.xword	0x308ff01007f6ebc1
	.xword	0x1e669850328b6cc0
	.xword	0x271e7c2c8a1f6887
	.xword	0x69763c49cb08da1b
	.xword	0xcf0e468226726e3b
	.xword	0x77454cf44c6cc89e
	.xword	0x59ddeb8d3e5ae92f
	.xword	0xdc278007d588a83b
	.xword	0x1c5484aee1143eb8
	.xword	0x75cca8dcfd7d9cd9
	.xword	0xe1ebb1910ac6e9d9
	.xword	0x8481c8ce181f89bc
	.xword	0x9a88373da8f81190
	.xword	0x5a82c567ea1f5bee
	.xword	0xe22b9bdb251c57ed
	.xword	0x06aace75feb91124
	.xword	0xe9e5d67acc2b0698
	.xword	0xca35cc46b5a327eb
	.xword	0x02f12c6967c39bf0
	.xword	0x5ec9a8e4abaae4d4
	.xword	0x2a6739f9ad41f695
	.xword	0x95c5c365b4f582e5
	.xword	0xc3ae12738d491fab
	.xword	0x3ec7f5ccb23fe4f6
	.xword	0x322a5119bd99e254
	.xword	0x90404a92f367267b
	.xword	0x92556bed42f559a0
	.xword	0x4f6cc3d3d82b9d03
	.xword	0xb7589aabc9f72932
	.xword	0xf73439d1e4c99f0d
	.xword	0xc942ec12e2b7dbca
	.xword	0x4e5da4f758280320
	.xword	0x8416e77605d46598
	.xword	0x659b75d761f1b14c
	.xword	0xba51511641ca49ef
	.xword	0x6db7a4630dcd8fea
	.xword	0x2a654161b271d1c2
	.xword	0xa20ad74cb924e05f
	.xword	0x19b327d937b44c97
	.xword	0xaf05bfa65aa919d1
	.xword	0x0e6cea71c52ecf49
	.xword	0xf117c66c1fa6f637
	.xword	0xf14390b57b993331
	.xword	0x137a7bfa5b10373a
	.xword	0x724fc0fd7cfe5e23
	.xword	0xd7abc6caa05cd41d
	.xword	0xf5f0fd68cd6e1ea8
	.xword	0xd14f0021996853d4
	.xword	0x97e2c75d6896a14f
	.xword	0xaec8014bc99ab3c3
	.xword	0x6d589a255fdb09b9
	.xword	0x7502e2955e741f95
	.xword	0x9177c96d6f7ba160
	.xword	0xb4fe527e368ba833
	.xword	0xdc85a6735eb508b0
	.xword	0xcf06d34cecb04b50
	.xword	0x4dd60d7f2524f3d9
	.xword	0x10599134c5c7e88d
	.xword	0x592ef969e7540d65
	.xword	0x98fc8ecf197422d7
	.xword	0xc508c16a2ebf7446
	.xword	0x86166872ff52a9e4
	.xword	0x660300a6f9ffea9f
	.xword	0x744cee468fc8fc9a
	.xword	0x27fc183c6f530701
	.xword	0xf956253f91bf5d75
	.xword	0x61affb9707c80ddf
	.xword	0x100af98e1ba49516
	.xword	0xcc08077bd0de0e73
	.xword	0x1f16dd692a72aa30
	.xword	0xb86412f0ee63e024
	.xword	0x4e880f715f553408
	.xword	0x31cf85f98998bcee
	.xword	0x486bd5377d85be47
	.xword	0x007a23e460ea0d99
	.xword	0x1ab57519e2abc57c
	.xword	0x70df131a5daab0df
	.xword	0xb40d0302d9510cc0
	.xword	0x4aaec180733ca3e6
	.xword	0xe2102bb191b8b29d
	.xword	0x4e50e4f5eb87cce3
	.xword	0xd5522943c9340f17
	.xword	0x02cfceab9f0dcfa6
	.xword	0xcbeda5606de6d123
	.xword	0x4ffb337473b0eddf
	.xword	0x8eb60109ecefe0e0
	.xword	0x7288a441104dbece
	.xword	0x5176d1d3be014c3e
	.xword	0x546e42bbc3763d91
	.xword	0x58ed398e77cb5463
	.xword	0x7d11f31103d8ef6f
	.xword	0x0cc844ec94c5aec5
	.xword	0x44867a504955e8ae
	.xword	0xa61420450dfd22e8
	.xword	0xd6266b4894e85b75
	.xword	0x1c405229fb8c23d1
	.xword	0x5396c7a9e748e121
	.xword	0x07bf2d2a77afe0a7
	.xword	0xceb6f213ec28b2b1
	.xword	0x2cbf53b8e72ebda2
	.xword	0xa72dea3d60b481d0
	.xword	0x09aa93cfc257e3bf
	.xword	0x61adbc5a13531c21
	.xword	0x8f272e80e729e6d5
	.xword	0xed83c26423a3dbf3
	.xword	0xb923028705d97088
	.xword	0xd8675528b7fbf3d1
	.xword	0x6255ebc0e0aa4e49
	.xword	0x84cfcf3a14849b7e
	.xword	0x797cde8711edcc56
	.xword	0x35e7a6c30c7b310f
	.xword	0x696ac12cc4367e91
	.xword	0x169dd58e12c5788c
	.xword	0x4820e0626f7bbad7
	.xword	0x743e193ffb06fd09
	.xword	0x4dffa6c1af60bf53
	.xword	0x9e6369f04b76b3ea
	.xword	0xd59468637d85b5cb
	.xword	0x8024a249bc57a57a
	.xword	0x3b713ea66a765d6b
	.xword	0xea30d3e175810edb
	.xword	0x52ea7a3f14e69104
	.xword	0x183da55cfcd6fbe3
	.xword	0x3d90e3bc3d857ad4
	.xword	0x57daaba6934dfec8
	.xword	0x193962b23b94f086
	.xword	0x8ca9432fbecd6ff5
	.xword	0xec0de078477c216b
	.xword	0xedf685f60de5e1cc
	.xword	0x33dd56c8215e4e4c
	.xword	0xe706f5572a390df2
	.xword	0x68490ac2a6cdbbd1
	.xword	0x728f33cffbbbad3e
	.xword	0xa763032a252e7ea1
	.xword	0xd79fd61007623435
	.xword	0xfa68b0cb1e385b04
	.xword	0xa90a8cc7b795e750
	.xword	0xd4d6fb59178d5ceb
	.xword	0xd9542d793251f00b
	.xword	0x892548637da1174e
	.xword	0xcb15bbbc898106e1
	.xword	0x5231e772c4b64ae7
	.xword	0xb7b76ac51f61d3af
	.xword	0x40c136418fcffee5
	.xword	0x7b0854cdb166ee92
	.xword	0x975b54a7136fb323
	.xword	0x5a9ed14b796cb240
	.xword	0x0d693d9652a45fce
	.xword	0x847ce64b7d5f293d
	.xword	0x132daa7d886fd4ed
	.xword	0xe1973c452e728fdd
	.xword	0x41ad5e373971c21b
	.xword	0xe08e1ca2a0968f07
	.xword	0x561cfed96f8428da
	.xword	0xb984ee11537b0104
	.xword	0x693a7065799829e8
	.xword	0x4877c83586d0e1be
	.xword	0x4bb04e98f47ad50b
	.xword	0x4955853839de4bd5
	.xword	0xd948b06bdb62b3fa
	.xword	0xd3f265cb0a61f920
	.xword	0x78024cd181675ff3
	.xword	0xf1885571fb4d039e
	.xword	0x8533f467abf73654
	.xword	0x957f70eea2e00721
	.xword	0x5271d82bef1b16d1
	.xword	0xf88359f27e53c072
	.xword	0x1627cb8e2623a5c2
	.xword	0x3f280a51f9722d81
	.xword	0x42ae9d8020c8e9f8
	.xword	0xf699cdf713679fd6
	.xword	0xda156b58c1987908
	.xword	0xad178f10dab822bc
	.xword	0x4825b84fda682e12
	.xword	0xbb430647e15aef46
	.xword	0x0aa5283afdce63b5
	.xword	0x4f3119a78c8cd5a9
	.xword	0x743cd9b82e9ee18a
	.xword	0xb83fbc2108994d04
	.xword	0xa2eee489fb74ec4b
	.xword	0x4e6cf0cf7a74013b
	.xword	0x907f8faa48d9496d
	.xword	0x232e35a76399b37b
	.xword	0x1dc18420fb68d98d
	.xword	0xfc09ec33c8ed8856



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
	.xword	0x7acc5996bcd071b1
	.xword	0x75d8d71af40ec14e
	.xword	0x5f2bb8f4487d8379
	.xword	0x43b1992cefb97137
	.xword	0xb2c4cb779d064226
	.xword	0x0be51e8c7483c06c
	.xword	0x0be888f2ed21abc6
	.xword	0xb48417282ac84e49
	.xword	0xbc67aa01fce7adc6
	.xword	0xc84eaf9a33be859e
	.xword	0xbca0dfb9faf9658d
	.xword	0xb1198bea36c7b31f
	.xword	0x9107b8bce210501e
	.xword	0x351ec9fc380e32dc
	.xword	0x9cd6f7cbfd7e4aff
	.xword	0x832e680c8e145d31
	.xword	0x8298f6d30e52c32d
	.xword	0xd2c44d4003797667
	.xword	0xdeb483ae3602cb8d
	.xword	0xd0adaf4dce8d737e
	.xword	0xa8df51965cbf74d2
	.xword	0xe5a16d2d26967ca6
	.xword	0xef618d71b8cc4140
	.xword	0x49b76c511e1bbfdd
	.xword	0x496782e710e39c56
	.xword	0xda98a308c4fd8259
	.xword	0x485e2ae2103f1931
	.xword	0xa3319cfe8f656652
	.xword	0xf6a4ebdf988a564e
	.xword	0xe04fd728e1b4f71a
	.xword	0x6a3212e876e49b82
	.xword	0xa83d8ba55b497d2e
	.xword	0x4b10e8275ba9d69e
	.xword	0x70c323aa41a57750
	.xword	0xed7a48ae5c71f7c8
	.xword	0x79c559237f849b6a
	.xword	0x130651a7f80d0ddc
	.xword	0x3388cb2aeb4615a2
	.xword	0x667cf977a2b2bb23
	.xword	0x7227a778b2a5ae86
	.xword	0x79c533c694646386
	.xword	0x5a25a44a64342bb6
	.xword	0xfe0d01ae900e16de
	.xword	0x955c730ba5deb24c
	.xword	0x28e48d772303ad73
	.xword	0xf5526bbf892ee76b
	.xword	0xa424d941fcd65258
	.xword	0x7542f9ddeeeb5690
	.xword	0x827db6cc2a81a7bb
	.xword	0xd00fad88957b9eb5
	.xword	0x3fff1969888730df
	.xword	0xad8787420ed7df89
	.xword	0x51c78b91acc4a2b8
	.xword	0x6c56b034b92a8023
	.xword	0x996e98cb541e91be
	.xword	0xfa190e6f8145874c
	.xword	0xed2b8c8d2103d695
	.xword	0x78a5c510118ecf4a
	.xword	0x3052b6d0a7c41c61
	.xword	0xebf2f100abd6106d
	.xword	0xc0ce955c1dbc5ee1
	.xword	0x8260062802005d68
	.xword	0x6349ea3e4f990d56
	.xword	0x110307695e950a0c
	.xword	0xc44e7b75dc9c0da0
	.xword	0x914832ad826501f1
	.xword	0x76ff2e79ea4910bb
	.xword	0x0366dba0c7d49190
	.xword	0x3bc82045e0a4f967
	.xword	0xaabea6c9193038a5
	.xword	0x7f63562365da591f
	.xword	0xd9c5899b170e23ee
	.xword	0x8248d7fda08228e0
	.xword	0xadf67781f9a020fb
	.xword	0x041444160a042839
	.xword	0x76e3d8d72613616f
	.xword	0x558f56b1a7d9f808
	.xword	0x69ba048f1112e2fd
	.xword	0xb3d4a8487a1ce323
	.xword	0x5dcf56ab8b31a179
	.xword	0xc9d88ae29aa90d80
	.xword	0x7c6aaa415c36d6ce
	.xword	0xeccd200bacdb80c2
	.xword	0x821e73c691dc9a4f
	.xword	0x30c082228f647133
	.xword	0x244d5e3f24ee88cb
	.xword	0xf751a53184977b49
	.xword	0xd8cfd9817e74a8e7
	.xword	0xd284a693570eaf3b
	.xword	0x9624bd585a08686a
	.xword	0x6ef6d14660aa30c0
	.xword	0xa6d13134ba9b358d
	.xword	0xfdadfeae6fbbf718
	.xword	0xf3e07b42f2dcda26
	.xword	0xcd832a7bb482624f
	.xword	0x97c029415b3ba7b1
	.xword	0xbddbd60717c58f85
	.xword	0x73897d41215f58ea
	.xword	0x8b9025666f5d4e29
	.xword	0xc5880d56532c6b47
	.xword	0x05946bd67ad0edd9
	.xword	0x074bf97a20ba184a
	.xword	0x535571961f07a6b8
	.xword	0x279732507e6f2a60
	.xword	0x1f15baad71abdb10
	.xword	0x1ca433b9c59e9228
	.xword	0x519980f26e252e1b
	.xword	0xe46441afe491ca31
	.xword	0x0b123ffba481c7a2
	.xword	0x1ad70bb7f047568b
	.xword	0x2e6262033439604b
	.xword	0x29a5b71195df909a
	.xword	0x4cc072529aba3a17
	.xword	0xf967dbd9dd781aea
	.xword	0x18069c1783c6226c
	.xword	0x2d379be21e83a41c
	.xword	0x64090adb8a59e03c
	.xword	0x3523e56a58991f89
	.xword	0x488ba4ea1986fc30
	.xword	0x095169f871409432
	.xword	0x3fb6822c6ff4d52d
	.xword	0xcf06ec5be797dd82
	.xword	0xf132c9aa81d9a973
	.xword	0xc39af70aab9d49f6
	.xword	0x43d857d182821c81
	.xword	0xf0fce0fa3b050e8c
	.xword	0xba2676773c34006f
	.xword	0x92f6afdbfaed2811
	.xword	0x4cfe06d705ab96cb
	.xword	0x9354f71d87e9ed00
	.xword	0x8486cea4ddf3ddf2
	.xword	0xbd32e8101d86c9ab
	.xword	0xeb14f1b21d406588
	.xword	0x6cb60695f02aec12
	.xword	0xe44366ea4c1a37ed
	.xword	0xde3d1d8588bb284a
	.xword	0x9524f5a82c7ae1b7
	.xword	0x9eb708df9f41bb09
	.xword	0x9b8c3b6078bff6ec
	.xword	0x37e48df92d5e3b4d
	.xword	0x944f4c2c135b781c
	.xword	0xa60bdadb1c3a5fff
	.xword	0x8631b7d5294bfc32
	.xword	0x3cbc9c5ed456b903
	.xword	0x1ec635c1ab6df4b4
	.xword	0x88f4794141ef7868
	.xword	0x66fa7a34abc09967
	.xword	0x71c5017bf89921c4
	.xword	0xd7f6115ea542b2e0
	.xword	0xdf7fa7197ef17ec9
	.xword	0xb3fd434927a836b3
	.xword	0x6de99f3eac8fb183
	.xword	0xa9f8b97bdfdec9b8
	.xword	0xa844d1695bd2964d
	.xword	0x50fa4f919295b956
	.xword	0xa4c28e5a98472d2e
	.xword	0xd4b959abbfd84ec8
	.xword	0xc2a21a5997face69
	.xword	0x302a6ae5ced3133f
	.xword	0xe1b6eb83db811771
	.xword	0x030fe4421596c6a1
	.xword	0x8be02c82d1482d9c
	.xword	0xe41ef6ae492115fb
	.xword	0x1a334b14b79720df
	.xword	0x4816887718619940
	.xword	0xc5e2e5954fc843d3
	.xword	0x38c16fbeafd07d97
	.xword	0x06e8cd70d3ea547e
	.xword	0x6d7febcceebe8366
	.xword	0x3f8bcb720f71df6a
	.xword	0xd8f58607bb684ec5
	.xword	0x9b9a1dc9e37aa628
	.xword	0xccecda0f09594f21
	.xword	0x98f731cc53d5b86a
	.xword	0xb03e92a11780d765
	.xword	0x58d28eb9872a2190
	.xword	0xfe36e6fcb60da89b
	.xword	0x376e04a2740bc198
	.xword	0x86d6a86e0f7611e8
	.xword	0xe0a9d29496eaf5cc
	.xword	0xa7edd452f968b12e
	.xword	0x0a4fbb208aa9f5a4
	.xword	0xfc47889d8668ee75
	.xword	0xf989596fa3b5829c
	.xword	0xc2340e487f2f4c15
	.xword	0x3f726d4db189080e
	.xword	0x9a9f82d8efbc8efc
	.xword	0x0ea58c5af6e11471
	.xword	0x9bd121ea460d7efc
	.xword	0x337b85966fadf2bc
	.xword	0x19f8dce0d64e1916
	.xword	0xece12cd5b29ffac6
	.xword	0xaf6e666723ec377b
	.xword	0xdd7073d7725fe836
	.xword	0xe5e021a6911af536
	.xword	0x9e15d0223e8d5e54
	.xword	0x21b654b60cc76efe
	.xword	0x8c46e9371b9dc3d3
	.xword	0x74e09c64b31458eb
	.xword	0x00e9f3edcc9d5fbf
	.xword	0x1d395ef2a289ab5f
	.xword	0xf203875bc21d0f51
	.xword	0x9fb8ed5c564d80b3
	.xword	0xd9ae54d14907e634
	.xword	0x19ba4166a6b34cca
	.xword	0x636e25a4061c811c
	.xword	0x2c39b6b161866036
	.xword	0x07100209cbce55b6
	.xword	0xea9a251579f0a366
	.xword	0xa525cb7d110a2d1c
	.xword	0x87e26c69144ecef8
	.xword	0x32ed9753f808f7bd
	.xword	0x1ca20aa3d9f4e8bb
	.xword	0x3251e2fd6debc7d7
	.xword	0x8273860693fe7d23
	.xword	0x51f5ca7b38ed8a06
	.xword	0xc97b2230bb551bc5
	.xword	0x34d57bd32e959383
	.xword	0x17fcd80f4c45cfaa
	.xword	0x740ce2502a1c49a5
	.xword	0xd66a1936b0a4b8b4
	.xword	0x7491402954fd6b29
	.xword	0x44ec3a4d6730f9c7
	.xword	0x90c16125bddecc68
	.xword	0xe514909943c873a4
	.xword	0x1a4c2c97ae660e45
	.xword	0xee5a64214660ebd7
	.xword	0x150630f1d9531486
	.xword	0x7ee3a2c93fb629c4
	.xword	0x936dc78557cebc3d
	.xword	0x60116841ff1f5cb3
	.xword	0x65fef9ddd0326530
	.xword	0x2e61b39ad3c39a10
	.xword	0x49afd2b7e3118e64
	.xword	0xace584244dc7c888
	.xword	0x78b59c47445c3baa
	.xword	0xefce2908f59314ee
	.xword	0x0faf359a201bb84a
	.xword	0xefec0b3a4c4a4163
	.xword	0x7ce10a18a121111e
	.xword	0xd80cc61517b97b65
	.xword	0x478b567b1986a988
	.xword	0x46e05cd55607b53e
	.xword	0xa0decbb1530d4a87
	.xword	0xe59800fa3a51bb92
	.xword	0xd056de3a9e6f9a4e
	.xword	0xf81475af49a6ea9f
	.xword	0xf547a53deca1d266
	.xword	0x4aa27882fbdcfb66
	.xword	0x1af2f39c42f65095
	.xword	0x354ba463e2bbacc1
	.xword	0xf3c472632b24b9bf
	.xword	0x63c7eff8a71b3ff0
	.xword	0xb420918f06a47246
	.xword	0x96513d8f632adb32
	.xword	0xf17c69a4c59abd14



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
	.xword	0x73a71e684ccc66fd
	.xword	0x4093ed4cd9c50f71
	.xword	0x42f730f71151be5d
	.xword	0x031999240e5b2a1a
	.xword	0xf39ba5cc01d84ef3
	.xword	0x4e5d131140c8e4a4
	.xword	0x93d9b4afca1fa2c8
	.xword	0xd77c6d2ed529a900
	.xword	0x83be48c143592452
	.xword	0xba0b57f8758957e0
	.xword	0xb6f23b1547929c66
	.xword	0xe5ebf35bcfebb311
	.xword	0xa39f1830834781d8
	.xword	0x3f8ea26a0bb44b05
	.xword	0x000288ac0ac97371
	.xword	0x199a0663571ff6bb
	.xword	0x5fb5b5270b5d5133
	.xword	0x9b7898b9bd7cb60a
	.xword	0xdfed697d46d23027
	.xword	0xd5e62698ab309443
	.xword	0xa51b8d769dfbd0c2
	.xword	0x4e4f426aa8723504
	.xword	0xf6bb908d68fc4d99
	.xword	0x7e09fa471f95ea0a
	.xword	0xa405f7472c45e54b
	.xword	0x60592202c9936123
	.xword	0xab43bdb9bde45508
	.xword	0xb6b181759d62118d
	.xword	0x84dd5c1bdc71111a
	.xword	0x9d7f4649ffc2c7a3
	.xword	0x7338ab72124e86ed
	.xword	0x909c079718b0f3ab
	.xword	0xcc1b0f258811eccb
	.xword	0xb8a8c837585d037d
	.xword	0x4afb43a48cf24f19
	.xword	0xf6a6e045039655d2
	.xword	0x0e91cf618d2c475e
	.xword	0xaf9baae057532495
	.xword	0xc5b2c434f5fdc379
	.xword	0xfaf23100c2fa8bbc
	.xword	0xdef82fd6468a2413
	.xword	0x92f10a33ae335c1d
	.xword	0xc2cc4421bbe6bc71
	.xword	0xa15707a143ba6685
	.xword	0x8ed2d518693b07b7
	.xword	0xa748cfd3c63c5fc3
	.xword	0x9f49e282b03ea379
	.xword	0x4bb9153ce89bb899
	.xword	0x0bd070f40e8d5e44
	.xword	0xd0a0c5cd42ddac15
	.xword	0x3973d3a824ccc220
	.xword	0x98257051ca75baa5
	.xword	0x34122534a64ff2e2
	.xword	0x397811e104527650
	.xword	0x16fafe0ab3e39c3d
	.xword	0x51b0795fdbad1e2e
	.xword	0xe38f67c90ff2b890
	.xword	0x684cf1a172ffe240
	.xword	0xa5523ddc0ecd048b
	.xword	0xc5ccca9f2091156a
	.xword	0xba5342682ec33469
	.xword	0x6c82b50c2a657289
	.xword	0x091e7da7a5d42f84
	.xword	0x06c08b4b8010ecbe
	.xword	0x7e6226220aa9990f
	.xword	0xf71719dbf3d91aa9
	.xword	0xf6173675d994d36b
	.xword	0x025ee52a8366eee3
	.xword	0x7dad25073754404f
	.xword	0x0ea5433f6fdb4e52
	.xword	0x8d3c820378935fc5
	.xword	0x6a4bb76a62ad8f0b
	.xword	0x890da44bbfbdc27e
	.xword	0xd6452221960643b5
	.xword	0x8908737a40ef9e26
	.xword	0x05f7fd03331abdef
	.xword	0xa8f1fce359239e71
	.xword	0x816973b78bf0636f
	.xword	0xa3341b81c043c9fb
	.xword	0xb8eec7cb90fb7c68
	.xword	0xd68aa9a78f96b2d7
	.xword	0xa37a80b411cfe5ac
	.xword	0x48987149e3235ae0
	.xword	0xcce9d5212b734d8f
	.xword	0x4aaa855ef02273eb
	.xword	0x46bb9985547eae4c
	.xword	0x1d4a1858f97cd446
	.xword	0x85d7f875f1972686
	.xword	0x13c5b7d4502733ba
	.xword	0x772a82d33117cd47
	.xword	0xfd63f5c06572eab9
	.xword	0x1e07992df1accc53
	.xword	0xd00ac77ebe3087f7
	.xword	0xd3e0e67c32989e06
	.xword	0x7f26c91911ff116d
	.xword	0x7975571db2c7ffc6
	.xword	0x5d825fc2f09f1da5
	.xword	0x80b415065ba2df6a
	.xword	0x09541da4aef55b13
	.xword	0xeeb0cdcc72f68e3c
	.xword	0x79d30b391293c805
	.xword	0x1c7de9e928dc5f76
	.xword	0x90606b63782cd1ca
	.xword	0x507f5572b52e0432
	.xword	0xeb92cfeb54f023de
	.xword	0x27f05498fa374371
	.xword	0x1d8d636560b067ff
	.xword	0x51b9ba548dddb230
	.xword	0x65d07bdec6a94e78
	.xword	0xdeb0606c25bbbd95
	.xword	0xd8ebdd6bd70b088b
	.xword	0x17650ba38ed12475
	.xword	0xddb5c41fbe6a30b8
	.xword	0x361175121bbe82ec
	.xword	0xed91d453aef36df9
	.xword	0x0b57ef435c8aa588
	.xword	0xc3ad514a4e394def
	.xword	0x30ca3dec18313676
	.xword	0x179c545678c934be
	.xword	0x4f49ca2053d69982
	.xword	0xa8330bf5ffd42cb4
	.xword	0xb9224b4e4785417d
	.xword	0x37563ba621bfcd4e
	.xword	0x06c92caf0f52167f
	.xword	0x58efeda7bcbc568a
	.xword	0x1ab7e24f21cc906c
	.xword	0x125f6c4281b4e7f9
	.xword	0x66e0ca7eae894a7d
	.xword	0xa614beab6b6e21ed
	.xword	0x300d47f67699425a
	.xword	0x3a1e4152b2801bcf
	.xword	0x88c3b0031013e1a2
	.xword	0xd70483ca54b1a575
	.xword	0xc76e7119c2295117
	.xword	0xdff406f2421f9caa
	.xword	0xafc6eddf1cde0359
	.xword	0x65b63ec73020f260
	.xword	0xe7927e33d3f6bb19
	.xword	0x87b931674ed5cfd5
	.xword	0xf55ecc2b810df157
	.xword	0xa13ad757ddbf5032
	.xword	0xab6c4b44f924a1fe
	.xword	0x5a400e223e806432
	.xword	0xe2c2833c42f374d7
	.xword	0xff1cfa1460d058f5
	.xword	0xe07976a7242e5b0e
	.xword	0xba7fb71f6754d609
	.xword	0xfdb8c7117aa47483
	.xword	0x0888c2bc81886768
	.xword	0x16e1d0614ea42aab
	.xword	0x21fbd51046054d2c
	.xword	0x9b506f4e4d1fc2e9
	.xword	0x3cf62684de6f59e5
	.xword	0x82d1ec2a95b1c225
	.xword	0x59ed02df4189259a
	.xword	0x9345fb0b8e642b41
	.xword	0xe49f29bf3d4f0760
	.xword	0x87bb27b66eda4a3d
	.xword	0xe79c7a0279d94eef
	.xword	0x5f9033fde0e7d137
	.xword	0x7cc7bc21ccffb41c
	.xword	0xea3ee4939ba37dab
	.xword	0x8384cfe2d5ca8edc
	.xword	0xd8c6e64f9aeb1f4b
	.xword	0x00e34d11f6c1771b
	.xword	0x07e5b0bb540f003b
	.xword	0xc00d4a5cabcc15d3
	.xword	0x997443d16c603863
	.xword	0x70d365a4aca7dfc2
	.xword	0x5ac025037901c7c2
	.xword	0xea01b0fbed2553bf
	.xword	0x7924a586e6573507
	.xword	0xb0bd0719853c9dcc
	.xword	0x836cbd9e04bbcb60
	.xword	0x6daa8b3c7afa7201
	.xword	0xb43ca3ae3949b321
	.xword	0xd58afd5f2fca0888
	.xword	0x19a6f6768f1ff43c
	.xword	0x2d6b9909b308ec81
	.xword	0x2db97661a0d884fc
	.xword	0xbc0c3ca626ab9832
	.xword	0x690f5eae05800766
	.xword	0x185437b8ddeb27cc
	.xword	0x9b5afe99885f2103
	.xword	0x84f244c86975ce25
	.xword	0xc2f3045ec15f6e1d
	.xword	0xda27e8616555693d
	.xword	0x150b3deccd70c51f
	.xword	0x8776a1f9fd3998e5
	.xword	0xd12ee6c349d1da67
	.xword	0x786a7efbeb5cb6a5
	.xword	0x1ee863df52c4c399
	.xword	0xfd5500e7c0c24450
	.xword	0x2d52db7c27c38a11
	.xword	0x78f59bcef0b198fb
	.xword	0xa53ab468b06e7625
	.xword	0xbeb60bced387b821
	.xword	0x231c5b2f7d4fc569
	.xword	0xcb02755b5c358a67
	.xword	0x47df406f1701b79d
	.xword	0x6a09b203cacee463
	.xword	0x08157f9b5b40a426
	.xword	0xe8fb7743f66d04e9
	.xword	0x192146cf4581f2ec
	.xword	0xba2d875fdfbd3f6b
	.xword	0x9ba1c8b7d39c9b4d
	.xword	0xe5ac9eb0db5651e1
	.xword	0xf0f2bd0aed48ffa0
	.xword	0x4d3712f89593f34a
	.xword	0x66872b9835604848
	.xword	0x58a264dcf8705fac
	.xword	0x652650e9c5f8f9ef
	.xword	0xbc0c9bd3b2c2d7b8
	.xword	0x8b4bd7abf9d3a72b
	.xword	0x00c5863e0bd552bc
	.xword	0xf6c62467909b250c
	.xword	0x207019d3f565cf78
	.xword	0x4d58766cf2c9470b
	.xword	0xee5f1076e0531c38
	.xword	0x5145e74d941a753e
	.xword	0x1b03d80203f79240
	.xword	0xe78447e82ba48069
	.xword	0x57b7126cc4373462
	.xword	0x40ae36f67d84a940
	.xword	0x85a55e45c934fd61
	.xword	0xc5c4008c29f01f65
	.xword	0x379b857c63ba7d69
	.xword	0x6b631651763c81f0
	.xword	0x41ba151f9da08b01
	.xword	0xe1032ca88d0b0bc9
	.xword	0xbe27e22adfa8cff3
	.xword	0x181ff2ed31aef2e3
	.xword	0xade77a8e4f918427
	.xword	0x66d9e00c19110f8e
	.xword	0x89ea0e0441ed618e
	.xword	0x594965f212c09346
	.xword	0x5faa74749d031871
	.xword	0x7259d56e33313a84
	.xword	0x683eca062b8c823f
	.xword	0xb434bf803f59e1e0
	.xword	0x7dd8ad623eed6127
	.xword	0xc99cee1ed57e5ea4
	.xword	0x444ef6313814c38b
	.xword	0x46205cd0b569eb3a
	.xword	0x81e4d3d3559f2d05
	.xword	0xc0892099ee3561b3
	.xword	0xefcbb957a0a2a032
	.xword	0xddd37c65ee38ee44
	.xword	0xd0ef48cdb402df06
	.xword	0x9aa32eec081de947
	.xword	0x803b3c4578ca55e6
	.xword	0x79807ec04d934ec6
	.xword	0x9dfd1dc7d8b2a283
	.xword	0x8a226a95d7ca08ec
	.xword	0x72da2b91c2eb4437
	.xword	0x347127deb3017f34



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
	.xword	0x9be90513b7a0a1f4
	.xword	0x5b0669a58c1b11f8
	.xword	0x9b42ec4749dd5caf
	.xword	0xf452633b3575e3cd
	.xword	0xa93ca1ab25997e41
	.xword	0x292d12b0ff36b68b
	.xword	0x28f88f8893f4a882
	.xword	0xb65feafd27ac59cb
	.xword	0x6212af14d49dc160
	.xword	0x204502e6e3aeb096
	.xword	0xae35386e48f89885
	.xword	0xb7221abc52e1f69e
	.xword	0xd6039d0a50726a84
	.xword	0x5e76010ad47941f3
	.xword	0xe5333a6f4ba17ebf
	.xword	0xff208092807cf3d6
	.xword	0xf76b082f9eb6904f
	.xword	0x30cb90abf9fc4a2d
	.xword	0x188ee1ad6e3a2eb4
	.xword	0xb3772abc4df67359
	.xword	0xe0d7a2dd301bf0b2
	.xword	0x31776b434849a6d7
	.xword	0xa6c961822643744e
	.xword	0xf93a25a782b29913
	.xword	0x4777e4dfabd5a306
	.xword	0x9a4dab7e85007105
	.xword	0x3a2ff067a681ea74
	.xword	0x95baef234726f248
	.xword	0x99ba0d7d25fceda2
	.xword	0x3725e985222db8e6
	.xword	0x2bbf3547cf8037f9
	.xword	0xaa6e42917ec92c55
	.xword	0xf8451b96339f0d9c
	.xword	0x502cf98c9fcc522c
	.xword	0x5503f4149da31bf9
	.xword	0xc80e97db4a5032d3
	.xword	0x6105367b1328efa4
	.xword	0x27b4f2f8a14d694c
	.xword	0x8a3d8e445a9e4b77
	.xword	0x0e2aab33f0424fd4
	.xword	0x533f2873424349f3
	.xword	0xd5f396b788654c75
	.xword	0x40fff912d9c31229
	.xword	0x1ffd75312da69d5b
	.xword	0xc7767f53d529349c
	.xword	0x5eb024af0e47c521
	.xword	0x6432da1ee4a3c047
	.xword	0xa93fe607a96824f1
	.xword	0xebb8661cd478c950
	.xword	0xa190c2e1b8a92f27
	.xword	0x39a975c6f878a93f
	.xword	0x087818773a389ccf
	.xword	0x8785809f4072f4c2
	.xword	0x13e6d39711f410d5
	.xword	0x9fc56e71d05fa48f
	.xword	0xc4761a0ac41463aa
	.xword	0x451a81eccd49ffea
	.xword	0x4675fb0370ea4c96
	.xword	0xa4273b20a48f68b8
	.xword	0xb31a23feb77c2d37
	.xword	0xf9a5c46ae146fc5a
	.xword	0x913d8bf0d6fbe9ca
	.xword	0xaa3d9f56276dd37d
	.xword	0x0b1111de3073d8a7
	.xword	0x6d71ae6d4b710ff7
	.xword	0x7c9cfcaa7426eb03
	.xword	0x9c6595bab1a4f2c7
	.xword	0xfe162d0063a7bf24
	.xword	0xd6b8b1dc0dba47ff
	.xword	0x088aae99a39f7306
	.xword	0x52f653b0a25a5640
	.xword	0xc6f1cc32413a9f9f
	.xword	0x91c350267cf1c8d9
	.xword	0x4b8a939bb32d7501
	.xword	0xc633ccbeacfd23e0
	.xword	0x8ad71f3aec4927df
	.xword	0x0550fbdbac31042a
	.xword	0xf496b933b6ac0faa
	.xword	0x118969724d328b21
	.xword	0xada8094567a6dce3
	.xword	0x7636bcf8ca343671
	.xword	0xb0bd3f8676e4a358
	.xword	0x77064b7b39cea87c
	.xword	0x1f97ab6c572c77d6
	.xword	0x89d8b12bc886ec7f
	.xword	0xe0cece48b12b87eb
	.xword	0x4b67dce5125697e2
	.xword	0x6ef5909d7494cdac
	.xword	0x33bd063d505e59b6
	.xword	0x4651bab683f8e87e
	.xword	0xaf7965166cf6bb3f
	.xword	0x90bcebc266dbe2ed
	.xword	0xf4aa75f1533c424e
	.xword	0xac29099668ce98b0
	.xword	0xd7f7617393004f85
	.xword	0x28a6011d4c2c37db
	.xword	0x34b58b2718f984f1
	.xword	0x3755a354e39142e4
	.xword	0x60156493445b0e84
	.xword	0x501383e1c223054d
	.xword	0x48437ed36633a2df
	.xword	0x3f4dd4d1fb29a3fb
	.xword	0x7cb699dee55b0cf3
	.xword	0x4b2dd0881436c5ae
	.xword	0xf755ddc1ef2e99da
	.xword	0xff62905ad2362b9b
	.xword	0xef27defe0e6d65aa
	.xword	0xa0d46470cc158a1d
	.xword	0x30af7ff146eabc1e
	.xword	0xf5e76c49ea3296bb
	.xword	0x7dd64bc03f37f1eb
	.xword	0x271e48b371c6264c
	.xword	0xa0851c9eacff62d1
	.xword	0xa3665cb819f69502
	.xword	0x10f45eea97349015
	.xword	0x3a78c15ff07f9f71
	.xword	0x276abcf65e9c690b
	.xword	0xc7dd30412a428887
	.xword	0x3f0c369953a1e8ec
	.xword	0x99804d9635b62a4a
	.xword	0x998213493a883829
	.xword	0x3a67336a92166184
	.xword	0x0bc1bc962f066fdb
	.xword	0x4d443f2f8099a9d0
	.xword	0x9ce2c3e2c9990e03
	.xword	0x5bc9b88d4d21448a
	.xword	0x782f08143bcefa0d
	.xword	0xa28fde61c7eeecec
	.xword	0x33b04c7646bb64fb
	.xword	0x289ab3423e3d15e0
	.xword	0xf63991148bbbb1bd
	.xword	0x86c78ea07b83d213
	.xword	0x80f566a9c0d67903
	.xword	0x2f935c044858ef53
	.xword	0xa3636c026b16d48b
	.xword	0x6f2f69acea628c9a
	.xword	0x3db3c7747441d2ca
	.xword	0x3528edc7c7030031
	.xword	0xf183398e31873dc9
	.xword	0xd282f86f899c1eb6
	.xword	0xf882633ed55903f4
	.xword	0x96d861103632dcc5
	.xword	0x21e9820f1d57775b
	.xword	0x861a99cb591e7609
	.xword	0xdeb30f03b2ddedad
	.xword	0x55fee0ccd2b1ccc5
	.xword	0x84f9fa1678f48380
	.xword	0x7374a23f34977787
	.xword	0x5791f862a0882f38
	.xword	0xfb5814163af3e738
	.xword	0x2bb2031674c9d4a9
	.xword	0x64764a4ce89c1b69
	.xword	0x7b07c7243730579f
	.xword	0xcdd7db8cc6604bf1
	.xword	0xc0691ae4d5801a8d
	.xword	0xd9c5ff36ab76272b
	.xword	0x2c0dd4a0f644ac1e
	.xword	0x68da0d36d66286cd
	.xword	0xbc4521974900b711
	.xword	0x944778ae6bdb4e24
	.xword	0xf67e4009c2728cab
	.xword	0xb85641ff664866fb
	.xword	0x97dad83c2975d834
	.xword	0xd61374a04bce38d5
	.xword	0x8c30acd9ea083d7f
	.xword	0x2dfeee9239f5be7c
	.xword	0x87034f5ac3b05edd
	.xword	0xaae60e4b675d6d37
	.xword	0x6f9b977e0d9fc1f8
	.xword	0x63e797c416860382
	.xword	0xdbfad29d869e576a
	.xword	0xf27745f66bd22215
	.xword	0x12eff6ca52d9ba26
	.xword	0xdc797ead85bfa896
	.xword	0x1cb66ec324b33013
	.xword	0x203d6b173c0304b7
	.xword	0x8df5729ac008d284
	.xword	0xfa47b59f37a7c241
	.xword	0x9a783cdcd9d57f46
	.xword	0x89cca15b76524866
	.xword	0xbb55542aefd2cece
	.xword	0xd2ef0ba2ab18d92c
	.xword	0x2bed78a3e0921820
	.xword	0xf604ac2822ffac1d
	.xword	0x05b1880b9cde1755
	.xword	0xb9a9592520967173
	.xword	0xa047ce35bf566d05
	.xword	0x23369c3a52751f50
	.xword	0x92b32f32ed558a42
	.xword	0x19bf65d7c5d2fb22
	.xword	0xe81ec9154c555913
	.xword	0x78f0fd88c2f256e3
	.xword	0x7040c4b98fcdbe84
	.xword	0x283fc164bb61eff9
	.xword	0xb5f39d232f0d09ef
	.xword	0x9e6eb76c7e0dc5eb
	.xword	0x97f0d092066afe38
	.xword	0xcdb01cd0e493a639
	.xword	0xceb32b27d2df961b
	.xword	0xbb31fc2ecea6cd36
	.xword	0x635fa5d01baf6567
	.xword	0xc56afa0293633de7
	.xword	0x7b0824463fe10695
	.xword	0x11dedee0312c3e42
	.xword	0xc729552190274a44
	.xword	0x593940ec3bc7c9b1
	.xword	0xd072928676ad199b
	.xword	0x489b14c76e7fba42
	.xword	0x37348cf7a2959c19
	.xword	0x425807cb4b131aa5
	.xword	0x4aef2eabed46711d
	.xword	0x2f2b4151fef6d39e
	.xword	0x8a2604836f5dc92f
	.xword	0xe5932877bc0a97b5
	.xword	0xfb4e73e00b8fa026
	.xword	0x84b695eeeca10334
	.xword	0x2130e4788ab194fa
	.xword	0x155555c22afee668
	.xword	0xf86c8a83d6fbedff
	.xword	0xe2e089dd604b2a8b
	.xword	0x58eeb8b26d80f19c
	.xword	0x96bcb3220c5c4f72
	.xword	0xe2d8b482a3de5946
	.xword	0xaf3da0a35631ca0e
	.xword	0x2f0256a2d50d655d
	.xword	0x0bb8d59459dba406
	.xword	0x2f2b20be960ecd4c
	.xword	0x800aa924c3271329
	.xword	0x6d49a929df99f39d
	.xword	0xfc70e43658a0e142
	.xword	0xa6553536caa37fef
	.xword	0xd6da029106afb66d
	.xword	0x2e5a737620492659
	.xword	0x17b721f9441b7eaf
	.xword	0x2c3bde6f1e06aee0
	.xword	0x07d0346123aaf613
	.xword	0x97ca7bc52b250ba8
	.xword	0x59c68e652bb58532
	.xword	0x06edbc393540365f
	.xword	0xd1b6419fb797632b
	.xword	0xd63397d72d1a288a
	.xword	0xc06a14a8b4978ec8
	.xword	0x75319a94c84527f7
	.xword	0x1a2954532da2d6b5
	.xword	0x339c23ec4da67027
	.xword	0xc17b1346e5b9e60c
	.xword	0x6f2c1b41527c9657
	.xword	0x48c4d7d533606461
	.xword	0x1a8db94fde931907
	.xword	0xa4c8ca03e148eb97
	.xword	0xaf5ce2ac6a025a6d
	.xword	0x429204b08c979db7
	.xword	0x5e338982f06216df
	.xword	0x1be726cb6bfa5fcd
	.xword	0xa700c1c101fb9dce
	.xword	0x9e1531f8d0462b20



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
	.xword	0x8ff5afdba4a23d6a
	.xword	0xe79ad91b30fb278c
	.xword	0x555d27e840fcaf3d
	.xword	0xc442d0a5bbe7c58a
	.xword	0x868c0968a40a086c
	.xword	0xc1a5e184c6c7fe8e
	.xword	0xf1356b9f10dfbc52
	.xword	0x643abb817938cdda
	.xword	0x1251efe8ab76fce2
	.xword	0x272a4657ff8edbc6
	.xword	0xd5dbc7a199536789
	.xword	0xe29d5956de08fae7
	.xword	0x0e58c6e89e816caf
	.xword	0x608673788f3cd590
	.xword	0xca2aabd33f7e2fe6
	.xword	0x5aff8253ae6443e8
	.xword	0xfb39e527e3f3210b
	.xword	0x4672765e382bde95
	.xword	0x6868bd12378e5c26
	.xword	0xe483167137abefcb
	.xword	0xefa9cf8cd0b4f9a1
	.xword	0x3b44d8bf184c6a8c
	.xword	0x4612acc316da7516
	.xword	0x3084badaf5362295
	.xword	0xfe18145d01d12c14
	.xword	0x672046369024c3ac
	.xword	0x01b0d9fc84f0a2c8
	.xword	0xa04269e5625e69e6
	.xword	0xb976f5dd024042b0
	.xword	0xdff2873573996562
	.xword	0xe92a6127dbc14652
	.xword	0x7282c55b394d62e7
	.xword	0x8778cabc9712d325
	.xword	0xbd6ba3e4dd138831
	.xword	0x14b27b65f1cccd04
	.xword	0x603348831586202c
	.xword	0x10390c8258914b06
	.xword	0xed11531719b6abe2
	.xword	0x1ab8cdb376341a58
	.xword	0xa33a37413b8b9a74
	.xword	0xd682b4daa9e92a2f
	.xword	0x47b49191c5a03b94
	.xword	0xc40238c10d888bc7
	.xword	0x0ea7d2faf97b44cf
	.xword	0x8f78c57f1d87883a
	.xword	0x28b65d492a5d464d
	.xword	0xc48d9434716c2510
	.xword	0x2c0ceb38a1267a61
	.xword	0xc51284d004e71dd5
	.xword	0x9e9899221347caf6
	.xword	0x43765e2668b8080e
	.xword	0x0bcfc6f90838855e
	.xword	0x5a02f9af98fe54e0
	.xword	0x80cca4ea2c348845
	.xword	0x9082155596dd3199
	.xword	0x69e98779a722ad5c
	.xword	0xad7d967c87571d9f
	.xword	0xc589681af20c6aaf
	.xword	0x68777cc044735fc5
	.xword	0x37cdbb3cbb7c6e6c
	.xword	0x9cd405e36b519944
	.xword	0x3f8bff43afd09603
	.xword	0xb9898995aed0703d
	.xword	0x483524eed35265f2
	.xword	0x9449a393897ee526
	.xword	0x8b3b28240b70de31
	.xword	0xc34b0fe063073f00
	.xword	0x41acf65ce8b33f3b
	.xword	0xe33a123ce16185e5
	.xword	0xc8c54a3047d6aa15
	.xword	0x4fad1faea668d801
	.xword	0x2367b5d26eb7e833
	.xword	0x008afeda54c6ae54
	.xword	0x80cab6ddbfc73051
	.xword	0xb6e6c109e63e5b37
	.xword	0xe0754aa8b98bf862
	.xword	0xb015fd622add59b2
	.xword	0x470641d64bd2f6a6
	.xword	0x8002e966a935c696
	.xword	0xed8d3512756e7f30
	.xword	0xf69e504d978c6915
	.xword	0x15f26afa41832db9
	.xword	0x3179f87a7a09512e
	.xword	0xade50228e39547d5
	.xword	0x49b169520b39a6f9
	.xword	0x5bb07e278d5878dc
	.xword	0x9df95c63f68485cd
	.xword	0xa7187bfb7d93c3a2
	.xword	0xadc107bc2710f508
	.xword	0x3ce1319c5ade2855
	.xword	0x45b5cc3b74db3ae6
	.xword	0x90fa7684c3a85ecd
	.xword	0x6bf55ef6f9a0f872
	.xword	0x49f9a102ae86151a
	.xword	0xc9cea3779340b3cc
	.xword	0xb39d8b04f5c0793d
	.xword	0x7b8ea110c7e776a1
	.xword	0xc2353d40fff2660c
	.xword	0x7f6e6ef4c96fc630
	.xword	0x9a8a0920c378b83f
	.xword	0xccf29f358e5e289f
	.xword	0xac4a89f0a3b3888f
	.xword	0xcbba5ee2f79dd3dc
	.xword	0x5866e5cea1366151
	.xword	0x5850804fe19b4fe4
	.xword	0x893aea2083be9cac
	.xword	0x4d8c5645b4da0b3f
	.xword	0x34a12fdf100c788d
	.xword	0x913dcc121ae6d753
	.xword	0xdc0ded6a05f4ed1b
	.xword	0xc645139cfad3ee51
	.xword	0x7ca92affc8022dc2
	.xword	0xa2c69635098b5f97
	.xword	0xf433fdf98fd583e8
	.xword	0x171b0b4b72499103
	.xword	0x23e2165a8f82562a
	.xword	0x26dcfacdaba645a5
	.xword	0x5f9f7e1482cac29d
	.xword	0x38a90d8477e36e4f
	.xword	0xeae2c9b352c0f675
	.xword	0x67480d64bed2ca5e
	.xword	0xffff8fd354feee95
	.xword	0xdedd0e82257b25ad
	.xword	0xf1ad658d0d582728
	.xword	0x67ab1f412634aff1
	.xword	0xd7c37f8a955c8f5c
	.xword	0x724f8cdb32e82845
	.xword	0xd5a619371455db90
	.xword	0x28fbb05bc62e27db
	.xword	0x125e8d6b9dc4f347
	.xword	0x6f15467dde98c6d6
	.xword	0x1901e65b49659f0b
	.xword	0xf05fdf5a68f60136
	.xword	0x0f65da9e28054dff
	.xword	0xada67d9867fd098f
	.xword	0xf1086a4487a16228
	.xword	0xac279f3124e5b8b7
	.xword	0x75a0b444de5382ca
	.xword	0x7fadacce3ecd6689
	.xword	0x26774ed357e067b7
	.xword	0xbd1885321590e526
	.xword	0xe0bb9a75b56b9fa0
	.xword	0xff1f2df156e18b42
	.xword	0xd6a4999fb5bc60f1
	.xword	0x5568934cf8920f89
	.xword	0xa06b96db441f473c
	.xword	0x3e886a2f5464eed9
	.xword	0x811106c46f7f1015
	.xword	0xe071fab1ce362cb7
	.xword	0x7740f8b43ac24145
	.xword	0xba1e079dcc1ee1ae
	.xword	0x13deb55bf50d42d3
	.xword	0xd0d678d2c8912067
	.xword	0x1a48304fbeb54a54
	.xword	0xdf32e64b927f0e4e
	.xword	0xd05b77d98f322c16
	.xword	0x8c702135cab05e3c
	.xword	0x992840cc11bc0634
	.xword	0x7beaf16a0b3aa6df
	.xword	0x9029ab690704e165
	.xword	0x2b2a956b66744fd6
	.xword	0x21f4a55c57262384
	.xword	0xf8fa3d8769a7e219
	.xword	0x0a280c0cbd096fd1
	.xword	0x71a89c7bcdab7bd1
	.xword	0xf4c06bd7dbb32737
	.xword	0xef52332d08488ad9
	.xword	0x54c0a68fe1d6d3cd
	.xword	0xadc30e16ea2a436f
	.xword	0x2088c2228e1d8e60
	.xword	0xf13c02ec8356d6d3
	.xword	0x9db5f1c146e7a7a2
	.xword	0x836f2298f00a5665
	.xword	0x39f027c6514cc9a3
	.xword	0xdfa6a810e02653df
	.xword	0xc1947f0cf723d0c0
	.xword	0xb1724a5c38853191
	.xword	0xd27ec15f26185772
	.xword	0x4bae2bfb6338f649
	.xword	0x09b4a68918317287
	.xword	0x51a8e94da078c63b
	.xword	0x93723677aa89d913
	.xword	0x628e0833865dba6b
	.xword	0x2d9bc7287d5a264b
	.xword	0xebd0caa9216597bb
	.xword	0xa37cf77bd52874b7
	.xword	0x718eeb34a6ccb01b
	.xword	0x16822d3ba5535ce8
	.xword	0x410225afd86952ba
	.xword	0x3285fafe02078b9d
	.xword	0xd6235bad87389dc8
	.xword	0xedfa1720f2cdc201
	.xword	0x47d65b95f13a0e85
	.xword	0x41ac7259577b66df
	.xword	0x88ced0db146190bf
	.xword	0xb810b8942a7b2633
	.xword	0xad88b63d4b573913
	.xword	0x39b1d217de298af2
	.xword	0x8d343432a25cdf5b
	.xword	0x408e0c3dcb04be77
	.xword	0x1acc7f20bc5338b4
	.xword	0xb6d8731d085d7588
	.xword	0xa6dd7835e4d462a7
	.xword	0x83cbe22eff6af2bf
	.xword	0xa509ee738795ca44
	.xword	0xcbc57a2a34e2ba78
	.xword	0x80b03bec36ddb645
	.xword	0x60cd18b1df6c7603
	.xword	0x5c80aa965fe30113
	.xword	0x112acadaf27e6017
	.xword	0x2026eb3b463a4742
	.xword	0x59e50cc4897b4ff2
	.xword	0xf5096a6207f24134
	.xword	0x33abdd3fb1ac1b38
	.xword	0x9d5dd5b28f002b62
	.xword	0xbed6fef68ed0ffef
	.xword	0x1b9b7a03fd7a013e
	.xword	0xab8a5c3e66a27a62
	.xword	0xfac53759dd3b935d
	.xword	0x27a07f35df98b986
	.xword	0x0d7afca2897f4492
	.xword	0xa3de99f2ae485787
	.xword	0x05cf207f57936fb6
	.xword	0x446b7b0e6243c583
	.xword	0x3a4b28001dee0067
	.xword	0xf868531cc2969ce6
	.xword	0xb181e4315022faae
	.xword	0x3f91d78e4f8e0fa3
	.xword	0x3b2e1a5181c125d3
	.xword	0x8bbf0360469f9b24
	.xword	0xa33f5703bf61b13b
	.xword	0x66da6761ce6d7b19
	.xword	0x228088aa50d1b408
	.xword	0x87c64dec9673f0b8
	.xword	0xbf96bc89ff63304d
	.xword	0x733e9cf42155992b
	.xword	0x9633a7808b10ab94
	.xword	0x80eb710a6acf401e
	.xword	0xf29608444f773c21
	.xword	0x1f24fca88afb428e
	.xword	0x2431082ba689883e
	.xword	0xb255ac35dda83805
	.xword	0xb63f26dc24eebff7
	.xword	0xa0ad9e6a713ad68a
	.xword	0x457c87b232f6b9b4
	.xword	0x537d85be5d8430e7
	.xword	0xc6f848056e650d6f
	.xword	0x021729bb8f4053d4
	.xword	0xb0d0161d1c213b3f
	.xword	0x16f780b26cc81510
	.xword	0x35510d21ead07bff
	.xword	0xaa738aac98c4b98d
	.xword	0x71f3f3efa027d160
	.xword	0x35cdebbb9a843ec0
	.xword	0x99184f5e28e91f43
	.xword	0x1ccf4740510f8558



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
	.xword	0xc4cb79f34c7d2d19
	.xword	0xdda8d83042d20991
	.xword	0x9658a6bc419545f6
	.xword	0x9f3d136d2441e499
	.xword	0x763813074ae834eb
	.xword	0xc387f985ee4c879d
	.xword	0x8bdd91b6c7659001
	.xword	0xa63d23a4ddd25207
	.xword	0x934b37d075201bec
	.xword	0xf7291cfbeecba80b
	.xword	0xb18cd7d57e964abc
	.xword	0xef8468ca50796ea1
	.xword	0xd5575a199387ec64
	.xword	0xe00caacc20410b5c
	.xword	0xbc6fc6a40be734c9
	.xword	0x9622c81a12d81750
	.xword	0x0a4ed0a50f43ef1f
	.xword	0x876cc9cbdc0e3216
	.xword	0x28dc0911d0bfefc5
	.xword	0x6b0df874b7489d03
	.xword	0xc10238a7097291ce
	.xword	0xdefae95bb894f2ad
	.xword	0xac5445abd1aac9a6
	.xword	0x6700b3664d9943d6
	.xword	0x15baf89b70ec19c7
	.xword	0x630fa75d955fd5b8
	.xword	0x7cf60d5c0c4dc036
	.xword	0xbcd45cffc66fc972
	.xword	0x7f04f79d9735d9c9
	.xword	0xcd40362f285160df
	.xword	0xca84653921aa524a
	.xword	0x2cf92296a286d3b6
	.xword	0xc96bbb0b06f7d86d
	.xword	0xeed62d137e48cd57
	.xword	0x7d2fdf67e31b341b
	.xword	0xfdad0358596bdd64
	.xword	0x8b3844ed3c2dd81e
	.xword	0x51bb68cf5f19ef47
	.xword	0x46c5966b69df7036
	.xword	0xa3c8502f0ad38667
	.xword	0x2a7ecdf422cd4760
	.xword	0xa46dead3e178fb9b
	.xword	0xb7226afc864126e0
	.xword	0xaee424fb3fde14e1
	.xword	0x65f748e87ae70766
	.xword	0xd2328b1fea0b55fa
	.xword	0x82376e71717e43e9
	.xword	0xf3f42c3c0598a81d
	.xword	0xaf86b98cf32af8c4
	.xword	0x69b38eedb0bc5ccc
	.xword	0xe15d6a27951a055c
	.xword	0x1dae1054190807c5
	.xword	0x9819f521f15ee2d0
	.xword	0x7cc015f1805ea66b
	.xword	0x66b9a04fa43dac4c
	.xword	0x130146a6555d2e05
	.xword	0x6fa9ee29b1b34a6d
	.xword	0xd2c16013a17dac1b
	.xword	0xba32fd13c2d9a44c
	.xword	0x3a542736999a6d20
	.xword	0x60ab6414d71f23a0
	.xword	0xc75fa4d2ccfc2cfe
	.xword	0x860c0b5d3fce92ff
	.xword	0x1c1b90fe3ff4ae9f
	.xword	0xd2bf50ebaad0a60c
	.xword	0x1d360af02c494715
	.xword	0x53014b6d2c1cb7e3
	.xword	0x5eb8b0295db758fa
	.xword	0x511ec797f327f0ee
	.xword	0x1c732d3d595bdcb9
	.xword	0x9bc1ded7956c4e93
	.xword	0x371a9dfc6ed80566
	.xword	0xa4335674c67939b6
	.xword	0x85c968116e4f6c13
	.xword	0x3c8481f8e68b1a5f
	.xword	0x2b68c47e2a64790d
	.xword	0xa70694c68fce91e8
	.xword	0x811d3a8463214380
	.xword	0x0bbd83c87ca7039a
	.xword	0x1caf5ddff47547c5
	.xword	0x20ef9b94983945e8
	.xword	0x3ec5b245489761d8
	.xword	0x8afc21e454d85869
	.xword	0x0f9cbd57e3e56cfc
	.xword	0x9ef603bb350dda57
	.xword	0x2832a5ab4f5215be
	.xword	0x19aea885931daeed
	.xword	0x6f35078c9236dc8f
	.xword	0x238dabd716722165
	.xword	0xe9168ab99e5ee529
	.xword	0x6556b3ec3da3119c
	.xword	0x41ab31bc46af71ca
	.xword	0xe670221d1c32a95b
	.xword	0x575fe4a3df1d4952
	.xword	0xac17daa774f9e83e
	.xword	0x13a7bc412e64adc2
	.xword	0x5e662f259a2226dd
	.xword	0x33ada3d8859894d7
	.xword	0xf6c64fd712a3d16f
	.xword	0xa8c7309ca8acca8f
	.xword	0x6c21d485afcb1755
	.xword	0x85859f04f47c92d8
	.xword	0xde6b2e2e1c1e8507
	.xword	0x4cb444ccb297bf61
	.xword	0x57f6a0e7cc6d3086
	.xword	0x6e29bdabfae1e2a4
	.xword	0x073a91c1f0516232
	.xword	0x73aff6f230882e4d
	.xword	0xa900227c64c3564e
	.xword	0x34c24f165f03c386
	.xword	0xdd1a3f1002ee6225
	.xword	0x6206caa512c35c6e
	.xword	0x69d9953beb9657cd
	.xword	0x09c9b7339db50420
	.xword	0x1442482efdf3148f
	.xword	0x5004aadfbe75f25d
	.xword	0x3cc8f14c5d1f3ff8
	.xword	0x91e47ce0a5cac4c8
	.xword	0x8bce45360f8c474a
	.xword	0x6b40811b94506fba
	.xword	0xb775c6fbe65260a8
	.xword	0x8786f9033b5a6275
	.xword	0x0e97776b528fe6b2
	.xword	0x35dee9ffbefbf7af
	.xword	0xb21f1dd01ff839c2
	.xword	0x4e0884f330a31f4a
	.xword	0x3323fa3842eaa686
	.xword	0x698ea7a391e11433
	.xword	0x6f89b03ca613c051
	.xword	0xe0e547f6acefc5cd
	.xword	0xda3443675c4b64f4
	.xword	0x920e6cec0e1c1a8d
	.xword	0xe497fa2fd6dec55c
	.xword	0x2c5bb379c059c3be
	.xword	0xa871778c5eec9b51
	.xword	0x6cc3167c1c008f6b
	.xword	0x1bd6eaef984a08b7
	.xword	0x8af36c831e52f7ca
	.xword	0xdf1ea4e68243cb87
	.xword	0x24c95104421da78f
	.xword	0x830020336ae27276
	.xword	0x11ac61e45f552a44
	.xword	0xa624d232a0ab9d95
	.xword	0xd2d961ffeea9d843
	.xword	0x9f787bffcd0ceadc
	.xword	0x842597bde1196b1f
	.xword	0xd5ff26a270663b2f
	.xword	0xaacbd75425dcdeba
	.xword	0x20577258edabdd6f
	.xword	0xe85816fe030f71a8
	.xword	0x53cd10ea270dd0f4
	.xword	0x7871191905f18d14
	.xword	0x35e83a2333b159f1
	.xword	0xbe44c9384dd247b9
	.xword	0x84db2bf1d9167c8c
	.xword	0xccceaa4505834a49
	.xword	0x99cee1d3f036afec
	.xword	0x9849e471dbdd4ed4
	.xword	0xd8188378970f4f4b
	.xword	0x3148c9b5e9f047a0
	.xword	0xcecf743691370c12
	.xword	0x3b6baf80e82a417d
	.xword	0xe8767afbf003bc55
	.xword	0x29fc9bf360534825
	.xword	0x4686d2fdf4abcc6d
	.xword	0xf1282c8995d3766e
	.xword	0xfd5c0eee1c57d3da
	.xword	0x01da903b61724e0a
	.xword	0xd11ef26a8a404d79
	.xword	0x793dbe0877400a99
	.xword	0xd215c081ee969109
	.xword	0xf0db87390edf721e
	.xword	0x3fdd9346b528ae28
	.xword	0xf84d63e6e6c05f32
	.xword	0x72b3e4dd3bca7db9
	.xword	0x01b2ee0df79eae70
	.xword	0x92327a12a14f0175
	.xword	0xb9e18afefe865c1b
	.xword	0xc5802e5ae30231a7
	.xword	0x60c20fcb5474a9e5
	.xword	0x31d223e47dc4ffa8
	.xword	0x1e64a12f240f0e73
	.xword	0xa5c201001ec0b346
	.xword	0x620f85287f77c8b6
	.xword	0x991a4b1144b0e278
	.xword	0xe4d0f554e2339092
	.xword	0xe77b314d5a928d2b
	.xword	0x0903099b7f1c6205
	.xword	0x05503655ec07b0f4
	.xword	0x741923a4efef9100
	.xword	0xc5e3c8aa21872a63
	.xword	0x3c157e0ab91310c1
	.xword	0x16b554bef513e349
	.xword	0x5d18bbdbbbb35d50
	.xword	0x63e5a1ab957b6220
	.xword	0x6d0403336c0d4882
	.xword	0xa4a4e50850c84250
	.xword	0x5eb41d3f9fac9958
	.xword	0xc6192f7247135163
	.xword	0xd13ab1ba8874659e
	.xword	0x3d511b392fdb943f
	.xword	0x5e21604e27af4250
	.xword	0xe6758d7c16579fa4
	.xword	0xe7635bc7f0f09a29
	.xword	0xb51312d96df47263
	.xword	0xeddee3b018298e82
	.xword	0xb75e46b27622f8c8
	.xword	0xb15afb9536b1648b
	.xword	0xcd0abe43114f2341
	.xword	0x36cdae85222856d8
	.xword	0x383c32a1fc8cb7d6
	.xword	0x3d3e0cd433696ce2
	.xword	0xe021ec67647649d4
	.xword	0x2ae960471fc1b204
	.xword	0x3c04f4b724e93939
	.xword	0x47bbf6aa2b72daa5
	.xword	0x76e2de2db10dac55
	.xword	0xa68a0e5470d07b61
	.xword	0x8be5b68137dda7db
	.xword	0x233b0c1f7df969d7
	.xword	0x4a5115278a40ab0c
	.xword	0x980d3018bdee381d
	.xword	0x60c350ee00325944
	.xword	0x75e611ecfbeb2fad
	.xword	0x9028218d147ae2f5
	.xword	0x90fca0a6027583dd
	.xword	0x1296e66cf6205f4c
	.xword	0x4f0ef58781876e2a
	.xword	0x71396d09866c1e7e
	.xword	0x6d64149ce4f445fc
	.xword	0xdeab94e559e5c7c0
	.xword	0x82e37d38753eff7c
	.xword	0xc4d97eb5e611436a
	.xword	0xb8a74bfb06afc0e1
	.xword	0x3f6e190e06518d70
	.xword	0x3bb3c955bbf681fc
	.xword	0x0003fdf73729d83e
	.xword	0x320413f835c8eba9
	.xword	0x4952cd32f95782bc
	.xword	0x720f012e88d17844
	.xword	0x8387ffb9d9c671d0
	.xword	0x7e4febe45dcac2b0
	.xword	0x4c9dccbab99cac86
	.xword	0xaf9b3ba9e859849c
	.xword	0xc5a13d60a29321de
	.xword	0x86e044d380c6d318
	.xword	0xe0ebf7381e152c48
	.xword	0x19065f08b813871e
	.xword	0xdf97c56b056dece3
	.xword	0xaac1a1dd04869b41
	.xword	0xbad1b5ac331d3622
	.xword	0xafb5de78dddda28a
	.xword	0x004fc2ff41744846
	.xword	0x51a7e91dd728ae9c
	.xword	0xb2969f5ca7b22f18
	.xword	0xb196e4a35a719090



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
	.xword	0x56c332ba35d4de1b
	.xword	0x0c0a49a784f2c7b6
	.xword	0xd0ea5d0af2370e03
	.xword	0x34d51ff9e9b87538
	.xword	0x004ad8f4ac48ed7d
	.xword	0xa861a2a57ac785fe
	.xword	0x8df53edd2d5d7a09
	.xword	0xda49e913c5031b8b
	.xword	0xe85f4d6510a239b7
	.xword	0x957549aa9f0ca90d
	.xword	0x2ba8a2384b7c6a8b
	.xword	0x6e568433773e9d93
	.xword	0xb86ccb0fe2c500f8
	.xword	0xc3d7d0dd192a6edd
	.xword	0x43a6cd6db0cf9952
	.xword	0x17ecab514c9bb969
	.xword	0xe0fb08af9b71bcb3
	.xword	0x435a1d247a055834
	.xword	0xccc02fa3a22262aa
	.xword	0xc3893d465a2a4adb
	.xword	0xe5bbf9ecda19831d
	.xword	0x2a7398c48eaae738
	.xword	0x129cf8c1306d6f6d
	.xword	0x00489ecae17ea265
	.xword	0x058d9e3235f447c0
	.xword	0xc7144d4e45765cfd
	.xword	0x6eaacbdc76cf1f12
	.xword	0x60f3906f97e3fe51
	.xword	0x2ef80a77ae285400
	.xword	0x07d0e5f013e3f96a
	.xword	0xbc444526f583a528
	.xword	0xd5f8c3439274a980
	.xword	0xb98335fd4884a94e
	.xword	0x02db6a26df3ca702
	.xword	0xfd522f613acda7ab
	.xword	0xa18807be13573c11
	.xword	0x584e011879b5c157
	.xword	0xf1e0c85f66e213a0
	.xword	0xad202ca8093cf4a8
	.xword	0x098069b72458121f
	.xword	0x43c109bafd8bcf0c
	.xword	0xaacca6a25e39fd68
	.xword	0xc6cab2262e7970a0
	.xword	0xc86eaa5883af0329
	.xword	0x3fe8b86c06e7b118
	.xword	0x69153cef97b53c4c
	.xword	0x2123e7140cbce092
	.xword	0x646bee3a574846d0
	.xword	0x81882bfc5ddbfeaf
	.xword	0x5b0d927e9cef26f2
	.xword	0x58855aca9828363c
	.xword	0x8041f022c3aa53ac
	.xword	0x5a6c46161e278f78
	.xword	0xc22eab1349747191
	.xword	0x7ca77a7f8bb90a20
	.xword	0x38f88abb44353652
	.xword	0x93a19fa3f905b7ee
	.xword	0x19c61a06c585f4e4
	.xword	0x438e0c2f0d5608b5
	.xword	0xba506a1381ff635b
	.xword	0xfd1e4cfd4ed5e0b6
	.xword	0x6cabd8a59a1dcf1a
	.xword	0xb9fda687127ef8bf
	.xword	0xdf69495a78d4844c
	.xword	0x991e86e051dd4aa1
	.xword	0xb246acf63bb85e73
	.xword	0x478dce93660786d4
	.xword	0x9bb06def12d0ecec
	.xword	0x8b1351a3fdba64b7
	.xword	0xa4ba2f462a629856
	.xword	0xf01625847e51eafd
	.xword	0x9bf6214a3a5ad3c4
	.xword	0x03cd8c74d9a96d9f
	.xword	0x65c2b7a2c6cf1cc2
	.xword	0x7b8626a62a5c320d
	.xword	0xcefb3850cdfe5aa4
	.xword	0xe2197e44bfad322f
	.xword	0x7c0b18efd2000447
	.xword	0x19628bb126fedeae
	.xword	0x322bafb314b417bd
	.xword	0xe3c5c275a0200186
	.xword	0x2cf36fdac161893c
	.xword	0xc28b2a042ed110cd
	.xword	0xe7e2290c0eea1046
	.xword	0x06b9fbe5751e4cfa
	.xword	0x1135514a7b32b980
	.xword	0x94e78f5d2bdfa866
	.xword	0xa48de3a5fd9e3a52
	.xword	0x24696c43c8273e6b
	.xword	0xcf1ad10ea83ac39f
	.xword	0xae1c9e557c2c652b
	.xword	0xb6729e26bf4c7bab
	.xword	0xf46f0f32a11faabc
	.xword	0xd3aeb2c2b7908c54
	.xword	0x158230b99d2de3d3
	.xword	0xdf7a243a9eeb01d7
	.xword	0x276c774492ac46a4
	.xword	0xac01e891854d4118
	.xword	0xd7f7134f00ad2f09
	.xword	0x1fe244754619173d
	.xword	0x8008b7d1b1b52766
	.xword	0x25c9d89f925e3ac5
	.xword	0xf3884f6faacd5a47
	.xword	0xcd120aefd96763c7
	.xword	0x9c9c05adf3753f6d
	.xword	0x7840fadaa83879f6
	.xword	0xe1be6c42a569b14b
	.xword	0x6bf0391d86170985
	.xword	0x091b71a389c5571c
	.xword	0xfcbe541744bbe76f
	.xword	0xc614eac9363440fb
	.xword	0x62b9008e48753817
	.xword	0x4f7edf30e7544279
	.xword	0x24838a374e506469
	.xword	0x1b11741e60d39b99
	.xword	0x25bbcaca0fbe9fc6
	.xword	0xcc3050e82cb3ecff
	.xword	0x4919b8a0f24e27e9
	.xword	0x0d3e2b52bd932a5d
	.xword	0x022ee14e2d4e7bdf
	.xword	0xe5aefc5234b8e27b
	.xword	0xb7045b99a5f7825d
	.xword	0xff8f3a2e50a47cd0
	.xword	0xd6dd6639bf0a8136
	.xword	0x48371458984f41e7
	.xword	0x4dea492992cab3fb
	.xword	0xa710ec3a4966198e
	.xword	0x9363e7567b037f38
	.xword	0xb35bea0d593e0a67
	.xword	0xdf06527bd043c2ce
	.xword	0xf60a39e6f8bb9a65
	.xword	0xa50912aa68418a78
	.xword	0xba1c151c7f969c74
	.xword	0xa5924afb75e3d267
	.xword	0x89b78bb66ea2b7b8
	.xword	0xae76d515c2a17faa
	.xword	0x0468861d8cd9e8d8
	.xword	0x59d4a04c2303ee65
	.xword	0x9793fb4a92cd66b1
	.xword	0xca8a6e2d153a766d
	.xword	0x747c9281be1afe3e
	.xword	0x2b28d3671ee7f5d3
	.xword	0x53b7f64be00ca4c0
	.xword	0x917aaea471759de0
	.xword	0xcdc87ff8c2b66886
	.xword	0x140942b038a6e300
	.xword	0x889074c22d3fab93
	.xword	0x4eead7615d0431a9
	.xword	0x6d98713cedc63d96
	.xword	0x074f8ba4d20b46bd
	.xword	0x1b8c38a2f58e384d
	.xword	0xbb6ca9d65d5d613c
	.xword	0x19484912ba40fb7d
	.xword	0xa3991c17b7df3a1e
	.xword	0x38f625711cd9aaa7
	.xword	0xf8205c7be709a123
	.xword	0x58303eb1b53962c1
	.xword	0x447e946d8d23089d
	.xword	0x3ac3af36fb2efcf9
	.xword	0xc4da5aba23a6292d
	.xword	0xfd5bf4cec423344b
	.xword	0xdf754f9b63c770d9
	.xword	0xe150c75a5a2a7cc3
	.xword	0x625d05141bf822df
	.xword	0x7e55cbfe50426dbe
	.xword	0xc47381ce23362086
	.xword	0xb479fdc1affe1b1a
	.xword	0x2704376f016b6ec7
	.xword	0x8c857150c98e5d1c
	.xword	0xc9d1028e4eb22d4a
	.xword	0x63cb538aad40ac83
	.xword	0xec1fda88c65bddda
	.xword	0x3226154d8630f37f
	.xword	0x60b03b94e46972d1
	.xword	0x57b9e01ec1043e32
	.xword	0x26bb7130d9e712e6
	.xword	0xb70ca8754517c36e
	.xword	0x3977df5f74a09dca
	.xword	0x718329a49d35f68b
	.xword	0x75f3d32021b6be3a
	.xword	0x2ce2c40727ba75cc
	.xword	0xcc3947ef3f6ff3e2
	.xword	0x20ab3943d21416e3
	.xword	0x260309904e9cf8f0
	.xword	0x6da12d9eed1291c1
	.xword	0x20e4f6f76599f581
	.xword	0x6974b9bfb7cd121d
	.xword	0xf6c0ccad9a2aa25c
	.xword	0x34e012006a9991fa
	.xword	0xdf2d9bd2ffde1a07
	.xword	0x63e8f8bca8d84b8f
	.xword	0x4891787a4bb55e18
	.xword	0x0e5424f4a1554750
	.xword	0x3820e5c9beb9d426
	.xword	0xdced78c3a97e7671
	.xword	0x1c249e0adb9c5653
	.xword	0x2a862d155b483844
	.xword	0xa8414cc07728be43
	.xword	0x53cf089c2c226e91
	.xword	0x433db0cf7db0b153
	.xword	0xba98994f100e4c2c
	.xword	0x1da47ffff80b7d96
	.xword	0x8314af11fb6fd2ec
	.xword	0xa7caecfebb0f2e4f
	.xword	0x98404b389e017c74
	.xword	0xa10bc43df6aab11c
	.xword	0x41bc28dda4f11785
	.xword	0xd0bcd7b2c900868f
	.xword	0xd9e354f74aad5397
	.xword	0x79f4dd0ee0165172
	.xword	0x9e3c4fbec8bfcdec
	.xword	0xac8e72d18a23cab9
	.xword	0xa380fc6987f611bd
	.xword	0xf6d39a5532703679
	.xword	0x7bca1781ce66e76c
	.xword	0x686bd7a36248de3c
	.xword	0xf17c53faf133f06b
	.xword	0xaf17db7dce1c2f00
	.xword	0x598fbfde6b909d9d
	.xword	0x97162276f2aa3adc
	.xword	0x869f2c081dce0fcf
	.xword	0x1881fd61dc9f1e77
	.xword	0x6ca403c9ef72af18
	.xword	0x6cd9fd6c12c615e7
	.xword	0x9506a8f71f915e76
	.xword	0x8b93100284dc1ad0
	.xword	0x254148fb82d58d95
	.xword	0xa16d86eea550caf7
	.xword	0x020efdd433b3696b
	.xword	0x44413b3a8bffbcf3
	.xword	0x405db7511d7f808f
	.xword	0xe3a1fb3f95121b1e
	.xword	0xfd049b13110bbc60
	.xword	0x483019d50aa4d95a
	.xword	0xcb9721445383941b
	.xword	0xa227d46d6e3b301c
	.xword	0x6aec481a2224b01d
	.xword	0x98b8171368dce66d
	.xword	0x626eeba2ece8afcf
	.xword	0xb154005cf8471937
	.xword	0xd67562e20ba6ba8a
	.xword	0x1cee51de2355c3c1
	.xword	0xa55805d9b0897ad3
	.xword	0xb5e6710a5825a693
	.xword	0x8c832e0f5e8bfa8c
	.xword	0xb41f575e589cc375
	.xword	0x64e88717b2e1b7ee
	.xword	0xed66e0c17e493e46
	.xword	0x7cbe726dfa72e729
	.xword	0xb2f99aed4ba02143
	.xword	0x67e6350b733cb70b
	.xword	0xbbfcf365e2300d01
	.xword	0x4ea63304884f15b4
	.xword	0xac48975a6997fa57
	.xword	0x912c6464172920c8
	.xword	0x416808253cfabeb3



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
	.xword	0x21a637c7d711c567
	.xword	0xe06db22e6a0a4d85
	.xword	0xe5ee80cb6d041c2b
	.xword	0xcbbf3bd2f95fc6cc
	.xword	0xec79b351bd6b9788
	.xword	0xaa5ede9e05ca4056
	.xword	0xb4a1b992fe392d75
	.xword	0x29a6304a28fb57e8
	.xword	0xce2850caccbc3fc0
	.xword	0xd91cc583ff9db9e0
	.xword	0xb78d42900870993f
	.xword	0x97a1d4022a94d3a4
	.xword	0x18a547519a95bbf8
	.xword	0x75cafed3f1e399ff
	.xword	0x5db6a3603405f99e
	.xword	0xa3cc4595df359ad5
	.xword	0xaf53a7268781ad86
	.xword	0xf4e58594eca0cd24
	.xword	0x57182e279bb1f672
	.xword	0xfad590047e7b6eea
	.xword	0x77698d4499c875fc
	.xword	0x7c6b49f697678d50
	.xword	0xefd9ccb5614d5b06
	.xword	0xf1e2fe9f8647bab2
	.xword	0xfcda9c06bb3ca457
	.xword	0x86e2ee6ba1669bb4
	.xword	0xcfd7260cfdebccf5
	.xword	0x727817ef372c1c56
	.xword	0xbb38bd97eb13cfab
	.xword	0xb4e9551e5793ee47
	.xword	0xd3233e9150c3330f
	.xword	0x66bbb3e7a60656b5
	.xword	0xf310bbffcb1f951f
	.xword	0xe784386a09776a91
	.xword	0x0c783c1c23065b6b
	.xword	0xde89984ca6f74cc6
	.xword	0xa6e5e96bb464b237
	.xword	0xe6bf0c5988b74b7d
	.xword	0xff91b8c9941c6034
	.xword	0xda31bc4d9cc29e73
	.xword	0x6ffae1cbaa67c6ec
	.xword	0x7fb1bac15883f418
	.xword	0x7cf3c1149cb3a2c2
	.xword	0xe761d78668745262
	.xword	0x3dff8277106e1913
	.xword	0x03c0f7695a6f9095
	.xword	0x48491be3093bdb66
	.xword	0x5070b3d9c3b6efde
	.xword	0xf910b538a57aae19
	.xword	0x3fabae87a942d4ae
	.xword	0x84fc14f806ada24b
	.xword	0xc9254795a1affe97
	.xword	0xf15420c2d09d948a
	.xword	0x5bac37607bf47e8a
	.xword	0xe7e373871078e77d
	.xword	0xab70160dc8e7db84
	.xword	0x7e7842a9e83f4302
	.xword	0xef9904c650dfff63
	.xword	0x9e8d8cffc997c88c
	.xword	0xe3c48a0a4ec4a15a
	.xword	0xb869dfcc26f3af4d
	.xword	0x7b22f08ab26f6b38
	.xword	0x39d825a26146ceb3
	.xword	0x70654fb1f8e936d1
	.xword	0xbe9c99d51aa346b9
	.xword	0x8884e387670d0210
	.xword	0xb5638374b41a027e
	.xword	0xd023acaa27e19e4c
	.xword	0x90aad0f81cbe82d0
	.xword	0x9485d96ba7f2c543
	.xword	0x7035a88b9def640c
	.xword	0xab98c97fb292cd7f
	.xword	0xc3e18ac7ffc2c1a7
	.xword	0x37e91a526d382eae
	.xword	0xdaec719f1f015827
	.xword	0x961d57e3c2d8d30c
	.xword	0x0c2ee4d8c845bc17
	.xword	0x72ed2a994a4eeb6a
	.xword	0x3b921de3154d3b0a
	.xword	0x4d37583ac1412bd0
	.xword	0xfad7d55735d4cb98
	.xword	0x39bf7e7b16b48dd2
	.xword	0x5d337e658227617d
	.xword	0x13d8de2d73ea1209
	.xword	0x5a5f1aa776d04c9b
	.xword	0xb2cf529e179985b4
	.xword	0x815d27ab5668ecb8
	.xword	0x976d4ec90e308dde
	.xword	0xe3eb2309d01ff982
	.xword	0xcefee0962720ab48
	.xword	0xf1530947ef9d7071
	.xword	0x59b4f4ed0635e433
	.xword	0xac800c0cc7afddca
	.xword	0x1e0c9831fbb95ab2
	.xword	0x1f196a44fc19114e
	.xword	0xe34d3b0e03edf34e
	.xword	0x0ff602f42c2b7ec4
	.xword	0xf0553b3c46d086f9
	.xword	0xeafb59c54d56a6f0
	.xword	0x7bd1ec4570db61fc
	.xword	0x43994b9bd65f4e58
	.xword	0xf13a2d7568aa1df1
	.xword	0x625adf23c4a12e7f
	.xword	0x0ce5d3cc24b3cd20
	.xword	0x1acd19af2152fcdd
	.xword	0xc0807962deeb2ca5
	.xword	0xbf97184071393bdf
	.xword	0x0f98a1a396b0ccc9
	.xword	0xd8bf1a1aa7d42710
	.xword	0x4cbb33b8b9f733b2
	.xword	0x1ec33d20aeca59eb
	.xword	0x9ecf6e350ed045d7
	.xword	0xa4baafdac9491f0d
	.xword	0x9b76c57548bce55c
	.xword	0x78b268ed7939fb5f
	.xword	0xda7135511d5de2ab
	.xword	0x6187e13bdae7879f
	.xword	0x044bac3c69150a39
	.xword	0xd32a94b87479ab98
	.xword	0xa4bad37a9596b2ef
	.xword	0x4603c46e6d336ab9
	.xword	0x15dc7ee629cba223
	.xword	0x2be3ddc8b5db7b57
	.xword	0x89fea575bed41c21
	.xword	0xda4559a49fe66f3a
	.xword	0xa9b3121f90710e40
	.xword	0x002c19843e6c074c
	.xword	0x017cf397d89348c5
	.xword	0xbd837c4058a4ebb5
	.xword	0x2b09ca79d248a91f
	.xword	0x5fae1010167eb684
	.xword	0x9b9630919fad8f50
	.xword	0xc10d8508d3cff816
	.xword	0xe8f6fb866b2bfdec
	.xword	0xadb673f08b4926a6
	.xword	0xe2e28561bba052ca
	.xword	0x14f390d40c744cc3
	.xword	0x4058679ca05db787
	.xword	0x9430fcaae7136acf
	.xword	0x9092f895cc647ff3
	.xword	0x3116d51cadc87837
	.xword	0x44e3a58321fb5d40
	.xword	0x19dc0e28313ef2cd
	.xword	0x3dd5242a0bf90a62
	.xword	0x65548b9e08e387d3
	.xword	0x637e2d06026eb383
	.xword	0x9c857208deeadae5
	.xword	0x0357948bac6e00b1
	.xword	0x0fef287c9d78475a
	.xword	0xb00f843988d674e0
	.xword	0x3e4b7646de6e464e
	.xword	0x5e29c08c943ab858
	.xword	0x341178fe9ca2719d
	.xword	0x8eac8a4871fc6ad3
	.xword	0x5b3c8795435fefe5
	.xword	0x003846ee818852fd
	.xword	0x635b81b6dc174f0f
	.xword	0x7e8b7e6d72185525
	.xword	0x08d4c3f50844c942
	.xword	0x42da51be84b23622
	.xword	0xb0365d7a53a4faea
	.xword	0x50e33c4911f9c908
	.xword	0xcf29b96d64f228c2
	.xword	0x59790ebf0af058d1
	.xword	0x405bc8d8149f6105
	.xword	0xba06d045144cd637
	.xword	0xc7cf7de2da0c43e7
	.xword	0xa5e6af68d1945ce7
	.xword	0xf31865b0b5db3e7d
	.xword	0xa1b912c25ffe83f7
	.xword	0xeb22aad69d0f1960
	.xword	0x667706eadd19fc9c
	.xword	0x59b578b2980c6f7f
	.xword	0xf6080dd21c5577a2
	.xword	0x78f01e7b54e24eb1
	.xword	0x7dc614796fb34723
	.xword	0x3669124ba14ef3db
	.xword	0xfaef62a6a45945e4
	.xword	0xa9e702967d770c2a
	.xword	0xe6286cdf6fa94b75
	.xword	0x0fc7f7088683b326
	.xword	0x0fa2ba19e2422cf2
	.xword	0x9968a4b816f9f3dd
	.xword	0xd48d734b3f3ef3e1
	.xword	0xf9c3602be532a101
	.xword	0x10d02dfbbb31bf0b
	.xword	0x75c68d60f613ba5d
	.xword	0x918c35a85f35f911
	.xword	0x651f0ee4b55e19ec
	.xword	0xfad3999a85d06a4f
	.xword	0x3c0630cde70b5a9a
	.xword	0xb5b5a8c6e8ec98dc
	.xword	0xb4a1adf827184318
	.xword	0x39b6620c4f44a97f
	.xword	0x70fc6b6770c7e797
	.xword	0x0b9aed88ca3882c6
	.xword	0x26e329f1a80cb652
	.xword	0x5fe39dccd9b714ba
	.xword	0x269c42b3836413dc
	.xword	0xa4002d682d22d118
	.xword	0x6642ca18a4f7aa02
	.xword	0x2fd61ab2ef632b7f
	.xword	0xc9a3c7967f5079d3
	.xword	0xa50b3e7ab5402fae
	.xword	0xc731b68b201e091e
	.xword	0x5ef99bc9888e1adc
	.xword	0x7f6850b1b5abcfb9
	.xword	0x055e789ebc54878f
	.xword	0xf24c1ed4c16bbd40
	.xword	0x4a6d1984eecb3472
	.xword	0x58a67d342e1de195
	.xword	0x7bbb373bf7e5279f
	.xword	0xfb3c2a6ac050ebcc
	.xword	0x8ea9f807d88482bb
	.xword	0x5538938c65d2743b
	.xword	0x31a09f9edf467c45
	.xword	0xb919c63ce69dcb21
	.xword	0x7a3a99b6353d9e6d
	.xword	0xacd67cc19f21c5de
	.xword	0x8dc3a9592eabf46c
	.xword	0x90ecbba0cb08d978
	.xword	0xc5f2bdd022228016
	.xword	0x5c854edafc0ca791
	.xword	0x1c49b5ac51dc4bb1
	.xword	0xb2bf1ac527279933
	.xword	0x75459cc102907dbf
	.xword	0x980e149c333acd9c
	.xword	0xca4a55310ba4e135
	.xword	0x191bc9b03b0fd00a
	.xword	0x09c9e03d47775a61
	.xword	0x90196cbb26f12a7b
	.xword	0x1cd6bff1ebe0ea81
	.xword	0xf1f96b3b3f141025
	.xword	0xa838c40fc4b1cbe0
	.xword	0xee15738aa52a2942
	.xword	0x1e8fce52b802e91d
	.xword	0x686f56946e8c7e6a
	.xword	0x02aa6bc31d7acc9a
	.xword	0x4118474d89c0e0d1
	.xword	0x821e4eb46bc5c2ba
	.xword	0xf425665520da8acd
	.xword	0x0ce527e997ed5fa0
	.xword	0x4e774da56bcecd7d
	.xword	0x47445cb4f7127635
	.xword	0xc35fea3543f8703b
	.xword	0x2f9da0b57910bd55
	.xword	0xd9bcd8b0696f1062
	.xword	0x3895d811fe703680
	.xword	0x7c46765822c46140
	.xword	0x206fa2e8099f7f6d
	.xword	0x37387a0a4b1d32f2
	.xword	0xe6356b02b015711b
	.xword	0x948c051c2fbe4629
	.xword	0xe52e51ae460e692e
	.xword	0xd73eb9fb0dad8f49
	.xword	0xc86e2e4d7eff6e2c



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
	.xword	0xbcfe4ab1bc9c7f08
	.xword	0xe75801b444766b57
	.xword	0xcfc460c6a3fe2bac
	.xword	0xd540400efd7763bc
	.xword	0x4c12f5001affa3a7
	.xword	0x12aafe3f2085557e
	.xword	0xfa157627128799cc
	.xword	0xf9d96f6b5432b740
	.xword	0xf4557c5f30c9eaea
	.xword	0x40fba8d0db19e6dd
	.xword	0xe072a0710995ce9f
	.xword	0x700627d64eb139cf
	.xword	0xc6f1c631502d2593
	.xword	0xcfe56e91647b1fe7
	.xword	0x4c2337a8c42158d9
	.xword	0x736e00532792e066
	.xword	0x45f12cbff648cd79
	.xword	0xa3a97ddc902abfca
	.xword	0x7d228dddc5d9a406
	.xword	0xb5558d3c86039289
	.xword	0xaf3b1efecfac6ead
	.xword	0x8b58cbe06158df06
	.xword	0xab84640d21b1888c
	.xword	0xc4e3fd70406174e7
	.xword	0x8db4fd05ca028eb1
	.xword	0xe445124a61d54871
	.xword	0x9ce3dca6d975df27
	.xword	0xaf2b67ad71653954
	.xword	0x6b13abd28a04d2b9
	.xword	0x4ab07b09386c6a42
	.xword	0x14a238522b8b0191
	.xword	0xef1ad9bf262cee16
	.xword	0xad0997a6f1b7413a
	.xword	0x5ab10c02fe130d0a
	.xword	0xf7428a4bfaa89e7b
	.xword	0x92eb0b17f7e61cda
	.xword	0x074ea024c1917039
	.xword	0x616256836313cde5
	.xword	0x935ad07f1cd5d095
	.xword	0x64c8e7f1db498a33
	.xword	0x18880a8b6ac95962
	.xword	0x693554242f440dc9
	.xword	0x85053d8da6f53062
	.xword	0x5a996b077e5b26e7
	.xword	0x249d9c9b807a4030
	.xword	0xad3c1c5145839b65
	.xword	0x282465d998b9ebc7
	.xword	0x180d4365e0e12ee5
	.xword	0xa42bc472f41d8260
	.xword	0xb4de69f79cc00330
	.xword	0xace70e96020d9926
	.xword	0xb5a98f7082caec06
	.xword	0x7de3fc0cdb1bc011
	.xword	0x2d13fa640aad0457
	.xword	0x5fc40a7c55aa3338
	.xword	0x6e65c172edd290c3
	.xword	0xd995b2c443db5a0f
	.xword	0xd0e8a5877ea869af
	.xword	0x481a91011a8415f5
	.xword	0x8022558bfed27cc7
	.xword	0x7b0691b0419475f7
	.xword	0x230db5ef7b859965
	.xword	0x0fe430a4e0fb0501
	.xword	0x63fdf384272648a0
	.xword	0xe69ba52cb6717f7b
	.xword	0xbf2158e7e37ed87d
	.xword	0x2c716d74a1ac1ee5
	.xword	0xce0f0f079129600c
	.xword	0xc59ad9eeef75f43c
	.xword	0xdefe3c2ecb5ea7bb
	.xword	0xb438690cc249c90b
	.xword	0x4d641238df0e2481
	.xword	0x82d2dce24e771d78
	.xword	0x938fab2ad79dd2be
	.xword	0xb53f675db5fec138
	.xword	0x22ff452cc174e80d
	.xword	0xf54026ae8b079b1a
	.xword	0x66548259791a86f7
	.xword	0x63d5eb2a165f891a
	.xword	0xdf89b546ed5d9307
	.xword	0xd3f974a6fa29f5b3
	.xword	0x2ac4efc453084846
	.xword	0x5879483c72a81350
	.xword	0xb226298d3adcb9d3
	.xword	0xeb0119b18905572a
	.xword	0x4b0b64f73c44d4cb
	.xword	0x5eb7069bdc799d75
	.xword	0xed1e0cbb28e39e34
	.xword	0x49e73b409537e22b
	.xword	0x49dd4a2be6381064
	.xword	0xa9678ff9a74af378
	.xword	0xde461a2d5ac038bd
	.xword	0xb27fc3d207332760
	.xword	0x91278da178bb4346
	.xword	0x7d9c23c144ab1719
	.xword	0x7ee847a9e3907885
	.xword	0x81cce0826c15a289
	.xword	0x9d9206b7528a4847
	.xword	0xcf1afc74750dfc77
	.xword	0xf7c4dcf13945b938
	.xword	0xbc81f63ecc92c277
	.xword	0x534ad325990012b7
	.xword	0x76ed6b2116b7e17b
	.xword	0x1dabb75f00770b92
	.xword	0x84aeea50e03f8b74
	.xword	0x1d069db37b74895b
	.xword	0xb8c6f6a3fa4967e0
	.xword	0xa500f1d2b6b9782c
	.xword	0x012c8964eec12885
	.xword	0x54adcba01385e238
	.xword	0x3a51723773cf1ab0
	.xword	0xb33fe237290caeb3
	.xword	0xf97d4ec1458e967a
	.xword	0xa0676c14a9ea7084
	.xword	0xd7abb8570beeb4ca
	.xword	0x07985b6dd5051fb6
	.xword	0x549e62c50b31647e
	.xword	0xc5745526deb80fd2
	.xword	0x35f5d220bb39b5e8
	.xword	0xc37a65a31771e4ee
	.xword	0xb14bf30cf1023a06
	.xword	0xfc5932daa64f0931
	.xword	0x1350f5785bcae0e2
	.xword	0x1d833d7dc553e826
	.xword	0x435ca1a81271cb68
	.xword	0xdc2dbb85540a3aa0
	.xword	0xd209731b5209b646
	.xword	0xdb13f3350305b837
	.xword	0xc12424b108ce906f
	.xword	0x192ea8c368f2df32
	.xword	0x75119f81d101c42f
	.xword	0xca49642944949e26
	.xword	0x218f0e1b9a0e8a42
	.xword	0x8be3b5d5a3f96157
	.xword	0x8b69ca4300a1150b
	.xword	0x372601b739b89e69
	.xword	0xbf7b6ab4e3d05d5d
	.xword	0x1af34fd306b738d9
	.xword	0xb59cbe0caae9e11b
	.xword	0x1f05d221b2271a80
	.xword	0x59f7b9ec163b1770
	.xword	0x48c995f458d5346c
	.xword	0xf8f564ba5a8bf4dc
	.xword	0xf994a20570284730
	.xword	0x2c8ad65c8db16174
	.xword	0xe4e21f6cf6009bed
	.xword	0x96bd9a7d1523d88e
	.xword	0x3bf49951fef2b75b
	.xword	0x7c981ce14a40b582
	.xword	0x56b8fe239d2d42cd
	.xword	0xbd7f1a545a7eb3ae
	.xword	0x7f6af205719edfbc
	.xword	0x88178e36e72f24bc
	.xword	0x6fd326a96c125eb3
	.xword	0x8ea7947aa23f64de
	.xword	0x5784fb9fd5aa93fa
	.xword	0x8ae80989d2578dc7
	.xword	0x865395f40d76c457
	.xword	0xeef4ca4d80aab195
	.xword	0x7303ef4b5e54604b
	.xword	0x79363547d3265757
	.xword	0xdad801737a14d5b0
	.xword	0xf1b6add21509c9ca
	.xword	0x3e0e4fef9fa32ca6
	.xword	0x1771eeaa8d4bf21c
	.xword	0x5811ac9cfa34f0bb
	.xword	0xb97436ed8739115d
	.xword	0xbfbe337850dc23d8
	.xword	0x3c3f07cef9f28c85
	.xword	0xff6bb2b0d7245dee
	.xword	0x07333ac1aeefe31c
	.xword	0x27640e2dda110eb9
	.xword	0x9aca94cb53c16341
	.xword	0x13bb770385e6882d
	.xword	0xb5dcdc14b18d644a
	.xword	0x46b9095c07e29ada
	.xword	0x5b240589d270724b
	.xword	0x7643419e0adfe56f
	.xword	0x367bd73fb8d9d12f
	.xword	0xc5dd026aa18f6c88
	.xword	0x8caa6a61d5355b5c
	.xword	0x31ae52e7cbf5f3c9
	.xword	0xa694a7eb4a4e6bc3
	.xword	0xa0f35c72ecc982b1
	.xword	0x57e93a3de9ee4748
	.xword	0x939ed2c7a488aa24
	.xword	0xa5124028c44f8dd6
	.xword	0xed368f0a28159e86
	.xword	0x0fa3fbbfe92e6f12
	.xword	0xfeb4c5ab3fff5a0f
	.xword	0xc06fe01b49429fa2
	.xword	0x9a186d3702782a63
	.xword	0x92ed68d5bb785abc
	.xword	0x007feaffcb614d57
	.xword	0xf4d7525de8fcf567
	.xword	0x037c30256a6fcc46
	.xword	0x1c4ed59f0dd3537b
	.xword	0x9b305c445b491d25
	.xword	0x58aeb961437daa85
	.xword	0x0d3e74c963dff130
	.xword	0xfda986c3dd0d8877
	.xword	0x39040a25f17ff0df
	.xword	0xc523d8abf8f03f8f
	.xword	0x476d90df0afde059
	.xword	0xb7a52c52e9e58bf3
	.xword	0x36e9baa986304eb8
	.xword	0x148b9cb8ab0bd1e0
	.xword	0x8f6e358bebe9bc31
	.xword	0x2f38473fa846b738
	.xword	0xfa3ccb888c66906a
	.xword	0x8cee7abfbd38a4d8
	.xword	0xf715872d000a32d0
	.xword	0x2366ff9caca89d7b
	.xword	0xe6239c913a1256f2
	.xword	0x76c3144dbba52b83
	.xword	0xefece4373d3fb014
	.xword	0x2ba1acf8fe2f3977
	.xword	0x891364019d4aa05b
	.xword	0x648a632b7410a0af
	.xword	0xc20e3dd659c1a4ec
	.xword	0xa059a7487cacf428
	.xword	0xb32cbb6642ce4fa1
	.xword	0xd8b71f28cc37032e
	.xword	0x1e53013a8a73e4e2
	.xword	0xfc2e410bc2b8e127
	.xword	0x7af012d99eac62cf
	.xword	0x7ef245a8e162f574
	.xword	0x76eb9a8496915fe5
	.xword	0xe32742028eeb097a
	.xword	0x4629cc63348b73cb
	.xword	0xd4cee621e05209cd
	.xword	0xa537d8a6e3ec1e47
	.xword	0x6d034447a8ae12da
	.xword	0x5b5874a770b24f47
	.xword	0xf2663409271e3fdc
	.xword	0x836e1a1c6e77af23
	.xword	0x8940d6b9702e29d1
	.xword	0xb83174cd903a5caf
	.xword	0x17eabdf28e6c56c8
	.xword	0x60a0e2050ac872c1
	.xword	0x165ce0848c9cba23
	.xword	0x3de29d5ea1e258cd
	.xword	0xa7f999f5021f9e89
	.xword	0x3db578eea1b2d88c
	.xword	0x8528d5b2af213ae2
	.xword	0x5ab840a50a6a7925
	.xword	0x415afe9dcd826f60
	.xword	0x2a3cccfa1a0d8522
	.xword	0x789da01287661ab1
	.xword	0xdc67b9c8ed5b333c
	.xword	0xf33e0f384e8d2bc3
	.xword	0x221d8ba30fc730ed
	.xword	0xc6ce8d5d839977f8
	.xword	0xae38d07020821b6f
	.xword	0x277c2b2d62dd1b94
	.xword	0x9e9b7de7cc6d32fa



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
	.xword	0x90c300ac726784f3
	.xword	0xdf5e8522d9d277d9
	.xword	0x9d5123775ad9d291
	.xword	0x96fe4cdef0f2cff0
	.xword	0x4dbd1047cdb2af44
	.xword	0x8e2052294c6e89bd
	.xword	0x2c0f37066b1d896c
	.xword	0xd26bd44cb5cec9d8
	.xword	0x86f131a2a7655a85
	.xword	0x1af47a186f678689
	.xword	0x3276053bd54cfd35
	.xword	0x9796a4a61d50a392
	.xword	0x3a1d3d3d6639f1ad
	.xword	0xbcb93afe1c242cb9
	.xword	0x9e1930ce15cf2422
	.xword	0x15f499585cbe5c1e
	.xword	0x30ce57f03cef0685
	.xword	0x7aabe8de14faa35e
	.xword	0xc029553f107d52d3
	.xword	0x1af6ebfaabdcb347
	.xword	0x1a46c1c02a0d5279
	.xword	0x7347271587e2b00d
	.xword	0x664afb9def1735ac
	.xword	0x3e28c70324e7eb12
	.xword	0x97e55527704ceeba
	.xword	0x4e5fc8c96c54b5f9
	.xword	0x29f46d7291da97cb
	.xword	0xf7c79cbe4b49112f
	.xword	0x6492015a867f8676
	.xword	0x9a25230333fcd987
	.xword	0x19974a334dd5375c
	.xword	0x802828b642385e53
	.xword	0xbf01ab5f9ac3bfc1
	.xword	0x404f05b9e22458c7
	.xword	0xf9a2d4089a5acee6
	.xword	0xb03d6e9203e7e6b3
	.xword	0xd75098044e7d1e22
	.xword	0x6db9c44314fbfd01
	.xword	0xf592e396914c812c
	.xword	0xccb73b9150e1cfac
	.xword	0x7c40102f49025dbd
	.xword	0xb64057748c20324f
	.xword	0x6680f408ae976168
	.xword	0x894864a3d23447d5
	.xword	0xeba9f61911e4e2b1
	.xword	0xc73ea97046cc6308
	.xword	0xbbaf8d68095d2c22
	.xword	0x60070aeb3ed1b1b2
	.xword	0x109b576d04a930e4
	.xword	0xf61f939134535379
	.xword	0xb9ef3f4739b63efc
	.xword	0xe4a49c4bf98c8ca7
	.xword	0x82d8382ee0351cba
	.xword	0x1ec8f5a934be600c
	.xword	0x0911a19b9f72e379
	.xword	0x1fb052dfbd7651ca
	.xword	0x188c2daa328ae2a0
	.xword	0x3ee78b06bbc13838
	.xword	0x466f928a65e74c41
	.xword	0x2e31d53538b6722d
	.xword	0xfb98b647863c4db8
	.xword	0x5d9cc48b1f81a324
	.xword	0x6f213e8981ab8145
	.xword	0x86d078a85a2c0adf
	.xword	0x2b704947c43c6d87
	.xword	0x52d089346a0206a1
	.xword	0x72f00c4eb46a58ca
	.xword	0x69573be87f709c07
	.xword	0x40383982347361d6
	.xword	0xec90e497b0d2d602
	.xword	0xe56ee50a783cbb76
	.xword	0x7a90936c2b488481
	.xword	0x755f4d3cd334c3d7
	.xword	0x43afb9eda8145ac2
	.xword	0x8e2037fd2585cbce
	.xword	0x50338d278e6f5ea1
	.xword	0x7d217754810f30b0
	.xword	0x4e36b39d1dc341ca
	.xword	0xd9e3771d1c1e9a98
	.xword	0x25401c439ccef3e3
	.xword	0x47e7ab6fac49ee2c
	.xword	0xc9eabbd2bed8c872
	.xword	0x3bd5aaa3b58ff75d
	.xword	0x55cc0c8dd02c72fb
	.xword	0x8ccfb40886c237ea
	.xword	0xf2c33bce2294fd4b
	.xword	0xf31f823b0ac05c65
	.xword	0x260e5696fa9b7f2c
	.xword	0xf831b6a9e4e203d7
	.xword	0x9f580e3898b2fd81
	.xword	0xfe5574c1a578fdd1
	.xword	0x2daa93635c4ee094
	.xword	0xca68d60202e231e0
	.xword	0x214c2a220b3bd1c6
	.xword	0x422aaa745744527c
	.xword	0x61da8cbe7092bc7f
	.xword	0xfa7282aaa010d6cf
	.xword	0x9df9b0effec837ab
	.xword	0x9aaeb55df3a882ce
	.xword	0x578f1649624f580d
	.xword	0xe2032404981d490a
	.xword	0x1117348ecbbd9b16
	.xword	0xe922943f629a1987
	.xword	0x9522e852911c8809
	.xword	0xddc6c16a65601524
	.xword	0xbd5e38bad2f18e3c
	.xword	0x18abecf4a560f9ec
	.xword	0x5dc81d30ddea34a2
	.xword	0xa2baa38f815db585
	.xword	0x57f9be5e701f92f5
	.xword	0xb0e7fedb877dc1de
	.xword	0x01eeaa66dadd4671
	.xword	0xe1df6d6a8326717c
	.xword	0xa7b606aaad3476ff
	.xword	0x2e4013a059787cc0
	.xword	0xcebeec158fe2af46
	.xword	0x51d734c4a0743144
	.xword	0x71595244c553f66b
	.xword	0x953aa855a72692b3
	.xword	0x3d09ad1e937259fa
	.xword	0x7ebb1ebdf2235adf
	.xword	0xe49d36f601766e96
	.xword	0x803328396d3d8692
	.xword	0x896571a4ad457f7b
	.xword	0x25cbc137cf36030d
	.xword	0xfd38a118318b8982
	.xword	0xea0802377036a6f7
	.xword	0x86678a2c65c6a38e
	.xword	0x6d44d17f319674cf
	.xword	0xb1e20d3ef8f207eb
	.xword	0x60ed30b9169e2c41
	.xword	0x980739a5bf014c00
	.xword	0xa9162af5248b4773
	.xword	0xee061fb79fd0895d
	.xword	0x62915704dbf762d2
	.xword	0xfadf4b178ebd1ec8
	.xword	0xac57b807c3579bfc
	.xword	0x3d85a9a44d92e9ad
	.xword	0xd96a20051d541d26
	.xword	0xeb50e757c2e0b551
	.xword	0x1fc3db8bbcbd9e9c
	.xword	0xa2b989bb204faaec
	.xword	0x63c63126bf6fcbdf
	.xword	0x7caab95e9b7c60e4
	.xword	0x8439d26035041700
	.xword	0xe4f8de444128f346
	.xword	0x373467a2d488c62d
	.xword	0x894fb451abb4271f
	.xword	0xc251a4ae22bc9f79
	.xword	0xe6d2be027bebd337
	.xword	0xf1a071e2726f635b
	.xword	0xb59a6a9fa741babe
	.xword	0xf2dd7fa8ad135b62
	.xword	0x1b444591b9bcb512
	.xword	0x5bf9f3f739eacc08
	.xword	0xd2300eb9120e9eb8
	.xword	0x8716ef846428b980
	.xword	0x7be69e68987512fa
	.xword	0xd9e7193d510aac84
	.xword	0x248e3fe46db6b315
	.xword	0x6945021a33dd590f
	.xword	0xbaf8e8c52610636b
	.xword	0xc97cdfe2dd7bdba7
	.xword	0xb5212b643dd3b54c
	.xword	0x1a78ef6cf5c2fbce
	.xword	0xd6fbb91ae95c6aed
	.xword	0xf0591dc7cce7dcd3
	.xword	0x3653da175548990c
	.xword	0xa027dd50e1a55e1e
	.xword	0x94cae30ed7147c5f
	.xword	0x36732736d235a488
	.xword	0x32d2c9d989eff945
	.xword	0x52a64a10e723d217
	.xword	0x6b1c226c806924d8
	.xword	0x94b608c76538293d
	.xword	0x7abb9d857109fa3b
	.xword	0xe01662b1c5db04ae
	.xword	0xfe55e23441f671f3
	.xword	0x766eaea8095dda6c
	.xword	0x184ce81de7b5382d
	.xword	0xe150d3d951d70b8c
	.xword	0xf2e6a0d695a0d160
	.xword	0x5470d7027c381606
	.xword	0xab141baea46790c3
	.xword	0x937700f800a805b9
	.xword	0xbecebb5ec0a68529
	.xword	0x5099e40c6cddc39c
	.xword	0x69a30a47fca545b2
	.xword	0x6d03b67cdcf3b24a
	.xword	0x0fb72e62ee662bbb
	.xword	0xe2beefa22ece1d57
	.xword	0x6599cb05531b5d6e
	.xword	0x9dcaabb69d94d8f7
	.xword	0x818c1872211add8d
	.xword	0xbe7c71d99ead093e
	.xword	0x749a3f38d3f84950
	.xword	0xab20cb7f2f094701
	.xword	0xb972faff166b5d7d
	.xword	0x54508b5a3fa02177
	.xword	0x95457749da4f47c1
	.xword	0x19d14638641712d6
	.xword	0x5b6d40223037ed39
	.xword	0x2229c4d7aa78023c
	.xword	0x9582f7c8516a0888
	.xword	0xd91a9f4a5255a27a
	.xword	0x14bc653e870d6f36
	.xword	0x0c2efd09893fcd99
	.xword	0xf57983e2b53e2e76
	.xword	0x914a710ff6a4e989
	.xword	0x42281454e469963f
	.xword	0x3a359d5b262b1f36
	.xword	0x50e954c16e5b2fd7
	.xword	0xf8adf1cbcd454e49
	.xword	0x9c482204effc1612
	.xword	0x0f317c65ba1b5d9d
	.xword	0x1c42cdd3a7609937
	.xword	0xbb3d0d4e9a084b40
	.xword	0x60f7a753b6e4a659
	.xword	0x741cb7763394080f
	.xword	0x6dfbab637a6f23a7
	.xword	0xe7164d5b93e0f02d
	.xword	0xc6ca1e7976916711
	.xword	0xba213c7557639436
	.xword	0x3cbf97b29f1e465e
	.xword	0xc544f2c20b4e05cb
	.xword	0x655695e7b837095a
	.xword	0xd0516693dcf5e61d
	.xword	0xea2ba703ae3a9bcd
	.xword	0x2eb3d11ac2db627f
	.xword	0x9e65733294f5297e
	.xword	0x007191cf9d7b1d8c
	.xword	0x9bfb9276a99c29c5
	.xword	0x7fc4d886c073b86f
	.xword	0xbc8c3eb6fb3ba11c
	.xword	0x205349fba3416102
	.xword	0x00982a20c727bd65
	.xword	0x49038051f218cebb
	.xword	0x531994f59b836b13
	.xword	0x1d5041d18d7fa8fc
	.xword	0x32a54e7bf20e7671
	.xword	0xb481690d5bd228e2
	.xword	0xffa497718877100b
	.xword	0x1ab91b0a2498a206
	.xword	0x7b71a25f98cb5746
	.xword	0xef0cb1790437c643
	.xword	0x51799e8c2791498d
	.xword	0xbe88e5991f112a93
	.xword	0xd7e79662c78df5dc
	.xword	0xcd9b4c9be12c8f74
	.xword	0x281b79d012f35093
	.xword	0x25b1cc6351aed8c7
	.xword	0x3f00c4490ff7a10e
	.xword	0xf1a47131fb8bd3e9
	.xword	0xe72f689502ca20a7
	.xword	0x03fe4e77e6daf9d5
	.xword	0xc99d02514ca2e43c



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
	.xword	0xd0b6e3d2d16386f5
	.xword	0xf909eebe925d8a62
	.xword	0xf63dd2f81883906d
	.xword	0x52a80299c18cc168
	.xword	0x68dcf02abab069ed
	.xword	0xacd7fc42bae3d951
	.xword	0xefcc118a41733139
	.xword	0x3ba8b0260d96a022
	.xword	0xb4720796dd897029
	.xword	0xea5ed49f2e14c09d
	.xword	0xa3493cb74c085854
	.xword	0x9a816e7d89b82bcb
	.xword	0xc9d3fca189d44448
	.xword	0xa5c23805c71e5bc6
	.xword	0xc55bb1897e09e295
	.xword	0x22f6528d0c213c4d
	.xword	0x41c75382c2bc96c1
	.xword	0x8da88bbba71b8f5d
	.xword	0xca0a7ff6dd08b0fc
	.xword	0x8239431554cd7d8c
	.xword	0xdba40b226f360a4c
	.xword	0xf9c566aa963e5b32
	.xword	0x18ba8c000e103cc5
	.xword	0xfd9e611738b30dc5
	.xword	0x1fd9d3918f6fb811
	.xword	0x4e7897b6f1d6bc10
	.xword	0xdc89249acb241e81
	.xword	0x08d4b1b009a26f5a
	.xword	0x405ceaef302dcbce
	.xword	0xf60256e49255cb96
	.xword	0x6e02aaaf49fb33e9
	.xword	0xf74713970de9a8e7
	.xword	0xf6a69f40a0436c46
	.xword	0x8e0e6a0b1d533ca7
	.xword	0x58450fb158834269
	.xword	0x4d1a1d0521f4655d
	.xword	0x113a1341db401006
	.xword	0x5d0777ef7b189323
	.xword	0x23d6baf819ae13d9
	.xword	0xe3adfb0f3e5d85fd
	.xword	0x6728cec90d3697a0
	.xword	0x703783f30c755278
	.xword	0xbed9f906731bade7
	.xword	0x64dea7e720503396
	.xword	0xee6aa2aaf934fbe5
	.xword	0x7c691c3f74acd249
	.xword	0x705d1f57bdf55220
	.xword	0x918510bf578b40d9
	.xword	0xedc936af3b4472e3
	.xword	0x4a351fb31b507fe4
	.xword	0x336870ad83a4028f
	.xword	0x5f4a1bc25ec5a4b6
	.xword	0xfa7cc070de771a29
	.xword	0xf1c08104503cfc6b
	.xword	0x372d100325042ca2
	.xword	0x2a48682c76b13282
	.xword	0xa4ecedfd0f6d12c6
	.xword	0x194a8bb7ed8f7500
	.xword	0x764d34e725a70544
	.xword	0x5b7d74642cf18055
	.xword	0x8c4aa6d0db03dcb7
	.xword	0xa863145bfc609324
	.xword	0xa46bd15565168bf8
	.xword	0xd0fe6979e3ab7813
	.xword	0x8fabb229f69b6bd5
	.xword	0xd683ebd658c01ed5
	.xword	0x9db9de6b50a3d6f7
	.xword	0x1b876b1e22a79b64
	.xword	0xcc44b072e4afb320
	.xword	0xec5e2178dd02897c
	.xword	0x661d2c2c5d30db18
	.xword	0x8f06d42a3b5ab295
	.xword	0x19cf520b423c4aa6
	.xword	0x2523b93e0771c821
	.xword	0xa56f28e20a25ce29
	.xword	0x46234b988dc99e3d
	.xword	0x9c6df26a79472a5f
	.xword	0xdbf6d0d21f4ec9b9
	.xword	0x6796fab76e7a7321
	.xword	0x3a5eeb695d8de69f
	.xword	0xf91403b20ddd5c9e
	.xword	0xac5248583178a627
	.xword	0xa21a8fede6900108
	.xword	0x7a10491bb9897af2
	.xword	0xa3650420dab25e88
	.xword	0x4a117128bd2d0574
	.xword	0x4df6d34b5046d3f3
	.xword	0x9468cc9cf4d6ea9e
	.xword	0xe8448d3b45c31903
	.xword	0x08e5c0fa1a6e393a
	.xword	0x922f6a356dd86c30
	.xword	0xcbd1b3a139343db0
	.xword	0x958953f465715055
	.xword	0x545d9dc74d19f5b1
	.xword	0xc8cb59d5098daf50
	.xword	0x387cc38c688c3e46
	.xword	0x862352c0cfb0466c
	.xword	0x029ad2d45e7adcae
	.xword	0x882550883bdca363
	.xword	0x2364362ab34cefe9
	.xword	0x6e26444a0b145256
	.xword	0x4306a6c406ff48cd
	.xword	0xcea30b4792489582
	.xword	0x102a0b21dfb203c6
	.xword	0x4b1015fd4cb5308b
	.xword	0x95beb5936580ab10
	.xword	0xd23c2f52f01bcc8a
	.xword	0x6ba5d7a5046faaeb
	.xword	0xb65d1eb79f91644c
	.xword	0x17d15f136c373172
	.xword	0x9b78229e2a0cc954
	.xword	0xdba6647b04b39206
	.xword	0xf022d39e31d50ef6
	.xword	0x2470cb90aa213f1a
	.xword	0x0c205746596db2d4
	.xword	0x06c419ffde85307b
	.xword	0x3882c6a61ab16c3c
	.xword	0x71626eb7c453dd43
	.xword	0x82c50264f80f70b4
	.xword	0x0a9c1f3f8802316c
	.xword	0xf4ddf6a173f7d582
	.xword	0xb0449a8fb17ba86d
	.xword	0xd73197902fe665cc
	.xword	0xdc173edb8339750b
	.xword	0xd8445aceca61a75b
	.xword	0x9139d882c49aabf2
	.xword	0x74268a2e364cf734
	.xword	0x3b08adf0449240ec
	.xword	0x79912e289d581699
	.xword	0x3039f59b03714fd7
	.xword	0xfc976beda676640b
	.xword	0x6482697fcb5d03e8
	.xword	0x03a7eaf8a5b2ab0a
	.xword	0xbe9c9144af01efdd
	.xword	0xb3754b9f6d3b4318
	.xword	0xa70168c743c892f7
	.xword	0x91b60755b47ba7ee
	.xword	0xda331e97fd29cb4a
	.xword	0x7547f7401c836d17
	.xword	0x44d3068aab9b294e
	.xword	0x2be408a1fc71e78c
	.xword	0x297bb86dc9b7d895
	.xword	0x39e4e41feb2d460d
	.xword	0xecc1376649f4e6fa
	.xword	0x0ed730a2258becb6
	.xword	0x3cad290f331a0ab5
	.xword	0x3445c084786c3ea8
	.xword	0xac5c76bf3bc91c93
	.xword	0x87990a26ce71701b
	.xword	0x8ae9c0284dcfdff9
	.xword	0x06a5f198f5e05927
	.xword	0x3b329d52ca688c56
	.xword	0xe8b2ddd4cb7b2159
	.xword	0x846a25d63ebb1fa4
	.xword	0x9e0a13363a6b4671
	.xword	0x6708c56f4338aa60
	.xword	0x83196dbf3c28b528
	.xword	0xca4ed155f76029e6
	.xword	0x9b2b230a139a6e92
	.xword	0x2f721537b677cc4c
	.xword	0x5a28fc71f4a65cb5
	.xword	0xf29b6dc33c7939f4
	.xword	0xfd1faf43b344200d
	.xword	0x523260dab940462f
	.xword	0xad1efd7f3fe1b1a2
	.xword	0x029b16b0b4fbe0c9
	.xword	0xe1f54bc82553798b
	.xword	0xe3926a5bf99b23fc
	.xword	0xb4e4a40b2c4253aa
	.xword	0xdeb09798fc715a16
	.xword	0xdeb9f1209d8b248b
	.xword	0x7d609bcbeeb535f9
	.xword	0x34894b5f49d84b24
	.xword	0xcf6bf61a47be062e
	.xword	0x4f6ffa499feecf49
	.xword	0xc85eae8f89ae296a
	.xword	0x3599eb73a7b4a64d
	.xword	0x79424e914253031d
	.xword	0x4d45da11017505a3
	.xword	0x05701dabd832f251
	.xword	0xc0bc8b968b38165b
	.xword	0x35410757e42df443
	.xword	0xa31463154a9e8c62
	.xword	0x54ce5095ac9912f4
	.xword	0x4ede0dc764f74ff3
	.xword	0x450dda87c1ae782b
	.xword	0x4fc344b444a9f3bb
	.xword	0x89b63ac23dc2183a
	.xword	0xd2a1293bbe012f16
	.xword	0xa063c266bfccef7f
	.xword	0xa5ef2e49fa69bd62
	.xword	0xebfc7b15f0f299c2
	.xword	0x0a25c023403374e9
	.xword	0xa5a16fa4e4f73df0
	.xword	0xcefbafd04b920145
	.xword	0x91bdbbcce66bce7c
	.xword	0xaf3a92c50c46add4
	.xword	0x5c01de1b8383ee73
	.xword	0xd4f63b16543fe449
	.xword	0x67e4b6ad4bf34a4e
	.xword	0x8b001bc058886655
	.xword	0x27ee978acc40b5a2
	.xword	0xabdda8b15026227a
	.xword	0xf042845cf66c22b4
	.xword	0x7c62fb9e0c4ba258
	.xword	0x5ea503097c323c86
	.xword	0xc209c2dff1f15063
	.xword	0x9fb966e64b1b7c0f
	.xword	0xf74cac8efb364f76
	.xword	0xb5be6a5899460d6d
	.xword	0x25a2e6c95a959d78
	.xword	0x325c6332945c2485
	.xword	0xf559b9e10f7021ba
	.xword	0x80640858dd3fcab5
	.xword	0xec5430c92c298975
	.xword	0x24c9efaa83243354
	.xword	0x4c1d8a9cd1da1987
	.xword	0x625a8291ef171302
	.xword	0xad8570d578802df4
	.xword	0x6328d370e449a0f0
	.xword	0xcff58e95201c8cdd
	.xword	0xedb5c22f4a467354
	.xword	0x4a995640a9f6243a
	.xword	0x866c571f77c0f64b
	.xword	0xc7b54662c50921fc
	.xword	0x4cc18fe5497d904e
	.xword	0xbae136da2d99c5cb
	.xword	0x5a1020b50f46dc7b
	.xword	0xa442d24e114b0d39
	.xword	0x279457405a309963
	.xword	0x9c037d2475bcdd0d
	.xword	0x5e5a9069c02a8cc0
	.xword	0xb58a2d17e93b685f
	.xword	0x2c130551d5e7a662
	.xword	0x155af55949e77c7d
	.xword	0xae6c06391ce61ac4
	.xword	0x89f932de6c03c9ef
	.xword	0x8bd1751d5707ffb9
	.xword	0xeb0bfeedfd509085
	.xword	0x2b3f6cc6e623bfd2
	.xword	0xddd84899f6556c2e
	.xword	0x622234f15c4b92ac
	.xword	0xa0503eda8cfe9fb3
	.xword	0xf2abcd3baa2f4a56
	.xword	0x47c0463cab62ae8a
	.xword	0x966f2c545b2a4be9
	.xword	0xaa6de2fb61a9036d
	.xword	0x188539dba2baa9d8
	.xword	0x09d53cd2e8973b48
	.xword	0x33cff37ccc411c0a
	.xword	0x1746d384bd74c5d1
	.xword	0x51051009602cb94c
	.xword	0x37dedff2fd632136
	.xword	0xdab36f2c6b3bf09c
	.xword	0xe2bf9b3274cd4d6b
	.xword	0x45f9547592354e38



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
!!#   int config_cnt = 0;
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
!!# #define MY_HYP_SEC	1
!!# #define NCDATA0	2
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
!!#   IJ_set_rvar ("diag.j", 105, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 106, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 107, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 120, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 129, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 130, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 133, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 144, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 156, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 0000 00rr r000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 169, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 179, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 189, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 199, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 209, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 219, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 230, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 238, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 246, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 247, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 248, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 249, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 252, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 253, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 255, th_M, 0x1);
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 257, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 258, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 262, th_M, "\tta\t0x30\n");
!!#   IJ_printf ("diag.j", 263, th_M, "\tmov\t0,\%%g4 \n");
!!#   IJ_printf ("diag.j", 264, th_M, "\tsetx\tncdata_base0, %%g1, %%g2 \n");        
!!#   IJ_printf ("diag.j", 265, th_M, "\tsetx\t0x1000, %%g1, %%g3 \n");               
!!#   IJ_printf ("diag.j", 266, th_M, "\tadd\t\%%g2, \%%g3, \%%g3 \n");
!!# 
!!#   IJ_printf ("diag.j", 268, th_M, "\t!\tnitalize \n");
!!#   IJ_printf ("diag.j", 269, th_M, "\tadd 0x0, %%g0, %%g4 \n");
!!#   IJ_printf ("diag.j", 270, th_M, "\tadd 0x0, %%g0, %%g2 \n");
!!#   IJ_printf ("diag.j", 271, th_M, "\tadd 0x00f, %%g0, %%g5 \n");
!!#   IJ_printf ("diag.j", 272, th_M, "\tstloop0: \n");
!!#   IJ_printf ("diag.j", 273, th_M, "\tstx %%g2, [%%g3 + %%g4] \n");
!!#   IJ_printf ("diag.j", 274, th_M, "\tinc %%g2 \n");
!!#   IJ_printf ("diag.j", 275, th_M, "\tadd 0x8, %%g4, %%g4 \n");
!!#   IJ_printf ("diag.j", 276, th_M, "\tdeccc %%g5 \n");
!!#   IJ_printf ("diag.j", 277, th_M, "\tbne stloop0 \n");
!!#   IJ_printf ("diag.j", 278, th_M, "\tnop \n");
!!# 
!!#   IJ_bind_thread_group("diag.j", 280, th_all, 0x000000ff); ! 2 cores 2 threads
!!#   IJ_th_fork_group("diag.j", 281, th_all);
!!# 
!!#   IJ_bind_file_group("diag.j", 284, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 285, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_printf ("diag.j", 289, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 290, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 291, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 293, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 295, sjm_4, "#==================================================\n");
!!# 
!!#   IJ_printf ("diag.j", 297, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 298, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 299, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 300, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 302, sjm_5, "#==================================================\n");
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
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 335,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 337,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 342,Seq_Start, NULL, 2);
!!#   IJ_th_join_group("diag.j", 343, th_all);
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
!!# 		IJ_generate ("diag.j", 519, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# !inst_type: set_addr load alu store 
!!# inst_type: set_addr load alu store sjm4 sjm5
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 527, th_all, $2);
!!# 		IJ_generate ("diag.j", 528, th_all, $3);
!!# 		IJ_generate ("diag.j", 529, th_all, $4);
!!# 		!IJ_generate (th_all, $5);
!!# 		!IJ_generate (th_all, $6);
!!# 		!IJ_generate (th_all, $7);
!!# }
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
!!#                    IJ_printf ("diag.j", 547, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 550, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 552, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 553, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 557, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 558, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 559, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 560, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 562, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 563, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 576, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 581, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 585, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 586, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 588, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 589, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 603, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 607, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 608, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 625, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 630, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 631, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 633, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 634, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 636, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 637, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 642, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 643, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 645, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 646, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 663, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 666, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 668, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 669, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 673, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 674, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 675, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 676, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 678, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 679, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 692, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 697, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 701, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 702, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 704, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 705, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 720, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 723, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 725, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 726, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 741, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 744, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 745, Rv_rand32);
!!#                          IJ_printf ("diag.j", 746, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 751, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 753, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 767, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 773, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 777, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 792, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 794, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 796, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 802, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 803, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 830, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 836, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 837, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 840, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 842, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 851, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 853, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 871, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 877, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 882, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 884, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 902, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 905, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 907, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 908, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 911, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 912, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 913, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 914, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 916, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 917, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 930, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 935, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 939, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 940, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 942, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 943, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 957, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 961, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 962, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 979, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 984, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 985, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 987, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 988, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 990, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 991, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 996, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 997, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 999, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1000, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1017, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1020, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1022, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1023, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1027, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1028, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1029, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1030, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1032, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1033, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1046, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1051, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1055, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1056, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1058, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1059, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1075, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1078, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1080, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1081, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1096, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1099, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1100, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1101, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1106, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1108, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1122, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1128, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1132, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1146, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1148, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1150, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1156, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1157, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1184, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1190, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1191, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1194, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1196, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1205, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1207, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1225, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1231, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1236, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1238, sjm_5, "\n");
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
!!# set_addr:  set_memaddr
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR
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
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !	IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                       IJ_printf ("diag.j", 1280, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                 }
!!# ;
!!# 
!!# load: gLOAD  %ropr  Rv_ldstD 
!!# ;
!!# 
!!# store: gSTORE  %ropr  Rv_ldstD
!!# ;
!!# 
!!# alu: gALU 
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
