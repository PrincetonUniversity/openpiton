// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_quad_ls.s
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
 * Name:   iob_quad_ls.s
 * Date:   
 *
 *  Description: Verify quad_ld ld and st to io space.
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

        wr      %g0, 0x4, %fprs ! make sure fef is 1

rw_iob_nucleus_quad_ldd:        
        ! block ld/st to iob.
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        ldda    [%l2]ASI_NUCLEUS_QUAD_LDD,      %f0
        setx    0x0000009f00000400,     %l0,    %l3        
        
!rw_iob_chk_nucleus_quad_ldd_stda:        
!        ! Check if data access exception trap happenes for block store.
!        stda    %f0, [%l3]ASI_NUCLEUS_QUAD_LDD
!        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
!        cmp     %o0,    %l4
!        bne     diag_fail
!        nop
!        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
!        mov     0x30,   %l4
!        cmp     %o1,    %l4
!        bne     diag_fail
!        nop
        
!rw_iob_chk_nucleus_quad_ldd_ldda:        
!        ! Check if data access exception trap happened for block load.
!        ldda    [%l3]ASI_NUCLEUS_QUAD_LDD,      %f0
!        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
!        cmp     %o0,    %l4
!        bne     diag_fail
!        nop
!        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
!        mov     0x30,   %l4
!        cmp     %o1,    %l4
!        bne     diag_fail
!        nop
                
rw_jbi_nucleus_quad_ldd:
        ! block load to jbi through ASI_NUCLEUS_QUAD_LDD
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        ldda    [%l2]ASI_NUCLEUS_QUAD_LDD,      %o0
        setx    0x000000c000000000,     %l0,    %l3
        
!rw_jbi_chk_nucleus_quad_ldd_stda:        
!        ! Check if data access exception trap happenes for block store.
!        stda    %f0,   [%l3]ASI_BLK_P
!        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
!        cmp     %o0,    %l4
!        bne     diag_fail
!        nop
!        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
!        mov     0x30,   %l4
!        cmp     %o1,    %l4
!        bne     diag_fail
!        nop
        
rw_jbi_chk_nucleus_quad_ldd_ldda:        
        ldx     [%l2 + 0*8],    %l4
        stx     %l4,    [%l3 + 0*8]
        ldx     [%l2 + 1*8],    %l4
        stx     %l4,    [%l3 + 1*8]
        ldx     [%l2 + 2*8],    %l4
        stx     %l4,    [%l3 + 2*8]
        ldx     [%l2 + 3*8],    %l4
        stx     %l4,    [%l3 + 3*8]
        ldx     [%l2 + 4*8],    %l4
        stx     %l4,    [%l3 + 4*8]
        ldx     [%l2 + 5*8],    %l4
        stx     %l4,    [%l3 + 5*8]
        ldx     [%l2 + 6*8],    %l4
        stx     %l4,    [%l3 + 6*8]
        ldx     [%l2 + 7*8],    %l4
        stx     %l4,    [%l3 + 7*8]
        
        ! Wait till all previous writes complete.        
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
        
        ldda    [%l3]ASI_NUCLEUS_QUAD_LDD,      %o0
        setx    0x0123456789abcdef,     %l0,    %l4
        setx    0xfedcba9876543210,     %l0,    %l5
        cmp     %o0,    %l4
        bne     diag_fail
        nop
        cmp     %o1,    %l5
        bne     diag_fail
        nop
        
        ldx     [%l1 + 0*8],    %l4
        stx     %l4,    [%l3 + 0*8]
        ldx     [%l1 + 1*8],    %l4
        stx     %l4,    [%l3 + 1*8]
        ldx     [%l1 + 2*8],    %l4
        stx     %l4,    [%l3 + 2*8]
        ldx     [%l1 + 3*8],    %l4
        stx     %l4,    [%l3 + 3*8]
        ldx     [%l1 + 4*8],    %l4
        stx     %l4,    [%l3 + 4*8]
        ldx     [%l1 + 5*8],    %l4
        stx     %l4,    [%l3 + 5*8]
        ldx     [%l1 + 6*8],    %l4
        stx     %l4,    [%l3 + 6*8]
        ldx     [%l1 + 7*8],    %l4
        stx     %l4,    [%l3 + 7*8]
        
        ! Wait till all previous writes complete.        
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
        
        ldda    [%l3]ASI_NUCLEUS_QUAD_LDD,      %o0
        set     0x0,    %l4
        cmp     %o0,    %l4
        bne     diag_fail
        nop
        cmp     %o1,    %l4
        bne     diag_fail
        nop
                
rw_clk_nucleus_quad_ldd:
        
rw_dram0_nucleus_quad_ldd:
        
rw_dram1_nucleus_quad_ldd:
        
rw_spi_nucleus_quad_ldd:
        
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
.text
.align 64        
SECTION .HTRAPS
                        
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
