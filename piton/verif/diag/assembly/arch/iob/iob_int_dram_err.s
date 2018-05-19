// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_int_dram_err.s
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
 * Name:   iob_int_dram_err.s
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
#define H_HT0_Interrupt_0x60			trap_interrupt_dram
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
        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000009800000008,     %l0,    %l1     ! Set interrupt management register address.
        set     IOB_INT_ERR_VEC,        %l2     ! Write to interrupt management register.
        stx     %l2,    [%l1]
        
        setx    0x0000009800000408,     %l0,    %l1     ! Set interrupt control register address.
        set     0x0,    %l2     ! Write to interrupt control register.
        stx     %l2,    [%l1]
        
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
        
disable_l1:
        ldxa  [%g0] ASI_LSU_CONTROL, %l0
        ! Remove the lower 2 bits (I-Cache and D-Cache enables)
        andn  %l0, 0x3, %l0
        stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
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
                
clear_l2_ESR:
        stx     %l1,    [%l4]
        nop

gen_err_dram_0:  
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
        
check_trap_0:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_0:	
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
        bne     wait_loop_0
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_1:  
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
        
check_trap_1:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_1:	
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
        bne     wait_loop_1
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_2:  
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
        
check_trap_2:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_2:	
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
        bne     wait_loop_2
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_3:  
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
        
check_trap_3:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_3:	
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
        bne     wait_loop_3
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_4:  
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
        
check_trap_4:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_4:	
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
        bne     wait_loop_4
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_5:  
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
        
check_trap_5:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_5:	
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
        bne     wait_loop_5
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_6:  
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
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_6:	
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
        bne     wait_loop_6
        nop
        stx     %g0,    [%l3]
        
gen_err_dram_7:  
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
        
check_trap_7:           
        ! Check if data access error trap happened. It should.
        setx    ERR_TRAP_EXECUTED,      %l1,    %l0
        cmp     %l5,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l5
        ! Check for trap type (0x63 for corrected ecc error).
        mov     0x63,   %l0
        cmp     %l6,    %l0
        bne     diag_fail
        nop
        set     0x0,    %l6

        ! Wait till interrupt has been generated to this thread.
        setx    0x0123456789abcdef,     %l0,    %l5
wait_loop_7:	
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
        bne     wait_loop_7
        nop
        stx     %g0,    [%l3]
        
enable_l2:
        setx  L2CS_PA0, %l1, %l0
        stx   %g0, [%l0+L2_BANK0_ADDR]

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

! Interrupt dram trap handler.
.global trap_interrupt_dram
trap_interrupt_dram:
        
        ! Check the correct bit is set in the ASI interrupt registers.
        ldxa    [%g0] 0x72,     %g1
        setx    IOB_INT_ERR_PENDING,    %g2,    %g3
        cmp     %g1,    %g3
        bne     trap_diag_fail        
        nop
        
        ! Check the correct vector is logged in the ASI interrupt registers.
        ldxa    [%g0] 0x74,     %g1
        setx    IOB_INT_ERR_VEC,        %g2,    %g3
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
        setx    0x0000009800000408,     %l0,    %l1     ! Set interrupt control register address.
        set     0x0,    %l2     ! Write to interrupt control register.
        stx     %l2,    [%l1]
        
        retry

trap_diag_fail:
        ta      T_BAD_TRAP
        nop
	
