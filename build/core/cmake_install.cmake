# Install script for directory: /home/ce-user/trial2/gvsoc/core

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ce-user/trial2/gvsoc/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/ce-user/trial2/gvsoc/core/bin/" USE_SOURCE_PERMISSIONS)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/ce-user/trial2/gvsoc/build/core/dpi-wrapper/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/ce-user/trial2/gvsoc/build/core/engine/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/ce-user/trial2/gvsoc/build/core/models/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/ce-user/trial2/gvsoc/build/core/pulp/models/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models" TYPE FILE MESSAGE_LAZY RENAME "gen_interco_router_common_cpp_121245830.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_interco_router_common_cpp_121245830_optim.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models/debug" TYPE FILE MESSAGE_LAZY RENAME "gen_interco_router_common_cpp_121245830.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_interco_router_common_cpp_121245830_debug.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models" TYPE FILE MESSAGE_LAZY RENAME "gen_memory_memory_cpp_149327240.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_memory_memory_cpp_149327240_optim.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models/debug" TYPE FILE MESSAGE_LAZY RENAME "gen_memory_memory_cpp_149327240.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_memory_memory_cpp_149327240_debug.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models" TYPE FILE MESSAGE_LAZY RENAME "gen_isa_rv64imafdc_cpp_56505881.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_isa_rv64imafdc_cpp_56505881_optim.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models/debug" TYPE FILE MESSAGE_LAZY RENAME "gen_isa_rv64imafdc_cpp_56505881.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_isa_rv64imafdc_cpp_56505881_debug.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models" TYPE FILE MESSAGE_LAZY RENAME "gen_global_mem_cpp_137737631.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_global_mem_cpp_137737631_optim.so")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/models/debug" TYPE FILE MESSAGE_LAZY RENAME "gen_global_mem_cpp_137737631.so" FILES "/home/ce-user/trial2/gvsoc/build/core/gen_global_mem_cpp_137737631_debug.so")
endif()

