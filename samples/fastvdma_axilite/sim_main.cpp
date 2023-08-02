//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "VDMATopAXI_AXIL_AXIL.h"
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
#include "src/buses/axilite-initiator.h"
#include "src/renode_bus.h"

RenodeAgent *fastvdma;
VDMATopAXI_AXIL_AXIL *top = new VDMATopAXI_AXIL_AXIL;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
    top->eval();
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
        tfp->flush();
#endif
    fastvdma->handleInterrupts();
}

RenodeAgent *Init() {
    AxiSlave* reader = new AxiSlave(32, 32);
    AxiLite* bus = new AxiLite(32, 32);
    AxiLiteInitiator* writer = new AxiLiteInitiator(32, 32);

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

    //--------------
    //  Writer Bus
    //--------------

    writer->clk = &top->clock;
    writer->rst = &top->reset;

    writer->arvalid = &top->io_write_ar_arvalid;
    writer->arready = &top->io_write_ar_arready;
    writer->araddr = (uint64_t *)&top->io_write_ar_araddr;
    writer->arprot = &top->io_write_ar_arprot;

    writer->rvalid = &top->io_write_r_rvalid;
    writer->rready = &top->io_write_r_rready;
    writer->rdata = (uint64_t *)&top->io_write_r_rdata;
    writer->rresp = &top->io_write_r_rresp;

    writer->awaddr = (uint64_t *)&top->io_write_aw_awaddr;
    writer->awprot = &top->io_write_aw_awprot;
    writer->awready = &top->io_write_aw_awready;
    writer->awvalid = &top->io_write_aw_awvalid;

    writer->wdata = (uint64_t *)&top->io_write_w_wdata;
    writer->wstrb = &top->io_write_w_wstrb;
    writer->wvalid = &top->io_write_w_wvalid;
    writer->wready = &top->io_write_w_wready;

    writer->bresp = &top->io_write_b_bresp;
    writer->bvalid = &top->io_write_b_bvalid;
    writer->bready = &top->io_write_b_bready;

    //--------------
    //  Reader Bus
    //--------------

    reader->aclk = &top->clock;
    reader->aresetn = &top->reset;

    reader->arid = &top->io_read_ar_arid;
    reader->araddr = &top->io_read_ar_araddr;
    reader->arlen = &top->io_read_ar_arlen;
    reader->arsize = &top->io_read_ar_arsize;
    reader->arburst = &top->io_read_ar_arburst;
    reader->arlock = &top->io_read_ar_arlock;
    reader->arcache = &top->io_read_ar_arcache;
    reader->arprot = &top->io_read_ar_arprot;
    reader->arqos = &top->io_read_ar_arqos;
    reader->arvalid = &top->io_read_ar_arvalid;
    reader->arready = &top->io_read_ar_arready;

    reader->rid = &top->io_read_r_rid;
    reader->rdata = &top->io_read_r_rdata;
    reader->rresp = &top->io_read_r_rresp;
    reader->rlast = &top->io_read_r_rlast;
    reader->rvalid = &top->io_read_r_rvalid;
    reader->rready = &top->io_read_r_rready;

    reader->awid = &top->io_read_aw_awid;
    reader->awaddr = &top->io_read_aw_awaddr;
    reader->awlen = &top->io_read_aw_awlen;
    reader->awsize = &top->io_read_aw_awsize;
    reader->awburst = &top->io_read_aw_awburst;
    reader->awlock = &top->io_read_aw_awlock;
    reader->awcache = &top->io_read_aw_awcache;
    reader->awprot = &top->io_read_aw_awprot;
    reader->awqos = &top->io_read_aw_awqos;
    reader->awvalid = &top->io_read_aw_awvalid;
    reader->awready = &top->io_read_aw_awready;

    reader->wdata = &top->io_read_w_wdata;
    reader->wstrb = &top->io_read_w_wstrb;
    reader->wlast = &top->io_read_w_wlast;
    reader->wvalid = &top->io_read_w_wvalid;
    reader->wready = &top->io_read_w_wready;

    reader->bid = &top->io_read_b_bid;
    reader->bresp = &top->io_read_b_bresp;
    reader->bvalid = &top->io_read_b_bvalid;
    reader->bready = &top->io_read_b_bready;

    //=================================================
    // Init peripheral
    //=================================================
    fastvdma = new RenodeAgent(bus);
    fastvdma->addBus(reader);
    fastvdma->addBus(writer);

    reader->setAgent(fastvdma);
    writer->setAgent(fastvdma);

    //=================================================
    // Init eval function
    //=================================================
    fastvdma->evaluateModel = &eval;


    fastvdma->registerInterrupt(&top->io_irq_writerDone, 0);
    fastvdma->registerInterrupt(&top->io_irq_readerDone, 0);

#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif
    return fastvdma;
}

int main(int argc, char **argv, char **env) {
    if(argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort} [{address}]\n", argv[0]);
        exit(-1);
    }
    const char *address = argc < 4 ? "127.0.0.1" : argv[3];

    Verilated::commandArgs(argc, argv);
    Init();
    fastvdma->reset();
    fastvdma->simulate(atoi(argv[1]), atoi(argv[2]), address);
    top->final();
    exit(0);
}
