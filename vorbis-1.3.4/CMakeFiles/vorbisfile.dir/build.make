# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = "C:/Program Files (x86)/cmake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files (x86)/cmake/bin/cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/StudioProjects/GamePlay-deps

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/StudioProjects/GamePlay-deps

# Include any dependencies generated for this target.
include vorbis-1.3.4/CMakeFiles/vorbisfile.dir/depend.make

# Include the progress variables for this target.
include vorbis-1.3.4/CMakeFiles/vorbisfile.dir/progress.make

# Include the compile flags for this target's objects.
include vorbis-1.3.4/CMakeFiles/vorbisfile.dir/flags.make

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/flags.make
vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o: vorbis-1.3.4/lib/vorbisfile.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:/StudioProjects/GamePlay-deps/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o"
	cd C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 && C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/llvm/prebuilt/windows-x86_64/bin/clang.exe --target=armv7-none-linux-androideabi --gcc-toolchain=C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64 --sysroot=C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o   -c C:/StudioProjects/GamePlay-deps/vorbis-1.3.4/lib/vorbisfile.c

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.i"
	cd C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 && C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/llvm/prebuilt/windows-x86_64/bin/clang.exe --target=armv7-none-linux-androideabi --gcc-toolchain=C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64 --sysroot=C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/StudioProjects/GamePlay-deps/vorbis-1.3.4/lib/vorbisfile.c > CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.i

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.s"
	cd C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 && C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/llvm/prebuilt/windows-x86_64/bin/clang.exe --target=armv7-none-linux-androideabi --gcc-toolchain=C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64 --sysroot=C:/Users/gjp/AppData/Local/Android/Sdk/ndk-bundle/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/StudioProjects/GamePlay-deps/vorbis-1.3.4/lib/vorbisfile.c -o CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.s

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.requires:

.PHONY : vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.requires

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.provides: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.requires
	$(MAKE) -f vorbis-1.3.4/CMakeFiles/vorbisfile.dir/build.make vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.provides.build
.PHONY : vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.provides

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.provides.build: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o


# Object files for target vorbisfile
vorbisfile_OBJECTS = \
"CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o"

# External object files for target vorbisfile
vorbisfile_EXTERNAL_OBJECTS =

build/libvorbisfile.a: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o
build/libvorbisfile.a: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/build.make
build/libvorbisfile.a: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:/StudioProjects/GamePlay-deps/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../build/libvorbisfile.a"
	cd C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 && $(CMAKE_COMMAND) -P CMakeFiles/vorbisfile.dir/cmake_clean_target.cmake
	cd C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vorbisfile.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vorbis-1.3.4/CMakeFiles/vorbisfile.dir/build: build/libvorbisfile.a

.PHONY : vorbis-1.3.4/CMakeFiles/vorbisfile.dir/build

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/requires: vorbis-1.3.4/CMakeFiles/vorbisfile.dir/lib/vorbisfile.c.o.requires

.PHONY : vorbis-1.3.4/CMakeFiles/vorbisfile.dir/requires

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/clean:
	cd C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 && $(CMAKE_COMMAND) -P CMakeFiles/vorbisfile.dir/cmake_clean.cmake
.PHONY : vorbis-1.3.4/CMakeFiles/vorbisfile.dir/clean

vorbis-1.3.4/CMakeFiles/vorbisfile.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/StudioProjects/GamePlay-deps C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 C:/StudioProjects/GamePlay-deps C:/StudioProjects/GamePlay-deps/vorbis-1.3.4 C:/StudioProjects/GamePlay-deps/vorbis-1.3.4/CMakeFiles/vorbisfile.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vorbis-1.3.4/CMakeFiles/vorbisfile.dir/depend

