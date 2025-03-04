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
include core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/compiler_depend.make

# Include the progress variables for this target.
include core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/progress.make

# Include the compile flags for this target's objects.
include core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/flags.make

core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o: core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/flags.make
core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o: ../core/models/utils/loader/loader.cpp
core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o: core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/utils/loader && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o -MF CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o.d -o CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/utils/loader/loader.cpp

core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/utils/loader && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/utils/loader/loader.cpp > CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.i

core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/utils/loader && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/utils/loader/loader.cpp -o CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.s

# Object files for target utils.loader.loader_debug
utils_loader_loader_debug_OBJECTS = \
"CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o"

# External object files for target utils.loader.loader_debug
utils_loader_loader_debug_EXTERNAL_OBJECTS =

core/models/utils/loader/utils.loader.loader_debug.so: core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/loader.cpp.o
core/models/utils/loader/utils.loader.loader_debug.so: core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/build.make
core/models/utils/loader/utils.loader.loader_debug.so: core/engine/libpulpvp-debug.so
core/models/utils/loader/utils.loader.loader_debug.so: core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module utils.loader.loader_debug.so"
	cd /home/ce-user/trial2/gvsoc/build/core/models/utils/loader && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/utils.loader.loader_debug.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/build: core/models/utils/loader/utils.loader.loader_debug.so
.PHONY : core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/build

core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/clean:
	cd /home/ce-user/trial2/gvsoc/build/core/models/utils/loader && $(CMAKE_COMMAND) -P CMakeFiles/utils.loader.loader_debug.dir/cmake_clean.cmake
.PHONY : core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/clean

core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/depend:
	cd /home/ce-user/trial2/gvsoc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ce-user/trial2/gvsoc /home/ce-user/trial2/gvsoc/core/models/utils/loader /home/ce-user/trial2/gvsoc/build /home/ce-user/trial2/gvsoc/build/core/models/utils/loader /home/ce-user/trial2/gvsoc/build/core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : core/models/utils/loader/CMakeFiles/utils.loader.loader_debug.dir/depend

