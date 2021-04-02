cmake_minimum_required(VERSION 3.8)

# Name of the project
project(axi_ram)

# Verilog file containing the top module to be Verilated
set(VTOP axi_ram.v)

# C/C++ source files to be compiled
set(CSOURCES sim_main.cpp)

# Additional compiling, linking or verilating arguments (respectively)
#set(COMP_ARGS ...)
#set(LINK_ARGS ...)
set(VERI_ARGS -Wno-WIDTH -Wno-CASEINCOMPLETE)

# CMake file doing the hard job
include(../../cmake/configure-and-verilate.cmake)
