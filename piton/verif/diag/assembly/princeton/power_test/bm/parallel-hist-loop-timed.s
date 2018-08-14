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
 * Name: parallel-hist.s
 * Date: November 11, 2016
 *
 * Description: Parallel implementation of histogram app.
 *
 ****************************************************************/

/*********************************************************/
#include "boot.s"
#include "piton_def.h"

#include "parallel-hist-def.h"

#define ITER_NUM 20000

.text
.global main
main:
    setx    hp_start, %l1, %l0
    jmp     %l0
    nop

    !********************************
    ! Histogram App
    !********************************
    ! Assumptions:
    !   %g6 contains starting ponter to array chunk
    !   %g7 contains pointer to array of bin boundaries
    !   %l 1-5 contain local copies of bins.
    !   Is used on signed numbers
    !   Tallies for an object in range [min, max)
    .global histogram_app
histogram_app:
    setx    data_array, %g5, %g6
    setx    buckets_addr, %g5, %g7
    ! calculate offset
    PITON_GET_THREAD_ORDER(%g1, %g2, %g3)
    ! Infinite loop goes back to here, above variables
    ! are either not used or not changed
    ! loop variables
    setx    0, %g5, %l7
    setx    ITER_NUM, %l1, %g5
    ! Save event counter
    mov     SPARC_PIC, %l5
inf_loop:
    mov     %g1, %l0
    call    calc_num_waken_threads
    nop
    setx    DATA_SIZE, %l2, %l1
    udivx   %l1, %o0, %l1              ! DATA_SIZE / worker_num = work_size per worker
    mulx    %l0, %l1, %l0              ! offset for data for worker
    sll     %l0, 3, %l0                ! Account for mem size (64-bit = 8 bytes = 3 bit offset)
    ! calculate DATA_MAX_OFF - g4 - 8*(work_size - 1)
    sub     %l1, 1, %g4
    sllx    %g4, 3, %g4


    mov     0, %o1
    mov     0, %o2
    mov     0, %o3
    mov     0, %o4
    mov     0, %o5

hist_loop:
    mov     0, %l6          ! Set current item_idx to 0
item_loop:
bucket_one:
    add     %l0, %g6, %l1   ! Add global offset to array base pointer
    add     %l1, %l6, %l1   ! Add local offset
    ldx     [%l1], %l2      ! Load value from memory
    add     %g7, %g0, %l3   ! Point %l3 to bin array
    ldx     [%l3], %l4      ! Load new lower bound
    cmp     %l2, %l4    
    bl      bucket_two      ! Go to next bucket if x < min
    nop
    add     %l3, 8, %l3     ! Increment bound pointer
    ldx     [%l3], %l4      ! Load higher bound
    cmp     %l2, %l4    
    bge     bucket_two
    nop
    add     %o1, 1, %o1     ! Increment appropriate register
    ba      next_item
    nop
bucket_two:
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bl      bucket_three
    nop
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bge     bucket_three
    nop
    add     %o2, 1, %o2
    ba      next_item
    nop
bucket_three:
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bl      bucket_four
    nop
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bge     bucket_four
    nop
    add     %o3, 1, %o3
    ba      next_item
    nop
bucket_four:
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bl      bucket_five
    nop
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bge     bucket_five
    nop
    add     %o4, 1, %o4
    ba      next_item
    nop
bucket_five:
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bl      next_item
    nop
    add     %l3, 8, %l3
    ldx     [%l3], %l4
    cmp     %l2, %l4
    bge     next_item
    nop
    add     %o5, 1, %o5
    ba      next_item
    nop

next_item:
    sub %l6, %g4, %l2 !Check if all items checked (4*8)
    add %l6, 8, %l6
    cmp %l2, %g0
    bl item_loop
    nop

    !All items have been sorted. Update global counts accordingly.

    setx    bin0_data, %l0, %l1
    PITON_UGET_LOCK(bucket0_lock, %l3)
    ldx     [%l1], %l2
    add     %l2, %o1, %l2 
    stx     %l2, [%l1]
    PITON_UREL_LOCK(bucket0_lock, %l3)

    setx    bin1_data, %l0, %l1
    PITON_UGET_LOCK(bucket1_lock, %l3)
    ldx     [%l1], %l2
    add     %l2, %o2, %l2 
    stx     %l2, [%l1]
    PITON_UREL_LOCK(bucket1_lock, %l3)


    setx    bin2_data, %l0, %l1
    PITON_UGET_LOCK(bucket2_lock, %l3)
    ldx     [%l1], %l2
    add     %l2, %o3, %l2 
    stx     %l2, [%l1]
    PITON_UREL_LOCK(bucket2_lock, %l3)

    setx    bin3_data, %l0, %l1
    PITON_UGET_LOCK(bucket3_lock, %l3)
    ldx     [%l1], %l2
    add     %l2, %o4, %l2
    stx     %l2, [%l1]
    PITON_UREL_LOCK(bucket3_lock, %l3)

    setx    bin4_data, %l0, %l1
    PITON_UGET_LOCK(bucket4_lock, %l3)
    ldx     [%l1], %l2
    add     %l2, %o5, %l2 
    stx     %l2, [%l1]
    PITON_UREL_LOCK(bucket4_lock, %l3)

    setx    done_ctr, %l0, %l1
    PITON_UGET_LOCK(cntr_lock, %l3)
    ldx     [%l1], %l2
    add     %l2, 1, %l2     ! Increment Done Counter
    stx     %l2, [%l1]
    PITON_UREL_LOCK(cntr_lock, %l3)

    ! Loop termination condition
    add     %l7, 1, %l7
    cmp     %l7, %g5
    blt     inf_loop
    nop

    ! Print Performance Counter Stats
    ! mov     SPARC_PIC, %l2
    ! PITON_UGET_LOCK(lock_addr, %l3)
    ! PITON_UPRINT_EVENT_NUM(%l5, %l2)
    ! PITON_UREL_LOCK(lock_addr, %l3)

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

! Test should never reach here
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
    ba test_end
    nop

!==========================
.data
.align 0x1fff+1
    
    .align 8
    .global test_end_shared_cnt
test_end_shared_cnt:
    .word 0

    .align 8
    .global buckets_addr
buckets_addr:
    ! Increasing order from max neg to max pos
    .word 0, 0x80000000
    .word 0, 0xc0000000
    .word 0, 0xc0000000
    .word 0, 0x00000000
    .word 0, 0x00000000
    .word 0, 0x20000000
    .word 0, 0x20000000
    .word 0, 0x40000000
    .word 0, 0x40000000
    .word 0, 0x7fffffff

    .align 8
    .global done_ctr
done_ctr:
    .word 0,0

    .align 8
    .global bin0_data
bin0_data:
    .word 0, 0
    .global bin1_data
bin1_data:
    .word 0, 0
    .global bin2_data
bin2_data:
    .word 0,0
    .global bin3_data
bin3_data:
    .word 0,0
    .global bin4_data
bin4_data:
    .word 0,0

! With bin boundaries set as below: 
! 0x80000000
! 0xc0000000

! 0xc0000000
! 0x00000000

! 0x00000000
! 0x20000000

! 0x20000000
! 0x40000000

! 0x40000000
! 0x7fffffff



#include "parallel-hist-data.s"


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

    mov      %o0, %g1
    mov      %o1, %g2
    mov      %o2, %g3

    ta      T_CHANGE_NONHPRIV
    setx    histogram_app, %l0, %l1
    jmp     %l1
    nop
    
#include "piton_common.s"
#include "piton_multithread_init.s"

.global bucket0_lock
    .align 64
bucket0_lock:
    .xword 0
    .align 64

.global bucket1_lock
    .align 64
bucket1_lock:
    .xword 0
    .align 64

.global bucket2_lock
    .align 64
bucket2_lock:
    .xword 0
    .align 64

.global bucket3_lock
    .align 64
bucket3_lock:
    .xword 0
    .align 64

.global bucket4_lock
    .align 64
bucket4_lock:
    .xword 0
    .align 64

.global cntr_lock
    .align 64
cntr_lock:
    .xword 0
    .align 64
