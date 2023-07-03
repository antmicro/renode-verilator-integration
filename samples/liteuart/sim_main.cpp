//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "Vtop.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#if VM_TRACE
# include <verilated_fst_c.h>
#endif
// uart.h and wishbone.h can be found in Renode's VerilatorPlugin
#include "src/peripherals/uart.h"
#include "src/buses/wishbone.h"

#define UART_FREQ 100000000
#define BAUDRATE 115200

const int prescaler = UART_FREQ / (BAUDRATE * 8);
UART *uart;
Vtop *top = new Vtop;
VerilatedFstC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
#endif
    top->eval();
    uart->eval();
}

RenodeAgent *Init() {
    Wishbone* bus = new Wishbone();

    //=================================================
    // Init bus signals
    //=================================================
    bus->wb_clk = &top->clk100;
    bus->wb_rst = &top->rst0;
    bus->wb_addr = (uint64_t *)&top->wb_adr;
    bus->wb_rd_dat = (uint64_t *)&top->wb_dat_r;
    bus->wb_wr_dat = (uint64_t *)&top->wb_dat_w;
    bus->wb_we = &top->wb_we;
    bus->wb_sel = &top->wb_sel;
    bus->wb_stb = &top->wb_stb;
    bus->wb_ack = &top->wb_ack;
    bus->wb_cyc = &top->wb_cyc;
    bus->addr_lines = 30;

    //=================================================
    // Init eval function
    //=================================================
    bus->evaluateModel = &eval;

    //=================================================
    // Init peripheral
    //=================================================
    const int litex_rxtx_reg = 0x800;
    uart = new UART(bus, &top->serial_tx, &top->serial_rx, prescaler, litex_rxtx_reg, &top->irq_uart0);
    return uart;
}

int main(int argc, char **argv, char **env) {
    if(argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort} [{address}]\n", argv[0]);
        exit(-1);
    }
    const char *address = argc < 4 ? "127.0.0.1" : argv[3];

    Verilated::commandArgs(argc, argv);
#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedFstC;
    top->trace(tfp, 99);
    tfp->open("simx.fst");
#endif
    Init();
    uart->simulate(atoi(argv[1]), atoi(argv[2]), address);
    top->final();
    exit(0);
}
