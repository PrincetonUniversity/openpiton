// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_dbg_porta_0.s
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
 * Name:   iob_dbg_porta_0.s
 * Date:   
 *
 *  Description: Test debug port a.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#include "boot.s"
        
.text
.global main
.global trap_data_access_error
.global trap_data_access_exception
.align 64
main:

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop
                
        setx    0x0000000000000000,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]

        setx    0x0000000000000001,     %l0,    %l1     ! Write to l2 vis control register.
        setx    0x0000009800001800,     %l0,    %l2     ! Set l2 vis control register address.
        stx     %l1,    [%l2]
        
        setx    0x000000123456789a,     %l0,    %l1     ! Write to db enet idle val register.
        setx    0x0000009800002008,     %l0,    %l2     ! Set db enet idle val register address.
        stx     %l1,    [%l2]
                
        setx    0x0000000000000100,     %l0,    %l1     ! Write to db enet control register.
        setx    0x0000009800002000,     %l0,    %l2     ! Set db enet control register address.
        stx     %l1,    [%l2]

/* Select l2 cache port. */                
sel_l2_cache_port:
        setx    0x0000000000000100,     %l0,    %l1     ! Write to db enet control register.
        setx    0x0000009800002000,     %l0,    %l2     ! Set db enet control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1

        
        set     0x0,    %o0     ! Skip selections.
        call    sub_gen_iob_dbg_data
        save        
        nop
                
diag_pass:
        ta      T_GOOD_TRAP
        nop
        
diag_fail:
        ta      T_BAD_TRAP
        nop
        
#include "iob_subs.s"
#include "iob_reg_map.s"
