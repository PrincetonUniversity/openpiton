#include "addr.h"
  .section .text.reloc, "ax", @progbits
  .globl spl_reloc
spl_reloc:
  // one core will acquire the lock, they other cores will try. The successful core will do all the copy work, whilst the other cores wait for the first core. After the first core finishes, all the other cores will enter spl
  li x7, 0x88000000
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
  li x2, 0x80000000
  li x3, 0x10000
  li x4, 0x80000000
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
  li x4, 0x80000000
  jr x4

  .section .rodata.spl, "a", @progbits
  .globl .spl
  .align 5, 0
spl:
.incbin "../../../../../uboot/spl/u-boot-spl.bin"
