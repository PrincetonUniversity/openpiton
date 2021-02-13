SECTIONS
{
    ROM_BASE = 0x10000; /* ... but actually position independent */

    . = ROM_BASE;
    .text : ALIGN(8) { *(.text*) }
    .data : ALIGN(4) { *(.data*) }
}
