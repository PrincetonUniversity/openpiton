.section ".text.init","ax",@progbits
.globl _start
_start:
    j handle_reset
handle_reset:
    li x1, 0
    li x2, 0
    li x3, 0
    li x4, 0
    li x5, 0
    li x6, 0
    li x7, 0
    li x8, 0
    li x9, 0
    li x10, 0
    li x11, 0
    li x12, 0
    li x13, 0
    li x14, 0
    li x15, 0
    li x16, 0
    li x17, 0
    li x18, 0
    li x19, 0
    li x20, 0
    li x21, 0
    li x22, 0
    li x23, 0
    li x24, 0
    li x25, 0
    li x26, 0
    li x27, 0
    li x28, 0
    li x29, 0
    li x30, 0
    li x31, 0
    # adjust stack pointer based on hart ID
    csrr a0, mhartid
    addi t0, a0, 1
    la t1, _stack
    li t2, 4096
    mul t2, t2, t0
    add sp, t2, t1
    li t0, 0
    li t1, 0
    li t2, 0
    csrw mscratch, sp
    jal main
done:
    nop
    j done
