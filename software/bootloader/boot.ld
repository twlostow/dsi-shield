OUTPUT_FORMAT("elf32-littleriscv")
ENTRY(_start)

SECTIONS
{

  /*--------------------------------------------------------------------*/
  /* Code and read-only segment                                         */
  /*--------------------------------------------------------------------*/

  /* Begining of code and text segment */
  . = 0x00000000;

 .boot : { *(.boot) }

  _ftext = .;
  PROVIDE( eprol = . );

  /* text: Program code section */
  .text : 
  {
    *(.boot)
    *(.text)
    *(.text.*)
    *(.gnu.linkonce.t.*)
  }

  /* init: Code to execute before main (called by crt0.S) */
  .init : 
  {
    KEEP( *(.init) )
  }

  /* fini: Code to execute after main (called by crt0.S) */
  .fini : 
  {
    KEEP( *(.fini) )
  }

  /* rodata: Read-only data */
  .rodata : 
  {
    *(.rdata)
    *(.rodata)
    *(.rodata.*)
    *(.gnu.linkonce.r.*)
  }

  /* End of code and read-only segment */
  PROVIDE( etext = . );
  _etext = .;

  /*--------------------------------------------------------------------*/
  /* Global constructor/destructor segement                             */
  /*--------------------------------------------------------------------*/
  /* The .ctors/.dtors sections are special sections which contain a
     list of constructor/destructor function pointers. crtbegin.o
     includes code in a .init section which goes through the .ctors list
     and calls each constuctor. crtend.o includes code in a .fini
     section which goes through the .dtors list and calls each
     destructor. crtbegin.o includes a special null pointer in its own
     .ctors/.dtors sections which acts as a start indicator for those
     lists. crtend.o also includes a special null pointer in its own
     .ctors/.dtors sections which acts as an end indictor. The linker
     commands below are setup so that crtbegin.o's .ctors/.dtors
     sections are always first and crtend.o's .ctors/.dtors sections are
     always last. This is the only way the list of functions will have
     the begin and end indicators in the right place. */

  /* ctors : Array of global constructor function pointers */
 
  /*--------------------------------------------------------------------*/
  /* Initialized data segment                                           */
  /*--------------------------------------------------------------------*/

  /* Start of initialized data segment */
  . = ALIGN(16);
   _fdata = .;

  /* data: Writable data */
  .data : 
  {
    *(.data)
    *(.data.*)
    *(.gnu.linkonce.d.*)
  }

  /* End of initialized data segment */
  PROVIDE( edata = . );
  _edata = .;

  /* Have _gp point to middle of sdata/sbss to maximize displacement range */
  . = ALIGN(16);
  _gp = . + 0x800;

  /* Writable small data segment */
  .sdata : 
  {
    *(.sdata)
    *(.sdata.*)
    *(.srodata.*)
    *(.gnu.linkonce.s.*)
  }

  /*--------------------------------------------------------------------*/
  /* Uninitialized data segment                                         */
  /*--------------------------------------------------------------------*/

  /* Start of uninitialized data segment */
  . = ALIGN(8);
  _fbss = .;

  /* Writable uninitialized small data segment */
  .sbss : 
  {
    *(.sbss)
    *(.sbss.*)
    *(.gnu.linkonce.sb.*)
  }

  /* bss: Uninitialized writeable data section */
  . = .;
  _bss_start = .;
  .bss : 
  {
    *(.bss)
    *(.bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
  }

  /* End of uninitialized data segment (used by syscalls.c for heap) */
  PROVIDE( end = . );
  _end = ALIGN(8);

  PROVIDE( _fstack = 0x7ffc - 0x400 );
  PROVIDE( _fexception_stack = 0x7ffc );
}
