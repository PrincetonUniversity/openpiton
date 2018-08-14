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

/*********************************************************/
#include "boot.s"
#include "piton_def.h"

! Number of loop iterations
#define LOOP_ITERATIONS 10
#define EXPECTED_SUM 45

.text
.global main
main:
    setx    hp_start, %l1, %l0
    jmp     %l0
    nop

    .global return_from_hp
return_from_hp:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! User space for text for all threads
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    setx 0, %g1, %g6
    setx 100000000, %g1, %g7
outer_loop:   
    setx loop_array, %g2, %g1             ! Loop starting address
    add %g0, LOOP_ITERATIONS, %g2   ! Loop iterations
    sll %g2, 0x3, %g2               ! Multiply loop iterations by 8 (shift left by 3)
    add %g0, %g0, %g3               ! Loop counter
    add %g0, %g0, %g4               ! Sum variable
loop:
    cmp %g2, %g3
    be done                         ! Done if %g2 == %g3
    add %g1, %g3, %g5               ! Get the current address to load
    ldx [%g5], %l0                  ! Load array data for this iteration
    add %g4, %l0, %g4               ! Sum array
    add %g3, 0x8, %g3               ! Increment loop counter (delay slot)
    
    cmp %g2, %g3
    be done                         ! Done if %g2 == %g3
    add %g1, %g3, %g5               ! Get the current address to load
    ldx [%g5], %l0                  ! Load array data for this iteration
    add %g4, %l0, %g4               ! Sum array
    add %g3, 0x8, %g3               ! Increment loop counter (delay slot)

    cmp %g2, %g3
    be done                         ! Done if %g2 == %g3
    add %g1, %g3, %g5               ! Get the current address to load
    ldx [%g5], %l0                  ! Load array data for this iteration
    add %g4, %l0, %g4               ! Sum array
    add %g3, 0x8, %g3               ! Increment loop counter (delay slot)

    cmp %g2, %g3
    be done                         ! Done if %g2 == %g3
    add %g1, %g3, %g5               ! Get the current address to load
    ldx [%g5], %l0                  ! Load array data for this iteration
    add %g4, %l0, %g4               ! Sum array
    add %g3, 0x8, %g3               ! Increment loop counter (delay slot)

    cmp %g2, %g3
    be done                         ! Done if %g2 == %g3
    add %g1, %g3, %g5               ! Get the current address to load
    ldx [%g5], %l0                  ! Load array data for this iteration
    add %g4, %l0, %g4               ! Sum array
    ba loop                         ! Loop around
    add %g3, 0x8, %g3               ! Increment loop counter (delay slot)
done:
    add %g6, 1, %g6
    cmp %g6, %g7
    blt outer_loop
    add %g0, EXPECTED_SUM, %g1      ! Check result

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
wait_threads_complete:
    ldub    [%l1], %l2
    cmp     %l2, %o0
    bne     wait_threads_complete
    nop

    cmp %g1, %g4
    be good_end
    nop                             ! Delay slot
bad_end:
    ta T_BAD_TRAP
    ba end
    nop                             ! Delay slot
good_end:
    ta T_GOOD_TRAP
end:
    nop
    nop



!==========================
.data
.align 0x1fff+1

.global loop_array
loop_array:
    .word 0x00000000, 0x00000000
    .word 0x00000000, 0x00000001
    .word 0x00000000, 0x00000002
    .word 0x00000000, 0x00000003
    .word 0x00000000, 0x00000004
    .word 0x00000000, 0x00000005
    .word 0x00000000, 0x00000006
    .word 0x00000000, 0x00000007
    .word 0x00000000, 0x00000008
    .word 0x00000000, 0x00000009
    .word 0x00000000, 0x0000000a
    .word 0x00000000, 0x0000000b
    .word 0x00000000, 0x0000000c
    .word 0x00000000, 0x0000000d
    .word 0x00000000, 0x0000000e
    .word 0x00000000, 0x0000000f
test_end_shared_cnt:
    .word 0

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

    ! Jump back to user code
    ta      T_CHANGE_NONHPRIV
    setx    return_from_hp, %l0, %l1
    jmp %l1
    nop

#include "piton_common.s"
#include "piton_multithread_init.s"
