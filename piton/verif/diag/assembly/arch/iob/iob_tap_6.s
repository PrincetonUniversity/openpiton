// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_tap_6.s
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
/***********************************************************************
 * Name:   iob_tap_6.s
 *
 *  Description: Dummy wait sparc while tap accesses iob.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#include "boot.s"
        
.text
.align 64
.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing. No need to run more than one core,
	! and no need to differentiate the threads because nobody stores
	! anything.
th_main_31:    
th_main_30:    
th_main_29:    
th_main_28:    
th_main_27:    
th_main_26:    
th_main_25:    
th_main_24:    
th_main_23:    
th_main_22:    
th_main_21:    
th_main_20:    
th_main_19:    
th_main_18:    
th_main_17:    
th_main_16:    
th_main_15:    
th_main_14:    
th_main_13:    
th_main_12:    
th_main_11:    
th_main_10:    
th_main_9:    
th_main_8:    
th_main_7:    
th_main_6:    
th_main_5:    
th_main_4:    
th_main_3:    
th_main_2:    
th_main_1:
th_main_0:

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        rdth_id        
        sll     %o1,    0x3,    %g3
        
        set     0x0,    %g1
        set     0x1000, %g2
        
        setx    0x0123456789abcdef,     %l0,    %g4
        set     0x1000, %g5
        add     %g5,    %g3,    %g3
        
rw_loop:
        stx     %g4,    [%g3]
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_loop
        nop                

        ta      T_GOOD_TRAP
        nop
                
