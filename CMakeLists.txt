# https://cmake.org/cmake-tutorial/
cmake_minimum_required (VERSION 3.2)

# Use GNUInstallDirst to get canonical paths.
include (GNUInstallDirs)

# Define the project name belong their language.
# This top-leve project name can be refered exactly by
# ${CMAKE_PROJECT_NAME} -- any overwritten project name can be refered by
# ${PROJECT_NAME}.
project (lpn-example-bin CXX)

# Enable CTest environment
enable_testing()

# Add the example source directory.
add_subdirectory (src)
