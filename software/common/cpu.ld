OUTPUT_FORMAT("elf32-lm32")
ENTRY(_start)
MEMORY
{
    ram :
 ORIGIN = 0x00000800,
 LENGTH = 16384 - 2048
}

SECTIONS
{
 .boot : { *(.boot) } > ram
 .text : { *(.text .text.*) } > ram =0
 .rodata : { *(.rodata .rodata.*) } > ram
 .data : {
  *(.data .data.*)
  _gp = ALIGN(16) + 0x7ff0;
 } > ram
 .bss : {
  _fbss = .;
  *(.bss .bss.*)
  *(COMMON)
  _ebss = .;
 } > ram

}

