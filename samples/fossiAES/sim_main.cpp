//
// Copyright (c) 2022 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "Vaes.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
#include "src/buses/wishbone.h"
#include "src/renode_bus.h"

RenodeAgent *aes;
Vaes *top = new Vaes;
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

RenodeAgent *Init() {
    Wishbone* bus = new Wishbone();

    //=================================================
    // Init bus signals
    //=================================================
    bus->wb_clk = &top->clock;
    bus->wb_rst = &top->reset;
    bus->wb_cyc = &top->io_wbs_cyc_i;
    bus->wb_sel = &top->io_wbs_sel_i;
    bus->wb_stb = &top->io_wbs_stb_i;
    bus->wb_we = &top->io_wbs_we_i;
    bus->wb_ack = &top->io_wbs_ack_o;
    bus->wb_addr = (uint64_t *)&top->io_wbs_adr_i;
    bus->wb_rd_dat = (uint64_t *)&top->io_wbs_dat_o;
    bus->wb_wr_dat = (uint64_t *)&top->io_wbs_dat_i;

    //=================================================
    // Init eval function
    //=================================================
    bus->evaluateModel = &eval;

    //=================================================
    // Init peripheral
    //=================================================
    aes = new RenodeAgent(bus);

#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif

    return aes;
}
