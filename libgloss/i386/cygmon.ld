STARTUP(cygmon-crt0.o)
ENTRY(_start)
GROUP(-lcygmon -lc -lcygmon -lgcc)
SEARCH_DIR(.)
__DYNAMIC  =  0;

/*
 * Allocate the stack to be at the top of memory, since the stack
 * grows down
 */
PROVIDE (__stack = 0x500000);

/*
 * Initalize some symbols to be zero so we can reference them in the
 * crt0 without core dumping. These functions are all optional, but
 * we do this so we can have our crt0 always use them if they exist. 
 * This is so BSPs work better when using the crt0 installed with gcc.
 * We have to initalize them twice, so we multiple object file
 * formats, as some prepend an underscore.
 */
PROVIDE (hardware_init_hook = 0);
PROVIDE (software_init_hook = 0);
PROVIDE (__mem_start = 0x100000);
PROVIDE (___mem_start = 0x100000);
SECTIONS
{	
  . = 0x100000;
  .text : {
     _ftext = . ;
    *(.init)
     eprol  =  .;
    *(.text)
    PROVIDE (__runtime_reloc_start = .);
    *(.rel.sdata)
    PROVIDE (__runtime_reloc_stop = .);
    *(.fini)
     __CTOR_LIST__ = .;
    CONSTRUCTORS
    LONG(-1)
    *(.ctors)
    LONG(0)
    __CTOR_END__ = .;
    __DTOR_LIST__ = .;
    LONG(-1)
    *(.dtors)
     LONG(0)
    __DTOR_END__ = .;
     etext  =  .;
     _etext  =  .;
  }
  . = .;
  .rdata : {
    *(.rdata)
  }
   _fdata = ALIGN(16);
  .data : {
    *(.data)
  }
  . = ALIGN(8);
  _gp = . + 0x8000;
  __global = . + 0x8000;
  .lit8 : {
    *(.lit8)
  }
  .lit4 : {
    *(.lit4)
  }
  .sdata : {
    *(.sdata)
  }
  . = ALIGN(4);
   edata  =  .;
   _edata  =  .;
   fbss = .;
   _fbss = .;
  .sbss : {
    *(.sbss)
    *(.scommon)
  }
  .bss : {
    __bss_start = . ;
    *(.bss)
    *(COMMON)
    __bss_end = . ;
  }
   end = .;
   _end = .;
}
