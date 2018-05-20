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
    wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

    setx    fp_data0, %l1, %l0
    ld      [%l0], %f0
    setx    fp_data1, %l1, %l0
    ld      [%l0], %f1
    setx    fp_data2, %l1, %l0
    ld      [%l0], %f2
    setx    fp_data3, %l1, %l0
    ld      [%l0], %f3 
main_loop:
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    fdivs   %f0, %f1, %f4
    fdivs   %f2, %f3, %f5
    ba      main_loop
    fdivs   %f2, %f3, %f5
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

fp_data0:
    .word     0x1d9a36ed
fp_data1:
    .word     0x063bdd41
fp_data2:
    .word     0x1858a7b5
fp_data3:
    .word     0x1b839707

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
