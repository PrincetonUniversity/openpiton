// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_dbg_porta_l2c0.s
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
 * Name:   iob_dbg_porta_l2c0.s
 * Date:   
 *
 *  Description: Read from and write to iob registers with cpx stall
 *               asserted directly.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Data_access_error_0x32          trap_data_access_error
#define H_HT0_Data_Access_Exception_0x30      trap_data_access_exception
#include "boot.s"
        

.text
.align 1024						! force alignment on 1K bondary
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
th_main_21:    
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

        rdth_id
        mov     %o1,    %g1
        cmp     %g0,    %g1     ! Initialize configuration registers only with thread 0.        
        bne     start_access
        nop
        
/********************************************************************************
First program all the configuration registers appropriately.
********************************************************************************/

/* Setup l2 visibility port regiters. */         
        setx    0x0000000000000008,     %l0,    %l1     ! Write to l2 vis control register.
        setx    0x0000009800001800,     %l0,    %l2     ! Set l2 vis control register address.
        stx     %l1,    [%l2]

        setx    0x00000003f0000000,     %l0,    %l1     ! Write to l2 vis mask a register.
        setx    0x0000009800001820,     %l0,    %l2     ! Set l2 vis mask a register address.
        stx     %l1,    [%l2]

        setx    0x00000000fffffc00,     %l0,    %l1     ! Write to l2 vis mask b register.
        setx    0x0000009800001828,     %l0,    %l2     ! Set l2 vis mask a register address.
        stx     %l1,    [%l2]

        setx    0x00000003f0000000,     %l0,    %l1     ! Write to l2 vis compare a register.
        setx    0x0000009800001830,     %l0,    %l2     ! Set l2 vis compare a register address.
        stx     %l1,    [%l2]

        setx    0x00000000aaaaa800,     %l0,    %l1     ! Write to l2 vis compare b register.
        setx    0x0000009800001838,     %l0,    %l2     ! Set l2 vis compare a register address.
        stx     %l1,    [%l2]

        setx    0x0000000000000005,     %l0,    %l1     ! Write to l2 trig delay register.
        setx    0x0000009800001840,     %l0,    %l2     ! Set l2 trig delay register address.
        stx     %l1,    [%l2]

/* Setup l2c control register. */                 
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2c0 control register.
        setx    0x000000A900000000,     %l0,    %l2     ! Set l2c0 control register address.
        stx     %l1,    [%l2]

/* Setup iob visibility port registers. */                 
        setx    0x0000000000000000,     %l0,    %l1     ! Write to iob vis select control register.
        setx    0x0000009800001000,     %l0,    %l2     ! Set iob vis select control register address.
        stx     %l1,    [%l2]

/* Setup debug porta registers. */                         
        setx    0x000000123456789a,     %l0,    %l1     ! Write to db enet idle val register.
        setx    0x0000009800002008,     %l0,    %l2     ! Set db enet idle val register address.
        stx     %l1,    [%l2]

        setx    0x0000000000000100,     %l0,    %l1     ! Write to db enet control register.
        setx    0x0000009800002000,     %l0,    %l2     ! Set db enet control register address.
        stx     %l1,    [%l2]

/********************************************************************************
Perform an l2c0 accesses.
********************************************************************************/
start_access:        
	set	0x20,   %g2                             ! load up loop counter
 	setx	0x00000003ffff0008,     %l0,    %g3     ! load up initial address
        sll     %g1,    0x3,    %g1
        add     %g3,    %g1,    %g3                     ! load different initial address for different thread

loop_0:
	set	0x20,   %g4                             ! load up loop counter
 	mov     %g3,    %g5                             ! load up some address

loop_1:
        stx	%g5,    [%g5]
	add	%g5,	0x8,	%g5			! increase address
	subcc	%g4,	0x1,	%g4			! decrement loop counter
        bge     %xcc,	loop_1				! repeat as long as loop counter >= 0
        nop

gen_rand_addr:
 	setx	0x000000000fffffff,	%l0,    %l1
 	and     %g3,    %l1,    %l1
        and     %l1,    0x1,    %l2
        and     %l1,    0x10,   %l3
        srl     %l3,    0x4,    %l3
        xor     %l2,    %l3,    %l4                     ! Xor lsb and 5th bit
        set     0x1b,   %l5
        sll     %l4,    %l5,    %l4
        srl     %l1,    0x1,    %l5
        or      %l4,    %l5,    %l4
 	setx	0x00000003f0000000,	%l0,    %l1
 	and     %g3,    %l1,    %l1
        or      %l1,    %l4,    %l1        
        setx    0xfffffffffffffff8,     %l0,    %l2
 	and     %l1,    %l2,    %g3                     ! Zero out lower 3 bits
        
	subcc	%g2,	0x1,	%g2			! decrement loop counter
        bge     %xcc,	loop_0				! repeat as long as loop counter >= 0
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
