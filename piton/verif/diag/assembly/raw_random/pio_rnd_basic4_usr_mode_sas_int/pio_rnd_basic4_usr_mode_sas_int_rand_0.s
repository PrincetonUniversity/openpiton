// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas_int_rand_0.s
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
   random seed:	435400003
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

	setx 0xfb827bb0ac490b4d, %g1, %g0
	setx 0x1cce76c60bcc02ac, %g1, %g1
	setx 0xf015e3fa7ebe39d0, %g1, %g2
	setx 0x100d33f873ebe16f, %g1, %g3
	setx 0xae7d72c42a05f5ca, %g1, %g4
	setx 0x8621b284e2c9efc1, %g1, %g5
	setx 0xfaf149b0c83dc871, %g1, %g6
	setx 0xc3039204b32a5913, %g1, %g7
	setx 0xb3ce5a5ed3885d7a, %g1, %r16
	setx 0x8ed53e2850f478d8, %g1, %r17
	setx 0xa669020d16e2a5ca, %g1, %r18
	setx 0xd98c372b621bd0a6, %g1, %r19
	setx 0x338b1a4047f6f876, %g1, %r20
	setx 0x43af07d6dd3283b4, %g1, %r21
	setx 0x5d7311bd81b6b675, %g1, %r22
	setx 0x8598383566714b88, %g1, %r23
	setx 0x18aabe034742933a, %g1, %r24
	setx 0x8ac314eb5aa8e15c, %g1, %r25
	setx 0x7ce2064300bd2ecc, %g1, %r26
	setx 0xf2d48b4a8fb5754e, %g1, %r27
	setx 0x80a9f00ba855f9c9, %g1, %r28
	setx 0xa385e3f41b4a2059, %g1, %r29
	setx 0xfef17d9fdbbe882f, %g1, %r30
	setx 0xda1efe99b46ab1f2, %g1, %r31
	save
	setx 0xbc678faec3b86a59, %g1, %r16
	setx 0xa8a914815a6d247c, %g1, %r17
	setx 0xdd418c45846f52a8, %g1, %r18
	setx 0xdd6cdcf3aee7fe95, %g1, %r19
	setx 0x9a5f1aef70aa59e3, %g1, %r20
	setx 0x91d15e881952b02d, %g1, %r21
	setx 0x22c32a314d2590cb, %g1, %r22
	setx 0x0db919e73021b7bf, %g1, %r23
	setx 0x0afdb7b1b50348d5, %g1, %r24
	setx 0x6ed56f117d27e3db, %g1, %r25
	setx 0xc7c94da8991014c2, %g1, %r26
	setx 0xd18c33dc1ef201f0, %g1, %r27
	setx 0x83099caa3295fb28, %g1, %r28
	setx 0x3d4ed444ed1f2fd7, %g1, %r29
	setx 0xfbcd8b051e054c5d, %g1, %r30
	setx 0x29dbe7bf190024ed, %g1, %r31
	save
	setx 0xbe605942af671aab, %g1, %r16
	setx 0xb66076bb6a78ad1d, %g1, %r17
	setx 0x3df336ba8ffb8d16, %g1, %r18
	setx 0x9384d59cf571301e, %g1, %r19
	setx 0x7dfe5daa325da7eb, %g1, %r20
	setx 0xc2737d03af6f9a28, %g1, %r21
	setx 0x55573227758f1d5c, %g1, %r22
	setx 0x0cc2e7654485bb62, %g1, %r23
	setx 0xf2ced6ece2b81135, %g1, %r24
	setx 0xc6bd0f5b8490f8dd, %g1, %r25
	setx 0xc8202a72452864e9, %g1, %r26
	setx 0x75035de7e0478016, %g1, %r27
	setx 0x68f67f78bd65aad2, %g1, %r28
	setx 0x58d960b46c39a818, %g1, %r29
	setx 0xad608edbd40797c9, %g1, %r30
	setx 0x70ff11220d245e77, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000080c97af850, %r1, %r6
	setx	0x00000000d01ef038, %r1, %r7
	setx	0x000000800f0ef808, %r1, %r9
	setx	0x000000cfe01a4778, %r1, %r10
	setx	0x000000d4300988b0, %r1, %r11
	setx	0x000000e6b49ac438, %r1, %r12
	setx	0x000000f26c6f3998, %r1, %r13
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec498008  ! 1: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xaa01a018  ! 2: ADD_I	add 	%r6, 0x0018, %r21
	.word 0xe031a018  ! 3: STH_I	sth	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0598008  ! 7: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xac31a038  ! 8: ORN_I	orn 	%r6, 0x0038, %r22
	.word 0xe4298008  ! 9: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec49a038  ! 13: LDSB_I	ldsb	[%r6 + 0x0038], %r22
	.word 0xa001a008  ! 14: ADD_I	add 	%r6, 0x0008, %r16
	.word 0xe0218008  ! 15: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4198008  ! 19: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xac318008  ! 20: SUBC_R	orn 	%r6, %r8, %r22
	.word 0xe0298008  ! 21: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0498008  ! 25: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa089a038  ! 26: ANDcc_I	andcc 	%r6, 0x0038, %r16
	.word 0xe0398008  ! 27: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe011a038  ! 31: LDUH_I	lduh	[%r6 + 0x0038], %r16
	.word 0xa2898008  ! 32: ANDcc_R	andcc 	%r6, %r8, %r17
	.word 0xe471a038  ! 33: STX_I	stx	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0518008  ! 37: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa219a020  ! 38: XOR_I	xor 	%r6, 0x0020, %r17
	.word 0xe029a020  ! 39: STB_I	stb	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec09a020  ! 43: LDUB_I	ldub	[%r6 + 0x0020], %r22
	.word 0xa089a028  ! 44: ANDcc_I	andcc 	%r6, 0x0028, %r16
	.word 0xec318008  ! 45: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec41a028  ! 49: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	.word 0xa0298008  ! 50: ANDN_R	andn 	%r6, %r8, %r16
	.word 0xe071a028  ! 51: STX_I	stx	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8198008  ! 55: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa6998008  ! 56: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe829a028  ! 57: STB_I	stb	%r20, [%r6 + 0x0028]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0098008  ! 61: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa8418008  ! 62: ADDC_R	addc 	%r6, %r8, %r20
	.word 0xe421a028  ! 63: STW_I	stw	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe859a028  ! 67: LDX_I	ldx	[%r6 + 0x0028], %r20
	.word 0xa0318008  ! 68: SUBC_R	orn 	%r6, %r8, %r16
	.word 0xe021a028  ! 69: STW_I	stw	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 73: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa2218008  ! 74: SUB_R	sub 	%r6, %r8, %r17
	.word 0xec398008  ! 75: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe449a028  ! 79: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xa299a018  ! 80: XORcc_I	xorcc 	%r6, 0x0018, %r17
	.word 0xe8318008  ! 81: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 85: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa8a1a000  ! 86: SUBcc_I	subcc 	%r6, 0x0000, %r20
	.word 0xe8398008  ! 87: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8498008  ! 91: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa019a038  ! 92: XOR_I	xor 	%r6, 0x0038, %r16
	.word 0xe471a038  ! 93: STX_I	stx	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec518008  ! 97: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xae91a030  ! 98: ORcc_I	orcc 	%r6, 0x0030, %r23
	.word 0xe431a030  ! 99: STH_I	sth	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0518008  ! 103: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xaa31a018  ! 104: SUBC_I	orn 	%r6, 0x0018, %r21
	.word 0xe8218008  ! 105: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec59a018  ! 109: LDX_I	ldx	[%r6 + 0x0018], %r22
	.word 0xa219a038  ! 110: XOR_I	xor 	%r6, 0x0038, %r17
	.word 0xe0398008  ! 111: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0598008  ! 115: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaab1a000  ! 116: ORNcc_I	orncc 	%r6, 0x0000, %r21
	.word 0xe029a000  ! 117: STB_I	stb	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 121: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa4b98008  ! 122: XNORcc_R	xnorcc 	%r6, %r8, %r18
	.word 0xec71a000  ! 123: STX_I	stx	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe809a000  ! 127: LDUB_I	ldub	[%r6 + 0x0000], %r20
	.word 0xa829a010  ! 128: ANDN_I	andn 	%r6, 0x0010, %r20
	.word 0xe0398008  ! 129: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe059a010  ! 133: LDX_I	ldx	[%r6 + 0x0010], %r16
	.word 0xa821a000  ! 134: SUB_I	sub 	%r6, 0x0000, %r20
	.word 0xe0718008  ! 135: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 139: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa629a000  ! 140: ANDN_I	andn 	%r6, 0x0000, %r19
	.word 0xe8398008  ! 141: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe8518008  ! 145: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xae418008  ! 146: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xe8718008  ! 147: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe401a000  ! 151: LDUW_I	lduw	[%r6 + 0x0000], %r18
	.word 0xac398008  ! 152: XNOR_R	xnor 	%r6, %r8, %r22
	.word 0xec71a000  ! 153: STX_I	stx	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8498008  ! 157: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xac91a038  ! 158: ORcc_I	orcc 	%r6, 0x0038, %r22
	.word 0xec318008  ! 159: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec51a038  ! 163: LDSH_I	ldsh	[%r6 + 0x0038], %r22
	.word 0xa2098008  ! 164: AND_R	and 	%r6, %r8, %r17
	.word 0xe0718008  ! 165: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe859a038  ! 169: LDX_I	ldx	[%r6 + 0x0038], %r20
	.word 0xa4b98008  ! 170: XNORcc_R	xnorcc 	%r6, %r8, %r18
	.word 0xe0218008  ! 171: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8198008  ! 175: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa8998008  ! 176: XORcc_R	xorcc 	%r6, %r8, %r20
	.word 0xe0318008  ! 177: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0098008  ! 181: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6018008  ! 182: ADD_R	add 	%r6, %r8, %r19
	.word 0xe439a038  ! 183: STD_I	std	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa819a030  ! 188: XOR_I	xor 	%r6, 0x0030, %r20
	.word 0xe4718008  ! 189: STX_R	stx	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe041a030  ! 193: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xaab1a030  ! 194: SUBCcc_I	orncc 	%r6, 0x0030, %r21
	.word 0xe071a030  ! 195: STX_I	stx	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe0598008  ! 199: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa8398008  ! 200: XNOR_R	xnor 	%r6, %r8, %r20
	.word 0xe0218008  ! 201: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8418008  ! 205: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xa099a008  ! 206: XORcc_I	xorcc 	%r6, 0x0008, %r16
	.word 0xe429a008  ! 207: STB_I	stb	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4118008  ! 211: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xa2b9a038  ! 212: XNORcc_I	xnorcc 	%r6, 0x0038, %r17
	.word 0xe8218008  ! 213: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4098008  ! 217: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa0b1a020  ! 218: ORNcc_I	orncc 	%r6, 0x0020, %r16
	.word 0xe4298008  ! 219: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec49a020  ! 223: LDSB_I	ldsb	[%r6 + 0x0020], %r22
	.word 0xa6a9a018  ! 224: ANDNcc_I	andncc 	%r6, 0x0018, %r19
	.word 0xe0218008  ! 225: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe019a018  ! 229: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xa2b98008  ! 230: XNORcc_R	xnorcc 	%r6, %r8, %r17
	.word 0xe8218008  ! 231: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe801a018  ! 235: LDUW_I	lduw	[%r6 + 0x0018], %r20
	.word 0xaac1a008  ! 236: ADDCcc_I	addccc 	%r6, 0x0008, %r21
	.word 0xe029a008  ! 237: STB_I	stb	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0118008  ! 241: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xaa098008  ! 242: AND_R	and 	%r6, %r8, %r21
	.word 0xe039a008  ! 243: STD_I	std	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4598008  ! 247: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa8818008  ! 248: ADDcc_R	addcc 	%r6, %r8, %r20
	.word 0xe039a008  ! 249: STD_I	std	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe4198008  ! 253: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xac918008  ! 254: ORcc_R	orcc 	%r6, %r8, %r22
	.word 0xe8398008  ! 255: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe419a008  ! 259: LDD_I	ldd	[%r6 + 0x0008], %r18
	.word 0xa6418008  ! 260: ADDC_R	addc 	%r6, %r8, %r19
	.word 0xe821a008  ! 261: STW_I	stw	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe441a008  ! 265: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	.word 0xa0b1a000  ! 266: SUBCcc_I	orncc 	%r6, 0x0000, %r16
	.word 0xe4318008  ! 267: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0018008  ! 271: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa041a018  ! 272: ADDC_I	addc 	%r6, 0x0018, %r16
	.word 0xe0718008  ! 273: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe059a018  ! 277: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xa809a028  ! 278: AND_I	and 	%r6, 0x0028, %r20
	.word 0xe439a028  ! 279: STD_I	std	%r18, [%r6 + 0x0028]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe811a028  ! 283: LDUH_I	lduh	[%r6 + 0x0028], %r20
	.word 0xae31a008  ! 284: ORN_I	orn 	%r6, 0x0008, %r23
	.word 0xe0298008  ! 285: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec09a008  ! 289: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xaca18008  ! 290: SUBcc_R	subcc 	%r6, %r8, %r22
	.word 0xe0318008  ! 291: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
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
	.xword	0x56acbfc3a8054357
	.xword	0x9cde2483d0e73918
	.xword	0x15bf55b5dcc7f94f
	.xword	0x1fccb857d4b587ad
	.xword	0x3a57e05435161ef7
	.xword	0xb068cb188da6b733
	.xword	0xbcc9cf99c01252b3
	.xword	0x0b914a2c2b54239b
	.xword	0x3cf86e6b4e8589d8
	.xword	0xa35e4c64c411c5fe
	.xword	0x9d5763cde57c1625
	.xword	0xfcf6deb0980beb4d
	.xword	0xabb9a40b94dd5ec5
	.xword	0xa8f0dccb0ff5ed85
	.xword	0xb1c7c7ba16389f33
	.xword	0x16061f992fe362d2
	.xword	0x0c31fc571e783379
	.xword	0xab8b256355b828f8
	.xword	0xcca270e12f011de5
	.xword	0x02643e712a9ae792
	.xword	0x12c4ef3a8bc8f439
	.xword	0x382039ee4014fdae
	.xword	0x2a41829a8d1ba074
	.xword	0xbbd8762bd6922d7d
	.xword	0x9d0b95ca935e57a2
	.xword	0x34207d842e2e876c
	.xword	0x94aeff19d5980b35
	.xword	0x6addb8fc45f1d8f1
	.xword	0x631f70fc8cf92a92
	.xword	0x1cbb8ebcf0a9b283
	.xword	0x1e6d7778fdcd1fb7
	.xword	0xa89af442cf07fb6f
	.xword	0x4deef21a564776af
	.xword	0xc2e6f63448c6603b
	.xword	0x6f2d4808f172500d
	.xword	0x0e8397e3f1dd75e6
	.xword	0x084fe9bfb0dbf7a7
	.xword	0x9dbad2601d35b98e
	.xword	0x6d2906efb4be2efe
	.xword	0x2d8848014fa232b9
	.xword	0xead1417da749ca85
	.xword	0xd23d20ed89183c05
	.xword	0x9ac789c2cc8ec3b2
	.xword	0x0c347f11b6a0dcc5
	.xword	0x82972545b75aa341
	.xword	0xdf4b5d1a77ca8a01
	.xword	0xd2300b7345be0da9
	.xword	0x80882007a54aea3c
	.xword	0x7d7dee4bf4bdc35d
	.xword	0x4f57f90f92ba3a92
	.xword	0xc8789a20379feb71
	.xword	0xd1d3ddcf546d4503
	.xword	0xa4bdd8aacdee6e1e
	.xword	0x9ef9f28b91f95e1d
	.xword	0xb8353fd7813e2781
	.xword	0x08d4bbccf71bd4e3
	.xword	0x900f4ba1b1c63b90
	.xword	0x2b3eb40cf554fe09
	.xword	0x1e7a68df1b9b6888
	.xword	0xa1d0af9075bb9b04
	.xword	0xa4ca6c5ff5604d11
	.xword	0x7a9c82dbeccd0181
	.xword	0xe8027a9d7052b25b
	.xword	0x695cac117186e837
	.xword	0x22c3ceb0db1c3708
	.xword	0xe6881c76794b4d5f
	.xword	0xd08a3d4a5cb777b1
	.xword	0x9351899413e11739
	.xword	0x4cac47a39aec39c0
	.xword	0x8d5eddde48b8c6ee
	.xword	0xb825a63cc01b7bf1
	.xword	0x88b3b41377d6d5f4
	.xword	0xd98421f36c501618
	.xword	0x10438419ac50fb06
	.xword	0xae13e48830b34bb8
	.xword	0xa0a04a0635b9ac79
	.xword	0xc0fea78cff804cda
	.xword	0x6ac4dbd105422f70
	.xword	0xd1467cd05386dbbd
	.xword	0xfad14a26c1e5b281
	.xword	0x84e0bab410d502fc
	.xword	0xf616153250f8de9d
	.xword	0x15fd2587a879b81c
	.xword	0x3c49d66d36bbac4f
	.xword	0xb648d54a89199f65
	.xword	0xccfbe5f49c3ec0c6
	.xword	0xb20bc67ba669904a
	.xword	0xec3ea65bf2f36dfd
	.xword	0xe6238e58fb09ca84
	.xword	0x4de78a1d1a0bb4a1
	.xword	0xb30c5eacfded0016
	.xword	0x7adb18ad82783e9d
	.xword	0xb4a2f9029e9cb095
	.xword	0x562836d7a34772f0
	.xword	0xfa9042332b475138
	.xword	0xf7dd27fe4f4adce5
	.xword	0x893db8e598c464f1
	.xword	0x53064e99a9742e23
	.xword	0x2c6ee25b3bd2fe76
	.xword	0xc608e82a81c2a99c
	.xword	0x960b4aff5db0c4af
	.xword	0x2089f7d12b0c8a02
	.xword	0x905a12af9e9f1322
	.xword	0x138e71823847da5a
	.xword	0x079410bbdc3aeba4
	.xword	0xa5e698ce303755c9
	.xword	0xe936bf182d24663b
	.xword	0xcb2332fcde1e6331
	.xword	0x404377711c7fd8b8
	.xword	0xb2949239d6c9d9fb
	.xword	0xaa90e2ed09d14ccd
	.xword	0x00a6605e6f50caa8
	.xword	0x17ff04fbdcec73b8
	.xword	0x3175c2fbc27eff0d
	.xword	0x33b747bf05488ad1
	.xword	0xd90beab8b3db057d
	.xword	0xddfb1277960c5d1b
	.xword	0xdc0b6120081b79a5
	.xword	0xbb7f5d6912fc217a
	.xword	0xcdce127900f92071
	.xword	0xaad010d24015632a
	.xword	0xd6bbfe6f61c6f34c
	.xword	0x4b3a54bdd0a232ab
	.xword	0xfc7f2ea99ea89bb8
	.xword	0xf1ecee3dba422266
	.xword	0x6be9f3d54eb0c4d1
	.xword	0x7ef1ce135041c556
	.xword	0x76f5777e5b5ef562
	.xword	0xfcb2bfde2b09a708
	.xword	0x53a09a261367efde
	.xword	0xbd3d879498b41c44
	.xword	0x403bca65c99ffe0c
	.xword	0x5fc8b94892c0b8c6
	.xword	0xe0fb077bcce5e35a
	.xword	0xa0effd094279d22b
	.xword	0x015c55f7b98a630b
	.xword	0x25c518a4b3647034
	.xword	0x63de2f5b52357dde
	.xword	0x0f5578c4b57d0dea
	.xword	0x96a4eca2ee17c688
	.xword	0x6aef86eeca5bd84a
	.xword	0x91040dff9aeadfef
	.xword	0x293a7e45a3ca4a78
	.xword	0xb5e172d942f07319
	.xword	0x260312c9e684a2e5
	.xword	0x22c8ed39131274a0
	.xword	0xf620ea269ed71510
	.xword	0xeba76ffd82491560
	.xword	0x1a75c8a94a0e6181
	.xword	0x08d8ec85d17d4447
	.xword	0xffc0aed9d38e5738
	.xword	0x286647286e8337f9
	.xword	0xfe38c35ac05a96e7
	.xword	0x95243f5946ad56db
	.xword	0xe946c3fdffe378c7
	.xword	0xbc9a004dc2e54368
	.xword	0xf2fd4b3678e9431f
	.xword	0xe7f97bc568f897d4
	.xword	0x1513c6182d51e97d
	.xword	0xbbe076d072c1879a
	.xword	0x78ee9eda28fd17dc
	.xword	0x2b05a05279ad7353
	.xword	0x4b50c1f4f33b056c
	.xword	0x38b4fc25121bc98e
	.xword	0xd10262a335484edc
	.xword	0x0e41b2fca8d66fcd
	.xword	0xdd9a13ab95cefdfb
	.xword	0xdf03a7a951d099a3
	.xword	0x7266b31e4837bf70
	.xword	0xa514c4db72207e6d
	.xword	0x8bac4455daf86cd2
	.xword	0xd4ae104374738a88
	.xword	0x8f04a4f33930dde7
	.xword	0xdf0fb3132ba56d32
	.xword	0x8465ef5b61394d69
	.xword	0x3a6ff7b3235b0c9a
	.xword	0xa9b6aef279ac5223
	.xword	0x521c42df09b9dd1d
	.xword	0x06daf7f9b7d64b29
	.xword	0xcd4805b03129919a
	.xword	0xd4d9abb61e92c6ba
	.xword	0xb7430741f70808e9
	.xword	0x8b1b0b387f39a58b
	.xword	0x2bbc63112fc95d8f
	.xword	0x758e5ecea4cec99a
	.xword	0xc7fbdb108e14dde5
	.xword	0x1257c94a2f2e8831
	.xword	0xfe5f1964f024d6f2
	.xword	0xd93220ea8b78adbb
	.xword	0x004156d10fb1e1d5
	.xword	0x1c070af2d7a9c3ea
	.xword	0x4ac6b561d3843bb8
	.xword	0x3842fbe4be9b12f8
	.xword	0x9fbeab30875272eb
	.xword	0x3dea4e33d2c31c22
	.xword	0xd9e40b062ba1c159
	.xword	0x8f59bfd9de4d2880
	.xword	0x83ac7c1da544eb3c
	.xword	0x72b77d0ee5bd55d4
	.xword	0x79b657d0e52c709d
	.xword	0xa4d03719ba437051
	.xword	0xd79d990a3c0352d6
	.xword	0xae29d046a3cef1b4
	.xword	0x6597678dca456d13
	.xword	0x01ce69f98ede9ebe
	.xword	0x13cd4514092cdc44
	.xword	0x761619c022e62f9a
	.xword	0xdd743a99cc0dfcb8
	.xword	0x559572a9784150ab
	.xword	0xe1e91053c986ef9e
	.xword	0xab6f66af5de130a1
	.xword	0x39f58b7e7b9f696c
	.xword	0x919a30c2e8eae27b
	.xword	0x3fcacd35763d72d1
	.xword	0x936e79146e2e9521
	.xword	0xf2581a8e7ffdb7cb
	.xword	0x3d46450a8363b916
	.xword	0x3658ee1fe1e0b6e7
	.xword	0x426314cb291e75f6
	.xword	0xfd0956c19670251b
	.xword	0xdda8201680eba655
	.xword	0x231ee3ea36411ba4
	.xword	0x7e19e6aacd9c7a14
	.xword	0x443153f41c0de660
	.xword	0xb8aac191a38d1295
	.xword	0x7a578fdd3b06ee74
	.xword	0x1fda2760d0287bdb
	.xword	0xb03ebfe87647ffe8
	.xword	0xe98b410bcf1d4976
	.xword	0x39a424fce6cedcd9
	.xword	0x5f8105cf64e0dff7
	.xword	0x27a4266dfea22eb8
	.xword	0xc387843ad90074bd
	.xword	0xef8e2a7d9a4bfab3
	.xword	0xcdbb7bd3432f7e04
	.xword	0x779a2b22e57d694c
	.xword	0xe8a31ef4ad888c36
	.xword	0xb1c285d3f0797343
	.xword	0xbfb8a4170011b3ac
	.xword	0x73dfae856e9fc9f3
	.xword	0x6f2848039c555f38
	.xword	0x76a983e06f3ce8df
	.xword	0x7180b0d722b170b0
	.xword	0x5269303dca685b5e
	.xword	0xa2174aba1f2adc93
	.xword	0xe5b9ba232fe96ff6
	.xword	0xc3b4f318b8abc232
	.xword	0xbcb35db25df5ff80
	.xword	0x15efef0b0c0e7149
	.xword	0x59bacb0071053e54
	.xword	0xe08d258e8e66fb9a
	.xword	0xcb8c4faefe372f81
	.xword	0xf3f15fd97e88f83c
	.xword	0xef193903e4ce8902
	.xword	0x40ae4c806d229072
	.xword	0xc6b0c462f014ed7a



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
	.xword	0xb3b7aed1d5b5d9a6
	.xword	0x7a9a7f45b362f09c
	.xword	0xa4c4a5039732b135
	.xword	0x033c0a62ea241b5b
	.xword	0xc7305b0992f01856
	.xword	0xd015380f771aedd6
	.xword	0xa1e28a1d7d861780
	.xword	0xa784836d62477769
	.xword	0x3c8bcbb34538d1df
	.xword	0xf6dc1fa8929226a0
	.xword	0x099b479563a0596c
	.xword	0xc2caf56335d82d95
	.xword	0xc8a05ed7bb19e5ea
	.xword	0x1817526ceb5cbcdf
	.xword	0x9460e992d4803999
	.xword	0xe1491b470677edd3
	.xword	0xab0865aac7d3a3d4
	.xword	0x8f23e7a5a0af5d05
	.xword	0x2abee472ae9838dc
	.xword	0xede1eea2ac2dc6fe
	.xword	0x49417d5284cb57ba
	.xword	0x49b1806af0af4567
	.xword	0x06c5e5cc2bef0095
	.xword	0xccd6c49030f12578
	.xword	0xfbfa5eb6468c6c60
	.xword	0xfed2fba5cdfc59d5
	.xword	0x001986af097eecb4
	.xword	0x78bbce9a274ada90
	.xword	0x72a0cd781ee34e82
	.xword	0xf7967ed32f5abf5c
	.xword	0xd57ed742689cb531
	.xword	0x6095dea730fb71fc
	.xword	0x9876a444be43d0da
	.xword	0x4305aafc9253ba79
	.xword	0x28c74decde402918
	.xword	0xe0f42cae8380821a
	.xword	0x7e38bef0a18a2402
	.xword	0xb28e9d512b9ef7b1
	.xword	0xb865dc9d83c8ae01
	.xword	0x5ec4fa44b499213c
	.xword	0x4f85c512defb1c52
	.xword	0x6784296bf771f8a0
	.xword	0xe2b6874a17554c72
	.xword	0xa33fa4002d4bb7fe
	.xword	0x20fb84cebfd24b6f
	.xword	0x8a9371884c574d2c
	.xword	0xcd1d8c07d7a00bd6
	.xword	0x529d0fe76821491a
	.xword	0xfa8d833450e9a516
	.xword	0x70c41ae2d86bd9a0
	.xword	0x834ef94987987218
	.xword	0x83f478f66fc4a839
	.xword	0xf267ce34cdc8df7a
	.xword	0x3223f028a844df7b
	.xword	0x8eb5db479d58769c
	.xword	0x6693fd5aa539c717
	.xword	0xafe4001d686fa0a5
	.xword	0xc1484f1b6ffdd7b3
	.xword	0x94aa107ffe6f2840
	.xword	0xa2f172e756e650c7
	.xword	0x39f2ede8da4fc2be
	.xword	0x4d68039284de7150
	.xword	0xa54063d86df5d1a5
	.xword	0xcb31dc6a0cb31233
	.xword	0x9287a5bd343665cc
	.xword	0xd25dd1f316d578d4
	.xword	0x44d60935895d2118
	.xword	0x34d16cae480e92b2
	.xword	0xc181c673955cefb1
	.xword	0xcaa3a3ba03381e8b
	.xword	0x9a0a45b1a64012aa
	.xword	0xf7ffab54cddbc2e3
	.xword	0xc6cf5b85b7028865
	.xword	0x61781d496f5ba060
	.xword	0x534a4ef526a713d7
	.xword	0x72cdbc6ee6f07fe7
	.xword	0x6896d23fdf8f6dc2
	.xword	0x59b4015bec3e3d0c
	.xword	0xcfe6cf0eb7f4eccd
	.xword	0x6132eecb09098cd7
	.xword	0x871d09d7f49b9398
	.xword	0x97a1db087cb0caa9
	.xword	0xfd951c4bb568402d
	.xword	0x9417aef3ea4442be
	.xword	0x7251a9e6484608f3
	.xword	0x4467c7fdb58e45bc
	.xword	0x49d9506c3e8de704
	.xword	0x182c564e4196197b
	.xword	0xa40f34e4e0efdb2c
	.xword	0x5fbd4fd104e64122
	.xword	0x6e81f0ddb28ea3ae
	.xword	0x57d6df7151071b68
	.xword	0xa7006db71723c80b
	.xword	0xb2ce09871be150be
	.xword	0xb192847440bad55c
	.xword	0x41f4d23b0bf1ee0b
	.xword	0x09fb7a90e88c44af
	.xword	0x8a1fadec45d8df09
	.xword	0x0f48614305edee5b
	.xword	0x6b98f7a33ec9cbe7
	.xword	0xe5f00ab49ad6b9ea
	.xword	0x45b7e006091c3b7e
	.xword	0x88ff54b316a097c5
	.xword	0x2b4b8d2dc78333e0
	.xword	0xc0dd10626db6769d
	.xword	0xd5d4e9d40d45edc6
	.xword	0x84769cb284fdbe8d
	.xword	0x56b4fe8ef9af92b3
	.xword	0x1eff6f23bacd9488
	.xword	0x6300b46838b92cf5
	.xword	0x672f0ff1e172b5e8
	.xword	0x6b25e6602de8c046
	.xword	0x6df07de86e9cd0a9
	.xword	0x088c78ffa1b35538
	.xword	0x8952ce64af4a1b18
	.xword	0x40459745635a5941
	.xword	0xaa6545d26faacfed
	.xword	0x4a1d3a1674766879
	.xword	0xdc19ceb199c2dadd
	.xword	0x6093e9d0c063b173
	.xword	0x99b2e81b1100cd1c
	.xword	0xb2da768a9e9e83d4
	.xword	0xa8b71d93adf4acf1
	.xword	0x320267353073d3fb
	.xword	0x0dd714e64c3364d6
	.xword	0x0fee29b01754232d
	.xword	0x2f8fe3d4022dc5e7
	.xword	0x89fe53783f2659b9
	.xword	0xb35372585ef41d21
	.xword	0x8b89b2a395b545ff
	.xword	0x04deadd057e71199
	.xword	0xc1a34c2ea50daa90
	.xword	0x6cdb932a89ca0482
	.xword	0x8e7a12e01ff4b404
	.xword	0x937a9a71f7463cd8
	.xword	0x20e7b2a7ce4a8e85
	.xword	0xa75f02b724c63c11
	.xword	0xde621db7392b733b
	.xword	0x0489adf931cdf8e8
	.xword	0x8f9ce7d9509e0959
	.xword	0x7b45708f8bf01461
	.xword	0xb4b1cf0ebabf9e02
	.xword	0xdac89f518fefffa8
	.xword	0x47646a79b1c00c7f
	.xword	0xce7dd99927fbb5aa
	.xword	0x80567e08de9b2c5f
	.xword	0x9b7bd883b13bf9c3
	.xword	0x7a0d72560cad6d04
	.xword	0xdcd83bc1bf4ad907
	.xword	0xfbf0b21c9ee29769
	.xword	0x09f69fd0f68e2926
	.xword	0x723e86558efa26ea
	.xword	0x9825e760a4d4712b
	.xword	0x37be8afd91577c7e
	.xword	0xff3ed699e2b7f5e9
	.xword	0x098209822e6c1aeb
	.xword	0x64b2c429e9bd933a
	.xword	0xb53fdaa5921a7e8f
	.xword	0x621f3f0012464758
	.xword	0xa216517e73dce1ef
	.xword	0x28cd884d3c6a4612
	.xword	0x834114319857f1ba
	.xword	0x4c31be6de03b820a
	.xword	0xd08030d80f927520
	.xword	0x1f6303c561656b67
	.xword	0x1292da75d879d0af
	.xword	0x653937bb86d00953
	.xword	0x929a0aef2ebc1a9e
	.xword	0x019651d89ad41d9f
	.xword	0x21ff3560b8b7663d
	.xword	0x772a661142992684
	.xword	0xf62a82fdbdbc6099
	.xword	0x8d4b251ef48e20a4
	.xword	0x1dabde4b2fa410fe
	.xword	0xce7914fa445d19c5
	.xword	0x0c7174aa41028cf2
	.xword	0x11923bcdd964518e
	.xword	0x967f93e6c28b348f
	.xword	0x01d924cfefeb9b8b
	.xword	0xa9060e646bbf89c0
	.xword	0x6ad100337a4c1426
	.xword	0xd28584678c57d22b
	.xword	0x33b7a9343f8f57dc
	.xword	0xe4a57dbd59fd1ef0
	.xword	0xc638f5fff41bd13e
	.xword	0x80ada262b41ed92f
	.xword	0x011ceb3210b9fbd4
	.xword	0x1205912992f3434a
	.xword	0xf75305cf0a46b4ca
	.xword	0x74a1d4a23e1b9fca
	.xword	0xd610bb424283f6a5
	.xword	0x5cbdedbd46ea0034
	.xword	0xfcd0b716399f8a1b
	.xword	0xae2af4da5af1a5cb
	.xword	0x4c07257dbdcf4fda
	.xword	0xd16c5efd13b85529
	.xword	0xa73b1feb095d343c
	.xword	0xf413347529d64535
	.xword	0xb8de6ac48fbf9972
	.xword	0xeb4ba61ba907297f
	.xword	0x71f754ff73dca471
	.xword	0xc1d03a0a89dfd7a8
	.xword	0xa61cca6b0d74deb6
	.xword	0xf78e3d6c8c618ab4
	.xword	0x701fdfd50a138bc4
	.xword	0x7546171b3120338c
	.xword	0x687a545b8cab47d0
	.xword	0xe7e18257cf333923
	.xword	0xc12c8e95cadea990
	.xword	0x3057ae0f9e4d55bc
	.xword	0xa7e86bcebb61911f
	.xword	0x40a81d6bb7546f8d
	.xword	0xb0753c5b10df03fe
	.xword	0xeb77edd60cf277c6
	.xword	0x7ca784bf4902bbdb
	.xword	0x28cdf472cca7ddfb
	.xword	0x091756023f5aea3b
	.xword	0x656887bf4d8db993
	.xword	0x0c17c969f04221e1
	.xword	0x63b3af7d26fb5ac6
	.xword	0xf7e21166b82d6aa1
	.xword	0x097660775641f54b
	.xword	0x8f2f12f5fd74cc93
	.xword	0x8448fd8882dc6acc
	.xword	0xbe9430c590163ac7
	.xword	0xc5cd274060dfeeaa
	.xword	0x2c56202aef90dce4
	.xword	0x267b431fb9e4ba60
	.xword	0xc99cf16f4a2003df
	.xword	0x7a23ec5d63cf5d95
	.xword	0x6ef51e4b5a50bfd0
	.xword	0x02e5fad3369229ec
	.xword	0x20c5bd82a1914d39
	.xword	0x977da3652f827384
	.xword	0x83dc8ab03d3329ce
	.xword	0x239f67eda4b92354
	.xword	0x6c4500683ecaa45a
	.xword	0xc269104515759174
	.xword	0xe8a1c4088d8d3421
	.xword	0x631676139ff114c0
	.xword	0x67b17382318ac82f
	.xword	0xa8822180f8a10999
	.xword	0x6b0a30ba00f44738
	.xword	0x1d13d34961e3e3e5
	.xword	0x4884829c87c16cb1
	.xword	0x3b12dc8eb967b086
	.xword	0x5e471e507856ca1c
	.xword	0xbd9b26b0b006f889
	.xword	0x5f5c0255f88d4baf
	.xword	0xfb445a1d2d2f5a0a
	.xword	0x09ccf44448795cbc
	.xword	0x98a7b3efec2441fe
	.xword	0x955d64f3ee078e6f
	.xword	0x75c9a924c85aa41f
	.xword	0x8f1c64778805bbe8
	.xword	0x1df82034067d6453



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
	.xword	0x11a7493ebcc0b927
	.xword	0xf1cde765c3b9d84d
	.xword	0x8a19b237d4d4080b
	.xword	0x0ea612fb7b6a6d7f
	.xword	0xa3b7d8caff87f261
	.xword	0xaef7cacae42b543c
	.xword	0xd4b4211b32769b90
	.xword	0x639761a29c20ae76
	.xword	0xe88a9f959c4766ff
	.xword	0xce9c345beb9de679
	.xword	0x903b06b36dff1a47
	.xword	0x96b4f07c7cdbdaf0
	.xword	0x4cd7ad1d5e32d20f
	.xword	0x5706ca925f9683dd
	.xword	0x357088e44c74f7c7
	.xword	0x7e5ed6ce7fd8f97f
	.xword	0xac27e34e31b8932e
	.xword	0x8eb4b33ba9c2691b
	.xword	0xe71b4ec33047117c
	.xword	0xb5263b156395b706
	.xword	0x99f92dd22b1c45d8
	.xword	0x8656e62ab80da5b8
	.xword	0xd0714413386b60da
	.xword	0x40087a58079415e4
	.xword	0x1723cdc9b8f18808
	.xword	0x0f7350a5a3e22118
	.xword	0x0f6a9487a3f15d2e
	.xword	0x89d7421104d32a6a
	.xword	0xcf907142932500e9
	.xword	0xfd60a8aa4a84c1f0
	.xword	0xf5977ddbadfe8626
	.xword	0xfeebfe4f2b90292a
	.xword	0x8fe0187bbd296dcb
	.xword	0xd1ef73853509f367
	.xword	0x08e84530cbd9804e
	.xword	0x43c0087a9dd66782
	.xword	0xff892be3d598dc1c
	.xword	0x52ffba56776c99cc
	.xword	0x34421c4fb4bec158
	.xword	0xc79a018c0240d71c
	.xword	0x0cfdddaf164f7169
	.xword	0x746adabd5ffd8fc6
	.xword	0x9ff5928453994a88
	.xword	0x6e8cd5dacb72f2a5
	.xword	0x23bd438018592496
	.xword	0xce98c6da3ea6bd02
	.xword	0xd99e9a2c799d9e4e
	.xword	0x8bcabab41ed3ad4e
	.xword	0x014598207ca40ec8
	.xword	0x7f11443b4a29c5b9
	.xword	0x427344488cc9fa4a
	.xword	0x01bcd0a9d55a353a
	.xword	0x8d5846625388c94d
	.xword	0xded5c095ac3179f2
	.xword	0xe912e560a5e17dd7
	.xword	0xbaadfcd4c2619b52
	.xword	0xd661a929df51b88b
	.xword	0x6140b1f510c1317c
	.xword	0xcf43878d37a88bca
	.xword	0xfdec5dbb2e924b51
	.xword	0x078272b21ef3eb0e
	.xword	0xb845bbed5bda60e4
	.xword	0x48009a6aaf080cb4
	.xword	0xd67d9959515e0d6e
	.xword	0xa820020bcdf91439
	.xword	0x8ad48c68e915f7bc
	.xword	0xaf0111335adb2a58
	.xword	0x4b060f9a7231bfea
	.xword	0x69dc50c53fc6ea03
	.xword	0x373255275e06def3
	.xword	0x683539b9c517aab6
	.xword	0x9e412972bb7d3192
	.xword	0xbff095e2de28ffb6
	.xword	0xd76eeb7de698d4d9
	.xword	0x960a3826d9859ad8
	.xword	0xf7ca7a8ca316b2c3
	.xword	0xdf0a35a1bda72216
	.xword	0x0152225342d36ec4
	.xword	0x6e2781bd5273076e
	.xword	0x4a4b4299eec9c37e
	.xword	0xb5ea2e0bc08ab4cf
	.xword	0x23ec7391875ddde5
	.xword	0xb3e38827fc5be8f6
	.xword	0x15544981930681af
	.xword	0xd1de87bac33090bc
	.xword	0x2a28be3a6440e4ae
	.xword	0xe906934ae217dae3
	.xword	0xb96a44a5f1889213
	.xword	0x751e9e60a2dea516
	.xword	0xfb486a9ac3bab4ec
	.xword	0x12c2f87e82dd093a
	.xword	0x98e124f4b96afa20
	.xword	0xecf1fd087c9debfc
	.xword	0xb5c264d9e8df5477
	.xword	0x628031844a5ce39d
	.xword	0x4e7d4546a3d3f5ba
	.xword	0x84fe96ee2072b08e
	.xword	0x1b0c7599d2035192
	.xword	0x32a2e64f390906e2
	.xword	0xfcea261b4ae7219c
	.xword	0x136a5fc7be0e44cc
	.xword	0x6cac62108f0ef316
	.xword	0x9169413c4ab29b7a
	.xword	0x7b53dc91b723f4a8
	.xword	0xde283226de137d32
	.xword	0x1cc746efebbe1957
	.xword	0x2cdd9e72dbc7bf23
	.xword	0xf5ca5204d7311cc4
	.xword	0xed9059e328a1a779
	.xword	0xbf986ee6c1f9caf4
	.xword	0xff398f9170a54322
	.xword	0x8693dbdff81187a9
	.xword	0x272318b25ccf7079
	.xword	0x84bac635b2063926
	.xword	0xcfd8d537c5613162
	.xword	0x4ca665a2138c09e7
	.xword	0x190589320b6cd293
	.xword	0x53265b7e42bcdca5
	.xword	0xe7e446763c38965b
	.xword	0xda5bf3dd2bac3e70
	.xword	0x6b827f448a8104dc
	.xword	0xa9b390dff4ca41ec
	.xword	0x6b2fcd4c05a82da3
	.xword	0x2998d880f099627d
	.xword	0xdd5ad40dd386737f
	.xword	0x10055e638b0f9050
	.xword	0x9bec1ddc721a46df
	.xword	0x542032560f4e6654
	.xword	0x06443c87a41e2d3d
	.xword	0x039f331e586163d2
	.xword	0x203b7d0cf65f0869
	.xword	0x3820d9d3a573d78a
	.xword	0xd4241a76862fd1fd
	.xword	0xb07cd008e02020ff
	.xword	0x3ca2adfe2729e9c4
	.xword	0x38bcf33ca7e2b195
	.xword	0xedd7f267725139a4
	.xword	0x32d90b47716bd866
	.xword	0x8e5cbf0ac7f7e3f8
	.xword	0x2a0c475c8ff4b3d7
	.xword	0x46620334d9a13bec
	.xword	0xdcce85c03933ffca
	.xword	0xddb6f45f654af6d7
	.xword	0x8cbd5b407e6d90f7
	.xword	0xd8fa9d91eb6d3b87
	.xword	0x0fa9db7c15095822
	.xword	0x140015aaecc9f4aa
	.xword	0xd2f9dbca253c5b53
	.xword	0xdfa6b864b0c7d585
	.xword	0x813cdeeb1a7aa8af
	.xword	0xe69f37c066b7998a
	.xword	0x9498ad9d0c179a4c
	.xword	0xb81840e25e68ec58
	.xword	0x92a7452426782abe
	.xword	0x248dc97d4d3de686
	.xword	0x722bef1614355f3c
	.xword	0x4fea9fc3271b848c
	.xword	0xc913e6db7b0abe69
	.xword	0x2b60e45e524e1836
	.xword	0xa9bbc44619aef748
	.xword	0x0d5367b74984b6f9
	.xword	0x6a71d8eaff89b0cd
	.xword	0xc90a9a1c6c86225e
	.xword	0x4e382452d7ac438f
	.xword	0x82d8c402203e9853
	.xword	0xdbf1065291907173
	.xword	0x4ffc7369af07f21d
	.xword	0xa7877b7b026c5676
	.xword	0xd85043d719efad50
	.xword	0x051dc571f7a45167
	.xword	0x3799484dc78eed13
	.xword	0x4745148e7ff13b67
	.xword	0x38835d884340a61f
	.xword	0x65a32a93026fac80
	.xword	0x2bff939bda6f01f6
	.xword	0xab2a0e248abcd744
	.xword	0x0da3576fe60bb776
	.xword	0x5ee4b9c4380ae76a
	.xword	0x846713fa85fcdba4
	.xword	0xa43435dc086012a3
	.xword	0x5476913690b0108b
	.xword	0xf196c4cb72e8979f
	.xword	0xca4c57c40d272541
	.xword	0xfd9b509a7c8c55ad
	.xword	0x831363219a16a99e
	.xword	0x53fee2ddf378a093
	.xword	0x15c43e670c29e8b9
	.xword	0xe8777e62ea64bb3f
	.xword	0x4c189fd9659dc98a
	.xword	0x4210084f7d6aa7cf
	.xword	0x06e927e39c4899fa
	.xword	0xeb085f2d0552d2eb
	.xword	0xcb347408f064ab31
	.xword	0x6110e5b609739c22
	.xword	0xfd90f95fb9d0bb9a
	.xword	0x57cbf7ef3067a489
	.xword	0xd7d7a5e642527dcf
	.xword	0xd808d76e79f2c35a
	.xword	0x4ee66173288f6258
	.xword	0x3656bfa38a2a866c
	.xword	0x165b7fe814ff8f2c
	.xword	0xb68781c25117cbca
	.xword	0x8d09a6f671ac7819
	.xword	0x7854ef053d5dc7f5
	.xword	0x49df1e6fcf663487
	.xword	0xfa4cba4e49bedf83
	.xword	0xee43ba57c7159bd9
	.xword	0x1b33a95097a6e717
	.xword	0xa07ee57516276924
	.xword	0x72f52c49a1c7def3
	.xword	0xcb44469dc53715a7
	.xword	0xf2c481d442f58109
	.xword	0x8783638eaa03e217
	.xword	0xce5c50514cb17bf1
	.xword	0x3912ac0892540d09
	.xword	0xbbd2d42d4b0b51d6
	.xword	0x2b2fc4839e5aae7e
	.xword	0xd792a1a1572d9451
	.xword	0xa8fdc1b237b9f7bc
	.xword	0x166f37c81873f59b
	.xword	0x534f6e4bb5fbc411
	.xword	0xcfc6bc70b20f051a
	.xword	0x9c796a3d8cc9f23f
	.xword	0x47da018a20857c7d
	.xword	0xe88f1c1edcc8acff
	.xword	0x83a41ff9bc9c090d
	.xword	0xbe45eace893d1f74
	.xword	0x2629de257aa826da
	.xword	0xdc8b64aaa0bcc494
	.xword	0xbd67ca11ca73a78e
	.xword	0xf47e8e1fa86325d0
	.xword	0x058c4eab13761cb0
	.xword	0xb17254063a036eba
	.xword	0xc61940f651377948
	.xword	0x3bac426faaedce8e
	.xword	0xef02f63814c1c55f
	.xword	0x7b390f91bc92515d
	.xword	0x12695f58be5b54df
	.xword	0x23f13c0e99bfdcd9
	.xword	0x831f13726c1c7e5c
	.xword	0xe49ca59a770a943f
	.xword	0x13e4eee92acff197
	.xword	0x624039ba153ab710
	.xword	0x13f056e860a808a8
	.xword	0xc102e36bd0929d6a
	.xword	0x3fe8f0a5b0808650
	.xword	0x9aa98e628070f120
	.xword	0x9ea1714ab8359dec
	.xword	0xf29f86db5037fa82
	.xword	0xec26b98d9fec4146
	.xword	0x9bc83441e248feb7
	.xword	0xead702b17092bf11
	.xword	0x017b395476933b3c
	.xword	0x0b464ee9145822ae
	.xword	0x3990abbf7ef19cf6
	.xword	0x589b87febf98976f



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
	.xword	0xf9e8cd3514cc0b69
	.xword	0xb9ba4f3029fc8c33
	.xword	0xb7396765fa61d5a8
	.xword	0xd1632758a07a913c
	.xword	0x4be0aafebb1f090d
	.xword	0x7076fc10119e22a3
	.xword	0xeb1f30a3bc8a5304
	.xword	0x2bb5df2f973d95a4
	.xword	0x2b1a2a426d924655
	.xword	0x1e62c6027ea6f4be
	.xword	0x1276adf744e20146
	.xword	0x69cd268cb7736591
	.xword	0x201fb04761a4378b
	.xword	0xdf2535098b21bab9
	.xword	0x75605641a24d7a1a
	.xword	0x63bea9cfff1c4866
	.xword	0xf65620e990903c49
	.xword	0x93375556aaee870d
	.xword	0x848acaef5b08e081
	.xword	0x388dd48bb1ffca66
	.xword	0x0c9724c5f74d1c44
	.xword	0x28ea12f1cb0a5aea
	.xword	0x202efb4ff1f54314
	.xword	0x6a0fd9ba58b3bf36
	.xword	0xbf35fdcec609dcf2
	.xword	0x55261a0e8e4eb1ed
	.xword	0xdb2132ec7170354b
	.xword	0x9b4519e2f795fed0
	.xword	0x21f1822f852a5a0d
	.xword	0x8a6a9499c8ab1296
	.xword	0x4ef4012b6b40897b
	.xword	0x124f5d679a5a542d
	.xword	0x39ee3ad543d17e86
	.xword	0x31ea6354e0c6da62
	.xword	0xedc3d1d6c680fdad
	.xword	0xdd41eb0bce3d104d
	.xword	0x519885f9fa9986ff
	.xword	0xde3982996b139b1d
	.xword	0xddae56b7daae090a
	.xword	0x00c86d110747372a
	.xword	0x231211e492020af4
	.xword	0x7bb14fba706083c1
	.xword	0xdc707776eee6dc60
	.xword	0xcb54ede8a6294fc5
	.xword	0x0b6599d8b968c278
	.xword	0xa31c37ed2428b8d7
	.xword	0xf74006784f868917
	.xword	0x4feab117ba34c8f7
	.xword	0x6b689f309b930608
	.xword	0x6d82bd89eb663f04
	.xword	0x310a40fc902dc762
	.xword	0x88320f5e5fe7f733
	.xword	0xdb19257fdad594c6
	.xword	0xa128741b187bbf6e
	.xword	0xe9f015398e1868fc
	.xword	0x7df47dded6e65665
	.xword	0x4cb331977a7dfea6
	.xword	0xf98d96f40d50494b
	.xword	0x2c9e592179d1d417
	.xword	0xa12a0899dd199438
	.xword	0xe8250857a0c79131
	.xword	0xed7313e56335457b
	.xword	0x35e8ec390b32159d
	.xword	0xfdd33f8583dddfa7
	.xword	0x5f36905056fd565f
	.xword	0x015e0ad750c4bb09
	.xword	0x2904f9004c203feb
	.xword	0x33f62610f3ed0e0e
	.xword	0x6ffea40a2bfe3a9c
	.xword	0x8908a898ae1bf245
	.xword	0xc1278a8c81d297d8
	.xword	0x80f395149ef8abf0
	.xword	0x323e8782aaa36cae
	.xword	0xda303e4500b52552
	.xword	0x34f77f068638ef54
	.xword	0xfe06b3172f36b9ce
	.xword	0xa66eff51c4cd2dc3
	.xword	0x3372ea6bcb0f1850
	.xword	0xe8d64bafda4df633
	.xword	0x5ad15decd7dac9eb
	.xword	0x48ca39b5243763a5
	.xword	0x74f4fd44b12f8a1b
	.xword	0x50a38af96391fd07
	.xword	0xd9acb086ed467bdc
	.xword	0xd7e7ce854be2a70f
	.xword	0x37585573fa393dc6
	.xword	0x03a830a7406996f4
	.xword	0x8260bc7a726ef861
	.xword	0x8e0354f9b57e526b
	.xword	0x0d87b238bec98542
	.xword	0x8e9e502f77c1bf0a
	.xword	0xeb06df5b20854205
	.xword	0xd59f04c4fac45bcc
	.xword	0x66887d5c35353755
	.xword	0xaafe2ba7ecdc3dff
	.xword	0x1cf128cd6571e183
	.xword	0xb833597ded1bb124
	.xword	0x26b944aecc0e889a
	.xword	0x3ca757ffd0c85c66
	.xword	0x973860748aa3302f
	.xword	0x4f72426394da394f
	.xword	0x64bccc27cf715b56
	.xword	0x4d2057e6a402c0dc
	.xword	0xb00c7d9c1e0650ad
	.xword	0x7bd56009f84939df
	.xword	0xe4b3db38b7956ed9
	.xword	0x2a89493df642891c
	.xword	0x8dd0f80a5e21501e
	.xword	0x079729cd81ae0182
	.xword	0xbfad46f4dfae82e3
	.xword	0xf59661c213ace8a3
	.xword	0xf9ba84788cb4120a
	.xword	0xd7fc3b6306a41585
	.xword	0x9bca0b8ad17c1704
	.xword	0x56baa93c837fd6ae
	.xword	0x4317318a223478db
	.xword	0x4cded03164617cbc
	.xword	0xd84db6c8868ba27c
	.xword	0x7edf2acc34bd8130
	.xword	0x6eea303d2db3b699
	.xword	0x2f440d449af193b1
	.xword	0xd4455a55a1aebf0a
	.xword	0xedae75695c41b4a7
	.xword	0x3b667b7c6c2a35f4
	.xword	0xe97d265ff74c1740
	.xword	0x5dad5e9de6e78a52
	.xword	0x467af4c81c8f9a7a
	.xword	0xabdd5562fed49ba2
	.xword	0x770c3d3b316295fc
	.xword	0xbb043283aec22980
	.xword	0x93b9362f189a24cc
	.xword	0x26e039975f7a9c13
	.xword	0x4f991cdba922265c
	.xword	0x04b527262beba164
	.xword	0x501541c2333ff1f1
	.xword	0xb97bb67eef1e30ab
	.xword	0x6c02dd87e1123228
	.xword	0x673f4295575c23c5
	.xword	0x0b2d35431636daa4
	.xword	0x5d1cccbb099fd471
	.xword	0x91860075ecd8c097
	.xword	0x3ab86a5e727ddc57
	.xword	0xbd4bfa3b38edf4eb
	.xword	0xb41b1140be5bfdbc
	.xword	0xa1cb7a7e13868b2a
	.xword	0x24a1f19b529a6c1c
	.xword	0xe21162378e0e1cc8
	.xword	0x0e9d43ea41c61587
	.xword	0xcfb7e8eea3eb7931
	.xword	0x2e55b2cc2c0ecc1b
	.xword	0xb114c42a047d6bef
	.xword	0xf3dcca253f965c77
	.xword	0xed57d6da27d29594
	.xword	0xebbe0874fb8f14d0
	.xword	0xb8c797ce36ae78b4
	.xword	0xdde0a8a33c01f8af
	.xword	0xaeb0f3166c39e5a3
	.xword	0x4a4aa99de46cc3f6
	.xword	0xc06f320c2f16513d
	.xword	0x60d4ece752f64045
	.xword	0xea1a2e47520cf730
	.xword	0x6322429c5e0d98b8
	.xword	0x1221bb8f0cec70db
	.xword	0x30821bf8d5b07f5f
	.xword	0x7c21dd7823d74a50
	.xword	0x632115bb09d7c384
	.xword	0x1d15c2d5c3f25ee8
	.xword	0x22a975e2523f2a2a
	.xword	0x76409fc0c30920fa
	.xword	0x103179c08fb5bb25
	.xword	0xd5de14983a71ba74
	.xword	0x9fc04ec0011dbb74
	.xword	0x45327d5227fff97f
	.xword	0x8eb6d0d95dbcb6bd
	.xword	0x0a37df383abf89d7
	.xword	0x9117b31f3932609f
	.xword	0x9836ef32d2556ede
	.xword	0xc781054057b92c32
	.xword	0x22700bba730dbb53
	.xword	0x409ffe8d30e52f24
	.xword	0xedb84aaac788b89e
	.xword	0x13e44ebd590e145a
	.xword	0x3f97e7923b73d3f8
	.xword	0x9470f50fcb7cbb0d
	.xword	0xfe1ef6ee401fc8bb
	.xword	0x84fe1e40c5d76dce
	.xword	0xfb97f65a7c635cfa
	.xword	0x3a172034dd67b954
	.xword	0xef89197ad23f37a7
	.xword	0xb56f5fa78e9c6390
	.xword	0xe897fa98061041ea
	.xword	0xca836051f262021d
	.xword	0x94e17daa01b02d37
	.xword	0xf7619a062cf32ecb
	.xword	0x94e47aaa77fd7101
	.xword	0x979263730d686c3c
	.xword	0xc615a6436c07d9ed
	.xword	0xc11060125134c7d4
	.xword	0x7ecae4ea0d821c33
	.xword	0xb15de88c99dacc22
	.xword	0x9a98383d7742b627
	.xword	0xd09562a1a2e62cb1
	.xword	0xeb094a764c611d1c
	.xword	0xc3eabeb9687453b4
	.xword	0x0ea632fb28016a67
	.xword	0xb7be2d36ad78309f
	.xword	0xaeb99c9a39d29ef9
	.xword	0x73dd55cd6097fcfb
	.xword	0x8b291f7fce16f9ec
	.xword	0x18a86ce34622163e
	.xword	0x02ee151430c159c6
	.xword	0xd83067867aa97b70
	.xword	0x2fec806117a96eff
	.xword	0x57bdf56b19ac7d02
	.xword	0x5f14dcf669ad39d1
	.xword	0x57c7ac000dc30a1c
	.xword	0x6064ae01abed8b54
	.xword	0x287569d670bca2db
	.xword	0x24a734890e67f1b2
	.xword	0x4ac97be78264ea81
	.xword	0x7a860ddba6c677cf
	.xword	0x1d5883dbd88abf1e
	.xword	0xc2fcca214a2d74b3
	.xword	0xba738d1b4aeaf67d
	.xword	0x3680eea574684ad6
	.xword	0x5fdfa9ecb0b9cefe
	.xword	0x5b0b4557b1a18867
	.xword	0x5b3a3045ab2dd38a
	.xword	0xbe43712aec318f76
	.xword	0x276f5f6689f47028
	.xword	0xc4f3a19ebe95449c
	.xword	0x8d64982e049799c8
	.xword	0xcd2df9437d028670
	.xword	0x113942481edad34c
	.xword	0xf9e310faa7b35d22
	.xword	0x782c19fe1dca98d6
	.xword	0x18b14fef560ccc75
	.xword	0x8dc364d3efad083a
	.xword	0x783fc6432672451f
	.xword	0xe77041445aa9bf83
	.xword	0xfdefc6bc6005b263
	.xword	0x6e0c16852b1fec58
	.xword	0x96428ce8483d762a
	.xword	0xceb18e32654d82a2
	.xword	0xc6d2f1572ba47599
	.xword	0x516d1316ceb036ac
	.xword	0xbca9548f426576f4
	.xword	0xfc687de82afc6a5d
	.xword	0xee8df2f402d65cd2
	.xword	0x311587f77d34fd3e
	.xword	0x3a34363371c954f6
	.xword	0x1bf8cc209c3069c4
	.xword	0x2bd74d7303c7cb64
	.xword	0xb7a5ef5eef608a93
	.xword	0x83b0bb273e94132d
	.xword	0x8fed07923b0a5788



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
	.xword	0xf8152d1cd814e00b
	.xword	0x002d6981d8fdcfa5
	.xword	0x8663a4f0a9697bc0
	.xword	0x70f6155177572ef4
	.xword	0xffb654f63281bce3
	.xword	0x5483d641f815c9e5
	.xword	0x32c535089f5fff05
	.xword	0x48c30c6d0dcf4de7
	.xword	0x07e733b531748ec2
	.xword	0x2d2bf9ab7c5b7ed2
	.xword	0x2ae7dfb2c2316693
	.xword	0x62427793580ec9b2
	.xword	0x48ad280738b43c0e
	.xword	0xb05d331018b93113
	.xword	0x659cf55b63ea3f2c
	.xword	0x86e39f325f21d43b
	.xword	0x715f89c8e383910b
	.xword	0x525d5be3048a966b
	.xword	0xd5126c897393bb59
	.xword	0xa9320978dc84c47a
	.xword	0xa27b7da0f55cfce7
	.xword	0xdec897e32b2d14d9
	.xword	0x87e30b6b57522818
	.xword	0xfa25db0e4412f62c
	.xword	0xd1cb9b8b1951f8df
	.xword	0x72977ac5f5e62f8a
	.xword	0x8cd60fb26acd682d
	.xword	0x247d35319de74de1
	.xword	0xbff5e783d06e8ca3
	.xword	0xdaf8ea3f4263ea3e
	.xword	0x649a7069e396c46d
	.xword	0x8472cd03f17206f7
	.xword	0x1b0e8d26af6cd25f
	.xword	0x320b7a3429d7580d
	.xword	0x2ca8338cd9b821a2
	.xword	0x2ac68038b343dd32
	.xword	0xa49ee46d5e182841
	.xword	0x69efc66a94db790c
	.xword	0x26a77318b1d09fdd
	.xword	0xc0651817188f60ee
	.xword	0x5b064911118f27b4
	.xword	0x003b291b663516ee
	.xword	0x3b52a39329e7c863
	.xword	0x395df6bb98dde0c1
	.xword	0xf35d7e97de3f1fee
	.xword	0x35ab8e421fd2eb14
	.xword	0xc655be3652662d49
	.xword	0x133c02b241d93c31
	.xword	0xa423a746ecd409fe
	.xword	0x90b0dd705d69ce57
	.xword	0x6e77589b7262c9bb
	.xword	0x485aec9f2ebb2131
	.xword	0x9b82c341f4638b71
	.xword	0xab325585de93de2f
	.xword	0xaf433f6361c9e823
	.xword	0x8e561962b521051c
	.xword	0x2ff27bceeca04c3b
	.xword	0x6e049d8ffe7d331c
	.xword	0xa9435352f60783a1
	.xword	0x28954847da2a6eaa
	.xword	0xba0f979186a8618d
	.xword	0x9bd8e016087e77e9
	.xword	0x35d6d1a4250bab48
	.xword	0xf2fe575c74e7f2d2
	.xword	0x67fdff4a82b497bc
	.xword	0xe30cbedb3f30709f
	.xword	0xc5de186bc3c3f72e
	.xword	0x11f4d42df719e299
	.xword	0xedda6570360a3266
	.xword	0x925758b0d4dba2b0
	.xword	0xbd37a03087024ef8
	.xword	0xc5d72bc85ff3c583
	.xword	0x4b0d731b704c9fdc
	.xword	0x59cecb23bed2c8a7
	.xword	0xf56a6b1870834db3
	.xword	0x9bf92f75086e0e2e
	.xword	0xcea9c1c0290f9e5f
	.xword	0x5e943a08feb54b74
	.xword	0x720d9b69d54b0442
	.xword	0x95775698a6eea0b6
	.xword	0x8011e30ed3a7bb53
	.xword	0xe66b7fbd75e503d8
	.xword	0x02ab04007d22c26d
	.xword	0x6ac1a7df0a38e9b9
	.xword	0xb3e7749e254415c2
	.xword	0xc72f47211a3e7f0b
	.xword	0x1f364cedd678e504
	.xword	0xb3aa91a290aee13c
	.xword	0x3a74e71196fffe6f
	.xword	0x298eac4385679f34
	.xword	0x2793267a3c044448
	.xword	0xb5945f76e9b4d720
	.xword	0x7ab810f67c0adf60
	.xword	0x9e5588d3d583ce77
	.xword	0x182159c0447ca1ee
	.xword	0x776c99cb1f8815bd
	.xword	0xaedfb819e75b8a73
	.xword	0xd76be6429e3d4fd3
	.xword	0xe5d1bb8f2a751466
	.xword	0xe7dfa4fa7921a5a2
	.xword	0x2eabe2c63effa5e7
	.xword	0x535ba96592ec20d9
	.xword	0x0dd7fa12e5aac25d
	.xword	0x21b6698230a097ff
	.xword	0xb899e723fe91e60a
	.xword	0x7364b1f5960cd93a
	.xword	0x7e3fd482fced22e5
	.xword	0x27076a333193113e
	.xword	0xb1178665f1522b9d
	.xword	0x12a2b7c1075e4ba2
	.xword	0x0b5c77780c8cb7bb
	.xword	0xbb9cc04da899a117
	.xword	0xf662b7bb3c41d86d
	.xword	0xe880161f5f2eba23
	.xword	0x2ec5ae76421a0b32
	.xword	0x1b75bd5c15374a84
	.xword	0xd603016e206db566
	.xword	0x8b2e3ec615706e74
	.xword	0x0156db92af4fc88c
	.xword	0x7a589ea799a26b44
	.xword	0xd02871b1d241acdd
	.xword	0x03be18e11e7d3602
	.xword	0xf256e74345ea9a64
	.xword	0x6e3938558f14d012
	.xword	0x2ba3b4417f1c555d
	.xword	0xfb142ecaa489da0e
	.xword	0xb7c12a601d4a33e8
	.xword	0xfc2c4b70270f3391
	.xword	0x677202674168112b
	.xword	0x37702c96108f485a
	.xword	0x2ce41e6b947d3eb3
	.xword	0x20b227b555f7033b
	.xword	0x38b5df367a2f26b6
	.xword	0x020b4dd5e6f2da18
	.xword	0x1ccfc1ffc3c841b6
	.xword	0x666faa77421434ba
	.xword	0x64ec301958b67777
	.xword	0x91d65243115505ca
	.xword	0xeb505afd98e3eedd
	.xword	0xaec916949f0d0580
	.xword	0xa15be7fdcbadf6cb
	.xword	0x7382e4404e3fe188
	.xword	0x93e906c001f9926a
	.xword	0xa29e8e8b4c8c7388
	.xword	0x1f46109b9f31c9ca
	.xword	0xe9db72db5706a034
	.xword	0xd8f4a2f51266c063
	.xword	0x6801738b550c2c56
	.xword	0x881d5da516947f2c
	.xword	0xf75aeaef267189ef
	.xword	0xb78f5a6692af6bda
	.xword	0x0f555602b48bc6b1
	.xword	0x72923719ae275e57
	.xword	0x48d59cb2fef52d8f
	.xword	0xb40efea9d3d2448e
	.xword	0x06bcba0731bea9aa
	.xword	0x4176a09e6454c795
	.xword	0x64dfad8bbde9616b
	.xword	0xe36d9fa16e20baae
	.xword	0x83a17aa9b0cba721
	.xword	0x6595b9a6ef7ea34d
	.xword	0x3a48d05d74a2a056
	.xword	0x27a0a72ddcaefcf5
	.xword	0x0dd85e3b29c126ae
	.xword	0xe21b6611fa92450e
	.xword	0x32d4233613b58681
	.xword	0x64f474b422c5f22c
	.xword	0xf68e537b59cd6e3f
	.xword	0x302137885926c195
	.xword	0x7a45b278a8117c47
	.xword	0x4070321b67d3aeb7
	.xword	0x547a4d7c10d207cb
	.xword	0x4d5965b07e91da5f
	.xword	0xaf5661c983b82b1c
	.xword	0x7a1045707a763219
	.xword	0x3098a72b8adf5a32
	.xword	0xcf3849ad8fdc36ad
	.xword	0x33dc4fe7bc6d07db
	.xword	0x3beeec4f01780b5d
	.xword	0xdeef22d6ea4aa6ec
	.xword	0x19dbcde9a03371bb
	.xword	0xd41f8b7a4cbe609a
	.xword	0x8e951fce7443a9d5
	.xword	0xa4581dfabed259e8
	.xword	0x66abf627a5fc2424
	.xword	0xb47318916ca35e2a
	.xword	0xc76b7281b8c44b6e
	.xword	0x061d64e2f6873c28
	.xword	0x6c517909401a9336
	.xword	0xf72aeac0babda8b2
	.xword	0x13f91e953ca5f34c
	.xword	0xb3a859e68515bc81
	.xword	0xfce187542e165a8d
	.xword	0x253a3863f3030cb6
	.xword	0xef87602bbfca09bf
	.xword	0xa38ac3d0f675ffa7
	.xword	0x1fe83e5e2a17d4db
	.xword	0x16c903b7d562cbc9
	.xword	0x194d6ce194e091f1
	.xword	0x5b06c1ff4fc72897
	.xword	0x03142d6871c1aa8b
	.xword	0xd6d1db41b21fc75a
	.xword	0xadae22cd8a422cec
	.xword	0xbbdacccfb283fadd
	.xword	0x4d2ce6fd4ddfb802
	.xword	0x20823b1b5d96cffe
	.xword	0x44cab3b5b48e88e2
	.xword	0x428963d85ef2e449
	.xword	0x05b91b5fef4458e2
	.xword	0xde8bbd679a2039bb
	.xword	0x0d0934a1aa698587
	.xword	0x4a47e8a19ef3705d
	.xword	0xb2c5036621fc508b
	.xword	0x931b26a4acdef462
	.xword	0xb674a11d03363c56
	.xword	0xf09369156aafcdcb
	.xword	0xc9ceca9fd37e7bfc
	.xword	0xa6b33b52f3dcafeb
	.xword	0xfe221c341e2f11fa
	.xword	0x5825569342a57caa
	.xword	0x862c7dcc24347e74
	.xword	0x0bd59f30d552bfef
	.xword	0x38d1bb0c45d18938
	.xword	0x8a40f552a84f4c0b
	.xword	0xf112f4643d4a784c
	.xword	0x5b22e015f384dcc2
	.xword	0x317faf0bf13eeaa6
	.xword	0xfe27078c2b818714
	.xword	0x73112c5400267ce2
	.xword	0x49ccafecfde3f373
	.xword	0xd0afd35db0fc9648
	.xword	0x317a59dbdf6b8cf8
	.xword	0x41867a3dc5cda340
	.xword	0x5dc724ea563751d5
	.xword	0xf2c41e6d52495b1b
	.xword	0x81b467a0807c1fe8
	.xword	0x6a9d3b2068d84009
	.xword	0x26e97d9f78a50b58
	.xword	0x196b22b03ae11970
	.xword	0xade3739cf8eb56e6
	.xword	0xeafd45f77f2c05a6
	.xword	0xc46199aae4707a0d
	.xword	0xbc2749e65c2a557f
	.xword	0xc41444816a898ded
	.xword	0xb313b48f9bfa37bb
	.xword	0x8d9adc1e4340181a
	.xword	0x3623cc7853491b0a
	.xword	0xf66fdc7d00ab849c
	.xword	0x7dc1cab5f69c649c
	.xword	0x759a928077b83144
	.xword	0xa909a9969c333b50
	.xword	0xe3c2e6929868bb6b
	.xword	0x506f44884bb7826e
	.xword	0xf86355911c4accc6
	.xword	0x9aac1dcfffb545d4
	.xword	0x5ec4879261b6564b



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
	.xword	0xca946e34b7d73581
	.xword	0xc6f889b9d7bd09a8
	.xword	0x733e5878ec122e6b
	.xword	0x4ec4d1ecfecd9ae8
	.xword	0xccfba0b1d044bb42
	.xword	0xbde82a86167f8dd4
	.xword	0xd1029d865a349149
	.xword	0x4a5f305d6d2a1cc2
	.xword	0xb029e5d2b468af45
	.xword	0x1840a34c9395ab71
	.xword	0xcba4c1209b9bb409
	.xword	0xf79d0c864f9bd99d
	.xword	0x5e8b489568a704b0
	.xword	0x1e301a14f972c297
	.xword	0xf2cda08cf4450cdc
	.xword	0x45aa415090609690
	.xword	0xa4cd84d72f95935f
	.xword	0x4112a497d744ae1e
	.xword	0x41746505d14db28e
	.xword	0x82021bbd1b7cfdf0
	.xword	0x9fa6476cbc3b245a
	.xword	0x9f96b4509574b9e3
	.xword	0xeaddfaa72fd90987
	.xword	0x98115483e64c7456
	.xword	0xc66b9e2b74c3c779
	.xword	0x52642dd18466efd2
	.xword	0xd1c7e13f1ee06164
	.xword	0x84bf47a553bce3fe
	.xword	0xb048a4915969d863
	.xword	0xdd5db438ce641f32
	.xword	0x4b65400f51d3a2cc
	.xword	0x0f1daa40a38de9cb
	.xword	0x1890b9b34e9d4a00
	.xword	0x7f78c1984dee95bd
	.xword	0xb12492c832a8ff4c
	.xword	0x50dd4c4c2a1d9e11
	.xword	0x2406730cceb7c99e
	.xword	0xd90bdbc9e4509945
	.xword	0xcb72daae705c714b
	.xword	0x08a983c2b397c239
	.xword	0xcc9dd83d145dab41
	.xword	0xa2745ace91c9442a
	.xword	0x6056cabc5e501c91
	.xword	0xcde56df959a43716
	.xword	0x6a7a8e0bd4ffdd12
	.xword	0x109e7e71a9271a67
	.xword	0xb1c8be6877004aa5
	.xword	0x8e1b622762e9f776
	.xword	0xad65b3886edeb0f2
	.xword	0xb1012157679c96c5
	.xword	0x6ee13151374d1746
	.xword	0x28a6b4391ae2ca6e
	.xword	0xddcf4b5045cf0709
	.xword	0x3bde466b7b22fc0d
	.xword	0x68937f68662a0e8f
	.xword	0x8810ff3db5168495
	.xword	0xf0e01a6ffeeaec1a
	.xword	0x8c8684fb094a4b43
	.xword	0xc0f7d02b6643f92d
	.xword	0x394d6d81b9a23724
	.xword	0xcf4af84951509d28
	.xword	0x7e8b9583c853d497
	.xword	0xba1d5b7134c420dc
	.xword	0xae96c4608f1d657a
	.xword	0xb3803ddac20ee5e6
	.xword	0x7b7b0a15322ec9f2
	.xword	0x090bd7319fda63d1
	.xword	0x9486d3529bfcf4f5
	.xword	0xc4f69a244980dadb
	.xword	0x1c11bdaabd6d563e
	.xword	0x7e6fabdeb7b97b7b
	.xword	0xab1ec94acfd3b1f3
	.xword	0xf41acf809ac5841a
	.xword	0x4c26b510af42f2bc
	.xword	0xac3e1f5f0f981773
	.xword	0x8d2f50750a465f98
	.xword	0xc86335bfd04fa0ce
	.xword	0xb4d12f694ae02089
	.xword	0x5655c49674629068
	.xword	0xd13cfca5af7eb464
	.xword	0x9f531a8c00fe8a09
	.xword	0x40ac7f1f8c6cf066
	.xword	0xff5847b899976da3
	.xword	0x2e819608a82aefee
	.xword	0xa96093e9adb9b31f
	.xword	0x08f1cacd1e22e1b1
	.xword	0xd0d61f1888dd1849
	.xword	0x4ae48e73ab55c5be
	.xword	0x7bee2e2f58d7d999
	.xword	0x57d585ec9fdd3725
	.xword	0x339bde59d75ab013
	.xword	0xb03f6c3fb0fe0cf6
	.xword	0xd72e2e27ccd0888c
	.xword	0xccf1a9a6c25303d6
	.xword	0xe2c6baf47a12cc53
	.xword	0xc89be6884937f471
	.xword	0x42fd3f99469b92c0
	.xword	0xc06051ec61d720f8
	.xword	0xd582bd56523ba9ff
	.xword	0xe5c4a0dc82dee9db
	.xword	0x11b1f2833d2021d3
	.xword	0xb6c75c8892bf7ea8
	.xword	0x159699443998d614
	.xword	0x77f5f8e98aa4ff49
	.xword	0xadb8141820c88858
	.xword	0x5daec1a61f7cfac7
	.xword	0xa49790e8d535ad50
	.xword	0x146d811a2a71477c
	.xword	0x8926f68385b9e65b
	.xword	0x10342e0b5f158416
	.xword	0xda88f02e88c43e2f
	.xword	0x9dfc9495142835cb
	.xword	0xa9f525b6e993ef76
	.xword	0xee6bdaf4380ada77
	.xword	0x58b55fa2d71f0e9a
	.xword	0xdd8193413bb0bfe3
	.xword	0xe756263923e750fe
	.xword	0x55e9725b6f49620b
	.xword	0x9d7ae654d37edfc4
	.xword	0xebae52718f73af74
	.xword	0xd08096bff2eff874
	.xword	0x9350e63e6749d9e3
	.xword	0xfc3bdfacca674abb
	.xword	0xc737fa3ecba96823
	.xword	0x36070051260e3070
	.xword	0x31f0eac311fc0b80
	.xword	0x7da9289877f505ca
	.xword	0x36227bf73e04e7f1
	.xword	0x72fb360f68b0d65d
	.xword	0xf2b6e17b4db2f476
	.xword	0xbc1ce0faf8f5c3c6
	.xword	0x7bc15b5b36b80c97
	.xword	0x8151877d9d17327c
	.xword	0xfecbdc6b88e06fba
	.xword	0x2632e4017bb8420d
	.xword	0xe4ddcbe6f6576620
	.xword	0x6570844b5e76653c
	.xword	0x54ad61cfb6570a2e
	.xword	0xe6fd65f0ee2fc0fd
	.xword	0x40ea141d4953b97b
	.xword	0xeed150b74bf0b514
	.xword	0xe939936133085e58
	.xword	0xf57920d7e80e6bde
	.xword	0xc8c8f4fbfdd9830a
	.xword	0x85ee29cfa17bb723
	.xword	0x96bbfe74b54fc013
	.xword	0x307b98f28149660d
	.xword	0xfc9bc2d70292b527
	.xword	0x4db51d247b2c98f7
	.xword	0xd682170c918b0959
	.xword	0xd7872990e9ad1586
	.xword	0xdcf5bd76e21ebd3a
	.xword	0x8fd1daee78a2b7d2
	.xword	0xed9d42247e8c92a8
	.xword	0x15aff4e4432e4c59
	.xword	0xfa7cd51277dc9631
	.xword	0x92dc76078bd307b2
	.xword	0x467752258172e272
	.xword	0xc041449fcd7a5929
	.xword	0x54dda688fe9eba7f
	.xword	0x850b87ac63bd2881
	.xword	0xa28f65ded438e553
	.xword	0x7d07f1cff0d496d0
	.xword	0x99b7e6bd5ebb4889
	.xword	0x85b83d6c1e6c4560
	.xword	0xe2a5d6433066cf0a
	.xword	0xaef7b714874ecace
	.xword	0x72c09e619eb1a0d2
	.xword	0x624ed61c7eaea329
	.xword	0x1c1682878d626765
	.xword	0x0a321744716f7f97
	.xword	0x09578c5fe222c7be
	.xword	0x08071bdbcdab50b6
	.xword	0x49ad2d8b88bd6a3d
	.xword	0x53c1843f3881179a
	.xword	0xa8fbb1245e6ff4af
	.xword	0x31ef4a762cd57e75
	.xword	0x79c55c47ff8a8b1e
	.xword	0x6bde17f89e82dc08
	.xword	0x4d6bc6cbd95c5c00
	.xword	0x8cb75d90b2277813
	.xword	0x1c570e87d47cc6c9
	.xword	0x98f1b175e8d8c484
	.xword	0xd5a15949e864e61f
	.xword	0x491b16128601874c
	.xword	0xe038dcba813e2364
	.xword	0x83d7a6bcd449bc4c
	.xword	0x96da3d768adc6b3d
	.xword	0xaf56ed2e9e722668
	.xword	0xe35818ab1b8f29d2
	.xword	0x690a09d545007a43
	.xword	0x3ba23b9efc07c71a
	.xword	0x2804909313575658
	.xword	0x93da15ff30b6dbfc
	.xword	0xbd5d2b4f80b8dea1
	.xword	0x5929a5d4b71c3577
	.xword	0xdb97e2da9a73419e
	.xword	0xa8a0a703959910d1
	.xword	0x8c1a20f1d11ef24c
	.xword	0x69061e035479d90a
	.xword	0x37dc1de3532cb0e6
	.xword	0x76e08796fc3cfe57
	.xword	0xadb40409818c8f8e
	.xword	0x0da01cc17a8f6b99
	.xword	0x2cfce09bacb2a1b2
	.xword	0xcffd65120c74f772
	.xword	0xa1f28eb00850dcd1
	.xword	0xc7632fa8e9353937
	.xword	0x1e9890c376d942e9
	.xword	0xcb42544a88ae70aa
	.xword	0x5aa51704b2f675f9
	.xword	0xced9b02b0c374eb6
	.xword	0xada48d8f8ecbce7b
	.xword	0x7597c11e144714ce
	.xword	0x70a0be501b101879
	.xword	0x283d3abbc3e592fc
	.xword	0xf926def144c23012
	.xword	0x4a0bb32b487a568e
	.xword	0x0ffbaed25ae7c402
	.xword	0xcab718ffea3fb73c
	.xword	0xe82809b22d736def
	.xword	0xae491265609519af
	.xword	0x0df0b08b1d05c0c3
	.xword	0xb78a6e18958d0852
	.xword	0x0000043c6d2522cf
	.xword	0x3bd2945c5fc6c37f
	.xword	0x088d92bc36355765
	.xword	0x9b229396d5bda438
	.xword	0x3488299d5ccf9f95
	.xword	0x3eef90b7d9e1eab7
	.xword	0x423ec1584d022edc
	.xword	0x9d613b9985e292b7
	.xword	0x10870c2fbfa8de71
	.xword	0x45839e4d24a9f602
	.xword	0x62adda997e8f13bb
	.xword	0xf7a1516063b67bad
	.xword	0x864fda84569cac4e
	.xword	0xff3ff7999d26fa99
	.xword	0xa1390559612d777a
	.xword	0xdf177aec7b49a81d
	.xword	0xb53f390620a68c9f
	.xword	0x92fe436b0bd47951
	.xword	0x454a40ca737bbae8
	.xword	0x180a801ed47edfcb
	.xword	0x5cb59130c9a9bba9
	.xword	0xcd4b578786f72061
	.xword	0xe19bff122cad3327
	.xword	0x2624f8f87a742a40
	.xword	0x9cba8924e4a09162
	.xword	0x927d68651068a2a1
	.xword	0x2b1acffc1aacaa72
	.xword	0x19cd857f9b1e13be
	.xword	0x41b6fafd56623fa2
	.xword	0x7c3000d274bb07f4
	.xword	0x53d8f540f37e19d4
	.xword	0x3dfee020bb15f5b6



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
	.xword	0x5756e38d5c86c35f
	.xword	0xef6d1e9653c30998
	.xword	0xa29648d4a9c9eb1e
	.xword	0x97821efc02540ddd
	.xword	0x5ad8d8a14d13fc7b
	.xword	0xd6c36cfa83dbe21e
	.xword	0x671ad499ff581779
	.xword	0x99e281a3f4e2cc5e
	.xword	0xeae45b3d94e49021
	.xword	0x2c9b49d85f3e23b7
	.xword	0xba93a978484ee14f
	.xword	0xfddf885357daabb0
	.xword	0xa178c8fe02dd745b
	.xword	0x4f581afcd85ae0c6
	.xword	0x3d8e72410e7feaae
	.xword	0xb0036145f5589ac2
	.xword	0x285384a02d30585d
	.xword	0x08e1b78c2a744128
	.xword	0x1c2d4f29c7f69f28
	.xword	0x14705f694ecdc161
	.xword	0x2227c833f919e3c0
	.xword	0x40b3b8d8ef9d9dd6
	.xword	0xc11e7dbecd7567f6
	.xword	0x73f7d821e8d0c16a
	.xword	0x50aa2c3a2ef2eff8
	.xword	0xc7cefe41417a53ad
	.xword	0xf700d993d0cfff2f
	.xword	0xe9c6279134f1e4df
	.xword	0xc171773984fb9e83
	.xword	0xbd69863421d73c28
	.xword	0x6b247c34b8ce3768
	.xword	0x08274ce730bf8a6e
	.xword	0x7ef07260c070f187
	.xword	0x2b4ad99c17b89aed
	.xword	0x0d8c9ea8b9abb6e1
	.xword	0xc1f384bee28477e9
	.xword	0x799ae45d86a4b6c9
	.xword	0xf72dd4e77265a7f1
	.xword	0x2054e568befc3621
	.xword	0xa26a950fcafd6205
	.xword	0x9941a3d500cf2989
	.xword	0xb07ac1ee519071da
	.xword	0x0b4e74446beeb05f
	.xword	0xdad82b3110735b9f
	.xword	0x2dd03c5b3d796f91
	.xword	0x02b94aed76de9b19
	.xword	0xab45741c15077acb
	.xword	0x5bf1a3db2c2ec879
	.xword	0xb20e03d3cabb9b74
	.xword	0x8218a026ebd97cd0
	.xword	0x682eec7503558992
	.xword	0xccde10aa772e9ad5
	.xword	0x3baa791b05cc6f7a
	.xword	0x96dc4020251ae0ef
	.xword	0x622d9997f38f1295
	.xword	0x93514a568a4aab06
	.xword	0x4731bc5d0358ad6d
	.xword	0x3e3f3ce06f4e6d99
	.xword	0x0d03cd67659c5f67
	.xword	0x5f1fe5da49bce942
	.xword	0x25ecd6173fc85586
	.xword	0xc1e9a3381e4d2c26
	.xword	0xfeb4cc0c2ccdbc76
	.xword	0x7fdaddecfaaf8bfb
	.xword	0x8dbe433e72336c70
	.xword	0xe91ab682b6db2e74
	.xword	0xd1829412bddb897c
	.xword	0x11a78c31dff6dd46
	.xword	0x90c236c0d284a6be
	.xword	0x7a52fdcd51e26f54
	.xword	0x77363764bb19c7ab
	.xword	0x1c5684620147f34b
	.xword	0x97a3b4dfadfb250c
	.xword	0x2c47940c72e495f1
	.xword	0x5a065077e2f94408
	.xword	0xd1c02e07f2f96690
	.xword	0xac694af9e0bd4aa0
	.xword	0xcbb2868ad2486455
	.xword	0xdc226eef39b0dddb
	.xword	0xe746df4e42d17814
	.xword	0xb21f6fc9a3aea0ba
	.xword	0xce69885040bfb7f7
	.xword	0x34f59192b00e56e1
	.xword	0x65f3ec4813c2ed01
	.xword	0xf1fa1ee57baca81b
	.xword	0x9d35c39f897e80f9
	.xword	0x67c25e80c87d90ab
	.xword	0x647b709c57b532ca
	.xword	0x00103100dc5f5070
	.xword	0xac068d8c84c9f5c5
	.xword	0xda75e16fcc2191fd
	.xword	0x6fb0450655c47112
	.xword	0x82712eef59bdeeea
	.xword	0x22b353b7c4f6cc7e
	.xword	0x3e595d3b7b11fe37
	.xword	0x7bbf466e80038159
	.xword	0x2785ea73eaafc01d
	.xword	0x97b343622239880c
	.xword	0xc4eff36ca346a811
	.xword	0x449a40da4a6b2685
	.xword	0x244b071bec1900b5
	.xword	0xa50afc977155040c
	.xword	0x8ca95863f60bc5dc
	.xword	0x1a61c0b573dffe56
	.xword	0x5cb93203500985d2
	.xword	0x1aa791bff6449f09
	.xword	0x69d88c62fd1ad408
	.xword	0x8cf0b9aa7c660806
	.xword	0x6e37553d6e3f2f6b
	.xword	0x158307b2c5d48a6d
	.xword	0x5d9765ba8c1dce78
	.xword	0x6c41d7ea6d4ffc2e
	.xword	0x3fe016205607f5c8
	.xword	0xc5c9e1e1766ddcc9
	.xword	0x15ca224352a9e75f
	.xword	0x1d51d38568f9510a
	.xword	0x24c962fdbc6e287f
	.xword	0x321ad98d19b2ad7d
	.xword	0xcd4726244eec34f0
	.xword	0xffc40cd7f68fcf99
	.xword	0xc201d9948b442a36
	.xword	0x1d220bab7612b5f0
	.xword	0x463df90b83814f09
	.xword	0x0244448805daf781
	.xword	0xfb5f194c0a701777
	.xword	0x2521b2c7c0737d66
	.xword	0xdb5216cc349d4983
	.xword	0x45960cd09636a172
	.xword	0xaffb968fd8525bde
	.xword	0xb02bc86b1856075f
	.xword	0x49637c06926decfb
	.xword	0x975ca8e338009064
	.xword	0x8e03b86245c67cd8
	.xword	0xa3a90272752dd932
	.xword	0x46e4da1bd1feb411
	.xword	0xa128cee6cab2aa0d
	.xword	0x4d1ce49b5b135329
	.xword	0x3e4cb4d70d08151a
	.xword	0xac3da3b1c01546de
	.xword	0x0eb4ed8e5708179d
	.xword	0xfc717adbcfceeb41
	.xword	0x2ed3362696a85ce7
	.xword	0x497e71a1939f6c4f
	.xword	0xc5c8f85719601286
	.xword	0x61c8d5a592caf66b
	.xword	0x23e1d8be0f39dfa8
	.xword	0x92d37372585b2098
	.xword	0xd4dea67be18b3809
	.xword	0x793af0ac47165d02
	.xword	0x6e7e634d7adaa2b0
	.xword	0x2ace244fe631dc07
	.xword	0x4ea6ee4319977080
	.xword	0x370b1ce07d201c3f
	.xword	0xcddb3256c8c2747d
	.xword	0x7e728242f91824f2
	.xword	0x027df1a91b180a21
	.xword	0xec8321528065430f
	.xword	0x75fc06e2a9ff16cc
	.xword	0x17869e4c8b0df565
	.xword	0xfe1cc94ebcd3d6bb
	.xword	0x976cba73cbff423e
	.xword	0x63a9ddf304db5b74
	.xword	0xbdf980fa2015d155
	.xword	0x9184471074994a6f
	.xword	0x350a17870f1b4654
	.xword	0x4902947f783b949a
	.xword	0xa98b4205f49fc02e
	.xword	0xa3e623e69c920f5b
	.xword	0x626a76c242c8a329
	.xword	0x12b7c3d2a427c983
	.xword	0x3d0bdcf1079de90f
	.xword	0x4f103ed7bf154159
	.xword	0x23bbd9499245fcf4
	.xword	0x4ee33d5962c54b06
	.xword	0x2b318e9a38615cea
	.xword	0xdbdd1b6eac0e3918
	.xword	0x91928f103d5c3e35
	.xword	0xc864ce1c18c0a2f3
	.xword	0xfda1dd9dd58a8ef0
	.xword	0x39100b18f6c80277
	.xword	0x26fbf09315518bce
	.xword	0xd568c9d76d99a7d4
	.xword	0xde76c38653778675
	.xword	0x15065f11f38cb2d4
	.xword	0x8c64874c6bd6897c
	.xword	0xd78ed4ed95273d29
	.xword	0x91828559f464e080
	.xword	0x80bb4cfd685ca9a7
	.xword	0x8452d3020a566858
	.xword	0xdcf3247131966616
	.xword	0xd41131fa5dea6134
	.xword	0x6603aef85528d583
	.xword	0x3c7f06dd4de2d44a
	.xword	0x9ba4d57dff1daacb
	.xword	0xeaf9ea01ee52162d
	.xword	0x09e7b1bbe9670401
	.xword	0xa4dff23fe0aebe82
	.xword	0xfc866b87ed1b8133
	.xword	0x5557ef5b9f313dc8
	.xword	0xc77441d490ea1b2f
	.xword	0x185d9d426af3b4ad
	.xword	0x2c5c99a00764dfe4
	.xword	0x2694dd560755a0f0
	.xword	0x6997352e1abfd851
	.xword	0xe4b3a5c956f3835c
	.xword	0xf307467182d09e45
	.xword	0x03627ff3efa21437
	.xword	0xc477b6e225f7a156
	.xword	0xc4038b9dee3faf4b
	.xword	0x5deec2bcac7f7c8c
	.xword	0x700d119b07357509
	.xword	0xf11759679296782f
	.xword	0xe18f8fca02a1f3d2
	.xword	0x8c4c4e73e674083c
	.xword	0xf48ba598427cbc6a
	.xword	0x6527f64650cda115
	.xword	0xb1ab338319cf6801
	.xword	0x7bdf0e60c0d20a20
	.xword	0xc64f3442b6c75355
	.xword	0xc39a685c4fe2735f
	.xword	0x52757f8620315662
	.xword	0xbc87ff64cce033c8
	.xword	0xd7ead6954a6c1d4c
	.xword	0x6aebe46a5139fc1e
	.xword	0xa25168c4c98420a9
	.xword	0x7436c6363b0c75cb
	.xword	0x5dae475abed61e74
	.xword	0xcc1e53df21738465
	.xword	0x6f35f8f61a00d12c
	.xword	0x228a6d05728433fe
	.xword	0x165e6be60849ec10
	.xword	0x125c6be011863a62
	.xword	0xf2d2ec41c5b15ec9
	.xword	0xed3723e7eb1584ea
	.xword	0x46e8e9ea842f9468
	.xword	0x4dbfb724acfe7e38
	.xword	0x416228b3b0ad5bb9
	.xword	0x53c91601fc914d47
	.xword	0x2fb58848d8297010
	.xword	0xdb124ffabfffefaf
	.xword	0x5684989f331c92f6
	.xword	0xd6f197030058d566
	.xword	0xeff51934c43fbd31
	.xword	0x2c06b18cc4927fb2
	.xword	0xb15391e25d1c774b
	.xword	0x23c224d96b162455
	.xword	0xb52dd746761709bf
	.xword	0x81ba8898530cc46b
	.xword	0xb292c287e50b9a96
	.xword	0x9c0103e2c5d55cf8
	.xword	0x7d77bd7488365508
	.xword	0xd64c1381e92e8b3a
	.xword	0x6d535e4d9a8a1efc
	.xword	0x0eadd7fd503b8635
	.xword	0xcbfd49cda2fefc65
	.xword	0x909970cd4b8306c3



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
	.xword	0xe6754b3636abcf22
	.xword	0x28779ce10203ac09
	.xword	0x3c0a16a0f74aa241
	.xword	0xfe79ab19ee1f75e4
	.xword	0xbff8e0258b959a2a
	.xword	0xb75c6b589a8db4e8
	.xword	0xc03ebfdcac032926
	.xword	0x43f88d5e2cb8c6a0
	.xword	0xbec6fa71437d627a
	.xword	0x1c4ef15badc098a9
	.xword	0x5645e8ae881a6d77
	.xword	0xf1e5453eea99fdfd
	.xword	0x7ab8ccc2874fc360
	.xword	0xe79d3ec9ee343c26
	.xword	0x0d9936b707d25b97
	.xword	0x8695d4a5edeab367
	.xword	0x916258757abbdca1
	.xword	0xd817b6223bdd8b20
	.xword	0x93b91eb96d09609d
	.xword	0x05543f84aa5d2b81
	.xword	0x4ece3d0e4a3b6699
	.xword	0xe37e238c01e5a819
	.xword	0x3b8c961f072a4f94
	.xword	0x4d6025edf0585830
	.xword	0xfdc7392ba15d6764
	.xword	0xe907f3b287d0f814
	.xword	0x51dd53ad707f6686
	.xword	0x6eec16ad1e4c9946
	.xword	0x83c509f7c4e08a07
	.xword	0xc08ee225ef9b8585
	.xword	0x54db8e330714855b
	.xword	0x71d8ff61128bf356
	.xword	0x0c8f0b2ddda26487
	.xword	0x143eaf1e7fd0d8c2
	.xword	0x40c663a97639c449
	.xword	0x9c724f8f48112da8
	.xword	0x04fca9d4c077685d
	.xword	0x1298ddc990a3000b
	.xword	0x1eef6a3eef8d3e10
	.xword	0x988e0ab0005736c0
	.xword	0x9dde1ad9dccdc9db
	.xword	0x100d653dcddec0f8
	.xword	0xc46e3b61db0cf7c5
	.xword	0x7b334b0fe0446205
	.xword	0xddae9a05830fea56
	.xword	0xad42eb499e2cc81b
	.xword	0x8ee70c1da249e117
	.xword	0x2b697495f1977097
	.xword	0x52ab27584b7cdb4f
	.xword	0x40ebfb2eec7cac08
	.xword	0x386414ad2ba8fdde
	.xword	0x203c5fdf561ff0af
	.xword	0x6dde8ce99b05bec4
	.xword	0x9766570c569a7162
	.xword	0xd12becef9d8d8d93
	.xword	0x92bcbdeec88eaa9c
	.xword	0xfe247e1499a3e4f3
	.xword	0x68b533945caa61f7
	.xword	0xbd00807c14cb8b6f
	.xword	0x45f2a17e711b0d88
	.xword	0xff7a8f1ccca666a7
	.xword	0xd2231689dfd8a703
	.xword	0xea486a26fe0a8b77
	.xword	0x3e111b0dba385551
	.xword	0xb98fbfb8e432c2a0
	.xword	0xdf063a8aaa18a71b
	.xword	0xfa3525fef5115a11
	.xword	0xe55bd832e6a1b7b8
	.xword	0xf185a0c7c61d8da0
	.xword	0x23ccd27a52adc8ce
	.xword	0xb8739850f2d26f08
	.xword	0x72c81157912f3477
	.xword	0x74f97ac31949db7d
	.xword	0x709d15a9e85e7913
	.xword	0xb3b3b19935935e77
	.xword	0x855f14b49d54e21f
	.xword	0xc86c6e972ddc6d21
	.xword	0x8d8a2bfd4f285b79
	.xword	0x8a7b36354820d7fd
	.xword	0x389ca551266b6635
	.xword	0x0a3b300ea9dcf88c
	.xword	0x866d2666e3c2eb81
	.xword	0x9d40040456af6384
	.xword	0x3b4eb10c7b12dd7a
	.xword	0x09605faeda98f6b7
	.xword	0x2ab1766480468110
	.xword	0xf79dd55386464def
	.xword	0x4d417fbe47b2638f
	.xword	0xc780dcbcb92c59d8
	.xword	0x86a62f0b8decdc69
	.xword	0x5d4bd5c31c8ceffa
	.xword	0xe675af50f4feecac
	.xword	0x17b496ff481bc248
	.xword	0xa368dd48d020de5e
	.xword	0xc5a63e81b1167d74
	.xword	0x632845148c4ed5e4
	.xword	0xfaaf6d47b3606a0e
	.xword	0x85c7f11b799f8c63
	.xword	0x56b5a20879db8e06
	.xword	0xb00bb8f83175573f
	.xword	0x62a52386b2459cfb
	.xword	0x1240d84ac3980e42
	.xword	0x02cfbb0a38ba8696
	.xword	0x31b50393100b7cf1
	.xword	0x26ad55b7e151eb47
	.xword	0x967d719a184a18e6
	.xword	0x9b2896ece611d36f
	.xword	0x5298a4da8b818a60
	.xword	0x4ed2e0c080405c5a
	.xword	0x8000585595ede7f2
	.xword	0x8b12cb108aee61d1
	.xword	0xd12fe0be1b03c0b8
	.xword	0x4791f208d96d6684
	.xword	0xe69eb1d291096637
	.xword	0x6caf0d3fd031410a
	.xword	0x15f9c03f5874aedc
	.xword	0x2231bcf0275297d0
	.xword	0xdc3e85c180e2db37
	.xword	0x9af00d41381d1d4a
	.xword	0x270332060650bd96
	.xword	0x09b170be5dd15110
	.xword	0xfd74d50b418bde16
	.xword	0xd6f5c7baae2fc410
	.xword	0x4ff80481005786d6
	.xword	0x00c8b1429715b1d8
	.xword	0x6f27ae8b3da358fb
	.xword	0x1eae22cfc85cd58f
	.xword	0x48ea14ad3e78a7f7
	.xword	0x9cbd84bf54f7edac
	.xword	0xeb76821dfb7ade6b
	.xword	0x2af88ef04d3e63de
	.xword	0xf832d118d7483faf
	.xword	0xccad3092fdfba70c
	.xword	0x027b86e2b06639a7
	.xword	0x1123b197adadf60d
	.xword	0xcf14592111a04261
	.xword	0x17daadb9c0874e08
	.xword	0x77586539f0409aa7
	.xword	0x56d85a9f3e93f39c
	.xword	0x4012efe747a52608
	.xword	0xaa54e605fb61643e
	.xword	0x0f6b1a946ad58372
	.xword	0x1517cb9576a6724f
	.xword	0xbb59bd1efa52bb22
	.xword	0x1ff80d055b1a526c
	.xword	0xcd2dcc8967cad514
	.xword	0xef5a5ec4e52b29f5
	.xword	0xd3ce23f7e0e585d9
	.xword	0x5280650e6e4df362
	.xword	0x564c8e3ce556d6ad
	.xword	0x50e6bad869f1a41d
	.xword	0x3f9d2d44cffc7b04
	.xword	0x52375373af46e45c
	.xword	0x258e21ebcaa40ecf
	.xword	0xb78d855ac0c7dc49
	.xword	0x830648da292ebdaf
	.xword	0xeab14c26d4d100f2
	.xword	0x4f38c54f907510bf
	.xword	0xd25c73ea67dd8c8f
	.xword	0x9d4e0442a31a4e1b
	.xword	0xe90a8a83b96cf17d
	.xword	0x4f0343d12edb8133
	.xword	0xcbadeec1ce6b9b93
	.xword	0x726e8ae8306a976b
	.xword	0xc16e186e6302b586
	.xword	0x01a83d5289a7b555
	.xword	0x5b7b94ee2bec3974
	.xword	0x89d8e71362e53c8d
	.xword	0x179073f802d8b8b6
	.xword	0x8a83f737ac7c97dd
	.xword	0x16d962cd56afec23
	.xword	0xd48adc45cc4a2972
	.xword	0xfda34cfa6e6451ea
	.xword	0xc8eafbaccd6922ac
	.xword	0x7e4152c2954432c5
	.xword	0x0d331ce6e7b10ef2
	.xword	0x250fa20bf0ea4ae1
	.xword	0xa341bd63307db305
	.xword	0xfe34503c1fb81cb2
	.xword	0x62829a6a39585615
	.xword	0xade6e751e442b2a7
	.xword	0x7fbeca169c2eb071
	.xword	0x55257a9952a8994d
	.xword	0x3c06588ed08c086f
	.xword	0x144dc6697e136164
	.xword	0x1314fabec9091261
	.xword	0xc3e60bb72e4b0ef4
	.xword	0xaf83e6323198d910
	.xword	0x589d25d8f57d5805
	.xword	0x4d782fe0c441af51
	.xword	0xf3ebb1f365f50806
	.xword	0xe77b2bd23be7492c
	.xword	0xa00d061e7f098c30
	.xword	0x89fb70e3a067b508
	.xword	0x04ee83b6a3bbd8ab
	.xword	0x452d817a7637aeb3
	.xword	0x179a371e59f457fc
	.xword	0x03b4f20cd35b658e
	.xword	0x085961a965bf76e9
	.xword	0x2c9d20d696e6cd7b
	.xword	0x4a2ce70166eb9509
	.xword	0x7b552bc110d0f656
	.xword	0x41c971721d5856ef
	.xword	0x6104a62951ed8687
	.xword	0x961fba952a45dbf8
	.xword	0xa89538c944564b87
	.xword	0xf4d6b3c0b15e2580
	.xword	0x32208b5ab8ffc708
	.xword	0xce9044b3b6e8506d
	.xword	0x5f1758886c438c64
	.xword	0x192365aba6bd0f47
	.xword	0x034d8f67cd043036
	.xword	0x1dc7ef7db74f4316
	.xword	0x9c7c6a2b73ee1a23
	.xword	0x46c4a81e36ee73c3
	.xword	0x36dc2ce7ebc95ad2
	.xword	0x5b39382c31116f5e
	.xword	0x1aa6a770fe4e59e2
	.xword	0x4a1cf8f62a2c7527
	.xword	0x2122de713b35050d
	.xword	0x97eedf12ff50f897
	.xword	0xf07dcc7c70e4e93b
	.xword	0x72d1c346b5ddb322
	.xword	0x59fb632c3a9ca87e
	.xword	0x2a93f7b994dd5e94
	.xword	0x6439378add2ad304
	.xword	0xe25ffe9fcbe895a6
	.xword	0x10107acaf169d9ea
	.xword	0x8970022704b697b0
	.xword	0xa3977cdfa01982ef
	.xword	0xf46b8d847feaa0dc
	.xword	0x595ef6afee5cd930
	.xword	0x370b1ded7c85c89e
	.xword	0x0a54a749f91a89e0
	.xword	0xdf5f61c03603dd9d
	.xword	0x5056959cf0444a39
	.xword	0x7e8544c863eb1e94
	.xword	0x62153475f91f260d
	.xword	0xfa5fb41c3f16e153
	.xword	0xed0b90561cb7a8ca
	.xword	0x51c49039c9872adc
	.xword	0x18935cd1f9fd0643
	.xword	0x1be543e97d8e7a01
	.xword	0xd0000ffb50108066
	.xword	0x981f6cb53c22fa87
	.xword	0x1accdf01b0347e26
	.xword	0xa9af6fcd93205bca
	.xword	0xee509fec077741ee
	.xword	0x655c2a0c37419639
	.xword	0x6cad3eb9fac18bde
	.xword	0x1fc969f9d1e353d8
	.xword	0x318ee74b02be9dd2
	.xword	0xbe5421f77157bff1
	.xword	0xe7b8b004135737e1
	.xword	0x92c0362e6d41c3ad
	.xword	0x4510235cf31e0dfe



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
	.xword	0xfab8cf19739ad968
	.xword	0x419e3d50888a187d
	.xword	0x08fa49340a14fd16
	.xword	0x7ca25552311a99e9
	.xword	0xd8fda12c0af1d3bf
	.xword	0x28be5336dc8cbd77
	.xword	0x5c1f73e46afc307c
	.xword	0x83de0b5587cae149
	.xword	0x5103dad60e72e904
	.xword	0x9473d886def96063
	.xword	0x7636b08bfd23ad00
	.xword	0xbf6859a0caf2d6fc
	.xword	0x0f29d8fd2a1ca35e
	.xword	0x41b3bb167f2b2fd2
	.xword	0x11dbb17047f46ca2
	.xword	0x180fb15805a13e29
	.xword	0xc492dd5e7dcae688
	.xword	0x669ba3bd14176c53
	.xword	0xc2d712ebe0c271cf
	.xword	0x3e26ed92f961e865
	.xword	0x456829ef2108e978
	.xword	0xadfbdb1eb1827efa
	.xword	0xcf175e417cfd6b93
	.xword	0xc7548cfa10e9bfdd
	.xword	0x1ded3360f6b730d3
	.xword	0xe1ddcdafd8ffb707
	.xword	0x6074aef166cc0801
	.xword	0x5fe6b014f730b98a
	.xword	0x9b9b451cdd976b12
	.xword	0xf6e2bb9a72c5aa72
	.xword	0xadf99357f6add6cc
	.xword	0x425c156c3925fb74
	.xword	0xc0ab720d685380f8
	.xword	0xa9279fc892048a62
	.xword	0x7960d0ac438ba9a9
	.xword	0x30ddee8791160a9d
	.xword	0xcce39f7c7eb8da51
	.xword	0x3866c506029111d3
	.xword	0x2ad7870ed8c441c3
	.xword	0x17c479fe1637a2ec
	.xword	0xf884b173f9d5e2a1
	.xword	0x4d5663b6eadec606
	.xword	0x55bba6d065ab856f
	.xword	0x8ac6f279097d75cd
	.xword	0x5443c8184ec70f15
	.xword	0x98ac0ff0478e903f
	.xword	0x284a4cc73aee3c14
	.xword	0x50676632610a757c
	.xword	0x8c805d64b03ce945
	.xword	0x29956084d9c60cbc
	.xword	0x8f2091b063191a33
	.xword	0x27cd843bc08de304
	.xword	0x698d82fc1b7d79fb
	.xword	0x7d0d5dd2e460f9a5
	.xword	0xd0c18d99b84c1a9a
	.xword	0xf26652849d5d57f0
	.xword	0x398ec1100b1fa6c0
	.xword	0x4e91536c81aa1507
	.xword	0x2882d0ebd99a8bc8
	.xword	0xc05cacd3b71120b3
	.xword	0xa39fc1b2f9c67565
	.xword	0x4303d0ffea1e08b4
	.xword	0xc70dec023d0ae479
	.xword	0xa1deab56f482f38e
	.xword	0x3bd2d912c8868bbe
	.xword	0x99ca6c91b5f6d7f7
	.xword	0xb19b33152c161dd6
	.xword	0x8e8bab72c97ef56a
	.xword	0x6d5e24fe500e2164
	.xword	0xebc24dee283921fc
	.xword	0xda1a30bd15e0ae16
	.xword	0x12dd716b52bcf636
	.xword	0xe5469c8b8c85fb96
	.xword	0xbc97eda6f14d0280
	.xword	0x7850cf31b96864f0
	.xword	0x448c017d1aed4f0d
	.xword	0xe0ccb502040eee8e
	.xword	0x093e8d95576cd509
	.xword	0x8ea72f83002c7d6b
	.xword	0xd446f19bbad73d75
	.xword	0x202db66a8c8a8753
	.xword	0x8db2fc2a46e8aa42
	.xword	0x7cf4dbeb00a17d39
	.xword	0xabe5de9f96e27a0b
	.xword	0x2778f303a50ae2aa
	.xword	0x2a313d66d4410e63
	.xword	0x469df6067a4826e2
	.xword	0x1b1f4b600c597ff8
	.xword	0x8bcf5c688760e91c
	.xword	0xef91565645f23755
	.xword	0xc53ee15008ad254a
	.xword	0x9032ce3da40ab7f2
	.xword	0x82f819d1dd0fe121
	.xword	0x8faffc621414d982
	.xword	0x2d64221137623cdb
	.xword	0xab62afa8dd47779e
	.xword	0x2921ce1b73ac8fdf
	.xword	0x88ac3ac24d2d2776
	.xword	0x34c4130628f51987
	.xword	0xe27cafa60599132d
	.xword	0xe2ef2b02907fc80a
	.xword	0x32ffa2749600ccbc
	.xword	0xabea07b5e734ce0b
	.xword	0x1640b69eefe6ba50
	.xword	0x5bd2d6d46a32bb34
	.xword	0x08fd88ec9685177d
	.xword	0xe29b6ab4fad71d50
	.xword	0x506fad9b0b9b613c
	.xword	0x16c2649ba0b2be3a
	.xword	0x73f5cfa4e671cb76
	.xword	0xc3af9ced4fcf991c
	.xword	0xde2b660326efcdba
	.xword	0x15c2e53859883bb8
	.xword	0xee13521d6105f370
	.xword	0x4b55c00c77ac7024
	.xword	0x1c4e979a2e32f1da
	.xword	0xfc28e7b86dace52f
	.xword	0x08ba4899d2582f35
	.xword	0xe61ce866e24f350e
	.xword	0xf86a5d2689da681c
	.xword	0x8a2d000354278c6d
	.xword	0xee4720e0059934f4
	.xword	0x0d9179bccabb5f6d
	.xword	0x5ebbd07561d7d126
	.xword	0x946850e63b87f976
	.xword	0xbc0fa8f1016d5750
	.xword	0x1628a1668557fdf9
	.xword	0x73ba07cea5179268
	.xword	0xa3fb4c271d724f88
	.xword	0x4c7e6fc6b81175a0
	.xword	0x5ddb55f365ea2815
	.xword	0x0a2297d51ee5e079
	.xword	0x974b043308a76f39
	.xword	0xabba36392f46053f
	.xword	0xb2a5530b11f0df77
	.xword	0x7036a49d14e0dabe
	.xword	0x7c6183f91013fc2a
	.xword	0x2d12680d26c19fae
	.xword	0x79b83c30aca93551
	.xword	0x0ee955977ba227ad
	.xword	0xba68f33974abe8ce
	.xword	0x7b8f4cb850e4456f
	.xword	0xcadfa1cf9cc62635
	.xword	0xb97a61491d88418e
	.xword	0x43f4180e0751d55e
	.xword	0x57e6f9c0cae3a89d
	.xword	0x51fc41dadc8d0357
	.xword	0xd5185809c105b11e
	.xword	0x5a8c3f53d64b0000
	.xword	0xdee7682a7bac394a
	.xword	0x394bffa7ee721532
	.xword	0x57725b11264a79f9
	.xword	0x02d6b3bd5370b29b
	.xword	0x6dd7521a6cdca310
	.xword	0x7157d0ccad04f433
	.xword	0xc27e0b67535a450c
	.xword	0xffbd44c36593676b
	.xword	0x399c34c6a2b6974f
	.xword	0xb9abf08abe836b6e
	.xword	0x4cba250d66eb9e5d
	.xword	0x8e5a14d0c33a366d
	.xword	0xbe604e52c165ddfd
	.xword	0x1aea35b63ab9790e
	.xword	0x1ae3acaade09b66c
	.xword	0x0fdfe66163a03015
	.xword	0xbed95107d4b8e71e
	.xword	0xb93a701976d491c4
	.xword	0x8faa9ff63b378e6b
	.xword	0x12df801da407d2d7
	.xword	0xa93daf1421fc9870
	.xword	0x5f35f82098ba7148
	.xword	0xd487360d31a537db
	.xword	0xf042ed76d3f251a1
	.xword	0xef1abc056a76d822
	.xword	0xf2b1e24199d41440
	.xword	0x8425711eae25a773
	.xword	0x6fcad1576dcf7b7f
	.xword	0x6d7f3d95556700c7
	.xword	0xc199772bbe3d1b0b
	.xword	0x45078a76735b71f3
	.xword	0x6ddb469d2b841ea4
	.xword	0x336a3b442c29d72f
	.xword	0x4b84d3f3d6b02330
	.xword	0xc1b58f1d99f2715f
	.xword	0xff931685a54b8ebf
	.xword	0xb653b4acf8d3c712
	.xword	0x54dfcd94d39b1f0a
	.xword	0xe99670bf0cd88743
	.xword	0xf48d8cb4a790255a
	.xword	0x1fbc6bba16bee0ae
	.xword	0xd9ec09b37a572e13
	.xword	0xf6825e78e6ee12a9
	.xword	0x63978a16cbdd131f
	.xword	0xca6c3de3c005c14a
	.xword	0xec867bd6ad015907
	.xword	0x3d127e9e02e07046
	.xword	0xd30bd6cded8b7478
	.xword	0xd4f5c4f1ce32ac24
	.xword	0x0db71dde2338dd32
	.xword	0x1ee1d3e62491ccf8
	.xword	0xd886f986f4f04c1e
	.xword	0x3b4c7772ef46cefa
	.xword	0xf3c7fcd9b42cbf68
	.xword	0xc3548d2609e2fc22
	.xword	0x32d3ad4846540630
	.xword	0x513061fad09b93bd
	.xword	0x954dce409584b0c8
	.xword	0x016434d8c3be46f1
	.xword	0x12b7e17be6d462da
	.xword	0x1644f663f50d202a
	.xword	0x1f36f6535271f731
	.xword	0x3f757dfc5395ae29
	.xword	0xce95bd51be3ac121
	.xword	0xd0164668a483cb12
	.xword	0xa7f36acae7143fd2
	.xword	0x8996136e7fbe4f36
	.xword	0xb510bb23c37cba24
	.xword	0x9ed3f1650c0adc2e
	.xword	0x28f8a66cc2f31b0c
	.xword	0xdac80d249070b223
	.xword	0xdef373a6f127a58a
	.xword	0x1a5f0da250b3a281
	.xword	0xe8fbf4a455790a50
	.xword	0xd8a5291200962e7d
	.xword	0xdb8ac1f4159e1a82
	.xword	0x7989173d5601a597
	.xword	0x81927ee65c55860e
	.xword	0x0ff55c10f50ec5b6
	.xword	0x4a23e13bd7e7eccb
	.xword	0x6ceb247bc2751c4f
	.xword	0xa3a3ae425220a0bb
	.xword	0x50ffd0a3f4404f6b
	.xword	0x062bde20b9fe6b3f
	.xword	0x8fb9ab99dda3ba21
	.xword	0x8fc730a778f628c6
	.xword	0xa9cc8cc88465a5cd
	.xword	0x7c4fb46606840b06
	.xword	0xe9253fec2c7dabd5
	.xword	0x50784e52daabc013
	.xword	0x7722b7fd2cc37a58
	.xword	0x0bdaad5feea26614
	.xword	0xd1da66f31a609a3a
	.xword	0x49143f66432e1f06
	.xword	0xe3f4412a3458a688
	.xword	0x538175cd44897c63
	.xword	0xf33cc302cf75af0c
	.xword	0x84bf48ddb573663b
	.xword	0x976907d770a9581e
	.xword	0x9eaa6970aa4f22e6
	.xword	0xbec5a4fac94dd8e5
	.xword	0xd5022fe9ecfce4e7
	.xword	0xc860d00530876964
	.xword	0x01eaf4271536315d
	.xword	0xed544bc6d3bc9abe
	.xword	0x18005caccba6ace3
	.xword	0xed421c60bd6126a2



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
	.xword	0x5a06d814188f940f
	.xword	0x76d3e11e679c71e0
	.xword	0x0f901e4cbc649013
	.xword	0x0118b394082c6670
	.xword	0x9b83e0a99dd2afcb
	.xword	0x615a5856331b3fbe
	.xword	0xdf36f111c0efa84f
	.xword	0xd503d1d36f24b137
	.xword	0x1e46b512cae208da
	.xword	0xe90857739838740d
	.xword	0xc0933b3889658894
	.xword	0x6977898a6b6930d1
	.xword	0xe205e0dad68f9a2f
	.xword	0x4a9dacbdeb5c1ae2
	.xword	0x4200d5d30d621ba2
	.xword	0x792a69660e047458
	.xword	0x6f387d0651243cd1
	.xword	0xa0fa37c9c36a2121
	.xword	0x06e6188f6ea717b2
	.xword	0xda523697840c12ff
	.xword	0x14604524c140eef4
	.xword	0x886f1fe9d1c61e4b
	.xword	0xcb8b3481cb3e87ea
	.xword	0xc6183eb3aa945a55
	.xword	0x12a6fb2c871ac8af
	.xword	0xff77af7189494553
	.xword	0xe4e05930eeb96af9
	.xword	0x03392360aedc59cf
	.xword	0xe45e3c2cfd28174e
	.xword	0xc7d221730be8b5f6
	.xword	0x03a6a01053ea411f
	.xword	0x50b6d5b63cfeb3bf
	.xword	0xbfdbe6e7ced71e1d
	.xword	0x2be69bb576cb68a5
	.xword	0x6923e1b2e7eb8098
	.xword	0x859c0ac12a4de56f
	.xword	0x31e73ef2f374be32
	.xword	0xc2e0da172ccec8bb
	.xword	0xd2f6667c344a8908
	.xword	0xe38739ea4bf9c798
	.xword	0x9cb7d9e57eddc540
	.xword	0x1cf8a155e2311557
	.xword	0xaa99cda5b3ff42ab
	.xword	0xc4ce1f646d551dba
	.xword	0x93c4453bb33430e7
	.xword	0x860691f75e86e508
	.xword	0x1f989df88b0b3e8c
	.xword	0xd9b444cc0f836ffd
	.xword	0xcf63fef8f782c27b
	.xword	0x6b4c64f92c6eccc3
	.xword	0xaab123ef6ff667d1
	.xword	0x5ff8839823e0e562
	.xword	0xc2a113ce6ee29e7b
	.xword	0xa8bd54d230a83441
	.xword	0x566166effabe592f
	.xword	0xe09b51ba0a941cb5
	.xword	0xba0d400a71185bb9
	.xword	0xfe40eb58cd03c74f
	.xword	0xb3f1b2df79f6435a
	.xword	0x1d95cdc30d8fbf3b
	.xword	0x2b6e1fd055e59ae5
	.xword	0xd4a40a88c65762c7
	.xword	0x3dbc012f8b236539
	.xword	0xb875aca8a53d2bf4
	.xword	0x90ec18c0f14796ca
	.xword	0x166b0454e1c656ce
	.xword	0x9ec3ec53d26885cc
	.xword	0x233086b303e58f04
	.xword	0x570744a377a62c6b
	.xword	0x7e379257af81fa45
	.xword	0x486da669088edcf6
	.xword	0x7736a7d86d054fac
	.xword	0x14c6cac904b0fd7c
	.xword	0x6e8934c6e1cdfa12
	.xword	0x4b89403f7cae9dc6
	.xword	0x8a5284d20f59edc5
	.xword	0x1ff86b4d36ad21ae
	.xword	0x4338b54ee17e8264
	.xword	0x06f4df0e1d22563a
	.xword	0x93d5b714ab1e1679
	.xword	0x6a1a0f1e1c61925e
	.xword	0x756428934f8bf144
	.xword	0x706ed8095ce23e57
	.xword	0xde7a68eade468aa5
	.xword	0x882834d237655d4a
	.xword	0xeaf5187351e4952a
	.xword	0xa83e13eeb4b7d5ab
	.xword	0xcb10d8a36d9b4d3a
	.xword	0x55a35b25a5d23f1a
	.xword	0x6948c0ca43b6e94d
	.xword	0x1444b02ee5a12178
	.xword	0xc1c69a6d02edc23a
	.xword	0xb9b1c2f33e1e16eb
	.xword	0xa9043e60632739ca
	.xword	0xb83afa8c8b4a882e
	.xword	0x73a0498d25c91e30
	.xword	0x840a80a62a568705
	.xword	0x4488a9f71cba2331
	.xword	0xa51669305558766a
	.xword	0x5d796be5637cbeb9
	.xword	0x90b7d4914ae00cfa
	.xword	0x65f803e67cd8e299
	.xword	0x7b60cb0540788bd9
	.xword	0xc756c7e90f8aa0d7
	.xword	0x5edc88407e91c8d7
	.xword	0x3f89bb83744c5d54
	.xword	0xe96006f10591a0c0
	.xword	0x8b99f02242b2075a
	.xword	0x1d065bc30f255e70
	.xword	0x44bfc51c12f7542f
	.xword	0x7a936edb2cfd7eeb
	.xword	0x9a9571b65fce6d33
	.xword	0x51127abf21605ded
	.xword	0x07cbf416241fce51
	.xword	0xa907f943302e0865
	.xword	0x1f85a3f77ca1b73f
	.xword	0xb0786bb765ad2fa9
	.xword	0x2c03e2980e605b1e
	.xword	0x8e4013d9d1765ddf
	.xword	0xe90f86be649ea857
	.xword	0x30d73fa48e79fa7e
	.xword	0x51780d3ef1322ea4
	.xword	0x2d445d8a893709eb
	.xword	0x1c3cf73d4c12368c
	.xword	0x89be086276f1d333
	.xword	0x8c380b36270986ea
	.xword	0xbd06793278831f54
	.xword	0x994dbed6c2de12b3
	.xword	0xa180c9722090883f
	.xword	0xc3d8557c4807a427
	.xword	0xd4d1423b8d064458
	.xword	0x1ec99071f792c4f1
	.xword	0xc21db59dedab1164
	.xword	0x1cd22675a960748f
	.xword	0x35a4ef0820f44934
	.xword	0x8f15c4ac731654f3
	.xword	0x49de0c9a0efe32c2
	.xword	0xbc8e4b216f9e0b05
	.xword	0xaabcabe0ef7e2013
	.xword	0x796833a080b03edb
	.xword	0x53909ff60f97dcc9
	.xword	0x1387c043ce4a380f
	.xword	0x0c3c93c7843461df
	.xword	0x538f3f3837355243
	.xword	0x293210d577e8cb7c
	.xword	0x8e28a42de9e9ec58
	.xword	0x7d5766c29c4799b3
	.xword	0x43fe2f2a69137090
	.xword	0x51baa4e0caf7dc68
	.xword	0xd5947308aa822c4f
	.xword	0x88f2b208ab87fc47
	.xword	0x9db00221f3dc6c7c
	.xword	0xa754e8d5f8b434c7
	.xword	0xb86d5b292f7c5b3a
	.xword	0x1f2f988c1707e821
	.xword	0xe7551804b4baadbb
	.xword	0x4dad54bcbc9b1394
	.xword	0x0b3f0256c26f7b8c
	.xword	0xd331e7a99983f001
	.xword	0x04c1de76a51d1717
	.xword	0x548fe6077571a577
	.xword	0x5c01ee01dc820f21
	.xword	0x38f23dd076eafda9
	.xword	0x772b93e23d689ca9
	.xword	0x6a6377a49bef02e0
	.xword	0x7ccb759f87fc4561
	.xword	0x83d90041da29a14a
	.xword	0x0c03e62d0327f035
	.xword	0x9b072442ab001779
	.xword	0x9ddb52027ac62095
	.xword	0x9417e2a9044cd94d
	.xword	0x49e29b91ae51f2d2
	.xword	0x6d8650a0c55f69b2
	.xword	0x0739a1d73f51745c
	.xword	0x464814255cec23d6
	.xword	0xb1bff4d781c7fc1b
	.xword	0x7739b30362ce844c
	.xword	0xaad0056fcfa27db1
	.xword	0x9f687cb70fe03bf2
	.xword	0xd9d7162b4a8964de
	.xword	0x66dbc802ced5411a
	.xword	0xcd24b0e8ffce7f34
	.xword	0xc656d605d232dfb7
	.xword	0x27b731cffb105bdc
	.xword	0x72dfe6c89f554c4f
	.xword	0x52a3219d4f4a84d2
	.xword	0xcaf9613e63d09eda
	.xword	0x02c9edf057af1f3f
	.xword	0x7e0de76ea978c6df
	.xword	0x6bc10f2d470a4f99
	.xword	0x0e5b7511b2f75792
	.xword	0xbcbcfdb856d816cf
	.xword	0xb6b0b3d74bd60c02
	.xword	0x05f3cfc2c313f2a6
	.xword	0xd680d8a7ced555a3
	.xword	0x61a1cacd4f4561b1
	.xword	0x6522691366f8d08a
	.xword	0xb4b6e3a02dc50497
	.xword	0x5ea686dff770eae2
	.xword	0x2a5b80f558d4ef3c
	.xword	0x97785774093daa2c
	.xword	0xd1b0cab41785562c
	.xword	0xa0eaef9716abc51f
	.xword	0x4521feac2c0263d8
	.xword	0x9fd0693e6d7f36fc
	.xword	0xf583b93ef80a58d6
	.xword	0x124366f2815137af
	.xword	0xc67667f0bd660060
	.xword	0x9f848fd1eb796656
	.xword	0x7b5091a8cf9e174b
	.xword	0xd0d3776f8c175f7a
	.xword	0x3bb22a27a334bf8c
	.xword	0xb7256405a8fd1389
	.xword	0x1fd1388a48e91b96
	.xword	0x70fc496ed9cb0c89
	.xword	0x3a36d59a279de12e
	.xword	0x3f18ec5d3d5b6307
	.xword	0xfe5184f86754ad6e
	.xword	0xfdf44f9356155ec5
	.xword	0x55559ae16aa3dc78
	.xword	0x3c381e800b4fdfcb
	.xword	0xd5fc34b035902e11
	.xword	0xfefb44a388e29a20
	.xword	0x0fb851e2418ce99a
	.xword	0x89b2860ad249ce2d
	.xword	0x7be93874be72379c
	.xword	0x97f7b7da4926007a
	.xword	0xaf48e50ad27cd151
	.xword	0x738bb5d2c4b226e6
	.xword	0x84c7e9189c1e9151
	.xword	0x214c13ce450e9174
	.xword	0x728ede0fc7054735
	.xword	0xf33c4b838a1a9329
	.xword	0x7945e50e78cb4a65
	.xword	0x9e0dfa0fdb29ce7d
	.xword	0x7c5528e476307857
	.xword	0x7dd90d9d2f16326f
	.xword	0x07b2eb7fb33dea63
	.xword	0xe9bb1b7eb3eddc27
	.xword	0xf4e36000dfbb1c4d
	.xword	0x019cee5e3a31d2d6
	.xword	0xdd9cfa647c006c82
	.xword	0x98b6194f00d2f7f4
	.xword	0xe156df06009a3942
	.xword	0x4505d19323b4ebc6
	.xword	0xd6e5d0dba3227a10
	.xword	0x034da8bee2047fbc
	.xword	0xe97dfa32aa0395a9
	.xword	0x26532182c6aa8024
	.xword	0x59b555818fab62e7
	.xword	0xb8749179442c9754
	.xword	0x35c297e16ada5000
	.xword	0x5563fdd16fb83bc5
	.xword	0x452f12c1cf1ac5f3
	.xword	0x0827702b349cb6f4
	.xword	0xb462b0e90c8e2855



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
	.xword	0x44bd8796013c1023
	.xword	0x304626f288f962b3
	.xword	0x4d740c6926c850e5
	.xword	0xd288919ffa321d53
	.xword	0x5c61c5da516ab9ea
	.xword	0xcf2ea394fa2e719e
	.xword	0xa42211fa48173bd1
	.xword	0x4b77b7592d19b79b
	.xword	0x261594213da8b38d
	.xword	0xac690abeda589eb9
	.xword	0xc80f165c4f23cdff
	.xword	0x46ebc7f20e41fdda
	.xword	0x0726dfc97c341a6f
	.xword	0x82e3cdcaee214085
	.xword	0xc928f6bf3121cdac
	.xword	0x991d8fe21f145a90
	.xword	0xbb7fef7d3eab0b64
	.xword	0x0f8301188e53ea17
	.xword	0xedb4430349101980
	.xword	0x586de1ec4a9d5853
	.xword	0x07fa769cc188ebb1
	.xword	0x1bb8b3f16c86fb02
	.xword	0xceba7366b873cac5
	.xword	0x9f59207898d93e83
	.xword	0xd71adfb3119c469b
	.xword	0x0b5e327a83994845
	.xword	0xdac4c804a946ca02
	.xword	0x0740274567eb65c4
	.xword	0x5b86dc3999b821f2
	.xword	0xbdf610cc89d8c8b0
	.xword	0xa5396617b7411c16
	.xword	0x22f7896ae7fc33f3
	.xword	0x8d2aa8bb4c144692
	.xword	0xf77c9f21c893e9ec
	.xword	0x4dc5e70fb5b44273
	.xword	0x4cb0b17d15e24cc6
	.xword	0xa5bd58d0ee93044e
	.xword	0xf80bb9825bf7ea6b
	.xword	0x6726d918e38d31ca
	.xword	0xe1779e52a8aaac07
	.xword	0x45ed3a651592a689
	.xword	0xfe1347230504da46
	.xword	0x0c68bb1bcc70c510
	.xword	0x68783d8c61974a45
	.xword	0x37068070b58a25f4
	.xword	0x2cdd7fe445ea7a5f
	.xword	0xcd2bde90db2bbb70
	.xword	0xa679234b78cf5b5a
	.xword	0xf91de335879fd868
	.xword	0x55a859a0f9707138
	.xword	0x065c03b70d729efa
	.xword	0x42b35786fc5ed15a
	.xword	0x20ce798bfd69283a
	.xword	0x83d3177a105df0bd
	.xword	0x891368e1edfaa878
	.xword	0x2a1ffdbf69f78659
	.xword	0x0d4d0bc2fcf80ff9
	.xword	0xa4cfdab8f7d9e3b0
	.xword	0x188048908cc89520
	.xword	0xaa92543fc65619bb
	.xword	0xf49ebd2e91ed1885
	.xword	0xa9c1cc00318c6c59
	.xword	0xfbb45af819aff9ad
	.xword	0x1a47ef0697d60170
	.xword	0xd6cd8164d13b78d2
	.xword	0xb69e3f4b5b2aa257
	.xword	0x19ee1f743fc1b0c0
	.xword	0x51627a54a0bb153b
	.xword	0x760df85bb18c8284
	.xword	0x5c7a0f45cb663557
	.xword	0x84a1f8ecdccf2b27
	.xword	0x54eb0d760c25b5d6
	.xword	0xca98e7bf659d18e0
	.xword	0x43a3a78bd8f5e44c
	.xword	0xe83fef2510e9b8bf
	.xword	0x09a8ed8cce47098f
	.xword	0x4b3c2afae9e5ee61
	.xword	0xdb7245df73f88cf7
	.xword	0xca8ea0bbd1d8de4f
	.xword	0x98f7fb0aa2c40e30
	.xword	0x43c17f13d5418132
	.xword	0xc10a8de8d4d1c4ad
	.xword	0x8631ca930983e339
	.xword	0xc8818b0059aa4ef6
	.xword	0x7dc3f755810a1e93
	.xword	0x0d383a78d041c5fa
	.xword	0x46c928df5a59bc51
	.xword	0x7a4a6577e3e59dc2
	.xword	0x5ceaca83d88e749e
	.xword	0xcd3882240b3508de
	.xword	0x52d4e8ff3bfe374e
	.xword	0x37a65ebaeb787a0e
	.xword	0x60ed6c9d5793dcfe
	.xword	0x377951f32dc71ac6
	.xword	0xfa141732414f6c52
	.xword	0x49071935cbf609f6
	.xword	0x1e13425d5d4ab337
	.xword	0x13ec4c287be289c7
	.xword	0x14d84b50ff04ad03
	.xword	0x4945a3b7101c070b
	.xword	0x1c2c48d1c830eb25
	.xword	0x156fa277c68eeefc
	.xword	0xfb4a351ade66ed63
	.xword	0x0470fd65a91a9efa
	.xword	0x099313e6f6f20bd9
	.xword	0xec7202e261e9b671
	.xword	0x3db9aaca17ca5681
	.xword	0x2f6ca5a8440c64dd
	.xword	0x8d853d40e99112dd
	.xword	0x3cc4a2caf4df7261
	.xword	0x48fca027c2d08ab0
	.xword	0xed89382b2c0206f9
	.xword	0x6de586d8448cb811
	.xword	0x297dc2cb678d7b6c
	.xword	0x9924b03476ffae53
	.xword	0x436271b5e8866c35
	.xword	0x69ad96ff04308a42
	.xword	0x9e34ada01f4ae19f
	.xword	0x2220a1aeb249dd0a
	.xword	0xf1ae4f5f42c0ace3
	.xword	0xee1e00960bda5786
	.xword	0xc78550ca7993343d
	.xword	0xfe9d8249f84dca31
	.xword	0x9b20d454d80cafd6
	.xword	0x1f487850f17a6c1c
	.xword	0x1b5a432d4b4f1688
	.xword	0x7d29f31f6cf5bf04
	.xword	0x167495776656a96f
	.xword	0xa7712f5793434d4b
	.xword	0x44522a64375a3969
	.xword	0x2136d6d8ce5abab4
	.xword	0xfc43cf5e659a3f87
	.xword	0xcaea2e04086af807
	.xword	0xac8fb0b1fd148aa5
	.xword	0x0e6769de0f5dc404
	.xword	0xa94437ab56937757
	.xword	0xd6a481e0d5c34dbd
	.xword	0x77a77bc25b74b1d4
	.xword	0xfb46c8169c858dfb
	.xword	0x684530b735804387
	.xword	0xc0f1d27a6a4cd7c0
	.xword	0x9db269b4c6f941cf
	.xword	0xc7af522687efc396
	.xword	0x86dfba26f468de28
	.xword	0xc8ba2b58720a3222
	.xword	0xccafcda72bfb8a45
	.xword	0xf59c2f3f9d4fef23
	.xword	0x9a046328bd5d9363
	.xword	0x80ce305525e7724f
	.xword	0x43f32534c5729b5e
	.xword	0x0513fe8cef2aed17
	.xword	0xaae5a48674e58741
	.xword	0x35631ab3fadb02d8
	.xword	0x7f6f879cb9c350e2
	.xword	0xd1780afe7ce97a1d
	.xword	0x1ce826a272277497
	.xword	0x93c88c034e4b4116
	.xword	0x57e06abed5180dba
	.xword	0x6fdd99e856b83e98
	.xword	0x00355bbec62fc1fc
	.xword	0xcb513782822893ac
	.xword	0xf4615a3913d5f1d1
	.xword	0x9afdca6b715ed5e3
	.xword	0x2e646a5b314b5691
	.xword	0x6ad8c56c630b5a42
	.xword	0x510683ff77538e7d
	.xword	0xb9c8aec026652c82
	.xword	0xa13d350a46bf0c71
	.xword	0x5c01f811c1493053
	.xword	0xb540fb4d8f3102a1
	.xword	0x87d81ad5b9d8d2b7
	.xword	0xb9fb499177fb02dc
	.xword	0x5e69f53d72656563
	.xword	0x6d0cac1cd6c4edda
	.xword	0x00545a9355c8c8d2
	.xword	0x1232fd209acea7c7
	.xword	0xf19726d419df4a24
	.xword	0x15d046ba02a7e16e
	.xword	0xca305c6ec3a3e21d
	.xword	0xb961deb053abe74f
	.xword	0x87b02fb7e796d6b2
	.xword	0xdb697d75e231b5e1
	.xword	0xdebe48bea30255e4
	.xword	0x4cf9483234afc73f
	.xword	0xc74325878c990e99
	.xword	0xae3464dd8483a2b1
	.xword	0x34161f20f31bb2db
	.xword	0x4d96d645d850b383
	.xword	0x422a995d69d7a39d
	.xword	0xececab06d14f8397
	.xword	0x6ddb985d08c51f8d
	.xword	0x97f7d70b3a5441ce
	.xword	0xd0775901a10da835
	.xword	0x5f0c550ea2694cd5
	.xword	0x4f14ba76002d5e0e
	.xword	0x566dec23956618c9
	.xword	0x6f5cf7b4f46e2a8f
	.xword	0x194769f6a96089ec
	.xword	0xaef95f30929235ae
	.xword	0x283fc71b5cbf255b
	.xword	0x809f22b6ae442e2d
	.xword	0x31062dd3a4e99615
	.xword	0x072a1c7dba739489
	.xword	0xc6889f50cfdbfa06
	.xword	0xd274161fa203e040
	.xword	0x21270bf01fba072e
	.xword	0x4323a3f1a4192d55
	.xword	0xd9061ab57c6b1a0d
	.xword	0xf6954936b97e2612
	.xword	0xe6f1bbbd5a580a2e
	.xword	0x628f086b457cf5de
	.xword	0x00b6c53919f59ed8
	.xword	0xcbe5261d5e1c5f97
	.xword	0xcb03d1628f798c97
	.xword	0x367b42f77520ad73
	.xword	0x96da40687d6dc244
	.xword	0x03522f8068ac62b2
	.xword	0x4d8ca0b10f658e63
	.xword	0xd017e7f87c8d5f5c
	.xword	0xaefc202d1bf205a2
	.xword	0x5bd7a134549213ee
	.xword	0x344c019bafe720e1
	.xword	0x0ab028a6256e5697
	.xword	0x969cf11676338161
	.xword	0x9e522aab05c42680
	.xword	0x67c792a829edc7a9
	.xword	0xe2132311a9919afa
	.xword	0x1e83481701b43d9d
	.xword	0xd7959a91e8c6434d
	.xword	0xbd4ecdf81715a4e2
	.xword	0x497b45381278f2ea
	.xword	0x4647156b2241fed3
	.xword	0x47326e981ee14bf9
	.xword	0x9b76f70793169e41
	.xword	0x82609a5de80bcb1f
	.xword	0x8d06e85cc0c2c11b
	.xword	0x3544c537b47ea22c
	.xword	0xb4de132dbc766339
	.xword	0x2f72f8e116c10e7d
	.xword	0x947e041c8c27e1b0
	.xword	0x83b1854c963e4483
	.xword	0xcfcf0e12d916e58f
	.xword	0xc2f8594d4775d5c9
	.xword	0xe68cf0894bdd69bf
	.xword	0xf75c24d130a78281
	.xword	0x1775d36e6005a5cb
	.xword	0x21aa80dd9baad316
	.xword	0x983bcbc41af2409a
	.xword	0x88323d7f420f617b
	.xword	0x38092ac0ce6aa4fe
	.xword	0xd91d62122bd93f60
	.xword	0x691955ab465d0561
	.xword	0x5019338a2fd7beae
	.xword	0x722b6b4708e62b11
	.xword	0x17fe44092d08224b
	.xword	0xd1c227381a741a26



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
	.xword	0x77512260b0272802
	.xword	0x2181604ae1a65df8
	.xword	0x6f057c04c07607be
	.xword	0x878885b26a0fe051
	.xword	0xa686b57764772a8a
	.xword	0x26cdbef3ec66e8bd
	.xword	0x61b58150bcf6c248
	.xword	0x7e40544cc7dc3c7e
	.xword	0x4b04bf5269b6548c
	.xword	0xd8aa36b005803f0a
	.xword	0x38b14fd117fa25a4
	.xword	0x3083a90488efc0db
	.xword	0x461ebaab44c092c3
	.xword	0x0d0d308ace0b04ec
	.xword	0x4eb368c5ef564899
	.xword	0xcc0b341f3067371b
	.xword	0xf09f121d59a3eada
	.xword	0x16cdb43e91439886
	.xword	0x8abc170878b51a58
	.xword	0x78689c73e2d6a6a3
	.xword	0x4dc4403d9c81f074
	.xword	0x299a23a22af3e4c7
	.xword	0x28c3e3ce5d4e8791
	.xword	0xdef6e34b2a81f0d6
	.xword	0x55c114d0d244d957
	.xword	0x8a86e7b6da60a9fd
	.xword	0xba04021e7aeef7c6
	.xword	0xb235a41bf007d47c
	.xword	0xfdd3a2c3530480ae
	.xword	0x10ba03b573d2f064
	.xword	0x9675ccb0ac4402d4
	.xword	0xa866de786b4fcbe4
	.xword	0x95d4c44868bf675d
	.xword	0xc780c516e7f214ea
	.xword	0xeb9b8203cb14d339
	.xword	0x2c57cb4ec0f31ec5
	.xword	0xe31f829d31f4046b
	.xword	0xcba96cbbee7b3335
	.xword	0x9830446f8ed50567
	.xword	0x03ed883b9932afe6
	.xword	0x11d9df283f583de4
	.xword	0x0c2cc08f8fa1daf5
	.xword	0x800437153468b9b5
	.xword	0x0762d7765faf3d8d
	.xword	0xd25d5e1a5c70a916
	.xword	0xcd7d325d10674261
	.xword	0x79f7f2f9e21c5a0d
	.xword	0xc9d39d403b16c244
	.xword	0x0c5ceee3f6ce3996
	.xword	0x43f75c2052d96ae5
	.xword	0x8faa23db5a81dc1f
	.xword	0x8990a45dabcd90fb
	.xword	0xcd484825022be000
	.xword	0xbf975c4fee75f0a4
	.xword	0xe595c485b7c71b55
	.xword	0xff2ba188426f7fcd
	.xword	0x162cdcb4c72144ae
	.xword	0x336cf462348a9ef6
	.xword	0x802d5ef972e0199b
	.xword	0x7186d0ae083d3443
	.xword	0x218d239e1e833f53
	.xword	0xb52bf0cda130aab7
	.xword	0x77734e15b65043c2
	.xword	0xb4944c9290048c55
	.xword	0x37f22cbcce63d7f6
	.xword	0x4cdcc42ca3d733e8
	.xword	0xc9b3c7f617698295
	.xword	0xd890e0ff7a156b37
	.xword	0x3170af7e7660767b
	.xword	0xc94d3447c2fed1a2
	.xword	0xa2fee1b15463af2c
	.xword	0x034a642e9e2fde4a
	.xword	0x7501b948318c03d0
	.xword	0x911163ece4894893
	.xword	0x2adc11ef181be60e
	.xword	0x3b82f291a8b21a00
	.xword	0xcdb09372d959ef84
	.xword	0x3877bb785d0a670a
	.xword	0x0ef4c079f37a99f1
	.xword	0x52d0f5c0234ffee7
	.xword	0x7c66c23778801a01
	.xword	0x892d2c7e33e2db60
	.xword	0x87dd99a21ac1fe6c
	.xword	0x10e90e131c2ecb1e
	.xword	0xa2a8e3e5ee69fa6a
	.xword	0x0da77e97f0536c68
	.xword	0xcbe5165a6c83e8a4
	.xword	0x20f549ec999fc425
	.xword	0x0bd256a0db619669
	.xword	0xa7febb3a3d30c4d0
	.xword	0x4213f9ddfb146dcb
	.xword	0x825bd95ab3b2621c
	.xword	0xd29db56f7146cc93
	.xword	0x23459e170f2229c9
	.xword	0x283d439d006920e0
	.xword	0x8b49d28f297c734c
	.xword	0xdfe71c07b9f12f9b
	.xword	0x9cda1a716497b1b7
	.xword	0x76687f1aeb7a0dc1
	.xword	0x1c17ac8635af31e1
	.xword	0x469d5a5122b27342
	.xword	0xc99b2c53b6e990f4
	.xword	0xaf69c13afe7418ad
	.xword	0x279cd1dde2fb4706
	.xword	0x3f7ae692f2cadda5
	.xword	0x81b864d7955f971a
	.xword	0x3292bd701567f1ba
	.xword	0xde26ece50d7a0279
	.xword	0x3c689d301c8eddad
	.xword	0x1ebad7861a982f28
	.xword	0xdb682c542bba7ac7
	.xword	0x5042b4b6b07902f4
	.xword	0x1c66af611ce5d70d
	.xword	0x6ecee1006c83f69f
	.xword	0xface274577c4961c
	.xword	0x61c86a2cb1bdac39
	.xword	0xb5109c6f28c2a2b0
	.xword	0x98c4bcbfd3cecef6
	.xword	0x8a4ac3dd0678d156
	.xword	0x5a9bec99e9abe0ec
	.xword	0x1ef28155be058ef4
	.xword	0xa4c8b29cb86a9cc5
	.xword	0x72e229c555155e9f
	.xword	0xd16e87a1720d0e1f
	.xword	0x30f0f515cd0a9230
	.xword	0xa2c334d7b628201c
	.xword	0xad5371ce056351c9
	.xword	0x0db3f19de2ca030c
	.xword	0xdc4b6ffbd762bbe5
	.xword	0xa4a477e87e283c9d
	.xword	0x7cfb2899cc731ad1
	.xword	0xfb4bb5e121957244
	.xword	0x14f6b5e54418e101
	.xword	0xb2bb779b8b1998ea
	.xword	0xcde8a41d92521198
	.xword	0xe4e633ef2d992c87
	.xword	0x0866fd8ceb0dd763
	.xword	0x71749db8034b26e1
	.xword	0x243a064e2f8bdd4f
	.xword	0x5a54b31f43a2dc35
	.xword	0x8d8d59b35ee2417d
	.xword	0x3f2779b8cd412aaa
	.xword	0xadff77670f0e2622
	.xword	0xc6fd68bae89ac41f
	.xword	0x32cb04afe2ea4f65
	.xword	0x508262c1f466dffc
	.xword	0x06b09c9174281b0e
	.xword	0x76b583667fe5f307
	.xword	0x9acf273405ee1e79
	.xword	0x61110a26dee3966a
	.xword	0x36d8420cd79c98dd
	.xword	0x3727d57fec3033e0
	.xword	0x77cbe864ecc4a3aa
	.xword	0x5dd3c08c45e41416
	.xword	0x9ee515606ab7639e
	.xword	0xb7996a1da3084350
	.xword	0x74da8c4c5c2609f0
	.xword	0x9a39cc371bccdd5e
	.xword	0x580290a4c94e88d8
	.xword	0xb8a950ed44f14882
	.xword	0x888a165aafb72cd7
	.xword	0x19d33dfb4d3d3878
	.xword	0x5e663567408dec2a
	.xword	0x505c335eb10d32d3
	.xword	0xaeadd8c097751b96
	.xword	0x29ba48c996f592ec
	.xword	0xc39be790b1d16d8f
	.xword	0x8c1acc2878a405c0
	.xword	0x0b48da825e8a3710
	.xword	0xe21c60f21cd15a26
	.xword	0x46bfe1e3235e9cba
	.xword	0x23374416a2ee85ba
	.xword	0xd1e5518a0e255b24
	.xword	0x4eee87499700bc3e
	.xword	0x6f05b6157183b055
	.xword	0xbee91e562af990db
	.xword	0x04d48516c16be3fd
	.xword	0x4aedb37c2398c379
	.xword	0x6ce828c27754c923
	.xword	0x04819d72e46b46bf
	.xword	0xfc712f12a3c9efe1
	.xword	0xcd645b1a13eaf98a
	.xword	0x06fd40be078abd31
	.xword	0xcb623cb478783c11
	.xword	0x8d04ec57dd7bf541
	.xword	0x61f027bd12b84df5
	.xword	0x5cb508784753d977
	.xword	0xc3850643a996554c
	.xword	0xcc4e45e11312db7f
	.xword	0x983236d07b9f5cf7
	.xword	0x525f329202a274d1
	.xword	0x2bb9e902a8676214
	.xword	0xbfb1ad5ca6bfc10d
	.xword	0x12264ffd1f44ed26
	.xword	0x86245206f8aa807a
	.xword	0x8b7107488d80ffbf
	.xword	0x79e629ff01f08fb5
	.xword	0x0f0a2e4ecfcbe0ce
	.xword	0xec524b8305d0fb94
	.xword	0x916767c60b8b914f
	.xword	0x37b88c5e5c231491
	.xword	0x7bdcdb1b31a37cc5
	.xword	0x5b1534e1df19a5da
	.xword	0xc796eb7fb6647a09
	.xword	0xfd6cfddd46a6af63
	.xword	0x2ac65c348d2c7d95
	.xword	0x0cd2150849d45a81
	.xword	0x6a98526ff0f14373
	.xword	0xb0308b942b65a19e
	.xword	0x72591830b9041be6
	.xword	0xf86bc46390d27585
	.xword	0x3f883b8b0b9381a8
	.xword	0xafe9a5c0617d3d1a
	.xword	0xabb8a943ec72f5cb
	.xword	0x22fff7c8ecadf97f
	.xword	0x44a78775fe42341d
	.xword	0x4388402be35aec62
	.xword	0xc5ee26048c1bb369
	.xword	0xcad68572fb586935
	.xword	0xfa00da13ac28387f
	.xword	0xb532ddc6fe266392
	.xword	0x11be728fb6b8bdd3
	.xword	0x488ccbb783eb588b
	.xword	0xa52e122520ea9c7e
	.xword	0xd92f5b7cfe3ef1ae
	.xword	0xd0f9312a19100898
	.xword	0xd81a26a9f66f2976
	.xword	0x592e1fb3138aa8ba
	.xword	0xb1f0c98127d74f73
	.xword	0x587dbfd9df55de6c
	.xword	0xfa9f39485b5c3963
	.xword	0x52efc9690b6fb4f7
	.xword	0xe526aca56ecbf9c3
	.xword	0x45afdaae5a08ff0b
	.xword	0xc24e43972619aca8
	.xword	0x94b901f8024d8171
	.xword	0xe9e0f4316b13fca5
	.xword	0x7e84c713d21cd1bf
	.xword	0x3ef5e673f16f5c9a
	.xword	0x307afb13f719ee60
	.xword	0x41e3ceb3a2adfbe6
	.xword	0x5b3a16ac4f76664d
	.xword	0x62c396526f8a06d3
	.xword	0xab1e1b0d2d8603fc
	.xword	0x50203710814a2d9d
	.xword	0xbb4a8a4fef69d265
	.xword	0xf129a0d2cd8e8d5e
	.xword	0x8bf3520d219dd47d
	.xword	0x3f0c7c981277847f
	.xword	0x335d5915bb703226
	.xword	0xda140be0baaed7cb
	.xword	0x06c996ef096400f9
	.xword	0x0893c1c93a535498
	.xword	0x3425c1fac71bfef8
	.xword	0x7471ae5321f56304
	.xword	0x2105ace9c41e5abf



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
	.xword	0x52aa7080cc0c3ec5
	.xword	0xe8de73b07dabedc9
	.xword	0x94f3a312eb92db22
	.xword	0x2f002f38fae08523
	.xword	0xcb78c5b67fcf39ff
	.xword	0x827f17ce2254b7f7
	.xword	0xfb39e3c38d7ff9b1
	.xword	0xdfe59b0e57a970fb
	.xword	0x4eae7cb8c049fcf6
	.xword	0xf48462ec2cd85fe2
	.xword	0x3e34da60245257ff
	.xword	0x789f23bf019c57af
	.xword	0xfe6ff9a2a84fea92
	.xword	0xe8b1ab7ce99c5973
	.xword	0x178cda7a5e41903a
	.xword	0x8ebcdfeecb5df67f
	.xword	0xfccea1d42821f68b
	.xword	0x5839b983327e3c72
	.xword	0x1a8a4b4332a098a1
	.xword	0xfafa516a6c9724fb
	.xword	0x9248ce492e9ee2aa
	.xword	0xfef71a3459ea8998
	.xword	0x9762f017eb0721f9
	.xword	0x657380a7ecf8ff32
	.xword	0x94996598f126ec06
	.xword	0x73a94df73dddef3d
	.xword	0x14f14dcbc84f6372
	.xword	0x27a4d6fab5b48ed5
	.xword	0x78baaeab27a3c318
	.xword	0x436707dccfde4666
	.xword	0x50bb417d39ca5ea0
	.xword	0x615585588e3cbce8
	.xword	0x02b060c4e3dc4d1a
	.xword	0xf5b0f9def7b3e8c0
	.xword	0xf6e0a8a94486a4b6
	.xword	0x606443de46840454
	.xword	0x385648f841256c47
	.xword	0x9a1feb46ea3b89d6
	.xword	0x73c5fe8a74315031
	.xword	0x51d8c1492c82ba2d
	.xword	0x16adb7015d0af1d7
	.xword	0xfb923cbe7701d61e
	.xword	0xd70c69df833efae6
	.xword	0xa0a2a8bb159c1b35
	.xword	0x46b93da5fb470a29
	.xword	0x715fd8062519a1b6
	.xword	0x486818e4827ad8f6
	.xword	0xdc5b1b82dff8c746
	.xword	0x820e4e1fc58c67b7
	.xword	0x6115850efd64e28f
	.xword	0xb25b43600718fe61
	.xword	0xa9009f18942389ce
	.xword	0x2fc9b82ab9c2beb6
	.xword	0x86ce65b35e8d51c3
	.xword	0x5dee8e81769e6eab
	.xword	0x8495c798191e1193
	.xword	0xb411af5aa613c280
	.xword	0xca78c0cbc8e35fe7
	.xword	0xb2ca85b011576ce0
	.xword	0x853b62986cb1397e
	.xword	0x83acb6e7a93eefbc
	.xword	0x5c74e789f250f59f
	.xword	0xc72e141c307e9a14
	.xword	0x9f221387709c8c08
	.xword	0xe762e7e7e7e1b355
	.xword	0xcd48890ac0a5906f
	.xword	0xa1f522c0d3ceff7e
	.xword	0x53b25bd4a15756c3
	.xword	0x89f976ac1f3db9b5
	.xword	0x57bfaaea90e46af6
	.xword	0xdec93a26401c468c
	.xword	0x978a2166e6db3a96
	.xword	0xbc69da37067af549
	.xword	0x3ce60f3efdaf9125
	.xword	0x4fb37f4d993397fd
	.xword	0x0fc55838e2c67682
	.xword	0x89de1441c8e3ed7e
	.xword	0x3bf3e241e774fb3d
	.xword	0x191d9057491c856c
	.xword	0xbc2b30c2f4c002cc
	.xword	0x6bb60a8a546d5b3c
	.xword	0x0c654e4c70117562
	.xword	0x828bdc863830a200
	.xword	0x9bd3db29fb42b9b8
	.xword	0xf827317dd852f1f3
	.xword	0x41e4092a0e3975ea
	.xword	0x6540f4e2820042d3
	.xword	0x96d7fa82bee5263d
	.xword	0x08b753ffb662b516
	.xword	0xfbbb11affd6e5682
	.xword	0xcf04eb0522c9ce3a
	.xword	0xd5a4d2a57e868123
	.xword	0xb18f341fce79d1f3
	.xword	0x17f8ae9b1c4d26f8
	.xword	0x8aaf47bdfc4cd0e0
	.xword	0x5f96ebf884d96d71
	.xword	0xfbe203dbbd00cc1a
	.xword	0xd72c0fe6709b6990
	.xword	0xac6321eaad51a55b
	.xword	0x785c5c28df9c9fb3
	.xword	0xf83c292d785966a4
	.xword	0x50cf4873477ced4d
	.xword	0x5f58673259dae8bb
	.xword	0x01eec541536ce05d
	.xword	0x996b985d0e65694c
	.xword	0xad33527a39ca307e
	.xword	0x43f23b1d9eefb2f8
	.xword	0x275d7e2f4166066f
	.xword	0x41f50658ba39ebb8
	.xword	0x3e8c78b408e3b199
	.xword	0x1433c3fa741748e1
	.xword	0x7941ee9f20845b36
	.xword	0x38ef62301a7f8e7e
	.xword	0xa28e376f2322399f
	.xword	0xbc516decbc30ba49
	.xword	0x739c56fb3b279d3b
	.xword	0xef1f85364c0c61c1
	.xword	0x925706ce62900ed8
	.xword	0x63b3fcfa6bb7ebdb
	.xword	0xf7deefc7444a2ff6
	.xword	0xe970c916549fc3a3
	.xword	0xd9fc5002f4eb192b
	.xword	0x79876fd1169efd41
	.xword	0x279e33e7c552d517
	.xword	0x5d3d3a902431f5c7
	.xword	0x1161b25652008269
	.xword	0xa406cd19783b8605
	.xword	0xa97e502291aec510
	.xword	0xdb36ec681d483d2b
	.xword	0xcd1b63b1e5a82b9b
	.xword	0x213b9abbb1f6b83a
	.xword	0xce8ea800790dc9d6
	.xword	0xe53d04f207fe841c
	.xword	0x531e48239653699d
	.xword	0xe9949d0eaa8e775a
	.xword	0xea4cd071b7760b1b
	.xword	0x0f2d100b75d8708f
	.xword	0x8833f3a2aa3f59d6
	.xword	0x93c2be6094d4da3f
	.xword	0xa122be99bbbe00e1
	.xword	0x0a8eff635fc56ae3
	.xword	0xe7acb86f12b70bd9
	.xword	0x8a7967c11efc209e
	.xword	0xc56be5261b2b97ce
	.xword	0x0ea7ecf42b3d93fd
	.xword	0xda699d628e96485f
	.xword	0x69b5cee37723f614
	.xword	0x2ef54008c598844a
	.xword	0xb390a74bbe5e0580
	.xword	0xd168417f7ff0bd6d
	.xword	0xf956a60b6817806d
	.xword	0x3cede3c7b1cb251c
	.xword	0x52a540b91bdff9ea
	.xword	0x51ea6618f1e00abe
	.xword	0x710e74d323bc08d7
	.xword	0x889f98533cf863a2
	.xword	0x7733bea599080b8f
	.xword	0x9606cfe525c36e81
	.xword	0xa538a1393a0b05b3
	.xword	0x271f54b00c51cf71
	.xword	0xd005b6a2db4a3c04
	.xword	0x3df189c441664b1e
	.xword	0x15c89acf3d74fe00
	.xword	0x899b23fca4db988a
	.xword	0x7461d49290189a62
	.xword	0xf25020a139ec6161
	.xword	0xca681f8bb03737d9
	.xword	0x2f80a4dc9802a020
	.xword	0xe158839d699b40f4
	.xword	0x258bb0d548b88740
	.xword	0xad753f9fbf7178bd
	.xword	0xe345a73bc557975a
	.xword	0x3fcc480ffb1a8040
	.xword	0xde3bb9454871e241
	.xword	0x929dd0c4b19ef820
	.xword	0x7b4603a21276bf89
	.xword	0xe7acc151ffbc639a
	.xword	0x4034709014a6d936
	.xword	0xffa571fbe1afe566
	.xword	0x163fce64000aa678
	.xword	0x744669f157466e3d
	.xword	0x1e7e8fe79dd877de
	.xword	0x559bdf63526f3732
	.xword	0x2b47e58194364f1a
	.xword	0x8f9bb4b3dd822eaf
	.xword	0xe18a5d36a5563fe6
	.xword	0xf5db153426e211ef
	.xword	0xb6b2c2248525daef
	.xword	0xbb23c19af25fe29c
	.xword	0xd36972ae6922bd22
	.xword	0x533acdb77e7e32f7
	.xword	0xd1caabaf59fa69bb
	.xword	0xfd52dc75bee87d7b
	.xword	0x701ef25d47f28522
	.xword	0x4d16594709aaa4cc
	.xword	0xdad626751405b586
	.xword	0x316bd79ab6cc5244
	.xword	0xa92905f09eb43b40
	.xword	0xa5548a02d70b9dc7
	.xword	0x3fb0ce3a69196d6e
	.xword	0xc5cfb8447d38b9d8
	.xword	0xaa7551dd5dc1c653
	.xword	0xe2781e6929a14141
	.xword	0x63da3238e64ff99b
	.xword	0x61ddbc626ffb0f1e
	.xword	0x8c80b9c8fbe10daf
	.xword	0xf6e240460cfa9bf9
	.xword	0xcdbfa6c9830384b9
	.xword	0xcb8dc3021c98e9c2
	.xword	0x029790570c07a050
	.xword	0xd912eca2f7da6c58
	.xword	0x7356edf00298f726
	.xword	0x56c00d9256e295bf
	.xword	0x6725a6601a0c128c
	.xword	0xff086a96b0fd59a1
	.xword	0x79cb41e8508195f4
	.xword	0x41b08188c8fda676
	.xword	0xf38f19c519536dfd
	.xword	0x2ce87e45823aa714
	.xword	0x6cd13067ab06599f
	.xword	0x2f3a8997f2f63a4e
	.xword	0xc61678053ac2d2f2
	.xword	0xb9735308392852cd
	.xword	0xa253213d72cc1421
	.xword	0xf53b897fc305c4af
	.xword	0x74adc543eb74b437
	.xword	0x4de9b1d92dc4144f
	.xword	0xeab613122295ecc3
	.xword	0x99d6c11e7e9a224a
	.xword	0xb393be144bb814b0
	.xword	0x2d92f5924b87d6f5
	.xword	0x362e9e084f73b5ec
	.xword	0x2b8a3a87694b84f7
	.xword	0x4f9ba9e64ec53983
	.xword	0xe97bc5ca2b754f8d
	.xword	0xe9d20529693d0fd6
	.xword	0x83bd57943734091e
	.xword	0xfef8d1bd98bd0f3b
	.xword	0x740900fcf23d1a17
	.xword	0xac48e8502025ccb6
	.xword	0xdfb87b466fb50182
	.xword	0x34f5de115ed026bd
	.xword	0xf5c04f83890c0a37
	.xword	0x2c1ad7f003ea1d93
	.xword	0xc1b657841660b851
	.xword	0x630687fd99d8a6c6
	.xword	0x278ecd6ba76cab24
	.xword	0x61a1bbcfbc67f504
	.xword	0x8f3da53812f93dd7
	.xword	0x8b43cba120953b55
	.xword	0xba9337eac8f771a6
	.xword	0xb5df3c64056dac77
	.xword	0x7a75042e4463edfc
	.xword	0x253320e91b9b6ed3
	.xword	0x44ac0fb6183e43de
	.xword	0x4f1ab93f0ed4fbf1



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
	.xword	0x6842572baf6f459c
	.xword	0xb4f6a3da0e2686e3
	.xword	0x4220f8464195cebd
	.xword	0x33c71c683099df57
	.xword	0x1374c9cf4deb8bd1
	.xword	0x8f33d20984e33d0a
	.xword	0x3a5a259ede17f7a6
	.xword	0xfd4b8b06277b385e
	.xword	0xea8590d6fb1cf8b6
	.xword	0x6b1655cd299b267c
	.xword	0xfa8776b2a810b1d8
	.xword	0x5b21bca68f8cdd7e
	.xword	0x4a4dfa726ce936c4
	.xword	0xeae10f97d3a4d9cb
	.xword	0xc5b47c40c35f3096
	.xword	0x80903d09774ed12c
	.xword	0xf11015e7560ef225
	.xword	0xd2183ae387838f98
	.xword	0x608c8e0bc3885bef
	.xword	0x01120d1ffd6f6454
	.xword	0xdda6a1eaaaf90aa5
	.xword	0xf794e35fdbeb1e7a
	.xword	0xd7503248e724f491
	.xword	0xdd1e82f1e646b5a4
	.xword	0x4388d3abb1f56b0a
	.xword	0x5ea71ada62a7c0e2
	.xword	0x2487856c12b14d2c
	.xword	0x1a12d9ebc597b65b
	.xword	0x4e5a86eb09cbb448
	.xword	0xf96ea5c6d52acaeb
	.xword	0xcd493b7a01174fa2
	.xword	0x278941875c09135f
	.xword	0x4f28d3f547dd9e6d
	.xword	0xe1900aed37f6de56
	.xword	0xa71513f04907b1db
	.xword	0xf9f9562efa969714
	.xword	0xfe9e857985da6093
	.xword	0xf222fc1263a19c47
	.xword	0xe4636b21d7020a4b
	.xword	0x2c7b4143530d270f
	.xword	0xfbb7b2498cc85cb5
	.xword	0x5563850b3bad1385
	.xword	0x1f3c30ae351901d8
	.xword	0x6a8d5c41b54ecf91
	.xword	0x07d2fe56548a5023
	.xword	0xa5a78aeb04bbb03c
	.xword	0xc9611d62d5c7d89e
	.xword	0x0435a423798c8c9c
	.xword	0x36bcfed2736d9fef
	.xword	0x0fc525756de6f316
	.xword	0x7c4bfe896ccf7a99
	.xword	0x7a96386ecbaf9a5b
	.xword	0x34a85df88b153b93
	.xword	0xf38167b27d685d38
	.xword	0xb39d1c0a25e1e30d
	.xword	0x0c723f030f0f3121
	.xword	0xde712949309671b4
	.xword	0x0211c98cce9671ed
	.xword	0xdc5366643bc623e3
	.xword	0x7f1af7d427a54926
	.xword	0x4cc5e4abaab52568
	.xword	0x0c7565451287687f
	.xword	0x803dcaa16c2e9d55
	.xword	0xb6e1998d2f656250
	.xword	0xf6fe2b9a1d3d88c9
	.xword	0x4139e89a50ad7c01
	.xword	0x8afd983f35a5a97e
	.xword	0x3f97ef2c9041c178
	.xword	0x791f6e1429a55081
	.xword	0xd446dd5469d2685c
	.xword	0x412999a151605fe9
	.xword	0x425bda6d42cc80cf
	.xword	0x78b6686004668e3f
	.xword	0xc5c42f532f297ba9
	.xword	0x7be060d9113e592a
	.xword	0xf349d8eb2c7d9fdf
	.xword	0x6948c80e6f78fb95
	.xword	0x0984538c4b0812d3
	.xword	0x6415dff8fa818f76
	.xword	0x76959eb6276abe8b
	.xword	0xca17b53fbfdb0a51
	.xword	0xa0dfab01c568e51c
	.xword	0xf2899f5c4db3486b
	.xword	0xfaa01cf36e43f67f
	.xword	0x55f3921803f0bd09
	.xword	0xd4563508e8393c83
	.xword	0xb1d6fbea93c1d752
	.xword	0x1222f869bbae1a16
	.xword	0xaf12ec0122b15b64
	.xword	0x03e11788af1b67f4
	.xword	0x4dc998c111e1ba9a
	.xword	0xec5289701cbbc68e
	.xword	0x42af0f186400dcee
	.xword	0x6e50661f78f79a1d
	.xword	0xa6affcbd7d14796a
	.xword	0x285a50e1b177f0fd
	.xword	0x440b38cfaa156607
	.xword	0x8029381d22b60b71
	.xword	0x4f230777d06a3fef
	.xword	0xa6db63dce0649b87
	.xword	0x9161cd35d5ce0e5a
	.xword	0x3bbb4a3813276fea
	.xword	0xe7aec3bf754a9387
	.xword	0x825ff148d2a1517a
	.xword	0xeac1436e1935cfa1
	.xword	0x9b36effddd732c8c
	.xword	0x7a64eb993dabcdae
	.xword	0x87c17d7851ea2dc7
	.xword	0x49b2ab0858a02ccd
	.xword	0x14afd311065e466f
	.xword	0xf2f133598c4d6f4e
	.xword	0xe69e1bb210dcfcb2
	.xword	0xdcbc3b7ccae581cd
	.xword	0x162740c270ac64d1
	.xword	0x156795ef4e8c0219
	.xword	0x39aaff4249bab986
	.xword	0xe629f3ed07e0e8e9
	.xword	0xa9d011a7d88550a4
	.xword	0x13f7aed85138214e
	.xword	0x1fab3ea093afcde8
	.xword	0x4cf9a2ebb1f3b3d2
	.xword	0x193b23e41aeaa141
	.xword	0x6cd99390cc47eaa1
	.xword	0x559bb6a9438629a7
	.xword	0x67e2c122efc0d66f
	.xword	0x78c9eb82a026b2d5
	.xword	0x65e659d5d16987dd
	.xword	0x04a1bd7976f18c17
	.xword	0x30b973fd3cccfb49
	.xword	0x70bcbd308061ba46
	.xword	0xb5a33eb0ab4f3a21
	.xword	0x2f17e901622ab92f
	.xword	0x48a9d89dc6fee8fc
	.xword	0x4f0823193cc588ca
	.xword	0x0e9c202b20898aa2
	.xword	0x230add1096dc0ac2
	.xword	0xae6406a77db2f753
	.xword	0xf2702fbcc14a6630
	.xword	0x127aafdee26f0158
	.xword	0xe91016cd436dcbc9
	.xword	0x030c3648495b2a89
	.xword	0xbab19f5b6766e427
	.xword	0xc1176d1c7b5d2dd1
	.xword	0x861e20b9f4d9d97b
	.xword	0xbf1353ea67b02ce0
	.xword	0xa1bae31c70f38ba3
	.xword	0xc09801d62059d901
	.xword	0xec1d4d3b4accecdf
	.xword	0x179c36c5fff47ac7
	.xword	0xd89d0ec1053c535d
	.xword	0x14e83b54d24fcc87
	.xword	0x7bf2deee0bb0041c
	.xword	0x965989016e92d2f6
	.xword	0xe066ad640118f4fd
	.xword	0x390e73ff7e727b5d
	.xword	0xab844bc2a7616a6a
	.xword	0xb02994fd7fd58d56
	.xword	0x5123385c061bdbee
	.xword	0xad0e56f7054465df
	.xword	0x92d2814d0ef813c8
	.xword	0x98689cdfe752091b
	.xword	0xa631d60f774a074f
	.xword	0xf9a25f3b31842d30
	.xword	0x23ebd55d7bd071f6
	.xword	0x554924378674ace6
	.xword	0xec3826c83f67897f
	.xword	0xce02efaa3ed72d1b
	.xword	0xdcdc10813f879363
	.xword	0x2cc572abbf42fdb5
	.xword	0xc02943a0c689e215
	.xword	0xbd7ebad1d2718e85
	.xword	0x1c4fb55f0a94d919
	.xword	0x6a910fdb1c4bbd73
	.xword	0x84f76d87fd9ee668
	.xword	0xca437b72aaa73cfc
	.xword	0x0917ebe5f9b1889f
	.xword	0xa9f370124112b1ab
	.xword	0xd0a5158bb16dd365
	.xword	0xe8aad72d0b8ad3ce
	.xword	0x27375044a6aa4de5
	.xword	0xf500e1ea1fa86cfc
	.xword	0x31add8718da032b4
	.xword	0x181812d3b101191a
	.xword	0x77b45f5cd94f6adf
	.xword	0x4ffc2b5471a18a06
	.xword	0xc285d51286a81b73
	.xword	0x30d6424fd15a53cc
	.xword	0x9fff93c6659b4db8
	.xword	0xd84832f2c8af5b2b
	.xword	0x8733800bb26d69ab
	.xword	0x00635f0be30cec8b
	.xword	0x6e545fe4e9905f38
	.xword	0x0239ddcd43eeb852
	.xword	0x97091fc8d0b4d6ec
	.xword	0xe4740e7cb9cec29c
	.xword	0x911d65a675bbbe95
	.xword	0x3f7774d34ce8fe5d
	.xword	0x4d3c6ed7622a84a2
	.xword	0x660093aab96fe880
	.xword	0x973d824958b8e35e
	.xword	0x0c874726023d52f4
	.xword	0x09d92eb5650b81a5
	.xword	0xec94a196cdae06d9
	.xword	0x795f52388da7f74e
	.xword	0xe83dcfea36bbbe9e
	.xword	0xfc76517314594d02
	.xword	0x3419f1b26528d103
	.xword	0x8e4b26a80ce57c08
	.xword	0xddf902d95f7ed1f1
	.xword	0xc70ed75fc0f3872d
	.xword	0x0007d16bb576a444
	.xword	0x5c425f06e6adefad
	.xword	0xd84336a3198755d5
	.xword	0xd6d1e80b00c4a8ae
	.xword	0x6af93f575bf5864a
	.xword	0x1a6c608929e451a3
	.xword	0x1576094b8345aff1
	.xword	0xf0c434167b72b639
	.xword	0x4ec40e812a756596
	.xword	0x7fa63a4e152b9d6c
	.xword	0x3f7044f5f0ff9248
	.xword	0x40dda4ca128504cf
	.xword	0xb31e7fd57ac84332
	.xword	0x5beb7f2910bd418b
	.xword	0x94b96a497deb5b4f
	.xword	0xb090f57191cc349c
	.xword	0x8c12e26adb7af6b8
	.xword	0x9d24e6b0e73ba618
	.xword	0x220c9f0c20dfd347
	.xword	0xe92d59211f392636
	.xword	0xa7c8858ae3d10839
	.xword	0x6eda2762ef3d494f
	.xword	0x270b8658cd366f8c
	.xword	0x4271960ff79c8663
	.xword	0xdfd7653687ed80fb
	.xword	0xc185ac71e112ef07
	.xword	0x64678671ac6ba222
	.xword	0xe63eb3037f583789
	.xword	0xee1026b2e53f7791
	.xword	0x9a9350e8327d7fb6
	.xword	0x8e9136ab305a2448
	.xword	0x6814f073ff91b2a2
	.xword	0xbbee1333253f4e0d
	.xword	0x5196fa54dafc6bdf
	.xword	0x9061bf293e638463
	.xword	0xa09cbea9098a96e6
	.xword	0x3b27abad39dff351
	.xword	0x6ac0fa9306945e61
	.xword	0xc6b67368b5006cd7
	.xword	0x92c9aef603e2bc32
	.xword	0xb7d55f7e0391fba6
	.xword	0xbbae50478a69efdf
	.xword	0x0cab5cc8cac152da
	.xword	0x2af65fbc8cc866c6
	.xword	0xdb77cbc4b56a1f5c
	.xword	0x1cd2b12cc608b1f2



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
	.xword	0x936527fcfe513780
	.xword	0x3f3a3e4727e6105e
	.xword	0x6dd7c10753039f89
	.xword	0x888cc20aa20eae01
	.xword	0xe833f392e5f2f5e0
	.xword	0x37b3316f17ebddbd
	.xword	0x5d571dd53da3719b
	.xword	0x482733db3d9d16b1
	.xword	0x16454ad6e42eaa1e
	.xword	0x1a64f0a02d90e077
	.xword	0x2f77d8aba44a1f90
	.xword	0xcbd1fc7143b0eb64
	.xword	0xf5224f25670285e8
	.xword	0x3ed3ce03fa7c5768
	.xword	0x744be0f61777c2a3
	.xword	0x753b15db0ddc74a9
	.xword	0x557efb997d736303
	.xword	0x98e31f787e094d15
	.xword	0x889fa8f3dcfd8c30
	.xword	0x60a2c9a0fba17f10
	.xword	0x817993da0711c58c
	.xword	0xdde66befb95ab478
	.xword	0x649cc9811e070b94
	.xword	0x3e7b2fb7db4063e4
	.xword	0xb951417fb63c5d01
	.xword	0x87e12f58b9dc26ba
	.xword	0xbbe9daee7bf6499e
	.xword	0xe14a68091df61d5e
	.xword	0x13f2263828d8d419
	.xword	0x35773b0cd8ad030e
	.xword	0xb4ce0c2ea6911607
	.xword	0x587f7b981d4ef460
	.xword	0x9c8289b09f982fae
	.xword	0x32aa8e30a27d7423
	.xword	0xed241b6573d3b98e
	.xword	0x66a4f6990d891cbf
	.xword	0x66026ceccd4bb3cf
	.xword	0x26a785d270beba22
	.xword	0x9810ecce68266352
	.xword	0xfbb99983845d9240
	.xword	0x80f3a79bc7d59df4
	.xword	0x032a5c52be489162
	.xword	0x065fb5bd66de4245
	.xword	0xa4d5fb46ffb5e317
	.xword	0xc8aced14b19af661
	.xword	0x2f5b0127bfb24af0
	.xword	0xb198e5ba5d7c9394
	.xword	0x251e18f8b4c3e4ae
	.xword	0xb8da391bbb851a4c
	.xword	0x9bbf381ca369754f
	.xword	0x945f470978c828b2
	.xword	0x09c9116dc7303369
	.xword	0xb26147c19d959cf2
	.xword	0x1ff4deddd9c5b900
	.xword	0x2cee7e152c07d12a
	.xword	0xa451042798cbe0f7
	.xword	0xc563d13625c5a85c
	.xword	0xebd9eb767e82512d
	.xword	0x87da03f7c66add1d
	.xword	0x9bf1a7a273a57b69
	.xword	0x3c804b69b40d4a34
	.xword	0x4b5fad8c42419357
	.xword	0x3ff6fc1227f138ba
	.xword	0x6f8320af7ab5700a
	.xword	0xb100606979d63b01
	.xword	0x0c1dc6e49185e59d
	.xword	0x4c622bc70e7e5adc
	.xword	0xca1fa72ea363ca96
	.xword	0xb83d3ccb744ae2e0
	.xword	0x6c02d051c75b73e1
	.xword	0x042fec9da258be45
	.xword	0x885fd4a40a41771f
	.xword	0xf488083eac890729
	.xword	0x78245f2d51134fe3
	.xword	0xf617cd8db5c1d15d
	.xword	0x12ef899ec629e048
	.xword	0xe0e89d9fa217423e
	.xword	0x867f57895376e185
	.xword	0x7529d9d9f5fb8145
	.xword	0x9dd1b557a99411be
	.xword	0x1a8ad3e574b9873a
	.xword	0x723e0ac48d1649bd
	.xword	0xf5f0b9250575e6a5
	.xword	0x75934d29d954a842
	.xword	0x8f80c2909733c254
	.xword	0x61aa829cffe30810
	.xword	0xdd6ddfa8c50f2e11
	.xword	0xc132a5ef6f4b0257
	.xword	0xf03d1fc99831c945
	.xword	0x74ad855839b047ec
	.xword	0xa491bb88fbada768
	.xword	0xd940ec6179daef47
	.xword	0x3a6a0fca18ebc3d5
	.xword	0x162facfb64743f86
	.xword	0xa871431e0211b47e
	.xword	0x7fa7adf9d4cb58f2
	.xword	0x3e9eefdfb8524917
	.xword	0x84da0bbaa514d0ae
	.xword	0xc6b5d811e5451e18
	.xword	0x1ed922912327154a
	.xword	0x715468911563be55
	.xword	0x968bc6dc6db7affa
	.xword	0x9066356e56ae9140
	.xword	0x72e2ff033166c39f
	.xword	0x8aa5d100e5811779
	.xword	0x9e9772453a77c3ee
	.xword	0x44864aa1078f8b3f
	.xword	0x53a40dcccb6eb0e7
	.xword	0xef44518f656c49da
	.xword	0xd640550b00d677dd
	.xword	0xbe4830a3ea4f3081
	.xword	0x88692771b85eb9aa
	.xword	0xe6e32686605017c3
	.xword	0x2233ceb5b1a8e6b6
	.xword	0x666987621f9b19e2
	.xword	0xedb5a2b66dec3ce8
	.xword	0x397ab1d71983ba39
	.xword	0x3a66d71ac70f6471
	.xword	0xa5ba4fd9510313de
	.xword	0x54ebc21c0bb09421
	.xword	0xb06f8581dffc864a
	.xword	0x07825a511323ac7a
	.xword	0x2a917df1a9843ad2
	.xword	0xd577348a5910bf52
	.xword	0xe410154ad84424b8
	.xword	0xd76df06fc4833fc6
	.xword	0x5b4169cb1f772141
	.xword	0x2b070ca8939ddc01
	.xword	0x1925ad2aa9076e0f
	.xword	0xd39f08a0aa4032b1
	.xword	0xf5708dd58482bfad
	.xword	0x92d8f5e35e0c181d
	.xword	0xac2cf1b0f180f744
	.xword	0xaecea145d9aff85d
	.xword	0xbd7af40efdeabf2b
	.xword	0xb05404859762570b
	.xword	0x9bd6648f74d8da08
	.xword	0x0aa02db4b0fb82c2
	.xword	0x304b7ebc17c7c7c3
	.xword	0x5a4de5d8c0f3da76
	.xword	0x60b5639722421a7f
	.xword	0x0e2eb2ce69db20d7
	.xword	0x7d230edf6264a33d
	.xword	0x5add081660760a7b
	.xword	0x6f504fe6d70849d4
	.xword	0xbf329d9418efb9ae
	.xword	0x5bcdf4148cba0912
	.xword	0x9b87b3aeb0d9d971
	.xword	0xe9e079f4962409c1
	.xword	0x78c1ec40ba31a9f7
	.xword	0xe3784e9a9f3e5bd3
	.xword	0xc15e8fc22e8656a8
	.xword	0xc458e7ac5de4b1a6
	.xword	0x3bd5530155ec6bfc
	.xword	0xa8dfbeab554ff6e1
	.xword	0xacb661ed136b66d8
	.xword	0xfdac9ddf9258e9fd
	.xword	0xa5bac3608b709dcd
	.xword	0xb969abbc31975736
	.xword	0x38fafac493e39f02
	.xword	0xe2319a5779b54ab0
	.xword	0x2cd38fa08e4ebdfd
	.xword	0x02373a34ba52b2d2
	.xword	0xddf2b3919090d3c0
	.xword	0xc1bf0cc3ed033a12
	.xword	0x49c32c61c7999222
	.xword	0xc60b762f01bb62ff
	.xword	0x14f339cea053e77c
	.xword	0x877a31a1b6b59cd3
	.xword	0xaeee6205ea5c3a3b
	.xword	0x86b3a4fab009fe08
	.xword	0x88a363bdab8774bc
	.xword	0x78f9c053ec756a0f
	.xword	0x82fbd4f90334ff6a
	.xword	0x6e3c7391eb038c97
	.xword	0x57863762471ebbf2
	.xword	0xfd4f56256f90fd61
	.xword	0xaf6ab0ed55cd7f17
	.xword	0x8fa99471fa1c736e
	.xword	0x427b6473f8c94a9e
	.xword	0xe2150d77bee369dc
	.xword	0xed7e6ae49d8617ca
	.xword	0xac252ddab5e42493
	.xword	0xb368ecfc459cb4b7
	.xword	0x153a348e9a5a6b6d
	.xword	0xe7fd231d35eff07e
	.xword	0x9a406a7dd8df4b4b
	.xword	0x4c1de5c5709d3c6e
	.xword	0x62f3a8e2e2fc1289
	.xword	0xda16cf6bcfb4a0f2
	.xword	0xbc5db2de7c43594b
	.xword	0xf4b1a05ff3ff5c54
	.xword	0x057415c0bd8df955
	.xword	0x0eb63951f2b8779f
	.xword	0xe36375f73d757719
	.xword	0xe3edc56ce5fa5e48
	.xword	0x947934f581270413
	.xword	0x84e9dc5af52795b2
	.xword	0x65829b2c34dfb0ea
	.xword	0xfdddd1b8a943f7d2
	.xword	0xa6ec9003bbc62c16
	.xword	0x29591ed2ff934380
	.xword	0x951333ae41b3144f
	.xword	0xcbdd4535727f4f2c
	.xword	0x1bbe67e725c2de38
	.xword	0xec8c23cf5bb3b659
	.xword	0x29e13ddae3e2210b
	.xword	0x39a178f2924270b0
	.xword	0xb81c1a66ca0f27da
	.xword	0x9c5050d181d81c5f
	.xword	0xdba387e596d99614
	.xword	0x16c12c6e4c475385
	.xword	0x7e418949f4dcb873
	.xword	0x532036580f06a3b4
	.xword	0xd95d481338eccd00
	.xword	0x33575aa23d5a1226
	.xword	0x13dcb4aa39506a02
	.xword	0x2eff053df058765f
	.xword	0x1dd6883a3a7872e6
	.xword	0x659821cd8580a27a
	.xword	0xdc3432a8a6f787c8
	.xword	0xaacb8b7673bde4a6
	.xword	0xa543d8d10f3d807d
	.xword	0x2fea83d8bcb0323a
	.xword	0x06dee21672580c37
	.xword	0x7a85d9e7d1ff542e
	.xword	0xdd47db07e033e5af
	.xword	0x8180f03a166cfc26
	.xword	0x1fd4bc8faf2c7325
	.xword	0x72a716f84ade6698
	.xword	0x6e7000501bbae47b
	.xword	0xf409de11370d0eba
	.xword	0x8e86040df11261b3
	.xword	0x919470b46a77c3c7
	.xword	0xea65558231d86177
	.xword	0xaedb06701594d876
	.xword	0x85b1e8cb4b721231
	.xword	0xcb37869478e3f997
	.xword	0x9f4a3d00f0d34f75
	.xword	0x0127adabf38d914c
	.xword	0x07d0debe4f75809a
	.xword	0x15ff4625ed913f07
	.xword	0x51c19f165330a323
	.xword	0x93c1fa75c3247327
	.xword	0x98b75fe7fa81c1d7
	.xword	0x2d80970fdb7463af
	.xword	0x69a47901a7aef94a
	.xword	0x4dd5d80e9f4444df
	.xword	0xec2ea984496d9b68
	.xword	0x2a1e29026b9545fb
	.xword	0x2c92a61cb757760f
	.xword	0x399165e34f544ab0
	.xword	0xb407581013180adc
	.xword	0x29d350034b89309f
	.xword	0x70190daf46a88783
	.xword	0x16a2a4615103d6e6



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
	.xword	0x3fc20b0db7f3f20b
	.xword	0x9feded586b8c2780
	.xword	0xc2f4660f3005dada
	.xword	0x7c14e42c1fa88763
	.xword	0xb65844ad07ae026c
	.xword	0x421d732c886e920b
	.xword	0x963d666e30af68c9
	.xword	0x55c16a99481587da
	.xword	0x749358c9b7240926
	.xword	0x7b9044f7cd072ac8
	.xword	0xec8d90be485188c8
	.xword	0x336b4cc3efc77358
	.xword	0xf8da25349595d54a
	.xword	0xf8872fe7c78754c4
	.xword	0x42ea9cbced5d14e6
	.xword	0xe0981a95f0f5cca8
	.xword	0x98efce2922b3eba3
	.xword	0x72197e5b6b9bbb81
	.xword	0x5c768afe94a2d4d8
	.xword	0x50d4a3910bb25cca
	.xword	0xdaa3ba2878a04458
	.xword	0xe3f6de162d73ac2b
	.xword	0x82d7196776fa6a2e
	.xword	0x5c59069087de05ac
	.xword	0x566db8aedc8e25e8
	.xword	0xbd0614ab1d53a4ad
	.xword	0x45f943acc6a75ddd
	.xword	0x053251b102224635
	.xword	0xe14000911c0f3903
	.xword	0x610cd6b140b30ef5
	.xword	0x884145d92800a0ee
	.xword	0xed6edc5f640ff4d5
	.xword	0xdab0b7c0d725c32d
	.xword	0x30edf8920991fe7c
	.xword	0x9b261c411c6bd1db
	.xword	0x8074772b1ce9efe5
	.xword	0xfbc6eac0b81a4c1f
	.xword	0xfd591753c9f2a345
	.xword	0xe008ef466588d0fd
	.xword	0x3da238df06cab4b4
	.xword	0x5de8d52cfcf3caa8
	.xword	0xf3b8b30ec2b0ef24
	.xword	0x2ef8783737a8eb98
	.xword	0x4500340d3ebd3779
	.xword	0x81d749724a8faeb9
	.xword	0x821d45f07c326cf2
	.xword	0x9b53be373e851ab9
	.xword	0xc026bf0165eb832e
	.xword	0x766b0fa84e044c7f
	.xword	0x605290db8ff8966a
	.xword	0x9b8018948d620cf5
	.xword	0x3e6c0e04a474436e
	.xword	0x9023af1711678e6a
	.xword	0x71a8d6391c7d9c63
	.xword	0x93e39db6f17674f0
	.xword	0x223d9632023f431d
	.xword	0x5f71547271fa03b2
	.xword	0x4211ab71a55cdd55
	.xword	0x407aa25b2f69b144
	.xword	0x6646cf4e7ec4e68a
	.xword	0x86bfc6e6f6176ab8
	.xword	0xcc2bdf702764f4cc
	.xword	0x269b8026eff19685
	.xword	0x3264f7ece66ec21a
	.xword	0x4bb5cbb9dbe0f0f0
	.xword	0xb06cb9c26e65bc52
	.xword	0x2310e0a3d74b8547
	.xword	0xbbf09f5d95d6a7f0
	.xword	0x433df2e66e1eda4b
	.xword	0x9e053c0acaa9022b
	.xword	0x1bb15d124c9c974e
	.xword	0x67358eb8fad4b5ee
	.xword	0x0327e34a83382eb9
	.xword	0x355131aa26e9172d
	.xword	0x7a006c894706ea07
	.xword	0xdf890f869894f473
	.xword	0xbe6d2413d99258ac
	.xword	0x0bb5dc33a6f66925
	.xword	0x01910baa74c8aec8
	.xword	0x886d9b25de854e7b
	.xword	0xb6629e507e8ca6f0
	.xword	0xf1c59d81b68da288
	.xword	0x536da617bb97e800
	.xword	0xf89efda1d3045fc0
	.xword	0xd3853fd6635f3e8d
	.xword	0x2871eb16cd6fa0e2
	.xword	0x3d67a3e62fa49c2c
	.xword	0xc40170fd9a494540
	.xword	0x155e8af8996a57fa
	.xword	0xc5dbdae2b9361362
	.xword	0x63824c74c0cc94d7
	.xword	0x119faddc86cedb44
	.xword	0x9046d59c432526a6
	.xword	0xada773743a4b5f9a
	.xword	0x0ea1d01295b00b38
	.xword	0xd674575092db1368
	.xword	0xe5c7822cd20afdf1
	.xword	0x2c0ac162eca2ecbc
	.xword	0x6171e980699db767
	.xword	0x323ad3802798e36f
	.xword	0x5cc891b5c0951ccc
	.xword	0xa4a4f81781e1f576
	.xword	0x1e4e50401cec8ec8
	.xword	0x4e741f7abf9215a5
	.xword	0x539579ebd51e06f5
	.xword	0xcef659fecedf7abf
	.xword	0xe376c535eac8c1c6
	.xword	0x4fee8c14290bfc4d
	.xword	0xb79a0e810ea60ac8
	.xword	0xfb00046ae927fbd7
	.xword	0x955c5199586c233d
	.xword	0xd7189fa56f27fa0a
	.xword	0xbcc4f94b1f29ce9f
	.xword	0x2d32f1bc3254d558
	.xword	0x330745ac122c8b6a
	.xword	0xa670ace3ceae4bda
	.xword	0xc21e0018889a3271
	.xword	0x730e6e67d6540fc7
	.xword	0x4886e71db038b14b
	.xword	0x278b9111da6de7f6
	.xword	0x3626196e8cfe06e2
	.xword	0x862d8983b2b5ea9d
	.xword	0x41012946e2cc7a5e
	.xword	0x51a49e06e8dc99b9
	.xword	0x315fe3948b03fb06
	.xword	0x1fb093123d77b30a
	.xword	0x940747092f4702ac
	.xword	0x020ffcb6b7176792
	.xword	0x28cc2efa6545e549
	.xword	0x4bf73495ab329e5c
	.xword	0x2a4c217a8b2ae4a5
	.xword	0x562e9a7bf9f1e982
	.xword	0x421726ab2bf90b31
	.xword	0xd608f32433c6a2f8
	.xword	0xfd325d7f9c766edc
	.xword	0x4c8a494dda107a1b
	.xword	0x4ee7bd543a2d301d
	.xword	0x217b594d6b15d45a
	.xword	0xae0896c819b5b890
	.xword	0xeeffdee972b8e84f
	.xword	0x1d3b192f9be6a454
	.xword	0x75fcde8a991aed77
	.xword	0xe3706a87241b4d40
	.xword	0xb33d6659775fbb22
	.xword	0x4e3cedd7a01db633
	.xword	0x7f0bba7280725707
	.xword	0x82bc18464b09f581
	.xword	0xd6eae574ab06044a
	.xword	0x69b749ec984c3176
	.xword	0x8002203aedd3ac45
	.xword	0x2b7076c3820f7ee6
	.xword	0xe6a27754f2199816
	.xword	0x9bcabf35d8e4e8f6
	.xword	0xa92eb8c45349de09
	.xword	0x517b21330f6e42f1
	.xword	0xb3801a2e735657cf
	.xword	0x5d2354866ecbe6c2
	.xword	0x7f8242dfeaae802d
	.xword	0xee5d738073f16f52
	.xword	0x08768a8bb1c2e9dc
	.xword	0x456b68e49add4efe
	.xword	0xe0ac688021d9ff9c
	.xword	0x927814e870664661
	.xword	0x7f5b338ff9f29b5f
	.xword	0x0cdfb3bcdad1db78
	.xword	0x401582e4ae222592
	.xword	0xbe24fe9dc7716509
	.xword	0x86afc80d3122612e
	.xword	0xac32fc5c996b8b9c
	.xword	0xf2f41f65cf890938
	.xword	0x20c4783beba3472e
	.xword	0x44c2c808ffce4adf
	.xword	0x30a4e205931897ee
	.xword	0x48f2d3d075837940
	.xword	0x4a27beb080c03220
	.xword	0x4fcf6b82d28e81f1
	.xword	0xe03824b71b7fe497
	.xword	0x6de971d14e358dbb
	.xword	0xb5df88b7e6253765
	.xword	0x38912222f6ac81c9
	.xword	0xc1a5d33217327138
	.xword	0x07acb0d935152756
	.xword	0x5d51c9f3c1ee76e3
	.xword	0xddd620d039faa97b
	.xword	0x37fbae9a3d6c657c
	.xword	0x82ff242ed119f941
	.xword	0xeed8f4aa98091b93
	.xword	0x8810014b75ef463a
	.xword	0xdb95b68ed4e00de8
	.xword	0x30c6242da34d7971
	.xword	0xa7e93687d20f7344
	.xword	0x36af1fcfe5ac5de9
	.xword	0xfb77ba6812edbb4e
	.xword	0xbd076b9fd3990dc3
	.xword	0x0a94d613b6530000
	.xword	0x8d568d8e1c700e2c
	.xword	0x5528246441d9ccb0
	.xword	0x589262ef8c0b2afb
	.xword	0x808e50663d7f80ef
	.xword	0xf7fb7a8e7621e922
	.xword	0xaedaf48dc3b6e81d
	.xword	0xb15fdcaa92837a1f
	.xword	0x9af4ecda10ce688c
	.xword	0x377f5d7ca115a185
	.xword	0x489b3c9d4c6c5190
	.xword	0x6b518b1c826b84a6
	.xword	0xd1ad81b0e6ed1d42
	.xword	0x19bb79ca5765be8d
	.xword	0x6e4407775cbc9dd8
	.xword	0x887c000d65525cea
	.xword	0x429f1dd2a75e4823
	.xword	0x02a851e34a9ce0a6
	.xword	0xd4fd7d0e5b0a3934
	.xword	0x315ba07a8e531074
	.xword	0xcb08920c6b8c7483
	.xword	0x2e8e0d1e270f49ea
	.xword	0xb43ff0d9ea2749c0
	.xword	0xe9eb0edf2654e891
	.xword	0xb04251f1f6114ce1
	.xword	0x9ac4d57a0cab0f2e
	.xword	0xab858c1e4856f498
	.xword	0x91fd7a85bbbc6de9
	.xword	0x1f11cb39f8ed67b8
	.xword	0x6da475700c2e7586
	.xword	0x6e00eaba371301df
	.xword	0x78a1af1b1f48b0c1
	.xword	0xf230b9ea8fa71a3d
	.xword	0xfe436db53d38f340
	.xword	0x6b3ab4b83468462c
	.xword	0xad4ce27207ec1f7e
	.xword	0x21ccdc53af50bcd4
	.xword	0x0deff9c6cd5d667d
	.xword	0xa876e77ac2676b40
	.xword	0x8267fec89c0a5112
	.xword	0xb113ca44dec135e3
	.xword	0xbfd1374d8ac33a4b
	.xword	0xf457d628cf6c7fde
	.xword	0x94c3c5501f6838e7
	.xword	0xdb83d6c1f9e63c5a
	.xword	0x2f10b3d999468af4
	.xword	0x16e73e35b0969587
	.xword	0x9a6e7e30e2a30eeb
	.xword	0x75b1d4eef151b088
	.xword	0x218285324542445d
	.xword	0x50df74437e152f99
	.xword	0x1cb57fcb1f2d51ec
	.xword	0xca5c40408560075a
	.xword	0x62cb17287e2a0c1c
	.xword	0xf8c15f1e61f77cff
	.xword	0x55924ffd4b8ad653
	.xword	0xe1824caa6515116d
	.xword	0xd698377d71acc0ae
	.xword	0xba875f3ab384a0c9
	.xword	0x06b8d4bb5b7e3450
	.xword	0x8f3d32c727783dc6
	.xword	0x3e9a01af1995ef58



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
