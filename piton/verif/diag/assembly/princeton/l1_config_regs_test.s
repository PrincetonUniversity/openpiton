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
 * Description: Test configuration registers enable/disable.
 *  These config regs are en/dis by a read/write to specific ASI address
 *
 ****************************************************************/


#include "boot.s"

#define CSM_EN_ADDRESS              0xba00000100
#define DMBR_EN_ADDRESS             0xba00000200
#define UNIMPLEMENTED_EN_ADDRESS    0xba00001000

.text
.global main

main:                   !  test enters here from boot in user mode
    setx active_thread, %l1, %o5   
    jmpl    %o5, %o7
    nop

!
!       Note that to simplify ASI cache accesses this segment should be mapped VA==PA==RA
!
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
!





.text
.global active_thread
active_thread:  
        ta      T_CHANGE_HPRIV          ! enter Hyper mode
    ba  TEST_MAIN
    nop

    .align  1024
!
TEST_MAIN:   
    setx DMBR_EN_ADDRESS, %g2, %g1
    ldx [%g1], %l0
    ! csm should be disabled at start
    cmp %l0, %r0
    bne bad_end
    nop
    setx 0xDEADBEE1, %g2, %g3 ! marker when debugging

    ! now set csm to 1
    setx 0x1, %g2, %l0
    stx %l0, [%g1]

    ! read csm_en again
    ldx [%g1], %l0
    cmp %l0, %r0
    be bad_end
    nop
    setx 0xDEADBEE2, %g2, %g3 ! marker when debugging
    ! now set dmbr to 0
    stx %r0, [%g1]

    !!!!!!!!!!!!!
    ! test unimplmented address, should be 0 even after a write
    !!!!!!!!!!!!!
    ldx [%g1], %l0 ! reset read to 0
    setx UNIMPLEMENTED_EN_ADDRESS, %g2, %g1
    ld [%g1], %l0
    cmp %l0, %r0
    bne bad_end
    nop
    setx 0xDEADBEE5, %g2, %g3 ! marker when debugging

    ! now set unimpl to 1
    setx 0x1, %g2, %l0
    stx %l0, [%g1]

    ! load again, should be 0
    ldx [%g1], %l0
    cmp %l0, %r0
    bne bad_end
    nop
    setx 0xDEADBEE6, %g2, %g3 ! marker when debugging

    ! DONE!
    ta T_GOOD_TRAP


bad_end:
    ta T_BAD_TRAP
    nop                             ! Delay slot
good_end:
    ta T_GOOD_TRAP
