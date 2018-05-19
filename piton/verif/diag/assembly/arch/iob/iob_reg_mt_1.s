// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_reg_mt_1.s
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
 * Name:   iob_reg_mt_1.s
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
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing. No need to run more than one core,
	! and no need to differentiate the threads because nobody stores
	! anything.
th_main_31:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_31: 
        
        ! ld/st to IOB registers.
        setx    0x0000009800002000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x000000000000016f,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_31
        nop                
                                                
diag_pass_31:   
        ta      T_GOOD_TRAP
        nop
        
diag_fail_31:   
        ta      T_BAD_TRAP
        nop
        
th_main_30:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_30:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_30
        nop                
                        
diag_pass_30:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_30:
        ta      T_BAD_TRAP
        nop
        
th_main_29:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_29:
        
        ! ld/st to IOB registers.
        setx    0x0000009800000408,     %l0,    %o0     ! Register address.
        setx    0x0000000000000003,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x0000000000000004,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_29
        nop                
                                                
diag_pass_29:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_29:
        ta      T_BAD_TRAP
        nop
        
th_main_28:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_28:
        
        ! ld/st to IOB registers.
        setx    0x0000009700000018,     %l0,    %o0     ! Register address.
        setx    0x0000000000000004,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000001000,     %l0,    %o2     ! Step.
        setx    0x0000000000000fff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_28
        nop                
                                                
diag_pass_28:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_28:
        ta      T_BAD_TRAP
        nop
        
th_main_27:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_27:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_27
        nop                
                        
diag_pass_27:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_27:
        ta      T_BAD_TRAP
        nop
        
th_main_26:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_26:
        
        ! ld/st to IOB registers. 
        setx    0x000000fff0002000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0xffffffffffffffff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_26
        nop                
                        
diag_pass_26:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_26:
        ta      T_BAD_TRAP
        nop
        
th_main_25:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_25:
        
        ! ld/st to IOB registers.
        setx    0x000000ff00010088,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0x0000000001ffffff,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000001,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_25
        nop                
                        
diag_pass_25:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_25:
        ta      T_BAD_TRAP
        nop
        
th_main_24:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_24:
        
        ! ld/st to IOB registers. 
        setx    0x0000009800001828,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x000f1f03ffffff3c,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_24
        nop                
                        
diag_pass_24:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_24:
        ta      T_BAD_TRAP
        nop
        
th_main_23:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_23:
        
        ! ld/st to IOB registers.
        setx    0x0000009600000038,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0x3f003f003f003f00,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x000000000000000e,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_23
        nop                
                        
diag_pass_23:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_23:
        ta      T_BAD_TRAP
        nop
        
th_main_22:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_22:
        
        ! ld/st to IOB registers.
        setx    0x0000009800001820,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x000f1f03ffffff3c,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_22
        nop                
                        
diag_pass_22:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_22:
        ta      T_BAD_TRAP
        nop
        
th_main_21:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_21:
        
        ! ld/st to IOB registers.
        setx    0x0000009800001800,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x0000000000000004,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_21
        nop                
                        
diag_pass_21:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_21:
        ta      T_BAD_TRAP
        nop
        
th_main_20:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_20:
        
        ! ld/st to IOB registers.
        setx    0x0000008000000000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0x0003f0c0ffc00003,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_20
        nop                
                        
diag_pass_20:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_20:
        ta      T_BAD_TRAP
        nop
        
th_main_19:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_19:
        
        ! ld/st to IOB registers.
        setx    0x0000009800000400,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x0000000000000000,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_19
        nop                
                        
diag_pass_19:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_19:
        ta      T_BAD_TRAP
        nop
        
th_main_18:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_18:
        
        ! ld/st to IOB registers.
        setx    0x0000009800000000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000004,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000008,     %l0,    %o2     ! Step.
        setx    0x0000000000001f3f,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_18
        nop                
                        
diag_pass_18:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_18:
        ta      T_BAD_TRAP
        nop
        
th_main_17:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_17:
        
        ! ld/st to IOB registers.
        setx    0x0000009700000008,     %l0,    %o0     ! Register address.
        setx    0x0000000000000004,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000001000,     %l0,    %o2     ! Step.
        setx    0x000000000000000f,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_17
        nop                
                        
diag_pass_17:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_17:
        ta      T_BAD_TRAP
        nop
        
th_main_16:    

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x10,   %g2

rw_reg_loop_16:
        
        ! ld/st to IOB registers.
        setx    0x0000009700000000,     %l0,    %o0     ! Register address.
        setx    0x0000000000000004,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000001000,     %l0,    %o2     ! Step.
        setx    0x000000000000000f,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_16
        nop                
                                                
diag_pass_16:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_16:
        ta      T_BAD_TRAP
        nop
        
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
        
diag_pass:   
        ta      T_GOOD_TRAP
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
