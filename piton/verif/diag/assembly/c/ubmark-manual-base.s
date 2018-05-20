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
!  Description:
! 

#define     CORE_X_SHIFT            18
#define     CORE_Y_SHIFT            26
#define     INT_RST                 0x8000000000010001
#define     INT_IDLE                0x8000000000020000
#define     INT_ADDR                0x9800000800
#define     REG_COREID              0xba00000000
#define     UART_BASE               0xfff0c2c000

/*********************************************************/
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
bad_end:
fail:
    ta T_BAD_TRAP
    ba end
    nop
good_end:
pass:
    ta T_GOOD_TRAP
end:
    ! spin waiting for UART writes to finish
    ! currently delay is randomly taken
    ! without this loop core traps, fetching garbage
    ! from memory
    setx 0x1000,%g6,%g5
loop: 
    sub %g5, 1, %g5
    cmp %g5, %g0
    bne loop
    ! put itself to idle
    setx INT_IDLE, %g6, %g1
    sll %l0, CORE_X_SHIFT, %l0
    sll %l1, CORE_Y_SHIFT, %l1
    or %g1, %l0, %g1
    or %g1, %l1, %g1
    setx INT_ADDR, %g6, %g2
    setx 0xDEADBEE3, %g6, %g5
    stx %g1, [%g2]
    nop
    nop
    nop
    nop





!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PUT OTHER TEXT HERE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!














    .align 4
    .align 32
    .global main
    .type   main, #function
    .proc   04
.text
.global active_thread
active_thread:  
        ta      T_CHANGE_HPRIV          ! enter Hyper mode
    nop
th_main_0:


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PUT MAIN HERE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!















    
SECTION .DATA_AREA DATA_VA=0x0000000040010000
   attr_data {
        Name = .DATA_AREA,
        hypervisor
        }


    
.data

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PUT DATA HERE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


.end
