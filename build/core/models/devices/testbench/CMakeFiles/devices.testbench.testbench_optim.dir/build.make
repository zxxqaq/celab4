# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ce-user/trial2/gvsoc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ce-user/trial2/gvsoc/build

# Include any dependencies generated for this target.
include core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/compiler_depend.make

# Include the progress variables for this target.
include core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/progress.make

# Include the compile flags for this target's objects.
include core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/flags.make

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/flags.make
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o: ../core/models/devices/testbench/i2s_verif.cpp
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o -MF CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o.d -o CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/devices/testbench/i2s_verif.cpp

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/devices/testbench/i2s_verif.cpp > CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.i

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/devices/testbench/i2s_verif.cpp -o CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.s

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/flags.make
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o: ../core/models/devices/testbench/spim_verif.cpp
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o -MF CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o.d -o CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/devices/testbench/spim_verif.cpp

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/devices/testbench/spim_verif.cpp > CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.i

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/devices/testbench/spim_verif.cpp -o CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.s

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/flags.make
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o: ../core/models/devices/testbench/testbench.cpp
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o -MF CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o.d -o CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/devices/testbench/testbench.cpp

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/devices/testbench/testbench.cpp > CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.i

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/devices/testbench/testbench.cpp -o CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.s

# Object files for target devices.testbench.testbench_optim
devices_testbench_testbench_optim_OBJECTS = \
"CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o" \
"CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o" \
"CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o"

# External object files for target devices.testbench.testbench_optim
devices_testbench_testbench_optim_EXTERNAL_OBJECTS =

core/models/devices/testbench/devices.testbench.testbench_optim.so: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/i2s_verif.cpp.o
core/models/devices/testbench/devices.testbench.testbench_optim.so: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/spim_verif.cpp.o
core/models/devices/testbench/devices.testbench.testbench_optim.so: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/testbench.cpp.o
core/models/devices/testbench/devices.testbench.testbench_optim.so: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/build.make
core/models/devices/testbench/devices.testbench.testbench_optim.so: core/models/devices/sound/utils/pcm_pdm_conversion/pcm_pdm_conversion_optim.a
core/models/devices/testbench/devices.testbench.testbench_optim.so: core/engine/libpulpvp.so
core/models/devices/testbench/devices.testbench.testbench_optim.so: core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared module devices.testbench.testbench_optim.so"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/devices.testbench.testbench_optim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/build: core/models/devices/testbench/devices.testbench.testbench_optim.so
.PHONY : core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/build

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/clean:
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench && $(CMAKE_COMMAND) -P CMakeFiles/devices.testbench.testbench_optim.dir/cmake_clean.cmake
.PHONY : core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/clean

core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/depend:
	cd /home/ce-user/trial2/gvsoc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ce-user/trial2/gvsoc /home/ce-user/trial2/gvsoc/core/models/devices/testbench /home/ce-user/trial2/gvsoc/build /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench /home/ce-user/trial2/gvsoc/build/core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : core/models/devices/testbench/CMakeFiles/devices.testbench.testbench_optim.dir/depend

