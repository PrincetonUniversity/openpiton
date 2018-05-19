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
! basically this test is trying to change a value without the core knowning it

    setx 0x12345678, %r7, %r1 ! test value
    setx 0x12340000, %r7, %r2 ! address
    stx %r1, [%r2]

    ! value now should be 12345678
    ldx [%r2], %r7
    cmp %r1, %r7
    bne bad_end
    nop                             ! Delay slot

    !! lets do the same thing for a different address
    ! now we will reach in and change the value

    setx 0x12345678, %r7, %r1 
    setx 0x12350000, %r7, %r2 ! address under test
    stx %r1, [%r2]

    ! change value using diag write
    setx 0xdeadbeef, %r7, %r3 
    setx 0xb000350000, %r7, %r4 ! b0 is for diagnostic access
                                ! bit 25:24 is the way index, we should change all ways
    stx %r3, [%r4]
    setx 0xb001350000, %r7, %r4 ! way 1
    stx %r3, [%r4]
    setx 0xb002350000, %r7, %r4  ! way 2
    stx %r3, [%r4]
    setx 0xb003350000, %r7, %r4  ! way 3
    stx %r3, [%r4]

    ! read value again, it should be %r3 now
    ldx [%r2], %r7
    cmp %r3, %r7
    bne bad_end
    nop                             ! Delay slot
    ta T_GOOD_TRAP

bad_end:
    ta T_BAD_TRAP
    nop                             ! Delay slot
good_end:
    ta T_GOOD_TRAP
