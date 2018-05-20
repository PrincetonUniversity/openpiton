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

.text

	.global 	get_core_thread
get_core_thread:
	save    %sp, -96, %sp
    ! Calculate Core ID
    setx    PITON_REG_COREID, %l1, %l0
    ldx     [%l0], %l0
    ! Get X
    and     %l0, 0xff, %i0              ! o0 has X
    ! Get Y
    srlx    %l0, 0x8, %i1
    and     %i1, 0xff, %i1              ! o1 has Y
    ! Get Thread ID
    rd      %asr26, %l0
    srlx    %l0, 8, %l0
    and     %l0, 0x1, %i2               ! o2 has thread id
    ret
    restore

    .global		lock_acquire
lock_acquire:
	save 	%sp, -96, %sp
    membar  #Sync
lock_loop:
    mov     1, %l0
    casxa   [%i0] 0x80, %g0, %l0
    cmp     %l0, 0
    bne     lock_loop
    nop
    membar  #Sync
    ret
    restore

    .global 	lock_release
 lock_release:
 	save 	%sp, -96, %sp
    membar  #Sync
    mov     1, %l0
    casxa   [%i0] 0x80, %l0, %g0
    membar  #Sync
 	ret
 	restore

    .global 	send_int_msg
send_int_msg:
	save 	%sp, -96, %sp
    sll     %i1, PITON_VINT_X_OFFSET, %i1
    or      %i0, %i1, %i0
    sll     %i2, PITON_VINT_Y_OFFSET, %i2
    or      %i0, %i2, %i0
    sll     %i3, PITON_VINT_TH_OFFSET, %i3
    or      %i0, %i3, %i0
    setx    PITON_INT_ADDR, %l1, %l0
    stx     %i0, [%l0]
	ret
	restore

    .global     print_event_num
print_event_num:
    save    %sp, -96, %sp
    mov     1, %l0
    sllx    %l0, 32, %l0
    sub     %l0, 1, %l0
    and     %i0, %l0, %l1
    and     %i1, %l0, %l2
    sub     %l2, %l1, %l2
    PITON_UPUTS(event_str, %l3)
    PITON_UPRINT_REG_NL(%l2, %l3)
    srlx    %i0, 32, %i0
    srlx    %i1, 32, %i1
    and     %i0, %l0, %l1
    and     %i1, %l0, %l2
    sub     %l2, %l1, %l2
    sub     %l2, 1, %l2         ! since there is 1 even when no instr inbetween
    PITON_UPUTS(instr_str, %l3)
    PITON_UPRINT_REG_NL(%l2, %l3)
    ret
    restore

    .global     calc_num_waken_threads
calc_num_waken_threads:
    save    %sp, -96, %sp
    setx    PITON_CORE_MASK, %l1, %l0
    setx    PITON_THREAD_MASK, %l2, %l1
    mov     PITON_X_DIM, %l2
    mulx    %l2, PITON_Y_DIM, %l2   ! max number of cores
    mov     0, %l3  ! iteration cnt
    mov     0, %l4  ! expected waken thread num
calc_num_waken_threads_loop:
    cmp     %l3, %l2
    be      calc_num_waken_threads_end
    and     %l0, 1, %l5
    add     %l5, %l4, %l4
    and     %l1, 1, %l5
    add     %l5, %l4, %l4
    srlx    %l0, 1, %l0
    srlx    %l1, 1, %l1
    ba      calc_num_waken_threads_loop
    add     %l3, 1, %l3
calc_num_waken_threads_end:
    mov     %l4, %i0
    ret
    restore

! In:
!   %i0 - X
!   %i1 - Y
!   %i2 - th
! Out:
!   %i0 - thread order
    .global     calc_thread_order
calc_thread_order:
    save    %sp, -96, %sp
    mulx    %i0, PITON_Y_DIM, %l0
    add     %l0, %i1, %l0
    setx    PITON_CORE_MASK, %l2, %l1
    setx    PITON_THREAD_MASK, %l2, %l2
    mov     0, %l3  ! core counter
    mov     0, %l4  ! core order
calc_thread_order_loop:
    cmp     %l3, %l0
    be      calc_thread_order_out
    and     %l1, 1, %l5
    add     %l5, %l4, %l4
    and     %l2, 1, %l5
    add     %l5, %l4, %l4
    srlx    %l1, 1, %l1
    srlx    %l2, 1, %l2
    ba      calc_thread_order_loop
    add     %l3, 1, %l3 
calc_thread_order_out:
    add     %l4, %i2, %i0
    ret
    restore