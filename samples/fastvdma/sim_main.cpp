//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "VDMATop.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
#include "src/renode.h"
#include "src/buses/axi.h"
#include "src/buses/axi-slave.h"
#include "src/buses/axilite.h"
#include "src/renode_bus.h"

RenodeAgent *fastvdma;
VDMATop *top = new VDMATop;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
        tfp->flush();
#endif
    top->eval();
    fastvdma->handleInterrupts();
}

RenodeAgent *Init() {
    AxiLite* bus = new AxiLite();
    AxiSlave* slaveBus = new AxiSlave(32, 32);

    //=================================================
    // Init bus signals
    //=================================================
    bus->clk = &top->clock;
    bus->rst = &top->reset;
    bus->awaddr = (uint64_t *)&top->io_control_aw_awaddr;
    bus->awprot = &top->io_control_aw_awprot;
    bus->awvalid = &top->io_control_aw_awvalid;
    bus->awready = &top->io_control_aw_awready;
    bus->wdata = (uint64_t *)&top->io_control_w_wdata;
    bus->wstrb = &top->io_control_w_wstrb;
    bus->wvalid = &top->io_control_w_wvalid;
    bus->wready = &top->io_control_w_wready;
    bus->bresp = &top->io_control_b_bresp;
    bus->bvalid = &top->io_control_b_bvalid;
    bus->bready = &top->io_control_b_bready;
    bus->araddr = (uint64_t *)&top->io_control_ar_araddr;
    bus->arprot = &top->io_control_ar_arprot;
    bus->arvalid = &top->io_control_ar_arvalid;
    bus->arready = &top->io_control_ar_arready;
    bus->rdata = (uint64_t *)&top->io_control_r_rdata;
    bus->rresp = &top->io_control_r_rresp;
    bus->rvalid = &top->io_control_r_rvalid;
    bus->rready = &top->io_control_r_rready;

    //------------
    //  Slave Bus
    //------------

    slaveBus->aclk = &top->clock;
    slaveBus->aresetn = &top->reset;

    slaveBus->awid = &top->io_write_aw_awid;
    slaveBus->awaddr = (uint32_t *)&top->io_write_aw_awaddr;
    slaveBus->awlen = &top->io_write_aw_awlen;
    slaveBus->awsize = &top->io_write_aw_awsize;
    slaveBus->awburst = &top->io_write_aw_awburst;
    slaveBus->awlock = &top->io_write_aw_awlock;
    slaveBus->awcache = &top->io_write_aw_awcache;
    slaveBus->awprot = &top->io_write_aw_awprot;
    slaveBus->awqos = &top->io_write_aw_awqos;
    slaveBus->awready = &top->io_write_aw_awready;
    slaveBus->awvalid = &top->io_write_aw_awvalid;

    slaveBus->wdata = (uint32_t *)&top->io_write_w_wdata;
    slaveBus->wstrb = &top->io_write_w_wstrb;
    slaveBus->wlast = &top->io_write_w_wlast;
    slaveBus->wvalid = &top->io_write_w_wvalid;
    slaveBus->wready = &top->io_write_w_wready;

    slaveBus->bid = &top->io_write_b_bid;
    slaveBus->bresp = &top->io_write_b_bresp;
    slaveBus->bvalid = &top->io_write_b_bvalid;
    slaveBus->bready = &top->io_write_b_bready;

    slaveBus->arid = &top->io_read_ar_arid;
    slaveBus->araddr = (uint32_t *)&top->io_read_ar_araddr;
    slaveBus->arlen = &top->io_read_ar_arlen;
    slaveBus->arsize = &top->io_read_ar_arsize;
    slaveBus->arburst = &top->io_read_ar_arburst;
    slaveBus->arlock = &top->io_read_ar_arlock;
    slaveBus->arcache = &top->io_read_ar_arcache;
    slaveBus->arprot = &top->io_read_ar_arprot;
    slaveBus->arqos = &top->io_read_ar_arqos;
    slaveBus->arvalid = &top->io_read_ar_arvalid;
    slaveBus->arready = &top->io_read_ar_arready;

    slaveBus->rid = &top->io_read_r_rid;
    slaveBus->rdata = (uint32_t *)&top->io_read_r_rdata;
    slaveBus->rresp = &top->io_read_r_rresp;
    slaveBus->rlast = &top->io_read_r_rlast;
    slaveBus->rvalid = &top->io_read_r_rvalid;
    slaveBus->rready = &top->io_read_r_rready;

    //=================================================
    // Init peripheral
    //=================================================
    fastvdma = new RenodeAgent(bus);
    fastvdma->addBus(slaveBus);

    //=================================================
    // Init eval function
    //=================================================
    fastvdma->evaluateModel = &eval;

    fastvdma->registerInterrupt(&top->io_irq_writerDone, 0);
    fastvdma->registerInterrupt(&top->io_irq_readerDone, 0);

    slaveBus->setAgent(fastvdma);
    return fastvdma;
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
    Init();
    fastvdma->reset();
    fastvdma->simulate(atoi(argv[1]), atoi(argv[2]), address);
    top->final();
    exit(0);
}
