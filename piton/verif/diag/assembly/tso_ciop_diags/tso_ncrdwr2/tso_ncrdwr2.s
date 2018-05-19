// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ncrdwr2.s
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
***  Test Description : NC loads and stores including block loads and stores
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
        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	th_fork(th_main, %l0)

th_main_0:
	ta	0x30

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
! Now some NC writes and reads
!=====================
mov %g0, %g4
set 0x1, %g2
set 0x10, %g5

stloop0:
stx %g2, [%g3 + %g4]
inc %g2
add 0x8, %g4, %g4
deccc %g5
bne stloop0
nop

mov 0x78, %g4
set 0x10, %g2
set 0x10, %g5

ldloop0:
ldx [%g3 + %g4], %g1
subcc	%g2, %g1, %g0
bne	h_bad_end
nop
dec %g2
sub %g4, 0x8, %g4
deccc %g5
bne ldloop0
nop

!================================
ldda [%g3]ASI_BLK_P, %f0
add %g3, 0x40, %g3
ldda [%g3]ASI_BLK_P, %f16
stda %f0, [%g3]ASI_BLK_P
stda %f0, [%g3]ASI_BLK_P
stda %f0, [%g3]ASI_BLK_P
stda %f0, [%g3]ASI_BLK_P
stda %f0, [%g3]ASI_BLK_P
stda %f0, [%g3]ASI_BLK_P
stda %f0, [%g3]ASI_BLK_P
sub %g3, 0x40, %g3
stda %f16, [%g3]ASI_BLK_P
membar	0x40
!================================

!================================
ldda [%g3]ASI_BLK_PL, %f0
add %g3, 0x40, %g3
ldda [%g3]ASI_BLK_PL, %f16
stda %f0, [%g3]ASI_BLK_PL
sub %g3, 0x40, %g3
stda %f16, [%g3]ASI_BLK_PL
!================================

set 0x10, %g5
mov %g3, %g4

loop6:
ldda [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P, %l0
inc %l0
inc %l1
add %g4, 0x10, %g4
stxa %l0, [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P
stxa %l1, [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P


deccc %g5
bne loop6
nop

!================================

set 0x10, %g5
mov %g3, %g4

loop8:
ldda [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE, %l0
inc %l0
inc %l1
add %g4, 0x10, %g4
stxa %l0, [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE
stxa %l1, [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE


deccc %g5
bne loop8
nop

!================================
!================================
set 0x10, %g5
mov %g3, %g4

loop11:
ldda [%g4]ASI_NUCLEUS_QUAD_LDD, %l0
inc %l0
inc %l1
add %g4, 0x10, %g4
stxa %l0, [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P
stxa %l1, [%g4]ASI_BLK_INIT_ST_QUAD_LDD_P

deccc %g5
bne loop11
nop

!==================================

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


