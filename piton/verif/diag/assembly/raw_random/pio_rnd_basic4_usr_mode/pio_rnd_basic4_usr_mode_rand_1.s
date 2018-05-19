// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_rand_1.s
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
   random seed:	691123721
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

	setx 0x802dd76285b5d18d, %g1, %g0
	setx 0x5d70d9314ce39e88, %g1, %g1
	setx 0x0624dca644f3e981, %g1, %g2
	setx 0x3c335f9359564efd, %g1, %g3
	setx 0xe1959c60788e7552, %g1, %g4
	setx 0x4dc405d0b2000ea9, %g1, %g5
	setx 0x2d3d20c45f07d427, %g1, %g6
	setx 0x899c7687bcac306a, %g1, %g7
	setx 0x3ff8d7caab8ac786, %g1, %r16
	setx 0x8e85a65291f1ad7a, %g1, %r17
	setx 0xb29d4ef90b8ea46e, %g1, %r18
	setx 0xaffcec279e59f578, %g1, %r19
	setx 0x69192a385ec87c89, %g1, %r20
	setx 0xca61eff607237a91, %g1, %r21
	setx 0xb5adea565efb1b69, %g1, %r22
	setx 0x47f31e5664ea6b30, %g1, %r23
	setx 0xc9e9fb0c7345958a, %g1, %r24
	setx 0xd14d4662a8963ef5, %g1, %r25
	setx 0x395ac01fa8d2acf1, %g1, %r26
	setx 0x7838dbbda4d8984a, %g1, %r27
	setx 0x3eab8a4a8826cfa6, %g1, %r28
	setx 0xc8d2e44e16d659e8, %g1, %r29
	setx 0xb5c73af4b898ae76, %g1, %r30
	setx 0xfbdff48ff288c0e7, %g1, %r31
	save
	setx 0x53f20185416c5190, %g1, %r16
	setx 0xe99cfdb4def0b856, %g1, %r17
	setx 0x7fa0594668d2cb79, %g1, %r18
	setx 0x4834e1416b33daf3, %g1, %r19
	setx 0x675c6e829066d5a5, %g1, %r20
	setx 0x29244c2a14286203, %g1, %r21
	setx 0x872b4bca2b8e7f04, %g1, %r22
	setx 0x2920eb726a9b4084, %g1, %r23
	setx 0xb44fe0f0415e07e6, %g1, %r24
	setx 0xafb73890631b5e6d, %g1, %r25
	setx 0x6955b8f2ff1aae3a, %g1, %r26
	setx 0x8b5791940edaf410, %g1, %r27
	setx 0x30df077e4b4d2d15, %g1, %r28
	setx 0xa36ef3be6ce3c75d, %g1, %r29
	setx 0xa140a05fa40a79f6, %g1, %r30
	setx 0x747ea61dee911931, %g1, %r31
	save
	setx 0x890c571abcba31d5, %g1, %r16
	setx 0xf48a3f5292a6bae9, %g1, %r17
	setx 0x3766c8c7c17d75c6, %g1, %r18
	setx 0x791847951f535d1b, %g1, %r19
	setx 0xd351c1a2df9a5cad, %g1, %r20
	setx 0xd5f8a58908fdda70, %g1, %r21
	setx 0x735e32f4f4ef1476, %g1, %r22
	setx 0x1c90249555c151bd, %g1, %r23
	setx 0x0af955f46b6fdc4a, %g1, %r24
	setx 0x8a242793c29a43dc, %g1, %r25
	setx 0x1ef04aec66717e36, %g1, %r26
	setx 0xf813c8489a104801, %g1, %r27
	setx 0xd4ce194141a6e393, %g1, %r28
	setx 0x5af5a77a16fdac8b, %g1, %r29
	setx 0x199bcda8388014c1, %g1, %r30
	setx 0xa496cbc184045f98, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe051a018  ! 1: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe879a030  ! 2: SWAP_I	swap	%r20, [%r6 + 0x0030]
	.word 0xac318008  ! 3: SUBC_R	orn 	%r6, %r8, %r22
	.word 0xe031a030  ! 4: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xeff1a008  ! 5: CASXA_R	casxa	[%r6]%asi, %r8, %r23
	.word 0x8143e011  ! 6: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0198008  ! 10: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe4798008  ! 11: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xae198008  ! 12: XOR_R	xor 	%r6, %r8, %r23
	.word 0xe839a030  ! 13: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe6e98008  ! 14: LDSTUBA_R	ldstuba	%r19, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 15: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe859a030  ! 19: LDX_I	ldx	[%r6 + 0x0030], %r20
	.word 0xe2698008  ! 20: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xa8c18008  ! 21: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xe4218008  ! 22: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe7f1a008  ! 23: CASXA_R	casxa	[%r6]%asi, %r8, %r19
	.word 0x8143c000  ! 24: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe059a030  ! 28: LDX_I	ldx	[%r6 + 0x0030], %r16
	.word 0xe079a020  ! 29: SWAP_I	swap	%r16, [%r6 + 0x0020]
	.word 0xa091a030  ! 30: ORcc_I	orcc 	%r6, 0x0030, %r16
	.word 0xe8718008  ! 31: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe1e1a008  ! 32: CASA_R	casa	[%r6] %asi, %r8, %r16
	.word 0x8143e011  ! 33: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe849a030  ! 37: LDSB_I	ldsb	[%r6 + 0x0030], %r20
	.word 0xe0798008  ! 38: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xa8998008  ! 39: XORcc_R	xorcc 	%r6, %r8, %r20
	.word 0xe0298008  ! 40: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xebf1a008  ! 41: CASXA_R	casxa	[%r6]%asi, %r8, %r21
	.word 0x8143e011  ! 42: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec598008  ! 46: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xee698008  ! 47: LDSTUB_R	ldstub	%r23, [%r6 + %r8]
	.word 0xac39a010  ! 48: XNOR_I	xnor 	%r6, 0x0010, %r22
	.word 0xe4398008  ! 49: STD_R	std	%r18, [%r6 + %r8]
	.word 0xeae9a018  ! 50: LDSTUBA_I	ldstuba	%r21, [%r6 + 0x0018] %asi
	.word 0x8143c000  ! 51: STBAR	stbar
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe041a018  ! 55: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xee79a018  ! 56: SWAP_I	swap	%r23, [%r6 + 0x0018]
	.word 0xac99a010  ! 57: XORcc_I	xorcc 	%r6, 0x0010, %r22
	.word 0xe839a010  ! 58: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xe8f9a018  ! 59: SWAPA_I	swapa	%r20, [%r6 + 0x0018] %asi
	.word 0x8143c000  ! 60: STBAR	stbar
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe459a018  ! 64: LDX_I	ldx	[%r6 + 0x0018], %r18
	.word 0xe4798008  ! 65: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa2418008  ! 66: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe8398008  ! 67: STD_R	std	%r20, [%r6 + %r8]
	.word 0xebe1a008  ! 68: CASA_R	casa	[%r6] %asi, %r8, %r21
	.word 0x8143c000  ! 69: STBAR	stbar
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe841a018  ! 73: LDSW_I	ldsw	[%r6 + 0x0018], %r20
	.word 0xe2798008  ! 74: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xa4b1a018  ! 75: ORNcc_I	orncc 	%r6, 0x0018, %r18
	.word 0xe439a018  ! 76: STD_I	std	%r18, [%r6 + 0x0018]
	.word 0xe2f9a020  ! 77: SWAPA_I	swapa	%r17, [%r6 + 0x0020] %asi
	.word 0x8143c000  ! 78: STBAR	stbar
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8518008  ! 82: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xec69a030  ! 83: LDSTUB_I	ldstub	%r22, [%r6 + 0x0030]
	.word 0xa809a000  ! 84: AND_I	and 	%r6, 0x0000, %r20
	.word 0xe8318008  ! 85: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xedf18008  ! 86: CASXA_I	casxa	[%r6] 0x 0, %r8, %r22
	.word 0x8143e011  ! 87: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe059a000  ! 91: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe279a028  ! 92: SWAP_I	swap	%r17, [%r6 + 0x0028]
	.word 0xa621a020  ! 93: SUB_I	sub 	%r6, 0x0020, %r19
	.word 0xe4218008  ! 94: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xebf18008  ! 95: CASXA_I	casxa	[%r6] 0x 0, %r8, %r21
	.word 0x8143e011  ! 96: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4018008  ! 100: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe6698008  ! 101: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xa4818008  ! 102: ADDcc_R	addcc 	%r6, %r8, %r18
	.word 0xe871a020  ! 103: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xe8e98008  ! 104: LDSTUBA_R	ldstuba	%r20, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 105: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe4698008  ! 110: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xaab9a008  ! 111: XNORcc_I	xnorcc 	%r6, 0x0008, %r21
	.word 0xe0298008  ! 112: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe9e1a008  ! 113: CASA_R	casa	[%r6] %asi, %r8, %r20
	.word 0x8143e011  ! 114: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec598008  ! 118: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe6798008  ! 119: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xa0b1a028  ! 120: ORNcc_I	orncc 	%r6, 0x0028, %r16
	.word 0xe029a028  ! 121: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe9f18008  ! 122: CASXA_I	casxa	[%r6] 0x 0, %r8, %r20
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8018008  ! 127: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe469a018  ! 128: LDSTUB_I	ldstub	%r18, [%r6 + 0x0018]
	.word 0xac398008  ! 129: XNOR_R	xnor 	%r6, %r8, %r22
	.word 0xec31a018  ! 130: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xe9f18008  ! 131: CASXA_I	casxa	[%r6] 0x 0, %r8, %r20
	.word 0x8143c000  ! 132: STBAR	stbar
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe041a018  ! 136: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xea698008  ! 137: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xa091a018  ! 138: ORcc_I	orcc 	%r6, 0x0018, %r16
	.word 0xe0718008  ! 139: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe9f1a008  ! 140: CASXA_R	casxa	[%r6]%asi, %r8, %r20
	.word 0x8143e011  ! 141: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0118008  ! 145: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe879a020  ! 146: SWAP_I	swap	%r20, [%r6 + 0x0020]
	.word 0xa639a028  ! 147: XNOR_I	xnor 	%r6, 0x0028, %r19
	.word 0xe0718008  ! 148: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xecf9a030  ! 149: SWAPA_I	swapa	%r22, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 150: STBAR	stbar
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4198008  ! 154: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe279a030  ! 155: SWAP_I	swap	%r17, [%r6 + 0x0030]
	.word 0xaca98008  ! 156: ANDNcc_R	andncc 	%r6, %r8, %r22
	.word 0xe0298008  ! 157: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xece9a038  ! 158: LDSTUBA_I	ldstuba	%r22, [%r6 + 0x0038] %asi
	.word 0x8143c000  ! 159: STBAR	stbar
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec198008  ! 163: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xee698008  ! 164: LDSTUB_R	ldstub	%r23, [%r6 + %r8]
	.word 0xaac1a000  ! 165: ADDCcc_I	addccc 	%r6, 0x0000, %r21
	.word 0xec21a000  ! 166: STW_I	stw	%r22, [%r6 + 0x0000]
	.word 0xe9e1a008  ! 167: CASA_R	casa	[%r6] %asi, %r8, %r20
	.word 0x8143e011  ! 168: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe051a000  ! 172: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xe6798008  ! 173: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xae818008  ! 174: ADDcc_R	addcc 	%r6, %r8, %r23
	.word 0xe4398008  ! 175: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe9e18008  ! 176: CASA_I	casa	[%r6] 0x 0, %r8, %r20
	.word 0x8143e011  ! 177: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8018008  ! 181: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe669a010  ! 182: LDSTUB_I	ldstub	%r19, [%r6 + 0x0010]
	.word 0xa689a038  ! 183: ANDcc_I	andcc 	%r6, 0x0038, %r19
	.word 0xe0718008  ! 184: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4e9a000  ! 185: LDSTUBA_I	ldstuba	%r18, [%r6 + 0x0000] %asi
	.word 0x8143c000  ! 186: STBAR	stbar
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0598008  ! 190: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe079a018  ! 191: SWAP_I	swap	%r16, [%r6 + 0x0018]
	.word 0xa439a020  ! 192: XNOR_I	xnor 	%r6, 0x0020, %r18
	.word 0xec21a020  ! 193: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xe5f18008  ! 194: CASXA_I	casxa	[%r6] 0x 0, %r8, %r18
	.word 0x8143e011  ! 195: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xee798008  ! 200: SWAP_R	swap	%r23, [%r6 + %r8]
	.word 0xa409a038  ! 201: AND_I	and 	%r6, 0x0038, %r18
	.word 0xe429a038  ! 202: STB_I	stb	%r18, [%r6 + 0x0038]
	.word 0xeff18008  ! 203: CASXA_I	casxa	[%r6] 0x 0, %r8, %r23
	.word 0x8143e011  ! 204: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4118008  ! 208: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe869a010  ! 209: LDSTUB_I	ldstub	%r20, [%r6 + 0x0010]
	.word 0xaa118008  ! 210: OR_R	or 	%r6, %r8, %r21
	.word 0xe031a010  ! 211: STH_I	sth	%r16, [%r6 + 0x0010]
	.word 0xe8f98008  ! 212: SWAPA_R	swapa	%r20, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe441a010  ! 217: LDSW_I	ldsw	[%r6 + 0x0010], %r18
	.word 0xe879a000  ! 218: SWAP_I	swap	%r20, [%r6 + 0x0000]
	.word 0xa6398008  ! 219: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xec31a000  ! 220: STH_I	sth	%r22, [%r6 + 0x0000]
	.word 0xebf18008  ! 221: CASXA_I	casxa	[%r6] 0x 0, %r8, %r21
	.word 0x8143e011  ! 222: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec41a000  ! 226: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xe0798008  ! 227: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xa6418008  ! 228: ADDC_R	addc 	%r6, %r8, %r19
	.word 0xe8318008  ! 229: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xeaf98008  ! 230: SWAPA_R	swapa	%r21, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 231: STBAR	stbar
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe009a000  ! 235: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe6798008  ! 236: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xa2b9a018  ! 237: XNORcc_I	xnorcc 	%r6, 0x0018, %r17
	.word 0xec398008  ! 238: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe6e9a028  ! 239: LDSTUBA_I	ldstuba	%r19, [%r6 + 0x0028] %asi
	.word 0x8143e011  ! 240: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a028  ! 244: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xe0698008  ! 245: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa4b18008  ! 246: ORNcc_R	orncc 	%r6, %r8, %r18
	.word 0xec318008  ! 247: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe6f9a020  ! 248: SWAPA_I	swapa	%r19, [%r6 + 0x0020] %asi
	.word 0x8143e011  ! 249: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe441a020  ! 253: LDSW_I	ldsw	[%r6 + 0x0020], %r18
	.word 0xe479a018  ! 254: SWAP_I	swap	%r18, [%r6 + 0x0018]
	.word 0xa601a020  ! 255: ADD_I	add 	%r6, 0x0020, %r19
	.word 0xe439a020  ! 256: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xe6f98008  ! 257: SWAPA_R	swapa	%r19, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 258: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec018008  ! 262: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe6798008  ! 263: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xaa218008  ! 264: SUB_R	sub 	%r6, %r8, %r21
	.word 0xe4298008  ! 265: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xecf98008  ! 266: SWAPA_R	swapa	%r22, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 267: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe009a020  ! 271: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xe4698008  ! 272: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa001a008  ! 273: ADD_I	add 	%r6, 0x0008, %r16
	.word 0xe071a008  ! 274: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe6e9a000  ! 275: LDSTUBA_I	ldstuba	%r19, [%r6 + 0x0000] %asi
	.word 0x8143e011  ! 276: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec098008  ! 280: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe8698008  ! 281: LDSTUB_R	ldstub	%r20, [%r6 + %r8]
	.word 0xaa39a020  ! 282: XNOR_I	xnor 	%r6, 0x0020, %r21
	.word 0xe031a020  ! 283: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xe0e9a030  ! 284: LDSTUBA_I	ldstuba	%r16, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 285: STBAR	stbar
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe409a030  ! 289: LDUB_I	ldub	[%r6 + 0x0030], %r18
	.word 0xe2698008  ! 290: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xae91a000  ! 291: ORcc_I	orcc 	%r6, 0x0000, %r23
	.word 0xe831a000  ! 292: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xece9a008  ! 293: LDSTUBA_I	ldstuba	%r22, [%r6 + 0x0008] %asi
	.word 0x8143e011  ! 294: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x00000000d01ef030, %r1, %r6



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
	.xword	0x10edcbc12789cce0
	.xword	0x48b7b92bd54d6110
	.xword	0x2711a634799a8eb1
	.xword	0x08644caebb1cc65a
	.xword	0x4a7f35bf211afce9
	.xword	0x4f089f3212fd026f
	.xword	0xac6ca653422bc328
	.xword	0x2c3c46bc8c65b60c
	.xword	0xa781ffde356a1c16
	.xword	0x1d63a5b54c6033f4
	.xword	0x6ee0ad2633893c48
	.xword	0xacf78ede5b972d37
	.xword	0x1c853e1c63c1e7a8
	.xword	0xe684f59aabf5287d
	.xword	0x500ebfc1b2821e22
	.xword	0xefa9025cdfbb8c23
	.xword	0x73e99aaf0133e36a
	.xword	0x17a1b8e30c218c77
	.xword	0x681d40b739ce521b
	.xword	0x4600e5bce7092c04
	.xword	0x9736a21f090ee715
	.xword	0x04b3e51f6f414b54
	.xword	0x9e2f71f41946feca
	.xword	0xaff0a5ee910b0c4a
	.xword	0x29dc3d6632058c56
	.xword	0x2a1233d4ad5d7c1d
	.xword	0xede81d9e03f3a1b9
	.xword	0x67ea4eab45ebdc13
	.xword	0x3c87ec3bbba0780f
	.xword	0xa42d5f3466cd6eb6
	.xword	0x9ddc39fe63d5e335
	.xword	0xc181fa77886f5677
	.xword	0x24fafbcc40efc380
	.xword	0x1b91f2f6db98da72
	.xword	0xf5bb465280372d0c
	.xword	0xacb201a7d75d5cc5
	.xword	0x2600752adf62aa22
	.xword	0x89fab10c24c6a8cf
	.xword	0x880e019f72569bde
	.xword	0xc012536d4173b056
	.xword	0x3f690000f5c88b08
	.xword	0xcdc9d3a1ea266bc6
	.xword	0xc21a4e7f8a00ce87
	.xword	0xe6938d17e0fe9beb
	.xword	0x424b0c7d1b5631d3
	.xword	0xbb604fd307f05286
	.xword	0xa9dd41471286fb42
	.xword	0xfa4abd3de3094829
	.xword	0x40dbed23555122b4
	.xword	0x2eaf78dd93c6dc0f
	.xword	0x9d113951ac9daf5a
	.xword	0xcbcc065ea9ab55b0
	.xword	0x68529d70de13cb0f
	.xword	0x71644369cc29e430
	.xword	0xb27f9cc9dcecf8ef
	.xword	0x5d1dff5446816546
	.xword	0x767f4f4b5934f0ce
	.xword	0x61ac8204223b8164
	.xword	0xbf7f860835fa0a06
	.xword	0xe8ba4dfad46bb056
	.xword	0xff63865afd39e9d4
	.xword	0x2f39e977fd8ca4af
	.xword	0x89a7f667cfb06609
	.xword	0x28d02dc721904282
	.xword	0xb4871f3d5f667e39
	.xword	0x7a95fcffb1af905d
	.xword	0x4f9c87a65fa831ae
	.xword	0xae2816119325e805
	.xword	0xb16bc6ab1ee1fd7f
	.xword	0x330b0d2e66a9472c
	.xword	0x8e19be50e036b801
	.xword	0x8a670e0e0fd3bf08
	.xword	0xfda794356e8a9207
	.xword	0x6b6a0081ec1ea25e
	.xword	0xc3dc36011d752714
	.xword	0xf089d7cfaf41b68c
	.xword	0x1ec8ddb154fd7831
	.xword	0x7462c23d71695827
	.xword	0xfa08d79cb9a6b91f
	.xword	0x8192dd6c3c29252b
	.xword	0x0ff396e9ef129966
	.xword	0xdac25f7967cb303b
	.xword	0xdc16484fb77872ce
	.xword	0xde1a024c994ec2bc
	.xword	0x88011dc13ec9d7ee
	.xword	0x70d945d5408770ac
	.xword	0x6ea2f62ce7573a3d
	.xword	0xae08d26a8237cf1f
	.xword	0xfe41156ede6f8235
	.xword	0xa7f4f56fc0ff47b8
	.xword	0x64e6921236d82931
	.xword	0x7b273ba3eafc8757
	.xword	0x6d00d66f2082718c
	.xword	0x766d30d3d5d10b39
	.xword	0x48abe79996edd8b9
	.xword	0x2965491150ed19a8
	.xword	0x239297eaf9b88b9f
	.xword	0x7a06d5d4aeec641c
	.xword	0x64d7b3adcbc918b4
	.xword	0xee5fd6e8c8b6ddce
	.xword	0x81f0ddf0d9b7d794
	.xword	0x34ac01e6c023fb3d
	.xword	0x9f4396dde71c75c8
	.xword	0x5cb07133bb83d095
	.xword	0x2ddf47d282bee410
	.xword	0x759e54b072d2c6ba
	.xword	0x4cef5c1bc90d0bd4
	.xword	0xb7bda36bffe952af
	.xword	0xf0b32ee1961427bc
	.xword	0x10cbd68cb8033fcd
	.xword	0x6f1e6139d03bc4e9
	.xword	0x148f06fd81d615cc
	.xword	0xa9965740a6e0c43d
	.xword	0x8c8be62e97664da2
	.xword	0x4388f84cf40f155d
	.xword	0x3bfd8355a0d6443c
	.xword	0x3810a70ef352350f
	.xword	0xd4f7e2896b7109fb
	.xword	0x39ce0d8c068e7aeb
	.xword	0x8ad2d31554ae33c4
	.xword	0x666e4a57662ac37b
	.xword	0xbf52570bcd07e0de
	.xword	0x0bb9ed5ad82baaf0
	.xword	0x98d76a804228ab91
	.xword	0x099f608c0babd772
	.xword	0x133975237d9f0117
	.xword	0xec7a67e48434496c
	.xword	0x20df8aa91b1b982f
	.xword	0x17404b43b9acaeb3
	.xword	0x5d6a0d6836136316
	.xword	0xed254b546bfca42b
	.xword	0xbe9773dd2e7757ab
	.xword	0x9c55c0cb83e6f6e6
	.xword	0xcc9ccfde267b7937
	.xword	0xe0899634016cbf6b
	.xword	0xb30c3c975063228f
	.xword	0x21c4442044062c59
	.xword	0xdf32e23edd155205
	.xword	0x326646d49b4281a3
	.xword	0x6fc91ec676ef9bb5
	.xword	0xf3c818fdb9ea0237
	.xword	0xa775793ee4eadc60
	.xword	0x6c7ca31a8fc0ef67
	.xword	0x126ac752bc693dcd
	.xword	0x4bc1403d8682ff9a
	.xword	0x8c2da9aee5082e16
	.xword	0x633e38e2c2365fde
	.xword	0xfd652980b2a64c5b
	.xword	0x5aaf8e724cbbf084
	.xword	0x32a91312997728be
	.xword	0x7e3d43b9f7d7de3f
	.xword	0x24343c623b01a515
	.xword	0xb94b7f96e29a7f22
	.xword	0xe639f3d73710ffda
	.xword	0x204b01c971938cbb
	.xword	0x5aa9e188b19a709b
	.xword	0x3ec39db27f24eb25
	.xword	0x574dc31e8733f246
	.xword	0x0f21be2d8395ffea
	.xword	0xe7bd1e7315a20402
	.xword	0xee230c6aa20f5dbe
	.xword	0xacb9eca40c5825a7
	.xword	0x035803961ca4e4ea
	.xword	0x14c3ba64f43527ae
	.xword	0xe88ffeabecab5aa8
	.xword	0xaf209f609ba4b3c2
	.xword	0xf4014f28f54b84c6
	.xword	0x0c55bb35eb04b759
	.xword	0x33ee9ac08a486607
	.xword	0x5f9eb0c60c9d43c3
	.xword	0xb6454930fa5b3bb8
	.xword	0xb5b2ed3db7a0a035
	.xword	0xbf890e0c5c34b43e
	.xword	0x7fbeb77e02400c7c
	.xword	0xdad97b6143dfa6b5
	.xword	0xb48d755c4a7b8434
	.xword	0x972891b109faf0e9
	.xword	0x5bc0bd5c086ee2fb
	.xword	0x0b53663e7a76ec42
	.xword	0x1ee1763ed6789e8d
	.xword	0x805775f89d48fceb
	.xword	0x43012cdf066e50bb
	.xword	0x858c2f1864b3103c
	.xword	0xf658c22aad9ae7e2
	.xword	0x72da3e99671a4f82
	.xword	0x7e4e3ae2932b0817
	.xword	0x98b3643950d50d23
	.xword	0x9fd11c531e73a899
	.xword	0xacc6cbdf1febea8f
	.xword	0xa62565fbd8f0b3f9
	.xword	0x5f010b5b59a9b1a1
	.xword	0xd95257f8c209763a
	.xword	0xe2e83813ac179c9c
	.xword	0x4b8b6511ab812d38
	.xword	0xa32bda169b757a21
	.xword	0x4b518ff0b9b904b1
	.xword	0xc3e52ee0a1b95437
	.xword	0x977b368970983423
	.xword	0x0153c292404e8ac0
	.xword	0x2aa7633b6e7f76eb
	.xword	0xca22d165c7450be7
	.xword	0x19825c1e99ab8e7c
	.xword	0x1bc90e4129d24fe3
	.xword	0x39e6c0ae05973229
	.xword	0x4d4f6267c7fa42a8
	.xword	0x6635372e6953be1b
	.xword	0xdaa6cdaa582bed51
	.xword	0x23754c74935dcda5
	.xword	0xa3ec535dd9dd8e61
	.xword	0x3521ce0439239290
	.xword	0x8873660d353755ab
	.xword	0x579761be7ae72737
	.xword	0xfeb7b416eaa1a4be
	.xword	0xf1e57015f63c243c
	.xword	0x66eb4e398da6b7cc
	.xword	0xaaad2a055dea3a56
	.xword	0x8c36ca12eb6dc903
	.xword	0x851eb41c38fabc5b
	.xword	0x0a6493391b47e1f6
	.xword	0x25ed078e1ff7635f
	.xword	0xd27e8e8de4a55181
	.xword	0x3d44c0d3d257dce1
	.xword	0xd010179386327f94
	.xword	0xea3c5121ec364b79
	.xword	0x48b1199790440c7b
	.xword	0xcace5440c69e27af
	.xword	0x4f3ef4c33c32c08a
	.xword	0xe295cc642ca0be56
	.xword	0x5785dccc9a906f5c
	.xword	0xec8ff03bae86bda4
	.xword	0x9e9842f0a7a1457f
	.xword	0xba0bc22373031c22
	.xword	0xa08b7e874f541b6a
	.xword	0x5710232928886304
	.xword	0x0683ad86cd17e014
	.xword	0x18aa49cedaef6b09
	.xword	0xed1b73acb68933e5
	.xword	0x792919eb5b27a441
	.xword	0xf6f32d1b7d5a45ed
	.xword	0x14593358412098ab
	.xword	0xd54a88f332408e90
	.xword	0x7c9120eaf7b943e8
	.xword	0x071aef408ab042f4
	.xword	0xf3f64faabb46c1ab
	.xword	0x57459a1e9071ab3c
	.xword	0xc6402b8ec40390f8
	.xword	0x63f72c5a3f140bc8
	.xword	0x9c5df275a1aa200c
	.xword	0x25ba63cdf5bfa8a1
	.xword	0xe89c838048c96a88
	.xword	0x5ff06b1863b7e873
	.xword	0x01125d0372bb5507
	.xword	0x6557d489ad4151b4
	.xword	0x7ba91b46052721c0
	.xword	0xaa8e8af895a0d923
	.xword	0x438dd38c34e70794



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
	.xword	0xc3ac7227642a60dc
	.xword	0x203008142871c6d9
	.xword	0x549cf41df7742f1c
	.xword	0xd46934c0b798a82c
	.xword	0x404ac02f0532a7f0
	.xword	0xca478b0f42ef1d61
	.xword	0xd1ff0c7ca3b7fd57
	.xword	0xfc4603e1d06475a8
	.xword	0x2482f501a15c4736
	.xword	0x97ccd87f36723868
	.xword	0x323ae0ce8349885c
	.xword	0xd23ab9a0233d4dd9
	.xword	0xa2546eacb5dc6ad9
	.xword	0x2c98cad7b47df931
	.xword	0xa1e0809606c2422e
	.xword	0xacb63b44604f1113
	.xword	0xf773cc5208e7514b
	.xword	0x0970f9d60628695a
	.xword	0x6812fb943a0759b5
	.xword	0x488b05e58280c90b
	.xword	0xa029f974e509abdf
	.xword	0x4b289d889be4c731
	.xword	0x6e02885d602ce50e
	.xword	0x14629d9e160c8406
	.xword	0x970a402411378d65
	.xword	0xba7baae5d00ae78a
	.xword	0x3c81098c8ffccfe8
	.xword	0x2152061f199e8625
	.xword	0x9a8d3a8b48f945ca
	.xword	0xc6616a8c3198f342
	.xword	0xe6339c9e93201eab
	.xword	0x8c899771bf2ec7ff
	.xword	0xe240a18e405968c1
	.xword	0x3739e9b983417aad
	.xword	0x45790a98db428ee3
	.xword	0x75bec20f4449af02
	.xword	0x957c36436a94704b
	.xword	0xe9e5292cbdc8777b
	.xword	0x753bf28db8360de0
	.xword	0x2307ed79a355d24f
	.xword	0x225dc1d447e07fea
	.xword	0x1bee2f57b7d34ae8
	.xword	0x16f5c056c69b48e9
	.xword	0x0d502c7240215b68
	.xword	0x8ff3f873da290d61
	.xword	0x056436d05d0d2a66
	.xword	0x5cd8f5fb5d93fc11
	.xword	0xe49df23cf0811d10
	.xword	0x21e798a11149a372
	.xword	0x9eb69d2313290b9f
	.xword	0x3f06b659761346b3
	.xword	0xd145c192e83a820f
	.xword	0xad35fe56fe6a80bd
	.xword	0x4d1acfd212128048
	.xword	0x134d9499c115bf0d
	.xword	0xd55a690f29d2dfba
	.xword	0x23062688374e6417
	.xword	0xbd90cc72f6f39fd1
	.xword	0xb56853a1bc349145
	.xword	0xf3e3f53b73afb1d1
	.xword	0x9fc04dc3147d7392
	.xword	0xd5074f201066863d
	.xword	0x711e492537192007
	.xword	0x5f3e7e81b7c4aa98
	.xword	0x8cc166b00fa32a2d
	.xword	0xe8fb9f8e8a6e1d8c
	.xword	0x7a9d8bb668c1cda7
	.xword	0x42270f7a5860c96a
	.xword	0x074ea861221ffe0f
	.xword	0xf00393e02bbd8805
	.xword	0x4a092e5a2d93148a
	.xword	0xe3fb4ee429ebfe2d
	.xword	0x7330f8d2954091f6
	.xword	0xfbe153088ced8383
	.xword	0x13be47b5b9093f8f
	.xword	0x1e9b36c07fc4c04b
	.xword	0xced80616a0d9b82c
	.xword	0xe522bbbaab486b24
	.xword	0xbd001c0cffc42b5c
	.xword	0x14459fa1e4a0cc78
	.xword	0x4f3d4b4f8ec3d71a
	.xword	0x01724fd30329bcc7
	.xword	0xa33199f22b821060
	.xword	0xeb4635effbe8702e
	.xword	0x321763b675c49829
	.xword	0x6ec54c22ea2eba5e
	.xword	0xaaa667e3b41583cf
	.xword	0x2e9e7d1ca331f8b8
	.xword	0xeada7708538e4e78
	.xword	0x399369efbc7e7d17
	.xword	0x96cdbefb16075b88
	.xword	0x445a081e3b60ad43
	.xword	0x7513f55c9a542d22
	.xword	0x079893a661c10671
	.xword	0xaca0ab1daa72f63c
	.xword	0x78c6c374e712a34d
	.xword	0x222ffd49a0188fec
	.xword	0x87da98453e9dc54e
	.xword	0x525d47ea6af64a1f
	.xword	0xbcca98483543cb83
	.xword	0x774e8d601da01742
	.xword	0x267b1fb8d406cfde
	.xword	0xcac3741b0bd9817f
	.xword	0xa97422cc84acaeda
	.xword	0xd1a43c0e68d64c15
	.xword	0x63910c6e68b1772c
	.xword	0x7dd39c11e515247a
	.xword	0x47c64a18ca557fae
	.xword	0xae3b8250056d8c73
	.xword	0xe51baca3e1d22752
	.xword	0xf7e1654ffa096cd2
	.xword	0xbbacb5bac1776264
	.xword	0x41508cb5e547aa51
	.xword	0x7ae0ce27742676d8
	.xword	0x1e2455b9455dd1b2
	.xword	0x934bb8e5ca9ee45c
	.xword	0x6cd510eeabcba186
	.xword	0x535feb275cb39c59
	.xword	0xcfd9c7ded62db853
	.xword	0x7599105d7fda23b5
	.xword	0xc547ca203990c48d
	.xword	0xc43c26a45042d3e5
	.xword	0x16d4ca9fb7210df4
	.xword	0x9d7faa2ee9889439
	.xword	0x60e3f1cc290e76a3
	.xword	0xa3232c5bda9448e1
	.xword	0x29d9f364ef9f8370
	.xword	0x78bfabcbd00564a8
	.xword	0x350ec02ab4273de5
	.xword	0x43e5c0d5d9eaad0d
	.xword	0x2a5d72d7c6bec5a2
	.xword	0x08dce532a0614613
	.xword	0xe4739b8a961237de
	.xword	0xa7b12d02717d9718
	.xword	0xc060651a1ec0700f
	.xword	0x0d67c51e668f0110
	.xword	0x8a13d3a93562e1e0
	.xword	0xb893f126287952d1
	.xword	0xcdb653908556bd76
	.xword	0x04f58b4e989a0bf2
	.xword	0x7c28f0072041ef2b
	.xword	0x8dea1fc537b74bde
	.xword	0x68a4daa0c53e0001
	.xword	0x6502c4d792185996
	.xword	0x70d086b8ae1f61e6
	.xword	0xdb5ed42dae40155d
	.xword	0x94171c54ed7c989c
	.xword	0xd5dc8524ceedd763
	.xword	0xa332cb49e5ce9269
	.xword	0xcd660c7173d87b5f
	.xword	0x67475feaef78d874
	.xword	0x7baa588f9882dad3
	.xword	0xb4641357ea81e9a1
	.xword	0x1a3c77786aad7489
	.xword	0x79a4afbf60d2b23c
	.xword	0x92c74dedfcfd8759
	.xword	0x3ebe055398b0a219
	.xword	0x00f38631405e9086
	.xword	0x61c3635cea14872c
	.xword	0x882ed22cafd1ee5b
	.xword	0x34d97134b464ff44
	.xword	0xc5ec258dcd8bf764
	.xword	0x5b97fc6c5a512ab0
	.xword	0x8ae26e3e4bc29c52
	.xword	0x4aca43e507fdc6ef
	.xword	0x01acd3d31e2227d8
	.xword	0xf146cc83d2183895
	.xword	0x5278edae6d778b96
	.xword	0xea088c832a07cc8a
	.xword	0x245ac216b24d7102
	.xword	0x4887de1334c1197a
	.xword	0x960a7200469389ee
	.xword	0xd91cbdb28a8bd4c8
	.xword	0xacd17fbaf04289c1
	.xword	0xc995a73da6c08e72
	.xword	0x41736af41b73e1ad
	.xword	0x6211e8cd5478d9ad
	.xword	0xf2350931f05f2ffd
	.xword	0xf9c861f7bbaab4bb
	.xword	0x347175c7c1aafa4f
	.xword	0x9856b8e0a4ee45a8
	.xword	0xfcc6f779db77e63a
	.xword	0x03aefcfc4c880c19
	.xword	0xdf594e3b92f1b227
	.xword	0xdbb24ad1db719a16
	.xword	0xa28f34aa0f9de788
	.xword	0x712f6f73074ede89
	.xword	0xbf006255ed50aebf
	.xword	0x01f268627ca1baf0
	.xword	0x6648b0a92d49ec4f
	.xword	0x9fa1eacc95da53a8
	.xword	0xc2ca9c2676838795
	.xword	0xfe54dc8b46c70273
	.xword	0xe5593d8679894a0a
	.xword	0x0db86012077b3c5c
	.xword	0x3f79dd7c08b50b59
	.xword	0x7f8867a6a5a97a77
	.xword	0x99b4a24987242238
	.xword	0x85ae6b3d45c000fe
	.xword	0x9ab381f331084a01
	.xword	0x6f39f7fd5d0ae188
	.xword	0xc4848b8e13f3774c
	.xword	0x98b3532ab636f1e0
	.xword	0x2033941caeb8df39
	.xword	0xfde8e9c56fda47a6
	.xword	0xcb970d9d7e852ef3
	.xword	0x2e6101349a30291d
	.xword	0x7cbd8e796a29c43d
	.xword	0x2d2af46a01f5cc3e
	.xword	0x170357aa3562f37f
	.xword	0x8ed5faf6bbe3d90f
	.xword	0x33b0f0ef6616b3d9
	.xword	0x62f7e04cfeda2517
	.xword	0x2c8e802106d15ae0
	.xword	0xd39678ec32264d21
	.xword	0x191cf6cb67f927d1
	.xword	0xda0210106b15f55d
	.xword	0x17d8616d79627d48
	.xword	0x59f1a4012c8e5539
	.xword	0xaec76ad0af727805
	.xword	0xde3b892b3ce1a331
	.xword	0x91715e4999e38b27
	.xword	0xee1514f5fef8e8c1
	.xword	0x5728a4497374aefc
	.xword	0xf1c880eca97997a2
	.xword	0x8e37832169833765
	.xword	0x10517a5074969a7b
	.xword	0xb8b237e59a791972
	.xword	0x6321a604c7d556ef
	.xword	0xd08ae5f955aff722
	.xword	0x553b01d15af6f373
	.xword	0xaf6216d787757821
	.xword	0x35b5269275a9ba4d
	.xword	0x4c10766c461ceb93
	.xword	0xe8b3ca14a2234835
	.xword	0x93d1b894f2c48a67
	.xword	0x1591ccec8e119481
	.xword	0x69d4dae215eba240
	.xword	0x739b19f3e64b60f5
	.xword	0xcecc598c44c7c67a
	.xword	0x8eccff57fc508d50
	.xword	0xcf9151cbfb3142bd
	.xword	0xdd02519aac68d1c7
	.xword	0x16b19d536e17c497
	.xword	0x7dcadcebda5a523f
	.xword	0x08eacc02b415502d
	.xword	0x7fea9c0e6bdd4579
	.xword	0x323912fdacba13f1
	.xword	0x0f313eb6432fb10d
	.xword	0x1b77bf66bf3ac845
	.xword	0x08dbe9e1e04d5aa4
	.xword	0x307db4839ec66f92
	.xword	0xacf31a698c88320f
	.xword	0x67b58a9ff38ea09e
	.xword	0xa099aed7cf9c610c
	.xword	0x20a0dddee8bfc5d3



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
	.xword	0x40e5a9892d5ed54f
	.xword	0x0c413777b4dd981d
	.xword	0x4209dbc306036d47
	.xword	0xf573655876f56139
	.xword	0x130214ec7629dd5d
	.xword	0xd72ab5f29ec40674
	.xword	0x6149cd89501dd4e1
	.xword	0xf1041d9e39b7a3da
	.xword	0xe9580dcb55066bb4
	.xword	0x625a60361d4b0d4d
	.xword	0xcaf5e4dbe9abc684
	.xword	0x1591d4bd1ac64d12
	.xword	0x9405ec5c11f52646
	.xword	0x14ba271a939b4d28
	.xword	0xc5c78c9f8db5cb18
	.xword	0xd1ebf1795159dd65
	.xword	0xefea335638934d70
	.xword	0xb5b2432b7e4e0e72
	.xword	0x4bd4db8d70d63949
	.xword	0x6321fdaf505dee29
	.xword	0xb0a084fc75c0fc53
	.xword	0x3eb8d5b783335023
	.xword	0xa71fc57aabb81cd8
	.xword	0x6d625424fc2454e0
	.xword	0xccca775b05f8033e
	.xword	0x793596ddf91b9eae
	.xword	0xf584c19e3048ba5a
	.xword	0xe1532b291be54949
	.xword	0x8719cf31c65a9094
	.xword	0x9388cc31d1fca345
	.xword	0xebe20db959b747ff
	.xword	0xe0c0b55922692c61
	.xword	0x5ba3be9fa5434ad4
	.xword	0x7b8ff1e077768d1d
	.xword	0x285fd09969cb104f
	.xword	0xfc35af7ab0650302
	.xword	0x0fbb282e357899c3
	.xword	0xa02515c5b4b0a6cf
	.xword	0x6b500477a6dc8239
	.xword	0x28103d8d6df5de0b
	.xword	0x49b8e096d9a1ad86
	.xword	0xc1d939c48ae21742
	.xword	0x5fd434647817009d
	.xword	0x38ba9757e9b6f1aa
	.xword	0x55d27532611fc139
	.xword	0x0bbaaa81dd58faaa
	.xword	0x217893d62f0fa9a7
	.xword	0xfbb3bf60142e8457
	.xword	0x60c0d6a922bcdaf6
	.xword	0xc5176ae0cf727f12
	.xword	0xcce949fe94a80e29
	.xword	0xeac676e296741feb
	.xword	0xbead441ec082a497
	.xword	0x5798e759f95a6fe5
	.xword	0x80fa788c2e680e7d
	.xword	0x1187a861cdbf3ab2
	.xword	0xfe400f52148fc24c
	.xword	0xdd0f49d430124e7f
	.xword	0x41994276665f5727
	.xword	0x70e5a8eb37a95ec1
	.xword	0x9fc9613f4fe724ed
	.xword	0x16471c258b2063ab
	.xword	0x6bd4dc3f5adf4c8d
	.xword	0x4e03ab7c54a356d2
	.xword	0x82c3e528fe99df6a
	.xword	0x461ee5c197c69e4d
	.xword	0x79b0860a6965ecf7
	.xword	0xb189522a3f3e7b83
	.xword	0x66e87fb234f8c250
	.xword	0x6d81ccfc91e45f74
	.xword	0x6cef7482c0df1752
	.xword	0x92595519eb270d36
	.xword	0x82572ec439387c91
	.xword	0xdadba885fb3757a3
	.xword	0x94cf58b212b9ae02
	.xword	0x9a0096797061190c
	.xword	0x1b153d2d57b8b08e
	.xword	0x0eb3f54f3e180ce0
	.xword	0x74a03d9457b4749d
	.xword	0xadb62fce208a2633
	.xword	0x0fb35a188812e355
	.xword	0x9c7ad345816e9294
	.xword	0x44999035f4dc98f2
	.xword	0xaaf6fc2bbcfab407
	.xword	0x41cbffb2c770a62f
	.xword	0x8bfbecf867a0313f
	.xword	0xca0c54e6e4282b7c
	.xword	0x8bd16e3bd45c8c5b
	.xword	0xeac7c59749d60d0d
	.xword	0xbb8c4c79b85d12a0
	.xword	0x45a4cf93cc40939c
	.xword	0x75cda701cb0ce3ce
	.xword	0xb8ae7569de32ca02
	.xword	0x0eb22bee0c6a0c61
	.xword	0xf54d50325b6a5b5e
	.xword	0xc4568a2d9de2dc62
	.xword	0x486608ddd01507c0
	.xword	0xa0067309e50d7293
	.xword	0x7fcfe8e7d396efb2
	.xword	0x212ebf36dc43321e
	.xword	0xea713dc9311689d7
	.xword	0x04fed389743ff138
	.xword	0x7049acc50eac3ccd
	.xword	0xd1ba32ef0287a3d1
	.xword	0x8022e10c03d83d7b
	.xword	0x65793883dd10b03c
	.xword	0x3744f7f17d504adb
	.xword	0x0759cabf6813e377
	.xword	0x77e8ded4c0636979
	.xword	0x53ee317acd28b728
	.xword	0x41f3057b1c163891
	.xword	0x56396b34c4b69b22
	.xword	0xa9284b7303344873
	.xword	0x03a8ec9fccb5ff28
	.xword	0xd8de169d1cec06fb
	.xword	0xf388acb69ffdd422
	.xword	0x7ca80f05de7c7114
	.xword	0xfb42217829b99959
	.xword	0xec81bf5af438d1cc
	.xword	0x9d6922669a6f4398
	.xword	0x209e840ebbf55df6
	.xword	0x76f902835240b5c1
	.xword	0xd6e3ca36b6568542
	.xword	0x3cce2a008228ddfa
	.xword	0x70337c99b45d3a2e
	.xword	0x00ea793ca61bec33
	.xword	0x4da9ae6cf8149243
	.xword	0xc7c22336c2e74a82
	.xword	0xd84e387e5f22c2fb
	.xword	0x824cd12e91022a8c
	.xword	0xbabdbc3a59e4c6c4
	.xword	0x58910c6db327d8e1
	.xword	0x92760ccff06585b6
	.xword	0x308053031a3db493
	.xword	0x6f215217fa3cc582
	.xword	0xadb02d5413f851db
	.xword	0x2c5a6d01133dfd42
	.xword	0x4c0e1513bc5969d7
	.xword	0x1f1592167c07b110
	.xword	0xe8ed816f58f1d9d7
	.xword	0xd96d15023c33a91f
	.xword	0xdd69a106ef6dbb19
	.xword	0xcea908b2eefbf891
	.xword	0x22318ea56184b1ef
	.xword	0xf36d13131f046b44
	.xword	0x0b808a89def3709a
	.xword	0x473dfb46e54ddd87
	.xword	0x5907502483c6b32d
	.xword	0xa5cb8c65781e25cf
	.xword	0x17276e231c450828
	.xword	0xbe73c985d1205f75
	.xword	0x5166bbefb4c6c3f8
	.xword	0x1a9f75e77ef71aa4
	.xword	0x6e7009e7a7fbbf09
	.xword	0x2c4d1a4abb44ef43
	.xword	0xbacbcabf0e8acbde
	.xword	0x7c4c9000f8257089
	.xword	0x61d1d915e29d18dd
	.xword	0x833d5d5dde3f6eb6
	.xword	0xe8a3732c9fb48760
	.xword	0xec181bdc5607bb31
	.xword	0xa1d25de31cf536a5
	.xword	0x8ad68e368cf04cad
	.xword	0x591e176a11eaf16b
	.xword	0xf1f5ae097de28996
	.xword	0xd768fb07040aab0f
	.xword	0x88aee4cc7cddc541
	.xword	0x33b32f5f219850cb
	.xword	0x7b0d796e9fd1725a
	.xword	0x30ca13354c3e94a1
	.xword	0x72b50d8f515e43df
	.xword	0x8b18405eef69bf02
	.xword	0x6b28a74bbf503de8
	.xword	0x1c8f2d9ae5f93a04
	.xword	0xa53e2c0c8ff89283
	.xword	0xf0fd1a68001aae57
	.xword	0xa53d2de7680fc3ef
	.xword	0xe97a33cb90ddb8a5
	.xword	0x02bf23b480ba9f73
	.xword	0xde31504fa3e920c8
	.xword	0xa0cf695c8d98f759
	.xword	0x91e4def0a1a69863
	.xword	0x57ef73d1448d4415
	.xword	0xc0c7995c943553f8
	.xword	0xc881125bb4c95f2a
	.xword	0xecd47344bd14afbe
	.xword	0x8b693e9c5e070841
	.xword	0x30bdb3457e3430f8
	.xword	0xd503b574679330a4
	.xword	0xe1a269d7bc6bd0a3
	.xword	0x90292cd92615dfd2
	.xword	0xae1d3be3a05aae53
	.xword	0x529fa9030abbf3e3
	.xword	0x7dfa69cf2fc7a930
	.xword	0x87433f3fd41487a4
	.xword	0xeb4e19cf083e5fcd
	.xword	0x9ce7da0bedeafa70
	.xword	0x1df180194f74c1d2
	.xword	0x712a56808195fc83
	.xword	0xb883970c1e493e97
	.xword	0x6869b87fc673978f
	.xword	0xefcf63f4c7e0d592
	.xword	0x379a3e1b11f3fe86
	.xword	0x32e44f76ff5ac273
	.xword	0xf2ea8324c614bc57
	.xword	0xd79997226561e5ce
	.xword	0x894ddd609319fca1
	.xword	0x36d9388dd4786596
	.xword	0x0422ee301c671add
	.xword	0x88d58cb16d1bff61
	.xword	0xbdb321bbcc3b99f1
	.xword	0xc95846d3d138ee8c
	.xword	0x4448ca6cca346890
	.xword	0x1765595413baacf1
	.xword	0x1e2dc1ab22191680
	.xword	0x0410f0356daafcac
	.xword	0x40b1f8ebee264ffc
	.xword	0x05003830e8a0fb4e
	.xword	0x4d8700f689bf4063
	.xword	0x5fbdccbef4bceeb0
	.xword	0xd9dd796309d91b69
	.xword	0x4e5765536b752202
	.xword	0x46c40ed58f3e80a3
	.xword	0x0aabddec6b5f4409
	.xword	0x2c3ad8a03fff6753
	.xword	0xd09c1ca7882f0286
	.xword	0x4e48c7a459aaf786
	.xword	0x5f1af76a76667dc0
	.xword	0x757891c1aa810584
	.xword	0x592e194cab7e7efb
	.xword	0x13de791186a5362f
	.xword	0x6ca92258dbc32f97
	.xword	0xf9d78821ca534e35
	.xword	0x2f8454403698d83c
	.xword	0x0c1df8a50dc2461d
	.xword	0xd5add9730cbd6195
	.xword	0x95de56fc6a1183b8
	.xword	0x9a281f369171ad66
	.xword	0x6faa34876ab6864a
	.xword	0xa97b7010d206a6c2
	.xword	0xd5650cbcdb0f8997
	.xword	0x3e309dfe7f02fe44
	.xword	0xb588bc2121e0a966
	.xword	0xc5f96c267924d04c
	.xword	0x9993969147d9c171
	.xword	0x59ee8d484ab5fe7f
	.xword	0x797f9f20b1077e91
	.xword	0x6ea88049a3f6766b
	.xword	0x930f7058c63c97eb
	.xword	0xc7fe0c79aa2db45a
	.xword	0xe5ac31399b48d8f1
	.xword	0xf0de95dabf960af5
	.xword	0x4319a9eeef4f3c27
	.xword	0x9c6cf819ad7a7dbf
	.xword	0x6772feafdd910f30
	.xword	0x2aa29301c4ba4533



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
	.xword	0x3132f5aea117c3cd
	.xword	0x88b8d499d31d7039
	.xword	0x5112c2617c4ba0d4
	.xword	0xbd9e539f756f53c9
	.xword	0x1d648035882913c5
	.xword	0x2bae0b897206cd54
	.xword	0x4fb7c5b4296ad031
	.xword	0x73183aa0e16aaa18
	.xword	0x51dadfdefce0be33
	.xword	0x28eca1095d12a1c1
	.xword	0x3de9758ecdd486b2
	.xword	0xdd860f052add6921
	.xword	0x3701c5defe3db8ad
	.xword	0x80a0e0a5ccbc2389
	.xword	0x954bcc1929645f49
	.xword	0x1870872d3a848b59
	.xword	0xa7c3b934e43af312
	.xword	0xa81808242b69945b
	.xword	0xb1ab35ce8e190a9a
	.xword	0xb02d7a7ec779e18f
	.xword	0xc2edae0bfa135a98
	.xword	0x12a60aa8471b4a58
	.xword	0x8b7493a99afd13da
	.xword	0x7ab8bf313cdf7add
	.xword	0x101c3f5b5b32a81e
	.xword	0x552c2e87c838dedb
	.xword	0x1a8559a49cc20cd7
	.xword	0x91570d2f26e01bd7
	.xword	0xfe5616f226d7f29d
	.xword	0x7d8cccd84b5e2a4e
	.xword	0xa6b734250f4a7d06
	.xword	0x0ef99ca8a64f47db
	.xword	0xaa285c9cb2b078d7
	.xword	0x4f5e26367ed97bb7
	.xword	0x5897b812476d6bba
	.xword	0x2984a224257a9555
	.xword	0xef73a608954d810a
	.xword	0xe02b2fd8b3efef6c
	.xword	0x503db78dc7744321
	.xword	0xc3cfe67fee9ac1ce
	.xword	0x88ca912e84fd3885
	.xword	0x569c4d09ca32b3ea
	.xword	0x2aee847fc9ce3b92
	.xword	0x99896c80e294a775
	.xword	0xfce2fbfdcc037037
	.xword	0x2b037d42640a39cf
	.xword	0x5e10adba8a47c71a
	.xword	0x1aeeefa4395e192c
	.xword	0x54beed3fbda83022
	.xword	0x9c932039c2cd3b8d
	.xword	0x592a7de906a6b73b
	.xword	0x329d69fa282e53e8
	.xword	0xb112272cc87e6d55
	.xword	0x0597a699894ae7b8
	.xword	0x9231a6133346a03b
	.xword	0x57bb3d5dd1747833
	.xword	0x4547f875d0ec5805
	.xword	0xd871cd65b4cb3e30
	.xword	0x5cdc94a9ada8645c
	.xword	0x7ae8d904e6d396eb
	.xword	0xf665525d9057494d
	.xword	0x2381475f92f61365
	.xword	0xce02725505c17cdc
	.xword	0x32df084c86d40379
	.xword	0xb337fd9f69b360d8
	.xword	0x62eb250abe5cd069
	.xword	0xd9798b8cf8890f7d
	.xword	0x66753edc3e9e4339
	.xword	0x260c94bf9ed76639
	.xword	0x0decd2e0c23c6b9b
	.xword	0x7494cfc3b99dfa3d
	.xword	0x5ab9604cbd969bae
	.xword	0x60a43132d4c8782d
	.xword	0x75255cd02b7351e9
	.xword	0xa3ae6ec9d600a092
	.xword	0xd0745d7a620ef7c9
	.xword	0xefed272d03025945
	.xword	0xba767496ea65d97c
	.xword	0x08b7f329513e8462
	.xword	0xcd0b37e97e98f8f9
	.xword	0x2c826663a5819216
	.xword	0xea93316d3cdfe02b
	.xword	0x3e19c28d48a2dd12
	.xword	0x8e22f9e11c16ee83
	.xword	0x22419f0811092341
	.xword	0x6a0ef448a43ba99b
	.xword	0xac553981c8d786eb
	.xword	0x3de552aadb878457
	.xword	0x7defae7fca5a38fa
	.xword	0x475a103040fa85b6
	.xword	0xc904290aee072025
	.xword	0xf80ccd8a64691aed
	.xword	0x4ee6bba3453c28d5
	.xword	0x74de6ebe2f5f8a2e
	.xword	0x2b1c75cd2849e7a7
	.xword	0x226e991733b56444
	.xword	0xa49e4e0fb6766ffa
	.xword	0x656a9067ea26f964
	.xword	0x8ef40a96f32d54f0
	.xword	0xb180aacb492ab8a3
	.xword	0x60a93b2c22dbb643
	.xword	0xc85b623f1d861283
	.xword	0xc6ddfb1b527b2b1c
	.xword	0x338b0fa1620b47cb
	.xword	0xb32c4b93cfa031a8
	.xword	0xc967d11c86075f11
	.xword	0x882452e6da92af69
	.xword	0xe15e8ce0e4a0f5c0
	.xword	0xf10457e841177840
	.xword	0x341cd127ab967dfb
	.xword	0x3bf63971d697ce23
	.xword	0x008e928fd7a3adf7
	.xword	0xb50c1e69edb7ff87
	.xword	0xa021d997b2521912
	.xword	0x1017131fe0336365
	.xword	0x0a26309c5f81e6e6
	.xword	0xc549b2756cbaae09
	.xword	0x6ff477af9034e777
	.xword	0x972058e2bc7a1516
	.xword	0xc94876be6c36c10c
	.xword	0xc3452a8b36b1b89b
	.xword	0xa0c041d6f48fc6bf
	.xword	0xf07e6948fb35991c
	.xword	0x2dbe07727ffcef5e
	.xword	0xe84dbef58d20e444
	.xword	0xc6b290fd932f1cca
	.xword	0x73638986e5d4d641
	.xword	0x0b8e19beac7fe6e6
	.xword	0x9b4dbc4563cefd99
	.xword	0xde6473ed96651577
	.xword	0xb0324a1bad14f376
	.xword	0x7410d771014042ea
	.xword	0xe342544600e4ca0b
	.xword	0x6400b83a56a2d495
	.xword	0xbf01959d7dd65b87
	.xword	0x20c9465df5cddbef
	.xword	0x45594759fb866dde
	.xword	0xcea19002c362619c
	.xword	0xbb622df5935aa114
	.xword	0xbc9fd536fcfc2e66
	.xword	0x057d5f021c04d984
	.xword	0x46beadf5abead83b
	.xword	0x7a1058b145abacbd
	.xword	0xe042d12390d50988
	.xword	0x9e174ece84830242
	.xword	0xeeb85d5cd7ca39be
	.xword	0x9c936f18c137fdc7
	.xword	0x03db00f573e3fc12
	.xword	0x7ff417985ae8fc62
	.xword	0x5ab3243ee04baf63
	.xword	0xa8b6e55ab9058158
	.xword	0x22006b8ee02c9c77
	.xword	0x54427cc0f6028f12
	.xword	0x349d2b8ad9bb682d
	.xword	0x635e21744d1ecc09
	.xword	0x6d7d5754c427bd79
	.xword	0x72a550c233438e0e
	.xword	0x7f293e860a33aa27
	.xword	0x08ea996f4bc71be2
	.xword	0xdab1af08e56293f4
	.xword	0xfafb351d1305a00f
	.xword	0xaf9eb77e844b38f2
	.xword	0xca0c4c75dca8695d
	.xword	0xee466b06a627520a
	.xword	0x4a1d137476de398e
	.xword	0xbd764ab58edfa4d9
	.xword	0x6d9c512df22189f6
	.xword	0xbddc4a0fcc9baaaf
	.xword	0xee865a5b781cbca0
	.xword	0x454b6db705f162b0
	.xword	0x2f6a0356de514788
	.xword	0x3c7078dee9379989
	.xword	0x5a235fccebea63d7
	.xword	0xeb5fab8ca44a4ccb
	.xword	0x49e2b8292796cbcb
	.xword	0xb93e568f921b53a5
	.xword	0xdf648469ba1754b9
	.xword	0x93e88600edcee6a9
	.xword	0x7bb22e16e999544c
	.xword	0x3c994eb213c8bafb
	.xword	0xf4cf174b95398ae2
	.xword	0x763f7230d8c922fd
	.xword	0xbc3519bc69a00e6c
	.xword	0xf94afe33448c5e3a
	.xword	0x8242c6402e5a6f86
	.xword	0x05acf8778f6596fe
	.xword	0xfc56bf1172703c1e
	.xword	0xf9093866b24c629d
	.xword	0x0200e37077316771
	.xword	0x888093be09cbef41
	.xword	0xc73732d701d7a239
	.xword	0xb41be7d766dd51cc
	.xword	0x70f0a653ad0fb8f0
	.xword	0x1a6b933555c580fe
	.xword	0x428c1ca74968ef5e
	.xword	0xfe5b67979d3990cc
	.xword	0xf9f0d013eaf7da95
	.xword	0xc1e82e50baed6393
	.xword	0x5c283196eca3a1ac
	.xword	0x82f8867b1bc4dc18
	.xword	0x14559e9c86ec7145
	.xword	0x2a220108b420f6ab
	.xword	0xa359a3d63df78096
	.xword	0x166fbbf9dd7c994d
	.xword	0xa69d7e281a4de40e
	.xword	0x9b8266138a1dfb8d
	.xword	0x96dd39c5ecdea248
	.xword	0xdb7dd19f439e1e05
	.xword	0x83e83244a0c15eea
	.xword	0xd79e6043b7e8cb9a
	.xword	0x49bc5c5306a2c946
	.xword	0x3d93371a99fd5838
	.xword	0x6250699a2f507d83
	.xword	0x4d182574de2cc9e1
	.xword	0x8e3b76a29dc0f0ca
	.xword	0xbc34b32722135310
	.xword	0x109b23996f197a8f
	.xword	0xc82124333983a352
	.xword	0xadd7bba5e8c45e23
	.xword	0xce32460056ee5420
	.xword	0x7d2753a6051e0a66
	.xword	0x866cab736705742d
	.xword	0xee43a853945a74ce
	.xword	0x2ccb179e5a734d7c
	.xword	0xd35a8221e982dbac
	.xword	0x8bef77d38b17c161
	.xword	0x45b7ee46cc3b7a32
	.xword	0xe83c5ba3aec641f1
	.xword	0xa4f0ecdc388ad037
	.xword	0x1909ba4313f2ea10
	.xword	0xcf11757b29b82555
	.xword	0x1d7cb3a1bfb6c012
	.xword	0x646946c3f4033b1a
	.xword	0xa57ae37e8f5844bf
	.xword	0x490e0521808781e7
	.xword	0xce793251746420b6
	.xword	0xec64711889a58dd1
	.xword	0xee4fa6ff8f22851b
	.xword	0x9d11d17f33e06199
	.xword	0xb3c2f63988e40ad7
	.xword	0x8b31d355ebe97bd4
	.xword	0x69e55cdc339f90b5
	.xword	0x8b0b8b315651c920
	.xword	0x263cc7e193c43d56
	.xword	0xd243f280642199b7
	.xword	0x567dbe30e558718e
	.xword	0xd4adbd6122a0f05c
	.xword	0xff4bfdf8161f5d96
	.xword	0x26f99fede3548551
	.xword	0xd8861c4173123d44
	.xword	0x8c7732abae983c76
	.xword	0x859d444a370f64a1
	.xword	0x41e33de813042084
	.xword	0x48a48652da60a023
	.xword	0x5786c97126e75f77
	.xword	0xe32c87104c56081d



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
	.xword	0x702577f489523fde
	.xword	0x4c6dd618d1462258
	.xword	0xe845b4bfe6ee2fa9
	.xword	0x0906327f4f04f5be
	.xword	0x70dc10e0963bf610
	.xword	0x333427b2856da3aa
	.xword	0xe815935074689bd4
	.xword	0x7045ba625f3bc774
	.xword	0x31a21596311c73df
	.xword	0xf6ffc3bd9c6da8e6
	.xword	0x22eb999dd876bffe
	.xword	0xf843ec83c1375c3f
	.xword	0x2b49bc23d942a5cf
	.xword	0xd5bb7419bdbeb6c1
	.xword	0xe89ab14ad9e94130
	.xword	0x160916f039a52ccc
	.xword	0x38c864b26c94e69d
	.xword	0x3f8d3b894a7922e0
	.xword	0xf390ad828ec120e1
	.xword	0xd04b42d410ee23be
	.xword	0xd524e8611e7d1a20
	.xword	0x4c80f1ba1679cce4
	.xword	0xefdd512e4de122ee
	.xword	0x8db394f4fbd2c4b5
	.xword	0xd989d3a7101de290
	.xword	0x7b22172d24431306
	.xword	0x0b7b58be3b944ced
	.xword	0xe0f758d251a19003
	.xword	0x88e462662f433386
	.xword	0x1c949369fce34656
	.xword	0xce75cc9c9345e583
	.xword	0x4c6d0a1b0ab49996
	.xword	0xe400541cc26b83a2
	.xword	0xddd965bb9ab5393e
	.xword	0x29af234597fde291
	.xword	0x88a5db27bfe676b2
	.xword	0xafb0cb11f02a210c
	.xword	0x24c1f155a31c979b
	.xword	0xc702eafe53837563
	.xword	0x7706305840902f41
	.xword	0x9dc3e754578e47d6
	.xword	0xd3ce71fe3ca545f7
	.xword	0x553363bd21ec9bb3
	.xword	0x2938978c6a177ec5
	.xword	0x7d0ea6dc570b3399
	.xword	0x4c6cdacb4c7ee9cf
	.xword	0xd9ede6624dc15c21
	.xword	0x5a08e4a0dca7d37b
	.xword	0x95a2f072a3e25c18
	.xword	0x75257d630801c8c3
	.xword	0x03495bddddbbaa0c
	.xword	0x1b746a03ce441194
	.xword	0xb18beef830f1b61d
	.xword	0x4e53671e4ac73c9f
	.xword	0xd543753729f746e8
	.xword	0x49c11458260d6eb3
	.xword	0x1f2c4fc512f237ad
	.xword	0x271d520cb4dd56ac
	.xword	0xb024872ab4befee5
	.xword	0x326cc4e774a3e242
	.xword	0x26bbfbafe7430db8
	.xword	0x94ab54c98b5478e6
	.xword	0x7d3d86d29c8f658b
	.xword	0xe099255ffc1b88bd
	.xword	0xe3b680c672343ec0
	.xword	0x956132a7ca3947f8
	.xword	0xcae18c2cdf78acf5
	.xword	0xa2108fe75efe7f26
	.xword	0xf7b95fa7b5833570
	.xword	0x474c116fac24e2ce
	.xword	0xd36e27d0dc4643a0
	.xword	0x0355f03dfae70c6e
	.xword	0x86de1c43ff1035f4
	.xword	0xa22b4c009ce3e5d9
	.xword	0x39e8c56406c750cc
	.xword	0x79d3f4eb821466be
	.xword	0x9bcabfe6566edb12
	.xword	0x0681229d3fba40ff
	.xword	0x5d442d50065af021
	.xword	0xcce994c0c23843f2
	.xword	0xf45bd7277d241c14
	.xword	0x6cc962771c71c765
	.xword	0xd626a44eca02b56d
	.xword	0xa1c1811a6284c38b
	.xword	0xe47f276559feab6f
	.xword	0x76024033bc0205e8
	.xword	0x4b63c6bdb86e2359
	.xword	0xa3d12d6a92e24578
	.xword	0xaf03db14083c4b06
	.xword	0xf1042a6b5322c797
	.xword	0x4b6339a03e3f1899
	.xword	0xff31bcadae57fba4
	.xword	0xd5b9836935cb5999
	.xword	0x4715ecc1c68cd042
	.xword	0xc5aa651ee9de60e3
	.xword	0xb238666ab9e4204c
	.xword	0xfc8d17e6bd80ff03
	.xword	0x91b322fa2073aeb6
	.xword	0x00c2b0e332429a89
	.xword	0xab36ea362afd282b
	.xword	0x1bbf9b877d626c0c
	.xword	0xe61ac5247444a8ea
	.xword	0xbce767ce64ad663e
	.xword	0x0449cdc29e76af80
	.xword	0xa61276d0d48e4443
	.xword	0x995ee056da3936f9
	.xword	0x9ff0b407a53a7e45
	.xword	0x91226aa908b0bb26
	.xword	0x8e9b24edcada117a
	.xword	0xc98fd000c05ad274
	.xword	0x5f35df0caa84ff7d
	.xword	0x7e5f1a71c0947457
	.xword	0x4ea208bf6e670662
	.xword	0x6528d07bf45caf67
	.xword	0x7132a6da82c0ac66
	.xword	0x4c8a121c0f47a842
	.xword	0x13fc22aaccf35120
	.xword	0xfceacde7ed2a9711
	.xword	0x5a5d71cdaea85ee6
	.xword	0xec928eeb60b33bd6
	.xword	0xfaf169f3bc14f769
	.xword	0x93f8a57a6f1f1936
	.xword	0xcdab91e6f85cd3f0
	.xword	0x642dd07468f3252e
	.xword	0x7af8c9892f1f32af
	.xword	0x41dada806e23ca34
	.xword	0x0a3e4e11c94b6785
	.xword	0x0e4300c2c3aa120b
	.xword	0x8d6f135c09aa5b39
	.xword	0x3a59e03476781799
	.xword	0xeaaffdc694cc647b
	.xword	0xdb26b09a5c7ca894
	.xword	0x77b9ea2c39532534
	.xword	0x6cac528be4564c9d
	.xword	0x42758998fb1d71ca
	.xword	0x836014e2c4719d9f
	.xword	0xd3f733f741f0cbc9
	.xword	0x5ad7c5f577199df4
	.xword	0x06baa61fa565e243
	.xword	0xfe8fc15c7be86c17
	.xword	0x8808e0eba06e1e6c
	.xword	0x71c2de4efb022917
	.xword	0x20c3112cc33e5bb8
	.xword	0xeb0331a7f474d2a0
	.xword	0x98e8d956c0205765
	.xword	0x6a23c834f92517d8
	.xword	0x02c4e6dc3714379f
	.xword	0x350e39160761ea8a
	.xword	0x2f42eb55d2f3383b
	.xword	0xa35a9913b36b7263
	.xword	0xe22e97278e33fd30
	.xword	0xbd17597fa0c0f48c
	.xword	0xf4c89df8fb997801
	.xword	0xce6bb8c580da027b
	.xword	0x238cc7624a42dec7
	.xword	0x54a348a15d004368
	.xword	0x58ec2fa14fc1e089
	.xword	0xcebb10be3ff62fc5
	.xword	0x5097be01e2919029
	.xword	0xf9f37c6a5d762a50
	.xword	0xd165228f609d2a03
	.xword	0x29bd85c9a9e8fd2b
	.xword	0x502214276d6a8eb9
	.xword	0xdf5f2e32840e97e9
	.xword	0x7906f0de9302a633
	.xword	0x549839a4cdbe2dfa
	.xword	0x1d7cfe87c0fd42a6
	.xword	0x325bc56862c9067c
	.xword	0x9b1d52f0f85f4e80
	.xword	0xeeedd0af4deb7af8
	.xword	0x71623a799d5ac78d
	.xword	0x4a239ff34a6b6669
	.xword	0xfa7689545e2354bb
	.xword	0x8a90887e1b2c05f1
	.xword	0x892e683dd242733f
	.xword	0x8773e499ea99f79c
	.xword	0x91cc6b95cab76b64
	.xword	0x301cfc7558b7fcd1
	.xword	0x85d98b3ef6e339c9
	.xword	0xb58cdbd0f958e513
	.xword	0x8c66777b0571e31a
	.xword	0x05d5b05c4e9d9704
	.xword	0x5646d6d789992d0b
	.xword	0x0421cc955def7916
	.xword	0x65e7d31d9282748b
	.xword	0xbff45e0a7c30fc62
	.xword	0xc4889211f0180437
	.xword	0xb5cb47fb127e1913
	.xword	0x2fb97748c39a1923
	.xword	0x9e73341884ac6840
	.xword	0x1ad67a55b97be9f8
	.xword	0x60119eb21b74c187
	.xword	0xf9457dfb088382db
	.xword	0xfdd35232aa6e3fae
	.xword	0x0fcfef6701dac700
	.xword	0x1e2c5646cc2b9b39
	.xword	0xbe3d36a8b5b56905
	.xword	0x89980f85ef29c12b
	.xword	0x4041a3fa9177b0f1
	.xword	0x2b3585d946fbf8a4
	.xword	0xeeee76f8c657cc5d
	.xword	0x3fd0dd78cd02c07d
	.xword	0xfbfa4bd85959ef5c
	.xword	0x0e6f582513929d17
	.xword	0x01f38ff40b26bd16
	.xword	0xc6be15f70452c071
	.xword	0x884219c892ec3dfa
	.xword	0xb747a8642e2b33bf
	.xword	0xa1b62859935260a4
	.xword	0x452c62db575d9bae
	.xword	0xce160fc983669c1c
	.xword	0xff926ef44d4b56dd
	.xword	0xd6f511f875c7a5c9
	.xword	0x5bcffaec18d047d8
	.xword	0x309a95edd89a282c
	.xword	0x4fb467d5ace7c69e
	.xword	0x66463d214da5e747
	.xword	0x08d38ee50bbfd3c6
	.xword	0x7142695c45ba9903
	.xword	0xe885169cd89a9a94
	.xword	0xc38cad332e53c69c
	.xword	0xd895a5986fce3447
	.xword	0x70c6feadde6ee0dd
	.xword	0x36243994853297a6
	.xword	0x8f75608ea2fba429
	.xword	0xf5dc70f654f6d7d7
	.xword	0x835f4251e351110e
	.xword	0xc7f55967e6bc9218
	.xword	0xa7d409c7a0532432
	.xword	0x577cfe067a1a345d
	.xword	0xc199fdc66915dc3a
	.xword	0xe562699767cd3e86
	.xword	0x214e81760485ca27
	.xword	0x2be791ddd941be70
	.xword	0x4eacbef9d973925a
	.xword	0x9b51abc1c142f5fd
	.xword	0xc8db53774b0fa3db
	.xword	0x01afb33dd07612f4
	.xword	0xf565d2c6127f41f4
	.xword	0x207f5a7cd2a15ddc
	.xword	0x08fb09768595b101
	.xword	0x4046aa3f8f94e3af
	.xword	0x66fa673f6ca263b5
	.xword	0xbd95a5ec58bb1acb
	.xword	0xe8c3a07d3da0b107
	.xword	0x97c91b4506a02a7a
	.xword	0xa385464bf70057bd
	.xword	0xf2cfbd194001d05f
	.xword	0xd79c6488ed2bf55e
	.xword	0x01e0c07049c2773b
	.xword	0x301b06a0d9823347
	.xword	0x13ebfff3a76fbd6f
	.xword	0x110de6cf410710ca
	.xword	0x0b730a83cd6b22f7
	.xword	0xa49b53a0ab34044d
	.xword	0xd3a3181a16ce8af8



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
	.xword	0x7adf7174b28bad33
	.xword	0xc83581f8febb4c27
	.xword	0x31cb2bb56454997a
	.xword	0xee86b7c7d8a3449d
	.xword	0xceac1bacc31b09d0
	.xword	0x1c50d095d6ea0add
	.xword	0xe2531758f9cf3ead
	.xword	0x9ccfd82df615c88d
	.xword	0x867a79d3aa3bec13
	.xword	0x19e570660b81162c
	.xword	0xa2c21b1ce8808006
	.xword	0x0e2ee46f8a7775f3
	.xword	0xf801e7b0aadfee93
	.xword	0x6bc2f1f5d02cd368
	.xword	0xf3c1ecc3b223c299
	.xword	0x951b0c6f6442aa86
	.xword	0xccea0aa570b9b101
	.xword	0x65d85f92bd2e0e21
	.xword	0x04255f6f9dee6290
	.xword	0xd242c2722f3bcbc8
	.xword	0x9efbd28980828122
	.xword	0x21cd771721f8715b
	.xword	0x8769cc92eda336ad
	.xword	0x489174f2c825f5ee
	.xword	0xee2d2943915b91a9
	.xword	0x886305a3b2c5e126
	.xword	0xad9cdb6cd1f6d991
	.xword	0x0cb322b4a6f3c9c6
	.xword	0x450daa0da9f21098
	.xword	0x4f37f83518fb0f3a
	.xword	0x9f49f136c3ee389e
	.xword	0x8f6c9025ca6cd801
	.xword	0xb4f87cea58bf5c5d
	.xword	0x552c6f70c70f2216
	.xword	0x16dfec5031519129
	.xword	0xa1c0c031e8fe5f3b
	.xword	0x52747a93b4be0a66
	.xword	0xa37ffa8ad36980f0
	.xword	0x93c2db70d54298de
	.xword	0xba01620c8cfee1a6
	.xword	0x145b79aff21731d6
	.xword	0x3f8ad32d7847c28c
	.xword	0xcebb53a5a20108bf
	.xword	0xf7fe70372e1646cd
	.xword	0x6d1e03ed474108cb
	.xword	0x57633f06cf565fee
	.xword	0x3c2b1ff3bf224d66
	.xword	0x7769f1f78fbdd2f4
	.xword	0xb9a4eb1c44deb0ce
	.xword	0xa3489395652b1ff1
	.xword	0xf2e1a0b47d95423c
	.xword	0x6840f62b5fffc8a9
	.xword	0xa41cd2d9dee17010
	.xword	0x69aedd77829ac5a0
	.xword	0x257738be0ea1efff
	.xword	0x4ddeb21fb683d1b7
	.xword	0xe0dcbfe0dc1a9731
	.xword	0xb9eb4c3bd3757b64
	.xword	0x3d97f26092dda867
	.xword	0xd007dee22daac9a0
	.xword	0xbeed2b9204e19173
	.xword	0x3cd18805ff64452d
	.xword	0x5eaeff4db61fb0ae
	.xword	0x3f961869a04847ec
	.xword	0xe038005101bcd24a
	.xword	0x27302ea19a33a815
	.xword	0x5677a3cf19ff47b8
	.xword	0xd7418e2dad162678
	.xword	0x0380759530544adb
	.xword	0x0b330566b9037692
	.xword	0xa0a405800bfcac03
	.xword	0x5573c0ac19c65aef
	.xword	0x964640b83dad7b7a
	.xword	0xa045e5bacf29f28f
	.xword	0xddd119b2a2534450
	.xword	0x2373e64e092493a6
	.xword	0x6df9dd58f6e4b625
	.xword	0xd90530b5af6cb448
	.xword	0x2cbf31e831d54e74
	.xword	0x53674eee19001800
	.xword	0xda68f819adab4682
	.xword	0x203378d5c112057c
	.xword	0xbb3cfdba7d53f5c4
	.xword	0x7129390dad726a2f
	.xword	0xa3d0952156b43bf0
	.xword	0xbe7564235905bf0d
	.xword	0x4e8666afa5c04553
	.xword	0x587c695fc798e634
	.xword	0x52afc10741cdedb1
	.xword	0x5a7d57e5bd998d83
	.xword	0x9648d9adb474a78a
	.xword	0xdc6a511e0f5257fd
	.xword	0x6840f21a9098a433
	.xword	0xe1d73dbc265b2b05
	.xword	0xfc85ebf812e05089
	.xword	0x6f08c746b2452867
	.xword	0x9ff7a97ab6a40b83
	.xword	0x9fa89e23eb7fd563
	.xword	0x9e3d59b48ed1170f
	.xword	0x029e25e8676cb9a5
	.xword	0x1b92bef8ff112c58
	.xword	0x2c78a83c9b8b4aba
	.xword	0x38a76b53118fa846
	.xword	0x50ad8f2b196c84d5
	.xword	0x68931e4b03fc6e53
	.xword	0xe46099f138ea7259
	.xword	0xf1ee60a425b6dee1
	.xword	0xc17eef2aee8ae138
	.xword	0xb393e0b00da6dfd4
	.xword	0x0750753de747ab10
	.xword	0xc8cbfb2ba0eea6df
	.xword	0x00469e1ca16c8651
	.xword	0xd239aa117b5944e1
	.xword	0x3edec11dc446b60b
	.xword	0xcb68f3d0f1f5b542
	.xword	0x1fe2b50445a89966
	.xword	0xf9cfb4be6380f512
	.xword	0xc0ce0246ce089699
	.xword	0xed3806e8e599417b
	.xword	0xec3bca557b9ac224
	.xword	0xd85e451bfa50adf7
	.xword	0x58d1ddd4aac825ca
	.xword	0x7a38aa3857de9297
	.xword	0x99393504d1f895e4
	.xword	0xfdca06d92191a671
	.xword	0x2e1f5ebda158ada4
	.xword	0x6ee7cbe77472d671
	.xword	0x25c5e8f234ea4bc0
	.xword	0x801313410500dcad
	.xword	0xfee6faa8e661c5ce
	.xword	0xd8d431aadb7a3b0f
	.xword	0x94584f9a2c27c1b3
	.xword	0x7f4f937007877a62
	.xword	0xa8d448545344bb00
	.xword	0xde9e981d44687cca
	.xword	0xb671b824cc416436
	.xword	0x3acc4a7ae553b3ef
	.xword	0xf4e8152521b0c0e4
	.xword	0xdbd79847b22e9dff
	.xword	0x99efd21895fddcae
	.xword	0xbcb07844efdaa175
	.xword	0xd9880629dcb6f5bd
	.xword	0xe7cfc4b96fab8675
	.xword	0x63fe2c2ebf01d604
	.xword	0xf59270bf4921fe07
	.xword	0x80964942ea57fc63
	.xword	0x391b52bb62c6a944
	.xword	0x033ffb991afffcc1
	.xword	0x24911b7a7bbfbd09
	.xword	0xde4aa13ebcc2f1b0
	.xword	0x176e82000be35769
	.xword	0x20e5b54207b10936
	.xword	0x3bb5b2df5a1867d6
	.xword	0x1b256292674fe707
	.xword	0x0b229b4470c9cfff
	.xword	0x7ac98fffef949c66
	.xword	0x341355bba17b94d9
	.xword	0x8d51b5434a317ca3
	.xword	0xc88bbdb04cad740e
	.xword	0x1a71e36b7c5cbcbe
	.xword	0x0284aff44c1257d7
	.xword	0x989fb834c249e38a
	.xword	0xf5df3e1f8b11ce2b
	.xword	0x2ecef5556c83b55f
	.xword	0xd5b54f3af32cd561
	.xword	0xe0b17023aafd7520
	.xword	0xa1d159922c3ecf6b
	.xword	0x3916a08082a53dc7
	.xword	0x4cf92740e28049e8
	.xword	0xd31c6c85ddfd7f14
	.xword	0x7d9f93788ef14454
	.xword	0xf7c3ee0076b49c50
	.xword	0x660cf29b109a611a
	.xword	0x4e775f093133a86d
	.xword	0x61691ee30545ba56
	.xword	0xf49b6b9a907c8abe
	.xword	0xee9b450f3fb2a011
	.xword	0x8a95070d6d9a1e60
	.xword	0xb26050c156152e48
	.xword	0xfd70d5325b4a8813
	.xword	0xe0ead1ba92e211c8
	.xword	0xaaa7c53fe5319b77
	.xword	0x2d01b5c840529978
	.xword	0xf12164fdb1ba5c11
	.xword	0xefdd9a218401fd6b
	.xword	0x76ac51072334b361
	.xword	0x4c705997fddd71ed
	.xword	0xc21e7fe0a52c1bb5
	.xword	0x487a4938ad227d0b
	.xword	0xd3b2277e413bf100
	.xword	0xa079af13ec4b0084
	.xword	0x0a43356dd783fbc2
	.xword	0x24337e4df8f87738
	.xword	0xc594af31a1dff285
	.xword	0xa9d151f1221beb8e
	.xword	0x175aa057dc4fdb09
	.xword	0x47e59b77c8491e51
	.xword	0x1f3f7ad3f413badc
	.xword	0xc3100c2be2415eef
	.xword	0x99d5ac111c31f84b
	.xword	0x4f1c7fbf191bb8fe
	.xword	0xab6494ba739252ab
	.xword	0x41c37029b81788b7
	.xword	0x31012517d0bff605
	.xword	0x94df72fc74d29b3f
	.xword	0xd2bb39124c55ec44
	.xword	0x9a7339461409e42f
	.xword	0x5e1df05c1c74d1b8
	.xword	0x5d60e39845a5ebb5
	.xword	0x1607c52097a23d1f
	.xword	0x427247ce4450702a
	.xword	0x4fefcec89b50cf3f
	.xword	0x265215791915325d
	.xword	0x6313516a7b73cd67
	.xword	0xc8fbee7104376330
	.xword	0xbae5697d00d90cb7
	.xword	0x0a44769767613127
	.xword	0x8e622c0f77b0881d
	.xword	0x7215d764990161ce
	.xword	0xca805fc994cef213
	.xword	0x9960d694ca881c25
	.xword	0xa53e91ff06b62ee2
	.xword	0xd9154bf323790dd1
	.xword	0x285542f2837ef046
	.xword	0xf55366d9dcd0c2c6
	.xword	0x33af9ad994cb8456
	.xword	0x87bfaa0dc8b3d469
	.xword	0xcd9cdcdde899321e
	.xword	0x83f16254d23b2bf1
	.xword	0x13010041ee576c69
	.xword	0x57eb7a7fccf6bfa2
	.xword	0x0599ea91b87af677
	.xword	0x246145b61b867c9c
	.xword	0x711e1f623c216e2a
	.xword	0x7c64b0244e95d0c4
	.xword	0x8202b4e9cb3ef4a8
	.xword	0x2a21be80dab6e9ae
	.xword	0xef54a8e7217df9bf
	.xword	0x58d6969e0b23e30e
	.xword	0x8b8834c2f38480f8
	.xword	0x9987be70b26e47d1
	.xword	0xdab1a23ce0029f74
	.xword	0x422511339bb50892
	.xword	0x726c8317d9b6fae1
	.xword	0x2b359238d32eaa80
	.xword	0x0e5fa38513b7c747
	.xword	0x46312d08eb06012e
	.xword	0x5d61fbcc0e66ebdd
	.xword	0x13d57916474681c9
	.xword	0x8898c3b616f7b985
	.xword	0x4ce8ae6590f5d641
	.xword	0x609856872f3a8aba
	.xword	0xb1f65bcf004c70b8
	.xword	0x9aa16b00ad687868
	.xword	0x4084971ff4d4a5c2
	.xword	0xc6471c40412ac679



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
	.xword	0x042023c1c29b07e9
	.xword	0xed5accbb27a3e625
	.xword	0x5d1a76388e204fff
	.xword	0x291683910261aab7
	.xword	0x7cd2484631efcb77
	.xword	0xbb96b5944747f90d
	.xword	0xcb573056b8703005
	.xword	0x6c65f1ea20a1f8d5
	.xword	0xa7f16c91399c0409
	.xword	0x9f844f0599131c06
	.xword	0x31eda66bb90a9d8a
	.xword	0x9b5b7b0a43063c61
	.xword	0xda535444de723272
	.xword	0x62d6a779b39f019c
	.xword	0xbbae6e9a136b98d3
	.xword	0x5d8eb6b869ef5a32
	.xword	0x3b111f1ab50caf65
	.xword	0x922fdb188a23339e
	.xword	0x7da228010d47b9a5
	.xword	0x91481731314b7854
	.xword	0x0887a625437fc3bd
	.xword	0xa5f52227fe7ca94d
	.xword	0x77b84d8148e5c00c
	.xword	0x2c1beb3065aaa25c
	.xword	0xb438ec581e629465
	.xword	0xc47eb48f1f0bbd61
	.xword	0x894cc62cc09d2c33
	.xword	0xbf9d8a84232325ae
	.xword	0xc444d9088cdd6b57
	.xword	0xb0784c687f508e3c
	.xword	0xd29ba5b507489321
	.xword	0x5bda9be43528f021
	.xword	0x10c0c3fc6ae93342
	.xword	0x0228638c5ee88ff2
	.xword	0xd0a434ec9da53e55
	.xword	0x3c4e3e3dfb1a6878
	.xword	0x18e040a4bc07ece1
	.xword	0x381d938e3d1d3f3e
	.xword	0x052bf2ea946e6f29
	.xword	0xa993cd7cb5b2e44e
	.xword	0x50d90d68edd30b7c
	.xword	0x004b7237c0b84f03
	.xword	0x6009c25de9aad81a
	.xword	0xfc9f2f248f42e1b0
	.xword	0x886a049de1eb9da5
	.xword	0xee07a585ef64eec7
	.xword	0xaa407cd7479a8748
	.xword	0xae2f7443cf9cd428
	.xword	0x40ad45545d93b001
	.xword	0xd2743c71fdddf2da
	.xword	0xaa9ce8aececcb019
	.xword	0x68d5820aae125a08
	.xword	0x63c8b3442a42ab5c
	.xword	0x6012967b4fe85c89
	.xword	0x1b524b1daec41042
	.xword	0xe77e4efd770d0b23
	.xword	0xa90cd9e487817ac6
	.xword	0x232d4f9874fd5288
	.xword	0xa775793dd296a73c
	.xword	0xccbadcfd58c199ff
	.xword	0xb2714c6740717ade
	.xword	0xd5c2f17baf190500
	.xword	0x6ba63a4728fc0626
	.xword	0xb6df32b7b34e4e63
	.xword	0x6c6be7898b77c993
	.xword	0xa7347a08269c246d
	.xword	0x34d38bf98aa606a6
	.xword	0xe833f40aea5f4177
	.xword	0xb1d26bc707c8aa56
	.xword	0x04cebab716dd399b
	.xword	0x956c8c9cd7b47912
	.xword	0x91f84629ab28f890
	.xword	0x98ec9e0a43284df4
	.xword	0x899f67d9ff0225d4
	.xword	0x623391690ef02f6b
	.xword	0x13985acfb10f4235
	.xword	0x2d125674872c052e
	.xword	0x847e7114c78e08ec
	.xword	0x6fb43771dd711c2b
	.xword	0x8cf12a393c97533d
	.xword	0x6e9ec65183ebbf7a
	.xword	0xb2cf7b5b664104bf
	.xword	0x9e2cb859e8b89366
	.xword	0x0b077bfd48eb8422
	.xword	0x0b5b67d0580ba28e
	.xword	0xd99f124b8e2ec77a
	.xword	0x00fcc2456a92c0cb
	.xword	0x1338c3427df3092f
	.xword	0xec43362722d1de2a
	.xword	0xb421876d3610d94b
	.xword	0x31e2edd78f8abe91
	.xword	0xd9b694eaf8f41b9f
	.xword	0x42a11f99b8af5c03
	.xword	0x42b6f6ec029ae487
	.xword	0x88b09bec52c6d1e9
	.xword	0xac5bf54e45ecb882
	.xword	0x2897d3f246b88f78
	.xword	0x6ad42e87136256ee
	.xword	0x58a9e5c16c719f9d
	.xword	0x019a9f097c6c6474
	.xword	0xf98be2e2c91e95d6
	.xword	0x36cbb4aff4f4be4c
	.xword	0x663978615fab25c0
	.xword	0xc517b759adb9517a
	.xword	0xdf60d6710c299dab
	.xword	0xa7a9556f053bb7e6
	.xword	0x81d45e29bacc3340
	.xword	0xb8e4d6eee312cc38
	.xword	0x2035ecfd0e085f4e
	.xword	0x5dd5e7f4f3bd0250
	.xword	0x1eaa9d115084b111
	.xword	0xf588a241861d8acc
	.xword	0x39cade2a580abd05
	.xword	0x239b447579afc746
	.xword	0xc63f9e1656894e9e
	.xword	0x20abfa254e90dfc1
	.xword	0x21b6883db0dfead6
	.xword	0x0952f3614f29fa3c
	.xword	0x6a66f1a7771b3cec
	.xword	0x62e7b78f1835ea1d
	.xword	0xc1902d6d541076d3
	.xword	0x457890257b726ca9
	.xword	0x9cc40e259869bb0e
	.xword	0x6907983f1fdf27b8
	.xword	0xfe39633dcce1ecb5
	.xword	0xe91ee3f3dda121ea
	.xword	0x10bcfebc4ec3958e
	.xword	0x2ab8b40490d58685
	.xword	0x346f505312ddc5f1
	.xword	0xc38d98bf2c68b6cf
	.xword	0xf583fb62e3cede63
	.xword	0xc72892c9a33159b5
	.xword	0xa0d3654164a566e7
	.xword	0xae754e6d84be4940
	.xword	0xabe387188672354c
	.xword	0x05c4d85a8e9b5a4e
	.xword	0xe2264150536a21dc
	.xword	0x91efa089fdf2b748
	.xword	0x4a4c74edf7aa7a50
	.xword	0x3f4871dd81142321
	.xword	0x1a41f3bd6c07332e
	.xword	0xec0821da752dbfaf
	.xword	0x692dc2163ae7cb7a
	.xword	0xacebb881a09c259f
	.xword	0xfbb9fd7a3e7e2258
	.xword	0xc95d9b0aa84f2453
	.xword	0x1a8617b3ea563c14
	.xword	0xe243a46e7c70c349
	.xword	0x66cc0826bc37add8
	.xword	0x232377753d90f83d
	.xword	0x84575a5659f42120
	.xword	0x05c0ba95498e7900
	.xword	0xbe1b3bbb1f47c8fe
	.xword	0x8999ef763a7aff50
	.xword	0x8848c1baf0cd8c6f
	.xword	0xa44c940064612e29
	.xword	0x889816f47e961dd3
	.xword	0xa1222e59f3c97452
	.xword	0xc60661cda74fe365
	.xword	0xf680dff824561ddf
	.xword	0x0d7b622694397820
	.xword	0xf8ba2c1cc26bd5f0
	.xword	0x0dd7ff9c47ed2522
	.xword	0x43a8b20f8594695f
	.xword	0x2a3c8e040b620b89
	.xword	0xbc9273100b74da8f
	.xword	0xb681657e8bc78dbb
	.xword	0xe667c80bcc260fef
	.xword	0x3e2c34bb43863608
	.xword	0xb3e51e09ebb982a1
	.xword	0x6fe9be0e2a1ffee6
	.xword	0x61917f10fbdb732c
	.xword	0x76aa419585188c9b
	.xword	0x05419e31712f91b3
	.xword	0x1d72cafa3945e6c8
	.xword	0xffffd063f3956629
	.xword	0x129bd81c08f23f9a
	.xword	0xbadc36df73ebf882
	.xword	0x3690dedaad77a93b
	.xword	0xf06db70852497b8c
	.xword	0xf6f1532a12d7fed9
	.xword	0x839e2a1e9a276201
	.xword	0x500167a0e52a69b6
	.xword	0xc2f6ca0be1f7580a
	.xword	0x595e668d8e21d8bd
	.xword	0x7090382d7be1a394
	.xword	0x00063b53a310b18d
	.xword	0x9b567fd5f89e6f54
	.xword	0x3ede314bddfba549
	.xword	0x74a34554f98069db
	.xword	0xa0fa6879f25f2a01
	.xword	0x987489f75b5d9616
	.xword	0x26335a9e7c310b39
	.xword	0x44f696fd613a525e
	.xword	0x865c525c37961a38
	.xword	0x2555cc2898f99b90
	.xword	0xb567a7ee4afb8f56
	.xword	0x77f80663c9cbe19d
	.xword	0xfe4a1c13f130d9ac
	.xword	0x358d836d779b3116
	.xword	0xff7feec40a5356b1
	.xword	0xa657d85e9e4ff856
	.xword	0xa83fd28bb50ecd5c
	.xword	0x464ac008dd874933
	.xword	0xd53179c35918edf0
	.xword	0xa37b9f4805a054c2
	.xword	0x72a74559a1adacbd
	.xword	0x6034f9420324c131
	.xword	0xac40d7879dffd0c6
	.xword	0x086500dde02fbabe
	.xword	0x21107823b835adb3
	.xword	0xb67c246d07006d53
	.xword	0xaf9a0be00fb60814
	.xword	0x911719fc2dfab499
	.xword	0x213817f62812dc22
	.xword	0xe8d81f229b88407b
	.xword	0x27927f412d506b28
	.xword	0xa24b2132af2f6271
	.xword	0xcc1607795cef6a2f
	.xword	0x7117dec64edb2cb6
	.xword	0x58342f43d4b98e19
	.xword	0x332e1ef37f30fde6
	.xword	0x4d85f1a7cfa95ed6
	.xword	0x320d9fde1e7ed635
	.xword	0x937b2401ec5aed6b
	.xword	0xf71e264d0f196bb2
	.xword	0x6f02eab735fa9997
	.xword	0x7e0da904c1942c6a
	.xword	0xcbabbd333f1b7785
	.xword	0x029a1abe1a9e9373
	.xword	0x986cd8dfdd226c7b
	.xword	0x492e3c35b8d475f5
	.xword	0xca0e20bc57be8280
	.xword	0x5d6e59c1e1903e53
	.xword	0x8a25eca72e2583f1
	.xword	0xe8f6c5073252203c
	.xword	0xdea70929b9fe365a
	.xword	0x3b400f3d4419091f
	.xword	0xbe0f3e28de072ec2
	.xword	0x188d46159ed44be7
	.xword	0xcb368226605c632c
	.xword	0x27775c526520a827
	.xword	0xef832b3f2a88179c
	.xword	0xc481c47643cff7ea
	.xword	0xbf6bdccee54beb8c
	.xword	0xfd211a58468bd691
	.xword	0x198585dc75a591fb
	.xword	0x741a8208e3fa6027
	.xword	0x6879104f11541ca3
	.xword	0x3f55e7fa77e61f16
	.xword	0xd98e61c9715dd231
	.xword	0x9758b7bc50968f5c
	.xword	0x13af30b984399651
	.xword	0x3a7bd719ac0217a8
	.xword	0x2f5d3fa75729afa4
	.xword	0x3d07d8f564d35d04



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
	.xword	0x1d33464418707792
	.xword	0xa90e72c7c39a5b8d
	.xword	0xbda475b205897539
	.xword	0x44a962a91a1606d2
	.xword	0x06260e2d35bc01ab
	.xword	0xd1a55dbe2f610c4f
	.xword	0x250e95bdb10f0ee7
	.xword	0xd894460ee1098f42
	.xword	0x0e8befff77351118
	.xword	0xdab8d623b1ea8e95
	.xword	0xee527ede65bf3579
	.xword	0xbffc2434dbc0a05b
	.xword	0x8a51346388ecad77
	.xword	0x8a902ee052ba8fe2
	.xword	0x9a1babcc04f52bde
	.xword	0xcbd2ce9e20fafe7a
	.xword	0x0b02d23e1f2b2cc3
	.xword	0x231a0f814623400c
	.xword	0xaebab898f65205a0
	.xword	0xce3c12acf45c8c2b
	.xword	0x4b5ff9f7be0964d5
	.xword	0xb5a6d5a93bd07f9f
	.xword	0xe68828b5d84ff667
	.xword	0x75462a7735f748bf
	.xword	0x584ec5840c03fd65
	.xword	0x30125208144a44a8
	.xword	0xdb52b1fd7ab23179
	.xword	0x3fa393a6c873c23c
	.xword	0x5e215d39ead4d6eb
	.xword	0x7e4337842e5a12c3
	.xword	0x79bbf139d7387f73
	.xword	0x8473fd1b498cf058
	.xword	0xf36333c6631782b4
	.xword	0x06593e42f406802e
	.xword	0x11df3b2e33d70544
	.xword	0x889e9060de4a1cc4
	.xword	0x4ee54f4d3f28bc75
	.xword	0xf37f456810416d82
	.xword	0x47a3b5c28407ac59
	.xword	0xf731b150af05e84e
	.xword	0x9a0a0c6d49b9df24
	.xword	0x53fd5fffe662edc1
	.xword	0xc3f8147d57ff4e87
	.xword	0x33ab2b58765a039a
	.xword	0xed0bb732e0aa1ea7
	.xword	0x413bf0663b6517f5
	.xword	0xc1695ee0a9b49988
	.xword	0x6aef68e32243ed1a
	.xword	0x9cce8b1ad57d0b60
	.xword	0x0dd733f70659e029
	.xword	0xe4abcffccaf7c668
	.xword	0xf8d5b6e1ba0baa07
	.xword	0xc2dee60ed02f343b
	.xword	0x87d5f095bcd28492
	.xword	0x9f8109dbc9979fe5
	.xword	0x4367fbf757e8e843
	.xword	0x6a97875f0784527c
	.xword	0x59de66496243e7bb
	.xword	0x6656ae86e4c491fd
	.xword	0xda57f6bb05a8d19a
	.xword	0x940ac9caf6c52ee7
	.xword	0x0e649ef566053b46
	.xword	0xd04b456463fcdda7
	.xword	0x0d1a4dcfec4a62bf
	.xword	0xa7c07becfd91c273
	.xword	0xac73e1c89ccd76b2
	.xword	0xd2d4027ecb00a196
	.xword	0x6b1903eb6c6ddf20
	.xword	0xe26a83f3c4ae51c2
	.xword	0xd662f0f6bce3cf16
	.xword	0x1f9098d0074542a0
	.xword	0x7e2a330efe1643d4
	.xword	0x563dd68cd0423307
	.xword	0x739ba5aa8742af7d
	.xword	0x4347c7eb0eb69a26
	.xword	0x763e916fc0ec04bf
	.xword	0x126c601e52b2de2f
	.xword	0xe173df9ef25d1301
	.xword	0xf3c693e80f774107
	.xword	0x1271eee888fc16dc
	.xword	0x6291212d3b9c5599
	.xword	0x30a4179df0610ca9
	.xword	0xfba194efe66727cd
	.xword	0x53a076627cc74580
	.xword	0x748520f95fc40d02
	.xword	0xeedea3184c4b0a20
	.xword	0xa0a38ac46ca5c8ba
	.xword	0x4e768b22b50d4946
	.xword	0xd3235520ed8958a4
	.xword	0x6bb7b70d0971d5fd
	.xword	0xafeb8639817de6b8
	.xword	0x89a639b0629a4286
	.xword	0xabed365b0ecbfe99
	.xword	0xb88ec5e34448cb0d
	.xword	0x004767545db7bfc1
	.xword	0x47491e6d15e425a2
	.xword	0xa18562e5e42985f3
	.xword	0x3b58c9e34ce47104
	.xword	0x294a51264733e0a5
	.xword	0xfe53957f97442d06
	.xword	0x50619e5edb0c7f6d
	.xword	0x73e7bda83bf3c791
	.xword	0x069b80e69ec37ea4
	.xword	0xffde979639f26eb8
	.xword	0x28f26b7b9ca217a2
	.xword	0x219af93ff9ed2e8f
	.xword	0x1f58d343a4e52198
	.xword	0xefbd43a9dde42a82
	.xword	0x592679e14ba67dee
	.xword	0x839c0fec2aca45f8
	.xword	0xbbac13d0eed496d0
	.xword	0x788579b08b15a22f
	.xword	0xd140d1a4153d0313
	.xword	0x15d7e74b2ed0efc7
	.xword	0x6a8ef346ea9b0b36
	.xword	0xc2823db4cff44683
	.xword	0x763ae9101507b02a
	.xword	0xfd598a8d4cae88c5
	.xword	0x70e49e42af916fa4
	.xword	0x6ad7b5522301c6d5
	.xword	0xdee34dad700f72af
	.xword	0x05da781d2e394efa
	.xword	0xdbd6fc024ad27fab
	.xword	0xf59ab5c351a7925a
	.xword	0xb9f652be7fc17b3e
	.xword	0x526f76b5dde7d5b9
	.xword	0x2d99554150148cc1
	.xword	0x1f8b2e1c960c9d84
	.xword	0xdbfad124e47ecf36
	.xword	0xb002d18fd4e5755f
	.xword	0xdd75b617d0318cca
	.xword	0xf8528d9d54eb9b20
	.xword	0x62b14f72f938ba86
	.xword	0x79ef7a8a17f60fa0
	.xword	0x6d1671411aec34ad
	.xword	0x51de07f78df07904
	.xword	0xc3095d1f8348badd
	.xword	0xb695423a645d4a0a
	.xword	0x64fc33b971f3f406
	.xword	0x7b0a20c9d4dd85d4
	.xword	0x6addb314041a2e03
	.xword	0x2289fa69c080ed96
	.xword	0xdd91866ba3874ba4
	.xword	0xfe3c99ab7fac817a
	.xword	0x6fc21c87f24cd8eb
	.xword	0x75ae483b89997b57
	.xword	0xd9cc0b3411d0f30c
	.xword	0x0705d30e3c367f1a
	.xword	0x3962ebecfc873f8b
	.xword	0x7f69ed805f7dd034
	.xword	0x0e423f5a85290d07
	.xword	0xdc1192f3707feb0a
	.xword	0x467c5cb51f8f70ae
	.xword	0x27c4243ddb1e6b93
	.xword	0x1757a63cd327dcb0
	.xword	0x7e2e336b075e3c16
	.xword	0xd45b751f59db43ba
	.xword	0x2459e498bb3be275
	.xword	0x722975298e677c51
	.xword	0xb7b027939c4524d6
	.xword	0x7314a268d85b55ae
	.xword	0xf35afcb5058719c7
	.xword	0x9eab1157d7d7d857
	.xword	0x2ce21b02dded6faa
	.xword	0x8b44cd367c111cd8
	.xword	0x87e40de2cff9b19d
	.xword	0xc4ef9a0a1b2f20a4
	.xword	0xf87531f5f093db36
	.xword	0xb657f94773b60478
	.xword	0xf52340d4eae067a0
	.xword	0x852a6f695df40639
	.xword	0x4f851a67490686ee
	.xword	0xf79cf93c0ecb451e
	.xword	0xb5707175f80b2b91
	.xword	0xaddb541827929ba2
	.xword	0x8ba9b9804389e3e7
	.xword	0x488001039f28876a
	.xword	0x7de361f4b2d3cbae
	.xword	0x138dca09cfb57a39
	.xword	0xc037c098b956a8c1
	.xword	0x9164f5ee5736bc7e
	.xword	0x3136e2d189676de9
	.xword	0x4d6db2e4bbb4c2fe
	.xword	0xfb5d75d304aa382c
	.xword	0x7fee806057db35c2
	.xword	0x309277bdf599d790
	.xword	0x113be804e8568057
	.xword	0x07f815b2a1794a19
	.xword	0xcee9fc1b8cc6daee
	.xword	0x0dcd37524b6f1da9
	.xword	0x06eddd459fd91c70
	.xword	0xd4bf4d00d63e4bc2
	.xword	0x98fdb03d16524930
	.xword	0x81f30b6663119a6b
	.xword	0xd630a4bc2df13645
	.xword	0x0b8cb95a2f2ad6a0
	.xword	0x4e45566cb3aee105
	.xword	0x592d786d1849ec7b
	.xword	0x55c5a6414e624220
	.xword	0x2f0a2bed2e3d0d93
	.xword	0x0876f5febfe21366
	.xword	0x200ee03f998fbc3b
	.xword	0x2df1165cbe1b280b
	.xword	0x577ada4739869d8b
	.xword	0x41240710796bc946
	.xword	0xc609f8454ea169a2
	.xword	0x35e6eafc18fe034a
	.xword	0xb05dd015134a9398
	.xword	0x8e9d3c71266fd811
	.xword	0x327971c756525702
	.xword	0xa08d2d550266b732
	.xword	0xf874649fce973f6c
	.xword	0xe9d40b636543789c
	.xword	0x870c93101cf447dd
	.xword	0xd58bf50ced9f2494
	.xword	0x8b0a1d0915cc3dd6
	.xword	0xa9776942d1af9391
	.xword	0xaf36d2e5e7f23d6d
	.xword	0x7de4de0b0ed694f0
	.xword	0xbf5ac97201d26ba4
	.xword	0x02236b0901176bb1
	.xword	0x9424f4750b52d0f0
	.xword	0x2feab30b6d42ea14
	.xword	0x98fe234e78429113
	.xword	0x03efb5c4fb154a20
	.xword	0x501d34f9b124e92e
	.xword	0xe13d81542fab1dad
	.xword	0xfbed63552da94d53
	.xword	0x87320c9dcef85e4d
	.xword	0x3c5f6d9337fdf997
	.xword	0xbdc1382ebee348ba
	.xword	0xedd6a1e80de76c4b
	.xword	0xb53d19d3c0a30c9a
	.xword	0xc1c894a1d4d85212
	.xword	0x175624d8340a9c19
	.xword	0x2d8685db8f2d94cf
	.xword	0xace3850d2cf2592a
	.xword	0x845a9c3ef3d0a248
	.xword	0xe9b1d840495d850c
	.xword	0x3d74361e47cb2911
	.xword	0x7a7e347739ac8a7e
	.xword	0x40c79a1118df53b9
	.xword	0xb79cf739ac0d33bd
	.xword	0xddc8e6ee0a164db2
	.xword	0xc9eb4f0765b35d4d
	.xword	0xcf9fd3c18976491a
	.xword	0x12c6256ee869c0ec
	.xword	0x230fe781a4e9fedb
	.xword	0x1a9c51558de8ba9c
	.xword	0x8a36b983d8f6e4f1
	.xword	0x89dd813eecc5d15b
	.xword	0x17873635ec4507fa
	.xword	0x634771852a50922a
	.xword	0xb2d9296c0221b0a5
	.xword	0x72623fd869a81f8a
	.xword	0x80bb02b4077c2cd9



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
	.xword	0xd7d6aa526e52a796
	.xword	0x369c7cda9af2c9f2
	.xword	0x11e040ad928f3413
	.xword	0xc38d890e8a0204db
	.xword	0x5d6adb8aa256aaa4
	.xword	0x0887add4333f1bf1
	.xword	0x65958dcd2115bd2a
	.xword	0x10ee8e409534c478
	.xword	0xbefb32b09147c25b
	.xword	0x9b84cf940dbacacd
	.xword	0x2eb745c09e284a97
	.xword	0x1330915c53491767
	.xword	0x1320da5183450be8
	.xword	0x46c8d847e616cc38
	.xword	0x608dca7484ce9c51
	.xword	0x914efafa4256d03f
	.xword	0xf6cf054394a947c3
	.xword	0xa9280dac1b051a64
	.xword	0x9048ffb6b40b372b
	.xword	0x36bd2797d165bb8e
	.xword	0xe6844b77721ec265
	.xword	0xf9c5ffb13fd1b9ba
	.xword	0x0a30513fb8838a3a
	.xword	0xb1e672f35e2a3e35
	.xword	0xc9beb3b14071f59f
	.xword	0x57844ac2a8b2eb4a
	.xword	0x1831f261fb3f13c7
	.xword	0x135bad0d1c6c4d69
	.xword	0x98188493e59b54f9
	.xword	0x7c937db819dfa764
	.xword	0xa8b368277f3c4dfe
	.xword	0x4316b9c8fbc2d9bd
	.xword	0xefd51971a42e9964
	.xword	0x6ae90bc124268135
	.xword	0x4ce715e574fcb428
	.xword	0x705001be26ce123e
	.xword	0x29dd51f932e37216
	.xword	0xafc7dd07b8108936
	.xword	0xf0482bb7b5850bd5
	.xword	0x546987ab3295a5d2
	.xword	0x65d749a59dc8037d
	.xword	0xd2e141047faf53ea
	.xword	0x6fcb8902048af6d1
	.xword	0x63212d74ee06ade0
	.xword	0x2d23c061210572f9
	.xword	0xcc5e5cd7fdb1e787
	.xword	0x18903edc41d43227
	.xword	0x3740afe353e5d1a4
	.xword	0x5aa09e04a55e5799
	.xword	0xc798453ecd9b649a
	.xword	0xbcff24785fc0ff21
	.xword	0xe3b6230a4db0eaa7
	.xword	0x34e8ba6b010faffb
	.xword	0x1b77173b55989a76
	.xword	0x82f2a2683af87b5c
	.xword	0x7a658c6599398141
	.xword	0x0bb3fe281999f8d3
	.xword	0xebce51271a7e6482
	.xword	0x03bf1cb98d0b8bb1
	.xword	0xfa8490f0eb14baed
	.xword	0x487013379553394e
	.xword	0xdee758a50d1d6d53
	.xword	0xc7c9058900e89de0
	.xword	0xcb6e11e38e266424
	.xword	0xd55d1e0414865963
	.xword	0xedf54233f6b89883
	.xword	0x716d361dbf13b87c
	.xword	0x44926decd0f59e34
	.xword	0x8ada4381a1d853f1
	.xword	0x746599de2caa70d6
	.xword	0xa57c25925b99086a
	.xword	0x9da2d7421672147b
	.xword	0xf4decf2b338410db
	.xword	0x5c7fb59da1e43acf
	.xword	0x76b0d2e146fa11a4
	.xword	0x6e3eb3fc9bafb2e3
	.xword	0x5a4f1a9ea54f2e05
	.xword	0x715982ef5e695090
	.xword	0xedca9427592ab741
	.xword	0x5466d73eb72b401e
	.xword	0x70bada94f82e764f
	.xword	0x83abcc6c4cf5d9a0
	.xword	0xc6077ca66cd7d2db
	.xword	0x5d3963ee4b5448bc
	.xword	0x78c9bfc043b8d737
	.xword	0x74a0b3ccc338a27f
	.xword	0x5dd05a321d62086d
	.xword	0x1f59221afac30e1b
	.xword	0x7bf3d6221dab5155
	.xword	0x781920a78901e0f1
	.xword	0x06b4d37ce5eb7833
	.xword	0x5ce3c1c3f5cf2a03
	.xword	0x2aef10fd5f25a789
	.xword	0x7fa8e7fc6e0835cf
	.xword	0x62d245bd9efdb8e3
	.xword	0x40d282f6b896d751
	.xword	0xc233c6fe66ccdd65
	.xword	0xa78bdf75eac53b79
	.xword	0xbebd799401d69d73
	.xword	0x02c41f3dc7377592
	.xword	0x116aecfca5757dd1
	.xword	0x158369104413ce66
	.xword	0x2dde1c002597eb2c
	.xword	0x52ab3bc724dc4cec
	.xword	0x8b5a2a42fa2d9f38
	.xword	0x5a54af108574c776
	.xword	0xcc3630c48160716b
	.xword	0x1f8a58c6c6214ce9
	.xword	0xa24a1808305346de
	.xword	0xd6c118b8d8d8bcfd
	.xword	0x0a4cf3ecb4f70085
	.xword	0xa06a12ec729eaa24
	.xword	0x94189e87f592cd9e
	.xword	0x27c18201127cab02
	.xword	0x6b83c74f95f66454
	.xword	0xa9219128727534b2
	.xword	0xca12efdb90124368
	.xword	0x1076f5d156084a2f
	.xword	0xee8c0af45292230a
	.xword	0x0179c73143d4ae1e
	.xword	0x9e23cc1970504a87
	.xword	0x0d03cd7e0a07e14e
	.xword	0x21e9d0af8ef7e417
	.xword	0x1b4686d7729eb4b9
	.xword	0x31ebd41105970d1b
	.xword	0x36da529ca8e9e2d0
	.xword	0xadc1b7e8e9395444
	.xword	0x5a3233b6addc9533
	.xword	0x1e76955d03992146
	.xword	0x3d513ff91a99ef8e
	.xword	0xa7765f5695a477ec
	.xword	0xf008ca5237832797
	.xword	0xf4713901bb34649c
	.xword	0xfac1450f450fa0d7
	.xword	0x149aa0af376840bd
	.xword	0x5814030556122d40
	.xword	0xf440020cafdab3af
	.xword	0xdd7dd5dde73c89ea
	.xword	0x8dc00d87085717b6
	.xword	0x50ac3b7004174415
	.xword	0x9e842736fdf5eb6c
	.xword	0x6e947b32231101b7
	.xword	0x3391bfdbf2026f64
	.xword	0xe220e88ff02e50da
	.xword	0x8b3e18fe77488eb9
	.xword	0x1eba3c5814d47c66
	.xword	0xf3ffc0fdbae56c28
	.xword	0xa3ebba71a1ff9cd9
	.xword	0xce01dc052bd1b132
	.xword	0x1a3783b93a88bdbf
	.xword	0x17b5fba752f80b2d
	.xword	0x96bc3267061df073
	.xword	0x1c4e1c7a785ddbb9
	.xword	0x694d8095ca090694
	.xword	0x939c51c8ae5b4b56
	.xword	0x4d22d6f215dd3154
	.xword	0xe60681869ca802d1
	.xword	0xbadf25ca45764576
	.xword	0x9a0a534a68bf2f1c
	.xword	0x27b47f64a4efbeee
	.xword	0x0ec86e13a8644bc4
	.xword	0x459b3f8cce65d133
	.xword	0x670c3d0007fa6c22
	.xword	0x0f8dc1d55c38ec77
	.xword	0xf17d3ba991def359
	.xword	0xd4c8b5ddda6d5b23
	.xword	0x761ae9615625ee65
	.xword	0xef3675290e507efa
	.xword	0x4d869ced972ba3e9
	.xword	0x622014795b557c22
	.xword	0x416d2bd8368a90c6
	.xword	0x1ab3142dec1a5b88
	.xword	0x969c6b744d3aaf41
	.xword	0x7e623403f80ce59d
	.xword	0xa37706f7d30efb8a
	.xword	0x1c5eb69ccca7875c
	.xword	0x89f058f33219cdde
	.xword	0x8173cff7b6677db2
	.xword	0x4e905736d8079d75
	.xword	0x26ad5732f1681a48
	.xword	0xb85c94491d132614
	.xword	0x2f438601af81fddd
	.xword	0x86104db39517da6b
	.xword	0x617e8e62d1bc380e
	.xword	0xb2ed3eb9f50e81d4
	.xword	0xba3715d4d094f9f0
	.xword	0x2e55abfa4c6d403f
	.xword	0x77786f91bafe270e
	.xword	0x017784e892762ced
	.xword	0x614f9cf4783460bc
	.xword	0x80e37b0c7f542caf
	.xword	0xad5922faf19172b6
	.xword	0x838dedd4fa376cf1
	.xword	0x70daedadafa218bd
	.xword	0x55973b7e6618c983
	.xword	0x66d6e8cb3703b63b
	.xword	0x86f643ccde09a0b1
	.xword	0x034f9a9ddcee5420
	.xword	0x146c3ccd9d4d25b1
	.xword	0x60968f5d690e197b
	.xword	0xcb62af2627bd0405
	.xword	0x22838adb5bb4b8ad
	.xword	0xea125aadf0044755
	.xword	0x6f2fcc1b27771bd4
	.xword	0x4e311bc927ab8774
	.xword	0x51adcf67d4faa124
	.xword	0x7b5b81110f27a3f0
	.xword	0xe394967e7bb8e9bd
	.xword	0x8097f5d1e43b5722
	.xword	0xe539296a04f75d75
	.xword	0x3f10199d8f5b799f
	.xword	0x3258b9954b6497de
	.xword	0x9e190916079517d1
	.xword	0x7112d59c29759298
	.xword	0xd7f610232d0da23c
	.xword	0x9b68d71f52221ce9
	.xword	0xd5d1f2a7abf82497
	.xword	0x3e3f8527ac946ac1
	.xword	0x48e3c0d763e5fd81
	.xword	0x4697906cc05284a9
	.xword	0x3e5c3597ee9c56e6
	.xword	0xcec051f0e0dd5fda
	.xword	0x7f00d2c48dc982d5
	.xword	0xc43c003d40937b28
	.xword	0xc1d9374fc0a68126
	.xword	0xa91b3329fd49ca97
	.xword	0x4a96546dbc9e782d
	.xword	0x01195e839afeeeed
	.xword	0x28119ab9d6a8e24b
	.xword	0x8b676beeba3d1dba
	.xword	0x83df1a0b84c2b47f
	.xword	0xca8bd8596ff8a9dc
	.xword	0x395c76103086cdbb
	.xword	0xc3af64c55a079f65
	.xword	0xac322a7dba1f8f7a
	.xword	0x901b2e88435eb1f7
	.xword	0xfdb37565be5913d9
	.xword	0x337f47121f691a5a
	.xword	0xf7a9e0478969c708
	.xword	0x18c68a9db122fbdf
	.xword	0x041b3974e5d38d4a
	.xword	0x1992b53de8c5037f
	.xword	0xed141c5f383696ab
	.xword	0x9f9d3ced087cc527
	.xword	0x31681b22ed044c96
	.xword	0xcee219f892e8f3e9
	.xword	0xbefd86823d9df099
	.xword	0xe294feb7a7337a33
	.xword	0x0e29f551c5d03cd1
	.xword	0x4fce6a28e904aa8c
	.xword	0x4cbfe4a2cd4942a7
	.xword	0x760a98c20ae23eaa
	.xword	0x566362894f65a8d8
	.xword	0xb93eb8a2b4726335
	.xword	0x13d3a32ba2cab1bc
	.xword	0x6da44c0f05a63af0



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
	.xword	0xa9fc96d8229bb895
	.xword	0x6702c80cd654c327
	.xword	0x187ea2b5cad50749
	.xword	0x9547468962663d25
	.xword	0x1966ebff17c53739
	.xword	0x634b2309c4ed3729
	.xword	0x4d061c215daf63cc
	.xword	0xed099df83c697782
	.xword	0x90f232fc973e326e
	.xword	0xa84dd970f38c8133
	.xword	0xae6fa919f55785cb
	.xword	0xd5151c20240f73ac
	.xword	0x123a828206b244c9
	.xword	0xc0bd0947d8ceb9b9
	.xword	0xa6c89176f1785f6c
	.xword	0xc3d05df4018ae369
	.xword	0x1250399d004fb1cd
	.xword	0xefe5f66a189569db
	.xword	0xce886850c684f45f
	.xword	0xee9f7064e2b5d9b2
	.xword	0xfce17cfe932237c1
	.xword	0x5409f8ea6294f6b0
	.xword	0x6a19295725d9112a
	.xword	0x0c775419f2d63f09
	.xword	0x53abb0803ba8fe00
	.xword	0xff7698b7a63e1a86
	.xword	0x6eea7ff9ae11034c
	.xword	0x36c948358b67b70c
	.xword	0x75aaffbe0449c84d
	.xword	0x7c428d7000ebbd94
	.xword	0xe3f173c20035914e
	.xword	0x8e3bf762058d7760
	.xword	0xf18156a5a0acca81
	.xword	0x7cf857c672a5a166
	.xword	0x693b3581a54fdf95
	.xword	0x4dad1b0fee967ea0
	.xword	0xf5cc3718610f9b1f
	.xword	0xe2cbd426fbaeb0df
	.xword	0x7a90cc8fed068453
	.xword	0xdc0dcb530bb206c4
	.xword	0xc771cfe700a16109
	.xword	0x8bdb5ca37852ac52
	.xword	0xfb0552ce268763f1
	.xword	0xa73cdce05de060ae
	.xword	0x2472dbaf089a8348
	.xword	0xabce2771ebc66e7f
	.xword	0x5ddcd0063e59cc69
	.xword	0x8fb43ee0650f91e5
	.xword	0x39a56fcdcb52e1b6
	.xword	0x44ced82edf92bf67
	.xword	0x183881dafb89cb83
	.xword	0x8ee731b16e6ec45a
	.xword	0x803c2e8fbf57d687
	.xword	0xb9ddc072077fcf2e
	.xword	0x60edfa3d6fc79eae
	.xword	0x55f4ca963e05b255
	.xword	0x294ee93752daade7
	.xword	0xc693122bc5700dc2
	.xword	0x5eae0d7431897cad
	.xword	0x16dfd141c285bf1a
	.xword	0x98c118e03248440c
	.xword	0xd06f7f48d1b4d54e
	.xword	0x4f1ce2c5cd8f5896
	.xword	0xb764330823581927
	.xword	0x8c14cc7ab49cebe8
	.xword	0x654c2a7ab73638c6
	.xword	0xe311d7a3d995d624
	.xword	0x45ce184bfd834377
	.xword	0xf85079f7e4bf7dfe
	.xword	0x53c02c3fb8de3100
	.xword	0x01533b9cc5c7e574
	.xword	0x0d05de146f7ea41b
	.xword	0x424c6381f6df62d0
	.xword	0x3c161cc1d5eb4d22
	.xword	0x2e014c76c96c7ae1
	.xword	0x657f5f104f41560c
	.xword	0xbaab8df89f6db941
	.xword	0xaec853071b01baa6
	.xword	0x14ed394c5c34a2c1
	.xword	0xe73f21e336998e0e
	.xword	0x40eb9615328f4df5
	.xword	0xad4d250e1dc8dd72
	.xword	0x04d68f9580ae5d26
	.xword	0xab294474fd416800
	.xword	0x841a608ea733a1d0
	.xword	0x2e4581597a5e1333
	.xword	0xee784a609047b088
	.xword	0x6114213d119ba423
	.xword	0x9cdf0a8ec340f351
	.xword	0xd17b1d439f5d7c1b
	.xword	0x37cc1bf51cd88c75
	.xword	0x76059d529c7e64e7
	.xword	0x36dc9f956407907b
	.xword	0x0648dafd85055ea2
	.xword	0x434fe53a5af86507
	.xword	0x1950beb3d6d259be
	.xword	0x3a6d80a7bb89bf5b
	.xword	0xf5a7bffdf830bf0a
	.xword	0x92abc84db3fe716c
	.xword	0x3faefe94e60de12e
	.xword	0xbd8e25026129228f
	.xword	0x95ba03b628c14668
	.xword	0xfab3e7c5e8974f10
	.xword	0x0c1592932111e4ac
	.xword	0xc0761603c5dac29b
	.xword	0xfc3d8c5dff3547b3
	.xword	0x0fc46c47d16fb577
	.xword	0x290154419142c0ec
	.xword	0x6e3d43a8af19929c
	.xword	0x142981839a5ce44b
	.xword	0xec75cc0c5d4ca3ea
	.xword	0xde5cee01dd4fe2c3
	.xword	0x2779fb2361bd7aca
	.xword	0x61093635aa6b340a
	.xword	0x204c73725512d840
	.xword	0x7379a1afe342b5ab
	.xword	0xb6d2429d25d61e03
	.xword	0x97e315d4ea1b5c32
	.xword	0x5c7e14cf861141dc
	.xword	0xb11d143cf7f9bbfb
	.xword	0x3505e3dcdf56b717
	.xword	0xd357ecfa0809ef80
	.xword	0xad5387bf69761850
	.xword	0x7ef536e47d9ddd57
	.xword	0x5f86069bccce4e47
	.xword	0x0ddbb132de6e6816
	.xword	0x4338b00c8127b954
	.xword	0x560c1bc3467bd523
	.xword	0x81467f5c3c03bab2
	.xword	0x51450ae9a9d780ee
	.xword	0xb4d9b407215e401d
	.xword	0x7f021d0cf1076071
	.xword	0x9f511e4972fe0119
	.xword	0xd8ecda47df699ce9
	.xword	0x49ec340b06e378da
	.xword	0x7f1984e2ee9124f7
	.xword	0x131469790a35cf64
	.xword	0xded776d0728ebc59
	.xword	0x5b2358385c4dc913
	.xword	0x98be4e85f00f37f8
	.xword	0x7fca73f8dbbf647f
	.xword	0x2c3e3acf4e695da4
	.xword	0x5a610ca9b7c8f03e
	.xword	0xbffb2233129312a3
	.xword	0xd802b670aeb1868d
	.xword	0x8cc97ba1ca2fd0c9
	.xword	0x1d3921934705ab10
	.xword	0xe7b939ecda878bb5
	.xword	0x10113c1f0cb9fbc5
	.xword	0x97dee7ed2dcab3e7
	.xword	0x676fd7a52cd093f6
	.xword	0xe3f45a46e5d528eb
	.xword	0xcadf10994cb51002
	.xword	0xe68dc5af3effcd0b
	.xword	0x922fa5e0e349f3a7
	.xword	0x0e7b5e1902e8ec36
	.xword	0x65aa95387746b5a9
	.xword	0xf4323226e04b724b
	.xword	0x25410dbd86e67ade
	.xword	0x60f75b91fad7f282
	.xword	0x18fd78c60e31686d
	.xword	0x1bd599eaf6cde070
	.xword	0xbc614bb09183ed30
	.xword	0xedeccf510d7a77b4
	.xword	0x10150d78fd5d77a0
	.xword	0x2940c7bf6e5d8df4
	.xword	0xccce91c0662bddd8
	.xword	0xbfd7df84a2fb3583
	.xword	0x80a17330c8752e31
	.xword	0x242c07c70411bdbf
	.xword	0x2c62734da55134e5
	.xword	0x8ed8d633075b0826
	.xword	0x2732acee0857ee59
	.xword	0x2e11d70eaf2345b6
	.xword	0x2f25a24f165d558b
	.xword	0x58b4e3c5bea55f3c
	.xword	0x5ef51c7b3e266906
	.xword	0xd6bffe60cbca5cc6
	.xword	0x4c40b119521542b4
	.xword	0xa7ebf4ec2c1fef32
	.xword	0xe0b6858b8ec701c3
	.xword	0x65b2de996ced2c96
	.xword	0x0a5e3d6cef1fdd01
	.xword	0xb37634078142c7fd
	.xword	0xa9bfaee2571ac9c5
	.xword	0xb7e04388562c1d2d
	.xword	0xf13eac1e7077e12a
	.xword	0x624cd0295eb7d855
	.xword	0xb4d40bcb40f6360d
	.xword	0x5aa1d2d2fc05480c
	.xword	0x957b163726479301
	.xword	0x5509081ba36cb0cc
	.xword	0xc78266b53dc890ec
	.xword	0xc32414beb6852ad3
	.xword	0x1a611042d2d6bc99
	.xword	0xf1193c87ccd76da4
	.xword	0xae92873b75cd04ec
	.xword	0x0521f6cddfa2ea95
	.xword	0x104b66cd4fe97707
	.xword	0x5e0a906d4b32a078
	.xword	0xc872c0e104ee43f2
	.xword	0xffdc6a6ef1a17b97
	.xword	0x6ee4466fc5ad6d97
	.xword	0x4bd26465e3e7bade
	.xword	0x8721455358315c1f
	.xword	0x28d6ec7dca812dc6
	.xword	0x2cc093b679ba3302
	.xword	0xb4ef6319645662a4
	.xword	0x083880fc10058d32
	.xword	0xefdac7d84262bcba
	.xword	0xd57c39e64efa51dd
	.xword	0x8ef9b443bf038dc9
	.xword	0xff1a634b332bd2b7
	.xword	0x2b11af0c4e1dc9e3
	.xword	0x1d2016472e29ce31
	.xword	0xb5de34157e88d2c7
	.xword	0x0e6a096fa2e4f3be
	.xword	0xbf1fe669ede8c24f
	.xword	0xd06a9d73d51995e6
	.xword	0xb367ffb7c422cfd6
	.xword	0x88bca076d5c29322
	.xword	0xfe2f176e7ca0e380
	.xword	0x47771c46338acb69
	.xword	0x1d5b97fa0c54fcb9
	.xword	0x6dba1a121cc021da
	.xword	0x4212b059eabdf4ca
	.xword	0xdad54cba1d64c033
	.xword	0x62bd3f32e21934d5
	.xword	0x54716a876f05f897
	.xword	0xf6be8cf61f763280
	.xword	0xb642115fe8c7f2a7
	.xword	0x7d09fd80f6dca73f
	.xword	0x9b72784bb8593cb5
	.xword	0x0a4d8215d92bbe16
	.xword	0xa396685c601c1803
	.xword	0x483d5c94e6fb57fb
	.xword	0xc786cf7035089e1c
	.xword	0x7bb8b89726f698a1
	.xword	0x13f522a446822547
	.xword	0xc6567daea1ccdd4a
	.xword	0xce72a20bf9fa0742
	.xword	0x8109df9dd5c5ecde
	.xword	0x5cc6d857db15751c
	.xword	0x8f52e818a4a7611b
	.xword	0x994d1f0d39b1f7c3
	.xword	0xf76465ed8a51cbf3
	.xword	0xbe93cae883af74a1
	.xword	0x97a77e2da6c2f666
	.xword	0xaad0a85a7d15835e
	.xword	0x91392e06d1d462be
	.xword	0x703a1c2a5425ca1a
	.xword	0xc863a410415e14fb
	.xword	0x86b1f2414baed283
	.xword	0xa4b9b00f096dd15a
	.xword	0xeff9ff9d809271b6
	.xword	0x6d5c1d6a08f2edbb



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
	.xword	0x5bd26740b7d7fc65
	.xword	0x1bf3d5ee802d1830
	.xword	0x375f2ddc48304a57
	.xword	0x1382d2206daf2ca9
	.xword	0x7cb258f1d9768a30
	.xword	0x75c6f918363b503d
	.xword	0x28f45481ae99e12d
	.xword	0xaf7880f82aa9387b
	.xword	0xd69a799c7e2d99f0
	.xword	0x6786098541bbebf3
	.xword	0x1a4798f3c131b128
	.xword	0xd1c69e5d6b3227c1
	.xword	0x3cea517eff296768
	.xword	0x24051f48f7277b39
	.xword	0xb3682605ad3dbfb9
	.xword	0xc26aad35b88ecada
	.xword	0x3badc02bf559040e
	.xword	0xff1d92438ee0115e
	.xword	0x5507971cb54c0460
	.xword	0xb19fb38e05cfd5ee
	.xword	0xc19fbfcc038e0b5e
	.xword	0x7e40e272cdcc4f60
	.xword	0xb6f9e0d2f1820132
	.xword	0xec600bd961a0233d
	.xword	0x70b054b5a1f6ca87
	.xword	0x21e48a68a00b097c
	.xword	0x9b60eddf262cf78c
	.xword	0xfc91a8526a5f0a73
	.xword	0xdde452df3b73f633
	.xword	0x73f1ec0505097618
	.xword	0x1f6c1eabcd1bcbc5
	.xword	0x535e0b5e2c90855e
	.xword	0x665d13a8ce1ee7cb
	.xword	0x5afc1ef0f0311e13
	.xword	0x8be68e8a05e5ef6c
	.xword	0x929f7642deee76d9
	.xword	0x3f3dc0d96d3bfa3a
	.xword	0xafc1b8330953323d
	.xword	0xe5f455aa6eabceaa
	.xword	0x2eb553a2e5c306a5
	.xword	0xfb0a06e59c175689
	.xword	0x1274af00682303c6
	.xword	0x88645b1d59bd326d
	.xword	0xf584f577fad1e774
	.xword	0x9e133eb64bf9078c
	.xword	0x6ada3adcf0c4e5e4
	.xword	0x030f9c3f6bcfe8c8
	.xword	0x1c410bc33edc1ff8
	.xword	0x1eb713a95fbf5bd3
	.xword	0xd7016a201aa5d215
	.xword	0x0b92a823b7eea03c
	.xword	0xdab0d452bd2051c4
	.xword	0x6a523209ed4bdc8f
	.xword	0xa050869199288444
	.xword	0xfabbf657d856c7a8
	.xword	0x1f309cd3094d51f4
	.xword	0x583e9380438d2098
	.xword	0x9d17edb87f6f341a
	.xword	0xe4bf354d143959ca
	.xword	0xab97bc143e37bb60
	.xword	0xa0056d442294c802
	.xword	0xf27f1c7fa2dafd7a
	.xword	0x09206137decf4192
	.xword	0x2c448627ce831107
	.xword	0xff1bc8febe387aed
	.xword	0x1efda15edcadc079
	.xword	0x1ecf9bcec972c168
	.xword	0x83ff57dafa3c106a
	.xword	0x517275e1b501ae5f
	.xword	0x1d7734a61af68067
	.xword	0xdf8a66fd6fc612df
	.xword	0xcf712a3fdf997f5c
	.xword	0x5ef15ac58c67870f
	.xword	0x32b3e7eeec607214
	.xword	0x1c8b894f03fb9262
	.xword	0xc37648a02d9e06f9
	.xword	0x029a32cd093ecd9d
	.xword	0x449042fb3974c1aa
	.xword	0xda7de7c96321ff9d
	.xword	0x5b62999a593fa1f8
	.xword	0xe2086442bdfdaf0e
	.xword	0xf5361fe76d6c74ce
	.xword	0x1cd85f3b3f35fd61
	.xword	0x462466c1fa1f7be6
	.xword	0x7d36dac695d6d5d3
	.xword	0xa6f1c32a93f3b4fc
	.xword	0x10e59720984fa802
	.xword	0x07a8852c76ec65b3
	.xword	0x7361eaf2699f1f30
	.xword	0x71ee3adeac930c1c
	.xword	0x3610e78a0525763c
	.xword	0xb44baf2785a7df7e
	.xword	0xaabc783649240d8b
	.xword	0x662935fe95ef65af
	.xword	0x35161f178e464e47
	.xword	0x88d1281e731c05ab
	.xword	0xd956f904d28dc72c
	.xword	0x8035af1928f29016
	.xword	0x4fe01939b0ea83ca
	.xword	0x4f373d8089d92aa0
	.xword	0x9bb2529b8db32de3
	.xword	0xd057f22214898014
	.xword	0x9937164ad96acf64
	.xword	0xed54af10585b938c
	.xword	0xc8357db8ab0c0446
	.xword	0xebd2c50dfa3196de
	.xword	0xa6db19f9fce4b41e
	.xword	0xf88815179cf49992
	.xword	0xb2224d65fc424de1
	.xword	0xf01c2f8e4a1e8279
	.xword	0x39b23558ad4f69ca
	.xword	0x526ef3aa42c23645
	.xword	0xb88091d40cfbb2dc
	.xword	0xa810cf83908bcb4f
	.xword	0xf039551115b140ce
	.xword	0x33c26b4623d296b3
	.xword	0x44b5c9fea027df42
	.xword	0xb994849fbcc5f2ed
	.xword	0x330f99b99c5b4afd
	.xword	0xa141ffe2fa27f6a3
	.xword	0xe2cb4a7a6ba57bf9
	.xword	0x35f265dc724e1aad
	.xword	0x9ac159e21b21e9a0
	.xword	0x3b1548a240e8e496
	.xword	0xe68a545933cc6608
	.xword	0x7e57bb5ea5b4fd15
	.xword	0x4b5db01ddba66196
	.xword	0xa2b5d0b642d8133e
	.xword	0x62ca8b00e9b6c1e5
	.xword	0xa677947c485d72a7
	.xword	0x1a4418f8f350d7e8
	.xword	0x88b640d38a79e11b
	.xword	0x0335fcf45aed21d8
	.xword	0x5522632f5e88e2b8
	.xword	0x72901d3979293db4
	.xword	0x5ed64bfbfcaf16bf
	.xword	0xccfca9075feb4c33
	.xword	0x980822d22c946edf
	.xword	0x479fa4c92f0b6b7e
	.xword	0x9085ab7453334f05
	.xword	0xe6ac30db85e382ea
	.xword	0x9ddf2a2ee6d95275
	.xword	0xe89ab50fbf7ed51b
	.xword	0xcaef8b55796cf1eb
	.xword	0xbabf347e2f83a6bc
	.xword	0xaf186cf8958baf75
	.xword	0xf776ad400b3d8667
	.xword	0x9004a92ba3ac65c6
	.xword	0xdf9601da52f44757
	.xword	0x3e043fecfe39d4c9
	.xword	0x752d2fbcf00d186b
	.xword	0x7b5e4bcbaadf1d1d
	.xword	0x2f7c0578d6a3fbd0
	.xword	0xc0291bf0a95d8b94
	.xword	0xac23d0a5bebf7ce1
	.xword	0x30d55d5b3b4ed17d
	.xword	0xeb91f33cec678127
	.xword	0x03dbb220eb27c247
	.xword	0x16974838a162605c
	.xword	0x2ea8dd6f4a4f3782
	.xword	0x3a0ae0446ad99d73
	.xword	0xcb5798ec247f90de
	.xword	0x92b3d8bc93b8af71
	.xword	0x504a2c100d512f39
	.xword	0x17acab7d850db107
	.xword	0x1b7ba75d975fb2a2
	.xword	0xa715963b94c437d1
	.xword	0x9c73861d2902b24f
	.xword	0xbcc1e50bdbb35897
	.xword	0x7f24825289777e1f
	.xword	0x1d0341289f85884c
	.xword	0xc4129995da83313e
	.xword	0x59c01a1648d15d5f
	.xword	0x7cc14665895e2f24
	.xword	0xfaa40958b27e2db1
	.xword	0xc581f41b3792be98
	.xword	0xeeec8c7f697b75f8
	.xword	0x33bc31f67eb58c94
	.xword	0x8fc0024e20ffbc74
	.xword	0xfced8c2f6ea7dd2a
	.xword	0x0eff6fb6327747cc
	.xword	0x245e1f38f6cba170
	.xword	0x16227c6143aeb89c
	.xword	0xc4368e2c95811011
	.xword	0xefa93647c19f0dfd
	.xword	0x0b3718394a38b08c
	.xword	0x230bfab1754ed6d4
	.xword	0x5de8977c1c5f709c
	.xword	0xfe03c6ede40233a3
	.xword	0x653ade49eb8365fd
	.xword	0x4083202e061cd56c
	.xword	0x40cb32b3b5ed4435
	.xword	0xc7307d0504209faa
	.xword	0x402023e271b19008
	.xword	0x79dacece85d2d07b
	.xword	0x1d67083cb11d6c94
	.xword	0x00943ded0e239d73
	.xword	0xe682b83af574a394
	.xword	0xa9c2a8f7c25c2880
	.xword	0x1247d6bd6c3b9bfe
	.xword	0xb7dcdcf4f5864180
	.xword	0x46dc52abb98e4998
	.xword	0x04cd87c4971a9f0a
	.xword	0x96ea6c53f591f237
	.xword	0x66cadb36998e4560
	.xword	0x945cb964c84bd9fa
	.xword	0xf71c4e7ef453dd6e
	.xword	0x72306d55f226a73e
	.xword	0x641fb607c60f32c8
	.xword	0x88cc83cb2e544187
	.xword	0x3ca13d9bf36bafd9
	.xword	0x6dc21a823cf3df4a
	.xword	0xc17024e13ba40937
	.xword	0xda9609cf61ec564b
	.xword	0x3fb7e4d8632ccc80
	.xword	0x9f4eed95c3485447
	.xword	0x5fed4a72dfd81239
	.xword	0xa9230fbb0b28205c
	.xword	0x13bce9d97e802bcb
	.xword	0x4568a318543a735a
	.xword	0x366c704a410b63a7
	.xword	0x0c2a5ef31a87153b
	.xword	0x3426ed142c614975
	.xword	0x11cd5961d5dec5be
	.xword	0x8b6e77a119f8ad0d
	.xword	0x7bf915665c4525da
	.xword	0x2c8fd8a5c3b31adb
	.xword	0x7f7f0a70e76339c3
	.xword	0x8281064fb9458574
	.xword	0x3a145b27be36e960
	.xword	0x594630d560a27a3f
	.xword	0xc79cceb177202d40
	.xword	0xc31a42fe72d39c00
	.xword	0x480a6b99da9757b6
	.xword	0x775b36c361b7afc8
	.xword	0xfd791a05f7950238
	.xword	0x85c997535dd00e00
	.xword	0x3644d8326a4164ef
	.xword	0xf8a939862f5f475a
	.xword	0xa4e00803e3e29a16
	.xword	0xc44d84502fcc2db7
	.xword	0xd70169421d367d0e
	.xword	0x604ad5d9e9b41bfe
	.xword	0x7590a3c6210f9149
	.xword	0x5d41b2e46c6672aa
	.xword	0x9f27df3650de7f19
	.xword	0xe3bff27080bee09c
	.xword	0x293566d67284baec
	.xword	0x11a599fb2a0c34cb
	.xword	0x1caa0adc3884466c
	.xword	0xd11e5115da51ba46
	.xword	0x4f527b07fc43c2e3
	.xword	0x0b08f92681609890
	.xword	0x860540ccf7e83e0e
	.xword	0xdf4f3b521285b116
	.xword	0x35033148ad89554f



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
	.xword	0x87ec5c5a30e16e5a
	.xword	0x57ccffeb433407ea
	.xword	0x4cc8ead765762bc3
	.xword	0x0b41ec65a0ac660b
	.xword	0xf54feb03276c9400
	.xword	0xea5e7b260f8d885f
	.xword	0xc8a9a2609d4ef762
	.xword	0x7185a57477089c9e
	.xword	0x9d4835694ce5a9a7
	.xword	0xb54170c0c47c3d37
	.xword	0x35fb5d15f162d587
	.xword	0x625f1db1924774c8
	.xword	0xaed14d8efab41a31
	.xword	0x7c3fa5078eb04ad0
	.xword	0xfd91f8e282a8b9be
	.xword	0x3a451e838e8459c9
	.xword	0xdf0c3a7c1a94cbbe
	.xword	0xd73e083d3b1d146d
	.xword	0x5d4d2cac5d92d83b
	.xword	0xf057f05a0b64f84c
	.xword	0x488d4a7855d847f5
	.xword	0x824419154caca04d
	.xword	0x1f7a4fe7b597a8cc
	.xword	0x3a67b944ba00bfbb
	.xword	0x8ea3ab4a6f95b120
	.xword	0x9228cfa585608b1e
	.xword	0x6f4fecab0ee997e0
	.xword	0x84a492765614ba66
	.xword	0xc2da812b870ec322
	.xword	0x48c56943967ab67e
	.xword	0x4ce403f14f611c4d
	.xword	0x299e68086c2aa0fd
	.xword	0xefcf01f51f3a30b1
	.xword	0x4db467091e8dffe9
	.xword	0x39a58b0f3f3084ee
	.xword	0x18a9ceff93462af0
	.xword	0xcb5de50722879c5a
	.xword	0x55cea6283cfb7706
	.xword	0x9d0a149d4f766468
	.xword	0x70ce2dd552e81925
	.xword	0xf13192581ea4bb70
	.xword	0x3476a3c075378cb3
	.xword	0xde630a8ffa115c97
	.xword	0x2a1f255e46abc6e0
	.xword	0x0316adc32b518e8b
	.xword	0xf86e536b5934f640
	.xword	0xc38401689d935e25
	.xword	0x30fb62ce4ab28023
	.xword	0xc5b413ccde78a19a
	.xword	0x7b1f3273df48b1a3
	.xword	0x6ba576ac525c16b0
	.xword	0x3c415eacdeaac336
	.xword	0x57c97141f9224a8f
	.xword	0x92c47674187b66cf
	.xword	0x1a0bf0fb9a4d54cf
	.xword	0x2d8985fbae1caf0f
	.xword	0x0193eff6cd77c3b8
	.xword	0xc6caa55709a33a01
	.xword	0x7767767e6f42deef
	.xword	0x9bf6d16b84afcca7
	.xword	0x90225ac4b6395d1a
	.xword	0xfed656a26a784f4e
	.xword	0x75db9408d1216d13
	.xword	0x4ed2aaa30b246f16
	.xword	0x32e9d7c5ef866547
	.xword	0xdb054f87c054e18b
	.xword	0x98a5db5807913dd7
	.xword	0x098e3cbf16bd0e5b
	.xword	0xcc5457c4b40fabf1
	.xword	0x4836f7949754fe1e
	.xword	0x4c15189f252e381f
	.xword	0x2b3aaec87db29c4c
	.xword	0xce83904dfd8ea40b
	.xword	0xd3c8dfe7170feac8
	.xword	0xb2306c3b7948ec64
	.xword	0x0f93858d232e6016
	.xword	0x4533e3e924126d5b
	.xword	0xfc8b413dce161906
	.xword	0xc03cb3e076ed5259
	.xword	0x7b828ed4897e2b2a
	.xword	0x26e68fd2422f4f08
	.xword	0x896502ed8219d8e2
	.xword	0x0c7cccf280330083
	.xword	0x3c825efedf3ab199
	.xword	0xdb4abe1ea6501ff4
	.xword	0x6644a6920133494a
	.xword	0x2eb016fb33a6428f
	.xword	0xb69d0672a8154895
	.xword	0x75fc5e8f8c1a5f58
	.xword	0xfc22f5ea4a842640
	.xword	0x676519cf66c322d2
	.xword	0x73ca01d9025ba764
	.xword	0xdf82aa5c4b01b4d6
	.xword	0xd8f713bf01b1d559
	.xword	0x9c696981f471bbf6
	.xword	0x5232f9a2f3602987
	.xword	0x807fb610f21835ba
	.xword	0xda95f438c8477117
	.xword	0x510d008f0614bc20
	.xword	0xaedf94e03b747b14
	.xword	0xf1e265944957ea51
	.xword	0xe96e4896240e6e49
	.xword	0x6717c629dd822538
	.xword	0xa39a649c6cf8c715
	.xword	0x76e485b971573341
	.xword	0xc1295b1949c24325
	.xword	0x2a40231a1b8dada4
	.xword	0x94731d5f360fa4e4
	.xword	0x8bf80b3e450feed9
	.xword	0x4ef2613e1ba7b38e
	.xword	0xe5160a3a711f3395
	.xword	0x8af28d04ef76069f
	.xword	0x14ce9230294b79aa
	.xword	0x83d5bb044df3e34b
	.xword	0x0e31ed298e151fcc
	.xword	0xf234d5cec413f5ab
	.xword	0x81d72c53078d7a21
	.xword	0x2d473752729e9cb9
	.xword	0xbf0934501d6538ae
	.xword	0x301937bbae4887f6
	.xword	0xd26262de87ea11d5
	.xword	0x8275bc727f07a031
	.xword	0x8116a6d1dfd71031
	.xword	0x1c049bd750fa089e
	.xword	0x48a754c83dd526c3
	.xword	0x362200274065f80d
	.xword	0x8f24e23d8e02d8e1
	.xword	0x4ab43097266eefce
	.xword	0x1ef0e13552ac9b06
	.xword	0xfb7e93cfca991571
	.xword	0xebad10b3772e79d3
	.xword	0x46b7521f0777e5b7
	.xword	0x25605137410b5ac5
	.xword	0x18a5c86853ff0113
	.xword	0x4f10d3242777debb
	.xword	0x6a7f1bc8b5966df0
	.xword	0xafb208c765c37ef1
	.xword	0x81521c93685a56f2
	.xword	0x56271ed9c3bfbfa0
	.xword	0x640e8de7793d6a39
	.xword	0xd32a48bd228183fb
	.xword	0x6e92349078efab91
	.xword	0xea435220cde165ae
	.xword	0xec5ff291273de4a7
	.xword	0xf2d94fe6ad3776f8
	.xword	0xd8fd40f0a8e0d77f
	.xword	0xe318f0f2723fb05b
	.xword	0xa38cb71f8dd6243e
	.xword	0xe0c408445d30302f
	.xword	0x02944dd257d447eb
	.xword	0xa60b7d6a07e65bb1
	.xword	0x3cc5fd74b8915ac2
	.xword	0xf52a4a7a22446b37
	.xword	0x87ad5b32cf50deb5
	.xword	0xe2302a4349beaa1d
	.xword	0xcdbc789656f7b3ad
	.xword	0x804aaa6110c06a06
	.xword	0xb931260f629102c6
	.xword	0xdfb962ccebc66364
	.xword	0xadd5d887a1305b51
	.xword	0xd4ac66bae2ce3e30
	.xword	0x5e41beb790b8b711
	.xword	0xb1774a0c8f3a269f
	.xword	0x3fc7f09d16d8d1bc
	.xword	0xb6e7d50bd1a101b2
	.xword	0xad535840ee4c606f
	.xword	0x1f0999b70a6309b2
	.xword	0x5f029563e0c08eec
	.xword	0x892700bff750892f
	.xword	0x40096e78d878887a
	.xword	0xf28fd8b1eec941e0
	.xword	0x6444eaa11d304665
	.xword	0xbfed5f1bda72e6c9
	.xword	0xcdd053ae085f7cea
	.xword	0x0f82250760148297
	.xword	0xb10b60c1f13bbb59
	.xword	0xd0a8628828a21b04
	.xword	0x10e665dfad7d1509
	.xword	0x7307210cbfe117b5
	.xword	0xa3f463597d02e56f
	.xword	0xa86cb1884e330fc8
	.xword	0x0a3949cd67bdea74
	.xword	0x81c59e373a4e8783
	.xword	0x65d774710b1d3919
	.xword	0xc1e0215c59966281
	.xword	0xca2319dedb9eb753
	.xword	0xa15714a46eb05890
	.xword	0xec1223f619f4b17f
	.xword	0xc4a7cc185227e9aa
	.xword	0xd0b9b6a3247680f8
	.xword	0xb2266ed745b82c08
	.xword	0x78d252f059a51e63
	.xword	0xeb10a1d95a3cd406
	.xword	0x67f2dfa81d129234
	.xword	0x05b6486f7716b1cd
	.xword	0x60163fabb1134d27
	.xword	0xdab81d62fef62081
	.xword	0x1aad869e56cbf395
	.xword	0xc016a63ad84d95e9
	.xword	0xa13a5e99da884e7c
	.xword	0x8d1ede31b5c0bf13
	.xword	0xf50a29a3f4f88216
	.xword	0x1fc02f55f75b1206
	.xword	0x5bdc425e1c40bc99
	.xword	0x803908c8f0463b38
	.xword	0x9da40d80e0a4b1cf
	.xword	0x4cf847a82086615a
	.xword	0xed48e918eefdde22
	.xword	0x35a2ff3977e70f3c
	.xword	0x39e2245b0ddc3c76
	.xword	0x86b7aba1b688bae6
	.xword	0x11641a647ba3b19b
	.xword	0x61cb46d5921fa781
	.xword	0x05065d69d6a9a2cf
	.xword	0xfe73308ac4cd3f42
	.xword	0x6de1074d187d09c8
	.xword	0x6055c9ca05730c0d
	.xword	0xcb4ced49460b33df
	.xword	0xc857d213760d31be
	.xword	0xec9d47dead259158
	.xword	0xbd423caef5035af5
	.xword	0x592576ac961fec19
	.xword	0xb6883a2b291a9454
	.xword	0x4a4047b459cc48ec
	.xword	0x4d7f079885f4f0b3
	.xword	0xfb42eebe313a1a02
	.xword	0xcaa6a231cfe6574f
	.xword	0x8c3e5edf50efc34b
	.xword	0x0016b78e1a8748d7
	.xword	0xd16e35febee634b9
	.xword	0x40ddd605d4f80a89
	.xword	0xdb57b00be230426f
	.xword	0x68abaefb50a04f81
	.xword	0x50831ca79b7ebab7
	.xword	0xcb7c715f5853e751
	.xword	0xa2e20eda0b47b9f2
	.xword	0xf004abc91bfc1bcc
	.xword	0x9d67c74b0070530c
	.xword	0xecfdf1665164986f
	.xword	0xddc2b1163cf0a125
	.xword	0xd1d83711a8c569a2
	.xword	0x979df0f22d43b7de
	.xword	0xd0bd2473181b0275
	.xword	0x889672855513d3dd
	.xword	0x94c1f4e843d78c59
	.xword	0x513d5ff75e85a67f
	.xword	0x48c7fffbd6fa7141
	.xword	0x356d7e6dab704689
	.xword	0x6cfc28e1a706fe9d
	.xword	0x90d9062a51b814d9
	.xword	0x15c705c2dd79862a
	.xword	0x6670a4c5cd4a8a58
	.xword	0xc49dcd0dd7486948
	.xword	0x4b88b0cf7282af3e
	.xword	0x140305bcf265e33d
	.xword	0x056a8c7e2e496fe7



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
	.xword	0xccc86f78bdd0ce95
	.xword	0xd01916ef53c87260
	.xword	0xc1e1d9975c8d9e7f
	.xword	0xdfd8f6277263e2e6
	.xword	0x0a9b103b7639519f
	.xword	0xee6ac7e2aa1f59b2
	.xword	0x29e66c7c9d4cb873
	.xword	0x57239f5b03fd151f
	.xword	0x6b120057b2e51b5e
	.xword	0x7d03f3af68ef9ae1
	.xword	0x1817b1bc0d44bdcc
	.xword	0x914ec72aede3a4ef
	.xword	0xd7cdac9f6aea3fe6
	.xword	0xc6250a882a563be9
	.xword	0xa1f1f03f4dafc477
	.xword	0xa69699d3690b0826
	.xword	0x5006562581d7bfa4
	.xword	0x4faf218312708fa1
	.xword	0xb74554debc291895
	.xword	0x7b368359f0de1e9a
	.xword	0xd6cf82ee9e14ba56
	.xword	0xe28a46bc823161a4
	.xword	0xbfa09cfeff4580b6
	.xword	0xfcacc2bf9a1630de
	.xword	0x9f0e9ccccffa6a2b
	.xword	0x3f170c6034b3b92c
	.xword	0x8e3ba056dee83e76
	.xword	0xcb51c7ffefa9dfc1
	.xword	0xcbbb088ccaec38d2
	.xword	0xc40a0718f2ec0b29
	.xword	0x0e2a54bde35ebe68
	.xword	0x2493c6c850cd0dfa
	.xword	0x29f475b0976475e7
	.xword	0x3778c86c700303c0
	.xword	0xa7787050e15c09dc
	.xword	0x2d0091cacef79e10
	.xword	0x36cdadc5015e25b6
	.xword	0x2f66df818c608955
	.xword	0x5de4d4b4f2dbad9d
	.xword	0x6a02f92c893d046f
	.xword	0x67559e6efcc55d0c
	.xword	0x7a83b3ae0edf5001
	.xword	0x5b209f3a48e9700a
	.xword	0x9b1e074a9e843502
	.xword	0x78cde0e16cda7fd5
	.xword	0xc7c52b376f004d15
	.xword	0x064778ee515f8f69
	.xword	0xf22e7f64b309e7a3
	.xword	0xbc892a2edde8a852
	.xword	0xb16ffdd5683a6429
	.xword	0xfd8e91ea436c1d0a
	.xword	0x2a5f21bc49b503f3
	.xword	0x601f6a1b566bc98c
	.xword	0x52417bf8d1141439
	.xword	0xf050b02a6951f950
	.xword	0xc10f760f57e422f2
	.xword	0x0d9c8131ce59e010
	.xword	0xa0627898b360f02e
	.xword	0x05f1d79a576da00d
	.xword	0x4e9c2db7b4147581
	.xword	0xb08e1da592bae599
	.xword	0x89d13561059f2b07
	.xword	0x9d3cf9e6ec7c7808
	.xword	0x83b45f9bed93bb8a
	.xword	0xa2c3bcec9986a093
	.xword	0xe01befb58fec081e
	.xword	0xadaaf9e96eba85dd
	.xword	0x822a333b1cd26d4f
	.xword	0xf4010728b00969cc
	.xword	0x29c7b70bc3627580
	.xword	0xe309afd0d9d8e77f
	.xword	0xb0c871d400680522
	.xword	0x2c2e650b0d73c08e
	.xword	0x998111e2877d5ac4
	.xword	0x4ea4383138a777e1
	.xword	0x95680ad6ec6d8a4c
	.xword	0xd3d16ff5a769ffd3
	.xword	0xad73dd2c25348221
	.xword	0xca2ccef5bdca68a8
	.xword	0x68b5f72ee27deb27
	.xword	0xa50354fb368a86ef
	.xword	0x879dbde25993b51a
	.xword	0xb2bc34b3d31b7746
	.xword	0xdd37c0dd9930b8c4
	.xword	0x0c9a89d04ca2c9d2
	.xword	0x2565261a5f3b1fa9
	.xword	0x1e00f3f40e1e29f5
	.xword	0x482b8a2a3b6d44a0
	.xword	0x941fb7bc08a54890
	.xword	0xaee9be0b8b943567
	.xword	0x37c5c9676d4b5867
	.xword	0xeefdc78d8e1bdda3
	.xword	0xf9f31af659d595f1
	.xword	0x075f051c14e66e89
	.xword	0xa6ef442186a1954a
	.xword	0x58ac35320d0c1ac3
	.xword	0x15082935d5f1187d
	.xword	0x5c2a54ca0b7210f4
	.xword	0x2e80b5c29b5d11b3
	.xword	0x936ff5dc3bd928aa
	.xword	0xed761e408b8dd91d
	.xword	0xf9241e19c48674f6
	.xword	0x9cfaa5bafbdc3407
	.xword	0x540ff334399f1277
	.xword	0xf5777ab8009bc39d
	.xword	0x2d319fa25a9874aa
	.xword	0xc7b8757b1a3e35b1
	.xword	0x2ef9ed95dc8feb5a
	.xword	0x3e2ac85d0c957836
	.xword	0x885d5cde312d10d7
	.xword	0x8e15e586b2a05aa1
	.xword	0x527ad8f3609a936a
	.xword	0xc658555d5a9daae3
	.xword	0x381598af69e46fda
	.xword	0x149c16969d5685fc
	.xword	0xc6ad9fd100858def
	.xword	0x15518153b904dc6f
	.xword	0xade9e757faf974d5
	.xword	0x37b797475b9e8306
	.xword	0x52ceb070127c3eec
	.xword	0xf3c197a9b7c4d11d
	.xword	0xd9d62a290f485d47
	.xword	0x416ea35811c13cdb
	.xword	0xc0d6e2d4c509239b
	.xword	0x0587bd85319dfd1e
	.xword	0xa274274ceb873e43
	.xword	0x7d51d51a03051ed3
	.xword	0x8b8a6ba48d2e4a38
	.xword	0xc9adacdbaee0acf0
	.xword	0x729d0cd810055a11
	.xword	0x35ada5eee175d7a4
	.xword	0x36b0bbd32b4f5a09
	.xword	0x65e87248e9874883
	.xword	0x1347a378ba7770c4
	.xword	0x2bd56311c275ed86
	.xword	0x4812a0883e28cb7d
	.xword	0x395c6cd6d0778a1d
	.xword	0x06fcf911fbc9c2b1
	.xword	0xc5e21486ba1483d3
	.xword	0xf5802ddda8ef84b5
	.xword	0xeb33512e38d88379
	.xword	0xbe1f73c3e05c3881
	.xword	0xd51234a69f70a880
	.xword	0x73f1e2b3a48a7e4f
	.xword	0xe914db26f422ffc9
	.xword	0x5e60542b4755b2e0
	.xword	0x8b9d3dd876ab248d
	.xword	0xe40637edb642d6f1
	.xword	0x11d55399d96b6975
	.xword	0x18cda474c47f22c1
	.xword	0x2e738127818b529e
	.xword	0x73410bab0fbad295
	.xword	0xd649a6dfffcc6637
	.xword	0x9aba1c00f4797be0
	.xword	0x3869ff1a0c232a61
	.xword	0x5488213bdd065b1a
	.xword	0x6e2b9702ad21aef0
	.xword	0xfa70f6ead69687ae
	.xword	0xed06f88349fa6dbd
	.xword	0xa51bb1d92d1ad59a
	.xword	0x338558c201e3002f
	.xword	0x93574c3ee402c406
	.xword	0xfa58571730de0c59
	.xword	0x848bcf863ca1748e
	.xword	0x67c4d38423bc3468
	.xword	0x0bb1fa1091355c4d
	.xword	0x97e150d58e510f54
	.xword	0x0925ee4bff879305
	.xword	0x7c50fc18e3385385
	.xword	0x5d452244e5b15208
	.xword	0xaff56e496c9dab0a
	.xword	0x31d644be180e40b5
	.xword	0x1b8b796b098467d2
	.xword	0x1b2070946df65626
	.xword	0x0361e4244df5039b
	.xword	0xac7d820de8f307c2
	.xword	0x59300959ecc8e71f
	.xword	0x4d5cb2c74691b202
	.xword	0x333f437b00c1b2a1
	.xword	0x220ea98039277048
	.xword	0x5cc85511284b5984
	.xword	0x31db9dc25d4102b5
	.xword	0x1dfd7e8d16a5abf5
	.xword	0xf6c2837edffff4a5
	.xword	0xf968806a12450233
	.xword	0x8c12ad55393a09ac
	.xword	0xbbb53377ac3b7e0c
	.xword	0x2009a5eb360998d9
	.xword	0xe20835abcaf667fb
	.xword	0x9267292b81f5488b
	.xword	0x05ede887e31b8493
	.xword	0xf007a27b1667be96
	.xword	0x9896f1d7be432d8e
	.xword	0x31f0118ea70992c1
	.xword	0x0817e815eef4326b
	.xword	0x7a497717c0e896bb
	.xword	0x6352f82d33fd5c9a
	.xword	0x9912b23ff7b3af74
	.xword	0xa5287eae4f544ff5
	.xword	0x9e1bd04025245fff
	.xword	0xc46c5a84b7f1eca7
	.xword	0x08d84397bf1a4019
	.xword	0xc6e6b95b601f247d
	.xword	0xdcc5c71eaf62c4a9
	.xword	0xdbcfdb717fdbb7fb
	.xword	0xf2fd49b0538b232a
	.xword	0xece081aafa5ed232
	.xword	0x2e20380b5affea1e
	.xword	0x0f109d6dfa3cfe83
	.xword	0x49fe891e1a70cc84
	.xword	0x585477299d328fb1
	.xword	0x2ee0c403c901a6d9
	.xword	0x60c13f5ebc5e39f9
	.xword	0x4d99996ef628e0a1
	.xword	0x53a44c4679b2c811
	.xword	0xc832f88b1faab514
	.xword	0xfcd4ecddf7088431
	.xword	0xe5911a5a668850eb
	.xword	0x7489ed11bdbf984e
	.xword	0x77b213dcfeec475a
	.xword	0x8b8e1988f74c2fc1
	.xword	0xbe429801c98e77fe
	.xword	0x5cbcaee4063b9617
	.xword	0xd9db363e7259bf55
	.xword	0x82b602a1e253291c
	.xword	0x44c40ad493927c79
	.xword	0x46610e440e8a9e77
	.xword	0xa7036de5da13708a
	.xword	0x837616a3c8409e81
	.xword	0xb5fab93f7323420b
	.xword	0xe6fc7059048461b4
	.xword	0xdeb659a411e34d0e
	.xword	0xe31b90be85c2c1a4
	.xword	0x18da7efe708f5cfb
	.xword	0x7ed1b33fa9af5c9b
	.xword	0x21613d8dc61dc5b7
	.xword	0x938f4c92d7456588
	.xword	0xac464880bd642c67
	.xword	0x5917340de08f6727
	.xword	0x45707fc3e1fadf9c
	.xword	0xc29f52c516af7ad0
	.xword	0xf71f303b0a950706
	.xword	0x694f5ba8f14f1c25
	.xword	0x2436b015775c83c2
	.xword	0x7adc885fef59252a
	.xword	0x35ee3a4dd69d3102
	.xword	0x9507c51f7eb24c6d
	.xword	0xeb0d884cf2925b3b
	.xword	0x5a2aec8e03eeea10
	.xword	0x517c3346ab545cf7
	.xword	0xa79ae3d8b79e7245
	.xword	0xf65544f9dbe519ed
	.xword	0xa991a3b32b61404f
	.xword	0x9656a01e959fb78e
	.xword	0x2293d098a1e4479a
	.xword	0xc5c30793478a594a



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
	.xword	0xfb0d1bfb6f06b9d2
	.xword	0x8ac9e312504894a3
	.xword	0x0ed5b216a02792b1
	.xword	0xff8fa46ab95484b3
	.xword	0xc73cc190e9decb15
	.xword	0xb1d2513095317a1e
	.xword	0xf1d562a77695e1d1
	.xword	0x1c5abffdcc9924d4
	.xword	0xf8cb540dfcaa0cb9
	.xword	0xc9ddaf39993edcb8
	.xword	0xd667e30c8efc48f6
	.xword	0x70f9f7001f8764a2
	.xword	0xe783c91d2ea87cac
	.xword	0xa7ace9cdd90efde0
	.xword	0xcad68fcef0c85057
	.xword	0x303c28c80d53c852
	.xword	0xf0da83a1a127e66c
	.xword	0xccc9ecf7ea19942f
	.xword	0x796db6ace11388cb
	.xword	0x11e16b08cb456fbf
	.xword	0xfec4a7db93d1fd87
	.xword	0x0e02179980675c4f
	.xword	0xa934760cd1d27d88
	.xword	0x354ac3f2923d290f
	.xword	0xe737743e4f08df9e
	.xword	0x8ae5354bee0f4e10
	.xword	0x700b691e4e1409d7
	.xword	0xf65020b256eb7b6d
	.xword	0x7348ff5714284a0f
	.xword	0xcc39764e4941c07e
	.xword	0x1e5dc6e7833d8f7e
	.xword	0xf87878aafdfbce20
	.xword	0xbce4ccaf8540daf2
	.xword	0x78866efd64ddda5c
	.xword	0xb0c9b606a0917261
	.xword	0x985904050ad6ceaa
	.xword	0x7b02309e6c9b7361
	.xword	0xbc00e9290c386323
	.xword	0x4caaf97130668005
	.xword	0x31d0a16d5e855749
	.xword	0x2a7cac6e49ae275a
	.xword	0xa409f8be7e9010da
	.xword	0x3dac35c879da4f35
	.xword	0xde2ea1c47cc27d07
	.xword	0x60e21341705eb0d5
	.xword	0x78884fa0ebbd8107
	.xword	0xdfce990fa9246eb3
	.xword	0x7beae84932e78082
	.xword	0xb0b1fe07e97c0852
	.xword	0x2fcabe617033066c
	.xword	0x66ed28a24b2144bd
	.xword	0xf4be4dcf6d28220b
	.xword	0x7a0c4830cde0d8de
	.xword	0x9c5c88230eed5247
	.xword	0x19b047c7cfa2bcb8
	.xword	0xa8629169bb535491
	.xword	0xce1961246aa5c24e
	.xword	0xb7370fe7ab6846b8
	.xword	0xa48e713644f65e90
	.xword	0x4fb56c54a699c94d
	.xword	0x4822b391bd21d20b
	.xword	0x74401cea7a6d29bc
	.xword	0x33f529f75c9251a0
	.xword	0x5c0d60209d31e46c
	.xword	0xfef4a9eec993ef3e
	.xword	0x9ddfbb5f290b3e07
	.xword	0x3c20c717fe79202c
	.xword	0xa8ae45c2390ca46b
	.xword	0x12e1ba97ba66afb3
	.xword	0x68f816fc189e6a62
	.xword	0x46a1333021992fc0
	.xword	0x7d3e0ad84a262bf0
	.xword	0xb8500b5cbc7b8c63
	.xword	0x8acf6a6b012cb2fd
	.xword	0x00b7ecaf21897ea5
	.xword	0x29f2ef8219679a21
	.xword	0x7a626a55a86f1558
	.xword	0x9faffefbca3dd01f
	.xword	0xa30854bf922956c4
	.xword	0x7a362c5700ee8a83
	.xword	0xbf17d9597e2b9f03
	.xword	0x0a7a6afc08796c7c
	.xword	0x431183372a568e33
	.xword	0xf7c7795555ead760
	.xword	0xa88a1a7721764977
	.xword	0x0266a3eded7df7c2
	.xword	0xdc4c8dfd720cfda9
	.xword	0x8926beabf127d4bd
	.xword	0xe43d3b9ac26cabb9
	.xword	0xdff01cce63c7b6f7
	.xword	0x64410ef1072b2bff
	.xword	0x90ebcf5e391f0ac1
	.xword	0x55c047e53ef76ecf
	.xword	0x5b93607db4599449
	.xword	0x845741ababed02b3
	.xword	0x6a6429994d029be8
	.xword	0xf285b76ab476c729
	.xword	0xf5d55befffc87195
	.xword	0x3d1804501b48ffe2
	.xword	0x2e0e3784da547a1c
	.xword	0x78a1008e6faad361
	.xword	0xc418b3308b77487b
	.xword	0xb64a631b386534e7
	.xword	0xb1e04f06f7d2f62a
	.xword	0x5acbbd408c1b82c3
	.xword	0x84902fa3e3255566
	.xword	0x3d8a26243ba6785c
	.xword	0x0b7ebe9f4edddad2
	.xword	0x8855e15857a65d65
	.xword	0x4477039bb88a50f0
	.xword	0xf7ff5b0fdbc0f0bd
	.xword	0x809da1aa28071c05
	.xword	0xd7ce2e36a1b93d0c
	.xword	0x42ad40cc06460b25
	.xword	0x144468e259c861d5
	.xword	0x3abc6fca81a87d04
	.xword	0xe629f250ca9bf514
	.xword	0x461ce5b11ba357f8
	.xword	0x4e0d17eb9c1a9fe1
	.xword	0x16fc1b95cd45d882
	.xword	0xfa8ca53e0536decd
	.xword	0xefe39d2c8aa995bd
	.xword	0xc20ef69f64e137ed
	.xword	0x90c965008bfa1e40
	.xword	0x32c9dcbdae67a304
	.xword	0xf14fd3587b71c48c
	.xword	0x05e601ed249c7f1d
	.xword	0xf97fc8e4fbfaef6d
	.xword	0x3f075f5ab024cec5
	.xword	0xdf4efee33e7de5d0
	.xword	0x4b33a5cac386da34
	.xword	0x2c6ce713a56cb186
	.xword	0xc1e559a5d19deff4
	.xword	0x8bbd7ab598ffa2e3
	.xword	0x4331bf03945d5af2
	.xword	0xffa35146c3760d47
	.xword	0x971ad9b1e1f4604b
	.xword	0x56042c4c8ae8b006
	.xword	0x4f55a5ec76ffbbe2
	.xword	0x76fe3f4b799e0a6f
	.xword	0x88d4e847d838b518
	.xword	0x2782d8b9977df5ec
	.xword	0x34cf13dbccbef949
	.xword	0x112c693812234f95
	.xword	0x506412e1a3d8febf
	.xword	0x7d9812efef28b0a8
	.xword	0xe2d3f6d034ea674c
	.xword	0x1e69ad5d6d0ea85b
	.xword	0x7e8c9e3b7022af06
	.xword	0x3f51b771d12125c7
	.xword	0x3b0150108e6c36b7
	.xword	0x324f4f22a2ecebc5
	.xword	0xb3ab76338dce6a11
	.xword	0xb640aa41ba58dae5
	.xword	0x96bba87045d61847
	.xword	0x04b627dce425b53b
	.xword	0xb42468cd300812be
	.xword	0x0e0e4187d47b0a88
	.xword	0x6e07b9780a197eca
	.xword	0x24df11121b0f5e39
	.xword	0x6024248486730ef9
	.xword	0x80fcc1f477eb09ad
	.xword	0x05988fe6d18395b3
	.xword	0xb53d5c12e89adf9b
	.xword	0x74324ddd22b99205
	.xword	0x1a61b2a76a4f812b
	.xword	0x0474d21b47b6fbc1
	.xword	0xd38e29970bb8c52f
	.xword	0x3c7a3681be290a5f
	.xword	0x1dab67843ddb82d4
	.xword	0xcf941fa30a67e673
	.xword	0xd80b28ce6e8cc379
	.xword	0xac627883f955f0ed
	.xword	0x7b5ae696b35a95d9
	.xword	0x6c7cff1ebf12578d
	.xword	0xa0155dac89debc34
	.xword	0xa7e5003ba52d3faf
	.xword	0x4aba7ffc56729390
	.xword	0x192a4afb2c83aeae
	.xword	0x898e7ed17b0d9aba
	.xword	0x88b4c27375c44782
	.xword	0x19ec6e7b51539418
	.xword	0x27df44ff29a275bd
	.xword	0x9c0ab7a559732433
	.xword	0x3799f14574e20ae9
	.xword	0x59579f2c14e8e52f
	.xword	0x8b6eca84cd171eda
	.xword	0x130c42e5cf98af14
	.xword	0x2a0771582ebca8c9
	.xword	0xe54f04d21d9cdc53
	.xword	0xf1c51aba1476c5ce
	.xword	0xd2572489909ceff8
	.xword	0xc4390e0d326ccdb2
	.xword	0x16cf21ea2b33d71e
	.xword	0xb794be310e4d269d
	.xword	0x4f93a49bcef927ed
	.xword	0x29f68d377e31f3fc
	.xword	0xa8849e5c3c3e1ffd
	.xword	0x8cb6bc045441b2f2
	.xword	0x523d2a7d68e99da7
	.xword	0x53313379759b872f
	.xword	0xcb41bce1540ff28d
	.xword	0x9c7f0557ff02ffa8
	.xword	0x788aa62933f3e3fe
	.xword	0x1812f8b7b53bf4e6
	.xword	0x7b5a96cdebf7d7e2
	.xword	0x7d52dde7961e7a93
	.xword	0xfa6e85e9a94e38c5
	.xword	0x153c2f2fab392da5
	.xword	0x2034b02f61cce6bc
	.xword	0x8c70a9c3a8aead7e
	.xword	0xd50edac49b4c19ba
	.xword	0x81feeffd892b04f9
	.xword	0xd29cd9662ac38563
	.xword	0xf93025f69eec3db5
	.xword	0x2df8b85a23e95589
	.xword	0x4a2d55a480c0f71c
	.xword	0x22694274ebc954a8
	.xword	0xa7f8cae014b202f0
	.xword	0x9041a0b46d344ba1
	.xword	0x10b2da41ff54c64e
	.xword	0x5c78d402f37f77ff
	.xword	0x133936557f9b5480
	.xword	0x964c3eda2c65ff3c
	.xword	0x9c4af8ab94f6923c
	.xword	0x69ca7b42bed492b0
	.xword	0xac38a45d9a98c7e6
	.xword	0x7a32ab95ec347731
	.xword	0x07b483e09731a48d
	.xword	0x5ad57e65c7402724
	.xword	0xa5057e124c040b23
	.xword	0x8fb6cabcfc4bacab
	.xword	0x1fba4db38b9899b9
	.xword	0xea4ae964e7b8fe61
	.xword	0x8f85416123b9acc2
	.xword	0x5b787a68ed5f7ce8
	.xword	0xbd338be9b4b8593e
	.xword	0x15a49f7df8c65f2e
	.xword	0x201b4d3fcbad1e2f
	.xword	0x0465dd05e37483ce
	.xword	0xf51e1a94fab41d99
	.xword	0x57c2bd71606ecc58
	.xword	0x7c3d5d74af0d3b1a
	.xword	0x322ee301557d375f
	.xword	0x332ecf0c1c4bc45d
	.xword	0xf2cef3ed9566ba5f
	.xword	0x4c6bfb4887b2923b
	.xword	0xe50b63307e6acc97
	.xword	0x8d08798558f1dcac
	.xword	0x3311b709d32f75f6
	.xword	0x6451f5404ed633c8
	.xword	0x6d0f08809da36678
	.xword	0x33004666303e464e
	.xword	0xdf4e2ba7f87dfb2e
	.xword	0xe37c21f12bd696bb
	.xword	0x7660251ca7e28736



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
	.xword	0x00f0420cc4eddbe3
	.xword	0x6ed0bbeefa2c90a9
	.xword	0xc06db962a761c0b9
	.xword	0x70f36ab88833e8ff
	.xword	0xc8af0f3efa8891cd
	.xword	0xb8c671ad387ed42b
	.xword	0xd7587a7e250b3997
	.xword	0xfb2fb545cb14336a
	.xword	0x69b1dc16c971004c
	.xword	0xf5efaeb37c78ed0a
	.xword	0x83608cbca622aaea
	.xword	0x7f83942e507b23fd
	.xword	0xdb1d7d6b6fe7344a
	.xword	0x2c9fc9f81c0a3df3
	.xword	0xe7bb0cf19907e319
	.xword	0x145ed9982a014093
	.xword	0xae4988c0ac2d36f8
	.xword	0xe2b2aa18167b1bde
	.xword	0x0573e52c0d0a270d
	.xword	0x4388606e3a384551
	.xword	0xe6b4f4df29b3d775
	.xword	0x0a1a98c0caeb3115
	.xword	0xb67939b15915429a
	.xword	0xadef2152fb10d490
	.xword	0x324016bdc66e05e8
	.xword	0xa2d57e5301144093
	.xword	0x7ceed877cb0c837c
	.xword	0x3da181de59b20d38
	.xword	0x52d969314a195a4c
	.xword	0xceac678dc833048b
	.xword	0x7abe7a5712bd0f96
	.xword	0xaeb2c2311ca631f4
	.xword	0x109256fb41517a35
	.xword	0xbc599e4766679529
	.xword	0xd1893108391ab5bc
	.xword	0x6d255d9c7215c6ee
	.xword	0x18c12107a52a507c
	.xword	0x8c2f77a8d7d08937
	.xword	0x2393d2fcab2cc4b2
	.xword	0x3edfa6b93c789eff
	.xword	0x6ccc7d793a48502b
	.xword	0x79585dd8cc39be74
	.xword	0x674683d7efb4b444
	.xword	0xbf8e7b324d624dcf
	.xword	0x64a1dab7b06f6a51
	.xword	0xd889de7824b0f730
	.xword	0xa15fbe2351ac79b7
	.xword	0x7e25ebfde8d36a47
	.xword	0xd905c8888eabd207
	.xword	0x21ae03a3abbe9fe6
	.xword	0x89d9723fd7d11f92
	.xword	0x84013f17ad432f2d
	.xword	0x2fe00c5131a52401
	.xword	0xafd0d8d18783887a
	.xword	0x7fb45d72babac6a5
	.xword	0x3169d3100fef9d2d
	.xword	0x7ce034a5fbe68298
	.xword	0x1e30ffdfbbbfcb21
	.xword	0xe7619a4527ff08d4
	.xword	0xb6df1d747c977e20
	.xword	0xb44b2e475a87aa77
	.xword	0x2beca0f55baab842
	.xword	0x0e9cdfc3b385ab63
	.xword	0x251a2c1331233ee7
	.xword	0xffa1c4393e99c7b1
	.xword	0x5c84237ee4e0b46e
	.xword	0xd6f54f8f683be284
	.xword	0x72669f1b4a821205
	.xword	0x54e46f03d5952cdc
	.xword	0xefd6cb3d192fe51c
	.xword	0xf104f356c093e10c
	.xword	0x5479a7da40304c30
	.xword	0xe1a908a439f522e6
	.xword	0x4d4417d05e2fbdcc
	.xword	0x5984d7fe617800de
	.xword	0x62c5410b32966d5a
	.xword	0x500103441d0c63ae
	.xword	0x9f2eca96139aa11f
	.xword	0x2d42c10c0fb9096c
	.xword	0xce542d59ba35fc0f
	.xword	0xf46d4a2c2cf021b2
	.xword	0x2e6dac5a5ba29e9d
	.xword	0x793e0171f0bc9c16
	.xword	0x7b0da7a5af88e9b7
	.xword	0x0a177301bf8da85e
	.xword	0x97e5625dd29ac413
	.xword	0x605d92dadecc6db8
	.xword	0xa1457087b7ddc0c1
	.xword	0x047ad923e8e55a76
	.xword	0x9a78c5ae8219ae02
	.xword	0x833ddd9f3e3e42b1
	.xword	0x4da7367e42098913
	.xword	0xcba28dc07cdb95e1
	.xword	0xfec3d377f30e7da9
	.xword	0x8ee4117d09394e7b
	.xword	0x34ec0cecc8b309cb
	.xword	0xcaeecd7a7b541482
	.xword	0x2191fc9ffde96219
	.xword	0xb927f8f35cb5a955
	.xword	0x03d7b47d105aa027
	.xword	0xcb05b77db268b94e
	.xword	0xa2d629aa03b79a47
	.xword	0xda9a21a7342d128e
	.xword	0x2f03a5664e390aff
	.xword	0xfe27228ac59b0a7f
	.xword	0x10bf007c8f3c83e9
	.xword	0x8aa608de8063c2e5
	.xword	0xe3c9b1d88cd62985
	.xword	0x41a8a8d11a4b83e8
	.xword	0xb9dd539049a8d973
	.xword	0xf69a220eb40f8c2a
	.xword	0x0088693a9c32303a
	.xword	0x4a3db32420ef9f85
	.xword	0x17c1daaebea50661
	.xword	0xe8cd120d899a63a4
	.xword	0x73c481e978c167a2
	.xword	0x5b6046096feef09f
	.xword	0xfa1f66ef06da027d
	.xword	0xdca2233437334a40
	.xword	0x0244999358140304
	.xword	0xb9ef7e7490efab88
	.xword	0x03a31ef8c5a65d94
	.xword	0x098ec2595f93a25c
	.xword	0x4437fd34a6ee22db
	.xword	0x14c40b86e2077982
	.xword	0x6a4c9fc17535e663
	.xword	0x506ba24a3e0128ce
	.xword	0x24d2b104e96b6617
	.xword	0xe74fa27d3fc852ac
	.xword	0x6c7856e85820aaf4
	.xword	0x8534d0e149d6b083
	.xword	0xa1bd0648da9565eb
	.xword	0xd2914cf106074b52
	.xword	0x62c9498f3b47cf22
	.xword	0xd0791423c2fb9604
	.xword	0x9b2f5b5187d447f2
	.xword	0x40a5bfd75a340400
	.xword	0x190678ac0888bb79
	.xword	0xe09bed6ec645ea07
	.xword	0x2c28f1c83841569b
	.xword	0x3817c916ce25d9ff
	.xword	0x9506dc0d42528524
	.xword	0x917cd1e73a27d3ee
	.xword	0x9803b5da2238b4c9
	.xword	0x14c87d9e15a56cce
	.xword	0xe87ae2ff322262e6
	.xword	0x9919975c8626f37e
	.xword	0x70b98902e36f13dd
	.xword	0x9181b3b4bf3820a2
	.xword	0x7c5242e7ea05881d
	.xword	0x62b2615f06968cfe
	.xword	0x132d5bab67106fa5
	.xword	0xadc340c1647e1f2b
	.xword	0xd5f92afe03115664
	.xword	0x3364bb345d272b3a
	.xword	0x1de45a732e0b5b01
	.xword	0x4c174cd598bde660
	.xword	0x9211ed8fc9885300
	.xword	0xb5e2acad90dbb118
	.xword	0x9bbf21092767e466
	.xword	0xf86aad39a5bfe806
	.xword	0x1861e975e5579feb
	.xword	0x063c43adc629991f
	.xword	0x0825b947318f182e
	.xword	0x96916733b8a2ded1
	.xword	0xa2821cb88c30d61e
	.xword	0x909906e22d7e6dc7
	.xword	0xf3b8e989ad1f10bc
	.xword	0x337470f8b1e4f242
	.xword	0x25755ed49e0e79d1
	.xword	0x75096c4c6c2b495b
	.xword	0x5d474152d6efa9d8
	.xword	0x22d5e04b75e3d1a2
	.xword	0x5924f66824226f9b
	.xword	0xfc67853f71588f7e
	.xword	0x610750b2c1012e10
	.xword	0xc04ca48c7063d43a
	.xword	0x43a7dc8abeee8cb9
	.xword	0x75f258d736854f8b
	.xword	0x615776cea8568707
	.xword	0x9eee19f8093bad2f
	.xword	0x9caa759cf7d187c9
	.xword	0x7e64ad63b0815b33
	.xword	0x15c660eb86d49c10
	.xword	0xe85013f559042288
	.xword	0x53b225317fd39462
	.xword	0xbc357be341ba7e34
	.xword	0xa2d78895ebdcac65
	.xword	0x91219a3e93c43940
	.xword	0x15b78bb42f4aeec8
	.xword	0xf2712ee9b0ca5310
	.xword	0x3501fd51bd3c2a3c
	.xword	0x2839974ddf71b3a3
	.xword	0xb5531de1167c8c41
	.xword	0x6aa0a6a679098f7c
	.xword	0xb44a44268c7051a8
	.xword	0xbbbe75260ff5efb9
	.xword	0x96a72a807faeb46c
	.xword	0x56af9198222c4574
	.xword	0xa218ec8d92e80a9c
	.xword	0xbaf87dcbcde9d0da
	.xword	0xb21d84820af41709
	.xword	0xd0ba56bc8bd114a1
	.xword	0xaa3c2929af94f9fb
	.xword	0x8ce593c37d8b3b3f
	.xword	0x5e14a5ae71a424de
	.xword	0x5c5d61198023e246
	.xword	0xc5ad4fc8b344245b
	.xword	0x6c57fdd7f9584e3f
	.xword	0x7e9ecf5c48271f7a
	.xword	0xc7dbfdff1c61c980
	.xword	0xc79847cce9f38089
	.xword	0xb0b9b103b5041c17
	.xword	0x8508f657768a1b5b
	.xword	0x5252da14ae3356d8
	.xword	0x115c3bad50b231c5
	.xword	0x94de8ce1a1765c69
	.xword	0x233e94a418a27942
	.xword	0x5974a5b75335b11e
	.xword	0xd150211b96e99fd1
	.xword	0xbfbb329ae97cb386
	.xword	0xb23a287abe08bba0
	.xword	0xe54b854c92437e9e
	.xword	0x5228fb44cd8d2fe2
	.xword	0x7078c75c9a6cb20d
	.xword	0xd3a677b2f45f9036
	.xword	0x3cd96e8eb1fd7948
	.xword	0x1274726d26700b33
	.xword	0x63d088c8535a096f
	.xword	0x66c9e439e87e3634
	.xword	0xc24427611bd5e755
	.xword	0xdff8284627140d59
	.xword	0x47207a79dace9409
	.xword	0xab50b7a2ecb55e58
	.xword	0x50139c0e9a0674bd
	.xword	0x9999bbe25b5a82dc
	.xword	0x7c316cf1b94672bf
	.xword	0x7419d2456c5c73bb
	.xword	0xe8e4ea858da8e243
	.xword	0x345ccaaade8a94d3
	.xword	0x994e0e031b7dcedb
	.xword	0xc10f5016809f9ab9
	.xword	0x7a3018ebd2e158f2
	.xword	0xf1cb73d15977be10
	.xword	0x9a8e9c6c986bddb1
	.xword	0x9866fc36de030ae7
	.xword	0xf25f6b18241e56ae
	.xword	0xeb5377ea78fa57ff
	.xword	0x6931e0858be75d58
	.xword	0xbaa5828fb01c284c
	.xword	0x63a7218ca6aba42d
	.xword	0x3e96dd7e0aca22f6
	.xword	0xed98d9396290c70b
	.xword	0x335bc7caba48b9a9
	.xword	0x98ce197fd8509b7f
	.xword	0x8acaec1fbbb33846



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
	.xword	0x7303b50323d61b4d
	.xword	0x17d20965d9a84e28
	.xword	0x1df097619ddbe74b
	.xword	0x44089e519abe77ee
	.xword	0x00f657b914e9f34e
	.xword	0xfaae2a95df4a25b2
	.xword	0x847954299660b2b7
	.xword	0x4491a5594a9bb512
	.xword	0x38c2d4c9e359fd6a
	.xword	0x167e796f2de8e227
	.xword	0x07185d8720a10650
	.xword	0x53676e915da61ac5
	.xword	0x9af70d98561b2ad0
	.xword	0xc03006a29ccf37e5
	.xword	0x1fd2932682c96006
	.xword	0xf5c0e50fc4fed104
	.xword	0x4cb793778f11e527
	.xword	0x99df5e4e01a2a77f
	.xword	0xbe96d839e0ef0fb3
	.xword	0x8904541f76a67f8e
	.xword	0x2c6190ff8a5f3f0c
	.xword	0x044913b5547220b4
	.xword	0xe379a92cc7398997
	.xword	0xc2ee1a00716dfa5a
	.xword	0xbf04282cfbf0fade
	.xword	0xff3bda4c48954792
	.xword	0x49b255593760d2fd
	.xword	0xe8e24f7f61883616
	.xword	0x197bf6fd51481d45
	.xword	0x2b6ba31014bb6d78
	.xword	0x79f718ff6c8003e4
	.xword	0x468f33c5eb518a9c
	.xword	0x1f9e4e9585373590
	.xword	0x6d7d4635c2bfebc7
	.xword	0x7a760f6aa29c4320
	.xword	0x1cc4a909ea9e40f7
	.xword	0x64c85b521ed88c95
	.xword	0xa4f79f0ff9eff2c6
	.xword	0xd87213cc8f54b58f
	.xword	0x8cc8a149ca714706
	.xword	0x0331884f44a0b4d9
	.xword	0xf19007183c13d193
	.xword	0xb7c7d0d3e51171bd
	.xword	0xf46b7515354be198
	.xword	0x1ffa6c2f6b3dc297
	.xword	0xba1db5c56ae85dbe
	.xword	0xef4225617019fe3b
	.xword	0xee1fc8dbb701bc97
	.xword	0xedad00a906f08daf
	.xword	0x8dd974ecd05d7f94
	.xword	0x3487f89a3d64f975
	.xword	0xa2f3ab6c2341b55b
	.xword	0x49bd9ea9076913d6
	.xword	0x590c894e5c029b3b
	.xword	0xf7a37b1284c70a0d
	.xword	0xd1078253b381b23d
	.xword	0xee32f4ed99193300
	.xword	0x06f891182dc22e89
	.xword	0x8dded2e546941757
	.xword	0x050bb166b3b04f9d
	.xword	0x98af22ae4bf71813
	.xword	0xc98a8dba80a9adc1
	.xword	0xc013ade1c73792c4
	.xword	0xe640469d74448f0f
	.xword	0x65324670e7082e86
	.xword	0xae00c51129c3501f
	.xword	0x6441a8d064be9adc
	.xword	0xa4f9d08052c5ab70
	.xword	0xf68e1c3f2227e501
	.xword	0xdd7c60e0c5a2638f
	.xword	0xbdcb1827ae493748
	.xword	0xb45222aef2c9c582
	.xword	0xef1230a4901e302b
	.xword	0x99925bca1da6db77
	.xword	0x8e79c88872a0c5e9
	.xword	0xa157055c7c394589
	.xword	0x42be2ebdc2600ec2
	.xword	0xddf5f1a637be328e
	.xword	0xe86c657c9b8e25f3
	.xword	0xe9303bfb6547b6b5
	.xword	0xfca4753d4e41e7bd
	.xword	0xc9a28b25b3a42c38
	.xword	0x9f8c8a40ec2c6b49
	.xword	0x11a97667902b5621
	.xword	0x1a82af76cd01a0d4
	.xword	0xe7bc7ac10cd35c2a
	.xword	0x8a3b1eba9ebc5972
	.xword	0x36f46ab04061059c
	.xword	0xdc5d8af15a4d615b
	.xword	0x8be6e8099d9b1ff7
	.xword	0x0ad1be968d8b0c84
	.xword	0x729c8bb0039020e2
	.xword	0xff79699639124294
	.xword	0xbee0175733cc1bfb
	.xword	0xacc689b6b8bf0514
	.xword	0x00529cdc280ae1fe
	.xword	0x95b92bf1b7338040
	.xword	0x9a5299cf555aa980
	.xword	0xc62d70c0e3816ee6
	.xword	0xca6b8bcf43b6bf2c
	.xword	0x1ed9cec49ec04a9e
	.xword	0x9574c97c29a68247
	.xword	0xf7ffc054ad125e5a
	.xword	0x645572570596324e
	.xword	0x2bd2a51a4ce617f5
	.xword	0x803809f0474d7098
	.xword	0x3c876ee162b5e2ca
	.xword	0x9beabc25ab76dc24
	.xword	0x7d1fe3d8da98dbc6
	.xword	0xa30a061d109e47ee
	.xword	0xa4a15b74704e3721
	.xword	0x186687bd36a87bdb
	.xword	0xdfac479e13fc9ffe
	.xword	0xbf8c72b882a6f918
	.xword	0x57c716c19f9cdc7e
	.xword	0x2afd163d96f8134b
	.xword	0xce885d368f195f27
	.xword	0xa170fd3c6b589f9a
	.xword	0xb9710f32c66b7c19
	.xword	0xbf5e18c046540cca
	.xword	0x61708cba2cd25673
	.xword	0xcd19472fae50f616
	.xword	0x5d4ae21469d86da3
	.xword	0x0ad437044832f1bc
	.xword	0x6765105026306ace
	.xword	0xb8772d3fb6378a3d
	.xword	0xc7211c316578d65c
	.xword	0x871b2c1d19047341
	.xword	0x66bab294602c0599
	.xword	0x62ece885faaadcd7
	.xword	0x720021ca5dc843fc
	.xword	0xa463e768c1d18046
	.xword	0xfa2e581e4d2769f0
	.xword	0x60292b2446b530f0
	.xword	0x277f0886b719182e
	.xword	0xb31a1a72c47bc311
	.xword	0x744b0da749cee80a
	.xword	0x88e1d296763cd303
	.xword	0xfeb75ebdb08d86ae
	.xword	0x79f729f544c8fdc3
	.xword	0x7a2cc3f4f3c8f47d
	.xword	0x6a58f2ea5cbe3457
	.xword	0x7910fc6c0716e8d2
	.xword	0xa2b67a7e6abd138e
	.xword	0x3f6cda5afb32e71f
	.xword	0x6164bc6803bbba03
	.xword	0x74705a0bf6fb97fd
	.xword	0x50b8d7e06061133f
	.xword	0x7818742956326274
	.xword	0x65decc0c361d16d7
	.xword	0x5748da749f83d50c
	.xword	0xdb3e39a405a5e5c9
	.xword	0xf6777ebcdd2c15b6
	.xword	0xde6e1dc615d62c5c
	.xword	0x1f3c9b250cdcda52
	.xword	0x9aafcb25292a7824
	.xword	0xece52187b3f92ea3
	.xword	0x8f5bd10227014ee2
	.xword	0x831619a22ce77bc2
	.xword	0x16930d98234eaf87
	.xword	0xd84cc721349b2113
	.xword	0xfca89bcbd7f164f6
	.xword	0x98d7c5b1e254509b
	.xword	0xd0aa4b79d81c4999
	.xword	0x4458163171101cb9
	.xword	0x420e7dfb561a7ebd
	.xword	0x13bfd619c8ed00b0
	.xword	0xc9896921ee8aa3d0
	.xword	0xa9c30c8b82136e95
	.xword	0xcc3516238b5a1613
	.xword	0x004e81ed543d9faf
	.xword	0xba672585f2787774
	.xword	0x91582a6c5085ffb2
	.xword	0x146efbfe6bf0db71
	.xword	0x78e39c7b02aaa3f0
	.xword	0x9c7f6d17248676ae
	.xword	0xa18482821a234aed
	.xword	0x6ae56c914561b034
	.xword	0x2d50d940ca91f352
	.xword	0x67e799b1014ebfd8
	.xword	0xacf1f53befe34ae8
	.xword	0x34a911cae9cdb79e
	.xword	0xfb5035ffd6c12c21
	.xword	0x9152f111af1567a7
	.xword	0x3dd1c1bed82bcaad
	.xword	0x1e382b69da8c9973
	.xword	0x55c7a01a08623c30
	.xword	0xb3e239624e85852d
	.xword	0xc9d57f98f79a89c1
	.xword	0x419dcbac5c44ae68
	.xword	0x3eba8d960988789e
	.xword	0xb746a6da262e943b
	.xword	0xb75df4501ea514ef
	.xword	0xf03d46a471442afa
	.xword	0xc9a43251206172fa
	.xword	0x8d7b7f7fda80e9d0
	.xword	0x1a2f85bc6261a2ad
	.xword	0x5d374585a5ee97d8
	.xword	0xb03b8df805030466
	.xword	0x05be50c5b40e10b7
	.xword	0x8fb867d808dc73fd
	.xword	0x470dd452ccf9ff29
	.xword	0x267510d9d22ea234
	.xword	0x0e1054cce05a65e0
	.xword	0xe854ca43491c644c
	.xword	0xb2fe1cb1a7c815ec
	.xword	0x96e43b2cd37db322
	.xword	0x9ae52864c27b88c8
	.xword	0xfb3e677049b2ead3
	.xword	0x80d6ab9e9e17d80f
	.xword	0x479edf5fb9da4c67
	.xword	0xfd46cd7dda5344cd
	.xword	0x261ab7798e4e27fd
	.xword	0x2343ae2b86e12455
	.xword	0x53ee004ca8f37892
	.xword	0x7dbeb75ae8a16907
	.xword	0x02961f4b645e0fe7
	.xword	0xc3b997680a726242
	.xword	0x193bfb80a3b9e082
	.xword	0xb36077b8b1015f12
	.xword	0x54d281376e25caa5
	.xword	0x34381d80911d913c
	.xword	0xec0fb28987263d77
	.xword	0xe2312505b822495a
	.xword	0x8e76579338a9c341
	.xword	0x8862501ae846e575
	.xword	0xdbdc52f1318f82c3
	.xword	0x11330292a224c455
	.xword	0xbd3dbe8523e17faa
	.xword	0x1a315e379c32cd85
	.xword	0xa1ef81de66fb3e75
	.xword	0x24ba09ea85eeea9b
	.xword	0x7803eeb6102ecaf9
	.xword	0x67fbbd62bfc457ac
	.xword	0xff7fc790d1d7a199
	.xword	0x1344ffb7b4731bff
	.xword	0xd8b69695152d3bfe
	.xword	0x26834dc682a644ea
	.xword	0x4ddfc447eead9bc0
	.xword	0xdf36dbcc30a34241
	.xword	0x827630045fcfe0a7
	.xword	0x977545a1afcd416c
	.xword	0x3ab3d90a4e37de5e
	.xword	0x713615c7115800ef
	.xword	0x787f38f4f0b6999c
	.xword	0x384d4a42ba6251dc
	.xword	0x4849a05d3b31f381
	.xword	0x20d8fd0cd9065502
	.xword	0x146a4620a732e1fe
	.xword	0x478b2105ebdef7f5
	.xword	0xc76450da45e30987
	.xword	0x8da4dba3fc14a3a7
	.xword	0xd2c2c16c5d54ec01
	.xword	0x00e755abe2315ec6
	.xword	0xcd77d84d1ed64d14
	.xword	0x2316144eb76bf7f2



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
