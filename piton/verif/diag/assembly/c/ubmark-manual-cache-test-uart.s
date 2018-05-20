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




    .section    ".text"
    .align 4
    .align 32
    .global uart_print
    .type   uart_print, #function
    .proc   020
uart_print:
    .register   %g2, #scratch
    .register   %g3, #scratch
    ldsb    [%o0], %g3
    sethi   %hi(67092480), %g4
    mov 0, %g1
    or  %g4, 779, %g4
    sllx    %g4, 14, %g4
    cmp %g3, 0
    be,pn   %icc, .L8
     ldub   [%o0], %g2
.L5:
    add %g1, 1, %g1
    stb %g2, [%g4]
    srl %g1, 0, %g2
    ldsb    [%o0+%g2], %g3
    cmp %g3, 0
    bne,pt  %icc, .L5
     ldub   [%o0+%g2], %g2
.L8:
    jmp %o7+8
     nop
    .size   uart_print, .-uart_print
    .align 4
    .align 32
    .global uart_putchar
    .type   uart_putchar, #function
    .proc   020
uart_putchar:
    sethi   %hi(67092480), %g1
    or  %g1, 779, %g1
    sllx    %g1, 14, %g1
    jmp %o7+8
     stb    %o0, [%g1]
    .size   uart_putchar, .-uart_putchar
    .align 4
    .align 32
    .global gen
    .type   gen, #function
    .proc   020
gen:
    add %o1, 17, %o5
    mov -720, %g5
    add %o5, %o5, %o5
    cmp %o1, 0
    ble,pn  %icc, .L16
     mov    34, %g1
.L14:
    add %g1, 12, %g2
    add %g1, -20, %g3
    st  %g5, [%o0]
    add %g1, -8, %g4
    add %g5, -48, %g5
    smul    %g4, %g1, %g4
    smul    %g2, %g3, %g2
    sub %g2, %g4, %g2
    add %g1, 2, %g1
    st  %g2, [%o0+4]
    cmp %g1, %o5
    bne,pt  %icc, .L14
     add    %o0, 8, %o0
.L16:
    jmp %o7+8
     nop
    .size   gen, .-gen
    .align 4
    .align 32
    .global verify_results
    .type   verify_results, #function
    .proc   020
verify_results:
    save    %sp, -176, %sp
    add %i1, 17, %i3
    mov -720, %i4
    add %i3, %i3, %i3
    cmp %i1, 0
    ble,pn  %icc, .L26
     mov    34, %i5
.L23:
    add %i5, -8, %g1
    add %i5, -20, %g2
    lduw    [%i0], %g4
    smul    %g1, %i5, %g3
    add %i5, 12, %g1
    cmp %g4, %i4
    smul    %g1, %g2, %g1
    sub %g1, %g3, %g1
    bne,pt  %icc, .L19
     add    %i5, 2, %i5
    lduw    [%i0+4], %g2
    cmp %g2, %g1
    be,a,pn %icc, .L25
     add    %i0, 8, %i0
.L19:
    call    fail, 0
     add    %i0, 8, %i0
.L25:
    cmp %i5, %i3
    bne,pt  %icc, .L23
     add    %i4, -48, %i4
.L26:
    return  %i7+8
     nop
    .size   verify_results, .-verify_results
    .section    .rodata.str1.8,"aMS",@progbits,1
    .align 8
.LC0:
    .asciz  "Test ubmark-cmplx-mult starts\n"
    .align 8
.LC1:
    .asciz  "Checked L1. "
    .align 8
.LC2:
    .asciz  "Checked L2. "
    .align 8
.LC3:
    .asciz  "Checked L3. "
    .align 8
.LC4:
    .asciz  "...loop\r\n"
    .section    .text.startup,"ax",@progbits






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


    save    %sp, -176, %sp
    sethi   %hi(67092480), %g1
    sethi   %hi(.LC0), %g2
    or  %g1, 779, %g1
    mov 0, %g3
    mov 84, %g4
    or  %g2, %lo(.LC0), %g2
    sllx    %g1, 14, %g1
.L28:
    add %g3, 1, %g3
    stb %g4, [%g1]
    srl %g3, 0, %g4
    ldsb    [%g2+%g4], %g5
    cmp %g5, 0
    bne,pt  %icc, .L28
     ldub   [%g2+%g4], %g4
    sethi   %hi(dest_), %i3
    sethi   %hi(67092480), %i2
    or  %i3, %lo(dest_), %i3
    sethi   %hi(dest_+8192), %l7
    sethi   %hi(.LC1), %l1
    sethi   %hi(dest_+65536), %l6
    sethi   %hi(.LC2), %l0
    sethi   %hi(dest_+1638400), %l5
    sethi   %hi(.LC3), %i0
    sethi   %hi(.LC4), %i1
    or  %i2, 779, %i2
    mov 0, %l2
    or  %l7, %lo(dest_+8192), %l7
    or  %l1, %lo(.LC1), %l1
    or  %l6, %lo(dest_+65536), %l6
    or  %l0, %lo(.LC2), %l0
    or  %l5, %lo(dest_+1638400), %l5
    or  %i0, %lo(.LC3), %i0
    or  %i1, %lo(.LC4), %i1
    mov %i3, %i5
    sllx    %i2, 14, %i2
    mov 1000, %l4
.L58:
    mov %l7, %l3
.L30:
    mov %i3, %i4
.L53:
    mov %i3, %g1
    st  %g0, [%g1]
.L52:
    add %g1, 4, %g1
    cmp %g1, %l3
    bne,a,pt %xcc, .L52
     st %g0, [%g1]
    mov 1024, %o1
    call    gen, 0
     mov    %i5, %o0
    mov %i5, %o0
    call    verify_results, 0
     mov    1024, %o1
    addcc   %l4, -1, %l4
    bne,a,pt %icc, .L53
     mov    %i3, %i4
    mov 0, %g1
    mov 67, %g2
.L33:
    add %g1, 1, %g1
    stb %g2, [%i2]
    srl %g1, 0, %g2
    ldsb    [%l1+%g2], %g3
    cmp %g3, 0
    bne,pt  %icc, .L33
     ldub   [%l1+%g2], %g2
    mov 1000, %l4
    mov %l6, %l3
    mov %i4, %g1
.L55:
    st  %g0, [%g1]
.L54:
    add %g1, 4, %g1
    cmp %g1, %l3
    bne,a,pt %xcc, .L54
     st %g0, [%g1]
    sethi   %hi(8192), %o1
    call    gen, 0
     mov    %i5, %o0
    mov %i5, %o0
    call    verify_results, 0
     sethi  %hi(8192), %o1
    addcc   %l4, -1, %l4
    bne,pt  %icc, .L55
     mov    %i4, %g1
    mov 0, %g1
    mov 67, %g2
.L36:
    add %g1, 1, %g1
    stb %g2, [%i2]
    srl %g1, 0, %g2
    ldsb    [%l0+%g2], %g3
    cmp %g3, 0
    bne,pt  %icc, .L36
     ldub   [%l0+%g2], %g2
    mov 1000, %l4
    mov %l5, %l3
    mov %i4, %g1
.L57:
    st  %g0, [%g1]
.L56:
    add %g1, 4, %g1
    cmp %g1, %l3
    bne,a,pt %xcc, .L56
     st %g0, [%g1]
    sethi   %hi(204800), %o1
    call    gen, 0
     mov    %i5, %o0
    mov %i5, %o0
    call    verify_results, 0
     sethi  %hi(204800), %o1
    addcc   %l4, -1, %l4
    bne,pt  %icc, .L57
     mov    %i4, %g1
    mov 0, %g1
    mov 67, %g2
.L39:
    add %g1, 1, %g1
    stb %g2, [%i2]
    srl %g1, 0, %g2
    ldsb    [%i0+%g2], %g3
    cmp %g3, 0
    bne,pt  %icc, .L39
     ldub   [%i0+%g2], %g2
    sethi   %hi(-776530944), %g2
    add %l2, 1, %l2
    or  %g2, 857, %g2
    umul    %l2, %g2, %g1
    srlx    %g1, 45, %g1
    sethi   %hi(9216), %g2
    or  %g2, 784, %g2
    smul    %g1, %g2, %g1
    cmp %l2, %g1
    bne,a,pt %icc, .L58
     mov    1000, %l4
    mov 0, %g1
    mov 46, %g2
.L41:
    add %g1, 1, %g1
    stb %g2, [%i2]
    srl %g1, 0, %g2
    ldsb    [%i1+%g2], %g3
    cmp %g3, 0
    bne,pt  %icc, .L41
     ldub   [%i1+%g2], %g2
    mov 1000, %l4
    ba,pt   %xcc, .L30
     mov    %l7, %l3
    .size   main, .-main









    
SECTION .DATA_AREA DATA_VA=0x0000000040010000
   attr_data {
        Name = .DATA_AREA,
        hypervisor
        }


    
.data

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PUT DATA HERE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    .global dest_
    .section    ".bss"
    .align 4
    .type   dest_, #object
    .size   dest_, 3276800
dest_:
    .skip   3276800

.end
