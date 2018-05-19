// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_reg_mt_dst3.s
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
 * Name:   iob_reg_mt_dst3.s
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
        
diag_pass:   
        ta      T_GOOD_TRAP
        nop        
        
th_main_15:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_15: 
        
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
        bne     skip_sync_15
        nop                
sync_15:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_15:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_15
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_15:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_15
        nop
               
skip_sync_15:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_15
        nop                
                                                
diag_pass_15:   
        ta      T_GOOD_TRAP
        nop
        
diag_fail_15:   
        ta      T_BAD_TRAP
        nop
        
th_main_14:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_14:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        
        cmp     %g1,    %g3
        bne     skip_sync_14
        nop                
sync_14:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_14:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_14
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_14:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_14
        nop
               
skip_sync_14:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_14
        nop                
                        
diag_pass_14:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_14:
        ta      T_BAD_TRAP
        nop
        
th_main_13:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_13:
        
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
        bne     skip_sync_13
        nop                
sync_13:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_13:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_13
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_13:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_13
        nop
               
skip_sync_13:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_13
        nop                
                                                
diag_pass_13:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_13:
        ta      T_BAD_TRAP
        nop
        
th_main_12:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_12:
        
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
        bne     skip_sync_12
        nop                
sync_12:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_12:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_12
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_12:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_12
        nop
               
skip_sync_12:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_12
        nop                
                                                
diag_pass_12:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_12:
        ta      T_BAD_TRAP
        nop
        
th_main_11:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_11:
        
        ! ld/st to IOB invalid address. 
        ! Note that the mask has been changed to read only.
        ! This is used to inject more traffic.
        setx    IOB_INV_ADDR,   %l0,    %o0     ! Register address.
        call    sub_rw_inv_reg
        save        
        nop
        
        cmp     %g1,    %g3
        bne     skip_sync_11
        nop                
sync_11:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_11:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_11
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_11:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_11
        nop
               
skip_sync_11:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_11
        nop                
                        
diag_pass_11:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_11:
        ta      T_BAD_TRAP
        nop
        
th_main_10:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_10:
        
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
        bne     skip_sync_10
        nop                
sync_10:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_10:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_10
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_10:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_10
        nop
               
skip_sync_10:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_10
        nop                
                        
diag_pass_10:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_10:
        ta      T_BAD_TRAP
        nop
        
th_main_9:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_9:
        
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
        bne     skip_sync_9
        nop                
sync_9:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_9:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_9
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_9:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_9
        nop
               
skip_sync_9:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_9
        nop                
                        
diag_pass_9:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_9:
        ta      T_BAD_TRAP
        nop
        
th_main_8:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_8:
        
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
        bne     skip_sync_8
        nop                
sync_8:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_8:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_8
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_8:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_8
        nop
               
skip_sync_8:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_8
        nop                
                        
diag_pass_8:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_8:
        ta      T_BAD_TRAP
        nop
        
th_main_7:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_7:
        
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
        
        cmp     %g1,    %g3
        bne     skip_sync_7
        nop                
sync_7:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_7:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_7
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_7:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_7
        nop
               
skip_sync_7:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_7
        nop                
                        
diag_pass_7:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_7:
        ta      T_BAD_TRAP
        nop
        
th_main_6:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_6:
        
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
        bne     skip_sync_6
        nop                
sync_6:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_6:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_6
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_6:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_6
        nop
               
skip_sync_6:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_6
        nop                
                        
diag_pass_6:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_6:
        ta      T_BAD_TRAP
        nop
        
th_main_5:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_5:
        
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
        bne     skip_sync_5
        nop                
sync_5:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_5:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_5
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_5:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_5
        nop
               
skip_sync_5:               
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
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_4:
        
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
        bne     skip_sync_4
        nop                
sync_4:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_4:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_4
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_4:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_4
        nop
               
skip_sync_4:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_4
        nop                
                        
diag_pass_4:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_4:
        ta      T_BAD_TRAP
        nop
        
th_main_3:    
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_3:
        
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
        bne     skip_sync_3
        nop                
sync_3:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_3:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_3
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_3:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_3
        nop
               
skip_sync_3:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_3
        nop                
                        
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

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_2:
        
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
        bne     skip_sync_2
        nop                
sync_2:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_2:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_2
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_2:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_2
        nop
               
skip_sync_2:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_2
        nop                
                        
diag_pass_2:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_2:
        ta      T_BAD_TRAP
        nop
        
th_main_1:
        
        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_1:
        
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
        bne     skip_sync_1
        nop                
sync_1:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_1:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_1
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_1:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_1
        nop
               
skip_sync_1:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_1
        nop                
                        
diag_pass_1:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_1:
        ta      T_BAD_TRAP
        nop
        
th_main_0:    

        set     0x0,    %l0

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        set     0x0,    %g1
        set     0x15,   %g2
        set     0x3,    %g3

rw_reg_loop_0:
        
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
        bne     skip_sync_0
        nop                
sync_0:
        setx	sync_counter,   %l1,    %l0   
sync_thr_wait_for_inc_0:
        ldstub	[%l0], %l1
        cmp	%l1, 0xff
        be	sync_thr_wait_for_inc_0
        nop
        inc	%l1       
        stub	%l1, [%l0]

sync_thr_wait_for_all_0:
        ldub   [%l0], %l1
        cmp    %l1, THREAD_COUNT
        bne    sync_thr_wait_for_all_0
        nop
        
assert_cpx_stall:               
        nop     !$EV trig_pc_d(1, expr(@VA(.MAIN.assert_cpx_stall), 16, 16))->cpx_stall(3, 10000)
               
skip_sync_0:               
        add     %g1,    0x1,   %g1
        cmp     %g2,    %g1
        bne     rw_reg_loop_0
        nop                
                                                
diag_pass_0:
        ta      T_GOOD_TRAP
        nop
        
diag_fail_0:
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
        
.data
.align 64
.global sync_counter
sync_counter:
        .xword   0x0
