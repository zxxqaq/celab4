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
include core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/compiler_depend.make

# Include the progress variables for this target.
include core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/progress.make

# Include the compile flags for this target's objects.
include core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/flags.make

core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o: core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/flags.make
core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o: ../core/models/devices/sound/microphone/i2s/i2s_microphone.cpp
core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o: core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o -MF CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o.d -o CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o -c /home/ce-user/trial2/gvsoc/core/models/devices/sound/microphone/i2s/i2s_microphone.cpp

core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.i"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ce-user/trial2/gvsoc/core/models/devices/sound/microphone/i2s/i2s_microphone.cpp > CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.i

core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.s"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ce-user/trial2/gvsoc/core/models/devices/sound/microphone/i2s/i2s_microphone.cpp -o CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.s

# Object files for target devices.sound.microphone.i2s.i2s_microphone_debug
devices_sound_microphone_i2s_i2s_microphone_debug_OBJECTS = \
"CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o"

# External object files for target devices.sound.microphone.i2s.i2s_microphone_debug
devices_sound_microphone_i2s_i2s_microphone_debug_EXTERNAL_OBJECTS =

core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so: core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/i2s_microphone.cpp.o
core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so: core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/build.make
core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so: core/models/devices/sound/utils/io_audio_file/io_audio_debug.a
core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so: core/engine/libpulpvp-debug.so
core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so: /usr/lib/x86_64-linux-gnu/libsndfile.so
core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so: core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ce-user/trial2/gvsoc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module devices.sound.microphone.i2s.i2s_microphone_debug.so"
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/build: core/models/devices/sound/microphone/i2s/devices.sound.microphone.i2s.i2s_microphone_debug.so
.PHONY : core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/build

core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/clean:
	cd /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s && $(CMAKE_COMMAND) -P CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/cmake_clean.cmake
.PHONY : core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/clean

core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/depend:
	cd /home/ce-user/trial2/gvsoc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ce-user/trial2/gvsoc /home/ce-user/trial2/gvsoc/core/models/devices/sound/microphone/i2s /home/ce-user/trial2/gvsoc/build /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s /home/ce-user/trial2/gvsoc/build/core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : core/models/devices/sound/microphone/i2s/CMakeFiles/devices.sound.microphone.i2s.i2s_microphone_debug.dir/depend

