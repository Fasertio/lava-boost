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
include fbi/src/CMakeFiles/fbilib.dir/depend.make

# Include the progress variables for this target.
include fbi/src/CMakeFiles/fbilib.dir/progress.make

# Include the compile flags for this target's objects.
include fbi/src/CMakeFiles/fbilib.dir/flags.make

fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.o: fbi/src/CMakeFiles/fbilib.dir/flags.make
fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.o: /home/user/Scrivania/lava/panda/panda/panda/src/plog.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.o"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.o   -c /home/user/Scrivania/lava/panda/panda/panda/src/plog.c

fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.i"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/user/Scrivania/lava/panda/panda/panda/src/plog.c > CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.i

fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.s"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/user/Scrivania/lava/panda/panda/panda/src/plog.c -o CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.s

fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.o: fbi/src/CMakeFiles/fbilib.dir/flags.make
fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.o: /home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.o"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.o -c /home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp

fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.i"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp > CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.i

fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.s"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp -o CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.s

# Object files for target fbilib
fbilib_OBJECTS = \
"CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.o" \
"CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.o"

# External object files for target fbilib
fbilib_EXTERNAL_OBJECTS =

fbi/src/libfbilib.a: fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog.c.o
fbi/src/libfbilib.a: fbi/src/CMakeFiles/fbilib.dir/home/user/Scrivania/lava/panda/panda/panda/src/plog-cc.cpp.o
fbi/src/libfbilib.a: fbi/src/CMakeFiles/fbilib.dir/build.make
fbi/src/libfbilib.a: fbi/src/CMakeFiles/fbilib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/Scrivania/lava/tools/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libfbilib.a"
	cd /home/user/Scrivania/lava/tools/build/fbi/src && $(CMAKE_COMMAND) -P CMakeFiles/fbilib.dir/cmake_clean_target.cmake
	cd /home/user/Scrivania/lava/tools/build/fbi/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fbilib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
fbi/src/CMakeFiles/fbilib.dir/build: fbi/src/libfbilib.a

.PHONY : fbi/src/CMakeFiles/fbilib.dir/build

fbi/src/CMakeFiles/fbilib.dir/clean:
	cd /home/user/Scrivania/lava/tools/build/fbi/src && $(CMAKE_COMMAND) -P CMakeFiles/fbilib.dir/cmake_clean.cmake
.PHONY : fbi/src/CMakeFiles/fbilib.dir/clean

fbi/src/CMakeFiles/fbilib.dir/depend:
	cd /home/user/Scrivania/lava/tools/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/Scrivania/lava/tools /home/user/Scrivania/lava/tools/fbi/src /home/user/Scrivania/lava/tools/build /home/user/Scrivania/lava/tools/build/fbi/src /home/user/Scrivania/lava/tools/build/fbi/src/CMakeFiles/fbilib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : fbi/src/CMakeFiles/fbilib.dir/depend
