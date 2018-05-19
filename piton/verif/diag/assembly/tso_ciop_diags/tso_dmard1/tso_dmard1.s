// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_dmard1.s
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
/***************************************************************************
***
***  Test Description :  DMA testing
***
**********************************************************************/
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
loop00:	
	ldub	[%l1 + 0xbf], %l3
	setx	0xf0, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	loop00
	nop

	ldub	[%l1 + 0xbe], %l3
	setx	0xbe, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end

	ldub	[%l1 + 0xbd], %l3
	setx	0xbe, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end

	ldub	[%l1 + 0xbc], %l3
	setx	0x9e, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end
	nop

	ld	[%l1 + 0xb8], %l3
	setx	0x9abababa, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end
	nop


loop01:	
	ldub	[%l1 + 0xff], %l3
	setx	0xf0, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	loop01
	nop

	ldub	[%l1 + 0xfe], %l3
	setx	0xbe, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end

	ldub	[%l1 + 0xfd], %l3
	setx	0xbe, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end

	ldub	[%l1 + 0xfc], %l3
	setx	0xce, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end
	nop

	ld	[%l1 + 0xf8], %l3
	setx	0xcabababa, %l0, %l2
	subcc	%l3, %l2, %g0
	bnz	bad_end
	nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
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

/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================

!=====================
! prepare the data for SJM 4.
!=====================
setx 0x1111111122222222, %g1, %g2
setx 0x1170000000, %g1, %g3
stx %g2, [%g3]

setx 0x3333333344444444, %g1, %g2
setx 0x1170000008, %g1, %g3
stx %g2, [%g3]

setx 0x5555555566666666, %g1, %g2
setx 0x1170000010, %g1, %g3
stx %g2, [%g3]

setx 0x7777777788888888, %g1, %g2
setx 0x1170000018, %g1, %g3
stx %g2, [%g3]

setx 0x99999999aaaaaaaa, %g1, %g2
setx 0x1170000020, %g1, %g3
stx %g2, [%g3]

setx 0xbbbbbbbbcccccccc, %g1, %g2
setx 0x1170000028, %g1, %g3
stx %g2, [%g3]

setx 0xddddddddeeeeeeee, %g1, %g2
setx 0x1170000030, %g1, %g3
stx %g2, [%g3]

setx 0xbababababebebef0, %g1, %g2
setx 0x1170000038, %g1, %g3
stx %g2, [%g3]

!=====================
!prepare the data for SJM 5.
!=====================
setx 0xf1111111f2222222, %g1, %g2
setx 0x1170000040, %g1, %g3
stx %g2, [%g3]

setx 0xf3333333f4444444, %g1, %g2
setx 0x1170000048, %g1, %g3
stx %g2, [%g3]

setx 0xf5555555f6666666, %g1, %g2
setx 0x1170000050, %g1, %g3
stx %g2, [%g3]

setx 0xf7777777f8888888, %g1, %g2
setx 0x1170000058, %g1, %g3
stx %g2, [%g3]

setx 0xf9999999faaaaaaa, %g1, %g2
setx 0x1170000060, %g1, %g3
stx %g2, [%g3]

setx 0xfbbbbbbbfccccccc, %g1, %g2
setx 0x1170000068, %g1, %g3
stx %g2, [%g3]

setx 0xfdddddddfeeeeeee, %g1, %g2
setx 0x1170000070, %g1, %g3
stx %g2, [%g3]

setx 0xfabababafebebef0, %g1, %g2
setx 0x1170000078, %g1, %g3
stx %g2, [%g3]

/***********************************************************************
 IOSYNC cycles to start sjm again
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]

done;

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end
