cmake_minimum_required(VERSION 3.8)

# Name of the project
project(ibex)

set(PREFIX ibex_top)
set(TOP_MODULE ibex_top)

# fusesoc command is executed outside of cmake script due to `execute_process` being not compatible with MSYS2 environment
execute_process(COMMAND fusesoc --cores-root=${CMAKE_CURRENT_SOURCE_DIR}/ibex run --target=default --tool verilator --setup lowrisc:ibex:${TOP_MODULE})

set(DIR_NAME lowrisc_ibex_${TOP_MODULE}_0.1)

# Read verilator args file
file(READ "${CMAKE_BINARY_DIR}/build/${DIR_NAME}/default-verilator/${DIR_NAME}.vc" contents)
string(REPLACE "\n" ";" contents "${contents}")

foreach(line IN LISTS contents)
    if(line MATCHES ".sv$") # Verilog file
        string(REPLACE ".." "${CMAKE_BINARY_DIR}/build/${DIR_NAME}" line ${line})
        list(APPEND VTOP ${line})
    endif()

    if(line MATCHES "^[-+][a-zA-Z]") # Verilog argument
        string(REPLACE ".." "${CMAKE_BINARY_DIR}/build/${DIR_NAME}" line ${line})
        list(APPEND VERI_ARGS  ${line})
    endif()
endforeach()

# C/C++ source files to be compiled
set(CSOURCES sim_main.cpp sim_ibex.cpp)

# Additional compiling, linking or verilating arguments (respectively)
set(COMP_EXEC_ARGS -Wno-sign-compare)
set(COMP_LIB_ARGS -Wno-sign-compare -fPIC)
#set(LINK_EXEC_ARGS ...)
#set(LINK_LIB_ARGS ...)
set(VERI_EXEC_ARGS ${VERI_ARGS})
set(VERI_LIB_ARGS ${VERI_ARGS})

# CMake file doing the hard job
include(../../cmake/configure-and-verilate.cmake)