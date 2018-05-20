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

! Number of loop iterations
#define LOOP_ITERATIONS 10
#define EXPECTED_SUM 45

/*********************************************************/
#include "boot.s"
#include "piton_def.h"

#define     PITON_PROFILING

.text
.global main
main:
    setx    hp_start, %l1, %l0
    jmp     %l0
    nop

    .global even_thread
even_thread:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! User space for text for all threads
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    mov     0, %l0
    sub     %l0, 1, %l0     ! 64'hffffffffffffffff
    mov     0, %l1
    mov     0, %l2
    mov     0, %l3
    mov     0, %l4
    mov     0, %l5
    mov     0, %l6
    mov     0, %l7
add_loop:
    add     %l0, 0, %l1
    add     %l0, 0, %l2
    add     %l0, 0, %l3
    add     %l0, 0, %l4
    add     %l0, 0, %l5
    add     %l0, 0, %l6
    add     %l0, 0, %l7
    add     %l1, 1, %l1
    add     %l2, 1, %l2
    add     %l3, 1, %l3
    add     %l4, 1, %l4
    add     %l5, 1, %l5
    add     %l6, 1, %l6
    add     %l7, 1, %l7
    add     %l0, 0, %l1
    add     %l0, 0, %l2
    add     %l0, 0, %l3
    add     %l0, 0, %l4
    add     %l0, 0, %l5
    add     %l0, 0, %l6
    add     %l0, 0, %l7
    add     %l1, 1, %l1
    add     %l2, 1, %l2
    add     %l3, 1, %l3
    add     %l4, 1, %l4
    add     %l5, 1, %l5
    add     %l6, 1, %l6
    add     %l7, 1, %l7
    add     %l0, 0, %l1
    add     %l0, 0, %l2
    add     %l0, 0, %l3
    add     %l0, 0, %l4
    add     %l0, 0, %l5
    add     %l0, 0, %l6
    add     %l0, 0, %l7
    add     %l1, 1, %l1
    add     %l2, 1, %l2
    add     %l3, 1, %l3
    add     %l4, 1, %l4
    add     %l5, 1, %l5
    add     %l6, 1, %l6
    add     %l7, 1, %l7
    add     %l0, 0, %l1
    add     %l0, 0, %l2
    add     %l0, 0, %l3
    add     %l0, 0, %l4
    add     %l0, 0, %l5
    add     %l0, 0, %l6
    add     %l0, 0, %l7
    add     %l1, 1, %l1
    add     %l2, 1, %l2
    add     %l3, 1, %l3
    add     %l4, 1, %l4
    add     %l5, 1, %l5
    add     %l6, 1, %l6
    ba      add_loop
    add     %l7, 1, %l7
    ! *_tight tests should never reach this point
    ba      test_good_end
    nop

    .global     odd_thread
odd_thread:
    !! Note: comment 'mov' and uncomment 'setx' to set correct address
    !!       for loads manually
    mov     %g1, %l0
    ! setx    data_core_0, %l2, %l0

    setx    PITON_L1D_WAY_SIZE, %l2, %l5
    ! preload data to L2
    ldx     [%l0], %l6
    add     %l0, %l5, %l1
    ldx     [%l1], %l6
    add     %l1, %l5, %l2
    ldx     [%l2], %l6
    add     %l2, %l5, %l3
    ldx     [%l3], %l6
#ifdef PITON_PROFILING
    PITON_UGET_LOCK(lock_addr, %l6)
    PITON_UPUTS(prof_str, %g2)
    PITON_UPRINT_REG_NL(%l0, %g2)
    PITON_UREL_LOCK(lock_addr, %l6)
.align 32 ! make sure profiled code is in the same cache line (instr cache)
    mov     SPARC_PIC, %g2
    rd      %tick, %g4
    !!! Start of profiled code
    ldx     [%l0], %l6      ! data must be in L2
    !!! End of profiled code
    rd      %tick, %g5
    mov     SPARC_PIC, %g3
    PITON_UGET_LOCK(lock_addr, %l6)
    PITON_UPRINT_CYCLE_NUM(%g4, %g5)
    PITON_UREL_LOCK(lock_addr, %l6)
#endif
ld_l2_loop:
    ldx     [%l0], %o0
    mov     %g0, %o0
    sub     %o0, 1, %o0
    add     %o0, 1, %o0
    sub     %o0, 1, %o0
    add     %o0, 1, %o0
    sub     %o0, 1, %o0
    add     %o0, 1, %o0
    sub     %o0, 1, %o0
    add     %o0, 1, %o0
    sub     %o0, 1, %o0
    stx     %o0, [%l0]

    ldx     [%l1], %o1
    mov     %g0, %o1
    sub     %o1, 1, %o1
    add     %o1, 1, %o1
    sub     %o1, 1, %o1
    add     %o1, 1, %o1
    sub     %o1, 1, %o1
    add     %o1, 1, %o1
    sub     %o1, 1, %o1
    add     %o1, 1, %o1
    sub     %o1, 1, %o1
    stx     %o1, [%l1]

    ldx     [%l2], %o2
    mov     %g0, %o2
    sub     %o2, 1, %o2
    add     %o2, 1, %o2
    sub     %o2, 1, %o2
    add     %o2, 1, %o2
    sub     %o2, 1, %o2
    add     %o2, 1, %o2
    sub     %o2, 1, %o2
    add     %o2, 1, %o2
    sub     %o2, 1, %o2
    stx     %o2, [%l2]

    ldx     [%l3], %o3
    mov     %g0, %o3
    sub     %o3, 1, %o3
    add     %o3, 1, %o3
    sub     %o3, 1, %o3
    add     %o3, 1, %o3
    sub     %o3, 1, %o3
    add     %o3, 1, %o3
    sub     %o3, 1, %o3
    add     %o3, 1, %o3
    sub     %o3, 1, %o3
    ba      ld_l2_loop
    stx     %o3, [%l3]
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
    call    get_core_thread
    nop
    call    calc_thread_order   ! o0, o1, o2 have necessary value after prev call
    nop
    and     %o0, 1, %l0
    cmp     %l0, 0
    be      jump_even_thread
    nop

    call    get_core_thread
    nop
    mulx    %o1, PITON_Y_DIM, %l0
    add     %l0, %o0, %l1
    ! assuming home allocation was set to mid in hboot
    setx    PITON_L2_MID_SIZE, %l3, %l2
    mulx    %l1, %l2, %l1
    setx    PITON_USER_L2_START, %l2, %l0
    add     %l0, %l1, %g1

jump_odd_thread:
    ta      T_CHANGE_NONHPRIV
    setx    odd_thread, %l0, %l1
    jmp     %l1
    nop

jump_even_thread:
    ta      T_CHANGE_NONHPRIV
    setx    even_thread, %l0, %l1
    jmp     %l1
    nop

#include "piton_common.s"
#include "piton_multithread_init.s"