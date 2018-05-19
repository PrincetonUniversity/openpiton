// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_ssi.s
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
 * Name:   iob_int_ssi.s
 * Date:   
 *
 *  Description: Assert ssi interrupts.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Data_access_error_0x32            trap_data_access_error
#define H_HT0_Data_Access_Exception_0x30        trap_data_access_exception
#define H_HT0_Corrected_ECC_error_0x63          trap_corrected_ecc_error
#define H_HT0_Interrupt_0x60			trap_interrupt_ssi
#include "boot.s"

.text
.align 64
.global main
main:

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        set     IOB_INT_SSI_VEC,        %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
        
        setx    0x0000009800000410,     %l0,    %l1     ! Set interrupt management register address.
        set     0x0,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
        setx    0x000000ff00010088,     %l0,    %l1     ! Set ssi timeout register address.
        setx    0x0000000001800000,     %l0,    %l2     ! Write to ssi timeout register.
        stx     %l2,    [%l1]
        
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
        
gen_ssi_int:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int)) -> extint(100)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int:	
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
        bne     wait_loop_ssi_int
        nop
        stx     %g0,    [%l3]
                        
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
        done

! Interrupt jbi trap handler.
.global trap_interrupt_ssi
trap_interrupt_ssi:
        
        ! Check the correct bit is set in the ASI interrupt registers.
        ldxa    [%g0] 0x72,     %g1
        setx    IOB_INT_SSI_PENDING,    %g2,    %g3
        cmp     %g1,    %g3
        bne     trap_diag_fail        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] 0x74,     %g1
        setx    IOB_INT_SSI_VEC,        %g2,    %g3
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
        setx    0x0000009800000410,     %g1,    %g2     ! Set interrupt control register address.
        set     0x0,    %g3     ! Write to interrupt control register.
        stx     %g3,    [%g2]
        
        retry

trap_diag_fail:
        ta      T_BAD_TRAP
        nop
