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
CMAKE_SOURCE_DIR = /home/spikeyamk/urazr_makefile

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/spikeyamk/urazr_makefile/build

# Include any dependencies generated for this target.
include CMakeFiles/urazr.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/urazr.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/urazr.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/urazr.dir/flags.make

CMakeFiles/urazr.dir/main.c.o: CMakeFiles/urazr.dir/flags.make
CMakeFiles/urazr.dir/main.c.o: ../main.c
CMakeFiles/urazr.dir/main.c.o: CMakeFiles/urazr.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spikeyamk/urazr_makefile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/urazr.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/urazr.dir/main.c.o -MF CMakeFiles/urazr.dir/main.c.o.d -o CMakeFiles/urazr.dir/main.c.o -c /home/spikeyamk/urazr_makefile/main.c

CMakeFiles/urazr.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/urazr.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/spikeyamk/urazr_makefile/main.c > CMakeFiles/urazr.dir/main.c.i

CMakeFiles/urazr.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/urazr.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/spikeyamk/urazr_makefile/main.c -o CMakeFiles/urazr.dir/main.c.s

CMakeFiles/urazr.dir/lib/urazr.c.o: CMakeFiles/urazr.dir/flags.make
CMakeFiles/urazr.dir/lib/urazr.c.o: ../lib/urazr.c
CMakeFiles/urazr.dir/lib/urazr.c.o: CMakeFiles/urazr.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spikeyamk/urazr_makefile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/urazr.dir/lib/urazr.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/urazr.dir/lib/urazr.c.o -MF CMakeFiles/urazr.dir/lib/urazr.c.o.d -o CMakeFiles/urazr.dir/lib/urazr.c.o -c /home/spikeyamk/urazr_makefile/lib/urazr.c

CMakeFiles/urazr.dir/lib/urazr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/urazr.dir/lib/urazr.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/spikeyamk/urazr_makefile/lib/urazr.c > CMakeFiles/urazr.dir/lib/urazr.c.i

CMakeFiles/urazr.dir/lib/urazr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/urazr.dir/lib/urazr.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/spikeyamk/urazr_makefile/lib/urazr.c -o CMakeFiles/urazr.dir/lib/urazr.c.s

# Object files for target urazr
urazr_OBJECTS = \
"CMakeFiles/urazr.dir/main.c.o" \
"CMakeFiles/urazr.dir/lib/urazr.c.o"

# External object files for target urazr
urazr_EXTERNAL_OBJECTS =

urazr: CMakeFiles/urazr.dir/main.c.o
urazr: CMakeFiles/urazr.dir/lib/urazr.c.o
urazr: CMakeFiles/urazr.dir/build.make
urazr: CMakeFiles/urazr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/spikeyamk/urazr_makefile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable urazr"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/urazr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/urazr.dir/build: urazr
.PHONY : CMakeFiles/urazr.dir/build

CMakeFiles/urazr.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/urazr.dir/cmake_clean.cmake
.PHONY : CMakeFiles/urazr.dir/clean

CMakeFiles/urazr.dir/depend:
	cd /home/spikeyamk/urazr_makefile/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/spikeyamk/urazr_makefile /home/spikeyamk/urazr_makefile /home/spikeyamk/urazr_makefile/build /home/spikeyamk/urazr_makefile/build /home/spikeyamk/urazr_makefile/build/CMakeFiles/urazr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/urazr.dir/depend
