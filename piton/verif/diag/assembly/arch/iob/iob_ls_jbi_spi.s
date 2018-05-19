// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_ls_jbi_spi.s
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
 * Name:   iob_ls_jbi_spi.s
 * Date:   
 *
 *  Description: Read from and write to iob registers.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Data_access_error_0x32          trap_data_access_error
#define H_HT0_Data_Access_Exception_0x30      trap_data_access_exception
#include "boot.s"
        
.text
.align 64
.global main
main:

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

	! Initialize jbi registers.
        call    sub_init_jbi
        save        
        nop

        ! Test out ld/st extended word to jbi.
        setx    0x000000c000000000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stx     %l2,    [%l1]
        ldx     [%l1],  %l3
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
                
        ! Test out ld/st unsigned byte to jbi.
        setx    0x000000c000000000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stub    %l2,    [%l1]
        ldub    [%l1],  %l3
        setx    0x00000000000000ff,     %l0,    %l4     ! Write value.
        and     %l2,    %l4,    %l2     ! Observed value anded with read mask.
        and     %l3,    %l4,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st unsigned half word to jbi.
        setx    0x000000c000000000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stuh    %l2,    [%l1]
        lduh    [%l1],  %l3
        setx    0x000000000000ffff,     %l0,    %l4     ! Write value.
        and     %l2,    %l4,    %l2     ! Observed value anded with read mask.
        and     %l3,    %l4,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st unsigned word to jbi.
        setx    0x000000c000000000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stuw    %l2,    [%l1]
        lduw    [%l1],  %l3
        setx    0x00000000ffffffff,     %l0,    %l4     ! Write value.
        and     %l2,    %l4,    %l2     ! Observed value anded with read mask.
        and     %l3,    %l4,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st unsigned double word to jbi.
        setx    0x000000c000000000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        setx    0x123456789abcdef0,     %l0,    %l3     ! Write value.
        std     %l2,    [%l1]
        ldd     [%l1],  %l4
        setx    0x00000000ffffffff,     %l0,    %l6     ! Write value.
        and     %l2,    %l6,    %l2     ! Observed value anded with read mask.
        and     %l4,    %l6,    %l4     ! Expected value anded with read mask.
        cmp     %l2,    %l4                
        bne     %xcc,   diag_fail
        nop
        setx    0x00000000ffffffff,     %l0,    %l6     ! Write value.
        and     %l3,    %l6,    %l3     ! Observed value anded with read mask.
        and     %l5,    %l6,    %l5     ! Expected value anded with read mask.
        cmp     %l3,    %l5                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st extended word to spi.
        setx    0x000000fff0002000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stx     %l2,    [%l1]
        ldx     [%l1],  %l3
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
                
        ! Test out ld/st unsigned byte to spi.
        setx    0x000000fff0002000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stub    %l2,    [%l1]
        ldub    [%l1],  %l3
        setx    0x00000000000000ff,     %l0,    %l4     ! Write value.
        and     %l2,    %l4,    %l2     ! Observed value anded with read mask.
        and     %l3,    %l4,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st unsigned half word to spi.
        setx    0x000000fff0002000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stuh    %l2,    [%l1]
        lduh    [%l1],  %l3
        setx    0x000000000000ffff,     %l0,    %l4     ! Write value.
        and     %l2,    %l4,    %l2     ! Observed value anded with read mask.
        and     %l3,    %l4,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st unsigned word to spi.
        setx    0x000000fff0002000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        stuw    %l2,    [%l1]
        lduw    [%l1],  %l3
        setx    0x00000000ffffffff,     %l0,    %l4     ! Write value.
        and     %l2,    %l4,    %l2     ! Observed value anded with read mask.
        and     %l3,    %l4,    %l3     ! Expected value anded with read mask.
        cmp     %l2,    %l3                
        bne     %xcc,   diag_fail
        nop
        
        ! Test out ld/st unsigned double word to spi.
        setx    0x000000fff0002000,     %l0,    %l1        
        setx    0x123456789abcdef0,     %l0,    %l2     ! Write value.
        setx    0x123456789abcdef0,     %l0,    %l3     ! Write value.
        std     %l2,    [%l1]
        ldd     [%l1],  %l4
        setx    0x00000000ffffffff,     %l0,    %l6     ! Write value.
        and     %l2,    %l6,    %l2     ! Observed value anded with read mask.
        and     %l4,    %l6,    %l4     ! Expected value anded with read mask.
        cmp     %l2,    %l4                
        bne     %xcc,   diag_fail
        nop
        setx    0x00000000ffffffff,     %l0,    %l6     ! Write value.
        and     %l3,    %l6,    %l3     ! Observed value anded with read mask.
        and     %l5,    %l6,    %l5     ! Expected value anded with read mask.
        cmp     %l3,    %l5                
        bne     %xcc,   diag_fail
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
                        
! Error trap handler.
.global trap_data_access_error
trap_data_access_error:        
        setx    ERR_TRAP_EXECUTED,      %l0,    %o0     ! Signal trap taken        
        rdpr    %tt,    %o1     ! Save trap type value
        done

! Exception trap handler.
.global trap_data_access_exception
trap_data_access_exception:        
        setx    EXC_TRAP_EXECUTED,      %l0,    %o0     ! Signal trap taken        
        rdpr    %tt,    %o1     ! Save trap type value
        done
