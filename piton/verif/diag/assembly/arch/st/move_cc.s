// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: move_cc.s
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
!!      
!!      This diag tests out the MOVR and MOVCC instructions.
!!      It does the following tests:    
!!      1) Do a MOVCC for every condition with all 16 permutations of the icc.
!!      2) Do a MOVCC for all cases of the xcc to make sure that it can be used
!!              instead of the icc                
!!      3) Do a MOVR for every codition based on 1 reg that is 0, 1 that is positive
!!              and one that is negative.
!!      4) Verify that both MOVCC and MOVR can move both immediates and registers
!!      5) Do an MOVFCC for every condition with all 4 permutations of fcc0-3
        
        
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text

main:
        setx 0xfe12345678abcdef, %g2, %g1 !! This is the value that will get moved

!! 1) Test movcc for all 16 values of icc
        set 0xF, %g2
icc_loop:       
        wr %g0, %g2, %ccr
        call zero_reg
        nop
!! does all the %icc moves to those registers.                         
icc_mov:                
        mova   %icc, %g1, %l0
        movn   %icc, %g1, %l1
        movne  %icc, %g1, %l2
        move   %icc, %g1, %l3
        movg   %icc, %g1, %l4
        movle  %icc, %g1, %l5
        movge  %icc, %g1, %l6
        movl   %icc, %g1, %l7
        movgu  %icc, %g1, %i0
        movleu %icc, %g1, %i1
        movcc  %icc, %g1, %i2
        movcs  %icc, %g1, %i3
        movpos %icc, %g1, %i4
        movneg %icc, %g1, %i5
        movvc  %icc, %g1, %i6
        movvs  %icc, %g1, %i7
        sub %g2, 1, %g2
        brgez %g2, icc_loop
        nop

!! 2) test that xcc works as well
        set 0xF, %g2
xcc_loop:  
        sll %g2, 4, %g3    !! shift into %xcc 
        wr %g0, %g3, %ccr
        call zero_reg
        nop
!! does all the %xcc moves to those registers.                         
xcc_mov:                
        mova   %xcc, %g1, %l0
        movn   %xcc, %g1, %l1
        movne  %xcc, %g1, %l2
        move   %xcc, %g1, %l3
        movg   %xcc, %g1, %l4
        movle  %xcc, %g1, %l5
        movge  %xcc, %g1, %l6
        movl   %xcc, %g1, %l7
        movgu  %xcc, %g1, %i0
        movleu %xcc, %g1, %i1
        movcc  %xcc, %g1, %i2
        movcs  %xcc, %g1, %i3
        movpos %xcc, %g1, %i4
        movneg %xcc, %g1, %i5
        movvc  %xcc, %g1, %i6
        movvs  %xcc, %g1, %i7
        sub %g2, 1, %g2
        brgez %g2, xcc_loop
        nop

!! 3) Test all cases of MOVR
        add %g0, 1, %g2 !! %g2 is positive
        sub %g0, 1, %g3 !! %g3 is negative
        call zero_reg
        nop
        !! Reg is zero
        movrz   %g0, %g1, %l0
        movrlez %g0, %g1, %l1
        movrlz  %g0, %g1, %l2
        movrnz  %g0, %g1, %l3
        movrgz  %g0, %g1, %l4
        movrgez %g0, %g1, %l5
        !! Reg is positive
        movrz   %g2, %g1, %l6
        movrlez %g2, %g1, %l7
        movrlz  %g2, %g1, %i0
        movrnz  %g2, %g1, %i1
        movrgz  %g2, %g1, %i2
        movrgez %g2, %g1, %i3
        !! Reg is negative
        movrz   %g3, %g1, %i4
        movrlez %g3, %g1, %i5
        movrlz  %g3, %g1, %i6
        movrnz  %g3, %g1, %i7
        movrgz  %g3, %g1, %o1
        movrgez %g3, %g1, %o2

!! 4) Test that immediates can get moved too
        movrz %g0, 0xa, %l0
        wr %g0, 1, %ccr
        movcs %icc, 0xb, %l1 
    
        !! Enable floating point
        ta T_CHANGE_PRIV
        nop
        rdpr %pstate, %g2
        or %g2, 0x10, %g2 !! turn on PEF bit in PSTATE
        wrpr %g2, %g0, %pstate
        ta T_CHANGE_NONPRIV
        nop
        wr %g0, 0x4, %fprs !! turn on FRF in FPRS
!! 5) Test moves with all the fccs  
        setx fsr_vals, %g3, %g2
        set 3, %g4
fcc_loop:
        sll %g4, 3, %g3
        ldx [%g2+%g3], %fsr             
        call zero_reg
        nop
!! Does all the %fcc moves to regs
fcc0_mov:
        mova   %fcc0, %g1, %l0
        movn   %fcc0, %g1, %l1
        movu   %fcc0, %g1, %l2
        movg   %fcc0, %g1, %l3
        movug  %fcc0, %g1, %l4
        movl   %fcc0, %g1, %l5
        movul  %fcc0, %g1, %l6
        movlg  %fcc0, %g1, %l7
        movne  %fcc0, %g1, %i0
        move   %fcc0, %g1, %i1
        movue  %fcc0, %g1, %i2
        movge  %fcc0, %g1, %i3
        movuge %fcc0, %g1, %i4
        movle  %fcc0, %g1, %i5
        movule %fcc0, %g1, %i6
        movo   %fcc0, %g1, %i7
        
        call zero_reg
        nop
                       
fcc1_mov:
        mova   %fcc1, %g1, %l0
        movn   %fcc1, %g1, %l1
        movu   %fcc1, %g1, %l2
        movg   %fcc1, %g1, %l3
        movug  %fcc1, %g1, %l4
        movl   %fcc1, %g1, %l5
        movul  %fcc1, %g1, %l6
        movlg  %fcc1, %g1, %l7
        movne  %fcc1, %g1, %i0
        move   %fcc1, %g1, %i1
        movue  %fcc1, %g1, %i2
        movge  %fcc1, %g1, %i3
        movuge %fcc1, %g1, %i4
        movle  %fcc1, %g1, %i5
        movule %fcc1, %g1, %i6
        movo   %fcc1, %g1, %i7
        
        call zero_reg
        nop
                       
fcc2_mov:
        mova   %fcc2, %g1, %l0
        movn   %fcc2, %g1, %l1
        movu   %fcc2, %g1, %l2
        movg   %fcc2, %g1, %l3
        movug  %fcc2, %g1, %l4
        movl   %fcc2, %g1, %l5
        movul  %fcc2, %g1, %l6
        movlg  %fcc2, %g1, %l7
        movne  %fcc2, %g1, %i0
        move   %fcc2, %g1, %i1
        movue  %fcc2, %g1, %i2
        movge  %fcc2, %g1, %i3
        movuge %fcc2, %g1, %i4
        movle  %fcc2, %g1, %i5
        movule %fcc2, %g1, %i6
        movo   %fcc2, %g1, %i7
        
        call zero_reg
        nop
                       
fcc3_mov:
        mova   %fcc3, %g1, %l0
        movn   %fcc3, %g1, %l1
        movu   %fcc3, %g1, %l2
        movg   %fcc3, %g1, %l3
        movug  %fcc3, %g1, %l4
        movl   %fcc3, %g1, %l5
        movul  %fcc3, %g1, %l6
        movlg  %fcc3, %g1, %l7
        movne  %fcc3, %g1, %i0
        move   %fcc3, %g1, %i1
        movue  %fcc3, %g1, %i2
        movge  %fcc3, %g1, %i3
        movuge %fcc3, %g1, %i4
        movle  %fcc3, %g1, %i5
        movule %fcc3, %g1, %i6
        movo   %fcc3, %g1, %i7
        
        sub %g4, 1, %g4
        brgez %g4, fcc_loop
        nop
                

!! Exit the diag        
        ba diag_pass
        nop

        

!! This zeroes all the registers that can be destinations for a movcc
zero_reg:
        mov %g0, %l0
        mov %g0, %l1
        mov %g0, %l2
        mov %g0, %l3
        mov %g0, %l4
        mov %g0, %l5
        mov %g0, %l6
        mov %g0, %l7
        mov %g0, %i0
        mov %g0, %i1
        mov %g0, %i2
        mov %g0, %i3
        mov %g0, %i4
        mov %g0, %i5
        mov %g0, %i6
        mov %g0, %i7
        mov %g0, %o1
        mov %g0, %o2
        retl
        nop

        
/*
   ********************************
   *      Diag PASSED !           *
   ********************************
   */
  diag_pass:
          set     0xc001dea1,     %l0
          ta      T_GOOD_TRAP
          nop



.data
fsr_vals:
        .word 0x00000024, 0x00000C00
        .word 0x00000013, 0x00000800
        .word 0x0000000E, 0x00000400
        .word 0x00000039, 0x00000000

.end                
