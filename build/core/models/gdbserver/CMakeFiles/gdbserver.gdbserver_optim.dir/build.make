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
include core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/compiler_depend.make

# Include the progress variables for this target.
include core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/progress.make

# Include the compile flags for this target's objects.
include core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/flags.make

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/flags.make
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o: ../core/models/gdbserver/gdbserver.cpp
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o -MF CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o.d -o CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/gdbserver/gdbserver.cpp

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/gdbserver/gdbserver.cpp > CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.i

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/gdbserver/gdbserver.cpp -o CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.s

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/flags.make
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o: ../core/models/gdbserver/rsp.cpp
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o -MF CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o.d -o CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/gdbserver/rsp.cpp

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/gdbserver/rsp.cpp > CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.i

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/gdbserver/rsp.cpp -o CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.s

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/flags.make
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o: ../core/models/gdbserver/rsp-packet-codec.cpp
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o -MF CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o.d -o CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/gdbserver/rsp-packet-codec.cpp

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/gdbserver/rsp-packet-codec.cpp > CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.i

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/gdbserver/rsp-packet-codec.cpp -o CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.s

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/flags.make
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o: ../core/models/gdbserver/circular-buffer.cpp
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o -MF CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o.d -o CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/gdbserver/circular-buffer.cpp

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/gdbserver/circular-buffer.cpp > CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.i

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/gdbserver/circular-buffer.cpp -o CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.s

# Object files for target gdbserver.gdbserver_optim
gdbserver_gdbserver_optim_OBJECTS = \
"CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o" \
"CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o" \
"CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o" \
"CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o"

# External object files for target gdbserver.gdbserver_optim
gdbserver_gdbserver_optim_EXTERNAL_OBJECTS =

core/models/gdbserver/gdbserver.gdbserver_optim.so: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/gdbserver.cpp.o
core/models/gdbserver/gdbserver.gdbserver_optim.so: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp.cpp.o
core/models/gdbserver/gdbserver.gdbserver_optim.so: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/rsp-packet-codec.cpp.o
core/models/gdbserver/gdbserver.gdbserver_optim.so: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/circular-buffer.cpp.o
core/models/gdbserver/gdbserver.gdbserver_optim.so: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/build.make
core/models/gdbserver/gdbserver.gdbserver_optim.so: core/engine/libpulpvp.so
core/models/gdbserver/gdbserver.gdbserver_optim.so: core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared module gdbserver.gdbserver_optim.so"
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gdbserver.gdbserver_optim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/build: core/models/gdbserver/gdbserver.gdbserver_optim.so
.PHONY : core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/build

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/clean:
	cd /home/ce-user/trial2/gvsoc/build/core/models/gdbserver && $(CMAKE_COMMAND) -P CMakeFiles/gdbserver.gdbserver_optim.dir/cmake_clean.cmake
.PHONY : core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/clean

core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/depend:
	cd /home/ce-user/trial2/gvsoc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ce-user/trial2/gvsoc /home/ce-user/trial2/gvsoc/core/models/gdbserver /home/ce-user/trial2/gvsoc/build /home/ce-user/trial2/gvsoc/build/core/models/gdbserver /home/ce-user/trial2/gvsoc/build/core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : core/models/gdbserver/CMakeFiles/gdbserver.gdbserver_optim.dir/depend

