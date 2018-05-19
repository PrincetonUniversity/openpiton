// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1x_c_nc_mix_rand_1.s
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
   random seed:	818718475
   Jal pio_rnd_basic3_1x_c_nc_mix.j:	
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

	setx 0xa9c0a2a0a933b99b, %g1, %g0
	setx 0x5dc1ad072488dd85, %g1, %g1
	setx 0xbae004fe8418dc3e, %g1, %g2
	setx 0x0d7f3a5555af29db, %g1, %g3
	setx 0xbb395452f1039a19, %g1, %g4
	setx 0xaa36a04db59e7071, %g1, %g5
	setx 0x97726e1409e261a0, %g1, %g6
	setx 0xbfe1c22e2ea9d391, %g1, %g7
	setx 0x1a1cbc4108c96a76, %g1, %r16
	setx 0x70a8407fbcbb422e, %g1, %r17
	setx 0x6a401bcf7497dfdc, %g1, %r18
	setx 0xb89db87610ea7ed3, %g1, %r19
	setx 0x9508ec1f592b3628, %g1, %r20
	setx 0x322c8adac738ebc5, %g1, %r21
	setx 0x72c4ccccad5207e8, %g1, %r22
	setx 0x72a35c4cac8cfb86, %g1, %r23
	setx 0xb3fd32d1254f82a9, %g1, %r24
	setx 0x54f9935b5b03fb48, %g1, %r25
	setx 0x01e46248caa71cf0, %g1, %r26
	setx 0x9dfc3c9b43def501, %g1, %r27
	setx 0x619e8f5305f536c1, %g1, %r28
	setx 0xcbaad40f820997d7, %g1, %r29
	setx 0x146680e9b474a041, %g1, %r30
	setx 0x94c2763e462c6b14, %g1, %r31
	save
	setx 0x05635040547fe8ff, %g1, %r16
	setx 0xf18e642b04711338, %g1, %r17
	setx 0x72bf4f55c1d04fdf, %g1, %r18
	setx 0xa8f7d089a4067c9c, %g1, %r19
	setx 0x0ab3f5f1271a6823, %g1, %r20
	setx 0xbf8632b917a73828, %g1, %r21
	setx 0x26d2b68d008f5a72, %g1, %r22
	setx 0x88ba1b3843699341, %g1, %r23
	setx 0x4a37ea0807d32bc8, %g1, %r24
	setx 0x35f74c71bfaeab8b, %g1, %r25
	setx 0x4547a63d68ec3449, %g1, %r26
	setx 0xc4dc6241c4d19dd5, %g1, %r27
	setx 0xc1fd5fa54cd3b4e9, %g1, %r28
	setx 0x72420a2e99be50d5, %g1, %r29
	setx 0xabb20cd11ac72801, %g1, %r30
	setx 0xe831f0f79ae19a32, %g1, %r31
	save
	setx 0x618ffe3b56732129, %g1, %r16
	setx 0x1dca9e6dc85b3ff2, %g1, %r17
	setx 0x644062d9156e17eb, %g1, %r18
	setx 0x3b153fd1599187f8, %g1, %r19
	setx 0xb125ec6770b0092c, %g1, %r20
	setx 0xa0636b204078c069, %g1, %r21
	setx 0xc92ce74b40ce5ce2, %g1, %r22
	setx 0x6d99c9d74bdbaeda, %g1, %r23
	setx 0x7b68e3748e7baaff, %g1, %r24
	setx 0x724b3831bf591996, %g1, %r25
	setx 0xff45fef8172718c2, %g1, %r26
	setx 0xe6b379adc618fe78, %g1, %r27
	setx 0xd96ddb2f5bbc5302, %g1, %r28
	setx 0x0ab41c956b027004, %g1, %r29
	setx 0x87610ad325029632, %g1, %r30
	setx 0x838f4719770edf49, %g1, %r31
	restore
	mov	0, %r8
	setx	0x0000000051323b0b, %r1, %r9
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



	setx	0x00000080b85fb0d8, %r1, %r6
	setx	0x956740c20b59dbee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eba17e8, %r1, %r6
	setx	0xee6d5e8a989ae840, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f228e30, %r1, %r6
	setx	0x6fb4ede83f51ff9d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x6fb4ede83f51ff9d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ca5aded910, %r1, %r6
	setx	0xc62ed069c6b66ceb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xc62ed069c6b66ceb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000daccdcd008, %r1, %r6
	setx	0x3cd846328f401e88, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5a3ce56a8, %r1, %r6
	setx	0xd82b82aff43e85ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f00b812308, %r1, %r6
	setx	0xa013064fc442aeda, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe819a088  ! 2: LDD_I	ldd	[%r6 + 0x0088], %r20
	.word 0xa4c1a038  ! 3: ADDCcc_I	addccc 	%r6, 0x0038, %r18
	.word 0xec318008  ! 4: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x000000801de169e0, %r1, %r6
	setx	0xab5f8c0867ab6d4a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eff6510, %r1, %r6
	setx	0x75951b90bf94935c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f66f708, %r1, %r6
	setx	0x7323d868eee4e038, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x7323d868eee4e038, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cc94acdaa8, %r1, %r6
	setx	0x1d62285b2aab51f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dbeac60080, %r1, %r6
	setx	0xb4c7844b2cb030ad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee83ab8628, %r1, %r6
	setx	0xdb24522cf3bd0715, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xdb24522cf3bd0715, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f5b4359b58, %r1, %r6
	setx	0x6ff8ce7ae4658a16, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x6ff8ce7ae4658a16, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001060100000, %r1, %r6
	.word 0xe019a038  ! 9: LDD_I	ldd	[%r6 + 0x0038], %r16
	.word 0xae318008  ! 10: ORN_R	orn 	%r6, %r8, %r23
	.word 0xe4298008  ! 11: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000080c1635658, %r1, %r6
	setx	0x79f55e45a5f339b1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e410148, %r1, %r6
	setx	0xb74fa0bf2efe5bf1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9bad30, %r1, %r6
	setx	0xd4524dcb3eecf037, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c38b649f60, %r1, %r6
	setx	0x57bc03b0d44e1b4a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000daddbd33c0, %r1, %r6
	setx	0xab687ab17fd1928a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4b3060698, %r1, %r6
	setx	0x2bda6eaeb87b33d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb514a06a0, %r1, %r6
	setx	0xeea32bc66248d07c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000801de169e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f00b812308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5a3ce56a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daccdcd008, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca5aded910, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f228e30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe001a038  ! 16: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xa8b18008  ! 17: SUBCcc_R	orncc 	%r6, %r8, %r20
	.word 0xe839a038  ! 18: STD_I	std	%r20, [%r6 + 0x0038]
	setx	0x0000008010710cf0, %r1, %r6
	setx	0x4849a2147317f35c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e50a658, %r1, %r6
	setx	0xcec4381ec7fe0cbd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xcec4381ec7fe0cbd, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f844c28, %r1, %r6
	setx	0x7b7ce31f23ce3e13, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x7b7ce31f23ce3e13, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cbb6921b88, %r1, %r6
	setx	0x47cfbde9ee000c0c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x47cfbde9ee000c0c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d8ce3432b0, %r1, %r6
	setx	0x4f9e0bdb882ab926, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x4f9e0bdb882ab926, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eb1436f790, %r1, %r6
	setx	0x151c2fd78936e969, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f25cafd420, %r1, %r6
	setx	0xcb3502e57e00e9ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	.word 0xe859a038  ! 23: LDX_I	ldx	[%r6 + 0x0038], %r20
	.word 0xaa19a028  ! 24: XOR_I	xor 	%r6, 0x0028, %r21
	.word 0xec71a028  ! 25: STX_I	stx	%r22, [%r6 + 0x0028]
	setx	0x0000008083db3930, %r1, %r6
	setx	0xd07b77aba4f9ff62, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0a3908, %r1, %r6
	setx	0x948067b2f68eebe8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f47bfb8, %r1, %r6
	setx	0x393a6a960c05812e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x393a6a960c05812e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ce51b20a50, %r1, %r6
	setx	0x0a5fa9f0614f33e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x0a5fa9f0614f33e5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d9ef0c4e98, %r1, %r6
	setx	0x57b967c07401d1bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000efbd958c38, %r1, %r6
	setx	0x870fb76040aa9743, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc4e137380, %r1, %r6
	setx	0xec0cdf0252bec8f4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9bad30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e410148, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0xec0cdf0252bec8f4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080c1635658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe4598008  ! 30: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa4a9a020  ! 31: ANDNcc_I	andncc 	%r6, 0x0020, %r18
	.word 0xe021a020  ! 32: STW_I	stw	%r16, [%r6 + 0x0020]
	setx	0x000000808fb55d98, %r1, %r6
	setx	0x3c7f050761067710, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ecc6348, %r1, %r6
	setx	0xfe1b25bb39937ac9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2a1640, %r1, %r6
	setx	0xa15be9d3ad0fc47c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c040522160, %r1, %r6
	setx	0x0493869f183bf6a3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d407ac1a70, %r1, %r6
	setx	0x8efb39284a138a1f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3c28033a8, %r1, %r6
	setx	0x2bacc3f373e4c54c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x2bacc3f373e4c54c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f7279fa338, %r1, %r6
	setx	0x09e8c94a72684c3c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008010710cf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb514a06a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4b3060698, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daddbd33c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c38b649f60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9bad30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0x09e8c94a72684c3c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	.word 0xe401a020  ! 37: LDUW_I	lduw	[%r6 + 0x0020], %r18
	.word 0xaab18008  ! 38: ORNcc_R	orncc 	%r6, %r8, %r21
	.word 0xe8218008  ! 39: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000803e8d9628, %r1, %r6
	setx	0x01c2008799c84285, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x01c2008799c84285, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800eef4380, %r1, %r6
	setx	0xdd9a2f7792119b17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f960298, %r1, %r6
	setx	0x423fa2ed4b531159, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c21febdcf0, %r1, %r6
	setx	0xb0b72087e414967b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xb0b72087e414967b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ddb3c7ef50, %r1, %r6
	setx	0x87f4bc536e7125d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e458f28b50, %r1, %r6
	setx	0xade221e7d83c08bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xade221e7d83c08bd, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f05141b2c0, %r1, %r6
	setx	0x231bea6e6fb081d2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e410148, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x231bea6e6fb081d2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080c1635658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe851a020  ! 44: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	.word 0xa2918008  ! 45: ORcc_R	orcc 	%r6, %r8, %r17
	.word 0xec718008  ! 46: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x000000806d89c958, %r1, %r6
	setx	0x6066eafe8f3e924a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6d6620, %r1, %r6
	setx	0x559a39c52a35c782, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa39940, %r1, %r6
	setx	0xa0916b4388dc6699, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c04313bc40, %r1, %r6
	setx	0xf93725c3382609af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d00d815180, %r1, %r6
	setx	0x8652869058e2fbb4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e8347e2280, %r1, %r6
	setx	0x3523833e03fe74f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f9bf274b08, %r1, %r6
	setx	0x894ad64975ed5094, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2a1640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecc6348, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000808fb55d98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x894ad64975ed5094, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fc4e137380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0x894ad64975ed5094, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001040100000, %r1, %r6
	.word 0xe851a020  ! 51: LDSH_I	ldsh	[%r6 + 0x0020], %r20
	.word 0xaa89a018  ! 52: ANDcc_I	andcc 	%r6, 0x0018, %r21
	.word 0xe4298008  ! 53: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000080b4b031d8, %r1, %r6
	setx	0xb3e17bf191d73682, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8e99a0, %r1, %r6
	setx	0xf27517583b08bee5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xf27517583b08bee5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f36c108, %r1, %r6
	setx	0x6f2a4115f95550e8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c131a7f538, %r1, %r6
	setx	0xb4c6f4f3dd8e4cc4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0xb4c6f4f3dd8e4cc4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d7bdcb0360, %r1, %r6
	setx	0xd97a9ff019f93baa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecc72e0880, %r1, %r6
	setx	0xb14536692dd52d20, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc50afe9e8, %r1, %r6
	setx	0x9c222eb39879ed06, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080c1635658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f5b4359b58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee83ab8628, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbeac60080, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc94acdaa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x9c222eb39879ed06, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001070100000, %r1, %r6
	.word 0xe0498008  ! 58: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa629a040  ! 59: ANDN_I	andn 	%r6, 0x0040, %r19
	.word 0xec298008  ! 60: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000805db89c50, %r1, %r6
	setx	0xef2c9a0dda9fbdd6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed002f0, %r1, %r6
	setx	0x6e14bdaeb6ec1a4b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fbeb878, %r1, %r6
	setx	0x346668e04dccdc25, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb2a88e580, %r1, %r6
	setx	0x923bf03182b16bd8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de222a5ef8, %r1, %r6
	setx	0xaef6b97c6db87810, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e167535910, %r1, %r6
	setx	0x7c622fb19db78621, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa3737de68, %r1, %r6
	setx	0x226d1c833064008f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x226d1c833064008f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000801de169e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x226d1c833064008f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f00b812308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xe451a040  ! 65: LDSH_I	ldsh	[%r6 + 0x0040], %r18
	.word 0xaeb98008  ! 66: XNORcc_R	xnorcc 	%r6, %r8, %r23
	.word 0xec318008  ! 67: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000080169cfe18, %r1, %r6
	setx	0x58cf0178b3ead9ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6969d0, %r1, %r6
	setx	0x0581535ce3af443c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f205610, %r1, %r6
	setx	0x46ecf63d267c3af9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cda481af90, %r1, %r6
	setx	0x43a9e69ca9e51ff0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db79f8f840, %r1, %r6
	setx	0x3897c2df588f360d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9cdcd92b8, %r1, %r6
	setx	0xade0feae2b315e8d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xade0feae2b315e8d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f6f6f1f170, %r1, %r6
	setx	0xee690ae08aa23f4c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000805db89c50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xee690ae08aa23f4c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fc50afe9e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0xee690ae08aa23f4c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ecc72e0880, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7bdcb0360, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe449a040  ! 72: LDSB_I	ldsb	[%r6 + 0x0040], %r18
	.word 0xac31a0d8  ! 73: SUBC_I	orn 	%r6, 0x00d8, %r22
	.word 0xe0298008  ! 74: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000805f2514f0, %r1, %r6
	setx	0xa7c6622367701734, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e5b1e28, %r1, %r6
	setx	0xa9ab11a914e5974c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fd392e0, %r1, %r6
	setx	0xf06474845d2cedfb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbaf24abc8, %r1, %r6
	setx	0xb67bc0fa5e45e7a9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xb67bc0fa5e45e7a9, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000de54b2ca18, %r1, %r6
	setx	0xd74b7878c67baf39, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xd74b7878c67baf39, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ec3483e948, %r1, %r6
	setx	0xbaba3cb97f214728, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc6e2340f8, %r1, %r6
	setx	0xd3c9afebb22c39e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d00d815180, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0xd3c9afebb22c39e5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c04313bc40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa39940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6d6620, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0xd3c9afebb22c39e5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000806d89c958, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0xd3c9afebb22c39e5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f05141b2c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e458f28b50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe0198008  ! 79: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa4b18008  ! 80: ORNcc_R	orncc 	%r6, %r8, %r18
	.word 0xe031a0d8  ! 81: STH_I	sth	%r16, [%r6 + 0x00d8]
	setx	0x0000008086b61ae8, %r1, %r6
	setx	0x80204566c71463c0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e991600, %r1, %r6
	setx	0xed8161966a63e3ea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f655ca8, %r1, %r6
	setx	0xdcda9fdbb4558e94, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cdb351cbc0, %r1, %r6
	setx	0xaa06c219590cb362, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xaa06c219590cb362, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d9e8863fb0, %r1, %r6
	setx	0x35d9dd005b0ccf3f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e0568b4c40, %r1, %r6
	setx	0xd6b7159328f462ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f636756c48, %r1, %r6
	setx	0xda097a713d74c50e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xda097a713d74c50e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cda481af90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f205610, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0xda097a713d74c50e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e6969d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080169cfe18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa3737de68, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0xda097a713d74c50e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e167535910, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe401a0d8  ! 86: LDUW_I	lduw	[%r6 + 0x00d8], %r18
	.word 0xa0a98008  ! 87: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xe0318008  ! 88: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x0000008073038010, %r1, %r6
	setx	0x72363703de56769a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ef4a128, %r1, %r6
	setx	0x4546609a75ea3c8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fc3d6f8, %r1, %r6
	setx	0x8f1fee8fbede54ea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x8f1fee8fbede54ea, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cc7a51e230, %r1, %r6
	setx	0x99bd7c5557dc0e17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d3db7e08a0, %r1, %r6
	setx	0x5ab59b86a04c8b99, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e68b726b60, %r1, %r6
	setx	0x164ac25f01d10e89, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f3696e6190, %r1, %r6
	setx	0x8729f3250159f12d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa39940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6d6620, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000806d89c958, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f05141b2c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e458f28b50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe4198008  ! 93: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xae018008  ! 94: ADD_R	add 	%r6, %r8, %r23
	.word 0xec218008  ! 95: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x0000008089df1ac8, %r1, %r6
	setx	0xa4fdb19180e0408c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0e38e0, %r1, %r6
	setx	0x9f372e1442673421, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f244340, %r1, %r6
	setx	0x2325490aef2cd584, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb5fd1e670, %r1, %r6
	setx	0x1bbb1307447bc2ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x1bbb1307447bc2ce, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000da6ad57dc0, %r1, %r6
	setx	0x3f6a41e6d25228bb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000efbeab5848, %r1, %r6
	setx	0x29a17feb93ed57e6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f96126a308, %r1, %r6
	setx	0xeada04fa77a578ea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xeada04fa77a578ea, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000daddbd33c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe851a0d8  ! 100: LDSH_I	ldsh	[%r6 + 0x00d8], %r20
	.word 0xae018008  ! 101: ADD_R	add 	%r6, %r8, %r23
	.word 0xe071a0d8  ! 102: STX_I	stx	%r16, [%r6 + 0x00d8]
	setx	0x00000080bee18398, %r1, %r6
	setx	0xcff90e487bed5ed0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xcff90e487bed5ed0, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e949308, %r1, %r6
	setx	0xe1a1f60ef2200c32, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f585a20, %r1, %r6
	setx	0x24bb0da3f4f88db3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c642c9d5a0, %r1, %r6
	setx	0x983a5f0f34d5a8bb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d515035178, %r1, %r6
	setx	0x5ada1271cdb3c659, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e95be001a0, %r1, %r6
	setx	0x1443bf6477bf331e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x1443bf6477bf331e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f9d2a51188, %r1, %r6
	setx	0xa6e021711a42bf85, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xa6e021711a42bf85, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f25cafd420, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb1436f790, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8ce3432b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbb6921b88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f844c28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe059a0d8  ! 107: LDX_I	ldx	[%r6 + 0x00d8], %r16
	.word 0xa6218008  ! 108: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe429a0d8  ! 109: STB_I	stb	%r18, [%r6 + 0x00d8]
	setx	0x000000805238fda8, %r1, %r6
	setx	0x9ffe79a4974827cd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec9ddd8, %r1, %r6
	setx	0x58ce7d93f7014680, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f5a7530, %r1, %r6
	setx	0xd9194aacaeb51483, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc17a26110, %r1, %r6
	setx	0x0384c949c9059429, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x0384c949c9059429, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d485cf2268, %r1, %r6
	setx	0xb11e1290aba3c405, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ebbafe2658, %r1, %r6
	setx	0x1f094167432e5b68, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f7a02e9ea8, %r1, %r6
	setx	0x6b4d3ecf311e675a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x6b4d3ecf311e675a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9cdcd92b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db79f8f840, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x6b4d3ecf311e675a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cda481af90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe4598008  ! 114: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa8318008  ! 115: ORN_R	orn 	%r6, %r8, %r20
	.word 0xec218008  ! 116: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x0000008082348048, %r1, %r6
	setx	0x757dcde818da230f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec1a428, %r1, %r6
	setx	0x02bec129c241c267, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f773fc0, %r1, %r6
	setx	0xa021216587268e87, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c93ecedf60, %r1, %r6
	setx	0x3ddd9d828ba41d48, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d14216ea80, %r1, %r6
	setx	0x073a24119382d7b0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eaebb8f490, %r1, %r6
	setx	0x61da41729273023a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fee0b62050, %r1, %r6
	setx	0xb17fc09281ffa825, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xb17fc09281ffa825, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ebbafe2658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d485cf2268, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc17a26110, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xec198008  ! 121: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa029a028  ! 122: ANDN_I	andn 	%r6, 0x0028, %r16
	.word 0xe0218008  ! 123: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080b6469860, %r1, %r6
	setx	0x984735ea2a0c10c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e859750, %r1, %r6
	setx	0x00aec6d67265b3e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x00aec6d67265b3e4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fc4f7d8, %r1, %r6
	setx	0x56d00646abe36589, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c3a2f85738, %r1, %r6
	setx	0x96fd9e3f6a20bb1e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x96fd9e3f6a20bb1e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d2e66c19e0, %r1, %r6
	setx	0xeb03f49aff776460, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xeb03f49aff776460, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9b395ee90, %r1, %r6
	setx	0xcdf3f69ec1523a3a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xcdf3f69ec1523a3a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f8b7ff06d8, %r1, %r6
	setx	0x188522107fc5c075, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f844c28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0x188522107fc5c075, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e50a658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008010710cf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb514a06a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4b3060698, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0x188522107fc5c075, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xec41a028  ! 128: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	.word 0xa8098008  ! 129: AND_R	and 	%r6, %r8, %r20
	.word 0xe0318008  ! 130: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x0000008034a55708, %r1, %r6
	setx	0x38ee26fa4cecb3ed, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6a6f40, %r1, %r6
	setx	0xf77bf9426cdbf8f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f72f570, %r1, %r6
	setx	0xbe47521f99015617, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cabbb938b0, %r1, %r6
	setx	0x6301eab0c5c9086f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7682c3ec0, %r1, %r6
	setx	0x26cb27a029afc570, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x26cb27a029afc570, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e9187b3b40, %r1, %r6
	setx	0xacc17c2a68d22bd5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xacc17c2a68d22bd5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fd701d2798, %r1, %r6
	setx	0x37b623d843cb03b5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f773fc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec1a428, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008082348048, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f7a02e9ea8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0x37b623d843cb03b5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ebbafe2658, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d485cf2268, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x37b623d843cb03b5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cc17a26110, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe8018008  ! 135: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xaa29a0b0  ! 136: ANDN_I	andn 	%r6, 0x00b0, %r21
	.word 0xe429a0b0  ! 137: STB_I	stb	%r18, [%r6 + 0x00b0]
	setx	0x00000080d99d0430, %r1, %r6
	setx	0xef9a84877f84cba1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xef9a84877f84cba1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e2e73c0, %r1, %r6
	setx	0x3e73f1ba0787b0d1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f16a188, %r1, %r6
	setx	0x9f639395d3c0ce53, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c13affca90, %r1, %r6
	setx	0xff76434e1efcc31d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d2be401aa8, %r1, %r6
	setx	0x39612617699333c7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecef979270, %r1, %r6
	setx	0x38b55bd3b259ebe0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f087938710, %r1, %r6
	setx	0x43c59a6611c5a8b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f960298, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eef4380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x43c59a6611c5a8b8, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000803e8d9628, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x43c59a6611c5a8b8, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f7279fa338, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3c28033a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x43c59a6611c5a8b8, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d407ac1a70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe0198008  ! 142: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa411a008  ! 143: OR_I	or 	%r6, 0x0008, %r18
	.word 0xec218008  ! 144: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x000000809fd0d8b8, %r1, %r6
	setx	0x547fbe91d1dc00cc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e5f1d98, %r1, %r6
	setx	0xcf7ec7f32bce4d69, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xcf7ec7f32bce4d69, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f5277b8, %r1, %r6
	setx	0xc40a3a7934da0ef0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cba7230d50, %r1, %r6
	setx	0x5042b551dfd11b87, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d31cd25e90, %r1, %r6
	setx	0x2d9e8099320e2cec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x2d9e8099320e2cec, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000eeb61bfba0, %r1, %r6
	setx	0x4fbab2cde16814e2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x4fbab2cde16814e2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fcf2303af0, %r1, %r6
	setx	0xf41dcc2ad6382c0b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec3483e948, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de54b2ca18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbaf24abc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd392e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xf41dcc2ad6382c0b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e5b1e28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0xf41dcc2ad6382c0b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000805f2514f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xec598008  ! 149: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa8098008  ! 150: AND_R	and 	%r6, %r8, %r20
	.word 0xe8218008  ! 151: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000805bad6be8, %r1, %r6
	setx	0xf588a025d78924a9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e15a838, %r1, %r6
	setx	0xfe8aa5d85d06e64e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xfe8aa5d85d06e64e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f793778, %r1, %r6
	setx	0xcd6fb9d108121c17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c47a150028, %r1, %r6
	setx	0xf9c7ed5ed5566b46, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xf9c7ed5ed5566b46, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d073d2c668, %r1, %r6
	setx	0x71f834eb90ac9730, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ef6022bcc0, %r1, %r6
	setx	0x7bce19dc3886e449, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8183d6ac0, %r1, %r6
	setx	0x34b84d16f195c105, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c642c9d5a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0x34b84d16f195c105, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010e0100000, %r1, %r6
	.word 0xec598008  ! 156: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xae91a0a8  ! 157: ORcc_I	orcc 	%r6, 0x00a8, %r23
	.word 0xe0318008  ! 158: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080e49a8910, %r1, %r6
	setx	0x1d873e98951e7855, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x1d873e98951e7855, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ef96358, %r1, %r6
	setx	0x6e5eeda361c1e0e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb74240, %r1, %r6
	setx	0x0829a44783b5ac10, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x0829a44783b5ac10, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cc5ae623a8, %r1, %r6
	setx	0xe46aa2047a849f3a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d07e72f168, %r1, %r6
	setx	0xe9821d067bca88e6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e378a6a8b8, %r1, %r6
	setx	0xd766a23c6c32d15e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0664bb4f8, %r1, %r6
	setx	0xcfdd45f9166b612b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xcfdd45f9166b612b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000008010710cf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fb514a06a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4b3060698, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daddbd33c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c38b649f60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe051a0a8  ! 163: LDSH_I	ldsh	[%r6 + 0x00a8], %r16
	.word 0xa6818008  ! 164: ADDcc_R	addcc 	%r6, %r8, %r19
	.word 0xe8318008  ! 165: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000080628ac910, %r1, %r6
	setx	0x9ec248737c75a9af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e31f9f0, %r1, %r6
	setx	0x8541008c2b288d76, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x8541008c2b288d76, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f1107f0, %r1, %r6
	setx	0xb8dfd6372fb8d745, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c534353f28, %r1, %r6
	setx	0x86bcdd787ab1eb27, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x86bcdd787ab1eb27, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dc808ac308, %r1, %r6
	setx	0x8e3343090e96814e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x8e3343090e96814e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e767b26f98, %r1, %r6
	setx	0x914b7a064f4a0763, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1218abf38, %r1, %r6
	setx	0x357b7b62ce46e936, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ef4a128, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008073038010, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f636756c48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0568b4c40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9e8863fb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xec498008  ! 170: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xac318008  ! 171: ORN_R	orn 	%r6, %r8, %r22
	.word 0xe471a0a8  ! 172: STX_I	stx	%r18, [%r6 + 0x00a8]
	setx	0x000000801eca94b8, %r1, %r6
	setx	0x3bb501e598a0a70a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x3bb501e598a0a70a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e418ef8, %r1, %r6
	setx	0x1596fb972abd842b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f5db790, %r1, %r6
	setx	0xd34ca0300feafd21, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd0a1fa558, %r1, %r6
	setx	0xe9a4cd32e21b729d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc513ecdb0, %r1, %r6
	setx	0x571be11fc739d92a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x571be11fc739d92a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ecca41aab8, %r1, %r6
	setx	0x44a6df83f1f912d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x44a6df83f1f912d4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f06dbbfc70, %r1, %r6
	setx	0xf54c2db894322929, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ddb3c7ef50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21febdcf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f960298, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eef4380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe8018008  ! 177: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa6998008  ! 178: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe0718008  ! 179: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000080c1f577d0, %r1, %r6
	setx	0x9613a72508467f61, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ecd8878, %r1, %r6
	setx	0x23508ad82ed85682, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff410f8, %r1, %r6
	setx	0x3e2f06aa6ecdeebb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ccf6670080, %r1, %r6
	setx	0xb9bc6bbb84a4be21, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d77d9935a8, %r1, %r6
	setx	0x6ba866afbd942aad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x6ba866afbd942aad, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000efce106ce8, %r1, %r6
	setx	0xc1f3e7bb7adc6572, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f5944c42d8, %r1, %r6
	setx	0xbe75b902510b9538, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	.word 0xe8518008  ! 184: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa4a1a0d0  ! 185: SUBcc_I	subcc 	%r6, 0x00d0, %r18
	.word 0xec318008  ! 186: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000080207c2ca0, %r1, %r6
	setx	0x28dbae76ae480e85, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0fa8f8, %r1, %r6
	setx	0xed67781c2d1dd6d1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa46288, %r1, %r6
	setx	0xf3eec9517e372f1f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c9ac2ab118, %r1, %r6
	setx	0x9949a7c13018a559, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x9949a7c13018a559, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d229394540, %r1, %r6
	setx	0x607b1a863400d971, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea977f9a80, %r1, %r6
	setx	0x10b35b6a76938015, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fb75614a48, %r1, %r6
	setx	0xe1afd64e810e4c96, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080c1f577d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe0118008  ! 191: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa0298008  ! 192: ANDN_R	andn 	%r6, %r8, %r16
	.word 0xe0318008  ! 193: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080f84322d8, %r1, %r6
	setx	0x49f5116dde49264d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e203708, %r1, %r6
	setx	0xbaf013741687478e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f968608, %r1, %r6
	setx	0x10d96ec937857d51, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x10d96ec937857d51, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cd8de421f0, %r1, %r6
	setx	0xd171e9305a1c5b23, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d65147b978, %r1, %r6
	setx	0x264d46ad65d38837, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e1015c0e88, %r1, %r6
	setx	0xf1cadeaea6e504c5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6a3f78770, %r1, %r6
	setx	0xa52d84104160f2e3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	.word 0xe0418008  ! 198: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa411a0b0  ! 199: OR_I	or 	%r6, 0x00b0, %r18
	.word 0xe8718008  ! 200: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000080d010f548, %r1, %r6
	setx	0xb455f8a83105d17d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xb455f8a83105d17d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e9524f8, %r1, %r6
	setx	0x60cf6e77e52fd18b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x60cf6e77e52fd18b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f3c3ba8, %r1, %r6
	setx	0xd2861010821da004, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c338b17d88, %r1, %r6
	setx	0x7e72c67d5530cf66, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x7e72c67d5530cf66, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d8fb05eb30, %r1, %r6
	setx	0x9992e59d602a5683, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb3616ab60, %r1, %r6
	setx	0xf106146ecc7dd313, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f584c8fa68, %r1, %r6
	setx	0x683df2bd378db13b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f96126a308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efbeab5848, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da6ad57dc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe4598008  ! 205: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xaab98008  ! 206: XNORcc_R	xnorcc 	%r6, %r8, %r21
	.word 0xec718008  ! 207: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000080b73a85c0, %r1, %r6
	setx	0xd985f739b50e1d07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e44c900, %r1, %r6
	setx	0xd1f9a46689944cf0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fecc830, %r1, %r6
	setx	0xb1c27b33b4f69098, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xb1c27b33b4f69098, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c73880b970, %r1, %r6
	setx	0x986c2a48b1b5be90, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1944dcf00, %r1, %r6
	setx	0x90be899b43712159, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e8f40c6c50, %r1, %r6
	setx	0xb4b4ddc6beb6fb1d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f87f0a48f0, %r1, %r6
	setx	0x1811373e3569c661, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecca41aab8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc513ecdb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe8118008  ! 212: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa419a0d8  ! 213: XOR_I	xor 	%r6, 0x00d8, %r18
	.word 0xec398008  ! 214: STD_R	std	%r22, [%r6 + %r8]
	setx	0x000000804207d708, %r1, %r6
	setx	0x3fe3da6aa63fea13, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e25e1a0, %r1, %r6
	setx	0x4775b3be37a897e5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb80200, %r1, %r6
	setx	0xa7c466a3a4bff3e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c207933598, %r1, %r6
	setx	0x3ba8497efdce7bd2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x3ba8497efdce7bd2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d99ae969d0, %r1, %r6
	setx	0x7ac5d79ef65579a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9e3a4a498, %r1, %r6
	setx	0x270d4f97723fd63f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x270d4f97723fd63f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f0887548d8, %r1, %r6
	setx	0x57e71f3b4efa74fc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	.word 0xe801a0d8  ! 219: LDUW_I	lduw	[%r6 + 0x00d8], %r20
	.word 0xa201a070  ! 220: ADD_I	add 	%r6, 0x0070, %r17
	.word 0xe471a070  ! 221: STX_I	stx	%r18, [%r6 + 0x0070]
	setx	0x000000804410de10, %r1, %r6
	setx	0x8ee9f0c02048af42, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6a6788, %r1, %r6
	setx	0xf80a839ae924ea1f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f0b8af8, %r1, %r6
	setx	0x2917d3a36edc5ac7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x2917d3a36edc5ac7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cb9835cfe8, %r1, %r6
	setx	0xb8d25fe58429ca4e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d81cf4a208, %r1, %r6
	setx	0x2936273e20de33bc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6fc7e8e40, %r1, %r6
	setx	0x72c112a88a46f392, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f57aa32918, %r1, %r6
	setx	0x3352443012bd9920, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9187b3b40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7682c3ec0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cabbb938b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f72f570, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xec118008  ! 226: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa631a000  ! 227: ORN_I	orn 	%r6, 0x0000, %r19
	.word 0xe021a000  ! 228: STW_I	stw	%r16, [%r6 + 0x0000]
	setx	0x000000807c44f208, %r1, %r6
	setx	0x54e12acfd9fb9302, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eefef30, %r1, %r6
	setx	0x5e3b0b2ccc6f950a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f45bef8, %r1, %r6
	setx	0x475a4a105703eef2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb1003e868, %r1, %r6
	setx	0x712fe65f88ff3e46, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d23e74b080, %r1, %r6
	setx	0xeed09cc9f3a78fad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xeed09cc9f3a78fad, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e257c684d8, %r1, %r6
	setx	0x7b64b3f29c14ef8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x7b64b3f29c14ef8f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f3bdcb1150, %r1, %r6
	setx	0xccd93ae4d2553bba, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xccd93ae4d2553bba, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000008083db3930, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0xccd93ae4d2553bba, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f25cafd420, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xccd93ae4d2553bba, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000eb1436f790, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8ce3432b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbb6921b88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0xccd93ae4d2553bba, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f844c28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe4598008  ! 233: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa0418008  ! 234: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe0398008  ! 235: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000080b38ab6a8, %r1, %r6
	setx	0x051bf6a3eb4c7c9d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e3f50a8, %r1, %r6
	setx	0xdbe65fca1e77f0b2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa56088, %r1, %r6
	setx	0x410d80f329f476a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cf60aba2e0, %r1, %r6
	setx	0xd50c0e6106040572, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xd50c0e6106040572, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000db31e89c38, %r1, %r6
	setx	0xf4ef0657af6f79ac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea46032d30, %r1, %r6
	setx	0x97d2bf35300c89b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcc6b69160, %r1, %r6
	setx	0x87afd37d0668ece3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x87afd37d0668ece3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010e0100000, %r1, %r6
	.word 0xec41a000  ! 240: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xa0c18008  ! 241: ADDCcc_R	addccc 	%r6, %r8, %r16
	.word 0xe8318008  ! 242: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x000000802df20038, %r1, %r6
	setx	0xb85dceae9aa4d2b4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xb85dceae9aa4d2b4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ef42920, %r1, %r6
	setx	0xb6ef4591c739c821, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f133e90, %r1, %r6
	setx	0xea1c797f6b8c261e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c786a82bd8, %r1, %r6
	setx	0x133ce8935747410f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d2456bdd90, %r1, %r6
	setx	0xef19c314a2e086dc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000edcf8ada98, %r1, %r6
	setx	0x3cd759418c24ab22, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f66fd2ee90, %r1, %r6
	setx	0x5b6bee83e67f85b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f1218abf38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e767b26f98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc808ac308, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c534353f28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f1107f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e31f9f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080628ac910, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	.word 0xec51a000  ! 247: LDSH_I	ldsh	[%r6 + 0x0000], %r22
	.word 0xa2b1a070  ! 248: ORNcc_I	orncc 	%r6, 0x0070, %r17
	.word 0xec21a070  ! 249: STW_I	stw	%r22, [%r6 + 0x0070]
	setx	0x000000804baf3528, %r1, %r6
	setx	0xf8012e39804b51ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xf8012e39804b51ee, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800eff72c8, %r1, %r6
	setx	0xfe73d72f9247f835, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff8b5e8, %r1, %r6
	setx	0xa89aa7fc157bb9a6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c20f2b3c38, %r1, %r6
	setx	0x118ec44664c0303a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d94c4d4e40, %r1, %r6
	setx	0x2fd4313b45e209a4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e21f3df0b0, %r1, %r6
	setx	0x727a3f2bd726486e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f89402e2b0, %r1, %r6
	setx	0xff7b517347c3eea1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ef96358, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080e49a8910, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8183d6ac0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0xff7b517347c3eea1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ef6022bcc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d073d2c668, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	.word 0xe411a070  ! 254: LDUH_I	lduh	[%r6 + 0x0070], %r18
	.word 0xa289a0c0  ! 255: ANDcc_I	andcc 	%r6, 0x00c0, %r17
	.word 0xec718008  ! 256: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000080657590d0, %r1, %r6
	setx	0x54fc3fbabd77b038, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7b9550, %r1, %r6
	setx	0x1389fc009c287996, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f440e68, %r1, %r6
	setx	0x97a65986e61b90b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7e54baf30, %r1, %r6
	setx	0x10b7cb85aad9dbcc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d4982f3890, %r1, %r6
	setx	0x11217bfdb9c860b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eaab9b4510, %r1, %r6
	setx	0x337be1847865a85c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4bf8a8b78, %r1, %r6
	setx	0xf718a3690a9c09ad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cf60aba2e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0xf718a3690a9c09ad, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fa56088, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3f50a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xf718a3690a9c09ad, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080b38ab6a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe011a0c0  ! 261: LDUH_I	lduh	[%r6 + 0x00c0], %r16
	.word 0xa081a048  ! 262: ADDcc_I	addcc 	%r6, 0x0048, %r16
	.word 0xe0718008  ! 263: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000080f889ee08, %r1, %r6
	setx	0xd2641681541da9c5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xd2641681541da9c5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ea84658, %r1, %r6
	setx	0xdf1c77720b4fc676, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fca3798, %r1, %r6
	setx	0x4cca347045856757, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cebe354af0, %r1, %r6
	setx	0xe6a2c0299f0b21cc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xe6a2c0299f0b21cc, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d70f169818, %r1, %r6
	setx	0x4eed6c610dacfb47, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x4eed6c610dacfb47, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000eb9819ef00, %r1, %r6
	setx	0xc8ff305d7cd515cf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f3944c43a0, %r1, %r6
	setx	0x2bdb8cfa24ef7539, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe0498008  ! 268: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xae118008  ! 269: OR_R	or 	%r6, %r8, %r23
	.word 0xec29a048  ! 270: STB_I	stb	%r22, [%r6 + 0x0048]
	setx	0x00000080a9caf7f8, %r1, %r6
	setx	0x065ced9ed34f49f5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e45a308, %r1, %r6
	setx	0x86b003db1902d0d0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x86b003db1902d0d0, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fa64158, %r1, %r6
	setx	0xc0ecc99131158f5d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ce73e027e8, %r1, %r6
	setx	0x938b99d62011c204, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9d81b5908, %r1, %r6
	setx	0x7f695867112b57f1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea7c8f93e8, %r1, %r6
	setx	0x95309d64d0327089, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f357081c48, %r1, %r6
	setx	0xbe3df32f9b894953, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xbe3df32f9b894953, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fc4e137380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0xbe3df32f9b894953, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000efbd958c38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xbe3df32f9b894953, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d9ef0c4e98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0xbe3df32f9b894953, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ce51b20a50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe449a048  ! 275: LDSB_I	ldsb	[%r6 + 0x0048], %r18
	.word 0xa299a0d0  ! 276: XORcc_I	xorcc 	%r6, 0x00d0, %r17
	.word 0xe0398008  ! 277: STD_R	std	%r16, [%r6 + %r8]
	setx	0x000000806dddee10, %r1, %r6
	setx	0xf12a4562fd31141a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e92ddb8, %r1, %r6
	setx	0x8bf52d824a0f26ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fffad50, %r1, %r6
	setx	0x6b71497f73740f34, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7f7c2c7c8, %r1, %r6
	setx	0xce6419e6ce170f5d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de85ffe650, %r1, %r6
	setx	0x1f08939d2319ffa7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000efdf363788, %r1, %r6
	setx	0xce1af50345dc9622, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4b382a1d0, %r1, %r6
	setx	0xdce2b15160c000d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d31cd25e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0xdce2b15160c000d6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cba7230d50, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe011a0d0  ! 282: LDUH_I	lduh	[%r6 + 0x00d0], %r16
	.word 0xac99a028  ! 283: XORcc_I	xorcc 	%r6, 0x0028, %r22
	.word 0xec718008  ! 284: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x0000008087ca5800, %r1, %r6
	setx	0x82f1e5e5488de66f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x82f1e5e5488de66f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e15fa28, %r1, %r6
	setx	0x6c5f742a7dbbb1d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f4c7c48, %r1, %r6
	setx	0xd2cc0fb15e39ec17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca95b310c8, %r1, %r6
	setx	0xb0f5522b0906d44f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xb0f5522b0906d44f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000de327692e8, %r1, %r6
	setx	0x9ce5dd17f7d474a8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e48e50ae50, %r1, %r6
	setx	0x42083b5c55598f24, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f9942f8b70, %r1, %r6
	setx	0x1636801d65980014, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	.word 0xe4198008  ! 289: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa089a0d0  ! 290: ANDcc_I	andcc 	%r6, 0x00d0, %r16
	.word 0xe0218008  ! 291: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000804b5c4d60, %r1, %r6
	setx	0xe287d6a4c72190f7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xe287d6a4c72190f7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e5b3498, %r1, %r6
	setx	0x924c89692f79c46f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe815a8, %r1, %r6
	setx	0xe9c96b978eaa1ef7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xe9c96b978eaa1ef7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cee867a388, %r1, %r6
	setx	0xd1afc8e9e6bbddac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd3716edb8, %r1, %r6
	setx	0xc5e84418da0e5174, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e7dff27410, %r1, %r6
	setx	0xd18f9de110fe4176, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xd18f9de110fe4176, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f09087b188, %r1, %r6
	setx	0x8f6bda7196ba96c7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3c28033a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d407ac1a70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x8f6bda7196ba96c7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c040522160, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0x8f6bda7196ba96c7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f2a1640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x8f6bda7196ba96c7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ecc6348, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000808fb55d98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc4e137380, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6


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
	.xword	0xaa5268a7a83c8694
	.xword	0xdb11078b68c93800
	.xword	0xebec5beb4600c266
	.xword	0xe1c3551a0e7a9a04
	.xword	0x7f8fc40e18fc291d
	.xword	0xbd78442c1df1da43
	.xword	0x3b9683f96398117e
	.xword	0xb18e37b809847750
	.xword	0x72f77003b18a5256
	.xword	0xa72e9e4874f3b6a4
	.xword	0x8a1fa6155c90d4b2
	.xword	0xd0a90f0298e1e758
	.xword	0xb0f5fd7375fe2afb
	.xword	0x925533de5c3e5c00
	.xword	0x4155dde5ebef4ac0
	.xword	0xf2fded40a84c33ae
	.xword	0xeaf5be71dc9204cf
	.xword	0x8673df7ef6a30405
	.xword	0x6e230421ad8b7894
	.xword	0x7933ccc27286b9dd
	.xword	0x6ea21fb4388a4a3d
	.xword	0x968039c44a088d55
	.xword	0x4dbe8a9aa0610153
	.xword	0x70b1eb62c7eae4ea
	.xword	0x1fac0a435416a93e
	.xword	0x2e2b5632d067925b
	.xword	0x12f8934f8ff099cd
	.xword	0xf0a4c99fd58b8383
	.xword	0x899c84c2dc39e81b
	.xword	0xa8ebbf96810e02d9
	.xword	0x7d55ef811b22d354
	.xword	0xbe523e970198ffeb
	.xword	0x99bd9c6eb4fac067
	.xword	0xfa10a0782b69707f
	.xword	0x25f7b744c33a2fc9
	.xword	0x704ceee3adba85a8
	.xword	0xa1956e1d146792a9
	.xword	0xa1cafb2dc1e46fb1
	.xword	0xd61d683f5cc7d52f
	.xword	0xaa30bdb88dd5fc61
	.xword	0x4cdaecc9bcc58aa3
	.xword	0x20b0a2ea7b5269a5
	.xword	0xfd5ceb0103b5a428
	.xword	0xe293635991094f75
	.xword	0xa53d310d0af56c17
	.xword	0x8c32e7505eec709c
	.xword	0x48443eb36db9b2d0
	.xword	0xe79f20c88d545912
	.xword	0x41974003738b0aaa
	.xword	0xfb22b50404897385
	.xword	0xd2eb14fbbb928c85
	.xword	0x4f827f6724996b3c
	.xword	0xc6c3c3b252459d35
	.xword	0x87104102c393790c
	.xword	0x509c81005f844c4a
	.xword	0xc91382fea3013cc3
	.xword	0x5276f2b783d6b946
	.xword	0xd9180bfbca6fba26
	.xword	0x3eb391a49dbe4e13
	.xword	0x8df4eecd56e0d319
	.xword	0xbda8661e968e5325
	.xword	0xcc6451f5e0b8c173
	.xword	0x0acb846d6690b239
	.xword	0x1406dc2ffa1639bc
	.xword	0x78c48956756abe2a
	.xword	0x1893aef97d59c631
	.xword	0x5e8296573297a5e7
	.xword	0xd49e0a00344ae0f6
	.xword	0xeeb05d5b953468d7
	.xword	0xd014741a1dc22f8a
	.xword	0xc270114bb11afa47
	.xword	0x6d60265dc7d63dcc
	.xword	0x732883a5bca37779
	.xword	0x7cee1e08d56b1f39
	.xword	0x2d61d7114220d504
	.xword	0xdeb3515403c139bd
	.xword	0xad2b2c83fd23af33
	.xword	0x1626c53c02591ad8
	.xword	0x4fedfcf0e2861b3c
	.xword	0xccf0ce25fe49e636
	.xword	0x7fcf49652677f16e
	.xword	0x70f0647e761e0d37
	.xword	0x675cd327df46a2da
	.xword	0x406ffb14902e0531
	.xword	0x051d3c0c10e7ea4f
	.xword	0x57989497c0d6f338
	.xword	0x03ed4f79d0654322
	.xword	0x7c73dc0e4f8be13b
	.xword	0x46647d29adafe7cd
	.xword	0xf327842a7646bd97
	.xword	0x4c7ab4f26fe747dd
	.xword	0x9e32a9de454cf17b
	.xword	0x200762912c026602
	.xword	0x4f1676e9c3cd7854
	.xword	0xd76a064ee7e74628
	.xword	0xf92e5be6f2bb60e4
	.xword	0xb9e29c80fefd032a
	.xword	0x3ce310e60ca0fc77
	.xword	0xe7fc7fc27109001b
	.xword	0xb226d7572a6527e8
	.xword	0x5d2161e1e4fb7fd4
	.xword	0xc3f0dde0777e19f6
	.xword	0x982ec2132c92fd09
	.xword	0xdc57bda7adf92aaf
	.xword	0x50657ad7a45f596a
	.xword	0x369f1bb51d436a25
	.xword	0x184add1707652c8d
	.xword	0xbe0d9b6dbe62ca94
	.xword	0x1b017dd6552a5e35
	.xword	0xdab68a2bb735f58e
	.xword	0x581470caec268ace
	.xword	0x8aa9377823944c9a
	.xword	0x791eab132a34d6bd
	.xword	0x50c39fea8d21aa50
	.xword	0xa9a4e2ae7328ae67
	.xword	0xd4a7bf3a3248e1aa
	.xword	0x067ae66c07894b1b
	.xword	0x5159b5e0e6dcae6b
	.xword	0x9bb2acc9416d1ccb
	.xword	0x811a8662e7ad75ea
	.xword	0x96e0003f3bfa33b9
	.xword	0xe85b2f303df89738
	.xword	0x7b8ed837b8dc39ed
	.xword	0x0f6a33c22329584d
	.xword	0x05545c2b2fe3d757
	.xword	0xf82b4991611f6ec3
	.xword	0xe9a36e6f15b66588
	.xword	0xea60a818b815d026
	.xword	0x1ac627453c3ef91b
	.xword	0xdcd0e43d8bd2be9f
	.xword	0x6b769194a28df626
	.xword	0xde961607fd693ace
	.xword	0xc96c03369da26e63
	.xword	0xf2e03d016c3e0a78
	.xword	0x335536c872b60cc6
	.xword	0x1f74bc82bf94c75a
	.xword	0x6a96d3e2c47053a4
	.xword	0x3dcf644d6c1e10c3
	.xword	0x6905b3fd8b60dc19
	.xword	0xa6d189e6aab9cf17
	.xword	0x952a547cca9d206f
	.xword	0xce7752b62f784154
	.xword	0x33cf6c5b3e31bb35
	.xword	0x33acc14a39ddf9d8
	.xword	0xd74203dd4f690e1c
	.xword	0x10d57bbd8ff2ffd8
	.xword	0x9800035b97474b88
	.xword	0x6cb961985e7b5757
	.xword	0x72fa1c7ccb2566c1
	.xword	0x13a325a3881cf639
	.xword	0x84040a41534c062c
	.xword	0x74c63b5158b3762e
	.xword	0x2dbd9f93dd6c92d8
	.xword	0x0f2726512b8301b5
	.xword	0x26561ce48c6700d1
	.xword	0x9953644a411a2982
	.xword	0xc5d918a8e9f356f5
	.xword	0xfa79dd3c9756e449
	.xword	0x5b77a97e4d6f675f
	.xword	0xa6a5ab4821f6712e
	.xword	0x82ed78bc3028c6a3
	.xword	0xb4d7393c605298ae
	.xword	0x21b7046c3f821583
	.xword	0xfee0e76c650bd632
	.xword	0x518c340823a7a2bb
	.xword	0xc772d7b628f381ae
	.xword	0x58d9fe297fc0d91f
	.xword	0x748be9df6e157cc2
	.xword	0x3faf462ceeadc599
	.xword	0x8272ecaac28867de
	.xword	0x83cb868e43fba76b
	.xword	0x4c61b6c72d38df2d
	.xword	0xc750d4b1fd5be4ec
	.xword	0x165168e2a27bbf6f
	.xword	0xf227ba73de68b1ac
	.xword	0x17b3c280f9aa5ec4
	.xword	0x9515f1f1ba2e76a0
	.xword	0xccdd1145803466e4
	.xword	0xbd8d4cb9432817b7
	.xword	0x2d27f4a94763400c
	.xword	0xde0870320096d8f6
	.xword	0xab1855ec70a4d63f
	.xword	0x4a08239f00beb28e
	.xword	0xb79e3dfa92296dd8
	.xword	0xee50fc96a1b50fcf
	.xword	0xcbe954add0575e1d
	.xword	0x0225c402c06381c5
	.xword	0x6672d667944c72e1
	.xword	0x52d89280088f91ff
	.xword	0xec62628b6f6b4c50
	.xword	0x53556b48df5c0cb7
	.xword	0x5c80631eefd5da6c
	.xword	0xfb999da33e13af05
	.xword	0xb0f96179fc203a9d
	.xword	0xd8356c8bbaef0fd9
	.xword	0x0f7b68ae69391fdd
	.xword	0x180a0119f41bf7c8
	.xword	0x6f0eac160d61065f
	.xword	0xab9cf907841fc53b
	.xword	0x57e2871523f75804
	.xword	0x4d3decd3416bea74
	.xword	0x38d3c48a4bc4ff45
	.xword	0xca0e87ea3c205e5d
	.xword	0x97ad6357dc590a7c
	.xword	0x906f36e464210161
	.xword	0xead35cf8bd2937f6
	.xword	0x52ab3d09a38d269d
	.xword	0xf86b3d7e5786089d
	.xword	0x503db70c140681e0
	.xword	0xb3c73ee9c3731928
	.xword	0x6f1bf5e7f7e57f75
	.xword	0x46801362b6f13683
	.xword	0xe433fec94ed754ea
	.xword	0x2abb1a717144f877
	.xword	0x8be93acac4ced143
	.xword	0xd521cb3758a2cdcb
	.xword	0x74e91484d77a38cd
	.xword	0x8020e298e5e37b33
	.xword	0x0c56830004ec4dba
	.xword	0x759de39b1e6036c7
	.xword	0x3b94ee6ae6fdb86a
	.xword	0x014ba2fd60ca2740
	.xword	0x19dfc7ab601c7fef
	.xword	0x76a89fff035b1db4
	.xword	0x844c87953bdea7c7
	.xword	0x5e4d846a310fa370
	.xword	0xe2d467c93b3c7bbf
	.xword	0xd18b9bb5c6a3bb39
	.xword	0xd364268ebf88f6d1
	.xword	0xe28f28137e31fd26
	.xword	0x5aec189a1df1d23e
	.xword	0xafe34d385b2eb61b
	.xword	0x1955cfe0b94d6065
	.xword	0x53ee2fc6be9aa767
	.xword	0x07648635eeb1fabf
	.xword	0x77733288f96467af
	.xword	0x2ad4519d7528d10b
	.xword	0xe7293f6230e3d068
	.xword	0x966d2ed7ffdeecb1
	.xword	0x8d8ed477031159d0
	.xword	0x469ee969405ee290
	.xword	0x8c899e0a49061548
	.xword	0x3be48f75a2c11248
	.xword	0x0458c3132127e580
	.xword	0xf5876314db8f27d2
	.xword	0x59300010c745e7da
	.xword	0x83cfa9f13096fec5
	.xword	0x709fc7b197680e6f
	.xword	0xd9092dca4e740f83
	.xword	0x7cb31f30f2ffb6e3
	.xword	0x4c673c5db1189861
	.xword	0x0452fee8bfa7a865
	.xword	0xc316e5ae90f52eb3
	.xword	0xd0f9cfe3f16af925
	.xword	0x25a33e46fa697758
	.xword	0xdbc8b6973d600f6b



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
	.xword	0x9401590794331e41
	.xword	0xf7b306de3814886b
	.xword	0x0b09efa43f449112
	.xword	0x4037e5e6167e3237
	.xword	0xc8428a480502d470
	.xword	0xbe2d2dc0dcd2430c
	.xword	0x53fb3e4f277b48b8
	.xword	0x10f3830b309836b1
	.xword	0x132a8eea10cbefc1
	.xword	0xd890980734f45ab2
	.xword	0x0cc6e03aff1e44b2
	.xword	0xebac2eaa40ed4e11
	.xword	0x8b1e270d28261356
	.xword	0xa4a840bcc7087519
	.xword	0x944537ec372f4eb7
	.xword	0x511f1bbea4012b94
	.xword	0xf63c4913cb6f52b3
	.xword	0x4697c89525c96f00
	.xword	0x0162da715491ea1e
	.xword	0xd4590ac75a97dc10
	.xword	0x320c7bc4f1880ee2
	.xword	0xe7175b6c187cd0b5
	.xword	0x8ee3a8cbdfa38a85
	.xword	0xfe604c1ede87bc6b
	.xword	0x9f5aed789807d287
	.xword	0xbf327275987f74db
	.xword	0x1e6a77b74212bde1
	.xword	0x74faf91bb5a7c457
	.xword	0xeec2958a95e5dadc
	.xword	0x1ae2e6d06869352e
	.xword	0x059761e91ca35a28
	.xword	0x5129f4097e557b92
	.xword	0x30a5db0bd3efa521
	.xword	0xee3f4a6c021de4e0
	.xword	0x878be6032501e97f
	.xword	0xa3911a53fae4a61d
	.xword	0xa9975a935faec488
	.xword	0x687a8b8289ff03fe
	.xword	0xf5c4d7a540b64949
	.xword	0x719b12818f7625ca
	.xword	0x6dafc08ce5347123
	.xword	0xf6434c11501dd488
	.xword	0xab6ff19f2e45d846
	.xword	0xa3adeff519f79ae1
	.xword	0x46565000089a6a7e
	.xword	0x09435fc423a65b74
	.xword	0x766c763955a300f7
	.xword	0xef6d2f1b7dc6ee8a
	.xword	0xa8075b36f0136bbc
	.xword	0x7c832aae6800d8d0
	.xword	0x2b3b8605bf1de303
	.xword	0x0854ea869cc5b866
	.xword	0xe1cfda95f4e41b7d
	.xword	0xed78ecb09e00ab64
	.xword	0x3828f19a9070f22d
	.xword	0x6aa594de50cb862e
	.xword	0x0c55294eaf1517bb
	.xword	0x55edda7f97ca738f
	.xword	0x16cf8feac68053c6
	.xword	0x0dded8d67a1b1473
	.xword	0x9fd3dc1fde44ee1d
	.xword	0x688fa22599261895
	.xword	0x9b77ecaf60149083
	.xword	0xf1571cce6c0142b8
	.xword	0xe27ad0dae6e096c0
	.xword	0x6c9b46caddbfe435
	.xword	0x9283f29d77c9b7cc
	.xword	0x0c3e29c4ee438e8a
	.xword	0xa4e0289d6c547de9
	.xword	0x751aea5c796d5514
	.xword	0x74a4947fd70d23fc
	.xword	0x2d11630e0f491fb2
	.xword	0x8ed5b16e3edf114d
	.xword	0xfea108249d3237b2
	.xword	0x3f914c616b833ad8
	.xword	0x6b14418e42ace2ec
	.xword	0x43f7b1f8f021cf08
	.xword	0x44587b2278f568ca
	.xword	0xda7c81e065cb6ddc
	.xword	0x5c39fa1a3c5a8c51
	.xword	0x4a9020a79c352389
	.xword	0x9e04540f85011eea
	.xword	0x90cf400e45fd3a2c
	.xword	0x0492e79c15541d70
	.xword	0x53c8d161cc014025
	.xword	0xfa3d65b74d336415
	.xword	0x981a8af3a4a9afa1
	.xword	0xcb6359f986787bdc
	.xword	0x61c21099a3666f59
	.xword	0x6ecb5874d1670574
	.xword	0x90c9cd5025a786b4
	.xword	0x6ecedd84f85caac1
	.xword	0xe6219982a63c7df9
	.xword	0x29fe1bcad5e4948c
	.xword	0x8a29266d45eae69d
	.xword	0x59f2c7d3f843668a
	.xword	0x30319a9368846de5
	.xword	0x7fde7f33501f3297
	.xword	0x6c983eb9318378b8
	.xword	0x7ec3c6398f36dc0a
	.xword	0x7c503c8e4ffec2c5
	.xword	0x30d9b8d66079adae
	.xword	0xbe013b65e2ffdfd8
	.xword	0xc9e4611788965f3c
	.xword	0x73307e2e7904934e
	.xword	0xf3f7848941751f65
	.xword	0xbd1c05dee7d07b61
	.xword	0x3075487fb05650dc
	.xword	0x66749b245dfd6ecc
	.xword	0xe45be29ed508f938
	.xword	0x5ffc116d834fe8e7
	.xword	0x8cfd80058218967c
	.xword	0x64a232ecbf04a593
	.xword	0x798539d8990ffb5f
	.xword	0x5fb0ff33dda60151
	.xword	0xf9db0034a3af6d1c
	.xword	0x53e400da105957fb
	.xword	0x6f3dbcab2c6d5682
	.xword	0x0af9c80c0900793a
	.xword	0x54e0ebcc9d5cbc25
	.xword	0x456923f70bf763e5
	.xword	0x8a47f4b08093c1fe
	.xword	0x1c316243aa2be255
	.xword	0xfb46b72a5478f842
	.xword	0xe7371e95045c7584
	.xword	0x24a70c50be0f7724
	.xword	0x30c2b36d7f25807c
	.xword	0xf7ba34a84fb8fc36
	.xword	0xe27fd675e391feb5
	.xword	0x0e189048ae250574
	.xword	0xec96342e3add49f1
	.xword	0x7564ad96adfc9b2d
	.xword	0x9248532dc4f50e53
	.xword	0x49489fb4881c7191
	.xword	0xf7407e60f5d80c97
	.xword	0xb29eb5d31932f7a7
	.xword	0xf9b1986c7325ccd0
	.xword	0x08dfed38a8620ef7
	.xword	0xf082a519785a9a86
	.xword	0x3d91f69570e0a9d1
	.xword	0xde1061dbdda7c2db
	.xword	0x51ab60e7dd4c7a10
	.xword	0x3b4c5d609b0af39d
	.xword	0x342524ac41750363
	.xword	0x049339827d6697f0
	.xword	0x24ee22128ff27868
	.xword	0xd6bc3868f7023d28
	.xword	0x33bc5561bd6b236f
	.xword	0xf941325405d6d481
	.xword	0x46e7d830f9a698e7
	.xword	0xccdf00cbcf22a326
	.xword	0xf187121d12b41ffe
	.xword	0x92a5e5248118317d
	.xword	0x8daeb84fb7865eb7
	.xword	0x87106a72d1d89d74
	.xword	0xd29f1592ce8da60b
	.xword	0x77b7cadfaafd9e07
	.xword	0xdc9416fa4bc78d6f
	.xword	0xc2fa798b8279ee98
	.xword	0xc1ac3a4fe4645254
	.xword	0x33a318213e8b3acc
	.xword	0xb19c17d172ecd5e2
	.xword	0xcde67a1cc29e3f03
	.xword	0x765ff795d0739f21
	.xword	0x99d3a2fcf65ee0e1
	.xword	0x91c9430ad180a457
	.xword	0x6951cdc78b8128ef
	.xword	0x37b85de19b2686ca
	.xword	0xb8b7ef27aad9bc2b
	.xword	0xbc7450789ffc865b
	.xword	0x5f6118e4a71644c1
	.xword	0xbdcb72575d9c8eb4
	.xword	0x734ef0d55a6ecf26
	.xword	0x23dafb7d2b9f8710
	.xword	0xe115b60313a68588
	.xword	0x3cfcc37c06b5fa87
	.xword	0x61262cdf3d5ade04
	.xword	0x769d0372db10a33b
	.xword	0xc73b9211f21f6296
	.xword	0xb8eec86868ad17c1
	.xword	0x9f8f2dab3d5c16dd
	.xword	0xb7f03f1c007195db
	.xword	0x27aae787acfb7791
	.xword	0x510024e770f7979a
	.xword	0xee3ff36db59fee04
	.xword	0xb8926f6b577c15ba
	.xword	0x02785291d1fc96d6
	.xword	0xf8727a3f8220bdcc
	.xword	0xaa6dde204fd177a6
	.xword	0x3b114948e70d3ecc
	.xword	0x066d1d1595e51d96
	.xword	0x8d1dec98a4209e0b
	.xword	0x33b6ce6697662963
	.xword	0x1458fe7be03b6e5e
	.xword	0x4bd5fd2671929db9
	.xword	0x4be544853e94ce6a
	.xword	0x810318660c00fae8
	.xword	0xe12e555c812b52ee
	.xword	0x88d5944c2799d1e7
	.xword	0xf94209b83689bdfe
	.xword	0x3a5c96a68853f86d
	.xword	0x27be0f58d9cd5c68
	.xword	0x969add14ded2323e
	.xword	0x9ddf961dd98b8b0b
	.xword	0x4b8c0a026d007efb
	.xword	0xf9e5fc0ca5a2e52b
	.xword	0x082f2c670e9672bd
	.xword	0xb63c5e7f2e298bd3
	.xword	0xab68ba7debc45ac2
	.xword	0x0d4219218dc6ff0b
	.xword	0x4523753dcc5cf107
	.xword	0x727e66592947be62
	.xword	0xfc17fcc0a16934fa
	.xword	0x54add14036ee7708
	.xword	0x1407e565517c7e4d
	.xword	0x956335c77b12f3d3
	.xword	0x13d3a1371fd5aebf
	.xword	0x235ee085790fd250
	.xword	0x16af5f999f5b68eb
	.xword	0xba1ea8eb742c4d76
	.xword	0xf96005abb83a628b
	.xword	0x8c88587cba4d6e37
	.xword	0xf85a838b32e82d8b
	.xword	0x4960f6ba0a062be7
	.xword	0x8bb74e45271ae06e
	.xword	0x4d28bbb67918e192
	.xword	0xfada9c65f5a6e381
	.xword	0x808fdd8e29f9593e
	.xword	0xf7b34272ef0d0a68
	.xword	0x752b4b6243ef5059
	.xword	0xcf6af2051056c741
	.xword	0xb2a91df6318f4a2d
	.xword	0x35105fd58d44f6f6
	.xword	0xec2ba732098b897b
	.xword	0xaae1da0d61dec54c
	.xword	0xbbab848eb7cf7400
	.xword	0xb4c9e368c8c759a1
	.xword	0x385499514e6418c0
	.xword	0x3b4948f2e67421c1
	.xword	0x1394d73f76bb8039
	.xword	0x987b6d7e303cc7ea
	.xword	0x63ab3f3c1b5462e6
	.xword	0xd56b86df668e5b1f
	.xword	0xe4634d885276cee7
	.xword	0x656c90be51d0bc05
	.xword	0xaec88bc618978ccb
	.xword	0x234df84dc2e57e65
	.xword	0xd9b9429ce4e962b2
	.xword	0x40f99505721d9900
	.xword	0xb00febcce536383c
	.xword	0x68d00a224672f97b
	.xword	0x7717be611db19f30
	.xword	0x5060f611a67fdd6c
	.xword	0x760e50e3484ba06f
	.xword	0x8d10644260f614fb
	.xword	0xce0170d44191b12a



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
	.xword	0xce10924ff51c662f
	.xword	0x20280f2e810f2f65
	.xword	0xc596c744498369b2
	.xword	0x8cec1f51def6f2f9
	.xword	0xbc33dcfb2791c360
	.xword	0xbb56cf7cb8ccee54
	.xword	0x9c687d2792b42a26
	.xword	0x71fdd7d54c47cb32
	.xword	0x77d3b3de57b9baba
	.xword	0xfafe94b3919502e7
	.xword	0xc318fa043c9fa3e7
	.xword	0xcfac4fb579911124
	.xword	0xfc2ebb6dd0c86ec9
	.xword	0x8b3d92a4fa9d97c9
	.xword	0xca06490e3531e2ee
	.xword	0x9963ddd5d5b067f6
	.xword	0xdcb6cbca97f0b957
	.xword	0xf44e710414c1066c
	.xword	0xde063f7e863db6f2
	.xword	0x021443161ae12829
	.xword	0x3ac9ac48fbebadfe
	.xword	0x9ef6c80185a83add
	.xword	0x2a1c9f6f3cedd294
	.xword	0x30a2e823876dbe4d
	.xword	0x1bfe93aa848bfe86
	.xword	0x9b08c5b5fe3f410d
	.xword	0xaaf06e66109f83ab
	.xword	0xe01176259fe69b16
	.xword	0xb66050a00a811a7f
	.xword	0x38b1d4bf33804ecc
	.xword	0xa76d7734ac39388f
	.xword	0x3997fc081db63a27
	.xword	0x3923831396732e1f
	.xword	0x6a352d45921bfc7f
	.xword	0x6ec1df1ec6cf1f37
	.xword	0x09507b1c0527bde5
	.xword	0x61f1fd55d6727134
	.xword	0xd5459c9875ac9944
	.xword	0xa31ea3a45308156c
	.xword	0x72b9dc89c564932d
	.xword	0x9412e79c67468b8e
	.xword	0xfff11962f568596e
	.xword	0xf8b87a70bbe771f2
	.xword	0xa5ce46bc8eaa6a61
	.xword	0x50904415ec4f0b4c
	.xword	0x5eeaa326ba1cf3f6
	.xword	0xf461164edfafd887
	.xword	0x40a37b733facc9bf
	.xword	0xe6a5246d21299ba2
	.xword	0xfa2e27fe88ba1759
	.xword	0xc9bf0ebd9f8c4f47
	.xword	0xcb470fa79a4d7ca6
	.xword	0xcec8f9f6737ed4d4
	.xword	0xbab61c44650e6cf6
	.xword	0xd9f7e69feea16ca9
	.xword	0x340c3d931079290c
	.xword	0x768774b0cf83e84b
	.xword	0x179ef393808accc4
	.xword	0x0c0d46d6a8d848bb
	.xword	0x4c2e1d81826a152b
	.xword	0x1e8769aa3f3be6ed
	.xword	0x72060162cef27e6a
	.xword	0xa15085e330100594
	.xword	0xbbf74eb1b9a6ac44
	.xword	0x43cf32c8e2858c86
	.xword	0x0af2a49994c0a9bc
	.xword	0x40cb98fef572b0ed
	.xword	0x2df7d62453c62c3e
	.xword	0x47818b3a91809d79
	.xword	0x3ad72b8c9f144884
	.xword	0x76726acae6e7ea10
	.xword	0xcb817b7343402e35
	.xword	0xd68bff944f2b432a
	.xword	0x65371593bb63c904
	.xword	0x2d51336ac0c51dbf
	.xword	0xdc3ef1a4140005e2
	.xword	0x3365dc06eb9892b8
	.xword	0x14d7bb51cddcc9b2
	.xword	0x1083e9e29a45911b
	.xword	0x37155a159aea2b4a
	.xword	0x645130091a689284
	.xword	0x337003f22c927278
	.xword	0x72e7a49d512bd133
	.xword	0xd18a17c94fd03b8a
	.xword	0xae9c5761f5065686
	.xword	0xafc04cd5685bf77d
	.xword	0x37cd4c9df76764b7
	.xword	0x94ae70013e323f2e
	.xword	0x5b1f18e1baebf00f
	.xword	0x6971df1efd619b86
	.xword	0x2ce141bb4ef8dea4
	.xword	0x9e68628fd8d41434
	.xword	0x78b1ce68ed8b6a09
	.xword	0x93105ccc67e4ad43
	.xword	0x7078688c1dece6b0
	.xword	0x4fc47e03235291c9
	.xword	0xf2c7edeb37f60336
	.xword	0xb432487067fde3cd
	.xword	0x92a7a67a930e7f5e
	.xword	0x9eae35a698da1534
	.xword	0xcb24bfd8d514538c
	.xword	0x5367f87a7dc5129f
	.xword	0x17803d5ad79cbc68
	.xword	0x4388accdfc308d72
	.xword	0xbebe8c1e8275357b
	.xword	0x333535ed7a7bc958
	.xword	0x53861b5fdaaa30d5
	.xword	0x6c9f526edbcf57ad
	.xword	0xab5b9c6d996df5b1
	.xword	0x8be2bd4877dce482
	.xword	0xc3759d032bf35d8e
	.xword	0xa62808747d0ba341
	.xword	0xb9a3653aa2cb83ea
	.xword	0x4441531937f9c48c
	.xword	0xb0b36279380291b1
	.xword	0x8c42a87759017ed9
	.xword	0xa42e22d88e224910
	.xword	0xbb438aea7469c974
	.xword	0x3536f0d172206860
	.xword	0x1e789444ed542961
	.xword	0x7f2ae1547fab0473
	.xword	0x8d28437a874cc824
	.xword	0xfe3477fee1c86316
	.xword	0x5f0b7abd7fca4ddc
	.xword	0xe68117f3c107970a
	.xword	0x781c00c519dcd071
	.xword	0xebd11e1a6c09d5e3
	.xword	0xcd37746e401ff23b
	.xword	0x93c626d9afa77287
	.xword	0xb24003941d986d13
	.xword	0xc20d7c409c19a0b3
	.xword	0x86df5c579ddab06e
	.xword	0xb0d70ed54ffc4ca7
	.xword	0x9b5e9962aae54fff
	.xword	0x908fc05435730b24
	.xword	0xc8d03908efc9deeb
	.xword	0x0cc611ffcb605483
	.xword	0xfb318c71a61470c2
	.xword	0x8400b114fd6cf462
	.xword	0xcf77d374da64e84b
	.xword	0xcb8f48f606ac1026
	.xword	0x6b26bed3e7efa74b
	.xword	0x85c9901acb9b15d4
	.xword	0x335d5d915b592b36
	.xword	0x88c17dd935085311
	.xword	0x2942a63560bd1d09
	.xword	0x47db3978cc3b6520
	.xword	0x04a1d1f8fd160ed3
	.xword	0x0214ed204e909c7c
	.xword	0xe4b79458f35a2185
	.xword	0x630e2bc229eaea7b
	.xword	0xfaf3ffa0a00d38ac
	.xword	0x0dabb00ac7b61027
	.xword	0xc6d8af03d7207ee6
	.xword	0x52164296fbf9cdc7
	.xword	0x4edd87c96a4d2daf
	.xword	0x1db4da8f70c56b1a
	.xword	0xd5e7b2f049735d2c
	.xword	0xb623024e37c15e81
	.xword	0x8287b2fe7465133b
	.xword	0x4da7f85dd77040b2
	.xword	0xe4b750cd790db1d4
	.xword	0xae3070aee055d882
	.xword	0x1a1e9479e8b73c0b
	.xword	0x20a3fc2493e8e2ec
	.xword	0xe9bec5f4a8a507d3
	.xword	0xe1d566b2fddcb5db
	.xword	0x4ce9978467c44a89
	.xword	0x2fcc3b5b9b0cd486
	.xword	0xc7944f8702398ed7
	.xword	0x6837fe46a141b5ae
	.xword	0x88c352a090f23448
	.xword	0x052cd2252feef5ab
	.xword	0x809009004d7f543a
	.xword	0x604386563ba740ea
	.xword	0x4907e1f2068dee90
	.xword	0xa6a15c84a979c6ab
	.xword	0x1f43703f5bf6ae78
	.xword	0x3fc93648d5359782
	.xword	0xf3d1ce72542e99eb
	.xword	0x99d4f2dfc9950097
	.xword	0xadb61ab4375b12cb
	.xword	0xe77f0e185379b1dd
	.xword	0x84324bd05ff68fc2
	.xword	0x7b10d8ed028597aa
	.xword	0x323e88b6b2e25dd7
	.xword	0x5c23dd5637e62e8b
	.xword	0xc55c69bba1a03f8b
	.xword	0xe223ef0770c5fdc6
	.xword	0xab4326445776df3f
	.xword	0x5c9a11d7b658dce1
	.xword	0x4e756585705a1bb5
	.xword	0x4d9970acd46e3706
	.xword	0xe480619bef1e0a80
	.xword	0xb47eed9b382a43fb
	.xword	0x41ee939a0be31859
	.xword	0x2a7d1f6c34a0290d
	.xword	0x0d7d944c38fa6a95
	.xword	0xcf4b8d16b311aa30
	.xword	0x77c75336fac6f4a9
	.xword	0x0d44ec61cf699cfc
	.xword	0xbab3c05b407c6ba9
	.xword	0xc3545c840e882398
	.xword	0xa30cfdc1e129b90c
	.xword	0xa3a437f30a1c5c6a
	.xword	0x848c5f2c19f6a6e2
	.xword	0x63cace11a54da0c7
	.xword	0x6ba19e14cb1e6ab9
	.xword	0x6e822f09ce144ec2
	.xword	0xb9e77253b410bac4
	.xword	0x334c75bfd61431d0
	.xword	0x8af070bfc6c2cffd
	.xword	0xf626b2a951483edb
	.xword	0x31bd5cb68ec20cb2
	.xword	0x2b1a2bc18a00f9cf
	.xword	0x89774017677d3b37
	.xword	0xc542bdc1f00818ae
	.xword	0xac5e17a9a969fece
	.xword	0xf935daaa43964755
	.xword	0x87c2331b0aa11ef4
	.xword	0xa58a98f7defb8581
	.xword	0x612907b8df5e4a6e
	.xword	0x76aa2cf2f8ae5b23
	.xword	0x1a40148e24d74a7d
	.xword	0xbf0c6677673ede9f
	.xword	0x36391abe9a3e3394
	.xword	0xe27d27ff761bcd73
	.xword	0xe2dac661bcff123a
	.xword	0xe7a72bb952012ecc
	.xword	0x3d916ef4672e441b
	.xword	0xf1e84bf92f3aebd1
	.xword	0xd4b770386bdc1315
	.xword	0xa9607d85ff444640
	.xword	0xe32c909db113e56f
	.xword	0xa859279ff3d6ae3b
	.xword	0xb0302a858c998d12
	.xword	0xb8e459bd73cde134
	.xword	0x9ee9c68c651123d1
	.xword	0x142d1ff5f5b43d93
	.xword	0x2bb0823d744a798f
	.xword	0x93b16e80f26910de
	.xword	0xf8a94ecd2059c679
	.xword	0x7126119bfa268e9a
	.xword	0xd1c6789aacb2924c
	.xword	0x750b801c43a4884f
	.xword	0x6aa7458dda06dc6b
	.xword	0x15ea30537398af56
	.xword	0x5d7bec43420e96d0
	.xword	0xc69d150aa60ab134
	.xword	0xd39360fcb7014243
	.xword	0x9b0b71ae45790520
	.xword	0xa16d76638e1971de
	.xword	0xb95caeef6179e259
	.xword	0xeaaae1874ac246c3
	.xword	0x87ecbb21bb918660
	.xword	0x93f2cebdc90ea16d



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
	.xword	0x09d029b67ca09a52
	.xword	0x2384ca6af05f7d57
	.xword	0xe3bab48cdac8a304
	.xword	0x27e566db5d0bcc34
	.xword	0x4f6c977b491799f6
	.xword	0x7224277f4579577b
	.xword	0x43bdc5fde593b265
	.xword	0x12d4bc34ad1d1ee5
	.xword	0x3ecb41f675b88f25
	.xword	0x3cc363c15d64266b
	.xword	0x730ae707effd14f0
	.xword	0x4b55cc64b0bbb59f
	.xword	0xf39ca1b30802f63b
	.xword	0x0d2ee484fd566980
	.xword	0x5e5b77db3bc60f62
	.xword	0x6cb77c8970268f42
	.xword	0xf432e94c5ffceed2
	.xword	0xe324bdda695eb4eb
	.xword	0x8c8741eeb6bb7be1
	.xword	0xec9131e19d1cdec4
	.xword	0x475cd67e5d845681
	.xword	0xd9295e2c6ad0848f
	.xword	0xcf70faaa6370f207
	.xword	0x92ca5a59c403df56
	.xword	0x0aa4c28476281438
	.xword	0x349dd5bfb8298f3c
	.xword	0x9771950e6c4a7829
	.xword	0xfa161ef77eebe8b5
	.xword	0x82c147da09997725
	.xword	0x470ab48bbc89e080
	.xword	0xcceec141ece484f4
	.xword	0x27f5f7e182dbc033
	.xword	0x6fad5665e870d2e4
	.xword	0xce422510c9218845
	.xword	0x03d3cdb71307dee7
	.xword	0x5be98daaad2ca1ee
	.xword	0x10dc3af4c64241a3
	.xword	0xe8705a9592915589
	.xword	0xff154e1aedfa863d
	.xword	0x289214f466234178
	.xword	0xa1c6859f8396d5b6
	.xword	0x79848b86cdd6b950
	.xword	0xf5d795850edbc207
	.xword	0x11f798c4080283b7
	.xword	0x6b565a56e6f0f4e8
	.xword	0x6c3ba65d99eb345a
	.xword	0xe478448d4deca587
	.xword	0x966c206f7f00a98b
	.xword	0x4130cc3eae3d16c4
	.xword	0x44a240b2f8dcc2eb
	.xword	0x2e4803d775a4cb2e
	.xword	0x4cec67e7a9548551
	.xword	0xa9cf4b6d347f7d63
	.xword	0xff59431b877b90cb
	.xword	0xa3e3b2c47c312ae2
	.xword	0xb5027c7d8947ce39
	.xword	0x7c5462a8bbe9a760
	.xword	0x8b673a49983cf3c1
	.xword	0x957892e1b60a91ed
	.xword	0xea5f12100461cff7
	.xword	0x8b9305511dcab730
	.xword	0xd8504b3080ad2439
	.xword	0x02d3ed695e758e34
	.xword	0xf33b37fa316ecff8
	.xword	0xca5da67964d11d5a
	.xword	0xade3879836cb231d
	.xword	0xebdccb119914201f
	.xword	0x53b3e0734123eb35
	.xword	0x5a98e5c0d26f554d
	.xword	0x816ab6e05ade04bf
	.xword	0xc92c8df738271996
	.xword	0x66d1203e32f524e2
	.xword	0x7f603eebf3a72c78
	.xword	0x5a0bfce8529d9ac8
	.xword	0xadd369a3b754310b
	.xword	0x4e0fa70441caf3ff
	.xword	0xf09341eea89b645c
	.xword	0xc0adf6919097e4a2
	.xword	0x9845a90462bb504a
	.xword	0x8bb8c419459acab5
	.xword	0xed82e29daf5a7e2b
	.xword	0xb43c94a949ce5260
	.xword	0xfe0d149b9982a629
	.xword	0xdb632bb3e5f1a515
	.xword	0x79bcb675bcb95319
	.xword	0xee2efe387d91b529
	.xword	0x68a8206231d32e82
	.xword	0x8f137da15894b03b
	.xword	0xd73a3e4d8935a3cc
	.xword	0xc97ada60c54c9725
	.xword	0x746296500f45aecd
	.xword	0xd8b39dd0d1000056
	.xword	0x2194abd07a66342e
	.xword	0xe6eefecc315976ee
	.xword	0x86b11f6dab4f5681
	.xword	0x559df29cb3c2d2e8
	.xword	0xba2deaf703475db0
	.xword	0x6a94db81eb6bbf1f
	.xword	0xd7cb0cd4bf5e77f0
	.xword	0xa8af98c70c005873
	.xword	0x444dc9a1e7b517e8
	.xword	0xdad46065abb9ce60
	.xword	0x2c66994d0d58e79c
	.xword	0xfab6149e5cb5330b
	.xword	0x5938a2017e214c25
	.xword	0x2200ffc20d76193c
	.xword	0xcd7ed2370171b7eb
	.xword	0xa222959ee6b145fd
	.xword	0xcadac0088614f393
	.xword	0x6ae5e615e31f9c68
	.xword	0x5bfc3154f13270e6
	.xword	0xb80e9e79ae5f2f60
	.xword	0xd72ef340e0644de8
	.xword	0xdaa5711ba85a4527
	.xword	0xea04ea589ba4e1e3
	.xword	0xb178617fef8a070b
	.xword	0xa06ee98e598e5e54
	.xword	0x18c6ce4b491832b2
	.xword	0x19142e344f144d4e
	.xword	0x3540a4a82335b84e
	.xword	0xc898f239b3d6a42b
	.xword	0xbaccbb88bfaab7c9
	.xword	0x397e94f828f7854a
	.xword	0xc229124f2f771b73
	.xword	0x0e88d4a852b539cc
	.xword	0x3cede78191de7fce
	.xword	0x99864a2a81f9e458
	.xword	0x0db87c1cdc131278
	.xword	0x2e1dbb30eda54faf
	.xword	0x03ec8d8e3cca248a
	.xword	0x97704099ebd1327c
	.xword	0x4fe300ccb990a9c9
	.xword	0x124a799f1fd81f8f
	.xword	0xa91e457023afedd3
	.xword	0x1ec0e2417083e859
	.xword	0x4d45a4ba82851105
	.xword	0xdb6d68e55bd757c5
	.xword	0xcd5ae4aed3d81081
	.xword	0x6555ec28c8a8ca78
	.xword	0x3eb53c35b33435b4
	.xword	0x40604aadb85fb0bd
	.xword	0xac0122ca8d95679a
	.xword	0xaf2db8342248268b
	.xword	0x074b71da3572b849
	.xword	0xc05068c2e4d50ee9
	.xword	0x04af104a21fd28dc
	.xword	0xebe989b4f09700ec
	.xword	0xb54bbcf9eb47df6e
	.xword	0xe060e856e85cde12
	.xword	0x4c31c501fe6d8a1a
	.xword	0x2ec019e8dabfe422
	.xword	0x70966345f4804135
	.xword	0x808ca6b870aa7e64
	.xword	0xa032febac62eccad
	.xword	0xb69a6877b2095368
	.xword	0x9e6d620af8e3070b
	.xword	0x7941c7abf4937b1a
	.xword	0xdc693e5cba321b05
	.xword	0xe670d6a4e23b9288
	.xword	0x781acb7a600e2ee3
	.xword	0x3500c3ef7e91723c
	.xword	0xe5b973da8d4f6fdb
	.xword	0x10bab5484369bc8b
	.xword	0x2b1e47a880d49099
	.xword	0x9c30790680cb8b90
	.xword	0x7ddacde67bd0f1ed
	.xword	0x0e573ce3628843f9
	.xword	0x917f1385913ad1ce
	.xword	0xe06d57b5805623d4
	.xword	0xcfc4b3e7a72c4dea
	.xword	0x397e27724f678e4f
	.xword	0xf8b7167d44df6542
	.xword	0x2728acab5f5b8ba1
	.xword	0x05881b005905400a
	.xword	0x65aff69619ba3c45
	.xword	0x824fcd360cdfe370
	.xword	0xe7d9fdd9096f6c09
	.xword	0xe53b2ce104a62869
	.xword	0x2e15e8cb1c334414
	.xword	0x3e6c6ad23d22737a
	.xword	0x60401baf5ca92b29
	.xword	0x49980c3a3e5e6296
	.xword	0xf7625f5a54d6a097
	.xword	0x7daf640fe93a1b58
	.xword	0x5899a64fce13f408
	.xword	0x22d1779940435788
	.xword	0xb14f2f335a7394b3
	.xword	0xdebea47a55b51090
	.xword	0xac624b99f32ddebe
	.xword	0x14c05eee51d1c485
	.xword	0x26f83ccca5eac27d
	.xword	0xa71c0c854ae82bfc
	.xword	0x79c2674a4db23196
	.xword	0x7855c6bce4f5cc4f
	.xword	0xe6964d3ab7c90a1d
	.xword	0xdfce751273d6f596
	.xword	0xab83eb87cf230c60
	.xword	0x7221fcc8224388ec
	.xword	0x82f0f2fa9df6587f
	.xword	0x1cf7d1510ba4ea9e
	.xword	0x356b4dcbaacebdf5
	.xword	0x9cd050b3839452d5
	.xword	0x1205ad1c923a56e5
	.xword	0xc97dfa99f6479b40
	.xword	0x8dd35538de314eb5
	.xword	0x5169769ac2e9aba7
	.xword	0xf99a7c39834411f2
	.xword	0x6e486e96678bdfb4
	.xword	0x10fe3858c6c77698
	.xword	0xae5f06253edfc63b
	.xword	0x66a1fed82ef6a457
	.xword	0x341dde613705f915
	.xword	0x65d3eada6c03cfea
	.xword	0x509fd80f0fc6ec25
	.xword	0xe29005d09140cc85
	.xword	0x064d4bf7786c7f54
	.xword	0xe4f71f730ea71714
	.xword	0x10342c42b7a3f5c2
	.xword	0xbfbe4d0f04e80625
	.xword	0x5bce3a36846791d5
	.xword	0xa2e313aaf07aa54a
	.xword	0xe6bcf70650611108
	.xword	0x82d827ca27bdf7b7
	.xword	0x461a6aac5cb41cdc
	.xword	0xb9f4d9939e461141
	.xword	0x17bf62cc42161a54
	.xword	0x762146f75cf6bf8e
	.xword	0xdf51e20157dd4331
	.xword	0x8d8355c22543d5ee
	.xword	0xebeeea05d6f5c61b
	.xword	0xb53301ad7433b56f
	.xword	0x061544c1aca16b30
	.xword	0x7b4253b6bf3315d6
	.xword	0xba0d1c6fb9711cec
	.xword	0x26e0f297028b7ab4
	.xword	0x357f50ab57d182fd
	.xword	0xfc1f20de81584847
	.xword	0x66de0214dc1ac9d8
	.xword	0x89d47d8ed6bdeead
	.xword	0x9a2ee141b1dab799
	.xword	0x872c8950547f9a54
	.xword	0xd9089da4a262aa91
	.xword	0xb216713390e732a4
	.xword	0xfb07497cba04439a
	.xword	0xc61da8d2efa71ba2
	.xword	0xfc770cfbd7e0d932
	.xword	0xa92a92aaf596607f
	.xword	0xba89ed9452903ccd
	.xword	0xf3d949c0aee4a9a3
	.xword	0x27be18052e8596d0
	.xword	0x9d0a4a04cd301809
	.xword	0x05382f9786c484f1
	.xword	0x5228aab3851e0919
	.xword	0x1a5d40e92a16e517
	.xword	0x02913d55118b99c7
	.xword	0x83c2c032aa56631d



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
	.xword	0x0ae869ceef61e4f8
	.xword	0xf77d180b47a68aea
	.xword	0xf47f5ac778ae00c2
	.xword	0x5c9ed624719c34c5
	.xword	0xe0e51b6042afe491
	.xword	0x2844ff2255741565
	.xword	0x892353a22f6649c1
	.xword	0xbc9ebfd35d179be9
	.xword	0xba1750fe25994e28
	.xword	0x57f6642d626bc16a
	.xword	0xec89503e98ffbd22
	.xword	0x39247cf4e66c3a23
	.xword	0x7e59767608d04ca0
	.xword	0xb70087dd9dde95c4
	.xword	0xfc89e5bee239d323
	.xword	0x29c02de01759492e
	.xword	0xf26bf87fbb21fc75
	.xword	0x0462edd0bacf926b
	.xword	0x875547402ec8f0ac
	.xword	0x9890c31870e5919f
	.xword	0x1d33677a9c3f2d0a
	.xword	0xf750b5c1acf3f3ad
	.xword	0x5c421f7536dac186
	.xword	0x21cda53c4cbded50
	.xword	0xebe0b5675d7e1610
	.xword	0x6a0831b4eb11433f
	.xword	0x45bc68e749d4f463
	.xword	0x2414b7dc5fbf81fb
	.xword	0x9ccf756725744d46
	.xword	0xb062dbb9160c08d2
	.xword	0xe5eef6d29fb981e6
	.xword	0xed4517cb52f3c5a9
	.xword	0x2539bc0dd92e077f
	.xword	0x42ca70d1b1d95b16
	.xword	0x3f9e7a3f92c7a5d3
	.xword	0x5ac6e068d387c0b8
	.xword	0x7a7b040de0d99d74
	.xword	0x7f7c54902e0ee2de
	.xword	0xe769d103d8e2d441
	.xword	0x7be9402bd266e7c4
	.xword	0xdf34775969b808c7
	.xword	0xc008e444de4bfada
	.xword	0x704e8f94e2a7a031
	.xword	0x5e87422655033537
	.xword	0x00f54c3dda81671b
	.xword	0xb5fbf3df75063ef8
	.xword	0xe83ab80afe67c508
	.xword	0x3d63cf84b9a5b152
	.xword	0x4a9f9821cb289afd
	.xword	0xc8dd5873b66ba1cb
	.xword	0x2a80415c83aae68a
	.xword	0x962408763b740439
	.xword	0xe9cab0c32c516f21
	.xword	0x3d00e9b3fec10378
	.xword	0x4625de28ce7968d3
	.xword	0x4d4b96c177eb3cde
	.xword	0xd4cad10393b3fa6f
	.xword	0x1d1f194fec798127
	.xword	0x67b1fd016b0c616f
	.xword	0xeb7a3521671ace0e
	.xword	0x72063d658b3fd1aa
	.xword	0x971a7e0480bba4b2
	.xword	0x890f3a548357a9b2
	.xword	0x47ef87be662cd873
	.xword	0x64e078733a2526b2
	.xword	0x22440b87c3c06422
	.xword	0x1690fa547276657d
	.xword	0xa51ec0a74bb46442
	.xword	0x95432e12870de397
	.xword	0xa98fb6656328ff33
	.xword	0x5eeed291ad19ee2d
	.xword	0xbc542f2907c2a577
	.xword	0x01e1997693929f70
	.xword	0x58abff5c970a5ae3
	.xword	0x91b181b845d7f2f2
	.xword	0xa8dd0d728b70c9ff
	.xword	0x10766eb750b64fca
	.xword	0xe49bfcf82e721ce0
	.xword	0xef57bc4bece8f9a2
	.xword	0x929bf870e29b4d58
	.xword	0xdb14b2e852b566e3
	.xword	0xbf8046c1f2c39d9e
	.xword	0xc06018edbbb040a4
	.xword	0x5789a185a040fbec
	.xword	0x9cf6eb8b77502cb0
	.xword	0xed1663f991b5c366
	.xword	0x04ad270137bf3804
	.xword	0x0ddf38de715d509f
	.xword	0x687e32655712edcf
	.xword	0xc819471b84a68228
	.xword	0xac71761dd8a64230
	.xword	0xb6a4769d51034c00
	.xword	0xe1a654dfdf1ecac6
	.xword	0x4ffdb2482573966b
	.xword	0x1ee617cb3061a860
	.xword	0x676f74146d285b20
	.xword	0xd4a30e0ccb785cf3
	.xword	0x8c48dd2096496944
	.xword	0xf6fa570d82bfc05d
	.xword	0x841e71c00c3638d9
	.xword	0x57e3c8dbc0f84fd6
	.xword	0x98ae789c10c29d64
	.xword	0xb059da54334017b1
	.xword	0xeca6b60eff2653f5
	.xword	0x5bfffe50269fb4fb
	.xword	0x69d291239d9c3e87
	.xword	0xb6dda57fcf1e30cc
	.xword	0x8418cf46a0084f45
	.xword	0x6a6c1b27e6dec61a
	.xword	0xbf6ca4ae4600f6ac
	.xword	0xf4b1ff80cebe91da
	.xword	0x8de8eed375bbd806
	.xword	0x02ecc1d787dde642
	.xword	0xa754db46313dc2a0
	.xword	0x24fd68244bb7f573
	.xword	0x8ad337a66584311d
	.xword	0x2d41f69a4f18c3ab
	.xword	0xe333e963a4d3e507
	.xword	0x956b4c50f15fa2b0
	.xword	0x54d391b2bb7b1696
	.xword	0x435d31948f61d02f
	.xword	0xa73bc835a368b58a
	.xword	0x822afb57b368151d
	.xword	0x98c1290e77de1c99
	.xword	0x2236861a36fa67b1
	.xword	0xb69b978be567bb17
	.xword	0xe8c2c0f57a689c1e
	.xword	0xede5bd3779b7a9a6
	.xword	0x04c7f0f4b8eee38d
	.xword	0x12b82a50c81721fa
	.xword	0x34f3bc03bd067d78
	.xword	0x737e8c672dfa58c1
	.xword	0x3143a9b6eb15f499
	.xword	0xdf213efea3e07e02
	.xword	0x9c7a92d68a6d60ef
	.xword	0x4aaa165f6336ecf2
	.xword	0x128212b9c6595709
	.xword	0x75b4265c7c1d7cfa
	.xword	0x59de66d5cdf2d9c0
	.xword	0xa7a06e1bd5573315
	.xword	0x38fc0b56956799e2
	.xword	0xf8bd4a1ca9c816ce
	.xword	0xf24ff1241669d693
	.xword	0x00e8a42adce8b6f6
	.xword	0xa1f8312c67cc2cd4
	.xword	0xfa6e43bcb4b8e097
	.xword	0x7f626763e42d4d50
	.xword	0x99361a5f4838eec4
	.xword	0xd7a42738adf36035
	.xword	0x269a8821d7d0e7b5
	.xword	0xdf222fbc3549f1ee
	.xword	0xa904d9d33094195b
	.xword	0x79529f90e59039b6
	.xword	0x5df105266be9efdd
	.xword	0xe0b4170a286cb14e
	.xword	0x4a2724f690c094fd
	.xword	0xa39de9f32cba09d9
	.xword	0x9242f0fd3d55afcb
	.xword	0xc16a308f3022157a
	.xword	0xeb02d4145e2e0820
	.xword	0x9e26d9ea51a7a3e1
	.xword	0x04e4ff38140a1cd9
	.xword	0x8c4760b56badae4d
	.xword	0x9e654c07f0be9bbf
	.xword	0x7807e59df3b97c98
	.xword	0x2fb632981f8f83a1
	.xword	0x194865f54dcf62dd
	.xword	0x37233f2ad8719e36
	.xword	0x4d37f31bbb091e12
	.xword	0x92acc1c1e7f0790a
	.xword	0x2e0be1d21ac33195
	.xword	0x925144a2a155a170
	.xword	0x35a5846b3edc426d
	.xword	0x5c2b16462aa5ecb7
	.xword	0x7774ae74890df458
	.xword	0x2c1fd64883686d6a
	.xword	0xe874cd84e09977cd
	.xword	0x7c1176316476305c
	.xword	0x766f253db367936f
	.xword	0x0c39c6369f132e73
	.xword	0x2f58b1eb80c9e87d
	.xword	0xf92ef3572d0d5c63
	.xword	0xf08382ecf0239b85
	.xword	0x6d0ec75125745d9b
	.xword	0x8092b2d27f2f48eb
	.xword	0x9e9806346c755b53
	.xword	0xec6cc590a41f6d63
	.xword	0x42b15b2a00d726a1
	.xword	0x26101e043395d81b
	.xword	0xb8b441f87be3fbf2
	.xword	0xc86e66fe078844f6
	.xword	0x7853b32b6dfcc947
	.xword	0x0811ec0026911c74
	.xword	0x37c633d173809612
	.xword	0x9b35310811283915
	.xword	0xa10fcb20158db089
	.xword	0x129bbe3172cd5536
	.xword	0xdf21f1d046cb9784
	.xword	0x1d4478bfcaa0b05e
	.xword	0xdbf1b77b0c6f5cf2
	.xword	0xb104b395244fdaa2
	.xword	0x6b7d333e062bb99e
	.xword	0xdfceb0f469cc1a62
	.xword	0xec4ce37f7b34fa2d
	.xword	0x30d5e28112a8344a
	.xword	0xdb9b0df62ab7fb33
	.xword	0x74cfb12b1f8567fc
	.xword	0x757be5214afc0897
	.xword	0x7a1a2eb2d3b1170a
	.xword	0xcbc9ac3763ca3a99
	.xword	0xcf8507578f1b399b
	.xword	0xf9db8a12ac9c9d2e
	.xword	0xb678b597b997d8ce
	.xword	0xe4dd04573bd989e2
	.xword	0xdec5de9db09a5483
	.xword	0x1764713ed2a07f62
	.xword	0xffaf5387f7fe8334
	.xword	0x6ace6249b40f6bd4
	.xword	0xc337e638be619fcf
	.xword	0xdd9ac9fcfeced432
	.xword	0x3a6d65f7a480d8f5
	.xword	0x60eb23ff4e114538
	.xword	0x3ac45f00269b3d11
	.xword	0xb755f665f6e03eb5
	.xword	0x3e0c1b819c5f37b2
	.xword	0x328aab1bedfaf5a8
	.xword	0x43ec931eab1d7427
	.xword	0x94a4251841db4512
	.xword	0x350902b8bca9c93d
	.xword	0x1639122b64f99e41
	.xword	0x90152a1b17e25a78
	.xword	0x955535603bf4be89
	.xword	0x5ebbdfdf873835f1
	.xword	0x9307747575a26117
	.xword	0x38e3abe36db0ae1b
	.xword	0xdc7110f685af4ba1
	.xword	0x3819c477e4a8ef11
	.xword	0xc95c290da163cf86
	.xword	0x4225ff08defcc9ee
	.xword	0x09bfcce7501d19f5
	.xword	0x202665e3815c664c
	.xword	0x1713a116e9f67d85
	.xword	0x43d4d74f96b6c1ec
	.xword	0x31345cc4ea2009fb
	.xword	0x62b66d5eb1f1d386
	.xword	0x23f636be64ce1473
	.xword	0xb2838e1a7c1e994b
	.xword	0x4c64a6c057b52bf8
	.xword	0x47b80b769ba05528
	.xword	0x88220f01988857e6
	.xword	0xf3fceb1a213a1133
	.xword	0xe6435ed1b467bd01
	.xword	0xd0910b0fb5184353
	.xword	0xba10e4443e4981c5
	.xword	0xabef65c0b39a6b8d
	.xword	0xc244bf81fe70d7b7



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
	.xword	0x7cff18c30695948e
	.xword	0x78e9ca6ec9f07f7e
	.xword	0x26f8cb6406f78470
	.xword	0xa13f9af4fc98c12d
	.xword	0xb9de8485b695ad16
	.xword	0x24ebe7d240bb6045
	.xword	0x243641566e72e4ec
	.xword	0xf0a332d99b2aea05
	.xword	0x3223a3b7c53f2dab
	.xword	0xd7b8f229eb2ec82e
	.xword	0x055babd56273c14d
	.xword	0xa902728cda3c0276
	.xword	0x802c87a853656725
	.xword	0x8da3266685413102
	.xword	0xb91fa3b6289b520c
	.xword	0x92049241372b1be9
	.xword	0xe08ab4611cc6967f
	.xword	0x083db302fa1d4b4f
	.xword	0x4da883b1808da0a1
	.xword	0x8295bdd08b47860d
	.xword	0xc81f50566f220647
	.xword	0x8c340b48f3fbe08a
	.xword	0x0609d3f2663f7a33
	.xword	0x06220f8f50d66515
	.xword	0xebcf1bbbb6bbd516
	.xword	0x6f55efb736e534a7
	.xword	0x9d7bca290edb7ce7
	.xword	0x4e7f59b6acc430e8
	.xword	0x6c9ac1ea6ebb245e
	.xword	0xc34f1029181335dc
	.xword	0xff67fab5ad072ad9
	.xword	0x96c76b038debfc82
	.xword	0xef7b72986f961354
	.xword	0xf1a5f4fb92ca945c
	.xword	0x62b9676e547dd7ff
	.xword	0x20328c9a870fdaa5
	.xword	0x7ccc667411d77ba9
	.xword	0xbee518c02f3585d4
	.xword	0x4e5ca886a107ef61
	.xword	0xa85f2cdb62d98f90
	.xword	0xfd9ff3d9321a786c
	.xword	0xab146388d8054afa
	.xword	0x7e8de6bee1ec7b88
	.xword	0x5d9b34a8049365fb
	.xword	0x67b4beb6d8b8648c
	.xword	0xb5d37b99c6257d0a
	.xword	0xf2d2aac8e8438c1c
	.xword	0x20470e1fbfb51c41
	.xword	0xa7b2dc1b3c147066
	.xword	0x189b8a633150b261
	.xword	0x8e72d4756d175ee5
	.xword	0x05e88e2097efa846
	.xword	0x19c049fb1ec24e22
	.xword	0x5436f02593c5ed2a
	.xword	0x4a41a00122982b44
	.xword	0x880c0a484404de19
	.xword	0x1342cf0fedbe9adc
	.xword	0x1e3f4953746ae17c
	.xword	0x8295beefc5173965
	.xword	0x221a638d78ebbd1c
	.xword	0x92051efb2b650d0a
	.xword	0xce206724c9baaa0e
	.xword	0xc3c8d31dbf6e7057
	.xword	0x07326afcd1f940ba
	.xword	0xd8e841706815a059
	.xword	0x1b7e00e5bf9b0bc6
	.xword	0xeaa88e1b3a122095
	.xword	0xca6dfae6823a8571
	.xword	0x13126acc7f78fbfa
	.xword	0x0a4d64f886492b44
	.xword	0x819ff815ed5f7bd9
	.xword	0xb55f8c41441667d8
	.xword	0x7822bcd0aa132499
	.xword	0x86db748fb3c72765
	.xword	0xa15cceba96bfdd71
	.xword	0xb82fb8e7bec1ee9b
	.xword	0x098066fffc26f244
	.xword	0x7e4afa4a40ca7cc3
	.xword	0x03f6989da3194380
	.xword	0x989a4ba6f4c00611
	.xword	0x0bef2582f937ff93
	.xword	0x09a438173e7ea254
	.xword	0x206fe4744c195903
	.xword	0xe94c3b83306cdba3
	.xword	0x693c30b04f27042f
	.xword	0xb11c62e89ea2e638
	.xword	0x0540c11711d1f4d8
	.xword	0x71ec1aae3c707093
	.xword	0xd5b425d5cb38265d
	.xword	0x65914f9400018e21
	.xword	0x6116080307e69b7c
	.xword	0x2a1ab45be9dff62b
	.xword	0x28ded58cee858f2f
	.xword	0x0ec177e1dcacd599
	.xword	0x6e02431b96dd350d
	.xword	0xfa22b39ac4bfa55b
	.xword	0xb7039d6e6193c571
	.xword	0xa31135f4bd1fb7b3
	.xword	0x98a53e6ebbe4f39b
	.xword	0x789841922e2292cc
	.xword	0x0005f12f96f535ea
	.xword	0xa8ac5e6ddce3193c
	.xword	0x83f3487a6288f58f
	.xword	0xa5e8973998b83b4e
	.xword	0x96499f06acce88f6
	.xword	0xbb6aae9bffd48a2c
	.xword	0x2d168dab7b0e3c86
	.xword	0x2259d84f63328105
	.xword	0xa700f4943f5e0dbe
	.xword	0x9edf033666aa16c5
	.xword	0x268da8e0ccc0f3ab
	.xword	0xec1408e6ac78f2e3
	.xword	0xf6a78cd8776d0c50
	.xword	0xca747420316b6c0a
	.xword	0x22929c40347e750d
	.xword	0x2497e3be9922a726
	.xword	0x245330c24e66c1b0
	.xword	0x2e4a88b2b090d773
	.xword	0x7345054217ce1405
	.xword	0xbbfcd556ae06f1b5
	.xword	0x1a6a1627d4544526
	.xword	0x14ac935bf5cef006
	.xword	0xda15e94548a3915e
	.xword	0x3825a9b2f15c6b8a
	.xword	0x379c8019f432de54
	.xword	0x0c558c04bc7f94f7
	.xword	0xd1ba71cd1d0866a0
	.xword	0xc4469b9a17978b88
	.xword	0x1c711bccb9bd67a8
	.xword	0xfd84fab516e1d7bb
	.xword	0xf3a8ded8e54c8c43
	.xword	0x2a37847add76c438
	.xword	0xc2a75d95a06755e3
	.xword	0x108f93b4961a2545
	.xword	0x2b92a783bdb0d4c0
	.xword	0xe9a47d92d3768a35
	.xword	0x3a3500950b944d7f
	.xword	0x2c7c38f878e188b7
	.xword	0x0b07611ef8da0d46
	.xword	0x261e3e6138fc5235
	.xword	0xcbd28bb2f440d174
	.xword	0x9166a7aa68bb4a14
	.xword	0x70bffe3733f220b7
	.xword	0x56ef15a7a5cc069d
	.xword	0xfa70b478cf510e33
	.xword	0x95eaf036565112ae
	.xword	0x71bc328901f8b29b
	.xword	0x547b67a092113ea2
	.xword	0xdcf0c9ff50345e46
	.xword	0x370c0dcae1b842e2
	.xword	0x05f42095e8774674
	.xword	0x8f8822dd9b04b9c0
	.xword	0xd51f19a3f8b5ef42
	.xword	0x5b4855bac85483ff
	.xword	0xb4d8442c26a9d2a6
	.xword	0xb1de8de83d469187
	.xword	0x4999f3e1e54e92ab
	.xword	0x8bf8f0a7e3b014b2
	.xword	0x50bfd37612124786
	.xword	0x12082494d3e8f3cc
	.xword	0x15642fa6df516c5d
	.xword	0x6cd7083b363b5409
	.xword	0x835b05cdcb8eef87
	.xword	0x63ec5bf51599c3af
	.xword	0xe104f35f0dde941f
	.xword	0x3c55163d03e521a2
	.xword	0x96545ba7de88b657
	.xword	0x843149bf2456d5ca
	.xword	0x3e8dea7ce57800dd
	.xword	0x3d901514c7ab4e76
	.xword	0x8d88efd899badbbf
	.xword	0x9db431b6d6c3afa5
	.xword	0x5f68c4138c9b6e20
	.xword	0xf5671ae5e969747e
	.xword	0x23a0716bb7941b88
	.xword	0x0fb5ee211881ffc5
	.xword	0x2e35307cd9c311be
	.xword	0x7aa7f385532384ce
	.xword	0xea802e435502b346
	.xword	0xc430c8bda5211f87
	.xword	0xb9da8005b3f68cdc
	.xword	0x1bbfce302c1b4e36
	.xword	0x25229025f045a445
	.xword	0xc2c6415fa26bbd76
	.xword	0x66e75472d8b5a03e
	.xword	0x4fd7b72e5111b1d5
	.xword	0xe1c4ab196fc7755a
	.xword	0x3c1ffa0b52c68403
	.xword	0x207135ab80051331
	.xword	0xa9127256bda28c82
	.xword	0x0b28e54e801a161f
	.xword	0x576f39251ffd9f27
	.xword	0xb2ccab93eabbf861
	.xword	0xf1bf777057f96b65
	.xword	0x193965fd47f3c955
	.xword	0xcc15f14e948082b7
	.xword	0x07010d885bd2e8e7
	.xword	0x9e2f2d1162c17ee9
	.xword	0x65020d65d01b49f1
	.xword	0x9b43ed268d033e1e
	.xword	0x80c8aaa22b63c229
	.xword	0xe8bd929d198b7731
	.xword	0x3ecfcc6f75ea0a80
	.xword	0xa525902124f4efa1
	.xword	0xceefeaaf480d0f22
	.xword	0xe766d131f7826bad
	.xword	0x1f1f6fcd52cf7b9a
	.xword	0x3ac287ada8a68ecf
	.xword	0xade89717bf86a9ae
	.xword	0x41887ab4dcc7fa8f
	.xword	0xcfb21d3f3f37d60f
	.xword	0x5917aa1c848437f3
	.xword	0x7efaaf0a9b31eccd
	.xword	0x861c3735e3b20279
	.xword	0x944e977fd2482b4a
	.xword	0xe33756cc6a6f6455
	.xword	0xefa46af773211696
	.xword	0x5880a94beb6f532e
	.xword	0x41e32aea492f5467
	.xword	0xfecd4b85e7e2242c
	.xword	0xc89a8bce8a0deb82
	.xword	0x968da06bfb3b96fd
	.xword	0x7ce95484549d044d
	.xword	0x38733cda7b08a04f
	.xword	0x37cf46220e3eec1f
	.xword	0xa5876fee6feac797
	.xword	0x22a476518c4e737b
	.xword	0x87236f9f2e6c7746
	.xword	0x11bfd27fdbad5f07
	.xword	0xde0df56e5222339e
	.xword	0xd85d073aa790e189
	.xword	0x586359b0a8d43d55
	.xword	0x7227b12ffc459332
	.xword	0x420c38877334c965
	.xword	0x24c5b80e1fcf8fe8
	.xword	0xda3e07892962f528
	.xword	0x29dd4c4b5db642d7
	.xword	0x2d72c5120ccc6415
	.xword	0xef04ed8b00dbcfda
	.xword	0x8d552e2597ef539a
	.xword	0x826fd636eb0a7a3f
	.xword	0x439ce495df591e52
	.xword	0xf61ce424907e507b
	.xword	0x2fee22c9deba7575
	.xword	0x3910edf606d14220
	.xword	0x57f15c7081d1b05b
	.xword	0xea07b420faa6210e
	.xword	0x3dd09d31bc1b11d0
	.xword	0x5f84ef68831cfdc8
	.xword	0xf4d688898e7475b1
	.xword	0xbb9e94da9ae9d4e0
	.xword	0x49187a6c3e678cd9
	.xword	0xa830fa5158d91485
	.xword	0xb10a9d90a63c2471
	.xword	0x7f50218b73f49605
	.xword	0xa847360908e177a1



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
	.xword	0x9814f4fca503128d
	.xword	0xabf6de92bd32b3fe
	.xword	0xd387d31d341b3f81
	.xword	0xe7410cdf146d2780
	.xword	0x74a4176f1f02aa04
	.xword	0xff7c9bd8f9411048
	.xword	0xd71d338be2f91c5e
	.xword	0x9d39054dc4796e38
	.xword	0x7dd1be9a48f01fc0
	.xword	0x01b22a97db09a235
	.xword	0x504123ab37d18a43
	.xword	0xc85d372d0f8d92d9
	.xword	0x66428bce35d536bc
	.xword	0x8e1f366e1c01ff5a
	.xword	0xa8b9e7c4e11c7d2e
	.xword	0xbb1182773fc5c80a
	.xword	0xc1b054875660a054
	.xword	0xf0b4881c2afbcf99
	.xword	0x54ef88f556b3cdd1
	.xword	0x20b19a4c4871d2fe
	.xword	0x09beda4b63b22183
	.xword	0xb2829ec075e958c7
	.xword	0xa7c1174d4746c89d
	.xword	0xc33e451f17dafc2e
	.xword	0x63b118d58725243f
	.xword	0xd6a360276f90c9fe
	.xword	0x75d6efb12a283662
	.xword	0xc5993b2b876dfaba
	.xword	0x79f62fe768e78de6
	.xword	0xe954c0a2e2feb6e3
	.xword	0xdcc2784cc132783d
	.xword	0x78e316e7106fc75f
	.xword	0x2c3acbe1d6309347
	.xword	0x6971b8920b810dd8
	.xword	0xedf141afde84309e
	.xword	0x21f6d9dc6265f067
	.xword	0x30f27e1065fb2f6d
	.xword	0x4fb32fbd7289c70f
	.xword	0x201239ad0795cd45
	.xword	0x41ca639e4fcd1290
	.xword	0x084a855486add86e
	.xword	0xe637c40ed3d43de5
	.xword	0x3aea4c3c67e8d669
	.xword	0x35157c72e5031308
	.xword	0xc52a3e01c433ed99
	.xword	0xe99a160af9001a79
	.xword	0x687911a6423d51ab
	.xword	0x960ae662727f69da
	.xword	0xa21f23230c8a564c
	.xword	0x0118b41c5c0d0494
	.xword	0xbb7b4f98ea48453a
	.xword	0x06acdbab9a520cfa
	.xword	0x44b812629c3684eb
	.xword	0xf8a5772924c32a24
	.xword	0x06d4b036c727035f
	.xword	0x3a0609df9cbc3fc8
	.xword	0xc53b9ad4494a7764
	.xword	0x4f551cb34bc34b60
	.xword	0xc447d51d9a3f20d9
	.xword	0xb142027265760c57
	.xword	0x828bfdaf0659afc3
	.xword	0xa3ab1513266b1ab6
	.xword	0x0f892fd0e6f95593
	.xword	0x680fd54408c062e5
	.xword	0x4481a3b8d1c95a70
	.xword	0x2113d03975e0fc56
	.xword	0x7d47628b0e1824b2
	.xword	0x94ee85956181e6f3
	.xword	0x82992e0897061b91
	.xword	0x905875be563d2c30
	.xword	0x2c9cc34a7239cde3
	.xword	0x62f7b11a5d7f8528
	.xword	0x7fc8b366354fc4ae
	.xword	0xf660624594d32cd9
	.xword	0xde45974f6091f1ab
	.xword	0x58e2f6496768d9dd
	.xword	0xdc3395a00262d55c
	.xword	0xbbb4377be9d6311f
	.xword	0xae7c5293d7867e81
	.xword	0xd9e872621821eb95
	.xword	0x1b17d05cee3b8ebe
	.xword	0x1c9fffc0bd715f6b
	.xword	0xd49a18a0fba1d311
	.xword	0xcd726ad439218575
	.xword	0x29f16991c447e00c
	.xword	0xfbf823329027e10b
	.xword	0x3bdb8ae04f268eac
	.xword	0xc954299edd38fd4b
	.xword	0x6766ddb73dd407cb
	.xword	0xfa52f22676091158
	.xword	0x0b288e520056a56d
	.xword	0x978ff7609ad7e853
	.xword	0xbc9b02fba2346aa3
	.xword	0xb2906ed7caee7258
	.xword	0xe9da1cb3f8902d6c
	.xword	0xcc218c374b46a470
	.xword	0x57a6323d3cf73e17
	.xword	0x615344db9ca8ed22
	.xword	0xc1192ffa8c9e4a60
	.xword	0xe33f60cde17592f7
	.xword	0x823e215eb7c8ae8c
	.xword	0xa5b5971a241e646d
	.xword	0xd17a574e02205e24
	.xword	0x904e7e06c224380a
	.xword	0xb9e9340fe64bae2f
	.xword	0x99f5da1e9c1d62e4
	.xword	0x83e233e71e5c5508
	.xword	0x9fcb2ea0a19f1a44
	.xword	0x0171d2480d608df3
	.xword	0x27c3b3656e19659f
	.xword	0x5ba06f1a48d06089
	.xword	0x4a86cca66d0b3969
	.xword	0xd6905298699c4d64
	.xword	0x4b07b1abb0ef8e44
	.xword	0x87616298dbdea496
	.xword	0x63ad2ff415985ba1
	.xword	0x5b7b2b02e6fe7017
	.xword	0x52f2702b3d46a66d
	.xword	0xde7114986f097134
	.xword	0xe7e3ea52dccad4ac
	.xword	0x7e75f2a47eb7aa7b
	.xword	0x2165b75763f6f448
	.xword	0xae9c93214ad0c0c1
	.xword	0x21ba91ab306c3be6
	.xword	0x84fac95e236a6b3a
	.xword	0xe48bd5195b49448b
	.xword	0xfda0165b4a781f4e
	.xword	0xc85b524ce5127b78
	.xword	0xce9754d319497a94
	.xword	0xd9b163fd5ad34de4
	.xword	0x1706e47053bec56b
	.xword	0x3b4c45f60dc55829
	.xword	0x28c846c24feb3cbc
	.xword	0xcee9562c318c5498
	.xword	0x56cd4174d4c1283e
	.xword	0x6e17330650d616a1
	.xword	0xe5cbcb90c8c1f6c2
	.xword	0xa4ac701b65034d22
	.xword	0x7160f7eb74c8e98b
	.xword	0x76087b00909c4d56
	.xword	0x5a01223a393af4ad
	.xword	0x98fa5087a96cfde1
	.xword	0xb0440af6e9e6f8b7
	.xword	0xc774c19ed2717132
	.xword	0x39be167429d37dff
	.xword	0x17e5129417d0f56a
	.xword	0xb909f51ef20ed2ee
	.xword	0xae9dbf6ad32b2d5f
	.xword	0xa9152420fdb56914
	.xword	0x12f2a7389411bbce
	.xword	0x9ea2b439af772420
	.xword	0x00f75427acb71c19
	.xword	0xe588ea26d3babb02
	.xword	0x16172cc90ddaf290
	.xword	0x930e2e37dabd2ca3
	.xword	0xc265b367e4de8723
	.xword	0xaf984d709a99719a
	.xword	0x46032f3b68d53017
	.xword	0x2a467f27f6518621
	.xword	0x1defe0a77d1535f8
	.xword	0x2a1a0e8bbfba2910
	.xword	0xc68bcb96f18982f1
	.xword	0x3f384c7d17358f4a
	.xword	0x68edbf390b24c34f
	.xword	0xd1a30b3b760e6360
	.xword	0xe31b1e1af061eed9
	.xword	0x48e3b488dc923567
	.xword	0x41b8e8b30764c0e2
	.xword	0x9ba5fd1e6c3be1ac
	.xword	0x9fc90ec90440d403
	.xword	0xef639cb21c4f1780
	.xword	0x14542f7b7a50e37b
	.xword	0x2cae48490467ba5c
	.xword	0x5b2a1337aebaee4c
	.xword	0x6dad6ea7ce1b2685
	.xword	0xb1b258268cbcedda
	.xword	0x59ccf0f8746e96c7
	.xword	0xf3eb0509545c12c1
	.xword	0xc8bf54eee574bfd9
	.xword	0x55e44fc6e3ef47e2
	.xword	0x5ab9d5beef5b8478
	.xword	0xb7a111a4149dadc1
	.xword	0x45b31f0680c458e2
	.xword	0xdfcb059ec8e6c1da
	.xword	0xedb57531a6fe4856
	.xword	0x17afe768ed426703
	.xword	0x88453a286516209b
	.xword	0x5475f0b7ab14121c
	.xword	0x2397559cfc720511
	.xword	0xf18affac5cbee45f
	.xword	0xc2c76a54fba99598
	.xword	0x41b350c344284f94
	.xword	0xffb414ed2b1a4201
	.xword	0xb36a81b9b6559491
	.xword	0x85f9d9a87c0ce10f
	.xword	0x066876d5d5f70c9d
	.xword	0xd4315e9908bbf8ec
	.xword	0xe38135d5a2cb4f4d
	.xword	0x355f6848b1ce2544
	.xword	0xfe934e209ae06b22
	.xword	0xd1b6612922422846
	.xword	0xe1c32cb7bd978941
	.xword	0x91da0b7455dd2938
	.xword	0x3e306a434abd9148
	.xword	0x049026a5ee29a0b1
	.xword	0xb65e2b72d4930097
	.xword	0x682c77e2c2a05a96
	.xword	0xdb7f6219f6b4cfbf
	.xword	0xa0873c0492a2cf71
	.xword	0xcc2b3e55aa86570e
	.xword	0xc030bf1814414a03
	.xword	0x472f80d95f0145a6
	.xword	0x5c4f1a30db82f6fa
	.xword	0x5c2457e43000f708
	.xword	0x874ff3bd56b8269e
	.xword	0x09ef8c5f54df859c
	.xword	0xe6d1a0dce9bf798e
	.xword	0xb4ae65d97393ce61
	.xword	0xe0da3d73ef6354e4
	.xword	0x51ee8773096e468a
	.xword	0x6981a61e8fd3e66b
	.xword	0x679f0bcf9d11f46b
	.xword	0x51f503897fe817c3
	.xword	0x33b263a3f5f923be
	.xword	0x98fa0684e66e5905
	.xword	0x20104e7dd4489cae
	.xword	0x2fe135f0935df067
	.xword	0xecb04ebb4c53e7ea
	.xword	0x66d784655ee50110
	.xword	0x7d03749f1e0ab013
	.xword	0xed67726f01b893cb
	.xword	0x3bbc15f35828e218
	.xword	0x681b0c87de3df139
	.xword	0x8b9bd4ad1c005bce
	.xword	0xc0d8da8ea13919e9
	.xword	0x52a7a949b5a09952
	.xword	0xde238ecefd64ca8b
	.xword	0x00d717fa921a0276
	.xword	0x302c4d4e711d399f
	.xword	0xff02c5d5889652a4
	.xword	0x9214ec8561cb3503
	.xword	0x94eeccaf1e4fdc50
	.xword	0x453100560de6514c
	.xword	0x822c58fce78dd22f
	.xword	0x8e88f03d7e94c93a
	.xword	0xe559922e165b7f3e
	.xword	0x33bb9e692184d753
	.xword	0x24d74a1b3fafa90d
	.xword	0x37d4b23e8d458c98
	.xword	0xaf634054dbd0209f
	.xword	0x2fb40ece67b297ed
	.xword	0x7cafc45e9a33cf80
	.xword	0x3a6c1cbcbb84c9fd
	.xword	0x90a58aae57f36fa6
	.xword	0x4c6b0f0fb618390f
	.xword	0x04d03a72509a9138



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
	.xword	0xb01aa9afe83b158a
	.xword	0x3f7b5e3b6feff7a3
	.xword	0x7fb79f041d8e8c74
	.xword	0xc6825f86f2f7a384
	.xword	0xfcdb8aeb972c9e24
	.xword	0x0f43ef402ff760fa
	.xword	0xc9a4a4dcdba6920f
	.xword	0xd4d799fbbf4701a2
	.xword	0xee0442baa0c201ff
	.xword	0x2e2ea26c3a2fcfcb
	.xword	0xffff118870076867
	.xword	0x376926b15f0aca7d
	.xword	0xdf3dcb79f826dd24
	.xword	0x91e3c04c8c8eabdc
	.xword	0xe08a4f18033da1e1
	.xword	0x29d2414e5cd304f8
	.xword	0x00455f6a89034872
	.xword	0xc7267b65f85d38c2
	.xword	0xd20e5e5f11bfd9c7
	.xword	0x8d1667e4bf82f681
	.xword	0x399b5a41a320d5ef
	.xword	0x875da6c9ae36df7b
	.xword	0x79a46b40e3564d12
	.xword	0x1912438219865e05
	.xword	0x8c43e398a76e2a96
	.xword	0xaeb45fbe08176e65
	.xword	0x061a1b5ac9585c07
	.xword	0x992ee2804f61eeb6
	.xword	0x7aa6b56781648c5e
	.xword	0x733ec2eeaff9724f
	.xword	0x6596ca73062640c0
	.xword	0x7a6eb839efcab2cf
	.xword	0x4c7be4b48ca31a51
	.xword	0x4db2479d4ca09c0a
	.xword	0x611baf01cb054fc0
	.xword	0xf9ed9c7fe594ab3f
	.xword	0xbf629aca0a8218b1
	.xword	0x1b9e48baf0d0b0aa
	.xword	0x6346be6f7ffa921f
	.xword	0xb166f0e2bae456d3
	.xword	0x1a7664b3088e3142
	.xword	0x24a3b5bd93ca5d2d
	.xword	0xc2dd911c3c691175
	.xword	0xd7052d90bee28da4
	.xword	0x7afbf8217446c379
	.xword	0xd56d1d4ea02cce7f
	.xword	0xab49b45405a1154f
	.xword	0x90e165a9672641e7
	.xword	0xd757e2cc1f6d342e
	.xword	0x44fb1f6616e6a17b
	.xword	0xfaf7edacbc6f8e72
	.xword	0x8c94c91d754d86cd
	.xword	0x2dad8ef22b84e20e
	.xword	0xa7add78c9fe37a0a
	.xword	0x0934c99e56218df5
	.xword	0xcc1613fefced0ee8
	.xword	0xca6f5a21b0827aee
	.xword	0x61e78b362aee7c54
	.xword	0xae1def217361032d
	.xword	0xc9d1d2d309bb38e9
	.xword	0x1eec0f2035290e07
	.xword	0x51fb4be2eab4a4a6
	.xword	0x2b7fc2568d7d11bd
	.xword	0x405b8e6d973e4457
	.xword	0x5b021412d1f868e1
	.xword	0x3825ce56a4e568cc
	.xword	0xb21e34fdd8ba12a7
	.xword	0xa7f7059c9d55d037
	.xword	0x058c1d85fc1c07e7
	.xword	0x448763b90504d242
	.xword	0x57104faaedb2f732
	.xword	0xe74b9a5fb631ff16
	.xword	0xb63492db20711be5
	.xword	0xcec2a0923b1de29c
	.xword	0xde86a5856e824b26
	.xword	0xfeec901986397a9f
	.xword	0x4e974666a1de9f77
	.xword	0xfd65a2203ecdb4af
	.xword	0xf92270288cda4a6b
	.xword	0x6d0caa3555625830
	.xword	0x20b1a9a3804d07ce
	.xword	0xdee41197f99c6e84
	.xword	0xebac7c4b5a257872
	.xword	0xa28a7ee51297bc34
	.xword	0xa24838c985ed0610
	.xword	0x0504c2bbcdf6863a
	.xword	0x45ed699b1cc9deda
	.xword	0x0907c78d0aba6dbb
	.xword	0x0425a8eaa88d0e8f
	.xword	0xc8b031066c154de9
	.xword	0x35444557a7814bd3
	.xword	0x65ea45b0a459be5d
	.xword	0x691e197e87568448
	.xword	0xa19c69c356c24908
	.xword	0x5d7d926ce00d2ec7
	.xword	0x2da8b06af13976ef
	.xword	0xaec45d92777a7b71
	.xword	0xafd5f164615d80ab
	.xword	0xe9c37482deca9ffb
	.xword	0xba131a8572d8afe9
	.xword	0xe77e34ca1ccaaff2
	.xword	0xe1cce183445f0127
	.xword	0x5a77e32de7893870
	.xword	0x3fca9f47acfd7ecd
	.xword	0xc5d741b9efc7d26e
	.xword	0x815454547cca81d3
	.xword	0x811d445bd7abb28f
	.xword	0x45fb55f7619382e0
	.xword	0xe2e4b6ac1a17d8f1
	.xword	0x5bb572904ed1344d
	.xword	0xe29cf77a9f43af31
	.xword	0xe7a04b05acf30dc5
	.xword	0xea4316caef687633
	.xword	0x41ace852f81b7466
	.xword	0x93e97239efd241be
	.xword	0xe8b0cef9f4aa5e7a
	.xword	0xe031d7a4267d8353
	.xword	0x048a83ce0825cfa4
	.xword	0x8eaac48aa27ea1c6
	.xword	0xf02e0e76e0b9cd27
	.xword	0x1f05ef4e5710f870
	.xword	0xa8b50049c03c8085
	.xword	0xe4eb85a51dd31992
	.xword	0xd076dc717908a6f0
	.xword	0x20077ce65750fa02
	.xword	0x5ecdbeacd1429b73
	.xword	0x90c01dbc6ef0d416
	.xword	0x34223d50f6642c7e
	.xword	0x0e3adfd26bd465f1
	.xword	0x04064577dcb82896
	.xword	0x692607300a915d49
	.xword	0xa44451bf5a84c724
	.xword	0xacf58c208fe1f6f9
	.xword	0xc5350b21a03af9b8
	.xword	0xa2505fe3f7de3070
	.xword	0xcd2faa5a99d1e265
	.xword	0xea2c9c1d06cb6b1b
	.xword	0x03017dae8a3df0d1
	.xword	0xaa7990478c9102bd
	.xword	0x372945d891a79508
	.xword	0x4fe1a18ddb9b35be
	.xword	0xd9bb791451a87b5c
	.xword	0xcb7740c628f85255
	.xword	0x428000a6de74446c
	.xword	0x129da3622d283ddc
	.xword	0x3a8f49d59e08e62f
	.xword	0x50cb1b3a4528b8c0
	.xword	0xcf7fab2f7414fc91
	.xword	0xae1b5ed4426965f5
	.xword	0x61030a5a6a0d4988
	.xword	0x1516ff6fe242c6b1
	.xword	0x42c315a725f1424f
	.xword	0x8c0de9e2fe8e6ff6
	.xword	0xccd08b433c6e3148
	.xword	0x84eab8e3cb0d29b9
	.xword	0x142850d982d11d28
	.xword	0xeb5832604b43a9fe
	.xword	0xf689a267f389fa7a
	.xword	0xeafbab29e6468d11
	.xword	0x90152658adc162f6
	.xword	0xa165c818f97b3174
	.xword	0x62fb656e20e291c5
	.xword	0xca3b3100d3c4a0d0
	.xword	0xd3ae169e41f35b38
	.xword	0x477fdeed08b20168
	.xword	0xb531cee982ccb19d
	.xword	0x3ce7dafed0149760
	.xword	0xef9c05760ac01d8a
	.xword	0x833076f90622175e
	.xword	0x63af09076ee3f316
	.xword	0xcd41b9c61ee05812
	.xword	0x005b82110b6f2e14
	.xword	0x0c036174a28c642c
	.xword	0x8024546e521863e8
	.xword	0x7227985ba9a62bce
	.xword	0x1cb7444194093d42
	.xword	0xa4f252a70477a7fa
	.xword	0x48ae91ebb9b62ece
	.xword	0x92d94bbb433f6cee
	.xword	0x91deecc0b0884220
	.xword	0x5759b6413f8f7240
	.xword	0x79fa79931e1c6dfe
	.xword	0x4a1697d6d823b725
	.xword	0x8515976d7dd92f8b
	.xword	0x8991314f167000c5
	.xword	0x5bd8390de8c73cbd
	.xword	0x12282054fb348753
	.xword	0xe0ca7179857a9471
	.xword	0x9a56d2df0e4296e4
	.xword	0x0936169ef54b85f9
	.xword	0xa9bc60fc89648a1c
	.xword	0x29a30cdf9fe394ab
	.xword	0x5ae3c52ff8475bdd
	.xword	0xd47e321ecd26018a
	.xword	0x75064052289ccb3b
	.xword	0xe828674daea52b97
	.xword	0x346bfd638c7f025f
	.xword	0xfe7d61c746ae9949
	.xword	0xdfeac1797a19bc48
	.xword	0xbf8f978f5ede058b
	.xword	0x266a7e666c3c2c80
	.xword	0xa3c9137f5a0fd084
	.xword	0x7bb821beffdb2bbb
	.xword	0x55e409288482dfa3
	.xword	0xbd7a94bb82da6711
	.xword	0x4d2d94d69f6380f5
	.xword	0x984fd9e16f5d8f3e
	.xword	0x3caffdb52c76245e
	.xword	0xa1a285583a6f3819
	.xword	0x4511d26c76120414
	.xword	0x0885e01aed622fbb
	.xword	0xdc42d187d9ef6562
	.xword	0x9ca4bf88f5cd3573
	.xword	0x0dacb2b55a928128
	.xword	0xaf39e2b56ab23762
	.xword	0xabc9359786f6808b
	.xword	0xb35f71fa3a78ffc9
	.xword	0xcc586da8425654e7
	.xword	0x66b5ab5e054dc534
	.xword	0x370e3dc6d3eb32dc
	.xword	0xa828e2938ddb8f76
	.xword	0xd1556d51dbffde91
	.xword	0x6c70b020c9b8f576
	.xword	0x52bb5de1493fbff5
	.xword	0xd797e35fca09436d
	.xword	0xe3711e282a021f65
	.xword	0x5804df1fbb7fca63
	.xword	0xc5552ac7d9bbcf2c
	.xword	0x45f8fff8e2c82444
	.xword	0x69728bdc640857bd
	.xword	0xe9eedfafd1e88dc0
	.xword	0x95a97f9b84284435
	.xword	0x365e0c9907f123d0
	.xword	0xa71297ffcbd6b52e
	.xword	0x538313cac3744a77
	.xword	0xbc16e4f448ae94a1
	.xword	0xce981ff6de7cd860
	.xword	0xdb0d1ece926ba275
	.xword	0x20500d85273d0df6
	.xword	0xdba25f9e48cf8267
	.xword	0x9133159550f800c7
	.xword	0x4e97d4275a22ba19
	.xword	0xdefd43c60d67388c
	.xword	0x3372f8b5d9e4d473
	.xword	0x46e2000cd4385e3c
	.xword	0xf3f754eb417fc3e3
	.xword	0x9f74b71ebf2fe41d
	.xword	0xa140b8bd532163b3
	.xword	0xeeac7331e83d78f9
	.xword	0x55031eb83d838c08
	.xword	0xf7e9cde27b534796
	.xword	0xa1373572319fe6fd
	.xword	0x81d0b7493cc4b252
	.xword	0x6a049a28f010b01a
	.xword	0x4f60b3dcf83a024b
	.xword	0xdb2c7cd137989cfb



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
	.xword	0x2a2c789d748a51fa
	.xword	0x095bd0b72f1e37d3
	.xword	0x33fae02cb7dd858f
	.xword	0xfcf899a4a1777e0e
	.xword	0x084492ad1a223770
	.xword	0x29cbe9935c90e850
	.xword	0xd93852cd13eb36da
	.xword	0xe65cdc71029ad84e
	.xword	0x994bb103825ae87b
	.xword	0xd2a7c7ff2e48bf0e
	.xword	0xa8bf4236411d235d
	.xword	0xdac1a77e4f688355
	.xword	0x55cafe80b962ce53
	.xword	0x37864eb6c24a200f
	.xword	0x78aaef0612bdcd9b
	.xword	0x0ea8bf8416908217
	.xword	0x81e1bb4761935b90
	.xword	0x70072adbe9e87279
	.xword	0x045404dd53751608
	.xword	0xbcacfddaa78ca07b
	.xword	0x9b43c5250bcc6d91
	.xword	0x8080c769a1780e68
	.xword	0xad68b31d156bdb7e
	.xword	0x23a73bb6eb263a49
	.xword	0x73e64e61acfe3c63
	.xword	0x5d68beb0688f0830
	.xword	0x73b150d728694b2c
	.xword	0x44615b5213588724
	.xword	0xaa112e8a7b191a70
	.xword	0x555e9abf6796a29b
	.xword	0x7569f8b2e5b01001
	.xword	0xfb1adc35f1b849ff
	.xword	0x101926e4501928e6
	.xword	0xe2bf734be66a2ae0
	.xword	0x9eb1893429e79a6f
	.xword	0x81751f43899dbc7b
	.xword	0x3002f3a0950715c2
	.xword	0x7bd4e59b32318333
	.xword	0x5515c72a3aeff942
	.xword	0xd8bced31f71e49c1
	.xword	0x0b84ea6596fb4ae6
	.xword	0x5b9a2373df91178a
	.xword	0xeaefe8f71cce96ba
	.xword	0x39b75e80b6118819
	.xword	0xc04fe4a4b3c24a0f
	.xword	0xb27d9f571650c0ec
	.xword	0x29bc8f0b78588396
	.xword	0x59867d1d65862adc
	.xword	0xcbe5f92baf22114b
	.xword	0x33d2ddbf9b89afb9
	.xword	0x9772e893cf9cafae
	.xword	0x6ac13098f8f64b2e
	.xword	0x50bd11a2183e8974
	.xword	0x154c0804334dce07
	.xword	0x137ef37984d0e3e2
	.xword	0xdbdf163bc3e29f73
	.xword	0x5949e78ecb30bee2
	.xword	0x50b0d409089a9fd6
	.xword	0x3185aa24e44a25a1
	.xword	0x99e143e6a65b2b02
	.xword	0xd7743d283ac8d2a3
	.xword	0xf33b4a600755d7ed
	.xword	0xf84f19983086c9ae
	.xword	0xdf49f19c38a11731
	.xword	0x45437637f1b72de1
	.xword	0xf400fda21848f839
	.xword	0xf5172a41129e0f8d
	.xword	0xfb5b140bfff22e51
	.xword	0x7b6c5956e22098fe
	.xword	0x0544726d39ae0b5c
	.xword	0x9a241e0e2c4cea7b
	.xword	0x6cf4a1c4d767ceb8
	.xword	0x9bfdc72caddf63b2
	.xword	0x02cb0373aa32f9fc
	.xword	0xcf6942335f7e7b05
	.xword	0xded0258f5b3ee0aa
	.xword	0x97d7e4bd4a6890ef
	.xword	0xc60290571992d3ed
	.xword	0x6532365b86c152de
	.xword	0x4515a28c5d7fa933
	.xword	0x22a773104e1ff631
	.xword	0xe49a6306e98e5961
	.xword	0x97856536ac171707
	.xword	0xfac0bb6503222ef7
	.xword	0x8d5188e6416befcf
	.xword	0x8be7dffd56e0bbd8
	.xword	0xb8799a454ea32674
	.xword	0xb959b384401a21af
	.xword	0x5c71d88975ba5b6f
	.xword	0x2f85a0e1ef624036
	.xword	0xd0aa03bcfe05071c
	.xword	0xa750a2f5a4d5c2ad
	.xword	0xdba341c8eaba7856
	.xword	0xf1fa78115a5c2ed1
	.xword	0x9ea5a34da198827f
	.xword	0xafa33cb43b7a6495
	.xword	0x5c0ac61239ec5ad9
	.xword	0xf512a8ce1b9b5b14
	.xword	0x57eac486b3b3f423
	.xword	0xddfafb9cb8b4edcc
	.xword	0xe04c7f4fc9578e65
	.xword	0xf28638aae7fe3389
	.xword	0xe9899f285175904d
	.xword	0x89c5ebfb293246a9
	.xword	0xb138af8528b8cf07
	.xword	0x1b00f784930359bd
	.xword	0x6aff19d59f9a386b
	.xword	0x8bd531dd6287df69
	.xword	0x647e1ccd8571f1d5
	.xword	0xd9201568f7564111
	.xword	0x20ad3dcfd150da6f
	.xword	0x777f96d8128ca771
	.xword	0x5a41f4decc23817c
	.xword	0x6e07a2b3389fca52
	.xword	0xac266f7d2124a7d4
	.xword	0x3b34a277aba59a52
	.xword	0x73604cf2f36d3e9c
	.xword	0xca39f34e199baba5
	.xword	0x008065557126234e
	.xword	0x6ca68d90d2886fb9
	.xword	0xa7673f6640168379
	.xword	0x2ea7b4a5737109c9
	.xword	0x487346fbdfb2dc47
	.xword	0x9d29e87ced316655
	.xword	0xb664b6e3e36acb16
	.xword	0x1dd74546fed1ddb8
	.xword	0x6fe070950b8fbd20
	.xword	0x18fdc17076e72caf
	.xword	0xfd69df5b5f421108
	.xword	0xa931b370d8223436
	.xword	0xcf489c111b73ebd4
	.xword	0x3052f89485190631
	.xword	0x9502323d92161f81
	.xword	0xe6385e6e6e8a65ac
	.xword	0x0c9363ed746efe6c
	.xword	0x3be7d8cdeffda0be
	.xword	0x7ed29baaf38ba0ed
	.xword	0x89d4c4e6f01aed1f
	.xword	0x5f8fcee084a611fa
	.xword	0xdd58c1f742d95513
	.xword	0xd9dd086d95d10ffa
	.xword	0x87d097ae91ba4949
	.xword	0x99085331018cd6d3
	.xword	0x9953886fb8a03ab1
	.xword	0x1434f04120133638
	.xword	0xba45cd2a42a4dbb0
	.xword	0xfe114a2c7634da94
	.xword	0xfa5c3e55df91e0df
	.xword	0xe070ca7ccc626980
	.xword	0xea4ed57468135482
	.xword	0x678a92a93ee80dde
	.xword	0xe305f43f0c88375d
	.xword	0x7d6d1ff2db2d5e42
	.xword	0x345cd9d9510c66da
	.xword	0x89d26d5f6a0c1716
	.xword	0x789cae545d84b5d6
	.xword	0x23146b49085747a6
	.xword	0x6d915f156cc503f3
	.xword	0xbf78610e8397dea3
	.xword	0xfa9abdaf451653a0
	.xword	0x74adfffe74af6c83
	.xword	0x6d78f19d63c8b722
	.xword	0x97bcfc7e0f53a5dc
	.xword	0x3eceb47680f54f34
	.xword	0x515ca029210df437
	.xword	0xe6cbb9b741b7d2d2
	.xword	0x3b0ffe0d574435ff
	.xword	0xd8eb1e05ded18c76
	.xword	0x80998c45084ef01f
	.xword	0x0c592c872a2529a6
	.xword	0xd14139d17abd3d75
	.xword	0xcecc596818739d0b
	.xword	0xc0a4a32829de7854
	.xword	0xb20337c38da00343
	.xword	0x9a1d7a354117f484
	.xword	0x285419ea46dd460a
	.xword	0x8a24d751792c79b8
	.xword	0xf810f504d7776f28
	.xword	0xad287009bd5929b5
	.xword	0x6fa53a5b724863f0
	.xword	0x710f28a38cafb340
	.xword	0xd84443d92b85e8e3
	.xword	0x6076a607718dd486
	.xword	0xdb64d23bad060413
	.xword	0x86a1cc97ac224d3e
	.xword	0x38563dde51f88dcf
	.xword	0x8c805a2cd6bc848a
	.xword	0x67d12010879b4be2
	.xword	0xbf7faf026308fac9
	.xword	0x00d9bfa3ef9cce0c
	.xword	0xcb9c357b9863a5dd
	.xword	0x6c1b4b1ee2478776
	.xword	0x267a8bc40b58fb12
	.xword	0x9d73bfa817536d9e
	.xword	0x91095a2f8b3db4fc
	.xword	0x76b6409662c84dcd
	.xword	0x2ed0893079e1e7e8
	.xword	0xe9692e57e8e59d7e
	.xword	0x8801d81bf92a9b03
	.xword	0xb8f3b713725b4948
	.xword	0x80c706d4d6c73bff
	.xword	0xa5dbcfa6e6f8d6e3
	.xword	0xae67362940860839
	.xword	0xe49d7eef84ba51c8
	.xword	0x8d111d0697e29991
	.xword	0xdbb7c15d335aeeb7
	.xword	0x8fabfe778043391a
	.xword	0xa9522a2f7e5f5bc2
	.xword	0xfa3b317daf37f83f
	.xword	0x42926a43bdc4d6bd
	.xword	0xe6583b367f057ad0
	.xword	0x8b18bb7dfe33ab13
	.xword	0x26c7cad3cad31d12
	.xword	0x313b60687bff6b79
	.xword	0x0b01fb9c12996e19
	.xword	0xb04a197df1f4afa9
	.xword	0xccc21a6cfb0e4086
	.xword	0x7d5218254507a97e
	.xword	0xb78e7bfe95641344
	.xword	0xaf693a563928df06
	.xword	0x01fe324312a17c4c
	.xword	0x2f7bd2290f1ea9f0
	.xword	0x3aed3abaaf6e87d4
	.xword	0x5ca5a9e39448254e
	.xword	0xec2ab92b6362750c
	.xword	0x84b5f30087f4bca6
	.xword	0x20b2e26495f49e95
	.xword	0xf30c89f46131e6b6
	.xword	0xf7ef0e955073448a
	.xword	0x91f97a9b967699a4
	.xword	0x8dfbba5281f20827
	.xword	0xf39094c8a11eba7f
	.xword	0x03713a387efb0499
	.xword	0x01f3ac6789c79ac4
	.xword	0xa710f9360fdecb9c
	.xword	0xc75303ae133d2f52
	.xword	0x4c2ef66b4f2cb4c5
	.xword	0xf386f0014928e4b8
	.xword	0xbd4fa730fdf89747
	.xword	0x79af929e95973d9e
	.xword	0x4d8206191e3713b4
	.xword	0xd5133cadd764c945
	.xword	0x4747e0ae6127b7b1
	.xword	0xa7301784ebfd0a2b
	.xword	0x5d6fbfe01ad52a86
	.xword	0x3ca3af2ee683b0c9
	.xword	0xd702d9f33825749f
	.xword	0x764f4fafba6243f8
	.xword	0xe4c87b6b553379d8
	.xword	0x4437a173e293464e
	.xword	0x576f96e29b8f7e42
	.xword	0x330c4f89dbce5343
	.xword	0x8ab1b054109557e3
	.xword	0xb2553fcca56c43f4
	.xword	0xb56adb68f9af39ff
	.xword	0x3e7c782a58eda356



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
	.xword	0xeeebcc8846e4d253
	.xword	0x0d631fc787590392
	.xword	0x0733093c3e1a0eec
	.xword	0xa7d58ab3ae4e6710
	.xword	0x8b55f5eeaeadd0ed
	.xword	0x57c814078be9e6dc
	.xword	0x6de374c59991589a
	.xword	0x23f839d086f8d4e0
	.xword	0xb6ccd5b1a9a3a932
	.xword	0xbf1624e7e9bb9ae3
	.xword	0x3ab9a79517286c3e
	.xword	0x8722cf3288edf0de
	.xword	0x931e7afb69808536
	.xword	0xfc6287c0c0009c20
	.xword	0x164538c78f7c9d40
	.xword	0xdf6184578f97048d
	.xword	0x47d587afa74ddd5a
	.xword	0x19ce4159000fd38b
	.xword	0xf86400b2ef6918f6
	.xword	0x7d189bf465880d3c
	.xword	0x18d11ab8045885e9
	.xword	0xb89164f7bea5531f
	.xword	0x9c645c0cc70a592a
	.xword	0xe059492fd96ff376
	.xword	0x39c3847a6bf5660e
	.xword	0x50d4029fc82c6e29
	.xword	0xb687ee84231971a4
	.xword	0xa18d6a334ef1f794
	.xword	0x2bc320fef68a149f
	.xword	0x79ba4fa3bf7e92a5
	.xword	0x7f412079bd953810
	.xword	0x849132c1b67ddf65
	.xword	0xd16c9ced84dc43d0
	.xword	0xf508c6b28e245214
	.xword	0x3619c8d13d9fd55b
	.xword	0x27cceb244c17975b
	.xword	0x9159b1abc74270b0
	.xword	0xc0abf6e5803b7946
	.xword	0x340c00b7bcf07389
	.xword	0x8edb6da6cc395629
	.xword	0x7c827145a7dd0bf8
	.xword	0x408e4f7be768aae8
	.xword	0xeced4a151ccb5372
	.xword	0xaa96a87c6d6d709f
	.xword	0xc3a66bfdd55cd411
	.xword	0x672988323390df75
	.xword	0x5bffc8e271401e71
	.xword	0xb2fa71a8db83bbef
	.xword	0x145397b32934e234
	.xword	0xdd6a9f9a0827649d
	.xword	0x332619fd4c73b7f4
	.xword	0x55b8467f2bc2bfdb
	.xword	0xc5348c372874b82c
	.xword	0x05cb34c4f698ccd5
	.xword	0xc1505f2e62596312
	.xword	0x4df59d51edf6d15a
	.xword	0x55dc5247c929704b
	.xword	0xe7b87fa3a5c4849a
	.xword	0x1e0e8c720abd326b
	.xword	0x4aa29c04a1fd99bf
	.xword	0xc4269213016358c2
	.xword	0x1b56808e85010f85
	.xword	0x9dc7f6f8d832ba51
	.xword	0x1eea09e409e00546
	.xword	0x299ed867cd341f8e
	.xword	0x9e39de38bf8a3b0b
	.xword	0x5f4053ded047feba
	.xword	0xc9c7967c6af9ef98
	.xword	0x3306523f4b0a631b
	.xword	0x219820287dbc5472
	.xword	0x80a9469a9cf34e8c
	.xword	0x6f6db6bc9e713842
	.xword	0x351d8c05e5b77321
	.xword	0xbd1acb0f09ffdb51
	.xword	0x34897c27583b10fb
	.xword	0x577c52782b9a8a73
	.xword	0x768740cc547f2b76
	.xword	0x816ab34407ae44cc
	.xword	0x3a9428b45900b348
	.xword	0xb1f7ca77571622c5
	.xword	0xf02c199e19bde9e0
	.xword	0xf1d4f6c6edef1c0b
	.xword	0xc4cd0c583a9896a4
	.xword	0x5a376b80b816d09d
	.xword	0x1e7816c3a72a8d31
	.xword	0x00f79dcf7463e029
	.xword	0x001ad7ff5bd2946f
	.xword	0x6975ce08dca0c892
	.xword	0x5b9761d5c1678847
	.xword	0xd6707d4de3b17381
	.xword	0xd6f8207088826387
	.xword	0x3111a6c00a21d384
	.xword	0xeffab6b5e3dc53e9
	.xword	0xd2aec77aad892a71
	.xword	0x29af0bf16584b64e
	.xword	0x82027128e599d43f
	.xword	0xf6cdc51af7f2340d
	.xword	0x60f7b039f5ae2ef9
	.xword	0xcc129b601171b85a
	.xword	0x2201281ff8ed0da2
	.xword	0xd979e284ff631d95
	.xword	0xe59f2deaa9ae57bd
	.xword	0x7bb13ef75dc8a8f9
	.xword	0x55135e2085a61603
	.xword	0x85b071d2d080339a
	.xword	0x06c1d79f5e37c292
	.xword	0x09c33e5e15aac4dc
	.xword	0xcfa6805cf26f8f67
	.xword	0x1931b45e41b09de0
	.xword	0x34aeae3f12600c8c
	.xword	0xe5d425249206f796
	.xword	0x746b8220d5439f06
	.xword	0x4ca707fa1550a516
	.xword	0x3a39fb7586beca7e
	.xword	0xe10157844c8e01cd
	.xword	0x28ef2257a3a25aa6
	.xword	0x9051a8c76b1003e6
	.xword	0x898754d9d5cdb0ea
	.xword	0x34225b9238b20153
	.xword	0x6a06286546ad031e
	.xword	0x769563ddee8c48e0
	.xword	0x9176f03a804230a2
	.xword	0xf58c11d2935f98d7
	.xword	0x6d5095d486705ede
	.xword	0xdfd49888c5a25f3c
	.xword	0x8679080b426fa966
	.xword	0xcec0aa9c42c7cd6c
	.xword	0xcb13cf4e1391bf3e
	.xword	0xdd51f275e66dc1da
	.xword	0x12ab6cc6e39d306e
	.xword	0x6388c4789666c86b
	.xword	0x9e26d08440207e05
	.xword	0x3c0c37606d6eef9d
	.xword	0x132ac539511e1e54
	.xword	0xa4d9ef9da9d8caa6
	.xword	0xea3ef092628f9b1a
	.xword	0x6ffc4111adbb4c5c
	.xword	0xecfd126e81913846
	.xword	0x6f1375fa51feca0d
	.xword	0xba13073f76847947
	.xword	0x4a288c68031a9cd4
	.xword	0xa79ee6bf33d44e2a
	.xword	0x22a713966ebdd0b4
	.xword	0x9c41371442255816
	.xword	0xbcad2f782c8ab385
	.xword	0x63363cc90d902e5a
	.xword	0x80d89c1a20154fcd
	.xword	0x6fadf4fbadec9ffc
	.xword	0x2f7be4a07c57669b
	.xword	0xbdc40335e3beb61f
	.xword	0x1dc47fd0599cbb75
	.xword	0x4dd3f15510afbce6
	.xword	0xd2e273580e223463
	.xword	0x906ad1e3d2a91a83
	.xword	0x65f4fa25f357d353
	.xword	0x271ac8a34bede083
	.xword	0x968959c73e404aa0
	.xword	0x9c53fa871186004a
	.xword	0x75b9d1e4fa7e717e
	.xword	0xc71aeff743e588a3
	.xword	0xe7017ba00efe1c51
	.xword	0xb2c496b01601a10b
	.xword	0xa08b2047471a2cc7
	.xword	0xce54ae2d6dca7337
	.xword	0x93ab3f4141e3a60e
	.xword	0x0b001b1ea85e1b46
	.xword	0x98cdc3a3c18f4c79
	.xword	0x115ce0e3be8dcb96
	.xword	0x54833268111f0cb4
	.xword	0x1bca69503ecad63e
	.xword	0x28ffb34f9e532674
	.xword	0x7612b63a25b37011
	.xword	0xec8e2d70a7d47995
	.xword	0x339042015b87d922
	.xword	0x39c94fcb85e85d64
	.xword	0x8a94db9b8f949e10
	.xword	0x5a2621391190897d
	.xword	0x8db756120db69c9f
	.xword	0xb7f6a65c0b2df841
	.xword	0x0db080e94be3c9aa
	.xword	0x0a7201d0a54ee75f
	.xword	0x850318fd686fee4b
	.xword	0xefa0947747b4ba69
	.xword	0x41c9c64245074e74
	.xword	0x2a9a5fd9dcd05136
	.xword	0xd4c30e607c607c53
	.xword	0x57cf9f57a928aaa3
	.xword	0x4e4b22a462beeeb3
	.xword	0x0dbd3d13db49e720
	.xword	0x0e382f5f3548ac30
	.xword	0xc01e9115e036f245
	.xword	0x412eee3f68e73d38
	.xword	0x55fe5ccc81c80e37
	.xword	0x98869b72c52b0b9c
	.xword	0x640e277fd86a8b34
	.xword	0xf49f0c422981cefb
	.xword	0x3b0f1e1f091591a9
	.xword	0xdf5969abe8757cb7
	.xword	0x437dd233ec7ebff9
	.xword	0x28e952dba906441c
	.xword	0x8c97fba06f79e8be
	.xword	0x63cdba0254dac165
	.xword	0x432b00f98b3eae8b
	.xword	0x9b612b1f0d1eb52d
	.xword	0xb9ba3063f32edfc7
	.xword	0x91a9cb01eac05f11
	.xword	0xed4af111f3526b6a
	.xword	0x4037fd00bfd60f9d
	.xword	0xf589aaf6fdb64b63
	.xword	0x1cbfae87fd03c826
	.xword	0x421a98fa95c86915
	.xword	0x2f22a20a1f5cf69d
	.xword	0x4aacbb121b3f9ef6
	.xword	0x15c89cde4f6e5348
	.xword	0x2718f5186f666bbc
	.xword	0x7e4318648680b203
	.xword	0xde62d10a9544b2cb
	.xword	0x1ea6937dc4b73483
	.xword	0x3d1a0e7cf53a3f08
	.xword	0xcdddd4650843ea63
	.xword	0x434b6809a302ff0c
	.xword	0x223c752adb6464b0
	.xword	0xf1373055569ec32a
	.xword	0xb479578a0ca9d353
	.xword	0xcb48a4555302d284
	.xword	0xffebd63cbbcc641e
	.xword	0x30a988babcbe5c4c
	.xword	0x9b3fecdea4915621
	.xword	0x3bd897d81cda05b8
	.xword	0xa3f1aa42f1f9170a
	.xword	0x31eed255341f243e
	.xword	0xbda8853cb9ec5eed
	.xword	0xc6fb58b006782728
	.xword	0x4f5f76808eb26223
	.xword	0xb1f4cb1f6847e1a3
	.xword	0x009adf49801b4457
	.xword	0x645ad0df5f3d7e22
	.xword	0x18aa0ea573ae6d1b
	.xword	0x7e39359ec737b02b
	.xword	0x600cac6a8a68f28b
	.xword	0x2e28a00572e87311
	.xword	0x9eb5c7fc58c55710
	.xword	0xc66365ee7ae005db
	.xword	0x97359de81d139a29
	.xword	0x56c5d8a507dda60a
	.xword	0x6a02f6ac0fe4b836
	.xword	0xb37feb387f572988
	.xword	0x23a0eac52b7c84ea
	.xword	0x789851ea2e59239b
	.xword	0x463f77f6446b6358
	.xword	0x4799191ba5c0cc9f
	.xword	0x6288ef79b33064a1
	.xword	0x272ae70837e095eb
	.xword	0x41a02e2d81ba4d40
	.xword	0xbece8bc6c66efd59
	.xword	0xe068cf90ebb5bde7



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
	.xword	0xd1ba6ba9e39f9874
	.xword	0xe17dba313ea0e55e
	.xword	0x3d0914f60a73d2da
	.xword	0xecbe2420995ea2ae
	.xword	0x56e6c294a515ea83
	.xword	0xe581076c556aa990
	.xword	0x08266bcf89e446a1
	.xword	0xb1a5676c4f4abc6c
	.xword	0x9286091f7cb9287c
	.xword	0x4b93029068d6a34f
	.xword	0x7840fbc9abca739a
	.xword	0xe319d3c78eafc456
	.xword	0xd501b9f09afd3ec3
	.xword	0xa2a14755f3beb795
	.xword	0x309b7f7fe54a3caf
	.xword	0xfe2446ae1c809bcf
	.xword	0x6eea3308c884a60c
	.xword	0x1bc36e9752346bb0
	.xword	0x6fec01bf9d120b8c
	.xword	0x4c7e88f49b701804
	.xword	0x0cba5aecd09127bd
	.xword	0x121292128591dceb
	.xword	0xd7e10caea2852b02
	.xword	0x74efb395f3801627
	.xword	0x4de73a7119903584
	.xword	0x37f1e911acc336ea
	.xword	0x07e540987e34ee87
	.xword	0xd91b2b0a999edea0
	.xword	0x235f837625302015
	.xword	0x0008b7148f9c2b15
	.xword	0x3af290d94b0ac4fb
	.xword	0x4ed93680359a9a66
	.xword	0xaf1d8078c84d30de
	.xword	0xc4b1c76376b5afa7
	.xword	0x64dfe45b5c8c621a
	.xword	0xf35b085a444251ea
	.xword	0x4af0bc7cdead1f22
	.xword	0x982f4df5cade1f53
	.xword	0xf85e296c2df41b1c
	.xword	0x59dca5acdcc9612a
	.xword	0xc94c1b67eaf35716
	.xword	0x8943f11472b2f8d3
	.xword	0x09bc325d6be58f18
	.xword	0xd9bfe4dd5a6fa6b8
	.xword	0x3e3812e3d71acfa6
	.xword	0xe844177277707f39
	.xword	0x89d63a75af6c7e5c
	.xword	0xefc94d69a99d1757
	.xword	0xeb4d4d98881dac4b
	.xword	0x6523162115843de0
	.xword	0xbc94139226001445
	.xword	0xbc2eec57c49aa659
	.xword	0x9e13c8837cd124ed
	.xword	0xf902d02dbdb1d3bd
	.xword	0x1c821f906dff4f81
	.xword	0x66a6109090246eb7
	.xword	0xcf9bd8a2616500e5
	.xword	0x1e665668733dac32
	.xword	0xea8e1a24368aef23
	.xword	0x8d39ea47ef38a03d
	.xword	0x4f1f987411f9936a
	.xword	0x75a6b9e739ae9357
	.xword	0xfe37aa3486ca5fb6
	.xword	0xa14d7e04730a6309
	.xword	0x987730df04ad450a
	.xword	0x5ccab2c74f4197fe
	.xword	0x86fb8247e9e8efce
	.xword	0xc514a5fb6a3aa410
	.xword	0xdae56b8a624c671a
	.xword	0xaa66cf24142d5dd3
	.xword	0x4a0b18f3a3115b58
	.xword	0xe6928d7f2f191b00
	.xword	0xd8275799d632cd3d
	.xword	0xc57fb454bc62d91e
	.xword	0xea95403a1f148ca2
	.xword	0x869e30710c817cd6
	.xword	0x4cc4bac233985d0c
	.xword	0x044d6417b2145c30
	.xword	0x01ff63dfc1fc8b9b
	.xword	0xbe5217579d4c03ea
	.xword	0x74b67312dea061f0
	.xword	0xcd7b5c0d09738e6c
	.xword	0x7fcc795a9b3e90fd
	.xword	0x395a639a78c5aead
	.xword	0x0b40537e88134558
	.xword	0x740371e4665f4cba
	.xword	0x917ea5aacbb77623
	.xword	0xe888d2e79dec7fab
	.xword	0xd8ae2fe8fb51cff2
	.xword	0x0bc10e2cad34df0b
	.xword	0x91426feda91e63f0
	.xword	0xd91d4cbc256c5c04
	.xword	0xdc2639b4b878af63
	.xword	0xb3d1aa4621af793b
	.xword	0x68bd3763ed423df6
	.xword	0xf3df9833cfd05ce4
	.xword	0xc885c206d5b257c8
	.xword	0x4e75c26a1c64f60d
	.xword	0x4b31bf4f32bbe85b
	.xword	0xa852237408d4bfea
	.xword	0xc27720f53d295dcb
	.xword	0x3ce33d5a593c5324
	.xword	0x066aade9157f858d
	.xword	0xc292b79eb1bcdd5f
	.xword	0xd74ef43f33a4fabd
	.xword	0x9595393e9bb457ee
	.xword	0xcbf24453aa47437e
	.xword	0xc89dc4358ec34585
	.xword	0x4d6889fd7ce04221
	.xword	0x530cfff956b77ea5
	.xword	0x799bb82244f55d16
	.xword	0x60a471432962d178
	.xword	0x3e9ba9d732139642
	.xword	0x1102b020c376a072
	.xword	0xf444fb7af53ef413
	.xword	0x4e6e9b5adb4d1124
	.xword	0x2e169a3a101fe659
	.xword	0x7f776f9ad2f3cf14
	.xword	0xbd9134106f34ff18
	.xword	0xb3e0c5edc171cc7c
	.xword	0x4e949a44a02a836a
	.xword	0x923480d5cd9103fe
	.xword	0x5f8bd40ac2f04ce1
	.xword	0xdb96c37e0adfdc04
	.xword	0x09728cf48389ab23
	.xword	0xdf0b1382c61832b4
	.xword	0x47f4d37f6e2fe1e9
	.xword	0xb2b066ea29f81097
	.xword	0x228be4ce356f7e69
	.xword	0x0f9a2f5a00fdfabc
	.xword	0xd954997c30e16c60
	.xword	0x5dd8074be5fa78c0
	.xword	0x5e2706bf2492ee0c
	.xword	0xad9356862d37e4a0
	.xword	0x9858d26322ed8e03
	.xword	0x668233c34f30594d
	.xword	0xdcefb129c9805ce2
	.xword	0x39cb72c27a4bf88b
	.xword	0x979bb8ee8921e784
	.xword	0x77c46a258b60d3cb
	.xword	0xd0a23b5701556f63
	.xword	0xfe54910d9296a905
	.xword	0x7e51c32ab27995bb
	.xword	0xb6feeebe03246d73
	.xword	0xdf33c034d2535b75
	.xword	0x3624cc80130b822c
	.xword	0x7831f92b8b586c59
	.xword	0x6c07c87915c1f8f4
	.xword	0xeaebdb18bc51e04e
	.xword	0x91df1ffe649b8cd8
	.xword	0x5739729ac374346f
	.xword	0x50891d0c515432c6
	.xword	0x2121b26bfe524aa4
	.xword	0x57a159b2a4080ee5
	.xword	0x24ddecb9db6e977c
	.xword	0xc9e13a714d127c28
	.xword	0x7a18ea54f9d53ff7
	.xword	0x5b346f62ecd58feb
	.xword	0x65c38dfcb570a288
	.xword	0x76f5b5c7938a0442
	.xword	0x0e84b7b6a85e118a
	.xword	0xc2e68920798c0e35
	.xword	0x7b0fa0f3d44730e3
	.xword	0x35e7732c2980733d
	.xword	0x78995612d3b81a03
	.xword	0x8d4d1a1d45276d35
	.xword	0x858c5938a1fcef6e
	.xword	0x28d9bd4de0019482
	.xword	0x37d797f86a11ea02
	.xword	0x24970ad9f3013c18
	.xword	0x289d6071e6781553
	.xword	0x984c073e57e25bd0
	.xword	0x42ac0c6bd6f586be
	.xword	0x47349eba7d21b2f9
	.xword	0x5e3ffc469a13eb5a
	.xword	0xec939288b02c7b62
	.xword	0x0f1bb755d61c3b8e
	.xword	0x08e86a5241e0f11b
	.xword	0xf2d9caff0924e75e
	.xword	0x7f44c0f14051c54d
	.xword	0x878d058c63c4a4e1
	.xword	0x142b529a8c48d731
	.xword	0x94f7071654ed7b02
	.xword	0xb229c65a4ef9bdd3
	.xword	0x4f009e41224b444d
	.xword	0x3f2a8c6d0f3b2b82
	.xword	0x7bc1b0a9641eabdb
	.xword	0x9cbbc6af53e5d8e5
	.xword	0x77fd10703fb2e7b3
	.xword	0x15044bc9ffe01163
	.xword	0x46b73dea185978d8
	.xword	0x55f13cc8d7f5e600
	.xword	0x25b8f5a260afcc1b
	.xword	0x89f91f04b890e1b9
	.xword	0xc070d8baa527eb92
	.xword	0xe0a7050defa12f86
	.xword	0x734a7ed4f33e4630
	.xword	0x4e456f4f43fe1828
	.xword	0x020dcb4751afbd94
	.xword	0xcdc1e65dab8e55d0
	.xword	0x09dc70e4a5e9356c
	.xword	0x51d8c141a2fe3272
	.xword	0xc6d3c6d68b252a38
	.xword	0x6bfe086da4acb644
	.xword	0x9263d8cfff834f9e
	.xword	0x6f385929f050f44b
	.xword	0x6a16a8817ef42513
	.xword	0x04d1d8202a7f51e7
	.xword	0xde6fd1f56aa7c0f5
	.xword	0x0af87a5d78353947
	.xword	0x5e544272d435b9f9
	.xword	0xabdf539303ce6bd6
	.xword	0x09f45b0cb96f5ffe
	.xword	0xb35120b74f712976
	.xword	0xca2d33b4bc549e8e
	.xword	0xd4c9c4b201f6722e
	.xword	0xce608a226694dd56
	.xword	0x3d29c620868c56f7
	.xword	0x5e35d4820d21ddb0
	.xword	0xc7c07b035a16ecbd
	.xword	0x476bd4531de87020
	.xword	0x4ddf88137386ea63
	.xword	0x29554f87a56c6363
	.xword	0x7a61b57881f4fe2e
	.xword	0xf381b449c12b633d
	.xword	0xce0dc8dd886f7beb
	.xword	0x15f771e6bef60c53
	.xword	0x88dcd6fe2d2a5cce
	.xword	0xccc1f1c6fe41ccf9
	.xword	0xcaa4a2d8f3822ccb
	.xword	0x961791e95b580337
	.xword	0x6d7a250364bcaa2c
	.xword	0x28e52e17f795933e
	.xword	0x22a7ac60ef9b942d
	.xword	0xad9d94fae56258d1
	.xword	0x1e9338ed4c1d5639
	.xword	0x2ddd799d3cb274ef
	.xword	0x70f8b7e3cb77417c
	.xword	0xbfcd7a237d7e65b2
	.xword	0x58ecf3d3c9cdb54f
	.xword	0x70ea38ea98f67978
	.xword	0x32ff09dca93f0556
	.xword	0x43b49e1abaf53b6b
	.xword	0x6632f2f21d645c25
	.xword	0xb14d41714e83663c
	.xword	0x63ea5007c2a97c45
	.xword	0x061fc18cbfbcea84
	.xword	0xc5bf3ae7fddea5d7
	.xword	0x17fb6b0be6cb0b54
	.xword	0x25d3964b276b6538
	.xword	0x3d4d899985568dc2
	.xword	0x0d931e8dc12d1879
	.xword	0xefe6fc35d897a40e
	.xword	0xb45236b9b7bbdbed
	.xword	0x6144f83a1c36e648
	.xword	0xb797d63bee7578fb



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
	.xword	0xbafdf91c087457af
	.xword	0x9947eaf53e90eb5d
	.xword	0xa937d87858fa1bd3
	.xword	0xf296122fd592fb7f
	.xword	0x6125a5dd11f07950
	.xword	0x37b0dc57f92842f5
	.xword	0x4e3add8936aa2b0e
	.xword	0xe8431f7018b74d7e
	.xword	0xc5b7a04f3d45880c
	.xword	0xdfd17a19881d75f6
	.xword	0x40b4163d06dc03f2
	.xword	0xa8d3b749de58516b
	.xword	0xde66dca9e30c1bb8
	.xword	0xcc2c7e9f737f51b6
	.xword	0x4a83233fd7cadd9e
	.xword	0xf8bedaccae90888a
	.xword	0x2e19db52eb3beb63
	.xword	0x4a702e82b60d6da1
	.xword	0x686dc74adc3aa176
	.xword	0x2bf04b23d632a981
	.xword	0xbb68a532166912c5
	.xword	0x9d1d6da684c2ecb6
	.xword	0x182065eba286bfb8
	.xword	0x2e2b7f71a9233890
	.xword	0xf9f37e6e4018d79d
	.xword	0x9e5b18c4041530a2
	.xword	0x0b447df224258cf1
	.xword	0x3a1402a348206e8f
	.xword	0x4949bc872bad816e
	.xword	0xe8e8f6761a6a156a
	.xword	0xe16277e62e34563f
	.xword	0xa6a7c8a9f27ced44
	.xword	0xb7796eba47fcc99c
	.xword	0x9c43f8628204da89
	.xword	0x389d1023cac6abf5
	.xword	0xba18093144398c62
	.xword	0x58dd5be8d8eab868
	.xword	0xfde725076ca473e5
	.xword	0x144b743ee9598313
	.xword	0xe8555038889409cd
	.xword	0x109732e6329fd84c
	.xword	0x4545ce3ce5c8071c
	.xword	0xfc3e2b2aed45f495
	.xword	0x11abe390f2b4e4dc
	.xword	0x034032e0d267535a
	.xword	0x3a2ad280923abd88
	.xword	0x9867817c574f97c1
	.xword	0x1f81c4eb83bde262
	.xword	0x843f3770bf765882
	.xword	0x9c76f056583a4b78
	.xword	0xf4045b89cdc92596
	.xword	0x7a8540dadfa281c9
	.xword	0x2b20e7617e1979cc
	.xword	0xf582f5961155b78b
	.xword	0xc3937761e14df1b1
	.xword	0x9754517d14eb6584
	.xword	0x0e6d38c56094244c
	.xword	0x7865ef642e5a33cc
	.xword	0x9b105a146e269498
	.xword	0x9b5f502532c13003
	.xword	0xc6da714140c43ff1
	.xword	0xe0de16e05ef71155
	.xword	0xf82583e379c4dd8a
	.xword	0x13ee1011ad217c6d
	.xword	0xba15e3e4be88e8ea
	.xword	0x60fb8b85d27802c8
	.xword	0xf3f78d4c8bf51ef2
	.xword	0xcf8612a0160df472
	.xword	0x1c035312b5a6097b
	.xword	0x44e6450b67e9854b
	.xword	0x28d12ac779eb195e
	.xword	0x97522c9242a52470
	.xword	0xfe068b044f81b17f
	.xword	0xaede890b68e0bf93
	.xword	0x0b11bc8674ae0fdf
	.xword	0x5a83b38d5c8befa3
	.xword	0x8eae8db3e2fbbb94
	.xword	0xa45c9449820c3173
	.xword	0x03b62b71c81d2598
	.xword	0x4d94fc1b7426a21b
	.xword	0xd2ba74289b42977b
	.xword	0x290928193b7655c4
	.xword	0xc29088281e205f8e
	.xword	0x369835f01fbe7604
	.xword	0x4e7b8d25eeb38ba7
	.xword	0x3ef05470ad3064b2
	.xword	0x1f1c6dd167ea02d5
	.xword	0x15b2f85d33ea68da
	.xword	0x01f530b6db6349ca
	.xword	0x385f173d6614643e
	.xword	0xad2ee3822b7441b9
	.xword	0x5814bc068434f6ad
	.xword	0x885cac069e4fa88d
	.xword	0x288eeac275cd751c
	.xword	0x824445a256d216f1
	.xword	0x097b63f00222008c
	.xword	0x540fc1b8b12856be
	.xword	0x406afe6f3536d56b
	.xword	0x6f7c9a4899603702
	.xword	0x53798c8884249ca1
	.xword	0xbbae79c813fe4828
	.xword	0x05334b08a4c96f42
	.xword	0x4f331b25f4d6544f
	.xword	0xdd655114d57b1236
	.xword	0x3a3b1c41ec4a113a
	.xword	0x9e826a8ecbed2011
	.xword	0xe5654b701355fa23
	.xword	0x517f0a28ffab54b9
	.xword	0xad127ba169024dcf
	.xword	0xbf512b77a0ba2c9e
	.xword	0x190914663be8a2b1
	.xword	0x35e3a93d07495c7d
	.xword	0x5f6a86988219d5f4
	.xword	0x4d7b3ec9a59e4df8
	.xword	0xd6be95532849772e
	.xword	0x95847a2d06be2af9
	.xword	0x5ca3663a59c007c0
	.xword	0xea63875dd4218ef4
	.xword	0xc3776d55dbbf28d0
	.xword	0x16ffb190c61f09c5
	.xword	0x00c3623bc717632a
	.xword	0xa0eea8513120b731
	.xword	0xa1d80c37c1a4a670
	.xword	0x8fe02bc5fa3ba1e4
	.xword	0x3cfa8d15df5e0625
	.xword	0x9138e847fd4e00a9
	.xword	0x0976b2306eff1393
	.xword	0xbf8e770625d6eb62
	.xword	0x51d54614ff6c4d87
	.xword	0xd4cf999bf093f8dc
	.xword	0x00bb76198005eb49
	.xword	0x6132d30c8435315e
	.xword	0x807dd444399ac1ce
	.xword	0x1017c2f861ef0012
	.xword	0xe06e3b699a3abe7b
	.xword	0xd84d8d42f882a0b5
	.xword	0xd69acfa6c7253eb8
	.xword	0x0d8b9977f6110d45
	.xword	0xa43327bb1a26a1ba
	.xword	0x59bd2932d89eb3e1
	.xword	0xefbc6c5b44c6089d
	.xword	0x5766d17f0abd4e73
	.xword	0xe8318c8b09398278
	.xword	0xc1365cde47ddb0c6
	.xword	0xf4dac2d879fdbc95
	.xword	0x810d7f8c2f2d0d49
	.xword	0x6e34da23170e4c6d
	.xword	0x60f63e010b3d0e47
	.xword	0x930718e4311c6abe
	.xword	0xe85cb4dca9b54ad0
	.xword	0x0a5f4e006f0245eb
	.xword	0x310f2e5ab99d28f1
	.xword	0xe9ba1cf504da2a23
	.xword	0x1aa6ce115320409f
	.xword	0xbc4a0896cc53a7b2
	.xword	0x81517f6ec62c77ed
	.xword	0xd303df8761d5f8b9
	.xword	0xcd779b45c7139a76
	.xword	0xd20ca0826c65db1b
	.xword	0x2c82f15ed9c6e2a8
	.xword	0xb2ad70121678fbf5
	.xword	0x347628b2e91c3121
	.xword	0x883123422cf8e6bb
	.xword	0x8a1b313752df6aa4
	.xword	0xfcdceec6d3e9c1c5
	.xword	0xd0b2ac3cf1908fe6
	.xword	0x7b0dc578b8a28fdf
	.xword	0x8f944f4d9301ec46
	.xword	0x05d1e2c7c2cfcdc7
	.xword	0x3cf37e4654f332db
	.xword	0x71374f12ff867d00
	.xword	0x4cedee18b695f79a
	.xword	0xd03d3c1f5f9e8b30
	.xword	0xfc4168f3d5174d80
	.xword	0x2d79bf1c008fba02
	.xword	0x72c51f1b5a5d0272
	.xword	0x4ecac1f8acc40b2c
	.xword	0x203ef8c7e031cddf
	.xword	0xe852b45bc1ae8f59
	.xword	0x82254aa948e69378
	.xword	0xaa81375f1a275a86
	.xword	0xd51b05c56ae923c1
	.xword	0xef1937b0677efaf1
	.xword	0x6e8e0cd80214585e
	.xword	0x42d7a196a854adfe
	.xword	0x7c712e2440d60564
	.xword	0xddc6653b20b69965
	.xword	0x291ab6b608b93a6c
	.xword	0x6c46a896342bc6e4
	.xword	0x9bcac66d714c17f7
	.xword	0x83e777e776e688db
	.xword	0xcaf20954009d8fd7
	.xword	0x26a42b6f4119d1ba
	.xword	0x49aa60c6e36508c4
	.xword	0x7302f4c3bd31ea0e
	.xword	0x4f4dba3cefc30341
	.xword	0x4fb79b7d33123e49
	.xword	0xf77cb45d13a8c8eb
	.xword	0x313869022976753b
	.xword	0x1f136fa41b708588
	.xword	0xa424666055e99c63
	.xword	0xcf261a70d5f03330
	.xword	0x56616698ad39e6b3
	.xword	0x815a4cd43f34acc2
	.xword	0x77a17cea98befaee
	.xword	0x8bff90442593ddfe
	.xword	0xb84fafc73ee33ed5
	.xword	0xb95e4551a2994090
	.xword	0x2acdbffbbe116348
	.xword	0xc5f77714ca00e712
	.xword	0x8ededc9282885b55
	.xword	0x7c13d86364aabacb
	.xword	0xb8cb67358e764e8c
	.xword	0xa0125d61bfcb3172
	.xword	0x61cf5ba53b2f6b34
	.xword	0x7e2073c359b338fa
	.xword	0x9394743963487afa
	.xword	0x33cfb413a4f70020
	.xword	0xc643254dd975460a
	.xword	0x65bcce26f6e6950f
	.xword	0x0993b900f1b1a6ce
	.xword	0x28cc3c307dd409b2
	.xword	0x577557df4290f77f
	.xword	0xe018c8fee935213d
	.xword	0xefaacfdc87c91544
	.xword	0xcb487a89faad1cc3
	.xword	0xc2f58bd783317660
	.xword	0x0e5591a88492c291
	.xword	0xc13a2eedee013324
	.xword	0xb8e9247913361eba
	.xword	0x33be45d0f6b8afbd
	.xword	0x0c3b03e0e9f0dd35
	.xword	0x0dea31a76286ca41
	.xword	0xc8e12eb4f39154c8
	.xword	0xf48354d4a4fbeb3c
	.xword	0x3ed178b3723f16bd
	.xword	0xc081e7d18fac2dce
	.xword	0x7b84e4ba583eb551
	.xword	0x3f04846813207fa8
	.xword	0x330b4f8d153ecb7d
	.xword	0x1d0ddca2f86b4bc7
	.xword	0x1f26b679f026f797
	.xword	0x8304dc12bee7186e
	.xword	0x2e08602137a88bf1
	.xword	0x027079c8b12b459f
	.xword	0xa2571b8fb5e80b52
	.xword	0xb4680e0dc74b2a0a
	.xword	0x610f1abbb65b630b
	.xword	0x45a0b87690f40b65
	.xword	0xad9920c6c48befc6
	.xword	0xe75ed334901c5c2b
	.xword	0x2e562e8b80683309
	.xword	0xb650abec40373241
	.xword	0x7c091ec37aa666f3
	.xword	0x0e3f1eb7e9ec12c3
	.xword	0xbffa0726de27e0d4



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
	.xword	0x5bbd701fcfe40c9d
	.xword	0x6bec58557754e766
	.xword	0xea15b68fde30f1a3
	.xword	0x8ab8663a222d496c
	.xword	0xb8c77cb278792e29
	.xword	0xb2b3d7d1d22537a1
	.xword	0x6ab330f3cbb10fad
	.xword	0x3bad3dfbf68a28b8
	.xword	0x8827ed6b8f6ba01e
	.xword	0x67b89c079867d8ce
	.xword	0xf2dbc2a8e89544d7
	.xword	0x491f5edbdd2ff896
	.xword	0x4c0b2949d3b942f5
	.xword	0x60978f99e84e32c5
	.xword	0x5f876eabda50d73d
	.xword	0x337455f4084d1788
	.xword	0xfd2576372a527b85
	.xword	0xe3d237c3b7bba8b6
	.xword	0xdbfe3ae11f7ca16a
	.xword	0xe943c426fb382c2e
	.xword	0x7ef098c5ea5c6073
	.xword	0x128be2aacf3305ce
	.xword	0x5523af08cbf7335f
	.xword	0xe38070103ce07685
	.xword	0xb8f27f5302fefd9e
	.xword	0xc17a0e4615112619
	.xword	0x40824a2521874758
	.xword	0xb44b08ee79822afc
	.xword	0x788c9fd25e49a377
	.xword	0xc6965013bbf1a5a5
	.xword	0xa45a6e1bf50724f6
	.xword	0x21628e89ba621701
	.xword	0x09fd72ca23cc961f
	.xword	0x399add90863d6762
	.xword	0xd64d2d63ec73729d
	.xword	0x3bb0612be9dcc9d4
	.xword	0x22623c38bca410ac
	.xword	0x0ac555161cabc50f
	.xword	0x98a8d5769464457c
	.xword	0x62f45a563300c10f
	.xword	0xea77a0f06869cf83
	.xword	0xcbb82b8a6c92f4a4
	.xword	0x90fa77fdc5805bac
	.xword	0x96ffc1206669130b
	.xword	0x02e9e29960e68c7c
	.xword	0xa09934ab2b7c37bd
	.xword	0xcd0987256532dcd4
	.xword	0xbb0f3f5d604ff34c
	.xword	0x49ddc0a6f8fc6b5b
	.xword	0x2fef0434087d5b06
	.xword	0xd071a70fee88ac4d
	.xword	0x759f933944c2543a
	.xword	0x0e4ace527c7600eb
	.xword	0x8bc97ee649820ab1
	.xword	0xd837c0874e13dd8b
	.xword	0x538c3ea6c476616a
	.xword	0xfb5401aa8a618956
	.xword	0xc484ad186410e68a
	.xword	0x5f15c011326b9885
	.xword	0xccbad685030d6c9d
	.xword	0xb22bf91d0888ec99
	.xword	0xed9c3c7d6b43bb07
	.xword	0xa0847fa54e62e28a
	.xword	0x3eb5d93bc471f442
	.xword	0x0a27215f2f6c3aba
	.xword	0x2aca64c8d735f8a9
	.xword	0x1e207b05acf7b1e2
	.xword	0x39f1295578460576
	.xword	0x7f89392afd8a75fc
	.xword	0x1bf7c62762c9f61e
	.xword	0x9166cbd717554543
	.xword	0xbfafb3914c7572b2
	.xword	0xf289f69b46ce469a
	.xword	0xf29c3c8aaa768751
	.xword	0xb78afe99c081e273
	.xword	0xcd872c915d8c2656
	.xword	0x75b03be9028b3aba
	.xword	0x2cd61bbfcc6671f2
	.xword	0x5eaa6feaab70be78
	.xword	0x587d022d457df929
	.xword	0xa64a90220535d5fb
	.xword	0xa7796246daac5627
	.xword	0xd7ef9af3375b2088
	.xword	0x74e9e30506934d22
	.xword	0xe302a83bbfa2bafd
	.xword	0x050e4feb0609c780
	.xword	0x7af88ca718970d16
	.xword	0x6e95ad50eb2e9aec
	.xword	0x3b6ad8186a7d953f
	.xword	0xa9a932a6b74dd4cf
	.xword	0x5d465b3a2459c7e1
	.xword	0x86d8d2ea51315fac
	.xword	0xf066188ac8a19e31
	.xword	0x1df683ee3fb71cf9
	.xword	0xf252844ef83cd69f
	.xword	0x94a4dd7dc1ada785
	.xword	0x0c08567acc9606eb
	.xword	0x48fa74a44af4cf26
	.xword	0xfc19a93f0bcb41fa
	.xword	0x2f1cdbefbad7e704
	.xword	0xba85f90b48574246
	.xword	0xe3c4c2652a840863
	.xword	0x8144fd41035938e5
	.xword	0x180c146bca55eb9c
	.xword	0xcc20daa26d3a783a
	.xword	0xadcdcc66d8d1ba9e
	.xword	0xf673c154810ccd66
	.xword	0x491f6c676068724b
	.xword	0x501bd63eb9851cce
	.xword	0x02e4acfebed6cd21
	.xword	0x90ed3a668bf2f30c
	.xword	0x32e935612da794d9
	.xword	0x40f06d4ed44ff28e
	.xword	0x2136905f2dd98650
	.xword	0x506bc85d2604acdb
	.xword	0x54c3dce00bc941aa
	.xword	0x63c4224496cc38ac
	.xword	0x1c4941385dd45deb
	.xword	0x0043cc405da88379
	.xword	0xea03397d4557d45a
	.xword	0x545e954715550a00
	.xword	0x6efc4fc27868eef5
	.xword	0xd46d940f52ea2f68
	.xword	0x9fe0fd1d96a030fd
	.xword	0x007f24c1ebe901a8
	.xword	0xe7ce74cd4bb043ed
	.xword	0x4afbbb5fc82be790
	.xword	0x7ed09a534e66bb5a
	.xword	0x443df077f8b9beec
	.xword	0xf496745107e1a88c
	.xword	0xd2971bcd0e681af0
	.xword	0x08328faf169d3642
	.xword	0x7d1ce2f87597dfb3
	.xword	0xae9e1a3521ed47b4
	.xword	0x0f96c98752a1b030
	.xword	0x386e255db723a900
	.xword	0xd87628563ed6df06
	.xword	0x6b68afc3e5349b36
	.xword	0x61a07bbb0f3f067a
	.xword	0x9843e1882d968d00
	.xword	0x8f9cbb2add1600f9
	.xword	0xf505e195814a6f43
	.xword	0x794f40c0bac7ad32
	.xword	0x4ad8ea7b7c094a74
	.xword	0x6912a459432b5425
	.xword	0x348ebf90d41b43e0
	.xword	0x9ddbc881032ad3eb
	.xword	0x5e230e736898af9f
	.xword	0x1bc0630ea15d790d
	.xword	0x559f11c320dab37d
	.xword	0x59684294050103e0
	.xword	0x509e0f98b029c686
	.xword	0x3c18616f329199c9
	.xword	0xf27725f8a3f0d324
	.xword	0x40b628d6895c662e
	.xword	0x35be9fb58a355375
	.xword	0xa09605ed938dd9b2
	.xword	0x2bdb7834b9f2d45d
	.xword	0xdfd7c11716db1a65
	.xword	0x8fe40ca0eb43a0d5
	.xword	0x6b56747ff10d52bd
	.xword	0xa0f88388fb192bdc
	.xword	0xbb07ad1159db22aa
	.xword	0x1913e0f854bc731d
	.xword	0xf80371513383ac39
	.xword	0x1819e825651f4a88
	.xword	0x32c12d0364800214
	.xword	0x85b7511bbdc90f49
	.xword	0x61cef57db0e15024
	.xword	0x6a233b9227457e4d
	.xword	0x5feb6fba2232ae91
	.xword	0xbadd8b4a816ca278
	.xword	0x5186fdd223a6f2de
	.xword	0x427584d6b2c7c749
	.xword	0x385113539677d498
	.xword	0xf885926f279fd159
	.xword	0x6b3134c98804e157
	.xword	0x95bebc043ea93175
	.xword	0x79b73bb96fab1b86
	.xword	0xcf6dd87a6283900a
	.xword	0xb799709057f45c71
	.xword	0xbbbc92e0e16bc7f1
	.xword	0x99d400d0406ac6a9
	.xword	0x6ba2717c49ec3042
	.xword	0x9fb44eb175a6a319
	.xword	0x034eee8b1b5ad6f2
	.xword	0x26d16250462cf727
	.xword	0x52eea73d9334aadc
	.xword	0x72dbed598084d452
	.xword	0x39a9dc873c43fa22
	.xword	0x0b95fe26d9e55e41
	.xword	0xa40b1f995c14d0f4
	.xword	0x52bbc20fa9afe886
	.xword	0x42ea592619b36ece
	.xword	0xa8c84d25a18880a7
	.xword	0x7bfe431115cae6f3
	.xword	0xb986a785cfcd4943
	.xword	0xb441d70788aa7ac5
	.xword	0x06e6077265346c4b
	.xword	0x6a79b37bc93d443a
	.xword	0x5453ed7200d79ef7
	.xword	0xef5b039829993906
	.xword	0x1987c4719690fa3e
	.xword	0x46204f0290786e12
	.xword	0x10f37b24eb9f6b92
	.xword	0x7a30997caed47508
	.xword	0xf6803fbea7843e2a
	.xword	0x9658e3079d651dec
	.xword	0x87261a7a49634c45
	.xword	0x07b3c0b33d95152d
	.xword	0x2fad587b0c81d17a
	.xword	0x1669db02de6a922c
	.xword	0xe1bb140bf30607d1
	.xword	0xdd16ebef84900336
	.xword	0x60e303c81a038adc
	.xword	0x4b9d7c60e321b6e0
	.xword	0x3c681dd9254dfd65
	.xword	0xdd451afb2fbd7b78
	.xword	0xb3da003ff48f5a46
	.xword	0xd83b49fcbc4a303a
	.xword	0xf7b70f0996bd6c78
	.xword	0xe589a15dc34ee07a
	.xword	0x89a96f3e0e94e551
	.xword	0xfa4ecff10dad64d4
	.xword	0x88f743e66bb669e7
	.xword	0xb781332cc91d2d6d
	.xword	0x5e46ebacfb522090
	.xword	0x579654be4738de22
	.xword	0x268f93328a61c678
	.xword	0xab15e2507c1e1663
	.xword	0x9fa326f131eb6904
	.xword	0x22f8868882f3f15f
	.xword	0x590d7de313405f3b
	.xword	0x21908c2cf5585b26
	.xword	0x3c5a2a94a56afb78
	.xword	0x18b3f8e773caccee
	.xword	0x56a5b63fba8c24a4
	.xword	0x8f83d1ec02b5c6a0
	.xword	0x3d1c07178ee0fedc
	.xword	0x61f43271513337d7
	.xword	0x2d9ed54734c86b51
	.xword	0x5e1d0dd93e7bf200
	.xword	0x5782e229b7c4d06a
	.xword	0xdbaee23f3df3f820
	.xword	0x9d7f24f4cbc98d20
	.xword	0x33bf87072ecacf2b
	.xword	0x8115cb9cfb49b545
	.xword	0xe60fee30f23e16d6
	.xword	0x93a559a20349c94a
	.xword	0xd77c7c006215f7e1
	.xword	0x4cadfb6ac688eea6
	.xword	0x6d73787faf72b257
	.xword	0x75811ee424cbe188
	.xword	0xdda479bfcc36b985
	.xword	0x687ea11689b833ab
	.xword	0x6d7b49d8ab4d4464



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
	.xword	0x1f8c3510b289fc81
	.xword	0xf71560120d8ff493
	.xword	0xf2eb457917a4a54c
	.xword	0x1b1e28a4a8f1bc2c
	.xword	0xa38fe52ce86b6529
	.xword	0x552701d5071927bb
	.xword	0xfcd69e20a7525da9
	.xword	0x7f8542dabc38ad92
	.xword	0x543fd36a55385343
	.xword	0xb2e8794ccbed54c3
	.xword	0x82be3fa74baea9b7
	.xword	0xeec10c7adfb7a59d
	.xword	0x2997471a9836f083
	.xword	0x025611238711b375
	.xword	0x3d7d11be0b8f68d7
	.xword	0xc807e6cfa5e99cde
	.xword	0xf404aa40b6af3677
	.xword	0x8d1e1e5840237dc2
	.xword	0xab22ceb60295aa0d
	.xword	0x27960c6b8cbdd8eb
	.xword	0x4fd7a292e7809117
	.xword	0xe0f0fd43ecf43479
	.xword	0x1ef235bae6713738
	.xword	0x613094c89a9f784d
	.xword	0xd291c7ec26fa4d51
	.xword	0xb75c39edbf7c2898
	.xword	0xe82a04cf2138280c
	.xword	0x9ccd0574e68a9c82
	.xword	0xafb4dd3eacd6b24f
	.xword	0x8736c35b2dadfa63
	.xword	0x35ac20c1298707aa
	.xword	0xef37839b6071b167
	.xword	0x763cf8aa67e06086
	.xword	0x424264eb071578b2
	.xword	0x6e64ea96c535e49d
	.xword	0x3d01d867bbf54760
	.xword	0x15039558178a5a47
	.xword	0x23672c919c3b0323
	.xword	0xe1ddda804524ac5b
	.xword	0xe963e9c4569762d2
	.xword	0x2bc9dfe2e2000fae
	.xword	0x4fe48e87093685ab
	.xword	0x60ba0de217db024c
	.xword	0x17550125c5b61f0d
	.xword	0xbfbd9f51304c1ba5
	.xword	0xa8970a52e95a4f8e
	.xword	0xe0b0b7c8f77fd2cb
	.xword	0x060c2e2988d92e50
	.xword	0xa3fae4759b3f4d95
	.xword	0x6aa9c2f9747220a3
	.xword	0x46e42e5c7095506d
	.xword	0x6b940e0bd8830c36
	.xword	0x5260f68b81586847
	.xword	0xc826cdfd6f797cf9
	.xword	0x9926e84c70019b71
	.xword	0xfe3b2fdf02c9e053
	.xword	0xd4c3fc6a332996a1
	.xword	0x318be55ec5088b56
	.xword	0xc66b2dbc586a9a47
	.xword	0x68882002b2ed3bec
	.xword	0xf436480d897c3bf2
	.xword	0x1ae307aec8e80894
	.xword	0xdeb9a776c38c0a68
	.xword	0xa1631e888dfed46a
	.xword	0x3bf6c42483fb260c
	.xword	0xaa8fffe1ead50889
	.xword	0xaa9fdb51db1572c7
	.xword	0xcb0495a5ecceb86e
	.xword	0x96af501892b8540c
	.xword	0xc6dbf12f8793d314
	.xword	0xc5ef4ee6723f00d3
	.xword	0x9f6c3c82e979e6cd
	.xword	0xd116294577566849
	.xword	0xe506719b444f4afc
	.xword	0x1f10566e29faaadc
	.xword	0xae5a35b75719f822
	.xword	0x8fe4c9bba7e4e922
	.xword	0x2316c410393d0753
	.xword	0xc9069f40b37c662c
	.xword	0x8460d71ead037ad1
	.xword	0xa16b1301d04e0ac4
	.xword	0x01ed33f5969721be
	.xword	0xcb0b02b051a8c5d3
	.xword	0x62c9c9ee1b4de73f
	.xword	0x79dcaee9a7c40254
	.xword	0x2e2e044a29721e53
	.xword	0x78088b96f45fe8bb
	.xword	0x280a81b375aebeaf
	.xword	0x0c286763c9d96997
	.xword	0xf639c7bdfb5ab337
	.xword	0xaa7bebc169bc1bdb
	.xword	0x35f10f36511903ec
	.xword	0xbd7ebd3e75938573
	.xword	0x5c4414398016fecf
	.xword	0x2f8d53c03fdd32e7
	.xword	0x5b6c25f0025f751a
	.xword	0x7a7007bcfff7654a
	.xword	0x1fec4bf8d9b001af
	.xword	0x4e709c3605daf688
	.xword	0xf2749bd307440be6
	.xword	0xe9e043b6fc836e94
	.xword	0xa7d89c07886a88e2
	.xword	0x7c73e3855177d3d6
	.xword	0xc9c24f461f3f7a0c
	.xword	0xda75cb0e2cb28c5c
	.xword	0x210ed0d1ddcff07c
	.xword	0xaf99d955869c653e
	.xword	0xc47d3f6c26488596
	.xword	0x59e883367ca5eff4
	.xword	0xf19c2f76bf0b8c85
	.xword	0xf41a794fa517f097
	.xword	0xeec942431bf34f67
	.xword	0x202f3830cb8e4488
	.xword	0x1a71e990bdc3d8dc
	.xword	0x6e259547fdd12091
	.xword	0xddfa56bf69f3f0ae
	.xword	0x0fe852420c80246b
	.xword	0x48b039bf933b6fb7
	.xword	0x68db6997e7ae96e9
	.xword	0xf890722b86cabace
	.xword	0x9641123b6851716e
	.xword	0xff7896bb8d658d6a
	.xword	0x873e39a17addae2d
	.xword	0xb4d877cd775b138c
	.xword	0xba5623b77b13ae5a
	.xword	0x907ac723cf751bd7
	.xword	0xa7d91edc83370f23
	.xword	0xf15101c22a212a03
	.xword	0xd9f1137309b786c8
	.xword	0xf3fe1c87b4891cd6
	.xword	0x1eb708aa7bfd9ee2
	.xword	0xd1ee76de119d50a6
	.xword	0xe91215d5f72ea172
	.xword	0x6f9818131d1fa0fc
	.xword	0xaadb4fa61fc19157
	.xword	0xd222a1eba2847ee7
	.xword	0xe858584d18a3bf9a
	.xword	0x75208447db579ea9
	.xword	0x94c51233225a981c
	.xword	0xa0040d36d9bca7a8
	.xword	0xc302ea5b84d91b17
	.xword	0x73fc550466d98021
	.xword	0x85b31988d3b270f1
	.xword	0xf644f80a1459bc6d
	.xword	0xb12c808536fe9bba
	.xword	0xf510fb2f67d40901
	.xword	0x2e2ebb03e8858dbd
	.xword	0x1c59998b64ce9ea5
	.xword	0x0445f892638315eb
	.xword	0xbc502d2ff50cb979
	.xword	0x6a8185f91d1e5c33
	.xword	0x2e6e6f7c12a40590
	.xword	0x65a933b7fb87f758
	.xword	0x6ea365d247d8f626
	.xword	0x991b134c0a19a610
	.xword	0xe2aee516a43d2078
	.xword	0x6a262b6035feda11
	.xword	0x3d5829f91b806a01
	.xword	0xe2bf21ec4643ee67
	.xword	0x8c7826ea84be47bc
	.xword	0x3cd12c0f63a689de
	.xword	0x76c81eca7ef44f4b
	.xword	0x2b3f790fcd83ceee
	.xword	0x2df3273be24aeac2
	.xword	0x28c7e824e0230d51
	.xword	0x5ba8c621428a938d
	.xword	0xbd1570754c00fb61
	.xword	0x7bd0bc7913c4ff72
	.xword	0x01dcc896f156593c
	.xword	0xa222fecc43ca8960
	.xword	0x62007811f59f4c13
	.xword	0x38ecb5dd56eb5d8f
	.xword	0x84164754bac4392b
	.xword	0x5aa89827b0a677d1
	.xword	0x39efe42c29a8565a
	.xword	0xab5f1ecf6a18cf49
	.xword	0x849d878ef3ab64ac
	.xword	0x1b2dc0cb32bf5530
	.xword	0x3b34624e7ce1e6b2
	.xword	0xb74bdf7b3461bdaa
	.xword	0xb0076ebe3280a28a
	.xword	0x7dcfa18fb5f596f7
	.xword	0x4ba8d6dd654e6363
	.xword	0xdf98e733455650b6
	.xword	0x003c915da7973462
	.xword	0x4fee0761c31db522
	.xword	0xbffb9da5f95d4684
	.xword	0x1f549d2f1fe1cfab
	.xword	0xdb281c7bd34903a8
	.xword	0xa4157ac70bd8bf1d
	.xword	0x9fc15ca48e281ec5
	.xword	0xa972fdd21e4c14d8
	.xword	0x160b7271160a9f6e
	.xword	0x3c6353cf9c9949ae
	.xword	0xe4b7368415b17b69
	.xword	0xba6d2f036b631ef2
	.xword	0x1d4f8a4712b84429
	.xword	0x5cc4768b10999ccd
	.xword	0x064a2516236abf92
	.xword	0xfe7ef5a9b7f5508c
	.xword	0x79b14188967aa4a5
	.xword	0x8c55ed25cc6b1e20
	.xword	0x2804131286bb1f9b
	.xword	0x322b2f3947af98af
	.xword	0x5a78d2372255c5d4
	.xword	0x2b23cf9a26606fa2
	.xword	0x94f78d3a869597da
	.xword	0xffdc0998f08a6be3
	.xword	0x7240f1198a93f600
	.xword	0x3df279193fa5ce34
	.xword	0xc37350d75612d5ee
	.xword	0x31fa716df621f53a
	.xword	0xce3076e8d3e2882b
	.xword	0xac4162eae12b5f07
	.xword	0x8116f92fa7e89c1a
	.xword	0xe83362a8efea8d95
	.xword	0xd21239085cf7a1f5
	.xword	0x0d5e9c244d084cec
	.xword	0x9f3f8c045b286f4c
	.xword	0xf7e8be9005cfd590
	.xword	0xd9ea1c6d3207092f
	.xword	0x03a8431b858ea537
	.xword	0x0f75203d9d714af4
	.xword	0xf434d2e9e3e6cc0a
	.xword	0x4fb687d734704ddd
	.xword	0x3c8f7eb3e843a380
	.xword	0x9169b80fb8ac8dd0
	.xword	0x398f30a068433cb1
	.xword	0x28210c8eb850337c
	.xword	0x2c6e82cc04ebccb2
	.xword	0x9e88ebf49dc805eb
	.xword	0xca8105b06578e201
	.xword	0x70175e27d20325b1
	.xword	0x621002a52c30323b
	.xword	0x71e9a218422ce6f1
	.xword	0x9ab23873ccb8948f
	.xword	0x513aa6af12c0c005
	.xword	0xcab6fa139e83e3e8
	.xword	0x1080eeae84989694
	.xword	0xf136dacc220797fb
	.xword	0x405167a5738a86f8
	.xword	0x83ee7bbf3e57e292
	.xword	0xff462f2ae683a955
	.xword	0xd8ecc9c2236dca35
	.xword	0x94b02ed78afefc04
	.xword	0x712b491254387ea3
	.xword	0x5a42c45f34201ff2
	.xword	0x25bf529295d4bb25
	.xword	0x68dd8f8b3ab03a13
	.xword	0x77ba3c992ec0664f
	.xword	0x77a782e8f8045e88
	.xword	0x756ad5677e22618e
	.xword	0xf112d5b331264b75
	.xword	0x2e0d96dea9cd068f
	.xword	0x31ec17fc28ecc19f
	.xword	0x9197dc3c53627a1e



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
	.xword	0xd8a2e9588ef960b5
	.xword	0xa4e70a222951ca61
	.xword	0xcad18039fadcda6b
	.xword	0x5a4597dc225afc9b
	.xword	0x61c00b5921fdb3e8
	.xword	0x77f090314a27604d
	.xword	0xa43b1548ece6703e
	.xword	0x703427632ba6eee1
	.xword	0x9e7dc08df9c473d2
	.xword	0xd4af9d7d8108e572
	.xword	0x3e1f6a4d8f86ed00
	.xword	0x62ab0df70cf48a95
	.xword	0x834fef6f23f91745
	.xword	0xb75a57fc9f6c854e
	.xword	0xb2e3ca021c98cda3
	.xword	0x4ccf67da0ec64661
	.xword	0x6622197c7ffeac77
	.xword	0x269cf681f7ade3bc
	.xword	0x7932072a790a685e
	.xword	0x6febf38cac46b5aa
	.xword	0x699bcfc91435ffae
	.xword	0x4357ec9a500a641c
	.xword	0xb155db49daa1007d
	.xword	0x5d539a84232322ba
	.xword	0x250adc3771df7881
	.xword	0xbb8872a76d3a1e5d
	.xword	0xf32ed477e7615194
	.xword	0x9a0a9cb15ff7ffcb
	.xword	0x86afea4c7f05767b
	.xword	0x180ba06cbf5f6654
	.xword	0x05114ca0793f8b31
	.xword	0x470995d0089a3da6
	.xword	0xd42fdd4c7a8b28d3
	.xword	0x35e3418d01db2e58
	.xword	0x19c4656213a4802c
	.xword	0xaabc3d24301b3684
	.xword	0x26d26863fa383975
	.xword	0xfe9918eaa590faa5
	.xword	0x219c7068720307cf
	.xword	0x56401d1755548a50
	.xword	0xf401b388f527c988
	.xword	0xe18fb25588dc24bc
	.xword	0x199404ee484e9346
	.xword	0xb1a392079d58c577
	.xword	0x643879a93ff5d1e8
	.xword	0xd02701560c5e559b
	.xword	0x6b4138d07c338a0f
	.xword	0xac40b2c7cd658c55
	.xword	0xffde7f55e5847ec8
	.xword	0x3f176babaf1be0eb
	.xword	0xb03912caa13fdb24
	.xword	0x083a7c793c0ba2d2
	.xword	0x2af68b9e39e234b7
	.xword	0x3bc713a681665cda
	.xword	0xd6989e7ca583a2ab
	.xword	0x47b15952335efaee
	.xword	0xd7faa99f5eaa6a94
	.xword	0x4adba15607f37dbc
	.xword	0x9b22732bf5135bab
	.xword	0x52ba5b3314d38014
	.xword	0xecc6b6cf4928afb9
	.xword	0x182b23365db43c2c
	.xword	0xfeb13117f79da0e7
	.xword	0xdfac8fec056b2c0d
	.xword	0x1ea532225583cad1
	.xword	0xd37830a846cb5381
	.xword	0x2dbf844768819d30
	.xword	0xf5688e7e0b363047
	.xword	0x2fbcf5bc0a38d4eb
	.xword	0x8f30537a02cf8b17
	.xword	0xd07424033a99f511
	.xword	0x164083864810f9dd
	.xword	0x7971ecf7a85df6dc
	.xword	0x2faa5499a95d8b27
	.xword	0xb2ea04044abf3a70
	.xword	0xfe6b27577ae76b33
	.xword	0x702ed1fd50adbdd8
	.xword	0x62d1ae6bd9d659fa
	.xword	0x32687a9312059120
	.xword	0xfe3b2114e958190e
	.xword	0x635645a2bb86df0f
	.xword	0x2b69520f512da782
	.xword	0xd9f93f52e303fd9f
	.xword	0x0b04c9ec0367cc29
	.xword	0x22e09b078203ebf9
	.xword	0x9bc0f3e392fcfdca
	.xword	0x1c9f16a99aa5d1c2
	.xword	0x8bcd75d1e459e546
	.xword	0x202adda8b9e91cc7
	.xword	0x4baf6880c18ac094
	.xword	0xbd39f59754cbe651
	.xword	0xdd27ada17b3277dc
	.xword	0x0e231d33e2b535c8
	.xword	0x0b9b127f079cb45e
	.xword	0xd9d051ba002a3621
	.xword	0xbdd48967a469ab5c
	.xword	0x7b6bc64832ca89f9
	.xword	0xb63858d5efb53d37
	.xword	0xc6d8766acd8fa3bf
	.xword	0xb120cbc42e30a301
	.xword	0x56c783831fed986c
	.xword	0x757df54de97c9d12
	.xword	0x4e7780553fbb8e95
	.xword	0x5eac3baba04e2fad
	.xword	0x543a675a8f83124b
	.xword	0xeb0562d6fb6d1237
	.xword	0xb963c221f3d7f044
	.xword	0xb617c55e5df45f66
	.xword	0x028412ddebcf08c2
	.xword	0x64126e626d33779f
	.xword	0x3318abbb5d24e58f
	.xword	0x4b25b76cddfbf44d
	.xword	0x6c313c62bcc1c289
	.xword	0xeede791febc0f450
	.xword	0x8c868478008b4fc1
	.xword	0xf86c588576dd6d6b
	.xword	0x01a1272389673ff1
	.xword	0x0a418021f9bb505d
	.xword	0xaa9f67294566facb
	.xword	0xd712f56528c7f8e0
	.xword	0xbe07c1f9f9fbbece
	.xword	0x630e2c2a8bde00c9
	.xword	0x3ed7469bcf24a033
	.xword	0xacf58cf5745c37bf
	.xword	0x0d1da82559d7a7a8
	.xword	0x4bd6037f582811bd
	.xword	0xd27397c37ef2a472
	.xword	0x1835041a7bb9bfed
	.xword	0x2476be1ea09e7028
	.xword	0x5c02e66d0b5d0254
	.xword	0xd161a86d88658aeb
	.xword	0xb75c14008471c34f
	.xword	0x15432202622fd89e
	.xword	0xa34612863130f73e
	.xword	0xa6caec01f69aebaa
	.xword	0xfdb8f6b07f52f116
	.xword	0x85824a3c7f24d4e0
	.xword	0x1219d9c5f2cfb681
	.xword	0x38feb3ffea6c7bc4
	.xword	0x844e56ef79b171b0
	.xword	0x936ce252b47b62d1
	.xword	0xbb0ed82a134491b6
	.xword	0xa853a4f6ce7c8f73
	.xword	0xf7ce692a4004e829
	.xword	0x92510d825fe08643
	.xword	0x4a4ce784988df359
	.xword	0x472e22e10651eed5
	.xword	0xb656cb7b2769184a
	.xword	0xcf6f96e239d1e60d
	.xword	0x168e63893a2f4609
	.xword	0x19d32eeacacf6a89
	.xword	0x1d3a6a446f5d2659
	.xword	0xae7a799e50cc7f7e
	.xword	0xaeb863bd96d4c781
	.xword	0x190f45ddf516a6a0
	.xword	0xe5501ace22ad913a
	.xword	0x9d0582fc16b58557
	.xword	0xf72a541dbd67dddf
	.xword	0x7235484629f825b1
	.xword	0xaf694d3f174246b5
	.xword	0xf6809fbada7d16a4
	.xword	0x8ad70814c4b3ec58
	.xword	0x75376f91a25885e3
	.xword	0x9e420a97ac66d5db
	.xword	0xc9d6246e8aaf1971
	.xword	0xc2a7f693dbdf6351
	.xword	0xbf8010632d14badb
	.xword	0x329fc9fa4f1e8078
	.xword	0xa244f60d18276470
	.xword	0xdccacee8a76b539c
	.xword	0xd6b047f35a9ec7bf
	.xword	0xc60eaee415ab1bba
	.xword	0x8c98a46a5e722761
	.xword	0xab358a04c9c68a90
	.xword	0x8a7eb2bcf3ad9ef4
	.xword	0x6c214dc9b63f3bc1
	.xword	0xac18a99bf688ecb2
	.xword	0x42b950d2061e7157
	.xword	0x31b1b9b8a1bb74be
	.xword	0xb1e5661b28634bbb
	.xword	0x7e3feba9d259ab36
	.xword	0xf70bdeab9a4b3983
	.xword	0x86868d5e6f0ec20d
	.xword	0x6da166115c6ffacd
	.xword	0xad62d4c8766c9d37
	.xword	0x8b7626baf65736f7
	.xword	0x6dadb28b54b5309f
	.xword	0x193ece49ba00bd7f
	.xword	0x91527779069621a2
	.xword	0x744d4cb2fa803db9
	.xword	0xfacb805447e389f6
	.xword	0xcedf7d09afce780d
	.xword	0x2a77a8deddf13b1a
	.xword	0x8723189a07633852
	.xword	0x819badecf548c882
	.xword	0xfec9b91887fbcdca
	.xword	0xfed1c972b3db4be8
	.xword	0x220c44356e098146
	.xword	0x8bd528752fc334b3
	.xword	0xb3444575d79a1aba
	.xword	0xa693a4b074aa2e6a
	.xword	0x8bcbced57a0d72ae
	.xword	0x8fe3ff606d9801f9
	.xword	0x51a50cb6930bbbe7
	.xword	0x0cee1227e50d7583
	.xword	0x4ba5e50102d3fc8e
	.xword	0x4765222a772565d2
	.xword	0xbc592b6d7b62507d
	.xword	0xff8b16e1f5718ce1
	.xword	0x1ed4d617bf60fc5d
	.xword	0xa2930216d1ab97ec
	.xword	0x93a70814f8f485f4
	.xword	0x88ede95beffece4d
	.xword	0x1c2766dc4fe9cf08
	.xword	0xcd075aa23560dc93
	.xword	0x8c10e25b0b7345c8
	.xword	0x93eee31d9960ec3f
	.xword	0x737f337248d0fbbe
	.xword	0x9a8dd000d76b0c27
	.xword	0xc83d52e3daf38678
	.xword	0x7f0e21a42dc1e9aa
	.xword	0xe087e55b51637671
	.xword	0x5cf5eac23ca2b1f3
	.xword	0xb0aedf7a0c66914d
	.xword	0xac44412d35b71fe0
	.xword	0xdde9d2433924635e
	.xword	0x2d6ee2294faa3574
	.xword	0xac1a53280c51979d
	.xword	0xa971de4d1bf689f8
	.xword	0xa4e263f0554c6c67
	.xword	0x598247c9f0e019ea
	.xword	0x216f4113490214f5
	.xword	0xff9381f75a216d41
	.xword	0x7b85e6de0aab7779
	.xword	0x85ef89c4f0aff65a
	.xword	0x8bc002627c8df3b5
	.xword	0xf7dc03b62db47107
	.xword	0x910785654818cb31
	.xword	0x2ed0e1fee8430808
	.xword	0xc7a312f28b2ca071
	.xword	0x90050aca0603bf73
	.xword	0x1e8e7d8803b83252
	.xword	0x4b073e00b10af88a
	.xword	0x9352b5105800da40
	.xword	0xb4ea19f403711805
	.xword	0xb290ab9b204af908
	.xword	0x8636a458ef512c4b
	.xword	0x86955c4d1767980f
	.xword	0x5ef20f7e50961d22
	.xword	0xc22b6b6e49310543
	.xword	0x1863effaa71f2598
	.xword	0x06cfb319b5ac428e
	.xword	0x441604004720963c
	.xword	0xf624c0b963cd2c4f
	.xword	0xeaa67fce27431457
	.xword	0xbc869a62c4053a39



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
	.xword	0x3b05963a2ae2c77b
	.xword	0x93743a2526e24067
	.xword	0xbd5cfcaf9a566dff
	.xword	0xce098c088cbc1a10
	.xword	0x33a56ac9fa190421
	.xword	0x7e52d6a83e6c0fda
	.xword	0x514fae4e92f674f7
	.xword	0xa98afc52f143b9dd
	.xword	0x15c664b2beb8d0f2
	.xword	0xcad34da5aac0134a
	.xword	0x642a92d7548a5b15
	.xword	0xee759bfbcaefc38f
	.xword	0xf88ab9c806d0f091
	.xword	0x66115e2539a0bad8
	.xword	0xeb93d4cc78a5c92e
	.xword	0xba9acad2055c645c
	.xword	0x9ed4353fbe67c5b7
	.xword	0x14199d577951c70d
	.xword	0x02f467712af43caa
	.xword	0x814f220f4d7a8142
	.xword	0x401f75f7f8941775
	.xword	0x87f6d625ac4761ae
	.xword	0x0ac7520d5d4e0fdf
	.xword	0x27d2e97513aa7707
	.xword	0xd76cdb5a9d847371
	.xword	0x266d1dbda8391227
	.xword	0x2fee8f8e45eead2d
	.xword	0xfa19456e53dd92a9
	.xword	0x16f1e8eed3df429e
	.xword	0x72cdca9ba11c37a5
	.xword	0x83796abf82d6d49f
	.xword	0x2e6659e9518a0b1c
	.xword	0x6f6a458e74e07204
	.xword	0xbd2e7dda76e95ae4
	.xword	0xb7f7930a48af6542
	.xword	0xa50014b6bcbbfbb1
	.xword	0xc582a1419b56c5ef
	.xword	0x72284be6948df6f1
	.xword	0x4b1f67a5fd48f94b
	.xword	0xdc2e0e6786009afa
	.xword	0x4e6d2c6c340b68ac
	.xword	0xdcbcb5ae2aafeb64
	.xword	0x3ef58ea67b765140
	.xword	0x4af97f6f374fb9d2
	.xword	0x153a5dd0d97cfd28
	.xword	0x009d5b45013efbde
	.xword	0xeb8d4086e0de3137
	.xword	0x58f3ff56873dadb1
	.xword	0x56bc4703a94aa84d
	.xword	0x504b0ac63818e019
	.xword	0xf3f4a25eac6c8bcb
	.xword	0x20575bfe880ca5d4
	.xword	0xf8bcf57ed52d42cc
	.xword	0x7ee9eb856184a0fb
	.xword	0x4ae713f226ea32af
	.xword	0xf3ab5a476357395c
	.xword	0x02c6216b7154ef99
	.xword	0x3935d0acd26261e7
	.xword	0xfe82612cc1c5beeb
	.xword	0xb9e74364150d1713
	.xword	0x1d67d7ce9d0eb70d
	.xword	0xa53de7bb26504c7c
	.xword	0x407829826321a7b4
	.xword	0xf7590891324257df
	.xword	0x8c6d1fc1cc3e04e6
	.xword	0xe6e4b26659fe57dc
	.xword	0xbc781e683e7bd199
	.xword	0x17f94b9e1348759b
	.xword	0xc3c3601175f2ea46
	.xword	0x9a5f26a1e3b11f72
	.xword	0xbc90f48d1fc53a27
	.xword	0xa8b7536eef51a31c
	.xword	0x063608432ca49c97
	.xword	0x79886f507e097819
	.xword	0xd72bf4b9bdbe0997
	.xword	0x71c69d904fafb847
	.xword	0x4ad5892ca718a49c
	.xword	0xbe6b2442bae29d01
	.xword	0xc55fbab9b1f08e09
	.xword	0xdcc4af419bee1453
	.xword	0x75d98a4d882f683b
	.xword	0x1f515a1282b75e00
	.xword	0xe7e9bace06147834
	.xword	0x3c0531c332e49948
	.xword	0xd5543c4a63f80f53
	.xword	0x5dd8a38e9191ee0d
	.xword	0xe20bf5596c12ca65
	.xword	0x2402f022d61a7e3d
	.xword	0x2ccbbbb5e91c6383
	.xword	0x7fbd86e6ab5ada27
	.xword	0x9a6ff49152c6672d
	.xword	0xf09138797c669ecc
	.xword	0x75b60356a4afc659
	.xword	0xd7bffb5fb3c5ef46
	.xword	0xc1477b7e43301279
	.xword	0x0714cff16da7127f
	.xword	0x7065a8d29d548d11
	.xword	0x661ff6720de0f052
	.xword	0xe909e13a3642ef68
	.xword	0xd0a1ad6a67c2e6b3
	.xword	0x6e1bb1a83865d897
	.xword	0x5a86bfdc401ae762
	.xword	0x3961ec560e56ff9b
	.xword	0x6af4e11a714d5b60
	.xword	0x49de02dd1209d716
	.xword	0xb94e1bf4e4ce8689
	.xword	0xf504710358630e0c
	.xword	0x5d9c0b91a34a3b80
	.xword	0xc0f5a85a527a8db9
	.xword	0xa7a1094e7a4ed417
	.xword	0x6c846e145806e8ce
	.xword	0x706044fe66ff0d7a
	.xword	0x94e3efcf36b731c3
	.xword	0xed9a2748964764fd
	.xword	0xcccc79ec47034773
	.xword	0x185fba2abc76cfca
	.xword	0x0f8f5b978773f001
	.xword	0xa5722b65d5b188b8
	.xword	0x0527c604c5627a45
	.xword	0xdb698f622b7e065f
	.xword	0xd2c6b43a9fea0da6
	.xword	0xed166680f0745f2a
	.xword	0x4c01919dbdccdc80
	.xword	0x02bb3e979dda9c7e
	.xword	0x3b9d594f807d1954
	.xword	0xf9ef93e00bc99547
	.xword	0xef138dfff06fabbc
	.xword	0x8811515fcb00ddb0
	.xword	0xd02da3bb5575ae50
	.xword	0xe30f9f5c65d39149
	.xword	0x4e763e8936190839
	.xword	0x2547beeebb9c89dc
	.xword	0xc57d443500159851
	.xword	0xb19671f48316b836
	.xword	0x689d23d8b50e87bc
	.xword	0x502868b5e69145ff
	.xword	0x57718381a9954d4e
	.xword	0xc5deab45f61e946f
	.xword	0xcc3661964c6cb119
	.xword	0x8281edb6081d487e
	.xword	0x2a6c10f04171f399
	.xword	0x72df25d60e620ddb
	.xword	0xb87d9164afdefa44
	.xword	0xbb0c3bf2ff16b324
	.xword	0xd3bc6989d20d18aa
	.xword	0x144a0496b6daab82
	.xword	0x21f44ce28a4dbbad
	.xword	0x826d803aebeeb589
	.xword	0xce7c753160429b6f
	.xword	0x40cf7f20238ee8bb
	.xword	0x8a4dfb362ee3e2d3
	.xword	0x28fc966f26121d2f
	.xword	0x72c3050cce2ce5ce
	.xword	0x2ce3682fd3fb053b
	.xword	0xc6403e30f0ba9bfb
	.xword	0x9cd32ba3033b049b
	.xword	0x41e3eb95f09bf102
	.xword	0xf98a9a69762440f2
	.xword	0x1439b913c053cf7b
	.xword	0x53a7b7f534868eff
	.xword	0xa26420883898b93e
	.xword	0x4b6ab5d1ef26cda2
	.xword	0x5c62f6884e233ec9
	.xword	0x1180de784a50ce48
	.xword	0x673dd9005ea4c622
	.xword	0x650bb88baf6c91b6
	.xword	0xa3a5a331d51e8dcf
	.xword	0x3a0aa43b35cdb1b0
	.xword	0x4c2fd716d11840bd
	.xword	0x5851fafce5e156b0
	.xword	0x3bbbd4214910ac72
	.xword	0x3c605bf840a81614
	.xword	0x29bf01abef564f16
	.xword	0xa9166ad04b321cbf
	.xword	0x45609d82834d3317
	.xword	0xbbddf90fa47306aa
	.xword	0x2d26633ccb82ed7c
	.xword	0x847838213eaee121
	.xword	0x15cfdbfe2dde5e80
	.xword	0x02063b88f20e73ee
	.xword	0x0056af3389e998a6
	.xword	0xbebe4928368bd829
	.xword	0x5fd552453d4b7eaf
	.xword	0x7e5af26b91698746
	.xword	0x2e102b947450a92a
	.xword	0xd813cdc4c8cac274
	.xword	0x71a70bcef68ea31d
	.xword	0x94abc9fd5f1c7d63
	.xword	0x1c63411f7c602e17
	.xword	0x0eaf27dc850e38fb
	.xword	0xc26bc945e8ef16a9
	.xword	0xbcc3d50585cbdcdd
	.xword	0xed407012b0e0f806
	.xword	0xc9723b44be19a7ac
	.xword	0x63847089003ecf98
	.xword	0x6fad00eee3fc65b2
	.xword	0x093097efe8bc4de3
	.xword	0x231f8aa41fa68abe
	.xword	0x5584f696598811fe
	.xword	0x63a3cd7ae3409ab3
	.xword	0x4b3fd8ce5fa4e4a5
	.xword	0x3d32e6c4782938c6
	.xword	0x8c44b112a2b58e74
	.xword	0x7ce7253e266cf334
	.xword	0x21cc584fb0cd7d0b
	.xword	0x1b061ceb3f839bc3
	.xword	0x2523826c9e7927b7
	.xword	0x0e60c1a737486ec7
	.xword	0xee4f9b35f726e1a6
	.xword	0x77a01534f2d4df99
	.xword	0xc1f16d7ffa3bf839
	.xword	0x7d4b33d0aa971d1c
	.xword	0x57036354718b4996
	.xword	0xc3c2874615408da1
	.xword	0xea4bbc5f157b4482
	.xword	0xa4c69a6a3c6cd8e1
	.xword	0x9567c2a36eb7fa3b
	.xword	0xb45027705e92267e
	.xword	0x4918e253d5fcde23
	.xword	0x009d0566c7368464
	.xword	0xc6f44e1c5a02b469
	.xword	0x9bef9b3eb7c15992
	.xword	0x3c5daf62040ee9fd
	.xword	0x8cc1d72e8d8cf468
	.xword	0x3f9ee292e7d6c2b2
	.xword	0x081c548e46443c75
	.xword	0xf1de0a34f963141c
	.xword	0x8d80650452cf0f16
	.xword	0xeffdbd382019e883
	.xword	0xe732701716471a32
	.xword	0x7b96d9f054c06316
	.xword	0x058e5c9d46131000
	.xword	0x7ebe71ba62cf95fc
	.xword	0x699474a339484648
	.xword	0x2f6c588e5e89f986
	.xword	0x78c6f5c61f227ec3
	.xword	0xe03fe9200eebabc1
	.xword	0x0a3bff8520deb3a4
	.xword	0xe3ddc8549d61ce35
	.xword	0x068c879a947e5a78
	.xword	0x2cb4b7f793409736
	.xword	0xd89ebd120f2f85ad
	.xword	0xd3e619e47c52a84d
	.xword	0x238e1a00d738290b
	.xword	0x274b9a099ba6fc08
	.xword	0x1a22f949589496cb
	.xword	0xc3ff510a565d0f7d
	.xword	0x33745a7f2cd61847
	.xword	0xa6937a8e42e4f32d
	.xword	0xd037f3b5c6b5e0ec
	.xword	0xa76555742de2ad2e
	.xword	0x568b5bcb35840b2e
	.xword	0x0bb6b6d8fb8ef4ac
	.xword	0xcb25cc8fe4f842bf
	.xword	0x091f3c846d9b0367
	.xword	0x16b122b11ad74b66



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
!!#   IJ_set_rvar ("diag.j", 108, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 112, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 113, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 117, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 126, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 136, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 139, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 150, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 159, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
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
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 230, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 239, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 249, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 259, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 269, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 279, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 289, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 299, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 311, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 320, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 330, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 340, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 350, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 360, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 370, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 380, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 391, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 400, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 410, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 420, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 430, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 440, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 450, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 460, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 469, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 477, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 485, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 486, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 487, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 488, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 489, ijdefault, Ft_Imm_Asi, "{16,17}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 494, ijdefault, Ft_Simm13, "13'b0 0000 rrrr r000");
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
!!#   IJ_init_regs_by_setx ("diag.j", 522, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 523, th_M, "\tmov\t0, %%r8\n");
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
!!#   IJ_printf ("diag.j", 555, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 556, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 561,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 563,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 568,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 696, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9 set_addr load alu store sjm4 sjm5
!!# !inst_type: set_reg9 set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 703, th_M, $3);
!!# 		IJ_generate ("diag.j", 704, th_M, $4);
!!# 		IJ_generate ("diag.j", 705, th_M, $5);
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
!!#                    IJ_printf ("diag.j", 723, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 726, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 728, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 729, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 733, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 734, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 735, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 736, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 738, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 739, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 752, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 757, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 761, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 762, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 764, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 765, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 779, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 783, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 784, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 801, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 806, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 807, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 809, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 810, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 812, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 813, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 818, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 819, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 821, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 822, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 839, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 842, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 844, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 845, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 849, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 850, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 851, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 852, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 854, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 855, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 868, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 873, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 877, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 878, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 880, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 881, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 896, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 899, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 901, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 902, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 917, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 920, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 921, Rv_rand32);
!!#                          IJ_printf ("diag.j", 922, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 927, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 929, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 943, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 949, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 953, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 968, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 970, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 972, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 978, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 979, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1006, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1012, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1013, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1016, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1018, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1027, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1029, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1047, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1053, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1058, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1060, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1078, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1081, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1083, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1084, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1087, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1088, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1089, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1090, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1092, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1093, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1106, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1111, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1115, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1116, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1118, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1119, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1133, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1137, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1138, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1155, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1160, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1161, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1163, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1164, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1166, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1167, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1172, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1173, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1175, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1176, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1193, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1196, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1198, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1199, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1203, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1204, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1205, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1206, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1208, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1209, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1222, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1227, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1231, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1232, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1234, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1235, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1251, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1254, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1256, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1257, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1272, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1275, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1276, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1277, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1282, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1284, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1298, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1304, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1308, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1324, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1326, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1328, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1334, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1335, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1362, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1368, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1369, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1372, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1374, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1383, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1385, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1409, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1414, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1416, sjm_5, "\n");
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
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1443, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1444, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1446, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1447, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1457, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1459, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1460, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1461, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1462, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1463, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1464, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1465, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1466, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1467, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1468, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1469, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1470, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1471, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1472, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1473, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1474, th_M, "\n\n\n");
!!# 
!!#                         }
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1478, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1479, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1481, Rv_jbiaddr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1486, Rv_jbiaddr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1487, Rv_jbiaddr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1490, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1491, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1492, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1493, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1494, Rv_jbiaddr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1496, Rv_jbiaddr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1499, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1500, Rv_jbiaddr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1503, Rv_jbiaddr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1504, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1505, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1506, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1507, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1508, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1509, Rv_jbiaddr_pattern6);
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
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi0; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64("diag.j", 1535, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1536, Rv_rand64);
!!#                         data_st = x_DATA_ARRAY[x_wr_cntr];
!!#                         addr_st = x_ADDR_ARRAY[x_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1539, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1541, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1543, th_M, "\tsth\t%%r10, [%%r6]\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1547, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1549, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1552, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1554, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1556, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1557, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         x_wr_cntr++;
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
!!#                         if(x_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1589, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1591, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
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
