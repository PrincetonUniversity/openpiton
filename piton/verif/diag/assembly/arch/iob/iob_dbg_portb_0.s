// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_dbg_portb_0.s
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
 * Name:   iob_dbg_portb_0.s
 * Date:   
 *
 *  Description: Read from and write to iob registers.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#include "boot.s"
#include "err_defines.h"
        
.text
.global main
.global trap_data_access_error
.global trap_data_access_exception
.align 64
main:

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop
                
/* Setup l2 visibility port regiters. */                 

        rdth_id
        sllx    %o1,    0x28,   %l3

        setx    0x0000008000004100,     %l0,    %l2     ! Read from JBUS Debug Arb. Control reg.
        ldx     [%l2],  %l7
        setx    0xfffffffffffff7ff,     %l0,    %l1
        and     %l7, %l1, %l1
        stx     %l1,    [%l2]                           ! reset DATA_ARB bit .


        setx    0x0000000000000005,     %l0,    %l1     ! Write to l2 trig delay register.
        setx    0x0000009800001840,     %l0,    %l2     ! Set l2 trig delay register address.
        stx     %l1,    [%l2]

        setx    0xffffffffffffffcf,     %l0,    %l1     ! Write to l2 vis mask a register.
        setx    0x0000009800001820,     %l0,    %l2     ! Set l2 vis mask a register address.
        stx     %l1,    [%l2]

        setx    0x0004000000000000,     %l0,    %l1     ! Write to l2 vis compare a register.
        setx    0x0000009800001830,     %l0,    %l2     ! Set l2 vis compare a register address.
        or      %l3,    %l1,    %l4
        stx     %l4,    [%l2]

        setx    0xffffffffffffffcf,     %l0,    %l1     ! Write to l2 vis mask b register.
        setx    0x0000009800001828,     %l0,    %l2     ! Set l2 vis mask a register address.
        stx     %l1,    [%l2]

        setx    0x0004000000000008,     %l0,    %l1     ! Write to l2 vis compare b register.
        setx    0x0000009800001838,     %l0,    %l2     ! Set l2 vis compare a register address.
        or      %l3,    %l1,    %l4
        stx     %l4,    [%l2]

        setx    0x000000000000000c,     %l0,    %l1     ! Write to l2 vis control register.
        setx    0x0000009800001800,     %l0,    %l2     ! Set l2 vis control register address.
        stx     %l1,    [%l2]

/* Setup debug portb registers. */
        call    sub_init_dbg_portb
        save        
        nop        

disable_l1:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        ! Remove the lower 2 bits (I-Cache and D-Cache enables)
        andn  %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL

        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank0 control register.
        setx    0x000000a900000000,     %l0,    %l2     ! Set l2 bank0 control register address.
        stx     %l1,    [%l2]

        
/* Select hi l2 cache port and low l2 cache port. */                
sel_lo_l2_cache_port:
        setx    0x0000000000010000,     %l0,    %l1     ! Write to db jbus control register.
        setx    0x0000009800002100,     %l0,    %l2     ! Set db jbus control register address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1

        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000000,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000008,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000010,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000018,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
diag_pass:
        ta      T_GOOD_TRAP
        nop
        
diag_fail:
        ta      T_BAD_TRAP
        nop
        
#include "iob_subs.s"
#include "iob_reg_map.s"
