// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_nc_all_token_rand_1.s
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
   random seed:	305516203
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

	setx 0x1e323cb5e849f002, %g1, %g0
	setx 0x4a3806a363b3f781, %g1, %g1
	setx 0xb028ff581ac85e61, %g1, %g2
	setx 0x2d1b8e3117289c63, %g1, %g3
	setx 0x60be3046bd786647, %g1, %g4
	setx 0xa90c3cd055c12567, %g1, %g5
	setx 0xb06ba45b3b5e551e, %g1, %g6
	setx 0x062bc1f6868e8970, %g1, %g7
	setx 0x27050f5dcbe44e20, %g1, %r16
	setx 0x7c41304dc16633df, %g1, %r17
	setx 0x284ca67b1a644e2f, %g1, %r18
	setx 0x1cfde366f6edaab6, %g1, %r19
	setx 0xf6700c58451a2d4f, %g1, %r20
	setx 0x8b7febfae7ecde99, %g1, %r21
	setx 0x70295f66b3af649f, %g1, %r22
	setx 0x6b57a1f639c31de0, %g1, %r23
	setx 0xa84a4e94b86a0309, %g1, %r24
	setx 0xb268bb6148a6439f, %g1, %r25
	setx 0x5ca839ec35e8fdc6, %g1, %r26
	setx 0x7646a0eeb57102aa, %g1, %r27
	setx 0xa6766984fee5072e, %g1, %r28
	setx 0x6c2e14c4497b2f59, %g1, %r29
	setx 0x93e8db763fbd2a1b, %g1, %r30
	setx 0x9219adb13da93410, %g1, %r31
	save
	setx 0x40169a898fbd256d, %g1, %r16
	setx 0xc38a2a5b86996ce1, %g1, %r17
	setx 0xcc5acca23f3cadbc, %g1, %r18
	setx 0x83b0ed799b2e2181, %g1, %r19
	setx 0x2e8e7ee4457b5a94, %g1, %r20
	setx 0x814a6520b1ceb55b, %g1, %r21
	setx 0x936bd981d810219e, %g1, %r22
	setx 0x91c5ab677b32db04, %g1, %r23
	setx 0x54d2a461eba4e8ce, %g1, %r24
	setx 0x922d0a179053a1d9, %g1, %r25
	setx 0x1d23733308463e9e, %g1, %r26
	setx 0xdaf2631934110c7f, %g1, %r27
	setx 0x99c6f70f59429990, %g1, %r28
	setx 0x3927a3d20247ba92, %g1, %r29
	setx 0xe96ab874836e1559, %g1, %r30
	setx 0xefa21514d5c6ecd0, %g1, %r31
	save
	setx 0x8b92e5eb671c5283, %g1, %r16
	setx 0xf0e41129587264f6, %g1, %r17
	setx 0x30fef34578499628, %g1, %r18
	setx 0xbd740e0362df0408, %g1, %r19
	setx 0x356bd2e90acdb7b9, %g1, %r20
	setx 0x651e1cea2655c453, %g1, %r21
	setx 0x7ca554c6aa86ee24, %g1, %r22
	setx 0xa9621383ea113b3d, %g1, %r23
	setx 0x6b27b3d8c019a85d, %g1, %r24
	setx 0x8b5ff6c0dde788d0, %g1, %r25
	setx 0xda201d9a0400f349, %g1, %r26
	setx 0xb5c1be89c6b3bbfb, %g1, %r27
	setx 0xdb939c2deb05a68d, %g1, %r28
	setx 0x61748de5ea9fb057, %g1, %r29
	setx 0x3a21ab4e00f65856, %g1, %r30
	setx 0xc7f0a956237c9d8a, %g1, %r31
	restore
	mov	0, %r8
	setx	0x0000000072206900, %r1, %r9
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
	.word 0xe811a020  ! 1: LDUH_I	lduh	[%r6 + 0x0020], %r20
	.word 0xa6098008  ! 2: AND_R	and 	%r6, %r8, %r19
	.word 0xec718008  ! 3: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe419a020  ! 7: LDD_I	ldd	[%r6 + 0x0020], %r18
	.word 0xaa01a038  ! 8: ADD_I	add 	%r6, 0x0038, %r21
	.word 0xe071a038  ! 9: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe4198008  ! 13: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa689a000  ! 14: ANDcc_I	andcc 	%r6, 0x0000, %r19
	.word 0xe071a000  ! 15: STX_I	stx	%r16, [%r6 + 0x0000]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe849a000  ! 19: LDSB_I	ldsb	[%r6 + 0x0000], %r20
	.word 0xa8b18008  ! 20: SUBCcc_R	orncc 	%r6, %r8, %r20
	.word 0xec218008  ! 21: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe051a000  ! 25: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xa089a020  ! 26: ANDcc_I	andcc 	%r6, 0x0020, %r16
	.word 0xec218008  ! 27: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe8518008  ! 31: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa211a020  ! 32: OR_I	or 	%r6, 0x0020, %r17
	.word 0xe8298008  ! 33: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe819a020  ! 37: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xac09a020  ! 38: AND_I	and 	%r6, 0x0020, %r22
	.word 0xe8318008  ! 39: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe4498008  ! 43: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa4a9a000  ! 44: ANDNcc_I	andncc 	%r6, 0x0000, %r18
	.word 0xe071a000  ! 45: STX_I	stx	%r16, [%r6 + 0x0000]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe809a000  ! 49: LDUB_I	ldub	[%r6 + 0x0000], %r20
	.word 0xa841a000  ! 50: ADDC_I	addc 	%r6, 0x0000, %r20
	.word 0xe429a000  ! 51: STB_I	stb	%r18, [%r6 + 0x0000]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe841a000  ! 55: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	.word 0xaea9a020  ! 56: ANDNcc_I	andncc 	%r6, 0x0020, %r23
	.word 0xe4298008  ! 57: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe0418008  ! 61: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa219a020  ! 62: XOR_I	xor 	%r6, 0x0020, %r17
	.word 0xe8218008  ! 63: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe4098008  ! 67: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa011a030  ! 68: OR_I	or 	%r6, 0x0030, %r16
	.word 0xe0298008  ! 69: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe0518008  ! 73: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xac09a038  ! 74: AND_I	and 	%r6, 0x0038, %r22
	.word 0xec71a038  ! 75: STX_I	stx	%r22, [%r6 + 0x0038]
	setx	0x000000800e000028, %r1, %r6
	.word 0xe8598008  ! 79: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xaea9a038  ! 80: ANDNcc_I	andncc 	%r6, 0x0038, %r23
	.word 0xe8218008  ! 81: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe041a038  ! 85: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xa4c1a038  ! 86: ADDCcc_I	addccc 	%r6, 0x0038, %r18
	.word 0xe0298008  ! 87: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000800e000020, %r1, %r6
	.word 0xec118008  ! 91: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xae398008  ! 92: XNOR_R	xnor 	%r6, %r8, %r23
	.word 0xe031a038  ! 93: STH_I	sth	%r16, [%r6 + 0x0038]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe001a038  ! 97: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xacb1a000  ! 98: ORNcc_I	orncc 	%r6, 0x0000, %r22
	.word 0xe071a000  ! 99: STX_I	stx	%r16, [%r6 + 0x0000]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe0598008  ! 103: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xae31a038  ! 104: SUBC_I	orn 	%r6, 0x0038, %r23
	.word 0xe031a038  ! 105: STH_I	sth	%r16, [%r6 + 0x0038]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe011a038  ! 109: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xa209a018  ! 110: AND_I	and 	%r6, 0x0018, %r17
	.word 0xe0218008  ! 111: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe8498008  ! 115: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa801a028  ! 116: ADD_I	add 	%r6, 0x0028, %r20
	.word 0xe0718008  ! 117: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xec418008  ! 121: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xac99a000  ! 122: XORcc_I	xorcc 	%r6, 0x0000, %r22
	.word 0xe0398008  ! 123: STD_R	std	%r16, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe419a000  ! 127: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xa281a028  ! 128: ADDcc_I	addcc 	%r6, 0x0028, %r17
	.word 0xe439a028  ! 129: STD_I	std	%r18, [%r6 + 0x0028]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe0098008  ! 133: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6018008  ! 134: ADD_R	add 	%r6, %r8, %r19
	.word 0xe0718008  ! 135: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xec01a028  ! 139: LDUW_I	lduw	[%r6 + 0x0028], %r22
	.word 0xa6118008  ! 140: OR_R	or 	%r6, %r8, %r19
	.word 0xe0218008  ! 141: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe0118008  ! 145: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa6b18008  ! 146: SUBCcc_R	orncc 	%r6, %r8, %r19
	.word 0xe821a028  ! 147: STW_I	stw	%r20, [%r6 + 0x0028]
	setx	0x000000800e000010, %r1, %r6
	.word 0xec098008  ! 151: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa631a010  ! 152: ORN_I	orn 	%r6, 0x0010, %r19
	.word 0xe0398008  ! 153: STD_R	std	%r16, [%r6 + %r8]
	setx	0x000000800e000000, %r1, %r6
	.word 0xe0518008  ! 157: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa2398008  ! 158: XNOR_R	xnor 	%r6, %r8, %r17
	.word 0xe831a010  ! 159: STH_I	sth	%r20, [%r6 + 0x0010]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe019a010  ! 163: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xaac1a010  ! 164: ADDCcc_I	addccc 	%r6, 0x0010, %r21
	.word 0xe431a010  ! 165: STH_I	sth	%r18, [%r6 + 0x0010]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe419a010  ! 169: LDD_I	ldd	[%r6 + 0x0010], %r18
	.word 0xa2818008  ! 170: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe839a010  ! 171: STD_I	std	%r20, [%r6 + 0x0010]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe4118008  ! 175: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xae01a038  ! 176: ADD_I	add 	%r6, 0x0038, %r23
	.word 0xe0398008  ! 177: STD_R	std	%r16, [%r6 + %r8]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe059a038  ! 181: LDX_I	ldx	[%r6 + 0x0038], %r16
	.word 0xa289a000  ! 182: ANDcc_I	andcc 	%r6, 0x0000, %r17
	.word 0xec29a000  ! 183: STB_I	stb	%r22, [%r6 + 0x0000]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe4518008  ! 187: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa099a000  ! 188: XORcc_I	xorcc 	%r6, 0x0000, %r16
	.word 0xec31a000  ! 189: STH_I	sth	%r22, [%r6 + 0x0000]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe8498008  ! 193: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa621a028  ! 194: SUB_I	sub 	%r6, 0x0028, %r19
	.word 0xe871a028  ! 195: STX_I	stx	%r20, [%r6 + 0x0028]
	setx	0x000000800e000028, %r1, %r6
	.word 0xe0118008  ! 199: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa8a18008  ! 200: SUBcc_R	subcc 	%r6, %r8, %r20
	.word 0xec21a028  ! 201: STW_I	stw	%r22, [%r6 + 0x0028]
	setx	0x000000800e000020, %r1, %r6
	.word 0xec418008  ! 205: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xa809a010  ! 206: AND_I	and 	%r6, 0x0010, %r20
	.word 0xe0718008  ! 207: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xe0518008  ! 211: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xaa318008  ! 212: ORN_R	orn 	%r6, %r8, %r21
	.word 0xec21a010  ! 213: STW_I	stw	%r22, [%r6 + 0x0010]
	setx	0x000000800e000010, %r1, %r6
	.word 0xec09a010  ! 217: LDUB_I	ldub	[%r6 + 0x0010], %r22
	.word 0xae318008  ! 218: ORN_R	orn 	%r6, %r8, %r23
	.word 0xe0218008  ! 219: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe011a010  ! 223: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xac31a038  ! 224: SUBC_I	orn 	%r6, 0x0038, %r22
	.word 0xe821a038  ! 225: STW_I	stw	%r20, [%r6 + 0x0038]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe041a038  ! 229: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xa201a010  ! 230: ADD_I	add 	%r6, 0x0010, %r17
	.word 0xe439a010  ! 231: STD_I	std	%r18, [%r6 + 0x0010]
	setx	0x000000800e000030, %r1, %r6
	.word 0xe459a010  ! 235: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xac318008  ! 236: ORN_R	orn 	%r6, %r8, %r22
	.word 0xe421a010  ! 237: STW_I	stw	%r18, [%r6 + 0x0010]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe451a010  ! 241: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xacb9a018  ! 242: XNORcc_I	xnorcc 	%r6, 0x0018, %r22
	.word 0xe0218008  ! 243: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x000000800e000010, %r1, %r6
	.word 0xe051a018  ! 247: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xa2a9a018  ! 248: ANDNcc_I	andncc 	%r6, 0x0018, %r17
	.word 0xe0398008  ! 249: STD_R	std	%r16, [%r6 + %r8]
	setx	0x000000800e000028, %r1, %r6
	.word 0xec518008  ! 253: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xa0818008  ! 254: ADDcc_R	addcc 	%r6, %r8, %r16
	.word 0xec218008  ! 255: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x000000800e000008, %r1, %r6
	.word 0xe001a018  ! 259: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xa639a008  ! 260: XNOR_I	xnor 	%r6, 0x0008, %r19
	.word 0xe839a008  ! 261: STD_I	std	%r20, [%r6 + 0x0008]
	setx	0x000000800e000038, %r1, %r6
	.word 0xe041a008  ! 265: LDSW_I	ldsw	[%r6 + 0x0008], %r16
	.word 0xa6c1a000  ! 266: ADDCcc_I	addccc 	%r6, 0x0000, %r19
	.word 0xe8318008  ! 267: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x000000800e000010, %r1, %r6
	.word 0xec418008  ! 271: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xaa418008  ! 272: ADDC_R	addc 	%r6, %r8, %r21
	.word 0xe4298008  ! 273: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x000000800e000018, %r1, %r6
	.word 0xec59a000  ! 277: LDX_I	ldx	[%r6 + 0x0000], %r22
	.word 0xa201a018  ! 278: ADD_I	add 	%r6, 0x0018, %r17
	.word 0xe031a018  ! 279: STH_I	sth	%r16, [%r6 + 0x0018]
	setx	0x000000800e000028, %r1, %r6
	.word 0xe041a018  ! 283: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xac11a018  ! 284: OR_I	or 	%r6, 0x0018, %r22
	.word 0xe031a018  ! 285: STH_I	sth	%r16, [%r6 + 0x0018]
	setx	0x000000800e000020, %r1, %r6
	.word 0xe011a018  ! 289: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xa629a010  ! 290: ANDN_I	andn 	%r6, 0x0010, %r19
	.word 0xe0718008  ! 291: STX_R	stx	%r16, [%r6 + %r8]
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
	.xword	0xd206f9690bc3a3cc
	.xword	0xc68411edb1d70533
	.xword	0xcdeda32d8e7d60fa
	.xword	0xa0c4d6c4131cb050
	.xword	0xe9e6798c9c10114a
	.xword	0x0a282d4593ce79c0
	.xword	0x3741ecfd17fad7c3
	.xword	0x6878870b41af886e
	.xword	0xb862a35bfb127585
	.xword	0x8b7bc4ba294b1248
	.xword	0xa5fd63fe34e354ff
	.xword	0xcda8af197d23f54d
	.xword	0xac3348eccf2362f9
	.xword	0x641187c232bfd11b
	.xword	0x4d3d707aff1774ea
	.xword	0xc51d8b773c017ccf
	.xword	0xb4a5bb572e9b4802
	.xword	0x559b2389c58f483f
	.xword	0x9c326f229a052ebd
	.xword	0xd8db466268c0bd08
	.xword	0xcdb01dfe8cc25624
	.xword	0x138cdd40267f04e4
	.xword	0xc072a2c54d7c9501
	.xword	0x72b8fd7566d322a4
	.xword	0xccb0c8c8b70fd803
	.xword	0xd9447000a8c2ade8
	.xword	0xb0f7be2b21896e6a
	.xword	0xa9280d4c39796b45
	.xword	0x19e7fcbf1f573ccf
	.xword	0x89409dd1a976aad8
	.xword	0x65dfd79e7a106da9
	.xword	0x23ec3b6593422dc3
	.xword	0xf490657b696dc888
	.xword	0xaf8fe0e27913c780
	.xword	0xd73841cc9b48889a
	.xword	0x449f7797270a7e6f
	.xword	0xc260fc0fb107f568
	.xword	0x05c65cfdb1599917
	.xword	0x102299efb3a8bafc
	.xword	0x27ec6bb8fff09a97
	.xword	0xac85a76f18ed691c
	.xword	0x46c015c5fa25c6d2
	.xword	0xe81c3e960398f4d7
	.xword	0x65cfd46f151e071a
	.xword	0xe5c32e641584dd5e
	.xword	0x7e7395b6381ad4a0
	.xword	0x4f2dffd7e42b9159
	.xword	0xd7daeb4843cd4c74
	.xword	0x9aa1dbee9964fee6
	.xword	0x49abd31e3bca989d
	.xword	0xf287ecf963a19b30
	.xword	0x5ca1374fccb76576
	.xword	0x74c0aab819004c52
	.xword	0x8aae365a903e1d6e
	.xword	0xa88ce68dc8fc1366
	.xword	0x8c4f3879f52c55a0
	.xword	0xaaa8c85be360c60d
	.xword	0xf8db3d6a3f26931b
	.xword	0x007695b5b0650f7e
	.xword	0x29ee13e3e1ddc11e
	.xword	0xeb2d7701d2908770
	.xword	0x41d9c5bd448fe66d
	.xword	0xe4d14ac333d2d633
	.xword	0x9604d63c109cd244
	.xword	0x0f05b8419fef281c
	.xword	0xfa1887b316010bb1
	.xword	0x52acfb9b724446ae
	.xword	0x82dfd0349818d603
	.xword	0xbeecc90ee954ada1
	.xword	0xfcff69f30628d5ff
	.xword	0x16ddecd218593744
	.xword	0x2eac5ffd2ea4007d
	.xword	0xd72545ee2a6e670c
	.xword	0x5ca7ff52fc829a8a
	.xword	0x93d5848a1be3d7da
	.xword	0x66d32bda36d53a3f
	.xword	0x41e996c8c2fd12b9
	.xword	0x85bb7f802220bd64
	.xword	0x029f8cca276231b0
	.xword	0xd2985d25631936f1
	.xword	0xdc66790319f33108
	.xword	0x9acff56208de0c64
	.xword	0xa3379458592cf682
	.xword	0xa1ec503f830d33d4
	.xword	0xf484c23e665df8f9
	.xword	0xe229d3f3984a2be4
	.xword	0xb7ba5e3cdc0f322e
	.xword	0x0a7c51340ac144ed
	.xword	0x835772b813396d10
	.xword	0xf908aec64bf8cb4a
	.xword	0x96b87f70801f581e
	.xword	0xe43a78098eebe40d
	.xword	0x83d59ed5e92a83fd
	.xword	0x6bca706c3cd6cddc
	.xword	0x51d3b7463534dd16
	.xword	0x98edf81bc7fbc8c0
	.xword	0xa18ef14ee2e5cd72
	.xword	0xa3c70c6ca26f8a06
	.xword	0xf4d6b04ed99d4373
	.xword	0x02e99e4cf8669858
	.xword	0x6fca606b22a503e2
	.xword	0xe85915cf94592d4e
	.xword	0xc82560e4eb2013fa
	.xword	0xe7a3bbfa155a870c
	.xword	0x9061a691a54ed788
	.xword	0x27263056fbf363b9
	.xword	0x164ac9d4ca7c1d56
	.xword	0x758b575c06fef963
	.xword	0xf43b68132d353f2c
	.xword	0xd856cb568a3da893
	.xword	0x03398d69e96ce5a5
	.xword	0xa7c790b3701da3cb
	.xword	0x94ab48df0a2f37d8
	.xword	0x767f75fb3c78b397
	.xword	0x657212608aa8d2be
	.xword	0x30b1d0522a4f3eb0
	.xword	0xc0c550509841ab7d
	.xword	0xf2d5cf9a599ad5ff
	.xword	0x2fce5c0d131af77c
	.xword	0x4383fa8717024da0
	.xword	0x9c3c5669dfe4cd00
	.xword	0xd7b8052e72f837b2
	.xword	0xfd089e234bfbb509
	.xword	0x00a78d8e6cc404bf
	.xword	0x474d00354fbd238e
	.xword	0x0d904f88dfdd0e57
	.xword	0x44c78af9a95337a1
	.xword	0xd9a0c159e837a32c
	.xword	0x4baca8b9c6aa3c83
	.xword	0xd66e18b6946f5f17
	.xword	0x3b3f8257652752a6
	.xword	0xbe33000378c17a80
	.xword	0x6f0d487edb16dd91
	.xword	0x66d0e8dbff0c6ac7
	.xword	0x2ee7e3d7aad8f474
	.xword	0x3b5262c8396bf729
	.xword	0x0359b27b21cc54d1
	.xword	0xa964476b5e82a8d2
	.xword	0x684ad8f2764739db
	.xword	0xe8c9a3ade50b5ad4
	.xword	0xcfff5dac95cd3c64
	.xword	0x9e932dd681d03efb
	.xword	0x6c987a24c5136f8c
	.xword	0x3ca87bc11781165a
	.xword	0xdfb87fe165f3f3a6
	.xword	0x7837b3fda6c17740
	.xword	0xff46857f4958b4fb
	.xword	0x76c91737eab05316
	.xword	0xc44af6f89980d178
	.xword	0x16bf5a0f156e589f
	.xword	0x75de99a44f5a65c3
	.xword	0xa3558d4468a06a25
	.xword	0xd11ec003ab772c1f
	.xword	0x63fd116fd49f380b
	.xword	0x3faaa8bc7a932772
	.xword	0x59d897d61cb3aa32
	.xword	0x85134d4b6819dc71
	.xword	0xa32fb371435e136c
	.xword	0x992858763a3b57dd
	.xword	0xcbee5fa0f1ef652a
	.xword	0x289b175ecfe49455
	.xword	0xd5c8c0aaadc797a3
	.xword	0xf628576fe504cd08
	.xword	0xae46456448271581
	.xword	0xaf90838503aff0e4
	.xword	0x6fcd7234bc107f02
	.xword	0x5c9e40c467db28d5
	.xword	0xe4ec25d39c9a61f8
	.xword	0x51bdb1e88ddd6694
	.xword	0x74833a855e3ee649
	.xword	0x3b33a21280169121
	.xword	0xdaf8da0ae6a588a1
	.xword	0x185260e58ac78771
	.xword	0x8c67caf8cafe7a0b
	.xword	0x09634edb28ce5680
	.xword	0x464e1e9aa965d13c
	.xword	0xb584ea57a5752905
	.xword	0xa1c3ae9941a3ebe3
	.xword	0x4b42bde6e3056792
	.xword	0xa4da67ec4fa1ca81
	.xword	0xb4a246f00338d0cb
	.xword	0xf46d2a2ca1a3dcd9
	.xword	0xf6f64c046fbb3ac5
	.xword	0x66f2cb37e02aaa6b
	.xword	0x91ce78a8cd6544fd
	.xword	0x35bddfd67d481b2c
	.xword	0x13e693de26767f12
	.xword	0xde766aacc0afb308
	.xword	0x8a38c845c1155084
	.xword	0x5527da9fcf09e3a5
	.xword	0xa987418b7c7b139d
	.xword	0xe242b52bab67e1ab
	.xword	0x3f934ba558fff0cc
	.xword	0xd1d583219c9e3559
	.xword	0x8bffa8fbfef00ac9
	.xword	0x708177022d01a90a
	.xword	0x55d74225dac99c84
	.xword	0xb1369f310b1d6fb7
	.xword	0x8bdbf47d815d333e
	.xword	0xdfeca7d46bf8a73b
	.xword	0x1bb91b0b95cfe6eb
	.xword	0x52d627ee257dd6c0
	.xword	0x93173db9f2d0c95f
	.xword	0x7c756d280f535f71
	.xword	0xe36928fce504891a
	.xword	0x464fe7651efaa0a2
	.xword	0xd8a2b5309c74af8f
	.xword	0xd2f0d26d5d033a02
	.xword	0xc1e70cbd7855a521
	.xword	0x869de1f6abe6e20f
	.xword	0xfa18c71dece57e46
	.xword	0xa5c47b95eb334383
	.xword	0xeab4971c3af4326c
	.xword	0x9a46feda989ebfa7
	.xword	0x6bd166f91c612cc6
	.xword	0x2f2c62e5e1c40056
	.xword	0xa1cdc4d187833f1e
	.xword	0x13a06028f42eadc4
	.xword	0xb698e429e594297f
	.xword	0x5edeb841878dc02b
	.xword	0x84c6325bf159d16b
	.xword	0x78f28ebb2dd9c12e
	.xword	0xc7203f9cf034cf9b
	.xword	0xf97affd4c99a133d
	.xword	0x3e2e39edf5ade1d8
	.xword	0xefbe42253d42ee01
	.xword	0xd4011caa00589978
	.xword	0xec5b022f3a02f0c2
	.xword	0xfe3dc4cae04db735
	.xword	0x6cf4a5be3e06e036
	.xword	0xcbdfb1a9b4f220f2
	.xword	0x1c92c9e6799e8037
	.xword	0x386c3107cbe4ea27
	.xword	0xc37993a820edc5f8
	.xword	0x8951b09b7dc9e4c2
	.xword	0x4ab20f476e854dbf
	.xword	0x3dbdc7689d93599c
	.xword	0x713d7af9bb25e224
	.xword	0x14e57e175a6d5eba
	.xword	0x7678418eb893b2d7
	.xword	0x4337c6ce5f812968
	.xword	0xa108ac2d35ff5e4e
	.xword	0xe543eb1ba8e3585e
	.xword	0x25ac466248813162
	.xword	0x4b0d15267203e0b5
	.xword	0xb7b08ff9084405dc
	.xword	0x64bcfae28add0e77
	.xword	0x38e9da6a2a1cc143
	.xword	0xda684f65e604f272
	.xword	0x3e4095fd8e79bf05
	.xword	0x32dd81e70b882254
	.xword	0x628c9ca1002458a9
	.xword	0x0ec7a818639d2b5a
	.xword	0xd3d25b03705f9467
	.xword	0xda4657830cba87b5
	.xword	0x1a9d34c6239d2cc0



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
	.xword	0xd0c76f637dd72eaa
	.xword	0x97f0c5a0ad34dca0
	.xword	0xab2d85b959edaac8
	.xword	0x36d225ebc8b88890
	.xword	0xc6b7f69f1ea965b0
	.xword	0xa7e48343d1966b6f
	.xword	0x3b1b463dd0b52e58
	.xword	0x17e562577d25b574
	.xword	0x0ac4e58eab93bff3
	.xword	0xcef8fb13a20c43bd
	.xword	0xd35149839cf216c6
	.xword	0x96b530aa7568270a
	.xword	0x3f094a174cbba74b
	.xword	0xd67b75164d7c1463
	.xword	0xece8ca4e5ba25357
	.xword	0xacd1bffbdf01ec2b
	.xword	0x71f9312934deb229
	.xword	0x2ff06449e5134c76
	.xword	0x344d40c6af4e1e59
	.xword	0x5ada84bf81eea2fb
	.xword	0xfba3164d2c719efb
	.xword	0xe88282340be65690
	.xword	0xb4d6ea414efb4a0b
	.xword	0x9e323e50535953ca
	.xword	0x008f79823d426740
	.xword	0x9da1417ffe94c3d8
	.xword	0xc31d46238d98d7f7
	.xword	0x852f86ed9a21f0a1
	.xword	0x99183dbfda97d274
	.xword	0x0b1ee2df4aa0a880
	.xword	0x83563126be480105
	.xword	0xf54521b9679e624c
	.xword	0x2a72787886b50262
	.xword	0xff0c28798056ff38
	.xword	0x899f01d076b12166
	.xword	0xb8fc00953c5aa7f0
	.xword	0x8ffe8d18ea1a9a51
	.xword	0x345611dba6893fb8
	.xword	0x4f5c3042a2abe39b
	.xword	0x2fa1927012b90021
	.xword	0xee46702a2318873c
	.xword	0xa700a841ecc1dad5
	.xword	0xb6e30e505072a821
	.xword	0x4b15b39270d998f2
	.xword	0x2135ddd4a9eadc98
	.xword	0x2a2271002a26baa5
	.xword	0xb37b354965431b03
	.xword	0x9d75062d6182777e
	.xword	0xf614e66c033a3d10
	.xword	0xc9181f43a21652aa
	.xword	0x0a69b0b79d39832b
	.xword	0x62be6f843a7f936b
	.xword	0x61f92eeb2b1781c0
	.xword	0xb49918e044f66ca7
	.xword	0x2e2a3b06e429331f
	.xword	0x018e7de5695eed75
	.xword	0x3cc1974bddd691ef
	.xword	0x486f056375b4af0b
	.xword	0xf5a0a33e25ee83ed
	.xword	0x6abb7e162d0364ac
	.xword	0x570a6277707bb51c
	.xword	0x8452bc12ed47dc22
	.xword	0x0b677169fb4d2fa7
	.xword	0x73fa6073d7b4258d
	.xword	0xb0cb820b3846b77b
	.xword	0x1a97c7e0789b2154
	.xword	0x9cb59989f0fb1a8f
	.xword	0x7d55d77a020b56d5
	.xword	0x08cee37c378b31f3
	.xword	0xd83a49da01a9cccf
	.xword	0x2bedd16aa71f17f2
	.xword	0x36ade5a3056b3bc7
	.xword	0xa06d3e83473382fc
	.xword	0xcd38ba65ea920866
	.xword	0x24667fb6495b5570
	.xword	0x971a26da734e7894
	.xword	0x48e2cfd70733e7ea
	.xword	0xf6998dc42cb9e8ec
	.xword	0xfb87f6793710bd68
	.xword	0xa76c0b3587a1ffec
	.xword	0x4dd8090729b86abe
	.xword	0x6c1a55fdd7b2cd5a
	.xword	0x7d8d37e6f49a1431
	.xword	0x7e9a7cee21564cd0
	.xword	0xc57249f3d2c9294a
	.xword	0x13f9904fc81213ce
	.xword	0x3cd2de779598fb8b
	.xword	0xe728610d1f55f973
	.xword	0xf29c406ca545e03a
	.xword	0x14feb006165831ee
	.xword	0xfb4bed7fcaff1aa8
	.xword	0xf580fee600b043dc
	.xword	0x0f725fbf2564b934
	.xword	0xed8d55ec9ead8a84
	.xword	0x4b43b6bf7cb18581
	.xword	0x429b55b562f450de
	.xword	0x9fa90b60f427609c
	.xword	0x918fc96afa777ef1
	.xword	0x8f772b2cbee80b9e
	.xword	0xbe98afc2ea734be6
	.xword	0xa870ff743adde856
	.xword	0xe655a08c9d8524a6
	.xword	0xe0fc4d68be948770
	.xword	0x8d1f75db3fa6ddd9
	.xword	0x3a0b371084dab7aa
	.xword	0xe459a3cda8c035ba
	.xword	0x7161cf4690da4f89
	.xword	0x272281790027bd4e
	.xword	0xd0940ab01fafe087
	.xword	0x4877b5ec27e6a012
	.xword	0x3dc09415d848d6cb
	.xword	0x91c3e7d17c624ebc
	.xword	0xf37b577971c61322
	.xword	0x535a03f32d972011
	.xword	0xe7866ffe1fff412e
	.xword	0xf9956595134b89e8
	.xword	0xccd750d65a7a4efc
	.xword	0xc233110d7ce1edda
	.xword	0xea7a41538666b6d5
	.xword	0xfe9716fc7c3ee850
	.xword	0xe97d654725f60378
	.xword	0x18a976a6156ee656
	.xword	0x87888a91fd66c713
	.xword	0x0ef0056bb37d17db
	.xword	0x23f3d1553a914a6a
	.xword	0xe6da2c66379dcede
	.xword	0xefc39f7e9e24e87e
	.xword	0x5e7ce9adc23cba95
	.xword	0x7a37aba623d5915c
	.xword	0xb39d312cd7feb63b
	.xword	0xf5e365b10c9811f2
	.xword	0x4a0ce513938e9ed4
	.xword	0xa7236b5d37d64db2
	.xword	0x2fe93e41c4088a96
	.xword	0xc2b9699b65c5c6db
	.xword	0x502d9c390b368c75
	.xword	0xbe9c447bc7c7f762
	.xword	0xc974b7099fa438b3
	.xword	0x276d4842c6ac7248
	.xword	0x9fa5aa6ef94ac2b2
	.xword	0x6689aabe8eca5277
	.xword	0x4872abc9e722931f
	.xword	0xc9201870deebbf2a
	.xword	0xa3efaf36566d7448
	.xword	0xd318795e2b012fce
	.xword	0x03039c9c7a60bf14
	.xword	0xeb1e0244665f8114
	.xword	0xab4dfb0184e3dc17
	.xword	0xad9e30645af4c70d
	.xword	0x70f734e225f163b6
	.xword	0xd169fe6e30a53e3e
	.xword	0xb849fbe9a5e62996
	.xword	0x4c63d94fd0d8822e
	.xword	0x0f366a4ff1f19824
	.xword	0x4fdf1357f112e1dc
	.xword	0xef10a8c869c3c95e
	.xword	0xc88fd9fc01ef0b16
	.xword	0x231e2a753df88d2c
	.xword	0x4c65c8e20720f8fe
	.xword	0xc4137f9f46b0929f
	.xword	0x3a1becea3a085263
	.xword	0x2e6aaef805828574
	.xword	0xc844d49fb4a4d0f9
	.xword	0x94ff68deda525df8
	.xword	0xb79d2c11fbb4a956
	.xword	0x94f59e0b0d6070ad
	.xword	0x64f349ae4585d2f5
	.xword	0x9feb50b9653ad146
	.xword	0xc589f1438bef58a6
	.xword	0xd8673cf68e5e52e3
	.xword	0x3b0627aac6d5b2af
	.xword	0xd39fcd9a322c042d
	.xword	0x8a4455aa9885b4ff
	.xword	0xfc081145e7fd8f24
	.xword	0xef6feb08b00eb400
	.xword	0x0a9b039f2c6ab7dc
	.xword	0xa9421bc09b50a87f
	.xword	0x1285d084ae41e13d
	.xword	0xa5491695911dcd7b
	.xword	0xc0b84bcb2d6fe728
	.xword	0x14d64aec79609a4f
	.xword	0x860441becf45cf28
	.xword	0x45850ba7a4d9acf5
	.xword	0x28b22926aeec4dd2
	.xword	0x3bfdedf00339d7b5
	.xword	0x07120807a71e0526
	.xword	0x3371cd3e3dd31795
	.xword	0xfe30c060e5de5f83
	.xword	0x460d69f60bfd21f0
	.xword	0xafa64f3829caec51
	.xword	0xa2b3f14372b16100
	.xword	0xba06a89f46f2d0da
	.xword	0xa6f40f8630e586d4
	.xword	0x32a1bfc0a55e85e3
	.xword	0x9b5cc4546d4711fc
	.xword	0xfac01f107fa4202e
	.xword	0x524e020fc6341273
	.xword	0x626ec0eccc9157e3
	.xword	0x67534ba9e6217493
	.xword	0x56bc512c24404f52
	.xword	0x17d4c57a84947a86
	.xword	0x7d70669a2ceef69f
	.xword	0xeabf0d28fc9e3515
	.xword	0x7a66fb4b65341ba3
	.xword	0xb16c586c5fb511e6
	.xword	0x4af44b01098f46b8
	.xword	0x99edce6a60b2cc0c
	.xword	0xb5b848f8a543e19e
	.xword	0x15b5ca81c8c50386
	.xword	0x2edfb966cb85f68c
	.xword	0xdd3c904b1cb773ac
	.xword	0x58e279d788ecdea1
	.xword	0xea8ecdd2d7705552
	.xword	0x7575a21e36cda24c
	.xword	0x6d10e08f323874e9
	.xword	0x0a564cb2463ad1b1
	.xword	0xcff6a6380f32f9e2
	.xword	0xbee6b06ed100b577
	.xword	0xca94327ad5c95d3f
	.xword	0xa5e5b6c25b9d2747
	.xword	0x0363fef18e1c9189
	.xword	0xd7ef9de75b287d06
	.xword	0x365ab183f8b5c174
	.xword	0xd771c5fd86854133
	.xword	0xce54b81dfd880207
	.xword	0x3c10432e2f094933
	.xword	0xb5d18524e871b9d7
	.xword	0x1010efbf95e571c4
	.xword	0xd2958247942c5fca
	.xword	0x08187150c608e628
	.xword	0x1b1faa8bb5589cc2
	.xword	0x612c07f0f5edc7aa
	.xword	0x92755b3e35d95890
	.xword	0x6031b0446531d81b
	.xword	0x06cc6956f6e67d1b
	.xword	0x8df55e93dc52479f
	.xword	0x58ce35d85b7ef245
	.xword	0x8d9c3cfeec5debd5
	.xword	0xcd0bb7adef8da422
	.xword	0x039ffeadc4df927b
	.xword	0x0f3fbbff504c4ecd
	.xword	0x5c85d62e6be26a17
	.xword	0x127aaa49e3037c7e
	.xword	0xd1c12fa735f8407b
	.xword	0x2fff69ff9398279e
	.xword	0x69a76fa162a0c4f7
	.xword	0x6df7ff306f91f829
	.xword	0xb00adcaa7c31bc66
	.xword	0x487febc3910250ba
	.xword	0xc61e783792bd18e9
	.xword	0x6c383b86fad52b77
	.xword	0x220e19d22fdd86de
	.xword	0x0390c75ba20610d4
	.xword	0x2e6f30fb7f45f578
	.xword	0x0494a838ccaea954
	.xword	0xe14ce7da6b999c46



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
	.xword	0x000a3156b9e35955
	.xword	0x87bb92617018940d
	.xword	0xad3b65ff06ed0d83
	.xword	0xc12b8e665f962c2f
	.xword	0x5046512f99ebcc95
	.xword	0x89b9e66cfa486abf
	.xword	0x1464f85d9801ca1c
	.xword	0x53bb37d116542153
	.xword	0x6c637421fa35bee7
	.xword	0x8467a088485c26b1
	.xword	0x1fa6239e4bb28c7f
	.xword	0x23dca9750467b23d
	.xword	0x3ff8a3748d4f98d5
	.xword	0x05654f81ccb4e162
	.xword	0x91de665fb1cfbc1a
	.xword	0x605fa3cd1ac93039
	.xword	0x399dadb2612db6a4
	.xword	0x8ad89b383136dfb3
	.xword	0x970c7b7743bc0e4d
	.xword	0x7712719021f22fd2
	.xword	0x9a1f47fd19720db7
	.xword	0x183faf16c1a8ebf9
	.xword	0x5626155e6b6ed647
	.xword	0xfb92e1b96f070159
	.xword	0xed779b4a2ebfe67c
	.xword	0xeb946c793b4c0b8e
	.xword	0xf0769bdea00424c8
	.xword	0x47e67fed4119674a
	.xword	0xa34b93b36dd12c88
	.xword	0x9090d28741f38d80
	.xword	0xecb73a22f413fc5a
	.xword	0x622039aa0ac70034
	.xword	0x55035087d20f4e1a
	.xword	0xf6a376302abd0dfb
	.xword	0x2329154541ae5f7d
	.xword	0x25718894d0968d3b
	.xword	0x91df81da6b2447d1
	.xword	0x761463c60ff5a9a0
	.xword	0xb1963d2ea079c847
	.xword	0x6e85aa9903e869f3
	.xword	0x7dbaa03eef285fa0
	.xword	0xc8d90c9832028c9c
	.xword	0xe5ec85a32679cf3e
	.xword	0x57fe27dd0f167b7c
	.xword	0x43484fd66cb33bd0
	.xword	0xc1f6cec2f9eea9d8
	.xword	0x3c2125cb4536222a
	.xword	0xb045c9b9f0b1d73a
	.xword	0xfd5ee0f54551175f
	.xword	0x165f1ca564367fb1
	.xword	0xae2254c82ce627c8
	.xword	0xa53f28cd53b1a0ba
	.xword	0x9f10beafcee30d1a
	.xword	0x13ac4f466a599653
	.xword	0xb1a432e175a3be59
	.xword	0x3ff291b0b717c19b
	.xword	0xba1b0cd5b3e91680
	.xword	0x81c8ea50c0e509c8
	.xword	0x51b93f02d045aeed
	.xword	0x8395da38bebaa0df
	.xword	0x2843cc0be75d7c0c
	.xword	0x01cff987c373f4b0
	.xword	0x8022351ea8c8dc91
	.xword	0xa6d7bb96d3e0854a
	.xword	0x015bf15f50489316
	.xword	0x885d9af8c621e169
	.xword	0xd5997203539e44d3
	.xword	0x3fed134dc2b66cb1
	.xword	0x1695a1416c4ed596
	.xword	0xa9aa78a34f3c2c62
	.xword	0x258496d1f7cf70c5
	.xword	0xe764936e7f291729
	.xword	0xbe68a20339635931
	.xword	0x257efbcfd5e51dca
	.xword	0xc009584d1b29fc40
	.xword	0x41dcc07dd309eada
	.xword	0xee22b4374899ede8
	.xword	0x48279d8656f75c7e
	.xword	0x1b493b8ab7ca1412
	.xword	0xb681486a5a9351f1
	.xword	0x3dc77b040a718837
	.xword	0xaf4c467eed02bd44
	.xword	0x33eaabdb092a9255
	.xword	0x1ea7e481fe91bfa2
	.xword	0xc1d335eb2b1ee037
	.xword	0x68be555f51454d15
	.xword	0x35a6875d4821bcfe
	.xword	0x6bdefc7475297be6
	.xword	0xad72309695a81dbd
	.xword	0xd7e828b7941d9b41
	.xword	0xc73ac8fd59461bbb
	.xword	0x854ca1412f8dde65
	.xword	0x849573cf39a8aae6
	.xword	0x4c68d5990b3e16d6
	.xword	0xb829ee50cc335348
	.xword	0x8942b466ef782a3d
	.xword	0xd9778e529150948c
	.xword	0xe35f9e9868817381
	.xword	0xbcdf7184201be574
	.xword	0x30861a659d215357
	.xword	0xe8f564104e69e9db
	.xword	0x5274c3fbe593f763
	.xword	0x47210604bda52efc
	.xword	0x5b9e9cb51ae093b8
	.xword	0x831cb02c3d05cb5a
	.xword	0x0253728eba3250a7
	.xword	0x54e8fe27c6f2284e
	.xword	0x60cae193c497bd7e
	.xword	0x263621253e054a88
	.xword	0x6d7d245e2745ce21
	.xword	0x4c22b65f51508f1a
	.xword	0xb507b650dc499d1b
	.xword	0x0c4f3959056031db
	.xword	0xb38d7779da2d67f0
	.xword	0xede1d55b9c0c62c9
	.xword	0xe249f6f1e5114413
	.xword	0xa8c9b22905851435
	.xword	0x7eab6725743e5b87
	.xword	0xa530ff2ca5df8903
	.xword	0xc4f8254b735b851d
	.xword	0x9bc4502cffd4aec7
	.xword	0x417c0f387c3bffee
	.xword	0x7dbd762ab608607c
	.xword	0x32f5c46435da8f6d
	.xword	0xa082b5586b3c59e4
	.xword	0x1af161980726e650
	.xword	0xf990c252d002497e
	.xword	0x435f9f291924e9e2
	.xword	0x9fcee7def5779ac8
	.xword	0x47ae531fa6caa65e
	.xword	0x5d78a675b4d3ca07
	.xword	0x193d2fff2ea091e4
	.xword	0xb7fdd343614ceadf
	.xword	0xf77c88e4c3fbbe3b
	.xword	0x56436d89fb915a11
	.xword	0xb999abec2d6ecb53
	.xword	0x20b1064dca333dff
	.xword	0xe06de8ce64b1eaa8
	.xword	0xfa0420b1427cc0f3
	.xword	0x802397071e05ce82
	.xword	0x32415f878ad7f2bc
	.xword	0x4499f2a27dc10e55
	.xword	0xc29eac697ed32adb
	.xword	0x3c324220cbfd9682
	.xword	0xce45f637c0d0647e
	.xword	0x59a7c1cffa4e05b1
	.xword	0x7aed298404ba7a44
	.xword	0x9bf03838afa5b845
	.xword	0xd76256cf108bfc63
	.xword	0xfceb364553e999d3
	.xword	0x15467485b0feda54
	.xword	0x6f452d0a18fb7322
	.xword	0x4433dce3e6b0939e
	.xword	0x981a950c51215ec7
	.xword	0xd56d965f079f10ef
	.xword	0xc95c6e7334c843c2
	.xword	0x1caa64ba991e54e0
	.xword	0x1be5ac1019a3d34d
	.xword	0xde368e895f7ba637
	.xword	0xb591fb589142fe19
	.xword	0x50713119acfbc05c
	.xword	0x0e6f15aadda8156a
	.xword	0xf5d854d5fedd7102
	.xword	0x615343047e589dfb
	.xword	0x257e405a20d0023f
	.xword	0x5e4b8bac7d9b324a
	.xword	0xebc1f32f69bd14c1
	.xword	0x3df3ba96d8bc971c
	.xword	0x119ca828e16e50ee
	.xword	0x246b373a2764af53
	.xword	0xe932f4f5020f29a8
	.xword	0x1400f510e44fab28
	.xword	0xdbded92012dd9f2c
	.xword	0xd1060c1569da930d
	.xword	0xff6196480cf70075
	.xword	0x70ff64d53e834e3a
	.xword	0x21416251daaa008b
	.xword	0x5a698950d7b30f54
	.xword	0x90734c0ff6ed3cac
	.xword	0xb88d469195a0228e
	.xword	0xce596e30b0102cb2
	.xword	0xc6fe643e272782ca
	.xword	0xcced7077494e49d8
	.xword	0xd810016f526c9514
	.xword	0xdf09db538594e3e4
	.xword	0xf80acbef579b0f6b
	.xword	0xaf82074723f55b14
	.xword	0x3c295a3295850100
	.xword	0x69560016ffbea955
	.xword	0x4a81453a08c26883
	.xword	0x6fcf2b73c8bed0a0
	.xword	0x909648dd54667dd1
	.xword	0x4299e6834d8dedbc
	.xword	0xb6c6ed7f28bf8595
	.xword	0x4943c321058fc167
	.xword	0x182b8d065326356f
	.xword	0x44e0115f2d6c5aaf
	.xword	0x795d70642540d70c
	.xword	0x6d34c192d69c5616
	.xword	0x1393f7bb8a5ae644
	.xword	0x764de67f42c2c4fc
	.xword	0x09313ab2b2449be3
	.xword	0x45bad94e75a27c5d
	.xword	0x49beb2706a2647d3
	.xword	0xebbbe106a4866f93
	.xword	0xd3390881955f1c83
	.xword	0x8edac07e4a5610f4
	.xword	0x336f65b8dea0fd6c
	.xword	0x29739d2e5b34103c
	.xword	0xaf4da0a3b7819127
	.xword	0x43102cbe098fe493
	.xword	0xa1eed625206948ce
	.xword	0x6f0d2b10d92ad95d
	.xword	0x07722bdf9ede2fb1
	.xword	0x7a7b08f73bb54388
	.xword	0x0223bb94d9a06a5c
	.xword	0xe13aa64753614aab
	.xword	0xf2966a145905e743
	.xword	0x8226d6f838cc24ec
	.xword	0x01abababd047a528
	.xword	0x5ef91f0dac05c5e4
	.xword	0xdba463865a575a56
	.xword	0x0bc7f2ac0adcd2d2
	.xword	0xa58d1c509c4f6465
	.xword	0xf465e4f43a5ecc24
	.xword	0xe05f61bc180bb96c
	.xword	0x804b891a77eff85f
	.xword	0xd35967fd9d4917b9
	.xword	0x558c4414fd0a5d03
	.xword	0x3272b0fbfe3c9ae3
	.xword	0x35a76c868002ec52
	.xword	0x8e2ba09c2085836a
	.xword	0x0adb68b6033116a7
	.xword	0xb832d2d92c1e4bd0
	.xword	0x1860a05256f344e6
	.xword	0xcda945a95717c636
	.xword	0xc28f9456b952a2bc
	.xword	0x4c54464b6f6b974d
	.xword	0xcacffe563495b88f
	.xword	0xa49f9b60f4041c66
	.xword	0xb3d6ef26948694fe
	.xword	0x601fbf284976f86c
	.xword	0x97216ce2e7fd0043
	.xword	0x5172eadbfc29f9e8
	.xword	0xe70b913832711242
	.xword	0x11b317ad490f5f61
	.xword	0x5de8e79a2d26f217
	.xword	0x57c5daea4e24651f
	.xword	0xd1ebd83e1f282a4d
	.xword	0x425c513308bfd7f0
	.xword	0x6550b1c30a5a2f65
	.xword	0x5c9532f6f56ffd20
	.xword	0x5125556a4bde557f
	.xword	0xf122359c85e13bda
	.xword	0xebe75a098dac7ecf
	.xword	0x91e40001b082ecb5



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
	.xword	0x301fca0616257fc8
	.xword	0xd8198aed111e846c
	.xword	0xcf99dfe3adc7d883
	.xword	0x43f67686d36e584b
	.xword	0x41d495ca274def45
	.xword	0x34ffaf1144168853
	.xword	0xc698d71f76f9d09c
	.xword	0xd598549b53298f9e
	.xword	0xbde3e26c6e149e6a
	.xword	0xd1298b56de0a84c4
	.xword	0x0059ed8d30c77423
	.xword	0xe533cbf323c57b52
	.xword	0x3fb5b8de18bc60e9
	.xword	0xd5df08b46919c334
	.xword	0xd9fee9b519fcc59c
	.xword	0x36903be2ce6cd0af
	.xword	0x6c2dacf9bcd6e076
	.xword	0xdabdb5673c4aca9d
	.xword	0xfb2cdd030c1ac11b
	.xword	0xc81396339532a24a
	.xword	0x828ce66dc4962c73
	.xword	0x56a44aa74033ad6d
	.xword	0x234aafa939176dd6
	.xword	0x768f7ca40510afda
	.xword	0x16e0087f433a0497
	.xword	0x41c00ee9b37d8cde
	.xword	0x37e44d622078c5ca
	.xword	0x915130b24123abcc
	.xword	0x56495f8edb5c7dc8
	.xword	0x97a2f7e6f15bd8dc
	.xword	0x85e5214715ab73d0
	.xword	0xb0f9221cb1703050
	.xword	0xae3795ae33fe7f1a
	.xword	0xd000262a3c85115e
	.xword	0x294ada4b63d0e595
	.xword	0xf5228fc75e3d7666
	.xword	0x198bc993f20a76bb
	.xword	0x64ce46b4da9a98c3
	.xword	0x13bc8a58bdd959db
	.xword	0xdf5e8a69f6a142a8
	.xword	0x5fc88560035b26fe
	.xword	0x6f6ab2de5857ce22
	.xword	0xa7a20bf7f5a61b5d
	.xword	0x74f6382adb99b504
	.xword	0x14a4dfc310e452d8
	.xword	0xc1ec990c19589cdd
	.xword	0xf9aefdacbf40ae9a
	.xword	0x66f8d0b70097b9d6
	.xword	0x0d9d7f0fad0d87ba
	.xword	0xbabb0f04eb274f5c
	.xword	0x80d0fda3e04c85d4
	.xword	0x738831da7aa54067
	.xword	0xf2579f4399832da1
	.xword	0xfd5ddca66ac38890
	.xword	0x6b6854c0619e8427
	.xword	0x3a56c9c53d3e2575
	.xword	0x76ac6f206057ee90
	.xword	0xceea24495da0a12c
	.xword	0x13750b36d8796ee7
	.xword	0x58a8e5d1275df8fd
	.xword	0x961e1428742fee95
	.xword	0xfd41a9e1802cb5fb
	.xword	0x04828ccd474bc61a
	.xword	0x1c75179b4cb88cc6
	.xword	0xbbe290a2868f7eab
	.xword	0x84dd45f7cd20b30e
	.xword	0xdc9ade0f282c71ca
	.xword	0x84d893c4846da97f
	.xword	0x121ac753864004b8
	.xword	0xf044b892d3e58c67
	.xword	0xe83d5c782cf7adbf
	.xword	0x76b667c379a7c21b
	.xword	0x976e01ad4cf36459
	.xword	0x830ba7e4b78e6c12
	.xword	0x7f7a101c9b96ecbf
	.xword	0x6c2eeaeba75c3675
	.xword	0xf437427f7df4808c
	.xword	0x36d87a9e16a73eac
	.xword	0xed46d9dfa9cb7a4f
	.xword	0xd2f034517f1b4c3a
	.xword	0xbf42094ed460ba9d
	.xword	0x30238a5d1b3fa8d9
	.xword	0x4c0afb931a6e57bf
	.xword	0x44c0daebde8c5f8e
	.xword	0x89906a353f6a86e9
	.xword	0x868069477741e213
	.xword	0xfe6fdc1e7ef314cf
	.xword	0xed4f464cb6f22d5d
	.xword	0xb0d8b6204a5ecbd6
	.xword	0x1dfd03b4b5060282
	.xword	0xf783356d9edaeefd
	.xword	0x90b8a7523001636c
	.xword	0x480bc5e83640955d
	.xword	0xf136deef1b7bf88a
	.xword	0xe05a8d59f333e87c
	.xword	0x1a0bcb9b25028bca
	.xword	0xada4a5779f6077b7
	.xword	0xf1fffbf7ad43ba9d
	.xword	0xef0d2beb998e29a6
	.xword	0x891b8eee3fce6f20
	.xword	0xe4cc211a349544b5
	.xword	0x977bb68ee93d055d
	.xword	0x01690f32feaab792
	.xword	0xaced762801c70c9b
	.xword	0x99624cafbc4e8b27
	.xword	0xeb1b868b87f0bc7d
	.xword	0x949764616dafd679
	.xword	0xb3de6c59d96feafb
	.xword	0x08591f2be570403b
	.xword	0x308497e26622bc00
	.xword	0xa98e27368c973903
	.xword	0x7f2043fbb321d1e8
	.xword	0x20bf66228e4e6a99
	.xword	0x9fae91dbb535c8c2
	.xword	0xdbaaa4a532c313d1
	.xword	0xd854d5a2cae165d9
	.xword	0xe89511d416942840
	.xword	0x329d7bc41c13a75e
	.xword	0xb71e7bf6812fffa8
	.xword	0x203a35f39dc3df0b
	.xword	0x72de189b1e59819a
	.xword	0x2ad5d53169e3bb01
	.xword	0xba6c2b049affaa8e
	.xword	0xd4164c383a13ac14
	.xword	0x15b2f2c08083cbf8
	.xword	0xd141348cce0efe4f
	.xword	0xbf3263cf2fad8f78
	.xword	0xf183a79fe3ba47a3
	.xword	0x44724b08b13544c3
	.xword	0x604c643146e165be
	.xword	0xedc7e2acc4dce5af
	.xword	0x43450ffc9c344178
	.xword	0x814e8251b489fa8a
	.xword	0x511c9ebcfa2bf45e
	.xword	0xda997d66cfceca1b
	.xword	0x97b2281dbe43c30c
	.xword	0xb0bf85184dc63b85
	.xword	0xf52503d72029c83d
	.xword	0x168c3ed2dbd86fa6
	.xword	0xace3aeedb16000a3
	.xword	0x9a47d89d78d91d50
	.xword	0x6bd8e682013be3ec
	.xword	0x87292319cacf4a3f
	.xword	0x17999e2ba9f58458
	.xword	0xd8d75e66b4540844
	.xword	0xbae12366cb8d9a5c
	.xword	0x76750b5621db13f4
	.xword	0xd22eac4f2b3edfab
	.xword	0x2b13dfe4528e804e
	.xword	0x107171b79507c981
	.xword	0x060fedfdde50ebff
	.xword	0xff2549ce2e47e6ff
	.xword	0x8ff241e736f55dca
	.xword	0x6f931596a9930446
	.xword	0x232f6b8edde73137
	.xword	0x27d6a041b57019b9
	.xword	0xc6ec2626c820f755
	.xword	0xd3c4cfe67859772b
	.xword	0xe02504fbca85e922
	.xword	0xfc6cfff5a07d855e
	.xword	0xb488827283c3e075
	.xword	0x28fa617fc8b7122a
	.xword	0x1f7d584df4361de9
	.xword	0x318d6d155c56b5ba
	.xword	0xe2cafe3c52830c7b
	.xword	0xf64e7d6d4a97e75b
	.xword	0xbcfd2933b90e2295
	.xword	0xe1e5be73233bc367
	.xword	0x99b4b0aabb080f5e
	.xword	0x461923205c46aa88
	.xword	0x5deb3d06ead477d2
	.xword	0x6b31869e92669284
	.xword	0x78529e46fcab4d5c
	.xword	0x7819411b900bb598
	.xword	0xa98d9689bf055725
	.xword	0x429084fd21c49752
	.xword	0x8ac42f53a6f514f4
	.xword	0x6e31eed10f700e76
	.xword	0x9f5f46e5f1963c7d
	.xword	0x8b823afe8c4b5ffa
	.xword	0xeb9fe278b0aca004
	.xword	0x5c43ca6ce3173c25
	.xword	0x914f3d63f8944663
	.xword	0xbf0c3f2ed616012e
	.xword	0xa34cbf77605780af
	.xword	0x80e3647528e6372b
	.xword	0xc78a3dbef25a6536
	.xword	0x8a8bc8cd552b38f4
	.xword	0xea9fcedb74db15a6
	.xword	0x03944063a41b1786
	.xword	0x477047193a42d563
	.xword	0x0d239063d01f52ba
	.xword	0x7355354da5e91081
	.xword	0xd061879405c481cc
	.xword	0x10d4f451bc5ce8d3
	.xword	0x4d80c370c269ddc8
	.xword	0x165684ccbfeae962
	.xword	0xa497bc2305909f50
	.xword	0xd22f6c03b9be0516
	.xword	0x68073bb37e944d6c
	.xword	0xed22ce5946610563
	.xword	0x5ec002079c7129de
	.xword	0x563a29ed7d29a5ec
	.xword	0x93ff1b4bbbadb20f
	.xword	0x7144fc4ab0d5b58e
	.xword	0xd7ce525a574aa19d
	.xword	0xf3257f05341fac6f
	.xword	0x0aac2ca22d04eeef
	.xword	0xfed10309384c558e
	.xword	0xd613a487e33e7412
	.xword	0x3253a53ab2f76741
	.xword	0xfed6035f21de66a3
	.xword	0x539e958d4f6c8a9e
	.xword	0x020940717683d14d
	.xword	0xaa0ff6e6fb8af6e5
	.xword	0x7cd0775dcc8c5e6e
	.xword	0x2408f01da608f7c1
	.xword	0x3f4a19a3e3f05112
	.xword	0x75f4d6f993bad9ba
	.xword	0xd3fe6eda81ad9e15
	.xword	0x5b98fb0c80b34a0c
	.xword	0xa22b56b73163068b
	.xword	0x2d42af507b379565
	.xword	0x41cf341cdc1feae7
	.xword	0xc286ea0b164c6c3f
	.xword	0xdac523bc5780544b
	.xword	0x5963d83c8a4c373f
	.xword	0x0f52c2d9708da004
	.xword	0x42162304ecf0cca9
	.xword	0xd0342ff390651b3e
	.xword	0x85f2a4c11bc2aba9
	.xword	0xf3a59cc33d288d5b
	.xword	0x44bc07cbc05e1b75
	.xword	0xc66519a29f8ed0a0
	.xword	0x511e401171709f3f
	.xword	0xf0b7b296fbfe6ee6
	.xword	0x133eee8678b85575
	.xword	0xdab14e7aea2e3c28
	.xword	0x46c5abb36343d528
	.xword	0xa21dc9b582717916
	.xword	0x5cedc971a867a11e
	.xword	0x57b779ce7e8531b4
	.xword	0xcd4f66dda083662e
	.xword	0x42f185ac184c2e46
	.xword	0x6921f4c96a71c308
	.xword	0x272ea10aeac5a451
	.xword	0x74da859858193df5
	.xword	0x60a93f37b05f02de
	.xword	0x844be0a7ad492103
	.xword	0x25d10d945d51ddf7
	.xword	0xd29e5696ec09153b
	.xword	0x403a80bf75816d8d
	.xword	0x5b15c5d9dae55d91
	.xword	0x94e0afbf11c52d1b
	.xword	0x0c21cfb4169baaf3
	.xword	0xdd3e3a5de5bdd4fe



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
	.xword	0x8e42c1c5610f9efc
	.xword	0x28ee7c036f058df1
	.xword	0x69dc1f8d66045d82
	.xword	0x52d371abcb3bba0a
	.xword	0xbb393be111f0f5d6
	.xword	0x381f73b075dc6b15
	.xword	0xf0fbf5af43b71646
	.xword	0xc7c919d7a725424f
	.xword	0xb9024d55c5375cdf
	.xword	0x21feb155d991eb39
	.xword	0x4304788ad183b7f7
	.xword	0x4709b020a6322142
	.xword	0x0a2d74f99a992b76
	.xword	0x84127bd586c3e413
	.xword	0xc486f93376ad5938
	.xword	0xe0f8545a423959df
	.xword	0x6f776f24e04d697e
	.xword	0x8915d19bd7bf2da6
	.xword	0x37eefe109e06310c
	.xword	0xbfff5aa80f71b4ab
	.xword	0x6625ed1c8967c8a0
	.xword	0x24fd3b4a01438aff
	.xword	0xe21dee1852cee7e4
	.xword	0xdb7af1b5f4919c1a
	.xword	0xec711823b9117d02
	.xword	0x41a72920958e3730
	.xword	0x7e95de305ef847fe
	.xword	0x463ef904183320a7
	.xword	0xeb0747a59b026a70
	.xword	0xaa33356b440df1c8
	.xword	0x614beb4179607908
	.xword	0x37a6b91e68dc2e25
	.xword	0x6ec00451c6245c57
	.xword	0x0a17c694d07d0824
	.xword	0x54e0ca5c7f726aad
	.xword	0x94d4887fb392dc38
	.xword	0xd17048f82e186574
	.xword	0x3fbb34501d895862
	.xword	0x81709313eafe589a
	.xword	0x3fbe82a62b4d6871
	.xword	0xd6188b5ed5420bdf
	.xword	0x0a19a9dd8869ea61
	.xword	0x252dc6c3ab90221b
	.xword	0x8f474ec24513b16e
	.xword	0xebc04864dcb400ba
	.xword	0x5a235ccd884ebd5c
	.xword	0xd7066bc5db341e44
	.xword	0x775ca5fcce50cfc0
	.xword	0xaa808032fe8769f0
	.xword	0xafd6adc68b7c7557
	.xword	0xf56deeb4bf0cf07a
	.xword	0x9633397dddf22496
	.xword	0xb0cc0fcbc057efd8
	.xword	0x9eb0acaa94d42fbb
	.xword	0x05a0bd24b9fd785d
	.xword	0xf2fb1af51e2a820c
	.xword	0x689addd03ab2bdb7
	.xword	0x969705647082fe90
	.xword	0x38627c152cc7d796
	.xword	0x11b49f0afcb0cb84
	.xword	0xa9f0ddbe4bdcdedd
	.xword	0x6ea699596cc6b94a
	.xword	0x679165f636043231
	.xword	0xd77e28a822985365
	.xword	0xa0493718859c9dfd
	.xword	0x03969b6ad113f1d5
	.xword	0xf532a8a5333423b0
	.xword	0xa15d799833b54cbf
	.xword	0x14473ac04f434d60
	.xword	0xc8696c54e5ad2260
	.xword	0x33a29297c5e05017
	.xword	0x470ba65f64af70aa
	.xword	0x848efb657a5143be
	.xword	0x6a0380f91016647c
	.xword	0x0278c2d47142c3b6
	.xword	0x2c05dc802addb47b
	.xword	0x23bff82357804b7f
	.xword	0x924cd6b776111dd2
	.xword	0x0181e6afb947a911
	.xword	0xe114ad691963eaee
	.xword	0x01271e4bd942b8d8
	.xword	0x876f3a9924a27d22
	.xword	0xe17d51f51ce41e4f
	.xword	0xa16f5828fb7ff112
	.xword	0x3bdfd39fc445eba4
	.xword	0xf3468c34035c0c63
	.xword	0xdc0ee8131446d134
	.xword	0x29f0c274259fb32d
	.xword	0x19e89238b3fa1dd8
	.xword	0xba249ad4c4b433f5
	.xword	0x5827bd7ce0ffdd26
	.xword	0x1006ce99e96453f9
	.xword	0x563b5b7a59b429bb
	.xword	0xd6a769daa5405699
	.xword	0x2d55504d79001ac1
	.xword	0x212b1a7226ccabe6
	.xword	0x3e8695ec344d466d
	.xword	0xc108aa0d6a3256d6
	.xword	0xa5ae1e7f0c06ee92
	.xword	0xd399759deddf703f
	.xword	0x79777d6860dd010d
	.xword	0xb9498c6f5d7931be
	.xword	0x18fcce9c0d35165e
	.xword	0x4baa9d63bd9bb631
	.xword	0x6d59fe357008eac2
	.xword	0x794de0ad6d0cfad6
	.xword	0xde614e2ca6891f69
	.xword	0x6d14f32304753811
	.xword	0xb0175eac3db77e87
	.xword	0x8148580983e977e9
	.xword	0xac3a1a2796e2200e
	.xword	0x80589f67ae7e6dd7
	.xword	0x3c0fc56fb7b9cb25
	.xword	0x2a4e93fd98c7d528
	.xword	0xbe06562d42103dc0
	.xword	0x81387f9fc8307b73
	.xword	0xd8db7101f1a1fba4
	.xword	0x9e7e8a7000d0f78a
	.xword	0x5924935abe0413c2
	.xword	0x2bddcd557786424a
	.xword	0x060c2619dfffad19
	.xword	0x154c33ba458ad6d1
	.xword	0x85ab46a418a867f3
	.xword	0xabef8b6e96db7c62
	.xword	0xe71e3232aa840893
	.xword	0x3a19057ac1343c8f
	.xword	0xdd06ab4449b49666
	.xword	0xa7b9896891b7b0e0
	.xword	0x042b182f76d49f0f
	.xword	0x1a120905c7f2f434
	.xword	0x061a54d31ac24462
	.xword	0xe8b44895726b186d
	.xword	0xec1cb6ae186a85a4
	.xword	0x5fc26d116cf0881c
	.xword	0xf0874d00f4770d75
	.xword	0xa1a6c213ee82a5a2
	.xword	0x71d5a38833afcb93
	.xword	0x33ba0c6cc287730e
	.xword	0xd9edcaa1143334b7
	.xword	0xb6ff9215133755c9
	.xword	0xe59a76b844db3715
	.xword	0xa01448d38548abbe
	.xword	0x3aed4cdbf886e001
	.xword	0xd58ba24c61ec5471
	.xword	0x94f016c17f622233
	.xword	0x6ec049c71e9ccb12
	.xword	0x84fac13b75653118
	.xword	0x368bb79260929e8e
	.xword	0xe5445efccac368f3
	.xword	0xf1d180e86d2cef99
	.xword	0x3648383d90143960
	.xword	0xe69ac2085a3ddb48
	.xword	0x5b9fd74e1158d84b
	.xword	0xb401896c281f1827
	.xword	0xf84e08e3ae0961f7
	.xword	0x2e78c644e60ac5f4
	.xword	0x530cd408e158338c
	.xword	0x310290e5a8c13275
	.xword	0xef966abca51f0474
	.xword	0x9f12350a80f76c63
	.xword	0xd8b9468455c417b0
	.xword	0x1380463a88f4e000
	.xword	0x785a4c67e0fe4d47
	.xword	0xd5925e7b15e8f3d2
	.xword	0xac2687c6bd170f8b
	.xword	0x5ee04cf5ffea20d3
	.xword	0xb8c0d3aa6977e762
	.xword	0x368470689624268f
	.xword	0xabab7a8e5ee711ee
	.xword	0x2d42850569dce23b
	.xword	0x7a760afdcca5f7ca
	.xword	0xbce5d72f35ea7a17
	.xword	0xe4a9e1982a87e244
	.xword	0x11831d6130042cbc
	.xword	0x17c322e7a8807964
	.xword	0xb6aa4432f15d90fb
	.xword	0x50429ad8c264ec0f
	.xword	0xb9cbc01a61de870b
	.xword	0x9068d0b97e0fe90c
	.xword	0x165ebf03554d6f70
	.xword	0x8dfdb38ce4411ef6
	.xword	0x16e63a0fd870ea09
	.xword	0x10ce8d4f4baf8d19
	.xword	0x72dcac3f6d98a3e2
	.xword	0x9c00787e60a26042
	.xword	0xc41ff94bd40e715f
	.xword	0xb881f1c1fdc205b0
	.xword	0xadd5478f8a7258d2
	.xword	0xb678776d22e34005
	.xword	0x8defe50e02643880
	.xword	0x76c146d7cac3f658
	.xword	0x66757c4b0161cb2a
	.xword	0x07b8bb78141b0fe9
	.xword	0x553a03f1bd046c4b
	.xword	0xac2452af7e3473f0
	.xword	0xb0730f1d8e618d5c
	.xword	0xbd5061cfd351c796
	.xword	0x6e7fbd73a21be016
	.xword	0x484b27ef0abcd513
	.xword	0xe1b89c485a32c8ab
	.xword	0xcdb15baa8f87e849
	.xword	0x26a65f8f7b48e157
	.xword	0x02b7ed643c6640bf
	.xword	0xf62c570004d35e75
	.xword	0x5bbc42c40b79949a
	.xword	0x3d582566cb44ff6a
	.xword	0xa6ac7cc2d0b063a2
	.xword	0x63a478b0a6bd61f0
	.xword	0x4f15c7009092c099
	.xword	0xea9b3f864a0c50bd
	.xword	0x3949e5b3b35fbc76
	.xword	0x3c62c5b506262d56
	.xword	0xc34bd11f40bcdc45
	.xword	0xdf05d6e48a95365f
	.xword	0x3194c004026ca8d5
	.xword	0x981cc3eeaee89837
	.xword	0xb081027bdd8be780
	.xword	0xb410cf4d247ceacd
	.xword	0x532679dceb479ba8
	.xword	0x0f72a033e322af16
	.xword	0xf90bae6c6feecece
	.xword	0x90b49d3dc601b3fa
	.xword	0xf994ce4c757bcd49
	.xword	0x41694c93193820e9
	.xword	0x559884c8817dc06b
	.xword	0xa75e4d3f1d708472
	.xword	0x79f523675cd0afee
	.xword	0x87aea863a577e255
	.xword	0x5252475bc54dcfea
	.xword	0xb25b70c4ade6aef7
	.xword	0xb26170f6c9c6f125
	.xword	0x483e654bd65b7e62
	.xword	0xe3c22864a642d824
	.xword	0x6ea57b5b53610498
	.xword	0xfe1041d456bb32ff
	.xword	0xb73fdaa3043f710d
	.xword	0xba52ca2d4fb6d40c
	.xword	0x49dfa42da6737277
	.xword	0xeb138496334c6698
	.xword	0x9cdb25f6ddc41e20
	.xword	0xf38733ac230dcf40
	.xword	0x4c3795aa9853b1d5
	.xword	0xff52558e08073bec
	.xword	0xa2f554c7a8d01486
	.xword	0x951f511194c880bb
	.xword	0x897783ce21ecc04e
	.xword	0xb722299b29d48ed4
	.xword	0xa670acc7c59e8354
	.xword	0x7b74abff642a6bbd
	.xword	0xc629b8bc0311d94f
	.xword	0xe3e81d32c9e596ee
	.xword	0x0a321fab60872dc5
	.xword	0xb47024ed3e464110
	.xword	0x334472ef6812e6ea
	.xword	0xf8c8dac799bebe2a
	.xword	0x935a18ae1113987b



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
	.xword	0xd0e2b62962158c92
	.xword	0x82512881c9c1a4cd
	.xword	0xcba12233a73e9586
	.xword	0x1ec8087ea8e4efa6
	.xword	0x8c6c842c50f25785
	.xword	0xfd1f74482bbdf103
	.xword	0x4af4292ff796aa79
	.xword	0x2df9f7766b1efece
	.xword	0xb8bee5e41013e351
	.xword	0x3311e287a16f1216
	.xword	0x7c01d7ebcf230acb
	.xword	0x1fe5e576e3e8be76
	.xword	0xe633b63cace74d99
	.xword	0xa6bda357c4780fc8
	.xword	0xc48e00e5e7bf1352
	.xword	0x504563e7e6c6289e
	.xword	0xaed592aa48825d36
	.xword	0x444edd477208b5ac
	.xword	0x0684768a88cf3627
	.xword	0xd073c08174a6e6b3
	.xword	0x61e69b4ffcd43eeb
	.xword	0x296422a84dffb6e2
	.xword	0x2209df8c98ce8fdb
	.xword	0x717119306aaa2bef
	.xword	0x0aec34f8d4875d51
	.xword	0xe1d7385ec1736398
	.xword	0x882a811dc5adf9d5
	.xword	0x62210efffeec90f7
	.xword	0x96d74d1ca8670e0c
	.xword	0x10514031c7adbbb3
	.xword	0x49c6bd9ba7e1dc31
	.xword	0x93f596fd0dc082e2
	.xword	0xe699ede5e54149a3
	.xword	0x6f5a9ab8719eb681
	.xword	0xc7350f840b217836
	.xword	0x2c613191d77b75d9
	.xword	0x19de5769fe1b0a5a
	.xword	0xe065f6680a24d925
	.xword	0xd4d2ce0e4229b8c3
	.xword	0x4a35bfd7b5b750b5
	.xword	0x146453de30f9dcb8
	.xword	0x960352c26d1e569b
	.xword	0xb7e73fd423838735
	.xword	0x59ed4dd7a043eba5
	.xword	0x5caa323eaee294eb
	.xword	0x96aa5ebc9c2cf994
	.xword	0x4b1cf3f0140c4c5e
	.xword	0xa508ed39799869f1
	.xword	0x1cfce588ad889d82
	.xword	0x33ba285377f0159a
	.xword	0x82d32095082500d2
	.xword	0x2a0e6afefe15d498
	.xword	0x90cf07d034a5c45c
	.xword	0x1e06a8dc937c37ae
	.xword	0xd45590d95787222b
	.xword	0x462369cae3596328
	.xword	0xa60cf9a0e78c58aa
	.xword	0xa0e6d1f05fa6347d
	.xword	0x3a353fd572bb190f
	.xword	0xa24d851284665aa6
	.xword	0x74231bb9f83e8db1
	.xword	0xd1aee78ba1849602
	.xword	0xc0a0948d1aac71dd
	.xword	0xe0dd558cefeee797
	.xword	0x23e803b41b6debd3
	.xword	0x5dea3e2bfdcf8468
	.xword	0x2b76ef364f15676f
	.xword	0xa22772c07ad23136
	.xword	0xbfac0ed1b71ba7fa
	.xword	0xb7514771a4b5174e
	.xword	0xf0cfb584c1c410e9
	.xword	0x2019d9484c4ade7c
	.xword	0x1d05faf1ed11ec44
	.xword	0x106709257f781869
	.xword	0x131c291b3208e394
	.xword	0x58ca038835c92052
	.xword	0x8d4d35e6ff22ae6a
	.xword	0x8ca7842dd088d8ca
	.xword	0xace6b45a459209f8
	.xword	0xe25d91a9249d77e9
	.xword	0xdb0971db115e79d7
	.xword	0xb9dc9c31228c446b
	.xword	0xc8cba555562c3297
	.xword	0x36e7f068220cc8b8
	.xword	0x66eaec0051c0f088
	.xword	0x030da1bfac963cde
	.xword	0x5b462c7c0445aff7
	.xword	0xd88f8310a7f20b49
	.xword	0xf6e37c64d5ba2925
	.xword	0x686645fed5a793ed
	.xword	0xc9d909dd0c08c7f5
	.xword	0xdd821c73b03c59b5
	.xword	0x54e67b84f56cb2e1
	.xword	0x6eb59dc7a4b24229
	.xword	0xd1a4a821a57e8c79
	.xword	0xaf12b6d20250e90a
	.xword	0x5b3ee87cdbf01683
	.xword	0x10bf40411176b317
	.xword	0x8236b75387a0f73d
	.xword	0xeeccd5dd64ae3bed
	.xword	0x7e41e9f0bb583907
	.xword	0xa3c0e38bc013e5e9
	.xword	0x59d0e9cbf84f0238
	.xword	0x7966abea9284b38c
	.xword	0xf5bde7353092c102
	.xword	0xf959f616e685ba89
	.xword	0xc9e72813a565022e
	.xword	0x339d5694eab2ff43
	.xword	0xad16a543753709f1
	.xword	0xe042091e8c85b04a
	.xword	0x2f198925a53fa3fd
	.xword	0x6bc17ea4e0c9dba1
	.xword	0x2797c51b3b0bbc77
	.xword	0x637cc05e51ece5f6
	.xword	0xd48c5b2f2b2b33c2
	.xword	0xc85c5e846142d43e
	.xword	0x12f13edcf67ab39e
	.xword	0x477f5e34307ebc8f
	.xword	0xbc52187609c556c0
	.xword	0x9ebb8fe6e59b3bc4
	.xword	0xe07855c6d7b45d2c
	.xword	0x4a594a61dafd9a9a
	.xword	0xf9046f8c071ea8fe
	.xword	0x8a739e59e7aebe68
	.xword	0xa942369c8faaf42f
	.xword	0xacfc1ca6a906131b
	.xword	0xb9a9dff33820e8bc
	.xword	0x190bf794e960c909
	.xword	0x8cced56791a9ceb8
	.xword	0xe0e7ab6b019bddcc
	.xword	0x22608fe51606a200
	.xword	0x468a171efb2b4835
	.xword	0xb0287a9387d50607
	.xword	0xd81a4c1291440564
	.xword	0xa8dbab01471cdcaa
	.xword	0x16cae07839122153
	.xword	0x4dc67472868ccea9
	.xword	0x937511a8de8255a1
	.xword	0xd3bbd269b41f2dbb
	.xword	0x6d31dbf7d4de0055
	.xword	0xc942560cac1f0b03
	.xword	0x0493960c3f17d1d6
	.xword	0x5a9792e831af6d30
	.xword	0xdeb3aeccc4685739
	.xword	0x39d6bc1b7be42829
	.xword	0x6369c8621072101e
	.xword	0xbb41037b6d57b02e
	.xword	0xd9ee7313f523f47a
	.xword	0xc761e86f38c33da7
	.xword	0x321f56da7f1ba2a1
	.xword	0x554cea13019e81f1
	.xword	0xde3bb0c68c944af8
	.xword	0x657b6564e20dd47d
	.xword	0xf9e5596269562e69
	.xword	0x997c21736aff395d
	.xword	0xebf4378f0f59e450
	.xword	0xe66bbe47d985f62c
	.xword	0x7949ff7dc7a02aaa
	.xword	0x70c755dfc33d27f2
	.xword	0x776e423f5e9ada25
	.xword	0x159752c28086cb1c
	.xword	0xdfac7db2ee23b6ae
	.xword	0x2bf93b0905b65993
	.xword	0x8292e262b3192bbd
	.xword	0x3b1b6802e1f47ae0
	.xword	0xc31ccea6effdc09e
	.xword	0x699e492caf5cf7b4
	.xword	0xe86b9031d88283dd
	.xword	0x857df20332f2c007
	.xword	0x918af0455a7962e2
	.xword	0x82e777457c33dc97
	.xword	0x997bd2512a2cf565
	.xword	0xb6b653109df1226c
	.xword	0xfe920a57e036afe5
	.xword	0x12d24aac193b006a
	.xword	0x5bb33963ce827138
	.xword	0xad361e878301770d
	.xword	0x7b69a908c706c585
	.xword	0xfa838dc455b385bb
	.xword	0x7a9056d7670972ca
	.xword	0xa585a13016c2c89f
	.xword	0x4a91fd9cae4b17e2
	.xword	0xbfa107bb76a4e0d2
	.xword	0xdbf07a7f1e7264a3
	.xword	0xb61d12521cc51d37
	.xword	0xfd1d0a4f6e979e68
	.xword	0x87f61c9e5ff15678
	.xword	0xac88691acf4360f2
	.xword	0x58b4bf03a3abebc1
	.xword	0x16b062567c5c9b9d
	.xword	0x98a7804b2d52b3f5
	.xword	0x343ed93fbb57b4ea
	.xword	0x98c93be9f145d94a
	.xword	0x44def952e609c445
	.xword	0xda2faa0711d5cad5
	.xword	0x140b570ef7a6f83f
	.xword	0x68766bcd57ed6e43
	.xword	0x08706e4bd5bafc12
	.xword	0x93fe0215c6be4eb7
	.xword	0xe671140e40fbf3c4
	.xword	0xf9d7cd566d87463c
	.xword	0x15adb46f0ade6015
	.xword	0x62475bb0d42f6026
	.xword	0x6449ec75382c1e58
	.xword	0x58f521af1f3d700b
	.xword	0x83fc5437bd6dda6c
	.xword	0xa6a3c8bcb369428f
	.xword	0x47d7767a74ea9569
	.xword	0x7d97deae0e89ac9e
	.xword	0x3ed6e8fd2e5edddd
	.xword	0xf8e5cb2eb7d86eb7
	.xword	0x438ee4721be89c70
	.xword	0xbf037140e938248d
	.xword	0x9a44941233208c93
	.xword	0x7c4b82efa54b55b6
	.xword	0x2d7a0e3bd39ab238
	.xword	0x7c399f86f939c2c5
	.xword	0x9212c234ab82e39b
	.xword	0xfeea4bff1bd3943c
	.xword	0x0fee98c7c50cb7e6
	.xword	0x51c027d9f4da699e
	.xword	0xc0261a6a48c2286b
	.xword	0xa74363b217472afd
	.xword	0x79fd89d2b5b76013
	.xword	0x95b20639de20219b
	.xword	0x6aef9c9bc6d1c6d5
	.xword	0x44f083358ac64e54
	.xword	0x119e841d75cd599a
	.xword	0x14f26f924dac8d66
	.xword	0x5d1e9b86cef4b91c
	.xword	0xfb02ab543c93c57d
	.xword	0x3a693d84ca057207
	.xword	0x91d23dedc419c42c
	.xword	0x271b96082be11483
	.xword	0x1090b33ba89d7b02
	.xword	0x61d8f9af16137e24
	.xword	0x58a005428592e879
	.xword	0xacdf52811cf22214
	.xword	0x2f3c37acb02fe844
	.xword	0x702b008573936e99
	.xword	0xc3025eb52fdef7bc
	.xword	0x18e9282d87e7a83b
	.xword	0xf21453b6475160ac
	.xword	0xa2717dfd552dcab2
	.xword	0x163ce6ce43accea8
	.xword	0xc8b90f20cdd41847
	.xword	0x61d9a3d57737e972
	.xword	0xc099ec65acd0ab23
	.xword	0xd642b6cd5bf4607d
	.xword	0xc109e497a2023b99
	.xword	0x8df7840f6d558d2e
	.xword	0x33e8a363921c7c37
	.xword	0xb546a9d7a6f64010
	.xword	0x9267ee0c92800103
	.xword	0x2561eff292cbc295
	.xword	0x1e09f95cd03956c4



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
	.xword	0xabeb72eefa0cabb0
	.xword	0xc2da16b6b5a47ce9
	.xword	0x040c0c9143fc0e78
	.xword	0x6d5f3a512876fabd
	.xword	0x0d200d6bc081e377
	.xword	0x1940788e2b3d9572
	.xword	0x42756f6140939f63
	.xword	0xe6e82cec1642941c
	.xword	0x73df9593b84a52c9
	.xword	0x7d624c2bd006009b
	.xword	0x2f3bd7ce395c398e
	.xword	0x7adf7f6f06b15cc0
	.xword	0xfd8d4454dbc06846
	.xword	0xf6aa47525f63b1e9
	.xword	0x7a0b5bd7ebd7b835
	.xword	0x966f6d78ba2d2d68
	.xword	0x420c2812487ca859
	.xword	0xb597074c7391c0eb
	.xword	0xd8210a6a20071056
	.xword	0xc80aa8f40337be20
	.xword	0x2e714a01b61806d8
	.xword	0x86e7e4f271c5135e
	.xword	0xd9fb33602886cb5d
	.xword	0x42dd3992414eaa73
	.xword	0x2cabab0e41bba588
	.xword	0xd5ce26bb281f5b91
	.xword	0x223f6a0666f5e180
	.xword	0xfad43b41aa70b242
	.xword	0x4be2a07e4995d0f0
	.xword	0x5e8429b46a373b02
	.xword	0x0f2c347d74f7e36d
	.xword	0x57a9e7a733e1302e
	.xword	0x847c6ba224d25468
	.xword	0xbdf976104999c73c
	.xword	0x8e7c116749482eb1
	.xword	0x6e66feb1f658705b
	.xword	0x5105803c21509afc
	.xword	0x65c7792693d5fb1f
	.xword	0xf8c8479fd85eb81e
	.xword	0xdf519eaba1e0b872
	.xword	0x4dc5ae8c0b76f941
	.xword	0xff43ab10d929f812
	.xword	0x722bbfc248b69c5b
	.xword	0x0d06fa294c8bff51
	.xword	0x80110dce31de445f
	.xword	0x2f99607c3d19433b
	.xword	0xe9ecf2b360167ba2
	.xword	0x75cf268a889ef610
	.xword	0xee6235ccee3bb4d0
	.xword	0x95432cd90adf8822
	.xword	0xf75ae4d56bebcc04
	.xword	0xc7a80699415992f1
	.xword	0x9d2a9e81f49b8199
	.xword	0x19d55a092aa4b8df
	.xword	0xb1f45b9edee68c0e
	.xword	0x574bee9d0988abf9
	.xword	0xa33addd46b883bad
	.xword	0x2797dda1f5af7498
	.xword	0x0c216701d93a0196
	.xword	0xc5b992c026f00e04
	.xword	0xf3c710ac20ea1a62
	.xword	0xc3b800b664aa2350
	.xword	0xb8d6b1e13cffc73e
	.xword	0xc04901d3b8e0b8a9
	.xword	0x90faf2ea2100bc1f
	.xword	0x71aa270ed11304b1
	.xword	0xf0dee4e60f3a6498
	.xword	0xdda33a4db31d0f9e
	.xword	0xe9c2a1c321bd5aeb
	.xword	0x8ea5b951eab4942b
	.xword	0x2dd14e49363d3975
	.xword	0xf30a7d565cce4cec
	.xword	0x50495eb93d4933b1
	.xword	0x8f61ae7438afb12d
	.xword	0xb8645e9ade522619
	.xword	0x6921d2b0e23d0549
	.xword	0xf1bca98b190c9e00
	.xword	0xc6342fed3ddc5348
	.xword	0xedd910830841b8e8
	.xword	0x0eb68f0e90c2d0d4
	.xword	0x7905fa49350c194a
	.xword	0x13be9fe595c7ffc6
	.xword	0x7063785bca4ce6ef
	.xword	0x9528dd5966d073f5
	.xword	0xb36fa50748ae81f7
	.xword	0xa1d0e90d6b2bb72e
	.xword	0x0796eb552589687b
	.xword	0x68b56fdaaae380ce
	.xword	0xab726f417399d74d
	.xword	0x02954567b55f1580
	.xword	0x699b34e040236659
	.xword	0x7170a73d75d910b7
	.xword	0x9dc8cb76177c9790
	.xword	0x3233b4b0b7814644
	.xword	0x96c2d7edba0e133b
	.xword	0x8895d365f521bcfc
	.xword	0x7b60ca8dfffcf8c1
	.xword	0xe74602fb689a578d
	.xword	0xea5832b9017c3d86
	.xword	0xb93545597b6bb973
	.xword	0x1e8ec8e96bd09203
	.xword	0xe3eb89a17cf4241f
	.xword	0xa0de82c49387e64f
	.xword	0x2884e292ecdf6840
	.xword	0xe4061659fecdf84a
	.xword	0x78f7eacfd67ff103
	.xword	0x99f255f5715f72fc
	.xword	0x718a4ce856f2ab46
	.xword	0x011c05277d2bacdb
	.xword	0xa7d1d996876f943c
	.xword	0x293fd5d42e4e2427
	.xword	0xae4d9728bd864917
	.xword	0xab074a10dbcca503
	.xword	0xac048042282366e8
	.xword	0xa8807ea47cec46eb
	.xword	0x647cadc56f2cb04f
	.xword	0x09e0dc7a95fb711f
	.xword	0xe8e9b62512c26f45
	.xword	0x62f5af5c7a7be3ec
	.xword	0x3bf3b84a3f52281f
	.xword	0x326905523fc1127d
	.xword	0x6358b05673111688
	.xword	0xa2beee5370ad8174
	.xword	0xdbe21ffe46b7f3ee
	.xword	0x6ee6c304413a60b8
	.xword	0xb7575aa70886df2b
	.xword	0x499231536bb58325
	.xword	0xb23ed2e13d4aab03
	.xword	0x49023f4df9432cc3
	.xword	0xeb47b78cb1a0c3b3
	.xword	0x3f8a2ae3fa192a79
	.xword	0xc7f50eb1c081ba2d
	.xword	0x985b44016d6fead5
	.xword	0xf87aa44949ffd141
	.xword	0x4bf2d8b2c6abf084
	.xword	0x51d40c8aadcc8759
	.xword	0x804db62418886bb4
	.xword	0xfd04df507f354aea
	.xword	0xf870f5aaefbee4cb
	.xword	0xe21b4cb45701d6bc
	.xword	0x5eabdefb60be5de7
	.xword	0x0ad288aa6391f433
	.xword	0xe0923d6cbb4b4ce0
	.xword	0xc2bf4fe3ecdcadf1
	.xword	0x2c89b7b3fb7bc386
	.xword	0x057cf608fd8d5134
	.xword	0x8a6c5c637d4c1a88
	.xword	0x99470e605c740722
	.xword	0x6f9a471d06e93db4
	.xword	0x1a401b503939ba3c
	.xword	0x0bb5a0c72e182326
	.xword	0x4d5abff7e2217c2f
	.xword	0x9a506ec42fe82b1a
	.xword	0x21fe21fca6837323
	.xword	0xa66396eeda8c5e2f
	.xword	0x16f214dec4620d46
	.xword	0x2b9b79d2885a34a6
	.xword	0xff50f61f43b6be19
	.xword	0x895cfbe74b39bb7b
	.xword	0x4c366a3294f77f86
	.xword	0xdf2d3c98a97ba2c7
	.xword	0x19ff70227173ddbc
	.xword	0x89419288303eeeea
	.xword	0x218a50a5a42796d6
	.xword	0x5add94c01557fbdd
	.xword	0x978e174a9f5b2b68
	.xword	0x0d1c39a8d97e450c
	.xword	0xef1d1966e7f80153
	.xword	0x611b674b05203216
	.xword	0x006087b341d12c08
	.xword	0xed6a9f047e8fad58
	.xword	0xbe31737df4625c4f
	.xword	0x5302a8311dc912b2
	.xword	0x3a9b869ebd9bf1e6
	.xword	0x0c4a59e216436a10
	.xword	0x51d2205f6d44b782
	.xword	0x686c77b2c8daab7c
	.xword	0xcda32add8258ed8e
	.xword	0x56af121a0ed34724
	.xword	0x5e10ae83e008d2fb
	.xword	0x63f75107a14a8f0b
	.xword	0x22fcf7ad39f73467
	.xword	0x629b72e3446cd704
	.xword	0xdc525715e9ec77ab
	.xword	0x92bdb800161835ea
	.xword	0xa5880b1c18bd131f
	.xword	0xad795b1acfb976e4
	.xword	0x433eb4b61164637b
	.xword	0x324fc723bc3a3d79
	.xword	0x47558ff1ba166385
	.xword	0x3fed1f598e5a3764
	.xword	0x3761f6e1cc1730db
	.xword	0xf307fd47ab3be6c4
	.xword	0xa9a02b4795edb4f8
	.xword	0x7ca61e0dc7077dc6
	.xword	0xc3fa7b2489b471e6
	.xword	0x29217979aa63fa9b
	.xword	0xce222cb2e7a541d2
	.xword	0x200c7c312e8ef638
	.xword	0x15d60d79cdebefb0
	.xword	0x60c59de8ceee9da9
	.xword	0x77f1a50bf914a1ad
	.xword	0x824ca1a235cf1166
	.xword	0xb095799882333fe1
	.xword	0x439a4c4c0d2ec2a1
	.xword	0x5f6f721c13196f88
	.xword	0xc742aa4f8f56614c
	.xword	0x504fd7b3e30d8973
	.xword	0x75f5adf24d810839
	.xword	0x06a6678e08e7f6bf
	.xword	0x345a51ca2c2e9da6
	.xword	0x0db268df463e0b5f
	.xword	0xaa3b3fdad5e97763
	.xword	0xa18d2dea4bcd1cdb
	.xword	0x000e73434286d1a9
	.xword	0x1311da11fe3d42f7
	.xword	0x1665b82567d4c57b
	.xword	0xbfa108fc9b8712fb
	.xword	0x2f2c44125e0d6416
	.xword	0xa13664a2e5554349
	.xword	0x88dfca26315ba714
	.xword	0x0f96c90712464dfd
	.xword	0xc3c252bc14107c16
	.xword	0x983b064fde776c4d
	.xword	0x24eea81d3a2bb2bb
	.xword	0x21af04a19a7e4d72
	.xword	0x756e04e68ae02a1e
	.xword	0x2f5ae938ec9dba74
	.xword	0x002a7932e9ca1fe9
	.xword	0x8c110ebaed42d9ee
	.xword	0xb08dcf23e58ff895
	.xword	0xb0cd19e34f3f55b5
	.xword	0x913d0134308d8f2e
	.xword	0x90bf1c7eb7557c61
	.xword	0x179760a13f798f9b
	.xword	0xa1f60cbef44d7bc1
	.xword	0x2fe3f5ddb6612079
	.xword	0x0a3bd07619663547
	.xword	0x56f5c2852c6210bc
	.xword	0xae452f2e5acfe37d
	.xword	0x3d61a8df70bfb5b8
	.xword	0x6666c842e5f1c8e4
	.xword	0xe159c4102fa052c9
	.xword	0x14534cd0c6da31d1
	.xword	0xc954786bb477f196
	.xword	0x60c1571a2fbf40fc
	.xword	0xc7d3ef56db912504
	.xword	0xebcc7d7f1aab4dd4
	.xword	0xf45bb0ee991e6a9b
	.xword	0x2130717239b18ee3
	.xword	0x0d1a771252b8552c
	.xword	0xb802ed60bec8ace6
	.xword	0xf5dcb0bd92a464c9
	.xword	0x4c20ea46fa63350b
	.xword	0x53bf0f796e0842a1
	.xword	0x6f40e4d5097b581e



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
	.xword	0x868f1d027096fe7f
	.xword	0xaa2ab6f12a5e506b
	.xword	0xa6b7cced4c632864
	.xword	0x519d4ce9b16bc53b
	.xword	0x95645904f016a798
	.xword	0x3484a8f6571ce9b4
	.xword	0x8129da3b85600da5
	.xword	0xfeb071209deccc0c
	.xword	0xe436e1f344533947
	.xword	0x95b0188fe26389aa
	.xword	0x3b1ae58585c54c6a
	.xword	0x1e4d11375362e15f
	.xword	0x0f1f7aba590074f7
	.xword	0x61ac59a393e5bf46
	.xword	0x54ad69d878ec72a6
	.xword	0x21d3c50c7225e016
	.xword	0x4920de7ae7a93a63
	.xword	0x3c0ffcfddd4ab689
	.xword	0xb3a4ab36ef57365b
	.xword	0xb259db9005b014ef
	.xword	0x12cc0842ad592156
	.xword	0xf5ea02f068e5c72e
	.xword	0x1fdecec9bae04bb0
	.xword	0x2613cd22783a8a2c
	.xword	0x3d16c553f271c73a
	.xword	0xe3972da2edc11a52
	.xword	0xb7d510bfd9d2a3ac
	.xword	0x06f0efbf939dcfcf
	.xword	0xd444a7243abd0cb0
	.xword	0x73215adf3b9c3740
	.xword	0x117071519365ec32
	.xword	0x2995fad55d4d7478
	.xword	0xbc06f5a02ef0d92d
	.xword	0x5e4c58a49c740e61
	.xword	0xfee8d71ca89f4e78
	.xword	0x6302ef1dc6e798e9
	.xword	0x36280c6c4394cecf
	.xword	0xbcb99bda8d958a2e
	.xword	0xb861473db67e8aa0
	.xword	0xa465ec79f6a4ee07
	.xword	0x99f16a29b77f80c1
	.xword	0x7926bb87eb84174a
	.xword	0xe659a4ad185330ab
	.xword	0x14df6ff138b3d4d2
	.xword	0xf1aaa3ddecf6f392
	.xword	0x84c14e1040bfb116
	.xword	0xc814ccecc887ee91
	.xword	0xef221451bb26610a
	.xword	0xb462990927ddbb28
	.xword	0xa176e907a1c09fca
	.xword	0xdefade2f8dc9eff1
	.xword	0xe1fc4cfc08de038d
	.xword	0xb9de9c9ea43c7e79
	.xword	0x5d790924fdbe512a
	.xword	0xfd5f21d181662c7c
	.xword	0x8f18efdc0c41f735
	.xword	0x33c187a0cbce7fde
	.xword	0x26af7f8a21b22501
	.xword	0x4bbe99e4ac089287
	.xword	0xc5cd99920443ef93
	.xword	0x02199ed85994d3a8
	.xword	0x8082b4716d65a455
	.xword	0x934e2b5e50267cf8
	.xword	0x584e586e225cd7af
	.xword	0x07d9907fd4810a54
	.xword	0x133070e8ed1887fc
	.xword	0x3dc383b15abb493a
	.xword	0x6e965cfe6b0a82de
	.xword	0xaecdcde8f2bb2fb6
	.xword	0x11eed7d006cfa6e1
	.xword	0x0997af4ebffec934
	.xword	0xf0513d551abf375b
	.xword	0xf7603e678a4f06bf
	.xword	0x19ffe72e6db8396d
	.xword	0x5075ecd705afdc74
	.xword	0x72dd88065e8dd366
	.xword	0xd5caf25152a53ad3
	.xword	0x2444b5ea4afe16ed
	.xword	0xaf9ed26834d065eb
	.xword	0xf000af370e80f13f
	.xword	0x8c4f5d05b63a8359
	.xword	0x2941c4f0dc64082a
	.xword	0xc765c11cb73f4f56
	.xword	0x371ac2a2b602e022
	.xword	0xd724c8f33fb5e54c
	.xword	0x9f378ac03dee63d4
	.xword	0x36e0651932bc77f8
	.xword	0x13fa6aa868d275d2
	.xword	0xfcfcfecc3f082721
	.xword	0x4f345ecb8852d7ad
	.xword	0x5010598ce076bbdd
	.xword	0xfdc0e13e71a7360b
	.xword	0xcc934336e52c655b
	.xword	0xc63dae26a58f2f4c
	.xword	0x72d1e643dcdd6b6d
	.xword	0x6be2108ad8e09b16
	.xword	0xbe59b69436c34c3b
	.xword	0x8b3feb7d4c1719f9
	.xword	0x187ed76ceb57b809
	.xword	0xbeccf4cccdf8ecff
	.xword	0x775e2d33eed5707c
	.xword	0xca1b9cf637c05674
	.xword	0xf26399f04d17505d
	.xword	0xb910be9cba32b0f4
	.xword	0x64e7f4f4aaf43043
	.xword	0x515016cb1f89ca70
	.xword	0x76902608d905677b
	.xword	0x46d0a80a7f7ef7b9
	.xword	0xeb3de31d6e436832
	.xword	0xf6df6d5cc8af6a84
	.xword	0x9f6ff79ca2f306a8
	.xword	0xdf2052f89c8c1c2b
	.xword	0x4e4b581fa4245458
	.xword	0xb7ce7d975d01cda3
	.xword	0xb3e188b6bb732989
	.xword	0x163cbdbfce1e7e88
	.xword	0xce950d0ebf30e669
	.xword	0x12c14b5ab03e4246
	.xword	0xb5b27e0a4c895eba
	.xword	0xf2225561978801eb
	.xword	0x6f6ea5cd68996e56
	.xword	0xc251a2fab420d99e
	.xword	0xdf8cfe1e0338d7c4
	.xword	0xb945021e9977cd50
	.xword	0x68744ec59a5a565e
	.xword	0xb917201b4ae11146
	.xword	0x564e511fb9874aca
	.xword	0x7e0fc65e6002f868
	.xword	0x9a5c8261837c8790
	.xword	0x6ed0682de0a1fbfd
	.xword	0x36c777d6a24aad9e
	.xword	0xfcb8de05905bd351
	.xword	0x90dfea13cf592463
	.xword	0x6cac5ccb7bf37efd
	.xword	0xab4bafaa08d5437b
	.xword	0x5913dfde8256b57a
	.xword	0x0d56753738d4b6e5
	.xword	0x0a8ba693d1513a67
	.xword	0x2bea05770a92ef8e
	.xword	0x70e6f9566d2362f7
	.xword	0xa9173216b2912d1a
	.xword	0xc6b40110b6b17b80
	.xword	0xa4e38efcac94b07c
	.xword	0x1dab9abe1175445d
	.xword	0xeb0b4a90bc3c166a
	.xword	0x977205dd8d03e15e
	.xword	0xca16e87115f5dd01
	.xword	0x70b8143660f745be
	.xword	0x878cb7d1033346f3
	.xword	0x7287a0e40b79f20e
	.xword	0xc4b0f653c455b777
	.xword	0x99d54b66e02c2d46
	.xword	0x74ef997ef56c5bcb
	.xword	0xaf8fb08ae3e6f941
	.xword	0xc3c8515a2cd1266e
	.xword	0x791937f8ab4a4478
	.xword	0x60573bcd4cba574f
	.xword	0x05a87f2643dde760
	.xword	0xbacf3a1804926cec
	.xword	0x977f7c0055183c69
	.xword	0x6d556b0cfaa4197c
	.xword	0xd860f0ffa12760ec
	.xword	0xcfa87763651aa492
	.xword	0x59d07610577e271a
	.xword	0x62f3ee55fc1afe80
	.xword	0xec93d9c7ccf874ea
	.xword	0x98865f74f0ebc748
	.xword	0x8ad73ee14c753d70
	.xword	0x95f786d48a86ac18
	.xword	0x752de7fed1f0062a
	.xword	0xf853b678f9627a57
	.xword	0xd35c39ed7ee85259
	.xword	0x5f1171ceed2cabca
	.xword	0x2f36c5767b968ff4
	.xword	0x34fd56bfc70ebc1d
	.xword	0xa6491fec04cf0090
	.xword	0x6e26c2b4a4353315
	.xword	0xcb6919dd7dcdad32
	.xword	0x3eb1614e10456f2a
	.xword	0xb09c508167cd8990
	.xword	0x3948150a769136d9
	.xword	0x8baa54d2e474d41c
	.xword	0x47b0686b62a653f4
	.xword	0x573efbd226c9a72c
	.xword	0x1bc25febc6f71595
	.xword	0xd5c1927db5246d2d
	.xword	0x7422da9bc0142c6d
	.xword	0x18b2eae19f97e3cb
	.xword	0xba676973f083aa53
	.xword	0xc0e0c8d920ca71c2
	.xword	0xdf6fb699073c110a
	.xword	0xd482c5f9aecb8352
	.xword	0xfe2440bc4bb4e819
	.xword	0x7709ca9f815a5a29
	.xword	0xbc1b0a05ef1eb982
	.xword	0xeb51d7a8ea77374b
	.xword	0x5f7e42ff28724b99
	.xword	0x35205391aedf5262
	.xword	0x76f0feeac86f9d3a
	.xword	0xb4d1f0246d04710d
	.xword	0x2a4da78630662b0f
	.xword	0x04f168bd44211b32
	.xword	0x6d27cf6348fc6728
	.xword	0x861c4432cf021d0a
	.xword	0x58c08513c41c7b66
	.xword	0x2545eb411f8aab7d
	.xword	0x4da86d75fbb5590f
	.xword	0x7a77db9eb23603b4
	.xword	0xa97a5a086ac7634b
	.xword	0x251ef6d78544b048
	.xword	0x6010372b434b826b
	.xword	0x8bede326ac9a64a3
	.xword	0x0553ddc6414c77ea
	.xword	0xff6909dd6de526e1
	.xword	0x80f0d5d030ab40b5
	.xword	0xa68e1c46240d3ddd
	.xword	0xc6a8d11aaacf383e
	.xword	0x2d3c65b26d6018c0
	.xword	0x505e7af1cbdb6225
	.xword	0x205c831bfc9be52e
	.xword	0x99903d418aed00f4
	.xword	0xf0e3361a46451a5b
	.xword	0xfcbff08148ec064b
	.xword	0xa3b61fb072227c74
	.xword	0x344839e460f0cd9c
	.xword	0x14a2aa8de8a1c6eb
	.xword	0x524336261b6caa4d
	.xword	0xae2084f92e20aac6
	.xword	0x82d8261d3a6d911c
	.xword	0x1db5383a52951d73
	.xword	0x177e7fef6987beb7
	.xword	0x67454189f970ee93
	.xword	0x3c2b87cfc027719b
	.xword	0x003fdd26bca9dbd7
	.xword	0xe55f506da5319274
	.xword	0xb23045cc7ae0cd37
	.xword	0x2c216a935d8c4d60
	.xword	0x6420ac557c5667db
	.xword	0xba183439fd8f9847
	.xword	0x173d222c510ea97e
	.xword	0x332e98d02938014e
	.xword	0x6c0075170983aabb
	.xword	0x4bb5df2826e5559e
	.xword	0x1efa5e3eb692e202
	.xword	0x236f777b28def02f
	.xword	0x04197978a12545c5
	.xword	0xf164fc3ea12b2f83
	.xword	0x4e1dc16f129a61e6
	.xword	0x9035bc0a17805b77
	.xword	0xe9469316dd8b66ae
	.xword	0x93f72559dea11774
	.xword	0xe2e013d9b0c4d850
	.xword	0xbc2dfd7e21f2b58a
	.xword	0x7ec14d2e7def7ff4
	.xword	0x9d6995eabd0b4202
	.xword	0xf93c7292ff4f12b6



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
	.xword	0x473c257d75208f4c
	.xword	0x45d517aebe072562
	.xword	0x3f6f2f30e529f9cc
	.xword	0x7d17113aae89f0b1
	.xword	0x6960e3a4a438aec0
	.xword	0x670bbf148cc7b491
	.xword	0xe3629ea796e66b62
	.xword	0xa2483d33f0d62cba
	.xword	0x84b7c97bf0af2b65
	.xword	0x596ac5d82f7f84fd
	.xword	0x227fc35d94528891
	.xword	0x4bbe0588d7668f0a
	.xword	0xc349d2aa0bc2ad42
	.xword	0x38ef643e3c321f6e
	.xword	0x8b9a9cbbae8fdef0
	.xword	0xfa179021f82487ce
	.xword	0x0ed42ef8058a70e8
	.xword	0xc6b722b84f09066f
	.xword	0x497ac47e641df536
	.xword	0x174c53b23621a589
	.xword	0x19e9c83822cf8d84
	.xword	0xf7d3d1cec28aec01
	.xword	0xb2f667e8a2385ca6
	.xword	0xb8d97885fa3848cb
	.xword	0xfa952e4693874d42
	.xword	0xa1b26e500364a856
	.xword	0xb24a826bbf94cc97
	.xword	0xdd7a52c39ab3560f
	.xword	0xe1444e725bf3b5c3
	.xword	0x3485226f747675c3
	.xword	0xa6ecc62c9ec365a3
	.xword	0x7756cda5da8ded89
	.xword	0x11a5debbd1973992
	.xword	0xd92bb7a479d83739
	.xword	0x0bb47dc28962d9c2
	.xword	0xc1f06cf4d12f4371
	.xword	0x80f766a64c80f9c7
	.xword	0x91fa8759bdf7e684
	.xword	0xbfc5a4ff392bdb08
	.xword	0xacf800531651375a
	.xword	0x80117e2ed731386a
	.xword	0xfb5439cea20c41c0
	.xword	0xe2d170c1ad23d17f
	.xword	0xeeaaa0aac5a89b84
	.xword	0x723f553d8717da8f
	.xword	0x901de153ae9c8ffa
	.xword	0xc0c004a85422979e
	.xword	0x0d8a30faa01db921
	.xword	0xcc80c8c1dd2f9653
	.xword	0xf0026ced44dd2bf8
	.xword	0x7fe0dde7a281d799
	.xword	0x9952baa234d4ceb6
	.xword	0xe2bafbecfa2001ff
	.xword	0x0f12953043f3eb7e
	.xword	0xed797ce0b21fee4b
	.xword	0xad5263d20c57c5d8
	.xword	0x7e4487244d490adb
	.xword	0xaeca4a24a931df60
	.xword	0x0f5bd32d3ac97093
	.xword	0x8b985a5267d1a3de
	.xword	0xc7e00c45aaebdd87
	.xword	0x4d35c993a022d69b
	.xword	0x200a9f6684952a2e
	.xword	0x348135a7cf97a539
	.xword	0x995baec49ee896cc
	.xword	0xf3c9faa26e8364d5
	.xword	0x923f190a1333e2eb
	.xword	0x30f7538d948ea31e
	.xword	0xc5070a5f47531a8a
	.xword	0x4ca39f0a9e9036cc
	.xword	0x6fd59d6624044ad1
	.xword	0xd3a233210ef5b6d9
	.xword	0xf6a07a7794fef966
	.xword	0xf7729e4b9864d49f
	.xword	0x1966da208c859618
	.xword	0x0daf5a590ac4246f
	.xword	0x6f49bd7dd483a296
	.xword	0x30c45d3368f3ae31
	.xword	0xe30a97803347adff
	.xword	0x838cf4812b954df7
	.xword	0x905ba97c6ba69e6d
	.xword	0x5d5282b010e0b493
	.xword	0xca08a074a1cf618a
	.xword	0x1604ae27ff13bace
	.xword	0xeb29637c7d8a6d9b
	.xword	0x477e48c21e3f882b
	.xword	0x9b7f7b17ef1cc605
	.xword	0x6817fc15e9fd8b6d
	.xword	0x21dbe01e99637a5c
	.xword	0x7bdbf4c1be671dbb
	.xword	0x16aec59af6bc4f4a
	.xword	0x5196c5a7f7e34e7b
	.xword	0x46d6cdbcc6660d00
	.xword	0x8eb4200e7f2b028c
	.xword	0x7aed716de108d3b8
	.xword	0xdc8cf5d5ea5e306b
	.xword	0xfeb963518b81d017
	.xword	0xe9b553f85a6fec36
	.xword	0xe6080a33aa071197
	.xword	0xefb237239c012060
	.xword	0xe5e6995c1eef7fcc
	.xword	0xed81630ce61a0e65
	.xword	0x172e2f68816d11eb
	.xword	0x5b43d635dae3080f
	.xword	0x92aa562f701a3d15
	.xword	0x5a8c3248254bd60e
	.xword	0x4c8c775a439023ab
	.xword	0x0911ad52b2d43b2d
	.xword	0x9d0df13bc742637b
	.xword	0xd0d3e616f5e8b9fd
	.xword	0x2444d0c23f337a15
	.xword	0xd58747d4d3866f13
	.xword	0x7e2f1dbfd29e018e
	.xword	0xa30e6e5f4553c7e3
	.xword	0xb1b557acf1155fb5
	.xword	0x5f7d604c33adb33f
	.xword	0xfe01315f63118675
	.xword	0x3de64e00c93badc8
	.xword	0x866d989c37416aa2
	.xword	0x0cf8f1444571c062
	.xword	0xced9a87fdeace490
	.xword	0x99ed60eb0d85e6b4
	.xword	0x0a99ea0f5ac8773b
	.xword	0x155b9c37503cc409
	.xword	0x5b2ce2e9d5e2c3d6
	.xword	0x5202880ce8eb9150
	.xword	0xa3124c6d15048178
	.xword	0x22e0137aaef9c076
	.xword	0x2cf5ba6f8d34c2fe
	.xword	0x469384ca11808385
	.xword	0x97bdaa057414deb2
	.xword	0x2d788f726800f658
	.xword	0x90de89127c88010a
	.xword	0xc77f83cc91df7631
	.xword	0x966257327309ee2e
	.xword	0x754dc48396496728
	.xword	0xe0b567ed28777a97
	.xword	0xd9d9f6ee19f43421
	.xword	0x06fe67ba2610858e
	.xword	0xf70c98c71ced53e6
	.xword	0x05701df24f9dd6df
	.xword	0xaf831deb6740519a
	.xword	0x2b84c8614eac8b0e
	.xword	0x38c70d4ada362601
	.xword	0xc20fbda6a09d8358
	.xword	0x1fd43addbc6f47d2
	.xword	0xfb06265fe4f349f7
	.xword	0x1c1d2a24de78a562
	.xword	0x742b345c7a85a486
	.xword	0x00495c31491d8924
	.xword	0x24930e7eaa76f0d5
	.xword	0xb56f65371f451e79
	.xword	0x0f3e2cfc448f871e
	.xword	0x2b184aade5505285
	.xword	0xce4d7d5d464cd1be
	.xword	0x8da300068a0aebc5
	.xword	0x514e4dbdc8372191
	.xword	0xb27d8a79711eec23
	.xword	0xfaca6c345b361cdb
	.xword	0xe0203dcf30cfca2c
	.xword	0x0a66bb910bb59f10
	.xword	0x44605f9a6eebdbba
	.xword	0xba724123a7764264
	.xword	0x3dddbf485db25f93
	.xword	0xe44473570ba08253
	.xword	0xa9a97f32f1600ccb
	.xword	0xe48ee4f3627ffc4d
	.xword	0x6adc0f6ec89c4421
	.xword	0xba9ba0f710d1a0d1
	.xword	0xf08d19af60e3c547
	.xword	0x9f97f9873cf3dbd9
	.xword	0xd170ed70373b91c6
	.xword	0xd82542c171406357
	.xword	0xb881626a46e3cf23
	.xword	0x43b8de20a2027926
	.xword	0x1c736c3ee47d9628
	.xword	0x245587aaf5e1e613
	.xword	0xa61b50954713e76c
	.xword	0x85d8a4be5796eeef
	.xword	0xc7db6ada08524e7e
	.xword	0xf4b371065a4a8848
	.xword	0x416f3afacb363b9f
	.xword	0xa5dc4c76849b2333
	.xword	0x005ad6b4613f0de7
	.xword	0x496253cbe42dfd1c
	.xword	0xcb0fe281b5744cfd
	.xword	0x6ca15925e6454638
	.xword	0xa48fc615baf4dff3
	.xword	0xf3a90a70b5dc25fc
	.xword	0x91f40f588e0ffcef
	.xword	0xaaa6ce127a931102
	.xword	0x9ed049852cf88791
	.xword	0x266b3708a9248feb
	.xword	0x93d93ff4b2cd52a3
	.xword	0xf5ecadc2f3072f91
	.xword	0x92f2e43f7212c07f
	.xword	0x872fb5c78d2f6c17
	.xword	0xe019c2e4a82840b3
	.xword	0xc2b9b3ed0bca6bf4
	.xword	0xa9623f3ddf3f3efc
	.xword	0x0a7202bede462127
	.xword	0x2b814456c59a1df8
	.xword	0xf168a50812091480
	.xword	0xe3156f10624dba4b
	.xword	0x8796ea9062cb41bf
	.xword	0x393e497db15ee128
	.xword	0xce5fbde13a40815b
	.xword	0x099d7ce9ea0f537a
	.xword	0x3b2a743469764e79
	.xword	0x77db00cc9125a953
	.xword	0xa0d3c390eac199a8
	.xword	0x95a41fd67134eefc
	.xword	0xaed808112c213e69
	.xword	0x8cabf7ce4fc976b7
	.xword	0x5e59d61768affbff
	.xword	0x8b5a2551c1017fcd
	.xword	0x93d2bee01a14d5c1
	.xword	0xe53c4d1a5fcd21e1
	.xword	0xa88eebf4a4412f10
	.xword	0x773ec87f91f1c3e1
	.xword	0x77c89a95fba7abf6
	.xword	0x9fcde0e95a878ba1
	.xword	0xecef3dde6ddb61d5
	.xword	0xa5b2245671b590f1
	.xword	0xbfb05c11efc2b751
	.xword	0xdb56b475218c084e
	.xword	0x7af8fdac7c89e68e
	.xword	0xc504d0bf8cb5a420
	.xword	0x0108c77976c9474a
	.xword	0x055a11ffe2a909ef
	.xword	0xd988f5271a5aa504
	.xword	0x1fc66ed3fb59c0bd
	.xword	0x57d79b2b4f7d7612
	.xword	0xe5ad5d77a174e12a
	.xword	0xbd70b6c63d2d03b6
	.xword	0x5a8cde4c4f7a019c
	.xword	0xf7ad1a6520b21afb
	.xword	0xf28c8ee3c5df3300
	.xword	0xee143b28225669b7
	.xword	0xc8af279938e347da
	.xword	0x0181a8c671742ce6
	.xword	0x7bea7230b6ea0b17
	.xword	0xbedf5e22a048165b
	.xword	0xe7275481001bf109
	.xword	0x1b41eed186c620a6
	.xword	0x6e5e70b8916ab4ff
	.xword	0xfd6780835ec32f4a
	.xword	0x044bf0f6cdf9ad32
	.xword	0xa269bf7783dcdd0f
	.xword	0x4668460debeea071
	.xword	0x1e41cb87302d7392
	.xword	0xf37810000bd6f1ef
	.xword	0x64b09aa74704ab46
	.xword	0x956af1f5b3272204
	.xword	0xcecd8d1831b4ed24
	.xword	0xa8ba9eb8d383ae64



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
	.xword	0xceca6443295e1adb
	.xword	0x8eb078a42898c300
	.xword	0x015a40c67d3312f4
	.xword	0xb7ead00e4ffe058e
	.xword	0xadea017218936963
	.xword	0x958ca9ec1558d5ac
	.xword	0xeca70f416d689bd2
	.xword	0xebf8a6a8826423c7
	.xword	0xfda01cafe18a4632
	.xword	0x42444c5b0ecbf750
	.xword	0x79bd417d6ec3cda1
	.xword	0xf934737e36a0628e
	.xword	0xa2118a3a9c5c64b9
	.xword	0xf2636bea289195ee
	.xword	0x30b83cb1b1069937
	.xword	0x5ad266d8a7b9e75a
	.xword	0xb43faa778fdc8aa9
	.xword	0x0a8702dd68bf1934
	.xword	0x38b5bfdc6df95b4f
	.xword	0x00c35c844ce13cc1
	.xword	0xa3d4fd8716ba03d8
	.xword	0x261a3e62703f8fae
	.xword	0xac4e4fde0edfabbd
	.xword	0x5bb0bfc48673b274
	.xword	0x5479e9ee34910b6e
	.xword	0x201125369c6d42a5
	.xword	0x79203842e589440e
	.xword	0x84ced9288b9ee8a5
	.xword	0x6b8e7a4a53c908c4
	.xword	0x34aab43fbc23ae49
	.xword	0x6838d86be6684dc1
	.xword	0xa1d441466c891f25
	.xword	0x23ba31bf6c19d6a1
	.xword	0x51efadac69ac7bc3
	.xword	0x4841b02d9678536f
	.xword	0xe443343701305dbf
	.xword	0x0f94f9daa741cee3
	.xword	0x41c489347d6b2cb1
	.xword	0x0515ddd66e78ee6e
	.xword	0x05e0d714d3988822
	.xword	0x59fcc7f78029c75c
	.xword	0xbbf6acce57c9464a
	.xword	0xda8d7c8f6503def6
	.xword	0x10753f2b1de35028
	.xword	0xcb71bb9a66d824e4
	.xword	0x490e97de07f3f1b1
	.xword	0x60c9c8f244e61780
	.xword	0x01d9fecd6cd34ddf
	.xword	0xfb7557e506c76f84
	.xword	0xa3b29a3db98617d8
	.xword	0x9a517d111ca88b7d
	.xword	0xb2c456ed2a481823
	.xword	0xb0f7126376b24668
	.xword	0x74fa26b152ac9a79
	.xword	0x737e479a21b574d3
	.xword	0x7eb7c5c2c11e20ef
	.xword	0x4ea2baf1dafc6651
	.xword	0x0971d95bd558ff7b
	.xword	0xdf84d94eee7ba19e
	.xword	0xce259878fd9407ae
	.xword	0x11db2e7eae7e1ce1
	.xword	0x5c99739552ccaf47
	.xword	0x0e4b251de69b5d49
	.xword	0xff731e1ac5397d25
	.xword	0x7b3ea200276215f7
	.xword	0x4d46c6765486868a
	.xword	0xd3adf6956941dc9f
	.xword	0xf00c61ca13f558e9
	.xword	0x55bd95fb507f66d4
	.xword	0x7adbc3bade932aa4
	.xword	0x7047d149bb9e04d4
	.xword	0xfd37e860aa18da43
	.xword	0x41e764673e2d1710
	.xword	0x75a9bf00caa1f5c7
	.xword	0xee121134a9ce2889
	.xword	0x0f02c47d393c630e
	.xword	0x833c4ae2340beddd
	.xword	0x2ba076003fa2a7e3
	.xword	0xaa98952f211af597
	.xword	0x7b4ca8be342ffa41
	.xword	0x718aec907bba7b22
	.xword	0x0501407957cac4b4
	.xword	0x46a3fbb1cb693c4e
	.xword	0x89f667149d80bd80
	.xword	0x42410f6bfbe484de
	.xword	0x2553e75258faf18f
	.xword	0xd3bf90e7875f7022
	.xword	0x2503b75131ef9124
	.xword	0x9f1d6327d39ba7e7
	.xword	0x01d3f55573fead16
	.xword	0xbc22233c9a4b0c42
	.xword	0xf376b6d222042b33
	.xword	0xf3a970182936d0ca
	.xword	0xbe99143294d78c8f
	.xword	0x485295e9e2926dfd
	.xword	0xca93c2a342758fe2
	.xword	0x8cc325237ce9a898
	.xword	0xd861ad64474a148d
	.xword	0xc0c298b8f9b1bdbc
	.xword	0xce5a3c18745e1507
	.xword	0xf911e62c3e43d4fc
	.xword	0x50efc9af6380a676
	.xword	0x560600412aa4e464
	.xword	0x9a319b903dd30024
	.xword	0xbbfbc80babfdd762
	.xword	0x8dfadf16b4321d6a
	.xword	0xcaa2e453af7a9362
	.xword	0xf81848cadb31e09d
	.xword	0x7718cff1dce01060
	.xword	0xb52ef5236b0ca405
	.xword	0x9f202e4a5482cc29
	.xword	0xf299f6c874cbe454
	.xword	0x74a60c70f3390540
	.xword	0xaeb4d74f85df27bb
	.xword	0x5f6fa196cfef1e39
	.xword	0x0d8a2484850d909d
	.xword	0x97eb6c34185fd291
	.xword	0x0d5d6cb2145d5474
	.xword	0x3a24953819f71dee
	.xword	0x5a4f31efafa35677
	.xword	0x1f034ee0a5d3e9c8
	.xword	0x7d64eed447202f13
	.xword	0x97ca685b4b955fec
	.xword	0xa6b6a1213bbae15f
	.xword	0x35260ba0e2ff5a97
	.xword	0x558f783a58bbb9e2
	.xword	0x29073563b66fd490
	.xword	0x3b2a0277c08f4228
	.xword	0xe432d6595ccf61df
	.xword	0xa36d1f702eb40913
	.xword	0x6c37847a8dddfd09
	.xword	0xa5dc50ab94e081af
	.xword	0x3b1b79f78d724edf
	.xword	0xc559b346b06a543c
	.xword	0x69ad107fb0a75e3a
	.xword	0x3668bbc83c9baf51
	.xword	0x17ee2f6b19ddf999
	.xword	0x624f0dd4ec908bda
	.xword	0x55f17039072692a3
	.xword	0x59316a583973b9e6
	.xword	0x94a82e3bce011c65
	.xword	0xed15f4d7d32458c2
	.xword	0xfa60e65f192d938a
	.xword	0xfe21c60486578cde
	.xword	0xb97359cbbe958402
	.xword	0xf8e3abe2eb4836a2
	.xword	0x9af3199d119cfdda
	.xword	0x893c220ba387c5d6
	.xword	0xc6069daec5fad696
	.xword	0x3bb55a95cb5bf952
	.xword	0x6563b5057811b5b7
	.xword	0x43aa1a4040530527
	.xword	0x84d106b094c5c6bf
	.xword	0x88b3e5bf8689db9f
	.xword	0x2d4a117df059dabd
	.xword	0xb86cc8bf89bbd79c
	.xword	0x0b3d3c02fca4c4ab
	.xword	0x6351a28d59975682
	.xword	0x8ec1474255064a9d
	.xword	0x019979b2466965a5
	.xword	0xa7e5a7da76c410f5
	.xword	0x6628de8c6b315349
	.xword	0xfe6e55681db3f1e1
	.xword	0xe9025472d4d88965
	.xword	0xb09b5dbfbff9fcc0
	.xword	0xcc79ab677ffea959
	.xword	0x817f3cdc45af3ca1
	.xword	0xcf8707938735106c
	.xword	0x228f3060721f6f8f
	.xword	0x836033999cfc5859
	.xword	0x778cf307907b559e
	.xword	0x01d60fbcdfe7a567
	.xword	0x9d9c49aedf13ed02
	.xword	0x8e0814efe4a88dbb
	.xword	0x0544ac9a2c36eff6
	.xword	0xaac927eafb1f35d1
	.xword	0xe29d32155d173be9
	.xword	0xc96546f4e41a935e
	.xword	0x8536179cb361dfa0
	.xword	0x379d661994144058
	.xword	0x67c1397fc45f8a74
	.xword	0xc49996df7640cf73
	.xword	0x04f81ce327397057
	.xword	0xe3afc648709e786d
	.xword	0x22415b88acb1c55c
	.xword	0x97e9384a4dbd4e47
	.xword	0xc835215c044838a3
	.xword	0xb9db6225f0aa67b1
	.xword	0x0c0bd85e522f57dc
	.xword	0xc12a93432d56d1fb
	.xword	0x891524c4b8a56811
	.xword	0x4c69aa7ea0b70528
	.xword	0x5d252a42ce6c7ce3
	.xword	0x2248502b4961e4bb
	.xword	0x4d8409de6e9de4e4
	.xword	0x1e8a63889814d4bf
	.xword	0x5d2ba57eec96e2ce
	.xword	0x0509ddaaa426316c
	.xword	0xb31de3b0f9d51146
	.xword	0x29de1117413adda9
	.xword	0xf83f4ad795ba5943
	.xword	0x918ff568f9a5d107
	.xword	0x00de53c1b423c76f
	.xword	0x95462878147b23ea
	.xword	0x28982d6c5c23199f
	.xword	0xc496395a5acdf10d
	.xword	0x371948fb3033d9c4
	.xword	0x56d04e34519914c2
	.xword	0xaa0094c212f126a5
	.xword	0xd02a3aeadd19c127
	.xword	0xe8d72233fd1ba11e
	.xword	0x0127805ad02232a2
	.xword	0x1f9586f4688d453c
	.xword	0x5b831a32f2393c8c
	.xword	0x1c8f8d927678c67c
	.xword	0x975ba939f14db3fd
	.xword	0x1e77d90b0a0abc4f
	.xword	0x9925a8b3602d1a35
	.xword	0xe91e33d0bb97f3ca
	.xword	0x2b4bf77364fa6eb5
	.xword	0xef5264e8d75ace62
	.xword	0x6b256c26d9ea931d
	.xword	0x519cc0d5d50ad223
	.xword	0x4a1603d96304e4ad
	.xword	0xe31af3e57709a21b
	.xword	0xc9f5ad7da3f26ca8
	.xword	0x979ab6e126fb1d47
	.xword	0x97ac5c34e394f19e
	.xword	0x6c3dd4df76c36e8a
	.xword	0xb811e8c87cae9073
	.xword	0x9a50beb88a0e01c8
	.xword	0xaa4a68b2f83f03f6
	.xword	0x0983ad32e12b62f9
	.xword	0xcf1f8a94583d6c9f
	.xword	0x5002783bd57a963a
	.xword	0xb810f15912e33e6d
	.xword	0x09ad85ee675ef1bc
	.xword	0x6d278c9a5841daff
	.xword	0x6d9215bbd7a91fd5
	.xword	0x0933aa05fca0816d
	.xword	0x36e1700408c2667b
	.xword	0x06d87a45114c6da3
	.xword	0x81d0dca504e1bc51
	.xword	0x89cde48664984277
	.xword	0x45ad6611233a8279
	.xword	0xafb5f9e783820f8e
	.xword	0x26d43ca1e6b11fcd
	.xword	0x0ab494c623ca71ed
	.xword	0xaa4893ba0ee4492a
	.xword	0x18afeb6baa8fce8d
	.xword	0xad2509cc8c49da87
	.xword	0xfb4764722147b79c
	.xword	0x742437e8f48cc7ee
	.xword	0x2ddc777b078d3e23
	.xword	0xf88e851e41dd48a9
	.xword	0x80dea68b968c11f5



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
	.xword	0xcddf4041afdff041
	.xword	0x4ac4b12844d033ae
	.xword	0xaed8da7b0671e9ec
	.xword	0x6004431ca52c89d2
	.xword	0xd5825bd909a0d879
	.xword	0x3a0bc1b93330a255
	.xword	0xd490a8666190d2da
	.xword	0xbef46f5d728d376e
	.xword	0x00bd3a6bced068d6
	.xword	0x8a0f90e56397f700
	.xword	0x6b995d45c081ff0b
	.xword	0x2c8add3e8a624ffb
	.xword	0x2e16e56f2565544b
	.xword	0xc34f17680db1abe0
	.xword	0x5f6b0cac0ddd9b76
	.xword	0xccb485d139f2304b
	.xword	0xd62491dc522ba214
	.xword	0x96e3fc659106146a
	.xword	0x183e3d283ea680de
	.xword	0x579a0f874415ac0d
	.xword	0x70a95a8a94c79713
	.xword	0xcbd4d55a8c7ab3d1
	.xword	0x9c294fd7b7bedf40
	.xword	0x76f147c8e6902c41
	.xword	0x2a09671936d97a86
	.xword	0xb0188a7ba265c051
	.xword	0x52365da9f85398b5
	.xword	0x5ce3a24c549cd4ea
	.xword	0x0997977858d8613e
	.xword	0x10ff903f11b96d13
	.xword	0x3bcc7be8847e42b5
	.xword	0xfa98fc57969039f9
	.xword	0x8b3241a17b32119b
	.xword	0x6a56f89c349edcaf
	.xword	0xbcb2fbefb8f813e0
	.xword	0x15eae671b41480c1
	.xword	0xab22cff90539a535
	.xword	0x4a805fa0151d4574
	.xword	0x74d7c3242ef3feaf
	.xword	0x550f1efee8d52447
	.xword	0xf8db06499c1c5e51
	.xword	0xea5998815cf48d9f
	.xword	0xc4f620c5eb705bbd
	.xword	0x3442039e9b4c069f
	.xword	0xd43a8471981597c2
	.xword	0x74b6578873d8970a
	.xword	0xeb162e677d64e28b
	.xword	0x293d82a4f98d806a
	.xword	0xab5fa37a872db844
	.xword	0x9132967b4fdb80f9
	.xword	0xd5b14d22bd9ea6e2
	.xword	0x02ecac331c99bc9d
	.xword	0xc3c12e51660b9a1b
	.xword	0xdd3bf9f8a8c3ebce
	.xword	0x464c5c6c72d0bb7e
	.xword	0xae065476bdbb52b8
	.xword	0x7884e4e8b8d81a46
	.xword	0xfca9bb66185e3bbd
	.xword	0xdfa3c1af6fa3b786
	.xword	0xef91360b3bc14e59
	.xword	0xaab3481014417344
	.xword	0x38dcd3ec5064980e
	.xword	0xb4705852b26fc1bc
	.xword	0x7cc8217cc5389f6a
	.xword	0x17c6502d1873ece8
	.xword	0x2294289c5c685943
	.xword	0x18d997bfa26b353f
	.xword	0x8f59b1aa7248f8f4
	.xword	0xceb8d12d8c7861a1
	.xword	0x5aec5a9322d7f233
	.xword	0xed3c9ad53357cb42
	.xword	0xa8a2d24ee52f5bfe
	.xword	0x9ad06aecc0841bb0
	.xword	0x0e86865b8f7e217f
	.xword	0xaa9790e1e01eb66c
	.xword	0x3e71ee6e4937e71f
	.xword	0x85fdc3425a48a2fd
	.xword	0xa6a351ef2e8657d2
	.xword	0x20d2b8d0391635eb
	.xword	0xc82ed2cecb1cfad5
	.xword	0x3d2f009a69040a7e
	.xword	0xdac16747fe61461c
	.xword	0xab7323dfff22ede2
	.xword	0x6fe5127170084b30
	.xword	0xc984734c2a6d7fa4
	.xword	0xeb24b48895769ce0
	.xword	0x44a008c4c29bc7cd
	.xword	0x7c0fc5ca9faa9f1e
	.xword	0xcde6cf67e87a468d
	.xword	0x5a2c3bcaebd58409
	.xword	0x89e722d94ae965d3
	.xword	0x41ed38ef380d9c91
	.xword	0x02b974836f424caf
	.xword	0x67dcc7d7bbab0402
	.xword	0x8d1b7d08d26732cc
	.xword	0x3830137b5531f39d
	.xword	0xc7d48e253c01ad19
	.xword	0x3d82f456b4753595
	.xword	0x08ed6bf68665738a
	.xword	0x46acd32970646301
	.xword	0x38e694dd3bb98449
	.xword	0x2c8bf9745fc7561c
	.xword	0x81f5d5d7a87e025a
	.xword	0x1186df58fe501655
	.xword	0x65d2698307069557
	.xword	0x66770af57e647c8f
	.xword	0x84937d791ac7e734
	.xword	0x4d7defaf90e64e40
	.xword	0x0e82ffa51f9aa1a5
	.xword	0x25d28e0ca345c609
	.xword	0xfa137c706f0e6f4e
	.xword	0x8052f96e3a4c354a
	.xword	0x69732351e36e093b
	.xword	0xcc7dfeaae754e713
	.xword	0x5940677a1c34eeeb
	.xword	0x95f9c5e163711547
	.xword	0x0c1f9e1979f20d9e
	.xword	0x7dd9a93aa65dc569
	.xword	0x7f9a7b1006a89f0a
	.xword	0x0d28a570baae5740
	.xword	0xc90ad22a5b45a209
	.xword	0x12ac3edf31a67b0f
	.xword	0x44a1cec2f6f97f7b
	.xword	0xf616f0a3ea34c1a6
	.xword	0xa8ae21359cc9b6a4
	.xword	0x7f917ee2706e9836
	.xword	0x5ca3ffb0435a3170
	.xword	0x3c46c37c8723b2c3
	.xword	0xad7a34235c62a79a
	.xword	0x41b617d9da98f508
	.xword	0xbb6b9f4aa8a24118
	.xword	0x7a3d3250939951c6
	.xword	0x0eaff8f5accee6f1
	.xword	0x5e2301f0d2c661db
	.xword	0x888cd18b467e68e9
	.xword	0x666ae88e2cce1a8c
	.xword	0xc03f389e1a618a68
	.xword	0x59d859e7ad88d5e2
	.xword	0xa3bb7ef504f0b45a
	.xword	0xa84c03b7f5903490
	.xword	0x747817123a25a7a4
	.xword	0xb6a7d0403c654b15
	.xword	0x385b66383e66a28d
	.xword	0x05f29406f95d0d0c
	.xword	0x12236fa16fc8af9b
	.xword	0x9405260e7f8c351c
	.xword	0x2447007f314a37d7
	.xword	0xbba99db30c1dd751
	.xword	0x499237f50a1ddbb8
	.xword	0x84e920ff0411aa4c
	.xword	0x0f4d1ce72a4e7e4b
	.xword	0x755df255b56ad46b
	.xword	0x41fbf87e4555db85
	.xword	0xf7e40b5af8c9ed11
	.xword	0x4bf32d89baf31ba6
	.xword	0xb15e0be7a92b5edc
	.xword	0xbf8e99262498a805
	.xword	0xfe0e2e4d6ac5379a
	.xword	0x02b82e7a19d40769
	.xword	0x85319437264a149e
	.xword	0xade9a7e09559960e
	.xword	0xfc58fc356ff50281
	.xword	0x69415a9042d677c1
	.xword	0xee06fc6a46c8d8d8
	.xword	0x62fd5b283dae2857
	.xword	0x302b788af54764c0
	.xword	0xc67d4f3505695cdd
	.xword	0xb7deb40830dbe4cf
	.xword	0x5ccd8a890b6193cc
	.xword	0x584593447b941d21
	.xword	0x141d268b994621a8
	.xword	0x0fbf3f2fa0172e4e
	.xword	0x76984b35d9a1b60e
	.xword	0x4cc0593def1e6270
	.xword	0xa8838645ed9659ac
	.xword	0x38205fac79bddc49
	.xword	0x009f4abd4577e8c7
	.xword	0x397e2c59c7975bbf
	.xword	0x7d0ca401f7e1ab0c
	.xword	0xdd0d4afb61334978
	.xword	0x0b977efee04c8d49
	.xword	0xa1e56b8dbdaf9ccc
	.xword	0x001cb1a3eda855ad
	.xword	0x54edb0bc622c0639
	.xword	0x7f37bf2906c1347d
	.xword	0x98bc98add25d3e50
	.xword	0xb37dab991673c865
	.xword	0xb2cb8b272524b296
	.xword	0xc9ae3971292e8790
	.xword	0x0bf3130b6150fbdb
	.xword	0x36d95398b815861f
	.xword	0x92c28e8c58b6c08d
	.xword	0x4ee7b1c239d253b3
	.xword	0xf789b4cb2e67b39d
	.xword	0xd04dde2b0f7b968d
	.xword	0xeac21a3470feeef6
	.xword	0x1bb3b03bebcc9aa2
	.xword	0x23b3b1ceaccb163b
	.xword	0x353ef3c34e60f4c5
	.xword	0x82c961a10eec2c30
	.xword	0x3e0cd8a9ff9cb4ce
	.xword	0x1f47cc46f1202683
	.xword	0x788b4d2ca0b36369
	.xword	0x34058cce6dda65ee
	.xword	0x49d407d067279ca1
	.xword	0xcf2c436b85a09fb0
	.xword	0xa5c46e54db229106
	.xword	0xdb7142c488e39d46
	.xword	0xed970d1c865d9a9a
	.xword	0x7e10289582a924a4
	.xword	0xeafb58c4df9e4314
	.xword	0x94418ddbbae9d272
	.xword	0x78af1960e0976bd4
	.xword	0xcfa6e5f56c61e88e
	.xword	0xdb3f8f16f0f7e10f
	.xword	0x4385a74be9be233c
	.xword	0xd15d34c7bd55df4e
	.xword	0x7df86c6ec972be17
	.xword	0x70085a5c043b39be
	.xword	0xff4b53419a901a6c
	.xword	0x6af133782c226b0f
	.xword	0xd471f5708850ad6c
	.xword	0x80054306736f01c8
	.xword	0x1e9ed6f223456186
	.xword	0x4c72b3a3ad8b350e
	.xword	0x3d7c831a0522134e
	.xword	0x11577bf26ea941d0
	.xword	0x8566e7914bbb3d7a
	.xword	0xed0744fdcb6e6b85
	.xword	0xf1ccdefa56aa1463
	.xword	0x6a41c22a0245697d
	.xword	0xf90b5324c7bfc8f9
	.xword	0x040d92c2c0e528c7
	.xword	0xfc0142666412e8db
	.xword	0xc40cc7a693523b05
	.xword	0x740bda06df0d17ba
	.xword	0xf7b2944691ca1c01
	.xword	0xb2184d0c706d24f9
	.xword	0x8eac3e13798d0e91
	.xword	0xf0795e753de023c9
	.xword	0x1dbef63ce5189e17
	.xword	0xed44f2d3a7e637a4
	.xword	0xfe940ff919b727ff
	.xword	0x53c48e08c67f57ab
	.xword	0x80818d4ad4b75fa9
	.xword	0x40aaa0dec0a97e08
	.xword	0xce9567f09ec82509
	.xword	0x1d596db570a744da
	.xword	0x1e40a8ae64784b32
	.xword	0xdec9da409894197f
	.xword	0x1d41877f6b6db831
	.xword	0x17a8d4e6d22705a2
	.xword	0xedd5ed936d0269c8
	.xword	0x3086f1f2ea874d33
	.xword	0xba5c00a2f54a2ee5
	.xword	0x46ea7dbbf7ee5ed5



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
	.xword	0x46a0992ddfff032e
	.xword	0xce433e5788b10085
	.xword	0x01ed4359490ab677
	.xword	0x2fbfc81441e58d99
	.xword	0x29e0d850a6da4d2d
	.xword	0x625bb32fcaafdde7
	.xword	0xed1acbf4404dc62a
	.xword	0xc19d43f09682ed4e
	.xword	0x3e6531173ecef701
	.xword	0x4275c85b2cd45dc4
	.xword	0x15e0a8b0059e7e7a
	.xword	0x13c6106f4358c6d3
	.xword	0x849102f4da6e099b
	.xword	0x99d65ce9d57ac549
	.xword	0x23a09577187abd4e
	.xword	0x39a9f1a4efd6c14d
	.xword	0xab75af7af5182c99
	.xword	0xaaca62b7329ff4fb
	.xword	0xf752fe8a20f50fa2
	.xword	0xe6a39b4722629c4b
	.xword	0x38beafe3a7d2aa43
	.xword	0x985d8f09b2a28efa
	.xword	0x77e9a5341fd87eb6
	.xword	0x7a11b91ae0acf4f4
	.xword	0x69c9e5a576270f86
	.xword	0xab7570d7e94a581a
	.xword	0xdf65af015c1cec6b
	.xword	0x090ab1a163dd9388
	.xword	0x4b8940b0deba2acb
	.xword	0x06164d3db491c687
	.xword	0xb857c101be15bcc7
	.xword	0x56ccce72ca4d4313
	.xword	0x2fc8e88b18ada7a0
	.xword	0xea611de89db90089
	.xword	0x9b04cb69e7c485c9
	.xword	0x78d5e6bfe3e0f3d7
	.xword	0x8d9e21d76814ac62
	.xword	0xc974fc238a74dc98
	.xword	0x6c2ea3bb79b2ba3e
	.xword	0x8bd6309c4a732209
	.xword	0x6f741832d45b3ccb
	.xword	0x2bb5a8e51f77ef48
	.xword	0x1ad6f47c98ec108d
	.xword	0x06c68e07ee69f95d
	.xword	0xcd92ad62e22c5b36
	.xword	0xaef07dd5e5b15e09
	.xword	0xb5a02248d0488c2f
	.xword	0x9fee8f95dad4f106
	.xword	0xac28745c6d7a7283
	.xword	0x4476743f1053dfa1
	.xword	0x8059b10dc15adec8
	.xword	0x9f84357607c1ae58
	.xword	0x28435a1f8a4353b8
	.xword	0x796e2f7d8ee95df3
	.xword	0xfc7022b4851ec7a1
	.xword	0x2ad9ffe80b23493d
	.xword	0x3a3e8bd6e03e0be6
	.xword	0x7f09ab40760a801f
	.xword	0x2c75e3fabeddae2f
	.xword	0x46420256e42e910f
	.xword	0x3705f47baa9b0415
	.xword	0xcc6bee8ed617410b
	.xword	0xd986fb8c0fc42bd2
	.xword	0xde53c49493e8dcc2
	.xword	0xb8e301f44d8b1a83
	.xword	0xe57884278448a51b
	.xword	0xf1dc916a91302992
	.xword	0xee14de44508d895b
	.xword	0xbe9445d28d93976e
	.xword	0x2872329e6fca1ebb
	.xword	0x6f7e6774b824eaf7
	.xword	0x79d2e2e328e9805e
	.xword	0x93fb2cd3d697a849
	.xword	0x3d44c51e9630d51b
	.xword	0x0aaa763513fdca8e
	.xword	0x89426414b37c5e94
	.xword	0xd27bd14f9e2c98f5
	.xword	0x6f7e761b18306ace
	.xword	0x11465244537ccdea
	.xword	0xb4881e0b314ced81
	.xword	0x336282afebb941ae
	.xword	0xae3030f2a6b6ec21
	.xword	0xb5e76437aa3f2344
	.xword	0x8d3504e89016a0a6
	.xword	0x861ad40911dea704
	.xword	0xd83c52a81c1b0f6c
	.xword	0xdfc5be145a53d5ce
	.xword	0xdebcc52e61fa7ff8
	.xword	0x10ca3be10adf778a
	.xword	0x4dfc3742339bfa3c
	.xword	0x38e497a4babaae4b
	.xword	0xd0469b66b6e45f92
	.xword	0x6901789ac7d4e5f1
	.xword	0x56352fa160c4dcd9
	.xword	0xd7138771ad2d9187
	.xword	0x79d0ffba4fd367ae
	.xword	0xc2433543f40d3e4e
	.xword	0x4f374a6369ecca2d
	.xword	0x58e03e6da2942c91
	.xword	0x3ee66a0277c4077a
	.xword	0x8a8b3bd84d2ddc36
	.xword	0xa5b007ca7eb5bcee
	.xword	0xf897ccb7168de31f
	.xword	0x7ca8a7220d5072ef
	.xword	0xccc18ac07462c259
	.xword	0x0be5a3a82c6c2d5a
	.xword	0x5cec5a7e839f3b16
	.xword	0x86f9a76f81aa90c3
	.xword	0x86d3ad5d2002e44b
	.xword	0x360408e8e8a1297f
	.xword	0xe6614f16c9128e40
	.xword	0x4e8b8e5776c2dd9f
	.xword	0xe6878438bf04e4f0
	.xword	0x7d9342ec674141d2
	.xword	0x078af3a31df64fc0
	.xword	0xa22cab8d4bd2804b
	.xword	0xd9031008fad1c64c
	.xword	0x82e48e43711c4e94
	.xword	0xa7f2566b54638a35
	.xword	0x3877d3ee81fc62e7
	.xword	0x3e495028175a9aea
	.xword	0xf8b8a830af2cf99b
	.xword	0x5ce27224a401d185
	.xword	0x42ab7d4696dd096a
	.xword	0x72bacc265d22e2dc
	.xword	0x3dd278f26aa74bb2
	.xword	0xe83074bb9ecaa7c9
	.xword	0x80f7bf4a169f6ef9
	.xword	0xddbd8921e59fe8bd
	.xword	0x43d04b244c0bbb06
	.xword	0xc6c090e1bb876ae2
	.xword	0x85ef7e551095712d
	.xword	0x284ea997eddea524
	.xword	0x16534bbee0633d68
	.xword	0xdfdc9a96fc47e3d0
	.xword	0x22b0687cb772176a
	.xword	0x54014756945d277c
	.xword	0x293368618864c8b0
	.xword	0x886885499ad3763f
	.xword	0x92855d2ae68dc5fa
	.xword	0x853d975eddc6d7eb
	.xword	0xed1409266665d969
	.xword	0x637698b36c76cb32
	.xword	0x64e4cd13da455eb2
	.xword	0x1486c5ddc1c0a57e
	.xword	0xe17b8961bb0c1657
	.xword	0x73a87e4b5d48b7df
	.xword	0xc5e69c67a946b344
	.xword	0xe9a7ee1d69d0f130
	.xword	0x3a885aecf25065c1
	.xword	0x9d0dbc875882020e
	.xword	0xb874d7ee703e2e70
	.xword	0x01dd232eda973ddf
	.xword	0x12ce8750a52b17ab
	.xword	0xc421d7555490816c
	.xword	0x1d2957af0717ec69
	.xword	0x6528c86a6d87cfbb
	.xword	0x9e09d9910ac7fe69
	.xword	0x62ad672d94779c40
	.xword	0x324e6e66e37757ee
	.xword	0x910ab7e581d6f894
	.xword	0x24fc45ab08e878cb
	.xword	0x96d0c3747cbf03e8
	.xword	0x239f04fc0fb04e89
	.xword	0x3d2aa26ed49e3551
	.xword	0x6423f723eea4b13a
	.xword	0xf7c5cf28e302c58a
	.xword	0x73957d171599c38b
	.xword	0x578da7c0161b86fd
	.xword	0x17f6bf3b608597a3
	.xword	0xf23c4722558c1db9
	.xword	0x6b01b4baaa54066c
	.xword	0xd7bd6066b7fd033b
	.xword	0x0fa29a37a270ea76
	.xword	0x828bf952af51a137
	.xword	0x63942d322043bbf3
	.xword	0x0d75cac1aaba8b99
	.xword	0xa1d6bf27708ee907
	.xword	0x64ee0e5c19c12e5b
	.xword	0x35bbe632eaa7ccdd
	.xword	0x98b04b85a6eba745
	.xword	0xa5da182a5c4eae94
	.xword	0x33c7af18f1e7773b
	.xword	0x321099d98f74f0e3
	.xword	0x6aabd13b707bb4ee
	.xword	0x40ed92084a40c54a
	.xword	0x92da63b6d3f7a460
	.xword	0xb43a812fbd0bf529
	.xword	0xf77f3bfe8ccd4c3a
	.xword	0x7585ab69296308cf
	.xword	0x40fa9d03e8f32bdf
	.xword	0x956a06b2fc590d1e
	.xword	0xb7443efc5e3e0ef7
	.xword	0xca83e13169facb41
	.xword	0x2d65f7b777275c0b
	.xword	0xa8855f333090f0b9
	.xword	0x0d3200ad9b9d3d92
	.xword	0x06aaa2d2bab62ad6
	.xword	0x06b333d03b6bd9cd
	.xword	0x00308842cfb1e98f
	.xword	0xfa83092bcdb46e0c
	.xword	0xff55067844fe0c8a
	.xword	0xd85593b77a810f5c
	.xword	0x597602f7c5cc1ee9
	.xword	0x937466a7f7f45605
	.xword	0x041b482bd50baef8
	.xword	0xc13912d9b3d2a9a2
	.xword	0xa0bcf60828e76352
	.xword	0x3c1b694f1c8e7357
	.xword	0x25d3002b8efe0d42
	.xword	0x3592972d904c0247
	.xword	0xb0f341fdc3ab7af9
	.xword	0x49fa2f390bc1314f
	.xword	0x744be9e068710dbd
	.xword	0x0470a85271fd2684
	.xword	0x2f39305cb2e929ca
	.xword	0x70d43a0fda089054
	.xword	0xa582d6f8a1fea296
	.xword	0xdd46ab127747d78a
	.xword	0xf07167e5509beb09
	.xword	0x77d772036d305221
	.xword	0x94c0b680cd4deab0
	.xword	0xeb66ff3d0f6e7164
	.xword	0x18ae94fd37b092a8
	.xword	0x692c98bbae706c9d
	.xword	0x1cfef953e275fd7a
	.xword	0xe37a2ccf8d511798
	.xword	0x591e3fe5aa79d1bd
	.xword	0x9359e118dc9dc9ac
	.xword	0x95109efaa05e8541
	.xword	0x1039279dc1dffcc2
	.xword	0xd20b1a784bb594f2
	.xword	0x314896a7e7d9ebaa
	.xword	0x813eead07d444944
	.xword	0x20277f89a4698ff5
	.xword	0x79b2fe4b976b151e
	.xword	0x0caaaccf9d606692
	.xword	0x61a3db59ac2d3e5a
	.xword	0x46668253f8753f63
	.xword	0x68ceb0263736ec92
	.xword	0x80f1e5ac571974e7
	.xword	0x0e61e3cc9d9f687f
	.xword	0xa9a091425e81d5f8
	.xword	0xc8021ea6c75aed32
	.xword	0x769bc07767818b8f
	.xword	0xde5dc777244b0f97
	.xword	0x301a0155188eb983
	.xword	0x19b1d12d12f69f4a
	.xword	0x26fc8d9378325e64
	.xword	0x4719dfc98561ac16
	.xword	0xcdf494eee4bf5c24
	.xword	0x8d08233cab3a1140
	.xword	0xfbb878d2538e6887
	.xword	0xd2d52962060c387e
	.xword	0xa00abbf0ecfd0028
	.xword	0x8e07c2355ccb8b23



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
	.xword	0xe32f533dff286599
	.xword	0x4a92bd78b6a09b6b
	.xword	0xbfd890deb696963a
	.xword	0x20bb644446599a2f
	.xword	0xbe1bdbee7e96347d
	.xword	0xb317be65ec344a41
	.xword	0x32cd8b92c88bab52
	.xword	0x55da5307fb7a5b50
	.xword	0xb35e4b32e0ec2d1c
	.xword	0x5a44da68f395524a
	.xword	0x86daf5fe12d66a7f
	.xword	0x873d43280ab0d0c4
	.xword	0x7fa0de92b5f6736d
	.xword	0x6d94ef60f93bf244
	.xword	0x4c307aec4021b546
	.xword	0xf0a19665a96cc601
	.xword	0x8ffe05810b665a60
	.xword	0x3bf3f56f340800f3
	.xword	0xb5edc23be0593ec2
	.xword	0x2df222f55ee1036e
	.xword	0xa17af7e48091af6d
	.xword	0xb403b3fd10c79fc1
	.xword	0x8ee800e37b87e983
	.xword	0x140e8e773b58736b
	.xword	0x2ff94d5d9ba18d77
	.xword	0x7758756a31deca73
	.xword	0x3a8e20d23247925e
	.xword	0xea9e6744d7fe3994
	.xword	0x0acafdde04a31d7d
	.xword	0xb522f0447bec7934
	.xword	0xf4ea688723ce1aab
	.xword	0x11abcb9a003fb6bf
	.xword	0x50e88eeaa457484d
	.xword	0xb298cb11c05e92e2
	.xword	0x3b5c2e84ce4c941e
	.xword	0x580057459a81ce0b
	.xword	0x8be80950eb4bf753
	.xword	0xd19dd62c83abfb8a
	.xword	0x32f327ce8995efb2
	.xword	0xa29cf6794a5ef491
	.xword	0xa1149537031877d3
	.xword	0x27d3906040bcbd8b
	.xword	0x748410b0869bde49
	.xword	0x0eca91e9517e74ae
	.xword	0x40bd401b97423554
	.xword	0xef4851cb2b666e64
	.xword	0x4a353700018f52bb
	.xword	0x93d61229f0743c0d
	.xword	0x65ee2c5665e1b90e
	.xword	0xb90c1e6c4011ecc7
	.xword	0x48a7b94a83358200
	.xword	0x9f56367d17dc0757
	.xword	0xe747af0ea8337556
	.xword	0x0f6dc59b4da554b5
	.xword	0x16a80f277a4b0a40
	.xword	0x04ae49562cd2aa9b
	.xword	0xa4a7f0626ab0681d
	.xword	0x5906da40e600b58f
	.xword	0x26e36dd774b1da35
	.xword	0x9885c74182164f16
	.xword	0xfbb28fda547d61ae
	.xword	0x75ed310234d65f0a
	.xword	0x2fce32aa11f8b0a2
	.xword	0x88f63e51c5ff4e7c
	.xword	0xd7f0bcde31578b0c
	.xword	0x93ef2a2a6946ba76
	.xword	0x008094ded4a5dbb8
	.xword	0x49aa877f5759d86f
	.xword	0x13c5008c84c1afea
	.xword	0xeb6aac01269e1a28
	.xword	0xb23bd6fb8fef94f5
	.xword	0xcc4aa9d7ff69e3dc
	.xword	0xad8626f386956faf
	.xword	0xdd750f43fc3d5bc0
	.xword	0xcfdf761e7d5787fd
	.xword	0xf913a967dd90aefe
	.xword	0xb20bc6fce1b84069
	.xword	0xb63bca9131f84594
	.xword	0x9b5e6aef4fb5724e
	.xword	0xf529b7a666052856
	.xword	0x6df00c7c022f1c94
	.xword	0x9a13d907d2564d97
	.xword	0x74b3f91fd09b9324
	.xword	0x26476c1ef0439cab
	.xword	0x1d92613630ada6ce
	.xword	0xa2f0d64bde785933
	.xword	0x13e38d4965e78835
	.xword	0x8ae49cb5c365fb16
	.xword	0x95f77fc00d39a897
	.xword	0x9499c8aa156dad1c
	.xword	0xa324b2bdf97bd56b
	.xword	0xae21452eddae4e63
	.xword	0xd44f9fe9cb9baa83
	.xword	0xe791c127a1906c57
	.xword	0xf70550f50f8635d9
	.xword	0xb8a4acc7c6734305
	.xword	0x2e0e34deaf4152a4
	.xword	0x7a694a5d30cacc05
	.xword	0x9f66e62ef2c362bf
	.xword	0x618e62f319a3b68c
	.xword	0x8ad244fea51a2cd2
	.xword	0x7e44b05b33318024
	.xword	0x88f352024c53b4d7
	.xword	0x91c57ad91c50d67a
	.xword	0x540707518b7ef5e9
	.xword	0xfbe2a9260b01aa27
	.xword	0xab7d642496464d8f
	.xword	0xa7c5e69a2d96d4e8
	.xword	0xa06d84de49fc174d
	.xword	0x458cd5dfa56533f1
	.xword	0x8caa34455a671330
	.xword	0xb50cd190c0afd321
	.xword	0x6d43768c8b6f889f
	.xword	0x91860f98268ee0a6
	.xword	0x4fa0a2038313e9d8
	.xword	0x555f72856b14050f
	.xword	0x9a05f4d9b78d4001
	.xword	0x5dd645a9f296dbf4
	.xword	0xebe3fc7e5fe75e41
	.xword	0xbeb3a952abbfd3ad
	.xword	0x7da3cfabb44890ce
	.xword	0x5626ae10fdcfb6dc
	.xword	0x6e7eea881e984d25
	.xword	0x0a96f760f07d641c
	.xword	0x652b02596f31fe69
	.xword	0xeabe8481365e5577
	.xword	0xe4c753dc602eebbf
	.xword	0x0fe4e2c3a1024ced
	.xword	0x5973ac3dc237b622
	.xword	0x7b3826a3ddc964ef
	.xword	0xb1b6261a99d02591
	.xword	0xd905b6781112d703
	.xword	0x5cbdd65812e51c32
	.xword	0x98bebbc6100ab923
	.xword	0xa01e28cf1e928d51
	.xword	0x3615660124cd8278
	.xword	0x8d68522cb2f7bdfb
	.xword	0xc5b1dc8f65a0db6f
	.xword	0x1ecf34a4a7e2c295
	.xword	0x2e81f24c8332f76f
	.xword	0xb0f5809204890d32
	.xword	0x9a1e3945e32e744a
	.xword	0xe1e66c55c8f38570
	.xword	0xca3f977826e45490
	.xword	0xc80061add36fd6b6
	.xword	0xb7e16c889ce9f01a
	.xword	0xa5a6bfc4049caef2
	.xword	0xa5f4037f05d6a445
	.xword	0xbd00dca5211c80ce
	.xword	0xe5a996c9702a74b5
	.xword	0x0f9e3d072bf7cb27
	.xword	0x48c79561f6eb2fc5
	.xword	0xe1dc2ea72df6f07f
	.xword	0x07ff1094a7ff757f
	.xword	0xb27ba47db352724e
	.xword	0x0a8cc60094b7726e
	.xword	0xae89fd8350cce52f
	.xword	0xa3d2c9d8efbbcad2
	.xword	0x91f9a25aee8e00e9
	.xword	0x2f7cf88149f67ebc
	.xword	0x2e323911b0c93dae
	.xword	0xa1fd7ad41f0c86db
	.xword	0xe4ae259c44e13279
	.xword	0x053e1ae9ec6c93cb
	.xword	0x178b7141f277d672
	.xword	0x0f9ac126ad080bee
	.xword	0x0850f518c736dc7d
	.xword	0x5690487ac0a5a559
	.xword	0xa0a9539b50f76155
	.xword	0x3b278316a66a7f4e
	.xword	0x29c72ac1010d6d69
	.xword	0x7d3d5abba34de728
	.xword	0x3f7ab4d02a03d54e
	.xword	0x018e80bc5519e128
	.xword	0x380f896367ed5b52
	.xword	0x8c3a3fccd610318d
	.xword	0xca3a96ec521aef31
	.xword	0x3a4443e157329f0f
	.xword	0x6acc41cea1c928fb
	.xword	0xe1e316bab65ed275
	.xword	0x72c147593c2962a9
	.xword	0xde9c2809dd800657
	.xword	0x2a520e8d0d3be551
	.xword	0x4c39902c4e55d3ea
	.xword	0x876b8b1427c00645
	.xword	0xe9f06ba1cf5f6113
	.xword	0x91d495b53d6f4014
	.xword	0x67b609c930339daa
	.xword	0xcefb9edb416d0c9e
	.xword	0x025ee14cd8f11d76
	.xword	0x074c8d87054bd3ab
	.xword	0xfbf538b0682ee0e0
	.xword	0xde95e3eaad723a40
	.xword	0x01a4b1318fa210c5
	.xword	0x5930fad449d24249
	.xword	0xac0f646fb4257437
	.xword	0xb2216ab4b0d99121
	.xword	0x3681baf5e3a0d423
	.xword	0x93619d82abd00410
	.xword	0x0eea30fc6f7fbe4f
	.xword	0x0daa196e12f49d05
	.xword	0x7f1cc9d78cc4c5d7
	.xword	0x86201ed55ef5ab6b
	.xword	0xb321cd9d2efd1455
	.xword	0x61d8a21013916163
	.xword	0xe3121e3e7323a81c
	.xword	0xad9cbc3942543f5e
	.xword	0x79c4926c763dd271
	.xword	0x7c3212875ebd4379
	.xword	0x4296c356c6e630ce
	.xword	0x90d318b1fa52953a
	.xword	0xbef4fb78d51171b6
	.xword	0x3024d5cbcdbb1daf
	.xword	0x572c4c31aac5401c
	.xword	0x031e208f6392d783
	.xword	0xb2cb31bb5bc4e407
	.xword	0x93b02543e46f3768
	.xword	0xe7004d7151aa7b2e
	.xword	0x1e87630f02e73b46
	.xword	0x50036cf4bd6f6503
	.xword	0x5b97a056aa79292b
	.xword	0xbdad6791544a6777
	.xword	0x71b79cc749378a05
	.xword	0x8a4aab5c6f0c27a9
	.xword	0x8763b66582365411
	.xword	0xd1edb357043c8421
	.xword	0xc876c857f7a198ab
	.xword	0x723940afe421950c
	.xword	0x0cbea95a634fc840
	.xword	0xb59aab19f9a61f3f
	.xword	0x9231a4862921d8e7
	.xword	0x4ef854733df4b4e1
	.xword	0xbbff3f21d858b026
	.xword	0xe7b9647438fa1dd9
	.xword	0x1206387a69dc41b4
	.xword	0xcb980b99254c2cac
	.xword	0xacb39fdb5989f8d6
	.xword	0x874b3c5ce1d150c3
	.xword	0xf0101c74945274d2
	.xword	0x28e446e20f088a1b
	.xword	0x72873143dd004038
	.xword	0xfab8437eb4ee231c
	.xword	0x558f3a2206691723
	.xword	0x6a24510386acc1ab
	.xword	0x389eefbf9cbb297b
	.xword	0xd2777320cba95770
	.xword	0x58508ba945be68ca
	.xword	0x483242fccda66ff4
	.xword	0x82de407c7e5077e4
	.xword	0x075f5e86a37aa6f5
	.xword	0xef9940733866ea49
	.xword	0x9e0f92932bb05c1e
	.xword	0x9c82abcedfe77b5c
	.xword	0x1ab001cdca2d7e4a
	.xword	0x947c771e20a375c4
	.xword	0x15336569b3391f41



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
	.xword	0xd0cbc43e993b1289
	.xword	0xf5a47e00a954c602
	.xword	0x96f49bd6f3b27502
	.xword	0x6ec959ff450a5536
	.xword	0x2799acf61cd1a827
	.xword	0x1c1a56404e62cc28
	.xword	0xda86946933824355
	.xword	0x4a610f0fc87709b5
	.xword	0xe2751edb46ec52a4
	.xword	0x4970fa6680e3d1c1
	.xword	0xd367cd6b7df85739
	.xword	0xa1636483e5a89b5a
	.xword	0x6ef28157d7492a1a
	.xword	0xb10db4e9a4c3fe3f
	.xword	0x7559f48b49344fe1
	.xword	0x639d8f9221804679
	.xword	0x4e46556531e6343e
	.xword	0xed441436063062e4
	.xword	0x2aac17ad189f3d18
	.xword	0x37fbf9d2c4e94aaf
	.xword	0xa34f85b9bc72e432
	.xword	0x2c9234699cfc663b
	.xword	0xbe6b8f8970274a5f
	.xword	0xe9341d1580986dbc
	.xword	0xa2b3da766acfd388
	.xword	0xa8c66e88f20d267c
	.xword	0x66deffe015733c9f
	.xword	0x1cb4fcc53dc646ce
	.xword	0x5431c6e6de350c21
	.xword	0xd9c01116954477af
	.xword	0xa17cfd1831a13520
	.xword	0x1056d85fabb57ed7
	.xword	0x6e5fca12ba779e1f
	.xword	0xca1f0159c2da682f
	.xword	0x546370f1b66c54e6
	.xword	0xc01ad6cbe560c605
	.xword	0x104c843206b7afc1
	.xword	0xe458c2881e0b4a9a
	.xword	0x8df10003d74ced88
	.xword	0x60333fc3b7610fe6
	.xword	0xe40c7e6bd1e80771
	.xword	0x4bd03cd4bc74aa1b
	.xword	0xf8ecac311a786633
	.xword	0x69255af9768a4876
	.xword	0x801e5375200b4009
	.xword	0x0c5eb5131890d009
	.xword	0xd4cd1d640fc57eef
	.xword	0x32cdfad6de9698a2
	.xword	0x046600fad2f21fae
	.xword	0xe8b81d97df2489a7
	.xword	0x4fcdbcfc0fc94552
	.xword	0x966a5af8de05ee6e
	.xword	0x81c41a1c4100979c
	.xword	0x1a5f625438a0567a
	.xword	0xf6af129c6ef29fa8
	.xword	0x716bd76316d98f86
	.xword	0xf0021cab54f28115
	.xword	0x8e8d3f461c2c235d
	.xword	0x3eccddaa1ee07928
	.xword	0xc6b4d7b3515f92b5
	.xword	0x1b967b39fe5b1997
	.xword	0x76e4b66345b56a39
	.xword	0x0ad5f67ed5173a2e
	.xword	0x625c45386deca49f
	.xword	0xb4e7f8b3d78db7b8
	.xword	0x0ec82421718b2d58
	.xword	0xec0f0fb5cf34db50
	.xword	0x56658cfb72f422fc
	.xword	0x5bf4c346dc19da0f
	.xword	0xdf7ae4eb57e312c9
	.xword	0x5d4a53b1419e5bb7
	.xword	0xe3075bc0ae69e521
	.xword	0x5407c743b723abec
	.xword	0x1d56c828f2477ca4
	.xword	0x3986264260ebc438
	.xword	0x9d95924fb406a2f4
	.xword	0xb1556371fe407b38
	.xword	0x755d24a38b434648
	.xword	0x5114d5d39d14305d
	.xword	0xd7f1717c3eaa3c7e
	.xword	0xc79554baebfdba02
	.xword	0xd89b9979d447687a
	.xword	0xf9bf9ae44450cf05
	.xword	0x55c7b274a77c4f6a
	.xword	0xf739460a9701ad2b
	.xword	0x3853d2e05a6cff24
	.xword	0xd9ec9388a3b1d02a
	.xword	0xc13f70601be6fa8b
	.xword	0x708387c117ec6f92
	.xword	0x9d587bdd9fa4c987
	.xword	0x05ea36983490be6b
	.xword	0x84110e5a788f945e
	.xword	0x000e66ce0b41b372
	.xword	0xfb31bba743630838
	.xword	0x68a8a2778c33e4f0
	.xword	0x10e5bfc2c374fea6
	.xword	0x1bdbb9fd2c0cf189
	.xword	0xd7c514ba3990256b
	.xword	0x2d3568605f467b69
	.xword	0xad4a270702d20c7c
	.xword	0x737e83d258588f64
	.xword	0xc784ffcc98ae7676
	.xword	0x99995a37c73a2edc
	.xword	0x8024062ca5b2719b
	.xword	0x643786492728b54a
	.xword	0x4ebe35113fe9caa1
	.xword	0xc4917e2d15a60032
	.xword	0xdf5d454d11befa54
	.xword	0xadbf0aa14dcd489a
	.xword	0xc82a8a93820d3377
	.xword	0xf7eb26daaf5b9c1c
	.xword	0x76fc5f8ed3a03611
	.xword	0x5aba74afb371bfa5
	.xword	0x6f4c848a32043ce1
	.xword	0xd24913090894c6bc
	.xword	0xc63b67c0047e0eab
	.xword	0x74c7908e8c972a12
	.xword	0xe33c12a74d00a56a
	.xword	0xe6c3e6118af1bbc5
	.xword	0x60096d845f9182ed
	.xword	0x487e116bf00e9a30
	.xword	0x96b43f06699877c2
	.xword	0x473c61df9a73e424
	.xword	0xa5429661d62dbc35
	.xword	0x248c89b5ed04fe21
	.xword	0x567faacc6385d437
	.xword	0xbeabeb3e79372b15
	.xword	0x5be87fe592d0e1d7
	.xword	0x03601d7147998299
	.xword	0x17ea970e17468134
	.xword	0xce50aeab301e7cae
	.xword	0x8e766c9113a06de5
	.xword	0xa374ca61a5a72021
	.xword	0x457f6d6764811962
	.xword	0x2045be15d50345b6
	.xword	0x644295fc91803e61
	.xword	0x87bd7529f9bc2391
	.xword	0x02bebe815f3a6d86
	.xword	0x9d2fe03c56be9c04
	.xword	0x5767b890731e4850
	.xword	0xd97a4ff46322c875
	.xword	0xbf2ccfc7f19632db
	.xword	0xda811889a5d94b81
	.xword	0xc2a43b040b4256b0
	.xword	0x2fd9fed4f0440ccc
	.xword	0x4b60af4993af88ab
	.xword	0x8a7018e6eced99c5
	.xword	0x46131c27a82f2ba6
	.xword	0x1f75250e1293b11a
	.xword	0x1675d8b94c63b12a
	.xword	0x2c0c753b34b7b40b
	.xword	0xf961c4928e8afb62
	.xword	0x3869eca57cba392c
	.xword	0x43e92a2d84ee1512
	.xword	0x7cca6e8959d068c1
	.xword	0xe839f78c24baafb6
	.xword	0xe6ce14eafaf35748
	.xword	0xe3fd0b07acd85a9b
	.xword	0x33f10df077940f35
	.xword	0x8479de91c4161642
	.xword	0x7d167a09c05f6ecf
	.xword	0xe334d4c4d8dc5e67
	.xword	0xd315542bfd083066
	.xword	0xb3d3f2076a5ddced
	.xword	0x39e4a5a32b4f2459
	.xword	0xe8f3fa09fc7fbd32
	.xword	0x3aa1618a9d338faf
	.xword	0x4c608325ebe90846
	.xword	0x471a229ee402beba
	.xword	0xb087d67af325c734
	.xword	0xbf9c707b0b66195d
	.xword	0x579bc1f27fa88415
	.xword	0xc4c17f993b489a96
	.xword	0xb0e45f089ab7a175
	.xword	0x278212d1db2725e6
	.xword	0x91ba0d9141453a1e
	.xword	0x56d3eb1d3274458a
	.xword	0x0751fafa6ce36b3a
	.xword	0xe9d72b5afadaebf4
	.xword	0xcf5b05eb789edeee
	.xword	0xe2d3e857babde135
	.xword	0x039b8c542562f255
	.xword	0x463cb0e6bcc53923
	.xword	0xba847dd857df8251
	.xword	0xd2cc5e3973c1e9fd
	.xword	0xd4362ccb07c34625
	.xword	0x84d994a420b0e2b8
	.xword	0x6186bba169700c19
	.xword	0xefaa9b62ff49331f
	.xword	0xd541425939b75dcb
	.xword	0xe722b7efce84c02c
	.xword	0xd2eeb394dba87b22
	.xword	0x917b8770cb57248f
	.xword	0xc37eeb881c3a228a
	.xword	0x0a7a39e7c108569f
	.xword	0xf6fb2dea89d3cda7
	.xword	0x19e7becb1d5ca911
	.xword	0x470c357aecd32513
	.xword	0x12c7df3a8a209be0
	.xword	0xc4c207546b581cfe
	.xword	0x181700a8ec707ec2
	.xword	0x97a9e4bad0730ff1
	.xword	0x8042aa1c3c01482d
	.xword	0x49dec1d86bb79d13
	.xword	0xd2c6f2522c86c1c7
	.xword	0xdf647e5a71546140
	.xword	0x21cdc7ecc0c1fe0a
	.xword	0x4ec854bdd9195354
	.xword	0x362e80ff8b666cc5
	.xword	0x26388a6d8afe382c
	.xword	0x5c98277bcd80f2b5
	.xword	0x81ed133c57f54971
	.xword	0x75686508658469fa
	.xword	0x43d7c6bcfc2d3326
	.xword	0xcee5ee4ff618864c
	.xword	0x297706d895243211
	.xword	0x80832dacbd12e326
	.xword	0xb8f7060d8d7d00f0
	.xword	0x88b1498b0743b21e
	.xword	0x34ca19712c9e1e7e
	.xword	0xfe1b4b778113b8ef
	.xword	0xcadf21de0a1a5c00
	.xword	0xb18a7eb90ccacbf3
	.xword	0xe4dbdf01cf09bac3
	.xword	0x2f0bbe769547c9a0
	.xword	0xdf38126da25b1d0c
	.xword	0xd006472fd1b80d87
	.xword	0x95c445c5a8f7d6b6
	.xword	0x3a364c75e694edbb
	.xword	0x754adf42425e247e
	.xword	0x492d78a52ea2a105
	.xword	0xf30e2de5ba673e03
	.xword	0x886bd30504df9932
	.xword	0x0c0ebe8781fdab7e
	.xword	0xa0c44fef02c8e740
	.xword	0xd2dbf34c7716018e
	.xword	0x1ccbb6e6303f25e3
	.xword	0x1dfdf7307ebeaebb
	.xword	0x4ce07eba2214ee6d
	.xword	0xcae65c7d67765dd6
	.xword	0x08cbc46d572d834b
	.xword	0x16bbf5957d4bc36e
	.xword	0xb7b4e6862b218fd5
	.xword	0x1726ee4398343bf2
	.xword	0x950722b25b22979b
	.xword	0x1d1c2db736a8c5dc
	.xword	0x142686dcfed58a41
	.xword	0x0e564bd928b13b7f
	.xword	0x292514b70afcd8bd
	.xword	0xcb73775802faf434
	.xword	0xb5cf9849ec17fb5f
	.xword	0xfdc1aa3aa0c3f846
	.xword	0xa9d4c144adc21a5a
	.xword	0xd1c0d69c206fb36a
	.xword	0x9d7ec653d5ac2c92
	.xword	0x07c699629aa23844



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
	.xword	0xade69a8227f1305f
	.xword	0xf167636d26833224
	.xword	0xac54a5c7ebdf0808
	.xword	0x70efbc57135bdb2d
	.xword	0x20b364127d0806db
	.xword	0xe663a13a0ac905c8
	.xword	0xcfd24c0e1cf367ea
	.xword	0xc62bef25f73461d3
	.xword	0xf582811589fe5470
	.xword	0x5ee4ad6ac6316701
	.xword	0x919fb499baa7dacb
	.xword	0xde4789784b6ff5a4
	.xword	0x27b8c9a3d3a4f4b0
	.xword	0x55484876fc844f4e
	.xword	0xaff62c1e0e22feca
	.xword	0x8f0d8d5de77ac2bf
	.xword	0x8b8c327a27dc3afe
	.xword	0xa1d852bd0c1f6d46
	.xword	0x206413c0f6ca06f4
	.xword	0x1a4025d27d096326
	.xword	0x7d9e6b05a41f6cb5
	.xword	0xe95168d44d0fc00a
	.xword	0x64d534b26866412f
	.xword	0xfa80e8637888377a
	.xword	0x259fdad7f06c0557
	.xword	0x2abda30edcc935fe
	.xword	0xeb00710fb163ee1d
	.xword	0xab88168415670620
	.xword	0x25b6b9ac7d964d7b
	.xword	0xfe806ac9081383e6
	.xword	0xb4a0869d7610d243
	.xword	0x1aef02540b544753
	.xword	0x9a9f7fa21c33acff
	.xword	0x110940604c745c42
	.xword	0x074aff533c32b79d
	.xword	0x0ad2558ce3807687
	.xword	0x60cb0f58ccf6ce95
	.xword	0x91fbc48b0ed1fac8
	.xword	0x2a6752a2e1740f82
	.xword	0x95059319f8984e9f
	.xword	0x49cb4e1ae4e486d3
	.xword	0x7b6a5c71a534e24f
	.xword	0xb564554b126de3c7
	.xword	0x7b0dd3636919c6e7
	.xword	0x5fbd0581f46def22
	.xword	0xe39767f2efcb909f
	.xword	0x049c10b45164fb70
	.xword	0x64706c866a7f656b
	.xword	0x7aa48ccc6c7590bb
	.xword	0xeaf17caf71911fb0
	.xword	0x983855144e5227e8
	.xword	0x9e52404fe61f0ddf
	.xword	0x6b4356cf76b52f2f
	.xword	0x81088e6d1c909c76
	.xword	0x7b7000f13675858b
	.xword	0x59be1290b9dabd24
	.xword	0x425f7f2bbab1a25e
	.xword	0x172fefec59dcd94b
	.xword	0x41bdcf6d79b8b4b4
	.xword	0xa89f35847672e2ff
	.xword	0xd20988363e3f1ba1
	.xword	0x17d630915881ed2e
	.xword	0xd21f39f94169e94a
	.xword	0x71c8713fa6e38488
	.xword	0x847a4ab6a367ef04
	.xword	0xba085ab3cdd7a474
	.xword	0xdc2df80c33b47b62
	.xword	0x1f87971ff8c594ac
	.xword	0xd789af8427d4b1b6
	.xword	0x414da649035f8b18
	.xword	0xd871824989677a03
	.xword	0x7461f703b8124a29
	.xword	0x9d4ba21e5e812fe8
	.xword	0xcfa23dd500c6016a
	.xword	0x7640f7f06f14ff48
	.xword	0x212fe0d21bfede6b
	.xword	0x81267a6b8b701ad6
	.xword	0xcd43fe4034026b64
	.xword	0xf9b8dd625ba4b488
	.xword	0x3527211b6960e1a1
	.xword	0xb0f0c95c512f4db9
	.xword	0xad5b92397f7a0ed9
	.xword	0x41ced4653c08a7b7
	.xword	0x969ef225829642ad
	.xword	0x16baa78d4ebb5a9e
	.xword	0x004cd43f29ad1771
	.xword	0xb30273d8c26d9a4d
	.xword	0x0f5ee79a3b4787ec
	.xword	0xd1dbc0c1b40703df
	.xword	0x55f1db83a669caa9
	.xword	0x3358dd606c14f623
	.xword	0x9a3def0be95b56a1
	.xword	0xa88b0c8e601146ed
	.xword	0x933d2be7a44c8558
	.xword	0x01cdcd64fb800f90
	.xword	0x06d6daa6cd83e4f4
	.xword	0x26f29acf43c1a000
	.xword	0x9fa8594da829b231
	.xword	0x9297b542cb9227e1
	.xword	0x6c2ebbc043837312
	.xword	0x168dd9eba07fb1b9
	.xword	0x6bf90bc59ac636de
	.xword	0x748c05603fb8db4f
	.xword	0x7da4336b54136b3a
	.xword	0x8a4192949a30533d
	.xword	0x425fce0489d222b6
	.xword	0xcd62f2f31fa64d9a
	.xword	0x80f760211ba580db
	.xword	0x1fa11b8a47bcf640
	.xword	0xe6c032a6a92f1ced
	.xword	0xf9b7676a677272d6
	.xword	0xd074e9c1e4c8d6cd
	.xword	0x5924b9df67c7f9a4
	.xword	0x5e01aa66ec15e79a
	.xword	0x2d1358469a907718
	.xword	0x39a4faa0f146fedc
	.xword	0x1ade6aa600b39ea1
	.xword	0x56f612f46dbfe13e
	.xword	0x74d3fbc165d53c68
	.xword	0x32e4ec72f904cc4e
	.xword	0x91b2739b96c508eb
	.xword	0x24c958bd20032864
	.xword	0xda649aae82b34c83
	.xword	0x983f4c8a55df6f9b
	.xword	0xa0c0346ad019ecde
	.xword	0xc83e3d208f1298ee
	.xword	0xed7beb0a2149c141
	.xword	0xa223e0521fb1a8d5
	.xword	0x1249b701c6ffd06f
	.xword	0x6080839e9108c8a3
	.xword	0xc1c49b7b29280d8c
	.xword	0x69c82acfa721ae7d
	.xword	0xd315e602af9d8ad8
	.xword	0x6af8a16952b8dc23
	.xword	0x033457a024ffff98
	.xword	0xdda5d62dd2048df8
	.xword	0xd1ee84dfe3df7cd8
	.xword	0x0e1f26b1d5eead70
	.xword	0xce0d43d2f42eb5f5
	.xword	0xf66e91e6b42d9ae2
	.xword	0x6dbbd7963b384174
	.xword	0xa9efdbd12327f764
	.xword	0x6b5dc91497f20716
	.xword	0x12766f5eddbffbd2
	.xword	0x3dc83c40d65791e7
	.xword	0xe59acc8862c652b0
	.xword	0xaf2004e8163b4e1a
	.xword	0x46ea7658e05ff24e
	.xword	0x0e490df60dbacdd8
	.xword	0xdb0bdcac0c657bc8
	.xword	0xb1eee4106dd63781
	.xword	0x39558b1ec93c4ac0
	.xword	0xe178c28ca30b5247
	.xword	0x3d37866c2484c33b
	.xword	0x37d75fd95c3e0954
	.xword	0xf85f85fb3a4bd12a
	.xword	0xc7002cb480e95528
	.xword	0xb3928cc6847b3941
	.xword	0x3b48d64fac192255
	.xword	0x039909f2d61ae08b
	.xword	0xb1934f49eea9ec96
	.xword	0xd7a97360671ca721
	.xword	0xb766d0f9e624d2c8
	.xword	0x14248d6abf46273b
	.xword	0x13835ba1378a024d
	.xword	0x791166f594a19ed6
	.xword	0x3e0e873fca09a047
	.xword	0xb9571528e65b596c
	.xword	0xa58108d4ebc6ef12
	.xword	0xb154742747eb8c4e
	.xword	0x5c10d21802695931
	.xword	0xc38a40d3d030dc83
	.xword	0x04a08af945a6a8df
	.xword	0xdbe5828d7e6740a2
	.xword	0x623047e61c6f7dee
	.xword	0x6c204adf84d67449
	.xword	0x2659225a7e8f52ae
	.xword	0x332b84a257e0495d
	.xword	0xceb7a6f4dbabb76a
	.xword	0x89ef478629f02bd2
	.xword	0x02f0380db611fb44
	.xword	0xf42cbe3a832c31fe
	.xword	0x3f6d00e28fa8c7b9
	.xword	0x988e7da1dfad7268
	.xword	0x694629bee1274e29
	.xword	0xb58217f78347d48a
	.xword	0xb9c7c50bc26b5fe5
	.xword	0x3082143033bedf28
	.xword	0x3d6bde8bd1946244
	.xword	0x4ac73371c50eee87
	.xword	0xa1486fc4f975ef65
	.xword	0x16a539c984078d46
	.xword	0x1acce72c7dcf4e34
	.xword	0xfe9c8db9c39676d7
	.xword	0x9671f6871d395c70
	.xword	0x5af522463a345e7f
	.xword	0xd30e43f3e529ec18
	.xword	0x9381f215e192280e
	.xword	0x4c7ddba7498489e3
	.xword	0x1da68cdac096245b
	.xword	0x270375de9404d5dd
	.xword	0xd233d784952858ea
	.xword	0x916db6805876d17a
	.xword	0x9fe0d3027a278169
	.xword	0xdb5d5aeb108a7f62
	.xword	0xb2830fd0b4232266
	.xword	0x5dffdebdeaa2446a
	.xword	0x51999f2c2b4360f9
	.xword	0xe366973bf06c9029
	.xword	0x5590debe1d3ba977
	.xword	0x26d5ef4a2dd20722
	.xword	0x8b18be7f690abccd
	.xword	0x008c4c0864e662e6
	.xword	0x04be814fd2d09f60
	.xword	0xd57431bcacb45452
	.xword	0xcdd9199813290a5c
	.xword	0xd1cf5a4827952e41
	.xword	0xf50724afa3fc28df
	.xword	0xf55147d8bbe721e0
	.xword	0x29c51c1c681008b2
	.xword	0xd42779b5fdb6fbed
	.xword	0x47641651fea0ff22
	.xword	0xa13227bcad3f06b0
	.xword	0xbeca9d75f6cdc068
	.xword	0x3bdd23bf93fc366e
	.xword	0x79004a4cb04a061f
	.xword	0x048b0c095a2ab336
	.xword	0x9cc6a4887fc5a0b0
	.xword	0xed0f8fbcc6dd77dc
	.xword	0x44ae923a3d9e0e4d
	.xword	0x4eea5593c4fc997b
	.xword	0xf1af8401b0c8bf53
	.xword	0xe3e7616bc4e6ac5d
	.xword	0x74b95a5e87faf2d1
	.xword	0x1607d92a4f51fad4
	.xword	0x7278cd91b01d5116
	.xword	0x63d8824bf62ab8df
	.xword	0xce8b51581b71fd9f
	.xword	0x8e5c34126bb6c984
	.xword	0xb4b9c8de5a362a09
	.xword	0x4760caa2162d2f1f
	.xword	0xcb8eb0df56ddeb8e
	.xword	0x1b8eb5d22ce75cf8
	.xword	0xa41f2515160b7ff5
	.xword	0xa3357243d302c6a0
	.xword	0x1c41092f04c0d4b5
	.xword	0x27ade6ecda4992b2
	.xword	0x06f24dbf08f1023f
	.xword	0x959d6cff14098934
	.xword	0x4a1d23620a799f40
	.xword	0x6825409ce9ffa884
	.xword	0xae0469bf693da9cb
	.xword	0xb7f1db66f7d6e513
	.xword	0xd2fe2fb6a2a490b6
	.xword	0xdfeb7505cd96cd05
	.xword	0x2ed9cc2eb5faeb5f



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
	.xword	0xbc4c6d1a6df60aa0
	.xword	0xac02c2949e213d41
	.xword	0x63f3914154fe7420
	.xword	0x2436ec644933f76a
	.xword	0xbdbd8da45b3dc746
	.xword	0x6fae1ee693d45cc1
	.xword	0x6132753fb810a7f4
	.xword	0xee441d81857bea4e
	.xword	0xeee0b87681f781a7
	.xword	0x7bd4b5a334878ebe
	.xword	0x37e676462d907714
	.xword	0xca49152e24611934
	.xword	0x19c044e8c55f0297
	.xword	0xbb49f1366a4e15ce
	.xword	0xae26e37177f33770
	.xword	0x4cd4223b33447945
	.xword	0x21bc79717d058c9d
	.xword	0x03323432b1d11396
	.xword	0xda17aa32e906468c
	.xword	0x4349084d0ca1527d
	.xword	0x054088352c07e74c
	.xword	0x89aeadf4572ed79e
	.xword	0x12e106a2c7876d8b
	.xword	0x84e795772276d9b5
	.xword	0xa3cfcfde91a21101
	.xword	0x5ac7d2e57d018328
	.xword	0xce68cee8efda5bac
	.xword	0x3b57c94e4f2d07ee
	.xword	0xfb3c06ff7d1a2258
	.xword	0x0fbfd88650b69b41
	.xword	0x661060568a5d8798
	.xword	0x32116f60c28e8ade
	.xword	0xc8fda2c8d812b5af
	.xword	0xdaaafa410044a25b
	.xword	0xd10380007a49de82
	.xword	0xd5eb358c0eec3b33
	.xword	0x1905e3d566a28816
	.xword	0x3a3e8ab13d1ca6bc
	.xword	0x408e9b49e2f03ab3
	.xword	0xbf2d1d3441f6d267
	.xword	0xbd023486dc7b3298
	.xword	0x0730e842a726e33d
	.xword	0xd9c31fa3df5781f5
	.xword	0xe27afbb766c61b24
	.xword	0x91f7bf8c1b366a2a
	.xword	0xe41940b87ea64710
	.xword	0x164bc7fafd00d42f
	.xword	0x4c03d95576e6eacb
	.xword	0x223ac20e85cfd921
	.xword	0x7d061451928bc6be
	.xword	0x9f56854206cd7d61
	.xword	0xaf4af60f6eaeb4a0
	.xword	0xa5f6205347a75776
	.xword	0xe0e8baffb2488c24
	.xword	0xcd35b98714548859
	.xword	0xdb0e6ac29fb6f879
	.xword	0x4a4a8523c6ae20cb
	.xword	0x90bc715d7275818d
	.xword	0x38c76e047e509266
	.xword	0x7ff813e9fe643924
	.xword	0x9005b267daddf89c
	.xword	0xa565e3dd8810e76c
	.xword	0xd2c6ef9a421bccdb
	.xword	0x79994d7bd6f1de58
	.xword	0x762c7c2e2e3700fe
	.xword	0x238a1fa95e4d6c89
	.xword	0x232068fa514705a1
	.xword	0x8c2266687725d231
	.xword	0x1ba19ae598ecd419
	.xword	0x46783b5d843fc23f
	.xword	0xaf9f00fe04770039
	.xword	0x455b889b4094b607
	.xword	0x55690f5fa9c99e6d
	.xword	0xe3d6e3347b4be399
	.xword	0xcf404764981d0021
	.xword	0x1b02e89c768196e4
	.xword	0xd330fcde71586435
	.xword	0x662e8a222eef9514
	.xword	0xc6c1fe9675a38a56
	.xword	0x6fa5c59ec3ae7306
	.xword	0x965c7a86b45bff89
	.xword	0xf3f92d32e920ae75
	.xword	0x8f9243313a87f795
	.xword	0xbff6e308b79df7fa
	.xword	0xbec44c2655f43721
	.xword	0x9acae2ed54410a40
	.xword	0x130b7720186bcb14
	.xword	0xa7bd52438ad70d63
	.xword	0x25d3c0862c9b893b
	.xword	0xf6a69a23b7a9cdb6
	.xword	0x0171a5a8e19c96d4
	.xword	0x53458c4b00f91bd0
	.xword	0x8ec4aaba73f7c26f
	.xword	0x2c7298ba87cb9ff2
	.xword	0xee71d17f5e7a3b83
	.xword	0x1e597d28008e3a60
	.xword	0xbd6cb02e1457a227
	.xword	0x86239bf530f5d42f
	.xword	0xdfead6609d6c65e1
	.xword	0x4a230c7a502cc3dc
	.xword	0xe50a55a8bea88f0d
	.xword	0x7f441814befe47b3
	.xword	0x0deba8754188829d
	.xword	0x952623b181a3f436
	.xword	0xa1410827b9ef5c43
	.xword	0x847c037c55206905
	.xword	0xca99e2c403abdcb7
	.xword	0x2b7d946232b268b8
	.xword	0x6928deecbece7cd6
	.xword	0xcd55ca97be028816
	.xword	0xb9971e324aed24e3
	.xword	0x20007aa67546706e
	.xword	0x0dcdc97a91d891e9
	.xword	0xb95310b9948be762
	.xword	0x36f2c009b2d76517
	.xword	0xc21abf7ff0372f67
	.xword	0xb7047802af14ee6b
	.xword	0x819677aacee9a106
	.xword	0x640340d14944896e
	.xword	0xc698fcadb12cbd2d
	.xword	0x8a3effdd8b47beca
	.xword	0xe6ac5c6346ceb890
	.xword	0xfc41445e1f697891
	.xword	0xe02aa440e45143fc
	.xword	0xbf5b5140365a6dd9
	.xword	0xe9b6d890ab2755ec
	.xword	0xd3ffe5244c5524e7
	.xword	0x56c33f8807b9953f
	.xword	0x28b2550bae9e5809
	.xword	0xa7909efdbd707db8
	.xword	0x00cf7c81595cb1eb
	.xword	0x87441dbf1c28fef7
	.xword	0xa08bfe15df9da844
	.xword	0xccac7908ba3cfbd8
	.xword	0x284c10a4e2de240b
	.xword	0x4410e160136ad2e9
	.xword	0x743cdd32e78622c0
	.xword	0xdbba80c070513d0d
	.xword	0x2ec85a3add6125d1
	.xword	0xed6433fc85edf51c
	.xword	0xf25788018179da54
	.xword	0x77ee90dd67aad718
	.xword	0xb3d4963066767e2d
	.xword	0x1583f5ef81df77b8
	.xword	0x248c6d18e0d8a875
	.xword	0xb5da224ccd20b2f0
	.xword	0x9db2aa9f306ad6d3
	.xword	0x5e54511f87e3127e
	.xword	0xbc8e4722a2c178ec
	.xword	0x91602fd794c72358
	.xword	0x42a7792736186f80
	.xword	0x6c3252873d6e6bfc
	.xword	0xc9fc23fbb6dc62a1
	.xword	0x22cb54993947c5a1
	.xword	0xcb8adeb21267055b
	.xword	0x53f4c005cc275543
	.xword	0x997d14b6fd901918
	.xword	0x532ddbc91d900a09
	.xword	0x307adbf3943a7244
	.xword	0x6ad36cef757f219e
	.xword	0x4ca5f9fb736248c0
	.xword	0xa6b7ac45cc0890af
	.xword	0x53ea3eaf01a93586
	.xword	0xbbb220063de598c6
	.xword	0xc24a47bf83c197ad
	.xword	0x11258e32fec2895f
	.xword	0x5a67fd4690700389
	.xword	0x23ce086a28953267
	.xword	0xecd33f72a094cba6
	.xword	0xf94b9319faec0b11
	.xword	0x85d5c149fc8948ea
	.xword	0xabfbb0aa850e0010
	.xword	0x96f15db8b3021b65
	.xword	0xae2201442fed9bb0
	.xword	0xebe58a0688acf8d4
	.xword	0x730b4037a352eea6
	.xword	0x9cfc054465a6f506
	.xword	0x7081fdaf85badc51
	.xword	0xa0b23afb4d06da2c
	.xword	0xd25fe39e4af1fdc3
	.xword	0x78dba787ca9ca288
	.xword	0x9d32159889e18fd4
	.xword	0xf3cc3025acabecfa
	.xword	0x18934b045a7233ab
	.xword	0xabf5e313b390debd
	.xword	0x34a01b7f6fe7c6cb
	.xword	0xedc4a47817368b08
	.xword	0x929e2bc7c911a620
	.xword	0x4e2f0e7a707f40bb
	.xword	0x7127859e687507e6
	.xword	0x1e5b84343190d33b
	.xword	0xf320f32fdff98c5a
	.xword	0x987da0ad7e034814
	.xword	0x6757700d50391ce4
	.xword	0xb0cda57a1210dceb
	.xword	0x4a1bcf0d185f1a40
	.xword	0x6522cb2e07399e0c
	.xword	0x6be6e196ad8a60a0
	.xword	0x91ccbf1da14fb5a9
	.xword	0x8411ae282fb05fb6
	.xword	0xdb175ebadf5f2e7c
	.xword	0x0f8477ccdefa0fb4
	.xword	0x39464f8b3289e549
	.xword	0xef27528b84bb14e4
	.xword	0xac3f500dae774867
	.xword	0x8229d4525fe1b9a1
	.xword	0x26ae9c1738981086
	.xword	0x0d5dde3407b202f2
	.xword	0x9beef925f416fef6
	.xword	0xa045d772fdf11352
	.xword	0x55b56d4e44dbee07
	.xword	0x58ad1ea4ecfba6e8
	.xword	0xea5294ac0b95c6c1
	.xword	0x79bb585c7561e7a7
	.xword	0x052c54a3038efc01
	.xword	0xffc90cae27c59501
	.xword	0x8953a6e7adc22d28
	.xword	0x454cde16fa669781
	.xword	0x002b307d027e7d6f
	.xword	0x26615c4214d7ba27
	.xword	0x9634a26bc3153f41
	.xword	0x15efa9166745209d
	.xword	0x7fb211e2407c5dae
	.xword	0x54278b211ad46f75
	.xword	0xe94a137ace71cdb1
	.xword	0x011dd0cea0e8d8bb
	.xword	0x36a1f7e52051e345
	.xword	0x894898625af1ed5a
	.xword	0x0200850c2857bfe1
	.xword	0x9edc63d3af476e01
	.xword	0x4b2ff46c814b85d7
	.xword	0x2540752c6f2becc8
	.xword	0x92c6e0d745932240
	.xword	0x4cb5fb48daecc3d2
	.xword	0xf12debe92b5c15ff
	.xword	0x51e63ad1a74cfda6
	.xword	0x8c3025bde483647f
	.xword	0xf58299318f1402b5
	.xword	0x5339029a362372eb
	.xword	0xca9eb319b42c39e4
	.xword	0x9895a19c2a850785
	.xword	0xe843e49b0374ceee
	.xword	0x00eda6841312386e
	.xword	0x01bf417b5c570500
	.xword	0xf2aff8dddd077b88
	.xword	0x7e06e098eb14ca90
	.xword	0xe5c05939c73e6528
	.xword	0x273844dab82d9419
	.xword	0xd24ea1d336bc6679
	.xword	0xb2e6b9a33de60766
	.xword	0x9d22087614321b69
	.xword	0x3b2aca456d274f1b
	.xword	0xaec72c86856136c2
	.xword	0x245d7f4b8e0bc4fa
	.xword	0xb58dfae7693b9fc7
	.xword	0x3a701dbf4550f6ec



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
