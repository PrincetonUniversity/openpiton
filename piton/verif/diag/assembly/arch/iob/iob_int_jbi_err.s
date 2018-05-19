// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_jbi_err.s
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
 * Name:   iob_int_jbi_err.s
 * Date:   
 *
 *  Description: Read from and write to iob registers.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Data_access_error_0x32            trap_data_access_error
#define H_HT0_Data_Access_Exception_0x30        trap_data_access_exception
#define H_HT0_Corrected_ECC_error_0x63          trap_corrected_ecc_error
#define H_HT0_Interrupt_0x60			trap_interrupt_jbi
#include "boot.s"

.text
.align 64
.global main
main:

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000009800000008,     %l0,    %l1     ! Set interrupt management register address.
        set     IOB_INT_ERR_VEC,        %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
        
        setx    0x0000009800000408,     %l0,    %l1     ! Set interrupt management register address.
        set     0x0,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
        setx    0x0000000000004000,     %l0,    %l1     ! Write to error log enable register.
        setx    0x0000008000010030,     %l0,    %l2     ! Set error log enable register address.
        stx     %l1,    [%l2]
        setx    0x0000000000004000,     %l0,    %l1     ! Write to error signal enable register.
        setx    0x0000008000010038,     %l0,    %l2     ! Set error signal enable register address.
        stx     %l1,    [%l2]
        setx    0x000000000000000c,     %l0,    %l1     ! Write to error config register.
        setx    0x0000008000010000,     %l0,    %l2     ! Set error config register address.
        stx     %l1,    [%l2]
        
gen_err_jbi_0:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000000,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_0:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_0:	
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
        bne     wait_loop_0
        nop
        
gen_err_jbi_1:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000008,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_1:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_1:	
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
        bne     wait_loop_1
        nop
        
gen_err_jbi_2:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000010,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_2:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_2:	
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
        bne     wait_loop_2
        nop
        
gen_err_jbi_3:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000018,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_3:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_3:	
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
        bne     wait_loop_3
        nop
        
diag_pass:
        ta      T_GOOD_TRAP
        nop
        
diag_fail:
        ta      T_BAD_TRAP
        nop
        
#include "iob_subs.s"
#include "iob_data.s"

! Trap handlers.
SECTION .HTRAPS
.text
.align 64        
                        
! Data access error trap handler.
.global trap_data_access_error
trap_data_access_error:        
        setx    ERR_TRAP_EXECUTED,      %l0,    %l5     ! Signal trap taken        
        rdpr    %tt,    %l6     ! Save trap type value
        done

! Data access exception trap handler.
.global trap_data_access_exception
trap_data_access_exception:        
        setx    EXC_TRAP_EXECUTED,      %l0,    %l5     ! Signal trap taken        
        rdpr    %tt,    %l6     ! Save trap type value
        done

! Corrected ecc error trap handler.
.global trap_corrected_ecc_error
trap_corrected_ecc_error:        
        setx    ERR_TRAP_EXECUTED,      %l0,    %l5     ! Signal trap taken        
        rdpr    %tt,    %l6     ! Save trap type value
        retry

! Interrupt jbi trap handler.
.global trap_interrupt_jbi
trap_interrupt_jbi:
        
        ! Check the correct bit is set in the ASI interrupt registers.
        ldxa    [%g0] 0x72,     %g1
        setx    IOB_INT_ERR_PENDING,    %g2,    %g3
        cmp     %g1,    %g3
        bne     trap_diag_fail        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] 0x74,     %g1
        setx    IOB_INT_ERR_VEC,        %g2,    %g3
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
        
        ! Clear iob interrupt mask.
        setx    0x0000009800000408,     %l0,    %l1     ! Set interrupt control register address.
        set     0x0,    %l2     ! Write to interrupt control register.
        stx     %l2,    [%l1]
        
        retry

trap_diag_fail:
        ta      T_BAD_TRAP
        nop
