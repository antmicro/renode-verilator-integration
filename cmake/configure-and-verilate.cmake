cmake_minimum_required(VERSION 3.8)

if(POLICY CMP0074)
  cmake_policy(SET CMP0074 NEW)
endif()

# Set acceptable Renode VerilatorIntegrationLibrary version range
if(NOT REQUIRED_VIL_VERSION)
  # REQUIRED_VIL_VERSION can be adjusted in CMakeLists.txt
  set(REQUIRED_VIL_VERSION 2.0)
endif()
set(MAX_VIL_VERSION 3.0)

# Hide not so usable variables from basic views of ccmake and cmake-gui
mark_as_advanced(CMAKE_INSTALL_PREFIX verilator_DIR VERILATOR_ROOT VERILATOR_BIN PERL)

# Finding Verilator and Renode's 'VerilatorIntegrationLibrary'

set(USER_RENODE_DIR CACHE PATH "Absolute (!) path to Renode root directory or any other that contains VerilatorIntegrationLibrary.")

if(CMAKE_HOST_WIN32)
  macro(_try_repair_path PATH_VAR_NAME)
    set(PATH ${${PATH_VAR_NAME}})
    if(${PATH} MATCHES "^/" AND NOT IS_DIRECTORY ${PATH})
      find_program(CYGPATH_BIN NAMES "cygpath.exe" "cygpath")
      if(CYGPATH_BIN)
        execute_process(COMMAND ${CYGPATH_BIN} -m -a ${PATH} OUTPUT_VARIABLE CYGPATHED_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)
        if(IS_DIRECTORY ${CYGPATHED_PATH})
          set(${PATH_VAR_NAME} "${CYGPATHED_PATH}")
          message("Repaired path: '${PATH}' to '${CYGPATHED_PATH}'.")
        endif()
      endif()
    endif()
  endmacro()

  _try_repair_path(USER_RENODE_DIR)
  _try_repair_path(USER_VERILATOR_DIR)
endif()

if(NOT VIL_DIR)
  if(NOT USER_RENODE_DIR OR NOT IS_ABSOLUTE "${USER_RENODE_DIR}")
    message(FATAL_ERROR "Please set the CMake's USER_RENODE_DIR variable to an absolute (!) path to Renode root directory or any other that contains VerilatorIntegrationLibrary.\nPass the '-DUSER_RENODE_DIR=<ABSOLUTE_PATH>' switch if you configure with the 'cmake' command. Optionally, consider using 'ccmake' or 'cmake-gui' which make it easier.")
  endif()
  
  message("-- Looking for Renode VerilatorIntegrationLibrary inside ${USER_RENODE_DIR}...")
  set(VIL_FILE verilator-integration-library.cmake)
  # Look for the ${VIL_FILE} in the whole ${USER_RENODE_DIR} tree
  #   (don't use `/*/` as then an additional directory is required between the two)
  file(GLOB_RECURSE VIL_FOUND ${USER_RENODE_DIR}*/${VIL_FILE})
  
  list(LENGTH VIL_FOUND VIL_FOUND_N)
  if(${VIL_FOUND_N} EQUAL 1)
    string(REPLACE "/${VIL_FILE}" "" VIL_DIR ${VIL_FOUND})
  elseif(${VIL_FOUND_N} GREATER 1)
    string(REGEX REPLACE "/${VIL_FILE}" " " ALL_FOUND ${VIL_FOUND})
    message(FATAL_ERROR "Found more than one directory with VerilatorIntegrationLibrary inside USER_RENODE_DIR. Please choose one of them: ${ALL_FOUND}")
  endif()
  
  if(NOT VIL_DIR OR NOT EXISTS "${VIL_DIR}/${VIL_FILE}")
    message(FATAL_ERROR "Couldn't find valid VerilatorIntegrationLibrary inside USER_RENODE_DIR!")
  endif()
  
  include(${VIL_DIR}/${VIL_FILE})  # sets VIL_VERSION variable
  message("-- Renode VerilatorIntegrationLibrary (version ${VIL_VERSION}) found in ${VIL_DIR}.")
  
  # Check if VIL_VERSION is acceptable
  if(NOT IGNORE_VIL_VERSION)
    if(VIL_VERSION VERSION_LESS REQUIRED_VIL_VERSION OR VIL_VERSION VERSION_GREATER_EQUAL MAX_VIL_VERSION)
      set(IGNORE_VIL_VERSION CACHE BOOL "Ignore VerilatorIntegrationLibrary version mismatch")
      message(FATAL_ERROR "VerilatorIntegrationLibrary's version (found: ${VIL_VERSION}) should be: >=${REQUIRED_VIL_VERSION} AND <${MAX_VIL_VERSION}!\nThis check can be skipped with '-DIGNORE_VIL_VERSION=ON'.")
    endif()
  endif()

  # Save VIL_DIR in cache
  set(VIL_DIR ${VIL_DIR} CACHE INTERNAL "")
endif()

file(GLOB_RECURSE RENODE_SOURCES ${VIL_DIR}/*.cpp)

find_package(verilator HINTS ${USER_VERILATOR_DIR} $ENV{VERILATOR_ROOT})
if(NOT verilator_FOUND)
  set(USER_VERILATOR_DIR CACHE PATH "Path to the Verilator's root directory.")
  message(FATAL_ERROR "There's no Verilator installed or its version is older than 4.022 (which introduced CMake support).\nEither install it or set the CMake's USER_VERILATOR_DIR variable to the Verilator's root directory.")
endif()

# Default arguments for compilation and linking
list(APPEND PROJECT_COMP_ARGS -Wall)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND ${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
  list(APPEND PROJECT_LINK_ARGS -static-libstdc++ -static-libgcc)
endif()

if(CMAKE_HOST_WIN32)
  list(APPEND PROJECT_LINK_ARGS ws2_32)

  if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
    list(APPEND PROJECT_COMP_ARGS -Wno-unknown-pragmas)
    # Link all MinGW/Cygwin libraries statically
    list(APPEND PROJECT_LINK_ARGS -static)
  endif()
endif()

set(FINAL_COMP_ARGS ${PROJECT_COMP_ARGS} ${COMP_ARGS} CACHE STRING "Extra arguments/switches for compilation.")
set(FINAL_LINK_ARGS ${PROJECT_LINK_ARGS} ${LINK_ARGS} CACHE STRING "Extra arguments/switches for linking.")
set(FINAL_VERI_ARGS ${VERI_ARGS}                      CACHE STRING "Extra arguments/switches for Verilating.")

# The actual executable configuration

if(NOT CSOURCES OR NOT VTOP)
  message(FATAL_ERROR "Both 'CSOURCES' and 'VTOP' variables have to be set!")
endif()

add_executable(Vtop ${CSOURCES} ${RENODE_SOURCES})
target_include_directories(Vtop PRIVATE ${VIL_DIR})

target_compile_options(Vtop PRIVATE ${FINAL_COMP_ARGS})
target_link_libraries(Vtop PRIVATE ${FINAL_LINK_ARGS})

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "AppleClang")
  # Clang defaults to -std=gnu++98 but it has to be at least c++11
  set_property(TARGET Vtop PROPERTY CXX_STANDARD 11)
  set_property(TARGET Vtop PROPERTY CXX_STANDARD_REQUIRED)

  # Verilator for now only supports "clang", "gnu" and "msvc" in
  # "--compiler" and creates it from CMAKE_CXX_COMPILER_ID
  set(CMAKE_CXX_COMPILER_ID Clang)
endif()

separate_arguments(FINAL_VERI_ARGS)
verilate(Vtop SOURCES ${VTOP} VERILATOR_ARGS ${FINAL_VERI_ARGS})
