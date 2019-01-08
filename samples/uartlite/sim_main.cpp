//
// Copyright (c) 2010-2019 Antmicro
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
# include <verilated_vcd_c.h>
#endif
// uart.h and axilite.h can be found in Renode's VerilatorPlugin
#include "src/peripherals/uart.h"
#include "src/buses/axilite.h"

#define UART_FREQ 100000000
#define BAUDRATE 115200

const int prescaler = UART_FREQ / (BAUDRATE * 8);
UART *uart;
Vtop *top;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
#endif
    top->eval();
}

void Init() {
    AxiLite* bus = new AxiLite();

    //=================================================
    // Init bus signals
    //=================================================
    bus->clk = &top->clk;
    bus->rst = &top->rst;
    bus->awaddr = (unsigned long *)&top->awaddr;
    bus->awvalid = &top->awvalid;
    bus->awready = &top->awready;
    bus->wdata = (unsigned long *)&top->wdata;
    bus->wstrb = &top->wstrb;
    bus->wvalid = &top->wvalid;
    bus->wready = &top->wready;
    bus->bresp = &top->bresp;
    bus->bvalid = &top->bvalid;
    bus->bready = &top->bready;
    bus->araddr = (unsigned long *)&top->araddr;
    bus->arvalid = &top->arvalid;
    bus->arready = &top->arready;
    bus->rdata = (unsigned long *)&top->rdata;
    bus->rresp = &top->rresp;
    bus->rvalid = &top->rvalid;
    bus->rready = &top->rready;

    //=================================================
    // Init eval function
    //=================================================
    bus->evaluateModel = &eval;

    //=================================================
    // Init peripheral
    //=================================================
    uart = new UART(bus, &top->txd, &top->rxd, prescaler);
}

int main(int argc, char **argv, char **env) {
    if(argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort}\n", argv[0]);
        exit(-1);
    }

    Verilated::commandArgs(argc, argv);
    top = new Vtop;
#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif
    Init();
    uart->simulate(atoi(argv[1]), atoi(argv[2]));
    top->final();
    exit(0);
}
