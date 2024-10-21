
OUTPUT_ARCH(riscv)
ENTRY( _start )
MEMORY
{
  MEM           : ORIGIN = 0x00000004, LENGTH = 0x01000000
}


SECTIONS
{
  .init :
  {
    . = ALIGN(8);
    KEEP( *(.init) )
    . = ALIGN(8);
  } > MEM


  .fini :
  {
    . = ALIGN(8);
    KEEP( *(.fini) )
    . = ALIGN(8);
  } > MEM


  .preinit_array : {
    . = ALIGN(8);
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);
    . = ALIGN(8);
  } > MEM


  .init_array : {
    . = ALIGN(8);
    PROVIDE_HIDDEN (__init_array_start = .);
    __CTOR_LIST__ = .;
    LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
    KEEP(*(.ctors.start))
    KEEP(*(.ctors))
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array ))
    LONG(0)
    __CTOR_END__ = .;
    PROVIDE_HIDDEN (__init_array_end = .);
    . = ALIGN(8);
  } > MEM


  .fini_array : {
    . = ALIGN(8);
    PROVIDE_HIDDEN (__fini_array_start = .);
    __DTOR_LIST__ = .;
    LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
    KEEP(*(.dtors.start))
    KEEP(*(.dtors))
    LONG(0)
    __DTOR_END__ = .;
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array ))
    PROVIDE_HIDDEN (__fini_array_end = .);
    . = ALIGN(8);
  } > MEM


  .boot : {
    . = ALIGN(8);
    *(.boot)
    *(.boot.data)
    . = ALIGN(8);
  } > MEM


  .rodata : {
    . = ALIGN(8);
    *(.rodata);
    *(.rodata.*)
    *(.srodata);
    *(.srodata.*)
    *(.eh_frame*)
    *(.gnu.linkonce.r.*)
    . = ALIGN(8);
  } > MEM


  .got : {
    . = ALIGN(8);
    *(.got.plt) * (.igot.plt) *(.got) *(.igot)
    . = ALIGN(8);
  } > MEM


  .shbss : {
    . = ALIGN(8);
    *(.shbss)
    . = ALIGN(8);
  } > MEM


  .talias : {
  } > MEM


  .gnu.offload_funcs : {
    . = ALIGN(8);
    KEEP(*(.gnu.offload_funcs))
    . = ALIGN(8);
  } > MEM


  .gnu.offload_vars : {
    . = ALIGN(8);
    KEEP(*(.gnu.offload_vars))
    . = ALIGN(8);
  } > MEM


  .stack0 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack0_start = .;
    . = . + 0x800;
    stack0 = .;
    . = ALIGN(8);
  } > MEM

  .stack1 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack1_start = .;
    . = . + 0x900;
    stack1 = .;
    . = ALIGN(8);
  } > MEM

  .stack2 : {
      . = ALIGN(8);
      . = ALIGN(16);
      stack2_start = .;
      . = . + 0xA00;
      stack2 = .;
      . = ALIGN(8);
    } > MEM
  
  .stack3 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack3_start = .;
    . = . + 0xB00;
    stack3 = .;
    . = ALIGN(8);
  } > MEM

  .stack4 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack4_start = .;
    . = . + 0xC00;
    stack4 = .;
    . = ALIGN(8);
  } > MEM

  .stack5 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack5_start = .;
    . = . + 0xD00;
    stack5 = .;
    . = ALIGN(8);
  } > MEM

  .stack6 : {
      . = ALIGN(8);
      . = ALIGN(16);
      stack6_start = .;
      . = . + 0xE00;
      stack6 = .;
      . = ALIGN(8);
    } > MEM
  
  .stack7 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack7_start = .;
    . = . + 0xF00;
    stack7 = .;
    . = ALIGN(8);
  } > MEM

  .stack8 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack8_start = .;
    . = . + 0x1000;
    stack8 = .;
    . = ALIGN(8);
  } > MEM

  .stack9 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack9_start = .;
    . = . + 0x1100;
    stack9 = .;
    . = ALIGN(8);
  } > MEM

  .stack10 : {
      . = ALIGN(8);
      . = ALIGN(16);
      stack10_start = .;
      . = . + 0x1200;
      stack10 = .;
      . = ALIGN(8);
    } > MEM
  
  .stack11 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack11_start = .;
    . = . + 0x1300;
    stack11 = .;
    . = ALIGN(8);
  } > MEM

  .stack12 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack12_start = .;
    . = . + 0x1400;
    stack12 = .;
    . = ALIGN(8);
  } > MEM

  .stack13 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack13_start = .;
    . = . + 0x1500;
    stack13 = .;
    . = ALIGN(8);
  } > MEM

  .stack14 : {
      . = ALIGN(8);
      . = ALIGN(16);
      stack14_start = .;
      . = . + 0x1600;
      stack14 = .;
      . = ALIGN(8);
    } > MEM
  
  .stack15 : {
    . = ALIGN(8);
    . = ALIGN(16);
    stack15_start = .;
    . = . + 0x1700;
    stack15 = .;
    . = ALIGN(8);
  } > MEM
  


  .data : {
    . = ALIGN(8);
    sdata  =  .;
    _sdata  =  .;
    *(.data);
    *(.data.*)
    *(.sdata);
    *(.sdata.*)
    . = ALIGN(8);
    edata  =  .;
    _edata  =  .;
  } > MEM


  .bss : {
    . = ALIGN(8);
    _bss_start = .;
    *(.bss)
    *(.bss.*)
    *(.sbss)
    *(.sbss.*)
    *(COMMON)
    . = ALIGN(8);
    _bss_end = .;
  } > MEM



  .text :
  {
    . = ALIGN(16);
    _stext = .;
    *(.text)
    *(.text.*)
    *(.gnu.linkonce.t.*)
    _etext  =  .;
    *(.lit)
    *(.shdata)
    /* This alignment is needed on RTL platforms to avoid getting X in the code */
    . = ALIGN(16);
    _endtext = .;
    __cluster_text_end = .;
    /* This alignment is needed on RTL platforms to avoid getting X in the code */
    . = ALIGN(16);
  } > MEM

  __mem_end = ALIGN(8);

}
