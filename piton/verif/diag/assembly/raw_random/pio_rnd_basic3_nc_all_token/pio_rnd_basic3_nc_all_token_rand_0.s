// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_nc_all_token_rand_0.s
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
   random seed:	54051382
   Jal pio_rnd_basic3_nc_all_token.j:	
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
.global  My_0x30_trap

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

My_0x30_trap:
  rdpr  %tt, %o0
  retry

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
add 0x0, %g4, %g4
add 0x0, %g2, %g2
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

	setx 0x8155eeae0604f5ee, %g1, %g0
	setx 0x66a42236eb6471ab, %g1, %g1
	setx 0xb15f53fba8912611, %g1, %g2
	setx 0x6fff2f66200623c4, %g1, %g3
	setx 0xb6004a0771fbcdaa, %g1, %g4
	setx 0xe40ed9f0bd92140c, %g1, %g5
	setx 0xbc39735aaf07587c, %g1, %g6
	setx 0x8429d420109ff039, %g1, %g7
	setx 0x8a8e1b3ea43c7d5f, %g1, %r16
	setx 0x4f8992f91a28b3d2, %g1, %r17
	setx 0xa1d6632ed43b4424, %g1, %r18
	setx 0xc17cfa613e6f8873, %g1, %r19
	setx 0x8510a770eca12908, %g1, %r20
	setx 0x60f9ebb0406136ad, %g1, %r21
	setx 0x70c6126ef3803050, %g1, %r22
	setx 0xeb7f7aeed061c7e0, %g1, %r23
	setx 0xa049a61087217cfb, %g1, %r24
	setx 0x272db41b39d0b1d6, %g1, %r25
	setx 0x1984c21bd1f5fd42, %g1, %r26
	setx 0x48d60fbbe87df4fa, %g1, %r27
	setx 0x702d293b80f4ce32, %g1, %r28
	setx 0xffe7f975d13631be, %g1, %r29
	setx 0xef1bf789f6c748e6, %g1, %r30
	setx 0x332a59f4caa26a22, %g1, %r31
	save
	setx 0x536faeb7d183f81c, %g1, %r16
	setx 0xe2bb8ca905e06c56, %g1, %r17
	setx 0x271de814ecc9fd44, %g1, %r18
	setx 0xbf24d4b5f413f8f6, %g1, %r19
	setx 0x8089c34f3ad71216, %g1, %r20
	setx 0xee6305315a09ccef, %g1, %r21
	setx 0x14488a68c4ae3545, %g1, %r22
	setx 0x5db92d23848cedc4, %g1, %r23
	setx 0x6f1c921f3ce36202, %g1, %r24
	setx 0x8dae477d4de984ab, %g1, %r25
	setx 0x2311906164c031ec, %g1, %r26
	setx 0xe86b663c9605a321, %g1, %r27
	setx 0xe788719c4c72e16c, %g1, %r28
	setx 0x800d36e07f5b3dd5, %g1, %r29
	setx 0xdac08297d9b5c33a, %g1, %r30
	setx 0x0ef63fbbb30f3f12, %g1, %r31
	save
	setx 0xc1c68a99194112a0, %g1, %r16
	setx 0x621d9447bcedde85, %g1, %r17
	setx 0x8559426225de944b, %g1, %r18
	setx 0x9031ea00f363d308, %g1, %r19
	setx 0xa812eca7f172d8db, %g1, %r20
	setx 0xaa13cf9f94cc846b, %g1, %r21
	setx 0xc8075f5964981fe9, %g1, %r22
	setx 0x9fdb2a880a4f7df5, %g1, %r23
	setx 0x176046f645c52edd, %g1, %r24
	setx 0x8184575f1b3fa9ae, %g1, %r25
	setx 0xa4a2ff5f47d22d31, %g1, %r26
	setx 0xaa448baf3e2435da, %g1, %r27
	setx 0xa00d98d7b8bdcca4, %g1, %r28
	setx 0x38ea9719b1c10851, %g1, %r29
	setx 0x5ab0a387fc13071a, %g1, %r30
	setx 0x8a92cbd91d318c7d, %g1, %r31
	restore
	mov	0, %r8
	setx	0x0000000043101b0b, %r1, %r9
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



	setx	0x000000800e000008, %r1, %r6
	.word 0xe8098008  ! 1: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xa839a020  ! 2: XNOR_I	xnor 	%r6, 0x0020, %r20
	.word 0xe431a020  ! 3: STH_I	sth	%r18, [%r6 + 0x0020]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe0098008  ! 7: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6c18008  ! 8: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xe0318008  ! 9: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe0598008  ! 13: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaa81a018  ! 14: ADDcc_I	addcc 	%r6, 0x0018, %r21
	.word 0xec71a018  ! 15: STX_I	stx	%r22, [%r6 + 0x0018]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe011a018  ! 19: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xa601a018  ! 20: ADD_I	add 	%r6, 0x0018, %r19
	.word 0xec318008  ! 21: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe8098008  ! 25: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xaeb1a038  ! 26: ORNcc_I	orncc 	%r6, 0x0038, %r23
	.word 0xe039a038  ! 27: STD_I	std	%r16, [%r6 + 0x0038]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe051a038  ! 31: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xaa19a010  ! 32: XOR_I	xor 	%r6, 0x0010, %r21
	.word 0xec29a010  ! 33: STB_I	stb	%r22, [%r6 + 0x0010]
	setx	0x000000800e000038, %r1, %r6
	.word 0xec198008  ! 37: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xaa818008  ! 38: ADDcc_R	addcc 	%r6, %r8, %r21
	.word 0xec718008  ! 39: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe059a010  ! 43: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xa2a98008  ! 44: ANDNcc_R	andncc 	%r6, %r8, %r17
	.word 0xec29a010  ! 45: STB_I	stb	%r22, [%r6 + 0x0010]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe0198008  ! 49: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xac99a018  ! 50: XORcc_I	xorcc 	%r6, 0x0018, %r22
	.word 0xe021a018  ! 51: STW_I	stw	%r16, [%r6 + 0x0018]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe811a018  ! 55: LDUH_I	lduh	[%r6 + 0x0018], %r20
	.word 0xa001a010  ! 56: ADD_I	add 	%r6, 0x0010, %r16
	.word 0xec298008  ! 57: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000800e000020, %r1, %r6
	.word 0xec11a010  ! 61: LDUH_I	lduh	[%r6 + 0x0010], %r22
	.word 0xac818008  ! 62: ADDcc_R	addcc 	%r6, %r8, %r22
	.word 0xec71a010  ! 63: STX_I	stx	%r22, [%r6 + 0x0010]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe859a010  ! 67: LDX_I	ldx	[%r6 + 0x0010], %r20
	.word 0xaeb18008  ! 68: SUBCcc_R	orncc 	%r6, %r8, %r23
	.word 0xe071a010  ! 69: STX_I	stx	%r16, [%r6 + 0x0010]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe401a010  ! 73: LDUW_I	lduw	[%r6 + 0x0010], %r18
	.word 0xa201a010  ! 74: ADD_I	add 	%r6, 0x0010, %r17
	.word 0xe0218008  ! 75: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe8018008  ! 79: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xacb1a018  ! 80: SUBCcc_I	orncc 	%r6, 0x0018, %r22
	.word 0xe8298008  ! 81: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xec498008  ! 85: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xac29a028  ! 86: ANDN_I	andn 	%r6, 0x0028, %r22
	.word 0xe021a028  ! 87: STW_I	stw	%r16, [%r6 + 0x0028]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe0118008  ! 91: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa801a008  ! 92: ADD_I	add 	%r6, 0x0008, %r20
	.word 0xe0398008  ! 93: STD_R	std	%r16, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe019a008  ! 97: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xac298008  ! 98: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xec29a008  ! 99: STB_I	stb	%r22, [%r6 + 0x0008]
	setx	0x000000800e000018, %r1, %r6
	.word 0xec09a008  ! 103: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xaec1a038  ! 104: ADDCcc_I	addccc 	%r6, 0x0038, %r23
	.word 0xec298008  ! 105: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe411a038  ! 109: LDUH_I	lduh	[%r6 + 0x0038], %r18
	.word 0xa2b1a010  ! 110: ORNcc_I	orncc 	%r6, 0x0010, %r17
	.word 0xe0318008  ! 111: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe0598008  ! 115: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa801a038  ! 116: ADD_I	add 	%r6, 0x0038, %r20
	.word 0xe071a038  ! 117: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe851a038  ! 121: LDSH_I	ldsh	[%r6 + 0x0038], %r20
	.word 0xa689a020  ! 122: ANDcc_I	andcc 	%r6, 0x0020, %r19
	.word 0xe029a020  ! 123: STB_I	stb	%r16, [%r6 + 0x0020]
	setx	0x000000800e000010, %r1, %r6
	.word 0xec118008  ! 127: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xacb1a020  ! 128: ORNcc_I	orncc 	%r6, 0x0020, %r22
	.word 0xe0318008  ! 129: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xec498008  ! 133: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa841a000  ! 134: ADDC_I	addc 	%r6, 0x0000, %r20
	.word 0xe029a000  ! 135: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe0518008  ! 139: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa0998008  ! 140: XORcc_R	xorcc 	%r6, %r8, %r16
	.word 0xec298008  ! 141: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe459a000  ! 145: LDX_I	ldx	[%r6 + 0x0000], %r18
	.word 0xaa318008  ! 146: SUBC_R	orn 	%r6, %r8, %r21
	.word 0xec39a000  ! 147: STD_I	std	%r22, [%r6 + 0x0000]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe4198008  ! 151: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa0918008  ! 152: ORcc_R	orcc 	%r6, %r8, %r16
	.word 0xe0718008  ! 153: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe801a000  ! 157: LDUW_I	lduw	[%r6 + 0x0000], %r20
	.word 0xa4a1a008  ! 158: SUBcc_I	subcc 	%r6, 0x0008, %r18
	.word 0xe8318008  ! 159: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe4518008  ! 163: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xaeb18008  ! 164: ORNcc_R	orncc 	%r6, %r8, %r23
	.word 0xe0218008  ! 165: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe011a008  ! 169: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xa8018008  ! 170: ADD_R	add 	%r6, %r8, %r20
	.word 0xe8218008  ! 171: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe011a008  ! 175: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xa8898008  ! 176: ANDcc_R	andcc 	%r6, %r8, %r20
	.word 0xec398008  ! 177: STD_R	std	%r22, [%r6 + %r8]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe041a008  ! 181: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xa0b1a020  ! 182: SUBCcc_I	orncc 	%r6, 0x0020, %r16
	.word 0xe8298008  ! 183: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe4498008  ! 187: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa2018008  ! 188: ADD_R	add 	%r6, %r8, %r17
	.word 0xec29a020  ! 189: STB_I	stb	%r22, [%r6 + 0x0020]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe8018008  ! 193: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xaa19a028  ! 194: XOR_I	xor 	%r6, 0x0028, %r21
	.word 0xec298008  ! 195: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe409a028  ! 199: LDUB_I	ldub	[%r6 + 0x0028], %r18
	.word 0xac098008  ! 200: AND_R	and 	%r6, %r8, %r22
	.word 0xec298008  ! 201: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe4498008  ! 205: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa8b18008  ! 206: SUBCcc_R	orncc 	%r6, %r8, %r20
	.word 0xe8298008  ! 207: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe859a028  ! 211: LDX_I	ldx	[%r6 + 0x0028], %r20
	.word 0xa881a030  ! 212: ADDcc_I	addcc 	%r6, 0x0030, %r20
	.word 0xe4318008  ! 213: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe841a030  ! 217: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xa2318008  ! 218: ORN_R	orn 	%r6, %r8, %r17
	.word 0xe0318008  ! 219: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe451a030  ! 223: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	.word 0xae298008  ! 224: ANDN_R	andn 	%r6, %r8, %r23
	.word 0xe0218008  ! 225: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe8018008  ! 229: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xac31a008  ! 230: ORN_I	orn 	%r6, 0x0008, %r22
	.word 0xe821a008  ! 231: STW_I	stw	%r20, [%r6 + 0x0008]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe0098008  ! 235: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xac99a028  ! 236: XORcc_I	xorcc 	%r6, 0x0028, %r22
	.word 0xe421a028  ! 237: STW_I	stw	%r18, [%r6 + 0x0028]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe8498008  ! 241: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa211a018  ! 242: OR_I	or 	%r6, 0x0018, %r17
	.word 0xe471a018  ! 243: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe8018008  ! 247: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xae418008  ! 248: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xec298008  ! 249: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xec198008  ! 253: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xaa098008  ! 254: AND_R	and 	%r6, %r8, %r21
	.word 0xe029a018  ! 255: STB_I	stb	%r16, [%r6 + 0x0018]
	setx	0x000000800e000008, %r1, %r6
	.word 0xec598008  ! 259: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa699a008  ! 260: XORcc_I	xorcc 	%r6, 0x0008, %r19
	.word 0xe0218008  ! 261: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe0598008  ! 265: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa2b9a038  ! 266: XNORcc_I	xnorcc 	%r6, 0x0038, %r17
	.word 0xe029a038  ! 267: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe049a038  ! 271: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xa081a010  ! 272: ADDcc_I	addcc 	%r6, 0x0010, %r16
	.word 0xe021a010  ! 273: STW_I	stw	%r16, [%r6 + 0x0010]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe0598008  ! 277: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa431a038  ! 278: ORN_I	orn 	%r6, 0x0038, %r18
	.word 0xe431a038  ! 279: STH_I	sth	%r18, [%r6 + 0x0038]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe8198008  ! 283: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa4018008  ! 284: ADD_R	add 	%r6, %r8, %r18
	.word 0xe439a038  ! 285: STD_I	std	%r18, [%r6 + 0x0038]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe4418008  ! 289: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xaac1a008  ! 290: ADDCcc_I	addccc 	%r6, 0x0008, %r21
	.word 0xe021a008  ! 291: STW_I	stw	%r16, [%r6 + 0x0008]
	setx	0x000000800e000030, %r1, %r6


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
	.xword	0xdd717fbd90acd916
	.xword	0xf5ff07f12c793033
	.xword	0xdd9508681b97469a
	.xword	0x77011cc794763907
	.xword	0xe50bfbc665163b94
	.xword	0x8962129a649fdf33
	.xword	0xd2fcb58d5164edca
	.xword	0x09612d83dd7590ff
	.xword	0x31aac0e38f2865f4
	.xword	0x9b2d26d2d7d5248f
	.xword	0xf2b1007318981770
	.xword	0x132c0098fa6dc06e
	.xword	0x161461c9440980c3
	.xword	0xf2b26fe7b476f9e0
	.xword	0x95a2900ab888b712
	.xword	0x8a2506fd32493586
	.xword	0x6029fadc1b4f4918
	.xword	0xdcdfab8f89afbc2e
	.xword	0x15fc6c70300a4da5
	.xword	0x8379ae97ab2b7c25
	.xword	0x0337af90d35b16d7
	.xword	0x4ecffc3f33eed083
	.xword	0x65f4f3f1dcb07976
	.xword	0x4fddae1f4e42303a
	.xword	0x9a5d4738e4697f86
	.xword	0xe4164a7952f5e01e
	.xword	0xdd0a07caecf65e0b
	.xword	0x778dbf5e057ca7c9
	.xword	0x522e14489b45700a
	.xword	0x1c9998bd2702fa33
	.xword	0x2827fbbfeab2b417
	.xword	0xad262b2c6973f767
	.xword	0xeddaeb0a85a1b226
	.xword	0xbec6d6062abc8333
	.xword	0x8554bc447fdab58f
	.xword	0x42e24eb4866d9a36
	.xword	0xd2dd7cf3b342a604
	.xword	0x497dd5a8e0aa4736
	.xword	0xc8d7d86b93571506
	.xword	0x8078e54b3684c5c2
	.xword	0xc93cbde8631d81f2
	.xword	0xcabc42cefaf762a9
	.xword	0x1d094c987074fe56
	.xword	0x86016328c9618a5b
	.xword	0x9d3e65f446e7f08b
	.xword	0xa86549c94908ca02
	.xword	0xa449236b1c38da28
	.xword	0x501b08df63fd9ddd
	.xword	0xab7f06cb22447b81
	.xword	0xcc5e96d76da27957
	.xword	0x8afec7fe45355074
	.xword	0xdfce75d575003345
	.xword	0x38481bd476f4b381
	.xword	0xc26db964645ad33c
	.xword	0x5a5b21541f1be521
	.xword	0xd6c7db06dd9822c1
	.xword	0x4573eb28d343e4fd
	.xword	0x2742ef9cae184b3d
	.xword	0x7b146c4003fb1fa3
	.xword	0xd67849f06afe6ec7
	.xword	0x9006aab7e9f99455
	.xword	0x582c2b021ccf37c8
	.xword	0x39e565a4a7ae80ef
	.xword	0x6253f88dbbd00f13
	.xword	0x67f6c4026edeabfb
	.xword	0x19f5b6597bcfd795
	.xword	0x4573350a74d00cf2
	.xword	0xc11efd6367f58ded
	.xword	0xa2212042ea6af5ff
	.xword	0x04d313f3ec78d069
	.xword	0xa8e9da533d9f2d4f
	.xword	0xb17127a7dc6fe19f
	.xword	0x7fc7757b1dea74c4
	.xword	0x9301b25edd06b6ee
	.xword	0x4943b27110e570e8
	.xword	0xe47d4ebbe23d6172
	.xword	0x3f6d03411bfcd54b
	.xword	0x92b4e4487e5dd8d6
	.xword	0xc50ee01f325414fc
	.xword	0xdfbf95a7849a8044
	.xword	0xfb7ce3f07b4f59be
	.xword	0xda536b756ed3ffc3
	.xword	0x9c7928c7e661fd6d
	.xword	0x25d817f57d1d03a0
	.xword	0x730a7b29153c283c
	.xword	0xcb93291deff52c09
	.xword	0x498641c17942f6fa
	.xword	0xee670f2e63f36226
	.xword	0x01037113ce673833
	.xword	0x7b8663a8400caad0
	.xword	0x07dfd71153e8fd94
	.xword	0xb0e1587cd7740813
	.xword	0x2ab42c0ad3c4d28f
	.xword	0x7129db36ea162de4
	.xword	0x4f2a2fe8494bf0fb
	.xword	0x8697162af6efc823
	.xword	0x8e9568b707084b92
	.xword	0x77cea7b82d0c3119
	.xword	0x8449af6694045938
	.xword	0x4d37b9a581bb5768
	.xword	0xda03ebc9c905c0bc
	.xword	0x4020b1674997b9f3
	.xword	0xe9ef83a892c7f42c
	.xword	0x13d80a301189b1b6
	.xword	0x1d0506cc17d2e431
	.xword	0x8bdebde60ebd140f
	.xword	0xcec02c23c87b4afd
	.xword	0x198a07b100b1aeff
	.xword	0x5d94481b846489fe
	.xword	0x2d6c8e8824f72c3f
	.xword	0x0b77507c2d0253cf
	.xword	0xd80c400646d88608
	.xword	0x3710bcdd8b3de883
	.xword	0x3a09f588d5320e38
	.xword	0x0cc204426492b519
	.xword	0xc10091342211c125
	.xword	0x7fa18f3b70eb1b7e
	.xword	0xf962c8341e718f59
	.xword	0x22cdfb1dd17d0fba
	.xword	0xede19067d16c6a01
	.xword	0x3582708466f95c4f
	.xword	0x756b0201741efe59
	.xword	0x7dec52abec381fad
	.xword	0xe63037c91a2394c0
	.xword	0xbb4f93658573f90b
	.xword	0x4aa63fe03010487f
	.xword	0x3d776b8102f2f8e8
	.xword	0xd81db99e52812ee6
	.xword	0x56ebfcbfd8b94f35
	.xword	0x4849412426063d43
	.xword	0x28a89f52ae50f17d
	.xword	0x1b691c2f634ffa41
	.xword	0x10acc38cfa651ed1
	.xword	0x78f48bd2e8393f01
	.xword	0xd7470548ba901507
	.xword	0x8a7e8611d4ee77c1
	.xword	0x3c44f4fd96b20abc
	.xword	0x61c3fbb19ad8e76a
	.xword	0xdb0fe6571d5bb09e
	.xword	0x2380d2ca4c8f0f24
	.xword	0x0c0a49a5ca15c31e
	.xword	0x783ee184d8ff32eb
	.xword	0xb74cac34ef00acc1
	.xword	0x14ab42fcea7e83ca
	.xword	0x4e93e27a7265afdc
	.xword	0x9ce55ae7deb9ab8d
	.xword	0x6c9f883bfb5ee289
	.xword	0xdfe5170fa9a97b70
	.xword	0x2af0be2dc532c9d5
	.xword	0x904ee797136e80bd
	.xword	0x92ec2168a6b516e8
	.xword	0x32c9bd2b5f5c77f9
	.xword	0x9d5fe5b08a609135
	.xword	0x74a55cb75c4c980f
	.xword	0x0f6cae592c476de4
	.xword	0x3164bdf7fb4fdd07
	.xword	0xb3b07e45ab4cf6a7
	.xword	0xd161470c078d702e
	.xword	0x9f5948ad77ebf872
	.xword	0x8d964f282456d93c
	.xword	0x25d1ab06ef56436d
	.xword	0xa42f6937fefe5aee
	.xword	0xc4f79cd958831984
	.xword	0xb217cc58a2434d62
	.xword	0xfcdeaf163f7a39ac
	.xword	0xb347d1d3045d01c4
	.xword	0x8523dc113b34f006
	.xword	0xfa02e9d017327538
	.xword	0xda941e0c89876e25
	.xword	0xc7386ec973992990
	.xword	0x1d6b9e39d7570aa2
	.xword	0x5dc20540b48d577d
	.xword	0xe6164060c96f4cb4
	.xword	0x480f8db1cf217eab
	.xword	0x454023e586276fd6
	.xword	0x77cf7773feba5170
	.xword	0x7d6acc2a75c657af
	.xword	0xaa660d7c86bcf25f
	.xword	0x8f608d6c2b82c904
	.xword	0xd473831ce3555d4b
	.xword	0x07c5f06d7531648e
	.xword	0x696419c557964ca6
	.xword	0x40218cbbd0d6095b
	.xword	0x54b11066eb74ec82
	.xword	0xe680266592a209ec
	.xword	0x167d1cf031571438
	.xword	0x8a508b995f6222ec
	.xword	0xeca5c648a8918e25
	.xword	0xa269bbea70276cc7
	.xword	0x0ad935f22357aa10
	.xword	0xc5555a27d61ff968
	.xword	0xf549bf4d70255b0d
	.xword	0x70aa017de69728eb
	.xword	0x57f5ad9b1ef1f130
	.xword	0xa007c860e620e454
	.xword	0x60249aa5ab10169d
	.xword	0x0bc36a2575caabac
	.xword	0x1da1ff19eb3934cc
	.xword	0x4ca864df09500576
	.xword	0x4eb0592060e5e4c7
	.xword	0x21c1a49dd0860b8f
	.xword	0x8deec04be7405fdb
	.xword	0xacbeaad06bd52496
	.xword	0x2fc83710efeefcbe
	.xword	0x080cf2ac959ceb36
	.xword	0xf0c9da0bcf40a084
	.xword	0xfc4bf9b17b4ce9a7
	.xword	0xe1cad2c737e71cce
	.xword	0x1bcc37424e3f2277
	.xword	0xe3e0ebcb8930b0af
	.xword	0xb1312cf4fe352bcd
	.xword	0x428c941b5ec9cacb
	.xword	0x18c720612aacbd64
	.xword	0x203bf1138b08fe25
	.xword	0xfe8709f57fb4d6bf
	.xword	0xf5bbb65bdc52664a
	.xword	0xa900cfd7a577b186
	.xword	0x6907f2c2bc3add23
	.xword	0xa0ec713ad067f5e4
	.xword	0xd3ecf83b41f30556
	.xword	0x29f28a329280f5bb
	.xword	0x3af122538efdd4b2
	.xword	0xe70d942a495d73cb
	.xword	0x3628fae0bbe987b9
	.xword	0xc66b089c3b892373
	.xword	0xf8887448a6894ed6
	.xword	0x1f43b92d727ada0d
	.xword	0x1d30655d562e3ba3
	.xword	0xc448c201f2deaf42
	.xword	0xdd7ae88f792615c5
	.xword	0xe67ea62940c07a2c
	.xword	0x1b4d728d265c56b1
	.xword	0xb750a81a7d45c086
	.xword	0x023a65eb5a95a0b1
	.xword	0x215f84c340ca2031
	.xword	0xe96e3249b1b0fc4a
	.xword	0x23f03fea34b6c280
	.xword	0x5d4212c2d2a6913e
	.xword	0x30f6f72c416426db
	.xword	0x531e6851be0ffa0f
	.xword	0x96749024ee3106d1
	.xword	0xbfdd33c593acea38
	.xword	0x8f7289fd9743222e
	.xword	0xd19fb7f7b0455375
	.xword	0xc46d80c922707877
	.xword	0x9f0e3ba4d1461847
	.xword	0xa3fc68bbae0be435
	.xword	0x5038f579b7e40887
	.xword	0x243ac04bba51b0b9
	.xword	0x644fb56595e95674
	.xword	0x0d80d72f3d632cdc
	.xword	0xd9533817b160f95a
	.xword	0xdee71192076a2834
	.xword	0xc407286b8f6ab8bb
	.xword	0xc7e719b2e7b18888
	.xword	0xbca3a6a5bbc95c13



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
	.xword	0xde0ea7295ae61597
	.xword	0xa29720a4d25221d6
	.xword	0x4173f99cd815f4ba
	.xword	0x71626efc8aaf2290
	.xword	0x48ae73c84e0eeea4
	.xword	0xd77312a2ec1d7dca
	.xword	0x9c5aa2d3296ebc52
	.xword	0xf4f0c6b4485691bb
	.xword	0xc264b2d9beb5bfca
	.xword	0x91b1d7fc5ceb301f
	.xword	0x9329494d1bb93fc5
	.xword	0x0b95ae3d29bfa73f
	.xword	0x64a4a7f87b4d483a
	.xword	0xa1ba77a585acbefe
	.xword	0x5ca2583a23b96aff
	.xword	0x6a5e080fe18722d0
	.xword	0x8d92946c82fa571b
	.xword	0xc797f179a902b441
	.xword	0xecee49128d36ef22
	.xword	0x02ec5962e2ecf45c
	.xword	0xf05067d80c7abfb1
	.xword	0x710bae4c70134dbf
	.xword	0x3b907c4372f29321
	.xword	0x34e742bad708d428
	.xword	0x42d843c683ac2bfd
	.xword	0x685d5c52f5d2552e
	.xword	0x5d40651c608aac02
	.xword	0x0d7746af60aa2292
	.xword	0x0ba8ba13695d2d15
	.xword	0x853ee67a0e09a59c
	.xword	0xbcd3600ed8108121
	.xword	0x89fa247789d82a7c
	.xword	0x28c4de6f8f172ac5
	.xword	0xb03e403342ef1db7
	.xword	0x7e7940c005327293
	.xword	0x2fb3399f6b0ca09b
	.xword	0x7e87a069f881e367
	.xword	0x305a2a3cec4e8647
	.xword	0xccf07dbb2c79e98b
	.xword	0x8df39cf429cb5c55
	.xword	0x24c39e5da8f17e96
	.xword	0x77e87a3b6de7dcd5
	.xword	0x32f508ba144da2cd
	.xword	0xed60f0987b77cd9a
	.xword	0x62318b4f9284a18b
	.xword	0xc39f8efc0a937154
	.xword	0x5024b875abc769a9
	.xword	0x57de50bcae9eca5e
	.xword	0x9937a3347fd3da4f
	.xword	0x66a754a0325a2a63
	.xword	0x7e752d8b5da20d16
	.xword	0x316b106a70570a31
	.xword	0x70343ed0d1e6fc56
	.xword	0xeb39c7c04322af60
	.xword	0x4ba38b7f1a9d3399
	.xword	0xb85b7f41cbaba998
	.xword	0x20de86be921d5bbd
	.xword	0x97c3a59ff2614af9
	.xword	0x073e8f04da83c089
	.xword	0x2f9a32f9b2cba0d9
	.xword	0xdff9d496dde2d8dd
	.xword	0x388a51cfaa36a2e6
	.xword	0x75b2f6119a85f0df
	.xword	0x3184b8b16da387d8
	.xword	0x5fd9f09308f63a90
	.xword	0x4c89934207be5420
	.xword	0x694c0544da07e88f
	.xword	0x6504a014a70fdd3c
	.xword	0x9412c3670cf38d98
	.xword	0x1a3fdc8c3eed13da
	.xword	0xfedb2ad4756f9c32
	.xword	0x591482e408b1128c
	.xword	0x48f8161250d36420
	.xword	0xa4fe66bf84d2607b
	.xword	0x74a392bb0f5129d1
	.xword	0xc5eb4d993f67b626
	.xword	0xb099d8bc2fe63fe1
	.xword	0x5af02c6ebecd8c39
	.xword	0x5486e203ed040494
	.xword	0x23b6827b5671a6f2
	.xword	0x589e174eb1a6a9f9
	.xword	0x5109d52f5c50dac1
	.xword	0x0b66efd390311ee7
	.xword	0x668d960f17c298dd
	.xword	0x3f16c2490b7e7a4c
	.xword	0x3e462d688251d97b
	.xword	0x9252517c7fb37648
	.xword	0x1198eed810403ac0
	.xword	0xe25b0f33ee1d2805
	.xword	0xe2bd481fefd952f5
	.xword	0x7c090d5a3aef90c7
	.xword	0xc16d6c1a05f283b0
	.xword	0xe6899798aa3c1a3c
	.xword	0xf4f8c152fbdf46f5
	.xword	0x4bb0dc57be71945e
	.xword	0x66faf8a4ad613b31
	.xword	0x72ffb6374a887bdc
	.xword	0x147fee4bb01147f6
	.xword	0x1366249969ab324c
	.xword	0x2c3512cbc870fff6
	.xword	0x305cb9651132d9c0
	.xword	0x7ce5b96f9b77078b
	.xword	0x2357a04823eee33d
	.xword	0x5e32447fd12546fa
	.xword	0xd40878759ab67f50
	.xword	0x82b645b9e638acab
	.xword	0x475bc2e264a8f067
	.xword	0xbc9fca1edc79a583
	.xword	0xf22b0b2f01549904
	.xword	0x35302183a2e27a25
	.xword	0x2d3241d644be9eaa
	.xword	0x532e0fef074c41e1
	.xword	0xcc905ebd383da818
	.xword	0x3a853b689df0ebb4
	.xword	0xb571d72c9113637b
	.xword	0x746fe567efa1c486
	.xword	0x1c224be7e7bb80ff
	.xword	0xe19bf9019faf4176
	.xword	0x8dd50b4f306489e2
	.xword	0xdc7e21b0ae8e6d63
	.xword	0xd9252f7fe45c9ee3
	.xword	0xcdb4abd73b8b6c4c
	.xword	0xec662ea20343bfee
	.xword	0x25af43f4960a59f7
	.xword	0xb8a2b17780a7f340
	.xword	0x9f61b3b27c69bde0
	.xword	0xb235b5a6828ad0e0
	.xword	0x77335ee1d6b9bd49
	.xword	0xe91531be696fedb4
	.xword	0x511f9ee31e3f54a7
	.xword	0xa416e9e72f6a0080
	.xword	0x73a468343ec4a2ab
	.xword	0xc8026ea0bdb8628c
	.xword	0xc4482c988dd46534
	.xword	0xd741be5acd53fe24
	.xword	0x05b717cd761275d4
	.xword	0x926a1498073d8dc8
	.xword	0x1afc0586794f888b
	.xword	0x152fe7b1e27d7e6c
	.xword	0xfaa26285f4ea75e9
	.xword	0x7909404dde8dd086
	.xword	0x48d3335c9758ca6e
	.xword	0xc0c9575d5608e9c2
	.xword	0xf88565358585d630
	.xword	0x3642261215cc78e9
	.xword	0x33f05aef5f39c30b
	.xword	0xb79cde36de20f88d
	.xword	0x39a7aa8573048e45
	.xword	0x8f5f3c851bb8e24a
	.xword	0x7a045f45591d9fef
	.xword	0x8cd7ae93167e12fb
	.xword	0x719c091fdca13462
	.xword	0x180c662ae868a1bc
	.xword	0x6777724eab847c89
	.xword	0x88c9eed23ea6387f
	.xword	0x201bca91a55626dc
	.xword	0xf2034f95ed087929
	.xword	0x44e4d898100b536a
	.xword	0x76ff4f44d35df284
	.xword	0x5628c6b05e96f513
	.xword	0x81b0bd75f85079a9
	.xword	0x14de0fb9a8eba07e
	.xword	0xbb5bd8018c86b046
	.xword	0xfe67f56779186b15
	.xword	0xc97bc4cce24ba197
	.xword	0x0b01a20562a2b1e0
	.xword	0xd1d370fb70b5b9f8
	.xword	0x6cfbb5f6fa621d4f
	.xword	0xca20980b52d7fe4b
	.xword	0xe16e91b5163f1d08
	.xword	0x8ca88a278699c4b9
	.xword	0xc8e41579d5ab407c
	.xword	0xa5663479f68bcced
	.xword	0x130ff3d3645f48bd
	.xword	0xc5a64ec8c8fb1957
	.xword	0xe97360d63c5d5e23
	.xword	0x72b12d8ed4d39f3c
	.xword	0x3468d5b7833f3daa
	.xword	0x851ce23e7fb44e42
	.xword	0xb70bb8c7508804db
	.xword	0x60312dc12d2a91eb
	.xword	0x9b586ff7a490e27a
	.xword	0xd533f0c47051b1ee
	.xword	0x8310a3ee6fac6a2e
	.xword	0x7191d4a44de5c756
	.xword	0x6affd2cfdfd1730c
	.xword	0x4ddeb9480152f225
	.xword	0xc34ccdfa1b733188
	.xword	0xaf58c8e4d46dd829
	.xword	0x4cae17d0cbac92b5
	.xword	0x25bc13b4822c83e6
	.xword	0xa63e4eca5f3c8f9b
	.xword	0xa151a20a75c3c5b3
	.xword	0x3f2143ebf99a0079
	.xword	0x80508e0862e27654
	.xword	0xa6e33712ed59cec2
	.xword	0xbbfe84555f518d5e
	.xword	0x23eb635d46c19031
	.xword	0x766713b7daa86fe2
	.xword	0xf69d9ead1f1ec5ee
	.xword	0xd614d96d9dea0ebb
	.xword	0xd09754c3decaf778
	.xword	0x4eb0f73c8fe6c247
	.xword	0x963a423c5f262df0
	.xword	0x95ce1a77d9282295
	.xword	0xd774fcef8ec3192e
	.xword	0xe9a08b280cdc963f
	.xword	0x40373723f93a04b5
	.xword	0xb0f90f89656102c0
	.xword	0x21b6bf9f2be25d33
	.xword	0x070da6e5290e4e13
	.xword	0xc6112cf7dccf1bf2
	.xword	0xa46dae02f9ee5c84
	.xword	0xe481bbb669b7cf79
	.xword	0x175fd6e94261615f
	.xword	0x7f8d23f1f7188d35
	.xword	0x9d6047f575eb5d99
	.xword	0x2c9a37adbf5b18ba
	.xword	0x07a54db21276e82d
	.xword	0x61ecbf7b13b43e0a
	.xword	0xb24185ede91b8c25
	.xword	0x34c9d2f61428f802
	.xword	0x5e8ec4fffd81ad95
	.xword	0x96096918f70c70de
	.xword	0x27b311199f9fbf94
	.xword	0xa4d694f9d6e4525d
	.xword	0x5d5d4f47b47b08a4
	.xword	0x8c08043dc7b5887c
	.xword	0x5dffe4c155baec16
	.xword	0x2ac56de4d9dec533
	.xword	0x07d20d98e8678cae
	.xword	0x3e866f63a1d10041
	.xword	0x1082b209a2787469
	.xword	0x357fc52d72982ccb
	.xword	0x9222cd32e14cf2ab
	.xword	0x17a7d458612b2bc5
	.xword	0xe2d0b0038b88cbdf
	.xword	0x1ae8c5fadab193b1
	.xword	0x0b529069b541e016
	.xword	0x58f50f9b87f8d7e2
	.xword	0xc94c450a9f9e535b
	.xword	0x69924af66fff8bec
	.xword	0x8ce970d6e579d708
	.xword	0x00841d9a6e4e92d4
	.xword	0x80f3b72b7e166525
	.xword	0x72987abf1630c22b
	.xword	0xa42d6765f8cf14c9
	.xword	0x05f37746cbf56b10
	.xword	0x2dc9d6de6cfca491
	.xword	0x5eee321dccf38db2
	.xword	0x3e2dfcd6a666bfd5
	.xword	0x70bcc74a4b5d3ea7
	.xword	0x53a52543ea6aa70f
	.xword	0xee1762477eb591b8
	.xword	0x5ad0285cc8c5bdc8
	.xword	0x98f8aa15360633ec



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
	.xword	0x6d59f12d60873d1b
	.xword	0xf8706d7495183ec8
	.xword	0xe9e76f3ab0840306
	.xword	0xb4948d9c6758d833
	.xword	0x8496e857ae87af0a
	.xword	0xc3ccd2c5265e3844
	.xword	0xe3a05217e7c04172
	.xword	0x4929336782295f80
	.xword	0x2e040453b0dcb6e2
	.xword	0xe9f7d04a5c5b6b13
	.xword	0x5ab2e15606c7a7ea
	.xword	0xb54d31b39dff9b7a
	.xword	0x3008d3539868b1cf
	.xword	0xc20d156e221b8b9f
	.xword	0x7ab7d4398374592b
	.xword	0x677dd135f8d93aba
	.xword	0xf070619052a371c6
	.xword	0xf6a0d792b3441e2e
	.xword	0xac53aeab7a5713ea
	.xword	0x03c277138e185860
	.xword	0x7667e9aeb74cc3ee
	.xword	0xc670448d0bf6d729
	.xword	0xb6f0c499305b8d16
	.xword	0x9019945a85ff9eba
	.xword	0xc1aa7efc18cb25d6
	.xword	0x4d3f49583b15e119
	.xword	0xf27ca990d0105400
	.xword	0x278b8a688bb5849f
	.xword	0x25923d7016ea653f
	.xword	0x7ff8f53ee666a141
	.xword	0x2cc1dc1ab9d33423
	.xword	0xca00332161681131
	.xword	0x2f226fe071825d2b
	.xword	0x81203180d9af8438
	.xword	0x9532b2d61aca9de3
	.xword	0xd124d9422e869bba
	.xword	0xeb0d05c94af0ae55
	.xword	0x775b6c0b7e5d24ab
	.xword	0x6a453d7485d8ffd6
	.xword	0x405858c47b56b805
	.xword	0xdd4f4a530cce2d16
	.xword	0xb70b24ed6f9b3edb
	.xword	0x349df8b7bdf9d1e4
	.xword	0xc4e521b4082240ec
	.xword	0x3b3a47c1c9451f59
	.xword	0x32e3caee1efc673d
	.xword	0xc41c701dc97e0608
	.xword	0x32584409709078fc
	.xword	0x519e44c5486b546d
	.xword	0x2850e9e1339e06ff
	.xword	0xd9118d040d841c99
	.xword	0x569f97b8b2c0c99f
	.xword	0x80f25335785743cf
	.xword	0x1381a03b7bc88841
	.xword	0xa74dbdd423729d2d
	.xword	0x0a69131f614e6e95
	.xword	0x447cdabe9e3f1942
	.xword	0x6741ee38a7f53938
	.xword	0x41260fce91badaf8
	.xword	0x286da717381c61b1
	.xword	0x1c10073e5d299633
	.xword	0x54d9dec8af040c34
	.xword	0xb1d33af42c9928c3
	.xword	0xe7a28302133720d4
	.xword	0x799da0c60dbd3f17
	.xword	0x99875767616f9be5
	.xword	0x5dfe26414b43a7e1
	.xword	0xf98da0b6b93516bd
	.xword	0x949f9c4f0c268c01
	.xword	0xc4fb964f104da75a
	.xword	0xde6eba7dc2629091
	.xword	0xed6211ee60f750e7
	.xword	0x3dc5f9f2ad7747cf
	.xword	0x569828ef0f291826
	.xword	0x94444d428176c2e9
	.xword	0xdb47aba3b41fd7c7
	.xword	0x4df2f724bc02c921
	.xword	0x74b144b48cdaa1df
	.xword	0x4a247245c1fadca5
	.xword	0x89cb66cf9a5def53
	.xword	0xecaa428d9baca75a
	.xword	0xf24748c74c8721f0
	.xword	0xd270d2cebd5ff2a4
	.xword	0xae52a4bf6bb493c8
	.xword	0x223e97c170e8b360
	.xword	0x9cf3506438ce8e56
	.xword	0xacb6b7c47518c33c
	.xword	0x46afca3d2ac0abd3
	.xword	0x42c2b8b0830c563a
	.xword	0x60deeaabd9e0265b
	.xword	0xe3f66295dcf2577a
	.xword	0x81ca06f235feaad6
	.xword	0xb48987ace816c9f9
	.xword	0xf17b7bcbb7251f33
	.xword	0x958f9b686434a949
	.xword	0xaa2313604524b64d
	.xword	0x201fc747d3c7d348
	.xword	0x8f5b2d05e9f81ded
	.xword	0x8a5ba275de7237c3
	.xword	0x3c8f35ee731b9ba6
	.xword	0x814536181dbd10b0
	.xword	0x3c5471be2a40c4a7
	.xword	0x2a09e3e2f2e36bf9
	.xword	0x6f9dd5905c6b6a00
	.xword	0x909aa512cc4c4f74
	.xword	0xd0c5e5d19d123587
	.xword	0xbbb27f93f2407cf6
	.xword	0x197d7fa4fcbee10b
	.xword	0x96e011c442afb388
	.xword	0xd6dd6e126d4819f9
	.xword	0xfaf6b0f4b4a11ece
	.xword	0x14721cb6413f8a44
	.xword	0x400eff0ab2ff3736
	.xword	0x59a0111de63bfed9
	.xword	0xfe891a577ed9e7e6
	.xword	0x60981749165ccd97
	.xword	0x369ed1229a01ddce
	.xword	0xc738090b8ad73c73
	.xword	0xd657bbd9a9371b6b
	.xword	0x0cb70ba1db19ef04
	.xword	0x4649131d62311ce0
	.xword	0x38f3076d95b4653c
	.xword	0xdad0141ae358cd20
	.xword	0xb9a82bf23a515b36
	.xword	0x71a7a11450ff176b
	.xword	0x6e20a7a00e1a30c3
	.xword	0x165d5513bbd9e4b5
	.xword	0x3f8ca5d04f364111
	.xword	0xc1c926856fd81145
	.xword	0xa10cde98687c9b79
	.xword	0x4ecde64e8ae2a15c
	.xword	0x60c933a50ef25e52
	.xword	0x290105d9abc0aee9
	.xword	0xaae615a1f5eb4607
	.xword	0x7dea7f1c5e3f1f19
	.xword	0x7525cdaa253858a0
	.xword	0x0d1edb9ee8658b5d
	.xword	0xbbfc2ef99913f0ac
	.xword	0x3a6dc93950e152a2
	.xword	0x18c56167f5efa8ab
	.xword	0xbe596ec4dc4a2e92
	.xword	0x005d1182a0ae3410
	.xword	0x54a85abbafcbbd73
	.xword	0xb6836ec580c80205
	.xword	0xffe632da951f9f51
	.xword	0x0ef8fbfd0951118f
	.xword	0x1bfe0f2e447eaf81
	.xword	0x187fdebc86e30a1e
	.xword	0x6755dab34cdf36c2
	.xword	0x6a7aa3667fc2b079
	.xword	0x4fab2aa229a5380c
	.xword	0xdc79f46a608c706f
	.xword	0x988c7266c7352c7d
	.xword	0x9ae447f838ac771c
	.xword	0xdbedbd7d6a9f28fa
	.xword	0xaeb4fa9749a81a7b
	.xword	0x4f85425f6c46a947
	.xword	0x1d62615f13dbb7ca
	.xword	0x305b0f0fe01f45cc
	.xword	0xc1ec4f19e7e140a9
	.xword	0x1a39489f864797cc
	.xword	0x8d06d9754016f01d
	.xword	0x41c64be00cdfcd35
	.xword	0xdbee8f8c41a6c705
	.xword	0x5d5a85977a05185f
	.xword	0xa55c2aca98e63f3a
	.xword	0xdabe2c85dd9c17f2
	.xword	0xc08b9948c9bb2d95
	.xword	0xa650ad1732cc84cf
	.xword	0xecb15cc9beba0a28
	.xword	0xfd760692e51d3882
	.xword	0xffef41db211acfe6
	.xword	0xe4f965e1d29de03a
	.xword	0x13deaf78ad0045bf
	.xword	0x158859de22f58b98
	.xword	0x7a63a7a4b0588913
	.xword	0x423a4d6835083d79
	.xword	0x6baad4d70b5ea5a3
	.xword	0xcfb96d38d56b2a78
	.xword	0x45619228ba6fb208
	.xword	0x66f0b520002cdcb4
	.xword	0x67b76e1f911599e6
	.xword	0xb479a292be671d3e
	.xword	0x67fae29fbd65a71c
	.xword	0x39486f8cbd7b406f
	.xword	0x684cdfdacf9118c4
	.xword	0x42f001ee72c564f2
	.xword	0xf4cd293fb10eff5c
	.xword	0x728e882655b10938
	.xword	0x151ba9e93a0e43f5
	.xword	0x179ead7802b8593b
	.xword	0xaec3545b81a39117
	.xword	0xeb6e94e08464c805
	.xword	0x2642e79211bf7381
	.xword	0x79efcfde2a85b738
	.xword	0xf30d659b965c97ae
	.xword	0xa01b77681738f849
	.xword	0xf8a352f4a3269bbc
	.xword	0xe52e3175a5595e40
	.xword	0x6a4c52540a5708e8
	.xword	0x795dcbd2b3260252
	.xword	0xb4a78045071fbdb7
	.xword	0x47c9fa128426b2b1
	.xword	0x1d225a210a90b848
	.xword	0xdbd8c731a9157f45
	.xword	0xe1140d8299c0f002
	.xword	0x5b323f4b294c1990
	.xword	0x0ec818d6ce2e2668
	.xword	0xfe471d23c14f2d2c
	.xword	0xc764c21ab570a4a6
	.xword	0x1edfd47d045517af
	.xword	0xe17a989d0926b431
	.xword	0xccf50a9022dfd7a7
	.xword	0x2c73df5172753e4e
	.xword	0xba49939449af98ca
	.xword	0x07baad9cacc3d77b
	.xword	0x5032dc2999ea1dc1
	.xword	0x38a49ceec5e6f29c
	.xword	0xdb5ba550298724ff
	.xword	0xfa09ea41a6e782a5
	.xword	0x52c1e6b55b332df3
	.xword	0xf85b1a50f608baeb
	.xword	0x542fc64579c3d8be
	.xword	0x3dd8ebad116a0b64
	.xword	0x5dcdb079b3cd6efa
	.xword	0x1433f5dc28f0ae16
	.xword	0xa1b678e7b37815ef
	.xword	0x5b58520f2bb2fed5
	.xword	0x3b5dd846fca42696
	.xword	0x8f2af537b532c885
	.xword	0x7fa3b9e49a896a61
	.xword	0x501ffb60ff1c1822
	.xword	0xa45d4e023057622c
	.xword	0xa1a18d362010bbca
	.xword	0x97812c990ced6f96
	.xword	0xe468f987ab7bacf4
	.xword	0xbe7fa5214b298c24
	.xword	0xc46f41016a387ad0
	.xword	0x3399456a538b9abd
	.xword	0x1d89d569cdf0dcab
	.xword	0x336b91378682ca17
	.xword	0x1b24ea1c7e536d7d
	.xword	0x7381b78a39027f74
	.xword	0xdf358c3fd6e6a8a4
	.xword	0x8905426dcaa31f6d
	.xword	0x084b759035eab503
	.xword	0x6321fbda4624a621
	.xword	0xe10225fe607dd74a
	.xword	0xb16b437c80a42a3a
	.xword	0xf877c29dde86bd77
	.xword	0x8eb19b269ebe2153
	.xword	0x3bfb651b89864649
	.xword	0x4f0c5bb23588e905
	.xword	0x7a2e1869f8514fb1
	.xword	0xd3f423ffe2b6b1d3
	.xword	0xa04911e8fc9a1864



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
	.xword	0xcea7598b091e02b0
	.xword	0x7a525cf68c870993
	.xword	0x7ad8ebbf407361f6
	.xword	0xb2ea91dca49f9775
	.xword	0xbde46c43ffb7dabc
	.xword	0x3bceff752de36a97
	.xword	0x74052d80c62c7f78
	.xword	0xf148ea718a08617d
	.xword	0x72a9cf97c1759d23
	.xword	0x1c9cb6127bc7d0bd
	.xword	0x5dc3e9aa739ef230
	.xword	0x6d5d04b07159e7dc
	.xword	0x0c007ae64b22de14
	.xword	0xe145e3a4289ca2fb
	.xword	0xd38a45d3bc207090
	.xword	0x802c00c93dbcdebc
	.xword	0xa4e78054428b6df8
	.xword	0x4207eda8cbec96ab
	.xword	0x19a99a3ef3411728
	.xword	0x893c46ada5e9ca18
	.xword	0x2cca3d51e9cf2563
	.xword	0x83d0ae97fd400a0b
	.xword	0x79665308713e42e9
	.xword	0xafa0ec39b4687288
	.xword	0xea71cc98b1bbc8bc
	.xword	0x1910ae79f202f77c
	.xword	0x9ec5d05b4f2a0aab
	.xword	0xb0fe0925fa0baa16
	.xword	0x00ad5e35b3bc9933
	.xword	0x7dfe7b3df4c902ee
	.xword	0x2ec929c194829593
	.xword	0x905a5f16c4f70e6a
	.xword	0x8afb6fced454a65e
	.xword	0xeca97952ae0f516b
	.xword	0xef9e91f7039582cc
	.xword	0xfa52574ef72ce602
	.xword	0xc88656bd676cfb25
	.xword	0x673f90f0f405d197
	.xword	0x6ecbe75695826570
	.xword	0x3244f75147516045
	.xword	0x653ab6b84e89454c
	.xword	0x4ce62130c3e98fd5
	.xword	0x0371078185c41d15
	.xword	0x7a77ff1982f8290e
	.xword	0xda619ae50d86f1da
	.xword	0xa4faf743ed61d2e6
	.xword	0x730f5fdd3970a260
	.xword	0xfd3e4c901540a1a6
	.xword	0xd4fc3a455b2e4f7f
	.xword	0xdf089dd495d9df23
	.xword	0xd0b57fc7d976560b
	.xword	0x60d17711b3ea8f7f
	.xword	0x0c9bc1e4c38fb21f
	.xword	0xc654e8a2e3264a19
	.xword	0x84c1e3aa0c313e63
	.xword	0x9dd71a290491c43a
	.xword	0xea7c3cbaadcaa6c0
	.xword	0x756f6c19f7dd87b7
	.xword	0x4a088c908075b32e
	.xword	0x8f8658ded480a785
	.xword	0x6230ba5fdad49b73
	.xword	0xe3a81000eddf2063
	.xword	0x813c428dade596cd
	.xword	0x0e30b7ec7e7fc742
	.xword	0x527db1a2457d9a36
	.xword	0xef9ffc07b22a329b
	.xword	0x055087dd31cd847d
	.xword	0xa8f2cdb63dc18677
	.xword	0xd5248a12b124741c
	.xword	0x421cc9eb1655e943
	.xword	0x9ca9d49520f48d0a
	.xword	0xab8d1eb719d35843
	.xword	0xfb5680439d3127ec
	.xword	0x8dc143a46ed57188
	.xword	0x999478d81105a247
	.xword	0x429eac8a6578e82d
	.xword	0xa08e1113c048828d
	.xword	0x4837e280a7a3da72
	.xword	0xebcb41c00208b716
	.xword	0x907a2d9f8a15069f
	.xword	0xb0179e04e2c720cb
	.xword	0xa6b5f26974c97f46
	.xword	0x93a23bab3c47bdf5
	.xword	0xb4a886b09da998d0
	.xword	0x948c4b13c0699d67
	.xword	0x07876944104f1119
	.xword	0x9fc045a55ab2a7e1
	.xword	0xf5d29737cd29f1f9
	.xword	0x0b4de1f4ade5ee7a
	.xword	0x82e2dcdc34025eac
	.xword	0x385545663841a8de
	.xword	0x8eddad539e1ef071
	.xword	0xf171add9822e04c5
	.xword	0x00ddc86bdfb6078e
	.xword	0xadc4aa6a244eb206
	.xword	0x51656f3170653e49
	.xword	0x84e653f2fdee1756
	.xword	0x841dcdd94f8a6285
	.xword	0x87a56b6f5b391be8
	.xword	0x2fbea3bef4580414
	.xword	0x63a6c271b7c55c59
	.xword	0x63e24b50f8695337
	.xword	0x0b8d5a595cb57f09
	.xword	0xa3659303a50e0304
	.xword	0xd24dff4b163ddb80
	.xword	0x4a69414bb6ed3364
	.xword	0xbbe11f8bb4c30a9c
	.xword	0x1baa601fd12f8e56
	.xword	0xdaa0bd11996b07e4
	.xword	0x9e6d049a0021686b
	.xword	0x7444785c61087afa
	.xword	0xa9c96f872d114c70
	.xword	0x9a105bd863dcb4af
	.xword	0x722a8b13e575fc78
	.xword	0xa96f6859566f21a8
	.xword	0x6608d9be4e912b2d
	.xword	0xf5ce7b1d48af5931
	.xword	0x2c263971f47e7e56
	.xword	0xd9d1460abe066e1d
	.xword	0xbc047b352543c15a
	.xword	0xef4dbadaaa8bb893
	.xword	0xffb858488a78c911
	.xword	0x2357cf1ea5086ba5
	.xword	0xc86d494675e9b840
	.xword	0x6c4f3ea1f4145a98
	.xword	0x43d7002d1705fa71
	.xword	0x1eae52170a6d41d6
	.xword	0xbd5959c7bbc63616
	.xword	0xe96729c5c50b3741
	.xword	0x7267cd456b166e90
	.xword	0xf1d434838099b528
	.xword	0x72b438e9106e9591
	.xword	0xb401e5e696704bd4
	.xword	0xe003b833ae461a26
	.xword	0x0ded8263f5f75956
	.xword	0x75a07023b55659dc
	.xword	0x519117a40a051737
	.xword	0xffa6c7f9c46bc690
	.xword	0x40e5bb28063ea87d
	.xword	0x62485f84d4f5537f
	.xword	0xed1846cc001fd937
	.xword	0xae0bbb9e58c5a3d4
	.xword	0xdda747454611e381
	.xword	0xb21a429184308451
	.xword	0x68f318d2b075a351
	.xword	0x9415373b0dedfac1
	.xword	0x610ee9ab36324eb0
	.xword	0xc461800feba296a8
	.xword	0x12ad9ec0ce57aa9c
	.xword	0xd63cdda9f1308ed9
	.xword	0xb90e31caf608926b
	.xword	0xead1e9f95e648478
	.xword	0xfa4643b2d5c29ae5
	.xword	0xf8c7b4114344f9e3
	.xword	0xdff0e3be5a36a6e2
	.xword	0x9a00bad4bdb12501
	.xword	0x875e2e113644a78a
	.xword	0x0369072e2159273d
	.xword	0x3874ef7e4fee5471
	.xword	0xa2c1b8ac7b28b1b2
	.xword	0x8b71a6cb50eaf92b
	.xword	0x009d1bd57d5b7b4e
	.xword	0x1328949bdc4c51e0
	.xword	0x4a9b4567e192304a
	.xword	0xd0ff701ef6502d7e
	.xword	0x761e233becec5ab5
	.xword	0x7b4d02be2dcb36a0
	.xword	0x351c5aea307298fe
	.xword	0x23beaf07f616d98e
	.xword	0x65dab9d679d10a6d
	.xword	0xeaa4a4a47796a1b0
	.xword	0x2fa0a3649984fb9c
	.xword	0x01cb53040389d578
	.xword	0x0ebf7ad1e15d95c7
	.xword	0xfbc9fedf5be704ff
	.xword	0xc36cc7a6bcb820c2
	.xword	0xef7ce0cb63dc405b
	.xword	0x425b3c6c5c913eb7
	.xword	0x932a504825c03db9
	.xword	0x5be34eb3b9f5d62a
	.xword	0x8183f04d6fc1e47e
	.xword	0x8b3a820fcc07697f
	.xword	0x22d7d44e15e24f60
	.xword	0x8a1dce5af7eba2ea
	.xword	0x82c55841dc1717d4
	.xword	0x980f5ee5c01d079d
	.xword	0x0c1addd16a372116
	.xword	0x23645216bc8ca0c5
	.xword	0xb6aa9b64d23a14b0
	.xword	0x240add96848d1a76
	.xword	0x69a88617ce379761
	.xword	0x3c5293d9c9bd7c78
	.xword	0xf054d0d04b435752
	.xword	0x968183049cd206af
	.xword	0x597c519695dc09bd
	.xword	0xc3b323a99a71dd8a
	.xword	0xcac2ee7076a16545
	.xword	0x4e248cff01f272e8
	.xword	0x298aeda48f991964
	.xword	0xb60948e1c5608737
	.xword	0xbfb551c79276e02c
	.xword	0xccae0c30e375f7eb
	.xword	0xc35056919520e514
	.xword	0x2c08e866540a16ad
	.xword	0x358718559aaa48ea
	.xword	0x877340fb0509a901
	.xword	0xddf2c1d68ffc8c67
	.xword	0x88a82319aa2758ff
	.xword	0xca0f72d41af0a22d
	.xword	0x2b20da7ae2998c67
	.xword	0x1745960df9090316
	.xword	0x37c733d20c19de81
	.xword	0xfc3f026ec7473c88
	.xword	0x23c8ddf9408c5699
	.xword	0x6351bea8d584e13a
	.xword	0xd8dfc62acada1646
	.xword	0x82894c240fe98ab1
	.xword	0x1c56c239262c9eff
	.xword	0x01c1f616913f7ec6
	.xword	0x630e17d6fcc731ef
	.xword	0x43a7b12ce1ae01a9
	.xword	0xb4b3966bf997c72f
	.xword	0x4ff58dd8d152123a
	.xword	0xfcd781c8d6020bf8
	.xword	0xde126e0c6dcc05c4
	.xword	0x54ffa44143955090
	.xword	0x5279aa051fb29a1b
	.xword	0x6122ff93f8ddca3d
	.xword	0xe0398ef2c61dc270
	.xword	0xe6365e5c738fdc00
	.xword	0xc70ea6b525985644
	.xword	0x93310410b34c78f4
	.xword	0x7ae0e1db2b807373
	.xword	0xbaf18633bfe163c1
	.xword	0xf553022969ced9c0
	.xword	0x540d51b5661c5c06
	.xword	0xc6f55a77f5e189a7
	.xword	0x8d1c58232ab51f2b
	.xword	0x06bcedfcdf8159ef
	.xword	0x42adcbf887ece735
	.xword	0xcf47bbfb0ddfdcec
	.xword	0x18ad2f9522a2d523
	.xword	0xf8a0397c96c7a4ec
	.xword	0x29364b0c42b63a23
	.xword	0xb02fa8c0c37277af
	.xword	0x7403a4dcd507ee9b
	.xword	0xfe0da620d55e5e76
	.xword	0x02de506dcbe4e513
	.xword	0xab19e43fb5d3689e
	.xword	0xab72d668993715a8
	.xword	0x90950ecacad51166
	.xword	0xfe19a9c3e8cd24c6
	.xword	0x39a0ffe4e3c71720
	.xword	0xe9c3855a19f6da14
	.xword	0xe54bfc5f87fb3fdc
	.xword	0x38bf2c880859505e



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
	.xword	0x215eb2eabba5c05e
	.xword	0xc9b1497db98d7e74
	.xword	0x15dbdab92e611089
	.xword	0xf1c23225742dce8c
	.xword	0x950b66592ba21d51
	.xword	0x0ca76d259e77e52f
	.xword	0xe6f8ac3699f95066
	.xword	0xcd4f6be9f5f95d7a
	.xword	0x22941269ac499e97
	.xword	0x8abedd2fddb70899
	.xword	0x4af285cf22acfd4b
	.xword	0xc95f06b64f2743d4
	.xword	0x2623651773fc75bf
	.xword	0xd9c40022bb67a2d3
	.xword	0x6d10d49d54df3a6a
	.xword	0x65df8d74b9a0c7ed
	.xword	0x440f7599af96bf12
	.xword	0x828fd02b89bc000a
	.xword	0x071755d8194de2ba
	.xword	0xe1c1b8a61fb977ee
	.xword	0x144c88e2acd1e692
	.xword	0xcd78b9ed0c296528
	.xword	0xe2c9f801f0d63054
	.xword	0xb9c5501163183b5e
	.xword	0x7edcd590c7c9494a
	.xword	0x6d0888779c0cd367
	.xword	0x726b87547e7c0cf1
	.xword	0x3f6349aea2d8186c
	.xword	0x2a8e846b743dbddf
	.xword	0xf1328856b7377128
	.xword	0xbd92d72f8254359d
	.xword	0xc1a975167452ebb1
	.xword	0x3bb652a9d5dcff62
	.xword	0x20648dc72a8680af
	.xword	0x1930d94e00467714
	.xword	0xe434ba90a38c51ad
	.xword	0x8412ecae2ea9f0e6
	.xword	0x60cbdc00458319ca
	.xword	0x594666c2e4461dbd
	.xword	0xeb38cedbcf914b03
	.xword	0xbb6247ec8db1d302
	.xword	0x05fa3a3183b98ab3
	.xword	0x16784889e4a334f2
	.xword	0xb9f0ce69fe586b7c
	.xword	0xd1be191300959507
	.xword	0xa8294c8141a1cc70
	.xword	0xc0fc4943ede991c2
	.xword	0x68247b84478a7fb0
	.xword	0x30dd884115134ca5
	.xword	0x06b2c3f052c669db
	.xword	0x486d42bb0634e846
	.xword	0x2e05c1d54387bd32
	.xword	0xe58e0d30e541c408
	.xword	0xa8082e692df83e96
	.xword	0xec8ee4c2743d462c
	.xword	0x522a9a40f500f773
	.xword	0x776e8f2a5dc44296
	.xword	0x02b49ba58ab69c2c
	.xword	0x12450967db872f24
	.xword	0x81efc625da036e98
	.xword	0x60b4bf086f72f516
	.xword	0xc231bc0f3c6e7cea
	.xword	0x2335e8b53760c0b1
	.xword	0x81595161fff5d991
	.xword	0x15b4933b4dfdba5b
	.xword	0xc1eb3db481c4a8a3
	.xword	0x389fdad07742b0b3
	.xword	0x2add429f8e2440dc
	.xword	0x576de61d521f203c
	.xword	0xd1be6384dab780b3
	.xword	0x3f2ebb9ee41521a9
	.xword	0xa1e3320f1cbc5a4d
	.xword	0x04bd49d8f5b6a920
	.xword	0xabc683352cb00a4c
	.xword	0xc1abcc4695852d8e
	.xword	0xede9e6fb20b13015
	.xword	0x10465dd01febbe36
	.xword	0x9a68c3e171afbdcb
	.xword	0x4fc65cae25a4cb8d
	.xword	0x7181700a252686ad
	.xword	0x8130ea4704222a2e
	.xword	0x1c38a44380ff57a1
	.xword	0x8a41964a703ef491
	.xword	0xd8f7392b070434ca
	.xword	0x6a29497bf6d9b821
	.xword	0x91035c1e5ec54f8e
	.xword	0xda454bf595597e9f
	.xword	0x72c184b301f4380b
	.xword	0x046fad1f6049b588
	.xword	0xb7169434d39dab83
	.xword	0xbb0aef170e1f4e70
	.xword	0xdf7174f4e4797e11
	.xword	0x25bb6a1f6e312792
	.xword	0x2c287f952bf1ee64
	.xword	0x0448d70e77ba986c
	.xword	0xf7de67e0eb7df5de
	.xword	0x77f0abefa1b2caad
	.xword	0x1ae6a33c30acfdb0
	.xword	0xa27994ed0d6a7c4e
	.xword	0x13614614fc020603
	.xword	0x20c2923f3e9bb35f
	.xword	0x75239dc8aa27f431
	.xword	0xe3e99e3ab0a1eefc
	.xword	0x5c9761892518c4b1
	.xword	0x88e1b12f3f8c0375
	.xword	0xcd208848033411bb
	.xword	0x4489909525030210
	.xword	0x4c1e550d876683f0
	.xword	0xa49526c63d6b3248
	.xword	0x6b942c9bb8afa835
	.xword	0x5d8f6288de307727
	.xword	0x7dd2fbb196df7cea
	.xword	0xdb3188b3b1e58739
	.xword	0xb1d9a7a21c9ba91f
	.xword	0x4d63b45fe9c9d2be
	.xword	0x224d2efa6e4a53f9
	.xword	0x629aeaf6160f499f
	.xword	0x99a44e14759af4f3
	.xword	0x500eb935d0d808bd
	.xword	0x0bf223746ef15e88
	.xword	0x94d2938232237ad7
	.xword	0xcf0b1be68d7a63c8
	.xword	0x70208a001f027aa0
	.xword	0x3f148a89bd8a78f6
	.xword	0xd63234343596b872
	.xword	0x69291dbfaa797240
	.xword	0xfb46e4762bca2151
	.xword	0x1bb6e870fba2cc3c
	.xword	0x16a3e083d73ed39c
	.xword	0xfbed5e5f90311bee
	.xword	0x9207ac75a581d80c
	.xword	0xd814ad23db5f5eda
	.xword	0xf852bc48d448a939
	.xword	0x97cd6bf784ad9fbb
	.xword	0x4588f40fec8a4a58
	.xword	0x47a55ab1e83dc6b0
	.xword	0xa0de8a0df35f1cec
	.xword	0xf8c34ff1858cabeb
	.xword	0x91ad4ba80c2ee66f
	.xword	0x365eb0723bc880fa
	.xword	0xb15a3df74266cb3d
	.xword	0xa103b373d7201963
	.xword	0xfc57974b7ec1840c
	.xword	0x5f771ba1d8e6a7cf
	.xword	0x0133602e81e9c45f
	.xword	0xb77613525012b40b
	.xword	0x8fc13ab50eae1f40
	.xword	0xaf4b4c4cf5e42693
	.xword	0x755dd353f55619f4
	.xword	0xe8514a6ab1692546
	.xword	0xd09b6dee81b6d776
	.xword	0x86c860082e9c4def
	.xword	0x8d9771b2a9d8b345
	.xword	0x513a5ececaabcbc3
	.xword	0x82881436aca07de4
	.xword	0xd13cf1ff8fe36c07
	.xword	0xb998320672aa67ff
	.xword	0xaf3742c1749ddbaa
	.xword	0x2bce2e1aafc7b255
	.xword	0xb0e43d72564e1353
	.xword	0x3aa204c2c3dcb6fd
	.xword	0x9d64bfda6a7ea242
	.xword	0x752e3e2018c5c003
	.xword	0x033105818578a631
	.xword	0xf029219eca6059b9
	.xword	0xf2ecf0bae0d7da4f
	.xword	0x417941e347a66194
	.xword	0x12539da6c59bc83a
	.xword	0x2e7fec35f19a5b79
	.xword	0xc97039e101a612df
	.xword	0xa841d97e92698f06
	.xword	0x0e9939ccb1f86d5c
	.xword	0xb148690e6ce0a41f
	.xword	0xf5f350d678eefa8b
	.xword	0xe5f7157356cb2db4
	.xword	0x2a06952427885f57
	.xword	0x1b5c277e356f5f86
	.xword	0xbae9b1b7af6ecde8
	.xword	0xe834d223b1be749b
	.xword	0xa2c92a7f42f7c772
	.xword	0x736d70db19026b8c
	.xword	0x7498facf0a71453c
	.xword	0x667cbc19ad129b37
	.xword	0x23bc90d978390118
	.xword	0xedd3810ab9782a21
	.xword	0xb5717754e4ea1786
	.xword	0xef0601ef90054dd1
	.xword	0x785ab4d69ceb5065
	.xword	0xb7d7d5891a188fb3
	.xword	0x507ad254d5db2400
	.xword	0xc5359577a4605f4d
	.xword	0x62eeef51def01c0b
	.xword	0xa285ff4a95edd5cc
	.xword	0x445b39fa864be144
	.xword	0x17e1b4373b0f3d27
	.xword	0xece6138044750340
	.xword	0x9b0e9af2be8b99dd
	.xword	0x36fa7ad4d703f876
	.xword	0x3342e6b46e535c79
	.xword	0xad750b92f5a1a7bc
	.xword	0x25d5a5cb99d14776
	.xword	0x0a9c190ba2567be3
	.xword	0xf92d8060a4654180
	.xword	0xeb799ff9a6379a90
	.xword	0x4989a1035705343b
	.xword	0x114cd09d99f6b75b
	.xword	0xc723d5e0453994c8
	.xword	0x6ca718dffd146ac5
	.xword	0x36380502c55d987b
	.xword	0x59b5676c1593904a
	.xword	0x398c0d1ac4fee60a
	.xword	0x31d5bfc6c89d3428
	.xword	0xba746c7a9dae1254
	.xword	0x3da7664d07efff87
	.xword	0xec70c7cb9fa775db
	.xword	0xcbfe8482db5fbe2e
	.xword	0x0700f50ffb364fc7
	.xword	0xe9098fee4f8e5e66
	.xword	0x5670f23c0cf56805
	.xword	0x0a1208ea2783c2a9
	.xword	0x98c16cf3b4a88e52
	.xword	0x66287985f4f4dc87
	.xword	0xbcf41d8bc84bd7c9
	.xword	0x0d59fb8e05570b11
	.xword	0x4b9815543a045b54
	.xword	0x17fa672623b2efcf
	.xword	0x556def7a6c74cb84
	.xword	0xf36bf98d4dbe55f6
	.xword	0xd6fd873cd5dae6d9
	.xword	0x178b06135b6d9769
	.xword	0x432573f141d897d1
	.xword	0xc8508d42c587da26
	.xword	0xa78b8494801bd595
	.xword	0x9265b9ed9dffd040
	.xword	0x750bfc9a6990cde4
	.xword	0x4562a3a7fbd6268e
	.xword	0x50fa944ab0a9d17a
	.xword	0x87a7a5689e8ba7d1
	.xword	0x7d7afda185eb94cd
	.xword	0xe267d2f1951035c6
	.xword	0xb00f665c31244473
	.xword	0x4f35ebf965821104
	.xword	0xb9a1347a74e6446a
	.xword	0xa65c33cc01d61c27
	.xword	0xe1b06f228a7c6008
	.xword	0x8d3c54f41feaa312
	.xword	0xc86f3041f2e03aee
	.xword	0x233d122b4d6e221e
	.xword	0xa63a772f06b43352
	.xword	0xb5cb4490e1d16d4a
	.xword	0xb4f74cc38fecd83a
	.xword	0x2f0a32d9f1495914
	.xword	0xca2142115466684a
	.xword	0xc32e473fc2e42add
	.xword	0x44f02d864a56ac03
	.xword	0x6046ad242185619f



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
	.xword	0xbc4516a9739cc7af
	.xword	0xb5f0ea2f52d78f37
	.xword	0xc588c3c7e6113773
	.xword	0x7adb04ecf00c359a
	.xword	0x928b7c67aac11ef7
	.xword	0xdf5d0b25f1e1eeeb
	.xword	0x99a612d96c7e3389
	.xword	0xf02843cee5fd1e16
	.xword	0x255357ff6aff58ba
	.xword	0xf82e5c49f536cabb
	.xword	0x307c9f36aa5c4496
	.xword	0x2e78c99b3893a0e4
	.xword	0x216d02acaef8e55c
	.xword	0x0654e437ce807130
	.xword	0xa8a16e129a243a06
	.xword	0x6f25afa1bedc0e65
	.xword	0x900bf9dc0307af5b
	.xword	0x12c40aee8c579289
	.xword	0xd79c1bdb50241086
	.xword	0x78bd85ab36d557c1
	.xword	0x76bc60151db7e75d
	.xword	0x0c734ad6d5ac55ad
	.xword	0x1c184f1cd7521a8c
	.xword	0x4c7cd02d5e196bb2
	.xword	0x54fe7f23cc42ab14
	.xword	0xc55d38f8b6ee7873
	.xword	0xadc8a99c33bc284d
	.xword	0x6230da60a5141d34
	.xword	0xbb77ad2f91659d59
	.xword	0x90f8fea3cde6864c
	.xword	0x20d656da8a154d43
	.xword	0x1dedef879f0b339d
	.xword	0x6a64c8672d3e7fec
	.xword	0xe300fd3dbb971211
	.xword	0xf92b900374216a9e
	.xword	0x610fcbcc4f4becae
	.xword	0x31cffcf5060d0c3c
	.xword	0x3ecefb38d7aca70a
	.xword	0x1d86c7ade6203ee0
	.xword	0xc1aff1fc91e4a55b
	.xword	0x55aea3fcfc50bde4
	.xword	0x59da89393fcad499
	.xword	0x2d91f7d989898d27
	.xword	0xd736fb818bb20ff0
	.xword	0xdd3437357a1bf8e7
	.xword	0x2dbde82bedcf738c
	.xword	0x781f5dca034e6953
	.xword	0xb263a390ca51be4c
	.xword	0xfd860df5cb3e2464
	.xword	0x417ef9001bd618b1
	.xword	0x0f66b92a66a5dc8a
	.xword	0x6ec1acbcbc5adf2c
	.xword	0x52684113d193c61b
	.xword	0x354076895737563b
	.xword	0x7cd6f9894d874013
	.xword	0x2e6d6b0ac7ad201c
	.xword	0x7ec4a762a6b94128
	.xword	0x82cd85eda2d98605
	.xword	0x0efb1903aea9fe99
	.xword	0x23f0c73abed7c48e
	.xword	0x5de2650788877cfb
	.xword	0xff45fa007286da1e
	.xword	0xdc63b4bf70849390
	.xword	0xe77f12916922ed5e
	.xword	0x0ab5f8a5c06ad019
	.xword	0xff91da6b80f867bc
	.xword	0x4518523d55200813
	.xword	0x3680edd04aa44ff8
	.xword	0x801ea70c58ef812e
	.xword	0xb0fb5909ea0a77fd
	.xword	0x2b5b12b09926e20a
	.xword	0xc70dd60a711a1395
	.xword	0xae9137357cf86151
	.xword	0xddcbc36ee8f21df6
	.xword	0x56e8ad85ba298416
	.xword	0xa977a712b4858ccd
	.xword	0xe809b7f4e4ed5d99
	.xword	0x969e99a52e16b298
	.xword	0xded5fdb2bc1dbcd6
	.xword	0x951391549071b0df
	.xword	0x019928fee4f9bf76
	.xword	0xe295e2d830c989bf
	.xword	0xd84637c1f91c0184
	.xword	0x1ea25f5b9a051d07
	.xword	0x37efa7784e5c97e6
	.xword	0xb8577b41aed90e71
	.xword	0x57f7bf457af2adec
	.xword	0x6a444e144c5e74b4
	.xword	0xa953d93fc68203f1
	.xword	0xae71b79a42d50458
	.xword	0xf7bf8e6a7568aa26
	.xword	0xa3147511b13b6442
	.xword	0xb3f7113b4dd3ed6a
	.xword	0x6d4e6bb03757af12
	.xword	0xb363a37cd82803b2
	.xword	0x68fa38541215087a
	.xword	0xe34906a31d69f837
	.xword	0xff0e8ae301bddf56
	.xword	0xe6b6ef7e34a3e619
	.xword	0xf56d0137f8130531
	.xword	0xafcb3d3fd1b97c6d
	.xword	0x17ca894fe4b6aa6d
	.xword	0x25d4c1c23c56ea64
	.xword	0x03d1b01078037aa5
	.xword	0x10f6bfc921ae87a6
	.xword	0x59c866bc98746d12
	.xword	0x0d5d2fef913e1c7b
	.xword	0xaea65390f70bf7c8
	.xword	0x6157f509b43baf71
	.xword	0xd55a8fe5b48dfff0
	.xword	0xfea0832698247b38
	.xword	0x7bc9a5dd98f87db0
	.xword	0x53119110d6beef15
	.xword	0x87605a3e6c77f30f
	.xword	0xd5451e3c59e690b5
	.xword	0xf1f6be68deacc517
	.xword	0x2219189d03e7ac18
	.xword	0xd5440fd6ec6af9e1
	.xword	0x26e394a67f8dd81c
	.xword	0xa130f5a248fc8301
	.xword	0x8e20ac506ea4950a
	.xword	0xe982c027aafda586
	.xword	0xfc7469abc2419c21
	.xword	0xaa6eff16cc21773b
	.xword	0xebd85caed89219bd
	.xword	0xcd6919e36f57e38b
	.xword	0xdb26e887e0a7ef20
	.xword	0x6b034f294e8395c3
	.xword	0xd606af89247526ca
	.xword	0x228cd7aacafbb743
	.xword	0x01bd3b171722a46f
	.xword	0xdd7aed0a7ffa0330
	.xword	0x1d7d9c51e21c0062
	.xword	0x417c0fd0401369ee
	.xword	0x816a0967bc881245
	.xword	0x53bcfa3c265b758d
	.xword	0xc44d4130ed44b28a
	.xword	0x313c9bac337bca25
	.xword	0x1d6712433c2ffee7
	.xword	0xce640c6c8219c8e7
	.xword	0x5e68135146421107
	.xword	0x51ab9e86ac9daf80
	.xword	0xa795dbcb6de6669a
	.xword	0x4adc7aaa1e661e8f
	.xword	0x1443e3fb2ee20a50
	.xword	0x2ed0cf7e9b079fca
	.xword	0xe490295c7cb0de3a
	.xword	0x4e28004026b62878
	.xword	0xd85a8ca07a111b94
	.xword	0xe4a8a9c334e264b3
	.xword	0xe7e52c2a78b82633
	.xword	0xfa9c7e0fe0d7eaf6
	.xword	0xcb0f29a4f8e8bb0c
	.xword	0x29ef6821651d6ab8
	.xword	0xfa56ec9a9cfa955c
	.xword	0x17caae61b5bbbf3f
	.xword	0x78b90b86b67bb2d7
	.xword	0x5e371318a6096f04
	.xword	0xff993291a26fede7
	.xword	0x01bbb2ee7b80d0ec
	.xword	0x73f5ace195d74ee7
	.xword	0xdce1f0ce96ce49f5
	.xword	0x6d0d9323c4708b28
	.xword	0xa9e6ca3dd2417879
	.xword	0xc400c82cd542542f
	.xword	0x5d5f745df6d75b7d
	.xword	0x854447e2e83aba5c
	.xword	0x5041474c8d788d03
	.xword	0x42cc6fcccc57c51e
	.xword	0x6c98f9d4534233cb
	.xword	0xfca493416e70f4ec
	.xword	0xfe2228e025f947c0
	.xword	0x2596968044995871
	.xword	0x2cdf434b6c9315e2
	.xword	0x2dc03d9725b79504
	.xword	0x88f21765ea61aad0
	.xword	0x3e20df587449b9c4
	.xword	0x3dfa6ee7de4ce475
	.xword	0xed5465f4b2649f86
	.xword	0xf6343a44d6ed4e91
	.xword	0x3b26396d6f89c158
	.xword	0x14ec2b0ee70d3790
	.xword	0x40e9f391e48d6081
	.xword	0x7fcf3a054af264d4
	.xword	0xc963d41d815f324d
	.xword	0xf7d227728af3b016
	.xword	0x0a9138c6999be990
	.xword	0xe61b0817329f32ba
	.xword	0x115e16bdca441533
	.xword	0xb699b59fc32a9712
	.xword	0x08e114ac6bb648e5
	.xword	0x5009b191ccb64ebf
	.xword	0x7f4378eb7f332e0d
	.xword	0x3b087ccaae06413d
	.xword	0x9ec5f2d5043d7957
	.xword	0xa5c56e8d9fe1c80c
	.xword	0x8669b456b3198fbf
	.xword	0x627dc5e27a68581c
	.xword	0x63fe7be2018163ed
	.xword	0x4405127351bcd91d
	.xword	0x451d4ab438337f41
	.xword	0x4289bc2b2fbb9917
	.xword	0x400db3b44ebd748d
	.xword	0x80b3a2b6e7783ae3
	.xword	0xf4645a787ca14a03
	.xword	0xa22abbe65a149745
	.xword	0x7486a80be26a6641
	.xword	0x032c188f5641ca50
	.xword	0x62a84e40fcecbbc2
	.xword	0x160a43f41ad9ef58
	.xword	0x30dca93523c7f00c
	.xword	0x62b08f0b186fcf20
	.xword	0x3abfca64d9117427
	.xword	0x5fb2a3ec99d3af78
	.xword	0xc4f0241963859f0e
	.xword	0xad9de6d28e2fd70d
	.xword	0x58da8f7807bff75d
	.xword	0x71f3054a52a02edd
	.xword	0x038fbcffcc1789e6
	.xword	0xcfdbbaae358e718d
	.xword	0xf4af7247fa93007c
	.xword	0xd3d3553c6276ecf0
	.xword	0x578ba9ef0306c85c
	.xword	0x851b728e965f6db0
	.xword	0xafbe3724505c0e95
	.xword	0x5c03ca73eecbb4cb
	.xword	0xa6464ccf72b5f709
	.xword	0x7442580b7d92fbfa
	.xword	0xe73c5c47eb5c6b39
	.xword	0xfa46fbf5d46e4ae5
	.xword	0xc9daf16ac86573ff
	.xword	0xaeb0cc8bed773a85
	.xword	0x5c53e918b5fc2bdc
	.xword	0xbba6a605d9fbb589
	.xword	0x13e41897b2acfb51
	.xword	0x8b32b4ea59298422
	.xword	0x0a98c46d95c00793
	.xword	0x9db8be74a839cf0f
	.xword	0x500c20135fd8d7bc
	.xword	0x6e65417f633e7696
	.xword	0xb244e500df954675
	.xword	0xe6260fc506b73513
	.xword	0xe03381fc65adf34c
	.xword	0x5c78b1dd4e500b4a
	.xword	0xc3fb33389c2136b2
	.xword	0xda27b227950989f3
	.xword	0xd5b6322251b28e00
	.xword	0x173432391325ed14
	.xword	0xc4080ace2b63d5cf
	.xword	0x1ed371a264829887
	.xword	0x16be1f0a33e03cff
	.xword	0xa5e87098f7f7ef23
	.xword	0x98b5fc1037a6fdfa
	.xword	0x0e97a384b371b7f3
	.xword	0x1031931f68f12b75
	.xword	0xab836c59de40beb4



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
	.xword	0x1d9bcef7346d2e55
	.xword	0xc0c9476bd1260bdc
	.xword	0xebb006453d54d035
	.xword	0x0419d6f81f70d4ee
	.xword	0xf9220e4726209c5d
	.xword	0x80c9ff87a3caa95a
	.xword	0xd22b295039e1ef30
	.xword	0x8d6e4ff62a413a75
	.xword	0x6e2044838be62305
	.xword	0x20da748b6570d6cc
	.xword	0xd9ceb218b3300325
	.xword	0x4120a76f8ac91556
	.xword	0xf0361b78495135c3
	.xword	0xfa13b1b24ae1b4fe
	.xword	0x82e773c42ba41686
	.xword	0xea1e0a7521faba24
	.xword	0x77fa5c5bf9887804
	.xword	0xb7cc05230984cb83
	.xword	0xa5e2d03335925d71
	.xword	0xaa0fc620a786bcf2
	.xword	0x8e8ca48f4ceb9807
	.xword	0x7527df009d6ed4c7
	.xword	0xd9c1594c644afedd
	.xword	0x7d6044a83051f498
	.xword	0xb29dff76c30abdc9
	.xword	0x84655359b6dde6f3
	.xword	0xd14cfca1a00e4762
	.xword	0x568154678a57cb22
	.xword	0xc5fceb0ef1bc88e6
	.xword	0xc6e8714434fd0670
	.xword	0xdd238e2101e29326
	.xword	0x601ab541fe4eb903
	.xword	0x5d2e048bcb62d5a4
	.xword	0x8e497231a1490329
	.xword	0xda3ac6f33a206c9f
	.xword	0x2b23d49fccb8ccb6
	.xword	0x568798b9f3ab56c9
	.xword	0x4089153202a547d5
	.xword	0x9fb8e79970b71a5f
	.xword	0xfb49a72c86a7c027
	.xword	0x6a9a11caf3bbf4c0
	.xword	0xb58629dfe973a263
	.xword	0x3a9a20a3ade01c19
	.xword	0xc6b052eb443aa2e7
	.xword	0x3888520b3ef80d48
	.xword	0x3fc68d3ef8df2cf2
	.xword	0x98dbea68c66243de
	.xword	0xc0d3a50c9da7ef8f
	.xword	0x634ba985a3f5e949
	.xword	0x2f6348b2a45aaa2e
	.xword	0x351f7cd7db09af82
	.xword	0x861d2cf55e2f57cf
	.xword	0x58d951c1105687ff
	.xword	0x0de6d3282f377c0e
	.xword	0xaa3f796f71d97aba
	.xword	0x18d31369e38908e5
	.xword	0xb1ea45953c4c51b6
	.xword	0xa2161cc2b5907bf3
	.xword	0xff5af9fa373142cd
	.xword	0x4a55278732ae05b6
	.xword	0x42970729639c4a2d
	.xword	0xb8650e607fac3353
	.xword	0x1916cc7d7d26f6c6
	.xword	0xbfbd0aa62b07a2c6
	.xword	0xe30a7e1546769af0
	.xword	0x8f58b491c9c5156d
	.xword	0xace21b6cc4325e8f
	.xword	0xd8e820eb341f1eb1
	.xword	0xa8aa3ee3cb9e4501
	.xword	0xc7cb0875215d6cd3
	.xword	0xac323c7798fc35c7
	.xword	0x9f65a707b77c8da4
	.xword	0x19a5c565f14faffb
	.xword	0xcfd4be9a46c3df46
	.xword	0xba7fcb6267062665
	.xword	0x71587705dd8080c2
	.xword	0x3757323a95d5ee99
	.xword	0xe030d98f2fdad455
	.xword	0x24bdefd0affb9182
	.xword	0x8a2b789297d2f80b
	.xword	0xf4f45062140a992a
	.xword	0xcd2b171c25865ba0
	.xword	0xf92606fe4ea65b4f
	.xword	0x3d9aec657c7d03cc
	.xword	0x1d9004c493c846ac
	.xword	0xf994f30faccaf18d
	.xword	0xcfa92793ead50829
	.xword	0xd09a68e0d951a4ab
	.xword	0xb2b15e58a499b082
	.xword	0xa2be10af8f544cf8
	.xword	0x4edde5edbddf1ee2
	.xword	0xe40b01d1a3bd4983
	.xword	0xb7264f14208da038
	.xword	0xa29d9a877521c019
	.xword	0xb3ed890eddb037b3
	.xword	0x172b85aa7236cc62
	.xword	0xc2ce5f21fa5e1e77
	.xword	0x35dac98a1ae758e8
	.xword	0x0640b8a1b7afb151
	.xword	0x7e32ae9602f5574c
	.xword	0xae918524beca06aa
	.xword	0x3b0fb729f2e931dd
	.xword	0xb1c3d860e104fdea
	.xword	0x430cb5e997085d22
	.xword	0x9c196bd10d551a82
	.xword	0x9097560a0608e597
	.xword	0xba8beff826ca9e11
	.xword	0xc9877d9763a6c36f
	.xword	0x1d4a85a3631a48de
	.xword	0x6d8b04501ec90708
	.xword	0xd5b6665209a2cc7f
	.xword	0x1bbb5f25f93f5462
	.xword	0x28dd2c72ccaa08c0
	.xword	0xb75c11e706a069b9
	.xword	0x33c5b345c47e77a2
	.xword	0x637cab46cd275a81
	.xword	0x02b9d6b2fd3a176b
	.xword	0xfd146d1d68a2321f
	.xword	0xa22ef05e7bf1f0af
	.xword	0x76accd24c914323f
	.xword	0x610c06bb0930b7a6
	.xword	0x9182ef9ed04f5ae7
	.xword	0x19ad98625863d8ce
	.xword	0xd6442d6704b090e0
	.xword	0xc85fb3f50a5b7e48
	.xword	0x091c9bc683750386
	.xword	0x7f7a4360b6fe4ea8
	.xword	0x4dccab59e23b7861
	.xword	0x12cd0dd4b58a0250
	.xword	0xf9752b8e81b340c0
	.xword	0x7568197b623229bd
	.xword	0x42c04e3f12ee38fb
	.xword	0x50fbde2df617b19c
	.xword	0x0ee756572e201419
	.xword	0x54e57765b153872f
	.xword	0x322e804fe129687a
	.xword	0x02f8d24a0eaa0383
	.xword	0x84a650e828572b55
	.xword	0x63b8dcdb679d57f4
	.xword	0xeb1e7a3624f7b6fe
	.xword	0xc8a7172768a06c50
	.xword	0x2b096fe1b3c65a4e
	.xword	0x9ead7cd4e0e49356
	.xword	0x4a94ef2bdc2cb86f
	.xword	0x0abe11c90cb8d4e3
	.xword	0xa67f1e522d72f1c9
	.xword	0x5745b25a2dba4972
	.xword	0x7442e0853ab2b8cb
	.xword	0xd2d879ca8489e390
	.xword	0xbc4f1f303627acd0
	.xword	0xb3490cdabb323129
	.xword	0x59e4980bb047371e
	.xword	0x237fe100bda5a7c1
	.xword	0x9a8d5903bce56f65
	.xword	0xb1c8b8d105fa689e
	.xword	0x6ce9475ba29b4fb2
	.xword	0x8f415fdfa5221a97
	.xword	0x79ed9f629132859e
	.xword	0x41246cb99b9d6b6c
	.xword	0xfc6f9153c8412977
	.xword	0x73d9c8a087272573
	.xword	0xed601faa6c3f99fa
	.xword	0x4d7ded221e639d5a
	.xword	0x80571548c31febb4
	.xword	0x9af2ef5e9c1c61cc
	.xword	0xf4eece2d288c3e94
	.xword	0xb61ff13166fdc28e
	.xword	0xaf89f26dba742553
	.xword	0x94fd7cc5dfca3efb
	.xword	0xbe499d191a79fefd
	.xword	0xc2ccc2bf808f76f5
	.xword	0xabf51a25a071adfd
	.xword	0x4354d22a2a6848c4
	.xword	0x9a5d63d1200b6497
	.xword	0x5fc4e68ff82da169
	.xword	0xda954295fb025e50
	.xword	0x4f97f69ff4e71f75
	.xword	0xe4153344624d336f
	.xword	0x54bd558abbf8024b
	.xword	0x279928a236df3d58
	.xword	0xe2d27a41469c5548
	.xword	0x9eda722b15d4f753
	.xword	0x1b1f527c2df81313
	.xword	0xa414ed76745c08cb
	.xword	0x812b6be72a76ea3c
	.xword	0x7b3af840e42c4ea9
	.xword	0x85b0805b851862df
	.xword	0x1d17fd1423b02c52
	.xword	0x3f8cd147d9af2d25
	.xword	0xc3cd4957f13bef69
	.xword	0xb7157cd4b0fe24f7
	.xword	0x1a762c1a9531a1a6
	.xword	0x70c99c38c98202dd
	.xword	0x39bbda79ad7522ed
	.xword	0xcdc819ec8e890aa0
	.xword	0x39e69cb5c1b931aa
	.xword	0x8750e26d3ba8e9a2
	.xword	0xc939f91f87b941a6
	.xword	0xc21b5be639c86a36
	.xword	0xdcfb324664597129
	.xword	0x2ebda8234bcbd6be
	.xword	0xbb44bbceba92e76d
	.xword	0x0d1172a2cfc7df62
	.xword	0xcbd64c8c89da128e
	.xword	0x8a308a7f7354f04d
	.xword	0x2c64e592db54b1b8
	.xword	0xf6ef61515ac2e4be
	.xword	0x6709c1128165b2d8
	.xword	0x76c857802d331f1f
	.xword	0x80ad49beef4fbe2a
	.xword	0xc6cc526b0178e2eb
	.xword	0xda03af1041a1e85b
	.xword	0x5e5c6e026baff13c
	.xword	0x08977f94cf9c479e
	.xword	0xe9a8971da7fde230
	.xword	0xc42f5d584f325145
	.xword	0x3515b3d7834ffc9f
	.xword	0x84f17b453c97b0fa
	.xword	0xe61078d1e9e3f921
	.xword	0xb1b3bdff416ba0e4
	.xword	0x98dac7890c507be9
	.xword	0xd61c55507ba0a9e0
	.xword	0xec33576ba74a8a86
	.xword	0x9890a98319b6d5e9
	.xword	0xcf4b2238a375e954
	.xword	0x73931ead9380c852
	.xword	0xe67f946b865e30a7
	.xword	0x3859da2532df240d
	.xword	0x530e2a5924bd877c
	.xword	0xedb92b8b93a4cc1a
	.xword	0x1742172770fd4f92
	.xword	0x8c6d67ebc9052f00
	.xword	0x35f59cf1bb713938
	.xword	0xbf80873aca56449c
	.xword	0xeb17dc1235dda444
	.xword	0x3c3d84463eeb0c7a
	.xword	0xec9bffd1977e44f6
	.xword	0x1daa1117973fff48
	.xword	0xb9b48e401989af70
	.xword	0x3b4eaa28c6bac002
	.xword	0x4d71e255573c67f8
	.xword	0x7d7b8dd2a1a62814
	.xword	0x2505193e90f604d0
	.xword	0x7f071c0eb7c949c6
	.xword	0x275b38799bcf5915
	.xword	0x929205e5a463d4f5
	.xword	0xb9e99d1e8dfaddbc
	.xword	0xebce08cbe55ec59d
	.xword	0x17405742a9682bf7
	.xword	0x9be64534c2de4352
	.xword	0xaa3a511386daae14
	.xword	0x8944c640c5b9c0bd
	.xword	0xfa945d2d35a11ce8
	.xword	0x7fb4b535bb175dbc
	.xword	0xc1812e4c262a5eb3
	.xword	0x0a4b62306d7a9032



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
	.xword	0xb2dd9cdcbe17d88f
	.xword	0x3b4506a48379fa99
	.xword	0xe74d5227745db3b9
	.xword	0xee2bb75e7423b7f0
	.xword	0x014db0ca1787dc91
	.xword	0x2e5afe6529a735e8
	.xword	0x2cb0cbfb614d2f85
	.xword	0x82f4bd4d2be232bb
	.xword	0x0c0fb5a939acfeab
	.xword	0x6ee2cd30ac8ef0a5
	.xword	0x68c42a76b722be14
	.xword	0x3087f316c6f66215
	.xword	0x184175391a898b6c
	.xword	0x866e4cda42ad5cff
	.xword	0x037c0a152be2d4ff
	.xword	0x57bf943821054097
	.xword	0xd1c80f1f63d7b688
	.xword	0x528ddb8958f68d3a
	.xword	0x932f39dcf32cc5ff
	.xword	0xcfeb5ea69f61648f
	.xword	0x12f04c3699ccc318
	.xword	0xfbe2ca3fd5a7d389
	.xword	0xc41cd389ad44bfc0
	.xword	0x3b88388b3bdba9c5
	.xword	0x2416aad9ad348eb3
	.xword	0xffe32f392cbe8fb3
	.xword	0x51665cde2d808783
	.xword	0x9753f307a0047864
	.xword	0x881687be05112226
	.xword	0x2161460d5d6051e1
	.xword	0x14cd08b8b854f853
	.xword	0x4cd77d16429e5fd4
	.xword	0xeda69dc8831719dc
	.xword	0xc0addfcc74acccaf
	.xword	0x4a51f6dc8e793b4d
	.xword	0x967735fdf242c4be
	.xword	0x5f7c610502825878
	.xword	0xf9d4e41594fcae88
	.xword	0xcc71b45125cb611d
	.xword	0x6bb16f5a696290c4
	.xword	0x3b2e7100c3466273
	.xword	0x7e746192601ace77
	.xword	0x656db03f2153105c
	.xword	0x05b62b4a9d35faf1
	.xword	0x57265f81de1c2d24
	.xword	0x9ed901c684a7a61b
	.xword	0x57b2c8fb6c7eea35
	.xword	0x678bd2f84461543c
	.xword	0xba90cdf5e93a2eeb
	.xword	0x0b69c4fad6b9c036
	.xword	0xd1c8cdafcd1c2e79
	.xword	0x5135fde0c556625a
	.xword	0x77078a536cc427f1
	.xword	0x4eb6de5adb49a5af
	.xword	0x23d057d0730637a9
	.xword	0x81cf02ee693c5136
	.xword	0x0b202e1ffcbe9837
	.xword	0xdef6af9f221c3a21
	.xword	0x46bc0023d450c061
	.xword	0xfa9611366aa4530d
	.xword	0x7a8c78c4cd5cf81f
	.xword	0xa63726fba2eee236
	.xword	0xed93e163e51d258a
	.xword	0x2c45690b51075ea9
	.xword	0xe7bbc18f12f652ad
	.xword	0x586b79820ac4583c
	.xword	0x91607245a315f426
	.xword	0x4964d25a331b6ed3
	.xword	0x2bfb29aa33fe8283
	.xword	0x45708f26abd76944
	.xword	0x6e66561179da646e
	.xword	0xf0ca634e5ca911fb
	.xword	0x589b5a3aac3d8d7b
	.xword	0x228b2f7e8cdfe6c2
	.xword	0x588a839a8bf7d78e
	.xword	0x9327046d070ecc64
	.xword	0x54a2d6520f89a185
	.xword	0x9c2bf5ffeca28e0c
	.xword	0x3eeaf583be7f4982
	.xword	0x5e04d71ebe3b8dc0
	.xword	0x7184c78d25ad163c
	.xword	0x4e32f1fb6a9e5731
	.xword	0x49a5440b3271bcb9
	.xword	0xa6e80e0a81e00544
	.xword	0x62bf9f9341ae83bb
	.xword	0x0115ad40ea38b408
	.xword	0xf02cfa74ebcda34b
	.xword	0xd5265546c740244b
	.xword	0x664c5c6f3cb3c251
	.xword	0x53cf7c6d4c6761e4
	.xword	0x2fd0f804f12295ec
	.xword	0x9ecd24dcd1fe235e
	.xword	0x579f333c7557c706
	.xword	0xa26b15d4893d2125
	.xword	0x43c464e17f00385b
	.xword	0xce63d35f5d6ebafa
	.xword	0xba0afdba67cea827
	.xword	0x1b799365d6f76479
	.xword	0x4f917074876196af
	.xword	0x4fa6ac178cfeb3c8
	.xword	0xa737e2adce902544
	.xword	0xd38ecf7e704be1d8
	.xword	0x5fd7eb43b1632ab5
	.xword	0xd215d8b2101f8042
	.xword	0xaa297cdee577a0b0
	.xword	0x66088fa224bdcbea
	.xword	0x1bbaa8cea5e29cc4
	.xword	0x9eee0f683a88e63e
	.xword	0x218b020f166aee28
	.xword	0xc9e3a7c9f8cb189f
	.xword	0x9a5b25284174c520
	.xword	0x9704673412251bdc
	.xword	0xf9577f471de41b95
	.xword	0x105830febfdf7d7e
	.xword	0xd5bdfe76b585279b
	.xword	0x49dff677c9bc9dc5
	.xword	0x46193fbe6056bebe
	.xword	0xf1ab14312411d82b
	.xword	0xd17a43088edefd6a
	.xword	0x3f77d7c472820963
	.xword	0x8e1c3d7e6cae4512
	.xword	0x07d2aa96fc9c1303
	.xword	0x144eefa44401d320
	.xword	0x0d36b152ec18c25c
	.xword	0x9639bc3e8f57c398
	.xword	0x1677f521d75a910c
	.xword	0x6a894d4c9cf9ad74
	.xword	0x3ca93ed56cc9a802
	.xword	0xd0597194dce7bc17
	.xword	0x2d31c91f3f5077c5
	.xword	0x525e4f0d0178e943
	.xword	0x260544329b5e1aec
	.xword	0x99f27211a978b207
	.xword	0x39d62994dbd27299
	.xword	0x252bec3f20db4314
	.xword	0x6bf1c1f96338bd83
	.xword	0x77fca0c09707be46
	.xword	0x2bd9c5c4c95a2bb8
	.xword	0xacd48ed28601aa3d
	.xword	0x0ba08e93fbeb42f5
	.xword	0x53bf9a4b8ae38788
	.xword	0x1b22e0f56664d5cd
	.xword	0x61876171c5639a85
	.xword	0xa2ad85ca7d9ade39
	.xword	0x2f80f93252bc6c56
	.xword	0x4400a9bf313d22c3
	.xword	0x10f9a019003aa451
	.xword	0x4fd55977ba922b6d
	.xword	0x9be596f959525127
	.xword	0xc0e312d2f3179c6d
	.xword	0x30c32378dd0a5130
	.xword	0xdf4ddadd2fa0d1d0
	.xword	0xd079cd7c14d558ff
	.xword	0x10c67512befa94fd
	.xword	0x44b674daeb419667
	.xword	0x848952a800679c91
	.xword	0x72e56fa5b239b5a3
	.xword	0x43f66945ebab28a2
	.xword	0xd955bc8e9ee0dba9
	.xword	0x9714e824a0e6be6f
	.xword	0x4fc21be7210509cf
	.xword	0x84fe50472da249fa
	.xword	0x44a3399aaa6a026b
	.xword	0xbb3eccceabab8c2e
	.xword	0xf4b22ccb0d80e290
	.xword	0x4efa874e1b421562
	.xword	0xd22a460493370411
	.xword	0x3fe0369b5e11e8d8
	.xword	0x702d25da6ad83c6c
	.xword	0x5036f0eac4a99178
	.xword	0x6c868a1fc878a495
	.xword	0xcbb05f98dbf45823
	.xword	0x25c30dcc7e149237
	.xword	0x8b1641870180c99c
	.xword	0xf5b4a053ad34a099
	.xword	0x75a6fc962460bdc4
	.xword	0x8eec898452f6a7fc
	.xword	0xe17dca502be18641
	.xword	0xbf46eadbc27ec369
	.xword	0xc4f45e1523990c88
	.xword	0x6c00739efefaed85
	.xword	0x3a454ef92add502e
	.xword	0xaee3fd574bd6390f
	.xword	0x7706ccc02dc0723b
	.xword	0xd563d9fd68cf2877
	.xword	0x1cdab73ce8e7e0d2
	.xword	0x424335e7b6f73e7e
	.xword	0xe7b9b1850c067940
	.xword	0x6cc13996cf5164fd
	.xword	0x3c6c4138a5ed3a69
	.xword	0x4a1631a100492a15
	.xword	0xc7ffe2c19d329980
	.xword	0x43747ce67708b727
	.xword	0xfeb779e7ce474955
	.xword	0xbc4734f51e9f62b3
	.xword	0xa65ec2eeaf925794
	.xword	0xa9c8121108b8a13b
	.xword	0x08667ad9f5f666a8
	.xword	0x9e6ec63e1083b7ba
	.xword	0xf371b619d678b0bd
	.xword	0x047cbd015eb77e48
	.xword	0x7e3afbc9a41b53ab
	.xword	0x434d945b34dd1554
	.xword	0x06701cb2bc6ed919
	.xword	0x2eb93ce4224d4213
	.xword	0xb0ec0a73bf59506c
	.xword	0x0fef909ce9cd2f5b
	.xword	0xbc2ef43c968e3619
	.xword	0xa2edaecbde6e8b8f
	.xword	0x11c0c1409161c6d4
	.xword	0x506b27abbb6dd0bc
	.xword	0x8f2acd4a57aa08b9
	.xword	0xc63aec9b686e7f55
	.xword	0x4339ad310cbfab16
	.xword	0xf21f4f66de8d3e69
	.xword	0x4b7794fa804abcf6
	.xword	0x6e210744a21f698b
	.xword	0xe19993c70858afd7
	.xword	0x8a0775113742197b
	.xword	0x0d8d25ad69f1cbd4
	.xword	0x975b5094d89eac2f
	.xword	0x6744e2052dd524be
	.xword	0x6c5a7e13d993b680
	.xword	0x2f4211d55534b057
	.xword	0xa48a4091fba184d9
	.xword	0x55b57c515543baf1
	.xword	0x8834828a817fabe6
	.xword	0x1b8171a289cbd572
	.xword	0x2a885b3d571e3d60
	.xword	0xc5804a29d2cc8e2b
	.xword	0x2b1f87eafe7eecf3
	.xword	0x04b83ebdbf5f32e9
	.xword	0x72d11d7c3f8e39a7
	.xword	0x9b049f37f83f9ac2
	.xword	0xd8d840677766a7f5
	.xword	0x0d8babb08921db35
	.xword	0xc4bc6558b38df5a2
	.xword	0xdfa067301e6b608c
	.xword	0x0563aa52490e25a9
	.xword	0x66add8df0cc87226
	.xword	0x8e29e3f81cd46a0b
	.xword	0x25793095d324a581
	.xword	0x394b954e3c368287
	.xword	0x17770e4f823c9e6d
	.xword	0x028af6eb5c4348a3
	.xword	0x81aeeb0df5605136
	.xword	0xd51eef0099c4165a
	.xword	0xb29d97ef1cf2432a
	.xword	0x5d014f14d7db94bc
	.xword	0xb006c8162cdf67a7
	.xword	0x6191ea3eebf4a4a1
	.xword	0x92c9fd61df681135
	.xword	0xffd53125d6f50a4b
	.xword	0xed883441ec14ede3
	.xword	0x03445ef715a061b7
	.xword	0x9a3d23060138c326



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
	.xword	0x8c06dbe1d3aeee23
	.xword	0x0ed4e440696f63d1
	.xword	0x4f93cb136f7f83ae
	.xword	0x9a440bfe3301ce7b
	.xword	0xbb29257d90b9f0cf
	.xword	0x5b1cef70c0ab741b
	.xword	0xbe12b56d7a38d604
	.xword	0xf555609c71975d84
	.xword	0x2f226b4cf8935287
	.xword	0xc40e1bb54d6e2a96
	.xword	0xd59002c8c189078c
	.xword	0x488420e01ad54f70
	.xword	0xbe013f708436981e
	.xword	0x4a9953ceca5c045d
	.xword	0x1ac71a59543a2932
	.xword	0x67730980f457fdac
	.xword	0x77a41b9a2802ff4a
	.xword	0xb0993dd7061b6dbe
	.xword	0xd867468ccfba337f
	.xword	0xe4e171e219ce114f
	.xword	0x3f8a270409dd33c4
	.xword	0x102d5acd531df97a
	.xword	0x157d225d2af4d35a
	.xword	0xef4fe03ce35aba73
	.xword	0x165bffffd910b48f
	.xword	0xc629bf2ca8978d64
	.xword	0x12513bef7209a3db
	.xword	0xf20097e3ffb71928
	.xword	0x47df957d392cecd4
	.xword	0xadea150d1abe6a23
	.xword	0x5bd7c7ae24cf4ba2
	.xword	0x99341b0630d00606
	.xword	0x3e3ce49f08bf9883
	.xword	0x6f7395af9fa330a1
	.xword	0xd04311de94dd4351
	.xword	0xa225af52a194dc59
	.xword	0x4da4116ae147650d
	.xword	0x574161de88c17e18
	.xword	0xc730f44646cd87ff
	.xword	0xa7aa2f41ae3ad2a2
	.xword	0x0a1d71396b2a793a
	.xword	0x2d50bdddfd539edc
	.xword	0x699c03642ec58f36
	.xword	0xa02615b14e18d94f
	.xword	0xdea09bdbb7917b4d
	.xword	0xe98ebf94a71c374f
	.xword	0xc11e1ece2f79b7c6
	.xword	0x22fe2d54b62cbc75
	.xword	0x326e6f553d3e082b
	.xword	0x38d42cebddd74327
	.xword	0x136d925efbaf7d41
	.xword	0xc8364dbc2888e2d6
	.xword	0xc126ae61a955e6f2
	.xword	0x7b6cd904155bf68b
	.xword	0xcb94a241cda70a11
	.xword	0xae7fb9f8c3303291
	.xword	0xc7c65a1feaccc4b2
	.xword	0x541a6c471141f29a
	.xword	0x4eff9a77054d53c0
	.xword	0xa25732aa306000a1
	.xword	0xa2052882df0971ad
	.xword	0x10d5c23eaea36b00
	.xword	0x38b59634cf9b1856
	.xword	0x5ac27e69adb3553f
	.xword	0x9fa5e9649524cace
	.xword	0x5e4a77d5b6ed6998
	.xword	0x4e3b322c737b2f6d
	.xword	0x2e8299c7fe0f4c32
	.xword	0xf0349d0568bf7de7
	.xword	0xaccdc7cbc7ae6b21
	.xword	0x7832d559dc70b600
	.xword	0x6a8d5d1cea9a24b7
	.xword	0x30dea10df2221383
	.xword	0x47e5d4f8feed3f49
	.xword	0xeeac215612ff3eff
	.xword	0x4c5baffff149770b
	.xword	0x7f5dd3cba2df687e
	.xword	0xbfefe906c7ebd6fd
	.xword	0x67c75e9a1c550bc2
	.xword	0x6bf4c5ed9afc8a63
	.xword	0x45d0b757b81bf6ec
	.xword	0xc2a2557158aeee2c
	.xword	0x670fa5a9408db1d7
	.xword	0xb21d6803b70b1c65
	.xword	0x7dafefd2ae4ca82f
	.xword	0x755d7008f332993d
	.xword	0xe0502c4acb62c1f3
	.xword	0x83698e11dd9f8031
	.xword	0xbb603f3ac449bcc2
	.xword	0x6435c74623b41111
	.xword	0xb119f5d435be1da0
	.xword	0x174ecd9ba2ada8bc
	.xword	0xb2d7a82e60d73050
	.xword	0xbec8716cd68b7efc
	.xword	0x59011e190f135f28
	.xword	0xe2940fb076933c8b
	.xword	0xf56ac46db39e1789
	.xword	0x833581b3dcc3ff81
	.xword	0xf51f985f14e77125
	.xword	0xa83e64fcf8431bfa
	.xword	0x233ff26a9f009e64
	.xword	0xc1b403dab3fe0cef
	.xword	0xb31386a86ac8c023
	.xword	0x465f751f81a98b51
	.xword	0x5300ccf9ed55dba3
	.xword	0x87e6afa834aafe64
	.xword	0xf61a82509ae82b52
	.xword	0x36b0fc2ace6d79b4
	.xword	0x38847e9958730ccf
	.xword	0x079d6a00ae22ab4c
	.xword	0x4e96ef1ef4a8c4cb
	.xword	0x36675ecf1d9b1e99
	.xword	0x70e01a333f570e63
	.xword	0xf6d7fff246bdb927
	.xword	0x88b96a301d0bda0f
	.xword	0x0297a19b36205f1f
	.xword	0xb5b96c7355af1d82
	.xword	0x2669cb177d8240af
	.xword	0x3742edff54d8b729
	.xword	0x215b4da5029bf2b1
	.xword	0x2e9b4e072ec181ed
	.xword	0x4bbd84ff2cb734dc
	.xword	0x48fee79d991122c1
	.xword	0x791cb6ab3fde711b
	.xword	0x789c9271b634c809
	.xword	0x6c0acd0a483672de
	.xword	0x8936393d7626bd1e
	.xword	0xec2adcafb3938ae3
	.xword	0xbb3dbaa53b5c1f53
	.xword	0x35aba8e2a821c4a5
	.xword	0xb4c86299daf5da0e
	.xword	0x82c7b6dc9e90900b
	.xword	0x9698d9e0b1fe6698
	.xword	0xa463ec8f6aeecbe6
	.xword	0xb13abc7377a5d659
	.xword	0xfd9121e749cd5e3e
	.xword	0xad554b0a0751f79a
	.xword	0xe3f454296af24de7
	.xword	0xc7f2ff0b64ef8578
	.xword	0xea3fd84854dd0050
	.xword	0xa84c767057f25dab
	.xword	0x7cc245737d3f7c4a
	.xword	0xbc106ef78742c5ea
	.xword	0x977dcc049ae6ca10
	.xword	0xf152dc8888744f9c
	.xword	0xf625350a1a280a85
	.xword	0x2b540151f76c3f29
	.xword	0xdeb94addb6bd05fb
	.xword	0x7dd6327d622dc734
	.xword	0x09d45bc9e56b59b2
	.xword	0x8b22d16b59aa990b
	.xword	0xc8de22db8edc81f4
	.xword	0xa1dd73f379a53443
	.xword	0xaccd06798b98b14d
	.xword	0x14fbebad96c2589d
	.xword	0x9b4b78863e1aaa62
	.xword	0x1ba9dc505713553d
	.xword	0x4519da8c22210b2d
	.xword	0x58e4ad4d8faf15d7
	.xword	0x4d805743d5d66c72
	.xword	0x07633efcef9a8e9d
	.xword	0x40fc3cdd18d5d3a2
	.xword	0x0c7a5f61b0897d3f
	.xword	0x1a3aa9ea2ce971b5
	.xword	0xb6862ee2fc54292c
	.xword	0x22ecfa6efa29cd25
	.xword	0x0558c23de2345b29
	.xword	0xc8b3a9160d982f11
	.xword	0x1d44b1db77a169d2
	.xword	0xf16288828de16f28
	.xword	0x4a84a833a7cf19c0
	.xword	0x76bd76e06df8cbff
	.xword	0xa00d7c99d7878c51
	.xword	0x86ac95ce647f581b
	.xword	0xba9f99cb8687ebf6
	.xword	0xfe244f3a35c92989
	.xword	0xe66bab548f01500f
	.xword	0xcee83972430101d7
	.xword	0xaf1827d4aa29503c
	.xword	0x3e658f08ae93e5ae
	.xword	0xccb955a727cdd802
	.xword	0x3943ba46f9d0c3fb
	.xword	0x7e68254dc0db9a53
	.xword	0x7f10caf1931956e8
	.xword	0xb5fe956ad7783546
	.xword	0xddb371172318cd23
	.xword	0x49f513f8810a9c14
	.xword	0xb690ddf62f909221
	.xword	0xf4d6bb77fa1965dd
	.xword	0x7bc38791520b7e85
	.xword	0xe1977147d0622e89
	.xword	0xe7fe0f3bb156619e
	.xword	0xb79d8f6960b2da01
	.xword	0x840fa787b0bc626e
	.xword	0x2318c5e1033e23d2
	.xword	0xf42457127cc1553b
	.xword	0x576274a49141fb26
	.xword	0x63c919ebc3322906
	.xword	0x264e016b41cf74c5
	.xword	0x91e25d6439fd1b4c
	.xword	0x9f29825a704f1eea
	.xword	0x1ec316918cda3b4f
	.xword	0x99125acaa6210b87
	.xword	0xa0e813f27f235954
	.xword	0x8c8e4f404aed51f4
	.xword	0x3e54641544e3d6c4
	.xword	0x030f2966eaa2c791
	.xword	0xc4ea963ccec5ac31
	.xword	0xf6bb7ee563a8d7e0
	.xword	0x573922e5d62c35e3
	.xword	0xdd6a2a3c2c4b8532
	.xword	0x88f09420252cc666
	.xword	0x096100d516d945f6
	.xword	0x8773e451ad5bf883
	.xword	0xd1de61c1c233bd24
	.xword	0x3c9251719164a964
	.xword	0x8aa8329fa4f1106e
	.xword	0xbe45af6e041a9706
	.xword	0x33061da80eb14795
	.xword	0xb9a9dab73c4996c1
	.xword	0x0f929fd4a1ffb4e0
	.xword	0xdc2139e6b21c22bc
	.xword	0x6b721449ae436380
	.xword	0x4358356b25f9ce36
	.xword	0x8cc1893ae356c871
	.xword	0x1564ec1e471ceee6
	.xword	0xa0f3e1dda19d4d43
	.xword	0x4fa523b456289819
	.xword	0xd9e1d01f9271241e
	.xword	0xd94ed4a8579f9e99
	.xword	0xaf925dec6970a225
	.xword	0x00341d50dbb3c76e
	.xword	0x5fdaf782a907c480
	.xword	0xadbf1ab3a409a9c8
	.xword	0xbac043a1f0b4bc27
	.xword	0x113b62475cc0f9b5
	.xword	0x0e56b2733f2d785d
	.xword	0xe4e6d9ebdafa0319
	.xword	0x6d8ee2021aa50451
	.xword	0x37498645a051ef2a
	.xword	0x6f78ca5b11447309
	.xword	0xad300bbb2fd79929
	.xword	0x16f5d992713c8b62
	.xword	0x5a049c18d29c3b58
	.xword	0x5fef0e2311496f24
	.xword	0xe5720480fc0d5adc
	.xword	0x6423841a696cb2b7
	.xword	0xb52b69481dbf6a03
	.xword	0x0edf1b26db585004
	.xword	0xcc185c45443d6642
	.xword	0x3741ed7635ff00b8
	.xword	0x5765bc8b551ed9c6
	.xword	0x5075e5faea1c0413
	.xword	0x721074b89fa6b8c0
	.xword	0x31a3aef5fef3c62c
	.xword	0x16d72c20c393ab06



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
	.xword	0xd7487da2e947046d
	.xword	0xa081dd03f40a1aae
	.xword	0xb2e6672cf6552253
	.xword	0x3535d06111e57ef1
	.xword	0x7857988f1371036d
	.xword	0x91263379920757e2
	.xword	0x6fef6e71b3acc8c2
	.xword	0xe418d99d9eb77650
	.xword	0x753527479fb660e5
	.xword	0xead9073c23311c2f
	.xword	0xed7216b49582623c
	.xword	0x8d23a393f733872e
	.xword	0x71c4f19b6c27884d
	.xword	0xa748d343277ac173
	.xword	0x5917e432482e9a85
	.xword	0xbb860f8e0ed5b559
	.xword	0x1c3f58cdd20d1b86
	.xword	0x10b773dc73c39790
	.xword	0xbf09a8e1e5061ddf
	.xword	0xbe3a5180769ea6c2
	.xword	0x42035698b15424ba
	.xword	0xa54cfcf923ac1625
	.xword	0x7cd854b47c146e09
	.xword	0x3e31e3a1f192a0c3
	.xword	0x437de8ba0b0fd5e3
	.xword	0x3db9251126c5a847
	.xword	0x240e6ad2ba24f30b
	.xword	0xe40c0cd2dd6e9050
	.xword	0x6303f370b471c715
	.xword	0x9963e94ddb83b0f3
	.xword	0x4953079f618e7b05
	.xword	0x021083a159f7e13b
	.xword	0x6a24cce3e3fa0c4e
	.xword	0x61422065626344d0
	.xword	0xf73cb1069ac735fd
	.xword	0x6018d82a8401a111
	.xword	0x5a96d03c8af6a130
	.xword	0x074dd7128ad30d44
	.xword	0x918f10d6d438a8f1
	.xword	0x629b4800a655f581
	.xword	0x49a22bdccdd34b0e
	.xword	0xcb3a530c195cb988
	.xword	0x2ab721261b11bb9f
	.xword	0x74298776377120c5
	.xword	0x2d6e36f235ffb16d
	.xword	0x14b2f6ecb94f2929
	.xword	0xd34b5226eff59e8c
	.xword	0xd64cc3a06451b75c
	.xword	0x3a05ca6f667634d5
	.xword	0xc1368b7afc9eb2c1
	.xword	0xef702ca5cf778b84
	.xword	0x368dd3545e297f99
	.xword	0x67ffa9fccf7f938c
	.xword	0x3b51f2f6134f0bb1
	.xword	0xe574b1ae1977fa8d
	.xword	0xfebde8bbfc8ae2b1
	.xword	0x7b08e618aa5a4d0d
	.xword	0xe3c0efa9446f07ac
	.xword	0xfe554260db46ceca
	.xword	0x3c975c2f07aea66b
	.xword	0xba53488e9b08deca
	.xword	0xb18b2a1ba58bf461
	.xword	0x163bb9549acffb39
	.xword	0xf003263dfe8180b4
	.xword	0xd728078557131919
	.xword	0x8c59eb30f88995d6
	.xword	0x0848954e7ad87845
	.xword	0xe07aba5fe5f0bee8
	.xword	0xe3d6a055d0b0fd6e
	.xword	0x60069c019506d658
	.xword	0x7b68bf655cfe1bc9
	.xword	0xb667f65c8764d0f1
	.xword	0x45e499db102e29f8
	.xword	0x19c3eb7eaffca703
	.xword	0x10edacf08cc9a62f
	.xword	0x1784c022fe0e8c60
	.xword	0xec7649e207b8d905
	.xword	0x514691a623ec7ac7
	.xword	0x7d5d700e4852d3d0
	.xword	0xa8990c40929c4883
	.xword	0x31e303c0001dabb2
	.xword	0x9377274cf08b7b38
	.xword	0x9136405fde29b25a
	.xword	0x5d4d1060db7b214c
	.xword	0x59ccbd52c651a898
	.xword	0x2fe5e1c57cf750d7
	.xword	0x491918a6eb4e92e0
	.xword	0xc6cc9dc22a9722f9
	.xword	0xcec12990cf266cb3
	.xword	0x9c42cd7e4f25d3bf
	.xword	0x4214e8fd455724eb
	.xword	0x568fbce6fac30a04
	.xword	0x06eebb29d38b26ea
	.xword	0xb0dc068204a11dff
	.xword	0x83ad5bce4607b458
	.xword	0xa2233822393589f2
	.xword	0xdc2fe3af1e53b8e5
	.xword	0xd9521aba5eea520d
	.xword	0xee14dcd979b9408f
	.xword	0xa0c3b5f34f27ff78
	.xword	0xf1de99f5fc792a8a
	.xword	0x89aeb2c894a94998
	.xword	0x28caabe505a92d23
	.xword	0x83ec13703039e00e
	.xword	0x3634fafb14f19814
	.xword	0xd6c9d99f55e50da7
	.xword	0xc52ca0e7ff0d2ec6
	.xword	0x11e4e1f8983d54c4
	.xword	0xcc6493abd8bbf5e1
	.xword	0xf2dbde2b1687efab
	.xword	0x20040b045f05aa43
	.xword	0x03be8aa2df030c18
	.xword	0xfaaf63400d4a7bd4
	.xword	0xed031c1a2d798349
	.xword	0x37888980747e0d58
	.xword	0x5d954df714c8d649
	.xword	0x30b4a19d049201d3
	.xword	0x31c465712bc5053d
	.xword	0x04deffa523226cd1
	.xword	0x11fe8b01763d256d
	.xword	0x2899cdda8937d837
	.xword	0x1e4e43be081f06ad
	.xword	0x47004c5d580e23a5
	.xword	0x84425c44623b02b0
	.xword	0xcfcc2506547218fd
	.xword	0x2de39a8b4bd0d078
	.xword	0xe39812d355de8c3d
	.xword	0x017817b17e3b369b
	.xword	0x30ae31941c33a88c
	.xword	0x9c4020b3e4020e01
	.xword	0x771d4948a2151394
	.xword	0xd0274914ba1d8727
	.xword	0x2a7d508c596eb4f9
	.xword	0x5f28a26941092811
	.xword	0xfd8c917c20c24c8d
	.xword	0xf724b4d2ad2f9c13
	.xword	0x55d1b6fe248a23bc
	.xword	0xcdac072f33c4320c
	.xword	0x320e70abfa718a3e
	.xword	0xec800c201d395530
	.xword	0xfe4f5fb875f6afa0
	.xword	0x8f701489afa8e88c
	.xword	0x836d1b0119675c7b
	.xword	0xf9fdaf40b4df548f
	.xword	0x9f6f91dbf8a54895
	.xword	0x6b6770a047b3b014
	.xword	0xe49a708d140536a1
	.xword	0xcf91f9a76e9de106
	.xword	0x026606b345789175
	.xword	0x178880c791bd3a67
	.xword	0xd5b9f3a0c6f4089c
	.xword	0xb5d575df4f136258
	.xword	0xd19d9bcc15660679
	.xword	0x4e97db9ac792f1f5
	.xword	0xe795ff4dd11159b8
	.xword	0x81550eb2c3fb5da0
	.xword	0x0d23ca83d0cc1e77
	.xword	0x77c2c1fb15d56318
	.xword	0x8aeb19436f1c46d8
	.xword	0x778a2f716a832ad7
	.xword	0xb182663eba77a1d6
	.xword	0x13bd1d4bd4345adc
	.xword	0x5116169e1e38fb30
	.xword	0x4b490a8d993c1e2f
	.xword	0xbc4792a1b6170396
	.xword	0x6aad39062b8eebf5
	.xword	0x6ce83b8ec8c19e85
	.xword	0x07684712e9fc203c
	.xword	0xdf356c6dfc3b3cda
	.xword	0xfb2b0240785249cf
	.xword	0x5604d663101473d7
	.xword	0xd0075f43f712a804
	.xword	0x7e647624ffb11fdf
	.xword	0x875e4bf18038b9c3
	.xword	0x9c3fcc1864b844cf
	.xword	0xcb96de839a17d133
	.xword	0x00b6923a8855a0e4
	.xword	0x6b3f8608311da1fa
	.xword	0x3cdfd1138fdef8f5
	.xword	0xcfa401277ab04997
	.xword	0x53baf81d922cb6c9
	.xword	0x59ca024c67c64111
	.xword	0x90e4ddd61b38ee03
	.xword	0xc8e941c299bdfd5b
	.xword	0xcd5bb34e6d1d6a04
	.xword	0x0b162ef34bbc9ee6
	.xword	0x4f3c04987bd6b3b9
	.xword	0x44c9a1da1ec9367a
	.xword	0xc579ea643aded1e7
	.xword	0x162dcb6a47d83cec
	.xword	0x50340542039db723
	.xword	0x3fc9d7fa21867263
	.xword	0xd3ebaeb126c4c638
	.xword	0x71bd6d6b378436b7
	.xword	0x11c9752889427377
	.xword	0x214c38cd5b8aa843
	.xword	0x68dfc13d092e7b33
	.xword	0xfc3e37bbed74a2c8
	.xword	0xa047baba503bdcc6
	.xword	0xa87baa32453b5a10
	.xword	0xc24d04bd9607bde4
	.xword	0xbf5456df6a784445
	.xword	0x8eba0e92a5e95b78
	.xword	0xab0fb67797577dde
	.xword	0x5cac788bdb3a7acc
	.xword	0x6111777dadb1d92a
	.xword	0xa5231271a22fa723
	.xword	0x14d46dd4e6cb7b28
	.xword	0x52da7cbab03f55c9
	.xword	0xd4a42b79330ce699
	.xword	0x9a8e3a42391e875b
	.xword	0xe07c109477583349
	.xword	0x2b14ad97d1bc33ec
	.xword	0xa517f7e3ae2fc72f
	.xword	0x1863366c1334fbbf
	.xword	0x4b3744e01da67e91
	.xword	0xc3f947362a6a4cf5
	.xword	0xf2459968d6bf325d
	.xword	0xa25472ff64884aec
	.xword	0x1b941bdf72705ece
	.xword	0x61059898b30a7ca6
	.xword	0x5270e5f47410600c
	.xword	0xb1c0aba05fdb082c
	.xword	0xd51faa4d52418636
	.xword	0x95151e69dea8ab27
	.xword	0x2ca3ce884f251e5f
	.xword	0x030a2d45be3be4c4
	.xword	0xb7cd37aa2f9398a5
	.xword	0x93b48d66f95476e8
	.xword	0x8af7e506503846e6
	.xword	0xe3d4dbb86cd44b89
	.xword	0xf284e206d0c0b74c
	.xword	0x683d26a2790f6e87
	.xword	0xec2e61afa79b86fa
	.xword	0x0ade6f6f7af96445
	.xword	0x38d53b69aa489bc2
	.xword	0x7a0d395bf45c1e69
	.xword	0x985df5e114c3bf23
	.xword	0x0e53650a76494ccb
	.xword	0x94816affce268aa9
	.xword	0xedd8efacd1997760
	.xword	0xebde21d9e3fd11c5
	.xword	0xe521784cc8f97707
	.xword	0x2e954254bdb9544a
	.xword	0x0525a3aeab503f5d
	.xword	0x0d40423765dbff23
	.xword	0xc953cbf02a940f02
	.xword	0x7ec418e20aee68ef
	.xword	0x19c90a2251f73408
	.xword	0xcd1b05e1b4c82d55
	.xword	0xf0e52389c21c27f7
	.xword	0x8809af59341016dd
	.xword	0xd6ca0cbc138ec79e
	.xword	0xac311ea1a6231a40
	.xword	0xe0c4dfc98c9a84b2
	.xword	0x821ac90e866a2348



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
	.xword	0x3938731316d4a055
	.xword	0xd07c4aef3c4c136f
	.xword	0x9bb7b23bc73f4462
	.xword	0xf90e592eeaa52c72
	.xword	0xa1c12c6adbf63b28
	.xword	0x1ead3731d2a1e5bb
	.xword	0xb3a81557e4d3af5b
	.xword	0x05edaf5e6daac93e
	.xword	0x944e7c39da7617d0
	.xword	0x1e7660d4eae4ec65
	.xword	0xfe48d7f167720426
	.xword	0x7b2667997a8fb4ba
	.xword	0xa3a9f108fae6cf54
	.xword	0x19abbe0a7befd7d1
	.xword	0x3936849627e1dd68
	.xword	0xf435d29007515810
	.xword	0x1fb7d58f9e4ca6cc
	.xword	0x646ef5732657ca0a
	.xword	0xdf3f7db398b16810
	.xword	0x93c1f50bd3c1144a
	.xword	0x64aeb58001a947d2
	.xword	0x010255eb6693c20f
	.xword	0x87174dfc77992116
	.xword	0xaa21f5f72509c58e
	.xword	0x9f2253f2d8e5dd1c
	.xword	0xc43f1c928c496f08
	.xword	0x969ce94020ef65f3
	.xword	0xceaeaff61ed27fd3
	.xword	0xde7a76fab3be20f8
	.xword	0xa8db5a92e2225df3
	.xword	0xf89ff1d811ef0b72
	.xword	0xb563957f2f7b636e
	.xword	0x38bf67838fce4b61
	.xword	0x665f87023a1534c7
	.xword	0xd73db552fb0c57d5
	.xword	0xe67f89e9c8776c21
	.xword	0x82028f5e25cc0819
	.xword	0x37d5433db7e96386
	.xword	0x53d88377e29232ac
	.xword	0xeac2402b7417c06f
	.xword	0x919610fb98f4c88b
	.xword	0x757d2fda93d6ec80
	.xword	0xf4b6a257f3255f5b
	.xword	0xad7079d1dc606f3a
	.xword	0x1fc682ca0e31e142
	.xword	0xd74f528a2b36ee22
	.xword	0xc00ea5bbfafadbc0
	.xword	0x68b7f65759c3b562
	.xword	0x182fe2648adc6276
	.xword	0xd3b2987bb56646ab
	.xword	0xf8fd3ebc4ad95a28
	.xword	0x623f1b21197f6475
	.xword	0x361a10ac40f0469a
	.xword	0xdaceae36abe12902
	.xword	0xc33ef3b03065e701
	.xword	0xd547f56f0e918a38
	.xword	0x181441d14649c58f
	.xword	0x5048992bf7d51381
	.xword	0xd0598bb2336c6b54
	.xword	0x7badc60aabf1e105
	.xword	0x46a352e32e01de69
	.xword	0xf0576849bc12b537
	.xword	0xddc18fa5bb1bda85
	.xword	0x1df710ce7ae98741
	.xword	0xac9b3202c5fd32ae
	.xword	0x5118f65057513e40
	.xword	0x5de27b0007adb092
	.xword	0xa7789cbf1aa6ec8e
	.xword	0x6dd8f55496eb2351
	.xword	0x285d95a60462a47b
	.xword	0x5a64b38cdd311aa9
	.xword	0xbe2abb9d71474c89
	.xword	0x68c0590afc4d81e8
	.xword	0x9eb2086e907b5087
	.xword	0xd530b1a1ae3c792c
	.xword	0x019bd8bef76b2021
	.xword	0x768b55743f58e6c8
	.xword	0x9469fdbc7778487f
	.xword	0x170a5b9dceb1bc52
	.xword	0x9833ee7d4bfba11c
	.xword	0x6b6085bf15b69112
	.xword	0x27f35e352ceafcbb
	.xword	0xaea3f71105fbc03b
	.xword	0x7ddb9a8f11e31bd4
	.xword	0xec435e9e9fd468dc
	.xword	0x8f25587bfbb969be
	.xword	0xaf87e0ad9dba8502
	.xword	0x3c1dc97f42ea20d2
	.xword	0xb937a693ef774f97
	.xword	0x31a398c7c90e378f
	.xword	0xf11e0cbaebf3eef5
	.xword	0xb11eb30680d1f051
	.xword	0xddb8cddc4bff140f
	.xword	0x3d310825e57c3d5e
	.xword	0xf3c00628c471c01d
	.xword	0x0baccf12d26b7d7a
	.xword	0x652fe0f835c2273c
	.xword	0x71775cf9b96ef07c
	.xword	0x09a6f5d75aacdcd6
	.xword	0x6d80ccb40244f7c9
	.xword	0xdf82339769ac84a4
	.xword	0x5dcee30e81ddab10
	.xword	0x053f1a0e5b962ab1
	.xword	0xacd408fa6d733d31
	.xword	0xc54ce9941697f5d6
	.xword	0x241fd76f7b9d0f15
	.xword	0xc97586e20604482e
	.xword	0x28358bad6809778c
	.xword	0xd3ca5ff4aec8a39d
	.xword	0x546dd2cdc7105a64
	.xword	0x0f84b30012db8658
	.xword	0x14c4db5b079f7104
	.xword	0xc12c468ac1ec0380
	.xword	0xeec21e17966695dc
	.xword	0xa24d0273615b6787
	.xword	0xe0f96af11992f561
	.xword	0xe98ff600908dc562
	.xword	0x502607ff6516e037
	.xword	0x69f7fbc1f9f8115a
	.xword	0x539e36349012f549
	.xword	0x275885410bafd26c
	.xword	0x5dca5ed330fddb78
	.xword	0xe12bbd0c5503bcbc
	.xword	0x78badb4ae25cbebe
	.xword	0xfff612178bdb55b4
	.xword	0xda7c56b31eced11d
	.xword	0x050d9c8ca31c363a
	.xword	0xbf36add19de2e281
	.xword	0x8508303ea69e2ad8
	.xword	0x850a387dbaf2a84e
	.xword	0x45f8e09180d61ca2
	.xword	0x6d1f07b2512f7f40
	.xword	0x795498c2794f6419
	.xword	0x96e51abfccff58c2
	.xword	0xa7500cb89497e825
	.xword	0x9126947f227f6b04
	.xword	0x4668024161d365e1
	.xword	0x2f3d9f47245b4643
	.xword	0x8fe27371b963494f
	.xword	0xa8edf51b02eed870
	.xword	0xabb72d042779f8d2
	.xword	0x68879b8ebf0c4575
	.xword	0xe1563d716d1673e6
	.xword	0x0f38c487be09404f
	.xword	0x2930619f54369e80
	.xword	0xe8e94e1764d52f86
	.xword	0x4a0795a51c53e7cf
	.xword	0x85dc0e57ab090c12
	.xword	0xa1619b308de72441
	.xword	0xc99620f30d553083
	.xword	0xbf9c73a6180e76f8
	.xword	0x39119d260b890101
	.xword	0x965918aa9b0bb1d8
	.xword	0xd59cf17e33c5e162
	.xword	0xeb062cf378f5e87e
	.xword	0xe59bb3ca14b0af4f
	.xword	0x2368cc58ca94c360
	.xword	0xdeb93495f39f1a82
	.xword	0x6f1c4c372a4505f5
	.xword	0x6679421bc617d35a
	.xword	0x559adc840e33974e
	.xword	0x4449cd303079ed29
	.xword	0x5e8e9b8e0c70e69f
	.xword	0x8efb4e03d6f0d3a8
	.xword	0x82dbc60e45f850f1
	.xword	0xfb422909884d38f5
	.xword	0x61b6ece07fd9d4c1
	.xword	0xc8cb66f8a8da786c
	.xword	0x46ddab95b8698f7f
	.xword	0x4ea9fd80c7d762b8
	.xword	0x8f3752e76f6076c3
	.xword	0xe53328b4e50fd1db
	.xword	0x1491c6fa0fb968e2
	.xword	0x7204c049bf7523ea
	.xword	0x484a4dbe025199a6
	.xword	0x8975aca9a78e070a
	.xword	0x46325d743e9da0e9
	.xword	0x45a537fec7ac5a23
	.xword	0xf6721b35effabb5b
	.xword	0xfa5ac178df0e0924
	.xword	0x4d4e6c3ade7c3607
	.xword	0x94fe7506b7d9c111
	.xword	0x009a23b92fc31ad5
	.xword	0xfb7d0651cbaa028b
	.xword	0x22b5afec6b6eb5c8
	.xword	0x95933a0a8e258799
	.xword	0xcf45e39431619711
	.xword	0xb6e5e65b6e246fb9
	.xword	0xd196514c9f91daa6
	.xword	0xb1972a6bc8df8a50
	.xword	0x2c543227a0a69e59
	.xword	0xd1ea3bab961674fb
	.xword	0xa3e70202d70ec87a
	.xword	0x36e0db4983f3a96c
	.xword	0x79579b6ffbbeb9e7
	.xword	0xe413ad4e8de0cb69
	.xword	0xfe1684fee4df378e
	.xword	0xa4680da70ec9d8cc
	.xword	0xa70d6d6461e23cb3
	.xword	0x26ed34d41cd3fd51
	.xword	0xb342eca6d26ac728
	.xword	0x514687a9c89cf384
	.xword	0xdc57e6e0b2780646
	.xword	0x25fc731ee6aaf6dd
	.xword	0xd249e28d1da0cd1c
	.xword	0x67f7457751633ec6
	.xword	0x14480638088cc93d
	.xword	0x70db7548f2e09cdc
	.xword	0x57a5f8ec5d61c7ca
	.xword	0x7550f5e69f950d91
	.xword	0x255681ccfa988198
	.xword	0xddd5c9fdfdc3c3ae
	.xword	0x78756943ce909d9d
	.xword	0x889dec413b920a93
	.xword	0xaea1110f8ef358f6
	.xword	0xb1aaeafbaac5e33c
	.xword	0x05a0389a28edd461
	.xword	0xcdff6bf58ea8d911
	.xword	0xf933c07b4f3ba353
	.xword	0xb183df1c7a476169
	.xword	0xbd50f970eac0dc85
	.xword	0xed4721471ccf3adf
	.xword	0x53f4bfcd090ca32d
	.xword	0xb945ac1af7b82c9e
	.xword	0x66480690443774f6
	.xword	0xd5218c4a01c0e80b
	.xword	0x20dead0b8de93f5c
	.xword	0x11ce31b61c39737d
	.xword	0x8aaa04009bb864f3
	.xword	0x3139e42959ae4bdf
	.xword	0x65f047b35f3661bd
	.xword	0xec5dc175c9d19ccc
	.xword	0xdd19b52cb5199701
	.xword	0x7344c59b4cd935fa
	.xword	0xe23935125fbae21a
	.xword	0x4a8ac87fbf20b4d7
	.xword	0x17b265d67b5c1559
	.xword	0xd595093ae29aa8c1
	.xword	0xcd77d0b4c1f3d486
	.xword	0x8e76faf877be8292
	.xword	0x49150396bd9d8fb9
	.xword	0x53559198ab629f86
	.xword	0xa809f9d43c039d68
	.xword	0xa8c4f7d8ee4bcf63
	.xword	0x6978cc277312748a
	.xword	0xd9d77d56dffded14
	.xword	0x07f402041d3f77fc
	.xword	0xd1cc6ee3d0c5d7aa
	.xword	0x40464fcba773993d
	.xword	0x01e3626507fbd419
	.xword	0x6def31df11b36f89
	.xword	0x3d42aad99be2fc93
	.xword	0xa3aaeb5c9c29892d
	.xword	0xe24b11ef06a8665d
	.xword	0xb3f8d3cb5cc4525b
	.xword	0xbb0f17ab19c400d9



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
	.xword	0xbaa1e95ff8c003a1
	.xword	0x574d0d6042c07d85
	.xword	0x733dd5ce2953fde0
	.xword	0x0844de948ed8b529
	.xword	0x9e5047d73b9cde85
	.xword	0x05e05eacb4573423
	.xword	0xf8c1cd1e9216ec62
	.xword	0x2265b7c984690838
	.xword	0x8833b6532f5c0313
	.xword	0x72eeccc392e9724e
	.xword	0xb249a400acad9b0e
	.xword	0xb9e46a889b674591
	.xword	0x66a8042f1582cadc
	.xword	0x85d166a0ea2dcb61
	.xword	0x3902fbe61edf5fe1
	.xword	0xe2bb1c037a0ea597
	.xword	0x7db6cfd2ebca1ff2
	.xword	0x75b659733d731cbc
	.xword	0x6c00efa4ab54e8b4
	.xword	0x5cc8054397a8ac5a
	.xword	0x891180ebe7225aa7
	.xword	0x3804f388897c03b3
	.xword	0x1e531cfcf21052da
	.xword	0x4889211713da89c1
	.xword	0xd8b25d9048023094
	.xword	0x3bbaf623ce115d8a
	.xword	0xdac40023a3b2aa49
	.xword	0x508614bdf0da9e54
	.xword	0x2097efbe3aa0b778
	.xword	0x4c26025f870bfdae
	.xword	0x7ee8e5313bfc7acb
	.xword	0xd683ee9492d53c30
	.xword	0x71b3535abf9fe82d
	.xword	0x0fd5886aa719eeff
	.xword	0x6d3b1b0cf6acf25f
	.xword	0x394e9c4115739ee8
	.xword	0x8e30791dac56314e
	.xword	0x2903f356ab814c51
	.xword	0x8b15f43eedb17710
	.xword	0xd454daada862cbfc
	.xword	0xd0644546d739ddc0
	.xword	0x89f4c73042c17ea1
	.xword	0x0416901f491d2e0a
	.xword	0x666365aabe022005
	.xword	0x83b4ae41a96184ab
	.xword	0x07a325439907bf92
	.xword	0x3cb85f7a751b3e3f
	.xword	0x133f8705b0a231cb
	.xword	0x43e1b5fa33822983
	.xword	0xb79a0e3155088902
	.xword	0x1e76137ad54eca2c
	.xword	0xefa9a2de20e5f129
	.xword	0xb81a93b834d86da1
	.xword	0xe5505a932752b9c3
	.xword	0x45df351a714d79a8
	.xword	0xc7354218c8baca4c
	.xword	0xb110700ff7308674
	.xword	0xa204ebad11c1fb84
	.xword	0xd7a5b5ab553bb812
	.xword	0x0035c304b8ab23c9
	.xword	0xd6eb42c4cf3fa823
	.xword	0x11acf8b370917edd
	.xword	0xe68c4a5a4101c128
	.xword	0x4258be05339baab6
	.xword	0x23d595f598b50c8e
	.xword	0xca1a127041a1af83
	.xword	0x2dfc28f5c9e8d788
	.xword	0xd8788a69c1d0a4a9
	.xword	0xa14f6c0f89800171
	.xword	0xed443daa1f97c2f6
	.xword	0x16d2ceed6a46268b
	.xword	0x8c5912a68800a2ca
	.xword	0xd15ed39089ce14d6
	.xword	0x7024a9d9e973ea0e
	.xword	0x102eadfc299e73ff
	.xword	0x7489b14830700792
	.xword	0x49928b65bf671151
	.xword	0xffa1c5aa4720e7d3
	.xword	0xaf9038eff3737fc3
	.xword	0x26bef511ccafdd37
	.xword	0x1ef327091c5431d6
	.xword	0x2015bcaab0557bc9
	.xword	0x75f300409c8aab71
	.xword	0xc289b8b7f3b66c26
	.xword	0x4cec2962c0fbca06
	.xword	0x696a746a8de4af0f
	.xword	0x1d15bfacc8be929d
	.xword	0x986fe16b85ef2708
	.xword	0x5b6224832351eb5c
	.xword	0x5653a39a23cbd7dd
	.xword	0xd167738f16f61d09
	.xword	0x8b2f2b81b3b5322e
	.xword	0xf0c97764bf1e41e3
	.xword	0xd1bf4c06b209fb59
	.xword	0x8c9a388f6dc417ed
	.xword	0x7fe9f57af12bf3f2
	.xword	0x5904b922926be12e
	.xword	0x658d33f8de73e74d
	.xword	0xe90560ce135b2a52
	.xword	0x4be5048196897267
	.xword	0x0c08142a3c5b2876
	.xword	0x16333b46e6fea051
	.xword	0x8476ac5cb318e80f
	.xword	0x622dc627ba1cb820
	.xword	0xa4e451098154c5fc
	.xword	0xdff0628f85749a49
	.xword	0x6de7e470fee82e6a
	.xword	0xe7048f689635f906
	.xword	0xbc5ca30c6423d8e0
	.xword	0x899ba21ad2fe4dca
	.xword	0x0577bbac06c796bd
	.xword	0xc27b07c62f4ef319
	.xword	0xab62b1a5b3ae9572
	.xword	0x49d4dfbfbe5439d1
	.xword	0xf4523ad47e0f5134
	.xword	0x74fabc9c23a8582f
	.xword	0xd4f72a9187d91523
	.xword	0xeb08366ac29a5442
	.xword	0x476cdd4ad59726c4
	.xword	0x7b726b7a2ca65655
	.xword	0x2236101949ccf559
	.xword	0xf9632f7221d3c69a
	.xword	0x52da74f5219bbd19
	.xword	0x2949a1959ceff742
	.xword	0xdee104c185dde55d
	.xword	0xd5d78b5fb7cf5d95
	.xword	0x3e2af3268e60631d
	.xword	0x1e380cd8f574a948
	.xword	0x16fd01e8ebce0cb0
	.xword	0x9fb13f094b931506
	.xword	0xf9c3b8311b9afb8d
	.xword	0x6b0f97df7bdd8d33
	.xword	0xd34b699a985a8b3c
	.xword	0xafa73ab12778576e
	.xword	0x894f6f0f597f9d69
	.xword	0x95d72be2b9226640
	.xword	0x4c89f527de48797c
	.xword	0x0f7ddd3f859bad8a
	.xword	0xd98c83352037b44c
	.xword	0x0cc7c6de4fb8ac06
	.xword	0xa8a683543ff5f4a8
	.xword	0x1389eddff17b5dd7
	.xword	0x92958dbb057d4c98
	.xword	0x6bee5accd52767b8
	.xword	0x693bab65dbe646db
	.xword	0x1ff829327754dadc
	.xword	0xf61bd7aadc314086
	.xword	0x097c665ce907cd3a
	.xword	0xb8e0da0bb37683d8
	.xword	0x73d27b5d0a5acda2
	.xword	0xa40438ab96ba60bd
	.xword	0x2042acfd0c5ebd46
	.xword	0x9749850330f12671
	.xword	0xbd7ca68c97fcb60d
	.xword	0x7f517eaad681229b
	.xword	0xe683ccd2263f5b3a
	.xword	0x1bfe20298e4e56aa
	.xword	0xea556b3dafd49524
	.xword	0x04995c77d3e68c0e
	.xword	0x74e1bbbedb1a4707
	.xword	0xc8f4e69358b4fa2c
	.xword	0x4fae259235bb0858
	.xword	0x75fac8ee28d78dca
	.xword	0x4700dd9eee72b067
	.xword	0xd1f65ea00eaf7b84
	.xword	0x9425c2bbdd38e8a6
	.xword	0x694e932333bc21e2
	.xword	0x8cfd9fb24e208af5
	.xword	0x8b39ceb8a403bda9
	.xword	0x0e0a2b3877f0f0fc
	.xword	0x3493c3b8a48f2283
	.xword	0xda1adc0ded465a09
	.xword	0x307d8265c70ca5e8
	.xword	0x2b7f003ddd6e9d08
	.xword	0xe1c7c2ebb2dce80e
	.xword	0x3f5faf864638cf8f
	.xword	0xfdda3c9fb99d652d
	.xword	0xfe44fb22214aad26
	.xword	0xaf1ebb240d5dd084
	.xword	0x0fb8ac2002ecff91
	.xword	0x6d7fb4d03347e566
	.xword	0xbfd26e632e23f6ad
	.xword	0x724917d1e13a1b26
	.xword	0xfcc639e1e618e4d5
	.xword	0xf309fc8444f31e0b
	.xword	0xb8144716277d6001
	.xword	0xccffc237b425ba1f
	.xword	0xb47d53f3046ae950
	.xword	0x852dd53010e72d2d
	.xword	0xf6366e11175d327a
	.xword	0x2238bad06ed79f85
	.xword	0xaa41e2ea71df9cb1
	.xword	0xbf785518bb0245d3
	.xword	0x73353745c8d1fdb6
	.xword	0x7071b7ee470ea79a
	.xword	0xda8d69fff9dcc034
	.xword	0xa7a3ca169f4f3c74
	.xword	0x73b99429aee0fdc9
	.xword	0x18dc6d596fe97654
	.xword	0xeb95cb8620112ddd
	.xword	0x7edec5447dba8700
	.xword	0x585634d8385d4ce1
	.xword	0x1de336ba5b6639c8
	.xword	0x5df29321f419980e
	.xword	0x915634a6ab24cc8c
	.xword	0x4e9acddbfd557608
	.xword	0x6681fbc7bb07cb12
	.xword	0x10e2709874bbabfa
	.xword	0xf8666f4aaa1510a0
	.xword	0x44c5e11f82741c75
	.xword	0xfcc94e0604808404
	.xword	0x4cd80e88fe77402f
	.xword	0xec4bf23b4d3cd327
	.xword	0xff77bee6a53754d1
	.xword	0x132f8c661a32d6de
	.xword	0xb5e57d55ee7b9825
	.xword	0xe5c6e32f70854ee5
	.xword	0xce6e720564c214d5
	.xword	0xdcca20c86fdfd859
	.xword	0xc3f22195e21ad357
	.xword	0x3650f2d85877a2d1
	.xword	0xd415bce0670d4035
	.xword	0x1291021652d37180
	.xword	0xf17c5985867a002a
	.xword	0xfdf5dcffae11a4ad
	.xword	0x092df54f1ee40a11
	.xword	0x2b379d57a681284d
	.xword	0x5bb905d98601946a
	.xword	0xc84bb8b3be8e4ced
	.xword	0x2c3a7d4ee036d490
	.xword	0x909045efeb6703c8
	.xword	0x857902a9441ce855
	.xword	0x7d18182852a88cc4
	.xword	0x496870c2ad8da875
	.xword	0xad749dd449e5d4e8
	.xword	0xae666564b104b315
	.xword	0x09b712bbd882bfb8
	.xword	0x445eb272d2c540b3
	.xword	0x3cbe8218941cb38e
	.xword	0x593bebf52ca78f75
	.xword	0x19f6187d15a9808f
	.xword	0x3451272ec2eaf274
	.xword	0xfe83ec98efc000f7
	.xword	0x30dda6bbe1aa432a
	.xword	0x8360b59335d500e3
	.xword	0xb5bb6be341c0778c
	.xword	0x6a53c248598df69d
	.xword	0x6e472836bf7cb20f
	.xword	0x0da0f125df6f0f08
	.xword	0x52856d5c256db64c
	.xword	0xe68d5e7c188904fe
	.xword	0x6ff480bf74bd2633
	.xword	0xe907d1d22e948fbc
	.xword	0xf9ca1e70eba87291
	.xword	0x7db735a8babf7c67
	.xword	0xebee716be3de09a4



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
	.xword	0x629fcad39dca9951
	.xword	0xbdbc7829531ce645
	.xword	0x00bd633748b4b5d2
	.xword	0xdf63da33ebd3aaaf
	.xword	0xe96b05a6f7d7eda2
	.xword	0x2c19f3f963f49193
	.xword	0x33729a6aae7f8e6f
	.xword	0xc8361708189cafff
	.xword	0x49326eb5b223276b
	.xword	0x4bc0925606147b43
	.xword	0xa9e26e144defc45c
	.xword	0x7a25598f3781ce5d
	.xword	0x3fb5d935c041519c
	.xword	0xbf8cc9a55ba41117
	.xword	0x0f3bd0cafb664962
	.xword	0x7161be63c290ddb1
	.xword	0xb25b2347954c29f7
	.xword	0x03e7459d596c912e
	.xword	0xa0c4bd8194527348
	.xword	0xbba8af4a05f72236
	.xword	0xed21d4f94e493970
	.xword	0x29d4da4986d46a9b
	.xword	0x5821a4df57f8a356
	.xword	0xab4dea8643c455d4
	.xword	0x228e46ab50180c83
	.xword	0x32fcb43a6ed8d499
	.xword	0xe776b218b1867db7
	.xword	0x8088d4f959f5a6e3
	.xword	0x7d4313a96949aba0
	.xword	0xa778d5cd1530db0c
	.xword	0x938976a5dbc36414
	.xword	0xec7bf07c6058f735
	.xword	0xc2c6cdcaf3b8e47f
	.xword	0xa5ecf176025008d9
	.xword	0xaf455877b4c7aaf3
	.xword	0xef05ed27e744d284
	.xword	0xb67e7bcb1703c80b
	.xword	0xf6cf68dbe400c779
	.xword	0xbdb76b6b61fa2c78
	.xword	0x940e41459757e5f9
	.xword	0x2aeddc20737df5dd
	.xword	0x87d8a710643d3dd1
	.xword	0xbb984acaef2f6fb2
	.xword	0x316d29e7dd00db1d
	.xword	0x787af0c9a55e6ab3
	.xword	0xcae29b5bbe2567de
	.xword	0x0db6338a0af731e2
	.xword	0x5330cf00dfe1e85e
	.xword	0x47e109d04e128204
	.xword	0xe72351829b8bcb24
	.xword	0x798bf20a091c31cb
	.xword	0xecde083a3b075d3b
	.xword	0x2cf38b60772f2cfe
	.xword	0xa694fdb2f5b4466a
	.xword	0xb065cc90977cd5e5
	.xword	0x665c359c6d1ddb4a
	.xword	0x5215d34aa12c3825
	.xword	0x863ab855b25f1062
	.xword	0x8a1e5f04ef3b9e45
	.xword	0x27491fe184af1975
	.xword	0x82c8a4813c526bfb
	.xword	0x800df8ffed8004c5
	.xword	0xf318545852ea4334
	.xword	0xc83f9e9dc7057e33
	.xword	0xeea347b6290769e2
	.xword	0x96c630f6a8d264f7
	.xword	0xc79a069417b006e0
	.xword	0xc45b2c1f02e84cf4
	.xword	0xd1fa69769a535a49
	.xword	0x8fec250310a56cf2
	.xword	0xde3169b5c39971cb
	.xword	0x34bc8d532ff4691d
	.xword	0xd9024893b065553f
	.xword	0xf57f933492adb0eb
	.xword	0x6058ea82974a0d8f
	.xword	0x3988d6da8720fd98
	.xword	0x8376836378f88b1e
	.xword	0x362e94b376a2a6cc
	.xword	0xcb0ca7990b43dcd6
	.xword	0x45eabb065e6bd94c
	.xword	0x206f233ede7a2106
	.xword	0xa29599dfd8a3efb1
	.xword	0x1e541c9ba9ea4dec
	.xword	0xcca713267257e52d
	.xword	0xc77bd9d46b58c72f
	.xword	0x0539a92740190578
	.xword	0xb0b6d1df67d21eaa
	.xword	0x9f171ea5d87898c3
	.xword	0x6ed8430c6fd059dd
	.xword	0xa5a26736b71725ae
	.xword	0x05f3a36cc3d15dae
	.xword	0xd3312cd32bbc6347
	.xword	0x7f6120a2e8975425
	.xword	0x271844990c8e4ee6
	.xword	0x6763b88078b4b2bb
	.xword	0xff6b81f581a200dd
	.xword	0xf4a4159e445b5c1f
	.xword	0xe900831688fdef07
	.xword	0xeae727fe5ca15343
	.xword	0xe1c2a3ca1b9920d3
	.xword	0xbc5ae67786502a90
	.xword	0xe6a6080bcb6f37f4
	.xword	0x017db2a34dd6a2ca
	.xword	0x0729b67176d916d6
	.xword	0xae596accc8af0887
	.xword	0xe64ca1d3ec8590cc
	.xword	0xa7e65d939ae30bbb
	.xword	0x2d3b613ef4831aaa
	.xword	0x95d836cb9927a584
	.xword	0xed15e7d08323f98f
	.xword	0x3870cb464116b447
	.xword	0xe07ee90fdee9844a
	.xword	0xeebd3e5aea415f83
	.xword	0x53f75df56fd2ff85
	.xword	0x5c4a3736baa485cf
	.xword	0x661559edf3ec5687
	.xword	0x108c0eaff5e3014b
	.xword	0x4759f2eec8d6af71
	.xword	0xce4a396d7be150d1
	.xword	0x1f99bf6632ac955f
	.xword	0x7c06bd8f53988b12
	.xword	0xc419ea2d3d142b60
	.xword	0x8723760035db7bdd
	.xword	0xd3f4c9757bc249b3
	.xword	0x83382076e4da40aa
	.xword	0xe4253eab6aa32cff
	.xword	0x995b43bfb44b5e58
	.xword	0x0aafb4e94f9583f1
	.xword	0x89ffdd3c4e09ff19
	.xword	0xd372eb1b33bcc9aa
	.xword	0x23a85053b27f838b
	.xword	0x26e0403612e4c604
	.xword	0x33fb3f13a7743cce
	.xword	0xb25499646efcd2b1
	.xword	0xf2c0ff2497597d1e
	.xword	0x71cab2b139a74d67
	.xword	0x419d0bb5101cef55
	.xword	0x9999b762034ea43d
	.xword	0xdecd2a450645cac7
	.xword	0x44fee5dbe9cb8857
	.xword	0x1a09a8e62f89c9cf
	.xword	0x6e05876c79fd1234
	.xword	0xcd8938ae8dd5e36e
	.xword	0x12721fefd436a06a
	.xword	0x1d3da3df99374cc9
	.xword	0xfceb59908453c199
	.xword	0x2fc20d95729d08e7
	.xword	0xf5e2b7e9babc8230
	.xword	0x9a89219acb2ca361
	.xword	0xef55ce642dcc8c62
	.xword	0x9ca6497fc7bfdc57
	.xword	0xcde9b176b8862bfa
	.xword	0xb0a7eec88da8949a
	.xword	0x02a6fdce58abb51d
	.xword	0x7d35eb549c7c507b
	.xword	0x05e0661ff4931225
	.xword	0x59a7644aef3e9182
	.xword	0xefff47a8be0b6bb1
	.xword	0x870c712f28dec6f2
	.xword	0x127c0c91362886cb
	.xword	0x1998a9b4858c7643
	.xword	0xb84c130ab908a581
	.xword	0x64928b7a607d651b
	.xword	0xef9664484c9086ac
	.xword	0x14e850e7fefef170
	.xword	0x12d446ca86e135b4
	.xword	0xeb9d29d43b0af04f
	.xword	0xf49bee9fd0e4f3b5
	.xword	0x5b92cbcf000e01f7
	.xword	0x9440753062dabb52
	.xword	0xd1b433e3ff0317aa
	.xword	0x4e756f33245393e2
	.xword	0xe50922288900d827
	.xword	0x22cb2d84905bf275
	.xword	0x96894d7ffd956c7a
	.xword	0xd16ce5cd07a890e5
	.xword	0x59b68828bd748908
	.xword	0xc5fa8799f1f6fb99
	.xword	0x4094b26a7053213e
	.xword	0x14571f6cb57e2479
	.xword	0xb27516c02d87cf88
	.xword	0x6bebf572a8f8501c
	.xword	0x46434423d73bf370
	.xword	0xd7320c4127b6f13c
	.xword	0x4bdb4ee37968d0d1
	.xword	0xd53be48c79a92ca4
	.xword	0x4897d6cdc1b1683a
	.xword	0xf02b78abb5922e16
	.xword	0x33e29568eda644d6
	.xword	0x6834f15cc98019bd
	.xword	0x4efd38ca07ea290d
	.xword	0x816586e2f40afa4a
	.xword	0x5b5ff668ae019e70
	.xword	0x9220a02ffa84a5e3
	.xword	0x92e694524707c1c9
	.xword	0x45cf1ae4fe3138ca
	.xword	0xabe314bcab81549e
	.xword	0x23cbb0e9512edbef
	.xword	0x6b009c62d604edbb
	.xword	0x69bfb8a2108da9c7
	.xword	0x18a0dc2f44f6c025
	.xword	0x7023cf9e0175ed5f
	.xword	0x9984df0e1378233d
	.xword	0x47799f667d6f7fa1
	.xword	0x6e4e18f47eaa5e42
	.xword	0xfc38d6149dfacf68
	.xword	0x36af651bbe84dd72
	.xword	0x44e027445c24ddde
	.xword	0xe1df4341c410c988
	.xword	0x546106caf9202d12
	.xword	0x9db261c737c10f84
	.xword	0x1a6e58476a434986
	.xword	0x5012bd3d1c90c0ce
	.xword	0x6ac4740d5db05154
	.xword	0x4b99ad5aba332137
	.xword	0x37ff75990ae8d63b
	.xword	0x461ac043173b5832
	.xword	0x938ffdaca7882dac
	.xword	0xddffa0f051d4f06e
	.xword	0xf7a96cd8a4266eaf
	.xword	0x9577d166f272973c
	.xword	0x6913156ac510af67
	.xword	0x768dc591e0d76d6c
	.xword	0x7b5c4ef2c58bcc12
	.xword	0xd46e574999a0c43d
	.xword	0x90313fdb8b830f65
	.xword	0x872df52d7a96faa4
	.xword	0xa24497274df29827
	.xword	0x9bfecdf4df5596fb
	.xword	0x2a70bc41f4f829c1
	.xword	0xf975beba7cf36ff5
	.xword	0x2cbb43cab9f5a53c
	.xword	0xa6a3025676e47e89
	.xword	0xdaf98d3ebf7c8594
	.xword	0x8b332db4958506ea
	.xword	0xe644b95e7efcbc37
	.xword	0xbcba4df6930f7bca
	.xword	0x477953f53260df7b
	.xword	0x3afbb4eb5954ab6e
	.xword	0x3ab98dfa6bda9c33
	.xword	0x86efd8b81823188f
	.xword	0x934328e287e92fc0
	.xword	0x7430c2a3c2f8ad3f
	.xword	0x563b08b1a11d386f
	.xword	0xb030639f0d131105
	.xword	0x733852b6287f646a
	.xword	0x469d9b200f8762fa
	.xword	0xf02fa0c4bae0eaeb
	.xword	0x169a1dfc99e1f5b8
	.xword	0xa3bdb9ab61b80e1a
	.xword	0x98f3d7a1847661b7
	.xword	0xaa4f00c3872da68d
	.xword	0x40b0321d4fc6a482
	.xword	0xbbd3481cd1cd3268
	.xword	0x7d49f591e7b2e8fc
	.xword	0xa5b71128335b5d79



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
	.xword	0x73165ab1e5b45f07
	.xword	0x8c1c8b35b770b859
	.xword	0x9c9eed63b72bc234
	.xword	0xb5539d6e0e5251ac
	.xword	0xf0ec3e719d35ad42
	.xword	0xd0146f7aed11f604
	.xword	0xd5ded6bf330cce00
	.xword	0x071125f289cdf975
	.xword	0xd9c7fc1177dd0920
	.xword	0x467ac78ceb81563b
	.xword	0xc34e2430bdf43bd1
	.xword	0x512a5b170f87db6b
	.xword	0x9ccca39c2aca65bb
	.xword	0x831da8eb6a099e24
	.xword	0xbd1276ecb2be1bb1
	.xword	0x4cf60ecd2c1c453e
	.xword	0x3373b3baaa8bbb29
	.xword	0xe04a36c62ca95f37
	.xword	0x618da8e3bf285275
	.xword	0x4422a1993596454e
	.xword	0x0270f995e64d32d0
	.xword	0x3024bb877bbab721
	.xword	0xfda0dd27fc0dbf55
	.xword	0x9993002c7241cc02
	.xword	0xf2b282dd0a9844ad
	.xword	0x43b5367a364b4ea1
	.xword	0xda816e0f1768601a
	.xword	0x732484769b8e6b7e
	.xword	0xdf2c2412d1e7ad5f
	.xword	0xb39c79deba017b7b
	.xword	0xa4442ec38a641aeb
	.xword	0xc9ba1d6e3745b8bf
	.xword	0x002861b9a1429cc2
	.xword	0xef473c24867ded86
	.xword	0xd6829d0c07d28f86
	.xword	0xee5ec33051cf35d3
	.xword	0x344de35d6bc6789d
	.xword	0xc373b8e9016b46fd
	.xword	0x425ece929046167c
	.xword	0x9645e6c101ad0f24
	.xword	0xae9014e7359cebf4
	.xword	0x1b867aac18eb422f
	.xword	0xe03cd7341ce8a2f2
	.xword	0x704fc5ad36a97d03
	.xword	0xb394741b8cf1ed9b
	.xword	0x86070c521fa2ebee
	.xword	0x7378f121dff40858
	.xword	0xfd2bd48cd5afafb1
	.xword	0x579b304f559a74bf
	.xword	0x6f70439b314f7852
	.xword	0x32d89caa538e0c4c
	.xword	0x24451fdd7ed9e650
	.xword	0xcf76a54d600ce067
	.xword	0x029359f60f4da753
	.xword	0x736c1e355c4dd44b
	.xword	0x5103fe221f66cea2
	.xword	0xbab8fe17492a3469
	.xword	0x8c4ecacaba23720d
	.xword	0xf3c2c3901582e2d9
	.xword	0x8882fa945b3a3093
	.xword	0x38780ac5d0dbcb8e
	.xword	0x852c52bca50ec7f4
	.xword	0xcab9304261f9c30f
	.xword	0x4286c65b15b8ea6c
	.xword	0x7667c66c654595de
	.xword	0x12f9f8637ab65466
	.xword	0x2a1b8d9436358345
	.xword	0xab6f7ac36cd6dd76
	.xword	0x01f2cd35655935c4
	.xword	0x4844ba7d778f5e7d
	.xword	0xe5870e643ddad8ef
	.xword	0x24be4afcb038d663
	.xword	0x7b6315a3fa3b0ac0
	.xword	0x89e130f78dd26daa
	.xword	0xa1b3b47afe811674
	.xword	0xec94c622b3147c1c
	.xword	0xfd3981cdf8376c7e
	.xword	0xc8945f80e49074b7
	.xword	0xf7557b011493d6bd
	.xword	0xedea2e141e92194a
	.xword	0x5385b19794452ef0
	.xword	0xebf57f6e32437f4b
	.xword	0x08c2deb54a24319a
	.xword	0x9e8abad3e56eb766
	.xword	0xc410c6e681bc1daa
	.xword	0x28d6ff3c41a11cf9
	.xword	0x9120f06b1aa725ab
	.xword	0xf3249b50e08ae16a
	.xword	0x52287f30d9f2263d
	.xword	0xaa95240a4f0edc4d
	.xword	0x71cdd76d7dfd4779
	.xword	0x73ad58d1f02cd320
	.xword	0x3e000b97806fff72
	.xword	0xda1699dd8657ec84
	.xword	0xbebeb2b57db870f3
	.xword	0x5cbd6fea8aa071f6
	.xword	0xe491282073d2f418
	.xword	0x4003883f4117e665
	.xword	0x0a02fde216f02b38
	.xword	0xc1929cdfb109b6c2
	.xword	0x2f0a1b216da6ad0c
	.xword	0x952000e03eac6e80
	.xword	0xb36783777b3c5756
	.xword	0x8cc58413e6b619c3
	.xword	0xa6ac004b4b5fbfc8
	.xword	0x301048a58e8be9b1
	.xword	0xa6657637f4c3934a
	.xword	0xbd17526fd9cef614
	.xword	0x1533bdec56b9f142
	.xword	0xb512143b8b40cf8f
	.xword	0x1c8c772a347a5732
	.xword	0xc0ae8fa94a9a4f65
	.xword	0x76e3a1bb23c8a6c1
	.xword	0x1fd5b982ab1a4c01
	.xword	0x0eca5c6d80f2cb25
	.xword	0x8bed7f2598698f94
	.xword	0x01f1bb5b5f343b62
	.xword	0xe86dd8ff747f55d5
	.xword	0xfa17b631d976e521
	.xword	0x27b627e09ff02ef4
	.xword	0xe9a6f7d0f3ebedc2
	.xword	0x2eed955365acef8b
	.xword	0x992d16914416ee20
	.xword	0x8eca1c6cb2fbfbd2
	.xword	0x8882ee7a64e5baab
	.xword	0x6d1b43ac6355661f
	.xword	0xb08b76b18e6cbef2
	.xword	0xd17539e4302a3f7f
	.xword	0x21d4714c0fc5406f
	.xword	0xff3e73dec64d1db6
	.xword	0xbb65dd1c1a551279
	.xword	0x7a0cd63ec6626e37
	.xword	0xf968c6f12c7ee466
	.xword	0x2ab8fa9f4a70c140
	.xword	0x9b985551b1d2b11a
	.xword	0x058a04575641d966
	.xword	0x6f061e965107f9ac
	.xword	0xa871ceec38d8e420
	.xword	0xec203a67c332ef7f
	.xword	0x03e0bedffeedfbb5
	.xword	0xd0c86c63fda62bf9
	.xword	0x0faed8a930154c0d
	.xword	0x597bf36952481610
	.xword	0x0ac1ffebbafa3925
	.xword	0x6d8cd35566025708
	.xword	0x8b325ab4b472e4e3
	.xword	0xc08fc942951e15dc
	.xword	0x0f9d172626a86453
	.xword	0x27f0f0f245c31631
	.xword	0xb51464552f07b673
	.xword	0x5f6d405862df3e09
	.xword	0xda813d78c703058d
	.xword	0x0ed27e7d33824520
	.xword	0x08e197af212dd68b
	.xword	0xc5ef968a0e7b458d
	.xword	0x27639e92f08a21de
	.xword	0xa7e1e8910c86b1d3
	.xword	0x72749cd944fef6d0
	.xword	0x493bfc39836591f4
	.xword	0x300ad1462c1c7f8d
	.xword	0x3e5721866fe0102e
	.xword	0x7c01e59c9bd9c4d6
	.xword	0x22c9261e42a61cdc
	.xword	0x88b01ba852f16a4f
	.xword	0x483c1443b8d907fb
	.xword	0xb8830b221f1f795f
	.xword	0xd4cf09477df0816d
	.xword	0xcbd673880db18ac3
	.xword	0x02af99e2a7a0788d
	.xword	0x7aa4f501bda67b2f
	.xword	0xfddf612132df9b23
	.xword	0x9b071616cc6018e5
	.xword	0x0531a9f7b64c42b0
	.xword	0x0c4ad7e5c916c36e
	.xword	0x49b0d1356db6b450
	.xword	0xc3e81c52c9e321f8
	.xword	0x5fcba3e45184b35d
	.xword	0x6a2f0324fa746cad
	.xword	0x356a9107911add92
	.xword	0x8ad56a9b93eff80d
	.xword	0x35250c4682515fe6
	.xword	0x425094d5998b0f28
	.xword	0x1f04fd132afb5b8f
	.xword	0xcca81c2fd3649407
	.xword	0xbf5062f868d2e5be
	.xword	0xb4d6cd4797548e57
	.xword	0x593570f912872402
	.xword	0xeb50900a63ea2087
	.xword	0x4952b60a60569342
	.xword	0x9b5433e1a905fb4a
	.xword	0x2b957051a0b4a419
	.xword	0x84539ceaec168840
	.xword	0x92a5bb77e14e0f26
	.xword	0x8c2ea917f18fcc20
	.xword	0x16667adabb8a3fe6
	.xword	0xc27a23b250986da7
	.xword	0xfb1b9aed0938d2c2
	.xword	0xbc2be5fff2f1db03
	.xword	0xa8035401b561c92b
	.xword	0xb753d5889a1bb730
	.xword	0x5f29161939c0c946
	.xword	0x19af8510a4e63c57
	.xword	0xb80e10c8db4bb4a3
	.xword	0x055f09d58665555b
	.xword	0x5323effd1114b997
	.xword	0x54a783af3f739fe7
	.xword	0x37c1fe27b93b2a4f
	.xword	0xd6aedcc8ac3f78cf
	.xword	0xcf800427205d289b
	.xword	0x09a20c76f93f07d4
	.xword	0xe9b758eb34b2744b
	.xword	0xe59eb8afd628a2ee
	.xword	0x9d02ae8ef84466be
	.xword	0x1776a1f2a973f791
	.xword	0x698b0871ba797446
	.xword	0xe3e8c2383d12e681
	.xword	0xc3ee2ec88e0e973e
	.xword	0x2cdc02d02b81ba08
	.xword	0x7382d68b0e2c3839
	.xword	0xf1103d01c29270ce
	.xword	0x470036bbdab5989f
	.xword	0xe09f02f1c08712e2
	.xword	0xc4e76ce7b92f1e4f
	.xword	0xb9471ad47b620417
	.xword	0xde8bb30ee66e8da0
	.xword	0x2dec1ab50efa2bdd
	.xword	0x64bb4eed7add7f84
	.xword	0xdd2f086953acea60
	.xword	0x83aa455a150a7e16
	.xword	0xd9bb770c1fa68ac1
	.xword	0x66f73db7dbcbd6a9
	.xword	0xd9f61689254c6e27
	.xword	0x1c9de587f87fcb6e
	.xword	0x0f5775bdb2fdad6e
	.xword	0x1bf119b6623eb2bb
	.xword	0x0de7552ffaf171c3
	.xword	0xa471c12f43ff1f87
	.xword	0xf5558f3eab989ba0
	.xword	0x8f76e7512983d63c
	.xword	0x9d7288c60a18d231
	.xword	0xa15d208ef62973c3
	.xword	0x4873eb00662defbe
	.xword	0xe5565d66d1b32693
	.xword	0x3c19b88fae92bd4b
	.xword	0x86faebfc7d1bc43c
	.xword	0x7cfab1cc49080b11
	.xword	0x2a83321c2b6e3ef5
	.xword	0xa2ee9b789bae78d4
	.xword	0x9ae0fa0db571fc1e
	.xword	0x48c5e9a15a8586bf
	.xword	0x2b54ec75f9ba7e77
	.xword	0xfbbc759ac2d0b6a3
	.xword	0x3877888db69b0c74
	.xword	0x02394f1a97e818e9
	.xword	0x474c319bbddea9f0
	.xword	0xd2b353d6a890665a



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
	.xword	0x4b92c5e3022bab3e
	.xword	0xf841dcae4e23c12c
	.xword	0x24ae0b2af5adbf28
	.xword	0xa58e33e9f061d184
	.xword	0x59b2cbb037546ad2
	.xword	0x67dcf8e9bb9b374f
	.xword	0x766bb31072c80ed2
	.xword	0xbc2822483e833d7f
	.xword	0xb5176cee930c0801
	.xword	0x5247f13b98cd67eb
	.xword	0x1e08a9810da0525a
	.xword	0x9777f74a50265366
	.xword	0x56b4b5e7d938f861
	.xword	0x81796cd176fa9686
	.xword	0x7735e7959e1cdd77
	.xword	0x210a2c419bf141c8
	.xword	0x8436f7f472f434b0
	.xword	0x3eb58062f85d1e5a
	.xword	0xc16cdc0230e0449c
	.xword	0xa95dfc4f51632d6d
	.xword	0x685df8aa0c771a75
	.xword	0xc4359af74999dd68
	.xword	0x9ccafca0757b1695
	.xword	0xde54adf66a398b17
	.xword	0x85ff9842d54ac074
	.xword	0x35933b690dafad1a
	.xword	0x14bbd8a0a179bffc
	.xword	0x872cfc841af8335b
	.xword	0x464bbb4e181111a6
	.xword	0x698deb906e0ed943
	.xword	0xfd887f933fe021c6
	.xword	0x2c3a14ce9e92c83f
	.xword	0x43dece4e037f270e
	.xword	0x073df421bb4b705a
	.xword	0xb67fcb941c8d0484
	.xword	0x87c31796bb7b190a
	.xword	0xda5751fbe92d4627
	.xword	0x5d69ca41338ade2a
	.xword	0x46dc0d40c5547331
	.xword	0x514569708e352f23
	.xword	0x00a60228e5a91a62
	.xword	0x9b599493309e284f
	.xword	0x49625cb079cf6a7e
	.xword	0x61b963c1111967bf
	.xword	0xc7c5afd48d9682a3
	.xword	0x78089420b3e3f4cf
	.xword	0x671e266cee86f2d7
	.xword	0x836485bbcdfbb470
	.xword	0xd8337f6f81dbc1c9
	.xword	0x1889b8fd39060489
	.xword	0x708c2d7e1c644b0b
	.xword	0xe3d81f6bcc39baad
	.xword	0x5f046a6d001c34a6
	.xword	0x64d5c3e13005b456
	.xword	0xae2a75945b925de1
	.xword	0x9d63d51bf411934f
	.xword	0x67da2360ae2f0c11
	.xword	0xb79b9317dbe4f071
	.xword	0xc8b75a7b103d792d
	.xword	0x4bbc7ff369260e91
	.xword	0xba0d882c266a5cb0
	.xword	0x3bae31d6dca37263
	.xword	0x826fc76a4c115eb2
	.xword	0x2602b7b3dba7dc69
	.xword	0x362931b000094a2c
	.xword	0xbb4d459366e88518
	.xword	0x7ad7f5df1acbdc7c
	.xword	0x739d4c7e01746b32
	.xword	0x52042ab5a18c5535
	.xword	0xceb956c70c91d76c
	.xword	0x89348bb13b65012b
	.xword	0x7ab0e06335d482c5
	.xword	0x62df3bab62b792ee
	.xword	0x9c71da03d8f1434b
	.xword	0x785a458fbaf6683b
	.xword	0x035ecbd1c3dac7e2
	.xword	0x7e0c93aa3704d311
	.xword	0x5979d6b4452b8b01
	.xword	0x88167cd565c59eb4
	.xword	0x59decb5343e71751
	.xword	0xd5f8e384e027983e
	.xword	0xc147cb59c9664fa2
	.xword	0x0c09215dc5beaf84
	.xword	0x3234594f2411dfee
	.xword	0xc2b2f2da886856bc
	.xword	0xfd02188a01ad3d11
	.xword	0x1393123f2dd3d9aa
	.xword	0xf445d08f9eaba690
	.xword	0x0c5f490cf0d3ce53
	.xword	0x667cf6786f6a074e
	.xword	0xfbf7978ae04d7e5d
	.xword	0x8ef654039e9a9ab6
	.xword	0x6323f338f9e3867a
	.xword	0x92c8f1ff49de81f7
	.xword	0xffd669b172b01324
	.xword	0xf7bd9f4b86bee04e
	.xword	0x75a3883d4442e532
	.xword	0x3624e754ceb1c9d7
	.xword	0x3927eaefa2ec9de0
	.xword	0x5b612857f07bc8e2
	.xword	0x3893b24fc0262f1e
	.xword	0xb692282e2463ef1e
	.xword	0xf9da8885aa36e354
	.xword	0xd1fcac5a85eed0c4
	.xword	0x438304b8d7c9e519
	.xword	0xc58493b62d7d17fa
	.xword	0xb4bfa7e1293b6c73
	.xword	0x845ae39c5ff4fc94
	.xword	0x58dc40f5cb479ba5
	.xword	0x858368af055054ea
	.xword	0xa3212555398de87d
	.xword	0x0aa41b8083d69c58
	.xword	0xcec5013d47ea49e6
	.xword	0xc06af08e5d91b97c
	.xword	0xfd143858a7a9646c
	.xword	0xa610c85f75274c20
	.xword	0x7fccf6377c559dc7
	.xword	0x87426bd43e4d309a
	.xword	0xe377467e4192fc42
	.xword	0xea1002fa38ed3211
	.xword	0xa76121c9e4756358
	.xword	0x154c7e4d6b9eb044
	.xword	0x2e8278de08eb7ad7
	.xword	0x659408a42c965d28
	.xword	0xc6605db825d53359
	.xword	0x56f2dcc47cbc1fe7
	.xword	0x822259e2bf056653
	.xword	0x6b78385d4eb935ba
	.xword	0xfe240c4dc23f50b7
	.xword	0x189d7b82a11a9bd2
	.xword	0x1be98d636233b4cd
	.xword	0xc53e2ffcdf7f63b3
	.xword	0x4f72b1143169193d
	.xword	0xa048cdc915fb504b
	.xword	0xf861b750a547b394
	.xword	0x8e05241db327ac6d
	.xword	0x227bc494107ee4e4
	.xword	0xed2832a95dd802e7
	.xword	0x2776b3986bd2370e
	.xword	0x629920df2a66460f
	.xword	0x5a3869595b92b84c
	.xword	0x9cddfd6632271bed
	.xword	0x72c3e5d90dfbcf0d
	.xword	0x9fbbe78530cfe649
	.xword	0xbb0f1a615b6e8d6f
	.xword	0x27a52e8df2533ae6
	.xword	0xd6e93d8f3e4cb0a4
	.xword	0x10a6c89fc2cd959f
	.xword	0x007d58b4bb608c07
	.xword	0x49f715caca823e3d
	.xword	0x94755c0efe6a8e01
	.xword	0xdcd95257e3b69212
	.xword	0xcf670a58b134f8e6
	.xword	0x0f0c3b9edafdf0c9
	.xword	0x85794ae0c9120dda
	.xword	0x80d5469fb7dd30eb
	.xword	0x42fb4048b62cd06a
	.xword	0x3bf701e241ef0cd2
	.xword	0x0cf25fae74af6ca7
	.xword	0xacd62509052f0625
	.xword	0x867907e72374ebce
	.xword	0xbb93a61de3774245
	.xword	0x9932c0ae86494814
	.xword	0x9336afcaaf62d3c8
	.xword	0x3dc8b0327b158536
	.xword	0xb51e7c8a07bd4a9e
	.xword	0x3a396476551d59af
	.xword	0x81a06194c780450f
	.xword	0x1fcf309fab00abf3
	.xword	0x0f976fd73b3c133e
	.xword	0x9e83ca485c78469f
	.xword	0x24547548cd16a998
	.xword	0x984e34ad337b4c4b
	.xword	0x33d9b50f2de4b4b6
	.xword	0x21057fce7ca72cb2
	.xword	0x3186af9ff3197ba9
	.xword	0xb2a59bdb62d185b0
	.xword	0x95041d9d8bd68c88
	.xword	0xe34a67348125cdf3
	.xword	0xe0714dfd00784c23
	.xword	0x4cc4d01823295e8d
	.xword	0xfe4784a288635053
	.xword	0x9ee3d28c7aa8acaf
	.xword	0x237c63f2a5e78de1
	.xword	0xa45da7555bafe434
	.xword	0x604c1b7c1383a71c
	.xword	0x615e2b457dff799a
	.xword	0xe59c93bb1dc87506
	.xword	0x603a7c02f3db9fd5
	.xword	0xe432ce6f8ae3d75b
	.xword	0x7c4d76abdb3720b5
	.xword	0x09b81775349b506b
	.xword	0x4947ebe81d319ac6
	.xword	0x741d248bd99d8ac8
	.xword	0xc4b4429a1cd969bd
	.xword	0x3a431b31bc24ab13
	.xword	0x2ae0fe75929cb7bc
	.xword	0x9c30f5eb61dfa4b6
	.xword	0xccc9c9d7eb65e852
	.xword	0x88a3146078edab16
	.xword	0x25622b10a99390ca
	.xword	0x3f8a92e119e60f0e
	.xword	0x6c7ac9c1a5a102ce
	.xword	0x16433fdb1c92121f
	.xword	0x5344747192fe3e86
	.xword	0xb6ee495242000f12
	.xword	0x2a54ebce34b857a0
	.xword	0xb12303e77957224f
	.xword	0xfac9137685e970b2
	.xword	0xb2df16d254cd36fb
	.xword	0x8608bcbc7cda3d4f
	.xword	0x4cccda84a6b165bb
	.xword	0x11bc78ee0c86cf94
	.xword	0x8a14b152533fdb3a
	.xword	0xf7a1ebf38901c317
	.xword	0xf83b5b431321ca26
	.xword	0xefb5421e95ad21ee
	.xword	0xfecc70b0c64e5e86
	.xword	0x9951f90ff4176e85
	.xword	0xf601f9217c24efb7
	.xword	0xcba4fa26063bda98
	.xword	0x6c26cac716671bc5
	.xword	0x98698a74dc5f44cf
	.xword	0x2e2d22befd2b46c4
	.xword	0xc7562f00d71fa9b8
	.xword	0x2505b331c35ee77e
	.xword	0x8f29dcadc2603dda
	.xword	0x19d63f2e83f24567
	.xword	0x7ded7d3d059704ae
	.xword	0x507742dfab5a2669
	.xword	0xd4aa47f91a62b78c
	.xword	0xe5157f25b7d84674
	.xword	0xa69036ef94139d42
	.xword	0x223832eaa48daea9
	.xword	0xd2beba8cc50ea5c6
	.xword	0x9302b8ac69e19993
	.xword	0x2f4fbec5f13b4ac0
	.xword	0x3bfcd8cac73b9c4f
	.xword	0x72ac3cbbca584db4
	.xword	0x5988345c81ca69e9
	.xword	0x7c64a1eedb7ff5a5
	.xword	0x9de8406455981d90
	.xword	0x22fce6b6d4d3e8ae
	.xword	0x46dad11075c7eb03
	.xword	0x56b31753f2cb1171
	.xword	0xe9705977bc625272
	.xword	0xc41b5c758d01ebf5
	.xword	0x04d80cad7b953989
	.xword	0xdc13f786ef317a2b
	.xword	0x6a8dd89e499159f0
	.xword	0x507a13239240bb14
	.xword	0x9f41521e23b7f79f
	.xword	0xdaee062d8d9244be
	.xword	0x51b0b10b6c54266e
	.xword	0x131d143ec9ed653c
	.xword	0x4ade0a69e50b1a7d



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
	.xword	0x0b74db3d6d699d13
	.xword	0x6309bf3f7f907196
	.xword	0xf69c0bfb3cb41752
	.xword	0x7390d18ddaf42f18
	.xword	0xecc1d6aa9ec5e7af
	.xword	0x6819cebd96553134
	.xword	0x7c0d9ae68dd26beb
	.xword	0xef98f16da985ca98
	.xword	0xd96690ade6535f3b
	.xword	0x4e4ff8c7ea78f061
	.xword	0x35144029e811ea48
	.xword	0xa273ee1666c04a94
	.xword	0xb81e6da6b73e5855
	.xword	0x5dca82d24df888c4
	.xword	0xf481c0eff4d3343d
	.xword	0xdc7bfdef4ff3214d
	.xword	0x43e45696d301b260
	.xword	0x80cfc771074cac2e
	.xword	0x3d32de95224f9fd6
	.xword	0x61014a7c7ee846ad
	.xword	0x595c8569f911f8e4
	.xword	0xa2ea65e2a2abb685
	.xword	0x32d593b4eb133f58
	.xword	0x7438712e0c29f2b1
	.xword	0x983feefac25ce916
	.xword	0x2030f3b33a941ccd
	.xword	0x77dd18a1532e3449
	.xword	0x26c9aa0a30cf6f33
	.xword	0x02bdafed6b3076a1
	.xword	0x4107a1e28c8e2d42
	.xword	0x1ee1c9a316a1522d
	.xword	0x0cd225283dcef741
	.xword	0xa3e9c7e72fbe4fc1
	.xword	0x581d13310d410348
	.xword	0xa9e29cd698c1a47f
	.xword	0x76a40f640ffcd1a2
	.xword	0xa7ad7e97aa70c2a9
	.xword	0xdaa5178719bbabb8
	.xword	0xb8e9c5ce5839da03
	.xword	0xd5ad5fd4d80632ba
	.xword	0x1c651c9a7b3ed679
	.xword	0x19d06d12d3456a93
	.xword	0x52d865d05790b67f
	.xword	0x81b50e77b699da58
	.xword	0xd19c9360b8ce8add
	.xword	0x2def9fa38314608d
	.xword	0xabe6a7072c8f38eb
	.xword	0x94f977e8e301e0ba
	.xword	0x27bbd41391fa76bf
	.xword	0x9b1a0ac2577dd842
	.xword	0x687a30faf3086d4c
	.xword	0x728b96c89981f64c
	.xword	0xdda1776200315897
	.xword	0xaa4adf2a0591a90b
	.xword	0x821d338f46b52feb
	.xword	0x0aead7b4c1bcd513
	.xword	0xc60e3ff36de018ce
	.xword	0x54511011d3b8129d
	.xword	0x30d9c24e553a8398
	.xword	0x6d60b1c4461b4c3f
	.xword	0x5c33d4e5befddc71
	.xword	0x7cb7ec25278c0955
	.xword	0xf3fbea0c98cf44bb
	.xword	0x4ce65db31ab09616
	.xword	0x03a0ca9e20a5bfec
	.xword	0x33d55a38e6450d1a
	.xword	0xb3bf58f9bcf9c84f
	.xword	0xc7ca618ebb37fc68
	.xword	0xaa890e2c9297b0a2
	.xword	0x9837f81427aee833
	.xword	0x2103c55a82a36cbc
	.xword	0x85101e101ef5bfdf
	.xword	0x129b8042da646569
	.xword	0x552cc960316ab948
	.xword	0x6acfde3b074fa850
	.xword	0x4d8dafcb77be381b
	.xword	0x666784da16dba75b
	.xword	0x208aa2c741716bb1
	.xword	0x71572d405cac9df4
	.xword	0xba05be853feacc0c
	.xword	0x23c429470fd32783
	.xword	0x78bacdf02da9ed0d
	.xword	0x0bc8e01304c57d48
	.xword	0x15c564c9e9b32f6c
	.xword	0x297c9a738a236c31
	.xword	0xb37ef642b4dbcd9b
	.xword	0xefa0189db30dad79
	.xword	0x7e9c568b1cd54dbd
	.xword	0x7c46a9eefd06ca9a
	.xword	0x92b1f07b1f25a3fc
	.xword	0x46460f8d52e57385
	.xword	0x05aeaea5cb2d9109
	.xword	0x7210fa4ef0cbc1ca
	.xword	0xfe1d929664ccbeb1
	.xword	0xe715d90196ee0bd1
	.xword	0x370f58da3761e825
	.xword	0x0b1340ae65666042
	.xword	0xc4bf8927f7bf4bab
	.xword	0x9ae97c7a02fd1676
	.xword	0x2a6514e3959ff79e
	.xword	0xc65a2f3e382c9177
	.xword	0xfe5607b835eb4d52
	.xword	0x527d70630293fa8d
	.xword	0x85bbc26118159cc3
	.xword	0x49b5279c1a6e57b1
	.xword	0xa0fbd8df2a3aea34
	.xword	0x0b134129c2566b1d
	.xword	0x5d0c8cfd76670f6a
	.xword	0xe2764b6ff739dd8d
	.xword	0xf479dbc4ca3c05b5
	.xword	0x57644d02db59caf9
	.xword	0x31a985f0f248a46a
	.xword	0x7a7377c5adbdc5dd
	.xword	0x32950e6e96cb48a2
	.xword	0x2188bf82ce569073
	.xword	0xae73f1f0a2bd4d17
	.xword	0xe431a8a6c4725c31
	.xword	0xbfd568b38819d33a
	.xword	0xeaeaafc7a82cf145
	.xword	0x59e1fe8d172856a8
	.xword	0xcbc0e07e840def1b
	.xword	0x3c5b3cfd74d5cefe
	.xword	0x90fb4e7690745a00
	.xword	0xe240d0a8d03bcb34
	.xword	0x4a6ac0626f750c4f
	.xword	0xf4e3219af077e03c
	.xword	0x7e635a738234e7f1
	.xword	0x24b2bb8ecdefccb2
	.xword	0x262c12c2bb1c77dd
	.xword	0xcd68ae070731e1ef
	.xword	0x7a9da99c69a1176e
	.xword	0x5e52fc939504c464
	.xword	0xc93bba3d5528969a
	.xword	0x19dfb5bc51852160
	.xword	0xa6b47851854a9f1b
	.xword	0xf4caa2283db51166
	.xword	0x2b5200117e5560eb
	.xword	0x19caba222d108c65
	.xword	0x8d1c0a466dd179fd
	.xword	0x7e3e552a867e58be
	.xword	0x9bd2a6318978968f
	.xword	0x66743fef2260796f
	.xword	0x1e1e251b16b2b39b
	.xword	0xffcb6cd8f61f9020
	.xword	0x44ed3f202b11c5f8
	.xword	0xf47fc616b28216ea
	.xword	0x00bcf9b365853fd2
	.xword	0xe1c82bb9e322f52b
	.xword	0xca0e7983de460766
	.xword	0x4728612fc281ce0d
	.xword	0x77b8100c7d709dbb
	.xword	0x3739aabccaf40bb8
	.xword	0x68af5b146f0d2ec5
	.xword	0xf02bfa0c64f6c726
	.xword	0xfb23d817c33e9efc
	.xword	0x40d7fb205e0c1db5
	.xword	0xcdb200fe4891d0d2
	.xword	0x193eb5b0c370e7f0
	.xword	0x3abd4866b3590212
	.xword	0xc3cfa92e252d48b0
	.xword	0x010239705f6318b8
	.xword	0xe69e132f1ba6cbd6
	.xword	0x61ebcd6e116a9571
	.xword	0x8b727b7504d3830b
	.xword	0xb63894a9cc028dfd
	.xword	0x8b8c2fdf1e30879f
	.xword	0xa8c615292ba4b829
	.xword	0x377020ba00c79e9f
	.xword	0x4866fd33e2e1a195
	.xword	0xf9392cdfcf49f90b
	.xword	0x5ea7a40a9f282835
	.xword	0xfd07d956fd54909b
	.xword	0x1b29667bc3b403c1
	.xword	0xc20d0a91fc310516
	.xword	0x97917b08a4d95d4b
	.xword	0xf79bc9a39d2ed91b
	.xword	0x8ab3cf3994987ad5
	.xword	0x3ec882cba405fd92
	.xword	0x7cbbc5a57e497353
	.xword	0x3b942b9722731934
	.xword	0x1ebccee64eb79db6
	.xword	0xd10c891db74c4a7c
	.xword	0xa5d5b680165b3002
	.xword	0x9392739337668fab
	.xword	0x62a28a3b203ca70b
	.xword	0x003367a0cdd944ec
	.xword	0x0370d33dc02a41aa
	.xword	0x004b394aad6b74b4
	.xword	0xb859b47b2c88a666
	.xword	0xd89c21c52565c53b
	.xword	0x40ba12badaea05e3
	.xword	0x4380c1dc7e2e1381
	.xword	0x643ef808cc02aca1
	.xword	0xc475197e68685a99
	.xword	0x78b724a9bf95cd8f
	.xword	0x07c525d91ece5e60
	.xword	0xca953e4155421f2d
	.xword	0xf8945573f4584b54
	.xword	0x6162e898210bb67a
	.xword	0x04834ca8c3f0908c
	.xword	0xf1fc806e932cafcd
	.xword	0x6fcb968f23445230
	.xword	0xcea8fcf0d93c54d5
	.xword	0x6a7d33568819c4e9
	.xword	0xe7138188deefd07d
	.xword	0xe9e45ea4cc9e325f
	.xword	0x4e8773c1ee70c985
	.xword	0x57693e5963f6d214
	.xword	0x4e55cf4ec395ef58
	.xword	0xdd4c0d1e5f6230ff
	.xword	0xc84a34458f7af0eb
	.xword	0x0153c805f15cf092
	.xword	0x6e2826d5f6c51684
	.xword	0x8ef5d30c242dc155
	.xword	0x5f653845be663424
	.xword	0x703b0b7a42749759
	.xword	0x0586e4a4eeee7cb6
	.xword	0x5b1cecca0de42be1
	.xword	0xbf745947907d2130
	.xword	0xd4c8d27d3362c0cb
	.xword	0x5c0d72be1c3b1250
	.xword	0x334454cfc9e44e28
	.xword	0xed3664fc9c04645f
	.xword	0xd01d50665c98f5ad
	.xword	0x5ff73876d12bc836
	.xword	0x06daa93582557b97
	.xword	0xd0964d37da759753
	.xword	0x4473f9d8d65cde2b
	.xword	0xfe2a83a7c5a9a730
	.xword	0x91212983e00b5033
	.xword	0x42e00b2be3eabf15
	.xword	0x9422e155a76f5104
	.xword	0xcc836cb2845df018
	.xword	0x424ddc57c96a7578
	.xword	0xbc37856bb19ca283
	.xword	0x8b60cd4479a80a0c
	.xword	0x9a12eb46fe13eefc
	.xword	0x80707c3aa9b3bc39
	.xword	0x02b06fafbe3075a5
	.xword	0xffcbf0b23abb8c54
	.xword	0x623309f3456ff905
	.xword	0x28ec0c5154e9995c
	.xword	0xd28c03d410c3fa6b
	.xword	0xe425b4b180e3f040
	.xword	0x22a08121d3d93bf7
	.xword	0xf9586f0d983dd3bc
	.xword	0x0e26fac9f028ec2d
	.xword	0xb2d97f0fcdf340c2
	.xword	0x2c0e6445d0945bb4
	.xword	0xc66ab663fb943d47
	.xword	0xb1951faac540ca0b
	.xword	0xb66aea99996ae5a4
	.xword	0x6fcf722921cc5bbe
	.xword	0xca0616b007a40099
	.xword	0x57853bf16d1598f5
	.xword	0x497783cf5568ab3b



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
!!#   IJ_set_ropr_fld    ("diag.j", 247, ijdefault, Ft_Imm_Asi, "{16,17}");
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
!!# 		IJ_generate ("diag.j", 475, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr load alu store sjm4 sjm5
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 482, th_M, $2);
!!# 		IJ_generate ("diag.j", 483, th_M, $3);
!!# 		IJ_generate ("diag.j", 484, th_M, $4);
!!# 		!IJ_generate (th_M, $5);
!!# 		!IJ_generate (th_M, $6);
!!# 		!IJ_generate (th_M, $7);
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
!!#                    IJ_printf ("diag.j", 504, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 507, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 509, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 510, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 514, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 515, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 516, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 517, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 519, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 520, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 533, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 538, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 542, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 543, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 545, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 546, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 560, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 564, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 565, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 582, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 587, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 588, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 590, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 591, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 593, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 594, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 599, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 600, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 602, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 603, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 620, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 623, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 625, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 626, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 630, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 631, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 632, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 633, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 635, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 636, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 649, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 654, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 658, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 659, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 661, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 662, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 677, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 680, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 682, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 683, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 698, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 701, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 702, Rv_rand32);
!!#                          IJ_printf ("diag.j", 703, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 708, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 710, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 724, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 730, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 734, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 749, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 751, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 753, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 759, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 760, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 787, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 793, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 794, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 797, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 799, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 808, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 810, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 828, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 834, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 839, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 841, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 859, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 862, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 864, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 865, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 868, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 869, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 870, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 871, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 873, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 874, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 887, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 892, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 896, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 897, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 899, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 900, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 914, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 918, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 919, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 936, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 941, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 942, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 944, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 945, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 947, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 948, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 953, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 954, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 956, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 957, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 974, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 977, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 979, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 980, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 984, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 985, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 986, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 987, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 989, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 990, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1003, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1008, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1012, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1013, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1015, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1016, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1032, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1035, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1037, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1038, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1053, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1056, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1057, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1058, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1063, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1065, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1079, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1085, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1089, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1104, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1106, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1108, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1114, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1115, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1142, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1148, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1149, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1152, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1154, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1163, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1165, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1183, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1189, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1194, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1196, sjm_5, "\n");
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
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1221, Rv_jbi_fifo_wr0_config);
!!#                         IJ_update_rvar("diag.j", 1222, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1224, Rv_jbi_fifo_wr1_config);
!!#                         IJ_update_rvar("diag.j", 1225, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1234, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1236, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1237, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1238, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1239, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1240, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1241, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1242, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1243, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1244, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1245, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1246, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1247, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1248, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1249, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1250, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1251, th_M, "\n\n\n");
!!#                         }
!!# 
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                       IJ_printf ("diag.j", 1264, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
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
