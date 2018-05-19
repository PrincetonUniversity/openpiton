// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_atomic.s
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
 * Name:   iob_atomic.s
 * Date:   
 *
 *  Description: Verify atomic instructions to io space.
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

rw_iob_atomic:        
        ! block ld/st to iob.
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        setx    0x0000009f00000400,     %l0,    %l3        
        
rw_iob_chk_swap:        
        ! Check if data access exception trap happenes for swap.
        swap    [%l3],  %l5
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_iob_chk_casa:        
        ! Check if data access exception trap happenes for swap.
        casa    [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_iob_chk_casxa:        
        ! Check if data access exception trap happenes for swap.
        casxa   [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_iob_chk_ldstub:        
        ! Check if data access exception trap happenes for swap.
        ldstub  [%l3],  %l0
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_jbi_atomic:
        ! block load to jbi through ASI_BLK_INIT_ST_QUAD_LDD_P
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        setx    0x000000c000000000,     %l0,    %l3
        
rw_jbi_chk_swap:        
        ! Check if data access exception trap happenes for swap.
        swap    [%l3],  %l5
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_jbi_chk_casa:        
        ! Check if data access exception trap happenes for swap.
        casa    [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_jbi_chk_casxa:        
        ! Check if data access exception trap happenes for swap.
        casxa   [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_jbi_chk_ldstub:        
        ! Check if data access exception trap happenes for swap.
        ldstub  [%l3],  %l0
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_clk_atomic:
        ! block load to clk through ASI_BLK_INIT_ST_QUAD_LDD_P
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        setx    0x0000009600000000,     %l0,    %l3
        
rw_clk_chk_swap:        
        ! Check if data access exception trap happenes for swap.
        swap    [%l3],  %l5
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_clk_chk_casa:        
        ! Check if data access exception trap happenes for swap.
        casa    [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_clk_chk_casxa:        
        ! Check if data access exception trap happenes for swap.
        casxa   [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_clk_chk_ldstub:        
        ! Check if data access exception trap happenes for swap.
        ldstub  [%l3],  %l0
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                                
rw_dram0_atomic:
        ! block load to dram0 through ASI_BLK_INIT_ST_QUAD_LDD_P
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        setx    0x0000009700000000,     %l0,    %l3
        
rw_dram0_chk_swap:        
        ! Check if data access exception trap happenes for swap.
        swap    [%l3],  %l5
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_dram0_chk_casa:        
        ! Check if data access exception trap happenes for swap.
        casa    [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_dram0_chk_casxa:        
        ! Check if data access exception trap happenes for swap.
        casxa   [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_dram0_chk_ldstub:        
        ! Check if data access exception trap happenes for swap.
        ldstub  [%l3],  %l0
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                                                
rw_spi_atomic:
        ! block load to spi through ASI_BLK_INIT_ST_QUAD_LDD_P
        setx    block_data_0,   %l0,    %l1
        setx    block_data,     %l0,    %l2
        setx    0x000000ff00010088,     %l0,    %l3
        
rw_spi_chk_swap:        
        ! Check if data access exception trap happenes for swap.
        swap    [%l3],  %l5
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_spi_chk_casa:        
        ! Check if data access exception trap happenes for swap.
        casa    [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_spi_chk_casxa:        
        ! Check if data access exception trap happenes for swap.
        casxa   [%l3]ASI_PRIMARY,       %l5,    %l6
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                        
rw_spi_chk_ldstub:        
        ! Check if data access exception trap happenes for swap.
        ldstub  [%l3],  %l0
        setx    EXC_TRAP_EXECUTED,      %l0,    %l4
        cmp     %o1,    %l4
        bne     diag_fail
        nop
        ! Check for trap type (0x32 for data access error, 0x30 for data access exception).
        mov     0x30,   %l4
        cmp     %o2,    %l4
        bne     diag_fail
        nop
        set     0x0,    %o1
        set     0x0,    %o2
                                                
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
        setx    ERR_TRAP_EXECUTED,      %l0,    %o1     ! Signal trap taken        
        rdpr    %tt,    %o2     ! Save trap type value
        done

! Exception trap handler.
.global trap_data_access_exception
trap_data_access_exception:        
        setx    EXC_TRAP_EXECUTED,      %l0,    %o1     ! Signal trap taken        
        rdpr    %tt,    %o2     ! Save trap type value
        done
