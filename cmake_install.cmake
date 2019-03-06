# Install script for directory: C:/StudioProjects/GamePlay-deps

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/StudioProjects/GamePlay-deps/out/external-deps")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/StudioProjects/GamePlay-deps/libjson-7.6.1/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/tinyxml2-2.1.0/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/lua-5.2.3/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/freetype-2.4.5/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/openal-1.18.2/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/libiconv-1.15/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/zlib-1.2.8/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/png-1.6.15/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/ogg-1.3.2/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/vorbis-1.3.4/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/bullet-2.82-r2704/cmake_install.cmake")
  include("C:/StudioProjects/GamePlay-deps/base64-1.0.0/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/StudioProjects/GamePlay-deps/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
