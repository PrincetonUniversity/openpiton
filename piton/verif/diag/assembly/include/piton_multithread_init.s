! Copyright (c) 2017 Princeton University
! All rights reserved.
! 
! Redistribution and use in source and binary forms, with or without
! modification, are permitted provided that the following conditions are met:
!     * Redistributions of source code must retain the above copyright
!       notice, this list of conditions and the following disclaimer.
!     * Redistributions in binary form must reproduce the above copyright
!       notice, this list of conditions and the following disclaimer in the
!       documentation and/or other materials provided with the distribution.
!     * Neither the name of Princeton University nor the
!       names of its contributors may be used to endorse or promote products
!       derived from this software without specific prior written permission.
! 
! THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
! DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

! In order to use this function you need 
! to include piton_def.h, boot.s, and 
! piton_common.s in your main assembly file

! This code must be executed in 
! Hypervisor Priviledge mode

	.global piton_multithread_init
piton_multithread_init:
    save    %sp, -96, %sp

    ! Get core and thread ID
    call get_core_thread
    nop
    mov 	%o0, %l4
    mov 	%o1, %l5
    mov 	%o2, %l6

    cmp     %l4, %g0
    bne     after_init
    cmp     %l5, %g0
    bne     after_init
    cmp     %l6, %g0
    bne     after_init
    nop
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! This part is executed only by x=0, y=0, th=0
    call    uart16550_init
    nop
    setx    master_up_str, %o1, %o0
    call    uart16550_puts
    nop
    setx    PITON_CORE_MASK, %l0, %l7
    setx    PITON_THREAD_MASK, %l0, %l1
    mov     1, %l6              ! skip itself, start from 0,0,1
    ba      next_th_dim
    nop
next_x_dim:
    cmp     %l4, PITON_X_DIM
    be      next_x_dim_end
    mov     0, %l5
next_y_dim:
    cmp     %l5, PITON_Y_DIM
    be      next_y_dim_end
    mov     0, %l6
    ! calculate core global number and put in l3
    mulx    %l4, PITON_X_DIM, %l0
    add     %l5, %l0, %l3
    ! check Core mask before waking up a core
    srlx    %l7, %l3, %l0
    and     %l0, 1, %l0
    cmp     %l0, 1
    bne     next_th_dim_end
    nop
next_th_dim:
    cmp     %l6, PITON_TH_NUM
    be      next_th_dim_end
    nop
    ! check thread mask before waking up the second thread
    ! l3 must have core global number
    cmp     %l6, 0
    be      send_rst_int 
    srlx    %l1, %l3, %l0
    and     %l0, 1, %l0
    cmp     %l0, 1
    bne     next_th_dim_end
    nop
send_rst_int:
    PITON_SEND_INT_MSG(PITON_INT_RST_MSG, %l4, %l5, %l6, %l0)
    ba      next_th_dim
    add     %l6, 1, %l6
next_th_dim_end:
    ba      next_y_dim
    add     %l5, 1, %l5
next_y_dim_end:
    ba      next_x_dim
    add     %l4, 1, %l4
next_x_dim_end:
    ! Put Core 0 Thread 0 to idle if it's not enabled
    setx    PITON_CORE_MASK, %l0, %l4
    and     %l4, 1, %l4
    cmp     %l4, 0
    bne     master_continue
    nop
    setx    PITON_THREAD_MASK, %l0, %l4
    and     %l4, 1, %l4
    cmp     %l4, 0
    bne     master_continue
    nop
    PITON_SEND_INT_MSG(PITON_INT_IDLE_MSG, %g0, %g0, %g0, %l4)
master_inf_loop:
    ba      master_inf_loop
    nop
master_continue:
    mov     0, %l4
    mov     0, %l5
    mov     0, %l6
    ! end of the part executed by 0,0,0
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
after_init:
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! portion executed by all cores/threads must be here
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! enter critical section
    PITON_GET_THREAD_ORDER(%l4, %l5, %l6)
    mov     %o0, %l1

    PITON_GET_LOCK(lock_addr, %l0)
    ! start of critical section
    PITON_PUTS(core_string, %l0)
    PITON_PUTHEXDIG(%l4)
    PITON_PUTS(y_string, %l0)
    PITON_PUTHEXDIG(%l5)
    PITON_PUTS(th_string, %l0)
    PITON_PUTHEXDIG(%l6)
    PITON_PUTS(thread_ord_str, %l0)
    PITON_PRINT_REG(%l1)
    PITON_PUTS(nl_string, %l0)
    setx    shared_cnt, %l1, %l0
    ldub    [%l0], %l1
    add     %l1, 1, %l1
    stb     %l1, [%l0]
    PITON_REL_LOCK(lock_addr, %l0)  ! unlock critical section
    ! only x=0, y=0, th=0
    cmp     %l4, 0
    bne     all_threads_waken_up
    cmp     %l5, 0
    bne     all_threads_waken_up
    cmp     %l6, 0
    bne     all_threads_waken_up
    nop
    ! calculate number of threads which must be waken up
    call    calc_num_waken_threads
    nop
    mov     %o0, %l4 
check_waken_thread_num:
    setx    shared_cnt, %l1, %l0
    ldub    [%l0], %l1
wait_all_threads:
    cmp     %l1, %l4
    bne     wait_all_threads
    ldub    [%l0], %l1
    PITON_GET_LOCK(lock_addr, %l0)
    PITON_PUTS(threads_waken_up, %l0)
    PITON_PRINT_REG(%l1)
    PITON_PUTS(nl_string, %l0)
    PITON_REL_LOCK(lock_addr, %l0)
all_threads_waken_up:
    call    config_perf_cnt
    nop
    ret
    restore

    .global     hp_puts
hp_puts:
    save    %sp, -96, %sp
    ta      T_CHANGE_HPRIV
    mov     %i0, %o0
    call    uart16550_puts
    nop
    ta      T_CHANGE_NONHPRIV
    ret
    restore

    .global     hp_print_reg
hp_print_reg:
    save    %sp, -96, %sp
    ta      T_CHANGE_HPRIV
    call    uart16550_printreg
    mov     %i0, %o0
    ta      T_CHANGE_NONHPRIV
    ret
    restore

    .global     hp_get_lock
hp_get_lock:
    save    %sp, -96, %sp
    ta      T_CHANGE_HPRIV
    call    lock_acquire
    mov     %i0, %o0
    ta      T_CHANGE_NONHPRIV
    ret
    restore

    .global     hp_rel_lock
hp_rel_lock:
    save    %sp, -96, %sp
    ta      T_CHANGE_HPRIV
    call    lock_release
    mov     %i0, %o0
    ta      T_CHANGE_NONHPRIV
    ret
    restore

    .global     config_perf_cnt
config_perf_cnt:
    save    %sp, -96, %sp
    mov     %asr16, %l0     ! read PCR
    mov     7, %l1
    not     %l1
    and     %l0, %l1, %l0
    or      6, %l0, %l0     ! count user/supervisor events
    mov     PERF_DC_MISS, %l1
    sllx    %l1, PCR_SL_OFFSET, %l1
    or      %l1, %l0, %l0
    mov     %l0, %asr16
    ret
    restore

SECTION .DATA_AREA DATA_VA=0x0000000040010000
   attr_data {
        Name = .DATA_AREA,
        hypervisor
        }

    .global nl_string
    .global master_up_str
    .global lock_addr
    .global shared_cnt
    .global core_string
    .global y_string
    .global th_string
    
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

    .global threads_waken_up
threads_waken_up:
    .asciz "Number of waken up threads: 0x"
    .align 4

    .align 32
lock_addr:
    .xword 0
    .align 32

shared_cnt:
    .word 0

.global     user_sucks_str
user_sucks_str:
    .asciz  "User sucks :(\t\n"
    .align 4

.global     ticks_str
ticks_str:
    .asciz "Ticks  inbetween : 0x"
    .align 4

.global     event_str
event_str:
    .asciz "Events inbetween : 0x"
    .align 4

.global     instr_str
instr_str:
    .asciz "Instr  inbetween : 0x"
    .align 4

.global     loaded_str
loaded_str:
    .asciz "Loaded value     : 0x"
    .align 4

.global     prof_str
prof_str:
    .asciz "Profiling # 0x"
    .align 4

.global     addr_str
addr_str:
    .asciz "Address          : 0x"
    .align 4

.global     thread_ord_str
thread_ord_str:
    .asciz  "   # Thread ID 0x"
    .align 4

.global     running_adds_str
running_adds_str:
    .asciz  " is runing adds\r\n"
    .align 4

.global     runing_nops_str
runing_nops_str:
    .asciz  " is running nops\r\n"
    .align 4