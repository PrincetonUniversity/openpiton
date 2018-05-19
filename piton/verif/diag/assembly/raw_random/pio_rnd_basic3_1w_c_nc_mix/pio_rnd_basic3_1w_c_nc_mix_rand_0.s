// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1w_c_nc_mix_rand_0.s
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
   random seed:	407939646
   Jal pio_rnd_basic3_1w_c_nc_mix.j:	
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

#include "boot.s"

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	ta	0x30

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
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

	setx 0xaa490d9787b25305, %g1, %g0
	setx 0x5ad7d8dd5bcf4c05, %g1, %g1
	setx 0x39fec49e78e00c9a, %g1, %g2
	setx 0xb2311dbea05286d5, %g1, %g3
	setx 0xc434bd53c0a6b68c, %g1, %g4
	setx 0x34926a4288a0d4ed, %g1, %g5
	setx 0xde8919e13d3178fe, %g1, %g6
	setx 0xd235a6efc1d1ee55, %g1, %g7
	setx 0x71c5f1992cacaa27, %g1, %r16
	setx 0xcf9def14ae32e45e, %g1, %r17
	setx 0x6b5fe2695b0dab89, %g1, %r18
	setx 0x51a44cc319bec63b, %g1, %r19
	setx 0xd97ebe7d339c6c90, %g1, %r20
	setx 0x214479aae060e8a2, %g1, %r21
	setx 0xcdda98c41d7ca7cb, %g1, %r22
	setx 0x8f67f35a84bb1f07, %g1, %r23
	setx 0xb6bc8c415ca320d3, %g1, %r24
	setx 0x966fe15bbc054b57, %g1, %r25
	setx 0x21f97c1e18e47838, %g1, %r26
	setx 0x2cd1057de0a51c64, %g1, %r27
	setx 0x3e128a1819954a6e, %g1, %r28
	setx 0x54ed204cf22e98b0, %g1, %r29
	setx 0xd19c84bce1b36a85, %g1, %r30
	setx 0xd938714f8a70cf35, %g1, %r31
	save
	setx 0x5196c20beaea0255, %g1, %r16
	setx 0x312236536dc890ca, %g1, %r17
	setx 0xbd51deef322eaac1, %g1, %r18
	setx 0x7dfc60a351df5e2e, %g1, %r19
	setx 0x011276b0c8479c5c, %g1, %r20
	setx 0xe82b80583a94ce05, %g1, %r21
	setx 0x57ec0d28a5f7bcd4, %g1, %r22
	setx 0x48d6f05050ed5b87, %g1, %r23
	setx 0xa2574344df2a9061, %g1, %r24
	setx 0xaf5929987aca8e2e, %g1, %r25
	setx 0x25df8626d6b8fbe3, %g1, %r26
	setx 0x7eeb324b3888e9a4, %g1, %r27
	setx 0x73f61168ebcc381b, %g1, %r28
	setx 0xafa469c51cf90e42, %g1, %r29
	setx 0x30993f8650f4d96c, %g1, %r30
	setx 0x262602177a8742a8, %g1, %r31
	save
	setx 0x848c26bcb90ec4b0, %g1, %r16
	setx 0xd0f68d998ec75606, %g1, %r17
	setx 0x1a22dbd25cf0ff85, %g1, %r18
	setx 0x6d05580411eb3544, %g1, %r19
	setx 0x8f0c72df1452efa9, %g1, %r20
	setx 0xf82e56986d3f3636, %g1, %r21
	setx 0x3d2ff9bb50ff1ce6, %g1, %r22
	setx 0xb35cbeedc113fef2, %g1, %r23
	setx 0xb7b674c485f9cf88, %g1, %r24
	setx 0xbd7b7674d9afebf4, %g1, %r25
	setx 0xcf258ad04647bdfa, %g1, %r26
	setx 0x54659e7075035557, %g1, %r27
	setx 0xeceeb887354d051b, %g1, %r28
	setx 0xad9443a442570c0f, %g1, %r29
	setx 0x8192bbc6d7ecc73a, %g1, %r30
	setx 0x65282874cef43bbc, %g1, %r31
	restore
	mov	0, %r8
	setx	0x0000000043122c03, %r1, %r9
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



	setx	0x000000803952115c, %r1, %r6
	setx	0xe0988e0a9d572e01, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xe0988e0a9d572e01, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ec88d8c, %r1, %r6
	setx	0x0adfa1a9dd912d51, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x0adfa1a9dd912d51, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f4b3b60, %r1, %r6
	setx	0xb2dd55b23b73e374, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xb2dd55b23b73e374, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c5651ceb0c, %r1, %r6
	setx	0x9a47a85b2377fed8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d32a87d700, %r1, %r6
	setx	0xb0c203db0955bd8a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e28dc3574c, %r1, %r6
	setx	0x64c358a825865f15, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f99c1263cc, %r1, %r6
	setx	0x022b9ec0a8469ab0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe0118008  ! 2: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xac898008  ! 3: ANDcc_R	andcc 	%r6, %r8, %r22
	.word 0xe031a098  ! 4: STH_I	sth	%r16, [%r6 + 0x0098]
	setx	0x0000008049de8060, %r1, %r6
	setx	0x8730de47df60012f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x8730de47df60012f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ea1eb4c, %r1, %r6
	setx	0xfbf218a6e5684a6b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3e0e2c, %r1, %r6
	setx	0x88487a82bb9a45a1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x88487a82bb9a45a1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c47a12b884, %r1, %r6
	setx	0xfed5f9606dd58cb9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d93669b8a4, %r1, %r6
	setx	0x91ad130a88ae20d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3a179cef4, %r1, %r6
	setx	0x6c1bc299abd36e57, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1a07d8330, %r1, %r6
	setx	0x26e2d56400881f40, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008049de8060, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f99c1263cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0x26e2d56400881f40, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e28dc3574c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d32a87d700, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5651ceb0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe411a098  ! 9: LDUH_I	lduh	[%r6 + 0x0098], %r18
	.word 0xa681a068  ! 10: ADDcc_I	addcc 	%r6, 0x0068, %r19
	.word 0xe871a068  ! 11: STX_I	stx	%r20, [%r6 + 0x0068]
	setx	0x00000080e4a56b5c, %r1, %r6
	setx	0xd1bff1e7d08c03f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eda5cd4, %r1, %r6
	setx	0xc2363a1e5a01790e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6d4db4, %r1, %r6
	setx	0x0fbd2f41f76962ab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbaccb2c8c, %r1, %r6
	setx	0xb067429f91ebb450, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db17156f88, %r1, %r6
	setx	0x43e3c433a1c94fcb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e99f34c7f0, %r1, %r6
	setx	0xd0d82ce72eeba479, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f72360a5ec, %r1, %r6
	setx	0x246d34ad2e6eeae5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3a179cef4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d93669b8a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c47a12b884, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3e0e2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea1eb4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe0118008  ! 16: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa431a0f8  ! 17: SUBC_I	orn 	%r6, 0x00f8, %r18
	.word 0xe071a0f8  ! 18: STX_I	stx	%r16, [%r6 + 0x00f8]
	setx	0x000000808f78efa4, %r1, %r6
	setx	0x9acadfb8117876b0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e48ef0c, %r1, %r6
	setx	0xf9de2b6876c758ea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fff48f4, %r1, %r6
	setx	0x4dc777109e249106, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc07f7171c, %r1, %r6
	setx	0x63083f363a1e762a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d98da8a074, %r1, %r6
	setx	0x3dc1f80012e33a01, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x3dc1f80012e33a01, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ea52d95218, %r1, %r6
	setx	0x86095a4b61183f7f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f94bd00940, %r1, %r6
	setx	0xc98bf14f866dbd1a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1a07d8330, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0xc98bf14f866dbd1a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e3a179cef4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d93669b8a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c47a12b884, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3e0e2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea1eb4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008049de8060, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	.word 0xe851a0f8  ! 23: LDSH_I	ldsh	[%r6 + 0x00f8], %r20
	.word 0xa211a008  ! 24: OR_I	or 	%r6, 0x0008, %r17
	.word 0xe029a008  ! 25: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000080efd1a520, %r1, %r6
	setx	0x861712835881009f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ee5e608, %r1, %r6
	setx	0xde458d918893df3c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xde458d918893df3c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f5842c0, %r1, %r6
	setx	0x734dbbc28526188a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c254389624, %r1, %r6
	setx	0xd83cad9ab1dc2d48, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xd83cad9ab1dc2d48, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000df39d68b40, %r1, %r6
	setx	0xd266d9d2d75018f8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xd266d9d2d75018f8, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ed3ca62e6c, %r1, %r6
	setx	0x468f265ef0bb0708, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcaff58e10, %r1, %r6
	setx	0xb684bcd8c95b67d1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xb684bcd8c95b67d1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cbaccb2c8c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0xb684bcd8c95b67d1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f6d4db4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0xb684bcd8c95b67d1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800eda5cd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080e4a56b5c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xb684bcd8c95b67d1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f1a07d8330, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0xb684bcd8c95b67d1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e3a179cef4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe0598008  ! 30: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa8198008  ! 31: XOR_R	xor 	%r6, %r8, %r20
	.word 0xe439a008  ! 32: STD_I	std	%r18, [%r6 + 0x0008]
	setx	0x0000008024b1a680, %r1, %r6
	setx	0xe0c1462a3a34d38a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xe0c1462a3a34d38a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e3c6de0, %r1, %r6
	setx	0xab5bf6a909d87a07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f7450b8, %r1, %r6
	setx	0xc4de2a41165ea7e7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c972fbd43c, %r1, %r6
	setx	0x855c613eb7e6821e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dfc051509c, %r1, %r6
	setx	0x800ad820ee01d8b0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x800ad820ee01d8b0, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ea93930b20, %r1, %r6
	setx	0x06887ac7a6487b8d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6736cfe6c, %r1, %r6
	setx	0xa199dd7e619723c7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080efd1a520, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f94bd00940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea52d95218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d98da8a074, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe8198008  ! 37: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa6218008  ! 38: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe071a008  ! 39: STX_I	stx	%r16, [%r6 + 0x0008]
	setx	0x000000805b50c7d4, %r1, %r6
	setx	0x6b8e36b07e49b59b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eeab78c, %r1, %r6
	setx	0x87ac25f78534b327, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa825e4, %r1, %r6
	setx	0x0611f9bc34285a6f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc117c635c, %r1, %r6
	setx	0xb506b6d1984cbe2f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db6b2e193c, %r1, %r6
	setx	0xb379c28ef3517f98, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ef804d000c, %r1, %r6
	setx	0xe17fda0620085c27, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xe17fda0620085c27, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fb0aadc4e8, %r1, %r6
	setx	0xbe45f81fca964180, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3a179cef4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d93669b8a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c47a12b884, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3e0e2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea1eb4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008049de8060, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe4118008  ! 44: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xae09a068  ! 45: AND_I	and 	%r6, 0x0068, %r23
	.word 0xe0298008  ! 46: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x0000008074b5f998, %r1, %r6
	setx	0xa0881ea3a00c2291, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e290628, %r1, %r6
	setx	0xcfe78080dcddb773, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f1c9da4, %r1, %r6
	setx	0xab8f9172e48ba2a1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb44408f64, %r1, %r6
	setx	0x34e5c7dbe68f485f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x34e5c7dbe68f485f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d5702526a0, %r1, %r6
	setx	0x16514f9f0810c791, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e1172564a0, %r1, %r6
	setx	0xf256b8ce40fde552, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8efb8211c, %r1, %r6
	setx	0xa333405bcf4755a8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xa333405bcf4755a8, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c47a12b884, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xec118008  ! 51: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa0b98008  ! 52: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xec718008  ! 53: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x0000008079700f0c, %r1, %r6
	setx	0x5ba60677d4bc272e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ebafbf8, %r1, %r6
	setx	0x2a2c0f199fdfd098, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x2a2c0f199fdfd098, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f2f5b24, %r1, %r6
	setx	0x222c038df6623f86, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c6bba6533c, %r1, %r6
	setx	0x9ebe134217e2fe8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc41704aa0, %r1, %r6
	setx	0x889a6ebc93a19a4c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecb559dbd8, %r1, %r6
	setx	0xcc68d4880868a7f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f5fa6b48d8, %r1, %r6
	setx	0x971010be6c534893, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c972fbd43c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7450b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3c6de0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008024b1a680, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe0418008  ! 58: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa4018008  ! 59: ADD_R	add 	%r6, %r8, %r18
	.word 0xec21a068  ! 60: STW_I	stw	%r22, [%r6 + 0x0068]
	setx	0x00000080a5d3b7bc, %r1, %r6
	setx	0x0a8afdb7be23e628, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x0a8afdb7be23e628, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ecaeb9c, %r1, %r6
	setx	0xe8103318016de3c5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f278b68, %r1, %r6
	setx	0x3ca880b93b1e759a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x3ca880b93b1e759a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c7aaeb44b4, %r1, %r6
	setx	0xf2dba5b90398c32e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000da77a22630, %r1, %r6
	setx	0x41a5a42d3932d233, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5d4f97d5c, %r1, %r6
	setx	0xb7001bab0451f02b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000faa4d173b4, %r1, %r6
	setx	0x0d6acd1ac08059f3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x0d6acd1ac08059f3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f2f5b24, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x0d6acd1ac08059f3, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	.word 0xe001a068  ! 65: LDUW_I	lduw	[%r6 + 0x0068], %r16
	.word 0xa689a090  ! 66: ANDcc_I	andcc 	%r6, 0x0090, %r19
	.word 0xe0718008  ! 67: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000808c392f98, %r1, %r6
	setx	0x942d688fbe947de9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e9cea7c, %r1, %r6
	setx	0xfb28707af5b80243, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xfb28707af5b80243, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f4db4f4, %r1, %r6
	setx	0x621ab4998eb26f30, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c16c8e9eac, %r1, %r6
	setx	0xfc8f8d8861585ef8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d02fcf0dd0, %r1, %r6
	setx	0x9fea7dfa642524a8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb2ca87558, %r1, %r6
	setx	0x03d6ed2379ed5993, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6f5bd7660, %r1, %r6
	setx	0x1643ba1d4567167e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000da77a22630, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7aaeb44b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f278b68, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecaeb9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080a5d3b7bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x1643ba1d4567167e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f5fa6b48d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x1643ba1d4567167e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ecb559dbd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe041a090  ! 72: LDSW_I	ldsw	[%r6 + 0x0090], %r16
	.word 0xa289a070  ! 73: ANDcc_I	andcc 	%r6, 0x0070, %r17
	.word 0xe4298008  ! 74: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x0000008079e39c70, %r1, %r6
	setx	0xe256d6a0863b7499, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ebe4590, %r1, %r6
	setx	0xc6c154b2dfdb2346, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb9f29c, %r1, %r6
	setx	0x9706bce8da5df115, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb845dd188, %r1, %r6
	setx	0xcb1b8082b5c4dc12, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db6d9780e0, %r1, %r6
	setx	0x850d8f7ba172a79b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x850d8f7ba172a79b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000efb601ea2c, %r1, %r6
	setx	0x31c34540b1c5b59b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000facf3da7e8, %r1, %r6
	setx	0x0ea3ea0f73c2dcfb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000808c392f98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x0ea3ea0f73c2dcfb, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe0198008  ! 79: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa2318008  ! 80: ORN_R	orn 	%r6, %r8, %r17
	.word 0xe021a070  ! 81: STW_I	stw	%r16, [%r6 + 0x0070]
	setx	0x00000080fe394bc8, %r1, %r6
	setx	0x1a8eb3a7662629c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8f7b34, %r1, %r6
	setx	0xe3594250bbed0a13, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xe3594250bbed0a13, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f208000, %r1, %r6
	setx	0x59b0409aaf25895f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c25e4f5578, %r1, %r6
	setx	0xdf20f635b955521f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc669b97a4, %r1, %r6
	setx	0xb4ae2c28dcb78cc1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e00f57a110, %r1, %r6
	setx	0x21e3bb26e801a49f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x21e3bb26e801a49f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fa2a967f7c, %r1, %r6
	setx	0x8dd022f8cfa84d79, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb0aadc4e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef804d000c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db6b2e193c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xec11a070  ! 86: LDUH_I	lduh	[%r6 + 0x0070], %r22
	.word 0xaa81a040  ! 87: ADDcc_I	addcc 	%r6, 0x0040, %r21
	.word 0xe0298008  ! 88: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000080fe1ea6ac, %r1, %r6
	setx	0xfb0f5348b4df5b94, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7aaef0, %r1, %r6
	setx	0x0e93d650a6a2f4c6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6449cc, %r1, %r6
	setx	0x7c7be6f52a718fa2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c849726688, %r1, %r6
	setx	0x577f9f782b14f57d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1f36c0ec8, %r1, %r6
	setx	0xd56703f8777e5174, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea0df305e8, %r1, %r6
	setx	0x66a740b66b567330, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x66a740b66b567330, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f4654eea4c, %r1, %r6
	setx	0x0e4f48145f42b3c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6f5bd7660, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb2ca87558, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d02fcf0dd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe019a040  ! 93: LDD_I	ldd	[%r6 + 0x0040], %r16
	.word 0xaaa1a0f0  ! 94: SUBcc_I	subcc 	%r6, 0x00f0, %r21
	.word 0xec398008  ! 95: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000080e742fc04, %r1, %r6
	setx	0xdb9a6d1620465bb6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xdb9a6d1620465bb6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ecbe980, %r1, %r6
	setx	0xfa85a123d7ac3b10, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xfa85a123d7ac3b10, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f32e3b0, %r1, %r6
	setx	0xdf086ef7e42e5258, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb920eb2f8, %r1, %r6
	setx	0xabcb219de6106778, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dbba1d3dec, %r1, %r6
	setx	0x13a5e445b584a2e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e91c2f0250, %r1, %r6
	setx	0xb1d4948662309478, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8a9d3e3c4, %r1, %r6
	setx	0xa74e1f67b23dad85, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xa74e1f67b23dad85, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800eda5cd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe411a0f0  ! 100: LDUH_I	lduh	[%r6 + 0x00f0], %r18
	.word 0xa489a0b8  ! 101: ANDcc_I	andcc 	%r6, 0x00b8, %r18
	.word 0xe029a0b8  ! 102: STB_I	stb	%r16, [%r6 + 0x00b8]
	setx	0x000000805ed0513c, %r1, %r6
	setx	0xf2d8a8cef00d846b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed64490, %r1, %r6
	setx	0x0b8eb748f92ab292, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f269cb8, %r1, %r6
	setx	0x9c62498784221e1a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x9c62498784221e1a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cb8a880708, %r1, %r6
	setx	0x2a58075d52fab827, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x2a58075d52fab827, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d15c4f1bd4, %r1, %r6
	setx	0x17a505e5f7419efd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee4b3002c8, %r1, %r6
	setx	0xfcbe8ad81d6ba014, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fead2fcd88, %r1, %r6
	setx	0x8c83e2779322dc3d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x8c83e2779322dc3d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f72360a5ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0x8c83e2779322dc3d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e99f34c7f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db17156f88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbaccb2c8c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe8018008  ! 107: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xac11a0a8  ! 108: OR_I	or 	%r6, 0x00a8, %r22
	.word 0xe0218008  ! 109: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080db9dca80, %r1, %r6
	setx	0x6f0b7b28c38a852d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea03484, %r1, %r6
	setx	0xcd35c1b6159a356a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f927f7c, %r1, %r6
	setx	0x46496a110a52253d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c9bf3abfb0, %r1, %r6
	setx	0x56f0009ca6b5b491, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d02fd2e088, %r1, %r6
	setx	0x9fa25c1d27b947e8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3d7488008, %r1, %r6
	setx	0x0e74d7d540db1356, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x0e74d7d540db1356, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f9c1dea0f8, %r1, %r6
	setx	0xe24afcaacb049c00, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d32a87d700, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xe24afcaacb049c00, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c5651ceb0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe0518008  ! 114: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa4b18008  ! 115: SUBCcc_R	orncc 	%r6, %r8, %r18
	.word 0xe8218008  ! 116: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000080a7547f20, %r1, %r6
	setx	0x3194b5c994d53b63, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eaee788, %r1, %r6
	setx	0x91c16fdaa8f882b3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f843754, %r1, %r6
	setx	0xf6fb4a44e93b7f5c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8bc9a5db0, %r1, %r6
	setx	0x8a25643df5fa4f95, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d0706936dc, %r1, %r6
	setx	0x51baa3a0f97515c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e705bf662c, %r1, %r6
	setx	0x74cdb500a1d9f639, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe35792ce0, %r1, %r6
	setx	0xb2e5f75ac3350bad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c16c8e9eac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xb2e5f75ac3350bad, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f4db4f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9cea7c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0xb2e5f75ac3350bad, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000808c392f98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faa4d173b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe849a0a8  ! 121: LDSB_I	ldsb	[%r6 + 0x00a8], %r20
	.word 0xaac18008  ! 122: ADDCcc_R	addccc 	%r6, %r8, %r21
	.word 0xe8218008  ! 123: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000080e76894d8, %r1, %r6
	setx	0x657045276f1ae2ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e96a0d0, %r1, %r6
	setx	0xe6e1a528c8c76205, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xe6e1a528c8c76205, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f3ca5bc, %r1, %r6
	setx	0x145c14fadb893b03, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c1c73a4dc4, %r1, %r6
	setx	0xc7bbb0477763bbf6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d77aacdbd4, %r1, %r6
	setx	0x15a405b1f74f49de, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e223e5a888, %r1, %r6
	setx	0x0acaf754782b38e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd355ac550, %r1, %r6
	setx	0xc36d9a6cf3618e78, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ef804d000c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xc36d9a6cf3618e78, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000db6b2e193c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc117c635c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa825e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eeab78c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xc36d9a6cf3618e78, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000805b50c7d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xc36d9a6cf3618e78, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe0518008  ! 128: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa6318008  ! 129: ORN_R	orn 	%r6, %r8, %r19
	.word 0xe031a0a8  ! 130: STH_I	sth	%r16, [%r6 + 0x00a8]
	setx	0x000000806caa8844, %r1, %r6
	setx	0x7e4b01664acf812d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e47d1ac, %r1, %r6
	setx	0x9608dd66b3464bf8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f039618, %r1, %r6
	setx	0x7f2eb1de4b0e87d7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x7f2eb1de4b0e87d7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cb217899fc, %r1, %r6
	setx	0x77079b1af6593bc2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x77079b1af6593bc2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d62d09dea4, %r1, %r6
	setx	0xe9862a0a57325010, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4999287e4, %r1, %r6
	setx	0x75d1faef5a8f4f8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x75d1faef5a8f4f8e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f21ceb3854, %r1, %r6
	setx	0xab8b7530defd6230, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008079700f0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8efb8211c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1172564a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5702526a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xe459a0a8  ! 135: LDX_I	ldx	[%r6 + 0x00a8], %r18
	.word 0xac418008  ! 136: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xe0318008  ! 137: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080f8f40398, %r1, %r6
	setx	0x88e1c9aa2a558bd9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e1aa6a0, %r1, %r6
	setx	0xb76f117fbe68fba3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xb76f117fbe68fba3, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f5a77e0, %r1, %r6
	setx	0x951bc464d2606270, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ceefae89e8, %r1, %r6
	setx	0x7b6d5228ff48bcf0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d79fb570a8, %r1, %r6
	setx	0xdd20e4e9620a60bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eab8b3113c, %r1, %r6
	setx	0xc17c31dfc617057e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe58982b74, %r1, %r6
	setx	0xf91a14de07bc60ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6f5bd7660, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0xf91a14de07bc60ae, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eb2ca87558, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d02fcf0dd0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c16c8e9eac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4db4f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xf91a14de07bc60ae, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001060100000, %r1, %r6
	.word 0xe809a0a8  ! 142: LDUB_I	ldub	[%r6 + 0x00a8], %r20
	.word 0xaab98008  ! 143: XNORcc_R	xnorcc 	%r6, %r8, %r21
	.word 0xe8298008  ! 144: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x0000008027418574, %r1, %r6
	setx	0x469686e2c0462b03, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e517abc, %r1, %r6
	setx	0xd9e57d8f505f1e30, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xd9e57d8f505f1e30, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f52837c, %r1, %r6
	setx	0x332fe38046f14f58, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c41a57f148, %r1, %r6
	setx	0x72039cfdd207ebdc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d359162e8c, %r1, %r6
	setx	0xae28da98f13e5293, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e24d403890, %r1, %r6
	setx	0xa006981e1bb30a8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd716a5780, %r1, %r6
	setx	0x06ba24236ea0c6d8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3e0e2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea1eb4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe001a0a8  ! 149: LDUW_I	lduw	[%r6 + 0x00a8], %r16
	.word 0xae19a008  ! 150: XOR_I	xor 	%r6, 0x0008, %r23
	.word 0xe0318008  ! 151: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080a1679e7c, %r1, %r6
	setx	0x0bc372135bdce7c0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e13c7a4, %r1, %r6
	setx	0x05aca209901e2dff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f258630, %r1, %r6
	setx	0x85b281401b9fe7ca, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cae397bf1c, %r1, %r6
	setx	0xabf794269acd8033, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d06666044c, %r1, %r6
	setx	0x0049030001c0fe50, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6150022f0, %r1, %r6
	setx	0xaa68bd776dd00374, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xaa68bd776dd00374, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f3bcfc6454, %r1, %r6
	setx	0x33ebad8ce5e8d19c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eab8b3113c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d79fb570a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ceefae89e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe8018008  ! 156: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa0898008  ! 157: ANDcc_R	andcc 	%r6, %r8, %r16
	.word 0xe029a008  ! 158: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x000000804c2349dc, %r1, %r6
	setx	0x161489b99e91e690, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e48e098, %r1, %r6
	setx	0x59d0e8d1e3263e3f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9373f4, %r1, %r6
	setx	0x8149825882808680, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x8149825882808680, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c2c2893a88, %r1, %r6
	setx	0x3bf45bebfb376f1b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de65ab8050, %r1, %r6
	setx	0x6a71ac53b09d8cef, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ebee3a1c7c, %r1, %r6
	setx	0x7385dd4c57f9f0cd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x7385dd4c57f9f0cd, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fbe4911d98, %r1, %r6
	setx	0x532cbde66d021719, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080e76894d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe35792ce0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe0518008  ! 163: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa6298008  ! 164: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe021a008  ! 165: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x00000080b5fda7a4, %r1, %r6
	setx	0xd09bc0dd42df53b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eb58398, %r1, %r6
	setx	0x900defcca2403873, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fd3a1e0, %r1, %r6
	setx	0x84bba27ddb3b643d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c0bc2a87a0, %r1, %r6
	setx	0xfa43dc78a7dbff8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7ab2dcdd8, %r1, %r6
	setx	0x4dd78aa19fc63831, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x4dd78aa19fc63831, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ed065a3d08, %r1, %r6
	setx	0x33cc95ee5e8aa65e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x33cc95ee5e8aa65e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa4415915c, %r1, %r6
	setx	0x547db431cbe16a0f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8bc9a5db0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f843754, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eaee788, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080a7547f20, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe009a008  ! 170: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xa6018008  ! 171: ADD_R	add 	%r6, %r8, %r19
	.word 0xe031a008  ! 172: STH_I	sth	%r16, [%r6 + 0x0008]
	setx	0x00000080aea66ad8, %r1, %r6
	setx	0xa0e257b7e2f2e89b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed00938, %r1, %r6
	setx	0xd9237868e6090599, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f24edec, %r1, %r6
	setx	0x3cacc73625f0b432, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca19b07ec4, %r1, %r6
	setx	0x386cfd97cf18c550, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc70590e80, %r1, %r6
	setx	0x242f0f43f7e0c4d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea2ed64d40, %r1, %r6
	setx	0x1fa9964ddc8ace5d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f12c778a0c, %r1, %r6
	setx	0xc29bdca9daf51b99, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xc29bdca9daf51b99, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080a5d3b7bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f5fa6b48d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ecb559dbd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0xc29bdca9daf51b99, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dc41704aa0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c6bba6533c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xc29bdca9daf51b99, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	.word 0xe411a008  ! 177: LDUH_I	lduh	[%r6 + 0x0008], %r18
	.word 0xae09a088  ! 178: AND_I	and 	%r6, 0x0088, %r23
	.word 0xe029a088  ! 179: STB_I	stb	%r16, [%r6 + 0x0088]
	setx	0x00000080cefb7b58, %r1, %r6
	setx	0x06b07f6752817dd3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed7e528, %r1, %r6
	setx	0x97a8ffa150b48f17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa1e810, %r1, %r6
	setx	0x54478c2b09dc8f73, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c3c4f96ba4, %r1, %r6
	setx	0xa67912c792ae2f20, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xa67912c792ae2f20, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d7d640e10c, %r1, %r6
	setx	0xf45aa3b1d1caf86c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6151fed4c, %r1, %r6
	setx	0xc4a5d04f0d4bc36a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f72d271ea8, %r1, %r6
	setx	0xc23da7eaa16f1886, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xc23da7eaa16f1886, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f6d4db4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eda5cd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080e4a56b5c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xc23da7eaa16f1886, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f1a07d8330, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xec198008  ! 184: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa409a030  ! 185: AND_I	and 	%r6, 0x0030, %r18
	.word 0xec718008  ! 186: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x000000808fafbd18, %r1, %r6
	setx	0x1665103d2732a76f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e28141c, %r1, %r6
	setx	0xef47fa281760bb09, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f86b9e4, %r1, %r6
	setx	0xf737cf05d5b6d97e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c244a74094, %r1, %r6
	setx	0x3c69d3621c718cbd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7bb94bdfc, %r1, %r6
	setx	0xbe8cbdd8cf8e8375, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xbe8cbdd8cf8e8375, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e9d015cf88, %r1, %r6
	setx	0x70c32ba82e831712, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe8ab2f928, %r1, %r6
	setx	0xfdf8d1fc0a6dabde, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d77aacdbd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1c73a4dc4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0xfdf8d1fc0a6dabde, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f3ca5bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e96a0d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080e76894d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe35792ce0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e705bf662c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe009a030  ! 191: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xae418008  ! 192: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe071a030  ! 193: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x0000008078eb30ec, %r1, %r6
	setx	0xf25dcc94f1f7ffdc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e20ae38, %r1, %r6
	setx	0xde8ca9a0a2bcafbb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa64308, %r1, %r6
	setx	0xcc02c1776b4dc6b5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c23fc511dc, %r1, %r6
	setx	0x12c61a2baebc81a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d45f8927f4, %r1, %r6
	setx	0x300bc3594caf663a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x300bc3594caf663a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e19a1a7e34, %r1, %r6
	setx	0xb76e68f9124e1214, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f5420e76ec, %r1, %r6
	setx	0xacaf6dc1ae67a9da, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xacaf6dc1ae67a9da, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001070100000, %r1, %r6
	.word 0xe059a030  ! 198: LDX_I	ldx	[%r6 + 0x0030], %r16
	.word 0xa699a068  ! 199: XORcc_I	xorcc 	%r6, 0x0068, %r19
	.word 0xe0718008  ! 200: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000802af81750, %r1, %r6
	setx	0xb778819a63b33af1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e25be4c, %r1, %r6
	setx	0xcd789fca1663efb0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb934d0, %r1, %r6
	setx	0x0e5139c6d2b5fa43, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cefe1c3150, %r1, %r6
	setx	0xefa40b00ed32557d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xefa40b00ed32557d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d8d0f40620, %r1, %r6
	setx	0x357cd166f64e802e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3ea269c78, %r1, %r6
	setx	0x32b8426d8725f27c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcb08fe86c, %r1, %r6
	setx	0x5005301a143851bc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008027418574, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x5005301a143851bc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fe58982b74, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0x5005301a143851bc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001040100000, %r1, %r6
	.word 0xe811a068  ! 205: LDUH_I	lduh	[%r6 + 0x0068], %r20
	.word 0xa6b18008  ! 206: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xe4218008  ! 207: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000080a37f298c, %r1, %r6
	setx	0x9d75edbd1c26b6ab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed8bbd4, %r1, %r6
	setx	0x4053ff7dc768867f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe338a0, %r1, %r6
	setx	0xa7a9b682b0b4c291, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xa7a9b682b0b4c291, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c329378304, %r1, %r6
	setx	0x6781ee6e4250b69a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9c853959c, %r1, %r6
	setx	0x8d9a0b1b689902ac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x8d9a0b1b689902ac, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e7db908a74, %r1, %r6
	setx	0x850b704035975699, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x850b704035975699, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f6703f1e0c, %r1, %r6
	setx	0x09d1b0d1e4a340f7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x09d1b0d1e4a340f7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	.word 0xec49a068  ! 212: LDSB_I	ldsb	[%r6 + 0x0068], %r22
	.word 0xa829a030  ! 213: ANDN_I	andn 	%r6, 0x0030, %r20
	.word 0xe021a030  ! 214: STW_I	stw	%r16, [%r6 + 0x0030]
	setx	0x00000080d71f58ac, %r1, %r6
	setx	0xad166b3ef36eb981, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed42c30, %r1, %r6
	setx	0x0ee799f7670de1c6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f1edeec, %r1, %r6
	setx	0x43933e0cbd3b7921, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c876464b1c, %r1, %r6
	setx	0x4fe65b3f0c954549, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dbd0b769a8, %r1, %r6
	setx	0x4533af0befcc00fb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e95c35c4b4, %r1, %r6
	setx	0xb3669b2c0af66756, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb76a027dc, %r1, %r6
	setx	0x7d839e7c855c8384, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x7d839e7c855c8384, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e7db908a74, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9c853959c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe0198008  ! 219: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa4198008  ! 220: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe031a030  ! 221: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x0000008058c3820c, %r1, %r6
	setx	0x75815b2257f20112, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x75815b2257f20112, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e3b8cec, %r1, %r6
	setx	0x8260f0628dbcd191, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fbebb94, %r1, %r6
	setx	0xe9e3149e2104add0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c9ee0fd2f4, %r1, %r6
	setx	0xe7f2a09c82b04901, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc8787052c, %r1, %r6
	setx	0x0015476c9c303933, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x0015476c9c303933, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e491b58350, %r1, %r6
	setx	0x3a8752a9515044d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd919c3cf4, %r1, %r6
	setx	0x2ed3b13c5d8da32b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f32e3b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x2ed3b13c5d8da32b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ecbe980, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0x2ed3b13c5d8da32b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080e742fc04, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4654eea4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea0df305e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1f36c0ec8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x2ed3b13c5d8da32b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c849726688, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe4098008  ! 226: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa2b18008  ! 227: ORNcc_R	orncc 	%r6, %r8, %r17
	.word 0xe8718008  ! 228: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000080c2b60bd4, %r1, %r6
	setx	0x570dbd4edb872059, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x570dbd4edb872059, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800efb049c, %r1, %r6
	setx	0xf699f2afc4153bf4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xf699f2afc4153bf4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f9cc240, %r1, %r6
	setx	0xa146a55913379794, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000caa9bd6e34, %r1, %r6
	setx	0xef46bc71b6a49000, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db8d5323ac, %r1, %r6
	setx	0x1d100be0c9b1594a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6b831457c, %r1, %r6
	setx	0xed7c83702395edf7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe5228b13c, %r1, %r6
	setx	0x16e4e699b908e792, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8f7b34, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080fe394bc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000facf3da7e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xec598008  ! 233: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xac39a060  ! 234: XNOR_I	xnor 	%r6, 0x0060, %r22
	.word 0xec21a060  ! 235: STW_I	stw	%r22, [%r6 + 0x0060]
	setx	0x00000080a3160cc8, %r1, %r6
	setx	0x2b0b64c7d0e55df2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e33351c, %r1, %r6
	setx	0x3c8b70443cf1c4a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x3c8b70443cf1c4a0, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f7780ec, %r1, %r6
	setx	0x86364f7fb97bda10, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x86364f7fb97bda10, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c5486b62a0, %r1, %r6
	setx	0xb23021b195ecdfbd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d3255298a4, %r1, %r6
	setx	0x1cb33be408b0dc5f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x1cb33be408b0dc5f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ec26d2e104, %r1, %r6
	setx	0xde777abad3db6259, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe13d83dc4, %r1, %r6
	setx	0x06cbae9b2b825102, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa2a967f7c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x06cbae9b2b825102, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e00f57a110, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc669b97a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c25e4f5578, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f208000, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe0018008  ! 240: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa8b1a068  ! 241: SUBCcc_I	orncc 	%r6, 0x0068, %r20
	.word 0xe029a068  ! 242: STB_I	stb	%r16, [%r6 + 0x0068]
	setx	0x00000080c59d909c, %r1, %r6
	setx	0x6065ff6c4dde1cdc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8def24, %r1, %r6
	setx	0xaf879b6f42cf46b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xaf879b6f42cf46b6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f6d3614, %r1, %r6
	setx	0x2a885579e786a58c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd89215610, %r1, %r6
	setx	0x286d212f0ad53b64, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db6812e958, %r1, %r6
	setx	0x8476f7810f3efd8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eac33a2e34, %r1, %r6
	setx	0xed4c414915a0d171, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fd02a50a04, %r1, %r6
	setx	0x90ed176edcb65b50, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x90ed176edcb65b50, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000008079700f0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8efb8211c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x90ed176edcb65b50, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e1172564a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5702526a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe8518008  ! 247: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xac418008  ! 248: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xe031a068  ! 249: STH_I	sth	%r16, [%r6 + 0x0068]
	setx	0x00000080b86ee648, %r1, %r6
	setx	0x3cf9a590dc09e44c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x3cf9a590dc09e44c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e296e64, %r1, %r6
	setx	0xf5515e1d2e272dd9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xf5515e1d2e272dd9, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f8e9b80, %r1, %r6
	setx	0x9ccf5f07c2735344, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c2b245935c, %r1, %r6
	setx	0x9352df9029f86d5a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x9352df9029f86d5a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000debabcaaec, %r1, %r6
	setx	0x93b5dc9f368eed96, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed22f90f88, %r1, %r6
	setx	0x93b607a1ccdf82eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fdbad3bb04, %r1, %r6
	setx	0xf4da9fc6610cc773, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe441a068  ! 254: LDSW_I	ldsw	[%r6 + 0x0068], %r18
	.word 0xaa018008  ! 255: ADD_R	add 	%r6, %r8, %r21
	.word 0xe021a068  ! 256: STW_I	stw	%r16, [%r6 + 0x0068]
	setx	0x000000807d8b60b0, %r1, %r6
	setx	0x70a76ef3ad520e77, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ee254e4, %r1, %r6
	setx	0x5ed441dc6fb73ed1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x5ed441dc6fb73ed1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fdb2974, %r1, %r6
	setx	0x1dabbc3d5e6405bf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x1dabbc3d5e6405bf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c48494e77c, %r1, %r6
	setx	0x4d42660053042772, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x4d42660053042772, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d100175e28, %r1, %r6
	setx	0xa667a7606fd074a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xa667a7606fd074a2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9f8d3c3d0, %r1, %r6
	setx	0xd69f5d6143cb1892, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f5c597a390, %r1, %r6
	setx	0x43b58e98fa2667c4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x43b58e98fa2667c4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e28141c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x43b58e98fa2667c4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000808fafbd18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f72d271ea8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x43b58e98fa2667c4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e6151fed4c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7d640e10c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe449a068  ! 261: LDSB_I	ldsb	[%r6 + 0x0068], %r18
	.word 0xa889a0a0  ! 262: ANDcc_I	andcc 	%r6, 0x00a0, %r20
	.word 0xe821a0a0  ! 263: STW_I	stw	%r20, [%r6 + 0x00a0]
	setx	0x0000008066275c40, %r1, %r6
	setx	0xcb4bf954404e88fc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efc6290, %r1, %r6
	setx	0x81bfbde2e21cfe5f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f782244, %r1, %r6
	setx	0x1d618b30a2543897, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb7eb4cacc, %r1, %r6
	setx	0xa42c8feed93a9d84, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d92b680458, %r1, %r6
	setx	0xb2db1f61bc3db58d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed3d32dfec, %r1, %r6
	setx	0xe5e631bf2c98d6a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xe5e631bf2c98d6a2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f99fa61300, %r1, %r6
	setx	0x9b4c0e88cb031262, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe35792ce0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e705bf662c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0706936dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8bc9a5db0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe849a0a0  ! 268: LDSB_I	ldsb	[%r6 + 0x00a0], %r20
	.word 0xa6998008  ! 269: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe821a0a0  ! 270: STW_I	stw	%r20, [%r6 + 0x00a0]
	setx	0x00000080567f8a18, %r1, %r6
	setx	0x7c1d5b2dfcecdd8c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x7c1d5b2dfcecdd8c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e3a1524, %r1, %r6
	setx	0x84a2267cb921f76c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fd49854, %r1, %r6
	setx	0xeaa8081b4db8e2e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c42e20ea88, %r1, %r6
	setx	0x3d100e3c926a73c4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d6286b1f58, %r1, %r6
	setx	0x4f7330ad702e07d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e8053b28f0, %r1, %r6
	setx	0x7a72e1b0744e620b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x7a72e1b0744e620b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fb17aec00c, %r1, %r6
	setx	0x84560e85ebb9eb27, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eac33a2e34, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db6812e958, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd89215610, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6d3614, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x84560e85ebb9eb27, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e8def24, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x84560e85ebb9eb27, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080c59d909c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe13d83dc4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x84560e85ebb9eb27, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe4118008  ! 275: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xa6218008  ! 276: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe839a0a0  ! 277: STD_I	std	%r20, [%r6 + 0x00a0]
	setx	0x00000080731ee5f0, %r1, %r6
	setx	0x83581ee9aa502288, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x83581ee9aa502288, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ebec488, %r1, %r6
	setx	0xa27aa973759851a8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fd1db34, %r1, %r6
	setx	0x9f1c1a0125122882, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c00ad9fe48, %r1, %r6
	setx	0xad45891eb7b94b73, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7e274d300, %r1, %r6
	setx	0x53fa124858d11811, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee5a26afe8, %r1, %r6
	setx	0x966473e95e2b9635, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x966473e95e2b9635, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f39962c99c, %r1, %r6
	setx	0x1fec96c4ab2a48ab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x1fec96c4ab2a48ab, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c9bf3abfb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x1fec96c4ab2a48ab, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f927f7c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea03484, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080db9dca80, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x1fec96c4ab2a48ab, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fead2fcd88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee4b3002c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0x1fec96c4ab2a48ab, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d15c4f1bd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xe409a0a0  ! 282: LDUB_I	ldub	[%r6 + 0x00a0], %r18
	.word 0xa641a0c0  ! 283: ADDC_I	addc 	%r6, 0x00c0, %r19
	.word 0xe039a0c0  ! 284: STD_I	std	%r16, [%r6 + 0x00c0]
	setx	0x00000080654f5344, %r1, %r6
	setx	0xc0e08316bb5e8774, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xc0e08316bb5e8774, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ee47e0c, %r1, %r6
	setx	0xff45e764a66c53ab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xff45e764a66c53ab, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ff1f8cc, %r1, %r6
	setx	0x609e6aaaf727d499, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c16262c98c, %r1, %r6
	setx	0x6c5a46e119836f0b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d3e9465214, %r1, %r6
	setx	0xae472838edcf5192, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xae472838edcf5192, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e0bb080c84, %r1, %r6
	setx	0x4117f36384757f2b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x4117f36384757f2b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fb698cb3ec, %r1, %r6
	setx	0xfdf45cdd9fcc8e7f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xfdf45cdd9fcc8e7f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f94bd00940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea52d95218, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xfdf45cdd9fcc8e7f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d98da8a074, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xfdf45cdd9fcc8e7f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cc07f7171c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe8098008  ! 289: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xacb98008  ! 290: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe821a0c0  ! 291: STW_I	stw	%r20, [%r6 + 0x00c0]
	setx	0x0000008045625930, %r1, %r6
	setx	0x082ee579876d218a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e235518, %r1, %r6
	setx	0x266dc6142a98d5a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f5306d8, %r1, %r6
	setx	0xb0e7425e16cc00bc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xb0e7425e16cc00bc, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cbc0d83598, %r1, %r6
	setx	0xe80d824ea410c309, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc640d06b4, %r1, %r6
	setx	0xf1777c2832ea778f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eeab269298, %r1, %r6
	setx	0xf25a53bcb02d7673, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc697a106c, %r1, %r6
	setx	0x94bb34a8dcd9c6a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x94bb34a8dcd9c6a2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e28dc3574c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d32a87d700, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6


done;

h_bad_end:
        ta T_BAD_TRAP

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
	.xword	0x0dd3743fac1baee4
	.xword	0xd226ba7ba426d267
	.xword	0xce3175d91f835324
	.xword	0x86e20aa44d09fdbf
	.xword	0x056dde7eebfd10b9
	.xword	0x1fd7d4b011908753
	.xword	0x8d782414dde3c94c
	.xword	0x2f5cc4bf3a3370f5
	.xword	0x118009b564e23091
	.xword	0xf35dbfa2b2ceaaad
	.xword	0x75245fd8e238b03f
	.xword	0x24076ca1bf918049
	.xword	0xb0fef5dfd951c7e9
	.xword	0x2939d8bf07eb414d
	.xword	0x8bbe8cfee9bd2277
	.xword	0x9c050d6bd63400a2
	.xword	0x2c10a8190fbe1352
	.xword	0x561833f8063bd50c
	.xword	0x2c4f69422bb8f4d2
	.xword	0x8fa5641208a5a267
	.xword	0xfb365f0e659ff02d
	.xword	0x4e993e50a1af9893
	.xword	0xb41648a2fa9f06a5
	.xword	0xf50ea9ab0681d20d
	.xword	0x2e68edaad7c7b715
	.xword	0x30d333300fbfc3dc
	.xword	0x98cf02954366521d
	.xword	0x6ef46b1468ff4125
	.xword	0xd1b8b06b6fac2a9a
	.xword	0x9529dc3301b22414
	.xword	0xe19182441cd6cc51
	.xword	0x8cacb788520af33d
	.xword	0xf40d311ab67259e1
	.xword	0x463e77c60ee6f610
	.xword	0x2b7abc2e102fa140
	.xword	0x418f29c6967b999d
	.xword	0xb3b659a604da87ca
	.xword	0x72f0195205eb9df0
	.xword	0x5da7a2965aa9da29
	.xword	0x32f114b11e33a351
	.xword	0x19194bd863ace971
	.xword	0x7c7be836fc9c207f
	.xword	0xe255cfdb7954216a
	.xword	0x7cfc44cbee634b35
	.xword	0x2a8ba1202b8a46f6
	.xword	0xe24c597123479360
	.xword	0x8f3d07c7be33fec4
	.xword	0xb579f1251d5f62c7
	.xword	0xb039bb855b87d789
	.xword	0x8ecfa9115905e221
	.xword	0x5d61c53fd0cdf925
	.xword	0xb01a1f5ef096b211
	.xword	0x77737a8ec583db6e
	.xword	0x9a4b808a9eb93568
	.xword	0x9b027438392fa276
	.xword	0x99b7d7f84b2c4ffb
	.xword	0xe692702d9c0567de
	.xword	0xd80860d09b7fa7d9
	.xword	0x72e55514897974ef
	.xword	0x7f2a2deb41eaaf90
	.xword	0x64d987811a312b4f
	.xword	0xd15327558ae05da9
	.xword	0xc4345e3c9f7cea54
	.xword	0x68d6e7c02fb40a42
	.xword	0x13d0a90ff32c3eec
	.xword	0x1b18ebb83d81a2c9
	.xword	0xb70d6a2d60673b48
	.xword	0xab1f0e262bb9fb21
	.xword	0x7e8920c8a97e1b6c
	.xword	0xf9b3d1051b74270e
	.xword	0xdfada5e8745d50b0
	.xword	0xb61cdfcb5eebe451
	.xword	0xc15016c8755d06fc
	.xword	0x9506b5d6a2825bbf
	.xword	0x979e41bbaf41cee0
	.xword	0x91ca44c051789237
	.xword	0x0407a3f6e716afd2
	.xword	0x421d45085a33f66d
	.xword	0x5469adf16cec992a
	.xword	0xa262b3009e6e5df9
	.xword	0xcca05e70da3d6ab9
	.xword	0x425fda1d16f4eb30
	.xword	0xd46f87f363f22a71
	.xword	0x747633d0ab46aa43
	.xword	0x7cf70bd94c7a924d
	.xword	0xafa6cfb866b47765
	.xword	0x6feeb880131bfc63
	.xword	0xeb8b5ba59cbff97e
	.xword	0xd4b7695d30470ebb
	.xword	0x9c784fd3e842681a
	.xword	0x260da9b2dbcc5e4b
	.xword	0x8d0262d1b25e55c7
	.xword	0x0c5b724ae4ca1092
	.xword	0x8fba8d64eb6704f1
	.xword	0x06bceaaad8b4ea7d
	.xword	0xa01e29bf2e1339df
	.xword	0x61b1a47e4ad8040c
	.xword	0xe88d8e5043715940
	.xword	0xb18ff30c381cac52
	.xword	0x6f8a0acfbe853c46
	.xword	0x620f2bc6b34af511
	.xword	0x4193e6eb51cb16c1
	.xword	0xb9c8babba979e786
	.xword	0x636ad93ff194fa4a
	.xword	0x925ac9f4ff5f741c
	.xword	0xf7651bd4481bbec1
	.xword	0xede86c563b03e1b9
	.xword	0x2f166d3e0f31a04a
	.xword	0xba238f1272d93d4d
	.xword	0x37f1269317543946
	.xword	0xd2769c665c566d0d
	.xword	0xc1f394fd1fd766a1
	.xword	0xe1fde4f8d5990b2b
	.xword	0x8fc3975860eeb557
	.xword	0xaa5ac09812183f59
	.xword	0x123cb96416795787
	.xword	0x1201b02c1d8c3aed
	.xword	0xcbd7bcfe06eb12b6
	.xword	0xa8330a2ae8d87977
	.xword	0x9e8e356f3677a586
	.xword	0x73205e368298d87d
	.xword	0xc493fb056f77ab18
	.xword	0x9a68565c6228f2c5
	.xword	0xb86f745844d44a27
	.xword	0x28087b047e6053c6
	.xword	0x5325c050d05ee6fe
	.xword	0x75a1ef9a4528085a
	.xword	0xeb93d5ac42d2c3db
	.xword	0x6a1153e3e39ab636
	.xword	0xe7fbb74e1ddfa60f
	.xword	0x8ee7645c7ef2f4fe
	.xword	0x68fdc3e0cf288b45
	.xword	0x8bb08756af4ef042
	.xword	0x3d30958445d72ef8
	.xword	0x2891895610ae2178
	.xword	0xf1062cb0f3e7af10
	.xword	0xa5f6bfde6e58154f
	.xword	0x26c107512b71f019
	.xword	0xe5a8240cc12226b5
	.xword	0xf09b602a81193ea9
	.xword	0x3842af867f3eb2d1
	.xword	0x13a17b42a35f8d7a
	.xword	0xf9518af7de36383f
	.xword	0x66dd2b3e04a5cf11
	.xword	0xf58c02ec05a8c413
	.xword	0xd17c3e64a7a07025
	.xword	0xd7b0b463fbb08c35
	.xword	0x818a054f42ca548c
	.xword	0x308bf56d27b59e19
	.xword	0x6a08313dac1cf395
	.xword	0x49d39afca780b948
	.xword	0x1d02ddaf8c5d1aa1
	.xword	0x9be942543c92c286
	.xword	0x8bdbd03dc5cbe9b2
	.xword	0x9d0b85c05c5042ef
	.xword	0x5b66a059501c2ea8
	.xword	0x3a5fd425e8a380c3
	.xword	0x184d1266529e808b
	.xword	0x802f3b4a4457b97e
	.xword	0x8a115197ea8f08a7
	.xword	0x572b2ba01525d789
	.xword	0xc6cb9504bba48a1a
	.xword	0xc541b5cf1d1a7d47
	.xword	0xf1426819cd48f589
	.xword	0xf783ee844f7946c5
	.xword	0xa1887c8ec9e99398
	.xword	0x8b277cd90e1a677c
	.xword	0x7352ca4a4ab8bca7
	.xword	0x2e64985bbf28a0eb
	.xword	0x4f9a177341e183b9
	.xword	0x7fbac70a3a2cdf7e
	.xword	0xaa6ebc324447a958
	.xword	0x7199b83cfebdf685
	.xword	0x6426cf3ff6a9295f
	.xword	0x8736ae614d7bbe75
	.xword	0x64242c2eac256884
	.xword	0xf88f26ddc307807a
	.xword	0x2c5d559d218f193a
	.xword	0x2fc386f0e0be4332
	.xword	0x67bfbcd82ce49390
	.xword	0x422d1b4cd3bba06c
	.xword	0xeb267573dd80059a
	.xword	0x1dd8be82c96cba13
	.xword	0x3ace879c22296a9e
	.xword	0x3961e636b7567c6f
	.xword	0x3ba3bd47c5745aa4
	.xword	0x1c862b1e823e14dc
	.xword	0xf0035411b8d32c59
	.xword	0x6cadadc51862ee89
	.xword	0x60a216da2bc916e1
	.xword	0x2709148c381df19a
	.xword	0x00b6f663839df063
	.xword	0xcaa2308c8d4d926b
	.xword	0x340fe8ee6a0c27ca
	.xword	0x96c1a720aab54de8
	.xword	0x9e610b6ae729f82f
	.xword	0xafc1a7c2539c56f2
	.xword	0x0d996bfcc1db6635
	.xword	0x9fbff504e9616306
	.xword	0x7dcf33b4fe525b5d
	.xword	0x83bb6b4c8dce08fd
	.xword	0x2988e66c432e78df
	.xword	0x044ccd69721470ff
	.xword	0xe18c0091856fd8b5
	.xword	0xefba5454ef666118
	.xword	0xe9f0c5b8a5ff4dea
	.xword	0xf6e1914aebb29541
	.xword	0xeeebcd53d392bda1
	.xword	0x7520b7fea7fe09d0
	.xword	0x5e10c3f9710624d3
	.xword	0x255c1f1e57ee739e
	.xword	0x4760dd5682d2e348
	.xword	0x9be9be83f864f084
	.xword	0x8d29de2305443849
	.xword	0xd376e3c48c997442
	.xword	0xf283400a1d04f899
	.xword	0x0ecfd91ed937960d
	.xword	0x25356ccfc38e9764
	.xword	0x90de7042f72c5652
	.xword	0x1d36fbe6c6d6ee2d
	.xword	0x1fc6d0a2512e15d5
	.xword	0xf10b76599c91bc93
	.xword	0x6fb4982d942265e9
	.xword	0xfa3a1a45d9db331e
	.xword	0xe1df1b0ab0c04c63
	.xword	0x41c19692f74a5206
	.xword	0x3537a5404cece803
	.xword	0x61574b371278d729
	.xword	0x51459702512b6a09
	.xword	0x6a6bb3d06e32f5a8
	.xword	0x0d66deb319dd5190
	.xword	0xdf1beaced6713309
	.xword	0xb2a939481d650d95
	.xword	0x5a8bfe22da11eac8
	.xword	0x49d9547996780089
	.xword	0x6decdccc91918697
	.xword	0x29cf110cc5d27045
	.xword	0x1c6820ddf2233371
	.xword	0x692617b739ccc087
	.xword	0xd89874924a0119c2
	.xword	0x1f64c5b37c620007
	.xword	0x8c4b32f98d3218e0
	.xword	0x3736215e29303572
	.xword	0x9519aec2967246b1
	.xword	0xbd4135075c03b272
	.xword	0x6382e74524f8364a
	.xword	0xb81ae2b993e6bc02
	.xword	0x5fa59b1e1de005bd
	.xword	0x7bbf4f800e1b5d03
	.xword	0xe836f34e5f17fae1
	.xword	0x2acee2586a8c5ebc
	.xword	0xb968493add118ceb
	.xword	0x24fa638d07fe001f
	.xword	0x5a523548b76ca0a4
	.xword	0x787c19d44dc8d086
	.xword	0x3503383a8d064847



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
	.xword	0xca81e206186e6b9f
	.xword	0xfee152f78e44b060
	.xword	0xfbdfb6bf70b634af
	.xword	0xb4b59c0ce8512e61
	.xword	0x162cbbfe06d16eba
	.xword	0xae5d1a74c4710c1c
	.xword	0x358c44dbf503a6fe
	.xword	0x085351632d0de11c
	.xword	0x905ae82b7b9709ce
	.xword	0x1fa58536abdb2899
	.xword	0x2c12bafeb3a40eb3
	.xword	0x26ac82811cd6a06c
	.xword	0xe19c11316e080628
	.xword	0xa8ebe3b0e790cd36
	.xword	0x55a4745ddb4e5e43
	.xword	0x1fcb17c2d43f1cde
	.xword	0x83269b32b1381c6f
	.xword	0x05eac38132782d05
	.xword	0x54b6e71b7d7e35fe
	.xword	0xc722cb1e004fd892
	.xword	0x0e7b5271844b6fec
	.xword	0x6e716b70609b336a
	.xword	0x44cf939842915779
	.xword	0x723ed571e77139f4
	.xword	0x488a8a458ce9740a
	.xword	0x6ca141b78a663c9c
	.xword	0x8c93d9e61528977d
	.xword	0x24304941e381444f
	.xword	0x1535d288a0325601
	.xword	0x494b6c7614e0a9ce
	.xword	0xc6b6d7e32ec7b4bf
	.xword	0xf752827b98792791
	.xword	0xecc9a296c2e39f9a
	.xword	0x0a7179b013eec036
	.xword	0x323977a909dfd3d7
	.xword	0x6261f76e77c3f513
	.xword	0xa29ba9c67a2bd814
	.xword	0xc2964ff02dc589dc
	.xword	0x3ecdafa2fe547002
	.xword	0x368f6e2c8ab42160
	.xword	0xb7da59b4b843e5c8
	.xword	0xbfdd67a1cdb5962d
	.xword	0x8dd136c572697667
	.xword	0x1a043dd56bb26b92
	.xword	0x3a22f9c589d974a8
	.xword	0xae7882e735095e77
	.xword	0x1b94dd9c987fe806
	.xword	0x8abb9051924bd329
	.xword	0x3afa6c840524d424
	.xword	0x603837ef40ae253d
	.xword	0x9ec82be8c41a331d
	.xword	0xbca31c7acfcdeeb2
	.xword	0x05e99b68b1e8aee8
	.xword	0x801385e7f635d80d
	.xword	0xd2fb70d791cf13da
	.xword	0x18f5a22737788eae
	.xword	0x45d78803dcfdb6e4
	.xword	0x03257860cba4d99c
	.xword	0x7004f3f1709ec9ea
	.xword	0xbcfd37581c2f4688
	.xword	0xec3d2f33ff7fa59c
	.xword	0x2258e1eccd15a2b0
	.xword	0x375afd180e4ad248
	.xword	0x549398ee89ec1c23
	.xword	0xe627287918e56da4
	.xword	0xc77500c72d6160dc
	.xword	0xb808a7d4e5e26929
	.xword	0x7b28f995c1337f34
	.xword	0xfa2acff07dea7eb1
	.xword	0xe59760036c9dda34
	.xword	0x0fba13335d749797
	.xword	0x3b882c2196e9957b
	.xword	0x114d0500ebcf51e4
	.xword	0x17fa150e175e42ee
	.xword	0x4bcb960636de1070
	.xword	0x04819cbef9b6efd5
	.xword	0x1985ade0006c3b3e
	.xword	0x1c8b3036e23a8f4a
	.xword	0x8987312d50ee98f8
	.xword	0x85d9061ee200271f
	.xword	0x65afd9cdcc2cb67b
	.xword	0xdfdf76520bb1f82b
	.xword	0xdfb7980226d16360
	.xword	0xb39db9ae7cd00e7e
	.xword	0xc27c0c89f8988a5f
	.xword	0xf2ed8aeca83ab5d8
	.xword	0xfc0b3fa9c5258109
	.xword	0x7a5b2c72c1f07f06
	.xword	0x654a815ad19d086e
	.xword	0x69a4ebec2d1d5d69
	.xword	0x67e69aaffb486a3e
	.xword	0xb91431783dd94c78
	.xword	0xdeefafdd7bbf68a8
	.xword	0x335368ff2c1a8181
	.xword	0xe274ce0afe29d48e
	.xword	0xa41da1c808c15d81
	.xword	0x10f776a0fe7b3458
	.xword	0x3a140190f10b8e53
	.xword	0x3e64dbffdbf0f1ef
	.xword	0x63b07c44f705e103
	.xword	0x04437ee4f0f2f829
	.xword	0xc2b5b6ee12d4a885
	.xword	0x2b964c62d8d14af8
	.xword	0x42454311457e8261
	.xword	0xdee870ac40eefa5e
	.xword	0xa3d892965b11f094
	.xword	0x7124c4b228b60c51
	.xword	0x86ebce0f36050a40
	.xword	0xa7c3dc353270fa51
	.xword	0xc7cbff8840311456
	.xword	0xc9425b235f539c39
	.xword	0xf5c65f4a2d18107a
	.xword	0x0aeb5464c8a0a977
	.xword	0x80ed5eb6cf257fc4
	.xword	0x1cec61697f511f50
	.xword	0xe6a87c9d23fa4d50
	.xword	0x27d9b821ff021837
	.xword	0xf0ba266a77b0f5f0
	.xword	0x6251c7c79ccf3f2d
	.xword	0x6aa0a08f37888943
	.xword	0xdc00b16c39fc3603
	.xword	0xf0bd6d0f8c2772a0
	.xword	0x84c1651a2acda403
	.xword	0xeaea103ea25da549
	.xword	0x0ee9e637d9bf3f9e
	.xword	0x7d5b51ec70904ec9
	.xword	0xb17e851cd1732b70
	.xword	0x1f8402dccb06f7c9
	.xword	0xddc7af8bbdeba997
	.xword	0x8e02f7c4e36bc8f1
	.xword	0x4336ecdf6fb3f875
	.xword	0x90920bb573659b8e
	.xword	0xf5f98c857f3b20ce
	.xword	0x8b21f822f0a9314b
	.xword	0xaa191ebe28c32a96
	.xword	0xa188775c890bc11a
	.xword	0xa81bd94c49f25c06
	.xword	0xfb13e053a32fd7f4
	.xword	0xbacbf17fb99503a9
	.xword	0x3740b98f5a7224b8
	.xword	0xaf4c49875ff85dbe
	.xword	0x66301aa4208c5da9
	.xword	0x53da94a21dad6be9
	.xword	0xccc9e8d7b13975ad
	.xword	0xb79e1037f787e084
	.xword	0xa90806ec966ef733
	.xword	0x2f74ed449f9d780d
	.xword	0x83a79b9c3b70318b
	.xword	0x89cfc3f81f46fc3f
	.xword	0xececfd664ae061e7
	.xword	0x9b8090c0141ee040
	.xword	0x51d707259bc6d61a
	.xword	0xca76c3645cc71990
	.xword	0xb770bf96ba04415b
	.xword	0xf903d0f9167fc1a5
	.xword	0xff51f6b0d8736133
	.xword	0xb07c6f531ac17676
	.xword	0xd0364f698a5b6dc5
	.xword	0x6c2c0873674ef504
	.xword	0xd4b6c06bfcc508db
	.xword	0xb8d291cfc330e0be
	.xword	0x3624b3a5c7091f9c
	.xword	0xe9a292f344921fe8
	.xword	0x46a79c8154b5100e
	.xword	0x6cb34ba94e9277de
	.xword	0xc684ab62ed08b0c7
	.xword	0x7619db0306bec834
	.xword	0xba69a98860d63c1a
	.xword	0xa0dee6a846b5450f
	.xword	0xa57bcaafb72a13a0
	.xword	0x86087b2052cf4f7c
	.xword	0x5d4c64b3bacc7ac2
	.xword	0x41807f92a258dd48
	.xword	0x7e35366f36c340b4
	.xword	0xf3d135195d8cbdf5
	.xword	0x6223c3203918498b
	.xword	0x50e485f12a5f9c87
	.xword	0x57d6a43feab1e0ff
	.xword	0xb37a95a58c080737
	.xword	0x6d13a84af26023b3
	.xword	0x1495f52e33443229
	.xword	0xa8f3fd80aa651930
	.xword	0x50a582afb9c3a4ab
	.xword	0x1994abf68753e92f
	.xword	0x022c2d9ba6250868
	.xword	0xa87212247434e80d
	.xword	0x3049a41038eb743f
	.xword	0xc5ee5995f11bd878
	.xword	0x910c1fbd9c77e2d4
	.xword	0xb11df18b00bb16c4
	.xword	0xed45c9fe6127c88a
	.xword	0xc0396e99b1b7f5d1
	.xword	0xa55eb6dce9c57517
	.xword	0x33b626d7087b03e2
	.xword	0x81ec40ebd76eb57a
	.xword	0x44de5538eb1c6530
	.xword	0x38cc4cc8f7505425
	.xword	0xfd422e9ef95319e1
	.xword	0xdeb847bfa50c2370
	.xword	0x00d01959845f6870
	.xword	0x26f77edfde035591
	.xword	0x42692e3181656bd0
	.xword	0xd4302110af3338d4
	.xword	0x0894ff3b9a079f44
	.xword	0x29d4fb8e5ae8bb4e
	.xword	0xff8a83e01687785d
	.xword	0xdad4713e92562242
	.xword	0xa568ef7b6ade1551
	.xword	0x510229e0eae63298
	.xword	0xf9ed80b82aaf317a
	.xword	0x6943b8e01c0b94dc
	.xword	0xd291c6208d2c260c
	.xword	0xd65fbc2e6ab9ddbc
	.xword	0xb833939dc7c58f6b
	.xword	0xe4e9358ae97b59fa
	.xword	0x93df95d74da38744
	.xword	0x110941f7378d1d92
	.xword	0x6525c1207f6acc17
	.xword	0xc5354c8a4f35a719
	.xword	0x635a3b19d51d2fec
	.xword	0xa373b18299721884
	.xword	0xcdbf9a127b2dcb36
	.xword	0x2debd28bf5b4d30d
	.xword	0x39b1a11b0a84f77e
	.xword	0x53a3866290248181
	.xword	0xfa409e4ebd5f78be
	.xword	0xf97606c798963600
	.xword	0xb2ef8df95e704a20
	.xword	0x78fd019626235773
	.xword	0x637c26f7347d7f45
	.xword	0x72cbce4d07540db8
	.xword	0x1918d64651a2182d
	.xword	0x2dadebae8c849ab8
	.xword	0x16f21ab3044967c0
	.xword	0xd94230de6c513d2e
	.xword	0x8e4f575a1d77a299
	.xword	0x98ac1bd4f70bf7b0
	.xword	0x9e0d188e1c5c9a23
	.xword	0xd2493d6dd6627472
	.xword	0x82ecde3cb5938cf7
	.xword	0xa24a0ab6525c54a3
	.xword	0x49dd8309aea276b9
	.xword	0xb45c982ecacd9a10
	.xword	0x53640768bede2a96
	.xword	0x9cc5cc1bb252a82b
	.xword	0xaeaabdfa22678520
	.xword	0xd6c0e5181a72c028
	.xword	0xab9cc62f5fee7a14
	.xword	0xd12b9511f2b0b318
	.xword	0xd873a72938340082
	.xword	0x4ea65a4d947bd983
	.xword	0x45938547789d3173
	.xword	0x4d9773a60199210c
	.xword	0xe1abe1b113559b5d
	.xword	0x225bea7123808ba8
	.xword	0xd68725eb9467450e



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
	.xword	0x64399ccd84959911
	.xword	0x89ecef40edcd335f
	.xword	0xeb369bb5615db21d
	.xword	0xf3bca7ffdd16eb55
	.xword	0xc739ec1df8192add
	.xword	0x84c1429f894fb7d3
	.xword	0xe23883d164348494
	.xword	0x2c31260ed87ed9a1
	.xword	0xaecb05401023dee4
	.xword	0x003751c00f83610d
	.xword	0xd5d03a4b6565ce9b
	.xword	0xf3eeef078ff3b126
	.xword	0x2f94c856096489f0
	.xword	0x5a387d49a3ce0b34
	.xword	0xfc00a398cca3ec73
	.xword	0x4f86756367260b96
	.xword	0x0a3fb666364d125b
	.xword	0x88df9bce27aca4b1
	.xword	0x3ace6471b03040cd
	.xword	0x20cc2812b75e5d65
	.xword	0x6402d5bb4638c9c4
	.xword	0xb0a10639a1c26df2
	.xword	0x0fabdc938fcd6286
	.xword	0xd10d93d486849ef7
	.xword	0xddb51bb376b9cff5
	.xword	0x756ecd2f71160579
	.xword	0xf4e0a5c2bdd607b2
	.xword	0xfd5f9cb6947ba0da
	.xword	0x21bac44fb23da76e
	.xword	0x8ae0fd01ce81db8f
	.xword	0x1fdc19abb74c6b88
	.xword	0x25a8a34f6bd55149
	.xword	0x9fd927e9f6f15faf
	.xword	0x8512be0f56f047b8
	.xword	0x6140a55438741e7c
	.xword	0xf06441d2d6438432
	.xword	0xec2bbeee8cff06df
	.xword	0x2084fa9a0c8f5120
	.xword	0x6aa5baabf5de0640
	.xword	0xce56a4c3472534ef
	.xword	0x14e3a6ef3bc21197
	.xword	0x0db7d4589fa38852
	.xword	0xd34c38e4c3ef3208
	.xword	0x597780b594dddb2d
	.xword	0xfc4a3b5d0c0017f2
	.xword	0x4eb4f69ae58d0404
	.xword	0x733510a6de633d6c
	.xword	0x6e8b80e8c46d745b
	.xword	0xccc58bd376b93dc2
	.xword	0x9b59e9d79699da2d
	.xword	0x4fa9785c209ed7fa
	.xword	0x5889b22165c10ec1
	.xword	0x25b8233c0a280b44
	.xword	0xfc9483c8c053ac2a
	.xword	0x6b2f05204278215d
	.xword	0xc89655c2d876a730
	.xword	0x27a3bf4e4a908ac5
	.xword	0x309837f74249be69
	.xword	0xf62dec717598f1e9
	.xword	0xecb5f6b1c9a3f476
	.xword	0xfa64cdd0238c5e59
	.xword	0xce899eb11dd3be0b
	.xword	0x753e2ee953f067b5
	.xword	0x47956c22930aae11
	.xword	0xc2448b50b583fe89
	.xword	0x003bcdd8dc6f188e
	.xword	0x8c1bdb13354bf38c
	.xword	0xe0e2d0e0e6cff89d
	.xword	0x52ca52f40ae45d4f
	.xword	0x7492ac5295f87fea
	.xword	0x82f2471e398a4b94
	.xword	0x64a84a322b90daf1
	.xword	0xe80db47f29fe8d45
	.xword	0x9e241eb24cd2fb2a
	.xword	0xfa954d8602dfd1b8
	.xword	0x7725dae08145a20c
	.xword	0xb1b8b47edba4b8cf
	.xword	0x4f0177bd057c98c4
	.xword	0x9748981240e15368
	.xword	0xf9a9c2ce4622d84f
	.xword	0x482d4e2cd6fe75bd
	.xword	0x67d9427c0c61af13
	.xword	0xf0456e0511eb06e6
	.xword	0x208111cda47991f3
	.xword	0xb87c51288863074e
	.xword	0x383b98beea27e871
	.xword	0xcbe0077ad836a2fa
	.xword	0xab053732b89b11bc
	.xword	0xbb7c018c3070d674
	.xword	0x33b58f65c0a88095
	.xword	0x525f013a70cef5ce
	.xword	0xbecf2fba65269d80
	.xword	0xf9d5f0b8e7e35c6d
	.xword	0x1e6f41bcc4d6d2ef
	.xword	0x8f643e6f76c60e84
	.xword	0x05ce6528b58a390e
	.xword	0xd43ce3c7b435c289
	.xword	0x841a9c830bc6210b
	.xword	0x007c88384bacbced
	.xword	0xbe3b97e55a8ec69f
	.xword	0x1016c03be6d45a37
	.xword	0xe60e550074ff013a
	.xword	0x3275af32e90f5687
	.xword	0xc75d4b54fce68ef4
	.xword	0x08eecc45756bea5e
	.xword	0x1d7341c37d18bee8
	.xword	0x2e3e3bf5a575c61d
	.xword	0x1de35e3c06f0dfbb
	.xword	0x0030531b10624bb6
	.xword	0x512a80501343628d
	.xword	0x7de9835d14845786
	.xword	0x4d7f6aec1181c68d
	.xword	0xf779b114f03afe98
	.xword	0x688574ac4b57e8f4
	.xword	0xb9a9b54ad7ea5b4d
	.xword	0x455c59e4f7669558
	.xword	0x965c8815a3e5f8af
	.xword	0x9da45b9c626c4d57
	.xword	0x6629c299cc0ada3d
	.xword	0x685f2c640ee725ad
	.xword	0xb9e0466acb9a2137
	.xword	0xf77ece33dbb8c517
	.xword	0x1f98cca08ae577da
	.xword	0xe8f40b8cb9e2299c
	.xword	0x47a82a4f1a3b624c
	.xword	0x3240c1ef9d6f49fa
	.xword	0x32dce7e824a1aa78
	.xword	0xf5816ff59cd1ddfd
	.xword	0x3e1dcf1c4662e421
	.xword	0x8470c3189715444f
	.xword	0xb2f889f534410d1d
	.xword	0x17d2a55e5de5dc7c
	.xword	0x79aac5cb8a267973
	.xword	0x579ba3a3dc091f16
	.xword	0x67237abba52b60f8
	.xword	0x889dd4c46d71e350
	.xword	0x88d198152cd6011e
	.xword	0xe36ce9392473d308
	.xword	0x956506d36d480222
	.xword	0x329751290e008b93
	.xword	0xc893106d440c9fa9
	.xword	0x9e2272d94a733722
	.xword	0x73e9ac988e779c82
	.xword	0x9aeb35bf811b8132
	.xword	0xfa087a8108894aa9
	.xword	0x3a1eb890912ebc14
	.xword	0x3f3484e080c04a4b
	.xword	0xbb4b0307102b07c4
	.xword	0xddf058623d396713
	.xword	0xe7a0992598294d42
	.xword	0xb649ee4c6106723a
	.xword	0xc89d950e9f3cbcb4
	.xword	0x43f53144d59a8d71
	.xword	0x6299c4c233f82566
	.xword	0xd5c66cdcce328420
	.xword	0x3bc815de566bb4e5
	.xword	0xad546feb03acf61e
	.xword	0x8712f04e29abb224
	.xword	0x3dfe1913c2f08ea7
	.xword	0x4d1ece941702f83b
	.xword	0x2603e09f8fe1cdcf
	.xword	0xe1173c2eb9fb891e
	.xword	0xaf63cf22138f2d23
	.xword	0x52a98123ac33676f
	.xword	0xdbcff2c1e3d462d7
	.xword	0x1be967fcd2445e17
	.xword	0x1a79b32b0f64b692
	.xword	0xd679fcb03847cb85
	.xword	0xfd5d8cabdf69e377
	.xword	0xec509298e6fde424
	.xword	0x898d66df7a21c7de
	.xword	0x9780a5ee958448bf
	.xword	0x5a6ea9ad3809715a
	.xword	0xac46acb06581b978
	.xword	0x0eef6b1332e64640
	.xword	0xe0d465a8dd5080de
	.xword	0x2f5f58c7c7ad0e3b
	.xword	0xc86146624cb634b7
	.xword	0xf442159bf6291067
	.xword	0x64cd04d0ace62e00
	.xword	0x8633acd2e054216e
	.xword	0x85fc3ce722f0d8e6
	.xword	0xe85c621be376552a
	.xword	0x86e5493cfe92d5d2
	.xword	0x31ef81138df5f91c
	.xword	0x1ff95802c29a6900
	.xword	0x34449c43b1b48981
	.xword	0xa63bd24388f339b8
	.xword	0x56dcfd7c6787a624
	.xword	0x6658037c92280c44
	.xword	0x8d0670cb1e0966e7
	.xword	0x42239520cbe34ae5
	.xword	0xce4d23f4feb8f10a
	.xword	0x6af160957bf3ba1e
	.xword	0xce58363e45acb118
	.xword	0x6d6ea9776054fd1d
	.xword	0x856b1589dc85722a
	.xword	0xc5e4ae109ed95650
	.xword	0x0e2e6f015aaae070
	.xword	0xe5616028d5d12db5
	.xword	0xd3ec15fa8a5a58b4
	.xword	0x0f09a949635288b4
	.xword	0x8a252c5f58a822ab
	.xword	0x26b4cbc118e9e354
	.xword	0xf7e71c5dacfb0863
	.xword	0xc98d932a24c2c6ac
	.xword	0x0ccf898b9c1abb05
	.xword	0xfa0d6c6dce37e814
	.xword	0xe342458d0f1b18bb
	.xword	0xa7a5d94e509f739a
	.xword	0x3e6802bd0edd590c
	.xword	0x8503eae5072bfd60
	.xword	0x930c5ca77079ba34
	.xword	0x68534cb3b40eec96
	.xword	0x9cedcb2d4f6b5d89
	.xword	0x30700e0dccaaca29
	.xword	0xed77732226cb2e2e
	.xword	0xd71f741e3ec38aeb
	.xword	0x458db9cf420ddc25
	.xword	0xabda0e47dcf6bfad
	.xword	0x3f8faa341e91c252
	.xword	0x98f5aa2b7c16397c
	.xword	0x46e6cf27a59db498
	.xword	0xd9aafab4c23dcc75
	.xword	0x6ea57e9344af633f
	.xword	0xcdd004c1b668b531
	.xword	0xafa7e120d7bda4d5
	.xword	0x844526e3309c247f
	.xword	0x65cbe821870c7b2b
	.xword	0x7bd5638b95cc95ea
	.xword	0x19e122dc5c500c64
	.xword	0x40904ae89779db89
	.xword	0x480c23d01a0a6963
	.xword	0x25b3aa0c75178bd0
	.xword	0x0d16d1c7518da137
	.xword	0xa635962725e51165
	.xword	0xd471843dd6fed7cb
	.xword	0x1cda75f096a7bfad
	.xword	0xd6179b030834603d
	.xword	0xc31da45d24d3e4f7
	.xword	0xbddb268ad93c197d
	.xword	0x1c6553c7782772d4
	.xword	0xac2e9cad11eda97d
	.xword	0x08450ed7bda3e631
	.xword	0xcdb14ff806459a08
	.xword	0x52a5bf834012c723
	.xword	0xc34859067080da0a
	.xword	0x6d7f431b5fff62ba
	.xword	0x52a6e3a2de1765f7
	.xword	0x70151a546656f17b
	.xword	0xfae46efe1cc9dbb2
	.xword	0x480024a1bd2c1ae9
	.xword	0x48597bc5849d46aa
	.xword	0x3e3dc53f143d6e34
	.xword	0xb4e08da8a8d443d6
	.xword	0xdc72f88d5a6cd8a2



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
	.xword	0x94c66889cfa3e37a
	.xword	0xcac2283e37ae41e9
	.xword	0x4e45211da61f6237
	.xword	0xba93e6ba09f18821
	.xword	0x79e83c43ae77cfe6
	.xword	0xf168c5f951de680f
	.xword	0xab98de8f8e6da965
	.xword	0xd46631e7b942e8e0
	.xword	0xaa60ddf0b569287f
	.xword	0xdf83049eafcce48b
	.xword	0xa8926886d62ad85e
	.xword	0xbbf41f8de0bfcd3e
	.xword	0x5b29c486eea4954c
	.xword	0xb349beaa9acdc395
	.xword	0xf191b0a7b6e8aeac
	.xword	0x77133b9bb29d219a
	.xword	0x0879ce403bdb4537
	.xword	0x4b07d09da4f526cd
	.xword	0x1268abf5f178f347
	.xword	0x1d79f4d9fc1a4193
	.xword	0xf925cfc431fe853d
	.xword	0xcd3733a784e4c3e5
	.xword	0x0b41895dc9cd1e55
	.xword	0x73b314b43a59e9b2
	.xword	0x5d7baad209e56aa2
	.xword	0xd991b76aec1daf2b
	.xword	0x3f9d4fb204dbcd61
	.xword	0xc82d7b9949e2d262
	.xword	0x436ece0c816b8559
	.xword	0x5da7986d51b0ac15
	.xword	0x927e8499540a2e69
	.xword	0x32d2f2cb2dce4e24
	.xword	0x1def79078de0ca50
	.xword	0xaefeb91cc99ff1d1
	.xword	0x3ab07410a58bdf8f
	.xword	0x792ddcaa34de7224
	.xword	0xdf408d1e2c66edb5
	.xword	0x5415216e8483a59f
	.xword	0x5e51723cc2a94a8b
	.xword	0xaeaa7c9c55ba10ad
	.xword	0xc4a3a8a05eb5d874
	.xword	0x71b038d02295b5c8
	.xword	0xb5f3fabcbd3afc47
	.xword	0x90f92cb22f7b1f9e
	.xword	0xc25427dbfa41118d
	.xword	0x5d8519d4bab52843
	.xword	0xa65d38284eb75e48
	.xword	0xf3a962ac3f76318f
	.xword	0x592898407861928d
	.xword	0x04d1fa3478b1b32e
	.xword	0x5f136f6c7d4e0063
	.xword	0x6338881e6b993092
	.xword	0x6779eaeb08f025e9
	.xword	0x04cbd5c310453f05
	.xword	0x8893b3af1022eb6a
	.xword	0x9a2630572dca6fae
	.xword	0xef14b40daac294cf
	.xword	0xfc970e66bb457b15
	.xword	0x8007c5a56e8246a1
	.xword	0xc078db0d5745bdde
	.xword	0x4869a072927523be
	.xword	0x93ff9c4b2fca3088
	.xword	0x6c9de3ae392c32c9
	.xword	0xde7de27f725dc7fe
	.xword	0xed18ee65aabdcda5
	.xword	0x4a184abb49adcb1f
	.xword	0x4280e3ee93cd8942
	.xword	0xcb64ba8a68febef7
	.xword	0x61d5119dfc718c46
	.xword	0xe42488ada1bd8b5f
	.xword	0xdddffe1954285337
	.xword	0x4cae24eb351bfaf0
	.xword	0x2ca95def552ce387
	.xword	0xaa8b8902f62adb34
	.xword	0x8ef041c598544f06
	.xword	0x25bc114e7b3ec70f
	.xword	0x29baf29b2952f0c7
	.xword	0x327447806d8bc235
	.xword	0xb65159c6314b33b0
	.xword	0x39905085a3ee7fbb
	.xword	0x94935d903e2eee31
	.xword	0x79d602d32b7370ef
	.xword	0x40cecd6bb01fc283
	.xword	0x1695d8ac3d126b67
	.xword	0x2ab856fb4316b694
	.xword	0x21355ce006de4c6c
	.xword	0xff4c9d441c34bbe8
	.xword	0xc029666cee705217
	.xword	0x4749f864dd10a8fb
	.xword	0x439b5bbe9eab21ff
	.xword	0xf73039fb132efbde
	.xword	0x01469dbb8fa2cbb0
	.xword	0x7f56384cc3256315
	.xword	0x2929c5b2b3097924
	.xword	0xf42cbad04a3e1f93
	.xword	0xf78b30b7a9ecd52b
	.xword	0xb45fad5bafb684ca
	.xword	0x7eccafb05722cf20
	.xword	0x32ce8b1ce1a808c6
	.xword	0x2294cd6e967ede94
	.xword	0xd74cf81159c0506f
	.xword	0x84d851d5b01de79e
	.xword	0x30e781ef40f3168d
	.xword	0xa31f7bf0c7a76fe1
	.xword	0x20b3c5dc38214093
	.xword	0xf9d28f342f807b9c
	.xword	0xc0ea486454e494a2
	.xword	0xf7ce1ba2ee5bf4d9
	.xword	0xc6323c5eebb77e27
	.xword	0xd3b56702b16fbc3f
	.xword	0x18a25bc92cad7f39
	.xword	0xc4bf1e9e25d3f792
	.xword	0xc9035b069b461c20
	.xword	0x8831b811ceffcecb
	.xword	0x8a655c344dabad9e
	.xword	0x592f393683950561
	.xword	0x94d6251a901db282
	.xword	0x5f394fa7f481fc2f
	.xword	0x166dddfd9bcc351c
	.xword	0xf01059106c2d656a
	.xword	0x2252585483c54eed
	.xword	0x79adf136ea041272
	.xword	0x206a38b0b1f07d2c
	.xword	0xbcd842b582e3520b
	.xword	0xcf4b5d14edae236f
	.xword	0x4d9cf76654fe0573
	.xword	0x0a1c4a4cd67d6418
	.xword	0x9d51038a61ee6118
	.xword	0xa7801e3194146d6b
	.xword	0xe2ee69bf686f7e0e
	.xword	0x984e0e7c852cff43
	.xword	0x1c9c9bb836cfc6de
	.xword	0xdf6d6d951a4ab6d0
	.xword	0xb41df9c081a85c45
	.xword	0x2e334eb8928ecf09
	.xword	0x3f8ddef5eaafe565
	.xword	0x775402e69764804d
	.xword	0xbca0e31b184b34c8
	.xword	0x4c1730b34a1918ed
	.xword	0xe8870d6dac6db82b
	.xword	0xd5b713d2bff21cf3
	.xword	0x630922ebe6ce346f
	.xword	0x96181abdfe54503a
	.xword	0x48adc398706f63f4
	.xword	0x959445f91ffef1ae
	.xword	0x111f59a62eb5af63
	.xword	0xf7b4cb0eadac9035
	.xword	0x1cc8e9281c67a2f0
	.xword	0x75a6dd3aea391b6f
	.xword	0xd73c913b83b5ead0
	.xword	0x1c690a5f1c79202d
	.xword	0xfb67cdec8387df18
	.xword	0x10ed7f67fcd8710c
	.xword	0xe6d9c89e8b573e91
	.xword	0xf03e02bf967776a1
	.xword	0x3fccccc4b427411b
	.xword	0x81c86ecffb93caeb
	.xword	0x8f239783fbf2e1dc
	.xword	0x81d9dff252f63e24
	.xword	0x8f0a07b7ac0c791f
	.xword	0xd39942ecb32e7c37
	.xword	0x4cf0b8e4448a7652
	.xword	0xc23f65689055d534
	.xword	0x5937c0981c1c984d
	.xword	0x4a87c7c02c8874df
	.xword	0x35040de311d23182
	.xword	0x804343191b330c8e
	.xword	0x65c988f22c9cac2c
	.xword	0x18a69000932057af
	.xword	0xc8db22acd7d0b222
	.xword	0x6e6076e90e4b31ba
	.xword	0x810747c418b52e24
	.xword	0x7dec6a4ed3e91f9a
	.xword	0x504d8a2762818369
	.xword	0x91328e6c72c2bb69
	.xword	0xdf34db16c36f20ac
	.xword	0x69609e55ff118670
	.xword	0x54c50d9c03c0b9d6
	.xword	0x2d1461fc5d65bc3c
	.xword	0x1f0f266eee8f533a
	.xword	0xa856fd1122ba9624
	.xword	0x2cf63a37b8d45be3
	.xword	0x465495fa8d4910fa
	.xword	0xafb662b1e02c466c
	.xword	0x2c98f45396561f7f
	.xword	0xc4615068be897400
	.xword	0xfc5781f5b554c92d
	.xword	0x3d2f7329c8271230
	.xword	0xdd74e443af5b87f8
	.xword	0xf153addefbddd8f4
	.xword	0x8503a51ad2b072ee
	.xword	0x8313214e06036a8b
	.xword	0xc9fc4a2cc34fa61a
	.xword	0x29043e22c277cbc4
	.xword	0xc8370309cdb3a8ad
	.xword	0x95fc90bd7c1d8e6c
	.xword	0xdc9621543289d2f1
	.xword	0x642d55e65d4a01a6
	.xword	0xbdea151fafa95d6e
	.xword	0x53e3b05bfa2f49b5
	.xword	0x821e441a38e11f70
	.xword	0x178f696ab9c74457
	.xword	0x22168eb2606c165f
	.xword	0xaff5c10174820fdd
	.xword	0x028e48d1037a079a
	.xword	0x6299d08de0bce5c8
	.xword	0x610935e21ddfc20e
	.xword	0x121e108f0f7f3d8f
	.xword	0xa9eb58b4fd56f997
	.xword	0xf27158e1fb030561
	.xword	0xc95e16aea8612ae3
	.xword	0x3c7c7caf145eb067
	.xword	0xaad6c382ee70d9ce
	.xword	0xc961608d6762d4ca
	.xword	0x051e4f0a63050d47
	.xword	0xbf873941364285a0
	.xword	0x4c3c75dd882a5883
	.xword	0xd040aa754021103d
	.xword	0x48852dc8a9c309a8
	.xword	0xfea9c982fc28bcee
	.xword	0xad7c594e2720dfab
	.xword	0x42db9227154f2914
	.xword	0xa0468ac3e941c35a
	.xword	0x77e735d035b39c42
	.xword	0xdd8f94abd44fb619
	.xword	0xc9ca4e2fc5e6b2b5
	.xword	0x5d5e99b2909a0f19
	.xword	0xf1329ad4bfbc1607
	.xword	0x83245f76f8b3859b
	.xword	0xba977968328d51af
	.xword	0xb31eaa500a011606
	.xword	0xd9ff55461cdfdad0
	.xword	0x7386dad44faa74b9
	.xword	0xfa8b7ce93b9aec46
	.xword	0xd0fd5d0136ff6d20
	.xword	0x496f825bfe3112f8
	.xword	0x40620b92741d4cc7
	.xword	0xc683457e36559c69
	.xword	0x13316fcf3baa69e3
	.xword	0xf42851920151e96c
	.xword	0x9813ef30e2605881
	.xword	0x27a8889723f1fe88
	.xword	0xb446f0345e2a92d8
	.xword	0x0dba4559263c330d
	.xword	0x75b6690051397097
	.xword	0xb3c2298206dd7bde
	.xword	0xc73c92e6e4500836
	.xword	0x2ff17d1ca2346d83
	.xword	0x74f159b26aecf97c
	.xword	0x7ecfdf025e1fc750
	.xword	0x2568b09689e96f0d
	.xword	0x722fbf354a88c3a2
	.xword	0x282c6e09b4fecc2e
	.xword	0x2a2153bc71dbb782
	.xword	0x83da3855f36c4f38
	.xword	0xb0dabb8c81a77399



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
	.xword	0x721f64b642517d8a
	.xword	0xb4c27fef3512d4ca
	.xword	0xd9a0caa2e87b1803
	.xword	0x132984c22e63fc10
	.xword	0xb627816aae5385d8
	.xword	0xd782c26932b20246
	.xword	0x176f96cf3fd0f779
	.xword	0x29510aa7f37b64b9
	.xword	0xc19d32236e32578a
	.xword	0xce2c0df4d9731897
	.xword	0x4e8f8fd1bc868b9c
	.xword	0xc6936d4ab96c04e8
	.xword	0x7805edbe753ef602
	.xword	0x56ef867629051169
	.xword	0x2e64dd9a84d81581
	.xword	0xfcdf13f0d83063d3
	.xword	0x9bb6cf2f5d1630a4
	.xword	0x93dd7154c27adea1
	.xword	0x09ea1ed397b1c65d
	.xword	0x05491aedd2bb71f6
	.xword	0x3ca2e934791e4f1d
	.xword	0xc35146fbfcbf148d
	.xword	0x9a0d5beff9de643b
	.xword	0xc1a6c72d9d499b3b
	.xword	0x9b435dda0f2e479b
	.xword	0x3017a3594a22195b
	.xword	0x4e722c0ecef21933
	.xword	0xac296b201069c72d
	.xword	0x94d02453ede38b7b
	.xword	0xa1618e6c81aae665
	.xword	0x64ae4932fe194d0e
	.xword	0x7c2f0f45fdff03d7
	.xword	0xbdd5a66e697c094a
	.xword	0xa43fc415f19f7b19
	.xword	0x258e718a43054d05
	.xword	0x9dbc32bfd7351e14
	.xword	0xf02ae7c2a3da7d36
	.xword	0xe8e7b312374c23ac
	.xword	0xd28502c72aa8f31b
	.xword	0x98b96293ab435835
	.xword	0x26f857717df501dd
	.xword	0x949e824c56672e47
	.xword	0x8db0baa4079604d4
	.xword	0x3c2e60c3be0c0dfa
	.xword	0x7aa2dfc19a59d3f3
	.xword	0xbe0848d76c1034a4
	.xword	0x317d7eeb21d467e1
	.xword	0xe075cdc150ea3fb7
	.xword	0x86065d494c349eef
	.xword	0x2472f2b5f740c735
	.xword	0x03e77eec3cdea6a1
	.xword	0xd77c9f12010495b8
	.xword	0xc55879aeb2bfb4c5
	.xword	0x0af8ff2522645e7d
	.xword	0x1fd36f559aabb307
	.xword	0x74da91bc0af65458
	.xword	0xa2326074ff8d49d4
	.xword	0x346de5d92ffddac1
	.xword	0xe0fb238e81360532
	.xword	0x719d0674bd1d3a5b
	.xword	0x13b42648840fbfb6
	.xword	0xd26714d9dca4c7a1
	.xword	0x141f986f02a6f6b4
	.xword	0xf8428745456db7f5
	.xword	0x96a18a1c733319b9
	.xword	0xa2b1925185f6ed32
	.xword	0x2731591b0ead7909
	.xword	0x1f8d90d01dff4506
	.xword	0x2777a04e207b94a7
	.xword	0x0391cb976669e4b0
	.xword	0x31772308655f73af
	.xword	0xa7f8a886db47e7f1
	.xword	0x5bbebea206018438
	.xword	0x0d7c0fdf50a3f894
	.xword	0x792ee60883096662
	.xword	0x253fa714a6cc5ccc
	.xword	0xa3bc6ca694a70c22
	.xword	0x496c9f954000b7ec
	.xword	0xbe63205068a5722c
	.xword	0x224f1f0243248b37
	.xword	0x40876e23e2e19ef3
	.xword	0xdd81dfc1e5ff4192
	.xword	0xacc9c80211d17c57
	.xword	0x921fe58b57cb7ade
	.xword	0xdcc79ac526d20069
	.xword	0x3c8017ae3dc29711
	.xword	0xac7023f13fd537d9
	.xword	0x211cc368fbe9315d
	.xword	0x2077add2822fcce1
	.xword	0xcb88433059effe01
	.xword	0xaebf49c4f359ee12
	.xword	0xa39bf19f79848796
	.xword	0xf0858f39b96967f3
	.xword	0xdf68ddfebdc41fa9
	.xword	0x5b40b63fd71402dd
	.xword	0xd2cf7718179ed7cd
	.xword	0x0a531b16078f5c3f
	.xword	0x6fe45befe63aec43
	.xword	0xa11060c36ca7d171
	.xword	0xa9a74034853c6be2
	.xword	0x90486b5f601b7029
	.xword	0x4d005fbafaee978d
	.xword	0x3aee213f736a117a
	.xword	0x840cb8f3df53e06d
	.xword	0x256e6ee6894cf5bb
	.xword	0x9b27cae36a0f9cb2
	.xword	0x77900378edeea17c
	.xword	0x7e49fa6c15453dd3
	.xword	0xa894814b8cb761a2
	.xword	0xc883957e6fb3f2f1
	.xword	0xfe9d389c6d52e536
	.xword	0x53d7909a68b8562e
	.xword	0x4d2bc9bea3455f32
	.xword	0x735552b3df16e73e
	.xword	0xe06d1ac59b814c9c
	.xword	0xea7b9b7a5aabe423
	.xword	0xc4a0cf26e1970b2f
	.xword	0x02ce1e055071f5a9
	.xword	0x6b5afafe8c9212c8
	.xword	0xda71c826ffd07232
	.xword	0xef3910f8136cab19
	.xword	0xecd44a59966ae572
	.xword	0x7d317e2fad86195f
	.xword	0xdee8795c5dfd7770
	.xword	0x8becf73a4683e514
	.xword	0xd4edead3df581283
	.xword	0x849a7b357961fbb3
	.xword	0x93306ba8a8b8d2a7
	.xword	0xe9720455bc2877b0
	.xword	0x465cb1fdf8bb3c36
	.xword	0xc525b797e4a8fb71
	.xword	0x84971dcacf6cc155
	.xword	0x6060381878d0a2f5
	.xword	0x1765258c7eb8a292
	.xword	0x607b720cc8f9cf8d
	.xword	0x31601c82d966a88d
	.xword	0x2cc104b1e04fbdcf
	.xword	0xf4ec7aece4f162dd
	.xword	0xbdbff1af320e0b07
	.xword	0x78159abb57600f4f
	.xword	0x76165584cdf7643e
	.xword	0xc319f36d061457a3
	.xword	0x3ed4dcc766c70636
	.xword	0x298d4ddbda648a4c
	.xword	0xc91a0710b6cdb0b2
	.xword	0xf6635972c60b45ab
	.xword	0x435d3ce468aa1b2e
	.xword	0xbca238887010a08c
	.xword	0x36e7d84abe28c5c9
	.xword	0x5dd7b83044c3ae73
	.xword	0x8329c2c10d6febbd
	.xword	0xdadc97886e1fa6cb
	.xword	0x57525ddddb09c618
	.xword	0xd7b494ddb38283a0
	.xword	0x57991b2742f0b5c9
	.xword	0x57bf0e1892b5f303
	.xword	0x7277c983773e15e5
	.xword	0x2b1bd8c573c37743
	.xword	0x0016ad2cd1f03d21
	.xword	0x430141c05fcf7e99
	.xword	0xead068d689ce94a8
	.xword	0x2a4376e40ee3d1b9
	.xword	0xb0b9ca7285b466ee
	.xword	0xd9f9ec227e92baa1
	.xword	0xb612b590d66df228
	.xword	0xf4c81e41cd084523
	.xword	0x3d03bdce331d1fb5
	.xword	0xe9d20aac437e0d8c
	.xword	0x31c44fabaee13e0f
	.xword	0x9d4ed0d61a692187
	.xword	0xbee02e8f44251c28
	.xword	0xe460167e515910a9
	.xword	0x60793cc2755d8ee4
	.xword	0xb5979a961231d6fd
	.xword	0x9c8eb199cada49bf
	.xword	0x0937a484a2a07987
	.xword	0xd2d565f3ad9c1551
	.xword	0x6a9977e290720f84
	.xword	0x26261d5d32322795
	.xword	0x314e58304e494031
	.xword	0x39d96dc226bf738e
	.xword	0xb848f8ee38548e8f
	.xword	0x7d10c6841dc35057
	.xword	0x535b9ad7386b6135
	.xword	0x7aab2244b809cb8e
	.xword	0xbb1b9ebda37f48d4
	.xword	0x81e4c0f4b4f3d07d
	.xword	0xf233765e0fbf2424
	.xword	0x726763580b41dd06
	.xword	0x893796ba0350dccc
	.xword	0x300899471698d324
	.xword	0x9aa23eb36d25d351
	.xword	0x11878eafc052575f
	.xword	0xd3656bd2c4879339
	.xword	0xe04f7a61e70c23a9
	.xword	0xde7af10c690edb65
	.xword	0x9ba618e4dd2e03bb
	.xword	0x1288bb536bfdf53a
	.xword	0x3be819dbbfa9d6fb
	.xword	0x4dc85c8b5f1f6689
	.xword	0x3e256bc591555d4b
	.xword	0xe979b7d1a98e8d3f
	.xword	0x54b3dbc098c9ad55
	.xword	0xc115c4116477fcd4
	.xword	0x6eb495993dc13c78
	.xword	0x4ca204b1c3522894
	.xword	0xc70f3170e0b714d4
	.xword	0x12fdb2f919910756
	.xword	0x163e06e34e95ac2c
	.xword	0xbb7394057792a292
	.xword	0x47d34e2dfa36bb21
	.xword	0xcae80bfbe11a005b
	.xword	0x2b02ed735b0daf3f
	.xword	0x8ac8073509fb620c
	.xword	0xfaf8e8937910c8bc
	.xword	0x4342048c4adbccde
	.xword	0x579fa9c320a177aa
	.xword	0xd08532eb292c7bfd
	.xword	0x44b442f776efe6cb
	.xword	0x49158b5bd2c72f70
	.xword	0xea4107accbf57fa1
	.xword	0xd1d4453e30d4859e
	.xword	0x9ef5b9f7f3057bb8
	.xword	0x495e3c0f52afd99d
	.xword	0x4f9bd01e16c343c0
	.xword	0x42d55ff90139c19d
	.xword	0x03f0e6757c9f9735
	.xword	0x6d558594c91f1e17
	.xword	0xd78e7b6490d87401
	.xword	0x94fa6aa7dc279204
	.xword	0xe0c8a897b9b1b7cd
	.xword	0xf0ad3c4db8575dd4
	.xword	0x12f1d313ceb88cd0
	.xword	0x20d2a5e3bd17bb1b
	.xword	0x3fbf3181d487c8db
	.xword	0x7376f0186eb53a90
	.xword	0xd6844516bff229aa
	.xword	0x342b3fe9d5ac8764
	.xword	0x67cb275f3c0ee2ef
	.xword	0x29caf046621f72aa
	.xword	0xff8ef61a39777852
	.xword	0x931ac04e810d6348
	.xword	0x9d8303cdb945bb23
	.xword	0x8ac20ae1f26d569c
	.xword	0xea4e3cb2fe183e12
	.xword	0xce854737fe06cc4d
	.xword	0x136921b724429711
	.xword	0x46444ff3af641179
	.xword	0xf28aa6d51e3a98eb
	.xword	0x7c16545f9403f007
	.xword	0xf1a268ee61daa638
	.xword	0x8a8e585fb26ff307
	.xword	0x07f91269827491d2
	.xword	0x88eb1fd46a54af5f
	.xword	0x7f8f9f2d91b14330
	.xword	0x322739378b3cac33



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
	.xword	0x2e8e18d8926fc7c7
	.xword	0x1c6bc6edd0ea3b24
	.xword	0x676f4a787f061d38
	.xword	0xb68aa70edfe46b43
	.xword	0x2b276a15bd5bb66f
	.xword	0x3573ee42cea488ff
	.xword	0xf88223fd83e4a639
	.xword	0x8ddaf27e57012c05
	.xword	0x78b2f02ca8cec191
	.xword	0xad397b518026974d
	.xword	0xcd936788c8bb22c7
	.xword	0x86207b8fccef0254
	.xword	0x51808f56d7c9b795
	.xword	0xf03f70b702cc52db
	.xword	0x3e5f9574da9fe2a4
	.xword	0xaaffa08f87b62206
	.xword	0xe09bfe95e589f82c
	.xword	0x588dc0f21090cce1
	.xword	0x1ace8ef0ce38714d
	.xword	0x8c86e5b8f16c14c7
	.xword	0x3f92272086fe99bb
	.xword	0xcdc681c9b2d1c2f5
	.xword	0xb3b408cd23b3dcc7
	.xword	0x8048c7ef8c549c6d
	.xword	0xb3e8d2e66efd5540
	.xword	0x9e9fe3d2596a5a7b
	.xword	0x2857f6254342bb67
	.xword	0x4b10d3169dced42e
	.xword	0x528a90fca40adbb5
	.xword	0x6b775d6ebff646fc
	.xword	0xedbfa0ac108e3a94
	.xword	0x4d1103c6ff214045
	.xword	0xeb545df7f0b2a547
	.xword	0xdee2de60f62fef91
	.xword	0x4ac7c562809d9c29
	.xword	0xbd8470067d4e5043
	.xword	0xcf1739e28ac7deee
	.xword	0x70a6317fe958836c
	.xword	0xc65d54dadee6c728
	.xword	0x0d19bd15c43dc142
	.xword	0x770eb6033043da94
	.xword	0xf485c4b44a970fd7
	.xword	0x65a7a3ad7c14d8b2
	.xword	0xb1177255055bf231
	.xword	0x34d21e9cf7b9653d
	.xword	0x362eb163ece6024d
	.xword	0x6703eeb260fd9d5b
	.xword	0x7f2e34ca217723c9
	.xword	0x189e11e67356439c
	.xword	0x97bd0ae61eeee867
	.xword	0xa498fb2effb13847
	.xword	0x947673e7367b1f9d
	.xword	0x529abe04e3be405a
	.xword	0xcb80ec034752763b
	.xword	0x21ec76eed3ee2218
	.xword	0x868b62b360ef0281
	.xword	0x693aeb72d1ae62bf
	.xword	0xd44c7cc49fd76ceb
	.xword	0xbed00d2606a3acc1
	.xword	0x885f14fd1b146a83
	.xword	0x27f73de8dd11eda3
	.xword	0x443b97c1bcff8530
	.xword	0xeb6191917407b82c
	.xword	0x5046259fa0b8224b
	.xword	0xa4775a6727d4e00b
	.xword	0xc6c97bcf2f4deb77
	.xword	0xf4427d1073b774ed
	.xword	0x8cf64bc469a7f88a
	.xword	0xa7f09af3bb69f91e
	.xword	0x70d81852efc92359
	.xword	0x6d10f3454d6312b3
	.xword	0x7d1ac24db5b51569
	.xword	0x03b92154ad7939f2
	.xword	0x229973078d586b55
	.xword	0xd0ef381b4b67ce1f
	.xword	0xa1951627de7a2326
	.xword	0x1c4f2c58b3f113f0
	.xword	0x60ab755728a9c7be
	.xword	0xe225ae06fc3ebb34
	.xword	0x7ea390c91a7526ad
	.xword	0x0a96bd247f198e88
	.xword	0x135bd4ce649f528d
	.xword	0xcfac36dc213df468
	.xword	0xf319510b9c95d8ea
	.xword	0x7beb55c718dd5439
	.xword	0x7cc1923417f886c3
	.xword	0x36260808369997f1
	.xword	0x6f97e9ad541fe5a4
	.xword	0xd66e3f9b62af8c18
	.xword	0x4448d39940478881
	.xword	0x6d8f38e4dce20dbb
	.xword	0x3e64cea557de087d
	.xword	0x58663c9ea3901379
	.xword	0x1a2b03fd3b052392
	.xword	0xcb113145552fe16c
	.xword	0x0b9e02c269656cf9
	.xword	0x96696822f102e6fa
	.xword	0x7122af9563e9e84a
	.xword	0x56b002062d522fce
	.xword	0x87f4449310ccf550
	.xword	0x3cc15b1042adf064
	.xword	0x0a2848d640cd0970
	.xword	0x96e1f3ac95a2595e
	.xword	0xb4555545974fe7cb
	.xword	0x1aef90c7295c12c4
	.xword	0x38cdccc73dbf0c12
	.xword	0x9135d94b28a759ff
	.xword	0x50f164f4dff43ac4
	.xword	0xd3481f795871dff0
	.xword	0xbb8f874a1c4d7f96
	.xword	0x6a60edc808f3926e
	.xword	0x16c89262f133263e
	.xword	0x36dd6af92c30dea2
	.xword	0x457d730d233034b5
	.xword	0x281747d746f9eb0c
	.xword	0x2135157ff0a3cb50
	.xword	0xe00625405f09515e
	.xword	0x502d14991dd14372
	.xword	0x9daa94cca93ec128
	.xword	0x18fb722ee90af4ba
	.xword	0x838c33edcdfb263c
	.xword	0x55edb0978620227d
	.xword	0x06b487b433ab70ac
	.xword	0xdffeb0f09d76009c
	.xword	0x96f019a5f5acdbcb
	.xword	0xadcdf9d65a52f03a
	.xword	0xceadd9ae9da4f032
	.xword	0x38cb76cbb04bd050
	.xword	0x3eda940c79f3fc2a
	.xword	0x9053be8810160be3
	.xword	0xd8c9e6967eb3667c
	.xword	0x9233bfbe4fbb3c14
	.xword	0x03226da5d5576795
	.xword	0x0490fd3c4556e7d8
	.xword	0x0cb17a66032f2c41
	.xword	0x4a9b495a9e81b4e4
	.xword	0xa0ecbebabc1d9e71
	.xword	0xa33d233907771d8d
	.xword	0xbd86419510642bbf
	.xword	0xe6ab7fffd93535b6
	.xword	0x31c7dc8f10e7e874
	.xword	0xb1e16c007465c4c7
	.xword	0x43ac4cb3ceb6edcf
	.xword	0x0a2b178158248702
	.xword	0x849cbba6a0d5b494
	.xword	0xab2f01470380d7c8
	.xword	0xe32787e96402deed
	.xword	0x05555d82d36d5413
	.xword	0x52abb5f4492811d5
	.xword	0xb07554cf28572405
	.xword	0xa50c40ddf920bc64
	.xword	0x3fb6c3e3dc36cbaa
	.xword	0x9edaf3fccf905c96
	.xword	0xedb10f99e2f5fcc9
	.xword	0x613553fdbdda62d4
	.xword	0x4e5da3dfe750ee56
	.xword	0x5fc72ae29f41c36e
	.xword	0xe03cd3e357c16e14
	.xword	0x186d422171ad90c4
	.xword	0xfa18e5a60e11a975
	.xword	0x378dc8a3322bd72c
	.xword	0x361176c77e259fef
	.xword	0x617aef363f17fd73
	.xword	0xd7361b147072147c
	.xword	0xb0226f5d67415129
	.xword	0xbed19efdd5159fb7
	.xword	0x636dab3d13341e8f
	.xword	0xb331ff08102ff4d5
	.xword	0x176da096b316f382
	.xword	0x56ec2c0ea23379eb
	.xword	0xcddad1d0e8594241
	.xword	0x197dcb416e9afcf5
	.xword	0x2895d68139cdab21
	.xword	0x642cc4f90cbb4d4d
	.xword	0xb3ce5be68f5c47db
	.xword	0x47d00e56f5f114ba
	.xword	0x58b2098f0e8059b5
	.xword	0x9237f4ddd221586e
	.xword	0x23fd4e7460d705ed
	.xword	0x84b0b73ef2c68e85
	.xword	0xf5bbf746c44e904b
	.xword	0x0570f26230e4d3d2
	.xword	0x32093bee243614fc
	.xword	0x50c96c1f5e3e7a1c
	.xword	0xa2e775b6e1600bb1
	.xword	0xcb16ddf415b67876
	.xword	0x6ad7ba056ee9f1e0
	.xword	0xdc3f6d46dc23e7a0
	.xword	0x171b67514bc6e130
	.xword	0x757b1ff126830b75
	.xword	0xcdce3a1389c0f682
	.xword	0x505863cdfcc1025b
	.xword	0x5681124fd14a63a4
	.xword	0x2e82ff1eb8481ad3
	.xword	0x7197da82cdd2802f
	.xword	0xda0487e7b8ea103c
	.xword	0x352acc5f9d77b991
	.xword	0xab374c9346109901
	.xword	0xb56595531ccf703d
	.xword	0x21b65b2cff631586
	.xword	0xe262659e8eafbaf8
	.xword	0xf826ea8efc147690
	.xword	0xe9b6cb364356891f
	.xword	0x3b354a96cfbd1dea
	.xword	0xb875ca5c4055f3f2
	.xword	0x67b845c83654aac1
	.xword	0x372986d6ac6c680c
	.xword	0x6ca005ce78daef2e
	.xword	0x46cc4b72c12f5b34
	.xword	0x1933eb393a1bb4e5
	.xword	0xb3cab7c94be407b6
	.xword	0x72da799ac8587b3a
	.xword	0xa6c93fd950707122
	.xword	0x6d31f7676d819108
	.xword	0xe41ed0b95641b797
	.xword	0x699603e52e85cd50
	.xword	0xb2294c3c1c41e038
	.xword	0x73f43ed9a09c6580
	.xword	0xf3b1e9d68c402923
	.xword	0x29d89df77cf5b80a
	.xword	0x59f75247f4b8856c
	.xword	0xad3d6921e4d0dd87
	.xword	0xa6345d2706dbcfe1
	.xword	0x4b1355a8e3b86c5b
	.xword	0x6022f67d251ad4bc
	.xword	0xf906dc462d4cf508
	.xword	0x6251c25610dbdabc
	.xword	0x57ee576d5daf4304
	.xword	0x69079d89880d6d43
	.xword	0xa96dd27cdc1cce9b
	.xword	0x1c3807c73b31f5f0
	.xword	0x63521cbb08fb177c
	.xword	0x5a902d1b99e37883
	.xword	0x725e8e109b81baf8
	.xword	0x815c7d161a9a5eb8
	.xword	0x56e34854b4ccf60a
	.xword	0xd0be946bac211a6d
	.xword	0xee978fe4f2db462e
	.xword	0x708f5c49de4888e2
	.xword	0xd51c3ebc6d7b8206
	.xword	0x5ddab9f34490352e
	.xword	0x99984ef6a9c87e37
	.xword	0x6db8c332c6e8a268
	.xword	0xd6d1bccba4b15613
	.xword	0x488d20ccf4a58c7a
	.xword	0x80c33089fb6955e1
	.xword	0xab2ee20cc9d417a1
	.xword	0xb3e08246df6aa4df
	.xword	0xf26f51ab2c3f5b79
	.xword	0x312628da93acac6d
	.xword	0x68b6e190a5a88149
	.xword	0x0fca60fcf3d03f79
	.xword	0xc3e119eb82285e67
	.xword	0x78f50c22f8250003
	.xword	0x4140c49922d94032
	.xword	0x38d23b68c6eadf6e



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
	.xword	0x7cd15a3049daa0ce
	.xword	0x99d17111f1a97679
	.xword	0x22b9ebe07f0a4322
	.xword	0x2f4c4b0084809ebd
	.xword	0x52a24cee13f0d82b
	.xword	0x5a5f0ff4e068aee7
	.xword	0x6f060c0b506bcf57
	.xword	0x9efd1e9d0661ea99
	.xword	0xcd2cba390823fd0d
	.xword	0x2b2f4eaaacf39ddf
	.xword	0xc26d1998f078378f
	.xword	0xf5bcadf9ad63f1c4
	.xword	0xe73dbbef8375d26e
	.xword	0x3d262ea76389835f
	.xword	0x211bdef60fe0eb73
	.xword	0x8f72c80470650761
	.xword	0xd6f1e90c1e3463d3
	.xword	0x2307f45a9bb08cb8
	.xword	0x23eab47eaa1c3e72
	.xword	0x8808c1e70e29244c
	.xword	0x9d4850d231b9c5c5
	.xword	0xb897fc4000b3d5cf
	.xword	0x48bdd833f559b434
	.xword	0x58f7fddc52aa13d0
	.xword	0x720c02585e160311
	.xword	0xb0294939951d96b7
	.xword	0x5c11a01335660ad6
	.xword	0xfdc3c21d8243494d
	.xword	0xb92ef9c76f46f0fc
	.xword	0xaf5b4e5526a66b9d
	.xword	0xc42b6c60327a2b0c
	.xword	0x339d35a08592bb35
	.xword	0xd4ccd86a65cbf1b8
	.xword	0x4ab92c1551c88ff1
	.xword	0x9132f93a8e38a95a
	.xword	0xf6fa18c32016bc4d
	.xword	0xe4a0f860dda5c369
	.xword	0xe95fc443d726c7db
	.xword	0xc9a9548baddee1b3
	.xword	0xf93c4b1e49b34f67
	.xword	0x1800792035e4707c
	.xword	0x141e385fba8b64a0
	.xword	0x61a22cfc4b81d15b
	.xword	0x06964a5a85425814
	.xword	0x6948ea3947c5e8af
	.xword	0x374702ca489b25e7
	.xword	0xd8b8f18dff643eb2
	.xword	0x3e9f9afe4d4088ac
	.xword	0xe18c6d866d1c06ad
	.xword	0xb1729ef78bc84da1
	.xword	0x2e7bbf50b028f455
	.xword	0xdd51124ca20ac916
	.xword	0xb33c04149a68abb3
	.xword	0x4820d000a411ca74
	.xword	0x5119fa753d4d9a65
	.xword	0x8d89d079a779f0bb
	.xword	0x8db4a37536fb1796
	.xword	0xa902ecb9b878b1ba
	.xword	0x09eb4c4b62fb2fc5
	.xword	0xafcbd1587e2643f3
	.xword	0x8c15cc50191db196
	.xword	0xb447d955e0c0b755
	.xword	0xa37cf27d52330772
	.xword	0x4c5f3893ba47ea64
	.xword	0x1aece23261826c77
	.xword	0x85a3695a636f9ae5
	.xword	0x4fc89adf417de220
	.xword	0xd8dbda4f7568f150
	.xword	0x75577bbddb3f63ed
	.xword	0xbcd54b4cfb407e7c
	.xword	0x22698b5dba8f253e
	.xword	0xcb3dbba37a20973e
	.xword	0x7bcbc0ef190b2eb8
	.xword	0xde50af20609a1fc0
	.xword	0x65b553d53d390e60
	.xword	0x469dbaae782d9487
	.xword	0xbd681d886bcbe4d8
	.xword	0xea446ea306d93eb1
	.xword	0x4b5ae5252cf9af19
	.xword	0xbf3b285559ab0b8d
	.xword	0xc1d41feddd750de2
	.xword	0xf4215fac47a822fc
	.xword	0x067f09911cbbfe8f
	.xword	0xfd7e606976ea7aaf
	.xword	0x88a2246f3402c6ef
	.xword	0xc1070efe854b7115
	.xword	0xb56acc7615fff41d
	.xword	0x511347a9df99297d
	.xword	0x40300c00e3676bab
	.xword	0x9fc68344e1039201
	.xword	0x3e5c952e572d6dd5
	.xword	0xc08a32b1efb22b4b
	.xword	0xda8f68e156e54be9
	.xword	0x94e3f5800761e616
	.xword	0x485b204742cd6c2f
	.xword	0x1d85f104866fcbce
	.xword	0x931428bb500f94b2
	.xword	0x0b822ab046e12b7d
	.xword	0xddd494748e678ec3
	.xword	0xeeca439d7b4e003f
	.xword	0x92f8faa457456814
	.xword	0xb5ffd4570c51fa71
	.xword	0xb01fa73c1317fcad
	.xword	0x53ae01e98ab40af7
	.xword	0x18609124c28988df
	.xword	0x79f83b1d7f429db2
	.xword	0xed58bf243ce26779
	.xword	0x966c7084b6d729c9
	.xword	0x67dc613b81c811f2
	.xword	0x56b48de232cfdc11
	.xword	0x8bfa7cd7b4c2708b
	.xword	0x78af73c28979df14
	.xword	0xd428fdac57181014
	.xword	0x253172f1cc4c51dc
	.xword	0xd0640c9683260d3c
	.xword	0xcd24f944840ed844
	.xword	0x1093995c12683311
	.xword	0x89713646ed3634b4
	.xword	0xc5a826d65892a4f9
	.xword	0x9c5fdc9d73e3fe01
	.xword	0x28e1ca7bd7c3d335
	.xword	0x64d17f1745b55aa6
	.xword	0x85de3089bda58b0b
	.xword	0xeaebfc263627d218
	.xword	0xd17963bca1d2c722
	.xword	0x016b85456cf4fbc5
	.xword	0xdf3915877f5927a7
	.xword	0x9bd225374b2e28dc
	.xword	0x2f235d434721b8f3
	.xword	0xb4ecb98d01426742
	.xword	0x5c3e6719f402bb0c
	.xword	0xf4a350de9cdfea87
	.xword	0x34a83d3389dd5eb4
	.xword	0x28ebfaf5ad6447fd
	.xword	0x7df148fd825c0748
	.xword	0xdb40df5974a0ffa2
	.xword	0x9d1a4f94ed60597d
	.xword	0x81201824875dd690
	.xword	0xb10bb7f63c4581e4
	.xword	0xe86dc1aff26350bf
	.xword	0x0ff5bf4affffe270
	.xword	0x2c85c768b5114a04
	.xword	0x4fe8883096ad8d74
	.xword	0x68742e59e91a7cdc
	.xword	0xb0c5e398b8bbb2a7
	.xword	0xa4024ebb7134c8d7
	.xword	0x24218a8758b98c91
	.xword	0x55ddd9bef91b3d19
	.xword	0x53845368ef8ed7cc
	.xword	0x683b20dfb44ef86b
	.xword	0x99d1b568a285aaa3
	.xword	0x70b5a952b9ecb9f8
	.xword	0x12cc128fe72bf9a0
	.xword	0xbc4700d917327695
	.xword	0xe57f9b3182211dd6
	.xword	0xc276e4fe8035ad9c
	.xword	0x6dfb47b3a8bd41cc
	.xword	0xdb0a2d1f6722e5eb
	.xword	0x2c9416fe42f76355
	.xword	0x8314549c8f6a491e
	.xword	0x91c4062ef8b7e4ba
	.xword	0x32899f13b21653b2
	.xword	0x8b2d3e6c8aacb7f3
	.xword	0xe21bb0131c0d6bbf
	.xword	0x1462595a80eb0961
	.xword	0xd36b6528da5bd5db
	.xword	0xb8471997fb77664c
	.xword	0xe8b414acc3dcc4d6
	.xword	0x535a28ed78d8ac7e
	.xword	0x6d1b034477d3b007
	.xword	0xd04608ccff302120
	.xword	0xe42efff9d6641320
	.xword	0xa79a05b7cf9e6c5e
	.xword	0x25e76fb969a50e59
	.xword	0x3716e79c3e947961
	.xword	0x12f5e21fcc8eaecb
	.xword	0x9b8d615fe0a8d6aa
	.xword	0xb6fca5e1c8ba71cf
	.xword	0x6a537a726da7bf5e
	.xword	0x82010424af3f0687
	.xword	0xac4b59d8b1fad78a
	.xword	0xe2ad332a1bd30a22
	.xword	0x47747eeb000f2735
	.xword	0x493de953c10a7ae3
	.xword	0x3e481d22c4e9c445
	.xword	0xd8d49ccd34f22c38
	.xword	0x337eb091f048afaa
	.xword	0x2963af832c3eff8b
	.xword	0x3f358aafdbfb3dee
	.xword	0xf63ffbf882d67c5e
	.xword	0xff12a4744c9d1ae5
	.xword	0x7e0505672aef7476
	.xword	0xb6b7330c4080d2a5
	.xword	0x0fba8b036bb736e7
	.xword	0x05f713ceffc4ee31
	.xword	0x20ea902363d9743f
	.xword	0xd05e21410794ca0a
	.xword	0x8893b46f1464676f
	.xword	0xc00cc7e055b287a7
	.xword	0x28a30b8af4d2c57b
	.xword	0x274527a61b905fb8
	.xword	0x379caa1258dfc9aa
	.xword	0x00679448ee66d452
	.xword	0xff6d67731a851458
	.xword	0xf60f035f07ad7fc5
	.xword	0xfce69a2af4f151cd
	.xword	0x9b700cdfdac9536a
	.xword	0xce3f44b1cc636975
	.xword	0x82db3357fde11607
	.xword	0xde3d8d9fc268ecf4
	.xword	0x0b7b672b2bc7f999
	.xword	0xab52d1e3d125f901
	.xword	0x7013545d28d1039c
	.xword	0x188e7e003cb15f81
	.xword	0x96406410075a519c
	.xword	0x94050380b90f0cf5
	.xword	0xa1bd38352fb04dab
	.xword	0x01643cd85b00c8e6
	.xword	0x185f9c81233527b0
	.xword	0x29165f918dc1956f
	.xword	0xce447331b5bb78e0
	.xword	0x3785ba0e0aaccd22
	.xword	0x340fa5b2a26cd4ef
	.xword	0x7e34fe2fd1fe7820
	.xword	0x4723afd7adfe7291
	.xword	0x1b3796d0cc30793c
	.xword	0x910d9d90b94a274e
	.xword	0x65ddd664f01cc70a
	.xword	0xd90a9f0326f80988
	.xword	0x40a82b9cf1b24eef
	.xword	0x8cfb1c1c9f029bf3
	.xword	0xfe64113cb09f1e62
	.xword	0x77337cea573a0fa6
	.xword	0x442d895daacb202c
	.xword	0x4ee1bae0ac99ce77
	.xword	0x0030af80b5bc8748
	.xword	0x0bbfc4ee76f0d24b
	.xword	0x103ae5340d22e7b9
	.xword	0x1d55954c9f6970d6
	.xword	0x9376b2de186909ba
	.xword	0xff21b69523c92062
	.xword	0x268002af17b9a674
	.xword	0xdf3e5bb237382db1
	.xword	0x468e2bf93ddf942f
	.xword	0x34f3ff32c7f2e9a6
	.xword	0x48f67aed4c7047bc
	.xword	0xbee135ecba0b9506
	.xword	0x10ea76f5686f6596
	.xword	0x78cc4bf9fd40c39c
	.xword	0x26a4021b429696df
	.xword	0xea183eaa5c04dd11
	.xword	0xdc323548b94368e3
	.xword	0xe30e84aac177378c
	.xword	0x8b9332ebd082e8d7
	.xword	0x7dcc2ebea20e1c4f
	.xword	0x30e9460b9eb63540



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
	.xword	0x768e9daf1eb21768
	.xword	0x823f87a182d32fe1
	.xword	0xd88252e2f4a1e3d7
	.xword	0x6ecc75a40f48d2c2
	.xword	0x3d8896c42b5f09d4
	.xword	0x3f4bc9025936eb14
	.xword	0x905452cc56522794
	.xword	0x112d2a1512c5217a
	.xword	0x3e7e80fc025a42cb
	.xword	0xd1d3d9059421de20
	.xword	0xabfcc2b2e648daa8
	.xword	0x170f2aa6559cf0a8
	.xword	0x91e23ff3f3430f76
	.xword	0x80cd4c417d7e6c9f
	.xword	0xd0ffd62cc18f9246
	.xword	0xe7e66ec910419c0b
	.xword	0x8ee38a99b935b262
	.xword	0x33092817017f2076
	.xword	0x4d211b1eb5e15985
	.xword	0x9b3d0caf11e66835
	.xword	0x8272ba75466c8c30
	.xword	0x53737d72d8d55d62
	.xword	0x34a907b60a315c22
	.xword	0x62374723161e4da2
	.xword	0xe5cd0d5b1cbd0cba
	.xword	0x9f099e620741ef50
	.xword	0xf581d7693dc656fb
	.xword	0x08e60ab4a77ea888
	.xword	0x5682193f5c833dc5
	.xword	0xeb18030aa83a637c
	.xword	0xdca2b18cd8f1cea3
	.xword	0x97f3fe35ff789263
	.xword	0xb5bbda0eb6591244
	.xword	0x2bb9365620d915b6
	.xword	0x59df49b576714f5a
	.xword	0xdebfc956a059bb8c
	.xword	0x99bd108b5424f44e
	.xword	0xcd7e9a37e615d804
	.xword	0x9d1e1766808643b9
	.xword	0xd3075e87c2266eac
	.xword	0x0d80843b6ce62c6e
	.xword	0xc4728e2803a243aa
	.xword	0x85c6385d638d798c
	.xword	0x63e8efd832ec81ff
	.xword	0x952e0aeff8195444
	.xword	0xf2a1e32b498a33a7
	.xword	0xa89c660256484850
	.xword	0x208eafe9470546f8
	.xword	0x917da38726d25e13
	.xword	0x1567a61d8fc2f5e7
	.xword	0x14f64694eaa85cd0
	.xword	0xaeb006918e90474c
	.xword	0x0dc452cafe90dbf9
	.xword	0xf706a184d1c056cd
	.xword	0x2df2cf6929115f8c
	.xword	0x1098e1be56c7eabd
	.xword	0x46b6f1e90311056d
	.xword	0x094fe86aedd26eb3
	.xword	0x9d2e76c3cffcbf74
	.xword	0x6f109faec9f43496
	.xword	0xc82b0491a845872d
	.xword	0x1001b28a8f760871
	.xword	0x6ae8d803d17d1223
	.xword	0xf8c851a7aacd8c17
	.xword	0xae48c599bfdc6d8a
	.xword	0x761c5ad021a71985
	.xword	0xedfe06d479312667
	.xword	0x0cf5a8724a8adcb8
	.xword	0xf46018c0467f1af0
	.xword	0xce18c1b370c21cab
	.xword	0x6c1daf465c61d3c9
	.xword	0x9ee6331d4b332bce
	.xword	0xd6fd03c62e4d543f
	.xword	0xa0678801e4832d49
	.xword	0x8345de8016eaee3a
	.xword	0x0f7a323c1aa7f6a4
	.xword	0xe202b7f4b6eda3bd
	.xword	0x0ee45ca7c13e7ac6
	.xword	0xf7f9ef3796dd847b
	.xword	0xb3361e4eef4e5b12
	.xword	0x1957c37f2ffcf85e
	.xword	0x420a8dc143e3cfe4
	.xword	0xa14c88efe9250456
	.xword	0x33adff559dba4ffd
	.xword	0x9867669d828c3f99
	.xword	0x1abe935542e046e8
	.xword	0x1525c8a78bee61b2
	.xword	0x3a3fdc65254f5a9b
	.xword	0x79176e4c530be5cf
	.xword	0xdd59b8e5c5d8985b
	.xword	0xb2f05121462290c4
	.xword	0x68cbb41c75cd88c4
	.xword	0x5ce5c811addf6561
	.xword	0x17704b265f34194c
	.xword	0x704384fc0f8defdc
	.xword	0xadf38950555766ee
	.xword	0x24667db8aa76e9a5
	.xword	0x380933af4e244980
	.xword	0xe159543499e9e503
	.xword	0xab0ac526f7d7fadd
	.xword	0x9a34684488163b2b
	.xword	0xdc51532125caabbb
	.xword	0x5d8d3e2fa77cd115
	.xword	0x6c3e7482c9d29ca0
	.xword	0x73226c2327f477e8
	.xword	0x7bc196ecdf40908b
	.xword	0x8e08bdacd25301cf
	.xword	0xd85adce7c608cd92
	.xword	0xafda7df4985719a8
	.xword	0xe687f063cb29cfa9
	.xword	0x13cb84d67f68ced9
	.xword	0xe690fcb33b36a004
	.xword	0x5b15184cd37e0f4e
	.xword	0xe38109aa89c6ba48
	.xword	0xf1c367285bfc1113
	.xword	0x412cc3b19f9df95f
	.xword	0xed4d70c0d4fc4f63
	.xword	0xd1283d7e517152b9
	.xword	0x172a70ff9f98e753
	.xword	0x734e78bbda314c50
	.xword	0x22cfe9321ff3334e
	.xword	0x2e7a16c406f38098
	.xword	0xbac90b82bd1231d6
	.xword	0x2035561f397ad097
	.xword	0xfcf4c7ca9a3bae8f
	.xword	0x8c9fa0fefaaca705
	.xword	0x2e14356695597270
	.xword	0x63734b176013dde3
	.xword	0xc3214bde76fa521d
	.xword	0xf1eef864d566954f
	.xword	0xfae254863009a80b
	.xword	0xef708efe4eaa1570
	.xword	0xaa05ed41c54cd78b
	.xword	0xea478655836d109d
	.xword	0xc97f35623222272e
	.xword	0x046bcb2d9e276f8c
	.xword	0x4594b944f03afdf8
	.xword	0x10b7a7c1d55d59fd
	.xword	0xba2dfcd24ef4ebb2
	.xword	0xf47289c856237014
	.xword	0xf970ae8415bdc8c9
	.xword	0xe0cd1c486d519fda
	.xword	0x10bf33d838f436c8
	.xword	0x120dfd2657541806
	.xword	0x68305dd11ea197a0
	.xword	0x42765439a4c3c54c
	.xword	0x8b557c4d777645cb
	.xword	0x0fa26fa005498c49
	.xword	0x3bdf51a5ae0bbee4
	.xword	0x667e3b9e8659b488
	.xword	0xf2c1365de30434d4
	.xword	0x03bba45cc029ef6d
	.xword	0x3853298111c168c7
	.xword	0xa3dbc3dfcc9e476a
	.xword	0xb38c36e57d24d5e4
	.xword	0xedf3cd41f75be503
	.xword	0xd2c5598a179d7f00
	.xword	0xe1fe182d4a9f2829
	.xword	0x35b07a0166aec7a8
	.xword	0x055e839a30ae57e3
	.xword	0x8f0f691d41aeec96
	.xword	0x8aa615fb5aa088b6
	.xword	0x004466688da882f2
	.xword	0x15ee1bbff043cd32
	.xword	0x48df6096f3da7e1f
	.xword	0x9e25a67031002a5d
	.xword	0x30702aa66438c442
	.xword	0xa17609ffec2047fc
	.xword	0x5987411c51d3c7ed
	.xword	0x2394a45c74595e40
	.xword	0x216474192c4c03f6
	.xword	0x906b09f9d39dccc5
	.xword	0x4911eb35f9d637cf
	.xword	0x3dc0ced54341bd22
	.xword	0x9c7729d4394cf74a
	.xword	0x4d2e7ed074f70c0c
	.xword	0xc1b06b764ab38e50
	.xword	0x1a593e72a6ea8201
	.xword	0x3e665fdb406cab21
	.xword	0x5b8e2d21d1318e67
	.xword	0x8af4051679071a99
	.xword	0x70a6aeb578aba87a
	.xword	0x3f86169ef71b6ee2
	.xword	0x2ecf3a9bc55d3328
	.xword	0x61e9f9121c400a7c
	.xword	0x2431ccadccba403c
	.xword	0x13f0461b64cd1e91
	.xword	0xefc79bb1f2300966
	.xword	0x9f77d1be76c2a22e
	.xword	0x8f65964e55c6479e
	.xword	0x9d4855aeef04fd5b
	.xword	0xc18bc006e594c1d7
	.xword	0x0a8837ba3caae460
	.xword	0x151ece1d918adcc1
	.xword	0xcf542a58a15bf1a8
	.xword	0x7b472d7050bd00c2
	.xword	0x6467303994ac3dc0
	.xword	0x134bf335d768a3f6
	.xword	0x90b14d9005d0e8b3
	.xword	0xad379c74a5c9026b
	.xword	0x501cd6e429918d14
	.xword	0xe99d642a4cba89c9
	.xword	0x0a67768d8f24534d
	.xword	0xcc131631e95bbc39
	.xword	0x7e6cc0847393c520
	.xword	0x75ff37b092b2424d
	.xword	0xd5a3b848a70bd70a
	.xword	0xeef71dc702499586
	.xword	0x596b8458e717cd51
	.xword	0xf16afc6a1f8841b2
	.xword	0xe0ef8899d2128fa6
	.xword	0xf591e1ae13d551a6
	.xword	0x0d98800502bb72f3
	.xword	0x8c6d573f5df99fc6
	.xword	0xbff9dd3f26ed1c58
	.xword	0x5666cea45d81624d
	.xword	0x2de272ac37aa31b3
	.xword	0xf6e81e08b8a943ca
	.xword	0x2cc3f210b72dde48
	.xword	0x99a342d33d4c736c
	.xword	0x39712e7e7a2269f9
	.xword	0x15f396674152b74b
	.xword	0x906902d552e60f80
	.xword	0x5a23bc2cbed88181
	.xword	0x519e0a3a802c2a61
	.xword	0x02ec59240b94ec98
	.xword	0x13781fc884d406d6
	.xword	0xd0d293d64ae4982c
	.xword	0x4e72c17050994571
	.xword	0x69bd5aeb3f65a4f7
	.xword	0x8a7ef207b127e8a5
	.xword	0x462b7c0162d131ce
	.xword	0x0354dd357c5dadc7
	.xword	0x1b455a5887fb709f
	.xword	0x37dca6ec52074056
	.xword	0xca6126ba1cdc4af8
	.xword	0xa8dc1b9d5e9bf8f3
	.xword	0x7c989f23a37c6063
	.xword	0x83be30afb6529599
	.xword	0x85c87c4c7eb8aafe
	.xword	0x02c126f71368843f
	.xword	0x48ea62f97154fb27
	.xword	0xa6b03d3ccbe941b4
	.xword	0x98c8293dcd9eed52
	.xword	0x6d019b6c2a51f3f8
	.xword	0x0169aafe7315b3ed
	.xword	0x227461a9d8763ce8
	.xword	0x5ccede6cd88d27ec
	.xword	0x97c5f4cf918597c7
	.xword	0xf97af6e03f9005db
	.xword	0xdc6c1f5eb35d44d6
	.xword	0x301bdacf9d67ca30
	.xword	0xd79c4d80fc876567
	.xword	0x13bcb9c6b07be4b7
	.xword	0xae44a111a1cdc47d
	.xword	0xce53b4728e1b2285



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
	.xword	0x90d0c030b3fc1510
	.xword	0xd3938ec659641c01
	.xword	0x158254f68352739e
	.xword	0xa3f28c09e0e06f8f
	.xword	0x76130851d3a71700
	.xword	0x4c1281347a895a77
	.xword	0x7a1231a660d2dbbd
	.xword	0xe74f7e47bce19484
	.xword	0x629e79a4096b1a5e
	.xword	0x167fa6bc4e8f24c7
	.xword	0x67f5804054247544
	.xword	0x3e038cc97676b8d8
	.xword	0x86d1488cc79c5796
	.xword	0xafd955112c353f6e
	.xword	0x68f58b995fe1b90f
	.xword	0x3e4c6fad52e06181
	.xword	0x2dd6390ce7774156
	.xword	0x40f786f98a5db907
	.xword	0x616b9044ee019971
	.xword	0x8d7118d1cc272912
	.xword	0xa775a477dfc5a7c8
	.xword	0x696525494eb91a48
	.xword	0x4cf5e662f5ee3bbb
	.xword	0x652150fc5852b49d
	.xword	0xaf7482f0989d4698
	.xword	0x5f29708fa4590f0a
	.xword	0xf6eb19a3e734c8a8
	.xword	0x9e45e3a7dd519cc6
	.xword	0xef46a62e108d6bd0
	.xword	0xed91b55a4d8b7ca5
	.xword	0x75342855648b2126
	.xword	0x8c03d2f2b14198e9
	.xword	0xc643b25e65953fd8
	.xword	0xbfaf785d1237bda9
	.xword	0x80c125c7ce208350
	.xword	0xe8a79edf6189c04d
	.xword	0xea1c10280493e02c
	.xword	0x5876f7e1e4e7fffd
	.xword	0x54129a73e6f8af79
	.xword	0x5b716731265dffb5
	.xword	0xf8dffbd08bcc29d8
	.xword	0x2a9839b009ed9721
	.xword	0xeb1e490e6c6ef121
	.xword	0x566f62c8ae69e6c6
	.xword	0x1f281f63c477284a
	.xword	0x8ed741744888ee8f
	.xword	0x7ab5a4c0efcf4245
	.xword	0xc7e3eefc2f872ec7
	.xword	0x0baa2dda61a04e80
	.xword	0xdd1b07cd9bf70a36
	.xword	0x0e9b0bcd3fa59ea0
	.xword	0x0c533dcbe86c5347
	.xword	0x1c28143efae8e596
	.xword	0x75be1c30a17adc84
	.xword	0xdf988342b060c23f
	.xword	0x58314de30a177773
	.xword	0x0865d977a8085da4
	.xword	0x3ebc7676b80f6634
	.xword	0xf52839deebcf02c5
	.xword	0x6b3e49fbbeae8faf
	.xword	0xc176809946124f42
	.xword	0x9f0a82b05560b3d6
	.xword	0x81005efa91912915
	.xword	0x05613bcd93a9da5e
	.xword	0xdaf98c3f32f9b7c9
	.xword	0xa2678179a49f76bc
	.xword	0x0f212a82f5d117d1
	.xword	0x4835ae8f8b8e9f61
	.xword	0x1d3246ce9ee10e8e
	.xword	0x5dd81bee9dfc9c29
	.xword	0x7359ac116f23e03e
	.xword	0xb18004f0110ddc75
	.xword	0xfc5539a0f717525e
	.xword	0x165f6f723772994a
	.xword	0x2cc4515fd9b8b089
	.xword	0x527ba8a8fcb05bad
	.xword	0xe65c4cefe1f43d64
	.xword	0x7f2cf0f9fb79fe0e
	.xword	0xab91616c4c13de1f
	.xword	0x4491e9392438b225
	.xword	0xf89af6d2c951304a
	.xword	0xaf5487478b77f00a
	.xword	0xc7e802e48d7068bd
	.xword	0x944dcf3bd18d6dc5
	.xword	0xfadee70d8de4c352
	.xword	0x5ccb74f156d07ae8
	.xword	0xea1b8ebd16b8b2f1
	.xword	0xc308061b2648740c
	.xword	0xe83688304d4d526b
	.xword	0xa4b9f0695521f62d
	.xword	0x5cdeeb04a155b901
	.xword	0x924c5b4986746a4d
	.xword	0xf2268115e4bd625b
	.xword	0xcde104c7fc15c53e
	.xword	0xd44426ba46c93f4e
	.xword	0x3c5c0c1eea2c12e3
	.xword	0x494f3deb356716fd
	.xword	0x948b515349e2febf
	.xword	0x17f2494d58ef562c
	.xword	0xdd477f22e77e3cfe
	.xword	0xbc858509a49e3d24
	.xword	0xfeca2095122ae312
	.xword	0xf7b289cc673744c4
	.xword	0x7037953967d54e38
	.xword	0x7ce88436d0e50ca2
	.xword	0x59eebccb494b5ca3
	.xword	0x261f1b6ef20f036c
	.xword	0xa49b12515ae72626
	.xword	0xbc9bc670e4e3aeec
	.xword	0x9f2af6d0703374f8
	.xword	0x696de585af9aee11
	.xword	0x5823511acef83ed0
	.xword	0x30788fc77860d917
	.xword	0x810b34a8d537b20b
	.xword	0x6f00667e5d61ee6a
	.xword	0xe7f604ae7fba73a5
	.xword	0x1892576572afe479
	.xword	0xd4389883f937b69e
	.xword	0x2197f9973db7e6bf
	.xword	0xf9b2e5928e33c240
	.xword	0xa7367af668c655bb
	.xword	0xea46498bb31b78e6
	.xword	0x2c79bfc88f47a1d1
	.xword	0xabbbcda660918097
	.xword	0x37ce7d9db7ce632d
	.xword	0x281f2c79d3d97a4b
	.xword	0x8939c957d02ffc3a
	.xword	0x7cec448e6cbe5dac
	.xword	0xdb26a080d74ed330
	.xword	0x4b514e4ab4e2a952
	.xword	0xf4a1b9e43e0e1985
	.xword	0x371b203750c4f4e2
	.xword	0x20e959a2be9d72cc
	.xword	0xcf9296b1e637ba13
	.xword	0x7d1334c1201d5e89
	.xword	0x5d230cf4445f5e51
	.xword	0x1df10a3f494a1631
	.xword	0x2f68ba54df90b224
	.xword	0x7d6b2d0e04d602d5
	.xword	0x7dbf7a2142b4134e
	.xword	0x2a8c18da499780f3
	.xword	0x63c30fd1c4d95f81
	.xword	0x9dcfd55e094e6bea
	.xword	0x56b918fe289be9b6
	.xword	0x7839ac8830c25687
	.xword	0xc0947df41f86b995
	.xword	0x367bcdee6747fc8a
	.xword	0xe7e0291b5527ace5
	.xword	0x197184fdd4c30b25
	.xword	0x3e5eedd998497db7
	.xword	0xfd0668ad704e1899
	.xword	0x7097d00bad6ca4bd
	.xword	0x8a6612028e1156f5
	.xword	0x4f34caa623b42dbd
	.xword	0xf02242da29975bd3
	.xword	0x313c9eec735116a2
	.xword	0xda664778a53b7ec2
	.xword	0x20519c9fbb2fbc99
	.xword	0x470a1cb6674e2466
	.xword	0xf58bcd70133cc2d0
	.xword	0x4ed145840a1a6134
	.xword	0x1807ab714acf1406
	.xword	0xc58d245b4ba4502f
	.xword	0x70182895b8341f92
	.xword	0xce55cb3a0fa0859d
	.xword	0xf104499ecd250f21
	.xword	0xadcf7dc9656c9f35
	.xword	0xa2271b49e1872eaa
	.xword	0x668caec6ee380eac
	.xword	0xb75c492acbe1fa3b
	.xword	0xdef9caa0aa7e5ed5
	.xword	0x238e61e1714a77f0
	.xword	0xc543beb774ba7cfd
	.xword	0xed8ffc3a2d5159f4
	.xword	0xedddeb5ba3639a71
	.xword	0xc8bef8bd3d2dff7b
	.xword	0x4db4cbbd04b9bb80
	.xword	0x163c1077f17ad4e7
	.xword	0xdde67f6ab6014cde
	.xword	0x2515a8fcfa400676
	.xword	0x677be6cc2042bb27
	.xword	0x2a9a2ab00bdff2ef
	.xword	0xc951b6588a3f6eed
	.xword	0x1456470f14d9ea72
	.xword	0xb6ae13f3d02ff4ba
	.xword	0xf7ade5c7a610f9f7
	.xword	0x4d1d75315e2b5f13
	.xword	0xec6350535c35061e
	.xword	0xfd1405bbfcf8ff03
	.xword	0x76b5395d67f6b51c
	.xword	0xc8d6a0a1c2944a17
	.xword	0x0debfe6ff3e29e4c
	.xword	0x0241c91f4ceddcea
	.xword	0xad0bb240d3357ddf
	.xword	0x235fbe7667661d72
	.xword	0xd85761a6fd063b01
	.xword	0xc102e900adfbc978
	.xword	0x955169a4d2d90454
	.xword	0xa7f0c72b1384ab7f
	.xword	0x47d522d9ea4074bc
	.xword	0x886dff8916fb1e78
	.xword	0xbe3eb73fd7472265
	.xword	0xfb8c3313b9a5d644
	.xword	0x51033f53670b0c4c
	.xword	0x497b26f18356a4b3
	.xword	0x24cb6dff13cfda5c
	.xword	0x4b2e53aebbe39537
	.xword	0x4bb1a0f8cd1b4aaf
	.xword	0xa5e787cceb5a11c3
	.xword	0x60e8bcc6f528f712
	.xword	0x80f03dc64cabc71a
	.xword	0x33c4670b347b9981
	.xword	0x037c08b3ade77b69
	.xword	0x5124048e05188566
	.xword	0x520a63371910261e
	.xword	0xb815fb73847cb7d2
	.xword	0xe646f46464fa5064
	.xword	0x2051d0693dd4e763
	.xword	0x6dec1248e2e68641
	.xword	0x8989bb88f62c8a03
	.xword	0x6490cdd6f05445d4
	.xword	0xebc9d7d584061eea
	.xword	0x0b06e9e8a0242c35
	.xword	0xa55e3360710da746
	.xword	0x6cdbba08a61531af
	.xword	0x0e5768430548ab76
	.xword	0x8cf21db9884b1f1f
	.xword	0x784d5ed95893d760
	.xword	0x988efe15c6f42236
	.xword	0x7f2c4ce24e9d03b9
	.xword	0x8daa7e43a096d697
	.xword	0x5eace0723b0c7f12
	.xword	0xcbe291ddc938e85c
	.xword	0xdd88e825468a8b17
	.xword	0x535ca330ab8f657c
	.xword	0x7facfe2e0c9ce793
	.xword	0x63ddf4c7e8146b95
	.xword	0x35dd36f450513750
	.xword	0xfcf87f1beba67ce7
	.xword	0x0093f52858b982cb
	.xword	0x0c47e363959e18e7
	.xword	0x116104f54eaeecac
	.xword	0x2b0ba1f86b86df44
	.xword	0x8fbda75a201ca7ec
	.xword	0xbe0bbe1a01c75451
	.xword	0x3e0d4f262539d9d7
	.xword	0xde7117564ccc9ccf
	.xword	0xc18323435abe8975
	.xword	0x320db0dd24c65c9d
	.xword	0xdc25bfa8bde2985e
	.xword	0xac47ad061a1d7124
	.xword	0xc6035045778fa8be
	.xword	0x1d77cbe4ff76027c
	.xword	0x5b46f555ac3c050e
	.xword	0xd1951e442329ce1a
	.xword	0x5ac98722a8b1b452



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
	.xword	0x3f155a84149a4f11
	.xword	0x100c7e8c16ee745d
	.xword	0x15227f90d6df98cb
	.xword	0x6697bf259024aa51
	.xword	0xade31652d06376f7
	.xword	0xfd9e5963f11e7743
	.xword	0x2ad474d99b794b50
	.xword	0x5a08bb6469531d49
	.xword	0x5765e49120b330f3
	.xword	0x94c8186b0f8fd888
	.xword	0x7c66a845fe4ec56f
	.xword	0xf7c5f34fbbb17ead
	.xword	0x101a9511dcc32167
	.xword	0x25463c5fda526044
	.xword	0x6bafead6964db577
	.xword	0xba1da690e8613639
	.xword	0x25570e4058e51660
	.xword	0x12048f605bffe362
	.xword	0x70bbe8422ac8eaea
	.xword	0xfcfc8cf30666d7a3
	.xword	0xb5564311bb2b2012
	.xword	0x66590b1b185f69d6
	.xword	0xa9b79772dba194c9
	.xword	0x39671be2c784f7c3
	.xword	0xc9e3f3159a9ae6e7
	.xword	0xbdb17d2976de0c7e
	.xword	0x144789986a7fd8b4
	.xword	0x4d34216d4ee41965
	.xword	0x49e6f4c520816ed7
	.xword	0xeddbebf374dbd8fc
	.xword	0xdb9d1b0c0b33699b
	.xword	0xe112fba34dd1f96c
	.xword	0x34070374b080b670
	.xword	0x0051010e9d877c41
	.xword	0x87f12c8683f50091
	.xword	0x334cfb55f3ac94c0
	.xword	0x0dfd580e2834d927
	.xword	0x7bbc8e4f6bc491cf
	.xword	0x84528bcf40d1bb26
	.xword	0xc3e4b69e79d572a8
	.xword	0x48ba657b05c8f04e
	.xword	0x116dd05b468a2cf8
	.xword	0xc978929e67339409
	.xword	0x6459883523e7feee
	.xword	0x8ad6a9aaa5343dd2
	.xword	0x34bc73bf24040377
	.xword	0x9cb363c714165380
	.xword	0xa1049d8eaadc3cfd
	.xword	0x9a52fbd56654dab7
	.xword	0xbd227889a2eaf38e
	.xword	0x95c8c79d10aa5f2f
	.xword	0x540415d1cfb4cd1d
	.xword	0xae7a24b0a42efb28
	.xword	0x7f7d7c48954c5333
	.xword	0xdc7982b22834ed55
	.xword	0x8491677a6780f7b5
	.xword	0xcb3172095965bcf7
	.xword	0x37f6aea2e3f88d0e
	.xword	0xc7bb5e0d0c5c7628
	.xword	0x48e6eccf49be9d87
	.xword	0x4336b562d5e62e83
	.xword	0x513c075264392727
	.xword	0x862dba1d1e81df90
	.xword	0xcbb3090cc988538c
	.xword	0x80aab767e2a1eb40
	.xword	0x33f6b0a4c2e8cfd3
	.xword	0xdd5e280d751a614c
	.xword	0x8f199e206dd17b6d
	.xword	0xc4c4c6328e17e872
	.xword	0x75171c5368f177b6
	.xword	0x06cb3f20e7f6b054
	.xword	0x012b718716e13ef5
	.xword	0x994cee1e074232bb
	.xword	0x339aff3478048121
	.xword	0x5cb148e32fc7dd22
	.xword	0xc69fa6cd49849ada
	.xword	0x5df89b6d86aa9d84
	.xword	0x865d7e2cf07b9164
	.xword	0xbce4142f44611166
	.xword	0x9b2ccebe971b1fe9
	.xword	0x0b50eb14b05f5a27
	.xword	0xaa243867a5f675d4
	.xword	0xb4ba5730b9cb977c
	.xword	0x11a06249b3b015af
	.xword	0xac3860263313ff87
	.xword	0xff2b5d2049d6da84
	.xword	0x8616f0f98dff736e
	.xword	0x39d4f256f0240966
	.xword	0x92dc23aea49631b7
	.xword	0x103e4f66f4f23085
	.xword	0xd1d30b8d98cce4e5
	.xword	0xd641417ba366373d
	.xword	0xb292977db7345266
	.xword	0xafe28842594dc2f2
	.xword	0xff7c75c81f66d0ef
	.xword	0x213f1ae8ab5e9f72
	.xword	0xc02265eb53903ecc
	.xword	0x9cc5b5f205aea94f
	.xword	0x6babf9bfff075cdb
	.xword	0x02cef77fa1f28f15
	.xword	0x6f160e4f1399bcdf
	.xword	0x09bb7b6b507b3f34
	.xword	0x7d08bfa293116584
	.xword	0x4c6b90d7fcfbfa9c
	.xword	0xba01307f6e317281
	.xword	0xce68c880eba607f3
	.xword	0xb8318c04b8c40d33
	.xword	0x90716925ac43aec1
	.xword	0x839bc4c99b50a760
	.xword	0x1474e617aa7d9683
	.xword	0x8585ce8787715ca1
	.xword	0x4b1728df908cfa6b
	.xword	0xc239fd5be9572262
	.xword	0x8ec0addd4338ef44
	.xword	0xc42e1190a16e3c00
	.xword	0x2764eb3541344d45
	.xword	0xd7339137e5ae8a9e
	.xword	0x58ffbe70436a8d10
	.xword	0x33e9788b9199d1a5
	.xword	0xe48158b2bf3e51d5
	.xword	0xb1e84d65e29ee2f5
	.xword	0x3910f0029825440f
	.xword	0x1b2ab3fc2412269a
	.xword	0x8704fe1bdd2a2106
	.xword	0x6efa0c42ed6e542c
	.xword	0xc3ee7f5961076b8e
	.xword	0x75acaf40f676c129
	.xword	0x388edebf244c0590
	.xword	0x65e01eda51067369
	.xword	0x558d457a053f668f
	.xword	0xe5a38869b721a752
	.xword	0x344d5b273e9180b2
	.xword	0x9b11ff657b2cfff1
	.xword	0x51b7c8b5faed2bf1
	.xword	0x19f19ed1ecd86f82
	.xword	0x9032d10e57f4324d
	.xword	0xda72f062e26c7aad
	.xword	0xe9326558a301eced
	.xword	0xe99bf075fa3947a9
	.xword	0x9edf232f3397ba2b
	.xword	0xe60e79a4c52a7240
	.xword	0xca04cf367597a7c4
	.xword	0x4ea5a9091f36d486
	.xword	0x5f214f6565a2ae4d
	.xword	0x9b2c5363256ea408
	.xword	0xde622117c7160e43
	.xword	0x8fcc2c86329607f2
	.xword	0xf4ddc2b5a4a88295
	.xword	0x311849f335111809
	.xword	0xcc99f523c24c530e
	.xword	0x5f32ad8956f9f9f8
	.xword	0x2342edd695c13e3e
	.xword	0x7cbd1b684439816b
	.xword	0xdca867c2da04e394
	.xword	0x30f5d240faf0e671
	.xword	0x1dc0e8e84e542805
	.xword	0xc0edada9d6b27776
	.xword	0xae8c3bc0859bf798
	.xword	0x9b5e1ba0e491cb7a
	.xword	0x7bd3bf45f0c244d5
	.xword	0xdadd2975c1818a03
	.xword	0x788a7f7e788a81ba
	.xword	0xfa9b828978a3ebf1
	.xword	0x5f9c27584858e44e
	.xword	0xc58808f17eec0285
	.xword	0x835cec8e43479744
	.xword	0xd627495dcfe818f6
	.xword	0xa6edb07916681f42
	.xword	0x51ab7f49655871a4
	.xword	0x909853617727f663
	.xword	0x4dfe7197887de779
	.xword	0x9f7eb09379a21478
	.xword	0x709471167f606a37
	.xword	0x4ca34f3c66eb0949
	.xword	0x31f9495a0732ba0c
	.xword	0x362318b108bbf16c
	.xword	0x02b41a44c450e49b
	.xword	0xec03df17fc3a2bc0
	.xword	0xa5b98032586ea6cd
	.xword	0xcaf26efd1c6b02a4
	.xword	0xf1d4dc9694861590
	.xword	0xe8b1ab502ac8d09d
	.xword	0x8ae3ef9d3bd6a017
	.xword	0x486b94b75b82a757
	.xword	0x49a6cf6da2886f3f
	.xword	0xc9919978c322c2b0
	.xword	0x70a29bce4503b9cb
	.xword	0xdeaebb0a505c29e9
	.xword	0x1e32e42ad795890c
	.xword	0xc39a77d75404f485
	.xword	0x519b3bbe9997a3a6
	.xword	0x1fe5f4b17da975e3
	.xword	0xc25ba71b1b3790e6
	.xword	0xe2b81f8557c55b67
	.xword	0x41056b53f1fdfdb5
	.xword	0xcb7b680b11d5f0bc
	.xword	0xb7c99b4e42f84e6b
	.xword	0x6321e808ed59d788
	.xword	0x9d345e12fb51b4dc
	.xword	0xf8a822e95d9f8176
	.xword	0x5d30546bd3fa7b83
	.xword	0xa5fe8b5cfe257b9b
	.xword	0xe6addd930eae9b29
	.xword	0x38c15350f87d4670
	.xword	0xf7e06582a5f3f6e2
	.xword	0xbc03ac661c222bb6
	.xword	0x6fec305f8ab0a706
	.xword	0xa5f31a88c7e3432f
	.xword	0x2fe8529bc4ce207f
	.xword	0x08949b232489bb3d
	.xword	0x5e2f65ec527047af
	.xword	0xe9e09529f4d8ebd7
	.xword	0xe0eff345634cc1cc
	.xword	0x5ba324caada99c0d
	.xword	0xd83b83ab1dad799a
	.xword	0xf9016181aee52bf1
	.xword	0xd0ef394db0b45040
	.xword	0x61ca4e4c389f0cec
	.xword	0x2f597a2520f78cee
	.xword	0x303862ece2f09c76
	.xword	0x12c60afabebddf08
	.xword	0xa5c255d410d6ca83
	.xword	0x6278a966e4cd8acb
	.xword	0xb580043ac9893fab
	.xword	0x8aa9c9691c50d934
	.xword	0xc904d3814bb7433a
	.xword	0xd217416bc46edcbe
	.xword	0x65ab8463069b37c3
	.xword	0xae6d6c64cf4df4da
	.xword	0x32265e2a97dc76b7
	.xword	0x1bb7b2b67547b3f8
	.xword	0xb51dd82efd07104e
	.xword	0x5b5c07d055e14319
	.xword	0x459e0910e0d5e559
	.xword	0x2d320de5596e58ed
	.xword	0x4e3e7eb6f9aab89d
	.xword	0xb5c943ef3682493d
	.xword	0xba2b873e5de9bf7b
	.xword	0x2cb3126b89c1cc0d
	.xword	0x12f85a1b914c51ff
	.xword	0x1e15a83db8662b6f
	.xword	0xe52761699749f0f4
	.xword	0x85c0c521561e0612
	.xword	0x45dd677613ec3f17
	.xword	0x0e879455fac6ef06
	.xword	0x037d01306c089279
	.xword	0xa42e27410c24084e
	.xword	0x2cc54639f11a261e
	.xword	0x487b4e516e68db26
	.xword	0x5b435ffd04b3ad6e
	.xword	0x968a7b581a1b4d1f
	.xword	0x3f6525cd5e9eee6b
	.xword	0x10117eba20e8bb9f
	.xword	0xd6102a0dbd612d75
	.xword	0xc2499e40fe10644e
	.xword	0x49b3dc27776a9c24



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
	.xword	0xc13e6ce7da67c989
	.xword	0xad4ae9effcd6cce6
	.xword	0x621c02ddf66cf285
	.xword	0xe88557918a053583
	.xword	0x11d995901869887d
	.xword	0x33d5796a5692026e
	.xword	0x1d6d7ec74fcc301d
	.xword	0x30d60252a9d66d15
	.xword	0xcc1ba5841b6873a2
	.xword	0x3648118321ce4b34
	.xword	0xdc6c767f3d87db24
	.xword	0xbf72bdd6868c427f
	.xword	0x3103384ef47957a3
	.xword	0x30ac936790d33f5c
	.xword	0x51084099e0badbe5
	.xword	0xe6b2f56ecebcf633
	.xword	0xc3e0f8bcb1e92aca
	.xword	0x49f0505d90d166e4
	.xword	0xe8d23cf812abe8b2
	.xword	0xb8deb67426f7cd58
	.xword	0xa5ba4a797e567a31
	.xword	0x104ce167bda9eacb
	.xword	0x09aad787d8664781
	.xword	0x731e0284045619e4
	.xword	0xf36198cafa454dfb
	.xword	0x9dfd1e6f772a7814
	.xword	0x1f7b7c147da9cb5b
	.xword	0xc924ff5620fb3cb2
	.xword	0xa3d91cb6de232620
	.xword	0x59da390e3cc315a2
	.xword	0x540cab9b76136626
	.xword	0xaf628db9d3ee85f2
	.xword	0x8e64efdd0c99ed6e
	.xword	0xb43aa1ec73b09b0b
	.xword	0x4aaa34636bff7283
	.xword	0xd4d8191d012fbb68
	.xword	0x2984de95133a1441
	.xword	0xf6e389ace324f634
	.xword	0x4ba7007e15e28742
	.xword	0x10fdea641075f6ac
	.xword	0x3707646662f57f03
	.xword	0xf8fd58a10d220b1d
	.xword	0x405b7b3293831268
	.xword	0x42821b7672213f6a
	.xword	0x23432169a80a2103
	.xword	0x5ebd85572134a038
	.xword	0xedcba71d040ae7b7
	.xword	0xc5a6ade7ebddfcf6
	.xword	0xf5e0d0236bc0e726
	.xword	0x57ac7acb8f816f1b
	.xword	0x1c09e3de76e5eea9
	.xword	0x129ee76b1b4c874c
	.xword	0x0d4eac52d0657478
	.xword	0xe7cb3be03bee6a8b
	.xword	0x805a462605368edf
	.xword	0xafbd22a12b8b6c1d
	.xword	0x82754cec945ced63
	.xword	0x73e57c417eb42635
	.xword	0x751e5d6894fc6ba1
	.xword	0x93e201645f976179
	.xword	0x32131e65a3c47c78
	.xword	0x264334d4c246903c
	.xword	0x2b8b9de8898f1ec1
	.xword	0x59ccc216e394331c
	.xword	0xc8474eef4574e28b
	.xword	0x94578282bb8310e4
	.xword	0x89a2d436fa38ab3f
	.xword	0xa6aca5b0f2385eaa
	.xword	0x37c4ff10ce7e34d2
	.xword	0xdff880ac97caa93e
	.xword	0x6fee0c1e5367d07a
	.xword	0x2de5addecf6b36f4
	.xword	0x2859cfe9e41d2fb9
	.xword	0xb21be9f5822b02e6
	.xword	0xabc9446e4f3a8aaa
	.xword	0xbb0655566bb797f0
	.xword	0xa88c545d198b7682
	.xword	0x14745704c3743b80
	.xword	0x350bcee946021ee1
	.xword	0xe5bbff98af0434b7
	.xword	0x25cf712686edb436
	.xword	0xddc629cc67f2cb87
	.xword	0x18d7b9f0458d830b
	.xword	0x1a3668a2e7a5b2d4
	.xword	0xa358abd1c0b938a2
	.xword	0x97bb773033b8b74e
	.xword	0xcdaf8cceb7e42c50
	.xword	0x1a4ad3da3baacfc6
	.xword	0xcaf4666a01cd95c3
	.xword	0x8ebcc40b607cc8b3
	.xword	0x72217d825661c0d6
	.xword	0x5bbf6f2959664e6a
	.xword	0xb284408291754b48
	.xword	0x0b16d8484b7e2ceb
	.xword	0x2b5f80c28842ea99
	.xword	0x72f7c527626856b9
	.xword	0x946b879f269c9784
	.xword	0x5561f30a27f0a0e5
	.xword	0xddd6cd84f5d65395
	.xword	0x6afd07e98c2562e9
	.xword	0xce879a03de552cc4
	.xword	0xeebea7f309efd98b
	.xword	0x208a3ecf64927f6f
	.xword	0xe9d4a2ccc6472e3d
	.xword	0x6e95c8e4a5e34f8d
	.xword	0xf4a149eb8f46aa11
	.xword	0x5e53f1cbf32a6b36
	.xword	0x2423aeeb0957e969
	.xword	0xf26b3a8db2c7ee90
	.xword	0x91b8fb8f28faf2d3
	.xword	0xc210544793b79cd6
	.xword	0xd05a1b6cda98d097
	.xword	0x0a93bba572c6d8fc
	.xword	0xa4d73961ae7b9375
	.xword	0xb842dfce3b617b83
	.xword	0x3a6271fc5dc725ec
	.xword	0x2d3dcaaf432f798b
	.xword	0xf2da47f0a01d1f80
	.xword	0x887736dff780f463
	.xword	0x4acd00af90113319
	.xword	0x6377d2ec6e1e32fe
	.xword	0x80fe9dd60b5246c7
	.xword	0xc06af9b2ac371599
	.xword	0xe2e0738d3d6fecce
	.xword	0xf46d5e0793c51d04
	.xword	0x3a1532f9d4315c56
	.xword	0x53d60f53af79bfb7
	.xword	0xab41e89095bd3bd4
	.xword	0xe7c319744aa02f9a
	.xword	0x4d0de6c4a6829167
	.xword	0xfb533fbf768c4c05
	.xword	0xde019cbc5495fe36
	.xword	0x4364108143373ae4
	.xword	0x13ddfa9d28f6a5b5
	.xword	0x98e21c69447f567c
	.xword	0x9928d771a390ea45
	.xword	0xbcce3258ab07d948
	.xword	0xc9aecfdb40457126
	.xword	0x8e95e43efb3791bb
	.xword	0x199d5131e8f8692f
	.xword	0x4f9aa2e96c795a47
	.xword	0x10177373a080ad47
	.xword	0x7d098342b7fd39bb
	.xword	0x7f65edf7753883e8
	.xword	0x047b230db444246d
	.xword	0x66515e58dc78a02e
	.xword	0xd5989dc830c1c584
	.xword	0xa75f7da879acbd1d
	.xword	0x26e972467bbd649f
	.xword	0x80b8e2945b2e7809
	.xword	0xa4871666b7a4fd87
	.xword	0x0ede9d21f3a4997d
	.xword	0xc142217138945470
	.xword	0x0ea36d5d46400a6d
	.xword	0x01471370b9300be3
	.xword	0xd03320c6fc4ad258
	.xword	0x54cbf4fe779f6e0d
	.xword	0x4c99ee819b3d4b81
	.xword	0x957e8814ec8fd929
	.xword	0x72031fabf641c718
	.xword	0x5f8d57a8cb128696
	.xword	0x81d36a17c72328f4
	.xword	0x73c80177ea136fe1
	.xword	0xb30e428ad60cd328
	.xword	0x12ee0ff228093066
	.xword	0xe7a8e04ee3d7cb1e
	.xword	0x534bc641c82e26e5
	.xword	0x2e874da8e4f82975
	.xword	0x553d54d824a693dd
	.xword	0x15a02b1f9d154b58
	.xword	0x8388b7dc67e7bbd4
	.xword	0xf2efdb5d298b6351
	.xword	0xd706c9c7b54e0b17
	.xword	0x1a947293461be5df
	.xword	0x2de876d680080a2b
	.xword	0x5fc4d9981bcc312d
	.xword	0x97b5fa8b756f6df7
	.xword	0xae024ea58cbceb05
	.xword	0xb5b7c9caa747d296
	.xword	0x94882ece7ef8349f
	.xword	0xb9bb99b75ab96a80
	.xword	0x321b6ee5a3b2ef0f
	.xword	0x7220f32e5b8f1c57
	.xword	0x57d5fc958b84bc41
	.xword	0xf7c4b9a63f579615
	.xword	0x1e21d3bf6dd7f8c4
	.xword	0x36a5cda0b3885a11
	.xword	0x14906bfee04b0478
	.xword	0x454701f0235b8979
	.xword	0x2d8a8309f500cca6
	.xword	0x4105558ea45ff0bd
	.xword	0x0860a738718597e9
	.xword	0xd73e8b1360dccef1
	.xword	0xe94d91cf5ec35ec4
	.xword	0xe2002b5079b6f758
	.xword	0xf07823e518ae354c
	.xword	0x69d52c039f2bd3ad
	.xword	0xa634a21a4c9695cb
	.xword	0xd3029ea4a4df12b2
	.xword	0x713d358462bfb654
	.xword	0x1ae269b87ae5ac19
	.xword	0x201c32d101976e7b
	.xword	0xd4ed877c3fb4465a
	.xword	0x5a88ce25aa2e31c2
	.xword	0x1814c6fe3bbc1e0a
	.xword	0xa0de284189c66945
	.xword	0xbe36723173766c60
	.xword	0x5f5664265aae1fc1
	.xword	0x2d4481a8a359be9a
	.xword	0xc9bbac5068e0b6ed
	.xword	0xa7fbf58fbb12f597
	.xword	0x6a7408dee34c00c4
	.xword	0xe3b7e691c8446b6c
	.xword	0x74e475ce9af48c83
	.xword	0x5e08da2a75dbbd3d
	.xword	0x448e92bee22143fb
	.xword	0x77bc4982447b1551
	.xword	0x2ca60a90ba71498a
	.xword	0x6acd83d1f9507683
	.xword	0x6579ba4edfc0a029
	.xword	0xb260153f0be01915
	.xword	0xe4d9b59876ef2438
	.xword	0x6bd3a87c4f0287c6
	.xword	0x24d20338debd353b
	.xword	0x25333ac9d40ad359
	.xword	0x7bafccc28147e0fe
	.xword	0x1feb530748aea3ae
	.xword	0x3019f4fd3263588f
	.xword	0x20caf2a5fa892e0a
	.xword	0x2eaeb36d469e1ed0
	.xword	0x098dc0f3f76f44cb
	.xword	0xf53fc436e1594393
	.xword	0x6f77c5f332d68742
	.xword	0x2c683ffee14cad42
	.xword	0x2af2734649da0eda
	.xword	0x836734041f0048e5
	.xword	0x6fce0323e14de138
	.xword	0x2518b0d43a08e3ed
	.xword	0xa3b12944f0f9528e
	.xword	0x6c5de9e81de55ab2
	.xword	0x79c77269e68117c4
	.xword	0xb88c0f9917499231
	.xword	0x7bd1daf50c76b350
	.xword	0x266a79addf6f97b4
	.xword	0x1f2fa8fd217a705e
	.xword	0x65bedb19afdcb32f
	.xword	0xf29ab7cea8819119
	.xword	0xaf076017b2315f28
	.xword	0x4f7fbc03fd9f618c
	.xword	0x0beba68dd2e435da
	.xword	0x21a5ce5871c3c0ee
	.xword	0x0026a7dab6ea5ff0
	.xword	0xcc30b4a9dec44ad2
	.xword	0xe30a09e1e2f6d32c
	.xword	0x2967d0bd2195b0d7
	.xword	0xdecd821014e7b3f7



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
	.xword	0x729bb5d12a4a0eab
	.xword	0x1477fd915ff288e3
	.xword	0x89e4381cc8e1d7f4
	.xword	0x41ddb0b3eeda2ce5
	.xword	0x0d329c7c6bc370e2
	.xword	0x1a6c728e0b5ff950
	.xword	0x0ca33116119582f7
	.xword	0x6e63ff0c88ce89bd
	.xword	0x5c1599ee4af362ed
	.xword	0x65c6f84b7eee980b
	.xword	0xce283e11c3a5ca98
	.xword	0x18ca62a01b369feb
	.xword	0x96bc21191355c792
	.xword	0x0c41669c2a88f108
	.xword	0xc9ee419635432601
	.xword	0x90918b7bae0abf9e
	.xword	0x6f64ab8cb39bafd3
	.xword	0xd998c8c76cbd665d
	.xword	0xa7f6a4456f0ea522
	.xword	0x464dfffbed92d938
	.xword	0x39c4e8b52c1e7454
	.xword	0xee5abb715ef98f63
	.xword	0xc6f3b1a6991f26fa
	.xword	0x956aa7cb73140053
	.xword	0x940dd67e4836c712
	.xword	0x02ef98f489ae9a97
	.xword	0x002bd615f98a49e9
	.xword	0x77dd946bcc262b6d
	.xword	0xadf207cef7bed6a0
	.xword	0xb801c448f3b92d1d
	.xword	0xb1660e3aa49ca816
	.xword	0x7e3d36a4516e734c
	.xword	0x4aab6a65cf5d1731
	.xword	0xd7813d2e9168d39d
	.xword	0x2a1609ef02a63baf
	.xword	0xb4905a149d4288d1
	.xword	0x52c100d2bd3c8dbe
	.xword	0x58f0aef2fba7640c
	.xword	0x4d40827413b6335e
	.xword	0xeed73969856a5588
	.xword	0xe0d29857213a4c9c
	.xword	0x423448c5f5ce32b2
	.xword	0xede2cfda178fb14f
	.xword	0xb52b973c42ef0be4
	.xword	0xe89b60a1f38fddc5
	.xword	0x385d3a7f735a2a13
	.xword	0x4e115730e7ac80bb
	.xword	0xd7dd3560aa6a9545
	.xword	0x08b86c3258a4c2ec
	.xword	0xc4ebd04b6cb25c14
	.xword	0xc97de7220839d21f
	.xword	0xc02102f3f3739876
	.xword	0xc42da6463fcc01c3
	.xword	0x66c890f2e0cc8623
	.xword	0x8dcf2142ae4646c7
	.xword	0x070956153643cadf
	.xword	0x5e5393bda0f0083c
	.xword	0xa1a1164bfa21655e
	.xword	0x58832823f94e7962
	.xword	0x379fc4831c585a51
	.xword	0x012f2145a15a8bbe
	.xword	0xb5cb16224a6cf43d
	.xword	0x752846eb18e1a8c3
	.xword	0x6ec088e954003b9b
	.xword	0x55ca31f787ee5f94
	.xword	0xcd34a80f75535691
	.xword	0xe36d4f8923e69cc9
	.xword	0xa518c313f6486f00
	.xword	0x2074d15d7ae62661
	.xword	0x635336064f032fa5
	.xword	0x601ea7aa98d2d7c5
	.xword	0x922252a2ee72a536
	.xword	0xd196b8dae319b1b0
	.xword	0x6e185a59fb2db981
	.xword	0x25e473f3bdd9bfda
	.xword	0x5b4ce4b3e37cfeea
	.xword	0x446c916d1a6ea80d
	.xword	0x6e79bcfae18df28b
	.xword	0x5da396dfe4228227
	.xword	0x6274a83a844aa566
	.xword	0x11b7f9d76cd1e4ac
	.xword	0x20f7f10008bd32d5
	.xword	0x449775707df36d00
	.xword	0x495d5dc59b807bf2
	.xword	0xa272b408645b1e34
	.xword	0x8d5bd83ae72ca50e
	.xword	0x78242d2eae1484ea
	.xword	0x3dd29a3097dc42f5
	.xword	0x8830c1edaeface4e
	.xword	0x407dda30598e8801
	.xword	0xa91836157f54c51f
	.xword	0xda457c9926c85c36
	.xword	0xda431485298414b8
	.xword	0x41cc917cbd9bf486
	.xword	0x5c4bbef5d9d5dd9a
	.xword	0x267b1853c760e6fd
	.xword	0x3300b2d62cbd2686
	.xword	0xc79e12d495d321d4
	.xword	0xbee64f214137dd40
	.xword	0x3d6c2bab9d4b7da7
	.xword	0x632c8f533ba2c7be
	.xword	0xf9cc2a54411fd5fa
	.xword	0x6512be775983035b
	.xword	0x2f9eead75794db62
	.xword	0x5fd42c0af93e52e0
	.xword	0x6753fab258519b44
	.xword	0x8e2cf2f124150847
	.xword	0xa26d087369624dbd
	.xword	0xb0dc2867bce217a1
	.xword	0x793527c07fde98df
	.xword	0x5c8adf4138e9e415
	.xword	0x734b4050dd557e35
	.xword	0x26cdcd5769d1b4c6
	.xword	0x775f33da8ca4456c
	.xword	0x6d36ba9e37270e31
	.xword	0x69c57a6d016bb108
	.xword	0x077d680eb71cb7c4
	.xword	0xa2fde84e846d0a3b
	.xword	0x3c372d21228daeea
	.xword	0x95aeed7fcdd4aad4
	.xword	0x5548d524ac2c45a1
	.xword	0x69c39079e637903b
	.xword	0x256fe33322f9d79a
	.xword	0x285397de1bf02553
	.xword	0x5391eb08e90c5a3b
	.xword	0x74eb38c6437b82d8
	.xword	0xd3ceb88618c0b138
	.xword	0x65fbcfa1a339887c
	.xword	0xcb01c3e57419c367
	.xword	0xed5be330be67b40e
	.xword	0xbbd0e3967fc5e059
	.xword	0xb70762e726f36c7a
	.xword	0x3b68a10a0b173192
	.xword	0x80291647d3d9de2b
	.xword	0xa1b057ea759278dc
	.xword	0x86857bab4169add3
	.xword	0xa35ca28199f2a2b5
	.xword	0x8648c3a0272eefc1
	.xword	0x91a0b2c22fc2740a
	.xword	0x9f55d25c49394ea8
	.xword	0x657a981df50adea2
	.xword	0x37b66159c84908e6
	.xword	0x5927fab03d4bed4c
	.xword	0x804d772c46ea9c00
	.xword	0x6060fec70405a4c5
	.xword	0xdda4d6594cdc62b1
	.xword	0xe2b37194abede6a2
	.xword	0xd97bcaee6e46fd5c
	.xword	0xef0d83f50f92ed3d
	.xword	0xe2206fbbbbf4b677
	.xword	0x3bcec62d2b79d2db
	.xword	0xb008511796441255
	.xword	0x00937b6102241f14
	.xword	0x4057178258f2b184
	.xword	0x6d88f1e3b2d0cd24
	.xword	0x0412a4dde929c125
	.xword	0x3c823e9b042ef8ea
	.xword	0xde3aa745667aa636
	.xword	0x14bbefbf9ba8c97b
	.xword	0x508bf56c6227324b
	.xword	0x0e8fcc1072b399d4
	.xword	0xfc93698b9081db9e
	.xword	0x4a9a72ee126b9ad6
	.xword	0x0c96a2f315eb50fd
	.xword	0x3e499c7cd3880448
	.xword	0x417f7bf1c0a0ea09
	.xword	0x9aba555273458943
	.xword	0x48900fead500b15e
	.xword	0x890d5361b7199ce0
	.xword	0xcace4d3702d32cf5
	.xword	0xedff0812b5cae4f8
	.xword	0x1a148294997cf4f1
	.xword	0x6afa72154aa18b5d
	.xword	0xaccb35ea6399e393
	.xword	0x2744a3587d29f6f5
	.xword	0x6a5adaec5abb7145
	.xword	0x60b8b68b1dcc4093
	.xword	0x9581499c3b70313f
	.xword	0xa163e757c9edf418
	.xword	0x95bb3270df7fce25
	.xword	0xfbe5a8234387889a
	.xword	0xab26b97bc51b2cac
	.xword	0x564552a2e22bebd5
	.xword	0xe91c29ad955c47e4
	.xword	0x4223782921f57c3b
	.xword	0xb2875e663f385061
	.xword	0x08c141fa64d65996
	.xword	0x4b8c9b9d074caa6a
	.xword	0xb8b6da5a8aca21a3
	.xword	0x19ed5189f8850b6a
	.xword	0x1d688c9c15b538b0
	.xword	0x73e78edbc876d725
	.xword	0x69f3b7fb5cd4b206
	.xword	0xfb0039c8b72bad0a
	.xword	0x423e126a505041b2
	.xword	0x650f4f704822ed57
	.xword	0x61356f9d89673fdd
	.xword	0x27b66c0f4b91a947
	.xword	0x207482760c0be48d
	.xword	0x218dd0faa9763152
	.xword	0x4f31f5860a729787
	.xword	0xe23311522caa851e
	.xword	0xb2564bfa49186330
	.xword	0xb088de16bb9863d0
	.xword	0xc61b1b5614ca75cc
	.xword	0xef285f8feaf315eb
	.xword	0x56da797b4d02a1a7
	.xword	0x9babfe13d836cc64
	.xword	0xda25362f4ffee550
	.xword	0xa6afe8a1a8d7fab0
	.xword	0x09a2864809066cb9
	.xword	0x14096b6ed270bdc4
	.xword	0xcba4ca2b8e693959
	.xword	0xaa7922961ffe8b83
	.xword	0x0dc4f0a16f267bf0
	.xword	0xcb233103e6526a96
	.xword	0xc4aa55295ee17293
	.xword	0xf2162d87418262f4
	.xword	0x5f6d16cb4561f07e
	.xword	0x026a060deed5d0e9
	.xword	0x787d1cc9d5ec6418
	.xword	0xd9de3b863a5f18e4
	.xword	0x89a3d1d3c01c2c53
	.xword	0xd918d919578a6661
	.xword	0x485eae0329fceec3
	.xword	0x79d1d02103bcd89d
	.xword	0xe8816838763a926c
	.xword	0x3f3014ea1a616676
	.xword	0x147b7d04a103e5c3
	.xword	0x4c6fad06aaede596
	.xword	0x9e3e3c71c49d2cca
	.xword	0x91d8deeef0954d4b
	.xword	0x404951207ed35b99
	.xword	0xba4ef35db9e99882
	.xword	0x57a8981f2ce20956
	.xword	0xffb7bd815e30acc7
	.xword	0x368391b458cf27b3
	.xword	0x7853b52820f28b29
	.xword	0x04e2f5d234585927
	.xword	0xc4349e9edff3a2a9
	.xword	0x7bf98ce2e7fbc9d7
	.xword	0x6946bf02e69afcf2
	.xword	0x5d53f7deebf35430
	.xword	0x1612680d9f336c37
	.xword	0x5e2334419c3b177b
	.xword	0x6bcf839ba9a686fa
	.xword	0x4b60f7304cc548c7
	.xword	0x8734dfc326567a8f
	.xword	0xf45fced8d12d5973
	.xword	0xf6e40d38ad183670
	.xword	0xd1e57ae58b066346
	.xword	0x160969ef78c39a15
	.xword	0xfb21ec56a75151ef
	.xword	0xd625d386658947e5
	.xword	0x19779a947b139372
	.xword	0xa133dfae4f1458c2



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
	.xword	0x52a532a19a2891d2
	.xword	0x918f4dd958dd2a19
	.xword	0x77d2ef6cdd1c4c11
	.xword	0x880c376ccd338f48
	.xword	0xc9af39c307d86c43
	.xword	0xc7a7a488bab99f03
	.xword	0x8b209cdf49fe4365
	.xword	0xbfb93baa05cfe86e
	.xword	0xef1919dc687569c4
	.xword	0xacde0697c58498d4
	.xword	0xc24ee95f8c40e10c
	.xword	0x922969cc5238db5a
	.xword	0x4b624eb80fff0e2e
	.xword	0xb753be866624364c
	.xword	0xc473faa8eb51b8b7
	.xword	0x4927584d4ce0ed29
	.xword	0x05efc4583bfcddca
	.xword	0xced810e113c80da6
	.xword	0xa43c856fd9062e42
	.xword	0x8e172d24bd19faca
	.xword	0x440a4d277c5e3d9f
	.xword	0x18518702d20cf574
	.xword	0x9c77e9e7a0698b31
	.xword	0xc9b95b7cc9a5d08a
	.xword	0xbd26fbc8ab8a5a89
	.xword	0x019b0f18609bc457
	.xword	0x3e0b0e44545d43ad
	.xword	0xb067227721266704
	.xword	0xd5746cc2fe842f7b
	.xword	0x57d65312bf899b6e
	.xword	0x51a399a575a7b852
	.xword	0xc667775a85590a61
	.xword	0x342d0437f5cf7a12
	.xword	0x8a799b93e831b163
	.xword	0x38cf8c8ae51a5185
	.xword	0x37cec385bea8876d
	.xword	0x9d34b0a083bb2cd2
	.xword	0xd9ee8ee7a327b733
	.xword	0x61d96317e75ffade
	.xword	0xba7afd8223c55267
	.xword	0x70cd233c282908ef
	.xword	0x90817e5874b4344e
	.xword	0x996e3d3a68ed1a2e
	.xword	0xaeff89ad40f76a5f
	.xword	0x8b073684eff4903c
	.xword	0x81be8d5d3bbabffa
	.xword	0x93ca6fd607740efd
	.xword	0x00396a3ff92f133c
	.xword	0xa7d31bda8c84d53d
	.xword	0xf99be53be4210cac
	.xword	0xa7d23fe883026c2a
	.xword	0x66ea3bcd18fa9720
	.xword	0xc252f77ceb2e715d
	.xword	0x62326f99fe90d87c
	.xword	0xdc4892a9c3b38532
	.xword	0x88c5a483c1d0a712
	.xword	0x00833e5ea7adecff
	.xword	0x301798f78be8b55b
	.xword	0x5163d1e264b834ed
	.xword	0x474a876389a273e8
	.xword	0xc7d7fe026402c075
	.xword	0xd4d7ba3af7ee30db
	.xword	0xa5b49546aeede351
	.xword	0xac9f6e994aa2b0ac
	.xword	0xba64ca236d7fe416
	.xword	0x26b97f75c497a388
	.xword	0x9950a2ccb579f905
	.xword	0xf4c98388b59f1613
	.xword	0x49587354d5769415
	.xword	0xbd9e3ab5ba7cc299
	.xword	0x615f285810c55a8f
	.xword	0x63dc1fa00a527b8a
	.xword	0xdd2187bd0a9fc088
	.xword	0xb3b6bf049aa63979
	.xword	0x4af37dce27685ae2
	.xword	0xf220769b24816039
	.xword	0xa4c9008b20ee98e7
	.xword	0xbeb24ff341d84818
	.xword	0x2820700f8436e9e8
	.xword	0x201b123cc0443242
	.xword	0xcadba389d6a86750
	.xword	0x65a02185e4d18ea7
	.xword	0x2db5d64147b83075
	.xword	0x21391020dfbf22a7
	.xword	0xb71298936422bc5e
	.xword	0xd3039d1bb873b6ee
	.xword	0x1f0e7a36e605b72b
	.xword	0x397c24952694ec12
	.xword	0xab2c9d8f49761232
	.xword	0x7eb7e65a5b6258a0
	.xword	0x500edfb86d4d4e80
	.xword	0x3af2344ed53de956
	.xword	0xd395163fd49388cc
	.xword	0xb44ac73bdbae6526
	.xword	0x8c013fe1197cd974
	.xword	0xb795a70c750618dd
	.xword	0x623b9f652c431f5e
	.xword	0x8d15b8ecf71dfff5
	.xword	0xad92d70983eb3125
	.xword	0x83a01a32863e59cb
	.xword	0x0d310f224a260723
	.xword	0xb4f26cea69f0f8e1
	.xword	0xeaf3c6c7b157cfa0
	.xword	0xb7578912a9b582db
	.xword	0x024057a2b08e512f
	.xword	0xebda36501fca4f63
	.xword	0x11a6458ea502ed52
	.xword	0xdc1a2e90513fb7da
	.xword	0x286c36f054ccab97
	.xword	0x74c7267199e756ae
	.xword	0xbfd76bfb3345cf27
	.xword	0x8bb28566620d8a7e
	.xword	0x922bca6161aa4477
	.xword	0x0ddf1e20e139eb23
	.xword	0x9ebfdcc1cc2148c1
	.xword	0x7d48ad29725f6e1b
	.xword	0x8de54796fe820e1b
	.xword	0x8ba05493bdeb1ba8
	.xword	0xd38238d7ad9f4568
	.xword	0x84b1eadcc9276bf1
	.xword	0x07bde2ecc5d3a3a7
	.xword	0xfb77cb23dad36ccd
	.xword	0xa937f598531f6c7c
	.xword	0x5d800fc876a51dc6
	.xword	0x3e4d0e74ecc4bf91
	.xword	0x0ae3c964c459fef6
	.xword	0x967d622a32b3b76b
	.xword	0xfba2dc1b27bf65f1
	.xword	0x2af967897e7973f6
	.xword	0x04ff41b22f091103
	.xword	0x27accc735cd29743
	.xword	0x01144c874b062972
	.xword	0x6bb9ae80c2c6e559
	.xword	0xc1121232d05016d1
	.xword	0xd85c564f05e14d48
	.xword	0x894848f03485d812
	.xword	0xef12a5b560480761
	.xword	0x48767548bdbafd76
	.xword	0x504200421c0ec6df
	.xword	0x29dc48267d20ad31
	.xword	0xc2a27091a6e439bf
	.xword	0x181ce1700538e05a
	.xword	0x9951f34fff644d33
	.xword	0x5b70196b2730ea21
	.xword	0xa7cc50614e70dab2
	.xword	0x65117b51d9b16a18
	.xword	0xef1bf35962462d9c
	.xword	0xc2ee47720145c67c
	.xword	0x4cda0c4fe092d969
	.xword	0xa927013318217c48
	.xword	0x8040a7ea311eb21b
	.xword	0x793f36021a494027
	.xword	0x2891b5cf3a1b6e46
	.xword	0xad938a94d695890a
	.xword	0xc5b5c2bba9ef1661
	.xword	0xf85e9a84808c7fef
	.xword	0xb8c4c059500e4e17
	.xword	0x9c7f8698ded9fc61
	.xword	0x8ac1f72883c27b5a
	.xword	0x9cc3c1789a6f20a7
	.xword	0x6b31d6e8c20f069b
	.xword	0x5df1c496144214f0
	.xword	0x7ba2fb7005624475
	.xword	0x1ae84cf76951e464
	.xword	0xb6094b50961d6a0e
	.xword	0xa88ecc8b7d58ff20
	.xword	0x3b5fa01ba4ea65cf
	.xword	0xf2c3e67793c63ad2
	.xword	0xaa8f7d7744ac8562
	.xword	0xd6363246903425b8
	.xword	0x99b0832a50366b00
	.xword	0x2b451b15f07efff6
	.xword	0x8f7d4729f606b8dc
	.xword	0x8d9af9aab7100edd
	.xword	0xa13d81b55c96bf08
	.xword	0x324cc52dddc15c0f
	.xword	0x178c9a86bd86dda9
	.xword	0xc781357e462cf25c
	.xword	0xf5ab0f332d491866
	.xword	0x38732f43849e1823
	.xword	0x279f7591f17c4b9b
	.xword	0x532e4ebf506fb196
	.xword	0xe23ba217c4cd4089
	.xword	0x412ad9b86e1f4517
	.xword	0x9612a2e0317bd69c
	.xword	0xf18c223e11598fbd
	.xword	0x62a07e0062e7a4bc
	.xword	0x88b8d181dbf089d8
	.xword	0xa812871dee30045a
	.xword	0xb75adabb1b727294
	.xword	0x4ed96e9514afc04a
	.xword	0x0da0573cf04294e1
	.xword	0x2677b623553db1ee
	.xword	0x4cecbfda5b19ffd0
	.xword	0x323b227b7c2b1ce8
	.xword	0xa226386e12b8dd45
	.xword	0x108216ee845dff53
	.xword	0xefba94d3dff9e3e0
	.xword	0x055912ecd4361710
	.xword	0xfa679eb10a046633
	.xword	0x62f02bf92f0a1fe5
	.xword	0xae763ca3d1742bfe
	.xword	0x1f16570038ef3766
	.xword	0x355a2e01e9a178e2
	.xword	0x4e67cf16b41adb3d
	.xword	0x3a4b048241750a50
	.xword	0xc386776c375fb1ff
	.xword	0xd9eb91db926711cd
	.xword	0x71d4c1798275afec
	.xword	0x16a4f4ed191e4a71
	.xword	0xec1651d116f6cf73
	.xword	0xaa2e18b283edbc31
	.xword	0x587bd26df9208930
	.xword	0x431c99b903265d60
	.xword	0xac9dbc8befa8bfcc
	.xword	0x9f062d117076a7b3
	.xword	0x281e96d5f22413f8
	.xword	0x6e7366bf4ab743d9
	.xword	0xd04ce9a664424633
	.xword	0x6ba7f642067de299
	.xword	0x1f43c815e077ada2
	.xword	0x3aded7207de6c181
	.xword	0x0034a83ba35751a1
	.xword	0x0bf205a60c5b937d
	.xword	0x073fe31ac6f9b2b7
	.xword	0x48b0a310fcc5d276
	.xword	0x4fb0cbab5df8b365
	.xword	0xb0a6e546a2ae1916
	.xword	0x4521499b33f9f15b
	.xword	0xdcdb7be591f8f326
	.xword	0x6138302b6a5651f8
	.xword	0xc26e7b944fecf950
	.xword	0xf37ee7381cd0ecf3
	.xword	0x442fc26c79c1b990
	.xword	0xfdff35067324da52
	.xword	0x758377b99d3bdd76
	.xword	0x7b65ed9df8dd9ada
	.xword	0xeb8f6e992d6515b7
	.xword	0x19ba2d8bee745936
	.xword	0x1aff72484d354d07
	.xword	0xbfe553f6deab06f2
	.xword	0x57dfa52fa95c541e
	.xword	0x44004a66e6922349
	.xword	0x034df5f7f8917b75
	.xword	0xe6bfd51a348a0491
	.xword	0xfcd20280393d4a98
	.xword	0xf0025228324d0318
	.xword	0xa38c54656563484b
	.xword	0xd9d84eaf5e850d2b
	.xword	0xa19dba1417287275
	.xword	0x80a652b63f1169b2
	.xword	0x211b94dfbbcd524e
	.xword	0xd7de0df556c2c662
	.xword	0xf95f5dd5fc7a4b4f
	.xword	0x4f2170bc750a3a4a
	.xword	0x91b0279ac17ea491



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
	.xword	0x2233bd1559754a64
	.xword	0x1a84cc01ee1203b1
	.xword	0xbc680e18b5d291df
	.xword	0x37d9e23fb1ae071b
	.xword	0x581051f896aa38ed
	.xword	0x3d91dbb055c4d850
	.xword	0xe248569d5381dbe8
	.xword	0xf0ee697619ff9fcb
	.xword	0x2309656130f26b30
	.xword	0xa2f434ad5ff25d1f
	.xword	0x24807a110db77047
	.xword	0x67f58be3911bd41d
	.xword	0x4af9a43b28698682
	.xword	0xfa6db65d880e0d5d
	.xword	0x32ec2639ef0d4d04
	.xword	0x7e371bd9d4ee9747
	.xword	0x1b8f10b1ac511cd1
	.xword	0x04074bfa2067747a
	.xword	0xf35f44ec72e32487
	.xword	0xb5fbfe9e305f9aba
	.xword	0x796c662026b882df
	.xword	0xdf2abc1d9ec54cfc
	.xword	0x85fd8ed854a9fd4f
	.xword	0xcd42abb383aded86
	.xword	0x706a26850bf9a080
	.xword	0x8ac546c42177b5ed
	.xword	0x1a4bae30fe998a65
	.xword	0x8c8e6054fd5f0265
	.xword	0x2550441fd3991c53
	.xword	0xba90ed247a194c4e
	.xword	0x453ae6ffa842b9ff
	.xword	0x4eda355d2c72ff2c
	.xword	0xbeed6eca673a958a
	.xword	0x3f38162d518c5ebb
	.xword	0x7d907c02de9e4fca
	.xword	0x74d6d06fcf737d94
	.xword	0x8a130f050d5c3eaa
	.xword	0x5dbfaec07d3cf07c
	.xword	0x2982c703ccf81487
	.xword	0x9a940276e386e780
	.xword	0x396c479e9033c038
	.xword	0x4b09c16149d5a4a6
	.xword	0x3f9d9f3ce700a362
	.xword	0xc929b7c26fd64764
	.xword	0xc7e6fcd25a3a5877
	.xword	0x287ef5cf4174b24c
	.xword	0xeb098fb88de3fcb1
	.xword	0xc444e7bdb44fac3d
	.xword	0x3cb1b76419cf8902
	.xword	0x43e93d2da729cb7d
	.xword	0x98c9293f7fbf987f
	.xword	0x1dfc4498aa5c5ce4
	.xword	0x0e349f11d23483dc
	.xword	0x883ffa0d5fdd45b2
	.xword	0x4c24bb53794d5f3f
	.xword	0xfb9a266863f83783
	.xword	0xffc339016a92b10e
	.xword	0xe8127000495aabbc
	.xword	0x92c73f9391fe3c8a
	.xword	0x39e73fed33dbcc8a
	.xword	0x46af0fd6dd6581f2
	.xword	0x8ee912debfde5939
	.xword	0xd504b5b30685acef
	.xword	0x19224dc00f64bad1
	.xword	0x2e99b856b69a7c41
	.xword	0x6b1a72dff38175f0
	.xword	0x8c716f02eb9ce048
	.xword	0x23428b17a9f5509f
	.xword	0x26feecf85b64c5f3
	.xword	0x511669b82233fa25
	.xword	0xb438efced59d4163
	.xword	0x3fd1a902c68e0328
	.xword	0x9315e8deb531b74a
	.xword	0xab315b3493688ede
	.xword	0xebb7313d6eaa3e7e
	.xword	0x2e181d13d2074c44
	.xword	0x8cdba5d5197df94e
	.xword	0x547ef9adf52936b9
	.xword	0xe8b4f42b2a45afa1
	.xword	0x63d97acdb5e6617c
	.xword	0x7829aec5ef24fed1
	.xword	0xfe3378ca21a7ec54
	.xword	0x4853dd906e3446fc
	.xword	0x0f5ed7bb8a7aa251
	.xword	0xc1cda517a1ad59f7
	.xword	0x59e913ca0c05d294
	.xword	0x49f91466bb69e416
	.xword	0x2fdda2247dc0d995
	.xword	0x446999cdc060539a
	.xword	0x5374d91ba5bf26da
	.xword	0x949e0be74d909c03
	.xword	0xcc0f2cb53b791ca0
	.xword	0x0ba27edaf1342737
	.xword	0xe3267b41fb5c3fbc
	.xword	0x1c0e7eb76c4e8cec
	.xword	0x034b5e853646dc04
	.xword	0x9aeb7af5fa22afd4
	.xword	0x10d91ec2b066d203
	.xword	0xb96a27262ceed444
	.xword	0x49e9792b1e35d289
	.xword	0xd2c13ffbff14bfa7
	.xword	0x76e63f20ababc5e8
	.xword	0x39ad4745e8f4ae5f
	.xword	0x90be31fd12fc8c72
	.xword	0xa0e91052e0303b84
	.xword	0x929b51112b65c744
	.xword	0xb4387bfd953df36f
	.xword	0xd71113acba1623be
	.xword	0xf7e524d3979e8bd8
	.xword	0x60aad1ad610c1a69
	.xword	0xae9baaf29a3488c0
	.xword	0x8a2ba945ac383780
	.xword	0x1c235d5bcd830abd
	.xword	0x41f32dcae6633fdf
	.xword	0xe56f6285f77f9113
	.xword	0x4ae9f825082cbc83
	.xword	0x555f302d043d6bd3
	.xword	0x274b1c3915cb2867
	.xword	0x607c2b9e7364cf61
	.xword	0xa2456c95b4159e07
	.xword	0x14db7cc4ed3c748f
	.xword	0x9fd8295cfe2fb17b
	.xword	0x95068766ee177172
	.xword	0x96eed41f09eb2e41
	.xword	0xf72a889706d4b705
	.xword	0xc9918fc8a3c35480
	.xword	0xe4f6f482c03ed74a
	.xword	0x5e5d8e5f7928b145
	.xword	0x021ae79e437bb877
	.xword	0xadd642a834ef2bc7
	.xword	0xee97369d76e6bc13
	.xword	0x3761d7c4db11728e
	.xword	0x0b90c179d6a1b6f9
	.xword	0x44de27b6aad285d4
	.xword	0x148bb8318e935577
	.xword	0x76b6ee8c8feade06
	.xword	0x50b3f0fbbe92f3af
	.xword	0x5797407aa0792334
	.xword	0x3f643933a0aba8ca
	.xword	0x132cc7c156c7d906
	.xword	0x9e2f5fea08949534
	.xword	0x1dfbb543bc4bd9cf
	.xword	0x8576807de4df4bb6
	.xword	0xce3aaa916c79ee1a
	.xword	0x01bff48f8d58593f
	.xword	0x2a3ab7dcfa5f26d5
	.xword	0x1716984078df5d12
	.xword	0x80b5d1adaff604b7
	.xword	0xffe4cc30f9d27082
	.xword	0x0e65c53e39cc4b2f
	.xword	0x44001d62fc7079a8
	.xword	0x717813fdac0d96b0
	.xword	0x2dfff8465ebd6e8d
	.xword	0xe48fc9b926ba865b
	.xword	0x2684e0ac1b28a062
	.xword	0x5f18a27284ace410
	.xword	0xd14abea58039d1bc
	.xword	0xae18e5ad621321d5
	.xword	0xd5fda8ad56c1d302
	.xword	0x059b04689f7058e4
	.xword	0x20f0b7d540c4c9b2
	.xword	0xe6d6f7ec084647ad
	.xword	0xb2d69f2aefd8b079
	.xword	0xa9482dcb02d03ab2
	.xword	0x0953eb6174224978
	.xword	0xa03b2bb7ef026a36
	.xword	0x9798e4e2d5b1aad0
	.xword	0x00f68f7f3dc4df66
	.xword	0x927a093ac6ee6fba
	.xword	0xb343365b617773e6
	.xword	0x512869f11bc5ad63
	.xword	0x5cb3b5009309462c
	.xword	0x41a6e52c5f255f3d
	.xword	0x0dbc265c8d07cc72
	.xword	0xe0549bfb7848bf8e
	.xword	0x7de76534e923a93f
	.xword	0x0d499b51dd53133c
	.xword	0xa69f5565d5e9bfbb
	.xword	0x9a3a16a4b1513d85
	.xword	0x2e30c166ad2d8fec
	.xword	0x02189cc7a8f64b96
	.xword	0xd032d15bb6ffe461
	.xword	0x6d99f7db12c21cb9
	.xword	0x228c2b513c3f523e
	.xword	0x1e9702719e7de967
	.xword	0xa7bae27e6221c9c2
	.xword	0x2fb4b088e74b8861
	.xword	0xb64c1f79b957cea4
	.xword	0x13eb8ad70dc6df35
	.xword	0x7bb69f22efcb757e
	.xword	0x32923ecc68b70b7e
	.xword	0x77ac4567e8d0eacd
	.xword	0xa21eda20304baa91
	.xword	0xd8a603f7c20993e0
	.xword	0xf0fad03b9cdb143e
	.xword	0x4b2d92dc2aeb8027
	.xword	0x4192869a389e8b50
	.xword	0xeab30bf9a89a863e
	.xword	0xe6692b526463fbf0
	.xword	0x5ff543a1755449b8
	.xword	0x29e730ab7447a8f1
	.xword	0xff2482ca0340e149
	.xword	0x8aaf193dc2ff53e9
	.xword	0x4bdab6c64fd152ba
	.xword	0xf36811b2b64c0a97
	.xword	0x6b03f2f854fa08df
	.xword	0xaefa818b0d0336b4
	.xword	0x9972da8dc2a9600b
	.xword	0x2c75ad454f2d9d82
	.xword	0xfdd54cb2fb6980e2
	.xword	0xcb9a97bebc5bb78e
	.xword	0x9f2e2ba25cc26615
	.xword	0xab453221d20ee2b9
	.xword	0x7975bbf2f3ebca67
	.xword	0x0b9329366a1c4cdb
	.xword	0x13a74a3bcf6710cd
	.xword	0x5a2aebb64d8617b6
	.xword	0x28cbdbf44e9af11f
	.xword	0x3ab908230af2e367
	.xword	0xa5f7a1fa0a46ac66
	.xword	0xf7584b4571b13a88
	.xword	0x9e670c97cf1e44a8
	.xword	0x0ad1fbfa7ffd4bd8
	.xword	0xd1cae282ec72f105
	.xword	0xc5050c4f65f1d824
	.xword	0xd059f08551145266
	.xword	0x1d815ded082b17cd
	.xword	0xfae712bcc4fcf3a6
	.xword	0x645990eb618a9692
	.xword	0xbbed9d9aae980daf
	.xword	0xc163a0f51b309355
	.xword	0x51c28cab0414db8c
	.xword	0x4611e7a06537cd0f
	.xword	0xcebbdc38bcdbb141
	.xword	0x3f7bcad6f000f0ba
	.xword	0x61a290fcdfeb4b72
	.xword	0x3eec54d67cc7c0d9
	.xword	0x646f950396da6014
	.xword	0x3f5bf569e98075a0
	.xword	0x6d76ff505f678512
	.xword	0xbe28302e5259ceef
	.xword	0xde6efdd04e02d175
	.xword	0x1282eec27476cb27
	.xword	0xaa277a8a2b161dde
	.xword	0x51e0e0d6bbc97a48
	.xword	0x64447bfec12b36ae
	.xword	0xa8192eb3739c2a5b
	.xword	0xb413dee7080ee8d6
	.xword	0xbc8032857f2023a1
	.xword	0xb0796933b5e0001a
	.xword	0x06d362c0fbeb2a27
	.xword	0xdd647c38aed63aa3
	.xword	0xe4cd10d29af15554
	.xword	0x5800b877ab5d34ce
	.xword	0x808924e5ab7138dd
	.xword	0xd9307bb2d6946693



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
	.xword	0xab390387265d0a06
	.xword	0xe2c1c5ad221c8334
	.xword	0xd957691ef1aa13ab
	.xword	0x6c88f6b61765e050
	.xword	0x8188d4cd9826022e
	.xword	0x34606cdb5a750271
	.xword	0x9cf248ba41651304
	.xword	0x383bfa8b471bab20
	.xword	0x010f35f23f91cff8
	.xword	0xef117cf168c5add8
	.xword	0x1ebc94ab5fce5904
	.xword	0x530cfa054489783a
	.xword	0x25e8dc30b8a3422f
	.xword	0x7009bca1eb1c4050
	.xword	0xfbc641290d5fb69d
	.xword	0x549d2d7d47eb9a62
	.xword	0x0e71edbac65a145f
	.xword	0x60f63ea1203999de
	.xword	0x9be4382d648ab989
	.xword	0x38fd2976d38f726c
	.xword	0xc33e51f675cda23b
	.xword	0xe9a8cb2c5c4aa1a3
	.xword	0x655e1c74e5160f93
	.xword	0x58ce11dded66e0b4
	.xword	0x3a4b6cf0afb1a8c5
	.xword	0x89cf043b86fac4d0
	.xword	0xbbe72bcb19006c05
	.xword	0xe81beb8987520f7d
	.xword	0xe71d7e775498a355
	.xword	0x8ad93af3ba9555fb
	.xword	0x884650acdbf82e94
	.xword	0x88c73fca377217d0
	.xword	0x63614b0f9dd868f2
	.xword	0x4726206856485e2a
	.xword	0x1204c0db4b73800b
	.xword	0x1b251763da5a2ef0
	.xword	0x6ca5cb9c038504b8
	.xword	0x7bec3be42ef9d870
	.xword	0xca3541771cbb45e0
	.xword	0xe334fc5c9e642672
	.xword	0x6f0447a041d8b2a4
	.xword	0x70a36850826054b6
	.xword	0x7128eed8c5ee6a90
	.xword	0x55804296a5217f2b
	.xword	0x8f2764e6ea004cd4
	.xword	0xb7f470f5dbd38838
	.xword	0xf3f0cba2a69a28cd
	.xword	0x638515ac75c28d4c
	.xword	0xe0fe44250910ca65
	.xword	0x4d35b9eabc894875
	.xword	0x9622601314c6ca31
	.xword	0x948e2b407634faf0
	.xword	0xd48a17df9e0b7959
	.xword	0xe2e8936979ffbea2
	.xword	0x288838aef6facb24
	.xword	0x3e96dc56564d9161
	.xword	0x5f8c64884727d458
	.xword	0xf80bc7e1111cb88e
	.xword	0xd87b896d24f5ec3d
	.xword	0x111d18f724d21bde
	.xword	0x063839f3bebbfc59
	.xword	0xcd29220720ae742e
	.xword	0x17c5a3b4ae5316bc
	.xword	0x3ebd3a15359e608c
	.xword	0xf35af40bd87b9cc1
	.xword	0xc6f9e24b26be9f40
	.xword	0xf1ebd0904d39ccdc
	.xword	0x17ea404b31f1f535
	.xword	0x7ca698efd4ce7fd1
	.xword	0xc2db6e3be5d9829f
	.xword	0xc2bc3241138de07d
	.xword	0xd6c7f90353da95ed
	.xword	0x7bc9c010b612ab19
	.xword	0x8eef3bf93e82d2a3
	.xword	0x6ee7cfe793f78575
	.xword	0xc9b73ad240c74450
	.xword	0x64b81f51758c5b50
	.xword	0xdb68d7a7135c57f8
	.xword	0x7616942ca654c3aa
	.xword	0xbff89fbe4cfee93e
	.xword	0xf9fb7e68ea078b67
	.xword	0x09ae5d39c7aaa437
	.xword	0xc1327048db76522b
	.xword	0xbcdc4cb9c5221ff3
	.xword	0xa54c314bb8f0ee20
	.xword	0x2eb631fb216763f2
	.xword	0x7c77ae208e03c777
	.xword	0xc3a4ef1939607702
	.xword	0xa4e85eff135d5fe1
	.xword	0x6ecfbea83eaa2549
	.xword	0xefd0c8d867dca4cd
	.xword	0x48a6516fa77c0a53
	.xword	0xd9230dcfffbd815d
	.xword	0x38e5220d275d7678
	.xword	0x5c7c8424e2d4cd20
	.xword	0xfe969cbc356997c2
	.xword	0xf06b80cc26ca30f4
	.xword	0x7e41719b56c6dd8e
	.xword	0x8a954d9647b4f819
	.xword	0x61f1c96695df74ef
	.xword	0x6574ce5a87bb1995
	.xword	0x4de0cdefa92a5ad7
	.xword	0x2df9ea4fb7bd7fb4
	.xword	0xece4f5519a5ef9d1
	.xword	0x61c59d2a7a4e8f6b
	.xword	0x12b4a17fcae30d3f
	.xword	0xee4bfb83f0078aae
	.xword	0x51560f90282a02e3
	.xword	0x8e4b38090687094c
	.xword	0x10fb4d476107074f
	.xword	0x9be7df3a4e407aff
	.xword	0x1faacf1aab339660
	.xword	0x002a5463c16f6b45
	.xword	0x0806d4eb00f79af7
	.xword	0x1b7c6119643c9789
	.xword	0x27ecd94abd2329c9
	.xword	0xfcceac210d409c64
	.xword	0x69bbadcc28a1b2c6
	.xword	0x7eead22ff67f265a
	.xword	0xb6d2172154c93e93
	.xword	0x581a160c29c17e92
	.xword	0x672d4e5ad4fb2d18
	.xword	0xcd6dbd1b5701d72b
	.xword	0x620ba6354f8ce2a9
	.xword	0x99e4248a89a5cf49
	.xword	0x8b1b679ac9dab7df
	.xword	0x9827f7cc2db59c93
	.xword	0x478e93bc56c96539
	.xword	0x344a247cd061d97e
	.xword	0xd29ec8597752aa52
	.xword	0x7979a62a6657bf39
	.xword	0x76deafe9276ffdf3
	.xword	0x4e14af4579522d1f
	.xword	0x5e8e945ad4bd1e9f
	.xword	0xf72e94506fcde33c
	.xword	0x91016179d7ab5308
	.xword	0xc9665ed4a72ba593
	.xword	0x5530de4a6a1a1011
	.xword	0x93647987eba5de16
	.xword	0x274775f7fc64cc9a
	.xword	0x82cd0aa9657ddde8
	.xword	0xb84e42b8042a1dfc
	.xword	0x876bfff088177f68
	.xword	0xa6a0fee6c147741f
	.xword	0x65183d98ba4ced21
	.xword	0x8c310c8f625c1de0
	.xword	0x500cb4f5e37bc913
	.xword	0xaebc5fe8805483b3
	.xword	0xbc0613f797115368
	.xword	0xd57006e649206668
	.xword	0xbe98099b499724a1
	.xword	0xa529e73b2453e7ae
	.xword	0xa016d13df44cf4bb
	.xword	0xbc854732c4abc6a0
	.xword	0x28f72bee92feec4d
	.xword	0x2deacda7f7a632c6
	.xword	0x9c5fdb5c704d32e2
	.xword	0x623c3b0f8dabb76e
	.xword	0xd27bab8c7508ea3a
	.xword	0x97707e8858a7251f
	.xword	0x43384e888c6f01c3
	.xword	0x4c715f30890cd5c4
	.xword	0x36a83397f5f7759c
	.xword	0x3538948d10d838c3
	.xword	0xf6e30a697207126f
	.xword	0x7a30285bc743864e
	.xword	0x196f76cc60e149e4
	.xword	0x97f175eb67d856ea
	.xword	0x371a6b36f574cc4f
	.xword	0x64fb0fbcab69dc83
	.xword	0x71e4008efc7254d2
	.xword	0xdab9991f28d0ef57
	.xword	0x7a9768b3dafe5f99
	.xword	0xf82dacab54f18af9
	.xword	0x79c2759800be978f
	.xword	0x5373ac2b3b7c0c3a
	.xword	0x81876512bd61e679
	.xword	0x65b30e35ebaaab92
	.xword	0x3c97d1c96fda6b7c
	.xword	0xe269b7b2d3496f1c
	.xword	0xaf2706397d044adc
	.xword	0x5e6ea68e0a34a402
	.xword	0x10dca1f081504f22
	.xword	0xaad6f8b73e56bedb
	.xword	0xb485fba17ef5cadd
	.xword	0xc57a08126e15494b
	.xword	0xb2fe09ed41111291
	.xword	0xe62a9a0981974421
	.xword	0xaa31cb04c81ec55c
	.xword	0x31ba22a71f1f9ad7
	.xword	0xda2983b41bb19562
	.xword	0x289db1a58e92fcfb
	.xword	0x8929243d3b56c522
	.xword	0x218b4718b388d7a7
	.xword	0x370fc5f42222a40a
	.xword	0x3dde6a7c9828a52a
	.xword	0x9c8c17e6890d4066
	.xword	0xdbe361f84a5489e8
	.xword	0x898f4cfc7c2006be
	.xword	0x79f47f84eca318b0
	.xword	0x64e08f2017b3e817
	.xword	0x5439b72ca79d90a6
	.xword	0xef92901caaf818e4
	.xword	0x6107ecb5aef76623
	.xword	0xa55fed5fe6bcc1a6
	.xword	0xb5f3ec99790f6523
	.xword	0x442f06f40396cad0
	.xword	0x81e0c798b138afbf
	.xword	0xe99d8084b8402df7
	.xword	0x3b86c7a90459c626
	.xword	0xe9bb140647dbdd56
	.xword	0xa8469c68b458d7c7
	.xword	0x11bb994c0cd6e145
	.xword	0x6d09f9a1dea729bd
	.xword	0xd37fcbb6ab9be7f3
	.xword	0xe291a78b9943a4f0
	.xword	0xd5b082aa6bbf4e3a
	.xword	0x84eebd2a4500a904
	.xword	0x7ec6592547c6f684
	.xword	0x20da47cb79e78a70
	.xword	0x8a886cab27e643fb
	.xword	0xeb41e73e43283628
	.xword	0x367f0be3f872ea4b
	.xword	0xb17e7ce21f50ab23
	.xword	0x1d6d588ca99bc135
	.xword	0x676961779a743511
	.xword	0x34ef78d8e209e0e6
	.xword	0x25fc8164a8522133
	.xword	0xfada886e9eae444d
	.xword	0x8ad057c3f4b0aa8f
	.xword	0x17e1a8deb6ba5144
	.xword	0xc2aa588e2f139ccb
	.xword	0x3549d2343d4e87d4
	.xword	0xe4b2990ca2d59974
	.xword	0xdee81722605e6880
	.xword	0x9cffb4e5ff137c69
	.xword	0x97c0e1aad2c3d3e7
	.xword	0xa288ce93b0f9ecc3
	.xword	0x3f08929b7e98a051
	.xword	0xfdeb121b53f9f1a3
	.xword	0xe419730d5c6fc838
	.xword	0x9171ceeaa1149eb9
	.xword	0xc79c0dcc4c683be6
	.xword	0x16f3465b2dd8c4d2
	.xword	0x8cb47586b52be660
	.xword	0x9cc46570f79d0eca
	.xword	0xc0dba0010146d057
	.xword	0x61c44b49df61d9ae
	.xword	0x827e8cc5f5a64d83
	.xword	0x2269d7bfc95ad71c
	.xword	0xa9361faa678168a4
	.xword	0x865bb408b7de3e30
	.xword	0xbcbafd901d350e47
	.xword	0x0de8e37132c42875
	.xword	0x1137c9461cebaa3f
	.xword	0x6eba65d46708d042



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
	.xword	0x005daa156a2865e7
	.xword	0x45637b8b7dac0a7c
	.xword	0x9a32994a8e96117e
	.xword	0xe71c6edfdc63e255
	.xword	0x2b5e76f8112c63f5
	.xword	0x06858f2ee804cae1
	.xword	0x3aab7bba72ac5705
	.xword	0x76d530191aeb7f27
	.xword	0xa7c61429272b7bdb
	.xword	0x3d1efe363abff7fe
	.xword	0xf04191d3578d5f2a
	.xword	0xef68dc4032df05c1
	.xword	0xae348aa2ef38a751
	.xword	0x85126d7090747b6c
	.xword	0xe7e1024db35b475c
	.xword	0x55ecdb9d8ae58e07
	.xword	0xdc39246f249ff6f7
	.xword	0xf869d9dc075b2e67
	.xword	0x47fc530461083868
	.xword	0x7db51010c26b4c57
	.xword	0xdeb954bfb06146a7
	.xword	0x2fe79708ef69b805
	.xword	0x3deb7482411cde30
	.xword	0xf511282cdcf5b1f1
	.xword	0x0b1270612dfdf1c5
	.xword	0x1cad08e5eadbcaeb
	.xword	0x954a2bf3cd56f97b
	.xword	0x7bd76782b9e92b36
	.xword	0x650c7673ea38617d
	.xword	0x1df00b1027b0f939
	.xword	0x64663ae0d854163e
	.xword	0xc036c72f537e17e8
	.xword	0xdf762a8ef1af940b
	.xword	0x7e39667c1f9f6d2e
	.xword	0x7032181c094dd367
	.xword	0x4f3fe372165ec7f6
	.xword	0xabefc9777d823ca9
	.xword	0x4cd33d18f42f1e33
	.xword	0xceafbd896f6f9b38
	.xword	0x116bdf110cce9de9
	.xword	0xcaac3a2455ab7066
	.xword	0xc7364e39e2033c69
	.xword	0xf1779cdf8e859550
	.xword	0x8860762ff5cd2e2a
	.xword	0x1c0fec70925002fe
	.xword	0x4a673ca80323eb8b
	.xword	0x0a8e1e9605ea7d33
	.xword	0x4f039db6e7b32e09
	.xword	0x508d1ef6246b7466
	.xword	0x5b32543f0a21565e
	.xword	0x47c08a71e44557dc
	.xword	0xb137e600a7465e2e
	.xword	0xe9048d15662d2dec
	.xword	0xbb0c7031385d0dcd
	.xword	0xc50a7a194535832c
	.xword	0x6cdc901ad8336206
	.xword	0xc987b718add2038b
	.xword	0x9339d1648773570d
	.xword	0xa8ec6d6e58291e68
	.xword	0x84b961e10db61cb9
	.xword	0x7b427eca2b985036
	.xword	0x2be84a5ec05fb70e
	.xword	0x6916e433eb0e9954
	.xword	0xbbd3061806c496ed
	.xword	0x39035b0aebaffd02
	.xword	0x58d4b69bec3f5f69
	.xword	0x27d7304306bd1361
	.xword	0x202b1ae0766d26f3
	.xword	0xf3a5421c3438bf79
	.xword	0x624f0c74fce038e7
	.xword	0x756707c7c1dae0ac
	.xword	0x4b8a420a25d8c23a
	.xword	0x1c339bab37f098fc
	.xword	0x595dc295d37f7f7a
	.xword	0x171b3057c14c56ae
	.xword	0x77a30f034b45cf7f
	.xword	0x912799b3687b9fc0
	.xword	0xb9887e46ddec9587
	.xword	0x7a767be1816c4dd2
	.xword	0x71133103b3c7d9d0
	.xword	0xeb4c208aea256a57
	.xword	0xe64eccef5f0efd30
	.xword	0x574a4aba79d44e36
	.xword	0x2978279864255469
	.xword	0x4544d1b15a8f8477
	.xword	0x8e07ea92e954289c
	.xword	0xf7a78948b798c3b5
	.xword	0x392675e686770fd2
	.xword	0xcf1f2ce935044e1b
	.xword	0x3a11ef387ff9a411
	.xword	0x0fbeaf58c2ced0b6
	.xword	0x4a905e3416764356
	.xword	0x70f931829a4f20ae
	.xword	0x663de612beba4ccb
	.xword	0x41ab05621f008ad5
	.xword	0x49bc4e832b44c0a5
	.xword	0x475e10903e071b52
	.xword	0xc5a9006cd0382011
	.xword	0xd7d6d9e22de33cb8
	.xword	0x4cf5ea15d7ea67b7
	.xword	0x8ed7d50e474a67f5
	.xword	0x5ddfaaf2569106f8
	.xword	0xb6526fa3a4bcceb4
	.xword	0xcce50ec4218f856c
	.xword	0x8a9d29a1aea82f14
	.xword	0x820c11a31ba7c369
	.xword	0xd283818dbff62864
	.xword	0xbf2a21eb6172479a
	.xword	0xb357ae578c80b913
	.xword	0x73210cc351e12a8e
	.xword	0x64bd7054bcfec8d0
	.xword	0xc6fa02eb820d95f8
	.xword	0xc0cfc411c025cd81
	.xword	0xc52d0ea9ca47f34a
	.xword	0x18cd09126faf09d3
	.xword	0x799077c06fd010f1
	.xword	0x8cd5d7a310ada2e1
	.xword	0x3f505ebfa6b78ba5
	.xword	0x30366ba3d4a9c7bd
	.xword	0xbe3d1d3c648109f7
	.xword	0x42cf89c1769fadb6
	.xword	0x4314dc7de18f97ae
	.xword	0xa99df4ab19319774
	.xword	0x6d8e3e6e7af8d4ec
	.xword	0x3b43ccac5447ec2a
	.xword	0x8a248d070186deeb
	.xword	0xafae50626cb26662
	.xword	0xe9d3dc694fa35313
	.xword	0x5911969807220316
	.xword	0x41e689dfcf45f8b6
	.xword	0x03300ef397e9a353
	.xword	0xe454d55c80844853
	.xword	0x9baf8201440d6407
	.xword	0x974ac7c7e5dcca98
	.xword	0x03f19d55dfd77dca
	.xword	0x0b1bab2fcb32c635
	.xword	0x780ffc17e334ee65
	.xword	0xd13db98912327941
	.xword	0x6ab7c2411cb47bd9
	.xword	0x10007d1464dea6c2
	.xword	0x8ebb1cfa41711a6f
	.xword	0xe0a89e9c7f7ff03a
	.xword	0x57846231cdcf8ebe
	.xword	0xb2bb546387c7e162
	.xword	0xc61671229734e1fe
	.xword	0xff430b0b006f1215
	.xword	0xe4947e129c2d30c8
	.xword	0x1ec06218239bffb0
	.xword	0xca0fb05c2b79c454
	.xword	0xb22e9cdc6f30f322
	.xword	0x6286f984a441883b
	.xword	0xddae7add12e0505c
	.xword	0x2247fd9dbfd60e5e
	.xword	0x0c08e596de27c2a9
	.xword	0xeffab5046860a994
	.xword	0x4639f6ef0cd53d95
	.xword	0x74fb0e18963d8f3a
	.xword	0x7c61c5a19f4d35d3
	.xword	0xea67bce1e0a5b2ee
	.xword	0xfee3efe88b4475de
	.xword	0x145d0f8b1c67ad12
	.xword	0xc2f37597b59f018a
	.xword	0xb7da553c60618547
	.xword	0xa4ab07a2dbb6aeb1
	.xword	0xdb9006d886396d3c
	.xword	0xb9defbc490378937
	.xword	0xbd3a6d35b30a0c3f
	.xword	0xb37c33b9c0cc368a
	.xword	0xfb8aee3132526075
	.xword	0xda3cf3107662ff0e
	.xword	0xe1e525ee632a3b12
	.xword	0x0e5950dc18d3660a
	.xword	0xddd4f75897da2dd9
	.xword	0x0e39971a279030a6
	.xword	0xe55109def25c683d
	.xword	0xc712d477dfed0e2c
	.xword	0xc81c41c460533601
	.xword	0xe081a18ad3ccd1d3
	.xword	0xf29acd8a5472a402
	.xword	0x3ed030f77d7b7908
	.xword	0x7ed95adf413661d5
	.xword	0xeeeff3d05e74b169
	.xword	0x6746839e238b1c49
	.xword	0x07f5a20c47487b33
	.xword	0x11dffa0b2daf0945
	.xword	0xde7b5a923a5f3855
	.xword	0xa35538f91a85b086
	.xword	0x5b99994f4b6aa0c2
	.xword	0x8703505192276b79
	.xword	0x4331f1214e922c14
	.xword	0x501e63906928683f
	.xword	0xb1da8c4138d26181
	.xword	0x4ba9bd662184f693
	.xword	0x02b03150b64d3984
	.xword	0x42948725ba54c548
	.xword	0x5408ed9c9b30ba50
	.xword	0x693acfb39238c103
	.xword	0x34328dcf3279a822
	.xword	0xd4f84c40ba66c3b2
	.xword	0x9233bcde6dc245cf
	.xword	0x803f8531d10a025a
	.xword	0x3ccc8afe0f7f9b01
	.xword	0xf5c0638c420f093d
	.xword	0xf2ea0420e818696f
	.xword	0x4b3ff1eaffd2ac1c
	.xword	0xadfb871665b5bd4e
	.xword	0x38a731ed62a33645
	.xword	0x8ea751ba66e2efc6
	.xword	0x1aabb98db178605b
	.xword	0x61f539cf8cebe619
	.xword	0xa7f9d11a81101a24
	.xword	0x3f2aa910383a2e01
	.xword	0x7e27514bf269274d
	.xword	0x164a234a0751ed62
	.xword	0x81047fc9a4a1c3d6
	.xword	0x1163bc783214e8de
	.xword	0x92d4cf403d482de9
	.xword	0xeaf2e022ab4dd7b7
	.xword	0x889cf6d7e309d4da
	.xword	0xe6fafdd898d4c3a3
	.xword	0x206f6ff6a3086d5c
	.xword	0x2e65813af797f112
	.xword	0x7b46adbf0e183a2e
	.xword	0x9b261be166aa1d93
	.xword	0x1d796a8282d97c56
	.xword	0x9ba8df60966cc9d0
	.xword	0xb4390a83599240cb
	.xword	0xf45af14825b081bb
	.xword	0x01e651f24e99e494
	.xword	0x266e26c61609321e
	.xword	0x5f89aa5c206b77d3
	.xword	0xf5aeb2e9b7d6cce1
	.xword	0x728d24be940324bf
	.xword	0xdf3b21b633812b1a
	.xword	0xe1144c00bfc14c60
	.xword	0xa27cd655b1ef5193
	.xword	0x8a120cae8832a132
	.xword	0xca746210ed3a7a48
	.xword	0x072a65543de0dcd6
	.xword	0xd842be2b9eefd6b8
	.xword	0x435a9354ec52a167
	.xword	0x6e3d5220cdaa5424
	.xword	0xeb7e6be498df5671
	.xword	0xe90244c3cbddc428
	.xword	0x8dcdd675a81634fb
	.xword	0x437b666fcc534f82
	.xword	0x0754aec02660fa2d
	.xword	0xe7e168b7e5aec336
	.xword	0x1d6faff2e760d153
	.xword	0x2876f15c6b9b7e8e
	.xword	0x9f2f854c464784cf
	.xword	0x9b6cd53720f1cd03
	.xword	0xd6e8ff960b1623a3
	.xword	0xa4dc5a67a5c7a434
	.xword	0x0e1fffb67067b36f
	.xword	0x73c7dd31a09c3759



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
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
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
!!#   int     rnd_n,b_sz;
!!# 
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 107, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 111, Rv_Simm13, "13'b0 0000 00rr r000");
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
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 149, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 158, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 168, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 178, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 188, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 198, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 208, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 218, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 238, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 248, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 258, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 268, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 278, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 288, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 298, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 310, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 319, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 329, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 339, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 349, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 359, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 369, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 379, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 390, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 399, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 409, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 419, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 429, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 439, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 449, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 459, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 468, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 476, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 484, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 485, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 486, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 487, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 488, ijdefault, Ft_Imm_Asi, "{16,17}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 493, ijdefault, Ft_Simm13, "13'b0 0000 rrrr r000");
!!# 
!!#   IJ_bind_file_group("diag.j", 497, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 498, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 501, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 503, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 504, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 505, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 507, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 509, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 510, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 512, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 513, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 514, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 515, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 517, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 518, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 521, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 525, th_M, "\tmov\t0, %%r8\n");
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
!!#   IJ_printf ("diag.j", 554, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 555, sjm_5, "\n\nBA LABEL_0\n");
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 559,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 561,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 566,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 694, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9 set_addr load alu store sjm4 sjm5
!!# !inst_type: set_reg9 set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 701, th_M, $3);
!!# 		IJ_generate ("diag.j", 702, th_M, $4);
!!# 		IJ_generate ("diag.j", 703, th_M, $5);
!!# 		!IJ_generate (th_M, $6);
!!# 		!IJ_generate (th_M, $7);
!!# 		!IJ_generate (th_M, $8);
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
!!#                    IJ_printf ("diag.j", 721, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 724, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 726, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 727, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 731, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 732, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 733, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 734, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 736, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 737, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 750, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 755, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 759, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 760, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 762, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 763, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 777, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 781, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 782, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 799, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 804, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 805, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 807, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 808, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 810, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 811, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 816, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 817, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 819, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 820, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 837, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 840, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 842, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 843, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 847, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 848, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 849, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 850, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 852, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 853, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 866, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 871, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 875, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 876, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 878, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 879, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 894, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 897, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 899, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 900, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 915, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 918, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 919, Rv_rand32);
!!#                          IJ_printf ("diag.j", 920, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 925, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 927, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 941, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 947, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 951, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 966, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 968, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 970, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 976, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 977, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1004, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1010, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1011, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1014, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1016, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1025, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1027, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1045, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1051, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1056, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1058, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1076, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1079, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1081, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1082, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1085, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1086, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1087, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1088, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1090, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1091, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1104, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1109, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1113, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1114, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1116, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1117, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1131, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1135, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1136, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1153, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1158, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1159, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1161, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1162, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1164, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1165, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1170, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1171, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1173, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1174, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1191, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1194, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1196, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1197, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1201, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1202, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1203, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1204, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1206, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1207, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1220, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1225, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1229, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1230, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1232, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1233, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1249, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1252, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1254, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1255, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1270, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1273, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1274, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1275, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1280, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1282, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1296, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1302, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1306, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1321, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1323, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1325, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1331, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1332, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1359, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1365, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1366, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1369, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1371, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1380, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1382, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1400, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1406, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1411, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1413, sjm_5, "\n");
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
!!# set_reg9:  set_memaddr9
!!# ;
!!# set_addr:  set_memaddr
!!# ;
!!# 
!!# set_memaddr9: mSET_MEMADDR9
!!#                 {
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         invalid_config = 1;
!!#                         while (invalid_config) {
!!#                         if (random()%2) {
!!#                         !if (config_cnt > 500) {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1441, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1442, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1444, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1445, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1455, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1457, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1458, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1459, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1460, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1461, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1462, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1463, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1464, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1465, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1466, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1467, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1468, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1469, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1470, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1471, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1472, th_M, "\n\n\n");
!!# 
!!#                         }
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1476, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1477, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1479, Rv_jbi_w_addr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1484, Rv_jbi_w_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1485, Rv_jbi_w_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1488, Rv_jbi_w_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1489, Rv_jbi_w_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1490, Rv_jbi_w_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1491, Rv_jbi_w_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1492, Rv_jbi_w_addr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1494, Rv_jbi_w_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1497, Rv_jbi_w_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1498, Rv_jbi_w_addr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1501, Rv_jbi_w_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1502, Rv_jbi_w_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1503, Rv_jbi_w_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1504, Rv_jbi_w_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1505, Rv_jbi_w_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1506, Rv_jbi_w_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1507, Rv_jbi_w_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         !switch (addr_sel) {
!!#                         !case 1 : jbi_addr = jbi1; break;
!!#                         !case 2 : jbi_addr = jbi2; break;
!!#                         !case 3 : jbi_addr = jbi3; break;
!!#                         !case 4 : jbi_addr = jbi4; break;
!!#                         !case 5 : jbi_addr = jbi5; break;
!!#                         !case 0 : jbi_addr = jbi6; break;
!!#                         !default : jbi_addr = jbi5; break;
!!#                         !}
!!# 
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi0; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64("diag.j", 1533, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1534, Rv_rand64);
!!#                         data_st = w_DATA_ARRAY[w_wr_cntr];
!!#                         addr_st = w_ADDR_ARRAY[w_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1537, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1539, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1541, th_M, "\tsth\t%%r10, [%%r6]\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1545, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1547, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1550, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1552, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1554, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1555, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         w_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                         ! Loads (1/2/4/8)
!!#                         !for(i=0; i <60; i++){
!!#                         !IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!!#                         !}
!!# 
!!#                         ! BYTE LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(w_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1591, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x000000000000ffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1604, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1606, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1609, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1611, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1613, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1614, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(h_a_wr_cntr >=10)
!!# 
!!#                 }
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR
!!#                 {
!!#                       IJ_printf ("diag.j", 1629, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                 }
!!# ;
!!# 
!!# !load: gLOAD 
!!# load: gLOAD  %ropr  Rv_ldstD
!!# ;
!!# 
!!# !store: gSTORE 
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
