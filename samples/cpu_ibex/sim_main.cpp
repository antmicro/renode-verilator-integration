#include "sim_ibex.h"
#include "src/renode.h"
#include "src/peripherals/cpu-agent.h"
#include "src/buses/wishbone-initiator.h"

/*
    apt install git build-essential python3-pip wget cmake autoconf ccache flex bison perl xz-utils libfl2 libfl-dev zlibc zlib1g zlib1g-dev
    pip3 install --upgrade pyyaml mako junit-xml git+https://github.com/lowRISC/edalize.git@ot git+https://github.com/lowRISC/fusesoc.git@ot

    mkdir build && cd build
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DUSER_RENODE_DIR=$RENODE_DIR [-DTOP_MODULE=ibex_top_tracing] ..
    cmake --build . --config Release
*/

// See https://github.com/verilator/verilator/blob/master/docs/guide/faq.rst#why-do-i-get-undefined-reference-to-sc_time_stamp
double sc_time_stamp() { return 0; }

Ibex *ibex = nullptr;
CpuAgent *agent = nullptr;
vluint64_t main_time = 0;

void evaluateModel()
{
    ibex->evaluateModel();
}

CpuAgent *initAgent()
{
    Verilated::commandArgs(0, (const char **)nullptr);
    CpuAgent* agent = new CpuAgent();
    return agent;
}

void initBus(CpuAgent *agent)
{
    WishboneInitiator<uint32_t, uint32_t> *instructionFetchBus = new WishboneInitiator<uint32_t, uint32_t>();
    WishboneInitiator<uint32_t, uint32_t> *loadStoreBus = new WishboneInitiator<uint32_t, uint32_t>();

    ibex = new Ibex();

    ibex->setInstructionFetchBus(*instructionFetchBus);
    ibex->setLoadStoreBus(*loadStoreBus);

    agent->addBus(instructionFetchBus);
    agent->addBus(loadStoreBus);
    agent->addCPU(ibex);

    instructionFetchBus->evaluateModel = evaluateModel;
    loadStoreBus->evaluateModel = evaluateModel;
}

RenodeAgent *Init() {
    agent = initAgent();
    agent->connectNative();
    initBus(agent);
    return agent;
}

int main(int argc, char **argv, char **env)
{
    if (argc < 3)
    {
        printf("Usage: %s {receiverPort} {senderPort} [{address}]\n", argv[0]);
        exit(-1);
    }
    const char *address = argc < 4 ? "127.0.0.1" : argv[3];

    agent = initAgent();
    agent->connect(atoi(argv[1]), atoi(argv[2]), address);
    initBus(agent);
    agent->simulate();

    return 0;
}

