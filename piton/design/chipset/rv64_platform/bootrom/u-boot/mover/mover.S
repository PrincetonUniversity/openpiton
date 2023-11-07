// Copyright (c) 2021 Tianrui Wei
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors
// may be used to endorse or promote products derived from this software without
// specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include "addr.h"
.section .text.reloc, "ax", @progbits
.globl spl_reloc
#define SPL_BASE 0x82000000
#define LOCK_BASE 0x88000000
spl_reloc:
// one core will acquire the lock, they other cores will try. The successful core will do all the copy work, whilst the other cores wait for the first core. After the first core finishes, all the other cores will enter spl
li x7, LOCK_BASE
li x2, 1
amoswap.w x3, x2, 0(x7)
// if the lock has already been acquired, jump to loop
//otherwise, jump to memcpy
beqz x3, memcpy
j acquire_loop
memcpy:
// x1 is the current text base
// x2 is the target text base
// x3 is the length of the copy
// x4 keeps the address to jump to
// assume address is aligned by 8
// x5 holds the current size
// x6 hold temporary data
la x1, spl
li x2, SPL_BASE
li x3, 0x10000
li x4, SPL_BASE
li x5, 0
1:
bge x5, x3, jmp_to_reloc
ld x6, 0(x1)
sd x6, 0(x2)
addi x1, x1, 0x8
addi x2, x2, 0x8
addi x5, x5, 0x8
j 1b
acquire_loop:
// all other cores try to acquire the lock in acquire loop
// when the lock is acquired, it jumps to jump_to_reloc, which
// clears the lock and jump to uboot-spl
//li x2, 1
//amoswap.w x3, x2, 0(x7)
lw x3, 0(x7)
beqz x3, jmp_to_reloc
j acquire_loop
jmp_to_reloc:
// release the lock
li x2, 0
amoswap.w x2, x2, 0(x7)
li x4, SPL_BASE
jr x4

.section .rodata.spl, "a", @progbits
.globl .spl
.align 5, 0
spl:
.incbin "../uboot/spl/u-boot-spl.bin"