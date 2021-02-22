//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "Vaxi_ram.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
#include "src/buses/axi.h"
#include "src/renode.h"

RenodeAgent *axi_ram;
Vaxi_ram *top;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
        tfp->flush();
#endif
    top->eval();
}

void Init() {
    Axi* bus = new Axi(32, 32);

    //=================================================
    // Init bus signals
    //=================================================
    bus->aclk = &top->clk;
    bus->aresetn = &top->rst;

    bus->awid = &top->s_axi_awid;
    bus->awaddr = (unsigned int *) &top->s_axi_awaddr;
    bus->awlen = &top->s_axi_awlen;
    bus->awsize = &top->s_axi_awsize;
    bus->awburst = &top->s_axi_awburst;
    bus->awlock = &top->s_axi_awlock;
    bus->awcache = &top->s_axi_awcache;
    bus->awprot = &top->s_axi_awprot;
    bus->awvalid = &top->s_axi_awvalid;
    bus->awready = &top->s_axi_awready;

    bus->wdata = &top->s_axi_wdata;
    bus->wstrb = &top->s_axi_wstrb;
    bus->wlast = &top->s_axi_wlast;
    bus->wvalid = &top->s_axi_wvalid;
    bus->wready = &top->s_axi_wready;

    bus->bid = &top->s_axi_bid;
    bus->bresp = &top->s_axi_bresp;
    bus->bvalid = &top->s_axi_bvalid;
    bus->bready = &top->s_axi_bready;

    bus->arid = &top->s_axi_arid;
    bus->araddr = (unsigned int *) &top->s_axi_araddr;
    bus->arlen = &top->s_axi_arlen;
    bus->arsize = &top->s_axi_arsize;
    bus->arburst = &top->s_axi_arburst;
    bus->arlock = &top->s_axi_arlock;
    bus->arcache = &top->s_axi_arcache;
    bus->arprot = &top->s_axi_arprot;
    bus->arvalid = &top->s_axi_arvalid;
    bus->arready = &top->s_axi_arready;

    bus->rid = &top->s_axi_rid;
    bus->rdata = &top->s_axi_rdata;
    bus->rresp = &top->s_axi_rresp;
    bus->rlast = &top->s_axi_rlast;
    bus->rvalid = &top->s_axi_rvalid;
    bus->rready = &top->s_axi_rready;

    bus->evaluateModel = &eval;

    //=================================================
    // Init peripheral
    //=================================================
    axi_ram = new RenodeAgent(bus);
    bus->setAgent(axi_ram);
}

int main(int argc, char **argv, char **env) {
    if(argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort}\n", argv[0]);
        exit(-1);
    }

    Verilated::commandArgs(argc, argv);
    top = new Vaxi_ram;
#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif
    Init();
    axi_ram->simulate(atoi(argv[1]), atoi(argv[2]));
    top->final();
    exit(0);
}
