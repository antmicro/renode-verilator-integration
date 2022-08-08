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

if(NOT USER_RENODE_DIR AND DEFINED ENV{RENODE_ROOT})
  message(STATUS "Using RENODE_ROOT from environment as USER_RENODE_DIR")
  set(USER_RENODE_DIR $ENV{RENODE_ROOT} CACHE PATH "Absolute (!) path to Renode root directory or any other that contains VerilatorIntegrationLibrary.")
else()
  set(USER_RENODE_DIR CACHE PATH "Absolute (!) path to Renode root directory or any other that contains VerilatorIntegrationLibrary.")
endif()

if(CMAKE_HOST_WIN32)
  macro(_try_repair_path PATH_VAR_NAME IS_ENV)
    if(${IS_ENV})
      set(PATH $ENV{${PATH_VAR_NAME}})
    else()
      set(PATH ${${PATH_VAR_NAME}})
    endif()
    if(${PATH} MATCHES "^/" AND NOT IS_DIRECTORY ${PATH})
      find_program(CYGPATH_BIN NAMES "cygpath.exe" "cygpath")
      if(CYGPATH_BIN)
        execute_process(COMMAND ${CYGPATH_BIN} -m -a ${PATH} OUTPUT_VARIABLE CYGPATHED_PATH OUTPUT_STRIP_TRAILING_WHITESPACE)
        if(IS_DIRECTORY ${CYGPATHED_PATH})
          if(${IS_ENV})
            set(ENV{${PATH_VAR_NAME}} "${CYGPATHED_PATH}")
          else()
            set(${PATH_VAR_NAME} "${CYGPATHED_PATH}")
          endif()
          message(STATUS "Repaired ${PATH_VAR_NAME}: '${CYGPATHED_PATH}'")
        endif()
      endif()
    endif()
  endmacro()

  _try_repair_path(USER_RENODE_DIR FALSE)
  _try_repair_path(USER_VERILATOR_DIR FALSE)
  _try_repair_path(VERILATOR_ROOT TRUE)
endif()

if(NOT VIL_DIR)
  if(NOT USER_RENODE_DIR OR NOT IS_ABSOLUTE "${USER_RENODE_DIR}")
    message(FATAL_ERROR "Please set the CMake's USER_RENODE_DIR variable to an absolute (!) path to Renode root directory or any other that contains VerilatorIntegrationLibrary.\nPass the '-DUSER_RENODE_DIR=<ABSOLUTE_PATH>' switch if you configure with the 'cmake' command. Optionally, consider using 'ccmake' or 'cmake-gui' which make it easier.")
  endif()
  
  message(STATUS "Looking for Renode VerilatorIntegrationLibrary inside ${USER_RENODE_DIR}...")
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
  message(STATUS "Renode VerilatorIntegrationLibrary (version ${VIL_VERSION}) found in ${VIL_DIR}.")
  
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


if(NOT ${CMAKE_PROJECT_NAME} MATCHES "cfu_")
  file(GLOB_RECURSE RENODE_SOURCES ${VIL_DIR}/*.cpp)
  list(REMOVE_ITEM RENODE_SOURCES ${VIL_DIR}/src/buses/cfu.cpp)
  list(REMOVE_ITEM RENODE_SOURCES ${VIL_DIR}/src/renode_cfu.cpp)
else()
  file(GLOB_RECURSE RENODE_SOURCES ${VIL_DIR}/cfu.cpp ${VIL_DIR}/renode_cfu.cpp)
endif()

if(IS_DIRECTORY "${USER_VERILATOR_DIR}" AND DEFINED ENV{VERILATOR_ROOT})
  # Verilator CMake logic prioritizes VERILATOR_ROOT environment variable
  message(STATUS "Using USER_VERILATOR_DIR over VERILATOR_ROOT env. var.")
  set(ENV{VERILATOR_ROOT} ${USER_VERILATOR_DIR})
endif()
find_package(verilator HINTS ${USER_VERILATOR_DIR} $ENV{VERILATOR_ROOT})
if(NOT verilator_FOUND)
  set(USER_VERILATOR_DIR CACHE PATH "Path to the Verilator's root directory.")
  message(FATAL_ERROR "There's no Verilator installed or its version is older than 4.022 (which introduced CMake support).\nEither install it or set the CMake's USER_VERILATOR_DIR variable to the Verilator's root directory.")
endif()

# Default arguments for compilation and linking
list(APPEND PROJECT_COMP_ARGS -Wall)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
  set(LIBOPENLIBM CACHE PATH "Absolute (!) path to the OpenLibm library (<RENODE_VERILATOR_INTEGRATION_PATH>/lib/libopenlibm-Linux-<TARGET_ARCH>.a). Use it for enhanced portability.")
  # Link OpenLibm if LIBOPENLIBM is correctly set
  if(LIBOPENLIBM)
    if(EXISTS ${LIBOPENLIBM} AND IS_ABSOLUTE ${LIBOPENLIBM})
      # `-Wl,--as-needed` in case it isn't passed to the linker by default
      #   (e.g. Debian's g++ v8.3.0-6)
      list(APPEND PROJECT_LINK_ARGS ${LIBOPENLIBM} -Wl,--as-needed)
    else()
      message(FATAL_ERROR "LIBOPENLIBM ('${LIBOPENLIBM}') has to be an absolute path!")
    endif()
  else()
    message(WARNING "It is highly advised to use OpenLibm for portability reasons. To do so, run CMake with '-DLIBOPENLIBM=<REPOSITORY_ABSOLUTE_PATH>/lib/libopenlibm-Linux-<TARGET_ARCH>.a' or set LIBOPENLIBM variable through 'ccmake'/'cmake-gui'.")
  endif()
  if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
    list(APPEND PROJECT_LINK_ARGS -static-libstdc++ -static-libgcc)
  endif()
endif()

if(CMAKE_HOST_WIN32)
  list(APPEND PROJECT_LINK_ARGS ws2_32)

  if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
    list(APPEND PROJECT_COMP_ARGS -Wno-unknown-pragmas)
    # Link all MinGW/Cygwin libraries statically
    list(APPEND PROJECT_LINK_ARGS -static)
  endif()
endif()

set(FINAL_EXEC_COMP_ARGS ${PROJECT_COMP_ARGS} ${COMP_EXEC_ARGS} CACHE STRING "Extra arguments/switches for compilation.")
set(FINAL_LIB_COMP_ARGS ${PROJECT_COMP_ARGS} ${COMP_LIB_ARGS} CACHE STRING "Extra arguments/switches for compilation.")
set(FINAL_EXEC_LINK_ARGS ${PROJECT_LINK_ARGS} ${LINK_EXEC_ARGS} CACHE STRING "Extra arguments/switches for linking.")
set(FINAL_LIB_LINK_ARGS ${PROJECT_LINK_ARGS} ${LINK_LIB_ARGS} CACHE STRING "Extra arguments/switches for linking.")
set(FINAL_EXEC_VERI_ARGS ${VERI_EXEC_ARGS}                      CACHE STRING "Extra arguments/switches for Verilating.")
set(FINAL_LIB_VERI_ARGS ${VERI_LIB_ARGS}                      CACHE STRING "Extra arguments/switches for Verilating.")

# The actual executable configuration

if(NOT CSOURCES OR NOT VTOP)
  message(FATAL_ERROR "Both 'CSOURCES' and 'VTOP' variables have to be set!")
endif()

add_executable(Vtop ${CSOURCES} ${RENODE_SOURCES})
add_library(libVtop SHARED ${CSOURCES} ${RENODE_SOURCES})
target_include_directories(Vtop PRIVATE ${VIL_DIR})
target_include_directories(libVtop PRIVATE ${VIL_DIR})

target_compile_options(Vtop PRIVATE ${FINAL_EXEC_COMP_ARGS})
target_compile_options(libVtop PRIVATE ${FINAL_LIB_COMP_ARGS})
target_link_libraries(Vtop PRIVATE ${FINAL_EXEC_LINK_ARGS})
target_link_libraries(libVtop PRIVATE ${FINAL_LIB_LINK_ARGS})

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "AppleClang")
  # Clang defaults to -std=gnu++98 but it has to be at least c++11
  set_property(TARGET Vtop PROPERTY CXX_STANDARD 11)
  set_property(TARGET libVtop PROPERTY CXX_STANDARD 11)
  set_property(TARGET Vtop PROPERTY CXX_STANDARD_REQUIRED)
  set_property(TARGET libVtop PROPERTY CXX_STANDARD_REQUIRED)

  # Verilator for now only supports "clang", "gnu" and "msvc" in
  # "--compiler" and creates it from CMAKE_CXX_COMPILER_ID
  set(CMAKE_CXX_COMPILER_ID Clang)
endif()
set_target_properties(libVtop PROPERTIES OUTPUT_NAME Vtop)

separate_arguments(FINAL_EXEC_VERI_ARGS)
separate_arguments(FINAL_LIB_VERI_ARGS)
verilate(Vtop SOURCES ${VTOP} TOP_MODULE ${TOP_MODULE} VERILATOR_ARGS ${FINAL_EXEC_VERI_ARGS})
verilate(libVtop SOURCES ${VTOP} TOP_MODULE ${TOP_MODULE} VERILATOR_ARGS ${FINAL_LIB_VERI_ARGS})
