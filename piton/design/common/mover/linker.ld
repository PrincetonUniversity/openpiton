SECTIONS
{
    ROM_BASE = 0xfff10100000; /* ... but actually position independent */

    . = ROM_BASE;
    .text : ALIGN(4) { *(.text*) }
    .data : ALIGN(4) { *(.data*) }
    .rodata.spl : { *(.rodata.spl) }
}
