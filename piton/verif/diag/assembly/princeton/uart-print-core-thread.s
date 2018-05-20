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
!  Assumes UART16550 standard configuration registers
!  Sets 115200 Baud Rate based on system 50MHz clock

#define UART_BASE_ADDR 0xfff0c2c000
#define UART_THR_OFFSET 0
#define UART_LSR_OFFSET 5
#define UART_LSR_TEMT_MASK 0x40

#define REG_COREID 0xba00000000

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
put_char:
    save %sp, -128, %sp
    ! i0 contains char to put

    setx UART_BASE_ADDR,%l1, %l0
    
    ! Poll on LSR bit TEMT bit
tx_wait_loop:
    ld [%l0 + UART_LSR_OFFSET], %l1
    and %l1, UART_LSR_TEMT_MASK, %l1
    cmp %l1, %g0
    beq tx_wait_loop
    nop


    ! Send byte to uart
    stb %i0, [%l0 + UART_THR_OFFSET]

    ret
    restore

active_thread:	
        ta      T_CHANGE_HPRIV          ! enter Hyper mode
	nop
th_main_0:
	setx UART_BASE_ADDR,%g6, %g5
!   UART16550 Initialisation
    clrb [%g5 + 1]
    clrb [%g5 + 2]
    mov  6, %g3
    stb  %g3, [ %g5 + 2 ]
    mov  1, %g3
    stb  %g3, [ %g5 + 2 ]
    mov  0x83, %g3
    stb  %g3, [ %g5 + 3 ]
! set divisor
    mov  UART_DIV_LATCH, %g3
!    mov  0xbc, %g3
    nop
    stb  %g3, [ %g5 ]
    clrb [ %g5 + 1 ]
    mov  3, %g3
    stb  %g3, [ %g5 + 3 ]

!   Get core id
    setx REG_COREID, %g6, %g1
    ldx [%g1], %g2
!   Extract X to l2
    and %g2, 0xff, %l0
    add %l0, 0x30, %l2  ! add ASCII 0
!   Extract Y to l3
    srl %g2, 0x8, %g2
    and %g2, 0xff, %l1
    add %l1, 0x30, %l3  ! add ASCII 0
!   Extract thread ID to l1
    rd  %asr26, %l1
    add %l1, 0x30, %l1

!   Print "Core ("
    set 0x43, %o0
    call put_char
    nop

    set 0x6f, %o0
    call put_char
    nop

    set 0x72, %o0
    call put_char
    nop

    set 0x65, %o0
    call put_char
    nop

    set 0x20, %o0
    call put_char
    nop

    set 0x28, %o0
    call put_char
    nop    

!   Print X dimension
    mov %l2, %o0
    call put_char
    nop

!   Print ","
    set 0x2c, %o0
    call put_char
    nop

!   Print Y dimension
    mov %l3, %o0
    call put_char
    nop

!   Print ") Thread "
    set 0x29, %o0
    call put_char
    nop

    set 0x20, %o0
    call put_char
    nop

    set 0x54, %o0
    call put_char
    nop

    set 0x68, %o0
    call put_char
    nop    

    set 0x72, %o0
    call put_char
    nop
    
    set 0x65, %o0
    call put_char
    nop

    set 0x61, %o0
    call put_char
    nop
    
    set 0x64, %o0
    call put_char
    nop
    
    set 0x20, %o0
    call put_char
    nop

!   Print thread id
    mov %l1, %o0
    call put_char
    nop

!   Print new line
    set 0x0d, %o0
    call put_char
    nop

    set 0x0a, %o0
    call put_char
    nop

!   Spin wait for UART writes to finish
    setx UART_BASE_ADDR,%l1, %l0
wait_uart_tx_loop:
    ld [%l0 + UART_LSR_OFFSET], %l1
    and %l1, UART_LSR_TEMT_MASK, %l1
    cmp %l1, %g0
    beq wait_uart_tx_loop
    nop
    nop
    nop
    nop
    nop
	ba good_end
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
.end
