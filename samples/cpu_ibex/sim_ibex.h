#ifndef SIM_IBEX_H
#define SIM_IBEX_H

#include <ostream>
#include "Vibex_pkg.h"
#include "verilated.h"
#include "riscv-instructions.h"
#include "src/peripherals/cpu-interface.h"

constexpr uint32_t high = 1;
constexpr uint32_t low = 0;

template <typename data_t, typename addr_t>
struct WishboneInitiator;

struct IbexBusInterface
{
    using Wishbone = WishboneInitiator<uint32_t, uint32_t>;

    virtual uint8_t &req_o() = 0;
    virtual uint32_t &addr_o() = 0;
    virtual uint8_t &we_o() = 0;
    virtual uint8_t &be_o() = 0;
    virtual uint32_t &wdata_o() = 0;
    virtual uint8_t &gnt_i() = 0;
    virtual uint8_t &rvalid_i() = 0;
    virtual uint8_t &err_i() = 0;
    virtual uint32_t &rdata_i() = 0;

    void connect(WishboneInitiator<uint32_t, uint32_t> &wishbone);
    void convert(uint8_t clk);

    uint8_t wb_cyc = 0, wb_sel, wb_rst = high, wb_stall = high;
};

struct ClockAndReset
{
    uint8_t *clk_i;
    uint8_t *rst_ni;
    uint8_t *test_en_i;
    uint8_t *scan_rst_ni;
    uint16_t *ram_cfg_i; // 10 bit

    void init()
    {
        *clk_i = low;
        *rst_ni = high;
        *test_en_i = low;
        *scan_rst_ni = high;
        *ram_cfg_i = low;
    }

    void clockHigh()
    {
        *clk_i = high;
    }

    void clockLow()
    {
        *clk_i = low;
    }
};

struct Configuration
{
    uint32_t *hart_id_i;
    uint32_t *boot_addr_i;

    void init()
    {
        *hart_id_i = low;
        *boot_addr_i = low;
    }
};

struct InstructionFetch : public IbexBusInterface
{
    uint8_t *instr_req_o;
    uint32_t *instr_addr_o;
    uint8_t *instr_gnt_i;
    uint8_t *instr_rvalid_i;
    uint32_t *instr_rdata_i;
    uint8_t *instr_err_i;

    uint8_t &req_o() override { return *instr_req_o; }
    uint32_t &addr_o() override { return *instr_addr_o; }
    uint8_t &we_o() override { return dummy_we_o; }
    uint8_t &be_o() override { return dummy_be_o; }
    uint32_t &wdata_o() override { return dummy_wdata_o; }
    uint8_t &gnt_i() override { return *instr_gnt_i; }
    uint8_t &rvalid_i() override { return *instr_rvalid_i; }
    uint8_t &err_i() override { return *instr_err_i; }
    uint32_t &rdata_i() override { return *instr_rdata_i; }

    uint8_t dummy_we_o = low;
    uint8_t dummy_be_o = 0xF;
    uint32_t dummy_wdata_o = 0;

    void init()
    {
        *instr_gnt_i = low;
        *instr_rvalid_i = low;
        *instr_rdata_i = low;
        *instr_err_i = low;
    }
};

struct LoadStore : public IbexBusInterface
{
    uint8_t *data_req_o;
    uint32_t *data_addr_o;
    uint8_t *data_we_o;
    uint8_t *data_be_o; // 4 bits
    uint32_t *data_wdata_o;
    uint8_t *data_gnt_i;
    uint8_t *data_rvalid_i;
    uint8_t *data_err_i;
    uint32_t *data_rdata_i;

    uint8_t &req_o() override { return *data_req_o; }
    uint32_t &addr_o() override { return *data_addr_o; }
    uint8_t &we_o() override { return *data_we_o; }
    uint8_t &be_o() override { return *data_be_o; }
    uint32_t &wdata_o() override { return *data_wdata_o; }
    uint8_t &gnt_i() override { return *data_gnt_i; }
    uint8_t &rvalid_i() override { return *data_rvalid_i; }
    uint8_t &err_i() override { return *data_err_i; }
    uint32_t &rdata_i() override { return *data_rdata_i; }

    void init()
    {
        *data_gnt_i = low;
        *data_rvalid_i = low;
        *data_err_i = low;
        *data_rdata_i = low;
    }
};

struct SpecialControlSignals
{
    uint8_t *fetch_enable_i;
    uint8_t *alert_minor_o;
    uint8_t *alert_major_o;
    uint8_t *core_sleep_o;

    void init()
    {
        *fetch_enable_i = high;
    }
};

struct Interrupts
{
    uint8_t *irq_nm_i;
    uint16_t *irq_fast_i;
    uint8_t *irq_external_i;
    uint8_t *irq_timer_i;
    uint8_t *irq_software_i;
};

struct Debug
{
    uint8_t *debug_req_i;
};

class Ibex : public DebuggableCPU, protected RiscVInstructions
{
public:
    Ibex();

    void reset() override;
    void setInstructionFetchBus(IbexBusInterface::Wishbone &wishbone);
    void setLoadStoreBus(IbexBusInterface::Wishbone &wishbone);

    void onGPIO(int number, bool value) override;
    bool isHalted() override { return *specialControlSignals.core_sleep_o; }
    void clkHigh() override { *clockAndReset.clk_i = high; }
    void clkLow() override { *clockAndReset.clk_i = low; }
    void evaluateModel() override;
    void debugRequest(bool value) override;
    DebugProgram getRegisterGetProgram(uint64_t id) override;
    DebugProgram getRegisterSetProgram(uint64_t id, uint64_t value) override;
    DebugProgram getEnterSingleStepModeProgram() override;
    DebugProgram getExitSingleStepModeProgram() override;
    DebugProgram getSingleStepModeProgram() override;

private:
    uint32_t end(bool jumpToBegin, int offsetToBegin) { return jumpToBegin ? jal(0, (-offsetToBegin + 1) * 4) : dret; }

    Vibex_pkg top;

    ClockAndReset clockAndReset;
    Configuration configuration;
    InstructionFetch instructionFetch;
    LoadStore loadStore;
    SpecialControlSignals specialControlSignals;
    Interrupts interrupts;
    Debug debug;

    static constexpr uint32_t debugProgramAddress = 0x1A110800;
    static constexpr uint32_t dscratch0 = 0x7b2;
    static constexpr uint32_t dpc = 0x7B1;
    static constexpr uint32_t dcsr = 0x7B0;

    friend std::ostream &operator<<(std::ostream &stream, const Ibex &ibex);
};

std::ostream &operator<<(std::ostream &stream, const ClockAndReset &clockAndReset);
std::ostream &operator<<(std::ostream &stream, const Configuration &configuration);
std::ostream &operator<<(std::ostream &stream, const InstructionFetch &instructionFetch);
std::ostream &operator<<(std::ostream &stream, const LoadStore &loadStore);
std::ostream &operator<<(std::ostream &stream, const SpecialControlSignals &specialControlSignals);
std::ostream &operator<<(std::ostream &stream, const Interrupts &interrupts);
std::ostream &operator<<(std::ostream &stream, const Ibex &ibex);

#endif /* SIM_IBEX_H */

