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
 /*********************************************************/
#include "boot.s"
#include "piton_def.h"

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
 
.text

    .global active_thread

active_thread:	
    ta      T_CHANGE_HPRIV          ! enter Hyper mode
	nop
th_main_0:
    ! Calculate Core ID
    setx    PITON_REG_COREID, %l1, %l0
    ldx     [%l0], %l0
    ! Get X
    and     %l0, 0xff, %g1              ! g1 has X
    ! Get Y
    srlx    %l0, 0x8, %l2
    and     %l2, 0xff, %g2              ! g2 has Y
    ! Get Thread ID
    rd      %asr26, %l0
    srlx    %l0, 8, %l0
    and     %l0, 0x1, %g3               ! g3 has thread id
    ! X != 0 or Y != 0 or th != 0
    cmp     %g1, %g0
    bne     after_init
    cmp     %g2, %g0
    bne     after_init
    cmp     %g3, %g0
    bne     after_init
    nop
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! This part is executed only by x=0, y=0, th=0
    call    uart16550_init
    nop
    setx    master_up_str, %o1, %o0
    call    uart16550_puts
    nop
    setx    PITON_CORE_MASK, %l0, %g4
    setx    PITON_THREAD_MASK, %l0, %g5
    mov     1, %g3              ! skip itself, start from 0,0,1
    ba      next_th_dim
    nop
next_x_dim:
    cmp     %g1, PITON_X_DIM
    be      next_x_dim_end
    mov     0, %g2
next_y_dim:
    cmp     %g2, PITON_Y_DIM
    be      next_y_dim_end
    mov     0, %g3
    ! calculate core global number and put in l3
    mulx    %g1, PITON_X_DIM, %l0
    add     %g2, %l0, %l3
    ! check Core mask before waking up a core
    srlx    %g4, %l3, %l0
    and     %l0, 1, %l0
    cmp     %l0, 1
    bne     next_th_dim_end
    nop
next_th_dim:
    cmp     %g3, PITON_TH_NUM
    be      next_th_dim_end
    nop
    ! check thread mask before waking up the second thread
    ! l3 must have core global number
    cmp     %g3, 0
    be      send_rst_int 
    srlx    %g5, %l3, %l0
    and     %l0, 1, %l0
    cmp     %l0, 1
    bne     next_th_dim_end
    nop
send_rst_int:
    PITON_SEND_INT_MSG(PITON_INT_RST_MSG, %g1, %g2, %g3)
    ba      next_th_dim
    add     %g3, 1, %g3
next_th_dim_end:
    ba      next_y_dim
    add     %g2, 1, %g2
next_y_dim_end:
    ba      next_x_dim
    add     %g1, 1, %g1
next_x_dim_end:
    mov     0, %g1
    mov     0, %g2
    mov     0, %g3
    ! end of the part executed by 0,0,0
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
after_init:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! portion executed by all cores/threads must be here
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! enter critical section
    setx    lock_addr, %l0, %g4
    mov     1, %l1
lock_loop:
    casxa   [%g4] 0x80, %g0, %l1
    cmp     %l1, 0
    bne     lock_loop
    nop
    ! start of critical section
    ! PITON_PUTS(core_string)
    ! PITON_PUTHEXDIG(%g1)
    ! PITON_PUTS(y_string)
    ! PITON_PUTHEXDIG(%g2)
    ! PITON_PUTS(th_string)
    ! PITON_PUTHEXDIG(%g3)
    ! PITON_PUTS(nl_string)
    setx 	shared_cnt, %l1, %l0
    ldub 	[%l0], %l1
    add 	%l1, 1, %l1
    stb 	%l1, [%l0]
    stx     %g0, [%g4]  ! unlock critical section
    ! only x=0, y=0, th=0
    cmp 	%g1, 0
    bne 	all_threads_waken_up
    cmp 	%g2, 0
    bne 	all_threads_waken_up
    cmp 	%g3, 0
    bne 	all_threads_waken_up
    ! calculate number of thread which must be waken up
    setx    PITON_CORE_MASK, %l1, %l0
    setx    PITON_THREAD_MASK, %l2, %l1
    mov 	PITON_X_DIM, %l2
    mulx 	%l2, PITON_Y_DIM, %l2 	! max number of cores
    mov 	0, %l3 	! iteration cnt
    mov 	0, %l4 	! expected waken thread num
calc_waken_thread_num:
	cmp 	%l3, %l2
	be 		check_waken_thread_num
    and 	%l0, 1, %l5
    add 	%l5, %l4, %l4
    and 	%l1, 1, %l5
    add 	%l5, %l4, %l4
    srlx 	%l0, 1, %l0
    srlx 	%l1, 1, %l1
    ba 		calc_waken_thread_num
    add 	%l3, 1, %l3 
check_waken_thread_num:
	setx 	shared_cnt, %l1, %l0
	ldub 	[%l0], %l1 		
wait_all_threads:
	cmp 	%l1, %l4
    bne 	wait_all_threads
    ldub 	[%l0], %l1
    PITON_PRINT_REG(%l1)
    PITON_PUTS(nl_string)
    rd 		%asr16, %l0
    wr 		%l0, 0x6, %asr16
    rd 		%asr17, %l0
    PITON_PRINT_REG(%l0)
    PITON_PUTS(nl_string)
    ta 		T_CHANGE_NONHPRIV
inst_loop:
    setx    test_data, %l1, %l0
    mov     0, %l1
cmp_loop:
    cmp     %l1, 0x10
    bge     loop_end
    ! ldx     [%l0], %l2
    add     %l0, 0x40, %l0
    add     %l1, 1, %l1
    ba      cmp_loop
    nop
loop_end:
    ta 		T_CHANGE_HPRIV
    rd 		%asr17, %l0
    PITON_PRINT_REG(%l0)
    PITON_PUTS(nl_string)
    ba 		test_good_end
    nop

all_threads_waken_up:
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	! test portion after all threds
	! are waken up must be here
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    PITON_SEND_INT_MSG(PITON_INT_IDLE_MSG, %g1, %g2, %g3)
inf_loop:
    ba inf_loop
    nop
test_good_end:
	ta 		T_GOOD_TRAP
	ba 		test_end	
	nop
test_bad_end:
	ta 		T_BAD_TRAP
	ba 		test_end
	nop
test_end:
	nop
	nop

	
SECTION .DATA_AREA DATA_VA=0x0000000040010000
   attr_data {
        Name = .DATA_AREA,
        hypervisor
        }

    .global core_string
    .global y_string
    .global th_string
    .global nl_string
    .global master_up_str
    .global lock_addr
    .global shared_cnt
    
.data
core_string:
    .asciz "Core: x = "
    .align 4

y_string:
    .asciz " y = "
    .align 4

th_string:
    .asciz " thread = "
    .align 4

nl_string:
    .asciz "\r\n"
    .align 4

master_up_str:
    .asciz "Master Core is up\r\n"
    .align 4

    .align 32
lock_addr:
    .word 0, 0
    .align 32

shared_cnt:
    .word 0


SECTION .DATA_AREA_2  DATA_VA=0x0000000060000000
attr_data {
        Name = .DATA_AREA_2,
        VA= 0x0000000060000000
        RA= 0x0000000060000000
        PA= 0x0000000060000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.global test_data
    .align 32
test_data:
    .word 0



.end
