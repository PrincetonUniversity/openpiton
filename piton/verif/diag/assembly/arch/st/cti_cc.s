// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: cti_cc.s
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

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text


main:
/*
 *****************************************************
 *
 *  This diag will test the forwarding of the ccs (icc and xcc).
 *  TBD:        test transfers from fcc        
 *****************************************************
 */

/*
 ****************************************************
 *  Cases:      
 *      1) Forwarding from alu set cc to addc/subc
 *      2) Forwarding from wr %ccr to addc/subc
 *      3) Forwarding from alu set cc to movcc
 *      4) Forwarding from wr %ccr to movcc
 *      5) Mix wr %ccr with addcc        
 ****************************************************
 */
        set 0x80000000, %g7  
        set 0xdeadbeef, %g6              
        !! Case 1: forward from addcc to addc
        orcc %g0, %g0, %g1 !! clear ccr
        nop
        nop
        nop
        nop
        !! a) bypass with no conflicts
        addcc  %g7, %g7, %g1
        addc %g0, %g0, %g2 !! e to d
        addc %g0, %g0, %g3 !! m to d
        addc %g0, %g0, %g4 !! w to d
        !! b) bypass with picking btwn 2 insts
        addcc %g7, %g7, %g2
        orcc %g0, %g0, %g1
        addc %g0, %g0, %g3 !! e to d
        addc %g0, %g0, %g4 !! m to d
        !! b) bypass with picking btwn 3 insts
        orcc %g0, %g0, %g1
        addcc %g7, %g7, %g2
        orcc %g0, %g0, %g3
        addc %g0, %g0, %g4 !! e to d

        !! Case 2: forward from wr %ccr to addc (no hardware hazard)
        wr %g0, %g0, %ccr !! clear ccr
        nop
        nop
        nop
        nop
        !! a) bypass with no conflicts
        wr %g0, 1, %ccr
        addc %g0, %g0, %g2 !! e to d
        addc %g0, %g0, %g3 !! m to d
        addc %g0, %g0, %g4 !! w to d
        !! b) bypass with picking btwn 2 insts
        wr %g0, 1, %ccr
        wr %g0, 0, %ccr
        addc %g0, %g0, %g3 !! e to d
        addc %g0, %g0, %g4 !! m to d
        !! b) bypass with picking btwn 3 insts
        wr %g0, 0, %ccr
        wr %g0, 1, %ccr
        wr %g0, 0, %ccr
        addc %g0, %g0, %g4 !! e to d
                                                       
        !! Case 3: forward from addcc to movcc
        orcc %g0, %g0, %g1 !! clear ccr
        nop
        nop
        nop
        nop
        !! a) bypass with no conflicts
        addcc  %g7, %g7, %g1
        move %xcc, %g6, %g2 !! e to d
        move %xcc, %g6, %g3 !! m to d
        move %xcc, %g6, %g4 !! w to d
        !! b) bypass with picking btwn 2 insts
        addcc %g7, %g7, %g2
        orcc %g0, %g0, %g1
        move %xcc, %g6, %g3 !! e to d
        move %xcc, %g6, %g4 !! m to d
        !! b) bypass with picking btwn 3 insts
        orcc %g0, %g0, %g1
        addcc %g7, %g7, %g2
        orcc %g0, %g0, %g3
        move %xcc, %g6, %g5 !! e to d

        !! Case 4: forward from wr %ccr to addc (no hardware hazard)
        wr %g0, %g0, %ccr !! clear ccr
        mov 0, %g1
        mov 0, %g2
        mov 0, %g3
        mov 0, %g4
        mov 0, %g5
        !! a) bypass with no conflicts
        wr %g0, 1, %ccr
        move %xcc, %g6, %g2 !! e to d
        move %xcc, %g6, %g3 !! m to d
        move %xcc, %g6, %g4 !! w to d
        !! b) bypass with picking btwn 2 insts
        wr %g0, 1, %ccr
        wr %g0, 0, %ccr
        move %xcc, %g6, %g3 !! e to d
        move %xcc, %g6, %g4 !! m to d
        !! b) bypass with picking btwn 3 insts
        wr %g0, 0, %ccr
        wr %g0, 1, %ccr
        wr %g0, 0, %ccr
        move %xcc, %g6, %g5 !! e to d
        
        !! Case 5: mix wr %ccr with addcc to addc
        wr %g0, %g0, %ccr !! clear ccr
        mov 0, %g1
        mov 0, %g2
        mov 0, %g3
        mov 0, %g4
        mov 0, %g5
        addcc %g0, %g0, %g1        
        wr %g0, 1, %ccr
        addc %g0, %g0, %g2

        wr %g0, 0, %ccr
        addcc %g7, %g7, %g1
        addc %g0, %g0, %g2 !! wr in m
        addc %g0, %g0, %g2 !! wr in w
        
        
        
/*
   ********************************
   *      Diag PASSED !           *
   ********************************
   */
  diag_pass:
          set     0xc001dea1,     %l0
          ta      T_GOOD_TRAP
          nop

  /*
   ********************************
   *      Diag FAILED !           *
   ********************************
   */
  diag_fail:
          set     0xdeadcafe,     %l0
  bad_trap:
          ta      T_BAD_TRAP
          nop
          nop        
                     
