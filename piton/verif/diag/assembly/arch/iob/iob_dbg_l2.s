// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_dbg_l2.s
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
 * Name:   iob_dbg_l2.s
 * Date:   
 *
 *  Description: Read from and write to iob registers.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#include "boot.s"
#include "err_defines.h"
        
#define  L2_BANK0_ADDR      0x00
#define  L2_BANK1_ADDR      0x40
#define  L2_BANK2_ADDR      0x80
#define  L2_BANK3_ADDR      0xc0
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
        
.text
.align 64
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
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        rdth_id
        sllx    %o1,    0x28,   %l3
        
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
        
disable_l1:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        ! Remove the lower 2 bits (I-Cache and D-Cache enables)
        andn  %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL
                
gen_l2_b0_trig:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank0 control register.
        setx    0x000000a900000000,     %l0,    %l2     ! Set l2 bank0 control register address.
        stx     %l1,    [%l2]
        
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
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000020,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000028,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000030,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000038,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank0 control register.
        setx    0x000000a900000000,     %l0,    %l2     ! Set l2 bank0 control register address.
        stx     %l1,    [%l2]
        
gen_l2_b1_trig:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank1 control register.
        setx    0x000000a900000040,     %l0,    %l2     ! Set l2 bank1 control register address.
        stx     %l1,    [%l2]
        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000040,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000048,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000050,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000058,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000060,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000068,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000070,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000078,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank1 control register.
        setx    0x000000a900000040,     %l0,    %l2     ! Set l2 bank1 control register address.
        stx     %l1,    [%l2]
        
gen_l2_b2_trig:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank2 control register.
        setx    0x000000a900000080,     %l0,    %l2     ! Set l2 bank2 control register address.
        stx     %l1,    [%l2]
        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000080,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000088,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000090,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000098,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000a0,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000a8,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000b0,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000b8,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank2 control register.
        setx    0x000000a900000080,     %l0,    %l2     ! Set l2 bank2 control register address.
        stx     %l1,    [%l2]
        
gen_l2_b3_trig:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank3 control register.
        setx    0x000000a9000000c0,     %l0,    %l2     ! Set l2 bank3 control register address.
        stx     %l1,    [%l2]
        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000c0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000c8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000d0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000d8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000e0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000e8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000f0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000f8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank3 control register.
        setx    0x000000a9000000c0,     %l0,    %l2     ! Set l2 bank3 control register address.
        stx     %l1,    [%l2]
        
enable_l1:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        or    %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL        

diag_pass:
        ta      T_GOOD_TRAP
        nop
        
diag_fail:
        ta      T_BAD_TRAP
        nop
        
th_main_0:    
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     THREAD_COUNT,   %g2     ! Number of threads.
        set     0x2,            %g3
        cmp     %g2,    %g3
        beq     diag_pass_0
        nop
        
        rdth_id
        sllx    %o1,    0x28,   %l3

        !setx    0x0000009600000008,     %l0,    %l1
        !ldx     [%l1],            %l2
        !setx    0x4000000000000000,     %l0,    %l4
        !or      %l2,    %l4,    %l2
        !stx     %l2,    [%l1]
        
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
        
disable_l1_0:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        ! Remove the lower 2 bits (I-Cache and D-Cache enables)
        andn  %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL
                
gen_l2_b0_trig_0:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank0 control register.
        setx    0x000000a900000000,     %l0,    %l2     ! Set l2 bank0 control register address.
        stx     %l1,    [%l2]
        
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
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000020,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000028,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000030,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000038,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank0 control register.
        setx    0x000000a900000000,     %l0,    %l2     ! Set l2 bank0 control register address.
        stx     %l1,    [%l2]
        
gen_l2_b1_trig_0:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank1 control register.
        setx    0x000000a900000040,     %l0,    %l2     ! Set l2 bank1 control register address.
        stx     %l1,    [%l2]
        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000040,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000048,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000050,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000058,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000060,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000068,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000070,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000078,     %l0,    %l2     ! Set memory address bank 1.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank1 control register.
        setx    0x000000a900000040,     %l0,    %l2     ! Set l2 bank1 control register address.
        stx     %l1,    [%l2]
        
gen_l2_b2_trig_0:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank2 control register.
        setx    0x000000a900000080,     %l0,    %l2     ! Set l2 bank2 control register address.
        stx     %l1,    [%l2]
        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000080,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000088,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000090,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000098,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000a0,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000a8,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000b0,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000b8,     %l0,    %l2     ! Set memory address bank 2.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank2 control register.
        setx    0x000000a900000080,     %l0,    %l2     ! Set l2 bank2 control register address.
        stx     %l1,    [%l2]
        
gen_l2_b3_trig_0:
        setx    0x0000000000100000,     %l0,    %l1     ! Write to l2 bank3 control register.
        setx    0x000000a9000000c0,     %l0,    %l2     ! Set l2 bank3 control register address.
        stx     %l1,    [%l2]
        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000c0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000c8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000d0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000d8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000e0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0xaaaaaaaaaaaaaaaa,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000e8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x5555555555555555,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000f0,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000f8,     %l0,    %l2     ! Set memory address bank 3.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
                        
        setx    0x0000000000000000,     %l0,    %l1     ! Write to l2 bank3 control register.
        setx    0x000000a9000000c0,     %l0,    %l2     ! Set l2 bank3 control register address.
        stx     %l1,    [%l2]
        
enable_l1_0:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        or    %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL        

diag_pass_0:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_0:
        ta      T_BAD_TRAP
        nop
                                
#include "iob_subs.s"
#include "iob_reg_map.s"
