// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_diff_asis_rand_1.s
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
   random seed:	275064238
   Jal pio_rnd_basic4_diff_asis.j:	
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

setx    ncdata_base0, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
add 0x1, %g0, %g2
add 0x040, %g0, %g5
! FAKE DMA space
!setx 0x8010000000, %g1, %g3
stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

! initalize
setx    ncdata_base1, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
!setx 0x800e000000, %g1, %g3
stloop1:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop1
nop

! initalize
setx    ncdata_base2, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
!setx 0x800f000000, %g1, %g3
stloop2:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop2
nop

! initalize

setx    ncdata_base3, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
!setx 0xc000000000, %g1, %g3
stloop3:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop3
nop

! initalize

setx    ncdata_base4, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
!setx 0xd000000000, %g1, %g3
stloop4:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop4
nop

! initalize

setx    ncdata_base5, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
!setx 0xe000000000, %g1, %g3
stloop5:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop5
nop

! initalize
setx    ncdata_base6, %l0, %l2           ! nc data base
setx    0x1000, %l0, %l3                ! nc datawork area
add     %l2, %l3, %g3

add 0x0, %g0, %g4
!add 0x1, %g2, %g2
add 0x020, %g0, %g5
!setx 0xf000000000, %g1, %g3
stloop6:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop6
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

	setx 0x3bf92ee2786a61ba, %g1, %g0
	setx 0xd23ccdee98089347, %g1, %g1
	setx 0x833f06b3a0438891, %g1, %g2
	setx 0xae5a2ceeabcf2b2c, %g1, %g3
	setx 0xe7d6a2afc3d61bd6, %g1, %g4
	setx 0x9326cef0552d95f4, %g1, %g5
	setx 0x714d74be599a0280, %g1, %g6
	setx 0xe91fd9e4ef9887a1, %g1, %g7
	setx 0xaa847272b65e0cf7, %g1, %r16
	setx 0x30f53a4d5a8793be, %g1, %r17
	setx 0x67c938a6a9341a20, %g1, %r18
	setx 0x782e50e59b92d17b, %g1, %r19
	setx 0x62a6f8f0e05e3410, %g1, %r20
	setx 0x5e13afc026afdf0d, %g1, %r21
	setx 0x23f7b9ae3ae520f8, %g1, %r22
	setx 0xf923aa6e1470fc20, %g1, %r23
	setx 0xdc6d34708febf9ff, %g1, %r24
	setx 0xd342871f0bc51aae, %g1, %r25
	setx 0xc40cf44743f311ae, %g1, %r26
	setx 0x7f99fff736ea507a, %g1, %r27
	setx 0xdeda6e1301209712, %g1, %r28
	setx 0x1e0eaf9d1d7a26fa, %g1, %r29
	setx 0x50fba7013018dd12, %g1, %r30
	setx 0xf96a0aec9ad970fe, %g1, %r31
	save
	setx 0xf0660ea77c438fe8, %g1, %r16
	setx 0x5581d8cdec9aad0a, %g1, %r17
	setx 0x1c33b784141de478, %g1, %r18
	setx 0xd8ff149562d6e53e, %g1, %r19
	setx 0xcc9ec0c72c032e5a, %g1, %r20
	setx 0xa7b223599d36ce8f, %g1, %r21
	setx 0x65c2160c2af819bd, %g1, %r22
	setx 0x18b57e8ff1bff1c4, %g1, %r23
	setx 0x5bfd20dba0a796a2, %g1, %r24
	setx 0x7fdb46410a1bd5fb, %g1, %r25
	setx 0x9d68855d1caf4f7c, %g1, %r26
	setx 0xa5969328e7aa0565, %g1, %r27
	setx 0xe703d3d8581c6400, %g1, %r28
	setx 0x49d5ed50f3882781, %g1, %r29
	setx 0x56c17243020c320e, %g1, %r30
	setx 0x203b7e5f9137c196, %g1, %r31
	save
	setx 0x0df2ca5547c83ae8, %g1, %r16
	setx 0x908d586b613c27f1, %g1, %r17
	setx 0xaa67fbea5db37443, %g1, %r18
	setx 0xc41573c8e03bca54, %g1, %r19
	setx 0xaeca628b48fe4ceb, %g1, %r20
	setx 0x0196ff1ba41f5c1f, %g1, %r21
	setx 0xb57e6591a6b73631, %g1, %r22
	setx 0x306be830768427f5, %g1, %r23
	setx 0x99cea0468003d611, %g1, %r24
	setx 0x314cd3ab13681dde, %g1, %r25
	setx 0xe9d77307fb8b9445, %g1, %r26
	setx 0x56e987abddc289b2, %g1, %r27
	setx 0xc221cfe7d0a4d53c, %g1, %r28
	setx 0xff1a41cdc435caa1, %g1, %r29
	setx 0x0994b62fdd47a8c6, %g1, %r30
	setx 0xb52a0b85c07b8db5, %g1, %r31
	restore
	mov	0, %r8
	setx	0x000000006203ac00, %r1, %r9
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



	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec19a030  ! 1: LDD_I	ldd	[%r6 + 0x0030], %r22
	.word 0xec69a000  ! 2: LDSTUB_I	ldstub	%r22, [%r6 + 0x0000]
	.word 0xae998008  ! 3: XORcc_R	xorcc 	%r6, %r8, %r23
	.word 0xe4398008  ! 4: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe5e1a008  ! 5: CASA_R	casa	[%r6] %asi, %r8, %r18
	.word 0x8143e011  ! 6: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8498008  ! 10: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xec69a018  ! 11: LDSTUB_I	ldstub	%r22, [%r6 + 0x0018]
	.word 0xa0418008  ! 12: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xec21a018  ! 13: STW_I	stw	%r22, [%r6 + 0x0018]
	.word 0xeaf98008  ! 14: SWAPA_R	swapa	%r21, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 15: STBAR	stbar
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0518008  ! 19: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xea79a028  ! 20: SWAP_I	swap	%r21, [%r6 + 0x0028]
	.word 0xa2b1a000  ! 21: ORNcc_I	orncc 	%r6, 0x0000, %r17
	.word 0xe029a000  ! 22: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xeaf9a030  ! 23: SWAPA_I	swapa	%r21, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 24: STBAR	stbar
	setx	0x000000000d2ee038, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe001a030  ! 28: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xe879a018  ! 29: SWAP_I	swap	%r20, [%r6 + 0x0018]
	.word 0xa431a038  ! 30: SUBC_I	orn 	%r6, 0x0038, %r18
	.word 0xec71a038  ! 31: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xece98008  ! 32: LDSTUBA_R	ldstuba	%r22, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 33: STBAR	stbar
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe819a038  ! 37: LDD_I	ldd	[%r6 + 0x0038], %r20
	.word 0xe079a028  ! 38: SWAP_I	swap	%r16, [%r6 + 0x0028]
	.word 0xac11a028  ! 39: OR_I	or 	%r6, 0x0028, %r22
	.word 0xec29a028  ! 40: STB_I	stb	%r22, [%r6 + 0x0028]
	.word 0xe3f18008  ! 41: CASXA_I	casxa	[%r6] 0x 0, %r8, %r17
	.word 0x8143e011  ! 42: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x000000000d2ee000, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec498008  ! 46: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe6798008  ! 47: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xac41a008  ! 48: ADDC_I	addc 	%r6, 0x0008, %r22
	.word 0xe4718008  ! 49: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe0f98008  ! 50: SWAPA_R	swapa	%r16, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 51: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe009a008  ! 55: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xe469a000  ! 56: LDSTUB_I	ldstub	%r18, [%r6 + 0x0000]
	.word 0xa0a1a020  ! 57: SUBcc_I	subcc 	%r6, 0x0020, %r16
	.word 0xe439a020  ! 58: STD_I	std	%r18, [%r6 + 0x0020]
	.word 0xefe18008  ! 59: CASA_I	casa	[%r6] 0x 0, %r8, %r23
	.word 0x8143c000  ! 60: STBAR	stbar
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base5, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec59a020  ! 64: LDX_I	ldx	[%r6 + 0x0020], %r22
	.word 0xe4698008  ! 65: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xae39a008  ! 66: XNOR_I	xnor 	%r6, 0x0008, %r23
	.word 0xe829a008  ! 67: STB_I	stb	%r20, [%r6 + 0x0008]
	.word 0xe4f98008  ! 68: SWAPA_R	swapa	%r18, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 69: STBAR	stbar
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe001a008  ! 73: LDUW_I	lduw	[%r6 + 0x0008], %r16
	.word 0xec69a028  ! 74: LDSTUB_I	ldstub	%r22, [%r6 + 0x0028]
	.word 0xa421a000  ! 75: SUB_I	sub 	%r6, 0x0000, %r18
	.word 0xe839a000  ! 76: STD_I	std	%r20, [%r6 + 0x0000]
	.word 0xe4f98008  ! 77: SWAPA_R	swapa	%r18, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 78: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8518008  ! 82: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe6698008  ! 83: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xae118008  ! 84: OR_R	or 	%r6, %r8, %r23
	.word 0xe0718008  ! 85: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe2f9a030  ! 86: SWAPA_I	swapa	%r17, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 87: STBAR	stbar
	setx	0x000000000d2ee030, %r1, %r6
	setx	0x000000000d2ee020, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8198008  ! 91: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xec69a008  ! 92: LDSTUB_I	ldstub	%r22, [%r6 + 0x0008]
	.word 0xae31a018  ! 93: SUBC_I	orn 	%r6, 0x0018, %r23
	.word 0xe431a018  ! 94: STH_I	sth	%r18, [%r6 + 0x0018]
	.word 0xe4f98008  ! 95: SWAPA_R	swapa	%r18, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 96: STBAR	stbar
	setx	0x000000000d2ee008, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe059a018  ! 100: LDX_I	ldx	[%r6 + 0x0018], %r16
	.word 0xee798008  ! 101: SWAP_R	swap	%r23, [%r6 + %r8]
	.word 0xa8a98008  ! 102: ANDNcc_R	andncc 	%r6, %r8, %r20
	.word 0xe0318008  ! 103: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe5f18008  ! 104: CASXA_I	casxa	[%r6] 0x 0, %r8, %r18
	.word 0x8143e011  ! 105: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee018, %r1, %r6
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe819a018  ! 109: LDD_I	ldd	[%r6 + 0x0018], %r20
	.word 0xe269a030  ! 110: LDSTUB_I	ldstub	%r17, [%r6 + 0x0030]
	.word 0xa841a038  ! 111: ADDC_I	addc 	%r6, 0x0038, %r20
	.word 0xe0218008  ! 112: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xeaf9a000  ! 113: SWAPA_I	swapa	%r21, [%r6 + 0x0000] %asi
	.word 0x8143c000  ! 114: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8518008  ! 118: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe069a010  ! 119: LDSTUB_I	ldstub	%r16, [%r6 + 0x0010]
	.word 0xa6998008  ! 120: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe0398008  ! 121: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe1f18008  ! 122: CASXA_I	casxa	[%r6] 0x 0, %r8, %r16
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0598008  ! 127: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4698008  ! 128: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa0b1a038  ! 129: SUBCcc_I	orncc 	%r6, 0x0038, %r16
	.word 0xe071a038  ! 130: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe3e1a008  ! 131: CASA_R	casa	[%r6] %asi, %r8, %r17
	.word 0x8143c000  ! 132: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0198008  ! 136: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe6698008  ! 137: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xa8918008  ! 138: ORcc_R	orcc 	%r6, %r8, %r20
	.word 0xe0218008  ! 139: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe8e98008  ! 140: LDSTUBA_R	ldstuba	%r20, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 141: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe4118008  ! 145: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xec79a028  ! 146: SWAP_I	swap	%r22, [%r6 + 0x0028]
	.word 0xae298008  ! 147: ANDN_R	andn 	%r6, %r8, %r23
	.word 0xe071a028  ! 148: STX_I	stx	%r16, [%r6 + 0x0028]
	.word 0xe7e1a008  ! 149: CASA_R	casa	[%r6] %asi, %r8, %r19
	.word 0x8143e011  ! 150: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee038, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8598008  ! 154: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe0798008  ! 155: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xa4c1a010  ! 156: ADDCcc_I	addccc 	%r6, 0x0010, %r18
	.word 0xe831a010  ! 157: STH_I	sth	%r20, [%r6 + 0x0010]
	.word 0xebe18008  ! 158: CASA_I	casa	[%r6] 0x 0, %r8, %r21
	.word 0x8143c000  ! 159: STBAR	stbar
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base5, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe4518008  ! 163: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe469a020  ! 164: LDSTUB_I	ldstub	%r18, [%r6 + 0x0020]
	.word 0xae81a000  ! 165: ADDcc_I	addcc 	%r6, 0x0000, %r23
	.word 0xe039a000  ! 166: STD_I	std	%r16, [%r6 + 0x0000]
	.word 0xecf9a020  ! 167: SWAPA_I	swapa	%r22, [%r6 + 0x0020] %asi
	.word 0x8143e011  ! 168: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee038, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec018008  ! 172: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe069a030  ! 173: LDSTUB_I	ldstub	%r16, [%r6 + 0x0030]
	.word 0xa0418008  ! 174: ADDC_R	addc 	%r6, %r8, %r16
	.word 0xe8318008  ! 175: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe7f18008  ! 176: CASXA_I	casxa	[%r6] 0x 0, %r8, %r19
	.word 0x8143c000  ! 177: STBAR	stbar
	setx	0x000000000d2ee000, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe459a030  ! 181: LDX_I	ldx	[%r6 + 0x0030], %r18
	.word 0xe679a000  ! 182: SWAP_I	swap	%r19, [%r6 + 0x0000]
	.word 0xa2098008  ! 183: AND_R	and 	%r6, %r8, %r17
	.word 0xe071a000  ! 184: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xe7f18008  ! 185: CASXA_I	casxa	[%r6] 0x 0, %r8, %r19
	.word 0x8143e011  ! 186: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee018, %r1, %r6
	setx	0x000000000d2ee020, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe4018008  ! 190: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe269a018  ! 191: LDSTUB_I	ldstub	%r17, [%r6 + 0x0018]
	.word 0xa8298008  ! 192: ANDN_R	andn 	%r6, %r8, %r20
	.word 0xe0218008  ! 193: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0e98008  ! 194: LDSTUBA_R	ldstuba	%r16, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 195: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base5, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe449a018  ! 199: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	.word 0xe2698008  ! 200: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xa819a008  ! 201: XOR_I	xor 	%r6, 0x0008, %r20
	.word 0xe0718008  ! 202: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe9e18008  ! 203: CASA_I	casa	[%r6] 0x 0, %r8, %r20
	.word 0x8143c000  ! 204: STBAR	stbar
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0598008  ! 208: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe4798008  ! 209: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa0a98008  ! 210: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xe029a008  ! 211: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe0f9a018  ! 212: SWAPA_I	swapa	%r16, [%r6 + 0x0018] %asi
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x000000000d2ee038, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe051a018  ! 217: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xec69a018  ! 218: LDSTUB_I	ldstub	%r22, [%r6 + 0x0018]
	.word 0xa6318008  ! 219: ORN_R	orn 	%r6, %r8, %r19
	.word 0xe429a018  ! 220: STB_I	stb	%r18, [%r6 + 0x0018]
	.word 0xebe1a008  ! 221: CASA_R	casa	[%r6] %asi, %r8, %r21
	.word 0x8143e011  ! 222: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe041a018  ! 226: LDSW_I	ldsw	[%r6 + 0x0018], %r16
	.word 0xea69a008  ! 227: LDSTUB_I	ldstub	%r21, [%r6 + 0x0008]
	.word 0xa2098008  ! 228: AND_R	and 	%r6, %r8, %r17
	.word 0xe0398008  ! 229: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4f9a038  ! 230: SWAPA_I	swapa	%r18, [%r6 + 0x0038] %asi
	.word 0x8143e011  ! 231: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee008, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe4418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xea798008  ! 236: SWAP_R	swap	%r21, [%r6 + %r8]
	.word 0xaa31a018  ! 237: ORN_I	orn 	%r6, 0x0018, %r21
	.word 0xe0718008  ! 238: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe9f1a008  ! 239: CASXA_R	casxa	[%r6]%asi, %r8, %r20
	.word 0x8143c000  ! 240: STBAR	stbar
	setx	0x000000000d2ee008, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe051a018  ! 244: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe4798008  ! 245: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa009a030  ! 246: AND_I	and 	%r6, 0x0030, %r16
	.word 0xec298008  ! 247: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe1e18008  ! 248: CASA_I	casa	[%r6] 0x 0, %r8, %r16
	.word 0x8143c000  ! 249: STBAR	stbar
	setx	0x000000000d2ee038, %r1, %r6
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec51a030  ! 253: LDSH_I	ldsh	[%r6 + 0x0030], %r22
	.word 0xe879a010  ! 254: SWAP_I	swap	%r20, [%r6 + 0x0010]
	.word 0xa2c18008  ! 255: ADDCcc_R	addccc 	%r6, %r8, %r17
	.word 0xec39a010  ! 256: STD_I	std	%r22, [%r6 + 0x0010]
	.word 0xeee9a010  ! 257: LDSTUBA_I	ldstuba	%r23, [%r6 + 0x0010] %asi
	.word 0x8143c000  ! 258: STBAR	stbar
	setx	0x000000000d2ee000, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe019a010  ! 262: LDD_I	ldd	[%r6 + 0x0010], %r16
	.word 0xe4798008  ! 263: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xac018008  ! 264: ADD_R	add 	%r6, %r8, %r22
	.word 0xe039a010  ! 265: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xebe18008  ! 266: CASA_I	casa	[%r6] 0x 0, %r8, %r21
	.word 0x8143c000  ! 267: STBAR	stbar
	setx	0x000000000d2ee020, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe4498008  ! 271: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe0798008  ! 272: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xa6318008  ! 273: ORN_R	orn 	%r6, %r8, %r19
	.word 0xe8298008  ! 274: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe3f1a008  ! 275: CASXA_R	casxa	[%r6]%asi, %r8, %r17
	.word 0x8143c000  ! 276: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec09a010  ! 280: LDUB_I	ldub	[%r6 + 0x0010], %r22
	.word 0xee69a010  ! 281: LDSTUB_I	ldstub	%r23, [%r6 + 0x0010]
	.word 0xa4b9a018  ! 282: XNORcc_I	xnorcc 	%r6, 0x0018, %r18
	.word 0xe039a018  ! 283: STD_I	std	%r16, [%r6 + 0x0018]
	.word 0xede1a008  ! 284: CASA_R	casa	[%r6] %asi, %r8, %r22
	.word 0x8143c000  ! 285: STBAR	stbar
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe051a018  ! 289: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe879a030  ! 290: SWAP_I	swap	%r20, [%r6 + 0x0030]
	.word 0xae198008  ! 291: XOR_R	xor 	%r6, %r8, %r23
	.word 0xe039a030  ! 292: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe0e9a038  ! 293: LDSTUBA_I	ldstuba	%r16, [%r6 + 0x0038] %asi
	.word 0x8143c000  ! 294: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6


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

SECTION .NCDATA1  DATA_VA=0xd02ee000

attr_data {
        Name = .NCDATA1,
        VA=0xd02ee000,
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base1
ncdata_base1:
        .skip 1000

SECTION .NCDATA2  DATA_VA=0xd03ee000

attr_data {
        Name = .NCDATA2,
        VA=0xd03ee000,
        RA=0x800f000000,
        PA=0x800f000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base2
ncdata_base2:
        .skip 1000

SECTION .NCDATA3  DATA_VA=0xd04ee000

attr_data {
        Name = .NCDATA3,
        VA=0xd04ee000,
        RA=0xc000000000,
        PA=0xc000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base3
ncdata_base3:
        .skip 1000

SECTION .NCDATA4  DATA_VA=0xd05ee000

attr_data {
        Name = .NCDATA4,
        VA=0xd05ee000,
        RA=0xd000000000,
        PA=0xd000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base4
ncdata_base4:
        .skip 1000

SECTION .NCDATA5  DATA_VA=0xd06ee000

attr_data {
        Name = .NCDATA5,
        VA=0xd06ee000,
        RA=0xe000000000,
        PA=0xe000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base5
ncdata_base5:
        .skip 1000

SECTION .NCDATA6  DATA_VA=0xd07ee000

attr_data {
        Name = .NCDATA6,
        VA=0xd07ee000,
        RA=0xf000000000,
        PA=0xf000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base6
ncdata_base6:
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
	.xword	0x6138781de8cdc946
	.xword	0xc9755c0f8fce7027
	.xword	0xe145f8620c5918b8
	.xword	0xdd6c2db748e7b618
	.xword	0x425e7d44b12b5eeb
	.xword	0x80a96544edfd8326
	.xword	0xe605457f8a91c25a
	.xword	0x3e8d15af0e888258
	.xword	0x29e7c1549ed40203
	.xword	0x807e3bbc025e4ca5
	.xword	0xe07e0f3eeb2eec40
	.xword	0xd42b67cb8de35517
	.xword	0xbed4070395de5dd9
	.xword	0x1cfd325737af88a7
	.xword	0x93b2cb678e90f9f1
	.xword	0xd323f4ce261846c8
	.xword	0xccaeeb52c234bc90
	.xword	0xe5e7366886d9d092
	.xword	0xdf87a996372545d8
	.xword	0x58d7c517d2594926
	.xword	0xa7ca39b2cc7bfc4d
	.xword	0x3feaf0f7f2dc6067
	.xword	0x70b66a60ed7a96ba
	.xword	0xb497af56512bf80e
	.xword	0x989e67489768d5c4
	.xword	0x09acdcb9b892689a
	.xword	0x464c149be0d92d4c
	.xword	0x9214bb0184763bea
	.xword	0xb007bcfb4120ae79
	.xword	0xab6cbe2ffda0541f
	.xword	0x8939c2a4a67ab3cf
	.xword	0x7ebf73a1fa87d75d
	.xword	0x031a7badb59af2b0
	.xword	0x5813355ef8b77e41
	.xword	0x7c6496a1e283874e
	.xword	0x3b79d20e9341456c
	.xword	0x8ed2235869b50c7b
	.xword	0x6785a33b9ea144da
	.xword	0x475cd659d81fba6b
	.xword	0x914c25bea4b69e0a
	.xword	0xdc47ad85721d9553
	.xword	0x31b543173b2cc30e
	.xword	0x6e785614e9d931d2
	.xword	0xe868649be1a9a1c1
	.xword	0x86a50b1a1ab4eadf
	.xword	0x06d22a69f54a3d7d
	.xword	0x71cc2b5d0c14ca9d
	.xword	0x13cb68c6a844a37b
	.xword	0xb831795b32de7625
	.xword	0xa4e9c19330a4e88c
	.xword	0x340bfd39543cec4f
	.xword	0x37074e3845c9bf70
	.xword	0x98ad65c472a261d0
	.xword	0x14a703331d95742b
	.xword	0x257e19ba963549e8
	.xword	0x2feadacaf7c1efd2
	.xword	0x53cad52675d771cc
	.xword	0xf759baadb2570fb2
	.xword	0x0c16cfe608b3dcea
	.xword	0x07fae2973394ef29
	.xword	0x93ff14405c84b099
	.xword	0xc39083b26507df7a
	.xword	0x97f051035d5cd333
	.xword	0xf606384f1fae9cb3
	.xword	0x5d6a0b116a7904b2
	.xword	0x5ec079079564e1a3
	.xword	0x311675eeb47ff09a
	.xword	0x1ef0f284328bc9a2
	.xword	0x4e2906b272d15eab
	.xword	0xf1b292cb4305de85
	.xword	0x9745b152177ab4b5
	.xword	0x6b04e521038b932b
	.xword	0xb3dddbfb7f050fb6
	.xword	0x1a31b4f1365be4bf
	.xword	0xb445b590e95116bb
	.xword	0x0e129ccaaec320e5
	.xword	0xaf21e306acddc435
	.xword	0x1b3f2e91943b92e8
	.xword	0xfbb2fe6aac54e091
	.xword	0x570be74d7d2687c2
	.xword	0xc292f7d644c3fe7a
	.xword	0x9059bd3a9875d1f3
	.xword	0x5e63b954fda8b30f
	.xword	0x1f1a963fb653f152
	.xword	0x1a436a14122a66fe
	.xword	0x397671b317c20421
	.xword	0x3a44195cb8279023
	.xword	0x49e5d2d2763b30d1
	.xword	0xb0e7d4b946ccc128
	.xword	0x3cad5833f44b6d19
	.xword	0xa81ef76c673893bf
	.xword	0xc28e84b49bd650fc
	.xword	0x0c1da74abe107576
	.xword	0x386fee1341ce641b
	.xword	0x15a314de9785c2b6
	.xword	0x8f101a7004044e55
	.xword	0xacfd69bfc6fa5890
	.xword	0x48daa1b20e716b08
	.xword	0xc7d34789e23ed0de
	.xword	0xc7f4ca4b87f5ada9
	.xword	0xf82a4e2dbbc0c997
	.xword	0x0bb194d0daf47f32
	.xword	0xc69f0f03a39cd4bb
	.xword	0x7464490a1187c878
	.xword	0x3baea9826e98296f
	.xword	0x43aec5358ad680d2
	.xword	0x6220fd9fb8fd5693
	.xword	0xbf3b5d6bb41e8ccc
	.xword	0xdd7eb57e35b10823
	.xword	0x52e5da5baae86008
	.xword	0x49aadb1ca6e2bd6a
	.xword	0x06f71a51df64c0bf
	.xword	0x757ad313660f5a28
	.xword	0x1d5c5d5239c4b1b6
	.xword	0x5938e3bdb77fb3b2
	.xword	0x8a400b30c663feac
	.xword	0x5f1d484707f5eee6
	.xword	0x349ae968c8edbaed
	.xword	0xde3f2beb0d8fb469
	.xword	0xedc53bbc4dffe28b
	.xword	0x2f3e4563bb9b7c7b
	.xword	0xecb59ad11d731096
	.xword	0xc4a9b47362762c4e
	.xword	0x5e3de6445c27890a
	.xword	0x18f65bb1c4599452
	.xword	0x2d1b1e7a190a9013
	.xword	0x62d1e7fe2de2e211
	.xword	0x175b998c613b8dca
	.xword	0x7bc2193dc2c39537
	.xword	0xb87d2bff135754cf
	.xword	0x2894edc4abe2df33
	.xword	0x64e7060635dec25a
	.xword	0x00be45f2747584b3
	.xword	0xba43b908cffaac53
	.xword	0xc0e55484b30802c2
	.xword	0xd4eb5c5b5e0e5ef8
	.xword	0x3f5310ec55e26732
	.xword	0xb646bc13fa78cfce
	.xword	0x11e51a7f45a6e44a
	.xword	0x139dfa0c17b176c2
	.xword	0x61b04136506bb2c1
	.xword	0x27c5604c9b13bf4a
	.xword	0x7323803802c288bb
	.xword	0xb99f11546051f1ff
	.xword	0x25ada71d6114a2ee
	.xword	0x58a51e77698bd934
	.xword	0xa8c8f36b203b331d
	.xword	0xf3ee858fce9f6751
	.xword	0x24889c038b1843a3
	.xword	0x240b5f4653ea2044
	.xword	0xaab0f6c14d0d41e5
	.xword	0x48b4fa203d945905
	.xword	0xe01775d4d29ebf68
	.xword	0xeb630bb89dacb0d5
	.xword	0x957cb7025e964cc1
	.xword	0x2c583d7814217f91
	.xword	0xf32cc1a4407e5725
	.xword	0xa6e5448c813f5ecf
	.xword	0x1effb618949c960f
	.xword	0xef0278931622480d
	.xword	0x1876236289cd5cac
	.xword	0x41cea4a0a28893a7
	.xword	0x7b8686f90c677713
	.xword	0x144bfcce45d61c17
	.xword	0x80a1818963602bcd
	.xword	0xb8bb3e1a6a84206a
	.xword	0xf0bf7b4f4221fadd
	.xword	0xf565f9aa6ec57ed3
	.xword	0x581cb9f7186c9805
	.xword	0xb55d939fcf586f6f
	.xword	0x952cc4bb35c3e0b7
	.xword	0x5ef45e17c0b570f8
	.xword	0xc9d82986d9670e4e
	.xword	0x972414715710bb3c
	.xword	0x4a2173675dbfa4be
	.xword	0xddf81999ab8fe6bf
	.xword	0x923f5490d167e5b6
	.xword	0xb84f466f463011e4
	.xword	0x3b540a5b1df7c4b0
	.xword	0x10551150183740be
	.xword	0x44f83bc998af249f
	.xword	0xeb4696e3590a69ad
	.xword	0x0ca64941f29362c0
	.xword	0x8c075c8520ae619c
	.xword	0x0c7796d57c36a5ad
	.xword	0xa37127cdf6d95c5e
	.xword	0x952cbcc69ffcabea
	.xword	0xf6882947d72074e7
	.xword	0x448fb71c34cac0b8
	.xword	0xaa04e101d5afd8d4
	.xword	0x1caa9a4822a83dd7
	.xword	0xc0e768da3939a137
	.xword	0x5d6e8c6ea3ef0190
	.xword	0x7bc44648a28d235b
	.xword	0x3eda0a96105ce9fb
	.xword	0xb0f2212b0dae7716
	.xword	0x59adbf98dec191fd
	.xword	0x579e44f2ed3b4b98
	.xword	0x6c0f7465b3f1d9d4
	.xword	0x7dd9d8e94cbc36c0
	.xword	0x44c393c71d6335b3
	.xword	0x0b73b4f4c01d2be4
	.xword	0x1142655860709096
	.xword	0xef6bc9306c9f30e9
	.xword	0x65983e66f10cbcbb
	.xword	0xdf15851398fa7c35
	.xword	0xb46d1f45a402bba7
	.xword	0xde1a5187c60f5072
	.xword	0x3a6187a09274c0fb
	.xword	0xb0c85db80376f893
	.xword	0x3240d02635334c04
	.xword	0x8f735d05be8d0dcb
	.xword	0x17944bc00de9ce60
	.xword	0x99a8d2e621d5a49d
	.xword	0x5b1d7a34a1fafda9
	.xword	0x7ccb6cbfb7264d3a
	.xword	0x09c4b03054841e31
	.xword	0x546aff252515bd06
	.xword	0x8cb8d36bd632193d
	.xword	0x55b68210c7bfd08f
	.xword	0x62ec58b9ed506409
	.xword	0x6eaad85feca9e4e5
	.xword	0x9efcf8d12f2db060
	.xword	0x57ece7e1aa0d1287
	.xword	0x9b3b79b8a4837bbb
	.xword	0xf4042861a27dd6b0
	.xword	0x08e842fe0b9224ba
	.xword	0x1bcf8ba76f22d8a1
	.xword	0x5f885208ac26f6f3
	.xword	0xeb6bf1cefd68c711
	.xword	0xb9a84e674a01c87d
	.xword	0x4574727c49419de9
	.xword	0x0677d112195bb7e9
	.xword	0x3e6b122093d1de0b
	.xword	0x80f2e995b090f485
	.xword	0xc537f5d1a47504c8
	.xword	0xe06ab5118919a2fe
	.xword	0xc89060fb2c937bd2
	.xword	0x3cb6688ee83aae74
	.xword	0xea72e4b5647cb94a
	.xword	0xbe8b5930b4c3c277
	.xword	0x8d12623c8a27ecd5
	.xword	0x19bc11a8452adbbe
	.xword	0x18adfafae1263780
	.xword	0x120441d7b64872cd
	.xword	0xc37e72e7a0aeea0d
	.xword	0xd54b91efd0681ecc
	.xword	0x6bdd2f25da2becbd
	.xword	0xb3b70e53e0ef96b1
	.xword	0xdf0b18a8bcafdf8c
	.xword	0x71c78e43e4de4511
	.xword	0xba5dfa2c364c2165
	.xword	0xd964bbdf30231ae3
	.xword	0x4c2f8dd576d4e608
	.xword	0xcbae606bd957e7cb
	.xword	0xd72be11599caebbf



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
	.xword	0xa0c764c447d55456
	.xword	0xd5855e6150e3464a
	.xword	0x645b202cbdb104f0
	.xword	0x9fa18daa2c3f1fb9
	.xword	0xca1711e73dc72c2a
	.xword	0x7e956f41ca408b9c
	.xword	0xda48aaccaadb844a
	.xword	0x8620c3fa3ac8d9c8
	.xword	0x8bcc4dbb33d558e4
	.xword	0x48029dad5fcae69e
	.xword	0x2efa3af42d02d800
	.xword	0xd0dec004027c8219
	.xword	0x9925ebad12a74238
	.xword	0x81a2c39d83d2d096
	.xword	0xaff190f8fda8bde1
	.xword	0xde33845465698a90
	.xword	0xab5beca1e2efa33b
	.xword	0xf4ad1ee5369b7fea
	.xword	0x9c476fb78de5b684
	.xword	0x4db3b3f6c1a3a82f
	.xword	0xc3e34988588ec17b
	.xword	0xc07ab56077c3c410
	.xword	0x385445402f7497a3
	.xword	0x54a747057c0a791a
	.xword	0x3409e26d1beef30a
	.xword	0xd87348bf73144843
	.xword	0x9eff1b7e48ba00ea
	.xword	0x055d1149cdd42dac
	.xword	0x0c8d529ceef91a24
	.xword	0xca646c9d9e6f3de4
	.xword	0xa817351c71e7bde1
	.xword	0x15adb78670c0a957
	.xword	0x0629038a056aeb74
	.xword	0xf6d60c73804bb84c
	.xword	0x14ff23818155a549
	.xword	0x6b6382cdad69953b
	.xword	0x4b800e6362197070
	.xword	0x9a80a8804b3889a8
	.xword	0x2db1a3c1c1038aed
	.xword	0xdc03ddc197b8f998
	.xword	0xb57c1ab5b428e7bc
	.xword	0x14b8f807578b9d12
	.xword	0x037725f016f9e6eb
	.xword	0x0abbfb5d9c0e770f
	.xword	0x4d4a03f7b090f247
	.xword	0x545fe3cc8f2e398a
	.xword	0x10e232b4d7687d8a
	.xword	0x7d3cdcb030860152
	.xword	0x38621fefc2e86274
	.xword	0x1ccc7bf1df73f4a3
	.xword	0x6e8a17dbec8cd4fe
	.xword	0xb7cacaf6502926f7
	.xword	0xbdb0e8cfc26a9d87
	.xword	0xe503fe8c52b316f5
	.xword	0xcd344acb575b4f4f
	.xword	0x6df2a2f50218237c
	.xword	0xeddf1b3b9a24bc89
	.xword	0xb986ea017ceb5157
	.xword	0x0147232f974dcfce
	.xword	0x8d2b22e37a96a962
	.xword	0xe2471f828e1bdd83
	.xword	0x247e101e0ace7d40
	.xword	0xb336ddbf69f055e6
	.xword	0x9134c7aab004057b
	.xword	0x80a6765f9a69643a
	.xword	0xc09bfe6642da8a97
	.xword	0x8036ac10bec4e5ad
	.xword	0x7dc8356c3007e053
	.xword	0xf772d2645d564baa
	.xword	0xb1a515953c075d2d
	.xword	0x49f4f67df448531b
	.xword	0xfafeced9221f7926
	.xword	0xd027faff464a37cd
	.xword	0x32f32f59f1f9638c
	.xword	0xee00937525c71e45
	.xword	0x94c6e02ef2ab72a6
	.xword	0xb59a3a135a0d5aa1
	.xword	0x2deb5803c694e449
	.xword	0x5a4b1dc93fd62f76
	.xword	0xbccca58ee148909c
	.xword	0xd15556a674a9f7d2
	.xword	0x7a43d34040b27a57
	.xword	0xa5f35db14bd640f3
	.xword	0xe416d410d5af9b1d
	.xword	0x37451edd53fc74ac
	.xword	0xd01527599cfa59b6
	.xword	0xbe6c18136668fc45
	.xword	0x6a98619998cde58f
	.xword	0x18e0d578bcd9c697
	.xword	0x8b52911787342101
	.xword	0xc039585d2a77f707
	.xword	0xd037683f5845f8ad
	.xword	0x6a93bbedf59fdcd8
	.xword	0xb53686e362108d4c
	.xword	0xb4cd4947e9ab6a0a
	.xword	0xa85fba728b7308e0
	.xword	0x6f4c8a0bbdc6c79b
	.xword	0x914fe6f25cde2ef8
	.xword	0x04f0ae3ddf3065df
	.xword	0xeb1547f52c82192f
	.xword	0xfb393710c96acf9a
	.xword	0x6545514caae66c9a
	.xword	0x96aaf40c70496b10
	.xword	0x19c2cf7c5c98e000
	.xword	0xcd907ba61de80f2e
	.xword	0x86265bab1af141a6
	.xword	0x935a03a82e27033f
	.xword	0xbf3cb0596f37a8e6
	.xword	0x9b0627d05c7c7053
	.xword	0xd60a4d653f716645
	.xword	0x39be99b50f98fd9b
	.xword	0x2049a330de55bbfe
	.xword	0x06136cd1f75c79ea
	.xword	0xfe33c4ae06d7a1f7
	.xword	0x1aa08d7baa979f2c
	.xword	0xbb25f110851cbb2f
	.xword	0x78c4ddd1909ab951
	.xword	0x2753fd4ef906b78a
	.xword	0x3650302241511c50
	.xword	0x373858c80b8f94fd
	.xword	0xd4c0dcf41ab2256b
	.xword	0xe8bd3c07837987b5
	.xword	0x89c59a7a8602e980
	.xword	0x20685bb240a29ae9
	.xword	0x996ea386557e4d5e
	.xword	0xc3f7295cc259421e
	.xword	0xc40152ff2a8a3396
	.xword	0xfdfbc8b7deecd30d
	.xword	0x9e30296e1d17b3f4
	.xword	0x3cdbc5b683c42c99
	.xword	0x3f1326139ba205a4
	.xword	0x05306c7b7f967581
	.xword	0xbb8ef9f3036579f3
	.xword	0xde763580f1a65b8b
	.xword	0x4d333a179903644f
	.xword	0x6346c1550a76b54b
	.xword	0x9dac55a02c1d9183
	.xword	0xd74db997bd90bf7b
	.xword	0x42da629026ed58e9
	.xword	0x8f932f7d9bb84eea
	.xword	0x58e9524b8b7ac9fd
	.xword	0x2cb52306228f4401
	.xword	0x6aaba184e5d30366
	.xword	0x6cc6d6a36d4e165f
	.xword	0x7b9012b471757a58
	.xword	0x4e04f391b0237ec1
	.xword	0x8aa415185aa88fa2
	.xword	0x46578e64e2077dff
	.xword	0x456905cce0637707
	.xword	0x137848bb0da148b2
	.xword	0x12cdb9c6fef3bddd
	.xword	0x3db4cc20949e2e56
	.xword	0xcfe92da0a0a6f5bc
	.xword	0x546645db3bb3de89
	.xword	0xc1f1aa51be54ab78
	.xword	0xe6a28e4657019539
	.xword	0x65dac303fd18a711
	.xword	0xfd67078003f79789
	.xword	0xb6417c4df8bf6db5
	.xword	0xad0cc6c678c3fb71
	.xword	0x9d028c9ff1ae6226
	.xword	0x96a0c879094e133f
	.xword	0xac69de95b3621050
	.xword	0x47d656af313de3fc
	.xword	0x61fe62daba8ca78c
	.xword	0x31fab2ecdf2e204b
	.xword	0xe68bc25435fdd07c
	.xword	0xcd650b033fd5caa4
	.xword	0x92f08484728c4352
	.xword	0x3560b2cc43a36462
	.xword	0xd83fea987fa28d14
	.xword	0xe1d1b5bedc403690
	.xword	0x65aa41730cd8923f
	.xword	0xd70a06e3a886b5b1
	.xword	0xc769182519822226
	.xword	0x2c391e9c4a3075b9
	.xword	0x6914e4ee6267c2a1
	.xword	0xbd141dbbd2a905e8
	.xword	0x4d8b239b67fec24e
	.xword	0x92c4ef82fb5aa735
	.xword	0xf1d21b9b26146a11
	.xword	0x63a4f937a24a5bcb
	.xword	0x7052140b5a65a78d
	.xword	0x7f351ce5f472e964
	.xword	0x2fd6d130ccebdf2f
	.xword	0x4bd49b4caa1e947c
	.xword	0x3f6c8d1c9d39d524
	.xword	0xbea00b8b878a3b51
	.xword	0x379c3c9743a7b3d9
	.xword	0xb4d832ca800f73b7
	.xword	0x9ece64c29deafc54
	.xword	0x03614500bde55f0c
	.xword	0x239cc6eae823bba9
	.xword	0x9eda760334252ece
	.xword	0x0d40e7d4a6bc2451
	.xword	0xcd57148b684a992c
	.xword	0x63984a7bb4c9b6ea
	.xword	0x09e6252d255ee310
	.xword	0xf800ad970c4d31ea
	.xword	0xf084f615ebba62ec
	.xword	0x2af2378faf15a42f
	.xword	0x026b33e8b1226c61
	.xword	0x3476dd13478562d6
	.xword	0x74ee1fbd701e7130
	.xword	0xf324d95d90abba6b
	.xword	0x8c8112a693fb670b
	.xword	0xffdbd67653def33f
	.xword	0x6474f00f9901e49c
	.xword	0x8d36563750a2fac9
	.xword	0xdc91bf4299b7f40e
	.xword	0x117cf8238385e975
	.xword	0xb8569c6d7c8c6e7c
	.xword	0x873c40d483a9aaa4
	.xword	0x8ff93c68e54f89c3
	.xword	0x5e313bd3afbb3f6a
	.xword	0x3c8299c32d2e1d07
	.xword	0xf73d1e1d4522b56e
	.xword	0x79292cdf3a35d4da
	.xword	0xc23fe5f85864b767
	.xword	0x4bb103f3b7b4d7fb
	.xword	0xc39b4963355313f0
	.xword	0x7638c13aca3931b2
	.xword	0x9147404cced6c84f
	.xword	0x3e6dc30b5915ab5c
	.xword	0xfce543a2ce3c62c8
	.xword	0xb287f6925861bfbc
	.xword	0x56e6292d5c156b31
	.xword	0x72b75d862ce32814
	.xword	0xf853cb7f0acfe0b7
	.xword	0x2868821bc723b17c
	.xword	0xc0ce42746ea7fc03
	.xword	0x03e675e097338b6c
	.xword	0x3544560c7a9e634c
	.xword	0x95c9abe2f9eca1a0
	.xword	0xc46d17a1e489c528
	.xword	0x88e29a5c3cce0e60
	.xword	0xa7f07c32c278bfff
	.xword	0xe0e4865d22556670
	.xword	0x3255a4099ca94ee1
	.xword	0xa34fee1d6a2962d2
	.xword	0xd2115d002f318f9a
	.xword	0xa0752ff9e6c026e6
	.xword	0x2b0b603de4c6bb30
	.xword	0x640c6e2eda109529
	.xword	0x4028463b213d04d7
	.xword	0x3f6f27eadb9dd3bd
	.xword	0x222f801dffded8e1
	.xword	0xea49f299704fc102
	.xword	0xa7d2035526e67efb
	.xword	0xf6f72bdfcb0bb6af
	.xword	0x390bda236b226c1a
	.xword	0x6b33550e0be22bf0
	.xword	0x563b2fc2a0acbb7d
	.xword	0x1873c9dee207fdef
	.xword	0x4e5b86a1162cf338
	.xword	0xc727bb8dad83b561



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
	.xword	0x180ffcc08c2c71ca
	.xword	0xfa5758603f101bf0
	.xword	0x77f569d4e794ae77
	.xword	0x90110669d180e661
	.xword	0x326969595e07c70a
	.xword	0xa5d731f9fab63d36
	.xword	0xae78ef1b16c615a1
	.xword	0x3e5112bc42fb6537
	.xword	0x23d420411ba492a0
	.xword	0x14193c8fe8335cc8
	.xword	0x05d152026caa3def
	.xword	0xd1536a7b6a2d9037
	.xword	0x0e2d6e61bdd60060
	.xword	0xbd1c2efb77245dbd
	.xword	0x0d246b697fab8740
	.xword	0xcf28236d92110f59
	.xword	0x760dc60f7cc3802d
	.xword	0xeac9cab0eaf5db2f
	.xword	0x863ab69a5b2ce3d7
	.xword	0xeff4be8a790dfd84
	.xword	0xf828e06300841386
	.xword	0xa017047a37174f26
	.xword	0x85e852cfa5eeb69b
	.xword	0x80ac6be9817fe17f
	.xword	0x96e559a785a7282e
	.xword	0x628431986e65e9e6
	.xword	0x205a0d3664a14702
	.xword	0x21456a3c91f8891a
	.xword	0x299cf8a7547778ac
	.xword	0x69a731106de56bf1
	.xword	0x63c29e4279927e68
	.xword	0xa6ff597c84a0cfb5
	.xword	0x23df4a949c943ae9
	.xword	0xa17a526cf4ceb252
	.xword	0xc420d09ad52e842f
	.xword	0x61866ce61b95dda3
	.xword	0xb33f5abfe67bedc1
	.xword	0x0db5faf423991b2c
	.xword	0x95d262ae1b3eb52a
	.xword	0x389decf5d69dfe0e
	.xword	0xc14d24d934afacb1
	.xword	0xf25611ab7bbcb4f2
	.xword	0x7f9809bd0789cbe2
	.xword	0x5cef3d0960ae47bf
	.xword	0xfee588cf101501e4
	.xword	0x1d42f70c0af3bb7f
	.xword	0x43e97938e9919f9c
	.xword	0x5cbb8263e8ad97f5
	.xword	0xc683d5dfd5a5462a
	.xword	0x94a9948cccc05263
	.xword	0x8090ea1789d284a5
	.xword	0x37ef1cddeda8f204
	.xword	0xfd071a2f868c5d07
	.xword	0xff96cd25c79f43f3
	.xword	0x672675233b1b9fce
	.xword	0xb08ea01eb07cb890
	.xword	0x0b65f8629312d741
	.xword	0xc3c0f6fda1a3f323
	.xword	0x40a40f85011f43d1
	.xword	0xa37235a1305ed809
	.xword	0xe01c03d16b6bce16
	.xword	0xf0e9a68eccdb0735
	.xword	0x30e172cf4059b7e2
	.xword	0x5f9e96bdae2b945d
	.xword	0xb3d33c16dc3fd29e
	.xword	0xa91818ebfef03c1d
	.xword	0x18daf708f80f6812
	.xword	0x3fb9fdd9f4d2de94
	.xword	0x6e08b009e0119061
	.xword	0xe9df2f634c3e5934
	.xword	0x194cd329c1d42818
	.xword	0x832afadd67b5017e
	.xword	0x786a22c4670bed3f
	.xword	0x7b607b10797a9cd2
	.xword	0x74fb8a83136d6de5
	.xword	0x71b9183d7c764839
	.xword	0x680380a10228ac93
	.xword	0xfd64335eb5412f0b
	.xword	0x3827a1706e9bb97d
	.xword	0xfb731f339e4702ab
	.xword	0x88fb65b23ad34849
	.xword	0x4e1edf95b03d280a
	.xword	0x061271b31078aece
	.xword	0x449537b604cf6197
	.xword	0x7fa932de2d364288
	.xword	0x07faae76530d7a98
	.xword	0x34e8334a669cfd20
	.xword	0x2801708f40e4ad45
	.xword	0x0371d3e75d0e50b3
	.xword	0xf75e6525bf965139
	.xword	0x739d29ee3c8a1478
	.xword	0xfced56dab2d26ea5
	.xword	0xa9f9deb5ab310afe
	.xword	0xf4713356cc0d372d
	.xword	0xe48930f6a3bed1a7
	.xword	0xae5a5b2ff8787c27
	.xword	0x2317f3a323e78188
	.xword	0x500b9500eeeb51cc
	.xword	0x6fa50501f9a89190
	.xword	0x8815ad6915393a0f
	.xword	0xbdbb492cc1d2982c
	.xword	0xb37c08b60a799fee
	.xword	0x63dd2a20426385e3
	.xword	0x771604bf0193090a
	.xword	0xaaa31b9dcb8c5ad0
	.xword	0x6f93435b51b13c3a
	.xword	0xff7e1a77064ecfd4
	.xword	0x204ffadb546bb8e2
	.xword	0x1befbfcac698d82f
	.xword	0xc7fb43b6b8901252
	.xword	0x3cb9ad934fb5edfa
	.xword	0xfc441e2b1f75931b
	.xword	0x8dcdf2825d0de4ef
	.xword	0x62d474b5768824db
	.xword	0x62cfb28199dd2e42
	.xword	0xc8f3effc20c225ba
	.xword	0xa1595456955ccf92
	.xword	0x905ded279c387dc6
	.xword	0x8eb2c65b892d40ec
	.xword	0x4b5a7f76fcc4b00a
	.xword	0xc990c569795c456d
	.xword	0x2af4cb8d96453e0a
	.xword	0xad8b512ec91aa742
	.xword	0x627ae340985687ca
	.xword	0xbc76a4ac264a24d1
	.xword	0xd0b898001d818c1c
	.xword	0x505aef6cb20d6d27
	.xword	0xb7c09c0cb68b0c73
	.xword	0x7e170182d2ca3f1d
	.xword	0x003c97b27a7b6b67
	.xword	0x967c5475e24f4d61
	.xword	0x6e54db703adaf657
	.xword	0xb42b5a986fd7b718
	.xword	0x600da2d69ee863af
	.xword	0xe70d1b7a965b330a
	.xword	0xe6886ee19bf1306d
	.xword	0x0770ddc735dbdf47
	.xword	0xaeb8f398e18035c6
	.xword	0x605b54fcaef58b71
	.xword	0x8f53ca8b2fc258ea
	.xword	0x418231716bf37663
	.xword	0xed4241bbab11f384
	.xword	0x5d3da37c182e95bc
	.xword	0x2af23075ba2baac9
	.xword	0xfc5c3222cff2cf9d
	.xword	0xc77435a976517ce0
	.xword	0xe38750792afc3130
	.xword	0x260a99f1877e686d
	.xword	0xd8db50cd7bf2b8ef
	.xword	0x82c81b6c14a386f1
	.xword	0x19fa39b0d24c418b
	.xword	0xf99f388d46edf5cf
	.xword	0x1202142f41fc58c1
	.xword	0xd12c776460c76d59
	.xword	0xaf1931e7b12cc535
	.xword	0xbb99170e494f1846
	.xword	0xabeb5978655fa004
	.xword	0x19a5a56aee881848
	.xword	0xe5362d0f58787255
	.xword	0xa35a439e30dfb1f7
	.xword	0x18c166b43c7135e8
	.xword	0x7d35b7d40842e3b7
	.xword	0x32ad5e069c9ecb4c
	.xword	0xb6680dfe142497df
	.xword	0x7914ab237bfbd2b5
	.xword	0x9e38b711860e0b11
	.xword	0x668fb3e2aa8ba915
	.xword	0xe0a556fb278662bd
	.xword	0x38a91d0ba19fa186
	.xword	0x93cae979ec85cc8d
	.xword	0x18d0aaa2920786df
	.xword	0x23a2936ac9f3db4f
	.xword	0x69e9351b68a31aaa
	.xword	0x009f4dc2398644f5
	.xword	0xcd009f73aad5e327
	.xword	0xe2a9ba449613c9e1
	.xword	0x839e1c381720a983
	.xword	0x7d216ec9c95ad365
	.xword	0x8cf4c97330689aff
	.xword	0x6b594cf5929ea232
	.xword	0x17958cd7ae3fd07c
	.xword	0x3b643eda30da06d8
	.xword	0x6e0e9a9b9935b228
	.xword	0x403ea295b9ad76a8
	.xword	0x7dc7574815ec7cae
	.xword	0x4e39acb8d24038cc
	.xword	0x943ce40197abe8af
	.xword	0x8db73b3c1538d352
	.xword	0x27600f8b6cf6b0c7
	.xword	0xc9d122c5264f8466
	.xword	0xbc6a126e5da4ea0a
	.xword	0x5ad3641c9f39a051
	.xword	0x4c1ea88fcf8228f7
	.xword	0xaca0b904b6d33101
	.xword	0x25a35130048a8231
	.xword	0x0a79f83b8c37b408
	.xword	0x8edebeed2d2f9b21
	.xword	0xecf78df54c448ccb
	.xword	0x3ae411760bf24ac6
	.xword	0x2d924c640f3a63e8
	.xword	0x113d6b263d69a493
	.xword	0x1c167b5213ecf0fd
	.xword	0x103cb5ec82fd32c8
	.xword	0x417477fa8d1fcd58
	.xword	0x3d94629d6d2347e3
	.xword	0xa09d644b1603ce66
	.xword	0x3a5b295837c61f7b
	.xword	0x0cff7a80599b56e0
	.xword	0xa88c46fe8dd9f109
	.xword	0x50c7690c58e0164a
	.xword	0x12cca3760d7789a0
	.xword	0x87761256052a57da
	.xword	0x598bcf1d313c9fb9
	.xword	0xa018f81fdaa4a36e
	.xword	0x26c4fc91ad1b420b
	.xword	0xbc18123e2ddb63ba
	.xword	0x25b8fc0b50b0cdcb
	.xword	0xf41387618875862f
	.xword	0x08c8c0e941fe83c4
	.xword	0xe96d4e854af1ab00
	.xword	0xa045e91db9e6ee7c
	.xword	0xd69464be9478266c
	.xword	0xeb42d82ed943ac12
	.xword	0xaf806ca0ef59c60f
	.xword	0x1f174490b2dfbe6f
	.xword	0xc9e059938488aa75
	.xword	0xaa2454307e9a8211
	.xword	0x4e2aeee57756a775
	.xword	0x94b3ebf0881d1b19
	.xword	0x7ccc0eee3ca66fbc
	.xword	0x9500c0e980ba6022
	.xword	0xc3dda23dcc274455
	.xword	0xab243889eabd2027
	.xword	0x579c465874effc55
	.xword	0xa754edf26f8ecdcc
	.xword	0xcee707b61ea31f29
	.xword	0xce172fad95306e78
	.xword	0x66ba1f21f666cd46
	.xword	0x90ef42677feb2cd7
	.xword	0x16f3790c48d680f6
	.xword	0xb7ae3a728c1f13a8
	.xword	0x46a0c653b18cde0f
	.xword	0x93981ed11a47d3d9
	.xword	0x24ae474643fa6fd1
	.xword	0xd459434df7115e77
	.xword	0x2b956e7e777632c1
	.xword	0x819deedc29e3f332
	.xword	0x3f5f539399b6e1e6
	.xword	0xb52669362ae52085
	.xword	0xd7e7f01237c73b00
	.xword	0x91c9bdfa4ec9562b
	.xword	0xd8a24486ca9e13a1
	.xword	0xece8e2246f94d454
	.xword	0x66b1674550c56c9e
	.xword	0x1ffe5b07eeb41637
	.xword	0xacf4208323c253a3



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
	.xword	0xbbce547304a113a6
	.xword	0x1755d8bf9f62b760
	.xword	0x93ec5fa90685260d
	.xword	0xdcfaf16ba2ebd3e0
	.xword	0xc4ece291a0971291
	.xword	0x77e6afe4c9ee03d9
	.xword	0x5ca89314b311838d
	.xword	0x5dc0c9478a217f1f
	.xword	0x74bb76823765e152
	.xword	0x8db6e50dbc26413e
	.xword	0xf68b974038ce55cd
	.xword	0x74592573a0880f87
	.xword	0x946b6e8d4c64c370
	.xword	0x6c4b12eab51b265e
	.xword	0xb057f16b31b24bee
	.xword	0xc1799eb5ef4db63e
	.xword	0x5b0c77b41a2230eb
	.xword	0x903c395a0dbed6fc
	.xword	0x77e74084e01aebff
	.xword	0x2bc144686081c605
	.xword	0xca178423c6764107
	.xword	0x245af56cc4b9db20
	.xword	0x5efde5388a49337c
	.xword	0xa7cb4980146a93d8
	.xword	0x760e5063f42d2e22
	.xword	0x1cf779be62b1f90e
	.xword	0x811346f785b19be8
	.xword	0xebf89bd86deb0497
	.xword	0x0d7bb03aa2f352ac
	.xword	0x9760214a3a33f6b2
	.xword	0x69356733cfadefd0
	.xword	0x40a93cfa8e067220
	.xword	0xafac07051da47a15
	.xword	0xc3ad48d4cd92fdcb
	.xword	0x4233dc533e988253
	.xword	0x14b029ac05197bdd
	.xword	0xa40fc7f66058f739
	.xword	0x28a5469690acbf14
	.xword	0xe11ea29b09918c1a
	.xword	0x459db97c4ab02cc9
	.xword	0x33360928e63c9730
	.xword	0x28269c3dbf5dc6f8
	.xword	0x734f61681cb0a3f4
	.xword	0xcfba4cc6e6015ab2
	.xword	0x40e80b5db6ba5707
	.xword	0x09e406ca4217bbe5
	.xword	0x926da29921d30bf0
	.xword	0x8292ff85240b3f75
	.xword	0xff43c45a3bc564a2
	.xword	0x74154f0f311eb474
	.xword	0x372ce5d6e30051d8
	.xword	0x4bde39f33656ad1c
	.xword	0x2fc87b3209208e52
	.xword	0x915910bd0663a65f
	.xword	0x3a90bf354b89d4b1
	.xword	0xaf5d0acc2eaed1b7
	.xword	0x209d1e69fe8c26f6
	.xword	0x921eec9060f0d036
	.xword	0x82216078a1727757
	.xword	0x4924afa10e03fb79
	.xword	0x25df0272c5b20c9c
	.xword	0xa4792b24adebbf1f
	.xword	0xbf07cefdec398a9d
	.xword	0xb6803135b468382b
	.xword	0xc7871b24fbf6c37b
	.xword	0xfddd171df532a052
	.xword	0x837fb38d251b5a68
	.xword	0x7fb55f49eb1b0d12
	.xword	0x5d11e04c95cd3fea
	.xword	0xe34105f75edb8fab
	.xword	0xf2e4ef0399387c65
	.xword	0x9121c38ed88f385a
	.xword	0xe83095d3d908bfc5
	.xword	0x02664de05bdebdc9
	.xword	0xf2bdfc1cee2b8c9e
	.xword	0x6875e21e8c6d4c40
	.xword	0xcb8be9d260e6c55e
	.xword	0xdbc6456d59bcc7ba
	.xword	0xa7a1166f6e9beeb8
	.xword	0x3c847d490d873538
	.xword	0x56587111fb0571f8
	.xword	0x9cd78682305bc605
	.xword	0xcea6cbe96cd8d04f
	.xword	0x6ac9d637435f8a77
	.xword	0x28d20e34075f7251
	.xword	0x5853236a86a1fca4
	.xword	0x8151922b71629060
	.xword	0x2e4b1ff920b94005
	.xword	0x5cca9fe4e2fa02bb
	.xword	0xe3ccba3a3d77aee9
	.xword	0xe947cc264f1a3082
	.xword	0x0262316ce0b837d2
	.xword	0x79363ac96dd9815f
	.xword	0x54e1410ecc4e9653
	.xword	0x47896f77a5ac2b81
	.xword	0xe13ea98e52fdda05
	.xword	0xaaec951945aad8b5
	.xword	0x2ac3e3c7e339e85b
	.xword	0xa78e06ccd0aa5f30
	.xword	0x36556c3fb35ce49c
	.xword	0xe62d06ce8db56e0f
	.xword	0x073b3a9314b0ce6a
	.xword	0x351bd3741ee8d695
	.xword	0x72b0232315bc5fe4
	.xword	0xfd7ca22d89f0952b
	.xword	0x2be5a7a4b1f64458
	.xword	0xd1f44c81aa423f3d
	.xword	0xf571631f9ac7bdab
	.xword	0xb49f141a15d50079
	.xword	0x4ec9c6ea5d6dec20
	.xword	0xdfb344e0b41fe544
	.xword	0x0c5f470ea6f2dc50
	.xword	0x343500fc1db69f27
	.xword	0xf5b19fa30a7b7584
	.xword	0x2cff2ea1a058b3a8
	.xword	0x7ce8f23c4c1e5620
	.xword	0x0a599080f636aa83
	.xword	0x85ca10da4a4203f0
	.xword	0x6e55952533e84df0
	.xword	0xe90d96c12dbe2bd3
	.xword	0x9d97b0ebe70c714b
	.xword	0x24ff7ebc2a868e11
	.xword	0x4dd6bf015a9db7c8
	.xword	0xec4ef9e4bd9657dc
	.xword	0xf74681217a61a57c
	.xword	0x6d013d235f83ce7b
	.xword	0xee1e4dcd3108a016
	.xword	0xa370a6fd35f02b9f
	.xword	0xbf3cd48d48ea382a
	.xword	0x42d396b5af4f29df
	.xword	0x54db636e3993c122
	.xword	0x695d92e2583e4de2
	.xword	0xeb0988ce2b396baf
	.xword	0x210562576ed18d24
	.xword	0x98e703f6f8c02bca
	.xword	0x6b4a699901e1c6dd
	.xword	0x6bb18d488f296c5f
	.xword	0xa88dcfa2775e61b8
	.xword	0x8b85a7e94d193095
	.xword	0xfa70e554c357f848
	.xword	0x7bde98b0417eb571
	.xword	0x0a20261598b1a0cd
	.xword	0xf39b4ad99552671a
	.xword	0x7c93e8a132a6a686
	.xword	0x324b9d8b8c7a17f2
	.xword	0xd9dd16b1824d4438
	.xword	0x9c21a25025151d46
	.xword	0xbe1ce6711af944a3
	.xword	0x8f50c5b8a82b006f
	.xword	0xa80bf99fd427ce93
	.xword	0xeedb98f9bee14947
	.xword	0x4c70e3c4397fb56b
	.xword	0xef4642de2d03cf15
	.xword	0xb194ece64e31175b
	.xword	0xbcb4db9d3fd23d8a
	.xword	0xb5c4d89e4342232c
	.xword	0x3efd17e5bb6e4973
	.xword	0x6041887ce6d46f56
	.xword	0xe124825292d97359
	.xword	0x51ea463b30115eaf
	.xword	0xb8b08140d1ffd6cf
	.xword	0x62dda0adfb293471
	.xword	0x2a633164fc96723a
	.xword	0xdc6b3deed6d1a5da
	.xword	0x76fa32f3c2fd0d6b
	.xword	0xd9e4cbf5693d4449
	.xword	0x7cc19902841e1847
	.xword	0x3efb3ec257197838
	.xword	0xcebbf22332cb007b
	.xword	0x4871905196a686c6
	.xword	0xc8da75df77300a37
	.xword	0x87865f1f5e1064b0
	.xword	0x133bde805fc424ec
	.xword	0x0aa99b00aace49ef
	.xword	0x4683e6361b6904b1
	.xword	0x1ce97393638983c1
	.xword	0xb34362f0d4c97b42
	.xword	0xa028fb9cc8b3f7fe
	.xword	0x578a1fdf81383a17
	.xword	0xf07bec9c30254e7f
	.xword	0xfa8e8b85b4d423d2
	.xword	0xa75f48c7b837a2a5
	.xword	0xed17bee0dfa949b4
	.xword	0x1c41279f6b2e2073
	.xword	0xb183e760879f2901
	.xword	0xadbbcd51184c22a1
	.xword	0x6ee3c29fa0fcff29
	.xword	0x94f23788cd6de1ae
	.xword	0x08cda8985acda300
	.xword	0x0115dd4264e11a7a
	.xword	0xc3b7e6dba756bd61
	.xword	0xaa363df1e8157fe1
	.xword	0x2b1b8dd71ce0837a
	.xword	0x89ea554efdd17d2e
	.xword	0x82454555a5d3503d
	.xword	0x37bab4fac55585de
	.xword	0xe63bfe99a48d8685
	.xword	0x952362276115a9ac
	.xword	0x261d2456cb1fa5fc
	.xword	0x8676ad311ea6b1ed
	.xword	0x1bef4abc9bbb06c3
	.xword	0x4077799d2ac218bd
	.xword	0xcb36fc4f3573ffd4
	.xword	0xf34597931434c1bc
	.xword	0x2458753baf02eaa4
	.xword	0x57471abb6b9aa8ec
	.xword	0x1d48a9af77cd29ee
	.xword	0xa65bfb3123c484d4
	.xword	0x164238aed5bee58b
	.xword	0x1eda22d8b52bbfe2
	.xword	0x40fa97d7b5d28ff4
	.xword	0x1ce331fc767b0927
	.xword	0xb79e1f5741c2befc
	.xword	0x970fd769d8a12dcc
	.xword	0x93d7d4d2ceb151c9
	.xword	0xc570f4b95374fa6d
	.xword	0x1294b8ad914c134a
	.xword	0x9b631ef6057d43e1
	.xword	0xc7176d452526f2a2
	.xword	0x6fba98c6455ba9af
	.xword	0xe8ab50949b674bc5
	.xword	0xdc6414f6d4e0fd25
	.xword	0x1754dc4e859c470c
	.xword	0xd21bbb69a300ae6c
	.xword	0xd95626610b580911
	.xword	0xd1b787578f78002a
	.xword	0x3395a6d3e5f872b6
	.xword	0x5862d7b5ca82301d
	.xword	0x42da31e9210082e4
	.xword	0xb60a6e0b25c45ed8
	.xword	0x1c46123d4c55aee5
	.xword	0xd9885b2a7cff6ca0
	.xword	0x3913ddef435bb082
	.xword	0x11c9e9ab773d6eea
	.xword	0xc2036babd6d16ea4
	.xword	0x8a61fe18c3f76ba7
	.xword	0x5c76e4f542ceaf3c
	.xword	0xaafd114053f800f9
	.xword	0xcb73820c339ea9f7
	.xword	0x9a52fa0c1e43c6e7
	.xword	0x7c0ec48264048d68
	.xword	0xbe205cb190d55d41
	.xword	0xc699db75003966c5
	.xword	0x7dafd0faf862f9ad
	.xword	0x73a12e3becf81d8d
	.xword	0x132509a3c8558618
	.xword	0xafc5cb0364cbf9ac
	.xword	0xc4d683f026b7a3a0
	.xword	0x58e45371c35db7e5
	.xword	0x82c452de657e681f
	.xword	0x34e393f929f1eea8
	.xword	0xf037aab2e26f3549
	.xword	0xe062a1ad800b3cbb
	.xword	0x6dc5a402a8492f9a
	.xword	0xb487e09432097881
	.xword	0x068b2c0534e91d0a



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
	.xword	0x66f82fa667971e01
	.xword	0xf41444869e8228a5
	.xword	0x9a1a8550484fb436
	.xword	0xc2904273b0d35fa3
	.xword	0xb226da414e014e0e
	.xword	0xe9f863cf390ed9b8
	.xword	0x7707e29363c3d95e
	.xword	0xabd860b62975b56e
	.xword	0xb231eecbdbc81ea5
	.xword	0xf24d41a20b76cc0c
	.xword	0xccc8d85a05cc34fa
	.xword	0x90a09057721f0752
	.xword	0x9ee97f7a1149c0a5
	.xword	0x5dfd04882456ec40
	.xword	0x608e631c700fe568
	.xword	0x5efe3560a6df1458
	.xword	0x6f25bbc556107a8b
	.xword	0x557841e3cf12b54b
	.xword	0xb1552a4266be19b6
	.xword	0xcbca62dfc4e69e9b
	.xword	0x07cfec085e08c61f
	.xword	0x0dc8472044c81ef9
	.xword	0xe0b762bb4356249e
	.xword	0x2efd068949cc4c96
	.xword	0xf9992ca762f1d93f
	.xword	0xbc4ccfa2f5853624
	.xword	0x8dfa3c721ebbad52
	.xword	0xc4166321fb5a68c8
	.xword	0xa796d0cd60235f15
	.xword	0xb546bb210238a83a
	.xword	0xe38ab37add48b725
	.xword	0x6a1f26380f1c03f8
	.xword	0xb140538ef02a79be
	.xword	0x1496428bbcf21cf5
	.xword	0xc6f549191378258c
	.xword	0xbbb2f0c8f8684ac2
	.xword	0xb41b1c046f52849f
	.xword	0x48e6884296a2c3f5
	.xword	0x43751a9de925ac7a
	.xword	0x5bf89150237e72a5
	.xword	0xabce095b63d4114c
	.xword	0xe4db5f0491a36234
	.xword	0xa820f715cd9d2437
	.xword	0xb84eae5394bbbca0
	.xword	0x696852ac9d651f1f
	.xword	0x1ed71afda7ee5468
	.xword	0xa4811336bc0c29e9
	.xword	0x1bf72911ca70b50a
	.xword	0x1d71aa0780c4ae4d
	.xword	0xad0fc87a76eaf2e3
	.xword	0x64bc4cd98c15df4f
	.xword	0xacfb284017c9e1a5
	.xword	0xf384134a7fc3c0fb
	.xword	0x605e98e944ad4cbe
	.xword	0x205b852ea3b661fd
	.xword	0x29f6863e3b6fa278
	.xword	0x92874dad0e48da99
	.xword	0x6beaa4402c67e3f6
	.xword	0xc34964fec9f8dcfe
	.xword	0x865e03641687e335
	.xword	0x780a2fa5624c6103
	.xword	0x2c20455246fd41be
	.xword	0xbb1aa912b10c1a07
	.xword	0x54c991f81483a9ed
	.xword	0x405c4ccb092f2ec7
	.xword	0x0f0abea0301b3482
	.xword	0x94e21cecac9af454
	.xword	0x2d1a3b08cc726ab8
	.xword	0x72bb01b5cac5a500
	.xword	0x8736af0d6dd4e193
	.xword	0x0ed7aa4b76de4761
	.xword	0x35a4c7ca3cb6a460
	.xword	0x2cad477c923a38cc
	.xword	0xb8bf32d1e51f3ee4
	.xword	0xc488f6f0e624883c
	.xword	0x18d3732b040ed553
	.xword	0x2c2e1533d6488b1d
	.xword	0x840e4049bb72a750
	.xword	0xee031f21461a7262
	.xword	0xb5ecc1c7ee6ad4db
	.xword	0x080aae6b7256bc97
	.xword	0x5f209e80f315a503
	.xword	0x93f1355003f613b1
	.xword	0x3fa5c49f7d618df4
	.xword	0x1f1b99e93e33ea0b
	.xword	0x302c8798a88960b4
	.xword	0x2cd5fad8cb042de3
	.xword	0xe73014b89ecdf467
	.xword	0x8b94dc446babd76f
	.xword	0xca8311b8fa461fba
	.xword	0x4840260d0600222f
	.xword	0x6722c36b54cb316e
	.xword	0x44989860f112e128
	.xword	0x53bb290a1f6f0f62
	.xword	0xbe2c54dbd070e556
	.xword	0x864ea2fc266b6464
	.xword	0x57d11972cd2716c4
	.xword	0x9851ad039c7568dc
	.xword	0xba1466d8edb07df6
	.xword	0x8f6a36426b10e12e
	.xword	0x7a0bd0e15c6935d4
	.xword	0xe37ef7b5aa5100b5
	.xword	0x8b34bc9d1ea0bd40
	.xword	0x5bde70d921261365
	.xword	0x00625d9566b13303
	.xword	0xdd9353de1e922402
	.xword	0x60370311c9718dd6
	.xword	0x1a589b416463c3ff
	.xword	0x70fc078fa420fde9
	.xword	0x78aec80bc7f3baa3
	.xword	0x2069eaa21db37e60
	.xword	0xfde3eb4f295e226f
	.xword	0x3381aa8624556df3
	.xword	0x8b749dad4e27bb02
	.xword	0x9f18d89c7b57617d
	.xword	0xeb20aec9e4f82332
	.xword	0xf0e363175097685a
	.xword	0x5b7d35902b46b182
	.xword	0x0eee0ffa2322fa9e
	.xword	0xa8566b3a0ec9cb6e
	.xword	0x639644692d42a538
	.xword	0x45af0851f883ef6c
	.xword	0xb63120f1798c9802
	.xword	0xc85e36d4492ad166
	.xword	0xe76663a369d925b3
	.xword	0xd7040eac4fd7bc25
	.xword	0x4cb2124e7dbe9c3c
	.xword	0x9fb94c0f904a7887
	.xword	0xb9e100c6aa620c04
	.xword	0x54d9488baaffecf1
	.xword	0x221fdca622fe7e01
	.xword	0xa7ec54492fb12ad2
	.xword	0xa6a52cf7fffe21af
	.xword	0x55207ece67e63bf8
	.xword	0x16f9eb68e5938c4d
	.xword	0xf0d86b6e786d85d6
	.xword	0x9a038f78c4c64e72
	.xword	0x49c0746219d44471
	.xword	0xe192eb4b8c289a27
	.xword	0x363413cce71cc37a
	.xword	0xb7f70bed75ebbafb
	.xword	0x3f44e5016a1bbba2
	.xword	0x2f7fc16543b46144
	.xword	0x3fc2d1f7daf4b967
	.xword	0x7dc82fe91113b758
	.xword	0x1640ad3b58a2ca82
	.xword	0xed15ac40a562c6a0
	.xword	0x15af03018cc8e8cd
	.xword	0x71f96cac91815e4b
	.xword	0xe56270fff47911d6
	.xword	0x51a918d5c8c2be1e
	.xword	0x7597f12cf5ab0f9c
	.xword	0x1a2d66c164f4b986
	.xword	0x47526026fcb256d8
	.xword	0xc32a2f44cdd504b7
	.xword	0x399ffbee0b6c2052
	.xword	0x0f9ea0a93cf4ac74
	.xword	0x3b63d7f320a8d2cc
	.xword	0xdd6fef5dabd4f32c
	.xword	0x74084f105783192e
	.xword	0x6d06087ff385ee62
	.xword	0x457bc8951abe9465
	.xword	0x0cdf5c716b5ccccd
	.xword	0xbf9b0c23ade4653b
	.xword	0xed99434455914877
	.xword	0xfd58faa0e34ec7cb
	.xword	0x9e8e7d2f29794340
	.xword	0x8a00122d1112f72c
	.xword	0x8fc4153c5b85b08b
	.xword	0x9314af3e8faa91d1
	.xword	0xd01ba01782468315
	.xword	0x75db9284c262e650
	.xword	0x8b1a427930c959a4
	.xword	0xd79cf3023607ea56
	.xword	0xe21e331b853b2c3d
	.xword	0xedc7f608849bef2e
	.xword	0xdcf1e00d7258c323
	.xword	0x23b2d3069c80262d
	.xword	0x0910816615657d35
	.xword	0xdf37eeabc9509a06
	.xword	0x99de9e270c94b659
	.xword	0x0942f1e69ffc22bd
	.xword	0xf35e95931bd51f3a
	.xword	0x9b914e7b5abd03fd
	.xword	0x5a2c3436d3b203da
	.xword	0xba8ab279b58b7f03
	.xword	0x5f3c80ab15863a2b
	.xword	0x7cd814ef0f277d60
	.xword	0x8ddb345c4cecda27
	.xword	0xb2e193ff8e467428
	.xword	0x554cfc44c8a1283d
	.xword	0x4440973fb4c2148a
	.xword	0xa44c8d2523d07394
	.xword	0xb075c34636f422cc
	.xword	0xb87a34d87706ac76
	.xword	0x3a6a979fe5267119
	.xword	0x690a6fcc3ef6e084
	.xword	0x202191e53063899a
	.xword	0xcdeadcf4ebad8dbf
	.xword	0x924646efe6161a63
	.xword	0x4f0f7140304e8cdd
	.xword	0x18cb5ae24fec2e68
	.xword	0x8418e34d86f50f4d
	.xword	0x8ec0242f49b87619
	.xword	0xe8e29d10a781884f
	.xword	0xcdcecc51819d92fc
	.xword	0xaed0df91d23ecbac
	.xword	0x1275787226ca4b8c
	.xword	0x81aea9878d1accc9
	.xword	0x616fd51807e961db
	.xword	0xae6580edf324ad56
	.xword	0xf3525a575a0da885
	.xword	0xf10eb986456ea26f
	.xword	0x683606d3633345b6
	.xword	0x2004e03e16376119
	.xword	0x34ad86423e771b23
	.xword	0xf487e0549dadec2b
	.xword	0xfd65270d6b99cfd9
	.xword	0x1d780c409a41c490
	.xword	0xa4cba5ced94574a7
	.xword	0xa7cac2768d24c7f4
	.xword	0x0056740027feb598
	.xword	0x8ebf26f5c48fdf22
	.xword	0xa2b8dd689b9760ba
	.xword	0x238822cf12b839ac
	.xword	0x7b2c46a6d8b11a21
	.xword	0x924d2d5c7e5a506c
	.xword	0xd2dfaaa721c7163c
	.xword	0x765f8a0fafa845f2
	.xword	0xf185ea4504a59474
	.xword	0x502d87d74983c8ba
	.xword	0x4d40cf8cff5d48c9
	.xword	0x52ca965779e40957
	.xword	0x66a7186bc38b17b0
	.xword	0x710f1b214385a0a0
	.xword	0xd94146b1b7aa5894
	.xword	0x969ca07d172bd7df
	.xword	0xdef7fef4b9cdd207
	.xword	0xecd46c6a92ae0cca
	.xword	0xca8746e303364c15
	.xword	0x68656e536dd5177f
	.xword	0xcef9953bb914af2c
	.xword	0xf792bd89050f579f
	.xword	0x93007b6a85ea711b
	.xword	0xfeb85a3acaf4d69f
	.xword	0x38bbeb458fe188d0
	.xword	0x8a81d7844c53ad57
	.xword	0x48c417d3748a481c
	.xword	0xf2776c721f7226e6
	.xword	0xee952f521dc4f952
	.xword	0xd3141000dab29eeb
	.xword	0x1c02679ebbc07621
	.xword	0x85d7637e40212c9f
	.xword	0xcbdbefa616fe1f24
	.xword	0x635ddb8796c75b47
	.xword	0x13105426e24b4c57



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
	.xword	0x95596b619dc028da
	.xword	0xfa65edae2d2d2f05
	.xword	0x463b488220048b4b
	.xword	0x1775929e7974e731
	.xword	0x0456eaea98a94afe
	.xword	0x0bf8f670a17d1ffb
	.xword	0x76cc7c91f2d40321
	.xword	0xa819359e53f1e151
	.xword	0x662a7a66ab352927
	.xword	0x28e450afcdf7ec1c
	.xword	0xcb0f59e2f752d7aa
	.xword	0x62eb68b5a69397fd
	.xword	0xd223577d4352545b
	.xword	0xfe5c57666a071106
	.xword	0x1717010cb52a9fe4
	.xword	0xa28c70a29b36709f
	.xword	0x407fb7eaea4e1143
	.xword	0x2ce813139b6e3454
	.xword	0x3eedaee0052a323b
	.xword	0xb571661694fa5d26
	.xword	0x48aa7473d5183b1c
	.xword	0x1f45fdc32f28a6e7
	.xword	0xf761e8c310905ff2
	.xword	0x2a98d76b9ad0730c
	.xword	0x086e233f987a8b44
	.xword	0x8002b3957064fcab
	.xword	0x9888efb928b9a128
	.xword	0x359e006ea6811431
	.xword	0xbcfc38f416d2e0aa
	.xword	0x1bf3b07317f369d5
	.xword	0xf458e5d68bd66c3d
	.xword	0x4968a5b58c240fb3
	.xword	0x74c9f490333208dc
	.xword	0x3d4d313f4847eca1
	.xword	0xae88c6c5406daa3f
	.xword	0x2bd15402c6f8a92c
	.xword	0x1cf159567f027ecc
	.xword	0x3e0e83bfb88ef233
	.xword	0xb5073e94c05464dc
	.xword	0xfd0a00e6a2d03c4d
	.xword	0x3e932348bed04956
	.xword	0xda13e32c9d490f7d
	.xword	0x42301cea49828c24
	.xword	0x6c8b1b730c51601e
	.xword	0xc8fa34e39611de9f
	.xword	0xbe0644a057a844ac
	.xword	0x6caf1cb5262f2ce0
	.xword	0xd16182ab8ee7f60b
	.xword	0x9bdaa86128b995cf
	.xword	0xbb7b78b4d62112b8
	.xword	0x6666beb7e6467c09
	.xword	0xfd9e3c66a8189a87
	.xword	0xe7faffdc847aafce
	.xword	0x0ac6720237bdaf4e
	.xword	0x89f8596a01695f74
	.xword	0x7500586efde01710
	.xword	0x45b64d018523aa6f
	.xword	0x6013e20739257b13
	.xword	0x014488b25f669fa2
	.xword	0x979dbeffd4454a07
	.xword	0xa66a76ee8785e47e
	.xword	0x6007fbacbe888d19
	.xword	0x365a91be4b194d55
	.xword	0x8dd148e34a29ce8e
	.xword	0x54959419019aae37
	.xword	0x3265d9bf8a51acad
	.xword	0xa790b4eea874e121
	.xword	0x227d0730d2530720
	.xword	0xca727b3e25ac91a3
	.xword	0x2e586792707d6428
	.xword	0x4ed0e7455f202372
	.xword	0xcb4c3268c5e41795
	.xword	0xa88dd17ffc68eab9
	.xword	0x063acc51a5060ab1
	.xword	0x0ca47b8aba307962
	.xword	0x66c676903a36ae7d
	.xword	0x1e63e2c902daaf20
	.xword	0x74316b1ea391c5a0
	.xword	0xb628969bde8818ca
	.xword	0xb85c6d623cefdbee
	.xword	0x0341b9c4a223549d
	.xword	0xe70de5b999ac370d
	.xword	0x01d00de98ed210ca
	.xword	0x6e173310706e1bf7
	.xword	0x3aa23955fafef738
	.xword	0x3921c66eff0cd4aa
	.xword	0x753a68dc4ae7e01b
	.xword	0x6322fe9e3e715080
	.xword	0x886501a8d148d46e
	.xword	0xf17d26c1ddf88f62
	.xword	0x2740140ba72bae86
	.xword	0x0ec54c9bcc456bca
	.xword	0x1b4911c4eddac0f2
	.xword	0x0230d8bfa47864a6
	.xword	0x8070aa0d6a338274
	.xword	0x652adf99487ccaee
	.xword	0xa6c37643889e4d89
	.xword	0xd137a3568c397863
	.xword	0xea8fa5ecced61a03
	.xword	0xa4e0dab54ea54bbb
	.xword	0xed850533aea265b3
	.xword	0x215b181fb5bb730b
	.xword	0x61515e284db79a0e
	.xword	0x1ad4e28b549f9b2f
	.xword	0x72a6a5a5b3499ba7
	.xword	0xb97195199aeff735
	.xword	0x69758bae297cee3e
	.xword	0xe0c8ebe33880c8ca
	.xword	0xe51603099ac9d5db
	.xword	0xdfa95c8e8ba3d482
	.xword	0x1e7df64f3503d0a4
	.xword	0x65a088b400b8391c
	.xword	0xa59486abfa214a6c
	.xword	0x80d979eae3febc16
	.xword	0x98e23ed9d5a9eadd
	.xword	0x51156364d85db5d3
	.xword	0xf49c125a43d8ba59
	.xword	0x8f193fc759212742
	.xword	0xe21e4c87544ab8bd
	.xword	0x929745b547c37521
	.xword	0x06707e16f270e38d
	.xword	0xd94a39f874abaf04
	.xword	0x81cba82d86733d7e
	.xword	0x39c0a0bbec0cc428
	.xword	0x1e9d1380bc5291af
	.xword	0xd190975065f79499
	.xword	0x577a504c2999a794
	.xword	0xcf94badbc8f0795d
	.xword	0x332789afda15278c
	.xword	0x8ed5a3a6af2e24d3
	.xword	0x2a9fd39f82ca89ad
	.xword	0x208edadbb2b90ac8
	.xword	0xfd4161adce09a1cd
	.xword	0x1d87978ba9af102a
	.xword	0x7049f3ecf9f7a712
	.xword	0xb782b8855e0f210c
	.xword	0x230247705c2584ae
	.xword	0xa05aaf6d8b1e0c38
	.xword	0x58449bc027b6a78f
	.xword	0x0b5ee55025b150cc
	.xword	0x84249481e521bac9
	.xword	0xf0e37f35cf921fd3
	.xword	0x61ca0b09b89f0fe4
	.xword	0x170af475e116e383
	.xword	0xddace6e76e9133c8
	.xword	0x792954de91f1d05f
	.xword	0x0a5742281b475110
	.xword	0x598ee971a41e5280
	.xword	0x2e88f3f4c29ecfa1
	.xword	0xa2aae21646220e06
	.xword	0xaa777070b6a10420
	.xword	0xa05a341f532d76bb
	.xword	0x93d93629bf8d726b
	.xword	0xffefbc2948d6b75b
	.xword	0x0905e486789a4d20
	.xword	0x1a99c7dec6991360
	.xword	0x096e9f79e65f11e5
	.xword	0x3f549f33fe8b11dd
	.xword	0xfe9fff76cdb4b646
	.xword	0xc05b6533a9035887
	.xword	0xad458af4106199ae
	.xword	0xd963795bcbbffdc4
	.xword	0x55ecaba1e3388de2
	.xword	0x265a1fbd0ae42fa5
	.xword	0x8b6da1776c77ba0c
	.xword	0xdc8382d9c20c49cf
	.xword	0x118b70d82fd6a748
	.xword	0x233e0ce4abe04ce6
	.xword	0x4fa9fe6db2530e29
	.xword	0xe8ad1aa0f660b05a
	.xword	0x2b0f40c2fdfb6be9
	.xword	0x2b6fd6b94949d0f1
	.xword	0x3d2b5c3e69c46d46
	.xword	0x94e78f019a979686
	.xword	0x1e86288203ba75c1
	.xword	0xb02e337cf01cbb69
	.xword	0xf51a302de949e4a0
	.xword	0xf9d0e90aa7e8a62e
	.xword	0xa9414000a2a36bdb
	.xword	0x8083ba062ac02f6a
	.xword	0x9ab8ba88a01de053
	.xword	0xba5d2159e0a5fefc
	.xword	0x9ca90c0f37855fbf
	.xword	0xae396afc0174113a
	.xword	0xcfa2edd1d493149d
	.xword	0xf0700f01f3653e88
	.xword	0x25f10588410e08c8
	.xword	0x51f4cd4b1f2e574d
	.xword	0x31e535b6f6d077f0
	.xword	0x457a799213dfa4a6
	.xword	0xee90950588d8a5da
	.xword	0x23eb193fd1804762
	.xword	0x2498e66497ff0576
	.xword	0xce2cf110e702b552
	.xword	0x34fda408741a068a
	.xword	0x59610c8bdf864b0b
	.xword	0x331cceff0decbd7e
	.xword	0x961aaaa65552feed
	.xword	0x3e8aec831959da61
	.xword	0xceb124ab318a3add
	.xword	0x89b70dafc68b6201
	.xword	0xe15ee16a0572f334
	.xword	0xb857c28803d8e6f9
	.xword	0xfc78b7d959b2bfe6
	.xword	0x7f734bc8f0abe6de
	.xword	0xb80642b3b63f1577
	.xword	0x8c978b98e857d6f8
	.xword	0xf1cb810907a57a21
	.xword	0xf0aac32931ec906c
	.xword	0x1dd780065419fd70
	.xword	0x2593519962a51fa8
	.xword	0x6b8e0650e39df57d
	.xword	0x2a101bda61486127
	.xword	0x412985889fb56efd
	.xword	0x5126def471566b2b
	.xword	0x5cb486097df66f20
	.xword	0x64e8b9b666877ab9
	.xword	0xc3f99292039e763c
	.xword	0x02b043be2a357e55
	.xword	0x19de614c41c8341e
	.xword	0x8f0891a353843bae
	.xword	0xc91ca18b9e3ef2e9
	.xword	0xb448f61aba588adf
	.xword	0x844edadaf3e4339d
	.xword	0x1f53ca274f6a63ef
	.xword	0xc82be6ef062342c8
	.xword	0x4db064d16d9ffd83
	.xword	0x7bf39ce1fd93295e
	.xword	0x67d0fcd294b749fb
	.xword	0xaec49edbc245eceb
	.xword	0xe81bde624a5a2068
	.xword	0xa4307495e72d2bfa
	.xword	0xedcbff581f94f53a
	.xword	0xa20f898b861f079d
	.xword	0xf9fccfe4d8c09521
	.xword	0xe413f890b40f2f76
	.xword	0x9df8af3cd0bbe919
	.xword	0xeac26e1b2ddd6563
	.xword	0xb28aaffcc4d95cc3
	.xword	0xeaa0829d578e96bf
	.xword	0xfb4e2742e1c004c0
	.xword	0x9574a1df673501de
	.xword	0xb519d11e4bf1f06b
	.xword	0x673716335242ac68
	.xword	0x43b5deeacadbeb42
	.xword	0xb9978820e46f7d82
	.xword	0xb42f37a48bedda90
	.xword	0x3401423488181f74
	.xword	0xde47741be526c62b
	.xword	0x21a5ff1e6c6f1def
	.xword	0x3c699d4b61d2cf3e
	.xword	0x67b3bda022010ac0
	.xword	0x11008c95966a75d0
	.xword	0x6f796092254a3d04
	.xword	0xb67cee45fad29ce3
	.xword	0xcc4d8d8acb85cbcf



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
	.xword	0x16b301d818c53b00
	.xword	0xc47559211de52e6f
	.xword	0xe75551fa4f5f9bac
	.xword	0xe1bb45350cdf758b
	.xword	0xd34104529b7f71e5
	.xword	0x65310dc785378be4
	.xword	0xca69ac950c901e79
	.xword	0x89936b34b79bc427
	.xword	0xe959608d4cb94bc9
	.xword	0x737e0d42ae067d04
	.xword	0xf3fdefd452429e83
	.xword	0x802ca4e43fc30a0e
	.xword	0xd70c234cc8dee8d7
	.xword	0x0f09e451f5819afc
	.xword	0x7cd163340d8df85c
	.xword	0x1071f480573e00f9
	.xword	0xd0c15f5b58616c32
	.xword	0x2767986f1117997c
	.xword	0xdcae765d80f9a598
	.xword	0x1d451244c2b0e0f4
	.xword	0x3e10db9ffd8c88f5
	.xword	0x823a5134c88dc3fe
	.xword	0x25e89ab4eeacf5a1
	.xword	0xf3db126d7de92628
	.xword	0x54f3d1e21a6e10bc
	.xword	0x372cd2b9ccc9baf5
	.xword	0xe135fa2ddc90a4c0
	.xword	0xc4fe3e85eacc5879
	.xword	0xaa28d7f28f78cfba
	.xword	0xf492ccca1a291200
	.xword	0x3f751127fd8fdfea
	.xword	0x95507d69054140db
	.xword	0x1e289367a0d98062
	.xword	0xe19a776c09bca55d
	.xword	0x7439a3f990f46aa3
	.xword	0x33b112a720911bc1
	.xword	0xfd4b6952951e8001
	.xword	0xfbe444a9d1ad059b
	.xword	0x510b39959d110128
	.xword	0x3e108f2a44591717
	.xword	0x83144852b32b4c44
	.xword	0x4ce95fdee1675cc9
	.xword	0x126552e3961ba7d1
	.xword	0x6bea8678e46a503d
	.xword	0xb906a7c343c1196b
	.xword	0x624d352c261b8c8d
	.xword	0x9067760294f1878b
	.xword	0xa8972f6476967a8f
	.xword	0xb8c6b75e6115ae39
	.xword	0xde76c883c519e0f9
	.xword	0x4a90e1b7268fbd20
	.xword	0x23640e387bbcad1e
	.xword	0xc151e004faa05a4c
	.xword	0x5fcbedbd3d5fca94
	.xword	0x8ac20be39725f3d8
	.xword	0xc69d82e08df0e51f
	.xword	0xbcd1cf7090009ad4
	.xword	0x4316511907b86776
	.xword	0x22c12582983824c5
	.xword	0x98e99224f601203d
	.xword	0x525448faf723f47d
	.xword	0xa9ce292b4704d256
	.xword	0xb4db76d252239815
	.xword	0xf4cbaba750f5094c
	.xword	0x88dfc444eb0b09e0
	.xword	0x426095138e29a4a0
	.xword	0xdd0506de3a21f000
	.xword	0x4f6b33d818f34995
	.xword	0x0b40cb878891d4f3
	.xword	0xa5c5581730eddae5
	.xword	0x1e2fceaf2be9eaae
	.xword	0x8a0f1e17bcc4e9b1
	.xword	0xdab50a4d3aa47661
	.xword	0xc1acdefe5e4c207b
	.xword	0x58c1e1733cfdf5d9
	.xword	0xbd166b8c9d89b024
	.xword	0xf270f6ad35230201
	.xword	0x76d96faf6ea739dd
	.xword	0x12427ecaea52ee62
	.xword	0x3dc12f2d8364ec4b
	.xword	0xdf034874a472df7b
	.xword	0xf65f6223aee40ec0
	.xword	0x39ef8a0f9a9ee07a
	.xword	0xf006584880d122b5
	.xword	0x4343ff651effb943
	.xword	0xb0c7e2e4e1e838b0
	.xword	0x70b5ae0147b1040e
	.xword	0xeffca4787bdb9a76
	.xword	0x4c22e053fa0da0f7
	.xword	0x76648142a80d901c
	.xword	0xe4a63db9b095b670
	.xword	0x2d5fec92f15fad0b
	.xword	0x0c001892b1d0d033
	.xword	0x7e7d10b20069074b
	.xword	0x6bc5ded455ad9f27
	.xword	0x7a91d144b2a22bee
	.xword	0x449519d86141844b
	.xword	0xa5a4b26b666098e5
	.xword	0x2fd8e04977ca79f0
	.xword	0xeb12f59b124f49a1
	.xword	0xc11f60cbd1ea7038
	.xword	0xd66ef4fd047ca56d
	.xword	0xc38c9fbc34ff9926
	.xword	0x80f8ed4bc2322b95
	.xword	0x02ead2db1d69802e
	.xword	0xa3299ac4f3c1e500
	.xword	0xa97d2a6e8e732cc9
	.xword	0x057cf163293bd09d
	.xword	0xd21db7b7c01c09f4
	.xword	0xf86f4504920ba0c9
	.xword	0xb8879627f4b3deea
	.xword	0x45daf518fb9cafe7
	.xword	0x1b851ee68efd0a0e
	.xword	0x3eb5b678f45bd1f2
	.xword	0x992186d5cf9114c4
	.xword	0x0b353aab69c8e6a0
	.xword	0xd62e36779145bbc7
	.xword	0x0b29a5930e9ffa15
	.xword	0xb514879c0763d332
	.xword	0x4981fc63678261e3
	.xword	0xbcb87e08cc7ba8c3
	.xword	0x3d1796c4bd521a21
	.xword	0x08e0658842fe6ec0
	.xword	0xf128b2f6f08df335
	.xword	0x23d2dc61050bb04f
	.xword	0xc84facb530b895c6
	.xword	0x0370842729a7bb9a
	.xword	0x26f844be7c6569d6
	.xword	0xb859186c727a0eb4
	.xword	0xcc13e7f968ec4e1e
	.xword	0x05494b8d736a98b3
	.xword	0x581e082f8e34d574
	.xword	0x85aab6c1e5ba2669
	.xword	0x0193422f0664ff57
	.xword	0x03ee34f3795718ae
	.xword	0x300240f58ad2f4e5
	.xword	0xe0aee8f20c010309
	.xword	0x142427119732a2a3
	.xword	0xf2924fa024282123
	.xword	0x737e2eaa63e3549c
	.xword	0xaba20ad7f0de718b
	.xword	0x0b22385f684a57dd
	.xword	0x009e46bf17d87933
	.xword	0xec361cbf48de3ee8
	.xword	0x4211913e6cbd7836
	.xword	0x07d116008409076e
	.xword	0xbe0994106755045f
	.xword	0xfaf199cdffe30011
	.xword	0xc56e231e096ed92a
	.xword	0xe23578eb4c85d15e
	.xword	0x21044e59ad1cb453
	.xword	0x46042fb55a34c487
	.xword	0xae411c7caaffa46a
	.xword	0x09e028a322615902
	.xword	0x6ec0566539ee526d
	.xword	0x4751b3b1855f4dce
	.xword	0x9548e45a79485137
	.xword	0xaf293842daf230f9
	.xword	0xcb041c93c78108e6
	.xword	0xa3387d75cc5968f9
	.xword	0x88153b286279f2e3
	.xword	0x93a46cb9f99f239a
	.xword	0x4a599aba7fdc6d8e
	.xword	0x61b8de2de24939cc
	.xword	0xbbc649adfa13ef6d
	.xword	0x90b355f056805f7b
	.xword	0x29cfe3577a2b307d
	.xword	0x6642ab37168c4f0d
	.xword	0xdd43b4492d6f4fdb
	.xword	0x999923575967fa6b
	.xword	0xa91959af32bacfa0
	.xword	0x835adde9fae752d3
	.xword	0x725d08926e53c4ca
	.xword	0x5fb6e6dad9f24961
	.xword	0x3eb6be9510ca1e3a
	.xword	0x92be989a01576f9d
	.xword	0x292d1e77319b5c5d
	.xword	0x1be27ef47bd8306e
	.xword	0xff47113e1639dc9b
	.xword	0xb099b366a4329912
	.xword	0x6008691466fc1ac8
	.xword	0x15fb61fa4e66a16b
	.xword	0x8417f45990e51758
	.xword	0x736cdc28b43b1d80
	.xword	0x15aa95afbe0f9811
	.xword	0x93dd7c9f6f27ef55
	.xword	0x7fd57c940884965f
	.xword	0x81a418b0604f972a
	.xword	0x58a68c876ce870b4
	.xword	0xc24e6f8dc961dd52
	.xword	0xa651775df00f541b
	.xword	0xc1776a18d316fe44
	.xword	0x3ff7f27b6a777991
	.xword	0x944d57266d396ccf
	.xword	0x90dc5722182be64e
	.xword	0xb5558281759d910f
	.xword	0x691b29b6796fd0d4
	.xword	0xbb79e701c1342ebd
	.xword	0x999a1ab6e3132e50
	.xword	0x8566264454fd2316
	.xword	0x0b726d11a2e90b25
	.xword	0xbc932f28303930ce
	.xword	0xc96926ddd69ac62a
	.xword	0x6ae8f82da1f17b32
	.xword	0xa3bd39c2367ebd67
	.xword	0xe6438580efff4369
	.xword	0x78eb0a4b4b353eeb
	.xword	0x89b0e9375474781a
	.xword	0x6220103c649fac14
	.xword	0x274b895263a00b53
	.xword	0x74510479de0b297e
	.xword	0x950d22624db7b594
	.xword	0xa5f0c19fe1761dc9
	.xword	0x398d0bfd1f6c10be
	.xword	0x9f83381a5802ea9d
	.xword	0xb24432feffa8bf4f
	.xword	0xc5ca43995d221b87
	.xword	0x2270b9f602602ab3
	.xword	0xaa240724ab21c857
	.xword	0x4cb2c197f6ab2af6
	.xword	0x956d7a32be93b6a3
	.xword	0xf6ccdfb61693edd2
	.xword	0xc39bd40fd860558c
	.xword	0xc3885819413ffd34
	.xword	0x4aeebd16734b7766
	.xword	0xe45a395cc3a0ba2c
	.xword	0x080a36992e88c2e1
	.xword	0x376387e4109565c0
	.xword	0x2c7b8b2afde41508
	.xword	0x5817e01f4d726c71
	.xword	0xb2a758ef384db9fb
	.xword	0x29334ec5b49906a0
	.xword	0x02691f5bd7dd71d5
	.xword	0xa709af1510cff767
	.xword	0x7b3e02770562be9a
	.xword	0x6f9c5ad63c04d8d7
	.xword	0xf9bbb09cec060289
	.xword	0x6ed5452f31c65940
	.xword	0x8aa35dce3c343f06
	.xword	0xfb31089bdc3bfa24
	.xword	0xa75e83b1201645ca
	.xword	0x59dc785cdd7fb88a
	.xword	0x7e48a1cffebd91e7
	.xword	0x2d434905544563bb
	.xword	0xcb828c823adf7ce9
	.xword	0x19d5517ed19304e6
	.xword	0x72d64d11e70e012b
	.xword	0xc4f8885e7631c814
	.xword	0x375ddaac91d658a4
	.xword	0xf7ff87c672e97399
	.xword	0x090212bb3de246f6
	.xword	0xfb6c10f4150ec081
	.xword	0x222cbb5f82c44c71
	.xword	0x1e739b81f979aaf6
	.xword	0x5b153d27b4f12b6a
	.xword	0x305ca2c734942f2b



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
	.xword	0x1fe6ca4a22970c9e
	.xword	0x972fa21518ded8f8
	.xword	0xef5b29af3bce5617
	.xword	0x816db974ece5bf17
	.xword	0x9e96adca7269f4d6
	.xword	0x298687ca099472da
	.xword	0xd1001bfc4b7510d0
	.xword	0x5513a996b28dc590
	.xword	0xb31b63e10b8b1a84
	.xword	0x59e32e0163c29276
	.xword	0x3525319d91062a23
	.xword	0xcb3ab085d4f528c7
	.xword	0x671d5d3d845c6b2d
	.xword	0xbb2fe58b6359d261
	.xword	0xecf2b0d91cfc3771
	.xword	0x89c03b3e7c29d8f0
	.xword	0xb91c964588a670c7
	.xword	0x286a16bf1dfe74e9
	.xword	0xa365a0392a1acd7c
	.xword	0x1a34bacfea3be321
	.xword	0xfb47334418503d53
	.xword	0x3051be7aaf7e1557
	.xword	0xbf7848fea7935808
	.xword	0xa81e4fd92bcee05c
	.xword	0x29c7f6c3ef160ca3
	.xword	0x683b6c90ee34a33f
	.xword	0x274b405603fb9503
	.xword	0xd7f31effd0aed684
	.xword	0xb3feb424c1c69135
	.xword	0xa090025b41127ae3
	.xword	0x682741182a21ebe6
	.xword	0xe29d7a3fdc80a171
	.xword	0x922aa2af09990af9
	.xword	0xc95e21bc75381477
	.xword	0x04c797ae10bb0dae
	.xword	0x6ebcbffc0a14c0a1
	.xword	0x82626759baf810b1
	.xword	0x3f3d55a82f4aa654
	.xword	0x1cebf8eda5eae5ba
	.xword	0x284f679d6545d5c2
	.xword	0xe251be131fbb725a
	.xword	0xf6c2174220bcb79a
	.xword	0x8bf19a160492894d
	.xword	0x33f124e798d621a2
	.xword	0x99b6a23a5738ea95
	.xword	0x306169663d81e9f6
	.xword	0x56fce00499370662
	.xword	0x923187f3340f1b55
	.xword	0x1c34cf5a68b38f20
	.xword	0x004d7b493dade1be
	.xword	0x9f714d4e3b59bf04
	.xword	0x1620a434afffe2b7
	.xword	0x475617167b152c1a
	.xword	0xaa7d19f77e6b7d0f
	.xword	0x9d93aa8070ac0d8b
	.xword	0x5c02470e1a08dfc0
	.xword	0x4c1fb160eb96ea42
	.xword	0x7df7809d53c39d18
	.xword	0xe5a1fa907f71ac3d
	.xword	0xeaa0d327bc2f05ff
	.xword	0xfe19d87d01054936
	.xword	0x48ed6cd5ca9a2de9
	.xword	0x180b1f038e369374
	.xword	0x4a01622180442385
	.xword	0xf456cf30075ecccc
	.xword	0x4430d63b33a3bcfe
	.xword	0x62ac2c07a5d8a115
	.xword	0xbeab2344383e3b28
	.xword	0x6c61e14922581e26
	.xword	0xea721d6faf69ea5b
	.xword	0x0aacbd71896bedc9
	.xword	0x20121ec91f2f6494
	.xword	0x223282f706c00d06
	.xword	0xd55cc44fca15abe6
	.xword	0x370cafc391c501b4
	.xword	0xbbb755c9cb5a14fc
	.xword	0x08e27c16daf48d3c
	.xword	0x2b1b4b3626236ca8
	.xword	0xa4905a8a1eddd502
	.xword	0xdc03c18d5818d532
	.xword	0x9cbd2d4b46d2d708
	.xword	0xc28973c8e3aaf3d8
	.xword	0xff787becd3c60cc6
	.xword	0x4d8269e503d020ac
	.xword	0xf9c4c6cafb872c70
	.xword	0xc795459a38309afc
	.xword	0xbc410c86bf174cfe
	.xword	0xa8ef8469a1c19481
	.xword	0x5c0c34115166f53d
	.xword	0x6556a44a1322d3b0
	.xword	0x34f3b5cbd5bfca4d
	.xword	0x8ed045e2d058dc4f
	.xword	0x208288dcdf1f9fae
	.xword	0x7735b9df3b9f6a98
	.xword	0xbf8a37042508f961
	.xword	0x3dd6000d5c11a428
	.xword	0xcde499d54c915c64
	.xword	0xe3283e6cdd065e0b
	.xword	0xb21f82043e3810de
	.xword	0x9e23a69c26171707
	.xword	0x2d9b29fcea00cd59
	.xword	0x1346a6070eb255f9
	.xword	0xefae78eea8690fa8
	.xword	0xa92a5c8ea3f4865d
	.xword	0xf4b34cb1bba50400
	.xword	0xb965a41b9cf663dd
	.xword	0x70951f3dd90c2533
	.xword	0x174bf341a027eff3
	.xword	0xf9bed75c8c9340a9
	.xword	0xd5ce9a3e4e9bb2f8
	.xword	0x4c54df0ed189eeb9
	.xword	0xdb75b9118071fbd8
	.xword	0xcd3e2c4a2335bdb3
	.xword	0xa39d7c9911bbf07f
	.xword	0x33abe4b4d2414cd3
	.xword	0xae2467176ee02294
	.xword	0x01530bad6d7a5166
	.xword	0x985c70848b6285d3
	.xword	0x934f855ad311926f
	.xword	0x04c959c29f561228
	.xword	0x4f27e3ebf3cb75c9
	.xword	0x9e962175d9addce0
	.xword	0x577e0c7794ee796d
	.xword	0xfd25a53d0df1dd07
	.xword	0x248001d12660fd83
	.xword	0xd382b6322a284783
	.xword	0x9aad19bf61383728
	.xword	0x5f145822bfbce33a
	.xword	0xd4201b750a3d5519
	.xword	0x22c49ac8f6fd9617
	.xword	0xd7d06c4243f3d7ec
	.xword	0x625663242d7bb0b0
	.xword	0x764d4634a6942e87
	.xword	0x17839774a06a8af9
	.xword	0xd1950735a92d94a2
	.xword	0x2230a409590466d0
	.xword	0x4c8b1e11a78f62c8
	.xword	0x5c9274e1b64be811
	.xword	0x10ab81729055c1f0
	.xword	0xde5c9b9062947247
	.xword	0x08bbc34aca498a8f
	.xword	0xef8ef40fec1b3a58
	.xword	0x8587c2928b28cd35
	.xword	0x0e7c0af9f9b2f468
	.xword	0x03d42b02e404a0ef
	.xword	0x5372793b92c8e0ed
	.xword	0xe7ce959c18096e30
	.xword	0x24392be119f27687
	.xword	0x38933fe2e1c40652
	.xword	0x50e1831bacd925e5
	.xword	0x67b4540426e22246
	.xword	0x2b419b37085b1b65
	.xword	0x6d1f7b62b9ae2643
	.xword	0xa727f4a4e91767d5
	.xword	0xd447ad0a391374b6
	.xword	0x24ff1d87250d57e7
	.xword	0xf90a899bef94bb75
	.xword	0xe9f960c356802629
	.xword	0x98a83dfe14530c9d
	.xword	0x63e4a7e06cae6be3
	.xword	0x425bc41f173b5fde
	.xword	0xdd47a3e732720716
	.xword	0xdff6035b92bc1295
	.xword	0xda5d662fd3bca53d
	.xword	0x1e9e1116438a2780
	.xword	0xccdfb441730c9d72
	.xword	0xf2466226141b1033
	.xword	0x703c7e0ab6b02f93
	.xword	0x7767b7a664aee9f4
	.xword	0x65ae02fdddb0a9ea
	.xword	0xb401f73293632e1b
	.xword	0x270f2642d3de886f
	.xword	0x03f61cfebf3c592e
	.xword	0xebc23d06379198d2
	.xword	0xb20a2321ecc252b4
	.xword	0x54a0977e062fb6c1
	.xword	0xe2026463e10fdde4
	.xword	0x8f97dd439bcd3eb2
	.xword	0x787dec32b6202dc0
	.xword	0x96ba63152a9d6598
	.xword	0xef26d4fbe1592639
	.xword	0xd1aa9f9b836b8439
	.xword	0x92f2f346e10896f4
	.xword	0x136fdf1741c2ad87
	.xword	0x968a637c58a91ca8
	.xword	0x0917c8dc33fec77f
	.xword	0x982e326623ffe9db
	.xword	0xb854fc6752df2af1
	.xword	0x1e4304cd0b74ce00
	.xword	0x835ca0ace8bcf2f0
	.xword	0x7a2cbb98acfc3ba2
	.xword	0x678e9aece925fe92
	.xword	0xa25508cc083d64d5
	.xword	0x624b052ddff175e7
	.xword	0xe96b6c23d88bc34a
	.xword	0x6d2c7306d56bde0f
	.xword	0x89a74a95a916a861
	.xword	0x76a1a47046d1aeef
	.xword	0xa777754f1d4dc048
	.xword	0x833dc9e17be3d224
	.xword	0xb011f46a2ab7688c
	.xword	0xb7abaa6fc70cc069
	.xword	0xe077fcdeb6d64dbe
	.xword	0x235f205ab4190c68
	.xword	0x1bd8d87a5bb98fbe
	.xword	0xa1c922324f94deb4
	.xword	0xf9bb6c6c1d53fc86
	.xword	0x67aeb9a37984bdac
	.xword	0x216e198dbd3271ab
	.xword	0xb749e9c8c70ad048
	.xword	0xb332b77497d77808
	.xword	0x2fc5299b896a2385
	.xword	0x5b5af82265890c52
	.xword	0x9f925e8a6d4c9ad3
	.xword	0xa2a42967a773522d
	.xword	0x8f73ed9aaf63e582
	.xword	0xc27f6ce18918d863
	.xword	0xd9f1ce3421ad2f3e
	.xword	0xd88ab20c00773ccb
	.xword	0x1ef33b6281e8be2a
	.xword	0x561cacc6c91a2573
	.xword	0x2448dfb43c43d93c
	.xword	0x4ce427a633643374
	.xword	0x9ac43b12392bd254
	.xword	0xb977c09d6ae3f5f0
	.xword	0x1a54d4c46352d25c
	.xword	0x4046cc890ab3184a
	.xword	0x9b7e6d4ca076dafb
	.xword	0xd4a7b29f25e5f139
	.xword	0xe53ed7517038f613
	.xword	0xcea95f52d2361804
	.xword	0x4a91e2f9df95d80f
	.xword	0x012467d456dce225
	.xword	0xa7ff7f7b695ef4fc
	.xword	0xea7d77195b4b500f
	.xword	0x3e0d4cac9f2864d2
	.xword	0xb11d9e501c4f0380
	.xword	0x909e3e364896b80d
	.xword	0x641779939169caa5
	.xword	0x7e67342f9ec19cd4
	.xword	0x71bc8c3550dfd5c9
	.xword	0x6321070da359c729
	.xword	0x25ce883e3914d28d
	.xword	0x4c6e6216f5ff8f9e
	.xword	0xb47d95afa43d4c9b
	.xword	0xc8ad09b96b4410c5
	.xword	0x7275182f86b74dfd
	.xword	0x8db9b0316c30d8eb
	.xword	0x0b50906eede96229
	.xword	0xe238470ce89a2c98
	.xword	0x45e4069946652648
	.xword	0xaa6ac148ad98783b
	.xword	0x4c91bfe61eb00415
	.xword	0xbfa61652121e295b
	.xword	0x0a5ab43ce82262dd
	.xword	0x798b1641e8e00a4f



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
	.xword	0x526949b555f52d5e
	.xword	0x829fcd3a8b62687d
	.xword	0x0a146efcd800eec7
	.xword	0x2ad8d0db52ab9743
	.xword	0x529b4d33f75d62d2
	.xword	0x555e14dab79d72af
	.xword	0xd75cf5f693894756
	.xword	0x81d151cf28c63f38
	.xword	0xec5890363b5763de
	.xword	0x758427a8a4c5c549
	.xword	0x385c50aff003e240
	.xword	0xbfb064de90aa2118
	.xword	0x55d52cd2ab60a714
	.xword	0x8f08095783048d65
	.xword	0x1f25f458b54f2027
	.xword	0xc815eb5c4e3e8d8b
	.xword	0x39056ea38d592da0
	.xword	0x99ad39b34096a391
	.xword	0x5c8d27fe6753bd14
	.xword	0x32aa89d0f00fad48
	.xword	0x773a1f4c164c6cf9
	.xword	0x7fa23ce3bfa73c35
	.xword	0xd3c242ad31f123ac
	.xword	0x2c553d6e33defbe1
	.xword	0x9229659569bec5e2
	.xword	0x311874379ad2c77b
	.xword	0x8c176b2846343c3b
	.xword	0xbd6560856fd2e837
	.xword	0xb163daec44271212
	.xword	0x70b0b23b0b66ece2
	.xword	0x2cac3845e6fe0530
	.xword	0x9426d61a8bf4b8bd
	.xword	0x8fc4982cf03638d1
	.xword	0x8b9c6a61ca825dad
	.xword	0xae81c32db40dcbd4
	.xword	0x5292816289afa203
	.xword	0x59f7c5d706a01d51
	.xword	0xa99889cdb4a02ea7
	.xword	0x48bf42262d89ed90
	.xword	0x17f24f5940f7e7db
	.xword	0x0d7319cd156f9d10
	.xword	0x605dc82699bcf546
	.xword	0x51c43411ee1a280d
	.xword	0xdf8b462d63f1ca18
	.xword	0x9481ec15fcba3047
	.xword	0xb83f35eba44dac04
	.xword	0xdf9a00626794e5a1
	.xword	0xbc5abb84d174e3db
	.xword	0x2bfa0ad392dc8a64
	.xword	0xa7a5967ce04c3203
	.xword	0x7ca7aeb0d37874a5
	.xword	0x275bd3832edf8d3b
	.xword	0xaf0ac74cf12d0848
	.xword	0xe0a3ec8320b4dbf4
	.xword	0xccaaed968bef587d
	.xword	0x5ec540ff938e4379
	.xword	0x6d5e6979332fe2ea
	.xword	0x4f1b437e676a3b55
	.xword	0x106958f67ed4cc9a
	.xword	0xd0db21a0273ae907
	.xword	0xbcad9f3325fa01b7
	.xword	0x7423b855e6580ff3
	.xword	0x79ca9ef56cda9268
	.xword	0x43c39080209f45ab
	.xword	0x2a9df9155c978326
	.xword	0xf99b02934f55d36c
	.xword	0x2d49f6c5bc6ea193
	.xword	0x69fd1e992cf6b8cd
	.xword	0xd2538fe9f43d17a9
	.xword	0xd55614aa603023e2
	.xword	0x0a8c9d8272204b1a
	.xword	0xf6ac8499b796fce4
	.xword	0x8e36df3d805ed507
	.xword	0xe887f0eab54400a3
	.xword	0xee282e012a0c1569
	.xword	0xc8f9bd688ed9abdf
	.xword	0xe68c775f99ddbd02
	.xword	0x7835fe9f37c445c5
	.xword	0x1700cda448a33aad
	.xword	0x485596acbfd809c2
	.xword	0xa616db6098655164
	.xword	0x4653bd8e294b26cd
	.xword	0x292dfcef8d0a2bd6
	.xword	0xc244ce40cc62954b
	.xword	0x92ee1cf18a2874c5
	.xword	0xb34bf5d607dd9d1f
	.xword	0xbf8bf39f530f8bb5
	.xword	0xb8da130fb1e4dad3
	.xword	0x590e437943438722
	.xword	0x8c569a0c07adc312
	.xword	0x98a7d627fb2b439a
	.xword	0xd10a61202898c540
	.xword	0x97f3e6eacd88a063
	.xword	0x7f0489f69872114d
	.xword	0x818e13edab09e895
	.xword	0x2ea045c54eb194fb
	.xword	0x46f323bda25e9c5b
	.xword	0xdbe36c8f071f3953
	.xword	0xdffbbf3a628cd7de
	.xword	0x40c299f9a6ceea47
	.xword	0x56ce19bc28f5ea45
	.xword	0xde94887b46197216
	.xword	0x6095a4c623c99dbf
	.xword	0x9f262925c1256183
	.xword	0xd692a2e84930f3ab
	.xword	0x69dc0229bd2aefa4
	.xword	0x74e455a410f09130
	.xword	0xe38d41a803724b33
	.xword	0xfa857d75f38cd4f6
	.xword	0x02996b88270d25ec
	.xword	0xbd73b16885d92814
	.xword	0xac5c5c108508fa02
	.xword	0x6b12fffa92f83951
	.xword	0xd2caf0fd00bc3b8e
	.xword	0x74c2c078dc971030
	.xword	0x9bf594f605cc53a2
	.xword	0x714c3aa7af00e44e
	.xword	0x6ea3a978ee16d8cb
	.xword	0x8f4855b6ecab8ed3
	.xword	0x873d9798134fccc8
	.xword	0x23ad7ac574f9f646
	.xword	0x81ac2bcd0bc4b726
	.xword	0x24e6f2ac5a7f2823
	.xword	0x1588a0639dbe4b23
	.xword	0x7f5b7d48ee866e20
	.xword	0x79c29bd377e3a523
	.xword	0x2eab1b4fa3328ce8
	.xword	0x06d86e9d4bef7770
	.xword	0x3eaf9ced1019c1bb
	.xword	0xc7e89a3ee62cf9de
	.xword	0xbce6ad66853e97e2
	.xword	0x1679114343660b47
	.xword	0x346e070b45e1794d
	.xword	0x175c85f62b497c51
	.xword	0xcb5aa782443283fd
	.xword	0x575b79863f6b9575
	.xword	0x8ccd866e0fdc9654
	.xword	0x6149ce8a9c42decb
	.xword	0x0c80e17520e3271e
	.xword	0xc6e3f431e914887e
	.xword	0x7666875db7357db0
	.xword	0x25defc48e2bc676e
	.xword	0xdc64c9e5d21b2cf3
	.xword	0x86b80e0fd742bec1
	.xword	0x6910cb9c6718ed7b
	.xword	0x8cd649b6b147932e
	.xword	0x298755645e012735
	.xword	0x0c9e45dd8696863f
	.xword	0x3af519d71aedd567
	.xword	0x5b518336f6570fe1
	.xword	0x9e0e594c00bd4826
	.xword	0x1010c5755112de26
	.xword	0x2287f0d0d553647b
	.xword	0x6dacfda100dac665
	.xword	0xe6efce0c8834c2e5
	.xword	0x63354f7bea14792e
	.xword	0x3a6de9934da7e74e
	.xword	0x3ce7187f8cd7b6f4
	.xword	0xde137b7aaeb0b521
	.xword	0x18454a064ddb5b9d
	.xword	0x8b55638a60146c30
	.xword	0x8c2880fc3f653bda
	.xword	0x880c0b15f83b251f
	.xword	0x0cc34e68659091f6
	.xword	0x033c021514c7b4dc
	.xword	0x9b557ec45b153e05
	.xword	0x2d36a53f8e9b699e
	.xword	0x255d8d2d3ce9381b
	.xword	0x6f4beaa793093105
	.xword	0xd19d473965091830
	.xword	0x3f42af40b718f6d3
	.xword	0xdf9e3445ff58b9cf
	.xword	0x3b8d3a3848f1e451
	.xword	0x9d1033ee34d050b3
	.xword	0x74219ec337aed0f7
	.xword	0xf14c038f996ad25a
	.xword	0x8530b2569dad5e49
	.xword	0x4b49b1bad270b2b6
	.xword	0x3df91b41e7d14993
	.xword	0x6dbaa93f9077f97c
	.xword	0xf4626dedfe3b88a8
	.xword	0x7833921982490293
	.xword	0xa53dad3bf60b75a1
	.xword	0x6932de724710ae2b
	.xword	0x7c860c68bd2851ad
	.xword	0x37b575aef809e007
	.xword	0x28c6eff1865ee9dd
	.xword	0x33dca5b27fd7c02e
	.xword	0xd4c7d3aa08e898a1
	.xword	0x7b8ad638780fdc60
	.xword	0xeba7b39f7e3ce7d8
	.xword	0xcc04eede42e16804
	.xword	0x24fb66a4c0724168
	.xword	0x98b91e81f82d0e9c
	.xword	0x6e16ffcc78a51c47
	.xword	0x8104f7b97cf82eb1
	.xword	0xd2ecde1be4f7a079
	.xword	0x07ad381f5f380a7d
	.xword	0x46a7f148c76bba16
	.xword	0xfc11c142926b9aac
	.xword	0xdeee2fde327b7733
	.xword	0xaf9834b4545076a7
	.xword	0xeba60d4f5652bfd5
	.xword	0x8729a8395e4e462f
	.xword	0xc8766bc497d4c6ac
	.xword	0x33b514f8cbecb436
	.xword	0x1e3d1372fb625e58
	.xword	0xeb7bc20d27885a93
	.xword	0xc9108e5c5331a7d4
	.xword	0xe32f747268f90dfb
	.xword	0xb76ad16b58dc4075
	.xword	0x0b1e3ec39c08b6b3
	.xword	0xaa73d27acdac6d2f
	.xword	0x4bdc673c7bc09d2f
	.xword	0x2552d61f0b23898b
	.xword	0xf7174eab57cc0a46
	.xword	0xf58d050b792b2f73
	.xword	0x37af63e79cd4e701
	.xword	0x5fec9fe9c367933d
	.xword	0xb66d0cd360de40cd
	.xword	0x4458d08b5d4d9bb8
	.xword	0x2893580d32a7c085
	.xword	0xda94b3d302f3a567
	.xword	0x7beb05c5986324c9
	.xword	0x75d64a169ec22fea
	.xword	0x2a860ad9d26f199a
	.xword	0x50d91def65138bc3
	.xword	0x8a5abfbdfe49e03b
	.xword	0x75dc7f56ad195041
	.xword	0x9cc1bd9178839fd6
	.xword	0x8e428f28b2be54a7
	.xword	0x9d70d26c563b99c4
	.xword	0xa62b9cfb4ac374e2
	.xword	0x1d48b1c7026948e1
	.xword	0x759c72533b6646f2
	.xword	0xd4aa516a151b175a
	.xword	0xcfa78ac117b01eff
	.xword	0xa16e417ff8b4d528
	.xword	0x49822e606d04552c
	.xword	0xedc53858695e3927
	.xword	0x1ea6127baf47c732
	.xword	0x0f25164b57da68c6
	.xword	0xbe8c3438c7b4c630
	.xword	0x690e1f68d21abbc8
	.xword	0x444c3696aaa53dbd
	.xword	0x32ac1b0585ccd4c1
	.xword	0x14af2cc5c9ab3283
	.xword	0x0e8a413959db18c0
	.xword	0x4117a3a18e9c1aee
	.xword	0xb9b1dddbc972fd37
	.xword	0x59dec67b8404aaf8
	.xword	0xe7dfa8bf921a99eb
	.xword	0x88d9dd2d2ef79979
	.xword	0xb483a915060afac9
	.xword	0xf028003a226fca92
	.xword	0x6224abd4cca1ce21



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
	.xword	0x6d93cb801699c339
	.xword	0x81f2a9392e110777
	.xword	0xe50507479cbfb732
	.xword	0xb11ae5f40576faad
	.xword	0xa9213325faeae2c2
	.xword	0xb0dca1b148517f4b
	.xword	0xf75b625e45443e15
	.xword	0x04a8de9a0d5134fc
	.xword	0xff2c394672333249
	.xword	0xe52c178d3edf9999
	.xword	0x05fd58d6682b8e95
	.xword	0x74d890238ce270c2
	.xword	0xb1d9298e368f0664
	.xword	0xb76ce24fed7f4da4
	.xword	0x54cc3ae8322e249b
	.xword	0xb2a1b8b1cffdfb75
	.xword	0xd4ac5b6e2f6812c3
	.xword	0x437c7caf1fedc956
	.xword	0xd3f7920eaee8c921
	.xword	0x07a77ec80ad2f697
	.xword	0x4d7d220ac36d265f
	.xword	0x35054eec6f430ac4
	.xword	0xc7202eb0331191da
	.xword	0x7d86b17f57433832
	.xword	0xcb7a0e3ea4231373
	.xword	0x2e250d456a616143
	.xword	0x4e3a6bb52fa0ee00
	.xword	0xdf71b72a027c0eaa
	.xword	0x69d2e6431e87bbeb
	.xword	0x6d6d06f4e7129578
	.xword	0xd390c7b24903a4ad
	.xword	0x9a7be017aef3d7f9
	.xword	0x47c6801538562391
	.xword	0x2dd41c4b97efd215
	.xword	0x08c0c95390e68aba
	.xword	0xcb90eab157d448fd
	.xword	0x193895e354c4f886
	.xword	0x9d099c69d635fec2
	.xword	0x22232096e39b1e67
	.xword	0xe259efec5a932e0e
	.xword	0xa158daefdd6634ca
	.xword	0x2dd347a339d71799
	.xword	0xb635e878d836d544
	.xword	0x3924ed8651c2017e
	.xword	0x636abaf513065bf3
	.xword	0xfd664f4ee9e6fdb3
	.xword	0xb3cce476a2ac80f4
	.xword	0x290823dcc102d6bc
	.xword	0xe0db11fd716b7ca8
	.xword	0x67356702baa455bd
	.xword	0xcfb34a2058d965b9
	.xword	0xee77c9dd60c9ff80
	.xword	0x33d8218d521a5387
	.xword	0x5973ba20def31aa2
	.xword	0xaba00fccb5425322
	.xword	0xd64d0445b492a0be
	.xword	0x681f7d415e7273af
	.xword	0xc512be491a7eeee4
	.xword	0x7dbb3711ceb5f204
	.xword	0xc001cfb3b347f9ea
	.xword	0xbe4ebabec767a57e
	.xword	0x36d87e782d17e665
	.xword	0xc995af4b132d7899
	.xword	0xca847204d72288ac
	.xword	0x77bc3d960b361a3c
	.xword	0x7ac6c8ad55ae59a0
	.xword	0x30b1aa0fb92c4e06
	.xword	0xe08110ded9e8f089
	.xword	0x1162cd4ad9461446
	.xword	0x757809455413503f
	.xword	0xa2fa90c4b5d10775
	.xword	0x1e5bad5f6c184d4a
	.xword	0xd90c83d8f5a073b1
	.xword	0x2ca67ab05910b475
	.xword	0x1770f2289841dad6
	.xword	0x7454c4aa3158536c
	.xword	0xe42a8b93b2a4ef58
	.xword	0xc44cdda539a0448b
	.xword	0xd86529af04ac35b5
	.xword	0x33dac88f1ba0027d
	.xword	0x5ec792c7f811a621
	.xword	0x6dda0b063fb6ea11
	.xword	0xf637d5918e8514f2
	.xword	0xa6646677586fbe9d
	.xword	0x522fe3c3c604724d
	.xword	0xd58acd5680cf943e
	.xword	0x3a06d888deb4b2bc
	.xword	0xc0784bbfe39378ac
	.xword	0x4ac4cc102a8982ac
	.xword	0x6b87e4de28db0363
	.xword	0xc8cea90cd141b0eb
	.xword	0x5ce7d5c68b69dc78
	.xword	0x47ff0fbd9d89a6ba
	.xword	0x119932aefd83d5fc
	.xword	0x062ec673f5a6d812
	.xword	0x053eae4a41c38d23
	.xword	0xabe01f4c774a0680
	.xword	0xe7d8e7fdc4ba8708
	.xword	0xd82c6b407b994172
	.xword	0x73483e6a0c901825
	.xword	0x2e1757f377ca3a2a
	.xword	0x870a95fc343fae77
	.xword	0x0df8153194d321fd
	.xword	0xc1b6e9f7655d6491
	.xword	0xe620220df6c61bee
	.xword	0xa0fa5a7509e5b8d6
	.xword	0x04abcc9d0c7a1320
	.xword	0x055d4ef771ba1dbd
	.xword	0x37add524585d0d17
	.xword	0x15791a047d301ae4
	.xword	0xa8fdc01780fc4596
	.xword	0xcd55c92b5048b915
	.xword	0xedee6733dd01ef7b
	.xword	0x7eecc4fa4e475b9d
	.xword	0x4d004ab2392a7565
	.xword	0x2c9fb7c9868fda16
	.xword	0x9a7a32401c4e6588
	.xword	0xfa84ca4de7ccd497
	.xword	0xd44c32d04c96402a
	.xword	0x6a9e810899fa1bc2
	.xword	0x5ea79211c2985a99
	.xword	0x4eee68805487b8cd
	.xword	0x26c10d15777fd297
	.xword	0x55f6120293a8876f
	.xword	0xa40930a1b3e324d7
	.xword	0xd117df96745ab177
	.xword	0x5a58991e53044ba0
	.xword	0xdc61867450232431
	.xword	0x3d8aa5c1f691de9f
	.xword	0x70bd26ab9feefbd1
	.xword	0x154ca61de1b59447
	.xword	0x7796264703e3c24e
	.xword	0x5b4003a968f72e2c
	.xword	0x644ec9a254349049
	.xword	0xb02efef66b809bc5
	.xword	0xddae0e4474387290
	.xword	0xb180a1766ad4a270
	.xword	0x748d2fae5f6c35d9
	.xword	0xab076ea442aa626d
	.xword	0xee573c44ec3f015e
	.xword	0x5c8605f0fac1b45c
	.xword	0x3707fb5aee4779e7
	.xword	0x7bbfe36e40dadb91
	.xword	0x15474fa2cc1a63fd
	.xword	0x13e6f830a3e9a8b5
	.xword	0x9135530e51f3b358
	.xword	0xc6ca7b981265d43c
	.xword	0xa7f9c6372c6d5c2d
	.xword	0x4e222a9ee45ee075
	.xword	0x5ba0aa712a9504e0
	.xword	0x1dbbbf2410700981
	.xword	0x7d3f74ac450dcd00
	.xword	0xb0769df6cd44a5dd
	.xword	0xf157d55ae1837d59
	.xword	0x8252709f4c0cca89
	.xword	0xda581908d4b9c7a5
	.xword	0x887b7ee52d5e2f7c
	.xword	0x651b92b4d7a5d712
	.xword	0x896572e3e98664ff
	.xword	0x7b5b462eceb47702
	.xword	0x622797b761f8c8e9
	.xword	0xf52ab63033b1a0a9
	.xword	0x93ac4c617b2f78bc
	.xword	0x5490ee1d9c253015
	.xword	0x3974ad6c1dadf196
	.xword	0x9b78845a077dcd3d
	.xword	0x046cfba746a4c274
	.xword	0x23fdb36979d1a11e
	.xword	0xe8fbf909302b4db4
	.xword	0x1816d7350f9b9f65
	.xword	0x3348dbc0c9899079
	.xword	0xba46b54b0e1ee0ec
	.xword	0x9a7087ce0c9a085b
	.xword	0xddd12c3c3020f3df
	.xword	0x0b0b7bf6210ba9f4
	.xword	0xe6e301b6c892454d
	.xword	0x555043627b5f099f
	.xword	0x7f0535927f04b124
	.xword	0x066212240671dbc7
	.xword	0x3226e3388a4a3ba6
	.xword	0x78eb21b05f673270
	.xword	0x22721d7774a933a2
	.xword	0x77db20aceb38d3fc
	.xword	0x75cbcc3abcea980c
	.xword	0x86242df5c1e96bbf
	.xword	0x2087b79e13ca8ba4
	.xword	0xc581396ae1b8b321
	.xword	0x783a8034e63f8e3f
	.xword	0x092196feb5c85f6f
	.xword	0xa4175295e2f1dc43
	.xword	0xa0782442e8593678
	.xword	0x061fb751f3ed182e
	.xword	0x17153ccaf4308397
	.xword	0x924ca69e57b63e78
	.xword	0x26860bbad13719ea
	.xword	0x7610092392198d65
	.xword	0x03da4192572fe435
	.xword	0xf7f50bfd6acb134b
	.xword	0xc88e1df7fc2b06d4
	.xword	0xb0eb453d0a253086
	.xword	0x1e0ca7184e935948
	.xword	0xf4a76155b86a4fab
	.xword	0x44e6636878676d9e
	.xword	0x64aa03fbe23b146c
	.xword	0x1f2758bb614cd6cf
	.xword	0x5748ea175b27c12a
	.xword	0xb627c0a0a0734240
	.xword	0xda5451f354bb3329
	.xword	0xaeca7affb3909fbf
	.xword	0x34c1db24030902f7
	.xword	0xfe5e81f673686644
	.xword	0x3042679c9f46e978
	.xword	0x973c5c8218f7d37d
	.xword	0x9ab28c6c235cf89c
	.xword	0xd937d127b554f8b1
	.xword	0x612a52f987d57f3b
	.xword	0xcc1fc22997e3723d
	.xword	0x11108151e795e4f9
	.xword	0x463c3dadcee34589
	.xword	0xa06bf5a2c4f2c453
	.xword	0x2cad28de6d5cc68d
	.xword	0x31b9d3e5c9f7d669
	.xword	0x9e23f49cb1c60a0c
	.xword	0x48d2147e0a62aa65
	.xword	0x6523026b6a0e0268
	.xword	0x972606a35a5ce449
	.xword	0xedc25d654a73c567
	.xword	0x0f3385c8d149a7d4
	.xword	0xf31e918f16c7ef7d
	.xword	0xd6b3923086339258
	.xword	0xff71bbcc55f78a1b
	.xword	0xa4e66b90438e0375
	.xword	0x6f4766ad82dc8c25
	.xword	0xf78920c4b887a789
	.xword	0x1e7d9922723a90b7
	.xword	0xe83ee4bee0e8c770
	.xword	0x2543d9a7b46531f4
	.xword	0x16426b1bb1f4fbf2
	.xword	0xea7a133098c07840
	.xword	0x1c4791244cab4878
	.xword	0xa3cca79da5ad137c
	.xword	0x227d897db737b607
	.xword	0x7f153178a63c193f
	.xword	0xc8791dab3a21286d
	.xword	0xd1636500e847a194
	.xword	0x96a748adc404a021
	.xword	0x09304b73c9431126
	.xword	0x6c2d3957488f2ea5
	.xword	0x812ab39b5a6366af
	.xword	0xb13172e0b230a8b0
	.xword	0xd5949a7f258a3bd8
	.xword	0x404ce900c830a665
	.xword	0x7b800aae53462f09
	.xword	0xf3ef5255d530a854
	.xword	0xe7e50d9aec88bd34
	.xword	0x2ed76a9fe1d76e73



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
	.xword	0x8bdb643f33da49a8
	.xword	0xdbaeabe7a7eba91c
	.xword	0xc11783a912febf6f
	.xword	0x4219e6ead3cc3e6e
	.xword	0x494265d3c14da394
	.xword	0x64c23d628728a11c
	.xword	0xba751ff9a1417c3f
	.xword	0x6c631bf532f1e68e
	.xword	0x3f7d5dca78285505
	.xword	0x10fe89426a64fe29
	.xword	0x116a9576aa6507ac
	.xword	0xa6ce48917f61445e
	.xword	0xf60bc7c4018fec13
	.xword	0xd3db27cf3da2d947
	.xword	0xf00d522b617e28d4
	.xword	0xea015a68b5d84d23
	.xword	0x6ca6ec9d28b3fab3
	.xword	0x69903f90b0791dcb
	.xword	0x629d1553ff20222b
	.xword	0x3bab09c62b9f0448
	.xword	0x921d735c406b2a7a
	.xword	0x72a0a34fdb417b19
	.xword	0x90a8947f1145cccf
	.xword	0x0807b789de5634fd
	.xword	0x256047243ba317cd
	.xword	0x65baa01244071ecb
	.xword	0xed32cf0e59ffa587
	.xword	0x7dc5412a01729dd8
	.xword	0xc6aa42471445a0a2
	.xword	0xebf7cf64676b2179
	.xword	0x07a8e8a295580d96
	.xword	0x70d634786841da5f
	.xword	0x7ff97f4e9773228c
	.xword	0xa19c223a13e06ad7
	.xword	0x76ca3c6634a81bf7
	.xword	0xce010101c3100118
	.xword	0xfdcbdba3722e0443
	.xword	0x48c7eba8f1323077
	.xword	0xe1bae1b19969fa8f
	.xword	0x06f3d47d1c8c69db
	.xword	0x43ef3d0b73b23050
	.xword	0x32df2c0a132f44ea
	.xword	0x861b79d6c719c688
	.xword	0xc9b19a0de16e5d7c
	.xword	0x5621616fd3542c69
	.xword	0x7d87c80e2f8a92fc
	.xword	0xd4535cd7ce718e02
	.xword	0xcce03e3b9f6919a8
	.xword	0xd99225c135059162
	.xword	0x298c799599690f2b
	.xword	0x7dbb6f889c536c98
	.xword	0x3286e77afe1bd701
	.xword	0x6810070d31b09d05
	.xword	0xa9464e5a1b4f8917
	.xword	0x31c50004542a076d
	.xword	0xb5a99233825d0654
	.xword	0x4d3e96fb6433fa7f
	.xword	0xfe879cfc9d962c8f
	.xword	0x10132bf8d6e63aa5
	.xword	0x911cd8c29c214aad
	.xword	0x7ab8d46089d23141
	.xword	0x8d3b60cbcf351900
	.xword	0x0dc879732a4848ae
	.xword	0x1fe2b4ecc6a3d4fe
	.xword	0xccf36a107e124be4
	.xword	0xe3936458e5735280
	.xword	0x286e34e5b2800292
	.xword	0x3a69bb0589db9a33
	.xword	0x2f64db44a9aaa97b
	.xword	0x33094ef9d27f61fc
	.xword	0x4c99aebe926785bd
	.xword	0x0be83dfa62c37464
	.xword	0x5041623200dc285e
	.xword	0xb580af68c419260d
	.xword	0x5f8d8da6ee69d47c
	.xword	0xedd71c861b2afc5f
	.xword	0x15ea3aaf6de951a2
	.xword	0x5db31c9bf9b6e209
	.xword	0xfa25bd310da22152
	.xword	0xbf2f03139b5de43d
	.xword	0xe28c5931d7a92e5b
	.xword	0x7502ca569929057f
	.xword	0x08a57dab3e52ed59
	.xword	0xe53388c836364f18
	.xword	0xa546e82d14946aad
	.xword	0x1b69946073b38013
	.xword	0x689e560c066f13d6
	.xword	0xbd206a46dd92f64d
	.xword	0x01f1ef4b9b7865d3
	.xword	0x41c5272c0a686caa
	.xword	0xc4d8195e19e59a27
	.xword	0xebc5b046f1fa45fc
	.xword	0xbd7422e9f45eeb85
	.xword	0xf3f582cd9ac31e0b
	.xword	0xf41aa3cdc02bfc1d
	.xword	0x8852f3309b746f42
	.xword	0x6db2f84d580b1f4c
	.xword	0x194f9645853d91ee
	.xword	0xf9a932eee18f6190
	.xword	0x13cd0627e49aed11
	.xword	0xbd62636bc1706e7f
	.xword	0x2a514c27a19c5e76
	.xword	0xba57fdfe97dade56
	.xword	0xb02dc5de15dd1638
	.xword	0x3dc52ea10dedd4b7
	.xword	0x9742f2eb40c06343
	.xword	0x127dce42501542aa
	.xword	0xce5eba49d6cdebe8
	.xword	0x5000c770dffea11d
	.xword	0x3356a3a9d656dfba
	.xword	0x007ae515b486c2a2
	.xword	0xf263d6801950d418
	.xword	0x3532cd92a4185e7d
	.xword	0x5f41644ec88729d8
	.xword	0xd482be2ccf95bc20
	.xword	0x4ccba4cfef618698
	.xword	0x30fa0c5b19a694d2
	.xword	0xcbf33bdf25847138
	.xword	0xf88d9c27f2f88306
	.xword	0x86692f848dd36b8e
	.xword	0x95b86b33b3830567
	.xword	0x9c795bf834f9b566
	.xword	0x8e97fdbb795fd2fe
	.xword	0xdcfa48c2d591b92c
	.xword	0xc710467ef840354c
	.xword	0x7277883405896f27
	.xword	0x3111e0ca3c04136f
	.xword	0x4168ce5ae1f07988
	.xword	0xbb084c66cde4282f
	.xword	0x2fd266c8cf19fa92
	.xword	0x0c87f83fcdf8d0a6
	.xword	0xfa40823bbdf6cebd
	.xword	0x1ae661161bcfffcf
	.xword	0xa9ae256ec8855c55
	.xword	0x3aabea6d8005096d
	.xword	0x04b90d8a275421a1
	.xword	0x8cff0d3d840d5c0a
	.xword	0xa4693a73430b4808
	.xword	0x776420eb7b748717
	.xword	0xdd660a2b1075b22b
	.xword	0x72952c26cb380270
	.xword	0xdef464d741e71b1b
	.xword	0x0001351598b6025e
	.xword	0x71b52152f29e5362
	.xword	0x57d76506cefce32e
	.xword	0x94d00d1f4383b730
	.xword	0xf5474317b562dd8a
	.xword	0x7e1a252c46ed950a
	.xword	0x50abbc6b62c4606f
	.xword	0x297bc740a2f8c38c
	.xword	0xd16b6d19fc95026d
	.xword	0xe9308ff0fca48a9a
	.xword	0xca0c4af21c56db36
	.xword	0x33f6857cde230555
	.xword	0xffacd8ebed4b9370
	.xword	0xc9e56ae9daf5db83
	.xword	0x1843912791d7225d
	.xword	0x0f16caa648c89240
	.xword	0xe7062d42729cfe91
	.xword	0x7bf9a0970ea954e9
	.xword	0xbe8c58796f6bae67
	.xword	0x0f9d9fa1e6e8be51
	.xword	0xba940fc6847565e1
	.xword	0x47faae8aae2029aa
	.xword	0xf83280a84a0836c0
	.xword	0xa054b624fe2e032a
	.xword	0x7b52098ffab0c332
	.xword	0xca220438923e8129
	.xword	0x46e47412e9089ea3
	.xword	0x941e01b471c6bac5
	.xword	0x98f33fa5de9ed075
	.xword	0xe1b3d1ca8519cb18
	.xword	0xaa9f75567329b99f
	.xword	0xda7b8cb519e57f94
	.xword	0xfbb64fa2621da6e1
	.xword	0x802866b04f894c0c
	.xword	0x4eb44e0480192e43
	.xword	0x74e483ade5d49fa2
	.xword	0x786244e152a55110
	.xword	0x72961a73e16f3cae
	.xword	0xd6b516994071c13f
	.xword	0x8b29b4452dca764f
	.xword	0x6f793f1f30449cc8
	.xword	0x76dd51ea55a973ec
	.xword	0x3e382d9f76f9657a
	.xword	0x3f576c2998dcb2ca
	.xword	0x6e1fb5cb84d354ba
	.xword	0x3d768d73f5561747
	.xword	0xeb55dd23060b478b
	.xword	0x2bb77dbaea89584d
	.xword	0x6cd460269ef9ff25
	.xword	0x994fb718d864f287
	.xword	0x040d063d9662f58e
	.xword	0x4401a26454c405a1
	.xword	0x3f73df1a59363ae2
	.xword	0x1f1f6b2cd88cd6a8
	.xword	0x76d9ed9d9f4f7574
	.xword	0xaa0e67ffaae82b26
	.xword	0x0a8e0e20d53d74b5
	.xword	0xe00ec63b338a58e0
	.xword	0xa1a18c36c545f514
	.xword	0xabb903fe796d9429
	.xword	0xe172329656777d99
	.xword	0xb5a6e98017383df2
	.xword	0xaa5a212bf6f51099
	.xword	0x66227aea5eb1c2b6
	.xword	0x65d35a199615f780
	.xword	0x4768a3ac40cddac1
	.xword	0xfa0ccbf1a426b0fc
	.xword	0xd8e901cc14b7b6f4
	.xword	0xc7e66f678bad0728
	.xword	0x84f0a41aab7dd04c
	.xword	0x204e764346205d8c
	.xword	0xefb3663bd943f41b
	.xword	0xd0e3e2d92c087631
	.xword	0xacd35dc046e49e22
	.xword	0xeffefa83e8214d73
	.xword	0xd19ff57149837b9e
	.xword	0x7e66e4c01982ef51
	.xword	0x179dd65508596968
	.xword	0x3f628e3b59aed7a0
	.xword	0x8890e5dc3c245094
	.xword	0xeff59a0ad2106eaa
	.xword	0xe945458f74862d08
	.xword	0x6d078ecf1028f589
	.xword	0x595bccb0ca3c004e
	.xword	0xfbbb71151c3e0289
	.xword	0xd9b3497600973a08
	.xword	0x056b1b8df0a304c2
	.xword	0x3ef882717edbcdda
	.xword	0x248ffa5e9598da40
	.xword	0x90e9076e11e837c9
	.xword	0xa14ca9674522f0aa
	.xword	0x670ef1dcc2078ae5
	.xword	0x6c284e13e964fcf0
	.xword	0xd1e44685ed4212c9
	.xword	0xa92718db43b25507
	.xword	0xd7b588511ed2cc63
	.xword	0xfa8d44bb91d61204
	.xword	0xc45d5ccc8b9163fe
	.xword	0xb544338a5b5add1d
	.xword	0x89f2a869b59e4522
	.xword	0x05bc16b39ae25d1b
	.xword	0x68b1affbaa4cdc78
	.xword	0xbd68c05719337012
	.xword	0x6e902565fd879e5f
	.xword	0x8ccfd3fbe75f9bc6
	.xword	0x9a88aa20ba53d835
	.xword	0xf8d4c5af232d1f87
	.xword	0x76cafde2387190b4
	.xword	0xccfc9a8ac67134e1
	.xword	0xe0b70406c4354e18
	.xword	0x337ff7124099219e
	.xword	0x6ad5c647b50f561e
	.xword	0xe1bc359efd949faf
	.xword	0x088c87f85fdae358



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
	.xword	0x5b599669d35128c6
	.xword	0xd65b18739506f779
	.xword	0xac99bb8315fdff62
	.xword	0x81511a6c7c02f79a
	.xword	0xe223780417e8e4e9
	.xword	0x88accb663005325b
	.xword	0x0bb5401b988396d0
	.xword	0x8ab568b20e9cf4dd
	.xword	0x9e958471c6b654dd
	.xword	0xb699d41845cc5319
	.xword	0xbdafd660e7471808
	.xword	0x2857c531f2181877
	.xword	0xab522e0494213680
	.xword	0xc0b720874cca271b
	.xword	0xf63fdaecb434598f
	.xword	0x98d5c2ea3ae86a76
	.xword	0x7b084a4105a2e186
	.xword	0xd2f2874a0a16e31e
	.xword	0x2e2014f97ac839a2
	.xword	0xadccda78a57c6e09
	.xword	0xcfdb43ae7539099b
	.xword	0x704732a59a110177
	.xword	0xf2705ccc2e3f7d6c
	.xword	0x31176fda3e26bf1f
	.xword	0x301a464e028e5701
	.xword	0x5f3368e990cc79a5
	.xword	0x61e57c65e47fddfb
	.xword	0xabe34dac9207215c
	.xword	0x5282f18256bbc335
	.xword	0xcbe6396cc36c5159
	.xword	0x5ff6b0cbf8971611
	.xword	0xec591b900eb93156
	.xword	0x48d4c06b8fe81a34
	.xword	0x5910d9cb9116ef9d
	.xword	0x00029bfb28e2f577
	.xword	0x1b01cb72ba862f76
	.xword	0x1b202fadbacbec5c
	.xword	0x27c96e139e66d2bf
	.xword	0xd30e471a40871431
	.xword	0x8990292a9cd69f76
	.xword	0x118f2133307a66ec
	.xword	0xa26e2fc8bf6283bf
	.xword	0xc0a706bc2c17d515
	.xword	0xafc1576ae72de170
	.xword	0x6f7e2fd1e8817b24
	.xword	0xafe7d58c68a8200e
	.xword	0xeb8ff7ee74343571
	.xword	0x579d9651e097536c
	.xword	0xf38771335ffc7e52
	.xword	0x78850ef8f6e66d5d
	.xword	0xe5b26964eaafdc98
	.xword	0xf9a7b8ecf63599a2
	.xword	0xa887b69ac4742439
	.xword	0xce8c0b1808981ebc
	.xword	0x7df452351adce5b2
	.xword	0xd2288363403555b5
	.xword	0xb49b58350f5a9c13
	.xword	0x6a005a27eaa82d6a
	.xword	0x9151199f532fde54
	.xword	0x27d9e1f2f89f6721
	.xword	0x2f81ecd96f026595
	.xword	0x465442cbd5f68aff
	.xword	0xb9b8de1414239819
	.xword	0xc94b7a64aaf41381
	.xword	0xe89e599ff2b001db
	.xword	0xb1dd665917cd7711
	.xword	0x3a7eb162acebf6d6
	.xword	0xffdfdff82f8e58e6
	.xword	0x5baddc72d24b336f
	.xword	0x815eeaef3a873ea0
	.xword	0x79a082465feca015
	.xword	0x08f8a2088f4fc0ab
	.xword	0x898c43b13b31be9f
	.xword	0xbaa83803cdf79569
	.xword	0x227d19a197d6db88
	.xword	0x3ba511487dcdc481
	.xword	0xbec5c04f0b20cf92
	.xword	0xc4796f7e41838f02
	.xword	0x99587b57d1a4b04f
	.xword	0x83c3f7b24e44f115
	.xword	0x4da43a2a091e4d35
	.xword	0xf728b85c58730012
	.xword	0x4f006884f31b13c6
	.xword	0xe31dc3e644aa34dd
	.xword	0xba32df9807f9d03e
	.xword	0x2728e39032a2e83c
	.xword	0x99c7aea43ce7dceb
	.xword	0xa742467bbbf3bdbe
	.xword	0xb4134b82561df490
	.xword	0xfe64312c74490fbc
	.xword	0xbd908fabb62c3a6a
	.xword	0xeafc451bbec43835
	.xword	0xd4b19fc5568be57d
	.xword	0xf96ef45f7cfea69d
	.xword	0xe9ff6ee548d846f7
	.xword	0x30a4f4b0f5ae5495
	.xword	0x3de8ad2b7df9be71
	.xword	0xff04a7c730bf910b
	.xword	0x3ad5a49f06662f75
	.xword	0xa96a3b83cb13175d
	.xword	0x570aa6d034e702f1
	.xword	0x5683195ee8d4b28c
	.xword	0xc88ae0004d058d55
	.xword	0x938686131b697719
	.xword	0xefc1228c7ca5cd43
	.xword	0xb1e743ca33f453a6
	.xword	0x8e6fea45941cc8d8
	.xword	0xa2710c473c0a48af
	.xword	0x4d9adde389e680b6
	.xword	0x939835789a76ec6a
	.xword	0xa6e85908fbe8e0c5
	.xword	0xefd04ac7c11b6018
	.xword	0xa35baf78dd51e909
	.xword	0x9dcbe5b20e375e35
	.xword	0x3adfb4d7f069cd23
	.xword	0x1a6667423e039fda
	.xword	0xf2c942771ad52198
	.xword	0xd61b5760a79452e4
	.xword	0x61bb28d70e6042b2
	.xword	0x7e3a4483094771a7
	.xword	0x255b02b0c9849963
	.xword	0x20558210939b8c5a
	.xword	0x4689f683c1fea571
	.xword	0x859196b066c52c60
	.xword	0x7faa3c5b2332cc1a
	.xword	0x483ae11315c5eea1
	.xword	0x74d0e009ff158c90
	.xword	0x7452df1671144f98
	.xword	0x802d522fefffb6aa
	.xword	0x67bd8c313bc6debf
	.xword	0xf2062eb034296304
	.xword	0x691760f62697de5d
	.xword	0x65eef13292abe42b
	.xword	0x9a512068991aefeb
	.xword	0x59d766e5e098359c
	.xword	0x726b3ab53a953082
	.xword	0x798efa1a0ffc0261
	.xword	0x98c3deaae12127d8
	.xword	0x6c2c44e184917eb4
	.xword	0xf06a8bfa02cca0d0
	.xword	0x8fce19c4536fb6c5
	.xword	0x860c32a3dfb35e62
	.xword	0x48af3b8e1c0fe505
	.xword	0xb81fa9b59dfcefa7
	.xword	0x3a87a5132b2df1ba
	.xword	0x4714142605c9b63f
	.xword	0x5e442a051cf63837
	.xword	0x5acb3eaabea74973
	.xword	0x5aa86151990555e6
	.xword	0xed2dfdb6ca5afb8c
	.xword	0x5069e10abad9fdbd
	.xword	0x2f5c1d68b36d0191
	.xword	0x4a9c8c575e21709f
	.xword	0x60981a1e9bd70de0
	.xword	0xe215dfd8db3844fc
	.xword	0x483ac19f171ce658
	.xword	0x3cd0ac51de692328
	.xword	0xd13a2ff3427fed56
	.xword	0x6a867fb816c2d3fd
	.xword	0x2144fd9c49fcdbdb
	.xword	0x35a9718f3adcb729
	.xword	0xe94b133e9781d53c
	.xword	0xfe4c7e2940bce15e
	.xword	0x6e920939df16309a
	.xword	0xed6040301c9c2687
	.xword	0x242050d9022cf214
	.xword	0x59143571994b1b39
	.xword	0x273dca9716071039
	.xword	0x3bba9e32bf06943a
	.xword	0x93f8310901236baf
	.xword	0xd701ca067ab9a2d2
	.xword	0xc750c8983a3eabe2
	.xword	0x096ade295ebd4596
	.xword	0x23a471f0e2a40f3b
	.xword	0xdb209d58ba48d156
	.xword	0x5774c99133d3ea71
	.xword	0xf5e67976b797075b
	.xword	0xfb02136ff4519e7b
	.xword	0x3dfd02298ff5b00f
	.xword	0xf25790fd4da9bf5a
	.xword	0x9448e002cc460655
	.xword	0x17286c88eabfa105
	.xword	0x2ae1a1a39891c2ca
	.xword	0x9ff0a64a1ec7af8e
	.xword	0x040036ca324f92ef
	.xword	0xad067038e46cff99
	.xword	0x0b2ae6bf26625080
	.xword	0xe5bd864fce96b72c
	.xword	0x272ac246de0c74cd
	.xword	0xed82780f901136cd
	.xword	0xba9685c9f19b19e2
	.xword	0x88be5fcccaa7fa37
	.xword	0xbfc00a6a92ce0a01
	.xword	0xaa81f0079d337605
	.xword	0x66a896327b71b162
	.xword	0x2c56ea2ebe8e530a
	.xword	0x05393b887ce85145
	.xword	0x971ffdbab4af61f6
	.xword	0xbddcab618a0ac50f
	.xword	0x97970f460140c676
	.xword	0x9b860b72387205b1
	.xword	0x079d17340496ca87
	.xword	0xe602087fd9d4397c
	.xword	0x0a305db523ab2ca0
	.xword	0x41eb6c1756394175
	.xword	0xdbfb3a84c23c56da
	.xword	0x58a0b434e12925d6
	.xword	0xae3783e893be3b54
	.xword	0xd779bfa6ad2e3796
	.xword	0x1b7fe6380ed6690d
	.xword	0xc52ac9561fa5b46d
	.xword	0x3d088f8d54b3921e
	.xword	0x9bf33f93b0ce4705
	.xword	0xf46504dc4c950d8c
	.xword	0x703b6ce0cba02447
	.xword	0x050d0c815766f0c7
	.xword	0x0493aec29a2d341a
	.xword	0x5d4e30c268c2bc80
	.xword	0xf2fb7cb6c95c546d
	.xword	0x72d9d041e5660145
	.xword	0xc4593396712904e6
	.xword	0x0f5988155a7446bd
	.xword	0xe547ea29337b414a
	.xword	0xcb9254a5c1419b75
	.xword	0x4f0f1a07d69e1e71
	.xword	0x1718effe15fc4339
	.xword	0xe2199bb05b584674
	.xword	0x87d546f0c41a3ba4
	.xword	0x06a1788545a43c6e
	.xword	0x4fb5743d51cfee55
	.xword	0x77afd53bdb436927
	.xword	0x0dae097a2ff8c050
	.xword	0xa537ff110e362226
	.xword	0x65980543400f0cbd
	.xword	0x8e80bac28538d4b4
	.xword	0x26500e7be2876f78
	.xword	0xaf9ecdebc6f027e6
	.xword	0x4bf16831b63126c0
	.xword	0xcbe6fbb6e926dd76
	.xword	0x8a52ffc060d83304
	.xword	0xd6ce4f9b2751ea37
	.xword	0xf9e256b3524027c8
	.xword	0x732888b459d23690
	.xword	0x59e092455a14a077
	.xword	0x525d0b32565b3d48
	.xword	0x96455e36f20bd366
	.xword	0xfe2d0190c638d75e
	.xword	0x98398db3e526c248
	.xword	0xbd50efdd66d2521a
	.xword	0x63a84c7bbac74299
	.xword	0x977a42e52bcd536e
	.xword	0xc5f38c879b686869
	.xword	0xa6ee9da0e9d88b7d
	.xword	0x3fcdd4b67b958ba3
	.xword	0x17045f6a1395855a
	.xword	0xe949fe2185432726



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
	.xword	0xf26cef610270ab94
	.xword	0x7ac814b3f09ebfd6
	.xword	0xfd0bcca622d0db2f
	.xword	0xaed775a77657805c
	.xword	0xbaa4419ee6039d80
	.xword	0xe6a195e282ac4266
	.xword	0x030e005a8a2c4a3f
	.xword	0x786876fcee314620
	.xword	0xfd4e7a937ca22312
	.xword	0x070d13f30809d6b6
	.xword	0x09a94e9a6d14118d
	.xword	0x8dc2420cb31d369d
	.xword	0xf48f27c80f42d4a8
	.xword	0x36b1a33cbe433ee3
	.xword	0xabc186d1b1753b05
	.xword	0xa80ce09169d62810
	.xword	0x12fd0719d46d7e74
	.xword	0x1fc17777159338de
	.xword	0x8928bbaaf6b14b5f
	.xword	0x959f11eb70bc5955
	.xword	0xfcef3762540ece2e
	.xword	0xf40662a85c146ad0
	.xword	0x8ccef750a5fc3ffd
	.xword	0xfa088b14d698621e
	.xword	0x8d23301b7f230a79
	.xword	0x7a32469529ebc4c6
	.xword	0x0145c21d48e2ce99
	.xword	0x06319cc0b6b9071b
	.xword	0xefa3108ec8e4cffd
	.xword	0x88fa26170853cbbf
	.xword	0x3ace439fbf4844d0
	.xword	0x65cd49003cd10121
	.xword	0x91ee7c5982fd0e56
	.xword	0xb5d149ec228c341d
	.xword	0xe83f48baef7a72c9
	.xword	0xf8637a986c10d887
	.xword	0x452f813d5491c8be
	.xword	0x49ad271ad73d785e
	.xword	0x8736e01ff13d1758
	.xword	0x137b83ba5d655e10
	.xword	0x0efd9569a4effc81
	.xword	0xfa1ab1bdf910ebfc
	.xword	0xb7f58bba669ed1f5
	.xword	0x7a0f68a441a19a1c
	.xword	0x8eb8e0ec2555f0dd
	.xword	0x20f4d97e97d85bb4
	.xword	0x19b52a65426ba0e2
	.xword	0x2423782e4a022d24
	.xword	0x6671cf67a077fb40
	.xword	0x80ea7db3d889029e
	.xword	0xb5c81e8432db9636
	.xword	0xe44173d6fedf3f78
	.xword	0x068a3f9fbbaf5999
	.xword	0x0e254776117b5778
	.xword	0x04e83880a77976cf
	.xword	0x10f557c3f2bf0aeb
	.xword	0x399eb9b22675c639
	.xword	0xc2955f3ed9a8670e
	.xword	0x46f0a1dda3e98b71
	.xword	0xfc7a542b26930595
	.xword	0x9c99f7b1335be2b1
	.xword	0x3516182c363aeee9
	.xword	0x7ad96b496eef15a7
	.xword	0xa4b32914e22fd421
	.xword	0x08bfa2505409c6bd
	.xword	0xd6a22c165d371d68
	.xword	0x4158667191e083ee
	.xword	0x653bc2eb9b052299
	.xword	0xb57ee313eea288fd
	.xword	0x2c9150cbfcae6e35
	.xword	0xef2bc509bf3d9bce
	.xword	0xc5e881eb727d487d
	.xword	0xcc01e4b6b78cad3c
	.xword	0x2e5a2ceb6110d528
	.xword	0xd874e5bd8b9e0c25
	.xword	0x38dc7464a2cae794
	.xword	0x7752821a00faa1e9
	.xword	0x5871dbd01680d490
	.xword	0x651a7c34849a0e79
	.xword	0xcdac48abdac14d38
	.xword	0x91032492c9bf41eb
	.xword	0x845b5384901f2d76
	.xword	0x461f999d4d2f9445
	.xword	0x143969516278a113
	.xword	0x5578e3fe0572d4ac
	.xword	0x3995580c7673590b
	.xword	0x0a8f50cb29a034ee
	.xword	0xa16d0cd37eafd67b
	.xword	0xb2d7e29fb6f1b8f4
	.xword	0x8e5fe70c79228f35
	.xword	0x4de0a31acf6cb907
	.xword	0xa110335de35352ec
	.xword	0x913f3c886b4768d0
	.xword	0xff7e5e4858406e3e
	.xword	0xfe69168b2ca3c163
	.xword	0xdc62ceae7d01fbc0
	.xword	0x1bc349ac8e0a4985
	.xword	0xb2be2da89be1a0cb
	.xword	0xa7c7ae879854bed4
	.xword	0x7877bd0f9b4e30ed
	.xword	0xd6e35ec584e2962d
	.xword	0x5466b1db364fc0b2
	.xword	0x853b73873cc7e223
	.xword	0xc4cd831afabcf74a
	.xword	0x8ac8b54117bb36cf
	.xword	0x0ffbad1efd50daef
	.xword	0xeaf34d9c3cecb0a3
	.xword	0x7994512d2675998f
	.xword	0xe76315ca6895b16b
	.xword	0xe3f6d28cabf980d8
	.xword	0x50d0808347afa8dd
	.xword	0xc372dc9d33f7f4e0
	.xword	0x48134ea5d4b8f7e7
	.xword	0xa9fbdd262e3031b6
	.xword	0x08239abbffaa5e2d
	.xword	0xf3b7feeb26436fbf
	.xword	0xe890a8913dec4502
	.xword	0xe649f5e99dfd7e5c
	.xword	0x6753f40a72b4074e
	.xword	0xb305b7f1e77a6290
	.xword	0x2faf80358a3a1117
	.xword	0x2badeb67791dde72
	.xword	0xd6c7174ab9f308d0
	.xword	0x548d064fd8400003
	.xword	0x60215b96c1ea9139
	.xword	0x42a4e508b519f97b
	.xword	0xcc8e501d0da1076b
	.xword	0x722e31d5be24e738
	.xword	0x6a5d2fa5a97bd20c
	.xword	0x82b81e11e1f05b5c
	.xword	0x01179c68ba30ead1
	.xword	0x14790ee6ae090aab
	.xword	0x85427af64074c659
	.xword	0x64e41d3b665592ff
	.xword	0x680cfff37921b9f4
	.xword	0x224ac8fb7a68cd03
	.xword	0x083f3bd70085a085
	.xword	0x7bbb21f76cc008c8
	.xword	0x8092b2a5ac3dcb61
	.xword	0x55b0a94c4c132bf1
	.xword	0x95240008a3f23561
	.xword	0xa7e8405ad3c3c606
	.xword	0xe86c341b9cd72119
	.xword	0x9e0003dd6572556b
	.xword	0x2f0986afe173996a
	.xword	0xb5df06ae06bd6346
	.xword	0xbf89bb28bc93cdbe
	.xword	0xa6150044abc02a18
	.xword	0xbae08caaa417f130
	.xword	0xd3671fa65ed23f93
	.xword	0x5367ae12b6979c7b
	.xword	0xef2fec609d15601e
	.xword	0xf7e4f2d63657d026
	.xword	0x27fb5418ab45aced
	.xword	0x7c945d844f934f9e
	.xword	0xac7b0752c4e987ad
	.xword	0x094e4055efa4f4f2
	.xword	0x08a462a8e9cdf9b1
	.xword	0x4b2ec5d90cf85c59
	.xword	0x670829d5fa16ab9b
	.xword	0xc2abb9e3363f32a5
	.xword	0xab1346cccdef2be4
	.xword	0xb63a8795aeed1e97
	.xword	0x8c3210ee47a6ad76
	.xword	0x1443a9065a6ecc93
	.xword	0xa2b2ee589279bb54
	.xword	0x91e211eb80bd0bf8
	.xword	0xba9f5dca7cb96201
	.xword	0xeec4a6a3ed03067a
	.xword	0x85bc751deaff81cf
	.xword	0x7d11434b5d8ca345
	.xword	0xea9c555b1a7e3ffb
	.xword	0x2fc51a2c36d41eaf
	.xword	0x6dca6c969faf4c53
	.xword	0xb97ccca27c9d697c
	.xword	0x79bf96b3604f72b6
	.xword	0x92ba41e3f7a9d370
	.xword	0xd954f9490d0e43fe
	.xword	0xc7271b62322611fc
	.xword	0xa1f11ada7f0ef36e
	.xword	0x52fd067b4da5c699
	.xword	0x7c241ba7fb56430c
	.xword	0x9968e2421312573d
	.xword	0x66894634db752bbb
	.xword	0x7cf6760fd7018874
	.xword	0xc191180b98421dc6
	.xword	0xe0838cd91def1b4f
	.xword	0x2079ff2c7850b711
	.xword	0xb3be072aaf48f3de
	.xword	0xe4d7053c27ce04d2
	.xword	0x657c0233d92283b7
	.xword	0xe3aec09a05436d11
	.xword	0x8d2961a5df4f4836
	.xword	0xe8aaf894c6962373
	.xword	0x44ed5065605351a5
	.xword	0x9daf128eeaaeaa0b
	.xword	0x41d101ce53effbdf
	.xword	0xdfc8d0f2dcbec223
	.xword	0x4ea737e2560e230f
	.xword	0x1547ab33e50ab7ec
	.xword	0x105d8343824983b8
	.xword	0x6056891f1c7d5326
	.xword	0x985c2051c5291516
	.xword	0x95a3cf1022eaf4cb
	.xword	0xd15da6a7ada1f580
	.xword	0xb98eb653204b7307
	.xword	0x4799e076456085d6
	.xword	0xc01189a7bdd9d864
	.xword	0x8ad9a56493589597
	.xword	0xb1ea67b2be12e56b
	.xword	0x086ccf5710c70726
	.xword	0x3b3e251e952702d3
	.xword	0xa58f677121a8354d
	.xword	0x34f2d20ae8afc113
	.xword	0x4b3653313cff64df
	.xword	0xa037037b8b3a5dab
	.xword	0xf1c3d8eeb76c5b79
	.xword	0xad9216d9339125bd
	.xword	0x5070e54e88b510d7
	.xword	0x8952476f98228e86
	.xword	0x4b021d512d406044
	.xword	0xdfea861c3d213f25
	.xword	0xfae854c5c449607f
	.xword	0x2304b1da87b236c2
	.xword	0x5c967ec7771f1653
	.xword	0xa7debd5737a29fa8
	.xword	0xf6eb2bf931c8c339
	.xword	0xd20a87a0b4083325
	.xword	0xfae89c5306c2b0b6
	.xword	0xb89cdb47ead956f7
	.xword	0xa6b3b2eaefc38ba4
	.xword	0xe40eba9372e5194a
	.xword	0x0a6e3130092a1a3d
	.xword	0xb66ba264baacd066
	.xword	0xb98771396d6d5063
	.xword	0xbfdefd7dd2ec8eb9
	.xword	0x1ead7abaccdfc769
	.xword	0x3f793fe58b720bdf
	.xword	0x124aa54fabcdc317
	.xword	0x042cf0e6a2f595a3
	.xword	0x3553b78c16a949d4
	.xword	0x5da23cf2df42bfd6
	.xword	0xdee7298f3e292ab6
	.xword	0xa6590567b03e14f5
	.xword	0x0e06c658f9598625
	.xword	0xd1fdccc14651230b
	.xword	0x1f4f6c690cd9385c
	.xword	0x69e0e1864b493595
	.xword	0xacde87e8131a762a
	.xword	0x5c09466761e711df
	.xword	0x42dbb1fe7e2cd89a
	.xword	0xbf1c5c10db099ede
	.xword	0x76be63d218de7ac9
	.xword	0xf1a64250411a01a7
	.xword	0xf25bc38b3743ef31
	.xword	0x8e1b81220101055a



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
	.xword	0x88461f4098683c39
	.xword	0x8bba94e376889a26
	.xword	0xf34016497e35804b
	.xword	0xc75b44e0864e6f1b
	.xword	0x0237804ee280fce9
	.xword	0x96c5d8c6bef03a7b
	.xword	0x94ef224450801918
	.xword	0x8513812f0694db18
	.xword	0xc5c14b2a8485c048
	.xword	0x83dec098fcf5385b
	.xword	0xe3d9d2dbd55453d9
	.xword	0x8ec7b2efceabc917
	.xword	0xbf05e9e8eecf629a
	.xword	0xf21b2f2ba05c76a6
	.xword	0xd4006c2308d823b2
	.xword	0xef847b40814d8e93
	.xword	0x939e56081799558d
	.xword	0xe248a75b1b044c42
	.xword	0x9ebfd12d704bb6f5
	.xword	0x231b69f80f8ec4f4
	.xword	0x29bce6410270ac19
	.xword	0x2966b6c27dff6a06
	.xword	0x3fb62658ac66aa39
	.xword	0xad964d101f65e380
	.xword	0x223e356e96c7f6dc
	.xword	0xb55e121398061a98
	.xword	0xb1ccdaa56bd50580
	.xword	0x3214e797cf0bdbd9
	.xword	0x92ea8e18363b0d14
	.xword	0xc5dac925c1c8793a
	.xword	0xf8caa56bfe54003e
	.xword	0x23a432d452e36bee
	.xword	0xdc57b61455816a49
	.xword	0x49e7c356bfede751
	.xword	0xe4508f4e60876bb2
	.xword	0xbaa8138484fc0578
	.xword	0xd929ed8727eca15f
	.xword	0x01a3c98e8d92bf49
	.xword	0x90c00a6c1973ff16
	.xword	0xa151329085485d22
	.xword	0xf6e1a835913ba113
	.xword	0x6f029cc6da1aee5b
	.xword	0xfe346c1693c87e27
	.xword	0x9dbb21e335abd369
	.xword	0xe10bff1a5fa3dd57
	.xword	0x4e243bf25deb3689
	.xword	0x3b7994bafa6d25fd
	.xword	0x4b0901ec077541a2
	.xword	0x10d24068525ac360
	.xword	0x6d3cbe9ba791d0b6
	.xword	0x8cdbb330bc6b1d06
	.xword	0x6cc8de21f720b0cc
	.xword	0x6189dba62c45bc0a
	.xword	0x1acb1f0b9789b7a0
	.xword	0xe3230837b9f47096
	.xword	0x0a105d01c2823652
	.xword	0xc2a9048d0dad8154
	.xword	0x156dfdf20a9d8ca7
	.xword	0xf6d39359a5d9c3f7
	.xword	0x72f5ace75f660ade
	.xword	0x2a790c3869f216c4
	.xword	0xdeb0fb982ad6c30e
	.xword	0x120dd27c9d3f350b
	.xword	0x01f42cb66c8004ac
	.xword	0x1ac122aa5060e537
	.xword	0x38a1349926c22238
	.xword	0xec4796be06176376
	.xword	0xa3626085e5be9439
	.xword	0x268d1dd7ff8cc611
	.xword	0x13da2bb1d9b984fc
	.xword	0x0d12deb7bbb12203
	.xword	0x826e237823f3bc2f
	.xword	0x11116e8db83dac29
	.xword	0x658ff9a67530d7ad
	.xword	0x5a67e9f2e40faa6c
	.xword	0x9235b58a8a3cb951
	.xword	0xd2ba26426f920428
	.xword	0x3b2aa6883b70d56a
	.xword	0x407e8722652c0b4b
	.xword	0xf7ffa3a66a83c96a
	.xword	0x1817102dc4cc34a3
	.xword	0x1b668603b5c055ca
	.xword	0xbb653da2f5dcefa3
	.xword	0x4fa09a5c6e590c7b
	.xword	0xf1c4b992fc89bc2c
	.xword	0x3d3e3e2fcaec1427
	.xword	0x683d9d35aed5f94b
	.xword	0x0769d7ef02a32e1d
	.xword	0xb348cb2e07e0326e
	.xword	0x11011efc6cdafb76
	.xword	0x109ba2ac2f1f4127
	.xword	0x8f878ccc2f70fd44
	.xword	0xb54746076287efae
	.xword	0x53a9f9b1d6a8d92f
	.xword	0x024b72bf446913cd
	.xword	0xbf317ca5ef05a706
	.xword	0x59562548fa613a68
	.xword	0xc96bb765733e806c
	.xword	0xe370ab44652b9321
	.xword	0x58a018592bda2763
	.xword	0x894b82f9421d643d
	.xword	0x073d13abc3911578
	.xword	0xc13c4476f372ec14
	.xword	0xf1aee289074c0702
	.xword	0x829c3d8ee11357f0
	.xword	0xe7b9815be33b916c
	.xword	0x78e89c5e21a1583d
	.xword	0xd789794977c9d554
	.xword	0xc2f98aa883a585db
	.xword	0x55a88124812fe529
	.xword	0x58abda4f36327997
	.xword	0xed2a06a4d2a85997
	.xword	0x1cf7a57f68d99910
	.xword	0xf43be2a0dfc7be1d
	.xword	0x4d711c69ec340a76
	.xword	0xd5d44fbe84169d9d
	.xword	0x7b5ad6a601e295af
	.xword	0x3dd7224f61ccdd75
	.xword	0x781f13d1c33ef1aa
	.xword	0x8e406b91f7f76f70
	.xword	0x8a40256306572411
	.xword	0x77577a97b318e8dd
	.xword	0xe1e746d4bf17c3fe
	.xword	0x7f6c7665dbd9c775
	.xword	0x86c2bf92344d016d
	.xword	0x88dcf57373fba352
	.xword	0x80492c02fccb8846
	.xword	0x1c82c78e97bb7efb
	.xword	0x3663ca8e7976d1df
	.xword	0x5ca4aaa7f33612b3
	.xword	0x4dec82feb6825fab
	.xword	0x9cf5a0015c0e4fde
	.xword	0x71115c401958cdda
	.xword	0xea259b8824055272
	.xword	0x1b01fcf8743ae35f
	.xword	0x47ac4d0956fd2df5
	.xword	0xcefbc7ed91f20939
	.xword	0xf9ddb80656aef10c
	.xword	0x9983ec25da892844
	.xword	0x1800bdd79afc1028
	.xword	0xac872378479897eb
	.xword	0xd12aed8c680faf5e
	.xword	0xebd8a239aec61e83
	.xword	0x93b985f75a5237b7
	.xword	0xff9c7526e079e2aa
	.xword	0x91a4ba293bfd12e8
	.xword	0xaaeb45f004919255
	.xword	0x2f9d2067f8bcc46f
	.xword	0x7353c46375aa9c36
	.xword	0xa071c996264649d8
	.xword	0x352c822594e202b8
	.xword	0x059c7b3d6ba0c417
	.xword	0x824b4fba68f934d7
	.xword	0x313c0b41cae73fc3
	.xword	0x5918d59285ed1296
	.xword	0x9e069ba7bbac8f85
	.xword	0x5399af028215d025
	.xword	0x6dce766c19bb10a9
	.xword	0xb0f83be4a1b9988b
	.xword	0xac69bce9488e6f6a
	.xword	0x42b4d908c47559f8
	.xword	0xdde22e32f78be163
	.xword	0xfea8d59bb36aaaac
	.xword	0xc817351c9a4d3722
	.xword	0x196a549ff92b614a
	.xword	0xaf6545583e1ad141
	.xword	0x854e4c3f927685a2
	.xword	0x4f0d0b2de1f97ba4
	.xword	0x4c5b35e1b15c48dd
	.xword	0x2b70c3b86ba69e73
	.xword	0x97560b8cd642fe6b
	.xword	0x1e07acc71448dcd8
	.xword	0x81c935cf40598af2
	.xword	0xf27034ca74b46bdc
	.xword	0x58d61602dbb73b40
	.xword	0xeaf662019e3cd3ee
	.xword	0x45a0f44408d40563
	.xword	0xd96cfa6d3d50be39
	.xword	0x16a6f3f8bbd219e2
	.xword	0xcd31e08b83909c8c
	.xword	0xa948ad5e82a10f9f
	.xword	0x5c388b05c597fdd2
	.xword	0xa42540c7fc90dabe
	.xword	0x9c97e56e17dd579a
	.xword	0x7680adbca49842b1
	.xword	0x1273f997f58b2307
	.xword	0xf25683b42eff9dfa
	.xword	0xc817dd48996dbbc9
	.xword	0x639340a63752d0ed
	.xword	0x245927fdee320e1d
	.xword	0xb8defd692a7725fc
	.xword	0xd8cd7f4f0f201dc6
	.xword	0xe33e6ddd31b679ec
	.xword	0x2be3e315c269bceb
	.xword	0xe6c7b08280a9c926
	.xword	0x6ab629e4f7106064
	.xword	0x1a89162f5f7d2d1d
	.xword	0xbd87341a4f42d650
	.xword	0xf1fd522b92f49a6e
	.xword	0x1d2141c9ce7c6b50
	.xword	0xc6dd785095f86334
	.xword	0x35bdcdf32daab5f2
	.xword	0x08300553b3a0726f
	.xword	0x288766b734f9d97c
	.xword	0x531b51cdc1d85c25
	.xword	0x4f92c763eebe5af2
	.xword	0x875bee0bb39526a4
	.xword	0xd9a08d08caabf3ca
	.xword	0x42b571c3a1650cb3
	.xword	0x42b05ace6a6c022e
	.xword	0x84dc26fd6a17ce41
	.xword	0x7222870b0ae2c4c1
	.xword	0xcce18132a7be2009
	.xword	0xc2abffe5a295c891
	.xword	0x452318edc417b008
	.xword	0xd41866a380477b0a
	.xword	0x3585d413f9e80a59
	.xword	0x1634e849916882e9
	.xword	0x21ea8ce413920fd4
	.xword	0x2c39f92ca77aeabe
	.xword	0x6ca8094ba9d3ccab
	.xword	0xc7ba647999a73e00
	.xword	0x4a49e9d024890b92
	.xword	0x885b8c46d3cc8d23
	.xword	0x360ac894df444f67
	.xword	0xa3bee34926acb3a2
	.xword	0x05344be4c3c51c7b
	.xword	0x33756d043f52394b
	.xword	0x818f85b6f0f308ae
	.xword	0x0a7bd7f8d3c3740d
	.xword	0x83a1b80abb603cdb
	.xword	0xc807dba983c1653a
	.xword	0xb0eac9e3adb9eb28
	.xword	0xaef21c99f2c5f61e
	.xword	0xb854224f8590b0d2
	.xword	0x3c12b122d6596be8
	.xword	0x1273eec495e63214
	.xword	0x96b114df5299c9a3
	.xword	0x77314a4fc036aec9
	.xword	0x1906063b9ab0abd1
	.xword	0x8356dc2537f81479
	.xword	0xc3a32ad90a44e3ac
	.xword	0x2a282c7f4ab91555
	.xword	0x6ee77b1d954bf0d8
	.xword	0x586098184e713dd3
	.xword	0x5a670c6a3dbf12a8
	.xword	0x14ea1b22a4be323f
	.xword	0x4a1a8c4eef2f0885
	.xword	0x3f5e98dd8cca2e57
	.xword	0x86351514b4d4f00d
	.xword	0xa145fdac8b84e3ad
	.xword	0x41fddbdd94bcd078
	.xword	0xc42f8b3f4a216e47
	.xword	0x59df43d2a0c41bf9
	.xword	0x2f5b2bd62770145e
	.xword	0x9411bfaddc47810b



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
	.xword	0xc7d182b922f21fac
	.xword	0xb5f15161fd12fb3c
	.xword	0x7416ce0ac0cd61bd
	.xword	0x1db3e34a89799bda
	.xword	0x30f507a87bd7d6c6
	.xword	0x6878497e4b1b84e4
	.xword	0x84c0e81856a63cf7
	.xword	0x1fcf9cc395052a63
	.xword	0x56878ee299ce340b
	.xword	0xd5536a277f8c9e6d
	.xword	0xaa5908e44ecea1cb
	.xword	0xbc156c76b11fe495
	.xword	0xe0f1e7a1bbb09a4b
	.xword	0x63aaa8a1666ae0bb
	.xword	0xf83f910a2e3dfed1
	.xword	0xe2d3905f2d883d04
	.xword	0x025fd7693813e8d2
	.xword	0x777c6e01fd423f64
	.xword	0x0c411f02c17ec37c
	.xword	0x72403c787b279449
	.xword	0x7500e094bc00a9fd
	.xword	0x71e5d3ff321b311e
	.xword	0x521420635e2046c1
	.xword	0x81ac1f4e55f819d2
	.xword	0x400c5069fbb03b38
	.xword	0xbb7af3d31724faa7
	.xword	0xc86af9c3673512f3
	.xword	0x7dea3208ba443ae6
	.xword	0x42722f4b3eb1da27
	.xword	0x3d867eedb0e61fee
	.xword	0xe159949eaa167a53
	.xword	0xdf4aabe616c1571e
	.xword	0x8ae699dd25ded24e
	.xword	0x34e54219ad53f10d
	.xword	0xfaa933a6580618d8
	.xword	0xe2ffcff3d009aa56
	.xword	0x0be0cfa7aeae5cfc
	.xword	0xb4d09212242bc212
	.xword	0xe7595d8636f7ef3f
	.xword	0x362b5b91adaa9fbe
	.xword	0x2243604fc47cc873
	.xword	0xd4f02e5dce2cc277
	.xword	0xcb55ecfc79a93500
	.xword	0x1d7d68d94dfaf5c6
	.xword	0xbab30ac814e64d5b
	.xword	0x63967898ee6fdfb3
	.xword	0x0475d7a53392e9b3
	.xword	0xbaba9c494b9c1837
	.xword	0x7346249f84df18f3
	.xword	0xacbae0fba464c3ef
	.xword	0xae30e22cfc34f68f
	.xword	0xe030ac9799e67ec7
	.xword	0x2d7d985e5a72d92c
	.xword	0x2ac8b26f362ba563
	.xword	0xfd04c243c2a5ffae
	.xword	0x56b6fa7afac14e76
	.xword	0xd243c6c657986401
	.xword	0x54ec7af9e45b92a2
	.xword	0x674de260e77133fd
	.xword	0xd634f9483c03003e
	.xword	0xde45c3443ced0694
	.xword	0x0e87dc339ec5014d
	.xword	0xbd5e85f90d3e28b2
	.xword	0x8e56dda37943990f
	.xword	0xb633fb898a6ed1d6
	.xword	0xc9cfe4038dceab0f
	.xword	0x602e7c84cea3edfb
	.xword	0x30efb67a39daf364
	.xword	0xf6700a2db975c8b1
	.xword	0x46673f7d62a7d810
	.xword	0xa10c87e1c0978598
	.xword	0xb3279c0a87f55dae
	.xword	0x0ead3170feae3f89
	.xword	0x7f49c8b77cdd8fc9
	.xword	0xa9f0438d244a56e7
	.xword	0xb10866df1faff5f2
	.xword	0xefc78aa16c01dbf2
	.xword	0xe381b38611060003
	.xword	0x35925a372d465753
	.xword	0x7465f26bd1ec97d7
	.xword	0x08c5fcfed655ab40
	.xword	0xe82339610657e464
	.xword	0x47d1fefaebd6039d
	.xword	0xf215776a946d2d07
	.xword	0x5b8f80d48e5ffa26
	.xword	0xa52f84a672042cfb
	.xword	0x629c308b28d4324f
	.xword	0xd91a1da882281568
	.xword	0x3a6e165c5710666d
	.xword	0x7562e9749a092a95
	.xword	0xf0bed0d4b7af394c
	.xword	0xb2f54c35def8efa6
	.xword	0x601d0a6d28f64843
	.xword	0x0980dbdd686176ff
	.xword	0x87cb478ee040ded7
	.xword	0x2e7766cd2464d030
	.xword	0xaa0b0d1ac0fed329
	.xword	0x74d6dd7f2f5a6b04
	.xword	0xb77cbf06929274ae
	.xword	0xacb84def8d543ae2
	.xword	0x01be59c68bbbb0d4
	.xword	0xfb1f11beaa5c7e00
	.xword	0x4d2326a1f19a2a38
	.xword	0xc6b81ef87091b4c6
	.xword	0x303532657857f4a7
	.xword	0xff72ced8c599ccaa
	.xword	0xd1d24c849b18a687
	.xword	0x7f2b9292ac3df14d
	.xword	0x0e940ac3e1597c5f
	.xword	0xc793d1d9908258a2
	.xword	0x27d4ff2241e21406
	.xword	0xecd886b7d9f1180d
	.xword	0x0d70ab611a3af632
	.xword	0x22865d79f9c7cb3b
	.xword	0x6a50e7b17379b620
	.xword	0x2fe575647e2e77e0
	.xword	0x2413ef8e212da4c6
	.xword	0xe59a85ea6dcdb36c
	.xword	0x063d4ed755c1883d
	.xword	0x14884366c22da8bd
	.xword	0xdb6de8ebb2beaf58
	.xword	0x8c29f4942ab5aa15
	.xword	0xe82ddbb234c5ab97
	.xword	0x56b9184a4854f340
	.xword	0x05b1184104c4e2d6
	.xword	0x2065e8c0c42c29d8
	.xword	0xa30433249690cf93
	.xword	0x02bbbe96354b081e
	.xword	0xf70b468c042e23f3
	.xword	0x2bf1ebd73c04cb4a
	.xword	0xe4c3d0e25d0e94af
	.xword	0xea4077b26cd4f4da
	.xword	0x1a3e66f1426f9b92
	.xword	0x69b42f0cf01ea1e4
	.xword	0x605b1a9a6dfae822
	.xword	0x623b1603e463666f
	.xword	0xb78ad7fd79e45d42
	.xword	0x456b247cf1ed02c1
	.xword	0x70d9406c4b9a7fbf
	.xword	0x39e1b2545093553a
	.xword	0xd6eab797d2be7f5b
	.xword	0x2aebe11c2762cbf6
	.xword	0x4574fd352036f52f
	.xword	0x7f470390a06b3483
	.xword	0x50585dc04390a64b
	.xword	0x429fce6c2d41ef0b
	.xword	0xfca67ca794ff93d0
	.xword	0x4db3121f24feca1d
	.xword	0x7d7ae739cb126cd1
	.xword	0xaf3546064ca5b447
	.xword	0x3fb8fd432dcd9475
	.xword	0x54ba4ec55852b282
	.xword	0x684412753a0f55ae
	.xword	0x3ba4937c20a1d1ad
	.xword	0x86bc0e57f57d4a7b
	.xword	0xc3b819883b88998d
	.xword	0x873204536ed07b21
	.xword	0xac08584318799735
	.xword	0x72982e579c7e075d
	.xword	0x5a7f03089d57f67c
	.xword	0x94f049e2c25e9b57
	.xword	0x62500cf2e6d04216
	.xword	0xa8f509cfb9ab5ef9
	.xword	0x4f4c3920fcb3ee54
	.xword	0x89faf5575470193c
	.xword	0xdd6f1123eb3c4dd0
	.xword	0x89d0817604a8beba
	.xword	0xac32fbd10e404885
	.xword	0x962efafbb4c141d0
	.xword	0x4e38d80555d9e0c3
	.xword	0x97ce5063b48cee89
	.xword	0xf9797f0f12f33682
	.xword	0x79b1e5879f57fa63
	.xword	0xc9e4090bc1aaa3eb
	.xword	0xe02b98e17ffaa416
	.xword	0x0a49b7dadc0811f1
	.xword	0xffde12701a6128d9
	.xword	0xc55b2d3de339bf50
	.xword	0x678ea94f036f94b9
	.xword	0xe5b027909ecda032
	.xword	0xa1203bf1294a0e06
	.xword	0xe8cc8cb596b214e4
	.xword	0x78a5f72bf2ec588a
	.xword	0x93c3d38a249e6ebc
	.xword	0xb88745961281c9c1
	.xword	0x68efde6bcde6b59a
	.xword	0x091ec28fa40fe1f4
	.xword	0x65da36682d26630f
	.xword	0x9f0383e07694fb66
	.xword	0x1f6bb162fb8a4831
	.xword	0xb66e9b43e44280ea
	.xword	0x8921a524be39d36e
	.xword	0x5a2a4e2bffb7009f
	.xword	0x33beb1d535acf5bc
	.xword	0x0ad2f5e7677e3a62
	.xword	0x9fd529f5e615f49a
	.xword	0x897ad938d7e1711f
	.xword	0x8a02e9072cd28664
	.xword	0xdf693f1f394e8c96
	.xword	0x660e5dafaa59cdb2
	.xword	0x83cf136ab63a881a
	.xword	0xd5681941f1357a24
	.xword	0x032f2636b2d32a20
	.xword	0x8dc45c4097d7f841
	.xword	0x0783579a8fe3a706
	.xword	0xf79ef961e74da6d7
	.xword	0x82392a5898712144
	.xword	0x1990491176210ccd
	.xword	0xa2c7af972f4c078a
	.xword	0x7152400130bae57d
	.xword	0xc5a8e644b5f6acfc
	.xword	0x77b6174dd4456a6e
	.xword	0x997d0efe8b6e8b48
	.xword	0xab757a7065b7be60
	.xword	0xda231a1727aab360
	.xword	0x092b5303ce8e2ce7
	.xword	0xb5a0ed9c5b88f5ce
	.xword	0x8dc23c8addf21cba
	.xword	0x12d6728e852d8bc1
	.xword	0x985c9579ae3b5634
	.xword	0xb227588daaa80bac
	.xword	0x45653c8a7d55878f
	.xword	0x72bf8c2c8c880790
	.xword	0xca9aad98c3685249
	.xword	0x8fffb6e4312cd73f
	.xword	0x23d8d1becaaea347
	.xword	0xff3db039a267581e
	.xword	0x536cc6995c9afebf
	.xword	0xf221176698cdb3ae
	.xword	0x96a32fdfef5dd851
	.xword	0xbda2d210aee652ef
	.xword	0x7536099432e9187d
	.xword	0x5778bf6ddd768e23
	.xword	0x6d23c4e432ba1dcc
	.xword	0x37b6b7250b7d3ca5
	.xword	0xce4133001445d490
	.xword	0x2d319f89b2793667
	.xword	0x9b7e6520914fd2f2
	.xword	0x0235e78792cb4eaf
	.xword	0x6a453711fb9e1650
	.xword	0x703c030add2a066d
	.xword	0xa0ecb7b1b8e8e4ed
	.xword	0x578e6989f8aa3ab5
	.xword	0x24de4cf9a162d817
	.xword	0x778f8f69e3e63ca6
	.xword	0x1c5f118702aa8a28
	.xword	0x4d0ba547b65b64e3
	.xword	0x7b3ee6f066e6a273
	.xword	0xd383e622a20733e1
	.xword	0xe19db97e41f1841d
	.xword	0x120ebac303d435e2
	.xword	0xe16ae31c660fd766
	.xword	0x5d32359a4232d0e5
	.xword	0xc787588cbe8656fe
	.xword	0x80bb1653909ce2db
	.xword	0xdd466afc4f729cda



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
	.xword	0xae2e89f257be9892
	.xword	0x7d2de10a3952a96b
	.xword	0x860ca4b57ebc85b1
	.xword	0x2ffd8743f6c425ea
	.xword	0x39a00c5d2c0b47ad
	.xword	0x413bbe820a8514f8
	.xword	0x420ed1421c41c418
	.xword	0x510b833aac5877aa
	.xword	0x2231190a2ed07396
	.xword	0xa09cb36e26dae033
	.xword	0xeefda5785e05f24b
	.xword	0xcf40ab33b968d713
	.xword	0x5902fbd7a344b31a
	.xword	0x342d1ef8b5c309ff
	.xword	0xd43297f46f5da830
	.xword	0xaa0885a56658bc4f
	.xword	0x17e68ec3a4a858da
	.xword	0xe642fa3a1cd32d8e
	.xword	0xa26fd3b7275b76ed
	.xword	0xc14b8daf576cbf4c
	.xword	0x2f27052d21ae1b98
	.xword	0xbd8ebba0b7e1309f
	.xword	0x917127f9636f3f47
	.xword	0xe754e550a4d32ba1
	.xword	0x6836b382f17c4a43
	.xword	0x5d873cdcdaeee1bf
	.xword	0x228010864f80ca65
	.xword	0x09412b7d3238e534
	.xword	0x012f9c1c8312566c
	.xword	0xbe439bb50a14c276
	.xword	0x9d6cef4f8fae646a
	.xword	0x4e39d2c6c758fd65
	.xword	0x330fe9d3a5afd1df
	.xword	0xbbe4829bef811d91
	.xword	0x596e3c61eeb065af
	.xword	0xd204ec288415a8da
	.xword	0xc11cbaf33f873b30
	.xword	0xe356abfec4afcf35
	.xword	0xf13d086d281b459b
	.xword	0x357703cd8f8ba7ac
	.xword	0x1425d1ab2261f312
	.xword	0x9084878f9a7cd8da
	.xword	0xee8b1a0c1f1ee362
	.xword	0x01f5e12498655b96
	.xword	0xdf083ed179d0a6b6
	.xword	0xf8ceb76d4264bb2e
	.xword	0x637811330e8edee7
	.xword	0x8933139942958c72
	.xword	0x4f2a5c5acc1e21b2
	.xword	0xec1cd8062bab4098
	.xword	0xe993c1bb2ab3198f
	.xword	0x6221f43aed0feaba
	.xword	0x44ba15f644a5976f
	.xword	0x756b301473ec3cb7
	.xword	0x133e238c0cbcbfb3
	.xword	0x3d54b4ca87a04638
	.xword	0xf38bc76697b5359e
	.xword	0x7884cd47c37e32fb
	.xword	0xd29f529fd08d6ee2
	.xword	0x8c9b771a32a4af2a
	.xword	0x305abe1cbafb69ce
	.xword	0x90e295974a94d159
	.xword	0x2dd1f11d27b7b5d7
	.xword	0xc542dfb20a934ee0
	.xword	0xe5d9914f04218a45
	.xword	0xb009d3d0253f93eb
	.xword	0xa5e5be0ee223cce4
	.xword	0x1aabec0c666f1afc
	.xword	0xcd5a5185ca74bb86
	.xword	0x8321eea9f8701186
	.xword	0x17f6024ad98c5d07
	.xword	0xb034d8c991bea996
	.xword	0xed6191d324bdba75
	.xword	0x97518af922341f44
	.xword	0xeae1c819563c079c
	.xword	0x89c6cecf40f94c86
	.xword	0x96e5a0baa6032cdd
	.xword	0x05c52270ec8a2c4e
	.xword	0x95368ba8069c85a7
	.xword	0xa9e2a0653eead4e8
	.xword	0x7bb0bf5ad6a72afb
	.xword	0x2cbc437372aae55c
	.xword	0xc3bd81b02d57b545
	.xword	0xde2a9cbe98ef7d59
	.xword	0x52ff39384237bd20
	.xword	0xc30bd60e1d0637ae
	.xword	0x53cd8368c13b4c83
	.xword	0xa2ea92bbf243b455
	.xword	0x079973c329f7995a
	.xword	0xd46a129dabf8a0c5
	.xword	0x7725a4bdd82d6d21
	.xword	0xf99120bee37c54bb
	.xword	0x974245a673a8401c
	.xword	0xe64264b79ca6b478
	.xword	0xcc69f556c786e647
	.xword	0x63234d21a2dd61ee
	.xword	0x67ced5ef6095bdde
	.xword	0x7ad257668a29f84c
	.xword	0xaaae8ddd3488c7c9
	.xword	0x95ea2a01ea09740f
	.xword	0x15ebf20b7f5b488a
	.xword	0xb9e58adba0cd2f06
	.xword	0x5d9f349930370b1c
	.xword	0x63504cce00e6e3d7
	.xword	0x0a943e7d8ebe0c24
	.xword	0xc2e31dc26b76ae9f
	.xword	0x3f0c15b567ce0500
	.xword	0x7e3750f1fc0ba18b
	.xword	0xcb4a599b57e5535d
	.xword	0x27af4f45a829f758
	.xword	0x4d7fd3aa4360c440
	.xword	0xed10015a581524e1
	.xword	0xa19f25665fb0aa7c
	.xword	0x69501f8f648173c9
	.xword	0x90852e9feaa94c71
	.xword	0x1081458e84fb6310
	.xword	0x4517a01168d0e1ae
	.xword	0xbe31fc4dcc1cbaea
	.xword	0x3f1346cccc24ad9d
	.xword	0x4dfc78cd09706c58
	.xword	0xb1033b26fb0e7545
	.xword	0xed0b4edc30e3563c
	.xword	0xbee0643e941158d9
	.xword	0x71bc09a68f544fbe
	.xword	0x9e55bfc3b7ea82dd
	.xword	0xe3888a8598255309
	.xword	0x62bb5136ca746543
	.xword	0xa179e8d9468a11d1
	.xword	0x107a4dae27568eda
	.xword	0x90a9a8ab6af5dbf9
	.xword	0xecc9156c4ab67639
	.xword	0xee0b86e3b99d0019
	.xword	0x012ba4f1bbea2a28
	.xword	0x309111c27e6eaa2b
	.xword	0x244b06f8a2e75e8e
	.xword	0x57435087a3662a51
	.xword	0x9da7e6038d85e014
	.xword	0x332ffd46a1e5932b
	.xword	0xdbb26ccc0044424e
	.xword	0x98c388320cbc7775
	.xword	0x74504c1e40ca1353
	.xword	0xf47e6610153d6dab
	.xword	0xe6ef1b6fe0b05be4
	.xword	0xd2ea49a8a5587d75
	.xword	0x4e2f4b930e9fb3b9
	.xword	0xa223aa8f3984c9ef
	.xword	0xb6c92c188eb11072
	.xword	0x929200ebceffa727
	.xword	0x2a6a4e92a6e6435a
	.xword	0x4b61cc6a552234ec
	.xword	0x1833ec74a544fa20
	.xword	0x33f8a112b42a8a13
	.xword	0x332b5f96bc1e79df
	.xword	0x7f6088e735243937
	.xword	0x5accc83463226a47
	.xword	0x4ec0bfe7ad82989a
	.xword	0x1e072c2176b347e9
	.xword	0x23529b469ed62424
	.xword	0xedca1dcc28df7a5b
	.xword	0x57718ed1b791d04d
	.xword	0x2a37eb2156728965
	.xword	0xccd05c18fca8103b
	.xword	0x9c4a267b4f884a12
	.xword	0xc0a624de31d75170
	.xword	0x3eedfca83f9d0e9e
	.xword	0x8aaaaa059877d727
	.xword	0x8ff6bd7a988a1928
	.xword	0xc96ba3101e52bfca
	.xword	0x8ff942e85e5b8f5b
	.xword	0xadbf13b693721980
	.xword	0x64b2a494a7efc6a7
	.xword	0xf837de923aee2d8d
	.xword	0x53a6daa884c6624c
	.xword	0xfa9d2d4f1bc7a5e4
	.xword	0xbb6375c79139d147
	.xword	0x2380c322c6bb7b73
	.xword	0x6c673e67d9a44445
	.xword	0x0ac24b9446c9874c
	.xword	0x627cd729ac579800
	.xword	0x16231c7727d8bb73
	.xword	0xc5ea1938cf185e99
	.xword	0xfbfe82734da138dc
	.xword	0x3e62ac91b4ceaa40
	.xword	0xba5e520fcae739a1
	.xword	0x778f98d6e52eba0f
	.xword	0x971048bd792740d5
	.xword	0x15ad8bcf25ce0109
	.xword	0xd8841e467f613052
	.xword	0x61a0b0df4aaa2ea8
	.xword	0x257f8785fae5d1e9
	.xword	0xda953bf5d962dc95
	.xword	0x659285fe5860eda6
	.xword	0xe848dbaa456bb4cd
	.xword	0xf1e9a55dfabab0b1
	.xword	0x28ddd0a291189cd9
	.xword	0x32421d5e9567a9c6
	.xword	0x0e71c117cbaa361b
	.xword	0xf4c4eb5e0785025e
	.xword	0x3640e983eb6005d2
	.xword	0xfaca90ceda9643fb
	.xword	0x205bcaf8d4f4b906
	.xword	0xa00bdb1fb3f52ae9
	.xword	0x0b038c2d18646283
	.xword	0x47aad02c3377c11d
	.xword	0xc95ddc435a998a80
	.xword	0xfb05b085311c50b9
	.xword	0x1efa7fcd6de32f4e
	.xword	0x0ce026af435b0e05
	.xword	0x1278cf3c96ee5125
	.xword	0x9d68c68eec967a51
	.xword	0x4d4fc4048c5ebc22
	.xword	0x9d2cd58d9ce33f59
	.xword	0xbe97d33626294de2
	.xword	0xe894f89630dd661b
	.xword	0x0e29e7a0f5fc1b83
	.xword	0xf749c916ca14da51
	.xword	0x5f9731273adb267a
	.xword	0xf4d2a88f3f98910d
	.xword	0x9fa37851b75c9010
	.xword	0x659ebb2275a8bc4f
	.xword	0xcc5815d53c93bd6e
	.xword	0x998238b657ccaec8
	.xword	0xd476aa8ccd01249c
	.xword	0x2b0dadbaf9c31db3
	.xword	0x25f8cba25ce23c68
	.xword	0xc64b3ce763e1ef35
	.xword	0x0e64170aa2229fa2
	.xword	0x8d606e0aaa7fb5b5
	.xword	0x338859e37073980b
	.xword	0x5eb0f43cbb1dc48e
	.xword	0x6530d5ffe13635a4
	.xword	0xc3351bfdbcfdc042
	.xword	0x9cf7c7ec45d31ef4
	.xword	0xefd48451b20d64af
	.xword	0xde58847054dfa8da
	.xword	0x1e885f7d8c36b233
	.xword	0x3649ace2cf9e2d59
	.xword	0xb11fd52a7c7eb9c9
	.xword	0x9f99d79a282f9066
	.xword	0xd7a4afc5d7ab1a2f
	.xword	0xbbe19eabae222deb
	.xword	0xd8ea607ffb96003f
	.xword	0x399e3bbc1fff38dc
	.xword	0x0b353eacce497acc
	.xword	0xf009ce3ea12eaad6
	.xword	0x1f50d5733e39eeda
	.xword	0xc878e6c50f8890f3
	.xword	0xa61c6f7be288ebe2
	.xword	0x87e7081b57128701
	.xword	0x597a63d85b830af3
	.xword	0xf89d1e08ee0c7314
	.xword	0x762dcd7002f7f9ed
	.xword	0x70222be0ee62f3b2
	.xword	0x9ba615e771801bbc
	.xword	0x530b833069dbbce5
	.xword	0x3395d5921783e2ca



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
!!# #define NCDATA1	3
!!# #define NCDATA2	4
!!# #define NCDATA3	5
!!# #define NCDATA4	6
!!# #define NCDATA5	7
!!# #define NCDATA6	8
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 105, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 108, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 109, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 110, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 114, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 123, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 132, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 133, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 136, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0001 0000 rrrr 0000 0001,"
!!#         "20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 147, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 0000,"
!!#         "20'b rrrr rrrr 0000 00rr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! only this one is the d02ee000 +0x1000 mapped
!!#   IJ_set_rvar ("diag.j", 157, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0000 1101 0010,"
!!#         "20'b 1110 1110 0000 00rr r000,");
!!#          ! init only till 7fff 
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
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 237, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 245, ijdefault, Ft_Rs1, "{6}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 246, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 247, ijdefault, Ft_Rd, "{16..23}");
!!#   IJ_set_ropr_fld    ("diag.j", 248, Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 251, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 252, ijdefault, Ft_Imm_Asi, "{256}");
!!# 
!!#   IJ_bind_file_group("diag.j", 256, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 257, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 260, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 262, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 263, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 264, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 266, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 268, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 269, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 271, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 272, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 273, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 274, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 276, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 277, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 280, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 281, th_M, "\tmov\t0, %%r8\n");
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
!!#   IJ_printf ("diag.j", 314, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 315, sjm_5, "\n\nBA LABEL_0\n");
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 319,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 321,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 326,Seq_Start, NULL, 2);
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
!!# 		IJ_generate ("diag.j", 737, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# !inst_type: set_addr load alu store 
!!# inst_type: set_addr load atomics alu store atomics_asi barier sjm4 sjm5
!!# {
!!# 		IJ_generate ("diag.j", 744, th_M, $2);
!!# 		IJ_generate ("diag.j", 745, th_M, $3);
!!# 		IJ_generate ("diag.j", 746, th_M, $4);
!!# 		IJ_generate ("diag.j", 747, th_M, $5);
!!# 		IJ_generate ("diag.j", 748, th_M, $6);
!!# 		IJ_generate ("diag.j", 749, th_M, $7);
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
!!#                    IJ_printf ("diag.j", 766, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 769, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 771, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 772, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 776, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 777, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 778, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 779, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 781, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 782, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 795, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 800, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 804, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 805, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 807, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 808, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 822, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 826, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 827, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 844, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 849, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 850, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 852, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 853, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 855, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 856, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 861, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 862, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 864, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 865, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 882, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 885, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 887, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 888, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 892, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 893, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 894, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 895, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 897, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 898, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 911, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 916, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 920, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 921, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 923, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 924, sjm_4, "+\n");
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
!!#                    IJ_printf ("diag.j", 939, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 942, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 944, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 945, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 960, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 963, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 964, Rv_rand32);
!!#                          IJ_printf ("diag.j", 965, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 970, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 972, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 986, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 992, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 996, sjm_4, "0x%08x ",sjm4_dat);
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
!!#                    IJ_printf ("diag.j", 1011, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1013, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1015, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1021, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1022, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1049, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1055, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1056, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1059, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1061, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1070, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1072, sjm_4, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1090, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1096, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1101, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1103, sjm_4, "\n");
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
!!#                    IJ_printf ("diag.j", 1121, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1124, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1126, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1127, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1130, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1131, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1132, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1133, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1135, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1136, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1149, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1154, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1158, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1159, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1161, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1162, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1176, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1180, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1181, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1198, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1203, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1204, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1206, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1207, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1209, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1210, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1215, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1216, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1218, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1219, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1236, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1239, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1241, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1242, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1246, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1247, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1248, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1249, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1251, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1252, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1265, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1270, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1274, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1275, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1277, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1278, sjm_5, "+\n");
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
!!#                    IJ_printf ("diag.j", 1294, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1297, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1299, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1300, Rv_memaddr_pattern_io);
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
!!#                       IJ_printf ("diag.j", 1315, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1318, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1319, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1320, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1325, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1327, sjm_5, "\n");
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
!!#                    IJ_printf ("diag.j", 1341, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1347, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1351, sjm_5, "0x%08x ",sjm5_dat);
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
!!#                    IJ_printf ("diag.j", 1366, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1368, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1370, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1376, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1377, Rv_rand_mask);
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
!!#                      IJ_printf ("diag.j", 1404, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1410, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1411, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1414, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1416, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1425, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1427, sjm_5, "\n"); 
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
!!#                    IJ_printf ("diag.j", 1445, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1451, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1456, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1458, sjm_5, "\n");
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
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1483, Rv_jbi_fifo_wr0_config);
!!#                         IJ_update_rvar("diag.j", 1484, Rv_jbi_fifo_wr0_config);
!!#                         } else {
!!#                         jbi_config = IJ_get_rvar_val64("diag.j", 1486, Rv_jbi_fifo_wr1_config);
!!#                         IJ_update_rvar("diag.j", 1487, Rv_jbi_fifo_wr1_config);
!!#                         }
!!#                         if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         invalid_config = 0;
!!#                          }
!!#                         } config_cnt++;
!!# 
!!#                         if (fr_done == 0) {
!!#                          fr_done = 1;
!!#                         IJ_printf ("diag.j", 1497, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 jbi_config);
!!#                         IJ_printf ("diag.j", 1499, th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         IJ_printf ("diag.j", 1500, th_M, "\tstx\t%%r9, [%%r10]\n");
!!#                         IJ_printf ("diag.j", 1501, th_M, "\n\n\n");
!!#                         IJ_printf ("diag.j", 1502, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1503, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1504, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1505, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1506, th_M, "\tsetx 0xcf00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1507, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1508, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1509, th_M, "!IOSYNC cycles to start sjm\n");
!!#                         IJ_printf ("diag.j", 1510, th_M, "!***********************************************************************\n");
!!#                         IJ_printf ("diag.j", 1511, th_M, "\tsetx 0xdeadbeefdeadbeef, %%g1, %%g2\n");
!!#                         IJ_printf ("diag.j", 1512, th_M, "\tsetx 0xef00beef00, %%g1, %%g3\n");
!!#                         IJ_printf ("diag.j", 1513, th_M, "\tstx %%g2, [%%g3]\n");
!!#                         IJ_printf ("diag.j", 1514, th_M, "\n\n\n");
!!#                         }
!!# 
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!# !                                jbi_config);
!!# !                        IJ_printf (th_M, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!# !                        IJ_printf (th_M, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                       IJ_printf ("diag.j", 1524, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!# 
!!#                       rnd_cnt = random()%8;
!!# 
!!#                       !setx    ncdata_base, %l0, %l2           ! nc data base
!!#                       !setx    0x1000, %l0, %l3                ! nc datawork area
!!#                       !add     %l2, %l3, %g3
!!# 
!!#                         switch (rnd_cnt) {
!!#                         !case 0 : IJ_printf (th_M, "\tsetx\tncdata_base0, %%r1, %%r6\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1535, th_M, "\tsetx\tncdata_base1, %%r1, %%r6\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1536, th_M, "\tsetx\tncdata_base2, %%r1, %%r6\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1537, th_M, "\tsetx\tncdata_base3, %%r1, %%r6\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1538, th_M, "\tsetx\tncdata_base4, %%r1, %%r6\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1539, th_M, "\tsetx\tncdata_base5, %%r1, %%r6\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1540, th_M, "\tsetx\tncdata_base6, %%r1, %%r6\n"); break;
!!#                         case 7 : IJ_printf ("diag.j", 1541, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",Rv_jbiaddr_pattern1); break;
!!#                         default :IJ_printf ("diag.j", 1542, th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n",Rv_jbiaddr_pattern1); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1544, th_M, "\tsetx\t0x1000, %%r1, %%r17\n");
!!#                         IJ_printf ("diag.j", 1545, th_M, "\tadd\t%%r6, %%r17, %%r6\n");
!!# 
!!#                       !IJ_printf (th_M, "\tsetx\t0x%016llrx, %%r1, %%r6\n", jbi_addr);
!!# 
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
