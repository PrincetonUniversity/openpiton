/*
* Copyright (c) 2016 Princeton University
* All rights reserved.
* 
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of Princeton University nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
* 
* THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/****************************************************************
 * Name: princeton-test-test.s
 * Date: December 17, 2013
 *
 * Description: Test adding a test to the OpenSPARC T1 regressions
 *
 ****************************************************************/

#define     ITERATION_NUMBER    100000000

#include "boot.s"
#include "piton_def.h"

#define     PITON_PROFILING

.text
.global main
main:
    setx    hp_start, %l1, %l0
    jmp     %l0
    nop

    .global thread_work
thread_work:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! User space for text for all threads
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    PITON_UGET_LOCK(lock_addr, %l0)
    PITON_UPUTS(thread_ord_str, %l0)
    PITON_UPRINT_REG_NL(%g7, %l0)
    PITON_UPUTS(running_adds_str, %l0)
    PITON_UREL_LOCK(lock_addr, %l0)
    mov     0, %l0
    sub     %l0, 1, %l0     ! 64'hffffffffffffffff
    mov     1, %g1
    setx    ITERATION_NUMBER, %l1, %l2
thread_work_loop:
    add     %g0, %l0, %l1   ! 0's + f's
    subcc   %l2, 1, %l2
    bne     thread_work_loop
    add     %l1, %g1, %l3   ! f's + 1
! after thread_work_loop
    setx    epoch_start, %l1, %l0
    jmp     %l0
    nop
!   must not reach this point
    ba      test_good_end
    nop
test_good_end:
    ta      T_GOOD_TRAP
    ba      test_end    
    nop
test_bad_end:
    ta      T_BAD_TRAP
    ba      test_end
    nop
test_end:
    nop
    nop

    
#include "user_data_ldx_l2.s"

SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .ACTIVE_THREAD_SEC,
        hypervisor
        }

.text

    .global hp_start
hp_start:
    ta      T_CHANGE_HPRIV
    call    piton_multithread_init
    nop
    ba      hp_epoch_start
    nop
epoch_start:
    ta      T_CHANGE_HPRIV
hp_epoch_start:
    setx    epoch_lock, %l1, %l0
    PITON_GET_LOCK(epoch_lock, %l1)
    ldub    [%l0], %l2
    add     %l2, 1, %l2
    stb     %l2, [%l0]
    PITON_REL_LOCK(epoch_lock, %l1)
    
    call    get_core_thread
    nop
    call    calc_thread_order   ! o0, o1, o2 have necessary value after prev call
    nop
    mov     %o0, %g7        ! %g7 holds thread order number. Must not be changed!

    and     %g7, 2, %l0     ! th 2,3,6,7,10,11 etc. go to idle
    cmp     %l0, 0
    be      hp_go_idle
    nop
    ! Jump to do work if not going to idle
    ta      T_CHANGE_NONHPRIV
    setx    thread_work, %l0, %l1
    jmp     %l1
    nop

hp_go_idle:
    PITON_GET_LOCK(lock_addr, %l0)
    PITON_PUTS(thread_ord_str, %l0)
    PITON_PRINT_REG_NL(%g7, %l0)
    PITON_PUTS(going_idle_str, %l0)
    PITON_REL_LOCK(lock_addr, %l0)
    call    get_core_thread
    nop
    mov     %o0, %l0
    mov     %o1, %l1
    mov     %o2, %l2
    ! Thread puts itself to idle
    PITON_SEND_INT_MSG(PITON_INT_IDLE_MSG, %l0, %l1, %l2, %l3)
    nop
    nop
    nop
    ! after resume interrrupt message
    ba      hp_epoch_start


#include "piton_common.s"
#include "piton_multithread_init.s"