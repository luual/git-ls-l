# Install script for directory: /home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/corgi/Work/git-ls-l/target/debug/build/libssh2-sys-c4765b00ae89bf13/out")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/libssh2" TYPE FILE FILES
    "/home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2/docs/AUTHORS"
    "/home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2/COPYING"
    "/home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2/docs/HACKING"
    "/home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2/README"
    "/home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2/RELEASE-NOTES"
    "/home/corgi/.cargo/registry/src/github.com-1ecc6299db9ec823/libssh2-sys-0.1.37/libssh2/NEWS"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/corgi/Work/git-ls-l/target/debug/build/libssh2-sys-c4765b00ae89bf13/out/build/src/cmake_install.cmake")
  include("/home/corgi/Work/git-ls-l/target/debug/build/libssh2-sys-c4765b00ae89bf13/out/build/docs/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/corgi/Work/git-ls-l/target/debug/build/libssh2-sys-c4765b00ae89bf13/out/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
