// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas_rand_1.s
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
   random seed:	810758265
   Jal pio_rnd_basic4_usr_mode_sas.j:	
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

	setx 0x627df88a6efb7ae5, %g1, %g0
	setx 0xb1edf3c15d936980, %g1, %g1
	setx 0x467f0696b13bbc81, %g1, %g2
	setx 0xe44fb1633ccec20d, %g1, %g3
	setx 0x98271eb0a55b066a, %g1, %g4
	setx 0xe50753d073fd6a39, %g1, %g5
	setx 0xabd70e4cac5e34af, %g1, %g6
	setx 0x37a4f54f6627753a, %g1, %g7
	setx 0x00f73872439bb2d6, %g1, %r16
	setx 0xdf5621ba3d817f92, %g1, %r17
	setx 0x028e3b696920d5a6, %g1, %r18
	setx 0x76445c6f62e187e8, %g1, %r19
	setx 0x81f934387f84f3f9, %g1, %r20
	setx 0x56c3fe960ab0ba51, %g1, %r21
	setx 0xafd4f1d605489459, %g1, %r22
	setx 0x04c958561e4f54b0, %g1, %r23
	setx 0x5f6c39cc90f62d52, %g1, %r24
	setx 0x98812a2ad8e410c5, %g1, %r25
	setx 0xf44e5eb746977089, %g1, %r26
	setx 0x1397b1756fdf1b4a, %g1, %r27
	setx 0xdfc0c2fa70e4d8e6, %g1, %r28
	setx 0x079b3d7e5d6da4a0, %g1, %r29
	setx 0x9dfb3504f4cf7ace, %g1, %r30
	setx 0x3aa5e61fa9e50f5f, %g1, %r31
	save
	setx 0x5f518265b418efc8, %g1, %r16
	setx 0x5fa58cbc5e79837e, %g1, %r17
	setx 0x7740cb66508ab041, %g1, %r18
	setx 0x447c610157505ae3, %g1, %r19
	setx 0x8a9c7e729cc29e6d, %g1, %r20
	setx 0xf7a1df1a81403e43, %g1, %r21
	setx 0x8194235209145254, %g1, %r22
	setx 0x502a096a1683a484, %g1, %r23
	setx 0xfc252ec8c31c5d26, %g1, %r24
	setx 0x6b661a98f58ab7cd, %g1, %r25
	setx 0x56d9748a246540da, %g1, %r26
	setx 0xfbee180c5ca37658, %g1, %r27
	setx 0xb15df336c5accabd, %g1, %r28
	setx 0x3a71861ef5e46d35, %g1, %r29
	setx 0x608c19779e02ebde, %g1, %r30
	setx 0xc0fc896567c5e679, %g1, %r31
	save
	setx 0x5ef60dd20df911c5, %g1, %r16
	setx 0x2ed1f7da8c3b1401, %g1, %r17
	setx 0xa643a3373a431f76, %g1, %r18
	setx 0x29e9b385b3af23b3, %g1, %r19
	setx 0xb2b365aa5c14f04d, %g1, %r20
	setx 0x76f3c5c1de6f8458, %g1, %r21
	setx 0x6dbd7fe4448f4746, %g1, %r22
	setx 0xc5f84ee5d44f05bd, %g1, %r23
	setx 0x570063d45b8f73b2, %g1, %r24
	setx 0x8f89f36b1276f0bc, %g1, %r25
	setx 0xa0a40bfcd01014de, %g1, %r26
	setx 0x24eada00bc2f9dd1, %g1, %r27
	setx 0x0af510a1b38b2f23, %g1, %r28
	setx 0xc4e328423df50e2b, %g1, %r29
	setx 0xfc01091850cbfcd9, %g1, %r30
	setx 0x9a5533d920b014e8, %g1, %r31
	restore
	mov	0, %r8
	setx	0x000000800432dc38, %r1, %r6
	setx	0x00000000d01ef020, %r1, %r7
	setx	0x000000800fdba358, %r1, %r9
	setx	0x000000c2dd67a880, %r1, %r10
	setx	0x000000db45035ec0, %r1, %r11
	setx	0x000000e8d7789398, %r1, %r12
	setx	0x000000f769442ea8, %r1, %r13
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe0518008  ! 1: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xec19a018  ! 1: LDD_I	ldd	[%r6 + 0x0018], %r22
	.word 0xa2318008  ! 2: ORN_R	orn 	%r6, %r8, %r17
	.word 0xec31a018  ! 3: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xe8718008  ! 3: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec01a018  ! 7: LDUW_I	lduw	[%r6 + 0x0018], %r22
	.word 0xe841a018  ! 7: LDSW_I	ldsw	[%r6 + 0x0018], %r20
	.word 0xa6c18008  ! 8: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xe0318008  ! 9: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec71a018  ! 9: STX_I	stx	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe441a018  ! 13: LDSW_I	ldsw	[%r6 + 0x0018], %r18
	.word 0xe0518008  ! 13: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa481a030  ! 14: ADDcc_I	addcc 	%r6, 0x0030, %r18
	.word 0xe4298008  ! 15: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xec71a030  ! 15: STX_I	stx	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe8098008  ! 19: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe001a030  ! 19: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xa831a028  ! 20: SUBC_I	orn 	%r6, 0x0028, %r20
	.word 0xe8298008  ! 21: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe071a028  ! 21: STX_I	stx	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec59a028  ! 25: LDX_I	ldx	[%r6 + 0x0028], %r22
	.word 0xe849a028  ! 25: LDSB_I	ldsb	[%r6 + 0x0028], %r20
	.word 0xa819a018  ! 26: XOR_I	xor 	%r6, 0x0018, %r20
	.word 0xe021a018  ! 27: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe4298008  ! 27: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0518008  ! 31: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe4518008  ! 31: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xae198008  ! 32: XOR_R	xor 	%r6, %r8, %r23
	.word 0xe0718008  ! 33: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec31a018  ! 33: STH_I	sth	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe019a018  ! 37: LDD_I	ldd	[%r6 + 0x0018], %r16
	.word 0xe4098008  ! 37: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa2898008  ! 38: ANDcc_R	andcc 	%r6, %r8, %r17
	.word 0xec718008  ! 39: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe029a018  ! 39: STB_I	stb	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8518008  ! 43: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xec098008  ! 43: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xa6218008  ! 44: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe829a018  ! 45: STB_I	stb	%r20, [%r6 + 0x0018]
	.word 0xe431a018  ! 45: STH_I	sth	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0498008  ! 49: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe009a018  ! 49: LDUB_I	ldub	[%r6 + 0x0018], %r16
	.word 0xa2818008  ! 50: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe8718008  ! 51: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe071a018  ! 51: STX_I	stx	%r16, [%r6 + 0x0018]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0118008  ! 55: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe059a018  ! 55: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xac89a008  ! 56: ANDcc_I	andcc 	%r6, 0x0008, %r22
	.word 0xe4398008  ! 57: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe821a008  ! 57: STW_I	stw	%r20, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe019a008  ! 61: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe0418008  ! 61: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa6898008  ! 62: ANDcc_R	andcc 	%r6, %r8, %r19
	.word 0xe0298008  ! 63: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8398008  ! 63: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe001a008  ! 67: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xe4198008  ! 67: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xaa918008  ! 68: ORcc_R	orcc 	%r6, %r8, %r21
	.word 0xe031a008  ! 69: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe439a008  ! 69: STD_I	std	%r18, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8018008  ! 73: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe401a008  ! 73: LDUW_I	lduw	[%r6 + 0x0008], %r18
	.word 0xaa99a030  ! 74: XORcc_I	xorcc 	%r6, 0x0030, %r21
	.word 0xec718008  ! 75: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe4398008  ! 75: STD_R	std	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe419a030  ! 79: LDD_I	ldd	[%r6 + 0x0030], %r18
	.word 0xe0198008  ! 79: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xae89a028  ! 80: ANDcc_I	andcc 	%r6, 0x0028, %r23
	.word 0xec39a028  ! 81: STD_I	std	%r22, [%r6 + 0x0028]
	.word 0xe4318008  ! 81: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe8518008  ! 85: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe001a028  ! 85: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xa0918008  ! 86: ORcc_R	orcc 	%r6, %r8, %r16
	.word 0xe831a028  ! 87: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe0398008  ! 87: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe049a028  ! 91: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xe4198008  ! 91: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa641a008  ! 92: ADDC_I	addc 	%r6, 0x0008, %r19
	.word 0xec39a008  ! 93: STD_I	std	%r22, [%r6 + 0x0008]
	.word 0xe071a008  ! 93: STX_I	stx	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8418008  ! 97: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe0118008  ! 97: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa4c1a000  ! 98: ADDCcc_I	addccc 	%r6, 0x0000, %r18
	.word 0xe871a000  ! 99: STX_I	stx	%r20, [%r6 + 0x0000]
	.word 0xe4218008  ! 99: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec118008  ! 103: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe8198008  ! 103: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa841a020  ! 104: ADDC_I	addc 	%r6, 0x0020, %r20
	.word 0xe0718008  ! 105: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0398008  ! 105: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec098008  ! 109: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe4118008  ! 109: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xaa418008  ! 110: ADDC_R	addc 	%r6, %r8, %r21
	.word 0xec318008  ! 111: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe0398008  ! 111: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0018008  ! 115: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xec19a020  ! 115: LDD_I	ldd	[%r6 + 0x0020], %r22
	.word 0xa6c18008  ! 116: ADDCcc_R	addccc 	%r6, %r8, %r19
	.word 0xe021a020  ! 117: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe821a020  ! 117: STW_I	stw	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe4118008  ! 121: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xe8018008  ! 121: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xae19a010  ! 122: XOR_I	xor 	%r6, 0x0010, %r23
	.word 0xec31a010  ! 123: STH_I	sth	%r22, [%r6 + 0x0010]
	.word 0xe4298008  ! 123: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec098008  ! 127: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe411a010  ! 127: LDUH_I	lduh	[%r6 + 0x0010], %r18
	.word 0xacb1a028  ! 128: ORNcc_I	orncc 	%r6, 0x0028, %r22
	.word 0xec318008  ! 129: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe0298008  ! 129: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec518008  ! 133: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xec09a028  ! 133: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xa6998008  ! 134: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe431a028  ! 135: STH_I	sth	%r18, [%r6 + 0x0028]
	.word 0xe029a028  ! 135: STB_I	stb	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe009a028  ! 139: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xe0118008  ! 139: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xac31a028  ! 140: SUBC_I	orn 	%r6, 0x0028, %r22
	.word 0xe0218008  ! 141: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0718008  ! 141: STX_R	stx	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4598008  ! 145: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe859a028  ! 145: LDX_I	ldx	[%r6 + 0x0028], %r20
	.word 0xa019a038  ! 146: XOR_I	xor 	%r6, 0x0038, %r16
	.word 0xe021a038  ! 147: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe429a038  ! 147: STB_I	stb	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8118008  ! 151: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe409a038  ! 151: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xae91a030  ! 152: ORcc_I	orcc 	%r6, 0x0030, %r23
	.word 0xe0218008  ! 153: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe8318008  ! 153: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe449a030  ! 157: LDSB_I	ldsb	[%r6 + 0x0030], %r18
	.word 0xe4198008  ! 157: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa8a98008  ! 158: ANDNcc_R	andncc 	%r6, %r8, %r20
	.word 0xe421a030  ! 159: STW_I	stw	%r18, [%r6 + 0x0030]
	.word 0xec71a030  ! 159: STX_I	stx	%r22, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe809a030  ! 163: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xe4198008  ! 163: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa801a000  ! 164: ADD_I	add 	%r6, 0x0000, %r20
	.word 0xe021a000  ! 165: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xec298008  ! 165: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec09a000  ! 169: LDUB_I	ldub	[%r6 + 0x0000], %r22
	.word 0xec51a000  ! 169: LDSH_I	ldsh	[%r6 + 0x0000], %r22
	.word 0xaea9a018  ! 170: ANDNcc_I	andncc 	%r6, 0x0018, %r23
	.word 0xe4218008  ! 171: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe0318008  ! 171: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe441a018  ! 175: LDSW_I	ldsw	[%r6 + 0x0018], %r18
	.word 0xe0098008  ! 175: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa6a98008  ! 176: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xe039a018  ! 177: STD_I	std	%r16, [%r6 + 0x0018]
	.word 0xe4218008  ! 177: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe809a018  ! 181: LDUB_I	ldub	[%r6 + 0x0018], %r20
	.word 0xec01a018  ! 181: LDUW_I	lduw	[%r6 + 0x0018], %r22
	.word 0xac098008  ! 182: AND_R	and 	%r6, %r8, %r22
	.word 0xe439a018  ! 183: STD_I	std	%r18, [%r6 + 0x0018]
	.word 0xe8218008  ! 183: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec598008  ! 187: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe809a018  ! 187: LDUB_I	ldub	[%r6 + 0x0018], %r20
	.word 0xa0a98008  ! 188: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xe4298008  ! 189: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xec71a018  ! 189: STX_I	stx	%r22, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe001a018  ! 193: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xe011a018  ! 193: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xacc1a000  ! 194: ADDCcc_I	addccc 	%r6, 0x0000, %r22
	.word 0xe029a000  ! 195: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe031a000  ! 195: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe8598008  ! 199: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe401a000  ! 199: LDUW_I	lduw	[%r6 + 0x0000], %r18
	.word 0xaa298008  ! 200: ANDN_R	andn 	%r6, %r8, %r21
	.word 0xe0298008  ! 201: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8718008  ! 201: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0498008  ! 205: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe059a000  ! 205: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xa2c18008  ! 206: ADDCcc_R	addccc 	%r6, %r8, %r17
	.word 0xec298008  ! 207: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe8298008  ! 207: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8118008  ! 211: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xec598008  ! 211: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xa4118008  ! 212: OR_R	or 	%r6, %r8, %r18
	.word 0xec318008  ! 213: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec31a000  ! 213: STH_I	sth	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe8418008  ! 217: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe051a000  ! 217: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xacb9a020  ! 218: XNORcc_I	xnorcc 	%r6, 0x0020, %r22
	.word 0xe821a020  ! 219: STW_I	stw	%r20, [%r6 + 0x0020]
	.word 0xe871a020  ! 219: STX_I	stx	%r20, [%r6 + 0x0020]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe011a020  ! 223: LDUH_I	lduh	[%r6 + 0x0020], %r16
	.word 0xe0418008  ! 223: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa4b9a018  ! 224: XNORcc_I	xnorcc 	%r6, 0x0018, %r18
	.word 0xe421a018  ! 225: STW_I	stw	%r18, [%r6 + 0x0018]
	.word 0xe471a018  ! 225: STX_I	stx	%r18, [%r6 + 0x0018]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe4098008  ! 229: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xec49a018  ! 229: LDSB_I	ldsb	[%r6 + 0x0018], %r22
	.word 0xac118008  ! 230: OR_R	or 	%r6, %r8, %r22
	.word 0xe429a018  ! 231: STB_I	stb	%r18, [%r6 + 0x0018]
	.word 0xe0318008  ! 231: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe8118008  ! 235: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe841a018  ! 235: LDSW_I	ldsw	[%r6 + 0x0018], %r20
	.word 0xa6a9a030  ! 236: ANDNcc_I	andncc 	%r6, 0x0030, %r19
	.word 0xec31a030  ! 237: STH_I	sth	%r22, [%r6 + 0x0030]
	.word 0xec218008  ! 237: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec51a030  ! 241: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xe0598008  ! 241: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xae81a008  ! 242: ADDcc_I	addcc 	%r6, 0x0008, %r23
	.word 0xe0298008  ! 243: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe039a008  ! 243: STD_I	std	%r16, [%r6 + 0x0008]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0018008  ! 247: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe0018008  ! 247: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xaa99a030  ! 248: XORcc_I	xorcc 	%r6, 0x0030, %r21
	.word 0xe0298008  ! 249: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe421a030  ! 249: STW_I	stw	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xec518008  ! 253: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe001a030  ! 253: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xae09a000  ! 254: AND_I	and 	%r6, 0x0000, %r23
	.word 0xe821a000  ! 255: STW_I	stw	%r20, [%r6 + 0x0000]
	.word 0xe0218008  ! 255: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0118008  ! 259: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xec518008  ! 259: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xae818008  ! 260: ADDcc_R	addcc 	%r6, %r8, %r23
	.word 0xec71a000  ! 261: STX_I	stx	%r22, [%r6 + 0x0000]
	.word 0xe0318008  ! 261: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xec01a000  ! 265: LDUW_I	lduw	[%r6 + 0x0000], %r22
	.word 0xe4098008  ! 265: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa691a018  ! 266: ORcc_I	orcc 	%r6, 0x0018, %r19
	.word 0xe0718008  ! 267: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0318008  ! 267: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec49a018  ! 271: LDSB_I	ldsb	[%r6 + 0x0018], %r22
	.word 0xe8518008  ! 271: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xa419a010  ! 272: XOR_I	xor 	%r6, 0x0010, %r18
	.word 0xec39a010  ! 273: STD_I	std	%r22, [%r6 + 0x0010]
	.word 0xe0318008  ! 273: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec498008  ! 277: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe0018008  ! 277: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa809a008  ! 278: AND_I	and 	%r6, 0x0008, %r20
	.word 0xe429a008  ! 279: STB_I	stb	%r18, [%r6 + 0x0008]
	.word 0xe8218008  ! 279: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec59a008  ! 283: LDX_I	ldx	[%r6 + 0x0008], %r22
	.word 0xe0118008  ! 283: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa431a008  ! 284: ORN_I	orn 	%r6, 0x0008, %r18
	.word 0xec318008  ! 285: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xec31a008  ! 285: STH_I	sth	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe451a008  ! 289: LDSH_I	ldsh	[%r6 + 0x0008], %r18
	.word 0xe409a008  ! 289: LDUB_I	ldub	[%r6 + 0x0008], %r18
	.word 0xae31a008  ! 290: SUBC_I	orn 	%r6, 0x0008, %r23
	.word 0xe821a008  ! 291: STW_I	stw	%r20, [%r6 + 0x0008]
	.word 0xec39a008  ! 291: STD_I	std	%r22, [%r6 + 0x0008]
	setx	0x00000000d01ef010, %r1, %r6



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
	.xword	0x5a57a18197b5b380
	.xword	0x2cf444496593b044
	.xword	0xb33b4a6b4358c116
	.xword	0x69b729e61e98aafa
	.xword	0x61a2b7c76984d00d
	.xword	0x914bccf5adf9157f
	.xword	0x319c50d27dc0ee3f
	.xword	0xbe183a2b496f4687
	.xword	0x2caed4f6981e9365
	.xword	0xc74267b7e37f3070
	.xword	0xd2e3f028e2c2b2ad
	.xword	0x57ce8491c86b1bef
	.xword	0x625e939e4a4caeba
	.xword	0x29e5f7767c9302af
	.xword	0x1e20afb53bd7e884
	.xword	0x5a5032a0ae620794
	.xword	0x7a6e3a4749ba4e1b
	.xword	0x317a29d59974065b
	.xword	0x53951f58474f13ee
	.xword	0x7d1982d53adeffd0
	.xword	0xc4cc66b332ef5a5a
	.xword	0xd225e095bfb4132d
	.xword	0x50537eae892851f3
	.xword	0x0d7c4232c7d890f9
	.xword	0x4bd39925b7aadad2
	.xword	0x734385e6e58558fb
	.xword	0x4a96c25b97625446
	.xword	0x84c61e1a38571059
	.xword	0x23ec12c88d95eeb7
	.xword	0xfbc25255b060b3b3
	.xword	0xb48484fe6fed5dfa
	.xword	0x5be63ce67d664557
	.xword	0xa6449ca144547ac9
	.xword	0xe3801d7663bfcbee
	.xword	0x675352c823546d2c
	.xword	0x4ab23f103b1e11b0
	.xword	0xeca74ed0710ea7a8
	.xword	0xb9e921a126c4d047
	.xword	0x3b0d394d5653a202
	.xword	0xbd7065c5845c111d
	.xword	0xb3229a447a736dda
	.xword	0xff7a330323145ead
	.xword	0x601ae736093a9b0f
	.xword	0xc59b25cdc652f80c
	.xword	0x7be2ba745054a902
	.xword	0xb0ee954e29c39d76
	.xword	0xd57ef05804e0587e
	.xword	0x141eb23b12d05ba6
	.xword	0xcfa5040c85105411
	.xword	0xe4188dbb67c99164
	.xword	0xbce198591b086a45
	.xword	0xbe6bcf899ba434f7
	.xword	0x044dc0d12b80ea5a
	.xword	0xaf8d30146ff1ed7b
	.xword	0xd0169715cdf2b49c
	.xword	0x81fbcfe49c7c8903
	.xword	0x6b8c510d452b5921
	.xword	0x32c3fe8be652e5fd
	.xword	0x05e53c91102ff5e4
	.xword	0x80efd3e6d5723f85
	.xword	0xb734fcb302e4f9b5
	.xword	0xcee9f4b5b9741288
	.xword	0x429626ffeb825c84
	.xword	0xf1a9df377dcf5e43
	.xword	0xa3e4964246f50905
	.xword	0xe5249318013eb0c3
	.xword	0x0cf4e6171312abd4
	.xword	0xf6e5b6cdb1c9d408
	.xword	0x1ccbda62f9bd8844
	.xword	0x3cad469fb99389c0
	.xword	0x5f59f3de9f26cf3a
	.xword	0xa4d6af7675071c2b
	.xword	0x49eb1243df6d0a6d
	.xword	0x4488f6d957322a3e
	.xword	0x4f3a18741dbd8d3f
	.xword	0x252acca051a5d58a
	.xword	0x744dc59bae6e94a0
	.xword	0x6c385373c5de3ba9
	.xword	0xce17e6ea30aaa093
	.xword	0x2fbc2c552593c51a
	.xword	0xa4ebb7de91f05a76
	.xword	0x173d3062f976c4f8
	.xword	0x1d56db780dc05579
	.xword	0x90742e1ee5f2c8ee
	.xword	0x9cd031219fceaeed
	.xword	0x92b03dc55de5fbe9
	.xword	0x297a7510d3438d55
	.xword	0x29d291cf3af666dc
	.xword	0x507d5cdf9848ab40
	.xword	0xf6cfc8b1c3863b03
	.xword	0xe35ac1a9b294bbf4
	.xword	0xb7bce25438130d86
	.xword	0xfb9a8c689163b856
	.xword	0x3add367d819b039e
	.xword	0x7223fbfcaa10ce68
	.xword	0x8a87a2fc3d87d58f
	.xword	0xe7d0489512fd29a2
	.xword	0x2ae5df065975b956
	.xword	0x675dcc802ec990a9
	.xword	0x0aab251ad5b7592a
	.xword	0xe1499a048babfa92
	.xword	0xd1e2a48c618dccdd
	.xword	0x9fab0d134b341de6
	.xword	0x7295e91931c9572c
	.xword	0xa0de43549e0d3795
	.xword	0x9ff2571f4cb0e8a6
	.xword	0x9ae1f6880df80b0a
	.xword	0x599f7ba35718fa43
	.xword	0x22f86e7ddeb0265c
	.xword	0x7fc7e05c87c6367e
	.xword	0x12b805f901d64be3
	.xword	0x8e3c18355cad4080
	.xword	0x15b353db6261744a
	.xword	0xd0021745f2adfce5
	.xword	0x4b57e782d00ae723
	.xword	0x3258a860c2734870
	.xword	0xdac7a9df2ee32609
	.xword	0x0eebb772a3255829
	.xword	0x284f92e89647fb3d
	.xword	0x177fdb1f606a75ad
	.xword	0x96f31f244d660aa8
	.xword	0xda847515bcfa9c80
	.xword	0xb4c29e565f44d267
	.xword	0xfff429248a249dda
	.xword	0x0ba978607d3a923a
	.xword	0xa45d680b460ca9fe
	.xword	0x1c5f1205ff345bd8
	.xword	0x98cd87d3b69d4751
	.xword	0x3cdb57681f7670df
	.xword	0x691fa0eb7c1844ce
	.xword	0x57a16df1b35c3854
	.xword	0xae603dd3d45081dd
	.xword	0xe51d12460338b43f
	.xword	0xd40426dced2a2b5b
	.xword	0xec8ae6736e3f896d
	.xword	0x80b06f59de424a06
	.xword	0xf49c3b34711a0646
	.xword	0xa5b6d2a4426cd528
	.xword	0x02b2a38ff11efbe9
	.xword	0x9177ea2778a48592
	.xword	0x3a61db209f0559f4
	.xword	0xd928dc5a41b405a9
	.xword	0x0cd0039d72fbe42d
	.xword	0x05fe695251d07715
	.xword	0xc349a8b35a45b6b4
	.xword	0xae04a118ce2e8cb5
	.xword	0x976a0521361d909f
	.xword	0x069e1bd2f7e86c03
	.xword	0x9fda4c6aee018921
	.xword	0xa00ea91ae839b51a
	.xword	0xa2cc3e0f655ae523
	.xword	0x7809bb5c63d53714
	.xword	0x91343de205c1e1bd
	.xword	0xbdf1e9771ff69d30
	.xword	0x5c5d2cb24b60921e
	.xword	0x4db4962bb285ccf2
	.xword	0x2c2e4b1d68939cd7
	.xword	0x00ba71ecf2985003
	.xword	0x2d5b10eece43c6aa
	.xword	0x79aa5d34151724e6
	.xword	0x9e34c0aebfa3a439
	.xword	0x139974740ff78ecf
	.xword	0x4287796f72572bc9
	.xword	0x14ee40532cccd886
	.xword	0x94c51fb130d8d67f
	.xword	0x7d5c603fc564412e
	.xword	0x502f98f6e5dfc1e2
	.xword	0x5c531b60f15521c4
	.xword	0xa6346625a9a34313
	.xword	0x793c88455e3f5b81
	.xword	0xf22daed587b27635
	.xword	0xf5cb47fc5030b50b
	.xword	0x18af46dca879c6ba
	.xword	0xc073535511fb8acf
	.xword	0x66004518c54927e5
	.xword	0x2dace17dd16c2e79
	.xword	0xcb857f5843d349d2
	.xword	0x7daabd1e0987fadb
	.xword	0xf26f9083d3254e0b
	.xword	0xe1bb234542f18cac
	.xword	0x2323f76abc6693af
	.xword	0x1144dc0f00d5d68a
	.xword	0x70df8840174ff79b
	.xword	0x80647e8d9a68fd61
	.xword	0x438d697a4aad92b5
	.xword	0x17e3f7e2e3739203
	.xword	0xc7d9b6984682d6db
	.xword	0xc79a0bee26b49362
	.xword	0x4658925599394f4b
	.xword	0xbd32d84564c06b83
	.xword	0x280d29306960aa70
	.xword	0x006259568023d86e
	.xword	0x39a770d92763489e
	.xword	0x3b3551c0b70d9764
	.xword	0x2a873e519273de22
	.xword	0x085daa9199e9b139
	.xword	0x3e2076e8c3578afd
	.xword	0xc5735a3ce8ab46ec
	.xword	0xcd486d8e3572aa72
	.xword	0x75852fe15afd7191
	.xword	0x42c4fc50bffe46eb
	.xword	0xe7c340c134e3d8b4
	.xword	0xb4568d2444ea1350
	.xword	0xc8553f0d0fd0944e
	.xword	0xaea56dce27866fa5
	.xword	0xe072ed8de6997b47
	.xword	0xda25cb55a5f89ea4
	.xword	0xa241f3a79a06b864
	.xword	0xa3ef59a6e4abd244
	.xword	0x6d6023ad5fa130a8
	.xword	0xdecfa75871df1904
	.xword	0x934d2db858ebbb37
	.xword	0x8821eb93aec0d6cd
	.xword	0x6619484458d1c566
	.xword	0xc3102765c99d353a
	.xword	0x02c3a183d3bae1e8
	.xword	0x8f784f05e974d36c
	.xword	0x8caa9f5c8089534f
	.xword	0x0a8d05259733d7ae
	.xword	0xb8ebe07c8f34c3cb
	.xword	0x133aa6f99b3124a2
	.xword	0x94a1eba9b8cf28b7
	.xword	0xae2e9cbfe1c64552
	.xword	0x0a5912f9cd1216f2
	.xword	0x3ee6d16e5f3f615c
	.xword	0x23d9cc2bb44a7649
	.xword	0x34586c8e5861611f
	.xword	0x5ca30e914390cdee
	.xword	0x25d604b461d39ff1
	.xword	0xa97064139bad0b8d
	.xword	0xd282e06850b1dadb
	.xword	0xc66c22139321a3ee
	.xword	0x1c2b096c6475af83
	.xword	0xbeec1328f0bd0e9c
	.xword	0xdc66dbba91069f1d
	.xword	0xc50af417fb4a372a
	.xword	0x9a37922acee1dd7b
	.xword	0xf7210531ed9d3686
	.xword	0xdd700d5f2bac292d
	.xword	0x3d369e919da72c48
	.xword	0x77e843cd6927358c
	.xword	0x35dc3e1a3b6d1e4e
	.xword	0x75bab8adeca8ba76
	.xword	0xb3b8cedb398b8ae7
	.xword	0xc02625a1a3e3f81e
	.xword	0xc4416cafd36421a5
	.xword	0x029edade187be431
	.xword	0x1445d719d3b17198
	.xword	0xf98742abbc42d4a7
	.xword	0x6973d6408ffcb4bd
	.xword	0x0c9b8034ad050eb0
	.xword	0xca19355f22ea9af9
	.xword	0x96ac3af438fe2fa4
	.xword	0xdcfb332cc93cce6f
	.xword	0x9b84d92cc6b401f6
	.xword	0x1721bd5ae70cc8ef



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
	.xword	0x9ac7d932993bea4c
	.xword	0xdb60452b5c98fd5a
	.xword	0x90dd6ddc2c46550d
	.xword	0x4736d996a9778220
	.xword	0x920154487c372433
	.xword	0x4bc511365986305b
	.xword	0xbc7918a9b25bc1d6
	.xword	0x4d3b0ae2d818f599
	.xword	0x15c31b7e77ba13ab
	.xword	0xf008029f78cd3da7
	.xword	0x9c1d5a123f1966d7
	.xword	0x0b51c125ff5ddc1b
	.xword	0x9bdc13bd3aac61b8
	.xword	0x978901fb7364086f
	.xword	0x1716b732cfb92ff0
	.xword	0xcf0f5127ef7e690f
	.xword	0x315a3b4a8ecc69c3
	.xword	0x0c2ec0a139b29fd9
	.xword	0xb556d409d10641ff
	.xword	0xadd101243c522e20
	.xword	0xa79a3b01d43c9da7
	.xword	0x16f1a0c5dde04b02
	.xword	0x4d4c3faeaaf74a27
	.xword	0x68b492b5c1a28712
	.xword	0xa0553b24310e1ea6
	.xword	0x3f564c060902f6a6
	.xword	0x8bf5410859c4ddb5
	.xword	0x5a5095b190226ada
	.xword	0x3d955b678de7298c
	.xword	0x373aa554b375cfbd
	.xword	0x0af0f624c29d1f9d
	.xword	0xf3202baced0b8ed5
	.xword	0x2ea9fe71f97c4062
	.xword	0xcd031e3a9ee68a83
	.xword	0x286ab3683fd61745
	.xword	0xd13e0273307847ba
	.xword	0x8ef9346f48b50899
	.xword	0x7c2994e84c564848
	.xword	0xfb2fc093d01e9a6f
	.xword	0xddd4f249601b1e03
	.xword	0x7948692bfda4c494
	.xword	0xf7d1e58b5f5872fb
	.xword	0x4ce44f2dfda63ce2
	.xword	0x7498b4860267b59b
	.xword	0xaa3a12bd11809dd2
	.xword	0xe0dfe5aaaf545ec1
	.xword	0x0e5a91f720c22953
	.xword	0x48ff71c07e292d75
	.xword	0x7b9daa14e19a0b18
	.xword	0x5e05d85931b7eff7
	.xword	0xa90f77dc01151758
	.xword	0x258b45a13a90dc1b
	.xword	0x32a164acfaeff64f
	.xword	0x7b124b7e8d4fd151
	.xword	0x5e69e35290d77c21
	.xword	0xe10e240b530132e9
	.xword	0xb9d660a802d9351f
	.xword	0x94b77a6af9bfb8c1
	.xword	0xace41cc74de8297d
	.xword	0x08640a94cd2a3d35
	.xword	0xb84cfa7e31854c7a
	.xword	0x040b5f807c6aec29
	.xword	0x5a7202e78c3b9fef
	.xword	0xf3e6820661131322
	.xword	0x48fdd9b02258a504
	.xword	0x1a99ed4e0a7f4fe5
	.xword	0xa9e139629bd4f0f0
	.xword	0x68ca72da8c05bed5
	.xword	0x04a6a21af29f06af
	.xword	0x5ab167d78ae02107
	.xword	0x4a53e8e391681b9c
	.xword	0x56dbd3b0e9042b6e
	.xword	0x6faf7c6e7513cd15
	.xword	0x537d90a90e22e5da
	.xword	0x0ed804aa913b29ac
	.xword	0x09265c15f3f9d137
	.xword	0xa31563ef570652e4
	.xword	0x0862658c93223986
	.xword	0x08844506c409e0ef
	.xword	0xa64ce0340549e293
	.xword	0x1d8498fbad72fcbb
	.xword	0x9ca9dd2f5e783038
	.xword	0x9bcd1f9c4e2c4384
	.xword	0x72cc1c30003c9d5d
	.xword	0xb4cd60ec5d677f2d
	.xword	0xaa688b257024a430
	.xword	0x92e8ce3a278b4f5a
	.xword	0x198b5249d57db9ca
	.xword	0x036464d1b3604f7f
	.xword	0x6a9626fe54e1e032
	.xword	0x0e65216758c0e666
	.xword	0xc89ae84d1f0994ea
	.xword	0x1d39eec3a3b2cfe0
	.xword	0x92f94af61f9b8ec7
	.xword	0x660f213c447ee8d9
	.xword	0x768af57d7ac3587c
	.xword	0x9f2a9ef472cf6f40
	.xword	0x2ed3b42615e7eedb
	.xword	0x0938e7230e6fde3a
	.xword	0x8a81c02c0ec80996
	.xword	0x27515e75d2a6802e
	.xword	0xdfed837baec1075a
	.xword	0x577be895edef2c34
	.xword	0x81a23dbb60f5f682
	.xword	0xc4e47c5ff962a9be
	.xword	0x31f37b832f3a79b1
	.xword	0x53d829c81f4db77d
	.xword	0x077f7538a313f391
	.xword	0x7b66d44d5da0816d
	.xword	0xde34dec9e992589e
	.xword	0xf4b054b9d96c6b3b
	.xword	0x5911156fe6c1db0e
	.xword	0xeb5c24f03a61f7b9
	.xword	0x2404b4e843a9f7c8
	.xword	0x677793c5d5bd6cdd
	.xword	0x02bde455aca9cf5e
	.xword	0x2bf530a7abe7a51f
	.xword	0x95b6f2d63050f6a6
	.xword	0x7548cb53e2fa68dc
	.xword	0xfc06189e133d8e96
	.xword	0xab8ee0f788d5e9f1
	.xword	0xcd3ba538143fa1f9
	.xword	0x717020b623905c9b
	.xword	0x8bbbf6a78be05c49
	.xword	0x826d24bfaa2fa3af
	.xword	0x3a2da0eca5393a15
	.xword	0x387bac23676b2308
	.xword	0x6fc0f1d6b4cda7a5
	.xword	0xbbc63c2ff39f61eb
	.xword	0x27f27102d654be98
	.xword	0x86fe8b083a2233d0
	.xword	0x15c8f0d0d72b4222
	.xword	0xe6aa0d5cb59aa834
	.xword	0x3b2ab8487075b19c
	.xword	0xc6ec16bd3777a8e0
	.xword	0x4f24edf65ce095fc
	.xword	0x7954149b47382d72
	.xword	0x91c6d6c5954247da
	.xword	0x00c147760cc0046c
	.xword	0xe36d049042e66360
	.xword	0x66962f89a1a20920
	.xword	0x43b4962246fdfce5
	.xword	0xacf235b7933e0938
	.xword	0xa0918df50170b723
	.xword	0x69a7995e24cdc65a
	.xword	0xe076de22c425564f
	.xword	0x7ed0b1fdead8edf1
	.xword	0x3755ad5beea3b42e
	.xword	0x5e0b4c0d84b5e30a
	.xword	0x3173972165e9a9a1
	.xword	0x946e4274d1155d73
	.xword	0x635c676e53b7f25a
	.xword	0xc9900a14732ab405
	.xword	0x8d86525492d7e820
	.xword	0x730873349d7b3483
	.xword	0x326dd472978e2953
	.xword	0xc4daa46398dffdaa
	.xword	0xca4f5899d443388e
	.xword	0x549d195e0c80aa01
	.xword	0x25aff511a0669f15
	.xword	0x066e41466a75d7b5
	.xword	0x001bbbe2ebfa787e
	.xword	0x6314cb9a1369e5c7
	.xword	0x7a951b590ec1c83d
	.xword	0xba93074e094bd0d8
	.xword	0xbda1b0f6b8090303
	.xword	0x21bf8dc62dcaa75f
	.xword	0x921f7d4414f05f13
	.xword	0x0e67455b315eb68b
	.xword	0x4d643151f4406f02
	.xword	0x36a823c51b4c9889
	.xword	0x70a747f9ee88951d
	.xword	0xc42ca2c5606ab7e6
	.xword	0xf7191740a7658843
	.xword	0xa79bfe0990d6ecee
	.xword	0xeb538fe6e619eec5
	.xword	0xb2f4cde23efbc44f
	.xword	0x0c484e146666e18b
	.xword	0xc242781a0648033f
	.xword	0x8cd9ffbfb64ada40
	.xword	0x60d04bec0f94f789
	.xword	0x05bed9c86645acd3
	.xword	0x22d8fc2239f96bfc
	.xword	0x7ac427d56d77380a
	.xword	0xb4a52393e983c169
	.xword	0xfe049cfdb62213ae
	.xword	0x6ec5de9947a31c3a
	.xword	0xb77ffc0a886afb9b
	.xword	0xec899b1aba9fc08e
	.xword	0x9395d781bab1f725
	.xword	0xa0cef1bbb57c34a5
	.xword	0x08f54e94ef1d2a2c
	.xword	0x6a2f0fb6841654ee
	.xword	0x3e8234a974afac33
	.xword	0x390a36b99dc3052b
	.xword	0x3ea92d958fac598a
	.xword	0x72e03eafb3236a8e
	.xword	0x104becd72c34b0ae
	.xword	0xc26839838aa3c0bf
	.xword	0x1f7ddff48c6c8ad5
	.xword	0x239abaabf95cdeec
	.xword	0xdfb7f046e69f3e64
	.xword	0xc3742c4eeaf80822
	.xword	0x5bd168c6416f9523
	.xword	0x14bdec8fcea5beb4
	.xword	0x29ff521f778346b1
	.xword	0xd25d45d171664ef7
	.xword	0x22daf225f03c56ea
	.xword	0xd2f2110efc572624
	.xword	0x4352e0c9fcbeee83
	.xword	0xe02c666e4ddb1fc2
	.xword	0xece28a7be76ade3e
	.xword	0x713772ff448ea437
	.xword	0x56102f571fa2a4cd
	.xword	0xac59cb5d4a8410d6
	.xword	0xda54a85545d48886
	.xword	0xa0f3bb1c181ed9bf
	.xword	0x568eee464e106769
	.xword	0xa79d72bced2efd38
	.xword	0x6103832bde20c762
	.xword	0x4d23cd605c13dee0
	.xword	0x3c8508a0fbcfdee6
	.xword	0x72a083290b34349b
	.xword	0x9e7f55f4dd87019c
	.xword	0x8c8a263c4ee8eb18
	.xword	0x43f55511f0444fc7
	.xword	0x19999b1f1adb0db8
	.xword	0x19dcc1b620c5e970
	.xword	0x7b4e6642c87de594
	.xword	0xaf30b1818fc6ac72
	.xword	0xa0a05726972bb9cf
	.xword	0x650856479ddd716a
	.xword	0x60729cb06646d1ad
	.xword	0x58f3fc7ca0563a22
	.xword	0xe39b49868d75a4bf
	.xword	0x106015392f39b0f9
	.xword	0xda5e33cdb3ec2e67
	.xword	0xbadb72e64e633dd7
	.xword	0x11edf701d9223c43
	.xword	0xc1a508a5b65d7fee
	.xword	0x79e564004c38dcb5
	.xword	0xe64b26424ec381a5
	.xword	0x67c27715ac7568ad
	.xword	0x42248f40aaccd0a2
	.xword	0xd785b7f3726834bb
	.xword	0xdd74c0a8de015155
	.xword	0xda837d6f81309b07
	.xword	0x088ebeedccd638cd
	.xword	0x09f5e39c6d5ef5a1
	.xword	0xe84c3512171ae321
	.xword	0x7e51d479b18f1202
	.xword	0x1b2288e61035b398
	.xword	0xde5b202c7506dda8
	.xword	0xdfd6e9a854b89588
	.xword	0xe284f8df8c015e02
	.xword	0x8374dd72ce18ed9d



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
	.xword	0x862c1eb0a3490b2a
	.xword	0xfe3eee76162d115c
	.xword	0xa8c96f8e2b0ca59d
	.xword	0x09b26a9aad8e5e4a
	.xword	0x10ea9660692b966e
	.xword	0xa52a0771ad04128f
	.xword	0x896e5a0ffb5793de
	.xword	0xb0742b8b5dccf134
	.xword	0x45524e23b5c3dd33
	.xword	0xf3cb17b42fc33897
	.xword	0x87be8a176fa0ec76
	.xword	0x902fd91fdfdf8c1d
	.xword	0x02c9e39a74df19f6
	.xword	0xdb46950298d51854
	.xword	0xb0f69d99fdf35fa5
	.xword	0x4c12ff2f97117431
	.xword	0xd2ef3cbc0c5bfea3
	.xword	0x1cd5132ce5aaff98
	.xword	0x35dd3c6202dd160c
	.xword	0x29966b2b424b5442
	.xword	0xfe6693926cba1039
	.xword	0x20ccab1e28ddf403
	.xword	0x71fd1b7a8c007d50
	.xword	0xd9a2d53309fdba25
	.xword	0xa1ee23d5044f8590
	.xword	0x3732bfe9cf584dc5
	.xword	0xb8984038db908fb1
	.xword	0xa564ae18f71f20e9
	.xword	0x04b2f0d9e104cc36
	.xword	0xe076bb0c5ae5aeed
	.xword	0x22ad05600771bcc1
	.xword	0x0220425384b2d3fd
	.xword	0xa1a06a8367cd3254
	.xword	0xa9b6f4636ab2a63e
	.xword	0xffec9c45d26f4710
	.xword	0x58f738502134bbbe
	.xword	0xb303b41a1d5f4391
	.xword	0xfd286aab76af740c
	.xword	0x2ce25a17d838de49
	.xword	0x2cd78d4addc8fe48
	.xword	0x90f460dc724b052f
	.xword	0xaef17ef68d44f8c5
	.xword	0x99f0af4a015dd639
	.xword	0x7cc5f2c594382ecc
	.xword	0xcf94b8d0fe7eecf9
	.xword	0x781706e47a35673f
	.xword	0xf31db94ce38eabf2
	.xword	0x70b244e6fa33f819
	.xword	0x84ced478db7618b4
	.xword	0x1550992c385355eb
	.xword	0x75ae6521770397ec
	.xword	0x5dfbdfb4dd93db35
	.xword	0x63880cce2003e8ee
	.xword	0xa88fb03205d081d4
	.xword	0x19a9a639d0e60e6b
	.xword	0xa46a011195686b6a
	.xword	0x5d5a281492791650
	.xword	0xf378cee6a8aef22a
	.xword	0xe0e3d38aad74f2f3
	.xword	0x9a6214fea9d6dfc9
	.xword	0x3d8d639a8877db99
	.xword	0x08c062db91fb602f
	.xword	0xf663a085e6818d03
	.xword	0x11f2d80ad81358a6
	.xword	0x7554654da41d5f02
	.xword	0x55c743af9f3b3aa1
	.xword	0x749fcf320695abe1
	.xword	0x21f5729b14b440ce
	.xword	0xfae19311631718c3
	.xword	0xc9362438ef3b914e
	.xword	0x58d65e435aef7024
	.xword	0xb127abcb6d88d957
	.xword	0xea8e30f1c739a700
	.xword	0xffb964ba7a03d7b7
	.xword	0x04962bb88a6908bf
	.xword	0xf01a445300695dc0
	.xword	0x0d0659481b995312
	.xword	0x7723b60994fc3d03
	.xword	0x502e3fb080c978fd
	.xword	0x5598d04d8262b270
	.xword	0x700dc7ade67995f3
	.xword	0x5e0c90b65cb8515f
	.xword	0x03e94f263068d110
	.xword	0x266dded1e0ee7b3a
	.xword	0x45ee2bf803d4ad83
	.xword	0xfaa207f82ed81cb4
	.xword	0x2f2317b76661be7f
	.xword	0xc8a604f5d871d38a
	.xword	0x95ec8635f6655972
	.xword	0xe70eee433f347267
	.xword	0xa62cf6a13ce01d5f
	.xword	0x20be5c1b95fe7995
	.xword	0x8c64cc234a8a9538
	.xword	0x81a307c40a505ee5
	.xword	0x283e032c5a16bbc7
	.xword	0xd6aab6f73a285f1c
	.xword	0x67af317d9b19fe98
	.xword	0xeaa8473e14a4852f
	.xword	0x4919b564f3a9032b
	.xword	0x653cf2d357ee2980
	.xword	0xa5dd5a385a47a6c6
	.xword	0x606cc13a46da38a4
	.xword	0x5ecd2f54156b0646
	.xword	0x92853fd5f13319cc
	.xword	0x9355df35f1fdbbae
	.xword	0x904d7629d54a96aa
	.xword	0x7948828fd8eb3de7
	.xword	0xf3802d96c0bce255
	.xword	0x40fbd8e4229a9eb1
	.xword	0xcaef6fb84a65a526
	.xword	0xbbd3da9f5dadafab
	.xword	0x8a499eab3831403b
	.xword	0xdd9da5a2f635c2ff
	.xword	0x9839bfa94f30b222
	.xword	0x8ee8f43563a0daa3
	.xword	0x828f79d988c6651e
	.xword	0xf4cbffd2224e71c0
	.xword	0xde7dffc8cfd72a4d
	.xword	0x1b0701bdb0114c60
	.xword	0x8b78c6f08f56c801
	.xword	0xf2b7b44fc4d6f3b9
	.xword	0xe42d1a4cb5affe5e
	.xword	0xccf1cf100e625198
	.xword	0x5aad85e2c2f7ea8d
	.xword	0x824db84ea52dbfc8
	.xword	0x81bc785daaa825c9
	.xword	0x3ca90704e9d7435e
	.xword	0x6be7b1e5195d338a
	.xword	0x3926ff231c35b0fa
	.xword	0x96ca3640e73097f8
	.xword	0x3f307da4873cedcb
	.xword	0x7a7f8ca8f5879984
	.xword	0xf5480586f1132262
	.xword	0x3c958d1c7e6d976d
	.xword	0x82c34cc0fe8b239c
	.xword	0x28b328e3617015f8
	.xword	0xa8892838da336432
	.xword	0x8fca037717bd0fec
	.xword	0xcd42d41f91da2448
	.xword	0x5c0adb22baf4c599
	.xword	0x31c01bf2644e3f4f
	.xword	0x29226a1d9318fafd
	.xword	0xcccbd1b414651207
	.xword	0xb0e28cd26bb06e74
	.xword	0x3e5b5f2ba1d2696a
	.xword	0xb23d277e360242a4
	.xword	0x1bb952e032b3cdc6
	.xword	0xa06b156cf188e7bf
	.xword	0xb57cfd6383fb9690
	.xword	0xd76eadc6e2478edc
	.xword	0xb4191f1d66177bd9
	.xword	0xba1b3b3a16a90489
	.xword	0xd9432e8f6930cf0a
	.xword	0x2fee0a163209e783
	.xword	0xab525c3c5da7a8ee
	.xword	0x457e58dbf06a586a
	.xword	0x3a8d9acfede8efcf
	.xword	0x01a4e42008a798db
	.xword	0x93e000781274d31e
	.xword	0xc0c2255e848314f8
	.xword	0x6f52b9c9b233c586
	.xword	0x9326f587e699467e
	.xword	0x698f643d77f606f2
	.xword	0xb31aad1ced8ba6c8
	.xword	0xbee5743b6684c180
	.xword	0x64b6a74435747c01
	.xword	0xde8640c70590c135
	.xword	0xcabd1da67e0b089c
	.xword	0x6f84299af6dae7f0
	.xword	0xfbdde779ed493d20
	.xword	0x4c9f311cb30ae8bf
	.xword	0x416a75d05d1ec594
	.xword	0xf04bc5b6a02ed36c
	.xword	0x10a5db2417fd5d7f
	.xword	0xb57e648d6aa00c91
	.xword	0xab79bde0239fdc4a
	.xword	0x7d863a1d17f0d975
	.xword	0xcf070ba3dfa6c549
	.xword	0x7a0d08efffb2ff80
	.xword	0xb054906971156af0
	.xword	0x39e88d158948d1a7
	.xword	0xeaf2dec4e907aa64
	.xword	0x780d241563bba6d5
	.xword	0xd00385deef234585
	.xword	0x19ebff8189fa33c1
	.xword	0x12214347329e4725
	.xword	0x37f6ea03ebf5f067
	.xword	0xd23967c1cea247cd
	.xword	0x9686cf59edc32ec5
	.xword	0x0e55fadbff6952d2
	.xword	0x8cc0a99f16623a52
	.xword	0x09394a8c13ab886b
	.xword	0xf72a1acc93fb965f
	.xword	0x147acebb30800ea3
	.xword	0x98bc3d38a3dac812
	.xword	0x182541d225e83e3d
	.xword	0x10c5ef912e70b8ef
	.xword	0xb7acbcde20b5c335
	.xword	0x4bea8f778b5d4f24
	.xword	0x1ad3fe5447a640e5
	.xword	0x9576aa23f1995c4b
	.xword	0xe9c9c44d70269686
	.xword	0x868bcf36e65cb021
	.xword	0x6f2836135241e387
	.xword	0x7da315f6fdbcc062
	.xword	0x94ee09f4584db8bf
	.xword	0x51d91052218023b8
	.xword	0x63ae818656c83298
	.xword	0x68c7adf68c28d19a
	.xword	0xac2b563eadbb9f1c
	.xword	0x61e80620ecf78375
	.xword	0x6cb70132ac9b68c0
	.xword	0x771f50238dc17dd8
	.xword	0x24cc1421cb22a4c1
	.xword	0x36fe62845795d782
	.xword	0xff47ba9733055e97
	.xword	0x644cde9095232f41
	.xword	0x4ecc571a6c6916d4
	.xword	0x29305026f09d5bf5
	.xword	0xa7ad32bd48f35045
	.xword	0xac5a677aac391d44
	.xword	0x2bd892640dfae213
	.xword	0x44d4124d798ecc1b
	.xword	0x5a02bc3bc44c673e
	.xword	0x8736ac3e75638acc
	.xword	0xb758131f8a5971e6
	.xword	0xff2378ce3b3dde92
	.xword	0x5438f47608912cfa
	.xword	0x521a294de6afdcb9
	.xword	0xcd097ce6870d00fa
	.xword	0xa5caa340ae8f5a22
	.xword	0xa4706a32d5abf82d
	.xword	0x2afaaa0d2d5153f4
	.xword	0x6c3caf375741d466
	.xword	0xb9e4c37b7f4a5671
	.xword	0x6292f59e5f81367f
	.xword	0xa116b9aef30f26a2
	.xword	0xed2d353d04e0fb8c
	.xword	0xa4cfeee97f42ec2c
	.xword	0xedbb3ef3e37018c8
	.xword	0x41882965c5095a2f
	.xword	0x2b52ede697c06735
	.xword	0x50cdf5adaac88305
	.xword	0xebc39dbec0a7c169
	.xword	0x756a73fae315bc00
	.xword	0x51eb215574702a7d
	.xword	0x8df05d9548798e28
	.xword	0x56b116891b9783a7
	.xword	0xafc32ea2c38c3cff
	.xword	0xfe29a33ab600d2e1
	.xword	0x79e6de22c1820fe5
	.xword	0x22ec27d269b0bc8e
	.xword	0x41495bd47468137c
	.xword	0x35879b41ad1c8c07
	.xword	0xeb90b6f765bab711
	.xword	0xf8beb4697f22b24f



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
	.xword	0xe7e0809dacb09480
	.xword	0xd6e78d329680bfe7
	.xword	0x3c56f9e8ff949346
	.xword	0x014f6ccff6af4077
	.xword	0x6da62816be6f8d99
	.xword	0xebd9beb203a1fa0d
	.xword	0xf1665332404cadbe
	.xword	0xe697ccd67334f75b
	.xword	0xba89ce2659eaad81
	.xword	0x07f1bb1cf39f0808
	.xword	0x7ea69e5725147575
	.xword	0xfc7c9708dc2207d8
	.xword	0xb8a2fabb98f4c551
	.xword	0x17c9adc820de39c3
	.xword	0x2d6f7611179d7cdc
	.xword	0xcd65c812413c68ea
	.xword	0x034ba794962dd892
	.xword	0x3696177d35cfebe4
	.xword	0x72fdca91bac9f64c
	.xword	0xc1057ac8c2864a00
	.xword	0x27eadc8ff85af081
	.xword	0x2a848bc60d989b1b
	.xword	0x0a23ee78e8cfbce6
	.xword	0x22d41ac24630b810
	.xword	0x3c2add7f5c42d7c8
	.xword	0x0adcb7e5eae2fa77
	.xword	0xeb36a52845fa71fa
	.xword	0xa7713ebea19d24e8
	.xword	0x80ca970b2ca71dc1
	.xword	0xdaa220cf49ce29ac
	.xword	0xd648884edf1a5608
	.xword	0xc410608357ae0c9b
	.xword	0x4abd10e15b048fbc
	.xword	0x6ee414f6f25cd8f0
	.xword	0x43041d920fbc4372
	.xword	0xf05675e0dd370157
	.xword	0x882f771fdf5344b6
	.xword	0xbb7bab71e6d2bee4
	.xword	0x0a50512a35ead644
	.xword	0xaa1c19cc42ab07e8
	.xword	0x9b8f0c008e7ee598
	.xword	0xc52a34c9f7deb503
	.xword	0xdabd02bef47e31cf
	.xword	0xaa80125034122b05
	.xword	0xde23c01b92dc48d2
	.xword	0xacc74454714c0a9e
	.xword	0x7972240076f9014a
	.xword	0xf9e25ef561432cca
	.xword	0x77f23ffc5c8e3442
	.xword	0x64e4944c8597f995
	.xword	0x16577fb76836ca70
	.xword	0x99e883019c156ae2
	.xword	0x7d0743fd1cf36dcc
	.xword	0x96db06d896073119
	.xword	0x476dd58854945b7b
	.xword	0x52edafb706f7d0c5
	.xword	0x11db1064790ee48c
	.xword	0xf314334fbf40ca11
	.xword	0xb95370be5b1f5f70
	.xword	0x13f32ebb09bab46b
	.xword	0x83eb5bad0d985307
	.xword	0xc0d440b254225905
	.xword	0xf2ae3b1baee18889
	.xword	0x247813f8347a7442
	.xword	0x4f44da20c4fc34f0
	.xword	0x167e61a80b42e977
	.xword	0xdf348bf5251dc1f9
	.xword	0x8ccecf9b48e9082b
	.xword	0x747b061e818ed741
	.xword	0x81f6145589188c7f
	.xword	0x1f92ebad3c2c6ad3
	.xword	0x3f093133b85ab5aa
	.xword	0x833a45689569125e
	.xword	0x6a984c6beea8ef6f
	.xword	0x6936a97f97b362f9
	.xword	0x310d49e060974261
	.xword	0xabdd0ba93c8810e6
	.xword	0xaee927421ad72bc1
	.xword	0x53454f0a2038d60f
	.xword	0x449326f5fbd60c83
	.xword	0x5cc656cfe6f84c24
	.xword	0x964ce0328b7e3fd1
	.xword	0xbcdfa34ff0ab6603
	.xword	0xf85de4c194796b2f
	.xword	0x131b1fbf32ff1dde
	.xword	0x3711201fba78bfe8
	.xword	0x96833f34a67a61b3
	.xword	0x6b06af13f5e840f0
	.xword	0xa5a7f052dac270da
	.xword	0x93b34fa029693eb6
	.xword	0x86fff3d98ca297b5
	.xword	0x4811ca9b9c116bc7
	.xword	0xdeb9860fc2bc01ad
	.xword	0x8855d6e07aa57a43
	.xword	0xbea35487359a66aa
	.xword	0x06f46bdc590867d3
	.xword	0x768d153e056e6677
	.xword	0x5ad846c0155020fd
	.xword	0x10c2705e1b2f88e6
	.xword	0x7c3bc4f98763e643
	.xword	0x1f748003d2aa4955
	.xword	0xb7d454e1d39bd33e
	.xword	0xcc483451b718e61f
	.xword	0x1f7bfa9753f25c9f
	.xword	0xcb2437a3e29e247a
	.xword	0x8593e5a658407805
	.xword	0xcf201628f2dcf7cc
	.xword	0xf12e9de66ef496ad
	.xword	0x5b6e5e244dc826f8
	.xword	0x3b27d54c09db104d
	.xword	0x766681e0effe5975
	.xword	0x0073b248d415b4fe
	.xword	0x24bc1611e05141cb
	.xword	0x7f2e135991f7fb1e
	.xword	0x95851c97ad200887
	.xword	0xb9ae90dc69fdaf36
	.xword	0xb1f0d55a60de95bd
	.xword	0x8781b8e5a95b8aa0
	.xword	0x60ae99494837bbd7
	.xword	0xb2fb0ee8f4b73634
	.xword	0x24497273035adefa
	.xword	0xa8929b9f7c7f8bd5
	.xword	0x645c32078f6d04e2
	.xword	0x43d9b331e3781276
	.xword	0x1c39ab7f5352785d
	.xword	0x16fa95eaf212c3d1
	.xword	0x501d2699f040030d
	.xword	0xcd763c8ac87b36d9
	.xword	0xabec5d5479e03b35
	.xword	0x418cb680f5e97251
	.xword	0xe9346bc7ee1be2c8
	.xword	0xc3436ed3c9cc40f4
	.xword	0x606737495211b7ef
	.xword	0x79a2fbcd637f4001
	.xword	0xc225e2295684b153
	.xword	0xfcad73860b952ce7
	.xword	0x20fce34e2e6ba498
	.xword	0xc6216c0804a093b9
	.xword	0x95f12f5732631f01
	.xword	0x73756882ea6ec6c1
	.xword	0xaeb296466390ba63
	.xword	0x81f8e8d0fe887ce0
	.xword	0x79a32733d6c62fca
	.xword	0x2d98eddfec0c6ad2
	.xword	0x6557e90909f1c8b5
	.xword	0x59729a51bdf00def
	.xword	0xcd8a8bdc02895bfb
	.xword	0x5957a3b40b4203a2
	.xword	0x43bd149e987d0088
	.xword	0x51c0dba755dfeff8
	.xword	0x056ddd5c2dd0338c
	.xword	0xb30d1119f1fd94b0
	.xword	0x11240b3ee42a4727
	.xword	0x1e0a0b33fa0af43b
	.xword	0xf2dd5af29315ff18
	.xword	0x33066a1916081315
	.xword	0x6dc407abbfa24ca7
	.xword	0xe24dd23db36f5202
	.xword	0x82c3933ed1ca320d
	.xword	0xe1c040b6d8fab430
	.xword	0x3f1709bdad1eaa30
	.xword	0x030982a351566a7b
	.xword	0x2448e485fa2b6605
	.xword	0x3e75955027be9b23
	.xword	0xb80c2d80991661be
	.xword	0xf56a2b2adcddb489
	.xword	0x3a5c8d4b61e80855
	.xword	0x29f6575f2132b290
	.xword	0xf0dc062848371c92
	.xword	0x0249b43b6a588bab
	.xword	0xecddf87073f297d7
	.xword	0x1176b07b67a9ec49
	.xword	0x63c964c4869bf17b
	.xword	0x7ca33c367ab619e1
	.xword	0xc7d14074063725a2
	.xword	0x106ef5ba70cbeb80
	.xword	0xe66de197b215c368
	.xword	0xe51859184a17e729
	.xword	0xdf341149b72ed76b
	.xword	0xb0a2a53465522687
	.xword	0x083e07e2b4273d70
	.xword	0xecb306a1f4c57d17
	.xword	0xbb39b8a2cfde0f2d
	.xword	0xdb7bdce9ffe7f746
	.xword	0xaa7c99f8ebb99f9b
	.xword	0xeed75862c9f2e51d
	.xword	0x3e3055d825f88823
	.xword	0xbd69b7a7823e81ea
	.xword	0x775eb48bd472b57b
	.xword	0x1540f45048f6c9de
	.xword	0x8034c3a3ca495444
	.xword	0x75566d75e13162b3
	.xword	0xf16d471b6dc094d9
	.xword	0x5fe336eb5ef94161
	.xword	0xdbe6e36102867b54
	.xword	0x1300a3074bb0f460
	.xword	0x26ec6c5fd191787b
	.xword	0x95fba56fe925f636
	.xword	0x1ed2c1e94fa4111c
	.xword	0xeff04cc1641669c0
	.xword	0x186718977e50a221
	.xword	0xa8b8cd381c4fc5bc
	.xword	0xbbb33af9482d1649
	.xword	0xe0ef2f3ab110bda8
	.xword	0x7b539c34790dbd80
	.xword	0x2a600f44fbb34bae
	.xword	0x81e7c0c9473b48a9
	.xword	0x258f8123821a27e7
	.xword	0x11439767dbcf868f
	.xword	0x22d39b0bdffc2cc7
	.xword	0x8b3e988eadcbed33
	.xword	0x867df440d1b57ddc
	.xword	0xbc1423fab38d42bf
	.xword	0xbebdd30846ca8784
	.xword	0xfa75718ae0edfce4
	.xword	0xa1eddfd357801347
	.xword	0xd63cb241c8c40da1
	.xword	0x4e66a8ef2d2bddf2
	.xword	0x0258701b83a7fd87
	.xword	0xa3b08c51cf69728d
	.xword	0x2ffa9322046a4662
	.xword	0x177b3cb12126aec0
	.xword	0xe4d8fc73d9f4e13b
	.xword	0x87ea90378d573bab
	.xword	0xf6d3fddaed96673f
	.xword	0x91e1d180e8ce1683
	.xword	0xb873e06b8a7ab177
	.xword	0x1030e5bcee604849
	.xword	0x61adf63e65e720e3
	.xword	0x4527ed71a70d845a
	.xword	0x32ba87a81958d610
	.xword	0x637f13bfa4ea074c
	.xword	0xe8262c2f047d0664
	.xword	0xf5834021a7fdda12
	.xword	0x94d915021d03cbdd
	.xword	0xec451bc86018dcf2
	.xword	0x8f9a0e5697f3aa98
	.xword	0xc73f88916105b5ec
	.xword	0x8149c3546f5f9508
	.xword	0x77f43de96155c456
	.xword	0x2bd11ae64a678f3f
	.xword	0xcc6c4cb0066a6b06
	.xword	0x7409f91c4d9e6419
	.xword	0x860bb2a3e096d40e
	.xword	0x2e5ac57a0c6a8fd0
	.xword	0x59fd71df8ef0c545
	.xword	0x47b6e97aad2809da
	.xword	0x0dd1ffa8b03d970b
	.xword	0xd88f5a9561cb33ec
	.xword	0x7fc28e61633edda7
	.xword	0x791961e00ce05aee
	.xword	0x8536de5ac7475d8f
	.xword	0xa831d44799ada1ed
	.xword	0x50cb7eec3584594d
	.xword	0xba5cfd1d9e1f3881
	.xword	0xa2f38fc46fe4a2ff



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
	.xword	0x155de929ac665165
	.xword	0x353280e80904547d
	.xword	0xc8a97199c8c33145
	.xword	0xb20f290861fb2fab
	.xword	0xa85d6db924feab15
	.xword	0xbcf64e36f09adf74
	.xword	0x7d4bad69d3016ce0
	.xword	0x9aee071662a165d5
	.xword	0xa9a4b6db9ee32e76
	.xword	0x8e6e354e6b7bf551
	.xword	0xc480a24ac828dfce
	.xword	0xc64b1c35409d2afc
	.xword	0xacb8ae9210677f66
	.xword	0xa11ce8ced17384ed
	.xword	0xe63062ee7fd87d17
	.xword	0xea94c7faa0bb6f34
	.xword	0xcef75ac1d0ec1738
	.xword	0x177637e1669ecdca
	.xword	0x1d0329c549b969d4
	.xword	0x2808bfe78508dcb3
	.xword	0x359cc051eac48d01
	.xword	0xfe08f7474785a2ac
	.xword	0xd9e455b6a715a1fa
	.xword	0xfb5b1feab532c4b8
	.xword	0xaf867e246b1acb7b
	.xword	0xced2bb7ce477f9d4
	.xword	0xb4408d79d6bded18
	.xword	0xf03d36f8b5e92d88
	.xword	0x6f4ebf1d671ec24e
	.xword	0xcba7b4afb74d6af5
	.xword	0x668f6675b3de95a2
	.xword	0x3120890e225a1f33
	.xword	0x3396d9beac4591a0
	.xword	0x81bc2ce7ef2a56ff
	.xword	0xda787de4659beeaa
	.xword	0xf9951804201dd484
	.xword	0x75aa48a6f2327350
	.xword	0x82e485207ac26479
	.xword	0xaa61aeab473f714e
	.xword	0x6d1590dddf6f19ca
	.xword	0x92a8ff306a2b12df
	.xword	0xb479e5521c456199
	.xword	0xbced030a56f81eed
	.xword	0x7c64d8912e306014
	.xword	0x07e310746241bc92
	.xword	0x38b49fa8288638fa
	.xword	0x77fe6984a2ed4039
	.xword	0x174d057a44e4dcf1
	.xword	0xdfa5e4fdec9ff588
	.xword	0x01b0188a2958eaec
	.xword	0xf31b8aa0b6af819b
	.xword	0xf3e05960dadb39f5
	.xword	0x8489977ea54db64f
	.xword	0x79994dcf17f7985e
	.xword	0x4d00fc62c993f872
	.xword	0x5c61b802fff7c4e1
	.xword	0xfd75dd54be6ab38b
	.xword	0xeb72b50ef175abe1
	.xword	0x6f47602b2673512e
	.xword	0x236ec0579f530b14
	.xword	0xfa464a5fff1afb5c
	.xword	0x07c714b4acc17e48
	.xword	0x94559b614a71a987
	.xword	0xd05e368b07316b03
	.xword	0xb1cb521d013def3e
	.xword	0xa8fc8091f549dd3b
	.xword	0x713a5f6f3886a248
	.xword	0x15fc3fe0409abd79
	.xword	0xc3791c7c91d6e8df
	.xword	0x361b81e79403933a
	.xword	0x6d316e396be89921
	.xword	0xa3cd6c0573d693dc
	.xword	0xf04af19717f2acbd
	.xword	0xc3324ab7305f110e
	.xword	0x7e97501732948ab9
	.xword	0x5de3bc10079ffe34
	.xword	0x819acc7522d92519
	.xword	0x71de0296f4018eac
	.xword	0x53ed73bc5fc84aca
	.xword	0xcbb2bb28ed8248ea
	.xword	0x898b908850262925
	.xword	0xdc0c77dcdce46d89
	.xword	0x0599c9a1b4eb4455
	.xword	0xb9ea47a2ba62b701
	.xword	0x0a86530b3fe87f9a
	.xword	0xe17a2f6084dc5dce
	.xword	0xdd6aed9ab962f799
	.xword	0x0663ab8facb39285
	.xword	0xaad9ba8434ed17bb
	.xword	0xec2605bfb53d794d
	.xword	0x803e7015974fa3a3
	.xword	0x59a423f444aa1229
	.xword	0x1ab814321be133d8
	.xword	0x0f19b831132c1a45
	.xword	0x30f202949510a1f9
	.xword	0x23d4c2c5a3b3cfc2
	.xword	0xb28552a917fbce11
	.xword	0x25594bba29856161
	.xword	0xac48e6c7215e3fce
	.xword	0xbbeca4cf8e9bbd1a
	.xword	0x11a0a96ed2566d6d
	.xword	0x302ac435b9546c62
	.xword	0xac85cc488b57b559
	.xword	0xa6deacefca94b1b1
	.xword	0xb7a77c2a3020ee37
	.xword	0xcf810a4565491ccb
	.xword	0xb17e64f0cd7bcb0f
	.xword	0xb4286e2723a744fa
	.xword	0x616439f45ffbbfba
	.xword	0x69d2ad0fca83abfb
	.xword	0xbf408d5de469101b
	.xword	0x7504a0011f50f7a0
	.xword	0x18660e07ad7c8f50
	.xword	0xba95d420b82c498b
	.xword	0x31d0874e7f3f523b
	.xword	0x35b9583563b284d5
	.xword	0x7a7c9c6b8883c88a
	.xword	0x5a615038e064aa7c
	.xword	0x036ab217e8d22a0a
	.xword	0xbec7b058b93e9716
	.xword	0x87917eb9f83f643e
	.xword	0x06d95e75283ddab5
	.xword	0xfdc5cd40c3ad9bd4
	.xword	0xe878647529924e8e
	.xword	0x8c0dfad0ee2db28b
	.xword	0x6cfc51aa2c1972ef
	.xword	0x9584a2092e561a94
	.xword	0x3ef9fda7dedc68e6
	.xword	0x76d8f14d3a8cd509
	.xword	0x4a547f01281c483f
	.xword	0xd4e53a27074f1ebd
	.xword	0x93266d8a35d44225
	.xword	0x4616e13099bffc83
	.xword	0xa88418aaa0008ea0
	.xword	0x0997baf31b28ba81
	.xword	0xca8e3f6343a5c8c9
	.xword	0x0668b31797d195f4
	.xword	0x768f42910f507bdb
	.xword	0xfe7bd6630ad1e7ed
	.xword	0xb980d17453a4ad64
	.xword	0xde17df5d4a31049f
	.xword	0x82a19828672bddb8
	.xword	0xad07dc80c364ae9a
	.xword	0x544c8da86464be62
	.xword	0xd60190dd4d94219d
	.xword	0x803192105bb21f53
	.xword	0xe00ce585f9088f64
	.xword	0x72ef06477e5ae8d6
	.xword	0xb143a1632d0b01a5
	.xword	0x632ec5fc395ecdc3
	.xword	0x2820e5e0d255b00c
	.xword	0xadd55b739f948656
	.xword	0xf5fc495c5a7154d0
	.xword	0x8db3d7ee4e7ef799
	.xword	0x5b6c7f96a5761722
	.xword	0x14a8a9a3161b588d
	.xword	0x4b74c22535f9f10c
	.xword	0x05e38f3f6e6116d3
	.xword	0x57a5216850ccc39a
	.xword	0xa07c24e0075d6f2c
	.xword	0xef70e02ac8d00c40
	.xword	0x5841e28a335d49de
	.xword	0x0335c13aa5e0beab
	.xword	0x37e296e203152d16
	.xword	0x61f1ede1504b14ec
	.xword	0xf407422cecd16a3e
	.xword	0xa7b77ac1c2ab40e7
	.xword	0x20175c4f0e5c628b
	.xword	0xe2e6dbd490b7b225
	.xword	0xb1a431a165a05f49
	.xword	0x811c62baa50eb62d
	.xword	0xb3c33fc98b75f535
	.xword	0x734388caa0e8ec2d
	.xword	0xfc87d742e021862c
	.xword	0x65633ae782852149
	.xword	0x4224133755df45df
	.xword	0x9f16d7f03675842a
	.xword	0x44149699cabf4706
	.xword	0x77d18639104f8a9b
	.xword	0x4a54de48d8ebbbeb
	.xword	0xd053603fab91f333
	.xword	0xb6e2e72a32d97a2f
	.xword	0x6027d15d6924c9c0
	.xword	0xe9f33b026fe2b499
	.xword	0x04e203909d678efd
	.xword	0x57f459ceb4303641
	.xword	0x810a8e4e6223c874
	.xword	0x428928806ce85c8a
	.xword	0xd283271457ce8c6e
	.xword	0x6530a38500ddfce0
	.xword	0xf9ea6a35c5abbcab
	.xword	0x8db7d9c90a52083b
	.xword	0x7c4ee0877332d8bc
	.xword	0xd7c8aeb14a13e184
	.xword	0x226d3d23e9425a6a
	.xword	0x66be1ca225cb2fa5
	.xword	0x0bdeec64c2dae4c0
	.xword	0x8ba1b5341abd2085
	.xword	0xafa582d71abc2600
	.xword	0x91446ffb0436a7ff
	.xword	0xcc9349873ea8948d
	.xword	0x966d11288ad00d16
	.xword	0x56bbff4a7c1f93c9
	.xword	0xab96d5195e357bb8
	.xword	0x4de745af1594c79a
	.xword	0x1965f41a103526d8
	.xword	0x56ecd67c1a838f87
	.xword	0x581e81866b6b76ce
	.xword	0xdbc2c98073388351
	.xword	0x7cc6ace8c063ee50
	.xword	0xdbbd471be019d40d
	.xword	0x096a231a1c984a72
	.xword	0x0a3f6eaa44548919
	.xword	0xfc6c776c639aff14
	.xword	0xbfaf019853cb0c6a
	.xword	0xcdc7e333f8674b66
	.xword	0x2ed40e2cdd256956
	.xword	0x3d08465e46b6371c
	.xword	0x7db497aa7c0e43b7
	.xword	0x8927634f1e70191c
	.xword	0xe12181ad3dbef3aa
	.xword	0x4f8c1ac4afe56ec6
	.xword	0x8b172c39d41809e9
	.xword	0x4ffe2aefe47a3aa2
	.xword	0x9cb73454d5b90d8b
	.xword	0x9f3d08be63ef4aa0
	.xword	0xfe604b24039178c6
	.xword	0xb0fed52d637c3b63
	.xword	0x925ce97f850a2118
	.xword	0xc5e4522c917d1965
	.xword	0x1d4c71bb54ed8401
	.xword	0x5084a53940623a05
	.xword	0x11a6ec5d7fe3348b
	.xword	0x05641e20114574d5
	.xword	0x7a8f190820616b20
	.xword	0x95513ec35f56d8cf
	.xword	0xec59c626fb4655f1
	.xword	0x9e09375f30f447ea
	.xword	0xc26aaef3ee61081d
	.xword	0xe305c531124cca2e
	.xword	0x49c3087a91754e14
	.xword	0x7f5bbd58ae8382c5
	.xword	0xebe2bcd9d1e3061b
	.xword	0x9cc6475f8531eede
	.xword	0x1f68b90bcb5f0b3d
	.xword	0x5a0a601daeb6b473
	.xword	0x12f99fc1979f2f8b
	.xword	0x8c11f1cfe3f3afdf
	.xword	0x01626cd7c7333d5d
	.xword	0x26c12e0fe2a575c0
	.xword	0xc66afd8aea91fe11
	.xword	0x7dd09ae9819d5f5a
	.xword	0x374e01aa8c71ec38
	.xword	0x4033035e00d959b4
	.xword	0x5d2f97a9c961d142
	.xword	0xfb02aeecbaa1f94c



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
	.xword	0x40de1e97c4902326
	.xword	0x036da49691d7ba8d
	.xword	0xbc2e0a4c2e7d029f
	.xword	0xd881a76664f19a52
	.xword	0xc464366171101266
	.xword	0x0526c17f40718f3a
	.xword	0xd56a1787a87b5e4a
	.xword	0xa75e7e0734547315
	.xword	0x771e220776c1c11d
	.xword	0xad6dd988a44e3a9c
	.xword	0x535d587ac5dade6c
	.xword	0x1434d201224fd31c
	.xword	0xb538af9bab6d44ca
	.xword	0xec0a08a54440b4fc
	.xword	0xee47d1a0ed763b87
	.xword	0xda3830a5107b388e
	.xword	0x8e9af0323ff38ae6
	.xword	0x04ea50b327491396
	.xword	0xd6f1053ef994c020
	.xword	0xb1e3979c235202eb
	.xword	0x68f0437ecb55ea25
	.xword	0x1af464c2c4d2db62
	.xword	0x3ae9a03464f86872
	.xword	0x72cff7c2f10e6cb3
	.xword	0xf022dd85c22e08fd
	.xword	0x4f9af8f4557139c8
	.xword	0x574bdaa5baab193d
	.xword	0x7559040cdcd0c846
	.xword	0xc3d08d3e0dfe9f6c
	.xword	0x13edd7f9f22c9c33
	.xword	0xc1abc726df69fdaa
	.xword	0xd34783605e5cdd0a
	.xword	0x31627fc5cc7ac862
	.xword	0x55757f2d835c5975
	.xword	0xa5ce6bcc161cf736
	.xword	0xddf46ce7dac10221
	.xword	0xec5a57ab4e766968
	.xword	0xf0a0780935545a5f
	.xword	0xb85694f5e26743fc
	.xword	0xabc44caeb1259862
	.xword	0xace4ec3f16a222a5
	.xword	0xe45b0ea3dab341db
	.xword	0x29a511b117629991
	.xword	0xa5746f684a141a92
	.xword	0xbcf62d2768f17550
	.xword	0x01c02b8222d8d6b0
	.xword	0x4cb8da6796a74517
	.xword	0x38f9a77691350d7c
	.xword	0x3433c44298768786
	.xword	0x1da22f97359490b9
	.xword	0x648b8ab4287f8984
	.xword	0xb353f0bbd7da0412
	.xword	0x633ca880be2d7bec
	.xword	0xb01e65b361060501
	.xword	0x67217aa9fab5faee
	.xword	0xbf19f79a323eabca
	.xword	0xc0257a011ec6ca8e
	.xword	0x991fdd02e6f130a5
	.xword	0xd9de4ae88a966174
	.xword	0x8861ed75606df345
	.xword	0xdb11a5bfd5beaea1
	.xword	0x7fd0f3f9e7f22115
	.xword	0x28aa1fb7e9aef4c9
	.xword	0xb00de030fec62229
	.xword	0x80f2adbd76808368
	.xword	0x3d6e108c5b130200
	.xword	0xb71a762b8de8d882
	.xword	0x18fbe7805197143e
	.xword	0x4c47274afed81151
	.xword	0x4e541e0fd78500a4
	.xword	0xcd31ae3e70485f94
	.xword	0x92a7ae7819618a1f
	.xword	0xbd7dfcaa8464dd3a
	.xword	0x0f649024ccfb8395
	.xword	0x7f53e9a5ba416c35
	.xword	0xac2941d639735343
	.xword	0x39ac668017c528f3
	.xword	0xb4ba7930c0148732
	.xword	0x5cd7a5c9fc8ebf1f
	.xword	0x65db1fbdbf04111c
	.xword	0x7f95e08027bc7ae7
	.xword	0x4387e3c8b76ec776
	.xword	0xc5aa956efe3813bc
	.xword	0xc9727cac29af0031
	.xword	0xb542ddd16f9cd719
	.xword	0x558f42e86dae32ff
	.xword	0x18e33371979b6f22
	.xword	0x26147f4b9152cd03
	.xword	0x2b161184cac2e272
	.xword	0xbcd5031fde2d2484
	.xword	0x81c43ec97e47c167
	.xword	0x19eeaba24fb81a58
	.xword	0x7202853fdd324839
	.xword	0xdd3383291b74d735
	.xword	0x9584741722ced824
	.xword	0x254ecb39306b5e87
	.xword	0xfa9c3093fee3c4f1
	.xword	0x9bbe0645ce725ff8
	.xword	0x714614b7a6e0bd0d
	.xword	0x7a1197e8216aa06f
	.xword	0x4325e626c668f22c
	.xword	0x47f740e0e6dc3bc6
	.xword	0xad98bfe9c6e9c5fa
	.xword	0x0ca7d7c18589f91d
	.xword	0x7acbedbd28a96317
	.xword	0xc52d0c85463919d8
	.xword	0xc19dc0992ed28d45
	.xword	0x6b8934a8c473e114
	.xword	0x1846a382b510019c
	.xword	0xe165a9b61ada4b9e
	.xword	0x160151e0716b2877
	.xword	0xb521117526752ad0
	.xword	0x1a0f6a24bd88a9d7
	.xword	0x1eed77f5795e44db
	.xword	0x5ecfac8a7176c36a
	.xword	0x3250e4a8c1505b44
	.xword	0xcb5d6cfad1f55901
	.xword	0xb3b5bb427139ea0e
	.xword	0x6dd724121df14b5a
	.xword	0xd3806909ce776d6d
	.xword	0xeca2d5789ff73c10
	.xword	0x7b11da724a1bfdf8
	.xword	0xa62e430f5dfaa6de
	.xword	0x55e0d0804c86769f
	.xword	0x567542da695a2c63
	.xword	0x4946d04eac149aca
	.xword	0xc154e00fa8f32bf1
	.xword	0xf826a8b0c6b1e63c
	.xword	0x6838eb5baef03f8f
	.xword	0xc23c7edf2f3d499a
	.xword	0x8218962c1921530d
	.xword	0xf66cff3f1783c3a3
	.xword	0x163fdfb6940d99f2
	.xword	0x5188c72ebaa0baaa
	.xword	0x18770b0ea34a3581
	.xword	0x12fc120f56119ccf
	.xword	0x97932debf75bb5b6
	.xword	0xf44db09a2eac55bd
	.xword	0xfba6cf43dea7b74d
	.xword	0xb969ee36c0754a9e
	.xword	0x0f7c7db8a9ddc8bf
	.xword	0x96ba4cf2b0de3d88
	.xword	0xea5a8802defc1847
	.xword	0xba10b2af93e8d89e
	.xword	0xb755a75388a4885e
	.xword	0x80c732da2bd5d22c
	.xword	0xb51b9e552b9a918d
	.xword	0xdfcbf191161d6d63
	.xword	0xb63c5f343e5e0ef0
	.xword	0x0a396c1289ebef84
	.xword	0xcb725aa6b108aea5
	.xword	0x6e6a155191de7621
	.xword	0x130b0d992ef89ae3
	.xword	0x8373c9d4618cd236
	.xword	0x15a43b2c6ee29cf4
	.xword	0x2414a1280d7082b2
	.xword	0x9bbd1b78bb766731
	.xword	0xc91b105aad3cec81
	.xword	0xd013e1b32e33c6c7
	.xword	0xbe692ced7a427248
	.xword	0xa4c48b18ff5c11c2
	.xword	0xdc2435b2e1b0bd57
	.xword	0x4d86787c395b1473
	.xword	0x0ccf46df43e58217
	.xword	0xfe0d979579d56495
	.xword	0xcfb8f00f2cc77e97
	.xword	0x5ae9183512938106
	.xword	0x119324d4adb948c9
	.xword	0xc61292a380b0f4e4
	.xword	0xd902d4c21cc7b463
	.xword	0x1de20d195f9193cb
	.xword	0xe3b4320bf8771075
	.xword	0xaac69b0d70afa835
	.xword	0x4aa36d0c3df9f66d
	.xword	0x0c996b6d2187a426
	.xword	0x160473bb57926bbd
	.xword	0x793c499e3b7ac64a
	.xword	0x9102224aad44eea8
	.xword	0xc1eee63101a5fa0e
	.xword	0xf4acff8d301aa6bd
	.xword	0xa47b428da87eb755
	.xword	0x9468bb1b97e75d03
	.xword	0xe392e8b4fd813c2d
	.xword	0x24bdbbb61392208d
	.xword	0x40296bd2d8787437
	.xword	0x0e8401f4822e76ec
	.xword	0xee00b610e011bb48
	.xword	0xb9996de5e4bd5d72
	.xword	0xf233737164114ac6
	.xword	0x04d304098bc732a4
	.xword	0xbbb2171590522b92
	.xword	0xfc5cd18c615276dc
	.xword	0xcb207d0c21b7169f
	.xword	0xa81d6e59eea4f175
	.xword	0x289896be091ee7ce
	.xword	0x8f6eb89e7ebcfb1d
	.xword	0x4dc2e7c27b93bce4
	.xword	0x560c3a49c1fe4308
	.xword	0x779c3447b3d91906
	.xword	0xbd8d47eed7b2fbfb
	.xword	0x5b8f88e8195e8890
	.xword	0xc0f84cbd942acf68
	.xword	0xc857988668309000
	.xword	0xc5ba230d9ff771a9
	.xword	0x7fed8460fcb56899
	.xword	0x44f013b6d4e8ee0a
	.xword	0x829f7ddcc15e169c
	.xword	0x6ec524128d0a36f5
	.xword	0x9dc08f0294c01701
	.xword	0xf0fcc92e7308714c
	.xword	0x6890f38a9813bd26
	.xword	0xdd6c5cf670e5e1af
	.xword	0xb44c3d06877af600
	.xword	0x5c33c93b82019742
	.xword	0xaab1847ba6c887f9
	.xword	0xe97f799cd5e3726c
	.xword	0xea51f71ea191808d
	.xword	0xda402213924df164
	.xword	0x0464483e3a1b18d3
	.xword	0x7910547dfad56929
	.xword	0x832d0b960ac89236
	.xword	0x31e49ca07af371eb
	.xword	0xc6f49b4d6799de70
	.xword	0x4d2449db8a7a21cd
	.xword	0xc7ba1d55bcd296f8
	.xword	0x51e3bc51c19fe78b
	.xword	0x7c4e5ab4daeb923d
	.xword	0x4a0b748a7859c01d
	.xword	0xc4b7652b61862415
	.xword	0x3e96e72d99913a39
	.xword	0x0a3bb799747971ed
	.xword	0xacb8c9c9ef60c41b
	.xword	0x44eef52a7289b5b2
	.xword	0x1d2e47e23d9f9a74
	.xword	0x7c700eb8d4820123
	.xword	0xe4584499b43a3da6
	.xword	0x63d4a0caba85cdcd
	.xword	0x7ad945764ece67c1
	.xword	0x50f9f94e52b54b3e
	.xword	0xcb4961b3dee298b3
	.xword	0x0483a44bac8abe09
	.xword	0x877158b1ab8dd489
	.xword	0x552a73682b7c19a9
	.xword	0x3cb4aaab3e51a2d7
	.xword	0xa2d3088b7336df7f
	.xword	0xb97a43c89f17cdfd
	.xword	0xbb1a60bd5860cbdb
	.xword	0x3fa6dba2f0aaded7
	.xword	0x0009c13be15f9fa9
	.xword	0xca1ed0692dab2f63
	.xword	0x060e6aa2dfa6b379
	.xword	0x6afecbf662ca6051
	.xword	0x551464a7de16a00f
	.xword	0xea9537df1e113fa5
	.xword	0xe7172f9d498ce404
	.xword	0xc28b6829910c5754



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
	.xword	0xe05702ef630c01cc
	.xword	0x8be0fc64ebd6e540
	.xword	0xc6a298687fae1f4a
	.xword	0xe3de846ce761dbec
	.xword	0x407e1339303f6f2a
	.xword	0xd9af706fcd4560ae
	.xword	0x63932908777568c3
	.xword	0xc95dad08387edd9b
	.xword	0x877b2b1a72fc4e03
	.xword	0x71e98bd149bf4322
	.xword	0x0423bdb5d7a1a16e
	.xword	0xd5080b588318c5ed
	.xword	0x91cb5ddb61b9118f
	.xword	0x8a1d2877722cf38f
	.xword	0x51e2064015d19385
	.xword	0x687018028c29e8ce
	.xword	0xfdfe408cd0e9a814
	.xword	0xdfacfcab5410fddb
	.xword	0x9b434ff3abd7a83b
	.xword	0x741439c734baff33
	.xword	0x5609439e7e0c1588
	.xword	0x2e248c615d88cbb2
	.xword	0x0d84aab1c4a09346
	.xword	0x020db3bbe65cdcd9
	.xword	0x3777dea5496a38b7
	.xword	0xbd5a21cc126d7d0b
	.xword	0x931417b6b36e750f
	.xword	0x46ac615606ea67ac
	.xword	0x3fe7adf04a05994b
	.xword	0x88fc23616ba38009
	.xword	0xf79b6e402e8b8005
	.xword	0xea3fd40bb43c74ab
	.xword	0xe463c913aa3966ce
	.xword	0x7dd8a9ca4ef89c86
	.xword	0xdee12604d520254b
	.xword	0x07cd4a4d869fc695
	.xword	0xb0afc27a07b7044b
	.xword	0xd3f120e9edd0c1cd
	.xword	0x1066e47c4a7a6420
	.xword	0x47545a809cc8e207
	.xword	0xa1a47a7d5e3f2f72
	.xword	0x6567143fb4d8a8e0
	.xword	0x3f4962cbe18911e4
	.xword	0x515b210f75eba645
	.xword	0x058246b2d7abdd12
	.xword	0xebf691ee98fc483b
	.xword	0x2054402c703b25d3
	.xword	0x3fcc6aaddd827539
	.xword	0xeb02621830ee00f4
	.xword	0xf4cefdc71fe187cf
	.xword	0x54dae1010add1c8f
	.xword	0x3e44e1df7b990a50
	.xword	0xeee306fbce3b3a02
	.xword	0xf46ee2d654186300
	.xword	0x4c257514359a9db0
	.xword	0x780327947fdc0f64
	.xword	0x9b678f4354074f24
	.xword	0x1576f50f2a10bc06
	.xword	0x9fd135037e860e60
	.xword	0x6e3bbf121f71e1e5
	.xword	0x8ee6474d2e7d2af7
	.xword	0x94e2b6907b0de373
	.xword	0x2559704c49a90e4d
	.xword	0xe9e68629df34d703
	.xword	0xd83dc2e006641fd9
	.xword	0x928371e3606da49f
	.xword	0x475d96a83e771885
	.xword	0x81d897e5c8765dd5
	.xword	0x135e88182b61d74b
	.xword	0xcde812a8e366763e
	.xword	0x8714046b772fcca5
	.xword	0xded26433bacf616f
	.xword	0x7a0dfafd470f63ff
	.xword	0x8003b48a8cb06ef9
	.xword	0x6eaa37394fd91c01
	.xword	0x941f5722aa724c18
	.xword	0xdee0a859f338e460
	.xword	0xf3984eb932e53b6c
	.xword	0x67d538180b2804ab
	.xword	0xc91c499ebcfb2733
	.xword	0x97047f3a0dba6560
	.xword	0x9a2ce153a9214770
	.xword	0x1ab1a2dffa34fc81
	.xword	0x3bde14db3c96cf4f
	.xword	0x905b9f8a676329bb
	.xword	0x363f23e20fe15eb0
	.xword	0x7f94a89987ea701f
	.xword	0xba4dccac85083983
	.xword	0x7ecdc30027afbce9
	.xword	0x6cff617fc487c5b8
	.xword	0x6dde5ed71f9153d0
	.xword	0x4d447b6237b611fb
	.xword	0x276d11ae843a40d2
	.xword	0xb91dbab3d72fa7ba
	.xword	0x6dd8243dec433644
	.xword	0xdb28c295325d2695
	.xword	0xb88858d99b36a036
	.xword	0xa9c40c1b98c06691
	.xword	0xb8946b963d90fe52
	.xword	0xacc74242ea747c31
	.xword	0x12f9970970c2743b
	.xword	0xdfe9f76762a1742c
	.xword	0x04daeefc92bf3240
	.xword	0x5768aa9f31541e87
	.xword	0xca504074031eae36
	.xword	0xdf6dfbdfe6426b04
	.xword	0x439311bd246ae67a
	.xword	0x8da4e5a0ec4511de
	.xword	0xe7e08aba900b49de
	.xword	0x7f4d2e51efa48886
	.xword	0xb53a49ba370e4595
	.xword	0xde3a695acb132413
	.xword	0xb98a2d43d96df760
	.xword	0x4d24024c83847963
	.xword	0xeb5f891b4d55531e
	.xword	0x048edc8296b8bd87
	.xword	0x55ba2f70c24f9dd1
	.xword	0xe796070e1e9eac0a
	.xword	0x67c04b50b9f0e63d
	.xword	0xa392eb0bbe3acc5d
	.xword	0x21b9bd040b4a7b97
	.xword	0x9009b56963d51874
	.xword	0x7620dd47241e1137
	.xword	0x68bfeb48a72b234b
	.xword	0x0a9f36e9b89dc54a
	.xword	0x41ac1503cbae0658
	.xword	0xbf53967c13472927
	.xword	0x901804fd998bdedb
	.xword	0x49c7b228ba6cc66a
	.xword	0x4cb7dc41f60a48fd
	.xword	0x84d19f040689fab3
	.xword	0x78f8ebcc1a9a067d
	.xword	0x94ef0cd6cafbe4db
	.xword	0xe7ee56f3d31d713c
	.xword	0x57fc3b94583d2329
	.xword	0xebc56bd00641315f
	.xword	0x19d8f0968f22719b
	.xword	0x88a5166461634561
	.xword	0x377807b77ae84ab5
	.xword	0xb118df8adea22a29
	.xword	0x88fdfef5d6332189
	.xword	0x752e5d1cd3c9afd3
	.xword	0x73463d28fd9933e7
	.xword	0x65da10310e5f2536
	.xword	0xd7bc809d1b8da37a
	.xword	0xbebb979e62042746
	.xword	0xd41382e046dc04ae
	.xword	0x742bb4b5cd85c648
	.xword	0x37b6bac9e54b680d
	.xword	0xfb8c00ad9a34b0bb
	.xword	0x7995565f4a41e1ce
	.xword	0x83a9b8fc4ab01e2e
	.xword	0x8200bc544c7c6b42
	.xword	0x543da5e4677b11e2
	.xword	0x6b87f8183fc04a6d
	.xword	0x4266ce65aa3cbd83
	.xword	0x82eec183401e1627
	.xword	0x103d9d954efdf216
	.xword	0x2d457401dbc864db
	.xword	0x503887e4d31edf95
	.xword	0x31d256d2d3485e8c
	.xword	0x521a0582dbc22f39
	.xword	0x1e8d211d092ab9ce
	.xword	0xa47a2887e57fa7e5
	.xword	0xdcd464243111b51a
	.xword	0xe802dfca35e51282
	.xword	0xa3404b137697eb39
	.xword	0x961800eec1ec1f2d
	.xword	0x2c467cb327a72a26
	.xword	0x47bb01fc5f53b10a
	.xword	0xc2919b19ec2570c7
	.xword	0x14fcbb0f5f207315
	.xword	0x02b7eb99bfc5e1a5
	.xword	0xac77b8e770cbc4a2
	.xword	0xf025eedb16e595ef
	.xword	0xf2a61fbdd6e05a9d
	.xword	0x1c16ba51e0900cd6
	.xword	0xdd07cadd316b2139
	.xword	0x6e19cdfaaa81c246
	.xword	0xf5975c3b8d1ccd33
	.xword	0xb993c48367520691
	.xword	0xd54b2f9954da55a0
	.xword	0x0060dae0787d7009
	.xword	0xd66ccb38eea160e1
	.xword	0x2c4dcbe4a4a8b086
	.xword	0xe62e2ead42ce424f
	.xword	0x6d5dfff724a94640
	.xword	0xe0e933c77ea281ac
	.xword	0x59295c5a11edabc4
	.xword	0xf5c236e17e082a7b
	.xword	0xe3934e0408eb0064
	.xword	0x4f73e6ab6112202a
	.xword	0x4fcd3e7a86b94c29
	.xword	0xdd3682f199b8e654
	.xword	0xb80f1030dcf5a017
	.xword	0x32ac1dd2558c18ab
	.xword	0x7f8d2f3a0f68cca1
	.xword	0x00add6a6f88e1b74
	.xword	0xa9693569bdd80e8c
	.xword	0x7210b5f931310986
	.xword	0xaccc1e7b7620afc7
	.xword	0x02953ff1de749c0f
	.xword	0x7be03021a821af22
	.xword	0x8529dbe1e04b370f
	.xword	0xaf0ad2254ca53589
	.xword	0x0348d308ae16763f
	.xword	0xad8d07455555ae6f
	.xword	0xcacd7da7d02a49a8
	.xword	0x30a51a62a93e8cfe
	.xword	0xf1f1f40d0dfa7df2
	.xword	0xe31e9919998ccb8c
	.xword	0x0a20e08abbef3e20
	.xword	0x0f895dcab1786d8d
	.xword	0xa380d5b05324b5b8
	.xword	0xa79fc7cbebf0f283
	.xword	0x10384d775ac14125
	.xword	0xb4ce80d8adbcb073
	.xword	0xe5a3d537971d9335
	.xword	0x9ce577661c9ff415
	.xword	0x7f3a2f19ae5e4a16
	.xword	0xf17deda4ff59effb
	.xword	0xc1e3d4bb04bb7e94
	.xword	0x44ca367668b71b65
	.xword	0x85982dc821aea855
	.xword	0x964892ed71febc7e
	.xword	0xc2267bd86c589e14
	.xword	0x454e100d6af70e3f
	.xword	0x67ca74dacf70ea4c
	.xword	0x01fd90c4d8d30fee
	.xword	0x29d7112d6709a95b
	.xword	0x3a6267e1d52a2c0f
	.xword	0xa47e6b8a22f3c7b5
	.xword	0x7ceea76c3694cbc8
	.xword	0xaa31c9e3217bbdc3
	.xword	0x6bca0d626426feaf
	.xword	0xf71c4f7109dbe6d9
	.xword	0x0bd161b4a002634f
	.xword	0x828803cd47bbc8a0
	.xword	0xdffd81ff9ba1e89e
	.xword	0x4d8619bcafc39892
	.xword	0x19289994e4c3c01b
	.xword	0xc7be26cb42315719
	.xword	0x497c6cbde2f23a03
	.xword	0xec37abea6aa7c13e
	.xword	0x656db412f1219b64
	.xword	0x98739e9af134e809
	.xword	0x24dd67cabcec9583
	.xword	0xe114b82beac5dc92
	.xword	0x4dff22f5915b41c8
	.xword	0x63527d4c94c8c11e
	.xword	0xbf10a06e6d8bc71c
	.xword	0xc3677bab2467e5b7
	.xword	0x0984c35bc48b563f
	.xword	0x5ede225baae8d908
	.xword	0x88a561f92e460fce
	.xword	0x9f5f10ea46ca7188



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
	.xword	0x71f22e1ab1accb50
	.xword	0xa7a48526be48ab04
	.xword	0x1a5451abed666d57
	.xword	0x76ab06f59d79bb03
	.xword	0xd697fc014d6ce589
	.xword	0x03827690114ee9c6
	.xword	0xae8d593d1b40ad76
	.xword	0xaf7dd49c4c0d1977
	.xword	0xa68111ca4e7fb685
	.xword	0x3ed25d6cf1bbcec4
	.xword	0xf423779fc50b0655
	.xword	0x40f52a5671714f39
	.xword	0x19b94ef50c4c9848
	.xword	0xa334a2d665bf2fe0
	.xword	0x1774dcf479ecf0f5
	.xword	0x02d3b6f0acac5ff0
	.xword	0x788f4b090008d339
	.xword	0x7eb732c52c366e0e
	.xword	0x80329a6f8cc03862
	.xword	0x72f5b2d1e6733797
	.xword	0x257f2bd9ea31bc44
	.xword	0xbb3718f7645b8351
	.xword	0xc08e91357c3971e1
	.xword	0xdd2b527f0722fb85
	.xword	0x6246d0c79c80a2fc
	.xword	0xa4e8a99d2ee14828
	.xword	0x5fa465c0009be4f7
	.xword	0x1801c1805eaef1d8
	.xword	0xa2d36ef116fd5108
	.xword	0xb207275de670e9c6
	.xword	0x197c37049479d4eb
	.xword	0x6eb87028c5701ab2
	.xword	0x507b0a3552f33c26
	.xword	0xd16fa2b77667a1b6
	.xword	0x92cd8676af2dcd5e
	.xword	0x5dd01b696fbcfe59
	.xword	0x0f785dc8e23932a4
	.xword	0xfb08e50c85e481a2
	.xword	0x5db1f1b106c6d4f3
	.xword	0x7a4dc8156a7f4eef
	.xword	0x561c59011c3dd2a2
	.xword	0x56fa73c10b994a0b
	.xword	0x0ebc71a8a57567c3
	.xword	0xd83ed28cbc2dbdc3
	.xword	0x5220d62ae154842f
	.xword	0xbe44b398eea5fb66
	.xword	0x2e8c45fc2a366948
	.xword	0x5947b95c3c5f06f6
	.xword	0xc9885e4f7149b9c6
	.xword	0x4a9abd28f98ca04a
	.xword	0xf674ee8dc7e1503e
	.xword	0x8f7aad1e37637d0a
	.xword	0x41e34f48e02ee07c
	.xword	0xe7f1aedb10dca697
	.xword	0xe5dcb117d911dfb8
	.xword	0xd3f38af53de2dc9e
	.xword	0x68d9ee8620c8ff2d
	.xword	0x8ff6f458a6e347f4
	.xword	0x5a2e5befed0ad3f6
	.xword	0x9e38064ab8819bb3
	.xword	0x77277d6ac0c50865
	.xword	0x5e627f581de3c469
	.xword	0x3e1a1ca729db2162
	.xword	0x49e56ec2b603cf4b
	.xword	0xb794a701a7a1db19
	.xword	0x0dcb890a72967c66
	.xword	0x3165f377202f1404
	.xword	0x72875893c96e6703
	.xword	0x644d29c6251a0b72
	.xword	0xff1cc908c2aa3d38
	.xword	0x90b37d9e6db52a57
	.xword	0x23dc62a6eb941449
	.xword	0xf1e7b902ee72f314
	.xword	0xc969a16995273ab1
	.xword	0x7aa0bf6326582303
	.xword	0x4f9abaa5c385751a
	.xword	0x7985b2a874cee453
	.xword	0x2341832c0f11ab08
	.xword	0xa85cf34b7ac3e4b1
	.xword	0x410851cea778144c
	.xword	0xb691bbca7088a11f
	.xword	0x3eebdaf0f0c5cf5e
	.xword	0x743e83ffb830e2bb
	.xword	0x961820705fd0a83f
	.xword	0x3f66f06df11ed575
	.xword	0x876e54c88cf44129
	.xword	0x60ee50fcdb62c235
	.xword	0x6672dd0e4edfdad8
	.xword	0x10759c51bd886595
	.xword	0xa5cf37f1c720a8a4
	.xword	0xa64d2b5addf3c9fe
	.xword	0x2ce2b7efc619294c
	.xword	0x9611df34e48f28ef
	.xword	0x2627e96e515554cf
	.xword	0xd8c6c24a9b128fd1
	.xword	0x74a3c66219bf03dc
	.xword	0x13d2db8dffff8edb
	.xword	0x78e6a017e535f6e9
	.xword	0x444fa26dcb880ff8
	.xword	0x38cbed779e3c256b
	.xword	0x8b90733b2deaac46
	.xword	0x2baafa64f1b0b372
	.xword	0xa3218442ac38a309
	.xword	0xdeb910d36b56b1be
	.xword	0x80129445fe6fc6e3
	.xword	0x6f92e9e4a80211f1
	.xword	0x949708a7bf849991
	.xword	0x6e0a9b641f146898
	.xword	0x16a1774232e0e2b2
	.xword	0xa5c797ec7cf0fa2a
	.xword	0x872bcb08c9ac93b5
	.xword	0x963296a446fc33ad
	.xword	0x83fc4086a29dac2c
	.xword	0x02ee6ac54f508927
	.xword	0xdc3131612a039cb4
	.xword	0xe8f2896dfde25bfc
	.xword	0x4dd673c101384c45
	.xword	0xef26f4fa28a9458c
	.xword	0xf38b3f5e1b6f46c5
	.xword	0x35445829301dc9ae
	.xword	0xbfae6dc3097c3449
	.xword	0x03e8563db774f7c3
	.xword	0x87eaf419fbe6f681
	.xword	0xfbb9fd0439032eb7
	.xword	0x7ea7fdc6e863ecb2
	.xword	0x748fbfb41e401c32
	.xword	0xcfed5caa613e7847
	.xword	0x4b39d84d1509c3a5
	.xword	0x1431d1f185913d0a
	.xword	0xa847a98cdc783f92
	.xword	0x464d124a9e628d50
	.xword	0x31af77c8234dbf1d
	.xword	0x2e7a4a3065a14f35
	.xword	0x811452c6cd74db64
	.xword	0x6b54378a011368c2
	.xword	0x92ec153305e51764
	.xword	0xe43dd1db01ed47a0
	.xword	0xc955d71de38eff51
	.xword	0xe2b95cec8a09cbbe
	.xword	0x150c9f29df26f139
	.xword	0x48954acdbe293788
	.xword	0xeed125363b3e1fc3
	.xword	0x9ea868e06bb1cb15
	.xword	0x337cd068b3ea7b4b
	.xword	0x3d208e849ec7bee2
	.xword	0x532dc2f1cabce5ee
	.xword	0xf1c38873a8e5f871
	.xword	0x814b3612d765272d
	.xword	0x3f6583ad46426e76
	.xword	0xab3058c94c05af28
	.xword	0x659f43fa9788a1d8
	.xword	0xf3dcdf3a7341cadd
	.xword	0xab29ee849fee0ed5
	.xword	0x7ae2ba04bbe1e8ca
	.xword	0x2ec7568531a413e8
	.xword	0x1443868fa7318316
	.xword	0xa6bec4662662a49e
	.xword	0x3a1be1e43bb27708
	.xword	0x2609a90568f49842
	.xword	0xd8ff849eaba56213
	.xword	0x19bbc7d52d2b5e9e
	.xword	0xbd8d98e4e77af08e
	.xword	0xafe1b07ccd281ad4
	.xword	0x0a2548931848ecb5
	.xword	0x1f3b8a04dbaa8e05
	.xword	0x2ae18c7ad43c5875
	.xword	0x00c968c9736a3839
	.xword	0xc0035f9fa3de5ffe
	.xword	0x69489926800e62d2
	.xword	0x37b770de44497518
	.xword	0x09872e99f550a18f
	.xword	0x20d5acfb8d992a56
	.xword	0x7e69b52dc9f3f311
	.xword	0xbb7ed9a9e8ec8755
	.xword	0x6d6446d1d7fcb8fc
	.xword	0x35a7422b20c0834f
	.xword	0xf3b3bf643aae8c88
	.xword	0x6e4fe9d0e36f8d29
	.xword	0xf7112a930e8907c9
	.xword	0xec26f3e746124394
	.xword	0x2e867e130bf974bd
	.xword	0x1e62839ad7e56fe9
	.xword	0xcf19a3d3efcc7636
	.xword	0xd1641ac2dac46b61
	.xword	0x0fd51513f51318df
	.xword	0xa6bc81ab3de5b7cd
	.xword	0x229e55fef50e19a1
	.xword	0xef34306994640d7f
	.xword	0x863d15c6968adbb4
	.xword	0x43459b3f2b4af525
	.xword	0xbbfd087eb3bf8f57
	.xword	0x9a30cd81f9f44d6c
	.xword	0x05d976aba0501302
	.xword	0x287a5892a6d8dc86
	.xword	0x95ca82f03248ddc7
	.xword	0x852bad0afc144934
	.xword	0xa283ab0d46b862ac
	.xword	0xa2b0f697a06d8abb
	.xword	0xb8c1a61c17c36ed7
	.xword	0x698c36f8f1c2b967
	.xword	0x8b7167409c3b0ea0
	.xword	0x424a8135198467f2
	.xword	0x78bae860ad5c4b16
	.xword	0x7fe0dff1033dad9b
	.xword	0x20c444b82944be0f
	.xword	0x120fb86b4fe897b8
	.xword	0xfe91344ce9ce227a
	.xword	0xe763f765bd0f0ab4
	.xword	0x6c54823af2b031d3
	.xword	0x9be0767283be8fdb
	.xword	0x2ca839c86e5d557a
	.xword	0xdbea552abb1dfb28
	.xword	0x24a1b249cb6c9a6e
	.xword	0xcdd66fbbaf10c1be
	.xword	0xfc96637aa92293a8
	.xword	0xe01988e1b816a6b3
	.xword	0x40150a9ae04ed48f
	.xword	0x95ad0b4552d455c9
	.xword	0x1f2a2389dd4e41c8
	.xword	0x15813b969ce05a50
	.xword	0x0c5c225e347d3395
	.xword	0xf4eb4ee45d4e534c
	.xword	0x0f4cfe6d4d168ea1
	.xword	0x3d0a173992c22386
	.xword	0xadc751d5e1660ece
	.xword	0xbd47cad31c3baf7e
	.xword	0x4007bb646cdfdc70
	.xword	0x2c4a688355775eb5
	.xword	0x352e22a25676494f
	.xword	0x8887e8f56a31efd6
	.xword	0xcc41f00a72eeba9d
	.xword	0xb49d15fbe74bf60a
	.xword	0xc6c55a1c86b6dd7f
	.xword	0xeb56085ffbe2f516
	.xword	0x10606ea75ab38520
	.xword	0xcc13a970a3c9508d
	.xword	0xe1f5b1173cfaa9f2
	.xword	0xe8bbca7f291b98ef
	.xword	0x15588824d0df3eca
	.xword	0x67d2b0c41486a69f
	.xword	0x78377d9109a21e6b
	.xword	0xc7da5db4103ea93d
	.xword	0x035f178545b12ead
	.xword	0x6b3acac78b283efb
	.xword	0x1d432b9c827e917e
	.xword	0xe43e8143dba0fee4
	.xword	0xb44d1f549189513d
	.xword	0xfa61dab0a76eedf1
	.xword	0x2fa9b48aed8f57e5
	.xword	0xa6ca4eef738c8a78
	.xword	0x6cbfc31ed1a2c8aa
	.xword	0xeee2fd87ecfbe78e
	.xword	0x1bfe7b9c31e3a637
	.xword	0xfca35116a6c43254
	.xword	0x102a277900fc3189
	.xword	0x877aec6a94e244a3



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
	.xword	0x7b87680e6bbd4831
	.xword	0x194299f480768596
	.xword	0x9692b035dea586c1
	.xword	0x2d9a18fae4ae5620
	.xword	0x977e46517dc3f488
	.xword	0x9b3afe1c9e48755a
	.xword	0xd182bc3952fa4bbb
	.xword	0x1cd0127e8950cb89
	.xword	0x47b148e93237254f
	.xword	0xe2def86f4771182b
	.xword	0xbb66c75431feb8f7
	.xword	0x6eb0f9ebffc1c43d
	.xword	0x2650fa8db32b6242
	.xword	0x7a884ecf38b0d5ca
	.xword	0x691e0d47f6bd2e95
	.xword	0x6a1a90d5c7f6bcd6
	.xword	0x39415cf5dca9e378
	.xword	0xdca576104fdb6091
	.xword	0x042d8383c94836a1
	.xword	0xd4036064ec07a00e
	.xword	0x0dc5c8e161e38b5d
	.xword	0x7b7a990a037948b9
	.xword	0x61e96a705bcc5b8c
	.xword	0x82c76a06657e9f79
	.xword	0xafd1d090bfc2f619
	.xword	0xe07379aaacb2269a
	.xword	0x1d75875448757c5e
	.xword	0x17f1f5da7a0e1d4c
	.xword	0x10a0c7b99332bf12
	.xword	0xe542f6ef222ba96c
	.xword	0xa82c750f577ef6ee
	.xword	0xe1cf9b035f309eca
	.xword	0x3ac164c69bba5458
	.xword	0xde3814c7ecdd0fff
	.xword	0xadf8d097c4b620eb
	.xword	0xb6d05e4703be341e
	.xword	0x858147241ac21fad
	.xword	0xd0baddc892e51f27
	.xword	0x7ddc75d8d191fc40
	.xword	0x99368ae4982f4266
	.xword	0x80747e6748a9824b
	.xword	0xca6e0ad0387cf9d6
	.xword	0xfd80066b3f841adc
	.xword	0x03818c1abbac8034
	.xword	0x4a1d28266e2875ce
	.xword	0xa6936a7550fd1d3c
	.xword	0x4c51507802f2e1e2
	.xword	0xc7920fb5b9370ec2
	.xword	0x81864676ca20bb32
	.xword	0x11554be8141e9adf
	.xword	0x438fd6b7b4656ad6
	.xword	0x163096a176dfebbe
	.xword	0x543edde993a15a2f
	.xword	0x70dd0019ad4f589b
	.xword	0xfe53b89aec9b2c7f
	.xword	0x327584e803471717
	.xword	0x5ecbd500779314c0
	.xword	0xc0e2e137d672d834
	.xword	0xbd9ff8cee7caf839
	.xword	0x81621f24e230d691
	.xword	0x59d053d3cee22994
	.xword	0x3686570a69386798
	.xword	0xb5826eda56efa2dc
	.xword	0x0cb264da2fc01858
	.xword	0x76164504857084ee
	.xword	0x6746d12cf7d52a78
	.xword	0x074a1de6c754b5f6
	.xword	0x890799fd72cf4069
	.xword	0x1ee019ff390d8dfe
	.xword	0xec0f18ee9d7fe8ba
	.xword	0xeed9be9cada68e54
	.xword	0x1ef9894473c89c31
	.xword	0xd262f737f9fdd818
	.xword	0xb17097bcd930f3c0
	.xword	0x08f06cf5253aa8bc
	.xword	0xe26d240d3162fae2
	.xword	0xffa06567ef097aec
	.xword	0xb5b4a4f0fbad47b7
	.xword	0xbba1d0b03b25b1a1
	.xword	0x425e927d5cadb6fa
	.xword	0x41ecdbbbc1171147
	.xword	0xbf9f34b26b0673c0
	.xword	0x3e4241e1ffd7d88a
	.xword	0xf46761bca0ded407
	.xword	0xf61d38c423f81fbd
	.xword	0xbfbe92e9d30e0d65
	.xword	0x1d23648a9a10a335
	.xword	0x3bb0554b2d91b26e
	.xword	0x4206daa836476699
	.xword	0xa11a8617a5db85a5
	.xword	0x0f8738d6bea3d8fd
	.xword	0x27b8d7960cbafd6f
	.xword	0x94c43f35e26d3ff0
	.xword	0x125ccb7e41bcc6df
	.xword	0x59c153803a912cba
	.xword	0x920931c1c12774a0
	.xword	0x16d47d3ccf2bb46a
	.xword	0x08e4da1b27f2fece
	.xword	0xe1edf1059f6b5150
	.xword	0xbf15e97629b79260
	.xword	0xf98294320c02cc25
	.xword	0x7bcbb2b39a01541f
	.xword	0x74d595ec4cd545cb
	.xword	0x28cb604db44e6641
	.xword	0x2aac93c9ed675105
	.xword	0xdc2b98d1c500f946
	.xword	0x577bf6e6b51a7ad1
	.xword	0x5c7f9aa0dceb4afa
	.xword	0xec3051bba7170dda
	.xword	0xf516c7f7b7853e1e
	.xword	0xdbafbe22d1b0de0c
	.xword	0xf43b368ec0b41194
	.xword	0x668e3ac85b272e56
	.xword	0x92ad36fb60d97255
	.xword	0x44c794b67f30f344
	.xword	0xb69b620017b20521
	.xword	0x28f4ccfb4ec2fa92
	.xword	0x7457d206ab8fea05
	.xword	0xf65d558b4788f46b
	.xword	0x644566d8505afecb
	.xword	0x52ad94a7d38add9d
	.xword	0xbb6e58a7c37030e0
	.xword	0x2c210bc5008466fb
	.xword	0x119b38d5f736cb7f
	.xword	0x02f2c6978377f1df
	.xword	0xb4b3d11d885976f0
	.xword	0x92a5358208432335
	.xword	0xc075dc5c0af41359
	.xword	0x92bf6fd618dfa686
	.xword	0x566401e9e152ce96
	.xword	0x4b726c4859ce981e
	.xword	0xa50950e54d33c205
	.xword	0xe529fc567777b6be
	.xword	0x9a1505b1f6650166
	.xword	0x6b8ef841027e3e0a
	.xword	0x5242f0167662fc69
	.xword	0x3844991a0de3f07c
	.xword	0x3892a5fe876fa0f2
	.xword	0x8be69a84a50c2968
	.xword	0xedd5c12efbb40c4a
	.xword	0x7e73868ccdcaaeef
	.xword	0xc0ce3d6e1ecce204
	.xword	0xa862286b4176fd79
	.xword	0x98e2e9b723e19686
	.xword	0xc74f422c5dfcf454
	.xword	0xed5dd26713d361a9
	.xword	0x992acaadc4ed7786
	.xword	0xcd57115d92be657b
	.xword	0x282627cd61522e8b
	.xword	0xa6404d20ffc741f1
	.xword	0x3a97ce8807e79ec4
	.xword	0xfcbba465c5af4dec
	.xword	0xd946c7955adaf702
	.xword	0x8c9a1999f610ee77
	.xword	0xb814fe8b33c2eddf
	.xword	0xf01f89314d727318
	.xword	0x51b3516fef69b103
	.xword	0x136b7ec4240ca98b
	.xword	0xb3f4e4e0f2ae72fa
	.xword	0x7260ef4c209e013e
	.xword	0xd340b93c3a239fa4
	.xword	0x419ce87b4cece10b
	.xword	0xdecf0c8f22745433
	.xword	0x16801e16629df299
	.xword	0xfcb4f09d4beafc6b
	.xword	0x8a9c41106a43f722
	.xword	0x3d737dc93144e546
	.xword	0x3ba338e1df680344
	.xword	0x2567dfcd40938cd4
	.xword	0x68218d8310eb7bae
	.xword	0xf5344da4664008a7
	.xword	0xfee428eb47c3d640
	.xword	0x600159757a6de311
	.xword	0x5f22b41505316c7b
	.xword	0xeb35501c6971eef9
	.xword	0x1b8f9f5e15e1303c
	.xword	0x49723af39c594eb1
	.xword	0x07e2bb0586688e2a
	.xword	0xdd868cb2c89cac9a
	.xword	0xb6b91c0a9aa0b367
	.xword	0x6554de967ccf8cd7
	.xword	0x6cc0cc6c1341cc53
	.xword	0x35582cfbb463f974
	.xword	0xde620fd16bd8f8a1
	.xword	0x17e49a7ad328ad31
	.xword	0xeddc7beed2f02af0
	.xword	0x46db851c5838552b
	.xword	0x9b9f9161f0612a38
	.xword	0x068331564904e93a
	.xword	0xc0dfb6c32d3d0e95
	.xword	0xe01e50565ccf8cb7
	.xword	0xadb12d1ae041be9f
	.xword	0x0b0f3e4d224252b9
	.xword	0x33c2c5a516009a7a
	.xword	0x430d52127a4d008c
	.xword	0x968bb083d99234f8
	.xword	0x6e6a2020da893709
	.xword	0x8eb5bbd7556d0d47
	.xword	0x13a2cde233fabc6a
	.xword	0xf4f1c60b5756f186
	.xword	0x330c45d3343df127
	.xword	0x9aba5296a6349bf5
	.xword	0x1adf6806c2ec3517
	.xword	0x6985cbab83a2d815
	.xword	0xad5a4f64f4baf3ba
	.xword	0x9570a0deffd413d4
	.xword	0xfc6b8bb6707a6039
	.xword	0xa8b4cb0b830015d5
	.xword	0x9b86bc67ccf74a3b
	.xword	0xda4eb913100c70a7
	.xword	0x61e1a052e1187830
	.xword	0x10078c751e84aa49
	.xword	0x64318372fb6ceacc
	.xword	0x914b5f6e5f91888e
	.xword	0x538fd3241b6b89aa
	.xword	0x3f9df825b957643d
	.xword	0xd9724a476b4f14de
	.xword	0xb82b0b9fe45a7197
	.xword	0x2a3bc0b301b89779
	.xword	0x64c8f22b7d8af07e
	.xword	0xdd3e81da46332f23
	.xword	0x6485b5d19fec4e1d
	.xword	0x207c60bc7d43421c
	.xword	0x6c5c59a92290fb39
	.xword	0x6a47057d41da67cb
	.xword	0xab7e4e3bb3fe984d
	.xword	0xac3cc96b0361cac7
	.xword	0x2585ca95e6c98878
	.xword	0x70c174554ea16dc3
	.xword	0xb4814747de4d3751
	.xword	0x76d6051b7a4eb0bf
	.xword	0x3e497af0094cc9e6
	.xword	0x469f8a0f5893e7ab
	.xword	0x81bedb8bb2de56ad
	.xword	0x8c33d5c3dab6158a
	.xword	0xcfccbea7f8e9ab96
	.xword	0x7365700858514c84
	.xword	0x34b9e5398f0793f5
	.xword	0x8f9dbf340b1fa8f4
	.xword	0x0f4f313e37340dad
	.xword	0xe806ef7a5f46c16c
	.xword	0x696a7b68045d64e9
	.xword	0x6fb45cc7428009c5
	.xword	0xb62d887e9fdf944a
	.xword	0xc4e6cd3738d9c19d
	.xword	0xb4dae3fb58962003
	.xword	0xe962a45325b2c427
	.xword	0xa32b258c6bd7d01a
	.xword	0xca7e96b3e7c2b964
	.xword	0x22dff36fe6155c02
	.xword	0xbc7ac929377c6a69
	.xword	0x77d54f6defa16ea3
	.xword	0xa746440042461985
	.xword	0xfd6989289990c105
	.xword	0xa9e769c91c93ed11
	.xword	0xf7daaafc0bbcafb8



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
	.xword	0x5121efa73ff3ab9e
	.xword	0x8c28be1b0a6ba91c
	.xword	0x162f6b66ff5c2fdb
	.xword	0x8ed712f3592ec148
	.xword	0x135506c36ba5b7d6
	.xword	0xfaf98255afea2073
	.xword	0x07b01073bec7d708
	.xword	0x3d67befac1f6334b
	.xword	0x860b01d0d38b76bb
	.xword	0xcf598e9a5da41b88
	.xword	0x22c1bfc65b4a7c55
	.xword	0xb17f93bfb6a5e389
	.xword	0x7a958d0d99a235ee
	.xword	0x5685e2a7f2824973
	.xword	0x0403f0550586a576
	.xword	0x6b5e8ac145d34738
	.xword	0x4177b0475b7e006c
	.xword	0x765bf6f1f292826d
	.xword	0xbedc8d964ee4bef5
	.xword	0xc439e5fccf9a3cd8
	.xword	0x671ef39629c821bc
	.xword	0x647b6d7f7ae95d6b
	.xword	0x4a464493d385fd95
	.xword	0xfa097eca9bd82e94
	.xword	0xf8b625790abf2173
	.xword	0x46a81ff8fb171135
	.xword	0x16b48160392a293c
	.xword	0x29f055ed2109e31c
	.xword	0x31adf9039ee36c11
	.xword	0x02962f60983f2b1a
	.xword	0xa24be46fb9d29f39
	.xword	0x5df3fabafb7dc11d
	.xword	0xd9e7c4b94df8dd8a
	.xword	0x5499d6391592d4a5
	.xword	0x82b813f129c37822
	.xword	0xd050b7aa48896802
	.xword	0xfd84da47095794b3
	.xword	0xa8055946138533d9
	.xword	0xefa73ff2bbfb57d3
	.xword	0xa742715ecdf4e19e
	.xword	0xef8443ee3a433360
	.xword	0x95469afb86c618a5
	.xword	0x81eed8963f36dc49
	.xword	0x229c63bd6522668b
	.xword	0xf3747cd171ddf2dc
	.xword	0xc90de9ef9f3487bf
	.xword	0xd279b595b65cedea
	.xword	0xf6776d34127e883a
	.xword	0x8ec6e28c656686b2
	.xword	0x6077156a42cc5bbb
	.xword	0x81b2a5d714aa4b61
	.xword	0x6874bee77cdf4132
	.xword	0x16ca2ca8d2af70b2
	.xword	0xe006ef7f6612dc05
	.xword	0x6631b231cc2253d7
	.xword	0x5328396352ad229b
	.xword	0x9e7e0eb181e49ac2
	.xword	0x127c656a89d7f8e6
	.xword	0xe87622690b7d1fa7
	.xword	0xba95b99cf71f39de
	.xword	0x425b5c05d564d7d3
	.xword	0x7195ef74f51f9ad2
	.xword	0xa3aa1c002901fb72
	.xword	0x2aa448a7f71ce6dd
	.xword	0x9d55fe9482450a9b
	.xword	0x119bc4cffd9f72d5
	.xword	0x22f7fa31ca2813cc
	.xword	0x1300e8796ffee605
	.xword	0x2f1ad4dbb542b91c
	.xword	0xe29c03b4837e3d65
	.xword	0x97a475950c6c3246
	.xword	0x868923f2588d6040
	.xword	0xfb8a0952f5ad879a
	.xword	0xf3665b0b2ec608a8
	.xword	0x7d38a21a730e8481
	.xword	0xe2fbca1a610e5762
	.xword	0x5db074311b68a35a
	.xword	0x122ea7d6e9806273
	.xword	0x699fcf85b827ab49
	.xword	0x65536ab886e4135f
	.xword	0x377229439b14750c
	.xword	0xf103e5a370d51697
	.xword	0x991ff797881de2a3
	.xword	0xbadb1493e67dc52b
	.xword	0x5843b1dee8c95858
	.xword	0x89f0f3b8319a64c7
	.xword	0x48fc39ad4f8a8d01
	.xword	0xc82c2dc84f16f524
	.xword	0xbea2eaa503e65d73
	.xword	0x3f099965b43fd6eb
	.xword	0xee7a90d97b4a62b3
	.xword	0x82f55194a8d05acd
	.xword	0xde24d276432c97be
	.xword	0x58b867c31b52fdcf
	.xword	0x610da2016f38634c
	.xword	0x5523d4724ea71c4a
	.xword	0xa192833c8171fe09
	.xword	0xe9c0e25b0eaf8296
	.xword	0x72bcebeebadd53f8
	.xword	0x358751a465ff8366
	.xword	0x8581959feae939ae
	.xword	0x91078b0594938ee4
	.xword	0xac9fdbd9299deed1
	.xword	0xe7709c5d975ffead
	.xword	0x8e4b9a0a201feb3a
	.xword	0x54236af5c9b16516
	.xword	0x1a68eeaa5a26c2fb
	.xword	0xfa7d91a7b8d2968a
	.xword	0x1012e43e61b9c7d7
	.xword	0x7aaa3f7634b04fb2
	.xword	0x1616fbc716fe08d3
	.xword	0x4da2eb88e2af12fc
	.xword	0x87f760780fd9918f
	.xword	0x3b80b47c4a739619
	.xword	0x7787e36503500ab5
	.xword	0x2625a24beba59f61
	.xword	0x6f1b8c8b8eb4f7b3
	.xword	0x3ccbe2d0eef49245
	.xword	0x6af968e5d099a74d
	.xword	0x4d08e5111902f7ff
	.xword	0xde8c9adf6c4a2670
	.xword	0xa41105cdfec6e24b
	.xword	0x3efc69ea6437f60c
	.xword	0x304944ba0bf96c76
	.xword	0x47d6c583d8a22a47
	.xword	0xcc0cf636ac48cbc9
	.xword	0x32e147305f5d0bad
	.xword	0x0877c2eaa1a1384a
	.xword	0x6437a9a1494bc2bc
	.xword	0x280f720bb6e5a352
	.xword	0xdc3ea99654774b48
	.xword	0xf6d91d7ded5f3c9b
	.xword	0x42801e7f078745c8
	.xword	0xc7c25bcae18c37c8
	.xword	0x3ade918c4da42e94
	.xword	0x8cc6e404489e702f
	.xword	0x61f9c4f75d8af4ad
	.xword	0xff4f780077f1be2b
	.xword	0xf36a0adc89ef6603
	.xword	0xe91f55695c677136
	.xword	0xf943fc1484099121
	.xword	0x13a284315de5303f
	.xword	0x0c2de145d4279f9f
	.xword	0xcea4e5c705e1bd0b
	.xword	0x533cd8d1ab3778b9
	.xword	0x3ad04e413aec7c77
	.xword	0x37ed9e7cccb5d729
	.xword	0x2ad52a0a07d0bb99
	.xword	0xd4e88d11f72891e6
	.xword	0x8fcbc6f0167ce3d2
	.xword	0x56f0d3e8b9e6c147
	.xword	0x6afa103bd6b66f2a
	.xword	0xfae14f2ea94d8140
	.xword	0xfa40f3da3d92ed56
	.xword	0x5d48d190382cf179
	.xword	0xb062e744063fb5af
	.xword	0x42938f3c495d6e37
	.xword	0x4e5f52f87ae08c2c
	.xword	0x91b51b48e5282cef
	.xword	0xa2ec5125e981d66e
	.xword	0xeca810d34f886619
	.xword	0x0e557870736517c5
	.xword	0xe3818f94b3faa336
	.xword	0xc7b89a75fac5050f
	.xword	0x79d7d65beddcc683
	.xword	0xafa7fa581985b99f
	.xword	0xc146901306dad1b4
	.xword	0xc7bec567ee3db31a
	.xword	0xdafd45d223a8af22
	.xword	0xfaaef66a9eb37f16
	.xword	0x3521a38cba9e8bc0
	.xword	0x6bb0d1a8bea62a72
	.xword	0xe5913fdfd42555c7
	.xword	0xe7f40ce3a71c88e5
	.xword	0xfc90f74f1b5804bc
	.xword	0xdb7d900700f78698
	.xword	0xa1078ac88175f013
	.xword	0xc0f79b14a533a6e9
	.xword	0x11b6af1f2224f1d3
	.xword	0xe113f65f32f09f2c
	.xword	0xf6db4f01d1c765d8
	.xword	0x6f7003667bb2aa30
	.xword	0xed71dcac7480bc28
	.xword	0x174c5a73cbedebf7
	.xword	0x1c003b006afe9aa4
	.xword	0xecce9bf94dd1cb13
	.xword	0x234068d1cbb7448f
	.xword	0x6c92b4dd4343a83c
	.xword	0x59df0a646824f183
	.xword	0x815bb151ad7b9b40
	.xword	0x3412c96e8148cd03
	.xword	0x24d40177102faf20
	.xword	0xb06c112a4718d742
	.xword	0x49d6c2e6acdb10f0
	.xword	0xf16614b38cb8bf3e
	.xword	0xbcd75bb4eab77fbf
	.xword	0x94b41f55ae8be5bc
	.xword	0xd6175d90c2ad5e59
	.xword	0xbe91df733566d924
	.xword	0x4e1fa44a6ade2e9a
	.xword	0x99234d4a9bf371da
	.xword	0xb6b2f2a6f71f5402
	.xword	0x5ee908be8149a3c8
	.xword	0x0636fd657911513a
	.xword	0x6b223480c8b22067
	.xword	0x27446e4e2eca8fe1
	.xword	0xa36aaecc48f4b9f3
	.xword	0xecca15a7fa11da95
	.xword	0x6284ae7ec930b831
	.xword	0xd91dffc8975902c2
	.xword	0x6bc055c2802888d8
	.xword	0xd9a43b6b80a3ca23
	.xword	0x89e58b32c2fc9987
	.xword	0x3c31d8a1b0c0458f
	.xword	0x236ccb1fd11c6d40
	.xword	0x5e8187a19f733b45
	.xword	0xc000b6e48018f627
	.xword	0x0d16d0b55ae2a3a9
	.xword	0x007c13f621816aff
	.xword	0x4ba4e785a1500dac
	.xword	0xf73c5160b2ec5782
	.xword	0x7f5fcf8ee703095c
	.xword	0xc1ff80dbfcc1021f
	.xword	0xafdc32022001ad35
	.xword	0x2f4c1c9bd5cb5771
	.xword	0xdafef1163802b1b2
	.xword	0xde1f200355ee327c
	.xword	0xecdb7eecf18311a0
	.xword	0xa34073652be38db9
	.xword	0xd58e836ea7a80098
	.xword	0xbbacd99093ce0ba6
	.xword	0x1f5de36f466eb960
	.xword	0xbcc148affd74109f
	.xword	0x4044d6e9f9ab5a54
	.xword	0xad95e3e0c1a487a9
	.xword	0x2c5f959fcac66e51
	.xword	0x32512f015f4238e4
	.xword	0x7da1ce5b8879d7f5
	.xword	0x8f2bff43cede99d1
	.xword	0xfe72f448cae8abb5
	.xword	0x2587c9ebbaa871d6
	.xword	0x52d9f5bd60a52a2d
	.xword	0xdf0c32389e71ad3a
	.xword	0x15ae236e8e11241f
	.xword	0x1e20f02b7ada89e1
	.xword	0xddb4907d22408b22
	.xword	0xb8dd21f642b7c50f
	.xword	0xfd7c3247b2d54e0b
	.xword	0x2b35d0e29288554b
	.xword	0x1be9a9125b3fca94
	.xword	0x5bedf39e1f3872e4
	.xword	0x4dfd35c0654d50c5
	.xword	0xd375d52fc668171f
	.xword	0xd0ef5c7c964750aa
	.xword	0x8595674487414cbc
	.xword	0x2c09f2f7fef70827



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
	.xword	0x99a9f3f1a1053a2d
	.xword	0x3dfcab2d47743ea6
	.xword	0x37f3c0e20028ba9b
	.xword	0x07c04ecbfc477257
	.xword	0xd22625729fffd5ba
	.xword	0xe9b294f08d20cc2c
	.xword	0xcec222437650140d
	.xword	0x5daa5aa173300fdf
	.xword	0xe19390acc99a5b11
	.xword	0x261708b45d79de7f
	.xword	0x66f9c7b187f29e6b
	.xword	0x7a1e4313a25592a2
	.xword	0xa871f1b13a13e801
	.xword	0x3e0dec26cce1a978
	.xword	0x822ea08b4d1ea74c
	.xword	0x5bda482f7bc667d5
	.xword	0x718b7ec2709f463e
	.xword	0xa4397ccc9beddf9e
	.xword	0x4de0a99505b1d823
	.xword	0xa57da37fad05631e
	.xword	0x95d058cb0a83835d
	.xword	0xdbee44594fb4e02c
	.xword	0x009c3d44b9680d92
	.xword	0x9497e74d303578ff
	.xword	0xf8f9412e65df956c
	.xword	0xb81011aac6e04818
	.xword	0xd6063e02e48ba939
	.xword	0x6612066de0a4af10
	.xword	0x120f044608497086
	.xword	0xb7a57f3518e3a8cc
	.xword	0xcdd465d43f4f0972
	.xword	0x74c7e233fffa799f
	.xword	0xacd23b7b647adcc8
	.xword	0xbcd56d7c71e93937
	.xword	0xf3e0cf6b2a730e11
	.xword	0xa7bbefd170005a0e
	.xword	0x564f7f90f56e3c45
	.xword	0x147639d9e9554dc9
	.xword	0x4923688a469ca4d0
	.xword	0x5aefcfc65618029d
	.xword	0xb82de882976b1e17
	.xword	0x96ff65bae5ae9c81
	.xword	0x14535f60397d4362
	.xword	0x655ad24a0a139661
	.xword	0x9499263e0a32b3ab
	.xword	0xcb419e149527c551
	.xword	0x244c902ef3991bcf
	.xword	0xab41048b14b54075
	.xword	0x6b0acd519b39a8a0
	.xword	0x5e46a5d27169726d
	.xword	0xdb3c7e0c4abd4232
	.xword	0xe91668f6807e9885
	.xword	0xfc993a0bbbb0cae1
	.xword	0x4a4b1927a3ed4e69
	.xword	0x8a900603a5c21330
	.xword	0xd77837a70893a9a1
	.xword	0xc5de572844e49bae
	.xword	0x518d6438110140c3
	.xword	0x2316807936c9b080
	.xword	0xd24bfc208358afd5
	.xword	0x90ceb40e5fa8a4d4
	.xword	0x718c14502d8cfc50
	.xword	0x9b9d7dd9b43e7ed8
	.xword	0x3b4171369865e275
	.xword	0x8784d380f82a3ebc
	.xword	0x1a0236249860bdcf
	.xword	0xaa51bbafa5332235
	.xword	0x80ecd2bd7f109385
	.xword	0xce7a2429ecfe93d8
	.xword	0x24c803ce7b030059
	.xword	0x6ce5ced4a191d649
	.xword	0xec5239a277f91657
	.xword	0x68ad10d16c923aad
	.xword	0x8483e0a15ccde83c
	.xword	0x40bcf6526fd1cbc1
	.xword	0x26e407267d7903b5
	.xword	0x6ad93b374ac7a0fc
	.xword	0x0c5858340e519add
	.xword	0x6831cff2a6417802
	.xword	0xde750a3d538be61c
	.xword	0x402b7927f6cf0ebc
	.xword	0x3028ec15dcfc8c19
	.xword	0x42259eaf83975c38
	.xword	0xdab0839001773036
	.xword	0x7d31c5f26a2e7fea
	.xword	0xa0c93520831488ef
	.xword	0xab152f657ce5d64f
	.xword	0x431968de953d6e37
	.xword	0xc7a3ebad7f464418
	.xword	0xa8c7ba326f923306
	.xword	0xa8478c0e3776e817
	.xword	0x9b56977ace4bf15d
	.xword	0x3d42c9db6470367c
	.xword	0x80de2f410f755c84
	.xword	0x18a8fbc976953452
	.xword	0x2e1970eb8ffaf7de
	.xword	0xc37d62719cc983b7
	.xword	0x4e28f02ca9e0ef62
	.xword	0x69063bb02ecaff75
	.xword	0xbf545d261588698d
	.xword	0xc08630f877c1cb9e
	.xword	0xb0ccb76e44961f04
	.xword	0x56d73a0b2a1ea722
	.xword	0x7955a2e2d24ea361
	.xword	0x808032ffb75e3ddd
	.xword	0x905f33dacfddb5ed
	.xword	0x182e94258ca7cf5d
	.xword	0x84693620d0bcc3b9
	.xword	0x3b41e1a400908d91
	.xword	0xb0b021407b9372c7
	.xword	0xf6e7faec839c811b
	.xword	0xda554ce611ac5431
	.xword	0x5d9c6ff1c2dcc5ab
	.xword	0xe9194b28dcfc8acc
	.xword	0xb3b5bab3654e96ac
	.xword	0x176283e87cdc525e
	.xword	0xfe6065d36435db01
	.xword	0x6207311da9fcbc8e
	.xword	0xbbc88094e51b3b54
	.xword	0xc77f9355f9b76b39
	.xword	0x5347402278fccc55
	.xword	0xc7d9a0a51accc726
	.xword	0x3bb56a0e4fa81f05
	.xword	0x971648c4164a13e2
	.xword	0xc5734e002a0322fd
	.xword	0xff85e77202103dd8
	.xword	0xe697f1125b019bf5
	.xword	0xc17a14cd8dc4cadb
	.xword	0xf95a8ab1f9483555
	.xword	0xe668aa81e79f989a
	.xword	0x20a59e95cf92712a
	.xword	0x98d5bf0ae2de02b1
	.xword	0xece9add0aae78f98
	.xword	0x6d4013fa86dff4ad
	.xword	0xaf69520d1604b088
	.xword	0xc1e70dd06af3a178
	.xword	0xd846a5e516f3e1dc
	.xword	0x17ff4163bb860caf
	.xword	0x863fe2bc96e623f5
	.xword	0xde38486c4ab26dc4
	.xword	0x581ba5bbc0a26be7
	.xword	0xea171f352914cde3
	.xword	0xce6a50a14635e038
	.xword	0x173328320223b29f
	.xword	0x4bc33213da48f2ee
	.xword	0x9afd6293b7e6d1d8
	.xword	0xe38a2a5bfba10feb
	.xword	0xa836ccc4ed2fd7e3
	.xword	0xb161423271b6cba2
	.xword	0x264e512a979c195d
	.xword	0xa43fa6d4da378637
	.xword	0x1e7674fc0d3d0718
	.xword	0x2b59c9d54ceed0a2
	.xword	0x82a6f94d2e7fa5e0
	.xword	0x707dc79997c077e1
	.xword	0x5db9c6ac259679a7
	.xword	0xfc52877130f30900
	.xword	0x6249edce784d7ae5
	.xword	0x8e82d091a41d05f9
	.xword	0x5b083b094f1c212d
	.xword	0x2aa5194e3aec77c3
	.xword	0xcd5bb36c0f59a763
	.xword	0xce6200b54626cd96
	.xword	0xb93cf2a91dc9b4ac
	.xword	0xee8102382fb03b37
	.xword	0xa35c7e9388fb5e46
	.xword	0x3615325b816293e9
	.xword	0x1231813910c4c07f
	.xword	0x00bbcc69a18e3e86
	.xword	0x564795828845040d
	.xword	0xc7710a43083cb7d1
	.xword	0x4d7b70d1e077bc1a
	.xword	0x9e94072ff8d409ed
	.xword	0x91b77c383a5dc2a5
	.xword	0xaa9c13d438a8d1c2
	.xword	0x3178e0d1fc81d2e6
	.xword	0x9341d84924c2c7b5
	.xword	0x7bfe4e6cb6c9cb17
	.xword	0x8280d8c716986e3a
	.xword	0xcd55811c99d17c43
	.xword	0xcce85d99c39b3dc6
	.xword	0x8c6aec3745ebf340
	.xword	0x5f03ad9f929cfb50
	.xword	0x888b9322cd1c8234
	.xword	0x15d17f6a4eb90bf3
	.xword	0x2adcfcc16cc196c9
	.xword	0x0d4b14ea047612ae
	.xword	0x7e54e2136ad063ff
	.xword	0x2a9bcd298041fe68
	.xword	0x52b40910872f5e5e
	.xword	0x4506b069b8e7f8f7
	.xword	0xe1684f822a259101
	.xword	0xd1741860abf41e9b
	.xword	0xea2bc8184af03883
	.xword	0x8e8b02e613123fc1
	.xword	0x3157b3ca0434b255
	.xword	0x66fd7aaa667dd594
	.xword	0xbc9cd8311b23fa06
	.xword	0x2d9008f208c0890d
	.xword	0x818611e3444bc6d9
	.xword	0x4fea8808515c9745
	.xword	0x2449778db11266d3
	.xword	0x382de724f9ea9124
	.xword	0x1002ac58e0db0e6d
	.xword	0xd302afa0586881a7
	.xword	0xa15813532d607b99
	.xword	0x7395d1ec5860af62
	.xword	0x83c01bf320526fdd
	.xword	0x38ec67bc8a95d9b4
	.xword	0x2e48cc410c942bce
	.xword	0x71be7aa48562378d
	.xword	0x57321626cf232fcc
	.xword	0x059627b07c79788e
	.xword	0x20c0176cecb333c3
	.xword	0x598e59e01d1bf64a
	.xword	0x0aafa87012080a47
	.xword	0x6daabbc3b33e9f55
	.xword	0x714e2602a133ca54
	.xword	0xbe327a9550faa341
	.xword	0xf571b1e06ff16fce
	.xword	0xcabccbe1ee834fd1
	.xword	0xfe570b987c8fceb9
	.xword	0xb4cc0579282a51aa
	.xword	0xf620cb21dc76fba2
	.xword	0xecc610894c944a98
	.xword	0xa92df8d5408f900c
	.xword	0x73380438f6b7de0d
	.xword	0xe55a869bacae9621
	.xword	0xef7f658ee698e2ee
	.xword	0xa1a2f13d65897c32
	.xword	0xb8aaec28ac5dc4dc
	.xword	0xdec668785ef50992
	.xword	0xb5f2c9fc03561605
	.xword	0xcff2375a3291bc7c
	.xword	0xa0e4bc00ff58cd64
	.xword	0x9981782920bd7449
	.xword	0x4fecb3f05472ca17
	.xword	0xb6802109d246d52b
	.xword	0x90b9049e75c6bff5
	.xword	0x02c213668cae246a
	.xword	0x3d14feee17b3cf3f
	.xword	0xddd6a7ebd1068ded
	.xword	0x362cea5e08d0c5da
	.xword	0xd9027a0b5e5b94b9
	.xword	0x230a29ba45bf7ab3
	.xword	0x11731215aca7e3cc
	.xword	0x7ca289e775dbf2ea
	.xword	0x258b78c37c3927f6
	.xword	0x6e8eaa02deaf0c98
	.xword	0xa334cda184b286a4
	.xword	0xc5f509885bad208b
	.xword	0xd4fb57bf883d8baa
	.xword	0xadeb4655d3ffd218
	.xword	0x488481abf15d05a2
	.xword	0xf5c6ddaeb44062d2
	.xword	0xbf03e16bc145956b



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
	.xword	0xd9d95b7b68299c4a
	.xword	0x94d91b587a8f87ae
	.xword	0x9c8a9e39fe004842
	.xword	0xd0d918c9da61392f
	.xword	0x8e8032677a26e77e
	.xword	0x4eca4db10a700dae
	.xword	0x06e905a73b258e25
	.xword	0x8252a435a1bb0063
	.xword	0x20187b589869fab3
	.xword	0x7ef477ea9e2111e2
	.xword	0x91010d973d65aa06
	.xword	0xa145079cd1e40179
	.xword	0xa05b8730099b8bc0
	.xword	0x7b130bbfe5d9d6d0
	.xword	0x660f80df0702f8e8
	.xword	0xd16f61704a21a9fd
	.xword	0x082d756a8771de43
	.xword	0x2fc9de949d40b030
	.xword	0x805465300a100c59
	.xword	0x7a842981c9c969b4
	.xword	0x294e590b211a6a22
	.xword	0x9abc347e9f65c6b0
	.xword	0x94562149dc01c7fd
	.xword	0x84a9a2cae7c24370
	.xword	0xad3abb0d08ec30f8
	.xword	0x124e7da928e19a83
	.xword	0xbd945dee953fdb26
	.xword	0x5cf33d1dfe048cce
	.xword	0x8d56b8b909fb0d54
	.xword	0x003d04eedab74ebd
	.xword	0x79c06f938c501e87
	.xword	0xd4eb5027cf81e55c
	.xword	0x90d0331ed15b6efb
	.xword	0xc2491a1d742dde30
	.xword	0xb246f529cd4ed746
	.xword	0x1aaf2f4369796255
	.xword	0x780e9e75c0278652
	.xword	0x70dfa1c02cac6bb8
	.xword	0x43fc1a6b5eecadf8
	.xword	0x9c095810f8a61732
	.xword	0xe2d2b2bf54a78b8a
	.xword	0xd23822a17b3475ca
	.xword	0xba5e955a9f0a0b2a
	.xword	0xd4fb3f67c19f13de
	.xword	0x8908bcc6c7bb978d
	.xword	0x4c72ea8d2f8c16b6
	.xword	0xab54878d4f0725ad
	.xword	0x72573a72380a5fbb
	.xword	0x023e0e623409abfb
	.xword	0x47c69c69bac583ae
	.xword	0xf96347ae03d93bef
	.xword	0x59e82ca4158141d9
	.xword	0xa93df6dea828e2e5
	.xword	0x802d710f6fe5e7f9
	.xword	0xb97b89c700ac2e79
	.xword	0x01130f9cbff73e1d
	.xword	0xbaa47b47f14af54a
	.xword	0xb5b3009a9b9db195
	.xword	0x9329c303df03ddbe
	.xword	0x7e6da9eb5f7b7df4
	.xword	0xca1b57026fced60e
	.xword	0xf7e3fe440d18f3d6
	.xword	0x8b720bc583c7e3e4
	.xword	0x9536148bd74d6fc5
	.xword	0xdab5a5e66ebf04c1
	.xword	0x67a1791cb8b957cb
	.xword	0x91c1f56b03828a20
	.xword	0x60cf75ef9074cd46
	.xword	0x4d8946d860fe93b9
	.xword	0x3cda5fdda27f8e44
	.xword	0xee8eb416cf28aaf7
	.xword	0x9b2bac2c722e0ee0
	.xword	0x93cc4dc3778c7ccf
	.xword	0xe1b26f8fc51740d3
	.xword	0xdd231131e8ee5fce
	.xword	0x6ef136ebec521200
	.xword	0x92f1d88c167067c0
	.xword	0xe388e0f12a0599ac
	.xword	0x865fa2b396121a77
	.xword	0x9178a6646f5a1d12
	.xword	0x04b2bb0baf54580c
	.xword	0x4fd52e3f1f9f6b7b
	.xword	0x3621972ec18e3482
	.xword	0x843d39682e0ed43e
	.xword	0x4a9a3c3da7bb077d
	.xword	0xf38e57c399fe8394
	.xword	0xbd2996f54cb10c37
	.xword	0xae0fe98d982f425f
	.xword	0x46abafff4dd4d64b
	.xword	0x5bdd3d031f0d153e
	.xword	0xc6f604db2bf02d85
	.xword	0xaca02c4e45a637af
	.xword	0xa07e9c400d2913d6
	.xword	0x16ba6e22ffff0af9
	.xword	0x34f1a9e85fe1d612
	.xword	0x49443f3a26b8b02a
	.xword	0x9f4965a37a2bc9ba
	.xword	0xaa5b30defac0868c
	.xword	0x7273f8afa4cad429
	.xword	0xac3c32d010008894
	.xword	0xfdbef1ee116c04bd
	.xword	0x8bdc39718e3187dd
	.xword	0x9fc84378817cc987
	.xword	0x8140a1d0348efc92
	.xword	0x599951fe37cc1773
	.xword	0xbb4d67155086eca5
	.xword	0x3c415628b8a20b54
	.xword	0x591869d0ea54de39
	.xword	0xcf29417b9bc94fa3
	.xword	0xdcb185abe9b273ff
	.xword	0x6780b8ced8e4df9e
	.xword	0x718bc82ef7d2c08e
	.xword	0xbd740591b6f6d99e
	.xword	0xc43eef71ce2b8ff1
	.xword	0xba83cf3e4275d904
	.xword	0x9231c6f51333c65e
	.xword	0xa797153030a7c639
	.xword	0xae257528ec8e5477
	.xword	0x11ef492f93f1b60f
	.xword	0x87948084a84f3dd8
	.xword	0x57bf1c906b196d68
	.xword	0x803a46764887d43a
	.xword	0xe3e67f8073a9abdf
	.xword	0x1f270ece04f21eec
	.xword	0xae5358e347897141
	.xword	0x80ebdfc4b26b83d4
	.xword	0x625fd61693cdaf43
	.xword	0x0973fe8cccf38f67
	.xword	0xfb6866897b9532a1
	.xword	0x06fe77e6fe7153c0
	.xword	0xe786ded8271f21e5
	.xword	0xc58343c892d8720d
	.xword	0xd4677084beefb48d
	.xword	0x50edd7780b89567b
	.xword	0xd81bba504395c935
	.xword	0x02dd808344b1ae2f
	.xword	0xb7730cee1fa0c22c
	.xword	0xa1ab12c0d603c77e
	.xword	0x654157ea394bb92d
	.xword	0xf28796fc0af5cb78
	.xword	0x8a1953016494ead0
	.xword	0x1fa5d7fbbf3f4f91
	.xword	0x6b0c3776cbef9484
	.xword	0xcb1d55ed193fb44b
	.xword	0xc3135f13e6bacc3e
	.xword	0xd0fbc88cd0872956
	.xword	0x78b0c9d9912ac70f
	.xword	0xd6de123ceac9b88e
	.xword	0x77a3bd64d4776e32
	.xword	0x0194221bf703e758
	.xword	0x5c46b54bb219977f
	.xword	0xe5ad734599a62fd3
	.xword	0xd46b6d2be6b94177
	.xword	0xd1bac4ac682c3599
	.xword	0x917fead654f4edd1
	.xword	0x66ebdfea3e39402f
	.xword	0xd2a40f2c197b629b
	.xword	0xa70d88293b244a63
	.xword	0x0020d62a7574fc5c
	.xword	0x658bd6978741f293
	.xword	0xd7c4a952276a7c14
	.xword	0xa68d7d312b8c7788
	.xword	0x5204c13e07063fa8
	.xword	0x040ec1c84c54fd32
	.xword	0xeab3aaf691520e3e
	.xword	0x2a3ac92765bd00d8
	.xword	0xad389667eb221a8a
	.xword	0xfce333ca1f8498c2
	.xword	0x96574f0173d569af
	.xword	0xeca6bfa87f399bf5
	.xword	0xcc4933ec5298f0f4
	.xword	0x9f8c86d74606d6a9
	.xword	0xf2046ad37d0698b7
	.xword	0xaa8030e9644ece20
	.xword	0xfff649e763208f61
	.xword	0x5a0d9a8186e1e072
	.xword	0xa5ae183b88456d49
	.xword	0x821beb6da01a8090
	.xword	0xaa6d755dc1ca0426
	.xword	0x53e30c2b6ce7cf2d
	.xword	0x0d42e8eae41bc285
	.xword	0x86550a3ff79d107b
	.xword	0xe706e1c863d4ac1f
	.xword	0x03a3580c224f6b3b
	.xword	0x829083e0081a2a99
	.xword	0xf7b25d0015ce2c59
	.xword	0x9f6fe452e54bc490
	.xword	0xe167cfd8802d8b1a
	.xword	0x3782bf21553709a8
	.xword	0x21166b73fe9b40b9
	.xword	0xd67858e4198bae37
	.xword	0xc526b0ec3241b907
	.xword	0x4caf06f3591cb8cf
	.xword	0x09d5d1e057ab240e
	.xword	0x38de6ae37634904e
	.xword	0xd4ba8eafb1432f88
	.xword	0x6565d92def727aff
	.xword	0x10ba6393ffa82fcb
	.xword	0xc76d57ac21188120
	.xword	0x287b8da1e3ea4bc2
	.xword	0x3c4a379327f563d3
	.xword	0x83fbefae6a3de171
	.xword	0x4b28b65755b529f8
	.xword	0x62730667e7dd5e5e
	.xword	0xb12ed60ef5de0117
	.xword	0x4cc8dc99e0011dea
	.xword	0x2e626fe891cb5966
	.xword	0x6cfff3ac5676fb9b
	.xword	0x09758240917f89d6
	.xword	0xf280820838c879c3
	.xword	0xd84e5571cbce2b03
	.xword	0x3e656d25e7d4933c
	.xword	0xb5803ce27ab45056
	.xword	0x6eb91241b78aafb2
	.xword	0xa7028ffc4c954921
	.xword	0xf4a5817156eecee9
	.xword	0xd7158805906df23c
	.xword	0xb334f0f795b9c2e6
	.xword	0x2d8284f50ff1ad58
	.xword	0xfce6c57a59f2d570
	.xword	0xee332f5c0dc2d453
	.xword	0xb243add474029b14
	.xword	0x4ca3c953b00b4415
	.xword	0xde857d0989a58ef5
	.xword	0x75dbaf913bbedd01
	.xword	0x762aa022750967c9
	.xword	0x818ed3f6e8f3c683
	.xword	0x02c1774e884a3cac
	.xword	0xacb7eea8b5a8f08b
	.xword	0xaefd097a96f87889
	.xword	0x91a7814f334af3a5
	.xword	0x9912aa1ca803c71d
	.xword	0x09838423edaa2b9f
	.xword	0x1d805290c57737d1
	.xword	0xdf40b059d9cec76f
	.xword	0xa43324045c2646d3
	.xword	0x320b6f38169190cc
	.xword	0xa5a99952de913d8f
	.xword	0xfed562aca7b15590
	.xword	0x78493ab5db540ead
	.xword	0x8c4d104c2ead1dfa
	.xword	0xe0f35a64c1387604
	.xword	0xa156b42e891d849e
	.xword	0x0d876ca27aa9f56a
	.xword	0xcbcef9fcec7685b9
	.xword	0xf8e5170641b9bebb
	.xword	0x69bae991ea0c5fcb
	.xword	0xd8c6322d4520e6b0
	.xword	0xb1c3ebdf6db8cd75
	.xword	0xae39c646a339c627
	.xword	0xa67843276cd16072
	.xword	0x48cfb999e2298a2c
	.xword	0x37103149bbae38f9
	.xword	0x3a27fda507227972
	.xword	0x796cea67e4c52dfe
	.xword	0x1239d1e547cba1c1



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
	.xword	0xf1d8b6e58ea35f9b
	.xword	0xd034cf2df85adefe
	.xword	0xb5c828abe9410da3
	.xword	0xece04c7f69cf6951
	.xword	0xddfef5620280dd7b
	.xword	0xea02c9c21641205c
	.xword	0x1061764c24cc4238
	.xword	0x70e2d6846204b134
	.xword	0xa8b1cd2ecd43b983
	.xword	0xc165b64a36f7e80c
	.xword	0xdce32aa423c5355f
	.xword	0x2d3f919e3825ea0a
	.xword	0x1984f0b14d8b686a
	.xword	0x498e54ee5769d62e
	.xword	0xeabde6ef27f776fe
	.xword	0x7ed7823e5b30772b
	.xword	0x87ad34ebcbed6c41
	.xword	0xb7b3b512defde49c
	.xword	0x375984d022271669
	.xword	0x461245a365e242ed
	.xword	0xc1ff5f0e7761adaa
	.xword	0x58b20c422766fcdb
	.xword	0x3139faf83b205938
	.xword	0xf9cbf530a5f63860
	.xword	0x4b74f40f51f1045a
	.xword	0xee38f1c6369df327
	.xword	0x6f25c39cbe527e79
	.xword	0x3759c5d998d66f83
	.xword	0xec25d186a2482e77
	.xword	0xac861e64e5dec1cd
	.xword	0xbae5f3f160d559a8
	.xword	0xf5dd8c83124c54f6
	.xword	0x0276b209236b35b5
	.xword	0x839835e162ce5188
	.xword	0xef6a2141ce328fdd
	.xword	0x70051dc149ea4851
	.xword	0xf455d5ef111f6459
	.xword	0x3be2899f1e7140b6
	.xword	0xc5252c7bde4abf34
	.xword	0x18ffe1a68a33f3e9
	.xword	0x783c8c189440c052
	.xword	0x6f341f58e3bd91d0
	.xword	0x3037b09cd64be8e2
	.xword	0x3d5a5e8476bd9da6
	.xword	0x0779f195efe0908d
	.xword	0x09124524557aca13
	.xword	0x13116efec369bf8c
	.xword	0xc4342f247a5b5bbf
	.xword	0x428882920949fc15
	.xword	0x23038602db6def12
	.xword	0xec6b436f82553c04
	.xword	0x0b382d42d6f477aa
	.xword	0x80c1936dfcc0fef7
	.xword	0x2efb6182ff50b6fb
	.xword	0x59b07d301c490119
	.xword	0xb98770524be796bd
	.xword	0x093db4aa18fb7df0
	.xword	0xe0c71ce63fbc8374
	.xword	0xed63439d909c171c
	.xword	0xd41561d711c6b77a
	.xword	0x1568d5211c47ef8b
	.xword	0x6277612e75af0d42
	.xword	0x0ca5675f5b4bc608
	.xword	0xda425ce29411c3f7
	.xword	0x6f83339038ca0cd7
	.xword	0x87bf240ef9c34d61
	.xword	0xfb25981ead013635
	.xword	0xf578f0affdec5a91
	.xword	0x92e701a6e0976afd
	.xword	0x300a44942333b96e
	.xword	0xf41854d669052be8
	.xword	0xb9f61a05806563af
	.xword	0x73fe354a829fa510
	.xword	0x6040ec7d931b9ada
	.xword	0x391edeac90b35cc3
	.xword	0xc531c91553142a11
	.xword	0x319175724cc9685e
	.xword	0x1d40688a9ed5d8fa
	.xword	0xf25bf76707afc36b
	.xword	0x0aff0257df427440
	.xword	0x684f48b699785947
	.xword	0x15b12f4898f10b08
	.xword	0xd6db16c33f47d87f
	.xword	0xadf7698db0098855
	.xword	0x99964c6d46d54c99
	.xword	0x7e4fdc8681668924
	.xword	0xda50672aeca41842
	.xword	0xf5fb8551a97e2a80
	.xword	0x7d8345abb6d1ed46
	.xword	0xd49cd5a99b51c29d
	.xword	0xb84a68d7a952bc37
	.xword	0xc5a8854ea57232e1
	.xword	0x1f9ca7343c906693
	.xword	0x46116b8ce19f6c70
	.xword	0x293caf1962a5e01a
	.xword	0xb90543c55c57b262
	.xword	0x8188fb74fa6cd0d4
	.xword	0x78538916fc7d1b66
	.xword	0x25b70d3c61bbeea5
	.xword	0x787e14c39369bca9
	.xword	0x297a91e93fa4bbf5
	.xword	0x1df31592db9402ae
	.xword	0x859a8f1c00597859
	.xword	0x59963a7a8702000d
	.xword	0xc8fe3fe25a85837d
	.xword	0x34def73fca25bf47
	.xword	0x5083ab067cb8fc54
	.xword	0xde0e72ce2b7cdda6
	.xword	0xe1d568345e6a720c
	.xword	0x9e04c722184c36ca
	.xword	0xd6445790122f4f42
	.xword	0xf88da153ee75696d
	.xword	0x1c12f9f94ef8cd75
	.xword	0x9e36b41266b4da19
	.xword	0x211d08ef05ed2be8
	.xword	0xfff9b31b026be09f
	.xword	0x17ff5f6c35aea2d3
	.xword	0x1bd9a5cdd7c09415
	.xword	0x8309158c8ffaff67
	.xword	0x7a823a1d8d752f03
	.xword	0x51733fb9588d54e1
	.xword	0x0fd824f65dc8e4d1
	.xword	0xa529eaa76a4695eb
	.xword	0x8c9958510544052e
	.xword	0x83a02154da3fdbbe
	.xword	0xfad71fd175873aae
	.xword	0x18dd7f820dca6480
	.xword	0xb286133c9ad646ae
	.xword	0xb9556a53c178bf8a
	.xword	0x136d402f46aaa4cb
	.xword	0x7942d606b159faec
	.xword	0xa6b334158310cf8c
	.xword	0x03ee38de31ec8d1c
	.xword	0x6c082ce23b3310fd
	.xword	0x67a0dec10f6f4bf5
	.xword	0x3ec4fe149eb6db51
	.xword	0x0b52b50a825a4676
	.xword	0x4c3f5f9f305951b0
	.xword	0xe71ce618063a9868
	.xword	0xbfcfaf4d3b696af4
	.xword	0x044e92dc51983ea3
	.xword	0xc9832f395c825606
	.xword	0xd58c6ba48011ee68
	.xword	0x2e8ef29724b71f22
	.xword	0x53c612dd87057448
	.xword	0x80fb526a90417adc
	.xword	0x9cee197f49f4bd6f
	.xword	0x668789f6c08f62a9
	.xword	0xcdd78d2b6a516662
	.xword	0xf930c3a3e84ff44d
	.xword	0x5bb69d541f15baf6
	.xword	0xcc0910e1df0a6950
	.xword	0x8488e8c5a2985c76
	.xword	0x833416e8d936bcf1
	.xword	0x0055d11c4ba5c78f
	.xword	0xc2189d951fd6a3e8
	.xword	0x3ce96af979532187
	.xword	0x37cea93a4ff902a7
	.xword	0x09d09261dd948988
	.xword	0x35fec21474b97863
	.xword	0xbf8e38722c0a14dc
	.xword	0xd0e3b40a5e36140b
	.xword	0xdfdd044589dbe864
	.xword	0xf1a9823756142f57
	.xword	0x27c110134d1521b3
	.xword	0x3678bfa3b0a83cb3
	.xword	0xe161235a86ca8cb7
	.xword	0x3c8d0d139869c943
	.xword	0x967f62d0466f221c
	.xword	0x6d664f86312765d2
	.xword	0x8bd1895a91bfea65
	.xword	0xaccec39dc1152ca9
	.xword	0xd0dade5d798607b1
	.xword	0x5e7977efb31b4eaf
	.xword	0x5f6bafa8ca293225
	.xword	0xdc74dd056b82544d
	.xword	0xfc15efc42b1eb593
	.xword	0xa3321e28b8896032
	.xword	0xa975304d012a6e02
	.xword	0x44a91f456ebc2389
	.xword	0xfbd33461c7e9c533
	.xword	0x9b5816b296c1460e
	.xword	0x575099aecee5fe5e
	.xword	0x66cb4a12c22c209a
	.xword	0x34b25bafb93d5825
	.xword	0xf3acd0897640d632
	.xword	0x2018057ef435a84c
	.xword	0x9eddf0bc7c46f72d
	.xword	0x07d3408864930635
	.xword	0x0cba889616ccea59
	.xword	0x48e4183c9adcdc48
	.xword	0x4885054bd83b5988
	.xword	0x362fca7f775ae162
	.xword	0x2ef668d7de84c40c
	.xword	0x4b6f1a497f171660
	.xword	0x112e4503e063d47c
	.xword	0x42cb76aa90ff0d57
	.xword	0xfe5865b866e364a5
	.xword	0x5c1b7e08a9a430ce
	.xword	0x0ce6b7b29c4b982a
	.xword	0xe930b01cf89387be
	.xword	0xa029a6025d1dc1f5
	.xword	0x205bb329f24fdec5
	.xword	0x21b3ccf5b8212704
	.xword	0x3fbc7c2d160018bc
	.xword	0x37b39dbe933f2787
	.xword	0xaaeb4ba10d7b6295
	.xword	0x755f59f48e525779
	.xword	0x7254d3f25dcef121
	.xword	0xef1969d122025eec
	.xword	0xcd22c63e59d4127a
	.xword	0x9e87bdaf2aabb626
	.xword	0xf88aa4388e4478e2
	.xword	0xc808a90ba961494a
	.xword	0xe60e929a8b958eeb
	.xword	0x5e76c8737a35aeb6
	.xword	0xce08c5ec48ce47e9
	.xword	0x40db072a23782f4e
	.xword	0xd9196ee804288c9b
	.xword	0x1a09f66e4b740707
	.xword	0xaceb477ae289c210
	.xword	0x142ffeb737251952
	.xword	0x93f96512bacc61e7
	.xword	0x2994eb63e2ffc903
	.xword	0xcd3961f70c68ef10
	.xword	0xee40a7d3ff2d45c7
	.xword	0xb6e235d4a4ae55ba
	.xword	0x72153b9fb875b3a9
	.xword	0x96b0ccee82f30c24
	.xword	0x5b9a25ce3053bc39
	.xword	0xfce07c28d1d98939
	.xword	0x500ee6521a5884cb
	.xword	0x8feeaa7083218b18
	.xword	0xdda834059c4ba3bb
	.xword	0x64bfe14993c9f245
	.xword	0x3d222c0f36700836
	.xword	0x7ee6687e8d563c44
	.xword	0x7eaf954b68c96bd5
	.xword	0xa1402103d7d0cd50
	.xword	0x8bf68df3a2cdcb5a
	.xword	0x8d497aec078602e6
	.xword	0x2085fe7df110b84b
	.xword	0xb8a3b0967b46b20a
	.xword	0x41edb0d79e68ea83
	.xword	0x3931561ddfe1bb8e
	.xword	0x3a2421c3360d50d7
	.xword	0x2aa43c7853ad6dbd
	.xword	0x53712c5636a43f71
	.xword	0x8e57a41d08eb93fb
	.xword	0xb694e3b47f8fd128
	.xword	0x4c334b2dbc5b4984
	.xword	0xf3f9ae4f68f44cbd
	.xword	0x85b37d87718d2a8c
	.xword	0xff18a4c53ff06c10
	.xword	0x3a6cf8d894a48306
	.xword	0x55de2290b0f774ca



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
	.xword	0x80360deebf02d25c
	.xword	0x4061db9cb30fb8f3
	.xword	0x4b48b7fc084bdd0e
	.xword	0xe09e0951c20e21eb
	.xword	0x717c73b720f0c070
	.xword	0x7e1e8e60bb690dba
	.xword	0x35a042b984ef12e5
	.xword	0xddf703a6968d769d
	.xword	0x07e32826a8f2f342
	.xword	0xe8501b393b4ff45f
	.xword	0x945066c69ffebf72
	.xword	0xcd2bac8589531ae6
	.xword	0x6bc17c5a66e029b4
	.xword	0x8dd9b0031030a2d8
	.xword	0x1f90b3bfd0a8dda5
	.xword	0x96cd8e486a76026d
	.xword	0xcdedebe17805c337
	.xword	0x1f0e407621f662e8
	.xword	0xbddcbe2fdc5b9bbd
	.xword	0x2ddbc5bb28fbbd26
	.xword	0x297d8a5a50c5e9b1
	.xword	0xb166d20432d7c959
	.xword	0x2dad8fc8e5777d37
	.xword	0x00c89397bec1b862
	.xword	0x5a48288a047a784b
	.xword	0x048ab6319ac54048
	.xword	0x6d6be3e5fc2053a5
	.xword	0x3474551aca12a5e7
	.xword	0x4b23905cb8678d43
	.xword	0x8f269afd1351bfc9
	.xword	0xad7ab66ed4a11db7
	.xword	0x8f75bfdd04ae42d2
	.xword	0x5ed4cede72f9ede0
	.xword	0xea2769a3b4efae2d
	.xword	0x14794376283427e7
	.xword	0x39a914737deee8ce
	.xword	0xb1d56fedf07fe161
	.xword	0xf0a81eac7fd22320
	.xword	0x21276c2feaa08ce9
	.xword	0xd1146c8a346772a8
	.xword	0xa5f3fa237b7fc7b4
	.xword	0xeb135def0a2bfa88
	.xword	0x3ac47374fed2743c
	.xword	0x241f8e33422bd2dc
	.xword	0xe9cc78dee6b5d952
	.xword	0x9e26a82ee520f371
	.xword	0x726d51dbb8447378
	.xword	0xe0dbd58f98d4ad57
	.xword	0x158b42fe7af150ac
	.xword	0x229a8ad767ee2a94
	.xword	0x098d2c51de27189b
	.xword	0xfc78334824e03897
	.xword	0x8c1dde4a8e81f977
	.xword	0x6d396503dcaa957a
	.xword	0xf2c354527e57c917
	.xword	0xc3598a5cd072c590
	.xword	0xe98e40c986664708
	.xword	0xe7e5067d0da826d1
	.xword	0x927abbcb35e3ed9e
	.xword	0x35793d5fcf4e8577
	.xword	0x1176f393d30f082a
	.xword	0x54cb4ad9048f742c
	.xword	0xb216e53ecafe8d21
	.xword	0xad4aaf40c7753936
	.xword	0x8008f6e6127d0d21
	.xword	0x3a973f4ec2c8ccf7
	.xword	0x20c6095f4335e682
	.xword	0x4f69814d1864cc23
	.xword	0x0f669f00d56a9506
	.xword	0x8bc8f1e1f431a7ee
	.xword	0x3a158c2075cd1da5
	.xword	0x238bd4400cc876fe
	.xword	0xde5ab8bfbbf83813
	.xword	0x8f1b7de134446535
	.xword	0x47e48cca9645cada
	.xword	0xab2555e8b4dc1bae
	.xword	0x17b5495a337ee730
	.xword	0xf4de396ac185c646
	.xword	0xae4d10914a9bf8b5
	.xword	0x5646487ac6162b12
	.xword	0x4e2cfda14a25ca04
	.xword	0xae4ad9c703674225
	.xword	0x76e724cc1fb67e8a
	.xword	0x97845f293e0f9375
	.xword	0x7ec2f34a164004fa
	.xword	0x88ea99b8b0622bb1
	.xword	0xaa485ca1839f2734
	.xword	0x9d3acdbf9fd45d9c
	.xword	0x54cc1bc9519a1329
	.xword	0xf84e7110cf46ec1d
	.xword	0x1717ba44dfbec007
	.xword	0xc671694aa4454468
	.xword	0x15932a199b873cdb
	.xword	0x41eeda6fb9c4378a
	.xword	0x19085ae665748559
	.xword	0x19bce4a5715e1823
	.xword	0x56dd5eb813c84240
	.xword	0xd29e674c33567fcb
	.xword	0x93986726c8c536d3
	.xword	0x85f99e2590528511
	.xword	0x4ddd01c9e96cdbe8
	.xword	0xf90c4286602c3d27
	.xword	0x8a09eef491813b58
	.xword	0x7050be12107a138c
	.xword	0x40cc0b58ab0f0628
	.xword	0xc17bd3735be3b0f7
	.xword	0xedba1ad64d14e9ce
	.xword	0x89d34b1054a04e8a
	.xword	0xf8e877cbbedafd17
	.xword	0xc9eea34688ef9c00
	.xword	0xf61e5123b19f0d17
	.xword	0x68850ff1ea16a037
	.xword	0x64521885a4da214d
	.xword	0x67b68ce5be69d928
	.xword	0xebf228e592cc7eba
	.xword	0xba70f57c0fd463aa
	.xword	0x16ddd30767c80efa
	.xword	0xc3a8636eb36dcd4b
	.xword	0x856a0da542920e29
	.xword	0xc5ac2e5b23535578
	.xword	0x14d737c602e2575d
	.xword	0x552f4b9fa081706e
	.xword	0x69a525eb190347b4
	.xword	0x8e54a9e4b1b31ef4
	.xword	0x484ff0bb0cc8d746
	.xword	0xda03122448db8bd5
	.xword	0xbdf3aea67b19862e
	.xword	0xe9be410ba827e09b
	.xword	0xd6b69f811ddf7972
	.xword	0x48156009b0281044
	.xword	0x751d9a4f03cc4ee2
	.xword	0xae6548a28a969e95
	.xword	0x3dd9e28ebc7bcc64
	.xword	0x9d9aa0bd8c3b8c51
	.xword	0x81f8820cbe5d7208
	.xword	0x2f18ae00bc8beb44
	.xword	0x0552e1d6c9d9546e
	.xword	0x1424e33a7b29dd62
	.xword	0x234e42d0c286f9f1
	.xword	0x685d3af159092aa7
	.xword	0xc57002ae096a8cd4
	.xword	0x50993c58255d343a
	.xword	0xf8196041a47e4f91
	.xword	0xa8db8abc9cb84cb5
	.xword	0x3a05edcd1da2e171
	.xword	0x3d8e4fc30a9d774a
	.xword	0x8741a5f6d5b7ffd0
	.xword	0xc80d3e58113fcf1d
	.xword	0xc5f2226e1da31623
	.xword	0xa8f322c96215c17d
	.xword	0xcc94e2e7fef26909
	.xword	0x359e5ccc26b21a51
	.xword	0xcbed258dd7b630bf
	.xword	0x1e915e33e36b9700
	.xword	0x4a9b6c0794cab8d5
	.xword	0x95ab8359fdec2d16
	.xword	0x7da291a35454f070
	.xword	0x17e06fbc45bab57b
	.xword	0x3092639435b58090
	.xword	0x3831f788a4cccb34
	.xword	0x3d18b4eaccbd872c
	.xword	0x0214a58873311b7c
	.xword	0x8b38f6c2853bfd8e
	.xword	0x043b8ab4e3c662f6
	.xword	0x96d4b84249c135f7
	.xword	0x1f27046a5e4089f1
	.xword	0x581bd00d96d7e2ad
	.xword	0x31eb0fe84bc26f21
	.xword	0xc29ef4bfb37fa07b
	.xword	0xbdadc17173f1d2bc
	.xword	0xe68b05807e766dab
	.xword	0xda3dc0ffd625139c
	.xword	0x72110cdd97f1f858
	.xword	0x0fa6d1daaf325448
	.xword	0x8308d7556c5fa987
	.xword	0xafc38288e474974e
	.xword	0xa33c74020fc04a6c
	.xword	0xe41e1fdff1b114a3
	.xword	0xd69ee44613b1b22f
	.xword	0x628ad7948c597bb6
	.xword	0xd15a8409bce9b900
	.xword	0x15b21b0ea2aef4ad
	.xword	0x23cd8665b6a734f1
	.xword	0xb6b5f9fb46a17af9
	.xword	0x672b215d6ee73b9e
	.xword	0xedb75a66446d0d83
	.xword	0x912f4ea54ea4e4c8
	.xword	0x2cb2cafbc690858d
	.xword	0xde9cf21486805af7
	.xword	0xcf1bb14f26cf6dc7
	.xword	0x4a3e06d90e28fa4c
	.xword	0x40aeb479f80d0d37
	.xword	0x95acba240830d8aa
	.xword	0x563388f0a2dc178f
	.xword	0x2210dd6496460b31
	.xword	0xa8859a59d3be8d1d
	.xword	0x4ffaf4c9eaeff5a3
	.xword	0x4ad06e064d0856ff
	.xword	0x9fed0047ce6a1e45
	.xword	0x64d8e87808878dea
	.xword	0x1063479db75c58a1
	.xword	0x60327f881309b444
	.xword	0x17c06a064f2d8678
	.xword	0xdb210456fe670343
	.xword	0xadfa41c3f7c82123
	.xword	0x42d6d7f69f957638
	.xword	0x49f712eeeb4c422c
	.xword	0x8c307dc6e85171f1
	.xword	0xbc406b4c1fc5fad4
	.xword	0xdbce09d0400ab4e4
	.xword	0xf3558cb453d474db
	.xword	0xa22d0cf3837872bc
	.xword	0x997bd1c388c97d02
	.xword	0x1327ead38ecc2e00
	.xword	0x0f3a2348890bf7dd
	.xword	0x9c6ca57eeef1b92d
	.xword	0x212ef299cdd874e0
	.xword	0x357bb31a85c200dc
	.xword	0xd8ba9ba28687d718
	.xword	0xbbe65ae7cd9caad0
	.xword	0x66e9c9e6898f6e63
	.xword	0x1e6125826a4b3b98
	.xword	0xe9db4ed554939632
	.xword	0x1dfabfe690fa86ca
	.xword	0xc5270a0b2efd170c
	.xword	0x6f118852a0f4b2ed
	.xword	0x13107992a858e5e9
	.xword	0xd740135f3b6ebfe4
	.xword	0x3b6bde566db26b63
	.xword	0x1a1b6db867bd170f
	.xword	0x0798e5537fb886c0
	.xword	0x1f8a1d87c550bfaf
	.xword	0xdaa6fdb13bb13f7c
	.xword	0x0fa3740871cda5f8
	.xword	0x7bb70de05d44e024
	.xword	0x8b69e95c43e8b214
	.xword	0x6cb08e924f42a204
	.xword	0x818c26cdb291973c
	.xword	0x4dc3550891f7a9cd
	.xword	0xf95e3f11c5d80f8e
	.xword	0x47f99c3990e3ef25
	.xword	0x5a3dcab8d8d1c277
	.xword	0xc487073520937a72
	.xword	0x59b5779314e7d171
	.xword	0xd5ba557aeffa1d3e
	.xword	0x4bbfe591d8693f57
	.xword	0x84f598e9223bcf97
	.xword	0x7f733efd57b6a30a
	.xword	0x6751c10c85214cf4
	.xword	0x8347958d80aa1a78
	.xword	0xd9b604e829d0cac3
	.xword	0xb40420aeaa62bc39
	.xword	0x487815578a6abc66
	.xword	0xe237b4fc0335d94f
	.xword	0xc978405dd51e3767
	.xword	0x4a6f6e3ff83119fb



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
	.xword	0x5caffa8d09834107
	.xword	0x24c2c40cfc45073b
	.xword	0xf82780cb244882b6
	.xword	0xeca3f101372d2cd6
	.xword	0x44f7a0995b1d9413
	.xword	0xa66ef831df99f2b6
	.xword	0x835db3cb096776f8
	.xword	0x954472785fc75fef
	.xword	0x31826707ac4aeaaf
	.xword	0xadf97cee667d1f79
	.xword	0x9664b196870a8435
	.xword	0xfa2b2838d56a35f9
	.xword	0x3784cd3579eec0b8
	.xword	0x8124385dafc37c28
	.xword	0x7aecd869c6007b54
	.xword	0xf32bbd9a0999d594
	.xword	0xc9fff0c9296a4742
	.xword	0xa5ff05de000f2ca0
	.xword	0x47ada757d9be4bfb
	.xword	0x1058a6d961c4adb6
	.xword	0x768f80501eeb8f17
	.xword	0xea1b844357f83850
	.xword	0xb61b4662072874e7
	.xword	0xaedde004d4c3b879
	.xword	0xe37e3ad1635727ca
	.xword	0xb6db6042fdcb6662
	.xword	0xcfe961ba5ab87dbf
	.xword	0xc3394f4b878afa19
	.xword	0x24cd3dc4b9d6eed7
	.xword	0x3bc4f2ca456fe354
	.xword	0x457aeeed06d5cf75
	.xword	0xac02756b196288d3
	.xword	0xfec6a6bf81e780d1
	.xword	0x1ad1faae9cc6d20c
	.xword	0x6c0885df6ddd8adb
	.xword	0xa671d050b1cdf8ab
	.xword	0xf301cd574036189c
	.xword	0x453d10a3cab75628
	.xword	0xe37b696146630578
	.xword	0x3c713b9805979180
	.xword	0x102beca55bc308b7
	.xword	0xdcf426b0c1f2fd85
	.xword	0x819115914ef3b904
	.xword	0x41671e076ae0ede2
	.xword	0x4f890a1e17ae18f8
	.xword	0x4ab03873c3afa544
	.xword	0x6617fd725af17291
	.xword	0xa46a0e859aa6db3f
	.xword	0x87bc0abd1108a84b
	.xword	0x5f76c0b450b9decd
	.xword	0xc033761a7249f353
	.xword	0x168a9a3db84d6dc1
	.xword	0x9ee4d26db9347899
	.xword	0xf32425b114ee941b
	.xword	0x32fc46fcb0178a20
	.xword	0xa9351297e3fd75a2
	.xword	0x1cff6735559b48be
	.xword	0xb4e5244bd6659301
	.xword	0x9484d6fcf2786db8
	.xword	0xc36ec19630cdf11e
	.xword	0xabf5b8170951a13d
	.xword	0x2bf04b883763c920
	.xword	0xcc41ecdb1d87d92d
	.xword	0x72fca242f48c4701
	.xword	0x5cc2bf0345504eeb
	.xword	0x465a6022f5575d4c
	.xword	0xf033a6a70f2413de
	.xword	0xff16da50879899fe
	.xword	0xcb6c4bdbfb0eed6f
	.xword	0xcf3051ece1af6b01
	.xword	0x0eb7b9789b759caf
	.xword	0x54cf0e884f1f9ab0
	.xword	0x1d5c205752605731
	.xword	0xce5423658563336a
	.xword	0x0b52e1b961a65b8d
	.xword	0x9d41c740df91c19b
	.xword	0xcab4e97351223361
	.xword	0xa5c8df26865be71f
	.xword	0x2c973734709f82c3
	.xword	0x0993c300ab94d4e7
	.xword	0x7533ebf823b83f91
	.xword	0x9c5f26cef3871c35
	.xword	0x56cb8ba09b15c815
	.xword	0x513c9bcb259a523b
	.xword	0xe5162de5a1d32c4a
	.xword	0x79de8e8c11e09578
	.xword	0xb982370424ed1918
	.xword	0xa5935f035fc6f227
	.xword	0x7003d2bd7752feaf
	.xword	0x08d964df2dbce617
	.xword	0xae312972164de982
	.xword	0x5260f820a13bb07b
	.xword	0x18e429359b25cd71
	.xword	0x2c21b5b5c1eca071
	.xword	0xc180b6d73f3e64bd
	.xword	0xdc593e160f16a134
	.xword	0x466d94693b7cf346
	.xword	0x8ca69cdbe77e0173
	.xword	0xa0ae6a6860fd6441
	.xword	0x2826cf0f3289179d
	.xword	0xbd14ee5f0ca0122c
	.xword	0x4b68c7e653ca82f1
	.xword	0x3ddc07c000f20e6d
	.xword	0xa96741ef906e9b0b
	.xword	0xc0cc37ef8ce58b8d
	.xword	0x244fd730720c0359
	.xword	0x58159beab93c8b96
	.xword	0xea5b9229b679e990
	.xword	0x977d2880d3e502f6
	.xword	0xe103edadf2c35888
	.xword	0x712695e2524e4101
	.xword	0xcb942e4ebcca8f65
	.xword	0x2637e5320eab68a8
	.xword	0x9bdff6213b10a2b1
	.xword	0xc0acc38f64ce5029
	.xword	0xedbcf5ad898dd889
	.xword	0xb3933eef476412fb
	.xword	0x65fe432c1a239429
	.xword	0x97934d225d87ac4e
	.xword	0xf3bc35f916a88ae8
	.xword	0xddc7a2ab8ba132f6
	.xword	0xaed86079c71bb1dd
	.xword	0x0b78dfc2ae6f5d1d
	.xword	0x67bbeca78b9135a4
	.xword	0x95d957a21baa53ba
	.xword	0x6c6f43a82f9e719e
	.xword	0x6eda0c0923c385fc
	.xword	0x39e14b0adaf33e90
	.xword	0x8bfa674fadc915eb
	.xword	0x74f19e4ad2a61888
	.xword	0x49b130ca76946f6d
	.xword	0xf9c640aee1770dce
	.xword	0x7d8e4e032b50bd64
	.xword	0x53817200cb7f8d7b
	.xword	0xf0131b496f21ba77
	.xword	0x04dbce17b6b13841
	.xword	0x7d93bb1e0d767779
	.xword	0x35b4ffb5eb38d640
	.xword	0xa4dda845a0f0944e
	.xword	0x5b6685a1a95c37dc
	.xword	0x10648161f3d9d6b8
	.xword	0xb4ca555b45efdf4e
	.xword	0x246028058f3bb3da
	.xword	0x8cc645fd08dc7411
	.xword	0x6a6f4ec4fff90a39
	.xword	0xfed4a97597a7d997
	.xword	0x8ca9bd721f6745e4
	.xword	0x34d36833d88b7c0f
	.xword	0x7e1661a35501c116
	.xword	0xa783ea1d06d77174
	.xword	0xbd35e0736650f685
	.xword	0x297b28d00c781408
	.xword	0x889a4a94724e7cf5
	.xword	0x8c82cd7cd121e46f
	.xword	0xf5161b2821fb11c3
	.xword	0xb61404697566a060
	.xword	0x695ddf9fbc41473f
	.xword	0xe55ac93bda8f1955
	.xword	0x9f4e728cb7a181cd
	.xword	0x2bff0b4b96784ecf
	.xword	0x1dd2f7e62eb7b14e
	.xword	0xa6b1a70df9acb935
	.xword	0x5c80ac451405d38a
	.xword	0x76d5f2eaaa6cc539
	.xword	0x2b7608177f918ba2
	.xword	0x2c3e0d0c36e812e5
	.xword	0x2220fc8cf71e5c4d
	.xword	0xd6b3974f2647b420
	.xword	0x7ca6e2050a4b141b
	.xword	0xb55306b7279fef04
	.xword	0x46a825501f5ce9bb
	.xword	0x5b49a3572e294fa2
	.xword	0x0659e3750deed8f7
	.xword	0x4fe81765571ecf20
	.xword	0xdf728a62a6465b99
	.xword	0x3ca53d0a4bb097c5
	.xword	0x694ca0cdf4131bff
	.xword	0x8e7a36ba317f54f8
	.xword	0x0de0fabf151c20e8
	.xword	0xf7c16fb8d57c8791
	.xword	0xbb3d8f239bb1fdd4
	.xword	0xe2da3fdc012119da
	.xword	0xe112bf080265ed46
	.xword	0xa7c6d73e15bdb367
	.xword	0x7de4fbf800ddb36f
	.xword	0xd116c813b9da675f
	.xword	0xf0651b9cebd0c7f3
	.xword	0x76a4c5bc30606b3e
	.xword	0x4ba0099eb5044d44
	.xword	0x32c9cf7703b08592
	.xword	0xabc86a887d1d732f
	.xword	0x4590b76a5b71892b
	.xword	0x0f153c30d7fec472
	.xword	0x55f4e2c83aff9c10
	.xword	0x177bc9cb305853f3
	.xword	0xf00d4234ce57b134
	.xword	0x8bc2c2e26bd97c94
	.xword	0x2894e64044674a19
	.xword	0x1a02a444952e5b3c
	.xword	0xd6ef5faad1a7b7ce
	.xword	0xb3d34fb89c09cf0b
	.xword	0x65424132d110e049
	.xword	0x0c371afe056df3fb
	.xword	0x4642f973b8476cf3
	.xword	0x72a54800cbf86428
	.xword	0x80c5279fc303c0e7
	.xword	0x0c96a67727f5b645
	.xword	0x94d9c58273c8f670
	.xword	0x63d43a2196cb3a23
	.xword	0xc3ffff145890528d
	.xword	0xafaa847ad6ff0ab6
	.xword	0x281d00b654b768b1
	.xword	0x0378325e76df99c9
	.xword	0x44d83a2d4973a1e1
	.xword	0x9ccd668b326d813a
	.xword	0xa4613a77db02a910
	.xword	0xe06a4718d36e4470
	.xword	0x9d887ba808eeb759
	.xword	0x846a08bc25f70e60
	.xword	0x68384373b13cfc96
	.xword	0xd654d4db8f296f23
	.xword	0x7ccceba967136333
	.xword	0x6cfecc5dc11bc01f
	.xword	0x2779b2f30ca1ff23
	.xword	0xfb2438fd524d4a60
	.xword	0x9d85f682e8a758d2
	.xword	0x3358e37d878bac3f
	.xword	0xa04d189b684c3210
	.xword	0x6d4b043d73c946c7
	.xword	0x673800d4e0484d39
	.xword	0x2a59ce7bdacdde55
	.xword	0x1fc5b6faba40643d
	.xword	0x2379f02441ee04be
	.xword	0x0cd223ca75d50ccf
	.xword	0x441487d84f613308
	.xword	0x30753e0b000458f6
	.xword	0xa56e1b1da45bf1f0
	.xword	0x059531916c66db84
	.xword	0xafa11ddc3a671b48
	.xword	0x47cd7ca06f2b3e4e
	.xword	0x52999306aef3da7e
	.xword	0x190eef51011a9dde
	.xword	0x7de58a2ed8b599ef
	.xword	0xbd3de3ba1ed379c7
	.xword	0x91d9099b3b01a344
	.xword	0x4351bf02f00ed2aa
	.xword	0x391d2362df336829
	.xword	0x9cc2a255fc6a5f8a
	.xword	0x2ac06c6298ef1487
	.xword	0x8d15f60b307003c9
	.xword	0x18b4bb490eb87512
	.xword	0x1375b26e663677ae
	.xword	0xb9c767b8614f49dc
	.xword	0x5f40def4621bf567
	.xword	0x24e35584a315331b
	.xword	0x9aa6e0cffc0d990f



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
	.xword	0x7ab7cd516267061b
	.xword	0xfb36dc1d4e32e980
	.xword	0xd09d9b86b7a95977
	.xword	0x967996b06d8bfc5e
	.xword	0xc4ac4517c5af8138
	.xword	0xbb4fb01ba32279bf
	.xword	0x940338d97eaddd9a
	.xword	0xe174a25c25bb9025
	.xword	0x9f7bfb385d46e781
	.xword	0x62c2819cd71ecb2b
	.xword	0x5d952711a01325a9
	.xword	0x6a45ae88d576e136
	.xword	0x3195c7205bac55a9
	.xword	0xa272f94fa500629c
	.xword	0x1d2db7b75959609f
	.xword	0xbdd6db83652f9042
	.xword	0x69eddffe3b3a6ce5
	.xword	0x6a275908a26427d0
	.xword	0xf8c2779cc8d171c5
	.xword	0x502d8ed2e72bb5ea
	.xword	0x15259ebc30994386
	.xword	0x1abd959d258d6aac
	.xword	0x6e4cfdd765ff7e3f
	.xword	0x8bb2734549e3fe4c
	.xword	0x4e62521cce8f4a10
	.xword	0xb1da981e39761ef2
	.xword	0x1b5151fa2325f6d0
	.xword	0xcb9e0acb5e7ad45d
	.xword	0x2d4ba858c6e5c231
	.xword	0xc06eff6f7dbe5364
	.xword	0x7ff45e16bd4b3e6a
	.xword	0x40dfbec3a5759e36
	.xword	0xb951e2ae367802ac
	.xword	0x2935cfcc746c33ad
	.xword	0x42a1ae27047dd0e4
	.xword	0xba69845cd370c542
	.xword	0xc60b9a988cea5933
	.xword	0x94e89cccfb442d06
	.xword	0x4665ab4b2563f3f1
	.xword	0xec9d4c0a2791030d
	.xword	0x3577effaf7dae7ad
	.xword	0x7fe4b6ab71f97a08
	.xword	0x5f72eefd2abc90ae
	.xword	0x99692f4b36fc8f15
	.xword	0xa1daa33c12c4eeab
	.xword	0x881cb0e4fab0022c
	.xword	0x5fd52c3ab96d3e3e
	.xword	0xf015dcce73f27201
	.xword	0x289d3ab80031ab9e
	.xword	0x4ba0805ada42a991
	.xword	0xf67a812be96355f5
	.xword	0xc19fea2012947f99
	.xword	0x5fa8620045b59093
	.xword	0xccf8e15c0f700f3c
	.xword	0xb1716a0505e64405
	.xword	0x64f1aafc7d6438e3
	.xword	0xa4c42713d38e5541
	.xword	0x08fe32ccd661bf0d
	.xword	0x27e0bda9af95b628
	.xword	0x9a2e129015d41060
	.xword	0x0be53c90e85d96fb
	.xword	0x8da6e1212a8ff340
	.xword	0xdf1a221a62160543
	.xword	0x61a38b26f83e0405
	.xword	0x4eca43bd6e2cacbd
	.xword	0x032dd445bf6572d2
	.xword	0xb12a5ea69756e38a
	.xword	0xd08a92200f94031b
	.xword	0x33d70492c3dd6452
	.xword	0x176f3e2f53f26ccd
	.xword	0x9b3377c68bc0d023
	.xword	0x53c52c257ebcb711
	.xword	0xa6a2068451f9167f
	.xword	0xc8b2b661cce9045d
	.xword	0xd34a3c0bcce0b9ea
	.xword	0x9a30194009c1fd05
	.xword	0xf8928b142c1de8bc
	.xword	0x9ad98678374fd5c6
	.xword	0x92704c9b469c295c
	.xword	0x3e394a8e5ae1b9a3
	.xword	0xd8520eb67501f2e8
	.xword	0xff9a2388bbe7c75c
	.xword	0x302be1e5392414d8
	.xword	0x00df28ac0aac8a88
	.xword	0x8dbf35183df86dbc
	.xword	0x09b8192d410390bb
	.xword	0x925567ed2a9d60b5
	.xword	0xf7817b291bd725b6
	.xword	0x30d07f5111fc70cc
	.xword	0x6d1e67ce94e5f87d
	.xword	0x1184b4f7099d7935
	.xword	0x100747008861db12
	.xword	0x91b0cdc7997fe535
	.xword	0x760c486149e8d3f2
	.xword	0x7cb5895a1abe94f3
	.xword	0x43f78e1e51148800
	.xword	0xafe449a36877e6c3
	.xword	0x8a74a5ee16fe8951
	.xword	0xf8d21b82f6e8e08c
	.xword	0xaa12ec9307db4bd9
	.xword	0x6df6f0ea516974d2
	.xword	0xd4ceb76d48f337d8
	.xword	0xa1fd7fde2c881760
	.xword	0xc5991505b2a0ef7b
	.xword	0x320c164ccd0837db
	.xword	0x17a34a280280e075
	.xword	0x70a4468013c20058
	.xword	0x1cb916186a47b7d9
	.xword	0xa1b3adf5d99ccf52
	.xword	0x98694366b3c893a9
	.xword	0xd0e3068b0aa9d53c
	.xword	0x7874d7d521d9876a
	.xword	0x902e50bff73d30c4
	.xword	0x6bba47ec32f5adaf
	.xword	0x6e58e2c24390af0e
	.xword	0x71c26402e0a0647d
	.xword	0x3df0d3bb3c8e1ccb
	.xword	0xc272cb2e29e76702
	.xword	0x9ea3559203a73cd7
	.xword	0xaef58f52d2cfe23a
	.xword	0xfb45df52f2116f22
	.xword	0x7a5db8545b18b9ba
	.xword	0x160d639a2cf643c1
	.xword	0x888fcb7eee681dd3
	.xword	0x87ef48935c91cbe2
	.xword	0x9e44f9255a8446ed
	.xword	0xe40e28a3b5604342
	.xword	0x2073add3d2099f3e
	.xword	0x38021b2872e10ff0
	.xword	0x35622b4d1aef608c
	.xword	0xf439f39ddeb59f8d
	.xword	0xd799ad544f9f40f3
	.xword	0x951d1a08c2cc5286
	.xword	0xe0600ca4652556e9
	.xword	0xdf0f5e29ed726f98
	.xword	0x514cbe59d8ce5519
	.xword	0xa86073ac92c83512
	.xword	0xd505eaeee95152eb
	.xword	0xe915f30d230bfdc7
	.xword	0xff514b35134a92df
	.xword	0x54c1cc1b288a85a0
	.xword	0xd0dd627183fea997
	.xword	0x233f60c99fe57d89
	.xword	0x08915a9ad873b433
	.xword	0xef1c1cd6956074a4
	.xword	0x8c5b3a8f6d9cfcc2
	.xword	0x68f6a020c11b49f1
	.xword	0xfd16584c640f7e28
	.xword	0x7c471fda8b877234
	.xword	0xf316aab5a96700be
	.xword	0xab575b8f9ad14aa2
	.xword	0x8d06cb45691f10bb
	.xword	0x4b0ab193e96a4505
	.xword	0xdec23aa4d19cc68b
	.xword	0xb387761f959ebe85
	.xword	0xc8199491672d8420
	.xword	0x7dd4de9a0ccbe628
	.xword	0x20fa0b897baa004e
	.xword	0xe0dd990a1fc4ef16
	.xword	0x3ef33833c8c483fa
	.xword	0x66e7f07b0e66e305
	.xword	0x220c0dd7e0f716b7
	.xword	0x7eff7a8c1de0de8d
	.xword	0x77f779cf74a399d3
	.xword	0xbe4d8c5c25ccd7fe
	.xword	0xa891651efdb040d5
	.xword	0x801044f730e0b33e
	.xword	0xf4a8685e79b88165
	.xword	0xc8aa63c26d46b0ff
	.xword	0x41b0afcf4a6c9db2
	.xword	0x92fef7aec8d25193
	.xword	0x73bd6f7f0f94057c
	.xword	0x13067a727dba3507
	.xword	0xcfebeabd2e0f8c34
	.xword	0xc858943be0085138
	.xword	0xfa5b56ca83116863
	.xword	0x98e265612f99867b
	.xword	0x970fa4003e85e745
	.xword	0x8c18237e3d216b77
	.xword	0xe068ab0a15a46967
	.xword	0x442f0550aeef0a6e
	.xword	0x32087230c20df8e9
	.xword	0x694bba84792cf890
	.xword	0x327142a6fe9d6637
	.xword	0xe32e0106e912a16e
	.xword	0xdad86201d0440914
	.xword	0x9c5498dc3b23ed4f
	.xword	0xfacd1c686961eed6
	.xword	0x4dde030edb2e434b
	.xword	0xc36a50bbebe13dbc
	.xword	0x962c06de54b992db
	.xword	0x48e3f3b40b2724f3
	.xword	0x444030ee5c762bb7
	.xword	0xcc7e052e41e57668
	.xword	0x73f6cc77389b4392
	.xword	0x810438ff6a4bcc6f
	.xword	0xff71588abb78ca99
	.xword	0xebfcbc00f9d79cc1
	.xword	0xd6058eac3c3df2d3
	.xword	0x79605adf05dd561a
	.xword	0x444870b9d79fa4b0
	.xword	0x2b55be3e32c2cf6e
	.xword	0xcfcfc85851a54808
	.xword	0xfc5359e5f3a777c7
	.xword	0x22334e19c776e6ed
	.xword	0x9bb0ae71ca71eee1
	.xword	0x8f9d879689efa4b3
	.xword	0x86f7d8e137a4c84b
	.xword	0x40caeac1c209454e
	.xword	0x5e6102d71ba462a5
	.xword	0x7973b99416c49107
	.xword	0x92e9dce3aedce153
	.xword	0xb30497ae1a84c4b4
	.xword	0x7d354dcf802e5707
	.xword	0x18ada297ae676788
	.xword	0x0b2baaae50f94eeb
	.xword	0x6f9b0c5bdc9bfea8
	.xword	0xffbb30c6c9956f67
	.xword	0xc9e94266883680cb
	.xword	0x14fed019ba0828d8
	.xword	0x48ce7d0a9cab6919
	.xword	0xb4eff3e4e41f5b5f
	.xword	0xfbb835f4837fb154
	.xword	0x3586848c15cce568
	.xword	0xf0bbede5ad0bd42f
	.xword	0x4044e383fb46c684
	.xword	0xffa0119fa605b00d
	.xword	0x6daba9f1c3f4ac65
	.xword	0xaaff1be3e9cc504e
	.xword	0x4464e8bcab1cb221
	.xword	0x808f92a5416523cb
	.xword	0x097adb8c56820cbe
	.xword	0xdf39e9a088e43ce2
	.xword	0x84c73c55d62626dd
	.xword	0x124f9f9f47cbced7
	.xword	0x09e44ae9500b0563
	.xword	0xc6f296671707bd4d
	.xword	0xfecdafcb986e7a34
	.xword	0x0cdb3bc6c9d940d9
	.xword	0xd17a15bb1e1991f6
	.xword	0xbdfe5b652d3ec37b
	.xword	0xca4087e9839170a4
	.xword	0xf9fb9a4ef7c7b05f
	.xword	0x2dd5fb777c54202b
	.xword	0x240b068b3186f892
	.xword	0x235b320fe03b4ee2
	.xword	0xa2e6e05cb381999c
	.xword	0x12b82c4272a584e2
	.xword	0x2156dec358f39af4
	.xword	0xe953a6f538fb43de
	.xword	0xea94d625bc1b429c
	.xword	0xf67712935c80a28c
	.xword	0x4aa9c8b24095a430
	.xword	0x7a09c344a6807760
	.xword	0x30af41f49e7b1534
	.xword	0x9c25e054e3619ce5



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
!!#   IJ_set_rvar ("diag.j", 99, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 102, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 103, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 104, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 108, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 117, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 126, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 127, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 130, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 141, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 153, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1111 0000 00rr r000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 166, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 176, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 186, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 196, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 206, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 216, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 227, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 235, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 243, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 244, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 245, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 246, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 249, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 250, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_file_group("diag.j", 254, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 255, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 258, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 260, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 261, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 262, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 264, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 266, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 267, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 269, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 270, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 271, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 272, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 274, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 275, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 278, th_M, 3, 1, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 280, th_M, "\tmov\t0, %%r8\n");
!!#   IJ_printf ("diag.j", 281, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 282, th_M, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 283, th_M, "\tsetx\t0x%016llrx, %%r1, %%r9\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 284, th_M, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 285, th_M, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 286, th_M, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 287, th_M, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
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
!!#   IJ_printf ("diag.j", 320, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 321, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 326,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 328,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 333,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 511, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr load #2 alu store #2 sjm4 sjm5
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# {
!!# 		IJ_generate ("diag.j", 518, th_M, $2);
!!# 		IJ_generate ("diag.j", 519, th_M, $3);
!!# 		IJ_generate ("diag.j", 520, th_M, $4);
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
!!#                    IJ_printf ("diag.j", 540, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 543, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 545, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 546, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 550, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 551, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 552, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 553, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 555, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 556, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 569, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 574, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 578, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 579, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 581, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 582, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 596, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 600, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 601, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 618, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 623, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 624, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 626, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 627, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 629, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 630, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 635, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 636, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 638, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 639, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 656, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 659, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 661, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 662, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 666, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 667, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 668, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 669, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 671, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 672, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 685, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 690, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 694, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 695, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 697, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 698, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 713, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 716, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 718, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 719, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 734, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 737, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 738, Rv_rand32);
!!#                          IJ_printf ("diag.j", 739, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 744, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 746, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 760, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 766, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 770, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 785, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 787, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 789, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 795, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 796, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 823, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 829, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 830, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 833, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 835, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 844, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 846, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 864, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 870, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 875, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 877, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 895, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 898, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 900, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 901, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 904, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 905, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 906, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 907, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 909, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 910, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 923, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 928, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 932, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 933, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 935, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 936, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 950, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 954, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 955, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 972, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 977, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 978, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 980, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 981, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 983, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 984, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 989, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 990, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 992, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 993, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1010, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1013, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1015, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1016, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1020, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1021, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1022, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1023, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1025, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1026, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1039, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1044, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1048, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1049, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1051, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1052, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1068, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1071, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1073, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1074, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1089, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1092, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1093, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1094, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1099, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1101, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1115, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1121, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1125, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1140, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1142, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1144, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1150, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1151, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1178, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1184, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1185, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1188, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1190, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1199, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1201, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1219, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1225, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1230, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1232, sjm_5, "\n");
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
!!#                       IJ_printf ("diag.j", 1275, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
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
