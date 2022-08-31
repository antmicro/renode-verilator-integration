OUTPUT_ARCH( "riscv" )
ENTRY( main )
SECTIONS
{
    . = 0x0;
    .handle_trap :
    {
        *(.handle_trap)
    }

    . = 0x80;
    .text :
    {
        *(.text)
    }

    . = 0x21c;
    .handle_timer :
    {
        *(.handle_timer)
    }

    .data :
    {
        *(.data)
    }

    _end = .;
}