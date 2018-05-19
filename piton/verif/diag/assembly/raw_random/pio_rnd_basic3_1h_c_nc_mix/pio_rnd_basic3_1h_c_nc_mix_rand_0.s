// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1h_c_nc_mix_rand_0.s
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
   random seed:	42490261
   Jal pio_rnd_basic3_1h_c_nc_mix.j:	
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

	setx 0x962f81225b1be22e, %g1, %g0
	setx 0xc6ce2d622f057385, %g1, %g1
	setx 0xa7c9fd17e86f97b6, %g1, %g2
	setx 0x70f70e6a387026d7, %g1, %g3
	setx 0x9e1baff024fc005a, %g1, %g4
	setx 0x113b183ad6261cb9, %g1, %g5
	setx 0x36c5c18a6289bc04, %g1, %g6
	setx 0x00da1c0c36c75179, %g1, %g7
	setx 0xdcd17578ec4923bd, %g1, %r16
	setx 0x1bde17d57f22bd0e, %g1, %r17
	setx 0xce20a4b425990c62, %g1, %r18
	setx 0x8012c775f2ea3dca, %g1, %r19
	setx 0x0bf6db134fabb738, %g1, %r20
	setx 0x4fc473aafbf616a4, %g1, %r21
	setx 0xb9a6edccfb5829b9, %g1, %r22
	setx 0x97af77006704f434, %g1, %r23
	setx 0x54d81eaadbf1f275, %g1, %r24
	setx 0xbd92e4e27126420a, %g1, %r25
	setx 0x311321fc7304efa9, %g1, %r26
	setx 0x53059c87a3f91d04, %g1, %r27
	setx 0xee34ae19a81432f7, %g1, %r28
	setx 0xb8058435a00d8bde, %g1, %r29
	setx 0xaaa3d8536be51c52, %g1, %r30
	setx 0xde9fcfec226e890b, %g1, %r31
	save
	setx 0x7167488a19c23b1a, %g1, %r16
	setx 0x9205eaf22677820b, %g1, %r17
	setx 0x460848b1026000ab, %g1, %r18
	setx 0x1ba5e45e3e0e42a1, %g1, %r19
	setx 0x96d31f2377d073ca, %g1, %r20
	setx 0x5291f2bbdb031e37, %g1, %r21
	setx 0xddaa49c77885bd75, %g1, %r22
	setx 0x562e96482cf2a9ec, %g1, %r23
	setx 0x19ac26a98399a32f, %g1, %r24
	setx 0xa72b1c53c22dcc1e, %g1, %r25
	setx 0x8a93bc6bb7827a8e, %g1, %r26
	setx 0xad77b73414688db7, %g1, %r27
	setx 0xb43a359f069a1fa5, %g1, %r28
	setx 0xbf0d871721a5a8e2, %g1, %r29
	setx 0x2d780ff74839bfd2, %g1, %r30
	setx 0xf2d339a7ad53c44d, %g1, %r31
	save
	setx 0x0fe1733059056564, %g1, %r16
	setx 0x2a133685b8625b31, %g1, %r17
	setx 0xed0aabe7ec6d18f7, %g1, %r18
	setx 0x1e8a8412e55d0900, %g1, %r19
	setx 0xf029281e69bf8bb2, %g1, %r20
	setx 0x682b65a0d9669628, %g1, %r21
	setx 0xb3875edb32f2ef13, %g1, %r22
	setx 0xd0d8aaebae00f4ea, %g1, %r23
	setx 0x970fe6ad60dc28bd, %g1, %r24
	setx 0x896a6e32243aad6a, %g1, %r25
	setx 0x2ee168a8927c02db, %g1, %r26
	setx 0x94cbeec75fe50f11, %g1, %r27
	setx 0xd66ac6368c925169, %g1, %r28
	setx 0x72cf9ce056abbc5e, %g1, %r29
	setx 0xef5a125d7ae252fb, %g1, %r30
	setx 0x02f409933b97955c, %g1, %r31
	restore
	mov	0, %r8
	setx	0x0000000010115002, %r1, %r9
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



	setx	0x0000008072041b68, %r1, %r6
	setx	0x317beaa24f7b3951, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800edf88bc, %r1, %r6
	setx	0xf89ce79c382fcf95, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe71496, %r1, %r6
	setx	0xdd5126f274778a0a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca98e9a57e, %r1, %r6
	setx	0xd2a17ab7f5a334dc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d617411f40, %r1, %r6
	setx	0x843970d26eb644c1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x843970d26eb644c1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ec876379ac, %r1, %r6
	setx	0xbb9798943f7c5e1d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0092e965a, %r1, %r6
	setx	0x1099589224759afd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	.word 0xe859a068  ! 2: LDX_I	ldx	[%r6 + 0x0068], %r20
	.word 0xa041a0a0  ! 3: ADDC_I	addc 	%r6, 0x00a0, %r16
	.word 0xe0298008  ! 4: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x0000008073d63360, %r1, %r6
	setx	0xc3ddffa0f6091e46, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xc3ddffa0f6091e46, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e8731e2, %r1, %r6
	setx	0xb69cbe8a3d2af05f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xb69cbe8a3d2af05f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f7ddb54, %r1, %r6
	setx	0x2c4ee8bc29a92e07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd0f3870aa, %r1, %r6
	setx	0x72e6119d6c25934b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d0484aebe2, %r1, %r6
	setx	0x1df8857b35cb69e9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea4f5348c4, %r1, %r6
	setx	0x481820284b2eefde, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc724f9f2e, %r1, %r6
	setx	0xa851b9e915150d2b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec876379ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d617411f40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca98e9a57e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xa851b9e915150d2b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001000100000, %r1, %r6
	.word 0xe041a0a0  ! 9: LDSW_I	ldsw	[%r6 + 0x00a0], %r16
	.word 0xacb9a020  ! 10: XNORcc_I	xnorcc 	%r6, 0x0020, %r22
	.word 0xe0298008  ! 11: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000080af621d54, %r1, %r6
	setx	0x21a79d241c55cb8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8ae67a, %r1, %r6
	setx	0xff6563cb43fca9f1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f1738f6, %r1, %r6
	setx	0x90f745c457ae9174, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c2c8bcd6b6, %r1, %r6
	setx	0x09c8c1d1168a9f8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d6ab215f70, %r1, %r6
	setx	0x16743ed98736d212, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec06758900, %r1, %r6
	setx	0xbfbf63b2990d1f7a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f44e558fd8, %r1, %r6
	setx	0xf2866edf3df82cbf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xf2866edf3df82cbf, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ec876379ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0xf2866edf3df82cbf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d617411f40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe051a020  ! 16: LDSH_I	ldsh	[%r6 + 0x0020], %r16
	.word 0xa6a9a078  ! 17: ANDNcc_I	andncc 	%r6, 0x0078, %r19
	.word 0xe8218008  ! 18: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000080a267bb12, %r1, %r6
	setx	0x7fed500fabf73580, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x7fed500fabf73580, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e733bf0, %r1, %r6
	setx	0x31b044b2b837f5f5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x31b044b2b837f5f5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ff18032, %r1, %r6
	setx	0x568455157e60409c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8c3b1982e, %r1, %r6
	setx	0xe5c65cb7b1c4db7a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xe5c65cb7b1c4db7a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d318a29016, %r1, %r6
	setx	0xe75dc73695558104, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee7d5063b8, %r1, %r6
	setx	0xf8a837f70ac81d2c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xf8a837f70ac81d2c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa30584262, %r1, %r6
	setx	0xce39d5672a68cc1a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xce39d5672a68cc1a, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001050100000, %r1, %r6
	.word 0xe0418008  ! 23: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa0b98008  ! 24: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xe821a078  ! 25: STW_I	stw	%r20, [%r6 + 0x0078]
	setx	0x0000008016fba030, %r1, %r6
	setx	0xb6224608f18a5215, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0db810, %r1, %r6
	setx	0x0f2a930f80718342, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f3eb2e8, %r1, %r6
	setx	0xb340ef440dd52f81, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c1078cf7ae, %r1, %r6
	setx	0x5c697f95fd36287f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x5c697f95fd36287f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d9cac01a92, %r1, %r6
	setx	0x3ac6f397460412fe, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x3ac6f397460412fe, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e828d21960, %r1, %r6
	setx	0x2a649198381f6aea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f83b8d2e2c, %r1, %r6
	setx	0x754dd123276445d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x754dd123276445d4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f44e558fd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	.word 0xe8098008  ! 30: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xaa318008  ! 31: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xe039a078  ! 32: STD_I	std	%r16, [%r6 + 0x0078]
	setx	0x000000803587d2c6, %r1, %r6
	setx	0x09f001870f834a55, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e639ec8, %r1, %r6
	setx	0x9cf95c545fbf8a41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x9cf95c545fbf8a41, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f7c2f1c, %r1, %r6
	setx	0x7f723349f60680bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc90d72b78, %r1, %r6
	setx	0x836d5f9997275351, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x836d5f9997275351, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d776b84fda, %r1, %r6
	setx	0xd256ff6472a48002, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eee137d90a, %r1, %r6
	setx	0xf83358082ce82787, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f86949b7de, %r1, %r6
	setx	0xc7fef207c6dd002c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xc7fef207c6dd002c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fc724f9f2e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea4f5348c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe011a078  ! 37: LDUH_I	lduh	[%r6 + 0x0078], %r16
	.word 0xa8198008  ! 38: XOR_R	xor 	%r6, %r8, %r20
	.word 0xec718008  ! 39: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000080c741cfe6, %r1, %r6
	setx	0xfe9690e0c11d53b2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xfe9690e0c11d53b2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e7c7258, %r1, %r6
	setx	0xd34f11f78d20e55c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0xd34f11f78d20e55c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f92a208, %r1, %r6
	setx	0x08b10ab6778e4118, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc16fd3a06, %r1, %r6
	setx	0x756c48077fb5c6d2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d25e1a5da8, %r1, %r6
	setx	0xc7ad4feb77a06285, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e2a48f9e06, %r1, %r6
	setx	0x64ef3ad53d05a665, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f60729133e, %r1, %r6
	setx	0x164db85fe8d8669e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080af621d54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe059a078  ! 44: LDX_I	ldx	[%r6 + 0x0078], %r16
	.word 0xa8918008  ! 45: ORcc_R	orcc 	%r6, %r8, %r20
	.word 0xe8298008  ! 46: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000804b296e28, %r1, %r6
	setx	0xba5061a8a7efa59e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800edaad90, %r1, %r6
	setx	0xfd2fcd182b71bbe9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0xfd2fcd182b71bbe9, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f8d81d2, %r1, %r6
	setx	0x885133a39bd3873e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x885133a39bd3873e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c9543b2fb0, %r1, %r6
	setx	0xdb1fc6d91ace5a7a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1a50ba870, %r1, %r6
	setx	0x9079195b81e9f280, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e900902352, %r1, %r6
	setx	0x8eeafa051ee6becf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f46c5ea9e4, %r1, %r6
	setx	0x0247c4a4f4ef2ce2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe011a078  ! 51: LDUH_I	lduh	[%r6 + 0x0078], %r16
	.word 0xa2a98008  ! 52: ANDNcc_R	andncc 	%r6, %r8, %r17
	.word 0xe4318008  ! 53: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x000000805a5ff226, %r1, %r6
	setx	0x90e89ef272283a72, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e5762b2, %r1, %r6
	setx	0xd4ea4b82d9e94839, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2f213e, %r1, %r6
	setx	0xb1f14a57af0ce950, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xb1f14a57af0ce950, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c7f850e7d2, %r1, %r6
	setx	0xc213060ea3c65e0e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d29634afca, %r1, %r6
	setx	0x50675403e3850f3e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecfb95913e, %r1, %r6
	setx	0xc788447b9941f908, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0312f46b8, %r1, %r6
	setx	0x6577d5e15aa59908, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x6577d5e15aa59908, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e0db810, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008016fba030, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xec018008  ! 58: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa6398008  ! 59: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xe031a078  ! 60: STH_I	sth	%r16, [%r6 + 0x0078]
	setx	0x00000080d7e96364, %r1, %r6
	setx	0xe9b7700c6d93ad0e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea4e8ce, %r1, %r6
	setx	0xbae10d9ee70f0d1b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f462ce0, %r1, %r6
	setx	0x22cf270aed505119, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x22cf270aed505119, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c769af7126, %r1, %r6
	setx	0xf7b9d0c4fbd57d41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xf7b9d0c4fbd57d41, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000db860014fc, %r1, %r6
	setx	0x1f156199a04dfd36, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e27e9769d6, %r1, %r6
	setx	0x12ef22b3cec1dd1c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fac6f55bd6, %r1, %r6
	setx	0xd39af10d528eeaa6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7f850e7d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xec01a078  ! 65: LDUW_I	lduw	[%r6 + 0x0078], %r22
	.word 0xac418008  ! 66: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xe8398008  ! 67: STD_R	std	%r20, [%r6 + %r8]
	setx	0x0000008040c453c2, %r1, %r6
	setx	0xa8a3517b290336a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xa8a3517b290336a2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800eb67720, %r1, %r6
	setx	0x3a1a2f096a8c2c09, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f6d9c72, %r1, %r6
	setx	0x936bf4c1264e71a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c97d4b1066, %r1, %r6
	setx	0x44bf0cec35339313, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d019c17f54, %r1, %r6
	setx	0xb1b9d2d18f5141c6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed34bfb00c, %r1, %r6
	setx	0x7bf846ac1b066a06, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x7bf846ac1b066a06, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa10a483c2, %r1, %r6
	setx	0xdb5fd1c112c2b7ed, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008073d63360, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0092e965a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec876379ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d617411f40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0xdb5fd1c112c2b7ed, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ca98e9a57e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0xdb5fd1c112c2b7ed, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001070100000, %r1, %r6
	.word 0xe0098008  ! 72: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa601a0a8  ! 73: ADD_I	add 	%r6, 0x00a8, %r19
	.word 0xec318008  ! 74: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000080e26d07a8, %r1, %r6
	setx	0x3db39e59167e47c8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x3db39e59167e47c8, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e1b3a72, %r1, %r6
	setx	0xb93b2f11e935a298, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xb93b2f11e935a298, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f5db1cc, %r1, %r6
	setx	0xa0c84720a2bce3b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb9a028964, %r1, %r6
	setx	0x7b5589aa6c3140f8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x7b5589aa6c3140f8, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d236999b16, %r1, %r6
	setx	0xa1e2bfdc43081d05, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e266810824, %r1, %r6
	setx	0xf710e1e5e6e55bb4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f09e80686e, %r1, %r6
	setx	0x72000f2c3ce6aace, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	.word 0xe409a0a8  ! 79: LDUB_I	ldub	[%r6 + 0x00a8], %r18
	.word 0xac318008  ! 80: ORN_R	orn 	%r6, %r8, %r22
	.word 0xec218008  ! 81: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000080506c9288, %r1, %r6
	setx	0x2c3e5c38c60ab61d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ed19ee4, %r1, %r6
	setx	0x4a840e434cd6f9ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fc892ca, %r1, %r6
	setx	0x6a8b29d4b136c934, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c169001d42, %r1, %r6
	setx	0x48d94715e7aef0f9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x48d94715e7aef0f9, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000df938a9d02, %r1, %r6
	setx	0x0453f1a503f6db87, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x0453f1a503f6db87, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ef13a1d1a0, %r1, %r6
	setx	0x17a34a6c39be1883, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x17a34a6c39be1883, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f832c7297a, %r1, %r6
	setx	0xe6e6beab3577f5fa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f60729133e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	setx	0xe6e6beab3577f5fa, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e2a48f9e06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d25e1a5da8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc16fd3a06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xec598008  ! 86: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xac818008  ! 87: ADDcc_R	addcc 	%r6, %r8, %r22
	.word 0xe0218008  ! 88: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080fa9ed820, %r1, %r6
	setx	0xe997010ab26336b0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e02de34, %r1, %r6
	setx	0xb4f93885b5df6ada, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2397ac, %r1, %r6
	setx	0x920264ccd1010bc6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c4678ca7ec, %r1, %r6
	setx	0xaa43d249614875f3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xaa43d249614875f3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d15cd93b46, %r1, %r6
	setx	0xebc99fcad8be8a7b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4f3e5eec2, %r1, %r6
	setx	0xc25587b79ae6d3f5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8032664a8, %r1, %r6
	setx	0xd2ff00b393cdbb5d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xd2ff00b393cdbb5d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c97d4b1066, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6d9c72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe4118008  ! 93: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xa4318008  ! 94: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe0298008  ! 95: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000803b286ca6, %r1, %r6
	setx	0x004143c75e1b73f1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea35814, %r1, %r6
	setx	0x35157e8d2411494d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x35157e8d2411494d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f12ea2a, %r1, %r6
	setx	0x165af2700753d501, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c021b53bd4, %r1, %r6
	setx	0x0224a550aab52e75, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d330c98a3c, %r1, %r6
	setx	0x242c3b286b81a8fe, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e82ac991d6, %r1, %r6
	setx	0x9c67f46902bec9b4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x9c67f46902bec9b4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fc9c9e7852, %r1, %r6
	setx	0x961f21f7c060db37, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f60729133e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2a48f9e06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x961f21f7c060db37, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d25e1a5da8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc16fd3a06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f92a208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7c7258, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xec418008  ! 100: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa601a040  ! 101: ADD_I	add 	%r6, 0x0040, %r19
	.word 0xe0318008  ! 102: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000080ed22fa74, %r1, %r6
	setx	0xfee6bc0504cd77e9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e1a02ba, %r1, %r6
	setx	0x6db3c97b8dacc93a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f01685e, %r1, %r6
	setx	0x33207671a991b48b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c117db936a, %r1, %r6
	setx	0x38f6deaed68496bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000da3ee178b2, %r1, %r6
	setx	0xe6ce51549d44b354, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xe6ce51549d44b354, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e0ba8660ec, %r1, %r6
	setx	0x6b55280482549948, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6d9d9cfa8, %r1, %r6
	setx	0x8bfd23e152554950, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8731e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x8bfd23e152554950, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000008073d63360, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x8bfd23e152554950, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f0092e965a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe0418008  ! 107: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaa018008  ! 108: ADD_R	add 	%r6, %r8, %r21
	.word 0xe0218008  ! 109: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x0000008021892838, %r1, %r6
	setx	0x13a2ee00a2508fab, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e594afc, %r1, %r6
	setx	0xcfb36fabf5c3f2e3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f4675a0, %r1, %r6
	setx	0xe218d28973580f10, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c253e44f18, %r1, %r6
	setx	0x1ec80083a01da186, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d05678c6b0, %r1, %r6
	setx	0xe0aea3256402c931, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee6d7cb59c, %r1, %r6
	setx	0x38810034a82f96c6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x38810034a82f96c6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fcdef97022, %r1, %r6
	setx	0xff0d21cbc653df60, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea4f5348c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0484aebe2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd0f3870aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7ddb54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8731e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xec09a040  ! 114: LDUB_I	ldub	[%r6 + 0x0040], %r22
	.word 0xaab18008  ! 115: SUBCcc_R	orncc 	%r6, %r8, %r21
	.word 0xec39a040  ! 116: STD_I	std	%r22, [%r6 + 0x0040]
	setx	0x00000080fbbb83fc, %r1, %r6
	setx	0x4a2784872502d65a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e091136, %r1, %r6
	setx	0x7e6722138dd6e904, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x7e6722138dd6e904, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f71c896, %r1, %r6
	setx	0xb620da213d45f6c6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xb620da213d45f6c6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c3fa30f8d2, %r1, %r6
	setx	0xabf17a5b560b235b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d406b28dc4, %r1, %r6
	setx	0x80e9bcbf79543b0a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee9244c96a, %r1, %r6
	setx	0x5e9863d752ce7127, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcd3ba69fa, %r1, %r6
	setx	0x594174af821946d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e0ba8660ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da3ee178b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c117db936a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f01685e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1a02ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080ed22fa74, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x594174af821946d5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fc9c9e7852, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xec418008  ! 121: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xaa81a060  ! 122: ADDcc_I	addcc 	%r6, 0x0060, %r21
	.word 0xe0718008  ! 123: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x0000008069cabbc4, %r1, %r6
	setx	0xd7cac288b0115c29, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e134a0c, %r1, %r6
	setx	0x5efb8ce8dd0d2789, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f85be5a, %r1, %r6
	setx	0x4155630b9a56cacf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c0fc11c972, %r1, %r6
	setx	0x6b61de86ab6728e2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d73b2d6890, %r1, %r6
	setx	0x82c5ec57559efefa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e1903ce8ee, %r1, %r6
	setx	0xfe5942322fb3221a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc9650bbea, %r1, %r6
	setx	0xb82e86815dcfe9db, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8c3b1982e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff18032, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe8118008  ! 128: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa2118008  ! 129: OR_R	or 	%r6, %r8, %r17
	.word 0xe031a060  ! 130: STH_I	sth	%r16, [%r6 + 0x0060]
	setx	0x0000008083bcef92, %r1, %r6
	setx	0xed90b92927c17dbf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e996b26, %r1, %r6
	setx	0x6feeb3a2fac0178c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f839e14, %r1, %r6
	setx	0x0304bfae37656f54, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c867a094c4, %r1, %r6
	setx	0x550678028469d155, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8714e58e2, %r1, %r6
	setx	0x6332cf8720dbc1d2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed8b185220, %r1, %r6
	setx	0x821ae2a8ff77ee1e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x821ae2a8ff77ee1e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f87902de88, %r1, %r6
	setx	0xdc3ab84b7379d3ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	.word 0xe4118008  ! 135: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xa431a000  ! 136: ORN_I	orn 	%r6, 0x0000, %r18
	.word 0xe029a000  ! 137: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x000000805fe80afa, %r1, %r6
	setx	0x9b966bcd34a778c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800edb5e46, %r1, %r6
	setx	0x1b1363ba3f54b795, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fd1de28, %r1, %r6
	setx	0xf69a8d1c1abd3a78, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ceab027710, %r1, %r6
	setx	0x82406aaef6153eae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc93233ab8, %r1, %r6
	setx	0xbc3cee80bcfa3c56, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3ef6c3dda, %r1, %r6
	setx	0xfaaf3f57507ad0ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000feaea4b9b8, %r1, %r6
	setx	0xa9faa51303955533, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f5db1cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1b3a72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080e26d07a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa10a483c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xa9faa51303955533, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ed34bfb00c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d019c17f54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe0098008  ! 142: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6b9a0b0  ! 143: XNORcc_I	xnorcc 	%r6, 0x00b0, %r19
	.word 0xe4718008  ! 144: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000080d667fffa, %r1, %r6
	setx	0xb2c18b0514f129e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e2311d8, %r1, %r6
	setx	0xf96d92630f7d91dd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f84e790, %r1, %r6
	setx	0x113c4e66eddd7e00, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc301acdd4, %r1, %r6
	setx	0xfc8de8ef58290a19, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d71d3fba2c, %r1, %r6
	setx	0x92bff82cde280be5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e475eea420, %r1, %r6
	setx	0xd042f7afa7fc55a4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xd042f7afa7fc55a4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f8d0a623a6, %r1, %r6
	setx	0x2f839356aca0d6e4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080506c9288, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe0098008  ! 149: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa8b98008  ! 150: XNORcc_R	xnorcc 	%r6, %r8, %r20
	.word 0xe029a0b0  ! 151: STB_I	stb	%r16, [%r6 + 0x00b0]
	setx	0x00000080457d5dd8, %r1, %r6
	setx	0xab3a38aca48fab46, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800edfbcde, %r1, %r6
	setx	0x1d0d435c8f05830b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f40b114, %r1, %r6
	setx	0x5fbe92ce6ccb20ee, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c32d92352c, %r1, %r6
	setx	0x96447f19fea77a04, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x96447f19fea77a04, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d557cae102, %r1, %r6
	setx	0x017830f75cf6e1f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed6baa664a, %r1, %r6
	setx	0xf26ba1c9fbb935e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6f2f8e0fa, %r1, %r6
	setx	0x90ae55cbcf25a253, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8ae67a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080af621d54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe009a0b0  ! 156: LDUB_I	ldub	[%r6 + 0x00b0], %r16
	.word 0xa6318008  ! 157: ORN_R	orn 	%r6, %r8, %r19
	.word 0xe4298008  ! 158: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x000000808ccc25a2, %r1, %r6
	setx	0xd25dd0872a3cebf1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eaf0832, %r1, %r6
	setx	0x1df4e6a259b9ff20, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff75ff2, %r1, %r6
	setx	0x603996dda682ee89, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cad2f2692c, %r1, %r6
	setx	0xd32f0bf97d504945, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8e2c4575e, %r1, %r6
	setx	0x9ee3320361a00975, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ee0b1ea518, %r1, %r6
	setx	0x1cc99d71bb233843, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x1cc99d71bb233843, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f6fd2b1d8c, %r1, %r6
	setx	0x5b5f0f7beb113cc7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f832c7297a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef13a1d1a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df938a9d02, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c169001d42, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc892ca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0x5b5f0f7beb113cc7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe8598008  ! 163: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xa2c18008  ! 164: ADDCcc_R	addccc 	%r6, %r8, %r17
	.word 0xe439a0b0  ! 165: STD_I	std	%r18, [%r6 + 0x00b0]
	setx	0x00000080b3fa871a, %r1, %r6
	setx	0x91af0fa5e815e42f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efad5fa, %r1, %r6
	setx	0x78cc7f41744bb920, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fc37af4, %r1, %r6
	setx	0xdf4a34a592dd8830, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c35662ab12, %r1, %r6
	setx	0xe3694807e1cbd584, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d0e36bd976, %r1, %r6
	setx	0x939f7f9d31b3ae2a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5e4f0b09c, %r1, %r6
	setx	0x4fdb28f2a82317f3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x4fdb28f2a82317f3, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fefb3f3a72, %r1, %r6
	setx	0x066a438fa89d7c47, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c769af7126, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xec41a0b0  ! 170: LDSW_I	ldsw	[%r6 + 0x00b0], %r22
	.word 0xa6b18008  ! 171: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xe0298008  ! 172: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000080e55b6ada, %r1, %r6
	setx	0x99ce174ad5e66ccf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0f66b0, %r1, %r6
	setx	0x9d69486f1a537caf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0x9d69486f1a537caf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fca8fc6, %r1, %r6
	setx	0x02e3e566ff02ec5d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c400bce250, %r1, %r6
	setx	0x3f41e85bbe6dcd53, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x3f41e85bbe6dcd53, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d8ff4538d0, %r1, %r6
	setx	0x93b606b16870be3b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e0496e11aa, %r1, %r6
	setx	0xb1acdb20cc58a703, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6c4d057f6, %r1, %r6
	setx	0xd5e235662ceb9adc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8c3b1982e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff18032, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0xd5e235662ceb9adc, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e733bf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0xd5e235662ceb9adc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080a267bb12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xec19a0b0  ! 177: LDD_I	ldd	[%r6 + 0x00b0], %r22
	.word 0xa2b1a0b8  ! 178: SUBCcc_I	orncc 	%r6, 0x00b8, %r17
	.word 0xe431a0b8  ! 179: STH_I	sth	%r18, [%r6 + 0x00b8]
	setx	0x0000008073248c84, %r1, %r6
	setx	0xa107aa9b8c770ceb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xa107aa9b8c770ceb, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e8d3570, %r1, %r6
	setx	0xb18d555bd4201c41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f251ee2, %r1, %r6
	setx	0xaf8cc1a3d42c7558, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c90cd3b0ca, %r1, %r6
	setx	0x9e16b3ce87ca1fd3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d00e4f6896, %r1, %r6
	setx	0x2cc3b184fb2d1c64, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed3df0ff40, %r1, %r6
	setx	0xe86011d1b901ab36, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8d061871a, %r1, %r6
	setx	0xcb95d3d0bcc03696, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c253e44f18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4675a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e594afc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe0518008  ! 184: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa2818008  ! 185: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe071a0b8  ! 186: STX_I	stx	%r16, [%r6 + 0x00b8]
	setx	0x0000008036de5bfc, %r1, %r6
	setx	0x4e2f5a543cee9b0a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e28494a, %r1, %r6
	setx	0x10346c6b369ba2d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x10346c6b369ba2d6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f67517c, %r1, %r6
	setx	0xa4f1dd7e912ed717, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xa4f1dd7e912ed717, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c8bb849606, %r1, %r6
	setx	0xf7727af76b595778, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dface4d864, %r1, %r6
	setx	0x147ceb38386c172f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5813c849c, %r1, %r6
	setx	0x6321a1159b663632, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0ef264460, %r1, %r6
	setx	0xb23f896f0b803555, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f44e558fd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec06758900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6ab215f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2c8bcd6b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xb23f896f0b803555, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f1738f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8ae67a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xec198008  ! 191: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa6298008  ! 192: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe4298008  ! 193: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000080f6879984, %r1, %r6
	setx	0xdcd59110260df2d2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xdcd59110260df2d2, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e81f97a, %r1, %r6
	setx	0x9cb79b2bb8fd7dd4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ff39e66, %r1, %r6
	setx	0x75aea0edf44ba89b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c269b143f6, %r1, %r6
	setx	0x0488e2a69e9f6966, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d2365c0c1e, %r1, %r6
	setx	0x0329bbf564bd4850, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec7016ae54, %r1, %r6
	setx	0x3003ec57dc6b9e9d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa9874e1fa, %r1, %r6
	setx	0x4723864d4299addb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x4723864d4299addb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e733bf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080a267bb12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f44e558fd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec06758900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0x4723864d4299addb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d6ab215f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2c8bcd6b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x4723864d4299addb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001040100000, %r1, %r6
	.word 0xe0118008  ! 198: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xae018008  ! 199: ADD_R	add 	%r6, %r8, %r23
	.word 0xec718008  ! 200: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x0000008057638354, %r1, %r6
	setx	0xf1fe04f70765bfbc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0ba812, %r1, %r6
	setx	0xf7acac2b03d0c240, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0xf7acac2b03d0c240, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fd8ab8e, %r1, %r6
	setx	0x3e9e2f9fad874445, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c4c0cc096a, %r1, %r6
	setx	0x1251e6fad3c9c07f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dea67504c4, %r1, %r6
	setx	0x2520f15191176c5c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ed4b9e8264, %r1, %r6
	setx	0x74a7f661122e2b07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f85c02646e, %r1, %r6
	setx	0x0479046989cf7da8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x0479046989cf7da8, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080d7e96364, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe849a0b8  ! 205: LDSB_I	ldsb	[%r6 + 0x00b8], %r20
	.word 0xaac18008  ! 206: ADDCcc_R	addccc 	%r6, %r8, %r21
	.word 0xe021a0b8  ! 207: STW_I	stw	%r16, [%r6 + 0x00b8]
	setx	0x00000080f7a75a7c, %r1, %r6
	setx	0x105b5040bd15c35a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec8fb1a, %r1, %r6
	setx	0x65be7ce288ceb81c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fcf4e54, %r1, %r6
	setx	0x2096d8e6260232ac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c626a78404, %r1, %r6
	setx	0x36f190fb7c6bdc59, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d54493bab2, %r1, %r6
	setx	0x379e3002f9547094, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e391c7303c, %r1, %r6
	setx	0xfe39d23cab7bc049, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xfe39d23cab7bc049, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f44119bc76, %r1, %r6
	setx	0xa390a2c9bca5ed28, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008021892838, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6d9d9cfa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0ba8660ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da3ee178b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0xa390a2c9bca5ed28, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c117db936a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f01685e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xec51a0b8  ! 212: LDSH_I	ldsh	[%r6 + 0x00b8], %r22
	.word 0xaa198008  ! 213: XOR_R	xor 	%r6, %r8, %r21
	.word 0xe0218008  ! 214: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080b0ab532e, %r1, %r6
	setx	0xc628aab9ca1a047e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e893092, %r1, %r6
	setx	0xbc806e17c8295544, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa30346, %r1, %r6
	setx	0xbc9ba627e10dbbd1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cb8ae1599a, %r1, %r6
	setx	0x5143eebacacda4ca, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x5143eebacacda4ca, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d41d9c1134, %r1, %r6
	setx	0x6338062aeee0da71, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecb9c4c70a, %r1, %r6
	setx	0xef9f6e29fe51e25e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f2414b7828, %r1, %r6
	setx	0x7716afbc29da3d8a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fcf4e54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0x7716afbc29da3d8a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ec8fb1a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0x7716afbc29da3d8a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080f7a75a7c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f85c02646e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed4b9e8264, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dea67504c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe8098008  ! 219: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa881a070  ! 220: ADDcc_I	addcc 	%r6, 0x0070, %r20
	.word 0xe029a070  ! 221: STB_I	stb	%r16, [%r6 + 0x0070]
	setx	0x00000080c5df6e5c, %r1, %r6
	setx	0x559a5df2bbec5c8b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e999d78, %r1, %r6
	setx	0x8702222f367f0412, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f41a268, %r1, %r6
	setx	0x7985060843fc9510, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cae124cd2e, %r1, %r6
	setx	0x18176ca62a6d8f5b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000db678cb580, %r1, %r6
	setx	0x2ed086a8d862b977, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e604bdd5a6, %r1, %r6
	setx	0x4d136dbed6b7ccc7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x4d136dbed6b7ccc7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f6e99e2fbc, %r1, %r6
	setx	0xcc6ef201032d0f26, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xcc6ef201032d0f26, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080fbbb83fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcdef97022, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xcc6ef201032d0f26, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ee6d7cb59c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d05678c6b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c253e44f18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe0098008  ! 226: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa4418008  ! 227: ADDC_R	addc 	%r6, %r8, %r18
	.word 0xe021a070  ! 228: STW_I	stw	%r16, [%r6 + 0x0070]
	setx	0x000000809883b91c, %r1, %r6
	setx	0x96be7b3bdf47e954, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x96be7b3bdf47e954, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e7f57f0, %r1, %r6
	setx	0x2fb8616c5ecfbf2f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f4b1436, %r1, %r6
	setx	0xf6474f0002ec54dd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c41ca72c08, %r1, %r6
	setx	0x1ee8802b3c05db9c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dd9d5d4208, %r1, %r6
	setx	0xfdae0f78b3313371, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e3831780c2, %r1, %r6
	setx	0xbf2325c570811d7d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xbf2325c570811d7d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f80edf690c, %r1, %r6
	setx	0xfe411f2d871c1f74, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xfe411f2d871c1f74, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d318a29016, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8c3b1982e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0xfe411f2d871c1f74, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ff18032, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e733bf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe401a070  ! 233: LDUW_I	lduw	[%r6 + 0x0070], %r18
	.word 0xacb98008  ! 234: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe8218008  ! 235: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000804073de30, %r1, %r6
	setx	0xdc6f189eab76ffbf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800edde13c, %r1, %r6
	setx	0xfa45c83ba07efab2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f35ef60, %r1, %r6
	setx	0x7b4ab281400c4e71, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c44ac857bc, %r1, %r6
	setx	0x9725ea4ea389b0a5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000debc6b7abc, %r1, %r6
	setx	0xa2fe6fa6a872777b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e792f33920, %r1, %r6
	setx	0x915146fd787453f4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x915146fd787453f4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa84f87a28, %r1, %r6
	setx	0x8de4a6f63e499305, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x8de4a6f63e499305, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001030100000, %r1, %r6
	.word 0xec598008  ! 240: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xaa818008  ! 241: ADDcc_R	addcc 	%r6, %r8, %r21
	.word 0xe0218008  ! 242: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080be4ef622, %r1, %r6
	setx	0x658fe01d8324c3c2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e42572a, %r1, %r6
	setx	0x6d038e1b1b89b6c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f8ec44c, %r1, %r6
	setx	0xabda9c9fb33ad726, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7b742b6a6, %r1, %r6
	setx	0xba83521639540fc8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de958e9a6c, %r1, %r6
	setx	0xdc3b84be562ea807, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e74fc35b38, %r1, %r6
	setx	0x84f5a5159d91648a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f4156c2104, %r1, %r6
	setx	0xf0429a353e4dab87, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e4f3e5eec2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe4518008  ! 247: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa4918008  ! 248: ORcc_R	orcc 	%r6, %r8, %r18
	.word 0xe831a070  ! 249: STH_I	sth	%r20, [%r6 + 0x0070]
	setx	0x00000080c560dc2c, %r1, %r6
	setx	0x5d8416dbefddd2ed, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec84072, %r1, %r6
	setx	0x9249c09824d073f7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800facefcc, %r1, %r6
	setx	0x5b184202a991e44a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ce00b37fb4, %r1, %r6
	setx	0x389e96f10eb40fa3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d390612ea0, %r1, %r6
	setx	0x572f5653d6f8ada1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e06dace13e, %r1, %r6
	setx	0x4eda5f0a7e781cbb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fe7d9dffc8, %r1, %r6
	setx	0x0a5d62fb3e873fd4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x0a5d62fb3e873fd4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f35ef60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0x0a5d62fb3e873fd4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800edde13c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0x0a5d62fb3e873fd4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000804073de30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f80edf690c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3831780c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x0a5d62fb3e873fd4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dd9d5d4208, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c41ca72c08, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010a0100000, %r1, %r6
	.word 0xe0198008  ! 254: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa2198008  ! 255: XOR_R	xor 	%r6, %r8, %r17
	.word 0xec39a070  ! 256: STD_I	std	%r22, [%r6 + 0x0070]
	setx	0x00000080887eaca4, %r1, %r6
	setx	0xa9fa45d9a18249a4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xa9fa45d9a18249a4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e17271e, %r1, %r6
	setx	0x436a94e485411d02, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb3bf80, %r1, %r6
	setx	0x0ab1dfa912680b00, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x0ab1dfa912680b00, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000cd6c85ebbe, %r1, %r6
	setx	0x7b7ad6cf7b54cb9b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000deade57e16, %r1, %r6
	setx	0xc933a3a07ed6ab8b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea086211ee, %r1, %r6
	setx	0xe1fc8d3f9c5cb0af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f65f540d46, %r1, %r6
	setx	0xb51c1bab3c4f2e32, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	.word 0xe8498008  ! 261: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa6b1a0a8  ! 262: ORNcc_I	orncc 	%r6, 0x00a8, %r19
	.word 0xe021a0a8  ! 263: STW_I	stw	%r16, [%r6 + 0x00a8]
	setx	0x00000080a5224262, %r1, %r6
	setx	0x37c9438ee82788d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e75917a, %r1, %r6
	setx	0x73217c4c92908077, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe777f4, %r1, %r6
	setx	0xea1c3e64dca29591, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c88e5be000, %r1, %r6
	setx	0xb77b541b78cc1cf0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d714e98fba, %r1, %r6
	setx	0xdf95fadee0eb03a1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xdf95fadee0eb03a1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e0ff3740c2, %r1, %r6
	setx	0x23dec1187460f028, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x23dec1187460f028, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f297100bba, %r1, %r6
	setx	0x36e554cb26e889a7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080c5df6e5c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0x36e554cb26e889a7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f2414b7828, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ecb9c4c70a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d41d9c1134, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb8ae1599a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe001a0a8  ! 268: LDUW_I	lduw	[%r6 + 0x00a8], %r16
	.word 0xa429a060  ! 269: ANDN_I	andn 	%r6, 0x0060, %r18
	.word 0xe0298008  ! 270: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000080536e9cc2, %r1, %r6
	setx	0xa72af16e131e22de, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xa72af16e131e22de, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e337710, %r1, %r6
	setx	0x9d6d833c64b57abf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x9d6d833c64b57abf, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f9d1c4c, %r1, %r6
	setx	0xcd4adac70d871be1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c6a74a514e, %r1, %r6
	setx	0xb1556c6e8af99da2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000df752c4174, %r1, %r6
	setx	0xe06e3f339be345d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e7b5c4a112, %r1, %r6
	setx	0x4415f1c203883b43, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x4415f1c203883b43, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa63cdc856, %r1, %r6
	setx	0xcf602deae4db877b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec06758900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xcf602deae4db877b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d6ab215f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2c8bcd6b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0xcf602deae4db877b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f1738f6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8ae67a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xcf602deae4db877b, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080af621d54, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	setx	0xcf602deae4db877b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe0118008  ! 275: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa899a0a8  ! 276: XORcc_I	xorcc 	%r6, 0x00a8, %r20
	.word 0xec21a0a8  ! 277: STW_I	stw	%r22, [%r6 + 0x00a8]
	setx	0x00000080b1655652, %r1, %r6
	setx	0x6220d944728aa03b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e09cf12, %r1, %r6
	setx	0xce4842cf9d4d1c75, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fcfdb6e, %r1, %r6
	setx	0x625760921e09ba6c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x625760921e09ba6c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c99b25508e, %r1, %r6
	setx	0x9ecd9834c428bd89, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7da871e62, %r1, %r6
	setx	0x14849920302d31a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e415efde62, %r1, %r6
	setx	0x9789582c49924c07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcebabab10, %r1, %r6
	setx	0x0bc4355b5df44578, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x0bc4355b5df44578, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000080a267bb12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f44e558fd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec06758900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6ab215f70, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x0bc4355b5df44578, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c2c8bcd6b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe0418008  ! 282: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaec18008  ! 283: ADDCcc_R	addccc 	%r6, %r8, %r23
	.word 0xe431a0a8  ! 284: STH_I	sth	%r18, [%r6 + 0x00a8]
	setx	0x000000806300ea1c, %r1, %r6
	setx	0x85f4ce8be746959a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e687c66, %r1, %r6
	setx	0xa2bc2b8887f98cef, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xa2bc2b8887f98cef, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f8fe810, %r1, %r6
	setx	0x00235788a97225ac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c0a146bef8, %r1, %r6
	setx	0x5dddde62254ce81c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dcc8669814, %r1, %r6
	setx	0xcc8da9bdbae04ad4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xcc8da9bdbae04ad4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000eee01f5b4c, %r1, %r6
	setx	0x30307d80f8549bca, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f66dc479de, %r1, %r6
	setx	0xd19161d1d54e6837, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8d061871a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed3df0ff40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0xd19161d1d54e6837, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d00e4f6896, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe449a0a8  ! 289: LDSB_I	ldsb	[%r6 + 0x00a8], %r18
	.word 0xaab98008  ! 290: XNORcc_R	xnorcc 	%r6, %r8, %r21
	.word 0xe421a0a8  ! 291: STW_I	stw	%r18, [%r6 + 0x00a8]
	setx	0x00000080d50d1fbe, %r1, %r6
	setx	0xa171f65facf573bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800edc7c32, %r1, %r6
	setx	0x056462e784b88996, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb035ba, %r1, %r6
	setx	0xa097adc13b8bd448, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xa097adc13b8bd448, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cc5d12a716, %r1, %r6
	setx	0x42b0f631b58a1497, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x42b0f631b58a1497, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d30d3df776, %r1, %r6
	setx	0xfd52f45d643307a2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ebfc8b563e, %r1, %r6
	setx	0x67286144df28ace7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x67286144df28ace7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000feda4563f2, %r1, %r6
	setx	0x0a52263482b0108c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x0a52263482b0108c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c626a78404, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x0a52263482b0108c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x00000010f0100000, %r1, %r6


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
	.xword	0x49474d0fbee6c51b
	.xword	0x0028f8363d591743
	.xword	0x99533c5090a25204
	.xword	0x529156e5abbc5e7e
	.xword	0x3194bb00d82b2f02
	.xword	0x16ba014aee7f3b2f
	.xword	0x2387f62197379ce9
	.xword	0x59c97392c88cf3cc
	.xword	0xcb60620089d1e2a5
	.xword	0x1b38f9193ae9170b
	.xword	0xe96294ca6808dd48
	.xword	0x15872d9845ac8b3a
	.xword	0xf3e5d70c0b409c19
	.xword	0x535966c30c5a9a0a
	.xword	0xb185f900b97027a9
	.xword	0xa5602484619a280a
	.xword	0x5c5e73fa0fece937
	.xword	0xb4f188968505ca81
	.xword	0x458e11667c1aa6ea
	.xword	0x1f80428950a900d9
	.xword	0x1bc21a3f97c47412
	.xword	0xeb5025a9b678580f
	.xword	0x9977cc740d293a53
	.xword	0xe99e36ec1de22366
	.xword	0x2c0e54c4f02d411e
	.xword	0x0ccd49aec8a98262
	.xword	0x38b31b4e95c8540d
	.xword	0x7f979751803b2b92
	.xword	0x5d58616003ea0701
	.xword	0x492dabe0fd34dd70
	.xword	0xdf2467fcf0e2330d
	.xword	0x702789b1cf611817
	.xword	0xa8e55dbb3c6af900
	.xword	0xb45c0a95624bedc6
	.xword	0x58e3cc72b1d91e89
	.xword	0xef14a6f9a18995da
	.xword	0xbf903a3494f342f9
	.xword	0x95b5dc9d45b39522
	.xword	0x8f14c6f3198b35b5
	.xword	0xa208f80730d772c5
	.xword	0xf3709a7347c16ef0
	.xword	0x20c8276072f469f5
	.xword	0xfb74f946440ee3c3
	.xword	0x55e6828387fee0ae
	.xword	0x2391825d8247848e
	.xword	0x00ee5f07b2d404de
	.xword	0x738da771aeefc80b
	.xword	0x628e78651c749950
	.xword	0xcbe65eaf445c9bb0
	.xword	0xebee23ca19b501bd
	.xword	0x87ac787a1a205218
	.xword	0xb691404bdf4f4b91
	.xword	0x86185365b8eda6f2
	.xword	0x1ac32a43456146bc
	.xword	0x88ddcf7efccadb39
	.xword	0xacbfe36d87f62a10
	.xword	0x0aea7df101cf6620
	.xword	0xb1cc36517fb3c923
	.xword	0xa0f56d30bd11fc1b
	.xword	0x9cc8bbd178de22e7
	.xword	0x83a2eb7b681b5419
	.xword	0xa8e2cba331beeda1
	.xword	0x0798b182488c9e85
	.xword	0x5227389420b800bc
	.xword	0x3f29dda32acef59b
	.xword	0x3b3ebefe721a2cfe
	.xword	0x9b4763d0cf78d26a
	.xword	0x07694962dfde5f3d
	.xword	0xa771ce5767166db7
	.xword	0x6d64ceafb0a9003d
	.xword	0x107ac22125fdb983
	.xword	0x16dbe0eb0bbd45ce
	.xword	0xca2cda70e576b474
	.xword	0x096561afb8bb834b
	.xword	0xb2372071027a4138
	.xword	0xca810a79f8bd292e
	.xword	0x703a0a54bad35bf2
	.xword	0xe506d3ab53bc9b5b
	.xword	0xed3812e5eabc9d6e
	.xword	0x1c021bf02b2a8f7e
	.xword	0x599524e530a263a4
	.xword	0x3539dedbb6ecbd38
	.xword	0x574ccd2a614e6c42
	.xword	0x2ff478a7519aa298
	.xword	0x85c4024492a42b9c
	.xword	0xb458a8cb56490df7
	.xword	0xe2aaf5a088184e1b
	.xword	0xea0e3f1da6041324
	.xword	0x8450102d62824caf
	.xword	0xe6a47bbe86c11420
	.xword	0x09cafce70a8150f9
	.xword	0x6c76acfe8f411828
	.xword	0xf3710ad389201bc7
	.xword	0x084fdd4671615b23
	.xword	0x296331259a935b38
	.xword	0xb3984b10b64b1d71
	.xword	0xa7d3ab7596bda564
	.xword	0xea7acf10f3281704
	.xword	0xf02178284b60153d
	.xword	0xd4b97db720a1183b
	.xword	0x1cb53f1681718745
	.xword	0x5e2557f2923ee0e2
	.xword	0x80aa81ab71883f72
	.xword	0x95cbdaf159f14dca
	.xword	0xf53b436bf05e8409
	.xword	0x2015e32b7b13b278
	.xword	0x75d25db5a1c2bfcf
	.xword	0x012f9a3f9f02f1a6
	.xword	0xa677edd4aff3db94
	.xword	0x4b641a16da7043d9
	.xword	0x4fd8ed81ed90844c
	.xword	0x70ab2073572e6176
	.xword	0x4246e5e5e3549729
	.xword	0x65be470d24270e79
	.xword	0x91eb4374333f3a12
	.xword	0xa6fe458db8f166b1
	.xword	0xe967cde98e796991
	.xword	0x5136a27140aad5a3
	.xword	0xa94f3babeb643efd
	.xword	0xbc8861843be4b87f
	.xword	0xe0e7fe42545974c9
	.xword	0xe64f6e1a10b8454a
	.xword	0x9c95c66dc32722e9
	.xword	0x865638570469d4f2
	.xword	0x300c00a755d36e9e
	.xword	0xcdf9f73290643576
	.xword	0xdc8c4cbcd02ac2f6
	.xword	0xb28386be49384fae
	.xword	0x1dcd999e067ed2a7
	.xword	0x9e04e4bec2f4ce97
	.xword	0xb51066b70503e16a
	.xword	0x2adb34f710c7b551
	.xword	0x8507cf9e7716f1b6
	.xword	0xfbb8ef21fee95441
	.xword	0xb9246ae5e8da1872
	.xword	0x7d08122491c460f9
	.xword	0xecc7cacfaff7cee8
	.xword	0x2bc51eaeb88842df
	.xword	0x4a3bd2d4dbaddce0
	.xword	0x5a8f9c7b2f42521d
	.xword	0xcce38551d88fb4c7
	.xword	0x60067cb5c97cf09b
	.xword	0xdbdc1f1a49ca598f
	.xword	0xa3a80e119761659b
	.xword	0xbc539aa916b5d380
	.xword	0xd96613641e454237
	.xword	0x5de3268a38dfd8ae
	.xword	0x7d751adb89ea6985
	.xword	0xf0a6b4bfc52b3b06
	.xword	0x74a81445953c3f20
	.xword	0x8cbc0377254c75e1
	.xword	0x24c38f89456b18de
	.xword	0x53233f1a36ee31f6
	.xword	0xbb03eedc86609cbc
	.xword	0xc40411180cd75fef
	.xword	0x6b07c631bf4ba77b
	.xword	0x8de13a07dbdef05e
	.xword	0x4d7f508b186be1e2
	.xword	0xfefe32e2a0a2dfa5
	.xword	0x9e7e149715bda871
	.xword	0x482e0e3152449c15
	.xword	0x460670b495a65035
	.xword	0xba61ac8d24f91748
	.xword	0x63c2920379432121
	.xword	0x70246209b9e90c63
	.xword	0x9fd7ed320e79f621
	.xword	0x065dc769a663150b
	.xword	0x1bdaeca0f1310272
	.xword	0xe97d03a6aea5b4e9
	.xword	0xdc56c97d016ea795
	.xword	0xead15baba9eeb695
	.xword	0xd7e3d3577e67de24
	.xword	0x9ba58d3466dc65da
	.xword	0xcadac8fcf9e0f521
	.xword	0x259bde61d9158df5
	.xword	0xdf597f0c85c1ae29
	.xword	0xc1a9839432a81eb9
	.xword	0xc23aefc0872bb4af
	.xword	0xb0c501a7cf2d066c
	.xword	0xb8a17cb60fee5a8b
	.xword	0xf6c3d131a155aa05
	.xword	0x9662ccd099f6e10b
	.xword	0x354f4be6f2a09922
	.xword	0x2db66b10823999e8
	.xword	0x90ce7331a747a737
	.xword	0x100bafcfe84b7eb1
	.xword	0x5b5ad9d97cd4d35e
	.xword	0x6314bf79670d92cf
	.xword	0x7ac4fa0301be0b2e
	.xword	0x155c7ddab758752b
	.xword	0x473894f75efc2a36
	.xword	0x74f4ef7623e504f9
	.xword	0xe0b9cc9a124cc6c5
	.xword	0x811b150d75fec062
	.xword	0xdf55ab8d6f6170e8
	.xword	0x3ee218685577b388
	.xword	0x27493997fc2a1eba
	.xword	0x4ba911b5f38061a8
	.xword	0x24644436b0a6eb79
	.xword	0xf75dca0ef31e1def
	.xword	0xb813070fa7bd2cb9
	.xword	0x2223e823e3480ab2
	.xword	0xe0cc807be93d98f4
	.xword	0xc96ed0c31f9fc811
	.xword	0xc6c0965b31e09672
	.xword	0x86cef16b838322f9
	.xword	0x979c49ff2c3d631e
	.xword	0x440ae6200c242a50
	.xword	0x05979db8511e2ae3
	.xword	0x880008c46b5eb15c
	.xword	0x90a11108f2de56df
	.xword	0x9f8dc582a34c3582
	.xword	0xcbf8c78d1a509cf0
	.xword	0x2f11582ccb599c63
	.xword	0xc7b02350f1b9b6be
	.xword	0xa211d99a59eb7644
	.xword	0xc9a19780975730ad
	.xword	0xa77f6c6e7f1564fa
	.xword	0xa1237db718ca8ca7
	.xword	0x31d445865c11f504
	.xword	0x60e7095fb4c91bea
	.xword	0x61f83ae4d5dc133d
	.xword	0xa81f139e67558e50
	.xword	0xbdfca885c7d59ffa
	.xword	0x717e2bc89d53c64f
	.xword	0x5f2ecdafee6c69c6
	.xword	0xf257764ce91d0f59
	.xword	0xc4f908c147d9b88f
	.xword	0xa7f86a08bcf12b7a
	.xword	0x26ae785f32c39438
	.xword	0xf8f07afb48cf9bc3
	.xword	0xc50b2b39d777465a
	.xword	0x5cafdc8f45f148a7
	.xword	0x85749c8f119d74f8
	.xword	0x9a69d9178a2adc62
	.xword	0x92cbb2e52912ff1c
	.xword	0x05855c3dede3f705
	.xword	0x7640e079d111184d
	.xword	0x933af2e5ad28f912
	.xword	0x874ca1967b781643
	.xword	0x8e6b9a5074f9cb0a
	.xword	0x68b8cac779ac8759
	.xword	0x7718daf60beb7fd4
	.xword	0xf3e24e37cfdc182b
	.xword	0x44aa317c661cbd4b
	.xword	0xd9f13960446ff9a8
	.xword	0x7442a83001d12959
	.xword	0x0813bfa9a9f38860
	.xword	0x20f5dd35a6500d25
	.xword	0x89ed32985adf9321
	.xword	0x86fbb052218e0354
	.xword	0x2ebb23640f875d07
	.xword	0x17ba766eca13ed22
	.xword	0x0ded4c5fd0a0f6c1
	.xword	0x9ae6c70d57b54385
	.xword	0xb6d66600f82f6ea3



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
	.xword	0x8dabe5e6dec63ea6
	.xword	0x83fc5118aebf5595
	.xword	0xeb0f73695ae09a0e
	.xword	0xa6955c08f3c5dc35
	.xword	0xd1a58fba5d4f13bd
	.xword	0x7ee3ac0241ac35d2
	.xword	0xb34cc65ac9da6ea5
	.xword	0xc1d87c97dabb2fb5
	.xword	0x9d72abdae095d90b
	.xword	0x5536bc87e3d56c7a
	.xword	0x7a15b6221a70d71a
	.xword	0xd8aa6369aba63594
	.xword	0xd96aaef40391e0f4
	.xword	0x35b009f26df6299a
	.xword	0x2d8e6a086a34170d
	.xword	0x14bb8061fd00bf37
	.xword	0x0de0e2ce741053b1
	.xword	0x5b094242d3e241cc
	.xword	0x7625fb4902eda902
	.xword	0xf9be025123bb245a
	.xword	0x98ef2fc7b4f1b895
	.xword	0xae74106e1abbb305
	.xword	0xe1196762559b084f
	.xword	0xb608ad98ba6850a2
	.xword	0x7562ea55d3518e7a
	.xword	0xd29ddbbdfb9beba0
	.xword	0x7e9f00046e799a3e
	.xword	0xe50e20f267fc1431
	.xword	0xe8a7c0a12913a97b
	.xword	0xbbb2e825cea348b5
	.xword	0x8d153513b58ed4c6
	.xword	0x64797aec106c7f7a
	.xword	0x7a36ea30780e7e2c
	.xword	0xe2ac46732bc2b0c4
	.xword	0xce0846f55e5abf5e
	.xword	0xa83611ad5e885a68
	.xword	0xbe73b1ac523ca9ba
	.xword	0x7226e2b0651c6345
	.xword	0xe192c4788341a826
	.xword	0x0bf894320b391a53
	.xword	0xbfcc6405b2748227
	.xword	0xf34faf5d67725fe2
	.xword	0xf8a774e655a396cd
	.xword	0x7f327d69a6786b3f
	.xword	0xdfcfc1b2d7e5a216
	.xword	0x3b7b8839190ed2c5
	.xword	0x5c49862f4325a983
	.xword	0x775a7d30ffe3c629
	.xword	0xa14d599bfe3c02cf
	.xword	0x63b7f7ca2feecde7
	.xword	0xf10186475ff0dae8
	.xword	0x2c636912c0ce80c6
	.xword	0x5778779be9dfca17
	.xword	0x1dc7ddccab2638df
	.xword	0x7a81c85de20e1f94
	.xword	0xb89a1a22a6fb1780
	.xword	0x0b81440ce03869d6
	.xword	0x02773366aa6c1bae
	.xword	0xaf1dd4f3692fe46d
	.xword	0x2fd3654bb3dbadc6
	.xword	0x9a9d4395cb6dd3a3
	.xword	0x5d62f5a1b382f272
	.xword	0x0d418c6a0eee705b
	.xword	0x96654f60fc8f61d4
	.xword	0x517b763907bbe0df
	.xword	0xa64fa011dc651cb3
	.xword	0x0b52c9f52c3252ac
	.xword	0xf6d75461739c166c
	.xword	0x5af5d46dd33539c0
	.xword	0xcc5d1d75cbf74828
	.xword	0x44989f64e4354280
	.xword	0xbc6dad99624e9c1a
	.xword	0xee26e1cf2376694f
	.xword	0xb55d80a85994e02e
	.xword	0x392bcdcf082414d0
	.xword	0x09cbe971911050dd
	.xword	0x79f6252edcab0c89
	.xword	0x6fd084d88f0b130b
	.xword	0x42f63fed9754e863
	.xword	0xc40f5a4e230fa382
	.xword	0x53e0b56d8d443002
	.xword	0x16b75a1b71d5a8cf
	.xword	0x3871b3bd7db6a030
	.xword	0x53cdc2c12e385e02
	.xword	0xa7f4c605a5a49ffc
	.xword	0x76898e203d94e2b5
	.xword	0xf55c801645867c23
	.xword	0xf76a4b45b2a35948
	.xword	0x67165c13d2321e00
	.xword	0x49a56b447027403b
	.xword	0x1cb49c005d19bffe
	.xword	0x29d35183763ebafe
	.xword	0x4a2da637395a1d5f
	.xword	0xec705435b5946bff
	.xword	0xbefabbbca491933e
	.xword	0x7ffb2316792de171
	.xword	0x81911a9ed0817def
	.xword	0xca17847448bd7435
	.xword	0x7f9f8522bc4b01df
	.xword	0x8fc97815df9ac1ba
	.xword	0xe42c7382b0130f4c
	.xword	0x949bccb87c70c42d
	.xword	0x28cb5027be8e7504
	.xword	0x0a6933fd8f95aff7
	.xword	0xc16f0c1e2c8b5f67
	.xword	0x049a6bbc2a27c2d9
	.xword	0x8235fc93e256519a
	.xword	0x1686db75ccd0e1a7
	.xword	0x98951a4decab5711
	.xword	0x635920351bba1054
	.xword	0x3ba26911cd297e84
	.xword	0x3db1e11e5e4e0b77
	.xword	0x58d099375854c179
	.xword	0x06de8ee1c20eee49
	.xword	0x61a117c24adcc1cd
	.xword	0xb5b37d71746f4add
	.xword	0xc87b3f370e7eb7dc
	.xword	0x7c22b9228a41e363
	.xword	0x2fd00e57a893335f
	.xword	0xac740e14825d3266
	.xword	0xaac6dc6056f248ce
	.xword	0x1a8b0f40ba9e32ab
	.xword	0x4adedaa1c66eedee
	.xword	0x5127f05fb39c9c15
	.xword	0xcc529ae612c837b3
	.xword	0x5762096e57810cf0
	.xword	0xa85a32a1d0c5cec0
	.xword	0x45152775ddec9ae5
	.xword	0x8f7da0246c4e2cdc
	.xword	0xbfdb61c405b1da70
	.xword	0x884c46a8c563effb
	.xword	0x3839c57d37280b23
	.xword	0x4238b1c679f9a715
	.xword	0x9ee46ba9f7e176d1
	.xword	0x040545323e9a198e
	.xword	0x6ef88417d017d5b8
	.xword	0x1c61b28246134ffa
	.xword	0xe4fde5c8aedff18b
	.xword	0xa26b3a2aa30c44ce
	.xword	0x12c2d830a919f09c
	.xword	0x1b17bed3741c2047
	.xword	0x847877c485122b48
	.xword	0x5688a60605e9ccd6
	.xword	0x9f82af24fee0151d
	.xword	0xf4700105fa8c885b
	.xword	0x64502f5f32e923b6
	.xword	0x6f61bb6f4d625b61
	.xword	0x5e9b0c3bd3c16241
	.xword	0x315da3b77867c4bf
	.xword	0x85c3366fff969dbe
	.xword	0xd7ac546742035120
	.xword	0x3a70a0207b2a07f1
	.xword	0xfa23f7472499e3cb
	.xword	0x3b098b93de92cee3
	.xword	0xd98bc7802825f28b
	.xword	0xde9537ec990afbbb
	.xword	0x5e08ee0b0c32a2d8
	.xword	0xd3ef1ddf4e8c69fe
	.xword	0x1db35f2f988d6abb
	.xword	0x8230c4e7cc1dfb06
	.xword	0x9482f1362360514b
	.xword	0x0a7ea23be1f20513
	.xword	0x474d7f81cc703026
	.xword	0xe95d8cc144655763
	.xword	0xd38c08863a4c6757
	.xword	0x3835959a37818097
	.xword	0x4ea5c75ce79a1287
	.xword	0x8e50dd006488b22a
	.xword	0x0241fa0946291442
	.xword	0x4803a5613434d726
	.xword	0xfe2b357230c1df7d
	.xword	0x06a644aaf1815cc9
	.xword	0x4dad11dafd5c9e18
	.xword	0x1462846bca2e2e68
	.xword	0x9c72729e6d5187b8
	.xword	0xbc42400311629711
	.xword	0xb823f8ee10bccebb
	.xword	0xb22dd04f43d23162
	.xword	0x29b5a9df52829dcf
	.xword	0xb6c9947ce8b5c741
	.xword	0xf59340dbc79fba88
	.xword	0x4a04b08c252e8acd
	.xword	0x4c45e70e6f5e964b
	.xword	0x48597604676f5448
	.xword	0x14364b2ba61144aa
	.xword	0x4fe982c07103dd37
	.xword	0x22a062dda64f6987
	.xword	0x260b97422a3e20c5
	.xword	0x27cbf2919e30aca0
	.xword	0x30b27cb4e2246d14
	.xword	0x46a4b39de91f6dc7
	.xword	0x05bc6364b5464cfc
	.xword	0x0cbd09a2c2da103b
	.xword	0xc582c962ab9a3e8f
	.xword	0x7d00c7de22655c9a
	.xword	0x73ea35f2da326a1a
	.xword	0xd1ea6345378dbb48
	.xword	0xcadf58b698b05c7b
	.xword	0x1164baa43c6f8c8b
	.xword	0x10ad3182f37998d3
	.xword	0x8963503f1e0e9229
	.xword	0xa2595634acdb0c8b
	.xword	0x7f6efd2d20666aeb
	.xword	0x0c9d3f7a91e45b40
	.xword	0xabd50e024203e0fa
	.xword	0x0105cfdd3b76ec6b
	.xword	0x418d2ee62dd0a3d7
	.xword	0xff65e3132bb14b02
	.xword	0x30a7cd3bc240b56b
	.xword	0x504307618cb54e11
	.xword	0x0a2314ad0c437cc4
	.xword	0xfb87ca078775998e
	.xword	0x32008800e1f613f3
	.xword	0x6a591f675d969cc0
	.xword	0x1e56bc47334775a4
	.xword	0xa02f8364466c2f73
	.xword	0x27248eefb21f4bd3
	.xword	0x7ccfacb0a866964f
	.xword	0x150916607db89439
	.xword	0x33f4fa3940102e16
	.xword	0xdde332f345dd172b
	.xword	0xd652b10e352e0f65
	.xword	0xa9d2b51147f60a33
	.xword	0x0e7b701f28313880
	.xword	0xd5eb49b7824c2860
	.xword	0x8aa67d572faa1a4e
	.xword	0xd01020e7f344c19f
	.xword	0x54c62bc0fb678fda
	.xword	0xec04d2e97f5a7abc
	.xword	0x5e37a076ede7d667
	.xword	0xecffc95484419b29
	.xword	0xad487f2a5dd9e56a
	.xword	0x01779e3e00fa202d
	.xword	0x33bcf0ec0aebba11
	.xword	0x14493ece6c800cdb
	.xword	0xfafe4e0d98c53b7e
	.xword	0xc6a8de99c6adfe55
	.xword	0xea9688068460b14b
	.xword	0x7bcdf4dae405e232
	.xword	0xb55a7e5e46e62fbb
	.xword	0x17aa374af4a2a15b
	.xword	0x00833107c9db0d5e
	.xword	0x8aa7c0b53c3104bc
	.xword	0xa18b32e2a2a533d8
	.xword	0xda49b71027d79b60
	.xword	0x4b4a5bbc42083f30
	.xword	0x4382155e6f604783
	.xword	0x3a88ebca97a3f42b
	.xword	0x2b1e77eb1698ad0a
	.xword	0xb653e348feab6d38
	.xword	0x36e7c45a24fcc770
	.xword	0x5fc936703b0de11a
	.xword	0xbe90a7981ae25979
	.xword	0xc573b29912920720
	.xword	0xa2419eadb56eeca3
	.xword	0x4d253114e2b39d78



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
	.xword	0x60c0e33e0cccd526
	.xword	0xe388db9f7d053c85
	.xword	0x4aabc523ed32b9d8
	.xword	0xc4aecfee012e7954
	.xword	0xeb40f7a97c4bb6e4
	.xword	0xff6d0162ce74a724
	.xword	0xf6502d509cf3d2d6
	.xword	0x66a0e2efd7c6e301
	.xword	0xdc2dd82297283d9b
	.xword	0x468c50ee4a7c5c51
	.xword	0xcef4162e240f5d73
	.xword	0x102be303fde58f72
	.xword	0xa080dd38c4e14194
	.xword	0x5b8945e104f30e9f
	.xword	0x53a01bc0985cbc14
	.xword	0x228b2065be8cb539
	.xword	0x9b5fdee4653ee4b1
	.xword	0xf77479182a775174
	.xword	0xc0fd4e977e462fea
	.xword	0x9743f8cbd14fefce
	.xword	0x795e0d75d5ef7832
	.xword	0x202a38b4cda401dc
	.xword	0x1425f53821301506
	.xword	0x904c82faeb0ecd9d
	.xword	0x9ec67261a6c16c60
	.xword	0x6544c8a015f32b9c
	.xword	0xf3daed684b03ec45
	.xword	0x4ab993e10437a9f8
	.xword	0x5c614d700befa5c4
	.xword	0xe738fa2c4b0df4be
	.xword	0xc8f3ddc0485632d8
	.xword	0x60b130db10330069
	.xword	0xc372fb42b3a440e0
	.xword	0x22d7bf2613f79d62
	.xword	0xf0dabfde276707ba
	.xword	0xac64bd45a6b289f2
	.xword	0xff20de74adb03ea8
	.xword	0xfdacbc6dfded60b1
	.xword	0x9e157c899373a2aa
	.xword	0x05daf6d9d5ce98ad
	.xword	0xbfa08cd9e72be0a5
	.xword	0x412b44cda9cc8ff1
	.xword	0xc173c7ca228d02fa
	.xword	0xcec8c4e043191612
	.xword	0x371d76f8e0aa7dc4
	.xword	0x292f324e04f59673
	.xword	0xa8bf37918fc70567
	.xword	0x643e589606274a97
	.xword	0xd88f87dc65bb5788
	.xword	0xf29849234bc1ed25
	.xword	0xb618c028000a6dab
	.xword	0x5bb840ff61794481
	.xword	0x8e6bd06f2a29695a
	.xword	0x44ca1b193a2c56e3
	.xword	0xb0084c3b3d96a92c
	.xword	0x9f2d64b4c175e846
	.xword	0xaced0e0fe1b1bfb7
	.xword	0xf8d8804800b5b344
	.xword	0x0df9a7598bedb925
	.xword	0xa366c32858cff9f4
	.xword	0xdf4165a661e2241c
	.xword	0x148a668bd0447eb2
	.xword	0x4a85c975dff31103
	.xword	0x7686d58fa060c9c8
	.xword	0xb63b6da8ed988f55
	.xword	0x83afe099f2a6d9c2
	.xword	0x6b1e33ee309d0891
	.xword	0x077a50f47df97287
	.xword	0x663c92f1dae2e684
	.xword	0x571f7762fda820eb
	.xword	0xcde4d789063005f8
	.xword	0xe8fd8d5d3b281e9f
	.xword	0x64b9457e2fd5c3db
	.xword	0x8c3461d7c7ee841e
	.xword	0x7b9d0e1fca416f12
	.xword	0xa5c999f219e672a3
	.xword	0x60b0aaf1f2d0aad7
	.xword	0x2974c90b7f8eab2e
	.xword	0x0aa2b7fce03a4df9
	.xword	0xedbbce066442811a
	.xword	0xcb699d0e69df3b66
	.xword	0x4b3ebea7fe46541e
	.xword	0xa3e086379a791c8d
	.xword	0x3c657320b106bb8c
	.xword	0xbc774979e39f33f9
	.xword	0x039e29903b08e87d
	.xword	0xf8937732a5d2cc39
	.xword	0x865ea8404cf864c2
	.xword	0xc8f82b2fb52f1c81
	.xword	0x0a6dc40ef98f1a56
	.xword	0x30ad7371cd6e11d1
	.xword	0xeb29e4495de1c234
	.xword	0x665f0bca481c4ec3
	.xword	0xba1241a0b5f4f033
	.xword	0xace2404b6ae3801f
	.xword	0x365ebe7e44f54cfc
	.xword	0x7b92ef7682458728
	.xword	0x5d7a661bd6e24919
	.xword	0xf72c5afab1aa1c04
	.xword	0xfcf6eba215748654
	.xword	0x123e815e528e6532
	.xword	0x4cc2a54bf1271f28
	.xword	0x7b864935c2e71e05
	.xword	0x53b4874e43c74236
	.xword	0xaeff0f97e8d454c6
	.xword	0xafc1ac26a7192002
	.xword	0xe627afd102433ed0
	.xword	0xc72c0654ee710634
	.xword	0x4ffef2f7a40f497a
	.xword	0xa24005cd1a2516f7
	.xword	0xe7f9904037fe4a26
	.xword	0xd11cd5a87f645ca5
	.xword	0x195578ad7b89c43c
	.xword	0x47664f7358fc3623
	.xword	0x70f8cb1c43c6dfb4
	.xword	0x295e4d93ec28279a
	.xword	0x8b4f3fb1988a2f49
	.xword	0x2e70568c4ba79151
	.xword	0xab9be919e03baa27
	.xword	0x21c6ce242082e2ab
	.xword	0x09539ce53579a0c5
	.xword	0x1cd4c320d43d5f6c
	.xword	0xe4a01494075c053a
	.xword	0x44f9aa26bb649d7a
	.xword	0x0b9ee66748a7f8a4
	.xword	0x7c715c13a0d6cb74
	.xword	0x22aa5444e037af7b
	.xword	0x340334d66ed9aece
	.xword	0x57c86c819b7d2b87
	.xword	0xc4a3f04d23562995
	.xword	0x8f5358db8cbf7d7d
	.xword	0x06ce3a26c752d879
	.xword	0x9decc278877c65ce
	.xword	0x3c98b1f42647dbd8
	.xword	0x6f4f9a37de0a4d99
	.xword	0x241858b35b8f4fdb
	.xword	0x4a9c5263f3dab2b5
	.xword	0x2ea1bf16b120f94b
	.xword	0x0c94774c1911e679
	.xword	0xff6d833976c6a76e
	.xword	0xd20c3363bf5ee28e
	.xword	0xfecf5b2d6c3558de
	.xword	0xe9583f1f6a3428b2
	.xword	0xa8a5504361e2e95f
	.xword	0x40239652a49fad30
	.xword	0x24cf28591f801994
	.xword	0xdf718fbaec066cfe
	.xword	0xd0a8c495e1808f9a
	.xword	0x9a614f159a7aea40
	.xword	0x855431c158d32183
	.xword	0xe193c1d1b3b970d7
	.xword	0xbb24b8fd234d378a
	.xword	0xb5af1afc2aeac0bd
	.xword	0x4ad9036dc6ffa9b7
	.xword	0xfc8c1d7a87efda50
	.xword	0x0fa035d8cab06998
	.xword	0x225febb27f978a02
	.xword	0x845ba3414f7c826e
	.xword	0xb55f29ff06dae4d3
	.xword	0x9fec3df1380448b8
	.xword	0x12659b294ac42a71
	.xword	0xbba5afb180b5efb4
	.xword	0x4a2fbab135bf45f6
	.xword	0x7ccb0ac67440c7fd
	.xword	0x4e55d1aece0f63c5
	.xword	0x41d757f2f0dc500a
	.xword	0xdef631807a9aabf9
	.xword	0x0dbdba6c232110c7
	.xword	0xcde7992e760b1443
	.xword	0xbbbfd288bdc939fd
	.xword	0xe65296598802d3b4
	.xword	0xe773c16b86f0d717
	.xword	0x40da67dcbcc4ad74
	.xword	0xd1b32729dc0c11f8
	.xword	0xf066506401a32672
	.xword	0xad25b1a6b5da04e8
	.xword	0x7f4b7c207db4afd7
	.xword	0x26b86935e507ea0b
	.xword	0x577c75242ca22d9e
	.xword	0xc70db7eae275786e
	.xword	0xa717b2e80e6a564a
	.xword	0xd1ff425703916380
	.xword	0xc0045139c52b6739
	.xword	0x31ebe4e2e659365e
	.xword	0x070930fa9cda7f89
	.xword	0x6ed37bd7647c81c4
	.xword	0xee24ba29a25dccdb
	.xword	0x651ef5f86700e128
	.xword	0x952b60788ddda410
	.xword	0x0d6035b7e9500b1e
	.xword	0x7068d954ab91b0d6
	.xword	0x1694e5688da7b08e
	.xword	0xee68f8737beffca3
	.xword	0xde0e9646b2fbea2d
	.xword	0xd3776e79cd3e7563
	.xword	0xd04fb4cef4e13feb
	.xword	0xe7ee84fb70c10396
	.xword	0x5df86c0de9243345
	.xword	0x6d1a7c388b1af176
	.xword	0x63b43d7984125812
	.xword	0xdb37c768a262d68d
	.xword	0xf7331a6f33b99445
	.xword	0xef94a82e0e4d676f
	.xword	0xc521ece5062afe29
	.xword	0xcc4438bb39f8c63f
	.xword	0xc934b313e37196bb
	.xword	0x3a0bdbfd97944009
	.xword	0x9207547358e13b51
	.xword	0x89d8e8fb8142531f
	.xword	0xb61954a3fbe32109
	.xword	0x19ec1d385217bfdd
	.xword	0x9b423558434a2b8e
	.xword	0x1f18639724748226
	.xword	0xba81aa44d9e98909
	.xword	0xaba46f3ba72dfe13
	.xword	0x02686d9bdf7a3c07
	.xword	0x5dd985ceba19d6ce
	.xword	0x963be30776418f0a
	.xword	0x6f5613a3d7e1c518
	.xword	0xa5923f45bd47924c
	.xword	0x415bb933de8d67b2
	.xword	0x0315f10f1f7951ef
	.xword	0xee0a74a7c6dda05d
	.xword	0x639ba9dd028dbf99
	.xword	0x1d01391dc92a02cb
	.xword	0x3cbd86bd4ca1601b
	.xword	0xefe109d36c371c54
	.xword	0x4ba8be1d9b42939a
	.xword	0x46b79f9338b3c665
	.xword	0xd42445191f9869f1
	.xword	0x7ec7b7b1eb8f7aa5
	.xword	0x6072b87d1e87d742
	.xword	0x399d3d04a8b74230
	.xword	0x419b9ddca4686385
	.xword	0xf13c377ae419564e
	.xword	0x368b64ace66d3e86
	.xword	0x36a22596b6c1b7cd
	.xword	0xf6e20e26e2735f49
	.xword	0x76cb893a2ffb28ba
	.xword	0x34dfc3babb9310e1
	.xword	0x7f1f1b85db1da07b
	.xword	0xf73fac9b4038148c
	.xword	0x610731d5c4b9aeb0
	.xword	0x18763e3e336bf7c3
	.xword	0x4c303b1ace30ec0f
	.xword	0x46e4a56171a475a7
	.xword	0x31b619797f0d1617
	.xword	0xd447dc8118612925
	.xword	0x659243d53756d222
	.xword	0x1a0dbd7c851a2da2
	.xword	0xf338dcc0e5e8efa4
	.xword	0x19715a73658b345e
	.xword	0xe59f74a5e6be3b79
	.xword	0xfe466031a8c05ff3
	.xword	0xf27b3c10359aad66
	.xword	0x761b8ce4d7e794cb



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
	.xword	0xc5ce5aacea03dff2
	.xword	0xfad10bebf6dcfb1d
	.xword	0x45c49d1312ef0be1
	.xword	0xeaa0d7f51682cda6
	.xword	0x63bbef73966b018d
	.xword	0x92ad2708b12286c6
	.xword	0xe35f72f9b7c3c53e
	.xword	0xe143ffa39cadbc02
	.xword	0xe92ce4310877acc0
	.xword	0x9fa6ec1157d32bf8
	.xword	0x4c9f11c6f34773d1
	.xword	0x4339671c5e0bc575
	.xword	0x6e9fdb51bd10cc3f
	.xword	0x4a078ed57b69029d
	.xword	0xa7221fc7db43d83c
	.xword	0xca2a9d4543b35563
	.xword	0x74e1c35ca42389e2
	.xword	0x2abc805952a6dc2a
	.xword	0x91f65af42925b7ce
	.xword	0x6794a40c8d93a1c4
	.xword	0x5c1b9394b770ed5d
	.xword	0x573f56ed90c2cc11
	.xword	0xdb2da404ddae1527
	.xword	0x40636eb1d2cddeab
	.xword	0xe8615031f1b44935
	.xword	0x6bfa168be2806259
	.xword	0x714b313af2b7eabc
	.xword	0x367ba9477d9efd37
	.xword	0x98217305630c6af0
	.xword	0x2ad1dc44de16e97c
	.xword	0x9355ae8ed36d0b0a
	.xword	0x8266c86c906fd479
	.xword	0x76f2e30e9a3e45c8
	.xword	0x34dbdf46c596b008
	.xword	0x299627b6ceb5416b
	.xword	0x5b2a8f64b85759f6
	.xword	0x0936111a44912bb8
	.xword	0x9026400945f5b8c5
	.xword	0x70697509aeec4f0b
	.xword	0xef23b58b7753b67a
	.xword	0xc467d0a95c2842df
	.xword	0xb20465619656150e
	.xword	0x179c3c75dcb9ea79
	.xword	0x00547057cbae41e2
	.xword	0xb528aeabc63600e6
	.xword	0xd8910edb94450dda
	.xword	0x0a40a8cb034c996b
	.xword	0x980974eeffd68776
	.xword	0x5e06ef395336cc76
	.xword	0x2e540ac595a1be8d
	.xword	0x73fb49713e45cb55
	.xword	0x40a69389b17e5af8
	.xword	0x14dccb71ce16a805
	.xword	0x568e1f88606e8772
	.xword	0x94e50c3a261a0dc7
	.xword	0xbd27410c40d9880e
	.xword	0x9d49e177d43ec361
	.xword	0x4449e0a3f0736af1
	.xword	0x73688788fbca8a87
	.xword	0x5f6c95a267e65233
	.xword	0x1d70cf57ba4580ab
	.xword	0x3b461a3f9e22e7d4
	.xword	0x2da75753b82e77e2
	.xword	0x8370231c0a1f54f8
	.xword	0xa615cac501d43d8d
	.xword	0xd5864ec75d267a48
	.xword	0x5b2ad8c5372f4dca
	.xword	0x1c0ecec48a4cf635
	.xword	0x445b20285d19f56e
	.xword	0x078c01edff12c9a7
	.xword	0xb16308e00ade03ae
	.xword	0xcc8a7f166cf60d55
	.xword	0xde3cc4865b40f2bf
	.xword	0x8c89a309c87fdbb1
	.xword	0x0b1b0af02950fd2b
	.xword	0x7fd18627fc9d42a2
	.xword	0xb8cf840883f7c3a9
	.xword	0xfd0cb41720bcc40c
	.xword	0xf1a4bca11eeead5a
	.xword	0xcef893ce6e96a7be
	.xword	0xe901eb8c86927ef5
	.xword	0x6ae2a8210b001443
	.xword	0xcf4431a296bdd8dd
	.xword	0xd7ca3716f9916e6d
	.xword	0x4e07ae3ef9e46e14
	.xword	0xf486a296be317a84
	.xword	0xd1e426845e78bcef
	.xword	0xf34c454487bfb456
	.xword	0xd97a126918d6c252
	.xword	0xe6ae3dff3c23aab2
	.xword	0x335fed5c10dfc0de
	.xword	0xe931c575a1a9faf3
	.xword	0x5aa669cc97f4f300
	.xword	0xa6e74b3f79e7d423
	.xword	0xc1a6715dda9f42de
	.xword	0x090a23f293ea3956
	.xword	0x98a128798780011e
	.xword	0x6cf5c895a273c06c
	.xword	0xf20315db4be614c9
	.xword	0xd9f39f104567f37c
	.xword	0xb87bd365ab416941
	.xword	0x7a1d3ceb00dfe8a8
	.xword	0xcb3695cc4d141c0a
	.xword	0x79d5fcae3e2388de
	.xword	0xa114664b6c61ea01
	.xword	0x425d0591655470c2
	.xword	0x572348cc0701c46f
	.xword	0x0edb761f5abac563
	.xword	0x566f7627762b9152
	.xword	0x7a412da7e59a596a
	.xword	0xcab71cd9198ab7a6
	.xword	0x3f194320357e3a59
	.xword	0x3727d697c920c918
	.xword	0x4e72df8fd72705d2
	.xword	0x7eab021f2e6be627
	.xword	0xc51132dfd3890248
	.xword	0x007fb777b4d03f6b
	.xword	0xe54e59bb8cb882d4
	.xword	0x8182516180590727
	.xword	0xc613dee388930bb3
	.xword	0x42e46191f2e26f60
	.xword	0xa75f5e640c42ceb0
	.xword	0x6143faa041657057
	.xword	0xb19d6076ccc2f5f9
	.xword	0xa9effcae0b791f1e
	.xword	0xf856c64ee80011d5
	.xword	0x76d4ebdfcd5bc3cf
	.xword	0xc4f4cbef3cb3e1fd
	.xword	0xec92028e0f93b990
	.xword	0x3f295fe43f3b277f
	.xword	0x3eb89cecced67ef6
	.xword	0xdc043608263bf244
	.xword	0xbc79b67f34b53b77
	.xword	0x068bac2384e592e8
	.xword	0x13b4732120527598
	.xword	0x0cdbbc6a9e3d3007
	.xword	0xafe3ca5b92045802
	.xword	0x798c779d13a6be49
	.xword	0xd5273e9a21d5775a
	.xword	0x240edcabe63cf6ed
	.xword	0x75300f6ceb7a3a54
	.xword	0x00347999906629f2
	.xword	0xc9b1ce2aedee90f5
	.xword	0x4df8e05e61cdaa85
	.xword	0xe2c00f494bb325cf
	.xword	0x3e87d3e1a8e32614
	.xword	0x93329cb4121f4dee
	.xword	0x563f33e2615b3530
	.xword	0x80aa7f238057b583
	.xword	0x4479a36bab0637a0
	.xword	0xee83e5378b3c93bc
	.xword	0xbe911b68329669d4
	.xword	0xa3a7bf77d86c5246
	.xword	0x5b62d84bac60d3b7
	.xword	0x151b7582611ff670
	.xword	0x22a4ef436372ce70
	.xword	0x2721bceca762be1f
	.xword	0xd3f211393407bdd0
	.xword	0xcdfc7257a152f0d5
	.xword	0x3d90034ee8ee008b
	.xword	0x4d4ed25518f72ef9
	.xword	0x4aed3bc3437dbb8e
	.xword	0x91249df839d1d93f
	.xword	0x4ed1a4692321cae0
	.xword	0x9e6a0b926852035d
	.xword	0x63f4dedc5ae010b5
	.xword	0x601b2c24580f7b1d
	.xword	0x62a8e5e50708020b
	.xword	0xb99fd4d67dfcb5a9
	.xword	0xcf9ae954263607ba
	.xword	0x73711bd13913671a
	.xword	0x85931092e7109afe
	.xword	0x0f0f78efad7658e2
	.xword	0xf704dcc13a4e1938
	.xword	0x3dd7cca5d57aefd8
	.xword	0xc6c9b326c25a89c1
	.xword	0xe61ebb24887ebfa5
	.xword	0x499d96ce8d213d97
	.xword	0x1bf6abb142fbf72f
	.xword	0x2622d929a69b543f
	.xword	0xdec40f1087de9478
	.xword	0x4bf9142b42e8c031
	.xword	0x33322db305f2539b
	.xword	0x1ccd857bc546db8b
	.xword	0xc0fb21af18369747
	.xword	0xa39e690a5a4a387d
	.xword	0xb70d2ece338c80ef
	.xword	0xf3d916a6729c5558
	.xword	0x6df5ffecb222d642
	.xword	0x96469f2e12e8c739
	.xword	0xe26454dd0a16922d
	.xword	0x8cf1bd3e0837c650
	.xword	0xd9bfafe9fedd45a1
	.xword	0x241b9ea701035a77
	.xword	0x65b937f3a1bbf11b
	.xword	0xb3913f37213e7625
	.xword	0x24fbcef5944fa22d
	.xword	0x60dcad1459c87ea9
	.xword	0x979a23b5c4b8a1fb
	.xword	0x25a241d6a8db7237
	.xword	0xce2b9add9166ee1a
	.xword	0x5ad79005d8e563cc
	.xword	0x28021eaab31eb7df
	.xword	0xf219769048863197
	.xword	0x4233b83dce7a012c
	.xword	0x47e1ab5680cf5295
	.xword	0x2508bfdc87e62d13
	.xword	0x3a8d698105ba8307
	.xword	0x28dfa1397a544a50
	.xword	0x06d874116a37ecad
	.xword	0xe3408822888d7703
	.xword	0xf6e1492165ea0b81
	.xword	0x3c0f1e372e274212
	.xword	0x1d0816af8c243934
	.xword	0xd65f260b4ee4ef2a
	.xword	0x54ee6bda4a25677e
	.xword	0xf0966f84b59f1d55
	.xword	0xa3babc72995ee9cc
	.xword	0x5c8c315feb0b279f
	.xword	0x30eba50b06f8161d
	.xword	0x01466547f36a83d9
	.xword	0x8824ee807da2ba68
	.xword	0xc083f9fe13af9b19
	.xword	0x38e20ffb1718aecd
	.xword	0x4a1f98f7e0839d5b
	.xword	0xe6a7a54e1c8debff
	.xword	0x347d7fa80f8a196c
	.xword	0x442114a621599f8a
	.xword	0x97807bfa51009d61
	.xword	0x785f71876339e728
	.xword	0x07a621138393ad1e
	.xword	0xb6f4921e0c9f2b86
	.xword	0xda0fbc0cb9894388
	.xword	0x113dba6c8bf320d7
	.xword	0xd0e552ac2817ce2c
	.xword	0x5b51da7c828dcad1
	.xword	0xa7854415ce0e932c
	.xword	0xe6409013e6480368
	.xword	0xe0a3c4ddd6989783
	.xword	0x7e798b3aeb68d1ef
	.xword	0x3bdc275e90c4d56a
	.xword	0x339b8fb1fcf8daab
	.xword	0xced5d065e04b75ea
	.xword	0x53846bf6958db70d
	.xword	0x984fe45fe57dfca2
	.xword	0x0dcb62d9572f83c8
	.xword	0x20e2f68e8b0134f6
	.xword	0xd0776e8e19f83c72
	.xword	0x6e1ad92dc3206aa4
	.xword	0xc8401ccc40073f55
	.xword	0xe69e83758093dacb
	.xword	0x1d24bcd250dff8cf
	.xword	0x9568585c736a8345
	.xword	0x3694588b19d12274
	.xword	0x4a9722203ea4bf6b
	.xword	0x80a1afb7c5b9a296



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
	.xword	0xa739d867f60535be
	.xword	0xc051bc0d575b4326
	.xword	0x5e63da8462b34e6a
	.xword	0x707ca5f8c3f9864c
	.xword	0x0211ac0732b5233b
	.xword	0x10a602a8701d3a7c
	.xword	0x5824cbb2e656dc1e
	.xword	0x0f65c9c2ff2f2a95
	.xword	0xaac6e9610e02d497
	.xword	0x7678b51e5b6f005b
	.xword	0x4247805cfeca9522
	.xword	0x054ad138a0a1e499
	.xword	0x12920e82822191f9
	.xword	0xf90f63f5f2633e26
	.xword	0x8fd12172ab5220bb
	.xword	0xe15085e02e20927a
	.xword	0x4e9d4509d6776013
	.xword	0xcb5c83e1e3b8c3a2
	.xword	0xdae8ace6bef68f0f
	.xword	0x48b62e91289a03d6
	.xword	0xbe9ef39b88222c9b
	.xword	0xaf623503d31fc345
	.xword	0x2711ce1780cec927
	.xword	0x704447ca62684dff
	.xword	0x888544949f90c1c8
	.xword	0xa806bca6ea2928fd
	.xword	0x3528dd7682b999ef
	.xword	0x07d53ae851e30eb1
	.xword	0x2133a9e81aee514f
	.xword	0xd5dd468af72b032d
	.xword	0x8ca6846e8199c001
	.xword	0x28caa34d624564ae
	.xword	0xd5c98d8cefeef2e2
	.xword	0xa0e7df0a759b6c5b
	.xword	0x76508a5787239654
	.xword	0x55fb005e3bc8cace
	.xword	0x900a2b8ef359aa97
	.xword	0x3cf7e20161738de6
	.xword	0x5026553d558cce54
	.xword	0x6e124c1dc0819a13
	.xword	0x722dce60402b3661
	.xword	0x3c2b34ef566c8d52
	.xword	0xf6b175414f943066
	.xword	0xa3b12d0865748a2d
	.xword	0xf29f7d6a0b982fe8
	.xword	0x538b6399dab2d111
	.xword	0xcd9d188e05ce3248
	.xword	0xc7c5372e4ee4aa08
	.xword	0x80cd9031eb5ab18e
	.xword	0x492b6e05a8919f7f
	.xword	0x41fe7e4a863f0321
	.xword	0xee2e86c17efa4961
	.xword	0x0e36bb919b147cbe
	.xword	0xa7607f36e81249e2
	.xword	0x3a3284fd11b25ee1
	.xword	0xf7754c94417cd4ef
	.xword	0x9d88a8ff29e0116b
	.xword	0x2de9b66044da0563
	.xword	0xdd6b66330cc80b93
	.xword	0x67b01592d6f0e1c5
	.xword	0x59ebec17b5c30941
	.xword	0x5a512e8df2db81f0
	.xword	0x7094a3c945954c35
	.xword	0x93c825e7f4ad72a5
	.xword	0x4b27f595bd96cae2
	.xword	0xffc307782c2af788
	.xword	0x1bc097793567c0bc
	.xword	0xe662bd9402c51063
	.xword	0x0437a34485eb0d6b
	.xword	0x23514beeaa1fb4b6
	.xword	0xd3c139dbc13dfd41
	.xword	0x893cc76dfa24b53d
	.xword	0x8464af99af152130
	.xword	0x780e51c2e1fc2e4c
	.xword	0x581766952d16891b
	.xword	0xb2fc91733e7e5aed
	.xword	0x890881147ff19db3
	.xword	0x8dfcc063393cf42c
	.xword	0x5dc6cb4e719f8a31
	.xword	0x17eb26f4d08825aa
	.xword	0xf0401727aa76375c
	.xword	0x6400ec909713470c
	.xword	0x6ef51c29280ce2f8
	.xword	0x59218e610b3058f8
	.xword	0x28ed38a11c02d85a
	.xword	0xd5ce79201e06dfea
	.xword	0xa670c542ed2f9fa9
	.xword	0x5117d98cd1bd6254
	.xword	0x859220d3c3c808d7
	.xword	0x41604a594f51b0d1
	.xword	0x135d64b42bbec845
	.xword	0x66f459c5edc9e63a
	.xword	0x6d2eaacc3b4b301f
	.xword	0x4ddbc00eaf1a2c69
	.xword	0xcbca4b8fcffeb42a
	.xword	0x6f5abaa8a6b28862
	.xword	0xd19f0fc5d23bdf76
	.xword	0xa5a8387062d27ba5
	.xword	0x7d57a9839f16751b
	.xword	0x74bb60dd0c3897e4
	.xword	0x03c2a1a55d297771
	.xword	0xf7c386cb271a4183
	.xword	0xb7aaad6ac9b27655
	.xword	0x818c8216d0973ed2
	.xword	0xbf8ef93dc124fa57
	.xword	0xf8a68e3156bcc275
	.xword	0x2f252fa2e4ddc9cc
	.xword	0x0c557dec46820098
	.xword	0xba4dd946a0bf4869
	.xword	0x4ed487ed1c5bce43
	.xword	0xe3f264bffdfb2700
	.xword	0xf01b2922b039371d
	.xword	0xe3c8091885a07d84
	.xword	0xd89da788e4cde55b
	.xword	0x300cd918e3164719
	.xword	0x31c93dc3f2276027
	.xword	0x555878e41f274d1e
	.xword	0xa96054bd6f2b9d6e
	.xword	0x414474cef25bf6c3
	.xword	0x846fb67571d0ef7b
	.xword	0x553d7f35cb4909a8
	.xword	0xbd8988777d5fee80
	.xword	0x9084d3de3b0fa9bf
	.xword	0xc83b30e2de815a21
	.xword	0xbc9d870f7717b8e6
	.xword	0x9798e5bd6fd3539e
	.xword	0x260995d8c8bc9333
	.xword	0x4aa46024272abc3c
	.xword	0x0474d9b8b0421fb6
	.xword	0xca5b5d09459f9416
	.xword	0xe4d731e743e5be5c
	.xword	0x73b17b5c65876ad9
	.xword	0x59b06270aab08556
	.xword	0xde379f26e2407b9d
	.xword	0xe18ff898b1c07591
	.xword	0x87295e1cc3013486
	.xword	0xa542fe702e8d1f7b
	.xword	0x5c17ed1b696d252e
	.xword	0x2952c9fa42b5baf4
	.xword	0x3c25d8dea5cc9f9e
	.xword	0x9890c344efbd9d17
	.xword	0xe2b84f97e742e24e
	.xword	0xaf416015ea2bbaff
	.xword	0x48bade51acc5382f
	.xword	0x595b069b5c881c97
	.xword	0x31fe1d6027777cf0
	.xword	0xa7e1e004e28634e7
	.xword	0x1928250005f42cde
	.xword	0x528ad4cbfc57126d
	.xword	0x352ab13af66efd53
	.xword	0x1778a71f08ceb80a
	.xword	0x1aafbd9b59601952
	.xword	0xb927b950e7fe196c
	.xword	0x227347af10cfd394
	.xword	0x90cbd27e8bb10fc5
	.xword	0x56492b95f405d275
	.xword	0x520e525bb3d93d58
	.xword	0xb4e4a36acbfb0d53
	.xword	0x631eb055ffd3188a
	.xword	0xcff70ac9b5a2f8ec
	.xword	0x61c98294dea829ed
	.xword	0x7e1cd9557a1e0b47
	.xword	0x05b9a5a32a74ac71
	.xword	0x1e8b34176da3cc97
	.xword	0xdb57242f04dd7df5
	.xword	0xc54a2859f9007cd9
	.xword	0x2d38eab23d451e8d
	.xword	0x65944f0db8526501
	.xword	0xeb90fa3b46038170
	.xword	0xa86913a2e83176d3
	.xword	0x45b96e9453be9f81
	.xword	0x69bf8e82b18bee6a
	.xword	0xad9c9f215f42a917
	.xword	0x1079229835c06bfc
	.xword	0xdac4b9fecde0311a
	.xword	0x15408991502b1ae9
	.xword	0xc79d205dceb189b0
	.xword	0x3c50f96f2d143439
	.xword	0x21cc5744347c76c8
	.xword	0x8f22264c89fe25e9
	.xword	0xc283ca8cf526406f
	.xword	0x231d72d906d5d566
	.xword	0xf5886f6f6bd0015f
	.xword	0x07b856d460d24848
	.xword	0x412ba2346e8a5599
	.xword	0x7f100750981c1c6b
	.xword	0xe8044d794f77f65f
	.xword	0xe50d4551d027eafe
	.xword	0x01b8325051df939d
	.xword	0x39539892e9419e7e
	.xword	0x5bca2a1489eff994
	.xword	0xd92c6f4e72f5610a
	.xword	0xb507cbf46d6d9dfa
	.xword	0xf2e28d2d7fac99ce
	.xword	0x61ae4ffb3ac052a4
	.xword	0x20dae5bd7424783a
	.xword	0x98c199ec8d98565b
	.xword	0xeca830cab4cefbe5
	.xword	0x22d0972f5dfec834
	.xword	0xa2e7ee3c77c0c7f6
	.xword	0xc54b70c730965394
	.xword	0x10fdb690d301c8c4
	.xword	0x7880492233450b20
	.xword	0x07197d4c8d42a352
	.xword	0x170cd65cfd7f26c2
	.xword	0x6eaca33d47ad7a1d
	.xword	0x47ac8f7fb9139794
	.xword	0x1db2c20c8a4d24e0
	.xword	0xf69a4247c013ec9e
	.xword	0x2ba993cee3b73cb3
	.xword	0x67f13b391c8083cc
	.xword	0xcffcb188e30d3521
	.xword	0x563482ea8c16dccf
	.xword	0x328241d38423b10b
	.xword	0x8de6b24465260e72
	.xword	0x0dbf560be8ab3947
	.xword	0xc1dbd82e3a366d6e
	.xword	0xc52f51b7e0dadbd8
	.xword	0x37d63e252c08e011
	.xword	0x614ad5999d98e132
	.xword	0x5cd5aa19c4235a5a
	.xword	0x95b07893fddcae1f
	.xword	0xf31ae35ebf7a1842
	.xword	0xb98604781e511958
	.xword	0xa5d32273934a4098
	.xword	0xbb050b6f48edf5e5
	.xword	0x9ed45489efa3f86a
	.xword	0x486cd04477467a35
	.xword	0x0ae440fa7a40f3b8
	.xword	0x07adf1f041661c6a
	.xword	0x437fa3a173bd9464
	.xword	0xa4282eee8aa43c2c
	.xword	0x44c451d5e2288758
	.xword	0xdee5fe8f5115ff89
	.xword	0x2113f6058759a058
	.xword	0x3de2e262966fb9b4
	.xword	0xcde6517dacf054fa
	.xword	0x5d3cb55ccb023191
	.xword	0xef74b61ad19df503
	.xword	0xd0ae31fa0b0cb8c3
	.xword	0x643f91514a05a854
	.xword	0x3351c9174bae63e0
	.xword	0x576f06bd5cef7c83
	.xword	0x0e34a63b3f4645d0
	.xword	0x17075de9d7eda412
	.xword	0xa21bc66f4c91a33b
	.xword	0x9bba5eeee58eb4d1
	.xword	0x54e4039ed84e6ce5
	.xword	0xa0d52d13f490f289
	.xword	0x14fbe43a417bf6c8
	.xword	0x2572a88a77a2a2f8
	.xword	0x1ffd1f556aaa295b
	.xword	0x1d58c5f33f2e6de6
	.xword	0xab84040aee55da28
	.xword	0x9306543741ef2d9b
	.xword	0xdbf7c4ff748f7ce1



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
	.xword	0x2bcb49eeb133800b
	.xword	0x7d287a6b229a9c60
	.xword	0x7331ce8bd895fcc8
	.xword	0x7e477ae835c99cf5
	.xword	0xa820c012f9975250
	.xword	0x618334ca970a8366
	.xword	0x0cbaaaa4817cd112
	.xword	0x95817c98ae7cf0dc
	.xword	0x40426a82200bde5f
	.xword	0xa3a3021ca76e0af8
	.xword	0x66b84f7e083e93ae
	.xword	0xcb22b067e6e5cc9f
	.xword	0x317d75b3a2543739
	.xword	0x1cc1b8829e0769fc
	.xword	0x0afb0e5db1e663c0
	.xword	0x21182d21bf94e176
	.xword	0xc3dd64a84b1de795
	.xword	0x8242f77e364eb6cb
	.xword	0x06709c55ef5d6bfc
	.xword	0xfd7395be7c095aaa
	.xword	0x89088bd4456e16ac
	.xword	0x0757f8161966b23c
	.xword	0x6f73ad1021ee7e18
	.xword	0x1b02de7e86db6fa8
	.xword	0x673954f8cf1700fa
	.xword	0xc79e31667032edd7
	.xword	0x3833e04a7a0d773c
	.xword	0x96af1f3f2b30f567
	.xword	0x69dbb60ecfc3a5a4
	.xword	0x3e1a49e008f911c7
	.xword	0xc4ce677b57ce0a7b
	.xword	0xaf3c8d8fbce5906e
	.xword	0x1baf5f8f305a731e
	.xword	0xe5425ac9f75df553
	.xword	0x911b6c346d4d6735
	.xword	0x8b5546622d128dd9
	.xword	0xc4ff40d7d5dc4082
	.xword	0x94fad5a3bb7c5431
	.xword	0x898a359ac4302feb
	.xword	0x759c1af63d586fdf
	.xword	0x31c1219036c7df65
	.xword	0x918e808aa5890d6a
	.xword	0xc99ba96614f64085
	.xword	0x624bb136ca4a6e65
	.xword	0x2cf8036e66f7636e
	.xword	0x531d969bdc6c8815
	.xword	0xf51867b06ec23880
	.xword	0x7cdb20aa198be2af
	.xword	0x3213fc40aa3b4a9d
	.xword	0x131d86adfff6d2d9
	.xword	0x32bdd15c6613bec3
	.xword	0x66549ff8d9c640cd
	.xword	0x4027128644292ba0
	.xword	0xe6a8ad869e53d100
	.xword	0xedabc57cc217fae7
	.xword	0xadf0a17bc7033af4
	.xword	0x76958ed9f662d30e
	.xword	0x6d264b52ac5a3337
	.xword	0x52ad6abf87062caa
	.xword	0x0d7c27b45417de06
	.xword	0x30ed8684acf1faa3
	.xword	0xaa89b359958c4ec9
	.xword	0xbb042ebdb08b5dbe
	.xword	0x091d397d4680738c
	.xword	0x2e1c46093cb86f14
	.xword	0x31d8993650eccead
	.xword	0xee4a820bd4dec777
	.xword	0x7d7206adc216b66a
	.xword	0x9d43d5a5ff2ef264
	.xword	0x917c17b3dd2b2f80
	.xword	0x5fd55f32482afaab
	.xword	0x70a422ed6b1a6354
	.xword	0x166d2b2ce8c33923
	.xword	0xe18440066944e476
	.xword	0x391a29922e21353f
	.xword	0x0142e8c67d7b5907
	.xword	0x1d451b1c1e135db4
	.xword	0x1411c6169a595352
	.xword	0x0746062f339c4249
	.xword	0x0cf21ae36b36982d
	.xword	0xe2afee33be728b15
	.xword	0x18b5c9332acdcd3c
	.xword	0x87cd69bb91a0c396
	.xword	0x58384e18b162b9d0
	.xword	0xe832125be52ffbf9
	.xword	0xbd80d6b0ec2f68ff
	.xword	0x882fb14826f7de19
	.xword	0xa6b07dc071f7e686
	.xword	0x8b0e4ede16b2453b
	.xword	0x3d0ae0925b41682f
	.xword	0x5ef8b8cc9f7b36ff
	.xword	0xfcfe43e902bef07c
	.xword	0xca74804641d3a896
	.xword	0xb85d991d2cb4795e
	.xword	0xe7506b14815868ff
	.xword	0x70f31b796a9d755c
	.xword	0xd1fc539d59c6db7f
	.xword	0x2889ecf58c964134
	.xword	0xdbdea8895804e863
	.xword	0x401e3238f1222e3f
	.xword	0xee6cdf0dee37624f
	.xword	0x9e950b93e26ca73a
	.xword	0xfe70abcb92771d48
	.xword	0xe9acfac4b2a6e9e4
	.xword	0x62624d7794ee7a73
	.xword	0xeedded0f50dae6c7
	.xword	0x8b7fff6eb34568f2
	.xword	0x11db5afe69ca0c22
	.xword	0x67f1eb5e6421ac46
	.xword	0xb55dd46bfc45d64b
	.xword	0xd6255f60c0b0bb44
	.xword	0x14b2f0deafae3ed0
	.xword	0xd039ddb8e1aaf5be
	.xword	0xce59e0e3a0db2e3b
	.xword	0xb6055dc67afe10e1
	.xword	0x5cb4e282a73af3f9
	.xword	0x5169ad663113e0aa
	.xword	0x600e0008d9f1e487
	.xword	0x542dadb1b5a2895d
	.xword	0xa124a8d07e195671
	.xword	0xf936f327fb27039e
	.xword	0x95444c2cd3801b48
	.xword	0x4602357836934549
	.xword	0xc4fb39d3a04a1cdc
	.xword	0x16e8f5aafbb8d9bb
	.xword	0x3ddc90132718bb74
	.xword	0x20e7e95d6ba01112
	.xword	0x9330db698c15193b
	.xword	0x8278661c78bc408a
	.xword	0x8ae403c2c3519ea5
	.xword	0xc9fb8e3c12ab5cbb
	.xword	0x366ea961a4a76506
	.xword	0x224d04ed717ca722
	.xword	0x062c499ad2447dbb
	.xword	0xa92389c594466a83
	.xword	0x7f8303a7e14b16b0
	.xword	0xffabe6acfcdbd8df
	.xword	0x4d69514a4a496adf
	.xword	0x6c219fba2d5cf67a
	.xword	0x6aea139f33067976
	.xword	0x9a3f928b40c92ccc
	.xword	0x7ab7c7159f14ad41
	.xword	0xca80a41ff376365a
	.xword	0xa7669da4845c23dd
	.xword	0x4a452cc608f90249
	.xword	0x847e2eb0279da3d6
	.xword	0xec5f32b2773f1aaa
	.xword	0xc04fb7d26c3712eb
	.xword	0x6753bcab4e24a1ea
	.xword	0xf4e80028dad6055c
	.xword	0x3bc6d4fde4e16bcd
	.xword	0x3bf90985e9c8a535
	.xword	0x41775c4505dc589a
	.xword	0xde25677e38e915ee
	.xword	0xad321a436595f3ac
	.xword	0xdae15deefe02d7da
	.xword	0xe8fd38a27e127162
	.xword	0x2426570fdd351684
	.xword	0x3e379b43f43721dc
	.xword	0x5b3844932f1311d7
	.xword	0x01ac76f2ed06dccc
	.xword	0xd8533289e8e06bfa
	.xword	0xc27af8e5f3551014
	.xword	0x5eba3574568c1812
	.xword	0x7d894de52326abb1
	.xword	0x5a976e887af0b362
	.xword	0x9efe5e7408846a5a
	.xword	0x22845b73eac5a9d1
	.xword	0xbdd9141be339386c
	.xword	0x669357250af80300
	.xword	0x922c36a149e4848a
	.xword	0x120780b883823b48
	.xword	0x67d62788e1ca601d
	.xword	0x2dcba1ce634f819e
	.xword	0x36aae54faf7332d8
	.xword	0x46aabe4bb174904a
	.xword	0x4597065a3296ad11
	.xword	0x341ab1da4e6c00dd
	.xword	0x74afbb23f554ebe8
	.xword	0xc68c4221f9b10d9e
	.xword	0xa2af0347652b0e3a
	.xword	0x0c4a80fd6c268876
	.xword	0x048de2b404ebd139
	.xword	0xeb2be3ce3b0e8875
	.xword	0xbf886ab7a77d6be4
	.xword	0xbc7c5e9945cd1e9d
	.xword	0x5af8bcc7dc78b276
	.xword	0x3c2bbc290f68bb68
	.xword	0x9a3f62e2f2533ab7
	.xword	0xa114ebcd772c3a8d
	.xword	0x2f072a9412a0692f
	.xword	0xc0a07beee4367b3b
	.xword	0xa0e44f46a2ce0a65
	.xword	0x8e35a9e58f10bfc4
	.xword	0x3e335c16841c8916
	.xword	0x5743b1bd9aaf1613
	.xword	0xc35b55939e9f6dd6
	.xword	0x2a72d79c49190cf4
	.xword	0x4f3cdc5fba6e9ee1
	.xword	0x1193e285bc3fb29c
	.xword	0xbcaf442cd4105edc
	.xword	0x96d57fc93bccc411
	.xword	0xa992c961392064f2
	.xword	0x67234eefb6bad98b
	.xword	0x46737c01c0983e68
	.xword	0xd0c16dd8c693dc4e
	.xword	0xe2a173330e1ee970
	.xword	0xfa31947bc9dbe4ce
	.xword	0x71090de954d002bb
	.xword	0x9823661aa4885904
	.xword	0x4220169f8b476ad6
	.xword	0xcb18e19b2491428f
	.xword	0xf581f4bc5d2d2272
	.xword	0x8042ca183667fa20
	.xword	0xa72e3340b361bf72
	.xword	0xdc34affbe08b1139
	.xword	0x0ce47348490acb03
	.xword	0x90c5bd7f41287ee5
	.xword	0x81ffb79225d3e855
	.xword	0x1ac484e3a65730b1
	.xword	0xac9b25f7aa9f93cb
	.xword	0x19cab5145523f94a
	.xword	0x5acdeabff9108836
	.xword	0xc9d705551612205b
	.xword	0xf5f3ffd9d886078f
	.xword	0x7d4f3780e986cca9
	.xword	0x094f2fd868ea20ea
	.xword	0x1cfd2094cc05da20
	.xword	0x42f2a34f29d8a6b9
	.xword	0x25f1457fdf9375bf
	.xword	0x0690f4ed4032ddda
	.xword	0x489273db3e7cd1e0
	.xword	0xe85b900ba37ae7ea
	.xword	0x0ad142d65871c432
	.xword	0x9c69070afeac7fae
	.xword	0x861e9bc23a8dfa77
	.xword	0x847e9087a7f7cbd1
	.xword	0xd364e496f379c81c
	.xword	0xfec5770c3249d680
	.xword	0x2830083187584496
	.xword	0x4afaf4124977cb55
	.xword	0x90680c0107215d69
	.xword	0x1538740ff44d7cbe
	.xword	0xee3697f2580dfc1a
	.xword	0xa7fa47b79fc2a398
	.xword	0x85a471757250c735
	.xword	0xd2dff524f5403d76
	.xword	0xbfab723bb2fa45f4
	.xword	0x0a6a87b2a0509f45
	.xword	0x913a92f811ab0bff
	.xword	0x4d51995ec239870c
	.xword	0xba9d794d551d0d50
	.xword	0xbabf119d922c74a9
	.xword	0x3b5f42d0f60031da
	.xword	0x307d883ea0ec8b2b
	.xword	0xe5931e23970784e3



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
	.xword	0xd817970d7339e009
	.xword	0xf8c205a28c711a68
	.xword	0x96941c23e9ac99f6
	.xword	0x2dbbdb3dc1ce0288
	.xword	0xc3f4ce8e663b9eb1
	.xword	0xbe0662fe15d0daac
	.xword	0xa2f7e47bc3e53cda
	.xword	0x87709b3a94cc6418
	.xword	0x49096793b8ce037e
	.xword	0xd2ec36f90e3d1572
	.xword	0xc8a23b82b7471d05
	.xword	0xe801e1a3b89ad651
	.xword	0x7556c9ce90071f29
	.xword	0x73d58afaab960afd
	.xword	0xdafc92ef76f5eabf
	.xword	0xd58ecc4f2d0294b0
	.xword	0xde0a23cf95d5b9b9
	.xword	0xbee056c440cd0a2e
	.xword	0xb5d1413a081bc1d2
	.xword	0x4897e6efdaf44b49
	.xword	0x17b97127c29add0f
	.xword	0x7c55d6c79d770c07
	.xword	0x073750289a96823a
	.xword	0x3f5673fdc1c9a361
	.xword	0x6fc953f8b24eb572
	.xword	0xdb6d456439f230f7
	.xword	0x0f48adcc98778614
	.xword	0xc4e2c985a3d377a8
	.xword	0x950630d7a7089155
	.xword	0x521b70da20b9ab1a
	.xword	0xa117710212f5ff52
	.xword	0xfa3e1847ebb8818a
	.xword	0xe7faa25793803c33
	.xword	0x1950117127f07e8e
	.xword	0xeb4cf01618ca810c
	.xword	0xdbd84fa2b6355818
	.xword	0xecb8e79fa14ef03a
	.xword	0x97a6ca74761b66c5
	.xword	0x79e70a695fab0e7b
	.xword	0x5c0ac350f36fa353
	.xword	0x5238b1ac0da82fe2
	.xword	0x1ace50f7f1aa5b1c
	.xword	0xd3d5f7672a4615cc
	.xword	0x19117f616d1caf73
	.xword	0xd873f57608f9eccd
	.xword	0xec728ea3eafaac7f
	.xword	0x5e71342a61cc3ebe
	.xword	0xe882f4a7109865e3
	.xword	0x77ca936a2c027683
	.xword	0x60afcfb24999eb5a
	.xword	0xe9c2d3f4d5a6b9f5
	.xword	0xfdb75bf2e1865c6b
	.xword	0xb80c89471b5d29e2
	.xword	0x2944f1f0299cb85a
	.xword	0xdc8dae4a62d47981
	.xword	0xcba9d58d7457cdf4
	.xword	0x403325f75bb7c4b1
	.xword	0xc7025655c662040c
	.xword	0x4174b924c0859ede
	.xword	0x94e05d41e062d166
	.xword	0x8d4048eb1e46bc92
	.xword	0xbbf18d553ad58e0c
	.xword	0x9bdc5cda19f2baf0
	.xword	0x338e251f4643d5af
	.xword	0xb2b8041f3a848a30
	.xword	0xeccc94e0088d2ea1
	.xword	0xc7dd986146ec914b
	.xword	0x21083207472bd8c5
	.xword	0xe32c7de7bf6fbf36
	.xword	0xf9fd7419ca84a75a
	.xword	0xf0577a3c1c3384de
	.xword	0x2299be2fe9c25e02
	.xword	0xdab00a60088b5373
	.xword	0x5b669cd0e44488ed
	.xword	0x74d77067bd3baa61
	.xword	0xbeafa6c843e7ba92
	.xword	0x56553f3ce54ecc1a
	.xword	0x5d620e347dc75c24
	.xword	0x66916360af494ecc
	.xword	0x121bc0ac4252e252
	.xword	0x72f3bed79caddcd1
	.xword	0x606629b79c852a45
	.xword	0xc39ed28495f4eb7e
	.xword	0xb2240cc66ee8d9e2
	.xword	0xa2d36875b249b60b
	.xword	0x6ea09f92b15a8ad6
	.xword	0xe109b2f7c7ceb375
	.xword	0xe5fb2c9eb13fc461
	.xword	0x5dbfdf6dcf54e470
	.xword	0x9e9d6eca593f3185
	.xword	0xfd8ba7a17ba2451b
	.xword	0xd7ca09cfecefb432
	.xword	0xfdb62ff5aac83576
	.xword	0xe394220f00884927
	.xword	0x4156255334559538
	.xword	0xb3a6fcede744199f
	.xword	0xe3abd28371318f66
	.xword	0x15a393bf7d34201b
	.xword	0x2c0b7ce291f79af6
	.xword	0xf5d9c4ff5e538a06
	.xword	0xf088a47a7d9a823c
	.xword	0x447da858558ee822
	.xword	0xc5289a67871a5237
	.xword	0x5be321cd52a954ed
	.xword	0x37093b752a751a83
	.xword	0x358fe9fc33298ddd
	.xword	0xced8dc38f0643348
	.xword	0xd237c8a4f0e54812
	.xword	0x59af5316de1a0519
	.xword	0xaf895af186a94824
	.xword	0xc18dde3688f07007
	.xword	0x49aa8bd42185820e
	.xword	0xeca39662ce848060
	.xword	0xd4e22fb9806c046e
	.xword	0x8eb064698b6f4a86
	.xword	0x7281dd4580ffb599
	.xword	0x3f75b06b5a16dce1
	.xword	0x19fb724405181fba
	.xword	0x159d449dfcff6065
	.xword	0xeb0e86834e80c40e
	.xword	0xdf6c792bba8dccf8
	.xword	0xb6a32ded44b3d8f5
	.xword	0x07006441ef462c42
	.xword	0x790f9ad9e4c1bcc4
	.xword	0xb3eb9d7f4bcc7acc
	.xword	0x115383fdee86414d
	.xword	0xc80750da8e3b1d27
	.xword	0xa14abab2f793f492
	.xword	0x232d003bc54ff8da
	.xword	0x3f4d0d840b2329a9
	.xword	0xb26e948235a33dd9
	.xword	0x6d481f2423706419
	.xword	0x4532affd4c4eeb23
	.xword	0x440c05f7b7f73810
	.xword	0xe820803912d311e3
	.xword	0xd39b4936929b541d
	.xword	0x1d077491736c241c
	.xword	0x756e5ed808c565e6
	.xword	0x7779c721cb19df56
	.xword	0xd3d6d20b65afc556
	.xword	0x33e84038558244ae
	.xword	0xc867ec3dd10e880b
	.xword	0xc8e701d9aacae61f
	.xword	0xed57576f6454c799
	.xword	0xedf3c3d2b419f046
	.xword	0x0046119a45eaf3b8
	.xword	0x8baa0f52e92ef7c0
	.xword	0x85f41604fa5bbbb6
	.xword	0xbbcf401ce0b2454c
	.xword	0x8592e36007f3a5c1
	.xword	0x3d6b40ebe952bfb7
	.xword	0xf906860fca1e0b9d
	.xword	0x20944ade1a6d8b0b
	.xword	0xfc3e99aca09075b0
	.xword	0x0ff69439eebc6462
	.xword	0xb61ed98b12ff1243
	.xword	0xe372bcd799965d11
	.xword	0x154019040b5baa10
	.xword	0x079d75b6cf27b316
	.xword	0xf52398e608f0b792
	.xword	0x9295dc36e3179966
	.xword	0xaa7e189b9f86e0cb
	.xword	0x76544a0a68420aeb
	.xword	0x0c23ebdfaabae82d
	.xword	0x5d261ff125773147
	.xword	0x3bc2b9522b16aa0b
	.xword	0x69a102e98d1dfbc8
	.xword	0x4309cf58b4a0722a
	.xword	0x3fb3c439a7f2d4b6
	.xword	0x3ed75ea47b687e8a
	.xword	0xf9d45f762af1bd5b
	.xword	0x7f5c0ed04ca16312
	.xword	0x8845b9b0cb12ece7
	.xword	0x4c5b8237afa8805a
	.xword	0x510c5d022b93913a
	.xword	0xae7133f3d85e9b44
	.xword	0x5aa45df8b3fa8769
	.xword	0x308ccff251838ef7
	.xword	0xd75b97bab9c40bfc
	.xword	0xb998b1be0926efcb
	.xword	0x242793c6b86593ba
	.xword	0x3cefa50c6bb79525
	.xword	0xf53fcd79c9144bf2
	.xword	0x059c67ddd83caa5a
	.xword	0x2a46594bce04a945
	.xword	0xd9f8b0e554f24aed
	.xword	0xfc0fa11755dd21a0
	.xword	0x79d4bb6840cf8733
	.xword	0xa23f4f0c7eed47c7
	.xword	0x48b577c59eec6d8d
	.xword	0x79ba6801ab7cb50a
	.xword	0x7c0c7041fe2f9a5e
	.xword	0xdbd31eda6d468864
	.xword	0xb590f355f0762c61
	.xword	0x6ce31637072fcf3a
	.xword	0xab4071aded83c9d0
	.xword	0xac9945cd6369ac12
	.xword	0x67e08d88dc73a3ad
	.xword	0xbfdd8f78ef72a4c1
	.xword	0x42833b1afce299b3
	.xword	0x6ca3923fc68b5eef
	.xword	0x2df69c150fbe9bfd
	.xword	0x4f42a1d343d7ad09
	.xword	0x2330c13a5ccfe7ff
	.xword	0x030a634a167efbac
	.xword	0xd5fe22eec33eff37
	.xword	0x24121f3ba7497f8d
	.xword	0x13a00e36ffd152d0
	.xword	0x8caa4f20896299be
	.xword	0x67ff382a24d4d702
	.xword	0x6adf6aa9122d01cb
	.xword	0xc8a6e6a43c940277
	.xword	0x05d933d3e2e4ae9a
	.xword	0x8ccddc5f96bfd8ad
	.xword	0xfdc7121817b6355b
	.xword	0x66425e0991134bfc
	.xword	0x6ad6a52bfa46f2a1
	.xword	0x036de381c1416267
	.xword	0x203e53329fe89ce1
	.xword	0xcf5b3ebfdccf59a6
	.xword	0x753afdae1b0c7a7a
	.xword	0x5c7956cbc99016cc
	.xword	0x4b5247b5808f7858
	.xword	0x205088007bf6528e
	.xword	0x05fd51a1269448a5
	.xword	0x19af121bb158cd52
	.xword	0x559ceed73e2bedad
	.xword	0xe93e895c09616578
	.xword	0x018a3e00e2012b6e
	.xword	0xe5b7030ba3853605
	.xword	0x796ae5f75e8e6e4d
	.xword	0x6536e75c3927e445
	.xword	0xadf6c49402def886
	.xword	0x7ba0f0ef42d08297
	.xword	0x82f7c3b7f349ff6d
	.xword	0x23c8f6968920c45e
	.xword	0x15c2b9dfa9d2f06f
	.xword	0xe963c04f94f7402b
	.xword	0xd9725fd458ade30d
	.xword	0xa1741ccc6ccdd6b7
	.xword	0xc6b9086997fc6c44
	.xword	0x09a8319bcb4ac45a
	.xword	0xd15c01e9b706f634
	.xword	0xa26203c190c2797c
	.xword	0x5120596b852b92e4
	.xword	0x3d87b12480f095f1
	.xword	0xa670c059cc53c3ca
	.xword	0xffb007d0e98fb2b9
	.xword	0x5f21ac6e2ac46766
	.xword	0x450fb887497e69ba
	.xword	0x3093fda4f5b69516
	.xword	0xe6a03784551c7417
	.xword	0xa1c7e6b96e9cf350
	.xword	0x8415d32088df45cc
	.xword	0x3f77a1b14d050d01
	.xword	0x75e3e87e2054fd59



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
	.xword	0xe2e6d3061aaad370
	.xword	0xf49723a5c4566907
	.xword	0x9b991be4b25de9b7
	.xword	0x999882fa2cb625a2
	.xword	0xe28fb1a713ab3db0
	.xword	0x92ab9c30a2ba1821
	.xword	0x77a9afc429aa035c
	.xword	0x3a6a4fccf9e23b75
	.xword	0xc4634cdc655d02ce
	.xword	0xa82341759f807c3d
	.xword	0xe877d9840abe653a
	.xword	0x7171e5872e1a8190
	.xword	0xf21d47abbddcb3ab
	.xword	0x6cf0f9ba40aa12c5
	.xword	0x659abfe7be73af77
	.xword	0xa50fbc753cef0491
	.xword	0x71a58ad25a70e421
	.xword	0x404c8d25b052df98
	.xword	0xf2d0ed738b844e2f
	.xword	0x651c1e7ba66e1704
	.xword	0xbbcdeb7ec28ae5fe
	.xword	0x95427dd7b8e678fd
	.xword	0x9965bd9f4b315515
	.xword	0xe1c7dfa555080854
	.xword	0xd473dad382983c28
	.xword	0x47824297066f2ed1
	.xword	0xb5c1c088b556d760
	.xword	0x6ecf09d17e04eb9a
	.xword	0x614345e6d281ecbf
	.xword	0x0cf00a8d7022a7f3
	.xword	0x6678b377fe7850c4
	.xword	0x2d65eb27aabc1a99
	.xword	0xd27bd75a1edc6ec5
	.xword	0x0d9fc4270347a047
	.xword	0xb608f33ac321781a
	.xword	0xaa1b02c167c55529
	.xword	0xa2b37ef8b6e136e3
	.xword	0x16025a0990d491c4
	.xword	0x6ddeedaa186d9f59
	.xword	0xe8579cb881bf3c16
	.xword	0x7f4c1fd8db81d581
	.xword	0x299125c39f0fa31a
	.xword	0x891db612da408f24
	.xword	0xf6819ec9f75cbaa9
	.xword	0x4fad9b7be3dd213c
	.xword	0x33dc91d9d17ba774
	.xword	0x0a3b3c9c45c20d72
	.xword	0xe6e79cf189aab304
	.xword	0x9a8ef119cdd21686
	.xword	0x63637057890d97dc
	.xword	0x7fe23383fcba8f87
	.xword	0x33727f5629cc6a92
	.xword	0x78850d8f695c5860
	.xword	0x19ed1d637d9a8b45
	.xword	0x5471e3d6b20cba15
	.xword	0xfd2887cf28c6c3fc
	.xword	0xf998ee2a73a83cdf
	.xword	0x646119544edb0b7d
	.xword	0x85dfb2422d1e6582
	.xword	0xa7a595073405f2fc
	.xword	0xfb58d8087a48ed87
	.xword	0x50d4473c8b3949ca
	.xword	0x68767a58152c00e4
	.xword	0xcf1773f9756834d6
	.xword	0x8be56a7f7e58c963
	.xword	0xb1528503852f372a
	.xword	0x2c74b6d837cda958
	.xword	0xdff024323e3a397c
	.xword	0x7e3c90e3bdeb092e
	.xword	0x31ce79c3c4092468
	.xword	0xef9685b62f4c4e79
	.xword	0xce3185cc93c7cba7
	.xword	0xf6cb0fc44981516f
	.xword	0x719e8e2c9e26c626
	.xword	0xb73c3341c99347dd
	.xword	0x7e23458e4e70137f
	.xword	0x50d264191a7ac771
	.xword	0xc6a06207f761a0b2
	.xword	0xbf4f14e4d6f061b7
	.xword	0x2d6a2ab48ebbeeb6
	.xword	0xdda0de0e3180aedc
	.xword	0x35c50a199e6bb504
	.xword	0x92a9d00391dccb64
	.xword	0xb3a4b8f9465956a4
	.xword	0xdcd1d01548e2dec5
	.xword	0xe9f9e0f9cff49ff9
	.xword	0xd435c0af8868d1d2
	.xword	0x38e13a454d36d5db
	.xword	0x1ee7998fa5fb2b4d
	.xword	0x3643922f8e673f0c
	.xword	0xc37730ad29217c93
	.xword	0x3adad498b4b8a87c
	.xword	0xc4befe1e15263857
	.xword	0x09d74804505af719
	.xword	0xcc4af7abe3f630cb
	.xword	0x42b706685d7a3e62
	.xword	0x14bc76de16d4da7e
	.xword	0x8dec5b9ba83704c5
	.xword	0x82b802b737fc2ea5
	.xword	0x14c20ad07a33216a
	.xword	0xbc6464ad1242a407
	.xword	0x21b16728ed7a8f97
	.xword	0xe38c593dc71d39c5
	.xword	0x734c09f061c702c9
	.xword	0x31d5ee05a65558be
	.xword	0x369327492d8c0d18
	.xword	0xc612ce5b8e67403f
	.xword	0x793537e2a9d444c7
	.xword	0xbad7573c341e4c47
	.xword	0x83d8a76386040bef
	.xword	0x5e75fbf85079b8fa
	.xword	0x8ec9c56563ec9339
	.xword	0x7def7c8a91516199
	.xword	0x761664fca6283c2b
	.xword	0x2f679636c02e601c
	.xword	0xdcb3cd6ba3e74cea
	.xword	0x1711e083435c629f
	.xword	0x216d1be6deba5707
	.xword	0x5a20c24943212d1b
	.xword	0xdb937a95a67ff208
	.xword	0xd3b3045809706ff3
	.xword	0xa7c5288106676d0d
	.xword	0xdc7d78b2f4e53edf
	.xword	0x722a2aec192ea56a
	.xword	0xe976611fdb7d99ee
	.xword	0x59284301d07e6430
	.xword	0x00b47152939282db
	.xword	0xdf07a201bc5a18e7
	.xword	0xdf8bc9cf3a289063
	.xword	0x08e0d4627b2de0e6
	.xword	0xa913dd6a271a565a
	.xword	0xe1843d963076a16d
	.xword	0xcd631de7458dd294
	.xword	0xa4a61fe76069bebe
	.xword	0x5d16a16c88851372
	.xword	0xb073deef290a75d6
	.xword	0x4f9a91659c12d577
	.xword	0x8259b5f1c32a4a4b
	.xword	0xc960d2d90edcd323
	.xword	0x50fade77d72e84ef
	.xword	0xf6a20826b414828b
	.xword	0x171c6b527ca0bbec
	.xword	0xf852cae14b605f8f
	.xword	0xed4c16bc110352be
	.xword	0xb2d9386f06f79a07
	.xword	0xe616adbf6bf20081
	.xword	0xeed4c50aadcc2934
	.xword	0x9d2511214ee8d6a2
	.xword	0x4d2fa4737aef4b36
	.xword	0x1631bdf6fddec738
	.xword	0xfd7c06e96f480dbc
	.xword	0x53769f5ba14e20a1
	.xword	0x5aa6feca306bb91c
	.xword	0x6affd3ec6e79412e
	.xword	0xccc354a57941967c
	.xword	0xa34a0bf5f506f6f6
	.xword	0x4119299004c5709d
	.xword	0xe3f701af803b476e
	.xword	0x081e26720b5cb413
	.xword	0x50916e66f4707bc4
	.xword	0x4ac9da84df6df4bf
	.xword	0x2b319a5e8b2c9b74
	.xword	0x5aa528e924a372e0
	.xword	0x876808a7647ccafb
	.xword	0x57ef3664a590600b
	.xword	0x21343635007293b3
	.xword	0x943b0050588c60a4
	.xword	0xf681e1926ef37fc7
	.xword	0xfa9b6651d794a9f4
	.xword	0x32e68fa5a0a9e4cb
	.xword	0xaa32208d51cabee2
	.xword	0x6388a6cb6b028370
	.xword	0x0daf0dad2a3e116d
	.xword	0x67b6d531c1d4690c
	.xword	0xf12a62e25cd9516c
	.xword	0xfd86c38a8127eb66
	.xword	0x2228654f57e3feb0
	.xword	0xb0dad249184056e6
	.xword	0x0b8de7ffe95a9c33
	.xword	0xf99a50750c724c30
	.xword	0xd8ca3b283c6396b0
	.xword	0xfee9ba99207e00b9
	.xword	0xe9c47bb318f57359
	.xword	0x4b36ee4d08117d53
	.xword	0x49556b909946f82b
	.xword	0x25d1a153c49e4baa
	.xword	0x45148bf247c83bdd
	.xword	0x058defde320bea66
	.xword	0x31d86b5deffd0545
	.xword	0x5a6383d63ddef22f
	.xword	0x0f15b39e47a00b8a
	.xword	0xb5e80fed9b1321b4
	.xword	0x8877b4a0a20c7e5d
	.xword	0xe87e4295e868ecab
	.xword	0x2739d7c17241b498
	.xword	0xb35515fa11fc2c0b
	.xword	0x3d0650cfcc97617b
	.xword	0xadcd04ea0ba04b22
	.xword	0x6be6d675f81e3093
	.xword	0x1dafa58953421da7
	.xword	0x8dfa9cea75595ba1
	.xword	0x78d204c834d6c3ca
	.xword	0x57d13fc28d5948a6
	.xword	0xebbe65e00b2b5a46
	.xword	0x1c89d0cdc1cbc991
	.xword	0xf36eeb79896a2009
	.xword	0xc69cb3c2c33afba3
	.xword	0x8615a644bc40839c
	.xword	0xc228f3f6da012293
	.xword	0xc21ef478023c0d68
	.xword	0x3668e4011d699956
	.xword	0xf762b258a0ba3912
	.xword	0x6baf5476953a71be
	.xword	0xcb6ef297b40c23c7
	.xword	0xdf04300bb3480f54
	.xword	0xdbf6fa459ef0ff92
	.xword	0xd74691eb3fda9e51
	.xword	0x97e8df94589392ce
	.xword	0x1a0029ad422bf5aa
	.xword	0xa1c67c4b6e54d02f
	.xword	0x397a82069118200f
	.xword	0x9f9c65d1dea7139d
	.xword	0xbec152e7b012df90
	.xword	0xedbab5767755e654
	.xword	0xa224b4128ca6ffae
	.xword	0x6b8a4a48897f9b4f
	.xword	0x59ceb83af081c5f9
	.xword	0xd2eeb74add98999d
	.xword	0x6189ff2987c9907a
	.xword	0x1832c870f26ed1a8
	.xword	0x83a0847a5e26f879
	.xword	0x3a804b9829f9f282
	.xword	0x72462a3265399837
	.xword	0x51fa40dddf0918d6
	.xword	0xd2e207d2493df27f
	.xword	0xa5574520b7e9fd05
	.xword	0x678e1a8ebcd172ae
	.xword	0x7dedc2215bf3947a
	.xword	0xd642419c54bd2ede
	.xword	0x729e931cf9c8fb85
	.xword	0xe9860691b126b385
	.xword	0x51316a5353fa181b
	.xword	0xf2485ed9cc69ec60
	.xword	0xcec3a74a859c2bf4
	.xword	0x73978fcadf94ec45
	.xword	0xe1bd2da7a9cd80b0
	.xword	0x4e1ba738ec944aac
	.xword	0xb328da903c677f8a
	.xword	0x795eab44b9095667
	.xword	0xee63de030bee9542
	.xword	0xe043bbb3fc8b7ec0
	.xword	0x5f23449298922550
	.xword	0x873db63944f5fe90
	.xword	0x48fb0a961ab94719
	.xword	0xcc487f8cbaff01a8
	.xword	0xa26e4a401ec29838



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
	.xword	0x1fbb6607a2b8bb90
	.xword	0x91e79a822136a4ba
	.xword	0xb04dbc0ac9a27539
	.xword	0x66bfa027a13403cf
	.xword	0x064f4adca10d289f
	.xword	0xd12ab994c958097b
	.xword	0xdd27224afdd9e8e2
	.xword	0xab6b0af3fe7bc4df
	.xword	0x65c1ef47b06f1849
	.xword	0x99953374725da18e
	.xword	0xd11d8d57a7bd676b
	.xword	0xc8d72af4ccf21190
	.xword	0x4734178c96b88036
	.xword	0x8219934133bc1114
	.xword	0xc2de3276adf146e7
	.xword	0x89cdef86236c90f3
	.xword	0x0c62878eb8ab3198
	.xword	0x919085147d979fc3
	.xword	0xfda905b473414db1
	.xword	0x77db319871f80f97
	.xword	0x52441d12c492906e
	.xword	0xc2c1c3de8eab6ce5
	.xword	0x82e221d3bdde38da
	.xword	0x73154adc5ffa5da2
	.xword	0xbb8a5c3f7163e447
	.xword	0x354a3ce5545902e2
	.xword	0x2b6367c36d348e67
	.xword	0x1c7f222a31def43b
	.xword	0x7a253683cef6aa7d
	.xword	0xf7f55ee70488fbfc
	.xword	0x507a3f6fe8420be3
	.xword	0x9e85f4277fedc846
	.xword	0x4aa72525a2690b08
	.xword	0x9cabaf4b0ba27575
	.xword	0x8d1bcb225475009a
	.xword	0xa368545da6c183d0
	.xword	0x05be694e2b167aa6
	.xword	0x2c959b8a2204339b
	.xword	0x3670456217dbbc97
	.xword	0xd861c330502b8188
	.xword	0x7707f5bcc9c95cbb
	.xword	0x01723c0fdae74b4a
	.xword	0xc6e9bc99fe7bdd62
	.xword	0x1f79b56bb287f46e
	.xword	0xc659131e21b8a329
	.xword	0x9504b1f8e29fb2e0
	.xword	0x01ff377b43c28f66
	.xword	0x1f9107109d27908d
	.xword	0x016d4fad6e6203a4
	.xword	0x32f29f764072134e
	.xword	0xa2c5c055fac11cd9
	.xword	0x16c8a9c1244e2ff9
	.xword	0x01c72cecdc71431c
	.xword	0x1a84fe807a0b3d7b
	.xword	0xf6409cdecb4231aa
	.xword	0x93c881da113f4d9c
	.xword	0x61daeef5ab7bf0fa
	.xword	0x8c901634cd10156e
	.xword	0x8f811226bb5883e5
	.xword	0x564817857dd2e107
	.xword	0x3641b4f604cedd82
	.xword	0x71f301a85a8ada1f
	.xword	0xf5a40367b2797408
	.xword	0xef5e57e0415737ef
	.xword	0x6a8ac891b2e87840
	.xword	0x2b14a5fbfc550443
	.xword	0x50993fd5165d310d
	.xword	0x4b12aa52eeebd38c
	.xword	0x6406be0518844545
	.xword	0x0e0cbb4d83d79dfc
	.xword	0x04836312a68dfc3c
	.xword	0xae47d1fb15f7fb10
	.xword	0x11cb2a1c9a558b59
	.xword	0x65a2847eeef90f13
	.xword	0xfc76d71a0ca3af39
	.xword	0x41d876e813dd6bdc
	.xword	0x6134376ffe12029a
	.xword	0x62e4d558d39d6a39
	.xword	0xbbf74bef250b3474
	.xword	0x744ab9dfd31cc43b
	.xword	0x321a8f254f06bdcd
	.xword	0x7b740eda800e7b88
	.xword	0x01fab6f5bd0f420c
	.xword	0xbc9c379b78ae685b
	.xword	0x0dcbdf60b913fe6c
	.xword	0xfb22bcef5baf0c3d
	.xword	0xf4bc3e4971c971e0
	.xword	0x8245d19d5a683518
	.xword	0xe5c5e01e8292d409
	.xword	0xac4bb040115dffcd
	.xword	0x76b31904264b3396
	.xword	0x40a1b3a91665a3a2
	.xword	0xe6100772b0b639c7
	.xword	0x7f251894af912e8a
	.xword	0xde0862c9a97178d6
	.xword	0x452cecfdbdda3c28
	.xword	0x8b0ab49b8e3dc59b
	.xword	0xa2566c9015e0b0e9
	.xword	0xbb420842bae8b195
	.xword	0x009cd894fa4b1c42
	.xword	0xcfbdd4e91e0136ab
	.xword	0x3ce09baefd53d557
	.xword	0x98d9a0b50622c172
	.xword	0xd165f0de9d90a5eb
	.xword	0xd4d87d97abbaa97d
	.xword	0xa14937c5cc720b14
	.xword	0x12b1164d5d5fd98b
	.xword	0x7443fcc062be75fa
	.xword	0x96e3954764ee1699
	.xword	0xe5c171b139514d36
	.xword	0x051221a1427e8d65
	.xword	0x141796cf1aa2587e
	.xword	0xcde375351b36dc10
	.xword	0x45b4bff1d44421e2
	.xword	0xaec1aec804ae90f1
	.xword	0x8a337d88f711640f
	.xword	0xca2e339fd067f641
	.xword	0xeaa8169265830c9a
	.xword	0xb568358c4f561b4f
	.xword	0xef4b2b2d7e62f551
	.xword	0x173b7c5c0751f673
	.xword	0x53ffca1d72f4f39f
	.xword	0xa01fd524069dcad4
	.xword	0x1b74635090f418c0
	.xword	0xfcb3d7ffa630c0db
	.xword	0xbbc20f826d210a34
	.xword	0xe9d5001e8c7e7fce
	.xword	0xe0a0c7dcf9b82867
	.xword	0xc0bc3e5b38f25433
	.xword	0xa0b63c4d811f6928
	.xword	0x6159923ba23ddc84
	.xword	0x45596a7188280751
	.xword	0x614ed6c9c3865cfd
	.xword	0x2899c207df035dab
	.xword	0x4d60add9bc6de37a
	.xword	0x43f65441aba8990b
	.xword	0x203c6b7a68e29ac6
	.xword	0x0bd13799d33d3508
	.xword	0x6f2903b2a2629403
	.xword	0xd30d2918134f91ad
	.xword	0xc2f4fd5c3a13262f
	.xword	0x010c7d08ee333dad
	.xword	0xa32fa798cb8e9284
	.xword	0xebd084c86456e74b
	.xword	0x2a8b70b455130098
	.xword	0xd800271a5c26e1d2
	.xword	0xd2a6f4ff3d5c7dd5
	.xword	0x2038db914dee5ca3
	.xword	0xefe3344a55007328
	.xword	0xcdd61a8381e974c2
	.xword	0x38dfb23f0a9a2e16
	.xword	0xb2f04b2802f10bfd
	.xword	0x13c01dbdc706aca2
	.xword	0x956868fcedf1c0b7
	.xword	0x1e0c507580d8e1de
	.xword	0x62f7079e5c979447
	.xword	0xf51de4229f48740d
	.xword	0x849a1b7b3b8d4c1d
	.xword	0x22a55415ef1c28f6
	.xword	0x35eebe8d4fbfd098
	.xword	0x2b5fd329770fedb2
	.xword	0x81dc71db57f6ff49
	.xword	0x0a1a9d95477a6440
	.xword	0x0ba82837099bd890
	.xword	0x2369b94a29fbccbc
	.xword	0x23e5a9504539367b
	.xword	0x90d6bc7c57beddb6
	.xword	0xf763abab163f8a8d
	.xword	0xb37021c521d39e7e
	.xword	0x8f5a15010269286b
	.xword	0xa57719b13baf2ba6
	.xword	0xc57856f4f04450b7
	.xword	0x0a46e74e1a1335ca
	.xword	0x2a059f9e6934f90e
	.xword	0x1357d0931b0ffbde
	.xword	0x36ff2f9bca86374d
	.xword	0xcbaaf0a2cac45f5d
	.xword	0xa11411f0952c16ce
	.xword	0x37c36bab03289105
	.xword	0x49f0e993905bd6cd
	.xword	0x5c332ad60dd188b1
	.xword	0x59538cea58199e96
	.xword	0x17cff5efe6bec662
	.xword	0xefa1f59cc80333b3
	.xword	0xa143e722413b117f
	.xword	0xbca839b5f49fbfa8
	.xword	0xd03e0310af91b490
	.xword	0xee75448354677cfd
	.xword	0x10fc17890fdf48db
	.xword	0xdda79d9c8051beab
	.xword	0xed2a0cbac1f55286
	.xword	0xc1e313f62c992ffa
	.xword	0xf0fcd56dc5615066
	.xword	0xb291eb39c5f7301a
	.xword	0x1d6e88d6fd48d6cf
	.xword	0xe2066ae60d91d4e9
	.xword	0x5064de4826eeb368
	.xword	0x330572d2ed07d347
	.xword	0xa11ef4e3fcb2c320
	.xword	0x0ba69438dde2f757
	.xword	0xc735aa19e8a96f1b
	.xword	0x0b58853b83e46d84
	.xword	0x277d9b81a2e13e1d
	.xword	0x2c24eeaff41860f4
	.xword	0x4accae550810a693
	.xword	0x06cff9904c27dcb0
	.xword	0xd7fdb3ef443b6486
	.xword	0x71d5daddbbca5f5b
	.xword	0x613793d705f2ae47
	.xword	0xdbee956bfe24bf48
	.xword	0xc830c9a50302277a
	.xword	0x33b5fb9df07200f5
	.xword	0x7cfa3e7b396dca52
	.xword	0xd81e4a3d240cc7e1
	.xword	0xfd3bd3c89cff6853
	.xword	0xb7c96ca5a49d8f02
	.xword	0xc2804c824c47f6f6
	.xword	0x5d10fc630fc7f74f
	.xword	0x7bd4c58801522bf2
	.xword	0x290e0c086b89078d
	.xword	0xeb47560e1eafeb86
	.xword	0x7eb0dc3c35c53a1c
	.xword	0x9e379e2788e59a81
	.xword	0x10c2464bb0b23d9b
	.xword	0xd092ef4756b3fa83
	.xword	0xbfbf72f49c499c19
	.xword	0xc7a04a7daea0f458
	.xword	0xa16c2473c2ea6a6c
	.xword	0xbb31ed04aae444b8
	.xword	0xe9d6328a8fd658a7
	.xword	0xe3167e890ed79403
	.xword	0xa9ee74da7847c179
	.xword	0xd0e632c2415e8009
	.xword	0x21d9358d0d399767
	.xword	0x11359861ed9f7ab1
	.xword	0x070baad6b29494ff
	.xword	0xc2cc4a7132062d44
	.xword	0x15c85e0941c7e7ed
	.xword	0x38d9d8fd7d225cc9
	.xword	0xa1e670960c604ae2
	.xword	0x3518f5ae69f0d8fa
	.xword	0x2e1d3f00e42a3e1a
	.xword	0x5f023d63157d8eeb
	.xword	0x07013ea2129d1e19
	.xword	0x2a1ced5b9ea53073
	.xword	0x1d4c5ad0e58c1e15
	.xword	0x9b5d9a10184e6683
	.xword	0xb2d3bd0c8dca9821
	.xword	0x6e9a11ea4efc53da
	.xword	0x47c79dd936f29ff1
	.xword	0x9ee86be5501174fb
	.xword	0xedbea916f693bacf
	.xword	0xf714722f060c519f
	.xword	0xa317766f5f7a3117
	.xword	0x9698ae043b3a5013
	.xword	0xed99a405224f8946



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
	.xword	0xe29354a660eb6bee
	.xword	0x73bd05825eb36cc7
	.xword	0xacdc08c4ddf0bc94
	.xword	0x24387b03d4a15c3e
	.xword	0x501e26a3d3790f3f
	.xword	0x16ae7843c2fb0183
	.xword	0xb15ff70d2dff081f
	.xword	0x28c8119d61f2a709
	.xword	0xa8fc210606a6f329
	.xword	0xc45b1ca880bbbc40
	.xword	0x61429ded17d2aaa4
	.xword	0x6e5da9aa751a175a
	.xword	0x60c0be1d83b8385c
	.xword	0x48ef871d68062dcd
	.xword	0xc09cc4f9ad4ad4e2
	.xword	0x42a7cb18b6cb8f1f
	.xword	0x707d6d9a822834df
	.xword	0xbcfca81d28e0f3b2
	.xword	0x6a7986b46badb6db
	.xword	0x705021f8e4d4b0ca
	.xword	0x8270d1c2a5f77a7d
	.xword	0xb69c14cadbf89b29
	.xword	0x1c44ea639cc2703f
	.xword	0xb87610416971145c
	.xword	0xc86fc11accf6197e
	.xword	0x617c5421c53b74f3
	.xword	0x0cbc820d15eff4e2
	.xword	0xdc387dc4e0a8c952
	.xword	0x3e0bb41ab507a326
	.xword	0x6ed77330f841480c
	.xword	0x702e9c7bab509902
	.xword	0x4e925c85392f97da
	.xword	0x2eb0463baf64eb82
	.xword	0x244325d7571f5bda
	.xword	0x31058012192ca596
	.xword	0xb73400ecbd1d4886
	.xword	0x6fdc08a8e4211bd4
	.xword	0x4e78490618f6aed1
	.xword	0xea8c46bf97eb3d85
	.xword	0xabb11364bf2908c1
	.xword	0x641fb64013433225
	.xword	0xc526c22da0ac9d18
	.xword	0x399204e9b42bc38a
	.xword	0x266f3e09a25e3fb8
	.xword	0xb39a45212c39e73b
	.xword	0x7fa998df1c2e5d99
	.xword	0xf94e30d15bfbf1ba
	.xword	0x19672136e5dfdb4e
	.xword	0x25eb2006cbe5bb99
	.xword	0xd5b98f2714a9b27a
	.xword	0x2f53182e28a4cf45
	.xword	0x3964e39ecabe4ffa
	.xword	0x0c4e0009f5cbae68
	.xword	0x82caf4ab536b456e
	.xword	0x75612abc770896da
	.xword	0xe4df7feef81aee6a
	.xword	0xf2a9b3fd05e01466
	.xword	0x3cd890048fa6db8d
	.xword	0x7e20f95b4f6fd151
	.xword	0x28c1c254c5bf9642
	.xword	0xf20d17a9efa651ad
	.xword	0x1d5af8b3b6eecb15
	.xword	0x224c807fe551cb26
	.xword	0x67db9920d8cb63da
	.xword	0xd6ef4b805f3cf5ff
	.xword	0x17ed4c9a76e7893c
	.xword	0x05207cf26e01f81c
	.xword	0x1c3391518619288f
	.xword	0x424796e165259b1a
	.xword	0x035f160bf40bf956
	.xword	0xc548a0717a98b6ad
	.xword	0x24feaea2bc0aa737
	.xword	0xe0257a8ae6e1d876
	.xword	0x698a810877d0afad
	.xword	0x25a7095090f6f349
	.xword	0x1d7e61f42a7b31a4
	.xword	0x2460b143994982db
	.xword	0x17ad5b11022fff36
	.xword	0x358bce29fbdd1ef2
	.xword	0x08fd49226eefe132
	.xword	0x89add2457d9b5713
	.xword	0x79096e1f97f9de41
	.xword	0x88d840a3eb1fb50b
	.xword	0x07bafd4591bc420a
	.xword	0x8bae85cc6c8688f8
	.xword	0x09f39568531e4f48
	.xword	0x4e82cb444fa55a34
	.xword	0x1c533d9e9446a8ba
	.xword	0x3be615a0c2835639
	.xword	0xff413f3ba6307090
	.xword	0x311b26f978e35225
	.xword	0x94ff6fcfe4fbee70
	.xword	0x04825eda4edff305
	.xword	0xbd66b3c912e020d6
	.xword	0x24a53055c724bac8
	.xword	0x07de3d4df5477b8a
	.xword	0x00fc963dd53aa3be
	.xword	0xa393368f54d52400
	.xword	0x9ee208b799af72d3
	.xword	0x3974c64f958a1696
	.xword	0xb7fda0a58ea5cea6
	.xword	0x72c0ccd2271685e2
	.xword	0x97d7e4a01c55fffe
	.xword	0xd8d37a9a2c1c1a05
	.xword	0x747a6c84724d190e
	.xword	0xf8a71e240873fcb6
	.xword	0xb0d05bcef6b26a3d
	.xword	0x21fd8a239a2ae4fd
	.xword	0x013c583e90e5ebab
	.xword	0xfef6cdf2db3562ea
	.xword	0xdf0f82e43e7031ac
	.xword	0x262f11957b9c33a4
	.xword	0x2ae4cdb163eade00
	.xword	0xcfa4fd5f7f50ea77
	.xword	0x9728d15e05dbef86
	.xword	0xf6035a72640fb452
	.xword	0x9e5bfd5e2ff7fc44
	.xword	0xb4e005bcf3fa0aba
	.xword	0x4852f0c30fa2c764
	.xword	0xe950bbaee8a49097
	.xword	0x9008216633b257a2
	.xword	0x518744f47ee72d1d
	.xword	0x32bb95a67e523c94
	.xword	0x25616848a42b87f8
	.xword	0x63b92c115a84d0f1
	.xword	0x2e5cd373b72b0b0c
	.xword	0xb058d6ba3cdb2074
	.xword	0x55baa8afc5c694cb
	.xword	0x9e855602e824a2cb
	.xword	0xca9130e8d7c192b1
	.xword	0x9af651664fca1ef4
	.xword	0x9e21a3db85bb97a4
	.xword	0xf143a64179476a00
	.xword	0xd1cd352ea180f99d
	.xword	0x6f91ac89b60da79d
	.xword	0xb60d9a8120953e33
	.xword	0xf8f38e70951d3ee2
	.xword	0x3ccf40db2eae1969
	.xword	0x6a83f0b625605c09
	.xword	0x829233af5202e598
	.xword	0xc4a81964e28ae6b8
	.xword	0x1f65424d8d047c0e
	.xword	0xa5f16d1551e43b80
	.xword	0xe82e800f1e25cfab
	.xword	0x0ccfd3558a905f81
	.xword	0xf9256c7b35c1bd85
	.xword	0xad8d7ed8238aded7
	.xword	0xfd40044ed416444c
	.xword	0x75be4265dfd3c689
	.xword	0xc42ec259a9d2df02
	.xword	0xc32cd3fd0dc37d58
	.xword	0x55e7366151e5b04e
	.xword	0x826c549d13ea0a44
	.xword	0x76499e29660793db
	.xword	0x4d424ee9f6522447
	.xword	0x6a66e9260de95640
	.xword	0xa141086aecdb7aa3
	.xword	0xb35baed7e2ee5fca
	.xword	0x16b7b6d32193e211
	.xword	0xf6ed5384ad1065a6
	.xword	0x673381f23ce3ea07
	.xword	0xbda78c301283716b
	.xword	0x5b9341e3218d193e
	.xword	0x779d5510e57d108b
	.xword	0x84b057c0e8468b90
	.xword	0x5be9658fae35154a
	.xword	0xddcee75f589c8340
	.xword	0x934a72711a0f1609
	.xword	0x43f37e60ee830f92
	.xword	0x1b0a9524a9ef26af
	.xword	0xcad5416656e386ca
	.xword	0xc8067100b2369eaf
	.xword	0xaa586fda31ac9c8e
	.xword	0x4770a1b84e39716a
	.xword	0xa17421095663b698
	.xword	0x6ddca9636b934122
	.xword	0x0888866a3040d1c7
	.xword	0x690f825e4a8c55e4
	.xword	0x1ff33b2039a45462
	.xword	0x2a0f2dcb8bd26f2a
	.xword	0x17ba0bf937debce4
	.xword	0xb448c760c9fbddb4
	.xword	0x5896cfbc8f6cb9cf
	.xword	0x7f5d20039920dd83
	.xword	0xb34e8fe15cdb000d
	.xword	0x5a8623b7a9d6bde3
	.xword	0xca09ac5795cd0ec4
	.xword	0x4897e9e83a66a8f0
	.xword	0x8924cabcc7bc5655
	.xword	0xad644fea3c96f79a
	.xword	0xe1a548be1626456b
	.xword	0x6ac50600a59984eb
	.xword	0x7b7eae97e092a097
	.xword	0xfa1603a27e0fe573
	.xword	0x99105e91c37ea490
	.xword	0x8088380a492a0b5c
	.xword	0xb6f6cc090068cc1f
	.xword	0xa38131ffeb4c6af8
	.xword	0x43fb009a2a951113
	.xword	0xf46252965af8cb02
	.xword	0x5b83fe892b44dca9
	.xword	0xb5504d57a2f8b101
	.xword	0x82e7eabe92c63c78
	.xword	0xeb892a05f226d787
	.xword	0xcf1f345ea0055147
	.xword	0x5be4b2d776bca1d9
	.xword	0xfee2e84e3ef6e249
	.xword	0x201645c94f42f7fb
	.xword	0xb240e50106ad9a33
	.xword	0x1d0b749f70d08ab6
	.xword	0xb62f11ca9e6a7c16
	.xword	0x682af6699720d892
	.xword	0x5cabf55541df5ca0
	.xword	0xffabbf7a98368e4d
	.xword	0xfc574fd61005255f
	.xword	0xaf77b9073a9cec78
	.xword	0x862f2106db483eb8
	.xword	0x5a98152a59d1f071
	.xword	0x4e6d047e5c1cec18
	.xword	0xf6a2d8cb6195cc70
	.xword	0xa3e9b16ab1cfdfc1
	.xword	0x79f04df33862b7cd
	.xword	0x0f67a40ca3184afc
	.xword	0x22f0a4210aa529fa
	.xword	0x72c6ca0d4dc6d3f2
	.xword	0x71cf913192012cc2
	.xword	0x53039e25e06113fa
	.xword	0x854bfb3cbe0fa142
	.xword	0x15f21cf62c22bc86
	.xword	0xb5b105830eccd07a
	.xword	0x78d89434b54674a9
	.xword	0xa27d2f5a09db685a
	.xword	0xcb6d16ee00c17cc3
	.xword	0xc4852386b2516b13
	.xword	0x3465c19001c0b844
	.xword	0x44a1e617d07d519f
	.xword	0x7406d02841894d06
	.xword	0xe320d00bd4b30b42
	.xword	0x1942b10a26db2c30
	.xword	0x87c8cb82948541f7
	.xword	0x1c5ceb3712cc8521
	.xword	0x95d0efc7efb5df67
	.xword	0x318e96bc797882d1
	.xword	0xe8f96fbd7a7d5741
	.xword	0x8af73820c12ee6d2
	.xword	0x15bd2eaaa08a027f
	.xword	0x94fc45e26f550afb
	.xword	0xb98d5a06c8660320
	.xword	0xe2d0d67dfec41e88
	.xword	0x376eef69d7513587
	.xword	0x7b36f501ea13b79e
	.xword	0xeb1a5f8a320444e1
	.xword	0x2e8885b5226d9a75
	.xword	0x4dc82a8411d01960
	.xword	0x836d9f4b55617516
	.xword	0x7fb8bdf9c8ea8796



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
	.xword	0x1482cb43957df1a8
	.xword	0xa852118a1fcc4e45
	.xword	0x9ab691a300a3bf96
	.xword	0x9d881e5e6ec4e3eb
	.xword	0x2ddc985d196dace1
	.xword	0xbe0a94a157164c63
	.xword	0x36a190a5f58f147f
	.xword	0x25a5f971d336a861
	.xword	0x94af63eb54177f9b
	.xword	0x0dc35e64ad589b5e
	.xword	0x35cfeefab19a21ae
	.xword	0x55a1ccf369d2b605
	.xword	0x0db53e711cdc8f37
	.xword	0xe6e136d2230f7d51
	.xword	0xfcf6bb9556bd76d1
	.xword	0xc14ba5e0b5f71ec6
	.xword	0x3979f9032e7c2a25
	.xword	0x1e4604cc0427d9a0
	.xword	0x7303be1069c016c6
	.xword	0x6c0155ecfec044b9
	.xword	0xd4f69478df85e614
	.xword	0xa5bf171a20372277
	.xword	0xc69ac8cab0628604
	.xword	0x31c256c7090c56d8
	.xword	0xc0611e94f5da2ec0
	.xword	0x6ebd3ddf2b00f055
	.xword	0x3c4f6188e57b744b
	.xword	0x678e9c7c1d99abd1
	.xword	0x858c548dbc8707da
	.xword	0x3dd39517058e11c5
	.xword	0x4f46fec91b261fdf
	.xword	0x34ecbc36bc4ead1b
	.xword	0x376613d9c2e5b11b
	.xword	0x550569d838f53d20
	.xword	0x8e1cd1bc2ef5fb5d
	.xword	0x2590785fb3c59d69
	.xword	0x176f9f3e1b22b0a4
	.xword	0xd2f1bdcf6ceb4111
	.xword	0xa111c27406db64d7
	.xword	0x42ea3f6a857998bc
	.xword	0x51fee77bcf5ae69f
	.xword	0x77e869d655e7ed10
	.xword	0x3887ea8f29c32bd4
	.xword	0x231b442dc831d39e
	.xword	0xc56e779a8ed9e831
	.xword	0xcb2fb68f93f43681
	.xword	0xd130126493c2614b
	.xword	0x11502ca2ea8d5117
	.xword	0xa325685bbd44f15b
	.xword	0x88e928527e235598
	.xword	0x6a0ce60dbb0dd789
	.xword	0x694f5495de037304
	.xword	0x58a243da9840e9d9
	.xword	0x2ab051b01799078a
	.xword	0xc734e4d8b93f176d
	.xword	0xba97e47c91a44946
	.xword	0xe8f423a18a8f3791
	.xword	0x165202cc9df9427b
	.xword	0x3d198d00e467515e
	.xword	0x266a83e9eeb3b831
	.xword	0xb4113c5836bc788a
	.xword	0x5b34d07946baff91
	.xword	0xddcd38a8f8a35198
	.xword	0x138039f39311facb
	.xword	0xc619efc84df7887d
	.xword	0xfac4ef98def4c947
	.xword	0x19597af57cbe640a
	.xword	0xe9bd87b595ec06b7
	.xword	0xb993ba9f455c774b
	.xword	0xb9b9754a6cccf310
	.xword	0x77f8110314fdbdd3
	.xword	0x39648102f269a626
	.xword	0x40544bdfba6589df
	.xword	0xbf2490d7f5c3317a
	.xword	0xa7a45b34bd8aa423
	.xword	0x7e72c079c82eab4e
	.xword	0xb767c9dd152086ca
	.xword	0xc213f18b7eb4923d
	.xword	0xac7f0c365fe4da3f
	.xword	0xc0e1234bf72c7e2e
	.xword	0x3e85af8461fff079
	.xword	0x1176363cc3350c70
	.xword	0xf1a16ab8db4f52b2
	.xword	0x687bb2ab785b77c9
	.xword	0xfb584f8c036fd991
	.xword	0x7c10661cf393937e
	.xword	0x13006b911d4ae14d
	.xword	0x14e8e3e282aecc3c
	.xword	0x952cf9cfeaf83611
	.xword	0xd043c313b6be99e8
	.xword	0xaa839b3f7e6cb9bd
	.xword	0x043e414c2a4c9378
	.xword	0x5e0c77287e2de2d5
	.xword	0x3cd4d458a662f81f
	.xword	0x18579a08c912d3d6
	.xword	0x297d9ac17db90369
	.xword	0x414de8fbd0410504
	.xword	0x8c4bfebe20d2d655
	.xword	0xe3389ce7f289dab1
	.xword	0xaf7515fca3b0a79f
	.xword	0xc46e3584fd8caff7
	.xword	0x192cc1744d0688c5
	.xword	0x8ab33cbc6785217c
	.xword	0x2daa972d8070137c
	.xword	0x6bc5889c59ee9aee
	.xword	0x17d092dfce9d407a
	.xword	0x9f0f235e9bc4a0a2
	.xword	0x56c984f0d62b6e7a
	.xword	0x6c05593cdcdf9d7d
	.xword	0x5c4edba9b5e3fef2
	.xword	0x52426852f6f9c7cd
	.xword	0x71769f6560c7173c
	.xword	0xa6e161b6e1b9573f
	.xword	0xaa38d9381fb6a7fe
	.xword	0x3dc8b4f0ed9c8022
	.xword	0xa55a3940a10e3b29
	.xword	0xc3e0e3e7c2476fe9
	.xword	0x4ff79d8bb5680dae
	.xword	0xe3d6b642ea881757
	.xword	0xeaa4d982ea26fe45
	.xword	0xd4965103be92cfbd
	.xword	0x14efe267f51e7e46
	.xword	0x9e52b0ad94addb8b
	.xword	0xad98d5e8aa38eb1f
	.xword	0xc874394a5974c088
	.xword	0x9d6677c7ea1636f6
	.xword	0xf7250e236da67af6
	.xword	0x97ab527f6e0f7180
	.xword	0x232e129bd4eb6e5e
	.xword	0xafddca7f9312f0f1
	.xword	0x204b5617cc5501c5
	.xword	0xb134ec983745b47d
	.xword	0xad2c1c2326e1a6dc
	.xword	0x6a1a73aadff5e1f8
	.xword	0x0f69872e11842c36
	.xword	0xee557d81ff4c09c4
	.xword	0xf368e05c4a8168b7
	.xword	0x4afa5ce0a838a480
	.xword	0xad7f8aca1617f78a
	.xword	0x5df6ed84a028c2a4
	.xword	0x441ee10481d18753
	.xword	0xc1aab6fce7d750ec
	.xword	0xebf5e837f424270c
	.xword	0x226a826facb02a92
	.xword	0x720dcbd125b55cc1
	.xword	0x9f580c0d4567c43f
	.xword	0xa1cd189bfcbb9088
	.xword	0xf07f21b2fb070f00
	.xword	0xe6f075c16ef88d7c
	.xword	0x77e569fe8c0267eb
	.xword	0xb3614bd6b79ba1a8
	.xword	0xcbde1d841a06edc7
	.xword	0x22a93e89e5e22e00
	.xword	0xe624c7ba95aca921
	.xword	0x6205b830fe3393e5
	.xword	0x0dcb3db3db5a1531
	.xword	0x1efe18ddeb695a15
	.xword	0xd3949a64e8db9a46
	.xword	0xeec7a1de7a2f3d47
	.xword	0x67325571ebda12fe
	.xword	0xf728f8730edd9738
	.xword	0xe8ee71b9cf627528
	.xword	0x439a42ec91d9ebee
	.xword	0xb9a6038153a9639a
	.xword	0x68099a5c9b5ae6ee
	.xword	0x431733934f49ff7d
	.xword	0xc7e5aa294b8345f4
	.xword	0x89e7b74f29614907
	.xword	0x18315ec457010d56
	.xword	0xcc141bc363774df2
	.xword	0x6a4266e65d80a1b0
	.xword	0x76537eb57019b003
	.xword	0x04db4bf5f704fae9
	.xword	0x22ff924315b028c1
	.xword	0x098aae5dc7226ff7
	.xword	0x87ed37f7445d6733
	.xword	0xbcbdd4e5c5426f41
	.xword	0x41be65c00623f00a
	.xword	0xcd00ed4548af1bc1
	.xword	0x22b317f41639e41f
	.xword	0x486ac9e88c3a233a
	.xword	0x2cde68f1f5ff73a6
	.xword	0x4d021b812653fe2f
	.xword	0xfc3c308e25d425a8
	.xword	0x6993250e61001545
	.xword	0x167cf3ef48dbf846
	.xword	0x37059a0e78a15ba3
	.xword	0x3015fca4fa215c65
	.xword	0x356c7edd8aa1f2ae
	.xword	0x11a558864e1cb0ef
	.xword	0x5ec9540627b4d764
	.xword	0xe8d51f76b4197429
	.xword	0x11019fed919c1fb7
	.xword	0x4101d391d99d4bab
	.xword	0x41f446141c1717fb
	.xword	0xe8b281d86fe10794
	.xword	0x79bfa21aaca4983d
	.xword	0xf2be947cd1320581
	.xword	0x37d9e59538c6af8f
	.xword	0x95d0de44ef71619c
	.xword	0xe362a6502ab1078e
	.xword	0x2dc0ed6601870a54
	.xword	0x9052b0f0ca66a0bf
	.xword	0x8330c71bf389731c
	.xword	0xfbbf71b5e666ebdd
	.xword	0x0b476a1c1aa812c1
	.xword	0xeff00eb959630320
	.xword	0xb0faf3c1fbc8149e
	.xword	0xa6ee31aecd87e585
	.xword	0xdcec4215e6885b46
	.xword	0xaa1f8e06db26e28d
	.xword	0x880776b2a9250464
	.xword	0x1d41cbec7189c66a
	.xword	0x6158ab928f5491af
	.xword	0xce55567a7c5f2c8a
	.xword	0x122b6aba52862f49
	.xword	0x5f1383ed1a498e72
	.xword	0x6c43dd082a94d820
	.xword	0xf2c2c841a14507ae
	.xword	0x5c3cf59b45561875
	.xword	0xe5583bf26e69e02d
	.xword	0x1820302d10050deb
	.xword	0xcc5595c0a6f049ef
	.xword	0xdb1d4611fcb91ba7
	.xword	0xef8be5178e2cb3f9
	.xword	0x4cee2c928d766413
	.xword	0xbbfd872a2169b553
	.xword	0xa4f1c154556806eb
	.xword	0x10224c6d3ffd7133
	.xword	0xb1f4c9ef988e9989
	.xword	0x3b59325229fc46b9
	.xword	0x7567f659eb031dff
	.xword	0x5450b00f6b881042
	.xword	0x03a00ce11ecd3478
	.xword	0x5e465c35b3ff4197
	.xword	0x24ceb0f7d7c93547
	.xword	0x46dab5860e4c80b1
	.xword	0xc9a5f97e19159b35
	.xword	0x36c5066d54c98d81
	.xword	0xea7acaaac6a8fe34
	.xword	0xf9f794483dc4c68a
	.xword	0xc24fd1f766788385
	.xword	0xbae9cb1900143f93
	.xword	0x9cd1e56bd1a31887
	.xword	0x2425ca47c93a1c4b
	.xword	0xd36cdb7177dc9048
	.xword	0x3f468ece7ddcec94
	.xword	0x703760c827a9c2b0
	.xword	0xaf4cca8874c0b3c9
	.xword	0x84ccc556906978f4
	.xword	0x9546ca905f0db7f4
	.xword	0x11cc0dbcf766ea12
	.xword	0xd3b32adb20bc3082
	.xword	0x7ecb2de22078bb13
	.xword	0x332e019d12e5e13f
	.xword	0xf04b44aa5f1bc92c



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
	.xword	0xe288563f572849cf
	.xword	0xd98b509fa09cb6d2
	.xword	0xb46781b644e79d5c
	.xword	0x955ccad6409e6db3
	.xword	0x7ef24f63d480eb46
	.xword	0x419e9ed5c7d090f7
	.xword	0x7d15ddd10cbf347f
	.xword	0x823e4ac6f7f040db
	.xword	0x54ba083727febfcd
	.xword	0xbd555e5f25acfc6c
	.xword	0x389c75b5099e3f62
	.xword	0x6341074afe03bf89
	.xword	0xdb1c48d50fb05597
	.xword	0x8021ac651b2f04b3
	.xword	0xf236f08a82f0a545
	.xword	0x0ab5b1f6a6aa1f8e
	.xword	0x84dfbdbeb3d49d07
	.xword	0x399659547e238cb0
	.xword	0x05311a95c863e2ab
	.xword	0x00a6a86b2f5785a1
	.xword	0x95e8c5e8b57f11d5
	.xword	0x85bbd460a9bf9222
	.xword	0x5603e5c03ac8df20
	.xword	0xeed1f97a1c5f9759
	.xword	0xca00c0cb18de59d7
	.xword	0xe3a23d2df5f7ccb3
	.xword	0xbc250b8921f0caf3
	.xword	0x95e23853cf07c223
	.xword	0x1960b91d33a2d8c2
	.xword	0x456d2e010b80ba23
	.xword	0xa37276635353b6d9
	.xword	0x9efb010b579e7c23
	.xword	0x426ae79859c9188c
	.xword	0x279aad74c2ba9f7f
	.xword	0x15edd3ac0cbf5641
	.xword	0xe0f82cd11659c015
	.xword	0x9bc264301a892c35
	.xword	0xe206b41a8d315279
	.xword	0xf56dda97b2ae0fc4
	.xword	0xb805fa08c7353ddc
	.xword	0xb01e832780aec04a
	.xword	0x3e07877da539b056
	.xword	0x771877e7ab99ce13
	.xword	0xa8eff8a0d6874836
	.xword	0x3bea75a45af0d6e7
	.xword	0xe1f759f2a660a1e3
	.xword	0xa19ca0d763dc2504
	.xword	0x9c2a319daacace35
	.xword	0x33701bc3743559a5
	.xword	0x3a74127a95288991
	.xword	0x8d5fed4d4da0bd40
	.xword	0x1386bad404a08fbc
	.xword	0xe22b04ef5dadc9c0
	.xword	0xe725429f1fe6aede
	.xword	0x6e966b5bb47927ca
	.xword	0x905f4d41f41069ce
	.xword	0xd493c37984711434
	.xword	0x0c61c6d778778a49
	.xword	0x023d67a741014460
	.xword	0xac526fb7a61ae198
	.xword	0xc0e9eb353d663dda
	.xword	0xabf00e191d6974ce
	.xword	0x0ba637ce30430695
	.xword	0x26eec89a9231a8d5
	.xword	0xa493fb927c1bc099
	.xword	0x27f7bd457c851c92
	.xword	0xecac70e944e0bcf9
	.xword	0x21c55591dc663d8b
	.xword	0x3babdb1ccc965deb
	.xword	0x0947500b772638c3
	.xword	0x6972cc59aeb3c77a
	.xword	0xd0dcc3edf5b4e226
	.xword	0x010cbbada7f35156
	.xword	0x1bd52680ec91430c
	.xword	0x62a7cecee93f81b3
	.xword	0x3ec5ba7581400776
	.xword	0xe0c8a7d39f4a65c5
	.xword	0x7a2ed7f14541b32c
	.xword	0x257050a45864bfae
	.xword	0x1dd9e9f7f366dbbb
	.xword	0x9ec6b4d5e3d96607
	.xword	0xcfd374cdc0295e61
	.xword	0xc6e4bf035a3224d5
	.xword	0xdebdc80f9ca1e6b7
	.xword	0xc41926cc0e8cae6d
	.xword	0x11d023b4e35fc6bb
	.xword	0x6df0d2a8ac70ed60
	.xword	0xe04a3996fa46688c
	.xword	0x220a57a11822eb1c
	.xword	0x66f13b8b0a0e2ec8
	.xword	0xa24db11297b1c9b8
	.xword	0x58ac46f9b538c3c2
	.xword	0xb10357f76407cf54
	.xword	0xab1acba533eedfd8
	.xword	0x5823a067087b4a91
	.xword	0x392d58b589ce7389
	.xword	0x079e4a44376dc563
	.xword	0x71a5b0888e34e4a1
	.xword	0x33e0bfe2c03ec7ed
	.xword	0xffe7b4c1ccb74498
	.xword	0xcc0d22653f469242
	.xword	0x20327048f987b874
	.xword	0x050f56827ea86e79
	.xword	0x394041ba00cc5e00
	.xword	0x89e193c48c6c7c95
	.xword	0x8f1198087e565468
	.xword	0x416dd281315cf7af
	.xword	0xd03ee8403addcadf
	.xword	0x9674188346b978b1
	.xword	0xa801adba3760021c
	.xword	0x130356a42bfc66b1
	.xword	0x18071995338f596f
	.xword	0x5e77344feca6c60f
	.xword	0xf14c277d74ca6b12
	.xword	0xb0dcc31d2826e762
	.xword	0xa7b880963eef32c9
	.xword	0x8bc8b89c3c2282cf
	.xword	0x66e8d622356ebe13
	.xword	0x9d5ec3bca42f958d
	.xword	0x7eb8cfaeb7c1dc2d
	.xword	0xa6f9b2222113e39b
	.xword	0xe08faab7ea2f2d2a
	.xword	0x54632a4f3f3f4e78
	.xword	0x7ae2a979339781cf
	.xword	0xf8b1c37e7763a590
	.xword	0x68a60d2d3eb408b8
	.xword	0x71d4d928dfabe944
	.xword	0xc2886e1c86944d26
	.xword	0xa90b9889c21d5178
	.xword	0x9ef89c7231db8fc3
	.xword	0xb6b408a3b99e2640
	.xword	0xd88c1b1327daf7ee
	.xword	0xc8f18493ffc43d60
	.xword	0x5b72023a4c5a434f
	.xword	0xe6af9fe199206692
	.xword	0xebc95c6d635f45b9
	.xword	0xccc02e71cfc9e376
	.xword	0x926c18ff64b2325f
	.xword	0xd3bdc9d29290ffb6
	.xword	0x2f85d1c31773fbbb
	.xword	0x09f3e424dec8a979
	.xword	0x6b1d0c69a59ced25
	.xword	0x60357b54e7313e26
	.xword	0x2e9c25d1d6f88cc9
	.xword	0xac9d074f4d899c0d
	.xword	0x3b90e29c4c713089
	.xword	0xafbf8c333b7d908f
	.xword	0xee63e75c8c3f1db5
	.xword	0x62ed44e57d50959d
	.xword	0xb3d52c10500699ad
	.xword	0xc5f2805b94f5e2ff
	.xword	0x588bbc68cdfe6c3a
	.xword	0x60ee78410023ee71
	.xword	0x72e2cb671a75b7e3
	.xword	0xdee54acfb289abc5
	.xword	0x9e866bc0eccc4b18
	.xword	0xb9cda108d4cd44b5
	.xword	0xb31daf6fa8243e11
	.xword	0x896986ca233f4d83
	.xword	0x14d6f2729ff9b226
	.xword	0xc8ff49588d2904a1
	.xword	0x52798a05822e2688
	.xword	0xe724e5b7056764d7
	.xword	0xcc9e377f6caf12ec
	.xword	0x1ecde91f0e55d94f
	.xword	0xaafdaab4d2798e7c
	.xword	0x65d089ee988efbb1
	.xword	0xf2d10c96624285e4
	.xword	0x0168ef63fe1d91d2
	.xword	0xaeed6d05170316f8
	.xword	0x369e97dab50c00a8
	.xword	0x5cd4bd989df75215
	.xword	0xea3dec4dc9c85a82
	.xword	0xce1b3178ad2b2776
	.xword	0x2f0ff8c6c9ef0c8d
	.xword	0x86c8273b439cd062
	.xword	0x19b586080a5529c4
	.xword	0xa7f4c12ef6108589
	.xword	0x5945b06d8eca8731
	.xword	0x193b5ed5f626dc9f
	.xword	0x7e120b8fc5ec4d05
	.xword	0x7852de2dca50897a
	.xword	0xfa5ad0d6b942e3d8
	.xword	0x7c83e6eb2470a850
	.xword	0x7324ec03dabdda7a
	.xword	0xe7a569c0801cd1c2
	.xword	0x97558929c1b64cc4
	.xword	0xae14e7ade9c98c67
	.xword	0xfc3e4a1efe0f4a96
	.xword	0xaaed9fb1c9d8831d
	.xword	0x275f4a9d6b60100d
	.xword	0x3af6bfa75f18edac
	.xword	0x8d51889aebe592d3
	.xword	0xaeeff052599e7aab
	.xword	0x07c0c128603c9e1b
	.xword	0xde8f38b3898600c3
	.xword	0x8836af2e72b5838f
	.xword	0x02b060b884889337
	.xword	0xd5637d05fe098998
	.xword	0x31b0546952cb08b6
	.xword	0x96ea8d53b2fe7f4b
	.xword	0x83ca0943a160bb83
	.xword	0x59f102a63b2a7ea4
	.xword	0x398d16de1aa199e5
	.xword	0x5a892825ab4ce174
	.xword	0x621412c69cf2012a
	.xword	0x11e4da7daa9e7044
	.xword	0x538a6757f1076a5a
	.xword	0x54e4eccf4d0ed154
	.xword	0xec0845f5deba459c
	.xword	0x040dffb64cb16bbb
	.xword	0x89d2c1c9a95f197d
	.xword	0x680cbbe8c241732c
	.xword	0x88e21c3666d7a6fd
	.xword	0xb6b8989e1155b5ae
	.xword	0x513c7a7430cf4aa1
	.xword	0x4ef874e2f4dae3fa
	.xword	0x4c8880e84b86c10b
	.xword	0x0ac74b7276a8d729
	.xword	0xec74fec2c2b22f94
	.xword	0xcaaf9775be42347c
	.xword	0xb155a7053b2ec376
	.xword	0xb5d687a699fc7e3b
	.xword	0xf6b44cfc3fd88db3
	.xword	0x3ebbf8516b71e1f4
	.xword	0xde28a88ae3305d7c
	.xword	0xa0b5543bf355dbea
	.xword	0x42374ea7f3e5f931
	.xword	0xe129e606b3c44dac
	.xword	0xeb5ec366b77e31dc
	.xword	0x904e8170057fa8c4
	.xword	0x4797c1bfe5031602
	.xword	0xdec725bbac3cb6ba
	.xword	0xb91ee2b17f48c168
	.xword	0x118e0491ac7a6f4d
	.xword	0x11f057222ce1b267
	.xword	0x21ee9cbfeb752294
	.xword	0xf5ef53fcc3d65557
	.xword	0x7dbcb8c29b5dd2ec
	.xword	0x3af2bcb5617c7a71
	.xword	0x5a960268de4b1fa0
	.xword	0xa3f5cc9fdca79d57
	.xword	0x21db8e4dfa4fa5db
	.xword	0x2f71118b65eec9b4
	.xword	0x316c03f36ef091fb
	.xword	0xe27bb7468388d63f
	.xword	0x5cbbdcb32f249d32
	.xword	0xf413b0e696039c62
	.xword	0x99c26c1946a3018d
	.xword	0x32f4d73c496def94
	.xword	0xb61f7bfbf62816ad
	.xword	0x3495755c9e80ff9d
	.xword	0xfd738bb36d9e4a00
	.xword	0x3058156cf2b5de35
	.xword	0x5e2042b863847938
	.xword	0xb6fd3a4ac14639be



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
	.xword	0xfa182aa535af5aca
	.xword	0x88ef67224c692e94
	.xword	0x1e002ad85da141a2
	.xword	0x7e98189ab49ec9bf
	.xword	0x7c669efaf3b3cbd1
	.xword	0x0b87b473ab2a82bf
	.xword	0x859a75d1e144ae89
	.xword	0xe3b0177c8c9e8dde
	.xword	0x0999ee7add3f39fb
	.xword	0x4e9ef5c4d0f77eb5
	.xword	0x04b4b938ec6621ad
	.xword	0xef17aab32a96b000
	.xword	0x40866a6acd5f6662
	.xword	0x12f10420f0bcca82
	.xword	0x441fc4475a80fc8b
	.xword	0x745ebe94a0493e93
	.xword	0x82bd08b741c27de9
	.xword	0xb838b045a5d56368
	.xword	0x93d97e0df165b75b
	.xword	0x138f9b5047f3c16f
	.xword	0xb877491a057c55cd
	.xword	0x7d02b88328308c16
	.xword	0x34b3de4f28d3e795
	.xword	0x6f0a0dc4c40ef1fe
	.xword	0x815ab2d2405f4288
	.xword	0xe36a42c3a1fa2f27
	.xword	0x695c007003ff44c4
	.xword	0x699a6bff4721da2f
	.xword	0xfd199afda78ef57c
	.xword	0x795f904bf139a834
	.xword	0x3d3d4f51f202811f
	.xword	0xfc21a36a086b8783
	.xword	0x22e9575d301e0823
	.xword	0x17908103e7929126
	.xword	0xa595c43f49ac7bed
	.xword	0x65a913b9787073cd
	.xword	0xffb8c040e94cc0f1
	.xword	0x6be7efaed7a945e2
	.xword	0x58c5e2554a766c38
	.xword	0x4eff3ee4b0b795ae
	.xword	0xf8ec644542325a78
	.xword	0xee187619bc1de12d
	.xword	0x865ce22d63e94167
	.xword	0x225b0766b677c39a
	.xword	0x180d29945f4ca920
	.xword	0xf136b3bd5c4125a6
	.xword	0x8180761432b02c56
	.xword	0xe37254ede23bfdaa
	.xword	0xc8146b4322e710d6
	.xword	0x725bc1634380d073
	.xword	0x86f54d119fd2a33d
	.xword	0x01fb7f6dff82123c
	.xword	0xd26d3e4c38b3c757
	.xword	0xed9684b57e4566e7
	.xword	0x1b197a06e84f531e
	.xword	0xbecc4416101bf60b
	.xword	0x24f64674ebee2856
	.xword	0xb175443376c80a25
	.xword	0xc008e596693ca1bc
	.xword	0x91ba5dce187f03e4
	.xword	0xfbaebc8aea080c47
	.xword	0x48d56674b92512a7
	.xword	0x28f1393a8502a449
	.xword	0x25eb4bff2e454bca
	.xword	0xf701345375b6bbbd
	.xword	0x17067dccce11628e
	.xword	0x989451941b67fbc2
	.xword	0xf75e4b4d8c0ef93d
	.xword	0x00f45e9db23c4707
	.xword	0x0f2d15e0140147b0
	.xword	0x174735f7adf0b019
	.xword	0x4fa2da6c62e488db
	.xword	0xbfc5256d0e7d3b33
	.xword	0xe7456f22fe5bcb84
	.xword	0x6385813dd9fdebc0
	.xword	0x2b6de9c53ebf38cb
	.xword	0x7c6f21ce94b1464d
	.xword	0x0ad9c68bece48617
	.xword	0x1ebcce0233916c8a
	.xword	0x992a08c84ef59f89
	.xword	0x6639d360f0eb3059
	.xword	0x0f14afadfc1015ba
	.xword	0x7e60e26d6c966d22
	.xword	0xac537fa7c5020b70
	.xword	0x20bb5c8a834cc6c0
	.xword	0x77e836d9b349ab9d
	.xword	0xacaab7c66c695fd9
	.xword	0x7a98588f710dbdb1
	.xword	0xd66506d278bac005
	.xword	0x21c7535c0d045091
	.xword	0xc78813f000b5ffd6
	.xword	0x65a34291eb99e24e
	.xword	0x84002f628429e494
	.xword	0x7485134d9eb1fc29
	.xword	0xa17e75292344a3e2
	.xword	0xfa7f6e9e669374c5
	.xword	0xa54dc257f17a846c
	.xword	0xf9bf575850be4ae8
	.xword	0x429072d87ebf05cb
	.xword	0x59d658ba6ace0ec2
	.xword	0x7ef4cfbbe01ae2f0
	.xword	0x609a87bdea9e9c3a
	.xword	0x86d83ec42f8d89ad
	.xword	0xd5a13dd548f65107
	.xword	0xbeac19b0533ae64c
	.xword	0x188ca36474cee74e
	.xword	0xd51efdc0ea7e152e
	.xword	0x39e429de55b0f928
	.xword	0xcc3a162716699c9b
	.xword	0x22965373e32e2823
	.xword	0x0f29e38e08ca67a8
	.xword	0xa067b63f0d662b45
	.xword	0x30c9234c01640737
	.xword	0xb6358d01fd291f1b
	.xword	0x598d8216eb0596c5
	.xword	0xd46b01f1e0cf6f79
	.xword	0x76f0ae31651b9689
	.xword	0x4b68e133b9c3a12e
	.xword	0x415c9d2a8735258f
	.xword	0xd20b32edd882ae56
	.xword	0x6c583bf76618ce9d
	.xword	0x1a2389d15105a40a
	.xword	0xfae51a18459cc43c
	.xword	0x3fdeb072104b67b4
	.xword	0x0ea882b33c33cb2c
	.xword	0xde2e92a4b594bae0
	.xword	0xddb75a5edccd0be9
	.xword	0x9dacfd9efb5ab616
	.xword	0x0bb1fc42337da146
	.xword	0x369725332eb52bc8
	.xword	0x5fdc5df56f20e1e5
	.xword	0x2141a3d953c4a4bb
	.xword	0xcc71d0c93967a161
	.xword	0xae42a360da5ff50e
	.xword	0x887d96162ac54053
	.xword	0xaf02ec62435fb203
	.xword	0x1be37a2ec8eba979
	.xword	0xbb3855d42d0cb8ef
	.xword	0x769e78a50668585b
	.xword	0xc25c42835339756b
	.xword	0x39bde2f71c9d0503
	.xword	0x8e4c77e166b0a6c6
	.xword	0x599e4080d069b3c1
	.xword	0x19d0c6836eec0903
	.xword	0x097ed1f85fcdb387
	.xword	0x255381bf1a0d5ad2
	.xword	0xcf5aa5c382a2b7bc
	.xword	0x138ab6684bb7840c
	.xword	0xdf890e6b17e41462
	.xword	0x9007f458262acbd7
	.xword	0x44d604f3e1f14df4
	.xword	0x314e4c3ea1852aae
	.xword	0x1d1f03a403da7600
	.xword	0x3b47e135ff98bf13
	.xword	0xd616d29b3b0612be
	.xword	0xef75de05d798e8f7
	.xword	0x1867b139b7b8e8c8
	.xword	0xd4676bbfe1835696
	.xword	0xf18eb598cb4b41b9
	.xword	0xdafe1c396d0e41cb
	.xword	0x1c12ed0a5095f467
	.xword	0x180b5bdf3c2447b1
	.xword	0x33b4de229fa07641
	.xword	0x6c8c8f224645c5dc
	.xword	0xd7d7d7814fc44e47
	.xword	0x6549645cef85f009
	.xword	0xab6d80e9610c227c
	.xword	0xb550bc028857eb97
	.xword	0x7acdfa2fd778b56b
	.xword	0xd8d1943f7f6cd868
	.xword	0xf545e29595dc93d7
	.xword	0x69d5823c81ebcae4
	.xword	0x3ea8f45af7523131
	.xword	0x2fc7c1dfaa0eb595
	.xword	0xf06dad3f6a292093
	.xword	0x14cbfed9f451b858
	.xword	0xb9930eaf28b49d39
	.xword	0x3c9f8e74c0b5243a
	.xword	0x137aa460c09ab724
	.xword	0x4070c2600b729973
	.xword	0x5f79fcece9aa8db5
	.xword	0x3c912921811cc616
	.xword	0x329d34cb0eefcf7e
	.xword	0x0d0be9fd4d87bbc4
	.xword	0x67fde09d586529ec
	.xword	0xbe1677e346b74f4b
	.xword	0xf5a060405310f6c4
	.xword	0x41ea113304d13cc6
	.xword	0x90633d63e2b37629
	.xword	0x24441829eb325e77
	.xword	0xc6d8ea248a7148e9
	.xword	0x46b017e74b58a741
	.xword	0x1c7c5a6e7f08394a
	.xword	0x3eaad355213517f9
	.xword	0x1b6a4416fb7a3c55
	.xword	0x9e00531740852344
	.xword	0x2a927abd0af19c47
	.xword	0xdd0ebbce3773a709
	.xword	0x768e4863829a9a75
	.xword	0x66f09ae59d1312ad
	.xword	0x59945abe9620da5d
	.xword	0x1ac59ac08466a8a9
	.xword	0x516d1e6f93437fa1
	.xword	0x273467a6803cffb7
	.xword	0x33b8305f8441a916
	.xword	0xdc8e6c772c5d62cd
	.xword	0xec02489485f720ea
	.xword	0xa6f6260bae6e9b5e
	.xword	0xe6437a278c2cf8e5
	.xword	0xb7add5925d3a870d
	.xword	0xb6bf6e4e6a38a80d
	.xword	0xde7f60a1d63e2d20
	.xword	0x3dbcfdd96f497783
	.xword	0x8ee069cfca32879c
	.xword	0x6fda23b31a9cc351
	.xword	0xaed42bc61e3e2115
	.xword	0x96cc2729c4138cc0
	.xword	0x22c085cc94d14415
	.xword	0xca17057d6d704fa7
	.xword	0x7c93dec0dffed12f
	.xword	0x7281d8e975e13bf7
	.xword	0x2f403377f6f138f5
	.xword	0xc8773a1c6036e114
	.xword	0x838dadd4b8ce0acb
	.xword	0x017263665596eb1d
	.xword	0xb9155172039bb958
	.xword	0x51d45a1820b28958
	.xword	0xb3713586a578edf3
	.xword	0xd41eb5e28dbea347
	.xword	0x36ebfd20796672ab
	.xword	0x7661e784b7d01e8c
	.xword	0xc73709a841f62f6a
	.xword	0x9d2fa020793ea069
	.xword	0xc6759ba99d2713ac
	.xword	0x0d07f52138d8d421
	.xword	0xd7f03ab48e2933bc
	.xword	0x1c5d323193eca315
	.xword	0xb2ebc467726369f7
	.xword	0x1b870f9966670236
	.xword	0x00de41f15c2bf6c3
	.xword	0xafce6350b51c7eef
	.xword	0xdbc05920c2cdd450
	.xword	0xddb1ff7819ac4fea
	.xword	0xfda07b55be12a1c3
	.xword	0xca88bac06ad20309
	.xword	0x789bfcf314ef304e
	.xword	0x38bc14fdf09a125b
	.xword	0x7dcdebc2a6e78a58
	.xword	0x13388e8e43dc9e17
	.xword	0xd3baa487426705cc
	.xword	0xc9ff226ac6efbe37
	.xword	0xc7aa1bed077e1edb
	.xword	0xd1a95396d8f471e2
	.xword	0x06c0a0a17db21c96
	.xword	0x0232d1fabffe5ba7
	.xword	0x70e45311cb186513



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
	.xword	0x26f74559bf72e783
	.xword	0x9f63a44f246b632f
	.xword	0x496dc1eb0deb7304
	.xword	0x2b0da4a077758074
	.xword	0x5c8fd94bb52849e6
	.xword	0x789288f273766c90
	.xword	0xf3bd637670b9a40e
	.xword	0x96e0718f5476af42
	.xword	0x3186afa423d93f23
	.xword	0xba20a030727943be
	.xword	0x4cfc3753515cefb5
	.xword	0x820e204f94be568d
	.xword	0xf088d67d2d045182
	.xword	0x373363ecae79cdf8
	.xword	0x32afff6044eaff88
	.xword	0x6bc238347aa83291
	.xword	0x5988d1224b69029f
	.xword	0xb590dba16d93ec7d
	.xword	0xd26026b92a209756
	.xword	0x14e70d1312069806
	.xword	0x068c22e7e5b633f6
	.xword	0x2fc888c61f2dec2e
	.xword	0xf1db340cb32bcf3d
	.xword	0xcbd7a53031d80763
	.xword	0xde8aaaa5ec55f747
	.xword	0x82c6207fbbee0ddd
	.xword	0x8ffc7610118a398b
	.xword	0x27e21bfde9fb2fad
	.xword	0x4e69fdd4eee94ef1
	.xword	0x1e6531d41579d7d3
	.xword	0x21ffca2b622c2a07
	.xword	0x460f341bc5c34819
	.xword	0xd1bbecaaa431d5e8
	.xword	0xe444a2c2b65d2366
	.xword	0xfafe56ab739fb477
	.xword	0x6be1b4098f5b2c82
	.xword	0xf272e72e9d9c9ae8
	.xword	0x1c2c7052a201db87
	.xword	0x68fd34aaae37f40b
	.xword	0xa6ae9ae4c83e0107
	.xword	0xf9889aa0d3680559
	.xword	0x2899eb189f634ec4
	.xword	0xf625592a3c833b32
	.xword	0x8f2a8f510eaa506c
	.xword	0x41c5341b3f3bd05a
	.xword	0xa46dbe6dc082691a
	.xword	0xd864ec8754823ca2
	.xword	0x3edd8489da1c21c9
	.xword	0x2ea80dbacc62ed73
	.xword	0xd6d48294a24fc4ab
	.xword	0x2e5430b4f81d658d
	.xword	0x0c69f75dd5308bbc
	.xword	0x660972dbefef3e8e
	.xword	0xd97b3d46b9bce12e
	.xword	0xe520f3ef9e5cbe24
	.xword	0x79c4685701f70d27
	.xword	0x2f9b6276415386bb
	.xword	0x53476afb9e1ebea8
	.xword	0x24a784bf0c39f720
	.xword	0xd4dd1551dc29c406
	.xword	0xdf0c11ec401ba1a1
	.xword	0x4aebbb71dca79aa9
	.xword	0xbb41a6b113500ce7
	.xword	0x62ffe5d037380ec2
	.xword	0x05e90e2267c98416
	.xword	0x1b07d061b96a9878
	.xword	0xb35a61b9e6b0c8c1
	.xword	0x8e5418ace6f5b8f0
	.xword	0x29e360cd438decac
	.xword	0x9fcfd6d4141f4ac6
	.xword	0x51d1d0bef8de8ca8
	.xword	0xfc2d48d760c0000f
	.xword	0x8ad0043b6d9f74d2
	.xword	0x18de34129296f2b9
	.xword	0x010568bfda5bdc15
	.xword	0xb58a7546b75b3d95
	.xword	0x5dae976249726cf4
	.xword	0x6c6506e992116aec
	.xword	0x972906215dd44837
	.xword	0xfbdcdfa90f443272
	.xword	0xaa809e83b7d44724
	.xword	0xcf8ec2c0937a6f77
	.xword	0x447dcc16671b3f3f
	.xword	0xa9f1908d257e1ccb
	.xword	0xbad6d7e7bbf4ba55
	.xword	0x7cd53b255d132a5e
	.xword	0x5302158b9984c6dc
	.xword	0xc3f52a385de8ec48
	.xword	0xcb8f9b8b9a362f66
	.xword	0xe520be56c8e30c33
	.xword	0x9940632a369857c9
	.xword	0x089d92a45b422612
	.xword	0x7c6628adb4462ee9
	.xword	0x82b192b57b61aa59
	.xword	0x42ce75a451900056
	.xword	0x3e427d54199a12b1
	.xword	0x2f0caf0ca4f6e83e
	.xword	0x3c186ac98b776923
	.xword	0x33175d5d018b6749
	.xword	0x95473d42d37c012c
	.xword	0xf04081b1db8cdc87
	.xword	0x4d2e55a43b4f86b0
	.xword	0xcadb7a3f9a4bb21b
	.xword	0x2a107952e79f0d54
	.xword	0x7399bff3b900f5bd
	.xword	0x077e76ecdf55d94d
	.xword	0xb66e368e781c2dba
	.xword	0xd0f45e657563b4fa
	.xword	0x5d45d7a5f48dbe66
	.xword	0x690362186b3e8f40
	.xword	0x6f06b3a87212115e
	.xword	0xa036319bac360328
	.xword	0xf4790ee3beeeb18a
	.xword	0x16ec90173ee9b681
	.xword	0x2de72667573dcec5
	.xword	0x6f7ed016b1120108
	.xword	0x8eafa38582a65bbd
	.xword	0xd627909fdd071992
	.xword	0x7eb9ad2d5f104034
	.xword	0xd326cbe901aa9336
	.xword	0x6387b97f3cc81782
	.xword	0xedd8f69a7254e6dc
	.xword	0x3178627cbc3f6d32
	.xword	0x62c0a1df210cd73d
	.xword	0x4f5f9814c7841aa1
	.xword	0x3ac2a72a505b0932
	.xword	0x82755d06146801a8
	.xword	0x9d774738bacf990d
	.xword	0x83275fd660b75c50
	.xword	0x7d161b5ef0739c28
	.xword	0xa9a29edf1061c1c5
	.xword	0xa583689caad4d9aa
	.xword	0xe29409e7f2a86b64
	.xword	0x1ea82404893b1419
	.xword	0x211418849df57688
	.xword	0xe0c552dc22ffcd8c
	.xword	0x1e9857448e66a779
	.xword	0x6fab52d7adbfab29
	.xword	0x9aa4b6abc987bbfb
	.xword	0x663489dadf1bd357
	.xword	0x19cfcb689111ad21
	.xword	0x0ec6a5b3d214c339
	.xword	0x8f84e7b101901efc
	.xword	0x2694ea71b2f7f5c2
	.xword	0xa44d578ebafb485a
	.xword	0x3363eaa3fdb6eb2c
	.xword	0x502a681cc1dcec14
	.xword	0x04489865a89877f4
	.xword	0x3c3886ffbe0d30ef
	.xword	0x0ca68ebd20be2b18
	.xword	0x677c183c77c12979
	.xword	0x612302bfdcf5dd8d
	.xword	0x5a1f41332b2ebc90
	.xword	0xb6c19e6c4244fffa
	.xword	0x8c39d75a2c31d15e
	.xword	0x81c6e3f71c8af45f
	.xword	0x65bdd671175ff598
	.xword	0xf27cc1a566bc2fad
	.xword	0xc68c117966251639
	.xword	0x64c15c31e33bc094
	.xword	0xc57e0254e7ac99b9
	.xword	0x51273090821af68b
	.xword	0x833019b0be023da5
	.xword	0xda19dcc1dd39ce10
	.xword	0xf6ed348a9373b779
	.xword	0x47bd32afe22bed99
	.xword	0xfa12fbe2990b2452
	.xword	0xc315470c2629707f
	.xword	0xe455a186c4751df4
	.xword	0x1e47fa7d6ce963ac
	.xword	0x28a7fff5f0cb3da7
	.xword	0xc88b4853cf0ff30d
	.xword	0xf5ee9e53f4c18984
	.xword	0xa63b1197dad7e7b8
	.xword	0x087fd054ce52d72b
	.xword	0x9cb91e80e2bf2664
	.xword	0x44bc1abac11e10af
	.xword	0x265946478c9a1003
	.xword	0xf961c3223ffcafcc
	.xword	0x36b3cdcf9d047ff4
	.xword	0xd0ca28cbee00176d
	.xword	0x315496a0929bd59c
	.xword	0xdbd3122ae4edf85c
	.xword	0x4f1e67caabb34ead
	.xword	0xefc9acd7060e1511
	.xword	0xc181186a7aee644a
	.xword	0x4b81b1230e99c81e
	.xword	0xafd0005180c1a752
	.xword	0x35ca33c7ad4b98b7
	.xword	0xebb8aa11f42a8822
	.xword	0xfefece17f03e62ef
	.xword	0x08b2dab91d377217
	.xword	0x5c2c34c49af365aa
	.xword	0xe6b7a39a8925e4cc
	.xword	0x42660b5614496bfb
	.xword	0xe3e889b3867973f5
	.xword	0xcfc59fe5a8ddec7c
	.xword	0xfdbc4df8dab8c265
	.xword	0xe7b158e88c386f63
	.xword	0x7fdd813c66dd1451
	.xword	0xf4d7cef353dafd5c
	.xword	0xa663fcbf653f793b
	.xword	0xb109009bb2f92089
	.xword	0xf1b9530953f6d1c2
	.xword	0xb551fe3f67cac10d
	.xword	0xc561ec13d20f58e2
	.xword	0xb32fdbc6ce626036
	.xword	0x8274411a66f55621
	.xword	0x075c3a13a9eebaa3
	.xword	0x2746c4daf114bca2
	.xword	0x9f6719b5e31a6651
	.xword	0x6c139711781cb142
	.xword	0xcaa683f6dad11dd3
	.xword	0xebf17bbe0081548a
	.xword	0x7da11a4505fb6323
	.xword	0x6b42a2e0ff530e0f
	.xword	0xb3b12844691454a5
	.xword	0x3d466804a08ab5ff
	.xword	0x0698bc02c51bdddc
	.xword	0xaf3459c3f1192812
	.xword	0xe4bb5f957e76d815
	.xword	0xfa894714f265975d
	.xword	0x625426464c281d4b
	.xword	0x6dc7e9c9988a130d
	.xword	0x51f49330a00c6754
	.xword	0x831511e47dda35f2
	.xword	0xd7ee37aa08c98f38
	.xword	0x787ac119bd061e96
	.xword	0x14a5e7d1612536ea
	.xword	0x29e47a8cca8345bb
	.xword	0x40a7afe362dffd80
	.xword	0xc6c78f6899ba49d9
	.xword	0x89da4f4642a817ce
	.xword	0x49d4fc5b9aa8409c
	.xword	0xd0c12f26edab866e
	.xword	0xe791348c0a477da9
	.xword	0xe9bd29e7e5644966
	.xword	0xf98b8fd2ebdffa06
	.xword	0x195963f15487ad38
	.xword	0x302f8c9bdddfaf23
	.xword	0x6684630c7e79be3e
	.xword	0x19a14fa0c3f18281
	.xword	0xb7942def44786cc4
	.xword	0x15519cfcec6e1c70
	.xword	0xc8a13bdb3d0155e7
	.xword	0x03e40a7d7aa89482
	.xword	0x6632441f5ff2af39
	.xword	0x61010110339a788c
	.xword	0x66d418881dbbaec4
	.xword	0x472719a9e6fe24c4
	.xword	0xd430789ec4c32480
	.xword	0x909770125404a783
	.xword	0xdffe55febb886862
	.xword	0x621aac429cda1737
	.xword	0x3c9b0e04887b814b
	.xword	0x84e9f15d4f14e4d6



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
	.xword	0x7b29cd70de6d9b45
	.xword	0x02b4398ec7e735b5
	.xword	0x6af5519faa2cfb86
	.xword	0x9bba11d9a7d0de39
	.xword	0xbbbf8557cbc14323
	.xword	0x9fca390352057490
	.xword	0x42bc053e804e0d15
	.xword	0x845b5c2dee433eef
	.xword	0xabff35be900f583b
	.xword	0x9692624ebd10eeec
	.xword	0x0666eb72c31a5966
	.xword	0xa14450ed27b96635
	.xword	0x3e51324b661d8503
	.xword	0x1a8a700587520056
	.xword	0x76bd47a6b16d4de3
	.xword	0x182d94231a7605f4
	.xword	0xc8e683371616aab7
	.xword	0xff66e59a4023b70c
	.xword	0x3d6318cdbf29cb92
	.xword	0x83277104fa9849a2
	.xword	0x9fbdae99d842e8b5
	.xword	0x7d4740ec3fb2100b
	.xword	0xdc356d06d25e1180
	.xword	0x76dc297acc20056a
	.xword	0xd01244bf9b85e182
	.xword	0x2f65c8e3d5ecbc87
	.xword	0x13489ca2436a0469
	.xword	0x4550edbd5f056136
	.xword	0x1bac3c1884ae8a45
	.xword	0x2e58b53e45024dae
	.xword	0xe734eedc9ac91383
	.xword	0xe7fb57e045182639
	.xword	0xe6c053dbd09cfff7
	.xword	0x198754e893895b59
	.xword	0xdf4849e55e92b23c
	.xword	0x7fea359fcab838f4
	.xword	0xcfec133b6e691e72
	.xword	0xdb1c44e215ff6daa
	.xword	0xdceedb0d94b637c3
	.xword	0x1d7920b299e08137
	.xword	0xf92bab6d1384f4c6
	.xword	0x68cd78430b1c23a8
	.xword	0x884e0b557c8b5d88
	.xword	0xce3a7e22457e28fe
	.xword	0x64bedc3c3fe95daf
	.xword	0xa9b6111dcec5abbb
	.xword	0xe4b0884b4c7f9ff9
	.xword	0x2af1c7a66e614c4e
	.xword	0x090dda2d985e3218
	.xword	0x1891ca177114a87f
	.xword	0xbd06297cbddc3165
	.xword	0x15368c8ca83db61e
	.xword	0x6a0525b73d209a8b
	.xword	0xe5ee89da1f45883f
	.xword	0x6f0560052560280d
	.xword	0x2542dea0a9e635cd
	.xword	0xed6e27952e8810cc
	.xword	0x0c229c069a62f2e3
	.xword	0xa3ac8fe56286a039
	.xword	0xdc848134de802ceb
	.xword	0x0f4a96e145e0e56d
	.xword	0x7787da7e47962636
	.xword	0xa5c13e27f938feac
	.xword	0xd473be53ae9a3911
	.xword	0xa9c2df93a816005a
	.xword	0x4bb381c4dcfd9c81
	.xword	0xc123b9dc8cd50f17
	.xword	0x799b1248a8d31eef
	.xword	0x2ad4764ef1ac6745
	.xword	0x31561b3a91854bdf
	.xword	0xfd9fcee1073d8ff2
	.xword	0x9147f2bce69f67a1
	.xword	0x5e28d93b933f282a
	.xword	0x39d7454178dd3194
	.xword	0xcae21aff8c29c48d
	.xword	0x2ed1bab638e22b69
	.xword	0xcbb475c28a655308
	.xword	0xe492122535e95520
	.xword	0xde58581e8a5f6da7
	.xword	0x4c04cdfa26642b24
	.xword	0x8a230239d7135c64
	.xword	0x020bcc157872a287
	.xword	0x253eff3d210e10d7
	.xword	0xde735af151e378a8
	.xword	0x241283e189bc36c7
	.xword	0x356a7fd871bddc87
	.xword	0xaec587958c45989f
	.xword	0xfa9e44864adcfb07
	.xword	0x94e78b6d02d82b92
	.xword	0x34041a2d7f86bc7a
	.xword	0x5e855358e01f8184
	.xword	0xed765cf1fa488741
	.xword	0xfa882661d90588da
	.xword	0x771dadd5c822e36b
	.xword	0x1a5962b02f752900
	.xword	0xc161d50ddafae2d9
	.xword	0x972a52d9578acf99
	.xword	0x6e6f0e4170c7d70d
	.xword	0x4b00a055d37c51b1
	.xword	0xb060fab67f343829
	.xword	0xf069ac4739eace3e
	.xword	0x7970e4beb019991a
	.xword	0xaf57a067eae34449
	.xword	0x5d7f584eb417775f
	.xword	0xbac10c8e383b1859
	.xword	0xf4b55750b7c5ea16
	.xword	0x82952262e9df353b
	.xword	0x9ed097ae427b3f1e
	.xword	0x45147aa14b1ad21d
	.xword	0xb43abc4c1306f078
	.xword	0xe41226b71866940d
	.xword	0x4364bdaaff8512f8
	.xword	0xf13ef28aee1eee77
	.xword	0x3dc9b4ec10425626
	.xword	0xb30ee4e2ea268121
	.xword	0xb452e42af5450a6a
	.xword	0x0f134513939627b2
	.xword	0xb01ff3e7115aa1d6
	.xword	0xbd33c8561f669e09
	.xword	0xb1fbc9315e29664c
	.xword	0x11c69cf8cfad84de
	.xword	0x0700b10f2a5c86bf
	.xword	0xd2286276d00629b0
	.xword	0x3507a88b47e230fb
	.xword	0x4a4d9a49dc663fc8
	.xword	0x85c01caf1d0b20d6
	.xword	0x8851448ff7abe340
	.xword	0x1265fff0f270ad0a
	.xword	0x3741ce98a33a782e
	.xword	0x3e0d576c9f862d55
	.xword	0x88551416c992a4ca
	.xword	0x4728d9cdce0d9b1a
	.xword	0x6a021be7ac9a76b2
	.xword	0xa27ba4cac6eab436
	.xword	0x66109b39c6d3b238
	.xword	0x8d81ebaa02da62ce
	.xword	0x7fa9304e5c648e6d
	.xword	0xf6b21a33305f8928
	.xword	0xbae2ae2cac0361dd
	.xword	0x7419a17d4666c30e
	.xword	0x9bf790b1ceb42a19
	.xword	0xce8c048eadb240a0
	.xword	0xe495472681dee906
	.xword	0xc791de75796b1a7f
	.xword	0x46a719aa4ba0c2cc
	.xword	0xc1ef04d2235d403a
	.xword	0xe3f85a4140e1bbe9
	.xword	0x154a9fe9a06e67ba
	.xword	0x6896815402e63578
	.xword	0x676b0c546384b934
	.xword	0x096bd46788615b99
	.xword	0x8189cf74789f296f
	.xword	0xe456c6d5a9e55bd1
	.xword	0x39f3f7139c4d478c
	.xword	0x62b98d0a5cbef8ac
	.xword	0xa9ca756c0bca28ea
	.xword	0x438155cb39065d62
	.xword	0x46ef734fb64f3268
	.xword	0x39f6cdad60d94e9a
	.xword	0x923af8a8368f3cfb
	.xword	0xce25c6162cfed54b
	.xword	0xda72545e3511d1aa
	.xword	0x30ceac89fb99740f
	.xword	0x32c731193ca4217c
	.xword	0xab4fedb33f655a0c
	.xword	0x056f6aa6d9c42331
	.xword	0x7110e312383dcb79
	.xword	0x9599c4ceda283b0f
	.xword	0xca437c89825a71b2
	.xword	0x5e94d14ce345cfcd
	.xword	0x4a4cf0c938a9fea1
	.xword	0x878062d2f0a49c4a
	.xword	0xe0ddd37fe2b697cb
	.xword	0x2a12ec28f6aefad3
	.xword	0x826bb35ea573c2ae
	.xword	0xf8f8f687d9b5cf50
	.xword	0x56ed3bafb1b0396e
	.xword	0xc1e132976b72e866
	.xword	0xc1a0d58da1a83900
	.xword	0x5d8e69709677576c
	.xword	0xe7a0180a1c06560f
	.xword	0x8be0b76175ddae83
	.xword	0x8b9eb51275f4af6f
	.xword	0x311d3cafd8379a0f
	.xword	0x77f7bb7ff5677f3b
	.xword	0xf1b24afc5fde6dc4
	.xword	0x1a025c34e97421f4
	.xword	0xbd88f6e11e4cb3ac
	.xword	0xc61942a3590c6a6d
	.xword	0xdace356958aabe0e
	.xword	0x9924bc31c53bbe65
	.xword	0x773bd039acaa555c
	.xword	0xa03c90daf811f936
	.xword	0x2960dc3418933812
	.xword	0xb2cbaacf4c3f08fb
	.xword	0x30ba234bd02783a8
	.xword	0x0c7118c976f7df1d
	.xword	0xa5b6c625ec4b0779
	.xword	0xf9ecee10eb51d01a
	.xword	0x8da1a45121281c7f
	.xword	0x30700570463c8818
	.xword	0x8c6e3c3094197a15
	.xword	0x8c5d6fc8b75a5881
	.xword	0xf3aa0e79dbf2cf97
	.xword	0x27935e74d2ae4214
	.xword	0xc72b6d46ccc02737
	.xword	0x13b2acf0db8d6b0f
	.xword	0xe90ca10ce9add670
	.xword	0x54d3a4104d0b4c0e
	.xword	0xa5fa8505479934e1
	.xword	0xb6b3c7f123e38cee
	.xword	0x3ecd751feb38fdac
	.xword	0x4b76728bd7a4b2fe
	.xword	0x9cec23db1ee52c86
	.xword	0x9a89828993d1f3a3
	.xword	0xa685fefa8c20ffe0
	.xword	0xd615844e466ef77f
	.xword	0xec65572b87b8d905
	.xword	0x65bda967893735f2
	.xword	0xa2cb4eaf12639d33
	.xword	0x39c10729d2464e2f
	.xword	0x5d3d0390fe045c5c
	.xword	0xfcdf2fabcc8f5d2f
	.xword	0xe9e4d1ecfb4f36ef
	.xword	0x46bb112eecdb4a46
	.xword	0x15b365e2938b5335
	.xword	0x61b040f733131b9f
	.xword	0x76a55353d68f77f6
	.xword	0x7e608d4ba2352252
	.xword	0xcf20c6c8be1e7faf
	.xword	0x9bbaea272ce450a9
	.xword	0xc7748d388400fc8e
	.xword	0x408516b51f69f28f
	.xword	0xa8394c04d1d7aa88
	.xword	0x46a9555084cbcea7
	.xword	0x30993586509a3a49
	.xword	0x12f9d6235afd56b6
	.xword	0x8a7ef92a52cac2e3
	.xword	0xe8b4500fab977482
	.xword	0x0e889e6fb0d25fdb
	.xword	0x5e099a8df1324700
	.xword	0x56bfe572d370f01d
	.xword	0x236b910b8c5b0a46
	.xword	0x794873e322c9b09f
	.xword	0x66d8c8108653a8db
	.xword	0x2ba16205d8e8ac0c
	.xword	0xbe30b9f8ef4f7525
	.xword	0x875befa45bd75a6e
	.xword	0x872502d2f88d89e4
	.xword	0xb485642f36452e37
	.xword	0x6b4852d3b66380c3
	.xword	0x422b8d5ed1ca3fed
	.xword	0xaabfafc078f41585
	.xword	0xe9c6f268d1e489aa
	.xword	0x1c9d3da3b51d5cbe
	.xword	0xd55a17a8df6f7290



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
	.xword	0x09f3ba3b0df931da
	.xword	0xd30bc7bbab74de3a
	.xword	0xe249d9474eab5cb4
	.xword	0x3265c345b52f5705
	.xword	0x0426d9a81b820c4e
	.xword	0x3a7c8119471e0249
	.xword	0x9af7607b4189a679
	.xword	0xe3f7411b9234ef5e
	.xword	0xa8e1a904180bf969
	.xword	0x0cd8c7091f30f864
	.xword	0x55621a541632d90a
	.xword	0x71d85ff6b79a0716
	.xword	0xe59156472959a527
	.xword	0x3e0991d889763116
	.xword	0x25ac522c896c0a99
	.xword	0x4c5f36a9926ad2ed
	.xword	0x180d6df6bfe2119b
	.xword	0xeae50278870e3bc9
	.xword	0x2f6ce0547fa0a866
	.xword	0x81dc31a6dd735e33
	.xword	0x76f0c8dfe509b8af
	.xword	0x7c976fcbb3675090
	.xword	0x260cb594363f197e
	.xword	0x930a26b33a9caa06
	.xword	0x6daaf98916b28db5
	.xword	0x761b135b7c48b8ca
	.xword	0x3e37dbd7ea67da55
	.xword	0x4167692b334f0477
	.xword	0xc438b3f84da2f7c4
	.xword	0x1ec51ddf5b8b6dc0
	.xword	0x683d007fb19f1dd2
	.xword	0x252e0186cbc378c8
	.xword	0x5bbc0bf55bcabdcb
	.xword	0x47c7186fa4d5c810
	.xword	0x314e6aa2cbcf0cd3
	.xword	0xb033f1352a19a3a3
	.xword	0x4086580716f3733b
	.xword	0x164add068b8089b5
	.xword	0x20e290ed1bca3836
	.xword	0x2ccb7baa62da7b6d
	.xword	0x53135683fb1558fc
	.xword	0x60ddbe723d36aad3
	.xword	0x92ab88a0ec794ebb
	.xword	0xf4cc1f17975cfbbf
	.xword	0x0c249398b579081d
	.xword	0x427a7dfa25e5e578
	.xword	0xaef11123804b667e
	.xword	0x0fa4f7eabee1c6af
	.xword	0x14119193e58dabb8
	.xword	0x75a49fb7c69f7f23
	.xword	0x0bdd7aace73c5f07
	.xword	0x1571bd44913678ee
	.xword	0x53b40fed7ba66a83
	.xword	0x323116c2d6bfad9b
	.xword	0x05d656222a211dbd
	.xword	0x956ce2122346723d
	.xword	0x05ba8043b60dc677
	.xword	0x9282fc91c116e60a
	.xword	0xe9b2261197df39c6
	.xword	0x427fde358ee043c2
	.xword	0xb6e2e50a8b7f82ba
	.xword	0xe6b147a0fb2dec1c
	.xword	0xa3da3692aab841d4
	.xword	0x1178237c8b511465
	.xword	0x7496a383569fe49e
	.xword	0xcc29d84d03ca4fd8
	.xword	0x2bd514e9a86fb14a
	.xword	0x6d2999ef108ae353
	.xword	0x31041c6ead2c6f88
	.xword	0xcac2b1ac90d6eabc
	.xword	0xb0d4db7597653594
	.xword	0xfac4022dbf19cd16
	.xword	0xc9a9140ea96599c9
	.xword	0xad15fa46c8759a04
	.xword	0x5947127580650c63
	.xword	0x82d02c7481d25d0c
	.xword	0x6d1110f673ea2aba
	.xword	0x5f1ee443502172db
	.xword	0xc27abd25fc6a96ff
	.xword	0xdbbad75bbde2cdb5
	.xword	0x44c954c7c9cf6d21
	.xword	0xbf53e009f3ecc7fb
	.xword	0xab426346f71fa0d0
	.xword	0xed69d5d7f33b78db
	.xword	0x8656a493ba0d868d
	.xword	0x2402e1224602cb8d
	.xword	0x9efbba8b0b4d01b9
	.xword	0x7b830dacbdc413ba
	.xword	0xc82ccc279f64c2dc
	.xword	0x9842855b9c948420
	.xword	0xdcae0adc32d3ee62
	.xword	0xb8f361592f823e3a
	.xword	0x57718b6236e4348a
	.xword	0x911bfd2de29748fa
	.xword	0xce1279197c70d7c4
	.xword	0xead40a0759be06d5
	.xword	0x8b4be4e21159d5da
	.xword	0x7d77355c3c0fe432
	.xword	0xcd8788fc37344887
	.xword	0x875932bcb36636a3
	.xword	0x008c2eac37553ce8
	.xword	0x215d3143ebcb5fb4
	.xword	0x791768058163a6a0
	.xword	0x1d6b8471a16797a5
	.xword	0x32dc0ac08aa1d493
	.xword	0x80bd3a5ae1920b54
	.xword	0xedbaad84e1b9a1d0
	.xword	0x3e9d3b914b8a22e5
	.xword	0x6edf2396a01a6b8f
	.xword	0x25a42c9b9fae26af
	.xword	0x3341b8ae7a7352d9
	.xword	0x7634ec038cfc1034
	.xword	0x7b6abe10d52bf1f1
	.xword	0xfc0800fa682d0c43
	.xword	0x9cbe05baa505c6e7
	.xword	0xabf471a8d375decc
	.xword	0xab94154768f75c94
	.xword	0x394df2fc68a24931
	.xword	0x425ce2c739f930a8
	.xword	0xc75869b072343067
	.xword	0x7bd5424458bd9ddb
	.xword	0x8a89583e85ebccb4
	.xword	0x80736ca4e2f92277
	.xword	0x21ece797e05514d1
	.xword	0x6205e5498e8a8991
	.xword	0xe4aede920cd9a796
	.xword	0x561d1cc357c91ebd
	.xword	0x6a35720c46e8299e
	.xword	0xff44b0934d00c58e
	.xword	0xf5439d01b350514b
	.xword	0x9c61e1933fd2706e
	.xword	0x545a0a88c500a474
	.xword	0xb95d9a3de3e7e443
	.xword	0xd233e96e149f8268
	.xword	0x16abf0518333111b
	.xword	0x6fd57d17a39310a9
	.xword	0x03f37c5770ca4766
	.xword	0xc99619f561f61950
	.xword	0x0295198a9086c2d3
	.xword	0xa505ac3facc8fbb4
	.xword	0x78d856538f338180
	.xword	0x4a76abe2fc453e4a
	.xword	0xfb3a7f754c964da5
	.xword	0x115fc4ed9f586ba3
	.xword	0x0f9bc3c3490c139a
	.xword	0x0bd38141227cab32
	.xword	0x3eeeacb31ba27482
	.xword	0xed21a68636b72775
	.xword	0x8ae32738483f8ce7
	.xword	0xab6300f2e33c9c86
	.xword	0xbec43fa80f36d3fb
	.xword	0x70353e892ccc0f2d
	.xword	0x1a1898adae4827a6
	.xword	0xa9201bb4a3246f2d
	.xword	0x155ad46b8b6b1d85
	.xword	0x05af29a960a07982
	.xword	0x02c3b17031ced286
	.xword	0x5c9b4f952087ee8f
	.xword	0x7cfb2c77b4f676dd
	.xword	0xc352a7d31ee0465f
	.xword	0x91dd4d9c85cafd85
	.xword	0xe554b8020be71361
	.xword	0x25b8c150f967781d
	.xword	0x66c378c196a20270
	.xword	0x259faa63c648923c
	.xword	0x03a33fc8e8862330
	.xword	0x2ec8cabc3711b5f9
	.xword	0xa8c8613e889df713
	.xword	0x1beb7e270a095342
	.xword	0xf0e51428b41b3154
	.xword	0x3a86ea1e1c6dada7
	.xword	0xc32b35eb621edf67
	.xword	0xc85dfea70f91e0da
	.xword	0x9dd7ae8a2c90901c
	.xword	0xc9ad20e6e55a8ed0
	.xword	0x50c2e502fb0b96d4
	.xword	0x0f28e2d029698b68
	.xword	0x3833fd1874f02df1
	.xword	0xa6007116323a2c26
	.xword	0xdc412db757b1ddaa
	.xword	0xa6c522a56324275e
	.xword	0xcbc891a2157181e8
	.xword	0x4b4aa4c0e660bbfd
	.xword	0xead6ce0a3a8e6669
	.xword	0x93b7433cd85f5891
	.xword	0xaf666744f955ade6
	.xword	0x1e676650b5c763a0
	.xword	0xfd83a2b0a6c3dfa1
	.xword	0xf22cff4b699e6ee7
	.xword	0xc405aac6a798581f
	.xword	0xd3ae2e72fef3b3f1
	.xword	0xceeb72b3f962a4bd
	.xword	0xf2ee227f0b3670f1
	.xword	0xe5b6745aac0471b3
	.xword	0xe5de30aa89d6f84b
	.xword	0xcd487247c479cc60
	.xword	0xd2ec34b7095a71ce
	.xword	0x5062f6ec29f356cf
	.xword	0x0a2e7e7ac3ae8975
	.xword	0x22126b0691efe086
	.xword	0x423926d41092466e
	.xword	0xb04c28b38ade2dfb
	.xword	0x6c1e7799947a9ea0
	.xword	0xec1a34fde691ee02
	.xword	0x5e62faad9976ad8c
	.xword	0x9722aa1cabd8378a
	.xword	0xd7aa12557cca56fa
	.xword	0xd03b2cee793f2ac7
	.xword	0x35503333ca3264c4
	.xword	0xc314d317bf28532b
	.xword	0x122083822242d9de
	.xword	0xb646cf3b13693783
	.xword	0x6a0fc0208069f478
	.xword	0xd0dd40c7ac58d0c4
	.xword	0xf7682a40d69bba22
	.xword	0xd489186d566f60c0
	.xword	0x32be6e1b3e8379b6
	.xword	0x937639774b721a50
	.xword	0x0eda38bea353d7ca
	.xword	0x4ef2854fcf9afd38
	.xword	0xe53243bc0d7b95e6
	.xword	0xbd59900d4e54c12b
	.xword	0x655f5dafef286097
	.xword	0x255060f48cfb5ca9
	.xword	0x53402a646572a8c9
	.xword	0x0c34446b474525fc
	.xword	0xdcf0d65c6234f1d0
	.xword	0x3afa9949bd7c22d2
	.xword	0x8526f0f5e1d87978
	.xword	0x49b22237735eff61
	.xword	0x9186d4c46d2ce12a
	.xword	0xb576f5e1fa51ca36
	.xword	0xbded00f00a3ce3b7
	.xword	0x6703e6a8d3e7406b
	.xword	0x963cc34d39777234
	.xword	0x773742f661600f07
	.xword	0xef0eb2aafdf18413
	.xword	0x48e79dd75d8385e3
	.xword	0xb94ae625c18f2002
	.xword	0x8d52121e2b660769
	.xword	0xa23b256ba194167b
	.xword	0xb1b8424aa1836734
	.xword	0x06fc19a4f7694992
	.xword	0xa2cd3988f77e562d
	.xword	0xbf7baa2d9a1e54c0
	.xword	0x9120b8f736602ec4
	.xword	0xb7f8ef0a7b0b175a
	.xword	0x42812ef1b3b01273
	.xword	0x9c38e9f638095265
	.xword	0xb52bb00ccccc5eac
	.xword	0x7e3e69b3d0e884b1
	.xword	0x60703c6abb765c80
	.xword	0xb456f6a7a1b88379
	.xword	0xa9e4306c94bed62e
	.xword	0x1e6cfe4be42786b0
	.xword	0xa10acfa92a431264



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
!!#   IJ_bind_file_group("diag.j", 499, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 500, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 503, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 505, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 506, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 507, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 509, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 511, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 512, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 514, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 515, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 516, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 517, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 519, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 520, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 523, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 524, th_M, "\tmov\t0, %%r8\n");
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
!!#   IJ_printf ("diag.j", 555, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 556, sjm_5, "\n\nBA LABEL_0\n");
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 560,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 562,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 567,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 695, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9 set_addr load alu store  sjm4  sjm5 
!!# !inst_type: set_reg9 set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 702, th_M, $3);
!!# 		IJ_generate ("diag.j", 703, th_M, $4);
!!# 		IJ_generate ("diag.j", 704, th_M, $5);
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
!!#                    IJ_printf ("diag.j", 1323, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1325, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1327, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1333, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1334, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1361, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1367, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1368, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1371, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1373, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1382, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1384, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1402, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1408, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1413, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1415, sjm_5, "\n");
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
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1442, Rv_jbi_fifo_wr0_config);
!!# 			IJ_update_rvar("diag.j", 1443, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1445, Rv_jbi_fifo_wr1_config);
!!# 			IJ_update_rvar("diag.j", 1446, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1456, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1458, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1459, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1460, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1461, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1462, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1463, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1464, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1465, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1466, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1467, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1468, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1469, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1470, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1471, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1472, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1473, th_M, "\n\n\n");
!!# 
!!#                         }
!!# 
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1477, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1478, Rv_memaddr_pattern);
!!# 
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1480, Rv_jbi_h_addr_pattern0);
!!# 
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi0 < 550024249344 ) {
!!#                         jbi0 = IJ_get_rvar_val64("diag.j", 1485, Rv_jbi_h_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1486, Rv_jbi_h_addr_pattern0);
!!#                         }
!!# 
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1489, Rv_jbi_h_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1490, Rv_jbi_h_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1491, Rv_jbi_h_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1492, Rv_jbi_h_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1493, Rv_jbi_h_addr_pattern5);
!!# 
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1495, Rv_jbi_h_addr_pattern6);
!!#                         ! to remove address not in dma-fake range
!!#                         while (jbi6 > 1095216660479)  {
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1498, Rv_jbi_h_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1499, Rv_jbi_h_addr_pattern6);
!!#                         }
!!# 
!!# 			IJ_update_rvar("diag.j", 1502, Rv_jbi_h_addr_pattern0);
!!# 			IJ_update_rvar("diag.j", 1503, Rv_jbi_h_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1504, Rv_jbi_h_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1505, Rv_jbi_h_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1506, Rv_jbi_h_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1507, Rv_jbi_h_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1508, Rv_jbi_h_addr_pattern6);
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
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi0; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<7;i++) {
!!#                         h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64("diag.j", 1534, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1535, Rv_rand64);
!!#                         data_st = h_DATA_ARRAY[h_wr_cntr];
!!#                         addr_st = h_ADDR_ARRAY[h_a_wr_cntr -7 + i];
!!#                         IJ_printf ("diag.j", 1538, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1540, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1542, th_M, "\tsth\t%%r10, [%%r6]\n");
!!# 
!!#  			! cache able store and load to main memory 
!!#                         if(random()%4 == 0) {
!!#                         IJ_printf ("diag.j", 1546, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1548, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1551, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1553, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1555, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1556, Rv_memaddr_pattern);
!!#                         }
!!# 
!!#                         h_wr_cntr++;
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
!!#                         if(h_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1588, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1590, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
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
!!#                         IJ_printf ("diag.j", 1603, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                                 mem_ad);
!!#                         IJ_printf ("diag.j", 1605, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         if(random()%2) {
!!#                         IJ_printf ("diag.j", 1608, th_M, "\tstx\t%%r10, [%%r6]\n");
!!#                         } else {
!!#                         IJ_printf ("diag.j", 1610, th_M, "\tldx\t[%%r6], %%r10\n"); 
!!#                         }
!!#                         mem_ad = IJ_get_rvar_val64("diag.j", 1612, Rv_memaddr_pattern);
!!#                         IJ_update_rvar("diag.j", 1613, Rv_memaddr_pattern);
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
!!#                       IJ_printf ("diag.j", 1628, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
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
