cmake_minimum_required(VERSION 3.8)

# Name of the project
project(cfu_basic)

# Verilog file containing the top module to be Verilated
set(VTOP cfu.v)

# C/C++ source files to be compiled
set(CSOURCES sim_main.cpp)

# Additional compiling, linking or verilating arguments (respectively)
#set(COMP_EXEC_ARGS ...)
# set(COMP_LIB_ARGS ...)
#set(LINK_EXEC_ARGS ...)
#set(LINK_LIB_ARGS ...)
set(VERI_EXEC_ARGS -Wno-WIDTH)
set(VERI_LIB_ARGS -Wno-WIDTH)

# CMake file doing the hard job
include(../../cmake/configure-and-verilate.cmake)
