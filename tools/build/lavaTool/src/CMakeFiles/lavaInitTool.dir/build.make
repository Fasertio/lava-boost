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
include lavaTool/src/CMakeFiles/lavaInitTool.dir/depend.make

# Include the progress variables for this target.
include lavaTool/src/CMakeFiles/lavaInitTool.dir/progress.make

# Include the compile flags for this target's objects.
include lavaTool/src/CMakeFiles/lavaInitTool.dir/flags.make

lavaTool/src/CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.o: lavaTool/src/CMakeFiles/lavaInitTool.dir/flags.make
lavaTool/src/CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.o: ../lavaTool/src/lavaInitTool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lavaTool/src/CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.o"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.o -c /home/user/Scrivania/lava/tools/lavaTool/src/lavaInitTool.cpp

lavaTool/src/CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.i"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/Scrivania/lava/tools/lavaTool/src/lavaInitTool.cpp > CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.i

lavaTool/src/CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.s"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/Scrivania/lava/tools/lavaTool/src/lavaInitTool.cpp -o CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.s

# Object files for target lavaInitTool
lavaInitTool_OBJECTS = \
"CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.o"

# External object files for target lavaInitTool
lavaInitTool_EXTERNAL_OBJECTS =

lavaTool/src/lavaInitTool: lavaTool/src/CMakeFiles/lavaInitTool.dir/lavaInitTool.cpp.o
lavaTool/src/lavaInitTool: lavaTool/src/CMakeFiles/lavaInitTool.dir/build.make
lavaTool/src/lavaInitTool: lavaTool/src/CMakeFiles/lavaInitTool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lavaInitTool"
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lavaInitTool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lavaTool/src/CMakeFiles/lavaInitTool.dir/build: lavaTool/src/lavaInitTool

.PHONY : lavaTool/src/CMakeFiles/lavaInitTool.dir/build

lavaTool/src/CMakeFiles/lavaInitTool.dir/clean:
	cd /home/user/Scrivania/lava/tools/build/lavaTool/src && $(CMAKE_COMMAND) -P CMakeFiles/lavaInitTool.dir/cmake_clean.cmake
.PHONY : lavaTool/src/CMakeFiles/lavaInitTool.dir/clean

lavaTool/src/CMakeFiles/lavaInitTool.dir/depend:
	cd /home/user/Scrivania/lava/tools/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/Scrivania/lava/tools /home/user/Scrivania/lava/tools/lavaTool/src /home/user/Scrivania/lava/tools/build /home/user/Scrivania/lava/tools/build/lavaTool/src /home/user/Scrivania/lava/tools/build/lavaTool/src/CMakeFiles/lavaInitTool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lavaTool/src/CMakeFiles/lavaInitTool.dir/depend

