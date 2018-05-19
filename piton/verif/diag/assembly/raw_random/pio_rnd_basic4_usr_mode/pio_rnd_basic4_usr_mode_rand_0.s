// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_rand_0.s
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
   random seed:	948317807
   Jal pio_rnd_basic4_usr_mode.j:	
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

th_fork(th_main, %l0)

th_main_0:
	ta	0x30

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
        mov     0,%l4
        setx    ncdata_base0, %l0, %l2           ! nc data base
        setx    0x1000, %l0, %l3                ! nc datawork area
        add     %l2, %l3, %g3
!loop0:	
!	ldub	[%l1 + 0x7f], %l3
!	subcc	%l3, %l2, %g0
!	bnz	loop0
!	nop
!	prefetch [%l1 + 0x3f], #n_writes

! initalize 
add 0x0, %g0, %g4
add 0x0, %g0, %g2
add 0x00f, %g0, %g5
!setx 0x800e000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

! Register init code

	setx 0xf473325b3100872c, %g1, %g0
	setx 0x5c5681c7b9329bf3, %g1, %g1
	setx 0x1b83753ca7d59aa1, %g1, %g2
	setx 0x0b83fded933d072f, %g1, %g3
	setx 0x5f23429219074991, %g1, %g4
	setx 0xa73122505912c463, %g1, %g5
	setx 0xfec13dc94405e3ec, %g1, %g6
	setx 0x94284c94c0e40ffc, %g1, %g7
	setx 0x63adf8c3c4ed4a74, %g1, %r16
	setx 0x56ef9fc35bb68fa9, %g1, %r17
	setx 0xa9b14dff80a07611, %g1, %r18
	setx 0xaf546be4e0b06cb2, %g1, %r19
	setx 0xc3479b588a1da2db, %g1, %r20
	setx 0x2d02eee2fa33cce9, %g1, %r21
	setx 0x65b0a6c6d4bf7f8b, %g1, %r22
	setx 0x0917f0b66f1f1780, %g1, %r23
	setx 0x8514b0c45546e5c7, %g1, %r24
	setx 0x8b8b4f7f964b7cf3, %g1, %r25
	setx 0x1033ad4637205bb0, %g1, %r26
	setx 0x04d79e101e6264ea, %g1, %r27
	setx 0x0e899698683d73de, %g1, %r28
	setx 0xcd219670aee72dfb, %g1, %r29
	setx 0xe3c6c1fa15195745, %g1, %r30
	setx 0x099ff9b59eb612c2, %g1, %r31
	save
	setx 0xd070e6b11fe58967, %g1, %r16
	setx 0x4891cf694ab5a137, %g1, %r17
	setx 0x138faa5a039f6662, %g1, %r18
	setx 0x72b460a9bb6b93dd, %g1, %r19
	setx 0x02f01aa8556e86b2, %g1, %r20
	setx 0x9845e98cbbf3ce6b, %g1, %r21
	setx 0xb275e7ef91c92952, %g1, %r22
	setx 0x6484c7f1e489d604, %g1, %r23
	setx 0xa8b835031d1182fe, %g1, %r24
	setx 0x943a3d8577042771, %g1, %r25
	setx 0xe7082c7528bac486, %g1, %r26
	setx 0xd02034c3015d929d, %g1, %r27
	setx 0x9fe8ad31dc1b5726, %g1, %r28
	setx 0x2f8da4fa7ddf927c, %g1, %r29
	setx 0xaac5bdde4d0c7a1f, %g1, %r30
	setx 0xb20f90c29e23464e, %g1, %r31
	save
	setx 0xabaf1d4ddae136bf, %g1, %r16
	setx 0x29959d77f595f550, %g1, %r17
	setx 0x341c91c1978309ac, %g1, %r18
	setx 0xe2a34abfef720c62, %g1, %r19
	setx 0x5c09bb97aad1a951, %g1, %r20
	setx 0x5534d72cabd9ee59, %g1, %r21
	setx 0x998bb2ea6e869c80, %g1, %r22
	setx 0x911568ffa3f2b6bd, %g1, %r23
	setx 0xd1ba22400458c243, %g1, %r24
	setx 0x109eb35a65ae1b38, %g1, %r25
	setx 0x5e1ce53679ac01af, %g1, %r26
	setx 0x471b3e4b9e39024f, %g1, %r27
	setx 0x77ff3a053ee6f4c1, %g1, %r28
	setx 0xf958ccdb855bc76f, %g1, %r29
	setx 0xa816261a092b1660, %g1, %r30
	setx 0xc0d0c260eb08dbee, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0598008  ! 1: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4798008  ! 2: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa291a008  ! 3: ORcc_I	orcc 	%r6, 0x0008, %r17
	.word 0xe0218008  ! 4: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xeee9a020  ! 5: LDSTUBA_I	ldstuba	%r23, [%r6 + 0x0020] %asi
	.word 0x8143c000  ! 6: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0498008  ! 10: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe069a000  ! 11: LDSTUB_I	ldstub	%r16, [%r6 + 0x0000]
	.word 0xae89a038  ! 12: ANDcc_I	andcc 	%r6, 0x0038, %r23
	.word 0xe8398008  ! 13: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe5f1a008  ! 14: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143e011  ! 15: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8598008  ! 19: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe2798008  ! 20: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xaab1a030  ! 21: SUBCcc_I	orncc 	%r6, 0x0030, %r21
	.word 0xe4398008  ! 22: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe7f1a008  ! 23: CASXA_R	casxa	[%r6]%asi, %r8, %r19
	.word 0x8143e011  ! 24: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4018008  ! 28: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe4798008  ! 29: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa099a018  ! 30: XORcc_I	xorcc 	%r6, 0x0018, %r16
	.word 0xe0318008  ! 31: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe5f1a008  ! 32: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143c000  ! 33: STBAR	stbar
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec19a018  ! 37: LDD_I	ldd	[%r6 + 0x0018], %r22
	.word 0xe6698008  ! 38: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xa6298008  ! 39: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe4298008  ! 40: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe2e9a008  ! 41: LDSTUBA_I	ldstuba	%r17, [%r6 + 0x0008] %asi
	.word 0x8143c000  ! 42: STBAR	stbar
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0198008  ! 46: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xea698008  ! 47: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xa209a020  ! 48: AND_I	and 	%r6, 0x0020, %r17
	.word 0xe429a020  ! 49: STB_I	stb	%r18, [%r6 + 0x0020]
	.word 0xe2e98008  ! 50: LDSTUBA_R	ldstuba	%r17, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 51: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe851a020  ! 55: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	.word 0xee798008  ! 56: SWAP_R	swap	%r23, [%r6 + %r8]
	.word 0xa2818008  ! 57: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xec31a020  ! 58: STH_I	sth	%r22, [%r6 + 0x0020]
	.word 0xe2e9a038  ! 59: LDSTUBA_I	ldstuba	%r17, [%r6 + 0x0038] %asi
	.word 0x8143c000  ! 60: STBAR	stbar
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8418008  ! 64: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xee69a018  ! 65: LDSTUB_I	ldstub	%r23, [%r6 + 0x0018]
	.word 0xaa198008  ! 66: XOR_R	xor 	%r6, %r8, %r21
	.word 0xec21a018  ! 67: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xe4f98008  ! 68: SWAPA_R	swapa	%r18, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 69: STBAR	stbar
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec498008  ! 73: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe4798008  ! 74: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa8418008  ! 75: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe8318008  ! 76: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe1e1a008  ! 77: CASA_R	casa	[%r6] %asi, %r8, %r16
	.word 0x8143e011  ! 78: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec49a018  ! 82: LDSB_I	ldsb	[%r6 + 0x0018], %r22
	.word 0xe279a008  ! 83: SWAP_I	swap	%r17, [%r6 + 0x0008]
	.word 0xac818008  ! 84: ADDcc_R	addcc 	%r6, %r8, %r22
	.word 0xec218008  ! 85: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0e9a028  ! 86: LDSTUBA_I	ldstuba	%r16, [%r6 + 0x0028] %asi
	.word 0x8143c000  ! 87: STBAR	stbar
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe449a028  ! 91: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xe679a038  ! 92: SWAP_I	swap	%r19, [%r6 + 0x0038]
	.word 0xa0018008  ! 93: ADD_R	add 	%r6, %r8, %r16
	.word 0xe029a038  ! 94: STB_I	stb	%r16, [%r6 + 0x0038]
	.word 0xe1f1a008  ! 95: CASXA_R	casxa	[%r6]%asi, %r8, %r16
	.word 0x8143c000  ! 96: STBAR	stbar
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec098008  ! 100: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe679a000  ! 101: SWAP_I	swap	%r19, [%r6 + 0x0000]
	.word 0xae318008  ! 102: SUBC_R	orn 	%r6, %r8, %r23
	.word 0xec298008  ! 103: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe0f98008  ! 104: SWAPA_R	swapa	%r16, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 105: STBAR	stbar
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe279a000  ! 110: SWAP_I	swap	%r17, [%r6 + 0x0000]
	.word 0xaa918008  ! 111: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe021a000  ! 112: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe2e98008  ! 113: LDSTUBA_R	ldstuba	%r17, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 114: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4118008  ! 118: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe0698008  ! 119: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa6a9a020  ! 120: ANDNcc_I	andncc 	%r6, 0x0020, %r19
	.word 0xe0298008  ! 121: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xeff18008  ! 122: CASXA_I	casxa	[%r6] 0x 0, %r8, %r23
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec09a020  ! 127: LDUB_I	ldub	[%r6 + 0x0020], %r22
	.word 0xe879a020  ! 128: SWAP_I	swap	%r20, [%r6 + 0x0020]
	.word 0xae31a008  ! 129: ORN_I	orn 	%r6, 0x0008, %r23
	.word 0xe0298008  ! 130: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe9e1a008  ! 131: CASA_R	casa	[%r6] %asi, %r8, %r20
	.word 0x8143e011  ! 132: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0018008  ! 136: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe469a018  ! 137: LDSTUB_I	ldstub	%r18, [%r6 + 0x0018]
	.word 0xa0318008  ! 138: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe0298008  ! 139: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xece98008  ! 140: LDSTUBA_R	ldstuba	%r22, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 141: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0418008  ! 145: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe6798008  ! 146: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xaa918008  ! 147: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe021a018  ! 148: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe8e98008  ! 149: LDSTUBA_R	ldstuba	%r20, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 150: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe011a018  ! 154: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xe679a010  ! 155: SWAP_I	swap	%r19, [%r6 + 0x0010]
	.word 0xa6918008  ! 156: ORcc_R	orcc 	%r6, %r8, %r19
	.word 0xe031a010  ! 157: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xe3f18008  ! 158: CASXA_I	casxa	[%r6] 0x 0, %r8, %r17
	.word 0x8143c000  ! 159: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0418008  ! 163: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xec798008  ! 164: SWAP_R	swap	%r22, [%r6 + %r8]
	.word 0xa6b1a038  ! 165: SUBCcc_I	orncc 	%r6, 0x0038, %r19
	.word 0xe4318008  ! 166: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe4e9a010  ! 167: LDSTUBA_I	ldstuba	%r18, [%r6 + 0x0010] %asi
	.word 0x8143e011  ! 168: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe059a010  ! 172: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xe4698008  ! 173: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa0b98008  ! 174: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xe031a010  ! 175: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xe6e9a028  ! 176: LDSTUBA_I	ldstuba	%r19, [%r6 + 0x0028] %asi
	.word 0x8143c000  ! 177: STBAR	stbar
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec51a028  ! 181: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	.word 0xe2698008  ! 182: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xae31a010  ! 183: SUBC_I	orn 	%r6, 0x0010, %r23
	.word 0xe4318008  ! 184: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe0e9a028  ! 185: LDSTUBA_I	ldstuba	%r16, [%r6 + 0x0028] %asi
	.word 0x8143e011  ! 186: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8418008  ! 190: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe679a008  ! 191: SWAP_I	swap	%r19, [%r6 + 0x0008]
	.word 0xa0018008  ! 192: ADD_R	add 	%r6, %r8, %r16
	.word 0xe0318008  ! 193: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xeae98008  ! 194: LDSTUBA_R	ldstuba	%r21, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 195: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe041a008  ! 199: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xea79a020  ! 200: SWAP_I	swap	%r21, [%r6 + 0x0020]
	.word 0xaa118008  ! 201: OR_R	or 	%r6, %r8, %r21
	.word 0xe029a020  ! 202: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xefe1a008  ! 203: CASA_R	casa	[%r6] %asi, %r8, %r23
	.word 0x8143e011  ! 204: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec09a020  ! 208: LDUB_I	ldub	[%r6 + 0x0020], %r22
	.word 0xea798008  ! 209: SWAP_R	swap	%r21, [%r6 + %r8]
	.word 0xae398008  ! 210: XNOR_R	xnor 	%r6, %r8, %r23
	.word 0xe0318008  ! 211: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xeae98008  ! 212: LDSTUBA_R	ldstuba	%r21, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe019a020  ! 217: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xea798008  ! 218: SWAP_R	swap	%r21, [%r6 + %r8]
	.word 0xa281a038  ! 219: ADDcc_I	addcc 	%r6, 0x0038, %r17
	.word 0xec298008  ! 220: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xecf98008  ! 221: SWAPA_R	swapa	%r22, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 222: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec59a038  ! 226: LDX_I	ldx	[%r6 + 0x0038], %r22
	.word 0xe079a030  ! 227: SWAP_I	swap	%r16, [%r6 + 0x0030]
	.word 0xa6298008  ! 228: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe8218008  ! 229: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe3f18008  ! 230: CASXA_I	casxa	[%r6] 0x 0, %r8, %r17
	.word 0x8143e011  ! 231: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe419a030  ! 235: LDD_I	ldd	[%r6 + 0x0030], %r18
	.word 0xe8798008  ! 236: SWAP_R	swap	%r20, [%r6 + %r8]
	.word 0xa821a030  ! 237: SUB_I	sub 	%r6, 0x0030, %r20
	.word 0xe839a030  ! 238: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe8e98008  ! 239: LDSTUBA_R	ldstuba	%r20, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 240: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 244: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe2698008  ! 245: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xaaa18008  ! 246: SUBcc_R	subcc 	%r6, %r8, %r21
	.word 0xe8218008  ! 247: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xecf9a000  ! 248: SWAPA_I	swapa	%r22, [%r6 + 0x0000] %asi
	.word 0x8143c000  ! 249: STBAR	stbar
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe801a000  ! 253: LDUW_I	lduw	[%r6 + 0x0000], %r20
	.word 0xee798008  ! 254: SWAP_R	swap	%r23, [%r6 + %r8]
	.word 0xaaa1a018  ! 255: SUBcc_I	subcc 	%r6, 0x0018, %r21
	.word 0xec718008  ! 256: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xece98008  ! 257: LDSTUBA_R	ldstuba	%r22, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 258: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0518008  ! 262: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xee79a010  ! 263: SWAP_I	swap	%r23, [%r6 + 0x0010]
	.word 0xa8018008  ! 264: ADD_R	add 	%r6, %r8, %r20
	.word 0xe829a010  ! 265: STB_I	stb	%r20, [%r6 + 0x0010]
	.word 0xe0f9a008  ! 266: SWAPA_I	swapa	%r16, [%r6 + 0x0008] %asi
	.word 0x8143e011  ! 267: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe009a008  ! 271: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xee798008  ! 272: SWAP_R	swap	%r23, [%r6 + %r8]
	.word 0xa4a1a020  ! 273: SUBcc_I	subcc 	%r6, 0x0020, %r18
	.word 0xe8718008  ! 274: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe2e9a038  ! 275: LDSTUBA_I	ldstuba	%r17, [%r6 + 0x0038] %asi
	.word 0x8143e011  ! 276: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0498008  ! 280: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe469a008  ! 281: LDSTUB_I	ldstub	%r18, [%r6 + 0x0008]
	.word 0xa6198008  ! 282: XOR_R	xor 	%r6, %r8, %r19
	.word 0xe039a008  ! 283: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xe8f9a020  ! 284: SWAPA_I	swapa	%r20, [%r6 + 0x0020] %asi
	.word 0x8143e011  ! 285: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec018008  ! 289: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe079a018  ! 290: SWAP_I	swap	%r16, [%r6 + 0x0018]
	.word 0xa8018008  ! 291: ADD_R	add 	%r6, %r8, %r20
	.word 0xe8318008  ! 292: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xeef98008  ! 293: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 294: STBAR	stbar
	setx	0x00000000d01ef020, %r1, %r6



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
	.xword	0x4956fd594d4ab764
	.xword	0x24db380586feadde
	.xword	0x4d9bc25411229648
	.xword	0xe3c8a339cb15d36d
	.xword	0xd31b2f2290dc71bf
	.xword	0x19ed1acd6a79add2
	.xword	0xc63fee571693325f
	.xword	0x20455e4b33a9bf04
	.xword	0x2449186578bd42cc
	.xword	0xc05cf3423dcc391b
	.xword	0x9aa8d067dd95cc65
	.xword	0xdf198bb030a258db
	.xword	0xd7a1f01c1d9902df
	.xword	0x9632f7d69e55774d
	.xword	0x46a732d4cdb938d4
	.xword	0xd26319966f0e9b24
	.xword	0x77c0d1c165c5ccae
	.xword	0xa2423a777f549756
	.xword	0xc58ace70f44dc5a4
	.xword	0x8fddd33cd0133ace
	.xword	0x79844ebe9e9a5534
	.xword	0x6b68c63f4ccc2144
	.xword	0x285bab739a64d90f
	.xword	0x607ec984b159d00d
	.xword	0xab4132d9379e97bb
	.xword	0x174c5f267cd3d293
	.xword	0xbfd7453ffc4f401a
	.xword	0x8642afe76e0248a3
	.xword	0x911b8c12aaea9bd0
	.xword	0x72fac04247e767d3
	.xword	0x6f3551e1240df512
	.xword	0x293046e30cad6bb3
	.xword	0xcb0d1a5004c46732
	.xword	0xfb48713d4de0a48b
	.xword	0x0edc6ac051831515
	.xword	0x4cc9eb3875d6e4ae
	.xword	0x66b9b97d9d48f6e1
	.xword	0x07286981b28d1351
	.xword	0x724a9c5047aac70a
	.xword	0x36bd62ff1507f4f7
	.xword	0xd1065ac221cc4bd1
	.xword	0xba79fa28a52a0fe8
	.xword	0x2371834762ed812d
	.xword	0xb229da9504cd2287
	.xword	0x84a3d966dbf24749
	.xword	0xb59c9a110371878b
	.xword	0x26843fc540f652e7
	.xword	0x4a73bad7af5ab8f4
	.xword	0x25425d49d92bc029
	.xword	0x4e6be608c54734e4
	.xword	0xb302bb1f542cf348
	.xword	0x8d20183d61769d09
	.xword	0x55163751e544bd3c
	.xword	0xfaa0fb44fa9f5fac
	.xword	0xb9e1821cbd63b285
	.xword	0xb0df08cdac069751
	.xword	0x1cd551ba0a683997
	.xword	0x21a1d7da40a73734
	.xword	0x5d88073fc54faa6b
	.xword	0x11415c9968b4d554
	.xword	0x35bd48b97f457529
	.xword	0x431f6cd57ce2657f
	.xword	0x7a5e2c3e20be36fc
	.xword	0x60fd9d2deaf6946a
	.xword	0x8fc20874e71e9052
	.xword	0x4c7d63e7d9a6d4e3
	.xword	0x022d5bfe53678696
	.xword	0x2901ba028f4b05d3
	.xword	0x8e28f498775d5596
	.xword	0x08f65d3ba93c7f58
	.xword	0x09e920ba1a35a3b9
	.xword	0x54df7a7d5a6945bf
	.xword	0xdd0f35e4470efbe2
	.xword	0x5b981964fcf9cc15
	.xword	0x44729725fe91c60b
	.xword	0x6f885fb1683394de
	.xword	0x03ce82740f48d1a7
	.xword	0x3457a035194b747a
	.xword	0xa242937c17237054
	.xword	0x1b2cd6208db9c3c6
	.xword	0x08803cddfc463bf8
	.xword	0xafa37846bec5c94c
	.xword	0xfab118ed8364d24a
	.xword	0x629d6e8af2e036a0
	.xword	0xc9f9cfc52c0e3724
	.xword	0xb398ddbd9e245fb8
	.xword	0xa83905a1d79a44b6
	.xword	0xb4523abfd1279667
	.xword	0x6628a89462b043c8
	.xword	0xa5e84ba40f451e1b
	.xword	0x4a7786bd20963f23
	.xword	0xc290313a145bf424
	.xword	0x3a0f526dcb224984
	.xword	0xb53c906d6d54e439
	.xword	0xfa192fff5304b31a
	.xword	0xeb921d431b7580f4
	.xword	0x30df257ec3607418
	.xword	0xb1069be136fc6887
	.xword	0xc8f33a672831c65d
	.xword	0xa9a4c130e7d198c4
	.xword	0x3843b7fa059f051c
	.xword	0x3bb0377dfa3cdf58
	.xword	0xc412cc36065eadad
	.xword	0x89068cb5bf50f614
	.xword	0xb1948789ca973ba5
	.xword	0x258b9836bd478aed
	.xword	0x0b774f584ca26e62
	.xword	0x777ac65c953c0f9d
	.xword	0x3bd5b15b0e18a3bc
	.xword	0x5d63bd6cd90e60b4
	.xword	0xa56ebf79ad8c502a
	.xword	0xad139d1effc88866
	.xword	0x0c5ae05081d418a0
	.xword	0x78d420ef527d0581
	.xword	0xa48ae7831f7b9715
	.xword	0x6bd790b1c69a58a2
	.xword	0xf2808df5bd0a4064
	.xword	0x216dba2481518fca
	.xword	0xcab94e9bafa173d9
	.xword	0x97ee480a4a4c146f
	.xword	0x37fb07483e9a04cd
	.xword	0xc12e045a9881b5de
	.xword	0xd652cf988a6a6d81
	.xword	0x23005fa70b07e60f
	.xword	0xc567965ee1f317e5
	.xword	0x0888aebffcc7289d
	.xword	0x354adb2a75d0e4c2
	.xword	0x72d64298efba9d2a
	.xword	0xb004404a2b9a904b
	.xword	0xc77d0571291072a9
	.xword	0x281bcc7f26740049
	.xword	0x7b8d6399d5066480
	.xword	0xbd1c8c7f9308aa56
	.xword	0x55e27ace75b69d50
	.xword	0x45231166f391c151
	.xword	0x28cbbaf59854e38a
	.xword	0xc9d7bef7a09f5094
	.xword	0x0c8cd99f56efbce4
	.xword	0x06f181eda911c4c9
	.xword	0x9a9d0067e2b1145b
	.xword	0x21d8a0bec111102b
	.xword	0x35dd75d2f2b8e21b
	.xword	0x44687c4fd37a7dab
	.xword	0x5a88452cf9813ebb
	.xword	0x05b4fe07b576fc14
	.xword	0x8c63eede3bd7ac88
	.xword	0xa68c42b1842a0567
	.xword	0x9a9d48680044ff3b
	.xword	0xc3c4ed17a7e4d887
	.xword	0x06115c1fe24a3ea3
	.xword	0x7a9e657e8181c347
	.xword	0xd2fe7dabb8d25c9c
	.xword	0xceb514d5d506d7b1
	.xword	0x6d47c33b2a51e478
	.xword	0x659577d3b8faedbd
	.xword	0x66f0dff57ca3f7ec
	.xword	0x126827d4dfb5882f
	.xword	0xd42f4c68024effd4
	.xword	0x484ef9a84ab34e8e
	.xword	0x303705f73a8d42c3
	.xword	0x5eb7990ad37cf8cc
	.xword	0xe25ee4e49e3da24c
	.xword	0x25f29b21c6ef0ca3
	.xword	0x2d972bd4e1bfa49b
	.xword	0xf22dc744036764b6
	.xword	0x7f19fd303b8f3857
	.xword	0xff346a7215050809
	.xword	0x6bd181d4c37e5ebb
	.xword	0xe005b70a6d04b3a1
	.xword	0x450628ccb1c09309
	.xword	0x9031e51e6a318e2b
	.xword	0x9e4967537c9ceba8
	.xword	0x283f63a3351a4c81
	.xword	0xc1859098e878b13c
	.xword	0x5c6180e351c87504
	.xword	0x7df06a7970cb996f
	.xword	0x14223a53eaaca855
	.xword	0x19a8f55f17ffd3ef
	.xword	0x1ff965563c977898
	.xword	0x7124029967f33543
	.xword	0x66f210c7ac7a6a1d
	.xword	0xcb0762e896593e15
	.xword	0xbef99b551d7f984d
	.xword	0x25aec103b29f060c
	.xword	0x789183e35e3390b9
	.xword	0xe791e4c7a91abb8a
	.xword	0xf0fa6e146faa607f
	.xword	0xfe0d69e1e8592f3f
	.xword	0xd0989b8e5a83de86
	.xword	0x8116665bf3c47b71
	.xword	0x1f766121d66d0ba7
	.xword	0x9811add6dd83681b
	.xword	0x110bd645e2419ac6
	.xword	0x8c77bc840c20b2d3
	.xword	0x1ac861b9e3f3359e
	.xword	0x372cac1a70abf8a2
	.xword	0x2db16ef74113856b
	.xword	0x27487af11d17a28d
	.xword	0x04194d5bc99f267b
	.xword	0xaaee72fde508e7c7
	.xword	0x98b10a1005981eba
	.xword	0xd5ea5666ce16326b
	.xword	0x3f42b9de1f9557f5
	.xword	0x28d1f618574a6c71
	.xword	0x94a605d7cc8a7c9e
	.xword	0x99b2021e65a90952
	.xword	0x1702c218cc21fd3d
	.xword	0x4573b8819fe0e856
	.xword	0xf32a85e7870a437c
	.xword	0x64609c73b0801826
	.xword	0x9941803c8cb675c4
	.xword	0xd05dc9faaea2525d
	.xword	0xadf8c4786b0a748e
	.xword	0x0656f3637d059e8c
	.xword	0x2c4379d2006b0321
	.xword	0x8f902ede50069ce9
	.xword	0xfa5f5dd888aefaa8
	.xword	0x8105b0ccc735b307
	.xword	0xe015bf6bda31732a
	.xword	0xfb285d13904c51a7
	.xword	0x9aabeb5a6b2d02e5
	.xword	0xbe672aa874140bc6
	.xword	0xa560e6ffd550f50a
	.xword	0x5ca3842b09e3e9f7
	.xword	0xcae2f55cca458118
	.xword	0x1dcb653b1bc6074d
	.xword	0x9eceb8a04046cc7e
	.xword	0xb1f39eabc8fab24f
	.xword	0x0d7c614428ea8d0b
	.xword	0x462c7759554b4334
	.xword	0x1f96d96d01e83874
	.xword	0x56115cfc2550a48d
	.xword	0x915a9cebc5426bfd
	.xword	0x035be963e515c9a3
	.xword	0x84aaa8b569c0cd1a
	.xword	0xc29fd5a09a553b7e
	.xword	0x8257e929d6fb513d
	.xword	0x481a1d9b47acb4f6
	.xword	0x518b4c930d22c378
	.xword	0x01ce6a9627b2184e
	.xword	0xd338d22780108a7e
	.xword	0x806a070a9b9ab48d
	.xword	0x35d1bea4f947e019
	.xword	0x3971878089f79389
	.xword	0x6251d6efefab552e
	.xword	0xdf0c0225657d877b
	.xword	0x792f3ff32515a71b
	.xword	0x940440f62c8cac5c
	.xword	0x4d6e361775ca630c
	.xword	0x493a931963c0b981
	.xword	0x24756d1367368155
	.xword	0x18296b3e5be2a6f5
	.xword	0x46984487fc8ce143
	.xword	0x4f0652261fcefc4d
	.xword	0xae1b9fed625fae58
	.xword	0x158e82676815b573



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
	.xword	0x0e1b9264e6b1daae
	.xword	0x16033c531255e0a4
	.xword	0x0accd11f57dee9f7
	.xword	0x9a2aa747492c985a
	.xword	0xf6f7a1d3bebdf7d8
	.xword	0x574f977db60ae755
	.xword	0xe09a2d210d9ce3ea
	.xword	0xc35cf1a8e55fcaa4
	.xword	0x4d11a63cf0878d56
	.xword	0xa1d10c9661f7c0fa
	.xword	0xaa981d1ea3191072
	.xword	0x980bfca78d2b69f6
	.xword	0x86f4de96fc899e2a
	.xword	0xc71a47f1925d52ac
	.xword	0x9be8b2bb020eb717
	.xword	0x1fdc0ea1931910bf
	.xword	0xb9b17d4632adcfbe
	.xword	0xe415dc1d2e2a5222
	.xword	0xe7f0a346f7a6341c
	.xword	0x19a3c15a42184836
	.xword	0xc474789e358bc492
	.xword	0xb276a70b1eb41e39
	.xword	0x39e92bed73ec3880
	.xword	0xbe011cb12f839e63
	.xword	0xbec6a18b6e9bf6c1
	.xword	0x4545532fc189bfa6
	.xword	0xff4caf5c8263fb7c
	.xword	0xe7d6efcfda08762e
	.xword	0xb59539f1873c5581
	.xword	0xd722ac411f591e5b
	.xword	0xa76ef3adb613e8b0
	.xword	0x625ba78a53fe46f9
	.xword	0x259206e4e284020f
	.xword	0xa7d83d3741539ba3
	.xword	0x4ab467e9d3c8d53d
	.xword	0x60c4c08b8cc312a4
	.xword	0x25952402fa391de9
	.xword	0x1348c4f1ae2ed2b4
	.xword	0xc0688c88740ad081
	.xword	0x5ce78c66da420cca
	.xword	0x1e733d24a7b575d8
	.xword	0xa6dd08506f216065
	.xword	0x57ce67f827498b3c
	.xword	0xa9789e675180c534
	.xword	0xc6a842e507ee785e
	.xword	0x160f33aa5eeba415
	.xword	0x1809034bbd06f63f
	.xword	0x03116917bf8f5bb3
	.xword	0xeaa705f8b36ca6b0
	.xword	0x69c5c5e944687f53
	.xword	0x3bd510fb2074deb6
	.xword	0x90c0d1e1a4b98f9e
	.xword	0x42d8a359bd599381
	.xword	0xc31b6ed998b3d0de
	.xword	0x05cee3e9f7fd8ef7
	.xword	0x424e99577eef399e
	.xword	0x9105b138a3edc95f
	.xword	0xef773fd1ef2029c3
	.xword	0x24cd2847ffd2891d
	.xword	0x481d7d26456cc644
	.xword	0x4f8f888c6bf6506e
	.xword	0x36657e3b531d44e7
	.xword	0x114fc6389271e13b
	.xword	0x22005d97aeced949
	.xword	0x607d4a103ddffbfe
	.xword	0xb6b287d89c73d4cd
	.xword	0xeefeb040c1b2ff97
	.xword	0x2dda359c496705c6
	.xword	0x76109224e718aed5
	.xword	0x59c72cadca3fe3cd
	.xword	0x31fa37062cc1a5d4
	.xword	0x6a6a296173270118
	.xword	0x9c4c86ce58eb3c94
	.xword	0xb1e23bde9838f9f5
	.xword	0xd8bcf9390ba7ef16
	.xword	0x40913b9a6e0bb099
	.xword	0x7230c9ef11f81ea2
	.xword	0x252c6b71ff843296
	.xword	0x52e753be24f086a8
	.xword	0x9bd1ddb80671be09
	.xword	0xc815c9bb5d918325
	.xword	0x60c6aae22fb50a5e
	.xword	0x14e9bcc27b648206
	.xword	0xe9ef245d207a6783
	.xword	0xf52292bfd301fcf0
	.xword	0x620d9cfc2d2032ce
	.xword	0x16ac54ea66624542
	.xword	0x7d083d530f5e3174
	.xword	0xc11bedef479d831f
	.xword	0xd6752257c0d135b6
	.xword	0xee347879e8dd479f
	.xword	0x9f7c9b30aefd014e
	.xword	0x593872c49e7b3249
	.xword	0x0c7fe073fefe1ae3
	.xword	0xca569788c8971715
	.xword	0xb292a224ad7c7cd3
	.xword	0xc7d5f2d21fc85dbc
	.xword	0x2a2714732fde41f3
	.xword	0x8c79d495056c5600
	.xword	0xea92151dc6cb90b9
	.xword	0x4f8b75a0b3c0c661
	.xword	0x7c92d60ed77289e2
	.xword	0x300fcf80848bc62c
	.xword	0x3160464e7417464e
	.xword	0xf07cf3e73ad7f9af
	.xword	0x878553315b43db5c
	.xword	0x346eb0ecbd388e57
	.xword	0x8b91159c66effee8
	.xword	0x92d8751b194e9bdc
	.xword	0x0e055a44b69fd8c3
	.xword	0xb26da4a79320528b
	.xword	0x45d919fb6369a808
	.xword	0xdcd64e58b4a13897
	.xword	0x7b62ce692711a50b
	.xword	0x3a503cbf44fe7812
	.xword	0x151858c2b7464d62
	.xword	0x9f92e99812b8fcd4
	.xword	0x5baac80110e21e9d
	.xword	0x7fad4ebb1477227e
	.xword	0x6f0203194db26fd1
	.xword	0x87ead2bd3c5ca146
	.xword	0x5705d4243f4f21a3
	.xword	0x2520d04b1a02f88a
	.xword	0x4a32c8191afe9854
	.xword	0x7fab3ffc3b2fe9a1
	.xword	0x72b71e0d9ad48bd4
	.xword	0x90f8e462478e71ec
	.xword	0x86c8b7a0c9192510
	.xword	0xcc4b9f8544c92331
	.xword	0x7b03adfc904c8c24
	.xword	0x95b2b83ea4559ba4
	.xword	0xfc72ebc6609ac2c3
	.xword	0x42821189ba7aedf2
	.xword	0xb981e6edae1a1fd8
	.xword	0x34133f7434ac1082
	.xword	0x52f5f9467663d0f0
	.xword	0x0f28dd031eec5046
	.xword	0xabdc1a9b8d1f8afa
	.xword	0xb814b30770183289
	.xword	0xd7b51e3ee24ed17b
	.xword	0xda0d7eb34473f742
	.xword	0xf811741547cdee52
	.xword	0xd7f8bf2ba23352d8
	.xword	0xd4af1a757ae72517
	.xword	0x54afa72baab5a625
	.xword	0xcfd7488e8ab3de9e
	.xword	0x081c37ff80b94e94
	.xword	0x958827fb757ad877
	.xword	0xae341365220a9f58
	.xword	0x6519da58e7ba8d8d
	.xword	0xa9d26624c65090c5
	.xword	0x8a0bdce12cf6d82d
	.xword	0x2b38a3865028181c
	.xword	0x3099d1596e100a09
	.xword	0xfbe795f435812d74
	.xword	0x1dedcd3a22da5978
	.xword	0xc285d0a6f95ab8ca
	.xword	0x2db3e1e25d9cfcdb
	.xword	0xb8cbb9feb9826673
	.xword	0x2791f9d8e2c5db12
	.xword	0x84f53d0c300659f8
	.xword	0x7a5c42e57cd66b77
	.xword	0x779a1d351282041a
	.xword	0x8592141673aac3a6
	.xword	0x8178f9c869973d02
	.xword	0xbbbf258ddb437a00
	.xword	0x5a81e824e18bc26d
	.xword	0xeb9a74a1ed4aed18
	.xword	0xdf7cbc5840cfac20
	.xword	0x69b908a00a323d2f
	.xword	0xcddf84a6796a19fc
	.xword	0x42a85562554fa202
	.xword	0xb955df30c0c12774
	.xword	0x7f4b0cd5b08266c3
	.xword	0x10cc2f01557e3993
	.xword	0x04005fb0de23e66c
	.xword	0xb14094686f792e40
	.xword	0x890852e3e6ce38f0
	.xword	0x22f534d8ebee9cf2
	.xword	0x10c69fba6a5e1e1a
	.xword	0xa951590e062b832d
	.xword	0x68f3a0f61a0a2b56
	.xword	0x790e07456ea72680
	.xword	0x39cd69d325113580
	.xword	0xdfc2306c14114e94
	.xword	0xf07e9ac6fa6348ba
	.xword	0x9bdc64b50b44f390
	.xword	0xfac35bc6b96b9e39
	.xword	0x4b911c248f20853c
	.xword	0x0292d8de14746fe7
	.xword	0x2c6dfaf1add82a64
	.xword	0x19b084cc3965a969
	.xword	0x4084ff67ea27e925
	.xword	0xc0f0ef6fd3ce6c47
	.xword	0x081aeccf72848064
	.xword	0xb0ac110dc714109f
	.xword	0x0649fd4c6beca77e
	.xword	0xe31c85f241ffd080
	.xword	0x1f95573c0077bd19
	.xword	0xc488ba92662f229d
	.xword	0x954e2455c48e7634
	.xword	0xbd7cae0930464b7e
	.xword	0x71a351bb9578bd74
	.xword	0x9e51bd6ed168bf32
	.xword	0xc236c89b0a2f4ac5
	.xword	0x6d29e3e0657fca01
	.xword	0x9374f9df92518628
	.xword	0x4ed9026a16a2e059
	.xword	0xea13c6bb3a4f5b57
	.xword	0x609975314284b0ca
	.xword	0xdea931a39e97c311
	.xword	0x3a9a451a71ef0cbf
	.xword	0x2ce30933f034b920
	.xword	0x5c2647278d3fb9c2
	.xword	0x8c366f8601ff796b
	.xword	0x39d3b9b3cd4f126f
	.xword	0x4d4f44978382eada
	.xword	0x7e0f7da829f4d5e9
	.xword	0x3582a7f3e7b371bb
	.xword	0x18a6d6a7a0f9bfa4
	.xword	0x15d47a70c240b99f
	.xword	0xdee3e8253b9a5030
	.xword	0x45e85e4c46d79ff4
	.xword	0xa5ea7faa0fe19b3b
	.xword	0xd8b880847f6d707c
	.xword	0xb2695069a4d9f446
	.xword	0x6043e80becfb6692
	.xword	0x84a06b3b4d124f9c
	.xword	0x39063af3e8415113
	.xword	0xb5a7fcffe087a7d2
	.xword	0x2dc4aee221b8e6fe
	.xword	0x4a1e3031274cb0f1
	.xword	0x368274e608a36675
	.xword	0x6d482b60287eb2ab
	.xword	0x729f50e333da0709
	.xword	0xfda9898dc86e8385
	.xword	0xd919f9d050957606
	.xword	0x9c284c2ee64da7d4
	.xword	0xd663a7a7a6902e0f
	.xword	0x8dcb2d0b8ec70daa
	.xword	0x3c167108c4def7fd
	.xword	0xf99c81beb5fbca04
	.xword	0x8c79708cbbe4e009
	.xword	0xd59029b0bfb8728b
	.xword	0xda048c4d09cca648
	.xword	0xd5117a5aa019198f
	.xword	0x58212757e45bc5ba
	.xword	0x54db3466260b6398
	.xword	0xe23d6f2ae0daca93
	.xword	0x620d36e510ac8dd8
	.xword	0x17987672f0c0d50a
	.xword	0x514d1c25d7d10cbd
	.xword	0x77a2f3b266b41303
	.xword	0xab0e520c1e292505
	.xword	0x10ab71f7ff794bc3
	.xword	0xed73251ce990f797



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
	.xword	0xbb612e3b55f7df9a
	.xword	0x893412c2bb7f79a0
	.xword	0xb1b67181055ec797
	.xword	0xc5e2add36c96ca97
	.xword	0x9e705866aa4c39a8
	.xword	0x117604d2644c6613
	.xword	0x16aa97d617207025
	.xword	0x33dbc6bef9bfb409
	.xword	0xf8097c526ce43fbf
	.xword	0x93b4f64904e53ba9
	.xword	0xfdb08aa42990bd37
	.xword	0x61e4f76ac9cc9b92
	.xword	0xcfd18e100b0aed0a
	.xword	0xe777eb8a018f0752
	.xword	0x340bc627e783a712
	.xword	0xfaea26ab058b8cf5
	.xword	0x7ded128d7081c75b
	.xword	0xf3ecc7ad41fa8543
	.xword	0x63b745c31a4cea06
	.xword	0x13466845aec626d9
	.xword	0x5fc416593dbdf0ed
	.xword	0xe66f2c04c83e8d7e
	.xword	0x8b74e6d70a95ca8a
	.xword	0x6be0927df4bf2483
	.xword	0x95f9c8570fbf7020
	.xword	0x6b5c55029cb11e21
	.xword	0x825f07bfb50d9dcf
	.xword	0x0d1c6eaa9258ad16
	.xword	0x1bbdcd15294b37fb
	.xword	0xe687016612b59145
	.xword	0x9c4ba9cac704656c
	.xword	0xb2f6847dbe2cda2e
	.xword	0xc32dd3f8c87502a9
	.xword	0xacd5e7857915491c
	.xword	0x310b03d7d7597bed
	.xword	0x7f285c18fba59689
	.xword	0xe18828ef56f100d4
	.xword	0x8b85800d44858c05
	.xword	0xe1c2b1b267600f5e
	.xword	0xb452e0004dea8173
	.xword	0xe1d4e58777511d18
	.xword	0xb10d5937c9b6601c
	.xword	0x3608758b0d754130
	.xword	0x0dc71850a5e382de
	.xword	0x49e75b2390ea3b7b
	.xword	0xe14ec37f1466c001
	.xword	0xda148fab4ce57537
	.xword	0xde8e9e198c83d716
	.xword	0x4d0f9ea66b5c6ff1
	.xword	0x59254ec687d794bd
	.xword	0x054488533f2502fa
	.xword	0xdc1f524939af9df5
	.xword	0x99a8b82888fbfdaa
	.xword	0x1f12a0c9ee18922c
	.xword	0x996f44c2b8d2aa2d
	.xword	0x09b97be037fface0
	.xword	0xa1cc65cfdaa270bc
	.xword	0xf27950e6d82a6c9b
	.xword	0x317981f382c6042d
	.xword	0x8f87d9b254dbb884
	.xword	0xd726ed7f0b9bf4e8
	.xword	0xd08bf15737953a21
	.xword	0xfa2a8b0a49243bfc
	.xword	0x633a524f67ce5cc6
	.xword	0xe1de78f35affa290
	.xword	0xb36d66bc44ecd4eb
	.xword	0xdef6d6e445bfdaaa
	.xword	0xbf6947d7a9f257d8
	.xword	0xb6cb7ff95450f640
	.xword	0x6df3338274c93c1e
	.xword	0xcc1294206d6f095d
	.xword	0xad39c88f0bdac320
	.xword	0x9dc56170e5114cbd
	.xword	0x0295f012f6563cef
	.xword	0x97b65c5953e20dee
	.xword	0xcda1287db8c8d1eb
	.xword	0x6bb8bfbd02328030
	.xword	0xc5ec73ef1b59c62b
	.xword	0xbe101a4af8e29f9e
	.xword	0x7de12a37c9cd87eb
	.xword	0x9d3f883d728ad37f
	.xword	0xb9fcfc7c2d49e5fc
	.xword	0x52089d0fcbbafb6c
	.xword	0x8d46c7c27e32e54e
	.xword	0xb85364731b5acdf2
	.xword	0x26e6f053038c804a
	.xword	0xa9285949eee9c060
	.xword	0x0d4f5ac158c9c80d
	.xword	0x9e195761c01b110c
	.xword	0x6580cf8b2ac7e920
	.xword	0x49ea49ae329aa505
	.xword	0x89086d072671c8c5
	.xword	0xdceff8a7973f44aa
	.xword	0x568ac81c2e9a6034
	.xword	0x97da8a53828c5923
	.xword	0x2548f090031444a7
	.xword	0xb65f612c727ae81d
	.xword	0x745ea3f11a8bfd07
	.xword	0xad30f9898dc919fd
	.xword	0xe6ea8aa70203381e
	.xword	0x397c671688f2e705
	.xword	0x8fc74f337c7b3193
	.xword	0x8298d9d9b25bdbff
	.xword	0xeaa29ac29583e75a
	.xword	0xe38e2dd7e6ab7b75
	.xword	0x78d35b88d3cf4aba
	.xword	0xb2bf357ea9a286c6
	.xword	0xd323764f0af78074
	.xword	0x44b5e7454e5101f3
	.xword	0x376c9785d2284c0f
	.xword	0x03be8311ab83bdee
	.xword	0xa2a354dd72873e12
	.xword	0x739ea12016b2c263
	.xword	0xda5db1eb3a3e6380
	.xword	0x5bcad1ec9f2940d4
	.xword	0x73148987aedb37d2
	.xword	0xdfb63ef4ded5b2c4
	.xword	0x617e33ad2d054366
	.xword	0x901f3770b298dff9
	.xword	0xddad79cf23800344
	.xword	0xf2166de2c069eb79
	.xword	0xda64bca8a5223125
	.xword	0x5ff1f5f29de34446
	.xword	0xc4d3fe6d117cc5bd
	.xword	0x307b167214af28c9
	.xword	0x00fd9fccdf9e3900
	.xword	0xe18b03beda68100e
	.xword	0x49b46a48f9c40bcb
	.xword	0x3d6909cbaeff8b35
	.xword	0x3ed6fb45dd110ca0
	.xword	0x866033708070a082
	.xword	0xa6784ad57beffdf8
	.xword	0x7429d761f2ec3561
	.xword	0x35043a94564fe779
	.xword	0xbae4709d27d6dfdc
	.xword	0x212194ae1d313d89
	.xword	0x38a3750a75b577bb
	.xword	0xea189825fbb04019
	.xword	0xe2ee897dfebc0d89
	.xword	0x7cdc5bd791d68c49
	.xword	0xaddab2200911fcab
	.xword	0xcf85260402aeb084
	.xword	0x227107fd4453c4da
	.xword	0x986c295a5cc4d8c0
	.xword	0x2183b1cb2483524b
	.xword	0x1e6da88fdd30b9ff
	.xword	0x375069971cc6dd2d
	.xword	0xb170658ac2ef7c4e
	.xword	0x4e4ee8776ab8884f
	.xword	0x97c114fe8eeb1c21
	.xword	0x9cfb76c84b22fb21
	.xword	0x9b273b581f005577
	.xword	0x22dea4b05d7cbb3c
	.xword	0xee5aaa97fe9e10d5
	.xword	0x74415da342d717bc
	.xword	0x71f68e6dfcb0f616
	.xword	0x926c35d08532e0ec
	.xword	0xdd33cb72d476e43a
	.xword	0x603fdc21968bcfc2
	.xword	0xd21fa772f5a21e80
	.xword	0x503c6231f3872078
	.xword	0x9ab22bed2f5e4a1e
	.xword	0x838f6ec7a45af616
	.xword	0xab42174ba72759d2
	.xword	0x6526e220e7c54665
	.xword	0x7d37abb86b495e80
	.xword	0x709e310fd357af04
	.xword	0x4be13c8f3b693508
	.xword	0x20ff98ad9b2263eb
	.xword	0x4eded5a1cd63dc41
	.xword	0x92743ba2925cd838
	.xword	0x6246d7b40ce1e65c
	.xword	0xfab139152b61ca86
	.xword	0x6b6b26de720e2dc4
	.xword	0x8673f427ce936a3a
	.xword	0x5d53313c93b6e4c8
	.xword	0x7099c417d58795bd
	.xword	0x59a3ede1cd21d9aa
	.xword	0x03548d66ea44439e
	.xword	0x1b81da12f919c04f
	.xword	0xab9651da4b88bf72
	.xword	0x601493f6d8b6b4c0
	.xword	0x1cd4722876ed8eea
	.xword	0xb989a2b869fdfb82
	.xword	0xb51dcd1c0a174984
	.xword	0xae1774ab902477e9
	.xword	0x38d54fc4c26590ba
	.xword	0x9945a9271aba88ba
	.xword	0x34e9d52088b5e7ff
	.xword	0xdea26c3392001384
	.xword	0xb03911380abaa90f
	.xword	0x4f49bfb8aa572bf2
	.xword	0xadc7ae437ec7996b
	.xword	0xdfbbb31784be835c
	.xword	0xfe450a37f16fb7be
	.xword	0x9b58d73f33ecc431
	.xword	0xa4e39a9c356cfa7e
	.xword	0xf774ac39db6057b2
	.xword	0xe7ae6154f2317bf0
	.xword	0xb9a6aa1fcfd33898
	.xword	0x4b2405b7636322fb
	.xword	0xe1d501ce55a3c7a2
	.xword	0xeea7e32994f9f148
	.xword	0x149f3b7438dafd54
	.xword	0xdd6448ef9b0da03b
	.xword	0x6b76cb156d43a15f
	.xword	0x5506e2db9ed49c3c
	.xword	0x20d5fce8200fcdbc
	.xword	0xb7191f14502dbd72
	.xword	0xf4d907d5b950214b
	.xword	0x448ddda6b2724fe6
	.xword	0x1267fddc874c1a17
	.xword	0xb0cbfae9deccdb38
	.xword	0x98d011f307af21cc
	.xword	0x9882d70d0c8f21cc
	.xword	0xedca49e5b1091f12
	.xword	0x06489f03732faba9
	.xword	0xb2d1ec1d4b57d16d
	.xword	0xec11c1ddc89fd820
	.xword	0x064d021dce81245d
	.xword	0x6cca87c6ae5f1b86
	.xword	0x7a66fda0d80557dc
	.xword	0xb4ddc7003404dd39
	.xword	0x9822bd43f699319d
	.xword	0x260fd4d807fce89c
	.xword	0xc9c6fa1c55c460ce
	.xword	0x0554c76e2402dd30
	.xword	0x786e362053e9d746
	.xword	0x28bf131ac5c01850
	.xword	0xc0133e95f1614467
	.xword	0x55c1baf4ce05d8a5
	.xword	0x8441a22852292b2c
	.xword	0xe43f1bae2eba9ee6
	.xword	0x5f5fe211837c84c0
	.xword	0xadb35ecfcf28a20c
	.xword	0x65855b3141207428
	.xword	0x1b97220fbf5cfe44
	.xword	0x28496fa433f777d2
	.xword	0x8a5affdc332b21bc
	.xword	0xca07f14f33c3a8d6
	.xword	0x4952bb3885d51fdc
	.xword	0xa2c3582703298e93
	.xword	0x64bbafd6a03fc183
	.xword	0xceeb582ad0d6ba0c
	.xword	0xbbf254c59c792139
	.xword	0x859d35baff927e02
	.xword	0xc219d3d13490f9d8
	.xword	0xd8d9bce95821a2b7
	.xword	0x511de7f4ffcc02eb
	.xword	0xdefb3dc36fce4f96
	.xword	0x8e3cc831a36221d0
	.xword	0xb617d0d821005899
	.xword	0xdde3ea96c07579c5
	.xword	0x190fc220ec3cbc41
	.xword	0x44d02bcc52edc499
	.xword	0x6177f3093161e146



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
	.xword	0xd2838ab25737b3ba
	.xword	0x1a6d197fdd8a6db4
	.xword	0xc5a5f18261df00b5
	.xword	0xd26b63eea6ae671d
	.xword	0xa2bfbce94a1f1851
	.xword	0x539bbcef4f0dd2b4
	.xword	0xf616248431f57367
	.xword	0x194772821342830a
	.xword	0x577eef97dda85561
	.xword	0x9f642a4a65ad9ed2
	.xword	0xa903465abbe27113
	.xword	0x4fb8e6a96275cb0c
	.xword	0x1707fbb237985091
	.xword	0x67a2881c3bc6106d
	.xword	0x00ebe082ef87352e
	.xword	0x3f8c916ec8e8c8c7
	.xword	0x23ef58a93705b4c6
	.xword	0x02ec0d3b8ae98cac
	.xword	0x32cd1ffc68fced1a
	.xword	0xadba5bda1eb793b1
	.xword	0x3f2f1de4de168d14
	.xword	0x0470ba6880c2b2a8
	.xword	0x237c7cb7c8b6f499
	.xword	0xa75afa7a8910c8d1
	.xword	0x5ab89ea58eaeaca1
	.xword	0x27a29024e7d2991a
	.xword	0x572cbb42a9eb028c
	.xword	0x5f8f87d20e6a7cbd
	.xword	0xb671b0520ed1520d
	.xword	0xab8a3cbb7ec0f6e5
	.xword	0x2edb119a9cb9402c
	.xword	0x560ea6eb518c0096
	.xword	0x147f325e337eaade
	.xword	0x1bfa1cdaee28bd4e
	.xword	0xf8dc779b67662486
	.xword	0xeeabca7e9da05c64
	.xword	0x3e2337bf44f0733c
	.xword	0x2fd4614dc2839ead
	.xword	0xe953e9142f8adbd8
	.xword	0x15ec970a72d20376
	.xword	0x755a6babbb2d0731
	.xword	0xef1bb0d6a864d79b
	.xword	0x0054f95e9c36902c
	.xword	0x8dc0b0647c33903b
	.xword	0xb4ee8af668a36b4d
	.xword	0x9c669eda21a37849
	.xword	0x13b16e8573ff6c47
	.xword	0x392bb8552e83ec8e
	.xword	0xb1d5a2510aa0058e
	.xword	0xe567debbf570a7d1
	.xword	0x635d6555be3e3289
	.xword	0xcb7d057eab8ccf61
	.xword	0xe682960a8a947603
	.xword	0xddc26e6dd948214e
	.xword	0x66c037d57f9f277c
	.xword	0x0863de1e2c78a322
	.xword	0x35085951969bce50
	.xword	0x9047d75e70097f8a
	.xword	0x50261d68969494ae
	.xword	0xd9a741380482e127
	.xword	0xfcba31c6127fbb83
	.xword	0xa2337c079c6a719f
	.xword	0x9162e22a6c6d27ef
	.xword	0xa7c15338d5544f19
	.xword	0xb100576b2b11960c
	.xword	0x42bb47155b32f47f
	.xword	0x89748b3b151e8ebf
	.xword	0xee7c3d4cefc3e973
	.xword	0xca8a34119c2dd870
	.xword	0x202c0fa33669f2c9
	.xword	0xd8eea2551e2baff8
	.xword	0xef3f1123a1efedf5
	.xword	0x138ff55470ced315
	.xword	0xab72bcec11f9a5d0
	.xword	0xb3deebad858904aa
	.xword	0x2ff9241bb7c2ccb9
	.xword	0xd100c7361eb97f6b
	.xword	0xf4e5f16c2021e6e8
	.xword	0x60b3c1df626c40ca
	.xword	0xc2ed12d702e63ef6
	.xword	0xdf3245c0487a5098
	.xword	0xcc860b66d734ea5c
	.xword	0x7b1f6e260665190b
	.xword	0xcd426ae7e4d49a89
	.xword	0xbac4d7e7694e5979
	.xword	0xa47b1e6231c3badd
	.xword	0x13fc9d9b69951dcb
	.xword	0xcc3570e2e8574243
	.xword	0xe57e9be13370db98
	.xword	0x2d0a492549bc8cc3
	.xword	0x4795847b63b39907
	.xword	0x30c0399a57a95045
	.xword	0x2fd7a9767189c323
	.xword	0xde7dc60f85c2185b
	.xword	0xb8707c92b9ddcef3
	.xword	0xeae879935e0bc750
	.xword	0xa1f7d6651fac8da0
	.xword	0xac56dbdbe3af863d
	.xword	0x1d189d7208feca58
	.xword	0x6829d1408cb1848f
	.xword	0x8bb0a1958a925173
	.xword	0x13cf8b20e3d013de
	.xword	0xb8593a1d28c8d4c3
	.xword	0xec94bd641f1aab4f
	.xword	0x11b9b4bec126decb
	.xword	0x7c4f8b19c20abb77
	.xword	0x32ebcaa00ec88590
	.xword	0xc0aaeaabeefc4dc0
	.xword	0x659f2f2007275daa
	.xword	0x8bd01e835e776d00
	.xword	0x3a58e965058d9624
	.xword	0x098e898d4912e168
	.xword	0x676ed928a1f7feaa
	.xword	0xbba6574ccfddf182
	.xword	0x77b5f8c3762851d8
	.xword	0x5ae1109cd15d1f81
	.xword	0x4da3025705b852ad
	.xword	0x99701eeab8065f81
	.xword	0xa2303b88ee64d03d
	.xword	0xa3d2ebd88fb27c5a
	.xword	0xca1630e094336ecb
	.xword	0x280adbe195c3af39
	.xword	0xf1b084288e67bba8
	.xword	0xec3516e0c5460c3e
	.xword	0xe251396f7757de40
	.xword	0xa2113999581a9baa
	.xword	0x0bda37581640c938
	.xword	0xb157746ee5a94fd6
	.xword	0xaf0d9b2326b9938e
	.xword	0x6d4164d7d497bcdc
	.xword	0x06af90e7b7e44743
	.xword	0x3fef5fd70be15fa1
	.xword	0x6bcd2a7ac112a466
	.xword	0x7dae3aa738cdf6b8
	.xword	0x23e17887151cd914
	.xword	0xb259f3ba98e3a21d
	.xword	0xab00391f26c177b1
	.xword	0xa8901b7055c9aa3f
	.xword	0x516e376df599e43c
	.xword	0x6293fdbca1ca9886
	.xword	0x39ee612c7202de1d
	.xword	0xd7b1a37c98bb23c5
	.xword	0x8fbc534f0b142c20
	.xword	0x55ad0e43d2523d9e
	.xword	0x537c9a941a270ee7
	.xword	0xaff3ede8550f2dc8
	.xword	0x89449ce3524d81de
	.xword	0xb9ca69a65c9b0d95
	.xword	0x40f3ac595687c1f7
	.xword	0xb24ab39781958b9d
	.xword	0xd8470b41d517a66c
	.xword	0xd05f16d51cb848b8
	.xword	0xbecdd6b5b343b37b
	.xword	0x2f57ee6a244a34cf
	.xword	0xaf3a3375948b4e09
	.xword	0x6946c099719c8544
	.xword	0x80d749210ea57136
	.xword	0xb889a5bb53719a32
	.xword	0xb590bd6b62c69d2a
	.xword	0x1c1c16a459532ab2
	.xword	0xf8a74c40de8f1e82
	.xword	0xd34f06b0f1616cab
	.xword	0xd78ba9e00d895085
	.xword	0x96494d64e0a1ac46
	.xword	0x289f4a3928c08539
	.xword	0xab9f9b05e13fc9e0
	.xword	0x079b1dcba01f9bcd
	.xword	0xb725d89b42f47e49
	.xword	0xe4195a315aff22ea
	.xword	0x316c71c4ad6f1090
	.xword	0x2e4e3536728592a5
	.xword	0xa94aa8e50c8a2903
	.xword	0xf6b1ef2714d495f1
	.xword	0xab525a1575c9c439
	.xword	0x266399cb7c30a92c
	.xword	0xe61586ed5fe0db54
	.xword	0x868c3b5e6905228a
	.xword	0x6db808049737d793
	.xword	0xd729f33894ae3b3a
	.xword	0x4fa20d50d7d1d5f7
	.xword	0x50e450e2435217ca
	.xword	0xdfaacc9113d44597
	.xword	0x0fe80bac59577d45
	.xword	0x03b0f3b5a3be0351
	.xword	0xc11ca0760d88bafe
	.xword	0x47a12e3332dcfc4a
	.xword	0xe82525141e9b2596
	.xword	0x85dba3c630b547d9
	.xword	0x9377b7cbac6351a2
	.xword	0x29dc7cffa4da1e26
	.xword	0xe6b0f723054ed176
	.xword	0x65eda39ea22aaa97
	.xword	0xce6c725382026f5c
	.xword	0xe7b177162e4153e3
	.xword	0xe8cbdb55b91cee45
	.xword	0xcef11069a275d47c
	.xword	0x27fabb25cef57b45
	.xword	0xdec3bbdf30c3268f
	.xword	0x6e78e081b33b0411
	.xword	0x6436e4b55a7c71f7
	.xword	0x448d1212972a888d
	.xword	0x513f09fd71ec051f
	.xword	0x61b31c3a0e2975ad
	.xword	0x6abbf6bce205dcde
	.xword	0x820d7fba372a096c
	.xword	0x3d0844c2385003b1
	.xword	0xb6137dc686c4a452
	.xword	0x9fda6462cfc8c420
	.xword	0x7052c15a8b6f8bf6
	.xword	0xe7b76cc3453a7b2a
	.xword	0x0fb29a0afa3a170a
	.xword	0x1787b673cea4c436
	.xword	0x209786ef48dcdf31
	.xword	0xe16b1c2156173726
	.xword	0xc54c6a35fb589fcd
	.xword	0x64dca3b0dc8a9c43
	.xword	0x1e321edb72709d6f
	.xword	0x4fbc783009d4075f
	.xword	0xae78d63fa72bc76b
	.xword	0xec940302a5ab4746
	.xword	0x9382c12f4f45fefd
	.xword	0x85700349b9e0d098
	.xword	0x30e406579a2ddbb0
	.xword	0x7215f1b6c698f357
	.xword	0xc9c0cdc13b263b73
	.xword	0x9e9f1e64ba2a69a2
	.xword	0x3ef9c93be7af6580
	.xword	0xcaca3d61322614bf
	.xword	0x99fd282492456730
	.xword	0xf4970b7ebb8f661d
	.xword	0x7129b9338f0cdc7d
	.xword	0xc3a785516b288c9b
	.xword	0xf1517959d540a87c
	.xword	0xcd4870b00f3a1906
	.xword	0xe1e093bd75b4bd4a
	.xword	0x0df9dd285622fcc3
	.xword	0xddf9ffa566488eff
	.xword	0x150c2961229cb030
	.xword	0x514dc91c9107c84a
	.xword	0x1dfbdcd2a2e6cbfd
	.xword	0x7351d5499c727633
	.xword	0x083fb2884227e4b9
	.xword	0x6102d31ff98bf7fc
	.xword	0x43dbe6dab246be88
	.xword	0x36441029885bf1c2
	.xword	0x9c99d7aca966d877
	.xword	0xf8613ad60d7761e5
	.xword	0xf1b8d2be5bc1396a
	.xword	0x28a631cd59ff1a97
	.xword	0xb0137714c9394918
	.xword	0xdd8bc7d68c61654e
	.xword	0x85797d028c6f443f
	.xword	0x05470a3fd17b98d6
	.xword	0xb43842f4844a1ab6
	.xword	0x0dd07f9212493ab2
	.xword	0x87370e1147d0b44f



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
	.xword	0x3caa1b721b5d103f
	.xword	0xe872e195d56682b2
	.xword	0xc12a81c5bf262ea5
	.xword	0x6d2b0a62a00c3e84
	.xword	0xbc606107bc8caf9a
	.xword	0xa7aae79375395984
	.xword	0x614252c4124c8c3e
	.xword	0xc71a0a8409bf9dee
	.xword	0x5ce6bc4d7e2c123e
	.xword	0xbc3ab65d307fb9a6
	.xword	0x17b29fcdd48412c0
	.xword	0xc27053bbd67ca7e7
	.xword	0x82e20945987ac9a0
	.xword	0xb1723ab0a614d7e6
	.xword	0x3a928278bd8b876f
	.xword	0xa2cd5eb015d0891f
	.xword	0x402625511da9cd4c
	.xword	0xae3bbc511062b5bf
	.xword	0x89390d6352a66308
	.xword	0x2536bfe90113910f
	.xword	0xf2e57deff14521ef
	.xword	0x8cd1722aed05f9cb
	.xword	0xc784f81969d8fa39
	.xword	0x7a7df81ef8bb8244
	.xword	0xb09adf0463a1f824
	.xword	0x2dc7030b2e026c28
	.xword	0x87dd14b3eda0384e
	.xword	0xac169e56e3c07ce9
	.xword	0xb6c71b1e349d350b
	.xword	0x9ad337aac27f2b5f
	.xword	0xcfe128ec51b0181d
	.xword	0x954101479b9f64b1
	.xword	0x93ab9ab8f8623444
	.xword	0x92f664c281f05c82
	.xword	0xc8d92ade6b2f9c10
	.xword	0x75b30da34138aef3
	.xword	0x2a74adc222c9788b
	.xword	0xee9c0c69856b154a
	.xword	0x6ac8a83a0936286d
	.xword	0x67b6de9b4c25a78f
	.xword	0x92e9331f78001e64
	.xword	0xab4b7bc0ffcd5ad6
	.xword	0x13a793136b8f1a73
	.xword	0x0e5f94da2522111d
	.xword	0xcdc082b8fb05b322
	.xword	0xa6cfdc03a8df5702
	.xword	0xe77fc2a90575d83a
	.xword	0x1740f020d38c6394
	.xword	0x0b56c11af7e2d0ee
	.xword	0x6d2545b837a50285
	.xword	0xe113b23a4328a8ec
	.xword	0xd9d93ab290246618
	.xword	0xb90ce2ce5b773e4f
	.xword	0x44d4d197e1366faf
	.xword	0xe833673a324f36d1
	.xword	0x2be29321b352315d
	.xword	0xd18990780109b014
	.xword	0xf50c595221eeaf36
	.xword	0x248e434cab587bc9
	.xword	0xf43ad037964e9c8e
	.xword	0xaf8dca466cf07d2a
	.xword	0x7f1f9957c74f7c9c
	.xword	0x492f9260fafaeee6
	.xword	0xe721d301e2e0abed
	.xword	0x58944d5a4d6c4351
	.xword	0xb50897d0cdff5402
	.xword	0x607f47940a4033a8
	.xword	0x48e97a5ae6fc4b88
	.xword	0xa766dc2633f4e5a9
	.xword	0xe84fc60d35a8a8e4
	.xword	0xdbb5f8c8b1b5a4fe
	.xword	0xb7c67983bd724cdb
	.xword	0xf63aee82276c3a67
	.xword	0x461b9d8433459451
	.xword	0xed89b8a00095a4ab
	.xword	0x856cbd93649b8652
	.xword	0xe18c1c035e3a9df1
	.xword	0xaece72f0ffa4465e
	.xword	0x9d6689aa4ea39f9d
	.xword	0xc5cdcf342e7e8f36
	.xword	0x6591f9d7ee6caf93
	.xword	0xa5ec2ef1e6824f1f
	.xword	0xccd8ac0e26d21ad6
	.xword	0x22404d3ff82a6048
	.xword	0xc49ee3676fb83c89
	.xword	0xddbcdcfe094ed159
	.xword	0x45dae8028a6365d3
	.xword	0x74942a6b7dc9ec8f
	.xword	0x46d8c00f4cca8974
	.xword	0xa14f82f74e25a96e
	.xword	0xa4acef8843349724
	.xword	0xba4b2c1e4f052a86
	.xword	0xda379a1b8817a55d
	.xword	0x157ae10714785bea
	.xword	0x63d88ee21e8d69d5
	.xword	0xbd324a467efc7470
	.xword	0x3104f4c7f35a4110
	.xword	0x8f3b49101054ed31
	.xword	0xd61d56410932db80
	.xword	0x672f7d27de5594f3
	.xword	0x385850a7f11d21f9
	.xword	0x673f884f1669aaa8
	.xword	0x58c2190bd1cd7e93
	.xword	0x3b6b5f85b2665105
	.xword	0xebe00113ac89f156
	.xword	0x49bbb8f0861b6960
	.xword	0x5f164b035043b0df
	.xword	0xfd36ed23a195ddd0
	.xword	0x3feb89ae646e5c6c
	.xword	0xb3f64620b4b30406
	.xword	0xf3e752a6e9172f56
	.xword	0x0d3f31b24afba75e
	.xword	0x7401d051e1968da0
	.xword	0xee29c4ced03f4dca
	.xword	0x57123e501ee71e76
	.xword	0x2b6e39f8bff73f32
	.xword	0x7aeee77100702a85
	.xword	0xa1271eb94708eab4
	.xword	0x4e45ab6bdbd3c821
	.xword	0x8e6859ece633aee3
	.xword	0xe2f32a7efdbf8277
	.xword	0xdc44e363b19bfd60
	.xword	0x5fb48d4c6d110c70
	.xword	0x4556fe0c5f7d3722
	.xword	0x4018e2076b7dcde7
	.xword	0x6e0c2cacb0be77c0
	.xword	0x697eaee5968d0132
	.xword	0x9b06002669e6351d
	.xword	0xe225f938a921174e
	.xword	0x2e28ad17982f9712
	.xword	0x380b75953cae68c4
	.xword	0x72bc469e2b4958a8
	.xword	0x8c61c41bc6d97c5c
	.xword	0xe41d3cb02fda4459
	.xword	0x5f66802909999323
	.xword	0xfe9299b8e9babb14
	.xword	0x8dac773a5e098ccd
	.xword	0x7d02718f9cd2754d
	.xword	0x2eecf518087c4218
	.xword	0xde94a105024bfbc8
	.xword	0xb93e9996cece4f31
	.xword	0x38fca3b9c0c2ed79
	.xword	0xd1bf9438f9be173d
	.xword	0xd68250a3c439f30d
	.xword	0x48063739ac783746
	.xword	0x0a008403eedda0c8
	.xword	0x7d941b4abdde8127
	.xword	0x247fc4f1522a3cd4
	.xword	0xcd0d69a3d33726c0
	.xword	0x4fab20a6f206608d
	.xword	0x4304fdff05408db6
	.xword	0x4ac91e0286321705
	.xword	0x5b576e20a7480971
	.xword	0xb966f2730292d003
	.xword	0x12bf2f4738e45ad9
	.xword	0xdc734a928ee0c28e
	.xword	0xaa47dfa29814bf6b
	.xword	0xce7d6fbfbc9d6fdb
	.xword	0xe995d861bae5a3be
	.xword	0x75262a8634d435ac
	.xword	0x93949a911e3d5c27
	.xword	0x3199ed7ff4da54a2
	.xword	0x9e232ea41cf0fbe5
	.xword	0x05cc590b10560735
	.xword	0xd0df884bcfe63c65
	.xword	0x78c9a3b9474596d6
	.xword	0xd4c842636287d2ff
	.xword	0x5f62ab9149c76f79
	.xword	0x7e61cc3ad0ec7ba7
	.xword	0x49d8f498b27cd0e5
	.xword	0x5f5e6152124fe078
	.xword	0xe77c406af550385a
	.xword	0x7556606d664e13a3
	.xword	0x4aa36b362bd534bc
	.xword	0xaec206201a46551d
	.xword	0xa658076b70bcf7b0
	.xword	0xf99112cd6dbb4ff0
	.xword	0x97acfbdb623d7370
	.xword	0xe4897f71891a32d9
	.xword	0x4e61236d1f7ed753
	.xword	0x1f3726ad69f88472
	.xword	0x5bf9bddc1f3cb9fe
	.xword	0xe4671534c568a6d3
	.xword	0x53987b149d11ae0b
	.xword	0x0a34747054fa1044
	.xword	0x4751f604748a1985
	.xword	0x644bdd01ed282355
	.xword	0xbd59fef9c26aea9b
	.xword	0xe8471831a59b722d
	.xword	0xd17a084b19e16ca9
	.xword	0x8bd7f23fd5abeb47
	.xword	0x7ce3c42293430dea
	.xword	0x7a23260a68ca9cd7
	.xword	0x5927c049f4f9d206
	.xword	0x4ccc0b3a0866e295
	.xword	0x1e8cb8dd79e6a95e
	.xword	0x168d8f17baf2fceb
	.xword	0xab3552f0ec438c91
	.xword	0xbc0b1b0c2e81e9ec
	.xword	0x9219c3087e66fa1c
	.xword	0x96a3ceb45a271b26
	.xword	0x6cca1f6fc8973d79
	.xword	0x4b087893d61d3e08
	.xword	0x9b49d15bc0ceaa75
	.xword	0xf7b71636cf549df2
	.xword	0x7f84906c91f8c46e
	.xword	0x54229ae80ab88878
	.xword	0xc5117316b98e732d
	.xword	0x813fd701cd63e01e
	.xword	0xe99a6cb5c7f83359
	.xword	0x30211e6014a8a3cb
	.xword	0xbf729d07b1dcd2a6
	.xword	0xe2007bfa70aa88d7
	.xword	0x3e4f14ee94623ea2
	.xword	0x29f55cc50bfd0cde
	.xword	0x6d4f55765243f622
	.xword	0x5c27f2c2e256d3af
	.xword	0xb8da3dad633ddaee
	.xword	0x22e99ce4006ef781
	.xword	0xce30236394a033e7
	.xword	0x241949741c48ab60
	.xword	0x37b5fa8bfc30497f
	.xword	0x9ef47ed5e4552f9e
	.xword	0x53b4c7724e155f24
	.xword	0xcc1f644da802cfb7
	.xword	0xe310f46ff80fa9b2
	.xword	0x93f5f1e437c9bf9a
	.xword	0x8b23f7ce36be27e2
	.xword	0xeb29a406ce69bab6
	.xword	0xc2621c65d90d210d
	.xword	0xdb7ce0decafa103e
	.xword	0x82dde4d5e4817d0b
	.xword	0xdc1d0d578ca7283d
	.xword	0x6efacc4c53c6b52d
	.xword	0xea493103f035fa84
	.xword	0x4a337b1ccc870a40
	.xword	0x598380824ba52fcf
	.xword	0x428707c7da011c89
	.xword	0x832d04b899f164e1
	.xword	0xb4d0440037bb0849
	.xword	0xcb2d7da76905a19e
	.xword	0x50735cf537391078
	.xword	0x0229fb1a62b41f6d
	.xword	0x0687be9d5a9d8fd8
	.xword	0xccb5e4b18387b347
	.xword	0xafcf6b07465d9246
	.xword	0x201711a6df20d15b
	.xword	0x77eb279dad9ac965
	.xword	0x2bf7389f489d9f49
	.xword	0x13d099e58491f771
	.xword	0xe6a7147cb1160d6c
	.xword	0xc82f862a662dd1d2
	.xword	0x9593a9025c683af0
	.xword	0x27e5b10af6815d0c
	.xword	0xe0fdc6a87c0d85e4
	.xword	0x1877750de765ceba



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
	.xword	0xdb7da2a52556bab9
	.xword	0xe3957b134b8e3c1a
	.xword	0xd7318dcbf372325c
	.xword	0x411f24479593c930
	.xword	0x1795ec9f14bc90cd
	.xword	0x76ad69303e709c98
	.xword	0x70b748f40e88276a
	.xword	0xbef6a732096b23e7
	.xword	0x3ce5c699c9b4c5ef
	.xword	0x2a23da7aaeb28d30
	.xword	0x601b3df51997e6f5
	.xword	0x4a9132d590876fb3
	.xword	0xd3ecc6927a7ad976
	.xword	0x93664ff91ccf97ba
	.xword	0xdca76141c6ae707e
	.xword	0x3e14c76102358f74
	.xword	0xfb4bef999aa733e1
	.xword	0xc44530d326228f52
	.xword	0x32407bd57d80238b
	.xword	0xa1dd0c94272c736a
	.xword	0x72836583c3b3ac27
	.xword	0x43aab0784f32ce28
	.xword	0x3fb44fcadb6b2a8e
	.xword	0x0159919fd8d941b4
	.xword	0x0626ff47922c9ef4
	.xword	0x4b0cbd4f42779f78
	.xword	0x6ce76253fdbdade3
	.xword	0x6424d9bdc5b0f932
	.xword	0x0f95d7e16e9a18cc
	.xword	0x80d590d1f48f38ff
	.xword	0xc8727b44f5ae9f30
	.xword	0x9bdae2c6ec78584b
	.xword	0x69d41973c5415f1b
	.xword	0xfa99077ae2e7ce9f
	.xword	0xa8d22d994106658e
	.xword	0xdd1912c775ed54e6
	.xword	0x8e418e80a784cf7f
	.xword	0x0766b0d1ffd33faf
	.xword	0x963707dbb9d3d706
	.xword	0x83eb14a5df4c01fb
	.xword	0x8d887bc6f948c621
	.xword	0xe21d3d1d55e0b7ea
	.xword	0x11670b857898830f
	.xword	0x0c3c3be7a88287bc
	.xword	0xbf62167d604e2238
	.xword	0x3345295400c6bdd7
	.xword	0x73ba9f3871e234dc
	.xword	0xfd93686d5f4d17a9
	.xword	0x914eed8424f7a1ad
	.xword	0x5a7f9a5632a9bb77
	.xword	0xbbb0d4a3375e12d3
	.xword	0x0fd5129c41420fcb
	.xword	0x58cd85fac3adf7af
	.xword	0x5d33e401c4368478
	.xword	0xaeabc676cf573381
	.xword	0xe65b36273d7521bc
	.xword	0x7f4ca333f79f921f
	.xword	0x2b31b5a93aa6cc1b
	.xword	0xf677f8e104525311
	.xword	0x703bf280dc021602
	.xword	0x1eb6561541069f09
	.xword	0xf47f8b7c8dd23f44
	.xword	0xe0550db201aad645
	.xword	0xad2d11baaa9764c8
	.xword	0xd88c8671378ba8b2
	.xword	0x2ffeeb0fa6a1bc74
	.xword	0xf0b54de929efc546
	.xword	0x0da2f2fc467c7382
	.xword	0x262553bfb3ac61aa
	.xword	0x327c35faf1416e18
	.xword	0x7787d5ab3e516a1e
	.xword	0x7e62ab84475eddd9
	.xword	0xcf937662aeea5239
	.xword	0xab4b76590bee6962
	.xword	0x1690831d5d3367dd
	.xword	0x6f6d181e675bf8ff
	.xword	0x7d76cfc2215d6dcb
	.xword	0x863dde13d6c262f7
	.xword	0x2cfa3285a1a47141
	.xword	0xacbc67df6517a585
	.xword	0xd6d00a52c92b5417
	.xword	0xb14cb9f3df6dd8b8
	.xword	0x4a5cd7914f84fd94
	.xword	0x42da1b65cb2ceca3
	.xword	0x77121e95e31f48c2
	.xword	0x2866af13b454c8e8
	.xword	0xe28bb45f7ccd9988
	.xword	0xc33907acf7143ec3
	.xword	0xf237f887242341c0
	.xword	0x9e769fff4d2926e1
	.xword	0xae62b08790acb1fb
	.xword	0x50c97d1752175cdf
	.xword	0x579763c48e8e1d75
	.xword	0x999c9d16a73d9372
	.xword	0x8599653f8be17286
	.xword	0xdcd0c6f509f49277
	.xword	0x9be4ee65d124d72e
	.xword	0x12ce324e2f7f6c71
	.xword	0xb8b13c0c37d10c48
	.xword	0xea8a9ccf3b1ae3dc
	.xword	0xfc712cea1addc578
	.xword	0x0a2bdc6447494da1
	.xword	0xc53bdf744aa32d24
	.xword	0xb29b7846929fb531
	.xword	0x90e1d44a5c191cc0
	.xword	0x63465c45e290eef6
	.xword	0x3f1a049ff0796148
	.xword	0xec737eb230b235f6
	.xword	0xb96784f6511823a4
	.xword	0x5f6d3280582c2ef9
	.xword	0xfbcf4dc90eeac1a4
	.xword	0x58cd5b533504f0b0
	.xword	0x8029a20bd330f81c
	.xword	0x5bc3c570614e97cd
	.xword	0xdcee4d8b180758ad
	.xword	0xee1f6346b464979a
	.xword	0x94dfa142ab53d967
	.xword	0xd7232b6f4df4a568
	.xword	0x028c85ec81d68c5e
	.xword	0xc36551f2a609ef78
	.xword	0xb01bd27990c8174c
	.xword	0x22a49f3c4748204b
	.xword	0x801ec09a35fdeacf
	.xword	0x2c83b653785f34a3
	.xword	0x8b249125542eefab
	.xword	0x72e8a4bcf42bb550
	.xword	0x52b1eb12d98e3412
	.xword	0x064d4295fbe017fc
	.xword	0xeca3042d1287b2d8
	.xword	0x60132372709e5616
	.xword	0xdcf721787acfb060
	.xword	0xadd96458ecfa7095
	.xword	0x7c9cc9b2288593f8
	.xword	0x89c5c50b3050db5e
	.xword	0x2867ffa1571df1c2
	.xword	0xbe0e04a696558653
	.xword	0xcad588fca7445c23
	.xword	0xe15dcb2be0bc0546
	.xword	0x530994acbb7fbc25
	.xword	0x2cfdeef091436a84
	.xword	0x291b69cf162f2338
	.xword	0x755022341904f63c
	.xword	0x89292daaca1ab32f
	.xword	0xf628028fedc9cf5e
	.xword	0x8948c3f03f7653ef
	.xword	0x80dda38e36326197
	.xword	0xcd318f1464b380cf
	.xword	0xc630ac64689a7261
	.xword	0x6344e7ad577c32b0
	.xword	0xb9d2c8e2a3bf99c3
	.xword	0x95c31162045c7a1a
	.xword	0xdaaacfbe14262ad8
	.xword	0xd86dfdb77af1b543
	.xword	0x2f0b5553aa8fc8d8
	.xword	0xa41077b54efefd46
	.xword	0x6c647b4f206d133a
	.xword	0x1eb5c828fbd1867c
	.xword	0x14662ec807c73587
	.xword	0x68c595394a71e2ab
	.xword	0x6d106bd977c86408
	.xword	0x7dc38db987f332ed
	.xword	0x65203b9520e15f84
	.xword	0xa38c8719745110ca
	.xword	0xe2f2797b5294f01c
	.xword	0x5e32012f2ea47a7d
	.xword	0x9ea9888073724aa2
	.xword	0x1e9ff4370cee47e0
	.xword	0x91a1b1265b2836ff
	.xword	0xaa13fe63310c8cb6
	.xword	0x41a67e3ad41e2fb5
	.xword	0x6e102d40b771d0e6
	.xword	0x5cb300289f39004f
	.xword	0x25ea8614fb7fc28a
	.xword	0x25c3a791c6cfeceb
	.xword	0x226fb6d8f0078c73
	.xword	0x4d51c4d6a909bbe9
	.xword	0xbbcf96852e87cc81
	.xword	0x359f311ca2be7c7c
	.xword	0xbda99ea47450fb03
	.xword	0x53fc615f29c9fb76
	.xword	0xb8f61a41721acdd2
	.xword	0xe4b63aeb09bcc6eb
	.xword	0x7c6bb56893045811
	.xword	0xcf0ded631273fbf2
	.xword	0x5cc5aa9ebce46aac
	.xword	0x4aa183810477367f
	.xword	0x7eb18d4ffc079d18
	.xword	0x600e2b9f9c5ba5fa
	.xword	0x7a254a12dccd2099
	.xword	0x58b2a3ef97235f4b
	.xword	0x3899b8360ca61353
	.xword	0xdc39ee5753de5c3b
	.xword	0x4bbbb3b3cd8f3610
	.xword	0x2868e5a589e71fa9
	.xword	0x8814c7f90f87fb51
	.xword	0x18051ae33f3e4792
	.xword	0x44f1c1e7dd0b5dbc
	.xword	0x8aa33b35451dc919
	.xword	0x92be1009974f8dd8
	.xword	0x4d833028836dbf32
	.xword	0xfcfe72da4ac971a8
	.xword	0xd02841b5b310b036
	.xword	0x9b22803d390c58ad
	.xword	0xcf2142fe92251ad7
	.xword	0x0630f864a133eb8f
	.xword	0x8ee7feb8be610b2c
	.xword	0x7395d5e4389dd22f
	.xword	0x0f5e6fd2cd146ea5
	.xword	0xdf426f4e64281724
	.xword	0xa3bf92949bf105da
	.xword	0xcdd946d71536bda5
	.xword	0x2160c37db2c4da9a
	.xword	0xc03fa0659e4820f4
	.xword	0x97203603b9ae4f67
	.xword	0x5e6dd34a8ae1a83a
	.xword	0x3581ff0f04c99de8
	.xword	0x8978a2c26a144f73
	.xword	0xdd0c2595dd2a9df8
	.xword	0x91ee2e10502c61fb
	.xword	0xaf242046d577f77e
	.xword	0x96b807ad649f2373
	.xword	0xff1b72798a7c2ff5
	.xword	0x68c9e0289ff11e83
	.xword	0xe1caa5c3be8ec6be
	.xword	0xa3c3f56940e9a435
	.xword	0x766e299c1876a43f
	.xword	0x06958cc57ddcfc63
	.xword	0x15b9fa6b4ac368b8
	.xword	0x0194ed7da3590766
	.xword	0x24cd0c70ab644d6a
	.xword	0xeef11c50bf4cbb83
	.xword	0x1d8d0d184862a5bd
	.xword	0x3241bab746bb5590
	.xword	0xfb387f4e57327ff0
	.xword	0x86fbf57af3517559
	.xword	0x6c292084b5e13bf5
	.xword	0x104099537f9927f1
	.xword	0x4a7298fa7fae2722
	.xword	0xa982289211dff6f8
	.xword	0xf10448bb59e5bca3
	.xword	0xdb5a4796a7ff2a7a
	.xword	0x94f9e3c4efc0a9a9
	.xword	0xd37d5eca2eb4c9c0
	.xword	0x81873d0a78dac23a
	.xword	0xad4d2101d58d3f05
	.xword	0x6da9f3f3d12723a8
	.xword	0x02318ac259f19a11
	.xword	0x1d9bf60546fd7657
	.xword	0x8e52665c2467e490
	.xword	0xabaf142af2b008eb
	.xword	0x7f3a3e5cd3348d50
	.xword	0xb762780f8bf478a7
	.xword	0x093bab87640c0588
	.xword	0x8b2b4e3163fd6de5
	.xword	0x55492c22ab206844
	.xword	0xd655f789aa17c5f0



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
	.xword	0x6e58b03b163e2cbc
	.xword	0xfe70caf4c93ec407
	.xword	0x96c2b16678b50471
	.xword	0xa3f603002b8eed8f
	.xword	0xae8b023dfb515082
	.xword	0x716db3e366868998
	.xword	0x8504448eb81257c4
	.xword	0x8cfb238b86f24c05
	.xword	0xf89572afa7988e8f
	.xword	0xb0cc7de9bb6abad0
	.xword	0x1abb1468fb828e38
	.xword	0x6f649e93cfc99c93
	.xword	0x06266b8bbb288812
	.xword	0x912856c91fbb9f8e
	.xword	0xf341d55b1557d0f1
	.xword	0x055df3123e0bb010
	.xword	0xd763bcd56c29a71e
	.xword	0x46b3a261c4290700
	.xword	0x1d5af58c18643e67
	.xword	0x5d445ac31df344a3
	.xword	0x60f0011b7d6c5316
	.xword	0x52a3b7e3c9d0cb86
	.xword	0xf9c1738b6ce10062
	.xword	0x21448d1f34096294
	.xword	0x4e4e725f6e5898ab
	.xword	0xae2e22fa9215bd87
	.xword	0xc8fd1ef69e48199f
	.xword	0x6f6eac9bb8b6ca9f
	.xword	0x78d749042bdb7c73
	.xword	0x5f28ca02ce4f5cdb
	.xword	0xb331552661f954ac
	.xword	0x1aeab60ed5102552
	.xword	0x3e389b74b34055ba
	.xword	0x97271fdee1e5f124
	.xword	0xd870d16651cad779
	.xword	0xace67338f6a9b8bb
	.xword	0xd1e85b3163dd21c0
	.xword	0xec83e0ddee87d8b0
	.xword	0xcdd063df3a79c3cb
	.xword	0x6352ca4ad220b9ef
	.xword	0x31126620f71131c7
	.xword	0xc3577446c54e82d1
	.xword	0xdd46bee9ca9dcf38
	.xword	0xc9ffe89587894c77
	.xword	0xb9a5529402e653dc
	.xword	0xa9b1284b50ae27a4
	.xword	0xcfd33888b93704ce
	.xword	0x8d73f873fc6de77e
	.xword	0x6dacb5c4fb1a6df9
	.xword	0xd741e9219fd8ae73
	.xword	0xd2fd0c32809ad79d
	.xword	0xe9de8ceff163be14
	.xword	0x0bc87245bd0e90ca
	.xword	0x18076b3f94050b31
	.xword	0x2bb17ea15c9abc22
	.xword	0xb7225a546d383f2b
	.xword	0xff548bb649cdac1d
	.xword	0xf6c3dfd5832bd67c
	.xword	0x4c204822d6bc05ea
	.xword	0x5045878350e716d4
	.xword	0xc48aaddea134910d
	.xword	0x901ac32962c7bbb7
	.xword	0x83ee5e09fe9ac060
	.xword	0x9596c24790047df3
	.xword	0x191c3080b61dab76
	.xword	0x77224fac1879e6d6
	.xword	0xa3c06174df795102
	.xword	0x1cf5fafc47a16d91
	.xword	0xdfa95d1e9c635776
	.xword	0x6e52456d7474e2d8
	.xword	0xe90e16871a5516e7
	.xword	0xa98025765c089800
	.xword	0x8b0fdb6fa5d5e2ea
	.xword	0x11fc924b0e0c86f0
	.xword	0xe4612bc732514d23
	.xword	0x4d9c8a80131a4fab
	.xword	0xfa50488ecd597f26
	.xword	0xdecceb0fcfe7a4b7
	.xword	0x24f986b3e04449aa
	.xword	0xbb196e7d7d17665a
	.xword	0x1154d4a1f0262034
	.xword	0x67d81eba1118c775
	.xword	0x82833c99e536e4cc
	.xword	0x043a88a1a46f8b5f
	.xword	0x95859c8f64fdc2d8
	.xword	0xf5bec8ec1d0a4ef8
	.xword	0xc09acd4242f74dd7
	.xword	0x1a3094b8e1a180b1
	.xword	0xcdb7e89d42c13661
	.xword	0xce0ac284b73f7928
	.xword	0x834083d4f9ececcd
	.xword	0x18a85ecd10429a86
	.xword	0x45c046f1d7349173
	.xword	0x299d49126cc59e8a
	.xword	0x0f770b4aee60cc89
	.xword	0x8dd00abd8144e0f6
	.xword	0x130979179628a1f2
	.xword	0x38423bdd17e022f6
	.xword	0xfb0d89663cc3dbb8
	.xword	0x0340ed1b89436674
	.xword	0x16c89a76b9f150d3
	.xword	0xda9a20277e6b455d
	.xword	0xb4437cd9075584ef
	.xword	0x7acda9000199488a
	.xword	0x5dda4cd4c6221499
	.xword	0x1a1e20420f7a4bc7
	.xword	0xcd0fa00e678324ff
	.xword	0x59dcf892107bfb88
	.xword	0x39b593ddef99ea35
	.xword	0xe0d422b3db5d0117
	.xword	0x852c2166af2abd74
	.xword	0x37014fad5f0cf7c9
	.xword	0x4f705b29d0be8b91
	.xword	0x93c170d54c5a4e12
	.xword	0xda5d9973de3ade97
	.xword	0x04f3835444198953
	.xword	0x8bef980482fb420a
	.xword	0xebd0d93d3de733b9
	.xword	0x37a9ec81794e518a
	.xword	0xe8428ffe147c8d69
	.xword	0xf075e9e21e24b17d
	.xword	0xa9e98b155ce8316f
	.xword	0x65644d00f2e578b0
	.xword	0xfaee1b4cf4a77113
	.xword	0xaf3b59ae13f6fe83
	.xword	0x4c31516f81185e6f
	.xword	0xeb9fc02c3111af95
	.xword	0xb93ff966be9b25f6
	.xword	0x332e21be2c10efb4
	.xword	0x08e79c5be4b54439
	.xword	0xbf45fa26a66e28da
	.xword	0x411ee265cf6cea80
	.xword	0x5c85a9f1ee1f338a
	.xword	0xf935274cb72b3692
	.xword	0xa8c61ab86ea31230
	.xword	0x799bc922ff1a48aa
	.xword	0x4336fbb75b6377b9
	.xword	0x384be6ec8652dd10
	.xword	0x482a2cce59c4ba28
	.xword	0xef6f847218f5c3ed
	.xword	0x9350ad17bc1aadf1
	.xword	0x6596a26e87c88d5a
	.xword	0xd8ae1829340d45bd
	.xword	0x14a1246f773590cc
	.xword	0x29054745de8364c3
	.xword	0x274fd92e39bf5ca7
	.xword	0x3e0c1baab42a8d8d
	.xword	0xefdd2dc77002d074
	.xword	0x53f923e2b165a651
	.xword	0xe3f6622ae68916ae
	.xword	0x7957a6095d52ac18
	.xword	0x35e422afcfc8454c
	.xword	0xaa29139e4e1622a7
	.xword	0xd399e4de854f659e
	.xword	0xedbe8525c20f2aea
	.xword	0xe9a7fe7b2394ca9d
	.xword	0x7aefac9f7b4908f6
	.xword	0xa58661c03d9ff4c8
	.xword	0x1c4512ba4c27812c
	.xword	0x6ac4022bfcf9d0da
	.xword	0xe8772baa690ab6f8
	.xword	0x382399edb7ac7dff
	.xword	0xca38290f89258aeb
	.xword	0x04a3ac61f5bdd279
	.xword	0x077c443b4c431919
	.xword	0xfca5207a7b2da990
	.xword	0x24d0207e6d332c18
	.xword	0x36b01ceb89406906
	.xword	0xc7f42352792d5d8f
	.xword	0x6b163352ccaf304f
	.xword	0x091fd85ae354f3ef
	.xword	0x14a123de761d3357
	.xword	0xb5d61e5dd5dfbf03
	.xword	0x4ae3c731b137013f
	.xword	0x1f9c4aaafa424501
	.xword	0xecaad7f34c253a23
	.xword	0x55049acf55508ec1
	.xword	0xacb9fb0c2a0ae3b2
	.xword	0x59db0108b3572ccd
	.xword	0xb6d68a1935310f63
	.xword	0xe702c8fffff8f3ab
	.xword	0xa3bfea55dee33f8f
	.xword	0xacd2516246ba351d
	.xword	0x9c060783d518c441
	.xword	0x493810870925c9a2
	.xword	0xa167aa142157e732
	.xword	0x86582d150d4daaea
	.xword	0x7a98db845a3e862b
	.xword	0xc37bfd7f89de3a20
	.xword	0x518580d6f4b16335
	.xword	0xba9457d18e197c37
	.xword	0x5c8416926a8c9c14
	.xword	0x678a87c910db16d5
	.xword	0xd0e8b72ecab9b3c5
	.xword	0xcba6b62d5622b75f
	.xword	0xe9c068c877472b38
	.xword	0x51d1d74bc59a6558
	.xword	0xfb0f3c926a1540fa
	.xword	0x70769de48e5c94a2
	.xword	0xc3da5368e36c8db1
	.xword	0xd45c7ec200fac148
	.xword	0xe3ea9c2018fab55c
	.xword	0xad24d0d8f97f61e4
	.xword	0xf0887ea9d0aee8cc
	.xword	0x654fdd6ab762671e
	.xword	0x4683db97616baada
	.xword	0x0e0c9028bd3849b9
	.xword	0x855b2d90122b6ed3
	.xword	0xe92629258ff6ab64
	.xword	0x009d8e2871261415
	.xword	0x96e0110f57b6dde0
	.xword	0x7d7463e5a1671d72
	.xword	0xcbe16763512cc6f0
	.xword	0x33797170f2098225
	.xword	0xa30c554d922b7f15
	.xword	0xc930152c615a5f2c
	.xword	0x5fbee70d958d9cc2
	.xword	0x259c19fc4533aad9
	.xword	0x7f3c2ce253a9a71d
	.xword	0xd29f3858b799ab71
	.xword	0x3a1059f3a1619a6b
	.xword	0x6b7ba6b364b08d1b
	.xword	0xb00bb5ca3cfe6cbf
	.xword	0x2904bb1488e937e4
	.xword	0xafa9a32c0f6a4510
	.xword	0x4dbb14ac33fc5eeb
	.xword	0x3681d0999b8c6af7
	.xword	0x13f130880c574f9c
	.xword	0xf5c1c149b833e9d8
	.xword	0x1489b5d9a8ff4bd0
	.xword	0xefdb2b5171353dff
	.xword	0xa3c836f8f39081c5
	.xword	0x8ce51b63a4ffb543
	.xword	0xb148df009a457426
	.xword	0xf3e2a75069e50e6b
	.xword	0x61002b464426e723
	.xword	0x4e60e0af0bfc5e21
	.xword	0x19fe9e8b2ad1caaa
	.xword	0xfcdd4a213862cf34
	.xword	0x2dc792f15e0b8bac
	.xword	0x58295965a32fe1a2
	.xword	0xc66b7a7fdbc906ab
	.xword	0xa59a01b2b934b29e
	.xword	0x20cf55c6aa92d372
	.xword	0x736fde0738dcb3a7
	.xword	0xfff74e2a006848f5
	.xword	0x7eaca0c6c2f03314
	.xword	0xdfeeb03c3ca7eba6
	.xword	0x3df2f5eada71be62
	.xword	0x5a01fcf97ce841af
	.xword	0x65b1e4a320d10a9b
	.xword	0xe4ddfe65a8302afe
	.xword	0xd9c7f4398d43b673
	.xword	0x74ad12eb7a65f419
	.xword	0xa7097b7ea3c78a82
	.xword	0x7f96d2d7d7982843



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
	.xword	0x1e84bb480590e2cc
	.xword	0xd61f032f77a931cc
	.xword	0x66ab619d0ea37cb7
	.xword	0x559f97c80e301caf
	.xword	0x73fb2270b719ebc5
	.xword	0x8a3ca17f13cf1ae4
	.xword	0x27b2112abd3190c5
	.xword	0x42b3727a3c383c7a
	.xword	0xe13e5fa9a4a2b654
	.xword	0x8f7edde135cc679d
	.xword	0xe6a8bdc0b21ffd2d
	.xword	0x14b1bc1d45d74092
	.xword	0xd0b4bd1426f65008
	.xword	0xffc770fea0c14c92
	.xword	0x02dfab7754605e09
	.xword	0xfa6345fe4e3f9e75
	.xword	0x71d637335bb1e093
	.xword	0xdcd508e37a289842
	.xword	0x04af13f5aee1ceb8
	.xword	0xa989e45cd0dc7fa9
	.xword	0xbb4e2c95c4acc897
	.xword	0x1246a472023c5d6b
	.xword	0xffd1b8fb6012c8c5
	.xword	0xfd168d3dd09b3a60
	.xword	0xf9d0c6bd197f5d55
	.xword	0x23186cc6fb3f176a
	.xword	0xdb83e7d0463b5896
	.xword	0x690272011be9a413
	.xword	0x3bb209aa99d1c240
	.xword	0x2566c4f96dd8707c
	.xword	0x3dc73bbf941e5975
	.xword	0xcc33b4499c247a1a
	.xword	0xd930f932541f8157
	.xword	0xd9ea49d40df1e597
	.xword	0xdc80d6bc47e1cb0c
	.xword	0xb6b7316f6ae47823
	.xword	0xfe3e7d2424d6b69b
	.xword	0x7d60b89ac177d52a
	.xword	0x09c7e90298342731
	.xword	0xf3f95a6cdb71836f
	.xword	0xa4690a75eee87be2
	.xword	0x9e87766f5d404fa2
	.xword	0x1bcbc9046da4cf6d
	.xword	0x1640aaae34e698d9
	.xword	0xcb8621eb5c2c6e80
	.xword	0x355cdadb3aa3d294
	.xword	0x1158d1fbdb783d56
	.xword	0xcf558ad42d4a3b73
	.xword	0xcf1f9b4a150a009f
	.xword	0xddb6ded2cd57f98b
	.xword	0x0dcaf7ad07f09359
	.xword	0x2647ff853df4c10b
	.xword	0x98a7dc0321224824
	.xword	0xd55ff0c73561396c
	.xword	0xe832e17ea644a3fc
	.xword	0x23944502ac4551c6
	.xword	0xc7c4419e8500e231
	.xword	0x5865bcf871828de9
	.xword	0x536696350a30f062
	.xword	0x511b71e069fb37f1
	.xword	0xb20d60bf98c4ca64
	.xword	0x339ab1bb0b8f7abc
	.xword	0xa32eb4f85c6e7403
	.xword	0x2d1bb4993e632434
	.xword	0x87f8055c1ebfd2a8
	.xword	0x9c679281723fcbb1
	.xword	0x426e587bb46d95e2
	.xword	0x3302aa5512ed7e8d
	.xword	0xb5158e68e10073ee
	.xword	0x4b469e3bd0132e38
	.xword	0xb4f07f506f21866a
	.xword	0x800a51c48fe4d231
	.xword	0x08bedb019b08e986
	.xword	0x16d71f696cf8f23f
	.xword	0xb3755fab03a32745
	.xword	0xb9611d9d222504d5
	.xword	0x73c60ea7f1fd4bbc
	.xword	0x979921a91419f4c1
	.xword	0x4d88c06d1aee9234
	.xword	0xaccef36858863c55
	.xword	0x7d58899a576199b9
	.xword	0x983880d2c6f9b2d4
	.xword	0xdd01d7fa9f31db50
	.xword	0x2047af8a7724f9a5
	.xword	0xb9689c85a0edff7e
	.xword	0x39e9c441672fa479
	.xword	0x648f5e575be8f497
	.xword	0x0a2a7d5c68926358
	.xword	0x1b91133b425038df
	.xword	0x099f3054111c5c04
	.xword	0xcb2f743fd7373f29
	.xword	0x04c59bf52bafbad9
	.xword	0xe87c0698e9f906b4
	.xword	0x887309850c7b301a
	.xword	0x3ee2f70a1c73c92c
	.xword	0xba7c5d20e955efcb
	.xword	0xfad30d7972d2e077
	.xword	0x168f4cc49b9523bc
	.xword	0xddf2235a643621a3
	.xword	0x3b2c69a43b7af719
	.xword	0xed407aa44cddc358
	.xword	0x662486ec98374c1c
	.xword	0x4f32e5df2d11c596
	.xword	0x5c296a36b3b71bbe
	.xword	0x22db4986787e546f
	.xword	0xb5d322b8ebb8fd57
	.xword	0xbcb8f3b020a6524a
	.xword	0x430095219d6d567f
	.xword	0x0737e12e6ea7cb92
	.xword	0x23148ad73cb4f17c
	.xword	0x26fb7dbaeb1dd9e0
	.xword	0x835c1f96c25b5732
	.xword	0x5e63b9e384fae487
	.xword	0x4019b4c7520ba138
	.xword	0x1eee712e49349868
	.xword	0x3c5588ce2311ed66
	.xword	0xe9ddab393a73e45d
	.xword	0x72750a69da70ca6d
	.xword	0xca78243e299eebea
	.xword	0x711d018423b185d7
	.xword	0xca28491ffc1e9382
	.xword	0xf34ec2ef46557480
	.xword	0x781abd785f816f49
	.xword	0x3f3a9e3a2cb0e162
	.xword	0x8f128e52a52705c3
	.xword	0x15eb88d1a8157327
	.xword	0xffe7eae252f6544f
	.xword	0xcc6cb696704f2033
	.xword	0x28d2f881f6c81f40
	.xword	0xfd065f8e2fce9aac
	.xword	0xf54a7fe8504ae304
	.xword	0xf527d7f515db98e6
	.xword	0xf99de8d9d950c908
	.xword	0xbb4e731f66fd27c7
	.xword	0xc6340d2353b4f8ab
	.xword	0x2d53f05f1feff935
	.xword	0xb85c8922b0a3717c
	.xword	0x6c79bfa3a3bb67f1
	.xword	0x252049068fadc25b
	.xword	0xe9e57f052dd8d6aa
	.xword	0xbabbbd87bcd0f0a4
	.xword	0x96b5ec8490425a4a
	.xword	0xb65c1cb4b99dfdd8
	.xword	0xce502512fa590bb8
	.xword	0x71a247899108c0a8
	.xword	0x4f02f1ffec5adf69
	.xword	0x543d16205fbc8cc3
	.xword	0x1fe01566ec619653
	.xword	0x9fb47240ba2baf44
	.xword	0x176d43176404e1da
	.xword	0x617cf701cf4f998d
	.xword	0x84fb600f339b9695
	.xword	0x5614f65bab8155d7
	.xword	0x491cdbc8ee7e004a
	.xword	0xc400893981c925e3
	.xword	0x162a40fcd64d06db
	.xword	0xe3467dd8481f5559
	.xword	0xcab73c4a4e760141
	.xword	0x559b08f91555f5de
	.xword	0x6fb8a8edb0e8b274
	.xword	0xe3eb577fef8feb72
	.xword	0x94b078e4568ab974
	.xword	0x39c003cf04e7c4b4
	.xword	0x4e600091d2c77546
	.xword	0x01df3e5511e861b3
	.xword	0xe03fddbb83fa47bd
	.xword	0x6c3f5c898921695d
	.xword	0x024c257b931cbffa
	.xword	0x7c8c10a9a99d670d
	.xword	0x3d179d506a8af30c
	.xword	0xc210d37d46d54eb7
	.xword	0xb6a231638f787a1c
	.xword	0x1042ea9ef2f2820f
	.xword	0x2f235d5f0ecb7a75
	.xword	0x7ce1b9422c530150
	.xword	0xe2aa3e3064df3b2e
	.xword	0x198314bf873ad8cb
	.xword	0xc16beff92f96e1a6
	.xword	0x1969a8dbc6dd8897
	.xword	0xc1025c49c9fe85e1
	.xword	0x404acf2bdb04effe
	.xword	0x9a92f6b1e2bda14f
	.xword	0xa40f63575d5fc181
	.xword	0x830f0d7f035c5ef3
	.xword	0xbb94b7b2a206680f
	.xword	0xee2028fcb380de4c
	.xword	0x3118e44735ebb148
	.xword	0x0f53e3a7f4300395
	.xword	0xcfcec3038633bef8
	.xword	0xe80a9e8e79d50fa0
	.xword	0xb59d94b3cd05a80f
	.xword	0x6a2b79aa4787232c
	.xword	0x8ce989b4cb350749
	.xword	0x2c732fda60422047
	.xword	0x2b01e36246c7fad5
	.xword	0x004c824cc3048a58
	.xword	0xffcc94084568f6f5
	.xword	0xfceeaf9b707bd9ad
	.xword	0xf46fb86cccede163
	.xword	0xeef1d3417b81c187
	.xword	0x4d01b5d657be028a
	.xword	0x279cc0aa13748029
	.xword	0x872646c4b9cc50ab
	.xword	0x2edfe930cc356d30
	.xword	0xfb704011f0653b56
	.xword	0x9ccd5c68972759de
	.xword	0xbcdce9968c1e1f80
	.xword	0xdbad6e7f71f9010d
	.xword	0xcd3ad58b809b8239
	.xword	0xb98060add87bd85b
	.xword	0x7a0e8edf320ec791
	.xword	0xf1b38008bfbe1a45
	.xword	0xc913c3f1fb693195
	.xword	0xabee54537d6be73f
	.xword	0xa3ca4ccf2fa563b1
	.xword	0xd230587507ee4b6f
	.xword	0xed9289ecef697ad0
	.xword	0x8e6cc0642c73b285
	.xword	0xf34430949e1e23bc
	.xword	0xa1d81adae22361f2
	.xword	0xf8d538809f1d176d
	.xword	0xeef7da8c0700a34a
	.xword	0x1068c61f8ef88313
	.xword	0x95e1be58e576f3ad
	.xword	0x51fdd39491e48fc4
	.xword	0xdc635fbfeae46585
	.xword	0x32e7386bb9de2ce4
	.xword	0x4a396894b0cd6408
	.xword	0x02e059fdcba8fb28
	.xword	0xc7b73efc0a228cec
	.xword	0x1d2a2503e3fa3314
	.xword	0x5b940d8657b4dca8
	.xword	0xdad1ac47e8dff0c2
	.xword	0x67608f7d4fb3e6cd
	.xword	0xfb3903fa90b29a9c
	.xword	0xf410fe862121158d
	.xword	0x0920553258cd5d11
	.xword	0xf4468d300043e6f0
	.xword	0x46734a4605d089ae
	.xword	0x5b4de05d816b393d
	.xword	0xebbad22f7b67b15d
	.xword	0x717e43aed7bf59d6
	.xword	0xc95f7e3620020c63
	.xword	0x85b8093622bea2b2
	.xword	0x213a075cf3854cc2
	.xword	0x30fefc8d4a477f30
	.xword	0xd95915f8130b5e1b
	.xword	0x8cf8f5188eb8cc20
	.xword	0x036c23589c8f1660
	.xword	0x9ce992f845f3f6d9
	.xword	0x895a3979a416ee94
	.xword	0x0582467559e06766
	.xword	0x412d27d6b9557dac
	.xword	0xf75450130fdab33b
	.xword	0x39bd9609a50306b6
	.xword	0xffbc6bdae89aae2e



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
	.xword	0x9f6b12ac256c8390
	.xword	0x2fbd71116a01d8b0
	.xword	0x9f143a1e6124592a
	.xword	0x7d802e63ee2b986a
	.xword	0x6743493602f801a2
	.xword	0x929b25af8462cdfb
	.xword	0x3bb2bc73dc6d0b21
	.xword	0xd8785ead87ebbd8f
	.xword	0x8a51d82d99473840
	.xword	0xf446f021585bb30b
	.xword	0x9767aa88a8a536e8
	.xword	0x726ea9660d1bcd27
	.xword	0x9451ab8e5e7b20e0
	.xword	0x62eaf59850a5fcad
	.xword	0x97c86bd1d203ea57
	.xword	0x4f1693c9d9d274bf
	.xword	0xe8a9d6c987bf2d8a
	.xword	0x89e488b5f36de92d
	.xword	0xa376b6eb694a0ca8
	.xword	0xe00799372fd54610
	.xword	0xc9f9496138a9471a
	.xword	0x28e78a8c39cf4cd8
	.xword	0xa04c5d131414fb09
	.xword	0xc48f49c46bd55b0a
	.xword	0x01a7896f4c939e26
	.xword	0xdb757c812617ecb6
	.xword	0x5fb96462e468413b
	.xword	0x599a853db450737f
	.xword	0x6521c154513a88d0
	.xword	0x921f7b5efef5fec3
	.xword	0xb0a5660ea0f80a9b
	.xword	0x1f6b89387830e032
	.xword	0x30788fa5ca11ab64
	.xword	0xfb56daa7c19ee1bd
	.xword	0xeefc894e4e9348d1
	.xword	0xb5c759809e1e8f97
	.xword	0xf2ffba240dd4e6b8
	.xword	0xef69e877ce0c17cf
	.xword	0xc8f47f32518ea1f5
	.xword	0xc934a8ae50e799fb
	.xword	0x1e0b8223820b2387
	.xword	0x88662b71c46e0ac1
	.xword	0x9ea535df6069af3f
	.xword	0x29f105fe0eff4713
	.xword	0x3d128e1c9b97ad0e
	.xword	0x4c8c486aebbd678b
	.xword	0x88d74272f3718be4
	.xword	0x1a075c7994f35515
	.xword	0x6b8f908695454226
	.xword	0xeb83a90b551bc555
	.xword	0x75ba6925752f6537
	.xword	0xd797a48778d67ef2
	.xword	0x5273c4e4ffa72d00
	.xword	0x18ab39462a6d2b28
	.xword	0xadb2a0bae73a1663
	.xword	0xc0c5b36cc1c5b234
	.xword	0xc31fb1bf463b2c67
	.xword	0x958ec2a344c891bd
	.xword	0x10758ba0a4c30cf4
	.xword	0xa6280b5064a3ddaf
	.xword	0x987d8d791905db3d
	.xword	0x193b66828cac9419
	.xword	0x45213ae7e52cfa97
	.xword	0x3ab6897a5e7a62a3
	.xword	0xc058b6ab81c77368
	.xword	0x1a80c6b6527ba513
	.xword	0xcabd75a3c2dca142
	.xword	0xbbed466a205407b6
	.xword	0xc0b2b59c621f8333
	.xword	0xac912a4812edfd91
	.xword	0x5feddca7b8f8780e
	.xword	0xfc2c554e1f0f20c4
	.xword	0x2fcaa002d29ff156
	.xword	0x62f27b55cac0e442
	.xword	0xe6d5feca0447df83
	.xword	0xee243b1e464a2cdb
	.xword	0x3450da14931e4614
	.xword	0x45fb2b52383168c2
	.xword	0xeec1808fc34b1799
	.xword	0xc3dafd5ebf1d49a3
	.xword	0x21aa60e577bd395d
	.xword	0x98f19ce747118052
	.xword	0x83aa02ba884b55e7
	.xword	0xc2709425b3faf4e5
	.xword	0x3506d53927649ba2
	.xword	0x1c294bb9cd74e57d
	.xword	0x519c6b0e3489df94
	.xword	0x67ba0cbcc5defa72
	.xword	0xea2c810fa1eff851
	.xword	0xbcee727ca1cfe410
	.xword	0x2dd826574619bf47
	.xword	0x7daf17137c981d2c
	.xword	0x441673295d9985cc
	.xword	0xfdfac275749bb215
	.xword	0x28246fe09ecbbe09
	.xword	0xeca03ed9381e5838
	.xword	0x8188de66fee727ea
	.xword	0xc5ef6ea2613fdf58
	.xword	0x62c239c43e0db4f9
	.xword	0x55cb4fbb8a14f01f
	.xword	0xd2b17bf06ee93ba5
	.xword	0xcdac3d822e3652e1
	.xword	0x3d2f9f1861e0de98
	.xword	0xd7816c7a8d8fa766
	.xword	0x398fa211e0996dd6
	.xword	0x1a5ab55e2809f090
	.xword	0x4069f1b52c51efcc
	.xword	0xe112ae7ed1dd2176
	.xword	0xc3e866fb88635cb2
	.xword	0x32a702ef68350dff
	.xword	0x5879acb4c3bb4d22
	.xword	0x157e3bd7e2448898
	.xword	0x33a98c6b8e87c624
	.xword	0xa2021423db98c734
	.xword	0x50d0367085594405
	.xword	0xcfd89c9824319275
	.xword	0xf25c5d7e042f8b32
	.xword	0x6bc28881034a6a4f
	.xword	0x94b99c7439bf3055
	.xword	0x7d9b18640113e348
	.xword	0x9d5797c70b3d91da
	.xword	0x05f9b81dd3a48b51
	.xword	0xf4b94309546ba1e1
	.xword	0x5e1a06950b6c21c4
	.xword	0xf4f4c499049c7f65
	.xword	0x9c6af2892a8bd850
	.xword	0x83492705fc4b22b6
	.xword	0xfc348eaa226f163a
	.xword	0xcc73f6bc5d7f938d
	.xword	0x89d08fed4b5873d8
	.xword	0x6e4e82e10f96c6c0
	.xword	0x4316227dbb87b276
	.xword	0x0ed9310b9b5457f1
	.xword	0xfa8ea83874b10c7b
	.xword	0x250323b668ea9297
	.xword	0x4e3549a87c238cc8
	.xword	0x5636019d92c4017e
	.xword	0x250edfda3234af41
	.xword	0x53c591fedeaa6f52
	.xword	0x21dd3ea6471b5d7d
	.xword	0x6f9f57103c7f2f0b
	.xword	0x7f15a858e55b4e59
	.xword	0x4c56ea3a823d7f76
	.xword	0x5405c497b698c7a3
	.xword	0xb339c2327d3284ea
	.xword	0x5597e89277622acd
	.xword	0xd1b85571c61e8806
	.xword	0xe9355e9c5dd5b97c
	.xword	0xf4c2c1538d85a740
	.xword	0x51384a426009415c
	.xword	0x34c94b942e89fac8
	.xword	0x3af2ef7c06437b2d
	.xword	0x271493663dfb27b2
	.xword	0x413bd3f12cd29b4f
	.xword	0x11dba6fd6e233517
	.xword	0xa3acaa0496ae7201
	.xword	0x1d749aebf1558d4a
	.xword	0x3bcc85faf536ebd4
	.xword	0x70a11b799dc9f233
	.xword	0x13904532c4c25e65
	.xword	0xb92ffe3cc2d21617
	.xword	0x4e02e2bbb409138b
	.xword	0x22efc8e78af47e45
	.xword	0x3efed2d60b25833a
	.xword	0xe0d4941c83508ae0
	.xword	0xdac3a746987c991a
	.xword	0x9fa24c193c4bbb8c
	.xword	0xeb44b792e91cb3c4
	.xword	0x4a89f527d13f5878
	.xword	0x8b60e0d826b3db8a
	.xword	0x1d0702fc05e7da8d
	.xword	0x692e7f751c6209f5
	.xword	0xae2939943e9da95b
	.xword	0xefe9a08a95d3c427
	.xword	0x9c9de46a43570867
	.xword	0x55bfccba175f821c
	.xword	0x1986bf5bbe867c4b
	.xword	0x58e5a05c4fcf447e
	.xword	0x240ab25e337ae5a9
	.xword	0xf6e7e6a710519607
	.xword	0xbe11154e0a8ae38b
	.xword	0xcb6e4c422268cb5f
	.xword	0x3491a3f1807c3940
	.xword	0xacdb94a0d7b8ad20
	.xword	0x0d8b3c9e3baf94e9
	.xword	0xb5446c9859198c00
	.xword	0x60490c7eb9813e3b
	.xword	0x5d097eb3ec7a951e
	.xword	0x0bb01356124a9cbb
	.xword	0xff44c16667529bcb
	.xword	0x9563aae76996af6e
	.xword	0xae11bf0884b80326
	.xword	0x5d838fdae0c6506c
	.xword	0xa7cb69b65d0cbe65
	.xword	0xb347eef1666761b0
	.xword	0x8ec444014a542f3b
	.xword	0x9d67dc6034e5af23
	.xword	0xc872881f448f3b2a
	.xword	0x5079b38c450f2bc1
	.xword	0x5f4968242f82a7d2
	.xword	0x60187f86a4eb4a50
	.xword	0xe519c669605dbced
	.xword	0xb4d73d59852db656
	.xword	0x67bee68eb9799e70
	.xword	0x7f4d12ce3e247934
	.xword	0x541d7536a57e7822
	.xword	0x25b6e4d9f6888f92
	.xword	0xaf434833984c11be
	.xword	0x33e07b41a34c61ec
	.xword	0xa39ba3ea308e9bec
	.xword	0x5db47e69227652e0
	.xword	0x9816c2a5ddf2ba25
	.xword	0xb875d8f809ad1bf6
	.xword	0x8d7b6a9d0f2414f5
	.xword	0xa308800bd1c563cf
	.xword	0x679e083305ad3051
	.xword	0x82b8660ae22d497f
	.xword	0x529e1a3062e23186
	.xword	0x0808d455bacdf283
	.xword	0xa07d6515c0a6c70d
	.xword	0x9a550259e39a1c88
	.xword	0x1338902e526c9539
	.xword	0x23b2eb4e75e5ce96
	.xword	0xe72cbaa856be0b24
	.xword	0xb94374ce4b440f6c
	.xword	0x99e87482bfb8aaf1
	.xword	0x6bb206b0d44b7bba
	.xword	0xbda3a60d6fc7710c
	.xword	0x7765a2812f365771
	.xword	0x2c3277a8c4317a74
	.xword	0x42c4ce71dec22f4f
	.xword	0x7e2b447a570e8796
	.xword	0x6b10585fcf671f13
	.xword	0x964552007a443d8e
	.xword	0x3383b38a987d2275
	.xword	0x5e3c7984371f4673
	.xword	0xd1058646acc56408
	.xword	0xcb75b6c2bb88f7ce
	.xword	0x16b175d99c379939
	.xword	0xad8a80baf2804be8
	.xword	0xe49ce0c2e3476448
	.xword	0x811f32120579f557
	.xword	0x13f3e098e93ce3aa
	.xword	0xe6958b19b87780d4
	.xword	0x640fde17780fd3ae
	.xword	0x7d0ff98e8857c814
	.xword	0x2ea24599d71828ea
	.xword	0x608b5af1eb89c022
	.xword	0xb1c2282ab9bc0130
	.xword	0x61bd395b08e89f70
	.xword	0xecc49e887c42436a
	.xword	0xa31a751834f6c762
	.xword	0x941bbd18d2299b4b
	.xword	0x6bd320df21717213
	.xword	0x7e0f945284e8e1c0
	.xword	0x9739c54e64eb6ff0



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
	.xword	0x538b9a95da25fbb5
	.xword	0x9112366a0b37eaf6
	.xword	0x1fb376a01c5c41f9
	.xword	0x74773ae12d42a880
	.xword	0x0a8a45523997653c
	.xword	0x70798649d994c2f0
	.xword	0x848497c4f5bb34e9
	.xword	0xc7f0a5fc46a70a5e
	.xword	0x200bcc55eea15352
	.xword	0x5e40db606a5b702a
	.xword	0xffc028e7cbd77fd5
	.xword	0x4699a8a15e8be77f
	.xword	0xa3109cbf0438b1ff
	.xword	0x8683aab5822db539
	.xword	0x76405cb7ca30c9d9
	.xword	0xffe9ddcf7d40040c
	.xword	0x16e43409587f9f3a
	.xword	0x5812a61755ee914c
	.xword	0x9ac9343aad31af6d
	.xword	0xf9fde4b36e1178df
	.xword	0x58c80d23570e6964
	.xword	0x404e8900535d7531
	.xword	0xef881d77842a06d3
	.xword	0x4de072f57ef6a8b4
	.xword	0x80e3c1f0acb02240
	.xword	0x0ed78cfe5db3d0a5
	.xword	0xe75e49e4032a2e6b
	.xword	0x2287d19fb36dcd84
	.xword	0xc0a35c1b0b5d6d6c
	.xword	0xc4d03e362dfa31ea
	.xword	0x9b2c37f108bca008
	.xword	0x4af355493d55d367
	.xword	0x98208e01d30972a1
	.xword	0xc2508f68c6e8d7ce
	.xword	0xdc680dbe9c075c07
	.xword	0xa26518ff72fc2b5e
	.xword	0x7f1f2ccff40f35eb
	.xword	0x58df4296ed2a5f95
	.xword	0x6e04b29c13df0e40
	.xword	0xbc3e03e5ac04e82b
	.xword	0xae578c50507ff8a9
	.xword	0x17be4988c997d84d
	.xword	0x0412fc540bbf7fa6
	.xword	0xca9057863c0e34b2
	.xword	0x9396b8e9d56acc5d
	.xword	0x28226badcca9a4d6
	.xword	0xa920c3d566e6650c
	.xword	0x52a451d49a270a53
	.xword	0x6723909b1487630d
	.xword	0x2747c51616210e1e
	.xword	0xd10034aee354ba3e
	.xword	0x0fde81cd06233873
	.xword	0x09c635eed7acc89b
	.xword	0xf053683bf3083640
	.xword	0xe41e9f53f1dbd822
	.xword	0xea6a8e80d715aff3
	.xword	0x91eefd2b7d0b8fc3
	.xword	0x64b5fd8b56287801
	.xword	0xc91f47e9859b7803
	.xword	0xad40ed2e1949dbb1
	.xword	0xe06253b531f3018c
	.xword	0x8bcc6c20f349853b
	.xword	0x08bb60234d5cf9e8
	.xword	0x9a19d8012b7a6171
	.xword	0x18aa24bb11c3e36b
	.xword	0x4ce6e1acadb2158c
	.xword	0x2865e706d0fd83f8
	.xword	0xa6e059f397f59127
	.xword	0xf9d9545afbe5a328
	.xword	0xeccc30887f901114
	.xword	0x62c5bcaf3e9350f5
	.xword	0x15c92478cccf070b
	.xword	0x4c0b95027b352e2d
	.xword	0x8bd099ad0d6e844c
	.xword	0x6ad3a16cb0bdf7cf
	.xword	0xadc3c68276d2c2b2
	.xword	0x042f62a730d37cca
	.xword	0xb7aa553d243122fe
	.xword	0x1a936a6ebf8e75c6
	.xword	0xb205c4a2ed8b350a
	.xword	0xb1393b44a2e389ac
	.xword	0x53d4e6e2ab8ad52c
	.xword	0x9d09e497364aa826
	.xword	0xb4b320029ddab482
	.xword	0xd13bf0944c993062
	.xword	0x80680eda632413f3
	.xword	0x37de55fe0fa4186c
	.xword	0x1bfea6caf7a477a1
	.xword	0x5d83a4756c881226
	.xword	0xc3f1b84b1a40e922
	.xword	0xde8ab9ff28521f37
	.xword	0xbda9b99e2236181f
	.xword	0xd515f95bd1cc2459
	.xword	0x28d5a3f801c5dff6
	.xword	0x655adc7a88a7e0aa
	.xword	0x3a3ad0f6e6bc160a
	.xword	0x26401207b77757ce
	.xword	0x794105b7bceef51e
	.xword	0xd8c47c069c440c8e
	.xword	0x71cbbd8aa122b10d
	.xword	0xd2a6972a4e5e7ca4
	.xword	0xe77522aa5b2794bd
	.xword	0x59b4754a48f33fe6
	.xword	0x297f72c4c45d0bdb
	.xword	0xf1a0d2eafb1e8e60
	.xword	0x0c6423c9b01ed05d
	.xword	0xd6e110d6bc75dd64
	.xword	0x6233ccf098bc1a26
	.xword	0x6df0b2e356edcf35
	.xword	0x849798e7d39f2e6f
	.xword	0xf923de8a209c8c77
	.xword	0x6464f28d7f6ef79f
	.xword	0xa77c73ea917b2cbd
	.xword	0xd700e3f356eb39cd
	.xword	0xfb26b3bdd9297970
	.xword	0xfd91674a48eec5b7
	.xword	0xb7f89d6874aef238
	.xword	0xfef4f2783593b9b7
	.xword	0x7813eab819b30059
	.xword	0x88bd7d5f77e9f6e2
	.xword	0x0c12c96ff949628a
	.xword	0x5f505ea34dcd3f0a
	.xword	0x0b9330a22a885c24
	.xword	0xd5fbe9e8b0327c4c
	.xword	0x95b323433ef19025
	.xword	0x53e6562edf341cf0
	.xword	0x62a4042dcedf9301
	.xword	0x24eeefa9c55285c0
	.xword	0xfee0e2c42a93f00a
	.xword	0xf02ae5fa5d51acf7
	.xword	0x5d0e151d133b8271
	.xword	0x378d883146103dba
	.xword	0x1da81dc70a291a4f
	.xword	0x5e365ba89a8e87c2
	.xword	0xd3b837cc796326d5
	.xword	0xcd6af2c89cfa7ec4
	.xword	0x28a62e1eb3715081
	.xword	0xc8593af4583ac044
	.xword	0xc8fbe300b09a17ef
	.xword	0xa1dd458c22be3ec8
	.xword	0x04886d3763f6deb7
	.xword	0x76dabce8f4b412ce
	.xword	0x7c6cae17fce9cfb3
	.xword	0x47a96af33783deb5
	.xword	0xcfe66d08c9656460
	.xword	0x343eebb9aa083b07
	.xword	0x5b819c220f68d598
	.xword	0xdb7ed75e7f843f7f
	.xword	0x2de36d02d662a2a1
	.xword	0x597a1e35fee72f74
	.xword	0x23606a1d77c7980e
	.xword	0x9e5e66a47b3a5c3e
	.xword	0xb399709686af9f91
	.xword	0xd8aa9cbdcdfcb695
	.xword	0x2bd4d4fbda612f08
	.xword	0x3829b7ddb3ce698f
	.xword	0x4e4a27163691f752
	.xword	0x9119af11e94b5209
	.xword	0x31c61a23dab65534
	.xword	0xb91c35b394d78497
	.xword	0x287de192561191c7
	.xword	0x8937ac89638de851
	.xword	0xcfa8071a3276d12f
	.xword	0x37138708b1d6fd9d
	.xword	0x012a7bd80bdd83c0
	.xword	0xaff384095bb919fa
	.xword	0xb350326ac50b1c71
	.xword	0xfdaac2a0ba2385a9
	.xword	0x37de2c3f5a44d9b9
	.xword	0x293aae857b1a5861
	.xword	0x0aa3ed8c2ab17e46
	.xword	0xc917fdc10c1add99
	.xword	0xe80e9f3ee8a659e6
	.xword	0xeb00ba2f22bf4b1b
	.xword	0xf592d31cc701246c
	.xword	0x34609a68aed040be
	.xword	0x507e1501174c0c54
	.xword	0xac09b11506a3346d
	.xword	0xb35327afafa1eb85
	.xword	0xb82d5b4a442d2aec
	.xword	0xf9d0e41f041f717f
	.xword	0x05feb24161464b9c
	.xword	0x6f3614f6c8fd1f2c
	.xword	0x51e70b6cd72093d9
	.xword	0x0405a1004fe43e73
	.xword	0xb3ba90eb6bbe362d
	.xword	0x868b254fdfb30f1f
	.xword	0xabc9e2f0a8f3af7c
	.xword	0x5a2f1e1802eba293
	.xword	0xba16b252b311127b
	.xword	0x3af4aa9918b2b5e9
	.xword	0xec760efc4b3dca31
	.xword	0x5248934ee275075b
	.xword	0xd21fedaa50a9cd1d
	.xword	0x6addca4fc32898f0
	.xword	0xcd29c7c5d5c02887
	.xword	0x3b9d7172475ddccd
	.xword	0xdbd6141600e2aa2b
	.xword	0xee9014e7653364eb
	.xword	0x93e400fc0990cbaa
	.xword	0x966498a29d9ee3de
	.xword	0xe6ec632c55aaf454
	.xword	0x90c701cd87447aea
	.xword	0x50a8d4f78acf972c
	.xword	0xf1fb23fdaccb1db3
	.xword	0xab4df847def56113
	.xword	0xb4c034a92ec9f0e6
	.xword	0x62ea6ddebc2110aa
	.xword	0x5d617fa7a6fa690e
	.xword	0x7d8af44c76572210
	.xword	0xb7fea0a7c7a429da
	.xword	0xfc90a10690addf25
	.xword	0x710f2791cafb03ac
	.xword	0xc2c9557ce99450ba
	.xword	0x1de0facc401598f2
	.xword	0x4d8920d8ada43a7d
	.xword	0xb6f613844e588e86
	.xword	0x7415942b94d66322
	.xword	0xc1657e47cf0d76b7
	.xword	0x753c97b8766f9117
	.xword	0x2e25ffbe1c1a2398
	.xword	0x3c447349551adadc
	.xword	0x59554d5cf5ce58e1
	.xword	0xda39d37f71581faa
	.xword	0xa8f96077c4bce710
	.xword	0x779c1c8a6e1a4ee3
	.xword	0x3ff85d12f3306c68
	.xword	0xb2974c75b456676e
	.xword	0xf7c4fe2de18417c5
	.xword	0x8be604eee86dfc9e
	.xword	0xf2116fd44b098262
	.xword	0x8f6c590bab08b5a6
	.xword	0xb976551afb6b8cdd
	.xword	0x3dc59f57002cb30d
	.xword	0x833f6f1aff277490
	.xword	0xda5a7f21b2ebc303
	.xword	0x801f1f7b457491a8
	.xword	0x95c7c0164e6427e3
	.xword	0xe1bbb4191e18b41d
	.xword	0xb454d1e1b35635d1
	.xword	0x120bd4c6de3708c5
	.xword	0x19a3026d6fb49ad8
	.xword	0xcfc38fa1607e8be8
	.xword	0x23e1bdb65803e1aa
	.xword	0x489c35b390f54466
	.xword	0xa6e43c26aacd2b4d
	.xword	0x117328ed8ea388f7
	.xword	0xc6d454c888798e27
	.xword	0xe6691f95eb72cfbd
	.xword	0x12d5e01a8c7452c9
	.xword	0x1fc2114906d1c35f
	.xword	0x54d2917ba98b4b6b
	.xword	0x332e411fca5c0e71
	.xword	0xa3f90facd841c7da
	.xword	0xe15bcf35327275e3
	.xword	0x794cfc482ddf2ab1



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
	.xword	0xdbc326d64530b3ba
	.xword	0x9ec6d7be4e48e612
	.xword	0xd19f63babb0a11a7
	.xword	0x7d9a2d31d7987cfc
	.xword	0x596649046ccd8095
	.xword	0xca53fdf49254a9d0
	.xword	0xeeb16178de7d320a
	.xword	0x46861054b8d65d6d
	.xword	0xb517c020ce6be7f5
	.xword	0xe750a9408286f007
	.xword	0xecf74b83515097a6
	.xword	0xbe31dd591f4dedfb
	.xword	0x1150b889d57615aa
	.xword	0xde3f3ce51652d18d
	.xword	0x55a8bb44a28af430
	.xword	0x5a629b965f891c45
	.xword	0x35f21afe83ea11a2
	.xword	0x98a046ff155e653f
	.xword	0x77b4bc4ce7f93947
	.xword	0xb5b51b561b6b7457
	.xword	0xfb7a9d105a95d005
	.xword	0x883f5b459fec9e77
	.xword	0xa48beac7c0bbdd03
	.xword	0x8ac62f82d8889c8b
	.xword	0xe3686d69ecef93e0
	.xword	0xac8598651c029396
	.xword	0x4600e614c3637269
	.xword	0x870c4b14fa97073c
	.xword	0x2dcc0f2c37cf3edc
	.xword	0xefbfa61408573461
	.xword	0x291b8a64759bbd6b
	.xword	0x46004d839d4cf2c6
	.xword	0x44f1033fd5a2ec5d
	.xword	0xd9b4a749b9b2a6da
	.xword	0x9ab533486738a365
	.xword	0xeaaaf7408f7c954f
	.xword	0xdb26e3225c07dfca
	.xword	0xc8829056c1844d34
	.xword	0xf27564355d30096d
	.xword	0xee7528ea3b9cbca7
	.xword	0x4ccc0d4ff8ad9e93
	.xword	0xee64e5697b1b583b
	.xword	0x86e449687cda67bd
	.xword	0x3817aaa6f599556d
	.xword	0x68ef15fcce1492f8
	.xword	0xac35fc4fe317d9a1
	.xword	0x86011777ec8da794
	.xword	0xd242691fc9f4590f
	.xword	0x0b5b1544f015fefb
	.xword	0x0c23b8883d96ad97
	.xword	0x715508e59839ca3b
	.xword	0x71aaf90fc5d3a714
	.xword	0x8a3096eaefd95c64
	.xword	0x59800523ff82629a
	.xword	0xd6e744dbdc32353c
	.xword	0xcdb64bc33f374f81
	.xword	0x8e50b0c1df15a1d0
	.xword	0x6dce72edd69c81fb
	.xword	0xd9c1496d163c7dc2
	.xword	0x42e08fe57817ce88
	.xword	0xb453bf70838a749c
	.xword	0x98cbd886cf3cb340
	.xword	0x51b4627549277905
	.xword	0x6fa8ced522cb724a
	.xword	0xe217b7d80eb6669b
	.xword	0x20d7664f91e8c04e
	.xword	0x55546c9ab3728804
	.xword	0xfd32ee10873014b3
	.xword	0x9e30f2c49bd93571
	.xword	0x92a938931f085c61
	.xword	0xda04c3718fcd2b18
	.xword	0xef31473871ba4ae7
	.xword	0x6d3dcc519a449f3e
	.xword	0x36484d98a352f5f0
	.xword	0xb4bac37f310aeabd
	.xword	0x381be96df1536e51
	.xword	0x56cece79607733e6
	.xword	0xbeb47f70e6a7f83b
	.xword	0x567ce2ab21b518e0
	.xword	0x597cb57533981358
	.xword	0xe8c4d7b2eca0d070
	.xword	0xaad66462cf05d9f0
	.xword	0x6a1ca011c3459d51
	.xword	0x142a3890d48c2324
	.xword	0x4b5323fa1f517200
	.xword	0x88d676866835a36a
	.xword	0x239fc532059c1085
	.xword	0x3e72b73276f74a0a
	.xword	0xcf3f7e59034f69e8
	.xword	0xf54aa8e892e8db7d
	.xword	0xc0a311cf29a614be
	.xword	0xfd93c8cd42cfeb2a
	.xword	0xed4eeb39048f81dd
	.xword	0x3fa24a30a969707a
	.xword	0x88b57a18fd8278c1
	.xword	0x4ca0e342bda2c68e
	.xword	0xe63a6ac33ac82fcf
	.xword	0x56bc9808fcc8bde8
	.xword	0xee6a5c5191d5bc63
	.xword	0x25a5f9d32a3b2eca
	.xword	0x70acd7e21c43ce39
	.xword	0xf6b7be66f13a1f09
	.xword	0x79bc008178d7e3b4
	.xword	0x5d03eea262bfb200
	.xword	0xbf45681063b6c1e5
	.xword	0x309df3cc2d4a0190
	.xword	0xb30e0f3095ba6570
	.xword	0x6142a3f44b5c7707
	.xword	0xb7a8ba9a98c507b2
	.xword	0xcb97ff401559c427
	.xword	0xe3c777208b2cacdc
	.xword	0x3f3bc737216c446b
	.xword	0x1f8e58afce35bb3d
	.xword	0x9ad4b792658b8745
	.xword	0x4fc3b07760fe0eeb
	.xword	0x059bbce097244081
	.xword	0xf32c71b50c1a40ef
	.xword	0x4b925d03e117f7b5
	.xword	0xda8c3e209c9590d9
	.xword	0x8545a9b6228705eb
	.xword	0x35215ce289e74efa
	.xword	0x79ddeb8cb0138a32
	.xword	0x749e206b52c52900
	.xword	0x429ae0023de454be
	.xword	0xaf90b425ef50b79e
	.xword	0x118165c343b88644
	.xword	0xab8ce1a00759fac8
	.xword	0x1d7b392caf5c5cc5
	.xword	0xc39909daa760ee26
	.xword	0x906aaf2b842340eb
	.xword	0x1cf952932f47fefc
	.xword	0x5ebdec036666bd34
	.xword	0xf34e64b1c0b44db9
	.xword	0xfec8e65b9b227b5b
	.xword	0x71db88afac50261a
	.xword	0x54e12e9549b91ff3
	.xword	0x1015aae4cb5c249b
	.xword	0x07d7ce2a709f2de5
	.xword	0x0e4165356f1ddf8f
	.xword	0x9106cd5110d9f5ff
	.xword	0x31814d901c166020
	.xword	0xa61f19b27324f936
	.xword	0x70bc5488f310f069
	.xword	0x99cd8e2b62652a25
	.xword	0x9308999318ef84bf
	.xword	0x64c375a00a8c1993
	.xword	0x46cf240a04eda8a3
	.xword	0x620100e027932cb2
	.xword	0x0681c533418b9f77
	.xword	0x978b858ad99e6a43
	.xword	0x535dea711f80f5f8
	.xword	0x766d82d6d23a28c6
	.xword	0xee91fe97fcbd08dc
	.xword	0x634d5c24f386f291
	.xword	0x69f0eee19e409bb8
	.xword	0x9a0020f29246e839
	.xword	0x9fa14ab033950e05
	.xword	0x80fd193b5aaa2f0c
	.xword	0x58f4f29874091be9
	.xword	0xe2fb5c4425c61453
	.xword	0x2ad4cd451472d2cd
	.xword	0x23d780a8b25109b7
	.xword	0xc06a9a7e6badfef2
	.xword	0xbf03cf8b460a785c
	.xword	0x26b7cddd5f7208e4
	.xword	0x0d5de338778888b8
	.xword	0xdee365edfee5fcd2
	.xword	0xca4210961c0b4855
	.xword	0x41f2dc05bf95243a
	.xword	0xf1c4d6998c70a630
	.xword	0xba1db343a9fa3b99
	.xword	0xc7538851f300c91e
	.xword	0xe2866eea977b61c4
	.xword	0xd80bcfda7193a527
	.xword	0x27a84a98ec9a214a
	.xword	0x5c8a7d020f85d8a3
	.xword	0xc2220193b664ff7f
	.xword	0xfb23f6233ad3ca48
	.xword	0x112d6447cb76c76c
	.xword	0x86317fa057741e81
	.xword	0x3f9cf64cef76f070
	.xword	0x99198c6a3d8d285b
	.xword	0x187d1b92fc01e33a
	.xword	0xf6683c896a363a1c
	.xword	0x25dc9d0fccbca91a
	.xword	0x700807b8eaab9512
	.xword	0x0a111c9d9b7caba6
	.xword	0xb724e13ef7bb9c12
	.xword	0xbe744847f3320176
	.xword	0xba2d3b62e64c06ed
	.xword	0xae8878d988e19754
	.xword	0x7dcbf63d6fceeb13
	.xword	0xccffb57ec53fb451
	.xword	0xd4a33e60c9e07e0e
	.xword	0x33da9580affe3db0
	.xword	0x90f7ec07d1a2467b
	.xword	0x7e0446daa93833bb
	.xword	0xa9a1cb2ef512cd07
	.xword	0xe97cc26a56e0130b
	.xword	0xf964d160b1a76d1e
	.xword	0x88cc5f9a46342f64
	.xword	0x946a61a907568647
	.xword	0xcf646a0e5a3ec7fc
	.xword	0xcbf18a147fee0c4f
	.xword	0xcff8a85bf2ad4890
	.xword	0x5043ac87a7257173
	.xword	0x3a230502242c064f
	.xword	0x4a3595c447d88730
	.xword	0x4473e12d39039cb8
	.xword	0x922e0a351c289ace
	.xword	0x13cc47eb6f8bad6f
	.xword	0xc215c5faddb2438d
	.xword	0xf84d60baaa440bed
	.xword	0x5c9aaee9178e0bfb
	.xword	0xd6361ccd7769e8c7
	.xword	0xa731699ce1d3f13a
	.xword	0xedae622d9442fece
	.xword	0x7c01f47884c5724b
	.xword	0xe1f6f4575a8ee009
	.xword	0x8c299e4671597f94
	.xword	0xd15cf8732ff43f3b
	.xword	0x919b41483c01d3e4
	.xword	0x1a1c0c01986c2737
	.xword	0x96c2502712b78d42
	.xword	0x3046f1151f7a4578
	.xword	0xbc17c954e2d5629e
	.xword	0x38bba4a929641624
	.xword	0xe5f72f06547d58b4
	.xword	0x05250a1d1bd3c620
	.xword	0xc4848a276d67d2fe
	.xword	0xec674a34aba00aa0
	.xword	0xf574db85b86e8f98
	.xword	0xbe2da4991a5d0c77
	.xword	0xdcdb303c3ccdb1b7
	.xword	0x06233b60d97b0105
	.xword	0xa3e83493b62129c1
	.xword	0x11d9a10b132b6179
	.xword	0x15131e3308245b8c
	.xword	0x3d00e736bf476ddf
	.xword	0x7fd08e114b324316
	.xword	0xcfce5308466833c7
	.xword	0xf31e740a5f865447
	.xword	0x2e83adf229562637
	.xword	0xfe6b330661268347
	.xword	0x4998cd8ccf44b5cb
	.xword	0x2c091106d25a148f
	.xword	0xf5fe74bb0ba00048
	.xword	0xadfc63fd780b1a09
	.xword	0x737d6e46f682b4e9
	.xword	0xa11e5187a64eb6ec
	.xword	0xfdb852debaa4e305
	.xword	0xefe34e1371599d93
	.xword	0x543041fba4437f14
	.xword	0xbf8017e2edad073b
	.xword	0xc8118a6e292d92ee
	.xword	0x8e5a85276db9db27



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
	.xword	0xb0ea23a40df7050e
	.xword	0x13bfe1ba4ef46543
	.xword	0xdac6c203713fb685
	.xword	0xd79f6d64f67a4972
	.xword	0xe70fea3a5fe4901a
	.xword	0xbc671e97d79fdc60
	.xword	0x75ded78f298b125c
	.xword	0xf7e76b43eccaed5d
	.xword	0x32e5cd41e89997e5
	.xword	0x2e5c7242338502b7
	.xword	0x397ebd306c7f9d00
	.xword	0x462c2b78cd6b2d67
	.xword	0x262b910887f762a9
	.xword	0x84dff4a7eeb8f49f
	.xword	0x490e1edee95b49b8
	.xword	0x56abbdbfce95efb5
	.xword	0xeae52c7ebacc4883
	.xword	0x92e31444cd7ba8aa
	.xword	0x23d2f8d06d447fd7
	.xword	0x5623381d2483f05d
	.xword	0x5667eed895d5afde
	.xword	0xabae26fa2c428687
	.xword	0xbbe35e2a381425ea
	.xword	0x597221f43c98fe96
	.xword	0xcc92302c8d2185a0
	.xword	0x03dfbfcf1e07acc3
	.xword	0x3ad209531af33753
	.xword	0xbaac820869006ca1
	.xword	0xdf149b6f3dab23bf
	.xword	0xecf0dd22f204e7c8
	.xword	0xf9bf73fc3938a7f3
	.xword	0xeac1c30ca0971aeb
	.xword	0xf45bf5cf973977b2
	.xword	0x158a3c9019a46252
	.xword	0xff5c41dc241dcfb9
	.xword	0x1094a53e405abdef
	.xword	0x72c6a73bdfe98172
	.xword	0xeb5a1f809da960e6
	.xword	0xb9d13672361892f6
	.xword	0xac6ff974fce0f424
	.xword	0x045c51fa665e3974
	.xword	0xb95f48f917e01d8b
	.xword	0x1b8ca89bc85fc41d
	.xword	0x035b958f8909d8cf
	.xword	0xe2ffd9caddb8ce5e
	.xword	0x464f273594c95341
	.xword	0xe3f534ecb8a44e52
	.xword	0xf37e16ac90988a8b
	.xword	0x079fc69faf906d9b
	.xword	0xdb3d1be7379fd46b
	.xword	0xecb5309df15d66d5
	.xword	0x6d36b2cb6f0160a6
	.xword	0x036982db87bd4f41
	.xword	0xdacccc30a3315d68
	.xword	0xd7ef297d190bb8e6
	.xword	0xc1fdc6ec131a7bc1
	.xword	0xd996bb723a146102
	.xword	0x26e206de54d2ba0a
	.xword	0xfdd4d88cf7ab531f
	.xword	0x11ec5cee16fdc5d7
	.xword	0xcc750265fea3fc4e
	.xword	0xe6b6803397e2352b
	.xword	0x095b85a67fc38068
	.xword	0xf529e9be53216fdf
	.xword	0x8bf14a3df035cfeb
	.xword	0xe0768a59da62c913
	.xword	0xf89b975e3ae789cb
	.xword	0xcd177185018bd613
	.xword	0x0a3f01e9745f76b3
	.xword	0xe40410c6026d8ca7
	.xword	0xebca79b3cd2fe367
	.xword	0x1114f0cdfdaaefee
	.xword	0xae57f0f15dc677f9
	.xword	0x1de69352e8863a39
	.xword	0x0fc6278488c4a170
	.xword	0x04341e3f9cb302f7
	.xword	0x13b9cc489ec91173
	.xword	0xbbea8068e9b0b5f4
	.xword	0xd33c78b42293164e
	.xword	0x13c1ce8bd39539d7
	.xword	0x02df99426865f83f
	.xword	0xd3c757a7531c38c5
	.xword	0x27ca222b540a3b0d
	.xword	0x84a07d84f6423632
	.xword	0x014ec641c24a32fa
	.xword	0x6151298a7a90a2dc
	.xword	0x0b3356bd02e29fd3
	.xword	0xc74c9663a1c5dd89
	.xword	0x02fc4b1e280ef94e
	.xword	0xc5310b4d23d1d2ce
	.xword	0x515268eb14fb77e2
	.xword	0x55a7dd036b308cd4
	.xword	0x0bdb5f190b9038bd
	.xword	0xdcd1a03495673cb5
	.xword	0xbaf826abfe6ae147
	.xword	0x46cb53e8a84f97a6
	.xword	0x2010aa3ac5365340
	.xword	0xf7ef73214c33728f
	.xword	0x69676a36f1169a20
	.xword	0x396a4db134364d3e
	.xword	0x1ea0186acc701e06
	.xword	0x50ce650575c53ddb
	.xword	0xf32e2b6417c54429
	.xword	0x840f3b840c93ece9
	.xword	0x5a0e2ad5b893f220
	.xword	0x172e1c58e451f85d
	.xword	0xfc4b3e4d286bdce4
	.xword	0x730b69759a2134b3
	.xword	0x3ddd3915dbf95ca9
	.xword	0x03657d4e64a3c63e
	.xword	0x8f900118a0d643f0
	.xword	0x4c73a201288b1b73
	.xword	0x6fee4c60bba9f82b
	.xword	0x492f8a1face53de5
	.xword	0xdc6e720bc7843731
	.xword	0x9d088fbc4aad72e1
	.xword	0x78977b0b93876502
	.xword	0x287a198b2c922025
	.xword	0x23c7d67535260241
	.xword	0x43a9f0aa701c4e3e
	.xword	0x0089d8c04854b8bd
	.xword	0xc21bfeec89bf75f3
	.xword	0x88b4061f9c2eb755
	.xword	0x15995bedaca9f1ef
	.xword	0x4041ef875a399223
	.xword	0xc4da9816ee0f9461
	.xword	0x750766637c0ccb20
	.xword	0x43806c72c83ae012
	.xword	0x812287eb0c1b1c13
	.xword	0xfb3b525e630d7b28
	.xword	0x4be10abe9e7de3be
	.xword	0x1d5620f3bb64f035
	.xword	0xcfaf26fea4403804
	.xword	0x8385693199dd9adb
	.xword	0x3a4418350432a953
	.xword	0xe7852b98a283e152
	.xword	0x3fc1c3ea4755a784
	.xword	0x0bf0fe545fcaf958
	.xword	0x18623902b046d38a
	.xword	0x047eba78517f97ab
	.xword	0x9ded01bbc5384c3c
	.xword	0x9c8ff2e7578cebff
	.xword	0x5e50b330612c943a
	.xword	0xc505abfc54f23b56
	.xword	0x50418612553b2244
	.xword	0xfb2744da83be79ba
	.xword	0x5d8a09a3075b49b2
	.xword	0x27afafd83da00a37
	.xword	0xac1b6221535d5b15
	.xword	0x2cdefc1a1044f408
	.xword	0xe7d2b771a69c8145
	.xword	0x35f13955c772b28f
	.xword	0x29c13621729bf236
	.xword	0x1adb7696a1996c7a
	.xword	0x75638e6648c98a0c
	.xword	0xe0c3499fba8d6635
	.xword	0xaa463a6b86d23618
	.xword	0x67f789cca8cad74b
	.xword	0xe3a6058404419fcb
	.xword	0x7eec5b0956f5e948
	.xword	0x5a728990c4b2a5cd
	.xword	0xd702c91a74536411
	.xword	0x1524d230cd3637ba
	.xword	0xeb903055ddadc7ac
	.xword	0x7d623b351682b184
	.xword	0x091d48c798fd9c7e
	.xword	0xdd0b49d296ca499c
	.xword	0x26ab50e0875c5fb6
	.xword	0xa3b174fa44e0a725
	.xword	0x5265d72c46f12c90
	.xword	0xb3a4b541fa7b699f
	.xword	0xa8c2b160aec8fd33
	.xword	0x8b3b652f773feba7
	.xword	0x3bfd0e119bd1aed7
	.xword	0x159aa71575a4fca3
	.xword	0x518f177de6af6b88
	.xword	0x43ffd0d8f6ab4210
	.xword	0x83d6912984542841
	.xword	0xa55710bd913be6b3
	.xword	0x0d4ab866fa0de8e9
	.xword	0x448636fc3cdf5ffc
	.xword	0xe67b7377ee397071
	.xword	0x335d5f3705dbfd5f
	.xword	0x917306c65702bf48
	.xword	0x0778f4e950d45244
	.xword	0xf4d48fa45b2b3a9d
	.xword	0xc8f09da7ea31d5e3
	.xword	0xa6bf05314cb834d1
	.xword	0x6f240a9b5782cd56
	.xword	0x5527311fe34e5d66
	.xword	0x6ce5e0754b8607ed
	.xword	0xa92dab9654c8b27f
	.xword	0xd2b795464cba245e
	.xword	0xffb577ec3b1e8a3c
	.xword	0x456b392d9e146ceb
	.xword	0x51c554c027391b6b
	.xword	0x16756e20f0f3a8d7
	.xword	0x268435d316613daf
	.xword	0x395e5d43bb238ae4
	.xword	0x63d9d39ec529865b
	.xword	0x5b5aa482e293cb3c
	.xword	0x93e143ca52ce7a5c
	.xword	0x0786310ce1d7e47b
	.xword	0xbf121a6f9d39035b
	.xword	0x84aa168cae5fa87b
	.xword	0x5c4e7549fabf4070
	.xword	0xf622ac9f80162c30
	.xword	0x496267847b7e2854
	.xword	0xc716cd24182c2660
	.xword	0xaf374a548d5c3a4b
	.xword	0x834a7785c30184d8
	.xword	0x57da1caddb7951dc
	.xword	0xd87a1976c8d6f8aa
	.xword	0x8290096cf886013c
	.xword	0xb9ef4d8bae50ea71
	.xword	0xe836abe893c400ed
	.xword	0x20216e6d2d71ddcd
	.xword	0xf2b8ef86d6a8835a
	.xword	0x5242421417c4db3e
	.xword	0x6de660c9b394c94c
	.xword	0x7ca0389ddb7fa022
	.xword	0x88016d075e6211c4
	.xword	0x1004e4deaf6fee24
	.xword	0xe54f3992c5eea89d
	.xword	0x9f1a36b4b91e2e47
	.xword	0xf34ab7e4682a9942
	.xword	0xd0cdc5cba6de04d3
	.xword	0xcd44da307be50c9c
	.xword	0x95fc94a703981a61
	.xword	0x391a29193e905155
	.xword	0xaf5751f1020435a4
	.xword	0x9dbc42f709ffcd0c
	.xword	0x1c937337a59d7403
	.xword	0xfaa480efa53c3f0d
	.xword	0x9d0f91588620270f
	.xword	0xc8b2ef8c3acc5ee9
	.xword	0x8ef848e5a25fb320
	.xword	0x4620f5591ae5bb20
	.xword	0xf9b72a24b59777e1
	.xword	0x18b601256e4a515c
	.xword	0x447884de151561f3
	.xword	0x444ad46774949c08
	.xword	0xc9f1ecc81b613b80
	.xword	0x9553128d6d1f72a5
	.xword	0x919906a031225193
	.xword	0x616558e46a28e740
	.xword	0x2a75020af4ea85ff
	.xword	0x36d605fcfcdd3b0e
	.xword	0x16fb1c27dfe935d5
	.xword	0xc161b15caa09c8c7
	.xword	0x1c30aff36fe580c4
	.xword	0x54bd6b607b683ce5
	.xword	0x9e225b913dec9124
	.xword	0x082461472e1f611a
	.xword	0x9e9409f1ff0ba29a
	.xword	0x147be717529fb16a



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
	.xword	0x180a8ddd036fb6b8
	.xword	0x519474f4c53b4c73
	.xword	0xed71bb190cb826db
	.xword	0xd07d4c358c68e94f
	.xword	0x3648029ff2c2d222
	.xword	0x5dd64ff594c858fe
	.xword	0x69683666ceeb9f89
	.xword	0xf31943554aaa012c
	.xword	0xf938f3c7364790a1
	.xword	0x5a4da12e0635ccbf
	.xword	0xfde56c11625fcd0b
	.xword	0x303aba4b3421edfe
	.xword	0x9fd555bbf538545f
	.xword	0x478b1bd57d104264
	.xword	0xd47ea803ce40c33c
	.xword	0x478f73319d72ac0d
	.xword	0x560f6c965b0e0e45
	.xword	0xb7db452ea58dde1b
	.xword	0xe65c00c45aa9230d
	.xword	0x9f5802d92e76a9c1
	.xword	0x38b99997d6259265
	.xword	0x603e3faaa2eaa7e4
	.xword	0x949b285da01eeee2
	.xword	0x6ea71af04761e621
	.xword	0x5cb66d9505121c35
	.xword	0x9a6d61b1deaeb712
	.xword	0xcf53f2b510347f2e
	.xword	0x8a0f2cd6c319d099
	.xword	0x98ed0c689ec089b1
	.xword	0x8f307312799966d8
	.xword	0x0580e6da01cd2c9b
	.xword	0xaf8ad619ff0ff078
	.xword	0x57943e8c28a5d2ac
	.xword	0x462876707882c8ce
	.xword	0x83e873f2d86ff930
	.xword	0xa6f50da1e9f5a796
	.xword	0xe503dab017069b0e
	.xword	0x410d3b1568ee7cc4
	.xword	0xb4ef57b64e1d50ca
	.xword	0x9656ee89d422c98c
	.xword	0x2a92648cdbc49eab
	.xword	0x769774135e13c1c6
	.xword	0x9b3d36b7797e5208
	.xword	0xaeb10696f227e8e1
	.xword	0x9f24d2c2c6e13642
	.xword	0xe035726dfacbb92c
	.xword	0x968d489cdf812ecf
	.xword	0x1bfd112484487d7a
	.xword	0xbfb085f03c47fd14
	.xword	0xbe6a6ef2a03cabf6
	.xword	0x0720c7c3b84bfa00
	.xword	0x2c9b54e4f86445d0
	.xword	0x21eb11261bc5203e
	.xword	0x39f2a005b838d5b0
	.xword	0x4453d76181cfb20d
	.xword	0x9cf36dd452772c57
	.xword	0x625b747c1987633d
	.xword	0xda0335f8f8d47239
	.xword	0xd5fccac20495db41
	.xword	0x30593ce8d6708f81
	.xword	0x49bcabd88272e1df
	.xword	0x5a0ec3f4ae5d72b2
	.xword	0x26f7949a93e61989
	.xword	0xd7850928f5756d5d
	.xword	0x74583b0955401f69
	.xword	0x8eba4601deacaf5b
	.xword	0x42a85726f87f5f87
	.xword	0x4535304bb5521a20
	.xword	0x973114f5144ffcbf
	.xword	0x1ed2af54d02b543d
	.xword	0xc67a6e66a7d543f5
	.xword	0x750fede4727fdbba
	.xword	0xb3a0ed627123aadf
	.xword	0xad5699412b19362c
	.xword	0x2b0de692b5bc53be
	.xword	0xe143072cf064c15f
	.xword	0x37ab9abfe1b434e7
	.xword	0x1c655d2249664754
	.xword	0xdc40dabbcb4f126a
	.xword	0x79d93cf08ee1be8d
	.xword	0x20779c7c6f28d7e7
	.xword	0x3803c36b7b3d4e3d
	.xword	0x48c81e4b7989dda0
	.xword	0x6117d8133f3e123b
	.xword	0xf175e08fe0417179
	.xword	0x0db108c458403943
	.xword	0x4d0666b4a0f2753b
	.xword	0x971692cf3968a099
	.xword	0xd42487e4842981e8
	.xword	0x54185c9026553e92
	.xword	0x9119f95963a66bb7
	.xword	0x267eaed3f1b2fb8a
	.xword	0x64640cb8de2fde2a
	.xword	0x4bacfebdf8ac3ba7
	.xword	0xb6b8fba266863721
	.xword	0x280c41ab338aa5a7
	.xword	0x41696725905a625c
	.xword	0xb331695440aa8127
	.xword	0x88a0302eb0bafed3
	.xword	0x5262eb11f85d5151
	.xword	0xb0cd197414ae51da
	.xword	0x817f4fb3e34a7f37
	.xword	0x72d76681b20ccf8f
	.xword	0x541e718384a78a10
	.xword	0x6ac45700bd28a54a
	.xword	0x48a8a5f2dc65ca1a
	.xword	0x55605d9bf1a0f49e
	.xword	0x5ecf52f1cd5d68ea
	.xword	0x136d5a414a17f297
	.xword	0xe5d11f75feb082ae
	.xword	0x06e5e9b4b4a73d8f
	.xword	0xa522732fb22c99cf
	.xword	0xd40d7a673c5ee331
	.xword	0xe154bb8c408d6ca7
	.xword	0x4867b08d72fe238c
	.xword	0x1e7c7240c204b055
	.xword	0xb2963a852ac05403
	.xword	0x8edeab4d79c14b53
	.xword	0x63072d71bd05cc46
	.xword	0x0939a94bedabb964
	.xword	0xef6fe6aff045c45a
	.xword	0x570edb84be9d021f
	.xword	0x52bf37022188e8c7
	.xword	0x8239e5c122daba36
	.xword	0x856fab0a1d005955
	.xword	0x017833b33a5f2609
	.xword	0x925aebba63e37552
	.xword	0x33db8a093c10d847
	.xword	0xe0311e003fa20867
	.xword	0x2d97d855aa289356
	.xword	0xcc14b662451bd0cf
	.xword	0xe92654c7d6f27a45
	.xword	0xf3fd27378914b1c0
	.xword	0x12ec826c581d0ca8
	.xword	0xaeb201bd5300f6ca
	.xword	0xf8a3c7cff56da495
	.xword	0xb760f7e6475efc47
	.xword	0xcb3a36b4e07d7c0f
	.xword	0x25db9180c832cbf0
	.xword	0x6f0d879488104625
	.xword	0x0e7edba4fdd60ce7
	.xword	0xe5d56deaab3e8deb
	.xword	0xa927acc7994cf12f
	.xword	0x87e0f2ceeb6771d3
	.xword	0x32b8f06ea4e5a458
	.xword	0x65354c3816fe3e92
	.xword	0x342fd336105fb8dd
	.xword	0x5a30bf9b2bb91e89
	.xword	0xd432aafe0b0e0a12
	.xword	0xe63097986215c13f
	.xword	0xf7c1772e84bd58e0
	.xword	0x2083b766ae9bf2b1
	.xword	0xe0431a045a7903c5
	.xword	0xeb7f8513b9cc14ec
	.xword	0xbeabee4b9425bf0d
	.xword	0x9eb2628004c85aeb
	.xword	0x268ec173c67eb708
	.xword	0x76124de43c2aa4aa
	.xword	0xf8531eeb6d0b892b
	.xword	0xc200ff0dad50b964
	.xword	0xdc0c12a2013c08c4
	.xword	0x000b6f4d851066bb
	.xword	0xae139f496c22c5e4
	.xword	0xb44a3a9e61ef9dcf
	.xword	0xb8026d85a421eb92
	.xword	0xe8d7a6c6b5226446
	.xword	0x391c4e274d9b593e
	.xword	0xcabca5108c0b60f6
	.xword	0x32a486ac484a87f0
	.xword	0x15432cc696a26514
	.xword	0x45c6ac6daea7837c
	.xword	0x1737dd9cb500e680
	.xword	0x5154b5f25b6e9795
	.xword	0x6dec0d16b8342108
	.xword	0x8baa5cc2c857de51
	.xword	0x07652edd83757ab7
	.xword	0xa0d6e859f3d1744f
	.xword	0xfd9a29d0e50cd796
	.xword	0x9151a89d1c74e392
	.xword	0x2b4792c749e8e0a9
	.xword	0x4d4ca521d0392d55
	.xword	0xdd2afcd81064fbe4
	.xword	0x9d58e3ba14e3c3d6
	.xword	0xd85cb91e7967add2
	.xword	0x78a72e13cd75d023
	.xword	0x9e5734f4143691ff
	.xword	0xa62a2db0cd910495
	.xword	0x17365a90d71103d8
	.xword	0x1381d3703b7cfb06
	.xword	0x5538b0d5297ca543
	.xword	0x1e405223c83c587b
	.xword	0x6a3230702c4eddad
	.xword	0xd619c2ecb6825ba0
	.xword	0xcfa38815cc43c3fb
	.xword	0x459ffdcc4df401a8
	.xword	0x4be0f9de3403b5c4
	.xword	0x7961fdf9a322341a
	.xword	0xeede7757fdfa8799
	.xword	0xe1dca8b622f3c2d8
	.xword	0x28a60db91613ab62
	.xword	0x447a1a9592ba4565
	.xword	0xd9f410e83ce364d3
	.xword	0xe7d7f82cad94bc18
	.xword	0x4b4a5a96f51623c7
	.xword	0xa8f22890a9834efd
	.xword	0x6dfaaa0c0c10005c
	.xword	0x293f95667ef4f2d4
	.xword	0x356edb30cc2fdbf8
	.xword	0x11ac08a5eccf9fc9
	.xword	0x570798c8c72daa6b
	.xword	0xb5165973898e4f5d
	.xword	0x1ac72712dc701190
	.xword	0x2b70dd713381a9fc
	.xword	0xbfd6359789c108c5
	.xword	0x56b2e6b7fb624510
	.xword	0x24ff6d848c22770e
	.xword	0xa51817a4b67653e2
	.xword	0xdf6b5df4e281f61e
	.xword	0xedb3232e07e6f1b2
	.xword	0xe938fa6d8a629ddc
	.xword	0xb3bac377add7a5dd
	.xword	0x0a969b2a2bf72152
	.xword	0x87f76f542a41dd87
	.xword	0x8b40188055c88a87
	.xword	0xe65da9151e142cf8
	.xword	0xf108353d07453dca
	.xword	0x35878009fcd26ee8
	.xword	0x687062d7ad2d56c9
	.xword	0xacb34c99ad64db8d
	.xword	0x291cdc358a85f212
	.xword	0x9bc0d3ed96604a48
	.xword	0x08cdaa6e2459c4d9
	.xword	0xacc42765b4d9fba0
	.xword	0xd12b99425a6ae500
	.xword	0x22dce6b8bcd6a469
	.xword	0x1c1539f414dd2497
	.xword	0xbfecc049a8fe87e0
	.xword	0x535e8925a783c96f
	.xword	0xcbd8637647fbf8fb
	.xword	0x62eaa5991b85a717
	.xword	0x3de62215ca5c4a02
	.xword	0xf7d15be4bb306986
	.xword	0x0d0ea0b93186abba
	.xword	0x739888411b2e1331
	.xword	0x38dbb57a7c73e150
	.xword	0x42439130272014d1
	.xword	0xedd7d1b07da5b809
	.xword	0xad7929ad73de3dc4
	.xword	0xf40480e491e26118
	.xword	0x9503f9dbc148fa09
	.xword	0x2c45481297ac749f
	.xword	0x2e2a0d1b7137ff17
	.xword	0x78586fd07de36bb5
	.xword	0xb55959d84ffc8f2e
	.xword	0xb58bbb24493245cb
	.xword	0xa08231afc5b77bb6



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
	.xword	0x3355a8a8e8525d09
	.xword	0x7947f27a873e4617
	.xword	0x62a46bd997a954f5
	.xword	0x52ce848779adcddf
	.xword	0xa0ea60ba2510f35d
	.xword	0xfd5b29589fa1258f
	.xword	0xfe4512b30ed741e5
	.xword	0xa09a42beb7702ebe
	.xword	0xdbed5120fba8c823
	.xword	0x1169929d91073277
	.xword	0x2da27dfbba609b10
	.xword	0x2a93e87c6e5fea4c
	.xword	0x0bd49be04683b06a
	.xword	0xd9a558add8d9d1e7
	.xword	0xb0641606c7b9f68a
	.xword	0xa7563ce54ca63eb1
	.xword	0xe01a786f04b43a57
	.xword	0x3b55671a3e719792
	.xword	0xf2456262e77aece3
	.xword	0xac6cbe2d685d5331
	.xword	0xde6e7629f68e216f
	.xword	0x0659b07d6805a4e9
	.xword	0x98659b9b379c5914
	.xword	0xaec9e3a0f9a9991a
	.xword	0x1f35d3b674476e85
	.xword	0x55e566d29723b7f7
	.xword	0x11ac5bdff430f808
	.xword	0x25f3cb30cf57436a
	.xword	0xbf37f99582782112
	.xword	0xde0918e382e67d7f
	.xword	0x592febed24d32461
	.xword	0x2aa98105d5e10dfe
	.xword	0xedd03ce94e19d16e
	.xword	0xd107b8d0b36c71c4
	.xword	0x6b7cdce567cefbd7
	.xword	0x001fb417936ca352
	.xword	0x07d0400162466ed3
	.xword	0xcf04ecf90c5ab215
	.xword	0x58125f794295c745
	.xword	0x8af27c981137489b
	.xword	0xbf8d997a7a1f47c4
	.xword	0x2e865358139664a8
	.xword	0x6e916c6fa7210286
	.xword	0xb5e17a2eab086794
	.xword	0x5ecdf65211b5e10e
	.xword	0x95dd69af536345cd
	.xword	0x5bc6ef6fb7abe095
	.xword	0x2b81df7ae067e6d8
	.xword	0x3f4d80ad3b3fd28c
	.xword	0x69548801ca4ee0ec
	.xword	0x7a536e41e6f04bad
	.xword	0x5cb28daf7a28642a
	.xword	0x4fa47d6f0100c834
	.xword	0xbd413c5598c16e33
	.xword	0xc6c7c48a8bf41aea
	.xword	0x1c7f6fd656366c8d
	.xword	0xe2206ebb0df478e6
	.xword	0x2674269c69bb2a88
	.xword	0x6f27c585930a0534
	.xword	0x62ec4a3e7cf441d2
	.xword	0x42ac76556465fc41
	.xword	0xe56be3e58712583e
	.xword	0x612a185d93e05982
	.xword	0x5ce45e452a6e07ba
	.xword	0xc59a9e83733ad985
	.xword	0xed8054ce53de97b0
	.xword	0x5f962d5805598d33
	.xword	0x65092ff07f81a0d7
	.xword	0x83ac59260c2dd17e
	.xword	0x705d15f2ea301f9a
	.xword	0x0b5569171dd3314b
	.xword	0x4411b0ebb55dcb9d
	.xword	0x086b63e5123f1bd7
	.xword	0x6fbac415a17b1dee
	.xword	0xc8a0fd013d92b600
	.xword	0xf680969bb071e5fe
	.xword	0xa859eab0e5b20574
	.xword	0x25634fdae71f4780
	.xword	0xb5ce7bda9644d767
	.xword	0x8502fa76b40a0096
	.xword	0x777532ee64c79160
	.xword	0xff032131dd90fc4b
	.xword	0xde5a4d1f20f41bb5
	.xword	0xad1a3d582de34bc3
	.xword	0x69a4d484e338b2a0
	.xword	0x883b189aff12226f
	.xword	0x06278412e69147e7
	.xword	0x89f7244bd972d325
	.xword	0xb01bf13ac4c153fa
	.xword	0xcca93dbfd6b05050
	.xword	0xab85e05aaad24546
	.xword	0xb4ec605404b0d9c4
	.xword	0x189df1cca62a1cdf
	.xword	0x068b9bbcf7e5a610
	.xword	0xbba1ae4853ff5d0b
	.xword	0x3b65928cf5de780c
	.xword	0xe4ff8e66f57bbeae
	.xword	0x1bbf1d551da4468b
	.xword	0x96bea4d7167f4cde
	.xword	0x61f99e83e848ca05
	.xword	0x870ebdb5772bdc44
	.xword	0x0aff600d28c84e44
	.xword	0xe8f4d74a80e47a7d
	.xword	0xa7499b1d1da8f4f1
	.xword	0xdeda298dda826d55
	.xword	0x1bee63c959f5b4cd
	.xword	0xa0ff14677a9d507b
	.xword	0x497a3b9660c8c20b
	.xword	0x950ea574a3d6d330
	.xword	0x5c10540c0100c32e
	.xword	0xc868807c23958251
	.xword	0x723061bab7a956d8
	.xword	0x59848a870bf4227d
	.xword	0xac5dee2cc24e2145
	.xword	0xf9a54e9a0e03a42d
	.xword	0xe9e5d115c1f4afb0
	.xword	0xcd857b6cd2297c9e
	.xword	0x769257892a272493
	.xword	0xa2c8a322746a31a9
	.xword	0xd5bcb3f2bca35bbc
	.xword	0xdc289322fc263f7a
	.xword	0x82f64d1db9e6c2e3
	.xword	0x8617a4f921e40f59
	.xword	0x2592d0f824f8ca87
	.xword	0x3f29488e40ece6c5
	.xword	0x6db6eee73ca997f2
	.xword	0x52a09383c006307c
	.xword	0x199ff821c223b6d4
	.xword	0xa78d18e4d4ba2ff5
	.xword	0xba86c0bd83f74d99
	.xword	0x18ac965421aebf52
	.xword	0x2b929c009d11c69f
	.xword	0x37205c70d4a148fa
	.xword	0xa85fe1bf067f12a1
	.xword	0x10129a4a73f61f22
	.xword	0xa6966f41c7c785ff
	.xword	0x444f939ddc9e3dfa
	.xword	0x3d7a6decdee85297
	.xword	0xa4e0e288d8cfe10d
	.xword	0xa7398bfc22548aeb
	.xword	0xeabd57db1168c7af
	.xword	0x3a889a0d742d6064
	.xword	0x89f5d690bd3fb202
	.xword	0xa51961f897f80cd8
	.xword	0x96f7740cf9fc6960
	.xword	0x4406c0fb2f3f947c
	.xword	0x0fb670ec9bcb295e
	.xword	0x17678c54d72fb422
	.xword	0xc1a4702c2da712fa
	.xword	0x09254c8304057fc9
	.xword	0x375f472afdd74c2c
	.xword	0xd212a8edb6c8bbbe
	.xword	0x2f64ad7d39a1894d
	.xword	0xfd4645c90eb515c6
	.xword	0x10d93c77c38bd2cf
	.xword	0xf49b48cd6102809e
	.xword	0xf2a47190d719cad9
	.xword	0x2de54a3bc5bed1e8
	.xword	0xd8025ede5a603635
	.xword	0x7885f8a180216bac
	.xword	0x584c8719eb7f1bb8
	.xword	0x015b1df46408e318
	.xword	0x97841a54819084b8
	.xword	0xddb5264dba9aafed
	.xword	0xe861958143c9aa2a
	.xword	0x7f72d83a652c630b
	.xword	0x951785ac87e899bc
	.xword	0x8a8ea0f576fcadc5
	.xword	0xef4e4f1b386a1799
	.xword	0xb705391986a90376
	.xword	0x154a9598437d4ead
	.xword	0x2dae1e00cf4f2cb0
	.xword	0x810b12a7da9f7ad7
	.xword	0xb06b8654a3a52389
	.xword	0xfb9b0cbdcacf364f
	.xword	0x7f51f2a1bb2d05fb
	.xword	0xf49d3933666eafb3
	.xword	0x7fec489d61844bc5
	.xword	0xb0b066565f935b02
	.xword	0x789e3b43ea1c1347
	.xword	0xb8663eea56e96f55
	.xword	0xaf8fd8f76d7c7b74
	.xword	0xed8aa8e4c2100474
	.xword	0xb5ad5e679196b168
	.xword	0xf20b088a7ffac00b
	.xword	0xd9a7b0734b44feb4
	.xword	0x078d0b75b375d421
	.xword	0x4b1ce372b351d415
	.xword	0x33e41c320b6e6ca5
	.xword	0x089c609e1e401360
	.xword	0xbb33bca008e7dc2d
	.xword	0x7e09c655d30b7fb9
	.xword	0x3f12163b7f7f5006
	.xword	0xb30ecdca198cf7c3
	.xword	0x6bfc68704ba6f775
	.xword	0xe1139d2249f65c26
	.xword	0x11e4783ff85fd880
	.xword	0x12d1a32522e8d527
	.xword	0x360e31858f87ff7f
	.xword	0xe0ae8b6fcfee26ee
	.xword	0x6896a398da5c97ed
	.xword	0x8c73ee1e17786e7b
	.xword	0x9ed2bfe9145497e6
	.xword	0xb7d9579a46dbb3f6
	.xword	0xeea0b44a0953591f
	.xword	0xbaaf322e06c8d37c
	.xword	0x9a86d39516246ea9
	.xword	0x290dc2b3ac92edbb
	.xword	0xd6d5c412f308f73f
	.xword	0x4e6527ab99c2af97
	.xword	0x9f03d4979c27a14e
	.xword	0x23b5cb6f03a90497
	.xword	0x069811181610c267
	.xword	0xca1993460b2883fb
	.xword	0x20531b08b98e5608
	.xword	0xbd18c60e2ff4897f
	.xword	0xb4028847fc253c11
	.xword	0xe1e975811ae7069e
	.xword	0x070fd7e40c02e663
	.xword	0xcf6ab6b548aac1b7
	.xword	0x0d2f5f726e9bf3a3
	.xword	0xe194c41646b384fd
	.xword	0x6dab93e69cd51e22
	.xword	0x170fe4ab9373d86c
	.xword	0xef822ef7a072b11e
	.xword	0x854f76604ef27816
	.xword	0x9e955f5b269f9d7c
	.xword	0x46f74d14c23f8458
	.xword	0x484d00526071d5ac
	.xword	0xc7a3f02f8ba57e99
	.xword	0xd0eaea59b7dc9ce8
	.xword	0x9f8acbad70448d81
	.xword	0xb819edb36d194637
	.xword	0xa24896bbfab3ede7
	.xword	0x2f77242f06371f17
	.xword	0x3ecec240a1002d8b
	.xword	0x08e095f1a56721d0
	.xword	0x28ec5f54091acc98
	.xword	0xd64dd28d166c90d3
	.xword	0xffb59ff011296a4e
	.xword	0x931d4b18208843bd
	.xword	0x8102f9cb6d6648d4
	.xword	0x6818223dab5663ae
	.xword	0x322b6f1a30357b9d
	.xword	0x0ca8b66e9dde26e7
	.xword	0x7c67a845d16b1f51
	.xword	0xe616eb85c4568d1c
	.xword	0x8f9868a829848624
	.xword	0x8c34a5be547da145
	.xword	0x09eec796f959a6cd
	.xword	0x2cbe67891ad6526b
	.xword	0xc2a7b47808a9b942
	.xword	0x08c929f3f8dac8a9
	.xword	0x86bc3a4d623e10d2
	.xword	0xaa0de47c8a2fe0ce
	.xword	0x879c5522767d0908



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
	.xword	0x66d4880fbfcc6552
	.xword	0x27f21d90cbd2f76b
	.xword	0xee5b5462946aac99
	.xword	0x282754ad295a4273
	.xword	0xda8af4dc18aa95b9
	.xword	0x330a97f65e298445
	.xword	0xe053d1e327230e37
	.xword	0x08ce7f218edc7e77
	.xword	0x0cec98358cf0c455
	.xword	0x9d128502338a5b24
	.xword	0x9bd968ce614868df
	.xword	0x036f8ed160ef29bd
	.xword	0x438efd31321e1c30
	.xword	0x818656c1191f611a
	.xword	0x559d3063baeb9cf4
	.xword	0xc7a7a832fc9a3c98
	.xword	0x300461774feb1297
	.xword	0x266e42f2d05eaf68
	.xword	0xdba56f1835a97b04
	.xword	0xa9e49fcb0b202a5b
	.xword	0xdebcf92203607029
	.xword	0xebe384c1ce75799f
	.xword	0xd1bb6bb00ab09b19
	.xword	0x33dc510b5c719f37
	.xword	0x0f1e04fef4c0ebf8
	.xword	0x3573d7cc25f01b7d
	.xword	0xd61b1cca98135eef
	.xword	0xdc5fec9dd79fbc23
	.xword	0x6bf5a77dc8d6eba5
	.xword	0x0a0273d329d5b661
	.xword	0x4649fe86831e3f29
	.xword	0x2e0d2846cf9bae1c
	.xword	0xa959e25512c1ca02
	.xword	0x811db04013fd6ab3
	.xword	0xdebb749be570a29f
	.xword	0x78acd19830d29488
	.xword	0xe1dbd2d3bf167b94
	.xword	0xc2342f1e7c013f9a
	.xword	0xff749dfd794740c7
	.xword	0xa7e7c4db8339303e
	.xword	0x7f7c2047eab4dbf7
	.xword	0x7becfaa9359be353
	.xword	0xe8e8d4877088a3b4
	.xword	0x8cb0c2236c4440ba
	.xword	0xab1a9e3baa69b096
	.xword	0x46ce1f2298d1eaad
	.xword	0xbb889dc4c330f4e3
	.xword	0x095619c91940dd49
	.xword	0x68ea2b6d270cc23d
	.xword	0x15475a324423ae8b
	.xword	0x4ebc5bc7527b88bf
	.xword	0x2703a323ba8e6d65
	.xword	0xd521a36de6410807
	.xword	0xd85ac29369244966
	.xword	0xa77db4bee013d34a
	.xword	0xa8b82e4ba6747d4f
	.xword	0x556248486107ae7d
	.xword	0x44f30aa7539a0c77
	.xword	0x0ffae5e3a9b33be2
	.xword	0xc9be9d1c574ec1db
	.xword	0x28bd2c62a9e0d6a0
	.xword	0x4ad82d7defe10e68
	.xword	0xfdb258ef95969ecc
	.xword	0x1647dd1c28e7eadd
	.xword	0xc05101a40cac73f0
	.xword	0xc3fda38a707c0b3f
	.xword	0xa2b080c52cb7cf76
	.xword	0x9ad8334a02cb4c56
	.xword	0x8d1c71aad084068f
	.xword	0x674238ef3244b9ab
	.xword	0xb2e67ac12f9cae23
	.xword	0xde0ee6b6cc9456bc
	.xword	0x106659cf1bcab746
	.xword	0xc89cf3ae937a63c8
	.xword	0x1689cbfce24f49d8
	.xword	0xf672e276437098e5
	.xword	0x7cff9963c0e40687
	.xword	0x9a66ed090f3769b4
	.xword	0xb52d8608f75055e2
	.xword	0x6f479457e63f9b38
	.xword	0xcc75ec1a3c3cbebc
	.xword	0xfb4e0a8be0718447
	.xword	0x86276902bb7fd381
	.xword	0xf83834e4b27c00e4
	.xword	0x3d6646449132729c
	.xword	0x311bbf3d6aed3238
	.xword	0xb4ce17a0e3b05141
	.xword	0x429abc5c0aa2ebb8
	.xword	0x177101c11cb2fc6f
	.xword	0xbaa092c76039aa79
	.xword	0xec0b1283839c40f4
	.xword	0xf57c09f6d04021d3
	.xword	0x461e281f1d41c5d3
	.xword	0xa1b05b2f18ae9078
	.xword	0xda3e7dd780364a62
	.xword	0xfb4b5c39aff77415
	.xword	0x38818f6b42bca439
	.xword	0x7acf7c883d7a4919
	.xword	0x7aad2e3fd7040f42
	.xword	0x6845fa4a01627770
	.xword	0x80de77b92444c4d0
	.xword	0x14fc84263282f81f
	.xword	0x62eead73cba31cb2
	.xword	0x688cc5c952832933
	.xword	0x87718f69331e9c47
	.xword	0xe8239caf95e73f0c
	.xword	0x6a66e9f4dc04bf10
	.xword	0x88e4d1d48fa26d56
	.xword	0x199458d2372e80bb
	.xword	0xe991fc3ff12dd00a
	.xword	0x137e996c39d1bfd5
	.xword	0x2931f128101bcdbf
	.xword	0x3c511c389f947632
	.xword	0xca03d19710143579
	.xword	0xc5e4d43874dc0f39
	.xword	0x1cc2751dd7500073
	.xword	0x58947d310659a230
	.xword	0x6fc14fff9effee3b
	.xword	0x7574d9b22bf5e339
	.xword	0xcea8c15836dd6cf4
	.xword	0xe1b4083fba3d2da8
	.xword	0x823b940bcc75ff70
	.xword	0x142ae377f1c02d6b
	.xword	0xb2262514979b6251
	.xword	0xd15a09c51d40bacb
	.xword	0x0a8c2bc11aebe75e
	.xword	0x56aea2d954f135d5
	.xword	0x512ac9d3ddda3dcd
	.xword	0xf9c3579aa08966eb
	.xword	0xe9dddc46769de74a
	.xword	0xc193f9d04fdee9c2
	.xword	0x316b866f8bbaa6ab
	.xword	0x2ed7988edbef40be
	.xword	0x5150bfae381894f2
	.xword	0xf0128f080abf95bc
	.xword	0x86c5636848d8cf0e
	.xword	0x98ff66acc53f0bac
	.xword	0x4d75ee099fe2bd9a
	.xword	0x47d5dc854b1c4a23
	.xword	0x6ec5dafcb89db823
	.xword	0xbd4ddc168146c2bc
	.xword	0x94cb3fcda65363e1
	.xword	0x8e4f13d3a261b84d
	.xword	0x5a5d4d77c50a496d
	.xword	0x2fca0842f5e32e66
	.xword	0x8cb34074bd4ccb63
	.xword	0x02103737a976a87c
	.xword	0x26f1145966133f9a
	.xword	0x4c71b8dd7a436ff4
	.xword	0x82f85b379238aece
	.xword	0x879ae67e8e7cd27d
	.xword	0xa71c4173cdf46cd9
	.xword	0x339b08ed3871faf9
	.xword	0x10b443647d5bee1f
	.xword	0xc197568baa897ca2
	.xword	0x1befeb7c59c7f706
	.xword	0xdd386446cc6b5ae6
	.xword	0x73503b1f1810b40a
	.xword	0x9dd44299d0414172
	.xword	0xd8f0a7112296f402
	.xword	0x5696a7c50e5c9e13
	.xword	0xcbc85ff6079003e8
	.xword	0x2efded68c375b69c
	.xword	0x44fca671313b4a20
	.xword	0x93f1a07223589b33
	.xword	0xca786028b2c6aa10
	.xword	0x42bc3ef0f1a8e5e5
	.xword	0x625635d4a2a6286e
	.xword	0xf585e0043cbc8b80
	.xword	0xdd835968309991cf
	.xword	0xacc9d4c7f70e1a4c
	.xword	0x8b5b68e733fec20b
	.xword	0x2b249a66330abf91
	.xword	0xdd1558eeb313ea34
	.xword	0x2e6604cebdd989a2
	.xword	0x6bd719c1c7945734
	.xword	0xee895cddeb4ff686
	.xword	0x1beb6feae4656570
	.xword	0x5c86d95da394ef13
	.xword	0x3936945cb61d81fd
	.xword	0xab4550cef5a9891d
	.xword	0x425084b704e436ba
	.xword	0x7b7c9b8ef4dd6c2c
	.xword	0x38b1aafea6bde15a
	.xword	0x0169e47d59103b04
	.xword	0x7b5cc2541265e209
	.xword	0xfd054ea93437ea66
	.xword	0x71baa70b7727502d
	.xword	0x5870a29bae78f592
	.xword	0xe96bb9258d3dc7b6
	.xword	0xcf0475cf14fe3e32
	.xword	0xc780ba319786dab7
	.xword	0xf07ceb948e6e84fc
	.xword	0x7787427a24737a8b
	.xword	0x77151d0b60fac2a9
	.xword	0x5fbd288e0513380d
	.xword	0x14ab79f9024d9490
	.xword	0x93bdf862e88e2e3d
	.xword	0x20428f24618793ae
	.xword	0x0b3d8433b5bfd55a
	.xword	0x9a21c4a59babe90f
	.xword	0xc06447d4321da8d5
	.xword	0xc8ca52a5d865bb62
	.xword	0x78af92020b658b50
	.xword	0x61dd57b13c8230ae
	.xword	0xb89ecc09d45a8657
	.xword	0xf5ca43d17984e087
	.xword	0x2385d8b04f15d853
	.xword	0x7f117d7e4fe25c63
	.xword	0xe85628b1c56643b9
	.xword	0xb03d585ba5f18e6f
	.xword	0xb8df5de6f565b3a2
	.xword	0x2a17f5b9755b8c46
	.xword	0xf27b3265822fd855
	.xword	0x5ad0ee25665a97e7
	.xword	0xff465aff851b399c
	.xword	0x095095bdd53b942c
	.xword	0xd6ca5d78916ef21b
	.xword	0x110e8e93cefd267f
	.xword	0x3d87e27dfc779c30
	.xword	0x49cc08ca22144c4c
	.xword	0x21bba692f024cb70
	.xword	0xd79f3222dd950bef
	.xword	0x44f800c3c78c5125
	.xword	0xac63e4696195c757
	.xword	0x2c8114a23c08cb3a
	.xword	0x5319d982d505abe6
	.xword	0x53fd6f4d5f95f125
	.xword	0x5d8a520c6455012d
	.xword	0xff8e9445e514eb16
	.xword	0xc54fe2a6940afd20
	.xword	0x72854a59ff8237c6
	.xword	0xceae90816f8e2d7d
	.xword	0x873b17ae0a461084
	.xword	0x30b357576a7ddace
	.xword	0xe4df5be33783c906
	.xword	0xcac7aa8595e855df
	.xword	0xbf1434b41acf872c
	.xword	0x28b437c054defa3c
	.xword	0x4bc756b1a2b835b1
	.xword	0x745a58b8929986eb
	.xword	0x8693531fbe644eb4
	.xword	0xac573e6d08928557
	.xword	0x7f917d30a02707a7
	.xword	0xbb923d9152147df4
	.xword	0x3f3e993d11ac6e75
	.xword	0x18ef39a39f6f7085
	.xword	0x708300c5fedb4df6
	.xword	0x72585e74b4f85e7d
	.xword	0xcca0a8cdb7f12c8e
	.xword	0x4b0bde54aea47126
	.xword	0xba332984925f6252
	.xword	0x2b7ed2b52cc3d8d7
	.xword	0x092c7e8ee24b668f
	.xword	0xf93922f94fb9d362
	.xword	0x09dd2cf618497027



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
	.xword	0xc4e955594ddd3cac
	.xword	0x55b9ce71a888bc58
	.xword	0x55f4eeebe6769366
	.xword	0xc382bd021260145e
	.xword	0xebafa742e2b5ab0a
	.xword	0x14cc9a01f02c6b72
	.xword	0x9c560555c5242977
	.xword	0xd317992251b690c7
	.xword	0x567e80bc7efadf15
	.xword	0x5532cc8459027f21
	.xword	0xba0c23f3475ca635
	.xword	0x0f38cc8f1ea5b479
	.xword	0xa19230a6bd8cd48a
	.xword	0x84a831077397fa2f
	.xword	0x174812d43d8e62d1
	.xword	0x37c1697ba56267ab
	.xword	0xcc055ddfb658c246
	.xword	0xb10e8ee4dc6b1e52
	.xword	0x68d7909217c56d6d
	.xword	0xe842b80074da84cc
	.xword	0xf12491af2675ee2f
	.xword	0x3164fab02df96f9f
	.xword	0x517d9039320069a3
	.xword	0x13d72194029535ef
	.xword	0x18b14fac5cf6474e
	.xword	0xb64613b41d3bb976
	.xword	0xbcf3050ab1afc44a
	.xword	0x56334fb8ecc5b7b1
	.xword	0xe63b41c09b6ebd7b
	.xword	0x1dbb5dd429382ef9
	.xword	0xfaa338dec707c739
	.xword	0x149d6766d9a8481c
	.xword	0x82a4e40cd469a844
	.xword	0x256adc93971125d0
	.xword	0xf4420381869839ff
	.xword	0x90d754ad9639ccde
	.xword	0x99e848611a81c7e1
	.xword	0xae69e842aa3dce2b
	.xword	0x0113ed76d8a5db44
	.xword	0x3042e3283fc04e40
	.xword	0x1c0cc67bc569ed12
	.xword	0xe0eeca441d4dfac3
	.xword	0xdb6252a8b76720b8
	.xword	0x90edef6363ff7dd8
	.xword	0x0620f9df5cf7721c
	.xword	0x234ead298e3f4dc4
	.xword	0xcff1dd9bdf873e87
	.xword	0x763e34c657e7d23a
	.xword	0xb0227b45601c0223
	.xword	0x8a9afff7ebd6e357
	.xword	0xa1e1fd8cf4aab27c
	.xword	0x879bbc25c88fb6c4
	.xword	0x6bef8df5514f51f3
	.xword	0xc0eb4ba3b2cf9e94
	.xword	0x6408b5cf446a9055
	.xword	0x1e64eef2b50decbc
	.xword	0x10a893254932f59f
	.xword	0xa198b4b181c5fc31
	.xword	0xe60e9737852b72fc
	.xword	0xaf33c59981c9696e
	.xword	0xd6b2081bbc5b63aa
	.xword	0xf006c750df96ad78
	.xword	0x8f9fa714764671ab
	.xword	0xab29d6d25916c4e5
	.xword	0xb5a0e068eaf7406d
	.xword	0x261b6a4dce9eb772
	.xword	0x331241455135e04b
	.xword	0x942079dd9752e96e
	.xword	0x5944fee002fbe1c3
	.xword	0xc15431df9b9a7772
	.xword	0x8df6b164ad08a9a3
	.xword	0x903749730fbe9e70
	.xword	0x0ad723c24c0ad2af
	.xword	0xf47528ed0f9aaccf
	.xword	0x715f4457df6de417
	.xword	0x5a6a4a6666fae992
	.xword	0xd5ad716bb5bbd3bd
	.xword	0xf105c26a861b3848
	.xword	0xf6e6cc807d753e62
	.xword	0x3c8258766c29ce56
	.xword	0xbccb42ebc0ce1168
	.xword	0x188f128a365e30ce
	.xword	0x2d8360749e2a2377
	.xword	0x74eda1c9f48ac1f0
	.xword	0x9a48e477acb81100
	.xword	0x9bfdfedbd713a49f
	.xword	0xfdcc1d1ec84325a3
	.xword	0xe7c853ee936318e4
	.xword	0xa8785eb2939e4a82
	.xword	0xe98b56174b3d2895
	.xword	0xeee2638dc35acdd6
	.xword	0x9be99140fb49b2b7
	.xword	0xd6d81e51480ff437
	.xword	0x98b68428ff4e5a7c
	.xword	0x3321f26b18a4a088
	.xword	0xe5225f188b1ed192
	.xword	0x536f0430ea9c047e
	.xword	0xaf17d9adb187956f
	.xword	0x1e7f2a1a2eac19fa
	.xword	0x5379d505b6300aa4
	.xword	0x4d9e10dc5d09cc72
	.xword	0xb592671828f95ae6
	.xword	0xc6cbc2d702518841
	.xword	0xf4a19bca8e435512
	.xword	0x2dbf25384532b55b
	.xword	0x25975d19a02cb468
	.xword	0x94961ddf8c28ffab
	.xword	0x311d4ac0c218082a
	.xword	0x26e403cfde2516e9
	.xword	0xccdb1a4281b2c1a4
	.xword	0x2ad67f827091bdfb
	.xword	0x4606732583df2584
	.xword	0xb3bc7e851a7e812b
	.xword	0x3578edc4b3118a11
	.xword	0xb85436322fb5fc13
	.xword	0x062e3608207ddb70
	.xword	0x55917be70170458b
	.xword	0xf0fbdb88c13765df
	.xword	0x423619c4368f6665
	.xword	0xa06bd75baeb29bfe
	.xword	0x710e7e0c11796406
	.xword	0xbf91f09bc17e56eb
	.xword	0x61b89544ae084ecb
	.xword	0x2b2f50a7718fa0b3
	.xword	0x7ff9ad4598251d2f
	.xword	0x3cbed855ffdda2d3
	.xword	0x4c2e81c14af9a0be
	.xword	0x820a221cf21df8ff
	.xword	0xdafe51bccf0d7644
	.xword	0x5480c430341cdac3
	.xword	0x77a2110474ea0339
	.xword	0x18966d4dee5b47b0
	.xword	0x3e7fdb3e8d116e16
	.xword	0xa22f052d03492eff
	.xword	0x9a86027f7f3295dd
	.xword	0x9322d4eb886cca9e
	.xword	0x731744cbf182d0cb
	.xword	0xf47b329ca2e7d49e
	.xword	0xd0999391530b8008
	.xword	0xa077ce8c02934dcf
	.xword	0x1564ce8d86bc2558
	.xword	0xdce88b4046285321
	.xword	0x444faeaaab82427d
	.xword	0xa399c13d4604e8e0
	.xword	0x843a01710f960b24
	.xword	0x15c734b3c1e019a8
	.xword	0x9ae03fc2cf91e05a
	.xword	0xec1e5fcbc68ef35a
	.xword	0x28477a585acf199e
	.xword	0x80444b1bbd8a8770
	.xword	0xe1dced58c077e8be
	.xword	0xe0ee61dbf2faf8d0
	.xword	0x45e520398c10dbf3
	.xword	0x7efb16977267df0d
	.xword	0xd5280bae881a3070
	.xword	0x89f2389faee67a7a
	.xword	0xdf0c9e24de8799d0
	.xword	0x10da7588a916780b
	.xword	0x9ca6b8d547c6aa5a
	.xword	0x42084b88fe81b2b0
	.xword	0x6edb8284150266f8
	.xword	0x6a7fa2b340efea23
	.xword	0x59371a94ed8dec9f
	.xword	0x319ae3ed3d6319b3
	.xword	0x0501dd2755cc6ec9
	.xword	0xafe79197b394e639
	.xword	0x8e53ea9f2560f206
	.xword	0x1667cb4fc7e469b7
	.xword	0x4e8a021413c8f4dd
	.xword	0xb13482ce26cef0f4
	.xword	0x38bbd801f47d9c49
	.xword	0xaced633f9bc53453
	.xword	0xc0e2a6706374357d
	.xword	0x167253a7009c0807
	.xword	0xdc1a8a825315f845
	.xword	0x1fc470bb9db71c92
	.xword	0x77800310649e25f4
	.xword	0x86d90702dfe1cccc
	.xword	0xdd0fac2b582b7944
	.xword	0x58f2076d04c7cb7d
	.xword	0xb5ca5dba8631f035
	.xword	0xa587b2c87afbea22
	.xword	0xfc8b83fd5e3d5ef9
	.xword	0xe6244d8f82b817a6
	.xword	0x57080aac006ce607
	.xword	0x10de80a319680542
	.xword	0xa77ab49480331671
	.xword	0x02cc60046b9f67aa
	.xword	0x5388f7f9290f7a32
	.xword	0x4e8656e5485ae017
	.xword	0xb7ca84fc4c89d008
	.xword	0x729f06985dd144c5
	.xword	0x432b65164116bb10
	.xword	0xcb3247597a473f39
	.xword	0xe3234d49e157ee94
	.xword	0xb01262e23ee52fc2
	.xword	0xe19e57b640f88a28
	.xword	0x5616f318ce2eb574
	.xword	0x778876e60b958fc7
	.xword	0x71d4497888f0b7d8
	.xword	0x36118bf5ecadbba4
	.xword	0x2b36652af7e59f24
	.xword	0x735f87173b2853a5
	.xword	0x368c99ad51f76ea6
	.xword	0x1adc4da219adf94f
	.xword	0xabe67a4a355cb443
	.xword	0x06965be6acb2d6b6
	.xword	0xd43b8e64d7f7116e
	.xword	0xc69aa9aa81a15d85
	.xword	0x4cd7984686790bf9
	.xword	0x6e42e5ad46a44cd3
	.xword	0x99b0721aa8eebcab
	.xword	0xf12fde5f83275c3c
	.xword	0x858c6d95f4ebfea9
	.xword	0xff85319ec28127b0
	.xword	0x1ddb5653a4070c77
	.xword	0xf00ced68c5c173dc
	.xword	0x3f1c47bb856d4830
	.xword	0xc3c805130629d584
	.xword	0xb4f2e969634721c8
	.xword	0x147cf36839f0a0d9
	.xword	0x7ec4f22e9606a8e2
	.xword	0x3f51623ec4236cd8
	.xword	0xa2943703212877de
	.xword	0xaa660cfa47f70d5c
	.xword	0x3cba02640ad4144a
	.xword	0x3148831e57bf071f
	.xword	0xe9e4e226ee44e09e
	.xword	0x4bc10176cd4a72dc
	.xword	0x86d9a912a86bb070
	.xword	0x26b645705fd541c8
	.xword	0x78a7ac02ba7c1eb8
	.xword	0x3a546b1aef11c9f9
	.xword	0xf430d1d4be90257a
	.xword	0x8a42b68af4fd3377
	.xword	0x071d85fa44b874e9
	.xword	0x80d263b32d2afad8
	.xword	0x37f933b535ee913c
	.xword	0x96a43d06b77f3978
	.xword	0x0eb15ae49622a767
	.xword	0x746049e9aff0ce45
	.xword	0xfc34a3f42c6c8cd9
	.xword	0x413f3e9b02b7381e
	.xword	0xb3797f7ebb9d3293
	.xword	0x6f359df5088c3888
	.xword	0x3239bf6ad4566435
	.xword	0x31e1c725d030bd65
	.xword	0x8b7402bdb9115934
	.xword	0x04bd4d814077561b
	.xword	0xbf801be6c233865e
	.xword	0xbb923d6823c0e016
	.xword	0x4142bfd1042a3c50
	.xword	0xb45701184aadd711
	.xword	0xdbaf0f21aba96ef9
	.xword	0x25c5a67f2d743381
	.xword	0xe72e4113912d2e30



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
!!#   int fr_done = 0;
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
!!#   IJ_bind_file_group("diag.j", 257, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 258, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 261, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 263, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 264, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 265, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 267, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 269, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 270, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 272, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 273, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 274, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 275, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 277, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 278, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 281, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 282, th_M, "\tmov\t0, %%r8\n");
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
!!#   IJ_printf ("diag.j", 314, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 315, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 320,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 322,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 327,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 504, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# !inst_type: set_addr load alu store 
!!# inst_type: set_addr load atomics alu store atomics_asi barier sjm4 sjm5
!!# {
!!# 		IJ_generate ("diag.j", 511, th_M, $2);
!!# 		IJ_generate ("diag.j", 512, th_M, $3);
!!# 		IJ_generate ("diag.j", 513, th_M, $4);
!!# 		IJ_generate ("diag.j", 514, th_M, $5);
!!# 		IJ_generate ("diag.j", 515, th_M, $6);
!!# 		IJ_generate ("diag.j", 516, th_M, $7);
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
!!#                    IJ_printf ("diag.j", 534, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 537, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 539, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 540, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 544, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 545, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 546, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 547, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 549, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 550, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 563, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 568, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 572, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 573, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 575, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 576, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 590, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 594, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 595, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 612, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 617, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 618, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 620, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 621, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 623, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 624, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 629, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 630, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 632, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 633, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 650, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 653, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 655, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 656, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 660, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 661, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 662, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 663, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 665, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 666, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 679, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 684, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 688, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 689, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 691, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 692, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 707, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 710, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 712, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 713, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 728, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 731, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 732, Rv_rand32);
!!#                          IJ_printf ("diag.j", 733, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 738, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 740, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 754, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 760, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 764, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 779, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 781, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 783, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 789, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 790, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 817, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 823, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 824, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 827, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 829, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 838, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 840, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 858, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 864, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 869, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 871, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 889, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 892, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 894, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 895, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 898, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 899, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 900, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 901, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 903, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 904, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 917, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 922, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 926, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 927, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 929, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 930, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 944, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 948, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 949, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 966, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 971, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 972, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 974, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 975, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 977, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 978, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 983, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 984, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 986, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 987, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1004, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1007, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1009, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1010, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1014, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1015, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1016, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1017, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1019, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1020, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1033, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1038, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1042, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1043, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1045, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1046, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1062, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1065, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1067, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1068, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1083, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1086, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1087, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1088, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1093, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1095, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1109, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1115, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1119, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1134, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1136, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1138, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1144, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1145, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1172, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1178, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1179, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1182, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1184, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1193, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1195, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1213, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1219, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1224, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1226, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1268, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
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
