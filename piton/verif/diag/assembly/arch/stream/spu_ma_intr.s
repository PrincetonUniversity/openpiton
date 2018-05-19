// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: spu_ma_intr.s
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
!! File:	spu_ma_intr.s
!! Description:
!! -----------
!!
!!
!! This diag includes tests for Modular Exponentiation when
!!  using a MA completion trap to indicate finishing an MA op. 
!!
!! $Change$

#define MAIN_PAGE_HV_ALSO
#define H_HT0_Reserved_0x74 intr_handler
#include "spu_diag.h"
#include "boot.s"

	.text
	.global intr_handler
	.global main
main:
	nop
        ta      T_CHANGE_HPRIV
        nop

	wr	%g0, SPU_ASI, %asi  ! set up the asi register to contain SPU asi
	set	0, %l7		! use %l7 as an indicator of MA op completion

	! Now testing a complete Modular Exponentiation which 
	! involves two steps:
	! 1. do MA_EXP (the inner loop part)
	! 2. perform an extra MA_MULTIPLY
	! The following diag will verify the intermediate result as well	
ma_exp_test:
	setpa	(MA_EXPONENTIATION_DATA, %l0, %l1, %i0)
        stxa    %i0, [%g0+REG_MPA_ADDR] %asi		! set the PA for the data to be loaded to MAMEM
        stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi	! set the offset in MAMEM
	add	%g0, 11, %i0				! the CTL word for loading 11+1 words to MAMEM
	add	%i0, 0x200, %i0				! set the INTR bit
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi   	! set the MA_CTL register to load MAMEM
	! waiting for the completion trap
wait_for_ma_cmpl0:
        cmp     %l7, %g0
        be,pt  	%xcc, wait_for_ma_cmpl0
        nop
	set	0, %l7				! reset the indicator

	setx	0xf0309060c00, %l0, %i0		! the offsets for all the operands used in ma_exp
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	set	Data_N_prime, %i0
	ldx	[%i0], %i0
	stxa	%i0, [%g0+REG_NP_ADDR] %asi		! set the NP register
	add	%g0, 0x102, %i0				! CTL word for doing 2+1 words of ma_exp
	add	%i0, 0x200, %i0				! set the INTR bit
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi         ! set the MA_CTL register to start ma_exp

	! waiting for the completion trap
wait_for_ma_cmpl1:
        cmp     %l7, %g0
        be,pt	%xcc,	wait_for_ma_cmpl1
        nop
	set	0, %l7				! reset the indicator

	setpa   (OBUF, %l0, %l1, %i0)			! set up for transferring the results from MAMEM
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	add     %g0, 9, %i0				! the offset in MAMEM for the results
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 0x42, %i0				! CTL word for storing 3 words of MAMEM out
	add	%i0, 0x200, %i0				! set the INTR bit
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi         ! set the MA_CTL register to start storing

	! waiting for the completion trap
wait_for_ma_cmpl2:
        cmp     %l7, %g0
        be,pt	%xcc, wait_for_ma_cmpl2
        nop
	set	0, %l7				! reset the indicator

	set	OBUF, %i0
	set	EXP_RES, %i1
	set	3, %i2
	! compare the results against expectation

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_3:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc,diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_3
	nop

	! now to finish the complete X=A^E mod N, 
	! need to do one more ma_multiply
	
	setpa	(ONE_DATA, %l0, %l1, %i0)
        stxa    %i0, [%g0+REG_MPA_ADDR] %asi		! set the PA for the data to be loaded to MAMEM
        stxa    %g0, [%g0+REG_MA_ADDR_ADDR] %asi	! set the offset in MAMEM
	add	%g0, 2, %i0				! the CTL word for loading 2+1 words to MAMEM
	add	%i0, 0x200, %i0				! set the INTR bit
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi   	! set the MA_CTL register to load MAMEM

	! waiting for the completion trap
wait_for_ma_cmpl3:
        cmp     %l7, %g0
        be,pt	%xcc,    wait_for_ma_cmpl3
        nop
	set	0, %l7				! reset the indicator

	setx	0x30c060009, %l0, %i0			! the offsets for all the operands used in ma_mult
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 0x82, %i0				! CTL word for doing 2+1 words of ma_mult
	add	%i0, 0x200, %i0				! set the INTR bit
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi         ! set the MA_CTL register to start ma_mult

	! waiting for the completion trap
wait_for_ma_cmpl4:
        cmp     %l7, %g0
        be,pt	%xcc,    wait_for_ma_cmpl4
        nop
	set	0, %l7				! reset the indicator

	setpa   (OBUF, %l0, %l1, %i0)			! set up for transferring the results from MAMEM
	stxa    %i0, [%g0+REG_MPA_ADDR] %asi
	add     %g0, 3, %i0				! the offset in MAMEM for the results
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi
	add	%g0, 0x42, %i0				! CTL word for storing 3 words of MAMEM out
	add	%i0, 0x200, %i0				! set the INTR bit
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi         ! set the MA_CTL register to start storing

	! waiting for the completion trap
wait_for_ma_cmpl5:
        cmp     %l7, %g0
        be,pt	%xcc,    wait_for_ma_cmpl5
        nop
	set	0, %l7				! reset the indicator

	set	OBUF, %i0
	set	FINAL_EXP_RES, %i1
	set	3, %i2
	! compare the results against expectation

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_4:
	ldx	[%i0], %l3		
	ldx	[%i1], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc,diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_4
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

intr_handler:
	add	%g0, 1, %l7
	retry
	nop

	.data
.align 64
DATA1:
	.word	0xdeadbeef
.align  16
MA_EXPONENTIATION_DATA:
Data_A:
	.xword	0x527ec5ea2d71d114
	.xword	0x11fdb24622dcc39e
	.xword	0x32
Data_E:
	.xword	0x1abcdef
	.xword	0x9876543212345678
	.xword	0x0
Data_N:
	.xword	0x987654312345671
	.xword	0x1234987621abcdef
	.xword	0x54
Data_X:
	.xword	0xf55876def6a98074
	.xword	0x16d29e4741efa95e
	.xword	0xb
Data_N_prime:
	.xword	0xce670a1f9fcb556f
	.xword	0x884e6f9c1320dc3c
	.xword	0x25535b9181a9921c
	.align 16
ONE_DATA:
	.xword	0x1
	.xword	0x0
	.xword	0x0
EXP_RES:
	.xword	0xeba65086aab92aad
	.xword	0x357dcdff43dfd7e7
	.xword	0x22
FINAL_EXP_RES:
	.xword	0x328d471612b8c616
	.xword	0xade986958bda583e
	.xword	0x1c
OBUF:
	.xword  0x8888888888888888	
.align 8192
	.section .bss
DATA4:
	.word	0x12345678
