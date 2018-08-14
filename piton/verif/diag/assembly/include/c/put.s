! Copyright (c) 2018 Princeton University
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

	.file	"put.c"
	.section	".text"
	.align 4
	.global piton_puts
	.type	piton_puts, #function
	.proc	04
piton_puts:
	save	%sp, -176, %sp
	ldsb	[%i0], %i5
	mov	0, %i3
	cmp	%i5, 0
	bne,pt	%icc, .L4
	 add	%i0, 1, %i4
	return	%i7+8
	 sra	%o3, 0, %o0
.L3:
	call	piton_putchar, 0
	 sra	%i5, 0, %o0
	add	%i3, 1, %i3
	ldsb	[%i4], %i5
	cmp	%i5, 0
	be,pn	%icc, .L2
	 add	%i4, 1, %i4
.L4:
	cmp	%i5, 10
	bne,pt	%icc, .L3
	 nop
	call	piton_putchar, 0
	 mov	13, %o0
	call	piton_putchar, 0
	 sra	%i5, 0, %o0
	add	%i3, 1, %i3
	ldsb	[%i4], %i5
	cmp	%i5, 0
	bne,pt	%icc, .L4
	 add	%i4, 1, %i4
.L2:
	sra	%i3, 0, %i0
	return	%i7+8
	 nop
	.size	piton_puts, .-piton_puts
	.ident	"GCC: (GNU) 5.4.0"
	.section	.note.GNU-stack,"",@progbits
