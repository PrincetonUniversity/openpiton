// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: spu_matest.s
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
!! File:	spu_matest.s
!! Description:
!! -----------
!!
!!
!! This diag includes several random tests of various length for Modular Exponentiations 
!!
!! $Change$

#define MAIN_PAGE_HV_ALSO
#include "spu_diag.h"
#include "boot.s"

        .text
        .global main
main:
        nop
        ta      T_CHANGE_HPRIV
        nop

        wr      %g0, SPU_ASI, %asi  ! set up the asi reg. to contain SPU asi

! In all the tests, we divide the MA_MEM into 5 parts regardless of
! the data len: offsets (dw) 0 --> A, 32 --> E, 64 --> N, 96 --> X, 128 --> M
! in hex which are 0 --> A, 0x20 --> E, 0x40 --> N, 0x60 --> X, 0x80 --> M.
! This way it is easy to set up the offsets in the MA_ADDR regsiter.

! For each length, the diag is performed as follows:
!   1. Set the NP regsiter and load A, E, N, X
!   2. Store out the MA_MEM and make sure they match
!   3. Start X = A^E modulu N using M
!   4. Store out X and compare against expectation which is MData_A
!   5. Load One_Data to offset 0 in MA_MEM
!   6. Do E ( offset 0x20) = X* (0x60) * One_Data (0) modulu N using M 
!   7. Store out the final result E (offset 0x20)
!   8. Compare against expectation MA_EXP_RES_Data

!!! Generating 8 MA tests with length between 8 and 16 ...
 MA_EXP_Test0:
! Testing len = 8 

	set	Data0_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data0_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data0_A, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_0:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_0
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data0_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data0_E, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_1:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_1
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data0_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data0_N, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_2:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_2
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data0_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data0_X, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_3:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_3
	nop

! Now start MA_EXP
	setx	0x3f2060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 7, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData0_A, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_4:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_4
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data0, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_5:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_5
	nop
 MA_EXP_Test1:
! Testing len = 9 

	set	Data1_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data1_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data1_A, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_6:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_6
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data1_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data1_E, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_7:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_7
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data1_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data1_N, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_8:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_8
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data1_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data1_X, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_9:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_9
	nop

! Now start MA_EXP
	setx	0x472060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 8, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData1_A, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_10:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_10
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 8, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data1, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_11:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_11
	nop
 MA_EXP_Test2:
! Testing len = 16 

	set	Data2_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data2_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data2_A, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_12:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_12
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data2_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data2_E, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_13:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_13
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data2_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data2_N, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_14:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_14
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data2_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data2_X, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_15:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_15
	nop

! Now start MA_EXP
	setx	0x7f2060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 15, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData2_A, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_16:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_16
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 15, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data2, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_17:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_17
	nop
 MA_EXP_Test3:
! Testing len = 14 

	set	Data3_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data3_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data3_A, %o0
	set	Output_Buf, %o1
	set	14, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_18:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_18
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data3_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data3_E, %o0
	set	Output_Buf, %o1
	set	14, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_19:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_19
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data3_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data3_N, %o0
	set	Output_Buf, %o1
	set	14, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_20:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_20
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data3_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data3_X, %o0
	set	Output_Buf, %o1
	set	14, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_21:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_21
	nop

! Now start MA_EXP
	setx	0x6f2060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 13, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 13, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData3_A, %o0
	set	Output_Buf, %o1
	set	14, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_22:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_22
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	13, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 13, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 13, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data3, %o0
	set	Output_Buf, %o1
	set	14, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_23:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_23
	nop
 MA_EXP_Test4:
! Testing len = 16 

	set	Data4_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data4_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data4_A, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_24:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_24
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data4_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data4_E, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_25:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_25
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data4_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data4_N, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_26:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_26
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data4_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data4_X, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_27:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_27
	nop

! Now start MA_EXP
	setx	0x7f2060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 15, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData4_A, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_28:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_28
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	15, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 15, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 15, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data4, %o0
	set	Output_Buf, %o1
	set	16, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_29:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_29
	nop
 MA_EXP_Test5:
! Testing len = 9 

	set	Data5_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data5_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data5_A, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_30:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_30
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data5_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data5_E, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_31:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_31
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data5_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data5_N, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_32:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_32
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data5_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data5_X, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_33:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_33
	nop

! Now start MA_EXP
	setx	0x472060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 8, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData5_A, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_34:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_34
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	8, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 8, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 8, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data5, %o0
	set	Output_Buf, %o1
	set	9, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_35:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_35
	nop
 MA_EXP_Test6:
! Testing len = 8 

	set	Data6_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data6_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data6_A, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_36:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_36
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data6_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data6_E, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_37:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_37
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data6_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data6_N, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_38:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_38
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data6_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data6_X, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_39:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_39
	nop

! Now start MA_EXP
	setx	0x3f2060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 7, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData6_A, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_40:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_40
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data6, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_41:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_41
	nop
 MA_EXP_Test7:
! Testing len = 8 

	set	Data7_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi
	add	%g0, 0, %i1
! Load A to MA_MEM
	setpa	(Data7_A, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data7_A, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_42:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_42
	nop
	add	%i1, 0x20, %i1	
! Load E to MA_MEM
	setpa	(Data7_E, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data7_E, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_43:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_43
	nop
	add	%i1, 0x20, %i1	
! Load N to MA_MEM
	setpa	(Data7_N, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data7_N, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_44:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_44
	nop
	add	%i1, 0x20, %i1	
! Load X to MA_MEM
	setpa	(Data7_X, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	stxa	%i1, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setpa	(Output_Buf, %l0, %l1, %i0)
	stxa	%i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	Data7_X, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_45:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_45
	nop

! Now start MA_EXP
	setx	0x3f2060408000 , %l0, %i0
	stxa	%i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x100, %i0
	add	%i0, 7, %i0	
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x60, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MData7_A, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_46:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_46
	nop
! Now do the final Modular Multiply

	setpa	(One_Data, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	7, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	setx	0x2080400060, %l0, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	0x80, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	0x20, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	setpa  	(Output_Buf, %l0, %l1, %i0)
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 7, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi
	ldxa    [%g0+MASync_ADDR] %asi, %l0
	set	MA_EXP_RES_Data7, %o0
	set	Output_Buf, %o1
	set	8, %i0

! compare extended words (length in %i0) from [%o0] and [%o1]

scmp_label_47:
	ldx	[%o0], %l0		
	ldx	[%o1], %l1		
	cmp	%l0, %l1
	bne,pn	%xcc, diag_fail
	nop
	add	%o0, 8, %o0
	add	%o1, 8, %o1
	sub	%i0, 1, %i0
	cmp	%i0, 0
	bne	scmp_label_47
	nop

diag_pass:
        set     0xc001dea1,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */

diag_fail:
        set     0xdeadcafe,     %l7
        ta T_BAD_TRAP
        nop
	.data
.align 64
!!! Executing me 0 < in.data0 > out.data 
 Data0_A:
	.xword	0xd77b1dea0412fbb3
	.xword	0xce937e7e323b24ad
	.xword	0x9789f76700f2814a
	.xword	0xc304e75c7364e528
	.xword	0x18c593b16e303e89
	.xword	0xd41e3c4838e86bde
	.xword	0x4489cc6b34307e64
	.xword	0x9485b72f4d9634be
 Data0_E:
	.xword	0x33b43c41da5cb52
	.xword	0x3555c75d815f34b0
	.xword	0x673c4f5768c48876
	.xword	0xcbd3d5a7cc30fa7b
	.xword	0x802f926c603ca281
	.xword	0x2853c446cf3ae647
	.xword	0x65f0a9cd7b65598b
	.xword	0x36c0c0a0767d2d8f
 Data0_N:
	.xword	0x7b0027afbacbc6e9
	.xword	0xa4723a65ecc40c9d
	.xword	0x5ef711aa234a94cc
	.xword	0x8dd757d77c9008fe
	.xword	0xa207f407e5539e30
	.xword	0xe1c0ad76a22a8288
	.xword	0xc557cb251aa4632e
	.xword	0xf12d26d516515418
 Data0_X:
	.xword	0x84ffd85045343917
	.xword	0x5b8dc59a133bf362
	.xword	0xa108ee55dcb56b33
	.xword	0x7228a828836ff701
	.xword	0x5df80bf81aac61cf
	.xword	0x1e3f52895dd57d77
	.xword	0x3aa834dae55b9cd1
	.xword	0xed2d92ae9aeabe7
 Data0_N_prime:
	.xword	0xcc94152cf95c8ea7
 MData0_A:
	.xword	0x760c6268bfe425f4
	.xword	0xc318251a070743c6
	.xword	0x999637e44310172e
	.xword	0xd991ee83e86630c
	.xword	0xbe48946aa7b0cd47
	.xword	0xa38bbcc7e1ad356a
	.xword	0xb0dfc683dea9ec64
	.xword	0x3e248778e71b1042
 MA_EXP_RES_Data0:
	.xword	0xc77d535faadbfbd7
	.xword	0xbbb0e6cf4728f138
	.xword	0x239dc2c7b4f0dcd
	.xword	0x45f0991b431f7471
	.xword	0x8df7ebb08a9021d8
	.xword	0x3fd177acf5129e9b
	.xword	0x90a01f94982c04bb
	.xword	0xbaccf12c1a3d31dd
!!! Executing me 1 < in.data1 > out.data 
 Data1_A:
	.xword	0x632d175fe513b61f
	.xword	0x332ad27a57d366f1
	.xword	0x54788332c78af684
	.xword	0x1c5394060e79f94
	.xword	0x6137fd7f62a34b3d
	.xword	0x22a581a372ad1b23
	.xword	0x7edcfad64b9d9c0
	.xword	0x6808f1e1b92c7abb
	.xword	0x21210b0a5745105c
 Data1_E:
	.xword	0xfcbb2593824fd98f
	.xword	0x462feec9b81f9817
	.xword	0xa0e59a3ad64de8fe
	.xword	0x68b0aae096928957
	.xword	0x5b4898cb5605e7da
	.xword	0x914f0efb14df2c01
	.xword	0xb879732389f72537
	.xword	0xca7224e8fa57c5c6
	.xword	0xd5f5307e08395aa5
 Data1_N:
	.xword	0x4a0ab97d1c4a21e5
	.xword	0x66b4746226a264d
	.xword	0x719cbe21f55a1d63
	.xword	0x32f763cc7b87f219
	.xword	0x123f6aa30ffbf8d3
	.xword	0xa1af678c4ecbc5d7
	.xword	0x62f8d30f505f2255
	.xword	0x630081e75e23a529
	.xword	0xe7f32e5078077087
 Data1_X:
	.xword	0xb5f54682e3b5de1b
	.xword	0xf994b8b9dd95d9b2
	.xword	0x8e6341de0aa5e29c
	.xword	0xcd089c3384780de6
	.xword	0xedc0955cf004072c
	.xword	0x5e509873b1343a28
	.xword	0x9d072cf0afa0ddaa
	.xword	0x9cff7e18a1dc5ad6
	.xword	0x180cd1af87f88f78
 Data1_N_prime:
	.xword	0x6ffba2e2b1b9cc13
 MData1_A:
	.xword	0x92da8345bf98da4
	.xword	0x1e593f1c18c0e4ac
	.xword	0xa114ec10758d51aa
	.xword	0x44a34d5f6fee8eee
	.xword	0x4e89444a759c4078
	.xword	0x688c07fd2db312dc
	.xword	0xed4bace6d51d07e6
	.xword	0x3bc3593a457a0d5c
	.xword	0x2dc67e8d4c000beb
 MA_EXP_RES_Data1:
	.xword	0x1a56ba34db5d3d44
	.xword	0x14a9144b518bf110
	.xword	0xa86d2625de83e16a
	.xword	0x900857fa1b282676
	.xword	0xd1776bb333b21800
	.xword	0x7727ef18a8e2917b
	.xword	0x955113c09b9ae70e
	.xword	0x8777dffb50e604a8
	.xword	0x7ddd13df896b2df4
!!! Executing me 2 < in.data2 > out.data 
 Data2_A:
	.xword	0x2febf25fbddea858
	.xword	0x9a01f6a5dcefdf3e
	.xword	0x8fb0b9b513dddac2
	.xword	0x9e06654335fe7e09
	.xword	0xe2e80cf1fad73132
	.xword	0x6c1c1147a1deed6a
	.xword	0x953ec284e890669c
	.xword	0xca4ba9b06cadcfb1
	.xword	0x7eb2cfd31432df53
	.xword	0x622fb6c12a82336b
	.xword	0xf4fa926e978e5f9
	.xword	0xef443a82cb9c08d4
	.xword	0xbad9c5858bb55973
	.xword	0x4dd93dd6b3f52022
	.xword	0x8c1a364c03fbbb4
	.xword	0x6d0ab86631bb7e3f
 Data2_E:
	.xword	0xe2337787d5ad2fd0
	.xword	0xc4df4df0cfb8292d
	.xword	0x1b9420e97590f8c2
	.xword	0x75e56ac9989277cc
	.xword	0x89029736cee8250c
	.xword	0x91d8bcbb0398a379
	.xword	0x9a4da443e810a9fd
	.xword	0x9d925310f8181544
	.xword	0x53726f2280b196a0
	.xword	0xeb02c59a225905da
	.xword	0x27abda869deb53d0
	.xword	0xf09cf912f6029751
	.xword	0xf3393d531c8b05d7
	.xword	0x4b1da09230a43a45
	.xword	0xe496ff9bc6109523
	.xword	0x7f6d4509180d330b
 Data2_N:
	.xword	0x53d2012095b78cc3
	.xword	0x3663350f8cf70af1
	.xword	0xc1a853cc3a3cb0a0
	.xword	0xf5b257a121583700
	.xword	0x23156c0fc069bdae
	.xword	0x2519ee2d794c66f2
	.xword	0xbf6da1b524b15b9f
	.xword	0x8269436aea3fa25e
	.xword	0x19edaf08e88b1b9b
	.xword	0xa359a187ef2306e0
	.xword	0x4f8416699771361d
	.xword	0xc8987633ea656526
	.xword	0x4e73a7cf48464643
	.xword	0xd03482d01dc75a3e
	.xword	0x84b116468d8bb4a6
	.xword	0x7dbc20f5237918e8
 Data2_X:
	.xword	0x585bfdbed490e67a
	.xword	0x933995e0e611ea1d
	.xword	0x7caf58678b869ebf
	.xword	0x149b50bdbd4f91fe
	.xword	0xb9d527e07f2c84a2
	.xword	0xb5cc23a50d67321b
	.xword	0x8124bc95b69d48c1
	.xword	0xfb2d792a2b80bb42
	.xword	0xcc24a1ee2ee9c8c8
	.xword	0xb94cbcf021b9f23f
	.xword	0x60f7d32cd11d93c4
	.xword	0x6ecf13982b3535b3
	.xword	0x6318b0616f737378
	.xword	0x5f96fa5fc4714b83
	.xword	0xf69dd372e4e896b2
	.xword	0x487be15b90dce2e
 Data2_N_prime:
	.xword	0x552a24a381017c15
 MData2_A:
	.xword	0x189bed1e69d61542
	.xword	0x6923fa9397dec541
	.xword	0x9fa9966aba4ac8cb
	.xword	0x98adf7f21bdef54d
	.xword	0x8ef62c406ccc425a
	.xword	0x1fdc9dad8b49791e
	.xword	0x46ab7b0eb3cb1100
	.xword	0x7b3b2d9d55c1fc26
	.xword	0xa5153e1ab84a1389
	.xword	0xf1b953a7da473621
	.xword	0x5582f783f3796381
	.xword	0x1498e95d8b3ac7a6
	.xword	0x941de487f81b32b1
	.xword	0xac007cd2f1033096
	.xword	0x458d46bc99a4ec3e
	.xword	0x3e314c4c1300c443
 MA_EXP_RES_Data2:
	.xword	0xb6e3a418a6cac241
	.xword	0xb027ad5669c94656
	.xword	0xc61a2916480f30e7
	.xword	0x97fa48b5633a6238
	.xword	0x152027edf82b52e4
	.xword	0xe5c29488d1c53515
	.xword	0x82db6cfa1566e356
	.xword	0x9bc77103f416e899
	.xword	0x492aa5481372ac02
	.xword	0x8aa9eca782e56b78
	.xword	0x8aea1e2077e3e5fe
	.xword	0xd36e698218098e15
	.xword	0x72075618cc4eae59
	.xword	0x5aa4e3fa0c9b36b5
	.xword	0x28a7f15d79a1c424
	.xword	0x62b260819b840578
!!! Executing me 3 < in.data3 > out.data 
 Data3_A:
	.xword	0x39baec545d5cd9dc
	.xword	0xfe9f8de44c0e1a54
	.xword	0x1dc6ec185a3c6a03
	.xword	0x7a624d3c56820e23
	.xword	0x33a33c3c0ee0fb18
	.xword	0xd2addad481505df6
	.xword	0xac96aa166ba46f2d
	.xword	0x1f5e64b996d04b13
	.xword	0x5f3d2f841028e38a
	.xword	0xce7c8f4b87b07b98
	.xword	0xf860c40b2f1ec05
	.xword	0x17db671a3abc63d6
	.xword	0x22fa081a323660a8
	.xword	0x4f293c49bba71fd7
 Data3_E:
	.xword	0xed38f2f0385217a0
	.xword	0x8a1659ea222c3f7c
	.xword	0x18b3bf28b34f6c97
	.xword	0xa3858a81dfeb97f8
	.xword	0x34958f8ead34f152
	.xword	0xc27b75813c4cb410
	.xword	0xf74722b44a2d1484
	.xword	0x8ce24487884be0b2
	.xword	0x39ed53d0aa20c4e2
	.xword	0xa2d2019eef743cf1
	.xword	0x7a14b6b9a4f151fe
	.xword	0xa2df9967b1d61c90
	.xword	0xf2c0b7c8274442d6
	.xword	0x6b95c31a8f51f38c
 Data3_N:
	.xword	0x71366a927c36d04b
	.xword	0x14a11e0f2f540f9e
	.xword	0x9624d86c31552ef6
	.xword	0x1b2b8e27c8ea356a
	.xword	0xee58652f772229e9
	.xword	0xa75a0f872ce52289
	.xword	0x32393783268ff4ec
	.xword	0xaf4829e5b7792b17
	.xword	0x33e6a3f077b8edc9
	.xword	0xa169ce1a38890b15
	.xword	0xcf057a26a0374d40
	.xword	0x50e311ea5b765959
	.xword	0x96038ec58e76bc3d
	.xword	0x8df51d8afe31d5e4
 Data3_X:
	.xword	0x8ec9956d83c92fb5
	.xword	0xeb5ee1f0d0abf061
	.xword	0x69db2793ceaad109
	.xword	0xe4d471d83715ca95
	.xword	0x11a79ad088ddd616
	.xword	0x58a5f078d31add76
	.xword	0xcdc6c87cd9700b13
	.xword	0x50b7d61a4886d4e8
	.xword	0xcc195c0f88471236
	.xword	0x5e9631e5c776f4ea
	.xword	0x30fa85d95fc8b2bf
	.xword	0xaf1cee15a489a6a6
	.xword	0x69fc713a718943c2
	.xword	0x720ae27501ce2a1b
 Data3_N_prime:
	.xword	0x6a15c959e931869d
 MData3_A:
	.xword	0xddc041e96fa9038
	.xword	0x485f3b86864907f1
	.xword	0x8d1d1713f75df9
	.xword	0x81bb0dda6984887e
	.xword	0x99b1b89b0477910d
	.xword	0xc5c5863d9c42ac54
	.xword	0xbe8340cb5b28ab52
	.xword	0x3ffcfd077e99d17f
	.xword	0xde7e522ff5f94880
	.xword	0xc10eb319be714888
	.xword	0xa861600d62771f74
	.xword	0x9d3ee12ae747e15e
	.xword	0xc0a840f1218b3a88
	.xword	0x5865418373982cdb
 MA_EXP_RES_Data3:
	.xword	0xcbe3d36e5fc23ad6
	.xword	0x5c053b3cbe17d7e2
	.xword	0x8cd769e2ebd6191
	.xword	0x3da2060b788254dc
	.xword	0xf1cb496015de0d61
	.xword	0xc98408a64a42a875
	.xword	0xc7190b97b96aec4d
	.xword	0x3a7099ce2bb4c7f8
	.xword	0xe7f4135b1fc23065
	.xword	0x7e6d6940b5ca0dd9
	.xword	0x66d391a42b7bc5a
	.xword	0x3697aed712ec3656
	.xword	0xe78bad0537a59ae1
	.xword	0x1e3e1721ac1b8fe0
!!! Executing me 4 < in.data4 > out.data 
 Data4_A:
	.xword	0x18850a61b752670c
	.xword	0x3ca67347fc5ae8f9
	.xword	0xd56ad254e523a3c2
	.xword	0x3516020b2446ad47
	.xword	0x7a51c869515f698d
	.xword	0xb3007ab773c1903e
	.xword	0x8a0688c10c232881
	.xword	0x17299558da33dcc3
	.xword	0x69eab5c6f65a8336
	.xword	0xdcf0181bdb45d672
	.xword	0xfb662f52b8f2c744
	.xword	0x316a4fb8fa18dea3
	.xword	0xa1b798d42bd7724f
	.xword	0x630e3442fd5cb890
	.xword	0x13b2278254b83821
	.xword	0x16f0c0cc0c11b18b
 Data4_E:
	.xword	0xf6b60fb57b9d6f61
	.xword	0x9143ceaec70afc68
	.xword	0x706dd74472ebc918
	.xword	0x5c009fcc1f97ccf8
	.xword	0x481712de38ce844a
	.xword	0x2172422e8544e204
	.xword	0xc299b4dae371fda9
	.xword	0xdb5c8062607617fb
	.xword	0x52f377e70c3e5010
	.xword	0x343e49d3396261e6
	.xword	0x6ecea470dd5616d3
	.xword	0xa575ed5470eaabde
	.xword	0x41827565a1b633d8
	.xword	0x974a7f974063b5bc
	.xword	0xb748bc824f839a5d
	.xword	0x8a74c4c9dc416c20
 Data4_N:
	.xword	0x42439b151fef27e1
	.xword	0x13e3d612d8d2ba2b
	.xword	0xc875dca41bb28e5e
	.xword	0x9505a1059d96399d
	.xword	0x7e5025a4ac394eb3
	.xword	0x77d76316f564d0c1
	.xword	0x87483b533a16e0d6
	.xword	0x783c54c26c040e67
	.xword	0x5b488241b9356ed9
	.xword	0x9c77088b4bda732b
	.xword	0xeaf0ed2448a7e009
	.xword	0xe20e6e09bdbc3f65
	.xword	0x665aeadfa9c3f92e
	.xword	0x8f7b38c847ce7d91
	.xword	0xd7e367d2f67c1494
	.xword	0x50adbd541f704416
 Data4_X:
	.xword	0x39352ec0a032885d
	.xword	0xc4547dc77587d17e
	.xword	0xa69e6a13ace854e5
	.xword	0x40ef1cef273d5326
	.xword	0x850f8f11fb5413e5
	.xword	0x9879d6bb1fd18dbb
	.xword	0x6a274e0651bb5d7c
	.xword	0x974b01b8bbf3d4c9
	.xword	0xee26793ad45fb373
	.xword	0x2a9ae65e1c70a67d
	.xword	0x3f2d389326085fe3
	.xword	0x59d4b5e2c6cb41ce
	.xword	0xccef3f6102b41473
	.xword	0x518e55a72894874b
	.xword	0x7855c8871c8bc242
	.xword	0xdf6c803a1af33bb
 Data4_N_prime:
	.xword	0xda2080b2d148a3df
 MData4_A:
	.xword	0x494ca514276649f4
	.xword	0xa83fd32300e50209
	.xword	0x3f85ef3e26df10d2
	.xword	0x4033c84c25781b8b
	.xword	0x2f3c61263285b480
	.xword	0x6d1e56162b0c7d10
	.xword	0xae9e367e33d1d1db
	.xword	0xb33a223ae79be9f6
	.xword	0x6a7f74051148f3d5
	.xword	0x57368ff1b63b6417
	.xword	0x22ab050aa25542b5
	.xword	0x9623d38df00f63ad
	.xword	0xab694b294e5fd99c
	.xword	0x7f7c824099cb3d1d
	.xword	0xda1b7e91dd7914ca
	.xword	0x1207767c3f904467
 MA_EXP_RES_Data4:
	.xword	0x61b244309bcc107c
	.xword	0x42a743fb314f011c
	.xword	0x569c7fe3e522bbe7
	.xword	0x4cd9bca8c3f5c2df
	.xword	0x3f6568db86c32eab
	.xword	0xf5f97249e222763e
	.xword	0xfc3af5fda16beaf6
	.xword	0x841e0369328e957b
	.xword	0x8c0cf009bd108f3a
	.xword	0xbe6d1e9add10f4a1
	.xword	0xe4a472cd6cbdf364
	.xword	0xa5263da99074b809
	.xword	0x18aa852978c69b1
	.xword	0x74f790e9efa5b13
	.xword	0x7471eb7527c42cf5
	.xword	0x3aaf3b94f33c579c
!!! Executing me 5 < in.data5 > out.data 
 Data5_A:
	.xword	0x45d4fd5e4377a53e
	.xword	0x669d6b7945f9a354
	.xword	0x6130a31f645ca082
	.xword	0x29ed3c18c53fe790
	.xword	0x464f2df313b29fff
	.xword	0x6c7b37bd52fc4cae
	.xword	0xe37e77622dd6ca42
	.xword	0x8e69ceda883b6fc1
	.xword	0x1c3e3b38d4f8c67b
 Data5_E:
	.xword	0x23e20f5d5ea23575
	.xword	0x83aaa2b79e85dc63
	.xword	0x20a6cb92649539df
	.xword	0x8f49a78352e4da8d
	.xword	0xc18db7eb0fd7737a
	.xword	0x942329962751c731
	.xword	0x7cd8ff4e6ff46213
	.xword	0x18773257f9b7d62e
	.xword	0xb3b9ad76ff3aca41
 Data5_N:
	.xword	0x1db0c1157020b5d9
	.xword	0x2eef5e521a311c22
	.xword	0x2597df14f99599d1
	.xword	0x232ddf10082c5db9
	.xword	0x297d21057eca3762
	.xword	0xebba05bd2a253f33
	.xword	0x6238899f01dc9152
	.xword	0x1c8b4a8480f17f85
	.xword	0x69054a1af2fcdc90
 Data5_X:
	.xword	0xc49e7dd51fbe944e
	.xword	0xa221435bcb9dc7bb
	.xword	0xb4d041d60cd4cc5d
	.xword	0xb9a441dfefa7448d
	.xword	0xad05bdf5026b913b
	.xword	0x288bf485abb58199
	.xword	0x3b8eecc1fc46dd5a
	.xword	0xc6e96af6fe1d00f5
	.xword	0x2df56bca1a0646df
 Data5_N_prime:
	.xword	0xa130af8844338597
 MData5_A:
	.xword	0x4194f005dbd5ba17
	.xword	0xb3715bf9953ec373
	.xword	0x9afe06a4a843e211
	.xword	0x9321da15a748b978
	.xword	0x7724b4b580c5545
	.xword	0x89d05fbac227abc4
	.xword	0x63ffdc9a5af8cfb9
	.xword	0xd742b9253f59e29e
	.xword	0x6e91b92384325
 MA_EXP_RES_Data5:
	.xword	0xa5228ead2511feb0
	.xword	0x1666a5997d180e31
	.xword	0x44c88bacd8e1d918
	.xword	0x5b103a0933658a69
	.xword	0xcfb94f64bf4c522a
	.xword	0x47e65b6f1f696e00
	.xword	0xf4c0c9d940b9642c
	.xword	0x227b7993d7d4ff72
	.xword	0x68b9957304177cd8
!!! Executing me 6 < in.data6 > out.data 
 Data6_A:
	.xword	0x1aeb8be47480c2ba
	.xword	0xe24181580d560f46
	.xword	0x5b05514e7848106e
	.xword	0x48786f79b56dc270
	.xword	0xbdcc5c97605f896
	.xword	0x14c94fca7d54cf7c
	.xword	0x709d698767d129e
	.xword	0xef3dd57ea4f75df
 Data6_E:
	.xword	0x90d7c8bbe076b884
	.xword	0x609402845d6f02a
	.xword	0x83d601ba0f1ca49b
	.xword	0x1e586406739147e2
	.xword	0x37f2d9b4a244e131
	.xword	0x37140134bf0385fd
	.xword	0xb31fa50cfa7f33be
	.xword	0x5d50ce205461b007
 Data6_N:
	.xword	0xc65f56d8b803dba5
	.xword	0xccefec3290f3d274
	.xword	0x8315eb082e7d0833
	.xword	0x670b0f11d12d1de2
	.xword	0x943d37b9bb6a900f
	.xword	0x4c66239db8cd4e26
	.xword	0x9dbcae3d2ddbf7c6
	.xword	0x12e2101f4510e1af
 Data6_X:
	.xword	0xed2896fea7cdd89f
	.xword	0x97d1016ea39e5011
	.xword	0x57e31095a3a6955e
	.xword	0xc4703c1860b57b7f
	.xword	0x78e42b917b96af37
	.xword	0x1ed030fd9d93080a
	.xword	0xfd6b26e4abd46aee
	.xword	0xa852e697e248a14
 Data6_N_prime:
	.xword	0x73059a6ca8b46bd3
 MData6_A:
	.xword	0x707d035643ab6c01
	.xword	0x68c8bfcc2da8e235
	.xword	0x9afe0aaae5c00212
	.xword	0x7fb29824b55b8aa5
	.xword	0x9c2b6b49a0655206
	.xword	0xbaaeb763c6bf7a48
	.xword	0xb6b3ff423826d16e
	.xword	0x4b4c20737cdcfe0
 MA_EXP_RES_Data6:
	.xword	0x873a45833a8d291d
	.xword	0x681fad31800a1ce2
	.xword	0x76a18bb3e2c43595
	.xword	0x972fcb95f10518c3
	.xword	0x92544ef357fb68ec
	.xword	0xba56d52c6bf2e045
	.xword	0xf3afec36958c82da
	.xword	0xca30d49373b70d1
!!! Executing me 7 < in.data7 > out.data 
 Data7_A:
	.xword	0xcdd866a925070132
	.xword	0xd00738ee321e4ebb
	.xword	0xe29c2e7e9bf75000
	.xword	0x60ecf35ad0f47557
	.xword	0x74680d278866b842
	.xword	0x49426cbe87a9e6b7
	.xword	0x3cabf9aad8b28865
	.xword	0x2794539d8332ec7
 Data7_E:
	.xword	0x30023cde0abf3493
	.xword	0x254ba7be0bd6fbdb
	.xword	0xf379f1ad577ca135
	.xword	0xf1c0e4885eb085da
	.xword	0xad5d0315311afeeb
	.xword	0x81ddd1a841e41492
	.xword	0x29c428b5bf70aec9
	.xword	0x96e8d31de31a0a0c
 Data7_N:
	.xword	0xb10e7b9d9aa934f5
	.xword	0x7b756d7118fee93b
	.xword	0x718f713206e6f5d0
	.xword	0x6b759c8244bdebb0
	.xword	0x6424c5084f179cbc
	.xword	0x3fce86159a2b4d4c
	.xword	0x23a7f4947bebda38
	.xword	0x54f7390e36b682b
 Data7_X:
	.xword	0xcd48d27300461210
	.xword	0xd9fb7acb503444ce
	.xword	0xb51ac69eb4b1e8e8
	.xword	0xd9f2a7931c63ceea
	.xword	0x391b0e712b929cab
	.xword	0x946dbf317e181ad
	.xword	0x50822428c3c71574
	.xword	0x11a54d55bdc77e9
 Data7_N_prime:
	.xword	0x5e80714977e928a3
 MData7_A:
	.xword	0x9fc3826ef9aa55fa
	.xword	0xb7dcc20d078684bc
	.xword	0x5673ea869d373463
	.xword	0x267e6fa32513d007
	.xword	0x2fddc59907a1b0e0
	.xword	0xe1174f8eca31d5d1
	.xword	0x59e0e6382a363ade
	.xword	0x481cdc2c6efc269
 MA_EXP_RES_Data7:
	.xword	0xf0b29a470edf1f65
	.xword	0x4177b15a5b1fca22
	.xword	0x9476a54e56db8096
	.xword	0x9de012bb33f92809
	.xword	0xb302cd36194733e4
	.xword	0xa86ac7bfc8f4afb4
	.xword	0x994d44ef30c77810
	.xword	0x48a925e6b3dbbdf
 One_Data:
	.xword 0x1
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0
	.xword 0x0

.align 1024
Output_Buf:
	.xword	0x1234567890abcdef
.align 1024
	.xword	0x1234567890abcdef
.align 256
	.section .bss
	.xword	0x1234567890abcdef


!! 	Length		 #Tests
!! ----------------------------------
!! 	8		 3
!! 	9		 2
!! 	10		 0
!! 	11		 0
!! 	12		 0
!! 	13		 0
!! 	14		 1
!! 	15		 0
!! 	16		 2
!! ----------------------------------
!! Total tests = 8
!! The following 2 tests have M overflowed to ACCUM: 

!! Data0 Data1 
