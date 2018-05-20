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
    setx    ldx_data0, %l1, %l0
    setx    ldx_data1, %l2, %l1
#ifdef PITON_PROFILING
    PITON_UGET_LOCK(lock_addr, %l6)
    PITON_UPUTS(prof_str, %l6)
    PITON_UPRINT_REG_NL(%l0, %l6)
    PITON_UREL_LOCK(lock_addr, %l6)
.align 32  ! make sure profiled code is in the same cache line (instr cache)
    nop
    mov     SPARC_PIC, %l3
    rd      %tick, %l5
    !!! Start of profiled code
    ldx     [%l1], %l2
    !!! End of profiled code
    rd      %tick, %l6
    mov     SPARC_PIC, %l4
    PITON_UGET_LOCK(lock_addr, %l7)
    PITON_UPRINT_REG_NL(%l2, %l7)
    PITON_UPRINT_CYCLE_NUM(%l5, %l6)
    PITON_UPRINT_EVENT_NUM(%l3, %l4)
    PITON_UREL_LOCK(lock_addr, %l7)
#endif
main_loop:
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ldx     [%l1], %l3
    ldx     [%l0], %l2
    ba      main_loop
    ldx     [%l1], %l3
    ba      test_good_end
    nop
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

    

!==========================
.data
.align 0x1fff+1

ldx_data0:
    .xword      0x0000000000000000
    .xword      0x0000000000000000
ldx_data1:
    .xword      0xffffffffffffffff
    .xword      0xffffffffffffffff

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
