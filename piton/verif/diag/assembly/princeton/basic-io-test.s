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

#define ADDR0 0x9a00000000
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
!
!
!			
 
.text
.global active_thread
!
!	We enter with L2 up and in LRU mode, Priv. state is user (none)
!
!	
active_thread:	
        ta      T_CHANGE_HPRIV          ! enter Hyper mode
	nop
th_main_0:
	set 0xf2, %g1
	set 0x2, %g2
	set 0x3, %g3
	set 0xef, %g4
	setx ADDR0,%g6, %g5
    stb %g3, [%g5 + 4]
	stb %g4, [%g5]
	ldub [%g5], %g1
    ldub [%g5 + 4], %g2
    add %g2, %g1, %g7
    set 0xf2, %g1
	cmp %g1, %g7
	be good_end
	nop
bad_en:
	ta T_BAD_TRAP
	ba end
	nop
good_end:
	ta T_GOOD_TRAP
end:
	nop
	nop


	
!==========================
.data
.align 0x1fff+1

.global test_data
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

.end