/* basic linker script for ariane */

OUTPUT_ARCH( "riscv" )
ENTRY(_start)

MEMORY
{
  DRAM : ORIGIN = 0x80000000, LENGTH = 0x40000000
}

SECTIONS
{
  .text.init :
  {
    *(.text.init)
  } > DRAM

  .text :
  {
    . = ALIGN(0x80);
    *(.text)
  } > DRAM

  .data :
  {
    . = ALIGN(0x80);
    *(.data)
  } > DRAM

  .bss :
  {
    . = ALIGN(0x80);
    *(.bss)
  } > DRAM

  ._stack :
  {
    . = ALIGN(0x1000);
    _stack = .;
  } > DRAM

  ._end :
  {
    _end = .;
  } > DRAM
}
