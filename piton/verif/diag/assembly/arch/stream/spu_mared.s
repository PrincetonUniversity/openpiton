// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: spu_mared.s
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
!! File:	spu_mared.s
!! Description:
!! -----------
!!
!!
!! This diag includes tests for Modular Reductions 
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

	wr	%g0, SPU_ASI, %asi  ! set up the asi register to contain SPU asi

! Test loading/storing to MAMEM

	setpa	(AA1, %l0, %l1, %l6)  ! set the PA of AA1 to %l6 using %l0 and %l1 as temp regs
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi
	ldxa	[%g0+REG_MPA_ADDR] %asi, %l7
	cmp	%l6, %l7
	bne,pn	%xcc, diag_fail
	nop
	stxa	%g0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set 0 to the REG_MA_ADDR for MAMEM offset

	add	%g0, 42, %i0		! #of xwords to load to MAMEM
	sub	%i0, 1,  %i0		! minus 1
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! store to the MA_CTL register to load 18 xwords to MAMEM
	ldxa    [%g0+MASync_ADDR] %asi, %l7
        cmp     %l7, %g0
        bne,pn	%xcc, diag_fail
        nop
	setpa	(OBUF, %l0, %l1, %l6)  ! set the PA of OBUF to %l6 using %l0 and %l1 as temp regs
	stxa	%l6, [%g0+REG_MPA_ADDR] %asi
	or	%i0, 0x40, %i0
	stxa	%i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out MAMEM
	ldxa    [%g0+MASync_ADDR] %asi, %l7
        cmp     %l7, %g0
        bne,pn 	%xcc, diag_fail
        nop
	set	AA1, %i0
	set	OBUF, %i1
	add	%g0, 42, %i2
	! check the results from MAMEM against the orignal data

! compare extended words (length in %i2) from [%i0] and [%i1]

scmp_label_0:
	ldx	[%i0], %g1		
	ldx	[%i1], %g2		
	cmp	%g1, %g2
	bne,pn	%xcc, diag_fail
	nop
	add	%i0, 8, %i0
	add	%i1, 8, %i1
	sub	%i2, 1, %i2
	cmp	%i2, 0
	bne	scmp_label_0
	nop
	set	MA_REDUCTION_RESULTS, %i1
	setpa   (OBUF, %l0, %l1, %l6)  ! set the PA of OBUF to %l6 using %l0 and %l1 as temp regs
	add	%g0, 7, %l2	       ! 7 tests for MA_REDUCTION
	set	0x2a0300, %o1
	! testing MA reduction
ma_reductions:
	stxa    %o1, [%g0+REG_MA_ADDR_ADDR] %asi   ! set up the REG_MA_ADDR for offsets of operands
	add	%g0, 0xc0, %i0
	add	%i0, 2, %i0		! add the len-1 to the CTL word
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to do MA_REDUCTION
	ldxa    [%g0+MASync_ADDR] %asi, %l7
        cmp     %l7, %g0
	bne,pn	%xcc, diag_fail
        nop
	add	%g0, 0x2a, %i0
	stxa    %i0, [%g0+REG_MA_ADDR_ADDR] %asi   ! set MAMEM offset
        stxa    %l6, [%g0+REG_MPA_ADDR] %asi
	set	0x40, %i0
	add	%i0, 2, %i0
	stxa    %i0, [%g0+REG_MA_CTL_ADDR] %asi   ! set the MA_CTL register to store out 3 words of MAMEM
	ldxa    [%g0+MASync_ADDR] %asi, %l7
        cmp     %l7, %g0
	bne,pn	%xcc, diag_fail
        nop
	set	OBUF, %i2
	add	%g0, 3, %o0

! compare extended words (length in %o0) from [%i1] and [%i2]

scmp_label_1:
	ldx	[%i1], %l3		
	ldx	[%i2], %l4		
	cmp	%l3, %l4
	bne,pn	%xcc, diag_fail
	nop
	add	%i1, 8, %i1
	add	%i2, 8, %i2
	sub	%o0, 1, %o0
	cmp	%o0, 0
	bne	scmp_label_1
	nop
	! the result pointer %i1 is already incremented by 3 xwords
	sub	%l2, 1, %l2
	brgz	%l2, ma_reductions
	add	%o1, 0x606, %o1	! increment the offsets for the operands

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
DATA1:
	.word	0xdeadbeef
.align  64
! cases of A>N
AA1:
	.xword  0x23423423eadb
	.xword	0x23423efd234
	.xword	0xabc
NN1:
	.xword	0xaaaaaaaaaaaa
	.xword	0x23423dffffe
	.xword	0xabc
AA2:		
	.xword	0x1000000000000000
	.xword	0x1000000000000000
	.xword	0x1000000000000000
NN2:	
	.xword	0xffffffffffffffff
	.xword	0xffffffffffffffff
	.xword	0xfffffffffffffff
AA3: 	
	.xword	0xdefa123
	.xword	0x3453defbca
	.xword	0x394399eabdc949
NN3:
	.xword	0xaefa123
	.xword	0x3453defbca
	.xword	0x394399eabdc949
! cases of A<N
AA4: 	
	.xword	0xdefa123
	.xword	0x3453defbca
	.xword	0x394399eabdc949
NN4:
	.xword	0xffffffffffffffff
	.xword	0xffdeadbeef
	.xword	0x49439903423432
AA5:
	.xword	0x12345678
	.xword	0xabcdef123456
	.xword	0x8765631abc
NN5:
	.xword	0x12345678
	.xword	0x1abcdef123456
	.xword	0x8765631abc
AA6:
	.xword	0xaaaaaaaaa
	.xword	0x22222222222
	.xword	0x11111
NN6:
	.xword	0xbbbbbbbbb
	.xword	0x22222222222
	.xword	0x11111
! cases of A=N
AA7:
	.xword	0x12345678
	.xword	0xabcdef123456
	.xword	0x8765631abc
NN7:
	.xword	0x12345678
	.xword	0xabcdef123456
	.xword	0x8765631abc
MA_REDUCTION_RESULTS:
	.xword	0xffff789789794031
	.xword	0xfd235
	.xword	0x0
	.xword	0x1000000000000001
	.xword	0x1000000000000000
	.xword	0x0
	.xword	0x3000000
	.xword	0x0
	.xword	0x0
	.xword	0xdefa123
	.xword	0x3453defbca
	.xword	0x394399eabdc949
	.xword	0x12345678
	.xword	0xabcdef123456
	.xword	0x8765631abc
	.xword	0xaaaaaaaaa
	.xword	0x22222222222
	.xword	0x11111
	.xword	0x0
	.xword	0x0
	.xword	0x0
OBUF:
	.xword  0x8888888888888888	
.align 8192
	.section .bss
DATA4:
	.word	0x12345678
