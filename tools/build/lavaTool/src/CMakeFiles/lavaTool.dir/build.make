# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/user/Scrivania/lava/tools

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/user/Scrivania/lava/tools/build

# Include any dependencies generated for this target.
include lavaTool/src/CMakeFiles/lavaTool.dir/depend.make

# Include the progress variables for this target.
include lavaTool/src/CMakeFiles/lavaTool.dir/progress.make

# Include the compile flags for this target's objects.
include lavaTool/src/CMakeFiles/lavaTool.dir/flags.make

lavaTool/src/CMakeFiles/lavaTool.dir/lavaTool.cpp.o: lavaTool/src/CMakeFiles/lavaTool.dir/flags.make
lavaTool/src/CMakeFiles/lavaTool.dir/lavaTool.cpp.o: ../lavaTool/src/lavaTool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lavaTool/src/CMakeFiles/lavaTool.dir/lavaTool.cpp.o"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lavaTool.dir/lavaTool.cpp.o -c /home/user/Scrivania/lava/tools/lavaTool/src/lavaTool.cpp

lavaTool/src/CMakeFiles/lavaTool.dir/lavaTool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lavaTool.dir/lavaTool.cpp.i"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/Scrivania/lava/tools/lavaTool/src/lavaTool.cpp > CMakeFiles/lavaTool.dir/lavaTool.cpp.i

lavaTool/src/CMakeFiles/lavaTool.dir/lavaTool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lavaTool.dir/lavaTool.cpp.s"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/Scrivania/lava/tools/lavaTool/src/lavaTool.cpp -o CMakeFiles/lavaTool.dir/lavaTool.cpp.s

# Object files for target lavaTool
lavaTool_OBJECTS = \
"CMakeFiles/lavaTool.dir/lavaTool.cpp.o"

# External object files for target lavaTool
lavaTool_EXTERNAL_OBJECTS =

lavaTool/src/lavaTool: lavaTool/src/CMakeFiles/lavaTool.dir/lavaTool.cpp.o
lavaTool/src/lavaTool: lavaTool/src/CMakeFiles/lavaTool.dir/build.make
lavaTool/src/lavaTool: lavaDB/src/liblavaDB_x32.a
lavaTool/src/lavaTool: lavaTool/src/libomg.a
lavaTool/src/lavaTool: lavaODB/src/liblava-odb_x32.a
lavaTool/src/lavaTool: lavaTool/src/CMakeFiles/lavaTool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lavaTool"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lavaTool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lavaTool/src/CMakeFiles/lavaTool.dir/build: lavaTool/src/lavaTool

.PHONY : lavaTool/src/CMakeFiles/lavaTool.dir/build

lavaTool/src/CMakeFiles/lavaTool.dir/clean:
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && $(CMAKE_COMMAND) -P CMakeFiles/lavaTool.dir/cmake_clean.cmake
.PHONY : lavaTool/src/CMakeFiles/lavaTool.dir/clean

lavaTool/src/CMakeFiles/lavaTool.dir/depend:
	cd /home/user/Scrivania/lava/tools/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/Scrivania/lava/tools /home/user/Scrivania/lava/tools/lavaTool/src /home/user/Scrivania/lava/tools/build /home/user/Scrivania/lava/tools/build/lavaTool/src /home/user/Scrivania/lava/tools/build/lavaTool/src/CMakeFiles/lavaTool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lavaTool/src/CMakeFiles/lavaTool.dir/depend

