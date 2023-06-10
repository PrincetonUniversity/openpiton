SECTIONS
{
    ROM_BASE = 0xfff1010000; /* ... but actually position independent */
/*ROM_BASE = 0x80000000;*/
    . = ROM_BASE;
    .text : ALIGN(4) { *(.text*) }
    . = ROM_BASE + 0x80;
    .rodata.spl : { *(.rodata.spl) }
}