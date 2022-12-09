//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "VApb3UartCtrl.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#if VM_TRACE
# include <verilated_fst_c.h>
#endif
// uart.h and apb3.h can be found in Renode's VerilatorPlugin
#include "src/peripherals/uart.h"
#include "src/buses/apb3.h"

#define BAUDRATE 6250000
#define UART_FREQ 50000000

const int prescaler = UART_FREQ / (BAUDRATE * 8);
UART *uart;
VApb3UartCtrl *uart_ctrl = new VApb3UartCtrl;
VerilatedFstC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
#endif
    uart_ctrl->eval();
    uart->eval();
}

RenodeAgent *Init() {
    APB3* bus = new APB3();

    //=================================================
    // Init bus signals
    //=================================================
    bus->pclk = &uart_ctrl->clk;
    bus->prst = &uart_ctrl->reset;
    bus->paddr = (uint8_t *)&uart_ctrl->io_apb_PADDR;
    bus->psel = &uart_ctrl->io_apb_PSEL;
    bus->penable = &uart_ctrl->io_apb_PENABLE;
    bus->pwrite = &uart_ctrl->io_apb_PWRITE;
    bus->pwdata = (uint32_t *)&uart_ctrl->io_apb_PWDATA;
    bus->pready = &uart_ctrl->io_apb_PREADY;
    bus->prdata = (uint32_t *)&uart_ctrl->io_apb_PRDATA;

    //=================================================
    // Init peripheral
    //=================================================
    const int murax_rxtx_reg = 0x0;
    uart = new UART(bus, &uart_ctrl->io_uart_txd, &uart_ctrl->io_uart_rxd, prescaler, murax_rxtx_reg, &uart_ctrl->io_interrupt);

    //=================================================
    // Init eval function
    //=================================================
    uart->evaluateModel = &eval;

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
    uart_ctrl->trace(tfp, 99);
    tfp->open("simx.fst");
#endif
    Init();
    uart->simulate(atoi(argv[1]), atoi(argv[2]), address);
    uart_ctrl->final();
    exit(0);
}
