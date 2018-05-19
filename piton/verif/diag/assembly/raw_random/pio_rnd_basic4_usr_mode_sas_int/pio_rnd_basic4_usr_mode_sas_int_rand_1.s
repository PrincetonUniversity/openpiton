// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas_int_rand_1.s
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
   random seed:	96070384
   Jal pio_rnd_basic4_usr_mode_sas_int.j:	
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

th_fork(th_main, %l0)

th_main_0:
        clr     flagr
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
setx 0x7766554433221100, %g1, %g2
add 0x0, %g0, %g4
!add 0x0, %g0, %g2
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

	setx 0x2df99774359f25a1, %g1, %g0
	setx 0xdb8e972f70ce58d3, %g1, %g1
	setx 0x9db25829496079b0, %g1, %g2
	setx 0xb4e99fd7a6f38145, %g1, %g3
	setx 0x52d4b654332d06e3, %g1, %g4
	setx 0x6c389449f04399b5, %g1, %g5
	setx 0x4e59d5ea0d40b958, %g1, %g6
	setx 0x1bca7439d08ab6e8, %g1, %g7
	setx 0xff9b401434d61814, %g1, %r16
	setx 0x3a694503040827d0, %g1, %r17
	setx 0x2a2bc08b85d21e84, %g1, %r18
	setx 0xb98751976734f9fe, %g1, %r19
	setx 0xad330f94716155ee, %g1, %r20
	setx 0x8106cac60c2de7d8, %g1, %r21
	setx 0xacbeef66aae65f4e, %g1, %r22
	setx 0xd6f44dbd205f5f64, %g1, %r23
	setx 0x2a0c7ba8cb61ecf8, %g1, %r24
	setx 0xfeecf1b8a8045a4d, %g1, %r25
	setx 0x1a9eb2b770776013, %g1, %r26
	setx 0xc2c832e11886e3c3, %g1, %r27
	setx 0x033f5f94fb8b65ae, %g1, %r28
	setx 0x11337a92680a9a2b, %g1, %r29
	setx 0xb8fd0b416c961ee4, %g1, %r30
	setx 0xc8f472bd4c2f03a0, %g1, %r31
	save
	setx 0xc9ee10d164ffd66d, %g1, %r16
	setx 0x1e045e5f9149e349, %g1, %r17
	setx 0xb80a318e7f7d050f, %g1, %r18
	setx 0x6d2020d09bc18a73, %g1, %r19
	setx 0x5f59d0d3e42c1c74, %g1, %r20
	setx 0x6507580f3dde291c, %g1, %r21
	setx 0xe29ca0b01863fcd8, %g1, %r22
	setx 0xa784b6caffdccb6e, %g1, %r23
	setx 0xd5dc4d7f0f2d78fd, %g1, %r24
	setx 0x281cca5a9c726079, %g1, %r25
	setx 0xdee2ca7d0d0c54e4, %g1, %r26
	setx 0xa28e7ee1d102f708, %g1, %r27
	setx 0x4743c7fc0c3faf26, %g1, %r28
	setx 0xbf3a4f1f745cd3d6, %g1, %r29
	setx 0x3a06a271e54f2272, %g1, %r30
	setx 0x8ed037594df0c3c8, %g1, %r31
	save
	setx 0x7d6edb3bb9eace56, %g1, %r16
	setx 0x8b1b21f4b2e3e882, %g1, %r17
	setx 0x6b4a5ef08642556c, %g1, %r18
	setx 0xfd36c9507e1d9d03, %g1, %r19
	setx 0x9dada931173f3e1e, %g1, %r20
	setx 0x7d56dea8221e25ca, %g1, %r21
	setx 0x509700b50b895468, %g1, %r22
	setx 0xce6b85805f078bb5, %g1, %r23
	setx 0x9758ac1f6de7f21c, %g1, %r24
	setx 0x9286e635b25a0973, %g1, %r25
	setx 0x8aaec456c9eefdc8, %g1, %r26
	setx 0x5746c02c899c0195, %g1, %r27
	setx 0x12f43ae47859808a, %g1, %r28
	setx 0x894dd51242936fdc, %g1, %r29
	setx 0xcb5392e9fc01e9c5, %g1, %r30
	setx 0x18b53224ba62831a, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000080a0d2a680, %r1, %r6
	setx	0x00000000d01ef020, %r1, %r7
	setx	0x000000800f4c98b0, %r1, %r9
	setx	0x000000cb1657da28, %r1, %r10
	setx	0x000000d0d4928fe0, %r1, %r11
	setx	0x000000eb287f1400, %r1, %r12
	setx	0x000000fdb32e4ba0, %r1, %r13
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec01a010  ! 1: LDUW_I	lduw	[%r6 + 0x0010], %r22
	.word 0xa2118008  ! 2: OR_R	or 	%r6, %r8, %r17
	.word 0xe821a010  ! 3: STW_I	stw	%r20, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0418008  ! 7: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa639a038  ! 8: XNOR_I	xnor 	%r6, 0x0038, %r19
	.word 0xe071a038  ! 9: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe4098008  ! 13: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xaaa98008  ! 14: ANDNcc_R	andncc 	%r6, %r8, %r21
	.word 0xe4318008  ! 15: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe409a038  ! 19: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xa431a028  ! 20: ORN_I	orn 	%r6, 0x0028, %r18
	.word 0xe0218008  ! 21: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4598008  ! 25: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xaec18008  ! 26: ADDCcc_R	addccc 	%r6, %r8, %r23
	.word 0xec21a028  ! 27: STW_I	stw	%r22, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec09a028  ! 31: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xa0b1a030  ! 32: ORNcc_I	orncc 	%r6, 0x0030, %r16
	.word 0xe4218008  ! 33: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 37: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa631a020  ! 38: ORN_I	orn 	%r6, 0x0020, %r19
	.word 0xe0398008  ! 39: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0418008  ! 43: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xaeb18008  ! 44: ORNcc_R	orncc 	%r6, %r8, %r23
	.word 0xec718008  ! 45: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe409a020  ! 49: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xa2c1a010  ! 50: ADDCcc_I	addccc 	%r6, 0x0010, %r17
	.word 0xec218008  ! 51: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4418008  ! 55: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa4398008  ! 56: XNOR_R	xnor 	%r6, %r8, %r18
	.word 0xec21a010  ! 57: STW_I	stw	%r22, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0498008  ! 61: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa8418008  ! 62: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe039a010  ! 63: STD_I	std	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 67: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xacb98008  ! 68: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe0398008  ! 69: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec198008  ! 73: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xaca1a038  ! 74: SUBcc_I	subcc 	%r6, 0x0038, %r22
	.word 0xe021a038  ! 75: STW_I	stw	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe441a038  ! 79: LDSW_I	ldsw	[%r6 + 0x0038], %r18
	.word 0xa6298008  ! 80: ANDN_R	andn 	%r6, %r8, %r19
	.word 0xe0398008  ! 81: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8498008  ! 85: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa0b1a030  ! 86: ORNcc_I	orncc 	%r6, 0x0030, %r16
	.word 0xec39a030  ! 87: STD_I	std	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0598008  ! 91: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaaa9a030  ! 92: ANDNcc_I	andncc 	%r6, 0x0030, %r21
	.word 0xe8398008  ! 93: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec51a030  ! 97: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xac19a028  ! 98: XOR_I	xor 	%r6, 0x0028, %r22
	.word 0xe4318008  ! 99: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe451a028  ! 103: LDSH_I	ldsh	[%r6 + 0x0028], %r18
	.word 0xae01a028  ! 104: ADD_I	add 	%r6, 0x0028, %r23
	.word 0xe0398008  ! 105: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe049a028  ! 109: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xaeb18008  ! 110: SUBCcc_R	orncc 	%r6, %r8, %r23
	.word 0xe821a028  ! 111: STW_I	stw	%r20, [%r6 + 0x0028]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe009a028  ! 115: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xa419a018  ! 116: XOR_I	xor 	%r6, 0x0018, %r18
	.word 0xe071a018  ! 117: STX_I	stx	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0498008  ! 121: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa689a000  ! 122: ANDcc_I	andcc 	%r6, 0x0000, %r19
	.word 0xec39a000  ! 123: STD_I	std	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec498008  ! 127: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xa6398008  ! 128: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xe839a000  ! 129: STD_I	std	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe051a000  ! 133: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xae11a018  ! 134: OR_I	or 	%r6, 0x0018, %r23
	.word 0xe031a018  ! 135: STH_I	sth	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe059a018  ! 139: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xa2a98008  ! 140: ANDNcc_R	andncc 	%r6, %r8, %r17
	.word 0xe4218008  ! 141: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe011a018  ! 145: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xa489a008  ! 146: ANDcc_I	andcc 	%r6, 0x0008, %r18
	.word 0xec31a008  ! 147: STH_I	sth	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec49a008  ! 151: LDSB_I	ldsb	[%r6 + 0x0008], %r22
	.word 0xa841a008  ! 152: ADDC_I	addc 	%r6, 0x0008, %r20
	.word 0xe8718008  ! 153: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec51a008  ! 157: LDSH_I	ldsh	[%r6 + 0x0008], %r22
	.word 0xa2118008  ! 158: OR_R	or 	%r6, %r8, %r17
	.word 0xe0318008  ! 159: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0198008  ! 163: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa809a020  ! 164: AND_I	and 	%r6, 0x0020, %r20
	.word 0xec71a020  ! 165: STX_I	stx	%r22, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe459a020  ! 169: LDX_I	ldx	[%r6 + 0x0020], %r18
	.word 0xa491a018  ! 170: ORcc_I	orcc 	%r6, 0x0018, %r18
	.word 0xe0718008  ! 171: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4118008  ! 175: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xaa31a020  ! 176: SUBC_I	orn 	%r6, 0x0020, %r21
	.word 0xe031a020  ! 177: STH_I	sth	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4198008  ! 181: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa0a9a038  ! 182: ANDNcc_I	andncc 	%r6, 0x0038, %r16
	.word 0xe029a038  ! 183: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0018008  ! 187: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa4318008  ! 188: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe0398008  ! 189: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4118008  ! 193: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xae418008  ! 194: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe0298008  ! 195: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec598008  ! 199: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa841a038  ! 200: ADDC_I	addc 	%r6, 0x0038, %r20
	.word 0xe071a038  ! 201: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0498008  ! 205: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xaa01a010  ! 206: ADD_I	add 	%r6, 0x0010, %r21
	.word 0xe8398008  ! 207: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8118008  ! 211: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa889a000  ! 212: ANDcc_I	andcc 	%r6, 0x0000, %r20
	.word 0xe831a000  ! 213: STH_I	sth	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec01a000  ! 217: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xa6318008  ! 218: SUBC_R	orn 	%r6, %r8, %r19
	.word 0xec318008  ! 219: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe009a000  ! 223: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xa8918008  ! 224: ORcc_R	orcc 	%r6, %r8, %r20
	.word 0xe0318008  ! 225: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0498008  ! 229: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa4298008  ! 230: ANDN_R	andn 	%r6, %r8, %r18
	.word 0xe031a000  ! 231: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0098008  ! 235: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6a18008  ! 236: SUBcc_R	subcc 	%r6, %r8, %r19
	.word 0xe429a000  ! 237: STB_I	stb	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec598008  ! 241: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa4918008  ! 242: ORcc_R	orcc 	%r6, %r8, %r18
	.word 0xec39a000  ! 243: STD_I	std	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4518008  ! 247: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa0318008  ! 248: ORN_R	orn 	%r6, %r8, %r16
	.word 0xe871a000  ! 249: STX_I	stx	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec41a000  ! 253: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xae198008  ! 254: XOR_R	xor 	%r6, %r8, %r23
	.word 0xec718008  ! 255: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe011a000  ! 259: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xa4118008  ! 260: OR_R	or 	%r6, %r8, %r18
	.word 0xe831a000  ! 261: STH_I	sth	%r20, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8118008  ! 265: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa2318008  ! 266: ORN_R	orn 	%r6, %r8, %r17
	.word 0xec39a000  ! 267: STD_I	std	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec198008  ! 271: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xa0898008  ! 272: ANDcc_R	andcc 	%r6, %r8, %r16
	.word 0xe029a000  ! 273: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 277: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa4b9a018  ! 278: XNORcc_I	xnorcc 	%r6, 0x0018, %r18
	.word 0xe471a018  ! 279: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe059a018  ! 283: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xa2418008  ! 284: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe8398008  ! 285: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe019a018  ! 289: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xac398008  ! 290: XNOR_R	xnor 	%r6, %r8, %r22
	.word 0xe029a018  ! 291: STB_I	stb	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	setx	0x0000000000000009, %r1, %r6
	setx	 page1a, %r1, %r26
	ldx	[%r26], flagr
	cmp	%r6, flagr
	bne	bad_end
	nop



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************
.data
.global data_segment
data_segment:
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .word   0x00000000
        .skip 1000

.align  128
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

        setx   page1a,%l0,  %l7       ! set the data
        ldx   [%l7], tmp1
        inc     tmp1
        stx   tmp1, [%l7]

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

page1a :   .skip    256

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
	.xword	0x42faa8b70f3eac31
	.xword	0x07faa871acb47716
	.xword	0xc23873a11fd57be4
	.xword	0xd7227dbb3268effb
	.xword	0x9820357d9319dd18
	.xword	0xb66169a9b4a8dd1f
	.xword	0x76ea9b386175db48
	.xword	0x59fd7aa0387267d8
	.xword	0xb03852cc9d3d90a9
	.xword	0x3fe3427bde998752
	.xword	0x1e038fa0bb77da08
	.xword	0x9aa45c924f0f2863
	.xword	0x1ee3693c7098b484
	.xword	0xdf7bb31f1eeadc16
	.xword	0x8f6120a694b88883
	.xword	0x35b35b5a02336be1
	.xword	0xeee91a7f2d047136
	.xword	0xde5b4c965baa82df
	.xword	0x4674b71a911d7a5c
	.xword	0xfd2761be2b49eccf
	.xword	0x784df59e30b56e23
	.xword	0x2a97948fb1b539c9
	.xword	0xee415f7fe9cf66a1
	.xword	0xf45a1f26dd81d4cd
	.xword	0xae4b07ea870ad44f
	.xword	0xe0bf7da237fe04a1
	.xword	0x2e4f9b23e3d1c490
	.xword	0x7891fc7cc31acc19
	.xword	0x16340b0571f58627
	.xword	0x5dc1e22dca8acc6d
	.xword	0xa3940257c2eead71
	.xword	0x2412a6c1add24732
	.xword	0x516d363a21f8f89c
	.xword	0xba217c86c12d4c58
	.xword	0xfb5543b8e8d7a298
	.xword	0xa0b2f375a23b0416
	.xword	0x41aa17d9acd420a4
	.xword	0xe316a263202e711a
	.xword	0x286895ce05152f8c
	.xword	0xde7b2e090261d494
	.xword	0x9cd4e1e72c525cf8
	.xword	0x4fe0a6a986be7834
	.xword	0x6706fc769a43ad7d
	.xword	0x30edf918bf8862cf
	.xword	0xcb1b0f26f5b2931a
	.xword	0x04e7ccbc9b7e9ebf
	.xword	0x37da83ea2b517640
	.xword	0xa476a3415e076187
	.xword	0xdcae0f5a77e4626e
	.xword	0xbe632439d8469b9b
	.xword	0xcf4defde2e1e8ddb
	.xword	0x105136b8fcabd8c7
	.xword	0xf940109a592f516c
	.xword	0x490c5a6d2354f830
	.xword	0x1ffe3a03dced301b
	.xword	0xf8f6a62e636c027c
	.xword	0x5c6264ce13d9d5ed
	.xword	0xb7aaee3d083177b6
	.xword	0x0c60343bc26cab68
	.xword	0xb8dbbdbe58c6a2cf
	.xword	0x57d2a3563f79bb16
	.xword	0xb088cc23da0dd20d
	.xword	0xb79a90d9c83b8658
	.xword	0x40a945f1250cac7d
	.xword	0xe8a42ee025a22e19
	.xword	0xdee7ef7c2b2e4b84
	.xword	0x34454cd09e0a25ff
	.xword	0x15a35a93cf690541
	.xword	0xaedab2d729236d0e
	.xword	0xfc49a95e468da88c
	.xword	0xe709f4ef006b8f21
	.xword	0xe98a48ce7e758f85
	.xword	0x4b692317a4e46c06
	.xword	0x9e9530fa03ac07f2
	.xword	0x3beec0ef4b696322
	.xword	0xcfbd13f7a39a896f
	.xword	0xcba9ac91a8c8ed4e
	.xword	0x1845ce570fd7be8c
	.xword	0x4d77bcd9bb8a36fd
	.xword	0x2a366aed0f01deec
	.xword	0xd5c139a33fb78887
	.xword	0xa94b4581e1b17a89
	.xword	0x0226130af2de420b
	.xword	0x255eb4800e3da19e
	.xword	0xc1d75f1207633c5b
	.xword	0xa9094d280df2e325
	.xword	0x6ca0df4902eb4e27
	.xword	0xcb56f798616627c0
	.xword	0x5c51d61bd992b625
	.xword	0x87cb88a627cc5a99
	.xword	0x634da8c5abff64dd
	.xword	0xfe3652588252b35a
	.xword	0xd8502157c9ae2e40
	.xword	0x8825067dd1e0cc3f
	.xword	0xa68d8b53fb84fd0b
	.xword	0xa1b0900e829c862e
	.xword	0x534e32b6421f5e63
	.xword	0x70d614e8f4c0508e
	.xword	0x321036f83e9ff5b3
	.xword	0xbfcaea04d2b234fb
	.xword	0xb455d7770d2c4a10
	.xword	0x00499d2ada1a9ed8
	.xword	0x9c6587b23237308f
	.xword	0x431ac47b3fc1a459
	.xword	0x370d26f2e5c7772b
	.xword	0xeba31290c48284b7
	.xword	0xeb12d00987baaced
	.xword	0x0dd81ceabac0c6f1
	.xword	0xf2b420e6a3210556
	.xword	0xb406c848406f9fc8
	.xword	0xe88b462dbe716714
	.xword	0xa7bb2fc37dd5574d
	.xword	0x79cac06b911a8590
	.xword	0x96b0331c75589321
	.xword	0xc3ea9458168a326e
	.xword	0x5cd680fb41a49058
	.xword	0x7a6e3ef20f900a3f
	.xword	0xb96f0d15d045151d
	.xword	0xeb77a75026d4393d
	.xword	0xf55b77b85cc378bd
	.xword	0x56832e99a34197a9
	.xword	0x486d975136dc26b0
	.xword	0x42b70231949aadf6
	.xword	0x41d9f180a0c2cd4d
	.xword	0x95c8d9261b7fea5d
	.xword	0xd00e00b86e6a54c1
	.xword	0xd058bc746a4f7f81
	.xword	0x686c9d32fe87d088
	.xword	0xe1ed502446fbf2e1
	.xword	0x552825c37b622396
	.xword	0x35a5f92b8b4f724b
	.xword	0x41151fc4e65b45ae
	.xword	0x5e850b4f284bf1e3
	.xword	0x4cc71564976f5a35
	.xword	0x534930ed805e49b8
	.xword	0x8bf78cafc337d501
	.xword	0xa352fb56b8ffe2ca
	.xword	0x374fe894de845702
	.xword	0x71211f4b6ced2801
	.xword	0xb4d72df42176f82d
	.xword	0xb1fbad8d69d6eee9
	.xword	0x579e2462d1e7d7ed
	.xword	0x962ef8b128e112f1
	.xword	0x638ff4fb0d72ef18
	.xword	0xc871e32a3f8cd66c
	.xword	0x04548b24ab5219b4
	.xword	0x8946d99ec6a96486
	.xword	0x0f60785be01b04bd
	.xword	0x9cf516f7b7de64f2
	.xword	0xa4d09a1baee369d8
	.xword	0x11db36e815b29bf9
	.xword	0x5f1e5a4e47aaa9a7
	.xword	0x5e757e14008d45f3
	.xword	0x25b94183ba7db2b2
	.xword	0xc046d4590847939f
	.xword	0xe8a4118c325d7598
	.xword	0x129615ac34e6daa0
	.xword	0xa4a1dd98f6284719
	.xword	0x93548b609ba16b1e
	.xword	0x6e9ffc2de9aa0765
	.xword	0xb96da6966a9cd99f
	.xword	0xcfc318439f9f7c8a
	.xword	0xf8b6f53a7a671f61
	.xword	0x8f951ebcb3d9dcd4
	.xword	0x01d33caf78c701ef
	.xword	0xfbc252520d468234
	.xword	0xfe20478fbc7f792b
	.xword	0x9e9a2744d0a2bbed
	.xword	0x061652df7b271d4d
	.xword	0xb5dc52982c161a7f
	.xword	0xa2c4eba33173c1cd
	.xword	0xefbea23a2c9c5511
	.xword	0xb2214eee777ca35b
	.xword	0xf0b1ff69a6ee0a03
	.xword	0x9be8fd5681c5ce2d
	.xword	0x938c53c0c6e6fb90
	.xword	0xfef0ab8ae34ef967
	.xword	0x3441d6557cf6b244
	.xword	0x2efbada164fb88e0
	.xword	0xde272c15b521bf69
	.xword	0x1276bcb1795bc51c
	.xword	0xb2d18bd60a56003d
	.xword	0xc549ceb1e7f80c91
	.xword	0x8a75149f5fce4373
	.xword	0x7e31a00821ee12b1
	.xword	0xa44b9f123b54dcff
	.xword	0x93a55c9ea8fa8b52
	.xword	0xec38f92cb762570c
	.xword	0x20f7204cd89b07dc
	.xword	0x1bb1e19f4c7eeb8b
	.xword	0xe6892939713acdb7
	.xword	0xf4962d7c86088f7d
	.xword	0xf89b035a74d89c85
	.xword	0x51db5e128d8da3d8
	.xword	0x4d8ee0cf60e90d81
	.xword	0x2a450fb3f2cc59f6
	.xword	0x8dde2332a296fec8
	.xword	0x4349f871b68e965e
	.xword	0x8feb7c25296fd208
	.xword	0x6da65dbe5507574c
	.xword	0x1847aab11ece1e19
	.xword	0x49ca86bf957e636c
	.xword	0x042fc05d78b51c81
	.xword	0x45925ea02579b3c0
	.xword	0xd4747fc295ef3b3c
	.xword	0x9a90b85cc9bd93f0
	.xword	0x5f0b87f2d6815c7f
	.xword	0x1755157716c666a2
	.xword	0xd91ebfb993987109
	.xword	0xc314a4e8c71a650e
	.xword	0x7a3659e908571f50
	.xword	0xc5644e4040a7c043
	.xword	0xe724ab9876dcf5e2
	.xword	0x42920a7d71151294
	.xword	0x7c42fc13e44835a8
	.xword	0x8f02b66fac9456b9
	.xword	0xc273e2fa9da38de3
	.xword	0x562e43d147788182
	.xword	0x30213b9e3a48bb74
	.xword	0x238bfbd7e3d76c9b
	.xword	0x549a0afa3de3671d
	.xword	0xf79e29c0300ec4ac
	.xword	0xa411169a2ef5e312
	.xword	0x3d772f53be485c63
	.xword	0x54054753512e79d1
	.xword	0x5cd25d9e59ca58d3
	.xword	0xfb7aeab0e73715cf
	.xword	0xb872dd803758dc10
	.xword	0xe0f9ac6fe50c3c16
	.xword	0x5f1be002212d9415
	.xword	0xfba2b01607262004
	.xword	0x14d99afe58800753
	.xword	0xfe3399d5da157502
	.xword	0xf72c6dd218b9afe8
	.xword	0xa7d259fba8ec7644
	.xword	0x8aa16e08940c85ef
	.xword	0xaa01b8f1bdeb1e30
	.xword	0xae46a1cad8bf022b
	.xword	0x518123d83cd79b8c
	.xword	0x06aaa3adf924f333
	.xword	0x67f6654cb5cb6b89
	.xword	0xbbfcff4bde22d896
	.xword	0xc93ff8a9f8ed8a01
	.xword	0x76cf3fc18313c4ee
	.xword	0xaf326bac2567c359
	.xword	0x5013df6a25a3da18
	.xword	0x6d8a0343628e049b
	.xword	0x3ce50b3230a08b43
	.xword	0xe220f652d83be457
	.xword	0x2ee01fe6a610c742
	.xword	0x4cf4786b6122c8ca
	.xword	0x24e3ea45f32af5e1
	.xword	0x8a55e7fb2d487cf4
	.xword	0x1713cdc75760fa0a
	.xword	0xd9780fc55ce67fc8
	.xword	0x95ea4567072365da



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
	.xword	0xd5e07c216f9fd150
	.xword	0xf6daa8814648031e
	.xword	0x0abbf1d5758f5c18
	.xword	0x7ccefad3a4dd155a
	.xword	0x7452ed184b31576c
	.xword	0xb39a913ef4debbf6
	.xword	0xe9f3270c2d677f63
	.xword	0x0d5a45bdd97595be
	.xword	0xf7cf3ca472c115d2
	.xword	0x2739a904ce0488b2
	.xword	0x106d76e611f4eead
	.xword	0x795274a4080355a2
	.xword	0x74e907d5f7819ef9
	.xword	0x04273b82ba9d7227
	.xword	0x9b35667307d56c27
	.xword	0x50c8368c1e335e62
	.xword	0xcfd04270a3497753
	.xword	0xffcb38a5a023a3d2
	.xword	0x278be94dbdde0c3d
	.xword	0x98217d0fc6dc0b4d
	.xword	0xda8edb7b96c7bf27
	.xword	0x844c66caac668837
	.xword	0xd8ef55311e31a4b0
	.xword	0x4cc1cea85d8462c9
	.xword	0x380185d8b943d430
	.xword	0x1342a54c31835e30
	.xword	0x534b4f89749defc0
	.xword	0x94157da11d2fa9fa
	.xword	0xc9a3ea05870caeb4
	.xword	0x2df2fb9204743512
	.xword	0x131785c59e233ae7
	.xword	0xb0685e3ee372b06c
	.xword	0xeb033268769d6906
	.xword	0xb666becc1f9c2c8f
	.xword	0xd30d1e149ad5e015
	.xword	0x9b1e1aaec8b7fd3a
	.xword	0xb3f8dd59bd06caad
	.xword	0xb78c79564869db8a
	.xword	0x92b243ea7401ebf1
	.xword	0x0b0557600f8385fd
	.xword	0xffd8897e70d83998
	.xword	0x362005a8cf001512
	.xword	0x9076f781496eb22e
	.xword	0x320020a7c241f8c5
	.xword	0x83d9dfeec0295aae
	.xword	0xe7d5eaf3605f4467
	.xword	0x2617d1e91c651ac1
	.xword	0xfdd41dbf065850c6
	.xword	0xa1878d5ab87ae504
	.xword	0x14c4e5af4d169200
	.xword	0x7b99cb101b893874
	.xword	0xd87efb8766f42a42
	.xword	0x4a804411d3c189a5
	.xword	0x19a19db8a2164479
	.xword	0x6234f23ece694ed2
	.xword	0x0fdd60517aef3b64
	.xword	0x054b511474cb3429
	.xword	0x0593c5a18f56073f
	.xword	0x00c45f137a9262fa
	.xword	0x1f839d7bf30daf7d
	.xword	0x2596ee8fa0ae3cb9
	.xword	0x58a1e48575202a6c
	.xword	0x6dcbb7db857d8ce9
	.xword	0xa8c65a0a605be72f
	.xword	0xf63387e8102211b3
	.xword	0x4ee03418fd6d0412
	.xword	0x7052c3892cc78711
	.xword	0x0daf5e9f28730c94
	.xword	0x89b371f8f6a53979
	.xword	0x90e13db196ca3af5
	.xword	0xf7b9e79ede9d4279
	.xword	0x712e41d0819f2498
	.xword	0x1bb30c4bfb57d6a7
	.xword	0x4cac3174880647d0
	.xword	0x76c11f7749e9d573
	.xword	0xec83e8bcf0a0f800
	.xword	0x979db25ba75723b1
	.xword	0x3ffb453da34b8215
	.xword	0x0d14d243a7f25863
	.xword	0xb27eed98c46d32b9
	.xword	0x274863d1fcbf36f9
	.xword	0xfcb48a3d67cc7bb8
	.xword	0x0d7dcc79597b6fe5
	.xword	0xe4cc0d1778a5f4e2
	.xword	0xa52798ff589977a5
	.xword	0x95e4a0db203cd674
	.xword	0x1a34e334126e0344
	.xword	0xf151f5ad640dab53
	.xword	0x3e26349c93fb192c
	.xword	0xf43400d6cd58b5d7
	.xword	0x5ad5cfaa9891afb2
	.xword	0x4f2b9cacfaee367d
	.xword	0xde7b751dc70ffc6a
	.xword	0x907bce2ff6033546
	.xword	0x1d0b28892bebec6d
	.xword	0xa9d9f1fc15b399e0
	.xword	0xcb046207dc96e30a
	.xword	0xc5c64bb37337b610
	.xword	0x999f43333648e175
	.xword	0x1a54d66b4005d03b
	.xword	0x97e72f193d369c98
	.xword	0xb2bfd30c2760ee07
	.xword	0x461756c5ca2f2b22
	.xword	0xeb48ec0ad3e46c7b
	.xword	0x6f39ef548776e8d6
	.xword	0x780d7ebc4e3cbdb7
	.xword	0xa5558fb5bd6f6fda
	.xword	0x91a558db08cbab70
	.xword	0x8c6c80548cba4189
	.xword	0xb5b98f7bf8f6dc84
	.xword	0xb55482b2cfd5b374
	.xword	0x6ff4cb064eb6523e
	.xword	0xdbaf34acd8f31e37
	.xword	0x44d2d730b2a45e2b
	.xword	0xd5ef084200f6c76d
	.xword	0xce725d3e5d3e593e
	.xword	0x4354ea7d26ee11a8
	.xword	0x18c881f38dcf66ed
	.xword	0xbf1b57f71e8ee20b
	.xword	0xdf86947d2f0af078
	.xword	0xb77c5c9944fcaca5
	.xword	0x4bd91998d8aea06d
	.xword	0xc3fa150e838f6d69
	.xword	0xe6a67616e1f888ea
	.xword	0x4446e9ed283a07f1
	.xword	0xb563cb7bd53a7fd5
	.xword	0x343c7e2eba8a5ff9
	.xword	0xddf8a569957433f6
	.xword	0x0bb99f0435c3d9a3
	.xword	0x2a5464ab3317c92b
	.xword	0x734f4b68d22a546e
	.xword	0x056e5a3eea8ebdb1
	.xword	0xe943c2a5777425cb
	.xword	0xdbe5b41476c5b4c0
	.xword	0xf28f0389844974fb
	.xword	0x6cba65046a31118a
	.xword	0x01b3eb46543d76a2
	.xword	0xc34a97f67f4b6268
	.xword	0x9033b453e64cbd81
	.xword	0x606aa22267c62fb7
	.xword	0xfdf195ebe4c8f5eb
	.xword	0x2c8f043dcdc50c50
	.xword	0x25c39979a9e31307
	.xword	0x5179338cd8be8110
	.xword	0xf8652b132b8e4df6
	.xword	0x8bd4da40a9dcfbf2
	.xword	0x996b7e498bee2a0e
	.xword	0x9fd6f022d8fd1a14
	.xword	0xacc1ef2b452106e6
	.xword	0x942647a267171c74
	.xword	0xb6d391a2b0a31fed
	.xword	0xfb7703b23458e2aa
	.xword	0x4366f13788f71f9e
	.xword	0x6086a55f2baec9ea
	.xword	0xc5ceda0121a96fd0
	.xword	0x9f9f1340b8bbeb1f
	.xword	0x8e3c6e726af05cfd
	.xword	0xf51213adfc1479eb
	.xword	0x84b8234a7e2dc3ca
	.xword	0x7bfa33585cc0c65e
	.xword	0x55cbb6bf5f730476
	.xword	0x55a920001ec0998b
	.xword	0xeae05ab0b396d4da
	.xword	0x51fdd698c14bae96
	.xword	0xfee719a6c7ca2b8c
	.xword	0x447f2a161c61920f
	.xword	0x3a873c5d798c66bf
	.xword	0x7f93a7a095a6d049
	.xword	0xbe34dcc30c145481
	.xword	0x632179530cbf2d04
	.xword	0x983b21e5dd67321f
	.xword	0x4cdff04a78dc6776
	.xword	0xd2aca46f41173fd8
	.xword	0xe5144f91e27aa96b
	.xword	0x7cc152f230b0acb2
	.xword	0x906bf5582f928a91
	.xword	0x3deb3e72f9289eed
	.xword	0x672f5b47ac5b45c7
	.xword	0x5530a53dd30a0e19
	.xword	0x53699c43acdef846
	.xword	0x5e2547147c2cb77a
	.xword	0x2ae95646d31f8785
	.xword	0x3f5356153b435b2d
	.xword	0xe4c8d942dce623c7
	.xword	0xf933c0325a3b40ab
	.xword	0xce94a1ff021ca817
	.xword	0x2aad74dcc44b639c
	.xword	0xf127b2532973249a
	.xword	0xfdb56e726b54e94b
	.xword	0x0190bb4ad02a2f1c
	.xword	0xd28aa11270130772
	.xword	0x30c4f682eee2635d
	.xword	0x28e75f05de2f1ea9
	.xword	0x2b1997cb91c497e4
	.xword	0xc1908bf8604dcc7d
	.xword	0x4ba11ba25a1e6209
	.xword	0xd6d708008a3a3823
	.xword	0xff25c6ae43943652
	.xword	0xd2a42324e2bbb887
	.xword	0xc0d0c780ca5ddaeb
	.xword	0x2c88f349d4305326
	.xword	0xec42463247864769
	.xword	0x0b05b6ee7796ac10
	.xword	0xe888c65c86011f66
	.xword	0x8151eccf72233abe
	.xword	0x938fc1e94ca0d5da
	.xword	0xeb4fee7726142a90
	.xword	0xa9b3750a0ce6c0a0
	.xword	0x90d400a029a805a1
	.xword	0x300ce2e4d0547cd8
	.xword	0xd711d9f59d11f494
	.xword	0x63f0b2d40976e98f
	.xword	0xa79475beafea33a6
	.xword	0x7c4c6bbd640d00b8
	.xword	0x02063d4b7bd256cb
	.xword	0x27a56bc585065dea
	.xword	0xe7ab52938ae7392a
	.xword	0xc257561eb69518dd
	.xword	0x82a5d89522df407f
	.xword	0x9047babfd8a12612
	.xword	0x7e3f4348acf052e5
	.xword	0xf50ac799545f5830
	.xword	0xa4b340d28333c979
	.xword	0x1cdc0235677a419b
	.xword	0x0c0d87d344fd20e3
	.xword	0x42cb992e1c242023
	.xword	0xa7203fe467fe45df
	.xword	0x58cf2f7a13e51021
	.xword	0xad21e81e17c7d00e
	.xword	0x999ccfc47bd3d2d9
	.xword	0xa1a2b7a85a823f2f
	.xword	0xef768d2add7d7dcb
	.xword	0x8a2aefcae5233fcc
	.xword	0xb43d2fa0855eefb3
	.xword	0x0debaee2147a418c
	.xword	0x60400873da60ff12
	.xword	0x7c85e51b732f9031
	.xword	0x22ada9a9aa6587a7
	.xword	0xc07f5b3a90f8401b
	.xword	0xc3fc96e48c28de46
	.xword	0xb2ec3d789b8766ac
	.xword	0x680a21ca2c748aab
	.xword	0xb5af9822af18a2e1
	.xword	0xe32208232a3c9a6a
	.xword	0x11782e9538f95532
	.xword	0x0f77b5792203b918
	.xword	0xa81c646cf57fc4d1
	.xword	0xc01020e0662bc92b
	.xword	0x5c53e887524442f2
	.xword	0x9feef37ec7bd0762
	.xword	0xa74dee346eb8340f
	.xword	0x2cb6af5bb3cd4f64
	.xword	0x81262eb690000a6b
	.xword	0x35020e8299f7c969
	.xword	0x17b8e6c4122841dd
	.xword	0x610e1dabbdfce707



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
	.xword	0x84c12a8fb9abb334
	.xword	0x13ca87b30df116cc
	.xword	0x2c41d5cfcf385ab1
	.xword	0xb715d0c96a82ae8e
	.xword	0xc924974c78be6211
	.xword	0x7622cef3bbc9894c
	.xword	0x87392fc73436ffe2
	.xword	0xe4a0985e915afcc3
	.xword	0xe5057c0828389ec3
	.xword	0xc3a6724cc4dc5140
	.xword	0x9c0a7626e533935d
	.xword	0x016497ff5950e3f4
	.xword	0xa7830dbb9073a67a
	.xword	0xa38608ffb59802bc
	.xword	0xd3f67c5f65530010
	.xword	0x0448122e81522ada
	.xword	0x9001378a7ed5a1ac
	.xword	0x1eb3089636ced15a
	.xword	0x9e332a8722c417be
	.xword	0x4ece2a3bf91adfa3
	.xword	0x3eed1ef6cd318be4
	.xword	0x7bfc91e081b8450f
	.xword	0x8e6092188b4b0377
	.xword	0x8eee827b035fd285
	.xword	0xae1705c4f4540916
	.xword	0x1902a551b37522d4
	.xword	0xb2bfd508589c1b21
	.xword	0x87db55a51c5ca80c
	.xword	0xe081839c20f059a5
	.xword	0x0de4b12032b27486
	.xword	0xd5294524ef6e2ddf
	.xword	0x6bbd9fae9661ca6f
	.xword	0x1b270dbb51e132df
	.xword	0xe20ec005afcfd017
	.xword	0xa787ab7bac14d291
	.xword	0x80a04219f2fa0991
	.xword	0x34469f4f2e2ab8a5
	.xword	0x88db9f61aca60906
	.xword	0x7778b53e94c47712
	.xword	0xbf49ecdff6d2a4cd
	.xword	0x17c4535165c7f009
	.xword	0xddd1af7aa35ca639
	.xword	0x0a8bb3fb0f330c32
	.xword	0x4fcda3bfac0d622b
	.xword	0xb2b13478eb7b9dbc
	.xword	0xd91d54be10aef235
	.xword	0x6622cefa372d5af9
	.xword	0x6d0bb7848743ac0a
	.xword	0x665fe0b2a40946dc
	.xword	0x20260bd39ccd1a05
	.xword	0x70d314c3542528e0
	.xword	0xfc5403385152369c
	.xword	0xd1f380e2ed380aee
	.xword	0xfcdfdb9179a486bc
	.xword	0x4603027700d72474
	.xword	0x73f7cdbf6662ab6d
	.xword	0xad572ce0e3a05610
	.xword	0xfa390a54a7ed01d9
	.xword	0xf12591690a668b34
	.xword	0xd52c467958e3517f
	.xword	0x12e1f4071cc10951
	.xword	0x8f949a3e96978b10
	.xword	0x8ccdafb8c10c30de
	.xword	0x2929bebfbc044a09
	.xword	0xb9e04e2bbcd87b8a
	.xword	0x749c3fd1fe9f0e7b
	.xword	0x9c3558963e6c8f39
	.xword	0xfaede785eeebcf64
	.xword	0x883ecb0e5a5c80f3
	.xword	0x9df55efd969d68b0
	.xword	0x31bca5b28b6ca358
	.xword	0x3edb4d97cc5bfbce
	.xword	0xc5c56a95c0d45f86
	.xword	0xa52b31211a0dbdb9
	.xword	0x80bdee4993bdda4c
	.xword	0x8563c222d54c77b0
	.xword	0xea733f26e0dbef20
	.xword	0xe1de222261100b39
	.xword	0x5f9f0b39e1ae4a3b
	.xword	0xbaf29028d69dbb27
	.xword	0x79399462b8f4ec93
	.xword	0x270502683a75fa53
	.xword	0x73673f1ac582f641
	.xword	0x5310d3d6a8e716f8
	.xword	0x763c6cebb10ac9d3
	.xword	0x51aea8efd44d5b4c
	.xword	0x09094fb967a2b4f1
	.xword	0xdceba76da253cac6
	.xword	0x3f7ea09b41e009c7
	.xword	0x2a1280dc77a3d0be
	.xword	0x6103198655373378
	.xword	0x74b7f33db4a21683
	.xword	0x7bb9f4b927fd3220
	.xword	0xa7c506a9381e8eb3
	.xword	0xfb1eb4a663f3701a
	.xword	0x0d9bdbee7351ad81
	.xword	0xa2301b41774c8294
	.xword	0x4fb3c679bf22db28
	.xword	0xfa27dd593b2cd551
	.xword	0x95365e9581b47b89
	.xword	0x7858d84d27552422
	.xword	0x22f306f4663feed2
	.xword	0xf22a9919ba648566
	.xword	0x2e642e01bfb0622a
	.xword	0xac70f549341e3a0e
	.xword	0x7c2de02d9fbd504f
	.xword	0x0603ad8a6eaeae0e
	.xword	0x4fb75c45eda90681
	.xword	0xa09347bf41db0cca
	.xword	0x0fa281fbd55f019a
	.xword	0x1a82a6d8f697769d
	.xword	0x9bd48ebe75f14c5e
	.xword	0x41cd15384510755f
	.xword	0x85f21eba11c9daed
	.xword	0x7f9532a3143bf05b
	.xword	0x4dcb9fa3abef0694
	.xword	0xdc4b6e03591fcf52
	.xword	0x87921fa4e7039a9a
	.xword	0x5930ebe249785a5e
	.xword	0x68ea281f052f3f80
	.xword	0x47092373d2aabc57
	.xword	0xfdd4a97505ea2896
	.xword	0xc11afdfbf478be95
	.xword	0x1be90fa2f8ea0268
	.xword	0xb432ab9aef68bfd0
	.xword	0xf814ed197dcc984b
	.xword	0x6c1a02c8232e8fcd
	.xword	0xc49d74e04b587eaa
	.xword	0xf852a3e693288136
	.xword	0xacaa8c01e3cc8b22
	.xword	0x0fa2f50ea179d154
	.xword	0x63647d1451e71dec
	.xword	0x70151102bccb6484
	.xword	0x5e1b8dc43fa8c265
	.xword	0xb9b3f5c0053e82c4
	.xword	0x9a1c36cc2ea6267b
	.xword	0xf626627779cc0805
	.xword	0x31fc892e2f770775
	.xword	0xea9e41f5cbf2a4a6
	.xword	0x88b2b8730a85eaeb
	.xword	0x548669d22acd6d72
	.xword	0xcb1ec3996ca7cb1e
	.xword	0xcfc4cd5c3e5a2832
	.xword	0xff663e74a5afad48
	.xword	0x7e3f6b82b62037c8
	.xword	0x5625e2edbfc62689
	.xword	0x99ceed9d21118730
	.xword	0xd189f08a70facd33
	.xword	0xcda5db8f6d52272e
	.xword	0xa0ce0c5f61c37ae7
	.xword	0x45b4c3924a00c834
	.xword	0x3b9ce845dc8a9eb9
	.xword	0xb73f17a050e78ef1
	.xword	0x4d410b82e14bddcf
	.xword	0x9d5506e94a9f3158
	.xword	0xfdabfedc90d0abdc
	.xword	0x9ea83bab87a334b8
	.xword	0xf9dd7b3b787967f1
	.xword	0x705e038a6e3f1c2d
	.xword	0x557c90942a4c3a26
	.xword	0x2638c5f07abb70b0
	.xword	0x02f9cef1e84288f8
	.xword	0x8cc349517c18b171
	.xword	0x83eb923a389e2464
	.xword	0x8dbd0141409aa542
	.xword	0xcf31c4225d17d365
	.xword	0x154e44455e0fa062
	.xword	0xcbe93e52453dff1d
	.xword	0x52691a54f73f67f7
	.xword	0xe04460bf6380e562
	.xword	0x965f694ef4b49ffa
	.xword	0xb9d3c8d28738ff2e
	.xword	0xa56ab05fac4883d8
	.xword	0xe41fd15a71397f33
	.xword	0x9a85c65b770aa79a
	.xword	0x7f9b2133babf5e74
	.xword	0xd34099da5ab840cc
	.xword	0x277093033d9f67e6
	.xword	0x6ab7de83476ca3ed
	.xword	0x0b8ba7adc61f6b08
	.xword	0xe477c68d9e050b92
	.xword	0x27d1eb9765702a96
	.xword	0x6be129148dbf38e5
	.xword	0x5a5ad23a74ed0328
	.xword	0x7362267a83cbc7f3
	.xword	0x2ea4a690ad50d347
	.xword	0xf899a4ee400cdf95
	.xword	0x650e806a47d61301
	.xword	0x6060f521be5611ba
	.xword	0xf732ef2aa05b7ed1
	.xword	0xf7080d20a43ad490
	.xword	0xbae53ee123c79826
	.xword	0x5326a8710f1fba71
	.xword	0x2d0d8c363ed16470
	.xword	0x8aae73b7b3fba544
	.xword	0x83c2b36ad66cff47
	.xword	0x9b9a3d7a9c94501f
	.xword	0xef809bb2b0f13e47
	.xword	0x7b41c6fecc1db3aa
	.xword	0x3434d1ac9bcf9aec
	.xword	0xd3adf31d5e022e12
	.xword	0x220cab291e570a0b
	.xword	0xfad5b657fdb6ed94
	.xword	0xa255f88fbb982ec9
	.xword	0x0f4747c70fb91a2e
	.xword	0xa75bfd1a74534795
	.xword	0xf461189208c6ffc6
	.xword	0x5a16a8a4cd1feb14
	.xword	0x296baa9cb8404709
	.xword	0xd1756ee55f3e3326
	.xword	0x353ab7b88989fb8c
	.xword	0x1f0f6a5ea4f3cbf4
	.xword	0x43924a21ff48050e
	.xword	0xa8a4e4955d111acd
	.xword	0x3ac5cfe0e7080fb4
	.xword	0x9e24f0803d43cf52
	.xword	0x567d646018a6ad86
	.xword	0xc2cfd672bee3f9fb
	.xword	0xd18cc77f539ef3d2
	.xword	0xb5c49f028238f2b6
	.xword	0xd88bdf1df30214be
	.xword	0xeed68eea29714fc7
	.xword	0xaf9eb97f9c83abbb
	.xword	0xeba9699b92d2c241
	.xword	0x25b29dd7c3287d2a
	.xword	0x94909f73d2f1d0f0
	.xword	0xb0e0ce251bae0d50
	.xword	0xe0a09ded7a98dbdc
	.xword	0x8c5b0303b6dc1eea
	.xword	0x3ea3f08b442b39a2
	.xword	0xe1a930ba764ebe76
	.xword	0x90cf27b214f02fe1
	.xword	0x806cdc706cdf6186
	.xword	0x466b9809f399a8da
	.xword	0xe6ea5eb9bca1378e
	.xword	0xce456d61a8e1b0b7
	.xword	0xc698014e6634d75c
	.xword	0x865024db5bef875c
	.xword	0x155738cc789c9ddd
	.xword	0x7096ae2fc8fd01f6
	.xword	0xfd0438fe88043e6f
	.xword	0x29ff90d539bdd2bb
	.xword	0x477b816707fb941f
	.xword	0x24ffb74fa3673fc7
	.xword	0x50afff80852d33e8
	.xword	0x90e10773a0b0aa2b
	.xword	0xc1c52b5f8e4000ed
	.xword	0xe5f315f7369b8c29
	.xword	0xca6c24e534c40bbf
	.xword	0xa1a9ef900d6c049d
	.xword	0x488201a2cb8a3e82
	.xword	0xed3ae022b47ebf65
	.xword	0xe1fddf7588e0e227
	.xword	0xfc7a71ec8b051e58
	.xword	0x9747dfc1139aef10
	.xword	0x77eddc7fe9aaf558



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
	.xword	0xee5ded1a8c0367f8
	.xword	0x00d517a18e6c1732
	.xword	0x546c1a49f306e425
	.xword	0xebff3b4edd8756f9
	.xword	0x7fc79c19419d7951
	.xword	0x4e2e658a71728e57
	.xword	0xdb546cf3a6763703
	.xword	0x832b30ceaa37681c
	.xword	0xce9dfd63a5948b88
	.xword	0x2ca87198003d6762
	.xword	0xdadcb48c6efd77b7
	.xword	0x9e4d393d74cf4ba6
	.xword	0x6ac1b37aba95e241
	.xword	0x2a615d5f759015e9
	.xword	0x6fa49b7e6423a4d6
	.xword	0xa57a239099e3bb8a
	.xword	0x29ca1516d53330b0
	.xword	0xefd8eb53cce8f9c2
	.xword	0xf303a2b2bd0f464e
	.xword	0x0677e4ce37087f5d
	.xword	0x8c735650335b9812
	.xword	0x9642d10648cd18a7
	.xword	0xcd15e6607e5221f4
	.xword	0x7f073a9241dd8216
	.xword	0x94abb59abc742966
	.xword	0x1c41ecd28a66b756
	.xword	0x4c73b962cef8ac8c
	.xword	0x1f40449a953330c3
	.xword	0xc0306fbb8793b9d8
	.xword	0xc35a0f99cc44b436
	.xword	0x6e00ba16669d3c4c
	.xword	0x88f3328a4949d7e0
	.xword	0x4d0400bc0eba0987
	.xword	0xfda8fdb3061b7987
	.xword	0xdd279154b9177865
	.xword	0xb41280437471babf
	.xword	0xbf8732aa1f9228b6
	.xword	0x7bacaa466399a17d
	.xword	0xa6d25f94c591e846
	.xword	0xdb83b694e8a384d7
	.xword	0x9e62b362bdb26c18
	.xword	0x1d921edb7e091ae1
	.xword	0xb635b2ee5b88387c
	.xword	0x7cf8187897deb1d5
	.xword	0x136360e0a994ea9d
	.xword	0x67a580a4bee8e370
	.xword	0x98b8298d61476f6f
	.xword	0x027c8a3748fa6e54
	.xword	0x1613e703fc8ceefe
	.xword	0x6d346f6f6927d1e8
	.xword	0xeb56f319f418268b
	.xword	0x18bb162bd58f83bf
	.xword	0x0210042222b12670
	.xword	0xba52396690fe9b4f
	.xword	0x7bb1bcad5cf51e42
	.xword	0x53b3f9c636088e68
	.xword	0x528a8249dae8516a
	.xword	0xd31ad1c194f4dd9e
	.xword	0xbaac59055e6b1884
	.xword	0x61c4083c0305772c
	.xword	0x16e1f3119ada2024
	.xword	0xb7551dd52eb72d62
	.xword	0x18f33338893fc734
	.xword	0x37c55fbd052e643b
	.xword	0x7477acfaf038259f
	.xword	0xdba10391ff39df71
	.xword	0x7179c82b6e668a25
	.xword	0x9002eef85217a377
	.xword	0x78bfddb17e174e12
	.xword	0xb5cfa44367218cf6
	.xword	0x5f81611fcd54b3e6
	.xword	0xcb7017e7d8685af0
	.xword	0xf2da197a9b5bfeb6
	.xword	0x23b5ae03e536673d
	.xword	0x7747853b4195cbdf
	.xword	0x81cbf9672b08a079
	.xword	0xf41acead967214fa
	.xword	0x6aac132c68a5dda9
	.xword	0x8371177560df3f7a
	.xword	0x0f15c5cc66daf49b
	.xword	0x87aae4a7243d9433
	.xword	0x5249192cb4b597f3
	.xword	0xfebf6dfc9cf5c3ed
	.xword	0xd70ff55e40022086
	.xword	0x55c1cde121658197
	.xword	0xb762a0dc457e7ddd
	.xword	0x03f147b7d90f5a12
	.xword	0xf4f13d669f04643b
	.xword	0x73081da47c69d19c
	.xword	0x76725cecddd77214
	.xword	0x1bceb863f31da209
	.xword	0x6208b539f392d542
	.xword	0xa8bdd134c1b4f6c1
	.xword	0xe02238f06c9a0414
	.xword	0x2336c39637b4d4c8
	.xword	0x2bc96b36a1ed25b2
	.xword	0x80303276aad4a73e
	.xword	0x65dd2bad9230ce4f
	.xword	0x638fa1a2fcfd3a82
	.xword	0xe2171994740d013d
	.xword	0x0a693e2b8367fc7f
	.xword	0xdbbf28928fdf4e3e
	.xword	0x519d0d6414fec542
	.xword	0xce7881c1ea6f639a
	.xword	0xd383e465cd3b71d1
	.xword	0x02a1a9ffceae774b
	.xword	0xdc4d4d00dc465fb0
	.xword	0x2e1fe1e5d9d8677a
	.xword	0x3cc7c005348068b0
	.xword	0x039ba9123ba7873c
	.xword	0x5d5a478fafb88440
	.xword	0x12c227652b4d214d
	.xword	0x3e3d616341115931
	.xword	0xf4fee301fe08ae91
	.xword	0x5c4762c6dfbd541f
	.xword	0x372fef42605aac07
	.xword	0xdaa9b79128aa2c7a
	.xword	0x0023ff9c4a4ae14f
	.xword	0x3ccbe8d605d285be
	.xword	0xfbcfd2e4518d8b53
	.xword	0xb2a60fc816b52f50
	.xword	0xcd6236488b495896
	.xword	0x80d0495dd984550e
	.xword	0x3d766cd96f7f3a57
	.xword	0x095eac9672fee94b
	.xword	0xf1533ab33872c03b
	.xword	0x03ab7494edbba875
	.xword	0x85618cfad064bdc9
	.xword	0xa7538a03bfd702aa
	.xword	0x1d072330db942944
	.xword	0xe817d94d7ca01772
	.xword	0xba6cf2f013354dcf
	.xword	0x3088d9a741eece59
	.xword	0xbcd13290d38b78e3
	.xword	0xeaf457575658d84a
	.xword	0xb49936aa4fef634f
	.xword	0x5abcd8610cd578f2
	.xword	0x898f174ebd49f047
	.xword	0xfbc3879815390f0c
	.xword	0x262f1dc7c880e848
	.xword	0x0e85e7a4469b5a37
	.xword	0x4ad576924ac56925
	.xword	0xed9ba9e3d8a6d7c6
	.xword	0xc3d65943c5367861
	.xword	0x6fd4b4aa23c656d9
	.xword	0xb533f964717adf89
	.xword	0xd2961c42c2b2d50e
	.xword	0xc319886127223743
	.xword	0x37940ebb6702e01d
	.xword	0x367ebc367b69af9d
	.xword	0x03a52863921e0abb
	.xword	0x950490a840fbbfc7
	.xword	0x83f9cf7983127f51
	.xword	0x9fbc1e08c85ca847
	.xword	0xd690a15f60ae883c
	.xword	0x15ebd22e80e6ab75
	.xword	0x9a6651d21e55318d
	.xword	0xb67a2ec4646f7906
	.xword	0x2cbf0787d9f1c53b
	.xword	0x4a97770bb8f54fdb
	.xword	0xa2307c76bcf98305
	.xword	0x33130ae406cf1e34
	.xword	0x4c2a6bebc20317e3
	.xword	0x253eacdc37df496d
	.xword	0xc068b5ff79d75439
	.xword	0x5452efd99d60200a
	.xword	0xb9d75ca7b81686fe
	.xword	0x9a4dee0369592c8b
	.xword	0xf06951c2962ea35d
	.xword	0x44b391a33b47e8e1
	.xword	0x01381e66a6230605
	.xword	0x2dc06c73d539ab1a
	.xword	0x941fe1e49bd39a11
	.xword	0x66816fb72fd90032
	.xword	0x24af7996259cb9af
	.xword	0xa891914f318d4b1a
	.xword	0x8e67c7122f476893
	.xword	0xa89fd50431b1275d
	.xword	0x490fca50201ebe9a
	.xword	0x0fd951e4d01163eb
	.xword	0xaa2a532bff1d76fd
	.xword	0xc7d0cfa12fb20eeb
	.xword	0xedec273bd74c1a63
	.xword	0xa6f75853cf8ef8a4
	.xword	0x738f3cd697002dce
	.xword	0x2aa6683af21a2b2c
	.xword	0xfdde160a30ef91a5
	.xword	0xebabac7ae6746c8c
	.xword	0x6878e8ad4b170c72
	.xword	0x6203aab0168d9012
	.xword	0xabdcf33307b12d87
	.xword	0xfe2de3d8125e1623
	.xword	0x51f9bb1ce70dde14
	.xword	0x7bfec4c8adca3f27
	.xword	0xbc797512353af6ce
	.xword	0x4ba67a83c267afda
	.xword	0x062a33ae665801ea
	.xword	0xf38002c77cb9113b
	.xword	0x61022e8808b1bb9e
	.xword	0x8c59a36e03ced9c3
	.xword	0xcd59a23cac7b2888
	.xword	0x8a2936f38433c1b8
	.xword	0x26c60e4bb3671467
	.xword	0x6ae0edcc5f21099d
	.xword	0xdd6780935d3faa51
	.xword	0xf6ae7f9330645212
	.xword	0xcfebab2fbb694d59
	.xword	0xc73025309a639528
	.xword	0xfb6a2056f585372f
	.xword	0x04fb1d2a7d60875b
	.xword	0x8a71585c12fac47b
	.xword	0x1ef1b73d0efb5436
	.xword	0xe63ea7cb0e3714da
	.xword	0xad6a1aac59fdbfd1
	.xword	0x2d5d2541c221d2ec
	.xword	0xe8dc1839dcb271ec
	.xword	0x5404530312231794
	.xword	0xb618309456e44e6a
	.xword	0xa0ab3add6ccd6b66
	.xword	0x7725b86b9fe7effc
	.xword	0x711888fb2de4f070
	.xword	0x5eaeb5988ef57a1d
	.xword	0xdb6a419cacc93d3f
	.xword	0xc9bb8643d20b7d01
	.xword	0x4e1fad7daa8d7de8
	.xword	0x4bae5af97b7b3b52
	.xword	0xc9b54efa1316cf73
	.xword	0x94a827174b181eae
	.xword	0x9d229669772eb136
	.xword	0x5a9b8d7793546955
	.xword	0x13b13ccf4982200a
	.xword	0x807f1a0bf049b931
	.xword	0xbbfeefd45b235867
	.xword	0x46c51a768dbc21b8
	.xword	0x6b617f44319e760d
	.xword	0xf458f9e3b55c5b6b
	.xword	0x93799b1ffda93fd1
	.xword	0xcd12eacf64791f47
	.xword	0x3a9ad7cd2ca1a4cb
	.xword	0xcf29f3f9dedfbaa6
	.xword	0x269388c68b1a0606
	.xword	0x1bdd26938c83b2b4
	.xword	0xe0aeb27dce31862d
	.xword	0xdab25d10cf915e46
	.xword	0x390d51b1373f7123
	.xword	0xe02fd06e4ffed95a
	.xword	0x2e921b2cfbf4b97f
	.xword	0xaa027afe5156af83
	.xword	0x1f3d3a0b4260f110
	.xword	0xb24ca93cc60e833f
	.xword	0xea5ec954d4e50c4a
	.xword	0x15d87c1cc51ad131
	.xword	0x4798674d90627cd1
	.xword	0x525c673c9229dd96
	.xword	0x135dc9d8b8891da6
	.xword	0xb63277507d9b6255



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
	.xword	0xedc79ca64e20b8e8
	.xword	0x3b15e2a2e674e556
	.xword	0x777642de7b389415
	.xword	0x053255f26c07d2be
	.xword	0xc0a9b59f3abf66e5
	.xword	0xcdce77fd00439639
	.xword	0xc9ae0cfe99af1d2d
	.xword	0x1dd000b44b882c6e
	.xword	0x15e087a46ae57f4d
	.xword	0x581657a29c1a2262
	.xword	0x986c2f607864ee14
	.xword	0xe57ac96d726544ad
	.xword	0xdec1b072fd6052ac
	.xword	0x469d5ca2b45c9fc7
	.xword	0x5f8149ee1498eb64
	.xword	0x83741521a9e05626
	.xword	0x32a0e48494077bf0
	.xword	0x8d875eef44ce2304
	.xword	0x54e2348c4e5d8063
	.xword	0x29c218590b95630d
	.xword	0x4f1662535ad9c6d7
	.xword	0xcf3dc6b6ff6e7fa0
	.xword	0xa85e105f3ff3a780
	.xword	0xa4ee798d9c4de545
	.xword	0xea38a00f3e1ce788
	.xword	0x5da9c2ce9ec0aeed
	.xword	0xd778b07a9a7160b2
	.xword	0x8034c5127141aedd
	.xword	0x198226eb8d3e56ca
	.xword	0xfd8ce250352f5e92
	.xword	0x3802929bbd038560
	.xword	0xfe58b7a613b74d2d
	.xword	0x8bd410d0c846120d
	.xword	0x0f131f3a4f97e353
	.xword	0xee36268e9d18abd6
	.xword	0x760459f7d5b82fe1
	.xword	0xbeb6e01b1ae9b2af
	.xword	0xa77e3136eb659e90
	.xword	0x4f0732756be6d9c3
	.xword	0xef6e1c9d60e4e112
	.xword	0x96a22748f0bf2b1d
	.xword	0xa163272c9752046a
	.xword	0x977373b222cae8bd
	.xword	0x9ee96bffda2e3264
	.xword	0xf55dab1c1b19faad
	.xword	0x313365c0b6d8d55c
	.xword	0x37cc1bbe5259bb4d
	.xword	0xe948e2935f506af1
	.xword	0x913df5dcc2d87d37
	.xword	0xde4fb8b2e6c73fdf
	.xword	0xe3bd0769a61a1b03
	.xword	0x68e06fdc3df22bfd
	.xword	0x68731d4609d1370d
	.xword	0xb696c5919bf57a54
	.xword	0x928cebc6f74ac30a
	.xword	0xe767707bfc62162b
	.xword	0xcbd3f379f0ce24e5
	.xword	0xe3bd16927f079690
	.xword	0x3c765ca00af0a1ec
	.xword	0x1498b74dc6dcb728
	.xword	0x0d790972995f16df
	.xword	0x0d6d32960ffbe595
	.xword	0x164be3944b330140
	.xword	0x73a1573df9efc271
	.xword	0xee685cdbf08f9a6c
	.xword	0x90797682301d9a33
	.xword	0x3f918d9560bea8eb
	.xword	0x6a24a609888102dc
	.xword	0xe47377c12dcef20e
	.xword	0xe639b3e72fdd3c18
	.xword	0x648fe39e88969cb1
	.xword	0xd942d78c2b81d48f
	.xword	0xa85a4dca5059fe9e
	.xword	0xb89820cbd3124f4a
	.xword	0x7cea4ea6ec57ca72
	.xword	0xc863abba316a83ed
	.xword	0xb0794890087f0961
	.xword	0xaec5d214bb5ca507
	.xword	0x6eb990e0fcd6edec
	.xword	0x5330278af509f68f
	.xword	0x636e39e31fb9123e
	.xword	0x6b302304b4e33aca
	.xword	0x1596b54d0aaabffe
	.xword	0xe31aac5590fdf324
	.xword	0x22a974eb4005fbf1
	.xword	0x33010052ce3a4cdb
	.xword	0xd9027016b1951d86
	.xword	0xe371edc76827c455
	.xword	0x67285c017dda6fcd
	.xword	0x0c3f8e3dcc20d464
	.xword	0x93122c6728a96721
	.xword	0x8d97a02a9ac4bfb5
	.xword	0xec90e2357afc4816
	.xword	0x4db6ec54426390f3
	.xword	0x48e7fe3df68aa7a3
	.xword	0x3ae6a0ea47cf6756
	.xword	0xf742db84e0a7b4e1
	.xword	0xe783dd716702869b
	.xword	0x28ae6751a707ed38
	.xword	0xa7f5ca9252d434ee
	.xword	0xa7806349a9257544
	.xword	0x32cda6492c2a9c6f
	.xword	0xe696ae35c4a0cf2c
	.xword	0xcdf656f192f56f87
	.xword	0x541d1cddc4b9bec6
	.xword	0x0ffa95314ef31d1e
	.xword	0x86126319942969ea
	.xword	0xd05173c4f3a07c6e
	.xword	0x706d6ab939879f34
	.xword	0x66d3aa49c84433d6
	.xword	0x33ed0fc56bd39c3e
	.xword	0xcc0d8d366285a019
	.xword	0x1746c9acc0891d97
	.xword	0xcc5b75e34427dd7b
	.xword	0x174a893b08255500
	.xword	0x0402cf1f0d9dabfa
	.xword	0x342b6ded1fcbb6b8
	.xword	0x92609b64a9a78d37
	.xword	0xbcec663da34c5da5
	.xword	0x34a343475060bb66
	.xword	0x5a8c3f74a30ad384
	.xword	0x8972c20a6f718b34
	.xword	0x45bcb3707d23be07
	.xword	0xef8a7a79da2643d1
	.xword	0x35449807f01bb4f8
	.xword	0x1c267c5fffa1402d
	.xword	0xe152dc2c7f9a81c9
	.xword	0x5c8216406270f094
	.xword	0xcd4717d2a6637e78
	.xword	0x60985fe26bd69a01
	.xword	0x1f801f7e2c470285
	.xword	0xfb37eb70d26ab644
	.xword	0xc93778ced6d87ba3
	.xword	0x42a6f23217d0c1ab
	.xword	0x2781a0d3e6ccc74f
	.xword	0xdfd97ab6771e8904
	.xword	0x97957c63ca50f28b
	.xword	0x982ca0ea02c16960
	.xword	0x4dce93b97ed5c616
	.xword	0x690f6e3e67f3d196
	.xword	0xa00508b0ce48f3eb
	.xword	0x5bfeb31d6a74d2d6
	.xword	0xd57ba4f7b6b2e4d3
	.xword	0x01259732a5325726
	.xword	0xd94cd80e932304a2
	.xword	0xb2e10ba66d7d7400
	.xword	0x3c22da025e77ac6e
	.xword	0x61b267fe1bf1d778
	.xword	0x5fa5b8a5efc981a1
	.xword	0x4a10c84f8002151a
	.xword	0x84ee10881fceb59e
	.xword	0x1a1d1fee2525caf8
	.xword	0x8c3fc29b1ca43f58
	.xword	0x9464a94330658330
	.xword	0xd134e0aa3fe89329
	.xword	0xed8da621297e311f
	.xword	0x527234c445c2b993
	.xword	0x265e87e188334c08
	.xword	0x1100423c9df6f383
	.xword	0x2f17900184a5470b
	.xword	0x311e2e2b1203527d
	.xword	0x31e2ca2b195b6667
	.xword	0xe44f46ac7dcd6bd4
	.xword	0x3c11bfe7fbdd70a5
	.xword	0x31ca800b108e28cb
	.xword	0xc98359bf1134e738
	.xword	0x853969a7c885c25a
	.xword	0xb4364c6e6401702b
	.xword	0x23e730cda67acb6b
	.xword	0xba5e2d15c7625ad1
	.xword	0x0b90fb8ab705a9e8
	.xword	0x234a8cb9f4acad4c
	.xword	0xdce68a0e44bfdf44
	.xword	0xefb6f45f8a74b0b8
	.xword	0xf53389081b2619f5
	.xword	0xbce4bad8c39f7e59
	.xword	0x419bd9fdf3d77d3d
	.xword	0xf3873884d7c8a953
	.xword	0x722a304a95df269b
	.xword	0x54150c3c637937fa
	.xword	0xe35daa4ae0bd2e3b
	.xword	0xe100f85bf2efe373
	.xword	0xa2194f693442fc69
	.xword	0xe7547fc5c0ff56bf
	.xword	0xd0572de0a8c91fa1
	.xword	0x534d50602c644b05
	.xword	0xba3a833f8e70b650
	.xword	0x826ca67abec67620
	.xword	0x3bc8f4e8c6f2422e
	.xword	0x2cbefa0c68358c6a
	.xword	0x74dc4195eed2a680
	.xword	0x0412709f5ac54e72
	.xword	0x052b8ad5ebe565a8
	.xword	0xbb52998724d87905
	.xword	0x56b4442366f2ca67
	.xword	0x8eed9725bf7124ee
	.xword	0xcc8114d17d3aa06d
	.xword	0x17fe1683e6d4830a
	.xword	0xcb143017f2fe64f1
	.xword	0x8ab105bac7f0260c
	.xword	0x253decdcb46cb4c6
	.xword	0xd201e8a973b87eba
	.xword	0x0e0607250a80cc00
	.xword	0x5e628e392d24117c
	.xword	0x6898b6fb2338228d
	.xword	0x2f48819e59e29493
	.xword	0x8a9f6e34e789db8a
	.xword	0x0b9c6b21a618081b
	.xword	0x82feb843f44558ff
	.xword	0x3e3a804aec5aebcd
	.xword	0x25bede1534ec61e5
	.xword	0x61e37826d05b45b7
	.xword	0xf57e8c29d33a50c5
	.xword	0x485ff5eea84bacf1
	.xword	0x57672b7e8baa1a17
	.xword	0x23e86157a637bdc5
	.xword	0x6f6a4bb711ee514e
	.xword	0x04fb186a881a2149
	.xword	0xbadc2d6d09846d5a
	.xword	0xb81ee52ed6018309
	.xword	0xeb065f6d595a2d07
	.xword	0x078c0f7a89cc4423
	.xword	0xa46a8acb0249215f
	.xword	0xb7182a8436fdb29e
	.xword	0x075ef91365f29e74
	.xword	0x08f1196141ff6f89
	.xword	0x986840ab3fe5ced6
	.xword	0x8d8734c218b42921
	.xword	0x6b58b1b17217a881
	.xword	0x415878391566ef2b
	.xword	0x9c4b6429e187c55b
	.xword	0x9f898d2671402607
	.xword	0x984c98929362efe8
	.xword	0x5a50132e7f4554b0
	.xword	0x932f5307ee4ddbac
	.xword	0x2ad5cc47600ce8a5
	.xword	0x019fb9c75dcf3f1c
	.xword	0x1100c6e1621974bc
	.xword	0xb08963fce527c295
	.xword	0x9d69128ae75811e7
	.xword	0x4c56f02e8c446ef8
	.xword	0xd931260e78e6909c
	.xword	0x0238e635cbed8541
	.xword	0xa9b2e6929e3e14fd
	.xword	0x28c8f7d0d093ee7d
	.xword	0xe13bf0eb41a0c280
	.xword	0x88a105e3f88011f9
	.xword	0xac88f0a54dded4d8
	.xword	0xa8907df696215eda
	.xword	0x270e399d60868fdc
	.xword	0x3d611fdd3b6e1c33
	.xword	0x078d8ede22e92eff
	.xword	0x323da2f78db71d33
	.xword	0x800454abf9a83f33
	.xword	0xf1ee1a6bc9fd88e4
	.xword	0x5d76578f605d8ad0



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
	.xword	0xebeda025141185c4
	.xword	0x8aa59e8ac45800e0
	.xword	0x7ba7ed507e77e216
	.xword	0x58fbe99fd95fffe6
	.xword	0x0be9cf282b5c39b4
	.xword	0x159cc409711aabe8
	.xword	0x903264c4dd2c4c62
	.xword	0xd6866a75688165ae
	.xword	0x11e82f1a1dd5a74a
	.xword	0xa2fb40d76cd0366e
	.xword	0xfe7d6daa308450dd
	.xword	0x169d011cd1d244c4
	.xword	0xaa29e688d5f486b1
	.xword	0xc00f37bdcff62e37
	.xword	0xefe344ab2c99be8b
	.xword	0x44c91fc51b374c61
	.xword	0xd46a6a563bab488e
	.xword	0x5a72675d957a007f
	.xword	0xc5e33153cdc05496
	.xword	0x0e0439c70523775f
	.xword	0xd4a711837a6d948f
	.xword	0x82a066c21b24193a
	.xword	0x5ae2d3f539e9e4c5
	.xword	0xcd4fb29a241775b3
	.xword	0x4932ebc7c703b198
	.xword	0xfe7c2128588b36a1
	.xword	0x589d4145b1251a0d
	.xword	0xd8fcde138272c571
	.xword	0x6b060c0633f826f2
	.xword	0x18a0201a5dc84e21
	.xword	0x0e5e82fc68ca9e9e
	.xword	0xdc14cbb9311db36a
	.xword	0x4bc0f4af766096ae
	.xword	0x83f977c885cb597a
	.xword	0xb6326710f42d0bb7
	.xword	0xa78425cf5946d32f
	.xword	0x0389741153449193
	.xword	0xf5f295cdba5d55ce
	.xword	0x22c59d0bc1817343
	.xword	0xeb30301b4845d9cd
	.xword	0x4dbc9372084e3bd1
	.xword	0x34975fa8b29f6186
	.xword	0x24ce7ada4df2a5c0
	.xword	0xf3eb9ffec65532e1
	.xword	0x0318306d1d7835de
	.xword	0x307367bcf0bbd06c
	.xword	0x3146539c011cfa65
	.xword	0x14f0547684e897b3
	.xword	0x698006c2bd33b3b3
	.xword	0x49d979330529acb5
	.xword	0x8bc303fe7eb81abc
	.xword	0x40bc03c2fed645e1
	.xword	0xf4f30755eb655bb1
	.xword	0x51a79a5e0fd5db6a
	.xword	0xdc96cf078e3a51b1
	.xword	0x39c21814d801eff6
	.xword	0xd2c60f138b88ad1e
	.xword	0xa91407b0f8b1c30e
	.xword	0xca1c9f6073346353
	.xword	0x06f6d271e1f92694
	.xword	0xba65e617bb40c3b8
	.xword	0xc34b40718c25c433
	.xword	0xe6f7762b009b42a4
	.xword	0x8b1b4fc1ca855119
	.xword	0xf86249b665bf2065
	.xword	0xe1abbbd1a3d05af8
	.xword	0x37405e4ea9999d73
	.xword	0x9d3b53babe0941aa
	.xword	0xbd416bf661a27205
	.xword	0x520f2b0a29d95de5
	.xword	0xbd02647c23f8fd52
	.xword	0xfd7b475826bc09d2
	.xword	0xb4b1ca2230683ac0
	.xword	0x2a05df0cefdbcb1e
	.xword	0xe0270d47c6ba93fe
	.xword	0xfe00aae40e603b2a
	.xword	0xa5b17230f4b2704b
	.xword	0xafba1d4ea076b437
	.xword	0x7162b47c9a6172d1
	.xword	0xac03fa4ec2197a3a
	.xword	0x0592623f4fd548f9
	.xword	0xe3b506f52a594147
	.xword	0xc7f605cc8c392816
	.xword	0xf937d9a5759518ac
	.xword	0x180a2357b594346a
	.xword	0x5a30fc759679426d
	.xword	0xe57547d2323dc821
	.xword	0x84eb02dfbd2904d8
	.xword	0x677834282edd4145
	.xword	0x833640fc3cbc7763
	.xword	0x86bf4a40637a2d67
	.xword	0x9a8cbb8409df3f13
	.xword	0x3d0f1793dc7a4bf3
	.xword	0x7ad33c2bb76b2b0c
	.xword	0x66eff4961275d341
	.xword	0x48b571f7733de2d5
	.xword	0x94c7b0799b324e7d
	.xword	0xb954ddd996009fda
	.xword	0x26217a9977a42148
	.xword	0xe00b31b9c70acb34
	.xword	0xb21cfc0a261d325a
	.xword	0xb45dc9a7b804faa1
	.xword	0x6bf41db1834e56da
	.xword	0x66e3c0896779b907
	.xword	0xc32fea3ae1467ec9
	.xword	0xbeb1cb25f23aaf2c
	.xword	0x6f599d8b2be8d48d
	.xword	0x31c810f824bb15ba
	.xword	0xde49df25b43afac2
	.xword	0xc74171f954222869
	.xword	0x8a7211e1d2674648
	.xword	0xed7a545660a99d57
	.xword	0xd87079b3d944a62a
	.xword	0x8aa6b04e429043ef
	.xword	0x92b5c57a5de6002c
	.xword	0x138233a7c40f9b04
	.xword	0x20c5febb732631fb
	.xword	0x194ba60bd4dc1a4d
	.xword	0xff9ebe3d88815e50
	.xword	0x26e5a1c5b6f2855b
	.xword	0xfd454a400192d695
	.xword	0xf80d827f96efa144
	.xword	0x2ec4c203e75adbd4
	.xword	0x80e9bcf50bc8ef1f
	.xword	0xad31cc9e69ec8e86
	.xword	0x50b33239f3e978c6
	.xword	0x6b4f6f482ec51ff9
	.xword	0xf386006e06d68ee8
	.xword	0xfd20e5d588a3ba59
	.xword	0xc72c2e72d2d6adc5
	.xword	0x202a43ea206de42b
	.xword	0x6f58832b50b41e69
	.xword	0x740d982f7792599e
	.xword	0xd3e4c981d7d90f8c
	.xword	0x0390968e38bbc5a9
	.xword	0x0baf751c14126370
	.xword	0x8854bd0bff60d595
	.xword	0xb9df01df163cbb28
	.xword	0x0415b2e0887edca4
	.xword	0xcb058ea88d975080
	.xword	0x6deb1c11f7f55939
	.xword	0xbe256a9074119749
	.xword	0xd198798c7743217b
	.xword	0x469871e1b9b3fafb
	.xword	0xb38df9f750a2eeae
	.xword	0x77b19b6f32785745
	.xword	0x910748737b4b0cc3
	.xword	0xedb3a997918a1a74
	.xword	0x66bda154e40c0c3f
	.xword	0xa880b6bd487af32e
	.xword	0x2bdf46bf92beff69
	.xword	0x0c1d95620cd62549
	.xword	0xff60f91112dd9230
	.xword	0x62c0b47f67dd68ae
	.xword	0x1373fbc10e658caf
	.xword	0xb3928a6a1f50e455
	.xword	0x05c3d28d9230ff0d
	.xword	0xf94e0f75a3b3f9f9
	.xword	0x859f9f0b30c872c5
	.xword	0xa311bf44a44cc391
	.xword	0x82eec29e69d612e0
	.xword	0x6f59f2da42097818
	.xword	0x3db76fd8c1967800
	.xword	0xbdcf8f6697ea6cc3
	.xword	0x37e91520af281223
	.xword	0xa00125aa194f244c
	.xword	0x864c1405b63905f3
	.xword	0x702b68e976d53219
	.xword	0x6b9a10a3cf7da939
	.xword	0x21aaa71032d35f3d
	.xword	0x8c11b17ea17cfe3a
	.xword	0x358e9ceb594f0dd5
	.xword	0x52d7ccc9bd669293
	.xword	0xc6d0b79e4e3d3053
	.xword	0xf1bff80835fa30f0
	.xword	0x0d4666425623d7b9
	.xword	0x88cf87e625482fc5
	.xword	0x5e8ecb14ca3df9fa
	.xword	0xaae735e8635dfd8d
	.xword	0xf6bc182c8f55828f
	.xword	0x44a4639cd52b0867
	.xword	0x78ea50016c52dbfc
	.xword	0x63e42fa19a2f1ef2
	.xword	0x48f4c88d173feab4
	.xword	0x895f1dd833d9d1fb
	.xword	0xeacb8efcd7d316f8
	.xword	0x8aedfd5842d9b976
	.xword	0x91a21f67597233a6
	.xword	0x5c155c4daef643a3
	.xword	0x0513b14d67fba9eb
	.xword	0xede06ce96751b464
	.xword	0x3d99662e2a220374
	.xword	0xdb0681403b17fc25
	.xword	0xc20636bf9329a8cb
	.xword	0xcb33376c8909d31d
	.xword	0xb520a23018a3d583
	.xword	0xf056ecf8da957797
	.xword	0x463ceb68d66b3a94
	.xword	0xc0944097d16e056a
	.xword	0x1cbe46ea49d1e34d
	.xword	0x181c1711b275e937
	.xword	0x1c9e41f6f6e1779d
	.xword	0xbd81bfcff3388d29
	.xword	0xb098e4b411437802
	.xword	0xec38f7f3ba1c824c
	.xword	0x15959bcd3bd40160
	.xword	0x216f3188ad3016f6
	.xword	0x3a0aee3139235626
	.xword	0x68a5b329a961bfd0
	.xword	0xe1a80a04e49f9020
	.xword	0xc86de906eff53f1c
	.xword	0x2de13a267d2a2979
	.xword	0xf5b90076c97d2065
	.xword	0x97268a0c1b4657db
	.xword	0xef72d88f095bfab4
	.xword	0x92f92da5e883a6ad
	.xword	0xc2d7b278130b3dc7
	.xword	0x6008c4892b392e76
	.xword	0x8d9a9f848f6b4e96
	.xword	0x79595efdefd79329
	.xword	0xedbf737bd1ebeb66
	.xword	0xcba73f7e79ef4ffc
	.xword	0xaeafbab3ab845d48
	.xword	0x4bec6324c20b154f
	.xword	0x3df4305840325729
	.xword	0x7e68d85732963636
	.xword	0x3a63c0bc2de0fc92
	.xword	0x93a3832fad8e4f53
	.xword	0x17f173bdb5f441ad
	.xword	0xc502a0a052064816
	.xword	0xac26b7b6fd5463a9
	.xword	0x4b25bf3c35750ed7
	.xword	0xf0f073158f673d01
	.xword	0x11a018f71ff0e327
	.xword	0x2e765260295ae93f
	.xword	0x228719298e7a5e5a
	.xword	0x0e44543cc88ce7c3
	.xword	0x37c9adfdfee350c8
	.xword	0x04b941e18d185439
	.xword	0xf8ef16801af60650
	.xword	0xe3f24a18b5042760
	.xword	0x3416f60a7130429d
	.xword	0x8769cb53dca04cf9
	.xword	0x1bdbf04ec0c71f25
	.xword	0x31d9acf421817cb2
	.xword	0xd19ccfb1f36c8d58
	.xword	0x036f7e522e4401b9
	.xword	0xfce294f888e4a4d9
	.xword	0xe661fb1584b20407
	.xword	0x3c80c8455811ce58
	.xword	0x04976b88385fbdff
	.xword	0x38a83953005c4a3c
	.xword	0xa48766dec5e46a33
	.xword	0x16628a67d63e43b3
	.xword	0x36ace6765cf64667
	.xword	0xb3816645e0337a59



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
	.xword	0x1875d0fd2fb70234
	.xword	0x87911097678c6358
	.xword	0x9e3c73de0c06fd9c
	.xword	0xcdcf4b2dc83b64ee
	.xword	0xf3eec8db3cdfe7ff
	.xword	0xf63f9c82dbc0578c
	.xword	0xf2824120a0678902
	.xword	0xd2516290fcd80e6f
	.xword	0x9e1ec6f6b50a0aa6
	.xword	0x1e67462f27d9f304
	.xword	0x24cb2be2730d389e
	.xword	0x3fba4d5e1e0793b0
	.xword	0x8391f36ef2608d5c
	.xword	0x2f169a4cd770e518
	.xword	0x4188947d42ed9335
	.xword	0xfcf27f3416f754f9
	.xword	0xc9f9fd7631790d4e
	.xword	0xd103642d7f74e294
	.xword	0x7325ad0e99470838
	.xword	0x668e7f0790a3144d
	.xword	0xe8ae938a7e5904c0
	.xword	0xda6b2ebf50aa15a2
	.xword	0x39bd0b96f09ef4c2
	.xword	0x7ac6f8f5dbb3c3c6
	.xword	0xe7e688d968ed7ac9
	.xword	0xebe23b132f40fae1
	.xword	0x70fff726cedd6c49
	.xword	0x727c989b125283e3
	.xword	0x17b0080b39cffc0c
	.xword	0x15f4b653a13204c7
	.xword	0xdd1833ef70bd8c0e
	.xword	0x449ec192e2463f06
	.xword	0x6ca31113a2da02b0
	.xword	0x6ee488af85649eba
	.xword	0x0738db215d4b564f
	.xword	0x4395cfcee5b8966d
	.xword	0x2d54feb60fd73b4c
	.xword	0x4d8f9b1d06b319cc
	.xword	0x73de5b176bb5e10c
	.xword	0x1e9b01daca092fed
	.xword	0x7772c3f62432c2b9
	.xword	0x0f5de745ff6ba969
	.xword	0x367734df30168466
	.xword	0xa891c132055f3733
	.xword	0x4ee10b1196bbac96
	.xword	0x2820d7d125f035c9
	.xword	0x993a990bb61686b9
	.xword	0x7cf47b52e2e683d6
	.xword	0x2ea56edee7f431e1
	.xword	0x50b5abae2e151fa3
	.xword	0x3104b40d1953c749
	.xword	0xfeee1fbdb64f0c52
	.xword	0x96b2c12f1e5ff722
	.xword	0x37a0b375859496fa
	.xword	0xa8d36a7ba43d1a61
	.xword	0x80038f69b16e7566
	.xword	0x0943749e16395e2e
	.xword	0x86f782fb4a71f1db
	.xword	0x01ec8fa21cc22c09
	.xword	0x7ac1f539ac07b996
	.xword	0x38380add5eb0e1e8
	.xword	0x449cdaf9710529f2
	.xword	0x10ad0fa3ede471e4
	.xword	0x0c93add2b70f7e34
	.xword	0x5a9a7f3d47875161
	.xword	0x8441f8a41cb364d1
	.xword	0xa075de2245b52d5e
	.xword	0xff1c0fc8df8374f8
	.xword	0x4aa4ee35387357ea
	.xword	0xe00957fe7ff29f02
	.xword	0xa818edac1ff6b175
	.xword	0xdaa54f3677cde147
	.xword	0x3d4540ca83553325
	.xword	0x9d56565a04dd69b6
	.xword	0xc3038d4e91c6076f
	.xword	0x3167d8b59dbcd460
	.xword	0x5cf27d4437aa16d0
	.xword	0x23ea0cb84cf613c3
	.xword	0x61028e9ad5f2d39b
	.xword	0x9c600cdd7ac8887b
	.xword	0xaa1cb8e2263ec465
	.xword	0x32d270dafbf1445d
	.xword	0xbff27eb79298866e
	.xword	0x79d19e0f9c454967
	.xword	0xce73a4f6f4f75281
	.xword	0x50bbe5abb5659dde
	.xword	0xabf0022fdb5cad5a
	.xword	0x4cd53a4e020dd31a
	.xword	0xb4ffc33aac44d4c8
	.xword	0xad7b0167cf7b5c4e
	.xword	0x7cfac8d6c5acd32d
	.xword	0x32126b8f0297802e
	.xword	0x761526cfeb262c24
	.xword	0xb6b62d5609dc1e26
	.xword	0x42547493ec326cd3
	.xword	0xd71270b6e66fc534
	.xword	0x35ba3f1c32277543
	.xword	0x3012cc674c18f529
	.xword	0x36644672304ee580
	.xword	0x97f8ae8ac75770be
	.xword	0x66fded635b7ee52b
	.xword	0x6f18f87bb85e1ee8
	.xword	0x21a6652d38b1c375
	.xword	0x7ac153e6d76cbbea
	.xword	0x2f5791da649b2b96
	.xword	0x7c4a51c99683071f
	.xword	0xfacf1d4f224d9752
	.xword	0xe6b482077527e57d
	.xword	0x8c3617f20c28ebe9
	.xword	0x90a31d7bd7b2f172
	.xword	0x3c6e21e0e2262a62
	.xword	0x2de1fb6339bbf6ef
	.xword	0x64a09a4159f34ed3
	.xword	0x85fae6d89d919ee7
	.xword	0xd3292fe2dafeec38
	.xword	0xf6173314ead11abc
	.xword	0xae2df0a14e136714
	.xword	0x6dbda683a454b102
	.xword	0x403079709aed35e4
	.xword	0xfbdcab02a406d26c
	.xword	0x395fc567b0f160f2
	.xword	0x60c4ffb4ffbcdcdb
	.xword	0x6cdafa78805acb03
	.xword	0xfa49220daab95df3
	.xword	0x0bdcf2c47eec5330
	.xword	0xd7d64e489ceeae2b
	.xword	0x8479e107454cb6ba
	.xword	0x0592c3d0ce1cf2af
	.xword	0xcf02098bbfed5a96
	.xword	0x8a2fb28ea6c922ce
	.xword	0x3bf800a280646033
	.xword	0x1e0c81570328de3d
	.xword	0x0ff4435c04e5af64
	.xword	0xeb8c5b9648613e05
	.xword	0x6e257895fe20fcca
	.xword	0x00515e10d0a064fe
	.xword	0x11d3136230134e15
	.xword	0x9976d2c309275948
	.xword	0x3a525dc54a1ceb1e
	.xword	0x3e59b90825036969
	.xword	0x2507059b85761942
	.xword	0xe38bc4888506ebe0
	.xword	0x8248fb5ccd0a8334
	.xword	0x871638190fca9924
	.xword	0x574d326c20af4fc8
	.xword	0xb55808721bd0086a
	.xword	0x403a0dba3ebfb716
	.xword	0xefbacf26dcda7b75
	.xword	0xb797af24581e28ed
	.xword	0xc3516a53213cfbc7
	.xword	0x96cc3ad5624085a9
	.xword	0xb5ff069e8e061ae1
	.xword	0x970296f07f81fcb8
	.xword	0xb4e4d53c9e81281c
	.xword	0x7fcd0457665f2715
	.xword	0xed5c41708b5fa2d8
	.xword	0x9ed69812dc17bbf1
	.xword	0x5289049a6b20b9c1
	.xword	0x1f966e6ffaabf971
	.xword	0x57a0ff5ff270d688
	.xword	0x4257e4e2be62e660
	.xword	0x09d9f171eeeddf39
	.xword	0xc3094c0994c884f8
	.xword	0x504822218401930e
	.xword	0x519392f5efcced09
	.xword	0xb1eaf6a727fd0068
	.xword	0xb99078aeee45763c
	.xword	0xc8f50f48cd7904a4
	.xword	0x9145b886584b991a
	.xword	0xec44eb75bb66a4f6
	.xword	0xd502b47fd88e5acc
	.xword	0xe20c2750ee550e79
	.xword	0x576114f0be54cf57
	.xword	0xa830952c4fe910d3
	.xword	0xc040964ff9913e79
	.xword	0xf3f7e0ddc7ee9607
	.xword	0x6c70df63f8a980ba
	.xword	0xffa515e8e2bc4ae2
	.xword	0x77564f7d3442c18c
	.xword	0x25743ffc82d28d1b
	.xword	0x71f10d7a308859ee
	.xword	0x594867a367a8f01f
	.xword	0xa70182d78a1360dc
	.xword	0x170911a56fcfa46f
	.xword	0xd4e01cb2dc3357bb
	.xword	0x2ca837f388de47bd
	.xword	0x4ece98ff13baf7d1
	.xword	0x3fa84b6c5436cbfa
	.xword	0xe42785889208e098
	.xword	0x140b18ed28132310
	.xword	0x68d05bff15a404bc
	.xword	0x393b2bdac1792a98
	.xword	0xfcb0728de4bb78b8
	.xword	0x6b29d5aa8b7e2627
	.xword	0x914e44e005a0d3a2
	.xword	0xee43fea9f78ea88e
	.xword	0xccc0df86fe25449e
	.xword	0xe0cf349a29e3b1c9
	.xword	0x649c8acf05979e59
	.xword	0x256dc52aa19eed2d
	.xword	0x1563344b9b513790
	.xword	0xeb6ffe47760df526
	.xword	0xa7b880a34ede5cfb
	.xword	0xfe343269ae11b757
	.xword	0x13d69f3fe676e091
	.xword	0x4989c3c4a0672f96
	.xword	0xd2b3533af67a5535
	.xword	0x3dfcc3f26036e660
	.xword	0x898e8d7adebf3e1b
	.xword	0x1e69d4c6ad188fdd
	.xword	0x932e3eb79b247dbe
	.xword	0x125619cfdb45aa94
	.xword	0x31a7732ac0f63560
	.xword	0x8753ed385d64aca3
	.xword	0x41ace2b25c327723
	.xword	0xa29f2c784b85aeef
	.xword	0x58e81474a4abb1e2
	.xword	0xb5cc4419daf382e4
	.xword	0xc7d3fb0634cee77e
	.xword	0xb1a41aa52dde7ebe
	.xword	0xc501046f34664e1b
	.xword	0xd8ad3c098e840768
	.xword	0xf9a8a3464d1f4678
	.xword	0x0f27bf3655fb9840
	.xword	0xadfbb6f794437169
	.xword	0x0556ae069de2b41e
	.xword	0x7df819f391bfaf2d
	.xword	0x1f9053bf561415bb
	.xword	0x31a61d703404755c
	.xword	0xcda793ab874ec0ab
	.xword	0x33498fbc446c55de
	.xword	0x73dd7e2655e22905
	.xword	0x9da7c78b738bf9d4
	.xword	0x3292faff71efb663
	.xword	0x1de359a48dc35e49
	.xword	0x70c4cea4a022d907
	.xword	0x1f9a5ea7769d6503
	.xword	0x5a25379f705c9c69
	.xword	0xf837b324ab01740f
	.xword	0x61bb84b2f56a9e51
	.xword	0xc2bd7798801c2c84
	.xword	0x4df0a8b31589fa2f
	.xword	0xa052a9455df7d523
	.xword	0x2bd4400b0721727f
	.xword	0x3f4474ad5bb07f87
	.xword	0xd621c6e2230a6006
	.xword	0xeb2644e678bac2b7
	.xword	0xd0f13bb9f2b4f6a8
	.xword	0x3322b1457fc30ff3
	.xword	0x832771f644ed0b96
	.xword	0x163d947934f353ba
	.xword	0x5782618379bd173b
	.xword	0x551cb2c29df5fc51
	.xword	0xed77a625896698d4
	.xword	0x71b0967c53dd52d4
	.xword	0xbd2f1516f6fae93f



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
	.xword	0x904e2e32f9fd13c1
	.xword	0x3384c7a876b7d7ed
	.xword	0xb041417e310fda40
	.xword	0x354096c0e4e22668
	.xword	0xf79985ec4a3840e9
	.xword	0x81e674f935af68f7
	.xword	0xaa92d0862c1b256e
	.xword	0xd9143e7f918362e1
	.xword	0x50c53228e0a20087
	.xword	0xbcc57e34329e2606
	.xword	0xa019ca2d7e821e9f
	.xword	0x2484b27e788f5e6c
	.xword	0x118c7a7a8f22a0e4
	.xword	0x8123c6a9d58b705f
	.xword	0x35aeb0e4543c46ee
	.xword	0x627774a39a979f6c
	.xword	0xb1b1b194960c2a6f
	.xword	0x8cc8cd91766eb2ee
	.xword	0xd099483fe77a8155
	.xword	0x888d86a606e44bf9
	.xword	0x725c4285fdd8dc7b
	.xword	0x4663b534e5d87e52
	.xword	0xad6057b2eee193cb
	.xword	0xd0f90bce5006d7bd
	.xword	0xc336f1c05d2cf77d
	.xword	0xa7e8ac8d45d6eb48
	.xword	0xebbe25f00f418490
	.xword	0x0e304afc4db253bf
	.xword	0x21d2f85ed1b7cf39
	.xword	0x66b7066e1b80bcc4
	.xword	0x3dfef38c9082c196
	.xword	0x776544b77a00f384
	.xword	0x61bfee8706612f7e
	.xword	0x082bc45a19b11c99
	.xword	0x8fa90a6f3518dea8
	.xword	0x568751c6a998d5b7
	.xword	0xad94d1979d334007
	.xword	0x8c7d9bfb16172c48
	.xword	0x207031b54130a741
	.xword	0x80592347901c17df
	.xword	0x909c82e0e191e61e
	.xword	0x3867235e09dda94c
	.xword	0x1492714f31078428
	.xword	0xeb0aef24e4724f11
	.xword	0xc36698b79baeae6b
	.xword	0x86f3b9ee3f1d1b21
	.xword	0xcd51173627fe3d7c
	.xword	0x04cb6079c095dedf
	.xword	0x092ba120e9546ba5
	.xword	0x801fd4398db8c534
	.xword	0x7eca72289a9ddf08
	.xword	0x6ca87c45300260b9
	.xword	0x8778f9da26b0a0a3
	.xword	0x679d2bc9feda2a4f
	.xword	0x5ce3eca7e971ea92
	.xword	0xb49b387970ea9a16
	.xword	0xd5b3d40a717b1e6a
	.xword	0x383e4de3c9c27aa2
	.xword	0xade16785d392b0c5
	.xword	0xb53bae89a542c3e6
	.xword	0x006f50d0abbb2871
	.xword	0xad85048cd95f387c
	.xword	0xb0586717e67434c9
	.xword	0x87cb3add8f06a71c
	.xword	0x1b756c0ca5bcc21b
	.xword	0x74a774faf236e310
	.xword	0x4d1bb630ec1cb6bb
	.xword	0xbca205c3c51a692b
	.xword	0xf9328f53ef7422f0
	.xword	0x4a57b0501087cc5e
	.xword	0x7b26025db269168c
	.xword	0x8f1b42cee8adf3f5
	.xword	0x9cb3a862830502ce
	.xword	0xfd12fac0898b866e
	.xword	0x435813f3d02740ac
	.xword	0x1290e3f671717a45
	.xword	0x5784d65e0275ffd2
	.xword	0xac5f2ab9842f372c
	.xword	0xb9cc326724acd6f5
	.xword	0x8bbd1984fc332e30
	.xword	0xed4cf1eb1603189f
	.xword	0x2e4985dc80372a04
	.xword	0xe2a3d414d684d99b
	.xword	0x21a80fbf80fb16e1
	.xword	0x2bc8f13eb66e50fc
	.xword	0x578d06af2fdc57a5
	.xword	0xd63da819f2f1fa58
	.xword	0x29d920d3e0b9a5a9
	.xword	0xee2e0c1d9c41c4ba
	.xword	0x73a78fb3081039d0
	.xword	0x86997ee50feb2af6
	.xword	0x0274e461302be4c5
	.xword	0xce1c87256c64c562
	.xword	0x2917c96d8ad72382
	.xword	0xa9ef3653046bb5e8
	.xword	0x9e86af1971021de8
	.xword	0xf709e4d7d9f4dd2e
	.xword	0x02507e5e36d41a9b
	.xword	0x3e6d6fd4ef5a1f06
	.xword	0x8cfc3b3c8f1c8fad
	.xword	0xa1cfdc9d0763c47b
	.xword	0xf01088ace62bdfe3
	.xword	0xa97a08ce1f7f2536
	.xword	0x0b7dcc2b272c1ae9
	.xword	0xd08ee3d97afac51e
	.xword	0x6e334857e058ffc7
	.xword	0x67c1d7811d19a120
	.xword	0x8d90f0c6684c2038
	.xword	0xe03b90e58294fe64
	.xword	0x14f038a15d5a462d
	.xword	0x320ae66d2dacdb69
	.xword	0x9ae56a65551e857a
	.xword	0x704ae252501c7abb
	.xword	0x0737880e26c9dc47
	.xword	0xad044cedbd4b9b49
	.xword	0xf00b5f3f5a581b07
	.xword	0xac34a8bc69317463
	.xword	0x8c66bd1220f15740
	.xword	0x4bc243b0430e7201
	.xword	0x2b418d8374f1ef27
	.xword	0xedf62438d56eba59
	.xword	0x223cef154731bba6
	.xword	0x5a65f69f3fc0c176
	.xword	0xf67611550d3c0dfb
	.xword	0xe2932a1215ebfee1
	.xword	0x5da7c16c157b5d09
	.xword	0x61a6051bd0b412ce
	.xword	0xcfd9d53ef17568df
	.xword	0x636e52be9c87db9d
	.xword	0xae15f6c9b9067e6d
	.xword	0x8abf963801f77040
	.xword	0x47438e1f71b3a961
	.xword	0x0e096c5392ceac97
	.xword	0x87ab010941a547bf
	.xword	0x1586d7018687f39c
	.xword	0xa815f9f9851fb68b
	.xword	0xbc06e540a4a51f6c
	.xword	0x806c3a46047f98e9
	.xword	0x0576be670346f33c
	.xword	0x1fd5d9f3d6c27f7a
	.xword	0x6135c5345105aeef
	.xword	0x2f132e5577352ccf
	.xword	0x533918c5b0f5418d
	.xword	0x447529f22791709d
	.xword	0x8d4060bd8cd7b813
	.xword	0xbb9b3568b3b8c341
	.xword	0x271a08c72dddf9bb
	.xword	0xac6cab633c21c3bf
	.xword	0xe0d6adc1af1fc70c
	.xword	0x3718662deaa8ede0
	.xword	0x446f70c749d851b9
	.xword	0x6721d55faf7d8b7c
	.xword	0x1bd0dd3c8b62bbbc
	.xword	0x0939e7f5bec33a30
	.xword	0xda0adb56f0517273
	.xword	0xc920f3e0ecfefc1a
	.xword	0x3a37a7c27d52da0f
	.xword	0x2049a21ffe7032fe
	.xword	0x80c5bd900e7c2ad2
	.xword	0x12e22cbc373d9280
	.xword	0xc86c18417d3cc525
	.xword	0x0f26d344a2a97ba1
	.xword	0xac17f981b755039e
	.xword	0xfa6d425eaae96e23
	.xword	0x555b4dd3140ac707
	.xword	0xe1e7a5e39612d92e
	.xword	0x0853b0acd0417b3b
	.xword	0x0f2532a7ce6913d5
	.xword	0xf6a619438316f407
	.xword	0x25a534e193521767
	.xword	0x2015d61389798252
	.xword	0x4e41818decc00aab
	.xword	0x33d1ebf033d12801
	.xword	0xae640e6454edb484
	.xword	0x2bbfc9dc59c16a5a
	.xword	0xc4067b2f90112b1d
	.xword	0x1f9f8ca6b43fc561
	.xword	0xa42753261f3e23d4
	.xword	0x91e396d3b6f76d1e
	.xword	0x958e67a597c4603a
	.xword	0xc133c46abdb635fe
	.xword	0xd94ac791d86721e5
	.xword	0x8b64f6d92e191b39
	.xword	0x5bbb8f157cdc3ace
	.xword	0xf8fd7eee2a7cb229
	.xword	0x84b2678b03ffe745
	.xword	0x9e9bad040da765f9
	.xword	0x90888970c5fa239c
	.xword	0xc7a9cfec0417a467
	.xword	0xf1a734702692ab19
	.xword	0xce84d41add83152c
	.xword	0xf1dd5d4cc61a618a
	.xword	0x2bcbae5d2945d816
	.xword	0x556bae31c80981db
	.xword	0xb2c59565a7fcf919
	.xword	0xfeb94d24ee3a4c34
	.xword	0x11876e1b91db56e1
	.xword	0xe0f41dc099b448c7
	.xword	0x10d9be84c01dbadd
	.xword	0x6f2b689a409473a4
	.xword	0x583af7959dea8d1a
	.xword	0x4be76869ebf8cf75
	.xword	0x690ddb37379a5704
	.xword	0xb8be12bafb1bf973
	.xword	0x50c2d20fd83416a9
	.xword	0x80f5281e1da3ebb6
	.xword	0x82f84b43f7a504a4
	.xword	0xd715390f58d7f098
	.xword	0x4dbbce0f61ee887d
	.xword	0x48584ea6ae3fe011
	.xword	0x4ef08fcce5b3c6ec
	.xword	0x6733c803d0dbe337
	.xword	0xdeda985586f86979
	.xword	0xe42b94c681d954b8
	.xword	0x2fae5ce5be54c77f
	.xword	0xb8b7e77a031b131b
	.xword	0xe00b59439b52ec0b
	.xword	0x913bbd38158454ce
	.xword	0x64caf2f551931946
	.xword	0x610e519262389028
	.xword	0x37b6bd8f8e46985b
	.xword	0x0178a1fc13d69a63
	.xword	0x552a4bb55e998ae2
	.xword	0x3a77cdc7f2d06128
	.xword	0x5d8386eab18ec911
	.xword	0x6685a91616cb5b46
	.xword	0x46500aa60049acd7
	.xword	0xe4e9c731e53925a9
	.xword	0x53b8c8de48cfa90b
	.xword	0x27fe61f1451333b1
	.xword	0xbd4ba030a8d86dca
	.xword	0x9451a6cc68fb9e04
	.xword	0xd27cf6e72574b03f
	.xword	0xa9bde34f0cbcb86f
	.xword	0x72eb07c0a1efe64b
	.xword	0x0594cb70617eb41c
	.xword	0x16e843cc06cff1fc
	.xword	0xd3ec3b7f8b4d26e6
	.xword	0x6ad5b952b958a9e9
	.xword	0x9ad0c83acd8169f9
	.xword	0x0b021a77b70f5a1e
	.xword	0xda0177dcead3a5ee
	.xword	0x22baae7112f84637
	.xword	0x92dcf6a019cd7b47
	.xword	0x1527f559e541d1fc
	.xword	0x774131a680383d17
	.xword	0xf92eada57c3d6794
	.xword	0xe145e053aaef381c
	.xword	0xef98743a70051402
	.xword	0xbd007e2abd34451a
	.xword	0x5750517883b98f0f
	.xword	0x2092dc6796b74d6e
	.xword	0xe389fa1b264344fc
	.xword	0xe6400f4d1351521a
	.xword	0x4816b8f125488724
	.xword	0xa988f494ccfec222



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
	.xword	0x01373edbddc68974
	.xword	0x85bfa967a06f3e05
	.xword	0xfe71bca769e6ff08
	.xword	0xf3dc0b7c20a8bba1
	.xword	0xaf92cc7082a445cc
	.xword	0x643bf6fae6204085
	.xword	0xfb6874613565a386
	.xword	0x493e59681bea6c50
	.xword	0xa41eb27fb0d29148
	.xword	0x9f43bc5bf01b8dbb
	.xword	0x8e89e394b7a93fe3
	.xword	0xdc499b017c91f932
	.xword	0x38aa539490e42206
	.xword	0xc299bf4804533660
	.xword	0x183be1f7d09cc956
	.xword	0x5a1302c48708715b
	.xword	0x4a9a79578182b2d8
	.xword	0x43a2c6e21c930cbc
	.xword	0xec9c62cef8ff8868
	.xword	0x533c5eea92f6e710
	.xword	0x465fab2491e627b8
	.xword	0x86a9c020a64e3b58
	.xword	0x31f4314f6e14f45f
	.xword	0xa7d1a52ed91f9f4b
	.xword	0xce8cf20593fa8ae6
	.xword	0x520c038f558c0b32
	.xword	0xbb690607362a3228
	.xword	0x802e14393e03fbbb
	.xword	0x8a54ca0102bd0820
	.xword	0xd0669899f9f8373d
	.xword	0x5b89b5321293748a
	.xword	0xe4a47b7ec46ad6ac
	.xword	0x5cc8e49789b13dff
	.xword	0xf84bb92183116d79
	.xword	0x1f94d453599aa153
	.xword	0xdcb45e39355e0fcc
	.xword	0x1f182c4f8fafdfbb
	.xword	0x0ee27c9172b32619
	.xword	0xe05703f5c0b062e1
	.xword	0x62023c52c2d140ab
	.xword	0x1d37f9bd007ddc3f
	.xword	0x8c88dee28578abdd
	.xword	0x362b88cb9169125e
	.xword	0x56ed61e2d96c53cd
	.xword	0x22123d4594555fd3
	.xword	0xd241913578af1c16
	.xword	0x0fab208448369229
	.xword	0xd47350536ced86e2
	.xword	0xd23c306ffb24db72
	.xword	0x51fa021b20c6c677
	.xword	0xd68c8b778d28e025
	.xword	0x4d4b16d5dd7178e5
	.xword	0xb8dc8c9318fe154e
	.xword	0xedcb7c841dc5cf8e
	.xword	0x26f915bb55361a2c
	.xword	0xa215c90244d22c18
	.xword	0x233ce38c2011f8a7
	.xword	0xb34cec76ffbdabaf
	.xword	0x9153b091fbf63cbc
	.xword	0x1016b20140524cec
	.xword	0xd8278d75874a635d
	.xword	0x0078f1ab4ed5aad4
	.xword	0x7e2acae3598ad4bf
	.xword	0x0a7313f0e82dc5ac
	.xword	0x6b143e2397d74246
	.xword	0x96efac11801036b2
	.xword	0xe2eded057ccca1be
	.xword	0xea04701aaa0bc250
	.xword	0xa07376cd9adcec51
	.xword	0x36e6c5d45055cbc2
	.xword	0xfe89eedd6c5e7a77
	.xword	0x1672f9ca8f84c0d7
	.xword	0xd827659c77b9ca99
	.xword	0xfc64251c2bb3ca45
	.xword	0x6d1be5be4e5a0cfd
	.xword	0xcfd618a238c63c48
	.xword	0x5652632358010c16
	.xword	0xe54a78103f6a2396
	.xword	0x19485b891374e670
	.xword	0x1dc79ae57f5f951d
	.xword	0x3e5fe7f4ce0b5322
	.xword	0x38e9a8d98b7ca0ae
	.xword	0xbbe5e678df272d30
	.xword	0x07296c2adab43132
	.xword	0x1d919b37fc523da8
	.xword	0xf32d6ecd3e2a86cf
	.xword	0x2663652af313ad3f
	.xword	0x30a8305115c68097
	.xword	0x3bb2f8645438c79c
	.xword	0xd58da4a4dca1f7eb
	.xword	0xbff6366f13f47f2a
	.xword	0xd8eca774526e9baf
	.xword	0x08e856b717061c23
	.xword	0xc8cfb583b7fe9275
	.xword	0xaf2fea70c948743e
	.xword	0x16d653743ffe0ef5
	.xword	0x0d6a93b6fc1df702
	.xword	0xe29d935a568bcd8d
	.xword	0xe7ff069c746b0910
	.xword	0x47c4f818c5bb3d4a
	.xword	0x51b8b9c18ab6cbb0
	.xword	0x9f561fc500de49d6
	.xword	0x49efc86666266bd0
	.xword	0xe9949b50fa672c80
	.xword	0xc029c67bd04ee551
	.xword	0xf438f6ebecc2a95d
	.xword	0x6bee2d2423e1e25f
	.xword	0x5f834a72d61604eb
	.xword	0xe888559a7653f7e7
	.xword	0x0d711753821f057a
	.xword	0x56e5c58a8bc87164
	.xword	0xc8c1137bb42af5a1
	.xword	0x2e176e3bb68cabc8
	.xword	0x3ad8e03a4055f21d
	.xword	0x7cd3bfaf67e71e6f
	.xword	0xd2371ba8c6bd6fc2
	.xword	0x4c73b92c7e396a2a
	.xword	0x6e9111367d12db4d
	.xword	0x9d4d3b3aa2048b93
	.xword	0x89dbc668e25e946c
	.xword	0x85e6ee7ad275593c
	.xword	0xe92ed41866f78413
	.xword	0x9a6ade8428022206
	.xword	0x233eb8ad4601658e
	.xword	0x5e8313b708a2b273
	.xword	0x4457670af7d6b852
	.xword	0xf743b580bc627cbd
	.xword	0x83d8bbfabb07ceb4
	.xword	0x38c98efe2edb586a
	.xword	0x95d70bbd51c7c451
	.xword	0xea88943eae9e26a8
	.xword	0x9812db1236979c59
	.xword	0x10af8734c13251eb
	.xword	0xc059015bd5db7ec2
	.xword	0xe9e5df2007efa2a0
	.xword	0xa316f071160e6bf5
	.xword	0x088aeb67c15e5942
	.xword	0x6bb4844813038c90
	.xword	0x76eafca3461fad69
	.xword	0xd19c7a9ca4846875
	.xword	0xe403cdea6ac98c0d
	.xword	0x7a7fabb3982834c6
	.xword	0x6d2b76d9a61e23f3
	.xword	0x963240389c6517c3
	.xword	0x1d533ff2836880ca
	.xword	0xe36760e2c2b23f35
	.xword	0xcbd88c4fb6b6998d
	.xword	0xe4b5eab0c8d114d6
	.xword	0x27b92959852563e1
	.xword	0x1f160662299d3628
	.xword	0x352eb90b3adaa05f
	.xword	0x5b85cf07ad6b3d53
	.xword	0x8abc504a979a7ea0
	.xword	0x6759257a92682602
	.xword	0x8d8d5cca21f9c6f1
	.xword	0x707f8fd1294b8865
	.xword	0xc0b3b310a0e0ded9
	.xword	0x2f92d9f008aaf407
	.xword	0x532cf29ddd4ede35
	.xword	0x72549138367b8c06
	.xword	0x3978b05c0e8d1d9f
	.xword	0xd6f704b949ac6fec
	.xword	0xcd53f0828839ad53
	.xword	0x6455eeca29215d7e
	.xword	0x86326f543ff62ef4
	.xword	0x449d020faf34977d
	.xword	0xc772bf88e1884878
	.xword	0xb2e50447b2f3fb5a
	.xword	0xa4d5056dfac9e62c
	.xword	0x8b8dadaf414c6912
	.xword	0x62f08fecdbd5876f
	.xword	0x5e113bebb36024c4
	.xword	0x5f369a94073f05f8
	.xword	0x3e7387038c13cd4a
	.xword	0x5ad837d2c1bdfb7a
	.xword	0x62b8fc1fe1680b93
	.xword	0x0933e9b33cac8fc0
	.xword	0x3624fa8cb3d0e7b6
	.xword	0x62557bb8283497f5
	.xword	0x39810753699de0e7
	.xword	0xa9669f0cb8537e9d
	.xword	0xb2fa46f5eaee1b8d
	.xword	0x8b2e29058244bb83
	.xword	0x1d412763b4abc0f0
	.xword	0x08f321160d934dd1
	.xword	0x59e297d2671a26bd
	.xword	0xb1fbb58fbdc5bb17
	.xword	0x3e40ec7a4495b57e
	.xword	0xaa985536503b57a1
	.xword	0x7d8a9a3ddfee1c64
	.xword	0xb6b3b0ef2cc7b612
	.xword	0x111890953e5b0130
	.xword	0x6bb348ea5232ee93
	.xword	0x7fd96f1c0e485787
	.xword	0x918ae64f1e08a2a5
	.xword	0x6b999a09cfa98a67
	.xword	0xd2d67e096605a99c
	.xword	0xe139847060c497e3
	.xword	0xf113d130732c4de7
	.xword	0xa18d9d92d718eb2b
	.xword	0x0ebdb4240f400389
	.xword	0x9b6880ce7828f444
	.xword	0x19ffae4c7e8f5fa9
	.xword	0x35bcc7b203a99cb6
	.xword	0x6380270c953f5d3a
	.xword	0x63af5d7aa906dabf
	.xword	0x0ad1a8bf24c47c3d
	.xword	0xe489216d93892ef7
	.xword	0x4bc48ff8b220766a
	.xword	0x987e9717826c7fbf
	.xword	0xd6ae3a5259c3b0d9
	.xword	0x39eb0b7b9c51322e
	.xword	0x8edd8a2215137762
	.xword	0x97fa50b213b282d4
	.xword	0x845f7fd0723c863a
	.xword	0xed93e1e15412c405
	.xword	0x1c1884480a7f1b1f
	.xword	0x6fecd3403207229c
	.xword	0xfe437b7c31c8f5be
	.xword	0x03328d2ac91d20ac
	.xword	0x844d7556226b3826
	.xword	0x8c199f2691190320
	.xword	0x7d00e0bc3bc8ad97
	.xword	0xdf9aac419b22b115
	.xword	0xe88b47f1bc8f9301
	.xword	0x608b1e856963187d
	.xword	0xb2b7d7a08c6038b9
	.xword	0x5fb0f933f8683aab
	.xword	0x18e849bff08eb34e
	.xword	0x2fdf8cc7233e909a
	.xword	0x6b2615e721408dff
	.xword	0x7631d12c40291d87
	.xword	0x1f5f5067573025fb
	.xword	0x9c7b3469e4542b6d
	.xword	0x1f0dcacfd2ef2581
	.xword	0x2d17235b97af7515
	.xword	0x826dada25f735255
	.xword	0x4658b28405190fc9
	.xword	0x8408ba32a0129a93
	.xword	0x3d9f9637923bda9c
	.xword	0x6a5506c1f7f34415
	.xword	0x5c37a854f36ba92a
	.xword	0x60f0ba766d9403be
	.xword	0xa7e10d4e827b4c07
	.xword	0x7cbf1c7d6d9fd957
	.xword	0x573f61df1f245154
	.xword	0x9debf13e03045632
	.xword	0x3d96b6197e003098
	.xword	0xb702ef5501c94532
	.xword	0x7f8e4c0408debc46
	.xword	0xc4f4574b870ef184
	.xword	0xfe1e05b1ac551a95
	.xword	0x37f7445eeb7aee92
	.xword	0x1edb172a2bca8303
	.xword	0x26b3dd1de7bca291
	.xword	0x4f1ddae82ece89ae



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
	.xword	0xe96c61d72df03dd2
	.xword	0x4fd508e43c0cf43f
	.xword	0xab7fc66376b77f4b
	.xword	0x203eef027ea22cd9
	.xword	0x26e141945c7af99c
	.xword	0x251e6df46c7bda59
	.xword	0xd69ae8e2d1436d8b
	.xword	0x94c9345cf4647611
	.xword	0x29d883bff5e60147
	.xword	0x79ba094d02be4cec
	.xword	0x01606c7bc6a0b319
	.xword	0x427eb1577a4637d9
	.xword	0xb0a3bcab0625eb9f
	.xword	0x3eedbe51b6e4bc48
	.xword	0xd0cf31b6811ca3cf
	.xword	0x6304fbf97b827d45
	.xword	0x08ce1bd99f5057dd
	.xword	0x20079ee61d174636
	.xword	0x866573e840f22c68
	.xword	0x0031f0510cc60786
	.xword	0x8211dc613f997bae
	.xword	0x4dc898174e6fc290
	.xword	0xdd049201d9aaffc8
	.xword	0x973c5b1faeebbab5
	.xword	0x21cf6899f2e0695b
	.xword	0x002deaa41e0b3b07
	.xword	0x1502411ff2555d3a
	.xword	0x638b1a5626b89613
	.xword	0xe3b79be5c6924ed5
	.xword	0xe5a4182767b49621
	.xword	0x23978faf74c7ce11
	.xword	0x96c5c7da5d90a819
	.xword	0x8be31cd86ad35b13
	.xword	0xfe368b44a8012b2c
	.xword	0x7a68642c0d6b0a8e
	.xword	0xe8e03bbe22ff22ed
	.xword	0x69adc929aa72f915
	.xword	0x77b3bd7f0cf04681
	.xword	0x617c00229c0e7977
	.xword	0xf77e756094dd27bd
	.xword	0xb686a69aa8087e7e
	.xword	0x4fa3a5783446ab24
	.xword	0x2d1c9165d97ffaa6
	.xword	0x2ea11f613b28d14c
	.xword	0x288c7e4779a8a588
	.xword	0x2cdb15631a87abc9
	.xword	0x56c7dff616018a30
	.xword	0x9f04fe241ea5b093
	.xword	0x817ca7f995394f4e
	.xword	0x7399dda9ccf98d99
	.xword	0x808210bbf2c58a7b
	.xword	0x6f1d8bfc9533dcad
	.xword	0x87f857161464f159
	.xword	0xa15abe192b741039
	.xword	0xcca3f3b24237d3e2
	.xword	0x7ff07030cc409471
	.xword	0x5e6bd793bb75e45d
	.xword	0xc4e67d81423c091a
	.xword	0x71bae2331db23158
	.xword	0xa6189ede70bf0284
	.xword	0xd9651c38b4823fb7
	.xword	0x0959e235eb206d09
	.xword	0x859f651d64575295
	.xword	0x3a1e33ecbcb6b263
	.xword	0x37965186cd7399aa
	.xword	0xf9b55ac2ae80f67c
	.xword	0x54be17b3e010f7e8
	.xword	0x23bce98001e1a5fc
	.xword	0xb5a50615739bfb09
	.xword	0x421d1c8520a8d2ef
	.xword	0x515c63a3af5cc4dc
	.xword	0x42980dcfa1f02c8b
	.xword	0x33d6fbe9eb99b532
	.xword	0xf3add286cc718541
	.xword	0x3ec3d6acd72d2dae
	.xword	0xc2da398d1cd01cb8
	.xword	0xf227b15a0993a91c
	.xword	0x3064991d68ea8a9c
	.xword	0x0e11efb3825c45cd
	.xword	0xebef2d69290e2149
	.xword	0xe1593aa9f5ff4a3d
	.xword	0x69597fbacc26f011
	.xword	0x78538802fee1c58f
	.xword	0x61f1bdd15c1b5847
	.xword	0x30a6de9f7ea3ce62
	.xword	0xa05b8bc9afb7e9cd
	.xword	0xe2d86b4efdb3c9e2
	.xword	0x9fae03b39b578c8b
	.xword	0xce03ea52ba6e9803
	.xword	0x3c4a2108e89bddd0
	.xword	0x4d521c5bce7f6ffd
	.xword	0x8975ca9a63432710
	.xword	0xd5ec4cd5f6d01b9b
	.xword	0xdc05d25d78a78ef6
	.xword	0xc4b9c88d39df76ee
	.xword	0x81d95d672107dc2e
	.xword	0xde04997619f7c003
	.xword	0x7098fc6a37a715c8
	.xword	0x3e0ccba519f50276
	.xword	0x265c7c765390f061
	.xword	0x041c7e7dbcbbf983
	.xword	0x21f45b163f84c8bb
	.xword	0x94ef8326ace870dc
	.xword	0xf7b2ec5537b8b09f
	.xword	0x5f3463ab7acdaf5f
	.xword	0x4da1087ac13cbfce
	.xword	0x23af7a5f8fdc15a4
	.xword	0x96f3b89b95add147
	.xword	0xd2cbb07ea1106994
	.xword	0x0348c4d6398ef494
	.xword	0x0b563c8804fb6640
	.xword	0x31b71685f9a697e7
	.xword	0xae4f151a549fe2bd
	.xword	0x1eee54d415f2f24b
	.xword	0x068d2b5a38dbe650
	.xword	0xe5f69a1ad54754b5
	.xword	0x8591d5db015dd9ff
	.xword	0x793ec90917337568
	.xword	0xc05405873897967b
	.xword	0x34ceb8929eb6a88e
	.xword	0x420460317866933c
	.xword	0xe5c85b719accfa45
	.xword	0x6c5ee51e74783a33
	.xword	0x68457271f1e83502
	.xword	0x9157f7d5d85539b3
	.xword	0xca2d14ed7b05dae6
	.xword	0x18411c0fe7950094
	.xword	0x912987732caeb61a
	.xword	0x30444def7de87c1d
	.xword	0x4f9dc507e280c2fe
	.xword	0x3c4c2d59fd3a11a9
	.xword	0x9ec5a778bb16ffe3
	.xword	0x4aadaccf77142cfc
	.xword	0x3ef7e98290fdca81
	.xword	0x626ce983b92c6bf5
	.xword	0x2f47371de1ae31b3
	.xword	0x71ff9245ad0f17cf
	.xword	0x24da77915cee6b06
	.xword	0x5f2d5084a60d079d
	.xword	0xa4ab982e286a03cd
	.xword	0x418642b97e215022
	.xword	0x18710b95c8301938
	.xword	0xa66351ade1e4ad3e
	.xword	0x1e8317de2b49bc9a
	.xword	0xa44411de28a6512a
	.xword	0x18b1ae1e1f3e3afe
	.xword	0xdab685a18bce6363
	.xword	0x748b7b8538474a30
	.xword	0x67f9e54f1265f67e
	.xword	0x89e882f272df89ac
	.xword	0xc1c9c119e5f0ed98
	.xword	0xb493415e5f49242a
	.xword	0x199e9b2b1bd477b9
	.xword	0x9e7fdcb0da752fcb
	.xword	0x1644fa3cf3ab0f22
	.xword	0x14898176bd7cff8d
	.xword	0xcc6c923c88744c68
	.xword	0x728281721030b68d
	.xword	0xa6280c16a7209f8d
	.xword	0xece446094d90ce11
	.xword	0x38c3e0a41717e8f9
	.xword	0xa3a00bb3587cf528
	.xword	0x21521bb4088a9c15
	.xword	0x7d374bc8aa07ddd3
	.xword	0xd8264904a9c3a36b
	.xword	0xb4dbb426bd97f696
	.xword	0xb0dd02985746313f
	.xword	0xcc24758a209c9945
	.xword	0xb6b17a9ccccaf7f9
	.xword	0x463d4cf9a6f45a00
	.xword	0xb79447a9410aa2fc
	.xword	0x3623d1148bc4ec34
	.xword	0x710528e5e4545d7b
	.xword	0x72b5df9f29eee853
	.xword	0x14f6f06877eacb02
	.xword	0x9e0d08445fc59096
	.xword	0xb7ff979fd5312547
	.xword	0x390e85d99675350c
	.xword	0xb307f3d851e6e8a9
	.xword	0x975c3404d478457b
	.xword	0x9a00c328b78bb9b7
	.xword	0x9bbd08a994895050
	.xword	0x5e83205544b545e9
	.xword	0xedc98c26843950ab
	.xword	0x8f5ae70c47db2376
	.xword	0xb72044e4f684f16e
	.xword	0x8b4d915d59ea61dd
	.xword	0xf27a817076fc428b
	.xword	0x5c0c64f57a0362e3
	.xword	0x60220265d03e32ce
	.xword	0x1515be0b45c11135
	.xword	0x82f378e7c2732efb
	.xword	0x79609304b9c583f1
	.xword	0x090686da8bb133e5
	.xword	0x4adafaf30d7484aa
	.xword	0x8a0b72bf0b6bf7ce
	.xword	0xf0a95b70c09538ba
	.xword	0x5cbbcc174cd53411
	.xword	0xe6d4f5e1b1c722f1
	.xword	0xe9f0ef582fdb04bc
	.xword	0x521b9c0ce473ad1d
	.xword	0x05f597482e29c683
	.xword	0x5c34f5188b042f8e
	.xword	0x5cdcec1ffab8cc85
	.xword	0xd9e5763c8db68ff4
	.xword	0xc139ec4f2b504f39
	.xword	0x16da5769335ded17
	.xword	0x1717152b7c3ee404
	.xword	0xad5546f71814451b
	.xword	0xbbed7fe7af912a8b
	.xword	0x3a88b58a72c7ae64
	.xword	0x4881e2dc40bca0d7
	.xword	0x0c7d12b61740f39f
	.xword	0xddbb2159d8de8201
	.xword	0xd537c5436ee17a2f
	.xword	0x6a5c0a987ad5e73b
	.xword	0xb033145641ef9b48
	.xword	0xb62e1575d6c6a1a2
	.xword	0x42eff93501b0ea93
	.xword	0xded93a78fdbb64ec
	.xword	0x2d02653da36250fd
	.xword	0x59f8d8055e7a486e
	.xword	0x8f2f52fd156263e9
	.xword	0x44e6b30f790fae77
	.xword	0x366d9aa68459b2ea
	.xword	0x2fb20d0234958f86
	.xword	0x79577abf0481123a
	.xword	0x3d2a01cd6d5cc7c5
	.xword	0xd16c5282759c1736
	.xword	0xd123be20db6b0c81
	.xword	0x7a1ec1a743eb5123
	.xword	0x64e6094a772ddd48
	.xword	0x31aa7b89a8d2564b
	.xword	0xcfc02dda832dd799
	.xword	0xc0340427e5ae8cb2
	.xword	0xa4f55d3c4c3170d8
	.xword	0x89b9d9fab694ec4e
	.xword	0x31b9ed66658b584a
	.xword	0x90653d451ad9fd93
	.xword	0x1db945b1c2b20070
	.xword	0xa8881087d26f3d19
	.xword	0x92106cfa35c57d2f
	.xword	0xfead0f3602cf9bb1
	.xword	0x9ff96f3e0b1b77b5
	.xword	0x09746b94a72f45bb
	.xword	0x72434a2e75bc7156
	.xword	0x0ed3c85e65c088c8
	.xword	0x41c55d29ada14f40
	.xword	0x93c3c4b1f9b3a658
	.xword	0xb0895beb839cd573
	.xword	0xa48cdcb0b4bbc57c
	.xword	0xc4a58249b3443aa5
	.xword	0x09419ef23cd84bdf
	.xword	0x45c25c94499fb7fe
	.xword	0x2b28595af4ed1324
	.xword	0xd7fc9fba6c9052f5



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
	.xword	0xb8d298a2af49c4c2
	.xword	0x7ba3b2cebc921791
	.xword	0xad741615349cce7f
	.xword	0x4565c4fbea494dd6
	.xword	0xe194dfa5ed4595e4
	.xword	0x01985fe71542b02a
	.xword	0x0258fceeee2c374d
	.xword	0xb10512378ed8803c
	.xword	0x5052d263f38fe4c3
	.xword	0x6679714e838d012c
	.xword	0x0a9538ed4f023d4f
	.xword	0xab1a6e237937ea03
	.xword	0xc21a3bb338417a45
	.xword	0x7f150b51ac44d6fe
	.xword	0xe6304fd798532176
	.xword	0x84ae2b70b30d44c2
	.xword	0x8eb47c298339c266
	.xword	0x1dfd66b6ecabdc9f
	.xword	0xa0b38a1f0e1aee7e
	.xword	0x4dddefb473b95fd0
	.xword	0xb048a12b01e59763
	.xword	0x84c7694af5b34b86
	.xword	0x1cb4b360a961a740
	.xword	0x530afb855ef14e0c
	.xword	0x14dc6ba404b76e3c
	.xword	0xdec04a5897dbeb4a
	.xword	0xa1190486ed44f280
	.xword	0x6b589fbd529af62f
	.xword	0xd9b9120bec708439
	.xword	0x3170d098c49b1301
	.xword	0x32b2da1f7b72970e
	.xword	0x18b4a071188b10ed
	.xword	0xe1217cb776f0f438
	.xword	0x3156a1cbebea6aaa
	.xword	0xeb25fad0022c103d
	.xword	0x745b5ec3bc964ba7
	.xword	0x81ec338af400da75
	.xword	0x2c9668c9497029af
	.xword	0xca7559909ea37a5c
	.xword	0xb621c3541c0a7ceb
	.xword	0xd36bb70874101899
	.xword	0x6bd35483f01b4059
	.xword	0x29b04eec61c006c6
	.xword	0xf8e42e13a0c256d3
	.xword	0xc6c5c5f6408dd8e5
	.xword	0x9adf3004d154043c
	.xword	0x449014f5fd1916d3
	.xword	0x4439445bdfae55bb
	.xword	0x6ba7c879916d2c12
	.xword	0xc511f930e05c4ed2
	.xword	0xbc8a0d1c27b6c2b1
	.xword	0x55d98f9acebc0cba
	.xword	0x5c3ad2f894af1233
	.xword	0xbd89f8e28e266021
	.xword	0x708ce9c4756edb76
	.xword	0xfef0eddbe84efb89
	.xword	0x14d368489ba2fe60
	.xword	0xc3295a63ea949ec5
	.xword	0xe77854167c43c093
	.xword	0xfe6b39a845e01302
	.xword	0x2c816c1c27d79ac7
	.xword	0x65c43af848cef1a3
	.xword	0xa0b993256a0c8c5c
	.xword	0xbf2b8f6a528d4776
	.xword	0x601170b1cbfa20de
	.xword	0x67dc9cda4cb48641
	.xword	0x047518c27a2ef3f2
	.xword	0xa4c9f9f8f576a793
	.xword	0xdaa66e4c34cb7429
	.xword	0xb4bbb4eaf9a85a1d
	.xword	0xc2dee962448081a3
	.xword	0x78082729d6eff199
	.xword	0x697da85c757f2c3c
	.xword	0x76dec3ca61b3b793
	.xword	0xad01dfa357dd0ce2
	.xword	0x2784e2fb43781524
	.xword	0x0bb6b820b21051e6
	.xword	0xfb2d6381d6a6112c
	.xword	0xe0628dd7db2af241
	.xword	0x267580750ef1b701
	.xword	0x8845c0e615886f00
	.xword	0xb291be468fec4ff2
	.xword	0xcf3e40812906e022
	.xword	0x08f13326a32ec0e7
	.xword	0x82943253855026f3
	.xword	0xe68cb3f4eb47c6bf
	.xword	0xaaeb4f784b49cd62
	.xword	0xb2862d67f7d93f38
	.xword	0xdb9b7cc02873f800
	.xword	0xf3a2b9a3bd63d1ac
	.xword	0xb235336242480133
	.xword	0x547f59b19b3ccb7a
	.xword	0x279de3603d952f70
	.xword	0xaeee37a80b4f3368
	.xword	0x353a0d04b630c0b7
	.xword	0xd84d8d05bbbabb76
	.xword	0x49b07573b0426c09
	.xword	0x33e496624b3d6a72
	.xword	0x5956538b1e747f15
	.xword	0x6c4843516af5de9b
	.xword	0x1bb47b4c2ba5c074
	.xword	0x61e6994e3ba93e83
	.xword	0xd28f553a8ea84c4a
	.xword	0x7fa458d8fc810929
	.xword	0xb95d862395790888
	.xword	0xc621a626ffef1671
	.xword	0x7656395d26c179a2
	.xword	0x37af97d7ccc1ff94
	.xword	0x38d1e466958e3627
	.xword	0xb14f96868e6c1bbc
	.xword	0x038073782eef97bf
	.xword	0xc25ec5a96145aef1
	.xword	0x0cbe53ce6ccecaea
	.xword	0xe9ed341bcdba772e
	.xword	0x576840cc6b312dd7
	.xword	0xc6807140cdfe3be8
	.xword	0xd1bc4428d275c3b2
	.xword	0x95390c0a1e2f2aa1
	.xword	0x0c8b2ae4e46b093f
	.xword	0x6a5425eb7e3b94bb
	.xword	0xcdceb3c7d3c2e682
	.xword	0x269904964546a03f
	.xword	0xb86e36b6d210d2cb
	.xword	0x9fd90f4c80c15bb8
	.xword	0x5ea8eff6372f16b2
	.xword	0x4d895b0b5ad8269c
	.xword	0x8ea29d12045b77ed
	.xword	0xb60f323710c5a3a4
	.xword	0x3ac654a6383f8111
	.xword	0x7f56890d2d346521
	.xword	0x354da75f9f49f109
	.xword	0x4ab35a1301e0e44e
	.xword	0x41cba3bd4e478392
	.xword	0xb9331522aeddc077
	.xword	0xde157ce83cd8d9f7
	.xword	0xe848313b3ce785ab
	.xword	0xce92caf462cec888
	.xword	0x5515f01863429040
	.xword	0x46e55d00621b884a
	.xword	0x8bdc61fc1ecbc2b6
	.xword	0x3dab916f0072231e
	.xword	0xf3e23d0347a5070e
	.xword	0x7c22fd73a0f7eb21
	.xword	0x44bf8d5dcc06b477
	.xword	0x18cac3c1e037440f
	.xword	0xbea8c2ca30d78bed
	.xword	0xd9fee46c7d3027a2
	.xword	0xb13d054425b7030a
	.xword	0xcd209aa1522145af
	.xword	0x7a6ee0dfcc21cd80
	.xword	0x27d3545e7884f766
	.xword	0x5bbcaf8932e69713
	.xword	0x8f4e8db6d24df81c
	.xword	0xa018c67570e6eb7e
	.xword	0x7a6cc625dbb4cc2e
	.xword	0x3aafaf3972906f69
	.xword	0xd1d94a82213b450b
	.xword	0x6abcc9f3b10d4e63
	.xword	0x167a7a3e3a169b5d
	.xword	0x1a20db12baa2ff27
	.xword	0x72cea6bfe8498c9b
	.xword	0xe7dd56d51866989d
	.xword	0x007c7a25d3f06ed5
	.xword	0x0d12d18034672fd9
	.xword	0x6192d0f9cfaeacbf
	.xword	0x5b2318324c5968d1
	.xword	0x4e5b402dabcd100d
	.xword	0xe4f8fcd067e064ab
	.xword	0xb5a4f849226c29aa
	.xword	0x597f8fd451637703
	.xword	0xb393aee7b73c741f
	.xword	0x1c243ae6814bd0b1
	.xword	0x1166aa9634f2505d
	.xword	0xf10a3a74309af37f
	.xword	0x0c3405edb2c59217
	.xword	0x90543f6a6d75f4cc
	.xword	0x767f4d168070c54b
	.xword	0xafbfe73c4e5c625b
	.xword	0x032d4607d7fef56e
	.xword	0xd262ce558711e2a4
	.xword	0x3fe16dfd38198ebc
	.xword	0x9e1934aeda72b6b1
	.xword	0xf7e595545d814fe9
	.xword	0xe4ba0d5fcdfcd88e
	.xword	0x3c06895dfd1b9e82
	.xword	0x24fabe3f75baa1de
	.xword	0x7cb6ee2f5b5e113c
	.xword	0xf1b365231c46b4fc
	.xword	0xf635120ef49ccdb1
	.xword	0x68becf060f81c8b0
	.xword	0xbe4690c39c684d2b
	.xword	0x7b4a49eb92b1a1b6
	.xword	0xa4aef09e5dfc4326
	.xword	0x1f5b8476ab87745a
	.xword	0xd28149d53d0af006
	.xword	0x889acef4c5061683
	.xword	0x097627a19e0a9b46
	.xword	0x519a526b4154b77d
	.xword	0xb837729a76b117b1
	.xword	0x27a50cde54437c32
	.xword	0xb2ad12aaf8e85f4c
	.xword	0x1979440a484315f6
	.xword	0x24075f300bfb5798
	.xword	0x4d7a0ac667cab113
	.xword	0xb30f115d3b435988
	.xword	0x4d8904757eb0d583
	.xword	0x8666b7743554dbf3
	.xword	0xa86e62ea768ecce0
	.xword	0x3bcc8d1d361cc086
	.xword	0x4e6a3863f832bf1e
	.xword	0x4c2bc13f833fe6e7
	.xword	0x3acb2dd4ea769820
	.xword	0x02b3a214698009d4
	.xword	0x120c73eaae5a7bfb
	.xword	0x142caa1ccfa809a4
	.xword	0x282b17c09e5a10de
	.xword	0x6c039abe404b1643
	.xword	0x25c11b18763946fd
	.xword	0xc56178ca6f261d83
	.xword	0xb60d5eb64974d4a9
	.xword	0x770a59d1fc6f01d8
	.xword	0x4cf2a7f56155d20e
	.xword	0xb213d824db72d4ed
	.xword	0xd04b3a72456d4fe2
	.xword	0x214df69ad66ad90e
	.xword	0x7451392c9680e4fc
	.xword	0x29387fbda76f2b78
	.xword	0x441b0c979ae95b29
	.xword	0x2884ad48c5776306
	.xword	0xa61c7f6d623d778e
	.xword	0x8fb243f0accf5403
	.xword	0x3f433d674ec9963d
	.xword	0xdd50717478e7f4d2
	.xword	0x82e7ee68229e462f
	.xword	0xaa0c34b510429644
	.xword	0xb16bde8421dc6c35
	.xword	0xf355b4fd33e1d1d7
	.xword	0x632bd89706ecc2b5
	.xword	0x4f31ed311beb063c
	.xword	0x6316989d94617e8d
	.xword	0x17790b61569b3502
	.xword	0x8e94f946a7577439
	.xword	0x63b49578b69fb00b
	.xword	0x620d5ae2d7468e15
	.xword	0xcbfcda7c6eb20ae8
	.xword	0xf03a52d0873f8a8b
	.xword	0xf6501f3df520802e
	.xword	0x07c7e2ee30b1b08a
	.xword	0x7ca8d126df57e781
	.xword	0x395084785a5ab0a7
	.xword	0x19d799b8a6d03cb0
	.xword	0x931a689a8849252e
	.xword	0x4c2fb4b95839e5c6
	.xword	0x16452ef0668cc014
	.xword	0x10737e9795846e2c
	.xword	0xda91f28a008f99e3



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
	.xword	0xb240fa46d3818ced
	.xword	0xeffbda0266ebad7e
	.xword	0xb6befa65ea87d026
	.xword	0xed085d941d4933d3
	.xword	0xf7a4c1481c46a861
	.xword	0xe0bfc60d0de0a3eb
	.xword	0x7182c6981cc4873a
	.xword	0xdf7f528da45e055b
	.xword	0x5d2b6c240034c8b6
	.xword	0xae7f33ddfdc1877f
	.xword	0xae53bfdf85293ded
	.xword	0x390f7d08df55abce
	.xword	0x4c166c9d58a40548
	.xword	0xb66db2150bae33f1
	.xword	0xe1ae0939c37483c8
	.xword	0xb8a4db435c4e32fc
	.xword	0xb861c3857626404a
	.xword	0xa8b3e3b3153fcf4a
	.xword	0x3b5cc8c668f4aa43
	.xword	0x900316008ac85e4b
	.xword	0xbd41981ca6d9757d
	.xword	0x7a0170581d3f2eab
	.xword	0x1d241f5d3eee9bc6
	.xword	0x8768b9e51a3d2494
	.xword	0xd48beec9b1610de8
	.xword	0x2987b9590b73da08
	.xword	0x36aeb0366323c881
	.xword	0xbc0beeacb818ace9
	.xword	0x42fb6f0c67618812
	.xword	0x53e998dbd015d261
	.xword	0x7b4436d29a618d4e
	.xword	0x0208fded182b06d1
	.xword	0x719e6672a056041d
	.xword	0x7968deb66d7b510c
	.xword	0xbce0af9a6aa9204b
	.xword	0x8a970865b3c3d2e6
	.xword	0xe10640df6eef634f
	.xword	0x30573b48bf52cd6e
	.xword	0xae377790cb5709c9
	.xword	0x171e47c4b7794f2e
	.xword	0x784bb023cec75e08
	.xword	0xbde0c509d747de97
	.xword	0x105e4b58e5c48665
	.xword	0x9387bac4ba5a8842
	.xword	0xeabba1045718c900
	.xword	0xc75d05ec2d308657
	.xword	0x9f4420f53ab20b39
	.xword	0x43ba5acaef620922
	.xword	0xa6afc487f6dba531
	.xword	0x15f0fb7decebb1fe
	.xword	0xd9e7bd870919a2b0
	.xword	0x703a9666720b6581
	.xword	0xfdcdc5b9a2ca83d3
	.xword	0x7e87968d4369b29f
	.xword	0x09244dbba6933cce
	.xword	0x8028efc7d87737c3
	.xword	0x5a66e973dc9d2a02
	.xword	0xbbfb48e2b8d4577b
	.xword	0xd024bd15bcbd8b74
	.xword	0x52a721515fd8ad04
	.xword	0x8d75a4f2c4215bd5
	.xword	0xc2c2555db0684be0
	.xword	0x2eb6b47a877375a9
	.xword	0x0dfe5f11e96e1e8f
	.xword	0x2522223b8cf237c9
	.xword	0x2e31b91139612ac9
	.xword	0x9c72494e718ad541
	.xword	0x09a3f4c628e9bb66
	.xword	0xa52d59243cfb425d
	.xword	0x6c43918ab39001d4
	.xword	0x2fa773b9128b819e
	.xword	0x8d490607134455d4
	.xword	0xf430a3bb1cdfae41
	.xword	0xcf83362179856744
	.xword	0x93fb69ef3f46711f
	.xword	0xdb8ee64b49f47a75
	.xword	0x5109ea746d544147
	.xword	0x423fa31509f72739
	.xword	0xfbbccf80689207e4
	.xword	0xe9531ef90ab83944
	.xword	0x8231bb331691794e
	.xword	0xb9ba67808d1f3b1f
	.xword	0x619e915d881dac44
	.xword	0x6920f01378237b79
	.xword	0xa52608d63797581d
	.xword	0xc120b276cedccb51
	.xword	0x2568ac28b09fd967
	.xword	0x2d23a73c7b00a427
	.xword	0xf7e58f4615f72e79
	.xword	0xfad75b9b95d315c0
	.xword	0x401bb90b16b266b5
	.xword	0xb4d67917301c05be
	.xword	0x41edc4db93a64973
	.xword	0x75bd673a0a0f2fe5
	.xword	0x831540538c8d45fe
	.xword	0x2bcbc82c0e45df07
	.xword	0x650faa8bc6ed6a5a
	.xword	0xda1cdb63f100faf1
	.xword	0xd01ca61814ccddfa
	.xword	0x79a54eec63515273
	.xword	0x72002921720647a5
	.xword	0x0442ada599723ac2
	.xword	0x680f50cffc9a6d8e
	.xword	0x5f4238024d4966d3
	.xword	0x37f277ed39f6b34d
	.xword	0x0cc3bb3093821c6d
	.xword	0x69793f4ea897a638
	.xword	0xa41618cb5f8de5a3
	.xword	0x42ba433e076f0d16
	.xword	0xc02a419844759928
	.xword	0x26388dcc846c5bcb
	.xword	0x4054b9cf4e9b7ab8
	.xword	0xc1b4315c502b82f8
	.xword	0x4a74eea8259770b9
	.xword	0xfdb48e1f5078b4c4
	.xword	0x40bd8bb00f8768ae
	.xword	0x5129cc122e7eb671
	.xword	0xf0bceb23fd1278de
	.xword	0x93c45be29b5bdb19
	.xword	0x68c87784dc9b1e3d
	.xword	0xb91f6cb9d399b1af
	.xword	0x17a8a437ea0ff17f
	.xword	0xfa65c3cac8f7c439
	.xword	0x7755bc4e33aa93f6
	.xword	0xa44ec277caa00c76
	.xword	0x30464fa535aa7553
	.xword	0xe1e590bc84f731ba
	.xword	0xfc87a07ade5b13cb
	.xword	0x6b72612805f37027
	.xword	0x8f9e401592f69d72
	.xword	0x1f1b1d69b48f09ba
	.xword	0xbb583742ceb07bd1
	.xword	0x177a84450ab8420a
	.xword	0x01e089f82218b2ce
	.xword	0x48de95723c5bcab6
	.xword	0xa8387cdfb1a825d3
	.xword	0xdaee920bc5638c7b
	.xword	0x989d9aa561082271
	.xword	0x9c301625d5a4b872
	.xword	0x631735e2a6cee3be
	.xword	0x5e140cebe79f7970
	.xword	0x14a55298a9239816
	.xword	0x2d360fcc46ac75fb
	.xword	0x5264bf5bc0d6a7ed
	.xword	0x7854c0f305c04ed8
	.xword	0x15ca0954d77ac12f
	.xword	0xb9a10a4ed3057344
	.xword	0xd19f23c2e95afa42
	.xword	0x5ae0a3a516dbee79
	.xword	0x30fbc2939390d91e
	.xword	0x2829d9c0f9a7e484
	.xword	0xae7e683493fcf0db
	.xword	0xe37181185effb1fc
	.xword	0xf50e955d2339d47f
	.xword	0x6616988981a1a7fe
	.xword	0xee17a8fbcfb77437
	.xword	0x7339f4f216a2f73a
	.xword	0x312b9a839152d5c5
	.xword	0x906c2d5fc6c2e631
	.xword	0xb350494b580208b9
	.xword	0x81ac36daaced113e
	.xword	0xd88780324d1e1417
	.xword	0x6fe874e3597f32cc
	.xword	0x76f295b8435c732d
	.xword	0x55ffc3edf8b8d3b1
	.xword	0x842604820cbe1908
	.xword	0x9859bf50a68b484a
	.xword	0x5e4ae05d9d22ec3d
	.xword	0x5164e3975e9e4f10
	.xword	0x83736d9739b19c4b
	.xword	0xc1d31eff7aad0b6e
	.xword	0x766d39ffb86e1ddf
	.xword	0x2193d894de9fa97f
	.xword	0x150e4cb1ef249e3b
	.xword	0xe7eda971a5b66def
	.xword	0x10d7e22cee4b02cf
	.xword	0x1b9fd0d73ce9b701
	.xword	0x5f6d58e5bec641b0
	.xword	0x521ac26d6a24d0d7
	.xword	0xf3aa7e7f41483d15
	.xword	0x4ca3b3bcbdeb82a9
	.xword	0x25583bfbf295d6e9
	.xword	0x841086a73ba12f8f
	.xword	0xffcedfa7dc7c426d
	.xword	0x0ffcd3e1c9be1140
	.xword	0x502755255871c14a
	.xword	0x019db8889f7f3fcc
	.xword	0x51e784f3ccee20e8
	.xword	0x414ddc3f2b37bfbf
	.xword	0xa2f31aea0782bcc4
	.xword	0x96f1317a689f60e0
	.xword	0x340b2e648bd253c9
	.xword	0xfd22deb0b50e184d
	.xword	0xbb460f2de17a8c4f
	.xword	0x32166dbf4bac3ee6
	.xword	0x9de19f4850c7964f
	.xword	0x4f03bad0bea0ef13
	.xword	0xff8eea11263ac9d4
	.xword	0x913eca5933fd570c
	.xword	0xb992717a12922396
	.xword	0x639593a0f78428ac
	.xword	0x182c71cd9d56e5da
	.xword	0x0b75749b9bfd5f7e
	.xword	0xc9a377d0e9151e0f
	.xword	0x472777306d815de5
	.xword	0x9f8319ab9dbd7909
	.xword	0x18a1d460d411a126
	.xword	0xddebbdf782c88fc8
	.xword	0x18cc82cec2a2e2c2
	.xword	0x9ca183f0afa569d2
	.xword	0xc25e0b31aec20aad
	.xword	0xfb22855b231ba837
	.xword	0x3faa2d282bc5734b
	.xword	0x8726ecc845c6383c
	.xword	0xe3fed790e76017a6
	.xword	0x44fad1f1bbf66b7a
	.xword	0x11a360da3e169297
	.xword	0xd65a4b85614a6590
	.xword	0xd2c73f3405ad03b9
	.xword	0x8bb6e661627282ec
	.xword	0x5ad5460a00abf14c
	.xword	0x6754139eccb076df
	.xword	0x67d4af76fc693718
	.xword	0x030ee72cc6f0a512
	.xword	0xafc8e36044bbaefa
	.xword	0xe9a9d9c0983bc637
	.xword	0xdf3ff8ed2f94598f
	.xword	0x4bb033fc8d774079
	.xword	0x1e8d2866c195671d
	.xword	0x00a90d96326c3516
	.xword	0x37271f68e52529a9
	.xword	0xc03f3ff5e00bf03f
	.xword	0x0ace91ce036f5f04
	.xword	0xa80af4207e268f89
	.xword	0xcd3664ee2de32fa6
	.xword	0x5251a1c6cd3da05d
	.xword	0x6d7203a53a797c0a
	.xword	0x56b60e941a3dcdfa
	.xword	0x1e0b4d49d8d93726
	.xword	0xa3f043192f15e0de
	.xword	0x9d7dfdb2cf1adec4
	.xword	0x1aa329654fcd4416
	.xword	0xaabd20bbf8456ed5
	.xword	0xc681ac82c3499610
	.xword	0x347f04bfea0b2c53
	.xword	0x73f7d8f2fc9f8dd3
	.xword	0x64508cb9fb6f059e
	.xword	0x9d15d4be271baddd
	.xword	0x5e3f1157d27b90ca
	.xword	0xc3c1a292fb6f161e
	.xword	0x68e04f2620f8d9bd
	.xword	0xa5a4655fd8d15f52
	.xword	0x6e98a7e9c9b2f5e6
	.xword	0xcaf0b3eea8df8314
	.xword	0x149931b893ba3124
	.xword	0x3b0fe333239328b2



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
	.xword	0x5dd77a5d394daf58
	.xword	0xbbb5783536b58884
	.xword	0x6e04e3680a9585ae
	.xword	0x807bb30033270141
	.xword	0x37eaee87a2f1ff38
	.xword	0x153890318c212b26
	.xword	0x94fcfa20e69f1ed7
	.xword	0x5c3f60fb2e3dd50f
	.xword	0xca83b848f311fb6f
	.xword	0xbae96a5283429a18
	.xword	0x67e3595a0490f5b1
	.xword	0x552d405a81d9b0eb
	.xword	0xbcb57ecd333ced4a
	.xword	0x9f4ae7d7abb360e9
	.xword	0xd297c2b1ad3d05da
	.xword	0xcf6194e0639c3ad6
	.xword	0x8e2db97d0385b5d6
	.xword	0x67a1eadfede5ca2c
	.xword	0x5f765fe21c4934f8
	.xword	0xa17fd29a3747e721
	.xword	0xb303db44d68ed87b
	.xword	0x904ed040bf495c39
	.xword	0x44d8ac83c93e1721
	.xword	0x08ced3c611430c48
	.xword	0xb8308f72b809c3d5
	.xword	0x4a9e8e6c9b67c939
	.xword	0x223aac145b26358e
	.xword	0xdadee8834b3c2d41
	.xword	0xbf0cacded3bb3068
	.xword	0xf4b6d604dcc002d3
	.xword	0x6b80c660be2b7878
	.xword	0xf08ba146f5615c96
	.xword	0xd4019d9d04851096
	.xword	0x89e6726291b8ba4e
	.xword	0xa59761f30c20c1db
	.xword	0xce46f2aa866c643c
	.xword	0x65714ec9c8b0f26b
	.xword	0x8d48bbbc70ed9c5c
	.xword	0xc55934a295e903e8
	.xword	0x467a6bbd298fc242
	.xword	0x7416bab69ecbd683
	.xword	0xd0a9e855f8bd71ff
	.xword	0xc6ff4e7203a2d6d8
	.xword	0x664250996d4aaf00
	.xword	0xa2860b5c34ccb552
	.xword	0xd0f36441128b74fe
	.xword	0x75867dc29cc6c2b1
	.xword	0xefc39b5644183178
	.xword	0xa166f7ca42350685
	.xword	0x39e19579779ccfb3
	.xword	0x25cf3af6b071a0b5
	.xword	0x194e3d17ee412279
	.xword	0x144a2c87f060d586
	.xword	0x2fb86be576322ceb
	.xword	0x5bfed0bf5e0fd44a
	.xword	0xcaeeed1b5aa99f33
	.xword	0x1f57e796d82167e8
	.xword	0xed7c4f5e0dd6a42a
	.xword	0x9139ef20ad53781a
	.xword	0xb039da883544c741
	.xword	0xdad8d9c81a18f710
	.xword	0x0d0b4ecf07dc69c5
	.xword	0x28b4e196a862f4fa
	.xword	0x022fdad52a9248ea
	.xword	0x65b26028e75cc333
	.xword	0xcb439dafe34f2e9b
	.xword	0x7ea1a6ee918a7057
	.xword	0x4d7193a810609286
	.xword	0xa872beb207e5d99b
	.xword	0x409d1eacb6eb622f
	.xword	0x99d10eb8793215d7
	.xword	0xc5c4eb626e0ea16d
	.xword	0x8afee5aa2dfe6968
	.xword	0x2a4cc8514398022e
	.xword	0x4d1203ce3741569f
	.xword	0x7a5b481d0ad9092a
	.xword	0x63dcd67f1326d4a0
	.xword	0xfebc5bd4694da513
	.xword	0x2d446b04212875d5
	.xword	0x03f072a537661d70
	.xword	0x579d7c19fa1d211e
	.xword	0x8543ecb1400a4abe
	.xword	0x3cfd4596bc1e071f
	.xword	0xd5a9654cce027c7d
	.xword	0x21740547bbb8faf4
	.xword	0xce9ada42613276c4
	.xword	0x660585858e9e0f1a
	.xword	0xc98a0e56c993ca2d
	.xword	0x03ac56a3590f4b91
	.xword	0xe3779d0947853f93
	.xword	0x9acd3a7bcc70c42b
	.xword	0xc9790d3f4d8bc653
	.xword	0xffd3151b062cb154
	.xword	0xdb687b9ec1b74bbc
	.xword	0x8fbef4ded9fbbcbb
	.xword	0xa93964acf6917bc2
	.xword	0x31b485b56c18f713
	.xword	0xc33d6e91a3ff12b7
	.xword	0x4263318fd5d9b00f
	.xword	0x42ca367b29297653
	.xword	0x62b8a084c84f9f59
	.xword	0xf545e44e6a7486b8
	.xword	0xed0d2ff3a4daa024
	.xword	0xe2343adcf0e39a0c
	.xword	0xc32a1fb752e254cf
	.xword	0xab26bf5321d290ff
	.xword	0xcd32093542d1647e
	.xword	0xf21af36e98139a95
	.xword	0xe176c3b4ad6a8668
	.xword	0x2e2f76677b4a029c
	.xword	0xbab2a67f45fa254d
	.xword	0x537b506ab9cf0fde
	.xword	0x723426822d242ed3
	.xword	0x3fcccb6ebcd7badd
	.xword	0x9394a7ebfc62b941
	.xword	0xae821502ff0eedb5
	.xword	0xcfd67376c6af172c
	.xword	0x111a3aeb0c833281
	.xword	0xf80c7559536702ad
	.xword	0xf6fe3cd270887d55
	.xword	0xb3c5bb856580bf4f
	.xword	0x1d034c000d175eee
	.xword	0x85dd635c99f4386a
	.xword	0x4e86843225c38415
	.xword	0xe0968024b0734eb7
	.xword	0xfe3f8a148bfe3936
	.xword	0x2f5cf6645bfb374d
	.xword	0xfb19b01558290d80
	.xword	0x08ff42586b8786b5
	.xword	0x207364b6044f8905
	.xword	0x9c5479ab1508c353
	.xword	0xf54660c09884573b
	.xword	0x6b460e1eada31d29
	.xword	0x64aa48bcce3afa6f
	.xword	0x1566fc56582139ba
	.xword	0x66e61c244b85dd80
	.xword	0xa0f0318e74bb8e64
	.xword	0xbed730b6094d8418
	.xword	0xc3c0a0635ba971d8
	.xword	0xfdc02c3d6ee43dd1
	.xword	0xe8b9271a2a167cc9
	.xword	0x197967ea03febe1f
	.xword	0x8616d06ae6c9988e
	.xword	0x6b691416516f5fc6
	.xword	0xa00b8a284d9fbda4
	.xword	0xd53c31d17c28d4d2
	.xword	0xc9fe98d6e59b24e3
	.xword	0xa219b9e404876bdc
	.xword	0xedd2956f0f94e820
	.xword	0xc10eb4f7f2bca2fa
	.xword	0x54e3695c1be9558c
	.xword	0xb44fb2ea44083c47
	.xword	0x139135e1a1370526
	.xword	0xb37f5a9200ebdfba
	.xword	0x645014d1e76ac06a
	.xword	0x4962a9c98a522d66
	.xword	0x26a8e65a4588c3ed
	.xword	0x8431293b8b0f3e39
	.xword	0x0dc22186a135bc2e
	.xword	0x4eded3bfdd9b8773
	.xword	0x6f1c5bb9d64d3891
	.xword	0x88eb1cf778120512
	.xword	0x2d8889fd42f5f4e8
	.xword	0xff0c16b22f83566f
	.xword	0xf6a5a145c322914e
	.xword	0x9b7833c4171216fe
	.xword	0x666cd2daa815becd
	.xword	0x765c9bb82c0f25e4
	.xword	0xd5fb67730187bd9e
	.xword	0xe7b72af0e37dc7fe
	.xword	0x6766c1d81d7cfa4a
	.xword	0xf64f29cf1e8af9d6
	.xword	0x665990b034c8d15f
	.xword	0x1fdbf72bc8540876
	.xword	0x37b79f717ab2ce05
	.xword	0x4aa2fc2f2c65a5b0
	.xword	0x9815a1ad4ddf9024
	.xword	0xe1b7cabffd212342
	.xword	0xebac70d8b497963f
	.xword	0xffad3fb107377064
	.xword	0x80f26f373cea8d8f
	.xword	0x8a920cbca6e1b00f
	.xword	0x0727a73f47a28b98
	.xword	0x69d16af9e6aed688
	.xword	0x48cdb30121a0b628
	.xword	0xb13e45b499448f97
	.xword	0xc8b7612b594022e4
	.xword	0x36f734ed25197786
	.xword	0x810d1a183b08552d
	.xword	0xdcabc8c8e13a492c
	.xword	0xb264a9d80d7a2f71
	.xword	0x9836f30e154b2a0a
	.xword	0x69c3c400ace6acdf
	.xword	0x5e321eb354ba27c1
	.xword	0xa091d67d9b9d20ae
	.xword	0xb52cc16c3b4e7e3c
	.xword	0x223fab05ce4130d0
	.xword	0xf781f9dc603a1ba0
	.xword	0x184d48fffa594043
	.xword	0xcae2576820c92e37
	.xword	0xd1bdc6d1eec3fe4b
	.xword	0x3a305a0d060cbe53
	.xword	0x6027f537b23be87e
	.xword	0x9bc9b285ae87a718
	.xword	0x230ce79140f876f5
	.xword	0xa041531de4fa882d
	.xword	0x96134c486cb8c6e1
	.xword	0xfd9486c3646e23b4
	.xword	0x6198b83bb90ac36a
	.xword	0x4900d36cd6d3e569
	.xword	0xc595971d04ca186d
	.xword	0x61f373a7025f5049
	.xword	0xdb0cdd1ef41c9ca5
	.xword	0x48eba3628059a2ec
	.xword	0x4fca2241281ed389
	.xword	0x5759201db1718fb4
	.xword	0x37bbeede30811e24
	.xword	0xfa7da264aa7986a6
	.xword	0xa89059803bf3abf9
	.xword	0xb4cfdb471595297a
	.xword	0x204eb0d1e46936e7
	.xword	0xd7a2ad463c0a8b6d
	.xword	0xfb61cdae91bc28fb
	.xword	0xed66e5ae5a846fbe
	.xword	0x90fcd702ba1cf00d
	.xword	0xf6f29bc665c2bb9f
	.xword	0x439bf9dcdce1d210
	.xword	0x78cd7faf7b626944
	.xword	0xd271235ec0e91bff
	.xword	0xc9319752ee7d064a
	.xword	0x773ee17ed5d7042e
	.xword	0x1d43c406ada974b4
	.xword	0xcd29bce7c9934eb3
	.xword	0xc61f837d9be012a6
	.xword	0x4cb74776273c3ba8
	.xword	0xd33100ddd51dcbeb
	.xword	0x0d1316320b89282c
	.xword	0xc5f931f30950f51b
	.xword	0x0fc6f3e5bfb9610d
	.xword	0xbd1950114d5e4689
	.xword	0x99d47f40afd113a3
	.xword	0x43e1ed090c59086d
	.xword	0x3aead46a24a02951
	.xword	0xfc2af67309f92221
	.xword	0x51f1d86aaa1536ee
	.xword	0x3e481d0ab3de5f01
	.xword	0xfeb2a26b078787aa
	.xword	0xd5bcabac559b7816
	.xword	0x13b53078e4e489c8
	.xword	0x3713c4ceb1586667
	.xword	0x77024386c7dcfacb
	.xword	0x2b4f25dc0ca53a70
	.xword	0xacb9e93dd7e6d064
	.xword	0x556cabf01e9b7f52
	.xword	0xc4f793b7211b873d
	.xword	0x537d4c4850f694f2



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
	.xword	0x943081ac14257417
	.xword	0xd04773096edf0785
	.xword	0x8c96d660b1c7fcb3
	.xword	0xc8f28ca563056f6b
	.xword	0x94b31a8e1881ca90
	.xword	0xd2c3a308ed888457
	.xword	0xe8fdd59f0acc1d25
	.xword	0xb39e148cf9d10498
	.xword	0xb69c8fa822c495d2
	.xword	0x477a049f88102af8
	.xword	0x6bc073fd883a8e0a
	.xword	0x52e0bbdb657dd6ea
	.xword	0xd16144782330a190
	.xword	0xc3576cf2f5694481
	.xword	0xb6a0d4365d7b959b
	.xword	0xf1262b22f8d1f37c
	.xword	0x0de436292fc547a3
	.xword	0x7e60e0d93dc325f0
	.xword	0x0294ed78a39d3121
	.xword	0x90e391403ae20c92
	.xword	0xfa2b351a27013c9e
	.xword	0x20a7e27e9995b67b
	.xword	0xf5b78cf5c8d2c67d
	.xword	0x4aa4a7525ef9c68a
	.xword	0x4f2c3a9e24372c4b
	.xword	0xd2da75ba91165b52
	.xword	0x75078d00380f873c
	.xword	0x255b777b2eb156e2
	.xword	0xff747b427619d3ad
	.xword	0xdd5dbbdc10e8f932
	.xword	0x8c91013dcf88d667
	.xword	0x2b8f31c9ec5d91b3
	.xword	0xf40d43488a1a8836
	.xword	0x6c2f91b663d080dc
	.xword	0xa51fb31a9180c589
	.xword	0xa7f664b46b3872f0
	.xword	0xc1bcdf79830d3743
	.xword	0x751299762036c2f7
	.xword	0x3ea941952c5d5f18
	.xword	0x09a04fa6d0603553
	.xword	0x8ba63c4fd4eed496
	.xword	0x0b8203781006319d
	.xword	0x0e9bbca3b95ff223
	.xword	0xca3c0a28375a52dc
	.xword	0xb24141d0bfb0d21b
	.xword	0x3ad478a1275dcb12
	.xword	0x630f489436f5b62e
	.xword	0x0dbc65d6e72a28f2
	.xword	0xca2b42159fc52d5d
	.xword	0x295594c0fd6711d7
	.xword	0xb2f6d8d07f82b175
	.xword	0xa3c72f6e9497cb18
	.xword	0xcdc6cb398fe110de
	.xword	0x3a92a551f9180cb4
	.xword	0xd8b5760582f37d44
	.xword	0x867623c28982d3ae
	.xword	0xc56d2b1a48e73ddc
	.xword	0xad1d516c5f4e5b99
	.xword	0x4de8f248eb174584
	.xword	0xd5d311f80bb3ede7
	.xword	0xdeeccf2d258b98f1
	.xword	0xa82a328ef4113a41
	.xword	0x4abb0692d382fbc1
	.xword	0x6847b39098622bd4
	.xword	0x32f3d7e9967b0dd9
	.xword	0x71e39ce4428b49ae
	.xword	0x20dc60d829e049fe
	.xword	0x55f19285b4a9a149
	.xword	0x62e451a919f2026f
	.xword	0x143ed8d2021a181d
	.xword	0x7010c576d7d81e29
	.xword	0x1f3f871d173ede76
	.xword	0x09c7aab1f96cc159
	.xword	0x100292c3784c8326
	.xword	0x0c6a2225d22582e4
	.xword	0x5bf584c744c4f4e2
	.xword	0xf5a2c88a1b134f48
	.xword	0xd7e77b7f5f1a743d
	.xword	0x16435d7776e8b100
	.xword	0x7e73546e918d72ca
	.xword	0x902c9cdbac6e32f6
	.xword	0x4246f63efc0f7dee
	.xword	0xcc9180ee3228a8ac
	.xword	0x0e7531a6cce25773
	.xword	0x5e6fd97abf66a0c7
	.xword	0xfed60571a6fd1abd
	.xword	0x9c2959ebd233bc26
	.xword	0x135c5ade86cf9bf9
	.xword	0xc48b0c3912496fe2
	.xword	0xd77695b84ea8f08c
	.xword	0x4d9b4896dc41c415
	.xword	0x1885aee7d4880852
	.xword	0xeaebbd45e2b7186a
	.xword	0x1903b34007d5e3ae
	.xword	0x7c90c2a3f54639ee
	.xword	0x2cbe19bb19486ef2
	.xword	0x0c95f92ce13c53a2
	.xword	0x365a706effc5416f
	.xword	0x82536f4927b95ce9
	.xword	0x60368cf8efb980ff
	.xword	0xd6813e1523a814a2
	.xword	0x7f1650759efa5ab9
	.xword	0xb9811b19c23d2c07
	.xword	0xae7a65af7a91ae99
	.xword	0x68caa7c17f283e14
	.xword	0x09f1025766e2c90e
	.xword	0xe762337b285dc410
	.xword	0x3aaf4782166d5dca
	.xword	0x2ddb2fe95d3f42cb
	.xword	0x31edcf77dead52cb
	.xword	0xf5aa1830286e1174
	.xword	0x5c16f007e3b7f128
	.xword	0xec622c0d3e595c19
	.xword	0x087252fd92391863
	.xword	0x3b424d4fc48cc24f
	.xword	0x504d5d9fb7544886
	.xword	0x6db5ee30f73384f3
	.xword	0x70fe3a651bdcb2a6
	.xword	0x48a9534dfad88ad7
	.xword	0x0d7adca0f70f200f
	.xword	0xe2bd63df51d223e6
	.xword	0x54f8dccde431df01
	.xword	0x5a65f9b3f06a9441
	.xword	0xb43703dbeb6e6daa
	.xword	0xdb900a8221041592
	.xword	0x17e240ac31e1f0ad
	.xword	0x3be070520dc68140
	.xword	0x9427ac0e7561b3e9
	.xword	0x164072de3faa8d21
	.xword	0x60c625e7ed7ff337
	.xword	0x40471e89b4de552c
	.xword	0x3f6f2235013cca7a
	.xword	0x3d060310674f9539
	.xword	0x607adac10e22fe49
	.xword	0x0cc24cce12be697e
	.xword	0x58790b679df34924
	.xword	0x470a7091d4d6eabc
	.xword	0x1f5d54834f7364eb
	.xword	0x456ad1f09ccb8f84
	.xword	0xd150c51cd5b69cc3
	.xword	0x7c4f6e05db3a44a4
	.xword	0xb1fce558912c1c00
	.xword	0x76f72b50d2161b1f
	.xword	0xb210a8842aa92013
	.xword	0x8dff49e05cb6e28b
	.xword	0x9dd9980add9f8bd5
	.xword	0xa964da65115fba1f
	.xword	0x9896e055d9044584
	.xword	0x681173bd04a33276
	.xword	0xa7c755e049ef4577
	.xword	0x298cbca833c4d24d
	.xword	0x24683b3e0cf322a2
	.xword	0x4b103ee5fd53bf38
	.xword	0xc0badad762abb639
	.xword	0x5710e1e786c587ce
	.xword	0xa6a7044ebe41d783
	.xword	0xff003d50af068643
	.xword	0xe499348703d8f9ab
	.xword	0xea1d57c6af508f3e
	.xword	0x34902a12b53affce
	.xword	0x6dc4f38ca270b90d
	.xword	0xf18e1c1771e192fc
	.xword	0x0b2a89bf84b9ed1b
	.xword	0x2ae793a0f0e05dba
	.xword	0x7a8bd114fe7b2974
	.xword	0x5b6d5514cac8edc1
	.xword	0x85efb7c623242f04
	.xword	0x68e782c418143cd3
	.xword	0xcef671dec60a794f
	.xword	0x6af6f20cdb64ebe2
	.xword	0xba30c3c4b5beebd4
	.xword	0xdcae0700518a9767
	.xword	0xdf66db242ff57f98
	.xword	0xcb8a4f2eb3eb401d
	.xword	0x50e95ba5aea164a5
	.xword	0x81fe8184e65ea32a
	.xword	0x17b346921969acab
	.xword	0x617477793357891d
	.xword	0x0dec3d4c3f48983f
	.xword	0xce7a473808c4e64d
	.xword	0xc9c89feb3079656d
	.xword	0xbd83119c76e9cdfd
	.xword	0xa4f6d72a554d17a9
	.xword	0xbae1c42f5f2cab16
	.xword	0xb41ca19ff45e0e11
	.xword	0x140efc67fd9175d3
	.xword	0xbb3cf25a286c305b
	.xword	0x755d5ae17898d052
	.xword	0x132f6c6b24c4e6c1
	.xword	0x8035154b24234367
	.xword	0xd7becadda3f6a7ac
	.xword	0x316dbf9f1fb61d63
	.xword	0x426fb11de390c280
	.xword	0xa6cb8452c51441a8
	.xword	0x6643ae3bcb8c651c
	.xword	0xca07748735af51de
	.xword	0x40c7f84d2dfed8fa
	.xword	0x1e7e61b509017f90
	.xword	0x8700859ae71ab6c7
	.xword	0xe143da4cb1be4f8a
	.xword	0xa2403332452649cf
	.xword	0xd2073f3793e5d7c4
	.xword	0x9654f7058ccd310b
	.xword	0x055f84abc146c28f
	.xword	0x9e6b622ec738ccc9
	.xword	0x7d03b1ee92fca92b
	.xword	0xe99c5a87fd86557b
	.xword	0x1fb18ed4ae51925e
	.xword	0xff44fe4ba624075b
	.xword	0x854d7d01f26addf2
	.xword	0xc79eac19ed0e2fb9
	.xword	0x6f7654d1d9f8b259
	.xword	0xf581cec6e0d5cbb8
	.xword	0xe5e9a66b6b8c1cd2
	.xword	0x61f36297d13f137c
	.xword	0x4c3cb3869a502bb2
	.xword	0xe245b1164bb9ad49
	.xword	0x32cc413dc09df5e2
	.xword	0xd7d8196dcebec24b
	.xword	0xd321111069be6516
	.xword	0x3d187c4da1bb32d1
	.xword	0x648f4591009b560f
	.xword	0xa9543f56ac35162c
	.xword	0x4ad459c1985601f3
	.xword	0xbeb03544496469d9
	.xword	0x23854a1a1711e51f
	.xword	0x6e19d0c43d93f252
	.xword	0xf61c32468921b6f8
	.xword	0x7ac6a0bdd0742333
	.xword	0xc518c3e2c1bb932a
	.xword	0xf6ffec240113df97
	.xword	0x183b01cae7849b71
	.xword	0x1f7d8f6b8634e638
	.xword	0xc4c05dba0718d5d8
	.xword	0xcaead93b237b4b96
	.xword	0x0fd0d9e77d42ff1a
	.xword	0x58cfa27a2ffcf544
	.xword	0xa75fd3ed513e263f
	.xword	0xda1504cd3d849524
	.xword	0xc9ea569a2d5a3449
	.xword	0x58707b142142e45b
	.xword	0x807a691bc380fb14
	.xword	0x296bd20db5adbd0b
	.xword	0xde571280d3e10a3d
	.xword	0x6e26c3aa155498cf
	.xword	0x777f25abf46a76be
	.xword	0x06f431eab5918fec
	.xword	0x855370f148833989
	.xword	0xc7b7bbf43d12725c
	.xword	0xde868fe23dbef253
	.xword	0x386e5bc495d8d07a
	.xword	0x6517b4cb8948b1fc
	.xword	0xc8c339d3165e7e34
	.xword	0xbd0202c8bbbda165
	.xword	0x541bb2f79380703a
	.xword	0x25256eaffa1c481d



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
	.xword	0x3803563606c69c23
	.xword	0xeea7755c7c8b9011
	.xword	0xdc8750fd1730ad5d
	.xword	0x58baba94ff6c0d72
	.xword	0x10299565a96c470f
	.xword	0xebc3ce7da1fef760
	.xword	0xb41480f9b37dbbde
	.xword	0x80f384efe6684502
	.xword	0xf921e7835438c5ef
	.xword	0x3e986533783cc388
	.xword	0x8aa62254dc0ed459
	.xword	0x9119ef2a4c06bae1
	.xword	0xd3245ffcc91d5593
	.xword	0xc42e59d3773a196a
	.xword	0x6161dae7d299f539
	.xword	0x112ec825d998c2de
	.xword	0x1bf509ed481a930a
	.xword	0x79118fe2c7cb8663
	.xword	0xf6ed9329ed395ac8
	.xword	0xbe4af5f3c9f9061e
	.xword	0xfc1d60f2b8380290
	.xword	0x058e4d48cbe4310a
	.xword	0x74c5a2e92ecdfc5c
	.xword	0xb8d0bb89d22427da
	.xword	0xe2eac41bf89134aa
	.xword	0xc020dfeee2133716
	.xword	0x86964c1f3d27f283
	.xword	0xeddd68476ea470cc
	.xword	0x93b5455cec358c6a
	.xword	0x5b697f053ed8689e
	.xword	0xde302c0543016ca1
	.xword	0x22a2f6a104c53542
	.xword	0x59fce1237d6ed729
	.xword	0x3f950f0de386297e
	.xword	0x617faa125365fe2b
	.xword	0x24b3fb9f28ef3356
	.xword	0x0ed23966df00beac
	.xword	0x9665e029a6b539ad
	.xword	0xe09c0f31b682d0d8
	.xword	0x0a7c0dde22e137e2
	.xword	0xf77b5ccbe914f2b6
	.xword	0xcc1972cbd489d9f8
	.xword	0xed366371cb1ec507
	.xword	0x858211a3d5041f34
	.xword	0x5a43fb1daef25d32
	.xword	0x49fc91e2ae58e452
	.xword	0xd20155dfc840b098
	.xword	0xac2cd5652147a22d
	.xword	0x8369c51b6ec436d1
	.xword	0xd284ef616885e405
	.xword	0xedd67fa6a2af7396
	.xword	0xbb74b7aa42dba7e1
	.xword	0x2f9b59f8192fe0f7
	.xword	0x8fbc6efb148076de
	.xword	0x82b21df9f9e662cc
	.xword	0xb93468067bea7cf9
	.xword	0x7a052f33f90f26a8
	.xword	0x80d83f78fc7f8109
	.xword	0x58b89b59523ea2d2
	.xword	0xfbc9dc86ec1088e6
	.xword	0x93edf7bc05035909
	.xword	0xc50a0f8660c833dc
	.xword	0x105e70c4b015ddd5
	.xword	0x80e905f503609f8c
	.xword	0xb4bdd742eb34b201
	.xword	0x96e2ac6ee7954f31
	.xword	0x7975ddfd2aa9f8f3
	.xword	0xdd3de80f1853f929
	.xword	0x7c31ccaf3e6ea952
	.xword	0xbf72e825f0383c4a
	.xword	0x709d51dc4a201d8a
	.xword	0xe0c88726176d2086
	.xword	0xbb567d1bd9bc2e78
	.xword	0xa806af05fe8f0b0d
	.xword	0x64b89552eebd1468
	.xword	0xe73982c973484185
	.xword	0xf9f66181c11bbd6c
	.xword	0x5adea825dd992994
	.xword	0x73407afe23d9d594
	.xword	0x14512f8d05985c9f
	.xword	0xfa06980d6359eb8a
	.xword	0x8d02127cb4de6282
	.xword	0x2664b351cb891f7d
	.xword	0x1a1cf2eaacd4ef31
	.xword	0x34f8a3dd87e16dfd
	.xword	0x3b1ef153548b8cbe
	.xword	0xe58c46a85d3d56b3
	.xword	0xf83d34ecdae099ae
	.xword	0xa8e049e6126eff3a
	.xword	0x2e5ff985b2cf2399
	.xword	0xdacef60bdfd9b4fe
	.xword	0x00c753623a529430
	.xword	0xf652c89b07296761
	.xword	0x0eee2ceea186c459
	.xword	0xdfc20503fc4f2117
	.xword	0x31bac34a30e7177f
	.xword	0x23ee82ea68d4a70f
	.xword	0x6ec12763eb3d1168
	.xword	0xdf42c804422f02b7
	.xword	0x668e33cfcd3795a1
	.xword	0x127d751fea18eca0
	.xword	0x4dbe82f21b949d51
	.xword	0x88a70416ca2cc6c9
	.xword	0x98154f446298a7de
	.xword	0xa0bb409dc481e5b5
	.xword	0x7ca56dd179639f75
	.xword	0x287778d930f7419b
	.xword	0x8cb8b71ba5fc79d5
	.xword	0xa45ecb11213c614e
	.xword	0x27ba2447a00853e5
	.xword	0x7133655c24b4ac67
	.xword	0x71dd72a402b9b088
	.xword	0xb5e06ebf90051963
	.xword	0x45ef8a146010fa37
	.xword	0x0af94d2d0ae2ac03
	.xword	0x124d61890e8be6e9
	.xword	0x1ca4fd87cb56c2dd
	.xword	0x37c4ade9b063c3cb
	.xword	0x2aabae08df2a503e
	.xword	0x3848d5ef50d9de77
	.xword	0xc58154483878d1fc
	.xword	0x6990cda06bdba966
	.xword	0xfe567a641877e833
	.xword	0xb1be9343890ee10c
	.xword	0xde7de5f83adbc42e
	.xword	0xd8d2a0e208d4f0bc
	.xword	0x33eb5996f543025c
	.xword	0xbefefc814e15c50b
	.xword	0x1e4a9cd937b12f75
	.xword	0xea413d9caa2882d7
	.xword	0x78a073634ace3626
	.xword	0xb8f2ecb00eba8891
	.xword	0xb4c4df0478377dfc
	.xword	0xe26a766b45b0c60c
	.xword	0x7ebd662f1fc53029
	.xword	0xfeec2179b453b6bf
	.xword	0xcb136d5b777ca6cb
	.xword	0xffbf9e31cd0334d6
	.xword	0xabd536b16e3c8ce3
	.xword	0xa1c64e3472b8f583
	.xword	0x4f620159a5962b57
	.xword	0x1860925a0598f45d
	.xword	0xf9b5e7a5cb7684b2
	.xword	0xc317597ba76cec64
	.xword	0x8a249cab3460d202
	.xword	0x293ace126ee71b26
	.xword	0x7c70d69390a856de
	.xword	0xba482eeeb8ba40dc
	.xword	0x799bc5b738dc9498
	.xword	0x2f9f4f7f05b6c4a4
	.xword	0xc2f4b038a1d5e28a
	.xword	0xbdf5b0d437687653
	.xword	0x8077fce7dad978f5
	.xword	0x2bed2a142c18b3bd
	.xword	0xe84a46e81108bc99
	.xword	0x017416f8dac2a48f
	.xword	0x5d9c2f6455211dcc
	.xword	0x61f934c2bb6b3bdb
	.xword	0x7dd5c4535b94be92
	.xword	0x726aa6de8e5e4e96
	.xword	0x059fe3dae8598184
	.xword	0x6ad42d3d3c42608c
	.xword	0xef59e75e0dd88f64
	.xword	0xc831ab9db8f4232d
	.xword	0x9fe2eb8c3c41e0bd
	.xword	0x5ea170446c0d1277
	.xword	0xcfdf19aecbb77d92
	.xword	0xbd2a35be2d11cf54
	.xword	0x896bc7797eaf770b
	.xword	0x55fbb7a75b904035
	.xword	0xd70b5aca6da2e338
	.xword	0x8bd7078c8fcad8e5
	.xword	0xf81d09719e41d4d1
	.xword	0x84b8a7635317858b
	.xword	0x98ee76f76cf3b80e
	.xword	0x537d9686cb477227
	.xword	0x666b4e3e9f3fe912
	.xword	0x84b680d8f285cc8d
	.xword	0xaaa0c532b3a5cf85
	.xword	0x7b04f59ca6c535ab
	.xword	0x982a664a0d72f76b
	.xword	0xaaff5c477d7a56a5
	.xword	0xf837a35110b026c9
	.xword	0x71ddf8641a1cb6ed
	.xword	0x92c00d767b8b27e8
	.xword	0x2f55ffffe5c609dc
	.xword	0xc89bdb952e58e5d1
	.xword	0x74c86dd948002ea6
	.xword	0x2c36f7fc712f7739
	.xword	0xadfb05c86eb430d5
	.xword	0xa6ab0c70d55107cb
	.xword	0x2c35aa23c63b6026
	.xword	0xc77bab74468da44c
	.xword	0xa8337431bfe112e5
	.xword	0xde85e5d3e24fa46b
	.xword	0xe814b6b3b21bea98
	.xword	0xae416b5ca167d3ee
	.xword	0xbe389ccb24d6bf17
	.xword	0xd74ac4f5b7bc9b9d
	.xword	0x4b514eff49fe606a
	.xword	0x2e4dda1cdf0b1372
	.xword	0xbfb5c31dd2628d26
	.xword	0x3695ceb9645fe78b
	.xword	0xdb67597434b1d90b
	.xword	0x7ae052010fbcc3a3
	.xword	0x14d7ea82ecbd75b1
	.xword	0x5fcfb80f2f004d4b
	.xword	0x3db1c86bc0fde0e1
	.xword	0x123af942b3417f56
	.xword	0x124f0c13fa380044
	.xword	0x8f600000d48d01f4
	.xword	0xd4151aaa42444216
	.xword	0x34cea836c02ba3c4
	.xword	0x81ea69816b48ed40
	.xword	0xd47c8f142d84b865
	.xword	0xbea4a25f1b6e8a74
	.xword	0xb7bf2dc94f94bf7d
	.xword	0x90f56f506aeb6fdb
	.xword	0x4126223c1656bf64
	.xword	0x053b8437ec56e6fd
	.xword	0x986df0a89b89d7b8
	.xword	0xbd832a4eeccb1190
	.xword	0x43454bda8d0b9b94
	.xword	0xac6beec4b741818f
	.xword	0xfcd5e5af13f495cd
	.xword	0x4b7bcc3738127561
	.xword	0x3d946f672948ead4
	.xword	0x5aa980a71ca091ef
	.xword	0xdfca974ca5a6b01e
	.xword	0x4fcbe26f4f1a2e29
	.xword	0xa5894c8cd08bbffc
	.xword	0x6a134b145f8bbee1
	.xword	0x016d7d090ab76ef6
	.xword	0x72683fe9af4cedf5
	.xword	0xa6c37d9f5ed5ae17
	.xword	0xa38b5d3e1d08ffe9
	.xword	0x285ac9dada1010e9
	.xword	0x1cb1e01a98f849a8
	.xword	0x9cf8875445f5c010
	.xword	0x0bef6639edc1bac9
	.xword	0x3e44334dea2ea537
	.xword	0x198a8d6ba8629e51
	.xword	0x994e486a60665af8
	.xword	0x55a1e049f43a1be3
	.xword	0xc025460fbd8e4534
	.xword	0x09698873df6ab913
	.xword	0x8f81684c7be410a0
	.xword	0x6a6e2be595acaa89
	.xword	0xd91a0d1f542db9d2
	.xword	0xd0cdccafe3f53a2c
	.xword	0x0432fb58824b9d7d
	.xword	0x5863ff37d0e94272
	.xword	0x8f104528a91ca828
	.xword	0x6e7cdad54bfbc2e7
	.xword	0xc3f09411f4c34744
	.xword	0x9676642b2ee5de05



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
	.xword	0x3e93836a7cf5e619
	.xword	0x648c495599445308
	.xword	0x05386a6814f327c6
	.xword	0xdf7d4aadb6a9ba17
	.xword	0x81e919a48e30cb56
	.xword	0x96d5a98a27d9f53a
	.xword	0xe7b407412a92bcfe
	.xword	0x1ac9e4a90815ac62
	.xword	0x29a7260ef235e26b
	.xword	0xc68fd707b34594ab
	.xword	0x974c9a5220c62573
	.xword	0x0537a6d5ce906fb4
	.xword	0x0bdc13790c91154c
	.xword	0x4834ea821cdcb6a8
	.xword	0xd38ea0fae114dc2a
	.xword	0xdc5a8258b235048d
	.xword	0x7492001ce13012f4
	.xword	0x10362e442eff91c8
	.xword	0xdad4dc6307ddc281
	.xword	0xe57009fb2bcb4839
	.xword	0x1d057af323b3c126
	.xword	0xa7e4f571d2cc1653
	.xword	0xf0b060562fffd056
	.xword	0x7f98557ced6f9f7c
	.xword	0xbecba12616646988
	.xword	0xc211da477e1e0873
	.xword	0x4fd863c0edc21848
	.xword	0xdaf2d5bbdf02f16d
	.xword	0xc8d103d1c9a7b65a
	.xword	0xe5d68ac25e423cfd
	.xword	0xf897ed6d7e6f78a8
	.xword	0xa9f025f039956c6a
	.xword	0x4779bb8ad74935de
	.xword	0xfc727fe13246a221
	.xword	0xbca4667178d73c80
	.xword	0x215007a7bb27a65d
	.xword	0x6a7d67d93c4c95cc
	.xword	0x221c68547d87f34e
	.xword	0x16d520bc4bc4360f
	.xword	0xe9ae2cd2729d4700
	.xword	0xf226b67e07cfef56
	.xword	0x122203c9da775d9a
	.xword	0xcdfc1385780a25bb
	.xword	0x35f5e65130642da7
	.xword	0xb148a6af19859d9c
	.xword	0x8055710b41b250b8
	.xword	0xae51275138da8f84
	.xword	0xec5c983a4dc40554
	.xword	0xafc734b69ff8e50a
	.xword	0xdf1884f6865f8949
	.xword	0xab8154e128f7c9be
	.xword	0xa5e78eba02050403
	.xword	0x03a49f38d06db011
	.xword	0x5d93a77eff590efb
	.xword	0xb50741092ec64c86
	.xword	0xc957c0278fa5d59a
	.xword	0xcc50b41a413b68ed
	.xword	0xd2083bb513f6f8e4
	.xword	0x5987a6a5276f1806
	.xword	0xe04e698af7f3619e
	.xword	0x8b582e131206f9d2
	.xword	0x2fa44b30ecd12544
	.xword	0x19779bf1e8b21d75
	.xword	0x33a03440671c8368
	.xword	0xabc8de86242b6d04
	.xword	0x02c2ecf54033cd46
	.xword	0x01f873b5ec251c54
	.xword	0xd8f99982b9eb161d
	.xword	0x68548bf7150742de
	.xword	0xf7de8d78a9af651f
	.xword	0x25a1479f40d3202e
	.xword	0xb65e2cd61c22752a
	.xword	0x7d740bc0c25d5282
	.xword	0xda85e16852fdd909
	.xword	0x59905a5836cd6444
	.xword	0x4894ede4c13993a5
	.xword	0x9031799eb4618b60
	.xword	0x24f4b72dbf851935
	.xword	0x429675853a87bf52
	.xword	0x597fd492c39de2dc
	.xword	0xd3e637418fdb27c8
	.xword	0xeee4698e6333ec74
	.xword	0x4bda27700973645c
	.xword	0x8a61c2a56c473b37
	.xword	0x6d00345a1102be20
	.xword	0x10009fb920644c03
	.xword	0xf636fb558bbcf4ac
	.xword	0xacca2ecaa80d7a61
	.xword	0x896ec56bfe4fe248
	.xword	0x60c28a93963df184
	.xword	0x05b57d2b3401bdf0
	.xword	0xb465ee70fc48bea9
	.xword	0x2263d83c93fb06bd
	.xword	0x3452162f41fce060
	.xword	0x6931dc25a1582560
	.xword	0x1a13385c82c619f0
	.xword	0x6ae4e7c25a724464
	.xword	0x4302af56d633b05b
	.xword	0xd6172ba70b956253
	.xword	0xd5cb975a0b0db2c0
	.xword	0x93f4780d16621773
	.xword	0x5667607d5e9c215f
	.xword	0xdeb826742bdbdbd0
	.xword	0xd9be9ad845e04b89
	.xword	0x4fb0bfbc56e52226
	.xword	0x874f61819cabc759
	.xword	0xcc27b165e4621213
	.xword	0x9c91a95d52accc3b
	.xword	0xc450e5f3f918ae26
	.xword	0xea09a76133d15550
	.xword	0x22e50979d35fed76
	.xword	0x6c740fa07bfe3042
	.xword	0x618e1df88c7483d3
	.xword	0xac9bc8e9f2013bbf
	.xword	0xd1ec70debec485d7
	.xword	0xfa92523b5a28cbb7
	.xword	0x803ca56f9d640e55
	.xword	0xc440f21a80fb610e
	.xword	0x7caf0dcbf11c0363
	.xword	0xbec1bb1798ab2274
	.xword	0x02dba48d1f44515e
	.xword	0xe5bdc56990f8dfc9
	.xword	0x556aabc98d918944
	.xword	0xa40b4e064ed0239a
	.xword	0xc3a3109ce446f257
	.xword	0x5f3d563ddc32f31d
	.xword	0x134c83cf126438a0
	.xword	0x0a830fba0e2c6d9f
	.xword	0xa60e69793309c100
	.xword	0x7721d45d78763c77
	.xword	0x688e0799164de890
	.xword	0x32f2844d983a0479
	.xword	0x26ea0087da3a8e51
	.xword	0x62ce7819e1e5bfd9
	.xword	0xf01e8732c1c545b6
	.xword	0x402ec4cf635ffebe
	.xword	0xa66b9cff151ab1e9
	.xword	0xf28d31f8bd930cce
	.xword	0xc20997246e898474
	.xword	0x154738fe2ae0b948
	.xword	0x2cbe4fd1e12fdadb
	.xword	0x02c7635c1563c4e0
	.xword	0xbf43ca8450ccd3e4
	.xword	0x416e7daeed3b2b06
	.xword	0x45e315737b5490c9
	.xword	0xa0a1dfd12b7364a1
	.xword	0xf5703084065f4065
	.xword	0x5ccd10dbb8f94b80
	.xword	0xf7305fc7dd72400c
	.xword	0x42b6b72c5a2515a5
	.xword	0x5ebd05931775e9c7
	.xword	0x6b9987876aa6b605
	.xword	0x38d3b10bb9c700de
	.xword	0x7793b3789758d80d
	.xword	0x222ad37e5a96b5b4
	.xword	0x7d043df8aaf4ed96
	.xword	0x23f0e5275ce97d26
	.xword	0x7e4e37440e7c897e
	.xword	0x732e5608a4849e27
	.xword	0xd0482f1db2a76cef
	.xword	0x9d0438cf92efbde2
	.xword	0x3b22a9d2c512e748
	.xword	0x048be2ed9005b949
	.xword	0x7b4ec7c3c2bd3e84
	.xword	0x6d6cf90f6544416e
	.xword	0x18a0ca0e34200044
	.xword	0x5f0fb23ab340b4ca
	.xword	0x1a6da275840ea714
	.xword	0x7b43f1e81e96315e
	.xword	0xd165504eb555651b
	.xword	0xe4718529e2c1c9a8
	.xword	0xbe29a9698567d0d1
	.xword	0x4d6d8178f5fb547a
	.xword	0xafe8dae1d990a51c
	.xword	0x25620fbed2d72ba4
	.xword	0xfc87f4c3258374c6
	.xword	0x5386acc643782861
	.xword	0x11ec9146a05082bf
	.xword	0xc07bcf931a485a97
	.xword	0x82b8a4b0e519966e
	.xword	0xdf7911fb3f839df7
	.xword	0x95191ce97080245e
	.xword	0xd46e1de8efe1374f
	.xword	0x95300b47cf71a202
	.xword	0x91ca3369ac407965
	.xword	0xc6e253467b8ea6cb
	.xword	0xbf574c4b915fee91
	.xword	0xca3aaafc680932c2
	.xword	0x1adca0e365cf519f
	.xword	0xda1678028278648f
	.xword	0x5aae075fc7553584
	.xword	0x1f185d75aa9c7722
	.xword	0xf45ff3f580fd8d17
	.xword	0x66e52b4f31b0455b
	.xword	0xf96db3e534cc4fbb
	.xword	0x3d0ecba0bffe22eb
	.xword	0x1f8fed4497c3a276
	.xword	0x3225f8473d39910b
	.xword	0x6ca62763271f0665
	.xword	0xf36ee4ad50c3a7f0
	.xword	0x0c32eae94895672c
	.xword	0x39c115f84aaf9f81
	.xword	0x4b1c0e2141f778ce
	.xword	0x06166fac1792c72e
	.xword	0x6b9a44230e1145e0
	.xword	0xf2a33c09a05b0550
	.xword	0xde3b77712ed4393f
	.xword	0x12bf2c60f1e01316
	.xword	0xf70ab8464e1b19c4
	.xword	0xfa0748f90c1eb76f
	.xword	0xa48a035921c83a81
	.xword	0x5df1af0f99ed801d
	.xword	0xc91edd1e4d04939f
	.xword	0x05a5cb7030cfe709
	.xword	0x6b28404f4bd52405
	.xword	0xa62d307aae53fb94
	.xword	0x741b7986412ac878
	.xword	0xef144fc013d0ec25
	.xword	0x6e37aeae8c574426
	.xword	0xef25ac5ec4e7ce4f
	.xword	0x8e7bc53ba0d0b39c
	.xword	0x1454f67595071894
	.xword	0xee0ae76cd33c3cc9
	.xword	0xc2e14f6be70f6746
	.xword	0x87d125d7269f1d0d
	.xword	0x1759a0b715560d8a
	.xword	0x6476fe64bf464bed
	.xword	0x0223bda0677bd40c
	.xword	0x687068d8504dc5db
	.xword	0xf8f46f31a4f16346
	.xword	0x8ce4a6940471b711
	.xword	0x2362169792a1a84c
	.xword	0xef71de58165ef393
	.xword	0x49c01cd939c5f034
	.xword	0x205fdb3e50e3073a
	.xword	0x3d8b24ea5017dc8d
	.xword	0xd9e57608294e6f42
	.xword	0x98bfe68e7a6830ec
	.xword	0xa73ba8203621c370
	.xword	0x127b13cfac8b85dc
	.xword	0x082c47ca10f5ad6a
	.xword	0x0abb4df4571619f0
	.xword	0x1a30b1b5b4418a4d
	.xword	0x445f7513952814f7
	.xword	0xdf0fce02829a6571
	.xword	0x72f52e778629d6eb
	.xword	0x0286e6fb6277cece
	.xword	0xec4087d577d86500
	.xword	0xa90e53a805e503e5
	.xword	0x0dda975cedc2df12
	.xword	0x06d364c6a4e0469c
	.xword	0xef4285ea266c64a2
	.xword	0x776d641055675f80
	.xword	0x1db422fbcad87279
	.xword	0xdf740325656883f0
	.xword	0xb0cb42612baf6f7e



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
!!#   int total_int =0;
!!# 
!!# #define ISEG	0
!!# #define MY_HYP_SEC	1
!!# #define NCDATA0	2
!!# #define PAGE1A	3
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
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 112, Rv_memaddr_pattern_int,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 1110 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   ! keeping CPU ID 0, Agent 0-15 ??
!!#   IJ_set_rvar ("diag.j", 120, Rv_memaddr_pattern_int1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 1111 0000 0000 0000,"
!!#         "20'b 0000 0000 0000 0000 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 129, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 138, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 147, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 148, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 151, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 162, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 174, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 0000 00rr r000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 187, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 197, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 207, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 217, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 227, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 237, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 248, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 256, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 264, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 265, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 266, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 267, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 270, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 271, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 275, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 276, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 279, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 281, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 282, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 283, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 285, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 287, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 288, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 290, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 291, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 292, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 293, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 295, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 296, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 299, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 301, th_M, "\tmov\t0, %%r8\n");
!!#   IJ_printf ("diag.j", 302, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 303, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 304, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 305, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 306, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 307, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 308, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!# !  IJ_printf (sjm_4, "\n\nBA LABEL_0\n");
!!# !  IJ_printf (sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 347,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 349,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 354, th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",total_int);
!!#   IJ_printf ("diag.j", 355, th_M, "\tsetx\t page1a, %%r1, %%r26\n");
!!#   IJ_printf ("diag.j", 356, th_M, "\tldx\t[%%r26], flagr\n");
!!#   IJ_printf ("diag.j", 357, th_M, "\tcmp\t%%r6, flagr\n");
!!#   IJ_printf ("diag.j", 358, th_M, "\tbne\tbad_end\n");
!!#   IJ_printf ("diag.j", 359, th_M, "\tnop\n");
!!#   !IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#   !IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!#   IJ_th_start ("diag.j", 362,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 612, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type:  set_addr  load  alu   store sjm4 sjm5
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 619, th_M, $2);
!!# 		IJ_generate ("diag.j", 620, th_M, $3);
!!# 		IJ_generate ("diag.j", 621, th_M, $4);
!!# 		IJ_generate ("diag.j", 622, th_M, $5);
!!# 		IJ_generate ("diag.j", 623, th_M, $6);
!!# 		!IJ_generate (th_M, $7);
!!# }
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
!!#                    total_int++;
!!#                    IJ_printf ("diag.j", 642, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 644, Rv_memaddr_pattern_int);
!!#                      IJ_printf ("diag.j", 645, sjm_4, "INT  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 646, Rv_memaddr_pattern_int);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                         if(i==2) int_cnt++;
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          data_st = int_cnt;
!!#                          !data_st = IJ_get_rvar_val32(Rv_rand32);
!!# 			 !IJ_update_rvar(Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 654, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 655, sjm_4, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 657, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 658, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 670, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 673, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 675, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 676, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 680, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 681, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 682, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 683, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 685, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 686, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 699, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 704, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 708, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 709, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 711, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 712, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 726, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 730, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 731, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 748, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 753, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 754, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 756, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 757, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 759, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 760, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 765, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 766, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 768, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 769, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 786, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 789, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 791, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 792, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 796, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 797, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 798, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 799, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 801, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 802, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 815, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 820, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 824, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 825, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 827, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 828, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 843, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 846, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 848, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 849, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 864, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 867, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 868, Rv_rand32);
!!#                          IJ_printf ("diag.j", 869, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 874, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 876, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 890, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 896, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 900, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 915, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 917, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 919, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 925, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 926, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 953, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 959, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 960, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 963, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 965, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 974, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 976, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 994, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1000, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1005, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1007, sjm_4, "\n");
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
!!#                    total_int++;
!!#                    IJ_printf ("diag.j", 1026, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1028, Rv_memaddr_pattern_int1);
!!#                      IJ_printf ("diag.j", 1029, sjm_5, "INT  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1030, Rv_memaddr_pattern_int1);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          data_st = IJ_get_rvar_val32("diag.j", 1034, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1035, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1036, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1037, sjm_5, "0x%08x ",data_st);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1039, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1040, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1051, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1054, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1056, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1057, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1060, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1061, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1062, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1063, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1065, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1066, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1079, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1084, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1088, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1089, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1091, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1092, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1106, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1110, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1111, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1128, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1133, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1134, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1136, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1137, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1139, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1140, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1145, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1146, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1148, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1149, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1166, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1169, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1171, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1172, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1176, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1177, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1178, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1179, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1181, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1182, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1195, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1200, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1204, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1205, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1207, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1208, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1224, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1227, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1229, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1230, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1245, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1248, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1249, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1250, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1255, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1257, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1271, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1277, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1281, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1296, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1298, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1300, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1306, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1307, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1334, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1340, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1341, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1344, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1346, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1355, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1357, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1375, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1381, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1386, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1388, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1431, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
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
