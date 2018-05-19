// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas_rand_0.s
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
   random seed:	829628194
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

	setx 0xf41ba250248462dc, %g1, %g0
	setx 0xd1500ec2cb1a4491, %g1, %g1
	setx 0xde809087c58f47d1, %g1, %g2
	setx 0xd1ebf87a08c87588, %g1, %g3
	setx 0xecd7f94b4b4382f8, %g1, %g4
	setx 0xa4aa9170a55be120, %g1, %g5
	setx 0x41ea0854f8d00d36, %g1, %g6
	setx 0x08fb026a3e2fb03d, %g1, %g7
	setx 0x4c15890009c4cb1b, %g1, %r16
	setx 0x826dc20b1c86e260, %g1, %r17
	setx 0x2a1916fadd863afa, %g1, %r18
	setx 0xefc4c1cbcb500cc7, %g1, %r19
	setx 0xc2a89a30eb34a00c, %g1, %r20
	setx 0x6a4ffa682e7d5bfd, %g1, %r21
	setx 0xd0d82b4ea62bd334, %g1, %r22
	setx 0xc38efaaef7dafdc0, %g1, %r23
	setx 0xe62206e0cc9a0865, %g1, %r24
	setx 0xdb80f385ba050472, %g1, %r25
	setx 0x354b1e39a47d0d90, %g1, %r26
	setx 0x49b26171815155ba, %g1, %r27
	setx 0xa34914f7bc3a1ba2, %g1, %r28
	setx 0x565ce699115d23b4, %g1, %r29
	setx 0x8724d7f5f545f394, %g1, %r30
	setx 0x1df7e9a0f498e228, %g1, %r31
	save
	setx 0x842c010f47aba1da, %g1, %r16
	setx 0x10875343b14adda8, %g1, %r17
	setx 0x5e63743c58a3b606, %g1, %r18
	setx 0xa64bf0a5c20cac0a, %g1, %r19
	setx 0x26c850bb525ef5a0, %g1, %r20
	setx 0xc183a2d59dc7e83f, %g1, %r21
	setx 0xa6a34522da6c2301, %g1, %r22
	setx 0xc6f471717934d1c4, %g1, %r23
	setx 0x10e6eb1520c0d812, %g1, %r24
	setx 0x3636e45710029f73, %g1, %r25
	setx 0x8565f877317997c4, %g1, %r26
	setx 0x6bee052ab9bcc82b, %g1, %r27
	setx 0xf363b852562f24fe, %g1, %r28
	setx 0x1001c058ed31dfa3, %g1, %r29
	setx 0x1737cbe50c965f3c, %g1, %r30
	setx 0xa9488275290807fc, %g1, %r31
	save
	setx 0x2c9ce82f7a8af914, %g1, %r16
	setx 0x869b1841895873a3, %g1, %r17
	setx 0xce069a5673e0eb37, %g1, %r18
	setx 0xa7d16f54069b6be6, %g1, %r19
	setx 0x8c7cc4411f9866a3, %g1, %r20
	setx 0x6b975db5e12d32ed, %g1, %r21
	setx 0xa42c5c65efc05c5d, %g1, %r22
	setx 0x7b34db1cc0ee90f5, %g1, %r23
	setx 0xc5868dee7e1e7ebf, %g1, %r24
	setx 0xdcf637bd2b46e4a6, %g1, %r25
	setx 0x868c73930d0d6853, %g1, %r26
	setx 0x40870285cf2b6c16, %g1, %r27
	setx 0x6c11e89f647d29a0, %g1, %r28
	setx 0x15ac13ab52383059, %g1, %r29
	setx 0x19de5ccb63a644a8, %g1, %r30
	setx 0xcb6bfd275186c689, %g1, %r31
	restore
	mov	0, %r8
	setx	0x00000080379a3ae8, %r1, %r6
	setx	0x00000000d01ef038, %r1, %r7
	setx	0x000000800f108c50, %r1, %r9
	setx	0x000000cb4b535398, %r1, %r10
	setx	0x000000dd37dd22d0, %r1, %r11
	setx	0x000000ea8b8e8790, %r1, %r12
	setx	0x000000fcd39bba50, %r1, %r13
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe009a000  ! 1: LDUB_I	ldub	[%r6 + 0x0000], %r16
	.word 0xe0418008  ! 1: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa489a010  ! 2: ANDcc_I	andcc 	%r6, 0x0010, %r18
	.word 0xe8398008  ! 3: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe029a010  ! 3: STB_I	stb	%r16, [%r6 + 0x0010]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xec49a010  ! 7: LDSB_I	ldsb	[%r6 + 0x0010], %r22
	.word 0xe049a010  ! 7: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xaa81a038  ! 8: ADDcc_I	addcc 	%r6, 0x0038, %r21
	.word 0xe0718008  ! 9: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe8318008  ! 9: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe859a038  ! 13: LDX_I	ldx	[%r6 + 0x0038], %r20
	.word 0xe4018008  ! 13: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xae21a008  ! 14: SUB_I	sub 	%r6, 0x0008, %r23
	.word 0xec39a008  ! 15: STD_I	std	%r22, [%r6 + 0x0008]
	.word 0xec318008  ! 15: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0518008  ! 19: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe0518008  ! 19: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa801a030  ! 20: ADD_I	add 	%r6, 0x0030, %r20
	.word 0xe031a030  ! 21: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe829a030  ! 21: STB_I	stb	%r20, [%r6 + 0x0030]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe409a030  ! 25: LDUB_I	ldub	[%r6 + 0x0030], %r18
	.word 0xe0098008  ! 25: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xae098008  ! 26: AND_R	and 	%r6, %r8, %r23
	.word 0xe0298008  ! 27: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe0318008  ! 27: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe001a030  ! 31: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xe8498008  ! 31: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xacb98008  ! 32: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xec398008  ! 33: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe431a030  ! 33: STH_I	sth	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe411a030  ! 37: LDUH_I	lduh	[%r6 + 0x0030], %r18
	.word 0xe801a030  ! 37: LDUW_I	lduw	[%r6 + 0x0030], %r20
	.word 0xaa21a038  ! 38: SUB_I	sub 	%r6, 0x0038, %r21
	.word 0xe829a038  ! 39: STB_I	stb	%r20, [%r6 + 0x0038]
	.word 0xe431a038  ! 39: STH_I	sth	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe451a038  ! 43: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	.word 0xe0518008  ! 43: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa0b9a038  ! 44: XNORcc_I	xnorcc 	%r6, 0x0038, %r16
	.word 0xe829a038  ! 45: STB_I	stb	%r20, [%r6 + 0x0038]
	.word 0xec29a038  ! 45: STB_I	stb	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xec41a038  ! 49: LDSW_I	ldsw	[%r6 + 0x0038], %r22
	.word 0xe811a038  ! 49: LDUH_I	lduh	[%r6 + 0x0038], %r20
	.word 0xa0318008  ! 50: ORN_R	orn 	%r6, %r8, %r16
	.word 0xe0398008  ! 51: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4298008  ! 51: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0418008  ! 55: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe4498008  ! 55: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xa2418008  ! 56: ADDC_R	addc 	%r6, %r8, %r17
	.word 0xe0318008  ! 57: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe429a038  ! 57: STB_I	stb	%r18, [%r6 + 0x0038]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe051a038  ! 61: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xe4498008  ! 61: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xacb98008  ! 62: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe821a038  ! 63: STW_I	stw	%r20, [%r6 + 0x0038]
	.word 0xec298008  ! 63: STB_R	stb	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe449a038  ! 67: LDSB_I	ldsb	[%r6 + 0x0038], %r18
	.word 0xe051a038  ! 67: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xaa09a038  ! 68: AND_I	and 	%r6, 0x0038, %r21
	.word 0xe871a038  ! 69: STX_I	stx	%r20, [%r6 + 0x0038]
	.word 0xe839a038  ! 69: STD_I	std	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe0598008  ! 73: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe8018008  ! 73: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xaaa9a028  ! 74: ANDNcc_I	andncc 	%r6, 0x0028, %r21
	.word 0xec718008  ! 75: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe021a028  ! 75: STW_I	stw	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0498008  ! 79: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe411a028  ! 79: LDUH_I	lduh	[%r6 + 0x0028], %r18
	.word 0xa6398008  ! 80: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xec318008  ! 81: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe0318008  ! 81: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe849a028  ! 85: LDSB_I	ldsb	[%r6 + 0x0028], %r20
	.word 0xe001a028  ! 85: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xa031a010  ! 86: SUBC_I	orn 	%r6, 0x0010, %r16
	.word 0xe4398008  ! 87: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe421a010  ! 87: STW_I	stw	%r18, [%r6 + 0x0010]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4418008  ! 91: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe8118008  ! 91: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xaa11a030  ! 92: OR_I	or 	%r6, 0x0030, %r21
	.word 0xe4218008  ! 93: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe429a030  ! 93: STB_I	stb	%r18, [%r6 + 0x0030]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0018008  ! 97: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe4518008  ! 97: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xa6898008  ! 98: ANDcc_R	andcc 	%r6, %r8, %r19
	.word 0xe0718008  ! 99: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4298008  ! 99: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe009a030  ! 103: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xe4018008  ! 103: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xac318008  ! 104: SUBC_R	orn 	%r6, %r8, %r22
	.word 0xe839a030  ! 105: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe8718008  ! 105: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe0518008  ! 109: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe811a030  ! 109: LDUH_I	lduh	[%r6 + 0x0030], %r20
	.word 0xaa418008  ! 110: ADDC_R	addc 	%r6, %r8, %r21
	.word 0xe021a030  ! 111: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xec218008  ! 111: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe8498008  ! 115: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xec41a030  ! 115: LDSW_I	ldsw	[%r6 + 0x0030], %r22
	.word 0xa441a038  ! 116: ADDC_I	addc 	%r6, 0x0038, %r18
	.word 0xe0318008  ! 117: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec218008  ! 117: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe059a038  ! 121: LDX_I	ldx	[%r6 + 0x0038], %r16
	.word 0xe009a038  ! 121: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xa6218008  ! 122: SUB_R	sub 	%r6, %r8, %r19
	.word 0xe8398008  ! 123: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe071a038  ! 123: STX_I	stx	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe001a038  ! 127: LDUW_I	lduw	[%r6 + 0x0038], %r16
	.word 0xe059a038  ! 127: LDX_I	ldx	[%r6 + 0x0038], %r16
	.word 0xa2818008  ! 128: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe071a038  ! 129: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe4218008  ! 129: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xe4418008  ! 133: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe8198008  ! 133: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xa4a9a030  ! 134: ANDNcc_I	andncc 	%r6, 0x0030, %r18
	.word 0xe0318008  ! 135: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xec398008  ! 135: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe4498008  ! 139: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe8498008  ! 139: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa4018008  ! 140: ADD_R	add 	%r6, %r8, %r18
	.word 0xe8218008  ! 141: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe031a030  ! 141: STH_I	sth	%r16, [%r6 + 0x0030]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe009a030  ! 145: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xe051a030  ! 145: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	.word 0xa821a008  ! 146: SUB_I	sub 	%r6, 0x0008, %r20
	.word 0xe029a008  ! 147: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe4318008  ! 147: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec11a008  ! 151: LDUH_I	lduh	[%r6 + 0x0008], %r22
	.word 0xe059a008  ! 151: LDX_I	ldx	[%r6 + 0x0008], %r16
	.word 0xaeb18008  ! 152: SUBCcc_R	orncc 	%r6, %r8, %r23
	.word 0xec718008  ! 153: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe8318008  ! 153: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe019a008  ! 157: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xe0098008  ! 157: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa0a1a028  ! 158: SUBcc_I	subcc 	%r6, 0x0028, %r16
	.word 0xe831a028  ! 159: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe039a028  ! 159: STD_I	std	%r16, [%r6 + 0x0028]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0198008  ! 163: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe0418008  ! 163: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xa6b18008  ! 164: SUBCcc_R	orncc 	%r6, %r8, %r19
	.word 0xe8398008  ! 165: STD_R	std	%r20, [%r6 + %r8]
	.word 0xec318008  ! 165: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe0418008  ! 169: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe0198008  ! 169: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xae31a038  ! 170: ORN_I	orn 	%r6, 0x0038, %r23
	.word 0xe4218008  ! 171: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe0218008  ! 171: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xec59a038  ! 175: LDX_I	ldx	[%r6 + 0x0038], %r22
	.word 0xe809a038  ! 175: LDUB_I	ldub	[%r6 + 0x0038], %r20
	.word 0xac11a030  ! 176: OR_I	or 	%r6, 0x0030, %r22
	.word 0xe021a030  ! 177: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xec398008  ! 177: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe849a030  ! 181: LDSB_I	ldsb	[%r6 + 0x0030], %r20
	.word 0xe841a030  ! 181: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xac29a030  ! 182: ANDN_I	andn 	%r6, 0x0030, %r22
	.word 0xe071a030  ! 183: STX_I	stx	%r16, [%r6 + 0x0030]
	.word 0xe0218008  ! 183: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xe849a030  ! 187: LDSB_I	ldsb	[%r6 + 0x0030], %r20
	.word 0xe0198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa2298008  ! 188: ANDN_R	andn 	%r6, %r8, %r17
	.word 0xe0218008  ! 189: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0298008  ! 189: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef018, %r1, %r6
	.word 0xec49a030  ! 193: LDSB_I	ldsb	[%r6 + 0x0030], %r22
	.word 0xe0598008  ! 193: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xae29a038  ! 194: ANDN_I	andn 	%r6, 0x0038, %r23
	.word 0xe0298008  ! 195: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe4298008  ! 195: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe8198008  ! 199: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe009a038  ! 199: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xae418008  ! 200: ADDC_R	addc 	%r6, %r8, %r23
	.word 0xec298008  ! 201: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe0218008  ! 201: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4198008  ! 205: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe0598008  ! 205: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xaa19a000  ! 206: XOR_I	xor 	%r6, 0x0000, %r21
	.word 0xe8718008  ! 207: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xec31a000  ! 207: STH_I	sth	%r22, [%r6 + 0x0000]
	setx	0x00000000d01ef038, %r1, %r6
	.word 0xe049a000  ! 211: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	.word 0xec49a000  ! 211: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xa8198008  ! 212: XOR_R	xor 	%r6, %r8, %r20
	.word 0xe821a000  ! 213: STW_I	stw	%r20, [%r6 + 0x0000]
	.word 0xe0318008  ! 213: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe0498008  ! 217: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe8018008  ! 217: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xa4a18008  ! 218: SUBcc_R	subcc 	%r6, %r8, %r18
	.word 0xe8218008  ! 219: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe429a000  ! 219: STB_I	stb	%r18, [%r6 + 0x0000]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec598008  ! 223: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xec018008  ! 223: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa4198008  ! 224: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe831a000  ! 225: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xe031a000  ! 225: STH_I	sth	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ef030, %r1, %r6
	.word 0xec19a000  ! 229: LDD_I	ldd	[%r6 + 0x0000], %r22
	.word 0xe4418008  ! 229: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa6a9a038  ! 230: ANDNcc_I	andncc 	%r6, 0x0038, %r19
	.word 0xec31a038  ! 231: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xec31a038  ! 231: STH_I	sth	%r22, [%r6 + 0x0038]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe009a038  ! 235: LDUB_I	ldub	[%r6 + 0x0038], %r16
	.word 0xe841a038  ! 235: LDSW_I	ldsw	[%r6 + 0x0038], %r20
	.word 0xae39a038  ! 236: XNOR_I	xnor 	%r6, 0x0038, %r23
	.word 0xe8218008  ! 237: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe871a038  ! 237: STX_I	stx	%r20, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xec19a038  ! 241: LDD_I	ldd	[%r6 + 0x0038], %r22
	.word 0xe0098008  ! 241: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa0098008  ! 242: AND_R	and 	%r6, %r8, %r16
	.word 0xec318008  ! 243: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe029a038  ! 243: STB_I	stb	%r16, [%r6 + 0x0038]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe859a038  ! 247: LDX_I	ldx	[%r6 + 0x0038], %r20
	.word 0xe051a038  ! 247: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xa2c18008  ! 248: ADDCcc_R	addccc 	%r6, %r8, %r17
	.word 0xec71a038  ! 249: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xe0318008  ! 249: STH_R	sth	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe0518008  ! 253: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe051a038  ! 253: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	.word 0xa811a020  ! 254: OR_I	or 	%r6, 0x0020, %r20
	.word 0xe039a020  ! 255: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe421a020  ! 255: STW_I	stw	%r18, [%r6 + 0x0020]
	setx	0x00000000d01ef020, %r1, %r6
	.word 0xe049a020  ! 259: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xe859a020  ! 259: LDX_I	ldx	[%r6 + 0x0020], %r20
	.word 0xa0b98008  ! 260: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xec718008  ! 261: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe0298008  ! 261: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x00000000d01ef000, %r1, %r6
	.word 0xe0598008  ! 265: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xec118008  ! 265: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xac418008  ! 266: ADDC_R	addc 	%r6, %r8, %r22
	.word 0xec39a020  ! 267: STD_I	std	%r22, [%r6 + 0x0020]
	.word 0xe0218008  ! 267: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4518008  ! 271: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe8598008  ! 271: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xaa21a028  ! 272: SUB_I	sub 	%r6, 0x0028, %r21
	.word 0xec398008  ! 273: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe4298008  ! 273: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x00000000d01ef008, %r1, %r6
	.word 0xe4498008  ! 277: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe0018008  ! 277: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa2c1a020  ! 278: ADDCcc_I	addccc 	%r6, 0x0020, %r17
	.word 0xe871a020  ! 279: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xe021a020  ! 279: STW_I	stw	%r16, [%r6 + 0x0020]
	setx	0x00000000d01ef028, %r1, %r6
	.word 0xe049a020  ! 283: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	.word 0xec118008  ! 283: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xacb18008  ! 284: ORNcc_R	orncc 	%r6, %r8, %r22
	.word 0xe8218008  ! 285: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec318008  ! 285: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x00000000d01ef010, %r1, %r6
	.word 0xe4018008  ! 289: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe0518008  ! 289: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa4098008  ! 290: AND_R	and 	%r6, %r8, %r18
	.word 0xe839a020  ! 291: STD_I	std	%r20, [%r6 + 0x0020]
	.word 0xe031a020  ! 291: STH_I	sth	%r16, [%r6 + 0x0020]
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
	.xword	0x9b09c5ed23d6aede
	.xword	0x8de651ca4d931d78
	.xword	0xb10453ad84e3680f
	.xword	0x34a68efe86bc5db2
	.xword	0x5e17a0ec0e5a8280
	.xword	0xcfdcf6805fcb416f
	.xword	0xda63d0b15ec1448d
	.xword	0xc966805e11c4f54a
	.xword	0xb6e9a90d31773a50
	.xword	0xb90dcd405f73a997
	.xword	0x5c016d02df840b97
	.xword	0x6a4d6dd3ac837f6a
	.xword	0x6d009b2f7bf51378
	.xword	0xb8cab91296c76e03
	.xword	0x172baa71417e0df3
	.xword	0x672b9dab669e8f0c
	.xword	0xc02c30ad3a04f4a2
	.xword	0x0fd5bf22d3e36f19
	.xword	0xdbcda429b2393765
	.xword	0xbc325f615793df7d
	.xword	0x2756effc604f4458
	.xword	0xeef576360c5a088a
	.xword	0x01a1f6f721556fae
	.xword	0x1c398bc05fe16986
	.xword	0x395b2fceb173ee29
	.xword	0x7995ef8de99f38c9
	.xword	0x1fe60d8456773805
	.xword	0x4b2569133eb3bc62
	.xword	0x685c706280725edf
	.xword	0x22e9bb575e1b33fe
	.xword	0xfba0234ceb5eae23
	.xword	0xcc031d5d692d05ea
	.xword	0xa2bb869d8b13f690
	.xword	0xc5efacf3be36ffbe
	.xword	0x2360ea18fde09115
	.xword	0xd6cb6901dea663ef
	.xword	0x102d2b17e39770e5
	.xword	0x97a4434cbeeebf3f
	.xword	0xf29fec83a2c5b730
	.xword	0x74db806cf3f2bf4b
	.xword	0x51619cedad64ee8b
	.xword	0x83267e254a5cd8ff
	.xword	0x1e35e67a4e4d5c43
	.xword	0xd8bd048829f361e8
	.xword	0x278368d2b5d633fd
	.xword	0xe89ebb7bb188ff39
	.xword	0xa4e0c0a5ce01b426
	.xword	0x618073165f6f282a
	.xword	0x6839d7ae2b70ead6
	.xword	0x35da03645c2b8785
	.xword	0x5c53130585a3c091
	.xword	0x83361672c133c6d9
	.xword	0x31b36f725768f954
	.xword	0x863e00b371400415
	.xword	0x29f10971639b3b80
	.xword	0xd59414fbdfa64793
	.xword	0xf09862b7f44c8863
	.xword	0xcebc8d1121ea6c77
	.xword	0x9c091557566e7a33
	.xword	0xa0ead0defb31bf3d
	.xword	0xf77be5cb07fae7e5
	.xword	0x3e769860745b42e2
	.xword	0x18113c0d4a16a8b4
	.xword	0xcd8215e2e17b9705
	.xword	0x889ddb63d9a6df5e
	.xword	0x486d9ee0e6f00351
	.xword	0x016b67302afa5aa0
	.xword	0x3a06e0d4790bee88
	.xword	0x39e9972c504173e4
	.xword	0x091c2d7298bab38e
	.xword	0xd624301209f2ce51
	.xword	0x2e9b1e011a2c992d
	.xword	0x474a27d5e68dad8d
	.xword	0x1dd9eac0da1ec007
	.xword	0x28c54716f97521a1
	.xword	0xf71a026ea537bfc1
	.xword	0x7b6860a66eb1970c
	.xword	0xc48f365a29742f4f
	.xword	0x29beb6a06f07fde3
	.xword	0xc1d73f020a6630c9
	.xword	0xf9402c4d2fb29004
	.xword	0x45ec75ed5ddad55c
	.xword	0xb76a5cc663187cfe
	.xword	0xd36316f12e2623a1
	.xword	0xc95004010e273ee2
	.xword	0xfc242560d997b381
	.xword	0x5fe9d79cf075d1a3
	.xword	0xd8fe4a1a1e314d1d
	.xword	0x05fc10a15b073a91
	.xword	0xfed1eac154152916
	.xword	0x0840822eaf999b61
	.xword	0xe4cf2cf6d11812d3
	.xword	0x95f8432da4d3062d
	.xword	0x5f46032a2237e1f9
	.xword	0xa99887c589022291
	.xword	0xbcdc574039e7394f
	.xword	0xccf02d7d286b41c2
	.xword	0x6e2abcb68fcb943b
	.xword	0x81ff767e894ee292
	.xword	0xb50a6bd4fe417ff1
	.xword	0xa186a2a57ecdeed7
	.xword	0xc5c0f75704db1b32
	.xword	0x2e32f4f2670e0954
	.xword	0x2cb867b48df27b04
	.xword	0x1caa2148b603e9da
	.xword	0xaa71222e090b5d8c
	.xword	0x6db9c34f6a6d427f
	.xword	0x9d73426541eab6e6
	.xword	0x5fb846a9b92c9f99
	.xword	0x0bd823a2581f178e
	.xword	0x457a09b791b8b289
	.xword	0x088d79e39b93d629
	.xword	0x49bd01730e65ec44
	.xword	0xd2f5c26a30f7d1d3
	.xword	0x16fa989c87cdd73c
	.xword	0x6a5aff547a41365d
	.xword	0x2e1f7faa779800e6
	.xword	0xb500a3f1fd25d415
	.xword	0x5c6f1b2f6eb2b018
	.xword	0x7c1ae8854d918c42
	.xword	0x7764142f2248f1b0
	.xword	0x3007591ebe2b54e0
	.xword	0x75c2fcefe91367cd
	.xword	0x7ff36aee73e4f5da
	.xword	0x20e770ea16456ed4
	.xword	0xabba8efa2be3fd34
	.xword	0x406a23e148577cfc
	.xword	0xd4b3542fcf8af7e7
	.xword	0x90adbeb35e5ed52d
	.xword	0x486fd8ff409763ec
	.xword	0x43f03a657be8a202
	.xword	0x5353848ce02d8e9d
	.xword	0xbec81982cef28cfd
	.xword	0x66947224055986d3
	.xword	0xe4ff66943d7703a0
	.xword	0x6a0e8877ecdf6a0b
	.xword	0x5d4378d27fb7a827
	.xword	0x4b8bd814f348a106
	.xword	0xcd25561a60738841
	.xword	0xaf66574279453c3a
	.xword	0xeb1e3c7b28dd912d
	.xword	0x208480efa8044c43
	.xword	0xba6acede916e37b8
	.xword	0xe831cdc78da90286
	.xword	0xf81fbb66d071d0a1
	.xword	0xe3eba889164c4b88
	.xword	0x42791a500da6ff7b
	.xword	0x28ea7b27e28efb62
	.xword	0x3f48128466b8147c
	.xword	0x2131fb358430608e
	.xword	0x393c7f4fb56deda3
	.xword	0x44ea10983c090010
	.xword	0x4a8d99c70febf2a8
	.xword	0xaa6ff9ac64d4bd70
	.xword	0x888d306c4418b165
	.xword	0xfc1a1956102e21f9
	.xword	0xd2f918ab65c44552
	.xword	0x954f96809b793369
	.xword	0x39ae8f0aad22d3fa
	.xword	0xc010d1a24f259cfb
	.xword	0xb6c1ed9bcad6da9e
	.xword	0x8afd7d4a2d308217
	.xword	0x113639ff2c498ef5
	.xword	0x41aadf67b0e4320b
	.xword	0x5b9db382b854d6b9
	.xword	0xd81fbbbb2fea866e
	.xword	0xd90eaf0f62e3df28
	.xword	0x2345eb910f1923b4
	.xword	0xf3e8f601579fb78d
	.xword	0x59c15231583f3238
	.xword	0x4eb01dd3d93bbc90
	.xword	0x4b3485ffd008d386
	.xword	0x04871c85a1fc5440
	.xword	0x6524cace9cd38e81
	.xword	0x5d90602de57f93df
	.xword	0xcdb06eeb72485177
	.xword	0x6577e5e9f2e7a6cc
	.xword	0x35dd5e3cdcd84dae
	.xword	0xba707f79cde147ff
	.xword	0xa94bd471db38142b
	.xword	0x094cbe1766578df0
	.xword	0xd8d813e022e320ed
	.xword	0x30045109db15c36d
	.xword	0x52c743bd4d47f965
	.xword	0x47526dd07bbdaacf
	.xword	0xe86bdf37f9ec3a4c
	.xword	0x0500485fe1d2c3c4
	.xword	0x0093ec7618bfd502
	.xword	0xcc3a701e5774959f
	.xword	0xd686a3106bc5970b
	.xword	0xb7b726b7ee5595e2
	.xword	0xfe0a474f8766adbe
	.xword	0x7a44672170090adc
	.xword	0x7169a137f2d29d9e
	.xword	0x71f36adb8331a9f5
	.xword	0x0b1e7b4a5985af9c
	.xword	0x9dc0046cf4d63ae9
	.xword	0x064045332e625d93
	.xword	0xda4772952a4e136b
	.xword	0xa7c39175a235db39
	.xword	0x3f98fb8ffa0d5cfd
	.xword	0x86ad3946fcc6fa5f
	.xword	0x54e50e12cb764158
	.xword	0x6cdaf4de4cbb37b1
	.xword	0xea49272bbd2d64c9
	.xword	0xafea38d3ca8fd913
	.xword	0xa861ee705c27e86c
	.xword	0x91cbf9c31a661c5a
	.xword	0xd4a7d48c4181e25f
	.xword	0xa59df2d5b1f62455
	.xword	0xce31cfbf258a2114
	.xword	0x8cd543e36667e7d1
	.xword	0xfb3e58a24dad3675
	.xword	0x0b94215e81dd2eb6
	.xword	0xad91ef4d59153522
	.xword	0x739bab478e02cdd5
	.xword	0x10ec0b1bf3739bad
	.xword	0x9fcc6bde534a05b7
	.xword	0x47a65bd23c3d8237
	.xword	0x79d2960037d68dc4
	.xword	0xb4957384507cc101
	.xword	0xd6d493b251e81615
	.xword	0x4f10a1906f9db69e
	.xword	0x9e6986b0f74c8eb0
	.xword	0xfae5f64bf7c3eed9
	.xword	0x00d19f63c95af80a
	.xword	0x4a85be16c7ec2814
	.xword	0x434f4a434e6e89bf
	.xword	0x21e87481e6830b82
	.xword	0xea67cbb08c31b199
	.xword	0xdcca5f10c3df0409
	.xword	0x4d6c4985b04079d4
	.xword	0x619944a446613d80
	.xword	0x2fcc698b71143c1a
	.xword	0xb18a1193ecc7abee
	.xword	0x7ca1b69bbe4df17f
	.xword	0xba4a251211cd4e42
	.xword	0x7f2d4b60db37d204
	.xword	0x38765acd8359863f
	.xword	0x0ab66d05e799da2f
	.xword	0xa9f781601ad0a315
	.xword	0x74f0f42576266dd6
	.xword	0xe5bc537099b2ef83
	.xword	0xe345cb1691d36769
	.xword	0x4d8a5454e57b65b8
	.xword	0x4a5d9c0d9baa668d
	.xword	0x2836983d4229af18
	.xword	0x89e3979e588df5c1
	.xword	0x7d26b44296ff5547
	.xword	0x9ceb63caae2bb52d
	.xword	0xa77e9c9f53d5c1f1
	.xword	0x8cba2f2d6e069cd9
	.xword	0xa9f55bba16d81dc4
	.xword	0xcee2ce7853836d50
	.xword	0xc9d78ab74bebbe50
	.xword	0x52660b8b4157a999



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
	.xword	0xf33f71d791cf1c11
	.xword	0x11da8c6e801f376c
	.xword	0xccd8f732503bad2a
	.xword	0xcf075c69f2ffce4a
	.xword	0x9f6ae158d7208fe7
	.xword	0x01ebec871959a509
	.xword	0x6f284e29940ec3bd
	.xword	0x32c31980f6e0df29
	.xword	0x775a9fa0eb8d5eb4
	.xword	0xebaf2e3cb7d21e5b
	.xword	0x1808616df9f8521d
	.xword	0xf45198e44712bc04
	.xword	0xc20b6978d0e3dd53
	.xword	0x9c48babd97512dd3
	.xword	0xd7c041b33f63fcd9
	.xword	0x4907ac7f974e0751
	.xword	0xd767d53518acca3b
	.xword	0xd5717b2c5f370359
	.xword	0xb3489ba6aca5330c
	.xword	0xb4008d34c9291480
	.xword	0x69bec9a73163dd24
	.xword	0x82a715591a364645
	.xword	0x50a50f1ee5a6bc74
	.xword	0x9187b15af9d0cc5b
	.xword	0x51440a16a837b045
	.xword	0x4e59bde90c5e242f
	.xword	0xacfe6e48574e6ca6
	.xword	0x4aec31cd8c415922
	.xword	0x4f3a99eab2944160
	.xword	0xc00999d46b27c64b
	.xword	0x8379aee40b8ad52c
	.xword	0x74167bf44994ab9e
	.xword	0xb88c69f03b7f1f70
	.xword	0x77057a81207e1c1a
	.xword	0x9d43d6bdf9a52d10
	.xword	0x541ae111ec4270c2
	.xword	0x8f2dadf629b39730
	.xword	0x97c207ec5e5fde0d
	.xword	0xca4ccafd0863d536
	.xword	0xd96b5a7285ffb0c8
	.xword	0xcff26c4f709aeae5
	.xword	0xfd8051d6b85c50f3
	.xword	0x5d91d34ecb9a5069
	.xword	0x6fb15ec0c563ded5
	.xword	0xf1c04e236bffc533
	.xword	0xaf6077089f0a8501
	.xword	0x204bf1e0f71c5874
	.xword	0x76a91b5214553292
	.xword	0x3f16cfd268074be5
	.xword	0x66e4ddadc0ff49c7
	.xword	0xebff560a8b0e3382
	.xword	0xf76014d3aae94d15
	.xword	0x6bfd247c3bc5f46b
	.xword	0xc910330b651f9f37
	.xword	0x93928ab5def81145
	.xword	0x5336a62a3f704cd5
	.xword	0xcea24a84130e1b78
	.xword	0x1770a4f317a44244
	.xword	0xa70699c7a75f9a7b
	.xword	0x6e20bc7be9f9c4e3
	.xword	0xe73480a9a367a953
	.xword	0xa1e2f05c193292e7
	.xword	0x7817f979dd964d08
	.xword	0x3a8ad10c76557d2d
	.xword	0x8f10b8b8ddc88865
	.xword	0xfb0e1d71876d2446
	.xword	0xbbebc97fb0340b3d
	.xword	0x350999d0f28288e0
	.xword	0xc78f6ecdbd2d2fb9
	.xword	0xbdaee9e18811ac21
	.xword	0x6f6bbf96a99724cd
	.xword	0x60f0686477253cbb
	.xword	0xca7971ff49187d27
	.xword	0x2e62cba164973314
	.xword	0x76ea2a8ab2cbed84
	.xword	0xa7d982af295d9b13
	.xword	0x7bf39d52b699077b
	.xword	0x388671925722066f
	.xword	0x23f094c1f49ff5a0
	.xword	0x9b8c9bde80d5e7f4
	.xword	0xaada55be58ab82db
	.xword	0x62cbf8e14edacd26
	.xword	0xaced62e919a2fc87
	.xword	0xdafd63d13c87abb7
	.xword	0xb1fcf353a63555f8
	.xword	0x46f9f11350dbc81a
	.xword	0x42ff0146e7a6b486
	.xword	0xa1d0256471fee402
	.xword	0x5d9c7db228a158a5
	.xword	0x52993dfcbda89ca3
	.xword	0x21fee51eb83a43c5
	.xword	0x77a5150f9171080a
	.xword	0xb328a799905298f4
	.xword	0x8ae5df56eadb80d9
	.xword	0xd71e03a05af3f556
	.xword	0x4b80d5f934683768
	.xword	0xcc891fe51d573c71
	.xword	0xb583884adf52b66d
	.xword	0xf98c435488bf5d56
	.xword	0xf79c659cd9cba103
	.xword	0xcee1eca88c2e0f63
	.xword	0xddb3c21998b66080
	.xword	0x5b76fe0f18f75710
	.xword	0xb1c5141dbb7847e6
	.xword	0xb079ab2a4eb5df3b
	.xword	0xdc90af919029db61
	.xword	0xa079f70eabdc5ec1
	.xword	0x7ad98d19e40c1b5f
	.xword	0xa69b8559a639b9c7
	.xword	0x14b117f838fd4a0a
	.xword	0xfd125e55ceae4fc6
	.xword	0x2953a3f4e2dca363
	.xword	0xadead708a01718af
	.xword	0x5a1570b0f40dea80
	.xword	0xf39d547a393feeaf
	.xword	0x97303148fbb67313
	.xword	0x33fb1dc6d7ac7f7e
	.xword	0xdd9274639554dc5c
	.xword	0xc77b999356bb60c1
	.xword	0x9e6fa775418fe3c7
	.xword	0x406754adc62fc8a2
	.xword	0x22c71421cc6ebbf3
	.xword	0xf7e894f8082080db
	.xword	0xaa8ea8beb9e8c11c
	.xword	0x327a1bf770475006
	.xword	0x8917856978857f1a
	.xword	0x36e37edc96baa338
	.xword	0x56747e7a83ec3e12
	.xword	0xe5ef13c97db0f846
	.xword	0xeeb6de21c38c25a8
	.xword	0xfad0961ba7014bb6
	.xword	0x4540ef73ab4c9103
	.xword	0x424798375423dad8
	.xword	0xf4237b134a15726c
	.xword	0x09c17e6e6007c396
	.xword	0xa00054178c1c357e
	.xword	0xf07ad4cad6130605
	.xword	0xbc0ef246f0f5a1c1
	.xword	0x94214dd9fc3f6f0e
	.xword	0xfe47e913f23b5cb0
	.xword	0xc8c09a2719a0419f
	.xword	0x25216fb1ade98c57
	.xword	0x686951e4a79b2f61
	.xword	0x9d0ca0607eb65be8
	.xword	0x6bae2285ad1b7513
	.xword	0xb75fd6c785147590
	.xword	0x7b76adf890faf33b
	.xword	0x91e284f8e2e94261
	.xword	0x584f432da9f1dcf3
	.xword	0xf026582b20f3f38f
	.xword	0x9ef626944b18ffe8
	.xword	0x091d7a0ed528b044
	.xword	0x8bb861c4f5ad1961
	.xword	0xe70f459b2639763d
	.xword	0xe4137686fb49c58c
	.xword	0x5385ca752030e5f3
	.xword	0xea4ce4527ff35856
	.xword	0xe03ee13f76fadb58
	.xword	0xe424b02f474d6194
	.xword	0xbe352d87d21fb7c3
	.xword	0xa23817f72925fb2e
	.xword	0xc853213342632e06
	.xword	0x37d7482ce9b77384
	.xword	0xde2f4d2cc23ce0ec
	.xword	0x9d61c3b7e11df362
	.xword	0x603e196860167a5d
	.xword	0xc01f0dea570eb889
	.xword	0x4d3dbef47f12da14
	.xword	0x66cb02726e20ae5d
	.xword	0xe9efd2ba816c3dc5
	.xword	0x859635990e771c93
	.xword	0xef3b91303195aa10
	.xword	0x46f784890dc372ce
	.xword	0x2b9233b7d99c93ad
	.xword	0x60ff8783adbe6342
	.xword	0x7dbc3819fa3f986b
	.xword	0x01a8198c2a4f5bb4
	.xword	0x034594351c64195e
	.xword	0xd54e5aaad1b72faf
	.xword	0x378f42bc11faa149
	.xword	0x6e4ddcf9b06f2c11
	.xword	0x63b19ad728c5b3af
	.xword	0x7887f5e336d22b1c
	.xword	0xf4e3e3ef31965a65
	.xword	0x91a6a1cddee7f363
	.xword	0x6290b3770438bd9e
	.xword	0x5eeae430344c23f6
	.xword	0x6dabaf108f2de857
	.xword	0x83794e311bbb222e
	.xword	0x7d9628d25735be5b
	.xword	0xac96d93a6f28cdcd
	.xword	0x9fea3eedb39e59c8
	.xword	0xc44b42e8bc02b0c4
	.xword	0xb1dbeb2d13af1ad5
	.xword	0xbaf16d2162f9ccce
	.xword	0xe998956c3bf171f8
	.xword	0x1e7871c80a15ba09
	.xword	0x616defcdec83e249
	.xword	0xbe33695e358d70b5
	.xword	0xb905e98e02a50852
	.xword	0x089ef3032b563a76
	.xword	0xa464303c02c69b42
	.xword	0xd489edf666dbbfda
	.xword	0x88138d1e751a27a6
	.xword	0x46252d9520eec876
	.xword	0xce6fdbeec2a6008f
	.xword	0xec808f929cf5420f
	.xword	0x6af7b74eb7cc3c26
	.xword	0x9bb09af12e5e321a
	.xword	0xcb05bf351a1903a0
	.xword	0xadad12f8ba7f80f0
	.xword	0xff47a92247126156
	.xword	0xb089fae6106192a8
	.xword	0x17b289565a48421d
	.xword	0x6395d18f0b68e6cb
	.xword	0xe12fc90e808e2ebd
	.xword	0xa911fffb0473a4d8
	.xword	0xd2e8fc85806c6c8b
	.xword	0x3b391388670e933d
	.xword	0x9245b5f7377611d5
	.xword	0x5946f70f00fcb021
	.xword	0x3db783aeae2c6655
	.xword	0x9192e9d86551b094
	.xword	0xc5f9d84fbc5c87a8
	.xword	0xec54fee381d60542
	.xword	0x1b9410b886db6188
	.xword	0x2f08ccd416bc3753
	.xword	0xee22c7ec2594eea0
	.xword	0x3a122e342f37ad55
	.xword	0xc3e727fa8f8a6e14
	.xword	0x93b6f503c1e6939e
	.xword	0xcae349b43feb99af
	.xword	0xec418b27bf8a14f3
	.xword	0x282dc2a6d3ec3285
	.xword	0x673da30c1c8fd112
	.xword	0xb25281ea4ef71f1e
	.xword	0xcc526cb87a28ec1a
	.xword	0x3e77433d89e9a0db
	.xword	0xf2be8004fb8894ed
	.xword	0x08ff21db2ca4e967
	.xword	0x874ee1eae2870f18
	.xword	0xc8380622999dcc3a
	.xword	0x811ebad14baf6f37
	.xword	0x81c4032ff1ecc743
	.xword	0x6a9760e256d6e818
	.xword	0xca16376fd0f22735
	.xword	0xdfb7a9fed28265a6
	.xword	0xb133b31d26891d4c
	.xword	0x9d617847d3295363
	.xword	0x9b8c5db98bfcd5ee
	.xword	0xc8a3a08406a7857a
	.xword	0xda1f137bd8fb8952
	.xword	0x122de4930504bcf6
	.xword	0x29038c75c9de2246
	.xword	0xa0eaff134c039a91
	.xword	0x151a4f10f52195af



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
	.xword	0x69bb3a8715fade19
	.xword	0x49f5c43dadef8491
	.xword	0x175dd56aa0ff0617
	.xword	0xcec7344217b92cb1
	.xword	0xf3e933fc3ee807ed
	.xword	0x38282998a487727b
	.xword	0xc91020405ef9c5ca
	.xword	0x5e7cfc0935f9f670
	.xword	0x42f92900156d548f
	.xword	0xa179a0272c4d22b6
	.xword	0x21c85f533c401119
	.xword	0xb7e09a880702f2f4
	.xword	0x684d3b3c446690bd
	.xword	0x3cb8f52ae032a6b3
	.xword	0x57d197accc77873e
	.xword	0xfaab1e26e527d453
	.xword	0x15cc5258ac365753
	.xword	0x375e36b164a5a00e
	.xword	0xb0f4ffd53485b8b4
	.xword	0x3822486b59d242d4
	.xword	0x64e6678dd46c9168
	.xword	0x6e10765367b30395
	.xword	0x4b68874a7a30af5a
	.xword	0x471cf4b27634c550
	.xword	0x5b6e2238cebb6d30
	.xword	0x967a62f90161e6a9
	.xword	0x432359d3d31aa100
	.xword	0x4c681602ada8c3bb
	.xword	0xe13ef174fae5ae6a
	.xword	0x75e225c6e9b7614a
	.xword	0xdc8129984760b834
	.xword	0x611ae2924ae34d21
	.xword	0x092d0290f46442d8
	.xword	0xef5084b3e21f602f
	.xword	0x3a0c1ff22780f27e
	.xword	0xadf11fd441c77167
	.xword	0x2858c4fa177b1c5e
	.xword	0x0aad4dd20ec386ec
	.xword	0xf543e5cd8c4e8b2a
	.xword	0xe20afcff15dccf9b
	.xword	0x43e7d7c39da6cc7a
	.xword	0x1c968c23c5d0cac6
	.xword	0xfd1bc01e3c82f0c9
	.xword	0x6ff945e3b0757ed6
	.xword	0x0811a30d2a50c3c4
	.xword	0xa8470767ec771e51
	.xword	0x455cc07849fdae1e
	.xword	0x6bcbb6859a13f8bd
	.xword	0xc8642574ba959d93
	.xword	0xb663d6bfd7a86c1e
	.xword	0x353993b46b0feb75
	.xword	0x2d9c9de04cbebb56
	.xword	0x298fafda0807f4ab
	.xword	0xd3a640a12f77de76
	.xword	0x3570378d1a58091d
	.xword	0xa1ae663bc0d1f339
	.xword	0x6e1bad64029976d6
	.xword	0x8bff1bf4d2cfe0ed
	.xword	0xb4c4e47692b4e20a
	.xword	0x347563503c46d9c2
	.xword	0x73260a2db8adec95
	.xword	0xd1c1e9db238d25c8
	.xword	0xbb126e5853292d02
	.xword	0x284daf37be777c67
	.xword	0x73ab8af0fe45d275
	.xword	0x42abec4b06dace42
	.xword	0xcac915b8881592a1
	.xword	0x5594e238ef2b775d
	.xword	0x6c5aabdef6194c51
	.xword	0x9301ffe537ed64b4
	.xword	0x809ba1305427f38f
	.xword	0x0d2d7ce2e45efb71
	.xword	0xedd218f072b993ba
	.xword	0x6889bb79c97dfe5d
	.xword	0xa28c323d660c19fa
	.xword	0x385c98749bd38706
	.xword	0x2469b7b66849f878
	.xword	0x01438c19256d125c
	.xword	0x1186389be198d40b
	.xword	0xf1c6d40cff86d36b
	.xword	0x42b971a88b946e05
	.xword	0xc35a610a778244a9
	.xword	0x70d3d109837ea966
	.xword	0xae6d8591b902f229
	.xword	0x9271672d30186177
	.xword	0x0f5478383de2caf8
	.xword	0x3692eb8c637935ba
	.xword	0x746f2b2c283c437d
	.xword	0x0ef945c67cb42a6b
	.xword	0xd0dec35832bb0dc2
	.xword	0x76e0e3950c29ae6a
	.xword	0x3cdf2f2bdff6e032
	.xword	0x5542b1a4aba3f0c4
	.xword	0x88661a30ccbdd6eb
	.xword	0x65e64eccda8913ea
	.xword	0x970b8a29f6fb6b21
	.xword	0x9bdf271c676fab58
	.xword	0xaf8d310d28cdaca1
	.xword	0x1d42b0d159dec0c3
	.xword	0x6ccd2a90bb905aa2
	.xword	0x2a950a846624f03d
	.xword	0x2ee5649b6a661672
	.xword	0x659ec02281d73d91
	.xword	0xb29b88ab046a5eb8
	.xword	0x9c429b3dead3c1d3
	.xword	0x2d2b4f042dae24c1
	.xword	0xe2ac63c395b8f21a
	.xword	0x4a8f4b0c39f18c79
	.xword	0xb3824e7bc376bb2b
	.xword	0x70f5fd038ba90566
	.xword	0x0de6635b5695e30a
	.xword	0x4fa06edc733ab2f8
	.xword	0x655a786991f0bf8a
	.xword	0x6fd9adc444f7e190
	.xword	0xa8be36618286449b
	.xword	0x986437fefef3e205
	.xword	0x53d1c2cc582d11f8
	.xword	0xc274ca04cc770684
	.xword	0x4133e465ee77f3c4
	.xword	0x22fd062c89a0db79
	.xword	0x5ffeab75855c27e9
	.xword	0x970602878a1814f9
	.xword	0xa69e85377abeb2da
	.xword	0xc2023deb9869754d
	.xword	0x2db9345d0aade776
	.xword	0x38f2b122eb58078d
	.xword	0x335d9b0e67e0ec5f
	.xword	0x16e6ec9c79e1e009
	.xword	0x2148dbb72c0d3a89
	.xword	0xa7a2a91e9ad7bf25
	.xword	0xfede3e3094f07e03
	.xword	0x913d4e46f15f6942
	.xword	0x836d4f2083ef2ae0
	.xword	0xc95bd890906bc4a8
	.xword	0xd6f288aa61a98167
	.xword	0x1d0594818999cdd2
	.xword	0x51cbf7f3ace3e8e3
	.xword	0xd91a716bae9d16fc
	.xword	0xfba297b1355d7d24
	.xword	0xb6032222eaca914d
	.xword	0x27916b455328c29e
	.xword	0x21c5081afb7c5ff0
	.xword	0x3e0264f735c8a253
	.xword	0x4e173947df832c79
	.xword	0x97bff905bcf18b5b
	.xword	0xf5fb24083878d257
	.xword	0x65708e2a048df18f
	.xword	0x69eba8ab85f47b30
	.xword	0xfbca081c42adc223
	.xword	0xf9774b22efdfd64e
	.xword	0xf439abf69262dff3
	.xword	0x49e668c60793c2d5
	.xword	0xaa8166cf777ac594
	.xword	0xfb0485400639f818
	.xword	0xb6a1d643aa744b20
	.xword	0xba0f8437c76e82fb
	.xword	0x9e437c1149447934
	.xword	0xded12f48f45cf3f7
	.xword	0xef6798a7adad0cfe
	.xword	0x017b4671e455a380
	.xword	0xe77e2cd3a7c8c0e5
	.xword	0xf9d79deae35d7460
	.xword	0xc51f65e698defafd
	.xword	0x7edf7e6243d85198
	.xword	0x67df0c4ea0c73880
	.xword	0xf7236dae1336bcb5
	.xword	0x5da4b20a2b7aa4f9
	.xword	0xf38738ea159a76b4
	.xword	0x7c532711bcc9371a
	.xword	0xf37b0c6487ae0137
	.xword	0xd74a640b7c7306eb
	.xword	0x7712d54f18e1213b
	.xword	0x8bb3f8a333410dd9
	.xword	0xf2e77143027d5e6a
	.xword	0x5e63b5e54651767c
	.xword	0x2cfc03b3f288c2f8
	.xword	0x191ec15d148b7bd3
	.xword	0xabda21d0970dbe18
	.xword	0x398584c1c83173d6
	.xword	0x3dec9a97f1a5237f
	.xword	0xe3f571bfca4812c0
	.xword	0xcb5eae6054ef640f
	.xword	0x472587acb2ec62d1
	.xword	0xc0b50962095d8828
	.xword	0x0d96c891d9f41991
	.xword	0xd434c51ad756e14a
	.xword	0xc05d4c93aa522ac3
	.xword	0xdc2fbf6006f2f5fb
	.xword	0xb2ee5b6c99f32596
	.xword	0x85cd26c603a96792
	.xword	0xf20abde3f4699a4c
	.xword	0x21682046e26344c7
	.xword	0x082b48e0fb846c55
	.xword	0xb928358320081e89
	.xword	0x92c562ea03c86544
	.xword	0x0fe600331d886c0b
	.xword	0x3ea2a3b9ab297826
	.xword	0x6cc91f68d4d298f9
	.xword	0x34c11d93a930913b
	.xword	0x27dd9a534fc19afa
	.xword	0x554b0d798375c211
	.xword	0xe237cac4e2c60f9e
	.xword	0x11e1b71ac0b2e5e3
	.xword	0x2632d96740398961
	.xword	0x431d89fac850396f
	.xword	0xcc4931d87536bfb3
	.xword	0xda010377835173b3
	.xword	0x5adb8b0ec0e29107
	.xword	0x150f18db79120f41
	.xword	0x280d02309647bb3c
	.xword	0x3bef76476da63172
	.xword	0x0e4f2858f0d6f1df
	.xword	0x4cd1392583e8f3b2
	.xword	0x8a942c2ee7f7a59d
	.xword	0xec22b89dcdf4a721
	.xword	0x789d4f6cc0519d10
	.xword	0x929f87d558fb8563
	.xword	0x4f941138737112e7
	.xword	0xb80f1a2e298d4228
	.xword	0xfb621105cf04e43d
	.xword	0xbf6b3ce3e27ac858
	.xword	0xef59f8c21eefc8a6
	.xword	0xe639e09351406e1a
	.xword	0xb552ea6c722ba9ba
	.xword	0xed682a3f0a6b53d5
	.xword	0x13ab9feb6911894f
	.xword	0x0e866c8e3a772d77
	.xword	0xa710166262a89845
	.xword	0xa97bbdf012b808ad
	.xword	0x5eea32fbf82c8f1f
	.xword	0x87ac3584bd23d0b7
	.xword	0xe9d3691cb7f25d1b
	.xword	0xbe4dce1d994d8c50
	.xword	0xb374fb0c007a5629
	.xword	0xddb4ccd4afe22d77
	.xword	0x5dbd378e429cc2f7
	.xword	0x11355f8ebdd88186
	.xword	0x03895e5de080370f
	.xword	0x1aceadb4d7c333e4
	.xword	0x8ec5479e4d975978
	.xword	0x63cca170d90b806c
	.xword	0x4e68e81f88392de8
	.xword	0x80afcdbf19d07e73
	.xword	0xbb819a1030353ceb
	.xword	0x76f81da47ee11196
	.xword	0x4f25f32c43dd39bb
	.xword	0x987f38a521e50797
	.xword	0xf9b3371518d91251
	.xword	0x3904478a572c2898
	.xword	0xa016ee84c63caf4d
	.xword	0x92bc520c72b333dc
	.xword	0x9afc5f01d1adb8f9
	.xword	0x188ce56565cc9572
	.xword	0x18a7af6ac36635c7
	.xword	0x334ff0be102fe028
	.xword	0x81903b7f144c7734



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
	.xword	0xa75a83f635b67553
	.xword	0xc2377b8ecc063f9a
	.xword	0xa1cf2d04ae1bf622
	.xword	0x3c406909bf0935b6
	.xword	0x607ebb31cbff17cf
	.xword	0xaf50af8674142743
	.xword	0x2ca2744eaed79e7d
	.xword	0x343f3c8133ad09b5
	.xword	0x76f4fad56b24bd5a
	.xword	0xfa0608d036b403a3
	.xword	0xb251ea8f68c8d398
	.xword	0x403400a05c4e0102
	.xword	0x6274ff42be3d7d9f
	.xword	0x308b7f30d95de690
	.xword	0xd18061826b82005e
	.xword	0xe64cbbcf4a86f8b0
	.xword	0x40d9d6aeccaf040a
	.xword	0x605f38ef95a43553
	.xword	0xa6bca1d93a2b2e09
	.xword	0xaf2770f03ddb9eec
	.xword	0x0b41371a2d6a910d
	.xword	0x1d2ea3682d9a3752
	.xword	0xafabae1060a396a4
	.xword	0xc59f6bdfddfb61c7
	.xword	0xdf1f3b4b7d903e83
	.xword	0xc2c185cde91299cb
	.xword	0xbfb84fd1d11911a0
	.xword	0xd37fc7fde4602696
	.xword	0x85364ef78920e2b1
	.xword	0x1acefd439a289369
	.xword	0x68d56ffe244b10d9
	.xword	0x3bbf840fe61f5870
	.xword	0xee04a57b8740d806
	.xword	0xa8ca1840b8f33212
	.xword	0xe632ff6fc2ecc9c9
	.xword	0x6225306d5fb59ab9
	.xword	0x57239fae9744663c
	.xword	0x169b9bdaa81dfc84
	.xword	0x0f1a24346f01b974
	.xword	0x377d177e15c2083b
	.xword	0xb23a774b5bc5b5a0
	.xword	0x4e63671e00d767c5
	.xword	0x62c9462cde820494
	.xword	0x8f641da97cdb7373
	.xword	0x22e36d6cee5eb145
	.xword	0x72081187bd320c96
	.xword	0x30023112f71dc0bf
	.xword	0x894eedc6dfff29ae
	.xword	0x5360242678a285cb
	.xword	0x5b64ae862b465229
	.xword	0x4f5522b36d67e510
	.xword	0x9b95c3d50319ecb9
	.xword	0xe21673a5c0cafac2
	.xword	0xaaab767e43452f12
	.xword	0xd8e0b05c228cd653
	.xword	0x9ace2cdcb590fd68
	.xword	0x8b4298ca3bf3c036
	.xword	0x6d197d3380b06d8b
	.xword	0x536b5b3b6e0fcb04
	.xword	0x12be4c1a2910aecc
	.xword	0x9f9958c0d76e9f04
	.xword	0xc1bbc86ec7deff77
	.xword	0x2684b4a26be263cc
	.xword	0x930962c2d22906cc
	.xword	0x8914a4232fb982da
	.xword	0xcbfef1f52b21775b
	.xword	0x92a61cc495680f6c
	.xword	0x6c3c8e726680c082
	.xword	0x7dd8c974efa7bea2
	.xword	0x57265a0ee31d7c53
	.xword	0xf78eac94e8c1bef9
	.xword	0x353fe0778f8fdf0f
	.xword	0x33fe75f95373b63e
	.xword	0x4fb359bfa24e0e8c
	.xword	0x83c062d07749de5b
	.xword	0xfc8bbbea0ef6cca0
	.xword	0x8d0a2cf840c44513
	.xword	0xcdac7bb51cfcf9f3
	.xword	0xfa487f3fb4722f59
	.xword	0x4af738ada3791fa3
	.xword	0xf474064bac2d55bf
	.xword	0x349329835d7a5e57
	.xword	0x99e00540c2c322a6
	.xword	0x4938717f604e8f14
	.xword	0xc9d25bdf2d8f2115
	.xword	0xffa81dd9ea8176f7
	.xword	0xfaabff41bf8664c2
	.xword	0xd7e918c3cd0e84aa
	.xword	0x48af9bf729c10cbc
	.xword	0x3d9dbb27838a40b0
	.xword	0x48c89fad9e03b70c
	.xword	0x07468425a21cc9fd
	.xword	0x8ac27aa3986942cd
	.xword	0xd4301c2ab9fa6a34
	.xword	0x580e07eec17050aa
	.xword	0x798af9c0e70561af
	.xword	0xbac2ba001184d3b0
	.xword	0xe67c4bfb169b7e96
	.xword	0x2b71acd9086dc959
	.xword	0x16a0301dc9d7c5c0
	.xword	0x6d42038f4d4cba26
	.xword	0x9453248d97596717
	.xword	0xedc1b2d74aaf7b2f
	.xword	0x25afa94946ccad21
	.xword	0x92f7fbd3eafb67d9
	.xword	0x8a274ef053ca881d
	.xword	0x3d4ca00abbedaa5a
	.xword	0x12d110c23841267d
	.xword	0xb1b0262d847ff5c5
	.xword	0xe35a6a1d45e46e9f
	.xword	0x78f9fcd98c4897c5
	.xword	0x49933f59371c3974
	.xword	0xfd9c9a410521ee73
	.xword	0x5671ff63b65f8b5c
	.xword	0x4968befc9c9289a5
	.xword	0x598e4afecf261e98
	.xword	0xe690f419dba2fd41
	.xword	0xf726419e4c68f1f9
	.xword	0x4820b125419f9404
	.xword	0x2c864e098545d358
	.xword	0xeeede026e985b92e
	.xword	0xa73274eeea6ea083
	.xword	0x491b81540bd9fbc9
	.xword	0x847ce24d61b64601
	.xword	0x347290a9e353beda
	.xword	0xb7a51091c1750f05
	.xword	0x768ea8e304e1c340
	.xword	0x0fd737ec0dbc081e
	.xword	0x7203c1410010de65
	.xword	0x1309ce3239240e6e
	.xword	0x0deadf8d68367155
	.xword	0x4eefc8e0360d36be
	.xword	0x85d34ca0d0ea2e59
	.xword	0x0eb9a02ebb7e60bf
	.xword	0xf7d6e1e06fb9368e
	.xword	0xfb49187dbddb3bfc
	.xword	0x899edf2da72e464e
	.xword	0xbe0237fd60b9e4bc
	.xword	0x12aefb73976ac472
	.xword	0x07883be4a68b2d23
	.xword	0xe345b6d028cf0a1c
	.xword	0xd0f99c181f46d9b7
	.xword	0x111bcedd259afcf5
	.xword	0x1445521f7843c19f
	.xword	0x55e3bbd32c9e47cd
	.xword	0x392890a7328c0365
	.xword	0x123266ddfd30504f
	.xword	0x2bc7751a0332565a
	.xword	0xfbf0bb7248c535e1
	.xword	0x6463b99fa4ac2a76
	.xword	0xc0fabf47243dde25
	.xword	0xdb4e7720e1fb3555
	.xword	0x60c36ce58f316a46
	.xword	0xc2dbb7335d537d25
	.xword	0x798cda7605032fdc
	.xword	0xb284d41986e6096a
	.xword	0x6f18b667b0ad3094
	.xword	0x6a5feb235b1d7b4f
	.xword	0x8290ae079c0b96b5
	.xword	0x4fd7b8ecddd06191
	.xword	0xddcdc917f664928c
	.xword	0xe2bd339b70a3e737
	.xword	0x6aa393d4506713c5
	.xword	0x57199bccd58c6949
	.xword	0x5845e345596a10af
	.xword	0x67868c01a7eab42c
	.xword	0x50290f463ee4b178
	.xword	0x81521b612d7f7fd7
	.xword	0x3011d02b0d3571c5
	.xword	0xabab01354b6b6bc0
	.xword	0xede50acdb030b10e
	.xword	0x44a1b75852d1bbf3
	.xword	0xd138f9ee93562826
	.xword	0xe22feb303da91b7f
	.xword	0x4e9e1bc20eb7961c
	.xword	0x30b0122d77a4704b
	.xword	0x7396820f0b1ea15c
	.xword	0x0ffb9096b24901ef
	.xword	0x7f7d5cd9c1a8e64a
	.xword	0x4dbad47cd03c8310
	.xword	0xaacf1f04ebf015c1
	.xword	0xc04e141850b018dd
	.xword	0x2be6eb51f58d17d0
	.xword	0xbfa45687b0631b1f
	.xword	0x58665b047bb6b17b
	.xword	0x70f61fa6746a597a
	.xword	0x18d2d2f35bf0731f
	.xword	0x7ed5531f35f6fadf
	.xword	0xf5f90b67d940cb07
	.xword	0xd29f83a25d6d5358
	.xword	0xcfe87bd91f09ff7b
	.xword	0xd43bd7d96bf6f4cc
	.xword	0xef4f0e049b60432f
	.xword	0x9aa9517187caeb5d
	.xword	0x38e39252d9a9953a
	.xword	0xbe6616fa3a9e74ac
	.xword	0x8b0fcf1dc1a230d7
	.xword	0x5a4f2aee23ffb734
	.xword	0x94d8bfd86cc982b9
	.xword	0x249b281636667dc4
	.xword	0x665d19391b7a0be7
	.xword	0x017f08edabd72f74
	.xword	0x3704503a8aff8a8e
	.xword	0xd5e2daf166773153
	.xword	0xf2bb2d40709c676f
	.xword	0x9db35765e096dbfc
	.xword	0xaf82618d76cb904b
	.xword	0x1fef16a08baf5eb7
	.xword	0xea6994ce1b5d5534
	.xword	0xda954702079f5b89
	.xword	0x763910891ebd09f0
	.xword	0x34757abaa5ba26a7
	.xword	0x1626ec4f6ee8786d
	.xword	0x9952ee1820a8cebc
	.xword	0xac18527767d7d881
	.xword	0x58c9359975f2e004
	.xword	0xb8f67417bf93a5f4
	.xword	0x4f89d444b155f674
	.xword	0xaf3966564d3e97c1
	.xword	0x1b172330d83a9002
	.xword	0x2952d5b9db600ca0
	.xword	0x8397feeb75afa7de
	.xword	0xec26f9bb9d9ec900
	.xword	0xcecb970bf0bfb197
	.xword	0x0bfd7aa5d1114a86
	.xword	0xe6f56c338b72d027
	.xword	0xafdbc46e80687a7e
	.xword	0x48ff8c23edd9995e
	.xword	0xa39fa2b4c476ed9d
	.xword	0x15244b1614646547
	.xword	0x3c2728aeb91e587d
	.xword	0x829e897d53da5985
	.xword	0xa905f31f48324ff2
	.xword	0xec315ef822b00247
	.xword	0x61f919f88b7340d5
	.xword	0xb273ea3ce34aa2c9
	.xword	0x79828885f1c0b237
	.xword	0xe22168c86adb0b0f
	.xword	0x78fe0e92df160856
	.xword	0x77eace8ccaf7ae8e
	.xword	0x63e86e7fcf2420b5
	.xword	0x6bea10b202c26983
	.xword	0x5068967b90d7f6d3
	.xword	0x58b84fca1b431005
	.xword	0xcd45f107d36f12e4
	.xword	0x25e39768dcf92816
	.xword	0x9c8cd6bb4c8a88ad
	.xword	0x9cd6b3217959d978
	.xword	0x1cf72054de766013
	.xword	0x4ebd957b07c526be
	.xword	0xbc586646b5af2868
	.xword	0x9981727b711778d4
	.xword	0x836a083ff3c65a60
	.xword	0xac9c14bcf041e6f6
	.xword	0xc78370792a44a2ce
	.xword	0xa2733a8ca785a253



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
	.xword	0xc6327fca5871f256
	.xword	0xfba835bb95fe1a51
	.xword	0x20cd67ea1a418c4c
	.xword	0x7ea73ebe6f03ce2a
	.xword	0x8d4be851e5a1be58
	.xword	0x38b61e43c6bff6f2
	.xword	0xad6b2964cbcf7e38
	.xword	0x93318862234fe0f9
	.xword	0xea23bce419ac841e
	.xword	0x4871dadc4adc5b88
	.xword	0xa5557b74cee25401
	.xword	0x1a64963327641c1c
	.xword	0x9209e97729f20d75
	.xword	0x05122f2787f41197
	.xword	0x420eec9261cb9e52
	.xword	0x34089452e0ba03ec
	.xword	0xb4efa3fc18a92820
	.xword	0x8921863455c0c2e8
	.xword	0xfb3b32891d83d983
	.xword	0xbf9526dcbef8c0da
	.xword	0xbcb6cd8c63a42d3a
	.xword	0xbb0d5c0c1c7cc2ed
	.xword	0xca413d4fb4d4f2b3
	.xword	0x19df6a73e85e93a9
	.xword	0xe02487ee9a74be03
	.xword	0xfa44791868c0b407
	.xword	0x263e28ac8e8f25ef
	.xword	0xa1c4c6d738864149
	.xword	0xb6dce315aa0118c4
	.xword	0xebd226ab8b264384
	.xword	0xaa6c5da33be36e99
	.xword	0xf3137c38abfcf656
	.xword	0x806c81a12b9f1a77
	.xword	0x84956d2c40d0d80a
	.xword	0x527b3b261806b18b
	.xword	0x2d926e7b0e857e13
	.xword	0x53a9eecd78ca8936
	.xword	0x0d29a962313a35c0
	.xword	0x1f657751d52800ab
	.xword	0xc27739cfccb83e92
	.xword	0x25f0c6a5c1b02964
	.xword	0x3c39016740799606
	.xword	0x4e921c45b80ffc30
	.xword	0x65d0d268a7391eae
	.xword	0x6f1a53049324684f
	.xword	0x493428f73970bba7
	.xword	0xe31e35dc217ab3c0
	.xword	0x15c724e5cb70db8f
	.xword	0x6000ce1e9ea6cb47
	.xword	0xca13f43077d1d297
	.xword	0x77293a0587562952
	.xword	0x96b229dac8f559fb
	.xword	0xa868a4f0b6f890bc
	.xword	0x9f932a3213ef9fa4
	.xword	0x1d5b76914397321e
	.xword	0x98bc085a40756ae0
	.xword	0x746357e7fcb2dd3c
	.xword	0x69dc413ca8c150af
	.xword	0xb128d90db5d387c1
	.xword	0x51517ab94bc5985a
	.xword	0x75cbad8387bd9797
	.xword	0xe60ce243fee1b96e
	.xword	0x7fe6785b1092b7d4
	.xword	0x4a5800946cba8e8c
	.xword	0x7ec7b77ac90a2e4b
	.xword	0x8b857d5212aa47d7
	.xword	0x3bb4058825220e9d
	.xword	0x627dc64f308ae61e
	.xword	0x42aed9927a670f5a
	.xword	0x47ac9352a6f3fff2
	.xword	0x65c94eeaced394d6
	.xword	0xb300bdaf25660dd9
	.xword	0x47832e4c37e505ca
	.xword	0x1c10ca40189a6841
	.xword	0x725d3fac47cd5461
	.xword	0xf2b35018141cb5d6
	.xword	0xfd04fbe58a982d2a
	.xword	0xbc538baafe7b06f3
	.xword	0xa29109484b9302c4
	.xword	0xed8c982eca162a49
	.xword	0x69bddf4142deb1e6
	.xword	0xadcb399c492ee00e
	.xword	0x6b553f7ed6bc43cd
	.xword	0x4daf1453375f0d5d
	.xword	0xa58c33ed587d06fe
	.xword	0x207a13712529ccdf
	.xword	0x4d613879ea759fec
	.xword	0xaed448ef44652a34
	.xword	0xa82d4ea991cccb58
	.xword	0xb531bd7e2f9617d6
	.xword	0x77a5771e325db9c1
	.xword	0x68e27b2907df787b
	.xword	0x06ba7831dac40f6d
	.xword	0x4bf0b9e821bcd162
	.xword	0xe3975ed8324a9499
	.xword	0x3ab4c7c12a2d057b
	.xword	0x13439e6a21e52fe5
	.xword	0xd20bfc2a4006ffb9
	.xword	0x324dc7adcca6801e
	.xword	0x7965f497d270d738
	.xword	0x753ed7c198f85ee7
	.xword	0x643f91385ce455c9
	.xword	0xdca4cb0587271c33
	.xword	0xbf7845e5182d6022
	.xword	0x61ea0c40939c91c1
	.xword	0x11c379496df437e5
	.xword	0x5145f5fb9df16cf9
	.xword	0x8da8ab8247454b7e
	.xword	0x571491a4b388d409
	.xword	0x0c4d018b4da0f869
	.xword	0x4683e4176da14c52
	.xword	0x11643c2e4006b12d
	.xword	0x3f16032e704c1c50
	.xword	0x7e6c1839c020b8b9
	.xword	0xe1e6e7b80a279bee
	.xword	0xf687848f349c2b5d
	.xword	0x53090c74334d4980
	.xword	0x29196705df32cfec
	.xword	0x7bfabddf94257509
	.xword	0x09d1b524cb7a00f1
	.xword	0x6e518b1b41c5d265
	.xword	0x37e51589dec9faf6
	.xword	0x69f525de17749602
	.xword	0x86e5e7f3bd43442d
	.xword	0xf21ae6bbb5012a1f
	.xword	0x8ad1994d14154d3c
	.xword	0xfd55b2793d5982fe
	.xword	0xbcede93dff9c6a6e
	.xword	0xbbc3e243bddcf52d
	.xword	0xb05f3f8b067b63a1
	.xword	0x688c6c80154269e8
	.xword	0x9cd2ff7fdd44c053
	.xword	0x93a63d09c0ffc649
	.xword	0xceadb4fda8ff0c55
	.xword	0x8823dd783aca0d97
	.xword	0x0ff08a11571a533c
	.xword	0x42e5965b2e64d56d
	.xword	0xf018442daffac7e4
	.xword	0xc0413e945faef64d
	.xword	0x62d094c176f42046
	.xword	0x40a4c4dcc88dd68e
	.xword	0xca9aa40119fb2a5d
	.xword	0x77f061f0644c309f
	.xword	0xad2f6efb9ab324b5
	.xword	0x3a7510bc20efcf55
	.xword	0x7082e4d4fb52d521
	.xword	0x4fb12f885a412f4c
	.xword	0xa38c6727f4225ffc
	.xword	0x00bcfab987491b2b
	.xword	0xe4e70abf3dd15e42
	.xword	0xf2100db786bd6b28
	.xword	0x192d6991631a029e
	.xword	0x7a87394a1bf549d1
	.xword	0x9787fda9554e75f9
	.xword	0x306ef532919e1499
	.xword	0x79a70993c41c1420
	.xword	0xb8c552076ad183e8
	.xword	0x0f7e5ee5affeca6b
	.xword	0x2f96d9dec1e4ad3b
	.xword	0xa40f5dba790a14f0
	.xword	0xc57ef726ddb92c25
	.xword	0xdb9bc106d01111a2
	.xword	0x6ae87105123bee45
	.xword	0xe361d2f7f4d85fc9
	.xword	0x5020b680d6f376f1
	.xword	0x49265c388218fb79
	.xword	0x353d93998b853c03
	.xword	0xf3f0db92c56f8584
	.xword	0x030aa5021ee539e8
	.xword	0x3552e09713f53963
	.xword	0x8ab977141ed83488
	.xword	0x946dd23fa911e0b6
	.xword	0x2c07bd6b1ad6c25f
	.xword	0x8e541af7472373a6
	.xword	0xd5e0321f6167a77b
	.xword	0x8d70049d7f334d6a
	.xword	0x49c9209194a6ef48
	.xword	0xe96ae6d8d51671b9
	.xword	0xe3373ff658a36f9e
	.xword	0x808ee9cd875607a2
	.xword	0xc1b6423ee27ef772
	.xword	0x652bb0b5e9b60c00
	.xword	0x37fc26cd82b5a9ed
	.xword	0xaf0364113f9ffefd
	.xword	0x16f646ad40aae922
	.xword	0x81a1ab30d698efe9
	.xword	0xc173db942ff4499b
	.xword	0x2c375425b002ddc6
	.xword	0xedb1660c2cf7402d
	.xword	0x0499edda37e7ace0
	.xword	0x0cb2efd3843e378e
	.xword	0xcf40a0be8540c053
	.xword	0x409a11c51db05505
	.xword	0xba339342be8a7592
	.xword	0x19a4b71f384ea82e
	.xword	0x5e6323578f96e466
	.xword	0xd8496883e7abb807
	.xword	0x8963c30c03f72589
	.xword	0x80d5dbcc5c27ff22
	.xword	0x1ccfc7f8fd94ca15
	.xword	0xa09b76794fdb05ad
	.xword	0xb8648e6dad79769f
	.xword	0x7d8d83ea415ee006
	.xword	0xd22ca243b9ffb0fc
	.xword	0x2b1bc3f4948c2b61
	.xword	0x2d0cf3e05aa8d29a
	.xword	0x37cfc41c7cc09929
	.xword	0x8aa1d0c36ca28a64
	.xword	0x9caa811a80ebca09
	.xword	0x829f30be0d03382f
	.xword	0xba6062cacb5574d6
	.xword	0x6341a805ff931293
	.xword	0x67803236e8564130
	.xword	0xac998ceb91b2d304
	.xword	0x95c49464c9779b4a
	.xword	0x49e1eb8971baebe6
	.xword	0x9b7ffdb5d24d294b
	.xword	0x91cfcdeda3e8f146
	.xword	0x99bec4be557e38f4
	.xword	0x001d2dbf04cc1488
	.xword	0x8d3b58e9956f6d76
	.xword	0x67174ffa61ce8f7d
	.xword	0x7461a40c900aacdb
	.xword	0xc319b662bf00caa0
	.xword	0xfd89a435c34e471c
	.xword	0xf96109408c319dad
	.xword	0xc8ec9a253a4a86ab
	.xword	0xf1f71b3bf1e558ed
	.xword	0x4c92540fb1bc36c5
	.xword	0xc7d1437c5cb5425e
	.xword	0x3fef2438ee9d9181
	.xword	0x167e70af734182e6
	.xword	0xb214e9a0f141855b
	.xword	0xd25289805f5ab544
	.xword	0xfadcd7c0ac788201
	.xword	0x5cf1f91a9426fc30
	.xword	0x4807fbb345989460
	.xword	0x013564d4ee562d04
	.xword	0x3d8b84be8e49a24f
	.xword	0xf7f8f3821cb83594
	.xword	0x50f9406520ecf50f
	.xword	0x5745f96b5bbccefc
	.xword	0x44be1e296cb4025d
	.xword	0xcd0cba90f9f57f3c
	.xword	0xcfc26bebc45e6887
	.xword	0x7b3be2e5c005fefc
	.xword	0xaf06d2324d332986
	.xword	0x2b589653dde6391a
	.xword	0x8dfabd45dec29872
	.xword	0x87452b1a97312fcf
	.xword	0xaa30ca567d70ec1c
	.xword	0xb885a88256739005
	.xword	0x1f455cee17b3669a
	.xword	0x10303b2727b62233
	.xword	0x7f0347619cb635c6
	.xword	0x428e001ce0f55f3b



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
	.xword	0x17cecd4b32471d90
	.xword	0x723d9f93f9368db8
	.xword	0x3dff9eccfd2e2aa9
	.xword	0xd781625612f405ac
	.xword	0xbd685fd23b908fd3
	.xword	0x959e0862155174b8
	.xword	0xdd101ddd9b6d9bdd
	.xword	0x139c396c0315e9d9
	.xword	0xb3729bf3721cc510
	.xword	0xf5a1684c8256a095
	.xword	0x87dfaf8cee7128f2
	.xword	0xe0b064516ee07670
	.xword	0x0845d7a6bc0d28c8
	.xword	0x0a24d4f306eddc10
	.xword	0xa5f6611f0855c179
	.xword	0xb20f7ebafa446642
	.xword	0x5b709b7c5ca4b880
	.xword	0x2a1b696a8e0d66e3
	.xword	0xc78f8a93805bb6e3
	.xword	0x09e5728f16114091
	.xword	0xfedb870dd0e72dd6
	.xword	0xd75dd882a32eb293
	.xword	0x30e4c5d6c10f3614
	.xword	0xfe9c31f3d016460c
	.xword	0x9f96d7824bd3936d
	.xword	0xb912dfd810878280
	.xword	0x909f497b29077d35
	.xword	0xc713b008e5d85b29
	.xword	0xdc88a48b0b5bf7b1
	.xword	0xec0f44c5e90f92b2
	.xword	0xbf2c10a3f8957f10
	.xword	0x5b72d260f31985af
	.xword	0x028b265f3737cc0b
	.xword	0x2fa353d450cb0213
	.xword	0x0cc81abf1af7728c
	.xword	0x037ba7446b3e9df5
	.xword	0xfde423239aa402a1
	.xword	0xe69fd42413abd05e
	.xword	0x1ac8d57c86980e87
	.xword	0x94106baeba1b9fb1
	.xword	0xfd5eb6860f0430e8
	.xword	0x2b89b4f9b134d5da
	.xword	0x2db7c72ed3408218
	.xword	0x33c000111809889b
	.xword	0xd852d33a74d2907e
	.xword	0xd664995f50213787
	.xword	0x90a9fb28d8bd8ab0
	.xword	0xf3a4234c5ca99264
	.xword	0xcb7841f3aa5cc266
	.xword	0x7b55219ce1c34fc2
	.xword	0xb8c88f2a946a1b37
	.xword	0x8e2200831ae808c3
	.xword	0x30663d335c42b6ec
	.xword	0x4f5f477e9df666ec
	.xword	0xa794feda55387149
	.xword	0xe399728606a740e7
	.xword	0xe617e49e665051ba
	.xword	0x28f14c9224e5e686
	.xword	0x4a778113c11dd999
	.xword	0x185e75dd9a81e20a
	.xword	0x8a2caee6d701d6c6
	.xword	0xc7a6f2924bd4dd92
	.xword	0x8388da7ecd35aadd
	.xword	0xdbb2f14229a4e898
	.xword	0x824a5e7f6d499397
	.xword	0x87367d1589c9a450
	.xword	0x6da543edda652a29
	.xword	0xf5f0f426c21bded6
	.xword	0xcce5a5eefed20da6
	.xword	0x18b96e412c70ccf5
	.xword	0x6fb51089eabebf83
	.xword	0x6044e9e7d7e08285
	.xword	0xc5fdf7a7de96104f
	.xword	0x9025fd72d36dac91
	.xword	0xc1f5597f99dc36bc
	.xword	0x7745240dd9a93d8f
	.xword	0xf4a39b4c89da89ca
	.xword	0xc4fa22cdd69a03c9
	.xword	0xd5b89aa4bbfe7863
	.xword	0x155ca03c84bfa55a
	.xword	0x640d7cb36e6e2c0d
	.xword	0xbfe14fd0502ac774
	.xword	0xcb83cbd227d9361b
	.xword	0xc449185aa52dae87
	.xword	0x48598fdba33e1a74
	.xword	0x26e12b251e7141f5
	.xword	0x7b74d828c8e81e10
	.xword	0xe2165ba006824597
	.xword	0xd666e1fc16fbdc18
	.xword	0x78206c2ac7212b25
	.xword	0xc5ca2db52e7438b2
	.xword	0x13eeb3efab569e39
	.xword	0xfa4eaeadbf144d18
	.xword	0xe2612d933702c90a
	.xword	0x31923ae4aca8d79e
	.xword	0x5710491353221a8e
	.xword	0x05ec4e5398e158f2
	.xword	0x82e629ab70a0b8b6
	.xword	0x4e62049fd3e913fd
	.xword	0xb99bcac0c9cfc7e1
	.xword	0x233d59cab3003151
	.xword	0x5ac8287d03e8711b
	.xword	0xc6b674cc3d42ce01
	.xword	0x96c4203e6d07c6c2
	.xword	0x1bd772aec3d92a91
	.xword	0x9f832c8fdad42569
	.xword	0xe60c926f55d58a02
	.xword	0xe5b9e861436b2762
	.xword	0xf5d83923969c0b93
	.xword	0xb5912366ced30b99
	.xword	0x8c5ff5334a2faed6
	.xword	0xa0b0c2f93814e1bb
	.xword	0x15c3382026cd8628
	.xword	0xf5b15d05d310c354
	.xword	0xf6e7ab972102d486
	.xword	0xe13934b206e10905
	.xword	0x9f511daa5a55c1a3
	.xword	0x40f7986963c71495
	.xword	0x0f1f079089e07d63
	.xword	0x1af546eac0e5f7b6
	.xword	0xeae312d6047e9981
	.xword	0xfe129490d1b7e354
	.xword	0x59f8ab3e7eaf3df8
	.xword	0x33d8cf9608846bb8
	.xword	0x5b738583c6009f36
	.xword	0x7c6aa9f305675d1d
	.xword	0x4b2ac69a049ba663
	.xword	0x32fac12cc8078ec7
	.xword	0x07654d1a11fcf576
	.xword	0x4798d2f6a70c5708
	.xword	0xc0c1a5a40bcedead
	.xword	0x5ef98cede88315df
	.xword	0x546313f068330885
	.xword	0xfc2f9e5614c294e9
	.xword	0x8a6cb26ea14f5639
	.xword	0x5f78ad761837c9b1
	.xword	0xd0a322a95212bd4f
	.xword	0x132a85f32b4f35d2
	.xword	0x8a179d4ca4e04fe5
	.xword	0x34588bed2a8b61ee
	.xword	0x94bb8d490b0642ba
	.xword	0xdc7ecafdcc3f696b
	.xword	0x44e506778701a9d9
	.xword	0x69515f289646460d
	.xword	0xf15eac3c9e95580d
	.xword	0xb43a3bd591a15e3e
	.xword	0x5f7893ebc8048504
	.xword	0x40de2080d0b4c5b6
	.xword	0x363079fadb117259
	.xword	0x7290f70e785f74c0
	.xword	0xa96ae6a64e04f959
	.xword	0xcf6c283a056d3faf
	.xword	0x1fa8539a7c594813
	.xword	0x89be20fa3eb8278a
	.xword	0xc513c4111b38e751
	.xword	0x53f85699e239557f
	.xword	0xf97d64d8b6c9093b
	.xword	0x8a4c622db743dcbe
	.xword	0xe9ac4bdbeb79ea8e
	.xword	0xe7ebb17d73706315
	.xword	0xc7edb9443e1e2147
	.xword	0x2a40826a788a1d34
	.xword	0xb663d94a7ead48f3
	.xword	0x4521d0b9b65b8878
	.xword	0xa3be3679caa286e1
	.xword	0x4713a3c196db7ad7
	.xword	0x73fd808a16bbd186
	.xword	0xcc9c7715e9bcab69
	.xword	0x4968f73807a932d5
	.xword	0x2313e5e524632b87
	.xword	0x27c52115cc3805a7
	.xword	0xc9318bdffb127f2b
	.xword	0x620cede6fc9c874f
	.xword	0x50f3a1313e70bae6
	.xword	0xf4bbc9f6bf220ebe
	.xword	0x02a4c15a8b3cd83d
	.xword	0x5f19de2590c26aea
	.xword	0xeb8f0dc967188bc3
	.xword	0x9ce222f710f35c2a
	.xword	0xf114e6f368e012a0
	.xword	0x86ea3a861764e5cc
	.xword	0x2c29e8623e0cca68
	.xword	0x9023277137104614
	.xword	0x71561bbfe1c95ba7
	.xword	0xcc9205945518d11e
	.xword	0x3feb39ffe362c77f
	.xword	0x5eec2386744f7651
	.xword	0x60d581c97d42c062
	.xword	0xc4bb200ba0914294
	.xword	0x61fb605bbb61108b
	.xword	0xed82da9b2b3246fd
	.xword	0x99c6612996821bcf
	.xword	0x58ca00f02513d27e
	.xword	0x0fc09f9a00cbc0a9
	.xword	0x6eb6905d762bea8a
	.xword	0x578027e2eb65e976
	.xword	0x23f86c955ceba891
	.xword	0x3747e0ea85cd8b68
	.xword	0x23970c84ff0b9291
	.xword	0x8dca3f1d081f0926
	.xword	0xc3e9cb9f632919b4
	.xword	0x1286c4361e73345d
	.xword	0xaaf8ae47264db574
	.xword	0x2f4a847ffabad64b
	.xword	0x097f5ef6a1f70827
	.xword	0x255a9b0b4a79f3b6
	.xword	0xecfd98d46396734c
	.xword	0x92fbbdf34f5d7929
	.xword	0x855c83524a0250b5
	.xword	0xb2e230574d7951fe
	.xword	0xbfa276ec5de2ddd2
	.xword	0x94e017e1b41ae257
	.xword	0x2d17132a336984da
	.xword	0x2a64d88069fdb173
	.xword	0x63f72aa1ad0c2a81
	.xword	0x65563ef8ba7e6ef8
	.xword	0xa2c7eaac8d5cfb10
	.xword	0x98293be86a2c68b3
	.xword	0x24817861ae253d5a
	.xword	0x33d6f46bfbb94e24
	.xword	0x778a882399483321
	.xword	0x287a25a6af900db0
	.xword	0xef2e2d5e1977c2d4
	.xword	0xb184f516f07f868b
	.xword	0x1eefc49c5f00870f
	.xword	0xcc49ec2d9e07c14e
	.xword	0xdd6518f6e7100996
	.xword	0x56951edb289e96b9
	.xword	0x9c213b772f7c672c
	.xword	0x653dae2635c18c94
	.xword	0x3824a57083f083f5
	.xword	0xd91dedfaca279d67
	.xword	0x02416f6415eeed49
	.xword	0x217c5e3ff88029e1
	.xword	0x58a85cb6aa5b344d
	.xword	0xf1df9245bbeff193
	.xword	0x067daa75a8e6aad8
	.xword	0x13c816e5bb7438fa
	.xword	0x6860794866b7adad
	.xword	0xa15375f3900ac492
	.xword	0xf3a2409318809389
	.xword	0x0803f6a91c804ee9
	.xword	0xf567d1969250d0e8
	.xword	0x43f9f6a1027a6b05
	.xword	0x2081bfbbfdf56e7f
	.xword	0x68b928aa36fe528a
	.xword	0xd825f568269457d4
	.xword	0xe7add0ffaeec9883
	.xword	0x7f89142630d10d1c
	.xword	0x4ea47d83b5333e56
	.xword	0xeead54d5e9d14d98
	.xword	0xa7e076cb6cbc6d73
	.xword	0x808bad099dedbd52
	.xword	0x63b3ddd7a968c259
	.xword	0xd0ca69fb796f6499
	.xword	0x2ac14987d42c3149



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
	.xword	0xcc2ded90e611c473
	.xword	0x90a11e7b6bfc4266
	.xword	0x0a0b024b5ccd037f
	.xword	0xb04abd29ec206089
	.xword	0xffd4c3ced3d391d2
	.xword	0x9749e0b1464d6d9a
	.xword	0x1ec4044159585ca6
	.xword	0xd9b07f5f0dd9c93a
	.xword	0x1c160f81756176ca
	.xword	0x91784c4eed0da94f
	.xword	0xb108b6a1ad3b6469
	.xword	0xe5b57baeecf0f955
	.xword	0x1fdff879506c5865
	.xword	0xe8393d3859a007f3
	.xword	0x516f3a33eec0148d
	.xword	0x9baf05eefa337207
	.xword	0x0465bc6050fdf7fc
	.xword	0xdaf5b155cad27e43
	.xword	0x104b96faf05f8e57
	.xword	0x825e1d56e284296f
	.xword	0xfec7e45d957a00d7
	.xword	0x99cf22ddd3651244
	.xword	0xbf4d3fa1b2a28a12
	.xword	0x5eada8e1b01727b8
	.xword	0x24e788c4931f777d
	.xword	0xd19b340577842147
	.xword	0x897450d358b51aae
	.xword	0xd156fabe5216efa6
	.xword	0x19ff9682cb00a3e3
	.xword	0xc2435e4c3af39f5a
	.xword	0xd837bd558ab5b55b
	.xword	0x359d7a6770c8fa7e
	.xword	0x431ff82d6097a413
	.xword	0xbda20b0351690993
	.xword	0x98db504b06002278
	.xword	0x60a6fa5a60e1ca3c
	.xword	0xe28dbf9c69c320e2
	.xword	0xed6a612aa8be4249
	.xword	0x5a927ed89761cc62
	.xword	0x425dca5e4d366d91
	.xword	0x5c01dc06c34c81e5
	.xword	0xdd894a58d1db3a21
	.xword	0xf4e053b13c1e67cc
	.xword	0x889b2057a1afee0e
	.xword	0x2ed07abd1d934f6d
	.xword	0x0efac0260cd1f7bc
	.xword	0xe5d13a5ba3bd5eec
	.xword	0xd481db94990ad738
	.xword	0x3f8a1db46e2156e1
	.xword	0x84d3e93332a84586
	.xword	0x035e98b0febe857d
	.xword	0xf71867eb71fb82c8
	.xword	0x60ab3b0d4e2be432
	.xword	0x6978603d78212e5a
	.xword	0xb5acf953d77e2939
	.xword	0x775c7db80e2c2a68
	.xword	0x4cdf3bb4891710c0
	.xword	0x45e5eb6925d9af82
	.xword	0xb168212e2e959edd
	.xword	0x8db1d424d4365284
	.xword	0xfe2ca37342c320cf
	.xword	0x22218e82f1183a11
	.xword	0x41bebab9f6cd7cbb
	.xword	0x027d2ba999039619
	.xword	0xb4311a950a4d1d45
	.xword	0x3512d192f13f46c0
	.xword	0xf82e0cd47885b8b3
	.xword	0xce84ab8d295bb32d
	.xword	0xe5979c3b5ee5c876
	.xword	0xe0d63333cad49393
	.xword	0x72ba35af99b94a75
	.xword	0xb5be617ecc877393
	.xword	0x0257b39694e88d71
	.xword	0x750702f6397269c9
	.xword	0xb01f60bef751178b
	.xword	0xe7d892843cb05287
	.xword	0x293f56dc847aa1ed
	.xword	0x8b350b1576c57980
	.xword	0x4587db6f4da62ecc
	.xword	0x71d69189ea355e50
	.xword	0x38f92d44eaa6eb97
	.xword	0xfce0fdebe30462e9
	.xword	0xa2af4239632f7bb4
	.xword	0xe0f6616250c8f3d2
	.xword	0x81e2fd030fd7186d
	.xword	0xcbac60d7c7f1b67e
	.xword	0xf99e0b479ee50324
	.xword	0xbc5bbfbcbfa675fa
	.xword	0x420666b1cbb1c6d1
	.xword	0xf3fda184bab04353
	.xword	0x1bde9e1d020ccdac
	.xword	0x85da54666b04ab4b
	.xword	0x3d4ee847272988f2
	.xword	0xaed8b22f814b7998
	.xword	0x8e4ec54e9a2b6f31
	.xword	0x4e580b3f8eb5d5ca
	.xword	0x01a33c71bb27245d
	.xword	0xea17f8379c995b05
	.xword	0xf89c0afd6630591c
	.xword	0x7f02b7e138dddce2
	.xword	0x65743b8d0561ad7c
	.xword	0x5ddd0c206bd37100
	.xword	0x94a92da07a07c0d7
	.xword	0xd0455c2d605b8066
	.xword	0xc4a9e46f33427974
	.xword	0xb5dc74b1db1d4383
	.xword	0x1ae297c0f0eaeb4b
	.xword	0x13d1c379f05c99c5
	.xword	0xc0e6eb289d1edda5
	.xword	0xd32a2f354b979e3e
	.xword	0xce14013d241d182a
	.xword	0x951da43fa49e63c2
	.xword	0xd1558d6e87ebf215
	.xword	0x1af0e7a25d0787b2
	.xword	0x7a8fc7681966e6ff
	.xword	0x6f75dd73016f6f0e
	.xword	0x86f0d81b5c4216cb
	.xword	0xaa4d1f6188739523
	.xword	0x48f7b47353184440
	.xword	0xc14a0656dce36478
	.xword	0x4c92695395e2e4b4
	.xword	0x6beb58def74a05dd
	.xword	0xbcd898c44c98e8f7
	.xword	0x7301f4e59c6f44d9
	.xword	0x0dba3b6603a4df93
	.xword	0x0d2c5656059cded5
	.xword	0x4ad7c8cb23125870
	.xword	0xeb98aeab65a76f63
	.xword	0x22b44312e27f1808
	.xword	0x7eafd2d60f596041
	.xword	0x41c5358ccbcdef50
	.xword	0x7d83a2563fe67364
	.xword	0xfd7c7490913aa56e
	.xword	0x11ba5897e0b5c290
	.xword	0x002dc44186e8cb18
	.xword	0x4a566d295bd0ea69
	.xword	0x992881f409c6d7af
	.xword	0x2fc66190fa56af2b
	.xword	0x7db092fc6998f0c9
	.xword	0x35d43ea5ac44e7f6
	.xword	0xa35a8ed39c3af0e8
	.xword	0x99d51942333adb1e
	.xword	0x11595cf1467eee97
	.xword	0x7d1b27959cb74a7e
	.xword	0xe2eda50233e4abad
	.xword	0x715eefd93bac6b1c
	.xword	0x2295c8910f2148db
	.xword	0xdbcac2e2502e4612
	.xword	0x14b00268d24260b3
	.xword	0xedf57fe4f78c502e
	.xword	0xeb63ef91ac21146d
	.xword	0xc8a8e90fd2a0c19a
	.xword	0xe8ac26e99ad3538d
	.xword	0xd428621f3a4e1f5e
	.xword	0x5e1f1ee0653f3f72
	.xword	0x00f9889b697f3d14
	.xword	0xe6e3f773f6ae8633
	.xword	0xea291f28ccfa98b5
	.xword	0xfeb1ed20248c93b3
	.xword	0x4228497d8a0650ea
	.xword	0x85459faece54494a
	.xword	0xfea7ae0d2c7fcd15
	.xword	0x776478fceab785cd
	.xword	0xf30fe6ba659572c3
	.xword	0xd46702d38aecd99f
	.xword	0x2ac492cfbbcf5004
	.xword	0xcb1b2ce9b1fa1a7b
	.xword	0x41eefb52bbed9b68
	.xword	0x6f352d40473710ba
	.xword	0xe781263c7d9a93a6
	.xword	0xe371bb8f2838d51f
	.xword	0xc63605029d685358
	.xword	0x461375e2d90b6cde
	.xword	0x9ab894dcda60ef3e
	.xword	0xfaf42fd740c85898
	.xword	0x1893cf1903a37c8f
	.xword	0x4105892d7cb1f7c0
	.xword	0x37edcfa3cad84109
	.xword	0x087f35a2174f64a3
	.xword	0x7c53291aef3f5f90
	.xword	0x06bbfbc7fe3cfc71
	.xword	0x15c24baad0c9147b
	.xword	0x264257f6b59a9473
	.xword	0x74ca15e5235d7600
	.xword	0x1be6690c7952127d
	.xword	0xb3095ec540eb29c6
	.xword	0xfb0108034509b438
	.xword	0x0ec6cae45d116a96
	.xword	0xd2221f646d0d543b
	.xword	0xa702701f9e73cf1d
	.xword	0x9aae3329cc5e73a8
	.xword	0xf96a231878fe9212
	.xword	0xd3525c1e35826934
	.xword	0xde0764a3715dff80
	.xword	0x2d83098590b7993f
	.xword	0x82eeb6ca1fef3f89
	.xword	0x3a090e12c79dae68
	.xword	0x76716ed4db92874d
	.xword	0xdf02cda09d4f53ea
	.xword	0xbf87d4a2e34eeaf3
	.xword	0x60c50fdb5b6b2d0f
	.xword	0x9764add3bdd5d7ec
	.xword	0x52186cdc1cd71971
	.xword	0x77190aab4db7b220
	.xword	0x4c17f49c8597c234
	.xword	0xa40f480c3d762a3e
	.xword	0xa46501ec09102688
	.xword	0xcaf125e101e2c952
	.xword	0x1f5cb541390139e1
	.xword	0xaf89545167740093
	.xword	0x6d71555212f603d8
	.xword	0x56cb0f030c0fe394
	.xword	0x35df890e516d90a9
	.xword	0xbfa98aba35920728
	.xword	0x94869c843a9ede18
	.xword	0x1f5f123733d5921f
	.xword	0x0729970499c5bc64
	.xword	0x41fccf39c85ec369
	.xword	0xbd16884d018004a6
	.xword	0x000efcafff447438
	.xword	0xc22061cc8e167088
	.xword	0x63c1db6fddfae04e
	.xword	0x1d3afd721c44240c
	.xword	0xa44471a2323d0734
	.xword	0xaede8c5f9dbeba10
	.xword	0x8c8ec7c6052efbd7
	.xword	0xcbba795f997700d8
	.xword	0xae0e9ae3a6871bb7
	.xword	0xe3647a9359dd7020
	.xword	0xde530fe86a5a635f
	.xword	0xa2aa36d1fdd0b407
	.xword	0x4b48b20dbb100b02
	.xword	0xd210e1789b36b5f5
	.xword	0x35cc0e2ca14da334
	.xword	0x95ac1284a9ba1d35
	.xword	0xb62c59f0316d7109
	.xword	0xa73c42c552b9d2ce
	.xword	0x8e783f734d39d312
	.xword	0x4a6b35c48f4fa60c
	.xword	0x6ada99ddb54c0c13
	.xword	0x315f900efea4da25
	.xword	0xcf3dee5b8e6c7b15
	.xword	0x34b8b230bb44cb97
	.xword	0x5b3fa6ef6ba01e5c
	.xword	0x0098f54ff076674c
	.xword	0x0430ecce4e810f17
	.xword	0x23165539eb102389
	.xword	0x837173b994dadf93
	.xword	0x3f8cfa733d047ba5
	.xword	0xbc2cc4f2c66255f8
	.xword	0x47af00777527b71a
	.xword	0x8f4d6c1ceae0c813
	.xword	0xca3d60f2e9b7916a
	.xword	0x5731a007261e5054
	.xword	0x8cc619bc4fc7a126
	.xword	0x03e7fa16febb477a



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
	.xword	0x049e08b9756af02b
	.xword	0xbce80cd2ed54a0ed
	.xword	0x40436d2c1834858c
	.xword	0xca751c06799c8090
	.xword	0xcfbed7556bca8219
	.xword	0x349433ed623dfe55
	.xword	0xc3d805f0e222fcfa
	.xword	0x19f2ff51935290c2
	.xword	0xea6a9072dd0f8075
	.xword	0xef41b34b50ae37c2
	.xword	0x5868b7bd376284fe
	.xword	0xa707e0a9c5cbee0d
	.xword	0x251ab6c565247a64
	.xword	0x699d6cd53f8c1f6e
	.xword	0x8c98b6aa5c61510b
	.xword	0x1388b00004692ff8
	.xword	0xe97c3862396cb8b4
	.xword	0x6365db33d2a1f5cd
	.xword	0x0425049ee1994923
	.xword	0x2f734ecfb2b5a2da
	.xword	0x4290d9ded56fb662
	.xword	0xa86434bc830de236
	.xword	0x817068e09b4e42af
	.xword	0xb41acc64167de7e1
	.xword	0x41305838564f3856
	.xword	0x682f609a56e50cdf
	.xword	0x495b903cb1743087
	.xword	0x3d77eb13f11be084
	.xword	0xae1afae798bb1ca1
	.xword	0xa6c3948f067e9aa4
	.xword	0x8fe6a9486c1cf519
	.xword	0x36553442925374e5
	.xword	0xd02c46ed75c15ce0
	.xword	0xc89fa94c44b7627a
	.xword	0x92b2cfa0199e7681
	.xword	0x9bde24f469edd70f
	.xword	0xdae744f6d7a859bc
	.xword	0x3caa2c0e4002de9f
	.xword	0x6cef5f8956cb9041
	.xword	0xc07557f5f0a8ba1a
	.xword	0xf666d4c933a73105
	.xword	0x443507df83ee100b
	.xword	0xf651862016cf0682
	.xword	0xd64dd8bcc11bf325
	.xword	0x356b16db054cfb2f
	.xword	0x870b3a11b60dc3f7
	.xword	0x919bdf5ec912acc3
	.xword	0x38ce9ad2d0de50ba
	.xword	0xf52538121841b474
	.xword	0x59d75271be92f4e3
	.xword	0xae5aeb3a8ba2b04c
	.xword	0xe03f2a940e1885be
	.xword	0x692cf6575db43637
	.xword	0xa03c94a5cfb4255e
	.xword	0x934fdbc3892689a7
	.xword	0xf2b8059a452495a8
	.xword	0x82935094e3fe4d75
	.xword	0xbecd9cfc18815565
	.xword	0x1e17346838d96432
	.xword	0x1850631b3a6624d0
	.xword	0x868f6fd26047b56a
	.xword	0x3c9766831832d005
	.xword	0x6eefe3c57a86d71b
	.xword	0xfe87bc5dc33688a1
	.xword	0x3447b509b1252002
	.xword	0xaaac9b3282fa333d
	.xword	0xc5f0aa2a1922c7d3
	.xword	0x3bcfa2442844293d
	.xword	0x2af4e7535bc7cd45
	.xword	0x5aa5a40cabee868d
	.xword	0xdfbc0540051f57ba
	.xword	0x9e85cecba78aa352
	.xword	0x8a2b47b81e4cf063
	.xword	0x3e53f69bd8338bab
	.xword	0x1d493fcbdb5b456a
	.xword	0x2e233cdb822e1747
	.xword	0x5cf41102a68f8dba
	.xword	0x6f746aa4a43e39fb
	.xword	0x43361007cd1aa143
	.xword	0xe5a15f69d97f2c72
	.xword	0x4d2547ece0df76fa
	.xword	0x8819cc57b9abd368
	.xword	0xf44ac2b13dca31c8
	.xword	0x65a18fb3ac21bd77
	.xword	0xf29a7e4bc9f2699c
	.xword	0x53a057bce5039f7b
	.xword	0xf93feff96b688b22
	.xword	0x8eba9d2e17063ad7
	.xword	0x8be5259052179065
	.xword	0x5d85124ba6410e7b
	.xword	0x88c972559b4bce3e
	.xword	0xcb472abe8d7604fb
	.xword	0xeb389f4a84b2b332
	.xword	0x4fc7942c73f71c28
	.xword	0x110885a5a8cb434a
	.xword	0xf298cd3624343bff
	.xword	0x02ea1cad60469815
	.xword	0xc55f48267ae0e017
	.xword	0x1ea990edde447e03
	.xword	0x3a0412091f8b4e28
	.xword	0xfbb3dd61b0af455d
	.xword	0x799fc34694542f36
	.xword	0x3b528ec35ccd7417
	.xword	0x04765b78f868cfe2
	.xword	0x5bae48ac06d0da21
	.xword	0x1d1fb20c6a48a61c
	.xword	0x8fd864acef6e3223
	.xword	0x1d87616b8fa10200
	.xword	0x36360f8abc137d72
	.xword	0x45223f2c29470495
	.xword	0x486982d1e87597e8
	.xword	0xbbfc12568cfbfff4
	.xword	0xf7a63d902c649fa0
	.xword	0xf0574352f0057a7c
	.xword	0x2947c14b68b13a13
	.xword	0xdd666736c750a2dc
	.xword	0x4189f95a575b0a60
	.xword	0xd1d585f87f75a9bf
	.xword	0xd29e1deb8b008e7a
	.xword	0x149c3c89da429b14
	.xword	0x08f305c6a8e56586
	.xword	0x5028326a3378f359
	.xword	0xce36c7e40638b135
	.xword	0xf1e39d3c87f8efc4
	.xword	0xab5050b02f1ccc59
	.xword	0x00473941f4019cb2
	.xword	0xbf0c4f8577805ff9
	.xword	0x2e4fe3de2e2cddb1
	.xword	0xb4fc97ffa30880cd
	.xword	0xdd45bba42dfeec9d
	.xword	0xdc3a6670f1b30996
	.xword	0x36db6a52df8bd656
	.xword	0xc4cd485dcfcce959
	.xword	0x655b3d1937531535
	.xword	0x194a176f98437f1a
	.xword	0x7a36589aa09d9dda
	.xword	0x431315f28a25a150
	.xword	0x5b45764d5bc883d6
	.xword	0x0017f9085cd5f4f0
	.xword	0xeb691c1e1ddc95c3
	.xword	0x1b04aea270834f85
	.xword	0xbb279cce9dae2bdd
	.xword	0x66ebd50a39a0445e
	.xword	0x149f3c04c3f29383
	.xword	0x8925c1f346bdc66d
	.xword	0xe36207dac0a9ddc8
	.xword	0x9cc6a8172a709172
	.xword	0x39a04c640936fccc
	.xword	0xe36d74bed3cc0bc9
	.xword	0x57d609a1a7f5fe89
	.xword	0x45f2e404316e94fa
	.xword	0x91fdc549c740ca34
	.xword	0x0683323c6ce1f973
	.xword	0x311b1a46fceedc22
	.xword	0x7cf884b2cc47cab1
	.xword	0x3f8b2895a5cfd53a
	.xword	0xde05c647c8317a45
	.xword	0x4c63431a9b96d065
	.xword	0x639b43d697e6550b
	.xword	0x3873f4299593ed62
	.xword	0x9b49bf4242b5beec
	.xword	0x5b138dd9787e11cc
	.xword	0x87f8dac150266468
	.xword	0xfe04225f261b6577
	.xword	0x7b6c1528b4e1ce4e
	.xword	0x8a72a570b6fd5ab5
	.xword	0x8132204cf108bbc8
	.xword	0xb6bee1dd58d1e0b3
	.xword	0x5e07495a3ab9c9e9
	.xword	0x0767f90b95f6aad1
	.xword	0x7a603679ec68b509
	.xword	0xe96198b94090dd16
	.xword	0xd7af5342ad779bb9
	.xword	0xeb0403a8286d1218
	.xword	0x47b44b4a988e4832
	.xword	0x76387c80c9482a69
	.xword	0x4ec5d2b4d385c655
	.xword	0x100caf59df471c4e
	.xword	0x2755ed4b15c6c84a
	.xword	0x803970c4bde1f73f
	.xword	0x34592573e5b7b37b
	.xword	0xe32ad18d16b9a4c7
	.xword	0x7d9f39166580c531
	.xword	0x2dc919336d5710af
	.xword	0x8706eff5701c45e2
	.xword	0x552a22950959b158
	.xword	0x2d46c5d561342f84
	.xword	0x8b3894070adc0bc1
	.xword	0xcf96794476030d66
	.xword	0x5ca82ad7fd5d6000
	.xword	0x22a107772a19c2ce
	.xword	0x19ba875cc4be12e5
	.xword	0x90110a57c208d6b6
	.xword	0x3719aeb72e5d02b8
	.xword	0xb5436d0f5b07910d
	.xword	0xfad1de057186a586
	.xword	0xbd208ca63aeaf15b
	.xword	0xaf4fafc66df05af7
	.xword	0xc4e22c53970066ff
	.xword	0x21794ba462d5dcda
	.xword	0x58100ed8cb2a20c6
	.xword	0x242bfd54d006b604
	.xword	0xddd4123d1f7274a6
	.xword	0x80a58b8d914823d7
	.xword	0x72274a76c1c4b459
	.xword	0xd2ea897612e347ae
	.xword	0xbbf346e438228db4
	.xword	0x4eadebdac28691de
	.xword	0x7688af0488820f1b
	.xword	0x195ca2e53082c696
	.xword	0x6401a91826c4c630
	.xword	0xe9f36f1d47134d55
	.xword	0x20d4566f58e7153b
	.xword	0x7ca64068d1ec9a66
	.xword	0x3853cada60c8122e
	.xword	0x9b8740d70a1ddf65
	.xword	0x0d0426208cc7d0ff
	.xword	0x7b3d7766831ff289
	.xword	0x6e30fe2c7e405ad3
	.xword	0x1cdd1d81f462fb6f
	.xword	0x36ca9eae6ea567a5
	.xword	0x8eb5026c85ceeeed
	.xword	0x934c857b0f636465
	.xword	0x4f165ea8dd77ec9f
	.xword	0xc0c007ba364a4583
	.xword	0xd65c4a38f15ffe48
	.xword	0x399d5ef19f1caca3
	.xword	0xf2942fc81b3d5ccf
	.xword	0xd158c00b655dcb71
	.xword	0x507355afcb29af34
	.xword	0x90fde145c6543ac5
	.xword	0x28fa2b130edcad6a
	.xword	0x89eb096daa0d4d7e
	.xword	0x385430064a811bed
	.xword	0x54cba351e2baf2d5
	.xword	0x0658a4f24c925235
	.xword	0x9c87e359d55ac91a
	.xword	0x5a216382caafa765
	.xword	0x30604fc117f8dd1d
	.xword	0xdd7c3eb29b24a4e4
	.xword	0xff35ec291c85d8f4
	.xword	0x4c2936e509d54d87
	.xword	0xfb3f2cba06abd1c9
	.xword	0x2df4a57b45bb29b6
	.xword	0x6c5e32817b9b1878
	.xword	0xb1d9b2b624790a58
	.xword	0xb7703afebc37b033
	.xword	0xa2c9c15863fc04a1
	.xword	0xf4638faea2892473
	.xword	0xce6080ec4f336345
	.xword	0x83f84da3d5254b73
	.xword	0x95721a840b1ee98b
	.xword	0x90e911998130c411
	.xword	0x5ffcfc2ca8ec7d1b
	.xword	0x130f84c2a8838be1
	.xword	0xc8c8b77815cf3a58



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
	.xword	0x21339040514cb03a
	.xword	0xecd781ddb26cadce
	.xword	0x7cfce63ea39a3e7b
	.xword	0x29151e17e655062d
	.xword	0x8c36bc11f3dd0ea8
	.xword	0x17689d8c50ac4171
	.xword	0x1236d49e794dc339
	.xword	0x0c126bb160c5093c
	.xword	0xb853c003e212d34e
	.xword	0xa8a72aca0724b2ca
	.xword	0xbf189a0449ea2775
	.xword	0x0690af5e31864576
	.xword	0x58de9fbc594ef17f
	.xword	0x114afadc3ca0de40
	.xword	0x29a1570a669a7df9
	.xword	0x4eb210f4211afd14
	.xword	0xa9e837c151339135
	.xword	0xfa2d659b62fbad7e
	.xword	0x40902c9ebe9d15e5
	.xword	0x95cb7eb2d5848efc
	.xword	0xee02aa3429c56f86
	.xword	0x8f19843f238c422e
	.xword	0x0ed63fb5594ca910
	.xword	0x9de3d6abd8f0be2c
	.xword	0x408d0c553a0f4583
	.xword	0xe4ed5ef8a45e2f92
	.xword	0x85f5f9f95b238fb9
	.xword	0x8191ec91e0b0a0bb
	.xword	0x7fe7ff42b865604a
	.xword	0x6e6c1eb08cc49875
	.xword	0x897914ad6d55646e
	.xword	0x945dbff52b19e74c
	.xword	0xef4992f3adc099a7
	.xword	0x638e835b7329f03b
	.xword	0xac3004ac43456bd1
	.xword	0x0247b401aeedb3b7
	.xword	0xf49ffb157bf15e8d
	.xword	0xc400dfa8c4e9ba6d
	.xword	0xf46735db7e3aa915
	.xword	0x473830b10b8036fc
	.xword	0x44342a7a16de9398
	.xword	0x208009b7e052d275
	.xword	0xbe7c78713390f177
	.xword	0x6d7f604fc287da76
	.xword	0xd31ae1bd276910a8
	.xword	0xfea8b27c7bf4a6ab
	.xword	0xf38dd3e0a2f965b4
	.xword	0x49050af29108065c
	.xword	0x38bf661b92bb6d76
	.xword	0x0ffe76a203003bb9
	.xword	0xec039a5b024ff98c
	.xword	0x49329c5c324ce846
	.xword	0xc66ced3549c574e1
	.xword	0x36a411c6c3bbad29
	.xword	0x8b3041cbcf78be06
	.xword	0xab72feeac23d9e8e
	.xword	0xa706f35cba5133bd
	.xword	0x2aed4cadb47e8bb9
	.xword	0x6d772b13278552b5
	.xword	0x3c0418ad63e6c5a1
	.xword	0x304d50878030b711
	.xword	0xda981f13da4c9b76
	.xword	0x53742ed2dd2d78e0
	.xword	0x377b1a65908bac59
	.xword	0x30cf89cc987f8b1c
	.xword	0xb1933489abb0f37e
	.xword	0xce1404173d1faa83
	.xword	0x3de29dfe2f3f3045
	.xword	0x5df621a09a99bb94
	.xword	0xf3877d76449048bc
	.xword	0x7161d6139ff05971
	.xword	0xc04fec941c88d7ec
	.xword	0xd9d6389ec7ed363f
	.xword	0x4624d3d65554a8a0
	.xword	0xc547561c6b8f0366
	.xword	0xb67fa5738f47c4cc
	.xword	0xb86ed7c10155c806
	.xword	0xe54fe54a510d38c3
	.xword	0xe22487862752a24b
	.xword	0x8dc84263d0f7522b
	.xword	0x68392446a1d78669
	.xword	0x3c6222a7148c8e91
	.xword	0xfbdb0e638977c1ac
	.xword	0x5f1604f57ce35b33
	.xword	0xdd3738803ab8afc1
	.xword	0xdef3dc0435966adf
	.xword	0x990849b852fe29dc
	.xword	0x92f418a98fad9130
	.xword	0x96feb0326e5e8f89
	.xword	0x7ce6fdf91fba1538
	.xword	0x97932be1ff8d8164
	.xword	0xc0ec188d2a36e2f2
	.xword	0xd8bc2002f2f971d6
	.xword	0x3ed7f8c45fbf4761
	.xword	0x8f9159148e367f42
	.xword	0xe71df9e0d998e91f
	.xword	0x02a5e73c98e33c32
	.xword	0x9be98cc9bb8b2a9a
	.xword	0x24e5a178904e28a9
	.xword	0x38fbc7e3ecdaaf50
	.xword	0x25b8934c3c326316
	.xword	0xc2c62eb15e431cfb
	.xword	0x25e096ad002ce1a4
	.xword	0x160a2f67b6032139
	.xword	0xe965e5a9fbee00d3
	.xword	0xf8a138aba9cb8aab
	.xword	0x121e1b7b94562bdb
	.xword	0x23477e8d8601769d
	.xword	0x17512e1608ee937f
	.xword	0xfbbc226bee5c9d80
	.xword	0xe4dcd4a5dd26823c
	.xword	0x137e0d7678774ffd
	.xword	0xf3898010751d9e03
	.xword	0x1dbf50e77e5db2ab
	.xword	0xb527fcb5058f21a6
	.xword	0xa6d43fceffa290e8
	.xword	0x1c75e4469aa74d23
	.xword	0xf9ee3c34a4b1c966
	.xword	0x58b47f43013de80f
	.xword	0xdd9c256b34afb988
	.xword	0x434977bbf19a5330
	.xword	0x8290422badc46a15
	.xword	0x767ead6497d23732
	.xword	0xabd0ccf2ed0ad163
	.xword	0x30db23173fd62d8e
	.xword	0x86ae4e396f822cd9
	.xword	0x2538ba60b62ab09c
	.xword	0x1bd45219d9fd6670
	.xword	0x07b94eaa60df739a
	.xword	0x416755dbe62c230f
	.xword	0x4f55b7df6b5359dd
	.xword	0x52f74380d0b01cf7
	.xword	0x7bdf3cc19cfba71d
	.xword	0x23cca7e4d67da76f
	.xword	0x17d6acbdd6c3422c
	.xword	0x67405aed3a7b4b48
	.xword	0xc7c670b6a65a0da0
	.xword	0xee10a66d3d1e5acc
	.xword	0x35feff70cacbf9c2
	.xword	0x673503da120c70ba
	.xword	0x50ca1da5123b7f20
	.xword	0xbf4d6819b713f396
	.xword	0xa2110bb39f054b28
	.xword	0x0cbeed2973222772
	.xword	0x5fd7792490776e6a
	.xword	0xe3e9170390a52a36
	.xword	0xb91f60a6cd8bed2a
	.xword	0xdc4d8594b2f5b37c
	.xword	0x84ed63e774b90933
	.xword	0xf6ef1c5155a79494
	.xword	0x490e7dd5f71bb2c3
	.xword	0x9fdee2b9c320135c
	.xword	0x799f9ed78d60b464
	.xword	0x69c58083a9270e76
	.xword	0xde10fd3d7e4ccf5c
	.xword	0x84f32c3b75eac355
	.xword	0x4a4f5d291887e430
	.xword	0xeabeb4ece87bda1f
	.xword	0x0fb5a6e09086bb52
	.xword	0x99f1f37dfd236f31
	.xword	0xa27bbb988fdf829e
	.xword	0xce5001ada8425bc1
	.xword	0xccea2a9b30ae4eba
	.xword	0x6f43d4b757dc54b7
	.xword	0x6206857b2f408941
	.xword	0x017965b9ef8af666
	.xword	0x94c6dd22aad1e91c
	.xword	0xad40afdd5dd5d833
	.xword	0xc71ed257da248c57
	.xword	0xcad500a3cdaa0075
	.xword	0x6642544284a33efd
	.xword	0x31f77fa5c3ca9226
	.xword	0x3d6219c3e514fb33
	.xword	0xa097b1dcbc62f436
	.xword	0x487bd042462152ee
	.xword	0x92efe20df95c82d4
	.xword	0xd515661de4207b44
	.xword	0xeeb117fbd18e75dc
	.xword	0x8b40429876e05fa8
	.xword	0x427cf77b2e37347a
	.xword	0xff657046b8223bec
	.xword	0x6eb1b35dc527bb16
	.xword	0xd2efe4ebb8eb0d7b
	.xword	0x0b2ad71ee7d8d93e
	.xword	0x8f4302cd6e6728b6
	.xword	0x8568090a010b265d
	.xword	0xd3c876f42b423c32
	.xword	0x14cab739d691fb06
	.xword	0x110903742b8eb3ca
	.xword	0x91f72133f4208b3e
	.xword	0x2c1c402cac74f279
	.xword	0xd7b1aaba1b3d7d6c
	.xword	0x880ebbf387a38cfd
	.xword	0xd7429cfd28233036
	.xword	0x6e6869056a3d7a56
	.xword	0xc6b507fca026ac9e
	.xword	0x77f00f09a86fe1b1
	.xword	0x2be01e6d664b1c16
	.xword	0x275321240131c7b3
	.xword	0xfc10c5725198239d
	.xword	0xcb8f8f26d2756909
	.xword	0xbf78781a0cee7f50
	.xword	0x5992ef8273f9a92d
	.xword	0x4be5ada31f05300c
	.xword	0xf8139ae57236b07b
	.xword	0x40ea5c7711008405
	.xword	0x8be759384408a82f
	.xword	0x8fd959fd2684cd5c
	.xword	0x0d1abc086042179f
	.xword	0xcef7784583c4169d
	.xword	0xbd4b72fb31cd4bd4
	.xword	0xbbc255250d651894
	.xword	0x8ec72e045b993486
	.xword	0x678343f457b80e8e
	.xword	0xb8c58eb8f329f98e
	.xword	0x753e42c3857d45bf
	.xword	0x01933986c9077f83
	.xword	0x4c10f86eea9a1e3d
	.xword	0x0dbf4dc45cb831a3
	.xword	0x2fbae8b6122a514f
	.xword	0x8cea571f7635eb8e
	.xword	0x2f5fc2644276ab6e
	.xword	0x63154890d13d6021
	.xword	0x8d1daa9aa1433fb0
	.xword	0xa414c59bb7c63202
	.xword	0x2fe9e44c477992bb
	.xword	0x75ea76461582869b
	.xword	0x8db4d6fa2448a3c3
	.xword	0xf13d0eba6b4c49a6
	.xword	0x20e5223f4bae22d9
	.xword	0xc30206e71135c3dc
	.xword	0xd6ec5d1ba39f54f0
	.xword	0x44d60d6f990384e6
	.xword	0xb4a5c4d5dc56e453
	.xword	0x212e57576488a570
	.xword	0x2a5e2ddc1b753c3a
	.xword	0xbca907e44e763f5e
	.xword	0x2001699faaeba27b
	.xword	0x4d61e2f59f3bfcf3
	.xword	0x79d08c5d8861d318
	.xword	0x17f924c4b10a6266
	.xword	0x9a05f8578804621b
	.xword	0x0550655d6d1f9c07
	.xword	0x078e87223692d24c
	.xword	0x0f2d06bb228f7fa3
	.xword	0x134c4c3e49c84a10
	.xword	0xf54f41875531245d
	.xword	0xb969160c054f38c5
	.xword	0x668fdb8a45bfbaad
	.xword	0x8fd28992bebbdd79
	.xword	0x7713d15147f4b700
	.xword	0x9799984f0a581c4f
	.xword	0x7855310e08f79f2e
	.xword	0x08e48872e95c8edc
	.xword	0xe58b2544c3562b71
	.xword	0x2636db17e0ab9f36



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
	.xword	0x910311cbfe9cf839
	.xword	0xa576751bad144745
	.xword	0x9b32e4ae4a7d941d
	.xword	0x1fa68f9463c15e3d
	.xword	0xa70c43023499fb0c
	.xword	0x8074379cf1e3e08f
	.xword	0x4418692752192b68
	.xword	0xaba6d31964d97c5b
	.xword	0xcc1819eb49dc2513
	.xword	0x19dbe0c5dc5d6610
	.xword	0x0dfdeaef7bb93890
	.xword	0x4f419aea24f409ec
	.xword	0x8b36f97b6ff24c77
	.xword	0x75ec382341d6166a
	.xword	0x844f9d7cd142dad1
	.xword	0xaf76d50fce8ef7c7
	.xword	0x7ded16c87d5e88ae
	.xword	0xba1bd41f4834669f
	.xword	0xd0b803c4594d81a4
	.xword	0x2ab8d00b76bb2dcb
	.xword	0x3f7252daa2d55778
	.xword	0x42d06b6947e87aba
	.xword	0x6b00053979f13719
	.xword	0x3dc6c67cc5ec9e83
	.xword	0x8b92674d89d17b4b
	.xword	0x264ebf02c7fd6708
	.xword	0xd7da05ded8a8e78c
	.xword	0xed22dc2d51dbd560
	.xword	0x0ba85daab0714694
	.xword	0xb4f1fbb77f3fdc55
	.xword	0xf67ed97c04d22996
	.xword	0x60dd06bbcacf9a1e
	.xword	0xd9e9ea9ebff7a426
	.xword	0x6344ad0fdb392324
	.xword	0x0d6959ca3532cbfe
	.xword	0x838558a039c650f8
	.xword	0x1d50d0c34ed1ddd9
	.xword	0x740fd7272368d677
	.xword	0xf7cfdbcc3b852568
	.xword	0x5a9bb6cb193b1b97
	.xword	0xab274aa3d0fa051d
	.xword	0xc1fbec7dff6fbf83
	.xword	0x7a1dbedfa6419852
	.xword	0x47d8e621c4ddc90c
	.xword	0x0ea48a5e38ee0755
	.xword	0x4f37d5e2efeae8b7
	.xword	0x9b07b11292939668
	.xword	0xfcec6eb18fe698c7
	.xword	0x9c80aa1bc7e7bc13
	.xword	0x50258f7ae83de587
	.xword	0xdda0aaf57f604bab
	.xword	0x0441330a67db0db6
	.xword	0x6bcc95b7c041301a
	.xword	0xc32948a6a6eaa3cb
	.xword	0xd791e31a56a6952e
	.xword	0xf3391eb92a9cebec
	.xword	0x1a920d2f8b2d16bd
	.xword	0x5139a95e647c5ddf
	.xword	0x42591c9acd50b584
	.xword	0x240a5dc3d068858c
	.xword	0x21a8b485225a51d4
	.xword	0x2834a594176378b4
	.xword	0xdec1cd6f5ab580ed
	.xword	0x88b93482391de231
	.xword	0x136e2241c577381a
	.xword	0x5a55a05b85c318ba
	.xword	0xd304cb160191d52c
	.xword	0xc2b93ad0e9802fc9
	.xword	0xfaf038e1e194e00f
	.xword	0x26be0a6bddc1661e
	.xword	0x1e8c70b321657a07
	.xword	0xaded9bb9491b78fc
	.xword	0x545934d9620b7ce8
	.xword	0xd9649b19cf9ac964
	.xword	0xa6379fd63ec59d20
	.xword	0x4f70af15342d67f6
	.xword	0x0593a7cca5d3f05c
	.xword	0xb38f23925d2d0b6f
	.xword	0x21116830a8da0b0d
	.xword	0xf319ddcdf0aeb04d
	.xword	0x60af4ba379992747
	.xword	0x86cadb9f9ffc1939
	.xword	0xa4b240da78853628
	.xword	0x849ab6f73585de1d
	.xword	0xbd2694549a7a6052
	.xword	0x1aa609f2b4ecb88b
	.xword	0x5253a135202cf77e
	.xword	0x7f57e51b242c72f0
	.xword	0x0d84d29a8d07622a
	.xword	0xeb9e3e05f38803b9
	.xword	0x344407844975d4b6
	.xword	0xb4b78da6f8b57a38
	.xword	0x243b18537ad579bc
	.xword	0x099592e0a705d555
	.xword	0xd5bd60c5ce97c053
	.xword	0xcc47e4642256ab0b
	.xword	0x09d02dcae9b711be
	.xword	0x95a74a50e749c12f
	.xword	0x39e41be1df73e11f
	.xword	0xdf04c500ee4f625e
	.xword	0xa48526320adf1d85
	.xword	0x448c7390e716d7c5
	.xword	0xe7d525b7faac3179
	.xword	0x3266eda0cbc3f1e6
	.xword	0x096cd9fbb7e618ec
	.xword	0x1536b5b1e7f36599
	.xword	0x6d088ed85fd20d79
	.xword	0x129895bb28f04ff8
	.xword	0xe0b37c0d00df86d1
	.xword	0x2d1841125643297a
	.xword	0x08beae374e11377d
	.xword	0x7fc39834218e47ef
	.xword	0x54e0acbe13d33194
	.xword	0x63db84b2c26dafce
	.xword	0x37372ae17aa25772
	.xword	0x7049db85dd0c8636
	.xword	0x15451881c96fdbef
	.xword	0xeeffaaff910b4af7
	.xword	0x7ebb0c35ce3e3bc1
	.xword	0x556627cdcc7337f1
	.xword	0x3543da84874a60ea
	.xword	0x32536829e2c8b21f
	.xword	0x65099ce6dee81ed2
	.xword	0x16b7d063634e7321
	.xword	0x833e20d440d5b79a
	.xword	0xd90067a704d06ea0
	.xword	0x7fe7f21488a45822
	.xword	0xa60133edd9e225b8
	.xword	0x2bd872c1576d7aea
	.xword	0xc3407c880a215804
	.xword	0xd53dc7fd5f13bf20
	.xword	0x32cf5dd596ebee1f
	.xword	0xbce66ae58f9339df
	.xword	0x9e696b9410246494
	.xword	0x4918b44e8f73f0e8
	.xword	0x7521031b2a5ff153
	.xword	0x9ba1706f3f89167c
	.xword	0x703401521799ef7d
	.xword	0xa69f75da05ac858d
	.xword	0x89716bd391ac12cb
	.xword	0x2db9c65d9f2bc263
	.xword	0xfca20c764239f458
	.xword	0xc0603dc8400d25d7
	.xword	0xd8b9984afdffdc5b
	.xword	0x0a3309c053b31d4e
	.xword	0x03a4a3ddab31d860
	.xword	0xdf0c818374783fb5
	.xword	0x8027b5c0f5023537
	.xword	0xa88a160f8ce1e918
	.xword	0x3cba3828d3a5a783
	.xword	0xb88c48383a341426
	.xword	0x659a1ed4f0e63b6d
	.xword	0xfc8b7ca7d3fc66f6
	.xword	0x2fad70d146d815cc
	.xword	0x041554467a54d0ee
	.xword	0x90e8efa0edc73605
	.xword	0x6eaa5d8c076cd96d
	.xword	0x44bbcedf8360bf41
	.xword	0xc73435312f1b5d74
	.xword	0x97dc64b2037df176
	.xword	0x759447e3d6187f55
	.xword	0x22d5c470f09b9a31
	.xword	0x60b4fc3c46a24afb
	.xword	0xba8c14b87414987a
	.xword	0x66735ed611fe4e96
	.xword	0xb9d94df5d075f1ec
	.xword	0x536ea883db151eba
	.xword	0xc4f330e7ea85b0e7
	.xword	0xdabe8e14fd23808e
	.xword	0x7f6d8b6b07e4ed04
	.xword	0xb8d4321a6a160060
	.xword	0x6fdc5a0b56555be1
	.xword	0x326ba2cf05ce20ea
	.xword	0xfdcd9191b6c583f2
	.xword	0xa5eac8109b9876f3
	.xword	0x4d9f3c0c953ace18
	.xword	0x676f258ea92493ea
	.xword	0xe8122e8f86219c70
	.xword	0x4a2fb5db01578a65
	.xword	0xcbb952dda0818897
	.xword	0x9d9551d49bf28981
	.xword	0x80927d4345c6658f
	.xword	0x647f1700a931b5f3
	.xword	0x4feefed13eb8f2f7
	.xword	0x91184f8fdf48684c
	.xword	0xf274d21d4ecbc5d5
	.xword	0x690a10a1a5cf2fc3
	.xword	0x7e6c7e024aaeff1d
	.xword	0x9c1843b24d4fa723
	.xword	0x8a84857a51c83f0d
	.xword	0x1320f8216c3d363a
	.xword	0xc60b36347b467236
	.xword	0x796145e04a3445d2
	.xword	0xee006cd9a6f49731
	.xword	0xcfc93e06382d609e
	.xword	0x2a46c91449f3bae6
	.xword	0xaa62eeed375cfe1a
	.xword	0x23cb7c004132c273
	.xword	0x1cbfe76b162a439b
	.xword	0xae7a5dcc4f616762
	.xword	0xc7317b8e37fa5111
	.xword	0x70b1916cab701142
	.xword	0x530682549806f046
	.xword	0x54b5e566afaaf7c0
	.xword	0x7d183363ff8694d2
	.xword	0x638c9a7eaf918ce5
	.xword	0xcc8252ff68588096
	.xword	0xd58a8a3d2977e7db
	.xword	0x8cb98e1202f328d0
	.xword	0x4ee5918137902527
	.xword	0x4039743d730b3b9e
	.xword	0x5494e63174700de9
	.xword	0x1766d6c844e58462
	.xword	0x2f00dc8b11247a75
	.xword	0x08abf0e150779e07
	.xword	0x7f753c6bada02075
	.xword	0xc7dcaa982ab23960
	.xword	0x896473fd303d1ec9
	.xword	0x9fd5653fe3083a99
	.xword	0xd4022a912cc07482
	.xword	0x6265930f6223d513
	.xword	0x3d4c8cf859424657
	.xword	0x7201d027a3aaac04
	.xword	0x039c8649aa5396ea
	.xword	0x60df9cefda7e7e83
	.xword	0x2f03698d380108d9
	.xword	0x95eba04d730b9236
	.xword	0x2fbe40deed24d59b
	.xword	0x272c45d54d81328a
	.xword	0x6ab9481ef547c0b5
	.xword	0x45bbf7e2e3a3c981
	.xword	0x7b50155695ee5280
	.xword	0x0622053e9ffc1d30
	.xword	0x54c84a4c1de7a223
	.xword	0x2698c70e02929672
	.xword	0x8acb84de009132f1
	.xword	0xda8d098ccb594d0b
	.xword	0xe4dc6c599afd06d9
	.xword	0xc73831bfb8f50801
	.xword	0x9138337667ca490b
	.xword	0xfc649ddb9da5bdb8
	.xword	0xa15e856c22d15aa4
	.xword	0x3b2a10827c50b4dd
	.xword	0xe3531a661b8b91e5
	.xword	0x8065e66f1bfc3625
	.xword	0xaa2e7f4c0eb87477
	.xword	0xb24adbbf88496505
	.xword	0xd3ee780d4ae5ab51
	.xword	0xf93b8655ad9bb458
	.xword	0x383628203f0922e9
	.xword	0xed81d6ccec12167c
	.xword	0xc24b77ec9f0c5f80
	.xword	0x42c3932f232cf470
	.xword	0x1b0b17bd3a9a05f0
	.xword	0xa0b3871bea394df5
	.xword	0x63ff8a598ce3d4ac



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
	.xword	0x7108fda64b805588
	.xword	0xbf44fa2e7cb82557
	.xword	0x704c88437b6db94d
	.xword	0x1d676296671048df
	.xword	0xfd5cbd2fda749148
	.xword	0xde1326d6cc8187e2
	.xword	0x1d42e99766c3c70a
	.xword	0x1de43d1d2169032f
	.xword	0x2f0820318dfb13f8
	.xword	0x49ea163d40aaa9ad
	.xword	0x2b6daa3daa32671c
	.xword	0x2c69cc9e1fc7b1bc
	.xword	0x65b012ce61c8641b
	.xword	0xaffebd2cdd61c5aa
	.xword	0x8e1de46bcb8b04f7
	.xword	0xd6424873e9dda690
	.xword	0xa39d17859426db42
	.xword	0x5677e2c3e36c0a75
	.xword	0xc1f3ce768cbd176c
	.xword	0x05a3f2ca86acdd21
	.xword	0x72b9032262efc7de
	.xword	0xd0bad3e100b8a636
	.xword	0x478af6089ece459d
	.xword	0x77e9c34d9293715a
	.xword	0xe08b03415507d26a
	.xword	0x1bb5afc4d7f4c63a
	.xword	0xaecf2f8df009ef71
	.xword	0x637c81de9940d863
	.xword	0xeebf5418e7460b8c
	.xword	0x6092066f4361ce76
	.xword	0x671c823a0d371280
	.xword	0x925981472525b833
	.xword	0xb91865c88b9bffc6
	.xword	0x85903ac197a3bf6b
	.xword	0xd18aa1d2b080fd81
	.xword	0xa827acd21a0ae9e3
	.xword	0xd2f8f13b3340a87a
	.xword	0x6ef8d0ff9f98e503
	.xword	0x5171088f0ce7e619
	.xword	0x645836904e5e0c3c
	.xword	0xd64727823a536a4c
	.xword	0x027db58e32247e65
	.xword	0xf88854786cc98f1e
	.xword	0xca815d4eb78c0098
	.xword	0xbb8fff4a840578d0
	.xword	0x33b6e2a63a94dd0d
	.xword	0x0f29604003e3432e
	.xword	0x1073955b98fa4db6
	.xword	0x942128eb4ae68947
	.xword	0xaa566d4e9e8cb46d
	.xword	0xe99b192c1f3cdb58
	.xword	0x3bffa0d93f0cbaae
	.xword	0x25c184e2896271ec
	.xword	0xdf77331f16bbfbc8
	.xword	0xc54e91495398c82a
	.xword	0x7d918040da85ddc9
	.xword	0xf8a63dc58638f633
	.xword	0xba60693d59f93b53
	.xword	0x03f1f1147588baab
	.xword	0x49cf6c0818bab0b5
	.xword	0x7b2529604e78edd6
	.xword	0xec41d35f4797dfef
	.xword	0xf74b97e8b7fdf343
	.xword	0x245549547b0708a8
	.xword	0xaaa7b0317cd97d62
	.xword	0x56dd26dddaf008f3
	.xword	0xaa168901e597db4b
	.xword	0x293558b9b0d503de
	.xword	0x4bde6ad3feb98374
	.xword	0x3da0119d921e9e9e
	.xword	0x977cf19a785bbd45
	.xword	0x846b0581e807443e
	.xword	0x1b9a63c3b23286d4
	.xword	0x0567bc81f470c36d
	.xword	0x91901e5b658c535b
	.xword	0x4a5b36c36d91ce53
	.xword	0x017d8e52e628ae92
	.xword	0x943ed8e6fd9fa73d
	.xword	0xac88d50969f625e0
	.xword	0x573000d23a9f47fb
	.xword	0x88f1adadcd16b6bc
	.xword	0x2cc6447ba2fd94d2
	.xword	0xd9cc5d18490f90b8
	.xword	0x19abfc62d74e2836
	.xword	0x8c3c60a1ee470ede
	.xword	0xe6a31bf37a6ef518
	.xword	0xc3f7ae7dc695f1aa
	.xword	0x4728a663e4adffb6
	.xword	0x4395ec9a12f682d9
	.xword	0xf3204485f7e86f24
	.xword	0xaa24a2e4599f31a8
	.xword	0x05b80fc51b82e497
	.xword	0x898dc9ac2bc14a43
	.xword	0x2c66a45d9e9720d5
	.xword	0x204a3ae4390641df
	.xword	0xa6375bcf309d6437
	.xword	0x18be92b245a6126e
	.xword	0xdbe2187b14814325
	.xword	0x5afad86a23d4cde1
	.xword	0xa9d449709318279d
	.xword	0x9a4ca64a8018f849
	.xword	0x17c648b57cb17b28
	.xword	0x1612207b1e311c66
	.xword	0xb000638fe85f5642
	.xword	0xf44a5c161f1170ed
	.xword	0x830c7e3c31bdf35c
	.xword	0xe1bc8a1ba306f3ac
	.xword	0x6c3b6eac83cff03f
	.xword	0x650bbf28230ec095
	.xword	0x67a3f73043443193
	.xword	0xd26418fb3768245c
	.xword	0x697587aa725596c8
	.xword	0xbee1ad06ee2ef7eb
	.xword	0xe86bab4241fefe3c
	.xword	0xf515c413bee1e994
	.xword	0xcef27da279c2e1f5
	.xword	0x04ca621ec7fe5f3a
	.xword	0xb8865e3a73cb35dd
	.xword	0x1d7268296f7c58da
	.xword	0x4a460e4a4471e885
	.xword	0x9a2cfaf527067827
	.xword	0xb5624ca4ed6500fc
	.xword	0xccc83dec03c2fe0e
	.xword	0x41d7c1c98da0c5c5
	.xword	0x0dcd0263bd577660
	.xword	0x2a9df6214688117f
	.xword	0x743099144b4cd53b
	.xword	0xb1585ae2feb8714b
	.xword	0x2367a6b1eea2a65a
	.xword	0xaa5312b7c47459f7
	.xword	0xd20208ff39e93bf1
	.xword	0xe17f5775a133ddfa
	.xword	0xe639abf70029d880
	.xword	0x99a2cc28e09c688e
	.xword	0xa4c5091669061912
	.xword	0x90d4249760e8d6db
	.xword	0x030db0ac41450959
	.xword	0x8a706e35eaf2cc00
	.xword	0x19b2e910c875786c
	.xword	0x574f30055b2ed78f
	.xword	0xfca09a2d1ace5cb8
	.xword	0x135b1b104c7da1b2
	.xword	0x0ff7c3052bb9d919
	.xword	0x7f7f0a2a16f635e4
	.xword	0xf83f134112edc0e3
	.xword	0xc8e06c3cf47df90b
	.xword	0xbfcc2e7696f44688
	.xword	0x096d7e5a84de6c85
	.xword	0xa8dc20162f9c87b2
	.xword	0x7419e823cfcb9941
	.xword	0x78be0192183166f0
	.xword	0x709ce091627193ac
	.xword	0x80f160dd80a77ee0
	.xword	0x9c07abfeac0c47dd
	.xword	0xb2a48bc7300580e4
	.xword	0x599c8bcac51085f8
	.xword	0x1b9825609a0d9527
	.xword	0x7504a5979bfd8fc7
	.xword	0xc20e8a511d2c675f
	.xword	0xe40f29d74b14ffb6
	.xword	0x5d6f87bced9b9af0
	.xword	0x5f58e3596e067569
	.xword	0x3af5ddc2ae09ff94
	.xword	0x8c9f89ea432f8d5f
	.xword	0x63c93be2be68bdbf
	.xword	0xca3396326b26fc90
	.xword	0xa2e1e0a76c29fdaf
	.xword	0xdb8a85797ecf403d
	.xword	0x0f03778f62797933
	.xword	0x418c317ac07887ae
	.xword	0xbb029463403575b3
	.xword	0xd28b60c3e246c836
	.xword	0x7da6783c93fecac4
	.xword	0x1b7677529bbfb711
	.xword	0x397d5fa3d6ebb3be
	.xword	0xcf2da22cc971d1f0
	.xword	0xd84f13707c4e6f43
	.xword	0x4abf43b3aad860d8
	.xword	0x9fce959efa760faf
	.xword	0x74e96d367f65e10d
	.xword	0x5603edf2ccddbf4b
	.xword	0x85057958da2fadc6
	.xword	0xbefb4b3c95286a94
	.xword	0x3651c6b0b6f8e735
	.xword	0x07fed0511a9e1ee6
	.xword	0xffc984319449a07a
	.xword	0x9c0fd7a31cb211fa
	.xword	0xf36c16e054f1040d
	.xword	0x452844f1c452e961
	.xword	0xc197c31b5e22eca8
	.xword	0x0435056b3c390acf
	.xword	0x1d3785ff5033c675
	.xword	0x738ebb1cf6d247a8
	.xword	0x095c1939bad8e4c0
	.xword	0xdc3efb2ba3a0c1fb
	.xword	0xa260ab16ba86cf26
	.xword	0x2ecfa303058ddc60
	.xword	0x82998fe199ef5860
	.xword	0xa95f4595eaa9a45c
	.xword	0xe6c15d8a4fc9c4b1
	.xword	0xc8f09ef5760d8090
	.xword	0xb64d2c753c8eea24
	.xword	0x53a63d4536a261d8
	.xword	0x5929358ce6a2ae03
	.xword	0x31e69142219cb0b7
	.xword	0xd383c9ce7b698533
	.xword	0x29d9116939c84652
	.xword	0xec868c06e8cdf9c6
	.xword	0x0ac01e20b8309452
	.xword	0x6d5d8ed364f4cf98
	.xword	0xe124ce7cc40cbe2a
	.xword	0xebd4fa4807be1eae
	.xword	0x5a32d45d5f834b09
	.xword	0xbe84c645ea23aa91
	.xword	0x93a9f7cfa7bd06e8
	.xword	0x67be3e468b5c0bc6
	.xword	0x84be9ac1a41b7279
	.xword	0x45407341a31ff1a6
	.xword	0x59a13a5140c77c96
	.xword	0xf012ef550f9afbb0
	.xword	0x998a43dd831897ed
	.xword	0xc87a0a6fff58adcc
	.xword	0xf39e4cfe973eb7c5
	.xword	0x611c938b73750347
	.xword	0x0dd8398b234255fb
	.xword	0xb96a2a0dfaf16513
	.xword	0xe5f546135554d4c2
	.xword	0x841ef89a817b4b74
	.xword	0x2def86127d1cbcec
	.xword	0x4752c48b36edc7df
	.xword	0x9034eca22c43c24f
	.xword	0x51b1f20f109807e5
	.xword	0x560de1ecf65cd3ea
	.xword	0x9d360d69515cec81
	.xword	0x3b92b3b808447051
	.xword	0x1e600f10abcb11b2
	.xword	0x10e55d1aefa1c409
	.xword	0x38ca2aa7ec5bed5d
	.xword	0xf0f863618f55976b
	.xword	0x7db9ed16a4458aba
	.xword	0xd2a2d943c23fc482
	.xword	0x006a5799a66e7d55
	.xword	0xd3694040e6287467
	.xword	0xec2da808c2387ea0
	.xword	0x132c2019cee3dd35
	.xword	0xacb403896c7aa172
	.xword	0xe4fa677071a128b8
	.xword	0x9d60514e051eb7fe
	.xword	0x7623da4cf6c5164f
	.xword	0xbad1c48a1f137a9d
	.xword	0x66952b1455dae8a3
	.xword	0xdb4d571782d50201
	.xword	0x33781dcf539dadad
	.xword	0x8482429b074d5ebe
	.xword	0x036a46be68631078
	.xword	0x856f727af4eca81e



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
	.xword	0x42a5659bfc74f375
	.xword	0x4d02b053881fb1a7
	.xword	0x191e768268f1634d
	.xword	0xbd2e96ef75423e42
	.xword	0x7ffeab5ee176e6e5
	.xword	0x0ba788fd18e0ec50
	.xword	0x281ec9f278621c10
	.xword	0x5599947eb0743114
	.xword	0x1ae80d3e0ce79ea6
	.xword	0xb252f9021c42f117
	.xword	0x15c9f6f6831fc53b
	.xword	0x5bdaffb6ac0e09f6
	.xword	0x35141793180ef41a
	.xword	0x5bc571fd21fb5c60
	.xword	0x8c028f94c7a89fa2
	.xword	0x59205a07a7753cc7
	.xword	0xd01f8fd98ae70153
	.xword	0x2a9c84b7911ffda3
	.xword	0x982cd4be85b526b9
	.xword	0xfca3c1487114b5c0
	.xword	0x9323d6804fc0683d
	.xword	0x00793094491b6382
	.xword	0x9228ad1b181f404e
	.xword	0x6775182dd5844ca8
	.xword	0xbd2b8c8a5da00b5a
	.xword	0x244d3dfd9da7321f
	.xword	0xbf0ad967c4d4a6db
	.xword	0x50fdfe885f2d6a67
	.xword	0x5ddae73c63bd551a
	.xword	0x3c4c7cb38e69dad2
	.xword	0x14edfdfe9e001347
	.xword	0x6f7f6e2ebe4ae521
	.xword	0x05340d7f23307838
	.xword	0xc87eafff36b45aa5
	.xword	0x5561d174cac5d546
	.xword	0x557578fab82cf2e2
	.xword	0x35dcd964617b2c58
	.xword	0xdc004d0dfe7b3231
	.xword	0xdf59edeecd131a9c
	.xword	0x075f6a4bfc97650f
	.xword	0x68eeb34f539ba510
	.xword	0x0b95f7d39c159ac9
	.xword	0xf05c5e44003a7a53
	.xword	0xd074c2c6df35b328
	.xword	0x0102f5fe741ad874
	.xword	0xe9fd52de1ebbeb5a
	.xword	0x5b8d483b6e5c2644
	.xword	0xeab0fde47d955c2b
	.xword	0x211567c564a7c73a
	.xword	0xa8426449b48cc4f9
	.xword	0x4309c9df976c5895
	.xword	0x64a55c4ff203ed56
	.xword	0xe2f1e2bcda291048
	.xword	0x2a5d5b0b3d3c275f
	.xword	0x848e846ad7bc383e
	.xword	0x535b579258e51254
	.xword	0x53e96073cec9562f
	.xword	0x4b6037b7f9590814
	.xword	0x03e9d2575e077682
	.xword	0x7555ca1e9a56a069
	.xword	0x65032a5e04970585
	.xword	0xdc3ae526db05e683
	.xword	0x685892857d4f7702
	.xword	0xcee4161ae7a73b37
	.xword	0x0060963de282e86e
	.xword	0xdfb32576228e4188
	.xword	0xa5c95060085b8116
	.xword	0x024cbe7786e4e853
	.xword	0xef695f70c4ebc16d
	.xword	0xcaaa275655db6059
	.xword	0xb6be93f6ef200c19
	.xword	0x840fad84ee5f1381
	.xword	0xa409fbcc4278bbff
	.xword	0x00584114c1aa9b52
	.xword	0x5678df0d827d5405
	.xword	0x857931588538beeb
	.xword	0x61783b13a47784fe
	.xword	0x1c050849a31c1b5e
	.xword	0xf77974ec31e818ca
	.xword	0xb0bbb4ab6b9dd43c
	.xword	0xe2b831b6cb3a9e83
	.xword	0xbbc7a1ed6f7a6be2
	.xword	0x7364fc7e58927396
	.xword	0xda86ebf037bdc479
	.xword	0x83f1a4b2de93300f
	.xword	0xa3beaf1343b8d326
	.xword	0xedaf3cd73cc4691a
	.xword	0x972f9ef819b3d053
	.xword	0xa369554d8e1186f3
	.xword	0x7d7e64dce2f5bdc9
	.xword	0x43e1023be29efe32
	.xword	0x495e5e500d541950
	.xword	0xbbde81e507da49c1
	.xword	0x821f012dc68f3dba
	.xword	0x56ed53f1c9ba35ba
	.xword	0xe5724d8c422ca70d
	.xword	0x52736f213acb18e8
	.xword	0xa83c28ebe2ace736
	.xword	0xa91b7672f5a39ee8
	.xword	0x5093a6d51b546b91
	.xword	0x5eaf008a7bcf6dc9
	.xword	0x0c46b73fb7f554cf
	.xword	0x9eb475fa958dd0b1
	.xword	0xaf6cfb99180dca45
	.xword	0xe89061f042d2b008
	.xword	0x52e82871766296dd
	.xword	0xe5d0984ee4611e8c
	.xword	0x0625c18361557c0a
	.xword	0x693566aa0faddeb1
	.xword	0xc52394d641004988
	.xword	0xf4ca961371ea5500
	.xword	0x670f4b641f1eea51
	.xword	0x3f005965ea1f65f9
	.xword	0x51054bbc6f8d1a25
	.xword	0x8f23050f94ca3870
	.xword	0x071a1f072e80a02f
	.xword	0xe11cca3061615361
	.xword	0xf0b506215a4082df
	.xword	0xaa166e1cfa7e8045
	.xword	0x7ad6a09cf391922a
	.xword	0x3e17dbf3c2244585
	.xword	0x860fdb43ca51f5d7
	.xword	0x1dee5163a40719d3
	.xword	0x925b8098860a3890
	.xword	0x9973fde233cbf5c5
	.xword	0x66ed934bc32956e0
	.xword	0x552918cda0697020
	.xword	0x4e09cdc72e1a1d53
	.xword	0x2b8b668e0ca31767
	.xword	0xfc8f0e39174ee6e9
	.xword	0x79a712f5da0adf23
	.xword	0x744464a5ce61d66a
	.xword	0x88ac2bb68f4a2010
	.xword	0xb4e5d238ff966636
	.xword	0xe8eba17277cbbf61
	.xword	0xc23045c7df126315
	.xword	0x4d14c1085dc86103
	.xword	0x41890c3dbd8a8f31
	.xword	0x4bcf8174b0625d69
	.xword	0x310dbdfd0a7a5595
	.xword	0x85305e9c639d01ae
	.xword	0x9434510ec7f65c2c
	.xword	0xa080fd20739ec062
	.xword	0xc185c59f338178d9
	.xword	0xffdf296b0628a9db
	.xword	0x336694e77461e81d
	.xword	0xd58014800009f4e4
	.xword	0x0aac9d00c9e03c84
	.xword	0x5db2277ce50b8612
	.xword	0x24ff44cfbca1ce26
	.xword	0x1ace8d63490bec30
	.xword	0xc950932c016a4bb6
	.xword	0xc5d832be908b6960
	.xword	0xebb8dcdb4825d36c
	.xword	0xc01114e314d22304
	.xword	0x5e5b969ed9b80020
	.xword	0x0afcb9ca66a0d48e
	.xword	0x4192b4d3afe8ccd5
	.xword	0xd92cabd2c4c086fe
	.xword	0x68f94e21c51f34cd
	.xword	0x42b1709cb2966aa3
	.xword	0x692584abecda9149
	.xword	0xbe9422e382c1d90a
	.xword	0xb8578fdc0f7add49
	.xword	0x20fa9569911d08c2
	.xword	0xdc243adeb097e86e
	.xword	0x29b87b0134d5f0de
	.xword	0x554579fd4dedbecd
	.xword	0x0b5285cbe46ee728
	.xword	0x05d226d14e089073
	.xword	0x23e918f54d5d40d9
	.xword	0x399db1dda778a1af
	.xword	0x676ede7fe9e191c7
	.xword	0x8a25509620595ca0
	.xword	0xdd9861a3a81c6894
	.xword	0x5f36572e0021998e
	.xword	0x3e8c034e93b7613b
	.xword	0xdeb6aa4f26aa276b
	.xword	0x0a09c9cccd327551
	.xword	0x3a4f7f820d5199ec
	.xword	0x4c4bb1f16891ab04
	.xword	0xab5576039c7f44a5
	.xword	0xe80541ebe4e0bc09
	.xword	0x4d21aee6c727002c
	.xword	0x50b825ed42907d24
	.xword	0x3d3e724fd9c4738b
	.xword	0x9c0a39697143107d
	.xword	0x6bf5fb4d05f22557
	.xword	0xdbc0a95767f3425c
	.xword	0x86bc1f0a40059038
	.xword	0xbf28b1d7b8e933a4
	.xword	0xda92ccf74b9e4003
	.xword	0x13567517d32af7ce
	.xword	0x044897421c56fa77
	.xword	0x6cc0f59f13fb4a92
	.xword	0x2234411c0498c89d
	.xword	0x8a9e9eb274af9f26
	.xword	0x354be7a9375b4822
	.xword	0xc347db57850e3420
	.xword	0xb9b1b9e403f04906
	.xword	0xe1c0770ffabeca0d
	.xword	0xfc3d32b251c30e57
	.xword	0x0000368ee48ad259
	.xword	0xf0148c3628dff4a1
	.xword	0x564314e47644de96
	.xword	0x90ffdcb8f4695b35
	.xword	0x7e1a93642f2aedb3
	.xword	0x7a33f150c6fd8a8a
	.xword	0xbda4b3e67f805e91
	.xword	0x2494e7ec3447f222
	.xword	0xba5ad1821c482144
	.xword	0x3ba0a6f2340dcc13
	.xword	0xf36fc42829f227c4
	.xword	0xafeda37c0e96fdab
	.xword	0x68d4fb25cd216568
	.xword	0x90a94baa2199e467
	.xword	0xf62d3c816737995d
	.xword	0xf09118310bfb5eee
	.xword	0xc6544a92577c57eb
	.xword	0x2841d70ef2ba836a
	.xword	0x20443a929bf55a1f
	.xword	0x08340fa12e9af4c7
	.xword	0x05b3367b2b841676
	.xword	0x408770b35916c66d
	.xword	0x1e738af37fc9b0f0
	.xword	0x1d3a157118be82f1
	.xword	0x3c2ce57252e43e3b
	.xword	0x9f3ac6ecbcfc1981
	.xword	0x27e0b12f50c9b006
	.xword	0xc901a7f9c4aaea67
	.xword	0x3a4dc8e5f8b62105
	.xword	0x7c4f2b8b7ea733c8
	.xword	0xd1c8edbd309e6c53
	.xword	0x613c75c1b8d83112
	.xword	0x564a187e9e5c6a04
	.xword	0x60e6f552b2e234e5
	.xword	0x5b5e280d65c85e29
	.xword	0x46362dcd45cb7b3e
	.xword	0xe161227ad947c055
	.xword	0x67f3136567281c8d
	.xword	0x9a7338954b5fb4e6
	.xword	0xfababab87e42a15c
	.xword	0x16afc10f9d621128
	.xword	0x40b5bcb028d0fadf
	.xword	0x887c2eca9a13f3f3
	.xword	0x5d7900d7691af324
	.xword	0x327fa0c1919552a3
	.xword	0x00d2c459ada4b229
	.xword	0xcca2f2d445339508
	.xword	0x957a3fa58b204ece
	.xword	0x5f80a613a01f3453
	.xword	0x62d6491cee53ef6a
	.xword	0xb3d05877f16858ac
	.xword	0x8fb59d9b09f106b8
	.xword	0x582eb5d445d4de6a
	.xword	0xc0e9446875c7f3cd



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
	.xword	0x42ad8e5616824a66
	.xword	0x6f00c74ca69c7b24
	.xword	0xd73ed19396b791b1
	.xword	0xc1e4db6846e7d35d
	.xword	0x41122372799cf692
	.xword	0xb746d2788b2bed34
	.xword	0x39f1850fe8946e78
	.xword	0x7d1cdaabf3f4681e
	.xword	0xbf1758396b31bc1b
	.xword	0x5695550c64e4d21a
	.xword	0xd5566aa3a5783f5e
	.xword	0xb071f0a9a1276ad5
	.xword	0x8890617f2a9be53f
	.xword	0x142e47802f5cf67c
	.xword	0x8df665729d62d217
	.xword	0xb63c497564ead85b
	.xword	0x30608927ad1dbc44
	.xword	0x1d8811bd44e64d2e
	.xword	0x4192ddb5b56e0205
	.xword	0x3f7fc70211d5d41d
	.xword	0x3bbd96f6f0cb55f0
	.xword	0x6230bf4a55eb79ad
	.xword	0x5e2bd8b29cc70746
	.xword	0x0cd25c457006ceda
	.xword	0x56378dd55d78ee18
	.xword	0x52316e1ff905bd48
	.xword	0xaf4a19995fd78a5b
	.xword	0x2d9cf8c99c7ee05b
	.xword	0x6c15d137d83a74b5
	.xword	0xc6dfa2f90338088a
	.xword	0x8b73d9d751a71a49
	.xword	0x8c58ca9d2826d2cb
	.xword	0xdab1557d859a9006
	.xword	0xb8a23235f6e18b68
	.xword	0xca244eca04ca8818
	.xword	0xabc205036998f0b0
	.xword	0x104d5762199385ee
	.xword	0x037f471e058a634b
	.xword	0xff23c4913929a4c8
	.xword	0x71561b28ae5a1558
	.xword	0x4c0d72755c3d538e
	.xword	0x699c87b1e787ea97
	.xword	0x7b47ea583bceb51c
	.xword	0x80823ec1c1ba7554
	.xword	0xe0914e2d9c3d3171
	.xword	0x6bb0ce3564b4a4f4
	.xword	0x5e6145ff1d979b48
	.xword	0x74eaed72e81c4348
	.xword	0xc3c250649e58e9a0
	.xword	0x430c0435d2700a36
	.xword	0x0fad6dcf1412955b
	.xword	0x46d7c7616e179fc2
	.xword	0x7bb4e26a48231a51
	.xword	0xc7001445980c2cd0
	.xword	0x445c5ded073d1a11
	.xword	0xaabc2bfa595819ff
	.xword	0xd5f6060bde030cf7
	.xword	0x7e4c781a3dfda6cd
	.xword	0x82bedfb35d32bbb6
	.xword	0xece6bc36f3778879
	.xword	0x47d9c18e713a1f1d
	.xword	0x7e838709179e6eba
	.xword	0x8a107daad6473314
	.xword	0x5d0033d8c6156752
	.xword	0x47afd8d307dc016e
	.xword	0xffbccab0ce45708a
	.xword	0x349161691d570045
	.xword	0xa3df6a46320b7190
	.xword	0xe1c68343e0205e7f
	.xword	0x20edc926cd8c24f1
	.xword	0x3c9d98d48a879e47
	.xword	0xe65632e9241a869f
	.xword	0x6c603e7c991d255e
	.xword	0x485145ca76aab39f
	.xword	0xf42dc7ffee843428
	.xword	0x9e9178a54401e85e
	.xword	0x1008250251059bf8
	.xword	0x315b5e2b04945bb8
	.xword	0xc90d90a4fb92ed06
	.xword	0x0b1c5485be2c0758
	.xword	0x8870511937e2152e
	.xword	0xfb076776ed351b91
	.xword	0x36fb06549dec2547
	.xword	0x34734073aa8ae7de
	.xword	0x22065355fdf22272
	.xword	0x35cdaf969542b53a
	.xword	0xc43da078eddecb21
	.xword	0x082e0717e80c9f5b
	.xword	0xde38d81c6cf43be7
	.xword	0x188f01e2fc088cb2
	.xword	0x355b45e04a6758f6
	.xword	0x0bcfee8e9ed31448
	.xword	0xa0a41b50eb95b384
	.xword	0x667f713a18edaf71
	.xword	0xa3bb912376f4f599
	.xword	0xa391376532e85489
	.xword	0xe6766fbf73e25091
	.xword	0x2c0c28a3d6a8f3ea
	.xword	0x3a3be4e0d589b523
	.xword	0xb05c56d45e5d7b6e
	.xword	0xee4ccc2b4c373e55
	.xword	0x9677da9d12d691bf
	.xword	0xcfec0c808eab7437
	.xword	0x37ea748b3818d4d2
	.xword	0x282f65cdc010188d
	.xword	0x5d0bddae84b82c5c
	.xword	0xc35b96060bd8e565
	.xword	0x28df05a0b3ef4ba0
	.xword	0x492e53b7a87dd11d
	.xword	0xccc5ae0fc27e1e12
	.xword	0x803708e70290a722
	.xword	0x40243e6df1aa07f3
	.xword	0xfff4aefc81fb5620
	.xword	0xbeaf339a62f0e16d
	.xword	0x57c39386dac6b84e
	.xword	0x7521593dd6e22953
	.xword	0x2d5ba833aa047d24
	.xword	0xaf57cb48ca03ee76
	.xword	0x62b1fce170d81431
	.xword	0xf5cb678d66a9ec45
	.xword	0xde939035c134c80b
	.xword	0xaf167d193ba9e64d
	.xword	0x3df1e12ac299fa6f
	.xword	0x3ffecd59fd080470
	.xword	0x5263b69d5f31b221
	.xword	0x2eb334a7babccab6
	.xword	0xc29bbf28a8fc7c39
	.xword	0xe825446e4490ee24
	.xword	0x3bd736a0cbe56bf8
	.xword	0xf1e554a508702d16
	.xword	0x2e21429bcf0f8d7d
	.xword	0xf666fe3703219c46
	.xword	0x40cda1739daa993d
	.xword	0x4ead2884761342ea
	.xword	0xb827dbed758750a2
	.xword	0x94529bfa23868564
	.xword	0xb8d70944f2ca347b
	.xword	0xd37f93479336b553
	.xword	0x9e695c54ae280c14
	.xword	0xe728333ea2a9393b
	.xword	0x0fb9f977f7d6199f
	.xword	0x2bcb3b60be318d8a
	.xword	0x44721244df23ca50
	.xword	0x769390d31df75fab
	.xword	0x8b76ef05ccdbe141
	.xword	0x1f9fc36f7e05a984
	.xword	0x3634a1d077d7d7f5
	.xword	0x9aea4f3d79736be6
	.xword	0x52855651141f976b
	.xword	0xf8639e4cee800dcf
	.xword	0x41a4c464c18b5de8
	.xword	0x13a39593beba4fd1
	.xword	0xc47de1d2dbec7805
	.xword	0xcec5a82e9205c840
	.xword	0xb0663b47cf8bd0a3
	.xword	0x98b225c64d37f12a
	.xword	0xaca0af6cd5510aef
	.xword	0x73352d7fa2d67df6
	.xword	0x3eb72b75150dfc26
	.xword	0xbf11e8acf423d05c
	.xword	0x70e7e86e6de7a33f
	.xword	0xba46da1e60fa147a
	.xword	0xc9c1add16784fcaa
	.xword	0x1aca129d91255f3b
	.xword	0x246b8e86242bdfd4
	.xword	0xbd9294a60534a249
	.xword	0xa7c462093467be5e
	.xword	0x0a46a7ad4ae138c9
	.xword	0x01cd038bdd000cb1
	.xword	0xf25aa24245832517
	.xword	0xdd16e77a35840e06
	.xword	0x1a34c341ee75c894
	.xword	0x9e369babf441145d
	.xword	0xeec57b9efe344553
	.xword	0x3b84fc7ee1666792
	.xword	0xee2aeed446931d72
	.xword	0xd6bd0cf1def400ef
	.xword	0xbd2041761aa446ca
	.xword	0x95bd482412d00d4f
	.xword	0x23693d7f40c7d2ce
	.xword	0xefe8bdb0028bd689
	.xword	0xd16746de4a99cab6
	.xword	0xb2722893a08f28ed
	.xword	0x09bd1c65f2babc05
	.xword	0x4f90acb171b7be9a
	.xword	0x425a8a569590f93c
	.xword	0xa8a4d34e0f1f1a89
	.xword	0x5d95afc0a58ba60a
	.xword	0x61fc6c9f75737ddc
	.xword	0x08ab0e3ebe37c6b0
	.xword	0x7ca2668945ff3cc5
	.xword	0x472891b7b766b1dd
	.xword	0x7ad40b28ca6cdea3
	.xword	0x73487fb30b1c0b9d
	.xword	0xeb4922befe2ebde5
	.xword	0x8d8fefc08dfed746
	.xword	0x23a1e20f8420e6ea
	.xword	0x8529ad0bdb5a4cd7
	.xword	0x2ebda1542129c24e
	.xword	0x3a3ee3e9add5c3fd
	.xword	0x10f9ebe160aee305
	.xword	0xf4c401c0c0b4d828
	.xword	0xbd2aa7bb3f38118d
	.xword	0x300d623db8573d33
	.xword	0x91756983ac957789
	.xword	0x97a4f97dc9d8d829
	.xword	0xcfec0a555bb7c015
	.xword	0xeed92e5c6c3b8595
	.xword	0x71421e58b6343872
	.xword	0x0fb456828180469f
	.xword	0xc3d5ee6444c1bd24
	.xword	0x9c769bedca0b348b
	.xword	0xfe8b88fad709b973
	.xword	0x4e0ae43135543d7a
	.xword	0x8a85e3a876631fd9
	.xword	0x0e8deb70f40f72d9
	.xword	0xf750357c684604ff
	.xword	0x6352ddf00f3b1251
	.xword	0x243416644b9544bd
	.xword	0xa236c4ee392c954a
	.xword	0xafe966e929f99476
	.xword	0xa2094ee4d210993f
	.xword	0xa74ea6bd1d805695
	.xword	0xf8af51d1c9836746
	.xword	0x3d2bb6418540c098
	.xword	0xf1bb4139d908a190
	.xword	0xfbb2073b1f41f91d
	.xword	0x80230af0533700e4
	.xword	0x5361339b15b33378
	.xword	0x410ef87c6c4e7a9a
	.xword	0x4fae1d704c7b02a2
	.xword	0x532e71e831d84d7c
	.xword	0x363b569e1f49a43d
	.xword	0x515aa2172ac63939
	.xword	0x1f3f642ad6f6a2c5
	.xword	0x541cf02625b6c4c3
	.xword	0x6811d68d59e45194
	.xword	0xa828abcf7a641ac8
	.xword	0x340d4f1ecdb70283
	.xword	0x90639667239620e7
	.xword	0xf8c35cb40fe6556f
	.xword	0xce578aa5c37dd7bf
	.xword	0x68619baf84406521
	.xword	0x53e54b476d7dcaed
	.xword	0x645815c19512a5c9
	.xword	0xc9f495033d94cb6e
	.xword	0x2dd4a3e53ef05a66
	.xword	0xee1e96f6bf49595c
	.xword	0xf5e3f06c3da9a718
	.xword	0x2ca69b80c53bf3a9
	.xword	0x3b87091a6233ca0e
	.xword	0x720fd5dd5405615a
	.xword	0x9b70833504620e8d
	.xword	0xb84c5a0541027f17
	.xword	0x2681dc929184762e
	.xword	0x7bc06ba4c8ffc1dc



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
	.xword	0xd848dd3c3bf63987
	.xword	0xb5facdca7674c3a9
	.xword	0x76eae2c6e1ebfbcd
	.xword	0xa0d710a702386fd0
	.xword	0x8661ead110fbddd0
	.xword	0xbbce070c0fa6063a
	.xword	0xdda84148742cbeae
	.xword	0x1ad79006388595e0
	.xword	0xebe36ed2fa740443
	.xword	0x0532eeed26492dc2
	.xword	0xf867373c9930c957
	.xword	0x6b19f2a0fce1552e
	.xword	0x0b1ed9b369bb7be4
	.xword	0xb601ac9bb3ac9611
	.xword	0xb9c9cd87fe93f7e1
	.xword	0x5f0809c831d54858
	.xword	0xa82543060d39879b
	.xword	0x2b730ac35e351c0f
	.xword	0xfa9c589f076c0a03
	.xword	0xda01a781c69197da
	.xword	0x1017bc5260e7d8e6
	.xword	0x3da9d150fc8ca7ec
	.xword	0xdc797ead1ab3fd13
	.xword	0xd7c708fdb2ae43ff
	.xword	0xacb54819dcd414ba
	.xword	0xa47737fd89e103a7
	.xword	0x48db16fc7cb7f673
	.xword	0xb30940e75e2ab681
	.xword	0x83fca376ed08ea60
	.xword	0x73502a069da4f311
	.xword	0xc1ddc09d113401bb
	.xword	0x83a2b7b7e27bc5dc
	.xword	0x66e3c1b3869b4270
	.xword	0x6e3ac4c665cf98f7
	.xword	0x2c7bb6d724817f45
	.xword	0x27d2ad3d7631a520
	.xword	0xe51820e31b66eead
	.xword	0x1ac25f97053c378f
	.xword	0x8e9768fc0fbb7046
	.xword	0x19e74bbc511cd254
	.xword	0xa3d832555d95b867
	.xword	0xe0705f368bdc5357
	.xword	0x4e97c8a6fdde1b07
	.xword	0x1bd29f2d9176121a
	.xword	0xb4b5f12dcf9ef3b9
	.xword	0xdc6fd83166033e8c
	.xword	0x5370763c4f8f9950
	.xword	0xf3804539307143ed
	.xword	0xee75dbfe1ff1e15b
	.xword	0x0a75aa571fc4ab67
	.xword	0xf5214d6d9647bc99
	.xword	0xd531abae36e59fc2
	.xword	0xa380088904bb10ef
	.xword	0xf3a40b4c532289da
	.xword	0x86b0794a6bb7c6b5
	.xword	0x832b8a0fb680df41
	.xword	0xe09f0cb2bee2919c
	.xword	0x167bdd93ef6d0eb4
	.xword	0xf6cd78d92f860665
	.xword	0x6fcc8b65b9b673dc
	.xword	0x00a73ca5fbd83e48
	.xword	0x39485c37cb868242
	.xword	0xa9c0199fd874123f
	.xword	0x2b4bb5719d24192d
	.xword	0x5fa92afca216c0ef
	.xword	0x406a0fcd4aa604fd
	.xword	0x86f6d35c8e41594d
	.xword	0xca41858be479170c
	.xword	0x8762a313a9948b4c
	.xword	0x9e4d82ba0976d921
	.xword	0x0181ab903fa56bd5
	.xword	0xe65c59ea67119315
	.xword	0xbc72751a20ea0382
	.xword	0xa8d053ed34284456
	.xword	0x1d56669d66159437
	.xword	0xe81c6977997f1693
	.xword	0x23b4d056eae3d773
	.xword	0xb607a74f3b8a33d7
	.xword	0x8eb9b6240e53961e
	.xword	0xa7b02edbf439afd3
	.xword	0x7be1cbf9c419f225
	.xword	0x3a88ce71acdaa75e
	.xword	0x83bd0f239e53bc29
	.xword	0xf1e2ce7373148428
	.xword	0x4c4817e5d2edb394
	.xword	0xcb0743149d341332
	.xword	0xac602cf6eb8c2bc6
	.xword	0xf56607dc76f1ebe5
	.xword	0xb4392f97f41b3d1a
	.xword	0x78b5b1b78a43f624
	.xword	0x2e9fe45b24295118
	.xword	0x3071eddf9b59627e
	.xword	0xc7704dcc08080231
	.xword	0x4c8a877757c347df
	.xword	0x760a65fb422b2539
	.xword	0x61f53dc12f55ca8c
	.xword	0x722259753eec6bad
	.xword	0x1283343989cdb81a
	.xword	0xd0a239910ce73995
	.xword	0x94c7ab7a1abf35de
	.xword	0x69f1044528166421
	.xword	0xdd982e83d1345f2a
	.xword	0x9dc67bcdc7ccd8bc
	.xword	0x31d067f372d91255
	.xword	0x3d49078731e552a4
	.xword	0x0a9976a08842015f
	.xword	0xfa38c96748cc01c4
	.xword	0xa1800a8697d6129e
	.xword	0xdb2bd45715c89c48
	.xword	0x5353bf748d73d03f
	.xword	0xbfc01aba707c4f4d
	.xword	0x85524ca07979aa26
	.xword	0x00a4dfb83da830bf
	.xword	0x0dc5548a610750c9
	.xword	0x717b38c1c49ebe8f
	.xword	0x6240e05373dbe9a9
	.xword	0x60ca3d380d3e178c
	.xword	0x8d1a5b523a6f3190
	.xword	0xe22528e4c15b3a06
	.xword	0x11d1ef963053f5f3
	.xword	0x662302425c2ad020
	.xword	0x77dd36438b792c39
	.xword	0x0176f6820c2c7712
	.xword	0x44830092e2dbed8c
	.xword	0x3b41d3e30ae50b76
	.xword	0x2ecd25ba7ac6f065
	.xword	0xd2b1751fc1ef0ed0
	.xword	0x7f8500a95ca52594
	.xword	0x8f13d336adf25c52
	.xword	0x92f10a94332d13f6
	.xword	0xe50a9ed65695bf1d
	.xword	0x91782f9aa13a5dc0
	.xword	0x2a50fcfbeee1c248
	.xword	0x67d369b82518d479
	.xword	0xb7ca2c14e9958780
	.xword	0xb89acff47a4c7220
	.xword	0x03b7144fce2572cf
	.xword	0xfb884992043d0b97
	.xword	0xe8afc55a73afded6
	.xword	0x6ca12aae5349fd46
	.xword	0x04acac19a428f066
	.xword	0x747d73aa0fb3fbfd
	.xword	0xa9d38340b9d97ffe
	.xword	0x11f66fbaae2ddf63
	.xword	0xdedc97dd8e411b6a
	.xword	0xba65fbff144d0610
	.xword	0xbcef51a11b579eec
	.xword	0x0b58aea676997d39
	.xword	0xb98557090f23f8a7
	.xword	0xe2e4195916052333
	.xword	0xddde36373b3529b2
	.xword	0x96f42d86de1522e7
	.xword	0xc9d531fcccc821c9
	.xword	0x0b2df4d89062c8b3
	.xword	0x2143b59d7273c6d8
	.xword	0xc8e40c9691d73f11
	.xword	0x3c78a9800a3925e4
	.xword	0xed30e2975395e96d
	.xword	0x8ec6e3d99bee911f
	.xword	0xc5ef3e0b83707f8d
	.xword	0x955fe6d842893292
	.xword	0x55e9a66b92edba54
	.xword	0xa382cd4550de8e7e
	.xword	0xd0c0231c14c2ea09
	.xword	0xba9c997d87a2cf98
	.xword	0xd1a08fc7b097ab1d
	.xword	0x0c71050a624d9e49
	.xword	0x329a36491f6e18ca
	.xword	0xab60b62f0219627b
	.xword	0x55b04902d59f03d9
	.xword	0xc5418d327c808a33
	.xword	0x84b69dba691409e3
	.xword	0xba7f6791adec3705
	.xword	0x480caeb124a372ed
	.xword	0x3189080884714165
	.xword	0x410cda9c076f17a9
	.xword	0x7affaf44b1174a82
	.xword	0x30249ce9b84b542a
	.xword	0x1ca19db9d9558e99
	.xword	0x105d1951f5c2de79
	.xword	0x45d8b2a246662992
	.xword	0xae503fcb8f85d935
	.xword	0xe34dfc8f51cafa99
	.xword	0x1c8a18f34a1ff515
	.xword	0x925216fc77cc0002
	.xword	0xf28549813d5ec848
	.xword	0xff55b37a696717cd
	.xword	0xd62706f5d12d490f
	.xword	0xb3998495e7dae812
	.xword	0x52c7cbf9127c446c
	.xword	0xcfb3d053d6c85046
	.xword	0x3a09ac0448ba38e3
	.xword	0x9523c70b1ed7e376
	.xword	0x233b3a5ed209515d
	.xword	0x0fe731979bc42aeb
	.xword	0x1f219b4bb09c22f1
	.xword	0xf851e170556337c9
	.xword	0xd1f841697e06408e
	.xword	0xb8f9a870f5fe8b0b
	.xword	0x774dfa74fd6c76ab
	.xword	0x211b4ec59be447ff
	.xword	0xc3c17db6ba80e224
	.xword	0x77cd13904cd96c5b
	.xword	0x58f7f46923551560
	.xword	0xaf953a2bbfcd1bac
	.xword	0x308fafc13b066150
	.xword	0x286cf910923aa9a1
	.xword	0x8870259ed8da2512
	.xword	0x41d431b07c3bf79b
	.xword	0x62c06e0b39797cb3
	.xword	0x782149e939d81ce3
	.xword	0xefae22ca07e04b8a
	.xword	0x56790c914c6d05a5
	.xword	0x90e082a348d1a366
	.xword	0x4dd88e54e52c8194
	.xword	0x352c27e8df22694b
	.xword	0xe08089586fc151a5
	.xword	0x45f8d76a22b97388
	.xword	0x18db8fd133fdcf4c
	.xword	0xc6f5c8a8ecbac1ec
	.xword	0x9475684be0908fa1
	.xword	0x9813ee6e744bf36d
	.xword	0x22b8ebcb5fc36a7c
	.xword	0xa8ae5345ac87fab8
	.xword	0x1091a1c8c61a18e8
	.xword	0x61432fbf9f0c4394
	.xword	0x04fa7c4208b63178
	.xword	0x823452937436c9c3
	.xword	0x44786e4944bae36b
	.xword	0x2e742b38843ca2dc
	.xword	0x1e7b7bb22e19e149
	.xword	0x2255c3e83576bcae
	.xword	0x09872711669ef554
	.xword	0x1b3d3b5b0f0a20e3
	.xword	0x7931bced5ccb83d2
	.xword	0xec0f53b667a9e4d1
	.xword	0xf176154c94177712
	.xword	0xf5b9041e00ea1bd9
	.xword	0xf519269baa5e1a6c
	.xword	0x6b33cb4de18a5203
	.xword	0x89ea246933c3ba65
	.xword	0x3d25897202837c80
	.xword	0x4c4f3ae141490a15
	.xword	0xb8adccf0bf21cfef
	.xword	0x94ea83dfd5509b1d
	.xword	0xefb1d5455d168593
	.xword	0xa6e447494249d45b
	.xword	0x097ba88b0c7c5953
	.xword	0x9647324d12ead68a
	.xword	0x67e18cd3ebf46a46
	.xword	0x17acd87ef8e45bc6
	.xword	0xa9589daa45ee9b95
	.xword	0x8cb9164e410a81e2
	.xword	0xcb39a232dd3037f4
	.xword	0xefcecc7ebe42f1ee
	.xword	0x5e9ce81d67da1041



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
	.xword	0x263bb2c0283ff25a
	.xword	0xd599a639f9eeb58a
	.xword	0xfdf68d17dfc49e14
	.xword	0xfdd75585e3cf8807
	.xword	0x04938fc862fa0a8d
	.xword	0xc43264624b7bb7bd
	.xword	0x58ccd001fdaf1be0
	.xword	0x8a1ca41c27dbeb96
	.xword	0xdfa513259605a826
	.xword	0xc242ec078d4b1b4a
	.xword	0x8679a4d44baca1a2
	.xword	0xa00b9fe04f0db64e
	.xword	0x0bc2a15261ca65d1
	.xword	0xe363cc10e4723dd7
	.xword	0xed016f4052e693f0
	.xword	0x678e0608c28e3986
	.xword	0x19203306149a5919
	.xword	0x18b4f32038207851
	.xword	0x42aae3c23aa09d8c
	.xword	0xf88ad2693665a41b
	.xword	0x9285a1d31e952b1d
	.xword	0x21b3b3a925303e65
	.xword	0x46576511a7e91ca2
	.xword	0xcf0aa6267010dcd3
	.xword	0x795fee42f72a0ba4
	.xword	0x7ff386e77450b6d2
	.xword	0x75e0a84583740494
	.xword	0xb9f4c105964961c4
	.xword	0xfc521cfa2a35e899
	.xword	0x43ba08693683ec0c
	.xword	0x066c4d6488f9f3cd
	.xword	0x8d03062f908b6f5d
	.xword	0x038d6968ea333f4c
	.xword	0xf6ca2862ade0d1d9
	.xword	0x162d653118b4e383
	.xword	0xd92941f8714aeb33
	.xword	0x3a3f89dd44c42e48
	.xword	0x44fb69ae1986bc2f
	.xword	0x98784e92be3fe0f4
	.xword	0xf166c3980305b867
	.xword	0x02478a93ad86fe01
	.xword	0x6084ce99e335dd0b
	.xword	0xe7cd8ecbacd2ebf3
	.xword	0x6f610786fc2d80ee
	.xword	0xf16e5583b48f4c02
	.xword	0xc6b2f53c6f335fd9
	.xword	0x88846e84dc202f2f
	.xword	0x8a097d621c2fab77
	.xword	0x6a747a640a59a7d5
	.xword	0xaddc9f5a43beb786
	.xword	0xff7a7d558aa444da
	.xword	0xa834000c3b1c1b19
	.xword	0xce8bade728c270e0
	.xword	0xa78538db4645322c
	.xword	0x5602f34a294f22d8
	.xword	0x6ad28ddf7db6a858
	.xword	0xa30d6c262902a174
	.xword	0xbd534636f254a7c4
	.xword	0x3267c5d9963f7125
	.xword	0xc180fa063dc584d9
	.xword	0x6eb3f578dfae7ff4
	.xword	0xb559d84539f2d1fe
	.xword	0x95c1f30dc208d073
	.xword	0xa861f37c687520e7
	.xword	0x4fb2c693900c7ff4
	.xword	0x9acc19f82e61c1db
	.xword	0x3ee0dbe8177accda
	.xword	0x1ff4c9a414e0be86
	.xword	0x992351de157a435e
	.xword	0x145b043ef79b70c3
	.xword	0x7031934281f8c5c3
	.xword	0x746df98d8bc53314
	.xword	0x1b75799c2315b54b
	.xword	0xeb7c2a70ccde63c1
	.xword	0x8f27e9940a2aa279
	.xword	0x0d3187b6af69fa27
	.xword	0x178216c2ca83ab3f
	.xword	0x8afea22ff442a2a2
	.xword	0xbf8ad2eb75b5f016
	.xword	0x780f8a2fc69c1542
	.xword	0x63ac1925b6d5ff55
	.xword	0x82e5102bffd671e2
	.xword	0xeea9832160d3f3a7
	.xword	0x8611be69e5153b0e
	.xword	0xffae1b6c99dfcd76
	.xword	0xdd3e31c96192f056
	.xword	0x423f803b42821622
	.xword	0xeebf466b792f905c
	.xword	0xe4cf0e76636665d7
	.xword	0x342583edcd96b625
	.xword	0x0c7bf1bf8a0cb199
	.xword	0x0514b8c0109ca695
	.xword	0x8fa29ca2945c1052
	.xword	0x7adfd323fb577f02
	.xword	0xa33004f1798012a5
	.xword	0x5a84fb32691901ca
	.xword	0xf5fb49dd6b8d97ef
	.xword	0xd95f87d574670785
	.xword	0x60977c2d5de860b2
	.xword	0x0413e69e970837bb
	.xword	0xe3e31c9fc60268d7
	.xword	0xb6141dc1801e2ffd
	.xword	0x8ebb51d5c51e328b
	.xword	0x817e4442189b8d4b
	.xword	0x4d74e83445988984
	.xword	0xbae47b99514e57dd
	.xword	0x726601bafd529dac
	.xword	0x15529a6b1a08a3e1
	.xword	0x2539ad98b646a6e7
	.xword	0xc1b241b3be84c6b9
	.xword	0x82f813f7336dd06f
	.xword	0xb92f7d3a466c27c8
	.xword	0xb09dff3acc8963f8
	.xword	0x131ad0616d49b1c4
	.xword	0x949515d2311afa3f
	.xword	0x477632d896e51497
	.xword	0xb28eacd33541dc42
	.xword	0x569881d2572e2b21
	.xword	0x5378084f32224631
	.xword	0xf9ceea5bfbd2ce64
	.xword	0x59f411011b4f1483
	.xword	0xbb333161600b466c
	.xword	0xed4a631806d858f8
	.xword	0x077025be54c3fbc6
	.xword	0xa0935c3094f80288
	.xword	0xc51e4c4590f233fb
	.xword	0xfde1aef24d03027b
	.xword	0x6dc837f4c93ab748
	.xword	0x53281c325313732b
	.xword	0xad893e4679a02140
	.xword	0x97ad3a6c70c948d7
	.xword	0x9a904159252c8ef2
	.xword	0xd99a519482bd229d
	.xword	0x402d26f68ec68011
	.xword	0xc7381772c4bff4c4
	.xword	0xc7efc2dee94ed266
	.xword	0x433d32116e12c5bf
	.xword	0xc2e323fec7fbcfdd
	.xword	0x3c4bc7b31649031a
	.xword	0x6187242f9bda66d0
	.xword	0x4839142638db5256
	.xword	0xf6d5767d8c397350
	.xword	0xee3044b961fcacf0
	.xword	0x48317c510425ddf3
	.xword	0xd34b3a3d8ced10f4
	.xword	0x54c3808b601c088b
	.xword	0xeb8227796a103b9b
	.xword	0x71c440c717a71dd0
	.xword	0xbf89c3f64427e97f
	.xword	0x7cf7b4848658100a
	.xword	0x00150fb827bd86d2
	.xword	0x439a571e425d2ee6
	.xword	0x0aa1ced7c2c150ba
	.xword	0x401f5516a11f0088
	.xword	0x7d4ff21a96be2dcb
	.xword	0x2f5cedd8fb26c0f4
	.xword	0x473603f8890fbf65
	.xword	0x11799079e10deb29
	.xword	0x63899be48d0b481a
	.xword	0x31e761370e6591d8
	.xword	0xb745a2adc6226123
	.xword	0x69715ed1fd2b859b
	.xword	0xec136fb97e772b9a
	.xword	0x0f48978a2983ed07
	.xword	0x6b72e21cac5f713e
	.xword	0xdbf19dc676a88980
	.xword	0x7332e63127b65ac7
	.xword	0x5e0b3643fecd444c
	.xword	0x061b9d135faa69e6
	.xword	0x49ddb22923d67ec6
	.xword	0x8766e5fbe8d16b80
	.xword	0x2dd80c535585e27a
	.xword	0xc82f373016fb584a
	.xword	0x2f627a039141cbb4
	.xword	0x5cd55aac5e72089d
	.xword	0x2dfb38fe5bcdfce1
	.xword	0x61195fe3b6fb476e
	.xword	0x5d601ec2c1dcb857
	.xword	0x8ff8844f26a98472
	.xword	0x233ce47f7adf7bdf
	.xword	0x3cdb9a31b2006b5f
	.xword	0x8052fc6a11f4f2a4
	.xword	0x96b083bac6382b63
	.xword	0x5b24027cffdbfb3d
	.xword	0x0543eee2a3c45049
	.xword	0x613b71e37a463dd4
	.xword	0xd093c3eaf8ff19cd
	.xword	0xebc38a2aa0407d35
	.xword	0xd7e626f5502ec12a
	.xword	0x73657ea0fe836255
	.xword	0x5aaba081befdb359
	.xword	0x5d450544ac01447d
	.xword	0x314943690aaf8fc6
	.xword	0xc682a1deea5520f8
	.xword	0x3451a1c0ff840897
	.xword	0x773f5704a9df8eae
	.xword	0x578e663315ad50f6
	.xword	0x3523502ccbf2dc2f
	.xword	0xbdf25bd390089034
	.xword	0x6b66583a3c338453
	.xword	0x806b1d9277e68ce6
	.xword	0xa12d886d4ad0a1d8
	.xword	0xa96e68d17e67c609
	.xword	0xcf2e4130a4c0d1df
	.xword	0x0855c47015b96854
	.xword	0x60121b0891ef1e69
	.xword	0x79c57a3c7c2e206f
	.xword	0xdf83b5e9ac168c05
	.xword	0x4aeda14064f65a8f
	.xword	0x778047d88a923980
	.xword	0x6239e40266dc9380
	.xword	0x90e9aea65dc6a212
	.xword	0xd9b01c4a520adb79
	.xword	0xf4ee64070db5b9b2
	.xword	0x5d1eb22911c63994
	.xword	0x5b910c988d367238
	.xword	0xdb56cf7ba6904d4e
	.xword	0x952457f23ba54c65
	.xword	0x90b0bca9eb7f68bb
	.xword	0xcc4ca4469fea62d7
	.xword	0xf39f08fcca4f1278
	.xword	0xa9110c11f5f1a059
	.xword	0x9b890475b17327d6
	.xword	0x1dac81028afa37a2
	.xword	0x8699485aa2ae98be
	.xword	0x3f2922a08639e7be
	.xword	0x0324d3365ff9d0a5
	.xword	0x8dfca20a15f3dae4
	.xword	0xf6add760ddef9976
	.xword	0x081b5d0ecaea6cad
	.xword	0x65ecdb46a7a20dec
	.xword	0x51885fa1f28e2841
	.xword	0x116688d1e584519d
	.xword	0xf3afcc1f0f90f2e4
	.xword	0xbd286a5412dd9fd1
	.xword	0x373a3e986d6ed60c
	.xword	0x2ca49a9a9c622a9f
	.xword	0xc7970ee91eb83502
	.xword	0xcf40277eddbc55a0
	.xword	0xb350bc213de9ba22
	.xword	0xccb2172949dad2c3
	.xword	0x3f38e70f95b16425
	.xword	0xa84e434386c85195
	.xword	0xeafda5c6635dc092
	.xword	0x97f2305806777abe
	.xword	0x911b6c8a8b29dd7a
	.xword	0xea768c8906b7bc13
	.xword	0x06799f62a335ed67
	.xword	0x1ea95ed4a6cee4bf
	.xword	0x9673e6f50181221d
	.xword	0xf3b98b035de25aea
	.xword	0x680671d710b214fa
	.xword	0x885eed329486e51a
	.xword	0x421fb3f52c04c49e
	.xword	0x300355dbacea454f
	.xword	0xc5a874a0dd1ee498



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
	.xword	0xb839cecd1d31b830
	.xword	0x56fa91b7ef6fc710
	.xword	0xa7087c6a48e0fba6
	.xword	0x35a798b373850744
	.xword	0x6fe519d1b291c760
	.xword	0x2d2e70d93c90df01
	.xword	0x2eab24b9508bf500
	.xword	0x738ddda2b8925a19
	.xword	0x0b5cb4f33c30987d
	.xword	0xd079578945e7d94d
	.xword	0x87d49027d0513d0f
	.xword	0x05c0cf887007a374
	.xword	0x67d4ead277a6ed5d
	.xword	0x2e450e4900dc0687
	.xword	0xbd2cbccc5978b60a
	.xword	0x91af156a474f23ba
	.xword	0xbcde910f4124e1a1
	.xword	0x1418fee7b1a39b15
	.xword	0xb839583502f1dc60
	.xword	0x6ba5af0c316bcfa7
	.xword	0x008b58e35970f231
	.xword	0x5da6288f8ee59d2b
	.xword	0x11ee0b4b67cce5df
	.xword	0x8afe497a35566755
	.xword	0x545a13598e6a3560
	.xword	0x96c24dd8a6318f45
	.xword	0x5743626b138ac186
	.xword	0xf1be65325355bcd5
	.xword	0xf508734f8da6d4f9
	.xword	0x3e2549098c18a276
	.xword	0x8868c05e9cf5b02f
	.xword	0xd3e02a6196f535e6
	.xword	0x5bb4db1aa2b0fd1b
	.xword	0xda1da77dc08f62a7
	.xword	0x74ebed3839c5fa4a
	.xword	0xcb9757d0e216817e
	.xword	0x325525fa82751f0a
	.xword	0x4c215843405a5730
	.xword	0xc30f7452c966f81b
	.xword	0xef221b1d1e2168d7
	.xword	0x68dc48a780ebbfdd
	.xword	0xfd14563cfc1af569
	.xword	0x56f9a19a2b747af2
	.xword	0x540261c9c7e26252
	.xword	0x48377692a0c98554
	.xword	0x678ba3447be4bbfd
	.xword	0x477b96a4349b7d6e
	.xword	0x7645ba667f628a7e
	.xword	0x899b677306d61210
	.xword	0xf693df24c1d55846
	.xword	0x93479992170fb6ff
	.xword	0x2f765120c2f288f9
	.xword	0x569231cbb40faca6
	.xword	0x5d74c5670786c6ee
	.xword	0xeae330b4d0e8785b
	.xword	0xaa0810e199734401
	.xword	0x7bc86ebf7a20c6c3
	.xword	0xef18a4828ae0463a
	.xword	0xf6e07d065955bdcb
	.xword	0x79feffc822eba3de
	.xword	0x5abcec2f42520b3a
	.xword	0x925c6559d4279bf8
	.xword	0x1b9ba1f85d83823f
	.xword	0x9d0c11a495d2da5d
	.xword	0xa8f7717916bc1866
	.xword	0x27964e23647389cb
	.xword	0x1bb1cd477b47da52
	.xword	0xcc8ac275db711dba
	.xword	0xf53f9f678cac5b8e
	.xword	0x111341f36c0442f9
	.xword	0x2a1500f27006b011
	.xword	0xb1b56bec40514f02
	.xword	0xd47b6b9b065d4abd
	.xword	0xd85ec9b6b0ab9b2b
	.xword	0x9777bab4716a0d15
	.xword	0x66ee0c1262ff2f3b
	.xword	0x1dcaa1208c1348e8
	.xword	0x8d9da586e46d838f
	.xword	0x6b8e5d9e51671c0b
	.xword	0xdc21c98505c4714a
	.xword	0x11433b900b4165e2
	.xword	0xc6734e4acbe43132
	.xword	0xf147dfa4caecc9e5
	.xword	0x1fd77cb6eeec8724
	.xword	0xa508653a72124227
	.xword	0xf7cbeec9214e6e6b
	.xword	0xe19a9a97e837db58
	.xword	0x01dc483fe6f13f81
	.xword	0x8f04cd8eef832ec5
	.xword	0x0526b5864239d96f
	.xword	0x7fa1456643b1d683
	.xword	0x6fb790e2878fcf69
	.xword	0xd75f5afd5f2a2de5
	.xword	0xaaae6bd3902c4803
	.xword	0xd2fae1384f851574
	.xword	0x6320ce01b4da02e3
	.xword	0x7f4275fdc57d3a59
	.xword	0xe4b2c5b3ef40374a
	.xword	0x769b88095f4fa021
	.xword	0x2123e8236c69dff1
	.xword	0xbe7477feae74d3fa
	.xword	0x50cb80eca0f64c8e
	.xword	0x1e19a5a7a9201587
	.xword	0x0d428be8de083c4d
	.xword	0x2fe138272d8abeff
	.xword	0x02e0dddbd1ae852b
	.xword	0x422838d931443dbd
	.xword	0xdd6a425b4e20efed
	.xword	0x1c11abda2fffe31a
	.xword	0x26c4a4017be0672d
	.xword	0x783fa0fe7c2025c1
	.xword	0x7442eae7b4ab9412
	.xword	0xcb233328f7040681
	.xword	0xad33eea49455e9a3
	.xword	0x5c9c50814f7fca16
	.xword	0x707a394f2954af0d
	.xword	0x480346a3057d4774
	.xword	0xc77ed8eb5f90a2fd
	.xword	0x040eb72bfbe1861f
	.xword	0x1d9aa4c076ba7c3d
	.xword	0x4bb3388b7290b27c
	.xword	0xf0e28ca45fb4bcc3
	.xword	0x36a7f70b388ea6a5
	.xword	0xf725340166833aae
	.xword	0xd4acc76e1bf06e2c
	.xword	0xe14adb18da99ea08
	.xword	0xaf67f9e826f00fb6
	.xword	0xe0e7d9c4bda0397f
	.xword	0x25d548200590d7b8
	.xword	0xb052e8739484d0cc
	.xword	0xe7a8ba52b50f3059
	.xword	0x8befd24755699f65
	.xword	0x0456f7b379875b80
	.xword	0x01f45f08e69f7db7
	.xword	0xc43672aa1228e66e
	.xword	0x1c1e4a5b01797521
	.xword	0x46d0f83963974aff
	.xword	0xfd07976b79cfd1b1
	.xword	0xa8efe9c6a935a9f9
	.xword	0x0c8f05d1f9f7eb04
	.xword	0x77f831c2beea08d3
	.xword	0xb3fab83814bf378f
	.xword	0xc46bb5ddf08c18e2
	.xword	0x6d3a44933f1bb9b4
	.xword	0x6acf98d913b99dfa
	.xword	0x836c49f8b2134892
	.xword	0x4c57ad30fba257f9
	.xword	0xbbb52f17a57ff001
	.xword	0xcf30c9d9454ba0f3
	.xword	0x236507f894a83807
	.xword	0x9f852c32b8aba16c
	.xword	0xa2fd006e242b9134
	.xword	0x872c100e1660822f
	.xword	0xe5b3cc37b1b379c6
	.xword	0x846148f6c39c8f93
	.xword	0x1a32cdbea7287e2c
	.xword	0x71492b071a31c6e3
	.xword	0xf4053aef2e9737d3
	.xword	0xed16257862dbdeb7
	.xword	0x61e5b9ae763cd3e9
	.xword	0xd4292cf5e62a2d0a
	.xword	0xd34f1450de33f545
	.xword	0x88d3e2cbd10c323a
	.xword	0xd26f46b767904265
	.xword	0xac21aa53e60b1772
	.xword	0x878c770d051f339e
	.xword	0x76c5fc0f7f050c64
	.xword	0xc3b681ed25969d47
	.xword	0xe9bc7de4ab37e16e
	.xword	0x9c61eb82f9595288
	.xword	0xb65055bd3f2379f9
	.xword	0x9c754aa8f13ca9d2
	.xword	0x20f604c2f3d68cce
	.xword	0xbc565fe01ceb4f7a
	.xword	0x2fd292b21b48995d
	.xword	0xa26793197f0787a9
	.xword	0x44cc35f82adee350
	.xword	0x16b284eccff60f5c
	.xword	0xb1f5b874ad049108
	.xword	0x7ea3582928f1f55d
	.xword	0xe39fb94356a143f9
	.xword	0x947f3b5ac5e0af60
	.xword	0x1627283196a5f10c
	.xword	0x7ebe6825d14a981d
	.xword	0x192d748fea064a0c
	.xword	0x28ec02885f21e7db
	.xword	0x3ec89e426edb9e90
	.xword	0xa6a98c4f835b7f6d
	.xword	0xcc18cd801dfe37c1
	.xword	0x486c02701f85938f
	.xword	0xf8c4c6bbe24aaf57
	.xword	0xcf4f040098bc1216
	.xword	0x556c3df0bdbd14d4
	.xword	0xff7bb373e4b731d5
	.xword	0x1aba6c3116abe7e5
	.xword	0x147801ea7779c2d4
	.xword	0x0ed61db2e0dbc7c1
	.xword	0xd7801d6dd3978de5
	.xword	0xe19cec731a9658bf
	.xword	0xf09cdd8ee30dd893
	.xword	0x85935c639d43a21d
	.xword	0xcf93339237e1bb8f
	.xword	0x2317d7ffb502a491
	.xword	0x3750575eaa894df4
	.xword	0xaca55b8e80b1c935
	.xword	0x097d3034a691c072
	.xword	0x1307fa6fbeb592ed
	.xword	0x4ce70b0ebdced399
	.xword	0x61f4695078360009
	.xword	0xb6441f10071b6c2b
	.xword	0x5c4a5364f5d3b5f4
	.xword	0x341dfa3c0979e713
	.xword	0x93c245a7c2508fca
	.xword	0x89365e08d716e2b6
	.xword	0x43514a641d2704a8
	.xword	0x75c585f5ad7a66af
	.xword	0x4bc000d42a79895b
	.xword	0x0db3cdf7b5855660
	.xword	0x5aea9c6b2db4ac43
	.xword	0x381eb622bb8682ef
	.xword	0xce4d647db8c8441b
	.xword	0x67ba219aa874a564
	.xword	0x58567ffd47813414
	.xword	0xcf17a0a79273db04
	.xword	0xf8b787cb42aacbf2
	.xword	0xf9384a5e3b673577
	.xword	0x6aa4ad03a3c07588
	.xword	0xa81d188fca0c1b06
	.xword	0xd7256163bc2826ea
	.xword	0xfa4b28b0908fd1c1
	.xword	0x38c10cec47eb281d
	.xword	0xe67086217b105299
	.xword	0x93f8e1f5f1b80439
	.xword	0xe74249dd5b775e28
	.xword	0x9ddc578ccba00c7d
	.xword	0xd8eea9a66c03eb50
	.xword	0x04124451827ea8e7
	.xword	0x9dc3b215b31dea6f
	.xword	0xc26c44c401647490
	.xword	0xeba185d2c6b46505
	.xword	0xb27700800dfbffdb
	.xword	0x0c1ebddbfd9483e6
	.xword	0xfbc15bfe83ca34ca
	.xword	0x0ac23143304bc0a7
	.xword	0x663aae96b8f16e6d
	.xword	0x6ea2d945a3499071
	.xword	0x2b38e7214b226da2
	.xword	0x5c839b0d90f4f07f
	.xword	0x3aa6711287b98f53
	.xword	0xcde6b6b59ab23a89
	.xword	0x5e7d36bf5ff84b01
	.xword	0x0b01a93a62920275
	.xword	0xd3d345a235cd4637
	.xword	0xfba850a83d284f64
	.xword	0xd27331090c9b8651
	.xword	0x085bed87d276991f



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
