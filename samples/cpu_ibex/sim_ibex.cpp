#include "sim_ibex.h"
#include "src/renode_bus.h"
#include "src/buses/wishbone-initiator.h"

void IbexBusInterface::connect(WishboneInitiator<uint32_t, uint32_t> &wishbone)
{
    wishbone.wb_ack = &rvalid_i();
    wishbone.wb_rd_dat = &rdata_i();
    wishbone.wb_stb = &req_o();
    wishbone.wb_addr = &addr_o();
    wishbone.wb_wr_dat = &wdata_o();
    wishbone.wb_we = &we_o();
    wishbone.wb_cyc = &wb_cyc;
    wishbone.wb_sel = &wb_sel;
    wishbone.wb_rst = &wb_rst;
    wishbone.wb_stall = &wb_stall;
}

void IbexBusInterface::convert(uint8_t clk)
{
    gnt_i() = req_o() & ~wb_stall;
    wb_sel = be_o();

    if (wb_rst)
        wb_cyc = low;
    else if (clk)
    {
        if (req_o())
            wb_cyc = high;
        else if (rvalid_i())
            wb_cyc = low;
    }
    wb_cyc = req_o() | wb_cyc;
}

Ibex::Ibex()
    : top()
{
    clockAndReset.clk_i = &top.clk_i;
    clockAndReset.rst_ni = &top.rst_ni;
    clockAndReset.test_en_i = &top.test_en_i;
    clockAndReset.scan_rst_ni = &top.scan_rst_ni;
    clockAndReset.ram_cfg_i = &top.ram_cfg_i;
    clockAndReset.init();

    configuration.boot_addr_i = &top.boot_addr_i;
    configuration.hart_id_i = &top.hart_id_i;
    configuration.init();

    instructionFetch.instr_req_o = &top.instr_req_o;
    instructionFetch.instr_addr_o = &top.instr_addr_o;
    instructionFetch.instr_gnt_i = &top.instr_gnt_i;
    instructionFetch.instr_rvalid_i = &top.instr_rvalid_i;
    instructionFetch.instr_rdata_i = &top.instr_rdata_i;
    instructionFetch.instr_err_i = &top.instr_err_i;
    instructionFetch.init();

    loadStore.data_req_o = &top.data_req_o;
    loadStore.data_addr_o = &top.data_addr_o;
    loadStore.data_we_o = &top.data_we_o;
    loadStore.data_be_o = &top.data_be_o;
    loadStore.data_wdata_o = &top.data_wdata_o;
    loadStore.data_gnt_i = &top.data_gnt_i;
    loadStore.data_rvalid_i = &top.data_rvalid_i;
    loadStore.data_err_i = &top.data_err_i;
    loadStore.data_rdata_i = &top.data_rdata_i;
    loadStore.init();

    specialControlSignals.fetch_enable_i = &top.fetch_enable_i;
    specialControlSignals.core_sleep_o = &top.core_sleep_o;
    specialControlSignals.alert_minor_o = &top.alert_minor_o;
    specialControlSignals.init();

    interrupts.irq_nm_i = &top.irq_nm_i;
    interrupts.irq_fast_i = &top.irq_fast_i;
    interrupts.irq_external_i = &top.irq_external_i;
    interrupts.irq_timer_i = &top.irq_timer_i;
    interrupts.irq_software_i = &top.irq_software_i;

    debug.debug_req_i = &top.debug_req_i;

    reset();
}

void Ibex::reset()
{
    *clockAndReset.rst_ni = high;
    evaluateModel();
    *clockAndReset.rst_ni = low;
    evaluateModel();
    *clockAndReset.rst_ni = high;
    evaluateModel();
}

void Ibex::setInstructionFetchBus(IbexBusInterface::Wishbone &wishbone)
{
    instructionFetch.connect(wishbone);
    wishbone.wb_clk = clockAndReset.clk_i;
}

void Ibex::setLoadStoreBus(IbexBusInterface::Wishbone &wishbone)
{
    loadStore.connect(wishbone);
    wishbone.wb_clk = clockAndReset.clk_i;
}

void Ibex::evaluateModel()
{
    instructionFetch.convert(*clockAndReset.clk_i);
    loadStore.convert(*clockAndReset.clk_i);
    top.eval();
}

void Ibex::onGPIO(int number, bool value)
{
    switch (number)
    {
    case 3:
        *interrupts.irq_software_i = value;
        break;
    case 7:
        *interrupts.irq_timer_i = value;
        break;
    case 11:
        *interrupts.irq_external_i = value;
        break;
    case 31:
        *interrupts.irq_nm_i = value;
        break;

    default:
        if (number >= 16 && number <= 30)
        {
            if (value)
                *interrupts.irq_fast_i |= (1U << (number - 16));
            else
                *interrupts.irq_fast_i &= ~(1U << (number - 16));
        }
        break;
    }
}

void Ibex::debugRequest(bool value)
{
    *debug.debug_req_i = value;
}

DebuggableCPU::DebugProgram Ibex::getRegisterGetProgram(uint64_t id)
{
    DebugProgram debugProgram;
    debugProgram.address = debugProgramAddress;

    if (id < 32) // register
    {
        debugProgram.memory = {
            sw(id, 0, 0), // store x1 to memory
            dret};        // return
    }
    else //CSR
    {
        if (id == 32)   // if PC
            id = dpc; // DPC

        debugProgram.memory = {
            csrrw(0, dscratch0, 1), // move x1 to dscratch0
            csrrs(1, id, 0),        // move selected csr to x1
            sw(1, 0, 0),            // store x1 to memory
            csrrs(1, dscratch0, 0), //restore x1
            dret};                  // return
    }
    debugProgram.readCount = debugProgram.memory.size();
    return debugProgram;
}

DebuggableCPU::DebugProgram Ibex::getRegisterSetProgram(uint64_t id, uint64_t value)
{
    DebugProgram debugProgram;
    debugProgram.address = debugProgramAddress;

    if (id < 32) // register
    {
        uint32_t luiPart = value >> 12;
        uint32_t addiPart = value & 0xfff;
        if (addiPart & (1 << 11)) // addi appends negative numbers with ones
            luiPart += 1;         // if we add 1 to lui part all those ones overflow and dissapear

        debugProgram.memory = {
            lui(id, luiPart),       // upper 20 bits
            addi(id, id, addiPart), // lower 12 bits
            dret};                  // return
    }
    else //CSR
    {
        if (id == 32)   // if PC
            id = 0x7B1; // DPC

        uint32_t luiPart = value >> 12;
        uint32_t addiPart = value & 0xfff;
        if (addiPart & (1 << 11))
            luiPart += 1;

        debugProgram.memory = {
            csrrw(0, dscratch0, 1), // move x1 to dscratch0
            lui(1, luiPart),        // write value to x1
            addi(1, 1, addiPart),
            csrrw(0, id, 1),        // move x1 to selected csr
            csrrs(1, dscratch0, 0), //restore x1
            dret};                  // return
    }
    debugProgram.readCount = debugProgram.memory.size();
    return debugProgram;
}

DebuggableCPU::DebugProgram Ibex::getEnterSingleStepModeProgram()
{
    DebugProgram debugProgram;
    debugProgram.address = debugProgramAddress;
    debugProgram.memory = {
        csrrsi(0, dcsr, 1 << 2), // set dcsr.step
        dret};                   // return
    debugProgram.readCount = debugProgram.memory.size();
    return debugProgram;
}

DebuggableCPU::DebugProgram Ibex::getExitSingleStepModeProgram()
{
    DebugProgram debugProgram;
    debugProgram.address = debugProgramAddress;
    debugProgram.memory = {
        csrrci(0, dcsr, 1 << 2), // clear dcsr.step
        dret};                   // return
    debugProgram.readCount = debugProgram.memory.size();
    return debugProgram;
}
DebuggableCPU::DebugProgram Ibex::getSingleStepModeProgram()
{
    DebugProgram debugProgram;
    debugProgram.address = debugProgramAddress;
    debugProgram.memory = {
        dret}; // return
    debugProgram.readCount = debugProgram.memory.size();
    return debugProgram;
}

#define printPointerValueToStream(obj, ptr) stream << #ptr ": " << uint64_t(*obj.ptr) << '\n'

std::ostream &operator<<(std::ostream &stream, const ClockAndReset &clockAndReset)
{
    printPointerValueToStream(clockAndReset, clk_i);
    printPointerValueToStream(clockAndReset, rst_ni);
    printPointerValueToStream(clockAndReset, test_en_i);
    printPointerValueToStream(clockAndReset, scan_rst_ni);
    printPointerValueToStream(clockAndReset, ram_cfg_i);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const Configuration &configuration)
{
    printPointerValueToStream(configuration, hart_id_i);
    printPointerValueToStream(configuration, boot_addr_i);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const InstructionFetch &instructionFetch)
{
    printPointerValueToStream(instructionFetch, instr_req_o);
    printPointerValueToStream(instructionFetch, instr_addr_o);
    printPointerValueToStream(instructionFetch, instr_gnt_i);
    printPointerValueToStream(instructionFetch, instr_rvalid_i);
    printPointerValueToStream(instructionFetch, instr_rdata_i);
    printPointerValueToStream(instructionFetch, instr_err_i);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const LoadStore &loadStore)
{
    printPointerValueToStream(loadStore, data_req_o);
    printPointerValueToStream(loadStore, data_addr_o);
    printPointerValueToStream(loadStore, data_we_o);
    printPointerValueToStream(loadStore, data_be_o);
    printPointerValueToStream(loadStore, data_wdata_o);
    printPointerValueToStream(loadStore, data_gnt_i);
    printPointerValueToStream(loadStore, data_rvalid_i);
    printPointerValueToStream(loadStore, data_err_i);
    printPointerValueToStream(loadStore, data_rdata_i);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const SpecialControlSignals &specialControlSignals)
{
    printPointerValueToStream(specialControlSignals, fetch_enable_i);
    printPointerValueToStream(specialControlSignals, alert_minor_o);
    printPointerValueToStream(specialControlSignals, alert_major_o);
    printPointerValueToStream(specialControlSignals, core_sleep_o);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const Interrupts &interrupts)
{

    printPointerValueToStream(interrupts, irq_nm_i);
    printPointerValueToStream(interrupts, irq_fast_i);
    printPointerValueToStream(interrupts, irq_external_i);
    printPointerValueToStream(interrupts, irq_timer_i);
    printPointerValueToStream(interrupts, irq_software_i);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const Debug &debug)
{
    printPointerValueToStream(debug, debug_req_i);
    return stream;
}

std::ostream &operator<<(std::ostream &stream, const Ibex &ibex)
{
    stream << ibex.clockAndReset << ibex.configuration << ibex.instructionFetch << ibex.loadStore << ibex.specialControlSignals << ibex.debug;
    return stream;
}

