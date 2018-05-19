// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_rand_1.s
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
   random seed:	558183493
   Jal pio_rnd_basic4.j:	
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
!loop0:	
!	ldub	[%l1 + 0x7f], %l3
!	subcc	%l3, %l2, %g0
!	bnz	loop0
!	nop
!	prefetch [%l1 + 0x3f], #n_writes

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

!!***********************************************************************
!!IOSYNC cycles to start sjm
!!***********************************************************************
!
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xcf00beef00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0xdeadbeefdeadbeef, %g1, %g2
!setx 0xef00beef00, %g1, %g3
!stx %g2, [%g3]
!!=====================

! initalize 
add 0x0, %g0, %g4
add 0x0, %g0, %g2
add 0x00f, %g0, %g5
setx 0x800e000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

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

! Register init code

	setx 0x2314db1c3ffb9aa3, %g1, %g0
	setx 0x09260f6d04aba1b6, %g1, %g1
	setx 0x9dee2442cf37e5c1, %g1, %g2
	setx 0x1134c157d36ba8b1, %g1, %g3
	setx 0x5838edd466b75468, %g1, %g4
	setx 0xb7800b505f8a302d, %g1, %g5
	setx 0x3ffbdbb69a5c64f9, %g1, %g6
	setx 0x56e951a99d037f9e, %g1, %g7
	setx 0x62d06064cee6d572, %g1, %r16
	setx 0x8f98cbdc2bebf9f0, %g1, %r17
	setx 0xb4535575fc950d6c, %g1, %r18
	setx 0x318fa0a9a9f25f7c, %g1, %r19
	setx 0x92861bf8bd00689d, %g1, %r20
	setx 0xd9fbe08e76b01521, %g1, %r21
	setx 0x0ee76af63ed5981d, %g1, %r22
	setx 0x04af0cd622cda990, %g1, %r23
	setx 0x168cc85c32dff24c, %g1, %r24
	setx 0x15e6df64d24cb7c1, %g1, %r25
	setx 0x8d07b8455f08cd87, %g1, %r26
	setx 0xd78f9d5b15655e0a, %g1, %r27
	setx 0x63e248566dcf22d6, %g1, %r28
	setx 0x11735fe23934ee46, %g1, %r29
	setx 0xb4df8e70e935bc6c, %g1, %r30
	setx 0x23dfe6cb54c71295, %g1, %r31
	save
	setx 0xd62b05bdada1f3d6, %g1, %r16
	setx 0xc22146a6c4695000, %g1, %r17
	setx 0x9465548e85102833, %g1, %r18
	setx 0x34076931ab566a57, %g1, %r19
	setx 0x78d5893e82bf0ac7, %g1, %r20
	setx 0xb075ed5e03f00fb3, %g1, %r21
	setx 0x3c67941cebc14eb0, %g1, %r22
	setx 0x1fd92de88ce53084, %g1, %r23
	setx 0x5da5012e2a03d396, %g1, %r24
	setx 0x44e6cd020d3871d5, %g1, %r25
	setx 0x141114b07573b4f2, %g1, %r26
	setx 0xfc7a8bea42f324b2, %g1, %r27
	setx 0xc04eac9c38bb68df, %g1, %r28
	setx 0x8445c69614dc0af3, %g1, %r29
	setx 0x05cfc0f55b40b7f0, %g1, %r30
	setx 0xeae61baf29fe20b3, %g1, %r31
	save
	setx 0xb8138b3866eb4d79, %g1, %r16
	setx 0x527e2464444bf24f, %g1, %r17
	setx 0x795d98cbdd355982, %g1, %r18
	setx 0x8dff97f9468e0001, %g1, %r19
	setx 0xbc0a2c748db81495, %g1, %r20
	setx 0xd8d9fb87154c5f6a, %g1, %r21
	setx 0x57ca2ed0cb79055a, %g1, %r22
	setx 0x83030539b8605abd, %g1, %r23
	setx 0x8167ff2ce82b4324, %g1, %r24
	setx 0x4d0c277907ddb8f4, %g1, %r25
	setx 0xebbfa65056242050, %g1, %r26
	setx 0x538537867aa0e84d, %g1, %r27
	setx 0x81e011e9a281ffdf, %g1, %r28
	setx 0xea24fc045d999813, %g1, %r29
	setx 0xc828e13c0d726f97, %g1, %r30
	setx 0xdf199897addbb7f4, %g1, %r31
	restore
	mov	0, %r8
	setx	0x000000007613e903, %r1, %r9
	setx	0x8000000008, %r1, %r10
	stx	%r9, [%r10]



!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xcf00beef00, %g1, %g3
	stx %g2, [%g3]
!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************
	setx 0xdeadbeefdeadbeef, %g1, %g2
	setx 0xef00beef00, %g1, %g3
	stx %g2, [%g3]



	setx	0x000000800e000010, %r1, %r6
	.word 0xe0518008  ! 1: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xea79a020  ! 2: SWAP_I	swap	%r21, [%r6 + 0x0020]
	.word 0xa2018008  ! 3: ADD_R	add 	%r6, %r8, %r17
	.word 0xe021a020  ! 4: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe6f9a010  ! 5: SWAPA_I	swapa	%r19, [%r6 + 0x0010] %asi
	.word 0x8143e011  ! 6: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000000, %r1, %r6
	.word 0xe8498008  ! 10: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xea698008  ! 11: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xa2018008  ! 12: ADD_R	add 	%r6, %r8, %r17
	.word 0xe839a010  ! 13: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xe5e18008  ! 14: CASA_I	casa	[%r6] 0x 0, %r8, %r18
	.word 0x8143c000  ! 15: STBAR	stbar
	setx	0x000000800e000000, %r1, %r6
	.word 0xe0198008  ! 19: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xea698008  ! 20: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xa6a18008  ! 21: SUBcc_R	subcc 	%r6, %r8, %r19
	.word 0xe0218008  ! 22: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe2e98008  ! 23: LDSTUBA_R	ldstuba	%r17, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 24: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000028, %r1, %r6
	.word 0xe0018008  ! 28: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xec698008  ! 29: LDSTUB_R	ldstub	%r22, [%r6 + %r8]
	.word 0xae29a010  ! 30: ANDN_I	andn 	%r6, 0x0010, %r23
	.word 0xe039a010  ! 31: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xeef98008  ! 32: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 33: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000030, %r1, %r6
	.word 0xe001a010  ! 37: LDUW_I	lduw	[%r6 + 0x0010], %r16
	.word 0xe469a020  ! 38: LDSTUB_I	ldstub	%r18, [%r6 + 0x0020]
	.word 0xa8418008  ! 39: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe4718008  ! 40: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe0e98008  ! 41: LDSTUBA_R	ldstuba	%r16, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 42: STBAR	stbar
	setx	0x000000800e000030, %r1, %r6
	.word 0xe4098008  ! 46: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec698008  ! 47: LDSTUB_R	ldstub	%r22, [%r6 + %r8]
	.word 0xaa118008  ! 48: OR_R	or 	%r6, %r8, %r21
	.word 0xe021a020  ! 49: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xeaf9a020  ! 50: SWAPA_I	swapa	%r21, [%r6 + 0x0020] %asi
	.word 0x8143c000  ! 51: STBAR	stbar
	setx	0x000000800e000008, %r1, %r6
	.word 0xe819a020  ! 55: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xe469a020  ! 56: LDSTUB_I	ldstub	%r18, [%r6 + 0x0020]
	.word 0xa4c18008  ! 57: ADDCcc_R	addccc 	%r6, %r8, %r18
	.word 0xe8218008  ! 58: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xebf18008  ! 59: CASXA_I	casxa	[%r6] 0x 0, %r8, %r21
	.word 0x8143e011  ! 60: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000000, %r1, %r6
	.word 0xe0198008  ! 64: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xee79a000  ! 65: SWAP_I	swap	%r23, [%r6 + 0x0000]
	.word 0xa0a1a000  ! 66: SUBcc_I	subcc 	%r6, 0x0000, %r16
	.word 0xe4218008  ! 67: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xede18008  ! 68: CASA_I	casa	[%r6] 0x 0, %r8, %r22
	.word 0x8143c000  ! 69: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe441a000  ! 73: LDSW_I	ldsw	[%r6 + 0x0000], %r18
	.word 0xe2698008  ! 74: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xa6a9a010  ! 75: ANDNcc_I	andncc 	%r6, 0x0010, %r19
	.word 0xec71a010  ! 76: STX_I	stx	%r22, [%r6 + 0x0010]
	.word 0xe5f1a008  ! 77: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143e011  ! 78: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000020, %r1, %r6
	.word 0xe0598008  ! 82: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xea69a018  ! 83: LDSTUB_I	ldstub	%r21, [%r6 + 0x0018]
	.word 0xa2c1a010  ! 84: ADDCcc_I	addccc 	%r6, 0x0010, %r17
	.word 0xe821a010  ! 85: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe1f1a008  ! 86: CASXA_R	casxa	[%r6]%asi, %r8, %r16
	.word 0x8143c000  ! 87: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe0498008  ! 91: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xee698008  ! 92: LDSTUB_R	ldstub	%r23, [%r6 + %r8]
	.word 0xac99a010  ! 93: XORcc_I	xorcc 	%r6, 0x0010, %r22
	.word 0xe839a010  ! 94: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xece9a000  ! 95: LDSTUBA_I	ldstuba	%r22, [%r6 + 0x0000] %asi
	.word 0x8143c000  ! 96: STBAR	stbar
	setx	0x000000800e000030, %r1, %r6
	.word 0xec19a000  ! 100: LDD_I	ldd	[%r6 + 0x0000], %r22
	.word 0xe6798008  ! 101: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xa431a030  ! 102: SUBC_I	orn 	%r6, 0x0030, %r18
	.word 0xe071a030  ! 103: STX_I	stx	%r16, [%r6 + 0x0030]
	.word 0xe7e1a008  ! 104: CASA_R	casa	[%r6] %asi, %r8, %r19
	.word 0x8143e011  ! 105: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000010, %r1, %r6
	.word 0xe051a030  ! 109: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xec798008  ! 110: SWAP_R	swap	%r22, [%r6 + %r8]
	.word 0xa2a9a008  ! 111: ANDNcc_I	andncc 	%r6, 0x0008, %r17
	.word 0xe0218008  ! 112: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xeef98008  ! 113: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 114: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xec41a008  ! 118: LDSW_I	ldsw	[%r6 + 0x0008], %r22
	.word 0xee79a020  ! 119: SWAP_I	swap	%r23, [%r6 + 0x0020]
	.word 0xa881a000  ! 120: ADDcc_I	addcc 	%r6, 0x0000, %r20
	.word 0xe031a000  ! 121: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe6f98008  ! 122: SWAPA_R	swapa	%r19, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 123: STBAR	stbar
	setx	0x000000800e000000, %r1, %r6
	.word 0xe4498008  ! 127: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xec798008  ! 128: SWAP_R	swap	%r22, [%r6 + %r8]
	.word 0xa6a1a038  ! 129: SUBcc_I	subcc 	%r6, 0x0038, %r19
	.word 0xe021a038  ! 130: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xebf18008  ! 131: CASXA_I	casxa	[%r6] 0x 0, %r8, %r21
	.word 0x8143c000  ! 132: STBAR	stbar
	setx	0x000000800e000000, %r1, %r6
	.word 0xe0518008  ! 136: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe079a008  ! 137: SWAP_I	swap	%r16, [%r6 + 0x0008]
	.word 0xa2898008  ! 138: ANDcc_R	andcc 	%r6, %r8, %r17
	.word 0xe8318008  ! 139: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xebe18008  ! 140: CASA_I	casa	[%r6] 0x 0, %r8, %r21
	.word 0x8143c000  ! 141: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xe8098008  ! 145: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe0698008  ! 146: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xae118008  ! 147: OR_R	or 	%r6, %r8, %r23
	.word 0xe0318008  ! 148: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe5e1a008  ! 149: CASA_R	casa	[%r6] %asi, %r8, %r18
	.word 0x8143c000  ! 150: STBAR	stbar
	setx	0x000000800e000030, %r1, %r6
	.word 0xec49a008  ! 154: LDSB_I	ldsb	[%r6 + 0x0008], %r22
	.word 0xe4798008  ! 155: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xae41a028  ! 156: ADDC_I	addc 	%r6, 0x0028, %r23
	.word 0xe471a028  ! 157: STX_I	stx	%r18, [%r6 + 0x0028]
	.word 0xeaf98008  ! 158: SWAPA_R	swapa	%r21, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 159: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xe019a028  ! 163: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xe6698008  ! 164: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xa4118008  ! 165: OR_R	or 	%r6, %r8, %r18
	.word 0xe8318008  ! 166: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe7e18008  ! 167: CASA_I	casa	[%r6] 0x 0, %r8, %r19
	.word 0x8143c000  ! 168: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe041a028  ! 172: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	.word 0xec698008  ! 173: LDSTUB_R	ldstub	%r22, [%r6 + %r8]
	.word 0xa4118008  ! 174: OR_R	or 	%r6, %r8, %r18
	.word 0xe8298008  ! 175: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe7f18008  ! 176: CASXA_I	casxa	[%r6] 0x 0, %r8, %r19
	.word 0x8143c000  ! 177: STBAR	stbar
	setx	0x000000800e000020, %r1, %r6
	.word 0xe449a028  ! 181: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xe869a030  ! 182: LDSTUB_I	ldstub	%r20, [%r6 + 0x0030]
	.word 0xae39a010  ! 183: XNOR_I	xnor 	%r6, 0x0010, %r23
	.word 0xe8398008  ! 184: STD_R	std	%r20, [%r6 + %r8]
	.word 0xede1a008  ! 185: CASA_R	casa	[%r6] %asi, %r8, %r22
	.word 0x8143e011  ! 186: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000008, %r1, %r6
	.word 0xe0018008  ! 190: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe479a018  ! 191: SWAP_I	swap	%r18, [%r6 + 0x0018]
	.word 0xa489a018  ! 192: ANDcc_I	andcc 	%r6, 0x0018, %r18
	.word 0xe871a018  ! 193: STX_I	stx	%r20, [%r6 + 0x0018]
	.word 0xebe18008  ! 194: CASA_I	casa	[%r6] 0x 0, %r8, %r21
	.word 0x8143e011  ! 195: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000018, %r1, %r6
	.word 0xe059a018  ! 199: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xec69a038  ! 200: LDSTUB_I	ldstub	%r22, [%r6 + 0x0038]
	.word 0xa841a010  ! 201: ADDC_I	addc 	%r6, 0x0010, %r20
	.word 0xe4318008  ! 202: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe7f1a008  ! 203: CASXA_R	casxa	[%r6]%asi, %r8, %r19
	.word 0x8143e011  ! 204: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000018, %r1, %r6
	.word 0xe8118008  ! 208: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe0798008  ! 209: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xa2a1a020  ! 210: SUBcc_I	subcc 	%r6, 0x0020, %r17
	.word 0xe821a020  ! 211: STW_I	stw	%r20, [%r6 + 0x0020]
	.word 0xe4e98008  ! 212: LDSTUBA_R	ldstuba	%r18, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 213: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xec498008  ! 217: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe469a038  ! 218: LDSTUB_I	ldstub	%r18, [%r6 + 0x0038]
	.word 0xa2b1a038  ! 219: ORNcc_I	orncc 	%r6, 0x0038, %r17
	.word 0xec29a038  ! 220: STB_I	stb	%r22, [%r6 + 0x0038]
	.word 0xeaf98008  ! 221: SWAPA_R	swapa	%r21, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 222: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe0598008  ! 226: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe0698008  ! 227: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa6218008  ! 228: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe431a038  ! 229: STH_I	sth	%r18, [%r6 + 0x0038]
	.word 0xecf98008  ! 230: SWAPA_R	swapa	%r22, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 231: STBAR	stbar
	setx	0x000000800e000008, %r1, %r6
	.word 0xe0198008  ! 235: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe4698008  ! 236: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa841a038  ! 237: ADDC_I	addc 	%r6, 0x0038, %r20
	.word 0xe0718008  ! 238: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xedf18008  ! 239: CASXA_I	casxa	[%r6] 0x 0, %r8, %r22
	.word 0x8143e011  ! 240: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000020, %r1, %r6
	.word 0xe409a038  ! 244: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe469a000  ! 245: LDSTUB_I	ldstub	%r18, [%r6 + 0x0000]
	.word 0xa6a9a000  ! 246: ANDNcc_I	andncc 	%r6, 0x0000, %r19
	.word 0xe431a000  ! 247: STH_I	sth	%r18, [%r6 + 0x0000]
	.word 0xeef98008  ! 248: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 249: STBAR	stbar
	setx	0x000000800e000030, %r1, %r6
	.word 0xe8498008  ! 253: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe079a028  ! 254: SWAP_I	swap	%r16, [%r6 + 0x0028]
	.word 0xaab1a028  ! 255: ORNcc_I	orncc 	%r6, 0x0028, %r21
	.word 0xe831a028  ! 256: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe0f9a008  ! 257: SWAPA_I	swapa	%r16, [%r6 + 0x0008] %asi
	.word 0x8143c000  ! 258: STBAR	stbar
	setx	0x000000800e000018, %r1, %r6
	.word 0xe851a008  ! 262: LDSH_I	ldsh	[%r6 + 0x0008], %r20
	.word 0xea69a018  ! 263: LDSTUB_I	ldstub	%r21, [%r6 + 0x0018]
	.word 0xa6298008  ! 264: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe831a018  ! 265: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xe9f18008  ! 266: CASXA_I	casxa	[%r6] 0x 0, %r8, %r20
	.word 0x8143c000  ! 267: STBAR	stbar
	setx	0x000000800e000020, %r1, %r6
	.word 0xe0498008  ! 271: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xee698008  ! 272: LDSTUB_R	ldstub	%r23, [%r6 + %r8]
	.word 0xa8b1a030  ! 273: ORNcc_I	orncc 	%r6, 0x0030, %r20
	.word 0xe0298008  ! 274: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe9e1a008  ! 275: CASA_R	casa	[%r6] %asi, %r8, %r20
	.word 0x8143c000  ! 276: STBAR	stbar
	setx	0x000000800e000030, %r1, %r6
	.word 0xec59a030  ! 280: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xe269a020  ! 281: LDSTUB_I	ldstub	%r17, [%r6 + 0x0020]
	.word 0xaa098008  ! 282: AND_R	and 	%r6, %r8, %r21
	.word 0xe8318008  ! 283: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe6e9a000  ! 284: LDSTUBA_I	ldstuba	%r19, [%r6 + 0x0000] %asi
	.word 0x8143c000  ! 285: STBAR	stbar
	setx	0x000000800e000018, %r1, %r6
	.word 0xe0518008  ! 289: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe679a028  ! 290: SWAP_I	swap	%r19, [%r6 + 0x0028]
	.word 0xae098008  ! 291: AND_R	and 	%r6, %r8, %r23
	.word 0xe821a028  ! 292: STW_I	stw	%r20, [%r6 + 0x0028]
	.word 0xe8f9a030  ! 293: SWAPA_I	swapa	%r20, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 294: STBAR	stbar
	setx	0x000000800e000018, %r1, %r6


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
	.xword	0xa15d54f176f69b08
	.xword	0xd81bee827e32d29a
	.xword	0x384ab0c8e4ad7d70
	.xword	0x2ba474190e343bda
	.xword	0xc5acce1bb1f02909
	.xword	0xff1dfb151be51a4e
	.xword	0x2dbabe44600ca103
	.xword	0x99a19e9d28fd5b37
	.xword	0x1449ce555f5633ca
	.xword	0x7b27ffdea41df4cd
	.xword	0xd19d4bf8b21dfe84
	.xword	0x9fbb39501a50898b
	.xword	0x962c68fd3d0c3b22
	.xword	0xac3c1fe84d71849b
	.xword	0x7e7c30bfc60e593f
	.xword	0x6bca0a86cd92e1df
	.xword	0xc7350b41dd439114
	.xword	0x201ce8afe8f881c7
	.xword	0xcaf30e6382947d16
	.xword	0x661d535ed89b11a6
	.xword	0x3f57462a6e498f9d
	.xword	0x9aaeb6a0d685383a
	.xword	0xa61e41d338bc6c9b
	.xword	0x4a9c86a68e4e37fa
	.xword	0x1f60cd0bf08c4f27
	.xword	0xd7db0337cb51af91
	.xword	0x391032c0374db3d8
	.xword	0x8eb89306d25fec49
	.xword	0xe6035fdf2e80dc51
	.xword	0x49d0f6030f62aad8
	.xword	0x14bd317c0867db53
	.xword	0xe872c89a5592618b
	.xword	0x32953553e0f039df
	.xword	0xf2c9c44019cbb423
	.xword	0xa768598e5517a841
	.xword	0x5452dcb8e5cc2b97
	.xword	0xd6664aba1273478d
	.xword	0x146bf5811420e15d
	.xword	0x7106e0fe543d8fd4
	.xword	0x175b90462683a5c3
	.xword	0x1f808e28e1b3ccc7
	.xword	0xd838e6217fcafcae
	.xword	0x6190ef80da1d27f6
	.xword	0x799ff3267c48ea1a
	.xword	0x602dea44d84dcd0f
	.xword	0xe00e2b0e15f568e8
	.xword	0xc3fd8f9cea5a75aa
	.xword	0xccfea153e90aaf53
	.xword	0x76631f1a8e679c5d
	.xword	0x613a042a9af8a47e
	.xword	0xc6c48ce901bac3bc
	.xword	0x7a0cb7ddc2629231
	.xword	0x621655d627ef7953
	.xword	0xfef416a2528ec6a5
	.xword	0x07069aa260de0146
	.xword	0xc1ccae613d4a236a
	.xword	0x0b269bc39cc27654
	.xword	0xefe9a3fe3a058062
	.xword	0x2fe183ea69eafd63
	.xword	0xf968cd7a78fbf032
	.xword	0x4e2dc7ca03c36878
	.xword	0x11409e4559c427e6
	.xword	0xf9e92f9abbad8f56
	.xword	0x8577da9ac21d1f12
	.xword	0x5816d09bc8393de1
	.xword	0x7358a68e3d5c05a3
	.xword	0x5dce4648ebc9e803
	.xword	0xe47b44425785f0ac
	.xword	0xb1bb2bbb0a7dcf0f
	.xword	0xcabdce0e1d26c214
	.xword	0x9a4845607b7a5de0
	.xword	0xc0ba5df52ce74873
	.xword	0x8c9858e00926beb8
	.xword	0xb01b0acd7f9d267b
	.xword	0x33ee0b68f144d76f
	.xword	0xf1e35fba51463d48
	.xword	0x1b435492cf8b5a25
	.xword	0xa7cdf27e0d2ecb69
	.xword	0xb0342edb40822d3b
	.xword	0x24c56b0629a09192
	.xword	0xee28732249553866
	.xword	0x4a1b5525d26c2f66
	.xword	0xb09bd6282250c03b
	.xword	0x0ee6f9fd49d81457
	.xword	0x1b6b44a1843c4c31
	.xword	0x95465f0fd56e4537
	.xword	0xac4e83a952344fe1
	.xword	0x2190beeff008c2a7
	.xword	0x262bad2e83136b54
	.xword	0x9971fadda0f4c950
	.xword	0xe72e7a85f8540070
	.xword	0x2360225023467f1d
	.xword	0xd1284df6d1a88ccb
	.xword	0x1083d81e86777f61
	.xword	0x7e8680318073f637
	.xword	0x666f454802bd57e4
	.xword	0x7ec4165dac1670c5
	.xword	0xae79ea2bfdc5a23d
	.xword	0x6ebbab2e1b19bf48
	.xword	0x94e350431df853f9
	.xword	0x9a329fc86757a94b
	.xword	0xc62ef7bd9dd7171c
	.xword	0x99ba432c5c84fc65
	.xword	0x3a29d73416edf32d
	.xword	0x7b3707d6ce8e38e9
	.xword	0x7752d0d7018f36e3
	.xword	0x520551fec7b859a4
	.xword	0x52916e6760e73075
	.xword	0xe243f896e83a302d
	.xword	0xce2c2f264070da86
	.xword	0x73f97631cc67ba7e
	.xword	0x729e27a199245ed4
	.xword	0xea78fcfd311a85f8
	.xword	0xf0d3534cce7ffcaf
	.xword	0xcfab37ba7b660629
	.xword	0x04a5c93748e32772
	.xword	0x54b462f85dd3b155
	.xword	0xb662de158f527381
	.xword	0x15cb405fb95e6de5
	.xword	0x64e34a1757a9aaac
	.xword	0x1845189b155c9679
	.xword	0x5c1ebdb924351be3
	.xword	0xc97094864fd46f77
	.xword	0xd0e9ca1f2dd70da8
	.xword	0x8b6ce8ca7065b9c2
	.xword	0x6a496ea854a437fe
	.xword	0x3a8ea21781431cc4
	.xword	0xd69fab40cee51093
	.xword	0xb38259618dc5bc12
	.xword	0xb833040974d2f6f6
	.xword	0x8803e0cfe7049eae
	.xword	0xeb2a963ab2869424
	.xword	0xda0580e8058d5977
	.xword	0xd5d6314659f99c9f
	.xword	0x6d906701a8791d49
	.xword	0xe6ebe03b0cb5bae1
	.xword	0x0e3e752eb2da7f7b
	.xword	0x35de54e5afd23690
	.xword	0x24308640da3a9ab6
	.xword	0x084bb52eb3c36628
	.xword	0xdafafc50c75781c9
	.xword	0x1386ffcc45490b6e
	.xword	0xae68b6bcb7497934
	.xword	0x6f71f490a8fddbde
	.xword	0x48afb1697d05a9c0
	.xword	0x381f36fbd6f79dcd
	.xword	0x61688cca8b436276
	.xword	0xa151068e9570e6d7
	.xword	0x315d2381c6cf2ec9
	.xword	0x7d15e9c7c7e0eff8
	.xword	0x7b322f582676e626
	.xword	0x3b78fe780b5c2513
	.xword	0x92dbe45a153ed986
	.xword	0xc759e7e15e596830
	.xword	0xc338f93c92528081
	.xword	0x0c47819b5b64902a
	.xword	0xf4f0745887263250
	.xword	0x44fda7a17851eaa2
	.xword	0xa52fda1b5010fb59
	.xword	0x9042b260f87965d9
	.xword	0x3eaf20e149614948
	.xword	0x5eb7f2e396672022
	.xword	0x66ce12d5971fe5ca
	.xword	0x7b223bdc4a7b6c20
	.xword	0x8054ece408d66f19
	.xword	0x8b7a9daae223f213
	.xword	0x4bc2195b11a76603
	.xword	0xa4f76e26d72f1b92
	.xword	0x8bf261ccf39a500f
	.xword	0xcf5c712cc1da598f
	.xword	0xa8ea27ce548f99c2
	.xword	0x05881e408f8df5ff
	.xword	0x2b9eeb555ff81b7b
	.xword	0x43b2f60274896089
	.xword	0x1e0ca210bf4a5833
	.xword	0xf675dc3f96a44d76
	.xword	0x2a76e3905d9ddc12
	.xword	0x96684232f38c4fe9
	.xword	0xe9bf6579b61d9ec2
	.xword	0xda1be1aed494df2e
	.xword	0x8afb9da9846dfabf
	.xword	0xaad9d82576243960
	.xword	0x726b7a3221e1072c
	.xword	0x95729982d0e9164f
	.xword	0x7bf47e6ff6dcfb27
	.xword	0xbe9ff0d69d61812f
	.xword	0xe992e93d29a7a929
	.xword	0x7cb4aeda002dd7a5
	.xword	0x283d909bfcbbce88
	.xword	0xb595ccc5f26905e7
	.xword	0x1ed664c06dbe9c81
	.xword	0xc8eebb6b0d451058
	.xword	0xf8b30f4b2695dae5
	.xword	0xc9b9603212cf517c
	.xword	0x9208b05bc67edfd0
	.xword	0x75d70a72e406f855
	.xword	0xc98e40560089cc68
	.xword	0x8a9190e36af427cf
	.xword	0xb36515d8cdaa9ba8
	.xword	0xea7a5f73b6d40c55
	.xword	0x3920851221a68840
	.xword	0x32eb0ca7aeb9e884
	.xword	0x91ffb79f3df33f57
	.xword	0xc7890395e53b5c09
	.xword	0x81df5bb2c8e2d9ed
	.xword	0x2511908a2014e1a3
	.xword	0x1f723ac8ae54763a
	.xword	0x33f3904dbf6acff7
	.xword	0x8cd218138633c0a0
	.xword	0xe319f29a78a4f48d
	.xword	0xaa246c66bc93b8c5
	.xword	0xdd69314566a68e37
	.xword	0x2ae18a476587c3af
	.xword	0x81d4e13dd0993de8
	.xword	0x269547829f8e4f23
	.xword	0xd6d26aa7fbc62fd9
	.xword	0xa9788677674540e8
	.xword	0x468b0f22ba4fe215
	.xword	0xa5c8d37a4c34263c
	.xword	0x62ff9d66133e6069
	.xword	0xb05ce332d54eb004
	.xword	0x754433b146156f8d
	.xword	0x9689dd422111d3a3
	.xword	0x83d5dadea316285a
	.xword	0x6498ead885e541ab
	.xword	0x2e7e595c0eea62d6
	.xword	0x6b777266bbd86a09
	.xword	0xb28c95494541b213
	.xword	0x70fca3ac3021f7eb
	.xword	0x96ab4ad807dcaec8
	.xword	0x615e6c88774d9030
	.xword	0x29facf222c5262f4
	.xword	0x0b2ec3695294684e
	.xword	0xb6bfd367b7e9be48
	.xword	0x23e8a04146153c8d
	.xword	0x08366d54c81de228
	.xword	0x14e03427e1ef57e8
	.xword	0x2aef05ccad9c3a5f
	.xword	0x71c1e19e2141ba54
	.xword	0x0cfa1ecd731b2a6b
	.xword	0xc10b54ee022fb34a
	.xword	0x95b385343327b8c0
	.xword	0x816140b344ca08cb
	.xword	0x1691edd572533d80
	.xword	0x8f5c8236c2b0df15
	.xword	0x102af520f526af12
	.xword	0x497bfdbe0a1a2e55
	.xword	0xc53d4a0727638ae2
	.xword	0xe1a8d95c7ca0b3bf
	.xword	0x1db8ac075afb43a4
	.xword	0x522ae98513bcd188
	.xword	0xebb678d8041be20d
	.xword	0x34f0439401a99281
	.xword	0x0350a710e64c5342
	.xword	0x3c375b0aea1e4232
	.xword	0x6cf90fd5869bcceb



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
	.xword	0x0146301e807b0626
	.xword	0xc50c6c92f2261543
	.xword	0xdb66416289325c6a
	.xword	0x48fc6543246fdc2e
	.xword	0x0f72653c58df00f6
	.xword	0xd12800d0e89a2add
	.xword	0xdf63d097c9b3d99c
	.xword	0x597a1303a819383c
	.xword	0xd3ad3ed6467897f4
	.xword	0xe44e511345860a67
	.xword	0x2e82d4bfb4a81f28
	.xword	0x64a75d8f95a55d32
	.xword	0xcf9f4597e664f228
	.xword	0x292ad92e703e132c
	.xword	0xf7d3639d33c2035b
	.xword	0x9d4f15045a76b8b5
	.xword	0xc8b9b3f9f23135e3
	.xword	0x1aa6eeb831f2f293
	.xword	0x12f09ff82c9d4097
	.xword	0x461e667b363efa6c
	.xword	0xa6b804bea9d4b739
	.xword	0x0d9747dc39c6adfd
	.xword	0x841809590153c49d
	.xword	0x11f9b24602e4b838
	.xword	0xb6b723f528c618f2
	.xword	0xf12aa6acff651e65
	.xword	0x49f21d9919c3de71
	.xword	0x112626e7c9821a36
	.xword	0xe213e8607bae4e0b
	.xword	0x5492e83e74a925de
	.xword	0x5e06c2e2d5f9dce8
	.xword	0xb2740a4ed663e233
	.xword	0x97bf6ee6e153a272
	.xword	0x72337a61152ad928
	.xword	0x43c76ca4e2f505b3
	.xword	0x8948dc1ea36f7d42
	.xword	0xea75228e3bcefb72
	.xword	0xc8d25acf22505d6f
	.xword	0xed683d13ce9271dc
	.xword	0xf1936a365ba1b4a7
	.xword	0x9ec17b75483d4494
	.xword	0x56ce23f650326130
	.xword	0x798b7ed5093df13f
	.xword	0xf273aa8ace32e70e
	.xword	0x3b7b35c0a66a531b
	.xword	0x1dfff6edfcf6e2ef
	.xword	0x91bce92d40a2db1d
	.xword	0x781533c24195dafa
	.xword	0x578176570f2a8f6b
	.xword	0x63cb3d97cca2c93b
	.xword	0xe332c89801671149
	.xword	0x54fd1687056a1512
	.xword	0xf060e23193a78907
	.xword	0xe2f24515441db355
	.xword	0x24ce6839b13cd8aa
	.xword	0x6330c53c722a5f5c
	.xword	0x126ef2b811056adb
	.xword	0x8d176b94ef76afd4
	.xword	0x2dbd40659a38bc78
	.xword	0x4b6e2302a87226a4
	.xword	0x0317066067efd9f6
	.xword	0x0cf97a51c458db17
	.xword	0x66a663eb8a38a69c
	.xword	0x01e63039e2a0058f
	.xword	0x6268b2ac76aed6e4
	.xword	0xbc72e081189d1f78
	.xword	0xb30314fae8c3b59c
	.xword	0x2788f2339f2612f0
	.xword	0xb41a9c62abc2fd94
	.xword	0x218fd95e02df7b14
	.xword	0x5d721562301a68ff
	.xword	0x3c5fcd8182dcbf34
	.xword	0x842ae33a5212d1ef
	.xword	0x6434085bdd28054d
	.xword	0xfb334ad3bd6aea03
	.xword	0x32b18a6955c7e307
	.xword	0x99340fc1edc831a7
	.xword	0xd383abc2facc0d28
	.xword	0xe225da834c1f5ecc
	.xword	0xe54274aa8758aa63
	.xword	0xcf0917e976712a71
	.xword	0xea04c52b6dfc2a58
	.xword	0x19ce3e7831faefa8
	.xword	0x38fb9909d60e2613
	.xword	0x9e90d7b5f4ac0e4b
	.xword	0x3714f8829075cb2e
	.xword	0x52032ba770eea06b
	.xword	0xa86232ba739ed836
	.xword	0x6baac5c21d92a369
	.xword	0xa8ac2d2b8f405619
	.xword	0x093d69bea0947ba6
	.xword	0xd6c0e1680411214a
	.xword	0xd0a920025ca34e45
	.xword	0xb19a5226ebd524e1
	.xword	0xed027c437d42b046
	.xword	0xc39c4997da5b7384
	.xword	0xbfccbfe1ae9a9771
	.xword	0xc709dc2fa5de794e
	.xword	0x3d49171cced277ce
	.xword	0x6dc0652e8c857ea6
	.xword	0xd488b70850065093
	.xword	0x0a8d0413eb1fd2ce
	.xword	0x3f34e1ff90d32829
	.xword	0x2a31f3927c34818f
	.xword	0xa80678ad8f91cbed
	.xword	0x4eb24fe8e88e66a0
	.xword	0x9e52e6280dca8b07
	.xword	0xd365fe587712e3d5
	.xword	0x70fa750bf5a85459
	.xword	0xa981a5ae5b463073
	.xword	0x5acf727fc026708c
	.xword	0x1488993aa9f7e6fb
	.xword	0xc0757a3f5d3dd565
	.xword	0xd7a0c0768d5a2e9b
	.xword	0xcfcba9df274d8522
	.xword	0xcf4371ad306bf595
	.xword	0xef3d7e14728deecf
	.xword	0x58c70f4fab06c855
	.xword	0x2a6adfcb4e7fa373
	.xword	0xd302f427436f3a0f
	.xword	0x2004729165112bf0
	.xword	0x48b3eb24c6e7a788
	.xword	0x1b2fc4c93920a6ab
	.xword	0x12f0f136101a12af
	.xword	0x8d25db035ee21d38
	.xword	0x2264de52e6c06181
	.xword	0x477421a1edf3d1e0
	.xword	0x8eac13fbb51ecf01
	.xword	0x5b47ef91ce0ba275
	.xword	0x9cb79c04ac71a91b
	.xword	0x558ad31a6fbfd32d
	.xword	0xe646bcda058aa503
	.xword	0xefef738c82e2b82d
	.xword	0xa70e48f29842a585
	.xword	0x0ca10de485d2756a
	.xword	0x9091c123c08aee49
	.xword	0xd6411a6e2164e6d2
	.xword	0x686f540df45911fa
	.xword	0x454e9fd96ba60a3d
	.xword	0x2e0703b42b43e625
	.xword	0x12066acfd4d3e923
	.xword	0x226b20ed96daaf4d
	.xword	0xf9a398a815fa7803
	.xword	0xd1e27ab64f380201
	.xword	0x171be93be10241c7
	.xword	0xb73d5c505c836443
	.xword	0x121c2166b082a2a1
	.xword	0xaeafbc353ea573de
	.xword	0x69fd0fb935ddac26
	.xword	0x6be977457b78b569
	.xword	0x73633b2fdff498dc
	.xword	0x2738f3b566f713ec
	.xword	0x89664148728ceab1
	.xword	0x545ca12dbfca5dd9
	.xword	0xdef50b8910cc7909
	.xword	0x036374adfffd7f45
	.xword	0xaecdc98e095a884f
	.xword	0x6968ec0ea7487c5b
	.xword	0x19022a9206596398
	.xword	0xce5e4f8f0deb59b9
	.xword	0x14d8346807998c16
	.xword	0x9e5a993dfb854cce
	.xword	0x5828aaae4fa24aa1
	.xword	0x84400ec721300228
	.xword	0x0ea8cfbde792adac
	.xword	0x218f6ea6d44c17aa
	.xword	0x4843edecb12644a6
	.xword	0x076da0ade6147dd4
	.xword	0x50a15805f5bacfe1
	.xword	0xb3a8623c37841026
	.xword	0x353010b591edc456
	.xword	0x1eb39c6195dece47
	.xword	0x45fa80cdb24cbbfb
	.xword	0xa94841a2252175c9
	.xword	0x042ff5af49dcda49
	.xword	0xf6140ff09df9d2c8
	.xword	0x884395a65a938b02
	.xword	0x1017e81720b0918a
	.xword	0x33315b09892b2fe2
	.xword	0x88d978be0fa071e8
	.xword	0x65f7eb153090ae21
	.xword	0x5c1cce0d827c04b0
	.xword	0xfef4857faf646bfb
	.xword	0x2d5fcc7ded5791e7
	.xword	0x31beb55fd4c49fbd
	.xword	0xb98ee82127d8730e
	.xword	0x733440eafc84ae01
	.xword	0xe7b4bf399a8183bb
	.xword	0xfc0898dc4598cbda
	.xword	0x6c54933ebda8a717
	.xword	0xb45ed9510b0d4197
	.xword	0x0787a6eb4995dcb5
	.xword	0x2d844e9facd34241
	.xword	0x88e1b780ffc482dc
	.xword	0xc7ce2dac7fda87b2
	.xword	0xc1a7d3a8bb834497
	.xword	0x9eb65a271c5f4dce
	.xword	0xf8e15550bec8d1bd
	.xword	0x4cd03de942cd77bc
	.xword	0x4be98724d687d8cd
	.xword	0xaa6a6b624b992dc5
	.xword	0xe8e70baf42c663d8
	.xword	0x5637c72e150dcfde
	.xword	0xa583594a1e5848d7
	.xword	0xf66785f4b40ba1d1
	.xword	0x3ac135fa17c540b9
	.xword	0x64b18621c00e944f
	.xword	0xe16694f41a62b8d5
	.xword	0xfd27a4ad72e9af46
	.xword	0xb502fef2c27bf8ee
	.xword	0x15c7425c2ff4377b
	.xword	0x68b3b8ce723da95d
	.xword	0x29b1543f2c4f53d9
	.xword	0x0a29b01d9e6f6945
	.xword	0xc3760d8b3970aa1d
	.xword	0xc47e7b5583fdca37
	.xword	0x742cae74e30fd60c
	.xword	0x29c2c9a6885c8458
	.xword	0x427d96a9f3dc856b
	.xword	0x5958dfc623850105
	.xword	0x085792183f561a15
	.xword	0xba7358e8b656ec9a
	.xword	0x4bae3b6ce5de4566
	.xword	0xe27b6d90b29c76f6
	.xword	0xd3bf4a2bc1a5ae54
	.xword	0x010da140d2904b35
	.xword	0xab5dea45c61f277f
	.xword	0xcaf98d20fcef0de8
	.xword	0xb459cd05e4291bce
	.xword	0x403b5dcb30050490
	.xword	0x5caba041d461cd48
	.xword	0xdd4a696e56e4efdf
	.xword	0xdfb23b86491101d5
	.xword	0xd3865db666d7dab1
	.xword	0x4927266924a64502
	.xword	0x33e982a92446b040
	.xword	0xa721b8417fa8acad
	.xword	0x08d3e484f3aeb1af
	.xword	0xb8cd8074e6f9db13
	.xword	0x849b065ad2a9af2e
	.xword	0x05233a3d7ef627f3
	.xword	0x8bc89d3174576f83
	.xword	0xb0c4088575f4fc92
	.xword	0xf52e90b3a74b8edc
	.xword	0xc2bc0159891cac9e
	.xword	0xaed01bcf5c4b4fa6
	.xword	0xb81228967bbd849b
	.xword	0x5f521d284799e7c6
	.xword	0x08fc343f80ad4b8e
	.xword	0x002a2b65419a2d10
	.xword	0x890b7e31c098a7c1
	.xword	0xdbe962e773face1a
	.xword	0xa96fc6c8c12c4d66
	.xword	0xba142c4f37a50d43
	.xword	0x34af951ff4414f48
	.xword	0x29656429470b3e93



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
	.xword	0x9c79526f7adc9f17
	.xword	0xe194b0565cb04adb
	.xword	0x2f9ec36fb21d1fee
	.xword	0x0c97223bf92f015d
	.xword	0x174dedb12b2358a9
	.xword	0x5f6eb13e49b5ad1b
	.xword	0xb054244245a76400
	.xword	0x02b502f3686049eb
	.xword	0x427023e4d92a103e
	.xword	0x1bf5b01b1c578817
	.xword	0x6d0966338b6098dc
	.xword	0xe58a941765ea3cf9
	.xword	0xd30f4b2e9fa08844
	.xword	0xa1c33177f711cb20
	.xword	0x79d39f4405f7eb3f
	.xword	0xe45da826d63e74d8
	.xword	0x49bdb73a2c3195fc
	.xword	0xf865485ae2e74862
	.xword	0x5c4e6013e836bc31
	.xword	0x53455a021d647112
	.xword	0x31bc6626bf11d97a
	.xword	0xf58d30bfc0c1a418
	.xword	0x9ea0ffe271bde97d
	.xword	0x86bb19e4aed4db7b
	.xword	0x0c6a280a2b97b5a2
	.xword	0x4e596b50c2cc2d1b
	.xword	0x8e21d9a815fea4ac
	.xword	0x75d0a7fc02d1c008
	.xword	0xca94a1211708edc1
	.xword	0x5801d4b19ffc0be6
	.xword	0xc06cb4df5c6c6be9
	.xword	0xbf762619cc81e2ce
	.xword	0x856b1fc252da601d
	.xword	0x061ebb1d53f4057c
	.xword	0xf48365e1d45dfba5
	.xword	0x810745b43cd19540
	.xword	0x5ceb4e4154441459
	.xword	0x49c0a4646c7df037
	.xword	0xc7fa5e1c2a46aa15
	.xword	0xd15f6b8cf698819f
	.xword	0xedac5ca3265d0f11
	.xword	0x3eddfe3d42c5f850
	.xword	0x3488dac17da73be4
	.xword	0xbfaf2d065470e75d
	.xword	0x28970c141a07fd71
	.xword	0x9a5722cd11146ac9
	.xword	0x904973c3e779be50
	.xword	0x2a8e4735179d74bb
	.xword	0x548b820b0bbaa1bc
	.xword	0xfb75f31fe82dab76
	.xword	0xd3dd338353342c11
	.xword	0xa75b6fe88891adc5
	.xword	0x099095ab9d2bf2b4
	.xword	0x3386891c5aa0cbcb
	.xword	0x5607b8c37e07db33
	.xword	0xe2fab19bcfad3cf4
	.xword	0x579af5d21d8f3ba2
	.xword	0x90ba0374c9705b7f
	.xword	0x254db2dd229c60ff
	.xword	0x920d8de6179e1cab
	.xword	0x6f8803c686bba059
	.xword	0x3657a853dc5962da
	.xword	0x4ffec97306aebd1f
	.xword	0x2acd489cdcb33da9
	.xword	0x2e6fca595ea6f0f5
	.xword	0xec8d70ae7565f612
	.xword	0x349687cdfda78e77
	.xword	0x2d19e50f95621521
	.xword	0x5aed057cee7186be
	.xword	0xf7262af34527a6c0
	.xword	0xc43d72fe219f7510
	.xword	0x72da882cbaf2067d
	.xword	0xd320430e881f446d
	.xword	0xc81fa55127a905d1
	.xword	0xa9c8f0e34d2a8cb1
	.xword	0x0068c0283cb68553
	.xword	0xc464389dcd7b7590
	.xword	0x79cb1a1662f60ed9
	.xword	0xa5ad4a543a6b7b59
	.xword	0x8efd161129102613
	.xword	0x5f1aabfe30406ece
	.xword	0xce83dd7540120134
	.xword	0xe26505daa39695ce
	.xword	0x9eb62a8e90e35af7
	.xword	0x9f515fa3e166a382
	.xword	0x35245808c33342ce
	.xword	0x1c713d11e0d956cf
	.xword	0x0553b7f76b27c2f8
	.xword	0x35de8fdf1bf5cab1
	.xword	0x5520ccb9768299e9
	.xword	0x3a76802f7e1db218
	.xword	0x4d4749fd7fe912ee
	.xword	0xeb3743a5064c76ed
	.xword	0x528d62f73ecccb5a
	.xword	0xe1d88ff5d05a2cc6
	.xword	0xa38f3d288d486a2b
	.xword	0xfc6667e8180b79f5
	.xword	0x2c6965efbd488383
	.xword	0xcb329c9079fe6312
	.xword	0xb2b954f1177883e8
	.xword	0x2c202a5458d47ded
	.xword	0x3eb23350c61f785b
	.xword	0x86790d6670d469a4
	.xword	0xf20e61b495707a03
	.xword	0xf8bf56d7b1ddae00
	.xword	0x8c32128a9e342797
	.xword	0x21b1a015ef40626f
	.xword	0x69ddf8050430e34b
	.xword	0x52329a39d3d7cd9e
	.xword	0x5a5c65fce59a24f8
	.xword	0x2b05e6dc153aa8f7
	.xword	0x5f1fb12305daa07a
	.xword	0x9d308327a310f77e
	.xword	0x62f8e9ef9d71f40e
	.xword	0x24a225381873f506
	.xword	0xa2ce64ee935cd07d
	.xword	0xc0a0fa66a17a5492
	.xword	0x18bcc139ac93ce51
	.xword	0x3d9f8763b0542b80
	.xword	0x89c4ede70e6356fd
	.xword	0x617bd902e560f92b
	.xword	0x7fea250c2a5c4da1
	.xword	0x3d4aa3c53a23f376
	.xword	0x4031b96af7742486
	.xword	0xe3aaa25223e34328
	.xword	0xdfb4416d69930154
	.xword	0x3293b276258304ef
	.xword	0x4ad51fef57fd3f69
	.xword	0xb098b32cab378b8d
	.xword	0xf0eb6b051d10ddcd
	.xword	0xa28a01fc86715bd2
	.xword	0x9efcde1f74ba1fd3
	.xword	0xec017e7d7853a511
	.xword	0x522904605b1487ea
	.xword	0x3f543bde81b64164
	.xword	0x80cc8dd34eb6fa0c
	.xword	0x6ee18ea2cdc775da
	.xword	0x56d605eefe47385d
	.xword	0x0cf86520a4a6d726
	.xword	0xec0bf5a9645b9ce4
	.xword	0xabfd3476712fa11e
	.xword	0xcc5addeb47079845
	.xword	0x8bad5a9a7ae0a5b5
	.xword	0x41450a527d40bf9f
	.xword	0xa20d519ba228a8d1
	.xword	0x0095aff2ca0aab5d
	.xword	0x60cb308b23d3817a
	.xword	0x3eff328fd8673573
	.xword	0x763e6706b19cfa49
	.xword	0xb9a1381e99bee8bf
	.xword	0x499284a57b57527f
	.xword	0x77930bfd231f97e6
	.xword	0xfc34e9c7fb3c4aef
	.xword	0xbb8bb5f0c4a879e3
	.xword	0x8d61313167477435
	.xword	0xcd1165a54c1917a2
	.xword	0x96e59c41d915e2ed
	.xword	0x8d8f724d9f1f1933
	.xword	0xcedb894d5357eae6
	.xword	0x6bed859e7fd1fe17
	.xword	0xf6e8e3de6208881a
	.xword	0x983baa7a1e2a1527
	.xword	0xfb4379877c97dbb7
	.xword	0xdc645c64965fc322
	.xword	0xa8696de104f86671
	.xword	0x2e2ed0ee09fdc9d9
	.xword	0x66d2070b34708e5f
	.xword	0xc53f8a1590cd6c53
	.xword	0x21718d918dcf441b
	.xword	0x5940228cee7a35ae
	.xword	0x7aea4bd87f4ef145
	.xword	0x5019df3ec9005f64
	.xword	0x50df61f84cde81f3
	.xword	0xe4df5ba3a55efaa2
	.xword	0x510fd8ac02d8d9ea
	.xword	0xe8ed45dd0f27dfe4
	.xword	0x1ca8febb34223019
	.xword	0xdc6e25970c007b82
	.xword	0x7790c6b33966272b
	.xword	0x46ecbaea5829de37
	.xword	0xad85ec5dc3a90c63
	.xword	0x2eada05aabdd4999
	.xword	0x28a8a51efe306dd0
	.xword	0xe3d3e2077b139de8
	.xword	0xd0703456f7cb568d
	.xword	0x574d7f561a30ab91
	.xword	0x86c8148807858fb3
	.xword	0x9eac6092a4372726
	.xword	0x0be8d07c2ae21cd9
	.xword	0x843c292a1d17d1c4
	.xword	0x1afdf148989022a0
	.xword	0x3303b86de14d33f5
	.xword	0xc526a35152afb878
	.xword	0x7d48590e85950e81
	.xword	0x06ef5ba9080f46cc
	.xword	0x5ed55c693cf0743e
	.xword	0xa1bc074ea780e3a3
	.xword	0x11418e7b916ce995
	.xword	0x1d17602c31b28399
	.xword	0xbf22fe68313f46be
	.xword	0xcfd2d9fe75a00144
	.xword	0xa9d7f339d0fc5e12
	.xword	0xf3fb251732b8d67f
	.xword	0x6c21996dc57661bd
	.xword	0x57c69eeeb9413602
	.xword	0xdf15bf1a3f213ea5
	.xword	0x7f7f2123b1af5772
	.xword	0xd9ca84e58c7ec04f
	.xword	0x1eb77d4b1f920b59
	.xword	0x705a03a305c2b001
	.xword	0x1e2269fdf785dd8a
	.xword	0x63ac63bf75dc9714
	.xword	0x56aef77c2a89f3c9
	.xword	0xc845039122fc36ab
	.xword	0x0f106ce32d3cb497
	.xword	0x71afe0d3121d21f4
	.xword	0xd24b3da0564bb57b
	.xword	0xc5e8ef672926a2b4
	.xword	0x9daae8acf539cb07
	.xword	0xdc30447a6ff4efb9
	.xword	0x4212948ac1ab7009
	.xword	0x07d607ad1c2ce95b
	.xword	0x51316146032a089d
	.xword	0x687074ab9ea97743
	.xword	0x486e4a5812ef0aa4
	.xword	0xfdc86e942b1d4f15
	.xword	0xb6188090ab216c45
	.xword	0x0ed9ee718b965976
	.xword	0x3786828e3f2d8e0b
	.xword	0xa2b43643f2d3c6b5
	.xword	0x91960b92f5f63176
	.xword	0x1c8410651688cb8e
	.xword	0x070573adc7b3b6ab
	.xword	0xf450a42d1410a7a0
	.xword	0xe1cdb41b4c90b5ed
	.xword	0xd04959a941373c6a
	.xword	0xeda371535463ecb7
	.xword	0xdfbeb272e1a5535d
	.xword	0xc502fd1edd8b5dcf
	.xword	0x658b7c01dd33e335
	.xword	0x84506df80c7f6601
	.xword	0x67e0f2dbbbbd3744
	.xword	0x8842ad34fbc3ca10
	.xword	0x34cc8cd8cb3b5d4d
	.xword	0xb5f79bc0b0f681d3
	.xword	0xc479df0fb1f3b73f
	.xword	0xc514086081ebc216
	.xword	0x851c43b93b32b8e5
	.xword	0x528b3679aa80acb0
	.xword	0xb7e901d9136f132a
	.xword	0x1a0fd721c31f790a
	.xword	0x755d063a23fa6582
	.xword	0x5ae184e5f14be8e1
	.xword	0xc8c8288e16c3a6df
	.xword	0x8302d5bb93cb5b85
	.xword	0xfb7e3b3bc1671586



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
	.xword	0xbca9ab2550607517
	.xword	0x8ebd683f224815dc
	.xword	0xc42afa4c7e085ae7
	.xword	0xf0dec706258165c1
	.xword	0xf192221201e8d61e
	.xword	0xaf9f231e0549f08a
	.xword	0xfe70c2b3447e1807
	.xword	0x93e66535c073441d
	.xword	0xd4eeca3b27ce3e79
	.xword	0x2951401be43281c5
	.xword	0xd06ce47937c420bc
	.xword	0xc6ea25395ab27977
	.xword	0x991e20c4ad0ad5f0
	.xword	0xfeb86d17d6d46f13
	.xword	0x6bef78c3cf743137
	.xword	0xa5df3646fa67e78c
	.xword	0x97bec564e7bff99e
	.xword	0x13306e79d151a859
	.xword	0x6de4d258beb0ce8d
	.xword	0xa5a8e580b2fdf660
	.xword	0x455bf3ba5fc9aeec
	.xword	0xa758b5d15c5e66f0
	.xword	0x85725511824f4aa2
	.xword	0x6ce28288316b2293
	.xword	0xb455d47ecfed5db0
	.xword	0x330c4951fde5b957
	.xword	0x582324a7f1a0b80f
	.xword	0x0c0d481fd4c70b8c
	.xword	0x4e767041a70d049e
	.xword	0x40e6fd7c460b4c0f
	.xword	0x321d066ccf4b6d19
	.xword	0xde32362526f86cab
	.xword	0xaaa9bfcd3eb305df
	.xword	0x12f477330e93d0d4
	.xword	0x89854d30fbbf839a
	.xword	0xe380b0073b5a4e2e
	.xword	0x2863c9b2aac85176
	.xword	0xa5161f527c184894
	.xword	0x4bc54757bea63717
	.xword	0x1385fa83c1bb9f8f
	.xword	0x9d3fb6d9ac301d38
	.xword	0x947c4ac68946a00a
	.xword	0x1fefa82269a13376
	.xword	0x379ac5cc576ab385
	.xword	0x5bd856c1dde447ba
	.xword	0x9838eade26c96ef8
	.xword	0x1a3d93fc9e256421
	.xword	0x0abe8fe805a9a74a
	.xword	0x218018e22ed346ef
	.xword	0x8116566e11f48cd4
	.xword	0x39495c46473f82a1
	.xword	0x245e9402177ccb9d
	.xword	0xf3a0ea806e35819b
	.xword	0xa38c0124134a21c4
	.xword	0x9f445e44828e6471
	.xword	0x3d55095f079cbaee
	.xword	0x50f7cd54a1d99cf2
	.xword	0xe2df61056b159177
	.xword	0x44a57dbafc70bfd2
	.xword	0x47d98f710e4e79db
	.xword	0x41c8db34846ca9fc
	.xword	0x4307f194b28b03a2
	.xword	0xcce83bcf442b8d01
	.xword	0xd061aea9febebfdc
	.xword	0x0b4abfe37bde4267
	.xword	0x186da387ad49bf98
	.xword	0x9478675166ff0a8c
	.xword	0x36b7edbcde88f3fc
	.xword	0x03af2762793c778d
	.xword	0xe87039a6ef049fc7
	.xword	0xbbdc053e5b71cfbd
	.xword	0xb9d3378727448861
	.xword	0xa197644d54db4b95
	.xword	0x40918029d11f0bbd
	.xword	0x4910a6509e65fc09
	.xword	0xea055b10f0d638ec
	.xword	0xff16d9c26d76fb9d
	.xword	0xc796edd7a3b24922
	.xword	0xcdbf1c88d1bfb261
	.xword	0x3a7d11e04d3d0046
	.xword	0x1f936121aaf487da
	.xword	0xce09eb620647ad70
	.xword	0xcab826f915db8022
	.xword	0x7c4096c3a5d66bfe
	.xword	0xe72459bed625e431
	.xword	0xb325282613da4b43
	.xword	0x0bc0f3da536b12b3
	.xword	0x2d16cc65efc3df53
	.xword	0x2f2453dbd719568a
	.xword	0x4f2a162971882ea6
	.xword	0xc43774f5b9e5b506
	.xword	0xa060fbd3fb1d1824
	.xword	0xdb4017257d0ea9fc
	.xword	0x067ee91b61b3a8e7
	.xword	0xc8aff36eab59879d
	.xword	0xb02c60c2d441a920
	.xword	0x87e7cab5e8316d74
	.xword	0x747f7006a2b8aaff
	.xword	0x0bbbef3ac34ea4f9
	.xword	0xd422bd5c6eb6c17a
	.xword	0x4962a82d836f8bf1
	.xword	0x95f8186a39b0a082
	.xword	0x307e069514319727
	.xword	0xb2fd96237c296fae
	.xword	0xe67532c98826ea89
	.xword	0x882f2f261693a1de
	.xword	0x0832594f6cc4e4ec
	.xword	0x9ccf24f39a68f61a
	.xword	0x29964f109387b7be
	.xword	0x1457af4ccc6110db
	.xword	0xfac90d9033e2af05
	.xword	0xe7c1a1e8eaa2ebc0
	.xword	0x6eae7aad0932bbd8
	.xword	0xcf2cf807e1da0241
	.xword	0xe5359ec3c4bd2b0e
	.xword	0xc92c1071d7933711
	.xword	0x8687d5dc4d6cdc3a
	.xword	0xee9a99b6d4b4f5b8
	.xword	0x5eee04b961dc51a1
	.xword	0x6d9c222d204ce9c4
	.xword	0x6c034dd8e7a62c4e
	.xword	0xb0a88a67dc3ebc9c
	.xword	0xdd0b986940cdb44b
	.xword	0x787bb2965c65341e
	.xword	0x00cba2a34ee90ac5
	.xword	0x57b98e181777f8ff
	.xword	0x57caaa9ff1353814
	.xword	0x762bf291c35c7525
	.xword	0x35d83a25401544d4
	.xword	0xd9650c1bdc38a6fe
	.xword	0x5fecc09202557b25
	.xword	0xc4b99195f8ae6ebf
	.xword	0x30f41c6bac76765c
	.xword	0xb67a895850e1fc9b
	.xword	0xbe32f12739301e21
	.xword	0x32bf68a3e845fcc3
	.xword	0x40c03a9f9ff9b219
	.xword	0x10a9e8e7aa96a518
	.xword	0x1a339af42e97aed5
	.xword	0x9438d8cbe5d36618
	.xword	0x70c4f46b572c7b4a
	.xword	0x0ec37c4c7f2afd67
	.xword	0x643c3116810098f8
	.xword	0x743ef6db738578ee
	.xword	0xf34fae326f5e6fbc
	.xword	0x673fbf7b413cc20f
	.xword	0x9fefe38b2119ecb8
	.xword	0x6aef1f95e3b3b154
	.xword	0x9074bb2c94fac443
	.xword	0x41a0481420992640
	.xword	0x09722e849355a4dd
	.xword	0x3848d8878242194d
	.xword	0xdfc210dac977997d
	.xword	0xd69b02309bb7893c
	.xword	0xd151b2686cf9143c
	.xword	0xe79f32f184fe43df
	.xword	0x065a4e4dd533bd62
	.xword	0x54d3f2bc86acec8a
	.xword	0xd38be8a0f6f73eae
	.xword	0x0d93dd207f4aa338
	.xword	0x5fa1cecc14b249da
	.xword	0xc9211c6ecf781d6f
	.xword	0xebac7de30b008f14
	.xword	0x893d97db4696fe00
	.xword	0x2be07023f0852e1d
	.xword	0xe975abe34d5f1023
	.xword	0x70e6199fc0389c43
	.xword	0x7f9ce08ad16dce52
	.xword	0x2ab41218bd23c8b0
	.xword	0x972f5f64028aa1b9
	.xword	0x2ed08d996176ce96
	.xword	0xfba9b2ba8e7dbad3
	.xword	0xb78a85023fee8c22
	.xword	0x303983dd0aee1e3a
	.xword	0xa43cdbe2987307d6
	.xword	0xebaa895695450440
	.xword	0xa01df47acf2db279
	.xword	0x4080a7d7ae8a1ab8
	.xword	0xbea437b1ec51f276
	.xword	0x561c39828fcb5693
	.xword	0x287964ea1998f5c1
	.xword	0xb51997b83d35288c
	.xword	0xc069d7d5717f84de
	.xword	0x9c8b7c98b794bf57
	.xword	0x82fcc3099d88191a
	.xword	0x0b80db0a5eaa002e
	.xword	0xa65286ed696b859c
	.xword	0xc1156e1d78964fa7
	.xword	0x72cdcfe7ac7adb5c
	.xword	0x8eb4f1ad9be2b16e
	.xword	0x1b9de5d90c73e9bd
	.xword	0x4b213b60cdbb5403
	.xword	0xdc50f5fa2ef7d0e9
	.xword	0x5fda700a9f865256
	.xword	0x654f6db2f267a671
	.xword	0x6ad8b2392639ca0b
	.xword	0x049d77922f0a8033
	.xword	0x4671e7d076cee5b7
	.xword	0x9cde823de9ea9415
	.xword	0x3783174a4c7ad173
	.xword	0x2f249ef4b5973af9
	.xword	0x7a6bafc8df201b88
	.xword	0xd1275ad160a528a9
	.xword	0xa8649ffb3fe8f350
	.xword	0xdcae5995bcecfe40
	.xword	0xb9a636d2e5abd12d
	.xword	0x90a3488cb8775491
	.xword	0x425b177f6fa28682
	.xword	0x775b1f206957cc53
	.xword	0x3bf6ccffc76fb731
	.xword	0x5e3ad4925215d7f4
	.xword	0x27c5cd3ebdbf2f73
	.xword	0xd6089ab9d955db02
	.xword	0xe0fb095f1e69bc2e
	.xword	0xb6f573c77305edea
	.xword	0xca97d3309a8401f1
	.xword	0x0ace46e56015e87d
	.xword	0xe3d67d1a11656a8c
	.xword	0x5b49a50779771abc
	.xword	0xbdcb4fa687a9770b
	.xword	0xc9eb28ad782cc3ba
	.xword	0xf0c7c62f16213828
	.xword	0xc8db8099737e8d3c
	.xword	0x2a68b7ea26684b5e
	.xword	0xca60460b0401a42a
	.xword	0xfcdf0a09a9c3310e
	.xword	0xa643b8d61276f9a1
	.xword	0xae1c51ac1f237f44
	.xword	0x84923bef29189502
	.xword	0xfc030506f4b5f8c8
	.xword	0x32d91535e0932063
	.xword	0xfd4a9b601018ad99
	.xword	0x721224be180e81a0
	.xword	0x4176347bc05ac7c8
	.xword	0xfaa8312fc1220f63
	.xword	0xaec0bb66961a7771
	.xword	0x888166a07b3f4445
	.xword	0x3bd0aff1310e8379
	.xword	0x589524119ac856fa
	.xword	0x52eb6c5155bb3f1b
	.xword	0x65e68f9a521bbf1a
	.xword	0xd8dad36cd42f8214
	.xword	0x03dfdfbba90051af
	.xword	0x86e2434673536219
	.xword	0x275796df50dd46c8
	.xword	0xc802a8c3b7c9cced
	.xword	0xe0b559ed7e16f4bc
	.xword	0x728d53dc24dded11
	.xword	0x031f3542e31bba8c
	.xword	0x559081d42f3be2ab
	.xword	0x57e691eca241bfae
	.xword	0xa86916cdfd5fcda1
	.xword	0x1cb4efa8ad41568f
	.xword	0xfc695e6fc04eb4e6
	.xword	0xe083e9568220cfe2
	.xword	0xf37058003d082348



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
	.xword	0x67d8b638857c97da
	.xword	0x951587743795272b
	.xword	0xe4e2b08a35542331
	.xword	0xdb44d2151fd675e3
	.xword	0x95974d93a17da4ae
	.xword	0x03f129ed1715b534
	.xword	0x4b183fdc0dd41324
	.xword	0x36c214f4d8ae03bd
	.xword	0x63f115f5f73535f1
	.xword	0x5ed4b56bce075fee
	.xword	0x7e6bc4bb5cab8ae1
	.xword	0x32325b00fe990044
	.xword	0x71f5e64669a0410c
	.xword	0x9ab66a687cf4b874
	.xword	0xf5e4bd999eb600b3
	.xword	0xf3d59a93b7153bc8
	.xword	0x09081ee5fa2818e8
	.xword	0x4f15fe35573eef37
	.xword	0x9ae8689e7224c90c
	.xword	0xee2d62746dc143a2
	.xword	0x10804466effc4eb0
	.xword	0x04911df90186357b
	.xword	0x05b9528ecc8db5e6
	.xword	0x1cfdcd1d551bec59
	.xword	0x9cff2682c2f5a321
	.xword	0x0fb49a289d6dee05
	.xword	0x5602cac6f1d35bfb
	.xword	0xe58df88e0c26f23f
	.xword	0x949dcd180a1bddb8
	.xword	0x01f40b9a4a387e3a
	.xword	0xb92e851db39d8fc5
	.xword	0x388370409829b6de
	.xword	0x0d9d731e4668c141
	.xword	0xf2f0c7b966a160cb
	.xword	0x1a928d790e7c54c6
	.xword	0x36000a67c371c435
	.xword	0x24b78a32ed92eba3
	.xword	0x679960f958cb08e8
	.xword	0x6b61fcfa3c2eea5d
	.xword	0x8b2e44c4736ebb38
	.xword	0x44af185dff012e82
	.xword	0x631e6da43e775b7f
	.xword	0xee9fbbdeecaf4e82
	.xword	0x943aa784729e2217
	.xword	0x8138c2e0036a7ba2
	.xword	0x6cbb8887b1259353
	.xword	0xccfcd8e10c2df419
	.xword	0x8e612d9389cf113c
	.xword	0x5d4f5d2527ab40e8
	.xword	0x42d6119c2f521b8d
	.xword	0x694353d5fed95799
	.xword	0x1ecc8876c41d34cb
	.xword	0x69791e15f72d839e
	.xword	0xf8198cff3aa0378f
	.xword	0xa27af5a002627c89
	.xword	0xf4080449af9318fb
	.xword	0x9301a69a9d0ac398
	.xword	0xc7d1413b5d52cccb
	.xword	0x3b59ee053d5d3951
	.xword	0x2fe41ca9a9ae34e3
	.xword	0x85eba60a9665f743
	.xword	0x355e470e8907bc71
	.xword	0xcea9f2ce7306b518
	.xword	0xa2f7d68d086c9696
	.xword	0xdd6f2f8a56b051b2
	.xword	0xb0700d16d8accf42
	.xword	0xa46c04116277ec2a
	.xword	0xb8e52f1d8bc1ae73
	.xword	0xd430df6d125e1a6f
	.xword	0xde7fbd6031e026c3
	.xword	0xfa645cf80e80fa61
	.xword	0xa6c282cbe793fad3
	.xword	0x9c50ab7f14bdaf7e
	.xword	0x57efdc29c927d228
	.xword	0x2754d875ccc1f3f7
	.xword	0x31124656aff529d1
	.xword	0x95f79e723487a8c5
	.xword	0x0e9fbf977452f5bc
	.xword	0x005377cadcdcc6f8
	.xword	0xe6f22aad37730e2b
	.xword	0x9a1ec105faadcfec
	.xword	0xd8c42db100a79557
	.xword	0xc314e3b80f61b278
	.xword	0xb29f649f8cd2e849
	.xword	0x69cf1871e13199e9
	.xword	0x1e22394c98a71945
	.xword	0x915c22ecef07d358
	.xword	0x40ffc073d5e01d30
	.xword	0x142cf580a2517fa5
	.xword	0x6308f89fd4adb0c7
	.xword	0x521856dc043240a6
	.xword	0x1b58bb4f2e06f618
	.xword	0xf01627d0010dbfff
	.xword	0x750bb56ee3032f75
	.xword	0x7f38f8139581af0d
	.xword	0x476c007e2e911ccb
	.xword	0xfb9400736a815e62
	.xword	0x9ce0162222aaaf91
	.xword	0x9110c58c4ab11d5b
	.xword	0x3448779ac92534b6
	.xword	0xf4c1bd054cef21af
	.xword	0xee744e8025dce2d6
	.xword	0x65c558cbc7694d4b
	.xword	0x68af32228268cd22
	.xword	0xe7ced566418a4ab1
	.xword	0x03449ad91cf868a6
	.xword	0x3fd5296b20f2ea96
	.xword	0x52148dc1efd43012
	.xword	0xa829143458b7ed3f
	.xword	0xa1663ae614cdb555
	.xword	0x54a2ace46e89a8b8
	.xword	0x1277bfefddd20100
	.xword	0x230bf33931486d3a
	.xword	0x90df2a3d9a24c9e9
	.xword	0x14cdd7c9a520479a
	.xword	0xf478a3a2779aeac3
	.xword	0xc2cd47060037bec0
	.xword	0x9b7510bf0a2b49bc
	.xword	0xba6976f29c4add77
	.xword	0x8ade9eb39ceed63b
	.xword	0x5b306ea889c73d58
	.xword	0xa1467720ef66af1d
	.xword	0xbed9815ec0f70fa7
	.xword	0x7606fb6101862e0e
	.xword	0x65058527d4f4ff84
	.xword	0xa015ce21d8516e94
	.xword	0x9cea87f4c306a551
	.xword	0xb69746b899a0d8f2
	.xword	0xb3e54ee3477004f8
	.xword	0x3f74fa96c2d90aeb
	.xword	0x2e6b989d8c636bf4
	.xword	0x9734aeb1de90fd2c
	.xword	0xc314877d60ec0d13
	.xword	0x650258f36778689d
	.xword	0xa4d8b44328a9d2f2
	.xword	0x96dde3fa86f2c704
	.xword	0xa87f72a6cbb46e7e
	.xword	0xa582a9c2a196e1f9
	.xword	0xe34bab85b191cadf
	.xword	0x0fe740876eebc821
	.xword	0x698dc64c1888ffcb
	.xword	0xc7b9243f8e823997
	.xword	0x4962891d8c52b086
	.xword	0x472e5a99cc06c145
	.xword	0x01a1ce056ded09c1
	.xword	0x15e2f6d62d24ed88
	.xword	0x80d5aeaa31a836fb
	.xword	0x9a1ab8ca3124496b
	.xword	0x7ef53bd588aa508d
	.xword	0x16e90e4b21fe83a0
	.xword	0xc2d4889d5ab65c99
	.xword	0x3e253cf43f057b1d
	.xword	0x5835b45a75b8c758
	.xword	0x40a6e3b6563a7209
	.xword	0x66f605be536c8a09
	.xword	0x820154bd407ef132
	.xword	0x53511619a05b838f
	.xword	0x2a5c118ae9de4b54
	.xword	0x8d3ed3c7c97c756b
	.xword	0x930fb7b66da36d97
	.xword	0x474ae693af1ca305
	.xword	0xf100400925e554cf
	.xword	0xa16022041e31c0c8
	.xword	0x74e288a68ed9814c
	.xword	0xa7223b6573e8028b
	.xword	0x9718874425655c43
	.xword	0x514acae1de4d047e
	.xword	0x2b20e21720728049
	.xword	0x64af76cfff308f3c
	.xword	0xebfe7c873b00ac1d
	.xword	0xd2a7d47c52cdcb67
	.xword	0x75400703ff426078
	.xword	0xe57e415096a51c16
	.xword	0x5836688146ce17e2
	.xword	0x4b1bad8f7bd8703d
	.xword	0xa2cf2c74496cdffb
	.xword	0xb7f5faf6379f2be0
	.xword	0x4f9d9eeb955b596f
	.xword	0xb015a7bb8ef6f1d4
	.xword	0x77239cbaafb086f5
	.xword	0xae115932f13c6aa0
	.xword	0x6ecfd033dfa4db9a
	.xword	0x94374e1f54bf690a
	.xword	0xa8036570b13a0fae
	.xword	0x09eb4005b7514c7d
	.xword	0xd2ced01888e69187
	.xword	0x7d81e75c868b6f24
	.xword	0xc0e4eca8d8fa303f
	.xword	0x917c815de1bf1905
	.xword	0xa5200459cf09c63a
	.xword	0xb71dc6ce681b6c7a
	.xword	0x7f4b4118ebd5bb1a
	.xword	0x15e4e7f093804154
	.xword	0x3dc3fdfdffdeecfa
	.xword	0x1231eb5dcfc4f310
	.xword	0x91e24429e09140f9
	.xword	0xac052ca5a17f5047
	.xword	0x8be333a72db43da5
	.xword	0x76f11b8a2f293c5c
	.xword	0x938aa38f458730b2
	.xword	0xc3080b0fb61e860c
	.xword	0x219c7dd275a6293a
	.xword	0xa6aa1523d4c03a49
	.xword	0x3f86223aee8546a6
	.xword	0x676b27d92aae0173
	.xword	0x38f2c453f70917d6
	.xword	0x5246cc47a028bc70
	.xword	0x3b9ebd2a7ba59dd5
	.xword	0x63ef5e7d0d05b721
	.xword	0xe122851a868c8d9f
	.xword	0x49265985da1e0c8a
	.xword	0x0e8ab8246a614577
	.xword	0xfb6fe46cbe9f071e
	.xword	0x9f1b32f04ac71c43
	.xword	0x7324f34b49f8d86b
	.xword	0x39c99f3f0d1ad076
	.xword	0xbe36f921cc4ded0c
	.xword	0x026fee692296b3f6
	.xword	0xdf810cabcb64387f
	.xword	0x8e081b898497a948
	.xword	0xdba9721bacce4c7a
	.xword	0x2fd01b97aa42e89d
	.xword	0x3b5128d844e6c06a
	.xword	0xee1f6e2a1c92a939
	.xword	0x103ba6b078557537
	.xword	0x6e5312608b2c3174
	.xword	0xd77e670458cbcef5
	.xword	0xfdc574f6141882a2
	.xword	0xefe501a297d75bb2
	.xword	0xbd47571ece791583
	.xword	0x98f8bb4ba439d150
	.xword	0xe2e3739ccc748de2
	.xword	0xf78eb7b8144a402c
	.xword	0x21dae2df4f22f0a4
	.xword	0x48bf468f9a600bca
	.xword	0x2653c67ed6538fb2
	.xword	0xb80406934ee556e3
	.xword	0x8bcbc159297c4c70
	.xword	0xbcbcd8999277dda9
	.xword	0x3a8e854d475da539
	.xword	0x9a94d2351dc3335c
	.xword	0x78e28427f46d7085
	.xword	0xe08d0ad17ff19295
	.xword	0x5d6835fd182890a2
	.xword	0x73721d8813ca1d3f
	.xword	0x498eeb06ccb84acd
	.xword	0x7ab387f4bfd5c959
	.xword	0xecd54ee2260d52fd
	.xword	0x553d3be47e5a1f11
	.xword	0x0c997e1086cbb567
	.xword	0x7b5c4db76d669d4d
	.xword	0x727b4f66d047b69d
	.xword	0xe9f3bac664685a2b
	.xword	0xd2573d3e3e14ed6a
	.xword	0xdd0bd764662708ea
	.xword	0xbb33927bc7ae370a



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
	.xword	0x8298ff391369e3b9
	.xword	0x176d98bbee686bd1
	.xword	0x5ea505cb20425031
	.xword	0xf65d6a7c946c4ad3
	.xword	0xceeea8b62394df7e
	.xword	0xa00ee4186c34a1b0
	.xword	0x4f931705867aa4fe
	.xword	0x3b24694d1cfe27e7
	.xword	0x0136746026d36441
	.xword	0x11672b59beb2be21
	.xword	0xb208c0b3eae88cb5
	.xword	0x0cb2d458557791ec
	.xword	0xdfaaadb2d40bac86
	.xword	0xa73344fc04ea5a52
	.xword	0x87ac1438f3ab2eed
	.xword	0xf8a721e857f44617
	.xword	0x93a2a14190eec1f0
	.xword	0xd4d1fa19fd292ec9
	.xword	0x36d5d1b60a6b4e5c
	.xword	0xb9311cfe033cb821
	.xword	0xa073d212ec432cc0
	.xword	0xe2a88db346668a61
	.xword	0xd46c09710dfd230a
	.xword	0xb9334b7d0f5b9cc5
	.xword	0x41b6f124234995ae
	.xword	0x12b706155e2659eb
	.xword	0x0c7e026aa8e68e9c
	.xword	0xee5c122071ab91e3
	.xword	0x075aab14b8e4ec09
	.xword	0xbeed3cb637b3e366
	.xword	0x5cb40bbe00ae681a
	.xword	0xbb5e6d152db8b816
	.xword	0xb17952cc6037e88e
	.xword	0xf5d5423a755f4c89
	.xword	0x1c3e7f05cc322c18
	.xword	0x50bfa8e3ff092c2b
	.xword	0xb1eb8694c670bfa8
	.xword	0x1f256d847163d3f9
	.xword	0x2fee29dfcd91fd73
	.xword	0xd7aac1677c382eb9
	.xword	0xa60cd1f60bab9fee
	.xword	0x4cb1a2755207f209
	.xword	0xa61cec16f436f169
	.xword	0xada77593c41a992e
	.xword	0xa45209c183e98fdb
	.xword	0xc66e650817770177
	.xword	0xc39f7b507b89dbb6
	.xword	0x541937e4e67460f3
	.xword	0x961876e453bfc14a
	.xword	0x10f5461d25c356d8
	.xword	0x664c6d10108ce591
	.xword	0xed6252dc7e9b5197
	.xword	0x598883855075fbb6
	.xword	0x23b3e12fe16ea99d
	.xword	0x490e9b7f84bac857
	.xword	0x6c2db340adac7780
	.xword	0xa727887b26aa7fbe
	.xword	0xb994ef6647740863
	.xword	0x5cdb5604ede624dc
	.xword	0xc6d7661bada1e8fb
	.xword	0x78a873b1effc8f39
	.xword	0x500a3878a086c253
	.xword	0xf4fc04c558861004
	.xword	0x3b44cb3e2109c95b
	.xword	0xa510b7d03b00e523
	.xword	0x638eea860dedbaf8
	.xword	0x719dbf5fb5b697ec
	.xword	0x7731d18c6a452a46
	.xword	0xf0b8ede8881a7d62
	.xword	0x480b098b70d1cf20
	.xword	0x26c0b83394ef175f
	.xword	0x7065a2d9f924ac6a
	.xword	0x0ef36e24631512d0
	.xword	0x073e0335a211632b
	.xword	0xae64a6d3bce2f35a
	.xword	0x6e78b93b0a268e18
	.xword	0x834d8a027e117f79
	.xword	0x6ff068e0729a360a
	.xword	0xfd14d227b675c7e1
	.xword	0xdbb490cc6a6e9fd2
	.xword	0xc6b0b6cd76f0dc2d
	.xword	0x14cd9f4f16b7cb3d
	.xword	0x2b13f28500881745
	.xword	0xae30012942ecad6b
	.xword	0x9ad8b49693b66649
	.xword	0x3a68c0ce4b462ecd
	.xword	0x9d6d795cfe6f7372
	.xword	0x687c05a9e937b604
	.xword	0x079fea8538c19c8e
	.xword	0xaae0ffb994ac7d80
	.xword	0x276803ef0c4699f9
	.xword	0xadd3740336d89dcc
	.xword	0xa3d69fd170cf0a85
	.xword	0x17e00673e9cbc8db
	.xword	0x2f9f1e73cf48a134
	.xword	0x2b6beb6933195321
	.xword	0x988a189547ef344f
	.xword	0xf7d6879f971abc48
	.xword	0x2ee1a8f095fd131d
	.xword	0x5699293f60fe7721
	.xword	0xef49d24f9d44c4d1
	.xword	0xacfe4fb28a2ba09d
	.xword	0x53f6f2d8b6557b68
	.xword	0x464ccf38000a3fc3
	.xword	0x4f56def88bd29e28
	.xword	0x24ca2b1a089e4c2f
	.xword	0x37d9a80ad12653c9
	.xword	0x08dcea1aaa4826ac
	.xword	0x21a42e5654a0ae07
	.xword	0x06e9486d74f98577
	.xword	0x80988d44d9f0f8bd
	.xword	0xf082e4f52aee7ae4
	.xword	0x314e8cd156ffb739
	.xword	0x80be69674460798f
	.xword	0x674c57ddebb0f201
	.xword	0xb92a103898f2b518
	.xword	0x475125bd22d835cb
	.xword	0xa8bbe3344637def1
	.xword	0x73b63c7dcb40389c
	.xword	0x378ffdd1bd85a43f
	.xword	0xa89948cac567af1e
	.xword	0xb676bcc7cde06e8e
	.xword	0xe91d54cb2e031342
	.xword	0xcc3b28a7a2cd1089
	.xword	0x6321c34b6a0cbca0
	.xword	0x80e93c9639529da7
	.xword	0xfe096959a7270c8f
	.xword	0x0abffbbfd0e4a35c
	.xword	0x8cbbbd4b8c25db27
	.xword	0xfc61079aa1e0458a
	.xword	0xef0b7d0a685c3d30
	.xword	0x1a18eeb672db7b4c
	.xword	0x9d5126e1e17f211e
	.xword	0xd6bfcfc8181b673a
	.xword	0x1f9edc4fbbf09ad1
	.xword	0xc3cf8c82201ce18e
	.xword	0xab886bcceec9f174
	.xword	0x39c942386e34ba61
	.xword	0x26d1f94e90668eca
	.xword	0x50b77ac91c48aa40
	.xword	0x8820be8783e029df
	.xword	0x665a585aa1c11464
	.xword	0xaaeba849be1569eb
	.xword	0x633ca66202137276
	.xword	0xfa1303dcaa3f50c9
	.xword	0xf871e6d6ea86d3b1
	.xword	0x5bac4e8cfd38b10b
	.xword	0x56664b2776fdd4bb
	.xword	0xc39f767fa639f57e
	.xword	0xe07a8ac525a339ea
	.xword	0x363c777abb3dfade
	.xword	0x3c8c492318d1042e
	.xword	0x67767b26edd46ffd
	.xword	0x7a5fbeb70575f98b
	.xword	0x1f31116532c4f2af
	.xword	0xf5630f500fc8c37d
	.xword	0xd6f0e81f25074cfb
	.xword	0xe48d6e3622726bed
	.xword	0x708cd00e89b4e2db
	.xword	0xeb2f8c405a4c5979
	.xword	0xbb6538a2de137f63
	.xword	0xd58085bde1e89253
	.xword	0x1164c6014920452a
	.xword	0x6f64bb433fb48ea4
	.xword	0x0016fa26f60efe85
	.xword	0x858561a8d181b4ba
	.xword	0xad8510558c2a570a
	.xword	0xad115e745ef6c7d9
	.xword	0x86956d8a705ccf02
	.xword	0x60809f802b2964fb
	.xword	0x86de932cde1aca44
	.xword	0x67fc07d1a8e4ad4b
	.xword	0xbecfdc519d3784c2
	.xword	0x905c96c92722fe6b
	.xword	0xbaaac9b9d1e63ddb
	.xword	0x8c3820ab502c01fa
	.xword	0xedc065e010a6796e
	.xword	0x39a8bceaa8328c1d
	.xword	0xb3153a01203c19c7
	.xword	0x73bedc5cb5bfaef7
	.xword	0xdeea1fbe782f123e
	.xword	0xaf929682a75badef
	.xword	0x2b9375ccb72034a8
	.xword	0xc678e36735edb0d1
	.xword	0xd873211e37af3953
	.xword	0x5dab4e0a5c2471e2
	.xword	0x1b2b9e16a486239a
	.xword	0x6240b7501099d8d3
	.xword	0xf35ab289b46dded0
	.xword	0x502e5e98f952f5f5
	.xword	0xfdbca1680ad335d4
	.xword	0x42d1f2600c8389a5
	.xword	0xa86bf204bfbc5d66
	.xword	0x63cd1ea0b9429dfe
	.xword	0xff98b265bcc4222b
	.xword	0xe8d1b4678186018c
	.xword	0x42d569d090f0cd60
	.xword	0x12f5d4ddd4dfa285
	.xword	0xdcaa06b1ab39d067
	.xword	0xced975eda48480c0
	.xword	0x81bc61a7fd3c2552
	.xword	0x6dd0c126ed39dfa1
	.xword	0xfe5bd2590144932a
	.xword	0x9f3c5dc0a70874e5
	.xword	0x41febdee0baded76
	.xword	0x2adea0c4f24f0fe8
	.xword	0xf52603cf90de62e9
	.xword	0xc13bc8654bf08612
	.xword	0x8cc7ea672b2379df
	.xword	0x2fbae3f080cb020c
	.xword	0xde1a1b5a1f37a52e
	.xword	0x2bde643b11aa1084
	.xword	0x1ff63473816b55c7
	.xword	0xc6101dcdd8c649b0
	.xword	0x91b951c395efdc96
	.xword	0xd7c90df9a002bd5c
	.xword	0xc500e70d027dec41
	.xword	0x17b98cdb4af3e83d
	.xword	0xbe2d3026d7bc4325
	.xword	0x497b6e9b2d80ed6e
	.xword	0xf1fc0d7800747b71
	.xword	0x06e0f02bc222831e
	.xword	0x8073c6691999b061
	.xword	0x91590ff4a746e17e
	.xword	0x5e8ff1832e943b94
	.xword	0x82da79ac22b46346
	.xword	0x1c17a3b757d47ccc
	.xword	0xcaffe49b1fda146d
	.xword	0x1b47578dc211a525
	.xword	0xcbde36f2a9205eac
	.xword	0x759d7c587e60fef8
	.xword	0x59630fe11164f49f
	.xword	0xd07779159ce1bab3
	.xword	0x4773c3194ec55074
	.xword	0xd8267db9961fa5ef
	.xword	0x580857035bc33a0c
	.xword	0x3bd8e781fa0ffa56
	.xword	0xa2e96824e227820c
	.xword	0xac3570a1e0a005e2
	.xword	0xb87cb6ad818aaa2d
	.xword	0xbca3bc246fedecf1
	.xword	0xdb76b3ed4868aeec
	.xword	0x3e0214b720fcc5e9
	.xword	0x17c071e31a7822ab
	.xword	0x385cb9148a943cab
	.xword	0xdaa7b815e9531521
	.xword	0xbe5713942247ea91
	.xword	0xea090c38c1979ca7
	.xword	0xad7415d01c970af2
	.xword	0xcf3714a20ae81578
	.xword	0x8edaff430f21cdf8
	.xword	0x9f09e30d8c8a6089
	.xword	0xe729557922199606
	.xword	0x76e20e5cb55bf154
	.xword	0x0e0d4c3d6a98ccb4
	.xword	0xe827a7a39cbf8650



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
	.xword	0x926bb82d6da3a332
	.xword	0x2529f85b06c85ff3
	.xword	0xf199c42d4f1372a0
	.xword	0x9d5001f3e1252756
	.xword	0x4343650e467b63ee
	.xword	0x7ca45ebd74009f40
	.xword	0x7c24bcb62a74ff46
	.xword	0x8377730b4daa8c71
	.xword	0x0d641c55f4bbe0b2
	.xword	0xdcab14bc0cff0bdd
	.xword	0x7a4279fb0fdbf53e
	.xword	0x0c7b61aa5c541e54
	.xword	0xc0cb082ddc403335
	.xword	0x0efb0f91b9b6c5e8
	.xword	0x4a08dde9f9ec8e1a
	.xword	0xaeb2d0b5e362b536
	.xword	0x2b1eef976f245765
	.xword	0x8df01471691fcaa9
	.xword	0x2ed1b41b3a727e23
	.xword	0xe89d3445183a63e6
	.xword	0x6f408dd127e68416
	.xword	0xecd10a11c1d5c3c3
	.xword	0x91be787158b962f8
	.xword	0x0ae1d08ee0ba8d08
	.xword	0xe16530b0bbb00adb
	.xword	0x20f3f54f688b3c99
	.xword	0xb6546b35b09ef86b
	.xword	0x042aab5008a78f3b
	.xword	0x8b7e025f3906b473
	.xword	0x76e3a3e5f7ce97b1
	.xword	0xf388533f9e5c95c4
	.xword	0x9a7267d07c896ea8
	.xword	0x1917c5c6f7db000c
	.xword	0xcc46bb24f2d7b6d4
	.xword	0xb394ab0fb81aa250
	.xword	0x0fb0933b548d0b58
	.xword	0x37f3e39563ee0a6f
	.xword	0x8e781bdf6c6a514e
	.xword	0xe5003d1c7ead9bfd
	.xword	0x9a39428af6ea8850
	.xword	0xedbfe2f7548dc2e7
	.xword	0x6b49684807040710
	.xword	0xf048ad767677aaa7
	.xword	0x8bb57eebf73b402c
	.xword	0x5c0a7cf4bbd33283
	.xword	0x0375d6a83b544028
	.xword	0x3e4c6263cd420acd
	.xword	0x9c79939ce53d30d2
	.xword	0x564fb8dbe7229778
	.xword	0xdaf712efbf005d26
	.xword	0x94b730f201c0054a
	.xword	0x25829b8aef1a18db
	.xword	0xd60f1dd074b40879
	.xword	0x6948d66a092fe3c3
	.xword	0x86b1b55df29a260c
	.xword	0xddc4408f1b436969
	.xword	0xa155cd5042d9aaf1
	.xword	0xd1475062702d6240
	.xword	0x83229bfc83ede8de
	.xword	0xe7b8d61ee3a1ba94
	.xword	0xb4a77e29aae63841
	.xword	0x300426f66c547b3f
	.xword	0xd62c7cca4a59c399
	.xword	0xbed6b75ca4b64583
	.xword	0xfc58fded3245fd0b
	.xword	0x06e948ebaa3d9696
	.xword	0x209976cf4e8027d3
	.xword	0x5663a4e2ca8839f8
	.xword	0x18623d8cc50295d2
	.xword	0x29de3c5965d689d7
	.xword	0xa1a92135c91b0cb9
	.xword	0xb4816b009b17eb80
	.xword	0x12e46cefcf2a0627
	.xword	0x7b234ed6053bb46a
	.xword	0x13ccc29f51f34b1c
	.xword	0xd4c179aa59746eb9
	.xword	0xdd0da1d4c47585c8
	.xword	0xb0d4f96c03a8ca45
	.xword	0x87109ad647aa9e49
	.xword	0x688b5a7c68616c42
	.xword	0x1db18b752b7736e2
	.xword	0x30a4a50fcb20756f
	.xword	0xe2e78ae557b0eac2
	.xword	0xcbcd2833621b5239
	.xword	0xe05616b5e1e6c278
	.xword	0xf8ca7e57bfeca92d
	.xword	0xeb257ada8bc13dc7
	.xword	0xa63ae36b4f05a0ab
	.xword	0x7783e53746919ab8
	.xword	0x64c23622d41dd5d7
	.xword	0xa543ac3152c7bb8a
	.xword	0x2eefb246ea94562e
	.xword	0x40e3d6a8060e6ca6
	.xword	0x00a6fd424df9c4cc
	.xword	0xd21ef8db0c0eaf03
	.xword	0x1366e7d99e5a3546
	.xword	0xaa1a090f239946fe
	.xword	0xbe0609364fdf810f
	.xword	0x93b21b9cf732bb3c
	.xword	0x494e6e7da6cb03e6
	.xword	0x1e3e935a2a280b89
	.xword	0x6443954da4c3a0e0
	.xword	0x0a64a6649c958062
	.xword	0xe34848853e9a76f5
	.xword	0xe09331faa526a4d9
	.xword	0xc0f2267f87ae5468
	.xword	0x1fabcf993e621ea6
	.xword	0xee306f57b61d30c5
	.xword	0xbb284463a6e1038f
	.xword	0x7258929284bb0bd2
	.xword	0x1950049830c8bf0d
	.xword	0x5f1fcd0887d2dc20
	.xword	0x85a6c7503381376d
	.xword	0x19ef0779809f29ca
	.xword	0x1fce3bba3fb7b40b
	.xword	0x0b196fff8fe908b5
	.xword	0xf20ce0f4b96783b8
	.xword	0xfb0d57e96bcfad3f
	.xword	0x23fac48fbb162302
	.xword	0xbe6473d7076cb46c
	.xword	0xd04ee7ec0316b4c7
	.xword	0x59b6a88bd09ac4a3
	.xword	0xa361fed3d98c8de4
	.xword	0x097461097bf92709
	.xword	0x61f16c72244f9d04
	.xword	0xb75fda3db9b05fa1
	.xword	0x3ec37d1676045fb9
	.xword	0x4c39e01d095b48d7
	.xword	0x65a989bb1d8273b9
	.xword	0x974be896cc102a74
	.xword	0x460c1b4d8ebce2e9
	.xword	0xf4a8b269fa141a69
	.xword	0x945b526dba7c753e
	.xword	0x3a0058dd39adae16
	.xword	0x0549bd2937cbaa51
	.xword	0x507c7c0673c6ba8a
	.xword	0x2b6c556bebb33bdf
	.xword	0xb03ca6ce6c187bca
	.xword	0xe95e1752f51ddd8f
	.xword	0x2ec8cf4baa4787de
	.xword	0x36a38e0c9c3adf54
	.xword	0xbff8c940d30b7efc
	.xword	0x5b8b96aef1316f3f
	.xword	0xf0b1d4f064c99a65
	.xword	0x7fa8668c8d0060fd
	.xword	0xb114bf05b17b17ef
	.xword	0x2e3e0ea614df28b4
	.xword	0x16243e816d65ebfb
	.xword	0xe889f9c4bc8bd2ee
	.xword	0x1d8147b5ffa7f84f
	.xword	0x4788000d98e66250
	.xword	0xe9e9eb117366d01a
	.xword	0x87a002dd28c77b24
	.xword	0xb3c75c9472d10aee
	.xword	0x57e88ecbeaf10075
	.xword	0x7772e0cc14531173
	.xword	0x5f3df86144b51e40
	.xword	0x0926a1db50d63369
	.xword	0xd74fb8e02a9a6409
	.xword	0x6e6d5f9b0a37c6a5
	.xword	0x40c0056aa5476d98
	.xword	0xc714ea13e8733ca4
	.xword	0x01f3069ff9ce8179
	.xword	0xb340c6a086885371
	.xword	0x25ed582e49e5dc1f
	.xword	0x4432520bbbbbb0e9
	.xword	0xb1066e1a955409f8
	.xword	0xfdb345167641a5ba
	.xword	0x8ea6d0e24b1e4aa8
	.xword	0xe9eb4b16ae7cfe3f
	.xword	0x3afbdd0be8df479c
	.xword	0x97489e6c3a1569c0
	.xword	0xf49b3398c2fbec6f
	.xword	0x061cf52398ef162f
	.xword	0xb642f799a3a044c3
	.xword	0x49879329fb458f47
	.xword	0x8c8a1aa98f680a99
	.xword	0xcb8c250a4cfc1de9
	.xword	0x6aa267408265a740
	.xword	0x16428851441a8059
	.xword	0x8df6e19c292d0e3e
	.xword	0x757ec4ef5d174ae5
	.xword	0x143cd42e254c7a09
	.xword	0x588eb123b7a5548d
	.xword	0xcbb1de4d2e980776
	.xword	0x1849aa643b5d0f72
	.xword	0xe20882b680957cfa
	.xword	0x76c37ea6139b82ba
	.xword	0x785d7c88f98db656
	.xword	0xec7954539b10f873
	.xword	0x19ad1d90463d1dc6
	.xword	0xe53b0a8429111c9b
	.xword	0x0761be6caff0816e
	.xword	0x35dcadc7d1a99d12
	.xword	0x9944d0990c0b0fdd
	.xword	0x9727fb5b143aca45
	.xword	0x6e706212b18c65ec
	.xword	0x60cb664a90d1bff5
	.xword	0xe693b7b0818009db
	.xword	0xc6192b2466d74e98
	.xword	0x5650ea41c9ff79ca
	.xword	0x79789fd4b0f08246
	.xword	0xe2dc175736cb7a3f
	.xword	0x04c9bef0f242e668
	.xword	0xbdbb95031b1c16dd
	.xword	0x358de39c5fed8daf
	.xword	0xe92a0ddd8a755d40
	.xword	0x1ce59b59d526e7f7
	.xword	0x8be0de99ae47b60b
	.xword	0x38b1c1dfe7575538
	.xword	0x307f9e858f7b934d
	.xword	0x1e53b81a3adc73f5
	.xword	0xa21a7551da6e268a
	.xword	0x2ffe6b5a413cc0df
	.xword	0x8193d54de36e59b0
	.xword	0xf20f89703f278bd7
	.xword	0x3317ce3513489c87
	.xword	0x7f5e76fe93055c55
	.xword	0x88f3f844beb14476
	.xword	0xd33ea962fc8da1c2
	.xword	0xb96da4cf962ce0fc
	.xword	0x2dc94daf7b3e02be
	.xword	0xb29e84709d82d960
	.xword	0xc1b226ee51dfe7ae
	.xword	0xa226bdb8696253be
	.xword	0x422b2968de1a2739
	.xword	0x62ab05843a31d665
	.xword	0x04dee9b9be4699f8
	.xword	0xa4165c4bd75fc2cd
	.xword	0xa92b7a98c375f4e1
	.xword	0x3d02755a721f923b
	.xword	0x15bde960599da4b1
	.xword	0x880ccacc8f39e5b4
	.xword	0xaa065c85b6f46c4f
	.xword	0xeb2081f163bdc8e9
	.xword	0x8063625952c2dce9
	.xword	0x8e79d60abd94cffe
	.xword	0xe4c9785fe5401ad6
	.xword	0x3825976ee3811e24
	.xword	0xd9c21f86b3e0f758
	.xword	0x771bdcc4b3db9f5c
	.xword	0x5197c98ee3af4cc2
	.xword	0xc7b576bb3da9439f
	.xword	0xb28a1eb96a00ad06
	.xword	0xfd5006a88976aff8
	.xword	0xcfebe81d80ecfbd9
	.xword	0xb8d81cc914d210f5
	.xword	0x5ae18346d3a2c003
	.xword	0x93d8c16d8ef56b56
	.xword	0x704e4929433a7a09
	.xword	0xcad56f0d675a7864
	.xword	0xb57722207f9b31bb
	.xword	0xe8ded5f3da2ea286
	.xword	0x24431a44d1c0caa9
	.xword	0x38668dc630e3e7e9
	.xword	0xc1c0c76473d1debe



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
	.xword	0xdb0e73e88f871fec
	.xword	0x38058ca793384f30
	.xword	0x0bc79a89e0f1daf1
	.xword	0xf266d9c7ed3bd08e
	.xword	0xb5bb34adaea4d306
	.xword	0x9320d3635c2c1838
	.xword	0xb43f810adb44683a
	.xword	0xa7e3eae4b4ba2110
	.xword	0x316f063018216245
	.xword	0x0129d812af147343
	.xword	0x33266897b9151f1d
	.xword	0xa79ae51879491de0
	.xword	0x02557686481784ef
	.xword	0x104ebffe5cec3692
	.xword	0x9ac7c0d5db348ee9
	.xword	0x372ff3f4a8cd2e26
	.xword	0x6e6f8c34d4ce6521
	.xword	0x60730c3f0ec534af
	.xword	0x9c3c4cf3fe23fdae
	.xword	0xe302569493e4326d
	.xword	0x936f18eb3a487ec8
	.xword	0x8e3db290415bf4c2
	.xword	0x490dd4affcfad2df
	.xword	0xaaccab95a958630d
	.xword	0x8ee72928c89ed894
	.xword	0x4f009d04d4d40e94
	.xword	0xed36457d979d0a0f
	.xword	0x075f1c2531388498
	.xword	0x6460a513514a7530
	.xword	0xd0bce64e1a619dfc
	.xword	0x40e50174b2ae2b82
	.xword	0x229a420fc0d1b0c9
	.xword	0x5c26f0dbbf28c2c2
	.xword	0x490751653daf7eff
	.xword	0x5bc776da310fe320
	.xword	0xb23bff870ff0ea58
	.xword	0x46d0662fa63e090c
	.xword	0xe1642856da697521
	.xword	0xc61d95fff12767a6
	.xword	0x40713ab9b81ed4fc
	.xword	0x629a7773c1995a18
	.xword	0xe4e1712f4d7e1617
	.xword	0xcca6f7ef5a66c57f
	.xword	0xcf6bdf02497402de
	.xword	0x76e06c9202db8e08
	.xword	0x828e03fe77a345af
	.xword	0xf787dbfe944cb1c2
	.xword	0x2b7a502cf87ef52b
	.xword	0x4af4b4c7ccd83c5c
	.xword	0x1ed608fb81834782
	.xword	0xcc5777438c093947
	.xword	0xdd59d4ac138a8d48
	.xword	0xd21ce821b0b96f8e
	.xword	0x6ba221491e239498
	.xword	0x76ad2d6012581907
	.xword	0xc998e905bf4053a5
	.xword	0x3760a74551bb891c
	.xword	0x0a5496606b16da4a
	.xword	0x8dc272997efb5393
	.xword	0xed5cb19f766596b9
	.xword	0xe7b2b6b647ccf3f6
	.xword	0xfd8c219cf99b0cb8
	.xword	0x9bf6de66c0336113
	.xword	0x5e9129e489852904
	.xword	0x169485ffc5ef694a
	.xword	0x377d6c47deed075c
	.xword	0xdf78ae0ef1e21342
	.xword	0xe6f5af730172d9b7
	.xword	0xf29e1b5d97164584
	.xword	0xe1754a187363273c
	.xword	0x5f98dbe31572d087
	.xword	0x052bb964e9582cda
	.xword	0x609a11c21a377283
	.xword	0xbd6955dbae309208
	.xword	0x71d3f9f87ea9e91e
	.xword	0xdb4c02ab21fbee5d
	.xword	0xa23a4324ee6b36cb
	.xword	0xa557059a0a1ed486
	.xword	0xda9f85a9f5296c8f
	.xword	0xea55fdecd69eeae0
	.xword	0x2f5a3e252f6aa714
	.xword	0x6ac310f02c6f63ee
	.xword	0x443c43cb5f7f676a
	.xword	0xfcb020b65b8c47d9
	.xword	0x959b35f096c0ca3b
	.xword	0x246aa3a9a5eda67a
	.xword	0x3fd464fc3227d17d
	.xword	0x31dd752d0b75a66c
	.xword	0x2574c1c48637797a
	.xword	0x196349f3dc9973f0
	.xword	0xa06bacb40668c3fd
	.xword	0xedfe66103315fb17
	.xword	0x59e91214302938c4
	.xword	0xb9a768f05732ce87
	.xword	0xe01b7381ce6f717b
	.xword	0xdedc60f531a7234a
	.xword	0x114c7a6d662a380b
	.xword	0x03b211342662226a
	.xword	0xb0978d132942d39b
	.xword	0xeed930544e97078d
	.xword	0x7094bd9d3ce226a3
	.xword	0xf251c5bc78f4f78a
	.xword	0x6c6d6e236f4e9590
	.xword	0x0521662ed089116c
	.xword	0xc76ba89d604d74fe
	.xword	0xa53ce0a1ee77862b
	.xword	0xbad0a9f35101acb0
	.xword	0x334a69b17b3d74ee
	.xword	0xfe1a552fd9f53ab4
	.xword	0x752ec7cf35e1d9c8
	.xword	0x51c75e88b20cfd8b
	.xword	0x94f49212b86f8006
	.xword	0xc8f7cf97f561969e
	.xword	0xa79573e4c335a4a3
	.xword	0x3364a03dd6753e67
	.xword	0xefefe311e0628bfe
	.xword	0x9dcd504073cbf5d2
	.xword	0x0c15d4179c58e6e7
	.xword	0xc858a10f861e3aae
	.xword	0x25c9b9c9cae535fa
	.xword	0x34c498d2609c5f89
	.xword	0xd8b2b32ecce43408
	.xword	0x4bc97bc57167a9e4
	.xword	0x4d739e58908d77f5
	.xword	0x07a879c3cbfc727b
	.xword	0xec754303a20fffbb
	.xword	0x5ccc83fb13fc6567
	.xword	0x91cb98564cea82a8
	.xword	0x6d319524ba5878ab
	.xword	0x895a4cf333f150bc
	.xword	0xe5af2d0171c68688
	.xword	0x6ae9ac7ee18e3255
	.xword	0xcbd65bd9c6b4d7d7
	.xword	0xc793b203ca478a52
	.xword	0x30322cf67260d406
	.xword	0x384169f4eeca791c
	.xword	0x1e10e3ac669a4a39
	.xword	0x8e3abaad6fe22c0e
	.xword	0xe0b093552a27b191
	.xword	0x2639dcf1d4c2e521
	.xword	0x69f0b7081f7bf9b2
	.xword	0x32916c89118c64ab
	.xword	0x65d987d3693ec1e6
	.xword	0xaf2f30e6ff3ce572
	.xword	0xfd071b4f109b0435
	.xword	0x656a58f92b78686a
	.xword	0xb42110c3408cfa69
	.xword	0x9c2e31d2c77e6fb5
	.xword	0x833f8d634ec2f40c
	.xword	0xf1862ecde9b2a048
	.xword	0xb0e91f888eb48ced
	.xword	0x981c7c0e51b591ac
	.xword	0x3d8068b09b30863d
	.xword	0x56f4c92cd5626f2a
	.xword	0x393ce0b258a9cfdc
	.xword	0xd8f71c09fa7d05e9
	.xword	0xd9f04166d571d669
	.xword	0x6febbffeaf3a60ba
	.xword	0x6032435c38147e31
	.xword	0xeb30a1f1561e38b2
	.xword	0x12a8460c19bbdf70
	.xword	0xce9ab94491c97be9
	.xword	0xf487333e6992805f
	.xword	0x35e0b3e4314c9d6f
	.xword	0x733db470b581d36f
	.xword	0xd582f86f74928620
	.xword	0xfdb22c35273215dc
	.xword	0xc593d6a26d649e01
	.xword	0x57fb6ce215813687
	.xword	0x31ff64d796ffbd87
	.xword	0x833596fa0562f5f0
	.xword	0xfa83601e87680503
	.xword	0x880a44832b214cf4
	.xword	0x70a99ccbe7d687a7
	.xword	0x3ff02b01f18ed778
	.xword	0x49f4e8753240fd7e
	.xword	0xe2f7972db1a97377
	.xword	0xb55b929dd47b53d3
	.xword	0x59827a065b9e37c6
	.xword	0x8cadacdd16c8c6c7
	.xword	0xa243a089238358e7
	.xword	0x0f66e42ffc246f97
	.xword	0xb1a75dfa886d3d2e
	.xword	0x5fbc2ac1ef8d4e0c
	.xword	0x68405fb2e5c6600b
	.xword	0xb9e1a083fb9ba020
	.xword	0x759fbeab912b6f33
	.xword	0xabad8a7bdcd043b2
	.xword	0x84c9c0405acb4988
	.xword	0xe5c6d83fbc1634ec
	.xword	0xb1c2dc155e077c04
	.xword	0x77bd2d61b2455193
	.xword	0x777975a14f8a84da
	.xword	0xf06f025deb239217
	.xword	0x3a4a54c8c5ec9726
	.xword	0x6a4f9160ddafb57f
	.xword	0x987b71984b3693fc
	.xword	0xfc259025333f6513
	.xword	0xc3ebade7a51fcd77
	.xword	0x886a8dcc997936b5
	.xword	0xc23c3aeb1a54ee6c
	.xword	0xbd7c242acb8027a7
	.xword	0x375be59005cb8d9e
	.xword	0xa1610888ab2d4449
	.xword	0x15e734d667a2f393
	.xword	0x6fff4f093fb02a21
	.xword	0x6da156f7a841f590
	.xword	0x566ce660bb2d85f6
	.xword	0xf9fd08dbc31f3ea7
	.xword	0x9d93eb3e080bf479
	.xword	0x5864f70392752c38
	.xword	0x9a7176d943d17e91
	.xword	0x4db41002a400e353
	.xword	0xa317e52b587d77d4
	.xword	0x8a87264d43ac4855
	.xword	0x3af5be61381aac1c
	.xword	0xfca6d0c9e6cd5b00
	.xword	0xf88f1cb416480b07
	.xword	0xa32ab277c3e6e655
	.xword	0xd9de2ac5db04a304
	.xword	0xf8fdb7f682d894e8
	.xword	0xaca03ca51db013f1
	.xword	0xdaa322824ebd9128
	.xword	0x61a260fae460ad0c
	.xword	0x669f793ede12dedd
	.xword	0xd1a5019f86108dd9
	.xword	0x1668249f29803e03
	.xword	0x28642c23900fb750
	.xword	0x60fa17a01f3fbf67
	.xword	0x8d8735d2c8376a81
	.xword	0x0de1fee95c4a35ea
	.xword	0x1c6530857e6bd4d3
	.xword	0x2769b0189f16b930
	.xword	0x73bb5460c4fcf87d
	.xword	0x3c6e79a80d29d182
	.xword	0xa9c4d834b2bbabe9
	.xword	0xeb74f39a57931fbc
	.xword	0x14debffef74be6f1
	.xword	0xe06a4a2831bfbee1
	.xword	0xa25f0626ffad245b
	.xword	0x5791492eb3f9908f
	.xword	0x7049e7ca6afec017
	.xword	0x335b520b1452851d
	.xword	0x48ef93e68e52205b
	.xword	0x42f0892ddb44df6f
	.xword	0x14781a293b754b93
	.xword	0x9c38fe88c352d7a1
	.xword	0x6157775508267083
	.xword	0x84fd458ec85fc2d9
	.xword	0x9ad8e12a7eb9cc59
	.xword	0x5ea4617199c74e0d
	.xword	0x3980773213a25127
	.xword	0x8cd76c57a22fe582
	.xword	0x0df731bc94af5187
	.xword	0x89ba32ecd88684ee
	.xword	0xb627cc7a59f89dec



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
	.xword	0x75739f1576a2ccfc
	.xword	0x1eacb0f42ad1b9b8
	.xword	0x43f6d860b2a2163e
	.xword	0xa03a8ed4fece5c5f
	.xword	0xff24b51cccda10a1
	.xword	0xd9350a00b91844c0
	.xword	0x3524020cb7962fa1
	.xword	0xa9dd57b82b7c2179
	.xword	0xb0cd1e18b64cef34
	.xword	0x064b240f2d282c40
	.xword	0x044ec5efebc29a3a
	.xword	0x0d01498572393a06
	.xword	0x5f2dfa1e19baf044
	.xword	0x005e6ef942a72226
	.xword	0x5cb8275b15bb514f
	.xword	0x5d458fb6c963eae6
	.xword	0x459f1d67a3a4acf2
	.xword	0x165b322b01fdc99b
	.xword	0x7b7184229d6d7182
	.xword	0x336d42a552eee6ff
	.xword	0xe322c80fd85a9a8b
	.xword	0xd42f7e63ce7a51db
	.xword	0xbd80cc609682df7e
	.xword	0xd6d0323ef81e73e8
	.xword	0xd5e0200acf2f6e91
	.xword	0xa54c231f3aacb802
	.xword	0x78037dbb8f349014
	.xword	0x97e26044ae18b5f4
	.xword	0x246b8ec89f61363f
	.xword	0xf17778d79b43a922
	.xword	0x6d7bf6ef732b0575
	.xword	0xabc698519d9961e5
	.xword	0x80e4e1fbd7ab35f4
	.xword	0xa8e23b7036ebbab9
	.xword	0xeda21795d730e1e8
	.xword	0x27a19c9b2796eff6
	.xword	0x8b6b2b1c0751a5e3
	.xword	0x03d5c8c606cf42dc
	.xword	0xa058f1da0259bda5
	.xword	0x4901d86789756c10
	.xword	0xfe2a5497d78c1a02
	.xword	0x6127537c1afeb497
	.xword	0x5ae72a2c93e9c5e2
	.xword	0xd4389cf5282042d8
	.xword	0xa71f3df9a334c751
	.xword	0x5d1bdd634d0accda
	.xword	0x485ff021fad019db
	.xword	0x9f779e4f42005481
	.xword	0x8144a6bf2670b81f
	.xword	0x00f2661a078da3b5
	.xword	0x9e8155e3d29e8928
	.xword	0xf6d85feab974e7b8
	.xword	0x491a73f06a17f1ee
	.xword	0x873208e4c257c457
	.xword	0x298cd8d24dac2eb4
	.xword	0x067db572121dc880
	.xword	0x6f9cc90c29d1de4a
	.xword	0x820993619ed60ed4
	.xword	0x1a1133a84baa095f
	.xword	0xd4094e20d4fb4f72
	.xword	0x8decbf058278ed69
	.xword	0x1754bd19afb37889
	.xword	0xb229b98b620a3a6d
	.xword	0x818d7ac1c45b2a09
	.xword	0x9eb1dd3344a3fe12
	.xword	0x645e23a15eba300d
	.xword	0xafce485fe738c53a
	.xword	0x6425ff8c0b04351c
	.xword	0x948a80d321d67336
	.xword	0x10059828b10f3e67
	.xword	0x191c2239d4babd27
	.xword	0x290914ebd93d6140
	.xword	0x6c613008a23a28d4
	.xword	0xb2d2f369d31ca722
	.xword	0xa5aebb8554cbae64
	.xword	0x4fec1baa36c33f47
	.xword	0x08216658485b8a80
	.xword	0x4eeecf9553760658
	.xword	0x345f72e3922027c3
	.xword	0xfefa87ef8c5dfec1
	.xword	0x6819ec78497a87d6
	.xword	0x0e8cc7e395eacfec
	.xword	0x030e4f3a449b98f0
	.xword	0x6f6167863453aa8d
	.xword	0xde4eafb764838ab6
	.xword	0x028233c86b3dfff9
	.xword	0x94a6aca20d098582
	.xword	0xaf328508d1dd5a79
	.xword	0x7b0c4402c04b353a
	.xword	0x4eba6cfe4f005c99
	.xword	0x2e41382fe99c87d7
	.xword	0x06e99792c9211d7f
	.xword	0xa0e9cbe79f71f26d
	.xword	0x56482648d4fa9fbf
	.xword	0x37e6ec55dda56980
	.xword	0xcc91fcb3bbf66961
	.xword	0x8dbfddb3dce51f79
	.xword	0xe16cf29cf0b40da7
	.xword	0xc588c12d7ae70aaf
	.xword	0x1ab1ef1196e79d15
	.xword	0x2bea6f9766b39882
	.xword	0x98c196651565b4c2
	.xword	0x330916b34344e616
	.xword	0xf9798a4dfb4a234a
	.xword	0xf1f865081bdd77f3
	.xword	0xda2d3121c0c009f2
	.xword	0xfefe58cc6a31277b
	.xword	0xc88a51df7ab265eb
	.xword	0x8a3d96e197beb1e8
	.xword	0xf4a15f78721680af
	.xword	0xfa31bf24af7f7bf2
	.xword	0xdac233ab17d1da22
	.xword	0xd233adfb420249d7
	.xword	0x027fbca183f45591
	.xword	0x8d95846d3e745429
	.xword	0xc9d4697916b61525
	.xword	0x908e388af16e5657
	.xword	0xa389363f7e0e23a2
	.xword	0x479310cc92699e3a
	.xword	0xee53ba6612e1c733
	.xword	0x6a9466f5c4fed8be
	.xword	0xbf0b7a83b2f594d4
	.xword	0x0c6d689f9b82225d
	.xword	0x07afa7f73c526ef1
	.xword	0xf1db733b72633e97
	.xword	0x88aba755afb9f28b
	.xword	0xeac08d7e810d5668
	.xword	0x815841f5c33995c9
	.xword	0xd94044916321f452
	.xword	0xeb26d0907d80ee87
	.xword	0x82411f833d7a52d5
	.xword	0xee743e43aca7cbf2
	.xword	0x36eda8b478b98d05
	.xword	0x09f51c4d5f08de21
	.xword	0xe0dc57401cf77272
	.xword	0x6c5182d38d7f88b0
	.xword	0xe4da4ae3379425a7
	.xword	0xf3f0af9a8dc0de88
	.xword	0xc176f657cdd0bc55
	.xword	0x2a060dd52c26da09
	.xword	0x2b7f43adf0a2ac5f
	.xword	0x99e8fe9af1a1e9a8
	.xword	0x24c5ffb61ea0f2af
	.xword	0xfde6e8cc242f7c53
	.xword	0x1a85887161c8cb33
	.xword	0x97e3aa1523d60865
	.xword	0xb60eaf260ec7bc3e
	.xword	0x2e81574830dd413f
	.xword	0x2565eb7a1f2eec70
	.xword	0x2b8ce441e613ed00
	.xword	0xaeb296cea1b7a531
	.xword	0x36e41ebb95022434
	.xword	0xd62a6dc39df7c59a
	.xword	0xb0d5291623084a71
	.xword	0xe5642c4c9f448d39
	.xword	0x5de05abffa6746bf
	.xword	0x36e2a2ed9c8f87d9
	.xword	0x3707962d9af0cbaf
	.xword	0x72dd0b9f8fd9c3f7
	.xword	0xf4084f6d1ff22c46
	.xword	0x52cd28f8150bf1dc
	.xword	0xafb7d7f8f4e55784
	.xword	0xd978f0324c75b2ad
	.xword	0xb0bb5fb7fe248093
	.xword	0x4f673f544ab4f3a8
	.xword	0xa2c218d4e8271fd3
	.xword	0x456fd5230c82284b
	.xword	0xfa3ab586bfd81050
	.xword	0x9c2f54c09a83d093
	.xword	0x0e38154345f4dfe3
	.xword	0xf729321a548b5925
	.xword	0x2f97297631bd4425
	.xword	0xa82e0cd0cb82b1d2
	.xword	0xdba7d7da128ae36b
	.xword	0xc501d10a39f19b8e
	.xword	0x8e5b467df47b199e
	.xword	0x351341a3957ae4f9
	.xword	0xa17afa12260d435c
	.xword	0x3788c13f33731f1e
	.xword	0x33160d755ad8165a
	.xword	0xeec9210f1e45606a
	.xword	0xd0257b40b0c21085
	.xword	0x5b56c700d2813748
	.xword	0xc6d94bb2513e6966
	.xword	0xf69c59aaa02c3e44
	.xword	0x5afda7d94f19aae3
	.xword	0x2747d330db55f8f6
	.xword	0x130f7eb3242b93af
	.xword	0xb4e7b41d8a1c5302
	.xword	0xaa390a6c58c47e71
	.xword	0x7a3f534e08c6ea0b
	.xword	0x15cc573dd34800b1
	.xword	0xb932d0dd1c38608a
	.xword	0x8c2fc3e53585588f
	.xword	0x3f53375f82ce5ac0
	.xword	0xdcf1fcbef2193eaf
	.xword	0xa857aa40188edd5e
	.xword	0x6cd45f374d4d9d2a
	.xword	0xe93fd64dfee7869f
	.xword	0x8c2f98ae60ee43d5
	.xword	0xd81a01028aaa1129
	.xword	0xce7522cf4b7cab9c
	.xword	0x8b9eba00c893f5e3
	.xword	0x2a99fbd87888c4a5
	.xword	0xdbcebc2bc9bd861c
	.xword	0xc53f72a90807c6b1
	.xword	0x67c168eed4150368
	.xword	0xafeab12bf1e0b1dc
	.xword	0xd169a110c668ddb7
	.xword	0x578bce4740430aa5
	.xword	0x110f203b30b5fab2
	.xword	0x6f6acd6066dbdd93
	.xword	0xb42317678e1c692e
	.xword	0xf15e4f9e5bfcb626
	.xword	0x6049850453f95fa2
	.xword	0xf3a103554f242904
	.xword	0x1802dcd2ed14c881
	.xword	0x7b9a985e719b517c
	.xword	0xc6ab9b7a8aa8b2d0
	.xword	0xeab88527b6a898c6
	.xword	0xb5fe2187d8fbe6b5
	.xword	0x0bbff1172f5ac7e8
	.xword	0x9ffb0c39e2b13a54
	.xword	0xa731d7bc064dea9e
	.xword	0x4b9e815c5794f715
	.xword	0x7f5d65831db86a1a
	.xword	0x882a533fceda1a56
	.xword	0x8dc2561a994a93ed
	.xword	0x02c4118890df8064
	.xword	0xc04381ee69b100dd
	.xword	0x8a2c7a71b49f9996
	.xword	0xdff43c1a576ef6d5
	.xword	0x2430e283dab02a14
	.xword	0xf67d47739aab7d83
	.xword	0x2ab3ba3ce10a7824
	.xword	0x122d1237ad46e8ba
	.xword	0xe035de58a8ba41f6
	.xword	0x5c3340f65d56415a
	.xword	0x548f9c719135889d
	.xword	0x335b6122d229bd04
	.xword	0xcd2076e3b5c316b1
	.xword	0xff0b505e1b63de91
	.xword	0x5511c707fd9a79df
	.xword	0x03a23b71ba75e353
	.xword	0x6d34efc0d0e053f7
	.xword	0xba28b9bfcfd7e801
	.xword	0xb362b0c5f7b345c8
	.xword	0x07b10d7445d1e469
	.xword	0xe3ba9933021408d8
	.xword	0xbde6c95529f3f293
	.xword	0xcd599475f990d6b0
	.xword	0x02e4a7aff788f6aa
	.xword	0x3dfcf0dc011052e4
	.xword	0x02e76fdeb165c479
	.xword	0xe3c2635466bee7bc
	.xword	0xcc3c08f7fbb4eb3a



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
	.xword	0x28cabf3561aa6b2e
	.xword	0x709b131bb2ace9c7
	.xword	0x468c36ade7e345bf
	.xword	0x089505398af14c0d
	.xword	0xdaf095411eb3474e
	.xword	0x9e7ee3c438ea5ea0
	.xword	0x67b1475ba763ef2b
	.xword	0xcd2f64ecf28aebbe
	.xword	0x0bb28ea763d76591
	.xword	0x5437350f5b59ac6e
	.xword	0xa7f52ef54bb3e988
	.xword	0xce1c0ff426fcbf32
	.xword	0xc610c23ddd249115
	.xword	0xe99043b1990c8e3b
	.xword	0x31e3dbf6ad10e816
	.xword	0x09b7b55584d011fc
	.xword	0x4568825ccf05e047
	.xword	0x92a5c16470c30d0f
	.xword	0x6280a3241a5be962
	.xword	0x9918099f223347e6
	.xword	0xa88dc33c03c42e49
	.xword	0xb1826e5d2f822b3f
	.xword	0x4a789e728ac55c48
	.xword	0x5c86b6ae11455fe6
	.xword	0x712875bded2c896f
	.xword	0xaea0b1d035cb88ac
	.xword	0x90bd9193a50cdd64
	.xword	0xfbae4357776509bb
	.xword	0x57cc36e6c0cf880d
	.xword	0x03fd83c385534c61
	.xword	0xb090389d9a2cea1d
	.xword	0xb47fa3e3a7d50304
	.xword	0xb7d76826e7c30195
	.xword	0x72fcda7392a01868
	.xword	0x7c46d0083e373107
	.xword	0xaec9c9eab4174719
	.xword	0x912ff159abc86260
	.xword	0x5b0d730aaf4cdfe7
	.xword	0xf1a52e9f5318429a
	.xword	0xea3db86941fdba8e
	.xword	0x09aad8616fcfb909
	.xword	0x9fe1f7b6918f9117
	.xword	0x0786b5af8f59a22f
	.xword	0xe65a08dbcfd8e374
	.xword	0x5d2a57f0c86b3415
	.xword	0x7281a9933d92386b
	.xword	0x709e0be346a07985
	.xword	0x777f930bc392ca4e
	.xword	0xa475ce5ad949b3bf
	.xword	0x541fa1e7265a5fea
	.xword	0x7159df07cab7a631
	.xword	0xc33b8686c444a747
	.xword	0x310c5baf970efe60
	.xword	0xfbb11b346c1c987f
	.xword	0x9e9d5ce473108055
	.xword	0x83572053d99efbdc
	.xword	0x0455879df5508892
	.xword	0x668edef0f90c60eb
	.xword	0xb9250aaa808ff34e
	.xword	0x70009ac4a2ad3360
	.xword	0xa98c2af925fdc078
	.xword	0x2d98ee6ad28f08d2
	.xword	0xe1b337f58a045158
	.xword	0x99bad7c8c67528fc
	.xword	0x6333edeabcd81301
	.xword	0x5ff890148101dec9
	.xword	0x43665de7f245dd4b
	.xword	0x2babceaf4c2d8bb3
	.xword	0xa80eb1bf08eafae8
	.xword	0x5818e4305949118f
	.xword	0x056a0ffee0a3d0d8
	.xword	0x3c63a4f3097def3f
	.xword	0x11a8e85df60fd30e
	.xword	0x754d1aa942df8b3c
	.xword	0xd4a711c22cccc59a
	.xword	0x230db40913e02cfc
	.xword	0xc23a1a70056509c2
	.xword	0x1918c25b7d4b26c1
	.xword	0x09724dfb6e715f5c
	.xword	0x3a7e3ad6ad12163d
	.xword	0xb6df9df18f4e5981
	.xword	0x07ace6409380a555
	.xword	0x0cdff25c920a2545
	.xword	0x777a1e6ca7aa655c
	.xword	0xda121f7d31055d71
	.xword	0xa9e6ce53cb2d7895
	.xword	0x4493d316f3d12118
	.xword	0x8c092543b3b0d735
	.xword	0x1c3235bdc43d9bbe
	.xword	0x89e1945f604bee98
	.xword	0x6794423ed69e1fa9
	.xword	0x74515412b9ccd305
	.xword	0x506fe02bb3bdc394
	.xword	0x1c568875652b21e6
	.xword	0xa91e64f3f03efa03
	.xword	0x98bcb07b206e7a45
	.xword	0x90232593b5f5b00a
	.xword	0xa7ca90975384feb0
	.xword	0xece86422a11b3877
	.xword	0x66fa3177ba11ebed
	.xword	0xb791f2ad0217a200
	.xword	0x21f2f2cfeae4966d
	.xword	0x7ef8692dc68770ec
	.xword	0xbda18b22ae254a0e
	.xword	0x14986f5b640e8c8e
	.xword	0x96428590531cd592
	.xword	0xc638b3feb953232c
	.xword	0xf7299aa2cf300121
	.xword	0xde05c3a143b80915
	.xword	0x6aa61abdadb76be3
	.xword	0x06fd7da6999f59eb
	.xword	0x618a15475349f5e5
	.xword	0x639d3137d9f9602f
	.xword	0x9bfd2ef38e7ad192
	.xword	0x9abf7f015e449a75
	.xword	0x18b3cf9d6eb8e024
	.xword	0x7430a33902135cd2
	.xword	0x3eb43692ec66fa26
	.xword	0x5171786a8ecd2b2a
	.xword	0x13816e522556d33d
	.xword	0xc97fff34bcfe4fdb
	.xword	0xe1231af4828fe458
	.xword	0x855c06f9665d106a
	.xword	0x278fdf26a146e6c7
	.xword	0x7ae1a5bea05370d9
	.xword	0x25e18235c4f72375
	.xword	0xe70ec0b676987208
	.xword	0x4a759afbbb767ca3
	.xword	0x72ade4e4e08b640f
	.xword	0xc61c7b93a32c5401
	.xword	0x53cb6addf971d128
	.xword	0xd8c804945ab45b07
	.xword	0x43545d08c0f4a56f
	.xword	0xcb4c05683877b174
	.xword	0x3355f4273b3b9b61
	.xword	0x8ee65dc2e74efbe9
	.xword	0xe119499887cf2f5c
	.xword	0x98c1ce657612165c
	.xword	0xd24be7eb93fd4338
	.xword	0xc8222bc395d4bcb2
	.xword	0x3475e59e7520cdf5
	.xword	0xa4ba288f68d6572d
	.xword	0x61aa1bc997e8d3d9
	.xword	0xec238f86fb6103cf
	.xword	0x49eaf7c968948a74
	.xword	0x185808003be1e492
	.xword	0x91f14e2c40de0e40
	.xword	0xb53dcd687bd0004a
	.xword	0x91e07bc2defdfa9d
	.xword	0x6f424b1741b0fc9d
	.xword	0x6882b7558aaf6396
	.xword	0xc361c88db259cb6c
	.xword	0x289c273870b71831
	.xword	0x0838cab0065edf81
	.xword	0xfff923983ef7e99c
	.xword	0x4c87c10868535fb9
	.xword	0xcd0c77c015b6584d
	.xword	0x990459ef0231909a
	.xword	0x7b9c9406176f0f25
	.xword	0xcb17a46132baa47b
	.xword	0x7b9fd0784cba3173
	.xword	0x957193aef9ee67bc
	.xword	0xaba77be3f9f8d0b5
	.xword	0x66bd830bea80289a
	.xword	0x9fd3a93d97a582a1
	.xword	0x28a5fe8c0935d114
	.xword	0x53c261d861fd586d
	.xword	0x414d70c1b7c5041f
	.xword	0x049fa8b5a3c25306
	.xword	0xfffcc7f1f3797922
	.xword	0xabd47819b0b611d2
	.xword	0x24108a6ea696432a
	.xword	0x6ec3e562cc5b200a
	.xword	0xb0b11ed81514f232
	.xword	0x8297a87a34916004
	.xword	0x59882552bc79ffd0
	.xword	0xc9832773aced4adf
	.xword	0xb071ee9d476f7151
	.xword	0xd2f2562839e11dc6
	.xword	0x9ee2aeffc2ed2e00
	.xword	0x7a8ee3c0038c7c79
	.xword	0xbb1f1a03ed049a57
	.xword	0xdd0554139c165fcc
	.xword	0x430da5cda9bb651d
	.xword	0x018616e6e069e4fe
	.xword	0x6da15ed6e37c51b3
	.xword	0x9630c1406ecdb245
	.xword	0x47a57050b5fcf032
	.xword	0xb124a34ce5056d63
	.xword	0x39d21e1397ec0290
	.xword	0x0acea0515777be75
	.xword	0x248aa4b06a73964e
	.xword	0x9615a3e2924f9ab3
	.xword	0x2c02d0d304732ee1
	.xword	0xbb431798e7cae5aa
	.xword	0x1594713b5a81bb6b
	.xword	0xc56a55b9eaa54392
	.xword	0x40f5619e015ec608
	.xword	0x499c8e243040f2e2
	.xword	0x806f97a9316f08d0
	.xword	0xccb2714ba1138c96
	.xword	0xd2d4b2652b0b0a77
	.xword	0x5100adb44a3c7435
	.xword	0xd1360d6b91fee972
	.xword	0x6d3d7f1e1991ec06
	.xword	0x3e02b7c1e1ea2c4f
	.xword	0x75a0b6c56f6bc8ce
	.xword	0x64c73051bae490d2
	.xword	0x714992d19a3587ba
	.xword	0x2fe80274215e328c
	.xword	0xc140c260cf45ca0a
	.xword	0xa2470dd9baa0fe26
	.xword	0xab40d64083a225cc
	.xword	0xd60a9beed305c8ba
	.xword	0x22db86c7e92ec71e
	.xword	0x7aa36f31da00260e
	.xword	0x319e6ff980e17a53
	.xword	0x0ae411969a25c747
	.xword	0x40093160a4ce262d
	.xword	0x009b09e0b2a1e830
	.xword	0x8e18509416a0c48e
	.xword	0xdfa94b8175e48863
	.xword	0x685b8e784270b7ef
	.xword	0xbee3e131a67d0a0d
	.xword	0x73e5b15ba6179782
	.xword	0x9b81a81b7977dc47
	.xword	0x329e3e063550b41e
	.xword	0xa8f6f04b989ef304
	.xword	0x6a30276aa01ea975
	.xword	0xed4adf0bb8ccf91b
	.xword	0x5cbf30c110223122
	.xword	0xa28dae3f53fadfd5
	.xword	0xc22cdfc42bef3eda
	.xword	0xaf91264c7c4898d8
	.xword	0xdccc8d41ab1c63a0
	.xword	0xe34cce319ed8f2b5
	.xword	0x3060b377d1f11c3e
	.xword	0x01b494289404dd7b
	.xword	0x80821f2a9b74b382
	.xword	0xedc634aae6e9605e
	.xword	0xe928b570e70fd291
	.xword	0x21e54ba48ec5c1e8
	.xword	0x08f96c1a95e6d2ae
	.xword	0xed02f270ca184e94
	.xword	0x2eb8d8d5cb4a23ec
	.xword	0xa0af55bac960e70f
	.xword	0x645464407e91df91
	.xword	0x511e8b41f4641a5b
	.xword	0x29250c5a356d4ebb
	.xword	0x70df766e022dc7d6
	.xword	0x1504692fc1812b60
	.xword	0xc84f062b4f73b4fa
	.xword	0x4d55d70e8cbffdd8
	.xword	0x8600030f5f9f098d
	.xword	0x1c15403ea9cafe3c
	.xword	0xadde6cc808ca9970



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
	.xword	0x393c06ec08f83ac6
	.xword	0x7d0da8da3388fc0e
	.xword	0x7f723bc5d664dc52
	.xword	0x1965671dcf09d32c
	.xword	0x6d17721bcbb3c08a
	.xword	0x2127e197b5d5c17f
	.xword	0xeca37406c5409665
	.xword	0x9acaee5813f29f4a
	.xword	0xea1e6fda9c563071
	.xword	0xf444110a9f43af1a
	.xword	0x816bd1c32585c0a9
	.xword	0x94f947ed9b6a15fa
	.xword	0x6181660ace10c0bf
	.xword	0x5b524d0a1e21b28e
	.xword	0x68633c6da4b11f99
	.xword	0x2d0b6f135c773c3f
	.xword	0x35a3f2086b22949d
	.xword	0x5a9aa0ec0a7c5383
	.xword	0xa4371434f2f40aff
	.xword	0xb77717d037d327fc
	.xword	0xebedb1da467cdbee
	.xword	0x744a2aa53e7a9a54
	.xword	0x6a4fb1e6a51be2e5
	.xword	0xd7351435c0892c62
	.xword	0xfd828b5c7f730170
	.xword	0xc4b36c6c8ffa137d
	.xword	0xa7bc3c047b60a98d
	.xword	0x0f697988ec8ad2b8
	.xword	0x2a26fa9b5a0f401b
	.xword	0x19a1a5300bee0716
	.xword	0xb7cbe385e7a295ce
	.xword	0xbd0c66433cbdd33a
	.xword	0xcbda582d11311655
	.xword	0x8d213965e7b4933d
	.xword	0x72ddb7d865a0678f
	.xword	0x455bd65b8cfce34a
	.xword	0xe034ae347cb6a2a9
	.xword	0x814ae1db64bfb7a6
	.xword	0xa6c444c8386c6a21
	.xword	0x893c39ed0e313943
	.xword	0xfd3ebaebddec1b5d
	.xword	0x76bf68b470c9cad4
	.xword	0xf84ca23abf58df2f
	.xword	0xd6e3740e0a87ebf7
	.xword	0x223dc0a18011d52c
	.xword	0x29850a1ada38b673
	.xword	0x6a683a2ec2a920bd
	.xword	0x09b0cdc69c5fd343
	.xword	0xb12575b5f1d95d1f
	.xword	0xc25b684a07aaf6bc
	.xword	0x3cea39a04b30249a
	.xword	0x043483b9f1302c91
	.xword	0xe934694908b4f483
	.xword	0xac652ac2015d09af
	.xword	0x9c96d4d0c702d449
	.xword	0xbcd061f24d57a28a
	.xword	0xbf60b87f200e9e02
	.xword	0x70cd500ea6af7465
	.xword	0x92305b1c44df821e
	.xword	0x3f77dcdea67bcd6f
	.xword	0xf543310c71e8c227
	.xword	0x381219bda5f4ef21
	.xword	0xf385dea1a73f515a
	.xword	0x7d859c95f0fb4927
	.xword	0x9949a12d4a084509
	.xword	0x91d1737767b868d7
	.xword	0x38abcdf6dc2bf26f
	.xword	0x70c9ca78e6a94766
	.xword	0xd7a593e16aad5fbc
	.xword	0x35c8c6889f748423
	.xword	0x87391e1188907854
	.xword	0x0418860496bfbcbd
	.xword	0x2924c6b784cd8c24
	.xword	0xcba9e2b9e139d86e
	.xword	0xe6d8687e600d2432
	.xword	0xb9d2e116c27be7b2
	.xword	0x79d69ff5e877f4ec
	.xword	0x238514d2714f2222
	.xword	0xcff66c24247a6aa6
	.xword	0x9e6d2b65dcf8e114
	.xword	0xa7d006365151fbc1
	.xword	0xa5091bfddf28d3b5
	.xword	0x7ebf6e65ac8e1a4c
	.xword	0xd1a6e35365db46de
	.xword	0xee630662e562ef42
	.xword	0xe7d8e8399e368d2d
	.xword	0x9f2ef8a3d1603e49
	.xword	0x5e907f6e6c0fecc0
	.xword	0xa3fd807b5924ca29
	.xword	0x18e9f33b828c1852
	.xword	0xd8a96d32cde97bb6
	.xword	0x9a8df7c01366de1f
	.xword	0x5f3b322c7af47540
	.xword	0xb9dbe64ff4188e19
	.xword	0x1c9ce0bc64c119ac
	.xword	0xe57ef1c74f136858
	.xword	0xaaefd9f98f8cabd4
	.xword	0xd6bab156531028b2
	.xword	0xbe746bb1201bc56e
	.xword	0xe11885bc54229926
	.xword	0x5911aa458272ce57
	.xword	0xbcef614a33b035da
	.xword	0x3e7a1ce23a5f13ac
	.xword	0x71fe253e72ba70d2
	.xword	0x9a5aacb9ccf54584
	.xword	0xf00cb44dfd95bf76
	.xword	0xa524f5e5e3b6cb05
	.xword	0xce1a068dfc937ae5
	.xword	0x9675d5b0b88ce028
	.xword	0x749ceca7cdf3bb1d
	.xword	0xc7f8d7bd86317563
	.xword	0x6f3efa2c57d743e4
	.xword	0xc0df6eabcbeab07d
	.xword	0xce971976e4a7f7df
	.xword	0x6b6265031bee55a2
	.xword	0xfbc8e75d349699db
	.xword	0x9bcfa5f8c2f501c0
	.xword	0x8aa514bc5148c877
	.xword	0x1a3be2a9f855cedd
	.xword	0xeafe6d041459ba41
	.xword	0x5a5ba7afa153a200
	.xword	0x8415d8adc94b1edf
	.xword	0x6c127b4a9ced8a6a
	.xword	0x1d05092b9487ef47
	.xword	0xcafe74bcf41695bb
	.xword	0x28ac87475d711140
	.xword	0x70b1964169d29d3c
	.xword	0x69a8265774ad31e5
	.xword	0xf529b8ef106d9228
	.xword	0x539bdc96375298c8
	.xword	0xb625ce191d540208
	.xword	0xd0786ef3686f391a
	.xword	0xc45b2ee9973d52fe
	.xword	0x8abe0259fc176dec
	.xword	0x06b7c4f0d3fd67a3
	.xword	0xa9b917c26f09ffca
	.xword	0x75f5ed7d8a41ad88
	.xword	0x46c65e8648d0521f
	.xword	0x5436dc94661e15b0
	.xword	0xa64580a1ec83dce4
	.xword	0x42c2cfb81e5b7d4b
	.xword	0x2af72b2a970d29b0
	.xword	0x48c18f3aa1fcd7af
	.xword	0x9235829264d2b720
	.xword	0x90e126f2267abd7e
	.xword	0x56411aa1c21fab91
	.xword	0x2136e3701a2ed498
	.xword	0xe1f8a79b6af82aa0
	.xword	0xcf3fe6ad965c79eb
	.xword	0xcc1d1c5c2172a37c
	.xword	0x77cd3f7284330a10
	.xword	0x171ed01ac8b4ba8a
	.xword	0xb5846d24ce3d01af
	.xword	0x515f9058f952fb84
	.xword	0x1c583a176e65b624
	.xword	0xd432c63d1469a793
	.xword	0xec9cfe654d3f6abb
	.xword	0x5252a8dfc75f3c5e
	.xword	0xe5aaa066d8c40acf
	.xword	0xd575f35e6b48ec74
	.xword	0xb2b3688e276eacfe
	.xword	0xf2dbb8b9e515be1b
	.xword	0x108d17549efcb1cb
	.xword	0x11afd50bc18cd501
	.xword	0x67c8f97db1591dfe
	.xword	0x480dd1f2c5452b45
	.xword	0xb8154d318810ab78
	.xword	0xeb1411b600f3909e
	.xword	0x2634c853806dd535
	.xword	0x0cfa9c38e8a1fc28
	.xword	0xc618af01c5cfcebd
	.xword	0x8ada23822b2d3b8f
	.xword	0x7044a3fec7a2fa88
	.xword	0xa1687cb2c60af5c7
	.xword	0x8feb2e87adda1143
	.xword	0x255292436220e852
	.xword	0x2e66029aa5b43507
	.xword	0x5f8222721d8d0d6c
	.xword	0x87589a55b8855ffe
	.xword	0x35d6feab76892814
	.xword	0xda0f8d584244a152
	.xword	0x8c4d9eb770047ad0
	.xword	0xb0765f4db7c186a4
	.xword	0xf3bf6e350f753351
	.xword	0x6ea846c82d371f37
	.xword	0x21a06c474628f607
	.xword	0x084f609921e01865
	.xword	0x51d4b375914ff222
	.xword	0x817b9733813a46bc
	.xword	0xf3d8f90595f99a12
	.xword	0x8b0d78aa24cc9b38
	.xword	0xa9015e23bc75cbb2
	.xword	0x27ca6aeb9f67894d
	.xword	0xbd1bc45af369a610
	.xword	0xecd1c9d0290b3ad7
	.xword	0xcfcb893bb9eb53b9
	.xword	0xc9196f44861e673e
	.xword	0x5998b7f7954afc97
	.xword	0x9550a8290cba4eac
	.xword	0xd3e5e708a738df93
	.xword	0x3d35a02cb356de83
	.xword	0xf94b0814cc4e4dc4
	.xword	0xcdfb5c2b83786b17
	.xword	0xcf3bd7023a801e1a
	.xword	0x5e135acc1173bce4
	.xword	0xda589b25472fe06d
	.xword	0xadbf543a704d096b
	.xword	0x8c3d5c7f0d886e83
	.xword	0x1b270b71505d7f45
	.xword	0x9241ec9ab7050e8a
	.xword	0xc8cd8f290e8ef015
	.xword	0x4d3da8a8490e55ab
	.xword	0x81e91f7f5bc91737
	.xword	0x0945de82a04a6394
	.xword	0x3d95a52addeacdac
	.xword	0xd3574df676bfbbb5
	.xword	0xca6d0959ac75d82e
	.xword	0xaa6099819bcf343f
	.xword	0xae06328df667990d
	.xword	0x6ef96854ef2eb47d
	.xword	0xa5faaba753786f5f
	.xword	0x9e65fd08a6b9404f
	.xword	0x8b504f56f6f69de0
	.xword	0x4cdf293b8ec7a2a7
	.xword	0xe5d5eb68b6f63d48
	.xword	0x6aa014cf244c4625
	.xword	0x884e56c915524ee8
	.xword	0x5ed6fda1538f63a0
	.xword	0xae48723b6324aa48
	.xword	0x922f21dda239e665
	.xword	0x08cc3c4103d09120
	.xword	0xea31ecc096123823
	.xword	0x60c494c47a35c9a2
	.xword	0xdf74309267cb0ee0
	.xword	0xe469b04f7dfbe632
	.xword	0xec69db7cab7e8219
	.xword	0xaedd3d8273e36ae5
	.xword	0x28e24b9c359aba5e
	.xword	0x08909f62d35d4236
	.xword	0x94453b973b4f162b
	.xword	0x845ee8f06843be19
	.xword	0x29913183524c9a04
	.xword	0x14303ba24c076284
	.xword	0xbd25be550c359116
	.xword	0x7dca6415b879f12e
	.xword	0x633dca12981ae0ca
	.xword	0x91560e613e77dd0d
	.xword	0x8e8aa0bfa0a0a708
	.xword	0x80dc1f481495d071
	.xword	0x78edf8503a48b0d8
	.xword	0x86c3758cddb3d5db
	.xword	0x4e70293993280064
	.xword	0x7c6feb32eaa174a4
	.xword	0x013380fedecfa88f
	.xword	0xa2e6d7202d781e1b
	.xword	0x9f6e0de3fb28b2a0



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
	.xword	0x0c7614a42174537f
	.xword	0x8e11762399e14f69
	.xword	0xce1ee0b79a4db9f3
	.xword	0x045f204035e6f092
	.xword	0xa3e948c9b002169a
	.xword	0xd80c65a8fc5baec5
	.xword	0xbd715a1cfb4d9448
	.xword	0xe3e07ac8b1d847a1
	.xword	0xe0bfafbecd9d8c19
	.xword	0x88d15b80f1c0ab26
	.xword	0xc1a657d61e124c67
	.xword	0xa499de911243b4d2
	.xword	0x8af7395e8a6638d7
	.xword	0xc64b212def70b10f
	.xword	0xba33b664ef0124e9
	.xword	0x47144af6a69f8378
	.xword	0x7e39cfe900e956ca
	.xword	0xe5945a2c95b9774b
	.xword	0x2b39f6c66536d709
	.xword	0x8dafdb8d4d5ba045
	.xword	0x02bee99b4f0413bc
	.xword	0x75fd38a6bcfdaea1
	.xword	0x9a631db732fd5ce7
	.xword	0x273fe5ed42162cb9
	.xword	0x322b5c0d08a2b898
	.xword	0x5fbd9dff0f7d14b6
	.xword	0x437d445188f12b7f
	.xword	0xbafa3877516c14c3
	.xword	0xa16b45497a1838ff
	.xword	0x3ad48f71777a8eb9
	.xword	0xe64e42b6f44ef24b
	.xword	0x78d627da555f5235
	.xword	0x332d83a4262924be
	.xword	0xb5ebfe35a8114dff
	.xword	0x2c083fd9eb7b0116
	.xword	0x431349b7ec86b98e
	.xword	0xa73fd257a37fa2cd
	.xword	0x81eaaa739adeecfb
	.xword	0x1d82ea2a540c21c7
	.xword	0xa2f53ab653b19802
	.xword	0x69cc6c4fec91e609
	.xword	0x6a616ad217ce6fe8
	.xword	0x5c605a18f2bf0a37
	.xword	0x396649103303301d
	.xword	0x429e390bfd38690a
	.xword	0xd9fe7fb861ee377d
	.xword	0xad9df6d61c3dd055
	.xword	0x2d9a7bf453a6a131
	.xword	0x2f57947c69ca3030
	.xword	0x99ce8a98e4ae8a53
	.xword	0x3838713a87186e67
	.xword	0x744b16cd03f18ee7
	.xword	0x9d97fcf460a61783
	.xword	0x34dc5b39f852259e
	.xword	0x192aabff8f2e91b2
	.xword	0xbf234a0068e712e4
	.xword	0x3ee9155587b21929
	.xword	0x6a2728be22f94a36
	.xword	0x579490997b24fc5b
	.xword	0xdbc99022852ee627
	.xword	0xfe981dfb32923afc
	.xword	0x75d205e3a3c357c8
	.xword	0xe093ed5af1d75bab
	.xword	0x6a8d3e3b882d49a6
	.xword	0x89795e6b46a5516c
	.xword	0xa1e597cfbf43ab57
	.xword	0x72dfa3fe03d2f058
	.xword	0xfacaedd7a8a924b6
	.xword	0xb49aae2fbddbee0d
	.xword	0xd83029ff83a90dcf
	.xword	0x0c3f1d5c87043746
	.xword	0x510a5b09ce072d3b
	.xword	0x108693a904912517
	.xword	0x8e12f724d353c93a
	.xword	0x6b840dcfd726a97f
	.xword	0xacec9d2476ef8f03
	.xword	0x3c965b612d39d98b
	.xword	0x300f859839fe5cb6
	.xword	0x5e8886730e82902c
	.xword	0xb0cb18552b55b0fb
	.xword	0x0edd00ffd9f762eb
	.xword	0x7eca52aa1a1c0509
	.xword	0x9021bd0ac4575e5b
	.xword	0xc6eb14da03eff418
	.xword	0xdbe148da5c4130bb
	.xword	0xc2359a72fbbb2f2e
	.xword	0xcea3f78b23ca680c
	.xword	0x96ad159b13dacefc
	.xword	0xf263ea161af94289
	.xword	0x2e72db61ed86feda
	.xword	0x2e7607605a1b6b0a
	.xword	0xfb04305353f2a9b9
	.xword	0xbe01ac4fd4e69017
	.xword	0x55786aa474b8fbab
	.xword	0xa66feea4b83f710f
	.xword	0xc46e15b2d458f6a9
	.xword	0xee9310f1f03b8d5c
	.xword	0x0d41014d5fb3e11f
	.xword	0x37aa25316cf80b50
	.xword	0x00acaa4d25f78078
	.xword	0x30ffafa0ca439dab
	.xword	0xfcfe08263044be5e
	.xword	0xcfa97d72eb574d81
	.xword	0x7b148db6bd5488ee
	.xword	0x196e9a32fffddc90
	.xword	0x71731c3bfc2d4636
	.xword	0xee074bf9e86433c8
	.xword	0x1b04537f7875a04c
	.xword	0xe9d511b6020dc957
	.xword	0xe4b6864995389769
	.xword	0x33a41873e8ed2001
	.xword	0xc4e5a968e021ae82
	.xword	0x5720068b760a31a2
	.xword	0x5e0c1f18a86cfc9d
	.xword	0x547b1599f7ecadfd
	.xword	0xca54d2e7681dbede
	.xword	0x6df3316ee81a1a42
	.xword	0xcddfa472ca4a32cd
	.xword	0x7f7d9a2880ad922f
	.xword	0x57841ca17d1526fa
	.xword	0x952324661be58024
	.xword	0x660b044027648ccd
	.xword	0xfb9909f22149ef9a
	.xword	0x7365179bef040419
	.xword	0x01492a737931d9d9
	.xword	0xff7393a2e4b061dd
	.xword	0xbe463ae4023954e7
	.xword	0x9a62e28f77f016b3
	.xword	0x06b74ff7811b8d11
	.xword	0x26bcb9452afe6125
	.xword	0x9978cb9f8a500b0d
	.xword	0x435c348f02e98317
	.xword	0x72e8d87245976908
	.xword	0xbbf7d2a34a78db68
	.xword	0xdb4b405fbb13a04c
	.xword	0x5adebec205eb992f
	.xword	0x644a7082b04c1c37
	.xword	0xdf185f87284f17d6
	.xword	0x9ab972f2ccfc61ae
	.xword	0xf9f12f13c2d446c3
	.xword	0x93287d5b8003f37b
	.xword	0xaad6e4b43f0a55cb
	.xword	0x02baa8a3976c5229
	.xword	0xffa5b17724d839f9
	.xword	0x0e7e9d7305749335
	.xword	0x10394d0f1d15b6dd
	.xword	0xee0f2a764def0659
	.xword	0xd9ed4bc2f490a1b0
	.xword	0xcedc5f43812eed12
	.xword	0x4e7d321bf924570e
	.xword	0xeab145a170272d46
	.xword	0x7e44d7c8057165b5
	.xword	0x57169ee27bf93e43
	.xword	0xb716758242cd5cdd
	.xword	0x2aa319638176370e
	.xword	0x5a9710adb52e07af
	.xword	0x6b5f6c0f72d86dea
	.xword	0x11f3ad3f005e02df
	.xword	0x897c435627aafc20
	.xword	0x6e333d20be963427
	.xword	0xb37b5f95c497e56d
	.xword	0xc37582050525c8a8
	.xword	0x9d7f85635cc8f7af
	.xword	0xb6c7f19803234700
	.xword	0x12d7ee7e05e8f3cf
	.xword	0x4e4d1c1fdac40450
	.xword	0x36f545cc43b2f157
	.xword	0xcf3a4257665930d5
	.xword	0x543071d5b37b8b4c
	.xword	0x4f0c826b810f9122
	.xword	0x0a6563f312696bd9
	.xword	0xdcd158e00e06fe23
	.xword	0x475d9b1d37715104
	.xword	0xe58ff4d8a9c14294
	.xword	0x200cd20c60d679da
	.xword	0x123e705ada0b29a8
	.xword	0x29b6939f4531d6ec
	.xword	0x10446adcbe8dbe6d
	.xword	0xde1b3d40ac388de8
	.xword	0xc1fc59147b340400
	.xword	0x56a67d47c372de9b
	.xword	0xc254a9846d3df442
	.xword	0x4ba2eb4a159076d5
	.xword	0xd00c336f7a1d5742
	.xword	0x1e4df846af01a2dc
	.xword	0x1b965f42f02e5439
	.xword	0x5c9ef9fcb75537a6
	.xword	0x626a5c7c6decc082
	.xword	0x901d387036e76afa
	.xword	0x07f9153b71ff6b9e
	.xword	0xc23056759c6fbbe9
	.xword	0x1da1e0167deb2651
	.xword	0xba885372d66752f9
	.xword	0xbcf9caa2412052d8
	.xword	0x275028160622073b
	.xword	0x04fbcac4db288a32
	.xword	0x964b3470d107b532
	.xword	0xc39ffb213257b6c9
	.xword	0xa7fc92e346ee770f
	.xword	0x1bfb85eaf1eda4a5
	.xword	0xec27a672c871343b
	.xword	0xcea8d0480340c848
	.xword	0xed44b69bb5a4d0d5
	.xword	0xe8398aa8cda35b5e
	.xword	0x5417b164fc56c307
	.xword	0xf8c53b7fd8527e32
	.xword	0xbb91b74a1afaf0fd
	.xword	0xf8ea7c900c64ab6c
	.xword	0xf68eb527de6439c6
	.xword	0xbc60589d7126e034
	.xword	0x45678b90afff93f8
	.xword	0x709b8eaa2391d331
	.xword	0x8c05485b756c6433
	.xword	0xf410adb7f5813af1
	.xword	0x021bea55bbef49db
	.xword	0x40fdb32e04d6c2ec
	.xword	0xc305a9c7122f90cc
	.xword	0x55a2285497caa99b
	.xword	0x041017f5f305e04e
	.xword	0xa0f9e6036bcecb11
	.xword	0x65eb51b3d9345c6b
	.xword	0xb828f01e764b8ad4
	.xword	0x2143d3b528f2df30
	.xword	0xc06a44f2edd19b8d
	.xword	0x70ec6b42578bad40
	.xword	0x772890599e01e5e8
	.xword	0x8ade48b6495f44b2
	.xword	0xae16ff27a64d4af7
	.xword	0x5314f9020b497566
	.xword	0x60e3414b8632e7db
	.xword	0x01c2f0b8e5ccc005
	.xword	0x1ba630099d4ee08e
	.xword	0x31b785ae5766dcbf
	.xword	0x875f47997b669669
	.xword	0x852de65e5672014a
	.xword	0xfb987bf13fd5de8c
	.xword	0x30fcbc49ef351f76
	.xword	0x4c3fe49cf4fa5452
	.xword	0xb483804646a24f05
	.xword	0x27550fb80e8c4d63
	.xword	0x87ac6b8255b15faa
	.xword	0x418023ac9859da82
	.xword	0xd3b5e7bb60820339
	.xword	0x55aa1ecfdc408ae3
	.xword	0xef0d112b64bfcad3
	.xword	0x98dfd5389a0d86f7
	.xword	0x42a2c56cc023ff53
	.xword	0x428777c52a5c2e14
	.xword	0xd38353004d18656d
	.xword	0x646f6797c75adb43
	.xword	0xc0278588edbea99a
	.xword	0xf7ab632897464b7d
	.xword	0xf71019b0bb03883c
	.xword	0xa625c352b78f4baf
	.xword	0x47f07c7bbe9ed756
	.xword	0xc98200dcd13a6b4d



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
	.xword	0xbd77cdaceff889ed
	.xword	0x4ced07e0b81f663b
	.xword	0x3ca56e4af1dca04e
	.xword	0xf4087a8fbbc587bf
	.xword	0x640b197ba7fe4916
	.xword	0xbdb9382f84f47b6c
	.xword	0xf742694ebb93bbc1
	.xword	0x6cfd945ef52cefc1
	.xword	0xe01dcdd771d8974c
	.xword	0x121ea2b5b670433b
	.xword	0xa1b73159e79533f2
	.xword	0xbba233bc68a51118
	.xword	0xbbf9372d2e4d9ad3
	.xword	0xcd16e45fa6adffab
	.xword	0xc7ed2be19804618b
	.xword	0xbc68b16519809326
	.xword	0x7d3cf97ccf0069a8
	.xword	0x4d8ff1cd78cf0059
	.xword	0x85e77e97fbc08797
	.xword	0xfd3e78881a3ff31f
	.xword	0x076b6dccc554a11d
	.xword	0x1d17e53379aca52e
	.xword	0x987514c6355490c3
	.xword	0x41dfcf94208e4f03
	.xword	0xaa35b3dc6f8485ca
	.xword	0xd4f33125ac5f2dd0
	.xword	0x658acb1a00462eb5
	.xword	0x7d53079a63e2454c
	.xword	0x701a3ba178c3f397
	.xword	0xc998fb52290f5dc9
	.xword	0xb4a669ae07d1a4b6
	.xword	0x1cd2f6a32ca3359a
	.xword	0x59827772c344cd6f
	.xword	0x1647736cdc8df78d
	.xword	0x87196a5784182d25
	.xword	0x436a4ec29e701be5
	.xword	0x4df78d7790ee0e49
	.xword	0xda7d8cc2d500d3c1
	.xword	0xc8d6921d5f8c6b6f
	.xword	0xe405cee60d764408
	.xword	0xeb3ff675c8bca2c9
	.xword	0xfee16f3c1cf4c649
	.xword	0x0db1ce6d6f3e096e
	.xword	0x7c4d5406f353e2ed
	.xword	0xedb6b23fb6876c07
	.xword	0x1df9e7098097b99b
	.xword	0x38cb25f2cddbd4e9
	.xword	0x17f2fac7900dd992
	.xword	0xa6751a85f3963b4f
	.xword	0x8a2a1c7117d897a5
	.xword	0x2e280f08c2be8dcc
	.xword	0x91702e82f2f9d62b
	.xword	0xc776ebafbd1d83ae
	.xword	0x38f5da54eda25d12
	.xword	0x689a746a8dd2ff76
	.xword	0xcee6900d3fadd1e1
	.xword	0x3cf39e3f859adabc
	.xword	0xfe2d46e05de4ba69
	.xword	0x6b0ec954be3b942e
	.xword	0xd61d7fcb9467682f
	.xword	0xf120f630920aec1c
	.xword	0x470bb176c556caba
	.xword	0x65a86dc21b3c399f
	.xword	0xec179ac546945c5c
	.xword	0x599cb7c9345f958d
	.xword	0x6166c2ba11d40253
	.xword	0x655dafb0dee369b8
	.xword	0xfe9bf1bfb1b7bfa0
	.xword	0x557b1cda292eb6a9
	.xword	0x91c3c3d73e5fa35e
	.xword	0xe82aac5eecb692a0
	.xword	0x705e9e581262b09b
	.xword	0x27a7f80549f470b4
	.xword	0x87baa271db2e2edd
	.xword	0x50fff9497d70faea
	.xword	0xc64e42a73bfc32fb
	.xword	0x66c326aaacd50f82
	.xword	0xaf68fc4b84f6d85c
	.xword	0x577ddece628a1e0d
	.xword	0x1a3dec0bde9879bd
	.xword	0xf317eef4ad7d36bb
	.xword	0xadd17eaee52495c5
	.xword	0x5fa2d711a780d36e
	.xword	0x9b1d3ca5e0462eea
	.xword	0x9db8044b9e4f7745
	.xword	0x495dba1defe973ff
	.xword	0x11124c4d572f5709
	.xword	0xb9a5df096dd755c3
	.xword	0x3ba809e32996b116
	.xword	0x1a621a01ba70dfbc
	.xword	0x5f2f8e06e41c809d
	.xword	0x3f2f30bd549cba4f
	.xword	0x680a42b761230a03
	.xword	0x2bbb938f667f6618
	.xword	0xa93dea591a6491e2
	.xword	0x512ab080e6ec8295
	.xword	0x01007cac0b2526d5
	.xword	0xe55c809cb686cedf
	.xword	0x63f92ed3839fe885
	.xword	0x195afa9bf3d3421b
	.xword	0xff30a54a9cca40e7
	.xword	0x11105c27bfecf9f1
	.xword	0x2dce4532e301e36c
	.xword	0x83b79d02dfe17ca2
	.xword	0xb1f0464f34fa2e7c
	.xword	0xc62cc2015d7dd30b
	.xword	0x26e94576dd36e610
	.xword	0x2f3536c3b4e97785
	.xword	0x5967d567779a2889
	.xword	0x88b1600cffaa9195
	.xword	0x27e4af24246c2471
	.xword	0x46f346d8a2efd3af
	.xword	0x1f5dd2fd4724c450
	.xword	0x4ddbc7b716f81139
	.xword	0xaf7013ea9e8d4a23
	.xword	0x0ddcf05db1c07c52
	.xword	0xe3ee3a44e066b8fa
	.xword	0x8fa8a2aa3769438b
	.xword	0xa5a179151b947c08
	.xword	0xfd1626be390316bb
	.xword	0x36fe8e0499933c4f
	.xword	0x348908b19d51dad0
	.xword	0x1531a28c16592d87
	.xword	0xd0d029ae66c72eb7
	.xword	0x3e66c9f9f999e63a
	.xword	0x6b62138f43c9dfb5
	.xword	0x65bf574346311d2f
	.xword	0xa2b6665966ad2d7e
	.xword	0xff1ac1ac0cfca430
	.xword	0xc3c9c9d61affc124
	.xword	0xd99061a2b669aadd
	.xword	0xdd3cfbdf4b314129
	.xword	0xd41c8e57f1b563b9
	.xword	0x21ee33d2e7c19d04
	.xword	0x1ab8ed96a377d0e3
	.xword	0xe17722e1758e4b53
	.xword	0x3cbba30964e01fb4
	.xword	0xfa66a0556dd586c8
	.xword	0x1c6cdfb72d505342
	.xword	0x469e884267c834d5
	.xword	0x64a0df59090c6132
	.xword	0x119b61ff7c31514e
	.xword	0xef10f13d31ee30cc
	.xword	0x8b38428d6da3deaf
	.xword	0xfdb0e97041933e4f
	.xword	0x7b827850e437436c
	.xword	0xc1bd9f22ca59aba1
	.xword	0xcc9825fa1bb532fb
	.xword	0x445b9a6b22c8ff3f
	.xword	0xcca614c7d9dc6703
	.xword	0x8f35bd84ca5dceae
	.xword	0x1ff4ce0a2075d2aa
	.xword	0xfb5666a7c6626a6a
	.xword	0xcb872d0b75680d30
	.xword	0xe695e82ac9873485
	.xword	0x65a3f08a8190ee45
	.xword	0x44ac0426caa6b79b
	.xword	0xbcf6cfacf5ca9c6f
	.xword	0x01c89fe48c4a6376
	.xword	0xfa0f094746513815
	.xword	0x57c7b089e3fe444e
	.xword	0x327dec9dd6c31685
	.xword	0x73a387d141cc6414
	.xword	0x34bc779e9871d65a
	.xword	0x59b3f72ed7ef38ba
	.xword	0x0e59c97b92c7fd7c
	.xword	0x8b81666f2f5de6e0
	.xword	0xe16e0a463467bc37
	.xword	0x1914aa149dc70f3a
	.xword	0xec7f53435ecd8934
	.xword	0x8a8ef0fb61ac4b07
	.xword	0xc11ce6cacde5a66f
	.xword	0xc3f97d280d1c92a7
	.xword	0xc6a262956eb52ca1
	.xword	0xe57ed223f75a878f
	.xword	0x37a79d480d7eb4fe
	.xword	0x31b2c7ec2880a66b
	.xword	0x31f537969266f476
	.xword	0xc8bcbaf341ba6090
	.xword	0x10e0a636c8de24ed
	.xword	0x39f0b406f80b62d3
	.xword	0xe38ed04976850f6f
	.xword	0xd833661a74f1d072
	.xword	0xff43c311e7a96620
	.xword	0x6d7d29bef20e7018
	.xword	0xe17bc755864f768a
	.xword	0xc325bbede85ec052
	.xword	0x577bddb0804a7ce3
	.xword	0x48dc503159005858
	.xword	0xdf599e646efbda3f
	.xword	0xd00e15f1096e634d
	.xword	0x76f164cb481424d5
	.xword	0xbbb0370da8207759
	.xword	0xe26d3004ad98efe8
	.xword	0x41a8ac6ce727a578
	.xword	0xfb84109e43dc6db1
	.xword	0x3ce61cb868c2496f
	.xword	0x381300ffe804d423
	.xword	0x865c2478ea0e5cad
	.xword	0x6b966871b276f5df
	.xword	0x1395851322b5a9de
	.xword	0xe2541d079d419fe0
	.xword	0x89bc946f054f6b46
	.xword	0x7b54ec524d85009d
	.xword	0xb0122dcbe38e511d
	.xword	0xdea700886e002f5e
	.xword	0x506aba5f34b0c4df
	.xword	0xf29c5a155f28d322
	.xword	0x73904fa3bcf03f5f
	.xword	0x74fbce508dd5e546
	.xword	0x6dd2cb430f33bbc6
	.xword	0x933d61f4d040c0ea
	.xword	0x5731e0fc30defa51
	.xword	0x8086de93504d3d0f
	.xword	0xb447c4ec74e08358
	.xword	0xa987d8aff0d50758
	.xword	0x4c3d440af13e47dc
	.xword	0x80420fca08b4fae4
	.xword	0x36581ecb4b94447b
	.xword	0x17e178199d81d628
	.xword	0x4755d3eeb2aa6d53
	.xword	0xfe73b9f179b10c99
	.xword	0xcb293dba2a5f0d58
	.xword	0x0086ec74aa380f74
	.xword	0x544b949257f22706
	.xword	0xe9433c86929527e9
	.xword	0xfe2b69d578866841
	.xword	0xb4d52e49e27f4255
	.xword	0x0905dd864aa84ac5
	.xword	0xf9abcc51efe5e35e
	.xword	0xa03b10cfb55d69f1
	.xword	0x91221b49dff98370
	.xword	0x7b75d3e114668455
	.xword	0xe000f9f7d24b0585
	.xword	0x3468c292299b427c
	.xword	0x8e1e7dc9a4c55ae1
	.xword	0xab856d6b13b07ab4
	.xword	0xc0b4a7693404c035
	.xword	0x06382749441aaca8
	.xword	0x81808f1f8c511967
	.xword	0x4253ff9f68b2df87
	.xword	0x7cf66498f7d64ba1
	.xword	0x6f1771fca35c45cd
	.xword	0x535d266d40ae185f
	.xword	0xabeab7543a95b083
	.xword	0xfe88e83301295813
	.xword	0x44241bc963eb73bf
	.xword	0x9ecc2809f685b6c7
	.xword	0x56a10589d8f015f0
	.xword	0x9820a5e0f011739f
	.xword	0x5337f8c12d24efd3
	.xword	0xdfa8c33816dbff7e
	.xword	0x1ed640be4236bca6
	.xword	0xf8167d6c5a6d06db
	.xword	0x95f5e2d42445bc1b
	.xword	0xd84abc4510d02499



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
	.xword	0xde66ea3ceb05c698
	.xword	0x09d5062e4c73247f
	.xword	0x2c1f7fffa5a3f2c6
	.xword	0xd427c32c22b93626
	.xword	0xd520b4e9c36644be
	.xword	0x28ddc4ee0299a3f9
	.xword	0xcb85d8b56a779e4a
	.xword	0xd4a1dcbb29b5ecf1
	.xword	0x0c92b3107464d821
	.xword	0x53aadff877c58292
	.xword	0x44a4e9b6e3ebe3a5
	.xword	0x0eb1fdaa0f678d37
	.xword	0x9f392864d93f3cc2
	.xword	0xc2629c945e54af7e
	.xword	0x4d1353cdbc5c4150
	.xword	0xbd0ff6058c55159f
	.xword	0xcfa107898b5ace5e
	.xword	0x0b82cd7637919399
	.xword	0x15ec7252d4b0b6e3
	.xword	0xc8b94efb45144cb5
	.xword	0xc8774334a9f8a132
	.xword	0xd51ebccf6e92472e
	.xword	0xa7471bd4bda7c734
	.xword	0x5b5f708b3c0d17fd
	.xword	0x91af5e2eb28bbca5
	.xword	0xa9c3dca4a2b2aa2f
	.xword	0x720cb1894b7ad26e
	.xword	0x1ab9f2c65d457c5e
	.xword	0x9035ae6962a75dc6
	.xword	0x5a3233a991da80cc
	.xword	0x9555db154c9e70cb
	.xword	0xccccc1d7795d6214
	.xword	0xeac1f5c068b50f6d
	.xword	0xdc42dcd7d65e183f
	.xword	0xc6fbc08023c78518
	.xword	0xe31e952ed5ab490a
	.xword	0x9f0d7d41c4bee215
	.xword	0x195d480578bfaa3e
	.xword	0xa118214b629e710c
	.xword	0x0d2e989ff4895589
	.xword	0x8361d2a69d556191
	.xword	0x57bc552b2cb8633f
	.xword	0x13520bc799fceefe
	.xword	0x93b72ab6694f9020
	.xword	0xca376e1147ebdcb3
	.xword	0xa1d05a3d2bb64b70
	.xword	0xd4a28c43fb89f2cf
	.xword	0x362ba5409be366e1
	.xword	0x1705273ab9e8f189
	.xword	0x0438b2bb2f303551
	.xword	0x251525c17412aaff
	.xword	0xbac43db88c7220df
	.xword	0xa6a48d76b076bf53
	.xword	0x8c6ab6df3aa13a90
	.xword	0xd8f3dbbd4578257a
	.xword	0x7580e6241ad2c75a
	.xword	0xa9908a8c1d836b97
	.xword	0xf8dafce22327e42b
	.xword	0xb452c1ec6eb4e9e7
	.xword	0x6bf3de58daadd8cd
	.xword	0x0112d3a60b6f9ddd
	.xword	0x22a0ef4f0fb674eb
	.xword	0x45e5e4f71231e297
	.xword	0xb7eddf6721928927
	.xword	0x811d47736093a963
	.xword	0x44313c1570207d6f
	.xword	0x67fec80ac96527f2
	.xword	0x90d5ee3b64d9271b
	.xword	0xc94bdc82666ad6cd
	.xword	0x541ad90fe13da26b
	.xword	0x6c6b1742e583cb8f
	.xword	0xa480ff1437b38549
	.xword	0xdc6b7fb42ca05178
	.xword	0x0618f8bdb67a307b
	.xword	0x271e623291d34fb8
	.xword	0x4d19354fe451ceae
	.xword	0xa1466f0be34c47b8
	.xword	0x06d7e061ecac6bb4
	.xword	0x3565d3df855c78f2
	.xword	0x461ef5fb5f4b38d3
	.xword	0x397167a3dd947ffd
	.xword	0x75b50cffc4b4ee81
	.xword	0xa3623610e9896c3b
	.xword	0xe5502cb6677eb5e4
	.xword	0x127868832e632f60
	.xword	0xa4577a662f646589
	.xword	0x98a739a06b351229
	.xword	0xe3755f6eb934f14e
	.xword	0xd176a5238fefc658
	.xword	0xd1e25b21092e6372
	.xword	0x9d2081e6c3abb480
	.xword	0x2a9092bb35d25335
	.xword	0xe01d1a6f427c2729
	.xword	0x139ca889276879be
	.xword	0x783ec0e0126784cd
	.xword	0xf16d8edaf5a9d044
	.xword	0xf02ee32555ba3347
	.xword	0xe0f0b211c982e42b
	.xword	0xe52dd44ba40c1593
	.xword	0xfeb7a91db063b6ae
	.xword	0x58e075390d31d814
	.xword	0xe2ec1b3bf3dadd8a
	.xword	0x7d34e1d5854c8692
	.xword	0x4c2d1f1f6de237fd
	.xword	0x21bd6923aedf0023
	.xword	0x568813dffdb38ab9
	.xword	0xd411abed3861cd34
	.xword	0x0a50cb75f09ee4fa
	.xword	0xe0c720aa0393c984
	.xword	0x402df28f85ce1999
	.xword	0x1a7d8ad4ca6ba59b
	.xword	0x330348fa9bcc445d
	.xword	0x6d69f464e159e155
	.xword	0xd4aa60a847b2f7f4
	.xword	0xd432c2647bb2d53a
	.xword	0x7b8adf4461ccb566
	.xword	0x431e02ce9ead7d55
	.xword	0xf1160299660bb8f4
	.xword	0x83a4eccc920645d3
	.xword	0xb83c0c5fbeb4fa3a
	.xword	0x890e45d2cd429cfc
	.xword	0x4d0ebc4f8c16a8f8
	.xword	0xf894716eeb7344ee
	.xword	0xccb24b6954213540
	.xword	0xb41ae7d3c419d7f7
	.xword	0xd37e991ee2d81753
	.xword	0x470a029f806c2100
	.xword	0x7f333200f883df0b
	.xword	0x40c540928c338349
	.xword	0x52e828fb3c9a8a65
	.xword	0x60d9a6f64e484295
	.xword	0x7f9acf9dba8a06b6
	.xword	0x38d556d6edb1839c
	.xword	0x99cdf4bd8a435bce
	.xword	0xbb8f06cfe7373a84
	.xword	0xf44e589141dd8d77
	.xword	0x02a5376d12d8225c
	.xword	0xff3f17aef8dfdce1
	.xword	0x3d85f51b6ba168f6
	.xword	0x8c7149d2ff064dec
	.xword	0x4febf915f8d04adb
	.xword	0x430699565e12bba1
	.xword	0x641895a9abc0f2e5
	.xword	0x026485a472dae8f1
	.xword	0xb6cdae9e81f4db27
	.xword	0xd6c0e3c3cc2f1a36
	.xword	0xc4c406f535cab260
	.xword	0x6ca5b05eeca19c8c
	.xword	0x42dd2c384b347876
	.xword	0xd107a65e697a17c2
	.xword	0x67945fc39f594472
	.xword	0xf72d6e1d0dd51dc5
	.xword	0x7efdb25c2a23195c
	.xword	0x8ea10fbc8325c005
	.xword	0xc23510c62388e285
	.xword	0x80153be04dccc67b
	.xword	0xd047d68c6d3edae5
	.xword	0x0df1d6361b2ab9a1
	.xword	0xc5997f81f58f9b2b
	.xword	0x2f836c3c4a412d0f
	.xword	0x0d703ccf96c83abe
	.xword	0x68e5b1b0d615c850
	.xword	0x2452474125083776
	.xword	0x19d402bc3d668ad6
	.xword	0x81bd249e077cefed
	.xword	0x0c63ae5b6141dc0c
	.xword	0x08cb6ac28a06191d
	.xword	0x36d1ebf799ec3193
	.xword	0xdee5218ec9ef44e5
	.xword	0x55279bc4515ea3c0
	.xword	0x2a2361b6aba137d8
	.xword	0x791cec0867d50b35
	.xword	0xf2c9ef4a07489ccf
	.xword	0x1980c0b1c269e35b
	.xword	0x57ccbc425408ed13
	.xword	0x937039e78dac7ec0
	.xword	0xf88f5776b83ed520
	.xword	0x485c2dc519b9278e
	.xword	0xe7b2cf9b43e4f12f
	.xword	0xfaf87f4f3b4dfd0c
	.xword	0x2412ac4e9d069686
	.xword	0x59ac5bbd0fe6fb52
	.xword	0x83f00261c0c492ad
	.xword	0x969bf2d738bd258e
	.xword	0x0df16de18bfd039e
	.xword	0x01dbcf5b50acb35d
	.xword	0xbca345b10da2fe89
	.xword	0xfb63598e9ce3aab8
	.xword	0x0ba1ac489d54a182
	.xword	0xc2112a5bed4ec7a4
	.xword	0x5ac5de147b874f87
	.xword	0x7f0445824caa9532
	.xword	0x73b6309975293067
	.xword	0x141fe899c3ac9bc3
	.xword	0xce99909ee087d6c4
	.xword	0xf550de59d7ade33c
	.xword	0x231e004624c695f5
	.xword	0xa5bece65ed3408b5
	.xword	0x084f62de84855674
	.xword	0x3869e65db8976923
	.xword	0x1d4651eb3ca77097
	.xword	0x8aee90a8bb29aa35
	.xword	0x2e4c7aabb4c53944
	.xword	0x518801d905e7fbb8
	.xword	0x9e2546d3980a7c69
	.xword	0x65851991c4d11a97
	.xword	0x048cbd9d3afac344
	.xword	0xc5fb67f2db8bb4ad
	.xword	0x42b519c0f0f6a973
	.xword	0xe39d2ea9f256eab8
	.xword	0xda96a797e1cae737
	.xword	0x2f28d319dadfe29a
	.xword	0xf7cb0db49d7f8eea
	.xword	0x17d596f3f65946ff
	.xword	0xb6acdb8dddb25f5a
	.xword	0x25a5049fb37bac97
	.xword	0xff791ad3dc5e9263
	.xword	0x39c78a83da350835
	.xword	0x9c3fc12eb9d748c6
	.xword	0x696137b9e73ac2f0
	.xword	0xc220ab03aec4d441
	.xword	0x7f624291551fa270
	.xword	0xce4eb2c7f10c7db8
	.xword	0x648bb62a85ab242c
	.xword	0xed6403e679610fdc
	.xword	0x9f58283485a860e2
	.xword	0xf4278e0a16e501d8
	.xword	0x4ea80a2414d7b530
	.xword	0xe2ec4735316fbf14
	.xword	0x9c6083b8a7229a1a
	.xword	0x71575a9cfe9d8933
	.xword	0xaf2342f2f2a2e596
	.xword	0xab7dce65c5fe56fb
	.xword	0x06ed1fc8fed34c7a
	.xword	0xb1ab8d1e4f2f0119
	.xword	0x74e7ee0db73ca792
	.xword	0x7d5ac5ad2c3b1935
	.xword	0xb64c1b395725133a
	.xword	0x583852013eb55f61
	.xword	0x26cd4a8207e39a8a
	.xword	0xf8d5dedf243a2cb1
	.xword	0x2f073547285b7834
	.xword	0xc44d730a024d8c04
	.xword	0x203c9ed7e1daf2fb
	.xword	0xc2e4dd4acd3fdc71
	.xword	0xbc42975cefbac4d3
	.xword	0x38987207cc661533
	.xword	0x81e21915a2e141c1
	.xword	0xd4bcb7bedded31f1
	.xword	0x52672a48890b0ccc
	.xword	0xcad475658b1e0c2f
	.xword	0xf5b1b285cf21df3b
	.xword	0x7532d26577547101
	.xword	0xbca2fdcfc5cdb620
	.xword	0x4ff1d3f69d1f7bc1
	.xword	0x7fc987e1d99fa134



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
	.xword	0xef388752a9909335
	.xword	0x27a88d0ef1149b69
	.xword	0xa4d13b74a25ceea5
	.xword	0xeca4c2d8ec7c0d0b
	.xword	0x4e07afeedca42201
	.xword	0x5da5ba63251e27a2
	.xword	0xfb1c093c047f935d
	.xword	0x8803148ea3caac7a
	.xword	0x02fa89409a070b3e
	.xword	0x2607edbe9e6932ef
	.xword	0x69a9be86c6a0c257
	.xword	0xb37986ed46f7d6da
	.xword	0xfc915007a930b9b0
	.xword	0x06ecb3bb6aff58eb
	.xword	0xe963f03f802fa53f
	.xword	0x58f576f8f2cf22b8
	.xword	0x25053f21bdabfd60
	.xword	0xc62edc0ecc27aa20
	.xword	0x771d0750fc1afb06
	.xword	0x04258279cf112b80
	.xword	0x41c4443ab8ee6e2f
	.xword	0xd4146738549815e2
	.xword	0x2d0ebfe983f70b81
	.xword	0x2671e75cca791536
	.xword	0x667042a6591c5457
	.xword	0xa85fd0634a52eb0c
	.xword	0x2dad523ca9c470fa
	.xword	0x06c01cc5db50d17f
	.xword	0xbc5f7ac413ead17f
	.xword	0xb508750124fed0be
	.xword	0x4b3f532db41bb5b0
	.xword	0xb927db8d69fe87a8
	.xword	0xd81749a5b52f7cc2
	.xword	0x102e7663000ed636
	.xword	0xd853ab3c6e9efa51
	.xword	0x45a8e854e4fcec55
	.xword	0x77b13f4c290bd58d
	.xword	0xb4ed98246bb31275
	.xword	0x47498da57aae4e42
	.xword	0xd749f18ba6c8cbc8
	.xword	0xf327f3762f73872d
	.xword	0x24c1a41ee7fad080
	.xword	0x917f6f336cb50b44
	.xword	0xdcb62032ca12e208
	.xword	0xc6950a6aa411442f
	.xword	0x3865e78600a4554a
	.xword	0xa47f61f397d6a60d
	.xword	0xf12e075b477f0e38
	.xword	0x99776e9392b72a6b
	.xword	0xd9ce68d90b5101b5
	.xword	0x1107e402af6e772a
	.xword	0x8fbe7e8a5ecd57ac
	.xword	0xbd4d6c9742d04557
	.xword	0xf49e43c715924e18
	.xword	0x1e43d68d404a6ea0
	.xword	0x9b3f8a5f403cf05e
	.xword	0x0e44770d9ab5a85c
	.xword	0x7ee9f999098518d0
	.xword	0x8e22aa979f35d461
	.xword	0x205c5b5f1bfa5185
	.xword	0xdc693843509f9b94
	.xword	0xfddb2b4de0fe8aa9
	.xword	0xfab7a35a9157c5ae
	.xword	0xec2c108acb59b1a1
	.xword	0x3ede0fe9de7d63c0
	.xword	0x0c3995b2be1b38b0
	.xword	0x19a16a583d42c70f
	.xword	0x88f6443a8ed1d9b9
	.xword	0x53eead1cc3b92ca4
	.xword	0x0311dd4f310dd764
	.xword	0x68f182a0c9bc68c5
	.xword	0xe9326109477d1faa
	.xword	0xc318f2a823050e7a
	.xword	0xfbf96f04714b10c4
	.xword	0x808c001c87f48f47
	.xword	0x649973f38bc0ef03
	.xword	0xd28415e2eacffcc7
	.xword	0x8039af12f762e841
	.xword	0xc2ffb9e63c3d5581
	.xword	0xdfe7d2e3155e07c7
	.xword	0x423e252f8d3dd12c
	.xword	0x969e006b0a63b91a
	.xword	0x098217498dd0139a
	.xword	0x0fc2f3edfca23ba8
	.xword	0x46185fab18c0ba07
	.xword	0x7ce93ee4837f8cc6
	.xword	0x9f989d388927ea6e
	.xword	0xd6e41d8933692384
	.xword	0x60730623e5a4f24a
	.xword	0xe52290c5fb7fa3dd
	.xword	0xbff84941dc8a8f87
	.xword	0x9d07c7f8c31277a0
	.xword	0x6126b5de7c294704
	.xword	0xe888291eecc5ba43
	.xword	0x07be3ceaea830fe8
	.xword	0x13f9e71a81f7ae32
	.xword	0x042b187fe258338a
	.xword	0x85d2fa55fc3bcd08
	.xword	0x10f5b1b62fc45a99
	.xword	0xba8110c22e85b2e9
	.xword	0x8386e5a50c718d27
	.xword	0x320e8d41a8a4144d
	.xword	0x252deec813aaac28
	.xword	0xd5639ca7a97bc534
	.xword	0xf908efe66acaddbb
	.xword	0x5df4ee476c60fd85
	.xword	0xdfd44bac9d8182ea
	.xword	0x094a269d15b7d0a2
	.xword	0x7d597974b0462ec7
	.xword	0x1b6909fbf71a4ce7
	.xword	0xa01616316aa8e163
	.xword	0x5df249666524d686
	.xword	0x4060aab3e17dcae9
	.xword	0xc79a27ef1aa0769b
	.xword	0xc03ef0c44468180a
	.xword	0x4cbcead51abb6996
	.xword	0x8c79101de2ebb751
	.xword	0x0b54a8d660963c18
	.xword	0x4b039fbee011df5a
	.xword	0xec0552c0ed7d23ec
	.xword	0xaea83178ae0f7266
	.xword	0xb06351fc85a472d3
	.xword	0x4baca4dca218fa7a
	.xword	0x0134022ce1f2688e
	.xword	0xc270832dc35d0641
	.xword	0xbcb572e280488823
	.xword	0x1a8eb2f36bdcd07a
	.xword	0x8e8b41f3aad0f2ab
	.xword	0x3ce88e5acce7677f
	.xword	0x21a0202dcdf4edc3
	.xword	0x214eb516f1fdc7a6
	.xword	0xd271d3529a8be32b
	.xword	0x1668970c591c45b4
	.xword	0x31a6a77d929dcc81
	.xword	0x9cceb72d680c4875
	.xword	0x0911b2a1b684e0eb
	.xword	0x65688e8210d086b9
	.xword	0x37f13957eb9f4eab
	.xword	0xd79a9760dca88825
	.xword	0xecd17b75ffb3ff96
	.xword	0x8327ff1981b3c958
	.xword	0xd2c197a65111f265
	.xword	0x1b31d258846f0a49
	.xword	0xb5bea6de74ad9234
	.xword	0xe467aebaa3888e41
	.xword	0x2abf6545c757d9be
	.xword	0x175087e35601e3fe
	.xword	0xf9ef5ffa11b30363
	.xword	0xead36e8c7ea31a06
	.xword	0x75a1082d339b79e1
	.xword	0x7fbf9846357a189f
	.xword	0x6374e8b178932eb7
	.xword	0xdef3b23de06bc11c
	.xword	0xd36b51d5676b098d
	.xword	0x6d3ac535d31d578c
	.xword	0xcd3c84893f3f8e4b
	.xword	0xc6d7db291c769eee
	.xword	0x8096dadf2ba00fc0
	.xword	0x05daa3b9975a86b2
	.xword	0xa87f6497fb855e8f
	.xword	0x1b48d39d867d143e
	.xword	0xbe5ee0e378208cdc
	.xword	0x4dae0a7b6b19bb57
	.xword	0xc9158fe7d1d079f6
	.xword	0x2949ecc34b7a17e7
	.xword	0x272221f600213df2
	.xword	0x32859a728d48efa3
	.xword	0x66a6366a22e6c9be
	.xword	0x8a9f857590b245b8
	.xword	0x3d9f92bfed53b391
	.xword	0x9b0812a6c64e3ff5
	.xword	0xceb995a7ce0b86db
	.xword	0x139a26a364bd0d62
	.xword	0x4d9f98af1fe61014
	.xword	0x2fa1b1710facd662
	.xword	0x08ae1e2087fd700f
	.xword	0x4d6cd30cd8f4597e
	.xword	0x6f9a0068ec595366
	.xword	0x6361da5a4792de50
	.xword	0xf8dd48e116f93697
	.xword	0x39758ca9f3354180
	.xword	0x959bb7a5a52537d9
	.xword	0x7cfb366049630c20
	.xword	0x3112e737ab50964c
	.xword	0x78613163f361ecb8
	.xword	0x4c69f683208a679c
	.xword	0xa3ff0e653325abf7
	.xword	0xdb7fc10a1159a6a4
	.xword	0xf6b045619a222e59
	.xword	0xef89e9761d7d45d7
	.xword	0x97366ec92a683d86
	.xword	0x2fd9ba9a77527dc3
	.xword	0x21afa8b30040ae7e
	.xword	0x70c04e899fd990ad
	.xword	0x04f173a2bfe30b25
	.xword	0xd8215dcb66ac1889
	.xword	0xaa5f93e3e339478c
	.xword	0x3a0e526f93935fab
	.xword	0x4f7c21075e047e3a
	.xword	0x9e1864cb331f8cbb
	.xword	0xc92fe63fd13cbc39
	.xword	0x9e372cc1f7677a87
	.xword	0x93f3f37cf9061bd6
	.xword	0xd0ed15ea119e23e1
	.xword	0xe81ab3844faa75cd
	.xword	0xe78c5435eae478c8
	.xword	0x60b29a525ecaf583
	.xword	0xd539cfe60e1e3f1d
	.xword	0xbf549b83b8649fa7
	.xword	0x2e782a83130f589c
	.xword	0xa02433962753eb1d
	.xword	0x553e429b4ffb795f
	.xword	0x1d547150978388b9
	.xword	0x118ed5941d1747ab
	.xword	0x5735b768d8286595
	.xword	0x0976b1e1d6d48d88
	.xword	0x50a8ec73d236a7ef
	.xword	0xc32c24c8f03848f2
	.xword	0x31f5c68731825807
	.xword	0x1a238818888b049e
	.xword	0xc81540e2e4e448f0
	.xword	0x74bc17557962f5b3
	.xword	0x2a1a8bc22639682f
	.xword	0x686561d792bcf67a
	.xword	0x79193cb06101e51a
	.xword	0xbc1ed80aa423a5ab
	.xword	0x545177fe94c9b39d
	.xword	0x968d740263c4ac5f
	.xword	0xd0ade8bca64d9f85
	.xword	0xe6f55e1d1087841e
	.xword	0x840579ea1a62942c
	.xword	0xc82a6c68d508d6d7
	.xword	0x84245d4ff0422be3
	.xword	0x69e229a50c7f1b03
	.xword	0xbe8acdd1e64878d8
	.xword	0x47cb3c94a7abd313
	.xword	0x624378cf15fd175b
	.xword	0x65b6c38aff2ea0b8
	.xword	0x6fb5acc542caaf66
	.xword	0xe7b3d58666a5438a
	.xword	0xd4230a7e5f89c6c4
	.xword	0x28e7f3a1d360c4eb
	.xword	0x92fb2475b3f85d13
	.xword	0x57494e266a05e75c
	.xword	0x131b48462638f392
	.xword	0xf917a082cec8a5ec
	.xword	0x20c1e0211f0b681b
	.xword	0x414c588ccd6dcb10
	.xword	0x8f402214657833b2
	.xword	0x4c8f680f26c9fe70
	.xword	0xe0e7ab37fadf707e
	.xword	0x1c32988858c2c100
	.xword	0xbd9a717b0d8d2412
	.xword	0x522859c2211c2a8c
	.xword	0x6dd7bcaafc508c9b
	.xword	0x2652fe42088c7d52



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
	.xword	0xab021b072a637408
	.xword	0xc803d9de06853d65
	.xword	0xe6d9581c4fdcf530
	.xword	0x8333ee21abe03760
	.xword	0xfa3e09294cb16cda
	.xword	0x4810a3286c3e084c
	.xword	0x0f4aad4103acadc8
	.xword	0x4f1f9b2012184d49
	.xword	0xe553b2e9f07b4b61
	.xword	0x7606ea92821c5bda
	.xword	0x7d0db8dcc1bb1cc0
	.xword	0x93a74b6559c94efa
	.xword	0x553e3c1d60b14f3f
	.xword	0xc1d5c0de4a60e9f3
	.xword	0x881303b482cbb98a
	.xword	0x7271c6207a923b99
	.xword	0x27f2139678d7fde2
	.xword	0x7e3f3e8e0b7240fb
	.xword	0x579ad5f74dd48a6e
	.xword	0x0c916114e286c8ef
	.xword	0xc93a0b04132a36a8
	.xword	0xa663d54a4036c5d6
	.xword	0x82acba7bb87eff61
	.xword	0x37b43d3ff76be014
	.xword	0x8a575f6b07f921a9
	.xword	0xa814d4e82292225f
	.xword	0xdc6a4f0d4a84bf8b
	.xword	0xa1c52f60d98b254c
	.xword	0x789424ec3eb7937e
	.xword	0x4cc30bee26ddcb80
	.xword	0x8e149cac581a1758
	.xword	0xee691446b39dfa88
	.xword	0x1e1678eefd0e4237
	.xword	0x59c8e013149641ce
	.xword	0x88a649de6eab5ead
	.xword	0xdf6d1a01022368f4
	.xword	0x933a50656fb74441
	.xword	0xde1f86e0319a5af1
	.xword	0x6006f8aa10f53b0f
	.xword	0xf0ce43f071a78aba
	.xword	0x36a5373a1dd958ce
	.xword	0x30695bba6cef39db
	.xword	0x1988c2d411922d5f
	.xword	0x3118469f98bd3619
	.xword	0x4ca8ed240b63ca37
	.xword	0xad167b4513eee984
	.xword	0x37d3e546cecf81cb
	.xword	0xed7d17d898554e54
	.xword	0x11867e1acb2728b5
	.xword	0x2a47bbf4fcaa4ff2
	.xword	0x14e989f8b9210c24
	.xword	0x1a69cfb10982fb06
	.xword	0x23ac3d0d00c71d0c
	.xword	0xd4b73bf1df52d3df
	.xword	0xe4f138fa7b3474e2
	.xword	0x8b32791ab6374c9e
	.xword	0x7979b226611e8c8d
	.xword	0x24792fdb5769e84d
	.xword	0xe970d025d1b95bbe
	.xword	0x27ed9b1307799c23
	.xword	0x910cd31bb768e2ab
	.xword	0xe31fab434d5451b7
	.xword	0x14f79e4169eb1d5b
	.xword	0xbe5c7cdf21d28460
	.xword	0x458c778b5f28b500
	.xword	0x929f18818e3d767d
	.xword	0xdf51176d5dd72cb9
	.xword	0x5c9f942f3c1f11ff
	.xword	0x0fa33f7715aa6b26
	.xword	0xf2f9b4d21659136e
	.xword	0xb1b69ca49200907f
	.xword	0x1d598409540637a0
	.xword	0xeed110f926bb5c08
	.xword	0xef9f79e8477a8ffd
	.xword	0xada4eb0ff57bebe6
	.xword	0xca96ffae18866fca
	.xword	0x9a105893f38cf926
	.xword	0x9e7d413f12a2d4e8
	.xword	0xbc6ab28a1c332244
	.xword	0x45a63afb1c838d09
	.xword	0xb4ca7129e0cd0cc9
	.xword	0x86b946fc7c40ae39
	.xword	0xd95d432b49ab7241
	.xword	0x744ac1a6a99e174c
	.xword	0x372a8958ae788c6b
	.xword	0x8530f19858b0bba1
	.xword	0xc291ec9e622a9b52
	.xword	0x8675db5014f4745c
	.xword	0xa60cca3490a0998d
	.xword	0x872fff4468aa5611
	.xword	0xd7234aee6788459c
	.xword	0xf60330bf7d459552
	.xword	0xf4109779da60f236
	.xword	0xe7044c2c9410b853
	.xword	0xd5522ec337f14524
	.xword	0xfbee7aae9320b32a
	.xword	0xae8cf55b2bacdf09
	.xword	0xe70f5f2479cb9165
	.xword	0x858ff9345291192b
	.xword	0x94bbf58fcb1e4b6a
	.xword	0x40999536c87bc90c
	.xword	0x176c6b530d81625a
	.xword	0xbe0a927381703174
	.xword	0xcbbe6bee853a745e
	.xword	0xa2d957ca06a1df0a
	.xword	0xc1e73be8068773af
	.xword	0x2eb5ca8873cc9c61
	.xword	0x497fb0a537267a8d
	.xword	0xd1a14be5761654f9
	.xword	0x3d98b8dd3f46c657
	.xword	0x3cd2749574e09e41
	.xword	0x635a85fe13ad2826
	.xword	0x8e430624ee279fd9
	.xword	0x4bf15e3336a15aef
	.xword	0x6f3602447fef5450
	.xword	0x6c392844046e454c
	.xword	0xa368ab0064852382
	.xword	0xcdb72ee5f3de799b
	.xword	0xaeb6dc7c7afa0be2
	.xword	0xb87d8cc5affc6401
	.xword	0xf7ac272f57648122
	.xword	0xa6cc6bff71854e2f
	.xword	0xf200a6764f00c16d
	.xword	0x3b6282dd1b27db17
	.xword	0xf1a65b3ad4cef351
	.xword	0x81febfdb85c288fa
	.xword	0x25298847a07bb735
	.xword	0x4a4cceaa8b75a6d3
	.xword	0x6ac729600a6c25d1
	.xword	0x09d11c8a16be91e7
	.xword	0x4d18c0f63ff5a34c
	.xword	0x86a4fbc0e8130849
	.xword	0xd60e40275a84c9bf
	.xword	0xe73316cf7040b7ba
	.xword	0x914199ba2122fb1a
	.xword	0xd57f84ab679a6c66
	.xword	0xa5c65502b65bf35f
	.xword	0x9978d774680113b5
	.xword	0xa7efc4799c175c94
	.xword	0x01525da0f73347fe
	.xword	0x857c061d68c28acf
	.xword	0x600381ea86a81a88
	.xword	0xd07ca4561e315bf4
	.xword	0xc57000dfa370670b
	.xword	0xb2430a10dbec86ac
	.xword	0x32b28c9a1ac6a7c4
	.xword	0x11b5ae0d766e57b9
	.xword	0x4484297817035e5b
	.xword	0x36718eed5babeb13
	.xword	0x5ff39b50ee8cf67b
	.xword	0x5cd44a9fd24f1626
	.xword	0xfc35a6718ab267be
	.xword	0x00cea8faab1054d8
	.xword	0xe56dc6704e2e056e
	.xword	0xb438e122ef37d77b
	.xword	0x05cf14a02e76fac2
	.xword	0x033b4924584d5603
	.xword	0x04754fdb27508fb4
	.xword	0xd31a1737ed841676
	.xword	0xc99a2b72ef229a17
	.xword	0xc6d82f3795483000
	.xword	0x86bf910d800d7fd3
	.xword	0x46ef0a072346a556
	.xword	0xf4ce957ac37e5ee1
	.xword	0x333a7fa768008165
	.xword	0x24fa0102e44cafb9
	.xword	0xc9726973dbab582f
	.xword	0x38237ee6fce11e7c
	.xword	0x1a6dc230f977fe73
	.xword	0xda5db7236b74b09f
	.xword	0x2dba8b6f6682428f
	.xword	0x5a7e68eaf9e77745
	.xword	0x537d9bda42295f50
	.xword	0xe45de7320d4ef2c4
	.xword	0xb8f14b56dbc1459b
	.xword	0x8ea2bf4189494b07
	.xword	0x0e4dd36d5e6bedae
	.xword	0xb8533451e3c66f2b
	.xword	0xa1b78d1ef999d657
	.xword	0xac804a3f28698f28
	.xword	0xe06644b3e1f7bafc
	.xword	0xa38748547d21e9ec
	.xword	0x90a4853bbfe1c504
	.xword	0x553c1affbaeb0ab4
	.xword	0x45090d3c181c0b37
	.xword	0xfd27ed1708b6ae8c
	.xword	0xe366f7324a799432
	.xword	0x99ca2d515f362b8c
	.xword	0x9407268093b154f8
	.xword	0xa40e750743c0d2a9
	.xword	0xc50fe37fa6ea39e2
	.xword	0x9d879894d95d58b9
	.xword	0xbd5043f57e804ee4
	.xword	0x638c50bc40c017d6
	.xword	0x674ccdeec0f26dc2
	.xword	0x41f7b90ba283fa6a
	.xword	0x1256e5b968f313b2
	.xword	0x1eeb95fcb8c23b4c
	.xword	0x6047d0c52c263572
	.xword	0x04813dbaba259ad9
	.xword	0xf77f995607d08742
	.xword	0x9850c73d0e31eea6
	.xword	0xf37161c664210f51
	.xword	0x0a03b04941c734e2
	.xword	0x8bcd583e4c4aa557
	.xword	0x987074c611ebc1d3
	.xword	0x8c874f7b2798a39e
	.xword	0x69606632c0e02265
	.xword	0xb3d46ed7441845ee
	.xword	0x03f5622e3276659e
	.xword	0x9d4742b5d210b5e6
	.xword	0x8897ea8c6a09ad94
	.xword	0x04a1c036d079c925
	.xword	0x4b4b783b3ce2d53c
	.xword	0x90ad37b2b9b19532
	.xword	0xbdf557bfde15e85e
	.xword	0xaf9bdab4c6741eed
	.xword	0x1604fff185e9befb
	.xword	0x65495a6b17f005e9
	.xword	0xb57b34874193f20e
	.xword	0x505557f6158b0a82
	.xword	0x4d9ca0ac107d1d47
	.xword	0xdd2de81cbdd418a4
	.xword	0x5a84fe2e1dfe676a
	.xword	0xe5420e2ba1ed986f
	.xword	0x4cc7fb08daa6d435
	.xword	0xe5cd8f7916302c99
	.xword	0x107f384bc1c148b2
	.xword	0x01cc56a9b01a17a6
	.xword	0x296509960f089cfa
	.xword	0xee8de830c42b5e1f
	.xword	0xb0dc310a9fc4e6bf
	.xword	0xa2068618a850dd1c
	.xword	0x4ede595110444272
	.xword	0x1c9fd6a57ad30e2f
	.xword	0x1b6b658106819794
	.xword	0x53ecdbd1c55a1040
	.xword	0x73e828b82c997fd2
	.xword	0x160c179cf1971368
	.xword	0xa4f04c1172747b14
	.xword	0x2b87ee868acc5c71
	.xword	0xe7400ac8ffbafdd2
	.xword	0x975870dcee7dfdab
	.xword	0xdf60aa7f3f09f2f2
	.xword	0x37ebbfcb850c5320
	.xword	0x8be41ec98302d5c3
	.xword	0xd34f7567deb0f898
	.xword	0x78a76ea3c9472417
	.xword	0xdd353db4fbfb2f32
	.xword	0xbdee63de8f2ffd66
	.xword	0xca993348f83b2163
	.xword	0x46ca4e09ea58ea04
	.xword	0x188909058daea8fb
	.xword	0x5ac51ffc9996a18b
	.xword	0xa0632ca2a4777985
	.xword	0xb55913224dd3ec01



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
!!#   IJ_set_rvar ("diag.j", 101, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 104, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 105, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 106, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 119, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 128, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 129, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 132, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 143, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 152, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 0000,"
!!#         "20'b 0000 0000 0000 00rr r000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 163, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 173, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 183, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 193, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 203, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 213, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 224, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 232, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 240, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 241, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 242, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 243, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 246, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 247, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 251, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 252, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 255, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 257, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 258, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 259, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 261, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 263, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 264, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 266, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 267, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 268, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 269, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 271, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 272, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 275, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 276, th_M, "\tmov\t0, %%r8\n");
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
!!# 
!!#   IJ_printf ("diag.j", 309, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 310, sjm_5, "\n\nBA LABEL_0\n");
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 314,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 316,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 321,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 495, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# !inst_type: set_addr load alu store 
!!# inst_type: set_addr load atomics alu store atomics_asi barier sjm4 sjm5
!!# {
!!# 		IJ_generate ("diag.j", 502, th_M, $2);
!!# 		IJ_generate ("diag.j", 503, th_M, $3);
!!# 		IJ_generate ("diag.j", 504, th_M, $4);
!!# 		IJ_generate ("diag.j", 505, th_M, $5);
!!# 		IJ_generate ("diag.j", 506, th_M, $6);
!!# 		IJ_generate ("diag.j", 507, th_M, $7);
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
!!#                    IJ_printf ("diag.j", 523, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 526, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 528, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 529, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 533, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 534, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 535, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 536, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 538, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 539, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 552, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 557, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 561, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 562, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 564, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 565, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 579, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 583, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 584, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 601, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 606, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 607, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 609, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 610, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 612, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 613, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 618, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 619, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 621, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 622, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 639, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 642, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 644, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 645, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 649, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 650, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 651, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 652, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 654, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 655, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 668, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 673, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 677, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 678, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 680, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 681, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 696, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 699, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 701, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 702, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 717, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 720, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 721, Rv_rand32);
!!#                          IJ_printf ("diag.j", 722, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 727, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 729, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 743, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 749, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 753, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 768, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 770, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 772, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 778, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 779, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 806, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 812, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 813, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 816, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 818, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 827, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 829, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 847, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 853, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 858, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 860, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 878, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 881, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 883, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 884, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 887, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 888, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 889, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 890, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 892, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 893, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 906, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 911, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 915, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 916, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 918, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 919, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 933, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 937, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 938, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 955, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 960, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 961, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 963, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 964, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 966, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 967, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 972, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 973, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 975, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 976, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 993, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 996, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 998, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 999, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1003, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1004, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1005, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1006, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1008, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1009, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1022, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1027, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1031, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1032, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1034, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1035, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1051, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1054, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1056, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1057, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1072, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1075, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1076, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1077, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1082, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1084, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1098, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1104, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1108, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1124, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1126, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1128, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1134, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1135, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1162, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1168, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1169, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1172, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1174, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1183, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1185, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1203, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1209, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1214, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1216, sjm_5, "\n");
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
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1241, Rv_jbi_fifo_wr0_config);
!!#                         IJ_update_rvar("diag.j", 1242, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1244, Rv_jbi_fifo_wr1_config);
!!#                         IJ_update_rvar("diag.j", 1245, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1255, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1257, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1258, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1259, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1260, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1261, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1262, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1263, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1264, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1265, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1266, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1267, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1268, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1269, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1270, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1271, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1272, th_M, "\n\n\n");
!!#                         }
!!# 
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                       IJ_printf ("diag.j", 1282, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
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
