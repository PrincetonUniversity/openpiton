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

/*********************************************************/
#include "boot.s"
#include "piton_def.h"

#define  LOOP_ITER_NUM 50000000

.text
.global main
main:
    setx    hp_start, %l1, %l0
    jmp     %l0
    nop

    .global     all_threads
all_threads:
    !! Note: comment 'mov' and uncomment 'setx' to set correct address
    !!       for loads manually
    mov     %g1, %l0
    ! setx    data_core_0, %l2, %l0

    setx    PITON_L1D_WAY_SIZE, %l2, %l5
    ! preload data to L2 and evict from L1D at the same time
    ldx     [%l0], %l6
    add     %l0, %l5, %l1
    ldx     [%l1], %l6
    add     %l1, %l5, %l2
    ldx     [%l2], %l6
    add     %l2, %l5, %l3
    ldx     [%l3], %l6
    add     %l3, %l5, %l4
    ldx     [%l4], %l6
    ! loop variables
    setx    0, %g2, %g1
    setx    LOOP_ITER_NUM, %g3, %g2
    ! Save event counter
    mov     SPARC_PIC, %g6
    ! save start ticks
    rd      %tick, %g4
ld_l2_loop:
    ldx     [%l0], %o0
    mov     %g0, %o0
    sub     %o0, 1, %o0
    add     %o0, 1, %o0
    stx     %o0, [%l0]

    ldx     [%l1], %o1
    mov     %g0, %o1
    sub     %o1, 1, %o1
    add     %o1, 1, %o1
    stx     %o1, [%l1]

    ldx     [%l2], %o2
    mov     %g0, %o2
    sub     %o2, 1, %o2
    add     %o2, 1, %o2
    stx     %o2, [%l2]

    ldx     [%l3], %o3
    mov     %g0, %o3
    sub     %o3, 1, %o3
    add     %o3, 1, %o3
    stx     %o3, [%l3]

    ldx     [%l4], %o4
    mov     %g0, %o4
    sub     %o4, 1, %o4
    add     %o4, 1, %o4
    ! loop count computation
    add     %g1, 1, %g1
    cmp     %g1, %g2
    blt     ld_l2_loop
    stx     %o4, [%l4]

    ! Print execution time and events
    ! mov     SPARC_PIC, %g7
    ! rd      %tick, %g5
    ! PITON_UGET_LOCK(lock_addr, %l6)
    ! PITON_UPRINT_CYCLE_NUM(%g4, %g5)
    ! PITON_UPRINT_EVENT_NUM(%g6, %g7)
    PITON_UREL_LOCK(lock_addr, %l6)
    ! update shared count when threads complete
    PITON_UGET_LOCK(lock_addr, %l0)
    setx    test_end_shared_cnt, %l2, %l1
    ldub    [%l1], %l2
    add     %l2, 1, %l2
    stb     %l2, [%l1]
    PITON_UREL_LOCK(lock_addr, %l0)
    ! Wait for all threads to complete
    call    calc_num_waken_threads
    nop
wait_threads_complete_odd:
    ldub    [%l1], %l2
    cmp     %l2, %o0
    bne     wait_threads_complete_odd
    nop
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

.data
.align 0x1fff+1
    
test_end_shared_cnt:
    .word 0
    
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

    call    get_core_thread
    nop
    call    calc_thread_order   ! o0, o1, o2 have necessary value after prev call
    nop

    ! assuming home allocation was set to mid in hboot
    setx    PITON_L2_MID_SIZE, %l3, %l2
    mulx    %o0, %l2, %l1
    setx    PITON_USER_L2_START, %l2, %l0
    add     %l0, %l1, %g1

    ta      T_CHANGE_NONHPRIV
    setx    all_threads, %l0, %l1
    jmp     %l1
    nop

#include "piton_common.s"
#include "piton_multithread_init.s"
