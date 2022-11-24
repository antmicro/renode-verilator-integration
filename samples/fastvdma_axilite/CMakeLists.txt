cmake_minimum_required(VERSION 3.8)

# Name of the project
project(fastvdma-axilite)

# Verilog file containing the top module to be Verilated
set(VTOP DMATopAXI_AXIL_AXIL.v)

# C/C++ source files to be compiled
set(CSOURCES sim_main.cpp)

# Additional compiling, linking or verilating arguments (respectively)
set(COMP_EXEC_ARGS -DINVERT_RESET)
set(COMP_LIB_ARGS -fPIC -DINVERT_RESET)
#set(LINK_EXEC_ARGS ...)
#set(LINK_LIB_ARGS ...)
#set(VERI_EXEC_ARGS --trace)
#set(VERI_LIB_ARGS --trace)

# CMake file doing the hard job
include(../../cmake/configure-and-verilate.cmake)
