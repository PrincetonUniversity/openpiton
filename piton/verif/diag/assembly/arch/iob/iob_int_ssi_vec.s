// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_ssi_vec.s
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
 * Name:   iob_int_ssi_vec.s
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
        
        set     0x0,    %l7
gen_ssi_int_loop_0:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_0:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_0)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_0:	
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
        bne     wait_loop_ssi_int_0
        nop
        stx     %g0,    [%l3]
                                
        set     0x1,    %l7
gen_ssi_int_loop_1:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1:	
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
        bne     wait_loop_ssi_int_1
        nop
        stx     %g0,    [%l3]
                                
        set     0x2,    %l7
gen_ssi_int_loop_2:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_2:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_2)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_2:	
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
        bne     wait_loop_ssi_int_2
        nop
        stx     %g0,    [%l3]
                                
        set     0x3,    %l7
gen_ssi_int_loop_3:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_3:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_3)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_3:	
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
        bne     wait_loop_ssi_int_3
        nop
        stx     %g0,    [%l3]
                                
        set     0x4,    %l7
gen_ssi_int_loop_4:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_4:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_4)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_4:	
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
        bne     wait_loop_ssi_int_4
        nop
        stx     %g0,    [%l3]
                                
        set     0x5,    %l7
gen_ssi_int_loop_5:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_5:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_5)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_5:	
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
        bne     wait_loop_ssi_int_5
        nop
        stx     %g0,    [%l3]
                                
        set     0x6,    %l7
gen_ssi_int_loop_6:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_6:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_6)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_6:	
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
        bne     wait_loop_ssi_int_6
        nop
        stx     %g0,    [%l3]
                                
        set     0x7,    %l7
gen_ssi_int_loop_7:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_7:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_7)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_7:	
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
        bne     wait_loop_ssi_int_7
        nop
        stx     %g0,    [%l3]
                                
        set     0x8,    %l7
gen_ssi_int_loop_8:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_8:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_8)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_8:	
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
        bne     wait_loop_ssi_int_8
        nop
        stx     %g0,    [%l3]
                                
        set     0x9,    %l7
gen_ssi_int_loop_9:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_9:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_9)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_9:	
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
        bne     wait_loop_ssi_int_9
        nop
        stx     %g0,    [%l3]
                                
        set     0xa,    %l7
gen_ssi_int_loop_a:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_a:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_a)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_a:	
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
        bne     wait_loop_ssi_int_a
        nop
        stx     %g0,    [%l3]
                                
        set     0xb,    %l7
gen_ssi_int_loop_b:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_b:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_b)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_b:	
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
        bne     wait_loop_ssi_int_b
        nop
        stx     %g0,    [%l3]
                                
        set     0xc,    %l7
gen_ssi_int_loop_c:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_c:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_c)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_c:	
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
        bne     wait_loop_ssi_int_c
        nop
        stx     %g0,    [%l3]
                                
        set     0xd,    %l7
gen_ssi_int_loop_d:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_d:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_d)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_d:	
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
        bne     wait_loop_ssi_int_d
        nop
        stx     %g0,    [%l3]
                                
        set     0xd,    %l7
gen_ssi_int_loop_e:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_e:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_e)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_e:	
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
        bne     wait_loop_ssi_int_e
        nop
        stx     %g0,    [%l3]
                                
        set     0xf,    %l7
gen_ssi_int_loop_f:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_f:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_f)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_f:	
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
        bne     wait_loop_ssi_int_f
        nop
        stx     %g0,    [%l3]
                                
        set     0x10,   %l7
gen_ssi_int_loop_10:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_10:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_10)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_10:	
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
        bne     wait_loop_ssi_int_10
        nop
        stx     %g0,    [%l3]
                                
        set     0x11,   %l7
gen_ssi_int_loop_11:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_11:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_11)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_11:	
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
        bne     wait_loop_ssi_int_11
        nop
        stx     %g0,    [%l3]
                                
        set     0x12,   %l7
gen_ssi_int_loop_12:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_12:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_12)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_12:	
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
        bne     wait_loop_ssi_int_12
        nop
        stx     %g0,    [%l3]
                                
        set     0x13,   %l7
gen_ssi_int_loop_13:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_13:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_13)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_13:	
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
        bne     wait_loop_ssi_int_13
        nop
        stx     %g0,    [%l3]
                                
        set     0x14,   %l7
gen_ssi_int_loop_14:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_14:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_14)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_14:	
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
        bne     wait_loop_ssi_int_14
        nop
        stx     %g0,    [%l3]
                                
        set     0x15,   %l7
gen_ssi_int_loop_15:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_15:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_15)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_15:	
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
        bne     wait_loop_ssi_int_15
        nop
        stx     %g0,    [%l3]
                                
        set     0x16,   %l7
gen_ssi_int_loop_16:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_16:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_16)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_16:	
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
        bne     wait_loop_ssi_int_16
        nop
        stx     %g0,    [%l3]
                                
        set     0x17,   %l7
gen_ssi_int_loop_17:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_17:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_17)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_17:	
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
        bne     wait_loop_ssi_int_17
        nop
        stx     %g0,    [%l3]
                                
        set     0x18,   %l7
gen_ssi_int_loop_18:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_18:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_18)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_18:	
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
        bne     wait_loop_ssi_int_18
        nop
        stx     %g0,    [%l3]
                                
        set     0x19,   %l7
gen_ssi_int_loop_19:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_19:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_19)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_19:	
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
        bne     wait_loop_ssi_int_19
        nop
        stx     %g0,    [%l3]
                                
        set     0x1a,   %l7
gen_ssi_int_loop_1a:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1a:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1a)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1a:	
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
        bne     wait_loop_ssi_int_1a
        nop
        stx     %g0,    [%l3]
                                
        set     0x1b,   %l7
gen_ssi_int_loop_1b:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1b:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1b)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1b:	
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
        bne     wait_loop_ssi_int_1b
        nop
        stx     %g0,    [%l3]
                                
        set     0x1c,   %l7
gen_ssi_int_loop_1c:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1c:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1c)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1c:	
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
        bne     wait_loop_ssi_int_1c
        nop
        stx     %g0,    [%l3]
                                
        set     0x1d,   %l7
gen_ssi_int_loop_1d:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1d:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1d)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1d:	
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
        bne     wait_loop_ssi_int_1d
        nop
        stx     %g0,    [%l3]
                                
        set     0x1d,   %l7
gen_ssi_int_loop_1e:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1e:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1e)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1e:	
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
        bne     wait_loop_ssi_int_1e
        nop
        stx     %g0,    [%l3]
                                
        set     0x1f,   %l7
gen_ssi_int_loop_1f:        
        setx    0x0000009800000010,     %l0,    %l1     ! Set interrupt management register address.
        mov     %l7,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
                
gen_ssi_int_1f:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_1f)) -> extint(10)

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_1f:	
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
        bne     wait_loop_ssi_int_1f
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
        set     0x1,    %g2
        sllx    %g2,    %l7,    %g3
        cmp     %g1,    %g3
        bne     trap_diag_fail        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] 0x74,     %g1
        mov     %l7,    %g3
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
