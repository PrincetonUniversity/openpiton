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

    .global     thread_work
thread_work:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! User space for text for all threads
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    PITON_UGET_LOCK(lock_addr, %l0)
    PITON_UPUTS(thread_ord_str, %l0)
    PITON_UPRINT_REG(%g7)
    PITON_UPUTS(running_adds_str, %l0)
    PITON_UREL_LOCK(lock_addr, %l0)
    mov     0, %l0
    sub     %l0, 1, %l0     ! 64'hffffffffffffffff
    mov     1, %g1
    setx    ITERATION_NUMBER, %l1, %g2
thread_work_loop:
    add     %g0, %l0, %l1   ! 0's + f's
    add     %l0, %g1, %l2   ! f's + 1
    add     %g0, %l0, %l3
    add     %l0, %g1, %l4
    add     %g0, %l0, %l5
    subcc   %g2, 1, %g2
    bne     thread_work_loop
    add     %l0, %g1, %l6   ! f's + 1
! after thread_work_loop
    ! fall through to thread_nop

    .global     thread_nop
thread_nop:
    PITON_UGET_LOCK(lock_addr, %l0)
    PITON_UPUTS(thread_ord_str, %l0)
    PITON_UPRINT_REG(%g7)
    PITON_UPUTS(runing_nops_str, %l0)
    PITON_UREL_LOCK(lock_addr, %l0)
    setx    ITERATION_NUMBER, %l1, %l2
thread_nop_loop:
    nop
    nop
    nop
    nop
    nop
    subcc   %l2, 1, %l2
    bne     thread_nop_loop
    nop
    ba      thread_work
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
epoch_start:
    ta      T_CHANGE_HPRIV

    call    get_core_thread
    nop
    call    calc_thread_order   ! o0, o1, o2 have necessary value after prev call
    nop
    mov     %o0, %g7        ! %g7 holds thread order number. Must not be changed!
    and     %g7, 2, %l0     ! th 2,3,6,7,10,11 etc. go to idle
    cmp     %l0, 0
    be      jump_thread_nop
    nop
    ! Jump to do work if not going to idle
    ta      T_CHANGE_NONHPRIV
    setx    thread_work, %l0, %l1
    jmp     %l1
    nop

jump_thread_nop:
    ta      T_CHANGE_NONHPRIV
    setx    thread_nop, %l0, %l1
    jmp     %l1
    nop


#include "piton_common.s"
#include "piton_multithread_init.s"