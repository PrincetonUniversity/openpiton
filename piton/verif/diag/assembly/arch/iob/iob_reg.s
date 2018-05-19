// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_reg.s
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
 * Name:   iob_reg.s
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

        setx    iob_reg_map,    %l0,    %g1     ! Reg map table addr.
        setx    IOB_END_MAP,    %l0,    %g2     ! End of map value.

rw_reg_loop:
        ldx     [%g1],  %o0     ! Register address.
        cmp     %g2,    %o0
        be      %xcc,   rw_inv_reg_loop
        
        ! ld/st to IOB registers.
        add     %g1,    0x8,    %g1
        ldx     [%g1],  %o1     ! Number of registers.
        add     %g1,    0x8,    %g1
        ldx     [%g1],  %o2     ! Step.
        add     %g1,    0x8,    %g1
        ldx     [%g1],  %o3     ! Register read mask.
        add     %g1,    0x8,    %g1
        ldx     [%g1],  %o4     ! Register write mask.
        add     %g1,    0x8,    %g1
        ldx     [%g1],  %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x8,   %g1
        ba      rw_reg_loop
        nop                
                
rw_inv_reg_loop:
        
        ! ld/st to invalid IOB addr.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Reserved addr.
        call    sub_rw_inv_reg
        save        
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
