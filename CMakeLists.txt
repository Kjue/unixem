# cmake required
cmake_minimum_required(VERSION 2.8.8)

project(UNIXEM)

set(CMAKE_MODULE_PATH ${UNIXEM_SOURCE_DIR}/cmake)

#=====================================
# version of HA
#=====================================
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "9")
SET(CPACK_PACKAGE_VERSION_PATCH "1")
SET(CPACK_RPM_PACKAGE_RELEASE 0)    #release version.

SET(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")

#=====================================================
include_directories(include)
#=====================================================

#=====================================================
cmake_policy(SET CMP0015 NEW)
# .a .lib .so output
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${UNIXEM_BINARY_DIR}/lib")
link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
# bin / dll output
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${UNIXEM_BINARY_DIR}/bin")
#=====================================================

#========================================================
add_subdirectory(include)
add_subdirectory(src)
#========================================================

option(UNIT_TEST "exec unit test" OFF)
if (UNIT_TEST)
    enable_testing()
    add_subdirectory(test)
endif()
