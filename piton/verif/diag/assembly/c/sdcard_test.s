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

	.section	".text"
	.align 4
	.align 32
	.global uart_print
	.type	uart_print, #function
	.proc	020
uart_print:
	.register	%g2, #scratch
	.register	%g3, #scratch
	ldsb	[%o0], %g3
	sethi	%hi(67092480), %g4
	mov	0, %g1
	or	%g4, 779, %g4
	sllx	%g4, 14, %g4
	cmp	%g3, 0
	be,pn	%icc, .L8
	 ldub	[%o0], %g2
.L5:
	add	%g1, 1, %g1
	stb	%g2, [%g4]
	srl	%g1, 0, %g2
	ldsb	[%o0+%g2], %g3
	cmp	%g3, 0
	bne,pt	%icc, .L5
	 ldub	[%o0+%g2], %g2
.L8:
	jmp	%o7+8
	 nop
	.size	uart_print, .-uart_print
	.align 4
	.align 32
	.global uart_putchar
	.type	uart_putchar, #function
	.proc	020
uart_putchar:
	sethi	%hi(67092480), %g1
	or	%g1, 779, %g1
	sllx	%g1, 14, %g1
	jmp	%o7+8
	 stb	%o0, [%g1]
	.size	uart_putchar, .-uart_putchar
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"Starting SD card read/write test."
	.align 8
.LC1:
	.asciz	"Error: mismatch"
	.section	.text.startup,"ax",@progbits









!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! 
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


	save	%sp, -176, %sp
	sethi	%hi(67092480), %g1
	sethi	%hi(.LC0), %g2
	or	%g1, 779, %g1
	mov	0, %g3
	mov	83, %g4
	or	%g2, %lo(.LC0), %g2
	sllx	%g1, 14, %g1
.L11:
	add	%g3, 1, %g3
	stb	%g4, [%g1]
	srl	%g3, 0, %g4
	ldsb	[%g2+%g4], %g5
	cmp	%g5, 0
	bne,pt	%icc, .L11
	 ldub	[%g2+%g4], %g4
	sethi	%hi(67092480), %i5
	sethi	%hi(82618368), %i3
	mov	4095, %l0
	sethi	%hi(-66345984), %l2
	or	%i5, 779, %i5
	sethi	%hi(8387584), %l1
	mov	1024, %i4
	or	%i3, 559, %i3
	sllx	%l0, 28, %l0
	or	%l2, 898, %l2
	sllx	%i5, 14, %i5
	or	%l1, 1023, %l1
	mov	%i3, %g3
.L27:
	ba,pt	%xcc, .L20
	 mov	0, %g1
.L14:
	sllx	%g2, 2, %g2
	add	%g2, %l0, %g2
	cmp	%g2, %i5
	move	%xcc, %g5, %g1
.L20:
	srl	%g1, 0, %g2
	add	%g3, %l2, %g4
	smul	%g4, %g3, %g4
	sllx	%g2, 2, %g2
	add	%g1, 1025, %g5
	st	%g4, [%g2+%l0]
	add	%g1, 1, %g1
	add	%g3, 1, %g3
	cmp	%g1, %l1
	bleu,pt	%icc, .L14
	 srl	%g1, 0, %g2
	mov	0, %i2
	mov	%i3, %i1
	sethi	%hi(.LC1), %i0
.L18:
	srl	%i2, 0, %g1
	sllx	%g1, 2, %g1
	add	%g1, %l0, %g3
	cmp	%g3, %i5
	be,pn	%xcc, .L26
	 add	%i1, %l2, %g2
.L25:
	lduw	[%g1+%l0], %g1
	smul	%g2, %i1, %g2
	cmp	%g1, %g2
	be,pn	%icc, .L16
	 mov	0, %g1
	mov	69, %g2
	or	%i0, %lo(.LC1), %g3
.L17:
	add	%g1, 1, %g1
	stb	%g2, [%i5]
	srl	%g1, 0, %g2
	ldsb	[%g3+%g2], %g4
	cmp	%g4, 0
	bne,pt	%icc, .L17
	 ldub	[%g3+%g2], %g2
	call	fail, 0
	 mov	0, %o0
.L16:
	add	%i2, 1, %i2
	cmp	%i2, %l1
	bleu,pt	%icc, .L18
	 add	%i1, 1, %i1
	addcc	%i4, -1, %i4
	bne,pt	%icc, .L27
	 mov	%i3, %g3
	call	pass, 0
	 restore %g0, 0, %o0
.L26:
	add	%i2, 1024, %i2
	srl	%i2, 0, %g1
	ba,pt	%xcc, .L25
	 sllx	%g1, 2, %g1







!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! 
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
