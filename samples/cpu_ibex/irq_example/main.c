//
// Copyright (c) 2010-2022 Antmicro
//
// This file is licensed under the MIT License.
// Full license text is available in 'LICENSE' file.
//

// read_csr, write_csr, set_csr, clear_csr from https://github.com/riscv/riscv-pk/blob/master/machine/encoding.h
#define read_csr(reg) (               \
    {                                 \
        unsigned long __tmp;          \
        asm volatile("csrr %0, " #reg \
                     : "=r"(__tmp));  \
        __tmp;                        \
    })

#define write_csr(reg, val) ({ asm volatile("csrw " #reg ", %0" ::"rK"(val)); })

#define set_csr(reg, bit) (                   \
    {                                         \
        unsigned long __tmp;                  \
        asm volatile("csrrs %0, " #reg ", %1" \
                     : "=r"(__tmp)            \
                     : "rK"(bit));            \
        __tmp;                                \
    })

#define clear_csr(reg, bit) (                 \
    {                                         \
        unsigned long __tmp;                  \
        asm volatile("csrrc %0, " #reg ", %1" \
                     : "=r"(__tmp)            \
                     : "rK"(bit));            \
        __tmp;                                \
    })

const int timer = 0x82002800;
volatile unsigned int *const timerLoad = (int *)timer;
volatile unsigned int *const timerTimerEnable = (int *)(timer + 0x08);
volatile unsigned int *const timerEventPending = (int *)(timer + 0x18);
volatile unsigned int *const timerEventEnable = (int *)(timer + 0x1C);

volatile unsigned int *uart = (int *)0x82002000;

int main()
{
    asm volatile("ecall");
    *timerEventEnable = 1;

    while (1)
    {
        *timerLoad = 0x1000000;
        *timerTimerEnable = 1;
        asm volatile("wfi");
    }
}

void handle_trap_helper()
{
    unsigned long mcause = read_csr(mcause);
    if (mcause == 11) // ecall in M-Mode
    {
        unsigned long mepc = read_csr(mepc);
        write_csr(mepc, mepc + 4);                              // return to instruction after ecall
        set_csr(mstatus, 1 << 3 | 1 << 7);                      // enable interrupts handling in u-mode and m-mode
        set_csr(mie, 1 << 3 | 1 << 7 | 1 << 11 | 0x7FFF << 16); // enable all interrupts
        set_csr(mtvec, 0x200);                                  // set trap-vector base address
    }
}

__attribute__((section(".handle_trap")))
__attribute__((interrupt)) void
handle_trap()
{
    handle_trap_helper();
}

void put_char(char c)
{
    *uart = c;
}

void print(const char *str)
{
    while (*str)
        put_char(*(str++));
}

__attribute__((section(".handle_timer")))
__attribute__((interrupt)) void
handle_timer() // put time handler at position 0x200 (new trap-vector base address) + 4 (word sizeof) * 7 (timer interrupt id) = 0x21c
{
    print("hello\n");
    *timerEventPending = 1;
}
