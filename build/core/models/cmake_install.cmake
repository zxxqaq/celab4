# Install script for directory: /home/ce-user/trial2/gvsoc/core/models

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ce-user/trial2/gvsoc/install/generators/.")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ce-user/trial2/gvsoc/install/generators" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/ce-user/trial2/gvsoc/core/models/." FILES_MATCHING REGEX "/[^/]*\\.py$" REGEX "/[^/]*\\.json$" REGEX "/\\_\\_pycache\\_\\_$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/gv" TYPE FILE MESSAGE_LAZY FILES "/home/ce-user/trial2/gvsoc/core/models/gvsoc/gvsoc_control.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/gvsoc" TYPE FILE MESSAGE_LAZY FILES "/home/ce-user/trial2/gvsoc/core/models/gvsoc/gvsoc_control.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/gvsoc" TYPE FILE MESSAGE_LAZY FILES "/home/ce-user/trial2/gvsoc/core/models/gvsoc/json_tools.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python" TYPE DIRECTORY MESSAGE_LAZY FILES "/home/ce-user/trial2/gvsoc/core/models/regmap")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ce-user/trial2/gvsoc/build/core/models/board/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/cache/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/cpu/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/devices/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/gdbserver/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/interco/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/memory/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/utils/cmake_install.cmake")
  include("/home/ce-user/trial2/gvsoc/build/core/models/vp/cmake_install.cmake")

endif()

