// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_1h_c_nc_mix_rand_1.s
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
   random seed:	452675196
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

	setx 0xba9a843d93748d4e, %g1, %g0
	setx 0x8867239e4ef43505, %g1, %g1
	setx 0x4f9631b9eed38c42, %g1, %g2
	setx 0xac934f4d94241c89, %g1, %g3
	setx 0xd7638a8d3770fdff, %g1, %g4
	setx 0x62c7d639830d48c5, %g1, %g5
	setx 0x9c89fd631c37b6aa, %g1, %g6
	setx 0x98cafee96a3c56cd, %g1, %g7
	setx 0xde5831ee65798a6c, %g1, %r16
	setx 0x5f13e4367b437dfe, %g1, %r17
	setx 0x5b3052487124d89b, %g1, %r18
	setx 0x0bd61b9034420230, %g1, %r19
	setx 0x8adc31d966115e20, %g1, %r20
	setx 0xf596547ac421c42f, %g1, %r21
	setx 0xca03814485ee9c4e, %g1, %r22
	setx 0xc5bcb1d6be17d771, %g1, %r23
	setx 0x08f1fa3c424ca1b7, %g1, %r24
	setx 0xd4242520696b511d, %g1, %r25
	setx 0xcbe5eaba83f8c413, %g1, %r26
	setx 0x99127a61ce3f125d, %g1, %r27
	setx 0xa78c34ca850f8ed0, %g1, %r28
	setx 0x8e9e9b9ef95fbe35, %g1, %r29
	setx 0x97eede7af6b35748, %g1, %r30
	setx 0x9d3c1b39f9da0d6a, %g1, %r31
	save
	setx 0x7316f9891a218456, %g1, %r16
	setx 0x1340287850dfbbd3, %g1, %r17
	setx 0x8a03d52375166285, %g1, %r18
	setx 0x1b68c5724dac958d, %g1, %r19
	setx 0x134cf4e60e08d541, %g1, %r20
	setx 0x8ac4de3e554e8682, %g1, %r21
	setx 0x49187db613032f4d, %g1, %r22
	setx 0x0396ec4066e9c3f8, %g1, %r23
	setx 0x52acb7f74385ff86, %g1, %r24
	setx 0x65e78e1eaca8b477, %g1, %r25
	setx 0x55963c10789f9ec2, %g1, %r26
	setx 0x3d4af9944d976fca, %g1, %r27
	setx 0x29b765163916982f, %g1, %r28
	setx 0xbdb16fb093d30999, %g1, %r29
	setx 0x7b233b780689c82f, %g1, %r30
	setx 0xe4e302c781a4f3e9, %g1, %r31
	save
	setx 0x650760ebc5c5e4d1, %g1, %r16
	setx 0x2a618d41f92a9c33, %g1, %r17
	setx 0x7618d47c18466889, %g1, %r18
	setx 0xbd0aff37642f70fc, %g1, %r19
	setx 0x14c30cf4f1fdc3bb, %g1, %r20
	setx 0xee78c0380d660a03, %g1, %r21
	setx 0xfae749ebe372c929, %g1, %r22
	setx 0xdfda9a897e937a42, %g1, %r23
	setx 0xe739b2bfa4607422, %g1, %r24
	setx 0x393312e7186b7a90, %g1, %r25
	setx 0x643d02a02f65c735, %g1, %r26
	setx 0x8bd339feea2ab2b2, %g1, %r27
	setx 0xc10a14ec8254ea60, %g1, %r28
	setx 0x5caf34f5f1d8a5fd, %g1, %r29
	setx 0x1fbff10415fe3985, %g1, %r30
	setx 0xbdebc9a277b74d05, %g1, %r31
	restore
	mov	0, %r8
	setx	0x000000004033c00e, %r1, %r9
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



	setx	0x000000809ed16b74, %r1, %r6
	setx	0x56c2ac6a4169913a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e3d0786, %r1, %r6
	setx	0x627ced5f6f2273a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f86a4ba, %r1, %r6
	setx	0xe3bc56a43e4c5ee0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cea550cf26, %r1, %r6
	setx	0xa40ea52811b72296, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d56dd63166, %r1, %r6
	setx	0x9b0290946a08625f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e6f6280ef4, %r1, %r6
	setx	0x2620374842b32b3b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f87b85930e, %r1, %r6
	setx	0xabda67fa01a6bda2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	.word 0xe4598008  ! 2: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xa4b9a020  ! 3: XNORcc_I	xnorcc 	%r6, 0x0020, %r18
	.word 0xec218008  ! 4: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000080f1d265d6, %r1, %r6
	setx	0x8fef9418809ca434, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7d835a, %r1, %r6
	setx	0x31ca1cc27e6a43cb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f04a7ca, %r1, %r6
	setx	0xd36da7902a7d01c9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c2f1743678, %r1, %r6
	setx	0x28cf6c51000013cb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7fc4451ea, %r1, %r6
	setx	0xb350de872211a814, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0xb350de872211a814, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e21eff7b38, %r1, %r6
	setx	0x134521cd08edafd0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0f3ff535a, %r1, %r6
	setx	0xe6757d403c876303, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cea550cf26, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f86a4ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3d0786, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0xe6757d403c876303, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe409a020  ! 9: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xa4b1a0f8  ! 10: SUBCcc_I	orncc 	%r6, 0x00f8, %r18
	.word 0xe8218008  ! 11: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000080bfea9e74, %r1, %r6
	setx	0x33709633ea4bb153, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ead8356, %r1, %r6
	setx	0xb0d5f960901a3498, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f636156, %r1, %r6
	setx	0x5105f00e26c0a5d0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cfd5411c8c, %r1, %r6
	setx	0xf6cd9c40d8a9836a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xf6cd9c40d8a9836a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d154a770f4, %r1, %r6
	setx	0x24ff8a623a85a810, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x24ff8a623a85a810, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e606e409ae, %r1, %r6
	setx	0x1d1e69dca9abcecc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f290d849ec, %r1, %r6
	setx	0x7270092f1998f029, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f04a7ca, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0x7270092f1998f029, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e7d835a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0x7270092f1998f029, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080f1d265d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xe811a0f8  ! 16: LDUH_I	lduh	[%r6 + 0x00f8], %r20
	.word 0xaab98008  ! 17: XNORcc_R	xnorcc 	%r6, %r8, %r21
	.word 0xe8718008  ! 18: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x0000008023275300, %r1, %r6
	setx	0x4bd02cce60a3fadd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x4bd02cce60a3fadd, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e7c449e, %r1, %r6
	setx	0x487d735e9161dede, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x487d735e9161dede, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fd26b50, %r1, %r6
	setx	0x94357404ccd7db90, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c868660956, %r1, %r6
	setx	0xdf5d8d61ff62e599, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d36e331a64, %r1, %r6
	setx	0x3df08fa19644b5fb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e530fc0066, %r1, %r6
	setx	0x50f98e7f07771957, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x50f98e7f07771957, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fef173e880, %r1, %r6
	setx	0x19ded05eb0cf0598, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x19ded05eb0cf0598, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000cea550cf26, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f86a4ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x19ded05eb0cf0598, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe0198008  ! 23: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xa6b1a078  ! 24: ORNcc_I	orncc 	%r6, 0x0078, %r19
	.word 0xe071a078  ! 25: STX_I	stx	%r16, [%r6 + 0x0078]
	setx	0x00000080df43ab20, %r1, %r6
	setx	0x40f477ca90fac51c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efe262c, %r1, %r6
	setx	0xba5f25b07678bdfb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xba5f25b07678bdfb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fb99e70, %r1, %r6
	setx	0x9e159f895fec8bfa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7346013d6, %r1, %r6
	setx	0xee1bd7f6b424f07a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000df0d850bba, %r1, %r6
	setx	0xd8e0ea5030f9c973, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eafb083eea, %r1, %r6
	setx	0x7ad06b93d8c37614, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f44d1df24e, %r1, %r6
	setx	0xbb596f4345cd1007, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000008023275300, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0xbb596f4345cd1007, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe0498008  ! 30: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa0a18008  ! 31: SUBcc_R	subcc 	%r6, %r8, %r16
	.word 0xe839a078  ! 32: STD_I	std	%r20, [%r6 + 0x0078]
	setx	0x000000803d45fa3a, %r1, %r6
	setx	0x770ce7fcf48c2324, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec12ca0, %r1, %r6
	setx	0x1e88fd2d2c47f856, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f50fb6e, %r1, %r6
	setx	0xef4d000bc0602074, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xef4d000bc0602074, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c8c129003c, %r1, %r6
	setx	0xa4dd37cc44c48214, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d7cc3be44c, %r1, %r6
	setx	0xd8b13c88e1024bd8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eff5de9c94, %r1, %r6
	setx	0x2b37afbeb426b508, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f45d0c5e6e, %r1, %r6
	setx	0xb2d1b3c9ac6061ae, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	.word 0xe4598008  ! 37: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xaa29a058  ! 38: ANDN_I	andn 	%r6, 0x0058, %r21
	.word 0xe431a058  ! 39: STH_I	sth	%r18, [%r6 + 0x0058]
	setx	0x000000808356a9c2, %r1, %r6
	setx	0xb436166d2501680f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xb436166d2501680f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e6aad9e, %r1, %r6
	setx	0x658d5c9cca00bf82, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x658d5c9cca00bf82, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f9d6c12, %r1, %r6
	setx	0x193ed43f38412187, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ce36c73adc, %r1, %r6
	setx	0xcda2c3c9343abc9d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc44f017de, %r1, %r6
	setx	0xba0bd3fa86db2b35, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e9640baa36, %r1, %r6
	setx	0x7344ec797f1d05f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x7344ec797f1d05f2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f43ed178c6, %r1, %r6
	setx	0x746ff39da258b82c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x746ff39da258b82c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e6f6280ef4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d56dd63166, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe809a058  ! 44: LDUB_I	ldub	[%r6 + 0x0058], %r20
	.word 0xa821a010  ! 45: SUB_I	sub 	%r6, 0x0010, %r20
	.word 0xe421a010  ! 46: STW_I	stw	%r18, [%r6 + 0x0010]
	setx	0x00000080ce08a158, %r1, %r6
	setx	0x8bb046145f0bbce4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e46df6a, %r1, %r6
	setx	0xf23f3fcf1bcaa7b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f745b0e, %r1, %r6
	setx	0xcc564728df8be85e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c54648152e, %r1, %r6
	setx	0x456a1fc261b49908, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8ab58100c, %r1, %r6
	setx	0x7d880c64d50c33bc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e62e799900, %r1, %r6
	setx	0xc9f15acb43a8e651, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xc9f15acb43a8e651, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fa74546224, %r1, %r6
	setx	0x918799e1bd1ec375, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x918799e1bd1ec375, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d36e331a64, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	.word 0xec118008  ! 51: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xae398008  ! 52: XNOR_R	xnor 	%r6, %r8, %r23
	.word 0xe4398008  ! 53: STD_R	std	%r18, [%r6 + %r8]
	setx	0x000000809f177bb8, %r1, %r6
	setx	0x333b32b091c0bf48, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e357548, %r1, %r6
	setx	0xb64fa8fba2a621af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fde5aea, %r1, %r6
	setx	0xef5dba27e4d1b844, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c0f60b9b82, %r1, %r6
	setx	0x8615a8f6bfb749c0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d09fcd19cc, %r1, %r6
	setx	0x7bd4b50683cac94b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e10ea1df16, %r1, %r6
	setx	0xeff883194cadffb9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8e5aac8d0, %r1, %r6
	setx	0x05ed5b9593f8d9e6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eafb083eea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df0d850bba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7346013d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0x05ed5b9593f8d9e6, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xec09a010  ! 58: LDUB_I	ldub	[%r6 + 0x0010], %r22
	.word 0xae318008  ! 59: ORN_R	orn 	%r6, %r8, %r23
	.word 0xe831a010  ! 60: STH_I	sth	%r20, [%r6 + 0x0010]
	setx	0x00000080c60fa3ae, %r1, %r6
	setx	0xf6f760a8468f7a05, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e66f474, %r1, %r6
	setx	0x85d188b59af1abfa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x85d188b59af1abfa, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fd540b6, %r1, %r6
	setx	0xf23cf0da3f0dba22, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c346cb39c8, %r1, %r6
	setx	0x2f03b061865aa7a1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d5bf7d7600, %r1, %r6
	setx	0x35c8c747bedce5c2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e7beffb38a, %r1, %r6
	setx	0x4ac6006ed1c5c9a9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f2cb3c0d04, %r1, %r6
	setx	0x90bb025a09444416, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9d6c12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6aad9e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000808356a9c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f45d0c5e6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eff5de9c94, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7cc3be44c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8c129003c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	.word 0xe049a010  ! 65: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	.word 0xa401a098  ! 66: ADD_I	add 	%r6, 0x0098, %r18
	.word 0xe021a098  ! 67: STW_I	stw	%r16, [%r6 + 0x0098]
	setx	0x0000008037a505b4, %r1, %r6
	setx	0x59b44328ff137940, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800eef90cc, %r1, %r6
	setx	0xb98b684bd94a6ed8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f05f412, %r1, %r6
	setx	0xe0cfa431135179c2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c28684727a, %r1, %r6
	setx	0x70c242fcd5af84d8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d53ed322d4, %r1, %r6
	setx	0x0f59d320e07fd3f1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x0f59d320e07fd3f1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ea56a8df14, %r1, %r6
	setx	0x4515a0ec38e95dbd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc993402e8, %r1, %r6
	setx	0x690d630ff18f91dd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c8c129003c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f50fb6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec12ca0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000803d45fa3a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f44d1df24e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	.word 0xe0498008  ! 72: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xaa398008  ! 73: XNOR_R	xnor 	%r6, %r8, %r21
	.word 0xe031a098  ! 74: STH_I	sth	%r16, [%r6 + 0x0098]
	setx	0x00000080a66c6846, %r1, %r6
	setx	0x5f548427a81a8677, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x5f548427a81a8677, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ee1ff10, %r1, %r6
	setx	0x4410ee5742fbee2d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x4410ee5742fbee2d, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f03cdac, %r1, %r6
	setx	0x04581e4d25355685, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c7aa6b7da8, %r1, %r6
	setx	0xa2801def0ba99c12, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d4a95fb95e, %r1, %r6
	setx	0xb416d8471b1f5e9a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e2aeb0e852, %r1, %r6
	setx	0x1cb5d804e7e51e65, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc3c141018, %r1, %r6
	setx	0x6ab2cd7c0e0a3ce4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e66f474, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080c60fa3ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8e5aac8d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0x6ab2cd7c0e0a3ce4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e10ea1df16, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d09fcd19cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0x6ab2cd7c0e0a3ce4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001030100000, %r1, %r6
	.word 0xec59a098  ! 79: LDX_I	ldx	[%r6 + 0x0098], %r22
	.word 0xa0018008  ! 80: ADD_R	add 	%r6, %r8, %r16
	.word 0xec39a098  ! 81: STD_I	std	%r22, [%r6 + 0x0098]
	setx	0x00000080c19ee7c2, %r1, %r6
	setx	0x1c0935284df20edb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0x1c0935284df20edb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e71c050, %r1, %r6
	setx	0x6c8a36225ae8c0b6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f09bc46, %r1, %r6
	setx	0x77aa5c8d678ebbaf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc29dec0d6, %r1, %r6
	setx	0xe0dc703e1a4862d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000da7b29c9ec, %r1, %r6
	setx	0xf5aa1c8da87adbf4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xf5aa1c8da87adbf4, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ecd0847c8a, %r1, %r6
	setx	0x73c23a4ce64aa86b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fec7ef1c94, %r1, %r6
	setx	0x3844c10712438c69, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080f1d265d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe409a098  ! 86: LDUB_I	ldub	[%r6 + 0x0098], %r18
	.word 0xa0218008  ! 87: SUB_R	sub 	%r6, %r8, %r16
	.word 0xe8398008  ! 88: STD_R	std	%r20, [%r6 + %r8]
	setx	0x00000080c4754c2a, %r1, %r6
	setx	0x356e3f9dde30c8cb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e465b48, %r1, %r6
	setx	0xb7f90306f066df8b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f9a7d2c, %r1, %r6
	setx	0xfa610d73829118ad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c20881efc0, %r1, %r6
	setx	0xf02e335fabb838ce, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de0d16b212, %r1, %r6
	setx	0xc1e0e8a6a44d135d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0xc1e0e8a6a44d135d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ec53f41fd4, %r1, %r6
	setx	0x5b5a7f4026c23ed1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f47a9261e6, %r1, %r6
	setx	0x7c09300d1ec3cf5f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x7c09300d1ec3cf5f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	.word 0xe0498008  ! 93: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa609a0d0  ! 94: AND_I	and 	%r6, 0x00d0, %r19
	.word 0xec71a0d0  ! 95: STX_I	stx	%r22, [%r6 + 0x00d0]
	setx	0x00000080586bfee2, %r1, %r6
	setx	0x1eaf987528868752, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e9f59d6, %r1, %r6
	setx	0xbb72de5447521917, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800faf2c28, %r1, %r6
	setx	0x589391794f923111, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5eca4b2da, %r1, %r6
	setx	0xa3784be9d23b0415, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xa3784be9d23b0415, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d92524621e, %r1, %r6
	setx	0x3ac9c3634de15df2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x3ac9c3634de15df2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ef480ab492, %r1, %r6
	setx	0x99bdd77e45392aba, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fcd7d50ee6, %r1, %r6
	setx	0xee92c346a68d31a4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d5bf7d7600, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c346cb39c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd540b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0xee92c346a68d31a4, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e66f474, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe809a0d0  ! 100: LDUB_I	ldub	[%r6 + 0x00d0], %r20
	.word 0xa031a070  ! 101: ORN_I	orn 	%r6, 0x0070, %r16
	.word 0xe039a070  ! 102: STD_I	std	%r16, [%r6 + 0x0070]
	setx	0x00000080c579e3ec, %r1, %r6
	setx	0x4e69f909fec5087f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x4e69f909fec5087f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e429542, %r1, %r6
	setx	0xabf39b610b1d8984, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xabf39b610b1d8984, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f2fd1d2, %r1, %r6
	setx	0x099923e57ab71ffc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x099923e57ab71ffc, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000ce0e3d7224, %r1, %r6
	setx	0x8d68630b8e9add96, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x8d68630b8e9add96, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dd88854356, %r1, %r6
	setx	0x92bda3295d565fc2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e454dc1c68, %r1, %r6
	setx	0x327e5c9e76d1e8d5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x327e5c9e76d1e8d5, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f84f692638, %r1, %r6
	setx	0x8b87754d95b6f03c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0x8b87754d95b6f03c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f09bc46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e71c050, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080c19ee7c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc3c141018, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0x8b87754d95b6f03c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e2aeb0e852, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x8b87754d95b6f03c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d4a95fb95e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7aa6b7da8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe0598008  ! 107: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa019a0d0  ! 108: XOR_I	xor 	%r6, 0x00d0, %r16
	.word 0xec71a0d0  ! 109: STX_I	stx	%r22, [%r6 + 0x00d0]
	setx	0x000000805b9d5102, %r1, %r6
	setx	0x91ab7970fe9c8846, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x91ab7970fe9c8846, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800ef1b6ca, %r1, %r6
	setx	0x02fc4b3a3fef40fe, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2234aa, %r1, %r6
	setx	0x7ac849896b7241ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c78f8d3ff6, %r1, %r6
	setx	0xee27728e6cacad75, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d0cb20cd66, %r1, %r6
	setx	0x03a3c287ba61b0ba, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x03a3c287ba61b0ba, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9b3da54a6, %r1, %r6
	setx	0x5eeba99482a22a47, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0ed836a08, %r1, %r6
	setx	0x64fdf33b7138bb42, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x64fdf33b7138bb42, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000080ce08a158, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x64fdf33b7138bb42, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f43ed178c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001060100000, %r1, %r6
	setx	0x64fdf33b7138bb42, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9640baa36, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc44f017de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce36c73adc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9d6c12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe0118008  ! 114: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa4a1a010  ! 115: SUBcc_I	subcc 	%r6, 0x0010, %r18
	.word 0xec21a010  ! 116: STW_I	stw	%r22, [%r6 + 0x0010]
	setx	0x000000802f1a2892, %r1, %r6
	setx	0x3e9600cc5df55857, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e9a8a5c, %r1, %r6
	setx	0xbfe4bc92b7716b0d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ffc268c, %r1, %r6
	setx	0x89f79cb1e300a4d8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cefa928414, %r1, %r6
	setx	0x700256acebbb4f88, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d3ae0f8b2e, %r1, %r6
	setx	0x19dbed7a3dc4dcda, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ecda4fe150, %r1, %r6
	setx	0xf59166ecb9f4a8f7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f80e1c0ee6, %r1, %r6
	setx	0x8f2549c2910a3221, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e357548, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000809f177bb8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa74546224, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x8f2549c2910a3221, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e62e799900, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8ab58100c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c54648152e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0x8f2549c2910a3221, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f745b0e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xe009a010  ! 121: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xac91a058  ! 122: ORcc_I	orcc 	%r6, 0x0058, %r22
	.word 0xe0298008  ! 123: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x0000008095fbda0c, %r1, %r6
	setx	0x2280c8ed6bac24ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0581e4, %r1, %r6
	setx	0x25cfadd5f185a0eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fc942ec, %r1, %r6
	setx	0x775675e81f73e7e0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c83d37af68, %r1, %r6
	setx	0xaadafa4d1ac32e84, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xaadafa4d1ac32e84, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000daf2791da8, %r1, %r6
	setx	0x8e5ba00bee6f15cc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x8e5ba00bee6f15cc, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e43d39848e, %r1, %r6
	setx	0xd3e5ec74f303437b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f052296640, %r1, %r6
	setx	0x05db8a2503fcd3bc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e606e409ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe849a058  ! 128: LDSB_I	ldsb	[%r6 + 0x0058], %r20
	.word 0xaab98008  ! 129: XNORcc_R	xnorcc 	%r6, %r8, %r21
	.word 0xec318008  ! 130: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x000000804806b286, %r1, %r6
	setx	0xbdd2df0904fae8fa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e0338c0, %r1, %r6
	setx	0x6994c6e9a5eef90e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fd40c7e, %r1, %r6
	setx	0x5fd51b356de44cf5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cee655d2a2, %r1, %r6
	setx	0x7a75f16ec261edd4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d9ca0e64d2, %r1, %r6
	setx	0x16f8e5657d073d82, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e865093ec6, %r1, %r6
	setx	0xf6ce1c7b3f51b2bd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f0d7d786e4, %r1, %r6
	setx	0x23d77b255b23f280, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	.word 0xec018008  ! 135: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xa231a038  ! 136: SUBC_I	orn 	%r6, 0x0038, %r17
	.word 0xec398008  ! 137: STD_R	std	%r22, [%r6 + %r8]
	setx	0x0000008054acaa7e, %r1, %r6
	setx	0x7a7b40d481048811, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001040100000, %r1, %r6
	setx	0x7a7b40d481048811, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e463a48, %r1, %r6
	setx	0xccc8756beabcf124, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f915fa8, %r1, %r6
	setx	0xf84ec16fea0478dc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c146932f7e, %r1, %r6
	setx	0x29e06b12ae583fb0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0x29e06b12ae583fb0, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dfc078fae6, %r1, %r6
	setx	0x2587ef8be8a17464, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x2587ef8be8a17464, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e4dc4fcc3c, %r1, %r6
	setx	0x1064a7a0056a8b08, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc02340112, %r1, %r6
	setx	0x879960c0f5a38506, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cee655d2a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe049a038  ! 142: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	.word 0xa009a0a0  ! 143: AND_I	and 	%r6, 0x00a0, %r16
	.word 0xe0218008  ! 144: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000080fa733d6c, %r1, %r6
	setx	0x606b99ab8bebb797, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x606b99ab8bebb797, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e30e136, %r1, %r6
	setx	0xdc03964c21b6a496, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2d759a, %r1, %r6
	setx	0x2f3a78fd23b4d6ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cbb24d87bc, %r1, %r6
	setx	0x58619e56234d77b8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de621457e0, %r1, %r6
	setx	0x76b08d434b9215f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ea93b1d92e, %r1, %r6
	setx	0xd3217f678e9141af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xd3217f678e9141af, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fe65afad28, %r1, %r6
	setx	0x54dd08ac468454be, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e865093ec6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9ca0e64d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe0598008  ! 149: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xa0198008  ! 150: XOR_R	xor 	%r6, %r8, %r16
	.word 0xec71a0a0  ! 151: STX_I	stx	%r22, [%r6 + 0x00a0]
	setx	0x000000806cf52b52, %r1, %r6
	setx	0xcc93a650489d6a04, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e8fd182, %r1, %r6
	setx	0xb0cbd331e38f3cda, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ffca23c, %r1, %r6
	setx	0xc3dc9a9990e6693e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ca02aafdbc, %r1, %r6
	setx	0x048e913fdbe7e29e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8da8a7316, %r1, %r6
	setx	0x3d253a90c3315662, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e38a41e4de, %r1, %r6
	setx	0xce48cace1de59697, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc55ead666, %r1, %r6
	setx	0x60232fc8522310c7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f2fd1d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e429542, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080c579e3ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcd7d50ee6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x60232fc8522310c7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000ef480ab492, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d92524621e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xec11a0a0  ! 156: LDUH_I	lduh	[%r6 + 0x00a0], %r22
	.word 0xa031a0b8  ! 157: SUBC_I	orn 	%r6, 0x00b8, %r16
	.word 0xe8318008  ! 158: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x000000802ab2cf04, %r1, %r6
	setx	0x86ac15ff28561923, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e6421b2, %r1, %r6
	setx	0x7daa2fc817f4def4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fa99792, %r1, %r6
	setx	0x1c75a3e57cc81652, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c07472862e, %r1, %r6
	setx	0x996d03dba32d4549, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000da4eb4e2d6, %r1, %r6
	setx	0xeff71f38f472e42f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000efa038be4e, %r1, %r6
	setx	0xb3dffbe40fb6bbbf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xb3dffbe40fb6bbbf, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000fc88e8c3a2, %r1, %r6
	setx	0x88e30487afc60a8f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x88e30487afc60a8f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001020100000, %r1, %r6
	.word 0xe0118008  ! 163: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xa2318008  ! 164: SUBC_R	orn 	%r6, %r8, %r17
	.word 0xe8218008  ! 165: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000080b98055d8, %r1, %r6
	setx	0xc593f98bf863196a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e14d54e, %r1, %r6
	setx	0xa82c2e0ae4c0ff43, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f258654, %r1, %r6
	setx	0x2d81213ee1c3c005, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c5231b3c98, %r1, %r6
	setx	0xc51cfd84e80790d7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d5fb29c172, %r1, %r6
	setx	0x37df0e05dab88a0e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x37df0e05dab88a0e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e4c92dc026, %r1, %r6
	setx	0x8cafe1bb47d092ea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fce98d882e, %r1, %r6
	setx	0x6b9025377a4106aa, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f052296640, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e43d39848e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daf2791da8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c83d37af68, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc942ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0581e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008095fbda0c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe4418008  ! 170: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xa8a1a010  ! 171: SUBcc_I	subcc 	%r6, 0x0010, %r20
	.word 0xe831a010  ! 172: STH_I	sth	%r20, [%r6 + 0x0010]
	setx	0x00000080823a9dac, %r1, %r6
	setx	0x79ff025c862887b9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ec35252, %r1, %r6
	setx	0xd1dd1165637eeaad, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f22a1fa, %r1, %r6
	setx	0x14b494cc2c36a584, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c213ebef90, %r1, %r6
	setx	0xb75d2e7f9c968300, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d115812cfe, %r1, %r6
	setx	0x4eb04d2719e8f4f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eb60e5d4a4, %r1, %r6
	setx	0xcbbcb04ddb9619cf, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f620fd979a, %r1, %r6
	setx	0x1192a585b7a8ed4e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d53ed322d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c28684727a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f05f412, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eef90cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0x1192a585b7a8ed4e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x0000008037a505b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2cb3c0d04, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe0018008  ! 177: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa201a040  ! 178: ADD_I	add 	%r6, 0x0040, %r17
	.word 0xe8218008  ! 179: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x000000802778bbc2, %r1, %r6
	setx	0x542d95190f2e82b4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ef485a2, %r1, %r6
	setx	0xb1b9b93cbe9f389d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xb1b9b93cbe9f389d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fe36914, %r1, %r6
	setx	0x7b8c4da3dccbdc6d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0x7b8c4da3dccbdc6d, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000caa8e81b3a, %r1, %r6
	setx	0xb8e5117eec6bb94a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dbcc4cd51e, %r1, %r6
	setx	0x4606cc13b7941879, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e7c76bcb18, %r1, %r6
	setx	0xab7e824276e30b6b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0xab7e824276e30b6b, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f28c89abde, %r1, %r6
	setx	0x264c526ed9632dd0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x264c526ed9632dd0, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800fa99792, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6421b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000802ab2cf04, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001030100000, %r1, %r6
	.word 0xe8118008  ! 184: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xa0b98008  ! 185: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xe0398008  ! 186: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000080328794fa, %r1, %r6
	setx	0xc2f642a212842027, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xc2f642a212842027, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e513c1a, %r1, %r6
	setx	0x45163bb607214294, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb32dba, %r1, %r6
	setx	0xe0a8bbb1c351c20a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010f0100000, %r1, %r6
	setx	0xe0a8bbb1c351c20a, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c4ecc27678, %r1, %r6
	setx	0x8683e2a76fff2917, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc7866b620, %r1, %r6
	setx	0x22a853f1b4dade3b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e18983d9c2, %r1, %r6
	setx	0xe36c3d4672ce5889, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f8b030575c, %r1, %r6
	setx	0xed6271f2ab16c10e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dfc078fae6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c146932f7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010f0100000, %r1, %r6
	setx	0xed6271f2ab16c10e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f915fa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001040100000, %r1, %r6
	setx	0xed6271f2ab16c10e, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e463a48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008054acaa7e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0d7d786e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e865093ec6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe0498008  ! 191: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa6c1a000  ! 192: ADDCcc_I	addccc 	%r6, 0x0000, %r19
	.word 0xec398008  ! 193: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000080e792ef6c, %r1, %r6
	setx	0xb9ccc65ddfffc795, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e2c6ad0, %r1, %r6
	setx	0xe0869e39e4caec3f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fcbd7e4, %r1, %r6
	setx	0x04856ca82f1b5ffd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c4bd25bce2, %r1, %r6
	setx	0x407bbeab60158b9f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x407bbeab60158b9f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d5af097cce, %r1, %r6
	setx	0xbfedd6c609c436ec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xbfedd6c609c436ec, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000efc1d72788, %r1, %r6
	setx	0x311e10bafccfaa9f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f460e3bc1e, %r1, %r6
	setx	0xaead7d279a2f552f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xaead7d279a2f552f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fc88e8c3a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000efa038be4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da4eb4e2d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xaead7d279a2f552f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c07472862e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa99792, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010b0100000, %r1, %r6
	setx	0xaead7d279a2f552f, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e6421b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010c0100000, %r1, %r6
	setx	0xaead7d279a2f552f, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001070100000, %r1, %r6
	.word 0xe011a000  ! 198: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xa0198008  ! 199: XOR_R	xor 	%r6, %r8, %r16
	.word 0xec318008  ! 200: STH_R	sth	%r22, [%r6 + %r8]
	setx	0x000000808ac58194, %r1, %r6
	setx	0x97581ddfdf23f556, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e1ea518, %r1, %r6
	setx	0x6e2df0b3cae90ecc, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x6e2df0b3cae90ecc, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800f0cb088, %r1, %r6
	setx	0x678a815637d95aa5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ccad55034c, %r1, %r6
	setx	0x871fdecfff1386a6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d2f38cc22c, %r1, %r6
	setx	0xada71a47a74219f0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0xada71a47a74219f0, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e24d54084a, %r1, %r6
	setx	0x23e8943e51bb9038, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f833f3e8e6, %r1, %r6
	setx	0x986c519e849e0c55, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x986c519e849e0c55, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d4a95fb95e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0x986c519e849e0c55, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c7aa6b7da8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f03cdac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee1ff10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000080a66c6846, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc993402e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea56a8df14, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	.word 0xe051a000  ! 205: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	.word 0xa699a0e8  ! 206: XORcc_I	xorcc 	%r6, 0x00e8, %r19
	.word 0xe0298008  ! 207: STB_R	stb	%r16, [%r6 + %r8]
	setx	0x000000809ae82210, %r1, %r6
	setx	0x0de929831d91c7b7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x0de929831d91c7b7, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e84f89e, %r1, %r6
	setx	0xec6db3e85ae9648b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb45374, %r1, %r6
	setx	0xdf9529a16eeb6cd7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c4d20953bc, %r1, %r6
	setx	0x7e9434243be3c7e0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d1c4073b84, %r1, %r6
	setx	0xd67b6e523af22b30, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e82ff98cb6, %r1, %r6
	setx	0xb4ae2d1f7dc2b839, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc9e1ceaae, %r1, %r6
	setx	0x6eea0509028617a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cea550cf26, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f86a4ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3d0786, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe0018008  ! 212: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xa8318008  ! 213: SUBC_R	orn 	%r6, %r8, %r20
	.word 0xec39a0e8  ! 214: STD_I	std	%r22, [%r6 + 0x00e8]
	setx	0x0000008029a85994, %r1, %r6
	setx	0x7d10c84645d3bf4f, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e4be34a, %r1, %r6
	setx	0x08c90f10caadf7eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0x08c90f10caadf7eb, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f052478, %r1, %r6
	setx	0x4fe2431d8c1d4df4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c3eca36986, %r1, %r6
	setx	0x5c4357a1e10d77a5, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x5c4357a1e10d77a5, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dfa8540efe, %r1, %r6
	setx	0x6521fdd4d4699bd0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ec2f5938ce, %r1, %r6
	setx	0x082b358d94448919, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0x082b358d94448919, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000feba979e82, %r1, %r6
	setx	0xa8ac41db9a1314d9, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fc88e8c3a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001020100000, %r1, %r6
	setx	0xa8ac41db9a1314d9, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000efa038be4e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da4eb4e2d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	.word 0xe809a0e8  ! 219: LDUB_I	ldub	[%r6 + 0x00e8], %r20
	.word 0xa4b98008  ! 220: XNORcc_R	xnorcc 	%r6, %r8, %r18
	.word 0xe4298008  ! 221: STB_R	stb	%r18, [%r6 + %r8]
	setx	0x0000008018bbd330, %r1, %r6
	setx	0xb69b5b1ddd2085d4, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e22057e, %r1, %r6
	setx	0x2bf6e09fcd4508f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f984716, %r1, %r6
	setx	0x2138d264e96b9571, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c091cf5928, %r1, %r6
	setx	0x8b5f1fe5afe755f6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001080100000, %r1, %r6
	setx	0x8b5f1fe5afe755f6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000dd19179d3c, %r1, %r6
	setx	0x1bc93ddcb30275eb, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e249eb9a34, %r1, %r6
	setx	0x447e398898440a91, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f48735cd1a, %r1, %r6
	setx	0x90406a47c8caf541, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001060100000, %r1, %r6
	setx	0x90406a47c8caf541, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e9b3da54a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0cb20cd66, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c78f8d3ff6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010e0100000, %r1, %r6
	setx	0x90406a47c8caf541, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f2234aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	.word 0xe0098008  ! 226: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xa429a040  ! 227: ANDN_I	andn 	%r6, 0x0040, %r18
	.word 0xe431a040  ! 228: STH_I	sth	%r18, [%r6 + 0x0040]
	setx	0x000000806c1309cc, %r1, %r6
	setx	0x18f73d33359d2e50, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e546e0c, %r1, %r6
	setx	0x8608cc0266b6d96c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f599902, %r1, %r6
	setx	0xb850c3691171d523, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010d0100000, %r1, %r6
	setx	0xb850c3691171d523, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c4593af018, %r1, %r6
	setx	0xbecd982ba08119af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001030100000, %r1, %r6
	setx	0xbecd982ba08119af, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000d988bf972e, %r1, %r6
	setx	0x6211bfa84b09b7e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e657f5f970, %r1, %r6
	setx	0xd50bcd09191f4d90, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f459343884, %r1, %r6
	setx	0xc7740a4f0eaea7f1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010c0100000, %r1, %r6
	setx	0xc7740a4f0eaea7f1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000e24d54084a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	setx	0xc7740a4f0eaea7f1, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d2f38cc22c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x00000010d0100000, %r1, %r6
	setx	0xc7740a4f0eaea7f1, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	.word 0xe8498008  ! 233: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xa431a040  ! 234: SUBC_I	orn 	%r6, 0x0040, %r18
	.word 0xe8298008  ! 235: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000080f4ed2552, %r1, %r6
	setx	0xd89810902de3b215, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010e0100000, %r1, %r6
	setx	0xd89810902de3b215, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800e65b740, %r1, %r6
	setx	0x73dad40fdfdef4c3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x73dad40fdfdef4c3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f16180c, %r1, %r6
	setx	0x77fcac9d46774c07, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000caad591bb8, %r1, %r6
	setx	0xa58cd002ef527501, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d74fc4ddaa, %r1, %r6
	setx	0x3d304bbdcfebef41, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000ef89c09d8c, %r1, %r6
	setx	0xec6b357efdd1fb17, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f879e867ae, %r1, %r6
	setx	0x134832b003f117ff, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d09fcd19cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001080100000, %r1, %r6
	setx	0x134832b003f117ff, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000c0f60b9b82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001010100000, %r1, %r6
	setx	0x134832b003f117ff, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fde5aea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	.word 0xe4098008  ! 240: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa4018008  ! 241: ADD_R	add 	%r6, %r8, %r18
	.word 0xe039a040  ! 242: STD_I	std	%r16, [%r6 + 0x0040]
	setx	0x0000008067b6937c, %r1, %r6
	setx	0x5cf730e4bf5750f8, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001070100000, %r1, %r6
	setx	0x5cf730e4bf5750f8, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800e805940, %r1, %r6
	setx	0x6e9e6236b7100f3b, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fe7c5d2, %r1, %r6
	setx	0x623e882069786b31, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c0cf26ef78, %r1, %r6
	setx	0x63320d1bd5cc229e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de0a7da442, %r1, %r6
	setx	0x6bba93f4984a06d6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001020100000, %r1, %r6
	setx	0x6bba93f4984a06d6, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e66046e95e, %r1, %r6
	setx	0xaf04ec7c7361e239, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa5284e096, %r1, %r6
	setx	0x209aa99809513c1a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	.word 0xec19a040  ! 247: LDD_I	ldd	[%r6 + 0x0040], %r22
	.word 0xa8c18008  ! 248: ADDCcc_R	addccc 	%r6, %r8, %r20
	.word 0xe4318008  ! 249: STH_R	sth	%r18, [%r6 + %r8]
	setx	0x000000804150617a, %r1, %r6
	setx	0xfe17df17f3082fc0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ee6cbbc, %r1, %r6
	setx	0xfc4f0181a13d1bac, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f04a9e0, %r1, %r6
	setx	0x297e8eb755356276, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cafde2b60c, %r1, %r6
	setx	0x18dd9cff28e49f4a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d8b2a93d4e, %r1, %r6
	setx	0xf95a5f52e754eaf3, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xf95a5f52e754eaf3, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000e4ea608cd0, %r1, %r6
	setx	0xd74270839cef879d, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f260276e4e, %r1, %r6
	setx	0xadd01470230535f2, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000080c579e3ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcd7d50ee6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef480ab492, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d92524621e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001070100000, %r1, %r6
	setx	0xadd01470230535f2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c5eca4b2da, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	setx	0xadd01470230535f2, %r1, %r10
	stx	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	.word 0xe4098008  ! 254: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xa6398008  ! 255: XNOR_R	xnor 	%r6, %r8, %r19
	.word 0xec398008  ! 256: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000080d261e640, %r1, %r6
	setx	0x884e4c0f644bf608, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x884e4c0f644bf608, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000800ef045d2, %r1, %r6
	setx	0x13e8190e868ba990, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800fb013e8, %r1, %r6
	setx	0x3517cbd3305ac092, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cc76d56fcc, %r1, %r6
	setx	0xc68997293720d842, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d66f87e61a, %r1, %r6
	setx	0x69b295488cfffb09, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e0be032908, %r1, %r6
	setx	0xf6bd562b8877914c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0xf6bd562b8877914c, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f893b158dc, %r1, %r6
	setx	0xaff5d21e03e12dcd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e7c449e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000008023275300, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	setx	0xaff5d21e03e12dcd, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000f290d849ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e606e409ae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d154a770f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001050100000, %r1, %r6
	.word 0xe0498008  ! 261: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xa0098008  ! 262: AND_R	and 	%r6, %r8, %r16
	.word 0xe031a040  ! 263: STH_I	sth	%r16, [%r6 + 0x0040]
	setx	0x00000080c4c19d82, %r1, %r6
	setx	0x33739b1317c4643a, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ecaac52, %r1, %r6
	setx	0x09d33f8ae4a4e747, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001050100000, %r1, %r6
	setx	0x09d33f8ae4a4e747, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800f6ce2a6, %r1, %r6
	setx	0xcc8f918f52209a74, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c249709e14, %r1, %r6
	setx	0x10e52eb5a6d4b549, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc2162e13c, %r1, %r6
	setx	0x84075d905ef9c616, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001010100000, %r1, %r6
	setx	0x84075d905ef9c616, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000edefffbd9c, %r1, %r6
	setx	0x154d3d796f82ee8e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x154d3d796f82ee8e, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000fa924a20ce, %r1, %r6
	setx	0x0c6e485a845421ec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	.word 0xec418008  ! 268: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xaea9a008  ! 269: ANDNcc_I	andncc 	%r6, 0x0008, %r23
	.word 0xec31a008  ! 270: STH_I	sth	%r22, [%r6 + 0x0008]
	setx	0x0000008035dbf564, %r1, %r6
	setx	0xab77879921551f36, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e2d308a, %r1, %r6
	setx	0x531ed39b785da4af, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f7129c2, %r1, %r6
	setx	0x3a75cecbe1e004ec, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000cd2c922598, %r1, %r6
	setx	0x923cec15a764828c, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x923cec15a764828c, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000d6f1ef88b0, %r1, %r6
	setx	0xabcef90aa6ede75e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5cb96a9cc, %r1, %r6
	setx	0x9c06d26d36ef4187, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000fa331b7c12, %r1, %r6
	setx	0x2d09b93f70456dc6, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dc44f017de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001000100000, %r1, %r6
	.word 0xec01a008  ! 275: LDUW_I	lduw	[%r6 + 0x0008], %r22
	.word 0xa4198008  ! 276: XOR_R	xor 	%r6, %r8, %r18
	.word 0xe821a008  ! 277: STW_I	stw	%r20, [%r6 + 0x0008]
	setx	0x0000008097555c68, %r1, %r6
	setx	0x64af12501848c9d0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800efc2488, %r1, %r6
	setx	0x211672a332d842fd, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f867270, %r1, %r6
	setx	0xb0cc3468959a9612, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000c699805734, %r1, %r6
	setx	0x613fdf11313abfea, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000de212cd172, %r1, %r6
	setx	0xfdaf5962ea664c87, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e570ab452a, %r1, %r6
	setx	0x0b84526a2a626658, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000faafeb0a2e, %r1, %r6
	setx	0xe1d13c0b3023e387, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xe1d13c0b3023e387, %r1, %r10
	ldx	[%r6], %r10
	setx	0x0000001000100000, %r1, %r6
	.word 0xe011a008  ! 282: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xa0a9a0c8  ! 283: ANDNcc_I	andncc 	%r6, 0x00c8, %r16
	.word 0xec718008  ! 284: STX_R	stx	%r22, [%r6 + %r8]
	setx	0x0000008050b4df4a, %r1, %r6
	setx	0xe2e20603eed25b31, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800e13f1ce, %r1, %r6
	setx	0x2c52b2a32276a878, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800f469788, %r1, %r6
	setx	0xba63b0e6964d7a18, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001000100000, %r1, %r6
	setx	0xba63b0e6964d7a18, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c1b7bdab70, %r1, %r6
	setx	0x52d50ea430068a95, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000d91529c1e0, %r1, %r6
	setx	0xffd2f08cc49ba6a0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e5c8823218, %r1, %r6
	setx	0x08fbcca12d6dcef0, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000f6ca09a426, %r1, %r6
	setx	0xef9ed696f3457b14, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000eafb083eea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df0d850bba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x0000001090100000, %r1, %r6
	.word 0xe0518008  ! 289: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xa4898008  ! 290: ANDcc_R	andcc 	%r6, %r8, %r18
	.word 0xe029a0c8  ! 291: STB_I	stb	%r16, [%r6 + 0x00c8]
	setx	0x000000801d3903f8, %r1, %r6
	setx	0x02d62ff587a4078e, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000800ea7a5e2, %r1, %r6
	setx	0xd51af57d77c7c381, %r1, %r10
	sth	%r10, [%r6]
	setx	0x0000001090100000, %r1, %r6
	setx	0xd51af57d77c7c381, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000800fbe846a, %r1, %r6
	setx	0x684dc0bcd245acf7, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010a0100000, %r1, %r6
	setx	0x684dc0bcd245acf7, %r1, %r10
	stx	%r10, [%r6]
	setx	0x000000c08e2148ee, %r1, %r6
	setx	0x99e252fe074a06e1, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000dcaec6a006, %r1, %r6
	setx	0x115524fd9f30aa09, %r1, %r10
	sth	%r10, [%r6]
	setx	0x000000e1490496ca, %r1, %r6
	setx	0x317d3c8224ec0627, %r1, %r10
	sth	%r10, [%r6]
	setx	0x00000010b0100000, %r1, %r6
	setx	0x317d3c8224ec0627, %r1, %r10
	ldx	[%r6], %r10
	setx	0x000000f80dced10a, %r1, %r6
	setx	0x4b5676d4c496ad67, %r1, %r10
	sth	%r10, [%r6]
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
	.xword	0x83202b04c63cfebe
	.xword	0xc35533c92c7b0bd1
	.xword	0x6a7fcba9036cefb3
	.xword	0xfe49d579b0df9d5e
	.xword	0x75456679d60d1725
	.xword	0x1f9efbe2835c1109
	.xword	0x64969d9eb291ad17
	.xword	0xd40fbeb4ab09c375
	.xword	0x5f9cd36a88f33ffa
	.xword	0x0d77982f2c457c71
	.xword	0xcf93999dbefd7f22
	.xword	0xc9d1429c9feb1aef
	.xword	0x6be27ae36460db22
	.xword	0x518822b9d23544f9
	.xword	0x1b9ace3bfe1cf6bb
	.xword	0xf58eee214f39a764
	.xword	0x390fff1fded36a02
	.xword	0xa186ae8256d8e8d2
	.xword	0x243a2d8da40a67df
	.xword	0x4bed68c41af88759
	.xword	0x75cc46ed358860c8
	.xword	0x088efc56a261d70c
	.xword	0xc4193c685c205a95
	.xword	0xd9c5ff75d47a540b
	.xword	0xdd3c10c113d31c7b
	.xword	0x1bc5c61436ee47e1
	.xword	0x88104ce88a52ff4d
	.xword	0x5e40509372a76996
	.xword	0xbca7f34ca29aa866
	.xword	0x866c8c9cabbbe064
	.xword	0x800a6ec6782c3b62
	.xword	0x532d1cbf318a77c7
	.xword	0xddc5f93ed459d17a
	.xword	0xd0e08534ef33488e
	.xword	0x4a732d5e2d53e5a4
	.xword	0x2bf276779ef21ea4
	.xword	0x87c6037b1163948b
	.xword	0xb63a8c26a221be66
	.xword	0x509b310a34787c42
	.xword	0xdb6f0b9182326b75
	.xword	0x89c909bfe192898a
	.xword	0x857d60af5a2597f3
	.xword	0xfca2294968e04cd4
	.xword	0x25402cb691b2a911
	.xword	0x91f950ee593d7d46
	.xword	0x1e28dfbf52d972e8
	.xword	0xccc3fc7807e7f76f
	.xword	0x8ac093f1e9fca97b
	.xword	0x5819e5deed468829
	.xword	0x20185983f7b94153
	.xword	0x63379435c6947c17
	.xword	0x22fd5a3b6f268f80
	.xword	0x9216953cf9f05525
	.xword	0xf2e244ed8598d008
	.xword	0x5a3c1d8db4bb7f20
	.xword	0x1eb09b369198fe9c
	.xword	0x7cd8263a61420662
	.xword	0x646ab1f94fe7936a
	.xword	0x91e3971b86949e3c
	.xword	0xfab882a15c4f89ce
	.xword	0xe1f21d4850d664fc
	.xword	0x095fb95fa502f197
	.xword	0x9783a3578fb9d76e
	.xword	0x99426fe61c7d7f60
	.xword	0x4dde2046490a811a
	.xword	0x421ed0c779e42848
	.xword	0x245ced978cdf6f34
	.xword	0x541f368345588c39
	.xword	0x072fac72fa6a13b1
	.xword	0xa848cd48679768dc
	.xword	0x95e6a750977ad5d3
	.xword	0x79e2021ad8d20e09
	.xword	0x00261f50ae614f39
	.xword	0xc246ed79b988e9da
	.xword	0xbba848d11cd3bfaf
	.xword	0xe6f7e7528abad6ea
	.xword	0xed49e35c759624ba
	.xword	0x3311810399a78722
	.xword	0x97e3cc33bd7ba8b2
	.xword	0xeeccec1feb21d141
	.xword	0x07be6c9ffbcdfdbd
	.xword	0xb244255f1e30bce6
	.xword	0x1a6f65c757685525
	.xword	0xffb1421344460661
	.xword	0x820049f32f1f428d
	.xword	0x3049919baa2ff789
	.xword	0x2f804695990a6fcf
	.xword	0xa9006c8a15122250
	.xword	0x26ba0c761d328b71
	.xword	0x630af12d662bdfaf
	.xword	0x34e5761d741ef7c7
	.xword	0x8469ba1d7b3b0660
	.xword	0x97dbc8aa2e63d423
	.xword	0x7bfbb6baa5345343
	.xword	0x9c806cfcc3073294
	.xword	0x74890688854f99cb
	.xword	0x2832b92bfa124263
	.xword	0xcad61a898bce6533
	.xword	0x23735c4e99487022
	.xword	0xbc0fbc4b7655e153
	.xword	0xa82f657161acd3b4
	.xword	0x9191f618f766458e
	.xword	0x90634222df1f3707
	.xword	0xf7eeb0e6c62f7cb9
	.xword	0x2d74c0441c178869
	.xword	0xfcd051ec6c149eb5
	.xword	0xe9048d1c169963c3
	.xword	0x7236fb38a610b10e
	.xword	0x2c13b15bc28e4d29
	.xword	0xa1736df80591286f
	.xword	0x1febc15c4f0d980f
	.xword	0x515a582f4b84b520
	.xword	0x27e0a0378ff3f635
	.xword	0x0d599729cba9799e
	.xword	0xc14979c167f2b612
	.xword	0xacf1527ebb287ca7
	.xword	0xaa142059ba242126
	.xword	0x729a491b09447cee
	.xword	0xdf1abf3eaf64989b
	.xword	0xc9eeefa248afe065
	.xword	0x27d6fbabccefb0e5
	.xword	0x780d436b0ad73992
	.xword	0xe77c360f87c7a03c
	.xword	0x35cedcfc2b852671
	.xword	0xa573af33af81a8c5
	.xword	0x7e91f1e761013798
	.xword	0xfa7861d88c17671e
	.xword	0xbc941897e1a9807b
	.xword	0x642b4c953e9372c2
	.xword	0x9e8982e922eb27e2
	.xword	0xba00e11560c8223b
	.xword	0x747373d59b133f0f
	.xword	0x22a3c623d7da22af
	.xword	0x688414261c2c3985
	.xword	0x43b848e12b0b8fab
	.xword	0xf2900c84bc08fd1c
	.xword	0x21827367512a67e7
	.xword	0x400b8ffdfa07b257
	.xword	0x9305f010f16a4c0a
	.xword	0xfc09445410afd9d9
	.xword	0x0257b3ff8e1bf553
	.xword	0x4f3159415d6ca983
	.xword	0xce59b60cdf992692
	.xword	0xd7e4e75185e8d697
	.xword	0x32972f69b02bd053
	.xword	0x9977e546da4e035b
	.xword	0x4ba064299987067e
	.xword	0x968ad445e6b43792
	.xword	0x20dce05191ece28c
	.xword	0x911770f433ebf388
	.xword	0xf8b01374bbf20ca6
	.xword	0x6c86795953c3303e
	.xword	0xe91a7f71a6486f04
	.xword	0x1f50f97a112e4e9d
	.xword	0xdfc8255fc6f02ba7
	.xword	0xf876d63ed6fbc7b5
	.xword	0x551210f643911644
	.xword	0x3ab8c24741c9892c
	.xword	0x7269c1a3580b1509
	.xword	0x02fc765e598b650b
	.xword	0x073698f8aff93216
	.xword	0x745e87dd2169e89e
	.xword	0xd41d6d179e37c092
	.xword	0x103098ed90238138
	.xword	0x1b5013f63ee3dfd6
	.xword	0xf378c6c0439c2d80
	.xword	0x76cb1883123d97a8
	.xword	0xd6acd369b8e56de8
	.xword	0x74e8c85b48a4beb9
	.xword	0xeb26392c4fd2dd0d
	.xword	0xa59fb20e3fda9fa1
	.xword	0x2085b2a74ad63be4
	.xword	0x72e67e6cfce83d2e
	.xword	0xf6494ae3cdc54f42
	.xword	0x4b411f8157568b55
	.xword	0x3039ed6a8b4377f1
	.xword	0x8b044ed08daec15d
	.xword	0x395498dbfeef0dc9
	.xword	0xfe9b1be3fb1c4582
	.xword	0x89719af7760eaa6a
	.xword	0x1460bee8842c74c1
	.xword	0xac55c1b73224267c
	.xword	0x44ce53e2183a891a
	.xword	0x69931aac55b64ba2
	.xword	0x6f97f3461754baf8
	.xword	0x0526a4de81b6d449
	.xword	0x5a40552348c6c07c
	.xword	0xc75dec148966ef85
	.xword	0xd98c2f1323b045a0
	.xword	0x6c8283813425ada1
	.xword	0x982cc44d54f74e0a
	.xword	0xcb07c2c153df7eb5
	.xword	0x8cbd47218d81a501
	.xword	0x0044e9f74186dfc4
	.xword	0x01baa88c82fa2215
	.xword	0x9120c707c85cb8db
	.xword	0x71f0f355a6bf8842
	.xword	0x7f819fa46300f1ce
	.xword	0x1346837a736d18de
	.xword	0x21f09241d2ef79cc
	.xword	0x811e169f58fc908e
	.xword	0xfa2fb6d7217b99ab
	.xword	0x98d4e9efa3ccdfa5
	.xword	0xaa90b312f45daed4
	.xword	0x2b62c02c9afac647
	.xword	0x268216efc8c05218
	.xword	0xf8e5a5f90fc635c7
	.xword	0xe1f7fd3c4d29ac23
	.xword	0x1f20831a3057f8a8
	.xword	0xc47a4b560f40d127
	.xword	0x11632461cf51d5a4
	.xword	0xbf9a93d699fd3f9c
	.xword	0xa88e58d80a711bdf
	.xword	0x25d68b6b382809de
	.xword	0xa8f27f13e122bcab
	.xword	0x4823def188935817
	.xword	0xd083bad1b5194246
	.xword	0x610821c4576e59f4
	.xword	0x7fd230987d31e10a
	.xword	0xc9756add621980fd
	.xword	0x46dae282a8eb7621
	.xword	0x3c7bea8bcd573ffe
	.xword	0xb034fb31274a4913
	.xword	0x58c52970eb91ad02
	.xword	0x74b4964312d728f7
	.xword	0x5a8c12d0da06a277
	.xword	0xd831b35e1814a254
	.xword	0x37fe98daa871d942
	.xword	0x9171eaf2885e3482
	.xword	0x8c520427541b6265
	.xword	0x16487ec6cf190bc8
	.xword	0x4312e50a4fe9117a
	.xword	0xcf9cec47e840c39b
	.xword	0x9a600c174295d2b8
	.xword	0xd58b016763fe8e9e
	.xword	0x14a8c8f3afdacce9
	.xword	0xd370208f27d60455
	.xword	0x4848c60c8c669954
	.xword	0x0911c3a2d843237b
	.xword	0xacba938cb749c6a4
	.xword	0x55bf1885513fd2a9
	.xword	0x5cc88896068f9caa
	.xword	0xbff4664c19fa6429
	.xword	0x4336c9b79c0f7e9b
	.xword	0x3dbcd806e5e3d49f
	.xword	0x6b3a9bee34b7d6d8
	.xword	0x51ce2e14172370fb
	.xword	0x33c989244ec52d1d
	.xword	0x891e60640978f8de
	.xword	0x2072c8f988ddeaa2
	.xword	0x14cb3afb294ed7dc
	.xword	0x8c74c1edfb6930de
	.xword	0xbc023dbef3d1850b
	.xword	0x23a18e091603969c
	.xword	0x218c71e21fd322ee
	.xword	0x04ba40e96f4be35a



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
	.xword	0x1c7fa537f4c49228
	.xword	0x23b3b00c6e7cb38d
	.xword	0xf4ccf7784d318746
	.xword	0x50650e7fecf6274c
	.xword	0x1482f16ba705a807
	.xword	0x5351d84433849852
	.xword	0x98be95dde58e90a9
	.xword	0xf60961614c59a690
	.xword	0x2fc17d0dca535281
	.xword	0x6b9a0646da247c76
	.xword	0x396d2313eea98b35
	.xword	0x9af87fbccec5a7f3
	.xword	0xfdb285ae39a71405
	.xword	0x51c5e5be080cb9ca
	.xword	0xb34a57d7f19970e5
	.xword	0x486efd285272b0d9
	.xword	0x7e5a1324ca19a837
	.xword	0xf5c8b1cf34662ff7
	.xword	0x3f12e68c45fe4696
	.xword	0x3bbd02f0414cbffb
	.xword	0x1d1b280aa4b8de45
	.xword	0x319af46d54f18f89
	.xword	0xec376d2256b16242
	.xword	0xdea20e726f546c74
	.xword	0x76e00ee7dc336ebd
	.xword	0xc995ff598bfa4cc1
	.xword	0x97f49457035ddc1e
	.xword	0xc9272a9e77c1b91c
	.xword	0x990dd764919d304f
	.xword	0x077afdde7590863b
	.xword	0xa8fd8e9ec1d8fe1e
	.xword	0xf3fd47bd522dcd0f
	.xword	0x197a8612417010a7
	.xword	0x23563f26d724fa29
	.xword	0x20fe46420f6cf386
	.xword	0xce1742fdf328e988
	.xword	0x56050f1b1d13fb86
	.xword	0x7b2c3d6cfa511ca9
	.xword	0xe2c389bacf018241
	.xword	0xb90a9a472fd7027d
	.xword	0xdcb903d894914fcb
	.xword	0x27a08a638c1a20d3
	.xword	0xb6c558f2251852a3
	.xword	0x2d11e056d57cc4b8
	.xword	0x1cc852e7abdf7a5f
	.xword	0x7c82d889193c3620
	.xword	0x0ba84f75e57580cf
	.xword	0x1fe8faebd127b2d9
	.xword	0x7ba1ba91826ae171
	.xword	0x551e7d8d213250d1
	.xword	0x779f7f86ebda2ecc
	.xword	0x04a8b6d9b16c1f13
	.xword	0x99a87b8f6549a0f2
	.xword	0xb114b9e8e6b7e2f0
	.xword	0x8867621f4903266c
	.xword	0xa8d7621bea1482c1
	.xword	0xbd0949f6bbe92cae
	.xword	0x8a965c1aa67e533c
	.xword	0xdfdb9a3ae72ad0d4
	.xword	0x37d842f53971e63e
	.xword	0xbc05a9c3dbb5c1b4
	.xword	0x34aa1d6ae1764006
	.xword	0xcc7f9959ee518941
	.xword	0x8228ce2d53f88e24
	.xword	0xe753011b4f7d2a12
	.xword	0xcf6933872607c3ac
	.xword	0x1359a43cec86a987
	.xword	0xb32ffb961773d354
	.xword	0xe299a68de816e020
	.xword	0x001a33cea5bfbcf1
	.xword	0x53088f3a19e2cf1f
	.xword	0x7a7a8d8c382d1024
	.xword	0x64681a948de78f6f
	.xword	0x39f7208dfb82dfdb
	.xword	0xf6a03e4379335542
	.xword	0x45d9c173ca89cfee
	.xword	0xd1c79377d4ef15b5
	.xword	0x6dbf80695c7c3a72
	.xword	0x7715335f8e0ba1c1
	.xword	0x87a2033c1f92ba0f
	.xword	0x6165541a2ce98906
	.xword	0xf92b688569a609ef
	.xword	0xa393564b3e55b150
	.xword	0x511c39e99ae8c274
	.xword	0x20d7ab938fa7b253
	.xword	0x7137d5e7f6de51b4
	.xword	0xecb3414a59adfd64
	.xword	0xe8aab9ef35e0531b
	.xword	0x37dd1ee31171565b
	.xword	0xdfb8a309cd43edcd
	.xword	0x464260478d0b0d02
	.xword	0x146122eba8e7e4e8
	.xword	0x749982326b3595d3
	.xword	0x4e050129ecd96b4f
	.xword	0xa5cd54bbf9e7245b
	.xword	0x642d732ba6a15e56
	.xword	0xe9b163673ff3a41d
	.xword	0xe46a6d7fb35e50e0
	.xword	0xf058a9f802354867
	.xword	0x1c1c5a7b9ca6cbf9
	.xword	0x350178bcf12ace26
	.xword	0x12d29fe691667e5c
	.xword	0x5fdf79326ba3f0be
	.xword	0xd7f09a8511810607
	.xword	0xa7b0dd0f9b2d9a8d
	.xword	0x823d66b5d1828afa
	.xword	0xa9804307b4f51fc4
	.xword	0x10eb610f0e095a73
	.xword	0xc07b1ebce9431bb0
	.xword	0x3dff4a29e2ed9c30
	.xword	0x6df64315d29dac25
	.xword	0xffe1f2931814ef50
	.xword	0x53e0e50b42b1396c
	.xword	0xd067e5f4aee008c5
	.xword	0xf2ee69172747bada
	.xword	0xd48ab9ec1e6c2c77
	.xword	0x2ffe7bf8962b6958
	.xword	0x624f626630567e18
	.xword	0xff0dae00aeb9018f
	.xword	0x8ae0a1dd5525a184
	.xword	0xed1431addfd06364
	.xword	0x006f6b988a85854b
	.xword	0xbfcfa1e10fc7677e
	.xword	0x0168e2971b00c2ae
	.xword	0xb8a495dcf709d5b3
	.xword	0xe920d00afd5eb19b
	.xword	0xcb2a5ced9a6bd3ca
	.xword	0xb9bdefe8a0b2bca9
	.xword	0x827acf5376417792
	.xword	0xd7c2dc363d469312
	.xword	0xf2fc0193184fe55b
	.xword	0xa3928e2d868334a4
	.xword	0xedb245b5e39d30d8
	.xword	0x16ba226422cf75a8
	.xword	0xe099ab395b495338
	.xword	0xea6f9b1366439180
	.xword	0x940eda52412c732d
	.xword	0xe06f54cc8f48f003
	.xword	0x409db4a9f5255ac2
	.xword	0x35c0afa4b4ea4a6c
	.xword	0x858a085c401ae862
	.xword	0x6ad1ebec1cf74175
	.xword	0xac2da21d33b63438
	.xword	0x29b0d52914a92f12
	.xword	0xecaa98d7b60b1cf6
	.xword	0x042b2c4993ec37ad
	.xword	0x9be99ea85aa3eac9
	.xword	0xb016a591c61cac60
	.xword	0x9bb7a0e5d07cdcf5
	.xword	0x80ddd667dad0355d
	.xword	0x9c6cc2b51ce16a7f
	.xword	0xbd2fe154010f4eb1
	.xword	0xbc119b14db68baff
	.xword	0x90a18f02c4dd2356
	.xword	0xecfb73c68bd41d74
	.xword	0x2823c88b574eb80a
	.xword	0x1e0cc86c2bf5baf7
	.xword	0xbc3d04175ca6c447
	.xword	0xc863ab7ca25119c0
	.xword	0x49c9b2d42602df24
	.xword	0xe0a0d8c3f86d4d7e
	.xword	0x11c09933798fcca7
	.xword	0xa465c731215e31f3
	.xword	0x5391de4a3f00071d
	.xword	0xc8f8d0323c85836e
	.xword	0x7af91bd5cefab929
	.xword	0xc0f8329412d49fa0
	.xword	0xd4b1f746887ba3a6
	.xword	0x81d2e00858c0845d
	.xword	0x510cb148b37337a9
	.xword	0xe3c72244adc1016d
	.xword	0x9e1ab5bc4debe1e4
	.xword	0x70e5369cd2f97415
	.xword	0x8fe56d36ff1314d3
	.xword	0x011018ccc0ebf8a4
	.xword	0x5c6bd5973256d24a
	.xword	0xd51a6aac90b93471
	.xword	0xf04fa25c0b3aebfb
	.xword	0x95da70681798a136
	.xword	0x6fbe83576490f57d
	.xword	0x741d1020dbc94dae
	.xword	0x16dfd2ad9e41788a
	.xword	0xc0e2182ab739cc77
	.xword	0x8ad7f0291c9b2d5e
	.xword	0x0744c0fe3c8621de
	.xword	0xeea546ef830d374d
	.xword	0x062dd4e3014a8d48
	.xword	0x2b67699727fc7fed
	.xword	0x7fc3ab96a71abd49
	.xword	0xfe2533acd5165a4d
	.xword	0x3488872587db956f
	.xword	0x9b5240481fac7383
	.xword	0x71f4ccbd0f7878bc
	.xword	0x2a546f89d9cd6e02
	.xword	0x554772323374e520
	.xword	0xc38bbda6072b0742
	.xword	0x7b1ae6080cba4f20
	.xword	0xd8984c9e887e0e43
	.xword	0x7d2a9e74c1a12461
	.xword	0xbafe8d014ee28f3c
	.xword	0xc87e12d4bf85af7e
	.xword	0x4309f2d689e0d684
	.xword	0xdddec715a5d1d8f0
	.xword	0x7b090bdf9c8a3876
	.xword	0x21cb2f71badb950d
	.xword	0x22f84b7fb064ff8c
	.xword	0x23caa82b1a39b137
	.xword	0x623aadec64c4a64f
	.xword	0x21d456abc6e56f2d
	.xword	0x7fba0872ac2668c0
	.xword	0x87cb0859af030e6c
	.xword	0xf8a3457bfacc1f5f
	.xword	0x9d262d56c363b66c
	.xword	0xa80edf993bcb248d
	.xword	0xa3e2f694f059563f
	.xword	0x78085b980d2bb5fc
	.xword	0x6f18c8df054d440f
	.xword	0x1799849a9cd9451a
	.xword	0xcefed0dc8118ec16
	.xword	0xd2ee890fff8a0f43
	.xword	0x0fafcfd5b1d5607b
	.xword	0x51096ba1ebe28fd2
	.xword	0x9096019ffa2bf52e
	.xword	0x2b9efe9ca7ada253
	.xword	0xf203d94e25d64a73
	.xword	0x4b42463c932973b8
	.xword	0xd5d32a49e38b2a3e
	.xword	0x7664e4a118bc5c8a
	.xword	0x2ae1085c2b4f24b9
	.xword	0xd9329ff1e4edffc7
	.xword	0xee85a55d0bf18997
	.xword	0x7225d872fc65fcdf
	.xword	0x84ee4080d70fa678
	.xword	0x114d2986a476a232
	.xword	0x95f5ed90792f0a6b
	.xword	0xa239e964da668c31
	.xword	0x38fe947de49c29ee
	.xword	0xf884c358c23f69cd
	.xword	0xa11e5f604258fc5b
	.xword	0x0cfed3e9e2b97786
	.xword	0x6889ba44a118d0a7
	.xword	0xa6cb10a13dbfa1e4
	.xword	0xabe95b1ce6c58484
	.xword	0x7e88c397c00a6cd0
	.xword	0x6fca783a520a1982
	.xword	0xdc6cf6c8040c7978
	.xword	0xf90014dd74fcf676
	.xword	0xa90e86decd5da442
	.xword	0xe481d769187795f9
	.xword	0xac5ccbd2948098de
	.xword	0x5f88f208d4793399
	.xword	0x11871419c9181916
	.xword	0x2d58411f32571d1e
	.xword	0xbba0e5b8d3daf72d
	.xword	0xdc71b4208dc256f2
	.xword	0xc7213a402dd8bd9c



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
	.xword	0xeebf63d1811fe23b
	.xword	0x32f076ccc2adb648
	.xword	0x52cbc40c58d85471
	.xword	0x979a36644ac9811a
	.xword	0xf23c1eb1027fbef7
	.xword	0x261b8c0a5517bc09
	.xword	0x29ba9290e0da2002
	.xword	0x792596d09719f2c7
	.xword	0x25251d6636907e08
	.xword	0xa73fffc4dcdba046
	.xword	0xccf669b78b61b868
	.xword	0xdd6de7e6d4e09106
	.xword	0xf269297ac0682d11
	.xword	0x81ce70317f3ccef0
	.xword	0x8731c7d85eba3252
	.xword	0x97da2c4415d1b2fa
	.xword	0xbf6e759da0f50d18
	.xword	0x5e66c19947858996
	.xword	0x6046828155f0266d
	.xword	0x5ea37302e9e3a70f
	.xword	0x8e449aa5867a66a4
	.xword	0xac127c29e7c845e9
	.xword	0xa9e5e1413d56be10
	.xword	0x497a75d752f587f5
	.xword	0xbe2a3480aef7fb05
	.xword	0x47ec458d9faab9bd
	.xword	0x895df41dec6bf1d1
	.xword	0xb082c9964cbebe72
	.xword	0xf98d22e8ecf75d22
	.xword	0x01ac9a5e922450ab
	.xword	0x77245a5a5323dbc4
	.xword	0x9e6838d8232f4bcd
	.xword	0x4f40419ed53ea5a4
	.xword	0xaadade2988bd38f4
	.xword	0x1e2a91490c992925
	.xword	0xa1e315218cd69022
	.xword	0x853264f24990aacf
	.xword	0xfccfb71fcd6a77fc
	.xword	0x6cf2ae64a6f720b3
	.xword	0xf70b7a25670dd8fa
	.xword	0xffa8fdb7a995fd5f
	.xword	0xe2eb65f4e3a5bbb5
	.xword	0xe4c3b20da05a1193
	.xword	0x4f0124bde144ff68
	.xword	0x3be20e5fda6688b9
	.xword	0xf5de08f1a37a85ed
	.xword	0x6a60540ed59d35f1
	.xword	0xebee0718c35768f4
	.xword	0xaadc375c2702da82
	.xword	0xd92c2fa0399aa6cb
	.xword	0x68b20104630d56c7
	.xword	0x4dfd4c08c527db12
	.xword	0xbc87f8059fac4fa4
	.xword	0x7dda649aefb19d74
	.xword	0x9e8f2e88b60d44b1
	.xword	0x0de737b94ff3e3e1
	.xword	0x562ae743cee143c0
	.xword	0x52fa7c39dee4f79b
	.xword	0xe34dc7ac468df450
	.xword	0x8aec447b9b667a0a
	.xword	0xe614c7ad0d3e5dec
	.xword	0x72ed7e2fa5138e9d
	.xword	0xc99b3db172751b6e
	.xword	0xf28be55befcf06f2
	.xword	0x9b0e9480b7f23fc1
	.xword	0x8aeb2b0498c5210b
	.xword	0xa77b30327e727f32
	.xword	0x4bc363e31877353f
	.xword	0x4a4a3b1409b23fee
	.xword	0x261a448401e5e496
	.xword	0xb621043fe5b31dff
	.xword	0xf72ed7c7aec6d230
	.xword	0x172a7915ba056591
	.xword	0x01ef3d05813830f7
	.xword	0x728e97d0bf4a9c7f
	.xword	0x7ebfec121ab56733
	.xword	0xf914400176f6f7af
	.xword	0x29a035f23c0a3c9f
	.xword	0x00be4bd27d7c4b19
	.xword	0xec6c5834e95ba2d9
	.xword	0x948202232537ec67
	.xword	0x27b6fbaebd45770f
	.xword	0x04f4f5d2386a1b75
	.xword	0x2cd27e0ba03d6d6f
	.xword	0xd76cbca4abb294e6
	.xword	0x117d3f570b8f30be
	.xword	0x1802a9be7b173eec
	.xword	0xd8b069c69e678473
	.xword	0xf36741c3de528036
	.xword	0xa908d1fc1b43ecf4
	.xword	0xe5153bfcddda7fc1
	.xword	0x30a820eeb00b35bb
	.xword	0xd88f08b1d2e299df
	.xword	0x9917a9f8046465b5
	.xword	0x3959d371f0a4ebc4
	.xword	0x0426934ee97ed31b
	.xword	0x9eb9ecaeb58d1425
	.xword	0x0a51a5cd5900fabf
	.xword	0x21708d59cd5aa699
	.xword	0x9896e791c4cf8096
	.xword	0xdc7aaeca83bed012
	.xword	0x54c835261030ad6d
	.xword	0x007777827f4503bd
	.xword	0x5cd218448647e360
	.xword	0xaaf5a9dea333b82a
	.xword	0x65a926833672710e
	.xword	0x022d30e675da337f
	.xword	0x88f5eaf8e18edd7e
	.xword	0x93f407206f24f51f
	.xword	0x33f134f51439f8a7
	.xword	0xf6a6900430cae625
	.xword	0x1e924e0a04ce09ee
	.xword	0x9a10cc3971616bf8
	.xword	0x5832a612db747eab
	.xword	0xcc7c1da38dad343a
	.xword	0x24cbbe4bdf0d4336
	.xword	0x9f9459df74bba257
	.xword	0x638300e79b56e2ce
	.xword	0x82763097af9b3799
	.xword	0x3c8ad63dae119eab
	.xword	0x7a11f386b4eae8b7
	.xword	0x7f51fc60a449d477
	.xword	0xe630bd96f8a4804f
	.xword	0x25065078cc6183f2
	.xword	0xb5a7d771c8003c6c
	.xword	0x1e8b75f387da253b
	.xword	0xa2a681143c8ca915
	.xword	0x4796f1fa46af1250
	.xword	0xa861cdb106079389
	.xword	0x33fc806025a5853b
	.xword	0xcddf95735f9cc660
	.xword	0x7984124e06e22b65
	.xword	0xc340fc9a526346f0
	.xword	0xa6774c94822be593
	.xword	0x7d0673a9efa94583
	.xword	0x08dda1a737cce761
	.xword	0xe05b11e2b7399f1b
	.xword	0x0e94197f58d131ad
	.xword	0x9d900d6d443e001d
	.xword	0x090d949b62751994
	.xword	0x8d3d0cd7d3ad4099
	.xword	0xd369628ca59c1e4c
	.xword	0x5654b0475ba0779e
	.xword	0x90246b2863a944d6
	.xword	0xe619fdbe8c769df7
	.xword	0x612820707636e942
	.xword	0xb0031f9d3e4d1756
	.xword	0x60394c01c669b9eb
	.xword	0xf2c5a2cfbd080d1c
	.xword	0x6e437e2f2b0456d7
	.xword	0xfb32cde0de17aa32
	.xword	0x551deef6f77d8f13
	.xword	0x68e03f8d06794be7
	.xword	0x3ae2043e90bdd482
	.xword	0x545603ee96f84bcf
	.xword	0x9addef1ef45e2eaf
	.xword	0x0b05108519a3c5ff
	.xword	0x10ef6c229ec14e1f
	.xword	0x7cefbe212650e8df
	.xword	0x303dbdf6d5fb2808
	.xword	0x5ca0ec156ef22c70
	.xword	0xf9c2bc8d6603f214
	.xword	0xe4be31aca02e6953
	.xword	0xd64620eb2164570e
	.xword	0xb05bbaced0b0fdba
	.xword	0xaf3abe0ab301480f
	.xword	0x15fd3c49c75f7f89
	.xword	0xf97e80c2c999488c
	.xword	0x93ed7f1f79d5fec5
	.xword	0xa67aff8aad67981d
	.xword	0x7eaf032289d0443b
	.xword	0xf80e1a22ba89a5a4
	.xword	0x97f210d65ffe5c21
	.xword	0x89ef581a20d5b04c
	.xword	0xbf7b0765be0f4774
	.xword	0xbb24b1ac89116c42
	.xword	0xca5a28d80deabef8
	.xword	0xb382838121d8b3f6
	.xword	0xdd77f6ec11a92950
	.xword	0x8d33c75201d68c8d
	.xword	0x042e627d611a9daf
	.xword	0x0be17b47d5f5e7b7
	.xword	0x1e6c6566cbe943a0
	.xword	0xc62cf4d78354078f
	.xword	0xe00933192d3d9c2c
	.xword	0xe3e28613d7ec58d0
	.xword	0xd4f68a5472d71906
	.xword	0x0b81d3a4ff9219ef
	.xword	0x6591f47ff4f9bf3b
	.xword	0x35ff437119bfea39
	.xword	0xaecd5b06468383a4
	.xword	0xc4f8b4f609859491
	.xword	0x59567247932b847c
	.xword	0x0964e86de43d74dd
	.xword	0x08db85d186cb809d
	.xword	0xe76f369afb24eae5
	.xword	0x760d2f75e128e448
	.xword	0x74ce9823e48918ca
	.xword	0xed84a608c0b7b27b
	.xword	0x8c1d8e2e0896ade9
	.xword	0x617e10c232e14a4c
	.xword	0x3637997cf9968bb9
	.xword	0x5b2e887bf40da2ee
	.xword	0x421432c863f9e2f3
	.xword	0xaf163c15a03984c8
	.xword	0x7c14b9be4cf0529d
	.xword	0x8ef89f59e109b5c0
	.xword	0x41298563301b3399
	.xword	0x17771a542795400c
	.xword	0x91b90995429fd791
	.xword	0x4d70cefaca16a80d
	.xword	0x6e135b2451ed5f76
	.xword	0x1339723f5868a86e
	.xword	0xcce2117e14ae9d84
	.xword	0xa30de963fe52ae4f
	.xword	0xe7614ada88c60bea
	.xword	0xc0d57cf334060751
	.xword	0xf9d0e09deebf1c9a
	.xword	0x5aa6e7185817b6f0
	.xword	0x2b0a0d6cb5e68a6f
	.xword	0x60214f0a1a136bc7
	.xword	0xa9aea9c5c06e32ee
	.xword	0x1e32717ae66b2dc0
	.xword	0xca9bdb987b6c24c0
	.xword	0x9c754e7d9a596f87
	.xword	0x5ae248b2f8efa894
	.xword	0x10b528baf079bc8e
	.xword	0x6be08d399145678b
	.xword	0xa46427b2b08004a4
	.xword	0xb600e7a4fd5b7cbd
	.xword	0x478329dc800c9104
	.xword	0x7026f3e0027d2af3
	.xword	0xc5cc9a25adfaef40
	.xword	0x4df89d3b73f38899
	.xword	0x670f3f1a3bf472f7
	.xword	0x0b3373d3ec42fdac
	.xword	0xf5351b681f95d1d0
	.xword	0xe31ad27863cf1a2a
	.xword	0x9b4ffed0ad2ee163
	.xword	0x09774eab41df35c7
	.xword	0x18c833fa1ce41783
	.xword	0x5f91dacfa9d76ccd
	.xword	0xd09fff51666cae5a
	.xword	0x0f0b15d95b052687
	.xword	0x277dee779a369deb
	.xword	0x90c8cd4e96a9102b
	.xword	0xc9bad2192c7c4164
	.xword	0xa8561d77f414ab44
	.xword	0x6d98bde416189b1c
	.xword	0x6c9d49e8c7647b03
	.xword	0xe80cf47481ee3844
	.xword	0x3f6f77bb03aea13b
	.xword	0x4098cb7776184b93
	.xword	0xdf0093e3506e966c
	.xword	0xe6bf96ea65e971dd
	.xword	0x345f6b7c5c4d3880



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
	.xword	0x039617a0c303f60e
	.xword	0x3e1fdf3213391ea9
	.xword	0x55882d517fa34cc4
	.xword	0x16456ce7eec0e8a3
	.xword	0x20e768f5c90423f4
	.xword	0xa4e152f8f8273084
	.xword	0xe4db19369573b994
	.xword	0x5bb087f4d436a9b4
	.xword	0x65da4f37f43ca8f0
	.xword	0x981b1f047fa16fcd
	.xword	0x1af5bf87d7403046
	.xword	0x544e43455a3f61e9
	.xword	0x854b19042eaf254b
	.xword	0x6c93b9466c635e63
	.xword	0x0749f4986cef8d21
	.xword	0x5027f44f91fac017
	.xword	0x210bafb407d68497
	.xword	0x3b9cffd7695f7090
	.xword	0x87f6b21eca4acce4
	.xword	0x9eba03d0b6b16fd9
	.xword	0xd65c43d9c1aa939b
	.xword	0xeba06afcbb32fc91
	.xword	0x1ca55d2532801f63
	.xword	0xdd5ec38bef41c903
	.xword	0xc38e556d5080de8f
	.xword	0x605ebff5e957a44d
	.xword	0x04f98743ae0bed3c
	.xword	0xa7a0e26c3d633551
	.xword	0xbd57830876a17000
	.xword	0x2cf870f07e71e9af
	.xword	0x5617f2fd6904341c
	.xword	0xf8872d7d3b2f293f
	.xword	0xace8925cb182bc0b
	.xword	0x5724923fc819c442
	.xword	0x08debd5e40c50d71
	.xword	0x8e12f35f9b5ee88f
	.xword	0x111fc0f2359cf2b5
	.xword	0x8c9f2e0d63cd4415
	.xword	0x77a033d98a59b589
	.xword	0xad65ee8edbb8052b
	.xword	0xa0b8a15558ef8ca8
	.xword	0x1216563c2b4997b7
	.xword	0x51b75f4971094492
	.xword	0x97bdbea1f491cab4
	.xword	0x4e3607d48052c2b2
	.xword	0x5c9784ba186b6959
	.xword	0xe0859263e9e27167
	.xword	0x95099ec1c5356699
	.xword	0x1fa08b3fc8ab6a83
	.xword	0x21e0baf043eaa2cb
	.xword	0x5e5e77f81b7b70b6
	.xword	0xa660a5381eec26eb
	.xword	0x4d5c4859aa69f3d9
	.xword	0xa9a532c4006527dd
	.xword	0x7bee89373560837a
	.xword	0x4de14c69b1f954e3
	.xword	0x7d4d5fdacfb810ee
	.xword	0x4f802ff3f6824883
	.xword	0x9556f55e043f6b70
	.xword	0xf555b8dd73233be4
	.xword	0xe6d8d9a8ff223184
	.xword	0x7ed43b2210219e26
	.xword	0x97b523f1b540e1f8
	.xword	0xa5239d4f0554ac4f
	.xword	0xa38a682980cc40b0
	.xword	0x77697b5d9d857e39
	.xword	0x68f5a29aa1f97e15
	.xword	0xa91e8052873a180a
	.xword	0xbe589f0cd51716f9
	.xword	0x9b622ccf3156783a
	.xword	0x9d598f906952374e
	.xword	0xdd3772eb4b5bf0a5
	.xword	0x3305af0f1a99deb1
	.xword	0xc18a705c556ebab8
	.xword	0x5c09d0e006e15a35
	.xword	0xc18c3f1a5ebf2bc2
	.xword	0x84a688f1fa9c6428
	.xword	0x80ad1e48e6e49a6b
	.xword	0xc01418ff11dbbc32
	.xword	0xe9ade3229c2a4e2d
	.xword	0xb2da0c7526ca7b87
	.xword	0x7722df605c0c8f9e
	.xword	0xc98a3291ec060590
	.xword	0x3ea6d4b5c6fb8630
	.xword	0x777641af95aec7c6
	.xword	0xd190454e1c4f42da
	.xword	0xaaca509ab9456c5a
	.xword	0x7d34cd90cd4ab12f
	.xword	0xb278d772acb0c921
	.xword	0xbab208c5df822ad4
	.xword	0xdba45bbe2a4de1b0
	.xword	0x74120fc16736cdb1
	.xword	0x0c20fcac7da05957
	.xword	0xcf4d86b49f48ec8c
	.xword	0xda76d22617c1e914
	.xword	0x483519aa68ad7734
	.xword	0xc855d8e3e1547e97
	.xword	0x0e07a3186494ff36
	.xword	0xe30e3706af760347
	.xword	0xa3c882fa12682513
	.xword	0xf9941a0cbc9c08e8
	.xword	0xc8f5dae0909425cd
	.xword	0xe8e2588faf144466
	.xword	0xcfe97f5b149c7756
	.xword	0x8039377ec94e39ea
	.xword	0x9d0f71a8672d75a6
	.xword	0x89a1d713c0856194
	.xword	0x211e5c733bf710d6
	.xword	0x43005ded2bb32264
	.xword	0x6572f4b0cbadcf46
	.xword	0x154e6d5e7121fafd
	.xword	0xa9ca1667f5aa8a71
	.xword	0xe3cdb7a48442dea4
	.xword	0x6da3b20c92d8315c
	.xword	0xe83b8238f71bc034
	.xword	0x7f6fd1a370c14846
	.xword	0xaff7fc87804e5f25
	.xword	0x38fa110be6d10eaa
	.xword	0xf6d3662a3fbbafe4
	.xword	0x800ed5a86f5b8802
	.xword	0xd4216f85405ea995
	.xword	0x10bb3a3f10330b66
	.xword	0xd66b216a1f238d79
	.xword	0x2db2b75d6c179293
	.xword	0x19106384f832aa02
	.xword	0x628f366438546a7b
	.xword	0x75b2ecfb09a8f3e0
	.xword	0x46bf78672e5dcb88
	.xword	0x056f0168c08f8675
	.xword	0x7b4badca54a6c891
	.xword	0x659178f20723e504
	.xword	0xba74895f94b80582
	.xword	0xa3a70be6d667a3e4
	.xword	0x8c5281781e32e127
	.xword	0xfdc70675f35feb30
	.xword	0xe2bca77f1d790e3f
	.xword	0x16a89d8ef21e3910
	.xword	0xa276fa6f2f03b147
	.xword	0xbf00a902494f6f0f
	.xword	0x4600630b7cb614e0
	.xword	0x4cae99c0b642c296
	.xword	0x9fa6a8c11f45f518
	.xword	0x5623ea5279214ebf
	.xword	0x82ad08c94655c582
	.xword	0x9226eda2ca3cf86e
	.xword	0x7f0447f4e8fe355d
	.xword	0x48644932a4aebed0
	.xword	0x948ee153b8a46422
	.xword	0xcb42ef5795b34b3b
	.xword	0x0fba6757b9226474
	.xword	0x0bc1a18ca125ef5e
	.xword	0xe36fde81658c9b7a
	.xword	0x9d5fae6aa40fbe3d
	.xword	0xca813a3aa8ac8ce0
	.xword	0x2a9b64e771210e3f
	.xword	0x4662c47c60bef069
	.xword	0xbbf8d8d69de0967f
	.xword	0xecb6c50ac2f80550
	.xword	0x8cca8bb2821ca331
	.xword	0x73a486a1b7e713d4
	.xword	0x6555974216d8ce85
	.xword	0xf39c71070bb0b8a6
	.xword	0xb4e06765a622b275
	.xword	0x549d389a3bce2991
	.xword	0x18777bc3481cb568
	.xword	0x56f0338e4faa6438
	.xword	0xcd118fd1755c1e1f
	.xword	0x2e7295186febb5a6
	.xword	0x88a602d39819f97b
	.xword	0x66e17c952edcfe09
	.xword	0x36f03557606d5d4d
	.xword	0xe3fe0cd0f393b062
	.xword	0xb082681ca468d682
	.xword	0x4891408a3670732b
	.xword	0xe60c4b67b0901f08
	.xword	0x1f652a721e122d26
	.xword	0xa6390233268c17cb
	.xword	0xd4cb1d2e0e50caab
	.xword	0xc68eda0249469f41
	.xword	0x28e1e1bef01efeca
	.xword	0x03381bff53aa17ca
	.xword	0xdd23d32dbc03cf31
	.xword	0x871f9f4f0bc0daf3
	.xword	0xe5e334d7cb786831
	.xword	0xd866ac0338862f3c
	.xword	0xc29246e40d8d99a2
	.xword	0x66704c7c2424daac
	.xword	0xfe726d727d2a8a34
	.xword	0x026137dade2ed83e
	.xword	0x0bf1058f849d7b34
	.xword	0x5a57b111da60feb6
	.xword	0x4de88991a462654e
	.xword	0x5f786a2f2f111e24
	.xword	0x90e6ae2b77609715
	.xword	0x9699361b691f0251
	.xword	0xfa40f8ae7e9a5ca0
	.xword	0xfcf03f38ab2bf64d
	.xword	0x6e6bc70806915f94
	.xword	0xbae18e8dc14b4941
	.xword	0x575abdd48e4541ee
	.xword	0x88546b54406a10c2
	.xword	0xb4508455fe4f6df0
	.xword	0x469f490a08bc0a89
	.xword	0x2259cab3d33b4c74
	.xword	0xc690052ca9a9f648
	.xword	0xac2a352a44be47f6
	.xword	0xc7bf6c852b5a0504
	.xword	0xefc7990b6d20d440
	.xword	0xd794e656e7303ecc
	.xword	0x0fb3a4da7058850e
	.xword	0xbb2e026399bdcbf3
	.xword	0xfbe7830baf6fd53d
	.xword	0xb6a48d3d9805635b
	.xword	0x678395fd98600372
	.xword	0xcd2f1d645fdf0ae3
	.xword	0xbaa568d8f73691ef
	.xword	0x73470f71d86c8e23
	.xword	0x98d364c5801bdcb5
	.xword	0x9041cddd10cc2ed2
	.xword	0xcada734c2ddc3253
	.xword	0x4ee181a3f24b4219
	.xword	0xf4369989d4b25351
	.xword	0xcaf488935ee0634f
	.xword	0x2f3332d0cd844ea2
	.xword	0x6d01ee08b3817618
	.xword	0x42e2d3409b5bdcbe
	.xword	0xbdde7f8078216fd7
	.xword	0x34da8dcb8e4c33d3
	.xword	0xbc7b175c43ecbbf4
	.xword	0x18e8ee396214ad9e
	.xword	0x8c5670f89e2694a8
	.xword	0x5c2b88386d416be3
	.xword	0x0b3230ba301293f3
	.xword	0x806fc00a5f9966b6
	.xword	0x4f576a991374c2b7
	.xword	0xe945cda904fbd137
	.xword	0x259c2112695aeeda
	.xword	0x751906d77ec6976b
	.xword	0x4aa7c4965f3b96b7
	.xword	0xb366de507efe71d4
	.xword	0x51334cefdfc49be4
	.xword	0xc25719272b1aebb1
	.xword	0x71319386be0bead0
	.xword	0x292fa75cadc459ef
	.xword	0x9290fe94dc80807e
	.xword	0xd898b5d041ed7dd1
	.xword	0xda932a9a62148812
	.xword	0x3ddfe318bf235fa8
	.xword	0xaafd953b324a2ac0
	.xword	0xf731a5a4f0f4ce78
	.xword	0x7207d8bde99d267e
	.xword	0xb67298075732b147
	.xword	0x2a38113b6366251f
	.xword	0x9593775dff340d7b
	.xword	0x5fa1bd91a140f56d
	.xword	0xf1c6afccd14fce03



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
	.xword	0xad4a3a699e08efcb
	.xword	0xc917c7405d55175e
	.xword	0x10e67dbe8c59f665
	.xword	0x4ff3d353fac97a5f
	.xword	0x5af8d618ee15a450
	.xword	0x1490907d286aa422
	.xword	0x567011ca94cfd7a9
	.xword	0x5a2440fdce5e9e51
	.xword	0x09f4bea3b08d89c1
	.xword	0x66c45b23b06a5b01
	.xword	0x2a5709b126570c8b
	.xword	0xbb5e11b342907eb1
	.xword	0x7ece90b37a99b284
	.xword	0x9ff33fae45fa9a4d
	.xword	0x36ac58128e0de5d2
	.xword	0x46792abd53df6da5
	.xword	0xdc0bc8364af28041
	.xword	0x7b6921db62924545
	.xword	0x6e31d5ce3368581e
	.xword	0x26e058f746f3e1d2
	.xword	0x175b8a8e37132e32
	.xword	0x50969ab1812a6c8c
	.xword	0x49a6aabf147bd5e6
	.xword	0x9ccd80a494ab922b
	.xword	0x0b23f7709cb3c21f
	.xword	0x127ff1cd5808557a
	.xword	0x4a27c07dcb66ac5a
	.xword	0xd1d13f0179fab09a
	.xword	0x42f70541f2c059b2
	.xword	0x6064e4d8bf0ed717
	.xword	0x6a3d4c2e89bd3905
	.xword	0x9e85caefb2ff81e9
	.xword	0x6c70ce7e3f387013
	.xword	0x51380467b1faaf88
	.xword	0x1651584be9e97956
	.xword	0xcf7b7ef95c5a5cb7
	.xword	0x8ee3d2056b1c6a21
	.xword	0xde1fc3adf15ec68f
	.xword	0x6258a8fdf362d76e
	.xword	0x100bbebc032cf20e
	.xword	0x204db2eaf4745de3
	.xword	0x321a009710223316
	.xword	0xbab0dc1087e9deda
	.xword	0xf968befd5e31de83
	.xword	0xf44feae532edc001
	.xword	0xf039edec56cfc749
	.xword	0x2b2767a4061a708c
	.xword	0x186f6cac78069cae
	.xword	0x7f32dc828c2a5a9d
	.xword	0xfcc1fa7b479d2911
	.xword	0x6d46c8cdcbe9b7b0
	.xword	0xd90472564e8ba3c4
	.xword	0x73e152882d51db90
	.xword	0xb6e6127e3f440417
	.xword	0xe5210095fae3aa56
	.xword	0xcc8c0e0145b37a6d
	.xword	0x07337c691f59f5d3
	.xword	0xa6df4848a3e49181
	.xword	0x7c5fe9ae62cdc23b
	.xword	0x227b816a4aa5ac8f
	.xword	0x1ad4af5c5b425464
	.xword	0xb49cb1675d432ac8
	.xword	0x0e629f1e2f1a3bcf
	.xword	0xf59b8a0431566f1a
	.xword	0x723cffc82279d621
	.xword	0x46389f2b2eabb7fb
	.xword	0xf03cdfbbe9a40c73
	.xword	0x9aef269b64d3d127
	.xword	0xd519743782a4d242
	.xword	0x0c9421f5e9808510
	.xword	0xaad5ab2c58edaee5
	.xword	0x8aa7543a377519bf
	.xword	0x0651b27e5354ebc3
	.xword	0xbc485e7a81338d2a
	.xword	0x0df22bb0c891832d
	.xword	0x1e5da3bdf2c25882
	.xword	0x95896188ee31837c
	.xword	0x7d41b7195fb22113
	.xword	0x7420c171ceb9cdd0
	.xword	0xcbab2dbb0ccf980f
	.xword	0xd0c480aac1f2b82d
	.xword	0x0584223d4551aa61
	.xword	0xb4dc0ad385557617
	.xword	0x77f3e09c273811f0
	.xword	0xeea646da9f45d00c
	.xword	0x8da99111c8914107
	.xword	0xdcb1e609b9ba02bc
	.xword	0x6c0a064070bcbb01
	.xword	0x77bdd346dbc6c6cc
	.xword	0x5447c8940899eb0a
	.xword	0x453c2efc2b64eebd
	.xword	0xf8026d3985f0c41f
	.xword	0xdd60f37f1003f036
	.xword	0xbe5d4f9695254cd9
	.xword	0xc3c850a02681ad7d
	.xword	0x33692a68f41f447e
	.xword	0xd30885dd5819bd66
	.xword	0x988a6a7d19a629fc
	.xword	0x63d417d53b02dcb7
	.xword	0x621fc15d563a0be8
	.xword	0xae9139705e48c52a
	.xword	0xd9440804ca40f6c8
	.xword	0xaf3c4ebc079835f8
	.xword	0x7b6fa4981f8ac03f
	.xword	0xb97c03f5e83ac5b1
	.xword	0x4b434a29512567ef
	.xword	0x085716c1808284fe
	.xword	0xb89188922af74b21
	.xword	0x948d10d3f9ddb74d
	.xword	0xa89529ca9b7ae378
	.xword	0x8f96ee3f42b7bc35
	.xword	0x5525082ff5c211e3
	.xword	0xe4744e17ce1424d9
	.xword	0xda83d3b4453120d5
	.xword	0x1568e3ed8a836c1d
	.xword	0x0c1aee84fbf35781
	.xword	0xe8c4805394b99a07
	.xword	0x37c936de8f56f1d3
	.xword	0x8d805b0aaa4bb32c
	.xword	0xc63dc8963168d447
	.xword	0xbfaacdf645872d24
	.xword	0x83e52b3a78fb761d
	.xword	0x24a80fb5fb1a2329
	.xword	0x2704ca8764a127b1
	.xword	0xbe71cdaf7e07762d
	.xword	0xa6d4b5c534bdcd76
	.xword	0x71e83de26d6798a8
	.xword	0x4cbe60af3e256c99
	.xword	0x1cb67414a81fbd31
	.xword	0x8116e5cd50668c09
	.xword	0xb6b7a52308d9e434
	.xword	0xd35555e7c3ebce5e
	.xword	0xaa714bb9bac90dea
	.xword	0x4bc2895261cd1cb5
	.xword	0x3557baa648180c0d
	.xword	0xa84bfe9472cc2717
	.xword	0xb129c844d1037c0a
	.xword	0x9d9a4cd412c2317d
	.xword	0x13e9381b811668b6
	.xword	0x9271be32052aa9bb
	.xword	0x2bd856fec42baa36
	.xword	0x48fdfd8d34ec127e
	.xword	0x7b6a00b333d34408
	.xword	0x086aeb1885477c72
	.xword	0x183136a972dc508e
	.xword	0x6b037a0b2345dc64
	.xword	0x9bcbfa3f56591be3
	.xword	0xb959d7ac9351e450
	.xword	0xb4f1a4a88a5e6ef9
	.xword	0x371c6e20a44a5f80
	.xword	0x861373453c91d636
	.xword	0xb81577f2abee57d2
	.xword	0x38868c36a2d5fb8c
	.xword	0x1ee0425690f88e22
	.xword	0xf4f7fab3ecb2e908
	.xword	0xda8163b054947cea
	.xword	0x21c6832bd7899229
	.xword	0x4242ee4339b7e1df
	.xword	0x394fe79222019d04
	.xword	0x7a00a0e50f163b47
	.xword	0x4aef3e9234fd7a5b
	.xword	0xed74eaae158a7208
	.xword	0x33a324459181e50a
	.xword	0x5a6f2ebaf4baf235
	.xword	0xbee2f5ac6e08c239
	.xword	0xe6402b0104ca3958
	.xword	0x2e39816d77aca0ce
	.xword	0x22e240ec033de9ae
	.xword	0x7f73624bd4858a41
	.xword	0x142e6e86a47370f5
	.xword	0x701ad4a096ac545c
	.xword	0x6216815d2a2ca6dc
	.xword	0x54277161e71e50b0
	.xword	0xc42669463e04631d
	.xword	0x624be048036cc8de
	.xword	0x72b1f4e56e451a53
	.xword	0x310ac61e74334fef
	.xword	0xed6484ee56a6984f
	.xword	0xbb0efd3fa6951ac3
	.xword	0xeef0a4d513e050ec
	.xword	0x0d0c3d9be95112da
	.xword	0x03e9de492d406b25
	.xword	0x48eac3d118f82647
	.xword	0x9c0820fbfa3828b0
	.xword	0x8b053a0b5db763f7
	.xword	0x1b72e5a2eafd9377
	.xword	0xa032148d76d38b4c
	.xword	0xabb60fd90df24002
	.xword	0x4f7f20499eb45bc2
	.xword	0xd7d0453889271080
	.xword	0xc8c745ed5aa90db5
	.xword	0xd4c0c937355942cc
	.xword	0x88d6b7341b03f91d
	.xword	0xadde4f299867baab
	.xword	0xde9fba5ab44d389d
	.xword	0xa819871f1605ccfd
	.xword	0xfd868b49289a6ad5
	.xword	0x8eca38328e19320a
	.xword	0xc496b99e96bef892
	.xword	0x38a5d75ff545b16e
	.xword	0xca5402099eff681f
	.xword	0x68ebbd50f1bcd11d
	.xword	0x4cc67e796d7b3b80
	.xword	0x344bb966ee503ade
	.xword	0x9282cef444fc7e17
	.xword	0xaa1e23e2d4c2a95d
	.xword	0x227fca449f4e3a44
	.xword	0xd805598e40799581
	.xword	0x5e98167822007fed
	.xword	0xa3ef9e257be3b9d9
	.xword	0x2e76b9374b9ffe67
	.xword	0x4bb742292c41f48a
	.xword	0xa4466628009b53b4
	.xword	0x969a74a28aa1a245
	.xword	0x74fed58b82348c71
	.xword	0x1a3dbd3770256a6a
	.xword	0x92fa663fa7f4af3c
	.xword	0x12ed49b4d609f1c3
	.xword	0x83913b2903ede4ac
	.xword	0x084b5b9f8b9a3231
	.xword	0xb0d78955fa0575ec
	.xword	0x39e17fa0c7d9f791
	.xword	0x961f09156f161ef4
	.xword	0x53d0ce135c4e0d74
	.xword	0xe1d39964f0bca030
	.xword	0x87dde5c120c45e77
	.xword	0x41d54e3f7e47d251
	.xword	0x8410402f305ca671
	.xword	0x6339c8579b72f21e
	.xword	0xdeb27611cea8df82
	.xword	0xd3f0b9417d74409c
	.xword	0xc18f00857112d58c
	.xword	0x743081d52778473a
	.xword	0xf3e83731d93dbf20
	.xword	0x799d71c0e1fb330f
	.xword	0x59f3d66640f867ff
	.xword	0x697bdf172885f149
	.xword	0x986cd633d8cc0c32
	.xword	0x2869a9b9866b5d0b
	.xword	0x5e2146ff63a7f764
	.xword	0xc016f05ca6adc4d2
	.xword	0x920a7878ae0f6b78
	.xword	0xbb2d1fd7d186b974
	.xword	0x948f781cc97c28a2
	.xword	0x56cbc8f68feefb30
	.xword	0x64b48b050385b089
	.xword	0x814a8f6ad4ad12c5
	.xword	0x568e9f17228795d1
	.xword	0x682f0d265a4917d5
	.xword	0x1da274c2cd3982a4
	.xword	0xb60b9d6cf8d5466b
	.xword	0x17c06fc132695e7d
	.xword	0xfa743247a0297330
	.xword	0x1f386648b2f3c2b9
	.xword	0xb90bb013942d4b85
	.xword	0x661ffc9964794071



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
	.xword	0x4bb3b054f9d4ef7b
	.xword	0xc089db6ccaddcfad
	.xword	0xd6d788eacf6128b4
	.xword	0x397e9510456bbd35
	.xword	0xa557a5dd505f4d1c
	.xword	0xf91655afd864640b
	.xword	0xcd487804f03a772e
	.xword	0xaec0a3df64593143
	.xword	0x69f0d8d6ec6c30fe
	.xword	0xc53cb5d636352e34
	.xword	0x14e72ec575f9646f
	.xword	0x45147c3969af5c7c
	.xword	0x3c5fa455fa64ee58
	.xword	0x67a916602c1159b6
	.xword	0xb331390b854bd25b
	.xword	0xa18c5a20dbbf8b4b
	.xword	0xf62a3f9f8cc9d7a4
	.xword	0x8b970531d7c57593
	.xword	0x07f35328bd01374d
	.xword	0x60e307a0fa69b5ed
	.xword	0x9a3322ef7e34bf5d
	.xword	0x22d211674a43493e
	.xword	0xdd5d4f8786e6898d
	.xword	0xf4f7ae973d743f82
	.xword	0x014b132f6fb0007f
	.xword	0xd35ea10ea81ae3c8
	.xword	0x859e56a5d6fbcab0
	.xword	0x15ebba4eef500450
	.xword	0x2e061802c848267b
	.xword	0xf6bbaabf5b92a2da
	.xword	0xdc7a11f33618d1af
	.xword	0x22de25288e97f47e
	.xword	0x9b6154278bc8c8b4
	.xword	0x5ec4f19148c7c65d
	.xword	0xce0fa876b4870e27
	.xword	0x4d30247593c34697
	.xword	0xdabafde7b37be8b2
	.xword	0x970557ebf13dd7e6
	.xword	0x9289d23c39e842e0
	.xword	0x67cf9d5d920f7506
	.xword	0xdc09664c8331ca0c
	.xword	0xb39833a5b8904784
	.xword	0xcffd005ceb8bd4db
	.xword	0x16ffff0493291f9a
	.xword	0x25571b18b5f19929
	.xword	0x90871466056f3214
	.xword	0x098c925e0a32f726
	.xword	0x4b983296388549f6
	.xword	0x1e684bac2000ad6e
	.xword	0x842b9f9df6bc9363
	.xword	0xf044a232e21d94aa
	.xword	0xbbf09be8e9f53f4b
	.xword	0x39019d3ec12ec11c
	.xword	0x6d01d7113aa79844
	.xword	0xbbb41e09c3d5de22
	.xword	0xdfffca2c17ed45bc
	.xword	0x36dce0bf8d25370e
	.xword	0xaf20f30fe279af98
	.xword	0x63704712e1877f77
	.xword	0xc16ec75d819820ec
	.xword	0x6fd9fd4cce9a4abc
	.xword	0x574ab217a6076fd3
	.xword	0x4e76b5a66af7eefd
	.xword	0x0c733650d1f35730
	.xword	0xdf385a2b5338885b
	.xword	0xdb5ab9f336c17443
	.xword	0x98e56a945680bbb5
	.xword	0xd6dc307869c5875a
	.xword	0xcb80dfa3906bee58
	.xword	0xc2f90b84ba2a2ad1
	.xword	0xfb0691d00ce94f82
	.xword	0x797147c19bf399c7
	.xword	0x8e86fa8e94aa6004
	.xword	0x7e043970d03e8134
	.xword	0x10a6f8960dc869f1
	.xword	0xc743008b0ed378dc
	.xword	0x9f3029169f89443f
	.xword	0x59a249a73710cbce
	.xword	0x05b19007c3e32e03
	.xword	0x63bdfa11c861d288
	.xword	0x6cf4a6c7b9c368d0
	.xword	0xcb2eaab7d0820912
	.xword	0x5ce35a69901a1431
	.xword	0xabcbf5b639af2d6f
	.xword	0xd504ddd5a6504c16
	.xword	0x96b93771a55c618d
	.xword	0x50671863ad5219af
	.xword	0x8222961047f41c68
	.xword	0x38401df1a9c7d748
	.xword	0x219de31888879708
	.xword	0x9920038a8ed97ab4
	.xword	0x702872b2c44ca5f5
	.xword	0xde2a63f17129e566
	.xword	0xcaae8d56d6cc22c5
	.xword	0xa5ffa0cd9ca8ca35
	.xword	0xa2dc52684e79af16
	.xword	0x1124d705bd884d70
	.xword	0xcfd5feb3a51ea0a8
	.xword	0xf5d9c2f49fddffa3
	.xword	0x92d4f81413570f28
	.xword	0xdce37e060d2cbd0b
	.xword	0xb11bc9cefca2b478
	.xword	0x54bed6e34a5c8a1a
	.xword	0x08fb619918270db6
	.xword	0x33e907071a2e1522
	.xword	0x9d5da9f4afd3e20e
	.xword	0x57d624c97e1e194f
	.xword	0x6a8f3d0a464e73ad
	.xword	0xf9ebeb0a4ffc5396
	.xword	0x54fd5a266952de0a
	.xword	0xac6db76c24a7ef9a
	.xword	0xc170699e3d2d28e8
	.xword	0xb26536f2766b3d75
	.xword	0xd7f3662f7dba4ca8
	.xword	0xb332624c4a02de45
	.xword	0x4a9fe26e2f8cbd3c
	.xword	0x0fd0194386e74c31
	.xword	0xfb7a80108413fe7d
	.xword	0x766de527d90b4b07
	.xword	0x08514cba28459a45
	.xword	0xef9d269e679b0816
	.xword	0x2725fab5501b9d88
	.xword	0x5de04ff044864b45
	.xword	0x88a555a2a0368d72
	.xword	0x641fc8b55045b168
	.xword	0xf088297192b63576
	.xword	0xf105d5b8665ae918
	.xword	0x47ad0bad707bcec3
	.xword	0x25890eeeb84c0011
	.xword	0x222678507a2a012f
	.xword	0x87cc7eb0e10d2f35
	.xword	0x43c26534e14d53f3
	.xword	0xb8bf56db58908324
	.xword	0x24c5c57d17cc9272
	.xword	0xc1576f314c4e47fc
	.xword	0x17907b9c06058761
	.xword	0xb43f124b7622bbef
	.xword	0x48c4d71276a15eb2
	.xword	0xa3b184b8dabba2b7
	.xword	0x335762d8cb44009c
	.xword	0x1b0e889ab48cd9c1
	.xword	0x8095b46f391f3f37
	.xword	0xd64088d89d4af0b7
	.xword	0xe1f194a8da9479ac
	.xword	0x15db5281dba88ffb
	.xword	0x7561ad5b4fe68d68
	.xword	0xa20e7bc6d5ab7640
	.xword	0x769a44309965e7f3
	.xword	0x12652243544eb5af
	.xword	0x9d07380b5c0cc511
	.xword	0x8e05054254c6928e
	.xword	0x153c4191da0d873d
	.xword	0xeda067caf1eda120
	.xword	0xf2c0b6229c498f9b
	.xword	0x7b9587452c28272e
	.xword	0xa17f6ff9b669b557
	.xword	0x3431171db2ec1bbc
	.xword	0x4a34505df98e7ff3
	.xword	0x2c8f7a179e0add0c
	.xword	0x51e1f77e110a8a72
	.xword	0xf6a1b15973c58ce2
	.xword	0x4620fdff4a024fed
	.xword	0x20a8313220e91976
	.xword	0xa7c3cf9b0cbc2b56
	.xword	0xc24770593e7a2ce2
	.xword	0x9651f424acd57ad9
	.xword	0x20f0ac6d64357605
	.xword	0x73f9c3bf9665e0c1
	.xword	0x632a5dfabd4e07ec
	.xword	0x752d991a46099a70
	.xword	0x6ba584cdf9451113
	.xword	0x0e5382fe9fa524ff
	.xword	0x43dc06c19d6e17c3
	.xword	0xf2137af6ecff41ff
	.xword	0x47fe6c9a288e422f
	.xword	0xe8519bd0655fafa2
	.xword	0x84cc739508922d64
	.xword	0x271fd83dc5919737
	.xword	0xeffb0463e52d003d
	.xword	0x1a35e4c68f1a6768
	.xword	0x272c21fc8402ad22
	.xword	0x5be0b94334ce8cf3
	.xword	0xf805bf755bc95e9c
	.xword	0xadc63ff116096911
	.xword	0xb17b26d49964daeb
	.xword	0xb5baddd24def4dd4
	.xword	0x10c28b48e6c7643a
	.xword	0x1bad30931226896c
	.xword	0x39dab4137623c91e
	.xword	0x015f8f564fd7b330
	.xword	0xb14db38257179bb0
	.xword	0xe70222f30f6e2ced
	.xword	0x0f5599393f4f9ec3
	.xword	0xcdbf5911b0b1bad8
	.xword	0x003bf1c4ece2ee90
	.xword	0xa3121526316c08b7
	.xword	0x283cf433e24a0131
	.xword	0xdf3b6a16ab554fbd
	.xword	0x3f7120f6734b6fae
	.xword	0x62b472e1a73c67c4
	.xword	0x4831b24c597b1266
	.xword	0xf8be130b6df0538a
	.xword	0x312150f29bf8f2e4
	.xword	0x250e70c33ffaf724
	.xword	0x3608a67f40beabf8
	.xword	0xe7130fef638c4d70
	.xword	0x9556440c7349aede
	.xword	0xaedfe7c05d830389
	.xword	0x83c1ab7915b7fb93
	.xword	0xa8208f32f1709a84
	.xword	0xba6b84ab95137126
	.xword	0x98be68f149ac2ea8
	.xword	0x92815f78346cafe0
	.xword	0x5a3e2964caf33dfb
	.xword	0x7c0aa74a21e6112b
	.xword	0x6c174575b34a2e52
	.xword	0xaf4fc6c53009588f
	.xword	0x1f4b6350073a6f74
	.xword	0x2d433cec04a91c4d
	.xword	0x75437ac36bf0d1dc
	.xword	0x214c322d2f1a93de
	.xword	0xf77cd05a4cca2833
	.xword	0x2a15f712eb223fb0
	.xword	0xe57b930bf3b0b18b
	.xword	0xe5934a9df4d723e3
	.xword	0xe5c500f9cf89ef99
	.xword	0xcbd7162f5eabc311
	.xword	0x2fd52fdf8740dadb
	.xword	0x83d6db13a7e65a72
	.xword	0xee4ef2680ef35c58
	.xword	0xc8dafc978c54843c
	.xword	0xfbbddcf229169ef6
	.xword	0x7e3689b27fa2833e
	.xword	0x37a16125183223b3
	.xword	0xe09bbfdc4f4479d2
	.xword	0x48b9427018e10f1a
	.xword	0x6a891388893f51d8
	.xword	0x40e994f766907368
	.xword	0x9df0f18025b263da
	.xword	0x6f705a57285a8ff3
	.xword	0x4c48906310dd1132
	.xword	0x6f01f75e2390530b
	.xword	0x93fd4a67496e39d0
	.xword	0x28c6543faae74ef6
	.xword	0x2865dcad7552c56e
	.xword	0x91909b103bc9a18b
	.xword	0x4c5887184f755278
	.xword	0xe14b1567d916ece0
	.xword	0xdc8fa1e0c2240cbb
	.xword	0x8bcfea5363d159a4
	.xword	0x1604bd16dd29178b
	.xword	0x7e720be0ab08203e
	.xword	0x307313b92814f3a3
	.xword	0x335f0e5feb61156d
	.xword	0xf71739fecae65248
	.xword	0x8113bb61d0293ba1



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
	.xword	0xf6f273426f977437
	.xword	0xb763deed5a1cbb43
	.xword	0x0c7fed6965597725
	.xword	0x0e635be3628dd807
	.xword	0x4da267906fcd50c5
	.xword	0x30293282514e380e
	.xword	0xd654fb9bc2535da2
	.xword	0xc5e4bfba6cfcbb22
	.xword	0x38ebefc424ec0f86
	.xword	0x0c83652647fdfdbf
	.xword	0x72d17d9d8514aea7
	.xword	0x93d69b1f9f228a8f
	.xword	0x734d3e8c306b418f
	.xword	0xb01a4ec3701d0b88
	.xword	0x9f2e77537469dd9c
	.xword	0x8322dc259a854536
	.xword	0x2ee33b0812751743
	.xword	0xa27dd85bd63bbb22
	.xword	0xfbd45a7d57b63e7f
	.xword	0x624782bfa2bc449c
	.xword	0x10ecf84b10b0d464
	.xword	0x3b777c5904e77750
	.xword	0x2da81fa91e7134db
	.xword	0xff006dc3b40963a3
	.xword	0xb96a755587d50834
	.xword	0xec996533579deae4
	.xword	0xfc19712a77e8210a
	.xword	0x074ce8baa6913f93
	.xword	0x089a393b4950ee19
	.xword	0xfd4392887e8827b6
	.xword	0x6f8ec30f14349e86
	.xword	0x0f2aa13633344dde
	.xword	0x81686409efe56b60
	.xword	0x4e03df149ccacc57
	.xword	0xf6ffe17dbadd0a1c
	.xword	0xddf482fc8d0ce25d
	.xword	0x5ee45227a2484c9b
	.xword	0xc267f84835228d13
	.xword	0x401a6b238cbc94fc
	.xword	0xc8b800517cef5547
	.xword	0xe9ee5a00474022b3
	.xword	0x68c6fe4dd9c2a3ab
	.xword	0xc47c36eb68963c45
	.xword	0x6fe2d498f7c16605
	.xword	0xd6f1563228f75d80
	.xword	0xad89a806bca69c9b
	.xword	0xe4af8c4592bb65ad
	.xword	0x3723725cffcb853a
	.xword	0x475a35dcd5a39443
	.xword	0xf5a503ada8351a96
	.xword	0x6c71af1553eb21b5
	.xword	0x48e839601d5cea6f
	.xword	0xb5553f1eab934af3
	.xword	0xfd19e7a675e4d436
	.xword	0x1f9e922dd0ed4e0c
	.xword	0x0770e5d9f45ab0cc
	.xword	0x2f522c62aeb0a94c
	.xword	0x3137a044c2297abf
	.xword	0x85a08be8520f763f
	.xword	0x4587554e9748688b
	.xword	0x46a3e43b78f3d805
	.xword	0xa3246e6945e2a065
	.xword	0x38f2150c2471cc3f
	.xword	0x8647647576f4710e
	.xword	0xb0998c2a08ac70b3
	.xword	0x5a3263c45d724506
	.xword	0xf99c490631a65a71
	.xword	0x1b04f436b81d8e45
	.xword	0xa25feb31a983bc54
	.xword	0x433e73490e972d05
	.xword	0xeab5ef5d84d161c3
	.xword	0xb3c6fc0e888211e4
	.xword	0x78481249f2949fa4
	.xword	0xd54cc146a24c8c9e
	.xword	0x907103a89ced83d0
	.xword	0x0e8be4d34c2513bc
	.xword	0x90e2f71dea6f26f5
	.xword	0xd119c717832ef273
	.xword	0xad233adbfb927323
	.xword	0x56a0076b45758eab
	.xword	0xea5f992f75c87472
	.xword	0xdcb240e9822ec0bb
	.xword	0x45bc5f57f924873c
	.xword	0xbfec84ad5e62cc19
	.xword	0x3bf4b8024e67c629
	.xword	0x8819878d3bd453ce
	.xword	0x6e56ac47433b2162
	.xword	0xbbc45ef260a046fd
	.xword	0x280e03d6f1d90323
	.xword	0xe95c89d43f8ddc63
	.xword	0xd9c822972df4a914
	.xword	0xc9d94bbf963f0735
	.xword	0x857e56fd5ecfc0c4
	.xword	0x9e539ef5d92e0b5c
	.xword	0x1b0c41be8e266813
	.xword	0x205728fd3bbaced6
	.xword	0x7e364aca5060dc4c
	.xword	0x24af725158037ce0
	.xword	0x22a5cd064e4632a9
	.xword	0xed7153f98b3784ea
	.xword	0x0cee888aad8c5080
	.xword	0x0488d6fed9a66e17
	.xword	0x411445e7af05a89c
	.xword	0xa00ca01814db4988
	.xword	0x44ba4a5184eb461b
	.xword	0x7b97a78c57a0a87c
	.xword	0x16165c305f389b4a
	.xword	0x1d58ea22a2d187c3
	.xword	0x5ab5e7160f9723cd
	.xword	0x36fcce91adc734dc
	.xword	0x021f0421b9a20ca8
	.xword	0x1fe9d4b313a33abd
	.xword	0x781b7e3b6ae4ce4b
	.xword	0xfb0a923b6a84d966
	.xword	0x3bfe0f0917f32abe
	.xword	0x70d5931bf29a86ca
	.xword	0x8f90e66e82576a5b
	.xword	0x4d93ffe426c3950f
	.xword	0x68b8fa333cb414f8
	.xword	0x026000e45db35155
	.xword	0xccfb9010b3d61ffc
	.xword	0xd9d381edc103b442
	.xword	0x6d909fb4df36b093
	.xword	0xaf12065419c1e077
	.xword	0x7215190aa22c0963
	.xword	0xa67e8a572e0c3f0f
	.xword	0x810049f0e060b80a
	.xword	0xefd6baf81b3a7f0f
	.xword	0x2f7299fa65a0de7a
	.xword	0x4063612ac06bf7d0
	.xword	0xfe6ab5c1684658df
	.xword	0xd4c92cfd5d8f0361
	.xword	0xf6d6e73b160abc96
	.xword	0xfdff34859ac0ff8a
	.xword	0x436ec0d212905784
	.xword	0x091ad692c4c910dd
	.xword	0x3c3f8b9b095ec403
	.xword	0xa6ccadfe198ab558
	.xword	0x4a6fb602f5117526
	.xword	0x88f7f38eea221b1c
	.xword	0x91c240577962ba49
	.xword	0x1bec258cf8eb1165
	.xword	0xfa024ab223ab4959
	.xword	0x7f6450d47942b8f2
	.xword	0x05e3f60e9e333f23
	.xword	0xf7d39edd041883bd
	.xword	0xb357d6a74d777187
	.xword	0x405a63def21d99f6
	.xword	0x6f96cb72d18b83fe
	.xword	0x2d7af86ef11ab5f1
	.xword	0xd59ecb902acd430e
	.xword	0x0c6882d99d12d349
	.xword	0x8913a1c0eac2d882
	.xword	0x91ccf2272340f7f6
	.xword	0x2175809eb6bdcd53
	.xword	0x15d2724b976c9321
	.xword	0x988a23bfa0e50d53
	.xword	0x02af5b15b24f1b53
	.xword	0x52dfe519ad0baea1
	.xword	0x916dbc35b58b5738
	.xword	0xa4d3b933fdc2974f
	.xword	0x65476f131f668fb9
	.xword	0xf52ebdead3be9f60
	.xword	0x02c429c6aaa1f77b
	.xword	0x98ef0c152c4a2bb9
	.xword	0xd7c376503577861f
	.xword	0x1de5032799bb14f5
	.xword	0x47351a1d144a45c0
	.xword	0x44022b1727c73c47
	.xword	0x6e2baad5f66188eb
	.xword	0xb86c38cd032184e7
	.xword	0x54228db7fd87a095
	.xword	0xd940d6e411ebfe3d
	.xword	0x04badde3b1e74fa2
	.xword	0x6e78a5c87b0649a1
	.xword	0xc1f2b173f7e3d12f
	.xword	0x31e2fe3f819843a4
	.xword	0xcc5c13f096ee78ae
	.xword	0x80e5067ac91a3086
	.xword	0xe885abdbcb04bfc0
	.xword	0xb51f012c9f869299
	.xword	0xaa1f961a5e46e61f
	.xword	0x9bfe9a490e060b78
	.xword	0xe57e026710f0b230
	.xword	0x26d06a7e81e7a4b7
	.xword	0x7736033c4d665ec1
	.xword	0x0d2cafb58ba00b92
	.xword	0x32bb20ae1c77320a
	.xword	0xb14f229027ff9597
	.xword	0xa18fe83005024c41
	.xword	0x2875be9abe36971a
	.xword	0x49dfd806c10c5b60
	.xword	0x3e60f577c4e80f67
	.xword	0x440c44f6ee76d4ce
	.xword	0x3dcdfb04d741cd35
	.xword	0x63d66dee2df08cf2
	.xword	0x47bc13b16c7ce7ca
	.xword	0xfbb29c488d08007f
	.xword	0x1f007f6e4449303f
	.xword	0x25d773d77e358190
	.xword	0x1d492059612b59ea
	.xword	0x6f9945c7f7ac883e
	.xword	0x47153def674666b1
	.xword	0xec7e4416d553a696
	.xword	0x687880ec221c70d1
	.xword	0xa4986a8c4b76062a
	.xword	0x5f3f988895c815b3
	.xword	0x34c3753a7970c978
	.xword	0x2944f4dc6b6c7344
	.xword	0x21d6b7fce38e8cfe
	.xword	0x59360b4cb2e4b280
	.xword	0x7c0302549e329c2a
	.xword	0x4ad80820ae597c2e
	.xword	0x87424ce09050f225
	.xword	0x823b1421fbc287f8
	.xword	0x016a0e2a1d7b6a1e
	.xword	0x9517ce9cfcbde346
	.xword	0x70de7c3b1333f5bc
	.xword	0x5a3cde6056a2afdf
	.xword	0x065e272dc64add12
	.xword	0x6b7fe0dbc3ab6a08
	.xword	0x4925d9f7c0081d0a
	.xword	0x00a0c0b1538885ee
	.xword	0xbaf7361c3125e765
	.xword	0xf945501eb8494326
	.xword	0xf746024fbaa95ce1
	.xword	0xfc5b9a1e674070d7
	.xword	0x085ef0cc78a3f714
	.xword	0x243544fd4cc2b0df
	.xword	0xb93032afd3257bd1
	.xword	0x018c8ac4e4e2c7f8
	.xword	0x76dc94638a2a0943
	.xword	0x173832326dc0acb0
	.xword	0x0f36a920e5638575
	.xword	0x9343e14894ef06bc
	.xword	0x03e755f954f60993
	.xword	0x8f7f5b1cbe0bf1b6
	.xword	0x2344cbb9fd308526
	.xword	0x73acdf6e3a157cc5
	.xword	0x2abd4025406c9b95
	.xword	0x0a79bb89272e4154
	.xword	0x64e2d2226431b874
	.xword	0x8072fac8ced964cf
	.xword	0x5a995ec54812e119
	.xword	0x9a00cf2008b5ad89
	.xword	0xc4210300a2ee0820
	.xword	0xa16d6ec80360c6d0
	.xword	0x38d7a0ed624398f7
	.xword	0x13df3fe0ae0ae9f9
	.xword	0x05e9802698246f66
	.xword	0xd3a6539ffab15c95
	.xword	0x00a4a0a1e4919ef8
	.xword	0x85172a51e7830966
	.xword	0x31dc9341fc397770
	.xword	0x046e675878232c54
	.xword	0xda8f6dff2a86b7b3



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
	.xword	0x0669843aef747ca5
	.xword	0xfa49696539693cf5
	.xword	0x14dbd4049bff47ca
	.xword	0x99ccdec692346cf7
	.xword	0xc0c42b6544c98999
	.xword	0x3219f7c9ddfd149a
	.xword	0xe7816dd6cf80fb62
	.xword	0x01436f6be767fb8c
	.xword	0x4c3e5784a9f8bb24
	.xword	0x745d779cc5fc3ab1
	.xword	0x7edd6126104941b0
	.xword	0x4ccc6df67382aa62
	.xword	0x052366800e6547e4
	.xword	0x27459c59f42f7f08
	.xword	0x5387ac181bd2ec7b
	.xword	0xed7680853a7a25e0
	.xword	0x3b6d491b61e01af2
	.xword	0xbf3d9ec62f9a2c4c
	.xword	0x1d030d3d51afa4e2
	.xword	0xee081a2c3c38af3f
	.xword	0xd4acc801eb5abfe8
	.xword	0xee9dce97dd77b0cf
	.xword	0x3ad192a28581b83e
	.xword	0x724fab34e8f70a3f
	.xword	0xa2942ec26a0a13ec
	.xword	0x8259fe0a509534ba
	.xword	0xef9428ab1727cfb3
	.xword	0x6c3b5de9b1c7d9e8
	.xword	0xb9c08981b84c9cc7
	.xword	0xe334fe019d23c56a
	.xword	0x8236cd2fa9834f5b
	.xword	0xbf63eeb200db0636
	.xword	0x65647440593d8add
	.xword	0xad67bba995ecddd8
	.xword	0xbcd879f372900a98
	.xword	0x5b1b8a886a93f068
	.xword	0x6483a5c1f1c921c3
	.xword	0x64a0889092898538
	.xword	0xc75980ada6827775
	.xword	0x4f46caad6dd77dd5
	.xword	0xbaa9e7113ea0a631
	.xword	0x2c46f5c19c5c5f11
	.xword	0x7b21757eec35461f
	.xword	0xe33a5765c660d448
	.xword	0xeed419f7fbbdbc5e
	.xword	0x8a9d4ac783bee31a
	.xword	0x59af5a98f55f1166
	.xword	0x7e8dc572ed2739e2
	.xword	0xad2433911bf944a5
	.xword	0x8df7a13ad8515d00
	.xword	0x9be0f2c047563585
	.xword	0x6f83784a99a1404e
	.xword	0xc9500f04922442cf
	.xword	0xaeac2423b1a21d00
	.xword	0x312ec46c1a62af12
	.xword	0xaf92c4ee04adb51a
	.xword	0x66b8c65462cda5b4
	.xword	0xae1b007205ec479c
	.xword	0xb77b53a6daf03d2c
	.xword	0x1ca1647b2bbd31aa
	.xword	0xeb6b3338efe60813
	.xword	0x14e7c495782de9fc
	.xword	0x9c836108929c4e03
	.xword	0x0ccd8191d8cfd61d
	.xword	0x31440c6363d58fb8
	.xword	0x9ea52194d2b0e2c6
	.xword	0x625b532264d7ae6f
	.xword	0x89931d6d83872e23
	.xword	0x4ad360af42b03941
	.xword	0x2ec6f57105b5f27c
	.xword	0x566627e19d380e86
	.xword	0x012faf60a46c4f03
	.xword	0x2b06d4177bb57700
	.xword	0x4fcc22195868c591
	.xword	0xb5ef3333984a2cd2
	.xword	0x6cc0c5fd12ee4565
	.xword	0x517844d682d300ad
	.xword	0x6a79be4676e4a5d3
	.xword	0x571c32df3fcc5337
	.xword	0x85c20d79dca5ff75
	.xword	0x31e6a0b484c8c4da
	.xword	0x8abe3e51b347bc80
	.xword	0xb02a02018c8401be
	.xword	0x13e5d42a3f8278d1
	.xword	0x294e1d6640ee6837
	.xword	0xc2a0f64b5fa83d8d
	.xword	0x9f6746c229512fef
	.xword	0x057757366971a790
	.xword	0x1d3a3c17fefe8c64
	.xword	0x8e10dcb396f0b193
	.xword	0x56a63c3d688f0fe6
	.xword	0x886586a6934e45f1
	.xword	0xbf32234287700b8d
	.xword	0x9ca1856d313ca35d
	.xword	0x9aab83e1f56cc410
	.xword	0x535a6b970bc19a6c
	.xword	0x7d682780b063b76f
	.xword	0x0724bbc054c30f5f
	.xword	0x7b64098ef2ae85e4
	.xword	0x20bd3547673ca734
	.xword	0x7b586ed860e04ad8
	.xword	0x741543908c1faa67
	.xword	0xdc2e63b3a614dcda
	.xword	0xf00315f0507562c2
	.xword	0xf59b9bc705ff162b
	.xword	0x0c0936ca5900dd15
	.xword	0x76e34e5fc04d8690
	.xword	0x301796ce6141045f
	.xword	0x55da3f08858f75d8
	.xword	0xa0661591c59d0ad0
	.xword	0x259084f2bcafcbb6
	.xword	0xb15fe19a9d1274bc
	.xword	0x6c44a5aa98bca806
	.xword	0x7b7f95d62e4448f8
	.xword	0x4f35387f17f2be6b
	.xword	0x18e831e6ea997f56
	.xword	0xe659df35dcd6c2c0
	.xword	0xf94d139112fae495
	.xword	0x1bc6b91666d4c1f2
	.xword	0xc757dad522be9d4e
	.xword	0x0452df3c66bc6e58
	.xword	0xaf0c8bb5c1267fbe
	.xword	0x498e6c2ab708dbbe
	.xword	0x939c551fc3bed112
	.xword	0x87c19d5038f4b088
	.xword	0xaf36d489c2171211
	.xword	0x0676c0d00efbf7ed
	.xword	0x66434ac7a8af4292
	.xword	0xcfb67cc315cb15cc
	.xword	0xfdbd5edb5979fb8e
	.xword	0x6cd450fed644d192
	.xword	0xaf777c84e14e7a9c
	.xword	0xb28c44a91bdc5051
	.xword	0x5b87a1709bbb66fe
	.xword	0x6f4cf9b042d519dc
	.xword	0x1090fa6994445e63
	.xword	0xa667cbb88799dc97
	.xword	0x35a1454521d8e97e
	.xword	0x3f002e2618bc316a
	.xword	0x4669270138b0ebff
	.xword	0x0ec04d892345c096
	.xword	0x34afc569cc14001f
	.xword	0xb0d4cddf4ef0a019
	.xword	0x269058cf13ff90c6
	.xword	0xfa2905d08482c62d
	.xword	0x9d9a1d2c128496ba
	.xword	0xb022ce73cb194fdf
	.xword	0x126550719834d249
	.xword	0x9d3d6bda620a3c2d
	.xword	0xd0f6fd3a300ac951
	.xword	0x0f388206761485ec
	.xword	0x6ab7ff101cc933f1
	.xword	0x7f96987107519b1e
	.xword	0xce435022d39d3ee4
	.xword	0x3bb0e5d6e4e4a53c
	.xword	0x588cb252481559e1
	.xword	0xfdb0227919ab48da
	.xword	0x29c10be367d643fc
	.xword	0x39736b83babb6f5f
	.xword	0x6a8b4a270b9f1be8
	.xword	0x0ddad23c7b583f6f
	.xword	0x26b3aa6a676c9cfd
	.xword	0x8d56ffaf604d761b
	.xword	0xd62a4784e7538c91
	.xword	0x74eb6e2a28ad54df
	.xword	0xbc8b78542eaf4eb4
	.xword	0x5fce2841229d9241
	.xword	0x2c63889a3e315aef
	.xword	0x24998cca50243426
	.xword	0x383057299fd6d395
	.xword	0x4e0eaa11f5204d7f
	.xword	0x535efbb4ad0d24db
	.xword	0xe161073569009c4c
	.xword	0xb76580b61db24dc7
	.xword	0x21fd765f189b9da7
	.xword	0x85d66270e3acfeac
	.xword	0x1293766f2667bece
	.xword	0xf37833a7ce7e1638
	.xword	0x0a63091a1d267e40
	.xword	0x4db0a6ebc8fd34a2
	.xword	0x7cf6c36b55a2113f
	.xword	0xf5aa308c69403e6f
	.xword	0x762173708f48d8e4
	.xword	0xbac8c1d7003e142d
	.xword	0xe2b07103ecc96214
	.xword	0x0c0e77d57d7a6663
	.xword	0x6880428ae124d212
	.xword	0xfbdda6682e617c0d
	.xword	0x981beb0914d1462f
	.xword	0xa6841f6f629529bb
	.xword	0xb2c274878b47e5b3
	.xword	0xe1744d0d4ac56581
	.xword	0xb92a954bb04c1d9f
	.xword	0xeb81d3599ae76a84
	.xword	0x1e0b19e8cb4ab271
	.xword	0x2290792dbf73c623
	.xword	0x0d400db43995f7de
	.xword	0x2a54931d95faa03d
	.xword	0x1c24145a5570b0c5
	.xword	0x0f2c5d7f23c26ed4
	.xword	0x083242b828efc3c0
	.xword	0xf77814ae53dfe065
	.xword	0xb08efe2ef582f6a3
	.xword	0x030ce3cf8083ddb6
	.xword	0x37052042ecbb8a7e
	.xword	0x443a3e24c3d12502
	.xword	0x89150ce0c6006447
	.xword	0x864e9374c8b430c7
	.xword	0xc33ea4e7aa124ef6
	.xword	0x209c29a49bd8ea1a
	.xword	0x28dd8f2bac443766
	.xword	0x756e8b68c8c2698e
	.xword	0x54a3d5778225c27c
	.xword	0x966fd1500fd49e0e
	.xword	0xc1d5347ef796a6ab
	.xword	0x8dc560e4fa993aca
	.xword	0x9fce9305e2b2a6b8
	.xword	0xaa216432a86f79c6
	.xword	0x9cff2b54e2ba4120
	.xword	0xb456e08e4d1dbd01
	.xword	0x274d9f9954e05d55
	.xword	0x33891c7d8d7527d8
	.xword	0xf195e8e245be7f89
	.xword	0x7ae103b006f9e12e
	.xword	0xbd04b746a54d50cd
	.xword	0x218b3335bba8f0a1
	.xword	0x0e97df95762b1423
	.xword	0x92b140a3faf7eb66
	.xword	0x6ddf8cc72ba05e9d
	.xword	0x6a1518fc7ebeea1c
	.xword	0x5b9f96064458d895
	.xword	0xb60427a771f1de0c
	.xword	0x07c4c82609f6b5fc
	.xword	0x23e00b6b497f1dbf
	.xword	0x8c6e256700e87d78
	.xword	0x0cd28697c993291c
	.xword	0xea1aaca6c48a2c70
	.xword	0x31162225320331e8
	.xword	0x6659730faa235bc2
	.xword	0x8bae762e0c33a99b
	.xword	0x87c3491fb23416fa
	.xword	0x161405876df346d5
	.xword	0x7be3e7c9a3f44832
	.xword	0xf36f0bbb188afc38
	.xword	0x67578d1ebc8d0343
	.xword	0x8ee2cc0984a6cee4
	.xword	0xccccbeaff98e344b
	.xword	0xdde318ed0340c264
	.xword	0xb8663ea69a68e774
	.xword	0xf3c698314bf679dd
	.xword	0xdb9bcf3d5acad102
	.xword	0x9e5e20dd5441b5e4
	.xword	0x263ec48677818545
	.xword	0x0b3f8e86857776ad
	.xword	0xc0eaf374a4b252d9
	.xword	0xd36d77ca3979e5c2



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
	.xword	0x43ba4cc4496b90fa
	.xword	0xba7f86316eb43888
	.xword	0xd4d3cb99d76df868
	.xword	0xc602fb2a01bd347d
	.xword	0x51f5d28d1b3ed0db
	.xword	0xbf93accd4df4b536
	.xword	0x77980673f7898b56
	.xword	0x8432ee601ad04986
	.xword	0x7bfae4f2192b5dc6
	.xword	0x91f420c654a98717
	.xword	0x8e834d238b1b4f10
	.xword	0x068741acbb026f70
	.xword	0xeadf10a5bbf75a16
	.xword	0xa9b9d0305f35c1ce
	.xword	0xa1c8dda1a4a8f3d5
	.xword	0x7c21b62ac65a72c4
	.xword	0xe12af251a1357fa4
	.xword	0x2a190760d519e7ef
	.xword	0x4bf2152bd1f5b5fd
	.xword	0xe604a5f49b5bb214
	.xword	0x81562aa7618907c8
	.xword	0x5476131fff0c067e
	.xword	0x863184d5b6edd1ec
	.xword	0xdaccd2b9497edc07
	.xword	0x95352b1cadbd8f42
	.xword	0x106d1905ac041d79
	.xword	0x08a926f2c89ff8d0
	.xword	0x599a2a9b9fcb831b
	.xword	0x90978f81bcd7837e
	.xword	0xa39de55580b3a9a5
	.xword	0xb09885283d0d7d0a
	.xword	0xd36fc7ee0fc20bfe
	.xword	0xc964d5b308e7136d
	.xword	0x460a54d5bdf4a552
	.xword	0x717da0330cedfcea
	.xword	0x44ae9f1cb91b5175
	.xword	0xf0b43f049e5d6384
	.xword	0x65df9b86a3518942
	.xword	0x941c9fafb3029a9c
	.xword	0x0da1a8414567e99d
	.xword	0xe1d21340d83c42cb
	.xword	0xf6f6fde945d8ee43
	.xword	0x0f3582d3c15c0e28
	.xword	0x7954d09c22760cc4
	.xword	0x1ddfc153ce7eee20
	.xword	0xc811a149ada5d45e
	.xword	0x16b818e4e9586bfa
	.xword	0xb04a56fb2c5298e5
	.xword	0xe065eaaf0824a23c
	.xword	0xe5b41733507defb6
	.xword	0x3c135aadd841e0aa
	.xword	0xeacea26523617233
	.xword	0x851f3fbbb78ef994
	.xword	0xd3e556d192c938f0
	.xword	0x1733a16671b7c8ed
	.xword	0x591dcb9c0d25f0e9
	.xword	0x5c3867100627ee3a
	.xword	0xfd62050edd6530a8
	.xword	0xc1a742b7fdc1e2e7
	.xword	0xb3b98cfce40607af
	.xword	0xe9996be02de1ffff
	.xword	0xf1b2823a8e0e4077
	.xword	0x415e3d40cda116cd
	.xword	0xe9f9ee51e0caeb22
	.xword	0xaa5283d2f73e62c9
	.xword	0xd8c78c9af188c33b
	.xword	0x7cfd5a890e4c2af8
	.xword	0xdb2741fdbbc83ecb
	.xword	0x7f36f25940190d7a
	.xword	0xcbdd72be7187f0ba
	.xword	0x18ed2303fdec63ca
	.xword	0x5423c0906507c528
	.xword	0xfdb2dcaac47451c9
	.xword	0x1069c20dd7e6508f
	.xword	0xb19e3bac0298e47a
	.xword	0x2f7650a1b9337175
	.xword	0x2d63411ffce5bb76
	.xword	0x679351c7bc00cc5e
	.xword	0x4e98ebcc33e1cd81
	.xword	0x92f38e9763e90843
	.xword	0xe8697a3c99f220c4
	.xword	0x0f8243dbc2a5eef5
	.xword	0x91c4d264f1338f51
	.xword	0x1414352527df2f80
	.xword	0xf9dfcb224245b59a
	.xword	0x1a9eb028eee3ccaf
	.xword	0xb714c852919e618a
	.xword	0xee025035ecb91de9
	.xword	0x58f1b730c896285f
	.xword	0xa81eb3c0979a36df
	.xword	0xd96ceb860467e245
	.xword	0xca45b34220949237
	.xword	0x24302f3a43b6781b
	.xword	0x4b5caf899bd7736d
	.xword	0x2481543cddddebc6
	.xword	0xf7afde170ca61635
	.xword	0xb426542d10e1aeb9
	.xword	0x34a1d464dee9c3d4
	.xword	0x425588381e3f7371
	.xword	0xe0b0826ecfdc2c41
	.xword	0x890df77ea05c20db
	.xword	0x7641f5c220205617
	.xword	0xbc0c34a7c0a44717
	.xword	0x6f4216ce758702d2
	.xword	0x9e4cfca10304c613
	.xword	0x6cb755dedac0831d
	.xword	0x9bcbcd3aa1ca4e74
	.xword	0xc5e03c1cf67a6147
	.xword	0x7557c11b82dd0345
	.xword	0xc9f48482a1782265
	.xword	0x89e0d6013a7b714b
	.xword	0x0fd0e3987de8f528
	.xword	0x1efbbc813520e376
	.xword	0xc3e071426d55c8a0
	.xword	0x82a103edfa937378
	.xword	0x8dc230cca441b334
	.xword	0x44411779fa00465b
	.xword	0x99f6db8dce4ebf0b
	.xword	0x5b9dc80fd53b6109
	.xword	0x17de9122ba252a40
	.xword	0x270388c90b09f335
	.xword	0xe17e2440e9853500
	.xword	0xb1a9ff409a1f2bff
	.xword	0x8db67a3f4a94f713
	.xword	0xebff0655abdefb45
	.xword	0x58f1067fcbc1ad88
	.xword	0x14e958937bf3d6f0
	.xword	0x054b5573c1bcb941
	.xword	0xef87019a488f6554
	.xword	0x18698bb3364decf6
	.xword	0xba1783d1affa780a
	.xword	0xb77f0888912214b2
	.xword	0x9d34d2ca218b1c00
	.xword	0x5e6fd3be5336d443
	.xword	0xcf0ef876d4c8f2fd
	.xword	0xc6e206305def1c47
	.xword	0x32e65668e7da4b2c
	.xword	0xfcf0ae7b491b253e
	.xword	0x83db05c5f79b8262
	.xword	0x5041a28f37d3d0cf
	.xword	0xba062267328c2281
	.xword	0x91146b86c8f70daf
	.xword	0x0eb7ded5d615d6e0
	.xword	0xa744edfe945b0bf2
	.xword	0x216784e883bad04d
	.xword	0x10de8c884978ac4a
	.xword	0xe48eb9c5b62c7b74
	.xword	0xb16115ef26357638
	.xword	0x0b68fc41f8ecc723
	.xword	0xe8aca2e89582dcd5
	.xword	0x2750b1c9d2eba846
	.xword	0xb7fd92fe5427c810
	.xword	0xcfd4200bfe9b293a
	.xword	0x6146e666c32bc3fe
	.xword	0xd249eca6fd68ebfc
	.xword	0xa158986615a7ff8a
	.xword	0x15b0a45dd7523c88
	.xword	0xf9f50870ff0af404
	.xword	0xe9a6ecef3d35bdb0
	.xword	0x386f47a75e5c655c
	.xword	0x53e8a28a1311e094
	.xword	0x1cce6e6a90134289
	.xword	0x24a03312bf2741bc
	.xword	0x581e23f0ac76e656
	.xword	0x914267da03fd639f
	.xword	0x063374e91878c28e
	.xword	0x16d98445c6a4f94a
	.xword	0x586c0bdbc1f7bf41
	.xword	0xec8dd3f502a5479c
	.xword	0xe4e79e92c50e425a
	.xword	0x0f75c2e58488697f
	.xword	0xcebd97e9071ce8c1
	.xword	0x2a542ef18d8a35f5
	.xword	0xf8f69b21293b4978
	.xword	0xf67202958e35cd55
	.xword	0x97010810d25cf591
	.xword	0xa62340023cd32037
	.xword	0xbeb55e15ca191889
	.xword	0xb1073659c347a669
	.xword	0xce509b7213d52d37
	.xword	0x38fb5b968bb79690
	.xword	0x51d495b9cd11588f
	.xword	0xca6f934cd2cd47cf
	.xword	0xd8a3e894292a9d95
	.xword	0x30e44bbdf3212b0d
	.xword	0x2c4a84d5b15764ca
	.xword	0x9d3824698fcb0828
	.xword	0x50159ac7c12c8a76
	.xword	0x3d09e779bddff437
	.xword	0xf3ca505504a03c35
	.xword	0x034018e5675fc40b
	.xword	0x23d8f5df0249dc90
	.xword	0xdb848d9c031fce3c
	.xword	0x8af6e5546c01e7e3
	.xword	0xdb2732a8c271e178
	.xword	0x57d60373ee469307
	.xword	0xa595c6987d2c2b8f
	.xword	0x1e8858007719af79
	.xword	0x64058bf109e0faf1
	.xword	0x2bc17a74accffc14
	.xword	0x6f006d12161ca885
	.xword	0xa09aa5a9c120a95b
	.xword	0xc95740a1725e34dc
	.xword	0x7bbc703a314407c4
	.xword	0x7f37af9bb5eb230f
	.xword	0x7cf587e998cbd863
	.xword	0xda8601af7e1f9db0
	.xword	0x8ada9b48be34f795
	.xword	0x288e7472e0a5a7a3
	.xword	0x7826260ce37c2042
	.xword	0xc4ea9763fc7d3381
	.xword	0x9d31a913c97d3fa0
	.xword	0x222c4d4e8183e95a
	.xword	0xe890f46e8a0b3fd4
	.xword	0x5ba641527cc0623a
	.xword	0x731287c54f2d9955
	.xword	0x9611aa03927561c6
	.xword	0xc82e7e40e58b87e4
	.xword	0x456af8fd6d398486
	.xword	0xebe302e2ae0b2283
	.xword	0x91302d90c325ae06
	.xword	0x0d78b28bc757a7bb
	.xword	0xc19f25a35dcafa09
	.xword	0xc8136e530468b36a
	.xword	0x5dbd013027988b4f
	.xword	0x78eb445ef71cfa55
	.xword	0x2045500b2fad9e10
	.xword	0xa1962e6afa883916
	.xword	0xade227b6e2bdc93f
	.xword	0x56be734345db3d69
	.xword	0x5a9656a3d3e7fa30
	.xword	0x93c8c7fae88245fc
	.xword	0xdf32c62d964346f9
	.xword	0xae40909774da2e2c
	.xword	0xd02a6231a1d0ae15
	.xword	0xe92edfd08d4ccc02
	.xword	0xa7fc0d31a46ccf10
	.xword	0xde8ebb972201d300
	.xword	0x70da3cd2b86910d7
	.xword	0xdf3933ce9e38ea27
	.xword	0xd103f7c0a9048914
	.xword	0xe260f45d5f996e1f
	.xword	0x5fed7fb81498f5a7
	.xword	0x1b5a6e61e12da04a
	.xword	0xc2f1291d08d3b5c4
	.xword	0xcbe33381a24d65d5
	.xword	0x38be97eb1d066a28
	.xword	0xabdae18fc96aa4d1
	.xword	0x57fbfdb39113de95
	.xword	0x0df83cac12bac935
	.xword	0x53163f8411d574fb
	.xword	0x81d1691fd4478ef3
	.xword	0x9f7dae71cc6812eb
	.xword	0x02f1ac2c998471be
	.xword	0x5049714fbf15e9a0
	.xword	0xfb740b851176dbea



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
	.xword	0x884b13097a9cce9d
	.xword	0x588bbb5728d8344f
	.xword	0xfa484aa71bd39baf
	.xword	0x110c74b65c64aa29
	.xword	0x7152dbdaf04fccb4
	.xword	0x6556c85b62ca2245
	.xword	0x647335b8b2c29f07
	.xword	0xeabf20bd7dc5a86a
	.xword	0x45d3b7d3e9d66b7a
	.xword	0xf4c19a19acd3a1e7
	.xword	0xc43b1482d90aca73
	.xword	0x0679cc560f4a70d7
	.xword	0xb1c94c6012085bee
	.xword	0x2022020ef672b64d
	.xword	0xb495bd2f5fb6ee19
	.xword	0x7b7671ef9a8d14d4
	.xword	0x694a45cd7a98cfa5
	.xword	0xa2b1c48ca26639cb
	.xword	0xbaf99df593d3d44b
	.xword	0x32d6486976fb25d3
	.xword	0x4419e3c369eadb81
	.xword	0xa7017328efab3068
	.xword	0x1e97d8ef2c776591
	.xword	0x1d8854dc8840a53e
	.xword	0xc647bc8a1253fe49
	.xword	0x02fa235e38c9b4bf
	.xword	0x72f24a09c0a803e8
	.xword	0xfc3f4a265219dc93
	.xword	0x168f9fd095af09f5
	.xword	0x66478cbac184e4ab
	.xword	0xe52663dfd2b1bcd1
	.xword	0xa4a402d41501a941
	.xword	0xf15cbfcdb777c1f6
	.xword	0x9612a7c2edb08eeb
	.xword	0xc34a73c28d8c2e75
	.xword	0x2949a91a467cd621
	.xword	0x416e45f8ed496e03
	.xword	0x0290453d5b7b12aa
	.xword	0x0df78e46400d60c6
	.xword	0x04f58f1c83bc9508
	.xword	0x36241e4da7c2b029
	.xword	0xdd44d393bfa5e96d
	.xword	0x1697149a0e06d5bc
	.xword	0xb761fc4c397ac58b
	.xword	0x79ca01c4a21dfe8c
	.xword	0xcf53582d89b68bc5
	.xword	0x34b6cd78ecd58306
	.xword	0xd9d4509bcdb13a80
	.xword	0xb7642019686d9324
	.xword	0x1117016f2ba53b0c
	.xword	0xcf23efb70cbc581f
	.xword	0x10b288f71cf1cafe
	.xword	0x9d4a52ea21fa847a
	.xword	0xba1018e119b086e5
	.xword	0xfc80ef87ae52bbc7
	.xword	0xa50bed3a395e3ae3
	.xword	0x8f21f51eff271383
	.xword	0xd54e056bb3bdf0b0
	.xword	0x2baf41af5d602fd0
	.xword	0x10e95918894c3e21
	.xword	0x19260e660f35bb8f
	.xword	0xe06dfd01ba1989e6
	.xword	0x2abe9369453a5669
	.xword	0xe784639ded0b88fb
	.xword	0xc9a97b0eed66dbaf
	.xword	0x586b234b498ef24a
	.xword	0x1897045a7d040d3f
	.xword	0x48cb7b4c12bf0647
	.xword	0x09064f87b17fc864
	.xword	0xaa7bab5d236f1b31
	.xword	0x745a41a4df511b9c
	.xword	0x02ecb4059c6c3a11
	.xword	0x99f4011accc51969
	.xword	0x4829029f21a4132a
	.xword	0xfabe6931280e7d60
	.xword	0xa3fb79d7d1a1bcde
	.xword	0x8b494c22a34c4867
	.xword	0xac22693c028c7869
	.xword	0x507aa9794aad1f9a
	.xword	0xafed496228847e25
	.xword	0xa9d58a542936575a
	.xword	0x7238bd58541fbd07
	.xword	0x00046b7aa456e43c
	.xword	0x7c38c8c1488c5a8c
	.xword	0x05d92d747086bde3
	.xword	0xa0cf6da70ad89f98
	.xword	0x5568d55893a9d3ad
	.xword	0xe150151cebac1157
	.xword	0xbe9684e63bc41e34
	.xword	0x2b5d53d140ec8314
	.xword	0xa7577dfe0616d0d2
	.xword	0x226ce2c0f362b151
	.xword	0xf3c4e1b1309da3f1
	.xword	0xb1b72469fd2e97e3
	.xword	0xeac115289fa03df3
	.xword	0xfdab2a5e662829b1
	.xword	0xe950cd85049ccaf1
	.xword	0xa76bebd21c968214
	.xword	0x0dc814adc9e5c59c
	.xword	0x19cd9ed95e7a15e1
	.xword	0x59f65b43c972b7ce
	.xword	0x9264838110c131d7
	.xword	0x8a3517364e72bacb
	.xword	0x9a2b5108956cef4b
	.xword	0xbd8028f3550e1ab7
	.xword	0xb113102c2f1ef394
	.xword	0xbd695c1627e7b3b5
	.xword	0x08005e3e809053fa
	.xword	0x82127b18ebef44d6
	.xword	0xdea39228e1afb6aa
	.xword	0xcf30cae7407a88f3
	.xword	0x62b6afadda190fc8
	.xword	0xfbc815f12c4e9068
	.xword	0x5ca81715ff2e89be
	.xword	0x1edca14f89f4feb9
	.xword	0x2b1075d616b7a8ab
	.xword	0x110e1c86a5269426
	.xword	0x7166c693e7590911
	.xword	0xf4eccff324cfd046
	.xword	0x2f60db3ba55cbb64
	.xword	0x1e6486a0d0bbb591
	.xword	0x8512ce3194d3bec9
	.xword	0x5deec5cc790f9525
	.xword	0xd83d59d59c765d8f
	.xword	0xf7085ab4ca320195
	.xword	0x94bd58e78d76eab5
	.xword	0x9a65e5e7101fdb94
	.xword	0xaa8207b716ceab7b
	.xword	0x5544497cdbe047a0
	.xword	0x2f3a31961b258365
	.xword	0x035c3005f742ee8d
	.xword	0x8926d9940e5a7d7d
	.xword	0x1fb28aa63e1b459c
	.xword	0x6c7ad32558204e97
	.xword	0x8a042682e2c1ed32
	.xword	0x5586916819a6a7fb
	.xword	0x6601f7baf1b58133
	.xword	0x4e4661469e6f771a
	.xword	0x232315796b0536b0
	.xword	0xc0168212603b0aef
	.xword	0xe4ffbbe0f4e2e6c0
	.xword	0x21ea564e660b6060
	.xword	0x7162b894ebfc60fc
	.xword	0x88d2daced0db60c6
	.xword	0xf331270a649a5de4
	.xword	0x65e8ad369956b53b
	.xword	0x31f2de157f627f10
	.xword	0xeae3bca1c94fe894
	.xword	0x09e7fc3b6c71e0cb
	.xword	0x3de70bf65165ae6e
	.xword	0x6c822cf5d74c2f5d
	.xword	0x9803daa2378941f0
	.xword	0x9d98013a5031697a
	.xword	0xf3717462a3d1c0c4
	.xword	0x8b564ac1e93f0642
	.xword	0xb2d8445c21fdd085
	.xword	0x0f6aa1a143ffa5d1
	.xword	0x83a3ab5c59d2fbb0
	.xword	0x07be6ecef2e89b76
	.xword	0x5c13b4001987f8c1
	.xword	0xe0e211d37c3b786b
	.xword	0x18d69ed9100dde0f
	.xword	0x6f36f173fc6d00f4
	.xword	0xb78da599670c92d2
	.xword	0x05f67417e91cabee
	.xword	0x50b6875c22ca3606
	.xword	0xd5a87d1c70d357ee
	.xword	0xacc6d3e8b9f0fd06
	.xword	0xebf434b73240b6a7
	.xword	0x52e8e742b6cc219b
	.xword	0xde9aadb4d969f7aa
	.xword	0xe136d06c624e4ee6
	.xword	0x2aeb171695e92af3
	.xword	0x78793d74b5502563
	.xword	0x74c0c52450a5e321
	.xword	0x1ad89d102d293a34
	.xword	0x991a44d69e53cbbe
	.xword	0x4e7f6dc7e0e8f824
	.xword	0x37c3fda8d9196bb3
	.xword	0x189514d224476d40
	.xword	0xd5a0b1a83844a1d5
	.xword	0xc470321822729f4f
	.xword	0x8f6a1064f67ecdbf
	.xword	0xad234cc02eaf3752
	.xword	0x0bd7352ce27be1f3
	.xword	0x22e985354b4cdd97
	.xword	0xe27e09e660b4a9c7
	.xword	0xf542786109ad9b8c
	.xword	0x3c68dd2fe3edd8b5
	.xword	0x0304e6413ab6377f
	.xword	0x4421cb69127695ea
	.xword	0x1d8188b5d454e431
	.xword	0xb33d64f35f57fee2
	.xword	0x1cd0eabcb7901587
	.xword	0x43c334bae1022c1f
	.xword	0x0f40dfb28b3c8b94
	.xword	0xd0ae7826806e7169
	.xword	0xaa3d6b0604510122
	.xword	0xa1e8ff451265b61c
	.xword	0x1edd40917cbc79d8
	.xword	0xe3a59297bdf63119
	.xword	0x8e1e766797372bca
	.xword	0xa2108c7dfe43709f
	.xword	0x21abdf470b84b8e3
	.xword	0x67dafa1431cbc5f2
	.xword	0x66222cc184104d90
	.xword	0x77f9ac89205cf10f
	.xword	0x32c10ef69e23a378
	.xword	0x24d5fdd0e567eede
	.xword	0xf7f13ac15d2ed612
	.xword	0x6056eb63242a6e00
	.xword	0x55ba0b40d41a16a3
	.xword	0xe0fad1671c7a0e1b
	.xword	0xbc1c8381a46175f7
	.xword	0xd0ed9657e764edc5
	.xword	0xed5b309719ff4432
	.xword	0x544812359604828d
	.xword	0xf284c2b18952bb2e
	.xword	0xe15f89caec688b82
	.xword	0xd507b70682e9495f
	.xword	0x796d27be574957e9
	.xword	0x0b69b63b18895bbd
	.xword	0x476a80cafdc59bd6
	.xword	0x33b209a9432e69f8
	.xword	0x8514cf13f430b0e2
	.xword	0x1850b0dd8b9eb40e
	.xword	0xdecb10a17117a157
	.xword	0x864ace2c11d3d507
	.xword	0x7b2e1b6119c5a01b
	.xword	0x6d9ae33b45138104
	.xword	0x2adb7f0a5a1da817
	.xword	0x7e1eccc06b90fc73
	.xword	0xd12af1365f8c1e25
	.xword	0x6b4ffb89fdcf76ac
	.xword	0xde76da5153017205
	.xword	0xdd6bf41db2368193
	.xword	0x284d3d2c2be108cb
	.xword	0x914c4c3767ddb89c
	.xword	0xf9166d78fd4cd69f
	.xword	0x30f34a7b115e8684
	.xword	0xa161d2b5beb00a19
	.xword	0xcd4b8e5f5a7bb2d9
	.xword	0x6b774d472f9b7f2f
	.xword	0x61723490a451df3e
	.xword	0xdec3986c8bf4f491
	.xword	0xeb0859e9f7e0473e
	.xword	0xf52531d30fab4ddd
	.xword	0x8c9297266bdeb000
	.xword	0x44088918f58bc8ba
	.xword	0x403dd3f6b54e8fff
	.xword	0x5d439780377e4885
	.xword	0xb2353bc5ce711d90
	.xword	0x497e0bf6ae345125
	.xword	0x360fe220f716452a
	.xword	0xc4471aaa9083b85b
	.xword	0x69bdef1906d2d9c1



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
	.xword	0x50f721e1278d376a
	.xword	0x2322382876395936
	.xword	0x16074be5b4f6277e
	.xword	0xd810536ca825d332
	.xword	0xef1135705966305a
	.xword	0xabd51ecee41f00f3
	.xword	0xd5302cdd84a23e4f
	.xword	0x600783c188dd054f
	.xword	0xd9258d243bb724b1
	.xword	0xf685182c20aeb04a
	.xword	0x6ed4040276666fac
	.xword	0x325b994479451b1a
	.xword	0x4a3722aa319dc8e3
	.xword	0x32944dcc48d00b7c
	.xword	0x29360ab672c92a9f
	.xword	0x7d482a8b9a3a36e5
	.xword	0xea2a6af6d0120556
	.xword	0xc69f9a25fa2159cd
	.xword	0x11fd1c8905abe078
	.xword	0xf8970b637617bea2
	.xword	0x97a807964c5348f7
	.xword	0x3ec64b4b01887acf
	.xword	0x08f51dd2477927cb
	.xword	0xcc84a438754ef061
	.xword	0x95da899f0c844554
	.xword	0x956f27ddfedfe97c
	.xword	0xd27820ce90ae6444
	.xword	0xf1ee7e86db29614a
	.xword	0xbe0b27d9e29ff1bf
	.xword	0x6d9a2022448639db
	.xword	0xcf9c8ff905d0fd95
	.xword	0x071edcf2343a32f7
	.xword	0xbd5c61f35084a429
	.xword	0x53231e1e30ae6165
	.xword	0xf8f36dd05b1d166a
	.xword	0xfec7d5d0ce3d649e
	.xword	0x04436b66afb22fb6
	.xword	0x11bb799cee02042d
	.xword	0xdf37e0195eabf716
	.xword	0x8c009c66b466b1e0
	.xword	0x0672fbee78692772
	.xword	0x5971264f19aaef19
	.xword	0x90c18d8bf1f60b43
	.xword	0x148e1b1df82600da
	.xword	0xac5cc43689f11169
	.xword	0x5cee0f2c50e18831
	.xword	0x395395e31f288faa
	.xword	0xfceca2617fa84b8f
	.xword	0xb7707bb4879f5a74
	.xword	0x61bcbf1fc3511de5
	.xword	0xb65bf0764d956b6c
	.xword	0xbf4bbfb105840dd8
	.xword	0x56dcaec2a3613449
	.xword	0xd48575fe55fd7773
	.xword	0x525fa18ba0898b1a
	.xword	0x538d3ed3024d07e1
	.xword	0x3536b2d202495bd4
	.xword	0x3675533ead9c7f87
	.xword	0xe17f72ae014591b8
	.xword	0xf86017f502f27338
	.xword	0x1afcb837d83231e0
	.xword	0x63effa914e48e3ae
	.xword	0x7ba60b4224b88576
	.xword	0xf3fd3f1f539a5e30
	.xword	0x0f8d537f7f071d27
	.xword	0x5e967a2922d0913f
	.xword	0x835d2a00375fa9fc
	.xword	0xebbf71af1932e10f
	.xword	0x106324012459abfc
	.xword	0x82276cb7feee0d52
	.xword	0xcf3a4a2922e31ce3
	.xword	0xc4289afd80ef24dc
	.xword	0x8693f967d93e4d93
	.xword	0xbfffb00d90a868df
	.xword	0x38a110fee50902b8
	.xword	0xb40d255f8d3f7b39
	.xword	0x379a9db19191e329
	.xword	0xf1b1df8b4a706065
	.xword	0x21ff4211a7ebcb1e
	.xword	0x862c6db47c54c682
	.xword	0xf82fbd9083f4aac5
	.xword	0x0a4e9fd36d4e597f
	.xword	0x6a94c7e3a22fd950
	.xword	0x6e70fbc256f2f902
	.xword	0x78ed4674b9c6cce2
	.xword	0x8dd03c06bc9c0b5f
	.xword	0x7ad21b700a050e40
	.xword	0x212d0a23f9f18227
	.xword	0x76cd4d169da18ad9
	.xword	0xe63247a34ca7e0b2
	.xword	0x2df15bae586442d8
	.xword	0x46d6bdd4ca8d60a6
	.xword	0xf0520d1a6d54b733
	.xword	0xdcbca2197c255897
	.xword	0xa869e6be9ecb8ee1
	.xword	0xb4c0c7d5c027f4f5
	.xword	0xdb59a1547d3fbbf7
	.xword	0x9bea9add0275caeb
	.xword	0x0f675abca6a85310
	.xword	0x79c6f5a57f21bf5e
	.xword	0x3be27b6fe3555187
	.xword	0xbbf6e132160c81fc
	.xword	0x8bc7c658c71bf9f7
	.xword	0x1534e6ff5e60dde9
	.xword	0x6e27092d6597eb18
	.xword	0xf5438d30e1b709ad
	.xword	0x8fbcdd5fbfd78fa7
	.xword	0xc4e15ea1cdb8d227
	.xword	0x1fb77e24bbf8b583
	.xword	0x01d330c6fde9a2b7
	.xword	0x59b411073b73e0fe
	.xword	0xe38d2f34c6ae493e
	.xword	0xbb1bcfe3cd60436b
	.xword	0xe3cd98c228aa62d7
	.xword	0x8ba1bb777402ff0e
	.xword	0x00e61542678821fb
	.xword	0x3b2b868e965d76e7
	.xword	0x58aaeee505d0615b
	.xword	0x0a1893a2d6023af5
	.xword	0xda6f1d2548e71973
	.xword	0x5d48d3b02a6afb8d
	.xword	0x9401ecfdc4c149ba
	.xword	0xbb803f9da114c465
	.xword	0xbf934b9ed33fc7cb
	.xword	0xb98a1f0452485744
	.xword	0x4da5826cf1e395c6
	.xword	0x497d4d84c506203a
	.xword	0x470152e4cc82f63d
	.xword	0x010df788cb54b118
	.xword	0x68de4c4feb1fbacc
	.xword	0x95cbe7e0df7b54ac
	.xword	0x772be8d7992fec23
	.xword	0xa36ccfd2a91b21ad
	.xword	0x09298c3930b97dc2
	.xword	0x3ff4fb30f838257f
	.xword	0x9fb33f785056d20b
	.xword	0x22f2dc1e1926e95c
	.xword	0x0fd6f492cde41503
	.xword	0x64333640061341b9
	.xword	0xfcec0eb814b7e64f
	.xword	0x7c8d3eb655ec7c0c
	.xword	0xdc17d7749b80ac3c
	.xword	0x191ad04662b18d68
	.xword	0x8a2203a32856df9f
	.xword	0xe7263d39d692a862
	.xword	0x643f736d38c1f586
	.xword	0x6682abe2850af3fb
	.xword	0x1b3c05df17bfd053
	.xword	0xb4fa64178838d98c
	.xword	0xfb578577d57ee1c1
	.xword	0x97e840193cf96b15
	.xword	0x53aca8a1e71537f7
	.xword	0xae1725b36ba0a4f4
	.xword	0x33336a55e0c1dcbc
	.xword	0x69105d9c927a9089
	.xword	0x870d3efd149908cc
	.xword	0x17ca2d1e0f3bbd02
	.xword	0x9707f8984ee91925
	.xword	0x69ee1fcaa675276d
	.xword	0xe476b39c700e7970
	.xword	0xe42ee679a0a196e5
	.xword	0x244dccd411d01894
	.xword	0xbbe957db7139b411
	.xword	0x3af73d0f4ed7d602
	.xword	0x3860ed20ee7b1608
	.xword	0x15c8071790abe323
	.xword	0x8cfe4d00a3bb48ee
	.xword	0x12a9f1152ae4d9ab
	.xword	0x0480471d96369793
	.xword	0x30b4555f68686bfe
	.xword	0xc41f3097db3326fb
	.xword	0x39df8c93b5dcea81
	.xword	0x194ff8fb01443646
	.xword	0x18731aa08fd06c77
	.xword	0x1f0a5f461d60fbc0
	.xword	0x360559f4ec20e301
	.xword	0xb9286e2b8f36e9a2
	.xword	0xde3c28ab1e37ec93
	.xword	0xa7d846e030061633
	.xword	0xef50b6322fe44bd1
	.xword	0x41771947d59baf95
	.xword	0xcfe695f209f11837
	.xword	0x9df338d4172613bc
	.xword	0xf9e879847841d2aa
	.xword	0xe24d7682c78805f5
	.xword	0x8a116612bf0aaa83
	.xword	0xbe5a630ca57e1971
	.xword	0xa5fe5b10bc7ef9af
	.xword	0x8fc48b3fffca5e2a
	.xword	0x8554f19eba04a8f5
	.xword	0x95833d4d61ff77a0
	.xword	0xf1c4460d3dc3c695
	.xword	0x5182a8302b0f2709
	.xword	0x1284511ceb8f7615
	.xword	0xe7013d24ade1ecf6
	.xword	0xd9812be901308da2
	.xword	0x7d8654d29f1eb39b
	.xword	0xe802c29c98bf2177
	.xword	0xf555597bf94751fb
	.xword	0x37e9cffec5c57590
	.xword	0xbbe8cf371fd68076
	.xword	0x92750142f8337da7
	.xword	0x84333ede63ad16d2
	.xword	0xb516c13e82af7f58
	.xword	0x55502571b18c01aa
	.xword	0xbf549d9e246c71ce
	.xword	0x672a35d57e90bf70
	.xword	0x052057b94caf718f
	.xword	0x59321b921a1a2bd3
	.xword	0x33020879b42481b2
	.xword	0x1ae292d4b72f0ebf
	.xword	0x37d559384ea61c19
	.xword	0x4355f6ea53526add
	.xword	0xec6261dd0b6ce018
	.xword	0x8f75bac3889ea676
	.xword	0x22d65f4a71c329b6
	.xword	0x46c8c25d064eb8c5
	.xword	0xd0c7bd23af10946c
	.xword	0xdeb0b5044d41f4a7
	.xword	0xbe78e2e385f9f602
	.xword	0xb76a0fb088be33d3
	.xword	0x4663f7b1e15a01a6
	.xword	0x4eaa33f246f0ae9c
	.xword	0xafaefe37857200bc
	.xword	0x113ca61e1cd6d39c
	.xword	0x692cf66a87d077b6
	.xword	0x7ef53c8e44e446fb
	.xword	0x0b2bb518e825a870
	.xword	0x8f240a11be2c7d9e
	.xword	0x615825f818c7fd5d
	.xword	0x40749c889a9004f1
	.xword	0xfb9b5bb027091914
	.xword	0x87c5628846626c07
	.xword	0xbda2a67dc27e61a3
	.xword	0xea91db00780a8bb1
	.xword	0x4b54287d5da8f95a
	.xword	0x3e0a9558229ab4b6
	.xword	0x3a55121189a12230
	.xword	0x6f7e3c220910543c
	.xword	0x066706709477befc
	.xword	0xabb6fdaa8131dc75
	.xword	0x5adb258ee16c5e95
	.xword	0xcd23b02cb4444b25
	.xword	0x7f64188ade04f71a
	.xword	0xf120cbfe0630d243
	.xword	0xff8d8a6fc9650d94
	.xword	0xeee500697ee4e287
	.xword	0x264568af13fd186d
	.xword	0x3c2c48252fa5e947
	.xword	0x34e773ae9c34020d
	.xword	0x86a665d6d39c6b61
	.xword	0xde615f2b5ee20527
	.xword	0x6f7bfa2dfdb4bbb3
	.xword	0x6a5661e4f73e0f2f
	.xword	0x8a46a636d52bb702
	.xword	0x754bd775f79644c7



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
	.xword	0x12594efb9e1ea5dd
	.xword	0x622025b2424d817a
	.xword	0xdaf67839ecdcacc4
	.xword	0x83e157dad6adbd71
	.xword	0xbe96e8f93b66f254
	.xword	0xeab344f5b6aacd4d
	.xword	0x5c5eb7c79da484d4
	.xword	0xb3af4375c7fbeee1
	.xword	0x6302e4ee152d79ef
	.xword	0x2bed62ef5326af9f
	.xword	0x9ea79b87bf43abfe
	.xword	0x1b22026eb931a2c0
	.xword	0x1e48856a842567f7
	.xword	0xbbbbd630f3daa852
	.xword	0x39f8d79ceb0e9308
	.xword	0x9d750a3491cf0ebc
	.xword	0xaad5c2a8bd6b3813
	.xword	0xa83504771e56bc79
	.xword	0xb87b45368f84fff6
	.xword	0xe03748d082b2bd4f
	.xword	0x43bca910a4cb6907
	.xword	0xa33aac61d2fb2a1c
	.xword	0x3d5e05282c53bd8e
	.xword	0x091afda9bf13bd81
	.xword	0x085481e2d023ac40
	.xword	0x69b632320ec1eca7
	.xword	0x4469bd5c7407fa3f
	.xword	0x2365f8d145e96db9
	.xword	0x47c76eeeee8e879d
	.xword	0x9f4e51431c906e07
	.xword	0x911dfbad03b18693
	.xword	0x9ec72ddbf0e12b19
	.xword	0xf9bfc99bf838ea01
	.xword	0xf7db88c4146560ed
	.xword	0x72217f43d8d393b3
	.xword	0xdb5495004a304682
	.xword	0x5210f9517ff83543
	.xword	0x26171cd4367cc9e3
	.xword	0x8f7475f0829f79a0
	.xword	0xdb9a02ac12ff46ef
	.xword	0xa4408f7a536b0965
	.xword	0x2dd7dc91cd079c2b
	.xword	0x7faadb3e597227bc
	.xword	0xf258f0acfdf71c64
	.xword	0x9e9391d303d2c0c5
	.xword	0xd05e29ceba786b6e
	.xword	0xa0140007503f9790
	.xword	0xdd3460d161dc080d
	.xword	0xd66ab52c2535c8bc
	.xword	0xd5c1590c4845d1f2
	.xword	0xa630d5bb6156448f
	.xword	0x3c6b7530fb77ba80
	.xword	0xaf306a35dd1ab729
	.xword	0x0d59f40f60caef6f
	.xword	0x07b1ab44491887fd
	.xword	0xadd1cb6233ad3141
	.xword	0x03648f51eb4b5693
	.xword	0x96e81c074e985262
	.xword	0x360ee8be8a18be19
	.xword	0x04face6a07200fd9
	.xword	0x8bd3e65703bbbdb4
	.xword	0x667796cf611e86ee
	.xword	0x7215e8654eea559f
	.xword	0x6a77218880bd2449
	.xword	0x0ffae3155c07dc2c
	.xword	0xf0a745bff2fd3483
	.xword	0x77b4c2b49bfaa541
	.xword	0xf8c9c16f0822cf0d
	.xword	0xa1352d1466ccefdf
	.xword	0x12010b36f7881f75
	.xword	0x214b91e9ed8696aa
	.xword	0x9c7d99aed6b5e617
	.xword	0x9560b653dbc07bae
	.xword	0x0db71aa7a502f6c3
	.xword	0xcbf6fc8c6a7a6088
	.xword	0x78d6cb5ecfcd701f
	.xword	0x7ab21e397a22fe30
	.xword	0xe77542b0c18507fc
	.xword	0x65cc10043c665c09
	.xword	0xa3d7f83b892a68cb
	.xword	0x4bfad13f87fd6ca4
	.xword	0x74e9f0842592567d
	.xword	0x696212b39b9efb76
	.xword	0x1f0a28974a7db059
	.xword	0x28e5efc74f28f6ac
	.xword	0xb260eca67d15556c
	.xword	0xeff6a5fb4faa62e4
	.xword	0xb1346790c0c46538
	.xword	0x694011eae1999b9e
	.xword	0xbba2e2381b619772
	.xword	0x3c3d172984332817
	.xword	0xcbf380106f12e65d
	.xword	0x44fc8183b1f59313
	.xword	0xe288400cccaeb272
	.xword	0x7bd1426cddbd83e0
	.xword	0x686708e330dd0322
	.xword	0x5a6e6823e7f2559a
	.xword	0xeb09601869b877ce
	.xword	0xf75a21aa5ea51e2b
	.xword	0x748dd62252ddb561
	.xword	0xf67009d187b26fe0
	.xword	0x53de009466198512
	.xword	0xd588f8dace5beb62
	.xword	0xb2c6be00421f7b47
	.xword	0x3dbe8a8da141cb29
	.xword	0x79ef96a2e2506b87
	.xword	0x7cc95e6326026373
	.xword	0xe49d36aed7e1a33c
	.xword	0x2e6e52c85d10b8ce
	.xword	0x652162b145a0dc76
	.xword	0xd3abe5392a1b6f56
	.xword	0x15c694acf6ca1562
	.xword	0xbad51e2a4b0a5a68
	.xword	0xe1ae5fae435a57e9
	.xword	0x16bf5f3eda9660dd
	.xword	0x2ef5d5439b83e70c
	.xword	0x110a462c831705b4
	.xword	0x5817ee8f52469b39
	.xword	0x09e9e790c3683596
	.xword	0x634900efc6a3a79b
	.xword	0x421f9b6068bba4c0
	.xword	0xbb42fe04b108154b
	.xword	0x747dc8d0dd0c3f9b
	.xword	0x82cce8a4a2cc6d70
	.xword	0x31f6945a9411161d
	.xword	0x12a6fd0796741085
	.xword	0xd00785c8eba46a3f
	.xword	0x9363dff95a212a31
	.xword	0x3b9ee4ab3686c7f1
	.xword	0xb87ea7334cead6d5
	.xword	0xa6106687073018e2
	.xword	0xf7375c588b28c01d
	.xword	0x207dd2c8d10ba1cd
	.xword	0x16e24102cb9b2203
	.xword	0x7af407a751c42afe
	.xword	0xadb5efa0fd9bbc46
	.xword	0x4f8097c03f6db27e
	.xword	0x2c6b05228a3937cf
	.xword	0xb6afd3ad28188eed
	.xword	0x684d9d34ec832830
	.xword	0x52c87be00aa13cbd
	.xword	0x085c00ad71266704
	.xword	0x28999a566ed2ee9a
	.xword	0xe89b02ed1bf41a6c
	.xword	0x16d5d3a7d244d13e
	.xword	0x8f5473bae7e850f3
	.xword	0xe355760c8b4fdd1d
	.xword	0x37e07b5bc5ad1ba3
	.xword	0xb4dc7bd7646b3c26
	.xword	0x91374b2d0cba20eb
	.xword	0xe4a86ebcaacd67c8
	.xword	0xfbdc7097f32e0ef2
	.xword	0xad1879e33544c067
	.xword	0xb570c28c266fe5c9
	.xword	0x0b47ce8851be45e6
	.xword	0x885ff2a5240a6d43
	.xword	0x1a22e914b761b928
	.xword	0x17718cbf3214cbb5
	.xword	0x9678a30082b381c1
	.xword	0x6354801d0b3047c8
	.xword	0x46246ae3c7202f8f
	.xword	0x4b0484669e537657
	.xword	0x54328b4f890ca5a1
	.xword	0x2d90982423893846
	.xword	0xf9e168ab9ea7bc93
	.xword	0x6844fe48edbd91f5
	.xword	0x96d1f16f8ce0ebbb
	.xword	0x5a16408042c66ac1
	.xword	0xbe453cdf96bf59c3
	.xword	0x3fcfe9f5f3a02f45
	.xword	0x1f3a253324b82dbf
	.xword	0xce83d417d85f6aaf
	.xword	0x84a5c1319d18a310
	.xword	0x67acaa2c319f514d
	.xword	0x684cd534c9a83e03
	.xword	0xc066ffa332bde983
	.xword	0x1d91752f6a162a79
	.xword	0xac7605ff2b98cc9a
	.xword	0x5c2d4e7471658e7e
	.xword	0xd61fa6edd757f741
	.xword	0xed5fbb8fc593c95e
	.xword	0x677407511ce4feb6
	.xword	0x4c839b239a99b88b
	.xword	0x36c2309b48704f61
	.xword	0x142f90fe10f8a505
	.xword	0x57b4e00508779385
	.xword	0xce026282951c228c
	.xword	0x273ebb681630557e
	.xword	0x0b8c38cb62f04aa3
	.xword	0xadf1bda59a915f5d
	.xword	0x59c35c26e7744df4
	.xword	0x4a2cc67d3cdacb21
	.xword	0x767002e0d1511737
	.xword	0xdc437095c11961c7
	.xword	0xc08bcdb9ca8bf743
	.xword	0xc277a59fd17f3153
	.xword	0xc0d4e146def862e1
	.xword	0x93099302a5f5ed69
	.xword	0x0e958cab9287156a
	.xword	0xc4511408c1442e53
	.xword	0x1a132b5c3917732c
	.xword	0x74ca1c08eb918f22
	.xword	0x71ee4d8a12bee1d9
	.xword	0x61328ea74e930962
	.xword	0x00449ddd1eccec09
	.xword	0xee0816946efed827
	.xword	0xa43bb861db81b4a2
	.xword	0xa4461be19f166657
	.xword	0x8923021de4d3bd6c
	.xword	0xe56ac5b8feb0bc58
	.xword	0x5263bc726e3a26ef
	.xword	0xe24de7eab688b9d8
	.xword	0x68bfe12808911225
	.xword	0x077d808b01f137e9
	.xword	0x1068a815f0edf053
	.xword	0x52698f4b7d1cb39e
	.xword	0xc20aa2f9510ce5c2
	.xword	0x8cb51bfb285c13ff
	.xword	0x68dea833bac25bbe
	.xword	0x305c14ace2827050
	.xword	0xfe4352853795bcdf
	.xword	0x8877f85b5a3742fc
	.xword	0xcb8a03fd71e3d487
	.xword	0x09d6ed64dd8ec404
	.xword	0x56f39fd5420e6872
	.xword	0x72751c345ba0625b
	.xword	0xae3de09bd989236c
	.xword	0x07277ad54977a275
	.xword	0x06ee975c327b7aad
	.xword	0xf9ab5571b831fbdd
	.xword	0xc9817c245562549c
	.xword	0xe030ea2efdbe7685
	.xword	0x694813a6363ba291
	.xword	0x50471e9b1da989e9
	.xword	0x11d6793ff5d8aa5f
	.xword	0xb5c1f07ebff66f2a
	.xword	0x06743c66a094a78b
	.xword	0x4d8fced748c4413c
	.xword	0x7f81475c7020d0e9
	.xword	0x314f1ca686ec1805
	.xword	0xe752aa6908c2d5ff
	.xword	0x88d63978c2936e3a
	.xword	0xfc79b5cc4fd37361
	.xword	0x0358089536946ec1
	.xword	0x922296e57edfbe1e
	.xword	0x167c0bf29e9a72e1
	.xword	0x0a2774470ad107ef
	.xword	0xbf12155cbc8361f1
	.xword	0xb647fd40434b9948
	.xword	0x5b3c8a4a7483af6b
	.xword	0xf7e026284accc77a
	.xword	0x5c228bb75d9fdc12
	.xword	0xe42f6e83e1c3d385
	.xword	0x6a8b40a3a64655cd
	.xword	0x62fee42194c3cc8c
	.xword	0xf5468cc366531f27



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
	.xword	0x7888de30b758dd8f
	.xword	0xa6171c776aeff06d
	.xword	0xa60ce3ab46f30dc2
	.xword	0x74381d226d055365
	.xword	0xf598ade7b6ba395a
	.xword	0x25ae0f26b1676fa4
	.xword	0x04798e3e50461fc6
	.xword	0x162bbe9bb10a8568
	.xword	0x93849a64f3c1b0b5
	.xword	0x198b6c04444357f0
	.xword	0xe9976562cf08490b
	.xword	0xbc37581246780302
	.xword	0xd14a7bbe00dfbfa5
	.xword	0x977534ddb2941c28
	.xword	0xab9423936f36b651
	.xword	0x82996b31ad062574
	.xword	0xd429576832d312c9
	.xword	0xc7b96f40f6381adf
	.xword	0xb4368d73f7fd50a0
	.xword	0x90fc9ddc466eaffc
	.xword	0xb572f90c01e03f2c
	.xword	0xa216a500adf6802e
	.xword	0x385a47d8ed4612d2
	.xword	0xfffb29551bd815af
	.xword	0x9674876237b62e90
	.xword	0x6f9d5b695d06d8ac
	.xword	0x129c3f6a544f218c
	.xword	0x79a00899cd2afd68
	.xword	0x9e67f4a57fa04812
	.xword	0x8f18a3baf7306b11
	.xword	0x79ff53a8f29def73
	.xword	0xd4cbc65db42a11d3
	.xword	0xd785dcc40e49963f
	.xword	0x28119ab8425ceb88
	.xword	0x7c7eb84f3ecfcdf4
	.xword	0x2ab9ca0cf81d3ad7
	.xword	0x27896b7ac0c35b88
	.xword	0x1bd22d035ef7f95d
	.xword	0x32b19e648ace7b39
	.xword	0x35918cd1846ec82d
	.xword	0x5eff26a6c668a609
	.xword	0xec9b49afb5130b13
	.xword	0x20ace04d78d2c7e1
	.xword	0xd64aae4bdd3eaca5
	.xword	0x5318beba0e63c8e6
	.xword	0x1bf32bb77f363443
	.xword	0x422c33d9ff82a257
	.xword	0xdaa50a15bd83f8e4
	.xword	0xd1be1bbd8f53cd0f
	.xword	0x480711f0c50a5f97
	.xword	0xdc787d15bdf23e80
	.xword	0xa9bce060b6e81be9
	.xword	0xfd357d9bd24c38ad
	.xword	0x6dd6af48e7fdc681
	.xword	0xcc7d34eaef4b4723
	.xword	0x14f05a537d240978
	.xword	0x80fda05074821b0f
	.xword	0xb5b91ec680e4a9ad
	.xword	0x518c610df96347fa
	.xword	0x4203b29b0ccb75cb
	.xword	0x8f39c38040718f1e
	.xword	0xe138d917e94baba7
	.xword	0xdccb03f29959effc
	.xword	0x7128e314bc06cec4
	.xword	0x19cfac514a688b0d
	.xword	0xd4ce9e66ed46b908
	.xword	0xf46c05fe1a4d79ee
	.xword	0xd455f15225d6811d
	.xword	0x9620cafa3c07c356
	.xword	0x7903b671251d85d3
	.xword	0x7759b68898b92848
	.xword	0xae01778cbead44c7
	.xword	0x47d0c234007b6f3c
	.xword	0x5da635842a513235
	.xword	0xd4c36f1192566240
	.xword	0xe9c6ad32433a770a
	.xword	0x08860d76db753480
	.xword	0xf17268b6c7f3d463
	.xword	0xf29ee1f055e9166e
	.xword	0x8c509dbfa459eca1
	.xword	0xa4938511925c796b
	.xword	0x32eb0c0131e5d38c
	.xword	0xccc4c283a4197552
	.xword	0xcb3a202a155d7613
	.xword	0xe8a7fa7017daab10
	.xword	0x6161057b29bbb499
	.xword	0x71b0ffe4d3d511bf
	.xword	0x18b0d1c62f4ac4dd
	.xword	0x825992889556cb96
	.xword	0x351bba7d9c9eb619
	.xword	0xfaa10bf03b9f2bad
	.xword	0x275a93b20aad8e1a
	.xword	0xebf54db52376b500
	.xword	0x7578355cc39ed091
	.xword	0x29810d5a1812573e
	.xword	0x78c1079e35f253b8
	.xword	0x7f41800624d8828e
	.xword	0x5622c02d9986a9d1
	.xword	0x8aa599c940ae0ac3
	.xword	0x443f56492e7b84a2
	.xword	0xbe776fe5ad5b32a8
	.xword	0xe4ceaf5633e00ae5
	.xword	0xcb1b8a799a35ba7d
	.xword	0xb00b21218c49989e
	.xword	0x6be5afe075a55e9a
	.xword	0x5d1cf787e3de19d8
	.xword	0x0721ae15d5ac0bc1
	.xword	0xd1630650b0af69f0
	.xword	0x070b3015e20cfc20
	.xword	0x783843aa5a608d97
	.xword	0xd17367c76070678b
	.xword	0xe98898580db82674
	.xword	0x194a8b34c3359595
	.xword	0x248bbc096a0bb737
	.xword	0xd16b58805f03a922
	.xword	0xb16826762393e848
	.xword	0xd78719f57ddd2109
	.xword	0xa98a37f1a227a6b4
	.xword	0x5ad93195eaaf9970
	.xword	0x0a9fd81178f4bc64
	.xword	0xece388a6aca22833
	.xword	0x51047bbdfa81e4bf
	.xword	0xee8a2645ea3af66d
	.xword	0xb3fbfaa0ec31edf2
	.xword	0x92c502fe228cfd43
	.xword	0x17b29f22aec182aa
	.xword	0x7bc76caabdef9c2f
	.xword	0x25fe831d1dc3e81d
	.xword	0x81db5b5595082d60
	.xword	0x8d8e0ffaf646a463
	.xword	0x4f6e3219ab0bc065
	.xword	0x8ecfea3ecb0f11c7
	.xword	0x61a0c9ba23f0d888
	.xword	0xc51268ccd8a5cea0
	.xword	0xa7eb2666c7e7ec69
	.xword	0x17fa80ca214c7846
	.xword	0x682feb866b602d89
	.xword	0xb1367b4acbc48247
	.xword	0x6da3177e4be72bfc
	.xword	0xd5fa578525cbb1a0
	.xword	0x5a9869cdb29ed453
	.xword	0x1243568731aaefa5
	.xword	0x9e8f06faf638acb9
	.xword	0x91c814d03d4e5165
	.xword	0xd86c29eefa8a2cad
	.xword	0x0764f3eb175b9067
	.xword	0x29788c2b0f5eeddf
	.xword	0xf0a5429a376c18a4
	.xword	0x70bb4415a484e796
	.xword	0x75fbcde0af49f63a
	.xword	0x2c7d282ab8bca5ce
	.xword	0x99aae2d1e123a69e
	.xword	0x5bbafcad91adab90
	.xword	0xe83015af7340f71e
	.xword	0x4df5769349b7d8e3
	.xword	0x84b62043d684953e
	.xword	0x4116d2ec4bbe46ee
	.xword	0x58dbebfc8a8394e4
	.xword	0x4074196bc4549452
	.xword	0x17cb1c1228d11179
	.xword	0xa2185bc029f844b4
	.xword	0x430c674fb846456c
	.xword	0xb6f01a993ac2dbe3
	.xword	0xe4f7c58f23a753f8
	.xword	0x1ee6d97fa4c63a3b
	.xword	0x1062fd6b59211680
	.xword	0x5e78dfe753e498d8
	.xword	0xec8bf0a5f7dd230c
	.xword	0xb03217cfe4c434cf
	.xword	0x74a0d6586424af52
	.xword	0xbf33d7774efc1302
	.xword	0x4fef0e167be80251
	.xword	0x38ad585b03b7e593
	.xword	0xf8deeb808b40088a
	.xword	0x78100a8f06fa7443
	.xword	0xb28caa6bf26764f8
	.xword	0x503d3fe78d76872e
	.xword	0x14316a5ef960540a
	.xword	0x14be48f19413f67c
	.xword	0xccaf93c2c7a172d6
	.xword	0xae83a5bded27f685
	.xword	0x0a5ebadd4a1b38e0
	.xword	0xf3b7f135dc65e169
	.xword	0xc9ee14e27ade4e0c
	.xword	0x0f70825cefa8050d
	.xword	0xd02957e5e40910ca
	.xword	0xb572544b0b117115
	.xword	0x2886559be4a09906
	.xword	0x765f3acf826770a9
	.xword	0xf1a5626921c597e6
	.xword	0x108dce6527540aff
	.xword	0xbce0828430137b1d
	.xword	0x24f53bc7a1692d04
	.xword	0x8e1e275c1897ed30
	.xword	0xb3093d84a1834faa
	.xword	0x2c1af30eb7b41f3b
	.xword	0xc501af3d88f9b383
	.xword	0x049e2f90004e28c8
	.xword	0x6b8ec2750976bdd1
	.xword	0xd38a813445fb55ba
	.xword	0x36512e96bf8d1771
	.xword	0xf060c2ccea177b91
	.xword	0x72e71ea81f23663e
	.xword	0x3f6adfcd10600feb
	.xword	0xf33cc7bf7a654833
	.xword	0x663459d5ede850a2
	.xword	0x91ae739dcf375028
	.xword	0xb2a9e062a103194f
	.xword	0x7a3ea157b1ef0e13
	.xword	0x0a1f4b8734e43f8c
	.xword	0x386175059d60df1c
	.xword	0x1c36671f3ff7c3b3
	.xword	0x0c9ddbbbb5c018fd
	.xword	0x578c2d5a2d37e26e
	.xword	0xf6432c2bbff3d7d8
	.xword	0x72fb77f0ed59ffdb
	.xword	0xe964bfde49f94a2c
	.xword	0x54fe8b160e903fc8
	.xword	0x2cbaa54bf344be6e
	.xword	0xf14a998cc97cd306
	.xword	0x979a8b9cc0d0e4af
	.xword	0xb8bb276d4c04b93c
	.xword	0xbecc5a8b7fb12132
	.xword	0x7cfb4e7414fff164
	.xword	0x7bb1bf718d321856
	.xword	0x2c80cb4012138c41
	.xword	0x93542bcdf860ace4
	.xword	0xea40b6caa439cc6f
	.xword	0x0e98953b9894b654
	.xword	0x9c87d0d892e4acf3
	.xword	0xa1951d3ae1b2f974
	.xword	0x3413d54faae8dc70
	.xword	0xcf16c1ba2cff6c38
	.xword	0xfab597c64b953b78
	.xword	0x0faa09b01baddaf3
	.xword	0x382ffde82dab755f
	.xword	0x5b87afb84d8f99e6
	.xword	0x5768cac7726a5076
	.xword	0x486557664f6cae97
	.xword	0x33cbb8fb787af53b
	.xword	0xaacb36efff59698e
	.xword	0x7c31fe5a6c872c74
	.xword	0x7b59fbf9de71f0ea
	.xword	0x348c30f10c751e23
	.xword	0xe2a230350e3ddc97
	.xword	0x3e21874763716d09
	.xword	0x90e59ff7c3aae277
	.xword	0xcfb0ca75e620d615
	.xword	0x76ab29f3e9383def
	.xword	0xcd669073d25e10e7
	.xword	0x10b9adbe5b639208
	.xword	0x1a9fd4e3b23c8dff
	.xword	0xf87f52d5b4856d0c
	.xword	0x49b761e99192ad83
	.xword	0xc47d68f57f74d180
	.xword	0x26df96fdd6c23eb9



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
	.xword	0xefb416e30aa06dce
	.xword	0xa7463c94a3379a76
	.xword	0xe30fef97f0030146
	.xword	0x56777a21fdd53308
	.xword	0x3500bcea472a7d0f
	.xword	0x60e44803eca04977
	.xword	0xcac2bad93e753f7c
	.xword	0x784ab5f4d5b9fd33
	.xword	0x743d037984a0ccd8
	.xword	0x71b12f5e51b9e8ea
	.xword	0x83af1e17793966f7
	.xword	0x7760e21d7bd670e1
	.xword	0xec998cecaaad1016
	.xword	0x19008eea48c95147
	.xword	0x36ab7c063b1e84b5
	.xword	0x015c6a072113ff97
	.xword	0x164e4ad8309d22f9
	.xword	0x629bd5e1048569a8
	.xword	0xbbd090f5c259997a
	.xword	0xa9ba7bbd9b81d216
	.xword	0xc02bb8efc216b955
	.xword	0xa4f8475abc8e3785
	.xword	0x261e5582c708bf73
	.xword	0xaab442477b7fa256
	.xword	0xdd48601a25069550
	.xword	0x23d48be2f5aa2c99
	.xword	0x26974a7e42a1da9e
	.xword	0xfcb732813820d971
	.xword	0x15deb29c9cc82e89
	.xword	0xbc7d275bc4fc15fe
	.xword	0x7e3efd74968b85b4
	.xword	0xd7f394d544036350
	.xword	0x01bf2df2e0abe702
	.xword	0x974874ce5ef99272
	.xword	0x6077eb5c5b787155
	.xword	0xe0f8d294e99c6205
	.xword	0xe656485d16fd8ea5
	.xword	0xf1b1161d23765a8c
	.xword	0xe5961cbe8d3ff869
	.xword	0x08adbb36ee18e632
	.xword	0x7b08844fcf2d78a1
	.xword	0x548bbff316c290c5
	.xword	0x6155b8497c57ab68
	.xword	0xc0818d7163c4b302
	.xword	0x7d3f7af2eaa7d115
	.xword	0x929dd91c2e5ea8be
	.xword	0xd4a5d0e6fb775948
	.xword	0x8458de61ec79ddf8
	.xword	0x12b1bde72e3c4bc2
	.xword	0x2d3f604792c358d0
	.xword	0xbcda61a43650222c
	.xword	0x4b6e0140f6ffd8e4
	.xword	0xae81d53aab3c5f3b
	.xword	0xafea2e90b8da8bc7
	.xword	0x386432181b7ae57b
	.xword	0x0723904f0a4c5157
	.xword	0x9ad353314ef94081
	.xword	0xb480b8b14928445a
	.xword	0xbd7eff9d9f3b81a0
	.xword	0x107105fca405bd47
	.xword	0x3dcaa10b42424b12
	.xword	0xb1d3703cd36cb5a8
	.xword	0xa3741e02e9ab1979
	.xword	0xcde2aea6c84c5a08
	.xword	0x8fed202651edf953
	.xword	0x3452f6b793a6b0f6
	.xword	0xa5180c376f511620
	.xword	0xab859d2c463020d8
	.xword	0x42e0082ed94d522a
	.xword	0x2eeb9c81d81e174e
	.xword	0x8dd8968a7e6bd8bb
	.xword	0xcde25ae341419445
	.xword	0x5ef099b6d457f467
	.xword	0x125e0f59bb82439a
	.xword	0x3bd09491db488d95
	.xword	0xe75a9d47380e15c7
	.xword	0xd6d6b604fb438b8d
	.xword	0x445992ee2bc4ddf6
	.xword	0xcee5d04a067da674
	.xword	0xd8cd6fb951c51120
	.xword	0x90e42c5099952cf0
	.xword	0x50901dde49c872ae
	.xword	0x8f8beb8fed4f8eac
	.xword	0xd7244e43133c0747
	.xword	0x9bf49d594d598a15
	.xword	0x1aa5b0cd3907b0db
	.xword	0xbca8960ceee824e0
	.xword	0x15824b6c281fc789
	.xword	0xeb11994d43f22db4
	.xword	0x2e6493727a4056fc
	.xword	0x0b867e849bccf8ba
	.xword	0xff99968a6bb20436
	.xword	0x224c6b88b990cce7
	.xword	0x039687ca7102c054
	.xword	0x7a1e9e833bd77c4d
	.xword	0xf17266928b037300
	.xword	0xd6db8225ae6505c9
	.xword	0xcf52813ba595ea20
	.xword	0x518dbdf753528861
	.xword	0xfb2724487ea770bd
	.xword	0x71f437bd502d614e
	.xword	0x1d8c3714954fff6b
	.xword	0xbd1256d4320d9a20
	.xword	0x0f42f306f6fb581a
	.xword	0x518013fea90b0b0f
	.xword	0x53be3ca6881042d8
	.xword	0x421c7c84c868dfe3
	.xword	0xeeeb76b1b6d6e676
	.xword	0x1177ea82309f8273
	.xword	0x8777d06fcebf4497
	.xword	0x31265268483e8f7a
	.xword	0x52f68bb4aa914e69
	.xword	0x855077c65324e1de
	.xword	0xdb48c08d4229b0c6
	.xword	0xdea9f271c3c8ab63
	.xword	0x75875b7a892e1a6b
	.xword	0x8def2fc488f9dd16
	.xword	0xdac06aaf589d17f5
	.xword	0x28a2970c4d78cd1c
	.xword	0x44c531e8c07b21ec
	.xword	0x580fe1b8f57b08b0
	.xword	0xee76f8d1307fdd52
	.xword	0x79cce2748599246c
	.xword	0xdd46373a50e1aa72
	.xword	0xfc98007b6ceb6129
	.xword	0xd1a1fd3a41010cec
	.xword	0xdca1a239bff59e17
	.xword	0xb98964d73562cde0
	.xword	0x5054787b19e4f26e
	.xword	0x132f3e4b8af9fb86
	.xword	0xf001edc105d78f86
	.xword	0x93fa5f4e48915095
	.xword	0xacd9c1c2acb1f9fa
	.xword	0x18e9ea749f1f6231
	.xword	0x2c053a10d10e155a
	.xword	0x766953f06fe89a49
	.xword	0x1db8e32b1a23665f
	.xword	0xc8dd8e7eb3a2a67b
	.xword	0x18dedaf9cb157840
	.xword	0x6c08e6325db810e7
	.xword	0xc7ae482195121e82
	.xword	0xda076933a3f637c9
	.xword	0x004913f4c8151c4b
	.xword	0xd7143118ab45eb28
	.xword	0x4241593ecde4c3bf
	.xword	0xe9778c21c571b773
	.xword	0xb150921a3c9b52a1
	.xword	0x80c87ac5acf5c0ca
	.xword	0x94f10bc9ce68e2cc
	.xword	0xbaabb33d8a7e868d
	.xword	0xf04792c5c68a493b
	.xword	0x0dde2dcd47388a63
	.xword	0xcab781ec1262a3f7
	.xword	0xebe3afb65947d548
	.xword	0x812b9f664b741a2f
	.xword	0xf32bce57072eaaef
	.xword	0x81087e10223001f2
	.xword	0xea2ebd6e1c274d5c
	.xword	0x0b8034991b33f337
	.xword	0x1bef5107bdf9e10b
	.xword	0x753b36a5ab96c2d9
	.xword	0x495f0f889d71d80a
	.xword	0x1628a9ffd1419601
	.xword	0x1fdc3b412de448d8
	.xword	0x96990c83ce4a9b00
	.xword	0x26b3e5072c5cdb7f
	.xword	0xe51a20045a15c3ea
	.xword	0x47ecd4eef982de99
	.xword	0xced2367824e71f0a
	.xword	0xb4934b69d1d69390
	.xword	0xbea497e69c136b20
	.xword	0x51a8f75950e04677
	.xword	0xfe6e83d62b4cc39b
	.xword	0x096b9fd425f46df6
	.xword	0x9df28c209fb979b7
	.xword	0xb17816b67283df90
	.xword	0x4e17b4a62a6c9a25
	.xword	0xa090903702bc02a9
	.xword	0x319bae4b745c13e1
	.xword	0x2c56c1efaa20b7ed
	.xword	0xe24aac3619a57f3c
	.xword	0x2b534096bd5e8d54
	.xword	0x36341e031fd50e23
	.xword	0x3ba572f5e5a7351a
	.xword	0x0af3d6814f4d4f53
	.xword	0x43618d08645b0284
	.xword	0xc4cd24e7a64818ff
	.xword	0xca873445dedaba23
	.xword	0xf03b9a759a7edb4f
	.xword	0x09a4e306c2da353a
	.xword	0x274b4c1a735c3476
	.xword	0xfc50933d799b866b
	.xword	0x1dba850a38d3b3e0
	.xword	0x083ee9993f6aa9f8
	.xword	0xca380f5e272c4784
	.xword	0x5cf630de46e96777
	.xword	0x20a3afb222929d92
	.xword	0x76ac8781a1e51e41
	.xword	0x47db984b44a049db
	.xword	0x4ea976c05cd8dca2
	.xword	0x23cec88f77b711ac
	.xword	0x4e7f051f0b307b1a
	.xword	0xac553718c81159db
	.xword	0xa2e22f6d2251377a
	.xword	0xfe680b2c4ee4f061
	.xword	0xfd3f5648d927ac55
	.xword	0x1035dfc02e121cb2
	.xword	0xf8634840b961589c
	.xword	0xbef063a91e901da5
	.xword	0x981006d2be8a0bcf
	.xword	0x23d02cff93e52ee3
	.xword	0xcd9bad267dffe3e3
	.xword	0x76b06747ce4b7d0d
	.xword	0x585aedaead4ef020
	.xword	0x7a40c265b6458dcd
	.xword	0x274025569ae6262a
	.xword	0x31d35b4518bcc218
	.xword	0x34ca910474edc7dc
	.xword	0xc1503a6a9d3b7482
	.xword	0xdacfb5bc28ef40ca
	.xword	0x93090261f8724519
	.xword	0xeab5731d8ea97fa5
	.xword	0xf964968f48a8b440
	.xword	0x06a8e736dd820876
	.xword	0xd3cfb99542d30d75
	.xword	0x11055ab9d394b509
	.xword	0x69e1d40e00dd11dc
	.xword	0xdda993db70b84d8b
	.xword	0x5d91f898321e4e9c
	.xword	0x5f5d4de2ebe8f2ba
	.xword	0x4052b793981bffe9
	.xword	0x836b2bdcb154104e
	.xword	0x20ee6a1a1650a6e9
	.xword	0xcf6d1fac34e3b6f0
	.xword	0xe33f82a6a777b122
	.xword	0xb4e3332105682830
	.xword	0x9db33ca72f20aaa9
	.xword	0x79ab42998f365e62
	.xword	0x58c1c8ecfd7205a5
	.xword	0x138b89ca346f9aef
	.xword	0x880de6d14a6a387d
	.xword	0xe1bac18e44557895
	.xword	0xf60cdc3f4b214e95
	.xword	0xf0b019794be80a57
	.xword	0xcdd7ee8fb892ebfc
	.xword	0x484461423ac843ca
	.xword	0xfacf5e3334fbccb5
	.xword	0x4f2077187197593d
	.xword	0x032866ee7367517f
	.xword	0x75e48d3c2bfca2af
	.xword	0x1df49e7b5af4e0f4
	.xword	0xe9f95571b46af7fb
	.xword	0x576a9ecb06d0c55e
	.xword	0x7833bf6052391f1d
	.xword	0xfb3af3319ac4b510
	.xword	0x9e6940fa16926d41



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
	.xword	0x63a69e7fa81dc797
	.xword	0xd079475762bcb9a8
	.xword	0x8657e147d447503a
	.xword	0xa076bcdc703235c1
	.xword	0x4da2349471e5b8e3
	.xword	0x2e62dec08847cb6c
	.xword	0x7c56515263cc8b21
	.xword	0x31a9ee4ca003aa42
	.xword	0x8c2f2dceab1525e5
	.xword	0x9dd54bf4c14577a5
	.xword	0xb47566fe6e29ecde
	.xword	0x323aee73b9004922
	.xword	0xfa6c09760e2148e2
	.xword	0x477011db91486cff
	.xword	0x812aa9b82b71b7b8
	.xword	0xa7687330a7c14ae0
	.xword	0x9591a7d209a2aa38
	.xword	0xe81932ebeb68a035
	.xword	0x1ca375407a67a329
	.xword	0x331910291aeb665e
	.xword	0xc61e569ddf72ed63
	.xword	0xff7bb70889f0c40e
	.xword	0x5b852ee1206e23dc
	.xword	0xb4c66cf6177cf50d
	.xword	0x5b166b2096d36c82
	.xword	0x6ba30670bf107c9c
	.xword	0xd1666b1247b41955
	.xword	0x186afcb33aa0d705
	.xword	0x050560ee420dd26c
	.xword	0xd4473e1748b9a9eb
	.xword	0x9addd8719c8e3772
	.xword	0x330bb6fdf88a9208
	.xword	0x5a4ad0f1e9a7e068
	.xword	0x4897b34070e03d3b
	.xword	0xa23bb25cd4eafc03
	.xword	0x63f431400f401ba8
	.xword	0x4e5e611ce6c89025
	.xword	0x636dc55cb1094e68
	.xword	0x3bab82043042cc5b
	.xword	0x254de436946c87bb
	.xword	0x44c548a75f7c9be6
	.xword	0x470f49d4a4f8db4a
	.xword	0x6829b1cea8e79dc1
	.xword	0x64c472d1636225c7
	.xword	0x707bcd246dc789b2
	.xword	0x460fd3185056ff18
	.xword	0x40a55bd1dfd1c43f
	.xword	0x52edb310c9272b57
	.xword	0xea27268586f5064a
	.xword	0xc5776bb30b4a7dc7
	.xword	0x599eb10a68b8e304
	.xword	0x7dff76df751e99fa
	.xword	0xcaea0f633b3c51b7
	.xword	0x98e5f34abe8100c0
	.xword	0x74f86a8aa8015547
	.xword	0xf35881231b791e0c
	.xword	0xd9d247cc5aa79558
	.xword	0x63aabae08dc58e4c
	.xword	0x9d55e882cdaec32a
	.xword	0xdba7f6c35d616279
	.xword	0xe73db2d8ef9569cf
	.xword	0x41703fce84f87a92
	.xword	0x0819cc48d09bdca6
	.xword	0x4f3d4efd627687ed
	.xword	0x0fbc806f75629061
	.xword	0xb678b897813de114
	.xword	0xc5b7ecd73e1a3604
	.xword	0xd323bb5c5f4372cd
	.xword	0x4fd91ad67802cbd6
	.xword	0xda1804ddab182f38
	.xword	0xadff4ca79925a82d
	.xword	0x21eb3691fdd81731
	.xword	0x92542c6edd0db5b7
	.xword	0x5e7403932f95724b
	.xword	0xc8ca555f5758dfa9
	.xword	0xd570ddde29df9ddd
	.xword	0xe0bfbc034152402b
	.xword	0xd36977f48736698f
	.xword	0x87b8fc8d87ab6809
	.xword	0xb352f0d360f0353f
	.xword	0xaa72369be817b706
	.xword	0xe02bd3d99841c62e
	.xword	0x6d225b038b4cf600
	.xword	0x54b3759335527099
	.xword	0xba24c0f2bbd2d498
	.xword	0x470009a88d7eba43
	.xword	0xa3beb470710a2825
	.xword	0xc49fa3ae72429e56
	.xword	0x84346a99c833d21f
	.xword	0x05b4eeb45c8b97b9
	.xword	0xd690e473c1f7f359
	.xword	0x0e1098a2f209f58f
	.xword	0x8237fa4b14563dd9
	.xword	0xa8b51bf68fad97fd
	.xword	0x82503377a16e353f
	.xword	0x09818e2c765196cd
	.xword	0xd3289c6588ebd300
	.xword	0x77e7df889cb7c03d
	.xword	0x140ba87350e36dcd
	.xword	0xdd329296c6ecca2f
	.xword	0xdc10a6f024e8f4f2
	.xword	0xe5dbf53d8456f248
	.xword	0xd211853dafc57c8a
	.xword	0x4b7e7b8436346302
	.xword	0x64bb8076d60720e2
	.xword	0x6ec06bbc084a7916
	.xword	0x56a01342cb8ef1d6
	.xword	0xa1f99c4e40bf035e
	.xword	0x2006453c70be8375
	.xword	0x7894fb05c1dfbde7
	.xword	0x99cdfa95a6643a4d
	.xword	0xef63f7de20bab3bc
	.xword	0x4e459d43f4dbeb50
	.xword	0x59cf9c3217fdf16c
	.xword	0xd4872ee231691135
	.xword	0xeba7c6b3d7bbbbbc
	.xword	0xeb14d36ef11b8c7e
	.xword	0xf4a011b22c9db0b6
	.xword	0x669773e7a7a36cf9
	.xword	0x1973c3d9da8ec95a
	.xword	0x07cc17e96000bbd3
	.xword	0x1dd26eb1eaaf9c96
	.xword	0xfc1beaeb9fb77f04
	.xword	0x8654f0fc8e9aaf3c
	.xword	0x90362b8db559f706
	.xword	0x3d8bf0dcadb40b69
	.xword	0xa973800ded640dfe
	.xword	0x0c824586c4ab0209
	.xword	0x3d7a3e9212586d82
	.xword	0x5339ca57b271cd73
	.xword	0xeea534fcef990274
	.xword	0xe3d53ad9cbfabbec
	.xword	0x2bb4fecbdd7b4000
	.xword	0x13fe214712938bb0
	.xword	0xf1948c9f15d47804
	.xword	0x7620b9116d59ce60
	.xword	0x507647a5d51343c4
	.xword	0x120c07aa7ef29ae2
	.xword	0x4f7c7f453a2a238e
	.xword	0x930b071175a1cef3
	.xword	0x49d8e49af83c6f87
	.xword	0xe84e0c2797e4b32a
	.xword	0xd513bf2be046c802
	.xword	0x1e47ff7cb5fc0b85
	.xword	0x6ec32ef86a1787a2
	.xword	0x68a7d282dc9752f4
	.xword	0x2e42f7c521ce0a7a
	.xword	0x6ff3e330b7c76fe2
	.xword	0x93655bdb5f46e94e
	.xword	0x77c9accd24d7d78b
	.xword	0xdd6e13c9cea27361
	.xword	0x01a6b682505eb80e
	.xword	0x957a0b1d5e216b34
	.xword	0x8ec1120d10d5194e
	.xword	0xe4d53c4fdf05b992
	.xword	0x9ba90e13f4904fd6
	.xword	0x347c6598ea76a803
	.xword	0x41851aea22e1b5b4
	.xword	0x0f5385f1ab743d48
	.xword	0xac64a7139b895146
	.xword	0x4f919fe0ecc71728
	.xword	0x7da1dd8001334c53
	.xword	0x244b3eff82f8f9b6
	.xword	0xd25ae594ddd03d43
	.xword	0x1d74bc1c35fc11a2
	.xword	0xbb73d4cdb2791899
	.xword	0x3625db3a40292b04
	.xword	0xe206bc2b566ed90f
	.xword	0xb81c2b70fe2f6823
	.xword	0xb6b486a7c9b8aa9a
	.xword	0x4b72a175297672f1
	.xword	0x6aaa1de99c2aeac5
	.xword	0xf018e322a40d9940
	.xword	0x97aa378a1cd21065
	.xword	0xb5245d2aa1dc0423
	.xword	0x9696da922bd1aeff
	.xword	0x97154f8ee1ca91cd
	.xword	0xaf67a9f7c6bb491a
	.xword	0x2a8c0b098950e9e5
	.xword	0x76d0ff244ec3078e
	.xword	0xc5a2a80a721628b6
	.xword	0x569bfd5a475ac2ca
	.xword	0xe4ef35fd30354ee5
	.xword	0x85968016b3b753c0
	.xword	0xd7c35af9c2b03edc
	.xword	0xf0909eff099d15de
	.xword	0x0133c279656f2019
	.xword	0x41007e621f8428e1
	.xword	0x95719ff5a7f6e7ca
	.xword	0x2b4880669156a63e
	.xword	0x3fc18e0e4798bc6f
	.xword	0xe12f382194fb4b16
	.xword	0xbc7968cc0f326482
	.xword	0x242426d753cf696f
	.xword	0x2800ff7b6293bbc4
	.xword	0x052fa8e3f0ce5e00
	.xword	0xff62608f1ec3c39f
	.xword	0x8ac805cbf50ba2c3
	.xword	0x08f8a2927a64cc9d
	.xword	0x68958cd713ba868d
	.xword	0x29e8d7d57417f758
	.xword	0xbbfe24902b4ee46c
	.xword	0xfe0bbc5832f8ffe3
	.xword	0xdbf9daa08106c718
	.xword	0x37510f778a3a4813
	.xword	0x83c834e8701b151f
	.xword	0x7abec65add563451
	.xword	0xccec7c408dbc7319
	.xword	0x8915e6eedd875ea9
	.xword	0xe79f957f210778a6
	.xword	0xe12d7539d0117bd5
	.xword	0x03f178612e95e276
	.xword	0x400efab215fdb7ef
	.xword	0x928372ec46fc6ba6
	.xword	0x1b0fd089644c6e91
	.xword	0x9e3c6d3289be13d5
	.xword	0xa6ef3645d36602dd
	.xword	0x635cd5095643c56d
	.xword	0xd093b613a77bd183
	.xword	0x4db34c0903a39a95
	.xword	0x676492f1653f35a4
	.xword	0x30294c6b0d6168fe
	.xword	0xad1c1f66a3cf8cb0
	.xword	0x2cb493e402e36e99
	.xword	0xb1a24d2472eaf7b1
	.xword	0x9e82427aaea51ec2
	.xword	0x6b8dba9eab3c3d49
	.xword	0xf4bdfadabf146af5
	.xword	0xfefcc76aeec5398e
	.xword	0xcc6ef5fc12f93086
	.xword	0x5d1ec12746d3e1bf
	.xword	0x18a4b3cd06ac4692
	.xword	0x7b42d381e85f3ac9
	.xword	0x0e0b770ebe7bb2a0
	.xword	0x694e1ab96af828bf
	.xword	0xae0c37ea16f46480
	.xword	0xfd5eae6415dde545
	.xword	0x57112f897a14e1ad
	.xword	0xccf668f644a2ce4f
	.xword	0x2c35d31c5c9358fe
	.xword	0xf4f4e2adb04d29ad
	.xword	0x8a41dd09e70265a3
	.xword	0x6ada41ba35944204
	.xword	0x00ca8ff000c1c550
	.xword	0x15960998600b7dfc
	.xword	0x6adae9a94309364b
	.xword	0x52796248afade2da
	.xword	0x5323cfa772c6c113
	.xword	0x572ea67f3c3270b2
	.xword	0x502a6a39b0e72a90
	.xword	0x1ab757f49ca3291e
	.xword	0x5f9cddafb8c0362d
	.xword	0x3f07cb93ba1c836c
	.xword	0xec542757773c8776
	.xword	0x77e30755cd35b297
	.xword	0xab9e6a36b1849946



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
	.xword	0x6efa521d118af233
	.xword	0xd82341690fb7db39
	.xword	0x6b5f091701089acd
	.xword	0x2e470f47d5a157db
	.xword	0xed292e98d19ed651
	.xword	0x4fbb3b8769dc4d78
	.xword	0x8f2a32a50474a986
	.xword	0x4b867cf1220fa81c
	.xword	0xc870a4e6eb084351
	.xword	0xe7993e95c08df7ec
	.xword	0x5d0c9b335d89ca52
	.xword	0xf3760559aca96742
	.xword	0x7a2bf9953c36c7df
	.xword	0xed2945dd9b1f3485
	.xword	0xe07548f905d0fb57
	.xword	0x30aaada6a8bf5306
	.xword	0x00ce28b5c894b036
	.xword	0xe2f6630525b7d4b9
	.xword	0xe75a02f3661ad3c1
	.xword	0x22ab0292e2283319
	.xword	0xd555ae3d14a38886
	.xword	0x8f6b3ae813d77ad9
	.xword	0x95799e75d3363989
	.xword	0x23c6ba881bc520fd
	.xword	0x58a5a414b7fa0603
	.xword	0x5c0e625bcf7f4744
	.xword	0x113f36fd615c0c51
	.xword	0xd8b0871ce6ae24d8
	.xword	0xaf3ab84222fbe243
	.xword	0x643bc31a1faad1a4
	.xword	0x18ecdc0f0f6981ca
	.xword	0x6b8b0ea336ebbd4d
	.xword	0x5d1af62ead055b6a
	.xword	0xf48f9e030b961763
	.xword	0xbbe54d488973614c
	.xword	0x5711c4ddd14a69a1
	.xword	0x4a88f59ff23d45e2
	.xword	0x96855b8d9061c268
	.xword	0x402a167ae0e20bc8
	.xword	0x54acdf5ac20de0f3
	.xword	0x8895fa301845d873
	.xword	0xd02356dcef2b810c
	.xword	0x011880eda11cad41
	.xword	0x66ad625d13b8b4e5
	.xword	0x29d6ce6e50e04320
	.xword	0x15694fec383802ac
	.xword	0x6f45045d25f63383
	.xword	0x747514795982947e
	.xword	0x74bfa0b4ab0285bf
	.xword	0xc605204fb8b7f5fe
	.xword	0x79a2e4b7165174b6
	.xword	0xe5bcfe1b53e22fcc
	.xword	0x5a798518480ea4a7
	.xword	0xf05f7960e4ffbab7
	.xword	0xdce272b0e390f81d
	.xword	0x6eb195b15ae0ba10
	.xword	0xc8fa35f350d5ea5b
	.xword	0xa7ca5f7b75569552
	.xword	0xbf96345c9df222fb
	.xword	0xa007536f7199e619
	.xword	0x92d9529d87cf1a0f
	.xword	0x208ec64ccb64216e
	.xword	0x243e27690514f10f
	.xword	0xad1fff583300c9a5
	.xword	0xeb417765f5a5b2f9
	.xword	0x8097308ff488339e
	.xword	0xba5c501fb21cca17
	.xword	0xbb83e8086102a850
	.xword	0x5a4e6f412e5bf066
	.xword	0xd458d02534e5e00e
	.xword	0x8c5b8ee2104a820b
	.xword	0xa8dadd61849e4dfb
	.xword	0x16c4d8465b34938f
	.xword	0x375eae2bc2d296bc
	.xword	0x368fee8c8f290d0d
	.xword	0xc51c54b8ef5cc8e0
	.xword	0x3fbcb848b8b99680
	.xword	0x5188c0bb2d14b373
	.xword	0x9fdf84ed011f66a0
	.xword	0x8a7f3ed34f72b540
	.xword	0xa183526f204d4116
	.xword	0x08f0920053f292ef
	.xword	0xa2d1b4ae6cc0d011
	.xword	0x03704b92d4e02401
	.xword	0x1b874228df08f09c
	.xword	0x97c81d23c987eccf
	.xword	0xbbd513cc41d3e2d8
	.xword	0xe6fb8e800ba09ccb
	.xword	0x3efe4c95dd582d0c
	.xword	0x933c4487459d8600
	.xword	0x2768a866c91787a9
	.xword	0x7f1b8be5566b0d91
	.xword	0x01cae6822d3bbd09
	.xword	0x5eededfaaf1a9d75
	.xword	0xbe565d7af9aba830
	.xword	0x42f0d5a85c19feb7
	.xword	0x31387bd6c28c01b0
	.xword	0xa00752e66093587c
	.xword	0xdfe7b0e549042ae1
	.xword	0xda455291e244fd50
	.xword	0x22409c03fbf3a4d4
	.xword	0xe0d77c5f21888eae
	.xword	0x617db4e555531c4c
	.xword	0x38194e9615223c30
	.xword	0x3b78725dea3a1cf5
	.xword	0xb47e986cf72f19a2
	.xword	0x9632211e2fb88bff
	.xword	0xba9ea019c263e467
	.xword	0x4ea192cf09a437c9
	.xword	0x4f1a93bded83f177
	.xword	0xd644e84a0239df5b
	.xword	0x799e2fe9db58f5e6
	.xword	0x8892da80e5db6ec4
	.xword	0x06e3b1edd66caa33
	.xword	0xf6541e3e674f54b5
	.xword	0x00efebbebd4e2eba
	.xword	0x6242494249f34c09
	.xword	0x603fdc6be8794bdb
	.xword	0x6291ca382b52d191
	.xword	0xabc962307c723ae5
	.xword	0x43376e2774822ef5
	.xword	0x20823113538d5640
	.xword	0x6ddbfeaab88cd0a7
	.xword	0xe5905914f7b9de1a
	.xword	0x6ce8174a24241b25
	.xword	0x5cb48fa7c6bec199
	.xword	0x5f889b4acfe9d701
	.xword	0xaca438069f7e4337
	.xword	0xbb5070077521ba8f
	.xword	0x272d789158677295
	.xword	0x55bd95a7903dc3be
	.xword	0x55518bedf01b4604
	.xword	0x999334ccfbd14171
	.xword	0x70e31122d0c318d8
	.xword	0x3d20333b9782ecb8
	.xword	0xd921b5a7ba8199b7
	.xword	0x58dd9cede60444ff
	.xword	0x2647a47ffc9490bc
	.xword	0x97611a7bcc010580
	.xword	0x8f08c27f7917d5bf
	.xword	0x2731d11c58464454
	.xword	0x4bc9ad1aee60ac90
	.xword	0x86d9b19de4f95782
	.xword	0xf5d0decc5b175b89
	.xword	0x15cb167c6a524e12
	.xword	0xabf93e518e2ff0ef
	.xword	0x74688ed984a8df1e
	.xword	0x99b4de759dd4ceec
	.xword	0x1246f9b336897025
	.xword	0xa73bf43522e714d2
	.xword	0xf0e08954173a2a2a
	.xword	0x77a9f85b627d0e32
	.xword	0x3983e83f2ab247d5
	.xword	0x22f870ae0d4d9f14
	.xword	0x713da40f5d785a96
	.xword	0xac7661418dba321b
	.xword	0x2ac84d85dcba5ec6
	.xword	0x53988c8ced4e3de3
	.xword	0x78a2c5afdda38c56
	.xword	0x535e634be15e88bc
	.xword	0x2336b1a23f6a73b9
	.xword	0x0354729a3917d97d
	.xword	0x14d77d5a8d5b0bae
	.xword	0x1db958a0efd72b02
	.xword	0x57195bfde6eab28a
	.xword	0x1e38555334218c37
	.xword	0xdf04553a313f4ee2
	.xword	0x447f047dfeabfb6c
	.xword	0xd27817cc2cbd29f3
	.xword	0x37111f049c17842e
	.xword	0xdf5692ff0d7cb08a
	.xword	0xfac5d52024d2189f
	.xword	0x10a12cd39b2530a8
	.xword	0xb9e33a6750d0e125
	.xword	0x305073bd64cecead
	.xword	0x54fd49c610554e39
	.xword	0x931345b9f5acd5ab
	.xword	0x9be191cff8b40902
	.xword	0x8ef4aeef93467d58
	.xword	0xbf47c29faed9e30a
	.xword	0x30142195d626cdfe
	.xword	0x1cdf84433396ed8d
	.xword	0xa8b401e6b0455ba3
	.xword	0x9bc5173f3d111ac1
	.xword	0x6176245e233aa4f9
	.xword	0x521202460c2d5eab
	.xword	0x870e52aa9437264f
	.xword	0x26c05c0f91e0150d
	.xword	0x41331421ab13f2d9
	.xword	0x3e21f7214ea3de5c
	.xword	0xe7ff8e195724b7bb
	.xword	0xf5679d2e08e62381
	.xword	0x0d22336ce76aabbd
	.xword	0x8593c8dca068d741
	.xword	0xbea7c6583856ca71
	.xword	0xda6acc251cc977d8
	.xword	0xacfc6a1570041f89
	.xword	0x754a013296301a93
	.xword	0xe08b10e78a83fe12
	.xword	0xd4a51dbabf7f197b
	.xword	0xbe8e9576c4da2773
	.xword	0x0cef3ada5fadf6ad
	.xword	0x58d9c3516a502a6c
	.xword	0xd5384e3eb0614ee6
	.xword	0x6c3e3c0fd35ee79f
	.xword	0x5b0de2bc1ef26750
	.xword	0x0d338679bd9c5fad
	.xword	0x9dc31cb6e209f640
	.xword	0x25259d05e46db12c
	.xword	0x29ee488af471581c
	.xword	0x0acd3c2e714c00f4
	.xword	0x24cde59ad69ce5c9
	.xword	0xb612679d57343a1f
	.xword	0x9db007b8ba7f08bf
	.xword	0x805ec83b5596e2ee
	.xword	0x7a295224fec45c9c
	.xword	0x4b2075e2e420d001
	.xword	0x51cbf3c685482443
	.xword	0xb1598a6ef041b085
	.xword	0x9d4dee940342c88e
	.xword	0xd7159c4135d06863
	.xword	0xdc53b7a78592298d
	.xword	0x06a2b437877121e0
	.xword	0x1d19dc640f2855c3
	.xword	0x702cdab682373a02
	.xword	0x6e46e41e90ef5751
	.xword	0x6eb0260ccb1d7647
	.xword	0xbd977e52c915309b
	.xword	0x827a6c37799f4660
	.xword	0xb2d9151f14690471
	.xword	0x7db9cbd9792d64ab
	.xword	0x841910edfa01cd39
	.xword	0x226633aabb556966
	.xword	0xc7a53a8dac353954
	.xword	0xae6ac884a43bdf70
	.xword	0x792996f430e9cc7a
	.xword	0xa3e33f768bd0d123
	.xword	0x8c2801f3de2801fe
	.xword	0x1563e57d25223e36
	.xword	0x39b52c007f54502b
	.xword	0x134b1e5632fd9bcc
	.xword	0x996d5b01803a2eea
	.xword	0x3200a2f45e298fe8
	.xword	0x137085e0efeb683a
	.xword	0xb063a810a8656fb9
	.xword	0xa7f5cbdaf97b943c
	.xword	0xbc7d65bb6675be68
	.xword	0x3a2868b9e945643b
	.xword	0x887de784ad2dc451
	.xword	0xf96d16fe8c4e0cb7
	.xword	0xeb4221a008de66f6
	.xword	0x4cb3148bda93cdfe
	.xword	0x7cc23c63a411bc35
	.xword	0xbc394ccd619b9055
	.xword	0x91b2b9f26a4edf13
	.xword	0x18ff5975d93d7591



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
