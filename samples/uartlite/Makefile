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
	@echo "-- Verilator - Renode integration - UARTLite example"
	@echo "-- VERILATE ----------------"
	$(VERILATOR) -cc top.v --exe -CFLAGS "-Wpedantic -Wall -I$(INTEGRATION_DIR)" sim_main.cpp $(INTEGRATION_DIR)/src/renode.cpp $(INTEGRATION_DIR)/src/buses/axilite.cpp $(INTEGRATION_DIR)/src/peripherals/uart.cpp
	@echo "-- COMPILE -----------------"
	LDLIBS="-lzmq -lpthread" $(MAKE) -j 4 -C obj_dir -f Vtop.mk
	@echo "The output file is \`obj_dir/Vtop\`."

clean:
	-rm -rf obj_dir *.log *.dmp *.vpd core
