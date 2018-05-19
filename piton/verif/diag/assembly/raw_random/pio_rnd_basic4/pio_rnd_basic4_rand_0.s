// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_rand_0.s
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
   random seed:	865656235
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

	setx 0xa4d076355adf6a82, %g1, %g0
	setx 0x1d94b9a384db7a01, %g1, %g1
	setx 0x0b373458f3df6e61, %g1, %g2
	setx 0x4acd1f3150eb2f63, %g1, %g3
	setx 0xb56ae34674c5abc7, %g1, %g4
	setx 0xfa4d5cd0a0a60267, %g1, %g5
	setx 0x6cffe8db7d63519e, %g1, %g6
	setx 0xce8b88760d3f2470, %g1, %g7
	setx 0x6c5411ddac8b7d20, %g1, %r16
	setx 0xb18b95cd6d0c9d5f, %g1, %r17
	setx 0xd616d77b81dcceaf, %g1, %r18
	setx 0x730692e679ff2bb6, %g1, %r19
	setx 0x24b8dc58531a5a4f, %g1, %r20
	setx 0xaa0a29fa237a9299, %g1, %r21
	setx 0xfd070766eaccaf9f, %g1, %r22
	setx 0x366a01f6b04935e0, %g1, %r23
	setx 0x03fbba94a5db3389, %g1, %r24
	setx 0xfcc0f4e105f3fc9f, %g1, %r25
	setx 0x628fd26c1af6e346, %g1, %r26
	setx 0xbfa3c86e165b92aa, %g1, %r27
	setx 0xb9703c841c6ceb2e, %g1, %r28
	setx 0x600171c49fd734d9, %g1, %r29
	setx 0x3f353a764d8da79b, %g1, %r30
	setx 0x7ec1acb17059f890, %g1, %r31
	save
	setx 0x6573e889ce0c16ed, %g1, %r16
	setx 0xe718a6db5b90e361, %g1, %r17
	setx 0x00286ea2f31d9f3c, %g1, %r18
	setx 0xd850f979bc7a8881, %g1, %r19
	setx 0x4940e9e408741314, %g1, %r20
	setx 0x21b35e209e95715b, %g1, %r21
	setx 0xd7040d01ef2f9c9e, %g1, %r22
	setx 0xa5c214e7b40f1b04, %g1, %r23
	setx 0xc33cbce199e1e4ce, %g1, %r24
	setx 0x5f93a697dcb397d9, %g1, %r25
	setx 0x31dc00b3d6b98c9e, %g1, %r26
	setx 0xa1983599279ad4ff, %g1, %r27
	setx 0x9e2dff8fa23e6710, %g1, %r28
	setx 0x3acdf5d2c0aac012, %g1, %r29
	setx 0x0ac602f40be6a4d9, %g1, %r30
	setx 0xd979a094f6668c50, %g1, %r31
	save
	setx 0xfb431d6bc6013b83, %g1, %r16
	setx 0x5bb8cca942105b76, %g1, %r17
	setx 0xaee37245c488c528, %g1, %r18
	setx 0xe226f50380a88d88, %g1, %r19
	setx 0xb7f9c669037789b9, %g1, %r20
	setx 0x94346c6a50ee4ad3, %g1, %r21
	setx 0x5701edc693270724, %g1, %r22
	setx 0x32d3688343fbfb3d, %g1, %r23
	setx 0xdafd1dd8d92aa3dd, %g1, %r24
	setx 0x01856d40d680ced0, %g1, %r25
	setx 0x097af29a8d2c29c9, %g1, %r26
	setx 0x43181e0922cf4cfb, %g1, %r27
	setx 0x69a33a2d76a3398d, %g1, %r28
	setx 0xeae777658408ba57, %g1, %r29
	setx 0xf4ef144e730b42d6, %g1, %r30
	setx 0x89e94cd61fd8aa8a, %g1, %r31
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
	.word 0xe0118008  ! 1: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe869a038  ! 2: LDSTUB_I	ldstub	%r20, [%r6 + 0x0038]
	.word 0xa0b1a030  ! 3: SUBCcc_I	orncc 	%r6, 0x0030, %r16
	.word 0xe031a030  ! 4: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe2f98008  ! 5: SWAPA_R	swapa	%r17, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 6: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000000, %r1, %r6
	.word 0xe041a030  ! 10: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xe4698008  ! 11: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xae118008  ! 12: OR_R	or 	%r6, %r8, %r23
	.word 0xe821a030  ! 13: STW_I	stw	%r20, [%r6 + 0x0030]
	.word 0xe8e98008  ! 14: LDSTUBA_R	ldstuba	%r20, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 15: STBAR	stbar
	setx	0x000000800e000000, %r1, %r6
	.word 0xec59a030  ! 19: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xe8798008  ! 20: SWAP_R	swap	%r20, [%r6 + %r8]
	.word 0xa6b18008  ! 21: ORNcc_R	orncc 	%r6, %r8, %r19
	.word 0xec21a030  ! 22: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xe2e9a020  ! 23: LDSTUBA_I	ldstuba	%r17, [%r6 + 0x0020] %asi
	.word 0x8143e011  ! 24: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000030, %r1, %r6
	.word 0xe0518008  ! 28: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8798008  ! 29: SWAP_R	swap	%r20, [%r6 + %r8]
	.word 0xa8b98008  ! 30: XNORcc_R	xnorcc 	%r6, %r8, %r20
	.word 0xe8318008  ! 31: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe9e18008  ! 32: CASA_I	casa	[%r6] 0x 0, %r8, %r20
	.word 0x8143c000  ! 33: STBAR	stbar
	setx	0x000000800e000010, %r1, %r6
	.word 0xe0518008  ! 37: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe069a008  ! 38: LDSTUB_I	ldstub	%r16, [%r6 + 0x0008]
	.word 0xaa41a028  ! 39: ADDC_I	addc 	%r6, 0x0028, %r21
	.word 0xe071a028  ! 40: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xe0e98008  ! 41: LDSTUBA_R	ldstuba	%r16, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 42: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000028, %r1, %r6
	.word 0xe441a028  ! 46: LDSW_I	ldsw	[%r6 + 0x0028], %r18
	.word 0xe679a028  ! 47: SWAP_I	swap	%r19, [%r6 + 0x0028]
	.word 0xa829a000  ! 48: ANDN_I	andn 	%r6, 0x0000, %r20
	.word 0xe439a000  ! 49: STD_I	std	%r18, [%r6 + 0x0000]
	.word 0xe3f1a008  ! 50: CASXA_R	casxa	[%r6]%asi, %r8, %r17
	.word 0x8143c000  ! 51: STBAR	stbar
	setx	0x000000800e000018, %r1, %r6
	.word 0xe4418008  ! 55: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe8698008  ! 56: LDSTUB_R	ldstub	%r20, [%r6 + %r8]
	.word 0xaac18008  ! 57: ADDCcc_R	addccc 	%r6, %r8, %r21
	.word 0xec71a000  ! 58: STX_I	stx	%r22, [%r6 + 0x0000]
	.word 0xebe18008  ! 59: CASA_I	casa	[%r6] 0x 0, %r8, %r21
	.word 0x8143e011  ! 60: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000038, %r1, %r6
	.word 0xec49a000  ! 64: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xe669a038  ! 65: LDSTUB_I	ldstub	%r19, [%r6 + 0x0038]
	.word 0xac398008  ! 66: XNOR_R	xnor 	%r6, %r8, %r22
	.word 0xec21a038  ! 67: STW_I	stw	%r22, [%r6 + 0x0038]
	.word 0xeee9a010  ! 68: LDSTUBA_I	ldstuba	%r23, [%r6 + 0x0010] %asi
	.word 0x8143e011  ! 69: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000000, %r1, %r6
	.word 0xe4098008  ! 73: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe4798008  ! 74: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa2818008  ! 75: ADDcc_R	addcc 	%r6, %r8, %r17
	.word 0xe0398008  ! 76: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0e98008  ! 77: LDSTUBA_R	ldstuba	%r16, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 78: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe8518008  ! 82: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe2798008  ! 83: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xaa298008  ! 84: ANDN_R	andn 	%r6, %r8, %r21
	.word 0xe021a010  ! 85: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xe5f1a008  ! 86: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143c000  ! 87: STBAR	stbar
	setx	0x000000800e000010, %r1, %r6
	.word 0xe051a010  ! 91: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xe269a000  ! 92: LDSTUB_I	ldstub	%r17, [%r6 + 0x0000]
	.word 0xac81a028  ! 93: ADDcc_I	addcc 	%r6, 0x0028, %r22
	.word 0xe831a028  ! 94: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xe8f98008  ! 95: SWAPA_R	swapa	%r20, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 96: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000028, %r1, %r6
	.word 0xec49a028  ! 100: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xe669a018  ! 101: LDSTUB_I	ldstub	%r19, [%r6 + 0x0018]
	.word 0xa8c1a038  ! 102: ADDCcc_I	addccc 	%r6, 0x0038, %r20
	.word 0xec31a038  ! 103: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xe0e9a030  ! 104: LDSTUBA_I	ldstuba	%r16, [%r6 + 0x0030] %asi
	.word 0x8143e011  ! 105: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000038, %r1, %r6
	.word 0xe8118008  ! 109: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xea698008  ! 110: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xa2118008  ! 111: OR_R	or 	%r6, %r8, %r17
	.word 0xec31a030  ! 112: STH_I	sth	%r22, [%r6 + 0x0030]
	.word 0xe1f1a008  ! 113: CASXA_R	casxa	[%r6]%asi, %r8, %r16
	.word 0x8143c000  ! 114: STBAR	stbar
	setx	0x000000800e000008, %r1, %r6
	.word 0xe001a030  ! 118: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xea69a000  ! 119: LDSTUB_I	ldstub	%r21, [%r6 + 0x0000]
	.word 0xae918008  ! 120: ORcc_R	orcc 	%r6, %r8, %r23
	.word 0xe029a000  ! 121: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xeae9a028  ! 122: LDSTUBA_I	ldstuba	%r21, [%r6 + 0x0028] %asi
	.word 0x8143c000  ! 123: STBAR	stbar
	setx	0x000000800e000020, %r1, %r6
	.word 0xec49a028  ! 127: LDSB_I	ldsb	[%r6 + 0x0028], %r22
	.word 0xe0698008  ! 128: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa029a008  ! 129: ANDN_I	andn 	%r6, 0x0008, %r16
	.word 0xe871a008  ! 130: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xe6e9a000  ! 131: LDSTUBA_I	ldstuba	%r19, [%r6 + 0x0000] %asi
	.word 0x8143e011  ! 132: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000020, %r1, %r6
	.word 0xe041a000  ! 136: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe4698008  ! 137: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa2a9a008  ! 138: ANDNcc_I	andncc 	%r6, 0x0008, %r17
	.word 0xec29a008  ! 139: STB_I	stb	%r22, [%r6 + 0x0008]
	.word 0xe5f1a008  ! 140: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143c000  ! 141: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xe001a008  ! 145: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xe8698008  ! 146: LDSTUB_R	ldstub	%r20, [%r6 + %r8]
	.word 0xa8218008  ! 147: SUB_R	sub 	%r6, %r8, %r20
	.word 0xe029a008  ! 148: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe9e1a008  ! 149: CASA_R	casa	[%r6] %asi, %r8, %r20
	.word 0x8143c000  ! 150: STBAR	stbar
	setx	0x000000800e000030, %r1, %r6
	.word 0xe0418008  ! 154: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe6798008  ! 155: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xacb1a030  ! 156: SUBCcc_I	orncc 	%r6, 0x0030, %r22
	.word 0xec398008  ! 157: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe4e98008  ! 158: LDSTUBA_R	ldstuba	%r18, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 159: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xec19a030  ! 163: LDD_I	ldd	[%r6 + 0x0030], %r22
	.word 0xe0698008  ! 164: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa0298008  ! 165: ANDN_R	andn 	%r6, %r8, %r16
	.word 0xe039a030  ! 166: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe4f9a030  ! 167: SWAPA_I	swapa	%r18, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 168: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe0118008  ! 172: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe0698008  ! 173: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xaaa98008  ! 174: ANDNcc_R	andncc 	%r6, %r8, %r21
	.word 0xe871a030  ! 175: STX_I	stx	%r20, [%r6 + 0x0030]
	.word 0xebf1a008  ! 176: CASXA_R	casxa	[%r6]%asi, %r8, %r21
	.word 0x8143c000  ! 177: STBAR	stbar
	setx	0x000000800e000018, %r1, %r6
	.word 0xe8598008  ! 181: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xea798008  ! 182: SWAP_R	swap	%r21, [%r6 + %r8]
	.word 0xaa01a010  ! 183: ADD_I	add 	%r6, 0x0010, %r21
	.word 0xe829a010  ! 184: STB_I	stb	%r20, [%r6 + 0x0010]
	.word 0xe5f1a008  ! 185: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143c000  ! 186: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xe849a010  ! 190: LDSB_I	ldsb	[%r6 + 0x0010], %r20
	.word 0xee698008  ! 191: LDSTUB_R	ldstub	%r23, [%r6 + %r8]
	.word 0xa8818008  ! 192: ADDcc_R	addcc 	%r6, %r8, %r20
	.word 0xe821a010  ! 193: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe8f9a030  ! 194: SWAPA_I	swapa	%r20, [%r6 + 0x0030] %asi
	.word 0x8143e011  ! 195: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000000, %r1, %r6
	.word 0xe809a030  ! 199: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xe479a030  ! 200: SWAP_I	swap	%r18, [%r6 + 0x0030]
	.word 0xa099a008  ! 201: XORcc_I	xorcc 	%r6, 0x0008, %r16
	.word 0xec398008  ! 202: STD_R	std	%r22, [%r6 + %r8]
	.word 0xebf1a008  ! 203: CASXA_R	casxa	[%r6]%asi, %r8, %r21
	.word 0x8143e011  ! 204: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000020, %r1, %r6
	.word 0xec518008  ! 208: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe6698008  ! 209: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xae918008  ! 210: ORcc_R	orcc 	%r6, %r8, %r23
	.word 0xec398008  ! 211: STD_R	std	%r22, [%r6 + %r8]
	.word 0xeff18008  ! 212: CASXA_I	casxa	[%r6] 0x 0, %r8, %r23
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000028, %r1, %r6
	.word 0xec098008  ! 217: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe869a010  ! 218: LDSTUB_I	ldstub	%r20, [%r6 + 0x0010]
	.word 0xa8b1a020  ! 219: ORNcc_I	orncc 	%r6, 0x0020, %r20
	.word 0xe039a020  ! 220: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe6f9a008  ! 221: SWAPA_I	swapa	%r19, [%r6 + 0x0008] %asi
	.word 0x8143c000  ! 222: STBAR	stbar
	setx	0x000000800e000010, %r1, %r6
	.word 0xe051a008  ! 226: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	.word 0xec798008  ! 227: SWAP_R	swap	%r22, [%r6 + %r8]
	.word 0xa821a008  ! 228: SUB_I	sub 	%r6, 0x0008, %r20
	.word 0xe829a008  ! 229: STB_I	stb	%r20, [%r6 + 0x0008]
	.word 0xe2f98008  ! 230: SWAPA_R	swapa	%r17, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 231: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000030, %r1, %r6
	.word 0xe419a008  ! 235: LDD_I	ldd	[%r6 + 0x0008], %r18
	.word 0xe2798008  ! 236: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xa2118008  ! 237: OR_R	or 	%r6, %r8, %r17
	.word 0xe071a008  ! 238: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xe5e18008  ! 239: CASA_I	casa	[%r6] 0x 0, %r8, %r18
	.word 0x8143c000  ! 240: STBAR	stbar
	setx	0x000000800e000020, %r1, %r6
	.word 0xe0018008  ! 244: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xee69a008  ! 245: LDSTUB_I	ldstub	%r23, [%r6 + 0x0008]
	.word 0xaca1a000  ! 246: SUBcc_I	subcc 	%r6, 0x0000, %r22
	.word 0xe0298008  ! 247: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xece98008  ! 248: LDSTUBA_R	ldstuba	%r22, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 249: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000010, %r1, %r6
	.word 0xec41a000  ! 253: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xe2698008  ! 254: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xa4418008  ! 255: ADDC_R	addc 	%r6, %r8, %r18
	.word 0xe021a000  ! 256: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe3f1a008  ! 257: CASXA_R	casxa	[%r6]%asi, %r8, %r17
	.word 0x8143e011  ! 258: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000020, %r1, %r6
	.word 0xec098008  ! 262: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xec698008  ! 263: LDSTUB_R	ldstub	%r22, [%r6 + %r8]
	.word 0xa4398008  ! 264: XNOR_R	xnor 	%r6, %r8, %r18
	.word 0xec718008  ! 265: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe7e18008  ! 266: CASA_I	casa	[%r6] 0x 0, %r8, %r19
	.word 0x8143c000  ! 267: STBAR	stbar
	setx	0x000000800e000038, %r1, %r6
	.word 0xe8518008  ! 271: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe4698008  ! 272: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa281a008  ! 273: ADDcc_I	addcc 	%r6, 0x0008, %r17
	.word 0xe021a008  ! 274: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe3e1a008  ! 275: CASA_R	casa	[%r6] %asi, %r8, %r17
	.word 0x8143c000  ! 276: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xe859a008  ! 280: LDX_I	ldx	[%r6 + 0x0008], %r20
	.word 0xe4698008  ! 281: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa209a008  ! 282: AND_I	and 	%r6, 0x0008, %r17
	.word 0xe4718008  ! 283: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xedf1a008  ! 284: CASXA_R	casxa	[%r6]%asi, %r8, %r22
	.word 0x8143c000  ! 285: STBAR	stbar
	setx	0x000000800e000028, %r1, %r6
	.word 0xec09a008  ! 289: LDUB_I	ldub	[%r6 + 0x0008], %r22
	.word 0xe2798008  ! 290: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xaab9a038  ! 291: XNORcc_I	xnorcc 	%r6, 0x0038, %r21
	.word 0xec39a038  ! 292: STD_I	std	%r22, [%r6 + 0x0038]
	.word 0xe6f9a010  ! 293: SWAPA_I	swapa	%r19, [%r6 + 0x0010] %asi
	.word 0x8143e011  ! 294: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000800e000008, %r1, %r6


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
	.xword	0x6a5b256991baddcc
	.xword	0x5a777698300941ac
	.xword	0x806be93049d969fb
	.xword	0xa25c62cf10ef59bd
	.xword	0x37f33a5604fa15dd
	.xword	0x74f54462717e9a07
	.xword	0xfefdbabd89260d47
	.xword	0xe5d23aa270269b79
	.xword	0xc3010a8db21e9693
	.xword	0xd75a0c3e21c9cb16
	.xword	0xe7ae4cacb8feab32
	.xword	0xf21a731007b4b13d
	.xword	0x7b17029205274625
	.xword	0x1c70116bc29adfbe
	.xword	0x12bbfbfbfba3b18f
	.xword	0xebe3b5bf9fcc2396
	.xword	0x701a6b76a2161dd5
	.xword	0x732770ed6bca4047
	.xword	0x6c511b94aac6a093
	.xword	0xe4188c5eeda2012e
	.xword	0x8b15ba6f212f8fc9
	.xword	0xe55fc09cc56a92a7
	.xword	0xa85e177f0b115995
	.xword	0xfea2fc55f5665ae8
	.xword	0xf1f569db4f79fc9f
	.xword	0x47a2174f713d5c82
	.xword	0xa13596f9e8e85fdf
	.xword	0x76dc89c66be473f6
	.xword	0xc228761df78719b4
	.xword	0x1ba062b3afc00a59
	.xword	0x07d698f3bbb81bf6
	.xword	0x74ecae0bac7cefe8
	.xword	0xe31d2ac70f33dda8
	.xword	0xd66ce241aec532a9
	.xword	0x0950595c1150ff4d
	.xword	0x2d82600d5f81e2ef
	.xword	0xb9687a7ce558b85b
	.xword	0x901b3f5d2e0463aa
	.xword	0x297cba6302299904
	.xword	0x0ccd5f6aea8a3ef8
	.xword	0x9a43bf3e808c1466
	.xword	0x3f7b376eff44175d
	.xword	0x0bd1d7b19afb6a2e
	.xword	0x151610f3d93489c3
	.xword	0x3f310e0c032c420f
	.xword	0x107bf631db59a1a1
	.xword	0x85819a4bbb736703
	.xword	0x29bf74fbdb510e18
	.xword	0x1bde2521cf92b3b7
	.xword	0x3c8913b705e11edd
	.xword	0x369ff0f80a5fc89b
	.xword	0x6ec0f46df9e58221
	.xword	0x833c24786992d0c9
	.xword	0xd6e51aefcdfb9dcc
	.xword	0xf14b0573d45a8abd
	.xword	0x244b8295beeb06c3
	.xword	0xe5c4733014c3d566
	.xword	0x61100d4ffbac80e1
	.xword	0xdf271629b83d80da
	.xword	0x01ce5594135ffc33
	.xword	0x8665635002b0bd48
	.xword	0xe66da273f2f2e534
	.xword	0x57e42c9f1059c216
	.xword	0x6cbf15350c031bb0
	.xword	0x02a73c92388a4759
	.xword	0xa46a988e33503b2d
	.xword	0xc33d0856a0bc9fb8
	.xword	0x623625d355503f87
	.xword	0x6edc410cbd696de0
	.xword	0x6f8a057f0e9971c1
	.xword	0xd9d5a9999bafd2a8
	.xword	0xfff554a136bebd1b
	.xword	0x76d7d0825bc8a2f2
	.xword	0xcf403b28c089759d
	.xword	0xbb23fc1f2ee71cdd
	.xword	0xcdcd9c9c649750e8
	.xword	0x87b8827d4b9a7284
	.xword	0x92a00d9055db466d
	.xword	0x768723906e932e57
	.xword	0x0e1472ea5b3f3b87
	.xword	0xc244ef0b797109e1
	.xword	0x4833f7961c96f193
	.xword	0xf14353a908a194eb
	.xword	0x9dacbf9a5f655691
	.xword	0x3934e51942f88e7f
	.xword	0xd65e666077e9ad38
	.xword	0xbbb1713bd9b1c886
	.xword	0x189ad7b5e9ef9d53
	.xword	0x0a6dfd2b24db30e8
	.xword	0x311d1e7c966781d3
	.xword	0x773add29128e1ee5
	.xword	0x8c59399a9784f73f
	.xword	0x305535ac8e98416f
	.xword	0xbd3a273d7703221f
	.xword	0x6ef87fb646216fe8
	.xword	0x67b7aaf80e9d15cb
	.xword	0x768e64ccc76aa59c
	.xword	0x362aa4e6b80999bd
	.xword	0x20f0af3f3a618fb0
	.xword	0x1a89b565e2375fc2
	.xword	0xf4f3aa37b9876e81
	.xword	0xd888e260c6a57056
	.xword	0x8b87d9d6d55399d2
	.xword	0x07b253e4d0207697
	.xword	0x27e01adf0514634b
	.xword	0xb6ae220707670ee0
	.xword	0xd1fe3a58b4cad423
	.xword	0x14dd4f8c45d95ddf
	.xword	0xe7e5cb74ab5b804a
	.xword	0xa724763aab630ef7
	.xword	0xd72723d8041339db
	.xword	0x2dc90104219c61ea
	.xword	0xd11b20de19546218
	.xword	0xad4b68fbe2d6c029
	.xword	0x96a83c1c186cd9b6
	.xword	0xeae2f4c8eeb3c9cf
	.xword	0xbf83de36d3a600e9
	.xword	0xc53620fe98e090a4
	.xword	0x423f4b9d1dee0cae
	.xword	0x1f9303966f999c7e
	.xword	0x0226cdeb0ff4e8bd
	.xword	0x2b05d1e2cb13320a
	.xword	0xbd100ce437333ab9
	.xword	0x52a320e7824c653f
	.xword	0x1a3871de12cd2568
	.xword	0xb6a7e657c61355ab
	.xword	0x1c4e3eee1bd66874
	.xword	0x891dbc0ace8f3851
	.xword	0x370558e2093f35d6
	.xword	0x5df00c97b832171a
	.xword	0xdcd528fca7b13a69
	.xword	0xd4c3f685c4aeb63a
	.xword	0xb96296e5273b3309
	.xword	0x58a9c744bebf7e85
	.xword	0xfa9475801271d611
	.xword	0x1a644d47616cb80d
	.xword	0x37c052703033c067
	.xword	0x8a7587fbb501b8ba
	.xword	0x17c454d0b5bf3831
	.xword	0xc54ad6e90adb67f5
	.xword	0xdeaabb36a900b1db
	.xword	0xa4179a2769d89b92
	.xword	0xb3ff889232159986
	.xword	0x5cf2234131ae69d3
	.xword	0xfefe1e02d495ca9a
	.xword	0x15bb7922bbaece6f
	.xword	0xeebdb65198b33b8c
	.xword	0x778c2c4c25809f5a
	.xword	0x3bb5cedd0c5e303c
	.xword	0x5cbc15477be1d401
	.xword	0xc9e3805b9c7b2e8a
	.xword	0x95c6f8c0ba333cda
	.xword	0xc935dc99baa9a4f1
	.xword	0x647c859e65c43565
	.xword	0x5ce44d3cd1ba72e2
	.xword	0xe1f641584eb6c0e3
	.xword	0x1a43a1817e647241
	.xword	0x89fd297fd6a974c2
	.xword	0xdf0bee6c0a516444
	.xword	0xbcba55e424152bab
	.xword	0x319312bf06e76fe7
	.xword	0xcc2e314cbe7aeb43
	.xword	0x91138be86e881010
	.xword	0x0a6f4407ae83510d
	.xword	0x455ca447656da5a9
	.xword	0xd992bcaefc4337b5
	.xword	0xba8d18624a36ec1f
	.xword	0x81f444fa08d3f9e0
	.xword	0xd103127a88f6523e
	.xword	0x64001dac3e84d4ff
	.xword	0x6f924281eac14dbf
	.xword	0x683a29d8862ddf50
	.xword	0x48783820f9ba3d30
	.xword	0xb45cc8d91d95ed65
	.xword	0x8b27ac2b01039631
	.xword	0xaf09a9daf6942377
	.xword	0xfa1830ebb29140c7
	.xword	0x352cef788022c5ad
	.xword	0x0424a8f745b8f5bc
	.xword	0xcdd3f0a415d0861f
	.xword	0x57d3b6b23132017a
	.xword	0xab59f1dfd7a4894b
	.xword	0xd0d5f3233dff8695
	.xword	0xcb71bbf76aef3bd8
	.xword	0x0b644cabe62fbffe
	.xword	0xc78cb696d8a6a60e
	.xword	0xc68f08fe5d484096
	.xword	0x1c5c062a994ad77a
	.xword	0x89c53d0aaaebcb0d
	.xword	0xd4225e706cabaaf4
	.xword	0xfaf0be17059a91ab
	.xword	0x359375d20d289e15
	.xword	0x19965a05e8cbb3bd
	.xword	0x08a7a2c0f5bd6650
	.xword	0x17fcb0f4b9d0ef9c
	.xword	0xeb2f32a0de473f8d
	.xword	0x73101214ffe48202
	.xword	0xde2af522b34f9865
	.xword	0x9844f6b28000e84c
	.xword	0x868ac313d0812705
	.xword	0xabe707f00c26a192
	.xword	0x0827b18687d4a8c4
	.xword	0xd8a46cdf24b1ccee
	.xword	0x317db337873a740c
	.xword	0x1fec689cf57f3cda
	.xword	0x13bbae5145e0854e
	.xword	0xfa14d25ef696580d
	.xword	0xf355da1a4a31f667
	.xword	0xa374effe99ff23f5
	.xword	0x39d9dffb13ad0b7d
	.xword	0xfc773081092ad466
	.xword	0xaec8a1ab2df7a3d1
	.xword	0xcdfbbb8216623ab2
	.xword	0x3f771ffe2e6020d2
	.xword	0x8dd1480be7245e5d
	.xword	0x980685b9de3da79a
	.xword	0x13158ee98181e84e
	.xword	0xce3ced9decf558f1
	.xword	0x0988f736e0bb862d
	.xword	0x666887f9896d2d38
	.xword	0xac8a6aa2cd04adca
	.xword	0xe04c8549d6d92d38
	.xword	0x53f1fe8a6810b854
	.xword	0x31236064abadc0b4
	.xword	0x20e7534f28368ec4
	.xword	0x6243324f79747dc8
	.xword	0x796b8c06e1fb900f
	.xword	0x91165f2c11f74921
	.xword	0xb34ea82566c026e5
	.xword	0xdf852e60e3e382b9
	.xword	0x0c222cad9effb7b6
	.xword	0xcac3c13d2d052a36
	.xword	0xbdc4d1cf0ffb29f8
	.xword	0xaa7991f1c037cbb2
	.xword	0x6e15699942d94823
	.xword	0xfed9a4b8f70009e0
	.xword	0xfc5f7fd0380965b7
	.xword	0xeb3c6dc8fb022efd
	.xword	0x9751f35b28c076b6
	.xword	0x2a06b128bef4d1b7
	.xword	0x1657115d91bee6ad
	.xword	0x8a665097e35abfdb
	.xword	0xb1d57143051573ff
	.xword	0xe05d12375e70da54
	.xword	0xd7677dcc4a852400
	.xword	0x14aa2b16ea678aa1
	.xword	0x71cc5ce1cf055a58
	.xword	0x8b5cc832ecd32a13
	.xword	0x75841aca56c44e23
	.xword	0x38bc5883b342a791
	.xword	0x6faf28101dab3afd
	.xword	0x79c45dd6833f7d49
	.xword	0xf9f499f12ef473ac
	.xword	0x75dc34ba92ac568a
	.xword	0xfd710d9bf2dd5e27
	.xword	0x5f72634d58eac42d



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
	.xword	0x8468e171e96da522
	.xword	0x0604cdd3befe6654
	.xword	0x14c5396f28d59094
	.xword	0x97fba4cc29ba666e
	.xword	0x50609783757edcc2
	.xword	0x70113caf4e1b03bf
	.xword	0x3c3f9e34cb7a9252
	.xword	0x8c5aa470247082a9
	.xword	0x093390f47ea66edf
	.xword	0xedba7592f0d71a66
	.xword	0x1fa4b7a95c98d320
	.xword	0x10726271714f7863
	.xword	0xf9eca5c535071e38
	.xword	0x24f6670d0ce382ac
	.xword	0xf0eb484947b6dc27
	.xword	0x15a5f62a0384b964
	.xword	0x3a646eaa78952517
	.xword	0x5de6a4b4887dcd1f
	.xword	0x8c7782a1fe441204
	.xword	0x26c8ece56a541c93
	.xword	0x5f84d0328344f375
	.xword	0x25f2f7395c4407f5
	.xword	0x9327da23a34c32d3
	.xword	0x52aaa30294efe8b0
	.xword	0x97df72803235e6ff
	.xword	0xedc77e037f286361
	.xword	0x7e81221db69a81ae
	.xword	0xc447231bb33a0c65
	.xword	0x783a92498d13d99c
	.xword	0xeee1c0cddee69d93
	.xword	0x59017ca715288479
	.xword	0x92f4511ba826fa07
	.xword	0xff0c6250734b99f2
	.xword	0xb8d47f46b7d10428
	.xword	0xbc28ece8a8ebb0bd
	.xword	0x184ddad9819f69fc
	.xword	0x4e9da6ae895ee0bc
	.xword	0x109208d812bc6e58
	.xword	0x992e7e0fa048a567
	.xword	0x97475eda7ca7fe90
	.xword	0x8209daa2dd82fd35
	.xword	0x99eaa2047461eabd
	.xword	0x2b483a0481ca0fa2
	.xword	0xc971978808f6655b
	.xword	0x6ac0f80cd6280738
	.xword	0x0b0b271bbd37f870
	.xword	0x93eb8f8301588bb5
	.xword	0x9ac4871069e08e4d
	.xword	0xa9d583ae1ae04912
	.xword	0x4044fd6631240052
	.xword	0x93adc4bee5bdcc9d
	.xword	0x881084c2f58352cc
	.xword	0x7c630ad477c95624
	.xword	0x53d31599ee2b8492
	.xword	0x85772b31e0959692
	.xword	0x611c19f9017cdfa1
	.xword	0xbed87b1a9356a02e
	.xword	0x3c7c383c09e99f20
	.xword	0xe334eeff417bab95
	.xword	0x7b958355620b4221
	.xword	0x158bf9d37ec8668f
	.xword	0xc656597afca7f47b
	.xword	0xee38dad028dca07d
	.xword	0xd814003dab553fcf
	.xword	0xdbafc99a087fec04
	.xword	0xb12e3c542f78ff6a
	.xword	0xd61a14f8f9e6ded1
	.xword	0xbf30397e667116db
	.xword	0x7cef8b4c664660b3
	.xword	0x69ebc155e71853d2
	.xword	0xff470f8c8388de4a
	.xword	0xe4d3796f4fa7c7a8
	.xword	0xfe459be026846884
	.xword	0xed91c743d61d247f
	.xword	0x7e8d0f86587c4ca6
	.xword	0xed938a3511646104
	.xword	0xf3c7303b4117d8d6
	.xword	0xb8ff63e1175f0057
	.xword	0xabdf322032f168d9
	.xword	0xeb10f265de431734
	.xword	0xef92d76ea14ce2f6
	.xword	0x007196abff98f8d0
	.xword	0x8584c50a6a3ca1e9
	.xword	0x57cddbd3acb8357c
	.xword	0x9a40b488bb1d0d74
	.xword	0x707d8d44fa8305c8
	.xword	0x6466e775cf28ab0a
	.xword	0xbd2d8fba7d4e57ff
	.xword	0x0e3fcbbcbeba9612
	.xword	0xb0f8b24d3854cc69
	.xword	0xa06ad45c5af3739a
	.xword	0x141be198e04ff48b
	.xword	0x6c01521685d7efd5
	.xword	0xa1baa6265308699f
	.xword	0xc4fcf00be5ef3ebf
	.xword	0x2485374e62ad1085
	.xword	0xe226c216fd58bcd8
	.xword	0x1150640c6d5301e6
	.xword	0xf3f60291825946a0
	.xword	0xc7356d4cdd123ba3
	.xword	0x5130348b9c947742
	.xword	0x24b7c524f5ae232e
	.xword	0xe13087df7e925e0c
	.xword	0x25b185b3e2e29dd1
	.xword	0x2168f8df8bd80797
	.xword	0x374e27df33ff9cbe
	.xword	0xf2c267dd13a4cedc
	.xword	0x843617cd641ca33e
	.xword	0x13d7406424ec8050
	.xword	0x02e31aa43fba1131
	.xword	0x9b029b2e95ca55af
	.xword	0x85433b3f469069ec
	.xword	0x14f27cd35fbe6765
	.xword	0xe96fa948172910cb
	.xword	0x0a8cc553a7caabea
	.xword	0x14ef8006d23bbfac
	.xword	0x67dcf60152985d1c
	.xword	0x70484036f193047c
	.xword	0xc5e5df818cd0bf4f
	.xword	0x6b52c16f132fbd16
	.xword	0x6421e33d253fa146
	.xword	0x8753870eaf0378bd
	.xword	0x0d747b6896dd75a0
	.xword	0x6f3782a7660ba922
	.xword	0x9a2689a8d030bca1
	.xword	0x20b706c5a22f13d2
	.xword	0x4d02b52d5a343db5
	.xword	0x1ef6eea082177a89
	.xword	0xc9d5795d3513b0aa
	.xword	0xe59fe020627a5c36
	.xword	0x0825fb28a0aad1b1
	.xword	0xf6795dcd9261f1a9
	.xword	0xb262f1863e1a929d
	.xword	0x138a18285c133029
	.xword	0x84cbfadb0ef8d272
	.xword	0xb5ae6ffebb97c095
	.xword	0x6f226b2df86cfe93
	.xword	0x6fdff096ea841f54
	.xword	0x2629d59373dd57d2
	.xword	0xeb673635fc296c2c
	.xword	0xaf01b8c0c29ecc51
	.xword	0x738708f31ae86d7f
	.xword	0xe5f99a3a14dd7bb4
	.xword	0x5a9e1382b5e68da5
	.xword	0xa69df25379c8907e
	.xword	0xb1050a5a59075262
	.xword	0x9bc8b1cc1ed7c8af
	.xword	0xd75820eab3d342ec
	.xword	0x2d0d2a7632443859
	.xword	0x1b1cefbf3610a946
	.xword	0x60d16a26e0f473b9
	.xword	0x93179d92fb66cdeb
	.xword	0x958c56ccd38d1cb8
	.xword	0xbe20af290e6edefe
	.xword	0xc943cbef391689e2
	.xword	0x24762b7d726ab473
	.xword	0x45a321666e0075a1
	.xword	0x77d5ddcf2ff507dc
	.xword	0xe39641c949b662a3
	.xword	0xb6f192d69db60a58
	.xword	0x89f10a0e8f68abed
	.xword	0x7435d7fe83d4ab2d
	.xword	0x320f75b0f6d1a6ee
	.xword	0x2079c8d1af85f904
	.xword	0xcd5d8752f9543966
	.xword	0xcd8d958af444590f
	.xword	0x62ad113b9c1eee77
	.xword	0x66a739e079890c59
	.xword	0x8ac1a3cae4f75963
	.xword	0x7202ddfcc6f3142b
	.xword	0x141e73e66be10808
	.xword	0x8ef887a5a3ecdf36
	.xword	0x39dbcb6de886e561
	.xword	0xee02f3e0bcfa1306
	.xword	0xf4d092a7d5b96437
	.xword	0xe84279fd2597dafa
	.xword	0x5c83e04e880b6232
	.xword	0x7ca8c548489417a6
	.xword	0x3b32edd40015ceb0
	.xword	0xd107bf8f1fa817ae
	.xword	0xda66c9bbd3d44782
	.xword	0x0e51856eda99f4fb
	.xword	0x3d212584f62e8fb0
	.xword	0xb13b8370f3b337e0
	.xword	0xc1e0b96a99fcdb40
	.xword	0x1c8cb7aed06358c9
	.xword	0x61e56a855aab4308
	.xword	0x95b6423fb7722e06
	.xword	0xcd4595b7725ebb12
	.xword	0xed39b194752b78a5
	.xword	0x745af58a38c664e1
	.xword	0x5dfdb0953fdf2841
	.xword	0x6bdda9c0d9f59453
	.xword	0x184809981ccfcfad
	.xword	0x04378926239983e2
	.xword	0x71093041912c1740
	.xword	0xfec8c875579e9ff2
	.xword	0x0a063147df252cba
	.xword	0x4a428d9bec132c57
	.xword	0xebbb3574986ee4f1
	.xword	0xd32a73998a643fe2
	.xword	0x65a5a0880e138efa
	.xword	0xbbec6e81239027b1
	.xword	0x3ae64738303714bc
	.xword	0x569211ba033d3a69
	.xword	0xc7c3a7f717a04dc5
	.xword	0x7c3a19e6ec8e2f9d
	.xword	0xb529225690da62a1
	.xword	0xc03149bb3a17945d
	.xword	0x5ae3b2b7b00f1b8b
	.xword	0x9a5efdcf9ccf94b3
	.xword	0xaf6da393e9972130
	.xword	0xda609a2473114c7c
	.xword	0x6cd6dd0e2350b4aa
	.xword	0x31dd2b3671697c3a
	.xword	0xd683db4569d682d1
	.xword	0xf33d4b366fbbf21a
	.xword	0x4fc731e3454c51d1
	.xword	0xd93a8577f16bf389
	.xword	0x9fdd9c7e4fd7f992
	.xword	0x3a3429ca11f45155
	.xword	0x665dc0d62cd2e393
	.xword	0xc9a607eb04390049
	.xword	0x542c676cd309312b
	.xword	0x2e70496fb358eecb
	.xword	0xe51693dd5be6fe0a
	.xword	0xa1dfd3f54ae6ae85
	.xword	0x33dc7f3cc4037bb5
	.xword	0x175608b8c920c1a0
	.xword	0xbb074e33deae3942
	.xword	0x9167db8622f8d3cc
	.xword	0x0c3880a5df46552e
	.xword	0x30bfe5d524011183
	.xword	0x1e3eaf4a302e3269
	.xword	0x6055c39d0e728a44
	.xword	0xe654d0fa9011fcaf
	.xword	0x51458521ca539c41
	.xword	0xa5f595823b6e8b34
	.xword	0xf22c65160d8879d5
	.xword	0x4cc7b2c784b3e0f8
	.xword	0x400a278e7a8b71c3
	.xword	0xd24adfab0691db2a
	.xword	0x395087a8c02be29f
	.xword	0x819f2dad8e8babdb
	.xword	0xc363c00fd57d96a4
	.xword	0xadbe4bca15d9d216
	.xword	0xd00e94118a8aca31
	.xword	0x42b22c752417272d
	.xword	0xcdbc36c4b9a2b80c
	.xword	0x4758e2902df15d17
	.xword	0xe58b1ddd52b03e6e
	.xword	0xa50db01e44eb2a5a
	.xword	0xae24ee053cc97ef2
	.xword	0xfdcc06cb46221e08
	.xword	0x631b8e55bbdef13e
	.xword	0x60e67ff88e60044c



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
	.xword	0x35b2b1d5c1fa618f
	.xword	0x7bf0d4e2c85c4bee
	.xword	0xc0d1a02263f9ea6f
	.xword	0x86c0e48e99a02915
	.xword	0x289af4fcc7266122
	.xword	0xc87b90ddab6681c0
	.xword	0x5d3313508253112f
	.xword	0xe238deea1daae5f2
	.xword	0xd29da5ec0c336266
	.xword	0xf9f5526eb956d460
	.xword	0x7c549b0ae83482f4
	.xword	0x9527327f253b47c0
	.xword	0x53f5e849a6d9f379
	.xword	0x2c985f6d9fd22677
	.xword	0xc2088ddab3984c57
	.xword	0x85315c79bfec95a0
	.xword	0x88a8b267c80965ce
	.xword	0x700fbd438eed4cd2
	.xword	0x204209bd8a0a1781
	.xword	0x113a30ad3cd3622c
	.xword	0xb05d8821c7b4f3ef
	.xword	0x5cb607f055a19e1f
	.xword	0x7a4f6ca967d60503
	.xword	0xb85e309033f0b9c4
	.xword	0xaa329eb152486352
	.xword	0x4df46647bde22668
	.xword	0x415949f608de365a
	.xword	0x1c0bf2538cf41fc8
	.xword	0x537ea94c9b06d35f
	.xword	0x32bccc37ebc19e1b
	.xword	0x0dfb8bc2376dca5e
	.xword	0xb6af5d8ff1528647
	.xword	0x1082f8c1ae5a73f6
	.xword	0xf4d5602e21dbbfb7
	.xword	0x420553bccf5c2cad
	.xword	0xd905e263c1512d87
	.xword	0x7875f404c907ab4b
	.xword	0x638e32a5d00a00b5
	.xword	0x9f06814bba91da2b
	.xword	0x750e3dc45921b3f5
	.xword	0x073243a77d4f8d9b
	.xword	0xa428c7ecf897a027
	.xword	0xafa3708769d8b077
	.xword	0x482e9b0f0283291b
	.xword	0xa06fe11f540690b5
	.xword	0xed026ea4c1684e5f
	.xword	0xcedc6b319033a314
	.xword	0x9bc2911f8733733b
	.xword	0x23a39638350568fa
	.xword	0xe3a75d1506ceb72d
	.xword	0xa1770f8bf8aa14ed
	.xword	0x443f8bca3697120f
	.xword	0x18c85a03f59d7ed4
	.xword	0x9c7691cb719099f8
	.xword	0xc474b7cf09ce243f
	.xword	0x8b1096adfd712745
	.xword	0x6cbf5da3d292d540
	.xword	0x9db8f220407803ad
	.xword	0x8e5a71ba7906dc3f
	.xword	0x94a600967476da05
	.xword	0x5dc72a8628d26fc3
	.xword	0x115e31d51b5fbbbb
	.xword	0x8ed72a35aa1307dd
	.xword	0xb5c87ef4869e162c
	.xword	0x25e7e95337d99450
	.xword	0x0517a5efba065b58
	.xword	0x1dd15dbc87d42d67
	.xword	0xaef6f0c13b28989d
	.xword	0x5bc4dbce6cc23c06
	.xword	0x7d82e638975f7de4
	.xword	0x7534ec96ec8da93b
	.xword	0xcc9f844d89c9a9a3
	.xword	0x9446ff77cadef7c0
	.xword	0x52952c1148efc58c
	.xword	0xa0253c19203f7e16
	.xword	0xd18acf7afb0d59b3
	.xword	0xadcc3b5b186f6c2f
	.xword	0x30dfdfd62449dcc6
	.xword	0x04cfdd22eb64e09b
	.xword	0x59fb7d4ec384c7cb
	.xword	0xdbe90d99cfbbbb0a
	.xword	0x54f4ea4fb325d499
	.xword	0xd3ee92c00a5850e5
	.xword	0xabc43110442cca62
	.xword	0xddc9d253c0577c87
	.xword	0xba6029f5afe5e3fa
	.xword	0xfb69fe0aa92b78af
	.xword	0x0d391e4f1dee5c92
	.xword	0x4defaa4760fff98b
	.xword	0x0f5047316f43aa01
	.xword	0x8ac2fcdb80ff6986
	.xword	0x2a68f59db3d3cf9b
	.xword	0x18eb4083101fbc2b
	.xword	0x3bfd67db95143118
	.xword	0xd39dfc653bf38661
	.xword	0xf569862d557dd4af
	.xword	0xae7e0974b8bf04ab
	.xword	0xcd649d427e0d5eb8
	.xword	0x79edfd66142eeab3
	.xword	0x4f063e82f36c9928
	.xword	0xd580af61799c7d9a
	.xword	0x8494e6b081558d90
	.xword	0x916dc1a613bc0621
	.xword	0xe87d13693623192b
	.xword	0x99ede9b23c0089b1
	.xword	0xae9c808e77b507a5
	.xword	0xefcf6dff5f0efe20
	.xword	0xe95f41c7beb875df
	.xword	0x2d4953a996252fd1
	.xword	0xedc9b321c650d659
	.xword	0xfa97668f122e3f3e
	.xword	0x0fe8be86ef0d0fd5
	.xword	0xd10060c556dce38c
	.xword	0x6760f0f28e40d060
	.xword	0x368ce5c775af1a3b
	.xword	0x56bd39137c4a597c
	.xword	0xc718a6cb04a78eec
	.xword	0xcddcd7ee7f6a6f71
	.xword	0xa90d0cf3b8d430e8
	.xword	0x644ac2287f1fc933
	.xword	0xc1f90e60e40e73c3
	.xword	0xade6d2c16570af53
	.xword	0xc591246157a7f2cc
	.xword	0xf87a557bb3162a86
	.xword	0x3487b140bd10d9af
	.xword	0x05620e2e92a2c3d3
	.xword	0xbb8f2bd28cbe1ad9
	.xword	0xe3089bf3cb3d2c79
	.xword	0x5f3d73bf242ce39f
	.xword	0xa6b96494c7e8f0c8
	.xword	0x13d14232f1ffc081
	.xword	0x05a4534f6ec84925
	.xword	0x1b9cfcf3a4e68c77
	.xword	0x9ace147fd033428c
	.xword	0x4408b25d80fad862
	.xword	0x6d89541b6d07784d
	.xword	0xd07ff8878cb11c7c
	.xword	0xe3d392a982a5825d
	.xword	0xde1c3045a47eabbe
	.xword	0x7d029f29b6fa4e3c
	.xword	0x7ba8926cbb7913d7
	.xword	0x4432b7c546b24a8f
	.xword	0x034da2a5a9cfe29a
	.xword	0x424e830999322d00
	.xword	0x8fae93837c5fd36e
	.xword	0x7a636a9035f8c871
	.xword	0x7abcb79af988b9cf
	.xword	0xb56c4cacfe4c8366
	.xword	0x525e70b412c67cdd
	.xword	0xbc6eb984803d1c38
	.xword	0xa2a62ed5a1a4ecd0
	.xword	0x5ceb1644855be74d
	.xword	0x5ed81f912f503e27
	.xword	0x133e48063fc86ee4
	.xword	0xb9bbae529d9d327c
	.xword	0xf09f385854883ef6
	.xword	0x26e6b685c1001739
	.xword	0xfcfbff8207225ca5
	.xword	0x10d2d2cbe5868aff
	.xword	0x079fbb8f3e2328ca
	.xword	0x70d7b62543b96a94
	.xword	0xf54fafc6208ec916
	.xword	0xd790d2a0079d8cb5
	.xword	0x6e808f96e21ddfda
	.xword	0x7d0ab2d86582add0
	.xword	0x71db59a654912694
	.xword	0x41b98d36f929b4f6
	.xword	0x333b74d2c94061c5
	.xword	0x7c815d035e2a6705
	.xword	0x282ff0ca97fe5c30
	.xword	0xdd270aa96b87bf86
	.xword	0x7c135361fe19a42e
	.xword	0x2869a7a416093e6a
	.xword	0xa01c11e037e681a7
	.xword	0x613b004973fe13cd
	.xword	0x95ec76733bb53ee6
	.xword	0x3170d42930caef91
	.xword	0x267badb4f6aa369f
	.xword	0x6043555c25e48c11
	.xword	0x0f7b74aab2700cfc
	.xword	0xa6bb8a7e6a3354a2
	.xword	0x3c612945972bc01e
	.xword	0xa2e87fb65acc4f1e
	.xword	0x55bb9b3cb60f38a4
	.xword	0x93e574a6c7899db1
	.xword	0x22cead4d74f644be
	.xword	0x51ae2a075f636f3a
	.xword	0x95fd63e127acea32
	.xword	0x4ec406d87f3cdc27
	.xword	0xf9163b923cef22ec
	.xword	0xa778b3a995cc6e99
	.xword	0xd06fa4f76372d693
	.xword	0xcc4877ade25e2175
	.xword	0xf26aa3751d6b4af4
	.xword	0x82e0c3a9bcd98780
	.xword	0x97670169e4d32be5
	.xword	0x180fb70605e0cc1e
	.xword	0x7e04b1a311fc93b9
	.xword	0x4c396610da2286db
	.xword	0x6b9f273323ea5ef1
	.xword	0x11225be72ca33889
	.xword	0x6a7788f31462f4c1
	.xword	0x60680afdedcbcdaf
	.xword	0x1568905dde62f1be
	.xword	0x878df776c6568f75
	.xword	0x9722114f4b1f0eea
	.xword	0x5cd0443b58a48cf4
	.xword	0x34b940de4fbdde0b
	.xword	0xd5ce97ca78243d58
	.xword	0xc961e965d281da82
	.xword	0xf00cba9e0d64754d
	.xword	0xe2a22d4c989022ee
	.xword	0x86fe2a6e6b733dd3
	.xword	0xb1177b9cb7478ff2
	.xword	0x08acad389dd31c56
	.xword	0x1537e08e45ccac4d
	.xword	0x77662f6f1c155031
	.xword	0x4a4f9a17d55ac1e8
	.xword	0x4b9fc80f3b103433
	.xword	0x2b351e9a7a25322d
	.xword	0x666b359a0456c6ef
	.xword	0x1d30492156fc09fc
	.xword	0xd42c3038afa7bb86
	.xword	0x6f4d492981f0b45e
	.xword	0xa1ae8b81dfa66c33
	.xword	0x7f342cfd2c2a0d22
	.xword	0x514547d4e056d355
	.xword	0x744095429c487a4b
	.xword	0xfad4715c4696a15d
	.xword	0x14823d779b7bc01a
	.xword	0xfdd2a72de6787c6b
	.xword	0x57f2709bb28d2146
	.xword	0x813da1fdd1095642
	.xword	0x72bc400d3ef438a0
	.xword	0x96bcb96000054330
	.xword	0x4b8af548bded405d
	.xword	0x2a9146e320577544
	.xword	0xa7f73e5966390402
	.xword	0x4352b41058046f71
	.xword	0x46dfed9707b00768
	.xword	0x8ef23270bd69d4d7
	.xword	0xae49d78b974cea7f
	.xword	0x85928f0941aff6f1
	.xword	0x6284333faf324def
	.xword	0x3f8ef789ddfdca2f
	.xword	0x7a501182ba42486c
	.xword	0x297004a7406df9ea
	.xword	0x0588ca189d8f44d7
	.xword	0xc141f803f1db8915
	.xword	0x4e663bf2fc6688eb
	.xword	0xcfa6819a91cbcf58
	.xword	0x3c785998e4cf9c7a
	.xword	0xab17536e05606231
	.xword	0x0e2ced54461c0c08
	.xword	0xe392f49643f6737a
	.xword	0x37b863320bcae10a



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
	.xword	0x825bb7666e5d1759
	.xword	0x68302a590d0242c4
	.xword	0x3364e03f5ab605fd
	.xword	0xa6bbc7e410943242
	.xword	0xb0f48f077be183d6
	.xword	0x3db958e8edb5b409
	.xword	0xd6e8a943e96662c6
	.xword	0xe55af6a6d3c482f0
	.xword	0xdb3e070332b7e2f7
	.xword	0xd5c1a3cc7cb91488
	.xword	0xe26b29ce08ea10d7
	.xword	0x7c4ab3fff240c6a7
	.xword	0x4a4688ce4aba1614
	.xword	0x589a350f8c4faac6
	.xword	0xa643aed42132d0f0
	.xword	0x3bd3aa8a82be1f3e
	.xword	0x64ef98e4756fc33a
	.xword	0xdf8e1ed1a4dd153e
	.xword	0xc7526ea039d59cc4
	.xword	0x3b261d96a8f46c25
	.xword	0xf4f9faaad37e3bc5
	.xword	0x6610c7e387996200
	.xword	0x0f04fe1e8b614675
	.xword	0xcb76555cbe8db3b4
	.xword	0xab2d0c8f9ae96742
	.xword	0xc2a25e92fa10dc79
	.xword	0x1388255afb141b91
	.xword	0x6fea536e41507484
	.xword	0xf2f1eac8cfebd804
	.xword	0xc38a08652e3a8fe7
	.xword	0x17ac662142e4ec37
	.xword	0xe6b69ea68d920f65
	.xword	0x0adf815a07426cfe
	.xword	0x684ddbfa043026ba
	.xword	0xd881f1a1638d8765
	.xword	0x725861ea52040c4a
	.xword	0xa73e0e352c46526c
	.xword	0x95b61f1dba38905c
	.xword	0x32239a113035a22b
	.xword	0xa7d4d80b04197570
	.xword	0xb66911bf1baaf46c
	.xword	0x2081f3e747222f04
	.xword	0xd7cdaf9864dc780b
	.xword	0x2fd374acde0d91c4
	.xword	0xb926cf32ebaeec45
	.xword	0x51903ad11689c461
	.xword	0x3e8fa743e678f13e
	.xword	0x658d3ce217749d83
	.xword	0xd7ef5358d6f0cbcc
	.xword	0x281735a85929b589
	.xword	0xfa3faaf3be75e5a1
	.xword	0x0a7eef11af8b1222
	.xword	0x3c80c0ea9c81df8b
	.xword	0xb5d8f7d572c1ce62
	.xword	0xf0d1b7bf27fa4728
	.xword	0x935578fd864a6017
	.xword	0x4177f2f46d209735
	.xword	0x5c0ae13994f983f7
	.xword	0xb19c6fdd7fe4e8e1
	.xword	0xbe2665d30a49e0f4
	.xword	0x79a40a7a85d0d63f
	.xword	0x48597e9e75adaa67
	.xword	0xf0f9b2f835cff66c
	.xword	0xb6547687efac086c
	.xword	0x9603757f68129f25
	.xword	0xe002c213085b8c0b
	.xword	0xb9cb0a95e50ff32f
	.xword	0xb8c01029245103b0
	.xword	0x7f3ac75e32d66f20
	.xword	0xe3c03ddcec8c997f
	.xword	0x481080836d4da004
	.xword	0xb1d03ac1b0ad6794
	.xword	0xfabfb254616f2cd0
	.xword	0xf1ed13254174fa0a
	.xword	0xcb3b6c63d2926d2c
	.xword	0x8b8f0adf44a27eb8
	.xword	0x1adc57c044369751
	.xword	0x66574062229d9ad1
	.xword	0x33d0fd9400fa99c2
	.xword	0x0ebde8ea32103775
	.xword	0xbcd6c91749ebc92b
	.xword	0x4a48e0f1a70c42e4
	.xword	0xc24e140fbe8a6cd4
	.xword	0x8b7a8d0a1e904c85
	.xword	0x9188f0329b32f1ab
	.xword	0x6496e90eef41ee39
	.xword	0x3ad91f184715fc0f
	.xword	0xdd1028165823d230
	.xword	0xc437d39c7653eced
	.xword	0x734384a0329ae116
	.xword	0xb682fec6c43372ee
	.xword	0x0d44c67bb7aa7abf
	.xword	0xc9d21f21f1d62395
	.xword	0xcabee06ecdf19c04
	.xword	0x7246796853bc021b
	.xword	0x92a15e8510d91bc1
	.xword	0xb9dc44e9da935d90
	.xword	0xc232bb53579ee4c8
	.xword	0xeca27b67e867fe67
	.xword	0x9ce2a782cc78dc08
	.xword	0x0a47d9f4dfae7c06
	.xword	0x4a720f4a75c5fb64
	.xword	0x2b33dfc38b8cf3e4
	.xword	0x8d52cadddcd154f7
	.xword	0xf33a7c649fc279a8
	.xword	0x146ccd08207d7c64
	.xword	0xce8eec9d5765b3b6
	.xword	0xda3c9fe666775155
	.xword	0x3c45a82178a8924e
	.xword	0x5effd06be182589a
	.xword	0xb9aa3640843aa567
	.xword	0x77e2da35c229c9ae
	.xword	0xd8c2294f646afae8
	.xword	0x5f1ab9f2d7399789
	.xword	0x84b7bf6b7b559174
	.xword	0xd82621ac31d75353
	.xword	0xaa534171f7287de3
	.xword	0xded8890997c06b4b
	.xword	0xfbd3ce733902e9cf
	.xword	0x5fa575a12271cb80
	.xword	0xe79c629424cdbc54
	.xword	0x582d0e1c5023da56
	.xword	0x56fd4934c7f1b802
	.xword	0x2477334c6f47b7c7
	.xword	0xe92228768a0b601a
	.xword	0x51edeaf00a746b10
	.xword	0x7da00bc663765a0b
	.xword	0xb816e4611140d1d0
	.xword	0x3d007326e14c5776
	.xword	0x091af678cf6d9079
	.xword	0x491ae102ef03cadb
	.xword	0x5ed9fe386df561ad
	.xword	0x19f586e4e8fe646e
	.xword	0xf2408486ebb0b8ef
	.xword	0x504a9db35923186a
	.xword	0x3b6ca39cbb1c31e7
	.xword	0x474e84e6ef754ba2
	.xword	0x917fa49fc1d0e11e
	.xword	0x3ea5136e6b68f9c8
	.xword	0x9026ab27e31dd40b
	.xword	0xb184f571f365aeb0
	.xword	0x89f0c72a0343cde5
	.xword	0xe4ef1f7cf458ec5c
	.xword	0x5d6a18bbf59438c6
	.xword	0xd166dda0c420f641
	.xword	0x465dc2182f8b8e43
	.xword	0xb6e7bc4fa2ced3b6
	.xword	0xb747e7ba11ebddb5
	.xword	0x8194e62cf6e7316f
	.xword	0x4376d6348981c7a9
	.xword	0x9561a821f672c00d
	.xword	0x690e4f3692fac73e
	.xword	0x3acf965a5b46a38f
	.xword	0x22fa543acae0b3fd
	.xword	0xe79d8c5af20e388c
	.xword	0x2d8a41e54f383d0d
	.xword	0xb0f9e214870d6976
	.xword	0xbe2e525b43c2a3f0
	.xword	0xfcd18cba4b549f2f
	.xword	0xc4fa7464f3c6d013
	.xword	0xc6dbd26946f7bdf9
	.xword	0xa70b50a05d06fbaf
	.xword	0xd093ecac26e124dd
	.xword	0x8f33eede381c9c1e
	.xword	0x8875701ccc9a9627
	.xword	0xb243bb6de1b3f366
	.xword	0xf053bd4f75386064
	.xword	0xf35437bfe8c09c76
	.xword	0xb8aad544014b7081
	.xword	0x3e30c6410dd46f8a
	.xword	0x57af6ffc9b0de261
	.xword	0x0f19bf5d12c0968d
	.xword	0x3a87ce815f5082f1
	.xword	0x92fb861da8e4dd98
	.xword	0xe841dc43874f4733
	.xword	0x034051cf6aeceaa6
	.xword	0x282cab582779d1a1
	.xword	0xcf9b02afce6d1c36
	.xword	0x4c422f9696b71f07
	.xword	0x6abc6257d8f8f403
	.xword	0x0d68b2294103f4cd
	.xword	0x2a876084ad0972a7
	.xword	0xd953dfd2a2f8c2d2
	.xword	0x89fc89a561dd9299
	.xword	0x6642160082d5046f
	.xword	0xff8a811dc0c03502
	.xword	0x8007399e306a1e6d
	.xword	0xfa3f1b015b34b8ba
	.xword	0x5c850c224bf1563e
	.xword	0xee0a584f107daacd
	.xword	0x033ad13875f28f61
	.xword	0x52e3b2f620b40d21
	.xword	0x4849dcd8b10a62e2
	.xword	0xc49d4ad43880fb6b
	.xword	0xf12e781cd5dda7e1
	.xword	0x815e51437e521a0d
	.xword	0x885a16bb6b34830a
	.xword	0xe7fb4a8dacf62a13
	.xword	0x7157980bc2be63f6
	.xword	0x57d37f7cd9ac3bc3
	.xword	0xc74e738efd243214
	.xword	0xd7aa57cfc311f799
	.xword	0x6d7ade20e75679e4
	.xword	0x71b4ce76a15642c2
	.xword	0xb4c9ee328eec8414
	.xword	0x66ab43f6c982cb48
	.xword	0x3fab82fe82b00e63
	.xword	0x7598f819f4117b10
	.xword	0xb692010793215af3
	.xword	0x4f5c5657a278c799
	.xword	0xf7f9230098038354
	.xword	0x3b252a986a496493
	.xword	0xe40b723f73236b95
	.xword	0x42e8111cadab69e3
	.xword	0xe62670a01f134e25
	.xword	0x4a6eaaea6ae4fe8b
	.xword	0xc528827240ffd24a
	.xword	0x4b2ac9514069314e
	.xword	0x9e2c2d2781250900
	.xword	0xda93c6de44c1c774
	.xword	0xc9e73bc0538927c9
	.xword	0x25b95e1efd72d4d7
	.xword	0xda911110b0893ff6
	.xword	0x166f21221511d850
	.xword	0xce755468d214b2b8
	.xword	0x8af92bfb186a119e
	.xword	0xb4817700d864e33d
	.xword	0x9ed3c8e7a7e9616c
	.xword	0x3eb01bcaa9dd5350
	.xword	0x1fb4359e57c492b0
	.xword	0x558a739cf8ec9524
	.xword	0x62d365effa6b1b3d
	.xword	0xcd53624827aa8fa5
	.xword	0x1d15b167cadead1c
	.xword	0x86270fd1bf5fb071
	.xword	0x3e5cb6bcbdc98825
	.xword	0x17ddc36a8683fded
	.xword	0x07e824b0568ae85d
	.xword	0x752193b4b1a52178
	.xword	0x3918082be94cbb81
	.xword	0xa7106f8229b976c1
	.xword	0x604623d0ed55d7f2
	.xword	0x763295371df57e14
	.xword	0xe68dc7f38691bdae
	.xword	0x2afe4ab9c729c4ef
	.xword	0xeecf4a35be7afb30
	.xword	0xbcae57396067f708
	.xword	0x26f6757a5af2afb8
	.xword	0x9e09e63cc39d0ee6
	.xword	0x53cfc0f0ef873695
	.xword	0x0f2bf6e8fa61cb0a
	.xword	0x1b9d7d3f16c6608f
	.xword	0x987e2e77f9c8ac17
	.xword	0x8d64cb241bb59a23
	.xword	0xe4ccb2435297ea12
	.xword	0x852a5de838c24883



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
	.xword	0xf305885f211b7fff
	.xword	0x1c52b9de1a2d1a65
	.xword	0x31f0b1290ad3939f
	.xword	0x634970ba0d5babd9
	.xword	0x6c7c687ce048ea1a
	.xword	0xd204e3bb442d7fc3
	.xword	0x1384d2a7d4af2583
	.xword	0xa071267914553cfd
	.xword	0x56827aa5f1dae536
	.xword	0x512f2fb4a17db1ec
	.xword	0xba57d0658505c62e
	.xword	0xb64a56002ad8cc9d
	.xword	0x5dbcba1123cb917e
	.xword	0xec4d728739b6e46a
	.xword	0xaa12202ad7e681d4
	.xword	0x7c1867d39d626793
	.xword	0xb6070fd0b4e80f5b
	.xword	0x7a9d59eef7cc7d2d
	.xword	0x9f0ab9e307eb21e1
	.xword	0x8b25a4364251f10c
	.xword	0xeb5f8308be1d93df
	.xword	0xdd69798f3390c6f9
	.xword	0xb5b5a17a648159dd
	.xword	0xad6bcbec13a14817
	.xword	0x7f41dba938e7a27c
	.xword	0x3a67e2a171f8afaa
	.xword	0x9323458ca7ef66e1
	.xword	0x5b639f80fc299131
	.xword	0xdedcb80bbc7991bd
	.xword	0xca30eedf7c1ac21d
	.xword	0xc492970ce984b212
	.xword	0xbfd7339ca1f429f6
	.xword	0xbd651fa799eb7d99
	.xword	0xf43c9a3ea9c5cc11
	.xword	0x8cb46d0d933fa379
	.xword	0x4640ac7ed4670cd7
	.xword	0x9dff79bd4534cdd2
	.xword	0x9cd8dcae6df33404
	.xword	0xc7376e87303c3aeb
	.xword	0xcee19d69487c1c72
	.xword	0x5921276ade65e5db
	.xword	0x1014b98740dcfeda
	.xword	0xd77616fce9e70059
	.xword	0x3db673b2dbe711af
	.xword	0xf3ee1d2599203f19
	.xword	0x2068f1b093501344
	.xword	0x063b34406679388c
	.xword	0x30575a78ec3dddd7
	.xword	0x6e2f843ed1f9b6a7
	.xword	0x6e841eeb8cfdb29b
	.xword	0x98ec1c54ff54d817
	.xword	0x1d97e3c28a400a46
	.xword	0x9f9fe2d1f1eb463d
	.xword	0xb91502dcf86335c3
	.xword	0x220338683d75dbce
	.xword	0x054243a748de5b1e
	.xword	0xffb28ee92a31f546
	.xword	0xb450f9bbd219132c
	.xword	0x951c45c74beac98b
	.xword	0x26d3ff80b97236c1
	.xword	0xbe50623c54b1760f
	.xword	0xfaf2d6c54814a0a4
	.xword	0x37471fa93b6f0a2c
	.xword	0xe5bb6411dafc32b2
	.xword	0xe8b5b675f4a80b13
	.xword	0x29496ee4da2621e9
	.xword	0xfded9e3cbcf6dd5b
	.xword	0x318c6ac0c29e9a10
	.xword	0xeff87b8d442a8927
	.xword	0xea88b5c5321dfc0a
	.xword	0xebb353bbd3fbfc58
	.xword	0xb6444b81d2fadbcd
	.xword	0x69adcec476ceb639
	.xword	0xf684a0c41e3d1e1a
	.xword	0xbfa3584469f5f28b
	.xword	0x8c83d2d95411ddc4
	.xword	0x73bd9771c3f3aa64
	.xword	0xb1057ab623270641
	.xword	0x9bef43a0030f0943
	.xword	0x904996da76724855
	.xword	0xdccccdd39d738899
	.xword	0x92d0e5b5f258c8c2
	.xword	0x1e853594c9be4e19
	.xword	0x2a9929a8bc771f13
	.xword	0xc3e730fd3774212c
	.xword	0xd5d7bea415c9e75f
	.xword	0xffa3a263ff9c1481
	.xword	0x43e3bca03e78e1a8
	.xword	0xa61cd156442c7844
	.xword	0x580ff65e28dd0e71
	.xword	0xac15fedb1a172157
	.xword	0x8cf8ce5a2183ece6
	.xword	0x8c5af13d3c4e4b21
	.xword	0xbe252b63ee7ee432
	.xword	0x7828620d78b553e0
	.xword	0x7689cd407402d4a5
	.xword	0xcd7238bcc55491cd
	.xword	0x6b79ea63d592a922
	.xword	0x0100768a7a0ebff2
	.xword	0x3b96daa7802e70c9
	.xword	0x1c5578c039e0fe2e
	.xword	0x6add32057e3349e0
	.xword	0xf9c2ee21b623a050
	.xword	0x556050f347ba66ea
	.xword	0x321ee054657bd643
	.xword	0x288e46ab3f0ed685
	.xword	0x093f46e43a0744f4
	.xword	0x373a07353d2477a7
	.xword	0xd50e9d89f9cd0b80
	.xword	0x5c5fc56b42d83053
	.xword	0x0c2b086a73def55f
	.xword	0x2359eb0613e322ab
	.xword	0xcc068cefe826c2a1
	.xword	0xf44e3f641ce051b5
	.xword	0xec022b52f75cb87c
	.xword	0x490688470f7e2e3f
	.xword	0x139c02b893e32935
	.xword	0xa1f7b5d93b5d22fc
	.xword	0x6229e46c1a9ae5ad
	.xword	0x7a29212f9a8d4ea8
	.xword	0xc8832594d6902a84
	.xword	0xdaa65f5349a901a0
	.xword	0x4e185106cf1b8207
	.xword	0xe6b56d03e84f925d
	.xword	0xc0936d1e0a7504b4
	.xword	0xfb8eb838be57f6d0
	.xword	0x82c25f0345df7637
	.xword	0x29a5d6575fc547b7
	.xword	0x9f62446ec432a751
	.xword	0x129a1e4b877e14f9
	.xword	0xc9fd476efd4f6e8c
	.xword	0x2d1e97156f7b127c
	.xword	0xe576d0a8100594d5
	.xword	0x3209db5ea1a1ddbc
	.xword	0x40638e05b663ea35
	.xword	0xc07ab3a629030551
	.xword	0xdd9bcb85e94f2361
	.xword	0x21cc3cae3c951414
	.xword	0xc976720260722709
	.xword	0x9260124807dcc561
	.xword	0xc233ff7492e56f31
	.xword	0x315c84cc2b375720
	.xword	0x980226cd1e891627
	.xword	0x548e9da876439793
	.xword	0xae668cb9112cf061
	.xword	0x78242e84683150c7
	.xword	0x7c4f251b32b8406d
	.xword	0x8017642418ba3898
	.xword	0x9e4dbe9297121bbc
	.xword	0xda668275d0fc9e97
	.xword	0x65c53888d45ef208
	.xword	0x3ccfecbe55179e43
	.xword	0xf38e4347c75c3fe4
	.xword	0xfadeaed8fea4d8ad
	.xword	0x188a203289d18a5b
	.xword	0xa4dc3996b3f199ad
	.xword	0x0b208ce639e7db79
	.xword	0xd8c552779ded045d
	.xword	0x31777a08f6735fae
	.xword	0xbc9c72343c303de2
	.xword	0xe2f454c2e0c90a81
	.xword	0xfe37538c7df9e264
	.xword	0xc731d6d7ba5388b4
	.xword	0x6919258ab970f2f3
	.xword	0xd54d3506413a9e65
	.xword	0xa1a64af5b6532551
	.xword	0x85a8bf7a21dc8b67
	.xword	0x2a257b7f5fd1361d
	.xword	0x2414529ba20ff589
	.xword	0x16df13316f86e9dc
	.xword	0xf8452b269e384d45
	.xword	0xc6d1f9e90f74741a
	.xword	0x934cb0e87b0d1df0
	.xword	0x03f235451009b821
	.xword	0xa6fd6ae774b557e3
	.xword	0x5553cd52218f5fb0
	.xword	0x9b8e3ee1be7c7fda
	.xword	0x0422cd7dc7b4ed2b
	.xword	0x0f37d95070b45bae
	.xword	0x4432cf88b152eccc
	.xword	0x5c6af982dcc29a8e
	.xword	0x99ac1103117201b1
	.xword	0x7b0e253161c79f17
	.xword	0x2d87a053141153b5
	.xword	0x6185ded67d5181bc
	.xword	0x7855bc3cc063dcc2
	.xword	0xf320f865ef80ae7b
	.xword	0x1230aefe8d0236c9
	.xword	0x98368a716c2e70ff
	.xword	0xc8d3df5322712b50
	.xword	0x2b7d76bd8f88f984
	.xword	0x16de593ef832f6d3
	.xword	0x578d9f4d4f6392d3
	.xword	0x0994c7a37dc2ff0f
	.xword	0x6e3d6be52ddd7747
	.xword	0x7b05916fd381f055
	.xword	0xd380afc503058cda
	.xword	0x9065e06bcfdc8c7f
	.xword	0x902d070fd07f410f
	.xword	0x00eba39f93ae448f
	.xword	0x4274ac5767d9725d
	.xword	0x610036b18c092385
	.xword	0x48561ea1b72d209c
	.xword	0x1c2d4ccf7ccb30c1
	.xword	0xe929a7f5a55015d2
	.xword	0x084e7ebc38f5b6f4
	.xword	0x0d3fc7fc640cd8b0
	.xword	0x074a35e4a473ca5e
	.xword	0xad15644dbec3e8d4
	.xword	0x648f38f524ac1a25
	.xword	0xcc0ca70b46368529
	.xword	0x156f4618e2573f1e
	.xword	0x27e8b6aab8fc3dfd
	.xword	0x45f65f11cc64646e
	.xword	0x96f27fb22eb924a1
	.xword	0x1f4cbf5b797f449e
	.xword	0xd15e1ddf30f81df9
	.xword	0x338a8eaba7bacff8
	.xword	0xf914c176fa9189c8
	.xword	0x5c767791c0ea5b06
	.xword	0x3e7b70bc68d3be23
	.xword	0x1d9a37f81e2b18a4
	.xword	0x299fe7c74b5bff08
	.xword	0xf1dd20e9e3b28ff8
	.xword	0xa39d93158571cb76
	.xword	0x4ffbfb0a61856d01
	.xword	0x16021716dbda511e
	.xword	0x5acce05479409a20
	.xword	0x2fb0ae9ccfefddf5
	.xword	0x94eadeea27af753a
	.xword	0xcd8456afdf816252
	.xword	0x23ce5b795e8a3e63
	.xword	0x1aebfa3902318586
	.xword	0xc2511451dd88e368
	.xword	0x7e1c9d1dcbdbb64a
	.xword	0x0368cfa8f5bfa834
	.xword	0x2d75233a982677ea
	.xword	0x6bbd5a16e2808d2f
	.xword	0x2739d22fa2c38c6d
	.xword	0x4c20afe5a588e049
	.xword	0xd06d7212a10386ff
	.xword	0x50d7111afdcd488e
	.xword	0x9b2c6aaea1f5cd4e
	.xword	0x3e7f4eed06ee49ee
	.xword	0xb2e92948ac8d3f89
	.xword	0x1161bcc68774cf4b
	.xword	0xc42dd74f3043bf25
	.xword	0x2d92fb06b56de80a
	.xword	0xbc3ba982e9ab18de
	.xword	0xe603f5f51cb817f5
	.xword	0x572052b57ecc7ab3
	.xword	0x20b7f95b7058e589
	.xword	0x993ba76c60b7a4ef
	.xword	0xe05c3c1c88c6049d
	.xword	0x9e1899a9120336b5
	.xword	0x6af952a95ad84ecf



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
	.xword	0xedeac7ade12adc68
	.xword	0x4151f35b5d53ec11
	.xword	0x70d0a9829f23fc4c
	.xword	0x942eca9c4d7b2b11
	.xword	0x8a3390c1368e73de
	.xword	0xef57dcc5754c057b
	.xword	0x8d0fb96797b246bf
	.xword	0x4d7406f634926e3a
	.xword	0xa6445eeec5fb6670
	.xword	0x9c5b597405e615c5
	.xword	0xcf1c7839dcf9fd3b
	.xword	0x3a600d431e259436
	.xword	0xa61abffac7e0c626
	.xword	0x839eb71d917383a3
	.xword	0x391a4a83879834a3
	.xword	0x9e1e493a1d95a0cb
	.xword	0xb7fc7a008c8a783d
	.xword	0xcba00e3341ef224d
	.xword	0x93f65bd84eb9a316
	.xword	0x88efcf36ac285c12
	.xword	0x1f7d39f5e9c206a0
	.xword	0x7b7910a98c41b955
	.xword	0xfc463e203789b25d
	.xword	0xadcb337015002b45
	.xword	0x0f778bf021746a17
	.xword	0x6491b77fbba42ff7
	.xword	0xf29c2fd81d9b4ceb
	.xword	0x14a47d817a77965f
	.xword	0x4e7380394deb3b12
	.xword	0x0fd27f9a18edac0a
	.xword	0x8ca5013bd1389bb0
	.xword	0xc1ae9aabfc1cc9a6
	.xword	0xa4b6a92ae497d4d4
	.xword	0x70ecbe6e15e55c6d
	.xword	0x70feb57c4228d973
	.xword	0x017e1439821f104e
	.xword	0xcdb02f289b72cba0
	.xword	0xf11ab4830a0f3d46
	.xword	0x01b46a18cb5107a4
	.xword	0x4b5863b532bac1d2
	.xword	0xe5429492d5748bc8
	.xword	0x6138d8330ac3a0eb
	.xword	0x029036ee826a6340
	.xword	0x44c43525e1a822c0
	.xword	0x8fb77ab099f8dd3e
	.xword	0xd36eb4819193465f
	.xword	0x3965fb4e615133c5
	.xword	0x6a8b0bf108bc4b54
	.xword	0xe11835a213220d6d
	.xword	0x0f170ab415a28fed
	.xword	0xe2c7e5b4342da715
	.xword	0x1319fe4af1ffad13
	.xword	0xf1cd215222bd12da
	.xword	0xcf067cc3f456d8ee
	.xword	0x9dd654f298abafdb
	.xword	0xabe3869fcd30233d
	.xword	0xf1614f8f6ad274c3
	.xword	0xee4f3da2504538ab
	.xword	0x063b8956a2e1f5a9
	.xword	0xc7fa6f613baa91c4
	.xword	0xca21b0b7a78c440b
	.xword	0x60b0bb1e7602a157
	.xword	0x2d5d42c845341aff
	.xword	0x30e84df4b9524509
	.xword	0x077235139e1ce088
	.xword	0x3a9926dd4c7a1419
	.xword	0xb14355cda9a42f91
	.xword	0xcd51d6bf48ae206f
	.xword	0x2067ae18dde8fcc1
	.xword	0xa19f2839b7006ca3
	.xword	0xc3c0e21a9d23fd05
	.xword	0x9e4a70f1de2d17f8
	.xword	0x5fe45d49d7a456d5
	.xword	0x6d34044d6a3687e7
	.xword	0x33fcd7d02c052edc
	.xword	0x60d460735d7d6710
	.xword	0x9b3f901807d913f2
	.xword	0x74a64463ef00812a
	.xword	0xc4e6ece4f9d52705
	.xword	0x109c5d4b2a594d75
	.xword	0x2793cb17afc6fa7c
	.xword	0x37429e82960f3285
	.xword	0x831ef8e28e758e4c
	.xword	0xc6ca00b021318e0a
	.xword	0xed0c487e84b2ef83
	.xword	0x518478076bfde346
	.xword	0xe98ec92ba64422b6
	.xword	0x2657215439bf4a63
	.xword	0x53a97bbdd12390c9
	.xword	0xa3e6412ee39efd25
	.xword	0x62d3c5c50de87103
	.xword	0x62f3c01d04350999
	.xword	0xec8f774fd518a6bc
	.xword	0x1e2fe2468b18699a
	.xword	0x7af84a892541bba1
	.xword	0xf3633fe7b1ecb367
	.xword	0xb5ad90704e833ba6
	.xword	0x225e510b559bceb7
	.xword	0xade7bbeaf9ca96da
	.xword	0xe5e8011b5e7bdec7
	.xword	0xefa61a1d47a9a11c
	.xword	0xbfb8f035c26bd839
	.xword	0xbb118e78c7df2379
	.xword	0x560eca41262fcf54
	.xword	0xe1222f4426a8713d
	.xword	0xe2ec6013a6e9c403
	.xword	0x97daf68c6db6db58
	.xword	0x998cd59026a0078c
	.xword	0x6473dfc5869cba36
	.xword	0xca146595a59f67de
	.xword	0x4065ba3e315061c7
	.xword	0x52d18687c6f6127a
	.xword	0x77e6a4b42aef0e01
	.xword	0x4c0109ac0d0092af
	.xword	0xbea94bc722916068
	.xword	0xbe55f649882f4dc2
	.xword	0x40b9729e06b31bcb
	.xword	0xf70a7ca9cd67d75d
	.xword	0xd49fb23a5342d307
	.xword	0x80f787e23b1e21fd
	.xword	0x47c75b4e37b2665b
	.xword	0x5f61d4f154de5062
	.xword	0x8b3d637936d72b34
	.xword	0x24ecd78ec89fa528
	.xword	0xa2d9f9462a472f94
	.xword	0x0e84f5c065a56d0a
	.xword	0x95e8c59662b2a6a7
	.xword	0x60f29be2da12c2ab
	.xword	0x3180f0771a1fd288
	.xword	0x5272da01b2c47504
	.xword	0xab3ca710c074efb6
	.xword	0xfbd8e803c7297729
	.xword	0x9922f0f75414029f
	.xword	0x498037d7a1b8785a
	.xword	0xe6b2c5858363ca15
	.xword	0xb620e86779fadc5d
	.xword	0x6f6c45bddd7027d4
	.xword	0xe46349f6b1e9a975
	.xword	0xe856fe2b58a2218e
	.xword	0x7ac1407a35a28d8e
	.xword	0x5a2e99f827bffc8a
	.xword	0x4a02ba2337e0217d
	.xword	0xaa8db7eab0fe5fe0
	.xword	0xaf521d3e4be958f7
	.xword	0x17efb45aa96e9e2a
	.xword	0x0cff172c730a55cb
	.xword	0x29224b20c96cef8b
	.xword	0xa357aaf9bc9c99eb
	.xword	0x1309b212bbaff40a
	.xword	0x7bfec4cf3c998229
	.xword	0x16c5c830bfb1fbc8
	.xword	0xef8578c7bcead46d
	.xword	0xf67bf302b03736ed
	.xword	0x7fac9bebe311d587
	.xword	0x23c067c1be45a8f3
	.xword	0x35491fdf99035538
	.xword	0x15fb2dd83cc05656
	.xword	0x7ef339f568d15a7b
	.xword	0xde26955d95faaeef
	.xword	0x36e56204940a9586
	.xword	0x0e1bf9874d4a116e
	.xword	0x8719dd56f6ba3873
	.xword	0x56bf87018d50fca8
	.xword	0x8c799878bcec9656
	.xword	0x81b8e072384ccd9a
	.xword	0x9fce91b244e87174
	.xword	0xb22248adabf07533
	.xword	0x65154c0da7a86819
	.xword	0xcc3aa90646e90997
	.xword	0xeec1256c27409f5f
	.xword	0x55653906de5aeca4
	.xword	0x53ccd83bf82c46c5
	.xword	0x55124bfa06bee3e8
	.xword	0x887c3cfde63f65bc
	.xword	0x1c29e09d1677a8a8
	.xword	0x74214e6ba0ddbf48
	.xword	0xdf2709e86efce1f7
	.xword	0x0de0f49c609c6331
	.xword	0x9a5e3d13b7f415c9
	.xword	0x9d1e3e1181d7708c
	.xword	0x2dc898e13007bfde
	.xword	0x889baec38c636688
	.xword	0x8d4289516d8133b5
	.xword	0xde0dda04c7dd87d1
	.xword	0x698a719a48f25e02
	.xword	0x2498fa281f2f2725
	.xword	0x77c8fd9c7f2b1549
	.xword	0xcecbd72e46a8747f
	.xword	0xcb1f1008f6fd99be
	.xword	0xcba5364c587370c3
	.xword	0x6a47a8ec9f9ae19e
	.xword	0xac3801ec38cf7d63
	.xword	0xadb3184c5bebdd12
	.xword	0xc6b415b86f6712db
	.xword	0x7c058e56f1fa6ebe
	.xword	0xccb18569a057a08f
	.xword	0xc3aee5ff9ea98c32
	.xword	0x61499b8ce27a0319
	.xword	0x5bf8841a1c3058de
	.xword	0xfaccbd7e44fb2a9b
	.xword	0xb07ab2972ac9832d
	.xword	0xee82cff11c9d930c
	.xword	0x9590b3c230c3b78f
	.xword	0x1ad2f5b3bf7eed9c
	.xword	0xd83bb8e08794a054
	.xword	0x6e7bb5317af517b0
	.xword	0x9a879a552427e3f4
	.xword	0xb7776f1995220007
	.xword	0x6f39ffb993a13dac
	.xword	0x44efb9a23cd1e106
	.xword	0x0b6f57bc4fd9eeff
	.xword	0x1959d03fcb54a3ee
	.xword	0xaeecec6a50c89f58
	.xword	0xecf3a0b6f18f348f
	.xword	0x6cb0e59d311531bd
	.xword	0xd34e6592019e62c5
	.xword	0xc1a6d927c8baa311
	.xword	0x1e02d9008140be4f
	.xword	0x1a52b6cb79e9f530
	.xword	0x5f8c184876c28187
	.xword	0xb8bb590ee9b4ef0c
	.xword	0xb55fed03bdb50605
	.xword	0xf00d98c9cf896b2d
	.xword	0x14e7a06b6db9a0c9
	.xword	0x0db7df0e4ed57a7d
	.xword	0x6ce86729553efc78
	.xword	0xa80a8fa66022bb4f
	.xword	0x66e4fb074dab4dcb
	.xword	0xd05bfd953ddf07f4
	.xword	0x0a9a877375450764
	.xword	0xc8f80c1ae5e01ec5
	.xword	0xa915a3ea07f8ffdd
	.xword	0x789193070c2b7e2c
	.xword	0xaa952e04ad4f1ab1
	.xword	0xf0a72888344f4f06
	.xword	0xdf00d4694f2fba5d
	.xword	0xf5349d2e650cfdcd
	.xword	0xef8ead1c7cf019f0
	.xword	0x4f89fdc943ed8f18
	.xword	0x1af14d7773506345
	.xword	0x6c5835524304f443
	.xword	0x5e5a93b90775e94a
	.xword	0x4f4828a1ba791ce7
	.xword	0x51c522aa0969d873
	.xword	0x1246b61798ea2eab
	.xword	0x51c1bd4461e345ed
	.xword	0x7d6edbe8a54965e3
	.xword	0xcf779d50ef4d26fa
	.xword	0x212e061bcf3e3627
	.xword	0xe0daf0ca0745701a
	.xword	0x95f2e20dd2273980
	.xword	0xc4083c2bdafd4a5f
	.xword	0xcd611f4fb828cf74
	.xword	0x9910ff45fc26f227
	.xword	0x4e7fa6aaad5f9ed0
	.xword	0x72502ae921b2aedf



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
	.xword	0x8b2216b5add6d6a9
	.xword	0xc6593e5ec1487831
	.xword	0x819e57039a9ebb66
	.xword	0x8c4673ba5ef4cb5e
	.xword	0xdde6f2d8a99e200b
	.xword	0x9cd79b80f3c56035
	.xword	0xb4bbb606b5585e27
	.xword	0x0be4e8857d1e73ef
	.xword	0x8d420e7885f8163f
	.xword	0x9f34f14dd4ebba9b
	.xword	0xe600dc9280661938
	.xword	0xa1bd0157b4279dd1
	.xword	0x7387ba0737089ac0
	.xword	0x71e574e91918a040
	.xword	0x7c3df70a8a69b8b8
	.xword	0xbc51933588979ef8
	.xword	0x10d6e84382c13010
	.xword	0xf6c2827485e544f2
	.xword	0x96cbbaa05217e32a
	.xword	0xe1e715114e38b1e5
	.xword	0xe69588617c4dce9f
	.xword	0xd84f0d1a5733f713
	.xword	0xc8d424806a989863
	.xword	0x6342f34d1c26f041
	.xword	0xc981b9b8ace9cec5
	.xword	0x019f4ceefcc76573
	.xword	0xf4a360833a1c8135
	.xword	0x741b17061ae293a8
	.xword	0x83cf9f2797ba438b
	.xword	0xe156b8f739879641
	.xword	0x7f8e65dec9176abb
	.xword	0x8f707ce48398c192
	.xword	0x78370b063c289167
	.xword	0xf6e480d8624cbf70
	.xword	0x5b5d20f06ef8403c
	.xword	0x43c8656f66fa3908
	.xword	0x7a2c684b61a007a1
	.xword	0xd3b912bacc501b51
	.xword	0xe0472ac7fd7d1632
	.xword	0x44515eba72308e02
	.xword	0x5246ff4adc52b241
	.xword	0x2c9ac97d5a9d20a6
	.xword	0xd1685eacb928c0e9
	.xword	0x3699aa3ca1265037
	.xword	0x093092ce21848dc4
	.xword	0xf373e80304407803
	.xword	0x096b738579211c70
	.xword	0x0b9a4bf1a8ad48fe
	.xword	0x3df9c747aff92270
	.xword	0x90abb9e4fa585a02
	.xword	0xa267a66cc1445f15
	.xword	0xdb27e8db591531f5
	.xword	0x265d0dbe2b5b574b
	.xword	0xce74a278d1344d37
	.xword	0x27da9f55d89dd67b
	.xword	0xa32ddbc7a374a131
	.xword	0x6700dacb9d101c37
	.xword	0x4bff8bea4c6a2e5c
	.xword	0xb5ed9750e539dc6e
	.xword	0x2c664fc958653788
	.xword	0x6087c07920a3f652
	.xword	0x37e40a9b878ac931
	.xword	0x1f5c09ccd2ac8a30
	.xword	0xf69c3c4392c1d8ef
	.xword	0x26909973b084036d
	.xword	0xc0cb596322bc2ae8
	.xword	0xbebbf35245c5528e
	.xword	0xa2f12dc5919549f9
	.xword	0xd2ba1f313308b2fa
	.xword	0x7cd5692ce7413c93
	.xword	0x1c5fea81636cf168
	.xword	0x9f23273fff8b3cf6
	.xword	0x491e8fd5b0163511
	.xword	0x9fade0c0011b4cae
	.xword	0x6d680e149b676004
	.xword	0x92e0dc391518c057
	.xword	0x1759417b90f059da
	.xword	0xbbcc691683623fec
	.xword	0x4b26038ec82a73d0
	.xword	0x0d7735a5566f4d43
	.xword	0x863d288694a4e756
	.xword	0xc47d8cb5006b2e0d
	.xword	0x91be63007aa0f2b4
	.xword	0xbecbf6ea1e00d2fd
	.xword	0xb8e1c11e6978810e
	.xword	0xb9fab12eb57eb1db
	.xword	0x03b7819f85f25dcf
	.xword	0xf49718faec2dda46
	.xword	0x188fe726c41f9653
	.xword	0xfbbbacbf8cbccc7d
	.xword	0xc8a8e9e5284600f5
	.xword	0x0fb1f6afbcf37043
	.xword	0xa0c1bf1e0296e6a8
	.xword	0xeaf91feaef9f76c0
	.xword	0x50c9baca29729d75
	.xword	0xddd8cadd71711c6c
	.xword	0x41804d244f79c32a
	.xword	0x6e22954ddcfa8f19
	.xword	0x779021ece163b1b4
	.xword	0x8a5426cf812b20fc
	.xword	0xea5d1c5eafc739f2
	.xword	0xaaefc1ee35c7ad4d
	.xword	0xb86159a4b6173742
	.xword	0xb6dcf851323319b8
	.xword	0x5594de3e672527cc
	.xword	0x0227332850f672a8
	.xword	0x756db1321295a0ca
	.xword	0x7759f9b0e3aab80c
	.xword	0x81872a8a97c0a791
	.xword	0xec6ef6775715eef9
	.xword	0x7498771f4045090a
	.xword	0x342d7b9ed0dff32c
	.xword	0x55ba96ec4305d090
	.xword	0x367e74212775dd75
	.xword	0x1d6f54e71b572bb5
	.xword	0xaa9a97934bc64b51
	.xword	0x9f691c09db36fdfc
	.xword	0xaa5531b972686ae9
	.xword	0x0bcdc0146f8e5cb4
	.xword	0x57d3f3900af7cfc4
	.xword	0x959730a497fc5101
	.xword	0xc0d6cf82a2635729
	.xword	0x6f71d42a9380adac
	.xword	0x249edd5d627fa6fd
	.xword	0x38fe643366d8ab3a
	.xword	0x671c9f43e96e8275
	.xword	0x0f43759389aefa77
	.xword	0x685af429387df218
	.xword	0x47090c49aef1c06a
	.xword	0xbd0e6b9ecd032d65
	.xword	0xe2d18bd6ad14e86e
	.xword	0x29f949752efbdf78
	.xword	0xdd0902b7ad5fbfdc
	.xword	0x134f897e5c79a69e
	.xword	0x3728f21966e44955
	.xword	0x3f5ba68ec3903961
	.xword	0x4239263fb7be7a9c
	.xword	0xcdaad114dcfc455c
	.xword	0x8cb2172eeb5b7df8
	.xword	0xecf331bd1e5f38f7
	.xword	0xbe7fb32590dba9cc
	.xword	0x4aad925ccd211013
	.xword	0x439c8c689a5de2ff
	.xword	0xac213a037c5d7c01
	.xword	0xf3a457840cdb9f5c
	.xword	0x222ad15a4c40c00b
	.xword	0xb4181c6b78b5a592
	.xword	0x2254bc6cfccaa35a
	.xword	0x654127ec5fce1715
	.xword	0x1b8931f754c6f7a5
	.xword	0xd9c851f0835d481e
	.xword	0xa54095c3f00573e5
	.xword	0xa6cf770a11e6e3a2
	.xword	0x7e2934358a6c8514
	.xword	0xf519c400bb5260c4
	.xword	0x35b3f4fd13cc4cdc
	.xword	0x96bbc778394a44b6
	.xword	0x55414fe5327565b5
	.xword	0xc21d2a481dbc6574
	.xword	0x8f7bc3de274f95b1
	.xword	0x1e3abce6935bfded
	.xword	0x4cfe04ed4bf527f3
	.xword	0x3c016224b7f35a11
	.xword	0xfac9976013fbf3f7
	.xword	0x592567f357d89057
	.xword	0xa0e58a6cc6797bd0
	.xword	0x06ad38c811a835e7
	.xword	0xa83dabe9235e4e06
	.xword	0xab8f3da5cfa739d1
	.xword	0x95a5241b74f6006b
	.xword	0x74f753174bb8cb50
	.xword	0x09b4c2e0448549fd
	.xword	0x8565520c092b34d3
	.xword	0x5469d9e217e8cdc0
	.xword	0x8b5b51e2859172f8
	.xword	0x7d2b17c856366d18
	.xword	0xe1212291548d78af
	.xword	0x21690e94ee7e54d1
	.xword	0x07b703c0f2412167
	.xword	0xbe52a12b3edc7ec6
	.xword	0x0ab0626d71e3b2ae
	.xword	0xb13a1e6486faabad
	.xword	0x977d729f9a1f22a7
	.xword	0xe91063524c38dfe4
	.xword	0x02dd30a29342a4ab
	.xword	0x1bf8f36f23b60e87
	.xword	0x5831b62a39e390df
	.xword	0x7778a78b7a105968
	.xword	0x526bdf7fafa8e9f4
	.xword	0x96446e81eb01c84c
	.xword	0xd761a051b49b2df2
	.xword	0xb21d433ce151a813
	.xword	0x3b7cd1b58f3bf2a1
	.xword	0xe4ba966c98bbf321
	.xword	0x7143779ad4b95bc7
	.xword	0x0e375a67d39f396f
	.xword	0x044420811794377a
	.xword	0x614273475d46ea9b
	.xword	0xb36b23284395bffb
	.xword	0x84860824d10da661
	.xword	0x9762da67bd5ad834
	.xword	0xa3e777c5bffc8126
	.xword	0xead262bd47f756f0
	.xword	0x10611c638e0474b8
	.xword	0xffe967ac28e2bf87
	.xword	0xc5cb3d3f9d505bc4
	.xword	0x6635932214f89d5b
	.xword	0xef847fc1a8718d76
	.xword	0x9ee82b8887cc35d1
	.xword	0x57b3a45be85d61ed
	.xword	0xcd9f64dc640d749b
	.xword	0x7e88ca67736f80e1
	.xword	0x6f5a4a774e1f996a
	.xword	0x9d478feda31b4bb4
	.xword	0xfaaaf45b8e05a8ba
	.xword	0x6de58de159109576
	.xword	0x11fd024f1da242dc
	.xword	0x1ddb9780126a8b26
	.xword	0x1fbce4a8d46f306c
	.xword	0x8dea94d5d809dd26
	.xword	0x4667ee9832f9a41b
	.xword	0x026e2fa6211dee73
	.xword	0xe1ead0bb351fc25e
	.xword	0x13916c0628f3ccd9
	.xword	0x800c77f557d605da
	.xword	0xffce7ce6fd21ca48
	.xword	0x4b8e13ccfaafe77e
	.xword	0xd2fe4f0c840af6d7
	.xword	0xffbda8081b3e1fce
	.xword	0x76f993766657509d
	.xword	0x833fa5981db5ce58
	.xword	0x301d0024722f460e
	.xword	0xee6c266de3b5e9fb
	.xword	0x3f95b642692446ab
	.xword	0xa21e7e6cc279dd4b
	.xword	0x13a58be7d0feff1d
	.xword	0x78430fbfa3dfc623
	.xword	0x6eff03ed1e0d9af2
	.xword	0xd934df4113a47beb
	.xword	0xf5546f6d2caa8277
	.xword	0xee510529d5fdd2f2
	.xword	0x19d857a0226ef19a
	.xword	0xfb59ace0fc62c858
	.xword	0x20237d459daf5c3d
	.xword	0x08a23407f629a8c3
	.xword	0xd1945da7c9c173cf
	.xword	0x641df985f2a547c0
	.xword	0xfb172d19fbfc6e6b
	.xword	0x3199ef9bca746196
	.xword	0x7d0af9fbaebc9cdb
	.xword	0xeb099e5c0adc2e97
	.xword	0xaefd30ab889ffdab
	.xword	0xbd2a606a6c99f427
	.xword	0xaec4f415095adbee
	.xword	0x2451f056afa561f2
	.xword	0x085192f517a77bb1



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
	.xword	0x813505eec27bb28e
	.xword	0x288aeef2a4cfd618
	.xword	0x328e53b244d67539
	.xword	0x48fe5d855f372d31
	.xword	0xafa81d5602eb4d3d
	.xword	0x4c117b451a76eba6
	.xword	0x4dd0e3d22e5d30fb
	.xword	0xd9a2956dcb47b87c
	.xword	0x4c39db3ed7f10d10
	.xword	0x6cf1f7386c3563c1
	.xword	0x72593211e7a2c9a0
	.xword	0x2d3a2e52fb551841
	.xword	0x7586dc7f485bb329
	.xword	0x66935abeb81ec45a
	.xword	0xb858b08c360594f6
	.xword	0x4cf0a21f671f81ff
	.xword	0xa1145bb8924f0d87
	.xword	0x5b6cf61ecd051085
	.xword	0x51147c36e6245adb
	.xword	0x34e516ed826da6e5
	.xword	0xc15f243c3bba3432
	.xword	0x3ee51cf5a91c2680
	.xword	0xb9be6fdc6341ac9c
	.xword	0x46ef75d2ca70fe9b
	.xword	0x4b3576a12cd3cd00
	.xword	0xc0eaee31ad4ff3dc
	.xword	0xf327503399462a0f
	.xword	0x76b44c826f67dc5b
	.xword	0x559427347de1fe9a
	.xword	0x787b487fcf4d185f
	.xword	0x31d4ea8e2289d915
	.xword	0x07a2ff94a7a6adb2
	.xword	0xe8d9a951d1a63249
	.xword	0xd855225b196f3820
	.xword	0x1e67630c4161dfb4
	.xword	0x0c251917062ad606
	.xword	0x4ac669658be202a2
	.xword	0x7d5e23ce42fd5cca
	.xword	0x8c7b51a3d1133337
	.xword	0x6c81cd24a82087c7
	.xword	0x9d6f1225b0558924
	.xword	0xbbd07a2d5ac54139
	.xword	0x162eb2541a03bf79
	.xword	0xe9990b0e960e627e
	.xword	0x0989826547444ed6
	.xword	0xd5db1aba80464087
	.xword	0xf8ef09a46b6cc22c
	.xword	0xc3701b4e8befd782
	.xword	0x1a8e6f764847df29
	.xword	0xe8f61ee81cdf91be
	.xword	0xb0562671a1a6e32d
	.xword	0xc1f2b2ff49f11864
	.xword	0xb560ef73fceaf80d
	.xword	0xe4da566a4b7391a6
	.xword	0x718632c544a78f5d
	.xword	0x3de363664037cceb
	.xword	0x00544cf52886e536
	.xword	0x59a752908a0da3ef
	.xword	0x4c00e1ffc4b77a5c
	.xword	0x48c7d8b4b76f281f
	.xword	0x684096686a509107
	.xword	0xb9f1b31374a17e0f
	.xword	0x571f0d95096a71bf
	.xword	0x470f6e2e6663ae97
	.xword	0xd357c43c5fa5d7d5
	.xword	0xea0a5c452abcc484
	.xword	0xd4946a68e85d3284
	.xword	0xf2c1fef4d0dc905c
	.xword	0xa3986049a06f883d
	.xword	0x653f24ac26b7121e
	.xword	0x42c5ab82450abb1e
	.xword	0x9c6e7e9071c22e02
	.xword	0xf4ed66ec0cbf7421
	.xword	0x74cd3995a29edcbc
	.xword	0xeb40f796e567f4a6
	.xword	0xe319525e11c1be47
	.xword	0xf08104237bffae2f
	.xword	0x7309119d164a3342
	.xword	0xd5ad88de0db814b9
	.xword	0x74ea45fd2630bc97
	.xword	0xe14007d7d65c2876
	.xword	0x5e24c1f608041d44
	.xword	0x0cf3ac64e5f97676
	.xword	0x3a9eccdfef9780c9
	.xword	0xcc8135133fbdcb9c
	.xword	0x0ccec76059cbca2b
	.xword	0x25ea3483412aaeb4
	.xword	0x7b2217a67f90b5fb
	.xword	0x388ce3e1dfad45eb
	.xword	0x7848c1ca39d8d3ed
	.xword	0x5b15af7289391a9a
	.xword	0x8aebc5334e5c8064
	.xword	0x87ed7051bf396e34
	.xword	0xaab6ed98eefc2136
	.xword	0x5fcb05e91dbcfbcc
	.xword	0x310b427e5a7a65ad
	.xword	0x3c6889b41d3b7aee
	.xword	0x6858392aadfbed39
	.xword	0x61e5517cf36a9084
	.xword	0xa4f34f3ac238f550
	.xword	0xfdc86ab3a438f145
	.xword	0x1e580694e233c70a
	.xword	0xa951c4a3c02a1864
	.xword	0x589fe70ab67b4e0f
	.xword	0x0f0e5c94185ed462
	.xword	0x4736417610430498
	.xword	0xe47bfe81f269ed82
	.xword	0x7bf30a02fa99491b
	.xword	0x161856052bf3371a
	.xword	0xf728a689dde4e224
	.xword	0xf0550902747cb298
	.xword	0xba757c8de0ff8c13
	.xword	0x571ffea9ac7393ba
	.xword	0x8e4c5f41afc2dbf6
	.xword	0xc8cc6bc5420146fd
	.xword	0x9e5558ad25338be7
	.xword	0xe3d411115c47ee4e
	.xword	0xb3b6d0c13a73044f
	.xword	0x333d3a0e153e3696
	.xword	0x55ec15fb6ea4f8d4
	.xword	0x38aab0bf769d2274
	.xword	0x7eeb3418c721acb9
	.xword	0x952e4adc9d9d45f3
	.xword	0x1221c37c0b99e960
	.xword	0xf60d4ea3e4131269
	.xword	0x13d28e3bbdb34406
	.xword	0x03f574908b84b72d
	.xword	0x5c652b3a9bd0403e
	.xword	0x2ff9a146312a5c44
	.xword	0x7e93aa885f5d7bfc
	.xword	0xb455cd5ac86763bf
	.xword	0x41c9132ada61bef8
	.xword	0x742dbdad985de432
	.xword	0xda66605e4790d46b
	.xword	0x371d973daece7c28
	.xword	0x234306ffa2be6ad5
	.xword	0xc76efaaefe31680d
	.xword	0x90e1bfada8c5b871
	.xword	0xb0a96388aa2e9962
	.xword	0x91a090f32a64687e
	.xword	0x683aa5243d18b991
	.xword	0x63bec92af8790a0a
	.xword	0x4b4573f90bbc930c
	.xword	0xa9bf9259d76a7bf1
	.xword	0xbf615e4740830e89
	.xword	0xff843ef8b3024e60
	.xword	0xa6e9e70ad9eb6f84
	.xword	0x16aaf3115a4091b0
	.xword	0x19128984660b40f1
	.xword	0xe0ba5bc41ac5b333
	.xword	0x769889aa0e4056d4
	.xword	0x66f1bd2e0cbd97f6
	.xword	0x7fe5f2ddfb4e5abc
	.xword	0x9117fe436fbbd52a
	.xword	0xf215ea9512675501
	.xword	0x00c7033a026700d3
	.xword	0xd45b151efd2f728b
	.xword	0xf44d44f9f2e289b7
	.xword	0x2f089844f4ceb883
	.xword	0x3dddb5a076550553
	.xword	0x5bd7f2b78cee0d3e
	.xword	0xa5627ac5418d9e67
	.xword	0x2ebd63429febef1f
	.xword	0x067a77447618f074
	.xword	0xa6bbc2887567350b
	.xword	0x4f6c8ebf27ea8743
	.xword	0x652d2ba131a83932
	.xword	0xa8b1ed24bbe812f2
	.xword	0x8931a1b4f874b84b
	.xword	0xb67a6c56b4cbaca6
	.xword	0x3bd614539178306b
	.xword	0x47ff1baa3c969b24
	.xword	0xaf089e51bef44066
	.xword	0x0c524be99fc26391
	.xword	0xcce779f54edc5e89
	.xword	0x5e291158d36dfba0
	.xword	0x9a2fda08747c4443
	.xword	0xc3c0337079716d7c
	.xword	0x61e2b258a4f0b6a5
	.xword	0x09120c82ec4058fb
	.xword	0xe9134940423c476c
	.xword	0xa957b95a331ac377
	.xword	0xfd252ac35f4740f6
	.xword	0x7545c0863fa19f47
	.xword	0x0d8690f90d28f16f
	.xword	0x2fab9d1f57f2113a
	.xword	0xc7dc5d40980a87bc
	.xword	0xe3673aaee99c1b21
	.xword	0x6c613c1e6e9ac29b
	.xword	0x3d2d4c3d827041d2
	.xword	0x2e6d6aed28f8d514
	.xword	0x19a682ee3ca448d2
	.xword	0x96605d4944343cfb
	.xword	0xac9bb3f4b55d614c
	.xword	0xbd8ca84400a5fd03
	.xword	0xd189d222827a62fb
	.xword	0x42f9e6b46f6595f9
	.xword	0xda88935bbdb87396
	.xword	0x0cd61f57c4d70027
	.xword	0x32072f06251e39de
	.xword	0x66b193d01dd800d8
	.xword	0xf1bdb4453e7a4edb
	.xword	0xb9b07dc0e52feb1a
	.xword	0xc7d92106fefac35a
	.xword	0xe0154812d75c0fb0
	.xword	0x0d8e14b4497ca61b
	.xword	0xc88818df2e899e98
	.xword	0x899a35c8844c4cc2
	.xword	0xa66f94f2aaa4015b
	.xword	0x74fde37f6e6a1cc7
	.xword	0x497205d49961de2b
	.xword	0xb3ab0a78e56955bd
	.xword	0x704cbb402d557162
	.xword	0x0343d79d2999b3fa
	.xword	0x591510a6cc3f0427
	.xword	0x40ae2316044d664b
	.xword	0x5df3c94b658bfaab
	.xword	0x1c316fd73f851d06
	.xword	0x7ad033848477755f
	.xword	0xfb48cf971b55d521
	.xword	0xb345567559807b15
	.xword	0xea9262dc1602c6a6
	.xword	0x19a0addbe4f141f0
	.xword	0xceba0c2b7b388cfb
	.xword	0xa4402dca20652a69
	.xword	0xafaaf4bcfbfe6c3d
	.xword	0xc342bd4cc5041b75
	.xword	0x1c1789c61d9d7b40
	.xword	0x3126b65611527f59
	.xword	0x577a02614b4a080c
	.xword	0xc319db0b579a8989
	.xword	0x608a470463f63da8
	.xword	0x30f27331a0e1bf3c
	.xword	0xfcfdf7f3f6782eca
	.xword	0x84cae6acbe6b4cb2
	.xword	0x147403215e4a6347
	.xword	0xfd204eb4e9987119
	.xword	0xc820a379f19cf412
	.xword	0x52490313b05b3cf4
	.xword	0xb8a1f28f01fbe980
	.xword	0xff4cd0dffe90b1bd
	.xword	0x24c1e039499ec75b
	.xword	0xb4bea056dc6baba2
	.xword	0xffbb8cc19b12983f
	.xword	0xe31f793704c3e987
	.xword	0x108439710607f02e
	.xword	0x889fd6796263dcce
	.xword	0x3bd98b5a1fcd5ee5
	.xword	0x931fa3fbcf6adc84
	.xword	0x92239ad7d5fd8ea1
	.xword	0x395ff2081bce246e
	.xword	0x3289b4d2abfe3c33
	.xword	0x7dcb83ae18089e6d
	.xword	0x536504c70ebd760f
	.xword	0x2363b3de70bb5fe4
	.xword	0x900d9adf962b0473



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
	.xword	0x42f35381b82247ca
	.xword	0xb85bd679680ebeec
	.xword	0xdf2a40646cce581b
	.xword	0xf4335ac907668a91
	.xword	0x11d6cf58c6fcfe65
	.xword	0x18978115429afd90
	.xword	0x0787fe9d02d5b85f
	.xword	0xd8f5741fca547c1b
	.xword	0x275497b51370a792
	.xword	0x640da0cd33fb6594
	.xword	0x2eb928dcb0961b51
	.xword	0x12610205474b3c73
	.xword	0xa0d4521d5a3e10ff
	.xword	0x6a1d8fc0c7706c1e
	.xword	0xf8175a8df3024999
	.xword	0xbfa739db1d3a9c8a
	.xword	0xc43229ea7add12fc
	.xword	0xaab6a5ecfada63df
	.xword	0xc44e4a6d5af75cab
	.xword	0xb828fc73c6da61e6
	.xword	0x424150e36aabda30
	.xword	0xc3064c9a16a08124
	.xword	0x7f980c1c510e91d3
	.xword	0xe687d23edd2f4650
	.xword	0x41d26863ccd0136e
	.xword	0x8d31da0ff65b9029
	.xword	0xaef06a5708502623
	.xword	0xe9ec48518ace3950
	.xword	0xcfc00f0da3277f1d
	.xword	0xf414ed46522883c2
	.xword	0x1ffd0afa52335987
	.xword	0x969ae49c4346ef84
	.xword	0x5a7039ebf0a53934
	.xword	0x980c905bbe4a41e6
	.xword	0xa34dff8fdf72828b
	.xword	0x24573a9dbcb42a55
	.xword	0xb230455485008a25
	.xword	0xcafff186b1ae59f5
	.xword	0xc73d4bb1b05bda2b
	.xword	0x1f1b387764500ee0
	.xword	0xc6950e44c2b6143f
	.xword	0x6e4b9123f1d0b08b
	.xword	0xb1bad5741eb1e540
	.xword	0xe33f8bbbb3bc9c22
	.xword	0x1656232917b74772
	.xword	0x2679e55cb750eb22
	.xword	0xa7f0a1aadb23ff5b
	.xword	0xfefb385e739a2d41
	.xword	0x7554eaa1e52146f4
	.xword	0xf231b79e8613b4e1
	.xword	0x471bce9c9c0aea8f
	.xword	0x2b3ea83a04c29157
	.xword	0xddc223895158cbd6
	.xword	0x53804674b0266b58
	.xword	0x64a3e49f3c802a3c
	.xword	0xc67846ce9539d099
	.xword	0x4ca82e47ed236535
	.xword	0x42c4b1ba6d38d255
	.xword	0x2ff7d88be9e3b270
	.xword	0x2d05efa1704222c4
	.xword	0x096cf151dc297c33
	.xword	0xf8138b059be4aad4
	.xword	0x0c614f3045d71945
	.xword	0x7b200e1799b12c97
	.xword	0x4e84024aed4fb97e
	.xword	0x1cdc5624cac1c993
	.xword	0x150ee7e5660f8f49
	.xword	0x6e0f757af51032bd
	.xword	0x894a30044e92f618
	.xword	0x443fd3cfc0ecec16
	.xword	0x649e07d67e20ab20
	.xword	0x72c44695ccb48217
	.xword	0x31c8b0c4a5ac7ae7
	.xword	0x0884ad26941df778
	.xword	0x05fc4b9d8136072a
	.xword	0xa1b2813d5d0c5627
	.xword	0xf1caea1f837cf01b
	.xword	0x20478a2eff4a8314
	.xword	0x935d35b21446122b
	.xword	0xff5a8537802b963e
	.xword	0xb72d7657a60f6b31
	.xword	0x0d9e636dc40752d3
	.xword	0xbb42625b551aaa7b
	.xword	0xf8cc574434e643e2
	.xword	0xf995fd2d07995599
	.xword	0xc48e56388b2f0510
	.xword	0x4e1888094c6121a1
	.xword	0x04c83991d67c3dbd
	.xword	0xab192e70fb7ba107
	.xword	0xe60450011eca7ce0
	.xword	0x252a3e100352a619
	.xword	0xfb8a80c941774594
	.xword	0x64dc73ea44ead2f8
	.xword	0xe48a0ce91dc6841a
	.xword	0x83ca07b805ee166d
	.xword	0x981732311e04e39f
	.xword	0x5a7f9ef383011315
	.xword	0x24e617d0417bff7d
	.xword	0x02d443507787d4cf
	.xword	0xe3fdb84707fa3536
	.xword	0x9df79ffe255a2642
	.xword	0x2d69f6fb893c1238
	.xword	0xc1ae4d5880919a18
	.xword	0xb7eb1c03af4ba88b
	.xword	0x23dec0949034721f
	.xword	0xc62e534ebd4de43c
	.xword	0xc94e1951ca6d1762
	.xword	0x359245842bcd2ffa
	.xword	0xd4186449730091b5
	.xword	0x9eca60cdcabe959b
	.xword	0x130e82896b99a770
	.xword	0x95f8928b52c35329
	.xword	0x69a4a1d33521a685
	.xword	0x077ef1055f8e8749
	.xword	0x1957cdf8be1c6569
	.xword	0x5f7984c257679022
	.xword	0xe7095621ef47e2db
	.xword	0xef103ccde5548b2c
	.xword	0xb39f59b0a50a3295
	.xword	0x44d79e80aa3b20ed
	.xword	0x0da951605a58b4f6
	.xword	0xb8148ba0c3ca88be
	.xword	0x2f64817c59cd9c5e
	.xword	0xbe9758cdd4c5b741
	.xword	0x717d058c966160a8
	.xword	0x89b3add748de0830
	.xword	0x09d3deb1e3407b9f
	.xword	0xbbe3db14a125a470
	.xword	0x6050f0e7fb374303
	.xword	0xef7ea26174482348
	.xword	0x7c91e7b5ae927150
	.xword	0xe0bc055d30b13dbc
	.xword	0x147b394e98cdfd3b
	.xword	0x4777d22199ded415
	.xword	0x0b1d0d825b4a229c
	.xword	0x211f8e9758ec904b
	.xword	0x071587be57f9a72d
	.xword	0x13ea0d48264e4ba3
	.xword	0x28b3cb55add29f78
	.xword	0x1a7ede0478b5b036
	.xword	0x393994f9430721c0
	.xword	0x84bb50105197ab78
	.xword	0x1a7b728b5ee5f867
	.xword	0x2a1258988b78fbe3
	.xword	0xfe9bfc4f7f9791cb
	.xword	0x56ddf1ee793caaf4
	.xword	0x68f8307b0f5a5ad2
	.xword	0x8c1487b4456661ce
	.xword	0x6291e8d834126ece
	.xword	0xdf81d8c99e85a6fb
	.xword	0x63b74b9856f57c39
	.xword	0xcc050d180a79d14a
	.xword	0x5e08401fe6a00ba3
	.xword	0xb953a8180809dcfc
	.xword	0xf30aa561bdb84a2e
	.xword	0x199d393aca8cb6b8
	.xword	0x1c3e523c53e4d988
	.xword	0xbc0187b03072a1bf
	.xword	0x692df0de2738504a
	.xword	0xd6b8fe6984c40f0c
	.xword	0xa5f2d12ce9a55689
	.xword	0xaf19934f9c4110ef
	.xword	0xb03029805d9ad383
	.xword	0x2a591ab181c82939
	.xword	0x5a02364a7d90e3c5
	.xword	0x0e196ad51269aaf5
	.xword	0x789727fe54d85a11
	.xword	0xc922cdd8fe425168
	.xword	0x03778005b1b1d054
	.xword	0xbf10c0bde5be5e8d
	.xword	0xd42c8b0a4258392a
	.xword	0xb3db9354d5ea492b
	.xword	0x9db3c35aea9a9d59
	.xword	0x751ff532b14ae769
	.xword	0xf980dc9ae4d8386c
	.xword	0x95d09bc4d142a14c
	.xword	0x28574209a1ae937e
	.xword	0x1a2f427688350c32
	.xword	0xfb8821217ce6c0aa
	.xword	0x724502083fb3aa42
	.xword	0x47f51755d6949fd5
	.xword	0x20dd463858bdf104
	.xword	0xb84cc64aaf2b7bcd
	.xword	0x9f69bc07dc275238
	.xword	0x9d11229a8865ceeb
	.xword	0xd071fe1b2a0c632a
	.xword	0x6ce3cc5c73dbe005
	.xword	0xa28ef3446ea83988
	.xword	0x7dcdf22adde11983
	.xword	0xb0d8fd4fef2043bc
	.xword	0xb8e1cbda9935044b
	.xword	0x1ce775f8a6adf1bb
	.xword	0xba189e682723c4b9
	.xword	0xd39171869026ff60
	.xword	0x6011b0a67f32bcad
	.xword	0x7e8269d393d4de49
	.xword	0xfc29dd05d5a7c85e
	.xword	0x3be55255d18f5ca4
	.xword	0x8edad6c7120e028a
	.xword	0xca1e4b4283225c8f
	.xword	0x20abfddd83ec8682
	.xword	0xf5f28efb52886991
	.xword	0x9d60dd60256407da
	.xword	0x68d56c06c0dd40b5
	.xword	0x45652f66e9584c00
	.xword	0x5170fec92b8bc789
	.xword	0x805bbbc1e8cd85e9
	.xword	0xe109057b41baf0d4
	.xword	0x47dc6fd21e79cefa
	.xword	0x6a10ba1f06582479
	.xword	0xce90cedae4e267a6
	.xword	0xf8c88d3abd7cac77
	.xword	0xb8ea4dbfb3d39d98
	.xword	0x25563e6f21fe5178
	.xword	0x94831b19eb120dc8
	.xword	0x7ae2de135c3665e3
	.xword	0xd4d008aa50fc3d80
	.xword	0x1a67e4a9a87c63de
	.xword	0x77463fee8e9cb085
	.xword	0x6867ef7c2bfca38d
	.xword	0x14cde125cee6ee8c
	.xword	0xd7c9a5dacb478f26
	.xword	0x25ca1eccc3da3cef
	.xword	0x5f2dad5ac932db3d
	.xword	0xf1901b52b80a0ed6
	.xword	0x31260d17fdcd6680
	.xword	0xed1d2428daa7b29c
	.xword	0x3cd1156ade8e455f
	.xword	0x0e58575188f846de
	.xword	0xe528d91b686ec165
	.xword	0xcc0c87c3a36682c5
	.xword	0x3479295cec424e65
	.xword	0xae983f699f329c50
	.xword	0xad7eda588a670445
	.xword	0xaaca399afe4fa5b7
	.xword	0xe86de9199c4f5d52
	.xword	0xf77e6aa6755c15f4
	.xword	0x1531f228f7481a48
	.xword	0x2e2a099502bd304b
	.xword	0xddb2ce2823592c37
	.xword	0xa75e5e21d77e5685
	.xword	0x6cd6551a39100d5a
	.xword	0xc1e57a5f174e0725
	.xword	0x401d3850e3dd6de5
	.xword	0x47231687217025b4
	.xword	0x2c6708d344c36034
	.xword	0x874f487254b4f312
	.xword	0xa9ba797f894691a5
	.xword	0xe17107469e867605
	.xword	0xb57eb45a56b1f1ea
	.xword	0xcef83cc60c3de808
	.xword	0xe00446caf5ea4497
	.xword	0xe061962cab1b660c
	.xword	0x88f84e4371964011
	.xword	0xc391301c70266994
	.xword	0xd33860770274140e



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
	.xword	0x401900317578f4a1
	.xword	0x52c1e52235dfe2ce
	.xword	0x8c005a052c2da9cb
	.xword	0x06f735dd6e4fb22f
	.xword	0x156ece01dfbb6dd0
	.xword	0xf0105a168e0daa56
	.xword	0x0a6b1dff759c116c
	.xword	0x90aab657da79f9e4
	.xword	0x0d674d1bc59be07d
	.xword	0xfe1afb9eeedaaea7
	.xword	0xda09d924e5a00c88
	.xword	0x42e339def7d98e9d
	.xword	0x008a1931b5ba21e9
	.xword	0x8947bdf0b2106294
	.xword	0x0b18b154743018f1
	.xword	0x69c6abb3e95f3804
	.xword	0x1d7492aca6baf42a
	.xword	0xe0bf1b62eea89012
	.xword	0x534dfa9b274e3d12
	.xword	0x9a655dfacc9abf7f
	.xword	0x80d5c0940198acfd
	.xword	0xf68e84c03236e543
	.xword	0xa5487da5971b1a60
	.xword	0xf3a0da947315e719
	.xword	0xade2c4d73c820331
	.xword	0x3c051203c0fa9e19
	.xword	0x7c587889db5ff867
	.xword	0x16ec2ec5b9a41b27
	.xword	0xacda93e202bc357d
	.xword	0x2faf365ef48887c8
	.xword	0xae268f7b15167f9a
	.xword	0xedd2036726aeb232
	.xword	0xb63f0d8480234895
	.xword	0xe5d0fc50c3887851
	.xword	0xd4c727e2d5c19f85
	.xword	0x40ec8e92c4496ed1
	.xword	0xc98fae5389212f59
	.xword	0x72df3d3ed5da8e48
	.xword	0xade910bdb93f5efa
	.xword	0x3d18ccfe9cbd75c2
	.xword	0xaade1f04bf581b53
	.xword	0x9779df2688e174b0
	.xword	0xecea56ad1d167f34
	.xword	0xcec6245ebf5773e3
	.xword	0x8c4fd9e04811bf8e
	.xword	0xb5a7bb9fdcef1ae5
	.xword	0x85336ed05e08055b
	.xword	0x0147077041644f5c
	.xword	0xa71e8d18284eca9f
	.xword	0xcbb1db0a2d938c6a
	.xword	0x524ba4f12e90003d
	.xword	0x0db5d075e9a80b26
	.xword	0x52daeb5ca7b823c0
	.xword	0x4d849097c8d6f760
	.xword	0x193566746556832f
	.xword	0x4f5a6a9754b5f813
	.xword	0x0869fa6ca31d766b
	.xword	0x1e9f0527e7777bc6
	.xword	0xb1c78ee9b4871b32
	.xword	0x1e165c0230f55a56
	.xword	0x152a45fb75605489
	.xword	0xa8cd5b8dc7ca9d1f
	.xword	0x52e61751999983f6
	.xword	0xbdc5176ff878f343
	.xword	0xe880ec487f130828
	.xword	0x8cd6e15dbb3d19f4
	.xword	0xc628c620264000ae
	.xword	0x5b535923aecb6451
	.xword	0x351f444b3d8785a4
	.xword	0x06e8aeb9979e0917
	.xword	0x9f42ee4464c0b8ba
	.xword	0x28cdd5c4b0297771
	.xword	0x95792ee6caf5d4b7
	.xword	0x83760dbd9402db2b
	.xword	0x1a672eaf05ac44e8
	.xword	0x3a80ae5a09d51568
	.xword	0x646bca0460b0b5c2
	.xword	0x9e95b681ad5e5a4d
	.xword	0x22fae7b3521ca13b
	.xword	0x6273ed9cf2b6e73a
	.xword	0x2a0d1946c1373049
	.xword	0xefce42031b5eff81
	.xword	0xb9033bc397f463d8
	.xword	0xbdea49e8b4eb6e13
	.xword	0xbc71b5c14d50c24e
	.xword	0x852de35324d6a9cf
	.xword	0x50762d6f4852bc47
	.xword	0x88c7f4618149a4af
	.xword	0x2e572bd1849a830e
	.xword	0x463e9ec57cdb228a
	.xword	0x57c45d044a29f7a2
	.xword	0x90ce2994d6af7842
	.xword	0xf175e7fe9d9d0393
	.xword	0xefc9ab3371d7af92
	.xword	0x24a85cf73778f5a2
	.xword	0x9e7a14a447a8e14d
	.xword	0x2ec9bf9727d2dd52
	.xword	0x93003d5223b7bc07
	.xword	0x2e833fa58c733353
	.xword	0x69e0dec1e569da0d
	.xword	0x5721f91968d8a057
	.xword	0xf2eeeb1656e72a50
	.xword	0xf0fb3b2cdfe64543
	.xword	0x7ebc1e18442dad12
	.xword	0x0e58f7a283865f2f
	.xword	0x160142a751dbdeca
	.xword	0xb302f208629d38f0
	.xword	0x387fc9db29539ff2
	.xword	0x0af119c07e9e6ce8
	.xword	0x881e395835586063
	.xword	0x8098a951256ad66e
	.xword	0x5216d74dd8fb0674
	.xword	0xff5c5d051684658c
	.xword	0xd77d554b71210590
	.xword	0xfe0186596fd16536
	.xword	0x124921c1ce6dbf64
	.xword	0x08f62d6ed817a84f
	.xword	0x740242957b2fe1af
	.xword	0x91df089ba818a4d8
	.xword	0x892c886d1ba86250
	.xword	0x2d4d39dd25dd92b0
	.xword	0x8e0f4befe2939436
	.xword	0x849ccfc860675f3b
	.xword	0x7abe29db0aa51790
	.xword	0xb1e081540dc94f70
	.xword	0x6538e9ace06544a3
	.xword	0x8b026b60e4216a64
	.xword	0x1b65ccbd460ece6d
	.xword	0x4606591010b86a89
	.xword	0x28157e9b9ba381f6
	.xword	0x0eb03becd9d63944
	.xword	0x19307204e025b7c1
	.xword	0x49ca118e31805765
	.xword	0xc7dabde022b6c9bb
	.xword	0xe9350963f9b995c7
	.xword	0x827355ffd0454bac
	.xword	0x9ead71e639dd36c5
	.xword	0xa7549477e6f23f8a
	.xword	0x1dcf684e773fb26c
	.xword	0xbee098c01a5b7f9a
	.xword	0x34e15293321a5016
	.xword	0xb4b67b87c7583402
	.xword	0xc32e6576d25839e0
	.xword	0x2d620044c93175a3
	.xword	0xd8d201a6617c91cd
	.xword	0x3b6cfeaa840b4f7b
	.xword	0x977f2b93e4f63137
	.xword	0x3a44164049d15510
	.xword	0x0eeb24f2cf983b56
	.xword	0x14565a546419312f
	.xword	0x4672b255572889ca
	.xword	0xda81a73785b12e2d
	.xword	0xe21f391e4bf862b9
	.xword	0xdf9588cad03c29d1
	.xword	0x5ac5dd7bcc3dcf97
	.xword	0xbda2a86577e7466e
	.xword	0x557f77e7a9ee40c6
	.xword	0x7519c6648611403d
	.xword	0x74f03c30bb8216aa
	.xword	0x91fa4ed34c8b70c8
	.xword	0x2d68c2a76e00d151
	.xword	0x159f1176007d63e9
	.xword	0x8010c7be0af74f62
	.xword	0xaefb53167a4117bf
	.xword	0x1f2b026f4861e932
	.xword	0xe1f58929e13d77f9
	.xword	0xaed1627cac77f3ba
	.xword	0x2fdc6355760be070
	.xword	0xd320c4dbff88f1c5
	.xword	0xf49432d65b6bb862
	.xword	0xabae441cdfa615ee
	.xword	0x0ce74324e9309733
	.xword	0x65c085da66e23116
	.xword	0x695c8c2cfe58d494
	.xword	0x06d179ec9565baa7
	.xword	0x3751ad8323529e30
	.xword	0x48e290df7f1fc244
	.xword	0x3bd3adb86c775695
	.xword	0x28dc305145e83875
	.xword	0x32b1e36cf906f1ae
	.xword	0x0647be535e41c89b
	.xword	0x2a28ef30202f8796
	.xword	0x22adaf366e969f6d
	.xword	0xbb842caa023702fe
	.xword	0x07953b567d3e7cfd
	.xword	0x43ff941379874799
	.xword	0xb016c00de36f19eb
	.xword	0xa14d884ff78f79ba
	.xword	0x5a1de0541df2eff0
	.xword	0x7db1f21afe6774a1
	.xword	0x218dab987ff59619
	.xword	0x8af81b85486ba3ed
	.xword	0x17a38ce778a78b4f
	.xword	0x735a1f4d1c0e0c28
	.xword	0xb2b57b18fb121811
	.xword	0xf9c165b5d61054ad
	.xword	0x8722504a048c83f6
	.xword	0xde1e871b49b2a952
	.xword	0x5e9ea301faf112ea
	.xword	0xf9d32292cd514a85
	.xword	0x4f3cc9a274861a60
	.xword	0x619ae8eb0a7611cd
	.xword	0x4360f5264c72baf7
	.xword	0x1d6058044f24db08
	.xword	0xabbe6b18f9b56d7a
	.xword	0x1312b114a7b7657d
	.xword	0x6c169921f8bfc54c
	.xword	0x028265cd2d62ca7f
	.xword	0x9a275c069269c683
	.xword	0xab657daba6d756ad
	.xword	0x1bfb2a47da29c9d3
	.xword	0xfc94628cfa249db5
	.xword	0xe0032601d6fef58b
	.xword	0x8af4d862101fba0b
	.xword	0x8f8b5a54f333d123
	.xword	0xe7c376907c4bc383
	.xword	0x5e492d1aceabf471
	.xword	0xcc5975a4f51b403b
	.xword	0x2e0aad683376b7a2
	.xword	0xf626c31ef43801e6
	.xword	0xd01d7c6bc3fad727
	.xword	0x134d50b0585b0434
	.xword	0xb51a2f91881ce962
	.xword	0xba9823b813b90b35
	.xword	0x77320c90315f0269
	.xword	0x5e9bb1f128369cd6
	.xword	0x65ae8730a9ad43f4
	.xword	0xed0c3f4f69dfd22e
	.xword	0x2e46f10baa1090b2
	.xword	0xfed85b5520e7f0e2
	.xword	0x1428bcde3d24159e
	.xword	0x09a358249904d292
	.xword	0xd1cb3e2f6ff8e67d
	.xword	0x38ef6b81d0a0a70a
	.xword	0xf6cf1ec657240a63
	.xword	0xc1471e1bf3bcb54c
	.xword	0x29da55f1b243e087
	.xword	0x36faf8f22a98ae8a
	.xword	0x128616a7cc9b7049
	.xword	0xb8338a076433d24b
	.xword	0xa7ad9772b1ccde1e
	.xword	0x4464d967eb28fcee
	.xword	0x6b96a017c92f3ab2
	.xword	0x138c57bd77d0ea33
	.xword	0x2042e39e36debdc2
	.xword	0xd8aca1873437e224
	.xword	0xd69a2d89cea23d34
	.xword	0x5b6fa22812bde78f
	.xword	0xd30ec58c83b7d242
	.xword	0x275d00a7d0facd35
	.xword	0xe8efc92fb680e378
	.xword	0xc9c8f910633ebf61
	.xword	0x74198b658956cb05
	.xword	0xedab5101153927a2
	.xword	0xca3e821b06726758
	.xword	0x3275ccaef1108657



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
	.xword	0xe80460684bf1a9c2
	.xword	0x6b1876f898d2c05d
	.xword	0x1899bb3b565ed231
	.xword	0x2816742b05f65398
	.xword	0x7fe2c5a0afb7e479
	.xword	0x12235e9fbf71c111
	.xword	0x6ec1b7556969f257
	.xword	0x5eb0b9730be982bb
	.xword	0x7c670946e5931f81
	.xword	0x5bc01c27454e75c1
	.xword	0xeeacca4d0c7b7986
	.xword	0x23edfd789f74a7ce
	.xword	0x1145a187a1be9e25
	.xword	0x033edbe3db7adeac
	.xword	0x809495b6aa6cca25
	.xword	0x11358a8f5a774d2c
	.xword	0x5ff82614770b479b
	.xword	0xab3de20e0a4076b6
	.xword	0xfa50821eb9c77093
	.xword	0x130544da4677e9bb
	.xword	0xbc4d13b0c279d988
	.xword	0x861af146af008b48
	.xword	0xdc68c151a513afa6
	.xword	0x4ecae81adedfe373
	.xword	0x59cecae15c9f5b21
	.xword	0x1ece2abf5f85ff53
	.xword	0xbfc19394ee49ee15
	.xword	0xbe98af30497d1dcd
	.xword	0xc7dfbb510ea5ca97
	.xword	0x322bb5f356ebd4ee
	.xword	0xba95c4ce9d24ab8e
	.xword	0xc35453d495a86bf0
	.xword	0x2a30ca949a7ccabd
	.xword	0x84299625afc24c26
	.xword	0xc8e9a612e96f37a5
	.xword	0x61c59216809ed75c
	.xword	0x2f4699199db7bcc5
	.xword	0xe244a75734cfb67b
	.xword	0xed811b5951ac57ce
	.xword	0xf01c2f756f54fa3d
	.xword	0x9bef664c35f95ac6
	.xword	0x24e6d65855f76585
	.xword	0xd93c82a6b3e77482
	.xword	0x4def42a60293e52c
	.xword	0xccc63aa1f5b38f89
	.xword	0x41e1f57161f7e85f
	.xword	0x8bf0c6c276ae30cf
	.xword	0x59e088918c2c92e1
	.xword	0xed335190c21a109d
	.xword	0xdd64a2d612ca33d7
	.xword	0x5515ec28631a205a
	.xword	0x20f19da252c30453
	.xword	0x001b300f0c197075
	.xword	0xe312bf3b685b43e6
	.xword	0x01fca18734973c77
	.xword	0x8dfb06e9e6e24d47
	.xword	0x63960076be0d35a8
	.xword	0xe08ee6aadb77eb5e
	.xword	0x3c32a8d90a3cae3c
	.xword	0x99db41b541a49d19
	.xword	0x9179f1c3a1e29142
	.xword	0x5d750228ba3ad5e4
	.xword	0x9b27f17b5e6107ec
	.xword	0x4a5c9ededafc8ecf
	.xword	0x2fadae9af65da545
	.xword	0xe851dbe47a73da69
	.xword	0x9c7165809518e854
	.xword	0x398fdc1696fb4de1
	.xword	0x30b9b8bb4367c380
	.xword	0x3d534079b06c831c
	.xword	0x643e611800b0150a
	.xword	0x3069ad6e87211488
	.xword	0xc7b6f8185c94567b
	.xword	0x2b809c666c7f4a9c
	.xword	0xb04a6a39c9f9003a
	.xword	0xd05dc648273ae67c
	.xword	0x131d7b1f5e00a7a1
	.xword	0xf271cb1bc7e046b6
	.xword	0x42269863a5cb2111
	.xword	0x97eceb15afac6cb5
	.xword	0xe5c581a09441b2e6
	.xword	0x15273a1bf1801592
	.xword	0x1afd1cf54c6d32ca
	.xword	0x3672d8f165fa7c94
	.xword	0x1409fce8cdb156e9
	.xword	0x55c90b5fe81cd44c
	.xword	0x3a4d0593df8a262c
	.xword	0x9ecb869f884c0155
	.xword	0xff9ecfad639f664c
	.xword	0xa071aefbc58c62fa
	.xword	0x5ab61574ecad0a5e
	.xword	0x4db4494d35c011c7
	.xword	0x062b4d8c6376629a
	.xword	0xa21e2220162d6f29
	.xword	0xfb8fb7a5d8352956
	.xword	0x0db307bb20ff9e35
	.xword	0x3b1201c68c47aab1
	.xword	0xb3aa4b8c0d23c68a
	.xword	0xf563f328e61919f4
	.xword	0x8fe1f845153b7d09
	.xword	0xbb82f52124006238
	.xword	0xa21eee207ca89169
	.xword	0x9cdc1bff210b6105
	.xword	0x2754ee0ab7039cc1
	.xword	0x26b75127494744ab
	.xword	0x43315cdf17865434
	.xword	0x3be51dfa51ad2cd3
	.xword	0x3938142d1f9cb270
	.xword	0xb03c5186e2c98a31
	.xword	0xe1a73202a0273283
	.xword	0x74c930c78f7f4a84
	.xword	0x03e73764c6888a63
	.xword	0x6479eda338b796b3
	.xword	0x8cee4d0094d66d6f
	.xword	0x7624245839cbbc98
	.xword	0x102494f747a962d8
	.xword	0x74dd975e1f410cc3
	.xword	0xb4d63b154b66e15d
	.xword	0x4c5bb574fcbe53e1
	.xword	0xf2af1853e2cbf5bc
	.xword	0xcf944e6b8fd5721b
	.xword	0xf9eb0d7c559d846f
	.xword	0x31953601efcd3859
	.xword	0x77bc07cbd253735d
	.xword	0x28e5de6a69c6c5db
	.xword	0x33ce730ec61415b1
	.xword	0xbc335334b1099e03
	.xword	0x8a806dbe71fdaacb
	.xword	0x34af0fa256999adc
	.xword	0x97521d7f3d74beea
	.xword	0x3c7538cd0ca91eac
	.xword	0x4b1ddc7aa996c56f
	.xword	0x1f1597397d3d778e
	.xword	0xefba1996228a3ec6
	.xword	0x57c3a2bba89c160c
	.xword	0x366ca57bb9ddb9c6
	.xword	0x846611cf123781e5
	.xword	0xa35b223488c2478e
	.xword	0xf78ae0765a611b65
	.xword	0x45055c80034b803b
	.xword	0x7b3d0766f2183f13
	.xword	0xacf219684a1d8320
	.xword	0x8e525c407034393a
	.xword	0xe27223d0fe74d4ed
	.xword	0xfdd5beceaf8f3f46
	.xword	0x07b17d528b8d2560
	.xword	0x031eb5029a2467c3
	.xword	0x01875de23df16735
	.xword	0x0c8efbb690f10e05
	.xword	0x81366457f715da36
	.xword	0x638c149b36f44e36
	.xword	0x302f45e5c726a59e
	.xword	0xbaf9d65283766d0a
	.xword	0xf81ba6f92b84e204
	.xword	0xacbd32b4ef1580f7
	.xword	0x9eaa692d156f1eb0
	.xword	0x22efb2ca3ace3d68
	.xword	0x88576d2c5be1e908
	.xword	0x45d96ef53e88e9fb
	.xword	0x7ca6f198756d5853
	.xword	0x03ff138a13613028
	.xword	0x69cfaf459bbc11d3
	.xword	0x3f7ca5f4fa5bb5f5
	.xword	0xb94fd6c373cbdc70
	.xword	0xdc7bf7f2c2ee7b15
	.xword	0x658101b5ab2ca71f
	.xword	0xc30dc728b33a1fa7
	.xword	0xabb7eb2e6164b9b6
	.xword	0xe47627018b507ae5
	.xword	0xeb00ed12538b3d24
	.xword	0xc99e069ab9f51574
	.xword	0x904e262720676d07
	.xword	0x32f91cb7dcb930ed
	.xword	0x068b31c84a37a723
	.xword	0x342127765ff6923e
	.xword	0xaab354f9e4806acb
	.xword	0x6a559190a9e82c22
	.xword	0x11f806af4856cff6
	.xword	0xdc2a273aac41ca32
	.xword	0xfab5396500e38364
	.xword	0xd984b5fd804eb380
	.xword	0xe17f9ba392b39e52
	.xword	0xf2a21d0a6d62aebf
	.xword	0x6dcfeffc83aba696
	.xword	0x51b571880aa949d7
	.xword	0x8aec1c515f19036b
	.xword	0x0ee2098778fb2962
	.xword	0xc09a16d6d26da626
	.xword	0xe6e3d944277eb79c
	.xword	0xbdfd147640ac11fd
	.xword	0xe2adaa5b19f6c029
	.xword	0xb74f639dc5b8a2a7
	.xword	0x26133ca5765d819f
	.xword	0xfff9961f70d9051f
	.xword	0x45ff397d60eba7c2
	.xword	0xcccb76b7ee3073e7
	.xword	0x8815d80ff7198b1a
	.xword	0x8c08034ccbc45a6d
	.xword	0x89d492f4608045d6
	.xword	0x7bccd9985faaea6f
	.xword	0x5850a2e680b5e555
	.xword	0x164d81f3359f0d60
	.xword	0xfb85f525fc5569ce
	.xword	0xe80da78bda75b7b8
	.xword	0xe4d684d1bf632ed5
	.xword	0x508009ac5d3e093e
	.xword	0xb2fde9b5bb6e0d5e
	.xword	0x6c08d383f58f9e06
	.xword	0x7664d96dc66d3a87
	.xword	0x7b1348d5d458dcfc
	.xword	0x8f615cc002018da6
	.xword	0x1724b0b566f96cf5
	.xword	0xabf3f52f08dd2126
	.xword	0x8f89fa52d110262e
	.xword	0x85eca19e55d6a7d5
	.xword	0x64175c795dbcbf2a
	.xword	0x0c98620b9d721903
	.xword	0xfbf499bb1878baf1
	.xword	0xe50ee80664fe39b2
	.xword	0x98dbf3de40c48a1f
	.xword	0x965624c51b5aa257
	.xword	0xe6780273f0b3de81
	.xword	0xe4d70a105e7a52d5
	.xword	0x4ef3236d59ada065
	.xword	0x734f0c5ee8a51fb7
	.xword	0x32298c68c8ae4487
	.xword	0xcb83acc1bae5c3a9
	.xword	0xaf74a955260ad3a1
	.xword	0x1ba4e1365e62927e
	.xword	0xae201bd2af503f59
	.xword	0x3015d64dd2228041
	.xword	0x4ad58dcfa2a07ef0
	.xword	0x09110ac12a10fff1
	.xword	0x2ec85c9fd42efa02
	.xword	0x486f5d21338e1e1d
	.xword	0xcd8b5a7d867da28a
	.xword	0x0fcb438d3afb676f
	.xword	0x441e9c47ed01625e
	.xword	0xced0af348f0d5f4f
	.xword	0x7477b55fdb48e8df
	.xword	0x127b4f9c11178753
	.xword	0x9d9a9f5a4262016d
	.xword	0xa0fe3a35eef2b399
	.xword	0xd73c3afff785f47a
	.xword	0x075fcedc57b45915
	.xword	0x3b22c01727957946
	.xword	0x967b3b9b41fbd8de
	.xword	0x7ae800eac4cdfcc7
	.xword	0xb628f9c59556cd4c
	.xword	0x016c6d6ee0d9aa82
	.xword	0xd9b1defb80916cdd
	.xword	0x832049d460dbfcdd
	.xword	0x63e0aa9a29f9741f
	.xword	0x660289a2c5b3a0af
	.xword	0x8406554e608e5777
	.xword	0xd72469a12f708f3b



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
	.xword	0x53ac8a2f75a06596
	.xword	0x9c59a20fb4fe6b37
	.xword	0x9de34a4efd1ee3ce
	.xword	0xe370f1ca72a3c999
	.xword	0xd00b6c2031759c15
	.xword	0xc053ec7f20f06a82
	.xword	0x81d5c6373edfab55
	.xword	0x23a81efe033ed598
	.xword	0xe72084e9537be518
	.xword	0x530b7ddbf0ca7e57
	.xword	0xfdbe60e2f8b36d65
	.xword	0x0e82cacb31f933da
	.xword	0x2300e7b50d91d31a
	.xword	0x3c6bba7696c7714f
	.xword	0xf3d923e5322e02b2
	.xword	0x7a529364bb698a8b
	.xword	0x595eb4e9ed85afd5
	.xword	0xa42a1606dae1d630
	.xword	0x5636332019182bab
	.xword	0x7b122cd055c0532e
	.xword	0x578a6cc1c347d860
	.xword	0xcecc71282b460e18
	.xword	0x2ad808e9be042011
	.xword	0xc99f532aa413daa0
	.xword	0x5e7d431c2848e9e9
	.xword	0x0e6943a127ce53b5
	.xword	0xcae3c350f2b50f21
	.xword	0x72dca10b9608c3e5
	.xword	0x1420bab9f379bf11
	.xword	0xfbf7e88cf3b4f3ad
	.xword	0x99ebdbc2c055a3ce
	.xword	0x7cf1a71de19eadb1
	.xword	0x5e3eb8cf86165e30
	.xword	0x64ba26cf4ce5e2c4
	.xword	0x52e09ff8cb580078
	.xword	0x6eb6d7cb792a3e3e
	.xword	0xf608a5dd16ab6e18
	.xword	0xb45ddd5aea727cc0
	.xword	0xce900e579fd5d2c5
	.xword	0x097bab1b57d2a083
	.xword	0x5a2bd1ad24be14a9
	.xword	0xd84601aea24d490c
	.xword	0x37a7285e8eb0fb3a
	.xword	0x6c90c6e417b0396e
	.xword	0x6444ed078220c10a
	.xword	0xb21b3657285102f4
	.xword	0xa2d4247c0cc04ba9
	.xword	0x4fdddbf51aa15321
	.xword	0x3f4af98c4b11bdae
	.xword	0xfade9c3ba6a24763
	.xword	0x62053080d1863c87
	.xword	0x77a2ba6d51dc6f1d
	.xword	0xd02f904f521305be
	.xword	0x1e7142651d3c864f
	.xword	0x0535ce1799747a9e
	.xword	0x0b8f1c91ae7cbab2
	.xword	0x3902bd7bab50812a
	.xword	0xaf33bc0714da6c96
	.xword	0xf02e8f5288588973
	.xword	0xdae45b7c6d6eefbd
	.xword	0xed04d497e85925df
	.xword	0xb25c1021ea76bee7
	.xword	0x6c9b185253769d68
	.xword	0x845325cf113e81fe
	.xword	0xd207081c36441617
	.xword	0x43efa5f0072a9c9d
	.xword	0xb1a4f75dc4a5860f
	.xword	0x6ad84edd79704045
	.xword	0x1db795eeb86cb5c0
	.xword	0x930276b4b9a3f2ae
	.xword	0x1c362d3eea46c955
	.xword	0x1544cf3c497f4139
	.xword	0x9287c0e24113f0d8
	.xword	0x3fb66d91b18b8649
	.xword	0xa5644d6a7483ddc9
	.xword	0xf33311169bac1cbb
	.xword	0x64d930d22992a1ea
	.xword	0x80a5a3c3c62be3cc
	.xword	0x1ed342dc1602d584
	.xword	0x5b20ac484984f84a
	.xword	0xde8b318b9f4680da
	.xword	0x69d8d99282abcc0b
	.xword	0xbf0da24937ac2dd4
	.xword	0x9b20519608a3317f
	.xword	0xc7e23d9f24ea68a8
	.xword	0xe652d3a428f093b4
	.xword	0x24c87283f5c54840
	.xword	0x7d8ef76d1dbed3f9
	.xword	0x2ff89422e200ec37
	.xword	0x8bf6534f4138d293
	.xword	0x0c0531838b993366
	.xword	0x9c4a2900312ac113
	.xword	0xfaf52ae4a3293585
	.xword	0xfdaa4a98b9cb3930
	.xword	0xfe7ea0c994d139f6
	.xword	0xaa3397bb4d1793c2
	.xword	0xdd3e4f753c9f5833
	.xword	0x28b00848387cede1
	.xword	0x418386decd42def0
	.xword	0x1619b3faf517bf23
	.xword	0x6973e8ea504a8138
	.xword	0xe8ce739691ddda2e
	.xword	0x71c971d55c899ab9
	.xword	0xb04bf60f9041b3eb
	.xword	0xc77f6599a9b4102d
	.xword	0xdc42f6a0b9a1625c
	.xword	0xbeb4a0fbf44fd07f
	.xword	0x31cda733623e1121
	.xword	0x947d06423e3542d5
	.xword	0x6d2ae3dc856e156e
	.xword	0xa0f0fd909c7abf6b
	.xword	0x8a29fb105b287121
	.xword	0x7f87ce44e709fab5
	.xword	0x3b96d961699248cc
	.xword	0x6c044982cbfc445b
	.xword	0x6e44d69056b2487c
	.xword	0x6fc43cde402026db
	.xword	0x55e68a87b2a0e75b
	.xword	0x30b59df64cf81ea8
	.xword	0x1beacac27ddce0bd
	.xword	0x7c2410703228d873
	.xword	0xf90a435bdce6abd3
	.xword	0x28444147a3a30d78
	.xword	0x6d008e53e60be4fc
	.xword	0x082e1be7db6cbbb0
	.xword	0x65b57b4dd071bf27
	.xword	0xfaaece8baa403992
	.xword	0xfae72c6a1edf6760
	.xword	0x5c0add7d55568ac7
	.xword	0xecf473aefaa1568c
	.xword	0xd65da47a950b5a5d
	.xword	0x0da9835e674f1e14
	.xword	0x021f5d16e07dd3aa
	.xword	0x8c46b39f105d65af
	.xword	0x710cff8e6bb30154
	.xword	0xc49c89c7c76e0028
	.xword	0xa97061a0e85d2d74
	.xword	0xfbcb5438f04743d3
	.xword	0x5f7503153a5139cf
	.xword	0x6420fada789a9ac9
	.xword	0xd0324a661f4de7c9
	.xword	0xf2bc94384e9f32f4
	.xword	0x2efc6abb437a43a4
	.xword	0x9d27fc78ae7edf66
	.xword	0x834dcbd411e27181
	.xword	0x92c18462deb4d0f7
	.xword	0x18dd19bb43a49bcd
	.xword	0xadfd5c08de6aea64
	.xword	0x168b7d62ecea6eec
	.xword	0x81e36c048bd5c79b
	.xword	0x3cfbc247e8ce9468
	.xword	0xa0f0d4112acb5181
	.xword	0xdf1c15ab0c1cbff6
	.xword	0x197d058e9decacea
	.xword	0xee6689f9c9090c9b
	.xword	0x3323779b16430ede
	.xword	0x56333b0c8a139958
	.xword	0x417090c3223e20e4
	.xword	0xf56be73d56289b24
	.xword	0x2bf26d709f929e8b
	.xword	0x0bf9e576d9328b39
	.xword	0xe31923a209070efc
	.xword	0x32bb419c71c4b098
	.xword	0xa1d8bed4b330f88e
	.xword	0xb0820e264da42491
	.xword	0x9f9ccbd00f4bc452
	.xword	0x9d60145b564f42b2
	.xword	0xdec0c74b02c042ab
	.xword	0xee1f84f0d393deb6
	.xword	0x34e3defae85ee0ed
	.xword	0x954e617713311661
	.xword	0x82cf8036dce05cb7
	.xword	0xfbc35aeebc981342
	.xword	0x1dff65e4cf043a4f
	.xword	0x0cce7a34169d6e3a
	.xword	0xd8a64c9ef0da253e
	.xword	0x1c073afa8d9628ef
	.xword	0xc88e386083977a44
	.xword	0xfb85e818b2bb618e
	.xword	0x3f8ae4f9f19ab560
	.xword	0x45a090274ab7cbe9
	.xword	0x55b55df66ae403b2
	.xword	0x7afc23293c2d8510
	.xword	0x3e0e04875b4e4713
	.xword	0x4659b897efd41c93
	.xword	0x676c1070cf97028a
	.xword	0x346fc11bf23c7697
	.xword	0xd816acf77eb36e01
	.xword	0x2d35f1c7a94993f8
	.xword	0x95dc1f3b7ac7d130
	.xword	0xa645db16a41447d1
	.xword	0x1e0e21edadb7ea3a
	.xword	0x5c05b3998c60e6bf
	.xword	0x7760afdbb9d95ea0
	.xword	0x8051aecad066b209
	.xword	0x9dd3941858711fd7
	.xword	0x082e4013793acff2
	.xword	0x4f3398fe77b74e4c
	.xword	0x125e5899f31600a3
	.xword	0x816946f278f9ff10
	.xword	0xb9a949eb1a7effcb
	.xword	0x1d180659a97625dc
	.xword	0xb87b23f7357934ac
	.xword	0x24202e973dfbc1c5
	.xword	0x8e8f9996502d036a
	.xword	0x768a5258aa41cd27
	.xword	0xb300e449d6f2fd81
	.xword	0xa0bf498e23da29d9
	.xword	0x602a5a66f8e0ebd2
	.xword	0xf03d2e1ee8e42228
	.xword	0xe6af2b24268216a1
	.xword	0xc0a9c906b768a0d2
	.xword	0x552da20ebabc53ea
	.xword	0x133144e1d70810b6
	.xword	0x20c192783d875cd3
	.xword	0x82383e28bde6392b
	.xword	0x054bdf7717960aec
	.xword	0xe7d0becc3dc062a1
	.xword	0xf273862cdcf93d6f
	.xword	0x604acd6421a9aae8
	.xword	0xc015f613e244e6e4
	.xword	0xdd71e96d3a2b6c71
	.xword	0x3182b8a934e2ca51
	.xword	0x15b58f682feba1bf
	.xword	0xbcbda1257da8289d
	.xword	0x7dd21e498b5f46ac
	.xword	0xda50ac25190674cd
	.xword	0xce648478eb7fea34
	.xword	0x67df65f0a9f28ab2
	.xword	0xa26184a961fd3586
	.xword	0x382a1717327d36f1
	.xword	0x541c6354c4c85b88
	.xword	0x5fd4cdd363251848
	.xword	0xab8d39954c522471
	.xword	0x61516162825e8667
	.xword	0x8a6b9d42e38ee076
	.xword	0x50ffb459340a382f
	.xword	0x04120d54a7167911
	.xword	0x8ce5ae053dfe67de
	.xword	0xe4451b58d61c6133
	.xword	0x9fcfa439be4ab696
	.xword	0x03b5f620b48ca32a
	.xword	0x6a3ab574f83d5008
	.xword	0x9d8f58adba77374e
	.xword	0xd0a34e9f2b55ca7c
	.xword	0x7891d5ace3a455ee
	.xword	0xfa697f7996be2641
	.xword	0x5e1576a347056b14
	.xword	0x8ea9b44327b0d60a
	.xword	0xc38aebdeff5009cb
	.xword	0x417df1dfc196e6ab
	.xword	0xc21788f9073132f3
	.xword	0xc8ed9943e0b0bafe
	.xword	0x76bbea54374ccf75
	.xword	0xe6a7bebd1497731e
	.xword	0xbf4a8ab0cc8b3067



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
	.xword	0xe08dda5b12bed38a
	.xword	0x449189955d05f400
	.xword	0x7910cbff33019af3
	.xword	0xba2d534fe7e11d6b
	.xword	0x021a37c3bc335128
	.xword	0xf4afd6f7d86d2bd9
	.xword	0x8b8e8b2d86d4f44e
	.xword	0x0af184bed2112779
	.xword	0xf46089798d13af62
	.xword	0xde1658de2d61529b
	.xword	0xd3e2baca28c07fe6
	.xword	0xcd60aa5e13511b9f
	.xword	0x7bc2419552fb7b04
	.xword	0x1383c67594c5e523
	.xword	0x29f0976fb29a8560
	.xword	0xc7fbb2a687d7c62c
	.xword	0x623e196c0957144f
	.xword	0x7faeee0d3ff8000a
	.xword	0xa4e86b4e922fcefe
	.xword	0xc93309e937d9f1c3
	.xword	0x19e685fb4efa6a8d
	.xword	0x20ede15e9d41a9a8
	.xword	0xa6cb51c417206c8f
	.xword	0xf31935ae27eab1cd
	.xword	0xaa1a044ecc98aaa0
	.xword	0x4986724cd7dc1d4d
	.xword	0x36bf52fe087fcd86
	.xword	0x3e57fe9fa1ad1f3f
	.xword	0x965f86f21e768528
	.xword	0xd1ac400f205c425a
	.xword	0x15a607eb04a990b3
	.xword	0xbbd68354b50f0c84
	.xword	0x98295e16a10de2c4
	.xword	0xa26baefb58e03944
	.xword	0xedc9bef0cbe92c4a
	.xword	0x4a0f3bbc3b7f696f
	.xword	0x299ea7cb6804cf12
	.xword	0xd6c47c5ab25c403f
	.xword	0xd627ef4c505abbeb
	.xword	0xb33b49282f7c9987
	.xword	0xadde5ce19ef97fad
	.xword	0x82d146f9e7d62684
	.xword	0x9b49856c9d0e710c
	.xword	0x1fc4ce08831a8261
	.xword	0x1c4982aed3673708
	.xword	0x8e6fefdab88f3f22
	.xword	0x5cf745b5c3b3c422
	.xword	0x8a7886af362a98e7
	.xword	0x3dca6aa4a4ae57a1
	.xword	0xc27cb5214d89c30f
	.xword	0xc32f2b790ca0130b
	.xword	0xeb17c6d082a79662
	.xword	0x006376e253886435
	.xword	0x91abf2281e98b416
	.xword	0xe2e3909ecc7411e5
	.xword	0x3bb3ad9a0c7e0c77
	.xword	0x83af2b8050222936
	.xword	0x6ef76d777e47fbae
	.xword	0x92434e4ee03d8e3f
	.xword	0x8288e80319bcda90
	.xword	0x4f538ad9f7100faf
	.xword	0xa425fd543c36fce1
	.xword	0x4a03bc1df34b37da
	.xword	0x2bd9a4f121b8ce60
	.xword	0xab2224df792d2d9f
	.xword	0x5508efaaef1ce131
	.xword	0x2bf29dca94e560aa
	.xword	0x44634acf71be486f
	.xword	0x31924d32591544e3
	.xword	0x85c93613f3e37f62
	.xword	0x935f39ad6322672d
	.xword	0xa200d24c7e4ffdb5
	.xword	0x252bc9f00db2e244
	.xword	0x16b7ade11aae9ac9
	.xword	0xe791eaae86d439cf
	.xword	0xb7355f14f0c4fbdf
	.xword	0x07b68c390f8f1f47
	.xword	0xbaa1dfac7192498e
	.xword	0x496b3c06630c3eab
	.xword	0xab05863c45655dc2
	.xword	0x3575558d1a2d602d
	.xword	0x5e122fa225016b9e
	.xword	0xdbf0006c8d3d971a
	.xword	0x6558cd1efe7ef6c5
	.xword	0xb351e0fece18f958
	.xword	0x8e08ae014557553e
	.xword	0x40aa04b6d53baf74
	.xword	0xd74c46c11884e36d
	.xword	0x0f2d4623a6a98ec9
	.xword	0xf9ea88d06c366a77
	.xword	0x3289fdd2689df9e6
	.xword	0xb49bbac62b90870d
	.xword	0xcc1ed55d655d1087
	.xword	0xb4ed2a42eb924251
	.xword	0xc8d3f8f6d0713d9c
	.xword	0x2fd61e5da4c83717
	.xword	0x57bdf7cc5aefc367
	.xword	0x4055566595df59f7
	.xword	0x716115491a0ee942
	.xword	0x1597f89a09d9b482
	.xword	0xdf90b09f9d5b5ad6
	.xword	0xe37d5f6b78f6f855
	.xword	0x085e0f22baab4dbc
	.xword	0xf6bfec45025e7276
	.xword	0xa78067b9c31d7fef
	.xword	0x3b406176eeb2be87
	.xword	0xcc1f8790c309b14f
	.xword	0x96347d584dd87deb
	.xword	0xe75548a5a0f9e6c0
	.xword	0x2c4fcdf381b3a78e
	.xword	0xfbedfd9721826424
	.xword	0x27e4ac1b291f81c2
	.xword	0x3eb5cdf5d6ac42f4
	.xword	0xa25640e9ea962010
	.xword	0xee0a077b935c099a
	.xword	0x3c5c94ab40709b4a
	.xword	0x37cfd61d3cb4a13b
	.xword	0x4337e8ca1eb0e9ff
	.xword	0x8ff7fb26bb1a14e9
	.xword	0x61b058b7ae061ce3
	.xword	0xb8827a404702246d
	.xword	0x8483457eb63105c8
	.xword	0xc8059ce325166e18
	.xword	0xc3a80acc857da9b7
	.xword	0x85263c9a67697f9f
	.xword	0x7cd9ce229d802c91
	.xword	0x64a2a1443c24689b
	.xword	0x988dca92f5f29a8b
	.xword	0x6c5586c50b8caad9
	.xword	0xeec2bb8a139e30e2
	.xword	0x4baa3e83ca458127
	.xword	0x4371460d43c7ddb0
	.xword	0x85dd9e37faeb426d
	.xword	0x24ffc0f9fc29a7ce
	.xword	0x419aa764cb321743
	.xword	0xc8b728db301931ef
	.xword	0x74c92f17bf157d40
	.xword	0x19d1416c5fdcc6a1
	.xword	0x5d71b6802725d57d
	.xword	0xf661195abc41f661
	.xword	0x7ceda0e5ae0c25f5
	.xword	0x43b473ba0a5ccc83
	.xword	0xa87042d28e7ccda6
	.xword	0xdadc8b59db96ebbe
	.xword	0x27b66f69a6f23aca
	.xword	0x930352746c2322c3
	.xword	0xe508a29e660bac74
	.xword	0x46d7e00a9b088ab6
	.xword	0x225fe636a6088b67
	.xword	0xb98a695ea1571890
	.xword	0x2a531e39705a1ea5
	.xword	0x59efe4f5844fa7c2
	.xword	0x001425e17293a400
	.xword	0xc16c3b367deae3f2
	.xword	0x225b00bc70fdd793
	.xword	0x6791ebbcbde279a6
	.xword	0x169c3f80e8cea43e
	.xword	0xda877552ddd666b1
	.xword	0xf976e1b797911616
	.xword	0x53ca4f40ab696459
	.xword	0xc57bdc0fd5952904
	.xword	0xd02ec960d22ea809
	.xword	0x9b754de1047c5978
	.xword	0x0cbaa0635f4e9140
	.xword	0xfd99681ab252f1a5
	.xword	0xb27bc52df9b55a1b
	.xword	0x6490da5e8023eb21
	.xword	0xdd8ff4c7ebf9b5ed
	.xword	0x94fe19d857b46d78
	.xword	0x3c7f5a8de388fe9e
	.xword	0x03a3e7b4878d0d4c
	.xword	0x20ec95e64aa4e545
	.xword	0xd8917316bc13759c
	.xword	0x836129928328848c
	.xword	0x9fefa81501c058df
	.xword	0x6ef6e14a6cd69cc0
	.xword	0xed11055ff9cf86a1
	.xword	0x92a39744b7377045
	.xword	0xa107740aeb807f58
	.xword	0xc0e5c69f7453f9e1
	.xword	0xf1e026e7396468bf
	.xword	0xdc33b672409283c6
	.xword	0xcf184c53715df8a8
	.xword	0x5efc60f300aaa5a9
	.xword	0x21768119fbedf858
	.xword	0x7cd372f05433179e
	.xword	0xb0f8388784ac53ea
	.xword	0x84325fe955223db1
	.xword	0x1f542be877afd3e6
	.xword	0x677801089577f494
	.xword	0xebe0d6fe49854dc5
	.xword	0x9d058fe0394863a0
	.xword	0xa59cfb3e3f393798
	.xword	0x296e8b1d53816a98
	.xword	0x7849b739dae48a8d
	.xword	0xa05e75befa4a0340
	.xword	0x4dbbdce624f5fa8a
	.xword	0x8b82eae9213d7ffe
	.xword	0x0e6d5787fde7e386
	.xword	0x9af1d1a6e2d93fb2
	.xword	0xa0c922810955e3e4
	.xword	0x3024d3e49dc04afc
	.xword	0xf4ab8c0ecf773838
	.xword	0xbe70b74bc302050e
	.xword	0x24d8b6d155e29792
	.xword	0x0117b607750a64ea
	.xword	0x9ae3737b5995b1ee
	.xword	0xe8cac48bf7034dfe
	.xword	0x853cf1305472ddb0
	.xword	0xcbdeb8a151e95690
	.xword	0x442d526313583bfe
	.xword	0x4e13d25615eecc55
	.xword	0xbc8dbe2da2f600fb
	.xword	0xfc5d9fefec187a05
	.xword	0x152ba35d3538e2cd
	.xword	0x8c0a01644a320043
	.xword	0xb054f829b00173f1
	.xword	0xca1bec6fe5415b14
	.xword	0xc2c7766eb5ad8c19
	.xword	0x3d17727c9f2278dc
	.xword	0x77ac2a0fa3bc525b
	.xword	0xc5808a9fdebf9f2d
	.xword	0xb68544fe9d1e2c9a
	.xword	0xd80afe92984e336b
	.xword	0xf0643cadf74d7777
	.xword	0x6d92fcb33e562f2f
	.xword	0xd4abd3f7ba77ea69
	.xword	0x34fd2be9c23ca578
	.xword	0xed32d4af281a63ab
	.xword	0x600412662be87080
	.xword	0x4453772f04c9f274
	.xword	0xff98419e681f141b
	.xword	0xaa331c6859ebe243
	.xword	0xe44afd0b33cda171
	.xword	0x32dc9836471260f5
	.xword	0xff676541a7e80b0e
	.xword	0xefef2f652ea8b6be
	.xword	0x55b257d8197a6c09
	.xword	0x6ed3ddcc9e2cc7c4
	.xword	0x7f5361fadc3fc62b
	.xword	0x1ccb2ca7438b81c2
	.xword	0xc1387918c9ac7d13
	.xword	0x03a769e5a695f068
	.xword	0x4db7aa35e8a993d2
	.xword	0x113c6ed79e9d781b
	.xword	0xaabae51ac706c759
	.xword	0xc47e99988c0a1967
	.xword	0xb38467fee6866ed4
	.xword	0xdd1cf7a63aa3b6bc
	.xword	0x0257b913382d4716
	.xword	0xb860d83110fde231
	.xword	0x3fd862300a2bc9c6
	.xword	0xbeccd381e5795915
	.xword	0x7b990fcfc9a2812d
	.xword	0x729adf48e6ae7da5
	.xword	0x74bdb80f944580a3



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
	.xword	0xbfa904d74040f97c
	.xword	0xdccf4d0861e36f74
	.xword	0x8efe443ceb57248d
	.xword	0x8cb92c2fcb31ec70
	.xword	0xacbeb32bc33f8b65
	.xword	0xfd4d9719c4264a50
	.xword	0xd5d3280f6ce91a0e
	.xword	0x41fac5aa68134867
	.xword	0x21416554ce22fc31
	.xword	0x6e830c064cf9c5e0
	.xword	0xdb55d51e30b3c365
	.xword	0x71c995956ed16336
	.xword	0x27d3392e644828e7
	.xword	0x5e72ab253d10f167
	.xword	0xde6e2037dadd7c29
	.xword	0x886fddb6d4e8cc3c
	.xword	0x70181955150a9fb3
	.xword	0x4936f49c8872097c
	.xword	0xf3668bab3f309d83
	.xword	0xd84d338e2ab4492d
	.xword	0xa0471d5d1de9e653
	.xword	0xbd3ca3f11f1159a9
	.xword	0x811212a89f71b868
	.xword	0x28c50f12fe872a46
	.xword	0x97a6bdf26404177d
	.xword	0x5bdfa769d9d3c122
	.xword	0xee5e2428b49e2a0a
	.xword	0x840d48dc3055774b
	.xword	0x915d4f010d63905b
	.xword	0x74cedd0dd11810aa
	.xword	0x3a280cc7f92fe223
	.xword	0x79dd4c6c1cef6c9f
	.xword	0xc7f443d4d01d056e
	.xword	0x53f69b8d79d3fc20
	.xword	0xff73c06346a443e0
	.xword	0xc8a8df9ddd211f6a
	.xword	0x6bc7b9d19834691e
	.xword	0x4c617d9346a9d10b
	.xword	0xb7b52e3f5d7b2f0e
	.xword	0xb3c15e8690dba46d
	.xword	0x2eadd88ed1c4f175
	.xword	0xb7338810b7da92d3
	.xword	0x925b6896fe639a5f
	.xword	0xad57d3160aafc1cb
	.xword	0xa15045b4eb6020d7
	.xword	0xaf048537c4ec0cc0
	.xword	0x0dfec99be4c76329
	.xword	0x428dcafd89a10e28
	.xword	0xfbca9d9a0bb76cbb
	.xword	0x6238d4e5e0081b41
	.xword	0x662d7e59b5779808
	.xword	0x1e13e8cd6b7e4bce
	.xword	0x6acd11964f593f39
	.xword	0x46164b91d5a33263
	.xword	0xe03ba9e0f76525a0
	.xword	0x7d8853b76d5ad62c
	.xword	0x67476e52baf43444
	.xword	0x7b85d63a3380a5d0
	.xword	0xb6e0242f339e41bb
	.xword	0x18511b823f71bb81
	.xword	0x2b69f535bf9c8f8f
	.xword	0x9b70d0749f52c8e6
	.xword	0xd68b192b35fce060
	.xword	0x9e920014636aed3f
	.xword	0x9c8b8a934264fefb
	.xword	0x4307bb60ab6da2a2
	.xword	0x7aa37a1b235f5b53
	.xword	0xa0ab2c1af6a5e1f2
	.xword	0xd615f33198a82bc1
	.xword	0x52359495b0966576
	.xword	0xb572b5e30d05f3da
	.xword	0x3f30174743957b1a
	.xword	0x641602009b78cbf9
	.xword	0xd1711484b1ed752f
	.xword	0xf74fc3d72962ee3c
	.xword	0x246aff5b00ebadc6
	.xword	0xa7c3c47d6223c04c
	.xword	0x67cac35b5486846b
	.xword	0x3d67289f6806b199
	.xword	0xb71442a31f9bd19e
	.xword	0xf258d298d45a774e
	.xword	0x6c0f58a2a82c6784
	.xword	0x2b74518436aa0ad7
	.xword	0xdb19cbb9e5a476f2
	.xword	0xfa459e0b8f91ca83
	.xword	0xb7abd9aead9cb742
	.xword	0x1485d61949f14956
	.xword	0xff6b1484a9f5c2d1
	.xword	0x2c86a9c6f5721fd2
	.xword	0xc084f7c892369423
	.xword	0x34f2a010cfdccf8d
	.xword	0xffa3a0886e34bc4e
	.xword	0xb78cb80cc255fef1
	.xword	0x5b8178675359c0c1
	.xword	0xd17b0f921243f489
	.xword	0xaa513bc1b12e48dd
	.xword	0xc3c1daeb8a1b99d1
	.xword	0x32534a86868700be
	.xword	0x5da6350dd4e0a7bc
	.xword	0x34cf875e5c805f1b
	.xword	0xb33bb334b4c53e28
	.xword	0x4c01807c61e1e572
	.xword	0xe3c47bf3c38b1b4c
	.xword	0xb3e304f3eceee345
	.xword	0x1f8c151fdf88a89a
	.xword	0xb3ef98adfd23a71f
	.xword	0x9712b147a3e1541d
	.xword	0x8d1deb0b2b1208fe
	.xword	0x06b6bd2c4a3d4633
	.xword	0x7626a630497101c1
	.xword	0xeea5af66d718fc81
	.xword	0x80ba5db60ae7f4b7
	.xword	0x8035cf2580b84767
	.xword	0x7f48d666549c1abf
	.xword	0x216bbe5d59288838
	.xword	0x0a7901f5a4e7b6c4
	.xword	0x9d38e3547d11674f
	.xword	0x60ed8e7949c792df
	.xword	0x6116f131ce706986
	.xword	0x6a8727ec5d9a512c
	.xword	0x00281c858949251d
	.xword	0x504e94e8b92f0e66
	.xword	0x0b1ff4417495b2a1
	.xword	0x0d5328fdc6b3c90f
	.xword	0xf44a0d44174b5c85
	.xword	0xd8c2a65237ffe279
	.xword	0x1371576ea13a6504
	.xword	0x991c87f65433ce23
	.xword	0xaf7a0fbc8a3bcafc
	.xword	0xa81b4c7f237a3ae5
	.xword	0x5009a47ae37afe59
	.xword	0xb0cf53188f6035bd
	.xword	0xefcdfe5b43a0d6e9
	.xword	0xf76ddec50d837437
	.xword	0x9bc64ff4627433bd
	.xword	0xe196d915df02534b
	.xword	0xed19c67dbcefd669
	.xword	0x09a2ddadb4bb6605
	.xword	0x64e94f98c89b1581
	.xword	0xaf00941f46fcfb4f
	.xword	0x24715ed8dd709c41
	.xword	0x69f15bfea075993c
	.xword	0x3bdf3a63d44cd552
	.xword	0xdf0448adef478934
	.xword	0x0d434a17d2d6f842
	.xword	0x6a21515226fa9c6c
	.xword	0xd939d64ef605dc75
	.xword	0x16993905cfe9f19e
	.xword	0x8a0b07f0de0db579
	.xword	0xec1797a680434fa9
	.xword	0x83520c85937907f9
	.xword	0xf08c212ba5167fb7
	.xword	0x7bcc802c6753a4f5
	.xword	0x7711f8136be81526
	.xword	0xa6ad6d66e3a898e8
	.xword	0xf7470a25c7d24cb0
	.xword	0x0b33c650e118e59f
	.xword	0x3ef5ce4be64e9348
	.xword	0xa9abb200d733eb56
	.xword	0x803efd7129d808f4
	.xword	0x64821904507df3d1
	.xword	0xa4d0100dc359aed1
	.xword	0x11b7199e0ca454ec
	.xword	0x2920b29d64037d7c
	.xword	0x2ddea35d5f3174ee
	.xword	0x92890c6a2c02aaad
	.xword	0xd0858b66449baf7f
	.xword	0x2c7c3d10f480e88a
	.xword	0xaa15cd27b93e3333
	.xword	0xd8de343d5309e7ba
	.xword	0xcb43252e91f46479
	.xword	0x0e258af1a456dc13
	.xword	0x29b72e5fcbdd2661
	.xword	0x80e43f01713a2598
	.xword	0x2422c28a64c7c2c0
	.xword	0x1085537c7ea1ad04
	.xword	0xf93c6bc54c4c398f
	.xword	0x53ab38dcaec1cea0
	.xword	0x45ffbfc4afd70ff2
	.xword	0xc33f87094a0a3dbe
	.xword	0x5b3a59cfe982c17d
	.xword	0x39771fd2dd579162
	.xword	0x1adedbf9f02950ca
	.xword	0x36dccdbf0040ffe6
	.xword	0x02f1ece4db613326
	.xword	0x7b83eab9409e9a06
	.xword	0x1b2e9005a220b503
	.xword	0xaf1340be3bdf0713
	.xword	0x694578ef4b1c52c0
	.xword	0x293caaee7e9961a3
	.xword	0xcad098bd061b3832
	.xword	0xfd12377edcade5cc
	.xword	0x70b045d6b2c932e4
	.xword	0x1a61bcb9a3370b87
	.xword	0x8bb0c5d744fc5c52
	.xword	0xbdb70c8da807886f
	.xword	0x636d1bd5f76d1cd6
	.xword	0x9e228c752156b2af
	.xword	0x774d7797ddf68a96
	.xword	0x887ffc711e019ab5
	.xword	0xcc3674b80eb1ad6b
	.xword	0x387a9508753fa174
	.xword	0xf3c0ff732e314363
	.xword	0x35089a451abfd454
	.xword	0x8e90466a404303ba
	.xword	0x08e0da3175ff59e8
	.xword	0x12fe17e47d1effe8
	.xword	0x16d9c079c2b849e5
	.xword	0x78265fabe46c1730
	.xword	0xe68ff5d36e2aeaa0
	.xword	0x30a4ae897eadf133
	.xword	0xfa699447eb9d9156
	.xword	0xbe37989b88bee473
	.xword	0xa0718067a73f132e
	.xword	0x3f7ef1ee4ea69bbf
	.xword	0x80eba87cf720479a
	.xword	0xaae6a6d09fc76432
	.xword	0x87b2b832f341da09
	.xword	0xa5311cf33e9cb81c
	.xword	0x50f63a9b9e4664fd
	.xword	0x8c9e590ebfddb666
	.xword	0x639a5324e9be17c2
	.xword	0x3cf0d07863f8042e
	.xword	0x4672a78fe10da45c
	.xword	0x16352c36d0c53e1d
	.xword	0x3386b4e0bbc1d008
	.xword	0xd0d91547ad4981de
	.xword	0x14164deb7d339073
	.xword	0x0149371389ffd528
	.xword	0x1809e8a41a2c51bf
	.xword	0x931d13a68da0b253
	.xword	0xb76a6ce93ec606a9
	.xword	0xd075d6df78e64c08
	.xword	0xf9830dc6ff4d55d1
	.xword	0x06371e1d02a464d7
	.xword	0x6ec25ae75e52bcea
	.xword	0xa1fb401fdb652c02
	.xword	0xf37dc19d7b3ce20f
	.xword	0x976ff0b3028b2bad
	.xword	0x319e30865837c310
	.xword	0x8e3f5e8d8c895c13
	.xword	0x848f21b3fd18c2d2
	.xword	0x4662e328fdc94529
	.xword	0x2167636c6aaaece9
	.xword	0x8490337d504e06f9
	.xword	0x4c36f08c7c47c6a6
	.xword	0xfa878bc5e6222b4e
	.xword	0xd42da17e38b58154
	.xword	0xae1b0d66ea9152c6
	.xword	0x6134c843e61bd49c
	.xword	0x61dc1719c68acad0
	.xword	0x0ea8130a85d14a14
	.xword	0x1a2b79439c5f22ce
	.xword	0x6f15c9bb15c384fc
	.xword	0x99debe40d650ab76
	.xword	0x357eda344f387225



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
	.xword	0xdce5598461d4ace6
	.xword	0x4ae2ad6577d7801a
	.xword	0xee6bc9bbd144f064
	.xword	0xaaf2c43268dcbb67
	.xword	0xcee0fce8fe9cb08f
	.xword	0xd3cde3d8c9fec179
	.xword	0x25c37787c7d234c4
	.xword	0xbaa8566644cfeb8c
	.xword	0xdfb5f7be8acdc802
	.xword	0x0c5fd8ebb33ee765
	.xword	0xbfe788b1aff85e48
	.xword	0xcd7117a031c28687
	.xword	0xe38ca67e3a198a3e
	.xword	0xd0d9b3896a807354
	.xword	0x6046901d54eebd45
	.xword	0x53b6aadedfbe0131
	.xword	0xca4706748e941d4b
	.xword	0x485a31d048578c76
	.xword	0x2b22520e9543d189
	.xword	0x76a332933dd3ffff
	.xword	0xd6b5c0bf0fe9bde8
	.xword	0xdb840fdb08252ef8
	.xword	0xab0088537b696c8e
	.xword	0xffebfe524ab14f92
	.xword	0x9c57e90991cde643
	.xword	0x9bc0f0f4a6c4e0d3
	.xword	0xfcc58c6c9ad37d94
	.xword	0xd3809108935adb8f
	.xword	0x39a1943affae6486
	.xword	0x90a22dd820ca51a3
	.xword	0xa3c39677be803d72
	.xword	0x58aa693c2d1ee23c
	.xword	0x3703a5a3dbdf8960
	.xword	0x8307396e41275ead
	.xword	0x899430f750f2631c
	.xword	0x31d9a9e5570a657a
	.xword	0xbad4d200ceeb8e00
	.xword	0x19acff51cf4d5252
	.xword	0xc3135f47f0b03c73
	.xword	0x3d40e3356b013e9e
	.xword	0xe3c628b27445ad6e
	.xword	0xc59d046b14f62106
	.xword	0x166635403d3d3b80
	.xword	0x348625f714b9a760
	.xword	0xbe61de675475cedd
	.xword	0x9e7ba65f67e1eb6a
	.xword	0x32f3ca59d8d288ab
	.xword	0x9e085742a9cb0156
	.xword	0x9661a3046234e53c
	.xword	0xc78887d8f81c9d89
	.xword	0x60979c97d6a8673f
	.xword	0xf99dfa8c00895d7a
	.xword	0x2ed512bf9687e046
	.xword	0x1c098d0ad023f1ae
	.xword	0x42af9a6f6f143879
	.xword	0x29cc997486debf44
	.xword	0x69a7c643ac5b2b74
	.xword	0xf8eabe6ee19b218f
	.xword	0x2b658cf313aa63c5
	.xword	0xe70fcd9978d48bf0
	.xword	0x0dc003b1e5ce73a5
	.xword	0x3c13f55da0505c70
	.xword	0x40935a92bb766644
	.xword	0x02d6684155e74f9b
	.xword	0xf31cf7040773024b
	.xword	0x3cf72deb2554b310
	.xword	0x75108d75f6393476
	.xword	0x6b7870f7a42042a9
	.xword	0xbb3d70767ac16999
	.xword	0x7a8466e5efd131c8
	.xword	0xa7bd1acbc1034248
	.xword	0x0fefd635ef8d0da2
	.xword	0x4029a0dc6b11488f
	.xword	0xe618952deb089f91
	.xword	0x5afd9652a7253cb5
	.xword	0xd8d9d7e2610f4d51
	.xword	0x9ce90b2842749abf
	.xword	0x12339a53827ec044
	.xword	0xd87c01caaeb12a1d
	.xword	0x7d60e49d94864d54
	.xword	0x53c6950f9760336b
	.xword	0x732cc9f78a04915c
	.xword	0x47f8d194aa6f5e25
	.xword	0xbc36393e3b9c7492
	.xword	0x6f7e4f4197035b9a
	.xword	0xf3a1c4671ff2f04b
	.xword	0xf967dd333882319a
	.xword	0x19fea0422f64faeb
	.xword	0x00a158b439b4e06f
	.xword	0x328b6313ea05e9d2
	.xword	0x4c3940ee39e0c805
	.xword	0x48a48698c5170051
	.xword	0x7b4945b441019276
	.xword	0x6c755ff7b37690ee
	.xword	0x6f268f282c39d77b
	.xword	0x41e9cfae5e01e30a
	.xword	0x9c42b56c3020fe58
	.xword	0x97f8375f5fd3e80b
	.xword	0xd431d3285e21c232
	.xword	0x6276c07a4003c32c
	.xword	0xcfb7731c9fe61722
	.xword	0x393483f5f4f0b281
	.xword	0x2ec6f59fb149d921
	.xword	0x8e32f5c76fa685fb
	.xword	0x9c00812888846fe3
	.xword	0x0455580cb62cb036
	.xword	0xa5883254cf69301c
	.xword	0x902ae9d4c2b40db8
	.xword	0xae643e27dc940375
	.xword	0x879d0e6ee101e0b0
	.xword	0xd2e2bac61eae087b
	.xword	0xa9a54f28ba1308c4
	.xword	0x266fe7600dd1fc6d
	.xword	0xc0dffec3ff745561
	.xword	0x466a26cf6192f969
	.xword	0xe8b97a2fe91eb20f
	.xword	0x5575627884fccaa2
	.xword	0x2dbc17051f43bd77
	.xword	0xad0d17ad3326b2c1
	.xword	0x2d2eab608eb11157
	.xword	0xa1478fe07665d914
	.xword	0xf0619b451d322ae9
	.xword	0x1b06a89ab01bdb51
	.xword	0x268ab0d1fa5cfa0e
	.xword	0xd47bd5c817ef927f
	.xword	0x226094aaf4a80c1d
	.xword	0xf0070df9fcbfde39
	.xword	0xe5b5b48097f86eca
	.xword	0x8db0e2af098dee52
	.xword	0xb80ccd544df3d055
	.xword	0x8ceb36aa9f766a5d
	.xword	0xa92c08178674dca9
	.xword	0xb009cec0243f33f3
	.xword	0x9dbae182c02a730a
	.xword	0xe8c90a2fd6e31ba2
	.xword	0xf026fb4ecbac15bc
	.xword	0xeeff806c78853807
	.xword	0xe5cc6cfe4b5d3be0
	.xword	0x5f54dd3f67bf88fc
	.xword	0x7a91ac0491026676
	.xword	0x91a7a0d09085f066
	.xword	0x8401fe8a24acfa76
	.xword	0xf29f2405df28849e
	.xword	0xc814c3f415455a3d
	.xword	0x5e2dfbe74bed2ce6
	.xword	0xffbee377cd7f7516
	.xword	0xd871db79d9919f4a
	.xword	0x3adace2299cf6c93
	.xword	0x81a930354eda06be
	.xword	0x8a1c523d8c13eea0
	.xword	0xc096256a78db9412
	.xword	0x02c5afb245816cd7
	.xword	0x076b0ff49738172e
	.xword	0x1c89e4f8ce68b55c
	.xword	0x6f3178fb11b3d736
	.xword	0x9a79589cf3dafc2c
	.xword	0x2a06f75e8210491e
	.xword	0xdeee20f536806a8a
	.xword	0x462478d67118f16e
	.xword	0xd6445608e94d2e2b
	.xword	0x61f32cb47fcb0815
	.xword	0xf5034d10bea65bed
	.xword	0xe7eab529f0a785c4
	.xword	0x9bc5070d29d12fa6
	.xword	0x766830527aedc6aa
	.xword	0x0e2554e105b72a4c
	.xword	0x6e4b865e76fd1f06
	.xword	0x74c9226a3898e42d
	.xword	0xb621ca0faab23b97
	.xword	0x74d19a38c6f4a5f4
	.xword	0xc6693d4f2eebaa3a
	.xword	0x8d4693b627e110d4
	.xword	0x0ec2da24dbe94786
	.xword	0x933ed8c8304df485
	.xword	0xf62d1fb92d96065a
	.xword	0x6bafcdfa757e50fd
	.xword	0x53f6d12b3b97f9bc
	.xword	0xa1dac4c0b32d09eb
	.xword	0xd03cb0f570338c3f
	.xword	0x514865f0ddf9eee5
	.xword	0xc81451151ba81846
	.xword	0x7ab393682abe5a83
	.xword	0x6ac604b36461c0d3
	.xword	0x9ef14f650a330f33
	.xword	0x59294d73798cca33
	.xword	0x2c2049f7a4c19770
	.xword	0x34cdfda7ca240e6a
	.xword	0x20bfe3f4d4cc6dde
	.xword	0xec5cbc97b08b8983
	.xword	0x04b844a02c70bc11
	.xword	0x3ab3d8700a1972cb
	.xword	0x29a943f71590f737
	.xword	0x573a91ed617fbef7
	.xword	0xb68891e1b0c7ed4e
	.xword	0x89c60e9e5a31c636
	.xword	0x44706a03c7cbb599
	.xword	0xce3fdbd3bcff7bb6
	.xword	0x95a8d52882925164
	.xword	0x528fc5304737832e
	.xword	0x77680f6ffbc7f7c4
	.xword	0xf03d2ecabd25bd61
	.xword	0xa9acb7506ffea935
	.xword	0x02130eb1773da7c2
	.xword	0x7b33011bf1f676e4
	.xword	0x9c2b6a2bfc64be90
	.xword	0xd49baa1976ee481d
	.xword	0x79f9635245b8f4cf
	.xword	0xdd38849ce4939db1
	.xword	0x8b525949948d543a
	.xword	0x9b3287f0e63ea20f
	.xword	0xc82dd71d1aa1760b
	.xword	0x5016dd17aa7f7709
	.xword	0x838013d21d162084
	.xword	0x7c389f9920032496
	.xword	0x4e56127095238ce3
	.xword	0xc373194720ac04f3
	.xword	0x7afc5b34c4bf24e3
	.xword	0x3980bb03b66ed630
	.xword	0xb3f9b27f487dc2e0
	.xword	0x20f238758c6de935
	.xword	0x29aaa78f770f2f28
	.xword	0x69143f5c720c1967
	.xword	0x329c712244e8731c
	.xword	0xa0fda96f42413f34
	.xword	0x95db5ff2f15aafeb
	.xword	0x3216560f67f5bbe9
	.xword	0x4cddedbbf7af87e7
	.xword	0xcce435b3cee2f419
	.xword	0x79dd2f3b5177463c
	.xword	0x1aad82106f63179e
	.xword	0x9062c7b2c1c8ccd5
	.xword	0x509cf7a937d41aab
	.xword	0x7a885fcf87d2c6fd
	.xword	0x809f6f039c4491e7
	.xword	0x7eb00271d03a5dc1
	.xword	0x49bac321f368964a
	.xword	0xd55752e07ee779ad
	.xword	0x0f9c7a3607215233
	.xword	0xe6f2e5d7c6ea2116
	.xword	0x550e5d8aa09733f5
	.xword	0x42d860cae045494d
	.xword	0x7017de32295e4f36
	.xword	0xcf423f6e47403bb8
	.xword	0xa95197d8efa4b14c
	.xword	0xa2ddb2b42e9119a3
	.xword	0xbebb857a07f219fb
	.xword	0xb6283dcd27eb7a33
	.xword	0x03d9c3bcd7b10e18
	.xword	0x5a2020d51898ee63
	.xword	0x456a740940685adc
	.xword	0xb6a279ba6de68ce0
	.xword	0xe3de4b25d26fe49a
	.xword	0xd3cd55fa73a3b893
	.xword	0x4b5f69b5522aabc4
	.xword	0xd6312d2c5d14e0ae
	.xword	0xbea5918a374499ac



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
	.xword	0x6bf33cce5fc2f7f1
	.xword	0x2a631d18639e0308
	.xword	0xf5c98fe281bf7c6a
	.xword	0xc7dd39c586f6145e
	.xword	0xf03998dcfb7bd3bd
	.xword	0xc73e0830473dfde8
	.xword	0x80db38e0b06b3533
	.xword	0x8ed7740fe4225353
	.xword	0x9d314a99f4d14857
	.xword	0x989403ef49265612
	.xword	0xdf539925355437fb
	.xword	0x800bbfbe4961d80b
	.xword	0x756f8b1ae145ed8b
	.xword	0xc063d6450cd61c61
	.xword	0x29566ebc377def00
	.xword	0xa1dbadbea5be692b
	.xword	0x2d2c2498f6bb63f9
	.xword	0xed66c1550bbaf0ea
	.xword	0x6b151c7cbb2ca3e6
	.xword	0x24d506380a788168
	.xword	0x1618cd757fd5f94a
	.xword	0x54f7fefa541a791b
	.xword	0x294c00f679580608
	.xword	0x4ba574abaddcdf4f
	.xword	0xe57f2079e33fed71
	.xword	0x0f0180e893f6684b
	.xword	0x1e94fbad971a3e90
	.xword	0x1ac13af6bd62eb59
	.xword	0x1de01a00d98e4937
	.xword	0x1187cc3935421224
	.xword	0x9a4288715729cebe
	.xword	0xd8490b066d7e4d6a
	.xword	0x5e8ea8e0ec669d7e
	.xword	0xb7f4788480335743
	.xword	0xf39716fcc278d6d0
	.xword	0x9312f02f3cf73281
	.xword	0x72017aec897982cc
	.xword	0x40e2fb2fd74d82ec
	.xword	0x3a71b8d020fbe8ef
	.xword	0xf5d116c961b1b9ea
	.xword	0x54d04567a64a27c6
	.xword	0xf6eed51032f2ce03
	.xword	0x2ce54a353ca71e95
	.xword	0xe5da012fc42f98bf
	.xword	0x25198e9e6c15a52f
	.xword	0xd683cb08bf46448c
	.xword	0x3bc930675b768430
	.xword	0x05603b4fe5e1267c
	.xword	0x923d40c44fc6d354
	.xword	0xb2a224cc7f543b8d
	.xword	0x8ca1a1520aba6bdb
	.xword	0xc7f7152e3d77e0d2
	.xword	0xdf3ef025683ff757
	.xword	0x48bde0815cb76f84
	.xword	0x3cbc34a1efdb1b3a
	.xword	0x60ad9c88da41d1b7
	.xword	0x24370abab81d9ec0
	.xword	0xfae6f2860d8d6b05
	.xword	0xc5a658d4c47a6495
	.xword	0xb369e2c91ebd575b
	.xword	0x7b33f8d07284ff46
	.xword	0xf8195898ca6b1b7e
	.xword	0x846722336a799177
	.xword	0x7b7e579b053e363a
	.xword	0x5fb2b89ad1f8595a
	.xword	0x1f415b5c9d9bd302
	.xword	0x511f03f5dcd3ce63
	.xword	0x79d9844c377b15bc
	.xword	0xf7a9089ccfad1b8a
	.xword	0x98162e7746ababa6
	.xword	0x41345bb4e6f4b6f3
	.xword	0xc5a0a0bd62029f58
	.xword	0x35e3160d53d42dc8
	.xword	0xffd6dff349989356
	.xword	0x5af28da29fc45fc9
	.xword	0x91d584d5ceeccdec
	.xword	0xf1307de934d02947
	.xword	0xfb22f898be5d86fb
	.xword	0x2ab4adf1c0a14720
	.xword	0x970f57b269a30695
	.xword	0xa07eac47dee28149
	.xword	0x6f8a9ce3f009ec9d
	.xword	0x10572a3dde2d7cbd
	.xword	0xf8e508a008013331
	.xword	0x802bbc6003ee4e17
	.xword	0x6e50ec42c395c005
	.xword	0x51bfd9f8e6355e32
	.xword	0xf60c2e74dbff5fc3
	.xword	0xb9729eb7650eb34d
	.xword	0xf98de584e8677f9a
	.xword	0xe4139447aaa1bb57
	.xword	0x1aeed7447ebb85f6
	.xword	0x9caba884feeca3f9
	.xword	0x46a6a97faf5ddeaa
	.xword	0x03c0dff74a78b3ee
	.xword	0xce7da63717b5f4be
	.xword	0x027d743b5e7a8230
	.xword	0xf177322aeb19ee2a
	.xword	0x5d6067f4dec7a193
	.xword	0xe94bc4b34819ffc8
	.xword	0x4983401f1aaa21d0
	.xword	0xa728be294b17ef9d
	.xword	0xab0e8284b6c7f89e
	.xword	0xea74746a9f93e062
	.xword	0x13b3d0f1a8150746
	.xword	0x58e7f232ffa4172c
	.xword	0x87f2b3d7d09648b0
	.xword	0xfbe0bf8f9814585b
	.xword	0xa98116570e611b9a
	.xword	0xb48778524dfc4a80
	.xword	0x076cef7d708ae1dc
	.xword	0x98ad66fa11d28fbd
	.xword	0xcde08d8a26de0f9d
	.xword	0x85c2d58e706dc458
	.xword	0x708fbfd4be49c85a
	.xword	0xb301eeaa4a0aa273
	.xword	0xb0952747b74b097b
	.xword	0x05dcc9c8725a8292
	.xword	0x8e567d1ce872280b
	.xword	0x858eafad74787210
	.xword	0x46d5f07c9f70f774
	.xword	0xd7a1b9e4636fea13
	.xword	0x66828f86d235297b
	.xword	0x3943c5b3408e5766
	.xword	0x454cb493a01b2fc4
	.xword	0xda567146b4a5d8e8
	.xword	0x8516dd6abf441aad
	.xword	0x3e1d258fc4b26bfb
	.xword	0xdbdf8674ae37335a
	.xword	0xb28f9be5580564bb
	.xword	0x2caa3aca50d08374
	.xword	0x57167789bd8c9cad
	.xword	0xef39deeec1e16e3f
	.xword	0xeb241a0ff6fafe8d
	.xword	0xb8a0efeefd14ce7e
	.xword	0x24574ce3c3b897ee
	.xword	0xb9f268952b8edcd5
	.xword	0x5f9a82dd67a039d1
	.xword	0x5c51b079f60c8235
	.xword	0x4d904202bca25f36
	.xword	0xd2966ee39c3c7a48
	.xword	0xe29ae987a1fe20d2
	.xword	0xd1fb5e705f288ad2
	.xword	0xd318698a84abae43
	.xword	0x6786739a0ea259e4
	.xword	0x5c7b4a4a6da73169
	.xword	0x36bb971a8ce9b5e4
	.xword	0xbf3b1b20f7349748
	.xword	0x26b4eced0706144c
	.xword	0x5d37e544f727249a
	.xword	0x9a4c62c5fca45d0e
	.xword	0x99bc279a812f02e1
	.xword	0x11f0df2e70aef714
	.xword	0xed857e84bd8e56a3
	.xword	0x0e3750a226341674
	.xword	0xe16248ff01fd4e59
	.xword	0x4ee46bdae6ee2ac7
	.xword	0x8995393e05e822e9
	.xword	0x0600db3acb8177fc
	.xword	0xdcbea45c17bb60c0
	.xword	0xd4874b0bf7e87270
	.xword	0x28aab04ff36411cc
	.xword	0x3ee83796365d5530
	.xword	0x32027893bc6178a3
	.xword	0x95bf51c3e9d9812d
	.xword	0x145a7fd9e1b05902
	.xword	0x7546c8f2f279ed1b
	.xword	0xab83984e1117f4a4
	.xword	0x02c06605248dc08b
	.xword	0xcdea5e277386f283
	.xword	0xa8fdd4fd756ac125
	.xword	0x0f1d65cae9cc9ecb
	.xword	0x7d7094eea86a5f93
	.xword	0x6de29464a5210c85
	.xword	0x019366d04af380fc
	.xword	0xcbcf125bb4b030f9
	.xword	0x8d4031592c372364
	.xword	0x596c63f840e1781e
	.xword	0x1acfeb1e2c246da8
	.xword	0xe51ce1bad384f6ef
	.xword	0xa1fc05cc29af4bf6
	.xword	0x6615c6fb538aba94
	.xword	0xde0dbed27dabf1e5
	.xword	0x158cf2598cd4144c
	.xword	0xbd8e643125b36088
	.xword	0xddedbcd4ae1506a7
	.xword	0x06190ec26b97475b
	.xword	0x6d94cbac66bab1d8
	.xword	0x8cf101a7dd50bcd2
	.xword	0xaca23d46411db51a
	.xword	0x9d0564804f51c1a5
	.xword	0x3611bd8362132163
	.xword	0xa324387ce9d8517d
	.xword	0x74c9a3a249920f63
	.xword	0x7545f37d6cd8a7b5
	.xword	0x6cc4fa98b84c684e
	.xword	0x2226b80d93621d42
	.xword	0x87aaf008d0c37252
	.xword	0xd9a21089f6cd28a8
	.xword	0x4915fcd1ff3ca173
	.xword	0xa629564e0184e310
	.xword	0xa54df41baecdd82e
	.xword	0xd18cd59abe615239
	.xword	0xe313fb164b0ec50a
	.xword	0xc8c382d80efa4472
	.xword	0x1dcb7165ac93797e
	.xword	0xc3a1abd25c11d8eb
	.xword	0x7910ccdf9b1a4c3e
	.xword	0x23b23ea10f17befd
	.xword	0xe9c5b05c740970b1
	.xword	0x5f0b411abff51431
	.xword	0xc1cb4d96d1f63e92
	.xword	0x4e9015da2ea154c3
	.xword	0xff53204116ca490d
	.xword	0xe86b7c8d429449d2
	.xword	0x5b446de92d90fc7b
	.xword	0x1584aaaf540c9505
	.xword	0x52256b308347b553
	.xword	0xd8ff4db9a9994013
	.xword	0xe6d57e1a9c2d77d8
	.xword	0x87444138ab140220
	.xword	0x0e7d46f2eb0e40fb
	.xword	0x5fca27a4471e94f9
	.xword	0x49e3450a94a07532
	.xword	0x82ac301d1adaab46
	.xword	0x323df214260efa90
	.xword	0x1f5635afd853a268
	.xword	0x152ef1d7992fb0d4
	.xword	0x1a868afd2821d920
	.xword	0x41242504d24d242c
	.xword	0x09679e116ee2aa42
	.xword	0xc900be56d6427658
	.xword	0xe5c6160dfa890044
	.xword	0x81cd18ffef1d972e
	.xword	0x458b2f29b0bcf88b
	.xword	0xa95702a19590ea73
	.xword	0xf6d48780084fa087
	.xword	0x0259b9f506f9f9c5
	.xword	0xba6cb6dd68176ff7
	.xword	0x75fcf182c9d0da69
	.xword	0xe981e6f3fbfdd3b6
	.xword	0x01af453c82268afe
	.xword	0x5c1d77d7f17f93b6
	.xword	0xb323ff6479f1893e
	.xword	0x0c7e24125198d53e
	.xword	0x2482c2d23831f9a6
	.xword	0x1f47ecc01572d967
	.xword	0xb416c2d2ba365560
	.xword	0xaa91650301f7af6d
	.xword	0xe7ec6e732f58ace0
	.xword	0xbab0661301aeaec3
	.xword	0x504808d75696a773
	.xword	0x2dc8e4383faf87fe
	.xword	0x41e13939de3a125d
	.xword	0x51ba1dcded64b76b
	.xword	0x38c0e476f57a13c3



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
