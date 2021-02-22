ifeq ($(INTEGRATION_DIR),)
$(error INTEGRATION_DIR not set. Please provide the path to Renode\'s VerilatorIntegrationLibrary directory)
endif
ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif

default:
	@echo "-- Verilator - Renode integration - AXI RAM example"
	@echo "-- VERILATE ----------------"
	$(VERILATOR) -cc axi_ram.v -Wno-WIDTH -Wno-CASEINCOMPLETE --exe -CFLAGS "-Wpedantic -Wall -I$(INTEGRATION_DIR)" sim_main.cpp $(INTEGRATION_DIR)/src/renode.cpp $(INTEGRATION_DIR)/src/buses/axi.cpp
	@echo "-- COMPILE -----------------"
	LDLIBS="-lzmq -lpthread" $(MAKE) -j 4 -C obj_dir -f Vaxi_ram.mk
	@echo "The output file is \`obj_dir/Vaxi_ram\`."

clean:
	-rm -rf obj_dir *.log *.dmp *.vpd core
