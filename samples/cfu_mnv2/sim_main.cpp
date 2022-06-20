//
// Copyright (c) 2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "Vcfu.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
#include "src/renode_cfu.h"
#include "src/buses/cfu.h"

RenodeAgent *cfu;
Vcfu *top = new Vcfu;
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
    Cfu* bus = new Cfu();

    //=================================================
    // Init CFU signals
    //=================================================
    bus->req_valid = &top->cmd_valid;
    bus->req_ready = &top->cmd_ready;
    bus->req_func_id = (uint16_t *)&top->cmd_payload_function_id;
    bus->req_data0 = (uint32_t *)&top->cmd_payload_inputs_0;
    bus->req_data1 = (uint32_t *)&top->cmd_payload_inputs_1;
    bus->resp_valid = &top->rsp_valid;
    bus->resp_ready = &top->rsp_ready;
    bus->resp_data = (uint32_t *)&top->rsp_payload_outputs_0;
    bus->rst = &top->reset;
    bus->clk = &top->clk;

    //=================================================
    // Init eval function
    //=================================================
    bus->evaluateModel = &eval;

    //=================================================
    // Init peripheral
    //=================================================
    cfu = new RenodeAgent(bus);

#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif

    return cfu;
}
