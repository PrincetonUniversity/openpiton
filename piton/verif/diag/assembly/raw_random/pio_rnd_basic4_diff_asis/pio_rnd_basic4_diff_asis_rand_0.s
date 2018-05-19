// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_diff_asis_rand_0.s
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
   random seed:	621501522
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

	setx 0xc7460f9836a048d4, %g1, %g0
	setx 0x1660df7291c4d529, %g1, %g1
	setx 0xdfa299f7f0f860d1, %g1, %g2
	setx 0xcfe9cf4a587e3d18, %g1, %g3
	setx 0x8969a93b55069ff0, %g1, %g4
	setx 0x0647e7709d1009d0, %g1, %g5
	setx 0x450fdf7c8000501e, %g1, %g6
	setx 0x1191ac1253d76b8d, %g1, %g7
	setx 0x3b4890c86f8457eb, %g1, %r16
	setx 0x0257d293d7d3aff8, %g1, %r17
	setx 0x828ccaca89db26d2, %g1, %r18
	setx 0x5a297bd39191bb17, %g1, %r19
	setx 0xe302e0309013f8fc, %g1, %r20
	setx 0xd6d30608d02b2b3d, %g1, %r21
	setx 0x3fec3cce2317d824, %g1, %r22
	setx 0xdba525aec8f92940, %g1, %r23
	setx 0x385290a09b4b138d, %g1, %r24
	setx 0xe63197ad946dd062, %g1, %r25
	setx 0x59bdb8717f561688, %g1, %r26
	setx 0xa61b81e9d1dba8ba, %g1, %r27
	setx 0x8c28eb476b2533e2, %g1, %r28
	setx 0xc53f506943ff2f2c, %g1, %r29
	setx 0x488b85a502e67c0c, %g1, %r30
	setx 0xf9abb9905827c200, %g1, %r31
	save
	setx 0x11f596af0c539d92, %g1, %r16
	setx 0x4ede4c2b55449550, %g1, %r17
	setx 0xb1d8d79cfe31c8ce, %g1, %r18
	setx 0x9e7f4b658f3d4c7a, %g1, %r19
	setx 0x6ac313eb92c7da08, %g1, %r20
	setx 0x1f1672c574b20f7f, %g1, %r21
	setx 0xd05cffcac081a291, %g1, %r22
	setx 0xa1d79069ccc19dc4, %g1, %r23
	setx 0x6d3f408d705a3652, %g1, %r24
	setx 0x0fb65b3f38f05b53, %g1, %r25
	setx 0xc1c3510fcd525364, %g1, %r26
	setx 0x4f648ca2955088b3, %g1, %r27
	setx 0x6a63aeca539f6386, %g1, %r28
	setx 0x7ad3aa78c928e79b, %g1, %r29
	setx 0xb672e49df7444064, %g1, %r30
	setx 0xa595aa9d26dc25e4, %g1, %r31
	save
	setx 0x135a3d87c4e801a4, %g1, %r16
	setx 0xd33d77a9d3109ffb, %g1, %r17
	setx 0x43331c06dd0b9867, %g1, %r18
	setx 0xe575bb84f729ce1e, %g1, %r19
	setx 0x269430e92bd16d83, %g1, %r20
	setx 0xdd757aad8ffa6ab5, %g1, %r21
	setx 0x4019c395eed3b0ed, %g1, %r22
	setx 0x12dadbcc8e8f58f5, %g1, %r23
	setx 0xb997d08e830fc7c7, %g1, %r24
	setx 0x48c4d0f5172e7386, %g1, %r25
	setx 0x5a588f4330203d1b, %g1, %r26
	setx 0x455b869d908420a6, %g1, %r27
	setx 0x22ab11bf175f6910, %g1, %r28
	setx 0x1b02f1933ec9ddb9, %g1, %r29
	setx 0x5adf355bdcefcda0, %g1, %r30
	setx 0xcf00ff5f67480e39, %g1, %r31
	restore
	mov	0, %r8
	setx	0x0000000051008002, %r1, %r9
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



	setx	0x000000000d2ee038, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec41a000  ! 1: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xee698008  ! 2: LDSTUB_R	ldstub	%r23, [%r6 + %r8]
	.word 0xa6998008  ! 3: XORcc_R	xorcc 	%r6, %r8, %r19
	.word 0xe471a000  ! 4: STX_I	stx	%r18, [%r6 + 0x0000]
	.word 0xede18008  ! 5: CASA_I	casa	[%r6] 0x 0, %r8, %r22
	.word 0x8143c000  ! 6: STBAR	stbar
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0418008  ! 10: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xea69a010  ! 11: LDSTUB_I	ldstub	%r21, [%r6 + 0x0010]
	.word 0xae198008  ! 12: XOR_R	xor 	%r6, %r8, %r23
	.word 0xe039a010  ! 13: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xeef98008  ! 14: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 15: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee030, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe011a010  ! 19: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xe4698008  ! 20: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa801a000  ! 21: ADD_I	add 	%r6, 0x0000, %r20
	.word 0xe439a000  ! 22: STD_I	std	%r18, [%r6 + 0x0000]
	.word 0xe0f9a020  ! 23: SWAPA_I	swapa	%r16, [%r6 + 0x0020] %asi
	.word 0x8143c000  ! 24: STBAR	stbar
	setx	0x000000000d2ee038, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec098008  ! 28: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xec69a038  ! 29: LDSTUB_I	ldstub	%r22, [%r6 + 0x0038]
	.word 0xaeb9a000  ! 30: XNORcc_I	xnorcc 	%r6, 0x0000, %r23
	.word 0xec318008  ! 31: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xeae98008  ! 32: LDSTUBA_R	ldstuba	%r21, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 33: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee008, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0118008  ! 37: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe669a018  ! 38: LDSTUB_I	ldstub	%r19, [%r6 + 0x0018]
	.word 0xae41a010  ! 39: ADDC_I	addc 	%r6, 0x0010, %r23
	.word 0xe429a010  ! 40: STB_I	stb	%r18, [%r6 + 0x0010]
	.word 0xebe1a008  ! 41: CASA_R	casa	[%r6] %asi, %r8, %r21
	.word 0x8143c000  ! 42: STBAR	stbar
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0418008  ! 46: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe0698008  ! 47: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa8018008  ! 48: ADD_R	add 	%r6, %r8, %r20
	.word 0xe021a010  ! 49: STW_I	stw	%r16, [%r6 + 0x0010]
	.word 0xe4f9a010  ! 50: SWAPA_I	swapa	%r18, [%r6 + 0x0010] %asi
	.word 0x8143e011  ! 51: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe009a010  ! 55: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xec69a020  ! 56: LDSTUB_I	ldstub	%r22, [%r6 + 0x0020]
	.word 0xa4898008  ! 57: ANDcc_R	andcc 	%r6, %r8, %r18
	.word 0xe031a020  ! 58: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xeef9a020  ! 59: SWAPA_I	swapa	%r23, [%r6 + 0x0020] %asi
	.word 0x8143e011  ! 60: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee038, %r1, %r6
	setx	0x000000000d2ee018, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0518008  ! 64: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe469a028  ! 65: LDSTUB_I	ldstub	%r18, [%r6 + 0x0028]
	.word 0xa809a028  ! 66: AND_I	and 	%r6, 0x0028, %r20
	.word 0xe0218008  ! 67: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe6f9a020  ! 68: SWAPA_I	swapa	%r19, [%r6 + 0x0020] %asi
	.word 0x8143c000  ! 69: STBAR	stbar
	setx	0x000000000d2ee000, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8418008  ! 73: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe2698008  ! 74: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xa4318008  ! 75: ORN_R	orn 	%r6, %r8, %r18
	.word 0xe029a020  ! 76: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xe3f1a008  ! 77: CASXA_R	casxa	[%r6]%asi, %r8, %r17
	.word 0x8143c000  ! 78: STBAR	stbar
	setx	0x000000000d2ee008, %r1, %r6
	setx	0x000000000d2ee038, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0498008  ! 82: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xea698008  ! 83: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xacb1a000  ! 84: ORNcc_I	orncc 	%r6, 0x0000, %r22
	.word 0xe821a000  ! 85: STW_I	stw	%r20, [%r6 + 0x0000]
	.word 0xeff18008  ! 86: CASXA_I	casxa	[%r6] 0x 0, %r8, %r23
	.word 0x8143e011  ! 87: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee000, %r1, %r6
	setx	0x000000000d2ee030, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8098008  ! 91: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe4698008  ! 92: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xa6a98008  ! 93: ANDNcc_R	andncc 	%r6, %r8, %r19
	.word 0xe0218008  ! 94: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe2f98008  ! 95: SWAPA_R	swapa	%r17, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 96: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe401a000  ! 100: LDUW_I	lduw	[%r6 + 0x0000], %r18
	.word 0xe6698008  ! 101: LDSTUB_R	ldstub	%r19, [%r6 + %r8]
	.word 0xa8b98008  ! 102: XNORcc_R	xnorcc 	%r6, %r8, %r20
	.word 0xe829a000  ! 103: STB_I	stb	%r20, [%r6 + 0x0000]
	.word 0xeff1a008  ! 104: CASXA_R	casxa	[%r6]%asi, %r8, %r23
	.word 0x8143c000  ! 105: STBAR	stbar
	setx	0x000000000d2ee028, %r1, %r6
	setx	0x000000000d2ee028, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0198008  ! 109: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe079a030  ! 110: SWAP_I	swap	%r16, [%r6 + 0x0030]
	.word 0xaa818008  ! 111: ADDcc_R	addcc 	%r6, %r8, %r21
	.word 0xe4218008  ! 112: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe8e9a020  ! 113: LDSTUBA_I	ldstuba	%r20, [%r6 + 0x0020] %asi
	.word 0x8143e011  ! 114: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	0x000000000d2ee008, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec418008  ! 118: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe6798008  ! 119: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xa801a028  ! 120: ADD_I	add 	%r6, 0x0028, %r20
	.word 0xec31a028  ! 121: STH_I	sth	%r22, [%r6 + 0x0028]
	.word 0xe0f9a008  ! 122: SWAPA_I	swapa	%r16, [%r6 + 0x0008] %asi
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee020, %r1, %r6
	setx	ncdata_base5, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0498008  ! 127: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe0698008  ! 128: LDSTUB_R	ldstub	%r16, [%r6 + %r8]
	.word 0xa801a018  ! 129: ADD_I	add 	%r6, 0x0018, %r20
	.word 0xe0218008  ! 130: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xeef98008  ! 131: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 132: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee038, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe419a018  ! 136: LDD_I	ldd	[%r6 + 0x0018], %r18
	.word 0xe4798008  ! 137: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xaa19a038  ! 138: XOR_I	xor 	%r6, 0x0038, %r21
	.word 0xec21a038  ! 139: STW_I	stw	%r22, [%r6 + 0x0038]
	.word 0xedf1a008  ! 140: CASXA_R	casxa	[%r6]%asi, %r8, %r22
	.word 0x8143e011  ! 141: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe059a038  ! 145: LDX_I	ldx	[%r6 + 0x0038], %r16
	.word 0xec69a028  ! 146: LDSTUB_I	ldstub	%r22, [%r6 + 0x0028]
	.word 0xa8c1a000  ! 147: ADDCcc_I	addccc 	%r6, 0x0000, %r20
	.word 0xe031a000  ! 148: STH_I	sth	%r16, [%r6 + 0x0000]
	.word 0xe5e18008  ! 149: CASA_I	casa	[%r6] 0x 0, %r8, %r18
	.word 0x8143c000  ! 150: STBAR	stbar
	setx	0x000000000d2ee000, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8518008  ! 154: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe0798008  ! 155: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xac298008  ! 156: ANDN_R	andn 	%r6, %r8, %r22
	.word 0xe871a000  ! 157: STX_I	stx	%r20, [%r6 + 0x0000]
	.word 0xe4e9a030  ! 158: LDSTUBA_I	ldstuba	%r18, [%r6 + 0x0030] %asi
	.word 0x8143c000  ! 159: STBAR	stbar
	setx	0x000000000d2ee000, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe841a030  ! 163: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	.word 0xe8698008  ! 164: LDSTUB_R	ldstub	%r20, [%r6 + %r8]
	.word 0xac218008  ! 165: SUB_R	sub 	%r6, %r8, %r22
	.word 0xe839a030  ! 166: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe5f1a008  ! 167: CASXA_R	casxa	[%r6]%asi, %r8, %r18
	.word 0x8143c000  ! 168: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base4, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec118008  ! 172: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe4798008  ! 173: SWAP_R	swap	%r18, [%r6 + %r8]
	.word 0xa009a008  ! 174: AND_I	and 	%r6, 0x0008, %r16
	.word 0xe039a008  ! 175: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xe9f18008  ! 176: CASXA_I	casxa	[%r6] 0x 0, %r8, %r20
	.word 0x8143e011  ! 177: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee008, %r1, %r6
	setx	0x000000000d2ee038, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0498008  ! 181: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe2798008  ! 182: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xa8a98008  ! 183: ANDNcc_R	andncc 	%r6, %r8, %r20
	.word 0xe0318008  ! 184: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe6e9a028  ! 185: LDSTUBA_I	ldstuba	%r19, [%r6 + 0x0028] %asi
	.word 0x8143c000  ! 186: STBAR	stbar
	setx	0x000000000d2ee008, %r1, %r6
	setx	ncdata_base5, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec51a028  ! 190: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	.word 0xe4698008  ! 191: LDSTUB_R	ldstub	%r18, [%r6 + %r8]
	.word 0xaec18008  ! 192: ADDCcc_R	addccc 	%r6, %r8, %r23
	.word 0xe821a028  ! 193: STW_I	stw	%r20, [%r6 + 0x0028]
	.word 0xeee9a038  ! 194: LDSTUBA_I	ldstuba	%r23, [%r6 + 0x0038] %asi
	.word 0x8143c000  ! 195: STBAR	stbar
	setx	0x000000000d2ee010, %r1, %r6
	setx	0x000000000d2ee020, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe811a038  ! 199: LDUH_I	lduh	[%r6 + 0x0038], %r20
	.word 0xe0798008  ! 200: SWAP_R	swap	%r16, [%r6 + %r8]
	.word 0xa8098008  ! 201: AND_R	and 	%r6, %r8, %r20
	.word 0xe0298008  ! 202: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe6f9a008  ! 203: SWAPA_I	swapa	%r19, [%r6 + 0x0008] %asi
	.word 0x8143e011  ! 204: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base2, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe8498008  ! 208: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe2798008  ! 209: SWAP_R	swap	%r17, [%r6 + %r8]
	.word 0xaa018008  ! 210: ADD_R	add 	%r6, %r8, %r21
	.word 0xe071a008  ! 211: STX_I	stx	%r16, [%r6 + 0x0008]
	.word 0xedf18008  ! 212: CASXA_I	casxa	[%r6] 0x 0, %r8, %r22
	.word 0x8143e011  ! 213: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee018, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe449a008  ! 217: LDSB_I	ldsb	[%r6 + 0x0008], %r18
	.word 0xe2698008  ! 218: LDSTUB_R	ldstub	%r17, [%r6 + %r8]
	.word 0xa099a028  ! 219: XORcc_I	xorcc 	%r6, 0x0028, %r16
	.word 0xe8318008  ! 220: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xeef98008  ! 221: SWAPA_R	swapa	%r23, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 222: STBAR	stbar
	setx	0x000000000d2ee008, %r1, %r6
	setx	ncdata_base3, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec09a028  ! 226: LDUB_I	ldub	[%r6 + 0x0028], %r22
	.word 0xe269a020  ! 227: LDSTUB_I	ldstub	%r17, [%r6 + 0x0020]
	.word 0xa2218008  ! 228: SUB_R	sub 	%r6, %r8, %r17
	.word 0xec31a020  ! 229: STH_I	sth	%r22, [%r6 + 0x0020]
	.word 0xe2e98008  ! 230: LDSTUBA_R	ldstuba	%r17, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 231: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee000, %r1, %r6
	setx	ncdata_base6, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe009a020  ! 235: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xee79a028  ! 236: SWAP_I	swap	%r23, [%r6 + 0x0028]
	.word 0xa2318008  ! 237: SUBC_R	orn 	%r6, %r8, %r17
	.word 0xe0398008  ! 238: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe8e9a018  ! 239: LDSTUBA_I	ldstuba	%r20, [%r6 + 0x0018] %asi
	.word 0x8143e011  ! 240: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee010, %r1, %r6
	setx	ncdata_base5, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe0518008  ! 244: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xee69a020  ! 245: LDSTUB_I	ldstub	%r23, [%r6 + 0x0020]
	.word 0xa0318008  ! 246: ORN_R	orn 	%r6, %r8, %r16
	.word 0xec218008  ! 247: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4f98008  ! 248: SWAPA_R	swapa	%r18, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 249: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee020, %r1, %r6
	setx	0x000000000d2ee020, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe451a020  ! 253: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xe6798008  ! 254: SWAP_R	swap	%r19, [%r6 + %r8]
	.word 0xaa91a000  ! 255: ORcc_I	orcc 	%r6, 0x0000, %r21
	.word 0xe8218008  ! 256: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe3f1a008  ! 257: CASXA_R	casxa	[%r6]%asi, %r8, %r17
	.word 0x8143e011  ! 258: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	ncdata_base1, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe411a000  ! 262: LDUH_I	lduh	[%r6 + 0x0000], %r18
	.word 0xe8798008  ! 263: SWAP_R	swap	%r20, [%r6 + %r8]
	.word 0xacb98008  ! 264: XNORcc_R	xnorcc 	%r6, %r8, %r22
	.word 0xe4398008  ! 265: STD_R	std	%r18, [%r6 + %r8]
	.word 0xeae98008  ! 266: LDSTUBA_R	ldstuba	%r21, [%r6 + %r8] 0x00
	.word 0x8143c000  ! 267: STBAR	stbar
	setx	0x000000000d2ee020, %r1, %r6
	setx	0x000000000d2ee000, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe419a000  ! 271: LDD_I	ldd	[%r6 + 0x0000], %r18
	.word 0xea698008  ! 272: LDSTUB_R	ldstub	%r21, [%r6 + %r8]
	.word 0xa2a1a038  ! 273: SUBcc_I	subcc 	%r6, 0x0038, %r17
	.word 0xe8218008  ! 274: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xefe1a008  ! 275: CASA_R	casa	[%r6] %asi, %r8, %r23
	.word 0x8143e011  ! 276: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee028, %r1, %r6
	setx	0x000000000d2ee008, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xec498008  ! 280: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe8798008  ! 281: SWAP_R	swap	%r20, [%r6 + %r8]
	.word 0xae01a028  ! 282: ADD_I	add 	%r6, 0x0028, %r23
	.word 0xe421a028  ! 283: STW_I	stw	%r18, [%r6 + 0x0028]
	.word 0xeae98008  ! 284: LDSTUBA_R	ldstuba	%r21, [%r6 + %r8] 0x00
	.word 0x8143e011  ! 285: MEMBAR	membar	#LoadLoad | #Lookaside 
	setx	0x000000000d2ee008, %r1, %r6
	setx	0x000000000d2ee038, %r1, %r6
	setx	0x1000, %r1, %r17
	add	%r6, %r17, %r6
	.word 0xe009a028  ! 289: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xea69a038  ! 290: LDSTUB_I	ldstub	%r21, [%r6 + 0x0038]
	.word 0xa4298008  ! 291: ANDN_R	andn 	%r6, %r8, %r18
	.word 0xe071a038  ! 292: STX_I	stx	%r16, [%r6 + 0x0038]
	.word 0xe2e9a038  ! 293: LDSTUBA_I	ldstuba	%r17, [%r6 + 0x0038] %asi
	.word 0x8143c000  ! 294: STBAR	stbar
	setx	0x000000000d2ee020, %r1, %r6
	setx	ncdata_base2, %r1, %r6
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
	.xword	0x0d112d2d339d77be
	.xword	0xd0f770a8fb3dd8c4
	.xword	0xc16d404f25f51644
	.xword	0x1646b250021a3275
	.xword	0xc52349cd506b524d
	.xword	0x586c741430390308
	.xword	0x7d248f56a4f6ddd2
	.xword	0x0b7f3c5691bac712
	.xword	0xa9750fb1ebf3620e
	.xword	0x59cc44359c4548d4
	.xword	0xbf7ad4c7fc83688e
	.xword	0x05b7393bd3a36efb
	.xword	0x3673ee8956c5c951
	.xword	0xf13caa36ba2f08cf
	.xword	0x162bc559787f9853
	.xword	0x1793f36590c992ea
	.xword	0x2dc0ea74b0d6f6b3
	.xword	0xfa850727327e37de
	.xword	0xa4357ff057f374d8
	.xword	0xfd007c8aad6d0475
	.xword	0x132f8d310a3f6182
	.xword	0x6c88b3ff243867af
	.xword	0x79e71c1011ef4d4c
	.xword	0x2e922b9961c2a64f
	.xword	0xe4a92dfd8f429cda
	.xword	0x5dd9be225e531bde
	.xword	0x96ba4527236bde13
	.xword	0x50ed40c0dd7c0a43
	.xword	0xa077992769bd8dcb
	.xword	0x5cdb2eff0c2fa76d
	.xword	0x373228e402004bc5
	.xword	0xb87b206944931c65
	.xword	0xa50b568b5058f12a
	.xword	0x29223f1d7ff4c075
	.xword	0x2b48be206f0df878
	.xword	0x86f1f5ceaadd324e
	.xword	0xb1bd11f9166966a5
	.xword	0xaaae4446768379b0
	.xword	0x8106252cec431dbc
	.xword	0x39b6a122832dfb0c
	.xword	0x916d124d361d6044
	.xword	0x73300ffaf371a16e
	.xword	0x35be05730526b3e5
	.xword	0xc648dd2eb4509661
	.xword	0xb353930efd3357be
	.xword	0x123f3e49ca19fc55
	.xword	0xd594590b0d99030b
	.xword	0xb1aef695615ade7e
	.xword	0xeaa9adf79c9f0825
	.xword	0xf02d2118c41b6cc0
	.xword	0x13e0a8a0145b0e70
	.xword	0x189874fa74da71b1
	.xword	0xc043e3f766385b0f
	.xword	0x48ca1ca0c1809395
	.xword	0x53917b87779828db
	.xword	0x4b785b01c01625b0
	.xword	0xc927e285c96698d5
	.xword	0x853f5c647d64436d
	.xword	0x02da772621125947
	.xword	0x9153cf1cfb88bb91
	.xword	0x640beeb9ca470100
	.xword	0x1db766d64761d1c5
	.xword	0x39df067142a02686
	.xword	0x77ee672e004c9698
	.xword	0x67ca998e47602e1f
	.xword	0x3e7b3b10a8f273ed
	.xword	0xf99e2af50d705b24
	.xword	0x7a5b9044fa06a160
	.xword	0xad6474a1f21dec3f
	.xword	0xe4f4d25a045f7547
	.xword	0x547a16ee4128a565
	.xword	0x654b3651f0b6d4e4
	.xword	0xe86cf31df133b951
	.xword	0x55c0865ae44c54bb
	.xword	0x73751076326fafbc
	.xword	0xcbada108222a6eca
	.xword	0x506dd5b7e26d041d
	.xword	0x77a80926578b3f20
	.xword	0x0bc9e78eed59d50d
	.xword	0xe8e8aaad5e203b3a
	.xword	0xf3b1393cf19791d2
	.xword	0x94581607f5fde5f0
	.xword	0x401956b95830ec79
	.xword	0x3d0e4dbf23c73635
	.xword	0x0967179cd02915c6
	.xword	0xccc2e8351ff35dd1
	.xword	0x1e98cab81566d656
	.xword	0xe27ae03e6bc5c881
	.xword	0xebeddb11b618f03e
	.xword	0xf1ea4751844b22f9
	.xword	0x02f225874fe76460
	.xword	0x66657638de89e269
	.xword	0x96c9bcc7602291ec
	.xword	0xfb4b602a6b13611c
	.xword	0x6ee7422d31b3ccb1
	.xword	0x885b458d3d03e4a4
	.xword	0x8718bb4ea58aedf4
	.xword	0x0378695dae21f87c
	.xword	0xb1be1f96e94c0cd2
	.xword	0xb4867f4be7708e2a
	.xword	0x4978f60c2e6faaa9
	.xword	0x013eec114ed552b7
	.xword	0xd22f3116ad116341
	.xword	0x36c5f9b1db79724f
	.xword	0x758d42e182dc8526
	.xword	0x0e7f4ad9f27c74d4
	.xword	0xaa2c6f9ed15dcb18
	.xword	0x8c48ed358337c2c8
	.xword	0x21329b025eb6da3f
	.xword	0xb9208f2e6ca35c0d
	.xword	0x50bb1efa1c95a46a
	.xword	0xdd18377d96f913c5
	.xword	0x9525c31f1e0b6353
	.xword	0x5a903a18a5231abd
	.xword	0x44cefe7801ad9490
	.xword	0x55f80ebc10ddecf3
	.xword	0xc06d125667aa0001
	.xword	0x8e1581bc8d8398ec
	.xword	0x2c71c647b389711e
	.xword	0x1af2091a2fe0b704
	.xword	0x67cd177f5de9bf0a
	.xword	0x90cdda653ceb1ce6
	.xword	0x8029c82ab198f8ba
	.xword	0xc8ad1e2248902515
	.xword	0xba4db382a228c620
	.xword	0xe67deea02148050b
	.xword	0x2ab4190407e8ced5
	.xword	0x531a3fc32d807588
	.xword	0xbc80f8e15de0adce
	.xword	0x21a4b4a5679b9d7d
	.xword	0x88ce8e7d154a5cb9
	.xword	0xd73ebe0d3af5cefd
	.xword	0x131fcf624916361c
	.xword	0x2afda82badcc4715
	.xword	0xec05a01aa109fb93
	.xword	0x578e917cefdaa802
	.xword	0x238b1a9618fafa9b
	.xword	0x23f58cd45e5c1381
	.xword	0xe9dd7ac0dfa0f517
	.xword	0xeb9a3c503e339211
	.xword	0xf12cd6364a940569
	.xword	0xe77664047cfaedcb
	.xword	0xd2d6d835227b6f91
	.xword	0x9e44f172fda0e42a
	.xword	0x870a4b72dea9ebab
	.xword	0x8085bf83ecbf7f13
	.xword	0x066d1cb86e125b79
	.xword	0xb31c0b21862d2751
	.xword	0xc1b09ac23c1e995e
	.xword	0xbdd2d349f10c7225
	.xword	0x489feab631081c99
	.xword	0x8e16a5058721a887
	.xword	0x76434c494278bcff
	.xword	0x57be2101e3cffaab
	.xword	0xfe41b8195935b49e
	.xword	0x9147dc123573ff9e
	.xword	0xe17f217189046f32
	.xword	0x23c00491ca8be388
	.xword	0x888e264d69c05275
	.xword	0xf3b82ddccefaade6
	.xword	0xf0b75787ae580650
	.xword	0xa33d20e11c7bd70a
	.xword	0xc8006b20eb835fbe
	.xword	0x7c2c56bfe4ceaa31
	.xword	0x608937a54ff18ecd
	.xword	0xdf717d3b99c51ad0
	.xword	0x7d2130878fec19cc
	.xword	0x2ccac3d94264858b
	.xword	0x9b06ae57cd7eb21c
	.xword	0x54f0dd9a56d73898
	.xword	0xeae804edd9b113cd
	.xword	0xbae1e9522ce17be4
	.xword	0x327389490e6e3474
	.xword	0xedc870c2aa5e0685
	.xword	0x789047e22940ef63
	.xword	0xfda5c362f723d1ba
	.xword	0x28b02c18150d842b
	.xword	0x13cea0d02420ba6f
	.xword	0xe55e024132adbf04
	.xword	0x30276a8896e12d9b
	.xword	0x0abea24c50e3d368
	.xword	0xefbe05058f8dc15e
	.xword	0x8eead5f9992020ce
	.xword	0xb10a07b79c944693
	.xword	0xc5c2ad3ef5fce5a8
	.xword	0xe153e2844b3b51e6
	.xword	0x218f6bfeb861107d
	.xword	0x1a91b5a60b1752d5
	.xword	0x067cd3fbae3ba939
	.xword	0x6aa3cd2bdde003a3
	.xword	0x896bf0d1576498c8
	.xword	0x1f09377403fbd3cd
	.xword	0x1d7ae00a182c8a91
	.xword	0xa1d4019617cb9636
	.xword	0xc5d657812aa1a707
	.xword	0x3e91f38424d0ec2c
	.xword	0x6c752084c6205f8b
	.xword	0xa5dc7e7469c404d7
	.xword	0x2ee35c4d5d99968c
	.xword	0x9120f502fe833385
	.xword	0x7bf3c0c19a1c9740
	.xword	0x76ef2559004a046f
	.xword	0x5c37d37a44b42baf
	.xword	0x9da5adadf8421131
	.xword	0x6a697055980f1fa9
	.xword	0xf75498bdad07ceb0
	.xword	0x8d4c2493dd51a479
	.xword	0xd6c6d67c071d2b6d
	.xword	0x5228b4912a6a686c
	.xword	0x541a2aeec1343220
	.xword	0x724e67833bc97b5b
	.xword	0x690a7526468e96fb
	.xword	0x0b460f8011a05217
	.xword	0x2a9081eb4006542f
	.xword	0x0a9f4374c7748c5d
	.xword	0x1e5d9a72f13e94b5
	.xword	0xcab7a4b4a00967f9
	.xword	0xb0768923cc9c88b3
	.xword	0xd251d2575c0a6712
	.xword	0x2c5e1561f382b794
	.xword	0xe1e14879b383a9e8
	.xword	0x268ad9dce5b8779c
	.xword	0xee5a6d6d1548f8b4
	.xword	0x4237595a0fd6e521
	.xword	0x031b8b586fb6c09b
	.xword	0xd184de12d4f902b4
	.xword	0xd1a885bab8a48d6e
	.xword	0xc998b29fe291bf2d
	.xword	0xeac8185131d59f7b
	.xword	0xfc666b3fbf3cd14e
	.xword	0x2323d24967154369
	.xword	0x67b2cde58b1955a7
	.xword	0x69c48d087e470aca
	.xword	0x85d6f37767da9b85
	.xword	0x5e87360e5e9c31dd
	.xword	0x98a86dab8c826649
	.xword	0xccf66087dad7cec6
	.xword	0x20a936c160c87cd9
	.xword	0x952c50fd15d52353
	.xword	0x48b487c8713f5192
	.xword	0x2730bc376772f64e
	.xword	0x35fa1ada43391c06
	.xword	0x0bcfe3a8db0d7e93
	.xword	0x2b1b0d4ff46761bc
	.xword	0x1f9f33bde3966560
	.xword	0x799225f25be73496
	.xword	0x4164827826f05d6a
	.xword	0xbb7b7ae70e1e0ad4
	.xword	0x6b3f95ef1f9c9f22
	.xword	0x4ba817b28a5f2f3c
	.xword	0x0ed203a889bf501f
	.xword	0x733ce22b573c4b24
	.xword	0x51d88b9bc28c338c
	.xword	0x98b5167c9665667f
	.xword	0x6ed09dea4edab752
	.xword	0x2c1faeb927fdb8f3



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
	.xword	0xa25ef165623911f0
	.xword	0x42bd63e5d893ec2a
	.xword	0xdb0bf550ae36676f
	.xword	0xdd53d90208de473d
	.xword	0x39fe2956d30853fa
	.xword	0x3f8a362ec103b417
	.xword	0xc2a561993a879a54
	.xword	0xdc534859cef01688
	.xword	0x6a2f212d35bf442f
	.xword	0xc808f112aa5f7256
	.xword	0xd7b38d2769b83b0c
	.xword	0x179d37f6537105de
	.xword	0xa66879cb8ee6aec8
	.xword	0x8b541dd2a23ff753
	.xword	0x7567d928a02b4e9f
	.xword	0xc7850c4eb96a7312
	.xword	0x792a95eda79ce72a
	.xword	0xc3b11437a0426f1b
	.xword	0x3bb1c1854d764413
	.xword	0xc07a282fe33793d0
	.xword	0x7be9d6f0c35f689e
	.xword	0xbcfcf8e3337c92f5
	.xword	0xaf75a523915d2302
	.xword	0xa44e7a17560496c4
	.xword	0x45e8d4530dee27f4
	.xword	0xa542ff0806bc7829
	.xword	0xca7b3a7d7e2b97cf
	.xword	0x7833bab186028241
	.xword	0x175e733e8ac26e20
	.xword	0xcc5d5d72e5053c94
	.xword	0xb7251d3eb61e2d34
	.xword	0xf6144e6dd71b4edc
	.xword	0xe370ef111c1bc455
	.xword	0x0b46d3a1128e22a6
	.xword	0x93f4a55c60ee2637
	.xword	0x5d9a007dabc7597b
	.xword	0xdba4cc506d8c5ab1
	.xword	0x470c4eb38b72131d
	.xword	0x6a94462b9eb079d0
	.xword	0xa11c1747e198ae07
	.xword	0xac2536ebe30791cb
	.xword	0x63a38f659f28defc
	.xword	0xa6dcac7dffac7fa4
	.xword	0x68aede62f03681b3
	.xword	0x174b675c54f316c2
	.xword	0xdffc67edca522cee
	.xword	0xd208ee0e235f9edb
	.xword	0x7c8f55a94fafd0d6
	.xword	0x1cdcdf386f729ea1
	.xword	0x94cdc7e8663c9ac3
	.xword	0x8e5fd7c4adcd24e3
	.xword	0xeda705a63c51f490
	.xword	0xe6b73461d03c561d
	.xword	0x898a116d92a359ff
	.xword	0xda14035de33089c4
	.xword	0xbea85ce702aaf329
	.xword	0x540a92810dc63fdc
	.xword	0x2edb7871e7d2fcdb
	.xword	0xfe28b1143000e876
	.xword	0x4b53215fd4f97a79
	.xword	0xcfcee963ae7638cd
	.xword	0x2465dbc947727100
	.xword	0xe7e8cf6c89c1357e
	.xword	0x8879b584b06bd2d8
	.xword	0xfdbc2a467753a1a9
	.xword	0x1c3455e18f2f27f1
	.xword	0xa05e65ba5bcbfb67
	.xword	0x83c17f71283f6902
	.xword	0xe7347afb9eebb6d2
	.xword	0x1b9ad275b305ac2d
	.xword	0xe14790716cf51a03
	.xword	0x0cf3401e12a85f6f
	.xword	0x80c299990b95dd9b
	.xword	0x5604703b82d94ec7
	.xword	0xb41c52f500292613
	.xword	0x06bc02c9950efdd6
	.xword	0x66422759e5ec6144
	.xword	0x61a4dd6f4d54aea2
	.xword	0x16e5ce8259878d3a
	.xword	0x2369397b626f0a2b
	.xword	0xe3a1ca125d3d1ae0
	.xword	0x02caed8146181849
	.xword	0x22b9d2af140497a3
	.xword	0x8c04d82a9f12c8a8
	.xword	0x4cc20b745153918a
	.xword	0xee91c12451463bd0
	.xword	0x542898c273e13402
	.xword	0x4ce46a7499d2416c
	.xword	0xae4c854f51055cbc
	.xword	0xe32cf56e307debcd
	.xword	0xb249e29907bf48c8
	.xword	0x7201b0165d850189
	.xword	0x21d47019654d71c5
	.xword	0x340fb9d968819abd
	.xword	0xb8d9ea34e19b7c0c
	.xword	0x5317024bed2eb5f4
	.xword	0x8b4608c4a78a8a9b
	.xword	0x166c2d558653c83e
	.xword	0x441263ce842c9fe5
	.xword	0x166b380546210b19
	.xword	0x26289530d4c31dd6
	.xword	0x78c75cc2dfc79286
	.xword	0x58f75bd09e4a60c7
	.xword	0x71aacbd014465a05
	.xword	0x1afcd4750c5e247b
	.xword	0xb430075a5d040f14
	.xword	0x577b84cc940e54f3
	.xword	0xc4a280fcf86ba8e6
	.xword	0xcfa98e7ca4f23650
	.xword	0xc9047c07614d3164
	.xword	0x664a6c95eeb005b1
	.xword	0x7c94015425252748
	.xword	0xaf6e38b24001312d
	.xword	0xed59933558d64c70
	.xword	0x0e568375f18754b3
	.xword	0xdc476253c879e305
	.xword	0x91399220931407ef
	.xword	0xaff81d3bd40fa915
	.xword	0x92f77dff23f52789
	.xword	0xc1a70f2ece4d8835
	.xword	0x07c7abb9b43f1703
	.xword	0x400f845239f7082f
	.xword	0xdf220a6dfd9f92d0
	.xword	0x8b695fa3b53d8849
	.xword	0x60a373f0a6625617
	.xword	0x1b98073e7f2a5350
	.xword	0x49ee1429d4cd78c5
	.xword	0xaa4a7238d47aa3a6
	.xword	0x9b88fc93a7232015
	.xword	0xa896ba1a0c6f9b20
	.xword	0x12e5215c309a8877
	.xword	0x92a29c0699c4a745
	.xword	0x91753e43424cc414
	.xword	0x599fdce872bd69b7
	.xword	0x3ca1c2c83108f116
	.xword	0x218b71b0038c537e
	.xword	0xefc7d91dbc206ad1
	.xword	0xd24aad59992e65c8
	.xword	0xb0f52422cdcd558b
	.xword	0x262935712a45e085
	.xword	0xc43174121c650e09
	.xword	0xd37968a351e87737
	.xword	0x89c65bbeb4965bb7
	.xword	0xb475da772dbcea86
	.xword	0x938ee7c5851d24af
	.xword	0xa4385653afb79cf4
	.xword	0x4444b55174b81b56
	.xword	0x7d24debeb34b35a6
	.xword	0x4d7bb33860347c1d
	.xword	0xcdf8de34a4babe9c
	.xword	0x417f95657168a0ee
	.xword	0x510dce68d566abf6
	.xword	0x06e607e0ca600a0a
	.xword	0x7d340d4e1fa20f20
	.xword	0x7c4c2d5814fb65b8
	.xword	0x834e9b4922ba0b0d
	.xword	0xa8fdbfaf28450f61
	.xword	0x78b9482f8a0a3466
	.xword	0x87af338c88c49ead
	.xword	0xfba75aae44103c0d
	.xword	0x6255a98f61bce96e
	.xword	0x83c5166baa8eacc0
	.xword	0xfa2112380cbf7807
	.xword	0x8544bba5ea1c19e9
	.xword	0x89ad95351dcc7c09
	.xword	0x976cbe5d723fc6b5
	.xword	0xf755bfe790386e98
	.xword	0x1ee4e73cf82814e5
	.xword	0xd649f4a459d14ef2
	.xword	0x56041aaaf98a6642
	.xword	0x99bceb6f1840635b
	.xword	0x09b37e3bf82e3037
	.xword	0x461622427686036f
	.xword	0xd1d8e28e7f431972
	.xword	0xa1f9b46c373e81b4
	.xword	0x90f48c6e960d1f1f
	.xword	0xe062c9cd74a08816
	.xword	0xc6278bbc3cbd6161
	.xword	0x7f1ed3f1c7bda9e4
	.xword	0x7837513364d01e50
	.xword	0x6fc0ecf3467b89ee
	.xword	0xec7ea8319a3fa740
	.xword	0xc442c81dbf686066
	.xword	0x5330ab9f98b8df6d
	.xword	0x585c769809aaa41f
	.xword	0xc523c4b9241f0598
	.xword	0xe87fcab991f9a4e0
	.xword	0xb9001b7b0d09c24b
	.xword	0x04fd43f48d8be429
	.xword	0xd438c0ea30e65fa1
	.xword	0xf782971fca1f06a0
	.xword	0x5276035dcf5d2a27
	.xword	0x3146f6ec9f00b68c
	.xword	0x5d3d521947d6fbbb
	.xword	0xf536a595f2b8703a
	.xword	0xa8caafaeb6aa2ffc
	.xword	0xfb682fda5310641f
	.xword	0x7d2e344d3ff8a5e8
	.xword	0xe89d40454dd75763
	.xword	0x9eab11afa3d89e82
	.xword	0x03a8a0d7793ae32e
	.xword	0x08ce6c7474b78535
	.xword	0x894657c979aa52df
	.xword	0x510f20cd433bb1de
	.xword	0x2928650e497a17b0
	.xword	0xb84b56206b53d8d3
	.xword	0x28af778114329eee
	.xword	0xea1414aa6ec71474
	.xword	0x26fc7e8ce88de6ae
	.xword	0x1eb3be77b2f10fcd
	.xword	0x4354c3b2acebe644
	.xword	0x38f19671ac52e62f
	.xword	0x521359d1fc7dfbbe
	.xword	0x36299a54e1c7a7d7
	.xword	0x020101008ede3f1c
	.xword	0x4f3391a2231e5990
	.xword	0x2b37eebe2ac16c12
	.xword	0x5d1317e785dbb1ee
	.xword	0x8b1b7feaead5fb54
	.xword	0xe8043edcb9f5f2f5
	.xword	0x597ebc37d5db5eae
	.xword	0x050bb437fa184085
	.xword	0xcff7173526d8d7cc
	.xword	0xa83029be0b5e22e4
	.xword	0xa4108a5bacfb98c4
	.xword	0x79ed715950e7cff0
	.xword	0xf221445032413ac9
	.xword	0xadf021c53dcbb021
	.xword	0x4ac35120b831fcb5
	.xword	0xae0b6e71346f78e3
	.xword	0x4e2ad38f0148e806
	.xword	0x1e5fa18de348a4e5
	.xword	0xb0f591c9aecab565
	.xword	0x4a3e2021be5d050e
	.xword	0xe4ce9e6cc9ea6206
	.xword	0x899bcb98e5e83a63
	.xword	0x2bbf30e8a61af4f7
	.xword	0x88c32779317894fa
	.xword	0xadfbaaa157e38e25
	.xword	0xe6dabe1c4d1b16ba
	.xword	0x2fd0da42285500da
	.xword	0x2093f392b9f77d35
	.xword	0xa6f6a96f580c5f25
	.xword	0x8cd2a9c90ca39344
	.xword	0x0f54134d6786568e
	.xword	0xc912c371b61470cb
	.xword	0xe451a854a4a4de47
	.xword	0xd33e92b3ddedd000
	.xword	0xd5c88f45c0456f00
	.xword	0x03810d9c4ac2c23f
	.xword	0x5e89efb38f211c81
	.xword	0x3807ebebceaae354
	.xword	0x355073e1e5c5de8b
	.xword	0x943f49b12de4a5ce
	.xword	0xa2ad14438b329db3
	.xword	0xe18296715ba64265



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
	.xword	0xff61a59c83a61e53
	.xword	0x001ce92848e71b3d
	.xword	0x796aca3ccab8cd00
	.xword	0xb264127d4a461528
	.xword	0x6a0ed08ce2c34904
	.xword	0xdf8c8b6bc35c99fb
	.xword	0xbbac13b58a9eab85
	.xword	0x007df30f92b1d834
	.xword	0x3a0e7dee59728b4a
	.xword	0xbf6e42720bb63588
	.xword	0x79f2e2904cb54868
	.xword	0xadfcb7fb29861e7c
	.xword	0x191213dceae901bb
	.xword	0x7c2beb8e2dc85a18
	.xword	0x8ef7b00056ea4b1f
	.xword	0x03ee8062913a610f
	.xword	0x05dfa220cc351b3c
	.xword	0x97ad01a2dad2aed5
	.xword	0xc4e373e8897c7d2b
	.xword	0xb4a70435943e5d4d
	.xword	0x4e1f1cae3604a540
	.xword	0x7e3b67e071898476
	.xword	0x05096c25e4b655e6
	.xword	0x83a2488b7576bc31
	.xword	0x030b4e91b465b22a
	.xword	0x510e7b754e211e78
	.xword	0xcccee0cb475c0c2d
	.xword	0x3fd63e59694b090e
	.xword	0x4e2f835476ddf093
	.xword	0x423a7fea65fab3f6
	.xword	0xa0770a9d9622eec5
	.xword	0x53097327e742879c
	.xword	0x7dc8452a01044a31
	.xword	0x014de19d2ca9e97d
	.xword	0x7eb33393cc66ae72
	.xword	0xbb375497da726d0d
	.xword	0x3618a7c5a33d6e03
	.xword	0xbd3dc9ed462abd30
	.xword	0x043b4450c50f363a
	.xword	0x05d0e27c96256ddd
	.xword	0x5cd9cd03702a4271
	.xword	0x660682eb5109b633
	.xword	0x4625376be031df11
	.xword	0x259502cf8af7db78
	.xword	0x9602f4e037b69681
	.xword	0x91540235d8e6d116
	.xword	0x4eabef45d42a8b71
	.xword	0x66042b86a0bd7500
	.xword	0x75258b75394f7439
	.xword	0x967fd440ddd25a48
	.xword	0x87239139c5030a14
	.xword	0xb9f53a416660e82f
	.xword	0x51139ea5fe6c2a2c
	.xword	0x5fddd673c7873fda
	.xword	0xa3c50a7f8ada944a
	.xword	0xcb35a0d43d4383e9
	.xword	0xa382a4f472fcb0b0
	.xword	0x50da0fd37ab77ee3
	.xword	0x5e47dbe3d119ef81
	.xword	0x47950db7b03d1a5f
	.xword	0x66abf418edfa2e5b
	.xword	0xdd572cc4bf52c1d1
	.xword	0xfebd873bfa4ab595
	.xword	0xc478c7769a8548fd
	.xword	0xb8015d5f506028a0
	.xword	0x93538aa74c1e9648
	.xword	0xf7750f70314a5ec9
	.xword	0xa918ce2a47b343aa
	.xword	0xa70f00c6731d6490
	.xword	0x3d40dd2262c0137a
	.xword	0x7d7eb18dc6dafe55
	.xword	0x619730b32ba107cf
	.xword	0x007b2945384a6181
	.xword	0x79cd067acf65c4a4
	.xword	0x6f4b670c47b0b07b
	.xword	0x16d79d496cdff6e8
	.xword	0xe867a356f7910641
	.xword	0x3ccb542095e3fda7
	.xword	0x7451e2e940c3589b
	.xword	0xe99fe2c5b8fe6240
	.xword	0x4947123e2c538b3a
	.xword	0x84cea8bb34ffd76e
	.xword	0x1ef519db4aaed825
	.xword	0x52449570a3e9fb4a
	.xword	0x44ac65284760273a
	.xword	0xbab5c68e889fc95b
	.xword	0xcb63ea2b9d36290a
	.xword	0x8d6c54110dc9aeba
	.xword	0x2c361c69729681f6
	.xword	0x3f41a53fafc066aa
	.xword	0x3b5550f7228e6be2
	.xword	0x939e6b0a93e547c1
	.xword	0x0fdbe0860307de9e
	.xword	0x17848ca3ada6203a
	.xword	0xe3976d9f8b543bf5
	.xword	0x608cdb08364f9977
	.xword	0xe5f86987eeaad943
	.xword	0x801b464b5412b93e
	.xword	0x526e9ef695377be0
	.xword	0x85d057c4cbd70bf0
	.xword	0xf1e235d9bd271248
	.xword	0x76ebfe177d87db96
	.xword	0x3cb562722da8e86c
	.xword	0x2a2da20b3954613b
	.xword	0x9165d2637017ca20
	.xword	0x1a0632444235fc8e
	.xword	0x2e4ed1ee1242bab0
	.xword	0x35a04ac23e9ce7d5
	.xword	0xa62d069890a2efee
	.xword	0xbf2cc73adfdabe23
	.xword	0x00e0c8fe6a548549
	.xword	0x92e34a90e66820cf
	.xword	0xccc4d086311328f5
	.xword	0x7b0587cbf5622199
	.xword	0x05ea6b784c3ce301
	.xword	0x601b25bce0bba708
	.xword	0xa74cbf9670670079
	.xword	0xbfec0d4e1ef19002
	.xword	0x48f01fb5b3dc37f1
	.xword	0x9f744a594ea20869
	.xword	0xe4e8b5d699ce904e
	.xword	0xca0caf60d4d16a3b
	.xword	0xf8d96d4f9b486a20
	.xword	0xcda2bd7f189b7d1f
	.xword	0x07a39c891d9a2d74
	.xword	0x120456b8a7308054
	.xword	0x3a22481b05f8d901
	.xword	0x04a62458673848cd
	.xword	0x2cde69f3bb7289f4
	.xword	0x262e21c14ce20aa6
	.xword	0x72fbbf6b3d30e46d
	.xword	0x1fa820072cfa0a37
	.xword	0xda58ced84265bd25
	.xword	0x936ae21416f15a95
	.xword	0x0d15fbb195d84c8f
	.xword	0x00cdb785098dba01
	.xword	0xe704056c895051e3
	.xword	0x1209bac32b727725
	.xword	0x5ac50af68039cdd4
	.xword	0xf9e52fd86bd0ebee
	.xword	0x5f4924cc9e6a7000
	.xword	0xe6f70eb39699d8f3
	.xword	0x6e14deee91480fa5
	.xword	0x3363f75ee2f8ea4e
	.xword	0x6bf3d8c47ccbe5ad
	.xword	0x7c9d26d456ed96e0
	.xword	0x725b82726eac405b
	.xword	0x0fcfd2352f4dbcdd
	.xword	0x34d6e4a9edc74549
	.xword	0x142b722ce8e95ba9
	.xword	0xcc5d0c552e44050f
	.xword	0xad4d5f5d4ee42220
	.xword	0x20a5c9abba270fff
	.xword	0x918f43d86d02ae63
	.xword	0xef0fc45e18cc220f
	.xword	0xbbb81a65ae77aa18
	.xword	0xee9899422425b15f
	.xword	0x1f091c8b9d1d28d7
	.xword	0x1811bdf4d4bea081
	.xword	0x5b887766cd858591
	.xword	0x453f23979c3a4a05
	.xword	0xca8bae71eee66f59
	.xword	0xe93966e1ed8767e6
	.xword	0x5700eb0f76a85f46
	.xword	0xac7ebc942dead41e
	.xword	0xcd6499bdd0620498
	.xword	0xac8a9eab39825864
	.xword	0x109986264b09aa02
	.xword	0xd74b577ed967a594
	.xword	0xa00b34bf52ed0cf1
	.xword	0x0e9bfae619662086
	.xword	0xf5f9279b5287d851
	.xword	0xebae97adb52a4c60
	.xword	0x6fb795e00ca966d0
	.xword	0xfc8c5b244f3bc165
	.xword	0x2c54727d3101b985
	.xword	0x7d55c866610afcc5
	.xword	0xfa85d61867e744bf
	.xword	0x258955d1ca73eb68
	.xword	0xe6d877d9ace85437
	.xword	0x3b6b75b538ffb3e7
	.xword	0xdc6b9cc21da61196
	.xword	0x4be57baece8aa63c
	.xword	0x395d59d250119c7d
	.xword	0xedc0effa352eeaab
	.xword	0xbaa1b15ec65537c4
	.xword	0xc2f3454650fc2316
	.xword	0xdcdf43c799c008c5
	.xword	0xa39cb81fbf9fceee
	.xword	0x6d642aee28d802a3
	.xword	0x195a06b2cef896b4
	.xword	0x3091cf5854234031
	.xword	0xf8bd20602dfb769c
	.xword	0x72b308d61170b5e2
	.xword	0xcbc97ee011b35898
	.xword	0x3365ea1d0542a6e9
	.xword	0x09edb69b1b5a208a
	.xword	0x592bb1cddf644621
	.xword	0xdbd35130f3942224
	.xword	0xfdcca68be60ae78f
	.xword	0x94c1db2d77a5bbbd
	.xword	0x13c884a5bf0edb64
	.xword	0x2721d0b142532d70
	.xword	0x12ecc4b574569e9c
	.xword	0xda9b77bcffd2ea16
	.xword	0xf5e3c8000bf81a34
	.xword	0xe202fa5a811414ed
	.xword	0xf24097283dd6d3c9
	.xword	0x32570853c2022cd5
	.xword	0x0efb4060851cd691
	.xword	0x96fae7950c48391d
	.xword	0xf2ba7884ced04289
	.xword	0x5329ebdedc25c8cc
	.xword	0x81b71117358a177a
	.xword	0x13881b5b34f57e8f
	.xword	0x541379f55a8325f7
	.xword	0x5c4f17ea9fb312e7
	.xword	0xf3577cae39c4cc46
	.xword	0x4cf72eaa7e3cea93
	.xword	0x21e4ede30e0fddc2
	.xword	0xc2491addcc545a44
	.xword	0x213200673f851df1
	.xword	0xceda3c48ae570554
	.xword	0x33bdfa1a61231fbc
	.xword	0x42da078732338c41
	.xword	0xe193ecbb8745096f
	.xword	0x76082bd0de8fe1d1
	.xword	0x487ac7d56d7a6613
	.xword	0x5395c68697b72261
	.xword	0x6c3bf30ccc1c22b8
	.xword	0x73a94a23d26ea184
	.xword	0xce28d6ce0811526f
	.xword	0x1ebb601ac6624936
	.xword	0x469362f292e6115d
	.xword	0x9d4f18366a782ccf
	.xword	0x6897f67e413d14d8
	.xword	0x079004a1fcf4091c
	.xword	0x5cd7da0f8ad24049
	.xword	0xe80252c15cb233e5
	.xword	0xa103ee99a20df588
	.xword	0xbf5a1ab79a319ca6
	.xword	0xeba896115cbc6c8b
	.xword	0xda804865553cf7e6
	.xword	0x0cd51653cb75b847
	.xword	0x434938328a850bd7
	.xword	0x6c0f12e0969075e9
	.xword	0x71ff07ef77c47cbf
	.xword	0x45987d0655714366
	.xword	0xb5beac29d3627468
	.xword	0x1a8ac1243ac54111
	.xword	0xe6c294d52d2a200b
	.xword	0x82bc79db3f70006c
	.xword	0x52049e0e9a283c60
	.xword	0xed88ed73e691df8a
	.xword	0xbb94415bebd6d86c
	.xword	0x44c9dda6299f5345



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
	.xword	0xb96108cc91e55dda
	.xword	0xe4a4d614771afc59
	.xword	0xb30ead68729a90cf
	.xword	0x3227484d62bef165
	.xword	0xa04cb762e5deac3c
	.xword	0x935ee1308b0f0882
	.xword	0xf10b5f70d9c845d6
	.xword	0x6ed31f1122b42a14
	.xword	0xe843ee782808db66
	.xword	0xcbf06f8b0bcae392
	.xword	0x8ebb61225accac83
	.xword	0x92b3808a871addd8
	.xword	0x3133f26c08d76a12
	.xword	0xf3ebe9e9f5157c26
	.xword	0x2bbe21e0ffb7a35c
	.xword	0x60001907887e3d65
	.xword	0xb470ef56a0107043
	.xword	0x9c3c4cb7af31a385
	.xword	0x82b2d716ddca0881
	.xword	0x39ba9a340a43beed
	.xword	0x69fdd4da7f85e556
	.xword	0xde10429bb2fa8344
	.xword	0x74881f02e624d249
	.xword	0x8676cdce1f189766
	.xword	0x3aa2a639a01a8d7c
	.xword	0x77f7f01e4754364e
	.xword	0xbb69a44c19eac142
	.xword	0x047a5561203b80ef
	.xword	0x9e5af0ce49888ddb
	.xword	0x34d8a90ddc806fbc
	.xword	0xf338aadb3c26112d
	.xword	0xda8aa60e9cc6fb32
	.xword	0xe6f8e7ddf6750572
	.xword	0xef71bd5632d1fae0
	.xword	0x3f36cd8b589dc8e4
	.xword	0xdb3e5d460df206cc
	.xword	0xb02a109d6df11017
	.xword	0xc5d90d29afbf0271
	.xword	0xf563578e1bf81e2f
	.xword	0x4ab8f79d24f76972
	.xword	0x608ae562215e0470
	.xword	0x40dc713aed756599
	.xword	0x28eeed459f06cccd
	.xword	0x77d49a90ed580b9c
	.xword	0x74dfac0a355ae44f
	.xword	0xa9770bdfe2c20c11
	.xword	0x4202e77581d7e36f
	.xword	0x63b40c4ad7712263
	.xword	0xae020bd1b4faa138
	.xword	0x6ed4101d8a7080b6
	.xword	0x7aa44631b5b131a6
	.xword	0x9affe654e2af6550
	.xword	0xf763f42f6ed5641d
	.xword	0xca0a8e396ae0a36d
	.xword	0x8e74894afc4cfde8
	.xword	0x4e8a71f52f30ae65
	.xword	0x8e6150d2b92764d5
	.xword	0x3c601efeea2eec20
	.xword	0x154fa9503f870e26
	.xword	0xe5b093f4037e72b4
	.xword	0x8b88be13eb375e58
	.xword	0x527d151b08a3dce6
	.xword	0x29ecfa157224882e
	.xword	0x4569ffc946ddf464
	.xword	0xa3d37916f0d8c271
	.xword	0x38573329f8f7b64d
	.xword	0xdb52b7773af920a7
	.xword	0x4e2bd6e80c8f3377
	.xword	0xeb6ab8fa93f0bf1c
	.xword	0x7d8ee1b5189a7c52
	.xword	0xb52c64a33f2acc99
	.xword	0x5d6d39ca9641a8ef
	.xword	0x60f534aa6384eb25
	.xword	0xbfa28d62b38988c6
	.xword	0x011316a4ccf69886
	.xword	0x2ee175e3bc4c17cb
	.xword	0x25781c5ac7c06493
	.xword	0x177510f98326ae45
	.xword	0xd91a22b0a50d7685
	.xword	0xec353041d2d8b903
	.xword	0xd2b60b33ff7235f7
	.xword	0x30edae8aeeb259fa
	.xword	0x10db13a5ddb6d0f6
	.xword	0xb47638e2bc83fb11
	.xword	0xbe18cc19fba5de10
	.xword	0x48a512887e4b8c25
	.xword	0xd7725d13a07b56e0
	.xword	0x14fdd971047a4541
	.xword	0xcfcf3e422d61acc8
	.xword	0x2364c159e6a0451d
	.xword	0x3226fafbdffe4987
	.xword	0xa93d8cb6a55fafcb
	.xword	0xadc7278ad2dafa68
	.xword	0xe77a48d8a434cc70
	.xword	0x5ed01c9a14311da2
	.xword	0xc6a3d620754db4c1
	.xword	0x70c15abbe161348a
	.xword	0x25f50e95e356f862
	.xword	0x93d46bc83b6796ec
	.xword	0xe63ed3949df15957
	.xword	0xe3b34c1c371e573c
	.xword	0x96ef520924048a64
	.xword	0xf3c774095039c11b
	.xword	0x0a30072130728cab
	.xword	0x3ebac5c2f4eb5d7d
	.xword	0xeadfbf1dd7f1ed68
	.xword	0x3c0e302e8e8c26cc
	.xword	0x4068f4fdc629b67c
	.xword	0x8023d1cfe476e7c3
	.xword	0x60c10c197003d716
	.xword	0xf1f6aaf960a52c39
	.xword	0x46085285d1d7971c
	.xword	0x5f04bacb68454509
	.xword	0xa4cffa920df21ba6
	.xword	0x7ec7ea68ae7a2c00
	.xword	0x0e28bec0f7bab0fd
	.xword	0x34566da76fc929b8
	.xword	0xa853db62125f6fc6
	.xword	0x940ad5bb544f3251
	.xword	0x73c97a8c6bdcfd5b
	.xword	0x437771bcaade86f4
	.xword	0x277aa4fdda51debd
	.xword	0x5566e036239f4e5a
	.xword	0x7601a2f06c465ff3
	.xword	0x5ba68fdb47d07bc1
	.xword	0x0cdf2bf921a5d884
	.xword	0x27575fb317b54760
	.xword	0x3d567a076796b21c
	.xword	0x452b53977b615f2c
	.xword	0x4187d0b083639476
	.xword	0xd3c12bfba2a46af1
	.xword	0xfae2e3967639f519
	.xword	0x2fef1a8303fba17f
	.xword	0xf9d2c1454119eb93
	.xword	0x2cf33254fa404285
	.xword	0x768bd6f070802b47
	.xword	0x3ee61bb86a09172f
	.xword	0x69f017e350333302
	.xword	0xcaafc35c52e66026
	.xword	0x85720eaf09b818e5
	.xword	0x8ce8de764a29c752
	.xword	0x0eec89480d2f016f
	.xword	0xc82ef13d8112c0d1
	.xword	0xdef2c1e0b0503429
	.xword	0xbb7df5bd98482c7f
	.xword	0xd719544846310dfe
	.xword	0xcdd9a65838aa20f8
	.xword	0xaf659d2d41340a73
	.xword	0x08285dc933d96c03
	.xword	0x466f0c6c09bd4f2f
	.xword	0x75e22c3aa0ae87da
	.xword	0xccf49be7367b583f
	.xword	0x159e5203895e1e38
	.xword	0x60e4368b064ef16d
	.xword	0x3551e93120b1974e
	.xword	0x632564429e098a2a
	.xword	0x3053b84c03d0b05b
	.xword	0xf5f4a170391bf36f
	.xword	0x8b9070d3e6f20fd7
	.xword	0x40c9b0b8fdc3d98a
	.xword	0xb055ff4e52c2dbea
	.xword	0x3ad96dff6bf42abb
	.xword	0xb316d670f6674ad5
	.xword	0x7199efa78d093dec
	.xword	0xb0f5c1a9691dc84d
	.xword	0xe42470485aa26a92
	.xword	0x21e0f1297707c75d
	.xword	0xd7dc66a239675afd
	.xword	0x69f8929bdb3a6a41
	.xword	0x819a0e6b370e7ac1
	.xword	0xa7b3925e28a6bc64
	.xword	0xf9153ceaf387ba26
	.xword	0x5b563da451c5069c
	.xword	0xc46317f7677d0139
	.xword	0x8cfaaca59174d323
	.xword	0xed0aeb41ab38c884
	.xword	0xa5697a2cb3b592ba
	.xword	0x9476c6d3eaf6fd73
	.xword	0xaed50616845e2e3a
	.xword	0x3ab5977901f82c85
	.xword	0x573006eb7ebb50fa
	.xword	0x513ffc6a9ab58128
	.xword	0x72f726914c7789c3
	.xword	0x99319996b158813d
	.xword	0x40c1908b43986923
	.xword	0xa4658939289f0c3c
	.xword	0xd48a975fb89317ae
	.xword	0xd4da839346046004
	.xword	0x7cc101d36eb75834
	.xword	0xf3c1466735c8ad42
	.xword	0x7cca3181e72c53bc
	.xword	0xff845164572fc75b
	.xword	0xb887960a8d74064e
	.xword	0xc78af33fe610e282
	.xword	0x4947c75a3362370b
	.xword	0xf0308905da837c0a
	.xword	0x6937fa01fa65b30a
	.xword	0xf8716d9824b5c68b
	.xword	0xd7b5689b1618a1ff
	.xword	0xda1f747f61304c20
	.xword	0x396928e04c008fbf
	.xword	0x8dfb7dddb391299e
	.xword	0x94cc4c10341bbc61
	.xword	0x557f889e72c66f6b
	.xword	0x067c12aa402892a5
	.xword	0x6c308a6a1856e916
	.xword	0xd6ef70a5e0b60832
	.xword	0x7a57f8b710196161
	.xword	0x511212f728a7a290
	.xword	0xcea279fd2a73c1c6
	.xword	0x9698ae0d2d2a5d1f
	.xword	0x021be447ab361bca
	.xword	0x03e42ae7c1616290
	.xword	0xd862b6e36c10be9b
	.xword	0x3dd31b38e719f7ea
	.xword	0xb6ad46814a5ede04
	.xword	0xdbcce2273db79530
	.xword	0xe5f412c77ee12130
	.xword	0x31be3bce38bd957f
	.xword	0x2b3a902758321a56
	.xword	0xff7d8a14365fb4cb
	.xword	0xab37eda8556feb5b
	.xword	0xe37e81ec6315279f
	.xword	0x99530ef0fc126d8e
	.xword	0x5db7a0eb2572a3e1
	.xword	0xd25e26b32ad6a95b
	.xword	0x4a2a0b067c4f582f
	.xword	0x35234fbb6dd614f7
	.xword	0xa6c3c9479063bda4
	.xword	0xb08d7d198a1e4f1a
	.xword	0x8a142f38399d64ae
	.xword	0x4dceeabdf2554b8f
	.xword	0xb1e7fe64d6bf8105
	.xword	0x0583c4f97f7c8690
	.xword	0x013f9972babff2e7
	.xword	0xe3de68ff09506e2f
	.xword	0xb6d8ea10ed52c6ce
	.xword	0x31f3c1b4cb0ac3c1
	.xword	0xf1eb4d9b4e81084a
	.xword	0xe783d0cad398b34f
	.xword	0xf64e9bd2409f6ecb
	.xword	0xbb6c989eed26dd24
	.xword	0xc7ff875fb5042947
	.xword	0xcb5ccefbb60f2fae
	.xword	0x273b0e453938fdac
	.xword	0xbb0a96adb2f71c34
	.xword	0xeb08772a9ad871a6
	.xword	0x9ad66943f267287d
	.xword	0xfbb994c06d8a99c6
	.xword	0x1ca60be245e4c98c
	.xword	0x0dc709ffcd35fe50
	.xword	0xaf602e784e0ec069
	.xword	0x3f7580e61b3add88
	.xword	0xc6fbf06007c21f32
	.xword	0x1fa869220f2785e8
	.xword	0xfd95f79b78cf7bf9



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
	.xword	0x124a8831ab64d225
	.xword	0x610ceb04b68aa60c
	.xword	0x8924e8b59c04f5bb
	.xword	0x08667beab23f322b
	.xword	0x024a47543fe22059
	.xword	0xa1ea9b971efbabf4
	.xword	0x6e240d1b75535d6a
	.xword	0x8fcc365bc9b47d1f
	.xword	0xf0e6aa283aae61b2
	.xword	0x3a829026696ba2ae
	.xword	0xe51d01718f12991e
	.xword	0x40cc4019fe4bad79
	.xword	0x97295ab9ff3780d8
	.xword	0x2ae916d82b875db5
	.xword	0xc3162dceaec303f4
	.xword	0xe4af97a2baa7a0fa
	.xword	0x68ed54712020bbab
	.xword	0x734b5839cb0a3f72
	.xword	0x0a06e26c1638fb1a
	.xword	0x4705c58412aef367
	.xword	0x5fda4f4c63dd0b79
	.xword	0x4f43ae23b47de822
	.xword	0x581580600a9cd9b5
	.xword	0xe477ff7d43c277ea
	.xword	0x1b7a9ad4f59a508c
	.xword	0x3a4d007bc52898b7
	.xword	0x6db9e6bd589c0976
	.xword	0x5d1644ce92d6a0a5
	.xword	0x4eb9d437a0e511fe
	.xword	0x8156e38e8665625b
	.xword	0xc36ba7633bd8555a
	.xword	0xb7d53a215430a277
	.xword	0x96160ef8932c0075
	.xword	0xe0a78b39a5bf7267
	.xword	0x974c057ae0ee2809
	.xword	0x722864b2f3c49751
	.xword	0x1eb2dd0ba31120ca
	.xword	0x7823e2804768466f
	.xword	0x637dddd6d1b85ef0
	.xword	0xc16496b3b1816099
	.xword	0xae33291455356b28
	.xword	0x157e3534a44c2732
	.xword	0x0e558a843efa85c3
	.xword	0xc887218fe125dc11
	.xword	0xdb7570646c7c6812
	.xword	0xdcc3662419233d7b
	.xword	0x5295f6d230c06c3b
	.xword	0x1555359b724068db
	.xword	0xfbd8973c2910cc2e
	.xword	0xb88a86aa560f7896
	.xword	0x462f7ebae4e206be
	.xword	0xf333025bfe28d308
	.xword	0x90a071296479e1b7
	.xword	0x107e3f1f1877f84f
	.xword	0x2f000fce982bcbb8
	.xword	0xdaf6994c03700516
	.xword	0xcd3e7533bd18ee14
	.xword	0x3d0b43e0b2ad9f38
	.xword	0x8e759733ace67763
	.xword	0x79eed8f33d36d60f
	.xword	0x805a3c99cf8ad518
	.xword	0x50f4131be6ea04c4
	.xword	0x2d4c459fdb4a9061
	.xword	0x3fe1eae79678cdf1
	.xword	0x8b4e64ce8655d1c9
	.xword	0x7f725b0440f83f63
	.xword	0xe946d3bdc0ea3fd0
	.xword	0x28988dbfb3cde8d7
	.xword	0x1265339a223c1670
	.xword	0x5832ade27ece9883
	.xword	0x03597c4c3f9d176b
	.xword	0xe96f7060eb8e1955
	.xword	0x304a9ddc35732828
	.xword	0x7792f9bd83ecf761
	.xword	0x2e8bdec5b81bb986
	.xword	0x5bdad3c48e1519a8
	.xword	0x616e7a2a0fa5ea34
	.xword	0x5de391ff3034a7ce
	.xword	0x7604d380d62229b2
	.xword	0x1f0fe0064ad159ec
	.xword	0x8cae3401997a845c
	.xword	0x3e4ccbe0b4db57ca
	.xword	0xa215f056d8cab306
	.xword	0xc421467fcc33a084
	.xword	0x006c5407c610f17f
	.xword	0x2087fcb1886e9376
	.xword	0xda98d2d9a0b5c4fb
	.xword	0xa5fb5c3d734be909
	.xword	0x4633bd2a85da1dc4
	.xword	0xdc3c92ad4b811f78
	.xword	0xcb67acd57177354b
	.xword	0x10cdf5dff8fd8c41
	.xword	0xa370c27d51a8f797
	.xword	0xb2cce20c046f41da
	.xword	0xb5dc5f4320363717
	.xword	0x155ca0046bcc63e3
	.xword	0x449e7dc5fb9b91f6
	.xword	0x3949ee88438b09e5
	.xword	0x369ac92126d6bf82
	.xword	0x245938f18b220cb2
	.xword	0x5f1375547f57e31e
	.xword	0x084568a012e3a356
	.xword	0xffa69a7efaa87e30
	.xword	0xd4c1589b677c2e30
	.xword	0x2f9603a91fc5b370
	.xword	0x69a2544155a9e050
	.xword	0xeb604122663312c8
	.xword	0x36aa783d509dc26d
	.xword	0x3681c1103d107f1b
	.xword	0x1601b4debdd99e04
	.xword	0xa4f9478d6c32d403
	.xword	0xdfbebcceee2a5226
	.xword	0x5268b58d4a022617
	.xword	0x6d27db1e96d21379
	.xword	0x346e34193533fc0a
	.xword	0x6e43619fead550af
	.xword	0x81eebf8e6f5aeab6
	.xword	0xe2469ccc0ebe817d
	.xword	0x6447becef0dc6eae
	.xword	0xda3968ccfbe19c3e
	.xword	0x79c578b2fbc0eaa7
	.xword	0x2fd39e832bd3d125
	.xword	0xf351135c721bfade
	.xword	0x7eb7976f0bfa4577
	.xword	0x8069fea5ced4579a
	.xword	0xb0c590b7ee7cebc0
	.xword	0xad796af53122acb7
	.xword	0xb3b1ae55c1db2bc4
	.xword	0xc79971ffa6284562
	.xword	0x939ad9b2833b3bf8
	.xword	0x1694fb61fc08d319
	.xword	0xe8651fae552e62d3
	.xword	0xa39f354d2c4056ce
	.xword	0x4228c75587a485b8
	.xword	0x61ce915e1241c7b2
	.xword	0x2ed82c95433e684e
	.xword	0xc1aa93e42125ae12
	.xword	0x6febb77289df24e5
	.xword	0xdc303b7c200dbee4
	.xword	0x4047e6572295cde0
	.xword	0xc7de84cd1f0e3e78
	.xword	0x021ee541a831f4d2
	.xword	0x5dd6977c157dc902
	.xword	0xb332e857b8630046
	.xword	0xfe51e28532d50b0b
	.xword	0xbb58f0297ca8ff0f
	.xword	0x32b7ac5f7472122b
	.xword	0x7d93654c426b534d
	.xword	0xf5ab3318eb15310f
	.xword	0xebae3af71c63ff9e
	.xword	0x33d1c4a53c6b1434
	.xword	0xc2e8b150741681df
	.xword	0x2d222bcedda56e3d
	.xword	0x16216863c039bb51
	.xword	0x8ca626dee3a4d3d8
	.xword	0x7c8e1d872dc50898
	.xword	0x49a873b4f68b0912
	.xword	0xfd85f38b9eb5b9c9
	.xword	0x5a79810cf181d782
	.xword	0xdb3041e7bf9fe117
	.xword	0xf05c825a2a8d2fdd
	.xword	0xb51aacc8c525efc1
	.xword	0x43c2caa9ea0523fa
	.xword	0xf03e0785e89ca2dd
	.xword	0x4cb8ac080c1f93f7
	.xword	0x6c3a8dcf5ae66122
	.xword	0x7982fd7be822da3f
	.xword	0x87596c6ae1115b64
	.xword	0x0b276407f1213721
	.xword	0xff4a3c0f4855707b
	.xword	0x1a7e4be75e4dfe34
	.xword	0x930cfc4865ea45a5
	.xword	0xbb89010b5afbd0ac
	.xword	0xa4a57cec9b45b2f7
	.xword	0xfa3c0aef7f34e33e
	.xword	0x353c693d894e7acc
	.xword	0xc07b828a37cf065c
	.xword	0x9618e31cb9dedfea
	.xword	0x34b54237425c4c23
	.xword	0x89be1354d5d746ba
	.xword	0xc9a9848969f006b4
	.xword	0x9cd0d084d7b4ce81
	.xword	0x99659dc72c16e341
	.xword	0x58d01e24cf53f817
	.xword	0x0c75277eb44356a2
	.xword	0xd6f3aefb80aeb10f
	.xword	0x3f16a36fb01aa117
	.xword	0xab64ce4cd038e015
	.xword	0xd50320231c8ed7b6
	.xword	0xcc45359fd0ea07fe
	.xword	0x47b942ac4994a17a
	.xword	0x25242d015d953aff
	.xword	0x91bf9d1091493c81
	.xword	0x0f2bc63f4ff24600
	.xword	0x68795995ea2975cf
	.xword	0x36a3cd4444359807
	.xword	0xb11180c99db777da
	.xword	0xf8ed31ec4c7614c9
	.xword	0x27fc102c89e371e1
	.xword	0x3af173f429efe92f
	.xword	0xa44c14917e439d3b
	.xword	0x8308109a5e8e703c
	.xword	0xc0928578974d01ff
	.xword	0x4e13d37edace747e
	.xword	0x8dcff500d10ce57c
	.xword	0x62e2f58f2ad3083c
	.xword	0x2b72008e9dfa0ab6
	.xword	0x841352c700f59e66
	.xword	0xfa63fe9e91222359
	.xword	0x251b68d6fab9a014
	.xword	0x392d114577af92cc
	.xword	0xa2fdd8670d8fa3c0
	.xword	0xc9f3f11d552830a0
	.xword	0x3c9bdccd7395136a
	.xword	0x41ebbc5abae48831
	.xword	0x641c45871b1868f9
	.xword	0x3f44bd8d99a3b784
	.xword	0x672ad2690541c0a8
	.xword	0xf7084a9f0a66f3e0
	.xword	0x8f631147f05ca6e5
	.xword	0x638d4baebc5081fb
	.xword	0xf5ee9f1ee515ded2
	.xword	0xe2c0830d07893569
	.xword	0x27c2ce43b1cd75b1
	.xword	0xe907af7362e2f83c
	.xword	0x9bc4811506dc7c37
	.xword	0x9b87887c94c7ee2d
	.xword	0xfc81cba616903d75
	.xword	0xa932754d92aa4bc8
	.xword	0x211a58c85a6877c5
	.xword	0x857a07132b4f8d68
	.xword	0x8fc6a08ed7ce5596
	.xword	0xc1d021505c2e7cb4
	.xword	0x094155a4fe877abd
	.xword	0x8202bf18fe625ec3
	.xword	0x51d8fcd6df56eff1
	.xword	0xdd1e35ae694029c4
	.xword	0x6017f863d565d4e7
	.xword	0xeba01e960501d1ab
	.xword	0x9fa9d811172aefa2
	.xword	0x60a4ed5425a3612d
	.xword	0xa1cdd6ca598ed97f
	.xword	0x9ef5cf30ae204d67
	.xword	0xd2195f522821ff40
	.xword	0x3cbd4cd8236bb5df
	.xword	0x526e8859f1f454a9
	.xword	0x54ed621eb80e5025
	.xword	0x2f203780c67f17db
	.xword	0x54c3d6f97ea2c238
	.xword	0xc1dcd1b4683570f2
	.xword	0x9b16e875f743fa0b
	.xword	0x6ca4778fa0d94ded
	.xword	0x0c9f640283964c06
	.xword	0xea0b606cc2de8a10
	.xword	0xa1dce8a8cb1e50df
	.xword	0x29236e70337cac47



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
	.xword	0x7fd2574332f347c4
	.xword	0xabe6fa3285bf5259
	.xword	0x90e2c24a5a868c36
	.xword	0xa5f3bb45846a2fd2
	.xword	0x96aec2f3c4fa7001
	.xword	0x679a2f518b3c31b2
	.xword	0xb325b063109db14c
	.xword	0x91c4a5e73e8ff620
	.xword	0x15ff94878acc1241
	.xword	0xaad69509c85283a0
	.xword	0x6740572c27aacbe9
	.xword	0x0c129544b2d49028
	.xword	0x676622816595c4e3
	.xword	0xc6d96c56b7e8a6a1
	.xword	0x66893fef814111f3
	.xword	0x49d5cba2f7f1331e
	.xword	0x410306fb092aeae7
	.xword	0x904be35b05c64d95
	.xword	0xb3b1ea46a369027c
	.xword	0x3cce3c189939a7e8
	.xword	0x9d25399b6a1de71d
	.xword	0x947f021a3f776e3e
	.xword	0x42c7dfec42326b05
	.xword	0xbe045f8e15be4066
	.xword	0xe187da80b400b02b
	.xword	0x2ec7b69ee258d380
	.xword	0x67d895dfecc7092a
	.xword	0x1b9e97973fb59501
	.xword	0x60b4fd4085529006
	.xword	0x42345e677fa7ed28
	.xword	0xf3969bd7128764e3
	.xword	0x8fff407f220edeb5
	.xword	0xd2ed5f5af96c6450
	.xword	0xd5eca5ebd9f545b7
	.xword	0x957f3964cba9d591
	.xword	0x9202bf84c8c11a3c
	.xword	0x8aa076ae9f7caa7c
	.xword	0x9183d58891111f7e
	.xword	0x3a2b148401176382
	.xword	0xc5965a5794ac1cbb
	.xword	0x20fe2b799eb38357
	.xword	0x5d026ebabc587038
	.xword	0x90b1c177905cb1e7
	.xword	0x39ed876e1ece5cd2
	.xword	0x116dfa74cc33f50f
	.xword	0x518ca7f45850155f
	.xword	0xca160eabef1b8de0
	.xword	0xb14ad25f1452383f
	.xword	0x993f8a8557429d0b
	.xword	0xc91247de2319abe9
	.xword	0x1c63fcb2dc190b3a
	.xword	0xd114bf82fde5a6a9
	.xword	0x18ed73c6d4442826
	.xword	0x0a35f40949aa4544
	.xword	0x57322bc2d2dfe867
	.xword	0x11d45df9b922e111
	.xword	0x08dad0a1f8b0bdc1
	.xword	0xaa2f37063e283454
	.xword	0x15a72fc25e974c89
	.xword	0x896838ab373f0d70
	.xword	0x7271faac49300532
	.xword	0x47ffc59103a2407c
	.xword	0x6bc036f6aeca58c4
	.xword	0xb74ff8668bb8ab47
	.xword	0x09b0011d5f18de2d
	.xword	0xea69920d2a369158
	.xword	0x3b2b1b0683ee9b45
	.xword	0x8f827977471bd51e
	.xword	0xe89f1954b3abddca
	.xword	0x664da4d4e511da91
	.xword	0x272eb9f0690d81e4
	.xword	0x202eb89ed605d3d0
	.xword	0xd32076c121bde038
	.xword	0xb74a7cbb888886b2
	.xword	0x18587f25db885fee
	.xword	0xb41c266a52ce75be
	.xword	0x286a52b12a7f0aa0
	.xword	0xc8a11483d255e004
	.xword	0x5993cb35839a1cec
	.xword	0x540f574114f43b33
	.xword	0x3839713ec41f2773
	.xword	0xe18e236850d49da1
	.xword	0x2baa045f7eeb7a65
	.xword	0xa6e1b7111a3f3a45
	.xword	0xae9720830f2eb77f
	.xword	0x4623a8bae7341834
	.xword	0x58f7c5a9eca5bfb3
	.xword	0x341c50e57af230b9
	.xword	0x3a4c28795d333c3f
	.xword	0x56428abe59d8790a
	.xword	0x17e89a115a88cac2
	.xword	0xcc29a4e9bb747cab
	.xword	0x6dd8f642b666befc
	.xword	0x6eff3d151662bcc4
	.xword	0x5c0c8fc038d1d77c
	.xword	0x26ab130146fdb6be
	.xword	0x5329e49ef9a4c04e
	.xword	0x3b7316ad37a24611
	.xword	0xbc9f33f07902b0f7
	.xword	0x8f8eb82468c66661
	.xword	0xaaf0ff81e037df94
	.xword	0xae9de5a96e99564f
	.xword	0x4ea14a2573e7b10f
	.xword	0xbafdcd7602286d9d
	.xword	0x1890f05a384aa968
	.xword	0x28fdec2d4b9eb788
	.xword	0x3f3d2b8fe802c31e
	.xword	0xe9bea4ac9b18ef41
	.xword	0xcb1fc986c203ad63
	.xword	0x887e366685791844
	.xword	0xda09c2657428550b
	.xword	0xdac935f9fabae22c
	.xword	0x1bba0160a8e166cb
	.xword	0x04b23e630005d6f5
	.xword	0x7f2d7711d4b7b8aa
	.xword	0x69a43af58bde9c1f
	.xword	0x69a3caa7f9bdab24
	.xword	0x1a73fd7c31cf1a20
	.xword	0x8634040d240ef244
	.xword	0x20270c34467e2b0c
	.xword	0x10ebcccd71f75ebc
	.xword	0x6198bc2e6ff4e355
	.xword	0x5464a516566cf798
	.xword	0x78d6004da08989f1
	.xword	0x602fe3b795b47fed
	.xword	0x759b8665fcde637a
	.xword	0x245d6fd5196868e5
	.xword	0x0eb17ed9eb27ddda
	.xword	0x9b9fcef4676357a9
	.xword	0x4cd6b90ccfa8c5fe
	.xword	0x54939d43afb75162
	.xword	0xdde1c50a1d9d9ca9
	.xword	0x9ba90460e205a478
	.xword	0xb4de3c6662f84116
	.xword	0xb0a34e69a8e967eb
	.xword	0xf1c91339307e9853
	.xword	0xc5a5dbd93fe6d317
	.xword	0x87af18385f3369ee
	.xword	0x832f4f001a023be4
	.xword	0xf785d6a3d87d38b5
	.xword	0x34ee4e5b0ba969ab
	.xword	0xcad06968225f7c0a
	.xword	0x52c936fd95a55551
	.xword	0xa2164a6aa1989bf6
	.xword	0x15558bfdf9b21faa
	.xword	0x74016629214132f0
	.xword	0x80c30cc18e43535f
	.xword	0x79363bf1aceab584
	.xword	0x55bad7db8f8139a1
	.xword	0x41e4e1b4c8af7cf0
	.xword	0x39dd38f88d4e87ea
	.xword	0x85a712cb4d394643
	.xword	0x275d4b68f55a7f62
	.xword	0x0207ba068e572acf
	.xword	0xc56dae4799553821
	.xword	0x7f80e746675a740e
	.xword	0x33069513fc5cb21e
	.xword	0x1df6378a1b2d45b7
	.xword	0x7acf2498bcb9ce61
	.xword	0xd78c0c8942715cec
	.xword	0x4d2769eeef2180e2
	.xword	0x62d61f5aea7c9ecd
	.xword	0x42d0db822c6fcc10
	.xword	0x53db402065e60579
	.xword	0x28b4533d1acf8fc0
	.xword	0xc7110a057085ffc3
	.xword	0x32649b0ae1dceab0
	.xword	0x3d759249c2f11697
	.xword	0x04d1f933ef851d4a
	.xword	0xec35924ef3f03cce
	.xword	0xc48d97253cf22a6f
	.xword	0x7cfc3a38532bf404
	.xword	0x732b7e9e220362e6
	.xword	0xb6d7a19b9cbac47e
	.xword	0x1402dc2d8f637f86
	.xword	0x956f275ac0df82d4
	.xword	0x828c973629b7f162
	.xword	0x03cfed6eab015cb2
	.xword	0x6d40af17a6167571
	.xword	0xd3840e214387d86a
	.xword	0x034e1432b7e7c953
	.xword	0x2dacbd4d0a966b99
	.xword	0x05b32c254a9c67e5
	.xword	0x952cf25ffedc8b67
	.xword	0x6693daf61820120c
	.xword	0x7922472c1643484f
	.xword	0x9322670177aefec6
	.xword	0x97da2bd225696f88
	.xword	0x7872a0f14661adc9
	.xword	0x98d25eb434bc8820
	.xword	0x8193a209af9a6859
	.xword	0x1604c3b77171bdde
	.xword	0xd1787316e6f10cf4
	.xword	0x71a6a82b6e733c8c
	.xword	0xb92932b035a3a5a9
	.xword	0xa52dd45cde534d5b
	.xword	0xd22a90c2bb9457b9
	.xword	0x098a8b1e60c29381
	.xword	0x1c7e1dc38b79cc3c
	.xword	0xec66e5067da08afd
	.xword	0x8a3ca9ec41b77eec
	.xword	0x064edee0caad122b
	.xword	0xada8b82e3a0194f4
	.xword	0xa4ff9d55126590da
	.xword	0xf967cd9bd61122e5
	.xword	0x423e9b48191fd3bd
	.xword	0x5a014a94fedcd40d
	.xword	0x832105554143bb6d
	.xword	0x8621469b9be5c194
	.xword	0x62942d7dfaae9aa3
	.xword	0xa97e4d55948d7e34
	.xword	0x8fa5730e4961e99f
	.xword	0x5111162939a2657d
	.xword	0xee1dc796011ca52c
	.xword	0x1ed918e38cd3634e
	.xword	0x031162b4852c7304
	.xword	0xc8efbaa9ed77a201
	.xword	0x1528f960a82a3367
	.xword	0x61dec5a0ed8052e0
	.xword	0x1d1d1a643c6e370f
	.xword	0xcf353a9f06b95095
	.xword	0x6646c6f4cb085805
	.xword	0x08cdb4c7038615b3
	.xword	0xc4e552544bc414a0
	.xword	0x292ae4e5853bbfac
	.xword	0xf2871e24f96a2dcd
	.xword	0x7acee3372b2efddc
	.xword	0x1e0c2ab49bb4a866
	.xword	0xfb69e9ae6d794c3e
	.xword	0x709c37e2da34a264
	.xword	0x6e38b1fae1398904
	.xword	0x16f2d81fd969354f
	.xword	0x7124b9848a4f6481
	.xword	0x9b7c349dd1e445fa
	.xword	0x70b1d6b252dfb3f6
	.xword	0x095c433b0901eb04
	.xword	0x8ed0ecb64ef1dc10
	.xword	0x600fd903e12ba061
	.xword	0xca0fd7b87e47a0f3
	.xword	0x917ff438d39466d2
	.xword	0x7b16fa89898fc88b
	.xword	0xd00e5ce4217fb04c
	.xword	0x8580cbdb4c637f29
	.xword	0x47d8d4a0b8e340ad
	.xword	0xe5258605dd08ac36
	.xword	0x0cf1e6c9aecd0379
	.xword	0x9b7b3480e55d1a8b
	.xword	0x425cfeb5b95817c3
	.xword	0x7d876532f88163c0
	.xword	0xac597ce00a4ca0c3
	.xword	0x4fb00c3877affc46
	.xword	0x1a11526020185f51
	.xword	0x0ed977d9b53561b4
	.xword	0x016fcd0a5c66be6e
	.xword	0xc90d0480be32b655
	.xword	0x69a6a203d20a2aca



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
	.xword	0x361333b398ea8cd0
	.xword	0xfd9dc8c1bc963e14
	.xword	0x30deaa2e235fa51c
	.xword	0x5782f4c336881db5
	.xword	0x2971e294e90d8112
	.xword	0x1d88ca2c92ac5459
	.xword	0x1049c76dd875f970
	.xword	0xa47b7f8809615696
	.xword	0x511c4e453263e41b
	.xword	0x9caa0459e4833bfa
	.xword	0xfcd644e1a2c22ef3
	.xword	0x4f6d7db2692dab78
	.xword	0x09833af818d29f08
	.xword	0xb806224faecc78c2
	.xword	0x1f49bf035dca42a7
	.xword	0xc85c07a37250660a
	.xword	0x1439e10c24c4cdb1
	.xword	0x123534e530a78b01
	.xword	0xe22c5f59e38946b7
	.xword	0x3806d56e9af02a5f
	.xword	0xf384ef8fda9fe029
	.xword	0x84da3e218256e84a
	.xword	0x101e74709419d1cb
	.xword	0x5fbe65fa081ee010
	.xword	0xc15b03b07a978e8b
	.xword	0xb6062bfbd22fcb47
	.xword	0x18e07fc66155816f
	.xword	0x53ae68976967a481
	.xword	0x7deee5c071b8d88d
	.xword	0x4ed63d7cf508fa37
	.xword	0x896af2de1e8b3b59
	.xword	0x8f337fd248a3db0f
	.xword	0xc19dc3e70293ab8d
	.xword	0x9c31eeb392a00168
	.xword	0xc5a3109cf731acf0
	.xword	0x669e890c7ba214b2
	.xword	0xb3d6ea99164664e0
	.xword	0x9f7f91f70854f90c
	.xword	0x27ad83d269ca1c73
	.xword	0xbe2053eef0317d16
	.xword	0xa5693e99609f7e32
	.xword	0x5f8b0e6aef6f64c9
	.xword	0xc32867be7f13be4d
	.xword	0x3a013672f06b002d
	.xword	0x00aea4954f832f5e
	.xword	0xfc9120e069d28d21
	.xword	0xbb9b6457d6782124
	.xword	0x2816c360d78e3eb8
	.xword	0x3c65031105115e6e
	.xword	0x6d54bef62625cea8
	.xword	0x3a3ec7eed1958695
	.xword	0x9bc47abde2c61dff
	.xword	0x7586b953a5e0e7a7
	.xword	0xac89edadc9e3c0b4
	.xword	0xa9d159af00941455
	.xword	0x194d0e81adb2c2d3
	.xword	0xfa7b76c41138d76d
	.xword	0x7bd4e31fe75d8e3f
	.xword	0x78ffb23236b72690
	.xword	0x4bb92739d79cb6a5
	.xword	0x437b6633026c02a7
	.xword	0xb0f60a9a5463e202
	.xword	0x9ee9b88d8d3308cf
	.xword	0xa99777746bc401a5
	.xword	0x68e7997b344c495e
	.xword	0xa63a02e71cdcc0b8
	.xword	0x28b609c46a7eb695
	.xword	0x3d4263b52c8319bb
	.xword	0x180462c01b08a78e
	.xword	0x5eec25bf2683cc5c
	.xword	0xead75d987e735f84
	.xword	0x32f5ec7d6c963c85
	.xword	0xbfe200724e9b22fe
	.xword	0x4960fb39dcfa5d12
	.xword	0x71ff0b806ba009bd
	.xword	0x0e2e67aac21b9add
	.xword	0xa6402d4ea333f925
	.xword	0x8d4dd7669b6c5815
	.xword	0x1df0e33a5c956b04
	.xword	0x41f287be5f8bd4cf
	.xword	0xea085c35d4ec20ed
	.xword	0x8ed76f8137684b02
	.xword	0x39f0cef94756fe4b
	.xword	0x60b6085b2e4e7a9a
	.xword	0xead2dd91c1bd4271
	.xword	0xaa30052af7aeb3ea
	.xword	0xc7881db9351f3259
	.xword	0x687c3a114ba00cd4
	.xword	0x93f6f88a629ec378
	.xword	0x6a7d0e1298709b3f
	.xword	0xde983dd3bcdf8cf1
	.xword	0x0a7801914e8ddeb0
	.xword	0xae88842e897a2fe7
	.xword	0xdf98b8eb930f7130
	.xword	0x704b13e815f6fd05
	.xword	0x86beee1c793d8dd6
	.xword	0x35d13f4ef4cfc98c
	.xword	0x237b8a4509e68254
	.xword	0x0a0d35837f987462
	.xword	0x0a60f39dc3dbc915
	.xword	0x9c279b232232deb3
	.xword	0xf0f22e8e812c2852
	.xword	0xc03f7389e61b6045
	.xword	0xc915e724926892d5
	.xword	0x40b020a872c293af
	.xword	0xba897ff87ecfbf9c
	.xword	0xc559fa36644244bf
	.xword	0xb0da788dca1df7f1
	.xword	0x0809ecab938c9344
	.xword	0xd4510b47b865f68e
	.xword	0x3782a5166f8b2e3e
	.xword	0x09fccdb8bef3a862
	.xword	0x0543a2fd172f8902
	.xword	0xf7ea659730f5327b
	.xword	0xc1f4926dd8d16e9c
	.xword	0x823850896ccf3289
	.xword	0x3414335151976f1b
	.xword	0x145daa3910f6c482
	.xword	0x449a00a7b01a85a7
	.xword	0xa0dd6e5291b8897f
	.xword	0x581addb538d3aee1
	.xword	0xfbce84963f9ae395
	.xword	0x537306fa1a1fa31e
	.xword	0x4ee6783bad493b17
	.xword	0xaed92ab1d5262cab
	.xword	0x2f68d4350616916d
	.xword	0x9ee85255cae0a8b8
	.xword	0x0e04e63ea700b444
	.xword	0xc0b60814ffa035c6
	.xword	0x3e5328de14fe9ca7
	.xword	0x05e51b09228d6c9d
	.xword	0x4d3be85870334ffc
	.xword	0x46d11981c2174770
	.xword	0xedb6df770b598861
	.xword	0x3adeef1ba815f5b3
	.xword	0x4410a5f263a2418c
	.xword	0x4129b219a1aba3ee
	.xword	0x43de9a1793ccb689
	.xword	0x8ef73953795e8a72
	.xword	0x72509b2e589542a5
	.xword	0x980e435e2e8e2013
	.xword	0x3d9a3bed57687d8e
	.xword	0xefcab67f3515d9d3
	.xword	0x46eef164b7146d6b
	.xword	0x6884b38b2ae9b0c0
	.xword	0x80d9138026673d0a
	.xword	0x74d3c8b1e5b7a3ce
	.xword	0xf5a892ef3c2d2eed
	.xword	0xdf6a6eee34794295
	.xword	0x546882a17e8ba207
	.xword	0x0ae7a0dd9b46de97
	.xword	0x32f4820f0fba08b7
	.xword	0xaab6d367c4daa009
	.xword	0xd869e71b74bf1df2
	.xword	0x763b0457a9293687
	.xword	0xc5a6d3b616559f18
	.xword	0x1b1fac0ebd28b4b3
	.xword	0x3082a89d406746ae
	.xword	0x529d6daae1029f6b
	.xword	0xb0e13633df72efb9
	.xword	0x32250a922c2d6a88
	.xword	0x10907ad8658b5d03
	.xword	0xeb2cf4d47d691d8e
	.xword	0xd46e29b827b8b514
	.xword	0x1419b30cbe78a60d
	.xword	0x7ef9746f7258d1d2
	.xword	0x9c3c8d265a4ca226
	.xword	0x0fd61dbfa8563f1f
	.xword	0x36a4eb09061a63cf
	.xword	0xae20a3aa233cfd35
	.xword	0xc119e06451de40b6
	.xword	0x4e1726bb19c539e6
	.xword	0x3272a6bd03559fea
	.xword	0xecd5e187d1d819ef
	.xword	0x0f8f53660ca390ae
	.xword	0x611ffe71e8b59875
	.xword	0x9b817ffa35cc52a1
	.xword	0xb54eec06878638e8
	.xword	0xea9c43d11f983183
	.xword	0x249425a03a993ece
	.xword	0xafd2b451d0163017
	.xword	0x0006606652da778e
	.xword	0xf100abf4b3bad6d0
	.xword	0xcdb68b8d0f72b3b1
	.xword	0xb75e68a4a8057dac
	.xword	0x60e08513a055bf46
	.xword	0x50491b9f22b7901a
	.xword	0xf6d4ee460062c59f
	.xword	0x629f0f9c1d6eea7d
	.xword	0x5f425dd18809d47d
	.xword	0x07877a3d96cd4e0c
	.xword	0xc11b0c76242234ae
	.xword	0x7a7cffd246832df9
	.xword	0xdb6e755f9d610b30
	.xword	0x9563f2ba904d34aa
	.xword	0x9a5e98a3109609a1
	.xword	0xd19cf81160ae6be0
	.xword	0xc6966f80f329c27f
	.xword	0xa16013486f71108d
	.xword	0x022511abb9df72b3
	.xword	0xa6fb15ea72121c81
	.xword	0x13886e24b3c4a90b
	.xword	0x34e3c3d9c570060e
	.xword	0xb72b7a3818e678f5
	.xword	0xedb451dcfd083cf0
	.xword	0x1c54e49b58b81e46
	.xword	0x8026aef702e5a38e
	.xword	0x178860ae48712d36
	.xword	0x17487d2eaa1f4eba
	.xword	0x4d66d639186575a1
	.xword	0xf764d14ce3aa33c8
	.xword	0x753bdcec54a66144
	.xword	0x4f395b1d7685ae27
	.xword	0x4fc951074232317b
	.xword	0xb7e5d879b57ca8fe
	.xword	0x36c048c95a071cc7
	.xword	0x2d53feedc95002eb
	.xword	0x1e92d423f507486a
	.xword	0x9a5e98501d19263d
	.xword	0x4ca4f2e2076b7bbf
	.xword	0x5d7c4a35a1f529ca
	.xword	0x7aac93824cc53572
	.xword	0xdfe9bf510f285fea
	.xword	0x48356309b0a8e2fc
	.xword	0x749ca3b851155c00
	.xword	0xba8959ada8be2dcb
	.xword	0x6ba191d716f96dff
	.xword	0x215facaa210b30d9
	.xword	0xe6f2e33c1eb5732c
	.xword	0x3a88717b4716f33b
	.xword	0x3ce629a4737e3ca2
	.xword	0x4f830f0edfa5df5a
	.xword	0xc1345ad05138a211
	.xword	0x81f28f93795b0bea
	.xword	0xafc38a5a885bcb61
	.xword	0x8a00dab119e5845b
	.xword	0xae794179a55886ca
	.xword	0x18eef941db25427e
	.xword	0xaa9db7238ab65921
	.xword	0x3a0a4af637ee8f9e
	.xword	0xe22f8a97566917b2
	.xword	0xea944ea128601d07
	.xword	0xa50e3bda6898db95
	.xword	0x9f93aa5a9cac1598
	.xword	0x6d6d05363d94409a
	.xword	0x45c2b4a208d88bf2
	.xword	0x5c367c9a330dabbe
	.xword	0x65106b975368d2cc
	.xword	0x841f63c9976c76b2
	.xword	0xaf98e0b5f2b6c0bb
	.xword	0x5042e2e5ff1fc081
	.xword	0xc1c77c5b309f0d55
	.xword	0xfcfd2405e8c0f9db
	.xword	0x4a701c4f7d2681a7
	.xword	0x01f86744ad086b0a
	.xword	0x14ade0cbcb752e6f



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
	.xword	0xb7bc9cb7bc9b5aa9
	.xword	0x707573970ef6bf76
	.xword	0x74d47f37db29603b
	.xword	0x58667a44111478a1
	.xword	0xb33e5d726e32f141
	.xword	0xa53e71107d658f70
	.xword	0x677fbfedb0773472
	.xword	0x80c2da573527c01b
	.xword	0x92d71db6a3a6e939
	.xword	0x895580e6741c0807
	.xword	0x659a165384703e30
	.xword	0x0eaf8682ed10abdf
	.xword	0xafd5595b6dbc2ca1
	.xword	0x75c6376627b47e3c
	.xword	0x8f964ec303f59e2b
	.xword	0x3a621003c2b66b61
	.xword	0x8ef98768d4467fb7
	.xword	0xbf283d64417cf54a
	.xword	0x9b67004a73e18d4f
	.xword	0xdabbe609b4360f4f
	.xword	0x674605da7806881a
	.xword	0xfd6676e1380bceb2
	.xword	0xd9d19ec5abfa3572
	.xword	0x4ec778e9705b2a60
	.xword	0x3254db64b104de18
	.xword	0x16625c2e0284124b
	.xword	0x21c1bb9549510d00
	.xword	0xe42e4934efd5d501
	.xword	0xfd0e81742dc48b3c
	.xword	0x6690cbe86e636e68
	.xword	0x95eba6a98fddb471
	.xword	0x37d1b7564b888bcc
	.xword	0xcf1fb7ad3f1ac27e
	.xword	0x101e25a09dc5135e
	.xword	0xa69efbbaa2b0920b
	.xword	0x8cdd966a976ebe22
	.xword	0x2dd61db194a3d5ad
	.xword	0xcd7101089c3a1633
	.xword	0xfa7e0638ae5ad4ae
	.xword	0x63c5c99ad2977cd0
	.xword	0x88893cdd8ea810a4
	.xword	0xa85e02d4b79530e1
	.xword	0xb7779d2fe01aa68f
	.xword	0xb02ec3418119a888
	.xword	0xf619ff837d4432a5
	.xword	0xeb8f0ce1bd529e6c
	.xword	0x4557a7d5d97910c7
	.xword	0x178e2380f2bf2166
	.xword	0x6f2610d3378364f2
	.xword	0x716de1150774876f
	.xword	0x44c0592e09278dfe
	.xword	0x1e91034b228b264c
	.xword	0xda549a9d514869e1
	.xword	0x9ef670ebde12d81b
	.xword	0x48443cd1998efc68
	.xword	0x4d22e481148bae80
	.xword	0xb0873efb6dc43fec
	.xword	0x508d8797efee1dda
	.xword	0xf095a65d0f997c0a
	.xword	0xa449d65823f7882c
	.xword	0x9281373406dd66e6
	.xword	0xc40de138bc516e7e
	.xword	0xdce4dd4ffd8c3224
	.xword	0xe49d6211a8726ce8
	.xword	0x658ac4e490bc9a84
	.xword	0x83b1227ab489aa34
	.xword	0x678d224d90311e72
	.xword	0xaf5ab52e7008ad32
	.xword	0x49b6f41c718007d6
	.xword	0x4ee6d02a874f4a52
	.xword	0xce278eb11a330dbb
	.xword	0x873d29cb7f1a3e79
	.xword	0xcddd23a417495a66
	.xword	0x65c6e54b454ac775
	.xword	0x36cd6cb2b63afa93
	.xword	0xdba01da895587ab0
	.xword	0xf8f88cc99a31f4e6
	.xword	0xa47a0c5250475ecf
	.xword	0x6e63991d9d6857c8
	.xword	0x30ef9445e645a2a0
	.xword	0x1af97a5c03ee6a2f
	.xword	0x7aa31bea4303a3d8
	.xword	0x4fb6fefc72f1c1eb
	.xword	0x17a1277081b17839
	.xword	0x65511397b10b2b99
	.xword	0xc9eae2465aec486c
	.xword	0xe8222adcd29ac687
	.xword	0x9ba1a3bbdb6dd0b4
	.xword	0x65f35c0be4ee8a41
	.xword	0xd719c4e5b43dc217
	.xword	0xc57f3135dad3b47f
	.xword	0xdcf8e9365b759d17
	.xword	0xe1575c7afce60d36
	.xword	0x5b48e7b266233817
	.xword	0xedd707e57cb80422
	.xword	0x3c902ad22b7bd1c9
	.xword	0x32b5fee7c35623bf
	.xword	0x9fb8ed2647306745
	.xword	0x3c1427fb09e085ee
	.xword	0x162d994bce474900
	.xword	0x6c336650d4797999
	.xword	0xee6ea06069e8409f
	.xword	0x558dff6c50492520
	.xword	0x0542c9158b8d0629
	.xword	0x0e8d1c6ff92649f0
	.xword	0x41f014d1ab3128f9
	.xword	0xa036ecbb4a9cf6ad
	.xword	0xa92054a5a14080db
	.xword	0xc72cd2f8dc6d3f83
	.xword	0xe21ea173f8012496
	.xword	0x876bd210c7e38b10
	.xword	0x85cb87f11ad7282d
	.xword	0x07efcbf0715b60a5
	.xword	0xf601885cc0794b00
	.xword	0x23af9e86f9686f76
	.xword	0xcca44a209deb1f1b
	.xword	0x36609f6844b9fbb3
	.xword	0xd30d5bb935d7ced0
	.xword	0x2b6ffdd743ba4464
	.xword	0x602b68c33b3d76a8
	.xword	0x65ddf769335ffc27
	.xword	0x9ff66ce60bdff4fa
	.xword	0xafcfde081373820d
	.xword	0x9c3f0bce2f375193
	.xword	0xa3aabb372f8282ca
	.xword	0xe2d5660e4f9e3c23
	.xword	0x499b5bdddb634516
	.xword	0x315d2ab4d7a66b05
	.xword	0x1284015b23e60161
	.xword	0x752042fa908d8066
	.xword	0x3ce55b0b28abc469
	.xword	0x40df43dea481f0b4
	.xword	0x49d1c4a511884e0f
	.xword	0x9cb989c233e4c0c0
	.xword	0xb16d35f5f36431ab
	.xword	0x8c1a9acef6b8f4a9
	.xword	0x45f82aba528f869f
	.xword	0x9ac2c26c5392c976
	.xword	0x3fe805633e6fdc5f
	.xword	0x890981cd79415c4b
	.xword	0x75f52173d53d3a65
	.xword	0x575f39bacac57a15
	.xword	0xec6a3a226af1c7b1
	.xword	0x79c34dbd7c79be4a
	.xword	0x1bb8a7d532e7b340
	.xword	0x6f74fca33eea0b2f
	.xword	0x9509f8dfed723b65
	.xword	0x8873584c35cd0b1e
	.xword	0xabc39a53f75323fc
	.xword	0xe9d8e3e00c94eea3
	.xword	0xd2e8aafae9a8b0db
	.xword	0x57a7dba6dbe97e8c
	.xword	0x88f223179e1cef5c
	.xword	0x65ca01a04154344b
	.xword	0x66a181cebd171ad5
	.xword	0x1248063ebaa34a28
	.xword	0x726c62d0dc95bf80
	.xword	0xb0e2a657e7a2b34c
	.xword	0xc0c25478b5a67a53
	.xword	0x86cbd211706cb778
	.xword	0x56eced2375a5da5a
	.xword	0x9c8f0f98a7664d80
	.xword	0x38d9c0e1778c789a
	.xword	0x5d76967bebf17915
	.xword	0xf372e313a6c707f9
	.xword	0xa83015f86d5807dc
	.xword	0xd01da26558b25591
	.xword	0xc858d1beef541ff8
	.xword	0xe4ed39887e78c5d5
	.xword	0xca935c563bf13a13
	.xword	0x689cce4b8da16021
	.xword	0xf88f06ddf223e162
	.xword	0x1e014698bd4c073e
	.xword	0x1de9998a2d734750
	.xword	0x638c1614670ca0bc
	.xword	0xe10707b0433c8b9d
	.xword	0x1acf63f7a2f6daa1
	.xword	0x6f2053b134c217e2
	.xword	0xa7c5a560e5666a3b
	.xword	0xa02ba2ede9c5ff0d
	.xword	0x5a1033024a4377cf
	.xword	0x18d3b9c3fb4e3348
	.xword	0xe10553d75a4eb374
	.xword	0x0e044864065bf042
	.xword	0xde79458932b0efcf
	.xword	0x6529d1389d67ef40
	.xword	0x775a950c2c6e14bc
	.xword	0xc303352e55a7f6b4
	.xword	0x5f6191b05e418f2c
	.xword	0xdaed213a5beed522
	.xword	0x6b5ec6696d2374da
	.xword	0x3453223b4bce6e05
	.xword	0x527fbf180c1dadb4
	.xword	0x085b9414a8fbaf32
	.xword	0x6ae238510ca93ccd
	.xword	0x47a83cb009190a58
	.xword	0x78ef10c068509c57
	.xword	0x55a128bfabc9f619
	.xword	0x7624783ce7189c50
	.xword	0x03eaee89d1b429a7
	.xword	0xdd25a7fe452375b4
	.xword	0xc4b15f88dc11c117
	.xword	0x0c968d904633d62e
	.xword	0x81475a6e0af09e4b
	.xword	0x078e64aca83e2d0e
	.xword	0x90381ffc9b4f5268
	.xword	0x6faaea980fbf8b46
	.xword	0xde59eaaf40672e2e
	.xword	0xa609b7e8e7729c88
	.xword	0xb6a2cb7f077e16c6
	.xword	0xcbb808d0c7a145f9
	.xword	0x53a8425f95bd2bdf
	.xword	0x0d8bb12f425351eb
	.xword	0x7febba4220524198
	.xword	0xa47208e57c2bd96b
	.xword	0x355be5b49a4969cf
	.xword	0x5a1784ad4585aea8
	.xword	0xcc19b4c9e777e139
	.xword	0xb3153ac60a95877c
	.xword	0x5b5c72ea58efb0bc
	.xword	0xa8f809d49a09c765
	.xword	0x1b020613e326998d
	.xword	0x7782d38d5545358e
	.xword	0x0f20a99597c1835b
	.xword	0xc2e4092f2dcc4467
	.xword	0x1eb55a443016a653
	.xword	0x047821f414882cda
	.xword	0x9da4ab7751bb3a5f
	.xword	0xb1afcc49a493160b
	.xword	0xc3f572a396f169f5
	.xword	0x452ee6f543beb019
	.xword	0x98137d5035879b3b
	.xword	0xbd1ef3c2e258baa4
	.xword	0xac03908b239482fc
	.xword	0xa964f062ffd87ded
	.xword	0x663cf09c0a14db69
	.xword	0xa8024976a212b471
	.xword	0x7662ed0269553267
	.xword	0x44f272038f9c25a9
	.xword	0xb60bdf4d40b5fb90
	.xword	0x4f72fec46e52d523
	.xword	0x62ad00e0a3561e9b
	.xword	0x8420dc81b60e41b9
	.xword	0x8db7304d65ecbf66
	.xword	0x900e437a5dac385d
	.xword	0x61ca7f32ed90acf2
	.xword	0x78e92e5db88ac584
	.xword	0x3df7f332c2f9a070
	.xword	0xafc2830677df8b0d
	.xword	0x70a4b4154c1fe67c
	.xword	0x95338e4cc5c1a3e2
	.xword	0x99154afe521cfaf6
	.xword	0x75be2adb031e237d
	.xword	0x44c5797833be0d75
	.xword	0x67f80414925c65f1
	.xword	0x3957d5e5c5f420be



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
	.xword	0xd6160be3f065f7f5
	.xword	0x6468286a9a76f12c
	.xword	0xb4f7871a584c45d2
	.xword	0x7e2b41ee3f87349d
	.xword	0xbeb6007f860195af
	.xword	0x72620fb10e14afca
	.xword	0xe2f2ba36114ae263
	.xword	0x5a75f4375ff3f018
	.xword	0x4d8891c73ae8f6a5
	.xword	0xa2f91b3431c8997b
	.xword	0xbebe79110030f357
	.xword	0xa8d6ab84c8dc3232
	.xword	0x5bd75121bb7acd00
	.xword	0x946c1c6569caf908
	.xword	0x161c8d881555dfdd
	.xword	0xba4a9dc21ae4ed2d
	.xword	0x0c99e701215fd821
	.xword	0xa251e207dc4d412a
	.xword	0x644c5e54d1f4f945
	.xword	0x175899bf14c634c3
	.xword	0xe3db37113e8669ed
	.xword	0xe3d68daaceac6a42
	.xword	0xb212c1d5fe9b80ab
	.xword	0x2bb40cb32712417c
	.xword	0x045b3412ccda3350
	.xword	0x3dadbd75a6cf5c15
	.xword	0x9ec36ba7141fae60
	.xword	0x139233cf68007729
	.xword	0x13fa8f63803a83fc
	.xword	0x70ca365ad0011b5d
	.xword	0x0f336334eb450c57
	.xword	0x95631ca37dc32f48
	.xword	0xa8689f8cdc485b5f
	.xword	0x7a53f966079aa1ff
	.xword	0x5ecff5c724b6f475
	.xword	0x1fcab896576b174e
	.xword	0x45eaa13701bcb038
	.xword	0x181e67e0822ee3eb
	.xword	0x3100a9dd15ac04b7
	.xword	0xf8268d355aa09a90
	.xword	0xae2b43c295d82b8f
	.xword	0x0be0312857978938
	.xword	0x803f4082458ce299
	.xword	0x3f1ef35d33467f67
	.xword	0xec4956a3047b2757
	.xword	0x5620eaf1fb0d4fae
	.xword	0xca0f06ba9bebd8bd
	.xword	0x1540b6dd6adb4612
	.xword	0x145000d350c76806
	.xword	0xdec67c9dce61d445
	.xword	0x0b90a37589bf3963
	.xword	0xc31d597d2ac8d5ed
	.xword	0x0732c47a4717d8b4
	.xword	0xf67ba0922a03b6a6
	.xword	0xed975f1bebc31172
	.xword	0x7cc1d413de75be29
	.xword	0x3dd01f6aa448171b
	.xword	0x88a62e2f1fc57729
	.xword	0x6caa20f207453e03
	.xword	0xc161850b39043362
	.xword	0xe6452d53caf0d2ad
	.xword	0x9d7fcebadaca5451
	.xword	0x88885a22fcfef712
	.xword	0x231a0848bbeedc78
	.xword	0x0919ab60874ea9eb
	.xword	0x0afcd0975408ab5e
	.xword	0x4739838c6891296b
	.xword	0x8973f81342acce73
	.xword	0xe4bff3f246ab18f3
	.xword	0x15ccbaf753ff2bb1
	.xword	0x5aca910dc7d2c3ab
	.xword	0xfefd65f3565e748c
	.xword	0xa60c94f6a2dbf9d6
	.xword	0x48800cabb9265982
	.xword	0x93e4bb6a0aff237e
	.xword	0x512f43b012044295
	.xword	0x836b71fa87c79047
	.xword	0xe4e0ff374d64bac5
	.xword	0x1d84a755c7d24b83
	.xword	0xf81000efc9000fef
	.xword	0x023fbb5397882cb5
	.xword	0x0a069cf05617f772
	.xword	0x0d32ffcdebfb9065
	.xword	0xaa01c78edd3b6a8b
	.xword	0x65a12387cec25482
	.xword	0x6c48d452322edc0d
	.xword	0xaabad93119d684b9
	.xword	0x4ee9444c88dc7693
	.xword	0x41f1acdba28f8b74
	.xword	0xe2978f7069b37fda
	.xword	0xc4d27a8a67b596ad
	.xword	0xb20f6d158c05d9a6
	.xword	0x6711bf68a957a71c
	.xword	0x245fecc47eb9afd2
	.xword	0xa8aa1160216a8960
	.xword	0x14c087f4c9563927
	.xword	0x0bcd9e7bf51952f0
	.xword	0xe6e9d62ce0d4382e
	.xword	0x38bf3eb80b78a8d6
	.xword	0x8dba331f03d03146
	.xword	0x44f11ef2e81461a5
	.xword	0x9316ea1c7b99a731
	.xword	0x7d7ea74e6e613a16
	.xword	0xe05d806966f2e210
	.xword	0x85a12a950f9d0890
	.xword	0x78f804a458db674b
	.xword	0x06e4f6819a56e6e9
	.xword	0x7618678a855c39b2
	.xword	0xf0c614c11866af1f
	.xword	0x32812ca9cf133608
	.xword	0xe1b9438da9792512
	.xword	0x9990d8dd4860761f
	.xword	0xf5d7d6369284f3d0
	.xword	0x0d8d29968acdbac4
	.xword	0xc743f8819714aa15
	.xword	0xd10b800d3db999c7
	.xword	0xc7853eaa64d30151
	.xword	0x541cbbfaeb6a5c9b
	.xword	0x94ed3e8885127021
	.xword	0x02682bf61056c3c6
	.xword	0x3087f9986980c415
	.xword	0xebd6868b2cfa73f0
	.xword	0x2b82d9d5e710722c
	.xword	0xde7bd0ddb1d81556
	.xword	0xac306526d9a5c472
	.xword	0x10d31a8bb09ed191
	.xword	0x1f1630556c159c17
	.xword	0x5b1fa3b8a7fed485
	.xword	0x9b4fc80211702eba
	.xword	0xca8c0aac73e9e5d5
	.xword	0xf84e9cb9639de2d5
	.xword	0x89580ec11fa3af07
	.xword	0x85ee72eaf7351831
	.xword	0xa38cd514c388adce
	.xword	0xa18d79fb2555949c
	.xword	0x3577591a9a461f23
	.xword	0xedc7e6f14aa0122b
	.xword	0xcf830ce2d83d2e5b
	.xword	0x8ad3911ddb4a3bb0
	.xword	0x375a821d1faa1ed4
	.xword	0x587854dbc124179a
	.xword	0xbfba78422a2a17a1
	.xword	0x3b9674140c5560f5
	.xword	0x5707374414fce5f8
	.xword	0x12e1d7b8b01a6928
	.xword	0xdfd6966fb0d39e8f
	.xword	0x431fc036922bd2a2
	.xword	0xd7c3a0353664b18a
	.xword	0xb0bde8d8ca01f599
	.xword	0x37fd5fe3f3f5fed8
	.xword	0x81a2edd9255b14a1
	.xword	0x610b7709ff16f263
	.xword	0xc62c904943220358
	.xword	0x3e64ac3e438aa0d5
	.xword	0x7d5b8d0953680579
	.xword	0xc71a4a983548aa7d
	.xword	0x798c252210477c69
	.xword	0x7a4a311147253de1
	.xword	0x80566bfd7692c5bc
	.xword	0x379a002e9289a553
	.xword	0xa27d068a59b8687c
	.xword	0xd97a8b27b632117b
	.xword	0xc9be376b9b4de5f4
	.xword	0xdd85e0dfa5fe727a
	.xword	0xbbd8da9121a020e5
	.xword	0x651e93df5d47dd13
	.xword	0xa0161422b022ac1d
	.xword	0xabea9098dcd5d865
	.xword	0x25ffb9ecaa562f2d
	.xword	0x7774c8011c08a257
	.xword	0x22263c56af2eb288
	.xword	0x785344284989eee9
	.xword	0x9e9b5f164cfb9b00
	.xword	0xd9b871cd03088f3a
	.xword	0xcc9a485629fc647a
	.xword	0x017d11e8af5f40b2
	.xword	0xd37f27fd5d4c98a2
	.xword	0x8088603eac254a39
	.xword	0x1c4d66537ad30e8d
	.xword	0x0ef7f207c2a2ebcd
	.xword	0x9ed8ab7fca1e0261
	.xword	0xfe44881244f92cf8
	.xword	0x1c56c1d64e5fa9e8
	.xword	0x5332d42cb3d9e861
	.xword	0x0d406b5e2b742075
	.xword	0xed4da7b774d05543
	.xword	0xcfa92dd9058876f9
	.xword	0x5e03c086b284b9e8
	.xword	0x120ab944487b0ed4
	.xword	0x88233b6e54a4dad6
	.xword	0xd3e4ede330861d81
	.xword	0x2d9d540ee9a0d4b0
	.xword	0x0a5231b8b4c890a3
	.xword	0xe2b62d0d2a94d3b7
	.xword	0x9d5c4a1bab227e1b
	.xword	0xd58559968deb1dcb
	.xword	0x271dcbe654089c1f
	.xword	0x5769aa8dddd662d5
	.xword	0x1fa0d2afb9444b54
	.xword	0x2edc6071f8a9e9a1
	.xword	0xf352e0833f520ad5
	.xword	0x3490a6f7a1a30107
	.xword	0xf977659d90e47edd
	.xword	0x8575dee52336d45a
	.xword	0xf220950502b6fe33
	.xword	0x0027adcf05e7bec1
	.xword	0xefc9920b2d0b37a9
	.xword	0xa6c1a900e7b71114
	.xword	0x53ad80fb2ac6ea8c
	.xword	0x16ab964f56b9b1f3
	.xword	0xb3f5b34135843ae7
	.xword	0x778cd63c2e3b1703
	.xword	0xe812edf5aedda882
	.xword	0x64f053e260b5a889
	.xword	0x6c63ce36ce58851e
	.xword	0xc7c4b325b7bccd34
	.xword	0x134a0d9da34ae52d
	.xword	0x3f548b2d3c0a7aa8
	.xword	0x86cd99da2427da3a
	.xword	0x3a3993f5eae09e53
	.xword	0x7f784b05e5242c50
	.xword	0x2df061f45c1f346e
	.xword	0xd11ca2646aa9c899
	.xword	0xd312015759d0452e
	.xword	0xaea9b6513ba6e2c8
	.xword	0x42718a3e65b84980
	.xword	0xb74c8f38f46a5672
	.xword	0x3763f9d0f088e481
	.xword	0x9ce4d97ba2a343b5
	.xword	0x93076e3180debcaf
	.xword	0x6372abcba2424eda
	.xword	0xd8f4ead530c500c0
	.xword	0x83e0dcd303121fa1
	.xword	0xb8b8554b216a6646
	.xword	0x1f4bc5c97aea5e77
	.xword	0xcf67f923027b9c63
	.xword	0x4c2396911a89afe3
	.xword	0x43f5c5401daabf8a
	.xword	0xb4fa5042f444617f
	.xword	0xebabd516f6ab7e63
	.xword	0x539dcdf3a2295c27
	.xword	0x252731d5cebfa292
	.xword	0x6d9fc698745b5825
	.xword	0xccde1e813ccd1b12
	.xword	0xe2232759be76d7d5
	.xword	0x17139b24715e0ca5
	.xword	0xd18dc37e4ccb4c84
	.xword	0x1308f9da6fb06427
	.xword	0x1db925159745e401
	.xword	0x55b746f6a7815d03
	.xword	0x74f82c6f25345e4a
	.xword	0x0f7b489881ab7eb6
	.xword	0x3e0e51d1d060d382
	.xword	0x17f4d044ee930afd
	.xword	0x592777c573477293
	.xword	0xf7adca3ec0b5a94f



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
	.xword	0x960c860d25718606
	.xword	0xd0cc6c24e997e275
	.xword	0xcb69bc0e76785663
	.xword	0xf33cc89e845232bb
	.xword	0xabda9e8064cfc730
	.xword	0x1cdf323c23a6a864
	.xword	0xae0885b3af221e2a
	.xword	0x2ef196c257006757
	.xword	0x2808a069b5d8ef8b
	.xword	0x49437a23189e5554
	.xword	0x4cb745caf6d146c8
	.xword	0x546f650d6dd465e7
	.xword	0xb96a3c4698210216
	.xword	0x4e24d0a420e59257
	.xword	0xa4bf8ee7f4e9c63b
	.xword	0x5ebf46035e19616b
	.xword	0x6039e4f95059767f
	.xword	0x2d257f27db8e34dc
	.xword	0x1b78b5bdaa04b65f
	.xword	0x2a1098857bbedf5a
	.xword	0xe9009145c89ba1ca
	.xword	0x6d1a8a04fe216981
	.xword	0xf32db52893670afa
	.xword	0x703cef9d09482c38
	.xword	0xaaf62e27ca69af7f
	.xword	0xce4cdefe18eb8ea8
	.xword	0x3043e5a088b128d4
	.xword	0x98deb873db871cf1
	.xword	0x643d979c3609851d
	.xword	0x3c50ce449ec6b384
	.xword	0x11d8656e6f890938
	.xword	0xd8ff63a9814a75c6
	.xword	0x8e1a2024346b8237
	.xword	0x34670b6e81a07195
	.xword	0xb06d6271c6553970
	.xword	0xdb42039900d45985
	.xword	0xa3569f2e697cb56a
	.xword	0xa0525b06d1091e34
	.xword	0xcb9e635db347bbfa
	.xword	0x750970195f8d0ca9
	.xword	0x125975e5b0b54904
	.xword	0x50741f61e4a88014
	.xword	0xe086fd1929f9621c
	.xword	0x41dfb896a9962f62
	.xword	0x6aace100b502dc0d
	.xword	0x6a0fe5015f364fcd
	.xword	0xc5d3e97c6def9e16
	.xword	0x0303181ee79ab87c
	.xword	0xa495506bb6fef9b0
	.xword	0x17ac4a2dc565f2fe
	.xword	0x4cd9ab7c390b694d
	.xword	0xe7a2ebf485c05056
	.xword	0xfe2136a120f7de01
	.xword	0x9c25354c069ef757
	.xword	0xfa667ebfb945ef34
	.xword	0xebfedb80ac1f6505
	.xword	0x92c5f74ee8e45d4d
	.xword	0x7f4be83c08f1af62
	.xword	0x8d665296837c2166
	.xword	0x162e348390b22800
	.xword	0xddd68f73a69ccfe9
	.xword	0x6323e0db4597b935
	.xword	0xef81f0818d1856ed
	.xword	0x49439ac959427d1d
	.xword	0x77c38bb47244b031
	.xword	0xd2ad734be0d9396e
	.xword	0xfe65b3b947c283b3
	.xword	0xce9a6fcf89a54c6b
	.xword	0xd75ec944f6a558d0
	.xword	0xb1ce419014cda8fa
	.xword	0x9eab69e1bbc35f88
	.xword	0xc3fa0198d8d79d04
	.xword	0x7ae596ccdd47603d
	.xword	0x562dd35a93a4d517
	.xword	0x3909e2966dfa847e
	.xword	0xf17f3b71bf76b56e
	.xword	0x5a53f2f2a1ee394a
	.xword	0x52a1214fbfea42cc
	.xword	0x574d971207a6d85b
	.xword	0x641e48c25ce9bc20
	.xword	0x81056099d97fc94a
	.xword	0xcf3a751095a4a9bc
	.xword	0x79c543e6dc1b88a9
	.xword	0xa9c1601b88e3a0fc
	.xword	0xa06d0e8495d6b295
	.xword	0x21575c19162f17c7
	.xword	0x9bc991a36b25141f
	.xword	0x02dab7b385017978
	.xword	0x15146aa36405904c
	.xword	0xc079a69d18523c28
	.xword	0x07be5f5f38ce3b21
	.xword	0x39f74710c3ede443
	.xword	0x8232101c43a52a60
	.xword	0xbc5a4f85008450f2
	.xword	0x5bfc5ca37e7f7941
	.xword	0xa28e060bfd8c2e57
	.xword	0x2462b7f61389aab1
	.xword	0x5631f850fa44bc6f
	.xword	0x3fc549db81869f1e
	.xword	0x8e5b4b8e82437dbc
	.xword	0xcac4868727b5e4db
	.xword	0x8a4751a882647836
	.xword	0xed8316906a593a0e
	.xword	0x196d750551e44daf
	.xword	0x2af2d66aca907cbb
	.xword	0x38af9b2bdb6594ad
	.xword	0x7fa46c5e23f168b9
	.xword	0xde1313f9afd4b45f
	.xword	0xa5b81a0456ceff81
	.xword	0x2b67e2082a5d1e88
	.xword	0x4395d282beba8ed3
	.xword	0x0e3ca65756058eb9
	.xword	0x10fc6d950d8c5f1b
	.xword	0x3196ec8ffb9559a1
	.xword	0xdd1ef445771dcd0e
	.xword	0xaaea8bd7211ed94e
	.xword	0x7d04b98484924a33
	.xword	0xeb86c98053972e7b
	.xword	0xfcf40a10ae858d40
	.xword	0x247ce19401f1421a
	.xword	0x25034f12e57bcca5
	.xword	0x4632e902ec5f7d87
	.xword	0x91ed6fb092e42ca6
	.xword	0x849229fe16343d92
	.xword	0x2de080708d55f7f3
	.xword	0x8fe1dc820d6e984b
	.xword	0x77abd58ad3b42575
	.xword	0x0fd6a45e16c6210f
	.xword	0x319b07dae6da4572
	.xword	0x2c8b4cccfcc5d70c
	.xword	0xf89dc623ae5cfbb1
	.xword	0x3b14d73c2ac9f09b
	.xword	0x375a43bbedfa6fe2
	.xword	0xf43c8c7cb58cb77d
	.xword	0xe1467d840843b856
	.xword	0x39574b76dd64dad7
	.xword	0xe70c57d47e527433
	.xword	0x6732e4fde7afa75d
	.xword	0x6ba9a9d0e8037059
	.xword	0x021024b737b391d4
	.xword	0xf8aa8f5ad25b270e
	.xword	0x2ad8eff904398355
	.xword	0xd94bf8ded8a38086
	.xword	0x4d302319610d0845
	.xword	0x2716e9121093e9b1
	.xword	0x14aed99f41d33398
	.xword	0x996c7ef116bd3147
	.xword	0xefb384fee11442b6
	.xword	0x2dc7fc9458839ef1
	.xword	0x4ad33e03241f2a9e
	.xword	0x3d1bc41fc666c946
	.xword	0x97055025ee132d36
	.xword	0x365a841da6782447
	.xword	0x9dd46d0e004a4bd5
	.xword	0x73021c53b2efff52
	.xword	0x7fbbf116c57f64df
	.xword	0xc2220f26c6546de7
	.xword	0xf0ba30dcacedaa3a
	.xword	0x83e1d78ce03b5489
	.xword	0x9614a974649ffb53
	.xword	0x9c5705f0e7733b0a
	.xword	0xd0bf2f8254ac4075
	.xword	0x9bf589dc4eede97c
	.xword	0x98ab3bfe3c6635f4
	.xword	0xf0ef1a8bee316d6e
	.xword	0x3ea7a0f697ee1b64
	.xword	0xc2a2fbc614477be2
	.xword	0x497fcabd6d0d450b
	.xword	0x21aa90e23328c9d2
	.xword	0x70a71896acff9cfd
	.xword	0x92307692f4f39f69
	.xword	0xd7d0653e056bd907
	.xword	0xc7a4c1c9309fe737
	.xword	0x2390e3043b7a888e
	.xword	0x2b5fa1ad0eb8813c
	.xword	0xd34d02860336c80b
	.xword	0x4e855336303e63e8
	.xword	0x9cb4550e4f0d96de
	.xword	0xa54c23f90c2bcba5
	.xword	0x547e4d0690440461
	.xword	0x8e88901b5ed2ff5d
	.xword	0x21848085bc9edcf6
	.xword	0xc8f976b90c55e7b8
	.xword	0x70274fb081a88720
	.xword	0xee7684cdcdb5a207
	.xword	0xaa65e69c4981e086
	.xword	0xb7112f7bcba5c4c0
	.xword	0xb33979ddb714a9db
	.xword	0x963d02cfa52738e8
	.xword	0x09e4b2acc0542632
	.xword	0x4799f02f2f6773e5
	.xword	0xd2434fe5b5e88bd5
	.xword	0x3f8bb4940e091cad
	.xword	0xda0ddb9c81fe7a8e
	.xword	0xf4ddbade1e1291f6
	.xword	0x3fb8cdbe5877acc3
	.xword	0x7cb98e86f02e822a
	.xword	0x85af1b5fc0ef88ed
	.xword	0xd463e1db35e82627
	.xword	0x709efb6d996c82bd
	.xword	0x09fb937b9664abc5
	.xword	0x1dc2d0470bffb2cb
	.xword	0xf522475e99c69875
	.xword	0xf1c9e4aeea94327d
	.xword	0x7ad0d91190834397
	.xword	0xeb04a100dfc13c7e
	.xword	0xd9751d920e5a6381
	.xword	0xc607c3fbda8ee420
	.xword	0xf49f80bb5310a8b3
	.xword	0x8d5fb1cb01446b01
	.xword	0x389888aef7a50510
	.xword	0x0de9b3b1cd52be7f
	.xword	0x2e88e40ccb1bf006
	.xword	0x40c9eec0ff286011
	.xword	0x5ce6964eca4f1f67
	.xword	0x5720d3bb18469a9b
	.xword	0xaad113805533aadb
	.xword	0x36478a9a7fe682b5
	.xword	0xfbad91de3d33f026
	.xword	0x3005230b723e9f70
	.xword	0x1a334113efecc448
	.xword	0x678ff6b8882790e8
	.xword	0xd4851edeeba27f6c
	.xword	0x04c6e0a31bab9314
	.xword	0x757c5b3f037d1e91
	.xword	0xcb6c05bc7826aeb7
	.xword	0x6da96243014b6471
	.xword	0x73ef63d00d2d26d4
	.xword	0x4fe4fb1d09abcd61
	.xword	0x910dfdbd9e2da0f6
	.xword	0x753e15d57f2240cd
	.xword	0x9c206a810b10e42b
	.xword	0xc098fb80110fb2f6
	.xword	0xdc55480f182ee6d8
	.xword	0xfb4ead76b2cf345f
	.xword	0x41a56a0413d8d31f
	.xword	0x5e00c6e10f21b356
	.xword	0xad32e3c6651ebb6a
	.xword	0xfc37bd51a425dd45
	.xword	0xede6a32dacab5c60
	.xword	0x66a64ec5914457aa
	.xword	0x7124a86d5e207323
	.xword	0x60628d04e15e6382
	.xword	0x9bd6b53f7f272a18
	.xword	0x416e29d09aa7c316
	.xword	0xfec01d532f591227
	.xword	0x326a9b1b1cce5562
	.xword	0xa1df8df861db6d8d
	.xword	0xac38ff58b8c08a67
	.xword	0xc114b5b4b8ebec64
	.xword	0x25100f5ff708776c
	.xword	0xe160ac52fbb48901
	.xword	0x8c4ce7494a7a5f5f
	.xword	0x4655875776fc5a3c
	.xword	0x03734656bf1eb011
	.xword	0x43c436174eab98fb



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
	.xword	0xb438a6749b954b5d
	.xword	0x0e9f9a2b79c4594f
	.xword	0xb3057eb0baa26346
	.xword	0xc19a2882f0436f3a
	.xword	0xa18f2af166163b17
	.xword	0x43d569f3b0860393
	.xword	0xb39744c3c0fb0093
	.xword	0x7dae2a98492676df
	.xword	0xb4c29324fa1edfc7
	.xword	0xd69a709839a5fca1
	.xword	0x8ac61a4c737aad7e
	.xword	0x4b0f571d21d9caf4
	.xword	0xd5ee0dced0053bd9
	.xword	0x07d3128e0159d2b8
	.xword	0x363aa8ee087da853
	.xword	0xb532ed0c2cfbdabc
	.xword	0xbb799d8e08c5e8fd
	.xword	0x334400b00e29f3bd
	.xword	0x266f84792459dae8
	.xword	0x26df07a75335c07d
	.xword	0xb6131268807b1077
	.xword	0xf567a37f7deda279
	.xword	0x9bc8909d85aa4487
	.xword	0x46b594e38cb56b6c
	.xword	0xebbab6f26b4294a8
	.xword	0xffd552b48b710f3c
	.xword	0xc0ac45f53fb5dc00
	.xword	0x6ffdf1d7f6cfdf87
	.xword	0x72973800ab55184a
	.xword	0xb01c9287d53c1b90
	.xword	0x1dfe53b3271c3daa
	.xword	0xcaf3b0efa92c8de6
	.xword	0xaed789d34bd63787
	.xword	0x5e8cbf7ec523cf10
	.xword	0x00b8bf9afac16185
	.xword	0xe8933d536bb2e37f
	.xword	0xebf8167e2cb6ea09
	.xword	0x83069a8c95cb22cb
	.xword	0x11f24d153f6c0360
	.xword	0x2889394f3f2534d7
	.xword	0xa6285264e6a7f877
	.xword	0x8caf9ddc6f91febb
	.xword	0xa8f85d8c0d53b0e1
	.xword	0xeb8f2ac43760e8df
	.xword	0xe5f12ae5a204ff66
	.xword	0xa51f48b9acb80f5e
	.xword	0x40da3842d6ca3ef2
	.xword	0xaf0774d205559db8
	.xword	0x66c6a35c413a4826
	.xword	0x5a9fb279c75eed94
	.xword	0xcb1c11a79ff19bdd
	.xword	0xeb2f3576b6c79f3d
	.xword	0x09e2bb4f7b27f970
	.xword	0x3ea07344d525b981
	.xword	0x056b7850424e7216
	.xword	0x4532693c44eedc22
	.xword	0xf9eff7c07fe8f71b
	.xword	0x4aee5ab676f6e0c4
	.xword	0xf751eae4e372b493
	.xword	0x320a1f6f4004c53e
	.xword	0x4ecb1cc55aa87177
	.xword	0x6daf8d7db6f7d18a
	.xword	0xed605d97acfceeb3
	.xword	0x18ac0059c03c36bf
	.xword	0x8c86b560c143c825
	.xword	0xdcb4a1d5b38d4851
	.xword	0xcc7e25eaea1dc3ac
	.xword	0x520cc193b1e4e3b9
	.xword	0x2029f4e66da9eaad
	.xword	0xe60b20002f1db5c0
	.xword	0x27e79d9a703c2455
	.xword	0x3878f7e1cd43bacb
	.xword	0x7447d0ee387de4b6
	.xword	0x5f845dd01ed3006b
	.xword	0xf50c55e4896f6022
	.xword	0x6f246c85afcea66d
	.xword	0x1dff1bfb57bbd8f1
	.xword	0x429f7db39d56e47d
	.xword	0x045c81e675484100
	.xword	0x2aeec42764968f76
	.xword	0xb712b0f7287f7d40
	.xword	0xb226c19ef2ca068c
	.xword	0x228e888deff87363
	.xword	0xafbc7bfda4b441b7
	.xword	0x450419b1325995fc
	.xword	0xfe9ce7c66fb9bbb4
	.xword	0xe7707ab40e5ac560
	.xword	0x938332793d071569
	.xword	0xffb7da21112e747f
	.xword	0xb29710200bf254b4
	.xword	0xa33e4bb11735722c
	.xword	0xca75b7d259dc5971
	.xword	0x197a8c2dccfe8480
	.xword	0x34672407c7b96b5e
	.xword	0xf49642a489997cc6
	.xword	0x5eafafbe26640b37
	.xword	0x29232842dec49a50
	.xword	0x7805248e6e8f18c8
	.xword	0x7333fe6fc75d5132
	.xword	0xf288e5877964158e
	.xword	0xe35ad3b947593ce4
	.xword	0xeada73294bfbf4d8
	.xword	0x1be5bbf22259f760
	.xword	0xbcab85af3466857b
	.xword	0xa02a0b2a333c416e
	.xword	0xb32888490393c746
	.xword	0x2f6bca3a4923e854
	.xword	0xda63cd982aa7f01a
	.xword	0x23049c6aa19e8bcd
	.xword	0x741ceae097b3cf51
	.xword	0x0b4e272a3e57e4e0
	.xword	0xc3cce20cea9e38c1
	.xword	0x994320c04993e002
	.xword	0x856c7f9fe7a7fb2a
	.xword	0x05159a6fa9de70af
	.xword	0xcb744a1cd0800ceb
	.xword	0x7202ef40855aad15
	.xword	0x3abf8b7bfc4703b7
	.xword	0x12fbc034edaf64dd
	.xword	0x7719d57db46ce638
	.xword	0xf7d406a5e79c4f8a
	.xword	0x9bbd634b1eb98673
	.xword	0x54dcde43486511db
	.xword	0x2ac3f21080a3fa58
	.xword	0x7be608d7a8ed5b7b
	.xword	0x4024df23f7439cfc
	.xword	0xedf7c0be93e0b052
	.xword	0x8378a4786be35f18
	.xword	0x56e33c9d4ec00408
	.xword	0x2b9c93b74f07eab6
	.xword	0x71fc5e68094ceb00
	.xword	0x4e037123456d455d
	.xword	0x5dd368ceed54a22a
	.xword	0xdd0ef1dd0634e241
	.xword	0x1ba7f21e9604b41a
	.xword	0xac37de643f90ebec
	.xword	0x310199a6ac45153b
	.xword	0x13f1387d114aed34
	.xword	0xcc2bb35d4c7de8b9
	.xword	0x4597ce590f29f1cf
	.xword	0x4d7a03bc745ace2a
	.xword	0x9ec4da064f4ca33b
	.xword	0x47fd29dde9d5a529
	.xword	0x9cd033d186e5821f
	.xword	0xa6ac64d306b7f10b
	.xword	0xa6081a2a8da5c6d1
	.xword	0x1e186de600465f1c
	.xword	0xd12ac7dccfabd9c0
	.xword	0x50261ee2ddb0363e
	.xword	0x5700bd4707b27790
	.xword	0xe90b29b68e89317d
	.xword	0x008c6e5cdf2b257f
	.xword	0x927f2850c3afaf47
	.xword	0xe3bf5bd1f7c3b7af
	.xword	0xbfbbe46ad6c012f0
	.xword	0x6b684a02febd1b73
	.xword	0xfc28387b65c40900
	.xword	0x10b79ac0fa8f7a01
	.xword	0xcd792102440abb5a
	.xword	0x54228f8053800d21
	.xword	0xdc5cf545fc38d40a
	.xword	0x9de64b7fdf29db86
	.xword	0xb94f0e49d61a2490
	.xword	0x4777c7f7296d894d
	.xword	0x94aa073b715f2035
	.xword	0x9d0e1b976b223e8e
	.xword	0x5a1837442bb0fe04
	.xword	0xaad1927d5b8c9e2c
	.xword	0xe9e218db1fbea986
	.xword	0x6cc31ad5788266e6
	.xword	0x548fb5635677843f
	.xword	0x5003f7250a0e097d
	.xword	0x0568f83a2e7160c1
	.xword	0x03615f76f85b993b
	.xword	0xde8fcc4a9ecc1a6b
	.xword	0x90e9f5c17c26f576
	.xword	0x32a8083654602d7f
	.xword	0xcaa8cfb6b3a7a58e
	.xword	0x91ea9b227a8120b2
	.xword	0xaa88de5b41388598
	.xword	0x0265450b1c8b979e
	.xword	0x272eebda342ffcdf
	.xword	0x5d867679bfc22cf2
	.xword	0x7739e8f2c6461422
	.xword	0x6eea7866f4f6c54d
	.xword	0x7c98ad9864e0ac05
	.xword	0x8022696a263d3b14
	.xword	0xa91f3b5dd65d6987
	.xword	0xe3e78a46ca5f3482
	.xword	0x6c7db85371ad0676
	.xword	0xd8fd29209aefb72f
	.xword	0x97ee5b8f43eb2e10
	.xword	0x1a75b5566db2da96
	.xword	0x250df761f2dba5a6
	.xword	0x93b1168242833e76
	.xword	0xf277218d11e44f24
	.xword	0x6f719df7fe67e8e1
	.xword	0xfa610ee51218c8c9
	.xword	0x8fbe0fe0b84b8c82
	.xword	0xdfe9c571c383c2a5
	.xword	0x37b337f96887beec
	.xword	0x782a6d1a7b3e096d
	.xword	0x2758ce9ba19050ba
	.xword	0x44d34d27d884ce3c
	.xword	0xf9e65be4f7946bc8
	.xword	0xb930766aa19f12e4
	.xword	0x14865d73e7e91f7e
	.xword	0x4597aa715db41b43
	.xword	0x2edada5e3f33afd4
	.xword	0x1d7ea0035526dc65
	.xword	0x133bf8fa3fc5e360
	.xword	0xeb029ed5dbef1bb8
	.xword	0xe5e4bac1b7c19dce
	.xword	0x92df9e18419d21c0
	.xword	0xdc8212a842b57121
	.xword	0x7f38c3335cd8d6f6
	.xword	0xd1143c1a94c1cf85
	.xword	0x4fe50af94f1f958a
	.xword	0x98bc329353424015
	.xword	0x0d236f6117fca995
	.xword	0x2b6d77416e85efe9
	.xword	0xfd8903cb9ef2550a
	.xword	0x02af7b08dabd3d78
	.xword	0x6876db5ccdf38c09
	.xword	0xc5a3420d6ded0f14
	.xword	0xbf43273da6035325
	.xword	0xbb34a25d160cd2ac
	.xword	0x996486f786f4013c
	.xword	0x0824ac858fbe1447
	.xword	0x6d010a795854b53c
	.xword	0x4b14b638eba3fdcb
	.xword	0x6a8334410e527675
	.xword	0xed0c5d1411c74246
	.xword	0x6c9cad287e1219b1
	.xword	0x39f34288cde263b8
	.xword	0x58c757f86d2c46a0
	.xword	0xbbd6b33df7e31f8e
	.xword	0x4c7f1c5464972ddf
	.xword	0xb7d0d9c83694d1bc
	.xword	0x6d046e9f9c6aff74
	.xword	0xd9fb37e5ab9bc7e7
	.xword	0x26d4f4af5fd0589e
	.xword	0x61d34db8eea9b874
	.xword	0x864640ea5453d449
	.xword	0x56cd109abb1e1e2d
	.xword	0x72bd577fae2c89cc
	.xword	0x725a41007a518bf7
	.xword	0xa322e7bd8f267cc9
	.xword	0x3b0df42cca7c9d8d
	.xword	0xc2f9e3cc68d996ca
	.xword	0xda4e9df33461fb9b
	.xword	0x4acc0a926a69e0ac
	.xword	0x40dd8ab7837a209f
	.xword	0xbbfe27e03cafcc95
	.xword	0x4be68f22905f96ac
	.xword	0x226abaa5c16f5608



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
	.xword	0x03afa4647a488fc2
	.xword	0xc89a2d0168ffce56
	.xword	0x77cb96a69152f079
	.xword	0x63da5256f2e5f68f
	.xword	0xc498dc7dfd8967b9
	.xword	0x89d9a3828894fea8
	.xword	0xbf672f2a7b24ce23
	.xword	0x4d0524ca4ea469c9
	.xword	0x55603f11ec1177cd
	.xword	0x5623cceb3bb8e953
	.xword	0xbd44550c10d7da32
	.xword	0x450ac5268073db97
	.xword	0x4744ec50d1a8a695
	.xword	0x5f9595535dfebe45
	.xword	0x210c872e6cb6875e
	.xword	0x4dfb6f6bc581cff2
	.xword	0x33d2042917dd688b
	.xword	0x93263bc35ec65b69
	.xword	0x57fb0f5aac1c4e28
	.xword	0x202fcd2bb77b4834
	.xword	0xe5c6b1e12d2c1a33
	.xword	0x6309d734f1649d7d
	.xword	0xbebd904452c8d3d2
	.xword	0x8e702bddb04ebc7c
	.xword	0x84440ce6f119b529
	.xword	0xf6c30e28d853f063
	.xword	0x049e3d7821672c2c
	.xword	0x3a24c71dc1c1cef4
	.xword	0x4dedcb26612f3c4a
	.xword	0x5e3058d6608075b7
	.xword	0x89d23f6f5bd7d114
	.xword	0x7f60bbc5fd37ac3c
	.xword	0x6ab8bdd8fc7ecd8d
	.xword	0x286e9206e8c59d8a
	.xword	0x79e655ec8f2b19f6
	.xword	0x34e58890c1305d85
	.xword	0xbb5c70e296627eda
	.xword	0x998da439de16c950
	.xword	0x1558b17372eb6489
	.xword	0x12ed395b4b329753
	.xword	0xca09535b4cdd52c0
	.xword	0x6022f6dd3acb86e8
	.xword	0xafd2e54678794a81
	.xword	0x1998ca3741b4fb63
	.xword	0xd3667763e98b6fd9
	.xword	0x4413ff780f877a41
	.xword	0x59d810ea703e9573
	.xword	0x3aeec643007a856d
	.xword	0xcb8b86833b23b0df
	.xword	0x5e7d884ec0bdc19a
	.xword	0xa3bff044dc9fba2e
	.xword	0x44366b4e4987466d
	.xword	0x1bee1dad15d3633e
	.xword	0xe7102c5eaf4d0d89
	.xword	0x81cda8e4db3c642f
	.xword	0x559a5cdd56439d7f
	.xword	0xcc9ae5fb82653483
	.xword	0x96fcfd6b265e2d9a
	.xword	0x76db656ae8d21fc1
	.xword	0xc9fa140527b5e6a6
	.xword	0x59311bd8bf6ad56e
	.xword	0x9a0cd94bfa463be3
	.xword	0x32409854553b4b47
	.xword	0xf8bae172db1b453b
	.xword	0x39de2b28f2b5122c
	.xword	0xdfb1426e039171fc
	.xword	0xd790cdbeab5118db
	.xword	0x34f82d18893d9972
	.xword	0x1f1c72c2cac73da2
	.xword	0x64d010ee8176ab87
	.xword	0xa9cefa21d4aba514
	.xword	0xc07db15c411c9822
	.xword	0x36a32658de27fedc
	.xword	0x20394427fbe6940a
	.xword	0xec0d3fa3455fb319
	.xword	0x89490f1533b1e23b
	.xword	0x98df16dfb0faf3a3
	.xword	0xe55de76fd5924075
	.xword	0xb1631ff62a2bd001
	.xword	0x49188b5d333da2d7
	.xword	0xb346ac9996fe3c63
	.xword	0xeb73c005d99076f7
	.xword	0x6d4eaed1c04fcf5f
	.xword	0xb02f8f48c696bdfb
	.xword	0xf209e806fa6dda86
	.xword	0x958498ba07554e5f
	.xword	0xcec2d745771b74cf
	.xword	0x8317199c75289d33
	.xword	0x303cdba4981ad634
	.xword	0x8b8c33176d50cf88
	.xword	0x1634cfdd7f361911
	.xword	0xe7beead3643e4822
	.xword	0xad3f19ec5660ceec
	.xword	0x4c4655c86e240ffb
	.xword	0xbeba2a5bfd78610a
	.xword	0x0047b12c431914f5
	.xword	0x3ffa4dec45f1c0cb
	.xword	0x6a3e00fd0b0369ed
	.xword	0x3999669a3b185ba6
	.xword	0xb76382c513bb1dba
	.xword	0xf67b4d72c4361f9c
	.xword	0x9b24e74d4901d166
	.xword	0xd194af97712b2e67
	.xword	0x686a1a2c4192a80b
	.xword	0x3ed22e36f1830d5a
	.xword	0x08a948bd96d875d9
	.xword	0x553ced201242c0aa
	.xword	0x66ad1e0fa6429112
	.xword	0xf0441adb4d9601f5
	.xword	0xc60d61c3678356c2
	.xword	0xced13e4a7f0ce9c8
	.xword	0x21a357178ebc975c
	.xword	0x4c456cf146ec4635
	.xword	0xedf82e5245d440aa
	.xword	0x7ac438584aa4dbc5
	.xword	0xe8250b7e281c0805
	.xword	0x0f663aca38972585
	.xword	0xfb10c303b05eada2
	.xword	0x14ee47e995813cb8
	.xword	0xaf0807a8d7224509
	.xword	0x714edce417648714
	.xword	0x75ee5f57ca5ea9f8
	.xword	0x6f0b56203dc91388
	.xword	0xa7fb2d7a53bba543
	.xword	0xd61cfc21c0485236
	.xword	0x30b98bcc92ddca85
	.xword	0x90962cab589e2599
	.xword	0x09e3c4eb837930c6
	.xword	0x5c4e0180a4ddf5ff
	.xword	0x1729a3854dea74c1
	.xword	0x707e3f92d80bd1db
	.xword	0xcaf0350154c95ee4
	.xword	0x5a958f88cd7c5edc
	.xword	0xc628d1a4b4e69c13
	.xword	0xe730ea8084f19379
	.xword	0xd472df65ed5fb821
	.xword	0x84ae5fcc0bc45664
	.xword	0x1e1e167844f0de44
	.xword	0xe2632d8789df3436
	.xword	0x8e3f996f33668266
	.xword	0x05096b2f295988c4
	.xword	0x35833f3e92a70de3
	.xword	0xdc61aa0028e37ebf
	.xword	0xf4336a4188d55d53
	.xword	0x14ac8dfcc11a3f92
	.xword	0x67861ba7fe48890a
	.xword	0x060c7807e5c5ff84
	.xword	0x1676521079cf5335
	.xword	0x8dc9bf977a15f52e
	.xword	0xeccbb30d0f987061
	.xword	0x9569c7a362c19135
	.xword	0x8338091e93e6d288
	.xword	0xe626af4b985450ad
	.xword	0x78128c7605b2f0ae
	.xword	0x14ce40f4c3dc11ec
	.xword	0xb71eb33102ce69e2
	.xword	0x4f5a1e0628fa5fad
	.xword	0x317ce590e4678e44
	.xword	0xd8d4391bbef40301
	.xword	0x17caeed036a4ba37
	.xword	0x4b65ecafb2ef6e4f
	.xword	0x9da9adbd32c980e3
	.xword	0x24a5f29332978668
	.xword	0xff7ee3b65dadfe6f
	.xword	0x71bd46c40d8ef02b
	.xword	0x2c7690cd0b0997e8
	.xword	0x97b56676e8e22c2a
	.xword	0xe1064d3ac6ab9e9f
	.xword	0x4afc8472940482ab
	.xword	0x0787b935b1ff76a4
	.xword	0x38c83e191d221ae4
	.xword	0xc8409ca0d4e2f8c5
	.xword	0x4773e1cf865e9b5b
	.xword	0xde78f10592701998
	.xword	0xd126c938b0116a4d
	.xword	0x6c12e6a8d679198d
	.xword	0x1f63402b5250fb99
	.xword	0x2e632576e906cdfa
	.xword	0x9f4b3bd8429008ac
	.xword	0x3bc84500649385a9
	.xword	0xdd63c854349fbc94
	.xword	0x9eb6de71770eebbb
	.xword	0x51163748ea194d76
	.xword	0xda8e9f7c19ac2ae1
	.xword	0xe9a61b481291afeb
	.xword	0xe09434f3466d473e
	.xword	0xb505d32f4be8bdce
	.xword	0x3149f8a37bb660ef
	.xword	0xb19a669a65749bf2
	.xword	0x78e092fef0c6ffee
	.xword	0xe150e86a9aefda1a
	.xword	0x1efde3d0d75f22a0
	.xword	0xc9931e62361e9675
	.xword	0x4102c30e92563af3
	.xword	0xf16c4e393cacc898
	.xword	0x6c16f719af12d3eb
	.xword	0x17a8f4383f80a950
	.xword	0xf8e6b42e8433dd1b
	.xword	0x6c3c4ed93677fc05
	.xword	0x0de5b1366688740e
	.xword	0x54c84de67dfb3f92
	.xword	0xd975d52896196bf1
	.xword	0x31f6319d113c777f
	.xword	0x4a1d1074145e93e0
	.xword	0x350049850ec8699b
	.xword	0x36b31c4f007619e6
	.xword	0x06d0f0a38e0af7c9
	.xword	0x515ad6c31245afb3
	.xword	0x16466df23776a7db
	.xword	0xde87d9446d33867e
	.xword	0x1f5ed79c8f58c96a
	.xword	0x1ace75b76b478aba
	.xword	0xc296c1871dc12b41
	.xword	0xb39a455d4104452d
	.xword	0x14aed92a2ef42c76
	.xword	0x24ce43c18aeec86a
	.xword	0x64b009997d398f73
	.xword	0xf5bae6f2551b8c1a
	.xword	0xee1153f1cfb2864a
	.xword	0x2842e615bc3647a8
	.xword	0xeb961a83408fc3d6
	.xword	0x68ca65ca08fb566e
	.xword	0x8a61063a3329bf06
	.xword	0x05108aeddf9af487
	.xword	0x01314657ab6ba960
	.xword	0xb458d390ee51c564
	.xword	0xb310fc75d96dd2d9
	.xword	0xca5959728b467a82
	.xword	0x4322413046bff136
	.xword	0xa9f60b06f42a853c
	.xword	0xe00983df758951d0
	.xword	0xe33c9f9d6ed2411e
	.xword	0xd52a59c3ca7a2a5b
	.xword	0x025cc89131e692da
	.xword	0xb6d2b095912f5e5d
	.xword	0xf870ca26f081dfa5
	.xword	0xfaf43df08b8a300f
	.xword	0x3f4df1ee1aa54e8a
	.xword	0x4e966f85ee0ce798
	.xword	0xfcabd94f1e0831ec
	.xword	0xececb6a5ac9feb52
	.xword	0xb7a8b0d26c0264fb
	.xword	0xbe3cdb6d94f409a4
	.xword	0x8c8021a83067d49c
	.xword	0x109276d8fd4c7888
	.xword	0x0040cb8c7dec4ab3
	.xword	0x0633c87ef21eab02
	.xword	0x9410f407635abedc
	.xword	0x518c7d1b8b468f9c
	.xword	0x52cd7466dc558e41
	.xword	0xf1fa6b42fcfeeb03
	.xword	0x687c1cc0e760ef12
	.xword	0x3a29e88a6c77d613
	.xword	0xfa6694efe04193f7
	.xword	0x911e51cbea47c1bc
	.xword	0x8d06c4db7ba21cde



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
	.xword	0x1060e1313b0599f6
	.xword	0x9a45ed284fd90ab7
	.xword	0x6fc0c7f5cf798901
	.xword	0xe2961402a8b2200a
	.xword	0xa4405456578e9c5a
	.xword	0x1cf8dbc80664c437
	.xword	0x77b6b9c25ceecbc2
	.xword	0xf535552f977abe83
	.xword	0x4e07a763d197f796
	.xword	0xf4c45a5fdca53527
	.xword	0x8d1ea9b2637b9d53
	.xword	0x4d877ba23c39c87f
	.xword	0x28253d874a98892f
	.xword	0x309d6bd9a6221f10
	.xword	0xc423cd58aa407eb7
	.xword	0x4a15cad50badc4d8
	.xword	0x736220be17b4d571
	.xword	0x4fc8eb020dfbf79d
	.xword	0x031127587f50623d
	.xword	0x4ae295e1b7d4e79a
	.xword	0xd3340d145360d16c
	.xword	0xb1eed34fc67a2316
	.xword	0x3ebcb6384c7e58b2
	.xword	0x51f6024947104905
	.xword	0x03ca4bbb41150ba8
	.xword	0x06f22d70f54b3fe9
	.xword	0xb8758634425e1bae
	.xword	0xea2ee502d58881cf
	.xword	0x81aba7ec50bbddbe
	.xword	0xeecbfeb378fd3268
	.xword	0x624c664afa730858
	.xword	0xc859bbb1e9abe204
	.xword	0xe3c6678dc700b0c8
	.xword	0x99473c2eaaa88d68
	.xword	0x6a1baf804b2cbebc
	.xword	0x9d7bc45f17e8e477
	.xword	0x39a0201e6439139e
	.xword	0xdaa24064ee0158bf
	.xword	0x17dc37ffcda5cbd9
	.xword	0x80b2796cb6236165
	.xword	0x0ef21072409b63b6
	.xword	0xa48b1d39f1461c3b
	.xword	0x58405e9daed2801d
	.xword	0xe0c7f65bd2887ed3
	.xword	0x9ed0c96a5ce66ce1
	.xword	0x5aec1aff06014a7f
	.xword	0x65026286b34c4ca9
	.xword	0xaa357ce873953f19
	.xword	0xb9bd73163b856a34
	.xword	0x4525e94bbf1319bc
	.xword	0x024ad7e5fe5c9f13
	.xword	0x9f7532c1d5b879f7
	.xword	0x74b3baa16740ad01
	.xword	0x42d2b3a11449974c
	.xword	0xaf5acd2fcc98b6e5
	.xword	0x847374a2f329f7d6
	.xword	0x7ad8db1d68f04498
	.xword	0x175c1793371644ad
	.xword	0xe592bc96135eddec
	.xword	0x9990414eaca3feaf
	.xword	0x974e3f2275c4d4fc
	.xword	0x6ced1b1cf299a2d7
	.xword	0xe33714e33f5d48b8
	.xword	0xedec68228b30567f
	.xword	0x28bcce2ec1217ac2
	.xword	0x36d315c96159ffbd
	.xword	0x3497a7971b1443e1
	.xword	0x1dfe9f46b447d4b0
	.xword	0x1ee3d8a2c36831b1
	.xword	0x086f88f3804a327c
	.xword	0x98e76e73dc816e4f
	.xword	0x918da42186a7f560
	.xword	0x66b7ed5afd0a2829
	.xword	0xc5e000f86d523d2b
	.xword	0xdd40e4d137fa404a
	.xword	0x56823d7298cffdde
	.xword	0x8100187206fa4a1e
	.xword	0xd25b3185dd7f50cb
	.xword	0xdc5314400fbf2d5e
	.xword	0xffe7c5ee34af8e8b
	.xword	0xdae891e83265d9e9
	.xword	0x17161329453ffbfc
	.xword	0xb2e47961ffceff4f
	.xword	0xb039b527b0156219
	.xword	0x644ef859c70bd2c2
	.xword	0x507f92cd01b88179
	.xword	0xd32feb5037dfc336
	.xword	0x4e6a58cda488f4e1
	.xword	0xed3c2c5455fd982f
	.xword	0x287c56722db5c571
	.xword	0xa56a11c16847f62d
	.xword	0x60470d305d330cf7
	.xword	0xcaff90303c36f0ca
	.xword	0xa3c37f99c83f2b1d
	.xword	0x1b98456965eedf0e
	.xword	0x7b003825ffc8fa8f
	.xword	0x8a9e6aa8f4ee335c
	.xword	0x35a99e7f97ae8ecf
	.xword	0x216be8c915467fbb
	.xword	0xf1c30e279ec55068
	.xword	0xe2b04ef55c785e22
	.xword	0x535b92aa1ef240e2
	.xword	0x172909d56b5fe040
	.xword	0x963c86cfdb0adb89
	.xword	0x79868863a0035154
	.xword	0x5c4ceef827001222
	.xword	0x1223da2dca021443
	.xword	0x5e57d118191cf549
	.xword	0x2463f640cbd15d09
	.xword	0xa7af07fbef3b8687
	.xword	0x6cb10ebf59a4f64c
	.xword	0xfae8caf94eec378c
	.xword	0x29e0fd7bcf3ee618
	.xword	0xad1dc9e23e845813
	.xword	0xb04f2c285485aed5
	.xword	0x18e4c83625758b19
	.xword	0x3f9c6089ca469209
	.xword	0xf1871b2dc63048ac
	.xword	0x0a130123d598d827
	.xword	0xdbe8f4098982143f
	.xword	0xbd4c1b21f1f2f4e0
	.xword	0xcb532ed52fb9cb8d
	.xword	0xdcb7bda6fa3520f7
	.xword	0x7f93b4bcb9a09899
	.xword	0x6f1928027a0cf7dc
	.xword	0xaef66941fcd95e4b
	.xword	0xa6076a63d12d106f
	.xword	0xb370a74597d11124
	.xword	0x7fcc814c79261ee4
	.xword	0xc3be8234b5ac4e6e
	.xword	0x9a5d4bda62d1c18e
	.xword	0x1e897b56d685a35a
	.xword	0x5f332ee81faecb4f
	.xword	0x072a1e464892c65b
	.xword	0x3bd33960f416916e
	.xword	0x3e94c454a4e11698
	.xword	0xb3ac043439ff4f09
	.xword	0x0faadab035535c04
	.xword	0xe361e13eef1eb2c9
	.xword	0x557ff4d52ec234fa
	.xword	0x0a7a3d06416a1aab
	.xword	0x1e467ebd1c4e2437
	.xword	0x313404eb8bbd2b4b
	.xword	0x0453e151e1923655
	.xword	0xec38edb2b0f6f58c
	.xword	0x5a3cf5390a013475
	.xword	0x8ee9c83209409eac
	.xword	0x84b281cee92089b5
	.xword	0x2e3ee826800557aa
	.xword	0x61a410c5ce1688a6
	.xword	0xbf24b730cfe299c5
	.xword	0x85e5ac33bae0a196
	.xword	0x5a3527e99253bafd
	.xword	0xb512e63f34488cc1
	.xword	0xf478f097aebf290d
	.xword	0x9a62cbd02de7ab1d
	.xword	0x7be8951c430dc541
	.xword	0x5bafd65e35b3b73a
	.xword	0x2cb6cc5b9e1ae30a
	.xword	0x6b80e30b345705de
	.xword	0x6f9044b164f0b32a
	.xword	0xe82be144b2a23844
	.xword	0xe1e637dc71e7c9fa
	.xword	0x6278b17d1d003365
	.xword	0xf9a9fa0196a8ec1c
	.xword	0xc0ad6c04fc966225
	.xword	0xa52b646424a9dbb5
	.xword	0x24112e9bfb218b46
	.xword	0xf2553bb57fc73fa8
	.xword	0x69f667df2cbcbad9
	.xword	0x1f33469cc7099b27
	.xword	0xbeb0c980246cc796
	.xword	0xf83c8584b2de1a90
	.xword	0x58236d431262b43f
	.xword	0x4c6e71fe26fb4cab
	.xword	0x2d4dc1af8502c70e
	.xword	0xeffb821af06d3577
	.xword	0x938eddfd1a599621
	.xword	0x03e542c6ef3b0f05
	.xword	0xf92612524c9f1f93
	.xword	0x02643be8849c8613
	.xword	0x3fe7fcb68e55bbf1
	.xword	0x22e887a54d90fc3e
	.xword	0xf357eb07628d5b86
	.xword	0x90a05ef1d3bd6608
	.xword	0xe8a7c861a2e76f76
	.xword	0x84f2c23ecfa8b7b9
	.xword	0x8a0b49fd792e8d96
	.xword	0xe26f5c33bcde56e1
	.xword	0x2083ec3a4addc950
	.xword	0xa8806fa97362c994
	.xword	0x5e814eaafa9f88e3
	.xword	0x4490ab1c8d9c1c29
	.xword	0x1b587803ee4279e8
	.xword	0xba5c392c25712cab
	.xword	0xd175f9c3c2b6adc9
	.xword	0x87fd9770fba9ed11
	.xword	0x63090e4f89c29283
	.xword	0x36ad405505a7911b
	.xword	0x343300eebbb29095
	.xword	0xda01efa3f9889c57
	.xword	0x9aa0affaed85bfbb
	.xword	0xe2a02a5f2c4fb2cc
	.xword	0xeb8cf72f2f124e22
	.xword	0xea6d936ea61714a1
	.xword	0xd878bf8d25a7bc49
	.xword	0x16c9ddd8ce9ddfd6
	.xword	0x641c2ac92f78d239
	.xword	0xb0560bab56300bb0
	.xword	0xe7237421d5dc4935
	.xword	0x5c3e55eeb005a28f
	.xword	0x8d73ccd78f2ad630
	.xword	0xd47fb08d24862691
	.xword	0xe0ad2c300c3384d4
	.xword	0x1d6bbb5314b5043c
	.xword	0x026c0f2afecde287
	.xword	0x007fe284cd7414b2
	.xword	0x2d176d155cfe8135
	.xword	0x5f994779d0c59b97
	.xword	0xe8665a2e91d74113
	.xword	0x5a0cc6154bdc8fb3
	.xword	0x1fd1d0355db704b7
	.xword	0xbf4ec4e6557252c9
	.xword	0xfe6bd09cfa4dede4
	.xword	0x03db6170fa383b52
	.xword	0xcb6e321f459ab650
	.xword	0x341f9403d77765ef
	.xword	0x5be94b94f54bfc6f
	.xword	0x9069d39b50c8a369
	.xword	0x973f98297b30e316
	.xword	0x10599b80047e989b
	.xword	0x8221c6f66764c766
	.xword	0x71fccc83e2a79dbb
	.xword	0x040c135ac61d4eea
	.xword	0x07ca8f9c4caf34cc
	.xword	0x2117cda021c4dab3
	.xword	0xd2bce982c48d7381
	.xword	0xc6d57d4571ecfb4b
	.xword	0xc58c3d76d004a38e
	.xword	0x8a651ab444f4a695
	.xword	0xd5f397795194759c
	.xword	0x2c5e440d3b0f29cb
	.xword	0x5068b4eabb9eb31f
	.xword	0x9a55d79ce5871075
	.xword	0xaf40c0309eac47cb
	.xword	0xd3cb0ef60eb19b52
	.xword	0xeb7302ab5d6b4404
	.xword	0xc0db3bda097626ee
	.xword	0x7194e0c684a04815
	.xword	0xd8301f6d31faa777
	.xword	0x59c358ff0e1fcfc7
	.xword	0x3b6f1f2c81168e56
	.xword	0xfb8480a70ed9e018
	.xword	0x4e98963bd2b21f5a
	.xword	0x79e5f354829fd94d
	.xword	0x79df03165eae91c1



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
	.xword	0xea401fdda5c9eeee
	.xword	0xc879bd5dff3542bd
	.xword	0x034d73d0a53fb79e
	.xword	0x05f6ca1d462513d9
	.xword	0x3cb1aa76d622d842
	.xword	0x9b52ad5281a23619
	.xword	0x401474387ec7b524
	.xword	0x2482dba0ecce49fc
	.xword	0x0e1ec57b93cdd404
	.xword	0xc893ae835cf673fe
	.xword	0x105d9fbd11a35cf5
	.xword	0xbd28cd42f229fa1c
	.xword	0x7e9be0d93a5d1dba
	.xword	0x16353c4bb7eea14a
	.xword	0x213dfc5e7da32562
	.xword	0x70a609d89b7ce8a3
	.xword	0x327a5690f4fd1f7f
	.xword	0xed9dd7a8ec27b88e
	.xword	0x1cb55c8665813c54
	.xword	0xd6dd9b5b1a2507f1
	.xword	0x3eeae62063fb0e49
	.xword	0xf799940805b7f6a0
	.xword	0xc31984f67a51a410
	.xword	0x528bdbafd439bae1
	.xword	0xa2b6a3640f3d3f6b
	.xword	0xcf3066dcc5995017
	.xword	0x61315ab9bb0c3cf7
	.xword	0x259d08ecda85cafb
	.xword	0xfbb0a570385b48f3
	.xword	0xf49c8c70041dae3f
	.xword	0x0374ddd0a487b212
	.xword	0x3894487e3d17b784
	.xword	0x34bb945b17eb25e4
	.xword	0x75b04f9abf90fa82
	.xword	0x5b66be11ea79067a
	.xword	0xca89cce802b0e72e
	.xword	0x178e50f97698a3c2
	.xword	0xe2429e9f2522d0de
	.xword	0x0745aedf4aeabdb0
	.xword	0x13dfd5cd5c3dfa14
	.xword	0x36943b861522eeef
	.xword	0xdbe703f99b268cc9
	.xword	0x6f6ce5655eb02078
	.xword	0xb243e432e33bef38
	.xword	0x734b4a64f607441e
	.xword	0x57f1347a6784b7ad
	.xword	0xcf90d70e011531b4
	.xword	0xf8beac0a5105a11f
	.xword	0xd5cd1a35ec4a6c52
	.xword	0x21e3d4486ffe9434
	.xword	0xa5e3729719929f0b
	.xword	0x9bededc99e5da47b
	.xword	0xf0a94f2feabc40a0
	.xword	0x08e5b2ffe93b5565
	.xword	0x510338662c9d5fa5
	.xword	0xca3405d769142d15
	.xword	0x72f4aea02d37b371
	.xword	0x9ca7c20eb7b5d994
	.xword	0xdb10ae0076be7c8d
	.xword	0x92169ec0c20ba8de
	.xword	0x7c3e028e656f8b2a
	.xword	0x834dd26002590161
	.xword	0x4718e34e493abe3a
	.xword	0x25c073e1382519bf
	.xword	0x3df4ef77bd71006c
	.xword	0xf324afee763705bb
	.xword	0x89873a9a7a5836e5
	.xword	0x7695d3da79388946
	.xword	0x49f91b5958eaeb03
	.xword	0xb3d88943e50a58cd
	.xword	0x05168507a65d82b1
	.xword	0x4c483f42e82b70bc
	.xword	0x9b9f676e4cf3eae8
	.xword	0x84eb97d852263879
	.xword	0x80280aa4cc24f7de
	.xword	0x20ec4c09f5f304e4
	.xword	0xfee80139a90a9cc3
	.xword	0x27460da1e53129ad
	.xword	0xa2e27861915fdff4
	.xword	0x822380e2912764e8
	.xword	0x09104eabe23e2be4
	.xword	0xf144f686c6cb2cbd
	.xword	0xbd8446a53d99d285
	.xword	0x71e8cb27a690f8db
	.xword	0x0e1691e7503ddfa6
	.xword	0xfa4f58422d62d820
	.xword	0x7c39b4fd6f52f622
	.xword	0xe2bad4843d2ee6da
	.xword	0x555f2b9d47cc3c86
	.xword	0xa570165862afec39
	.xword	0x981ab34df0e28efa
	.xword	0x0474caca61a3b34b
	.xword	0x6def1caa17a5981d
	.xword	0x249641830dbdb2e1
	.xword	0x73c8f15039dd1f59
	.xword	0xfe91b4d589a09d8a
	.xword	0xea168d16c1b916b7
	.xword	0x1872646bfc81983a
	.xword	0xa711720c38380f33
	.xword	0xb80fb7367d2fe4d3
	.xword	0xd4b0b78981c34675
	.xword	0xdf27a1159f25020c
	.xword	0x859f5f23f4c40100
	.xword	0x01e9a06576055a49
	.xword	0x7c16588fd0ca6739
	.xword	0x2874a2c03d759410
	.xword	0xe0be6cd1fffc3f21
	.xword	0xbf87a6263f09b677
	.xword	0xa7676881ac61bf56
	.xword	0x0dea8d3ceb650e92
	.xword	0x7d0a94106c174edd
	.xword	0xaa680d3671ce525d
	.xword	0xda8c79857a8fdc3f
	.xword	0x246717e60a66cba5
	.xword	0x5ac424ad93427210
	.xword	0x1d707cc2027cc8c0
	.xword	0x9433ffbaa8e07f5c
	.xword	0xa58a48b460db7669
	.xword	0xaf1abfb34d095769
	.xword	0xc316e8bbfab6ec4b
	.xword	0xf84dc05c7475fc24
	.xword	0x6320efc39f5df7d4
	.xword	0x2d8866bf553ee15e
	.xword	0xe12d0bc2a2cb051d
	.xword	0xfdcff44007e9d6d8
	.xword	0xc1f8b7e346075c43
	.xword	0x9957dd39bca37db9
	.xword	0x398dec8cea59161c
	.xword	0xdae17fc59e303460
	.xword	0x59c1e60e49eada13
	.xword	0x43ce8c7bd1153a17
	.xword	0x5e51409f40b1eab4
	.xword	0x27c622a062def402
	.xword	0x2d3883618f8393e4
	.xword	0x896b1625b1f6faff
	.xword	0x419774a80dc8e945
	.xword	0x8fcd6abb167a55a7
	.xword	0x3b2afd0abef7d81c
	.xword	0xe3fe5a0fc7733c27
	.xword	0xe5889b8688a10e79
	.xword	0x9d6d6a9e16e17811
	.xword	0x2d13647ccbb8ef3f
	.xword	0x35e77047f0e5116c
	.xword	0x25b7e232ac07cb26
	.xword	0x667c9eca264fe3c9
	.xword	0x4894bfbbcab3148c
	.xword	0x57c789f40edbb1b0
	.xword	0xbbd1fbe12776e928
	.xword	0x8f6505c608bf99f3
	.xword	0x730c302157ff477c
	.xword	0x86491e013ffc6094
	.xword	0xf15a0affe806fc2d
	.xword	0x3463e9cef3f5dd51
	.xword	0xf14cc93482c5ac47
	.xword	0x7d904a054996eaec
	.xword	0x291d9643adfb232e
	.xword	0x1ae1f2f2d4439aa8
	.xword	0x601022b215da59ae
	.xword	0x9697ac1727131476
	.xword	0xa368c752c0eff76d
	.xword	0x75a08c47513f2e8b
	.xword	0x69edab96ac7615b6
	.xword	0xea71b671045004ae
	.xword	0xbfd01216c504ccd5
	.xword	0xf63db00dd5334ed6
	.xword	0xf2c9098d17d520b2
	.xword	0xff10584a8ab080c2
	.xword	0x30176e3cba2d7975
	.xword	0x71a3adc1f4a00969
	.xword	0xa57a4632f40d6662
	.xword	0x74ce5eac3e9daa83
	.xword	0xefaa8ee85ea573bd
	.xword	0xace5186567c158bb
	.xword	0x3248df6de0e8026e
	.xword	0xda30f51385c21a8c
	.xword	0xbf6a6b9d3b945578
	.xword	0xd0a85f25fdab818f
	.xword	0x0b7971362e37db9e
	.xword	0x89e2ed72c079695e
	.xword	0x4207bc77a784f541
	.xword	0x4af60e7eccd14044
	.xword	0xe31eed35fcd84d48
	.xword	0x969d4f1566a3dfee
	.xword	0x22af08c8712860ba
	.xword	0x21410a6594df0c94
	.xword	0x190a62b354555009
	.xword	0xa5c62941151a74d2
	.xword	0x4f59a5991f39dafb
	.xword	0xcfdbc36d6011292e
	.xword	0xfd75ae2dbae28fbc
	.xword	0x5386af0ac0d01e26
	.xword	0x9373388f7cb13341
	.xword	0xe61a0f0cb7ad2060
	.xword	0x9f0ab6f3f87042a3
	.xword	0x0d00b293b5b49701
	.xword	0x63f3dd1a37664ba5
	.xword	0x1e57db09553e57fb
	.xword	0x6cd660295d5d1ade
	.xword	0x1e2974ef89f023b6
	.xword	0x59bbbbd98b4be8e7
	.xword	0x043e144d2fdfb9a5
	.xword	0xfa9a845208a3b9e4
	.xword	0x1d71face92226770
	.xword	0x6fc31fef3d998c1b
	.xword	0xefc13e25cd0e01b0
	.xword	0x8f3fdbee22fc40f2
	.xword	0x9557fed0fd270607
	.xword	0x565d81a055dbac73
	.xword	0xb94e57ed608cb19a
	.xword	0x62b4eae40716502d
	.xword	0x4cbbdbc809b58a2d
	.xword	0xe6e0690a9644cbd2
	.xword	0xe153e6dad8b62513
	.xword	0x7bf53db4af156d79
	.xword	0x1be39ced25e27fe0
	.xword	0x20d06e81468425f4
	.xword	0x1a62e5159d4a2cec
	.xword	0x8346f6f3fb9bf90c
	.xword	0xfb10d9cc3d4d161a
	.xword	0xf5e5e3b8a545878a
	.xword	0x41808a9360df42a1
	.xword	0x1fd5e747c06a656f
	.xword	0x269683bfd61e3025
	.xword	0x8bdbd29739ecf083
	.xword	0xe9ad9fc18d72ff1e
	.xword	0xf482a855842e4bdd
	.xword	0xb1605099336027b0
	.xword	0xdf3d30163bf964db
	.xword	0xba00cd768fc1c842
	.xword	0x3e70f87453c1bbd9
	.xword	0x5dadd770b79a87db
	.xword	0x459224f995f37d55
	.xword	0x055c37a61885e3fb
	.xword	0x70aaf622d5a77c1d
	.xword	0xce47864de0f9cfac
	.xword	0x1e79d4b7fad61c79
	.xword	0x80d5515e48d2b443
	.xword	0xa69510a4d87a235e
	.xword	0xd7a0e2ffab155c4f
	.xword	0xe457c1690e43f43e
	.xword	0x5bc56a7dd6995438
	.xword	0xbf1da278b8811655
	.xword	0x0c48e57817a7d284
	.xword	0x1011aa722665d81e
	.xword	0xb7a829ee994f1130
	.xword	0x4aeb9f005c9b2313
	.xword	0x18824c43aff1df8f
	.xword	0xa68ee44229f5d075
	.xword	0xf76d3717355dcfed
	.xword	0x576b43864f601ce7
	.xword	0x3c78cdac167510e1
	.xword	0x4d1571d1065b82cd
	.xword	0xbb4b62e10c8b5c5f
	.xword	0xedcc0920a7148eeb
	.xword	0x6f066f8bf514acea
	.xword	0xd257131748e277c0



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
	.xword	0x826a4a9bc52b848a
	.xword	0x827a71faa460b86a
	.xword	0x96253c2ea7490783
	.xword	0x4cedbc0c168e3205
	.xword	0x91e158c38a52b248
	.xword	0x9e093eefc7451cf7
	.xword	0x5970946a9386411c
	.xword	0x61be442fa08382e0
	.xword	0x5614fdf3847e149b
	.xword	0x59665b096f7cf67d
	.xword	0xf0be80c0b523eae2
	.xword	0xbf454f398ff9895f
	.xword	0x90986903067439c8
	.xword	0x342fd66440bc22dd
	.xword	0xf45534a852c17330
	.xword	0x1ab6e5cfb71af7fc
	.xword	0xa995c4959eef5a23
	.xword	0x3ad3abb83f0ac4ac
	.xword	0xe5f71c8519b7f62e
	.xword	0xa74a3fef7c96ee2e
	.xword	0xda68ed968508765c
	.xword	0x1618fc1c79d49983
	.xword	0x820a8b8f7b9c5410
	.xword	0x90ad21f7bf701ceb
	.xword	0x877d61dfb6110491
	.xword	0x975e30026ea441e8
	.xword	0x049e7c395bb10406
	.xword	0x24dd779c60639f69
	.xword	0xd67fb270ac3eca6b
	.xword	0x67b868cdd62bf087
	.xword	0xbacb0e132f0f0167
	.xword	0xcff40e4766227bdd
	.xword	0xd328b96131355a3f
	.xword	0xea1c9a2ab462402f
	.xword	0x977de00f829515e1
	.xword	0x0d911aca1ed38c30
	.xword	0x050040dd4886b457
	.xword	0x9da1f3c950e49f8e
	.xword	0xb6e56694d050907a
	.xword	0xff1b23fc5e4f3b89
	.xword	0xbeb82755e954a2a4
	.xword	0x7b66f9acadb75a8f
	.xword	0x5b9c0448c23eee7e
	.xword	0xd1248bcaa1ac866e
	.xword	0x3cb159ef70763043
	.xword	0x73a6f5dd37146c40
	.xword	0x855f46dfddc65d07
	.xword	0x3038930d27d3801c
	.xword	0xb0e68be5b08d3eaf
	.xword	0x4274b52cc5baf119
	.xword	0x9463ee04df03a092
	.xword	0x6e24fe114d1de857
	.xword	0xaf7f7375427790fa
	.xword	0x25519bc5483d13ac
	.xword	0xbdbc7462f8053a62
	.xword	0x33cd82be239dc305
	.xword	0x6705fe374faeb5d9
	.xword	0x3586a87bbc047887
	.xword	0xaed7840338842cd0
	.xword	0x5747c8bf68822010
	.xword	0x30c77e7e92e412af
	.xword	0xa89de74358bcb98b
	.xword	0x9aca02bd094d93af
	.xword	0x8396f1de66753c50
	.xword	0xcfddb249001bb570
	.xword	0xe6e29870f1e3b537
	.xword	0xc14d2fcc061fa2b5
	.xword	0xaabde73ae12ced82
	.xword	0x3534e146d5cff0a7
	.xword	0x783bb5ddca169d3d
	.xword	0x16be9752bb91a612
	.xword	0x175c18c4214fd7df
	.xword	0x09d629a85761c725
	.xword	0xfadafe16126f3a70
	.xword	0x944d34c16a125ca2
	.xword	0xe2706817f9ca1041
	.xword	0xca8124c9191ea09b
	.xword	0xb2c384f4a1782b0d
	.xword	0xe64c6e2dd44eba62
	.xword	0x69e1b41ad7251849
	.xword	0xeb3127bd0bc3832a
	.xword	0xa3c3a1fe693bd174
	.xword	0x28dcb7990ae93270
	.xword	0x2a8f4bba54405ba0
	.xword	0xfba77304424d27b4
	.xword	0x2dc3c8e545a42cde
	.xword	0xb2c950f49ed41b9c
	.xword	0x6a9e5e7794f7cd7b
	.xword	0x452caa94d5cd6b4e
	.xword	0xa9c53b76b51ca503
	.xword	0x23f191b0957ee237
	.xword	0xb96d30aff6c1f925
	.xword	0x4e09e89d48f6aece
	.xword	0xc7be233621bf7f76
	.xword	0x40dcc89fb53f5ee7
	.xword	0x446da0696dda414c
	.xword	0x79b546b7559056a9
	.xword	0x4b105a09ee708714
	.xword	0xc2b5f36c50228288
	.xword	0xe5813d68e9e7f500
	.xword	0xa7b80b96ed154e54
	.xword	0xa76c5863f8e07a85
	.xword	0x7dcf1fd86d60f6b9
	.xword	0x3e155b415041a590
	.xword	0x947ed59af431ced5
	.xword	0x95c93624ce43bc57
	.xword	0x5f4885a6a497436a
	.xword	0xa6fc09d516cf8aa8
	.xword	0xcfd00310098cdd9a
	.xword	0xfeb786d4513bcc57
	.xword	0xf9bba642f6cc7252
	.xword	0x26399daea1d215fb
	.xword	0x91a64fe516ef7f38
	.xword	0x3152a9c8d4d9c3b7
	.xword	0x930a4b70f51965b4
	.xword	0x37d63d1973726dd6
	.xword	0x69af1ef0b5e02094
	.xword	0x897c27c829c86496
	.xword	0x5849f89f9f24092b
	.xword	0xc94b4a6fb28c4a76
	.xword	0xef41edae35730b29
	.xword	0xe130f25e3bb7f761
	.xword	0x88b633be57a4333e
	.xword	0xdc2406c52007fad5
	.xword	0xaecfbcf6abe0ac5a
	.xword	0x81dc60ab1341b8a7
	.xword	0x199cad82795f6893
	.xword	0x1de5d750a9f2b25d
	.xword	0xd9e466ec4c792681
	.xword	0x92d37df1778e1180
	.xword	0xcb98b047caa0b083
	.xword	0xf1b7ddab6cffb61d
	.xword	0xae02bf02a4edf079
	.xword	0xf1f42c174c3c8d61
	.xword	0x9e0f77d9ab2cefc4
	.xword	0x66609e3b725a6972
	.xword	0xb5df4d48075bf337
	.xword	0x7c785a699cb1e575
	.xword	0x7356ab74d5b0c8af
	.xword	0xdb93fec57b890909
	.xword	0x05635f0f24867b51
	.xword	0xf90426f541563747
	.xword	0xc6a61acac41f01e6
	.xword	0x5e05a58c5526ef0d
	.xword	0xcd2ba14e5aad9d94
	.xword	0x216720a1d7280ce1
	.xword	0xf3c2e138bb5b4a30
	.xword	0x7f733065dcbbf75a
	.xword	0x1c23f57198738636
	.xword	0x9ec7e51a5314eb96
	.xword	0xc1dcf013a08e2f9d
	.xword	0x3468f7c1b1cf156e
	.xword	0x6fc0b1fb610dab37
	.xword	0xd75afbe3329349d7
	.xword	0x87dd42ad5ea27328
	.xword	0x7344b6f5fd1eff37
	.xword	0x1efc419df65f3013
	.xword	0xf56a9c89cef67efc
	.xword	0xaa2c1322bcb884c1
	.xword	0xc168868233345c8d
	.xword	0x0a421fe9654013d2
	.xword	0xf0a74291c6e6e9c5
	.xword	0x167151ea21a5c0a8
	.xword	0x519d50252df71924
	.xword	0xf848b509a3e1e014
	.xword	0xb966bf2dcf1ee0ac
	.xword	0x58402c22817562fc
	.xword	0xabc8ff80215715b9
	.xword	0x69a491c590a96fb2
	.xword	0x1c65f50f35b33f52
	.xword	0x4644c2ca8ff333e1
	.xword	0xd8977c5c72b025ba
	.xword	0xd3283dd66a66ad37
	.xword	0x3e4a656369c9eaf0
	.xword	0x6b0fae8e9c588744
	.xword	0x1645da951b2c69cb
	.xword	0x791e5293d04c5ec0
	.xword	0xbaef74497a705608
	.xword	0x8590237962ae7626
	.xword	0x728647560caa935b
	.xword	0xaad1cc3bbe6b5f12
	.xword	0xf45b651b43963cfc
	.xword	0x9f632abfea308a58
	.xword	0x6fd4f6bcde4d576c
	.xword	0x0dc2def38e46825c
	.xword	0x9e53f8b88add03a2
	.xword	0x1988a57cc188708d
	.xword	0xc533b338c17bde60
	.xword	0xd9b8c8a196aa2375
	.xword	0x87ac528a6ef1d73c
	.xword	0xd1184f73a496a559
	.xword	0x50a809c3698330fa
	.xword	0x815e16db1b2ea27d
	.xword	0x6fe1e612aba824fa
	.xword	0x48a97c4597bd8e4a
	.xword	0x36679a8661de76f2
	.xword	0x11fac004a50454d6
	.xword	0x7f6a029b71423080
	.xword	0x07dac7bd4bb8f5f7
	.xword	0xc29a93d8d845f6c4
	.xword	0xee861ec46bccb3de
	.xword	0xefcff5f48b407269
	.xword	0xa93270c13e14b516
	.xword	0xd2fc6ced2d763778
	.xword	0x318235b46fc5b1c3
	.xword	0xeb41c988f5bfa3ec
	.xword	0xc90e2f28ec0286d1
	.xword	0x3267225440afb333
	.xword	0xcb813a108ca8238d
	.xword	0xb130a8bb912df5bc
	.xword	0xeffe7da33ead485b
	.xword	0xa937ef24fdfca070
	.xword	0x66d600e10c3d8d5f
	.xword	0x4046c1b6f7aa84c1
	.xword	0xf6a0d654d090f65d
	.xword	0x92ca114b345fd037
	.xword	0x3f51db9a480e9a80
	.xword	0x1dd8b661522505e9
	.xword	0x9494bbaa2680c4ca
	.xword	0x8b1e3d19a5d70027
	.xword	0xd9349b3ceaafdc70
	.xword	0x4b4b6313238e3edf
	.xword	0x8ecd57d522e1f41e
	.xword	0x4736c368fe86142d
	.xword	0x1e2829a5b8dd705d
	.xword	0x18ddadf7d3c2186f
	.xword	0x3599778db4c630c3
	.xword	0x216e94eb7b2e9ac6
	.xword	0x1d1f706baba3eb96
	.xword	0xbacd6203c2da0d71
	.xword	0x30c43322b9a3f16d
	.xword	0x29a12536ea7ed44f
	.xword	0x05bd3e265fbbbe2f
	.xword	0xcca4f82ddd6a680a
	.xword	0xf22cb08ab0a8e126
	.xword	0x425397ec9c2f1107
	.xword	0x8b6bcde6c912433c
	.xword	0x9ebfb30960a63613
	.xword	0xcb068c42712d0a92
	.xword	0x3146e42a1677e7f2
	.xword	0xee1560ec29ab6bf9
	.xword	0x86f23a5f3291330b
	.xword	0x102cc1e50dcb79ac
	.xword	0x3670843dc0bc81d9
	.xword	0x47e444e888d71416
	.xword	0x88a572a68a5825a0
	.xword	0xafe3a8160c784040
	.xword	0xb210244afd0a39fa
	.xword	0xfde07452d05e0391
	.xword	0xc94c7db6ea58aadd
	.xword	0x1a84f2d9054c8f43
	.xword	0x06c9a9d75129067c
	.xword	0x988b85d074d04a8f
	.xword	0x4d5d565ed8075e64
	.xword	0x79e172c98c6b7f5d
	.xword	0x79cb189980d11f58



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
	.xword	0xf4b03244c58e1ba0
	.xword	0x9447e68bd1c3483b
	.xword	0x8dc5f645e12f869e
	.xword	0x33e478052548df50
	.xword	0x659f031ab71b7279
	.xword	0x8a8869cb8a92e8c5
	.xword	0x3e99fe149d349607
	.xword	0x8e0a5292984ee38b
	.xword	0x57492ab45e5ce627
	.xword	0xc3d9cc4caed079d3
	.xword	0x45d8aa09cde56fb4
	.xword	0x00a929cc4cc83d94
	.xword	0x3df5422dbeaf81f8
	.xword	0xda33ab85ecc5e528
	.xword	0x5b60d0f4a060f2fd
	.xword	0xdf2cb0610955798d
	.xword	0xaf6a33231d326ed3
	.xword	0x39ed648b2625157d
	.xword	0xf694adc853b18c20
	.xword	0x741c533f593db3ec
	.xword	0xec7be15ca1f5f0d9
	.xword	0x7f3ce6ffe0e1f9f7
	.xword	0x7bb24cd1448d3934
	.xword	0x2987088b76998a94
	.xword	0xedf624830afec8f6
	.xword	0x51ce20e6f92a6dac
	.xword	0x31b3680a15e7c220
	.xword	0xaf0eea39bbce9292
	.xword	0xe00fb0a76fd0aede
	.xword	0x76f2754716a32b73
	.xword	0x8b7c55c5f427e72c
	.xword	0x1318f9b65be77cc2
	.xword	0x86dc790a752e54dc
	.xword	0xae332721f3eb1c6f
	.xword	0x59d4bc489d841956
	.xword	0x12ff7294f5109b55
	.xword	0x1e59d9e8048134a3
	.xword	0xa4604628e3ab0157
	.xword	0x281e2dacfd34dd16
	.xword	0x33c86dccc64bd91c
	.xword	0xbda7162d79b987f9
	.xword	0xbd2d5cb199674074
	.xword	0x95a7b4ec6e4ec8dc
	.xword	0x2de964f6407a18ca
	.xword	0xe60fe2e3e777a33f
	.xword	0x6c8162df34748d47
	.xword	0x30d72d4c1270741c
	.xword	0xeddc542b40042205
	.xword	0xceb5f5722a8a86ad
	.xword	0xd746b7e6b1e10d54
	.xword	0xe7e74c167d834f6a
	.xword	0x0399c24b55767e22
	.xword	0xab41c63bf8409b70
	.xword	0xa81da56c4a146f57
	.xword	0x05f907c3b8c32f62
	.xword	0x66a2be09baa6fc1f
	.xword	0x119341792c3dfe88
	.xword	0x2bf6656f57887dc8
	.xword	0x119e827f16c00634
	.xword	0x56e92a82c6d91c83
	.xword	0xf53b753e96a4676a
	.xword	0x42fc105a8154ed9d
	.xword	0x32a6531568c2bef4
	.xword	0xbbcfd4823a048bb5
	.xword	0x943987f735e79128
	.xword	0x208f56f63dc5c387
	.xword	0x7bc6545650f443ef
	.xword	0xe0bb3e5ebe951618
	.xword	0x577df9f2cb8f716e
	.xword	0x2b5829ace0a29543
	.xword	0xf75d4367929f7a33
	.xword	0x3ccead3db8f3bee6
	.xword	0x650a4189f227efad
	.xword	0xdd9ceb3553c61b95
	.xword	0xf4eabb02334e06f3
	.xword	0xff9d7fb27eefb6b6
	.xword	0x10948eed70440016
	.xword	0xaf9f971a2a953e03
	.xword	0xe857351785faa2d6
	.xword	0x8b0153ad690f0076
	.xword	0xd5bf88e2b95d88a4
	.xword	0x667f86a3678c4843
	.xword	0xbeaa9f7fff41ab51
	.xword	0x99331435536b7820
	.xword	0x9e50edcb6989b1bc
	.xword	0xe435de030c60ee6a
	.xword	0xbc6f3d2ce043dd13
	.xword	0x1c40955d41eda72c
	.xword	0x9e11798400703185
	.xword	0x4854773150930bac
	.xword	0xc8916acfe63af783
	.xword	0x0a366dc1f370abaf
	.xword	0x570bc94732f37650
	.xword	0xa73abed0c4baa3da
	.xword	0x0568eae08a38b4db
	.xword	0x52901ecce2b54320
	.xword	0x63fc44ff2ec30a03
	.xword	0x0e076af7a369882f
	.xword	0x34cee9b26c239938
	.xword	0x44842b618803eb2e
	.xword	0x49f55b41d8444ce0
	.xword	0x0823dfc4ace1b4c5
	.xword	0xc3ec25eb8424d05e
	.xword	0x4a6f50f42f4759e5
	.xword	0x81c9a868acad7eda
	.xword	0x653bb226f3f69505
	.xword	0xc4faf280ada7614a
	.xword	0x2a54259b65485255
	.xword	0xe65c3ca3f92e4469
	.xword	0xa5a67600d130b81b
	.xword	0xe654b2e37e9e1019
	.xword	0x7dc869982c6dcfee
	.xword	0x15b6708789293853
	.xword	0x7dc9d69a32e0b65d
	.xword	0x9cb109b5c4aa428d
	.xword	0x2667099140e16c38
	.xword	0x4a13817c429d6595
	.xword	0x3fb40dae35336188
	.xword	0x93cdb85f8b7e854d
	.xword	0xfba1703535860896
	.xword	0x97a1e12a17351257
	.xword	0x727ced202d726b04
	.xword	0x70fd94c629f4eaa7
	.xword	0x625c10089e0a4633
	.xword	0x17c65670dffda6d5
	.xword	0xa6f92043e23843de
	.xword	0xf13a26a4283f6ac9
	.xword	0x3bac3eeb905d9733
	.xword	0x3c6b236b09cdb65d
	.xword	0x6ea14cb098579236
	.xword	0x7bd9254fb5cce483
	.xword	0x398a482a747dbaae
	.xword	0xedfa1572b5b0753c
	.xword	0x3d6517bec8fe1146
	.xword	0x09e4d95afaaaa385
	.xword	0x14d410c05af04095
	.xword	0x9ff2cc5bc8124cc1
	.xword	0xe35fbdf4f85a1b3d
	.xword	0xbe435dedd525ba24
	.xword	0xb77e00c9443558f3
	.xword	0x6308402a6f6d362e
	.xword	0x425c33a8faec09dd
	.xword	0xe61b9f7b65b5ff9f
	.xword	0xde448873873f5add
	.xword	0xc11729127a3c6fbb
	.xword	0xbab45db72efbabc4
	.xword	0x4a6183bee97a37fe
	.xword	0xd95fde60ab60678c
	.xword	0x95c5995fe5708fdb
	.xword	0x3052f584f58ca588
	.xword	0x4ad5a7cea84bd376
	.xword	0xa2915eceea55f167
	.xword	0xa2e765f8de5607be
	.xword	0x1111c382d26d3673
	.xword	0x5999412a5fe45e2b
	.xword	0xe20c8d6418d3027a
	.xword	0x7ea12b451eb34c0a
	.xword	0x07d69399cda3c0a1
	.xword	0xf8467bbecac5dda7
	.xword	0x3ac4d797f7fcf4fb
	.xword	0x1a67507a10939020
	.xword	0xf8fd7307b4ce5296
	.xword	0xd9c20c3f9f39e19b
	.xword	0x7e73b27483e7ff43
	.xword	0xfe670ba3cc326932
	.xword	0xf018184d9259a2c6
	.xword	0xe4541be117571ff9
	.xword	0xb0cf5d5c94a10a25
	.xword	0xaff47b8d00973577
	.xword	0x7edfe49dd1325df3
	.xword	0x5703afba66d52616
	.xword	0x2bcb75fd7629add2
	.xword	0x77c275695f31e3a7
	.xword	0xee68115ddb82a3af
	.xword	0x57ad09e66463e448
	.xword	0x1be77620d79b1daf
	.xword	0x3e851d0f43b8c521
	.xword	0xa329517ea50e9d3f
	.xword	0x82bbd056af5db8d4
	.xword	0x9b7529cf29ce7963
	.xword	0x08a4901cf041ee2a
	.xword	0xac0987932618a7a8
	.xword	0xc30eee064257a989
	.xword	0x58ab5d58a799126c
	.xword	0xfa171161e5485a8b
	.xword	0x18ab4197b1cf98e3
	.xword	0x505328b47f3a45b7
	.xword	0x7d4876713a606c5a
	.xword	0x05e768876665641b
	.xword	0x1b982b257a41198c
	.xword	0x82adda0f86916d69
	.xword	0x6975c3104d82797d
	.xword	0x35e7b0f8724a9de5
	.xword	0x0fd51ada20849ba6
	.xword	0x76426bc9a102e76b
	.xword	0xf516e0a2c99cc742
	.xword	0x037ad91c9bb65e27
	.xword	0x5d61fa58d9fe55ad
	.xword	0xcc5c262e02c012a1
	.xword	0x580920eda510bd9a
	.xword	0xfb249ecb2cf2d1c9
	.xword	0xf8ef297f685445dc
	.xword	0xa75cd32032f472c5
	.xword	0x85c9bd297a74ab76
	.xword	0x45db5856e5508384
	.xword	0x189bf74a374d88e8
	.xword	0x2e91d5aef94b10e1
	.xword	0xb08b26aead294b92
	.xword	0xd62b712d8a480543
	.xword	0xca5f00fc0cdbbe2a
	.xword	0x142c53c6d1ac21e9
	.xword	0x66ec20c56fe59dcd
	.xword	0x3a10792c1d027a7e
	.xword	0x1bd9b159c1046dc4
	.xword	0xa666641dcc39248e
	.xword	0x4d2afcc426d83f2a
	.xword	0x497201d1d715f235
	.xword	0x94db057cfb55d2d0
	.xword	0xabf1a1979cf7786f
	.xword	0x5db464825e231aef
	.xword	0xacaaf908ab11ed83
	.xword	0x593f1202ae292e72
	.xword	0x9c12a04bddb1957f
	.xword	0x000160dd243d117d
	.xword	0x08f1227d707c063d
	.xword	0x1d9576fa8c149dae
	.xword	0x019b2ef64e2334e2
	.xword	0xdea0fa6a0f1c5260
	.xword	0x30a9f6931f07fcb6
	.xword	0x4ecb2c7fbc83906f
	.xword	0x6278b48f79f7d6f4
	.xword	0x93b39d95cf714377
	.xword	0x75288222440cd1f7
	.xword	0x73fabdb22ae69a96
	.xword	0xa3faaff2f9dddab9
	.xword	0xce9c3a866a40a78c
	.xword	0x58e7dcaf3fe96d5c
	.xword	0x5298b838e70183cd
	.xword	0x22a8d6384f039e3e
	.xword	0x88349690724b85f2
	.xword	0x3082eca64cfdc56c
	.xword	0xbefdd63c8b15f808
	.xword	0x93168820dcb3766a
	.xword	0xe522c089977f6ec6
	.xword	0x84aa8788fc38d1e7
	.xword	0x027e5969cb9ba2e3
	.xword	0x2a64958d83411019
	.xword	0xd9350bc5eff1ce73
	.xword	0x3e18aee74652fccf
	.xword	0xc4c5d19c30e439a1
	.xword	0x22f6bc6541f64efb
	.xword	0xb21cf5676d66408f
	.xword	0x0ae9420abb46d2d1
	.xword	0x7837c5cad79b0c89
	.xword	0xedfd2d9941865a01
	.xword	0x7d13cc856392f74e



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
