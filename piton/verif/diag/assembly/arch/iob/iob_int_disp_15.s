// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_disp_15.s
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
 * Name:   iob_int_disp_15.s
 * Date:   
 *
 *  Description: Generate interrupt, idle, resume and reset requests to
 *               to all 32 threads.        
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Interrupt_0x60                  trap_interrupt_iob
#define My_External_Reset \
        setx	trap_reset_iob, %g1, %g2; \
        jmp	%g2; \
        nop
        
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

        ! Wait forever.        
wait_loop:             
        ba      wait_loop
        nop
                
th_main_21:    
        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000009800000800,     %l0,    %g1     ! Register address.

        set     0x15,   %g7     ! Thread to generate requests.        
        set     0x0,    %g6     ! Current thread to receive requests.
        srl     %g7,    0x2,    %g5     ! CPU to generate requests.
        
thread_loop:
        cmp     %g7,    %g6     ! Do not generate request to itself.
        beq     next_req
        nop
        
        ! Clear semaphore.
clr_sema_rst:           
        setx    semaphore,      %l0,    %l1
        set     0x0,    %l2
        sll     %g6,    0x3,    %l2
        add     %l1,    %l2,    %l3
        set     0x0,    %l4
        stx     %l4,    [%l3]
        
        ! Issue reset request.
        ! Note that the vector field is overloaded as trap type for
        ! reset request and it needs to be set t0 0x1 for POR and
        ! to 0x3 for XIR.
issue_rst:		
        set     0x3,    %l1
        set     0x0,    %l2
        sll     %g6,    0x8,    %l2
        set     0x1,    %g4
        set     0x0,    %l3
        sll     %g4,    0x10,   %l3
        or      %l2,    %l3,    %l4
        or      %l1,    %l4,    %l5
        stx     %l5,    [%g1]

        ! Wait for the thread to be reset and write to the semaphore.
wait_rst_req_loop:        
        setx    semaphore,      %l0,    %l1
        set     0x0,    %l2
        sll     %g6,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        setx    0x0123456789abcdef,     %l0,    %l5
        cmp     %l4,    %l5
        bne     wait_rst_req_loop
        nop

        ! Read thread status for threads in the same sparc 
        ! which contains the thread gnerating request.
        ! Cannot read thread state of other sparc.
rd_thdfsm_rst:
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        srl     %g6,    0x2,    %g4
        cmp     %g5,    %g4
        bne     clr_sema_idl
        nop
        
        ! Read thread status
        rd      %asr26, %l0
        and     %g6,    0x3,    %l1
        set     0x0,    %l2
        cmp     %l1,    %l2
        be      rst_thread0
        nop
        set     0x1,    %l2
        cmp     %l1,    %l2
        be      rst_thread1
        nop
        set     0x2,    %l2
        cmp     %l1,    %l2
        be      rst_thread2
        nop
        set     0x3,    %l2
        cmp     %l1,    %l2
        be      rst_thread3
        nop
rst_thread0:        
        set     0x0,    %l3
        setx    0xf80000000,    %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1f,   %l3
        ba      rst_cmp_st
        nop
rst_thread1:        
        set     0x0,    %l3
        setx    0x7c000000,     %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1a,   %l3
        ba      rst_cmp_st
        nop
rst_thread2:        
        set     0x0,    %l3
        setx    0x3e00000,      %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x15,   %l3
        ba      rst_cmp_st
        nop
rst_thread3:        
        set     0x0,    %l3
        setx    0x1f0000,       %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x10,   %l3

        ! Compare thread state.
rst_cmp_st:     
        set     THRFSM_WAIT,    %l4
        cmp     %l3,    %l4
        be      clr_sema_idl
        nop
        set     THRFSM_RDY,     %l4
        cmp     %l3,    %l4
        be      clr_sema_idl
        nop
        set     THRFSM_RUN,     %l4
        cmp     %l3,    %l4
        be      clr_sema_idl
        nop        
        ba      diag_fail
        nop
    
        ! Clear semaphore.
clr_sema_idl:           
        setx    semaphore,      %l0,    %l1
        set     0x0,    %l2
        sll     %g6,    0x3,    %l2
        add     %l1,    %l2,    %l3
        set     0x0,    %l4
        stx     %l4,    [%l3]
        
        ! Issue idle request.	
issue_idl:		
	set     IOB_INT_IOB_VEC,        %l1
        set     0x0,    %l2
        sll     %g6,    0x8,    %l2
        set     0x2,    %g4
        set     0x0,    %l3
        sll     %g4,    0x10,   %l3
        or      %l2,    %l3,    %l4
        or      %l1,    %l4,    %l5
        stx     %l5,    [%g1]

        ! Read thread status for threads in the same sparc 
        ! which contains the thread gnerating request.
        ! Cannot read thread state of other sparc.
rd_thdfsm_idl:        
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        srl     %g6,    0x2,    %g4
        cmp     %g5,    %g4
        bne     clr_sema_rsm
        nop
        
        ! Read thread status
        rd      %asr26, %l0
        and     %g6,    0x3,    %l1
        set     0x0,    %l2
        cmp     %l1,    %l2
        be      idl_thread0
        nop
        set     0x1,    %l2
        cmp     %l1,    %l2
        be      idl_thread1
        nop
        set     0x2,    %l2
        cmp     %l1,    %l2
        be      idl_thread2
        nop
        set     0x3,    %l2
        cmp     %l1,    %l2
        be      idl_thread3
        nop
idl_thread0:        
        set     0x0,    %l3
        setx    0xf80000000,    %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1f,   %l3
        ba      idl_cmp_st
        nop
idl_thread1:        
        set     0x0,    %l3
        setx    0x7c000000,     %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1a,   %l3
        ba      idl_cmp_st
        nop
idl_thread2:        
        set     0x0,    %l3
        setx    0x3e00000,      %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x15,   %l3
        ba      idl_cmp_st
        nop
idl_thread3:        
        set     0x0,    %l3
        setx    0x1f0000,       %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x10,   %l3
        
        ! Compare thread state.
idl_cmp_st:     
        set     THRFSM_IDLE,    %l4
        cmp     %l3,    %l4
        be      clr_sema_rsm
        nop
        ba      diag_fail
        nop
    
        ! Clear semaphore.
clr_sema_rsm:           
        setx    semaphore,      %l0,    %l1
        set     0x0,    %l2
        sll     %g6,    0x3,    %l2
        add     %l1,    %l2,    %l3
        set     0x0,    %l4
        stx     %l4,    [%l3]
        
        ! Issue resume request.
issue_rsm:			
        set     IOB_INT_IOB_VEC,        %l1
        set     0x0,    %l2
        sll     %g6,    0x8,    %l2
        set     0x3,    %g4
        set     0x0,    %l3
        sll     %g4,    0x10,   %l3
        or      %l2,    %l3,    %l4
        or      %l1,    %l4,    %l5
        stx     %l5,    [%g1]

        ! Read thread status for threads in the same sparc 
        ! which contains the thread gnerating request.
        ! Cannot read thread state of other sparc.
rd_thdfsm_rsm:        
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        srl     %g6,    0x2,    %g4
        cmp     %g5,    %g4
        bne     clr_sema_int
        nop
        
        ! Read thread status
        rd      %asr26, %l0
        and     %g6,    0x3,    %l1
        set     0x0,    %l2
        cmp     %l1,    %l2
        be      rsm_thread0
        nop
        set     0x1,    %l2
        cmp     %l1,    %l2
        be      rsm_thread1
        nop
        set     0x2,    %l2
        cmp     %l1,    %l2
        be      rsm_thread2
        nop
        set     0x3,    %l2
        cmp     %l1,    %l2
        be      rsm_thread3
        nop
rsm_thread0:        
        set     0x0,    %l3
        setx    0xf80000000,    %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1f,   %l3
        ba      rsm_cmp_st
        nop
rsm_thread1:        
        set     0x0,    %l3
        setx    0x7c00000,      %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1a,   %l3
        ba      rsm_cmp_st
        nop
rsm_thread2:        
        set     0x0,    %l3
        setx    0x3e00000,      %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x15,   %l3
        ba      rsm_cmp_st
        nop
rsm_thread3:        
        set     0x0,    %l3
        setx    0x1f0000,       %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x10,   %l3
        
        ! Compare thread state.
rsm_cmp_st:     
        set     THRFSM_WAIT,    %l4
        cmp     %l3,    %l4
        be      clr_sema_int
        nop
        set     THRFSM_RDY,     %l4
        cmp     %l3,    %l4
        be      clr_sema_int
        nop
        set     THRFSM_RUN,     %l4
        cmp     %l3,    %l4
        be      clr_sema_int
        nop        
        ba      diag_fail
        nop
    
        ! Clear semaphore.
clr_sema_int:           
        setx    semaphore,      %l0,    %l1
        set     0x0,    %l2
        sll     %g6,    0x3,    %l2
        add     %l1,    %l2,    %l3
        set     0x0,    %l4
        stx     %l4,    [%l3]
        
        ! Issue interrupt request.	
issue_int:			
	set     IOB_INT_IOB_VEC,        %l1
        set     0x0,    %l2
        sll     %g6,    0x8,    %l2
        set     0x0,    %g4
        set     0x0,    %l3
        sll     %g4,    0x10,   %l3
        or      %l2,    %l3,    %l4
        or      %l1,    %l4,    %l5
        stx     %l5,    [%g1]

        ! Wait for the thread to be interrupted.	
wait_int_req_loop:        
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        set     0x0,    %l2
        sll     %g6,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        setx    0x0123456789abcdef,     %l0,    %l5
        cmp     %l4,    %l5
        bne     wait_int_req_loop
        nop
	
        ! Read thread status for threads in the same sparc 
        ! which contains the thread gnerating request.
        ! Cannot read thread state of other sparc.
rd_thdfsm_int:        
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        srl     %g6,    0x2,    %g4
        cmp     %g5,    %g4
        bne     next_req
        nop
        
        ! Read thread status
        rd      %asr26, %l0
        and     %g6,    0x3,    %l1
        set     0x0,    %l2
        cmp     %l1,    %l2
        be      int_thread0
        nop
        set     0x1,    %l2
        cmp     %l1,    %l2
        be      int_thread1
        nop
        set     0x2,    %l2
        cmp     %l1,    %l2
        be      int_thread2
        nop
        set     0x3,    %l2
        cmp     %l1,    %l2
        be      int_thread3
        nop
int_thread0:        
        set     0x0,    %l3
        setx    0xf80000000,    %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1f,   %l3
        ba      int_cmp_st
        nop
int_thread1:        
        set     0x0,    %l3
        setx    0x7c00000,      %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x1a,   %l3
        ba      int_cmp_st
        nop
int_thread2:        
        set     0x0,    %l3
        setx    0x3e00000,      %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x15,   %l3
        ba      int_cmp_st
        nop
int_thread3:        
        set     0x0,    %l3
        setx    0x1f0000,       %l2,    %l4
        and     %l0,    %l4,    %l5
        srl     %l5,    0x10,   %l3
        
        ! Compare thread state.
int_cmp_st:     
        set     THRFSM_WAIT,    %l4
        cmp     %l3,    %l4
        be      next_req
        nop
        set     THRFSM_RDY,     %l4
        cmp     %l3,    %l4
        be      next_req
        nop
        set     THRFSM_RUN,     %l4
        cmp     %l3,    %l4
        be      next_req
        nop        
        ba      diag_fail
        nop
        	
next_req:        
        add     %g6,    0x1,    %g6
        set     0x20,   %g2
        cmp     %g6,    %g2
        bne     thread_loop
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
                        
! Interrupt iob trap handler.
! No need to clear the mask for interrupt generated by iob since
! the interrupt is not maskable.
.global trap_interrupt_iob
trap_interrupt_iob:

        ! Check the correct bit is set in the ASI interrupt registers.
        ldxa    [%g0] 0x72,     %g1
        setx    IOB_INT_IOB_PENDING,    %g0,    %g2
        cmp     %g1,    %g2
        bne     trap_diag_fail        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] 0x74,     %g1
        setx    IOB_INT_IOB_VEC,        %g0,    %g2
        cmp     %g1,    %g2
        bne     trap_diag_fail        
        nop

        ! Write to semaphore to indicate interrupt completion.
        setx    semaphore,      %g0,    %g1
        rdth_id        
        set     0x0,    %g2
        sll     %o1,    0x3,    %g2
        add     %g1,    %g2,    %g6
        setx    0x0123456789abcdef,     %g0,    %g4
        stx     %g4,    [%g6]
        
        ! Clear iob interrupt mask.
        setx    0x0000009800000408,     %g1,    %g2     ! Set interrupt control register address.
        set     0x0,    %g1     ! Write to interrupt control register.
        stx     %g1,    [%g2]
        
        retry

trap_diag_fail:
        ta      T_BAD_TRAP
        nop

! Reset iob trap handler.
.global trap_reset_iob
trap_reset_iob:

        ! Enable split mode and clear RED bit.
        rdhpr   %hpstate,       %g1
        wrhpr   %g1,    0x820,  %hpstate

        ! Enable TLB.
        mov     0xf, %g1
        stxa    %g1, [%g0] 0x45
        stxa    %g0, [%g0] 0x43
        
        ! Write to semaphore to indicate reset completion.
        setx    semaphore,      %l0,    %l1
        
! Function to read thread ID from the
! Thread Status register.
! Value is returned in %o1.
	rd	%asr26, %o1
#ifdef PORTABLE_CORE
        set     0x0300, %g1
#else
        set     0x1f00, %g1
#endif
        and     %o1, %g1, %o1
        srlx    %o1, 8, %o1
        
        set     0x0,    %l2
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        setx    0x0123456789abcdef,     %l0,    %l4
        stx     %l4,    [%l3]
        
	retry
        
