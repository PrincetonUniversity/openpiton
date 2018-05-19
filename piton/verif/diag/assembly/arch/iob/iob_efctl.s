// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_efctl.s
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
	
        ! ld/st to IOB registers.
        setx    SERIAL_NUM,	%l0,    %l1     ! Set serial number value.
        setx    0x9800000820,	%l0,    %l2     ! Set serial number register address.
        ldx     [%l2],  %l3
	cmp	%l1,	%l3
	bne	diag_fail
	nop
		                
        setx    CORE_AVAIL,	%l0,    %l1     ! Set core avail value.
        setx    0x9800000830,	%l0,    %l2     ! Set core avail register address.
        ldx     [%l2],  %l3
	cmp	%l1,	%l3
	bne	diag_fail
	nop
		                
        setx    FUSE_STAT, 	%l0,    %l1     ! Set fuse stat value.
        setx    0x9800000840,	%l0,    %l2     ! Set fuse stat address.
        ldx     [%l2],  %l3
	cmp	%l1,	%l3
	bne	diag_fail
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
