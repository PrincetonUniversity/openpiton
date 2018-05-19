// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_reg_mt_1_dst.s
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
 * Name:   iob_reg_mt_1_dst.s
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_31
        nop                
sync_31:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_31:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_31
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_31:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_31
        nop
               
skip_sync_31:               
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
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_30:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        
        cmp     %g1,    %g3
        bne     skip_sync_30
        nop                
sync_30:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_30:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_30
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_30:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_30
        nop
               
skip_sync_30:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_29
        nop                
sync_29:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_29:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_29
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_29:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_29
        nop
               
skip_sync_29:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_28
        nop                
sync_28:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_28:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_28
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_28:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_28
        nop
               
skip_sync_28:               
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
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_27:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        
        cmp     %g1,    %g3
        bne     skip_sync_27
        nop                
sync_27:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_27:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_27
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_27:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_27
        nop
               
skip_sync_27:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_26
        nop                
sync_26:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_26:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_26
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_26:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_26
        nop
               
skip_sync_26:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_25
        nop                
sync_25:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_25:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_25
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_25:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_25
        nop
               
skip_sync_25:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_24
        nop                
sync_24:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_24:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_24
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_24:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_24
        nop
               
skip_sync_24:               
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
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_23:
        
        ! ld/st to IOB registers.
        setx    0x0000009600000038,     %l0,    %o0     ! Register address.
        setx    0x0000000000000001,     %l0,    %o1     ! Number of registers.
        setx    0x0000000000000000,     %l0,    %o2     ! Step.
        setx    0x3f003f003f003f00,     %l0,    %o3     ! Register read mask.
        setx    0xffffffffffffffff,     %l0,    %o4     ! Register write mask.
        setx    0x0000000000000000,     %l0,    %o5     ! Skip pattern.
        call    sub_rw_reg
        save        
        nop
        
        cmp     %g1,    %g3
        bne     skip_sync_23
        nop                
sync_23:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_23:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_23
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_23:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_23
        nop
               
skip_sync_23:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_22
        nop                
sync_22:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_22:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_22
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_22:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_22
        nop
               
skip_sync_22:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_21
        nop                
sync_21:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_21:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_21
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_21:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_21
        nop
               
skip_sync_21:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_20
        nop                
sync_20:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_20:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_20
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_20:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_20
        nop
               
skip_sync_20:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_19
        nop                
sync_19:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_19:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_19
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_19:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_19
        nop
               
skip_sync_19:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_18
        nop                
sync_18:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_18:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_18
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_18:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_18
        nop
               
skip_sync_18:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_17
        nop                
sync_17:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_17:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_17
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_17:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_17
        nop
               
skip_sync_17:               
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
        set     0x15,   %g2
        set     0x3,    %g3

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
        
        cmp     %g1,    %g3
        bne     skip_sync_16
        nop                
sync_16:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_16:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_16
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_16:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_16
        nop
        
assert_cpx_stall:               
        nop     !$EV trig_pc_d(1, expr(@VA(.MAIN.assert_cpx_stall), 16, 16))->cpx_stall(0, 10000)
               
skip_sync_16:               
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
        
.data
.align 64
.global sync_counter
sync_counter:
        .xword   0x0
