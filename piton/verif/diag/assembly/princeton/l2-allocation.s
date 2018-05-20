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

    .global     test_start
test_start:

    setx    PITON_L2_CL_SIZE, %l2, %l1
    setx    PITON_L2_SLICE_SIZE, %l3, %l2
    sdivx   %l2, %l1, %l3   ! # CL / slice
    mulx    %l3, 25, %l3    ! # CL / chip
    setx    100, %l5, %l6  ! out_loop number of iter
out_loop:
    setx    data_core_0, %l1, %l0
    mov     0, %l4          ! iteration counter
ld_loop:
    ! PITON_UPRINT_REG_NL(%l0, %l5)
    ! PITON_UPRINT_REG_NL(%l4, %l5)
    ! cmp     %l6, 1
    ! bne     ld_label
    ! nop
    ! rd      %tick, %g4
    ! ldx     [%l0], %l5
    ! rd      %tick, %g5
    ! PITON_UPRINT_CYCLE_NUM(%g4, %g5)
    ! ba      after_load
    ! nop
ld_label:
    ldx     [%l0], %l5
after_load:
    add     %l4, 1, %l4
    cmp     %l4, %l3
    blt     ld_loop
    add     %l0, PITON_L2_CL_SIZE, %l0
    sub     %l6, 1, %l6
    cmp     %l6, 0
    bgt     out_loop
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

    
#include "user_data_ldx_all_l2.s"

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
    ta      T_CHANGE_NONHPRIV
    setx    test_start, %l0, %l1
    jmp     %l1
    nop

#include "piton_common.s"
#include "piton_multithread_init.s"