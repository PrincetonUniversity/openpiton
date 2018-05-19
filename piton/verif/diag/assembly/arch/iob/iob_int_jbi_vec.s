// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_jbi_vec.s
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
 * Name:   iob_int_jbi_vec.s
 * Date:   
 *
 *  Description: sjm generates interrupt to iob.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Interrupt_0x60                  trap_interrupt_jbi
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
        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

	! Initialize jbi interrupt vector.        
        setx    0x0000009800000a00,     %l0,    %l1     
        set     IOB_INT_JBI_VEC,        %l2
        stx     %l2,    [%l1]
        
        ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l0,    %l1
        set     0x0,    %l2
        stx     %l2,    [%l1]

        ! Wait till interrupt has been generated to this thread.
wait_loop:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        setx    0x0123456789abcdef,     %l0,    %l5
        cmp     %l4,    %l5
        bne     wait_loop
        nop
        ba      diag_pass
        nop
                
th_main_0:    
        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

	! Initialize jbi registers.
        call    sub_init_jbi_no_sjm
        save        
        nop

	! Initialize jbi interrupt vector.        
        setx    0x0000009800000a00,     %l0,    %l1     
        set     IOB_INT_JBI_VEC,        %l2
        stx     %l2,    [%l1]
        
        ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %l0,    %l1
        set     0x0,    %l2
        stx     %l2,    [%l1]

        set     0x0,    %l7
        set     0x40,   %g7                        
jbi_int_loop:        
        setx    0x0000009800000a00,     %l0,    %l1     
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
        
        ! IOSYNC cycles to start sjm_4
        setx    0xdeadbeefdeadbeef,     %g1,    %g2
        setx    0xcf00beef00,   %g1,    %g3
        stx     %g2,    [%g3]
        
        ! Wait till interrupt has been generated to this thread.
wait_loop0:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        setx    0x0123456789abcdef,     %l0,    %l5
        cmp     %l4,    %l5
        bne     wait_loop0
        nop
        stx     %g0,    [%l3]
                
        add     %l7,    0x1,    %l7
        cmp     %l7,    %g7
        bne     jbi_int_loop
        nop
        
diag_pass:
        ta      T_GOOD_TRAP
        nop
        
diag_fail:
        ta      T_BAD_TRAP
        nop
        
! Include subroutines and data.        
#include "iob_subs.s"
#include "iob_data.s"

! Trap handlers.
SECTION .HTRAPS
.text
.align 64        
                        
! Interrupt jbi trap handler.
.global trap_interrupt_jbi
trap_interrupt_jbi:
        
        ! Check the correct bit is set in the ASI interrupt registers.
        ldxa    [%g0] 0x72,     %g1
        set     0x1,    %g2
        sllx    %g2,    %l7,    %g3
        cmp     %g1,    %g3
        bne     trap_diag_fail        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] 0x74,     %g1
        mov     %l7,    %g3
        cmp     %g1,    %g3
        bne     trap_diag_fail        
        nop

        ! Write to memory to indicate interrupt completion.
        setx    semaphore,      %g1,    %g2
        rdth_id        
        sll     %o1,    0x3,    %g3
        add     %g2,    %g3,    %g4
        setx    0x0123456789abcdef,     %g1,    %g5
        stx     %g5,    [%g4]
        
        ! Clear interrupt busy bit.
        setx    0x0000009f00000b00,     %g1,    %g2
        set     0x0,    %g3
        stx     %g3,    [%g2]
        
        retry
        
trap_diag_fail:
        ta      T_BAD_TRAP
        nop
