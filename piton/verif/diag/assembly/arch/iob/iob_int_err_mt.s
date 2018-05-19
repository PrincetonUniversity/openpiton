// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_err_mt.s
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
 * Name:   iob_err_mt.s
 * Date:   
 *
 *  Description: Read from and write to iob registers.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#define H_HT0_Data_access_error_0x32            trap_data_access_error
#define H_HT0_Data_Access_Exception_0x30        trap_data_access_exception
#define H_HT0_Corrected_ECC_error_0x63          trap_corrected_ecc_error
#define H_HT0_Interrupt_0x60			trap_interrupt
#include "boot.s"
#include "err_defines.h"
        
#define  L2_ENTRY_PA        0x400590000
#define  L2_BANK0_ADDR      0x00
#define  L2_BANK1_ADDR      0x40
#define  L2_BANK2_ADDR      0x80
#define  L2_BANK3_ADDR      0xc0
#define  DRAM_CHANNEL_ADDR  0x2000
#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  TEST_DATA2         0x3000300081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

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
        
diag_pass:   
        ta      T_GOOD_TRAP
        nop

th_main_5:    		

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_5:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_5
        nop                
                        
diag_pass_5:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_5:
        ta      T_BAD_TRAP
        nop

th_main_4:    
		        
        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    L2_ENTRY_PA,    %l0,    %g1
        add     %g1,    L2_BANK0_ADDR,  %g1
        set     DRAM_CHANNEL_ADDR,      %g2
        setx    TEST_DATA0,     %l0,    %g3
        setx    DRAM_ES_W1C_VALUE,      %l0,    %g4
        setx    DRAM_ES_PA,     %l0,    %g5
        add     %g5,    %g2,    %g5
        setx    DRAM_EI_PA,     %l0,    %g6
        add     %g6,    %g2,    %g6
        setx    TEST_DATA2,     %l0,    %g7

        ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
        stx     %g4,    [%g5]
        
disable_l1_4:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        ! Remove the lower 2 bits (I-Cache and D-Cache enables)
        andn  %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2_4:
        setx  L2CS_PA1, %l1, %l0
        mov   0x1, %l2
        stx   %l2, [%l0+L2_BANK0_ADDR]

        ! Write 1 to clear L2 Error status registers
        setx  L2ES_PA1, %l3, %l4
        add   %l4, L2_BANK0_ADDR, %l4
        setx  L2_ES_W1C_VALUE, %l0, %l1
                
        setx  L2CS_PA1, %l1, %l0
        mov   0x1, %l2
        stx   %l2, [%l0+L2_BANK1_ADDR]

        ! Write 1 to clear L2 Error status registers
        setx  L2ES_PA1, %l3, %l4
        add   %l4, L2_BANK1_ADDR, %l4
        setx  L2_ES_W1C_VALUE, %l0, %l1
                
        setx  L2CS_PA1, %l1, %l0
        mov   0x1, %l2
        stx   %l2, [%l0+L2_BANK2_ADDR]

        ! Write 1 to clear L2 Error status registers
        setx  L2ES_PA1, %l3, %l4
        add   %l4, L2_BANK2_ADDR, %l4
        setx  L2_ES_W1C_VALUE, %l0, %l1
                
        setx  L2CS_PA1, %l1, %l0
        mov   0x1, %l2
        stx   %l2, [%l0+L2_BANK3_ADDR]

        ! Write 1 to clear L2 Error status registers
        setx  L2ES_PA1, %l3, %l4
        add   %l4, L2_BANK3_ADDR, %l4
        setx  L2_ES_W1C_VALUE, %l0, %l1
                
clear_l2_ESR_4:
        stx     %l1,    [%l4]
        nop

gen_err_dram_0_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700000290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700000298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000000,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_0_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_0_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_0_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_1_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700000290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700000298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000008,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_1_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_1_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_1_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_2_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700001290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700001298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000040,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_2_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_2_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_2_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_3_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700001290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700001298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000048,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1

        ! Wait till trap happens.             
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
        
check_trap_3_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_3_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_3_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_4_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700002290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700002298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000080,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_4_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_4_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_4_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_5_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700002290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700002298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x0000000000000088,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1

        ! Wait till trap happens.             
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
        
check_trap_5_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_5_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_5_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_6_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700003290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700003298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000c0,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_6:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_6_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_6_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_7_4:  
        setx    0x0000000080000001,     %l0,    %l1     ! Write to error injection register.
        setx    0x0000009700003290,     %l0,    %l2     ! Set error injection register address.
        stx     %l1,    [%l2]
        setx    0x0000000000030001,     %l0,    %l1     ! Write to error counter register.
        setx    0x0000009700003298,     %l0,    %l2     ! Set error counter register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to memory.
        setx    0x00000000000000c8,     %l0,    %l2     ! Set memory address bank 0.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_7_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_4
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_7_4:	
        nop
        nop
        nop
        nop
        setx    semaphore,      %l0,    %l1
        rdth_id        
        sll     %o1,    0x3,    %l2
        add     %l1,    %l2,    %l3
        ldx     [%l3],  %l4
        cmp     %l4,    %l5
        bne     wait_loop_7_4
        nop
        stx     %g0,    [%l3]
        
enable_l2_4:
        setx  L2CS_PA0, %l1, %l0
        stx   %g0, [%l0+L2_BANK0_ADDR]

enable_l1_4:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        or    %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL        

updt_int_cnt_4:                   
        setx    int_cnt,        %l1,    %l2
        ldx     [%l2],  %l3
        set     0x1,    %l4
        add     %l4,    %l3,    %l5
        stx     %l5,    [%l2]
                
diag_pass_4:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_4:
        ta      T_BAD_TRAP
        nop
	
th_main_3:
	
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
        
gen_ssi_int_3:
        nop     !$EV trig_pc_d(1, @VA(.MAIN.gen_ssi_int_3)) -> extint(100)

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
                        
diag_pass_3:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_3:
        ta      T_BAD_TRAP
        nop
        		        
th_main_2:    	

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x000000ff00010088,     %l0,    %l1     ! Set ssi timeout register address.
        setx    0x0000000001800000,     %l0,    %l2     ! Write to ssi timeout register.
        stx     %l2,    [%l1]
                
        ! Read spi error log register.
        setx    0x000000ff00000018,     %l0,    %l1     ! Set spi error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]
        membar  #Sync
wait_loop_err_clr_2:      
        ldx     [%l1],  %l2
        cmp     %g0,    %l2
        bne     wait_loop_err_clr_2
        nop
        
gen_ssi_int_err_2:
        setx    0xffffffffffffffff,     %l0,    %l1     ! Set ssi rom.
        setx    0x000000fff0002000,     %l0,    %l2     ! Set ssi rom address.
        stx     %l1,    [%l2]
        membar  #Sync
        nop     !$EV ssi_error(0x000000fff0002000)
        ldx     [%l2],  %l1
        
        ! Wait till trap happens.             
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
        
check_trap_2:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_2
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_2
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_ssi_int_err_2:	
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
        bne     wait_loop_ssi_int_err_2
        nop
        stx     %g0,    [%l3]
        
updt_int_cnt_2:                   
        setx    int_cnt,        %l1,    %l2
        ldx     [%l2],  %l3
        set     0x1,    %l4
        add     %l4,    %l3,    %l5
        stx     %l5,    [%l2]
                
diag_pass_2:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_2:
        ta      T_BAD_TRAP
        nop
        
th_main_1:
	                
        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000000000004000,     %l0,    %l1     ! Write to error log enable register.
        setx    0x0000008000010030,     %l0,    %l2     ! Set error log enable register address.
        stx     %l1,    [%l2]
        setx    0x0000000000004000,     %l0,    %l1     ! Write to error signal enable register.
        setx    0x0000008000010038,     %l0,    %l2     ! Set error signal enable register address.
        stx     %l1,    [%l2]
        setx    0x000000000000000c,     %l0,    %l1     ! Write to error config register.
        setx    0x0000008000010000,     %l0,    %l2     ! Set error config register address.
        stx     %l1,    [%l2]
        
gen_err_jbi_0_1:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000000,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_0_1:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_1
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_1
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_0_1:	
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
        bne     wait_loop_0_1
        nop
        
gen_err_jbi_1_1:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000008,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_1_1:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_1
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_1
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_1_1:	
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
        bne     wait_loop_1_1
        nop
        
gen_err_jbi_2_1:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000010,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_2_1:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_1
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_1
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_2_1:	
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
        bne     wait_loop_2_1
        nop
        
gen_err_jbi_3_1:
        setx    0x0000000021000001,     %l0,    %l1     ! Write to error inject register.
        setx    0x0000008000004800,     %l0,    %l2     ! Set error inject register address.
        stx     %l1,    [%l2]
        setx    0xffffffffffffffff,     %l0,    %l1     ! Write to jbi memory.
        setx    0x000000c000000018,     %l0,    %l2     ! Set jbi memory address.
        stx     %l1,    [%l2]
        membar  #Sync
        ldx     [%l2],  %l1
           
        ! Wait till trap happens.             
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
        
check_trap_3_1:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail_1
        nop        
        ! Check for trap type (0x32 for data access error).
        mov     0x32,   %l0
        cmp     %l6,    %l0
        bne     diag_fail_1
        nop

        ! Wait till interrupt has been generated to this thread.
wait_loop_3_1:	
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
        bne     wait_loop_3_1
        nop

updt_int_cnt_1:                   
        setx    int_cnt,        %l1,    %l2
        ldx     [%l2],  %l3
        set     0x1,    %l4
        add     %l4,    %l3,    %l5
        stx     %l5,    [%l2]
                
diag_pass_1:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_1:
        ta      T_BAD_TRAP
        nop
        
th_main_0:
        
        set     THREAD_COUNT,   %g1     ! Set number of expected thread to be active (excluding thread 0).
        sub     %g1,    0x1,    %g1

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000009800000008,     %l0,    %l1     ! Set interrupt management register address.
        set     IOB_INT_ERR_VEC,        %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
        
        setx    0x0000009800000408,     %l0,    %l1     ! Set interrupt management register address.
        set     0x0,    %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
        
        setx    0x0000008000010020,     %l0,    %l1     ! Set jbi error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]
        
        setx    0x0000009700000280,     %l0,    %l1     ! Set dram error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]
        
        setx    0x000000ff00000018,     %l0,    %l1     ! Set spi error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]
        
chk_int_cnt_loop:
        setx    int_cnt,        %l1,    %l2
        ldx     [%l2],  %l3
        cmp     %l3,    %g1
        bne     chk_int_cnt_loop
        nop
        
diag_pass_0:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_0:
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
        retry

! Interrupt jbi trap handler.
.global trap_interrupt
trap_interrupt:
        
        ! Clear interrupt pending bit in the ASI interrupt registers.
        ldxa    [%g0] 0x72,     %g1        
        ldxa    [%g0] 0x74,     %g1

        ! Poll all devices to find out which thread generates the interrupt.
poll_jbi_err:       
        setx    0x0000008000010020,     %l0,    %l2     ! Set jbi error log register address.
        ldx     [%l2],  %l1
        set     0x4000, %l2
        and     %l1,    %l2,    %l3
        cmp     %g0,    %l3
        beq     poll_spi_err
        nop
        setx    0x0000008000010020,     %l0,    %l1     ! Set jbi error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]        
        set     0x8,    %g3
        ba      write_mem
        nop
poll_spi_err:             
        setx    0x000000ff00000018,     %l0,    %l2     ! Set spi error log register address.
        ldx     [%l2],  %l1
        set     0x2,    %l2
        and     %l1,    %l2,    %l3
        cmp     %g0,    %l3
        beq     poll_dram_err
        nop
        setx    0x000000ff00000018,     %l0,    %l1     ! Set spi error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]
        set     0x10,   %g3
        ba      write_mem
        nop
poll_dram_err:             
        setx    0x0000009700000280,     %l0,    %l2     ! Set dram error log register address.
        ldx     [%l2],  %l1
        setx    0x2000000000000000,     %l0,    %l2
        and     %l1,    %l2,    %l3
        cmp     %g0,    %l3
        beq     %xcc,   poll_spi_int
        nop
        setx    0x0000009700000280,     %l0,    %l1     ! Set dram error log register address.
        setx    0xffffffffffffffff,     %l0,    %l2     ! Write to error log register.
        stx     %l2,    [%l1]        
        set     0x20,   %g3
        ba      write_mem
        nop                        
                
poll_spi_int:
        set     0x18,   %g3
        
        ! Write to memory to indicate interrupt completion.
write_mem:      
        setx    semaphore,      %g1,    %g2
        add     %g2,    %g3,    %g4
        setx    0x0123456789abcdef,     %g1,    %g5
        stx     %g5,    [%g4]
        
        ! Clear iob interrupt mask.
clr_int_mask:   
        setx    0x0000009800000408,     %l0,    %l1     ! Set interrupt control register address.
        set     0x0,    %l2     ! Write to interrupt control register.
        stx     %l2,    [%l1]
        
        retry

trap_diag_fail:
        ta      T_BAD_TRAP
        nop
