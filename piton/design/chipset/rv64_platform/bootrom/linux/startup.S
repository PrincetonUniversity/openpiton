# start sequence of the bootloader
# 
# 
#define DRAM_BASE 0x80000000

.option arch, +zicsr



  .section .text.init
  .option norvc
  .globl _prog_start
_prog_start:
  li sp, 0x84000000
  call main
  csrr a0, mhartid
  la a1, _dtb
  li s1, DRAM_BASE
  jr s1

  .section .dtb
  .globl _dtb
  .align 4, 0
_dtb:
  .incbin "rv64_platform.dtb"
