// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ncrdwr6.s
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
***  Test Description : This diag is testing strong ordering of IO accesses.
***  It will do a bunch of stores and then do an IO load to a different address
***  The IO load must wait for the stores to go to the IO buffer before
***  the load can show up on the PCX interface.
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
        wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

	ta	0x30

	setx	user_data_start, %l0, %l1	! user data start
	setx	ncdata_base, %l0, %l2		! nc data base
	setx	0x1000, %l0, %l3		! nc datawork area
	add	%l2, %l3, %l2

	mov %g0, %g4
	set 0x1, %g2
	set 0x10, %g5

	st	%g2, [%l2 + 0x100]		! NC store

stloop0:
	stx %g2, [%l1  + %g4]			! a bunch of cacheable store.
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop0
	nop

	st	%g2, [%l2]			! NC store
	ld	[%l2 + 0x100], %l3		! THIS LOAD SHOULD WAIT!!!

	mov 0x78, %g4
	set 0x10, %g2
	set 0x10, %g5

ldloop0:					! some checks
	ldx [%l1 + %g4], %g1
	subcc	%g2, %g1, %g0
	bne	bad_end
	nop
	dec %g2
	sub %g4, 0x8, %g4
	deccc %g5
	bne ldloop0
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
.align 0x40
user_data_start:
	.skip 1000
user_data_end:


SECTION .NCDATA  DATA_VA=0xd01ee000 

attr_data {
        Name = .NCDATA,
        VA=0xd01ee000,
        RA=0xcf00bee000,
        PA=0xcf00bee000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base
ncdata_base:
	.skip 1000


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


