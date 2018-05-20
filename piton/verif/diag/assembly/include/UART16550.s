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

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Description:
!   UART16550 Basic output functions
! Author:
!   Alexey Lavrov
! Date of Creation:
!   November 2nd, 2016
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.text
    
    .global     uart16550_init
    .global     uart16550_puts
    .global     uart16550_putreg
    .global     uart16550_printreg

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Initializes Xilinx UART16550
! 8 data bit, no Break, no Parity, 1 stop bit
! div latch value is passed through UART_DIV_LATCH define
! Input:
!   None
! Output:
!   None
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
uart16550_init:
    save    %sp, -96, %sp
    setx    UART_BASE_ADDR, %l0, %l1
    ! Disable Interrupts
    clrb    [%l1 + UART16550_IER_OFFSET]
    ! Disable Xilinx UART16550 FIFO
    clrb    [%l1 + UART16550_FCR_OFFSET]                      
    mov     6, %l0
    stb     %l0, [%l1 + UART16550_FCR_OFFSET]
    mov     1, %l0
    stb     %l0, [%l1 + UART16550_FCR_OFFSET]
    ! Access DLAB, no Break, no Parity, 1 stop bit, 8 data bits
    mov     0x83, %l0
    stb     %l0, [%l1 + UART16550_LCR_OFFSET]
    ! set divisor
    mov     UART_DIV_LATCH, %l0
    stb     %l0, [%l1 + UART16550_DLL_OFFSET]  ! Div Latch: LSB
    clrb    [%l1 + UART16550_DLM_OFFSET]       ! Div Latch: MSB
    ! turn off DLAB access bit
    mov     3, %l0
    stb     %l0, [%l1 + UART16550_LCR_OFFSET]
    ret
    restore


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Puts NULL terminated string to UART
! Input:
!   %i0 - string address
! Output:
!   None
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
uart16550_puts:
    save    %sp, -96, %sp
    setx    UART_BASE_ADDR, %l0, %l1            ! Store UART address in %l1
uart16550_puts_loop:
    ldub    [%i0], %l0                          ! l0 has current byte of a string
    cmp     %l0, %g0                            ! check for NULL termination
    be      uart16550_puts_end
    add     %i0, 1, %i0                         ! increment address in delay slot
    ldub    [%l1 + UART16550_LSR_OFFSET], %l2
uart16550_puts_wait:
    and     UART16550_LSR_TEMT_MASK, %l2, %l2
    cmp     %l2, %g0
    beq     uart16550_puts_wait
    ldub    [%l1 + UART16550_LSR_OFFSET], %l2   ! load another time in a delay slot
    ba      uart16550_puts_loop
    stb     %l0, [%l1]                          ! put a char to UART in a delay slot
uart16550_puts_end:
    ret
    restore


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Put Reg to UART
! Input:
!   %i0 - register to put to UART
! Output:
!   None
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
uart16550_putreg:
    save    %sp, -96, %sp
    setx    UART_BASE_ADDR, %l0, %l1
    ldub    [%l1 + UART16550_LSR_OFFSET], %l2
uart16550_putreg_wait:
    and     UART16550_LSR_TEMT_MASK, %l2, %l2
    cmp     %l2, %g0
    beq     uart16550_putreg_wait
    ldub    [%l1 + UART16550_LSR_OFFSET], %l2   ! load LSR in a delay slot
    stb     %i0, [%l1]                          ! put a register to UART in a delay slot
    ret
    restore


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Prints 64-bit Register value to UART in hex
! Input:
!   %i0 - register to print to UART
! Output:
!   None
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
uart16550_printreg:
    save    %sp, -96, %sp
    setx    UART_BASE_ADDR, %l0, %l1
    mov     60, %l2
uart16550_printreg_loop:
    srlx    %i0, %l2, %l3
    and     %l3, 0xf, %l3
    cmp     %l3, 0xa
    bl      uart16550_printreg_dig
    add     %l3, 0x30, %l3
    add     %l3, 0x27, %l3      ! 0x61 offset for 'a'
uart16550_printreg_dig:
    ldub    [%l1 + UART16550_LSR_OFFSET], %l0
uart16550_printreg_wait:
    and     %l0, UART16550_LSR_TEMT_MASK, %l0
    cmp     %l0, %g0
    beq     uart16550_printreg_wait
    ldub    [%l1 + UART16550_LSR_OFFSET], %l0
    cmp     %l2, 0
    sub     %l2, 4, %l2
    bne     uart16550_printreg_loop
    stb     %l3, [%l1]
    ret
    restore
