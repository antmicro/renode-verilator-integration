//
// Copyright (c) 2010-2025 Antmicro
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
Vtop *top = new Vtop;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
#endif
    top->eval();
}

RenodeAgent *initAgent() {
    RenodeAgent *agent = new UART(&top->txd, &top->rxd, prescaler);
    AxiLite* bus = new AxiLite();

    //=================================================
    // Init bus signals
    //=================================================
    bus->clk = &top->clk;
    bus->rst = &top->rst;
    bus->awaddr = (uint64_t *)&top->awaddr;
    bus->awvalid = &top->awvalid;
    bus->awready = &top->awready;
    bus->wdata = (uint64_t *)&top->wdata;
    bus->wstrb = &top->wstrb;
    bus->wvalid = &top->wvalid;
    bus->wready = &top->wready;
    bus->bresp = &top->bresp;
    bus->bvalid = &top->bvalid;
    bus->bready = &top->bready;
    bus->araddr = (uint64_t *)&top->araddr;
    bus->arvalid = &top->arvalid;
    bus->arready = &top->arready;
    bus->rdata = (uint64_t *)&top->rdata;
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
    agent->addBus(bus);
    return agent;
}

RenodeAgent *Init() {
    RenodeAgent *agent = initAgent();
    agent->connectNative();
    return agent;
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
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif
    RenodeAgent *uart = initAgent();
    uart->connect(atoi(argv[1]), atoi(argv[2]), address);
    uart->simulate();
    top->final();
    exit(0);
}
