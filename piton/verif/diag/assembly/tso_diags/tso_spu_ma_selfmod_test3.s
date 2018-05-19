// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_spu_ma_selfmod_test3.s
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
***  Program File: tso_spu_ma_selfmod_test3.s
***
***  Description : one thread performs SPU loads and stores to an address
***  Other threads perfrom normal loads and stores to this address.
***
**********************************************************************/

#include "spu_diag.h"
#include "enable_traps.h"

! These *Trap_Instruction* defines redefine macros in the boot code.

#define H_HT0_HTrap_Instruction_0 user_spu_load_mamem_sub
#define H_HT0_HTrap_Instruction_1 user_spu_store_mamem_sub

#define SRC_BASE_RA MAIN_BASE_TEXT_RA
#define SRC_BASE_PA ra2pa(MAIN_BASE_TEXT_RA, 0)
	
#define MAIN_PAGE_HV_ALSO
#define MAIN_TEXT_DATA_ALSO
#include "boot.s"

! This macro will initiate an SPU Load MA Memory operation.
! The Load MA Memory operation moves data from main memory to
! MA Memory.
! This trap will go to hypervisor. The arguments to the trap
! are as follows:
! %i0: Size of load minus one (in xwords)
! %i1: Value for the MPA register, which is the main memory physical adr
! %i2: Xword offset into MA memory for the load data to be written.
! %i3: Thread id of the thread calling this trap.
! The result of the ldxa from MASync is returned in %i0. This value
! will be zero if the operation completed. If the operation was aborted,
! the value will be 1.
! Note that the size of MA Memory is 160 xwords, so the values
! provided for the size of the load and the offset must be within
! the bounds of 160 xwords.
! The T_HTRAP_INST0 will go to H_T0_Trap_Instruction_0 above to
! supervisor code, then trap to hypervisor.

define(user_spu_load_mamem, `
        ta T_HTRAP_INST0
')dnl

! This macro will initiate an SPU Store MA Memory operation.
! The Store MA Memory operation moves data from MA Memory to
! main memory.
! This trap will go to hypervisor. The arguments to the trap
! are as follows:
! %i0: Size of store minus one (in xwords)
! %i1: Value for the MPA register, which is the main memory physical adr
! %i2: Xword offset into MA memory for the store data to be read.
! %i3: Thread id of the thread calling this trap.
! The result of the ldxa from MASync is returned in %i0. This value
! will be zero if the operation completed. If the operation was aborted,
! the value will be 1.
! Note that the size of MA Memory is 160 xwords, so the values
! provided for the size of the store and the offset must be within
! the bounds of 160 xwords.
! The T_HTRAP_INST0 will go to H_T0_Trap_Instruction_1 above to
! supervisor code, then trap to hypervisor.

define(user_spu_store_mamem, `
        ta T_HTRAP_INST1
')dnl

!-------------------------------------------------------------------

.global main
.global user_spu_load_mamem_sub
.global user_spu_store_mamem_sub

.text
main:

	ba	entry_point
	nop
	nop
	nop
incs:
	inc	%i5
	nop
	nop
	nop

func:
	nop
	nop
	retl
	nop

!---------------------------------
entry_point:

	mov	%g0, 	%i5

loop0:

! store nops to function
!-----------------------
        setx    nops, %l0, %l1
        setx    func, %l0, %l2
	ld	[%l1], %l0
	st	%l0,  [%l2 + 0]
	flush 	%l2

! execute
        setx    func, %l0, %l1
        jmpl    %l1,%o7
        nop

! load the SPU	
	set	0, %i0
	setx	SRC_BASE_PA, %g1, %i1
	add	%i1, 0x10, %i1
	set	1, %i2
	set     0, %i3
	user_spu_load_mamem

! store the SPU	
	set	0, %i0
	setx	SRC_BASE_PA, %g1, %i1
	add	%i1, 0x20, %i1
	set	1, %i2
	set     0, %i3
	user_spu_store_mamem

	flush 	%l2

! execute
        setx    func, %l0, %l1
        jmpl    %l1,%o7
        nop

	subcc	%i5, 0x10, %i6
	brz	%i6, diag_pass
	nop

	ba	loop0
	nop

diag_pass:
        ta T_GOOD_TRAP

diag_fail:
        ta T_BAD_TRAP

nops:
	nop

!-------------------------------------------
	
user_spu_load_mamem_sub:
	rd      %asi, %g3
	wr	%g0, SPU_ASI, %asi
	set	REG_MA_ADDR_ADDR, %g1
        stxa %i2, [%g0 + %g1] SPU_ASI
	set	REG_MPA_ADDR, %g1
        stxa %i1, [%g0 + %g1] SPU_ASI
	and	%i0, 0x3f, %i0
	sll     %i3, 11, %i3
	or      %i0, %i3, %i0
	set	REG_MA_CTL_ADDR, %g1
        stxa %i0, [%g0 + %g1] SPU_ASI
	set     1, %i0
	set	MASync_ADDR, %g1
        ldxa [%g0 + %g1] SPU_ASI, %i0
	wr      %g0, %g3, %asi
	done

user_spu_store_mamem_sub:		
	rd      %asi, %g3
	wr	%g0, SPU_ASI, %asi
	set	REG_MA_ADDR_ADDR, %g1
        stxa %i2, [%g0 + %g1] SPU_ASI
	set	REG_MPA_ADDR, %g1
        stxa %i1, [%g0 + %g1] SPU_ASI
	and	%i0, 0x3f, %i0
	sll     %i3, 11, %i3
	or      %i0, %i3, %i0
	or      %i0, 0x40, %i0
	set	REG_MA_CTL_ADDR, %g1
        stxa %i0, [%g0 + %g1] SPU_ASI
	set     1, %i0
	set	MASync_ADDR, %g1
        ldxa [%g0 + %g1] SPU_ASI, %i0
	wr      %g0, %g3, %asi
	done

!========================================
.data
.align 64
DATA_START:
	.word	0xdeadbeef
 ! align to the L2 cache line size
.align  128
DATA_SRC:
	.skip 0x200

.align 2048
DATA_DEST:
	.skip 0x200
	.xword 0x1234567890abcdef
.align 2048
.section .bss
BSS_DATA:
	.word	0x12345678
	
.end
