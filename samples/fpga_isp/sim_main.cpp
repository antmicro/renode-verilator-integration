//
// Copyright (c) 2010-2022 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include <bitset>
#include <stdio.h>
#include "Vfpga_isp.h"
#include <stdlib.h>
#include <stdint.h>

#if VM_TRACE_VCD
# include <verilated_vcd_c.h>
# define VERILATED_DUMP VerilatedVcdC
# define DEF_TRACE_FILEPATH "simx.vcd"
#elif VM_TRACE_FST
# include <verilated_fst_c.h>
# define VERILATED_DUMP VerilatedFstC
# define DEF_TRACE_FILEPATH "simx.fst"
#endif

#include "src/buses/axi-slave.h"
#include "src/buses/axi.h"
#include "src/renode_bus.h"

RenodeAgent *isp;
Vfpga_isp *top = new Vfpga_isp;
vluint64_t main_time = 0;

#if VM_TRACE
VERILATED_DUMP *tfp;
#endif

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
        tfp->flush();
#endif
    top->eval();
    isp->handleInterrupts();
}

RenodeAgent *Init() {
    AxiSlave* slaveBus = new AxiSlave(32, 32);
    Axi* axi = new Axi(32, 32);

    //=================================================
    // Init AXI slave
    //=================================================
    slaveBus->aclk = &top->sys_clk;
    slaveBus->aresetn = &top->sys_rst;

    slaveBus->awid = &top->axi_write_awid;
    slaveBus->awaddr = &top->axi_write_awaddr;
    slaveBus->awlen = &top->axi_write_awlen;
    slaveBus->awsize = &top->axi_write_awsize;
    slaveBus->awburst = &top->axi_write_awburst;
    slaveBus->awlock = &top->axi_write_awlock;
    slaveBus->awcache = &top->axi_write_awcache;
    slaveBus->awprot = &top->axi_write_awprot;
    slaveBus->awqos = &top->axi_write_awqos;
    slaveBus->awready = &top->axi_write_awready;
    slaveBus->awvalid = &top->axi_write_awvalid;

    slaveBus->wdata = &top->axi_write_wdata;
    slaveBus->wstrb = &top->axi_write_wstrb;
    slaveBus->wlast = &top->axi_write_wlast;
    slaveBus->wvalid = &top->axi_write_wvalid;
    slaveBus->wready = &top->axi_write_wready;

    slaveBus->bid = &top->axi_write_bid;
    slaveBus->bresp = &top->axi_write_bresp;
    slaveBus->bvalid = &top->axi_write_bvalid;
    slaveBus->bready = &top->axi_write_bready;

    slaveBus->arid = &top->axi_read_arid;
    slaveBus->araddr = &top->axi_read_araddr;
    slaveBus->arlen = &top->axi_read_arlen;
    slaveBus->arsize = &top->axi_read_arsize;
    slaveBus->arburst = &top->axi_read_arburst;
    slaveBus->arlock = &top->axi_read_arlock;
    slaveBus->arcache = &top->axi_read_arcache;
    slaveBus->arprot = &top->axi_read_arprot;
    slaveBus->arqos = &top->axi_read_arqos;
    slaveBus->arvalid = &top->axi_read_arvalid;
    slaveBus->arready = &top->axi_read_arready;

    slaveBus->rid = &top->axi_read_rid;
    slaveBus->rdata = &top->axi_read_rdata;
    slaveBus->rresp = &top->axi_read_rresp;
    slaveBus->rlast = &top->axi_read_rlast;
    slaveBus->rvalid = &top->axi_read_rvalid;
    slaveBus->rready = &top->axi_read_rready;

    //=================================================
    // Init AXI master
    //=================================================
    axi->aclk = &top->sys_clk;
    axi->aresetn = &top->sys_rst;

    axi->awid = (uint8_t *)&top->axi_awid;
    axi->awaddr = &top->axi_awaddr;
    axi->awlen = &top->axi_awlen;
    axi->awsize = &top->axi_awsize;
    axi->awburst = &top->axi_awburst;
    axi->awlock = &top->axi_awlock;
    axi->awcache = &top->axi_awcache;
    axi->awprot = &top->axi_awprot;
    axi->awqos = &top->axi_awqos;
    axi->awready = &top->axi_awready;
    axi->awvalid = &top->axi_awvalid;

    axi->wdata = &top->axi_wdata;
    axi->wstrb = &top->axi_wstrb;
    axi->wlast = &top->axi_wlast;
    axi->wvalid = &top->axi_wvalid;
    axi->wready = &top->axi_wready;

    axi->bid = (uint8_t *)&top->axi_bid;
    axi->bresp = &top->axi_bresp;
    axi->bvalid = &top->axi_bvalid;
    axi->bready = &top->axi_bready;

    axi->arid = (uint8_t *)&top->axi_arid;
    axi->araddr = &top->axi_araddr;
    axi->arlen = &top->axi_arlen;
    axi->arsize = &top->axi_arsize;
    axi->arburst = &top->axi_arburst;
    axi->arlock = &top->axi_arlock;
    axi->arcache = &top->axi_arcache;
    axi->arprot = &top->axi_arprot;
    axi->arqos = &top->axi_arqos;
    axi->arvalid = &top->axi_arvalid;
    axi->arready = &top->axi_arready;

    axi->rid = (uint8_t *)&top->axi_rid;
    axi->rdata = &top->axi_rdata;
    axi->rresp = &top->axi_rresp;
    axi->rlast = &top->axi_rlast;
    axi->rvalid = &top->axi_rvalid;
    axi->rready = &top->axi_rready;

    //=================================================
    // Init peripheral
    //=================================================
    isp = new RenodeAgent(axi);
    isp->addBus(slaveBus);

    slaveBus->setAgent(isp);
    axi->setAgent(isp);

    isp->registerInterrupt(&top->irq_dmaIn, 0);
    isp->registerInterrupt(&top->irq_dmaOut, 1);

    //=================================================
    // Init eval function
    //=================================================
    isp->evaluateModel = &eval;

#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VERILATED_DUMP;
    top->trace(tfp, 99);
    tfp->open(DEF_TRACE_FILEPATH);
#endif

    return isp;
}

int main(int argc, char **argv, char **env) {
    if(argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort} [{address}]\n", argv[0]);
        exit(-1);
    }
    const char *address = argc < 4 ? "127.0.0.1" : argv[3];

    Verilated::commandArgs(argc, argv);
    Init();
    isp->reset();
    isp->simulate(atoi(argv[1]), atoi(argv[2]), address);
    top->final();
    exit(0);
}
